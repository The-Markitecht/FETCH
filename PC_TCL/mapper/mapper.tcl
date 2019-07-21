
# to do:  
# function for term center marker bounds.
#   better, a function to just set them.
# bench testing
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
package require MityBuild

#source [file join [file dirname [info script]] trace.tcl]
source [file join [file dirname [info script]] fletcher16.tcl]

proc init_port {} {
    set ::port [open //./com11 r+]
    fconfigure $::port -blocking 0 -buffering none -mode 115200,n,8,1 -handshake none
    read_port 
}

proc read_port {} {
    if {[catch {
        set s [read $::port]
        print_rx $s
        scan_data $s
    } err]} {
        print_rx "\nrx error: $err\n"
    }
    after 300 read_port
}

proc tx {msg} {
    if {[catch {
        puts $::port $msg
    } err]} {
        print_rx "\ntx error: $err\n"
    }
}

proc scan_data {data} {
    # 03f1: rpm=0000 pfl=0000,0000 o2=0000 tp=0a7e,0543,0 s7=045d s6=0fff s5=0fff s4=0fff s3=0fff s2=0fff s1=0fff s0=0170 pl=STP mt=0000 tf=
    foreach word [split $data { }] {
        lassign [split $word =] name value
        if {$value ne {}} {
            set ::data($name) $value
        }
    }          
    
    # update GUI run marks 
    if {[info exists ::data(map)]} {
        set ::afrc_run_mark [split $::data(map) ,]
        eval refresh_afrc_run_mark $::afrc_run_mark
    }
    if {[info exists ::data(bti)]} {
        set ::block_temp_map_idx [e {int("0x$::data(bti)")}]
        for {set i 0} {$i < [array size ::block_temp_ref]} {incr i} {
            .win.tools.refs.block_temp_ref.run$i configure -text {} -background $::system_label_background
        }
        .win.tools.refs.block_temp_ref.run$::block_temp_map_idx configure -text {<<} -background red
    }
    if {[info exists ::data(asi)]} {
        set ::afterstart_map_idx [e {int("0x$::data(bti)")}]
        for {set i 0} {$i < [array size ::afterstart_ref]} {incr i} {
            .win.tools.refs.afterstart_ref.run$i configure -text {} -background $::system_label_background
        }
        .win.tools.refs.afterstart_ref.run$::afterstart_map_idx configure -text {<<}  -background red
    }

    # update GUI sensor display
    for {set i 0} {$i < 8} {incr i} {
        if {[info exists ::data(s$i)]} {
            set ::sensor_hex($i) "0x$::data(s$i)"
            set ::sensor_dec($i) [e {int($::sensor_hex($i))}]
            set ::sensor_degf($i) "[adc_to_degf $::sensor_dec($i)] F" 
        }
    }
}

proc adc_to_degf {adc} {
    if {$adc < 5 || $adc > 4090} {
        return 0 ;# invalid reading; probably sensor is disconnected.
    }

    # cubic polynomial from test run 2015/3/31.
    return [e {int( 
            0.0000000179780888794392 * $adc ** 3 
            - 0.000143319023091959 * $adc ** 2
            + 0.499930154162973 * double($adc) 
            -307.47204516067
    ) }]
}

proc clear_sent {} {
    set ::sent [list]
}

proc clear_sent_row {row} {
    set i [lsearch -exact -integer $::sent $row]
    if {$i >= 0} {
        set ::sent [lreplace $::sent $i $i]
    }
}

proc lod {fn} {
    load_maps $fn
    calc_afrc_map
}

proc load_maps {fn} {
    set ::trim_half    0
    set ::trim_unity   8192
    set ::trim_double  24576
    set ::trim_min     $::trim_half
    set ::trim_max     $::trim_double

    set ::max_terms 8
    set ::pi 3.1415926

    # sensor friendly names in order 0 thru 7.
    set ::sensor_name [list {} {} {Engine Block} {Transmission} {} {} {} {}]
    
    if {[file extension $fn] eq {}} {
        append fn .map
    }
    set fn [file join maps $fn]

    set f [open $fn r]
    array set content [read $f]
    close $f
    
    foreach lst {::afrc_map  ::maf_ref  ::rpm_ref} {
        set $lst $content([string trim $lst :])
    }
    foreach ary {::term_center_x  ::term_center_y  ::term_expr  ::term_enable
        ::block_temp_ref  ::block_temp_map  
        ::afterstart_ref  ::afterstart_map} {
        catch {unset $ary}
        set i 0
        foreach item $content([string trim $ary :]) {
            set "${ary}($i)" $item
            incr i
        }
    }
    
    if {$::max_terms != [array size ::term_expr]} {
        error "Expected $::max_terms terms but found [array size ::term_expr]."
    }
     
    set ::afrc_maf_rows [llength $::afrc_map] 
    set ::afrc_rpm_cols [llength [lindex $::afrc_map 0]]            
    set ::block_temp_map_idx 0
    set ::afterstart_map_idx 0
    
    clear_sent
}

proc sav {fn} {
    if {[file extension $fn] eq {}} {
        append fn .map
    }
    set fn [file join maps $fn]

    foreach lst {::afrc_map  ::maf_ref  ::rpm_ref} {
        set content([string trim $lst :]) [set $lst]
    }
    foreach ary {::term_center_x  ::term_center_y  ::term_expr  ::term_enable
        ::block_temp_ref  ::block_temp_map  
        ::afterstart_ref  ::afterstart_map} {
        set content([string trim $ary :]) [to_list $ary]
    }

    set f [open $fn w]
    puts $f [array get content]
    close $f
}

proc to_list {ary} {
    set ls [list]
    foreach i [lsort -integer [array names $ary]] {
        lappend ls [set "${ary}($i)"]
    }
    return $ls
}

proc send_row {cmd  seed  data_words  desc} {
    fletcher16_init local_sum
    if {$seed != -1} {
        fletcher16_input16 local_sum $seed
    }
    flush_rx
    foreach v $data_words {
        fletcher16_input16 local_sum $v
        append cmd [format %04x $v]
    }
    send $cmd
    set remote_sum [get4x]
    if {[get4x] != [fletcher16_result local_sum]} {
        show "ERROR: $desc should have had checksum $local_sum"
        break
    }
}

proc send_afrc_map {} {
    for {set row 0} {$row < $::afrc_maf_rows} {incr row} {
        if {$row ni $::sent} {
            send_row  [format ldafrc%04x $row]  $row  [lindex $::afrc_map $row]  "row $row"
            lappend ::sent $row
        }
    }
    send_row  ldrpm  -1  $::rpm_ref  {RPM reference}
    send_row  ldmaf  -1  $::maf_ref  {MAF reference}
}

proc send_block_temp_map {} {
    send_row  ldbtref -1  [to_list ::block_temp_ref]  {Block temp reference}
    send_row  ldbtmap -1  [to_list ::block_temp_map]  {Block temp map}
}

proc send_afterstart_map {} {
    send_row  ldastref  -1  [to_list ::afterstart_ref]  {Afterstart reference}
    send_row  ldastmap  -1  [to_list ::afterstart_map]  {Afterstart map}
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
    set flow [lindex $::maf_ref $row]
    set rpm [lindex $::rpm_ref $col]
    set ::cell_text "[lindex $::afrc_map $row $col] at $col , $row\n$rpm RPM, $flow MAF"
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

proc set_term_center {term} {
    lassign [bounds $::term_center_x($term) $::term_center_y($term)] x1 y1 x2 y2  
    incr x1 -4
    incr y1 -4
    incr x2 4
    incr y2 4
    .win.c create oval $x1 $y1 $x2 $y2 -tags center$term
}    

proc move_term {term dx dy} {
    incr ::term_center_x($term) $dx
    incr ::term_center_y($term) $dy
    .win.c coords oval $x1 $y1 $x2 $y2 -tags center$i]
}

proc refresh_afrc_run_mark {col_hex row_hex} {
    lassign [bounds 0x$col_hex 0x$row_hex] x1 y1 x2 y2  
    incr x1 4
    incr y1 -10
    incr x2 -4
    incr y2 10
    .win.c coords afrc_run_mark [list $x1 $y1 $x2 $y2]
}

proc refresh_show_tab {} {
    foreach tab {terms refs none} {
        pack forget .win.tools.$tab
    }
    if {$::show_tab ne {none}} {
        pack .win.tools.$::show_tab -before .win.tools.console -side top -expand no -fill x
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

    # init GUI's required globals
    array set ::data {}

    # toplevel window
    wm withdraw .
    set w .win
    toplevel $w
    wm title $w Mapper
    wm deiconify $w
#    wm state $w zoomed 
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
#patch: for testing
$c bind $id <Button-1> "
    set ::afrc_run_mark {$col $row}
"
            # test gradient: mapset $col $row [e $::trim_double * $col * $row / $::afrc_rpm_cols / $::afrc_maf_rows]
            set dx [e $col - 12]
            set dy [e $row - 41]
            mapset $col $row [e $::trim_double - $dx * $dx * 100 - $dy * $dy * 100]
            refresh_cell $col $row
        }
    }
    
    # movable items on map canvas
    set t ${w}.cell_text
    set ::cell_text {}
    label $t -textvariable ::cell_text  -justify center 
    $c create window 0 0 -tags cell_text -state hidden -window $t -height 25 -width 140 -anchor s

    set ::afrc_run_mark {}
    set id [$c create oval -100 -100 -90 -90 -tags afrc_run_mark -outline red -width 3]

    # tools frame
    set tools ${w}.tools
    frame $tools -relief sunken -borderwidth 2 
    pack $tools -side left -expand yes -fill both
    
    set btns ${tools}.btns
    frame $btns -relief flat -borderwidth 2
    pack $btns -side top -expand no -fill x    
    
    set ts [frame $btns.tabselect]
    pack $ts -side left -expand no -fill none -padx 2
    set b [radiobutton $ts.terms -text Terms -font "-size 18" -command show_tab -variable ::show_tab -value terms]
    grid $b -row 0 -column 0 -sticky w
    set b [radiobutton $ts.refs -text Refs -font "-size 18" -command show_tab -variable ::show_tab -value refs]
    grid $b -row 1 -column 0 -sticky w
#    set b [radiobutton $ts.sens -text Sensors -font "-size 18" -command show_tab -variable ::show_tab -value sens]
#    grid $b -row 0 -column 1 -sticky w
    set b [radiobutton $ts.none -text None -font "-size 18" -command show_tab -variable ::show_tab -value none]
    grid $b -row 1 -column 1 -sticky w
    
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

    # terms grid
    set terms ${tools}.terms
    frame $terms -relief sunken -borderwidth 2
#    pack $terms -side top -expand no -fill x
    
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
        bind $cx <Up>    "move_term $i 0 -1"
        bind $cx <Down>  "move_term $i 0 1"
        bind $cx <Left>  "move_term $i -1 0"
        bind $cx <Right> "move_term $i 1 0"

        set cy ${f}.cy
        entry $cy -width 3 -textvariable ::term_center_y($i)
        pack $cy -side left -expand no -fill none
        bind $cy <Return> calc_afrc_map
        bind $cy <Up>    "move_term $i 0 -1"
        bind $cy <Down>  "move_term $i 0 1"
        bind $cy <Left>  "move_term $i -1 0"
        bind $cy <Right> "move_term $i 1 0"

        set ::term_enable($i) 1
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
        set id [$c create oval 0 0 10 10 -tags center$i]
        set_term_center $i
        unfocused_term $i
        $c bind $id <Button-1> "focus_term $i"
    }
    
    # refs grid
    set refs ${tools}.refs
    frame $refs -relief sunken -borderwidth 2
