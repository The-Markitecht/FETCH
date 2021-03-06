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


// #########################################################################
// assembly source code.
// to write some data on the UART.

    // register file configuration
    vdefine NUM_REGS 32
    vdefine TOP_REG ($NUM_REGS - 1)
    vdefine NUM_GP 8
    vdefine TOP_GP ($NUM_GP - 1)
    vdefine IO $NUM_GP

    // application-specific register aliases.
    alias_both g6                   6
    alias_both g7                   7
    [set counter $TOP_GP]
    alias_both leds                 [incr counter]
    alias_both atx_data             [incr counter]
    alias_both atx_ctrl             [incr counter]
        vdefine atx_load_mask           0x0001
        vdefine atx_busy_mask           0x0002

:begin
    leds = 0b00000001
    atx_ctrl = 0

    // using x as pass counter.  shows on LEDs.
    x = 0xff00
    y = -1

    // using i as index into string.
    i = 0

    // cache the string limit.
    a = 5
    b = 0xffff
    g6 = xor

:again
    x = x+y
    a = x
    a = a>>4
    leds = a>>4

    // fetch a word from test pattern to the UART.  its low byte is a character.
    j = :test_pattern
    fetch g7 from i+j
    call :putchar

    // increment index & wrap around end of pattern.
    j = 1
    i = i+j
    j = g6
    i = i+j
    bn iz :no_wrap
    i = 0
:no_wrap

    // repeat forever.
    br always :again


// routine sends out the low byte from g7 to the UART.  blocks until the UART accepts the byte.
:putchar

    // wait for UART to be idle (not busy).
    a = $atx_busy_mask
:wait_for_idle
    b = atx_ctrl
    bn and0z :wait_for_idle

    // push word to the UART.  its low byte is a character.
    atx_data = g7

    // can't use the actual register load strobe that occurs here, because it's
    // much too fast for the UART to sample.
    // instead use a dedicated output word atx_ctrl.
    atx_ctrl = $atx_load_mask

    // wait until UART is busy, as acknowledgement.
    a = $atx_busy_mask
:wait_for_busy
    b = atx_ctrl
    leds = 0b00000100
    br and0z :wait_for_busy

    atx_ctrl = 0
    return


:test_pattern
    0x55
    0xaa
    0b01000001
    66
    0x0d
    0x0a

:msg
    "testes, testes,\n\t 1...\n\t 2...\n\t 3?? \n\x00"
