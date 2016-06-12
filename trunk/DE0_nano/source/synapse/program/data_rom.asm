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

setvar          maf_map_num_cells   256
drom_define     ram_maf_map         ($maf_map_num_cells * 2)

setvar          rpm_map_num_cells   $afrc_rpm_cols
drom_define     ram_rpm_map         ($rpm_map_num_cells * 2)

setvar          block_temp_num_cells    64
drom_define     ram_block_temp_scale    ($block_temp_num_cells * 2)
drom_define     ram_block_temp_map      ($block_temp_num_cells * 2)

setvar     drom_shadow_len_bytes    ([ram_join $drom_shadow_counter] - $drom_shadow_base)
<< if {$drom_shadow_len_bytes > 65536} {error "Data ROM too long."} >>


func init_data_rom {
    // copy entire ROM content to a shadow area in RAM.
    av_ad_hi = ($drom_shadow_base >> 16)
    for {i = 0} {i lt $drom_shadow_len_bytes} step j = 1 {
        data_rom_ad = i
        av_ad_lo = i
        av_write_data = data_rom_data
    }
}
