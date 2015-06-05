
// function library for simple integer math.

func multiply
    // 16-bit multiplication.  a = a * b.

    x = a
    y = b
    i = 0
    :again
    br xz :done
        a = x
        b = 1
        br and0z :skip_add
            j = y
            i = i+j
        :skip_add
        a = x
        x = a>>1
        a = y
        y = a<<1
    jmp :again
    :done
    a = i
end_func

func divide
    // 16-bit division.  b = a / b.  return remainder in a.
    // division by zero results in zero.

    // degenerate cases.
    br lt :zero
    br az :zero
    x = a
    a = b
    br az :zero
    // now operands are x / a.
    
    // shift "temp" divisor g6 left until it exceeds dividend, then right 1.
    b = x
    i = 0
    j = 1
    :shift_again
    br gt :shift_done
        a = a<<1
        i = ad1
    jmp :shift_again
    :shift_done
    g6 = a>>1
    // now operands are x / g6.
    // notice i was not decremented here, so it has 1 more in it than the number of shifts required for digit parity.
    // that's exactly what it needs for correctness.

    // long division.  g7 = quotient.
    g7 = 0
    j = -1
    :again
    br iz :done
        a = g6
        b = x
        br gt :result0
            // temp does fit; output a 1.
            a = g7
            a = a<<1
            b = 1
            g7 = or
            // dividend = dividend - temp
            a = g6
            b = -1
            a = xor
            b = 1
            y = a+b
            x = x+y            
        :result0
            // temp does not fit; output a 0.
            a = g7
            g7 = a<<1
            // no change to dividend.
        :next
        a = g6
        g6 = a>>1
        i = i+j
    jmp :again    
    
    :done
    b = g7
    a = x
    rtn
    
    :zero
    b = 0
    rtn    
end_func

func testmath
    x = a
    y = b
    putasc " "
    a = x
    call :put4x
    putasc ","
    a = y
    call :put4x
    putasc "="
    a = x
    b = y
    call :multiply
    call :put4x
    putasc "r"
    a = x
    b = y
    call :divide
    i = b
    call :put4x
    putasc "q"
    a = i
    call :put4x
end_func
<<
proc testmath {lin a b} {
    parse3 a = $a ""
    parse3 b = $b ""
    call $lin :testmath
}
>>