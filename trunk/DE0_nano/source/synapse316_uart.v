`include "header.v"

// synthesize with SystemVerilog

module synapse316_uart #(
     parameter LINE_IDLE_LEVEL = 1'b1 // set to 1 to match behavior of my original v1 UART.
    ,parameter LINE_DATA_INVERT = 1'b0
) (
      input wire                      sysclk            
    , input wire                      sysreset      
    
    , input wire                      clk_async  // clocked at 4x bit rate.     
    , input wire                      async_rx_line   
    ,output wire                      async_tx_line
    
    ,output wire[15:0]                status_out        
    
    , input wire[15:0]                data_in
    , input wire                      atx_reg_load
    ,output wire                      atx_fifo_empty
    ,output wire                      atx_fifo_full
    ,output wire                      atx_busy
    
    ,output wire[15:0]                arx_reg_out        
    , input wire                      arx_reg_read
    ,output wire                      arx_fifo_empty
    ,output wire                      arx_fifo_full
    ,output wire                      arx_busy
);  

    // full duplex UART and its FIFO's and status register.  the FIFO's cross from sysclk domain to clk_async domain.
    // FIFO also provides a bit of RAM for storing up sequences until they can be transmitted.
    // FIFO's must be configured in "show-ahead" mode where rdreq is used as a read acknowledge.
    
    // TX section (atx) (transmitter).
    wire[15:0] atxd;
    std_reg #(.WIDTH(8)) atx_data_reg(sysclk, sysreset, atxd, r_load_data[7:0], r_load[`DR_ATX_DATA]);
    wire[15:0] atxc;
    wire txbsy;
    wire rxbsy;
    assign status_out = {atxc[15:3], rxbsy, txbsy, atxc[0]};
    std_reg #(.WIDTH(1)) atx_ctrl_reg(sysclk, sysreset, atxc, r_load_data[0], r_load[`DR_ATX_CTRL]);
    wire ;
    wire[7:0] atx_fifo_data_out;
    reg last_async_tx_busy = 1'd0;
    always @(posedge clk921600)
        last_async_tx_busy <= async_tx_busy;
    wire atx_fifo_read_ack = async_tx_busy && ! last_async_tx_busy; // detect only the rising edge of async_tx_busy, to avoid draining atx_fifo prematurely.
    synapse316_uart_fifo atx_fifo (
        .wrclk ( sysclk ),
        .data ( data_in[7:0] ),
        .wrreq ( atx_reg_load ),
        .wrfull ( atx_fifo_full ),

        .rdclk ( clk_async ),
        .q ( atx_fifo_data_out ),
        .rdreq ( atx_fifo_read_ack ),
        .rdempty ( atx_fifo_empty )
    );    
    uart_v2_tx utx (
         .uart_sample_clk(clk_async) // clocked at 4x bit rate.
        ,.parallel_in    (atxd[7:0])
        ,.load_data      (r[`DR_ATX_CTRL][0])
        ,.tx_line        (async_tx_line)
        ,.tx_busy        (txbsy)
    );    
    
    // RX section (arx) (receiver).
    uart_v2_rx urx (
         .uart_sample_clk(clk_async) // clocked at 4x bit rate.
        ,.rx_line        (async_rx_line)
        ,.rx_busy        (rxbsy)
        ,.parallel_out   (r[`DR_ATX_DATA])
    );
    assign r[`DR_ATX_DATA][15:8] = 8'd0;

endmodule