// #########################################################################
// assembly source code.    
// for debugging supervisor mcu.

    // register file configuration
    vdefine VISOR_NUM_REGS 32
    vdefine VISOR_TOP_REG ($VISOR_NUM_REGS - 1)
    vdefine VISOR_NUM_GP 8
    vdefine VISOR_TOP_GP ($VISOR_NUM_GP - 1)
    vdefine VIO $VISOR_NUM_GP    
    setvar NUM_GP $VISOR_NUM_GP
    
    // application-specific register aliases.  
    alias_both g6                   6 
    alias_both g7                   7
    setvar counter $VISOR_TOP_GP
    
    alias_both rstk                 [incr counter] 
    
    alias_both bp0_addr	        [incr counter]
    alias_both bp1_addr	        [incr counter]
    alias_both bp2_addr	        [incr counter]
    alias_both bp3_addr	        [incr counter]
        vdefine bp_disable                 0xffff
    alias_both force_opcode	    [incr counter]
    alias_both poke_data        [incr counter]
    alias_both bus_ctrl	        [incr counter]
        vdefine bp_step_mask 	                0x0008
        vdefine divert_code_bus_mask 	        0x0004
        vdefine tg_reset_mask 		            0x0002
        vdefine tg_code_ready_mask	            0x0001
    alias_both tg_force	        [incr counter]
        vdefine force_exec_mask        0x0004
        vdefine force_load_exr_mask    0x0002
        vdefine hold_state_mask        0x0001   
        
    alias_both atx_data             [incr counter] 
    alias_both atx_ctrl             [incr counter] 

    alias_both m9k_addr         [incr counter] 
    alias_both m9k_data         [incr counter] 
    
    alias_src  exr_shadow	    [incr counter]
    alias_src  tg_code_addr     [incr counter]
    alias_src  peek_data        [incr counter]
    //alias_src  tg_debug_out	    [incr counter]
    alias_src  bp_status	    [incr counter]

    convention_gpx
    
    jmp :main
    
    include lib/string.asm
    include lib/my_uart_v2.asm
    include lib/console.asm
    include lib/time.asm

    // ////////////////////////////////////////////
    :main
    // put target into reset.
    bus_ctrl = $tg_reset_mask   
    
    // init visor.
    bp3_addr = $bp_disable
    bp2_addr = $bp_disable
    bp1_addr = $bp_disable
    bp0_addr = $bp_disable

    putasc "V"
    putasc "I"
    putasc "S"
    putasc "O"
    putasc "R"
    
    //call :load_program
    
    // step into the first target instruction.
    bus_ctrl = $bp_step_mask
    call :wait_for_bp

// :runagain
// // release target reset, to run.
// bus_ctrl = 0   
// bp0_addr = bp0_addr
// a = 1000
// call :spinwait
// bus_ctrl = $bp_step_mask
// call :wait_for_bp
// call :dump_target
// a = tg_code_addr
// call :put4x
// putasc ","
// a = exr_shadow
// call :put4x
// putasc " "
// putasc ">"
// getchar
// a = 1000
// call :spinwait
// jmp :runagain

    // command prompt loop.
    :cmd_loop
    a = bus_ctrl
    b = 0
    br eq :nodump
    call :dump_target
    a = tg_code_addr
    call :put4x
    putasc ","
    a = exr_shadow
    call :put4x
    jmp :prompt_done
    :nodump
    putasc "R"
    putasc "U"
    putasc "N"
    :prompt_done
    putasc " "
    putasc ">"
    getchar
    
    // command = step next instruction.
    asc b = "n"
    bn eq :skip_step
    bus_ctrl = $bp_step_mask
    bp0_addr = bp0_addr
    call :wait_for_bp
    jmp :cmd_loop
    :skip_step
    
    // command = reset target.
    asc b = "R"
    bn eq :skip_reset
    bus_ctrl = $tg_reset_mask   
    nop
    nop
    bus_ctrl = $bp_step_mask
    call :wait_for_bp
    jmp :cmd_loop
    :skip_reset

    // command = load program.
    asc b = "l"
    bn eq :skip_load
    call :load_program
    jmp :cmd_loop
    :skip_load

    // command = run full speed.
    asc b = "r"
    bn eq :skip_run
    // release target reset, to run.
    bus_ctrl = 0   
    bp0_addr = bp0_addr
    jmp :cmd_loop
    :skip_run

    // // command = interrupt / break target.
    // asc b = "i"
    // bn eq :skip_brk
    // bus_ctrl = 0   
    // bus_ctrl = $bp_step_mask
    // call :wait_for_bp
    // jmp :cmd_loop
    // :skip_brk

    // command = set breakpoint.
    asc b = "b"
    bn eq :skip_setbrk
    call :set_bp
    jmp :cmd_loop
    :skip_setbrk

    putasc "?"
    puteol
    jmp :cmd_loop
    
    // demonstrations //////////////////////////////

    // set a breakpoint, wait til it hits.
    bp0_addr = 0x15
    :main_loop
    call :wait_for_bp

    // release target to run full speed.
    bus_ctrl = 0
    
    // interrupt the target and single step it a few times.
    bus_ctrl = $bp_step_mask
    call :wait_for_bp
    bp0_addr = bp0_addr
    call :wait_for_bp
    bp0_addr = bp0_addr
    call :wait_for_bp
    bp0_addr = bp0_addr
    call :wait_for_bp
    bus_ctrl = 0   
    
    // release target to pass breakpoint once.
    bp0_addr = bp0_addr
        
    jmp :main_loop
    
