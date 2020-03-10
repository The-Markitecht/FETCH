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

package ifneeded MityBuild 3.0 {
    source J:/temp/MityBuild/libMityBuild
}
package require MityBuild

#source [f+ $::builderDir trace.tcl]
source [f+ $::builderDir fletcher16.tcl]

proc init_port {port_num} {
    ::port = [open //./com$port_num r+]
    fconfigure $::port -blocking 0 -buffering none -mode 115200,n,8,1 -handshake none -translation binary
}

proc read_port {} {
    if {[catch {
        s = [read $::port]
        puts -nonewline $s
        scan_data $s
    } err]} {
        puts "\n-- rx error: $err\n"
    }
}

proc tx {msg} {
    if {[catch {
        puts "\n>> $msg\n"
        foreach ch [split $msg {}] {
            puts -nonewline $::port $ch
            after 1
        }
    } err]} {
        puts "\n-- tx error: $err\n"
    }
}

proc tx_bin {bin start len} {
    beyond := $start + $len
    for {i = 0} {$i < $beyond} {incr i} {
        puts -nonewline $::port [string index $bin $i]
        after 1
    }
}

proc scan_data {data} {
    if {[string first {>} $data] >= 0} {incr ::prompt_count}
}

proc wait_prompt {timeout_ms} {
    return [wait_delim > $timeout_ms]
}

proc get4x_wait {delim  timeout_ms} {
    lassign [wait_delim $delim $timeout_ms] ok buf
    if { ! $ok } {return -1}
    if {[scan $buf %4x valu] != 1} {
        puts -nonewline $buf
        return -1
    }
    puts "get4x_wait $valu = 0x[format %04x $valu]"
    return $valu
}

proc wait_delim {delimiter timeout_ms} {
    buf = {}
    while {$timeout_ms > 0} {
        after 40
        incr timeout_ms -40
        #update ;# required because evidently async I/O shares the same event loop with Wish GUI.
        s = [read $::port]
        append buf $s
        if {[string match -nocase *$delimiter $buf]} {
            # delete each line containing equal sign; those are the register dump.
            small = {}
            foreach ln [split $buf \n] {
                if {[string first = $ln] == -1} {
                    append small $ln \n
                }
            }
            puts $small
            return [list 1 $small]
        }
    }
    puts -nonewline $buf
    return [list 0 $buf]
}

proc send_and_wait {msg  timeout_ms} {
    tx  $msg
    return [wait_prompt $timeout_ms]
}

proc send_program {mif_fn} {
    parts = [split $mif_fn .]
    parts ^ end = bin
    bin_fn = [join $parts .]

    f = [open $bin_fn r]
    fconfigure $f -translation binary
    bin = [read $f]
    close $f

    fletcher16_init local_sum
    binary scan $bin c2c* junk values ;# length header is discarded here.
    foreach v $values {
        fletcher16_input8 local_sum [e {$v & 0xff}]
    }
    sum = [fletcher16_result local_sum]

    tx l
    tx_bin $bin 0 [string length $bin]

    lassign [wait_delim > 3000] ok buf
    if { ! $ok} {
        puts "\n-- ERROR: visor unresponsive\n"
        return 0
    }
    re = { \m L[[:xdigit:]]{4} [\r\n]+ [.]+ [\r\n]+ ([[:xdigit:]]{4}) [\r\n]+ }
    if { ! [regexp -expanded -nocase $re $buf junk sum_txt]} {
        puts "\n-- ERROR: could not locate checksum\n"
        #puts "set buf {$buf}"
        return 0
    }
    if { ! [scan $sum_txt %4x remote_sum]} {
        puts "\n-- ERROR: could not convert checksum\n"
        return 0
    }
    if {$remote_sum != $sum} {
        puts "\n-- ERROR: program should have had checksum [format %04x $sum]\n"
        return 0
    }
    return 1
}

port_num = [::argv ^ 0]
mif_fn = [::argv ^ 1]

::prompt_count = 0
init_port $port_num

send_and_wait n 500
if { ! [send_program $mif_fn]} {exit 1}
tx r
exit 0
