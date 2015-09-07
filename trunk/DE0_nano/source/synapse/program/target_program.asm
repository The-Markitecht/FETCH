// #########################################################################
// assembly source code.    

    jmp :main

    declare_system_dimensions
    
    // register file configuration.
    vdefine num_regs 32
    vdefine top_reg ($num_regs - 1)
    vdefine num_gp 8
    vdefine top_gp ($num_gp - 1)

    // application-specific register aliases.    
    alias_both g6                   6               "g6"
    alias_both g7                   7               "g7"
    setvar counter $top_gp    
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
    alias_both mstimer2             [incr counter]  "mstimer2"
        // engine plan tick timer.
                
    alias_both spi_data             [incr counter]  "spi_data"
    
    alias_both av_write_data        [incr counter]  "//avwrdt"
    alias_src  av_read_data	        [incr counter]  "av_rd_dt"
    alias_both av_ad_hi             [incr counter]  "av_ad_hi"
    alias_both av_ad_lo             [incr counter]  "av_ad_lo"
        // all Avalon addresses are BYTE addresses.  all Avalon sizes are in BYTES.
        vdefine32 sdram_base                 0x00000000
        vdefine32 sdram_size                 0x02000000
        setvar ram_counter          [ram_split $sdram_base]
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

    alias_both leds                 [incr counter]  "leds"
    
    alias_both board_ctrl           [incr counter]  "brd_ctrl"
        vdefine     dipswitch0_bit          0
        setvar      dipswitch0_mask         (1 << $dipswitch0_bit)
        vdefine     dipswitch1_bit          1
        setvar      dipswitch1_mask         (1 << $dipswitch1_bit)
        vdefine     dipswitch2_bit          2
        setvar      dipswitch2_mask         (1 << $dipswitch2_bit)
        vdefine     dipswitch3_bit          3
        setvar      dipswitch3_mask         (1 << $dipswitch3_bit)
        vdefine     key0_bit                4
        setvar      key0_mask               (1 << $key0_bit)
        vdefine     key1_bit                5
        setvar      key1_mask               (1 << $key1_bit)
        vdefine     beeper_enable_bit       6
        setvar      beeper_enable_mask      (1 << $beeper_enable_bit)
        vdefine     ftdi_power_bit          7
        setvar      ftdi_power_mask         (1 << $ftdi_power_bit)
        setvar      not_ftdi_power_mask     (0xffff ^ $ftdi_power_mask)
        ram_define  ram_comm_restart_at_min
        ram_define  ram_ftdi_downtime_remain_sec
        setvar      comm_grace_period_min   2
        setvar      ftdi_down_period_sec    5

    alias_both anmux_ctrl           [incr counter]  "anmux"
        vdefine     anmux_enable_mask       0x0008
        vdefine     anmux_channel_mask      0x0007
        setvar      anmux_num_channels      8
        setvar      anmux_adc_channel       7
        setvar      anmux_settle_ms         5
        setvar      anmux_num_discards      2
        ram_define  ram_daq_pass_cnt        
        ram_define  ram_daq_discard_cnt     
        ram_define  ram_last_anmux_data     ($anmux_num_channels * 2)
        setvar      anmux_engine_block_temp 2
        setvar      temp_ceiling_adc        0xff0
    
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
        ram_define ram_power_down_at_min        
            setvar power_down_never             0xffff
            setvar power_extend_minutes         10
        ram_define ram_relay_hold_at_pass       
            setvar relay_hold_passes            2

    // realtime counting.
    ram_define ram_minutes_cnt              
    ram_define ram_seconds_cnt              
    ram_define ram_mcu_usage_cnt             
    ram_define ram_dial_setting              

    // text flag reporting.
    setvar num_text_flag_pointers       8
    setvar tfp_mask                     ($num_text_flag_pointers - 1)
    ram_define ram_text_flag_pointers   ($num_text_flag_pointers * 2)
    ram_define ram_next_tfp_idx
    
    // error code constants.
    setvar err_rx_overflow              0xfffe
    setvar err_tx_overflow              0xfffd
    setvar err_power_down               0xfffc
    setvar err_power_lost_at_boot       0xfffb    
    setvar err_sdram_data               0xfffa
    
    // ignition time capture.        
    // all ignition time vars are expressed in jf "jiffies" or "jf".
    // 5000 RPM = about 140 jf between rising edges on chevy ignition white wire.
    // 1000 RPM = about 700 jf 
    //  100 RPM = about 7000 jf
    //   22 RPM = about 32000 jf, the slowest figure that's safe for the divide routine.
    alias_src  ign_capture_jf       [incr counter]  "igntmcap"
    alias_both ign_timeout_len_jf   [incr counter]  "igntmout"
    setvar ign_history_idx_bits     4
    setvar ign_history_len          (1 << $ign_history_idx_bits)
    setvar ign_history_idx_mask     ($ign_history_len - 1)
    // setvar ign_history_quarter      ($ign_history_len / 4)
    // setvar ign_quarter_avg_shift    ($ign_history_idx_bits - 2)
    ram_define ram_ign_history_idx
    ram_define ram_ign_history_jf   ($ign_history_len * 2)
    // ram_define ram_ign_oldest_avg_jf
    // ram_define ram_ign_newest_avg_jf
    ram_define ram_ign_avg_jf
    ram_define ram_avg_rpm
    ram_define ram_rpm_valid
    ram_define ram_ign_bad_samples
    ram_define ram_ign_fastest_jf
    ram_define ram_ign_slowest_jf

    // fuel injection puff driver.
    alias_both puff_len_us          [incr counter]  "puflenus"            
        // SETTING puff_len_us NON-ZERO ENABLES FUEL INJECTION!!  zero disables it.
        // MUST SET ign_timeout_len_jf NON-ZERO PRIOR TO ENABLING!
        // otherwise the module latches up in a non-working state.
    ram_define ram_next_puff_len_us
    
    // engine state management.  each engine state is called a "plan".    
    ram_define ram_plan_name
    ram_define ram_puff_len_func
    ram_define ram_transition_func
    ram_define ram_destroy_plan_func
    setvar plan_tick_ms                 20
    ram_define ram_next_puff_len_us
    ram_define ram_puff_count
    setvar crank_success_rpm            600
    setvar crank_min_puff_len_us        5000
    setvar crank_max_puff_len_us        20000
    setvar crank_incr_us_per_puff       1500
        // escalating puff length by 1500 us per puff while cranking slowly at e.g. 80 RPM
        // on a frozen winter morning will ramp up from 5000 to 20000 us length in about 7 seconds.
    setvar crank_max_puffs              (($crank_max_puff_len_us - $crank_min_puff_len_us) / $crank_incr_us_per_puff)
    setvar warmup_success_temp_adc      0x4c0
        // 0x4c0 = 1216 = 120 degF at the sensor location outside the engine block.
    
    emit_debugger_register_table  counter
    
    // string resources
    :boot_msg
        "TGT\r\n\x0"
    
    // engine state management.  each engine state is called a "plan".
    // ram_define ram_plan
        // ram_plan should be a pointer to a plan structure instead of an enum.
        // setvar plan_stop        0
        // setvar plan_crank       1
        // setvar plan_warmup      2
        // setvar plan_run         3
    // plan definitions
    // :plans
        // ([label :plan_stop])
        // ([label :plan_crank])
        // ([label :plan_warmup])
        // ([label :plan_run])
        // :plan_stop
            // ([label :plan_name_stop])
            // ([label :puff_len_stop])
            // ([label :leave_stop])
            // :plan_name_stop
                // "STP\x0"
        // :plan_crank
            // ([label :plan_name_crank])
            // ([label :puff_len_crank])
            // ([label :leave_crank])
            // :plan_name_crank
                // "CR\x0"
        // :plan_warmup
            // ([label :plan_name_warmup])
            // ([label :puff_len_warmup])
            // ([label :leave_warmup])
            // :plan_name_warmup
                // "WM\x0"
        // :plan_run
            // ([label :plan_name_run])
            // ([label :crank_puff_run])
            // ([label :leave_run])
            // :plan_name_run
                // "RN\x0"
        

    // libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.
    convention_gpx
    include ../peripheral/driver/event_controller.asm
    include ../peripheral/driver/fduart.asm
    include ../peripheral/driver/anmux.asm
    include lib/struct.asm
    include lib/console.asm
    include lib/math.asm
    include lib/string.asm
    include lib/time.asm
    include plan_stop.asm
    include plan_crank.asm
    include plan_warmup.asm
    include plan_run.asm
        
    // #########################################################################
    :main  
    a = :boot_msg
    call :print_nt 

