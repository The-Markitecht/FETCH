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

module cdpwm #(
     parameter WIDTH = 16
    ,parameter START = 65535
) (
     input wire                  sysclk
    ,input wire                  sysreset

    ,input wire                  counter_tick

    ,output wire[`WMSB:0]        counter_value

    ,output wire[`WMSB:0]        duty
    , input wire                 duty_load
    , input wire[MSB:0]          data_in

    ,output wire                 pwm_signal
);
    // simple countdown PWM output module.
    // start value is fixed at design time, not software programmable.
    // duty cycle is software programmable.
    // counter value is exposed to let software synchronize to the counter.
    // so this can be used as a simple periodic timer too.
    // pwm_signal is registered to prevent sending glitches to off-chip circuits routinely.
    // but there's no built-in protection from glitching when duty cycle is altered.
    // the best time to set duty would be during the low time right after a counter rollover.
    // at that time START has just been loaded into the counter.
    // duty = 0 makes output always low.
    // duty = START + 1 makes output always high.

    localparam MSB = WIDTH - 1;

    // counter_tick rising edge detector.
    reg event_last = 0;
    always_ff @(posedge sysclk)
        event_last <= counter_tick;
    wire event_edge = counter_tick && ! event_last;

    // free-running down counter.
    reg[MSB:0] cnt = START[MSB:0];
    assign counter_value = cnt;
    wire expired = cnt == '0;
    always_ff @(posedge sysclk, posedge sysreset) begin
        if (sysreset)
            cnt <= START[MSB:0];
        else if (event_edge) begin
            if (expired)
                cnt <= START[MSB:0];
            else
                cnt <= cnt - 'd1;
        end
    end

    // duty cycle register & signal generator.
    std_reg #(.STORAGE_WIDTH(WIDTH), .OUTPUT_WIDTH(`WORD_WIDTH)) duty_reg
        (sysclk, sysreset, duty, data_in, duty_load);
    wire pwm_comb = cnt < duty;
    reg pwm_reg = 0;
    always_ff @(posedge sysclk)
        pwm_reg <= pwm_comb;
    assign pwm_signal = pwm_reg;
endmodule
