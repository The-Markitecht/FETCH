:plan_name_stop
    "STP\x0"

func init_plan_stop
    // set up the stop plan.
    call :clear_ign_history
    // set noise filter to measure RPM between 50 and 1160 to indicate cranking.
    ram $ram_ign_fastest_jf = ([rpm_to_jf 1160])
    ram $ram_ign_slowest_jf = ([rpm_to_jf 50])    
    ign_timeout_len_jf = ([rpm_to_jf 50])  
    // normally puff length is not touched by an init func.
    // this one does it because it's part of the program boot,
    // and also a good idea whenever stopping the engine.
    // this might interrupt a puff in mid-pulse, but no matter in this case.
    ram $ram_next_puff_len_us = 0
    puff_len_us = 0
    
    // memorize state.
    ram $ram_plan_name = :plan_name_stop
    ram $ram_puff_len_func = :puff_len_stop
    ram $ram_transition_func = :leave_stop
    ram $ram_destroy_plan_func = :destroy_plan_stop
end_func

func destroy_plan_stop
end_func

func puff_len_stop
    ram $ram_next_puff_len_us = 0
end_func

func leave_stop
    // leave stop plan if ignition switch is turned on AND more than half if the ignition history is valid.
    // requiring both conditions prevents spurious noise readings from starting up the injection.
    a = power_duty
    b = $ign_switch_off_mask
    bn and0z :stay
        ram a = $ram_ign_bad_samples 
        b = ($ign_history_len / 2)
        br gt :stay
            call :destroy_plan_stop
            call :init_plan_crank
    :stay
end_func

