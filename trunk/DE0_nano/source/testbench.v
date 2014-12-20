`include "header.v"
`include "target_program_defines.v"

module testbench ();

wire async_out;
reg sysreset = 0;
reg clk50m = 0;
reg clk_async = 0;
wire sysclk = clk50m;

// MCU target plus debugging supervisor and a code ROM for each.
reg                       mcu_wait = 0;
wire[15:0]                r[`TOP_REG:0];
wire[`TOP_REG:0]          r_read;  
wire[`TOP_REG:0]          r_load;
wire[15:0]                r_load_data;  
wire[15:0]                dbg_av_address;
wire                      dbg_av_waitrequest;
wire[15:0]                dbg_av_writedata;
wire                      dbg_av_write;
supervised_synapse316 mcu(
    .sysclk          (clk50m      ) ,
    .sysreset        (sysreset   ) ,
    .mcu_wait        (mcu_wait),
    .r               (r),
    .r_read          (r_read),
    .r_load          (r_load),
    .r_load_data     (r_load_data),
    .dbg_av_address      (dbg_av_address),
    .dbg_av_waitrequest  (dbg_av_waitrequest),
    .dbg_av_writedata    (dbg_av_writedata),
    .dbg_av_write        (dbg_av_write)
);    

std_reg gp_reg[`TOP_GP:0](sysclk, sysreset, r[`TOP_GP:0], r_load_data, r_load[`TOP_GP:0]);

stack_reg #(.DEPTH(32)) rstk(sysclk, sysreset, r[`DR_RSTK], r_load_data, r_load[`DR_RSTK]);

// plumbing of target MCU outputs.
std_reg #(.WIDTH(8)) led_reg(sysclk, sysreset, r[`DR_LEDS][7:0], r_load_data[7:0], r_load[`DR_LEDS]);

// UART
std_reg #(.WIDTH(8)) atx_data_reg(sysclk, sysreset, r[`DR_ATX_DATA][7:0], r_load_data[7:0], r_load[`DR_ATX_DATA]);
std_reg #(.WIDTH(1)) atx_ctrl_reg(sysclk, sysreset, r[`DR_ATX_CTRL][0], r_load_data[0], r_load[`DR_ATX_CTRL]);
uart_v2_tx utx (
     .uart_sample_clk(clk_async) // clocked at 4x bit rate.
    ,.parallel_in    (r[`DR_ATX_DATA][7:0])
    ,.load_data      (r[`DR_ATX_CTRL][0])
    ,.tx_line        (async_out)
    ,.tx_busy        (r[`DR_ATX_CTRL][1])
);    

// wire[7:0] atx_parallel_in = r[`DR_ATX_DATA][7:0];
// wire atx_load_data = r[`DR_ATX_CTRL][0];
// wire txbsy;
// assign #5000 txbsy = atx_load_data;
// assign r[`DR_ATX_CTRL][1] = txbsy;

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

    #1 sysreset = 1;
    #2000 sysreset = 0;
    #1000000 $stop;
end

// `define assert(condition, message) if(condition) begin $diplay(message); $finish(1); end

reg[7:0] code_ready_cnt = 0;
always begin
    #10 clk50m = 1;
        
    #7
    if (code_ready_cnt == 0)
        code_ready_cnt = 5;
    else
        code_ready_cnt = code_ready_cnt - 1;
    mcu_wait = code_ready_cnt == 0;
        
    #3 clk50m = 0;    
end
   
always begin
    // run at actual 460,800 Hz for 115,200 bps.  4x desired bit rate.
    #1085 clk_async = ! clk_async;
end

// always_ff @(posedge clk_async) begin
    // // write output and check for trouble.
    
    // if ( utx.load_data && ! txbsy )
        // $fwrite(serial_file, "%c", utx.parallel_in);   
// end

reg[15:0] compare_addr, compare_exr;
integer junk;
always_ff @(posedge clk50m) begin
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
