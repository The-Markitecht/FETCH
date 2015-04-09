
// driver library for synapse316_uart simple async transceiver.

setvar console_driver fduart

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
    proc putchar_fduart {lin reg} {
        parse3 a = $reg "a = $reg // $lin"
        call $lin putchar_fduart
    }

    proc getchar_fduart {lin} {
        call $lin getchar_fduart
    }
    
    proc pollchar_fduart {lin} {
        call $lin pollchar_fduart
    }
    
    proc puteol_fduart {lin} {
        asc $lin a = "\r"
        putchar $lin a
        asc $lin a = "\n"
        putchar $lin a
    }    
>>

// routine sends out the low byte from a to the UART.  blocks until the FIFO accepts the byte.
func putchar_fduart

    x = a

    // wait for FIFO to be available.
    a = $atx_fifo_full_mask
    :pcfduart_wait_for_idle
    b = fduart_status
    bn and0z :pcfduart_wait_for_idle
    
    // push word to the UART.  its low byte is a character.
    fduart_data = x
end_func
    
// routine receives a byte from the UART.  blocks until the UART receives the byte.  
// returns it in the low byte of a.
func getchar_fduart
    // wait until FIFO is populated.
    a = $arx_fifo_empty_mask
    :wait_for_busy    
    b = fduart_status
    bn and0z :wait_for_busy
    a = fduart_data
end_func

// returns a character in a, or -1 if none.
func pollchar_fduart
    // check for FIFO is populated.
    a = $arx_fifo_empty_mask
    b = fduart_status
    bn and0z :none
    a = fduart_data
    rtn
    :none
    a = -1
end_func

    