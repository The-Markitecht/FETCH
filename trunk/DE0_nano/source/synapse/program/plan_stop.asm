:plan_name_stop
    "STP\x0"

func init_plan_stop
    // set up the stop plan.
    // look for RPM between 50 and 1160 to indicate cranking.
    ram $ram_ign_fastest_jf = ([rpm_to_jf 1160])
    ram $ram_ign_slowest_jf = ([rpm_to_jf 50])    
    
    // memorize state.
    ram $ram_plan_name = :plan_name_stop
    ram $ram_puff_len_func = :puff_len_stop
    ram $ram_transition_func = :leave_stop
end_func

func destroy_plan_stop
end_func

func puff_len_stop
end_func

func leave_stop
end_func

