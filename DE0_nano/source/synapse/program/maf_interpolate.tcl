
proc linear_interp {a b portion_num portion_den} {
    return [expr {int(($b - $a) * double($portion_num) / double($portion_den) + $a)}]
}

proc get_hi_res_maf_ref {lo_res  hi_res_num_cells} {
    # interpolate larger maf_ref from the given low-res one, such as that stored in the map file.
    # at run time the MCU will reduce the samples back down to the original size before indexing into the afrc map.
    # the higher-res ref is used only to recover absolute flow.

    set existing [llength $lo_res]
    set hi_res [list] 
    set interps [expr {int($hi_res_num_cells / $existing)}]
    # extend lo_res with one more interpolation (same slope as the final one) to make hi_res long enough.
    lappend lo_res [expr {[lindex $lo_res end] - [lindex $lo_res end-1] + [lindex $lo_res end]}]
    for {set aidx 0; set bidx 1} {$bidx <= $existing} {incr aidx; incr bidx} {
        for {set i 0} {$i < $interps} {incr i} {
            lappend hi_res [linear_interp [lindex $lo_res $aidx] [lindex $lo_res $bidx] $i $interps]
        }
    }
    return $hi_res
}
