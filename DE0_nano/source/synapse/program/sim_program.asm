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
    // beyond top_populated_ext_reg the external address space is stubbed as "don't care" values by the Synapse core.
    // that doesn't affect operator results and other addresses implemented internally by the Synapse core.
    vdefine num_populated_ext_regs 48
    vdefine top_populated_ext_reg ($num_populated_ext_regs - 1)
    vdefine num_gp 18
    vdefine top_gp ($num_gp - 1)

    // application-specific register aliases.    
    alias_both ga                   6               "ga"
    alias_both gb                   7               "gb"
    alias_both gc                   8               "gc"
    alias_both gd                   9               "gd"
    alias_both ge                   10              "ge"
    alias_both gf                   11              "gf"
    alias_both accel_dir            12              "aceldir"
    alias_both puffing              13              "puffing"
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

    setvar     adc_num_channels        8
    setvar     anmux_adc_channel       7
    alias_both adc0                 [incr counter]  "adc0"
    alias_both adc1                 [incr counter]  "adc1"
    alias_both adc2                 [incr counter]  "adc2"
    alias_both adc3                 [incr counter]  "adc3"
    alias_both adc4                 [incr counter]  "//adc4"
        alias_both adc_maf          [dest adc4]     "adcmaf"
    alias_both adc5                 [incr counter]  "//adc5"
        alias_both adc_o2           [dest adc5]     "adco2"
    alias_both adc6                 [incr counter]  "//adc6"
        alias_both adc_tps          [dest adc6]     "adctps"
    alias_both adc7                 [incr counter]  "//adc7"
        alias_both adc_anmux        [dest adc7]     "adcmux"
    
    setvar     anmux_num_channels      8
    alias_both anmux0               [incr counter]  "anmux0"
    alias_both anmux1               [incr counter]  "anmux1"
    alias_both anmux2               [incr counter]  "//anmux2"
        alias_both anmux_block_temp [dest anmux2]   "anblock"
    alias_both anmux3               [incr counter]  "//anmux3"
        alias_both anmux_trans_temp [dest anmux3]   "antrans"
    alias_both anmux4               [incr counter]  "anmux4"
    alias_both anmux5               [incr counter]  "anmux5"
    alias_both anmux6               [incr counter]  "anmux6"
    alias_both anmux7               [incr counter]  "anmux7"

    //alias_both code_write_addr      [incr counter]  "//cdwrad"
    //alias_both code_write_data      [incr counter]  "//cdwrdt"

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

<<
    proc send_tkn {lin addr} {
        parse "
            a = $addr
            call print_nt
            puteol
        "
    }
>>
            
    // #########################################################################
    :main  
    
    // keep the real hardware occupied and powered up during testing.
    power_duty = $power_duty_holding
    
    // signal boot-up
    send_tkn :boot_msg
    
    // set up event capture logic.
    puffing = 0
    
    // set up an engine running state.
    ign_period = ([rpm_to_jf 1000])  
    accel_dir = 1
    mstimer0 = 1
    
    // start handling events.
    soft_event = $event_controller_reset_mask
    soft_event = 0
    jmp :poll_events
        
    // event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.  
    // event 0 not used in this app anyway.
    :event_table    
    ([label :poll_events])
    ([label :ustimer0_handler])
    ([label :ign_pulse_done_handler])
    ([label :puff1_capture_handler])
    ([label :spi_done_handler])
    ([label :mstimer0_handler])
    ([label :puff1_timeout_handler])
    ([label :uart_rx_handler])
    ([label :uart_rx_overflow_handler])
    ([label :uart_tx_overflow_handler])
    ([label :softevent3_handler])
    ([label :softevent2_handler])
    ([label :softevent1_handler])
    ([label :softevent0_handler])
    
    // #########################################################################

:start_puffing_tkn
    "pufon"
    
event puff1_capture_handler
    a = puff1cnt
    a = a>>4
    //if a eq 0 {
        //a = puff1cnt
        //call put4x
        //putasc { }
        //a = puff1len
        //call put4x
        //puteol
    //}
    if puffing eq 0 {
        puffing = 1
        send_tkn :start_puffing_tkn
    }
end_event

:stop_puffing_tkn
    "pufof"

event puff1_timeout_handler
    if puffing eq 1 {
        puffing = 0
        send_tkn :stop_puffing_tkn
    }
end_event

event ign_pulse_done_handler
end_event

event ustimer0_handler
end_event

event mstimer0_handler
    a = ign_period
    b = accel_dir
    ign_period = a+b
    if ign_period gt ([rpm_to_jf 1000]) {
        accel_dir = -1
    }
    if ign_period lt ([rpm_to_jf 5000]) {
        accel_dir = 1
    }
    mstimer0 = 1
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

