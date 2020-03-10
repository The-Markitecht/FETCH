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


# to make Quartus 8.1 invoke this script at the beginning of the "Compile" flow,
# add this in the project's .qsf file:
# set_global_assignment -name PRE_FLOW_SCRIPT_FILE "quartus_sh:source/pre_flow.tcl"
# near the top works best since Quartus seems to add new things at the bottom.
# Quartus 8.1 does not seem to invoke this if you click the "Analysis & Synthesis" button instead of "Compile".

#exit ;# script disabled for now.

set ::project_dir [pwd]

#proc src {path} {return [file join [pwd] source $path]}

proc dump {type text} {
    foreach lin [split $text "\n"] {
        post_message -type $type $lin
    }
}

proc shell {args} {
    set ofn [file join $::project_dir output stdout.txt]
    set efn [file join $::project_dir output stderr.txt]
    catch {
        eval exec -ignorestderr $args >$ofn 2>$efn
    } result
    # discard the result variable, and the return value of catch.  use only the dump files.
    set f [open $ofn r]
    dump info [read $f]
    close $f
    if {[file size $efn] > 4} {
        set f [open $efn r]
        dump error [read $f]
        close $f
        exit 255
    }
}

# #######################################################################

post_message -type info "Assembling MCU programs."

cd [file join $::project_dir source]
shell tclsh.exe build.tcl

# build only the visor program from the source_old.
# this is for using an older version of Synapse and its libs & toolchain as the visor.
#cd [file join $::project_dir source_old]
#shell tclsh.exe build.tcl

# run Icarus simulator.
# post_message -type info "Simulating design."
# # -pfileline=1
# shell iverilog -g2005 -gxtypes -o {..\icarus\testbench} \
    # testbench.v  target_program.v  synapse316.v  visor.v  visor_program.v \
    # supervised_synapse316.v  my_uart_v2.v

# cd [file join $::project_dir icarus]
# file delete testbench.vcd
# # -v
# shell vvp testbench

# exec gtkwave testbench.vcd
# press Ctrl-Shift-R on existing instance instead.

# modelsim:
# do ../../source/modelsim.tcl

post_message -type info "Pre-flow script done."