// soft_event = (1 << 14)
// soft_event = 0
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

// i = 0x80
// j = -1
// av_ad_hi = 0
// :test_next_word
    // av_ad_lo = i
    // av_write_data = i
    // av_ad_lo = 0xff
    // av_write_data = i
    // i = i+j
// bn iz :test_next_word
// jmp :main
    
    // init fuel injection.
    call :init_plan_stop    
    
    // power up FTDI USB board, and init any other special board control functions.
    board_ctrl = $ftdi_power_mask
    call :postpone_comm_restart
    
    // check initial state of power management circuits.
    // if power is lost or ignition switch is off already, open relay & abort run.
    // that's important because then the event controller booted up too late to
    // see edges on those 2 signals.  regular system would never shut itself down.
    // this setup is the last thing done prior to the event handler loop.
    power_duty = $power_duty_closing
    a = power_duty
    b = ($power_lost_mask | $ign_switch_off_mask)
    br and0z :skip_power_lost
        power_duty = $power_duty_opening
        error_halt_code $err_power_lost_at_boot    
    :skip_power_lost
    ram $ram_power_down_at_min = $power_down_never
    ram $ram_relay_hold_at_pass = $relay_hold_passes
    
    // start handling events.
    soft_event = $event_controller_reset_mask
    soft_event = 0
    mstimer0 = 1000
    mstimer2 = $plan_tick_ms
    jmp :poll_events
        
    // event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.  
    // event 0 not used in this app anyway.
    :event_table    
    ([label :poll_events])
    ([label :power_lost_handler])
    ([label :ign_capture_handler])
    ([label :ign_capture_timeout_handler])
    ([label :puff1_done_handler])
    ([label :ustimer0_handler])
    ([label :spi_done_handler])
    ([label :mstimer0_handler])
    ([label :mstimer1_handler])
    ([label :mstimer2_handler])
    ([label :uart_rx_handler])
    ([label :uart_rx_overflow_handler])
    ([label :uart_tx_overflow_handler])
    ([label :key0_handler])
    ([label :key1_handler])
    ([label :ign_switch_off_handler])
    ([label :ign_switch_on_handler])
    ([label :softevent3_handler])
    ([label :softevent2_handler])
    ([label :softevent1_handler])
    ([label :softevent0_handler])
    
    // #########################################################################
    
