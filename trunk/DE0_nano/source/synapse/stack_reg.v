`include "header.v"
`include "target_program_defines.v"

// synthesize with SystemVerilog

module stack_reg #(
    parameter DEPTH = 8
) (
     input wire                  sysclk            
    ,input wire                  sysreset          

    ,output wire[15:0]           data_out
    ,input wire[15:0]            data_in           
    ,input wire                  load
    ,input wire                  read
);      
    localparam TOP=DEPTH-1;
    reg[15:0] content[TOP:0];
    assign data_out = content[0];
    genvar i;
    generate  
        for (i=1; i < TOP; i=i+1) begin: middle
            always_ff @(posedge sysreset or posedge sysclk) begin
                if (sysreset)
                    content[i] <= 0;
                else if (load)
                    content[i] <= content[i-1];
                else if (read)
                    content[i] <= content[i+1];
            end  
        end
    endgenerate     
    always_ff @(posedge sysreset or posedge sysclk) begin
        if (sysreset)
            content[0] <= 0;
        else if (load)
            content[0] <= data_in;
        else if (read)
            content[0] <= content[1];
        if (sysreset)
            content[TOP] <= 0;
        else if (load)
            content[TOP] <= content[TOP-1];
    end
endmodule