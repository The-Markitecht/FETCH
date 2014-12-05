`timescale 1 ns / 1 ns

// synthesize with SystemVerilog

module std_reg 
(
     input                       sysclk            
    ,input                       sysreset          

    ,output reg[15:0]            data_out
    ,input[15:0]                 data_in           
    ,input                       load
);      
    always @(posedge sysreset or posedge sysclk) begin
        if (sysreset)
            data_out <= 16'd0;
        else if (load)
            data_out <= data_in;
    end
endmodule

module synapse316 #(
    parameter IPR_WIDTH = 16,
    parameter IPR_TOP = IPR_WIDTH - 1,
    parameter NUM_REGS = 16,
    parameter TOP_REG = NUM_REGS - 1,
    parameter REGS_FLAT_WIDTH = NUM_REGS * 16,
    parameter NUM_DATA_INPUTS = 16,
    parameter TOP_DATA_INPUT = NUM_DATA_INPUTS - 1,
    parameter DATA_INPUT_FLAT_WIDTH = NUM_DATA_INPUTS * 16
) (
     input                       sysclk            
    ,input                       sysreset          

    ,output[IPR_TOP:0]           code_addr         
    ,input[15:0]                 code_in     
    ,input                       code_ready

    // i/o ports can run as a 2-dimensional in Quartus.  but that's a syntax error in Icarus, regardless of options.
    // so here it's flattened to 1 dimension.
    ,output[REGS_FLAT_WIDTH-1:0] r_flat
    ,output[TOP_REG:0]           r_load
    
    ,input[DATA_INPUT_FLAT_WIDTH-1:0]  data_in_flat
    
); 

    // declarations & wires
    wire[15:0] muxa_comb;    
    reg[15:0] exr; // executing instruction register
    
    // 316 instruction format:
    // [15:10] 6' muxa_dest_addr.
    // [9:0]  10' muxa_src_addr;  includes [7:0] 8' small constant.
    
    // future: eliminate setf/clrf.  instead map flags (and their set/clr operators) into register space.
    // split the carry flag into one for input, one for result.  assume the input one stays 0 usually.
    // set it to 1 only while subtracting.
    // implement multi-word add/subtract by copying the carry out flag to the carry in flag, between word adds.
    // that way i don't set/clr carry before EVERY operation.  and all tricky flag logic goes away.
    
    // instruction decoder.
    wire[5:0] muxa_dest_addr = exr[15:10];
    wire[9:0] muxa_src_addr = exr[9:0];
    wire[15:0] small_constant = {8'h0, exr[7:0]};
    wire[3:0] selected_flag_addr = muxa_src_addr[3:0];
    //reg code_ready_cycle = 1'b0;
    reg branching_cycle = 1'b0; // exr contains the wrong opcode on this cycle.  skip it.
    reg const16cycle1 = 1'b0; // exr registering inline data from program space on this cycle.  skip it.
    reg random_fetch_cycle1 = 1'b0; // exr stalled while code memory fetches data with random access.  hold exr's opcode until the next cycle for execution.  then the code memory is ready to replenish exr again.
    reg random_fetch_cycle2 = 1'b0; // exr stalled for 1 extra cycle after random_fetch_cycle1 coincided with const16cycle1, as often happens.  then exr contains the constant fetched during the const16cycle1, not a valid opcode.
    wire load_exr = code_ready && ! random_fetch_cycle1;
    wire enable_exec = code_ready && ! (const16cycle1 || branching_cycle || random_fetch_cycle1 || random_fetch_cycle2); 
    wire muxa_do_copy = enable_exec;    
    wire clrf_operator          = muxa_do_copy && (muxa_dest_addr == 6'h30);
    wire setf_operator          = muxa_do_copy && (muxa_dest_addr == 6'h31);
    wire random_fetch_operator  = muxa_do_copy && (muxa_dest_addr == 6'h34); // this indicates a 16-bit value should be read from the program with random access.
    wire br_operator            = muxa_do_copy && (muxa_dest_addr == 6'h38);
    wire bn_operator            = muxa_do_copy && (muxa_dest_addr == 6'h39);
    wire return_operator        = muxa_do_copy && (muxa_dest_addr == 6'h3f); // swaps ipr and return_addr.  this allows for subroutine call and return, as well as computed jump.
    wire binary_operator0 = r_load[0] || r_load[1];
    wire muxa_source_imm16 = muxa_do_copy && (muxa_src_addr == 10'h3a0);
    wire muxa_dest_return_addr = muxa_do_copy && (muxa_dest_addr == 6'h2f);

    // instruction pointer, executing instruction register, and more control logic.
    reg[IPR_TOP:0] ipr = 0;
    reg[IPR_TOP:0] return_addr = 0;
    reg[15:0] random_fetch_addr = 0; // this can temporarily override ipr to assert a different code_addr to the code memory.
    reg[15:0] random_fetch_result = 0;
    wire branch_accept;
    wire load_ipr = code_ready && branch_accept; 
    wire hold_ipr = random_fetch_cycle1 || ! code_ready;
    assign code_addr = random_fetch_cycle1 ? random_fetch_addr : ipr;
    wire[IPR_TOP:0] next_code_addr = ipr + {{IPR_TOP{1'b0}}, 1'd1};   
    always @(posedge sysreset or posedge sysclk) begin
        if (sysreset) begin
            ipr <= 0;
            exr <= 0;
            //code_ready_cycle <= 0;
            const16cycle1 <= 0;
            branching_cycle <= 0;
            random_fetch_cycle1 <= 0;
            random_fetch_cycle2 <= 0;
            random_fetch_addr <= 0;
            random_fetch_result <= 0;
        end else if (sysclk) begin
            if (load_ipr)
                ipr <= code_in;
            else if (return_operator)
                ipr <= return_addr;
            else if ( ! hold_ipr)
                ipr <= next_code_addr;  

            if (return_operator) 
                return_addr <= ipr;
            else if (muxa_dest_return_addr)
                return_addr <= muxa_comb;

            if (load_exr)
                exr <= code_in;
                
            if (random_fetch_cycle1)
                random_fetch_result <= code_in;
                
            if (random_fetch_operator)
                random_fetch_addr <= muxa_comb;
                
            const16cycle1 <= muxa_source_imm16 || (const16cycle1 && ! code_ready); // repeat the const16cycle1 as long as not code_ready.
            branching_cycle <= br_operator || bn_operator || return_operator || (branching_cycle && ! code_ready); // branching_cycle activates after every branch instruction, regardless of branch_accept, because in either case exr has been loaded with the branch target, not an opcode.
            random_fetch_cycle1 <= random_fetch_operator || (random_fetch_cycle1 && ! code_ready); // repeat this cycle if the code memory wasn't ready.
            random_fetch_cycle2 <= random_fetch_cycle1 && const16cycle1;
            //code_ready_cycle <= code_ready;
        end
    end    
    
    // register file r.  for operands, and general use.
    // registers r0 and r1 are the operands for ad0 and certain other binary operators.
    genvar i;
    generate  
        for (i=0; i < NUM_REGS; i=i+1) begin: regs
            wire[15:0] r;
            assign r_flat[i*16+15:i*16] = r;
            assign r_load[i] = muxa_do_copy && muxa_dest_addr == i;
            std_reg r_reg (sysclk, sysreset, r, muxa_comb, r_load[i]);
        end  
    endgenerate     
    
    // adder #0 with carry support
    reg[15:0] ad0; // result register
    wire[16:0] ad0_comb;
    reg ad0_carry_flag;
    reg ad0_zero_flag;
    wire ad0_zero_comb = ! ( | ad0_comb[15:0]);
    assign ad0_comb = {1'd0, regs[0].r} + {1'd0, regs[1].r} + {15'd0, ad0_carry_flag};
    wire ad0_carry_out_comb = ad0_comb[16];
    reg load_carry = 1'd0;
    always @(posedge sysreset or posedge sysclk) begin
        if (sysreset) begin
            ad0 <= 15'd0;
            ad0_zero_flag <= 1'b0;
            ad0_carry_flag <= 1'b0;
            load_carry <= 1'd0;
        end else if (sysclk) begin
            if (setf_operator)
                ad0_carry_flag <= ad0_carry_flag || muxa_comb[0];
            if (clrf_operator)
                ad0_carry_flag <= ad0_carry_flag && ! muxa_comb[0];
            else if (load_carry) begin
                ad0 <= ad0_comb[15:0];    
                ad0_zero_flag <= ad0_zero_comb;
                ad0_carry_flag <= ad0_carry_out_comb;
            end
            load_carry <= binary_operator0;
        end
    end

    // adder #1 with NO carry support.
    reg[15:0] ad1; // result register
    wire[15:0] ad1_comb = regs[2].r + regs[3].r;
    reg ad1_zero_flag;
    wire ad1_zero_comb = ! ( | ad1_comb[15:0]);
    always @(posedge sysreset or posedge sysclk) begin
        if (sysreset) begin
            ad1 <= 15'd0;
            ad1_zero_flag <= 1'b0;
        end else if (sysclk) begin
            ad1 <= ad1_comb;    
            ad1_zero_flag <= ad1_zero_comb;
        end
    end

    // adder #2 with NO carry support.
    reg[15:0] ad2; // result register
    wire[15:0] ad2_comb = regs[4].r + regs[5].r;
    reg ad2_zero_flag;
    wire ad2_zero_comb = ! ( | ad2_comb[15:0]);
    always @(posedge sysreset or posedge sysclk) begin
        if (sysreset) begin
            ad2 <= 15'd0;
            ad2_zero_flag <= 1'b0;
        end else if (sysclk) begin
            ad2 <= ad2_comb;    
            ad2_zero_flag <= ad2_zero_comb;
        end
    end

    // // 2's complement operator neg0
    // reg[15:0] neg0; // result register
    // wire[15:0] neg0_comb = ( ~ b[0] ) + 16'd1;
    // always @(sysreset or sysclk) begin
        // if (sysreset) begin
            // neg0 <= 0;
        // end else if (sysclk) begin
            // neg0 <= neg0_comb;    
        // end
    // end

    // bitwise operators and0, or0, xor0
    reg[15:0] and0; // result register
    wire[15:0] and0_comb = regs[0].r & regs[1].r;
    reg and0_zero_flag = 1'b0;
    reg[15:0] or0; // result register
    wire[15:0] or0_comb = regs[0].r | regs[1].r;
    reg[15:0] xor0; // result register
    wire[15:0] xor0_comb = regs[0].r ^ regs[1].r;
    always @(posedge sysreset or posedge sysclk) begin
        if (sysreset) begin
            and0 <= 0;
            and0_zero_flag <= 0;
            or0 <= 0;
            xor0 <= 0;
        end else if (sysclk) begin
            and0 <= and0_comb;    
            and0_zero_flag <= ! ( | and0_comb );
            or0 <= or0_comb;
            xor0 <= xor0_comb;
        end
    end

    // shifter unit
    wire[15:0] sh1l0 = {regs[0].r[14:0], 1'b0};
    wire[15:0] sh4l0 = {regs[0].r[11:0], 4'b0};  
    wire[15:0] sh1r0 = {1'b0, regs[0].r[15:1]};  
    wire[15:0] sh4r0 = {4'b0, regs[0].r[15:4]};
    
    // constants unit.
    wire[15:0] const_neg1 = 16'hffff;
    
    // branch unit
    wire[15:0] flags = {11'b1, ad0_zero_flag, ad0_carry_flag, and0_zero_flag, ad1_zero_flag, ad2_zero_flag};
    wire selected_flag = flags[selected_flag_addr];
    assign branch_accept = 
        br_operator ? selected_flag :
        bn_operator ? ! selected_flag :
        1'b0; // must be 0 can't be x.

    // external data input flattener.
    generate  
        for (i=0; i < NUM_DATA_INPUTS; i=i+1) begin: data_in
            wire[15:0] d = data_in_flat[i*16+15:i*16];
        end  
    endgenerate     
                
    // data muxer
    assign muxa_comb = 
        muxa_src_addr == 10'h00 ? regs[0].r :
        muxa_src_addr == 10'h01 ? regs[1].r :
        muxa_src_addr == 10'h02 ? regs[2].r :
        muxa_src_addr == 10'h03 ? regs[3].r :
        muxa_src_addr == 10'h04 ? regs[4].r :
        muxa_src_addr == 10'h05 ? regs[5].r :
        muxa_src_addr == 10'h06 ? regs[6].r :
        muxa_src_addr == 10'h07 ? regs[7].r :
        muxa_src_addr == 10'h08 ? regs[8].r :
        muxa_src_addr == 10'h09 ? regs[9].r :
        muxa_src_addr == 10'h0a ? regs[10].r :
        muxa_src_addr == 10'h0b ? regs[11].r :
        muxa_src_addr == 10'h0c ? regs[12].r :
        muxa_src_addr == 10'h0d ? regs[13].r :
        muxa_src_addr == 10'h0e ? regs[14].r :
        muxa_src_addr == 10'h0f ? regs[15].r :
        
        // the block 0x10 thru 0x3f is reserved for more registers.
        // most of those would be i/o rather than gp.  
        muxa_src_addr == 10'h2f ? return_addr :
        // note that 0x30 thru 0x3f IN THE DESTINATION SPACE contains control operators.
        // so for symmetry it would be best to avoid that region in source space as well.

        // the block 0x40 thru 0x1ff is reserved for i/o inputs.
        // so they're located above the 64 (0x40) possible destination addresses.
        // typically these would be used for devices that input data with no corresponding outputs.  like buttons.
        // or large blocks of "result" registers, e.g. FIR taps, or stack peeks, or lookup tables, or pre-masked bit fields.
        muxa_src_addr == 10'h40 ? data_in[0].d : 
        muxa_src_addr == 10'h41 ? data_in[1].d : 
        muxa_src_addr == 10'h42 ? data_in[2].d : 
        muxa_src_addr == 10'h43 ? data_in[3].d : 
        muxa_src_addr == 10'h44 ? data_in[4].d : 
        muxa_src_addr == 10'h45 ? data_in[5].d : 
        muxa_src_addr == 10'h46 ? data_in[6].d : 
        muxa_src_addr == 10'h47 ? data_in[7].d : 
        muxa_src_addr == 10'h48 ? data_in[8].d : 
        muxa_src_addr == 10'h49 ? data_in[9].d : 
        muxa_src_addr == 10'h4a ? data_in[10].d : 
        muxa_src_addr == 10'h4b ? data_in[11].d : 
        muxa_src_addr == 10'h4c ? data_in[12].d : 
        muxa_src_addr == 10'h4d ? data_in[13].d : 
        muxa_src_addr == 10'h4e ? data_in[14].d : 
        muxa_src_addr == 10'h4f ? data_in[15].d : 

        // the block 0x200 thru 0x2ff is reserved for small constant load operation.
        muxa_src_addr[9:8] == 2'h2 ? small_constant : 
        
        // the block 0x300 thru 0x3ff is reserved for result registers (read-only).
        // so they're located above the 64 (0x40) possible destination addresses.
        muxa_src_addr == 10'h300 ? ad0 : 
        muxa_src_addr == 10'h310 ? ad1 :
        muxa_src_addr == 10'h320 ? ad2 :
        
        muxa_src_addr == 10'h330 ? and0 :
        muxa_src_addr == 10'h334 ? or0 :
        muxa_src_addr == 10'h338 ? xor0 :
        
        muxa_src_addr == 10'h340 ? flags :
        
        muxa_src_addr == 10'h350 ? sh1r0 :
        muxa_src_addr == 10'h351 ? sh1l0 : 
        muxa_src_addr == 10'h352 ? sh4l0 : 
        muxa_src_addr == 10'h353 ? sh4r0 : 
        
        muxa_src_addr == 10'h360 ? const_neg1 :

        muxa_src_addr == 10'h3a0 ? code_in :  // this indicates a 16-bit immediate value should be read inline from the program on the next cycle.
            //patch: using code_in behind a 32-way muxer like this may reduce clock rate.  
            // may need a 2-cycle state machine instead, to implement constant loads.        

        muxa_src_addr == 10'h3b0 ? random_fetch_result :
            
        // there are many more spare addresses down here too
        16'hxxxx;
        
    
endmodule
