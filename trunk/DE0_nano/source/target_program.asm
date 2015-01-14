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
    include lib/de0nano_adc.asm
    
    // ////////////////////////////////////////////
    :main
    jmp :oldmain
    
    puteol
    a = 0
    call :muxtrans
    putasc " "
    a = 1
    call :muxtrans
    putasc " "
    a = 2
    call :muxtrans
// typical output:  0=7=0000010010101010 1=7=0000010010110100 2=7=0000111111111110    
    
    a = 1000
    call :spinwait
    
    jmp :main

// pass anmux channel in a    
func muxtrans
    de0nano_adc_ctrl = ($de0nano_adc_csn_mask | $de0nano_adc_sck_mask)
    b = $anmux_enable_mask
    anmux_ctrl = or    
    asc b = "0"
    putchar a+b
    putasc "="
    // wait for muxer & current driver to settle down.  some delay here is absolutely required (per testing).
    a = 10
    call :spinwait
    a = 7
    call :trans
    rtn
    
// pass ADC channel in a    
func trans
    g6 = a
    a = 0
    call :outbit    
    a = 0
    call :outbit    
    a = g6
    a = a>>1
    a = a>>1
    b = 1
    a = and
    call :outbit    
    a = g6
    a = a>>1
    b = 1
    a = and
    call :outbit    
    a = g6
    b = 1
    a = and
    call :outbit    
    
    // this should be 11 but seems to input a fixed 1-bit after the initial four 0-bits.
    i = 12
    j = -1
    :next_bit
    av_ad_hi = 0
    a = i
    av_ad_lo = a<<1
    a = 0
    call :outbit    
    av_write_data = a
    // count bits    
    i = i+j
    bn iz :next_bit    
    de0nano_adc_ctrl = ($de0nano_adc_csn_mask | $de0nano_adc_sck_mask)
    
    // report
    a = g6
    asc b = "0"
    putchar a+b
    putasc "="
    i = 12
    j = -1
    :next_report
    av_ad_hi = 0
    a = i
    av_ad_lo = a<<1
    a = av_write_data
    a = av_read_data
    asc b = "0"
    putchar a+b
    i = i+j
    bn iz :next_report    
    
    rtn
    
// pass mo bit in a
// returns mi bit in a
func outbit
    // output the msb of mo, along with a low clock phase and low csn.
    g6 = a
    y = -1
    de0nano_adc_ctrl = g6
    x = 6
    :wait1
    x = x+y
    bn xz :wait1
    // output a high clock phase.
    a = g6
    b = $de0nano_adc_sck_mask
    de0nano_adc_ctrl = or
    // sample mi.
    a = de0nano_adc_ctrl    
    // wait about 500 ns (for about 1 Mhz sck) assuming 50 MHz sysclk.
    x = 6
    :wait2
    x = x+y
    bn xz :wait2
    rtn
    
func ""    
    
:oldmain    
    // unit 2 (better built sensor)
    putasc "g"
    putasc "="
    a = 0
    call :anmux_read_chn
    call :put4x
    
    // unit 1 (shoddy built sensor)
    putasc " "
    putasc "b"
    putasc "="
    a = 1
    call :anmux_read_chn
    call :put4x

    // dead channel
    putasc " "
    putasc "n"
    putasc "="
    a = 2
    call :anmux_read_chn
    call :put4x
    
    puteol
    a = 1000
    call :spinwait
    jmp :main