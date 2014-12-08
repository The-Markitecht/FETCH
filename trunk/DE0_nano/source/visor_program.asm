// #########################################################################
// assembly source code.    
// for debugging supervisor mcu.

    // application-specific register aliases.    
    alias_both tg_ctrl 	15
        // tg_reset 		0x8000
        // divert_code_bus 	0x4000
        // tg_code_ready	0x2000
        // step_cmd         0x1000
        // tg_debug_hold    0x0001
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
    alias_src  bp_status	0x44   
    
:begin
    // put target into reset.
    tg_ctrl = 0x8000
    
    // init visor.
    bp3_addr = 0xffff
    bp2_addr = 0xffff
    bp1_addr = 0xffff
    bp0_addr = 0xffff
    
    // release target reset, to run.
    tg_ctrl = 0
    
    // set a breakpoint, wait til it hits.
    bp0_addr = 0x15
    a = 0x01
:wait_for_bp
    b = bp_status
    nop
    br and0z :wait_for_bp
    
    // observe a register.
    // divert_code, code_ready, debug_hold
    tg_ctrl = 0x4001
    fetch tg_code_in from :observe_r7
    tg_ctrl = 0x5001
    tg_ctrl = 0x4001    
    // target's r7 value is now in tg_to_visor_reg.
    
    // refill target exr.
    tg_code_in = exr_shadow
    tg_ctrl = 0x5001
    tg_ctrl = 0x4001    
    
    // release target to pass breakpoint once.
    tg_ctrl = 0 
    bp0_addr = bp0_addr
    
:halt    
    jmp :halt
    
:observe_r7
    r15 = r7