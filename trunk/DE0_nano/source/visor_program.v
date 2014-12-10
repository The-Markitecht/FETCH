
        `timescale 1 ns / 1 ns

        module visor_program (
            input[15:0] addr
            ,output[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.
// for debugging supervisor mcu.

// application-specific register aliases.


// :begin // = 0x00
// put target into reset.
addr == 16'h00 ? 16'h3a02 :  // <0036> bus_ctrl = $tg_reset

// init visor.
addr == 16'h01 ? 16'h2f60 :  // <0039> bp3_addr = $bp_disable
addr == 16'h02 ? 16'h2b60 :  // <0040> bp2_addr = $bp_disable
addr == 16'h03 ? 16'h2760 :  // <0041> bp1_addr = $bp_disable
addr == 16'h04 ? 16'h2360 :  // <0042> bp0_addr = $bp_disable

// release target reset, to run.
addr == 16'h05 ? 16'h3a00 :  // <0045> bus_ctrl = 0

// set a breakpoint, wait til it hits.
addr == 16'h06 ? 16'h2215 :  // <0048> bp0_addr = 0x15
// :wait_for_bp // = 0x07
addr == 16'h07 ? 16'h0200 :  // <0050> a = 0
addr == 16'h08 ? 16'h0444 :  // <0051> b = bp_status
addr == 16'h09 ? 16'hc800 :  // <0052> nop
addr == 16'h0a ? 16'he004 :  // <0053> br z :wait_for_bp
addr == 16'h0b ? 16'h0007 :  // <0053> br z :wait_for_bp

// observe a register.
addr == 16'h0c ? 16'h3a04 :  // <0056> bus_ctrl = $divert_code_bus
addr == 16'h0d ? 16'h3e01 :  // <0057> tg_force = $tg_debug_hold
addr == 16'h0e ? 16'hd22a :  // <0058> fetch tg_code_in from ([label observe] + 7)
addr == 16'h0f ? 16'h33b0 :  // <0058> fetch tg_code_in from ([label observe] + 7)
addr == 16'h10 ? 16'h3e03 :  // <0059> tg_force = ($tg_debug_hold | $tg_debug_force_load_exr)
addr == 16'h11 ? 16'h3e05 :  // <0060> tg_force = ($tg_debug_hold | $tg_debug_force_exec)
addr == 16'h12 ? 16'h3e01 :  // <0061> tg_force = $tg_debug_hold
// target's r7 value is now in tg_to_visor_reg.

// refill target exr so it can resume seamlessly.
addr == 16'h13 ? 16'h3043 :  // <0065> tg_code_in = exr_shadow
addr == 16'h14 ? 16'h3e03 :  // <0066> tg_force = ($tg_debug_hold | $tg_debug_force_load_exr)
addr == 16'h15 ? 16'h3e00 :  // <0067> tg_force = 0
addr == 16'h16 ? 16'h3a00 :  // <0068> bus_ctrl = 0

// release target to pass breakpoint once.
addr == 16'h17 ? 16'h2008 :  // <0071> bp0_addr = bp0_addr

// send byte on Avalon.
addr == 16'h18 ? 16'h1c41 :  // <0074> av_writedata = tg_to_visor_reg
addr == 16'h19 ? 16'h1ba0 :  // <0075> av_address = ($jtag_uart_data | $av_write)
addr == 16'h1a ? 16'h8100 :  // <0075> av_address = ($jtag_uart_data | $av_write)
addr == 16'h1b ? 16'h0200 :  // <0076> a = 0
// :wait_for_slave // = 0x1c
addr == 16'h1c ? 16'h0445 :  // <0078> b = av_waitrequest
addr == 16'h1d ? 16'hc800 :  // <0079> nop
addr == 16'h1e ? 16'he404 :  // <0080> bn z :wait_for_slave
addr == 16'h1f ? 16'h001c :  // <0080> bn z :wait_for_slave
addr == 16'h20 ? 16'h1a00 :  // <0081> av_address = 0

addr == 16'h21 ? 16'he005 :  // <0083> jmp :wait_for_bp
addr == 16'h22 ? 16'h0007 :  // <0083> jmp :wait_for_bp

// :observe // = 0x23
// these instructions are assembled in the visor program, but passed to the target to execute.
addr == 16'h23 ? 16'h3c00 :  // <0087> r15 = r0
addr == 16'h24 ? 16'h3c01 :  // <0088> r15 = r1
addr == 16'h25 ? 16'h3c02 :  // <0089> r15 = r2
addr == 16'h26 ? 16'h3c03 :  // <0090> r15 = r3
addr == 16'h27 ? 16'h3c04 :  // <0091> r15 = r4
addr == 16'h28 ? 16'h3c05 :  // <0092> r15 = r5
addr == 16'h29 ? 16'h3c06 :  // <0093> r15 = r6
addr == 16'h2a ? 16'h3c07 :  // <0094> r15 = r7
addr == 16'h2b ? 16'h3c08 :  // <0095> r15 = r8
addr == 16'h2c ? 16'h3c09 :  // <0096> r15 = r9
addr == 16'h2d ? 16'h3c0a :  // <0097> r15 = r10
addr == 16'h2e ? 16'h3c0b :  // <0098> r15 = r11
addr == 16'h2f ? 16'h3c0c :  // <0099> r15 = r12
addr == 16'h30 ? 16'h3c0d :  // <0100> r15 = r13
addr == 16'h31 ? 16'h3c0e :  // <0101> r15 = r14
addr == 16'h32 ? 16'h3c0f :  // <0102> r15 = r15
        
                16'hxxxx;
        endmodule
    
