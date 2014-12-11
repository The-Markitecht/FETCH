
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
addr == 16'h00 ? 16'h4202 :  // <0041> bus_ctrl = $tg_reset

// patch
addr == 16'h01 ? 16'h0200 :  // <0044> a = 0
// :char // = 0x02
addr == 16'h02 ? 16'h3a43 :  // <0046> av_writedata = 67
addr == 16'h03 ? 16'h3fa0 :  // <0047> av_address = ($jtag_uart_data | $av_write)
addr == 16'h04 ? 16'h0101 :  // <0047> av_address = ($jtag_uart_data | $av_write)
// :wait1 // = 0x05
addr == 16'h05 ? 16'h0418 :  // <0049> b = av_waitrequest
addr == 16'h06 ? 16'hc800 :  // <0050> nop
addr == 16'h07 ? 16'he404 :  // <0051> bn z :wait1
addr == 16'h08 ? 16'h0005 :  // <0051> bn z :wait1
addr == 16'h09 ? 16'h3e00 :  // <0052> av_address = 0
addr == 16'h0a ? 16'hc800 :  // <0053> nop
addr == 16'h0b ? 16'hc800 :  // <0054> nop
addr == 16'h0c ? 16'hc800 :  // <0055> nop
addr == 16'h0d ? 16'hc800 :  // <0056> nop
addr == 16'h0e ? 16'h3a44 :  // <0057> av_writedata = 68
addr == 16'h0f ? 16'h3fa0 :  // <0058> av_address = ($jtag_uart_data | $av_write)
addr == 16'h10 ? 16'h0101 :  // <0058> av_address = ($jtag_uart_data | $av_write)
// :wait2 // = 0x11
addr == 16'h11 ? 16'h0418 :  // <0060> b = av_waitrequest
addr == 16'h12 ? 16'hc800 :  // <0061> nop
addr == 16'h13 ? 16'he404 :  // <0062> bn z :wait2
addr == 16'h14 ? 16'h0011 :  // <0062> bn z :wait2
addr == 16'h15 ? 16'h3e00 :  // <0063> av_address = 0
addr == 16'h16 ? 16'hc800 :  // <0064> nop
addr == 16'h17 ? 16'hc800 :  // <0065> nop
addr == 16'h18 ? 16'hc800 :  // <0066> nop
addr == 16'h19 ? 16'hc800 :  // <0067> nop
addr == 16'h1a ? 16'h3a45 :  // <0068> av_writedata = 69
addr == 16'h1b ? 16'h3fa0 :  // <0069> av_address = ($jtag_uart_data | $av_write)
addr == 16'h1c ? 16'h0101 :  // <0069> av_address = ($jtag_uart_data | $av_write)
// :wait3 // = 0x1d
addr == 16'h1d ? 16'h0418 :  // <0071> b = av_waitrequest
addr == 16'h1e ? 16'hc800 :  // <0072> nop
addr == 16'h1f ? 16'he404 :  // <0073> bn z :wait3
addr == 16'h20 ? 16'h001d :  // <0073> bn z :wait3
addr == 16'h21 ? 16'h3e00 :  // <0074> av_address = 0
addr == 16'h22 ? 16'hc800 :  // <0075> nop
addr == 16'h23 ? 16'hc800 :  // <0076> nop
addr == 16'h24 ? 16'hc800 :  // <0077> nop
addr == 16'h25 ? 16'hc800 :  // <0078> nop
addr == 16'h26 ? 16'he005 :  // <0079> jmp :char
addr == 16'h27 ? 16'h0002 :  // <0079> jmp :char


// init visor.
addr == 16'h28 ? 16'h2f60 :  // <0083> bp3_addr = $bp_disable
addr == 16'h29 ? 16'h2b60 :  // <0084> bp2_addr = $bp_disable
addr == 16'h2a ? 16'h2760 :  // <0085> bp1_addr = $bp_disable
addr == 16'h2b ? 16'h2360 :  // <0086> bp0_addr = $bp_disable

// release target reset, to run.
addr == 16'h2c ? 16'h4200 :  // <0089> bus_ctrl = 0

// set a breakpoint, wait til it hits.
addr == 16'h2d ? 16'h2215 :  // <0092> bp0_addr = 0x15
// :wait_for_bp // = 0x2e
addr == 16'h2e ? 16'h0200 :  // <0094> a = 0
addr == 16'h2f ? 16'h0417 :  // <0095> b = bp_status
addr == 16'h30 ? 16'hc800 :  // <0096> nop
addr == 16'h31 ? 16'he004 :  // <0097> br z :wait_for_bp
addr == 16'h32 ? 16'h002e :  // <0097> br z :wait_for_bp

