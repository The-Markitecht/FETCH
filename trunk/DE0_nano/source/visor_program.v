
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

// patch
addr == 16'h01 ? 16'h0200 :  // <0039> a = 0
// :char // = 0x02
addr == 16'h02 ? 16'h1e43 :  // <0041> av_writedata = 67
addr == 16'h03 ? 16'h1ba0 :  // <0042> av_address = ($jtag_uart_data | $av_write)
addr == 16'h04 ? 16'h8100 :  // <0042> av_address = ($jtag_uart_data | $av_write)
// :wait1 // = 0x05
addr == 16'h05 ? 16'h0445 :  // <0044> b = av_waitrequest
addr == 16'h06 ? 16'hc800 :  // <0045> nop
addr == 16'h07 ? 16'he404 :  // <0046> bn z :wait1
addr == 16'h08 ? 16'h0005 :  // <0046> bn z :wait1
addr == 16'h09 ? 16'h1a00 :  // <0047> av_address = 0
addr == 16'h0a ? 16'hc800 :  // <0048> nop
addr == 16'h0b ? 16'hc800 :  // <0049> nop
addr == 16'h0c ? 16'hc800 :  // <0050> nop
addr == 16'h0d ? 16'hc800 :  // <0051> nop
addr == 16'h0e ? 16'h1e44 :  // <0052> av_writedata = 68
addr == 16'h0f ? 16'h1ba0 :  // <0053> av_address = ($jtag_uart_data | $av_write)
addr == 16'h10 ? 16'h8100 :  // <0053> av_address = ($jtag_uart_data | $av_write)
// :wait2 // = 0x11
addr == 16'h11 ? 16'h0445 :  // <0055> b = av_waitrequest
addr == 16'h12 ? 16'hc800 :  // <0056> nop
addr == 16'h13 ? 16'he404 :  // <0057> bn z :wait2
addr == 16'h14 ? 16'h0011 :  // <0057> bn z :wait2
addr == 16'h15 ? 16'h1a00 :  // <0058> av_address = 0
addr == 16'h16 ? 16'hc800 :  // <0059> nop
addr == 16'h17 ? 16'hc800 :  // <0060> nop
addr == 16'h18 ? 16'hc800 :  // <0061> nop
addr == 16'h19 ? 16'hc800 :  // <0062> nop
addr == 16'h1a ? 16'h1e45 :  // <0063> av_writedata = 69
addr == 16'h1b ? 16'h1ba0 :  // <0064> av_address = ($jtag_uart_data | $av_write)
addr == 16'h1c ? 16'h8100 :  // <0064> av_address = ($jtag_uart_data | $av_write)
// :wait3 // = 0x1d
addr == 16'h1d ? 16'h0445 :  // <0066> b = av_waitrequest
addr == 16'h1e ? 16'hc800 :  // <0067> nop
addr == 16'h1f ? 16'he404 :  // <0068> bn z :wait3
addr == 16'h20 ? 16'h001d :  // <0068> bn z :wait3
addr == 16'h21 ? 16'h1a00 :  // <0069> av_address = 0
addr == 16'h22 ? 16'hc800 :  // <0070> nop
addr == 16'h23 ? 16'hc800 :  // <0071> nop
addr == 16'h24 ? 16'hc800 :  // <0072> nop
addr == 16'h25 ? 16'hc800 :  // <0073> nop
addr == 16'h26 ? 16'he005 :  // <0074> jmp :char
addr == 16'h27 ? 16'h0002 :  // <0074> jmp :char


// init visor.
addr == 16'h28 ? 16'h2f60 :  // <0078> bp3_addr = $bp_disable
addr == 16'h29 ? 16'h2b60 :  // <0079> bp2_addr = $bp_disable
addr == 16'h2a ? 16'h2760 :  // <0080> bp1_addr = $bp_disable
addr == 16'h2b ? 16'h2360 :  // <0081> bp0_addr = $bp_disable

// release target reset, to run.
addr == 16'h2c ? 16'h3a00 :  // <0084> bus_ctrl = 0

// set a breakpoint, wait til it hits.
addr == 16'h2d ? 16'h2215 :  // <0087> bp0_addr = 0x15
// :wait_for_bp // = 0x2e
addr == 16'h2e ? 16'h0200 :  // <0089> a = 0
addr == 16'h2f ? 16'h0444 :  // <0090> b = bp_status
addr == 16'h30 ? 16'hc800 :  // <0091> nop
addr == 16'h31 ? 16'he004 :  // <0092> br z :wait_for_bp
addr == 16'h32 ? 16'h002e :  // <0092> br z :wait_for_bp

