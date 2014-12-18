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
    alias_both rstk                 [incr counter] 
    alias_both leds                 [incr counter] 
    alias_both av_writedata	    [incr counter]
    alias_both av_address       [incr counter]
        vdefine jtag_uart_base             0x0100
        vdefine jtag_uart_data ($jtag_uart_base + 0)
        vdefine jtag_uart_ctrl ($jtag_uart_base + 1)
    // alias_both av_ctrl          [incr counter]
    //    vdefine av_write_mask                   0x0001   
    // alias_src  av_waitrequest   [incr counter]
    alias_src  keys             [incr counter]
    
    convention_gpx
    
:begin    
    leds = 1 


:patch
    a = leds
    b = 1
    nop
    leds = a+b
    
    b = 65
    putchar b
    
    x = 65000
    y = -1
    nop
:wait3
    x = x+y
    nop
    bn 2z :wait3

    jmp :patch

    
    
    
    
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
    
    a = 100
    call :spinwait
    
    // increment LEDs
    a = leds
    b = 1
    nop
    leds = a+b
    
    // fetch a word from test pattern to the UART.  its low byte is a character.
    j = :msg
    nop
    fetch a from i+j
    putchar a
    
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

// routine waits a number of milliseconds given in a.    
func spinwait
    b = -1
:spinwait_outer
    x = 12500
    y = -1
    nop
:spinwait_inner
    x = x+y
    nop
    bn 2z :spinwait_inner
    a = a+b
    nop
    bn z :spinwait_outer    
    return
        
:msg
    "1234567890abcdef\n\x00"

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
    call pick_byte
    putchar a
    
    a = g6
    b = 0x0F00
    nop
    a = and
    a = a>>4
    a = a>>4
    call pick_byte
    putchar a
    
    a = g6
    b = 0x00F0
    nop
    a = and
    a = a>>4
    call pick_byte
    putchar a
    
    a = g6
    b = 0x000F
    nop
    a = and
    call pick_byte
    putchar a
    
    return

// pick a byte from an array of words.  fetch & return it in a.
// pass array base address in x, byte offset in a.
func pick_byte
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
    
:hexdigits
    "0123456789abcdef"
    
        