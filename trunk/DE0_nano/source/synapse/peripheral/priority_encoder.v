`include "header.v"

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
        for (i=TOP_INPUT; i >= 0; i=i-1) begin: middle
            if (in[i]) 
                outcode = i;
        end
    end
endmodule
