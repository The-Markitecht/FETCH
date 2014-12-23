// #########################################################################
// assembly source code.    
// for debugging supervisor mcu.

    // register file configuration
    vdefine VISOR_NUM_REGS 32
    vdefine VISOR_TOP_REG ($VISOR_NUM_REGS - 1)
    vdefine VISOR_NUM_GP 8
    vdefine VISOR_TOP_GP ($VISOR_NUM_GP - 1)
    vdefine VIO $VISOR_NUM_GP    
    set NUM_GP $VISOR_NUM_GP
    
    // application-specific register aliases.  
    alias_both g6                   6 
    alias_both g7                   7
    set counter $VISOR_TOP_GP
    
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
        vdefine atx_load_mask           0x0001
        vdefine atx_busy_mask           0x0002
        vdefine arx_busy_mask           0x0004

    alias_both m9k_addr         [incr counter] 
    alias_both m9k_data         [incr counter] 
    
    alias_src  exr_shadow	    [incr counter]
    alias_src  tg_code_addr     [incr counter]
    alias_src  peek_data        [incr counter]
    //alias_src  tg_debug_out	    [incr counter]
    alias_src  bp_status	    [incr counter]

    convention_gpx
    
    :begin
    // put target into reset.
//    bus_ctrl = $tg_reset_mask   
    
    // init visor.
    bp3_addr = $bp_disable
    bp2_addr = $bp_disable
    bp1_addr = $bp_disable
    bp0_addr = $bp_disable

    // // UART test character
    // putasc T
    // getchar
    // b = 1
    // nop
    // a = a+b
    // putchar a
    
    :next_load
    
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
    putasc "\r"
    putasc "\n"
    i = i+j
    a = i
    b = x
    nop
    bn eq :loadword
    
    // release target reset, to run.
    putasc R
    bus_ctrl = 0
    jmp :next_load
    
:halt
jmp :halt
    
    // set a breakpoint, wait til it hits.
    bp0_addr = 0x15
    :main_loop
    call :wait_for_bp
    
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
    
func wait_for_bp    
    a = 0
    b = bp_status
    nop
    br z :wait_for_bp
    return
    

// routine sends out the low byte from a to the UART.  blocks until the UART accepts the byte.
func putchar_atx

    x = a

    // wait for UART to be idle (not busy).
    a = $atx_busy_mask
    :pcatx_wait_for_idle
    b = atx_ctrl
    nop
    bn and0z :pcatx_wait_for_idle
    
    // push word to the UART.  its low byte is a character.
    atx_data = x
        
    // can't use the actual register load strobe that occurs here, because it's 
    // much too fast for the UART to sample.
    // instead use a dedicated output word atx_ctrl.
    atx_ctrl = $atx_load_mask
    
    // wait until UART is busy, as acknowledgement.
    a = $atx_busy_mask
    :pcatx_wait_for_busy    
    b = atx_ctrl
    br and0z :pcatx_wait_for_busy

    atx_ctrl = 0 
    return

// routine receives a byte from the UART.  blocks until the UART receives the byte.  
// returns it in the low byte of a.
func getchar_atx
    // wait until UART is busy, then idle.
    a = $arx_busy_mask
    :wait_for_busy    
    b = atx_ctrl
    br and0z :wait_for_busy
    :wait_for_idle
    b = atx_ctrl
    nop
    bn and0z :wait_for_idle
    a = atx_data
    return

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
func put4x
    x = :hexdigits
    
    g6 = a
    b = 0xF000
    nop
    a = and
    a = a>>4
    a = a>>4
    a = a>>4
    call fetch_byte
    putchar a
    
    a = g6
    b = 0x0F00
    nop
    a = and
    a = a>>4
    a = a>>4
    call fetch_byte
    putchar a
    
    a = g6
    b = 0x00F0
    nop
    a = and
    a = a>>4
    call fetch_byte
    putchar a
    
    a = g6
    b = 0x000F
    nop
    a = and
    call fetch_byte
    putchar a
    
    return

    :hexdigits
    "0123456789abcdef"

// pick a byte from an array of words.  fetch & return it in a.
// pass array base address in x, byte offset in a.
func fetch_byte
    b = 1
    nop
    br and0z :pick_byte_even
    a = a>>1
    b = x
    nop
    fetch a from a+b
    a = a>>4
    a = a>>4
    return
    :pick_byte_even    
    a = a>>1
    b = x
    nop
    fetch a from a+b
    return
    