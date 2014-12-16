
        `include "header.v"

        module visor_program (
            input[15:0] addr
            ,output[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.
// for debugging supervisor mcu.

// register file configuration

// application-specific register aliases.
//alias_src  tg_debug_out	    [incr counter]

// equivalent of convention_gpx

// :begin // = 0x0000
// put target into reset.
addr == 16'h00 ? 16'h3a02 :  // <0042> bus_ctrl = $tg_reset_mask

// init visor.
addr == 16'h01 ? 16'h2f60 :  // <0045> bp3_addr = $bp_disable
addr == 16'h02 ? 16'h2b60 :  // <0046> bp2_addr = $bp_disable
addr == 16'h03 ? 16'h2760 :  // <0047> bp1_addr = $bp_disable
addr == 16'h04 ? 16'h2360 :  // <0048> bp0_addr = $bp_disable

// release target reset, to run.
addr == 16'h05 ? 16'h3a00 :  // <0051> bus_ctrl = 0

// :halt // = 0x0006
addr == 16'h06 ? 16'he005 :  // <0054> jmp :halt
addr == 16'h07 ? 16'h0006 :  // <0054> jmp :halt

// set a breakpoint, wait til it hits.
addr == 16'h08 ? 16'h2215 :  // <0057> bp0_addr = 0x15
// :wait_for_bp // = 0x0009
addr == 16'h09 ? 16'h0200 :  // <0059> a = 0
addr == 16'h0a ? 16'h0413 :  // <0060> b = bp_status
addr == 16'h0b ? 16'hc800 :  // <0061> nop
addr == 16'h0c ? 16'he004 :  // <0062> br z :wait_for_bp
addr == 16'h0d ? 16'h0009 :  // <0062> br z :wait_for_bp

// observe a register.
addr == 16'h0e ? 16'h3a04 :  // <0065> bus_ctrl = $divert_code_bus_mask
addr == 16'h0f ? 16'h3e01 :  // <0066> tg_force = $hold_state_mask
addr == 16'h10 ? 16'hd223 :  // <0067> fetch force_opcode from ([label observe] + 7)
addr == 16'h11 ? 16'h33b0 :  // <0067> fetch force_opcode from ([label observe] + 7)
addr == 16'h12 ? 16'h3e03 :  // <0068> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h13 ? 16'h3e05 :  // <0069> tg_force = ($hold_state_mask | $force_exec_mask)
addr == 16'h14 ? 16'h3e01 :  // <0070> tg_force = $hold_state_mask
// target's r7 value is now in peek_data.

// refill target exr so it can resume seamlessly.
addr == 16'h15 ? 16'h3010 :  // <0074> force_opcode = exr_shadow
addr == 16'h16 ? 16'h3e03 :  // <0075> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h17 ? 16'h3e00 :  // <0076> tg_force = 0
addr == 16'h18 ? 16'h3a00 :  // <0077> bus_ctrl = 0

// release target to pass breakpoint once.
addr == 16'h19 ? 16'h2008 :  // <0080> bp0_addr = bp0_addr

addr == 16'h1a ? 16'he005 :  // <0082> jmp :wait_for_bp
addr == 16'h1b ? 16'h0009 :  // <0082> jmp :wait_for_bp

// :observe // = 0x001c
// these instructions are assembled in the visor program, but passed to the target to execute.
addr == 16'h1c ? 16'h7c00 :  // <0087> debug_peek_reg = r0
addr == 16'h1d ? 16'h7c01 :  // <0088> debug_peek_reg = r1
addr == 16'h1e ? 16'h7c02 :  // <0089> debug_peek_reg = r2
addr == 16'h1f ? 16'h7c03 :  // <0090> debug_peek_reg = r3
addr == 16'h20 ? 16'h7c04 :  // <0091> debug_peek_reg = r4
addr == 16'h21 ? 16'h7c05 :  // <0092> debug_peek_reg = r5
addr == 16'h22 ? 16'h7c06 :  // <0093> debug_peek_reg = r6
addr == 16'h23 ? 16'h7c07 :  // <0094> debug_peek_reg = r7
addr == 16'h24 ? 16'h7c08 :  // <0095> debug_peek_reg = r8
addr == 16'h25 ? 16'h7c09 :  // <0096> debug_peek_reg = r9
addr == 16'h26 ? 16'h7c0a :  // <0097> debug_peek_reg = r10
addr == 16'h27 ? 16'h7c0b :  // <0098> debug_peek_reg = r11
addr == 16'h28 ? 16'h7c0c :  // <0099> debug_peek_reg = r12
addr == 16'h29 ? 16'h7c0d :  // <0100> debug_peek_reg = r13
addr == 16'h2a ? 16'h7c0e :  // <0101> debug_peek_reg = r14
addr == 16'h2b ? 16'h7c0f :  // <0102> debug_peek_reg = r15
        
                16'hxxxx;
        endmodule
    
