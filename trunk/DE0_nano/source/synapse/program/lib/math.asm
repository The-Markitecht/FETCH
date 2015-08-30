
// function library for simple integer math.

func multiply
    // unsigned 16-bit multiplication.  a = a * b.
    // it's easy to roll over the 16-bit result by passing operands whose bit widths total more than 16.
    // bigger/safer/faster math can be obtained from Altera IP blocks.

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
    // unsigned 15-bit division.  b = a / b.  return remainder in a.
    // division by zero results in zero.
    // THE HIGH BIT OF A MUST BE 0!!  ALSO THE HIGH BIT OF B MUST BE 0!!
    // 1 in the high bit of either operand results in infinite loop or wrong results.
    // bigger/safer/faster math can be obtained from Altera IP blocks.
    
    // degenerate cases.
    br lt :zero
    br az :zero
    x = a
//    g7 = x
    a = b
    br az :zero
    // now operands are x / a.  also another copy of x in g7.
    
    // // test for special case where high bit of dividend is 1.
    // y = 0
    // i = a
    // a = x
    // b = 0x8000
    // br and0z :msb_zero
        // y = 1
        // x = a>>1
    // :msb_zero
    // a = i
    // // when msb was 1, then y = 1 and dividend x is shifted right 1.
        
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
    // now operands are x / g6.  i = number of passes of long division required.
    // notice i was not decremented here, so it has 1 more in it than the number of shifts required for digit parity.
    // that's exactly what it needs for correctness.

    // // compensate for special case where msb was 1.  then 1 more division pass is needed.
    // j = y
    // i = i+j
    // x = g7
    
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
            jmp :next
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

<<
proc testmath {lin a b} {
    parse3 a = $a ""
    parse3 b = $b ""
    call $lin :testmath
}

set math_test_code {
    // testmath 0 0 
    // testmath 0 1 
    // testmath 1 0 
    // testmath 1 1 
    // testmath 1 2 
    // testmath 2 0 
    // testmath 2 1 
    // testmath 2 2 
    // testmath 2 3 
    // testmath 2 4 
    // testmath 3 2 
    // testmath 4 2 
    // testmath 7 9 
    // testmath 200 200
    // testmath 7 1
    // testmath 10 5
    // testmath 100 5
    // testmath 99 100
    // testmath 65000 7000
    // testmath 65000 65000
    // testmath 43805 1
        
    // i = dividend
    i = 0x7ffd
    j = 1
    :next_dividend        
        a = i
        call :put4x
        putasc " "    
    
        // x = divisor
        x = i
        y = -1
        :next_divisor
        
            // run division.
            a = i
            b = x
            call :divide
            g7 = b
            g6 = a
            // g7 = b = quotient.  g6 = remainder.
            
            // use multiplication to verify result.
            a = x
            call :multiply
            b = g6
            a = a+b
            b = i
            br eq :math_ok
                // report error numbers
                a = i
                b = x
                call :testmath
                error_halt
            :math_ok
            
            x = x+y
        bn xz :next_divisor
        i = i+j
    bn iz :next_dividend
    
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
    puteol
end_func
    
}
>>