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
