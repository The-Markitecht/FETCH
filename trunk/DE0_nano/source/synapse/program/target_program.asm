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

    alias_both ustimer0             [incr counter]
    alias_both mstimer0             [incr counter]
    
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

    alias_both fduart_data          [incr counter] 
    alias_both fduart_status        [incr counter] 
    
    // I/O expansion bus.
    alias_both exp                  [incr counter]
    alias_both exp_addr             [incr counter]
    vdefine EXP_NUM_REGS 32
    vdefine EXP_TOP_REG ($EXP_NUM_REGS - 1)
    setvar exp_counter -1

    alias_src  keys                 [incr exp_counter]@exp
    alias_both leds                 [incr exp_counter]@exp
    
    alias_both anmux_ctrl           [incr exp_counter]@exp
        vdefine     anmux_enable_mask       0x0008
        
    setvar ERR_RX_OVERFLOW 0xfffe
    setvar ERR_TX_OVERFLOW 0xfffd

    convention_gpx
    
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
    "//adcctl"
    "av_wr_dt"
    "//avrddt"
    "av_ad_hi"
    "av_ad_lo"
    "//uartdt"
    "uartstat"
    "exp_data"
    "exp_addr"
    
    // libraries
    include ../peripheral/driver/fduart.asm
    include ../peripheral/driver/de0nano_adc.asm
    include lib/string.asm
    include lib/console.asm
    include lib/time.asm
    
    // #########################################################################
    :main
    
    mstimer0 = 1000

    soft_event = 0
    event_priority = 0
    event_priority = 1
    event_priority = 2
    event_priority = 3
    event_priority = 4
    event_priority = 5
    event_priority = 6
    event_priority = 7
    event_priority = 8
    event_priority = 9
    event_priority = 10
    event_priority = 11
    event_priority = 12
    event_priority = 13
    event_priority = 14
    event_priority = 15
    
    // event loop.
    // first instruction of an event handler should be the 7th cycle after reading its priority from the event controller.
    :poll_events
    // initialize prior to polling loop, for minimum latency.
    b = :event_table
    // 3-cycle polling loop.
    :poll_events_again
    a = event_priority
    br 0z :poll_events_again
    // acknowledge the event to clear its capture register.  do this right away, 
    // so another occurrence of the same event can be captured right away in the controller.
    event_priority = a
    // compute an address in the event_table.  note the absence of a wait state for the adder here (not needed).
    fetch rtna from ad0
    // jump to the address given in the event_table.  each handler MUST end with a end_event.
    // each handler does NOT need to save ANY registers (e.g. no convention_gpx).  they can all be trashed.
    // each handler is passed the event priority in a, in case the same handler is used on multiple priorities.
    swapra = nop    
    // just returned here from the handler, in case the handler accidentally did a rtn.  this should NEVER happen.
    :error_halt
    jmp :error_halt
    
    // event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.  
    // event 0 not used in this app anyway.
    :event_table    
    ([label :poll_events])
    ([label :uart_rx_handler])
    ([label :uart_rx_overflow_handler])
    ([label :uart_tx_overflow_handler])
    ([label :ustimer0_handler])
    ([label :mstimer0_handler])
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
    leds = $ERR_RX_OVERFLOW
    jmp :error_halt
end_event
    
event uart_tx_overflow_handler
    leds = $ERR_TX_OVERFLOW
    jmp :error_halt
end_event
    
event ustimer0_handler
end_event

event mstimer0_handler
    // start timer again.
    mstimer0 = 1000
    
    // pass counter in leds.  
    a = leds
    b = 1
    a = a+b
    leds = a
    call :put4x 
    putasc ":"
    
    // acquire & report all anmux channels.
    // anmux channel number in i.
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
    
    