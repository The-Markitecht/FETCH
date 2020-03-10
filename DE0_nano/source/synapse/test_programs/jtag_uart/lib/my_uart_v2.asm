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



// driver library for my_uart_v2 simple async transceiver.

setvar console_driver atx

vdefine atx_load_mask           0x0001
vdefine atx_busy_mask           0x0002
vdefine arx_busy_mask           0x0004

<<
    proc putchar_atx {lin reg} {
        # for my own uart_v2_tx hardware.
        parse3 a = $reg "a = $reg // $lin"
        call $lin putchar_atx
    }

    proc getchar_atx {lin} {
        # for my own uart_v2_tx hardware.
        call $lin getchar_atx
    }

    proc pollchar_atx {lin} {
        call $lin pollchar_atx
    }

    proc puteol_atx {lin} {
        asc $lin a = "\r"
        putchar $lin a
        asc $lin a = "\n"
        putchar $lin a
    }
>>

// routine sends out the low byte from a to the UART.  blocks until the UART accepts the byte.
func putchar_atx

    x = a

    // wait for UART to be idle (not busy).
    a = $atx_busy_mask
    :pcatx_wait_for_idle
    b = atx_ctrl
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
end_func

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
    bn and0z :wait_for_idle
    a = atx_data
end_func

// returns a character in a, or -1 if none.
// this version can miss characters if not polled while the character is arriving.
func pollchar_atx
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
end_func

