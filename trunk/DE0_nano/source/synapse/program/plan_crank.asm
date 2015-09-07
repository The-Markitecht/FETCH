:plan_name_crank
    "CR\x0"

func init_plan_crank
    // set up the crank plan.
    ram $ram_puff_count = 0
    // normally puff length is not touched by an init func.
    // this one does it because it's the beginning of a crank cycle, and puff length 
    // should be enabled for the first puff.  otherwise the first puff would be missed.
    ram $ram_next_puff_len_us = $crank_min_puff_len_us
    puff_len_us = $crank_min_puff_len_us
    
ram a = $ram_puff_count
br az :pc_ok
    error_halt_code $err_sdram_data
:pc_ok    
    
    // memorize state.
    ram $ram_plan_name = :plan_name_crank
    ram $ram_puff_len_func = :puff_len_crank
    ram $ram_transition_func = :leave_crank
    ram $ram_destroy_plan_func = :destroy_plan_crank
end_func

func destroy_plan_crank
end_func

func puff_len_crank
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
end_func

func leave_crank
    call :check_engine_stop
    bn az :done

    // transition to warmup if RPM exceeds crank_success_rpm.
    ram a = $ram_rpm_valid
    bn az :stay
        ram a = $ram_avg_rpm
        b = $crank_success_rpm
        br lt :stay
            call :destroy_plan_crank
            call :init_plan_stop
    :stay
    
    :done
end_func

