`include "header.v"

module debounce_counter #(
    parameter WIDTH = 8
) (
    input         clk,
    input         clk_enable,
    input         reset,
    input         data,
    output reg    debounced
);
    // debouncer for pushbuttons, or simple signal conditioner (i.e. low-pass filter)
    // on other more general kinds of inputs.

    // it is fully static, doesn't depend on a particular 
    // clock rate, or even regular timing of clock pulses.

    // when reset, it initializes to 0 (low).  originally it did follow the input data
    // during reset, but that caused Quartus to infer latches and warn, even with always_ff.

    // WIDTH = number of bits in counter.  that directly determines 
    // minimum output high time and low time.
    
    localparam MSB = WIDTH - 1;
    
    reg[MSB:0] total = 0;
    wire[MSB:0] increment = data ? 1 : {MSB{1'b1}};
    always_ff @ (posedge clk, posedge reset) begin
        if (reset) begin 
            total <= 0;
        end else if (clk_enable) begin // normal running cycle.  not reset, and clk is enabled.  sample the input data.
            total <= total + increment;
            if (total == {MSB{1'b1}}) // saturated high.
                debounced <= 1'b1;
            else if (total == 0) // saturated low.
                debounced <= 1'b0;            
        end
    end        
endmodule

