// #########################################################################
// assembly source code.    
// for debugging supervisor mcu.

    // application-specific register aliases.    
    alias_both tg_force	15
        // 0x0004 tg_debug_force_exec      
        // 0x0002 tg_debug_force_load_exr
        // 0x0001 tg_debug_hold            
    alias_both bus_ctrl	14
        // 0x0004 divert_code_bus 	        
        // 0x0002 tg_reset 		        
        // 0x0000 tg_code_ready	        
    alias_both tg_from_visor_reg 13
    alias_both tg_code_in	12
    alias_both bp3_addr	11
    alias_both bp2_addr	10
    alias_both bp1_addr	9
    alias_both bp0_addr	8
    alias_src  tg_code_addr 0x40
    alias_src  tg_to_visor_reg 0x41
    alias_src  tg_debug_out	0x42
    alias_src  exr_shadow	0x43    
    alias_src  bp_status	0x44   
    
:begin
    // put target into reset.
    bus_ctrl = 0x02
    
    // init visor.
    bp3_addr = 0xffff
    bp2_addr = 0xffff
    bp1_addr = 0xffff
    bp0_addr = 0xffff
    
    // release target reset, to run.
    bus_ctrl = 0
    
    // set a breakpoint, wait til it hits.
    bp0_addr = 0x15
    a = 0x01
:wait_for_bp
    b = bp_status
    nop
    br and0z :wait_for_bp
    
    // observe a register.
    // divert_code, debug_hold.
    bus_ctrl = 0x04
    tg_force = 0x01
    fetch tg_code_in from :observe_r7
    // force_load_exr and then force_exec.
    tg_force = 0x03
    tg_force = 0x05
    tg_force = 0x01 
    // target's r7 value is now in tg_to_visor_reg.
    
    // refill target exr.
    tg_code_in = exr_shadow
    tg_force = 0x03
    tg_force = 0
    bus_ctrl = 0
    
    // release target to pass breakpoint once.
    bp0_addr = bp0_addr
    
    jmp :wait_for_bp
    
:observe_r7
    r15 = r7