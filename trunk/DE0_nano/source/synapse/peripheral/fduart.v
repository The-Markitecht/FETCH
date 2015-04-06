`include "header.v"
`include "target_program_defines.v"

// synthesize with SystemVerilog

module fduart #(
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
    
    ,output wire[15:0]                arx_reg_out        
    , input wire                      arx_reg_read
);  
    // full duplex UART and its FIFO's and status register.  the FIFO's cross from sysclk domain to clk_async domain.
    // FIFO also provides a bit of RAM for storing up sequences until they can be transmitted.
    // FIFO's must be configured in "show-ahead" mode where rdreq is used as a read acknowledge.
    
    // TX section (atx) (transmitter).
    assign status_out[15:6] = 0;
    wire[7:0] atx_par;
    wire atx_busy, atx_fifo_empty, atx_fifo_full, tx_stop;
    reg last_atx_busy = 1'd0;
    always @(posedge clk_async)
        last_atx_busy <= atx_busy;
    wire atx_fifo_read_ack = atx_busy && ! last_atx_busy; // detect only the rising edge of atx_busy, to avoid draining atx_fifo prematurely.
    fduart_fifo atx_fifo (
        .aclr(sysreset),

        .wrclk ( sysclk ),
        .data ( data_in[7:0] ),
        .wrreq ( atx_reg_load ),
        .wrfull ( atx_fifo_full ),
        .wrempty ( atx_fifo_empty ),

        .rdclk ( clk_async ),
        .q ( atx_par ),
        .rdreq ( atx_fifo_read_ack ),
        .rdempty ( tx_stop )
    );    
    uart_v2_tx utx (
         .uart_sample_clk(clk_async) // clocked at 4x bit rate.
        ,.parallel_in    (atx_par)
        ,.load_data      ( ! (atx_busy || tx_stop))
        ,.tx_line        (async_tx_line)
        ,.tx_busy        (atx_busy)
    );    
    
    // RX section (arx) (receiver).
    wire[7:0] arx_par;
    wire arx_busy, arx_fifo_empty, arx_fifo_full;
    reg last_arx_busy = 1'd0;
    always @(posedge clk_async)
        last_arx_busy <= arx_busy;
    wire arx_fifo_write = last_arx_busy && ! arx_busy; // detect only the falling edge of arx_busy, to avoid filling arx_fifo prematurely.
    fduart_fifo arx_fifo (
        .aclr(sysreset),
    
        .wrclk ( clk_async ),
        .data ( arx_par ),
        .wrreq ( arx_fifo_write ),

        .rdclk ( sysclk ),
        .q ( arx_reg_out[7:0] ),
        .rdreq ( arx_reg_read ),
        .rdfull ( arx_fifo_full ),
        .rdempty ( arx_fifo_empty )
    );    
    uart_v2_rx urx (
         .uart_sample_clk(clk_async) // clocked at 4x bit rate.
        ,.rx_line        (async_rx_line)
        ,.rx_busy        (arx_busy)
        ,.parallel_out   (arx_par)
    );
    assign arx_reg_out[15:8] = 0;

    // status register.  read-only.
    assign status_out[15:6] = 0;
    assign status_out[`ATX_FIFO_EMPTY_BIT] = atx_fifo_empty; // no need to sync; this is already in sysclk domain.
    assign status_out[`ATX_FIFO_FULL_BIT] = atx_fifo_full;  // no need to sync; this is already in sysclk domain.
    assign status_out[`ARX_FIFO_EMPTY_BIT] = arx_fifo_empty; // no need to sync; this is already in sysclk domain.
    assign status_out[`ARX_FIFO_FULL_BIT] = arx_fifo_full; // no need to sync; this is already in sysclk domain.
    syncer3 syncer1(clk_async, sysclk, atx_busy, status_out[`ATX_BUSY_BIT]);
    syncer3 syncer2(clk_async, sysclk, arx_busy, status_out[`ARX_BUSY_BIT]);
    
endmodule