// observe a register.
addr == 16'h33 ? 16'h4204 :  // <0100> bus_ctrl = $divert_code_bus
addr == 16'h34 ? 16'h4601 :  // <0101> tg_force = $tg_debug_hold
addr == 16'h35 ? 16'hd251 :  // <0102> fetch force_opcode from ([label observe] + 7)
addr == 16'h36 ? 16'h33b0 :  // <0102> fetch force_opcode from ([label observe] + 7)
addr == 16'h37 ? 16'h4603 :  // <0103> tg_force = ($tg_debug_hold | $tg_debug_force_load_exr)
addr == 16'h38 ? 16'h4605 :  // <0104> tg_force = ($tg_debug_hold | $tg_debug_force_exec)
addr == 16'h39 ? 16'h4601 :  // <0105> tg_force = $tg_debug_hold
// target's r7 value is now in peek_data.

// refill target exr so it can resume seamlessly.
addr == 16'h3a ? 16'h3013 :  // <0109> force_opcode = exr_shadow
addr == 16'h3b ? 16'h4603 :  // <0110> tg_force = ($tg_debug_hold | $tg_debug_force_load_exr)
addr == 16'h3c ? 16'h4600 :  // <0111> tg_force = 0
addr == 16'h3d ? 16'h4200 :  // <0112> bus_ctrl = 0

// release target to pass breakpoint once.
addr == 16'h3e ? 16'h2008 :  // <0115> bp0_addr = bp0_addr

// send byte on Avalon.
addr == 16'h3f ? 16'h3815 :  // <0118> av_writedata = peek_data
addr == 16'h40 ? 16'h3fa0 :  // <0119> av_address = ($jtag_uart_data | $av_write)
addr == 16'h41 ? 16'h0101 :  // <0119> av_address = ($jtag_uart_data | $av_write)
addr == 16'h42 ? 16'h0200 :  // <0120> a = 0
// :wait_for_slave // = 0x43
addr == 16'h43 ? 16'h0418 :  // <0122> b = av_waitrequest
addr == 16'h44 ? 16'hc800 :  // <0123> nop
addr == 16'h45 ? 16'he404 :  // <0124> bn z :wait_for_slave
addr == 16'h46 ? 16'h0043 :  // <0124> bn z :wait_for_slave
addr == 16'h47 ? 16'h3e00 :  // <0125> av_address = 0

addr == 16'h48 ? 16'he005 :  // <0127> jmp :wait_for_bp
addr == 16'h49 ? 16'h002e :  // <0127> jmp :wait_for_bp

// :observe // = 0x4a
// these instructions are assembled in the visor program, but passed to the target to execute.
addr == 16'h4a ? 16'h7c00 :  // <0132> debug_peek_reg = r0
addr == 16'h4b ? 16'h7c01 :  // <0133> debug_peek_reg = r1
addr == 16'h4c ? 16'h7c02 :  // <0134> debug_peek_reg = r2
addr == 16'h4d ? 16'h7c03 :  // <0135> debug_peek_reg = r3
addr == 16'h4e ? 16'h7c04 :  // <0136> debug_peek_reg = r4
addr == 16'h4f ? 16'h7c05 :  // <0137> debug_peek_reg = r5
addr == 16'h50 ? 16'h7c06 :  // <0138> debug_peek_reg = r6
addr == 16'h51 ? 16'h7c07 :  // <0139> debug_peek_reg = r7
addr == 16'h52 ? 16'h7c08 :  // <0140> debug_peek_reg = r8
addr == 16'h53 ? 16'h7c09 :  // <0141> debug_peek_reg = r9
addr == 16'h54 ? 16'h7c0a :  // <0142> debug_peek_reg = r10
addr == 16'h55 ? 16'h7c0b :  // <0143> debug_peek_reg = r11
addr == 16'h56 ? 16'h7c0c :  // <0144> debug_peek_reg = r12
addr == 16'h57 ? 16'h7c0d :  // <0145> debug_peek_reg = r13
addr == 16'h58 ? 16'h7c0e :  // <0146> debug_peek_reg = r14
addr == 16'h59 ? 16'h7c0f :  // <0147> debug_peek_reg = r15
        
                16'hxxxx;
        endmodule
    
