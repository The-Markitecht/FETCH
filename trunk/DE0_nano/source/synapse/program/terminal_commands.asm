
ram_define      ram_terminal_connected

:cmd_table
    "  hello"
        ([label hello_cmd])
    "  plstp"
        ([label set_plan_stop_cmd])
    "   plcr"
        ([label set_plan_crank_cmd])
    "   plwm"
        ([label set_plan_warmup_cmd])
    "   plrn"
        ([label set_plan_run_cmd])
    "   plln"
        ([label set_plan_learn_cmd])
    "clstmap"
        ([label clear_smap_cmd])
    "\x0\x0"


func parse_key
    // memorize into ram_key_buf, pushing down existing content.
    push a
    x = a
    for {i = $key_buf_max} {i ge 0} step j = -1 {
        a = i
        struct_read $ram_key_buf
        y = b            
        a = i
        b = x
        struct_write $ram_key_buf                        
        x = y
    }
    pop a
    if a eq 13 {
        call :parse_command
    }
end_func

:cmd_ack_msg
    "OK\x0"

func parse_command
    x = :cmd_table    
    :next_cmd
        fetch a from x
        br az :done
        
        for {i = 0} {i lt $key_buf_max} step j = 1 {
            a = i
            call :fetch_byte
            y = a
            asc b = " "
            if a ne b {
                asc b = "*"
                br eq :matched  
                    // parameter character.  succeed early.
                a = i
                struct_read $ram_key_buf
                a = y
                bn eq :no_match
            }
        }
        
        // at this point we have a match on the record beginning at x.
        :matched
        a = :cmd_ack_msg
        call :set_text_flag        
        y = ($key_buf_len / 2)
        fetch rtna from x+y
        call_indirect
        jmp :done
        
        :no_match
        // if ram_terminal_connected is still 0, quit searching after the very first command in the table.
        ram a = $ram_terminal_connected
        br az :done
        
        y = (($key_buf_len / 2) + 1)
        x = x+y
    jmp :next_cmd
    :done
end_func

func hello_cmd
    ram $ram_terminal_connected = 1
end_func
    
func set_plan_stop_cmd
    ram rtna = $ram_destroy_plan_func
    call_indirect
    call :init_plan_stop
end_func
    
func set_plan_crank_cmd
    ram rtna = $ram_destroy_plan_func
    call_indirect
    call :init_plan_crank
end_func
    
func set_plan_warmup_cmd
    ram rtna = $ram_destroy_plan_func
    call_indirect
    call :init_plan_warmup
end_func
    
func set_plan_run_cmd
    ram rtna = $ram_destroy_plan_func
    call_indirect
    call :init_plan_run
end_func
    
func set_plan_learn_cmd
    ram rtna = $ram_destroy_plan_func
    call_indirect
    call :init_plan_learn_stoich
end_func
    
