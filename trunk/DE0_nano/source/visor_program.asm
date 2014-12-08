// #########################################################################
// assembly source code.    
// for debugging supervisor mcu.

    // application-specific register aliases.    
    alias_both tg_ctrl 	15
        // tg_reset 		0x8000
        // divert_code_bus 	0x4000
        // tg_code_ready	0x2000
    alias_both tg_from_visor_reg 14
    alias_both tg_code_in	13    
    alias_both bp3_addr	12
    alias_both bp2_addr	11
    alias_both bp1_addr	10
    alias_both bp0_addr	9
    alias_src  tg_code_addr 0x40
    alias_src  tg_to_visor_reg 0x41
    alias_src  tg_debug_out	0x42
    alias_src  exr_shadow	0x43    
    
:begin
    // put target into reset.
    tg_ctrl = 0x8000
    
    // init visor.
    bp3_addr = 0xffff
    bp2_addr = 0xffff
    bp1_addr = 0xffff
    bp0_addr = 0xffff
    
    // release target to run.
    tg_ctrl = 0
    
:halt    
    jmp :halt