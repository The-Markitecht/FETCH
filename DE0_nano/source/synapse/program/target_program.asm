// FETCH
// Copyright 2009 Mark Hubbard, a.k.a. "TheMarkitecht"
// http://www.TheMarkitecht.com
//
// Project home:  http://github.com/The-Markitecht/FETCH
// FETCH is the Fluent Engine and Transmission Controller Hardware for sports cars.
//
// This file is part of FETCH.
//
// FETCH is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// FETCH is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with FETCH.  If not, see <https://www.gnu.org/licenses/>.


// #########################################################################
// assembly source code.

    jmp :main

    declare_system_dimensions

    // register file configuration.
    // beyond top_populated_ext_reg the external address space is stubbed as "don't care" values by the Synapse core.
    // that doesn't affect operator results and other addresses implemented internally by the Synapse core.
    vdefine num_populated_ext_regs 48
    vdefine top_populated_ext_reg ($num_populated_ext_regs - 1)
    vdefine num_gp 12
    vdefine top_gp ($num_gp - 1)

    // application-specific register aliases.
    alias_both g6                   6               "g6"
    alias_both g7                   7               "g7"
        // patch: g6, g7 obsolete.
    alias_both ga                   6               "ga"
    alias_both gb                   7               "gb"
    alias_both pa                   8               "pa"
    alias_both pb                   9               "pb"
    alias_both pc                   10              "pc"
    alias_both pd                   11              "pd"
    setvar counter $top_gp
    alias_both rstk                 [incr counter]  "//rstk"
    alias_both event_priority       [incr counter]  "ev_pri"
    alias_both soft_event           [incr counter]  "softevnt"
        vdefine     event_controller_reset_bit   15
        vdefine     event_controller_reset_mask  (1 << $event_controller_reset_bit)
    alias_both usage_count          [incr counter]  "usage"

    alias_src  product_lo           [incr counter]  "prductlo"
    alias_src  product_hi           [incr counter]  "prducthi"

    alias_both ustimer0             [incr counter]  "ustimer0"
    alias_both mstimer0             [incr counter]  "mstimer0"
        // throttle for each pass of data acquisition.
    alias_both mstimer1             [incr counter]  "mstimer1"
        // delay for anmux settling.
    alias_both mstimer2             [incr counter]  "mstimer2"
        // engine plan tick timer.

    alias_both spi_data             [incr counter]  "spi_data"

    alias_both av_write_data        [incr counter]  "//avwrdt"
    alias_src  av_begin_read        [src av_write_data]  "//avwrdt"
    alias_src  av_read_data         [incr counter]  "av_rd_dt"
    alias_both av_ad_hi             [incr counter]  "av_ad_hi"
    alias_both av_ad_lo             [incr counter]  "av_ad_lo"
        // all Avalon addresses are BYTE addresses.  all Avalon sizes are in BYTES.
        vdefine32 sdram_base                 0x00000000
        vdefine32 sdram_size                 0x02000000
        setvar ram_counter          [ram_from_int $sdram_base]
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

    alias_dest drom_ad              [incr counter]  "//dromad"
    alias_src  drom_data            [incr counter]  "dromdata"

    alias_both fduart_data          [incr counter]  "//uartdt"
    alias_both fduart_status        [incr counter]  "uartstat"
        setvar      key_buf_len             8
        setvar      key_buf_max             ($key_buf_len - 1)
        ram_define  ram_key_buf             ($key_buf_len * 2)

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
        setvar      anmux_settle_ms         5
        setvar      anmux_retry_ms          2
        ram_define  ram_daq_pass_cnt
        ram_define  ram_last_anmux_data     ($anmux_num_channels * 2)
        setvar      anmux_engine_block_temp 2
        setvar      temp_ceiling_adc        0xff0

    // ADC handling.
    setvar      adc_num_channels        8
    ram_define  ram_last_adc_data       ($adc_num_channels * 2)
    ram_define  ram_adc_chn_pending
    ram_define  ram_adc_junk
    setvar      anmux_adc_channel       7
    setvar      tps_adc_channel         6
    setvar      o2_adc_channel          5
    setvar      maf_adc_channel         4
    ram_define  ram_dial_setting
    ram_define  ram_enable_status_report

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
    // all ignition time vars are expressed in 20us "jiffies" or "jf".
    // 8750 RPM = about 80 jf between rising edges on chevy ignition white wire.  ignition counter noise blanking begins here in svn revision 627.
    // 5000 RPM = about 140 jf
    // 1000 RPM = about 700 jf
    //  100 RPM = about 7000 jf
    //   22 RPM = about 32000 jf, the slowest figure that's safe for the divide routine.
    alias_src  ign_capture_jf       [incr counter]  "igntmcap"
    alias_both ign_timeout_len_jf   [incr counter]  "igntmout"
    setvar ign_history_idx_bits     4
    setvar ign_history_len          (1 << $ign_history_idx_bits)
    setvar ign_history_idx_mask     ($ign_history_len - 1)
    ram_define ram_ign_history_idx
    ram_define ram_ign_history_jf   ($ign_history_len * 2)
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

    emit_debugger_register_table  counter

    // string resources
    :boot_msg
        "TGT\r\n\x0"

    // libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.
    convention_formal
    include ../peripheral/driver/event_controller.asm
    include ../peripheral/driver/fduart.asm
    include ../peripheral/driver/anmux.asm
    include lib/struct.asm
    include lib/console.asm
    include lib/math.asm
    include lib/string.asm
    include lib/time.asm
    setvar fletcher_sum1_reg pc
    setvar fletcher_sum2_reg pd
    include lib/fletcher.asm
    include data_rom.asm
    include terminal_commands.asm
    include plan_stop.asm
    include plan_crank.asm
    include plan_run.asm

    // #########################################################################
    :main
    a = :boot_msg
    call :print_nt

    // clear the first 64k of RAM.
    callx  clear_ram_page  0

    callx  init_drom

    // init fuel injection.
    callx  init_plan_stop

    // power up FTDI USB board, and init any other special board control functions.
    board_ctrl = $ftdi_power_mask
    callx postpone_comm_restart

    // check initial state of power management circuits.
    // if power is lost or ignition switch is off already, open relay & abort run.
    // that's important because then the event controller booted up too late to
    // see edges on those 2 signals.  regular system would never shut itself down.
    // this setup is the last thing done prior to the event handler loop.
    power_duty = $power_duty_closing
    if_any_set  power_duty  {$power_lost_mask | $ign_switch_off_mask} {
        power_duty = $power_duty_opening
        error_halt_code $err_power_lost_at_boot
    }
    ram $ram_power_down_at_min = $power_down_never
    ram $ram_relay_hold_at_pass = $relay_hold_passes

    // start handling events.
    soft_event = $event_controller_reset_mask
    soft_event = 0
    mstimer0 = 1000
    mstimer2 = $plan_tick_ms
    ram $ram_enable_status_report = 1
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
    if g6 lt b {
        g6 = 0
    }
    ram b = $ram_ign_slowest_jf
    if g6 gt b {
        g6 = 0
    }

    // increment buffer index and memorize time.
    ram a = $ram_ign_history_idx
    b = 1
    a = a+b
    b = $ign_history_idx_mask
    a = and
    ram $ram_ign_history_idx = a
    struct $ram_ign_history_jf . a = g6

    // ////////// compute new jiffy estimate.
    // average entire history.
    // x = total, y = sample, i = index = loop count, g6 = count of invalid samples.
    x = 0
    g6 = 0
    for {i = 0} {i lt $ign_history_len} step j = 1 {
        struct y = $ram_ign_history_jf . i
        if y eq 0 {
            a = g6
            b = 1
            g6 = a+b
        } else {
            a = ($ign_history_len / 2)
            b = y
            a = a+b
            y = a>>$ign_history_idx_bits
            x = x+y
        }
    }
    ram $ram_ign_avg_jf = x
    ram $ram_ign_bad_samples = g6
    //patch: dividing before summing (instead of after) is much simpler and faster because it prevents overflow.
    // but it means we could be reading as much as 16 jf too low (16 = ign_history_len).
    // that error is way less than 1 RPM on the slow end,
    // or about 1,000 RPM too fast on the fast end!
    // might need to tighten that up.  one simple way might be adding ign_history_len / 2 to each history record prior to dividing.
    // that didn't seem to help much in simple testing.
    // probly because jf_to_rpm has only 32 RPM resolution.

    if g6 gt {$ign_history_len / 4} {
        ram $ram_rpm_valid = 0
    } else {
        // convert jiffies b to new RPM estimate.
        callx  jf_to_rpm  x  pa
        ram $ram_avg_rpm = pa
        ram $ram_rpm_valid = 1

        // find RPM column in AFRC map.
        ram gb = $ram_avg_rpm
        for {i = 0} {i lt $rpm_ref_num_cells} step j = 1 {
            struct b = $ram_rpm_ref . i
            if b gt gb {
                ram $ram_afrc_rpm_col_idx = i
                jmp :rpm_found
            }
        }
        ram $ram_rpm_valid = 0
        :rpm_found
    }
