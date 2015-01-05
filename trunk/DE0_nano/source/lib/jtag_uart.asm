
// driver library for JTAG UART accessed by my hardware-assisted Avalon MM master.

setvar console_driver jtag

<<
    proc putchar_jtag {lin reg} {
        parse3 av_ad_hi = $::asm::jtag_uart_data_lsw_hi $lin
        parse3 av_ad_lo = $::asm::jtag_uart_data_lsw_lo \"
        parse3 av_write_data = $reg \"
    }

    proc getchar_jtag {lin} {
        # not yet supported.
    }
>>

