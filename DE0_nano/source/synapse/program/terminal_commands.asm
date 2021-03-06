// FETCH
// Copyright 2009 Mark Hubbard, a.k.a. "TheMarkitecht"
// http://www.TheMarkitecht.com
//
// Project home:  http://github.com/The-Markitecht/FETCH
// FETCH is the Fluent Engine and Transmission Controller Hardware for sports cars.
//
// This file is part of FETCH.
//
// FETCH is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// FETCH is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with FETCH.  If not, see <https://www.gnu.org/licenses/>.



ram_define      ram_terminal_connected

// command strings must be exactly key_buf_max bytes long (currently 7).
// the other byte is the carriage return.
// when commands share a common suffix, the longer command must come FIRST here.
:cmd_table
    "  hello"
        ([label hello_cmd])
    "  plstp"
        ([label set_plan_stop_cmd])
    "   plcr"
        ([label set_plan_crank_cmd])
    //"   plwm"
        //([label set_plan_warmup_cmd])
    "   plrn"
        ([label set_plan_run_cmd])
    //"   plln"
        //([label set_plan_learn_cmd])
    "  stoff"
        ([label status_off_cmd])
    "   ston"
        ([label status_on_cmd])
    " ldafrc"
        ([label load_afrc_cmd])
    // when commands share a common suffix, the longer command must come FIRST here.
    "   afrc"
        ([label dump_afrc_cmd])
    "  ldrpm"
        ([label load_rpm_ref_cmd])
    "  ldmaf"
        ([label load_maf_ref_cmd])
    "ldbtref"
        ([label load_block_temp_ref_cmd])
    "ldbtmap"
        ([label load_block_temp_map_cmd])
    "ldasref"
        ([label load_afterstart_ref_cmd])
    "ldasmap"
        ([label load_afterstart_map_cmd])
    "      ,"
        ([label trim_lean_cmd])
    "      ."
        ([label trim_rich_cmd])
    "     \["
        ([label trim_2lean_cmd])
    "     \]"
        ([label trim_2rich_cmd])
    "\x0\x0"


func parse_key {key in pa} {
    // memorize into ram_key_buf, pushing down existing content.
    x = key
    for {i = $key_buf_max} {i ge 0} step j = -1 {
        struct y = $ram_key_buf . i
        struct $ram_key_buf . i = x
        x = y
    }
    if key eq 13 {
        callx  parse_command
    }
}

:cmd_ack_msg
    "OK\x0"

func parse_command {
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
                //asc b = "*"
                //br eq :matched
                    //// parameter character.  succeed early.
                struct b = $ram_key_buf . i
                a = y
                bn eq :no_match
            }
        }

        // at this point we have a match on the record beginning at x.
        :matched
        callx  set_text_flag  :cmd_ack_msg
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
}

func hello_cmd {
    ram $ram_terminal_connected = 1
}

func set_plan_stop_cmd {
    ram rtna = $ram_destroy_plan_func
    call_indirect
    callx  init_plan_stop
}

func set_plan_crank_cmd {
    ram rtna = $ram_destroy_plan_func
    call_indirect
    callx  init_plan_crank
}

func set_plan_run_cmd {
    ram rtna = $ram_destroy_plan_func
    call_indirect
    callx  init_plan_run
}

func status_off_cmd {
    ram $ram_enable_status_report = 0
}

func status_on_cmd {
    ram $ram_enable_status_report = 1
}

