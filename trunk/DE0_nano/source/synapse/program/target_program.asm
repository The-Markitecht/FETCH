// #########################################################################
// assembly source code.    

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
    alias_both rstk                 [incr counter] 
    alias_both event_priority       [incr counter]
    alias_both soft_event           [incr counter] 
        vdefine     event_controller_reset_bit   15
        vdefine     event_controller_reset_mask  (1 << $event_controller_reset_bit)

    alias_both ustimer0             [incr counter]
    alias_both mstimer0             [incr counter]
        // throttle for each pass of data acquisition.
    alias_both mstimer1             [incr counter]
        // delay for anmux settling.
    
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
        // - any read involves about 7 wait states, occasionally up to 12.  (those are
        // code_ready stalled cycles induced by Altera SDRAM controller through my Avalon-MM master.
        // plus time to e.g. set Avalon addres regs.  measured by scope with 50 MHz synapse sysclk on DE0 Nano).  
        // - evidently no time difference between same-row and other-row reads (SDRAM row=512 words).  
        // - evidently no time difference between first read and sequential burst-read.
        // - any write seems to take about 1 wait state, but is likely to be completing in the 
        // background while the MCU moves on.  accessing again within 5 cycles or so may
        // cause wait states there until SDRAM controller is ready for it.
        // - apparently Altera's claims of SDRAM controller approaching 1 word per clock cycle must be
        // using e.g. Avalon burst transfers or Avalon-ST.  don't think my Avalon-MM master can go that fast.

    alias_both fduart_data          [incr counter] 
    alias_both fduart_status        [incr counter] 
    
    // // I/O expansion bus.
    // alias_both exp                  [incr counter]
    // alias_both exp_addr             [incr counter]
    // vdefine exp_num_regs 32
    // vdefine exp_top_reg ($exp_num_regs - 1)
    // setvar exp_counter -1

    // alias_src  keys                 [incr exp_counter]@exp
    // alias_both leds                 [incr exp_counter]@exp
    
    // alias_both anmux_ctrl           [incr exp_counter]@exp
        // vdefine     anmux_enable_mask       0x0008
        // vdefine     anmux_channel_mask      0x0007

    alias_src  keys                 [incr counter]
    alias_both leds                 [incr counter]
    
    alias_both anmux_ctrl           [incr counter]
        vdefine     anmux_enable_mask       0x0008
        vdefine     anmux_channel_mask      0x0007

    setvar ram_counter $sdram_base
    ram_define ram_daq_pass_cnt     2
        
    setvar err_rx_overflow 0xfffe
    setvar err_tx_overflow 0xfffd
    
    jmp :main
    
    // register names for use by debugger.
    ($counter + 1)
    "       a"
    "       b"
    "       i"
    "       j"
    "       x"
    "       y"
    "      g6"
    "      g7"
    "//  rstk"
    "  ev_pri"
    "softevnt"
    "ustimer0"
    "mstimer0"
    "mstimer1"
    "//adcctl"
    "//avwrdt"
    "av_rd_dt"
    "av_ad_hi"
    "av_ad_lo"
    "//uartdt"
    "uartstat"
    "exp_data"
    "exp_addr"
    
    // libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.
    convention_gpx
    include ../peripheral/driver/fduart.asm
    include ../peripheral/driver/de0nano_adc.asm
    include lib/string.asm
    include lib/console.asm
    include lib/time.asm
    include lib/events.asm

    // #########################################################################
    :main
    
// soft_event = $event_controller_reset_mask
// soft_event = 0
// mstimer0 = 1000
// :waiting
// a = event_priority
// br az :waiting
// event_priority = a
// putasc "."    
// jmp :main
    
    // clear the first 64k of RAM.
    av_ad_hi = 0
    a = 0
    b = 2
    :clear_next_word
    av_ad_lo = a
    av_write_data = 0
    a = ad0
    bn az :clear_next_word
    
    // start handling events.
    soft_event = $event_controller_reset_mask
    soft_event = 0
    mstimer0 = 1000
    jmp :poll_events
        
    // event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.  
    // event 0 not used in this app anyway.
    :event_table    
    ([label :poll_events])
    ([label :uart_rx_handler])
    ([label :uart_rx_overflow_handler])
    ([label :uart_tx_overflow_handler])
    ([label :ustimer0_handler])
    ([label :mstimer0_handler])
    ([label :mstimer1_handler])
    ([label :key0_handler])
    ([label :key1_handler])
    ([label :softevent3_handler])
    ([label :softevent2_handler])
    ([label :softevent1_handler])
    ([label :softevent0_handler])
    
    // #########################################################################

event uart_rx_handler
    // handle data here
end_event
    
event uart_rx_overflow_handler
    error_halt_code $err_rx_overflow
end_event
    
event uart_tx_overflow_handler
    error_halt_code $err_tx_overflow
end_event
    
event ustimer0_handler
end_event

event mstimer0_handler
    // start timer again.
    mstimer0 = 1000
    
    // daq pass counter in RAM.  
    av_ad_hi = 0
    ram_read_lo a = $ram_daq_pass_cnt
    b = 1
    a = a+b
    leds = a
    ram_write_lo $ram_daq_pass_cnt = a
    call :put4x 
    putasc ":"
    
    // acquire & report all anmux channels.
    a = 7
    call :anmux_set_chn
    mstimer1 = 5
end_event

event mstimer1_handler    
    // report a reading from the current anmux channel.
    putasc " "
    putasc "s"
    call :anmux_get_chn
    asc b = "0"
    putchar a+b
    putasc "="
    call :anmux_convert
    call :put4x
    
    // decrement anmux channel & start waiting again.
    call :anmux_get_chn
    br az :all_done
    b = -1
    a = a+b
    call :anmux_set_chn
    mstimer1 = 5
    event_return
    
    // end of daq pass.
    :all_done
    puteol    
end_event
    
event key0_handler
    putasc "k"
    putasc "0"
end_event
    
event key1_handler
    putasc "k"
    putasc "1"
end_event
    
event softevent3_handler
end_event
    
event softevent2_handler
end_event
    
event softevent1_handler
end_event
    
event softevent0_handler
end_event
    
    