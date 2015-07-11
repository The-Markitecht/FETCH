// #########################################################################
// assembly source code.    

    // program code dimensions.
    vdefine CODE_ADDR_WIDTH         10
    vdefine CODE_ADDR_TOP           ($CODE_ADDR_WIDTH - 1)
    vdefine CODE_SIZE_MAX_WORDS     (1 << $CODE_ADDR_WIDTH)
    
    // register file configuration.
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
        setvar      anmux_adc_channel       7
        setvar      anmux_settle_ms         5
        setvar      anmux_num_discards      2
        ram_define  ram_daq_pass_cnt        
        ram_define  ram_daq_discard_cnt     
    
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

    alias_both efi_len_us           [incr counter]  "efilenus"        
    alias_both ign_timeout_len_20us [incr counter]  "igntmout"
        // SETTING efi_len_us NON-ZERO ENABLES FUEL INJECTION!!  zero disables it.
        // MUST SET ign_timeout_len_20us NON-ZERO PRIOR TO ENABLING!
        // otherwise the module latches up in a non-working state.
    alias_both ign_capture_jf       [incr counter]  "igntmcap"
        
    // all ignition time vars are expressed in 20us "jiffies" or "jf".
    // 5000 RPM = about 140 jf between rising edges on chevy ignition white wire.
    // 1000 RPM = about 700 jf 
    //  100 RPM = about 7000 jf
    //   22 RPM = about 32000 jf, the slowest figure that's safe for the divide routine.
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
    ram_define ram_ign_fastest_jf
    ram_define ram_ign_slowest_jf

    // realtime counting.
    ram_define ram_minutes_cnt              
    ram_define ram_seconds_cnt              
    ram_define ram_mcu_usage_cnt             
    ram_define ram_dial_setting              
                
    setvar err_rx_overflow              0xfffe
    setvar err_tx_overflow              0xfffd
    setvar err_power_down               0xfffc
    setvar err_power_lost_at_boot       0xfffb
    
    jmp :main
    
    emit_debugger_register_table  counter
    
    // libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.
    convention_gpx
    include ../peripheral/driver/event_controller.asm
    include ../peripheral/driver/fduart.asm
    include ../peripheral/driver/anmux.asm
    include lib/console.asm
    include lib/math.asm
    include lib/string.asm
    include lib/time.asm

    // #########################################################################
    :main    
    
    putasc "T"
    putasc "G"
    putasc "T"
    puteol

jmp :main
:event_table   
   
    // // clear the first 64k of RAM.
    // av_ad_hi = 0
    // a = 0
    // b = 2
    // :clear_next_word
        // av_ad_lo = a
        // av_write_data = 0
        // a = ad0
    // bn az :clear_next_word

    // // init RAM variables.
    // ram $ram_power_down_at_min = $power_down_never
    // ram $ram_relay_hold_at_pass = $relay_hold_passes
    
    // // init fuel injection.
    // ign_timeout_len_20us = 0xfffc
    // efi_len_us = 3000
    // call :set_engine_stopped
    
    // // power up FTDI USB board, and init any other special board control functions.
    // board_ctrl = $ftdi_power_mask
    // call :postpone_comm_restart
    
    // // check initial state of power management circuits.
    // // if power is lost or ignition switch is off already, open relay & abort run.
    // // that's important because then the event controller booted up too late to
    // // see edges on those 2 signals.  regular system would never shut itself down.
    // // this setup is the last thing done prior to the event handler loop.
    // power_duty = $power_duty_closing
    // a = power_duty
    // b = ($power_lost_mask | $ign_switch_off_mask)
    // br and0z :skip_power_lost
        // power_duty = $power_duty_opening
        // error_halt_code $err_power_lost_at_boot    
    // :skip_power_lost
    
    // // start handling events.
    // soft_event = $event_controller_reset_mask
    // soft_event = 0
    // mstimer0 = 1000
    // jmp :poll_events
        
    // // event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.  
    // // event 0 not used in this app anyway.
    // :event_table    
    // ([label :poll_events])
    // ([label :power_lost_handler])
    // ([label :ign_captured_handler])
    // ([label :puff1_done_handler])
    // ([label :ustimer0_handler])
    // ([label :spi_done_handler])
    // ([label :mstimer0_handler])
    // ([label :mstimer1_handler])
    // ([label :uart_rx_handler])
    // ([label :uart_rx_overflow_handler])
    // ([label :uart_tx_overflow_handler])
    // ([label :key0_handler])
    // ([label :key1_handler])
    // ([label :ign_switch_off_handler])
    // ([label :ign_switch_on_handler])
    // ([label :softevent3_handler])
    // ([label :softevent2_handler])
    // ([label :softevent1_handler])
    // ([label :softevent0_handler])
    
    // // #########################################################################

