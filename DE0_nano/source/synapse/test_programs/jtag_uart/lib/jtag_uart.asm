// FETCH
// Copyright 2009 Mark Hubbard, a.k.a. "TheMarkitecht"
// http://www.TheMarkitecht.com
//
// Project home:  http://github.com/The-Markitecht/FETCH
// FETCH is the Fluent Engine and Transmission Controller Hardware for sports cars.
//
// This file is part of FETCH.
//
// FETCH is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// FETCH is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with FETCH.  If not, see <https://www.gnu.org/licenses/>.



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
