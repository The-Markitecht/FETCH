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

`include <header.v>

// synthesize with SystemVerilog

module priority_encoder #(
     parameter NUM_INPUTS          = 65536
    ,parameter TOP_INPUT           = NUM_INPUTS - 1
) (
    output wire[15:0]                out
    ,input wire[TOP_INPUT:0]         in
);
    // the most urgent input signal should be listed LAST.
    // all inputs are usable in this encoder, even input no. 0.
    // asserting it causes a zero code output (as expected).  but since zero code is
    // also the default output when all inputs are idle, that means input no. 0 effectively
    // disables all other inputs, since it takes priority over all others.

    integer outcode;
    assign out = outcode[15:0];
    integer i;
    always_comb begin
        // note the absence of a "generate" keyword here.
        outcode = 0;
        for (i=TOP_INPUT; i >= 0; i=i-1) begin: body
            if (in[i])
                outcode = i;
        end
    end
endmodule
