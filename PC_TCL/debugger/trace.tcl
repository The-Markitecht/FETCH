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
