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
    if a eq 0 {
    } else {
        b = (($run_manual_trim_step_thou ^ 0xffff) + 1)
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
    if a eq 0 {
    } else {
        b = ((($run_manual_trim_step_thou << 3) ^ 0xffff) + 1)
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

:tps_accel2_msg
    "tpsa2\x0"
:tps_open_msg
    "tpsop\x0"

func puff_len_run {
    ram a = $ram_rpm_valid
    if a eq 1 {

ram_define  ram_maf_raw_adc
ram_define  ram_maf_adc
ram_define  ram_maf_flow_hi_res
ram_define  ram_afrc_maf_row_idx
ram_define  ram_afrc_rpm_col_idx
ram_define  ram_block_temp_map_idx
ram_define  ram_afterstart_map_idx
ram_define  ram_stoich_learn_trim
ram_define  ram_manual_trim
ram_define  ram_total_trim

setvar afrc_row_len_bytes

        // offset and clamp the MAF ADC count to 0..511.
        
        
        // recover linear flow from MAF ADC count using hi-res method, 
        // for actual flow feeding into final puff multiply.  
        // table len 256
        // Brute-force lookup might take e.g. 80us to run.  That's 4 jf, 
        // or 5% of ignition cycle at max RPM.
        
        
        // quantize linear flow from hi-res to lo-res for indexing into AFRC map.
        // Lo-res = hi-res >> 2.  

        
        // look up Air/Fuel Ratio Correction in AFRC map.
        // index rows by MAF.
        ram a = $ram_afrc_maf_row_idx
        b = $afrc_cells_per_row
        nop
        nop
        nop
        nop
        b = product_lo
        // index columns by RPM.
        ram a = $ram_afrc_rpm_col_idx
        a = a+b
        struct_read $shadow_afrc_map_base
        ga = b
        
        // ga = total trim factor as integer.
        
        
        // look up block temperature map trim factor.


        // look up afterstart map trim factor.
        

        // apply stoich learning trim factor.
        
        
        // apply manual trim factor.

        // clamp the total trim between 0.5 and 2.0 trim factor equivalent 
        // ( = 0 to 24576 inclusive).  best to do this instead using saturating addition (at 24576) in the previous step.
        

        // final multiplication for puff length.
        // (MAF linear flow) * (stoich ratio constant) * (total trim as floating point) = (puff length jf).  
        // here the total trim float will have to be represented as a fraction (num/denom).
        // stoich ratio constant (8) (really the conversion factor from linear
        // flow to nominal jf)  is folded into that denominator (16384) at compile time.  
        // that makes denom = 2048 = 11 bits.  so:
        // gb = (puff len jf) = (MAF linear flow) * [(total trim) + 8192] >> 11
        a = ga
        b = 8192
        a = a+b
        ram b = $ram_maf_flow_hi_res
        nop
        nop
        nop
        nop
        // gb = 32-bit product shifted >> 11.  lower 11 bits of product_hi are
        // explicitly moved to upper 11 bits of gb.
        a = product_lo
        b = product_hi
        a = a>>4
        a = a>>4
        a = a>>1
        a = a>>1
        gb = a>>1
        a = b
        a = a<<4
        a = a<<1
        b = gb
        gb = or


        // clamp the (puff length jf) to sane range.  max is the floating duty cycle.  min is the safety amount to keep motor running and maybe prevent leaning damage.


        // shut off puff during closed throttle engine braking.
        
        
// old code:
        // read smap puff into ga
        ram pa = $ram_avg_rpm
        callx  find_rpm_cell  pa  a
        gb = a
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
        
        //// determine TPS enrichment for acceleration.
        //ram x = $ram_tps_state
        //if x eq $tps_state_accel2 {
            //callx  unique_text_flag  :tps_accel2_msg
        //}
        //if x eq $tps_state_open {
            //callx  unique_text_flag  :tps_open_msg
        //}
        //// index into maps by TPS state.
        //i = 0
        //j = $num_tps_cells
        //y = -1
        //:next_state
        //br xz :found_state
            //i = i+j
            //x = x+y
        //jmp :next_state        
        //:found_state
        //// index into maps by RPM.
        //j = gb
        //a = i+j
        //// convert from words to bytes.
        //a = a<<1
        //// add map address.
        //b = :ram_tps_closed_enrich_us
        //a = a+b

        //// add enrichment to smap puff.
        //b = ga
        //ga = a+b
        
        // memorize total puff.
        ram $ram_next_puff_len_us = ga
    }
}

func leave_run {
    callx  check_engine_stop  pa
}

