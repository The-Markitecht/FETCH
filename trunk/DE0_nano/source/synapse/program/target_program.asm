// #########################################################################
// assembly source code.    

    // register file configuration
    vdefine NUM_REGS 32
    vdefine TOP_REG ($NUM_REGS - 1)
    vdefine NUM_GP 8
    vdefine TOP_GP ($NUM_GP - 1)
    vdefine IO $NUM_GP

    // application-specific register aliases.    
    alias_both g6                   6               "g6"
    alias_both g7                   7               "g7"
    setvar counter $TOP_GP    
    alias_both rstk                 [incr counter]  "//rstk"
    alias_both event_priority       [incr counter]  "ev_pri"
    alias_both soft_event           [incr counter]  "softevnt"
        vdefine     event_controller_reset_bit   15
        vdefine     event_controller_reset_mask  (1 << $event_controller_reset_bit)
    alias_both usage_count          [incr counter]  "usage"

    alias_both ustimer0             [incr counter]  "ustimer0"
    alias_both mstimer0             [incr counter]  "mstimer0"
        // throttle for each pass of data acquisition.
    alias_both mstimer1             [incr counter]  "mstimer1"
        // delay for anmux settling.
                
    alias_both spi_data             [incr counter]  "spi_data"
    
    alias_both av_write_data        [incr counter]  "//avwrdt"
    alias_src  av_read_data	        [incr counter]  "av_rd_dt"
    alias_both av_ad_hi             [incr counter]  "av_ad_hi"
    alias_both av_ad_lo             [incr counter]  "av_ad_lo"
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

    alias_both fduart_data          [incr counter]  "//uartdt"
    alias_both fduart_status        [incr counter]  "uartstat"
    
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

    alias_src  keys                 [incr counter]  "keys"
    alias_both leds                 [incr counter]  "leds"
    
    alias_both anmux_ctrl           [incr counter]  "anmux"
        vdefine     anmux_enable_mask       0x0008
        vdefine     anmux_channel_mask      0x0007
        setvar      anmux_adc_channel       7
        setvar      anmux_settle_ms         5
        setvar      anmux_num_discards      2
        
    alias_both power_duty           [incr counter]  "pwr_duty"
        // power relay duty cycles, in microseconds.  duty cycle time = relay OFF time.
        setvar power_duty_min                   0
        setvar power_duty_max                   50
        setvar power_duty_closing               $power_duty_min
        setvar power_duty_opening               $power_duty_max
        setvar power_duty_holding               (int($power_duty_max / 3))

    setvar ram_counter [ram_split $sdram_base]
    ram_define ram_mcu_usage_cnt            2
    ram_define ram_daq_pass_cnt             2
    ram_define ram_daq_discard_cnt          2
    ram_define ram_minutes_cnt              2
    ram_define ram_seconds_cnt              2
    ram_define ram_power_down_at_min        2
        setvar power_down_never 0xffff
        setvar power_extend_minutes 30
    ram_define ram_relay_hold_at_pass       2
        setvar relay_hold_passes 2
                
    setvar err_rx_overflow 0xfffe
    setvar err_tx_overflow 0xfffd
    setvar err_power_down  0xfffc
    
    jmp :main
    
    emit_debugger_register_table  counter
    
    // libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.
    convention_gpx
    include ../peripheral/driver/event_controller.asm
    include ../peripheral/driver/fduart.asm
    include ../peripheral/driver/anmux.asm
    include lib/string.asm
    include lib/console.asm
    include lib/time.asm

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

    // init RAM variables.
    ram $ram_power_down_at_min = $power_down_never
    ram $ram_relay_hold_at_pass = $relay_hold_passes
    
    // start handling events.
    soft_event = $event_controller_reset_mask
    soft_event = 0
    mstimer0 = 1000
    jmp :poll_events
        
    // event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.  
    // event 0 not used in this app anyway.
    :event_table    
    ([label :poll_events])
    ([label :power_lost_handler])
    ([label :ustimer0_handler])
    ([label :spi_done_handler])
    ([label :mstimer0_handler])
    ([label :mstimer1_handler])
    ([label :uart_rx_handler])
    ([label :uart_rx_overflow_handler])
    ([label :uart_tx_overflow_handler])
    ([label :key0_handler])
    ([label :key1_handler])
    ([label :ignition_switch_off_handler])
    ([label :ignition_switch_on_handler])
    ([label :softevent3_handler])
    ([label :softevent2_handler])
    ([label :softevent1_handler])
    ([label :softevent0_handler])
    
    // #########################################################################

