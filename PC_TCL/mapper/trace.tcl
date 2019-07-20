# source this file to begin tracing execution of every Tcl command.

rename proc  _proc
_proc proc {name arg_list body} {
    _proc $name $arg_list $body
    trace add execution $name enterstep debug_trace_proc
} 

_proc debug_trace_proc {cmd op} {
#    puts [string map [list \n { }] [string range $cmd 0 80]]
    set f [info frame -2]
    set s {}
    if {[dict exists $f file]} {
        append s [dict get $f file] :
    }
    if {[dict exists $f line]} {
        append s [dict get $f line] :
    }
    if {[dict exists $f proc]} {
        append s [dict get $f proc] :
    }
    if {[dict exists $f cmd]} {
        append s [string map [list \n { }] [string range [dict get $f cmd] 0 80]]
    }
    puts $s
    flush stdout
}
