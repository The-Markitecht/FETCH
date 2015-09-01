// #########################################################################
// assembly source code.    
// for debugging supervisor mcu.

    // program code dimensions.  
    declare_system_dimensions
    // these are for the VISOR code, not the TARGET code.
    vdefine visor_code_addr_width       10  
    vdefine visor_code_addr_top         ($visor_code_addr_width - 1)  
    vdefine visor_code_size_max_words   (1 << $visor_code_addr_width)      
    setvar assembler_max_words          $visor_code_size_max_words

    // register file configuration
    vdefine visor_num_regs 32
    vdefine visor_top_reg ($visor_num_regs - 1)
    vdefine visor_num_gp 8
    vdefine visor_top_gp ($visor_num_gp - 1)
    setvar num_gp $visor_num_gp
    
    // application-specific register aliases.  
    alias_both g6               6               "g6"
    alias_both g7               7               "g7"
    setvar counter $visor_top_gp
    
    alias_both rstk             [incr counter]  "//rstk"
    
    alias_both bp0_addr	        [incr counter]  {}
    alias_both bp1_addr	        [incr counter]  {}
    alias_both bp2_addr	        [incr counter]  {}
    alias_both bp3_addr	        [incr counter]  {}
        vdefine bp_disable                 0xffff
    alias_both force_opcode	    [incr counter]  {}
    alias_both poke_data        [incr counter]  {}
    alias_both bus_ctrl	        [incr counter]  {}
        vdefine bp_step_bit            3
        vdefine bp_step_mask           (1 << $bp_step_bit)
        vdefine divert_code_bus_bit    2
        vdefine divert_code_bus_mask   (1 << $divert_code_bus_bit)
        vdefine tg_reset_bit           1
        vdefine tg_reset_mask          (1 << $tg_reset_bit)
        vdefine tg_code_ready_bit      0
        vdefine tg_code_ready_mask     (1 << $tg_code_ready_bit)
    alias_both tg_force	        [incr counter]  {}
        vdefine force_exec_bit          ($debug_force_exec_bit - $word_width)
        vdefine force_exec_mask         (1 << $force_exec_bit)
        vdefine force_load_exr_bit      ($debug_force_load_exr_bit - $word_width)
        vdefine force_load_exr_mask     (1 << $force_load_exr_bit)
        vdefine hold_state_bit          ($debug_force_hold_state_bit - $word_width)
        vdefine hold_state_mask         (1 << $hold_state_bit)
        
    alias_both atx_data         [incr counter]  "atx_data"
    alias_both atx_ctrl         [incr counter]  "atx_ctrl"

    alias_both m9k_addr         [incr counter]  "m9k_addr"
    alias_both m9k_data         [incr counter]  "m9k_data"
    
    alias_src  exr_shadow	    [incr counter]  {}
    alias_src  tg_code_addr     [incr counter]  {}
    alias_src  peek_data        [incr counter]  {}
    alias_src  bp_status	    [incr counter]  {}
    alias_src  boot_break       [incr counter]  {}

    convention_gpx
    
    jmp :main
    
    include ../peripheral/driver/my_uart_v2.asm
    include lib/string.asm
    include lib/console.asm
    include lib/time.asm
    
    setvar fletcher_sum1_reg g6
    setvar fletcher_sum2_reg g7
    include lib/fletcher.asm

    << proc getchar_echo {lin} {
        getchar_$::asm::console_driver $lin 
        # automatic echo
        push \" a
        putchar \" a
        pop \" a
    } >>
    
    :boot_msg
        "\r\nVISOR\x0"
    :running_msg
        "\r\nRUN >\x0"
    
    // ////////////////////////////////////////////
    :main
    // put target into reset.
    bus_ctrl = $tg_reset_mask   
    
    // init visor.
    bp3_addr = $bp_disable
    bp2_addr = $bp_disable
    bp1_addr = $bp_disable
    bp0_addr = $bp_disable

    // startup message
    a = :boot_msg
    call :print_nt
    
    // check for bootloader signal.
    a = boot_break    
    bn az :boot_run
        // ^^^ for press-to-debug; runs target by default.
        // br az :boot_run
        // ^^^ for press-to-run; debugs target by default.
        
        // step into the first target instruction.
        bus_ctrl = $bp_step_mask
        call :wait_for_bp
        jmp :cmd_loop
    :boot_run
        // release target reset, to run.
        bus_ctrl = 0   

    // command prompt loop.
    :cmd_loop
        a = bus_ctrl
        b = 0
        br eq :running_prompt
        
            call :dump_target
            a = tg_code_addr
            call :put4x
            putasc ","
            a = exr_shadow
            call :put4x
            putasc " "
            putasc ">"
            getchar_echo
            jmp :parse_cmd
        
        :running_prompt
            a = :running_msg
            call :print_nt
            :run_poll
            pollchar
            b = -1
            bn eq :parse_cmd
            a = bp_status
            br az :run_poll
            // target hit a breakpoint; switch to stepping mode.
            bus_ctrl = $bp_step_mask
            jmp :cmd_loop

        :parse_cmd
        
        // command = step next instruction.
        asc b = "n"
        bn eq :skip_step
            bus_ctrl = $bp_step_mask
            bp0_addr = bp0_addr
            call :wait_for_bp
            jmp :cmd_loop
        :skip_step
        
        // command = reset target.
        asc b = "R"
        bn eq :skip_reset
            bus_ctrl = $tg_reset_mask   
            nop
            nop
            bus_ctrl = $bp_step_mask
            call :wait_for_bp
            jmp :cmd_loop
        :skip_reset

        // command = load program.
        asc b = "l"
        bn eq :skip_load
            call :load_program
            jmp :cmd_loop
        :skip_load

        // command = run full speed.
        asc b = "r"
        bn eq :skip_run
            // release target reset, to run.
            bus_ctrl = 0   
            bp0_addr = bp0_addr
            jmp :cmd_loop
        :skip_run

        // command = set breakpoint.
        asc b = "b"
        bn eq :skip_setbrk
            call :set_bp
            jmp :cmd_loop
        :skip_setbrk

        // command = poke register.
        asc b = "o"
        bn eq :skip_poke
            call :poke_cmd
            jmp :cmd_loop
        :skip_poke

        // command = dump Avalon data e.g. from SDRAM.
