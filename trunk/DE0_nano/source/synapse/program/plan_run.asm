:plan_name_run
    "RN\x0"

setvar      run_puff_max_us         10000
setvar      run_puff_min_us         2000
        
ram_define  ram_run_manual_trim_thou         
    // max trim is about 200 thou prior to multiplier overflow.
    // or more if the smap puff is below 8000.
    // trim resolution is 4 thou due to multiplier.
    // smap resolution for trimming is 16 us.
    // final trim enrichment us resolution is 16 us.
setvar      run_manual_trim_step_thou   4
    
func trim_lean_cmd {
    ram a = $ram_run_manual_trim_thou
    if a = 0 {
    } else {
        b = ($run_manual_trim_step_thou ^ 0xffff + 1)
        ram $ram_run_manual_trim_thou = a+b
    }
}

func trim_rich_cmd {
    ram a = $ram_run_manual_trim_thou
    if a gt 800 {
    } else {
        b = $run_manual_trim_step_thou
        ram $ram_run_manual_trim_thou = a+b
    }
}

func trim_2lean_cmd {
    ram a = $ram_run_manual_trim_thou
    if a = 0 {
    } else {
        b = (($run_manual_trim_step_thou << 3) ^ 0xffff + 1)
        ram $ram_run_manual_trim_thou = a+b
    }
}

func trim_2rich_cmd {
    ram a = $ram_run_manual_trim_thou
    if a gt 800 {
    } else {
        b = ($run_manual_trim_step_thou << 3)
        ram $ram_run_manual_trim_thou = a+b
    }
}

func init_plan_run {
    // set up the run plan.
    ram $ram_run_manual_trim_thou = 0
    
    // memorize state.
    ram $ram_plan_name = :plan_name_run
    ram $ram_puff_len_func = :puff_len_run
    ram $ram_transition_func = :leave_run
    ram $ram_destroy_plan_func = :destroy_plan_run
}

func destroy_plan_run {
}

func puff_len_run {
    ram a = $ram_rpm_valid
    if a eq 1 {
        // read smap puff into ga
        ram pa = $ram_avg_rpm
        callx  find_rpm_cell  pa  a
        struct_read $ram_smap
        ga = b
        
        // calculate manual enrichment in us.  apply a total of 10 bits of right-shift to 
        // implement division by 1024 (thou unit).  spread them out to prevent overflow.
        ram a = $ram_run_manual_trim_thou
        a = a>>1
        b = a>>1
        a = ga
        a = a>>4
        call  multiply        
        a = a>>4
        
        // add enrichment to smap puff.
        b = ga
        ga = a+b
        
        // determine TPS enrichment for acceleration.
        x = 0
        ram a = $ram_tps_state
        struct_read $ram_tps_enrich_thou
        if 0 ne b {
            // calculate TPS enrichment in us.  apply a total of 10 bits of right-shift to 
            // implement division by 1024 (thou unit).  spread them out to prevent overflow.
            a = b
            a = a>>1
            b = a>>1
            a = ga
            a = a>>4
            call  multiply        
            a = a>>4
            
            // add enrichment to smap puff.
            b = ga
            ga = a+b
        }
        
        // memorize total puff.
        ram $ram_next_puff_len_us = ga
    }
}

func leave_run {
    callx  check_engine_stop  pa
}