#    pack $refs -side top -expand no -fill x

    set btr [frame $refs.block_temp_ref]
    pack $btr -side left -expand no -fill y -padx 4
    set btn [button $btr.send -text "Send Block Temp Ref/Map" -command send_block_temp_map]
    grid $btn -column 0 -row 0 -columnspan [e int(ceil([array size ::block_temp_ref]/16)) * 3]
    for {set i 0} {$i < [array size ::block_temp_ref]} {incr i} {
        set e [entry $btr.ref$i -textvariable ::block_temp_ref($i) -justify center -width 4 -font "-size 7"]
        grid $e   -column [e int(floor($i/16)) * 3] -row [e $i % 16 + 1]
        set e [entry $btr.map$i -textvariable ::block_temp_map($i) -justify center -width 5 -font "-size 7" -background yellow]
        grid $e   -column [e int(floor($i/16)) * 3 + 1] -row [e $i % 16 + 1]
        set lbl [label $btr.run$i -justify left -width 4 -font {-size 7 -weight bold}]
        grid $lbl -column [e int(floor($i/16)) * 3 + 2] -row [e $i % 16 + 1] -sticky w
    }

    set astr [frame $refs.afterstart_ref]
    pack $astr -side left -expand no -fill y  -padx 4
    set btn [button $astr.send -text "Send Afterstart Ref/Map" -command send_afterstart_map]
    grid $btn -column 0 -row 0 -columnspan 3
    for {set i 0} {$i < [array size ::afterstart_ref]} {incr i} {
        set e [entry $astr.ref$i -textvariable ::afterstart_ref($i) -justify center -width 7 -font "-size 7"]
        grid $e -column 0 -row [e $i + 1] -sticky e
        set e [entry $astr.map$i -textvariable ::afterstart_map($i) -justify center -width 5 -font "-size 7" -background orange]
        grid $e -column 1 -row [e $i + 1] -sticky w
        set lbl [label $astr.run$i -justify left -width 4 -font {-size 7 -weight bold}]
        grid $lbl -column 2 -row [e $i + 1] -sticky w
    }

    set sens [frame $refs.sens]
    pack $sens -side left -expand no -fill y -padx 4
    for {set i 0} {$i < [llength $::sensor_name]} {incr i} {
        l =bl [label $sens.lbl$i -text "[lindex $::sensor_name $i] s$i" -justify right]
        grid $lbl -column 0 -row $i -sticky e
        set lbl [label $sens.hex$i -textvariable ::sensor_hex($i) -justify right]
        grid $lbl -column 1 -row $i -sticky e
        set lbl [label $sens.dec$i -textvariable ::sensor_dec($i) -justify right]
        grid $lbl -column 2 -row $i -sticky e
        set lbl [label $sens.degf$i -textvariable ::sensor_degf($i) -justify right -font "-size 14"]
        grid $lbl -column 3 -row $i -sticky e
        set ::system_label_background [$lbl cget -background]
#patch: for testing
bind $lbl <Button-1> {
    scan_data {03f1: rpm=0000 pfl=0000,0000 o2=0000 tp=0a7e,0543,0 map=0003,000d bti=0004 asi=0006 s7=0fff s6=0fff s5=0fff s4=0fff s3=0400 s2=0500 s1=0fff s0=0fff pl=STP mt=0000 tf=}
}
    }
    
    # serial display & Tcl console
    set console ${tools}.console
    frame $console -relief sunken -borderwidth 2
    pack $console -side top -expand yes -fill both
    
    tcl = ${console}.tcl
    text $tcl -font {Courier 11} -wrap char -height 5
    pack $tcl -side bottom -expand no -fill x
    bind $tcl <Return> run_tcl
    #interp alias {} puts {} print_tcl
    ::prompt = {Tcl> }
    print_tcl $::prompt

    rx = ${console}.rx
    text $rx -font {Courier 11} -wrap char
    pack $rx -side top -expand yes -fill both

    ::show_tab = refs
    refresh_show_tab
}

# #########################################################

if {[catch {
    
    load_maps default.map
    
    init_gui

#    init_port
    
    vwait forever
    
} err]} {
    puts "foreground error: \n$err\n$errorInfo"
    exit
}