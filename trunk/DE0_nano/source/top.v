`include "header.v"

module top (

//patch:
//output[15:0] out0,
//output[15:0] out1,

    //////////// CLOCK //////////
    input wire 		          		clk50m,

    //////////// LED //////////
    output wire		     [7:0]		LED,

    //////////// KEY //////////
    input wire 		     [1:0]		KEY,

    // //////////// SW //////////
    // input 		     [3:0]		SW,

    // //////////// SDRAM //////////
    // output wire		    [12:0]		DRAM_ADDR,
    // output wire		     [1:0]		DRAM_BA,
    // output wire		          		DRAM_CAS_N,
    // output wire		          		DRAM_CKE,
    // output wire		          		DRAM_CLK,
    // output wire		          		DRAM_CS_N,
    // inout  wire		    [15:0]		DRAM_DQ,
    // output wire		     [1:0]		DRAM_DQM,
    // output wire		          		DRAM_RAS_N,
    // output wire		          		DRAM_WE_N,

    // //////////// EPCS //////////
    // output wire		          		EPCS_ASDO,
    // input wire 		          		EPCS_DATA0,
    // output wire		          		EPCS_DCLK,
    // output wire		          		EPCS_NCSO,

    // //////////// Accelerometer and EEPROM //////////
    // output wire		          		G_SENSOR_CS_N,
    // input wire 		          		G_SENSOR_INT,
    // output wire		          		I2C_SCLK,
    // inout wire 		          		I2C_SDAT,

    //////////// ADC //////////
    output wire		          		ADC_CS_N,
    output wire		          		ADC_SADDR,
    output wire		          		ADC_SCLK,
    input wire 		          		ADC_SDAT,

    //////////// 2x13 GPIO Header //////////
    output wire 		    [12:0]		GPIO_2
    //input wire 		     [2:0]		GPIO_2_IN

    // //////////// GPIO_0, GPIO_0 connect to GPIO Default //////////
    // inout wire 		    [33:0]		g0,
    // input wire 		     [1:0]		g0_IN,

    // //////////// GPIO_1, GPIO_1 connect to GPIO Default //////////
    // inout wire 		    [33:0]		g1,
    // input wire 		     [1:0]		g1_IN
);

////////////////////////////////////////////////////////////////////////////

// clock and reset circuits.
wire sysclk = clk50m;
wire clk_async; // PLL output for UARTs.  4x desired bit rate.  460,800 hz for 115,200 bps.   38,400 hz for 9,600 bps.
wire clk_progmem; // PLL output for MCU program memory.  doubled relative to sysclk.  posedge aligned ( = 0 degree phase).
wire async_pll_lock;
async_pll async_pll_inst (
    .inclk0 ( sysclk ),
    .c0 ( clk_async ),
    .c1 ( clk_progmem ),
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
wire[3:0] anmux_ctrl =0; // dg408 pins en, a2, a1, a0
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

stack_reg #(.DEPTH(32)) rstk(sysclk, sysreset, r[`DR_RSTK], r_load_data, r_load[`DR_RSTK], r_read[`DR_RSTK]);

// plumbing of target MCU outputs.
std_reg #(.WIDTH(8)) led_reg(sysclk, sysreset, r[`DR_LEDS], r_load_data[7:0], r_load[`DR_LEDS]);
assign LED = r[`DR_LEDS][7:0];

// plumbing of target MCU inputs.
assign r[`SR_KEYS] = {14'h0, KEY}; 

//patch: synthesis debugging only.
//assign out0 = r[`DR_AV_WRITEDATA];
//assign out1 = r[`DR_AV_ADDRESS];

// // old direct wiring for software-driven avalon master
// std_reg av_writedata_reg(sysclk, sysreset, r[`DR_AV_WRITEDATA], r_load_data, r_load[`DR_AV_WRITEDATA]);
// wire[15:0] av_writedata             = r[`DR_AV_WRITEDATA];
// std_reg av_address_reg(sysclk, sysreset, r[`DR_AV_ADDRESS], r_load_data, r_load[`DR_AV_ADDRESS]);
// wire[15:0] av_address               = r[`DR_AV_ADDRESS];
// std_reg #(.WIDTH(2)) av_ctrl_reg(sysclk, sysreset, r[`DR_AV_CTRL], r_load_data[1:0], r_load[`DR_AV_CTRL]);
// wire av_write      = r[`DR_AV_CTRL][0];

// Avalon MM master.
// program should always write the data register last, because writing it triggers the Avalon transaction.
std_reg av_writedata_reg(sysclk, sysreset, r[`DR_AV_WRITEDATA], r_load_data, r_load[`DR_AV_WRITEDATA]);
std_reg av_address_reg(sysclk, sysreset, r[`DR_AV_ADDRESS], r_load_data, r_load[`DR_AV_ADDRESS]);
wire av_waitrequest;
reg av_write = 0;
reg av_read = 0;
always_ff @(posedge sysclk) begin
    if (av_write && ! av_waitrequest)
        av_write <= 0; // write transaction has ended.
    else if (r_load[`DR_AV_WRITEDATA])
        av_write <= 1; // begin write transaction.
end
wire av_busy = (av_write || av_read) && av_waitrequest; // considering av_waitrequest avoids 1 needless wait state after every transaction.
assign mcu_wait = av_busy;

////////////////////////////////////
// Warning (12251): avalon_jtag_slave does not have byteenables. 
// Writes from narrow master generic_master_0.m0 may result in data corruption.
/////////////////////////////////////

// Qsys system including JTAG UART.
// in a Nios II Command Shell, type nios2-terminal --help, or just nios2-terminal.
qsys2 u0 (
    .clk_clk                      (sysclk),                      
    .reset_reset_n                ( ! sysreset),                
    .m0_address                   (r[`DR_AV_ADDRESS]),                   
    .m0_read                      (0),                      
    .m0_waitrequest               (av_waitrequest),               
    .m0_readdata                  (),                  
    .m0_write                     (av_write),                     
    .m0_writedata                 (r[`DR_AV_WRITEDATA]),                 
    .generic_master_0_reset_reset ()  
);

// UART
std_reg #(.WIDTH(8)) atx_data_reg(sysclk, sysreset, r[`DR_ATX_DATA], r_load_data[7:0], r_load[`DR_ATX_DATA]);
wire[15:0] atxc;
wire txbsy;
assign r[`DR_ATX_CTRL] = {atxc[15:2], txbsy, atxc[0]};
std_reg #(.WIDTH(1)) atx_ctrl_reg(sysclk, sysreset, atxc, r_load_data[0], r_load[`DR_ATX_CTRL]);
uart_v2_tx utx (
     .uart_sample_clk(clk_async) // clocked at 4x bit rate.
    ,.parallel_in    (r[`DR_ATX_DATA][7:0])
    ,.load_data      (r[`DR_ATX_CTRL][0])
    ,.tx_line        (GPIO_2[11])
    ,.tx_busy        (txbsy)
);    



endmodule
