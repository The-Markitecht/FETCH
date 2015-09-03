:plan_name_warmup
    "WM\x0"

func init_plan_warmup
    // set up the warmup plan.
    
    // memorize state.
    ram $ram_plan_name = :plan_name_warmup
    ram $ram_puff_len_func = :puff_len_warmup
    ram $ram_transition_func = :leave_warmup
    ram $ram_destroy_plan_func = :destroy_plan_warmup
end_func

func destroy_plan_warmup
end_func

func puff_len_warmup
    ram $ram_next_puff_len_us = 5000
    //patch: add the dial setting to this, for testing.
end_func

func leave_warmup
    call :check_engine_stop
    bn az :done

    // transition to plan_run if engine temp exceeds warmup_success_temp_adc.
    a = $anmux_engine_block_temp
    struct_read $ram_last_anmux_data
    a = $warmup_success_temp_adc
    br gt :stay
        call :destroy_plan_warmup
        call :init_plan_run
    :stay
    
    :done
end_func

