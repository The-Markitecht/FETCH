
        `timescale 1 ns / 1 ns

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

// :begin // = 0x00
// put target into reset.
addr == 16'h00 ? 16'h4202 :  // <0047> bus_ctrl = $tg_reset_mask

// patch
addr == 16'h01 ? 16'h0200 :  // <0050> a = 0
// :char // = 0x02
addr == 16'h02 ? 16'h3a43 :  // <0052> av_writedata = 67
addr == 16'h03 ? 16'h3fa0 :  // <0053> av_address = $jtag_uart_data
addr == 16'h04 ? 16'h0100 :  // <0053> av_address = $jtag_uart_data
addr == 16'h05 ? 16'h4a01 :  // <0054> av_ctrl = $av_write_mask
// :wait1 // = 0x06
addr == 16'h06 ? 16'h0418 :  // <0056> b = av_waitrequest
addr == 16'h07 ? 16'hc800 :  // <0057> nop
addr == 16'h08 ? 16'he404 :  // <0058> bn z :wait1
addr == 16'h09 ? 16'h0006 :  // <0058> bn z :wait1
addr == 16'h0a ? 16'h4a00 :  // <0059> av_ctrl = 0
addr == 16'h0b ? 16'hc800 :  // <0060> nop
addr == 16'h0c ? 16'hc800 :  // <0061> nop
addr == 16'h0d ? 16'hc800 :  // <0062> nop
addr == 16'h0e ? 16'hc800 :  // <0063> nop
addr == 16'h0f ? 16'h3a44 :  // <0064> av_writedata = 68
addr == 16'h10 ? 16'h3fa0 :  // <0065> av_address = $jtag_uart_data
addr == 16'h11 ? 16'h0100 :  // <0065> av_address = $jtag_uart_data
addr == 16'h12 ? 16'h4a01 :  // <0066> av_ctrl = $av_write_mask
// :wait2 // = 0x13
addr == 16'h13 ? 16'h0418 :  // <0068> b = av_waitrequest
addr == 16'h14 ? 16'hc800 :  // <0069> nop
addr == 16'h15 ? 16'he404 :  // <0070> bn z :wait2
addr == 16'h16 ? 16'h0013 :  // <0070> bn z :wait2
addr == 16'h17 ? 16'h4a00 :  // <0071> av_ctrl = 0
addr == 16'h18 ? 16'hc800 :  // <0072> nop
addr == 16'h19 ? 16'hc800 :  // <0073> nop
addr == 16'h1a ? 16'hc800 :  // <0074> nop
addr == 16'h1b ? 16'hc800 :  // <0075> nop
addr == 16'h1c ? 16'h3a45 :  // <0076> av_writedata = 69
addr == 16'h1d ? 16'h3fa0 :  // <0077> av_address = $jtag_uart_data
addr == 16'h1e ? 16'h0100 :  // <0077> av_address = $jtag_uart_data
addr == 16'h1f ? 16'h4a01 :  // <0078> av_ctrl = $av_write_mask
// :wait3 // = 0x20
addr == 16'h20 ? 16'h0418 :  // <0080> b = av_waitrequest
addr == 16'h21 ? 16'hc800 :  // <0081> nop
addr == 16'h22 ? 16'he404 :  // <0082> bn z :wait3
addr == 16'h23 ? 16'h0020 :  // <0082> bn z :wait3
addr == 16'h24 ? 16'h4a00 :  // <0083> av_ctrl = 0
addr == 16'h25 ? 16'hc800 :  // <0084> nop
addr == 16'h26 ? 16'hc800 :  // <0085> nop
addr == 16'h27 ? 16'hc800 :  // <0086> nop
addr == 16'h28 ? 16'hc800 :  // <0087> nop
addr == 16'h29 ? 16'he005 :  // <0088> jmp :char
addr == 16'h2a ? 16'h0002 :  // <0088> jmp :char


// init visor.
addr == 16'h2b ? 16'h2f60 :  // <0092> bp3_addr = $bp_disable
addr == 16'h2c ? 16'h2b60 :  // <0093> bp2_addr = $bp_disable
addr == 16'h2d ? 16'h2760 :  // <0094> bp1_addr = $bp_disable
addr == 16'h2e ? 16'h2360 :  // <0095> bp0_addr = $bp_disable

// release target reset, to run.
addr == 16'h2f ? 16'h4200 :  // <0098> bus_ctrl = 0

// set a breakpoint, wait til it hits.
addr == 16'h30 ? 16'h2215 :  // <0101> bp0_addr = 0x15
// :wait_for_bp // = 0x31
addr == 16'h31 ? 16'h0200 :  // <0103> a = 0
addr == 16'h32 ? 16'h0417 :  // <0104> b = bp_status
addr == 16'h33 ? 16'hc800 :  // <0105> nop
addr == 16'h34 ? 16'he004 :  // <0106> br z :wait_for_bp
addr == 16'h35 ? 16'h0031 :  // <0106> br z :wait_for_bp

// observe a register.
addr == 16'h36 ? 16'h4204 :  // <0109> bus_ctrl = $divert_code_bus_mask
addr == 16'h37 ? 16'h4601 :  // <0110> tg_force = $tg_debug_hold_mask
addr == 16'h38 ? 16'hd255 :  // <0111> fetch force_opcode from ([label observe] + 7)
addr == 16'h39 ? 16'h33b0 :  // <0111> fetch force_opcode from ([label observe] + 7)
addr == 16'h3a ? 16'h4603 :  // <0112> tg_force = ($tg_debug_hold_mask | $tg_debug_force_load_exr_mask)
addr == 16'h3b ? 16'h4605 :  // <0113> tg_force = ($tg_debug_hold_mask | $tg_debug_force_exec_mask)
addr == 16'h3c ? 16'h4601 :  // <0114> tg_force = $tg_debug_hold_mask
// target's r7 value is now in peek_data.

// refill target exr so it can resume seamlessly.
addr == 16'h3d ? 16'h3013 :  // <0118> force_opcode = exr_shadow
addr == 16'h3e ? 16'h4603 :  // <0119> tg_force = ($tg_debug_hold_mask | $tg_debug_force_load_exr_mask)
addr == 16'h3f ? 16'h4600 :  // <0120> tg_force = 0
addr == 16'h40 ? 16'h4200 :  // <0121> bus_ctrl = 0

// release target to pass breakpoint once.
addr == 16'h41 ? 16'h2008 :  // <0124> bp0_addr = bp0_addr

// send byte on Avalon.
addr == 16'h42 ? 16'h3815 :  // <0127> av_writedata = peek_data
addr == 16'h43 ? 16'h3fa0 :  // <0128> av_address = $jtag_uart_data
addr == 16'h44 ? 16'h0100 :  // <0128> av_address = $jtag_uart_data
addr == 16'h45 ? 16'h4a01 :  // <0129> av_ctrl = $av_write_mask
addr == 16'h46 ? 16'h0200 :  // <0130> a = 0
// :wait_for_slave // = 0x47
addr == 16'h47 ? 16'h0418 :  // <0132> b = av_waitrequest
addr == 16'h48 ? 16'hc800 :  // <0133> nop
addr == 16'h49 ? 16'he404 :  // <0134> bn z :wait_for_slave
addr == 16'h4a ? 16'h0047 :  // <0134> bn z :wait_for_slave
addr == 16'h4b ? 16'h4a00 :  // <0135> av_ctrl = 0

addr == 16'h4c ? 16'he005 :  // <0137> jmp :wait_for_bp
addr == 16'h4d ? 16'h0031 :  // <0137> jmp :wait_for_bp

// :observe // = 0x4e
// these instructions are assembled in the visor program, but passed to the target to execute.
addr == 16'h4e ? 16'h7c00 :  // <0142> debug_peek_reg = r0
addr == 16'h4f ? 16'h7c01 :  // <0143> debug_peek_reg = r1
addr == 16'h50 ? 16'h7c02 :  // <0144> debug_peek_reg = r2
addr == 16'h51 ? 16'h7c03 :  // <0145> debug_peek_reg = r3
addr == 16'h52 ? 16'h7c04 :  // <0146> debug_peek_reg = r4
addr == 16'h53 ? 16'h7c05 :  // <0147> debug_peek_reg = r5
addr == 16'h54 ? 16'h7c06 :  // <0148> debug_peek_reg = r6
addr == 16'h55 ? 16'h7c07 :  // <0149> debug_peek_reg = r7
addr == 16'h56 ? 16'h7c08 :  // <0150> debug_peek_reg = r8
addr == 16'h57 ? 16'h7c09 :  // <0151> debug_peek_reg = r9
addr == 16'h58 ? 16'h7c0a :  // <0152> debug_peek_reg = r10
addr == 16'h59 ? 16'h7c0b :  // <0153> debug_peek_reg = r11
addr == 16'h5a ? 16'h7c0c :  // <0154> debug_peek_reg = r12
addr == 16'h5b ? 16'h7c0d :  // <0155> debug_peek_reg = r13
addr == 16'h5c ? 16'h7c0e :  // <0156> debug_peek_reg = r14
addr == 16'h5d ? 16'h7c0f :  // <0157> debug_peek_reg = r15
        
                16'hxxxx;
        endmodule
    
