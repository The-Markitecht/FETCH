
# to do:  
# console for save & load etc. wish console useless.
# save & load terms with map.
# arrow keys move center of term while focus is in center coordinate fields.
    # isn't it better to just drag & drop center marker?  
    # no.  have to be able to move way outside of map bounds while observing area of effect.

# useful terms:
#    $::trim_max - int(sqrt($dx*$dx*8+$dy*$dy)*2000)
# dist(8) < 5 ? $max/(dist(8)+1) : 0
# $max-dist(8)*2000
# $max/((dist(8)+1)**0.5)
# clamp($max/((dist(8)+1)**0.5)-10000, $min, $max)
# sin(clamp(dist(8)/3, 0, 6.28))*4000
# (sin(clamp(dist(8)/3, -$pi, $pi))+1)*4000

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

proc ::tcl::mathfunc::dist {x_aspect} {
    return [e {sqrt($::dx*$::dx*$x_aspect + $::dy*$::dy)}]
}

proc ::tcl::mathfunc::clamp {n min max} {
    return [e {max($min, min($max, $n))}]
}

proc ::tcl::mathfunc::sinhump {x_aspect  tabletop_radius  rolloff_radius  trim_scale} {
    return [e {(1 - sin(clamp( (dist($x_aspect)-$tabletop_radius) / ($rolloff_radius*$::pi/10), 0, $::pi)-$::pi/2)) * $trim_scale / 2}]
}

proc eval_term {term_num  ex  row  col} {
    set_term_error $term_num {}
    foreach var {dx dy tc_row tc_col term pi} {
        upvar ::$var $var
    }
    foreach var {max min double half unity} {
        upvar ::trim_$var $var
    }
    set term $term_num
    set tc_col $::term_center_x($term_num)
    set tc_row $::term_center_y($term_num)
    set dx [e {$col - $tc_col}]
    set dy [e {$row - $tc_row}]
    set result {}
    if {[catch {
        set result [e "int($ex)"]
    } err]} {
        set_term_error $term $err
    }
    return $result
}

proc calc_afrc_map {} {
    clear_sent
    #patch: upgrade from clear_sent to clear_sent_row    
    for {set row 0} {$row < $::afrc_maf_rows} {incr row} {
        for {set col 0} {$col < $::afrc_rpm_cols} {incr col} {
            set sum 0
            for {set term 0} {$term < $::max_terms} {incr term} {
                if {$::term_enable($term)} {
                    set ex [string trim $::term_expr($term)]
                    if {$ex ne {}} {
                        set v [eval_term $term $ex $row $col]
                        if {$v eq {}} return
                        incr sum $v
                    }
                }
            }
            mapset $col $row $sum
            refresh_cell $col $row
        }
    }
}

proc bgerror {msg} {
    print_tcl "background error:\n$msg\n$::errorInfo"
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
    return [list [e $col * 30 + 10] [e $row * 10 + 10] [e $col * 30 + 10 + 30] [e $row * 10 + 20]] 
}