// func set_engine_stopped
    // ram $ram_rpm_valid = 0
    // ram $ram_ign_history_idx = 0
    // // for startup, look for RPM between 50 and 1160
    // ram $ram_ign_fastest_jf = ([rpm_to_jf 1160])
    // ram $ram_ign_slowest_jf = ([rpm_to_jf 50])    
// end_func    

// // func wrap_history_idx
    // // :again
        // // b = $ign_history_len
        // // br lt :done
        // // b = ([negate $ign_history_len])
        // // a = a+b
    // // jmp :again
    // // :done    
// // end_func
    
// event ign_captured_handler
    // // discard outlier time.
    // a = ign_capture_jf
    // ram b = $ram_ign_fastest_jf
    // br lt :done
    // ram b = $ram_ign_slowest_jf
    // br gt :done
    
    // // increment buffer index and memorize time.
    // ram a = $ram_ign_history_idx
    // b = 1
    // a = a+b
    // b = $ign_history_idx_mask
    // a = and    
    // bn az :no_wrap
        // // history buffer is full now.  average will be valid.
        // ram $ram_rpm_valid = 1
    // :no_wrap
    // ram $ram_ign_history_idx = a
    // struct_write $ram_ign_history_jf a = ign_capture_jf
    
    // // ////////// compute new jiffy estimate.
    
    // // // first, total up the oldest 25% of the history
    // // // this doesn't work above 2^14 jf.  that's below 44 RPM.
    // // // reg a must be already loaded with the history index most recently written.
    // // // a=index, i=total, x=loop count.
    // // i = 0
    // // x = $ign_history_quarter
    // // y = -1
    // // :next_oldest
        // // b = 1
        // // a = a+b    
        // // b = $ign_history_idx_mask
        // // a = and    
        // // struct_read j = $ram_ign_history_jf a
        // // i = i+j
        // // x = x+y
    // // bn xz :next_oldest
    // // // memorize average.
    // // a = i
    // // << for {set n 0} {$n < $ign_avg_shift} {incr n} {parse3 a = a>>1 {}} >>
    // // ram $ram_ign_oldest_avg_jf = a
    
    // // average entire history.
    // // b = total, i = index = loop count
    // b = 0
    // i = $ign_history_len
    // j = -1
    // :next_avg
        // struct_read a = $ram_ign_history_jf i
        // a = a>>$ign_history_idx_bits
        // b = a+b
        // i = i+j
    // bn iz :next_avg
    // ram $ram_ign_avg_jf = b
    
    // // convert jiffies b to new RPM estimate.
    // a = b
    // call :jf_to_rpm
    // ram $ram_avg_rpm = a
    
    // :done
// end_event
    
// event ustimer0_handler
// end_event

// event spi_done_handler
    // // discard-counter in RAM.  
    // ram a = $ram_daq_discard_cnt
    // br az :report
        // b = -1
        // a = a+b
        // ram $ram_daq_discard_cnt = a
        // a = $anmux_adc_channel
        // call :begin_adc_conversion
        // event_return

    // // report ADC reading.
    // :report
    // a = spi_data
    // call :put4x 

    // // decrement anmux channel & start waiting again.
    // call :anmux_get_chn
    // br az :all_done
        // b = -1
        // a = a+b
        // call :anmux_set_chn
        // mstimer1 = $anmux_settle_ms
        // event_return
    
    // // end of daq pass.
    // :all_done
    // puteol   
    // ram $ram_dial_setting = spi_data
// end_event

// event mstimer0_handler
    // // unified 1-second periodic timer for all low-resolution tasks.

    // // start timer again.
    // mstimer0 = 1000

    // // realtime counters in RAM.  
    // ram a = $ram_seconds_cnt
    // b = 1
    // a = a+b
    // b = 60
    // bn eq :same_minute
        // ram $ram_seconds_cnt = 0
        // ram a = $ram_minutes_cnt
        // b = 1
        // ram $ram_minutes_cnt = a+b
        // call :minute_events
        // jmp :minutes_done
    // :same_minute
        // ram $ram_seconds_cnt = a
    // :minutes_done
    
    // call :check_power_relay
    // call :check_communication
    // call :start_daq_pass    
// end_event

// event mstimer1_handler    
    // // start a reading from the current anmux channel.
    // ram $ram_daq_discard_cnt = $anmux_num_discards
    // putasc " "
    // putasc "s"
    // call :anmux_get_chn
    // asc b = "0"
    // putchar a+b
    // putasc "="    
    // a = $anmux_adc_channel
    // call :begin_adc_conversion
// end_event
    
// event uart_rx_handler
    // :again
        // pollchar
        // b = -1
        // br eq :done
        // b = 10
        // bn eq :skip_lf
            // call :postpone_comm_restart
        // :skip_lf
    // jmp :again
    // :done
// end_event

// event uart_rx_overflow_handler
    // error_halt_code $err_rx_overflow
// end_event
    
// event uart_tx_overflow_handler
    // error_halt_code $err_tx_overflow
// end_event
    
