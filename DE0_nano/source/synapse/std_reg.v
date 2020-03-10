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
`include "target_program_defines.v"

// synthesize with SystemVerilog

module std_reg #(
     parameter STORAGE_WIDTH = `WORD_WIDTH
    ,parameter  OUTPUT_WIDTH = `WORD_WIDTH
) (
     input  wire                 sysclk
    ,input  wire                 sysreset

    ,output wire[OMSB:0]         data_out
    ,input  wire[SMSB:0]         data_in
    ,input  wire                 load
);
    // standard register implementation, with a parameterized number of actual data bits stored.
    // width of data_out is a separate parameter, to conveniently drive signals
    // into the MCU core without boilerplate.
    // max for either is 256.

    localparam SMSB = STORAGE_WIDTH - 1;
    localparam OMSB =  OUTPUT_WIDTH - 1;

    reg[SMSB:0] r = 0;
    wire[256:0] padded = r;
    assign data_out = padded[OMSB:0];
    always_ff @(posedge sysclk) begin
        if (sysreset)
            r <= 0;
        else if (load)
            r <= data_in;
    end
endmodule
