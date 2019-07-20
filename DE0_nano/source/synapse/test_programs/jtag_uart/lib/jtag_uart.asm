
// driver library for JTAG UART accessed by my hardware-assisted Avalon MM master.

setvar console_driver jtag

<<
    proc putchar_jtag {lin reg} {
        parse3 b = $reg $lin
        call \" :putchar_jtag_func
    }

    proc getchar_jtag {lin} {
        call $lin :getchar_jtag_func
    }
    
    proc pollchar_jtag {lin} {
        call $lin :pollchar_jtag_func
    }
    
    proc puteol_jtag {lin} {
        asc $lin a = "\n"
        putchar $lin a
    }
    
>>

func putchar_jtag_func
    av_ad_hi = $jtag_uart_ctrl_msw_hi 
    av_ad_lo = $jtag_uart_ctrl_msw_lo 
    :poll_fifo
    a = av_write_data
    a = av_read_data
    br az :poll_fifo
    //av_ad_hi = $jtag_uart_data_lsw_hi 
    av_ad_lo = $jtag_uart_data_lsw_lo 
    av_write_data = b
end_func

func getchar_jtag_func
    b = 0x8000
    av_ad_hi = $::asm::jtag_uart_data_lsw_hi
    av_ad_lo = $::asm::jtag_uart_data_lsw_lo
    :poll
    a = av_write_data
    a = av_read_data
    br and0z :poll
    b = 0xff
    a = and
end_func

// returns a character in a, or -1 if none.
func pollchar_jtag_func
    b = 0x8000
    av_ad_hi = $::asm::jtag_uart_data_lsw_hi
    av_ad_lo = $::asm::jtag_uart_data_lsw_lo
    a = av_write_data
    a = av_read_data
    bn and0z :gotchar
    b = 0xff
    a = and
    rtn
    :gotchar
    a = -1
end_func
