// #########################################################################
// assembly source code.    

    jmp :main

    declare_system_dimensions

    // register file configuration.
    vdefine num_regs 17
    vdefine top_reg ($num_regs - 1)
    // num_gp should include the p registers and the operators.  everything beneath the peripherals.
    vdefine num_gp 12  
    vdefine top_gp ($num_gp - 1)

    // application-specific register aliases.    
    alias_both g6                   6               "g6"
    alias_both g7                   7               "g7"
        // patch: g6, g7 obsolete.
    alias_both ga                   6               "ga"
    alias_both gb                   7               "gb"
    alias_both pa                   8               "pa"
    alias_both pb                   9               "pb"
    alias_both pc                   10              "pc"
    alias_both pd                   11              "pd"
    setvar counter $top_gp
        
    alias_both rstk                 [incr counter]  "//rstk"
    
    alias_both fduart_data          [incr counter]  "//uartdt"
    alias_both fduart_status        [incr counter]  "uartstat"

    // I/O expansion bus.
    alias_both exp                  [incr counter]  "//edata"
    alias_both exp_addr             [incr counter]  "eaddr"
        vdefine EXP_NUM_REGS 8
        vdefine EXP_TOP_REG ($EXP_NUM_REGS - 1)
        setvar exp_counter -1
    
    emit_debugger_register_table  counter
    
    // string resources
    :boot_msg
        "TGT\r\n\x0"
    :fail_msg
        "FAIL TEST \x0"

    // libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.
    convention_formal
    include ../peripheral/driver/fduart.asm
    include lib/struct.asm
    include lib/console.asm
    include lib/math.asm
    include lib/string.asm
    include lib/time.asm
    setvar fletcher_sum1_reg pc
    setvar fletcher_sum2_reg pd
    include lib/fletcher.asm

<<
    proc eread {lin addr read_into_reg} {
        if {$read_into_reg eq {exp}} {
            error "eread into exp register not supported."
        }
        parse3 exp_addr = $addr "eread $addr $read_into_reg"
        parse3 $read_into_reg = exp \"
        nop \"
        parse3 $read_into_reg = exp \"
    }
        
    proc ewrite {lin addr data} {
        # nop's not needed for consecutive writes?
        parse3 exp_addr = $addr "ewrite $addr $data"
        nop \"
        parse3 exp = $data \"
    }
        
    proc edump {lin addr} {
        emit_comment "// $lin"
        parse "
            a = $addr
            call put4x
            putasc :
            putasc { }
            eread $addr ga
            a = ga
            call put4x
            puteol
        "            
    }
    
    proc etest {lin addr expected fail_code_num} {
        emit_comment "// $lin"
        edump $lin $addr
        parse "
            if ga ne $expected {
                callx fail $fail_code_num
            }
        "        
    }    
>>

// #########################################################################
    :main  

    a = :boot_msg
    call print_nt 

    :begin_test
    
    // clear out contents
    ewrite 0 0
    ewrite 1 0
    ewrite 2 0
    ewrite 3 0
    etest  0 0 0x00
    etest  1 0 0x01
    etest  2 0 0x02
    etest  3 0 0x03

    // test for sufficient wait states on read.
    ewrite 1 0x18
    eread  1 ga
    // another read after some cycles have elapsed.
    eread  1 gb
    a = ga
    call put4x
    puteol
    a = gb
    call put4x
    puteol
    if ga ne gb {
        callx fail 0x0f
    }
        
    // basic function test.  
    // consecutive writes, different addresses.
    // consecutive reads, different addresses.
    ewrite 0 0x40
    ewrite 1 0x41
    ewrite 2 0x42
    ewrite 3 0x43
    etest  0 0x40 0x10
    etest  1 0x41 0x11
    etest  2 0x42 0x12
    etest  3 0x43 0x13
    
    // consecutive writes, same address.
    ewrite 3 0x51        
    ewrite 3 0x52        
    ewrite 3 0x53        
    ewrite 3 0x54        
    ewrite 3 0x55        
    etest  3 0x55 0x20
    
    // consecutive write/read write/read turarounds, same address.
    ewrite 3 0x30
    etest  3 0x30 0x30
    ewrite 3 0x31
    etest  3 0x31 0x31
    ewrite 3 0x32
    etest  3 0x32 0x32
    
    // consecutive write/read write/read turarounds, different addresses.
    ewrite 0 0x40
    etest  0 0x40 0x40
    ewrite 1 0x41
    etest  1 0x41 0x41
    ewrite 2 0x42
    etest  2 0x42 0x42

//TODO: test exp_r_read with a read-sensitive counter.
// also test a write-sensitive counter.

        
    jmp :begin_test

func fail {fail_code_num in pa} {
    a = :fail_msg
    call print_nt
    a = fail_code_num
    call put4x
    puteol
    :fail_halt
    jmp :fail_halt
}    
