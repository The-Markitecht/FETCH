
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
addr == 16'h00 ? 16'h3a02 :  // <0029> bus_ctrl = $tg_reset
// init visor.
addr == 16'h01 ? 16'h2f60 :  // <0032> bp3_addr = $bp_disable
addr == 16'h02 ? 16'h2b60 :  // <0033> bp2_addr = $bp_disable
addr == 16'h03 ? 16'h2760 :  // <0034> bp1_addr = $bp_disable
addr == 16'h04 ? 16'h2360 :  // <0035> bp0_addr = $bp_disable
// release target reset, to run.
addr == 16'h05 ? 16'h3a00 :  // <0038> bus_ctrl = 0
// set a breakpoint, wait til it hits.
addr == 16'h06 ? 16'h2215 :  // <0041> bp0_addr = 0x15
addr == 16'h07 ? 16'h0200 :  // <0042> a = 0
// :wait_for_bp // = 0x08
addr == 16'h08 ? 16'h0444 :  // <0044> b = bp_status
addr == 16'h09 ? 16'hc800 :  // <0045> nop
addr == 16'h0a ? 16'he004 :  // <0046> br z :wait_for_bp
addr == 16'h0b ? 16'h0008 :  // <0046> br z :wait_for_bp
// observe a register.
addr == 16'h0c ? 16'h3a04 :  // <0049> bus_ctrl = $divert_code_bus
addr == 16'h0d ? 16'h3e01 :  // <0050> tg_force = $tg_debug_hold
addr == 16'h0e ? 16'hd221 :  // <0051> fetch tg_code_in from ([label observe] + 7)
addr == 16'h0f ? 16'h33b0 :  // <0051> fetch tg_code_in from ([label observe] + 7)
addr == 16'h10 ? 16'h3e03 :  // <0052> tg_force = ($tg_debug_hold | $tg_debug_force_load_exr)
addr == 16'h11 ? 16'h3e05 :  // <0053> tg_force = ($tg_debug_hold | $tg_debug_force_exec)
addr == 16'h12 ? 16'h3e01 :  // <0054> tg_force = $tg_debug_hold
// target's r7 value is now in tg_to_visor_reg.
// refill target exr so it can resume seamlessly.
addr == 16'h13 ? 16'h3043 :  // <0058> tg_code_in = exr_shadow
addr == 16'h14 ? 16'h3e03 :  // <0059> tg_force = ($tg_debug_hold | $tg_debug_force_load_exr)
addr == 16'h15 ? 16'h3e00 :  // <0060> tg_force = 0
addr == 16'h16 ? 16'h3a00 :  // <0061> bus_ctrl = 0
// release target to pass breakpoint once.
addr == 16'h17 ? 16'h2008 :  // <0064> bp0_addr = bp0_addr
addr == 16'h18 ? 16'he005 :  // <0066> jmp :wait_for_bp
addr == 16'h19 ? 16'h0008 :  // <0066> jmp :wait_for_bp
// :observe // = 0x1a
// these instructions are assembled in the visor program, but passed to the target to execute.
addr == 16'h1a ? 16'h3c00 :  // <0070> r15 = r0
addr == 16'h1b ? 16'h3c01 :  // <0071> r15 = r1
addr == 16'h1c ? 16'h3c02 :  // <0072> r15 = r2
addr == 16'h1d ? 16'h3c03 :  // <0073> r15 = r3
addr == 16'h1e ? 16'h3c04 :  // <0074> r15 = r4
addr == 16'h1f ? 16'h3c05 :  // <0075> r15 = r5
addr == 16'h20 ? 16'h3c06 :  // <0076> r15 = r6
addr == 16'h21 ? 16'h3c07 :  // <0077> r15 = r7
addr == 16'h22 ? 16'h3c08 :  // <0078> r15 = r8
addr == 16'h23 ? 16'h3c09 :  // <0079> r15 = r9
addr == 16'h24 ? 16'h3c0a :  // <0080> r15 = r10
addr == 16'h25 ? 16'h3c0b :  // <0081> r15 = r11
addr == 16'h26 ? 16'h3c0c :  // <0082> r15 = r12
addr == 16'h27 ? 16'h3c0d :  // <0083> r15 = r13
addr == 16'h28 ? 16'h3c0e :  // <0084> r15 = r14
addr == 16'h29 ? 16'h3c0f :  // <0085> r15 = r15
        
                16'hxxxx;
        endmodule
    
