
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

proc get4x {} {
    valu = -1
    if {[catch {
        s = [read $::port]
        puts -nonewline "<< $s"
        scan $s %4x valu
    } err]} {
        puts "\n-- rx error: $err\n"
    }    
    puts "get4x $valu [format %04x $valu]"
    return $valu
}

#proc wait_prompt {timeout_ms} {
    #prev = $::prompt_count
    #while {$timeout_ms > 0} {
        #after 40
        #incr timeout_ms -40
        ##update ;# required because evidently async I/O shares the same event loop with Wish GUI.
        #read_port
        #if {$::prompt_count > $prev} {return 1}
    #}
    #return 0
#}

proc wait_prompt {timeout_ms} {
    return [wait_delim > $timeout_ms]
}

proc get4x_wait {timeout_ms} {
    while {$timeout_ms > 0} {
        after 40
        incr timeout_ms -40
        #update ;# required because evidently async I/O shares the same event loop with Wish GUI.
        v = [get4x]
        if {$v >= 0} {return $v}
    }
    return -1
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
