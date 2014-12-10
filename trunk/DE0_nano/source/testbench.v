`timescale 1 ns / 1 ns

module testbench #(
    parameter IPR_WIDTH = 16,
    parameter IPR_TOP = IPR_WIDTH - 1,
    parameter NUM_REGS = 16,
    parameter TOP_REG = NUM_REGS - 1,
    parameter REGS_FLAT_WIDTH = NUM_REGS * 16,
    parameter NUM_DATA_INPUTS = 16,
    parameter TOP_DATA_INPUT = NUM_DATA_INPUTS - 1,
    parameter DATA_INPUT_FLAT_WIDTH = NUM_DATA_INPUTS * 16,
    parameter DEBUG_IN_WIDTH = 3,
    parameter DEBUG_OUT_WIDTH = 6,
    parameter DEBUG_REG_NUM = TOP_REG,
    parameter DEBUG_DATA_INPUT_NUM = TOP_DATA_INPUT
) ();

wire async_out;
//wire[15:0] code[90:0];
reg sysreset = 0;
reg clk50m = 0;
reg clk_async = 0;

// MCU target plus debugging supervisor and a code ROM for each.
wire[REGS_FLAT_WIDTH-1:0]     r_flat;
wire[TOP_REG:0] r_load;
wire[DEBUG_DATA_INPUT_NUM*16-1:0]   data_in_flat;
supervised_synapse316 mcu(
    .sysclk          (clk50m      ) ,
    .sysreset        (sysreset    ) ,
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
    for (i=0; i < DEBUG_DATA_INPUT_NUM; i=i+1) begin: data_in
        wire[15:0] d;
        assign data_in_flat[i*16+15:i*16] = d;
    end  
endgenerate     

// UART
// wire txbsy; // this wire was ineffective in fixing ambiguous muxa_comb.
// uart_v2_tx utx (
     // .uart_sample_clk(clk_async) // clocked at 4x bit rate.
    // ,.parallel_in    (regs[8].r[7:0])
    // ,.load_data      (regs[9].r[0])
    // ,.tx_line        (async_out)
    // ,.tx_busy        (txbsy)
// );    
// assign data_in[0].d = {15'd0, txbsy};
wire[7:0] atx_parallel_in = regs[8].r[7:0];
wire atx_load_data = regs[9].r[0];
wire txbsy;
assign #5000 txbsy = atx_load_data;
assign data_in[0].d = {15'd0, txbsy};

integer serial_file; 
integer trace_file; 
integer trace_compare_file;
initial	begin
    $dumpfile("testbench.vcd");
    $dumpvars;

    serial_file = $fopen("serial.txt");
    $fdisplay(serial_file, "\n\n================= POWER UP ================");
    trace_file = $fopen("trace.txt");
    $fdisplay(trace_file, "\n\n================= POWER UP ================");
    trace_compare_file = $fopen("../../icarus/trace_compare.txt", "r");

    #3000 sysreset = 1;
    #2000 sysreset = 0;
    #1000000 $stop;
end

// `define assert(condition, message) if(condition) begin $diplay(message); $finish(1); end

reg[7:0] code_ready_cnt = 0;
always begin
    // run at 1 MHz for easy viewing.
    #500 clk50m = 1;
        
    #300
    if (code_ready_cnt == 0)
        code_ready_cnt = 5;
    else
        code_ready_cnt = code_ready_cnt - 1;
    mcu.rom_wait = code_ready_cnt == 0;
        
    #200 clk50m = 0;    
end
   
always begin
    // run at actual 460,800 Hz for 115,200 bps.  4x desired bit rate.
    #1085 clk_async = ! clk_async;
end

// always @(posedge clk_async) begin
    // // write output and check for trouble.
    
    // if ( utx.load_data && ! txbsy )
        // $fwrite(serial_file, "%c", utx.parallel_in);   
// end

reg[15:0] compare_addr, compare_exr;
integer junk;
always @(posedge clk50m) begin
    // write output and check for trouble.
    
    if ( mcu.target.enable_exec ) begin
        // this is an executing instruction cycle.  trace it.    
        if (mcu.tg_code_addr != 0)
            junk = $fscanf(trace_compare_file, "%x : %x\n", compare_addr, compare_exr); 
        $fwrite(trace_file, "%04x : %04x     vs. %04x : %04x\n", mcu.tg_code_addr, mcu.target.exr, compare_addr, compare_exr);   
        if (mcu.tg_code_addr != 0) begin
            if( mcu.target.exr == 16'hffff ) 
                $fwrite(trace_file, "       ^^^^ ERROR INVALID INSTRUCTION\n");   
            if (mcu.tg_code_addr != compare_addr || mcu.target.exr != compare_exr)
                $fwrite(trace_file, "       ^^^^ ERROR TRACE MISMATCH\n");   
        end
    end
end
    
endmodule    