func wait_for_bp    
    a = 0
    b = bp_status
    br z :wait_for_bp
    rtn
    
func set_bp
    getchar
    x = a
    getchar
    asc b = "="
    bn eq :fail
    call :get4x
    y = a
    a = 0
    bn eq :fail
    a = x
    b = 0
    br eq :b0
    b = 1
    br eq :b1
    b = 2
    br eq :b2
    b = 3
    br eq :b3
    jmp :fail
    :b0
    bp0_addr = y
    rtn
    :b1
    bp1_addr = y
    rtn
    :b2
    bp2_addr = y
    rtn
    :b3
    bp3_addr = y
    rtn
    :fail
    putasc "?"
    puteol
    rtn
    
func load_program
    // load target program from UART.
    // length, little-endian.  memorize in x.
    putasc L
    get16 x
    a = x
    call put4x
    // put target into reset again, in case this is a target warm boot.
    bus_ctrl = $tg_reset_mask   
    // load opcodes.  count up address in i.
    i = 0
    j = 1
    :loadword
    putasc A
    a = i
    call put4x
    putasc "="
    get16 g6
    a = g6
    call put4x
    putasc "="
    m9k_addr = i
    m9k_data = g6
    a = m9k_data
    call put4x
    puteol
    i = i+j
    a = i
    b = x
    bn eq :loadword
    rtn

// observe a register.  return its value in peek_data.
// pass its register address in a.
func peek
    b = 0x3ff
    nop
    a = and
    // debug_peek_reg = 31 << 10
    b = 0x7c00
    nop
    force_opcode = or
    bus_ctrl = $divert_code_bus_mask
    tg_force = $hold_state_mask
    tg_force = ($hold_state_mask | $force_load_exr_mask)
    tg_force = ($hold_state_mask | $force_exec_mask)
    tg_force = $hold_state_mask
    // target's register value is now in peek_data.    
    // refill target exr so it can resume seamlessly.
    force_opcode = exr_shadow
    tg_force = ($hold_state_mask | $force_load_exr_mask)
    tg_force = 0
    rtn
    
// show target status display.
func dump_target
    puteol
    i = 0
    :next_reg
    // fetch register name from table in target program.
    x = 0
    y = 1
    :next_chars
    a = i
    a = a<<1
    a = a<<1
    b = 3
    nop    
    a = a+b
    b = x
    nop
    m9k_addr = a+b
    putchar m9k_data
    a = m9k_data
    a = a>>4
    a = a>>4
    putchar a
    x = x+y
    a = x
    b = 4
    bn eq :next_chars    
    putasc "="
    a = i
    call :peek
    a = peek_data
    call :put4x
    putasc " "
    j = 1
    nop
    i = i+j
    // loop up to the number of registers in the target program's register name table.
    m9k_addr = 2
    b = m9k_data
    a = i
    bn eq :next_reg
    puteol
    rtn