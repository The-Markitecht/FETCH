// #########################################################################
// assembly source code.    
// for debugging supervisor mcu.

    // register file configuration
    vdefine VISOR_NUM_REGS 25
    vdefine VISOR_TOP_REG ($VISOR_NUM_REGS - 1)
    vdefine VISOR_NUM_GP 8
    vdefine VISOR_TOP_GP ($VISOR_NUM_GP - 1)
    vdefine VIO $VISOR_NUM_GP    

    // application-specific register aliases.    
    alias_both g6                   6 
    alias_both g7                   7
    [set visor_num_gp    8]
    [set io $visor_num_gp]
    alias_both bp3_addr	        ($VIO + 3)
    alias_both bp2_addr	        ($VIO + 2)
    alias_both bp1_addr	        ($VIO + 1)
    alias_both bp0_addr	        ($VIO + 0)
        [set bp_disable                 0xffff]
    alias_both force_opcode	    ($VIO + 4)
    alias_both poke_data        ($VIO + 5)
    alias_both av_writedata	    ($VIO + 6)
    alias_both av_address       ($VIO + 7)
        [set jtag_uart_base             0x0100]
            [set jtag_uart_data $jtag_uart_base]
    alias_both bus_ctrl	        ($VIO + 8)
        [set divert_code_bus 	        0x0004]
        [set tg_reset 		            0x0002]
        [set tg_code_ready	            0x0001]
    alias_both tg_force	        ($VIO + 9)
        [set tg_debug_force_exec        0x0004]
        [set tg_debug_force_load_exr    0x0002]
        [set tg_debug_hold              0x0001]    
    alias_both av_ctrl          ($VIO + 10)
        [set av_write                   0x0001]
    
    alias_src  exr_shadow	    ($VIO + 11)
    alias_src  tg_code_addr     ($VIO + 12)
    alias_src  peek_data        ($VIO + 13)
    alias_src  tg_debug_out	    ($VIO + 14)
    alias_src  bp_status	    ($VIO + 15)
    alias_src  av_waitrequest   ($VIO + 16)
    
:begin
    // put target into reset.
    bus_ctrl = $tg_reset
    
// patch
    a = 0
:char
    av_writedata = 67
    av_address = ($jtag_uart_data | $av_write)
:wait1
    b = av_waitrequest
    nop
    bn z :wait1
    av_address = 0
    nop
    nop
    nop
    nop
    av_writedata = 68
    av_address = ($jtag_uart_data | $av_write)
:wait2 
    b = av_waitrequest
    nop
    bn z :wait2 
    av_address = 0
    nop
    nop
    nop
    nop
    av_writedata = 69
    av_address = ($jtag_uart_data | $av_write)
:wait3   
    b = av_waitrequest
    nop
    bn z :wait3 
    av_address = 0
    nop
    nop
    nop
    nop
    jmp :char   

    
    // init visor.
    bp3_addr = $bp_disable
    bp2_addr = $bp_disable
    bp1_addr = $bp_disable
    bp0_addr = $bp_disable
    
    // release target reset, to run.
    bus_ctrl = 0
    
    // set a breakpoint, wait til it hits.
    bp0_addr = 0x15
:wait_for_bp
    a = 0
    b = bp_status
    nop
    br z :wait_for_bp
    
    // observe a register.
    bus_ctrl = $divert_code_bus
    tg_force = $tg_debug_hold
    fetch force_opcode from ([label observe] + 7)
    tg_force = ($tg_debug_hold | $tg_debug_force_load_exr)
    tg_force = ($tg_debug_hold | $tg_debug_force_exec)
    tg_force = $tg_debug_hold
    // target's r7 value is now in peek_data.
    
    // refill target exr so it can resume seamlessly.
    force_opcode = exr_shadow
    tg_force = ($tg_debug_hold | $tg_debug_force_load_exr)
    tg_force = 0
    bus_ctrl = 0
    
    // release target to pass breakpoint once.
    bp0_addr = bp0_addr
    
    // send byte on Avalon.
    av_writedata = peek_data
    av_address = ($jtag_uart_data | $av_write)
    a = 0
:wait_for_slave    
    b = av_waitrequest
    nop
    bn z :wait_for_slave   
    av_address = 0
    
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