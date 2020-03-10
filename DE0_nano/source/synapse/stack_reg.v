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

module stack_reg #(
    parameter DEPTH = 8
) (
     input wire                  sysclk
    ,input wire                  sysreset

    ,output wire[15:0]           data_out
    ,input wire[15:0]            data_in
    ,input wire                  load
    ,input wire                  read
);
    localparam TOP=DEPTH-1;
    reg[15:0] content[TOP:0];
    assign data_out = content[0];
    genvar i;
    generate
        for (i=1; i < TOP; i=i+1) begin: middle
            always_ff @(posedge sysreset , posedge sysclk) begin
                if (sysreset)
                    content[i] <= 0;
                else if (load)
                    content[i] <= content[i-1];
                else if (read)
                    content[i] <= content[i+1];
            end
        end
    endgenerate
    always_ff @(posedge sysreset , posedge sysclk) begin
        if (sysreset)
            content[0] <= 0;
        else if (load)
            content[0] <= data_in;
        else if (read)
            content[0] <= content[1];
        if (sysreset)
            content[TOP] <= 0;
        else if (load)
            content[TOP] <= content[TOP-1];
    end
endmodule
