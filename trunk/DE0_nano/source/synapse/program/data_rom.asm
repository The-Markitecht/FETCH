<< proc drom_define  {lin  name  size_bytes} {
    # counter must increment after memorizing, because the size may vary from one call to the next.
    setvar $lin $name $::asm::drom_shadow_counter
    ram_incr ::asm::drom_shadow_counter $size_bytes
} >>

setvar     drom_shadow_base         ($sdram_size / 2 + $sdram_base)
setvar     drom_shadow_counter      [ram_split $drom_shadow_base]

setvar          afrc_maf_rows       64
setvar          afrc_rpm_cols       16
drom_define     ram_afrc_map        ($afrc_maf_rows * $afrc_rpm_cols * 2)

setvar          maf_ref_num_cells   256
drom_define     ram_maf_ref         ($maf_ref_num_cells * 2)

setvar          rpm_ref_num_cells   $afrc_rpm_cols
drom_define     ram_rpm_ref         ($rpm_ref_num_cells * 2)

setvar          block_temp_num_cells    64
drom_define     ram_block_temp_scale    ($block_temp_num_cells * 2)
drom_define     ram_block_temp_map      ($block_temp_num_cells * 2)

setvar          afterstart_num_cells    10
drom_define     ram_afterstart_ref      ($afterstart_num_cells * 2)
drom_define     ram_afterstart_map      ($afterstart_num_cells * 2)

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
    b = 0
    struct_read $ram_rpm_ref
    callx load_row_cmd $rpm_ref_num_cells
}

func load_maf_ref_cmd {
    b = 0
    struct_read $ram_maf_ref
    callx load_row_cmd $maf_ref_num_cells
}

func load_block_temp_scale_cmd {
    b = 0
    struct_read $ram_block_temp_scale
    callx load_row_cmd $block_temp_num_cells
}

func load_block_temp_map_cmd {
    b = 0
    struct_read $ram_block_temp_map
    callx load_row_cmd $block_temp_num_cells
}

func load_afterstart_ref_cmd {
    b = 0
    struct_read $ram_afterstart_ref
    callx load_row_cmd $afterstart_num_cells
}

func load_afterstart_map_cmd {
    b = 0
    struct_read $ram_afterstart_map
    callx load_row_cmd $afterstart_num_cells
}

