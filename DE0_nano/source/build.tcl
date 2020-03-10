# FETCH
# Copyright 2009 Mark Hubbard, a.k.a. "TheMarkitecht"
# http://www.TheMarkitecht.com
#
# Project home:  http://github.com/The-Markitecht/FETCH
# FETCH is the Fluent Engine and Transmission Controller Hardware for sports cars.
#
# This file is part of FETCH.
#
# FETCH is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# FETCH is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with FETCH.  If not, see <https://www.gnu.org/licenses/>.


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
