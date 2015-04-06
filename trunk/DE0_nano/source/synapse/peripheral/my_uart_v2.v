
// bare-minimal version of my Verilog UART for small devices like CPLD's.

// 2012/04: this version includes 2x bug fixes.
// it looks perfect in simulations, trading data back and forth with my original v1 UART
// indefinitely, each having a FIFO in its parallel loopback.
// those tests used maximum throughput, bit patterns 0x55, 0x41, 0x42, 0x43,
// and +/- 2% clock drift between the two systems.

// 2012/06: this version converted to TeePee syntax and .TPV filename extension.
// and moved parameters up prior to port declarations.

module uart_v2_tx #(
     parameter LINE_IDLE_LEVEL = 1'b1 // set to 1 to match behavior of my original v1 UART.
    ,parameter LINE_DATA_INVERT = 1'b0
) (
     input         uart_sample_clk // clocked at 4x bit rate.
    ,input[7:0]    parallel_in
    ,input         load_data
    ,output        tx_line
    ,output        tx_busy
);
    reg[5:0] sample_cnt = 6'd0; 
    assign tx_busy = | sample_cnt;

    // tx_shifter includes an extra bit for the start bit.  
    reg[8:0] tx_shifter = {9{LINE_IDLE_LEVEL}}; 
    assign tx_line = tx_shifter[0];
    
    always @(posedge uart_sample_clk) begin
        if (load_data && ! tx_busy) begin
            tx_shifter <= { parallel_in ^ {8{LINE_DATA_INVERT}}, ! LINE_IDLE_LEVEL }; // tack on the start bit ahead of the LSB of the data.
            sample_cnt <= 6'd40; // include 10 bits' worth of cycles: 1 start bit + 8 data + 1 stop bit.  tx must keep asserting "busy" during the stop bit period.
        end else if (sample_cnt[1:0] == 2'b01) begin
            tx_shifter <= { LINE_IDLE_LEVEL, tx_shifter[8:1] };
            sample_cnt <= sample_cnt - 1'b1;
        end else if (tx_busy)
            sample_cnt <= sample_cnt - 1'b1;
    end 
endmodule

module uart_v2_rx #(
     parameter LINE_IDLE_LEVEL = 1'b1 // set to 1 to match behavior of my original v1 UART.
    ,parameter LINE_DATA_INVERT = 1'b0
) (
     input         uart_sample_clk // clocked at 4x bit rate.
    ,input         rx_line
    ,output        rx_busy
    ,output[7:0]   parallel_out
);
    reg[7:0] rx_shifter = 8'd0;
    assign parallel_out = rx_shifter; // output comes directly from the shifter to save area.
    reg[4:0] sample_cnt = 5'd0; // assumed to roll over without explicit load.  
    //wire[2:0] bit_cnt = sample_cnt[4:2]; // not needed.
    wire never = 1'b0;

    // state machine uart_rx_fsm holds state in rx_state
    reg[2:0] rx_state ;
        
    assign rx_busy =
          rx_state == 3'd0 ? ( 1'b0 )
        : rx_state == 3'd1 ? ( 1'b0 )
        : rx_state == 3'd2 ? ( 1'b1 )
        : rx_state == 3'd3 ? ( 1'b1 )
        : rx_state == 3'd4 ? ( 1'b1 )
        : ( 1'b0 ) ;

    always @ ( posedge ( uart_sample_clk )) begin

        if ((( never ) == 1'b1) || (rx_state == 3'd0)) begin
            // reset 
                
            rx_state <= ((( never ) == 1'b1) ? 3'd0 /* stay */ : 3'd1 /* proceed */) ; 

        end else if (rx_state == 3'd1) begin
            // state IDLE 
                
            rx_state <= ((rx_line == LINE_IDLE_LEVEL) ? 3'd1 /* stay */ : 3'd2 /* proceed */) ; 

        end else if (rx_state == 3'd2) begin
            // state STARTWAIT1 
                
            
            rx_state <= 3'd3 /* proceed */ ; 

        end else if (rx_state == 3'd3) begin
            // state RECEIVING 
                
            sample_cnt <= ( sample_cnt + 5'd1);
            rx_shifter <= (  ( & sample_cnt[1:0]) ? {rx_line ^ LINE_DATA_INVERT, rx_shifter[7:1]} : rx_shifter );
            rx_state <= (( & sample_cnt ) ? 3'd4 /* proceed */ : 3'd3 /* stay */) ; 

        end else if (rx_state == 3'd4) begin
            // state STOPWAIT 
                
            rx_state <= ((rx_line == LINE_IDLE_LEVEL) ? 3'd1 /* IDLE */ : 3'd4 /* stay */) ; 

        end else begin
            // unknown state; reset.
            rx_state <= 0;
        end
    end
        

endmodule
