
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

ram_define  ram_smap                ($num_rpm_cells * 2)
setvar      lrns_map_step           200      

ram_define  ram_last_learn_second

setvar      num_tps_cells           $num_rpm_cells
ram_define  ram_tps_reference       ($num_tps_cells * 2)
ram_define  ram_tps_state           
    setvar  tps_state_closed        0
    setvar  tps_state_cruise        1
    setvar  tps_state_accel1        2
    setvar  tps_state_accel2        3
    setvar  tps_state_open          4
setvar      num_tps_states          5
ram_define  ram_tps_enrich_thou     ($num_tps_states * 2)
ram_define  ram_tps_avg             
setvar      tps_history_len         4
    
// trim puff length by o2 sensor every 200 ms.
setvar      lrns_ticks_per_o2_trim  (int(200 / $plan_tick_ms))
ram_define  ram_lrns_ticks_remain
    
// trim puff length as needed.
setvar      lrns_puff_step_up_us     600
setvar      lrns_puff_step_down_us   (0xffff - 32)
setvar      lrns_puff_max_us         10000
setvar      lrns_puff_min_us         2000

// o2 sensor interpetation & state machine.
ram_define  ram_o2_state
    setvar  o2_state_init           0
    setvar  o2_state_lean           1
    setvar  o2_state_rich           2
ram_define  ram_o2_been_rich
ram_define  ram_o2_been_lean
setvar      o2_lean_thresh_adc      450
setvar      o2_rich_thresh_adc      700

:plan_name_learn_stoich
    "LN\x0"
        
func init_plan_learn_stoich {
    // set up the learn_stoich plan.
    ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim
    
    // memorize state.
    ram $ram_plan_name = :plan_name_learn_stoich
    ram $ram_puff_len_func = :puff_len_learn_stoich
    ram $ram_transition_func = :leave_learn_stoich
    ram $ram_destroy_plan_func = :destroy_plan_learn_stoich
}

func destroy_plan_learn_stoich {
}
        
:lrns_trim_up_msg
    "trR\x0"
:lrns_trim_down_msg
    "trL\x0"

func puff_len_learn_stoich {
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
        callx  interpret_o2
        ram g7 = $ram_o2_state        
        if g7 eq $o2_state_lean {
            // sensing a lean condition.  trim up to enrich.
            if i lt $lrns_puff_max_us {
                j = $lrns_puff_step_up_us
            }
            callx  set_text_flag  :lrns_trim_up_msg
            if g6 eq $o2_state_rich {
                // o2 state just switched to lean.  adjust map.
                callx  learn_smap
            }
        } else {
            // sensing a rich condition.  trim down to lean it out.
            if i gt $lrns_puff_min_us {
                j = $lrns_puff_step_down_us
            }
            callx  set_text_flag  :lrns_trim_down_msg
        }
        ram $ram_next_puff_len_us = i+j
    }        
}

:lrns_enrich_msg
    "lrnR\x0"
:lrns_lean_msg
    "lrnL\x0"

func learn_smap {
    ram a = $ram_rpm_valid
    if a eq 1 {
        // let g6 = map cell num.  x = map puff len.  i = observed stoich puff len.
        ram pa = $ram_avg_rpm
        callx  find_rpm_cell  pa  g6
        a = g6
        struct_read $ram_smap
        x = b
        ram i = $ram_next_puff_len_us
        y = (0xffff - $lrns_map_step + 1)
        if x+y gt i {
            // map is richer than observed stoich.  lean the map 1 step.
            a = g6
            b = x+y
            struct_write $ram_smap
            callx  set_text_flag  :lrns_lean_msg
        }
        y = $lrns_map_step
        if x+y lt i {
            // map is leaner than observed stoich.  rich the map 1 step.
            a = g6
            b = x+y
            struct_write $ram_smap
            callx  set_text_flag  :lrns_enrich_msg
        }
        
        // dump smap if we haven't done so lately.
        ram a = $ram_last_learn_second
        ram b = $ram_seconds_cnt
        if a ne b {
            callx  dump_smap_cmd
        }
    }
}

:o2_rich_msg
    "o2R\x0"
:o2_lean_msg
    "o2L\x0"

func interpret_o2 {
    ram a = $ram_o2_state
    if a ne $o2_state_lean {
        // check sensor for lean state.
        a = $o2_adc_channel
        struct_read $ram_last_adc_data
        a = $o2_lean_thresh_adc
        if a gt b {
            ram $ram_o2_state = $o2_state_lean
            ram $ram_o2_been_lean = 1
            // callx  set_text_flag  :o2_lean_msg            
        }
    }
    if a ne $o2_state_rich {
        // check sensor for rich state.
        a = $o2_adc_channel
        struct_read $ram_last_adc_data
        a = $o2_rich_thresh_adc
        if a lt b {
            ram $ram_o2_state = $o2_state_rich
            ram $ram_o2_been_rich = 1
            // callx  set_text_flag  :o2_rich_msg            
        }
    }
}

func init_o2_state {
    ram $ram_o2_state = $o2_state_init
    ram $ram_o2_been_lean = 0
    ram $ram_o2_been_rich = 0
}

func leave_learn_stoich {
    callx  check_engine_stop  pa
}

func find_rpm_cell {rpm in pa} {cell out pa} {
    i = 1
    a = rpm
    b = 0xffff
    br eq :found
    :next_cell
        j = :rpm_cells
        fetch a from i+j
        b = rpm
        br gt :found
        j = 1
        i = i+j
    jmp :next_cell
    :found
    j = -1
    rtn i+j
}
    
func dump_smap_cmd {
    ram pa = $ram_avg_rpm
    callx  find_rpm_cell  pa  y
    for {x = 0} {x lt $num_rpm_cells} step 1 {
        a = x
        struct_read $ram_smap
        a = b
        call put4x
        if x eq y {
            putasc "<"
        }
        putasc " "
    }
    puteol
}
    
func load_smap_cmd {
    for {i = 0} {i lt $num_rpm_cells} step j = 1 {
        call  get4x
        b = a
        a = i
        struct_write $ram_smap
        getchar
    }
}

func clear_smap_cmd {
    for {i = 0} {i lt $num_rpm_cells} step j = 1 {
        a = i
        b = 3000
        struct_write $ram_smap
    }
}
