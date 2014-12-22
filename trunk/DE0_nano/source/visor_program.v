
        `include "header.v"

        module visor_program (
            input wire[15:0] addr
            ,output wire[15:0] data
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
addr == 16'h00 ? 16'h3a02 :  // <0045> bus_ctrl = $tg_reset_mask

// init visor.
addr == 16'h01 ? 16'h2f60 :  // <0048> bp3_addr = $bp_disable
addr == 16'h02 ? 16'h2b60 :  // <0049> bp2_addr = $bp_disable
addr == 16'h03 ? 16'h2760 :  // <0050> bp1_addr = $bp_disable
addr == 16'h04 ? 16'h2360 :  // <0051> bp0_addr = $bp_disable

// release target reset, to run.
addr == 16'h05 ? 16'h3a00 :  // <0054> bus_ctrl = 0

// :halt // = 0x0006
addr == 16'h06 ? 16'he00f :  // <0057> jmp :halt
addr == 16'h07 ? 16'h0006 :  // <0057> "

// set a breakpoint, wait til it hits.
addr == 16'h08 ? 16'h2215 :  // <0060> bp0_addr = 0x15
// :main_loop // = 0x0009
addr == 16'h09 ? 16'hfba0 :  // <0062> call :wait_for_bp
addr == 16'h0a ? 16'h003b :  // <0062> "
addr == 16'h0b ? 16'hfc00 :  // <0062> "

// observe a register.
addr == 16'h0c ? 16'h3a04 :  // <0065> bus_ctrl = $divert_code_bus_mask
addr == 16'h0d ? 16'h3e01 :  // <0066> tg_force = $hold_state_mask
addr == 16'h0e ? 16'hd232 :  // <0067> fetch force_opcode from ([label observe] + 7)
addr == 16'h0f ? 16'h33b0 :  // <0067> "
addr == 16'h10 ? 16'h3e03 :  // <0068> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h11 ? 16'h3e05 :  // <0069> tg_force = ($hold_state_mask | $force_exec_mask)
addr == 16'h12 ? 16'h3e01 :  // <0070> tg_force = $hold_state_mask
// target's r7 value is now in peek_data.

// refill target exr so it can resume seamlessly.
addr == 16'h13 ? 16'h3012 :  // <0074> force_opcode = exr_shadow
addr == 16'h14 ? 16'h3e03 :  // <0075> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h15 ? 16'h3e00 :  // <0076> tg_force = 0
addr == 16'h16 ? 16'h3a00 :  // <0077> bus_ctrl = 0

// interrupt the target and single step it a few times.
addr == 16'h17 ? 16'h3a08 :  // <0080> bus_ctrl = $bp_step_mask
addr == 16'h18 ? 16'hfba0 :  // <0081> call :wait_for_bp
addr == 16'h19 ? 16'h003b :  // <0081> "
addr == 16'h1a ? 16'hfc00 :  // <0081> "
addr == 16'h1b ? 16'h2008 :  // <0082> bp0_addr = bp0_addr
addr == 16'h1c ? 16'hfba0 :  // <0083> call :wait_for_bp
addr == 16'h1d ? 16'h003b :  // <0083> "
addr == 16'h1e ? 16'hfc00 :  // <0083> "
addr == 16'h1f ? 16'h2008 :  // <0084> bp0_addr = bp0_addr
addr == 16'h20 ? 16'hfba0 :  // <0085> call :wait_for_bp
addr == 16'h21 ? 16'h003b :  // <0085> "
addr == 16'h22 ? 16'hfc00 :  // <0085> "
addr == 16'h23 ? 16'h2008 :  // <0086> bp0_addr = bp0_addr
addr == 16'h24 ? 16'hfba0 :  // <0087> call :wait_for_bp
addr == 16'h25 ? 16'h003b :  // <0087> "
addr == 16'h26 ? 16'hfc00 :  // <0087> "
addr == 16'h27 ? 16'h3a00 :  // <0088> bus_ctrl = 0

// release target to pass breakpoint once.
addr == 16'h28 ? 16'h2008 :  // <0091> bp0_addr = bp0_addr

addr == 16'h29 ? 16'he00f :  // <0093> jmp :main_loop
addr == 16'h2a ? 16'h0009 :  // <0093> "

// :observe // = 0x002b
// these instructions are assembled in the visor program, but passed to the target to execute.
addr == 16'h2b ? 16'h7c00 :  // <0098> debug_peek_reg = r0
addr == 16'h2c ? 16'h7c01 :  // <0099> debug_peek_reg = r1
addr == 16'h2d ? 16'h7c02 :  // <0100> debug_peek_reg = r2
addr == 16'h2e ? 16'h7c03 :  // <0101> debug_peek_reg = r3
addr == 16'h2f ? 16'h7c04 :  // <0102> debug_peek_reg = r4
addr == 16'h30 ? 16'h7c05 :  // <0103> debug_peek_reg = r5
addr == 16'h31 ? 16'h7c06 :  // <0104> debug_peek_reg = r6
addr == 16'h32 ? 16'h7c07 :  // <0105> debug_peek_reg = r7
addr == 16'h33 ? 16'h7c08 :  // <0106> debug_peek_reg = r8
addr == 16'h34 ? 16'h7c09 :  // <0107> debug_peek_reg = r9
addr == 16'h35 ? 16'h7c0a :  // <0108> debug_peek_reg = r10
addr == 16'h36 ? 16'h7c0b :  // <0109> debug_peek_reg = r11
addr == 16'h37 ? 16'h7c0c :  // <0110> debug_peek_reg = r12
addr == 16'h38 ? 16'h7c0d :  // <0111> debug_peek_reg = r13
addr == 16'h39 ? 16'h7c0e :  // <0112> debug_peek_reg = r14
addr == 16'h3a ? 16'h7c0f :  // <0113> debug_peek_reg = r15

// func wait_for_bp // = 0x003b
addr == 16'h3b ? 16'h0200 :  // <0116> a = 0
addr == 16'h3c ? 16'h0415 :  // <0117> b = bp_status
addr == 16'h3d ? 16'hc800 :  // <0118> nop
addr == 16'h3e ? 16'he004 :  // <0119> br z :wait_for_bp
addr == 16'h3f ? 16'h003b :  // <0119> "
addr == 16'h40 ? 16'hfc00 :  // <0120> return
        
                16'hxxxx;
        endmodule
    
