
    nonstackable  $fletcher_sum1_reg  $fletcher_sum2_reg

func fletcher16_init
    $fletcher_sum1_reg = 0
    $fletcher_sum2_reg = 0
    rtn
    
// compute the modulus(255) of a number given in a.  return remainder in a.
func mod255
    // while a is greater than 254, subtract 255.
    :mod255_again
    b = 0xfe
    br gt :mod255_greater
    rtn
    :mod255_greater
    b = 0xff01
    a = a+b
    jmp :mod255_again
    rtn

// accumulate a Fletcher16 checksum, given the next byte of data in a.    
func fletcher16_input8
    b = $fletcher_sum1_reg
    a = a+b
    call :mod255
    $fletcher_sum1_reg = a
    
    b = $fletcher_sum2_reg
    a = a+b
    call :mod255
    $fletcher_sum2_reg = a
    rtn

// accumulate a Fletcher16 checksum, given the next word of data in a.    
func fletcher16_input16
    i = a>>4
    b = 0xff
    a = and
    call :fletcher16_input8
    a = i
    a = a>>4
    call :fletcher16_input8
    rtn

// return the combined 16-bit result of Fletcher16 checksum in a.    
func fletcher16_result
    a = $fletcher_sum2_reg
    a = a<<4
    a = a<<4
    b = $fletcher_sum1_reg
    a = or
    rtn
    
    stackable  $fletcher_sum1_reg  $fletcher_sum2_reg
