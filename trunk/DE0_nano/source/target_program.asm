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
    << set counter $TOP_GP >>
    alias_src  keys                 [incr counter]
    alias_both leds                 [incr counter] 
    alias_both rstk                 [incr counter] 
            
    alias_both av_write_data        [incr counter]
    alias_src  av_read_data	        [incr counter]
    alias_both av_ad_hi             [incr counter]
    alias_both av_ad_lo             [incr counter]
        // all Avalon addresses are BYTE addresses.  all Avalon sizes are in BYTES.
        vdefine32 sdram_base                 0x00000000
        vdefine32 sdram_size                 0x02000000
        // SDRAM notes:
        // - all addresses are BYTE addresses.  all must be divisible by 2, because this
        // system only supports 16-bit word accesses.  writes to an odd-numbered address
        // will be forced to the word boundary instead, overwriting data there.
        vdefine32 jtag_uart_base             0x02000000
        vdefine32 jtag_uart_data_lsw ($jtag_uart_base + 0)
        vdefine32 jtag_uart_data_msw ($jtag_uart_base + 2)
        vdefine32 jtag_uart_ctrl_lsw ($jtag_uart_base + 4)
        vdefine32 jtag_uart_ctrl_msw ($jtag_uart_base + 6)
        // JTAG UART notes:
        // - on read, program MUST test bit 15 of jtag_uart_data_lsw.  jtag uart continues to
        // report the same data byte on subsequent reads when no further data has arrived.
        // bit 15 RVALID = 1 is the only indication of proper data.
        // - reading jtag_uart_data_msw also counts as a FIFO read, causing loss of a data byte,
        // probably because jtag uart has no byteenable wires.
        // - on write, the data is lost if the write FIFO is full.  Avalon is not stalled.
    // alias_both av_ctrl          [incr counter]
    //    vdefine av_write_mask                   0x0001   
    // alias_src  av_waitrequest   [incr counter]
        
    convention_gpx
    
    jmp :main
    
    // register names for use by debugger.
    ([src rstk])
    "\r\n     a"
    "       b"
    "       i"
    "       j"
    "\r\n     x"
    "       y"
    "      g6"
    "      g7"
    "\r\n  keys"
    "    leds"
    
    // libraries
    include lib/string.asm
    include lib/jtag_uart.asm
    include lib/console.asm
    include lib/time.asm
    
    // ////////////////////////////////////////////
    :main
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

    // // Avalon write to JTAG UART. 
    // putasc A
    // putasc B
    // putasc C
    // putasc D
    // putasc E
    // putasc F
    // putasc G
    // putasc H
    // putasc I
    // putasc J
    // putasc K
    // putasc L
    // putasc M
    // putasc N

    // // Avalon read from JTAG UART.
    // :poll_jtag_uart    
    // a = 0x1234
    // call put4x
    // a = 1000
    // call :spinwait
    // putasc "/"    
    // a = 1000
    // call :spinwait
    // av_ad_hi = $jtag_uart_data_lsw_hi
    // av_ad_lo = $jtag_uart_data_lsw_lo
    // a = av_write_data
    // a = av_read_data
    // call put4x
    // a = 1000
    // call :spinwait
    // putasc ","
    // a = 1000
    // call :spinwait
    // av_ad_hi = $jtag_uart_data_msw_hi
    // av_ad_lo = $jtag_uart_data_msw_lo
    // a = av_write_data
    // a = av_read_data
    // call put4x
    // a = 1000
    // call :spinwait
    // putasc ","
    // a = 1000
    // call :spinwait
    // av_ad_hi = $jtag_uart_ctrl_lsw_hi
    // av_ad_lo = $jtag_uart_ctrl_lsw_lo
    // a = av_write_data
    // a = av_read_data
    // call put4x
    // a = 1000
    // call :spinwait
    // putasc ","
    // a = 1000
    // call :spinwait
    // av_ad_hi = $jtag_uart_ctrl_msw_hi
    // av_ad_lo = $jtag_uart_ctrl_msw_lo
    // a = av_write_data
    // a = av_read_data
    // call put4x
    // a = 1000
    // call :spinwait
    // putasc "/"    
    // a = 1000
    // call :spinwait
    // a = 0x5678
    // call put4x
    // a = 1000
    // call :spinwait
    // putasc "\r"
    // putasc "\n"
    // a = 1000
    // call :spinwait    
    // jmp :poll_jtag_uart       
    
    // Avalon write to SDRAM.  
    av_ad_hi = 0
    av_ad_lo = 0x20
    av_write_data = 0x6789
    // Avalon read from SDRAM.  
    a = av_write_data
    a = av_read_data
    call put4x
    a = 1000
    call :spinwait    
    
    :verify_all
    a = 1000
    call :spinwait    
    putasc {-}
    i = 0x200
    j = -1
    nop
    :next_page    
    i = i+j
    av_ad_hi = i

    // fill SDRAM page with a pattern.
    putasc W
    x = 0x0000
    :fill_more
    a = x
    b = 0xffff
    nop
    g6 = xor
    av_ad_hi = i
    av_ad_lo = x
    av_write_data = g6
    y = 2
    nop
    x = x+y
    bn 2z :fill_more
    
    // verify pattern in SDRAM.
    x = 0x0000
    :verify_more
    av_ad_hi = i
    av_ad_lo = x
    g6 = av_write_data
    g6 = av_read_data
    // a = x
    // call put4x
    // putasc "="
    // a = 500
    // call :spinwait        
    // a = g6
    // call put4x
    // putasc "\r"
    // putasc "\n"
    // a = 500
    // call :spinwait     
    a = x
    b = 0xffff
    nop
    a = xor
    b = g6
    nop
    bn eq :sdram_err
    y = 2
    nop
    x = x+y
    bn 2z :verify_more
    
    a = i
    b = 0
    nop
    bn z :next_page
    jmp :verify_all
    
    :sdram_err
    y = a
    a = 1000
    call :spinwait        
    a = g6
    call :put4x
    a = 1000
    call :spinwait            
    putasc "!"
    putasc "="
    a = y
    call :put4x
    a = 1000
    call :spinwait            
    putasc "@"
    a = av_ad_hi
    call :put4x
    a = 1000
    call :spinwait        
    a = av_ad_lo
    call put4x
    :halt
    jmp :halt
    
// :wait_key_press    
    // a = 0x03
    // b = keys
    // nop
    // br eq :wait_key_press
// :wait_key_release   
    // b = keys
    // nop
    // bn eq :wait_key_release
    
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
    
