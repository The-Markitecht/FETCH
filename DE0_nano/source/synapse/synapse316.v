`include <header.v>
`include "target_program_defines.v"

// synthesize with SystemVerilog

module synapse316 #(
    // this module alone offers parameters instead of using the system-wide define's directly.
    // that allows for different dimensions of different instances.
     parameter IPR_WIDTH         = `IPR_WIDTH      
    ,parameter IPR_TOP           = IPR_WIDTH - 1       
    ,parameter NUM_REGS          = `NUM_REGS       
    ,parameter TOP_REG           = NUM_REGS - 1       
) (
     input wire                  sysclk            
    ,input wire                  sysreset          

    ,output wire[IPR_TOP:0]      code_addr         
    ,input wire[`WMSB:0]     code_in     
    ,input wire                  code_ready

    // signals for use only by a debugging supervisor.
    ,input wire[`DEBUG_IN_WIDTH-1:0]   debug_in // connect to 0 if supervisor not present.
    ,output wire[`DEBUG_OUT_WIDTH-1:0] debug_out // do not connect if supervisor not present.
    
    // register file, for any combination of general-purpose registers and i/o addressing.
    // these ports can run as a 2-dimensional in Quartus or ModelSim.  but that's a syntax error in Icarus, regardless of options.
    ,input  wire[`WMSB:0]         r[TOP_REG:0] // r[] and r_read[] are addressed by the SR_ number space.  that may vary from DR_.
    ,output wire[TOP_REG:0]           r_read    
    ,output wire[TOP_REG:0]           r_load   // r_load[] is addressed by the DR_ number space.  that may vary from SR_.
    ,output wire[`WMSB:0]         r_load_data  
); 
    // see Zim notes for Synapse316 MCU.

    // declarations & wires
    wire[`WMSB:0] muxa_comb;      
    reg[`WMSB:0] exr; // executing instruction register
        
    // debugger input flattener.
    wire debug_force_exec = debug_in[`DEBUG_FORCE_EXEC_BIT];
    wire debug_force_load_exr = debug_in[`DEBUG_FORCE_LOAD_EXR_BIT];
    wire debug_hold_state = debug_in[`DEBUG_FORCE_HOLD_STATE_BIT];
    wire[`WMSB:0] debug_poke_data = debug_in[`WMSB:0];
    
    // instruction decoder.
    wire[5:0] muxa_dest_addr = exr[`WMSB:`DEST_LSB];
    wire[9:0] muxa_src_addr = exr[`SRC_MSB:0];
    wire[`WMSB:0] small_constant = {8'h0, exr[7:0]};
    wire[3:0] selected_flag_addr = muxa_src_addr[3:0];
    //reg code_ready_cycle = 1'b0;
    reg branching_cycle = 1'b0; // exr contains the wrong opcode on this cycle.  skip it.
    reg const16cycle1 = 1'b0; // exr registering inline data from program space on this cycle.  skip it.
    reg random_fetch_cycle1 = 1'b0; // exr stalled while code memory fetches data with random access.  hold exr's opcode until the next cycle for execution.  then the code memory is ready to replenish exr again.
    reg random_fetch_cycle2 = 1'b0; // exr stalled for 1 extra cycle after random_fetch_cycle1 coincided with const16cycle1, as often happens.  then exr contains the constant fetched during the const16cycle1, not a valid opcode.
    wire load_exr = (code_ready && ! random_fetch_cycle1) || debug_force_load_exr;
    wire enable_exec = (code_ready && ! (const16cycle1 || branching_cycle 
        || random_fetch_cycle1 || random_fetch_cycle2 || debug_hold_state)) || debug_force_exec; 
    wire muxa_do_copy = enable_exec;    
    wire clrf_operator          = muxa_do_copy && (muxa_dest_addr == `DEST_WIDTH'h30);
    wire setf_operator          = muxa_do_copy && (muxa_dest_addr == `DEST_WIDTH'h31);
    //wire nop_operator           = muxa_do_copy && (muxa_dest_addr == `DEST_WIDTH'h32); // reserved address code.  data is discarded.  this destination is also used during supervisor peek.
    wire random_fetch_operator  = muxa_do_copy && (muxa_dest_addr == `DEST_WIDTH'h34); // this indicates a 16-bit value should be read from the program with random access.
    wire program_break_operator = muxa_do_copy && (muxa_dest_addr == `DEST_WIDTH'h35);
    wire br_operator            = muxa_do_copy && (muxa_dest_addr == `DEST_WIDTH'h38);
    wire bn_operator            = muxa_do_copy && (muxa_dest_addr == `DEST_WIDTH'h39);
    wire muxa_dest_return_addr  = muxa_do_copy && (muxa_dest_addr == `DEST_WIDTH'h3e);
    wire return_operator        = muxa_do_copy && (muxa_dest_addr == `DEST_WIDTH'h3f); // swaps ipr and return_addr.  this allows for subroutine call and return, as well as computed jump.
    wire muxa_source_imm16 = muxa_do_copy && (muxa_src_addr == `SRC_WIDTH'h3a0);
 
    // instruction pointer, executing instruction register, and more control logic.
    reg[IPR_TOP:0] ipr = 0;
    reg[IPR_TOP:0] return_addr = 0;
    reg[`WMSB:0] random_fetch_addr = 0; // this can temporarily override ipr to assert a different code_addr to the code memory.
    reg[`WMSB:0] random_fetch_result = 0;
    wire branch_accept;
    wire load_ipr = code_ready && branch_accept; 
    wire hold_ipr = random_fetch_cycle1 || ! code_ready;
    assign code_addr = random_fetch_cycle1 ? random_fetch_addr : ipr;
    wire[IPR_TOP:0] next_code_addr = ipr + {{IPR_TOP{1'b0}}, 1'd1};   
    always_ff @(posedge sysreset , posedge sysclk) begin
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

            if (load_exr)
                exr <= code_in;
                
            if ( ! debug_hold_state) begin
                // during debug_hold_state the ipr does not advance, nor do most of the control registers.
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
    end    
    
    // debugger output flattener.
    assign debug_out[`DEBUG_PRG_BREAK_OP_BIT    ] = program_break_operator;
    assign debug_out[`DEBUG_BRANCHING_CYCLE_BIT ] = branching_cycle;
    assign debug_out[`DEBUG_CONST16_CYCLE1_BIT  ] = const16cycle1;
    assign debug_out[`DEBUG_FETCH_CYCLE1_BIT    ] = random_fetch_cycle1;
    assign debug_out[`DEBUG_FETCH_CYCLE2_BIT    ] = random_fetch_cycle2;
    assign debug_out[`DEBUG_LOAD_EXR_BIT        ] = load_exr;
    assign debug_out[`DEBUG_ENABLE_EXEC_BIT     ] = enable_exec;
    
    // plumbing for register file r.  for operands, general use, and i/o.
    // registers r0 and r1 are the operands for ad0 and certain other binary operators.
    assign r_load_data = muxa_comb;
    wire[`WMSB:0] r_full[`MAX_NUM_REGS-1:0]; // a fully populated register space.  some portion of this will be fake registers, unconnected.
    genvar i;
    generate  
        for (i=0; i < NUM_REGS; i=i+1) begin: reg_ctrl_decoder
            assign r_load[i] = muxa_do_copy && (muxa_dest_addr == i);
            assign r_read[i] = muxa_do_copy && (muxa_src_addr == i);
            assign r_full[i] = r[i];
        end  
        for (i=NUM_REGS; i < `MAX_NUM_REGS; i=i+1) begin: fake_reg
            assign r_full[i] = `WW'hxxxx;
        end  
    endgenerate     
    
    // adder #0 with carry support
    reg[`WMSB:0] ad0; // result register
    wire[`WW:0] ad0_comb;
    reg ad0_cout_flag = 0;
    reg ad0_cin_flag = 0;
    assign ad0_comb = {1'd0, r_full[0]} + {1'd0, r_full[1]} + {`WMSB'd0, ad0_cin_flag};
    wire ad0_cout_comb = ad0_comb[`WW];
    always_ff @(posedge sysreset , posedge sysclk) begin
        if (sysreset) begin
            ad0 <= 0;
            ad0_cin_flag <= 0;
            ad0_cout_flag <= 0;
        end else if (sysclk) begin
            if (setf_operator)
                ad0_cin_flag <= ad0_cin_flag || muxa_comb[0];
            if (clrf_operator)
                ad0_cin_flag <= ad0_cin_flag && ! muxa_comb[0];
            ad0 <= ad0_comb[`WMSB:0];    
            ad0_cout_flag <= ad0_cout_comb;
        end
    end

    // adder #1 with NO carry support.
    reg[`WMSB:0] ad1; // result register
    wire[`WMSB:0] ad1_comb = r_full[2] + r_full[3];
    always_ff @(posedge sysreset , posedge sysclk) begin
        if (sysreset) begin
            ad1 <= 0;
        end else if (sysclk) begin
            ad1 <= ad1_comb;    
        end
    end

    // adder #2 with NO carry support.
    reg[`WMSB:0] ad2; // result register
    wire[`WMSB:0] ad2_comb = r_full[4] + r_full[5];
    always_ff @(posedge sysreset , posedge sysclk) begin
        if (sysreset) begin
            ad2 <= 0;
        end else if (sysclk) begin
            ad2 <= ad2_comb;    
        end
    end

    // // 2's complement operator neg0
    // reg[`WMSB:0] neg0 = 0; // result register
    // wire[`WMSB:0] neg0_comb = ( ~ b[0] ) + `WW'd1;
    // always_ff @(sysreset or sysclk) begin
        // if (sysreset) begin
            // neg0 <= 0;
        // end else if (sysclk) begin
            // neg0 <= neg0_comb;    
        // end
    // end

    // bitwise operators and0, or0, xor0
    reg[`WMSB:0] and0 = 0; // result register
    wire[`WMSB:0] and0_comb = r_full[0] & r_full[1];
    reg[`WMSB:0] or0 = 0; // result register
    wire[`WMSB:0] or0_comb = r_full[0] | r_full[1];
    reg[`WMSB:0] xor0 = 0; // result register
    wire[`WMSB:0] xor0_comb = r_full[0] ^ r_full[1];
    always_ff @(posedge sysreset , posedge sysclk) begin
        if (sysreset) begin
            and0 <= 0;
            or0 <= 0;
            xor0 <= 0;
        end else if (sysclk) begin
            and0 <= and0_comb;    
            or0 <= or0_comb;
            xor0 <= xor0_comb;
        end
    end

    // comparator unit
    wire eq0_comb = r_full[0] == r_full[1];
    wire gt0_comb = r_full[0] > r_full[1];
    wire lt0_comb = ! (eq0_comb || gt0_comb);
    wire z0_comb = ! ( | r_full[0]); // only 3 z flags instead of all 6, to save over 50 LE's !!  no idea why those were so big...
    wire z2_comb = ! ( | r_full[2]); 
    wire z4_comb = ! ( | r_full[4]); 
    wire and0_zero_comb = ! ( | and0_comb );
    
    // shifter unit
    wire[`WMSB:0] rf0 = r_full[0];
    wire[`WMSB:0] sh1l0 = {rf0[14:0], 1'b0};
    wire[`WMSB:0] sh4l0 = {rf0[11:0], 4'b0};  
    wire[`WMSB:0] sh1r0 = {1'b0, rf0[`WMSB:1]};  
    wire[`WMSB:0] sh4r0 = {4'b0, rf0[`WMSB:4]};
    
    // constants unit.
    wire[`WMSB:0] const_neg1 = `WW'hffff;
    
    // branch unit
    wire[`WMSB:0] flags = { {8{1'b1}}, eq0_comb, gt0_comb, lt0_comb, ad0_cout_flag, and0_zero_comb, z4_comb, z2_comb, z0_comb};
    wire selected_flag = flags[selected_flag_addr];
    assign branch_accept = 
        br_operator ? selected_flag :
        bn_operator ? ! selected_flag :
        1'b0; // must be 0 can't be x.

    // data muxer
    assign muxa_comb = 
        // register file.
        muxa_src_addr == `SRC_WIDTH'h00 ? r_full[0] :
        muxa_src_addr == `SRC_WIDTH'h01 ? r_full[1] :
        muxa_src_addr == `SRC_WIDTH'h02 ? r_full[2] :
        muxa_src_addr == `SRC_WIDTH'h03 ? r_full[3] :
        muxa_src_addr == `SRC_WIDTH'h04 ? r_full[4] :
        muxa_src_addr == `SRC_WIDTH'h05 ? r_full[5] :
        muxa_src_addr == `SRC_WIDTH'h06 ? r_full[6] :
        muxa_src_addr == `SRC_WIDTH'h07 ? r_full[7] :
        muxa_src_addr == `SRC_WIDTH'h08 ? r_full[8] :
        muxa_src_addr == `SRC_WIDTH'h09 ? r_full[9] :
        muxa_src_addr == `SRC_WIDTH'h0a ? r_full[10] :
        muxa_src_addr == `SRC_WIDTH'h0b ? r_full[11] :
        muxa_src_addr == `SRC_WIDTH'h0c ? r_full[12] :
        muxa_src_addr == `SRC_WIDTH'h0d ? r_full[13] :
        muxa_src_addr == `SRC_WIDTH'h0e ? r_full[14] :
        muxa_src_addr == `SRC_WIDTH'h0f ? r_full[15] :
        muxa_src_addr == `SRC_WIDTH'h10 ? r_full[16] :
        muxa_src_addr == `SRC_WIDTH'h11 ? r_full[17] :
        muxa_src_addr == `SRC_WIDTH'h12 ? r_full[18] :
        muxa_src_addr == `SRC_WIDTH'h13 ? r_full[19] :
        muxa_src_addr == `SRC_WIDTH'h14 ? r_full[20] :
        muxa_src_addr == `SRC_WIDTH'h15 ? r_full[21] :
        muxa_src_addr == `SRC_WIDTH'h16 ? r_full[22] :
        muxa_src_addr == `SRC_WIDTH'h17 ? r_full[23] :
        muxa_src_addr == `SRC_WIDTH'h18 ? r_full[24] :
        muxa_src_addr == `SRC_WIDTH'h19 ? r_full[25] :
        muxa_src_addr == `SRC_WIDTH'h1a ? r_full[26] :
        muxa_src_addr == `SRC_WIDTH'h1b ? r_full[27] :
        muxa_src_addr == `SRC_WIDTH'h1c ? r_full[28] :
        muxa_src_addr == `SRC_WIDTH'h1d ? r_full[29] :
        muxa_src_addr == `SRC_WIDTH'h1e ? r_full[30] :
        muxa_src_addr == `SRC_WIDTH'h1f ? r_full[31] :
        muxa_src_addr == `SRC_WIDTH'h20 ? r_full[32] :
        muxa_src_addr == `SRC_WIDTH'h21 ? r_full[33] :
        muxa_src_addr == `SRC_WIDTH'h22 ? r_full[34] :
        muxa_src_addr == `SRC_WIDTH'h23 ? r_full[35] :
        muxa_src_addr == `SRC_WIDTH'h24 ? r_full[36] :
        muxa_src_addr == `SRC_WIDTH'h25 ? r_full[37] :
        muxa_src_addr == `SRC_WIDTH'h26 ? r_full[38] :
        muxa_src_addr == `SRC_WIDTH'h27 ? r_full[39] :
        muxa_src_addr == `SRC_WIDTH'h28 ? r_full[40] :
        muxa_src_addr == `SRC_WIDTH'h29 ? r_full[41] :
        muxa_src_addr == `SRC_WIDTH'h2a ? r_full[42] :
        muxa_src_addr == `SRC_WIDTH'h2b ? r_full[43] :
        muxa_src_addr == `SRC_WIDTH'h2c ? r_full[44] :
        muxa_src_addr == `SRC_WIDTH'h2d ? r_full[45] :
        muxa_src_addr == `SRC_WIDTH'h2e ? r_full[46] :
        muxa_src_addr == `SRC_WIDTH'h2f ? r_full[47] :
                             
        // note that 0x30 thru 0x3f IN THE DESTINATION SPACE contains control operators.
        // so for symmetry it would be best to avoid that region in source space as well.
        muxa_src_addr == `SRC_WIDTH'h3e ? return_addr :

        // the block 0x40 thru 0x1ff is reserved for i/o inputs.
        // so they're located above the 64 (0x40) possible destination addresses.
        // typically these would be used for devices that input data with no corresponding outputs.  like buttons.
        // or large blocks of "result" registers, e.g. FIR taps, or stack peeks, or lookup tables, or pre-masked bit fields.

        // the block 0x200 thru 0x2ff is reserved for small constant load operation.
        muxa_src_addr[9:8] == 2'h2 ? small_constant : 
        
        // the block 0x300 thru 0x3ff is reserved for result registers (read-only).
        // so they're located above the 64 (0x40) possible destination addresses.
        muxa_src_addr == `SRC_WIDTH'h300 ? ad0 : 
        muxa_src_addr == `SRC_WIDTH'h310 ? ad1 :
        muxa_src_addr == `SRC_WIDTH'h320 ? ad2 :
        
        muxa_src_addr == `SRC_WIDTH'h330 ? and0 :
        muxa_src_addr == `SRC_WIDTH'h334 ? or0 :
        muxa_src_addr == `SRC_WIDTH'h338 ? xor0 :
        
//        muxa_src_addr == `SRC_WIDTH'h340 ? flags : // this is never used, and it costs 20 LE's and 2 Mhz.
        
        muxa_src_addr == `SRC_WIDTH'h350 ? sh1r0 :
        muxa_src_addr == `SRC_WIDTH'h351 ? sh1l0 : 
        muxa_src_addr == `SRC_WIDTH'h352 ? sh4l0 : 
        muxa_src_addr == `SRC_WIDTH'h353 ? sh4r0 : 
        
        muxa_src_addr == `SRC_WIDTH'h360 ? const_neg1 :

        muxa_src_addr == `SRC_WIDTH'h3a0 ? code_in :  // this indicates a 16-bit immediate value should be read inline from the program on the next cycle.
            //patch: using code_in behind a 32-way muxer like this may reduce clock rate.  
            // may need a 2-cycle state machine instead, to implement constant loads.        

        muxa_src_addr == `SRC_WIDTH'h3b0 ? random_fetch_result :
        
        muxa_src_addr == `SRC_WIDTH'h3c0 ? debug_poke_data :
            
        // there are many more spare addresses down here too
        `WW'hxxxx;
        
    
endmodule
