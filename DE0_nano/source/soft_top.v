`include <header.v>
`include "sim_program_defines.v"

// soft_top is a test bed.  it's like hard_top, except it includes another 
// MCU which simulates all the car-related hardware, and verifies correct outputs. 
// all the chip pins that would normally connect to car-related hardware
// are diverted to the simulator MCU instead.

module soft_top (
     (* chip_pin = "R8" *) input wire clk50m

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

    // the platform's real hardware outputs appear above, for bench analysis.  
    // so do its discarded real hardware inputs.
    // its simulated inputs also appear below as outputs, to expose timing relationships.
    // the regular external circuits are still connected during testing, so each simulated signal must
    // be reassigned to some other pin.  the real signals are also retained on their
    // original pins so the design tools prevent accidental overlap.
    
    ,(* chip_pin = "R11, R10, P9, N11" *)  output wire[3:0]  sim_dip_switch
    
    ,(* chip_pin = "N14" *) output wire  sim_power_lost
    ,(* chip_pin = "L13" *) output wire  sim_ignition_switch_off
    
    ,(* chip_pin = "J14" *) output wire  sim_ign_coil_wht_lo

    // SPI bus also is copied to extra pins so it can be reached for bench analysis.
    ,(* chip_pin = "N16" *) output wire	sim_adc_cs_n
    ,(* chip_pin = "P16" *) output wire	sim_adc_saddr
    ,(* chip_pin = "L15" *) output wire	sim_adc_sclk
    ,(* chip_pin = "K16" *) output wire	sim_adc_sdat

    // soft_top specific pins.
    ,(* chip_pin = "J13" *) output wire  sim_async_tx_line
    ,(* chip_pin = "J16" *)  input wire  sim_async_rx_line
    ,(* chip_pin = "M10" *) output wire  sim_dbg_async_tx_line
    ,(* chip_pin = "L14" *)  input wire  sim_dbg_async_rx_line
);

// stubbed hardware signals.
assign ADC_CS_N          = 1;
assign ADC_SADDR         = 0;
assign ADC_SCLK          = 0;

//  PLATFORM INSTANCE //////////////////////////////////////////////////////////////////////////
wire clk_async;
wire clk_progmem;
wire sysreset;
wire visor_break_mode;
wire pulse1m;
wire pulse1m_ungated;
wire pulse50k;
wire pulse1k;
wire[7:0] LED; // active HIGH
wire[1:0] KEY = 2'b11; // active LOW

platform platform_inst (
     .clk50m                    (clk50m)

    ,.clk_async                 (clk_async)
    ,.clk_progmem               (clk_progmem)

    ,.pulse1m                   (pulse1m )
    ,.pulse1m_ungated           (pulse1m_ungated )
    ,.pulse50k                  (pulse50k)
    ,.pulse1k                   (pulse1k )

    ,.sysreset                  (sysreset)

    ,.visor_break_mode          (visor_break_mode)

    ,.LED                       (LED)
    ,.KEY                       (KEY)

    ,.DRAM_ADDR                 (DRAM_ADDR)
    ,.DRAM_BA                   (DRAM_BA)
    ,.DRAM_CAS_N                (DRAM_CAS_N)
    ,.DRAM_CKE                  (DRAM_CKE)
    ,.DRAM_CLK                  (DRAM_CLK)
    ,.DRAM_CS_N                 (DRAM_CS_N)
    ,.DRAM_DQ                   (DRAM_DQ)
    ,.DRAM_DQM                  (DRAM_DQM)
    ,.DRAM_RAS_N                (DRAM_RAS_N)
    ,.DRAM_WE_N                 (DRAM_WE_N)

    ,.ADC_CS_N                  (sim_adc_cs_n)
    ,.ADC_SADDR                 (sim_adc_saddr)
    ,.ADC_SCLK                  (sim_adc_sclk)
    ,.ADC_SDAT                  (sim_adc_sdat)

    ,.anmux_ctrl                (anmux_ctrl)

    ,.dip_switch                (sim_dip_switch)

    ,.async_tx_line             (async_tx_line)
    ,.async_rx_line             (async_rx_line)

    ,.dbg_async_tx_line         (dbg_async_tx_line)
    ,.dbg_async_rx_line         (dbg_async_rx_line)

    ,.scope                     (scope)

    ,.power_relay_pwm           ()
    ,.power_lost                (sim_power_lost)
    ,.ignition_switch_off       (sim_ignition_switch_off)

    ,.beeper_enable             (beeper_enable)

    ,.ftdi_power                (ftdi_power)

    ,.ign_coil_wht_lo           (sim_ign_coil_wht_lo)
    ,.injector1_open            (injector1_open)
);

