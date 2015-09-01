
// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.

<< 
    proc putchar {lin reg} {
        putchar_$::asm::console_driver $lin $reg
    }

    proc getchar {lin} {
        getchar_$::asm::console_driver $lin 
    }

    proc pollchar {lin} {
        pollchar_$::asm::console_driver $lin 
    }

    proc asc {lin reg eq char} {
        # assign ASCII value of a literal character.
        if {[scan $char %c c] != 1} {
            error "invalid character specification: $lin"
        }
        parse3 $reg $eq $c "$reg $eq $c // $lin"
    }

    proc putasc {lin char} {
        # output a literal character.
        asc $lin a = $char
        putchar $lin a
    }

    proc puteol {lin} {
        # output an end-of-line character sequence.
        puteol_$::asm::console_driver $lin 
    }

    proc get16 {lin reg} {
        # block until a 16-bit word is received (little-endian) on the UART and memorized in the given register.
        getchar_$::asm::console_driver $lin 
        push \" a
        getchar_$::asm::console_driver \"
        parse3 a = a<<4 \"
        parse3 a = a<<4 \"
        pop \" b
        parse3 $reg = or \"
    }    
>>

    :hexdigits
    "0123456789abcdef"

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
func put4x
    x = :hexdigits
    
    g6 = a
    b = 0xF000
    a = and
    a = a>>4
    a = a>>4
    a = a>>4
    call fetch_byte
    putchar a
    
    a = g6
    b = 0x0F00
    a = and
    a = a>>4
    a = a>>4
    call fetch_byte
    putchar a
    
    a = g6
    b = 0x00F0
    a = and
    a = a>>4
    call fetch_byte
    putchar a
    
    a = g6
    b = 0x000F
    a = and
    call fetch_byte
    putchar a
    
end_func
    
// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
func get4x
    // y = digit counter
    // j = sum
    y = 4
    :again
    getchar
    x = :hexdigits
    i = 16
    call :find_in_fetch
    b = -1
    br eq :fail
    b = a
    a = j
    a = a<<4
    j = or
    x = -1
    y = x+y
    a = y
    bn az :again
    a = j    
    b = 0
    rtn
    :fail
    b = -1
end_func

// print a fixed-length string from packed words in program space.
// pass its word address (not its byte address) in a,  its length (bytes) in b.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
func print_fixed
    i = a
    j = 1
    x = b
    y = -1
    :next_word
        br xz :done
        x = ad2
        fetch g6 from i
        // now x = bytes remaining, i = current word address, g6 = data word.
        putchar g6
        br xz :done
        x = ad2
        a = g6
        a = a>>4
        a = a>>4
        putchar a
        i = i+j
        jmp :next_word
    :done
end_func

// print a null-terminated string from packed words in program space.
// pass its word address (not its byte address) in a.  
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
func print_nt
    i = a
    j = 1
    :next_word
        fetch x from i
        // now i = current word address, x = data word, b = low byte mask, a = data byte.
        a = x
        b = 0xff
        br and0z :done
        putchar a
        a = x
        a = a>>4
        a = a>>4
        b = 0xff
        br and0z :done
        putchar a
        i = i+j
        jmp :next_word
    :done
end_func
