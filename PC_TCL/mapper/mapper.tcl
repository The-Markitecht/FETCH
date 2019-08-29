
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

package ifneeded MityBuild 3.0 {
    source J:/temp/MityBuild/libMityBuild
}
package require Tk
package require MityBuild

#source [f+ $::builderDir trace.tcl]
source [f+ $::builderDir fletcher16.tcl]
source [f+ $::builderDir .. .. DE0_nano source synapse program maf_interpolate.tcl]

# the higher-res MAF ref is used to recover absolute flow.
# so it has more cells than afrc_maf_rows.
::maf_ref_num_cells = 256

proc init_port {port_num} {
    ::capture = [open [f+ $::builderDir port_capture.txt] w]
    ::port = [open //./com$port_num r+]
    fconfigure $::port -blocking 0 -buffering none -mode 115200,n,8,1 -handshake none -translation cr
    ::read_interval_ms = 300
    ::read_interval_enabled = 1
    scheduled_read_port 
    tx hello
}

proc flush_rx {} {
    read $::port
}

proc scheduled_read_port {} {
    if {$::read_interval_enabled} read_port
    after $::read_interval_ms scheduled_read_port
}

proc read_port {} {
    if {[catch {
        s = [read $::port]
        print_rx $s
        scan_data $s
    } err]} {
        print_rx "\n-- rx error: $err\n"
    }
}

proc tx {msg} {
    if {[catch {
        print_rx "\n>> $msg\n"
        puts $::port $msg
    } err]} {
        print_rx "\n-- tx error: $err\n"
    }
}

proc scan_data {data} {
    # 03f1: rpm=0000 pfl=0000,0000 o2=0000 tp=0a7e,0543,0 s7=045d s6=0fff s5=0fff s4=0fff s3=0fff s2=0fff s1=0fff s0=0170 pl=STP mt=0000 tf=
    foreach word [split $data { }] {
        lassign [split $word =] name value
        if {$value ne {}} {
            ::data($name) = $value
        }
    }          
    
    # update GUI run marks 
    if {[info exists ::data(map)]} {
        m = [split $::data(map) ,]
        if {[llength $m] == 2} {
            ::afrc_run_mark = $m
            eval refresh_afrc_run_mark $::afrc_run_mark
        }
    }
    if {[info exists ::data(bti)]} {
        if {[scan $::data(bti) %4x idx] == 1} {
            ::block_temp_map_idx := $idx
            for {set i 0} {$i < [array size ::block_temp_ref]} {incr i} {
                .win.tools.refs.block_temp_ref.run$i configure -text {} -background $::system_label_background
            }
            .win.tools.refs.block_temp_ref.run$::block_temp_map_idx configure -text {<<} -background red
        }
    }
    if {[info exists ::data(asi)]} {
        if {[scan $::data(asi) %4x idx] == 1} {
            ::afterstart_map_idx := $idx
            for {set i 0} {$i < [array size ::afterstart_ref]} {incr i} {
                .win.tools.refs.afterstart_ref.run$i configure -text {} -background $::system_label_background
            }
            .win.tools.refs.afterstart_ref.run$::afterstart_map_idx configure -text {<<}  -background red
        }
    }

    # update GUI sensor display
    for {set i 0} {$i < 8} {incr i} {
        if {[info exists ::data(s$i)]} {
            ::sensor_hex($i) = "0x$::data(s$i)"
            ::sensor_dec($i) := int($::sensor_hex($i))
            ::sensor_degf($i) = "[adc_to_degf $::sensor_dec($i)] F" 
        }
    }
}

proc get4x {} {
    valu = -1
    if {[catch {
        s = [read $::port]
        print_rx $s
        scan $s %4x valu
    } err]} {
        print_rx "\n-- rx error: $err\n"
    }    
    return $valu
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
    ::sent = [list]
}

proc clear_sent_row {row} {
    i = [lsearch -exact -integer $::sent $row]
    if {$i >= 0} {
        ::sent = [lreplace $::sent $i $i]
    }
}

proc lod {fn} {
    load_maps $fn
    calc_afrc_map
}

proc load_maps {fn} {
    ::trim_half = 0
    ::trim_unity = 8192
    ::trim_double = 24576
    ::trim_min = $::trim_half
    ::trim_max = $::trim_double

    ::max_terms = 8
    ::pi = 3.1415926

    # sensor friendly names in order 0 thru 7.
    ::sensor_name = [list {} {} {Engine Block} {Transmission} {} {} {} {}]
    
    if {[file extension $fn] eq {}} {
        append fn .map
    }
    fn = [f+ $::builderDir maps $fn]

    f = [open $fn r]
    array set content [read $f]
    close $f
    
    foreach lst {::afrc_map  ::maf_ref  ::rpm_ref} {
        $lst = $content([string trim $lst :])
    }
    foreach ary {::term_center_x  ::term_center_y  ::term_expr  ::term_enable
        ::block_temp_ref  ::block_temp_map  
        ::afterstart_ref  ::afterstart_map} {
        catch {unset $ary}
        i = 0
        foreach item $content([string trim $ary :]) {
            "${ary}($i)" = $item
            incr i
        }
    }
    
    if {$::max_terms != [array size ::term_expr]} {
        error "Expected $::max_terms terms but found [array size ::term_expr]."
    }
     
    ::afrc_maf_rows = [llength $::afrc_map] 
    ::afrc_rpm_cols = [llength [::afrc_map ^ 0]]            
    ::block_temp_map_idx = 0
    ::afterstart_map_idx = 0
    
    clear_sent
}

proc sav {fn} {
    if {[file extension $fn] eq {}} {
        append fn .map
    }
    fn = [f+ $::builderDir maps $fn]
#TODO: fix missing and confused equal signs in this proc??
    foreach lst {::afrc_map  ::maf_ref  ::rpm_ref} {
        content([string = trim $lst :]) [set $lst]
    }
    foreach ary {::term_center_x  ::term_center_y  ::term_expr  ::term_enable
        ::block_temp_ref  ::block_temp_map  
        ::afterstart_ref  ::afterstart_map} {
        content([string = trim $ary :]) [to_list $ary]
    }

    f = [open $fn w]
    puts $f [array get content]
    close $f
}

proc to_list {ary} {
    ls = [list]
    foreach i [lsort -integer [array names $ary]] {
        lappend ls [set "${ary}($i)"]
    }
    return $ls
}

proc disable_status_report {} {
    ::read_interval_enabled = 0
    tx stoff
    after [e $::read_interval_ms + 100] ;# allow plenty of time for an entire status report to arrive, assuming it had started just before stoff.
    read_port
}

proc enable_status_report {} {
    flush $::capture
    #return ;# debugging only.
    ::read_interval_enabled = 1
    tx ston
}

proc send_row {cmd  seed  data_words  desc} {
    fletcher16_init local_sum
    if {$seed != -1} {
        fletcher16_input16 local_sum $seed
    }
    tx $cmd
    data = {}
    foreach v $data_words {
        fletcher16_input16 local_sum $v
        append data [format %04x $v]
    }
    sum = [fletcher16_result local_sum]
    tx $data
    for {set i 0} {$i < 10} {incr i} {
        after 40
        update ;# required because evidently async I/O shares the same event loop with Wish GUI.
        remote_sum = [get4x]
        #print_rx "\n-- remote [format %04x $remote_sum]\n"
        if {$remote_sum >= 0} break
    }
    #print_rx "\n-- local [format %04x $sum] remote [format %04x $remote_sum]\n"
    if {$remote_sum != $sum} {
        print_rx "\n-- ERROR: $desc should have had checksum [format %04x $sum]\n"
        return 0
    }
    return 1
}

proc send_afrc_map {} {
    disable_status_report
    for {set row 0} {$row < $::afrc_maf_rows} {incr row} {
        if {$row ni $::sent} {
            if { ! [send_row  ldafrc  -1  [concat $row [::afrc_map ^ $row]]  "row $row"]} return
            lappend ::sent $row
        }
    }
    send_row  ldrpm  -1  $::rpm_ref  {RPM reference}
    send_row  ldmaf  -1  [get_hi_res_maf_ref $::maf_ref $::maf_ref_num_cells]  {MAF reference}
    enable_status_report
}

proc send_block_temp_map {} {
    disable_status_report
    send_row  ldbtref -1  [to_list ::block_temp_ref]  {Block temp reference}
    send_row  ldbtmap -1  [to_list ::block_temp_map]  {Block temp map}
    enable_status_report
}

proc send_afterstart_map {} {
    disable_status_report
    send_row  ldasref  -1  [to_list ::afterstart_ref]  {Afterstart reference}
    send_row  ldasmap  -1  [to_list ::afterstart_map]  {Afterstart map}
    enable_status_report
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
    term = $term_num
    tc_col = $::term_center_x($term_num)
    tc_row = $::term_center_y($term_num)
    dx := $col - $tc_col
    dy := $row - $tc_row
    result = {}
    if {[catch {
        result = [e "int($ex)"]
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
            sum = 0
            for {set term 0} {$term < $::max_terms} {incr term} {
                if {$::term_enable($term)} {
                    ex = [string trim $::term_expr($term)]
                    if {$ex ne {}} {
                        v = [eval_term $term $ex $row $col]
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
    i := int(($value - $::trim_min) * 255 / ($::trim_max - $::trim_min))
    return [format #%02x%02x%02x $i $i 0]
}

proc refresh_cell {col row} {
    .win.c itemconfigure ${col},$row -fill [color [mapget $col $row]]
}

proc show_cell {cnv id col row} {
    flow = [::maf_ref ^ $row]
    rpm = [::rpm_ref ^ $col]
    ::cell_text = "[lindex $::afrc_map $row $col] at $col , $row\n$rpm RPM, $flow MAF"
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
    foreach tab {terms refs btest none} {
        pack forget .win.tools.$tab
    }
    if {$::show_tab ne {none}} {
        pack .win.tools.$::show_tab -before .win.tools.console -side top -expand no -fill x
    }
}

proc print_rx {msg} {
    # assumes the message already contains a newline; none is added here.
    puts -nonewline $::capture $msg
    t = .win.tools.console.rx
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
    t = .win.tools.console.tcl
    $t insert end $msg
    while {[$t count -displaylines 1.0 end] > 1000} {
        $t delete 1.0 {10.end + 1 display chars} 
    } 
    $t see end    
    update idletasks
}

proc run_tcl {} {
    t = .win.tools.console.tcl
    cmd = [$t get {insert linestart} {insert lineend}]
    if {[string range $cmd 0 [string length $::prompt]-1] == $::prompt} {
        cmd = [string range $cmd [string length $::prompt] end]
    }
    #print_tcl "\n$cmd\n"    
    if {[catch {set result [eval $cmd]} err]} {
        print_tcl \n$err\n$::errorInfo\n$::prompt
    } else {
        print_tcl \n$result\n$::prompt
    }
    return -code break ;# don't run the built-in handler to honor the Return keypress in the usual way.
}

proc btest_start {suite} {
    namespace eval ::bt {}
    namespace delete ::bt
    btest_run_chunk [info body $suite]
}

proc btest_run_chunk {body} {
    delim = [string first \n\n $body]
    if {$delim == -1} {
        chunk = $body
        body = {}
    } else {
        chunk = [string range $body 0 ${delim}-1]
        body =  [string range $body ${delim}+1 end]
    }
    
    namespace eval ::bt $chunk
    
    if {[string length $body] > 0} {
        after 100 [list btest_run_chunk $body]
    }
}

proc suite1 {} {
    ::show_tab = terms
    refresh_show_tab

    ::show_tab = btest
    refresh_show_tab

    ::show_tab = refs
    refresh_show_tab

    ::show_tab = btest
    refresh_show_tab

    ::show_tab = none
    refresh_show_tab

    ::show_tab = btest
    refresh_show_tab
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
    w = .win
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
    c = ${w}.c
    canvas $c -relief sunken -borderwidth 2 -width 500 -height 650
    pack $c -side left -expand no -fill none

    for {set row 0} {$row < $::afrc_maf_rows} {incr row} {
        for {set col 0} {$col < $::afrc_rpm_cols} {incr col} {
            id = [$c create rectangle [bounds $col $row] \
                -tags [list ${col},$row c$col r$row]]
            $c bind $id <Enter> "
                show_cell $c $id $col $row
            "
            $c bind $id <Leave> "
                hide_cell $c $id $col $row
            "
#patch: for testing
$c bind $id <Button-1> "
    ::afrc_run_mark = {$col $row}
"
            # test gradient: mapset $col $row [e $::trim_double * $col * $row / $::afrc_rpm_cols / $::afrc_maf_rows]
            dx := $col - 12
            dy := $row - 41
            mapset $col $row [e $::trim_double - $dx * $dx * 100 - $dy * $dy * 100]
            refresh_cell $col $row
        }
    }
    
    # movable items on map canvas
    t = ${w}.cell_text
    ::cell_text = {}
    label $t -textvariable ::cell_text  -justify center 
    $c create window 0 0 -tags cell_text -state hidden -window $t -height 25 -width 140 -anchor s

    ::afrc_run_mark = {}
    id = [$c create oval -100 -100 -90 -90 -tags afrc_run_mark -outline red -width 3]

    # tools frame
    tools = ${w}.tools
    frame $tools -relief sunken -borderwidth 2 
    pack $tools -side left -expand yes -fill both
    
    btns = ${tools}.btns
    frame $btns -relief flat -borderwidth 2
    pack $btns -side top -expand no -fill x    
    
    ts = [frame $btns.tabselect]
    pack $ts -side left -expand no -fill none -padx 2
    b = [radiobutton $ts.terms -text Terms -font "-size 18" -command refresh_show_tab -variable ::show_tab -value terms]
    grid $b -row 0 -column 0 -sticky w
    b = [radiobutton $ts.refs -text Refs -font "-size 18" -command refresh_show_tab -variable ::show_tab -value refs]
    grid $b -row 1 -column 0 -sticky w
    set b [radiobutton $ts.btest -text {Bench Test} -font "-size 18" -command refresh_show_tab -variable ::show_tab -value btest]
    grid $b -row 0 -column 1 -sticky w
    b = [radiobutton $ts.none -text None -font "-size 18" -command refresh_show_tab -variable ::show_tab -value none]
    grid $b -row 1 -column 1 -sticky w
    
    b = ${btns}.calc
    button $b -text Calculate -font "-size 24" -command calc_afrc_map
    pack $b -side left -expand no -fill none -padx 2
    
    b = ${btns}.send
    button $b -text Send -font "-size 24" -command send_afrc_map
    pack $b -side left -expand no -fill none -padx 2

    b = ${btns}.enable_all
    button $b -text All -font "-size 14" -command "enable_all_terms select"
    pack $b -side left -expand no -fill none -padx 2
    
    b = ${btns}.disable_all
    button $b -text None -font "-size 14" -command "enable_all_terms deselect"
    pack $b -side left -expand no -fill none -padx 2

    b = ${btns}.toggle_all
    button $b -text Toggle -font "-size 14" -command "enable_all_terms toggle"
    pack $b -side left -expand no -fill none -padx 2

    # terms grid
    terms = ${tools}.terms
    frame $terms -relief sunken -borderwidth 2
#    pack $terms -side top -expand no -fill x
    
    for {set i 0} {$i < $::max_terms} {incr i} {
        # terms grid
        f = ${terms}.term$i
        frame $f -relief sunken -borderwidth 2
        pack $f -side top -expand no -fill x
        
        desc = ${f}.desc
        entry $desc -textvariable ::term_desc($i) -justify center
        pack $desc -side bottom -expand yes -fill x
        bind $desc <FocusIn> "focused_term $i"
        bind $desc <FocusOut> "unfocused_term $i"

        cx = ${f}.cx
        entry $cx -width 3 -textvariable ::term_center_x($i)
        pack $cx -side left -expand no -fill none
        bind $cx <Return> calc_afrc_map
        bind $cx <Up>    "move_term $i 0 -1"
        bind $cx <Down>  "move_term $i 0 1"
        bind $cx <Left>  "move_term $i -1 0"
        bind $cx <Right> "move_term $i 1 0"

        cy = ${f}.cy
        entry $cy -width 3 -textvariable ::term_center_y($i)
        pack $cy -side left -expand no -fill none
        bind $cy <Return> calc_afrc_map
        bind $cy <Up>    "move_term $i 0 -1"
        bind $cy <Down>  "move_term $i 0 1"
        bind $cy <Left>  "move_term $i -1 0"
        bind $cy <Right> "move_term $i 1 0"

        ::term_enable($i) = 1
        en = ${f}.enable
        checkbutton $en -text {} -variable ::term_enable($i) -command calc_afrc_map
        pack $en -side left -expand no -fill none

        err = ${f}.error
        label $err -width 5 -justify center
        set_term_error $i {}
        pack $err -side left -expand no -fill none

        ex = ${f}.expr
        entry $ex -textvariable ::term_expr($i) -font {Courier 15}
        pack $ex -side left -expand yes -fill x
        bind $ex <Return> calc_afrc_map
        bind $ex <FocusIn> "focused_term $i"
        bind $ex <FocusOut> "unfocused_term $i"

        # term center markers  
        id = [$c create oval 0 0 10 10 -tags center$i]
        set_term_center $i
        unfocused_term $i
        $c bind $id <Button-1> "focus_term $i"
    }
    
    # refs grid
    refs = ${tools}.refs
    frame $refs -relief sunken -borderwidth 2
#    pack $refs -side top -expand no -fill x

    btr = [frame $refs.block_temp_ref]
    pack $btr -side left -expand no -fill y -padx 4
    btn = [button $btr.send -text "Send Block Temp Ref/Map" -command send_block_temp_map]
    grid $btn -column 0 -row 0 -columnspan [e int(ceil([array size ::block_temp_ref]/16)) * 3]
    for {set i 0} {$i < [array size ::block_temp_ref]} {incr i} {
        ent = [entry $btr.ref$i -textvariable ::block_temp_ref($i) -justify center -width 4 -font "-size 7"]
        grid $ent   -column [e int(floor($i/16)) * 3] -row [e $i % 16 + 1]
        ent = [entry $btr.map$i -textvariable ::block_temp_map($i) -justify center -width 5 -font "-size 7" -background yellow]
        grid $ent   -column [e int(floor($i/16)) * 3 + 1] -row [e $i % 16 + 1]
        lbl = [label $btr.run$i -justify left -width 4 -font {-size 7 -weight bold}]
        grid $lbl -column [e int(floor($i/16)) * 3 + 2] -row [e $i % 16 + 1] -sticky w
    }

    astr = [frame $refs.afterstart_ref]
    pack $astr -side left -expand no -fill y  -padx 4
    btn = [button $astr.send -text "Send Afterstart Ref/Map" -command send_afterstart_map]
    grid $btn -column 0 -row 0 -columnspan 3
    for {set i 0} {$i < [array size ::afterstart_ref]} {incr i} {
        ent = [entry $astr.ref$i -textvariable ::afterstart_ref($i) -justify center -width 7 -font "-size 7"]
        grid $ent -column 0 -row [e $i + 1] -sticky e
        ent = [entry $astr.map$i -textvariable ::afterstart_map($i) -justify center -width 5 -font "-size 7" -background orange]
        grid $ent -column 1 -row [e $i + 1] -sticky w
        lbl = [label $astr.run$i -justify left -width 4 -font {-size 7 -weight bold}]
        grid $lbl -column 2 -row [e $i + 1] -sticky w
    }

    sens = [frame $refs.sens]
    pack $sens -side left -expand no -fill y -padx 4
    for {set i 0} {$i < [llength $::sensor_name]} {incr i} {
        lbl = [label $sens.lbl$i -text "[::sensor_name ^ $i] s$i" -justify right]
        grid $lbl -column 0 -row $i -sticky e
        lbl = [label $sens.hex$i -textvariable ::sensor_hex($i) -justify right]
        grid $lbl -column 1 -row $i -sticky e
        lbl = [label $sens.dec$i -textvariable ::sensor_dec($i) -justify right]
        grid $lbl -column 2 -row $i -sticky e
        lbl = [label $sens.degf$i -textvariable ::sensor_degf($i) -justify right -font "-size 14"]
        grid $lbl -column 3 -row $i -sticky e
        ::system_label_background = [$lbl cget -background]
#patch: for testing
bind $lbl <Button-1> {
    scan_data {03f1: rpm=0000 pfl=0000,0000 o2=0000 tp=0a7e,0543,0 map=0003,000d bti=0004 asi=0006 s7=0fff s6=0fff s5=0fff s4=0fff s3=0400 s2=0500 s1=0fff s0=0fff pl=STP mt=0000 tf=}
}
    }
    
    # bench test controls
    btest = ${tools}.btest
    frame $btest -relief sunken -borderwidth 2
#    pack $btest -side top -expand no -fill x
    button $btest.suite1 -text {Start suite 1} -command {btest_start suite1}
    pack $btest.suite1 -side left -expand no -fill none
    
    # serial display & Tcl console
    cnsl = ${tools}.console
    frame $cnsl -relief sunken -borderwidth 2
    pack $cnsl -side top -expand yes -fill both
    
    tcl = ${cnsl}.tcl
    text $tcl -font {Courier 11} -wrap char -height 5
    pack $tcl -side bottom -expand no -fill x
    bind $tcl <Return> run_tcl
    #interp alias {} puts {} print_tcl
    ::prompt = {Tcl> }
    print_tcl $::prompt

    rx = ${cnsl}.rx
    text $rx -font {Courier 11} -wrap char
    pack $rx -side top -expand yes -fill both

    ::show_tab = btest
    refresh_show_tab
}

# #########################################################

if {[catch {
    console show
    
    
    load_maps default.map
    
    init_gui

    init_port 22
    
    vwait forever
    
} err]} {
    puts "foreground error: \n$err\n$errorInfo"
#    exit
}
