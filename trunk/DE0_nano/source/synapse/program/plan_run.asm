:plan_name_run
    "RN\x0"

// trim puff length by o2 sensor every 200 ms.
setvar      run_ticks_per_o2_trim   (int(200 / $plan_tick_ms))
ram_define  ram_run_ticks_remain
    
// trim puff length as needed, by about 1000 us per second.
setvar      run_puff_step_up_us     200
setvar      run_puff_step_down_us   (0xffff - 100)
setvar      run_puff_max_us         10000
setvar      run_puff_min_us         2000

setvar      o2_lean_thresh_adc      588
        
        
func init_plan_run {
    // set up the run plan.
    
    // memorize state.
    ram $ram_plan_name = :plan_name_run
    ram $ram_puff_len_func = :puff_len_run
    ram $ram_transition_func = :leave_run
    ram $ram_destroy_plan_func = :destroy_plan_run
}

func destroy_plan_run {
}

func puff_len_run {
    ram i = $ram_run_ticks_remain
    if i gt 0 {
        j = -1
        ram $ram_run_ticks_remain = i+j
    } else {
        ram $ram_run_ticks_remain = $run_ticks_per_o2_trim
        
        // i = old puff length, j = puff length increment.
        ram i = $ram_next_puff_len_us
        j = 0
        a = $o2_adc_channel
        struct_read $ram_last_adc_data
        if b lt $o2_lean_thresh_adc {
            // sensing a lean condition.  trim up to enrich.
            if i lt $run_puff_max_us {
                j = $run_puff_step_up_us
            }
        } else {
            // sensing a rich condition.  trim down to lean it out.
            if i gt $run_puff_min_us {
                j = $run_puff_step_down_us
            }
        }
        ram $ram_next_puff_len_us = i+j
    }    
}

func leave_run {
    callx  check_engine_stop
}

