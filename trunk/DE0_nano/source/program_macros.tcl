
# define any application-specific macros or functions here.

namespace eval ::asm {

    proc vdefine {lin name valu} {
        if {$::asm_pass == $::pass(emit)} {
            puts $::vdefines "`define [string toupper $name]  [expr $valu]"
        }
        setvar $lin $name $valu
    }

}    