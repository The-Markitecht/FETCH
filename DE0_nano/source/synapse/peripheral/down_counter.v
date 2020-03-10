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

module down_counter  #(
     parameter WIDTH         = `WW
) (
     input wire                  sysclk
    ,input wire                  sysreset

    ,input wire[MSB:0]           data_in

    ,output wire[MSB:0]          counter_data_out
    ,input wire                  counter_load

    ,input wire                  counter_tick

    ,output wire                 expired
);
    // 16-bit countdown timer/counter module.
    // counts rising edges of the counter_tick signal.
    // offers 1 exposed register:  the counter.  read/write.
    // when it reaches zero, the counter asserts expired, and it stops counting.

    localparam MSB = WIDTH - 1;

    // counter_tick rising edge detector.
    reg event_last = 0;
    always_ff @(posedge sysclk)
        event_last <= counter_tick;
    wire event_edge = counter_tick && ! event_last;

    // loadable down counter.
    reg[MSB:0] cnt = 0;
    assign counter_data_out = cnt;
    assign expired = cnt == 0;
    always_ff @(posedge sysclk, posedge sysreset) begin
        if (sysreset)
            cnt <= 0;
        else if (counter_load)
            cnt <= data_in;
        else if ( event_edge && ! expired)
            cnt <= cnt - 1'd1;
    end
endmodule
