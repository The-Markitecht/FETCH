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
    alias_both rstk                 [incr counter] 
    alias_both event_priority       [incr counter]
    alias_both timer0               [incr counter]
    
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
    "//adcctl"
    "  ev_pri"
    " timer_0"
    "av_wr_dt"
    "//avrddt"
    "av_ad_hi"
    "av_ad_lo"
    "atx_data"
    "atx_ctrl"
    "exp_data"
    "exp_addr"
    
    // libraries
    include lib/string.asm
    include lib/my_uart_v2.asm
    include lib/console.asm
    include lib/time.asm
    include lib/de0nano_adc.asm
    
    // ////////////////////////////////////////////
    :main
    
    // // pass counter in x.  anmux channel number in i.
    // x = 0
    // y = 1
    
    // :next_pass
    // leds = x
    // a = x
    // call :put4x 
    // putasc ":"
    // i = 8
    // j = -1
    
    // :next_anmux
    // i = i+j
    // putasc " "
    // putasc "s"
    // b = i
    // asc a = "0"
    // putchar a+b
    // putasc "="
    // a = i
    // call :anmux_read_chn
    // call :put4x
    // bn iz :next_anmux
    
    // puteol
    // a = 900
    // call :spinwait
    
    // x = x+y
    // jmp :next_pass
    
    // //////////////////////////////////////////////////////////
    
    setvar TICKS_PER_SEC 763
    timer0 = $TICKS_PER_SEC
    
    // event loop prototype.
    // first instruction of an event handler should be the 7th cycle after reading its priority from the event controller.
    :poll_events
    // initialize prior to polling loop, for minimum latency.
    b = :event_table
    // 3-cycle polling loop.
    :poll_events_again
    a = event_priority
    br 0z :poll_events_again
    // acknowledge the event to clear its register.  do this right away, 
    // so another occurrence of the same event can be captured right away in the controller.
    event_priority = a
    // compute an address in the event_table.  note the absence of a wait state for the adder here (not needed).
    rtna = ad0
    // jump into the event_table.  each handler MUST end with a end_event.
    // each handler does NOT need to save ANY registers (e.g. no convention_gpx).  they can all be trashed.
    // each handler is passed the event priority in a, in case the same handler is used on multiple priorities.
    swapra = nop
    // just returned here from the handler, in case the handler accidentally did a rtn.  this should NEVER happen.
    :events_error_halt
    jmp :events_error_halt
    
    // event table;  begins with a null handler because that's the event 0 position.  
    // event 0 not used in this app anyway.
    :event_table    
    jmp :poll_events
    jmp :uart_rx_char_handler
    jmp :uart_tx_char_handler
    jmp :key0_handler
    jmp :key1_handler
    jmp :timer0_handler
    
// patch: call event loop as if it were a func, but don't declare it func.
// instead let it jmp to a handler, which does an unmatched rtn?
// no, don't allow handlers to call back to event loop.
    
event uart_rx_char_handler
    // handle data here
end_event
    
event uart_tx_char_handler
    // handle data here
end_event
    
event key0_handler
    // handle data here
end_event
    
event key1_handler
    // handle data here
end_event
    
event timer0_handler
    timer0 = $TICKS_PER_SEC
    a = leds
    b = 1
    leds = a+b
end_event
    
    