event ign_capture_handler
    // discard outlier time.
    g6 = ign_capture_jf
    ram b = $ram_ign_fastest_jf
    a = g6
    br gt :fastest_ok
        g6 = 0
    :fastest_ok
    ram b = $ram_ign_slowest_jf
    a = g6
    br lt :slowest_ok
        g6 = 0
    :slowest_ok
    
    // increment buffer index and memorize time.
    ram a = $ram_ign_history_idx
    b = 1
    a = a+b
    b = $ign_history_idx_mask
    a = and    
    ram $ram_ign_history_idx = a
    b = g6
    struct_write $ram_ign_history_jf 
    
    // ////////// compute new jiffy estimate.
    
    // // first, total up the oldest 25% of the history
    // // this doesn't work above 2^14 jf.  that's below 44 RPM.
    // // reg a must be already loaded with the history index most recently written.
    // // a=index, i=total, x=loop count.
    // i = 0
    // x = $ign_history_quarter
    // y = -1
    // :next_oldest
        // b = 1
        // a = a+b    
        // b = $ign_history_idx_mask
        // a = and    
        // struct_read j = $ram_ign_history_jf a
        // i = i+j
        // x = x+y
    // bn xz :next_oldest
    // // memorize average.
    // a = i
    // << for {set n 0} {$n < $ign_avg_shift} {incr n} {parse3 a = a>>1 {}} >>
    // ram $ram_ign_oldest_avg_jf = a
    
    // average entire history.
    // x = total, i = index = loop count, g6 = count of invalid samples.
    x = 0
    i = $ign_history_len
    j = -1
    g6 = 0
    :next_avg
        i = i+j
        a = i
        struct_read $ram_ign_history_jf        
        a = 0
        bn eq :valid_sample
            a = g6
            b = 1
            g6 = a+b
            jmp :sample_done
        :valid_sample
            a = ($ign_history_len / 2)
            a = a+b
            y = a>>$ign_history_idx_bits
            x = x+y
        :sample_done
    bn iz :next_avg
    ram $ram_ign_avg_jf = x
    //patch: dividing before summing (instead of after) is much simpler and faster because it prevents overflow.
    // but it means we could be reading as much as 16 jf too low (16 = ign_history_len).
    // that error is way less than 1 RPM on the slow end, 
    // or about 1,000 RPM too fast on the fast end!
    // might need to tighten that up.  one simple way might be adding ign_history_len / 2 to each history record prior to dividing.  
    // that didn't seem to help much in simple testing.
    
    ram $ram_ign_bad_samples = g6
    a = g6
    b = ($ign_history_len / 4)
    br gt :partial_history
        // convert jiffies b to new RPM estimate.
        a = x
        call :jf_to_rpm
        ram $ram_avg_rpm = a
        ram $ram_rpm_valid = 1
        jmp :done    
    :partial_history
        ram $ram_rpm_valid = 0
    
    :done
