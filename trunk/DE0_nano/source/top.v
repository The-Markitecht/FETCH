`include "header.v"

module top (
    //////////// CLOCK //////////
    input 		          		clk50m,

    //////////// LED //////////
    output		     [7:0]		LED,

    //////////// KEY //////////
    input 		     [1:0]		KEY,

    // //////////// SW //////////
    // input 		     [3:0]		SW,

    // //////////// SDRAM //////////
    // output		    [12:0]		DRAM_ADDR,
    // output		     [1:0]		DRAM_BA,
    // output		          		DRAM_CAS_N,
    // output		          		DRAM_CKE,
    // output		          		DRAM_CLK,
    // output		          		DRAM_CS_N,
    // inout 		    [15:0]		DRAM_DQ,
    // output		     [1:0]		DRAM_DQM,
    // output		          		DRAM_RAS_N,
    // output		          		DRAM_WE_N,

    // //////////// EPCS //////////
    // output		          		EPCS_ASDO,
    // input 		          		EPCS_DATA0,
    // output		          		EPCS_DCLK,
    // output		          		EPCS_NCSO,

    // //////////// Accelerometer and EEPROM //////////
    // output		          		G_SENSOR_CS_N,
    // input 		          		G_SENSOR_INT,
    // output		          		I2C_SCLK,
    // inout 		          		I2C_SDAT,

    //////////// ADC //////////
    output		          		ADC_CS_N,
    output		          		ADC_SADDR,
    output		          		ADC_SCLK,
    input 		          		ADC_SDAT,

    //////////// 2x13 GPIO Header //////////
    output 		    [12:0]		GPIO_2
    //input 		     [2:0]		GPIO_2_IN

    // //////////// GPIO_0, GPIO_0 connect to GPIO Default //////////
    // inout 		    [33:0]		g0,
    // input 		     [1:0]		g0_IN,

    // //////////// GPIO_1, GPIO_1 connect to GPIO Default //////////
    // inout 		    [33:0]		g1,
    // input 		     [1:0]		g1_IN
);

////////////////////////////////////////////////////////////////////////////

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

// PLL for UARTs.
wire clk_async;          // 4x desired bit rate.  460,800 hz for 115,200 bps.   38,400 hz for 9,600 bps.
async_pll async_pll_inst (
    .inclk0 ( clk50m ),
    .c0 ( clk_async ),
    .locked (  )
);

// MCU target plus debugging supervisor and a code ROM for each.
wire[15:0]     r[`TOP_REG:0];
wire[`TOP_REG:0] r_load;
wire[15:0]   data_in[`DEBUG_DATA_INPUT_NUM-1:0];
wire[15:0]                dbg_av_address;
wire                      dbg_av_waitrequest;
wire[15:0]                dbg_av_writedata;
wire                      dbg_av_write;
supervised_synapse316 mcu(
    .sysclk          (clk50m      ) ,
    .sysreset        (0    ) ,
    .r               (r),
    .r_load          (r_load),
    .data_in         (data_in),
    .dbg_av_address      (dbg_av_address),
    .dbg_av_waitrequest  (dbg_av_waitrequest),
    .dbg_av_writedata    (dbg_av_writedata),
    .dbg_av_write        (dbg_av_write)
);    

assign LED = r[10][7:0];

// UART
wire txbsy; // this wire was ineffective in fixing ambiguous muxa_comb.
uart_v2_tx utx (
     .uart_sample_clk(clk_async) // clocked at 4x bit rate.
    ,.parallel_in    (r[8][7:0])
    ,.load_data      (r[9][0])
    ,.tx_line        (GPIO_2[11])
    ,.tx_busy        (txbsy)
);    
assign data_in[0] = {15'd0, txbsy};

// Qsys system including JTAG UART.
// in a Nios II Command Shell, type nios2-terminal --help, or just nios2-terminal.
qsys2 u0 (
    .clk_clk                      (clk50m),                      
    .reset_reset_n                (1),                
    .m0_address                   (dbg_av_address),                   
    .m0_read                      (0),                      
    .m0_waitrequest               (dbg_av_waitrequest),               
    .m0_readdata                  (),                  
    .m0_write                     (dbg_av_write),                     
    .m0_writedata                 (dbg_av_writedata),                 
    .generic_master_0_reset_reset ()  
);



endmodule
