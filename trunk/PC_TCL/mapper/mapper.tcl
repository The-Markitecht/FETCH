package require Tk

interp alias {} e {} expr

proc load_afrc_map {fn} {
    set f [open $fn r]
    set ::afrc_map [read $f]
    close $f
    set ::afrc_maf_rows [llength $::afrc_map] 
    set ::afrc_rpm_cols [llength [lindex $::afrc_map 0]]            
}

proc send_afrc_map {} {
    
}

proc init_gui {} {
    wm withdraw .
    set w .win
    toplevel $w
    wm title $w Mapper
    wm deiconify $w
    bind $w <Destroy> {
        exit
    }

    set b ${w}.send
    button $b -text "Send" -command send_afrc_map
    pack $b 

    set c ${w}.c
    canvas $c -relief flat -borderwidth 2 -width 500 -height 700
    pack $w.c -side top -expand yes -fill both

    for {set row 0} {$row < $::afrc_maf_rows} {incr row} {
        for {set col 0} {$col < $::afrc_rpm_cols} {incr col} {
            $c create rectangle [e $col * 10] [e $row * 10] [e $col * 10 + 9] [e $row * 10 + 9] \
                -outline black -fill red
        }
    }
}

# #########################################################

load_afrc_map default.map

init_gui

vwait forever