// simulator module control signals
wire sysclk = clk50m;
wire sim_run = ! visor_break_mode; 
wire sim_reset = sysreset || 1'b0; //TODO: add a way to soft reset the sim for the next test?

// ############################## car hardware simulator Synapse316 
// with its own code RAM.  totally independent of the target MCU.

/*
wire[`CODE_ADDR_TOP:0]     code_addr;
wire[`WMSB:0]              code_in;
wire                       code_ready;
wire[`DEBUG_IN_WIDTH-1:0]  debug_in = 'd0;
wire[`DEBUG_OUT_WIDTH-1:0] debug_out; 
wire[`WMSB:0]              r[`TOP_REG:0];
wire[`TOP_REG:0]           r_read ;   
wire[`TOP_REG:0]           r_load;
wire[`WMSB:0]              r_load_data;
synapse316 simulator_core (
    .sysclk          (sysclk      ) ,
    .sysreset        (sim_reset    ) ,
    .code_addr       (code_addr   ) ,
    .code_in         (code_in) ,
    .code_ready      (sim_run) ,
    .r               (r),
    .r_read          (r_read),
    .r_load          (r_load),
    .r_load_data     (r_load_data),
    .debug_out       (debug_out),
    .debug_in        (debug_in)
);    

// on-chip M9K RAM for simulator MCU program.
std_reg #(.STORAGE_WIDTH(`CODE_ADDR_WIDTH)) code_write_addr_reg
    (sysclk, sim_reset, r[`SR_CODE_WRITE_ADDR], r_load_data[`CODE_ADDR_TOP:0], r_load[`DR_CODE_WRITE_ADDR]);
wire[`WMSB:0] code_write_data;
std_reg code_write_data_reg(sysclk, sim_reset, code_write_data, r_load_data, r_load[`DR_CODE_WRITE_DATA]);
reg code_wren = 0;
always_ff @(posedge sysclk) begin
    if (sim_reset)
        code_wren <= 0;
    else
        code_wren <= r_load[`DR_CODE_WRITE_DATA];
end
sim_code_ram	simulator_program (
	.clock ( clk_progmem ),
	
    .rdaddress ( code_addr ),
	.q ( code_in ),
	
	.data ( code_write_data ),
    .wraddress ( r[`SR_CODE_WRITE_ADDR][`CODE_ADDR_TOP:0] ),
	.wren ( code_wren )
);
// Quartus II software searches for the altsyncram init_file in the project directory, 
// the project db directory, user libraries, and the current source file location.
*/

// sim MCU plus its own debugging supervisor and a code ROM for each.
wire[15:0]                r[`TOP_REG:0];
wire[`TOP_REG:0]          r_read;  
wire[`TOP_REG:0]          r_load;
wire[15:0]                r_load_data;  
//assign timer_enable = ! visor_break_mode;
supervised_synapse316 supmcu(
    .sysclk          (sysclk      ) ,
    .sysreset        (sysreset    ) ,
    .clk_progmem     (clk_progmem),
    .clk_async       (clk_async),
    .mcu_wait_in     (0),
    .visor_break_mode(),
    .boot_break      (0), 
    .r               (r),
    .r_read          (r_read),
    .r_load          (r_load),
    .r_load_data     (r_load_data),
    .dbg_async_rx_line   (sim_dbg_async_rx_line),
    .dbg_async_tx_line   (sim_dbg_async_tx_line)
);    

// GP register file and a stack.
std_reg gp_reg[`TOP_GP:0](sysclk, sim_reset, r[`TOP_GP:0], r_load_data, r_load[`TOP_GP:0]);
stack_reg #(.DEPTH(8)) rstk(sysclk, sim_reset, r[`DR_RSTK], r_load_data, r_load[`DR_RSTK], r_read[`DR_RSTK]);

// ///////////////////////////   plumbing of simulator MCU I/O.

// full-duplex UART with FIFO's.
fduart uart (
     .sysclk        ( sysclk )    
    ,.sysreset      ( sim_reset )
    ,.clk_async     ( clk_async )   // clocked at 4x bit rate.     
    ,.async_rx_line ( sim_async_rx_line )  
    ,.async_tx_line ( sim_async_tx_line )
    ,.status_out    ( r[`SR_FDUART_STATUS] )    
    ,.data_in       ( r_load_data )
    ,.atx_reg_load  ( r_load[`DR_FDUART_DATA] )
    ,.arx_reg_out   ( r[`DR_FDUART_DATA] )     
    ,.arx_reg_read  ( r_read[`SR_FDUART_DATA] )
);  

