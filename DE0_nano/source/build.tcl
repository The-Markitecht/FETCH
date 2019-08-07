
proc assemble_with_macros {src_fn rom_fn} {
    source assemble.tcl ;# reset the global lists of aliases, labels, etc.
    source system_macros.tcl
    source program_macros.tcl
    
    set vdfn "[file rootname $src_fn]_defines.v"
    puts "writing $vdfn"
    set ::vdefines [open $vdfn w]
        
    set etfn "[file rootname $src_fn]_tags.txt"
    puts "writing $etfn"
    set ::editor_tags [open $etfn w]

    assemble_file  $src_fn "[file rootname $src_fn].v"
    
    # puts $::f [verilog_define_labels * asm_]
    puts "closing $vdfn"
    close $::vdefines
    
    close $::editor_tags
    
    #file rename -force "[file rootname $src_fn].mif" ../
}

proc trace_cmd {args} {
    set d [info frame -2]
    if {[dict exists $d line]} {set ln [dict get $d line]} else {set ln {}}
    puts $::trace "$ln : [string range [lindex [info level 0] 1] 0 100]"
}
#set ::trace [open trace.txt w]
#trace add execution assemble_with_macros enterstep trace_cmd


cd synapse/program

# main script; assemble individual files for each MCU core here.
# foreach asm_fn [glob -nocomplain *.asm] {
    # assemble_with_macros $asm_fn "[file rootname $asm_fn].v"
# }

# assemble each program explicitly:
#assemble_with_macros tools_test_program.asm "tools_test_program.v"
assemble_with_macros visor_program.asm "visor_program.v"
assemble_with_macros target_program.asm "target_program.v"
assemble_with_macros sim_program.asm "sim_program.v"

set final_etfn [file join $::env(APPDATA) geany tags  synapse_target_program.asm.tags]
puts "replacing $final_etfn"
file copy -force target_program_tags.txt $final_etfn

#close $::trace
