`include "header.v"
`include "target_program_defines.v"

// synthesize with SystemVerilog

module std_reg #(
    parameter WIDTH = 16
) (
     input wire                  sysclk            
    ,input wire                  sysreset          

    ,output wire[15:0]           data_out
    ,input wire[WIDTH-1:0]       data_in           
    ,input wire                  load
);      
    // standard register implementation, with a parameterized number of actual data bits stored.
    reg[WIDTH-1:0] r = 0;
    assign data_out = { {16-WIDTH{1'b0}}, r};
    always_ff @(posedge sysreset , posedge sysclk) begin
        if (sysreset)
            r <= 0;
        else if (load)
            r <= data_in;
    end
endmodule
