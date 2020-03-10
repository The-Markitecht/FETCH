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



// bit-bang a complete SPI transaction.
// pass mo data in a, transaction width (# of bits) in b.
// returns mi data in a
func spi_exchange
    // keeping mo data in g6, mi data in g7.
    g6 = a
    g7 = 0
    // keeping bit counter in i.
    i = b
    j = -1
    y = -1
    :next_bit
    // output the msb of mo, along with a low clock phase and low csn.
    a = g6
    a = a>>1
    a = a>>1
    a = a>>1
    a = a>>4
    a = a>>4
    a = a>>4
    de0nano_adc_ctrl = a
    // wait about 500 ns (for about 1 Mhz sck) assuming 50 MHz sysclk.
    x = 6
    :wait1
    x = x+y
    bn xz :wait1
    // output a high clock phase.
    b = $de0nano_adc_sck_mask
    de0nano_adc_ctrl = or
    // sample mi.
    a = g7
    a = a<<1
    b = de0nano_adc_ctrl
    g7 = or
    // wait about 500 ns (for about 1 Mhz sck) assuming 50 MHz sysclk.
    x = 6
    :wait2
    x = x+y
    bn xz :wait2
    // shift mo bits.
    a = g6
    a = a<<1
    g6 = a
    // count bits
    i = i+j
    bn iz :next_bit
    // idle the SPI bus with a high clock phase and high csn.
    de0nano_adc_ctrl = ($de0nano_adc_csn_mask | $de0nano_adc_sck_mask)
    // wait about 500 ns (for about 1 Mhz sck) assuming 50 MHz sysclk.
    x = 6
    :wait3
    x = x+y
    bn xz :wait3
    a = g7
end_func

// pass desired ADC channel in a.
// returns ADC reading in a.
func de0nano_adc_read
    a = a<<4
    a = a<<4
    a = a<<1
    a = a<<1
    a = a<<1
    b = 16
    call :spi_exchange
end_func

// pass desired anmux channel in a.
// return ADC reading in a.
func anmux_read_chn
    // set & enable analog muxer
    b = $anmux_enable_mask
    anmux_ctrl = or
    // wait for muxer & current driver to settle down.  some delay here is absolutely required (per testing).
    a = 10
    call :spinwait

    // read ADC channel 7.  12 bits resolution.
    a = 7
    call :de0nano_adc_read
end_func
