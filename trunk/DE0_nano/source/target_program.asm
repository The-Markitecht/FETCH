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
            
    set console_driver jtag
    alias_both av_data    	        [incr counter]
    alias_both av_ad_hi             [incr counter]
    alias_both av_ad_lo             [incr counter]
        // all Avalon addresses are BYTE addresses.  all Avalon sizes are in BYTES.
        vdefine32 sdram_base                 0x00000000
        vdefine32 sdram_size                 0x02000000
        vdefine32 jtag_uart_base             0x02000000
        vdefine32 jtag_uart_data_lsw ($jtag_uart_base + 0)
        vdefine32 jtag_uart_data_msw ($jtag_uart_base + 2)
        vdefine32 jtag_uart_ctrl_lsw ($jtag_uart_base + 4)
        vdefine32 jtag_uart_ctrl_msw ($jtag_uart_base + 6)
    // alias_both av_ctrl          [incr counter]
    //    vdefine av_write_mask                   0x0001   
    // alias_src  av_waitrequest   [incr counter]
    
    alias_src  keys                 [incr counter]
    
    convention_gpx
    
    :begin    
    leds = 1 
    // atx_ctrl = 0 

    // a = 65
    // push a
    // a = 66
    // push a
    // a = 67
    // push a
    // a = 68
    // push a
    // a = 69
    // push a
    
    // pop b
    // putchar b
    // pop b
    // putchar b
    // pop b
    // putchar b
    // pop b
    // putchar b
    // pop b
    // putchar b
    
    // a = 0x1234
    // call put4x

    // x = 0x1234
    // y = 1
    // a = 0
    // :nextwrite
    // m9k_addr = a
    // m9k_data = x
    // x = x+y
    // b = 1
    // nop
    // a = a+b
    // b = 1024
    // nop
    // br lt :nextwrite    
    
//patch
    x = 0
    y = 1
    :patch

    a = leds
    b = 1
    nop
    leds = a+b

    // Avalon write to JTAG UART. 
    putasc A
    putasc B
    putasc C

    // Avalon read from JTAG UART.
    :poll_jtag_uart
    a = 1000
    call :spinwait
    
    a = 0x1234
    call put4x
    a = 1000
    call :spinwait
    putasc "/"    
    a = 1000
    call :spinwait
    av_ad_hi = $jtag_uart_data_lsw_hi
    av_ad_lo = $jtag_uart_data_lsw_lo
    a = av_data
    call put4x
    a = 1000
    call :spinwait
    putasc ","
    a = 1000
    call :spinwait
    av_ad_hi = $jtag_uart_data_msw_hi
    av_ad_lo = $jtag_uart_data_msw_lo
    a = av_data
    call put4x
    a = 1000
    call :spinwait
    putasc ","
    a = 1000
    call :spinwait
    av_ad_hi = $jtag_uart_ctrl_lsw_hi
    av_ad_lo = $jtag_uart_ctrl_lsw_lo
    a = av_data
    call put4x
    a = 1000
    call :spinwait
    putasc ","
    a = 1000
    call :spinwait
    av_ad_hi = $jtag_uart_ctrl_msw_hi
    av_ad_lo = $jtag_uart_ctrl_msw_lo
    a = av_data
    call put4x
    a = 1000
    call :spinwait
    putasc "/"    
    a = 1000
    call :spinwait
    a = 0x5678
    call put4x
    a = 1000
    call :spinwait
    putasc "\r"
    putasc "\n"
    
    jmp :poll_jtag_uart
    
    
    // Avalon write to SDRAM.  triggered by av_ad_lo.
    av_data = 0x6789
    av_ad_hi = 0
    av_ad_lo = 0x20
    // clear av_data so we can recognize if it doesn't get filled.
    av_data = 0
    // Avalon read from SDRAM.  triggered by av_ad_lo.
    a = av_ad_lo
    leds = av_data
    
:wait_key_press    
    a = 0x03
    b = keys
    nop
    br eq :wait_key_press
:wait_key_release   
    b = keys
    nop
    bn eq :wait_key_release
    
    // getchar
    // b = 1
    // nop
    // putchar a+b

    // b = 85
    // putchar b

    // x = x+y
    // nop
    // a = x
    // call put4x
    
    a = 100
    call :spinwait
    
    // b = 32
    // putchar b
    // m9k_addr = x
    // a = m9k_data
    // call put4x
    
    // b = 13
    // putchar b
    // b = 10
    // putchar b
    
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
//    putchar a
    
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
        