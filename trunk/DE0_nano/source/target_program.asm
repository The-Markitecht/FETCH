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
    setvar counter $TOP_GP
    alias_src  keys                 [incr counter]
    alias_both leds                 [incr counter] 
    alias_both rstk                 [incr counter] 
    
    alias_both anmux_ctrl           [incr counter] 
        vdefine     anmux_enable_mask       0x0008
            
    alias_both de0nano_adc_ctrl     [incr counter] 
        vdefine     de0nano_adc_csn_mask         0x0004
        vdefine     de0nano_adc_sck_mask         0x0002
        vdefine     de0nano_adc_mo_mask          0x0001
        vdefine     de0nano_adc_mi_mask          0x0001
            
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

    alias_both atx_data             [incr counter] 
    alias_both atx_ctrl             [incr counter] 
        
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
    include lib/my_uart_v2.asm
    include lib/console.asm
    include lib/time.asm
    include lib/de0nano_adc.asm
    
    // ////////////////////////////////////////////
    :main
    
    // pass counter in x.  anmux channel number in i.
    x = 0
    y = 1
    
    :next_pass
    leds = x
    a = x
    call :put4x 
    putasc ":"
    i = 8
    j = -1
    
    :next_anmux
    i = i+j
    putasc " "
    putasc "s"
    b = i
    asc a = "0"
    putchar a+b
    putasc "="
    a = i
    call :anmux_read_chn
    call :put4x
    bn iz :next_anmux
    
    puteol
    a = 900
    call :spinwait
    
    x = x+y
    jmp :next_pass