// timestamp timer counts up in microseconds.
wire[31:0] timestamp;
wire       timestamp_load;
wire[31:0] timestamp_load_data;
wire[31:0] timestamp_compare;
wire       timestamp_compare_load;
wire timestamp_expired;
up_counter #(.WIDTH(32)) timestamp_counter (
     .sysclk          ( sysclk )  
    ,.sysreset        ( sim_reset )  
    ,.data_in         ( timestamp_load_data )  
    ,.counter_data_out( timestamp )
    ,.counter_load    ( timestamp_load )
    ,.compare_data_out( timestamp_compare )
    ,.compare_load    ( timestamp_compare_load )
    ,.counter_tick    ( pulse1m && sim_run )
    ,.expired         ( timestamp_expired )
);
double_word_adapter timestamp_adapter (
     .sysclk                (sysclk   )
    ,.sysreset              (sim_reset )
    ,.data_in               (r_load_data)
    ,.data_out_lo           (     r[`SR_TIMESTAMP_LO])
    ,.read_lo               (r_read[`SR_TIMESTAMP_LO])
    ,.load_lo               (r_load[`DR_TIMESTAMP_LO])
    ,.data_out_hi           (     r[`SR_TIMESTAMP_HI])
    ,.read_hi               (r_read[`SR_TIMESTAMP_HI])
    ,.load_hi               (r_load[`DR_TIMESTAMP_HI])
    ,.double_data_to_read   (timestamp)      
    ,.double_read           ()
    ,.double_data_to_write  (timestamp_load_data)
    ,.double_load           (timestamp_load)
);
double_word_adapter timestamp_compare_adapter (
     .sysclk                (sysclk   )
    ,.sysreset              (sim_reset )
    ,.data_in               (r_load_data)
    ,.data_out_lo           (     r[`SR_TIMESTAMP_COMPARE_LO])
    ,.read_lo               (r_read[`SR_TIMESTAMP_COMPARE_LO])
    ,.load_lo               (r_load[`DR_TIMESTAMP_COMPARE_LO])
    ,.data_out_hi           (     r[`SR_TIMESTAMP_COMPARE_HI])
    ,.read_hi               (r_read[`SR_TIMESTAMP_COMPARE_HI])
    ,.load_hi               (r_load[`DR_TIMESTAMP_COMPARE_HI])
    ,.double_data_to_read   (timestamp_compare)      
    ,.double_read           ()
    ,.double_data_to_write  () // same as timestamp_load_data.
    ,.double_load           (timestamp_compare_load)
);

// ustimer's count down on microseconds.
wire ustimer0_expired;
down_counter ustimer0 (
     .sysclk          ( sysclk )  
    ,.sysreset        ( sim_reset )  
    ,.data_in         ( r_load_data )  
    ,.counter_data_out(      r[`SR_USTIMER0] )
    ,.counter_load    ( r_load[`DR_USTIMER0] )
    ,.counter_tick    ( pulse1m && sim_run)
    ,.expired         ( ustimer0_expired )
);

// mstimer's count down on milliseconds.
wire mstimer0_expired;
down_counter mstimer0 (
     .sysclk          ( sysclk )  
    ,.sysreset        ( sim_reset )  
    ,.data_in         ( r_load_data )  
    ,.counter_data_out(      r[`SR_MSTIMER0] )
    ,.counter_load    ( r_load[`DR_MSTIMER0] )
    ,.counter_tick    ( pulse1k && sim_run)
    ,.expired         ( mstimer0_expired )
);

// PWM generator to drive the computer's main power relay.  counts microseconds.  count 50 = 20 KHz.
cdpwm #(.WIDTH(6), .START(50)) power_relay_pwm_inst (
     .sysclk          ( sysclk )  
    ,.sysreset        ( sysreset )  
    ,.counter_tick    ( pulse1m_ungated ) // must be ungated, so the relay keeps working while the visor pauses the target MCU.
    ,.counter_value   (  )
    ,.duty            ( r[`SR_POWER_DUTY] )
    ,.duty_load       ( r_load[`DR_POWER_DUTY] )
    ,.data_in         ( r_load_data[5:0] )
    ,.pwm_signal      ( power_relay_pwm )
);

