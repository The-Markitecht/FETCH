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



setvar      warmup_timeout_sec           60
ram_define  ram_warmup_timeout_at_pass
setvar      warmup_success_temp_adc      0x4c0
    // 0x4c0 = 1216 = 120 degF at the sensor location outside the engine block.
setvar      warmup_min_temp_adc          750
    // 750 = 0 degF.
setvar      warmup_max_enrichment_us     6000
setvar      warmup_us_per_cold_adc       (int($warmup_max_enrichment_us / ($warmup_success_temp_adc - $warmup_min_temp_adc)))
setvar      warmup_min_puff_len_us       2500
    // max 6000 & min 4500 over a temp range 750 to 0x4c0 gives 6900 us puff at 74 deg F.  program rev 594.
setvar      warmup_limping_enrichment_us 2000
    // this is used if the engine temp is unavailable.

:plan_name_warmup
    "WM\x0"

func init_plan_warmup {
    // set up the warmup plan.
    ram a = $ram_daq_pass_cnt
    b = $warmup_timeout_sec
    ram $ram_warmup_timeout_at_pass = a+b

    // memorize state.
    ram $ram_plan_name = :plan_name_warmup
    ram $ram_puff_len_func = :puff_len_warmup
    ram $ram_transition_func = :leave_warmup
    ram $ram_destroy_plan_func = :destroy_plan_warmup
}

func destroy_plan_warmup {
}

func puff_len_warmup {
    // x = enrichment us.
    x = $warmup_limping_enrichment_us

    // check engine block temp sensor.  if valid, enrich by a linear function:
    // {warmup_min_temp_adc...warmup_success_temp_adc} -> {$warmup_max_enrichment_us...0}
    a = $anmux_engine_block_temp
    struct_read $ram_last_anmux_data
    // b = sensor reading in adc counts.
    a = $temp_ceiling_adc
    br lt :temp_invalid
        a = $warmup_success_temp_adc
        br lt :too_warm
            a = $warmup_min_temp_adc
            br lt :in_range
                b = $warmup_min_temp_adc
            :in_range
            // negate the sensor reading so as to subtract it from warmup_success_temp_adc.
            a = 0xffff
            b = xor
            a = 1
            b = a+b
            a = $warmup_success_temp_adc
            b = a+b
            // b = how many counts "cold" we are.  multiply that by the slope warmup_us_per_cold_adc.
            a = $warmup_us_per_cold_adc
            call :multiply
            x = a
        :too_warm
    :temp_invalid

    // apply total of base amount and enrichment.
    // $warmup_min_puff_len_us <= total <= ($warmup_min_puff_len_us + $warmup_max_enrichment_us)
    a = $warmup_min_puff_len_us
    b = x
    ram $ram_next_puff_len_us = a+b
}

func leave_warmup {
    callx  check_engine_stop  a
    bn az :done

    // transition to plan_run if warmup has expired.
    ram a = $ram_daq_pass_cnt
    ram b = $ram_warmup_timeout_at_pass
    if a gt b {
        callx  destroy_plan_warmup
        callx  init_plan_run
        jmp :done
    }

    // transition to plan_run if engine block temp sensor is valid, and temp
    // exceeds warmup_success_temp_adc.
    a = $anmux_engine_block_temp
    struct_read $ram_last_anmux_data
    a = $temp_ceiling_adc
    if a gt b {
        a = $warmup_success_temp_adc
        if a lt b {
            callx  destroy_plan_warmup
            callx  init_plan_run
        }
    }

    :done
}

