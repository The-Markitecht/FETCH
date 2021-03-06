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

module double_word_adapter #(
     parameter WW         = `WORD_WIDTH
    ,parameter DW         = WW * 2
) (
     input wire                  sysclk
    ,input wire                  sysreset

    ,input wire[MSB:0]           data_in

    ,output wire[MSB:0]          data_out_lo
    ,input wire                  read_lo
    ,input wire                  load_lo

    ,output wire[MSB:0]          data_out_hi
    ,input wire                  read_hi
    ,input wire                  load_hi

    ,input wire[DMSB:0]          double_data_to_read
    ,output wire                 double_read

    ,output wire[DMSB:0]         double_data_to_write
    ,output wire                 double_load

);
    // adapts a double-word-wide register onto a word-wide data bus.
    // for accessing and controlling extra-wide peripheral registers.

    // all access should be programmed to always occur in order: low word first, then high word.

    // reading the low word causes that cycle's value of the high word to be captured and
    // held in a temporary register for one more cycle, so then it can also be read without risk of inconsistency.
    // so the peripheral's high word is not directly readable.

    // similarly, the peripheral's low word is not directly writable.
    // attempting to write the low word actually writes a temporary register.  that holds the value for
    // one more cycle, so then the high word can also be written without risk of inconsistency.
    // the peripheral sees all bits arrive simultaneously, during the high word write,
    // since that's when they are all available.

    localparam MSB = WW - 1;
    localparam DMSB = DW - 1;

    reg[MSB:0] read_temp = 0;
    always_ff @(posedge sysclk)
        if (sysreset)
            read_temp <= 0;
        else if (read_lo)
            read_temp <= double_data_to_read[DMSB:WW];
    assign data_out_hi = read_temp;
    assign data_out_lo = double_data_to_read[MSB:0];
    assign double_read = read_lo;

    reg[MSB:0] write_temp = 0;
    always_ff @(posedge sysclk)
        if (sysreset)
            write_temp <= 0;
        else if (load_lo)
            write_temp <= data_in;
    assign double_data_to_write = {data_in, write_temp};
    assign double_load = load_hi;
endmodule
