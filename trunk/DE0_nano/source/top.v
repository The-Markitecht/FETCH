`include "header.v"
`include "target_program_defines.v"

module top (
    (* chip_pin = "R8" *) input wire clk50m,

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

    (* chip_pin = "G15" *) input wire   reserved,
    
    (* chip_pin = "F13" *) output wire  async_tx_line,
    (* chip_pin = "T9" *)  input wire   async_rx_line,

    (* chip_pin = "G16" *) output wire  dbg_async_tx_line,
    (* chip_pin = "F14" *)  input wire  dbg_async_rx_line,
    
    (* chip_pin = "M15, B9, T8, M1" *)  input wire[3:0]  dip_switch,
    
    
    
    
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
reg[5:0] counter1m = 0;
always_ff @(posedge sysclk) 
    counter1m <= (counter1m == 6'd50 ? 6'd0 : counter1m + 6'd1);
wire pulse1m = (counter1m == 6'd0);
reg[9:0] counter1k = 0;
always_ff @(posedge sysclk) 
    counter1k <= (counter1k == 10'd1000 ? 10'd0 : counter1k + 10'd1);
wire pulse1k = (counter1k == 10'd0);

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
wire                      mcu_wait;
supervised_synapse316 supmcu(
    .sysclk          (sysclk      ) ,
    .sysreset        (sysreset    ) ,
    .clk_progmem     (clk_progmem),
    .clk_async       (clk_async),
    .mcu_wait        (mcu_wait),
    .boot_break      ( ! dip_switch[3]), 
    .r               (r),
    .r_read          (r_read),
    .r_load          (r_load),
    .r_load_data     (r_load_data),
    .dbg_async_rx_line   (dbg_async_rx_line),
    .dbg_async_tx_line   (dbg_async_tx_line)
);    

// ///////////////////////////   plumbing of target MCU I/O.

// GP register file and a stack.
std_reg gp_reg[`TOP_GP:0](sysclk, sysreset, r[`TOP_GP:0], r_load_data, r_load[`TOP_GP:0]);
stack_reg #(.DEPTH(32)) rstk(sysclk, sysreset, r[`DR_RSTK], r_load_data, r_load[`DR_RSTK], r_read[`DR_RSTK]);

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

// full-duplex UART with FIFO's.
fduart uart (
     .sysclk        ( sysclk )    
    ,.sysreset      ( sysreset )
    ,.clk_async     ( clk_async )   // clocked at 4x bit rate.     
    ,.async_rx_line ( async_rx_line )  
    ,.async_tx_line ( async_tx_line )
    ,.status_out    ( r[`DR_FDUART_STATUS] )    
    ,.data_in       ( r_load_data )
    ,.atx_reg_load  ( r_load[`DR_FDUART_DATA] )
    ,.arx_reg_out   ( r[`DR_FDUART_DATA] )     
    ,.arx_reg_read  ( r_read[`DR_FDUART_DATA] )
);  

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

// ///////////////////////////   I/O expansion bus.
wire[15:0]                exp_r[`EXP_TOP_REG:0];
wire[`EXP_TOP_REG:0]      exp_r_read;  
wire[`EXP_TOP_REG:0]      exp_r_load;
wire[15:0]                exp_r_load_data;  
bus_expander #(.NUM_REGS(`EXP_NUM_REGS)) expand(
     .sysclk            (sysclk)
    ,.sysreset          (sysreset)
    ,.data_out          (r[`DR_EXP])
    ,.data_in           (r_load_data)
    ,.data_load         (r_load[`DR_EXP])
    ,.data_read         (r_read[`DR_EXP])
    ,.address_out       (r[`DR_EXP_ADDR])
    ,.address_load      (r_load[`DR_EXP_ADDR])
    ,.r                 (exp_r)
    ,.r_read            (exp_r_read)
    ,.r_load            (exp_r_load)
    ,.r_load_data       (exp_r_load_data)    
);

std_reg #(.WIDTH(8)) led_reg(sysclk, sysreset, exp_r[`EDR_LEDS], exp_r_load_data[7:0], exp_r_load[`EDR_LEDS]);
assign LED = exp_r[`EDR_LEDS][7:0];

assign exp_r[`ESR_KEYS] = {14'h0, KEY}; 

std_reg #(.WIDTH(4)) anmux_ctrl_reg(sysclk, sysreset, exp_r[`EDR_ANMUX_CTRL], exp_r_load_data[3:0], exp_r_load[`EDR_ANMUX_CTRL]);
assign anmux_ctrl = exp_r[`EDR_ANMUX_CTRL][3:0];

// ustimer0 counts down on microseconds.
wire ustimer0_expired;
cdtimer16 ustimer0 (
     .sysclk          ( sysclk )  
    ,.sysreset        ( sysreset )  
    ,.data_out        ( r[`DR_USTIMER0] )
    ,.data_in         ( r_load_data )  
    ,.load            ( r_load[`DR_USTIMER0] )
    ,.counter_event   ( pulse1m )
    ,.expired         ( ustimer0_expired )
);

// mstimer0 counts down on milliseconds.
wire mstimer0_expired;
cdtimer16 timer1 (
     .sysclk          ( sysclk )  
    ,.sysreset        ( sysreset )  
    ,.data_out        ( r[`DR_MSTIMER0] )
    ,.data_in         ( r_load_data )  
    ,.load            ( r_load[`DR_MSTIMER0] )
    ,.counter_event   ( pulse1k )
    ,.expired         ( mstimer0_expired )
);

std_reg #(.WIDTH(4)) soft_event_reg(sysclk, sysreset, r[`DR_SOFT_EVENT], r_load_data[3:0], r_load[`DR_SOFT_EVENT]);

// event controller is listed last to utilize wires from all other parts.
event_controller #(.NUM_INPUTS(12)) events( 
     .sysclk            (sysclk)
    ,.sysreset          (sysreset)
    ,.priority_out      (r[`DR_EVENT_PRIORITY])
    ,.priority_load     (r_load[`DR_EVENT_PRIORITY])
    ,.data_in           (r_load_data)
    ,.event_signals     ({
        // MOST urgent events are listed FIRST.
        1'b0 // the zero-priority event is hardwired to zero for this app.  it would override all others.
        , ! r[`DR_FDUART_STATUS][`ARX_FIFO_EMPTY_BIT]
        , r[`DR_FDUART_STATUS][`ARX_FIFO_FULL_BIT]
        , r[`DR_FDUART_STATUS][`ATX_FIFO_FULL_BIT]
        ,ustimer0_expired
        ,mstimer0_expired
        ,KEY[0]
        ,KEY[1]
        ,r[`DR_SOFT_EVENT][3:0]
    })
);


endmodule
