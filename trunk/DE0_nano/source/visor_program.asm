// #########################################################################
// assembly source code.    
// for debugging supervisor mcu.

    // register file configuration
    vdefine VISOR_NUM_REGS 20
    vdefine VISOR_TOP_REG ($VISOR_NUM_REGS - 1)
    vdefine VISOR_NUM_GP 8
    vdefine VISOR_TOP_GP ($VISOR_NUM_GP - 1)
    vdefine VIO $VISOR_NUM_GP    

    // application-specific register aliases.  
    alias_both g6                   6 
    alias_both g7                   7
    [set counter $VISOR_TOP_GP]
    alias_both bp0_addr	        [incr counter]
    alias_both bp1_addr	        [incr counter]
    alias_both bp2_addr	        [incr counter]
    alias_both bp3_addr	        [incr counter]
        vdefine bp_disable                 0xffff
    alias_both force_opcode	    [incr counter]
    alias_both poke_data        [incr counter]
    alias_both bus_ctrl	        [incr counter]
        vdefine divert_code_bus_mask 	        0x0004
        vdefine tg_reset_mask 		            0x0002
        vdefine tg_code_ready_mask	            0x0001
    alias_both tg_force	        [incr counter]
        vdefine force_exec_mask        0x0004
        vdefine force_load_exr_mask    0x0002
        vdefine hold_state_mask        0x0001   
    alias_src  exr_shadow	    [incr counter]
    alias_src  tg_code_addr     [incr counter]
    alias_src  peek_data        [incr counter]
    //alias_src  tg_debug_out	    [incr counter]
    alias_src  bp_status	    [incr counter]
    
:begin
    // put target into reset.
    bus_ctrl = $tg_reset_mask   
    
    // init visor.
    bp3_addr = $bp_disable
    bp2_addr = $bp_disable
    bp1_addr = $bp_disable
    bp0_addr = $bp_disable
    
    // release target reset, to run.
    bus_ctrl = 0

:halt
jmp :halt
    
    // set a breakpoint, wait til it hits.
    bp0_addr = 0x15
:wait_for_bp
    a = 0
    b = bp_status
    nop
    br z :wait_for_bp
    
    // observe a register.
    bus_ctrl = $divert_code_bus_mask
    tg_force = $hold_state_mask
    fetch force_opcode from ([label observe] + 7)
    tg_force = ($hold_state_mask | $force_load_exr_mask)
    tg_force = ($hold_state_mask | $force_exec_mask)
    tg_force = $hold_state_mask
    // target's r7 value is now in peek_data.
    
    // refill target exr so it can resume seamlessly.
    force_opcode = exr_shadow
    tg_force = ($hold_state_mask | $force_load_exr_mask)
    tg_force = 0
    bus_ctrl = 0
    
    // release target to pass breakpoint once.
    bp0_addr = bp0_addr
        
    jmp :wait_for_bp
    
:observe
    // these instructions are assembled in the visor program, but passed to the target to execute.
    alias_dest debug_peek_reg 31
    debug_peek_reg = r0
    debug_peek_reg = r1
    debug_peek_reg = r2
    debug_peek_reg = r3
    debug_peek_reg = r4
    debug_peek_reg = r5
    debug_peek_reg = r6
    debug_peek_reg = r7
    debug_peek_reg = r8
    debug_peek_reg = r9
    debug_peek_reg = r10
    debug_peek_reg = r11
    debug_peek_reg = r12
    debug_peek_reg = r13
    debug_peek_reg = r14
    debug_peek_reg = r15