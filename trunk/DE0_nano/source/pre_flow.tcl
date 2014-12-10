
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
shell tclsh85.exe program_macros.tcl 
#foreach asm_fn [glob -nocomplain *.asm] {
#    shell tclsh85.exe assemble.tcl $asm_fn "[file rootname $asm_fn].v"
#}

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