event ustimer0_handler
end_event

event spi_done_handler
    // discard-counter in RAM.  
    ram a = $ram_daq_discard_cnt
    br az :report
        b = -1
        a = a+b
        ram $ram_daq_discard_cnt = a
        a = $anmux_adc_channel
        call :begin_adc_conversion
        event_return

    // report ADC reading.
    :report
    a = spi_data
    call :put4x 

    // decrement anmux channel & start waiting again.
    call :anmux_get_chn
    br az :all_done
        b = -1
        a = a+b
        call :anmux_set_chn
        mstimer1 = $anmux_settle_ms
        event_return
    
    // end of daq pass.
    :all_done
    puteol    
end_event

event mstimer0_handler
    // unified 1-second periodic timer for all low-resolution tasks.

    // start timer again.
    mstimer0 = 1000

    // realtime counters in RAM.  
    ram a = $ram_seconds_cnt
    b = 1
    a = a+b
    b = 60
    bn eq :same_minute
        ram $ram_seconds_cnt = 0
        ram a = $ram_minutes_cnt
        b = 1
        ram $ram_minutes_cnt = a+b
        call :minute_events
        jmp :minutes_done
    :same_minute
        ram $ram_seconds_cnt = a
    :minutes_done
    
    call :check_power_relay
    call :start_daq_pass
end_event

event mstimer1_handler    
    // start a reading from the current anmux channel.
    ram $ram_daq_discard_cnt = $anmux_num_discards
    putasc " "
    putasc "s"
    call :anmux_get_chn
    asc b = "0"
    putchar a+b
    putasc "="    
    a = $anmux_adc_channel
    call :begin_adc_conversion
end_event
    
event uart_rx_handler
    // handle data here
end_event
    
event uart_rx_overflow_handler
    error_halt_code $err_rx_overflow
end_event
    
event uart_tx_overflow_handler
    error_halt_code $err_tx_overflow
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
    
func start_daq_pass
    // daq pass counter in RAM.  
    ram a = $ram_daq_pass_cnt
    b = 1
    a = a+b
    leds = a
    ram $ram_daq_pass_cnt = a
    call :put4x 
    putasc ":"
    
    // start to acquire & report all anmux channels.
    a = 7
    call :anmux_set_chn
    mstimer1 = $anmux_settle_ms
    
    // // observe MCU utilization.
    // a = usage_count
    // call :put4x
    // usage_count = 0    
end_func
    
func begin_adc_conversion
    // begin SPI transaction, specifying Nano ADC channel to take effect NEXT 
    // conversion after this one.  pass that in a.
    
    a = a<<4
    a = a<<4
    a = a<<1
    a = a<<1
    a = a<<1    
    spi_data = a
end_func    

event power_lost_handler
    // this must be an uncommanded loss of main power, because if it was commanded,
    // no more events would be handled; this event handler wouldn't have a chance to run.
    // immediately set the power relay PWM to full power for a few seconds, 
    // in case the power relay opened accidentally e.g. due to a hard pothole.
    power_duty = $power_duty_closing
    ram a = $ram_daq_pass_cnt
    b = $relay_hold_passes
    ram $ram_relay_hold_at_pass = a+b
    // save persistent data in case the power remains down e.g. due to battery disconnect.
    call :save_persistent_data
end_event

event ignition_switch_off_handler
    // set power-down deadline in RAM.  this makes the system remain powered for several more minutes, for cooldown data logging.    
    ram a = $ram_minutes_cnt
    b = $power_extend_minutes
    ram $ram_power_down_at_min = a+b
end_event

event ignition_switch_on_handler
    ram $ram_power_down_at_min = $power_down_never
end_event

func minute_events
    call :check_power_down    
end_func

func check_power_relay
    ram a = $ram_daq_pass_cnt    
    ram b = $ram_relay_hold_at_pass
    bn eq :done
        // time to begin "solenoid saver" coil power reduction by PWM.
        power_duty = $power_duty_holding
    :done
end_func

func check_power_down
    // check power-down deadline in RAM.    
    ram a = $ram_minutes_cnt
    ram b = $ram_power_down_at_min
    bn eq :done
        call :power_down
    :done
end_func

func power_down
    // this function never returns.
    call :save_persistent_data
    power_duty = $power_duty_opening
    error_halt_code $err_power_down
end_func

func save_persistent_data
end_func