// ignition pulse generator.  runs continuously during sim_run.  
// period register is read/write, measuring in 20us jiffies (jf).
// pulse length is fixed.
std_reg ign_period_reg(sysclk, sim_reset, r[`SR_IGN_PERIOD], r_load_data, r_load[`DR_IGN_PERIOD]);
reg[15:0] ign_pulse_gen = 0;
assign sim_ign_coil_wht_lo = ign_pulse_gen[15:4] == 0; 
wire ign_pulse_end = (ign_pulse_gen == 16'd0) && pulse50k; // true on the final sysclk cycle of the ignition pulse.
always_ff @(posedge sysclk) 
    if (sim_reset) 
        ign_pulse_gen <= 0;
    else if (sim_run && pulse50k)
        ign_pulse_gen <= ign_pulse_end ? r[`SR_IGN_PERIOD] : ign_pulse_gen - 16'd1;

// ignition pulse counter.  resettable.
reg[15:0] ign_cycle_cnt;
assign r[`SR_IGN_CYCLE_CNT] = ign_cycle_cnt;
always_ff @(posedge sysclk) 
    if (sim_reset)
        ign_cycle_cnt <= 0;
    else if (r_load[`DR_IGN_CYCLE_CNT])
        ign_cycle_cnt <= 0;
    else if (ign_pulse_end)
        ign_cycle_cnt <= ign_cycle_cnt + 16'd1;

// injection edge detector.
reg[15:0] injector1_old;
always_ff @(posedge sysclk) 
    injector1_old <= injector1_open;
//wire puff1_rise = injector1_open && ! injector1_old;
wire puff1_fall = injector1_old && ! injector1_open;

// injection puff count.
reg[15:0] puff1cnt;
assign r[`SR_PUFF1CNT] = puff1cnt;
always_ff @(posedge sysclk) 
    if (sim_reset)
        puff1cnt <= 0;
    else if (r_load[`DR_PUFF1CNT])
        puff1cnt <= 0;
    else if (puff1_fall)
        puff1cnt <= puff1cnt + 16'd1;

// injection puff timeout after 200 ms.
reg[7:0] puff1timeout;
wire puff1timeout_detected = puff1timeout == 0;
always_ff @(posedge sysclk) 
    if (sim_reset)
        puff1timeout <= 0;
    else if (puff1_fall)
        puff1timeout <= 'd200;
    else if (pulse1k && ! puff1timeout_detected)
        puff1timeout <= puff1timeout - 16'd1;

// injection puff length capture, in microseconds.
//TODO: cope with injector PWM and/or peak-and-hold.
reg[15:0] puff1len;
assign r[`SR_PUFF1LEN] = puff1len;
always_ff @(posedge sysclk) 
    if (injector1_open && pulse1m)
        puff1len <= puff1len + 16'd1;

//TODO: connect these remaining simulated signals.
assign sim_adc_sdat = 1'b0;

assign sim_dip_switch = 1'b0;

assign sim_power_lost = 1'b0;
assign sim_ignition_switch_off = 1'b0;

wire spi_busy = 0;

// event controller is listed last to utilize wires from all other parts.
// its module can be reset by software, by writing EVENT_CONTROLLER_RESET_MASK to DR_SOFT_EVENT.
std_reg soft_event_reg(sysclk, sysreset, r[`SR_SOFT_EVENT], r_load_data, r_load[`DR_SOFT_EVENT]);
event_controller #(.NUM_INPUTS(14)) events( 
     .sysclk            (sysclk)
    ,.sysreset          (sysreset || r[`SR_SOFT_EVENT][`EVENT_CONTROLLER_RESET_BIT])
    ,.priority_out      (r[`SR_EVENT_PRIORITY])
    ,.priority_load     (r_load[`DR_EVENT_PRIORITY])
    ,.data_in           (r_load_data)
    ,.event_signals     ({
        // MOST urgent events are listed FIRST.
        1'b0 // the zero-priority event is hardwired to zero for this app.  it would override all others.
        ,ustimer0_expired
        ,ign_pulse_end // end of an ignition pulse.  just began a new period.  good time to set the period.  takes effect on the following period after the one that just started.
        ,puff1_fall // end of a puff.  good time to read its captured length.
        , ! spi_busy // END of a SPI transaction.
        ,mstimer0_expired
        ,puff1timeout_detected
        , ! r[`SR_FDUART_STATUS][`ARX_FIFO_EMPTY_BIT]
        , r[`SR_FDUART_STATUS][`ARX_FIFO_FULL_BIT]
        , r[`SR_FDUART_STATUS][`ATX_FIFO_FULL_BIT]
        ,r[`SR_SOFT_EVENT][3:0]
    })
);

endmodule 
