
# define any application-specific macros or functions here.

proc asm_vdefine {lin name valu} {
    if {$::asm_pass == $::pass(emit)} {
        puts $::vdefines "`define [string toupper $name]  [expr $valu]"
    }
    set ::asm::$name $valu
}

proc asm_putchar {lin reg} {
    # for hardware-assisted Avalon MM master.
    parse3 av_address = $::asm::jtag_uart_data $lin
    parse3 av_writedata = $reg \"
}

