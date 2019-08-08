// #########################################################################
// assembly source code.    

//TODO: tokenize all input conditions.  
// continuously send the token stream up to the PC for buffering, reassembly, and pattern matching.
// format a token as words separated by spaces, ending in a newline.
// PC pass those directly to a Tcl interp?  easy to track test state that way, effectively operating
// state machines in Tcl.  that goes against pattern matching by regex.
// might be needed instead of regex due to pattern complexity.  surely will accelerate the
// development by giving specific error messages, instead of leaving me to guess and troubleshoot 
// a regex at each test failure.
// include timestamp as first parm of each token.  8 hex digit us linear.  that's 71 minutes range.
// simulator input script should be similar.
// offer commands to enable/disable reporting of individual tokens, to limit bulk of output overwhelming uarts.

    jmp :main

    declare_system_dimensions
    
    // register file configuration.
    vdefine num_regs 48
    vdefine top_reg ($num_regs - 1)
    vdefine num_gp 18
    vdefine top_gp ($num_gp - 1)

    // application-specific register aliases.    
    alias_both ga                   6               "ga"
    alias_both gb                   7               "gb"
    alias_both gc                   8               "gc"
    alias_both gd                   9               "gd"
    alias_both ge                   10              "ge"
    alias_both gf                   11              "gf"
    alias_both gg                   12              "gg"
    alias_both gh                   13              "gh"
    alias_both pa                   14              "pa"
    alias_both pb                   15              "pb"
    alias_both pc                   16              "pc"
    alias_both pd                   17              "pd"
    setvar counter $top_gp    
    alias_both rstk                 [incr counter]  "//rstk"

    alias_both event_priority       [incr counter]  "ev_pri"
    alias_both soft_event           [incr counter]  "softevnt"
        vdefine     event_controller_reset_bit   15
        vdefine     event_controller_reset_mask  (1 << $event_controller_reset_bit)

    alias_both timestamp_lo         [incr counter]  "stamplo"
    alias_both timestamp_hi         [incr counter]  "stamphi"
    alias_both timestamp_compare_lo [incr counter]  "stampclo"
    alias_both timestamp_compare_hi [incr counter]  "stampchi"

    alias_both ustimer0             [incr counter]  "ustimer0"
    alias_both mstimer0             [incr counter]  "mstimer0"

    alias_both power_duty           [incr counter]  "pwr_duty"
        // power relay duty cycles, in microseconds.  duty cycle time = relay OFF time.
        // relay actually remains energized for about another 5 us after pwm goes high,
        // due to the optocoupler pullup taking some time to climb through the MOSFET's threshold.
        setvar power_duty_min                   0
        setvar power_duty_max                   50
        setvar power_duty_closing               $power_duty_min
        setvar power_duty_opening               $power_duty_max
        setvar power_duty_holding               (int($power_duty_max / 2))
        setvar power_lost_mask                  0x0040
        setvar ign_switch_off_mask              0x0080

    alias_both ign_period           [incr counter]  "ignperd"
    alias_both ign_cycle_cnt        [incr counter]  "igncycnt"

    alias_both puff1cnt             [incr counter]  "pf1cnt"
    alias_src  puff1len             [incr counter]  "pf1len"
                
    alias_both spi_data             [incr counter]  "spi_data"
    
    alias_both code_write_addr      [incr counter]  "//cdwrad"
    alias_both code_write_data      [incr counter]  "//cdwrdt"

    alias_both fduart_data          [incr counter]  "//uartdt"
    alias_both fduart_status        [incr counter]  "uartstat"
    
    alias_both leds                 [incr counter]  "leds"
    
    emit_debugger_register_table  counter

    // error code constants.
    setvar err_rx_overflow              0xfffe
    setvar err_tx_overflow              0xfffd
    
    // string resources
    :boot_msg
        "SIM\r\n\x0"
    
    // libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.
    convention_formal
    include ../peripheral/driver/event_controller.asm
    include ../peripheral/driver/fduart.asm
    include lib/console.asm
    include lib/string.asm
    setvar fletcher_sum1_reg pc
    setvar fletcher_sum2_reg pd
    include lib/fletcher.asm
        
    // #########################################################################
    :main  
    a = :boot_msg
    call :print_nt 
    
    // keep the real hardware occupied and powered up during testing.
    power_duty = $power_duty_holding
    
    // set up an engine running state.
    ign_period = 700
    
    // start handling events.
    soft_event = $event_controller_reset_mask
    soft_event = 0
    jmp :poll_events
        
    // event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.  
    // event 0 not used in this app anyway.
    :event_table    
    ([label :poll_events])
    ([label :puff1_capture_handler])
    ([label :ustimer0_handler])
    ([label :spi_done_handler])
    ([label :mstimer0_handler])
    ([label :uart_rx_handler])
    ([label :uart_rx_overflow_handler])
    ([label :uart_tx_overflow_handler])
    ([label :softevent3_handler])
    ([label :softevent2_handler])
    ([label :softevent1_handler])
    ([label :softevent0_handler])
    
    // #########################################################################
    
event puff1_capture_handler
    a = puff1cnt
    a = a>>4
    if a eq 0 {
        a = puff1cnt
        call put4x
        putasc { }
        a = puff1len
        call put4x
        puteol
    }
end_event

event ustimer0_handler
end_event

event mstimer0_handler
end_event

func parse_key {key in pa} {
}
    
event uart_rx_handler
    :again
        pollchar
        x = a
        if x eq -1 {
            event_return
        }                        
        callx  parse_key  x
    jmp :again
end_event

event uart_rx_overflow_handler
    error_halt_code $err_rx_overflow
end_event
    
:tx_overflow_msg
    "TXO\x0"
    
event uart_tx_overflow_handler
    // error_halt_code $err_tx_overflow
end_event    
    
event softevent3_handler
end_event
    
event softevent2_handler
end_event
    
event softevent1_handler
end_event
    
event softevent0_handler
end_event

event spi_done_handler
end_event

