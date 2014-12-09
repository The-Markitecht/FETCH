
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
// 0x0004 tg_debug_force_exec
// 0x0002 tg_debug_force_load_exr
// 0x0001 tg_debug_hold
// 0x0004 divert_code_bus
// 0x0002 tg_reset
// 0x0000 tg_code_ready
// :begin // = 0x00
// put target into reset.
addr == 16'h00 ? 16'h3a02 :  // <0028> bus_ctrl = 0x02
// init visor.
addr == 16'h01 ? 16'h2fa0 :  // <0031> bp3_addr = 0xffff
addr == 16'h02 ? 16'hffff :  // <0031> bp3_addr = 0xffff
addr == 16'h03 ? 16'h2ba0 :  // <0032> bp2_addr = 0xffff
addr == 16'h04 ? 16'hffff :  // <0032> bp2_addr = 0xffff
addr == 16'h05 ? 16'h27a0 :  // <0033> bp1_addr = 0xffff
addr == 16'h06 ? 16'hffff :  // <0033> bp1_addr = 0xffff
addr == 16'h07 ? 16'h23a0 :  // <0034> bp0_addr = 0xffff
addr == 16'h08 ? 16'hffff :  // <0034> bp0_addr = 0xffff
// release target reset, to run.
addr == 16'h09 ? 16'h3a00 :  // <0037> bus_ctrl = 0
// set a breakpoint, wait til it hits.
addr == 16'h0a ? 16'h2215 :  // <0040> bp0_addr = 0x15
addr == 16'h0b ? 16'h0201 :  // <0041> a = 0x01
// :wait_for_bp // = 0x0c
addr == 16'h0c ? 16'h0444 :  // <0043> b = bp_status
addr == 16'h0d ? 16'hc800 :  // <0044> nop
addr == 16'h0e ? 16'he002 :  // <0045> br and0z :wait_for_bp
addr == 16'h0f ? 16'h000c :  // <0045> br and0z :wait_for_bp
// observe a register.
// divert_code, debug_hold.
addr == 16'h10 ? 16'h3a04 :  // <0049> bus_ctrl = 0x04
addr == 16'h11 ? 16'h3e01 :  // <0050> tg_force = 0x01
addr == 16'h12 ? 16'hd3a0 :  // <0051> fetch tg_code_in from :observe_r7
addr == 16'h13 ? 16'h001f :  // <0051> fetch tg_code_in from :observe_r7
addr == 16'h14 ? 16'h33b0 :  // <0051> fetch tg_code_in from :observe_r7
// force_load_exr and then force_exec.
addr == 16'h15 ? 16'h3e03 :  // <0053> tg_force = 0x03
addr == 16'h16 ? 16'h3e05 :  // <0054> tg_force = 0x05
addr == 16'h17 ? 16'h3e01 :  // <0055> tg_force = 0x01
// target's r7 value is now in tg_to_visor_reg.
// refill target exr.
addr == 16'h18 ? 16'h3043 :  // <0059> tg_code_in = exr_shadow
addr == 16'h19 ? 16'h3e03 :  // <0060> tg_force = 0x03
addr == 16'h1a ? 16'h3e00 :  // <0061> tg_force = 0
addr == 16'h1b ? 16'h3a00 :  // <0062> bus_ctrl = 0
// release target to pass breakpoint once.
addr == 16'h1c ? 16'h2008 :  // <0065> bp0_addr = bp0_addr
addr == 16'h1d ? 16'he005 :  // <0067> jmp :wait_for_bp
addr == 16'h1e ? 16'h000c :  // <0067> jmp :wait_for_bp
// :observe_r7 // = 0x1f
addr == 16'h1f ? 16'h3c07 :  // <0070> r15 = r7
        
            16'hxxxx;
    endmodule

