<< 

source maf_interpolate.tcl

set ::asm::drom_vars [dict create] 
set ::asm::drom_src_fn $::src_fn

proc drom_define  {lin  name  type  size_bytes} {
    # counter must increment after memorizing, because the size may vary from one call to the next.
    set short [string range $name 4 end]
    
    # track position in shadow RAM area.
    setvar $lin $name $::asm::drom_shadow_counter
    dict set ::debugger_ram_names [ram_join $::asm::drom_shadow_counter] $name
    ram_incr ::asm::drom_shadow_counter $size_bytes
    
    # track position in data ROM device.
    dict set ::asm::drom_addresses $short $::asm::drom_counter
    ram_incr ::asm::drom_counter $size_bytes
    dict set ::asm::drom_type $short $type
    dict set ::asm::drom_len $short $size_bytes
    lappend ::asm::drom_order $short
} 

proc drom_emit_list {mif  cnt  ls} {
    upvar $cnt addr
    foreach item $ls {
        puts $mif "    [format %04x $addr] : [format %04x $item]"
        incr addr 2
    }
}

proc drom_emit_list_list {mif  cnt  ls} {
    upvar $cnt addr
    foreach row $ls {
        drom_emit_list $mif addr $row
    }
}

proc drom_emit_array {mif  cnt  ls} {
    upvar $cnt addr
    drom_emit_list $mif addr $ls
}

proc linear_interp {a b portion_num portion_den} {
    return [expr {int(($b - $a) * double($portion_num) / double($portion_den) + $a)}]
}

proc write_drom_files {} {
    if {$::asm_pass != $::pass(emit)} return
    
    # read map file
    set mapfn [file normalize [file join [file dirname $::src_fn] .. .. .. .. PC_TCL mapper maps default.map]]
    set map [open $mapfn r]
    array set content [read $map]
    close $map
    
    # interpolate larger maf_ref from the low-res one in the map file.
    set content(maf_ref) [get_hi_res_maf_ref $content(maf_ref) $::asm::maf_ref_num_cells]

    # write mif file
    set len [ram_join $::asm::drom_counter]
    set miffn [file join [file dirname $::src_fn] data_rom.mif]
    set mif [open_mif $miffn $len]
    set mifcnt 0
    foreach var $::asm::drom_order {
        set assigned [ram_join [dict get $::asm::drom_addresses $var]]
        if {$mifcnt != $assigned} {
            error "Data rom field $var should be at address $assigned but is at $mifcnt instead."
        }
        puts $mif "-- $var"
        drom_emit_[dict get $::asm::drom_type $var]  $mif  mifcnt  $content($var)
        set declared_bytes [dict get $::asm::drom_len $var]
        set actual_bytes [expr {$mifcnt - $assigned}]
        if {$actual_bytes != $declared_bytes} {
            error "Data rom field $var should be $declared_bytes bytes long but is $actual_bytes instead."
        }
    }
    close_mif $mif
    if {$mifcnt != $len} {
        error "Data rom MIF should be $len words but is $mifcnt instead."
    }
}
>>

setvar     drom_shadow_base         ($sdram_size / 2 + $sdram_base)
setvar     drom_shadow_counter      [ram_split $drom_shadow_base]
setvar     drom_counter             0'0

setvar          afrc_maf_rows       64
setvar          afrc_rpm_cols       16
drom_define     ram_afrc_map        list_list       ($afrc_maf_rows * $afrc_rpm_cols * 2)

// the higher-res MAF ref is used to recover absolute flow.
// so it has more cells than afrc_maf_rows.
setvar          maf_ref_num_cells   256
drom_define     ram_maf_ref         list            ($maf_ref_num_cells * 2)

setvar          rpm_ref_num_cells   $afrc_rpm_cols
drom_define     ram_rpm_ref         list            ($rpm_ref_num_cells * 2)

setvar          block_temp_num_cells    64
drom_define     ram_block_temp_ref      array       ($block_temp_num_cells * 2)
drom_define     ram_block_temp_map      array       ($block_temp_num_cells * 2)

setvar          afterstart_num_cells    10
drom_define     ram_afterstart_ref      array       ($afterstart_num_cells * 2)
drom_define     ram_afterstart_map      array       ($afterstart_num_cells * 2)

setvar     drom_shadow_len_bytes    ([ram_join $drom_shadow_counter] - $drom_shadow_base)
<< if {$drom_shadow_len_bytes > 65536} {error "Data ROM too long."} >>


func init_drom {
    // copy entire ROM content to a shadow area in RAM.
    av_ad_hi = ($drom_shadow_base >> 16)
    for {i = 0} {i lt $drom_shadow_len_bytes} step j = 1 {
        drom_ad = i
        av_ad_lo = i
        av_write_data = drom_data
    }
}

func load_afrc_cmd {
    // loads 1 row only.
    
    callx fletcher16_init
    // expect valid row index.
    call  get4x
    y = a
    callx fletcher16_input16  a
    if y lt $afrc_maf_rows {
        // set RAM address to start of given row.  call struct_read for its side effect on Avalon address regs.
        a = y
        b = $afrc_rpm_cols
        nop
        nop
        nop
        nop
        b = product_lo
        struct_read $ram_afrc_map
        
        // expect each cell value back-to-back.
        for {i = 0} {i lt $afrc_rpm_cols} step j = 1 {
            call  get4x
            av_write_data = a
            callx fletcher16_input16  a
            a = av_ad_lo
            b = 2
            av_ad_lo = a+b
        }
    }
    
    // reply with checksum
    callx fletcher16_result a
    call put4x
    puteol
}

func load_row_cmd {num_words in pa} {
    // loads 1 row of data having the given number of words.
    // start of row address must be already loaded into av_ad_hi and av_ad_lo.
    
    callx fletcher16_init

    // expect each cell value back-to-back.
    for {i = 0} {i lt num_words} step j = 1 {
        call  get4x
        av_write_data = a
        callx fletcher16_input16  a
        a = av_ad_lo
        b = 2
        av_ad_lo = a+b
    }
    
    // reply with checksum
    callx fletcher16_result a
    call put4x
    puteol
}

func load_rpm_ref_cmd {
    a = 0
    struct_read $ram_rpm_ref
    callx load_row_cmd $rpm_ref_num_cells
}

func load_maf_ref_cmd {
    a = 0
    struct_read $ram_maf_ref
    callx load_row_cmd $maf_ref_num_cells
}

func load_block_temp_ref_cmd {
    a = 0
    struct_read $ram_block_temp_ref
    callx load_row_cmd $block_temp_num_cells
}

func load_block_temp_map_cmd {
    a = 0
    struct_read $ram_block_temp_map
    callx load_row_cmd $block_temp_num_cells
}

func load_afterstart_ref_cmd {
    a = 0
    struct_read $ram_afterstart_ref
    callx load_row_cmd $afterstart_num_cells
}

func load_afterstart_map_cmd {
    a = 0
    struct_read $ram_afterstart_map
    callx load_row_cmd $afterstart_num_cells
}

<< write_drom_files >>