// event key0_handler
    // putasc "k"
    // putasc "0"
// end_event
    
// event key1_handler
    // putasc "k"
    // putasc "1"
// end_event
    
// event softevent3_handler
// end_event
    
// event softevent2_handler
// end_event
    
// event softevent1_handler
// end_event
    
// event softevent0_handler
// end_event
    
// func start_daq_pass
    // // daq pass counter in RAM.  
    // ram a = $ram_daq_pass_cnt
    // b = 1
    // a = a+b
    // leds = a
    // ram $ram_daq_pass_cnt = a
    // call :put4x 
    // putasc ":"

    // putasc " "
    // putasc "r"
    // putasc "p"
    // putasc "m"
    // putasc "="
    // ram a = $ram_avg_rpm 
    // call :put4x
    
    // // start to acquire & report all anmux channels.
    // a = 7
    // call :anmux_set_chn
    // mstimer1 = $anmux_settle_ms
    
    // // // observe MCU utilization.
    // // a = usage_count
    // // call :put4x
    // // usage_count = 0    
// end_func
    
// func begin_adc_conversion
    // // begin SPI transaction, specifying Nano ADC channel to take effect NEXT 
    // // conversion after this one.  pass that in a.
    
    // a = a<<4
    // a = a<<4
    // a = a<<1
    // a = a<<1
    // a = a<<1    
    // spi_data = a
// end_func    

// event power_lost_handler
    // // at this time we have less than 2 ms of usable run time left.

    // // this must be an uncommanded loss of main power, because if it was commanded,
    // // no more events would be handled; this event handler wouldn't have a chance to run.
    // // immediately set the power relay PWM to full power for a few seconds, 
    // // in case the power relay opened accidentally e.g. due to a hard pothole.
    // power_duty = $power_duty_closing
    // ram a = $ram_daq_pass_cnt
    // b = $relay_hold_passes
    // ram $ram_relay_hold_at_pass = a+b
    
    // // pause any non-vital power-hogging operations, to conserve power for the EEPROM write.
    
    // // save persistent data in case the power remains down e.g. due to battery disconnect.
    // call :save_persistent_data
// end_event

// event ign_switch_off_handler
    // // set power-down deadline in RAM.  this makes the system remain powered for several more minutes, for cooldown data logging.    
    // ram a = $ram_minutes_cnt
    // b = $power_extend_minutes
    // ram $ram_power_down_at_min = a+b
// end_event

// event ign_switch_on_handler
    // ram $ram_power_down_at_min = $power_down_never
// end_event

// event puff1_done_handler
    // ram a = $ram_dial_setting
    // a = a<<1
    // a = a<<1
    // a = a<<1
    // bn az :nonzero
        // a = 1
    // :nonzero
    // efi_len_us = a
// end_event

// func minute_events
    // call :check_power_down    
// end_func

// func check_power_relay
    // ram a = $ram_daq_pass_cnt    
    // ram b = $ram_relay_hold_at_pass
    // bn eq :done
        // // time to begin "solenoid saver" coil power reduction by PWM.
        // power_duty = $power_duty_holding
    // :done
// end_func

// func check_power_down
    // // check power-down deadline in RAM.    
    // ram a = $ram_minutes_cnt
    // ram b = $ram_power_down_at_min
    // bn eq :done
        // call :power_down
    // :done
// end_func

// func power_down
    // // this function never returns.
    // call :save_persistent_data
    // power_duty = $power_duty_opening
    // error_halt_code $err_power_down
// end_func

// func save_persistent_data
// end_func

// func check_communication
    // ram a = $ram_ftdi_downtime_remain_sec
    // br az :skip_ftdi_powerup
        // b = -1
        // a = a+b
        // ram $ram_ftdi_downtime_remain_sec = a
        // br az :do_power_on
            // rtn
        // :do_power_on
        // call :ftdi_power_on
        // rtn
    // :skip_ftdi_powerup

    // ram a = $ram_minutes_cnt
    // ram b = $ram_comm_restart_at_min 
    // bn eq :done
        // // comm restart is required.
        // call :postpone_comm_restart
        // ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec
        // call :ftdi_power_off
    // :done
// end_func

// func postpone_comm_restart
    // ram a = $ram_minutes_cnt
    // b = $comm_grace_period_min
    // ram $ram_comm_restart_at_min = a+b
// end_func
    
// func ftdi_power_off
    // a = board_ctrl
    // b = $not_ftdi_power_mask
    // board_ctrl = and
// end_func
    
// func ftdi_power_on
    // a = board_ctrl
    // b = $ftdi_power_mask
    // board_ctrl = or
// end_func
    
// func jf_to_rpm
    // // pass jiffies in a.  return rpm in a.
    // // resolution = 32 rpm.
    // b = a
    // a = 0x5573 
    // // = 700000 >> 5
    // call :divide
    // a = b
    // a = a<<4
    // a = a<<1
// end_func
