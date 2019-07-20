    
// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
func fetch_byte
    b = 1
    br and0z :pick_byte_even
    a = a>>1
    b = x
    fetch a from a+b
    a = a>>4
    a = a>>4
    rtn
    :pick_byte_even    
    a = a>>1
    b = x
    fetch a from a+b
    b = 0xff
    a = and
end_func

// find a byte in an array of packed words in program space. 
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
func find_in_fetch
    y = a
    j = -1
    :again
    br iz :fail
    i = ad1
    a = i
    call :fetch_byte
    b = y
    bn eq :again
    :found
    a = i
    rtn
    :fail
    a = -1
end_func    