//patch: need code much like the other commands.  each time pass down 4x avalon master reg addresses, a start address lo+hi, and a length in bytes.
        
        putasc "?"
        puteol
    jmp :cmd_loop

<< set demonstrations {

    // set a breakpoint, wait til it hits.
    bp0_addr = 0x15
    :main_loop
    call :wait_for_bp

    // release target to run full speed.
    bus_ctrl = 0
    
    // interrupt the target and single step it a few times.
    bus_ctrl = $bp_step_mask
    call :wait_for_bp
    bp0_addr = bp0_addr
    call :wait_for_bp
    bp0_addr = bp0_addr
    call :wait_for_bp
    bp0_addr = bp0_addr
    call :wait_for_bp
    bus_ctrl = 0   
    
    // release target to pass breakpoint once.
    bp0_addr = bp0_addr
        
    jmp :main_loop
} >>
    
func wait_for_bp    
    :poll
    a = bp_status
    br az :poll
end_func
    
func set_bp
    getchar_echo
    x = a
    getchar_echo
    asc b = "="
    bn eq :fail
    call :get4x
    y = a
    a = 0
    bn eq :fail
    a = x
    asc b = "0"
    br eq :b0
    asc b = "1"
    br eq :b1
    asc b = "2"
    br eq :b2
    asc b = "3"
    br eq :b3
    jmp :fail
    :b0
    bp0_addr = y
    rtn
    :b1
    bp1_addr = y
    rtn
    :b2
    bp2_addr = y
    rtn
    :b3
    bp3_addr = y
    rtn
    
    :fail
    putasc "?"
    puteol
