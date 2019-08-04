`include <header.v>
`include "target_program_defines.v"

module top (
    // PIN ASSIGNMENTS CHANGED TO TARGET DE0 !!!

    (* chip_pin = "G21" *) input clk50m

    // DE0 LEDs.  active high.
//    , (* chip_pin = "B1, B2, C2, C1, E1, F2, H1, J3, J2, J1" *)   output[9:0] led

    // DE0 pushbuttons.  3.3v pullups.  pressed = logic low.
//    , (* chip_pin = "F1, G3, H2" *)   input[2:0] buttons_raw

    // raw signals from DE0 on-board slide switches (up/inboard = logic high).  3.3v.
//    , (* chip_pin = "D2, E4, E3, H7, J7, G5, G4, H6, H5, J6" *)   input [9:0] switches_raw 
/*
    ////////////////////  DE0 7-SEG Display, active low.  ////////////////////
    , (* chip_pin = "F13, F12, G12, H13, H12, F11, E11" *)   output	[6:0]	hex0 // low-order digit
    , (* chip_pin = "A15, E14, B14, A14, C13, B13, A13" *)   output	[6:0]	hex1
    , (* chip_pin = "F14, B17, A17, E15, B16, A16, D15" *)   output	[6:0]	hex2
    , (* chip_pin = "G15, D19, C19, B19, A19, F15, B18" *)   output	[6:0]	hex3 // high-order digit
    , (* chip_pin = "G16, A18, B15, D13" *)                  output	[3:0]	hex_dp // dp [0] is the right-most (low-order) digit.  active low.
*/
    ,(* chip_pin = "V5" *) output wire  async_tx_line
    ,(* chip_pin = "U7" *)  input wire  async_rx_line
    
    ,(* chip_pin = "W7" *) output wire  dbg_async_tx_line
    ,(* chip_pin = "W6" *)  input wire  dbg_async_rx_line

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
    .c2 (  ),
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
        
// MCU target plus debugging supervisor and a code ROM for each.
wire[15:0]                r[`TOP_REG:0];
wire[`TOP_REG:0]          r_read;  
wire[`TOP_REG:0]          r_load;
wire[15:0]                r_load_data;  
wire                      mcu_wait = 0;
wire                      visor_break_mode;
assign timer_enable = ! visor_break_mode;
supervised_synapse316 supmcu(
    .sysclk          (sysclk      ) ,
    .sysreset        (sysreset    ) ,
    .clk_progmem     (clk_progmem),
    .clk_async       (clk_async),
    .mcu_wait_in     (mcu_wait),
    .visor_break_mode(visor_break_mode),
    .boot_break      ( 1'b0 ), 
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

std_reg ex_test_reg[3:0] (sysclk, sysreset, exp_r[3:0], exp_r_load_data, exp_r_load[3:0]);

// write-sensitive counter.  can be reset by writing a zero to it.
reg[`WMSB:0] ws_cnt = 0;
always_ff @(posedge sysclk) 
    if (exp_r_load[4])
        ws_cnt <= exp_r_load_data == `WW'h0 ? `WW'h0 : ws_cnt + `WW'h1;
assign exp_r[4] = ws_cnt;

// read-sensitive counter.  can be reset by writing a zero to it.
reg[`WMSB:0] rs_cnt = 0;
always_ff @(posedge sysclk) 
    if (exp_r_load[5])
        rs_cnt <= `WW'h0;
    else if (exp_r_read[5])
        rs_cnt <= rs_cnt + `WW'h1;
assign exp_r[5] = rs_cnt;


/*
std_reg #(.WIDTH(8)) led_reg(sysclk, sysreset, exp_r[`EDR_LEDS], exp_r_load_data[7:0], exp_r_load[`EDR_LEDS]);
assign LED = exp_r[`EDR_LEDS][7:0];

assign exp_r[`ESR_KEYS] = {14'h0, KEY}; 

std_reg #(.WIDTH(4)) anmux_ctrl_reg(sysclk, sysreset, exp_r[`EDR_ANMUX_CTRL], exp_r_load_data[3:0], exp_r_load[`EDR_ANMUX_CTRL]);
assign anmux_ctrl = exp_r[`EDR_ANMUX_CTRL][3:0];
*/

//std_reg #(.WIDTH(8)) led_reg(sysclk, sysreset, r[`DR_LEDS], r_load_data[7:0], r_load[`DR_LEDS]);
//assign LED = { ! ignition_switch_off_sync, r[`DR_LEDS][6:0]};


endmodule
