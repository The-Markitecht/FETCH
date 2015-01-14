`include "header.v"

module top (
    input wire 		          		clk50m,

    output wire		     [7:0]		LED, // active HIGH
    input wire 		     [1:0]		KEY, // active LOW
    // input 		     [3:0]		SW,

    output wire		    [12:0]		DRAM_ADDR,
    output wire		     [1:0]		DRAM_BA,
    output wire		          		DRAM_CAS_N,
    output wire		          		DRAM_CKE,
    output wire		          		DRAM_CLK,
    output wire		          		DRAM_CS_N,
    inout  wire		    [15:0]		DRAM_DQ,
    output wire		     [1:0]		DRAM_DQM,
    output wire		          		DRAM_RAS_N,
    output wire		          		DRAM_WE_N,

    // output wire		          		EPCS_ASDO,
    // input wire 		          		EPCS_DATA0,
    // output wire		          		EPCS_DCLK,
    // output wire		          		EPCS_NCSO,

    // //////////// Accelerometer and EEPROM //////////
    // output wire		          		G_SENSOR_CS_N,
    // input wire 		          		G_SENSOR_INT,
    // output wire		          		I2C_SCLK,
    // inout wire 		          		I2C_SDAT,

    output wire		          		ADC_CS_N,
    output wire		          		ADC_SADDR,
    output wire		          		ADC_SCLK,
    input wire 		          		ADC_SDAT,

    input wire                          reserved,
    output wire                         async_tx_line,
    input wire                          async_rx_line,
    output wire 		    [9:0]		GPIO_2
    //input wire 		     [2:0]		GPIO_2_IN

    // inout wire 		    [33:0]		g0,
    // input wire 		     [1:0]		g0_IN,

    // inout wire 		    [33:0]		g1,
    // input wire 		     [1:0]		g1_IN
);

////////////////////////////////////////////////////////////////////////////

// clock and reset circuits.
wire sysclk = clk50m;
wire clk_async; // PLL output for UARTs.  4x desired bit rate.  460,800 hz for 115,200 bps.   38,400 hz for 9,600 bps.
wire clk_progmem; // PLL output for MCU program memory.  doubled relative to sysclk.  posedge aligned ( = 0 degree phase).
wire clk_sdram; // PLL output for SDRAM chip.  doubled relative to sysclk.  -60 degree phase.
wire clk_spi; // PLL output for SPI bus.  2 Mhz.
wire async_pll_lock;
async_pll async_pll_inst (
    .inclk0 ( sysclk ),
    .c0 ( clk_async ),
    .c1 ( clk_progmem ),
    .c2 ( clk_sdram ),
    .c3 ( clk_spi ),
    .locked ( async_pll_lock )
);
reg rst0 = 1, rst1 = 1, rst2 = 1;
always_ff @(posedge sysclk) begin
    rst0 <= ! async_pll_lock; // hold sysreset high until 3 cycles after async_pll_lock.
    rst1 <= rst0;
    rst2 <= rst1;
end
wire sysreset = rst2;

// dg408 -  JP3 -   schem -     fpga -  verilog -   nios bit
// en =2    8       gpio_23     c16     gpio_2[3]   3
// a2 =15   7       gpio_22     c14     gpio_2[2]   2
// a1 =16   5       gpio_20     a14     gpio_2[0]   1
// a0 =1    6       gpio_21     b16     gpio_2[1]   0
wire[3:0] anmux_ctrl; // dg408 pins en, a2, a1, a0
assign GPIO_2[3] = anmux_ctrl[3];
assign GPIO_2[2] = anmux_ctrl[2];
assign GPIO_2[0] = anmux_ctrl[1];
assign GPIO_2[1] = anmux_ctrl[0];

// MCU target plus debugging supervisor and a code ROM for each.
wire[15:0]                r[`TOP_REG:0];
wire[`TOP_REG:0]          r_read;  
wire[`TOP_REG:0]          r_load;
wire[15:0]                r_load_data;  
wire[15:0]                dbg_av_address;
wire                      dbg_av_waitrequest;
wire[15:0]                dbg_av_writedata;
wire                      dbg_av_write;
wire                      mcu_wait;
supervised_synapse316 supmcu(
    .sysclk          (sysclk      ) ,
    .sysreset        (sysreset    ) ,
    .clk_progmem     (clk_progmem),
    .clk_async       (clk_async),
    .mcu_wait        (mcu_wait),
    .boot_break      (KEY[0]), // KEY is active LOW.  so press KEY 0 (low) to avoid breaking & directly run the target program.
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

// plumbing of target MCU I/O.
std_reg #(.WIDTH(8)) led_reg(sysclk, sysreset, r[`DR_LEDS], r_load_data[7:0], r_load[`DR_LEDS]);
assign LED = r[`DR_LEDS][7:0];

assign r[`SR_KEYS] = {14'h0, KEY}; 

std_reg #(.WIDTH(4)) anmux_ctrl_reg(sysclk, sysreset, r[`DR_ANMUX_CTRL], r_load_data[3:0], r_load[`DR_ANMUX_CTRL]);
assign anmux_ctrl = r[`DR_ANMUX_CTRL][3:0];

wire[15:0] de0nadc_ctrl;
std_reg #(.WIDTH(3)) de0nano_adc_ctrl_reg(sysclk, sysreset, de0nadc_ctrl, r_load_data[2:0], r_load[`DR_DE0NANO_ADC_CTRL]);
assign r[`DR_DE0NANO_ADC_CTRL] = {15'b0, ADC_SDAT};         
assign ADC_CS_N =  de0nadc_ctrl[2];
assign ADC_SCLK =  de0nadc_ctrl[1];
assign ADC_SADDR = de0nadc_ctrl[0];
assign GPIO_2[9] = ADC_SCLK;
assign GPIO_2[8] = ADC_CS_N;
assign GPIO_2[7] = ADC_SADDR;
assign GPIO_2[6] = ADC_SDAT;

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
