    
// pick a byte from an array of packed words in program space.  fetch & return it in a.
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

// find a byte in an array of packed words in program space. 
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
func find_in_fetch
    y = a
    j = 0
    nop
    br 1z :fail
    j = -1
    nop
    :again
    i = i+j
    a = i
    call :fetch_byte
    b = y
    nop
    bn eq :again
    :found
    a = i
    rtn
    :fail
    a = -1
    rtn
    
