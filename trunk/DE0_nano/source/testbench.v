`include "header.v"
`include "target_program_defines.v"

module testbench ();

wire async_out;
reg sysreset = 0;
reg clk50m = 0;
reg clk_async = 0;
reg clk_progmem = 0;
wire sysclk = clk50m;

// MCU target plus debugging supervisor and a code ROM for each.
//reg                       mcu_wait = 0;
wire                      mcu_wait;
wire[15:0]                r[`TOP_REG:0];
wire[`TOP_REG:0]          r_read;  
wire[`TOP_REG:0]          r_load;
wire[15:0]                r_load_data;  
wire[15:0]                dbg_av_address;
wire                      dbg_av_waitrequest;
wire[15:0]                dbg_av_writedata;
wire                      dbg_av_write;
wire                      async_rx_line;
wire                      async_tx_line;
supervised_synapse316 supmcu(
    .sysclk          (clk50m      ) ,
    .sysreset        (sysreset   ) ,
    .clk_progmem     (clk_progmem),
    .clk_async       (clk_async),
    .mcu_wait        (mcu_wait),
    .r               (r),
    .r_read          (r_read),
    .r_load          (r_load),
    .r_load_data     (r_load_data),
    .dbg_async_rx_line   (async_rx_line),
    .dbg_async_tx_line   (async_tx_line),
    .dbg_av_address      (dbg_av_address),
    .dbg_av_waitrequest  (dbg_av_waitrequest),
    .dbg_av_writedata    (dbg_av_writedata),
    .dbg_av_write        (dbg_av_write)
);    

std_reg gp_reg[`TOP_GP:0](sysclk, sysreset, r[`TOP_GP:0], r_load_data, r_load[`TOP_GP:0]);

stack_reg #(.DEPTH(32)) rstk(sysclk, sysreset, r[`DR_RSTK], r_load_data, r_load[`DR_RSTK], r_read[`DR_RSTK]);

reg[1:0] KEY = 0;
assign r[`SR_KEYS] = {14'h0, KEY}; 

// plumbing of target MCU outputs.
std_reg #(.WIDTH(8)) led_reg(sysclk, sysreset, r[`DR_LEDS], r_load_data[7:0], r_load[`DR_LEDS]);


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
    // #2000 KEY[0] = 1;
    // #2000 KEY[0] = 0;
    // #2000 KEY[0] = 1;
    // #2000 KEY[0] = 0;
    #10000000 $stop;
end

// `define assert(condition, message) if(condition) begin $diplay(message); $finish(1); end

reg[7:0] code_ready_cnt = 0;
always begin
    #5 clk_progmem = 0;
    #5 clk50m = 1; clk_progmem = 1;
    #5 clk_progmem = 0;
        
    #2
    if (code_ready_cnt == 0)
        code_ready_cnt = 5;
    else
        code_ready_cnt = code_ready_cnt - 1;
//    mcu_wait = 0; // code_ready_cnt == 0;
        
    #3 clk50m = 0;  clk_progmem = 1;  
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
    
    if ( supmcu.target.enable_exec ) begin
        // this is an executing instruction cycle.  trace it.    
        if (supmcu.tg_code_addr != 0)
            junk = $fscanf(trace_compare_file, "%x : %x\n", compare_addr, compare_exr); 
        $fwrite(trace_file, "%04x : %04x     vs. %04x : %04x\n", supmcu.tg_code_addr, supmcu.target.exr, compare_addr, compare_exr);   
        if (supmcu.tg_code_addr != 0) begin
            if( supmcu.target.exr == 16'hffff ) 
                $fwrite(trace_file, "       ^^^^ ERROR INVALID INSTRUCTION\n");   
            if (supmcu.tg_code_addr != compare_addr || supmcu.target.exr != compare_exr)
                $fwrite(trace_file, "       ^^^^ ERROR TRACE MISMATCH\n");   
        end
    end
end

// Avalon MM master.
// program should always write (or read) the address low register last, because accessing it triggers the Avalon transaction.
// that way, the program can read from the data register after it's copied data from Avalon, without triggering another read transaction.
std_reg av_ad_hi_reg(sysclk, sysreset, r[`DR_AV_AD_HI], r_load_data, r_load[`DR_AV_AD_HI]);
std_reg av_ad_lo_reg(sysclk, sysreset, r[`DR_AV_AD_LO], r_load_data, r_load[`DR_AV_AD_LO]);
wire av_waitrequest = 0;
reg av_write = 0;
reg av_read = 0;
reg[15:0] av_data_reg = 0;
assign r[`DR_AV_DATA] = av_data_reg;
wire[15:0] m0_readdata = 16'h3456;
always_ff @(posedge sysclk) begin
    if (av_write && ! av_waitrequest) begin
        av_write <= 0; // write transaction has ended.
    end else if (r_load[`DR_AV_AD_LO]) begin
        av_write <= 1; // begin write transaction.
    end else if (av_read && ! av_waitrequest) begin
        av_data_reg <= m0_readdata;
        av_read <= 0; // read transaction has ended.
    end else if (r_read[`DR_AV_AD_LO]) begin
        av_read <= 1; // begin read transaction.
    end
    if (r_load[`DR_AV_DATA] && ! av_read)
        av_data_reg <= r_load_data;
end
wire av_busy = (av_write || av_read) && av_waitrequest; // considering av_waitrequest avoids 1 needless wait state after every transaction.
assign mcu_wait = av_busy; // || code_ready_cnt == 0;
    
endmodule    
