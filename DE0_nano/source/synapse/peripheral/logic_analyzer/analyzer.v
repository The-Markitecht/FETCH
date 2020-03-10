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

// logic analyzer using m9k RAM block.
// to be integrated into debugging supervisor and driven by it.

module analyzer #(
    NUM_TRIGGERS = 2
    ,MAX_TRIGGER = NUM_TRIGGERS - 1
) (
     input wire                  sysclk
    ,input wire                  sysreset

    ,input wire[15:0]           data_probe
    ,input wire[15:0]           trigger_probe

);

need synchronizers on probe signals.

need control & status register.

need mcu access to ram.

need mcu driver module, to set triggers, arm, upload with checksum.

need PC debugger function to receive upload with checksum, write to GTKwave vector file.

visor and PC debugger should not busy-wait during capture.  let capture happen in
background, like visor lets target mcu run full speed in background.


//std_reg[MAX_TRIGGER:0] mask_reg(sysclk, sysreset, mask0, r_load_data, mask0_load);
std_reg #() mask0_reg(sysclk, sysreset, mask0, r_load_data, mask0_load);
std_reg #() trig0_reg(sysclk, sysreset, trig0, r_load_data, trig0_load);
std_reg #() mask1_reg(sysclk, sysreset, mask1, r_load_data, mask1_load);
std_reg #() trig1_reg(sysclk, sysreset, trig1, r_load_data, trig1_load);
reg[1:0] met = 0;
wire trigger_wrap = met[1];
always_ff @(posedge sysclk, posedge sysreset) begin
    if (sysreset)
        met <= 0;
    else if (trigger_wrap)
        met <= 0;
    else begin
        met[0] = (trigger_probe & mask0) == trig0;
        met[1] = met[0] && ((trigger_probe & mask1) == trig1);
    end
end

// one-hot states:
// idle.  = all regs 0.
// armed.
// capturing.
reg armed = 0;
reg capturing = 0;
reg[15:0] cap_addr = 0;
always_ff @(posedge sysclk, posedge sysreset) begin
    if (sysreset) begin
        armed <= 0;
        capturing <= 0;
        cap_addr <= 0;
    end else if (armed && trigger_wrap) begin
        armed <= 0;
        capturing <= 1'd1;
    end else if (capturing) begin
        if (data_probe == last_data_probe) begin
            // no change in data_probe; count up a repeat.
            repeat_cnt <= repeat_cnt + 16'd1;
        end else begin
            // record a change in data_probe, and the final value of repeat_cnt.
            repeat_cnt <= 0;
            cap_addr <= cap_addr + 16'd1;
            if (cap_addr == 16'hffff) begin
                capturing <= 0;
            end
        end
    end
end

// on-chip single-ported M9K RAM for captured values.
wire[31:0] cap_data = {repeat_cnt, data_probe};
wire[31:0] cap_q;
wire cap_wren = capturing;
analyzer_m9k  cap_ram (
    .address_a ( cap_addr ),
    .address_b ( 0 ),
    .clock_a ( sysclk ),
    .clock_b ( 0 ),
    .data_a ( cap_data ),
    .data_b ( 16'd0 ),
    .wren_a ( cap_wren ),
    .wren_b ( 1'd0 ),
    .q_a ( cap_q ),
    .q_b (  )
);

endmodule
