`include "header.v"

// synthesize with SystemVerilog

interface clock_ifc();
	wire clk;
	wire reset;
	modport m(output clk, output reset); // master
	modport s(input clk, input reset); // slave
endinterface

interface code_ifc #(parameter ADDR_WIDTH=16) ();	
	wire[ADDR_WIDTH-1:0] addr;
	wire[15:0] content;
	wire code_ready;
	modport m(output addr, input content, input code_ready); // master
	modport s(input addr, output content, output code_ready); // slave
endinterface

interface reg_ifc #(parameter WIDTH=16) ();
	wire[WIDTH-1:0] d;
	wire load;
	wire[WIDTH-1:0] q;
	wire read;
	modport m(output d, load, read, input q); 
	modport s(input d, load, read, output q); 
    assign m.d = s.d;
patch: need a whole bunch of these assignments??  and switch m & s on all ifc's??    
endinterface

interface debug_ifc ();
    wire hold_state;
    wire force_load_exr;
    wire force_exec;
    wire branching_cycle, const16cycle1, random_fetch_cycle1, 
        random_fetch_cycle2, load_exr, enable_exec;
	modport m(output hold_state, force_load_exr, force_exec, 
        input branching_cycle, const16cycle1, random_fetch_cycle1, 
        random_fetch_cycle2, load_exr, enable_exec); 
	modport s(input hold_state, force_load_exr, force_exec, 
        output branching_cycle, const16cycle1, random_fetch_cycle1, 
        random_fetch_cycle2, load_exr, enable_exec); 
endinterface

interface avalon_mm_ifc #(AWIDTH=16, DWIDTH=16) ();
    wire[AWIDTH-1:0] address;
    wire             waitrequest;
    wire[DWIDTH-1:0] writedata;
    wire             write;
	modport m(output address, writedata, write,
        input waitrequest);
	modport s(input address, writedata, write,
        output waitrequest);
endinterface

module std_reg #(
    parameter WIDTH = 16
) (
    clock_ifc.s         clk
    ,reg_ifc.s           r
);      
    reg[WIDTH-1:0] content = 0;
    assign r.q = content;
    always_ff @(posedge clk.reset or posedge clk.clk) begin
        if (clk.reset)
            content <= 0;
        else if (r.load)
            content <= r.d;
    end
endmodule

module narrow_reg #(
    parameter WIDTH = 16
) (
    clock_ifc.s         clk
    ,reg_ifc.s           r
);      
    localparam FAKES=16-WIDTH;
    reg[WIDTH-1:0] content = 0;
    assign r.q = { {FAKES{1'b0}}, content};
    always_ff @(posedge clk.reset or posedge clk.clk) begin
        if (clk.reset)
            content <= 0;
        else if (r.load)
            content <= r.d[WIDTH-1:0];
    end
endmodule

// module reg_passthru (
    // // see how these are reversed.  always connect rm to a reg_ifc.s, and connect rs to a reg_ifc.m.
    // reg_ifc.m            rm
    // ,reg_ifc.s           rs
// );      
    // assign rs.d = rm.d;
    // assign rs.load = rm.load;
    // assign rs.read = rm.read;
    // assign rm.q = rs.q;
// endmodule

module junk316 (
    clock_ifc.s         clk
    ,reg_ifc.m          kr
    ,reg_ifc.m          lr
); 
    always_ff @(posedge clk.clk) begin
        lr.d <= lr.q + kr.q;
    end
    assign lr.load = 1;
endmodule

module synapse316 #(
    // this module alone offers parameters instead of using the system-wide define's directly.
    // that allows for different dimensions of different instances.
     parameter IPR_WIDTH         = `IPR_WIDTH      
    ,parameter IPR_TOP           = IPR_WIDTH - 1       
    ,parameter NUM_REGS          = `NUM_REGS       
    ,parameter TOP_REG           = NUM_REGS - 1       
) (
    clock_ifc.s         clk
    ,code_ifc.m         code
    
    // signals for use only by a debugging supervisor.
    // if supervisor not present, connect inputs to 0 and outputs dangle.
    ,debug_ifc.s        debug
    
    // register file, for any combination of general-purpose registers and i/o addressing.
    // these ports can run as a 2-dimensional in Quartus or ModelSim.  but that's a syntax error in Icarus, regardless of options.
    ,reg_ifc.m          r[TOP_REG:0]
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
    wire load_exr = (code.code_ready && ! random_fetch_cycle1) || debug.force_load_exr;
    wire enable_exec = (code.code_ready && ! (const16cycle1 || branching_cycle 
        || random_fetch_cycle1 || random_fetch_cycle2 || debug.hold_state)) || debug.force_exec; 
    wire muxa_do_copy = enable_exec;    
    wire clrf_operator          = muxa_do_copy && (muxa_dest_addr == 6'h30);
    wire setf_operator          = muxa_do_copy && (muxa_dest_addr == 6'h31);
    wire random_fetch_operator  = muxa_do_copy && (muxa_dest_addr == 6'h34); // this indicates a 16-bit value should be read from the program with random access.
    wire br_operator            = muxa_do_copy && (muxa_dest_addr == 6'h38);
    wire bn_operator            = muxa_do_copy && (muxa_dest_addr == 6'h39);
    wire muxa_dest_return_addr  = muxa_do_copy && (muxa_dest_addr == 6'h3e);
    wire return_operator        = muxa_do_copy && (muxa_dest_addr == 6'h3f); // swaps ipr and return_addr.  this allows for subroutine call and return, as well as computed jump.
    wire binary_operator0 = r[0].load || r[1].load;
    wire muxa_source_imm16 = muxa_do_copy && (muxa_src_addr == 10'h3a0);
 
    // instruction pointer, executing instruction register, and more control logic.
    reg[IPR_TOP:0] ipr = 0;
    reg[IPR_TOP:0] return_addr = 0;
    reg[15:0] random_fetch_addr = 0; // this can temporarily override ipr to assert a different code_addr to the code memory.
    reg[15:0] random_fetch_result = 0;
    wire branch_accept;
    wire load_ipr = code.code_ready && branch_accept; 
    wire hold_ipr = random_fetch_cycle1 || ! code.code_ready;
    assign code.addr = random_fetch_cycle1 ? random_fetch_addr : ipr;
    wire[IPR_TOP:0] next_code_addr = ipr + {{IPR_TOP{1'b0}}, 1'd1};   
    always_ff @(posedge clk.reset or posedge clk.clk) begin
        if (clk.reset) begin
            ipr <= 0;
            exr <= 0;
            //code_ready_cycle <= 0;
            const16cycle1 <= 0;
            branching_cycle <= 0;
            random_fetch_cycle1 <= 0;
            random_fetch_cycle2 <= 0;
            random_fetch_addr <= 0;
            random_fetch_result <= 0;
        end else if (clk.clk) begin

            if (load_exr)
                exr <= code.content;
                
            if ( ! debug.hold_state) begin
                // during debug_hold the ipr does not advance, nor do most of the control registers.
                if (load_ipr)
                    ipr <= code.content;
                else if (return_operator)
                    ipr <= return_addr;
                else if ( ! hold_ipr)
                    ipr <= next_code_addr;  
                    
                if (return_operator) 
                    return_addr <= ipr;
                else if (muxa_dest_return_addr)
                    return_addr <= muxa_comb;
                    
                if (random_fetch_cycle1)
                    random_fetch_result <= code.content;
                    
                if (random_fetch_operator)
                    random_fetch_addr <= muxa_comb;
                    
                const16cycle1 <= muxa_source_imm16 || (const16cycle1 && ! code.code_ready); // repeat the const16cycle1 as long as not code_ready.
                branching_cycle <= br_operator || bn_operator || return_operator || (branching_cycle && ! code.code_ready); // branching_cycle activates after every branch instruction, regardless of branch_accept, because in either case exr has been loaded with the branch target, not an opcode.
                random_fetch_cycle1 <= random_fetch_operator || (random_fetch_cycle1 && ! code.code_ready); // repeat this cycle if the code memory wasn't ready.
                random_fetch_cycle2 <= random_fetch_cycle1 && const16cycle1;
                //code_ready_cycle <= code.code_ready;
            end            
        end
    end    

    // debugger plumbing.
    assign debug.branching_cycle = branching_cycle;
    assign debug.const16cycle1 = const16cycle1;
    assign debug.random_fetch_cycle1 = random_fetch_cycle1;
    assign debug.random_fetch_cycle2 = random_fetch_cycle2;
    assign debug.load_exr = load_exr;
    assign debug.enable_exec = enable_exec;
    
    // plumbing for register file r.  for operands, general use, and i/o.
    // registers r0 and r1 are the operands for ad0 and certain other binary operators.
    wire[15:0] r_full[`MAX_NUM_REGS-1:0]; // a fully populated register space.  some portion of this will be fake registers, unconnected.
    genvar i;
    generate  
        for (i=0; i < NUM_REGS; i=i+1) begin: reg_ctrl_decoder
            assign r[i].d = muxa_comb;
            assign r[i].load = muxa_do_copy && (muxa_dest_addr == i);
            assign r[i].read = muxa_do_copy && (muxa_src_addr == i);
            assign r_full[i] = r[i].q;
        end  
        for (i=NUM_REGS; i < `MAX_NUM_REGS; i=i+1) begin: fake_reg
            assign r_full[i] = 16'hxxxx;
        end  
    endgenerate     
    
    // adder #0 with carry support
    reg[15:0] ad0; // result register
    wire[16:0] ad0_comb;
    reg ad0_carry_flag;
    reg ad0_zero_flag;
    wire ad0_zero_comb = ! ( | ad0_comb[15:0]);
    assign ad0_comb = {1'd0, r_full[0]} + {1'd0, r_full[1]} + {15'd0, ad0_carry_flag};
    wire ad0_carry_out_comb = ad0_comb[16];
    reg load_carry = 1'd0;
    always_ff @(posedge clk.reset or posedge clk.clk) begin
        if (clk.reset) begin
            ad0 <= 15'd0;
            ad0_zero_flag <= 1'b0;
            ad0_carry_flag <= 1'b0;
            load_carry <= 1'd0;
        end else if (clk.clk) begin
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
    wire[15:0] ad1_comb = r_full[2] + r_full[3];
    reg ad1_zero_flag;
    wire ad1_zero_comb = ! ( | ad1_comb[15:0]);
    always_ff @(posedge clk.reset or posedge clk.clk) begin
        if (clk.reset) begin
            ad1 <= 15'd0;
            ad1_zero_flag <= 1'b0;
        end else if (clk.clk) begin
            ad1 <= ad1_comb;    
            ad1_zero_flag <= ad1_zero_comb;
        end
    end

    // adder #2 with NO carry support.
    reg[15:0] ad2; // result register
    wire[15:0] ad2_comb = r_full[4] + r_full[5];
    reg ad2_zero_flag;
    wire ad2_zero_comb = ! ( | ad2_comb[15:0]);
    always_ff @(posedge clk.reset or posedge clk.clk) begin
        if (clk.reset) begin
            ad2 <= 15'd0;
            ad2_zero_flag <= 1'b0;
        end else if (clk.clk) begin
            ad2 <= ad2_comb;    
            ad2_zero_flag <= ad2_zero_comb;
        end
    end

    // // 2's complement operator neg0
    // reg[15:0] neg0; // result register
    // wire[15:0] neg0_comb = ( ~ b[0] ) + 16'd1;
    // always_ff @(clk.reset or clk.clk) begin
        // if (clk.reset) begin
            // neg0 <= 0;
        // end else if (clk.clk) begin
            // neg0 <= neg0_comb;    
        // end
    // end

    // bitwise operators and0, or0, xor0
    reg[15:0] and0; // result register
    wire[15:0] and0_comb = r_full[0] & r_full[1];
    reg and0_zero_flag = 1'b0;
    reg[15:0] or0; // result register
    wire[15:0] or0_comb = r_full[0] | r_full[1];
    reg[15:0] xor0; // result register
    wire[15:0] xor0_comb = r_full[0] ^ r_full[1];
    always_ff @(posedge clk.reset or posedge clk.clk) begin
        if (clk.reset) begin
            and0 <= 0;
            and0_zero_flag <= 0;
            or0 <= 0;
            xor0 <= 0;
        end else if (clk.clk) begin
            and0 <= and0_comb;    
            and0_zero_flag <= ! ( | and0_comb );
            or0 <= or0_comb;
            xor0 <= xor0_comb;
        end
    end

    // shifter unit
    wire[15:0] rf0 = r_full[0];
    wire[15:0] sh1l0 = {rf0[14:0], 1'b0};
    wire[15:0] sh4l0 = {rf0[11:0], 4'b0};  
    wire[15:0] sh1r0 = {1'b0, rf0[15:1]};  
    wire[15:0] sh4r0 = {4'b0, rf0[15:4]};
    
    // constants unit.
    wire[15:0] const_neg1 = 16'hffff;
    
    // branch unit
    wire[15:0] flags = {11'b1, ad0_zero_flag, ad0_carry_flag, and0_zero_flag, ad1_zero_flag, ad2_zero_flag};
    wire selected_flag = flags[selected_flag_addr];
    assign branch_accept = 
        br_operator ? selected_flag :
        bn_operator ? ! selected_flag :
        1'b0; // must be 0 can't be x.

    // data muxer
    assign muxa_comb = 
        // register file.
        muxa_src_addr == 10'h00 ? r_full[0] :
        muxa_src_addr == 10'h01 ? r_full[1] :
        muxa_src_addr == 10'h02 ? r_full[2] :
        muxa_src_addr == 10'h03 ? r_full[3] :
        muxa_src_addr == 10'h04 ? r_full[4] :
        muxa_src_addr == 10'h05 ? r_full[5] :
        muxa_src_addr == 10'h06 ? r_full[6] :
        muxa_src_addr == 10'h07 ? r_full[7] :
        muxa_src_addr == 10'h08 ? r_full[8] :
        muxa_src_addr == 10'h09 ? r_full[9] :
        muxa_src_addr == 10'h0a ? r_full[10] :
        muxa_src_addr == 10'h0b ? r_full[11] :
        muxa_src_addr == 10'h0c ? r_full[12] :
        muxa_src_addr == 10'h0d ? r_full[13] :
        muxa_src_addr == 10'h0e ? r_full[14] :
        muxa_src_addr == 10'h0f ? r_full[15] :
        muxa_src_addr == 10'h10 ? r_full[16] :
        muxa_src_addr == 10'h11 ? r_full[17] :
        muxa_src_addr == 10'h12 ? r_full[18] :
        muxa_src_addr == 10'h13 ? r_full[19] :
        muxa_src_addr == 10'h14 ? r_full[20] :
        muxa_src_addr == 10'h15 ? r_full[21] :
        muxa_src_addr == 10'h16 ? r_full[22] :
        muxa_src_addr == 10'h17 ? r_full[23] :
        muxa_src_addr == 10'h18 ? r_full[24] :
        muxa_src_addr == 10'h19 ? r_full[25] :
        muxa_src_addr == 10'h1a ? r_full[26] :
        muxa_src_addr == 10'h1b ? r_full[27] :
        muxa_src_addr == 10'h1c ? r_full[28] :
        muxa_src_addr == 10'h1d ? r_full[29] :
        muxa_src_addr == 10'h1e ? r_full[30] :
        muxa_src_addr == 10'h1f ? r_full[31] :
        muxa_src_addr == 10'h20 ? r_full[32] :
        muxa_src_addr == 10'h21 ? r_full[33] :
        muxa_src_addr == 10'h22 ? r_full[34] :
        muxa_src_addr == 10'h23 ? r_full[35] :
        muxa_src_addr == 10'h24 ? r_full[36] :
        muxa_src_addr == 10'h25 ? r_full[37] :
        muxa_src_addr == 10'h26 ? r_full[38] :
        muxa_src_addr == 10'h27 ? r_full[39] :
        muxa_src_addr == 10'h28 ? r_full[40] :
        muxa_src_addr == 10'h29 ? r_full[41] :
        muxa_src_addr == 10'h2a ? r_full[42] :
        muxa_src_addr == 10'h2b ? r_full[43] :
        muxa_src_addr == 10'h2c ? r_full[44] :
        muxa_src_addr == 10'h2d ? r_full[45] :
        muxa_src_addr == 10'h2e ? r_full[46] :
        muxa_src_addr == 10'h2f ? r_full[47] :
                             
        // note that 0x30 thru 0x3f IN THE DESTINATION SPACE contains control operators.
        // so for symmetry it would be best to avoid that region in source space as well.
        muxa_src_addr == 10'h3e ? return_addr :

        // the block 0x40 thru 0x1ff is reserved for i/o inputs.
        // so they're located above the 64 (0x40) possible destination addresses.
        // typically these would be used for devices that input data with no corresponding outputs.  like buttons.
        // or large blocks of "result" registers, e.g. FIR taps, or stack peeks, or lookup tables, or pre-masked bit fields.

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

        muxa_src_addr == 10'h3a0 ? code.content :  // this indicates a 16-bit immediate value should be read inline from the program on the next cycle.
            //patch: using code_in behind a 32-way muxer like this may reduce clock rate.  
            // may need a 2-cycle state machine instead, to implement constant loads.        

        muxa_src_addr == 10'h3b0 ? random_fetch_result :
            
        // there are many more spare addresses down here too
        16'hxxxx;
        
    
endmodule
