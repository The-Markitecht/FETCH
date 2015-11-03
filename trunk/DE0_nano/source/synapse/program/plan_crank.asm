
setvar crank_success_rpm            800
setvar crank_min_puff_len_us        10000
setvar crank_max_puff_len_us        20000
setvar crank_incr_us_per_puff       2500
    // escalating puff length by 1500 us per puff while cranking slowly at e.g. 80 RPM
    // on a frozen winter morning will ramp up from 10000 to 20000 us length in about 5 seconds.
setvar crank_max_puffs              (($crank_max_puff_len_us - $crank_min_puff_len_us) / $crank_incr_us_per_puff)

:plan_name_crank
    "CR\x0"

func init_plan_crank {
    // set up the crank plan.
    ram $ram_puff_count = 0
    // set noise filter to measure RPM between 50 and 8000 to indicate running.
    ram $ram_ign_fastest_jf = ([rpm_to_jf 8000])
    ram $ram_ign_slowest_jf = ([rpm_to_jf 50])        
    ign_timeout_len_jf = ([rpm_to_jf 50])  
    // normally puff length is not touched by an init func.
    // this one does it because it's the beginning of a crank cycle, and puff length 
    // should be enabled for the first puff.  otherwise the first puff would be missed.
    ram $ram_next_puff_len_us = $crank_min_puff_len_us
    puff_len_us = $crank_min_puff_len_us
    // clear ignition history again to eliminate samples where the motor kept spinning after switching from plan_run to plan_stop.
    callx  clear_ign_history
    
    // memorize state.
    ram $ram_plan_name = :plan_name_crank
    ram $ram_puff_len_func = :puff_len_crank
    ram $ram_transition_func = :leave_crank
    ram $ram_destroy_plan_func = :destroy_plan_crank
}

func destroy_plan_crank {
}

func puff_len_crank {
    ram a = $ram_puff_count
    b = $crank_max_puffs
    br gt :puff_limit
        // linear escalation from min to max puff length, at a slope of crank_incr_us_per_puff.
        b = $crank_incr_us_per_puff
        call :multiply
        b = $crank_min_puff_len_us
        ram $ram_next_puff_len_us = a+b
        jmp :done
    :puff_limit
        // prevent the puff counter from going higher & eventually rolling over.
        ram $ram_puff_count = $crank_max_puffs
        // accept max puff len.
        ram $ram_next_puff_len_us = $crank_max_puff_len_us
    :done    
}

func leave_crank {
    callx  check_engine_stop  a
    bn az :done

    // transition to warmup if RPM exceeds crank_success_rpm.
    ram a = $ram_rpm_valid
    br az :stay
        ram a = $ram_avg_rpm
        b = $crank_success_rpm
        br lt :stay
            callx  destroy_plan_crank
            callx  init_plan_warmup
    :stay
    
    :done
}

