
// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.

<< 
    proc putchar {lin reg} {
        putchar_$::asm::console_driver $lin $reg
    }

    proc getchar {lin} {
        getchar_$::asm::console_driver $lin 
        # automatic echo
        push \" a
        putchar \" a
        pop \" a
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
        nop \"
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
    nop
    a = and
    a = a>>4
    a = a>>4
    a = a>>4
    call fetch_byte
    putchar a
    
    a = g6
    b = 0x0F00
    nop
    a = and
    a = a>>4
    a = a>>4
    call fetch_byte
    putchar a
    
    a = g6
    b = 0x00F0
    nop
    a = and
    a = a>>4
    call fetch_byte
    putchar a
    
    a = g6
    b = 0x000F
    nop
    a = and
    call fetch_byte
    putchar a
    
    rtn
    
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
    nop
    j = or
    x = -1
    nop
    y = x+y
    bn 2z :again
    a = j    
    b = 0
    rtn
    :fail
    b = -1
    rtn
