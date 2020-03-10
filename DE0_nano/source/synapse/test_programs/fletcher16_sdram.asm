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
    setvar counter $TOP_GP
    alias_src  keys                 [incr counter]
    alias_both leds                 [incr counter]
    alias_both rstk                 [incr counter]

    alias_both av_write_data        [incr counter]
    alias_src  av_read_data         [incr counter]
    alias_both av_ad_hi             [incr counter]
    alias_both av_ad_lo             [incr counter]
        // all Avalon addresses are BYTE addresses.  all Avalon sizes are in BYTES.
        vdefine32 sdram_base                 0x00000000
        vdefine32 sdram_size                 0x02000000
        // SDRAM notes:
        // - all addresses are BYTE addresses.  all must be divisible by 2, because this
        // system only supports 16-bit word accesses.  writes to an odd-numbered address
        // will be forced to the word boundary instead, overwriting data there.
        vdefine32 jtag_uart_base             0x02000000
        vdefine32 jtag_uart_data_lsw ($jtag_uart_base + 0)
        vdefine32 jtag_uart_data_msw ($jtag_uart_base + 2)
        vdefine32 jtag_uart_ctrl_lsw ($jtag_uart_base + 4)
        vdefine32 jtag_uart_ctrl_msw ($jtag_uart_base + 6)
        // JTAG UART notes:
        // - on read, program MUST test bit 15 of jtag_uart_data_lsw.  jtag uart continues to
        // report the same data byte on subsequent reads when no further data has arrived.
        // bit 15 RVALID = 1 is the only indication of proper data.
        // - reading jtag_uart_data_msw also counts as a FIFO read, causing loss of a data byte,
        // probably because jtag uart has no byteenable wires.
        // - on write, the data is lost if the write FIFO is full.  Avalon is not stalled.

    convention_gpx

    jmp :main

    // register names for use by debugger.
    ([src rstk])
    "\r\n     a"
    "       b"
    "       i"
    "       j"
    "\r\n     x"
    "       y"
    "      g6"
    "      g7"
    "\r\n  keys"
    "    leds"

    // libraries
    include lib/string.asm
    include lib/jtag_uart.asm
    include lib/console.asm
    include lib/time.asm

    setvar fletcher_sum1_reg g6
    setvar fletcher_sum2_reg g7
    include lib/fletcher.asm

    // ////////////////////////////////////////////
    :main

    // copy 203 words of program over and over, to all of SDRAM.  203 was chosen to create misalignment vs. SDRAM page boundaries.
    // x = program pointer
    call :fletcher16_init
    x = 0
    y = 1
    av_ad_hi = 0
    av_ad_lo = 0
    setvar sdram_page_beyond ($sdram_size >> 16)
    :nextword
    fetch a from x
    av_write_data = a
    call :fletcher16_input16
    a = av_ad_lo
    b = 2
    a = a+b
    av_ad_lo = a
    bn az :same_page
    a = av_ad_hi
    b = 1
    a = a+b
    av_ad_hi = a
    b = $sdram_page_beyond
    br eq :ram_full
    :same_page
    x = x+y
    a = x
    b = 203
    bn eq :nextword
    x = 0
    jmp :nextword
    :ram_full
    puteol
    putasc "W"
    putasc "R"
    call :fletcher16_result
    call :put4x

    // read back all of SDRAM.
    call :fletcher16_init
    av_ad_hi = 0
    av_ad_lo = 0
    :read_nextword
    a = av_write_data
    a = av_read_data
    call :fletcher16_input16
    a = av_ad_lo
    b = 2
    a = a+b
    av_ad_lo = a
    bn az :read_same_page
    a = av_ad_hi
    b = 1
    a = a+b
    av_ad_hi = a
    b = $sdram_page_beyond
    br eq :read_ram_full
    :read_same_page
    jmp :read_nextword
    :read_ram_full
    puteol
    putasc "R"
    putasc "D"
    call :fletcher16_result
    call :put4x
    jmp :main

    // // Avalon write to SDRAM.
    // av_ad_hi = 0
    // av_ad_lo = 0x20
    // av_write_data = 0x6789
    // // Avalon read from SDRAM.
    // a = av_write_data
    // a = av_read_data
    // call put4x
    // a = 1000
    // call :spinwait

    // :verify_all
    // a = 1000
    // call :spinwait
    // putasc {-}
    // i = 0x200
    // j = -1
    // :next_page
    // i = i+j
    // av_ad_hi = i

    // // fill SDRAM page with a pattern.
    // putasc W
    // x = 0x0000
    // :fill_more
    // a = x
    // b = 0xffff
    // g6 = xor
    // av_ad_hi = i
    // av_ad_lo = x
    // av_write_data = g6
    // y = 2
    // x = x+y
    // bn xz :fill_more

    // // verify pattern in SDRAM.
    // x = 0x0000
    // :verify_more
    // av_ad_hi = i
    // av_ad_lo = x
    // g6 = av_write_data
    // g6 = av_read_data
    // // a = x
    // // call put4x
    // // putasc "="
    // // a = 500
    // // call :spinwait
    // // a = g6
    // // call put4x
    // // putasc "\r"
    // // putasc "\n"
    // // a = 500
    // // call :spinwait
    // a = x
    // b = 0xffff
    // a = xor
    // b = g6
    // bn eq :sdram_err
    // y = 2
    // x = x+y
    // bn xz :verify_more

    // a = i
    // b = 0
    // bn z :next_page
    // jmp :verify_all

    // :sdram_err
    // y = a
    // a = 1000
    // call :spinwait
    // a = g6
    // call :put4x
    // a = 1000
    // call :spinwait
    // putasc "!"
    // putasc "="
    // a = y
    // call :put4x
    // a = 1000
    // call :spinwait
    // putasc "@"
    // a = av_ad_hi
    // call :put4x
    // a = 1000
    // call :spinwait
    // a = av_ad_lo
    // call put4x
    // :halt
    // jmp :halt

// // :wait_key_press
    // // a = 0x03
    // // b = keys
    // // br eq :wait_key_press
// // :wait_key_release
    // // b = keys
    // // bn eq :wait_key_release