end_func
    
func poke_cmd
    // x = destination register address to poke.
    call :get4x
    x = a    
    a = 0
    bn eq :fail
    
    getchar_echo
    asc b = "="
    bn eq :fail
    
    // parse value to poke.
    call :get4x
    poke_data = a
    a = 0
    bn eq :fail
    
    a = x
    call :poke
    rtn
    
    :fail
    putasc "?"
    puteol
end_func

// force execution of the opcode passed in force_opcode.
func force_instruction
    bus_ctrl = $divert_code_bus_mask
    tg_force = $hold_state_mask
    tg_force = ($hold_state_mask | $force_load_exr_mask)
    tg_force = ($hold_state_mask | $force_exec_mask)
    tg_force = $hold_state_mask
    // refill target exr so it can resume seamlessly.
    force_opcode = exr_shadow
    tg_force = ($hold_state_mask | $force_load_exr_mask)
    tg_force = 0
end_func
    
// poke a register.  pass the value in poke_data.
// pass its register address in a.
func poke
    setvar dest_mask (((1 << $dest_width) - 1) << $dest_lsb)
    b = $dest_mask
    a = and
    b = ([src dbgpoke])
    force_opcode = or
    call :force_instruction
end_func
    
// observe a register.  return its value in peek_data.
// pass its register address in a.
func peek
    setvar src_mask ((1 << $src_width) - 1)
    b = $src_mask
    a = and
    b = ([dest nop] << $dest_lsb)
    force_opcode = or
    call :force_instruction
    // target's register value is now in peek_data.    
end_func
    
// show target status display.
func dump_target
    puteol
    i = 0
    j = 1
    :next_reg
        // fetch register name from table in target program.
        // i = register number.
        // peek is skipped for any reg name starting with 2 slashes (good for read-sensitive regs). 
        a = i
        a = a<<1
        a = a<<1
        b = 3
        a = a+b
        b = x
        m9k_addr = a+b
        a = m9k_data
        b = 0x2f2f
        br eq :no_peek
            putasc " "
            putasc " "
            a = m9k_addr
            b = 8
            call :print_fixed_target
            putasc "="
            a = i
            call :peek
            a = peek_data
            call :put4x
            puteol
        :no_peek
        i = i+j
        // loop up to the number of registers in the target program's register name table.
        m9k_addr = 2
        b = m9k_data
        a = i
    bn eq :next_reg
end_func

// print a fixed-length string from packed words in TARGET program space.
// pass its word address (not its byte address) in a,  its length (bytes) in b.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
func print_fixed_target
    i = a
    j = 1
    x = b
    y = -1
    :next_word
        br xz :done
        x = ad2
        m9k_addr = i
        g6 = m9k_data
        // now x = bytes remaining, i = current word address, g6 = data word.
        putchar g6
        br xz :done
        x = ad2
        a = g6
        a = a>>4
        a = a>>4
        putchar a
        i = i+j
        jmp :next_word
    :done
end_func

func load_program
    // load target program from UART.
    
    // length, little-endian.  memorize in x.
    puteol
    putasc L
    get16 x
    a = x
    call :put4x
    puteol
    
    // put target into reset again, in case this is a target warm boot.
    bus_ctrl = $tg_reset_mask   
    
    // load opcodes.  count up address in i.
    i = 0
    j = 1
    call :fletcher16_init
    :loadword
        // receive, store in RAM.
        get16 a
        m9k_addr = i
        m9k_data = a

        // read back from RAM and build checksum.
        a = m9k_data
        call :fletcher16_input16 
        
        //  show decimated feedback text, for more speed:
        a = i
        b = 0x1f
        bn and0z :skip_text
            putasc "."
        :skip_text
        
        i = i+j
        a = i
        b = x
    bn eq :loadword
    puteol
    call :fletcher16_result
    call :put4x
    puteol
end_func

