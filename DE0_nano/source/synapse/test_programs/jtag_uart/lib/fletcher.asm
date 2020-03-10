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



    nonstackable  $fletcher_sum1_reg  $fletcher_sum2_reg

func fletcher16_init
    $fletcher_sum1_reg = 0
    $fletcher_sum2_reg = 0
end_func

// compute the modulus(255) of a number given in a.  return remainder in a.
func mod255
    // while a is greater than 254, subtract 255.
    :mod255_again
    b = 0xfe
    br gt :mod255_greater
    rtn
    :mod255_greater
    b = 0xff01
    a = a+b
    jmp :mod255_again
end_func

// accumulate a Fletcher16 checksum, given the next byte of data in a.
func fletcher16_input8
    b = $fletcher_sum1_reg
    a = a+b
    call :mod255
    $fletcher_sum1_reg = a

    b = $fletcher_sum2_reg
    a = a+b
    call :mod255
    $fletcher_sum2_reg = a
end_func

// accumulate a Fletcher16 checksum, given the next word of data in a.
func fletcher16_input16
    i = a>>4
    b = 0xff
    a = and
    call :fletcher16_input8
    a = i
    a = a>>4
    call :fletcher16_input8
end_func

// return the combined 16-bit result of Fletcher16 checksum in a.
func fletcher16_result
    a = $fletcher_sum2_reg
    a = a<<4
    a = a<<4
    b = $fletcher_sum1_reg
    a = or
end_func

    stackable  $fletcher_sum1_reg  $fletcher_sum2_reg
