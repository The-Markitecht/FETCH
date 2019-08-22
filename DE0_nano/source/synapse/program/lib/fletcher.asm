
nonstackable  $fletcher_sum1_reg  $fletcher_sum2_reg

func fletcher16_init {
    $fletcher_sum1_reg = 0
    $fletcher_sum2_reg = 0
}
    
// return the modulus(255) of a given number.
func mod255 {data in a} {modulus out a} {
    // while a is greater than 254, subtract 255.
    :mod255_again
    b = 0xfe
    br gt :mod255_greater
    rtn
    :mod255_greater
    b = ([negate 0xff])
    a = a+b
    jmp :mod255_again
}

// accumulate a Fletcher16 checksum, given the next byte of data.    
func fletcher16_input8 {data in a} {
    //TODO: debug only.
    //x = a
    //putasc " "
    //a = x
    //call put4x
    //a = x

    b = $fletcher_sum1_reg
    callx mod255  a+b  $fletcher_sum1_reg

    a = $fletcher_sum1_reg
    b = $fletcher_sum2_reg
    callx mod255  a+b  $fletcher_sum2_reg

    //TODO: debug only.
    //putasc " "
    //a =  $fletcher_sum2_reg
    //call put4x
    //putasc " "
    //a =  $fletcher_sum1_reg
    //call put4x
    //puteol
}

// accumulate a Fletcher16 checksum, given the next word of data.    
func fletcher16_input16 {data in a} {
    i = a>>4
    b = 0xff
    callx fletcher16_input8  and
    a = i
    callx fletcher16_input8  a>>4
}

// return the combined 16-bit result of Fletcher16 checksum.    
func fletcher16_result {result out a} {
    a = $fletcher_sum2_reg
    a = a<<4
    a = a<<4
    b = $fletcher_sum1_reg
    rtn  or
}
    
stackable  $fletcher_sum1_reg  $fletcher_sum2_reg
