`include <header.v>

module debounce_counter #(
    parameter WIDTH = 8
    ,parameter MSB = WIDTH - 1
) (
    input  wire   clk,
    input  wire   clk_enable,
    input  wire   reset,
    input  wire   data,
    output reg    debounced = 0
);
    // debouncer for pushbuttons, or simple signal conditioner (i.e. low-pass filter)
    // on other more general kinds of inputs.

    // it is fully static, doesn't depend on a particular 
    // clock rate, or even regular timing of clock pulses.

    // when reset, it initializes to 0 (low).  originally it did follow the input data
    // during reset, but that caused Quartus to infer latches and warn, even with always_ff.

    // WIDTH = number of bits in counter.  that directly determines 
    // minimum output high time and low time.
    
    reg[MSB:0] total = 0;
    wire saturated_hi = total == {WIDTH{1'b1}};
    wire saturated_lo = total == 0;
    wire[MSB:0] increment = 
        data ? (saturated_hi ? 0 : 1) 
        :      (saturated_lo ? 0 : {WIDTH{1'b1}}); // -1 here utilizes rollover to subtract 1.
    always_ff @ (posedge clk, posedge reset) begin
        if (reset) begin 
            total <= 0;
            debounced <= 0;            
        end else if (clk_enable) begin // normal running cycle.  not reset, and clk is enabled.  sample the input data.
            total <= total + increment;
            if (saturated_hi) 
                debounced <= 1'b1;
            else if (saturated_lo) 
                debounced <= 1'b0;            
        end
    end        
endmodule
