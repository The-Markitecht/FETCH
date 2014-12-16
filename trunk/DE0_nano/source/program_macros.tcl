
# define any application-specific macros or functions here.

proc asm_vdefine {lin name valu} {
    if {$::asm_pass == $::pass(emit)} {
        puts $::vdefines "`define [string toupper $name]  [expr $valu]"
    }
    set ::asm::$name $valu
}

