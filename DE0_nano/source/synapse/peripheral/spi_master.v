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

module spi_master #(
     parameter WIDTH = 8
    ,parameter MSB = WIDTH - 1
    ,parameter SPI_CLOCK_DIVISOR = 65536
) (
     input wire                  sysclk
    ,input wire                  sysreset

    ,output wire[MSB:0]          mi_data
    ,input wire[MSB:0]           mo_data
    ,input wire                  mo_load
    ,output wire                 busy

    ,output wire                 spi_mo
    ,output wire                 spi_cs
    ,output wire                 spi_sck
    ,input wire                  spi_mi

);
    // SPI master for MSB-first exchange, of any fixed width up to 511 bits.
    // all signals are synchronized to sysclk rising edge.
    // a built-in 16-bit clock scaler can generate spi_sck frequencies from
    // sysclk / 2 to sysclk / 65536.
    // spi_mi is sampled on the RISING edge of spi_sck (virtually).
    // spi_mo is shifted on the FALLING edge of spi_sck.
    // module interface is compatible with a Synapse316 host system, even when WIDTH > 16.

    // dedicated clock divider from sysclk to SPI clock, to ensure consistent timing.
    // timing supplied by an external prescaler would surely be inconsistent at the start & end of the transaction.
    reg[15:0] scaler = 0;
    localparam SCALER_START = (SPI_CLOCK_DIVISOR / 2) - 1;
        // scaler must count down each HALF of a bit period (each spi_sck phase).

    // shift register & bit counter
    reg[MSB:0] r = 0;
    assign mi_data = r;
    reg[8:0] cnt = 0;
    reg spi_sck_reg = 0; // registered outputs for these 2 signals ensure no glitches passed to the off-chip peripheral.
    reg spi_cs_reg = 1;
    assign busy = ( | cnt );
    always_ff @(posedge sysclk)
        spi_cs_reg <= ! busy;
    always_ff @(posedge sysreset , posedge sysclk) begin
        if (sysreset) begin
            cnt <= 0;
            r <= 0;
            scaler <= 0;
            spi_sck_reg <= 0;
        end else if (mo_load) begin
            cnt <= WIDTH;
            r <= mo_data;
            spi_sck_reg <= 0;
            scaler <= SCALER_START;
        end else if (busy) begin
            if (scaler == 0) begin
                if (spi_sck) begin
                    // time for a falling edge of spi_sck.  capture data in & shift data out.
                    // this design imitates one that samples mi on the rising edge of sck, although the
                    // sample actually doesn't take place until just before the next falling edge of sck.
                    // the slave doesn't know that, and it's fine.
                    // this way the same (potentially big) shift register can serve both mo and mi.
                    scaler <= SCALER_START;
                    cnt <= cnt - 9'd1;
                    spi_sck_reg <= 0;
                    r <= { r[MSB-1:0], spi_mi };
                end else begin
                    // time for a rising edge of spi_sck.
                    scaler <= SCALER_START;
                    spi_sck_reg <= 1;
                end
            end else begin
                scaler <= scaler - 16'd1;
            end
        end else begin
            // idle state.
        end
    end
    assign spi_mo = r[MSB];
    assign spi_sck = spi_sck_reg;
    assign spi_cs = spi_cs_reg;
endmodule