end_event

func clear_ign_history
    // invalidate the RPM estimate.
    ram $ram_rpm_valid = 0
    // the last known RPM estimate is retained here, not cleared.
    // clear the history so it won't be valid again until several more valid samples are collected.
    ram $ram_ign_bad_samples = $ign_history_len
    i = $ign_history_len
    j = -1
    :next
        a = i
        b = 0
        struct_write $ram_ign_history_jf
        i = i+j
    bn iz :next
end_func

event ign_capture_timeout_handler
    // it's been too long since the last ignition pulse detect.
    call :clear_ign_history
end_event
    
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
    
    // memorize ADC reading.
    call :anmux_get_chn
    b = spi_data
    struct_write $ram_last_anmux_data
    
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
    call :report_plan
    call :report_text_flags
    puteol   
    ram $ram_dial_setting = spi_data
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
    call :check_communication
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
    
event mstimer2_handler    
    // restart timer
    mstimer2 = $plan_tick_ms
    
    // poll the engine management plan.
    // call the transition function for the current plan.
    // this might perform a transition to some other plan, so it's done first.
    ram rtna = $ram_transition_func
    call_indirect
    // call the puff length function for the current plan.
    // this is done last, so if a plan transition just happened, its new puff length will init here.
    ram rtna = $ram_puff_len_func
    call_indirect
end_event
    
event uart_rx_handler
    :again
        pollchar
        b = -1
        br eq :done
        b = 10
        bn eq :skip_lf
            call :postpone_comm_restart
        :skip_lf
    jmp :again
    :done
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

:rpm_msg
    ": rpm=\x0"

:puff_len_msg
    " pfl=\x0"
    
func start_daq_pass
    // daq pass counter in RAM.  
    ram a = $ram_daq_pass_cnt
    b = 1
    a = a+b
    leds = a
    ram $ram_daq_pass_cnt = a
    call :put4x 

    a = :rpm_msg
    call :print_nt 
    a = 0
    ram x = $ram_rpm_valid
    br xz :skip_rpm
        ram a = $ram_avg_rpm 
    :skip_rpm
    call :put4x

    a = :puff_len_msg
    call :print_nt 
    a = puff_len_us
    call :put4x
    putasc ","
    ram a = $ram_puff_count
    call :put4x    
    
    // start to acquire & report all anmux channels.
    a = ($anmux_num_channels - 1)
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
    // at this time we have less than 2 ms of usable run time left.

    // this must be an uncommanded loss of main power, because if it was commanded,
    // no more events would be handled; this event handler wouldn't have a chance to run.
    // immediately set the power relay PWM to full power for a few seconds, 
    // in case the power relay opened accidentally e.g. due to a hard pothole.
    power_duty = $power_duty_closing
    ram a = $ram_daq_pass_cnt
    b = $relay_hold_passes
    ram $ram_relay_hold_at_pass = a+b
    
    // pause any non-vital power-hogging operations, to conserve power for the EEPROM write.
    
    // save persistent data in case the power remains down e.g. due to battery disconnect.
    call :save_persistent_data
end_event

:ign_off_msg
    "IGOF\x0"

