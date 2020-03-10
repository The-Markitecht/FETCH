/*
FETCH
Copyright 2009 Mark Hubbard, a.k.a. "TheMarkitecht"
http://www.TheMarkitecht.com

Project home:  http://github.com/The-Markitecht/FETCH
FETCH is the Fluent Engine and Transmission Controller Hardware for sports cars.

This file is part of FETCH.

FETCH is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

FETCH is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with FETCH.  If not, see <https://www.gnu.org/licenses/>.
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace project
{
    class fletcher16
    {
        protected int sum1, sum2 = 0;

        public fletcher16() {
        }

        public void input16(UInt16 input) {
            input8((byte)(input));
            input8((byte)(input >> 8));
        }

        public void input8(byte input) {
            sum1 = (sum1 + input) % 0xff;
            sum2 = (sum2 + sum1) % 0xff;
        }

        public UInt16 result() {
            return (UInt16)((sum2 << 8) | sum1);
        }
    }
}
