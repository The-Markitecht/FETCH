
setvar      num_rpm_cells           13
:rpm_cells
    500
    625
    781
    977
    1221
    1526
    1907
    2384
    2980
    3725
    4657
    5821
    7276
    0xffff

ram_define  stoich_map              ($num_rpm_cells * 2)
    
func find_rpm_cell
    y = a
    i = 1
    b = 0xffff
    br eq :found
    :next_cell
        j = :rpm_cells
        fetch a from i+j
        b = y
        br gt :found
        j = 1
        i = i+j
    jmp :next_cell
    :found
    j = -1
    a = i+j
end_func    
    
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

// trim puff length by o2 sensor every 200 ms.
setvar      lrns_ticks_per_o2_trim   (int(200 / $plan_tick_ms))
ram_define  ram_lrns_ticks_remain
    
// trim puff length as needed.
setvar      lrns_puff_step_up_us     1000
setvar      lrns_puff_step_down_us   (0xffff - 100)
setvar      lrns_puff_max_us         10000
setvar      lrns_puff_min_us         2000

        

func puff_len_learn_stoich
    ram i = $ram_lrns_ticks_remain
    if i gt 0 {
        j = -1
        ram $ram_lrns_ticks_remain = i+j
    } else {
        ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim
        
        // i = old puff length, j = puff length increment.
        ram i = $ram_next_puff_len_us
        j = 0
        ram g6 = $ram_o2_state
        call :interpret_o2
        ram g7 = $ram_o2_state        
        if g7 eq $o2_state_lean {
            // sensing a lean condition.  trim up to enrich.
            if i lt $lrns_puff_max_us {
                j = $lrns_puff_step_up_us
            }
            if g6 eq $o2_state_rich {
                // o2 state just switched to lean.  adjust map.
                call :learn_stoich_map
            }
        } else {
            // sensing a rich condition.  trim down to lean it out.
            if i gt $lrns_puff_min_us {
                j = $lrns_puff_step_down_us
            }
        }
        ram $ram_next_puff_len_us = i+j
    }        
end_func

func learn_stoich_map
    ram a = $ram_rpm_valid
    if a eq 1 {
stopped here
        ram i = $ram_next_puff_len_us
        a = 
        call :find_rpm_cell
    }
end_func

ram_define  ram_o2_state
    setvar  o2_state_init           0
    setvar  o2_state_lean           1
    setvar  o2_state_rich           2
ram_define  ram_o2_been_rich
ram_define  ram_o2_been_lean
setvar      o2_lean_thresh_adc      450
setvar      o2_rich_thresh_adc      700

func interpret_o2
    ram a = $ram_o2_state
    if a ne $o2_state_lean {
        // check sensor for lean state.
        a = $o2_adc_channel
        struct_read $ram_last_adc_data
        a = $o2_lean_thresh_adc
        if a gt b {
            ram $ram_o2_state = $o2_state_lean
            ram $ram_o2_been_lean = 1
        }
    }
    if a ne $o2_state_rich {
        // check sensor for rich state.
        a = $o2_adc_channel
        struct_read $ram_last_adc_data
        a = $o2_rich_thresh_adc
        if a gt b {
            ram $ram_o2_state = $o2_state_rich
            ram $ram_o2_been_rich = 1
        }
    }
end_func

func init_o2_state
    ram $ram_o2_state = $o2_state_init
    ram $ram_o2_been_lean = 0
    ram $ram_o2_been_rich = 0
end_func

func leave_learn_stoich
    call :check_engine_stop
end_func

func clear_stoich_map_cmd
    for {i = 0} {i lt $num_rpm_cells} step j = 1 {
        a = i
        b = 3000
        struct_write $stoich_map
    }
end_func