end_event

func clear_ign_history {
    // invalidate the RPM estimate.
    ram $ram_rpm_valid = 0
    // the last known RPM estimate is retained here, not cleared.
    // clear the history so it won't be valid again until several more valid samples are collected.
    ram $ram_ign_bad_samples = $ign_history_len
    for {i = 0} {i lt $ign_history_len} step j = 1 {
        struct $ram_ign_history_jf . i = 0
    }
}

event ign_capture_timeout_handler
    // it's been too long since the last ignition pulse detect.
    callx clear_ign_history
end_event

event ustimer0_handler
end_event

event mstimer0_handler
    // unified 1-second periodic timer for all low-resolution tasks.

    // start timer again.
    mstimer0 = 1000

    // realtime counters in RAM.
    ram a = $ram_seconds_cnt
    b = 1
    a = a+b
    if a eq 60 {
        ram $ram_seconds_cnt = 0
        ram a = $ram_minutes_cnt
        b = 1
        ram $ram_minutes_cnt = a+b
        callx minute_events
    } else {
        ram $ram_seconds_cnt = a
    }

    // all 1-second functions here.
    callx check_power_relay
    callx check_communication
    callx start_daq_pass
end_event

:plan_transition_msg
    "PLAN\x0"

event mstimer2_handler
    // engine management plan tick timer.

    // restart timer.
    mstimer2 = $plan_tick_ms

    // start another TPS reading prior to every plan tick.
    // this will also invoke a o2 reading.  that's done last of all prior to plan_tick,
    // so there's minimal latency between that and the plan_tick utilizing it.
    ram a = $ram_adc_chn_pending
    if a eq 0 {
        callx  begin_adc_conversion  $tps_adc_channel
    }
