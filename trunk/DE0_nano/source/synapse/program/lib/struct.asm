<<
proc struct_read {lin  base_addr} {
    # pass offset (in WORDS) in a.
    # returns data value in b.
    # base_addr (in BYTES) must be known at compile time.
    # data must be word-aligned.
    # structure must not cross a 64k boundary.
    
    lassign [split $base_addr {'}] hi lo
    parse "
        a = a<<1
        b = $lo
        av_ad_hi = $hi
        av_ad_lo = ad0
        b = av_write_data
        b = av_read_data
    "
}

proc struct_write {lin  base_addr} {
    # pass offset (in WORDS) in a.  
    # pass data value in b.
    # base_addr (in BYTES) must be known at compile time.
    # data must be word-aligned.
    # structure must not cross a 64k boundary.

    lassign [split $base_addr {'}] hi lo
    parse "
        a = a<<1
        push b
        b = $lo
        av_ad_hi = $hi
        av_ad_lo = ad0
        pop av_write_data
    "
}
>>