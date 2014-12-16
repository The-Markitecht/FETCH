
        `timescale 1 ns / 1 ns

        module visor_program (
            interface   clk,    // clock_ifc.s
            interface  code     // code_ifc.s 
        );
            assign code.content = 
    
// #########################################################################
// assembly source code.
// for debugging supervisor mcu.

// register file configuration

// application-specific register aliases.
//alias_src  tg_debug_out	    [incr counter]

// :begin // = 0x00
// put target into reset.
code.addr == 16'h00 ? 16'h3a02 :  // <0039> bus_ctrl = $tg_reset_mask

// init visor.
code.addr == 16'h01 ? 16'h2f60 :  // <0042> bp3_addr = $bp_disable
code.addr == 16'h02 ? 16'h2b60 :  // <0043> bp2_addr = $bp_disable
code.addr == 16'h03 ? 16'h2760 :  // <0044> bp1_addr = $bp_disable
code.addr == 16'h04 ? 16'h2360 :  // <0045> bp0_addr = $bp_disable

// release target reset, to run.
code.addr == 16'h05 ? 16'h3a00 :  // <0048> bus_ctrl = 0

// :halt // = 0x06
code.addr == 16'h06 ? 16'he005 :  // <0051> jmp :halt
code.addr == 16'h07 ? 16'h0006 :  // <0051> jmp :halt

// set a breakpoint, wait til it hits.
code.addr == 16'h08 ? 16'h2215 :  // <0054> bp0_addr = 0x15
// :wait_for_bp // = 0x09
code.addr == 16'h09 ? 16'h0200 :  // <0056> a = 0
code.addr == 16'h0a ? 16'h0413 :  // <0057> b = bp_status
code.addr == 16'h0b ? 16'hc800 :  // <0058> nop
code.addr == 16'h0c ? 16'he004 :  // <0059> br z :wait_for_bp
code.addr == 16'h0d ? 16'h0009 :  // <0059> br z :wait_for_bp

// observe a register.
code.addr == 16'h0e ? 16'h3a04 :  // <0062> bus_ctrl = $divert_code_bus_mask
code.addr == 16'h0f ? 16'h3e01 :  // <0063> tg_force = $hold_state_mask
code.addr == 16'h10 ? 16'hd223 :  // <0064> fetch force_opcode from ([label observe] + 7)
code.addr == 16'h11 ? 16'h33b0 :  // <0064> fetch force_opcode from ([label observe] + 7)
code.addr == 16'h12 ? 16'h3e03 :  // <0065> tg_force = ($hold_state_mask | $force_load_exr_mask)
code.addr == 16'h13 ? 16'h3e05 :  // <0066> tg_force = ($hold_state_mask | $force_exec_mask)
code.addr == 16'h14 ? 16'h3e01 :  // <0067> tg_force = $hold_state_mask
// target's r7 value is now in peek_data.

// refill target exr so it can resume seamlessly.
code.addr == 16'h15 ? 16'h3010 :  // <0071> force_opcode = exr_shadow
code.addr == 16'h16 ? 16'h3e03 :  // <0072> tg_force = ($hold_state_mask | $force_load_exr_mask)
code.addr == 16'h17 ? 16'h3e00 :  // <0073> tg_force = 0
code.addr == 16'h18 ? 16'h3a00 :  // <0074> bus_ctrl = 0

// release target to pass breakpoint once.
code.addr == 16'h19 ? 16'h2008 :  // <0077> bp0_addr = bp0_addr

code.addr == 16'h1a ? 16'he005 :  // <0079> jmp :wait_for_bp
code.addr == 16'h1b ? 16'h0009 :  // <0079> jmp :wait_for_bp

// :observe // = 0x1c
// these instructions are assembled in the visor program, but passed to the target to execute.
code.addr == 16'h1c ? 16'h7c00 :  // <0084> debug_peek_reg = r0
code.addr == 16'h1d ? 16'h7c01 :  // <0085> debug_peek_reg = r1
code.addr == 16'h1e ? 16'h7c02 :  // <0086> debug_peek_reg = r2
code.addr == 16'h1f ? 16'h7c03 :  // <0087> debug_peek_reg = r3
code.addr == 16'h20 ? 16'h7c04 :  // <0088> debug_peek_reg = r4
code.addr == 16'h21 ? 16'h7c05 :  // <0089> debug_peek_reg = r5
code.addr == 16'h22 ? 16'h7c06 :  // <0090> debug_peek_reg = r6
code.addr == 16'h23 ? 16'h7c07 :  // <0091> debug_peek_reg = r7
code.addr == 16'h24 ? 16'h7c08 :  // <0092> debug_peek_reg = r8
code.addr == 16'h25 ? 16'h7c09 :  // <0093> debug_peek_reg = r9
code.addr == 16'h26 ? 16'h7c0a :  // <0094> debug_peek_reg = r10
code.addr == 16'h27 ? 16'h7c0b :  // <0095> debug_peek_reg = r11
code.addr == 16'h28 ? 16'h7c0c :  // <0096> debug_peek_reg = r12
code.addr == 16'h29 ? 16'h7c0d :  // <0097> debug_peek_reg = r13
code.addr == 16'h2a ? 16'h7c0e :  // <0098> debug_peek_reg = r14
code.addr == 16'h2b ? 16'h7c0f :  // <0099> debug_peek_reg = r15
        
                16'hxxxx;
        endmodule
    
