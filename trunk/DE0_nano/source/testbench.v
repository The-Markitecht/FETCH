`timescale 1 ns / 1 ns

module testbench #(
    parameter IPR_WIDTH = 16,
    parameter IPR_TOP = IPR_WIDTH - 1,
    parameter NUM_REGS = 16,
    parameter TOP_REG = NUM_REGS - 1,
    parameter REGS_FLAT_WIDTH = NUM_REGS * 16,
    parameter NUM_DATA_INPUTS = 16,
    parameter TOP_DATA_INPUT = NUM_DATA_INPUTS - 1,
    parameter DATA_INPUT_FLAT_WIDTH = NUM_DATA_INPUTS * 16
) ();

wire[15:0] code_addr, code_in, code_fetched;
wire[REGS_FLAT_WIDTH-1:0]     r_flat;
wire[TOP_REG:0] r_load;
wire[DATA_INPUT_FLAT_WIDTH-1:0]   data_in_flat;
wire async_out;
//wire[15:0] code[90:0];
reg code_ready = 1;
reg sysreset = 0;
reg clk50m = 0;
reg clk_async = 0;
coderom rom(
    .addr(code_addr),
    .data(code_fetched)
);
assign #300 code_in = code_fetched;
synapse316 chip(
    .sysclk          (clk50m      ) ,
    .sysreset        (sysreset    ) ,
    .code_addr       (code_addr   ) ,
    .code_in         (code_in     ) ,
    .code_ready      (code_ready  ) ,
    .r_flat          (r_flat),
    .r_load          (r_load),
    .data_in_flat    (data_in_flat)
);    
genvar i;
generate  
    for (i=0; i < NUM_REGS; i=i+1) begin: regs
        wire[15:0] r = r_flat[i*16+15:i*16];
    end  
endgenerate     
generate  
    for (i=0; i < NUM_DATA_INPUTS; i=i+1) begin: data_in
        wire[15:0] d;
        assign data_in_flat[i*16+15:i*16] = d;
    end  
endgenerate     
// UART
wire txbsy; // this wire was ineffective in fixing ambiguous muxa_comb.
uart_v2_tx utx (
     .uart_sample_clk(clk_async) // clocked at 4x bit rate.
    ,.parallel_in    (regs[8].r[7:0])
    ,.load_data      (regs[9].r[0])
    ,.tx_line        (async_out)
    ,.tx_busy        (txbsy)
);    
assign data_in[0].d = {15'd0, txbsy};

initial	begin
    $dumpfile("testbench.vcd");
    $dumpvars;
    #3000 sysreset = 1;
    #2000 sysreset = 0;
    #100000 $finish;
end

always begin
    // run at 1 MHz for easy viewing.
    #500 clk50m = ! clk50m;
end
   
always begin
    // run at actual 460,800 Hz for 115,200 bps.  4x desired bit rate.
    #1085 clk_async = ! clk_async;
end

    
endmodule    
