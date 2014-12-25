        
// compute the modulus(255) of a number given in a.  return remainder in a.
func mod255
    // while a is greater than 254, subtract 255.
    :mod255_again
    b = 0xfe
    nop
    br gt :mod255_greater
    return
    :mod255_greater
    b = 0xff01
    nop
    a = a+b
    jmp :mod255_again

// set up Fletcher16 checksum algorithm to accumulate in the 2 given register names.
<< proc ::asm_fletcher16_init {lin sum1_reg sum2_reg} {
    set ::asm::fletcher_sum1_reg $sum1_reg
    set ::asm::fletcher_sum2_reg $sum2_reg
    parse3 $::asm::fletcher_sum1_reg = 0 $lin
    parse3 $::asm::fletcher_sum2_reg = 0 \"
} >>

    fletcher16_init g6 g7
    
// accumulate a Fletcher16 checksum in g6 and g7, 
// given the next byte of data in a.    
func fletcher16_input
//patch: need a way to declare summing registers as "static" or "preserve" so they're not auto-stacked.
    b = $fletcher_sum1_reg
    nop
    a = a+b
    call :mod255
    $fletcher_sum1_reg = a
    
    b = $fletcher_sum2_reg
    nop
    a = a+b
    call :mod255
    $fletcher_sum2_reg = a
    return

// return the combined 16-bit result of Fletcher16 checksum in a.    
func fletcher16_result
    a = $fletcher_sum2_reg
    a = a<<4
    a = a<<4
    b = $fletcher_sum1_reg
    nop
    a = or
    return
    
