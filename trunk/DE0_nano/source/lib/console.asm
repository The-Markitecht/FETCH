
// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.

<< 
    proc putchar {lin reg} {
        putchar_$::asm::console_driver $lin $reg
    }

    proc getchar {lin} {
        getchar_$::asm::console_driver $lin 
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

// pass data byte in a,
// string fetch address in x,
// string length in i.
// returns found index in a (or -1 if not found).
// returns found address in b (or -1 if not found).
func find_in_fetch
    g6 = i
    y = 1
    :again
    j = -1
    nop
    i = i+j
    fetch b from x
    nop
    br eq :found
    j = 0
    nop
    br 1z :end
    x = x+y
    jmp :again
    :end
    a = -1
    b = -1
    rtn
    :found
    a = i
    b = -1
    nop
    a = xor
    b = g6
    nop
    a = a+b
    b = x
    rtn
    
// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.
func get4x
    getchar
    x = :hexdigits
    i = 16
    call :find_in_fetch
    b = -1
    br eq :fail
patch
    rtn
    :fail
    rtn
