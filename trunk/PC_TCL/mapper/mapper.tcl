package require Tk

interp alias {} e {} expr

source [file join [file dirname [info script]] fletcher16.tcl]

proc clear_sent {} {
    set ::sent [list]
}

proc clear_sent_row {row} {
    set i [lsearch -exact -integer $::sent $row]
    if {$i >= 0} {
        set ::sent [lreplace $::sent $i $i]
    }
}

proc load_afrc_map {fn} {
    set f [open $fn r]
    set map [read $f]
    close $f
    set ::afrc_maf_rows [llength $map] 
    set ::afrc_rpm_cols [llength [lindex $map 0]]            
    set ::afrc_map $map
    clear_sent
}

proc send_afrc_map {} {
    fletcher16_init local_sum
    for {set row 0} {$row < $::afrc_maf_rows} {incr row} {
        if {$row ni $::sent} {
            flush_rx
            set hex [format ldafrc%04x $row]
            foreach v [lindex $::afrc_map $row] {
                fletcher16_input16 local_sum $v
                append hex [format %04x $v]
            }
            send $hex
            set remote_sum [get4x]
            if {[get4x] != [fletcher16_result local_sum]} {
                show "ERROR: row $row should have had checksum $local_sum"
                break
            }
            lappend ::sent $row
        }
    }
}

proc show_cell {cnv id row col} {
    $cnv coords cell_text [lrange [$cnv coords $id] 0 1]
    set v [lindex $::afrc_map $row $col]
    $cnv itemconfigure cell_text -state normal -text $v
    puts [$cnv itemconfigure cell_text]
}

proc init_gui {} {
#    console show ;# useless
    fconfigure stdout -buffering line
    
    wm withdraw .
    set w .win
    toplevel $w
    wm title $w Mapper
    wm deiconify $w
    bind $w <Destroy> {
        exit
    }

    set b ${w}.send
    button $b -text Send -command send_afrc_map
    pack $b 
    
#    set status ${w}.status
#    entry $status -textVariable ::status 
#    pack $status -side top -expand yes -fill x  

    set c ${w}.c
    canvas $c -relief flat -borderwidth 2 -width 500 -height 700
    pack $c -side top -expand yes -fill both

    for {set row 0} {$row < $::afrc_maf_rows} {incr row} {
        for {set col 0} {$col < $::afrc_rpm_cols} {incr col} {
            set id [$c create rectangle \
                [e $col * 10] [e $row * 10] [e $col * 10 + 9] [e $row * 10 + 9] \
                -outline black -fill red -tags [list ${col},$row c$col r$row]]
            $c bind $id <Enter> "
                show_cell $c $id $row $col
            "
        }
    }
    
    $c create text 0 0 -tags cell_text -state hidden -anchor s
}

# #########################################################

if {[catch {
    load_afrc_map default.map

    init_gui

    vwait forever
} err]} {
    puts $err
    vwait forever
}