event ign_switch_off_handler
    // set power-down deadline in RAM.  this makes the system remain powered for several more minutes, for cooldown data logging.    
    ram a = $ram_minutes_cnt
    b = $power_extend_minutes
    ram $ram_power_down_at_min = a+b
    a = :ign_off_msg
    call :set_text_flag    
end_event

:ign_on_msg
    "IGON\x0"

event ign_switch_on_handler
    ram $ram_power_down_at_min = $power_down_never
    a = :ign_on_msg
    call :set_text_flag    
end_event

event puff1_done_handler
    // puff just finished.  set length of next puff.
    ram puff_len_us = $ram_next_puff_len_us

    // count puffs.
    ram a = $ram_puff_count
    b = 1
    ram $ram_puff_count = a+b
    
    // hack to set puff length strictly by a hard-wired knob.
    // ram a = $ram_dial_setting
    // a = a<<1
    // a = a<<1
    // a = a<<1
    // bn az :nonzero
        // a = 1
    // :nonzero
    // puff_len_us = a    
end_event

func minute_events
    call :check_power_down    
end_func

:power_hold_msg
    "PWH\x0"

func check_power_relay
    ram a = $ram_daq_pass_cnt    
    ram b = $ram_relay_hold_at_pass
    bn eq :done
        // time to begin "solenoid saver" coil power reduction by PWM.
        power_duty = $power_duty_holding
        a = :power_hold_msg
        call :set_text_flag
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

func check_communication
    ram a = $ram_ftdi_downtime_remain_sec
    br az :skip_ftdi_powerup
        b = -1
        a = a+b
        ram $ram_ftdi_downtime_remain_sec = a
        br az :do_power_on
            rtn
        :do_power_on
        call :ftdi_power_on
        rtn
    :skip_ftdi_powerup

    ram a = $ram_minutes_cnt
    ram b = $ram_comm_restart_at_min 
    bn eq :done
        // comm restart is required.
        call :postpone_comm_restart
        ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec
        call :ftdi_power_off
    :done
end_func

func postpone_comm_restart
    ram a = $ram_minutes_cnt
    b = $comm_grace_period_min
    ram $ram_comm_restart_at_min = a+b
end_func
    
:ftdi_off_msg
    "FTOF\x0"

func ftdi_power_off
    a = board_ctrl
    b = $not_ftdi_power_mask
    board_ctrl = and
    a = :ftdi_off_msg
    call :set_text_flag
end_func
    
:ftdi_on_msg
    "FTON\x0"
    
func ftdi_power_on
    a = board_ctrl
    b = $ftdi_power_mask
    board_ctrl = or
    a = :ftdi_on_msg
    call :set_text_flag
end_func

func set_text_flag
    b = a
    ram a = $ram_next_tfp_idx
    push a
    struct_write $ram_text_flag_pointers 
    pop a
    b = -1
    a = a+b
    b = $tfp_mask
    ram $ram_next_tfp_idx = and
end_func

:text_flags_msg
    " tf=\x0"

func report_text_flags
    a = :text_flags_msg
    call :print_nt
    i = $num_text_flag_pointers
    j = -1
    :next_ptr
        i = i+j
        a = i        
        struct_read $ram_text_flag_pointers
        a = b
        br az :skip
            call :print_nt
            putasc ","
            a = i
            b = 0
            struct_write $ram_text_flag_pointers 
        :skip        
    bn iz :next_ptr
end_func
    
:plan_msg
    " pl=\x0"

func report_plan
    a = :plan_msg
    call :print_nt
    ram a = $ram_plan_name
    call :print_nt
end_func
    
func jf_to_rpm
    // pass jiffies in a.  return rpm in a.
    // resolution = 32 rpm.
    b = a
    a = 0x5573 
    // = 700000 >> 5
    call :divide
    a = b
    a = a<<4
    a = a<<1
end_func

func check_engine_stop
    // returns a=1 if transitioned to stop, else a=0.

    // transition to plan_stop if ignition switch is turned off AND rpm estimate is invalid.
    // requiring both conditions prevents spurious noise readings from shutting down the injection.
    a = power_duty
    b = $ign_switch_off_mask
    br and0z :stay
        ram a = $ram_rpm_valid
        bn az :stay
            ram rtna = $ram_destroy_plan_func
            call_indirect
            call :init_plan_stop
            a = 1
            jmp :done
    :stay
    a = 0
    :done
end_func