end_event

func plan_tick {
    // poll the engine management plan.
    // call the transition function for the current plan.
    // this might perform a transition to some other plan, so it's done first.
    ram rtna = $ram_transition_func
    x = rtna
    call_indirect
    ram b = $ram_transition_func
    if x ne b {
        callx  set_text_flag  :plan_transition_msg
    }
    // call the puff length function for the current plan.
    // this is done last, so if a plan transition just happened, its new puff length will init here.
    ram rtna = $ram_puff_len_func
    call_indirect
}

event uart_rx_handler
    :again
        pollchar
        x = a
        if x eq -1 {
            event_return
        }
        if x eq 10 {
            callx  postpone_comm_restart
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
    callx  set_text_flag  :tx_overflow_msg
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

:afrc_coords_msg
    " map=\x0"

:o2_msg
    " o2=\x0"

:maf_msg
    " af=\x0"

:tps_msg
    " tp=\x0"

:block_temp_idx_msg
    " bti=\x0"

:afterstart_idx_msg
    " asi=\x0"

func start_daq_pass {
    // daq pass counter in RAM.
    ram a = $ram_daq_pass_cnt
    b = 1
    a = a+b
    i = a
    leds = i
    ram $ram_daq_pass_cnt = i

    ram a = $ram_enable_status_report
    if a ne 0 {
        a = i
        call :put4x

        a = :rpm_msg
        call :print_nt
        a = 0
        ram x = $ram_rpm_valid
        if x ne 0 {
            ram a = $ram_avg_rpm
        }
        call :put4x

        a = :puff_len_msg
        call :print_nt
        a = puff_len_us
        call :put4x
        putasc ","
        ram a = $ram_puff_count
        call :put4x

        a = :afrc_coords_msg
        call :print_nt
        ram a = $ram_afrc_rpm_col_idx
        call :put4x
        putasc ","
        ram a = $ram_afrc_maf_row_idx
        call :put4x

        a = :o2_msg
        call :print_nt
        struct a = $ram_last_adc_data . $o2_adc_channel
        call :put4x

        a = :maf_msg
        call :print_nt
        ram a = $ram_maf_adc_filtered
        call :put4x

        a = :tps_msg
        call :print_nt
        struct_read a = $ram_last_adc_data . $tps_adc_channel
        call :put4x
        putasc ","
        ram a = $ram_tps_avg
        call :put4x

        a = :block_temp_idx_msg
        call :print_nt
        ram a = $ram_block_temp_map_idx
        call :put4x

        a = :afterstart_idx_msg
        call :print_nt
        ram a = $ram_afterstart_map_idx
        call :put4x
    }

    // start to acquire & report all anmux channels.
    a = ($anmux_num_channels - 1)
    call :anmux_set_chn
    mstimer1 = $anmux_settle_ms

    // observe MCU utilization.  this RAM variable can be seen by the debugger.
    ram $ram_mcu_usage_cnt = usage_count
    usage_count = 0
}

event mstimer1_handler
    // anmux signal has settled.

    ram a = $ram_adc_chn_pending
    if a ne 0 {
        // ADC is busy right now.  wait a while & try again.
        mstimer1 = $anmux_retry_ms
        event_return
    }

    // start a reading from the current anmux channel.
    ram a = $ram_enable_status_report
    if a ne 0 {
        putasc " "
        putasc "s"
        call :anmux_get_chn
        asc b = "0"
        putchar a+b
        putasc "="
    }
    callx  begin_adc_conversion  $anmux_adc_channel
end_event

func begin_adc_conversion {next_channel in pa} {
    // begin SPI transaction, specifying Nano ADC channel to take effect NEXT
    // conversion after this one.

    ram $ram_adc_chn_pending = next_channel
    a = next_channel
    a = a<<4
    a = a<<4
    a = a<<1
    a = a<<1
    a = a<<1
    spi_data = a
    ram $ram_adc_junk = 1
}

event spi_done_handler
    // discard the results of the first SPI exchange with the ADC.  that's only for writing the channel num out to the ADC.
    ram a = $ram_adc_junk
    if a ne 0 {
        // start another SPI exchange to retrieve the actual reading.
        ram a = $ram_adc_chn_pending
        a = a<<4
        a = a<<4
        a = a<<1
        a = a<<1
        a = a<<1
        spi_data = a
        ram $ram_adc_junk = 0
        event_return
    }

    // memorize an actual ADC reading.
    ram i = $ram_adc_chn_pending
    ram $ram_adc_chn_pending = 0
    struct $ram_last_adc_data . i = spi_data

    // react to ADC reading.
    if i eq $tps_adc_channel {
        callx  begin_adc_conversion  $o2_adc_channel
        callx  interpret_tps
        event_return
    }
    if i eq $o2_adc_channel {
        callx  begin_adc_conversion  $maf_adc_channel
        event_return
    }
    if i eq $maf_adc_channel {
        callx  interpret_maf
        callx  plan_tick
        event_return
    }
    if i eq $anmux_adc_channel {
        ram a = $ram_enable_status_report
        if a ne 0 {
            // report anmux reading.
            a = spi_data

            call :put4x
        }

        // memorize anmux reading.
        call :anmux_get_chn
        struct $ram_last_anmux_data . a = spi_data

        // decrement anmux channel & start waiting again.
        call :anmux_get_chn
        if a ne 0 {
            b = -1
            a = a+b
            call :anmux_set_chn
            mstimer1 = $anmux_settle_ms
            event_return
        }

        // end of temperature daq pass.
        callx  interpret_block_temp

        // wrap up status report on UART.
        ram a = $ram_enable_status_report
        if a ne 0 {
            callx  report_plan
            callx  report_text_flags
            puteol
        }

        //TODO: is this a hack??
        ram $ram_dial_setting = spi_data

        event_return
    }
end_event

:power_lost_msg
    "PWL\x0"

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
    callx  save_persistent_data

    callx  set_text_flag  :power_lost_msg
end_event

:ign_off_msg
    "IGOF\x0"

event ign_switch_off_handler
    // set power-down deadline in RAM.  this makes the system remain powered for several more minutes, for cooldown data logging.
    ram a = $ram_minutes_cnt
    b = $power_extend_minutes
    ram $ram_power_down_at_min = a+b
    callx  set_text_flag   :ign_off_msg
end_event

:ign_on_msg
    "IGON\x0"

event ign_switch_on_handler
    ram $ram_power_down_at_min = $power_down_never
    callx  set_text_flag   :ign_on_msg
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

func minute_events {
    callx  check_power_down
}

:power_hold_msg
    "PWH\x0"

func check_power_relay {
    ram a = $ram_daq_pass_cnt
    ram b = $ram_relay_hold_at_pass
    if a eq b {
        // time to begin "solenoid saver" coil power reduction by PWM.
        power_duty = $power_duty_holding
        callx  set_text_flag  :power_hold_msg
    }
}

func check_power_down {
    // check power-down deadline in RAM.
    ram a = $ram_minutes_cnt
    ram b = $ram_power_down_at_min
    if a eq b {
        jmp :power_down
    }
}

:power_down
    // this code never returns.
    callx  save_persistent_data
    power_duty = $power_duty_opening
    error_halt_code $err_power_down

func save_persistent_data {
}

func check_communication {
    ram a = $ram_ftdi_downtime_remain_sec
    if a ne 0 {
        b = -1
        a = a+b
        ram $ram_ftdi_downtime_remain_sec = a
        if a eq 0 {
            callx  ftdi_power_on
        }
    }

    ram a = $ram_minutes_cnt
    ram b = $ram_comm_restart_at_min
    if a eq b {
        // comm restart is required.
        callx  postpone_comm_restart
        ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec
        callx  ftdi_power_off
    }
}

func postpone_comm_restart {
    ram a = $ram_minutes_cnt
    b = $comm_grace_period_min
    ram $ram_comm_restart_at_min = a+b
}

:ftdi_off_msg
    "FTOF\x0"

func ftdi_power_off {
    a = board_ctrl
    b = $not_ftdi_power_mask
    board_ctrl = and
    callx  set_text_flag  :ftdi_off_msg
}

:ftdi_on_msg
    "FTON\x0"

func ftdi_power_on {
    a = board_ctrl
    b = $ftdi_power_mask
    board_ctrl = or
    callx  set_text_flag  :ftdi_on_msg
}

func clear_ram_page {page in av_ad_hi} {
    a = 0
    b = 2
    :clear_next_word
        av_ad_lo = a
        av_write_data = 0
        a = ad0
    bn az :clear_next_word
}

func set_text_flag {flag_addr in pa} {
    ram a = $ram_next_tfp_idx
    struct $ram_text_flag_pointers . a = flag_addr
    a = flag_addr
//TODO: ^^^ is this a bug?  should be ram a = $ram_next_tfp_idx instead??
    b = -1
    a = a+b
    b = $tfp_mask
    ram $ram_next_tfp_idx = and
}

func unique_text_flag {flag_addr in pa} {
    for {i = 0} {i lt $num_text_flag_pointers} step j = 1 {
        struct b = $ram_text_flag_pointers . i
        if b eq flag_addr {
            jmp :skip
        }
    }
    callx  set_text_flag  flag_addr
:skip
}

:text_flags_msg
    " tf=\x0"

func report_text_flags {
    a = :text_flags_msg
    call :print_nt
    for {i = 0} {i lt $num_text_flag_pointers} step j = 1 {
        struct b = $ram_text_flag_pointers . i
        if b ne 0 {
            call :print_nt
            putasc ","
            struct $ram_text_flag_pointers . i = 0
        }
    }
}

:plan_msg
    " pl=\x0"
:manual_trim_msg
    " mt=\x0"

func report_plan {
    a = :plan_msg
    call :print_nt
    ram a = $ram_plan_name
    call :print_nt

    a = :manual_trim_msg
    call :print_nt
    ram a = $ram_run_manual_trim
    call :put4x
}

func interpret_maf {
    // range 0 to 1023 = 0x3ff at the ADC.

    struct x = $ram_last_adc_data . $maf_adc_channel
    //patch: do some averaging here, like interpret_tps.
    ram $ram_maf_adc_filtered = x

    // recover linear flow from MAF ADC count using hi-res method,
    // for actual flow feeding into final puff multiply later.
    // 256 cell Brute-force lookup might take e.g. 80us to run.  That's 4 jf,
    // or 5% of ignition cycle at max RPM.
    ram $ram_maf_valid = 0
    for {i = 0} {i lt $maf_ref_num_cells} step j = 1 {
        struct b = $ram_maf_ref . i
        if b gt x {
            ram $ram_maf_flow_hi_res = i
            ram $ram_maf_valid = 1
            jmp :maf_done
        }
    }
    :maf_done

    // quantize linear flow from hi-res to lo-res for indexing into AFRC map rows.
    // Lo-res = hi-res >> 2.
    ram a = $ram_maf_flow_hi_res
    a = a>>1
    ram $ram_afrc_maf_row_idx = a>>1
}

func interpret_tps {
    struct b = $ram_last_adc_data . $tps_adc_channel
    // reverse the scale.
    a = 0x0fff
    b = xor
    // memorize reading into slot 0 and shift history up 1 slot.  total up as we go.
    ga = b
    x = 0
    for {i = 0} {i lt $tps_history_len} step j = 1 {
        struct gb = $ram_tps_history . i
        y = gb
        x = x+y
        struct $ram_tps_history . i = ga
        ga = gb
    }
    // memorize average.
    a = x
    a = a>>1
    ga = a>>1
    ram $ram_tps_avg = ga

    :end
}

func jf_to_rpm {jiffies in pa} {rpm out pa} {
    // resolution = 32 rpm.
    b = jiffies
    a = 0x5573
    // = 700000 >> 5
    call :divide
    a = b
    a = a<<4
    rpm = a<<1
}

func check_engine_stop {did_stop out pa} {
    // returns 1 if transitioned to stop, else 0.

    // transition to plan_stop if ignition switch is turned off AND rpm estimate is invalid.
    // requiring both conditions prevents spurious noise readings from shutting down the injection.
    if_any_set power_duty $ign_switch_off_mask {
        ram a = $ram_rpm_valid
        if a eq 0 {
            ram rtna = $ram_destroy_plan_func
            call_indirect
            callx  init_plan_stop
            rtn 1
        }
    }
    rtn 0
}

