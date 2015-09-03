:plan_name_run
    "RN\x0"

func init_plan_run
    // set up the run plan.
    
    // memorize state.
    ram $ram_plan_name = :plan_name_run
    ram $ram_puff_len_func = :puff_len_run
    ram $ram_transition_func = :leave_run
    ram $ram_destroy_plan_func = :destroy_plan_run
end_func

func destroy_plan_run
    call :clear_ign_history
end_func

func puff_len_run
    ram $ram_next_puff_len_us = 3000
end_func

func leave_run
    call :check_engine_stop
end_func

