
# math testing and modeling, in Tcl.

interp alias "" e "" expr

proc dump8 {byte} {
    set s [byte_to_bin $byte]
    return "[string range $s 0 3] [string range $s 4 7]"
}

proc byte_to_bin {byte} {
    # return the binary representation of the given 8-bit number (decimal or hex).

    append bin [expr {($byte & 0x80) > 0}]
    append bin [expr {($byte & 0x40) > 0}]
    append bin [expr {($byte & 0x20) > 0}]
    append bin [expr {($byte & 0x10) > 0}]
    append bin [expr {($byte & 0x08) > 0}]
    append bin [expr {($byte & 0x04) > 0}]
    append bin [expr {($byte & 0x02) > 0}]
    append bin [expr {($byte & 0x01) > 0}]
    return $bin
}

proc dump16 {word} {
    set slo [byte_to_bin [expr {$word & 0xFF}]]
    set shi [byte_to_bin [expr {($word >> 8) & 0xFF}]]
    return "[string range $shi 0 3] [string range $shi 4 7] [string range $slo 0 3] [string range $slo 4 7]"
}

proc assert {script expect} {
    set a [eval $script]
    if {$a == $expect} {
        puts "correct: $script = $a"
    } else {
        error "ERROR: $script should be $expect, got $a"
    }
}

proc divide {dividend divisor} {
    # long division routine.  positive int16's only.

    if {$divisor > $dividend || $divisor == 0 || $dividend == 0} {
        return 0
    }
    
    # shift "temp" divisor left until it exceeds dividend, then right 1.
    #puts "sor [dump16 $divisor]"
    set temp $divisor    
    set i 0
    while {$temp <= $dividend} {
        set temp [e $temp << 1]
        incr i
    }
    set temp [e $temp >> 1]
    # notice i was not decremented here, so it has 1 more in it than the number of shifts required for digit parity.
    # that's exactly what i needs for correctness.

    set q 0
    #while {$dividend >= $divisor} 
    for {} {$i > 0} {incr i -1} {
        #puts "    [dump16 $dividend]\n    [dump16 $temp]"
        if {$temp > $dividend} {
            # temp does not fit; output a 0.
            set q [e ($q << 1) | 0]
            # set dividend ; # no change to dividend.
        } else {
            # temp does fit; output a 1.
            set q [e ($q << 1) | 1]
            set dividend [e $dividend - $temp]
        }
        #puts "q = [dump16 $q] = $q"
        set temp [e $temp >> 1]
    }
    return $q
}

assert {divide 7 1} 7
assert {divide 10 5} 2
assert {divide 1 1} 1
assert {divide 100 5} 20
assert {divide 99 100} 0
assert {divide 65000 7000} 9
assert {divide 65000 65000} 1
assert {divide 43805 1} 43805
# for {set j 0} {$j < 1000} {incr j} {
    # for {set i 0} {$i < 1000} {incr i} {
        # set a [e int(65536 * rand())]
        # set b [e int(65535 * rand()) + 1]
        # assert [list divide $a $b] [e $a / $b]    
    # }
    # puts -nonewline .
# }
# use a nested loop for 100% exhaustive verification.


proc mul {x y} {
    set sum 0
    while {$x != 0} {
        if {$x & 1} {
            incr sum $y
        }
        set x [e $x >> 1]
        set y [e $y << 1]
    }
    return $sum
}

assert {mul 0 0} 0
assert {mul 0 1} 0
assert {mul 1 0} 0
assert {mul 1 1} 1
assert {mul 1 2} 2
assert {mul 2 0} 0
assert {mul 2 1} 2
assert {mul 2 2} 4
assert {mul 2 3} 6
assert {mul 2 4} 8
assert {mul 3 2} 6
assert {mul 4 2} 8
assert {mul 7 9} 63
assert {mul 200 200} 40000
# for {set j 0} {$j < 1000} {incr j} {
    # for {set i 0} {$i < 1000} {incr i} {
        # set a [e int(256 * rand())]
        # set b [e int(256 * rand())]
        # assert [list mul $a $b] [e $a * $b]    
    # }
    # puts -nonewline .
# }
