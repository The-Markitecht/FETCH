`include <header.v>
`include "target_program_defines.v"

module top (
     (* chip_pin = "R8" *) input wire clk50m

    ,output wire		     [7:0]		LED // active HIGH
    ,input wire 		     [1:0]		KEY // active LOW
    // ,input 		     [3:0]		SW

    ,output wire		    [12:0]		DRAM_ADDR
    ,output wire		     [1:0]		DRAM_BA
    ,output wire		          		DRAM_CAS_N
    ,output wire		          		DRAM_CKE
    ,output wire		          		DRAM_CLK
    ,output wire		          		DRAM_CS_N
    ,inout  wire		    [15:0]		DRAM_DQ
    ,output wire		     [1:0]		DRAM_DQM
    ,output wire		          		DRAM_RAS_N
    ,output wire		          		DRAM_WE_N

    // ,output wire		          		EPCS_ASDO
    // ,input wire 		          		EPCS_DATA0
    // ,output wire		          		EPCS_DCLK
    // ,output wire		          		EPCS_NCSO

    // //////////// Accelerometer and EEPROM //////////
    // ,output wire		          		G_SENSOR_CS_N
    // ,input wire 		          		G_SENSOR_INT
    // ,output wire		          		I2C_SCLK
    // ,inout wire 		          		I2C_SDAT

    ,output wire		          		ADC_CS_N
    ,output wire		          		ADC_SADDR
    ,output wire		          		ADC_SCLK
    ,input wire 		          		ADC_SDAT

    ,(* chip_pin = "C16, C14, A14, B16" *) output wire[3:0] anmux_ctrl
    
    ,(* chip_pin = "M15, B9, T8, M1" *)  input wire[3:0]  dip_switch
    
    ,(* chip_pin = "G15" *) input wire   reserved
    
    ,(* chip_pin = "F13" *) output wire  async_tx_line
    ,(* chip_pin = "T9" *)  input wire   async_rx_line
    
    ,(* chip_pin = "G16" *) output wire  dbg_async_tx_line
    ,(* chip_pin = "F14" *)  input wire  dbg_async_rx_line
    
    ,(* chip_pin = "T13, T15" *) output wire[1:0]  scope
    
    ,(* chip_pin = "C15" *) output wire power_relay_pwm
    ,(* chip_pin = "E16" *) input wire  power_lost
    ,(* chip_pin = "M16" *) input wire  ignition_switch_off
    
    ,(* chip_pin = "D16" *) output wire beeper_enable
    
    ,(* chip_pin = "D14" *) output wire ftdi_power
    
    ,(* chip_pin = "A8" *) input wire  ign_coil_wht_lo
    ,(* chip_pin = "C9" *) output wire injector1_open
    
    //,output wire 		    [9:0]		GPIO_2
    //,input wire 		     [2:0]		GPIO_2_IN
      
    //, inout wire 		    [33:0]		g0
    //, input wire 		     [1:0]		g0_IN
      
    //, inout wire 		    [33:0]		g1
    //, input wire 		     [1:0]		g1_IN
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

// realtime counters.  first the 1 MHz.  divide sysclk by 50.
wire timer_enable;
reg[5:0] counter1m = 0;
wire pulse1m_ungated = (counter1m == 6'd49);
wire pulse1m = pulse1m_ungated && timer_enable;
always_ff @(posedge sysclk) 
    counter1m <= (pulse1m ? 6'd0 : counter1m + 6'd1);
// slower realtime counters.  these are dividers fed by the 1 MHz.    
wire pulse50k;
cdtimer16 counter50k (
     .sysclk          ( sysclk )  
    ,.sysreset        ( sysreset )  
    ,.data_out        (  )
    ,.data_in         ( 16'd20 )  
    ,.load            ( pulse50k )
    ,.counter_event   ( pulse1m )
    ,.expired         ( pulse50k )
);
wire pulse1k;
cdtimer16 counter1k (
     .sysclk          ( sysclk )  
    ,.sysreset        ( sysreset )  
    ,.data_out        (  )
    ,.data_in         ( 16'd50 )  
    ,.load            ( pulse1k )
    ,.counter_event   ( pulse50k )
    ,.expired         ( pulse1k )
);

// alternate realtime counters.
/* use flop's "clear" input to eliminate data muxers.  
but somehow this doesn't increment counter1k at all.
reg[5:0] counter1m = 0;
wire pulse1m = (counter1m == 6'd50);
always_ff @(posedge sysclk, posedge pulse1m) 
    counter1m <= (pulse1m ? 6'd0 : counter1m + 6'd1);
reg[9:0] counter1k = 0;
wire pulse1k = (counter1k == 10'd1000);
always_ff @(posedge sysclk, posedge pulse1k) 
    if (pulse1k)
        counter1k <= 0;
    else if (pulse1m)
        counter1k <= counter1k + 10'd1;        
*/        

// synchronizers for detecting off-chip events.
wire power_lost_sync;
syncer power_lost_syncer(sysclk, power_lost, power_lost_sync);
wire ignition_switch_off_sync;
syncer ignition_switch_syncer(sysclk, ignition_switch_off, ignition_switch_off_sync);
        
// MCU target plus debugging supervisor and a code ROM for each.
wire[15:0]                r[`TOP_REG:0];
wire[`TOP_REG:0]          r_read;  
wire[`TOP_REG:0]          r_load;
wire[15:0]                r_load_data;  
wire                      mcu_wait;
wire                      visor_break_mode;
assign timer_enable = ! visor_break_mode;
supervised_synapse316 supmcu(
    .sysclk          (sysclk      ) ,
    .sysreset        (sysreset    ) ,
    .clk_progmem     (clk_progmem),
    .clk_async       (clk_async),
    .mcu_wait_in     (mcu_wait),
    .visor_break_mode(visor_break_mode),
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

/* commented out to clean up the build 2019-08-03
// Altera 16x16=32 multiplier.  see settings for latency.
multiplier	multiplier_inst (
    .clock ( sysclk ),
    .dataa ( r[0] ),
    .datab ( r[1] ),
    .result ( {r[`SR_PRODUCT_HI], r[`SR_PRODUCT_LO]} )
);
*/

// ADC SPI.  SPI_CLOCK_DIVISOR(50) = 1mhz spi_sck = 16us/read.
wire spi_busy;
spi_master #(.WIDTH(16), .SPI_CLOCK_DIVISOR(50)) spi (
     .sysclk                (sysclk)
    ,.sysreset              (sysreset)
    ,.mi_data               (r[`DR_SPI_DATA])
    ,.mo_data               (r_load_data)
    ,.mo_load               (r_load[`DR_SPI_DATA])
    ,.busy                  (spi_busy)
    ,.spi_mo                (ADC_SADDR)
    ,.spi_cs                (ADC_CS_N)
    ,.spi_sck               (ADC_SCLK)
    ,.spi_mi                (ADC_SDAT)
);

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
// 2015/04: suspect strange program bugs in the cycles immediately following a SDRAM write.
// i was unable to read from usage_counter in some of those cycles.  read 0 instead.  need testing.
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

/* commented out to clean up the build 2019-08-03
// data ROM for lookup tables etc.
data_rom drom (
    .address ( r_load_data ),
    .clken ( ! r_load[`DR_DROM_AD] ), 
    .clock ( sysclk ),
    .q ( r[`SR_DROM_DATA] )
);
*/

/*  bus_expander does not seem to read back correctly from a non-zero address.
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
*/

std_reg #(.WIDTH(8)) led_reg(sysclk, sysreset, r[`DR_LEDS], r_load_data[7:0], r_load[`DR_LEDS]);
//assign LED = { ! ignition_switch_off_sync, r[`DR_LEDS][6:0]};

wire[14:0] ftdi_junk;
wire[14:0] beep_junk;
assign r[`DR_BOARD_CTRL] = {8'h0, ftdi_power, beeper_enable, KEY[1:0], dip_switch[3:0]}; 
std_reg #(.WIDTH(1)) beep_en_reg(sysclk, sysreset, {beep_junk[14:0], beeper_enable}, r_load_data[`BEEPER_ENABLE_BIT], r_load[`DR_BOARD_CTRL]);
std_reg #(.WIDTH(1)) ftdi_power_reg(sysclk, sysreset, {ftdi_junk[14:0], ftdi_power}, r_load_data[`FTDI_POWER_BIT], r_load[`DR_BOARD_CTRL]);

std_reg #(.WIDTH(4)) anmux_ctrl_reg(sysclk, sysreset, r[`DR_ANMUX_CTRL], r_load_data[3:0], r_load[`DR_ANMUX_CTRL]);
assign anmux_ctrl = r[`DR_ANMUX_CTRL][3:0];
// dg408 -  JP3 -   schem -     fpga -  verilog -   mcu bit
// en =2    8       gpio_23     c16     gpio_2[3]   3
// a2 =15   7       gpio_22     c14     gpio_2[2]   2
// a1 =16   5       gpio_20     a14     gpio_2[0]   1
// a0 =1    6       gpio_21     b16     gpio_2[1]   0

// ustimer's count down on microseconds.
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

// mstimer's count down on milliseconds.
wire mstimer0_expired;
cdtimer16 mstimer0 (
     .sysclk          ( sysclk )  
    ,.sysreset        ( sysreset )  
    ,.data_out        ( r[`DR_MSTIMER0] )
    ,.data_in         ( r_load_data )  
    ,.load            ( r_load[`DR_MSTIMER0] )
    ,.counter_event   ( pulse1k )
    ,.expired         ( mstimer0_expired )
);
wire mstimer1_expired;
cdtimer16 mstimer1 (
     .sysclk          ( sysclk )  
    ,.sysreset        ( sysreset )  
    ,.data_out        ( r[`DR_MSTIMER1] )
    ,.data_in         ( r_load_data )  
    ,.load            ( r_load[`DR_MSTIMER1] )
    ,.counter_event   ( pulse1k )
    ,.expired         ( mstimer1_expired )
);
wire mstimer2_expired;
cdtimer16 mstimer2 (
     .sysclk          ( sysclk )  
    ,.sysreset        ( sysreset )  
    ,.data_out        ( r[`DR_MSTIMER2] )
    ,.data_in         ( r_load_data )  
    ,.load            ( r_load[`DR_MSTIMER2] )
    ,.counter_event   ( pulse1k )
    ,.expired         ( mstimer2_expired )
);

// PWM generator to drive the computer's main power relay.  counts microseconds.  count 50 = 20 KHz.
wire[5:0] power_duty;
cdpwm #(.WIDTH(6), .START(50)) power_relay_pwm_inst (
     .sysclk          ( sysclk )  
    ,.sysreset        ( sysreset )  
    ,.counter_event   ( pulse1m_ungated ) // must be ungated, so the relay keeps working while the visor pauses the target MCU.
    ,.counter_value   (  )
    ,.duty            ( power_duty )
    ,.duty_load       ( r_load[`DR_POWER_DUTY] )
    ,.data_in         ( r_load_data[5:0] )
    ,.pwm_signal      ( power_relay_pwm )
);
assign r[`DR_POWER_DUTY] = {8'd0, ignition_switch_off_sync, power_lost_sync, power_duty[5:0]};

// MCU usage counter
usage_counter usage (
     .sysclk               ( sysclk )
    ,.sysreset             ( sysreset )
    ,.counter_out          ( r[`DR_USAGE_COUNT] )
    ,.counter_reset        ( r_load[`DR_USAGE_COUNT] )
    ,.observable_pulse     ( r_read[`DR_EVENT_PRIORITY] )
    ,.sample_enable        ( pulse1k )
);      

// ignition time capture.  synchronize signal, detect rising edge, copy up-counter to capture register then, and reset up-counter.
wire ign_coil_wht_hi = ! ign_coil_wht_lo;
wire ign_coil_sync;
syncer ign_coil_syncer (sysclk, ign_coil_wht_hi, ign_coil_sync);
reg last_ign_coil = 0;
wire ignition_edge = ign_coil_sync && ! last_ign_coil;
wire ignition_capture = ignition_edge && (ign_capture_cnt > `WW'd80);
    // noise blanking occurs at 80 jf = 1.6 ms = 8750 RPM.
reg[`WMSB:0] ign_capture_cnt = 0;
wire ignition_capture_timeout = ign_capture_cnt[`WMSB];
    // timeout occurs at 32768 jf = 0.65 seconds = about 22 RPM.
always_ff @(posedge sysclk) begin
    last_ign_coil <= ign_coil_sync;  
    if (ignition_capture || ignition_capture_timeout)
        ign_capture_cnt <= 0;
    else if (pulse50k)
        ign_capture_cnt <= ign_capture_cnt + `WW'd1;        
end
std_reg ign_capture_jf_reg(sysclk, sysreset, r[`SR_IGN_CAPTURE_JF], ign_capture_cnt, ignition_capture);

// fuel injector driver.
std_reg puff_len_reg(sysclk, sysreset, r[`DR_PUFF_LEN_US], r_load_data, r_load[`DR_PUFF_LEN_US]);
std_reg ign_timeout_len_reg(sysclk, sysreset, r[`DR_IGN_TIMEOUT_LEN_JF], r_load_data, r_load[`DR_IGN_TIMEOUT_LEN_JF]);
wire puff1_event;
wire inj;
assign injector1_open = dip_switch[0] ? inj : ign_coil_sync;
puff_timer puff1 (
     .sysclk                (sysclk)
    ,.sysreset              (sysreset)
    ,.pulse50k              (pulse50k)
    ,.pulse1m               (pulse1m)
    ,.ign_coil              (ign_coil_sync)
    ,.ign_timeout_len_jf    (r[`DR_IGN_TIMEOUT_LEN_JF])
    ,.puff_len_us           (r[`DR_PUFF_LEN_US])
    ,.injector_open         (inj)
    ,.puff_event            (puff1_event)
    ,.puff_enable           (r[`DR_PUFF_LEN_US] != 0)
    ,.puff_on_timeout       (1'd0)
    ,.leds                  (LED)
);

// event controller is listed last to utilize wires from all other parts.
// its module can be reset by software, by writing EVENT_CONTROLLER_RESET_MASK to DR_SOFT_EVENT.
std_reg soft_event_reg(sysclk, sysreset, r[`DR_SOFT_EVENT], r_load_data, r_load[`DR_SOFT_EVENT]);
assign scope = {ign_coil_sync, r[`DR_SOFT_EVENT][14]}; // copy soft_event_reg to o'scope pins for analysis.
event_controller #(.NUM_INPUTS(21)) events( 
     .sysclk            (sysclk)
    ,.sysreset          (sysreset || r[`DR_SOFT_EVENT][`EVENT_CONTROLLER_RESET_BIT])
    ,.priority_out      (r[`DR_EVENT_PRIORITY])
    ,.priority_load     (r_load[`DR_EVENT_PRIORITY])
    ,.data_in           (r_load_data)
    ,.event_signals     ({
        // MOST urgent events are listed FIRST.
        1'b0 // the zero-priority event is hardwired to zero for this app.  it would override all others.
        ,power_lost_sync
        ,ignition_capture
        ,ignition_capture_timeout
        , ! puff1_event // signal the END of an injector puff, so the pulse length can be adjusted for the next puff.
        ,ustimer0_expired
        , ! spi_busy // signal the END of a SPI transaction.
        ,mstimer0_expired
        ,mstimer1_expired
        ,mstimer2_expired
        , ! r[`DR_FDUART_STATUS][`ARX_FIFO_EMPTY_BIT]
        , r[`DR_FDUART_STATUS][`ARX_FIFO_FULL_BIT]
        , r[`DR_FDUART_STATUS][`ATX_FIFO_FULL_BIT]
        ,KEY[0]
        ,KEY[1]
        ,ignition_switch_off_sync
        , ! ignition_switch_off_sync
        ,r[`DR_SOFT_EVENT][3:0]
    })
);


endmodule
