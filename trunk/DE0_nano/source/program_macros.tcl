
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
    parse3 x = $reg $lin
    asm_call \" putchar_atx
}

proc asm_putchar {lin reg} {
    asm_putchar_atx $lin $reg
}

