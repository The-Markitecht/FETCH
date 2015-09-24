
proc assemble_with_macros {src_fn rom_fn} {
    source assemble.tcl ;# reset the global lists of aliases, labels, etc.
    source system_macros.tcl
    source program_macros.tcl
    
    set vdfn "[file rootname $src_fn]_defines.v"
    puts "writing $vdfn"
    set ::vdefines [open $vdfn w]
    
    assemble_file  $src_fn "[file rootname $src_fn].v"
    
    # puts $::f [verilog_define_labels * asm_]
    puts "closing $vdfn"
    close $::vdefines
    
    #file rename -force "[file rootname $src_fn].mif" ../
}

cd synapse/program

# main script; assemble individual files for each MCU core here.
# foreach asm_fn [glob -nocomplain *.asm] {
    # assemble_with_macros $asm_fn "[file rootname $asm_fn].v"
# }

# assemble each program explicitly:
assemble_with_macros visor_program.asm "visor_program.v"
assemble_with_macros target_program.asm "target_program.v"
