    
// pick a byte from an array of words.  fetch & return it in a.
// pass array base address in x, byte offset in a.
func fetch_byte
    b = 1
    nop
    br and0z :pick_byte_even
    a = a>>1
    b = x
    nop
    fetch a from a+b
    a = a>>4
    a = a>>4
    rtn
    :pick_byte_even    
    a = a>>1
    b = x
    nop
    fetch a from a+b
    b = 0xff
    nop
    a = and
    rtn
        