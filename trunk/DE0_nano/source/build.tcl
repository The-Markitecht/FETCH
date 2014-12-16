
proc assemble_with_macros {src_fn rom_fn} {
    source assemble.tcl ;# reset the global lists of aliases, labels, etc.
    source system_macros.tcl
    source program_macros.tcl
    
    set vdfn "[file rootname $src_fn]_defines.v"
    console "writing $vdfn"
    set ::vdefines [open $vdfn w]
    
    assemble  $src_fn $rom_fn
    
    # puts $::f [verilog_define_labels * asm_]
    console "closing $vdfn"
    close $::vdefines
}

# main script; assemble individual files for each MCU core here.
foreach asm_fn [glob -nocomplain *.asm] {
   assemble_with_macros $asm_fn "[file rootname $asm_fn].v"
}