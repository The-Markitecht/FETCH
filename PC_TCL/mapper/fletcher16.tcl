# FETCH
# Copyright 2009 Mark Hubbard, a.k.a. "TheMarkitecht"
# http://www.TheMarkitecht.com
#
# Project home:  http://github.com/The-Markitecht/FETCH
# FETCH is the Fluent Engine and Transmission Controller Hardware for sports cars.
#
# This file is part of FETCH.
#
# FETCH is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# FETCH is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with FETCH.  If not, see <https://www.gnu.org/licenses/>.

proc fletcher16_init {sum_var} {
    upvar $sum_var sum
    catch {unset sum}
    array set sum [list 1 0 2 0]
}

proc fletcher16_input16 {sum_var  input} {
    upvar $sum_var sum
    fletcher16_input8 sum [e {$input & 0xff}]
    fletcher16_input8 sum [e {($input >> 8) & 0xff}]
}

proc fletcher16_input8 {sum_var  input} {
    upvar $sum_var sum
    set sum(1) [e {($sum(1) + $input) % 0xff}]
    set sum(2) [e {($sum(2) + $sum(1)) % 0xff}]
    #puts "input8 $input = 0x[format %04x $input], sum now 0x[format %02x%02x $sum(2) $sum(1)]"
}

proc fletcher16_result {sum_var} {
    upvar $sum_var sum
    return [e {($sum(2) << 8) | $sum(1)}]
}
