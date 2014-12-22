
# define any application-specific macros or functions here.

proc asm_vdefine {lin name valu} {
    if {$::asm_pass == $::pass(emit)} {
        puts $::vdefines "`define [string toupper $name]  [expr $valu]"
    }
    set ::asm::$name $valu
}

proc asm_putchar_avalon_hw {lin reg} {
    # for hardware-assisted Avalon MM master.
    parse3 av_address = $::asm::jtag_uart_data $lin
    parse3 av_writedata = $reg \"
}

proc asm_putchar_atx {lin reg} {
    # for my own uart_v2_tx hardware.
    parse3 a = $reg "a = $reg // $lin"
    asm_call $lin putchar_atx
}

proc asm_putchar {lin reg} {
    asm_putchar_atx $lin $reg
}

proc asm_getchar_atx {lin} {
    # for my own uart_v2_tx hardware.
    asm_call $lin getchar_atx
}

proc asm_getchar {lin} {
    asm_getchar_atx $lin 
}

proc asm_putasc {lin char} {
    # for my own uart_v2_tx hardware.
    if {[scan $char %c c] != 1} {
        error "invalid character specification: $lin"
    }
    parse3 a = $c "a = $c // $lin"
    asm_call $lin putchar_atx
}

proc asm_get16 {lin reg} {
    # block until a 16-bit word is received (little-endian) on the UART and memorized in the given register.
    asm_getchar $lin
    asm_push \" a
    asm_getchar \"
    parse3 a = a<<4 \"
    parse3 a = a<<4 \"
    asm_pop \" b
    asm_nop \"
    parse3 $reg = or \"
}