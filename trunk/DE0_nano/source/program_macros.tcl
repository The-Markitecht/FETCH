
source assemble.tcl
source system_macros.tcl

# define any application-specific macros or functions here.
proc asm_vdefine {lin name valu} {
    puts $::f "`define $name  $valu"
    set ::asm::$name $valu
}

# main script; assemble individual files for each MCU core here.
set ::f [open "asm_defines.v" w]

assemble  target_program.asm  target_program.v
# puts $::f [verilog_define_labels * asm_]

source assemble.tcl ;# reset the global lists of aliases, labels, etc.
source system_macros.tcl
assemble  visor_program.asm  visor_program.v
# puts $::f [verilog_define_labels * asm_]

close $::f
