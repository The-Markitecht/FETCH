<<
proc struct_read {lin  result_reg  eq  base_addr  dot  offset_reg} {
    # pass offset (in WORDS) in register offset_reg.
    # offset_reg may also be a numeric constant.
    # returns data value in result_reg.
    # base_addr (in BYTES) must be known at compile time, in RAM notation.
    # structure member must be word-aligned in RAM.
    # structure must not cross a 64k boundary.
    # registers a, b, and avalon registers are destroyed.
    
    if {$eq ne {=}} {error "struct read syntax error; expected '='"}
    if {$dot ne {.}} {error "struct read syntax error; expected '.'"}
    emit_comment "// $lin"
    lassign [split $base_addr {'}] hi lo
    if {[string is integer -strict $offset_reg]} {
        parse "a = $offset_reg"
    } elseif {[src $offset_reg] != [src a]} {
        parse "a = $offset_reg"
    }
    parse "
        a = a<<1
        b = $lo
        av_ad_hi = $hi
        av_ad_lo = ad0
        b = av_begin_read
    "
    if {[src $result_reg] != [src av_read_data]} {
        parse "$result_reg = av_read_data"
    }
}

proc struct_write {lin  base_addr  dot  offset_reg  eq  content_reg} {
    # pass offset (in WORDS) in register offset_reg.  
    # offset_reg may also be a numeric constant.
    # pass data value in content_reg.
    # content_reg may also be a numeric constant.
    # base_addr (in BYTES) must be known at compile time, in RAM notation.
    # structure member must be word-aligned in RAM.
    # structure must not cross a 64k boundary.
    # registers a, b, and avalon registers are destroyed.
    # also requires a free word of stack space.

    if {$eq ne {=}} {error "struct write syntax error; expected '='"}
    if {$dot ne {.}} {error "struct write syntax error; expected '.'"}
    emit_comment "// $lin"
    lassign [split $base_addr {'}] hi lo
    set constant_data [string is integer -strict $content_reg]
    if { ! $constant_data} {
        parse "push $content_reg"
    }
    if {[string is integer -strict $offset_reg]} {
        parse "a = $offset_reg"
    } elseif {[src $offset_reg] != [src a]} {
        parse "a = $offset_reg"
    }
    parse "
        a = a<<1
        b = $lo
        av_ad_hi = $hi
        av_ad_lo = ad0
    "
    if {$constant_data} {
        parse "av_write_data = $content_reg"
    } else {
        parse "pop av_write_data"
    }
}

proc struct {lin  args} {
    # struct_read or struct_write, depending on the position of equal sign.
    
    if {[lindex $args 3] eq {=}} {
        struct_write  $lin  {*}$args
    } else {
        struct_read  $lin  {*}$args
    }
}

proc struct_test_case {lin} {
    parse {
        setvar base 1'8192
        
        // write has 6 cases:
        //  offset in a.
        //  offset in some other register.
        //  offset is constant.
        a = 0x31
        x = 0x61
        struct $base . a = x
        y = 0x32
        x = 0x62
        struct $base . y = x
        x = 0x63
        struct $base . 0x33 = x
        // and those 3 again, with data content as a constant instead of a register.
        a = 0x41
        struct $base . a = 0x71
        y = 0x42
        struct $base . y = 0x72
        struct $base . 0x43 = 0x73
        
        // read has the same 3 cases of offset.
        // test all those using the first case of write.
        a = 0x31
        struct i = $base . a
        if i ne 0x61 {
            jmp :struct_test_error
        }
        y = 0x31
        struct i = $base . y
        if i ne 0x61 {
            jmp :struct_test_error
        }
        struct i = $base . 0x31
        if i ne 0x61 {
            jmp :struct_test_error
        }
        
        // use read to verify all cases of write.
        struct i = $base . 0x32
        if i ne 0x62 {
            jmp :struct_test_error
        }
        struct i = $base . 0x32
        if i ne 0x62 {
            jmp :struct_test_error
        }
        struct i = $base . 0x33
        if i ne 0x63 {
            jmp :struct_test_error
        }
        struct i = $base . 0x41
        if i ne 0x71 {
            jmp :struct_test_error
        }
        struct i = $base . 0x42
        if i ne 0x72 {
            jmp :struct_test_error
        }
        struct i = $base . 0x43
        if i ne 0x73 {
            jmp :struct_test_error
        }

        // read can also leave the result in av_read_data if needed.
        struct av_read_data = $base . 0x43
        if av_read_data ne 0x73 {
            jmp :struct_test_error
        }

        // read with an expression for the offset.
        struct i = $base . (0x40 + 1)
        if i ne 0x71 {
            jmp :struct_test_error
        }
        
        :struct_test_ok
        nop
        jmp :struct_test_ok
        
        :struct_test_error
        nop
        jmp :struct_test_error
    }
}

>>