proc color {value} {
    set i [e {int(($value - $::trim_min) * 255 / ($::trim_max - $::trim_min))}]
    return [format #%02x%02x%02x $i $i 0]
}

proc refresh_cell {col row} {
    .win.c itemconfigure ${col},$row -fill [color [mapget $col $row]]
}

proc show_cell {cnv id col row} {
    set ::cell_text "[lindex $::afrc_map $row $col] at $col , $row"
    lassign [$cnv coords $id] x y
    $cnv coords cell_text $x [e {$y - 5}] 
    $cnv itemconfigure cell_text -state normal 
}

proc hide_cell {cnv id col row} {
    $cnv itemconfigure cell_text -state hidden 
}

proc set_term_error {term msg} {
    if {$msg eq {}} {
        .win.tools.terms.term${term}.error configure -text "$term OK" -background green
    } else {
        print_tcl "term $term error: $msg"
        .win.tools.terms.term${term}.error configure -text ERROR -background red
    }
}

proc enable_all_terms {cmd} {
    for {set i 0} {$i < $::max_terms} {incr i} {    
        .win.tools.terms.term${i}.enable $cmd
    }
    calc_afrc_map
}

proc focus_term {term} {
    focus .win.tools.terms.term${term}.expr
}

proc focused_term {term} {
    .win.c itemconfigure center$term -outline green -width 5 
}

proc unfocused_term {term} {
    .win.c itemconfigure center$term -outline blue -width 3
}

proc show_terms {} {
    if {$::show_terms} {
        pack .win.tools.terms -before .win.tools.console -side top -expand no -fill x
    } else {
        pack forget .win.tools.terms
    }
}

proc print_rx {msg} {
    # assumes the message already contains a newline; none is added here.
    set t .win.tools.console.rx
    $t insert end $msg
    while {[$t count -displaylines 1.0 end] > 60} {
        $t delete 1.0 {10.end + 1 display chars} 
    } 
    $t see end    
    update idletasks
}

proc print_tcl {msg} {
    # assumes the message already contains a newline; none is added here.
    puts $msg
    set t .win.tools.console.tcl
    $t insert end $msg
    while {[$t count -displaylines 1.0 end] > 1000} {
        $t delete 1.0 {10.end + 1 display chars} 
    } 
    $t see end    
    update idletasks
}

proc run_tcl {} {
    set t .win.tools.console.tcl
    set cmd [$t get {insert linestart} {insert lineend}]
    if {[string range $cmd 0 [string length $::prompt]-1] == $::prompt} {
        set cmd [string range $cmd [string length $::prompt] end]
    }
    #print_tcl "\n$cmd\n"    
    if {[catch {set result [eval $cmd]} err]} {
        print_tcl \n$err\n$::errorInfo\n$::prompt
    } else {
        print_tcl \n$result\n$::prompt
    }
    return -code break ;# don't run the built-in handler to honor the Return keypress in the usual way.
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
    bind $w <Control-c> calc_afrc_map
    bind $w <Control-Return> send_afrc_map

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
    entry $t -textvariable ::cell_text  -justify center
    $c create window 0 0 -tags cell_text -state hidden -window $t -height 25 -width 140 -anchor s

    # tools frame
    set tools ${w}.tools
    frame $tools -relief sunken -borderwidth 2 
    pack $tools -side left -expand yes -fill both
    
    set btns ${tools}.btns
    frame $btns -relief flat -borderwidth 2
    pack $btns -side top -expand no -fill x    
    
    set b ${btns}.show_terms
    set ::show_terms 1
    checkbutton $b -text Terms -font "-size 24" -command show_terms -variable ::show_terms
    pack $b -side left -expand no -fill none -padx 2
    
    set b ${btns}.calc
    button $b -text Calculate -font "-size 24" -command calc_afrc_map
    pack $b -side left -expand no -fill none -padx 2
    
    set b ${btns}.send
    button $b -text Send -font "-size 24" -command send_afrc_map
    pack $b -side left -expand no -fill none -padx 2

    set b ${btns}.enable_all
    button $b -text All -font "-size 14" -command "enable_all_terms select"
    pack $b -side left -expand no -fill none -padx 2
    
    set b ${btns}.disable_all
    button $b -text None -font "-size 14" -command "enable_all_terms deselect"
    pack $b -side left -expand no -fill none -padx 2

    set b ${btns}.toggle_all
    button $b -text Toggle -font "-size 14" -command "enable_all_terms toggle"
    pack $b -side left -expand no -fill none -padx 2

    set terms ${tools}.terms
    frame $terms -relief sunken -borderwidth 2
    pack $terms -side top -expand no -fill x
    
    for {set i 0} {$i < $::max_terms} {incr i} {
        # terms grid
        set f ${terms}.term$i
        frame $f -relief sunken -borderwidth 2
        pack $f -side top -expand no -fill x
        
        set desc ${f}.desc
        entry $desc -textvariable ::term_desc($i) -justify center
        pack $desc -side bottom -expand yes -fill x
        bind $desc <FocusIn> "focused_term $i"
        bind $desc <FocusOut> "unfocused_term $i"

        set cx ${f}.cx
        entry $cx -width 3 -textvariable ::term_center_x($i)
        pack $cx -side left -expand no -fill none
        bind $cx <Return> calc_afrc_map

        set cy ${f}.cy
        entry $cy -width 3 -textvariable ::term_center_y($i)
        pack $cy -side left -expand no -fill none
        bind $cy <Return> calc_afrc_map

        set en ${f}.enable
        checkbutton $en -text {} -variable ::term_enable($i) -command calc_afrc_map
        pack $en -side left -expand no -fill none

        set error ${f}.error
        label $error -width 5 -justify center
        set_term_error $i {}
        pack $error -side left -expand no -fill none

        set e ${f}.expr
        entry $e -textvariable ::term_expr($i) -font {Courier 15}
        pack $e -side left -expand yes -fill x
        bind $e <Return> calc_afrc_map
        bind $e <FocusIn> "focused_term $i"
        bind $e <FocusOut> "unfocused_term $i"

        # term center markers  
        lassign [bounds $::term_center_x($i) $::term_center_y($i)] x1 y1 x2 y2  
        incr x1 -4
        incr y1 -4
        incr x2 4
        incr y2 4
        set id [$c create oval $x1 $y1 $x2 $y2 -tags center$i]
        unfocused_term $i
        $c bind $id <Button-1> "focus_term $i"
    }
    
    # serial display & Tcl console
    set console ${tools}.console
    frame $console -relief sunken -borderwidth 2
    pack $console -side top -expand yes -fill both
    
    set tcl ${console}.tcl
    text $tcl -font {Courier 11} -wrap char -height 5
    pack $tcl -side bottom -expand no -fill x
    bind $tcl <Return> run_tcl
    #interp alias {} puts {} print_tcl
    set ::prompt {Tcl> }
    print_tcl $::prompt

    set rx ${console}.rx
    text $rx -font {Courier 11} -wrap char
    pack $rx -side top -expand yes -fill both
}

# #########################################################

set ::max_terms 8
set ::pi 3.1415926

if {[catch {
    
    load_afrc_map default.map
    
    init_gui
    
    vwait forever
    
} err]} {
    puts "foreground error: \n$err\n$errorInfo"
    exit
}
