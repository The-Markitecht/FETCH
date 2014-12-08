
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
// tg_reset 		0x8000
// divert_code_bus 	0x4000
// tg_code_ready	0x2000
// :begin // = 0x00
// put target into reset.
addr == 16'h00 ? 16'h3fa0 :  // <0023> tg_ctrl = 0x8000
addr == 16'h01 ? 16'h8000 :  // <0023> tg_ctrl = 0x8000
// init visor.
addr == 16'h02 ? 16'h33a0 :  // <0026> bp3_addr = 0xffff
addr == 16'h03 ? 16'hffff :  // <0026> bp3_addr = 0xffff
addr == 16'h04 ? 16'h2fa0 :  // <0027> bp2_addr = 0xffff
addr == 16'h05 ? 16'hffff :  // <0027> bp2_addr = 0xffff
addr == 16'h06 ? 16'h2ba0 :  // <0028> bp1_addr = 0xffff
addr == 16'h07 ? 16'hffff :  // <0028> bp1_addr = 0xffff
addr == 16'h08 ? 16'h27a0 :  // <0029> bp0_addr = 0xffff
addr == 16'h09 ? 16'hffff :  // <0029> bp0_addr = 0xffff
// release target to run.
addr == 16'h0a ? 16'h3e00 :  // <0032> tg_ctrl = 0
// :halt // = 0x0b
addr == 16'h0b ? 16'he005 :  // <0035> jmp :halt
addr == 16'h0c ? 16'h000b :  // <0035> jmp :halt
        
            16'hxxxx;
    endmodule

