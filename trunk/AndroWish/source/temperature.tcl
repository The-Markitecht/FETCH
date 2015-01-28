
# Acer A110 tablet screen physical 600x1024, 
# 600x976 deducting action bar, 
# 1024x552 in landscape deducting action bar.

package require Tk
package require Ttk

set app_path [file dirname [info script]]
set window_width 600
set window_height 1024

# scaling functions are required for arbitrary scales, because ttk progressbar's require a minimum of 0.
proc degf_to_thou {degf} {
    return [expr $degf * 1000 / 550]
}

# color functions.
proc rgb_to_tk {rgb} {
    return "#[format %02x [lindex $rgb 0]][format %02x [lindex $rgb 1]][format %02x [lindex $rgb 2]]"
}

proc ints_to_tk {r g b} {
    return "#[format %02x $r][format %02x $g][format %02x $b]"
}

proc brighten {rgb percent} {
    set c [list]
    foreach cmp $rgb {
        set lack [expr 0xff - $cmp]
        set inc [expr int($percent * $lack / 100)]
        lappend c [expr $cmp + $inc]
    }
    return $c
}

# valuebar methods.
proc valuebar'new {vbname canvas_name left top width height rgb} {
    upvar $vbname vb
    set vb [dict create canvas $canvas_name items [dict create] \
        left $left top $top width $width height $height \
        color $rgb min 0 max 1000 value 500 \
        bottom [expr $top + $height] \
        right [expr $left + $width]]    
    set vy [expr $top + $height / 2]
    dict set vb items outline [$canvas_name create rectangle [dict get $vb left] [dict get $vb top] \
        [dict get $vb right] [dict get $vb bottom] -fill {} -outline black]
    set bar_colors [list [rgb_to_tk $rgb]]
    lappend bar_colors [rgb_to_tk [brighten $rgb 50]]
    lappend bar_colors [rgb_to_tk [brighten $rgb 75]]
    lappend bar_colors [rgb_to_tk [brighten $rgb 85]]
    lappend bar_colors [rgb_to_tk [brighten $rgb 75]]
    lappend bar_colors [rgb_to_tk [brighten $rgb 65]]
    lappend bar_colors [rgb_to_tk [brighten $rgb 55]]
    lappend bar_colors [rgb_to_tk [brighten $rgb 35]]
    lappend bar_colors [rgb_to_tk [brighten $rgb 15]]
    lappend bar_colors [rgb_to_tk $rgb]
    set bw [expr $width / 10]
    for {set i 0; set x [dict get $vb left]} {$i < 10} {incr i; incr x $bw} {
        set br [expr $x + $bw]
        dict set vb items bar$i [$canvas_name create rectangle $x $vy $br [dict get $vb bottom] \
            -fill [lindex $bar_colors $i] -outline {} ]
    }
    dict set vb items face [$canvas_name create oval [dict get $vb left] [expr $vy - 10] \
        [dict get $vb right] [expr $vy + 10] -fill [rgb_to_tk $rgb] -outline black]   
}

# proc valuebar'draw {vbname} {
    # upvar $vbname vb
    # set vy [expr [dict get $vb bottom] - ([dict get $vb value] * [dict get $vb height] / 1000)]
    # set cnv [dict get $vb canvas]
    # dict for {name item} [dict get $vb items] {
        # $cnv delete $item
    # }
    # dict set vb items [dict create]
    # dict set vb items bar [$cnv create rectangle [dict get $vb left] $vy \
        # [dict get $vb right] [dict get $vb bottom] -fill [dict get $vb color] -outline {} ]
    # dict set vb items outline [$cnv create rectangle [dict get $vb left] [dict get $vb top] \
        # [dict get $vb right] [dict get $vb bottom] -fill {} -outline black]
# }

proc valuebar'set {vbname value} {
    upvar $vbname vb
    dict set vb value $value
    
}

#console show  
wm withdraw .
set w .ttkprogress
toplevel $w
wm title $w "Temperature"
wm iconname $w "Temperature"
wm geometry $w ${window_width}x${window_height}+0+0
#bind $w <<Unmap>> {puts unmap}
#bind $w <<Destroy>> {puts destroy}
#bind $w <<Deactivate>> {puts deact}

ttk::button $w.quit -text "Quit" -command exit
pack $w.quit

ttk::progressbar $w.p1 -mode determinate -maximum 1000
pack $w.p1
$w.p1 configure -value [degf_to_thou 200]

set diagram [image create photo -file [file join $app_path ../images/drivetrain1.gif]]

set cnv $w.cnv
canvas $cnv
$cnv create image 0 0 -anchor nw -image $diagram
pack $cnv -expand true -fill both

#ttk::progressbar $w.temp_fl -mode determinate -maximum 1000
#scale $w.temp_fl
#itk::feedback $w.temp_fl
#$cnv create window 16 210 -window $w.temp_fl -anchor nw -height 150 -width 50
valuebar'new temp_fl $cnv 16 210 50 150 {0xff 0 0}
#valuebar'draw temp_fl
#$w.temp_fl configure -value [degf_to_thou 200]
#$w.temp_fl set [degf_to_thou 200]
