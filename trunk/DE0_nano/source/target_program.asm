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
    set counter $TOP_GP 
    alias_both rstk                 [incr counter] 
    alias_both leds                 [incr counter] 
    
    alias_both atx_data             [incr counter] 
    alias_both atx_ctrl             [incr counter] 
        vdefine atx_load_mask           0x0001
        vdefine atx_busy_mask           0x0002
        
    alias_both av_writedata	        [incr counter]
    alias_both av_address           [incr counter]
        vdefine jtag_uart_base             0x0100
        vdefine jtag_uart_data ($jtag_uart_base + 0)
        vdefine jtag_uart_ctrl ($jtag_uart_base + 1)
    // alias_both av_ctrl          [incr counter]
    //    vdefine av_write_mask                   0x0001   
    // alias_src  av_waitrequest   [incr counter]
    
    alias_src  keys                 [incr counter]
    
    convention_gpx
    
    :begin    
    leds = 1 
    atx_ctrl = 0 


//patch
    :patch
    a = leds
    b = 1
    nop
    leds = a+b
    
//    b = 65
//    putchar b
    
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

    :msg
    "1234567890abcdef\n\x00"
    
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

// compute the modulus(255) of a number given in a.  return remainder in a.
func mod255
    // while a is greater than 254, subtract 255.
    :mod255_again
    b = 0xfe
    nop
    br gt :mod255_greater
    return
    :mod255_greater
    b = 0xff01
    nop
    a = a+b
    jmp :mod255_again

// set up Fletcher16 checksum algorithm to accumulate in the 2 given register names.
<< proc ::asm_fletcher16_init {lin sum1_reg sum2_reg} {
    set ::asm::fletcher_sum1_reg $sum1_reg
    set ::asm::fletcher_sum2_reg $sum2_reg
    parse3 $::asm::fletcher_sum1_reg = 0 $lin
    parse3 $::asm::fletcher_sum2_reg = 0 \"
} >>

    fletcher16_init g6 g7
    
// accumulate a Fletcher16 checksum in g6 and g7, 
// given the next byte of data in a.    
func fletcher16_input
//patch: need a way to declare summing registers as "static" or "preserve" so they're not auto-stacked.
    b = $fletcher_sum1_reg
    nop
    a = a+b
    call :mod255
    $fletcher_sum1_reg = a
    
    b = $fletcher_sum2_reg
    nop
    a = a+b
    call :mod255
    $fletcher_sum2_reg = a
    return

// return the combined 16-bit result of Fletcher16 checksum in a.    
func fletcher16_result
    a = $fletcher_sum2_reg
    a = a<<4
    a = a<<4
    b = $fletcher_sum1_reg
    nop
    a = or
    return

// routine sends out the low byte from x to the UART.  blocks until the UART accepts the byte.
func putchar_atx

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
    leds = 0b00000100 
    br and0z :pcatx_wait_for_busy

    atx_ctrl = 0 
    return
    