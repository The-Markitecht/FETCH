// #########################################################################
// assembly source code.    
// to write some data on the UART.    

    // application-specific register aliases.    
    alias_dest atx_data 0x8
    alias_dest atx_load 0x9
    alias_src  atx_busy [src in0]
    alias_dest leds 0xa    
    
:begin    
    leds = 0b00000001 
    atx_load = 0 
    
    // using x as pass counter.  shows on LEDs.
    x = 0xff00
    y = -1

    // using i as index into string.
    i = 0
    
    // cache the string limit.
    a = 5
    b = 0xffff
    nop = nop
    g6 = xor
    
:again
    x = x+y
    nop = nop
    a = x
    a = a>>4    
    leds = a>>4

    // fetch a word from test pattern to the UART.  its low byte is a character.
    j = :test_pattern
    nop = nop
    fetch g7 = i+j
    call :putchar

    // increment index & wrap around end of pattern.
    j = 1
    nop = nop
    i = i+j
    j = g6
    nop = nop
    bn 1z :no_wrap
    i = 0
:no_wrap
    
    // repeat forever.
    br always :again        

    
// routine sends out the low byte from g7 to the UART.  blocks until the UART accepts the byte.
:putchar    

    // wait for UART to be idle (not busy).
    a = 1
:wait_for_idle
    b = atx_busy
    nop = nop
    bn and0z :wait_for_idle
    
    // push word to the UART.  its low byte is a character.
    atx_data = g7
        
    // can't use the actual register load strobe that occurs here, because it's 
    // much too fast for the UART to sample.
    // instead use a dedicated output word atx_load.
    atx_load = 1
    
    // wait until UART is busy, as acknowledgement.
    a = 1
:wait_for_busy    
    b = atx_busy
    leds = 0b00000100 
    br and0z :wait_for_busy

    atx_load = 0 
    return
    
    
:test_pattern
    0x55
    0xaa
    0b01000001
    66
    0x0d
    0x0a   
    
:msg
    "testes, testes,\n\t 1...\n\t 2...\n\t 3?? \n\x00"