// observe a register.
addr == 16'h33 ? 16'h3a04 :  // <0095> bus_ctrl = $divert_code_bus
addr == 16'h34 ? 16'h3e01 :  // <0096> tg_force = $tg_debug_hold
addr == 16'h35 ? 16'hd251 :  // <0097> fetch tg_code_in from ([label observe] + 7)
addr == 16'h36 ? 16'h33b0 :  // <0097> fetch tg_code_in from ([label observe] + 7)
addr == 16'h37 ? 16'h3e03 :  // <0098> tg_force = ($tg_debug_hold | $tg_debug_force_load_exr)
addr == 16'h38 ? 16'h3e05 :  // <0099> tg_force = ($tg_debug_hold | $tg_debug_force_exec)
addr == 16'h39 ? 16'h3e01 :  // <0100> tg_force = $tg_debug_hold
// target's r7 value is now in tg_to_visor_reg.

// refill target exr so it can resume seamlessly.
addr == 16'h3a ? 16'h3043 :  // <0104> tg_code_in = exr_shadow
addr == 16'h3b ? 16'h3e03 :  // <0105> tg_force = ($tg_debug_hold | $tg_debug_force_load_exr)
addr == 16'h3c ? 16'h3e00 :  // <0106> tg_force = 0
addr == 16'h3d ? 16'h3a00 :  // <0107> bus_ctrl = 0

// release target to pass breakpoint once.
addr == 16'h3e ? 16'h2008 :  // <0110> bp0_addr = bp0_addr

// send byte on Avalon.
addr == 16'h3f ? 16'h1c41 :  // <0113> av_writedata = tg_to_visor_reg
addr == 16'h40 ? 16'h1ba0 :  // <0114> av_address = ($jtag_uart_data | $av_write)
addr == 16'h41 ? 16'h8100 :  // <0114> av_address = ($jtag_uart_data | $av_write)
addr == 16'h42 ? 16'h0200 :  // <0115> a = 0
// :wait_for_slave // = 0x43
addr == 16'h43 ? 16'h0445 :  // <0117> b = av_waitrequest
addr == 16'h44 ? 16'hc800 :  // <0118> nop
addr == 16'h45 ? 16'he404 :  // <0119> bn z :wait_for_slave
addr == 16'h46 ? 16'h0043 :  // <0119> bn z :wait_for_slave
addr == 16'h47 ? 16'h1a00 :  // <0120> av_address = 0

addr == 16'h48 ? 16'he005 :  // <0122> jmp :wait_for_bp
addr == 16'h49 ? 16'h002e :  // <0122> jmp :wait_for_bp

// :observe // = 0x4a
// these instructions are assembled in the visor program, but passed to the target to execute.
addr == 16'h4a ? 16'h3c00 :  // <0126> r15 = r0
addr == 16'h4b ? 16'h3c01 :  // <0127> r15 = r1
addr == 16'h4c ? 16'h3c02 :  // <0128> r15 = r2
addr == 16'h4d ? 16'h3c03 :  // <0129> r15 = r3
addr == 16'h4e ? 16'h3c04 :  // <0130> r15 = r4
addr == 16'h4f ? 16'h3c05 :  // <0131> r15 = r5
addr == 16'h50 ? 16'h3c06 :  // <0132> r15 = r6
addr == 16'h51 ? 16'h3c07 :  // <0133> r15 = r7
addr == 16'h52 ? 16'h3c08 :  // <0134> r15 = r8
addr == 16'h53 ? 16'h3c09 :  // <0135> r15 = r9
addr == 16'h54 ? 16'h3c0a :  // <0136> r15 = r10
addr == 16'h55 ? 16'h3c0b :  // <0137> r15 = r11
addr == 16'h56 ? 16'h3c0c :  // <0138> r15 = r12
addr == 16'h57 ? 16'h3c0d :  // <0139> r15 = r13
addr == 16'h58 ? 16'h3c0e :  // <0140> r15 = r14
addr == 16'h59 ? 16'h3c0f :  // <0141> r15 = r15
        
                16'hxxxx;
        endmodule
    
