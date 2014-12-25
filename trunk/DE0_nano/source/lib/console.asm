
<< source console.tcl >>

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
    
    return

    :hexdigits
    "0123456789abcdef"

// routine sends out the low byte from a to the UART.  blocks until the UART accepts the byte.
func putchar_atx

    x = a

    // wait for UART to be idle (not busy).
    a = $atx_busy_mask
    :pcatx_wait_for_idle
    b = atx_ctrl
    nop
    bn and0z :pcatx_wait_for_idle
    
    // push word to the UART.  its low byte is a character.
    atx_data = x
        
    // can't use the actual register load strobe that occurs here, because it's 
    // much too fast for the UART to sample.
    // instead use a dedicated output word atx_ctrl.
    atx_ctrl = $atx_load_mask
    
    // wait until UART is busy, as acknowledgement.
    a = $atx_busy_mask
    :pcatx_wait_for_busy    
    b = atx_ctrl
    br and0z :pcatx_wait_for_busy

    atx_ctrl = 0 
    return
    
// routine receives a byte from the UART.  blocks until the UART receives the byte.  
// returns it in the low byte of a.
func getchar_atx
    // wait until UART is busy, then idle.
    a = $arx_busy_mask
    :wait_for_busy    
    b = atx_ctrl
    br and0z :wait_for_busy
    :wait_for_idle
    b = atx_ctrl
    nop
    bn and0z :wait_for_idle
    a = atx_data
    return
