:plan_name_learn_stoich
    "LN\x0"
        
func init_plan_learn_stoich
    // set up the learn_stoich plan.
    
    // memorize state.
    ram $ram_plan_name = :plan_name_learn_stoich
    ram $ram_puff_len_func = :puff_len_learn_stoich
    ram $ram_transition_func = :leave_learn_stoich
    ram $ram_destroy_plan_func = :destroy_plan_learn_stoich
end_func

func destroy_plan_learn_stoich
end_func

func puff_len_learn_stoich
    
end_func

func leave_learn_stoich
    call :check_engine_stop
end_func

