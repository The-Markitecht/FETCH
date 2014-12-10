// #########################################################################
// assembly source code.    
// for debugging supervisor mcu.

    // application-specific register aliases.    
    alias_both tg_force	15
        [set tg_debug_force_exec        0x0004]
        [set tg_debug_force_load_exr    0x0002]
        [set tg_debug_hold              0x0001]
    alias_both bus_ctrl	14
        [set divert_code_bus 	        0x0004]
        [set tg_reset 		            0x0002]
        [set tg_code_ready	            0x0001]
    alias_both tg_from_visor_reg 13
    alias_both tg_code_in	12
    alias_both bp3_addr	11
    alias_both bp2_addr	10
    alias_both bp1_addr	9
    alias_both bp0_addr	8
        [set bp_disable 0xffff]
    alias_src  tg_code_addr 0x40
    alias_src  tg_to_visor_reg 0x41
    alias_src  tg_debug_out	0x42
    alias_src  exr_shadow	0x43    
    alias_src  bp_status	0x44   
    
:begin
    // put target into reset.
    bus_ctrl = $tg_reset
    
    // init visor.
    bp3_addr = $bp_disable
    bp2_addr = $bp_disable
    bp1_addr = $bp_disable
    bp0_addr = $bp_disable
    
    // release target reset, to run.
    bus_ctrl = 0
    
    // set a breakpoint, wait til it hits.
    bp0_addr = 0x15
    a = 0
:wait_for_bp
    b = bp_status
    nop
    br z :wait_for_bp
    
    // observe a register.
    bus_ctrl = $divert_code_bus
    tg_force = $tg_debug_hold
    fetch tg_code_in from ([label observe] + 7)
    tg_force = ($tg_debug_hold | $tg_debug_force_load_exr)
    tg_force = ($tg_debug_hold | $tg_debug_force_exec)
    tg_force = $tg_debug_hold
    // target's r7 value is now in tg_to_visor_reg.
    
    // refill target exr so it can resume seamlessly.
    tg_code_in = exr_shadow
    tg_force = ($tg_debug_hold | $tg_debug_force_load_exr)
    tg_force = 0
    bus_ctrl = 0
    
    // release target to pass breakpoint once.
    bp0_addr = bp0_addr
    
    jmp :wait_for_bp
    
:observe
    // these instructions are assembled in the visor program, but passed to the target to execute.
    r15 = r0
    r15 = r1
    r15 = r2
    r15 = r3
    r15 = r4
    r15 = r5
    r15 = r6
    r15 = r7
    r15 = r8
    r15 = r9
    r15 = r10
    r15 = r11
    r15 = r12
    r15 = r13
    r15 = r14
    r15 = r15