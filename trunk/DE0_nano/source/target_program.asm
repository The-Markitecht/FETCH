// #########################################################################
// assembly source code.    
// to write some data on the UART.    

    // register file configuration
    vdefine NUM_REGS 32
    vdefine TOP_REG ($NUM_REGS - 1)
    vdefine NUM_GP 8
    vdefine TOP_GP ($NUM_GP - 1)
    vdefine IO $NUM_GP

    // application-specific register aliases.    
    alias_both g6                   6 
    alias_both g7                   7
    [set counter $TOP_GP]
    alias_both leds                 [incr counter] 
    alias_both av_writedata	    [incr counter]
    alias_both av_address       [incr counter]
        vdefine jtag_uart_base             0x0100
            vdefine jtag_uart_data ($jtag_uart_base + 0)
            vdefine jtag_uart_ctrl ($jtag_uart_base + 1)
    alias_both av_ctrl          [incr counter]
        vdefine av_write_mask                   0x0001   
    alias_src  av_waitrequest   [incr counter]
    alias_src  keys             [incr counter]
    
:begin    

    leds = 2
:patch
    a = leds
    b = 1
    nop
    leds = a+b
    g7 = 100
    call :spinwait    
    jmp :patch


    leds = 1 
    
    // using i as index into string.
    i = 0
    
    // cache the string limit in g6.
    a = 16
    b = 0xffff
    nop
    g6 = xor
    
:again
    // // wait for keypress.
// :wait_key_press    
    // a = 0
    // b = keys
    // nop
    // br z :wait_key_press
// :wait_key_release   
    // b = keys
    // nop
    // bn z :wait_key_release
    
    g7 = 100
    call :spinwait
    
    // increment LEDs
    a = leds
    b = 1
    nop
    leds = a+b
    
    // fetch a word from test pattern to the UART.  its low byte is a character.
    j = :msg
    nop
    fetch g7 from i+j
    call :putchar
    
    // increment index & wrap around end of pattern.
    j = 1
    nop
    i = i+j
    j = g6
    nop
    bn 1z :no_wrap
    i = 0
:no_wrap
    
    // repeat forever.
    jmp :again        

    
// routine sends out the low byte from g7 to the UART.  blocks until the UART accepts the byte.
:putchar    
    av_writedata = g7
    av_address = $jtag_uart_data
    av_ctrl = $av_write_mask
    a = 0
:wait_for_slave    
    b = av_waitrequest
    nop
    bn z :wait_for_slave   
    av_ctrl = 0
    return

// routine waits a number of milliseconds given in g7.    
:spinwait
:spinwait_outer
    x = 12500
    y = -1
    nop
:spinwait_inner
    x = x+y
    nop
    bn 2z :spinwait_inner
    x = g7
    nop
    g7 = x+y
    bn 2z :spinwait_outer    
    return
        
:msg
    "1234567890abcdef\n\x00"
