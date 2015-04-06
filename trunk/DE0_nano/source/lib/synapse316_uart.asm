
// driver library for synapse316_uart simple async transceiver.

setvar console_driver suart

vdefine atx_fifo_empty_bit      0
vdefine atx_fifo_full_bit       1
vdefine atx_busy_bit            2
vdefine arx_fifo_empty_bit      3
vdefine arx_fifo_full_bit       4
vdefine arx_busy_bit            5

vdefine atx_fifo_empty_mask      (1 << $atx_fifo_empty_bit )
vdefine atx_fifo_full_mask       (1 << $atx_fifo_full_bit  )
vdefine atx_busy_mask            (1 << $atx_busy_bit       )
vdefine arx_fifo_empty_mask      (1 << $arx_fifo_empty_bit )
vdefine arx_fifo_full_mask       (1 << $arx_fifo_full_bit  )
vdefine arx_busy_mask            (1 << $arx_busy_bit       )


<< 
    proc putchar_suart {lin reg} {
        parse3 a = $reg "a = $reg // $lin"
        call $lin putchar_atx
    }

    proc getchar_suart {lin} {
        call $lin getchar_atx
    }
    
    proc pollchar_suart {lin} {
        call $lin pollchar_atx
    }
    
    proc puteol_suart {lin} {
        asc $lin a = "\r"
        putchar $lin a
        asc $lin a = "\n"
        putchar $lin a
    }    
>>

// routine sends out the low byte from a to the UART.  blocks until the FIFO accepts the byte.
func putchar_suart

    x = a

    // wait for FIFO to be available.
    a = $atx_fifo_full_mask
    :pcsuart_wait_for_idle
    b = atx_ctrl
    bn and0z :pcsuart_wait_for_idle
    
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
    rtn
    
// routine receives a byte from the UART.  blocks until the UART receives the byte.  
// returns it in the low byte of a.
func getchar_suart
    // wait until UART is busy, then idle.
    a = $arx_busy_mask
    :wait_for_busy    
    b = atx_ctrl
    br and0z :wait_for_busy
    :wait_for_idle
    b = atx_ctrl
    bn and0z :wait_for_idle
    a = atx_data
    rtn

// returns a character in a, or -1 if none.
// this version can miss characters if not polled while the character is arriving.
func pollchar_suart
    // check for UART is busy, then idle.
    a = $arx_busy_mask
    b = atx_ctrl
    br and0z :none
    :wait_for_idle
    b = atx_ctrl
    bn and0z :wait_for_idle
    a = atx_data
    rtn
    :none
    a = -1
    rtn

    