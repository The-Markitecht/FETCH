module spi_master #(
    parameter WIDTH = 8
) (
     input wire                  clk            
    ,input wire                  reset          

    ,output wire[MSB:0]          mi_data
    ,input wire[MSB:0]           mo_data
    ,input wire                  mo_load
    ,output wire                 busy
    
    ,output wire                 spi_mo
    ,output wire                 spi_cs
    ,output wire                 spi_sck
    ,input wire                  spi_mi
    
);      
    localparam MSB = WIDTH - 1;    
    reg[MSB:0] r = 0;
    reg[8:0] cnt = 0;
    assign busy = ( | cnt );
    always_ff @(posedge reset or posedge clk) begin
        if (reset) begin
            cnt <= 0;
            r <= 0;
        end else if (mo_load) begin
            cnt <= WIDTH;
            r <= mo_data;
        end else if (busy) begin
            cnt <= cnt - 1;
            r <= { r[MSB-1:0], spi_mi };
        end else begin
            // idle state.
        end
    end
    assign spi_mo = r[MSB];
    assign spi_sck = clk;
    assign spi_cs = ! busy;
endmodule
