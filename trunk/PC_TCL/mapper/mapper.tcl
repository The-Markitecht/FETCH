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
    set ::trim_half    0
    set ::trim_unity   8192
    set ::trim_double  24576
    set ::trim_min     $::trim_half
    set ::trim_max     $::trim_double
    set f [open $fn r]
    set map [read $f]
    close $f
    set ::afrc_maf_rows [llength $map] 
    set ::afrc_rpm_cols [llength [lindex $map 0]]            
    set ::afrc_map $map
#patch: load these instead of hard coding:
    for {set i 0} {$i < $::max_terms} {incr i} {
        set ::term_center_x($i) 8
        set ::term_center_y($i) [e $i * 6]
        set ::term_expr($i) {}
        set ::term_enable($i) 1
    }
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

proc ::tcl::mathfunc::dist {x_factor} {
    return [e {sqrt($::dx*$::dx*$x_factor + $::dy*$::dy)}]
}

proc ::tcl::mathfunc::clamp {n min max} {
    return [e {max($min, min($max, $n))}]
}

proc calc_afrc_map {} {
    foreach var {dx dy row col term} {
        upvar ::$var $var
    }
    foreach var {max min double half unity} {
        upvar ::trim_$var $var
    }
    for {set row 0} {$row < $::afrc_maf_rows} {incr row} {
        for {set col 0} {$col < $::afrc_rpm_cols} {incr col} {
            set sum 0
            for {set term 0} {$term < $::max_terms} {incr term} {
                if {$::term_enable($term)} {
                    set ex [string trim $::term_expr($term)]
                    if {$ex ne {}} {
                        set cx $::term_center_x($term)
                        set cy $::term_center_y($term)
                        set dx [e {$col - $cx}]
                        set dy [e {$row - $cy}]
                        incr sum [e "int($ex)"]
                    }
                }
            }
            mapset $col $row $sum
            refresh_cell $col $row
        }
    }
    clear_sent
    #patch: upgrade from clear_sent to clear_sent_row
    
#    $::trim_max - int(sqrt($dx*$dx*8+$dy*$dy)*2000)
# dist(8) < 5 ? $max/(dist(8)+1) : 0
# $max-dist(8)*2000
# $max/((dist(8)+1)**0.5)
# clamp($max/((dist(8)+1)**0.5)-10000, $min, $max)
# sin(clamp(dist(8)/3, 0, 6.28))*4000
}

proc bgerror {msg} {
    puts "background error:\n$msg\n$::errorInfo"
    #exit
}

proc mapget {col row} {
    return [lindex $::afrc_map $row $col]
}

proc mapset {col row value} {
    if {$value < $::trim_min} {set value $::trim_min}
    if {$value > $::trim_max} {set value $::trim_max}
    lset ::afrc_map $row $col $value
}

proc bounds {col row} {
    return [list [e $col * 30 + 10] [e $row * 10 + 10] [e $col * 30 + 10 + 29] [e $row * 10 + 19]] 
}

proc color {value} {
    set i [e {int(($value - $::trim_min) * 255 / ($::trim_max - $::trim_min))}]
    return [format #%02x%02x%02x $i $i 0]
}

proc refresh_cell {col row} {
    #puts "$col $row = [mapget $col $row]"
    .win.c itemconfigure ${col},$row -fill [color [mapget $col $row]]
}

proc show_cell {cnv id col row} {
    set ::cell_text "[lindex $::afrc_map $row $col] at row $row col $col"
    lassign [$cnv coords $id] x y
    $cnv coords cell_text $x [e {$y - 5}] 
    $cnv itemconfigure cell_text -state normal 
    #puts [$cnv itemconfigure cell_text]
}

proc hide_cell {cnv id col row} {
    $cnv itemconfigure cell_text -state hidden 
}

proc init_gui {} {
    # system stuff
#    console show ;# useless
    fconfigure stdout -buffering line
#    interp bgerror {} background_error

    # toplevel window
    wm withdraw .
    set w .win
    toplevel $w
    wm title $w Mapper
    wm deiconify $w
    bind $w <Destroy> {
        exit
    }

    # AFRC map canvas
    set c ${w}.c
    canvas $c -relief sunken -borderwidth 2 -width 500 -height 650
    pack $c -side left -expand no -fill none

    for {set row 0} {$row < $::afrc_maf_rows} {incr row} {
        for {set col 0} {$col < $::afrc_rpm_cols} {incr col} {
            set id [$c create rectangle [bounds $col $row] \
                -tags [list ${col},$row c$col r$row]]
            $c bind $id <Enter> "
                show_cell $c $id $col $row
            "
            $c bind $id <Leave> "
                hide_cell $c $id $col $row
            "
            # test gradient: mapset $col $row [e $::trim_double * $col * $row / $::afrc_rpm_cols / $::afrc_maf_rows]
            set dx [e $col - 12]
            set dy [e $row - 41]
            mapset $col $row [e $::trim_double - $dx * $dx * 100 - $dy * $dy * 100]
            refresh_cell $col $row
        }
    }
    set t ${w}.cell_text
    set ::cell_text {}
    entry $t -textvariable ::cell_text 
    $c create window 0 0 -tags cell_text -state hidden -window $t -height 25 -width 140 -anchor s

    # tools frame
    set tools ${w}.tools
    frame $tools -relief sunken -borderwidth 2 
    pack $tools -side left -expand yes -fill both
    
    set btns ${tools}.btns
    frame $btns -relief flat -borderwidth 2
    pack $btns -side top -expand no -fill x    
    
    set b ${btns}.calc
    button $b -text Calculate -command calc_afrc_map
    pack $b -side left -expand no -fill none
    
    set b ${btns}.send
    button $b -text Send -command send_afrc_map
    pack $b -side right -expand no -fill none

    set terms ${tools}.terms
    frame $terms -relief sunken -borderwidth 2
    pack $terms -side top -expand yes -fill both
    
    # terms grid
    for {set i 0} {$i < $::max_terms} {incr i} {
        set f ${terms}.term$i
        frame $f -relief sunken -borderwidth 2
        pack $f -side top -expand no -fill x
        
        set cx ${f}.cx
        entry $cx -width 3 -textvariable ::term_center_x($i)
        pack $cx -side left -expand no -fill none

        set cy ${f}.cy
        entry $cy -width 3 -textvariable ::term_center_y($i)
        pack $cy -side left -expand no -fill none

        set en ${f}.enable
        checkbutton $en -text {} -variable ::term_enable($i)
        pack $en -side left -expand no -fill none

        set e ${f}.expr
        entry $e -textvariable ::term_expr($i) -font {Courier 15}
        pack $e -side left -expand yes -fill x
        bind $e <Return> calc_afrc_map
    }
}

# #########################################################

set ::max_terms 10

if {[catch {
    
    load_afrc_map default.map
    
    init_gui
    
    vwait forever
    
} err]} {
    puts "foreground error: \n$err\n$errorInfo"
    exit
}
