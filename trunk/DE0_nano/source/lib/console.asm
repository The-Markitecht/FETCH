
// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.

<< 
    proc putchar {lin reg} {
        putchar_$::asm::console_driver $lin $reg
    }

    proc getchar {lin} {
        getchar_$::asm::console_driver $lin 
    }

    proc putasc {lin char} {
        # output a literal character.
        if {[scan $char %c c] != 1} {
            error "invalid character specification: $lin"
        }
        parse3 a = $c "a = $c // $lin"
        putchar $lin a
    }

    proc get16 {lin reg} {
        # block until a 16-bit word is received (little-endian) on the UART and memorized in the given register.
        getchar $lin
        push \" a
        getchar \"
        parse3 a = a<<4 \"
        parse3 a = a<<4 \"
        pop \" b
        nop \"
        parse3 $reg = or \"
    }
>>

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

    :hexdigits
    "0123456789abcdef"

