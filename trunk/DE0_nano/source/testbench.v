`include "header.v"
`include "target_program_defines.v"

module testbench ();

wire		    [12:0]		DRAM_ADDR;
wire		     [1:0]		DRAM_BA;
wire		          		DRAM_CAS_N;
wire		          		DRAM_CKE;
wire		          		DRAM_CLK;
wire		          		DRAM_CS_N;
wire		    [15:0]		DRAM_DQ;
wire		     [1:0]		DRAM_DQM;
wire		          		DRAM_RAS_N;
wire		          		DRAM_WE_N;
wire async_out;

reg clk50m = 0;
// yes, you can simulate the PLL with ModelSim.  but it's much slower than driving those clocks explicitly.

// clock and reset circuits.
wire sysclk = clk50m;
wire clk_async; // PLL output for UARTs.  4x desired bit rate.  460,800 hz for 115,200 bps.   38,400 hz for 9,600 bps.
wire clk_progmem; // PLL output for MCU program memory.  doubled relative to sysclk.  posedge aligned ( = 0 degree phase).
wire clk_sdram; // PLL output for SDRAM chip.  doubled relative to sysclk.  -60 degree phase.
wire async_pll_lock;
async_pll async_pll_inst (
    .inclk0 ( sysclk ),
    .c0 ( clk_async ),
    .c1 ( clk_progmem ),
    .c2 ( clk_sdram ),
    .locked ( async_pll_lock )
);
reg rst0 = 1, rst1 = 1, rst2 = 1;
always_ff @(posedge sysclk) begin
    rst0 <= ! async_pll_lock; // hold sysreset high until 3 cycles after async_pll_lock.
    rst1 <= rst0;
    rst2 <= rst1;
end
wire sysreset = rst2;

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

    // #1 sysreset = 1;
    // #2000 sysreset = 0;
    // #2000 KEY[0] = 1;
    // #2000 KEY[0] = 0;
    // #2000 KEY[0] = 1;
    // #2000 KEY[0] = 0;
    #10000000 $stop;
end

// `define assert(condition, message) if(condition) begin $diplay(message); $finish(1); end

reg[7:0] code_ready_cnt = 0;
always begin
    #5 // clk_progmem = 0;
    #5 clk50m = 1; // clk_progmem = 1;
    #5 // clk_progmem = 0;
        
    #2
    if (code_ready_cnt == 0)
        code_ready_cnt = 5;
    else
        code_ready_cnt = code_ready_cnt - 1;
//    mcu_wait = 0; // code_ready_cnt == 0;
        
    #3 clk50m = 0;  // clk_progmem = 1;  
end
   
// always begin
    // // run at actual 460,800 Hz for 115,200 bps.  4x desired bit rate.
    // #1085 clk_async = ! clk_async;
// end
    
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

assign async_rx_line = supmcu.visr.urx.LINE_IDLE_LEVEL;

// Avalon MM master.
// program should always write (or read) the "write data" register last, because accessing it triggers the Avalon transaction.
// that way, the program can read from the "read data" register after it's copied data from Avalon, without triggering another read transaction.
wire av_waitrequest;
reg av_write = 0;
reg av_read = 0;
wire av_read_capture = av_read && ~ av_waitrequest; // 1 during the cycle following the end of av_waitrequest.
wire[15:0] m0_readdata;
std_reg av_ad_hi_reg(sysclk, sysreset, r[`DR_AV_AD_HI], r_load_data, r_load[`DR_AV_AD_HI]);
std_reg av_ad_lo_reg(sysclk, sysreset, r[`DR_AV_AD_LO], r_load_data, r_load[`DR_AV_AD_LO]);
std_reg av_write_data_reg(sysclk, sysreset, r[`DR_AV_WRITE_DATA], r_load_data, r_load[`DR_AV_WRITE_DATA]);
std_reg av_read_data_reg(sysclk, sysreset, r[`SR_AV_READ_DATA], m0_readdata, av_read_capture);
// reg av_write_begin = 0;
// reg av_write_hold = 0;
// wire av_write = av_write_begin || (av_write_hold && av_waitrequest);
// always_ff @(posedge sysclk) begin
    // if (av_write_begin) begin
        // av_write_begin <= 0; // move to 2nd step of write transaction, where av_write ends as soon as av_waitrequest ends, mid-cycle.
    // end else if (r_load[`DR_AV_AD_LO]) begin
        // av_write_begin <= 1; // begin write transaction.
        // av_write_hold <= 1; // set up this register right away, to prevent a glitch in av_write at the end of the next clock cycle.
    // end
// end
always_ff @(posedge sysclk) begin
    if (av_write && ! av_waitrequest) begin
        av_write <= 0; // write transaction has ended.
    end else if (r_load[`DR_AV_WRITE_DATA]) begin
        av_write <= 1; // begin write transaction.
    end else if (av_read_capture) begin 
        av_read <= 0; // read transaction has ended.  will capture data on the next cycle.
    end else if (r_read[`DR_AV_WRITE_DATA]) begin
        av_read <= 1; // begin read transaction. 
    end
end
wire av_busy = (av_write || av_read || av_read_capture); // && av_waitrequest; // considering av_waitrequest avoids 1 needless wait cycle at the end of every transaction. NO - it turns out that cycle is needed, at least for correct reads.  back-to-back writes might be risky too.
assign mcu_wait = av_busy;

// Qsys system including JTAG UART.
// in a Nios II Command Shell, type nios2-terminal --help, or just nios2-terminal.
qsys2 u0 (
    .clk_clk                      (sysclk),                      
    .reset_reset_n                ( ! sysreset),                
    .m0_address                   ({r[`DR_AV_AD_HI], r[`DR_AV_AD_LO]}),                   
    .m0_read                      (av_read),                      
    .m0_waitrequest               (av_waitrequest),               
    .m0_readdata                  (m0_readdata),                  
    .m0_write                     (av_write),                     
    .m0_writedata                 (r[`DR_AV_WRITE_DATA]),                 
    .generic_master_1_reset_reset ()  ,
    .sdramc_addr                  (DRAM_ADDR),
    .sdramc_ba                    (DRAM_BA),
    .sdramc_cas_n                 (DRAM_CAS_N),
    .sdramc_cke                   (DRAM_CKE),
    .sdramc_cs_n                  (DRAM_CS_N),
    .sdramc_dq                    (DRAM_DQ),
    .sdramc_dqm                   (DRAM_DQM),
    .sdramc_ras_n                 (DRAM_RAS_N),
    .sdramc_we_n                  (DRAM_WE_N)    
);
assign DRAM_CLK = clk_sdram;
    
endmodule    
