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



// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
func fetch_byte
    b = 1
    br and0z :pick_byte_even
        a = a>>1
        b = x
        fetch a from a+b
        a = a>>4
        a = a>>4
        rtn
    :pick_byte_even
    a = a>>1
    b = x
    fetch a from a+b
    b = 0xff
    a = and
end_func

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
func find_in_fetch
    y = a
    j = -1
    :again
        br iz :fail
        i = ad1
        a = i
        call :fetch_byte
        b = y
    bn eq :again
    :found
    a = i
    rtn
    :fail
    a = -1
end_func

