`include <header.v>
`include "target_program_defines.v"

module hard_top (
     (* chip_pin = "R8" *) input wire clk50m

    ,output wire		     [7:0]		LED // active HIGH
    ,input wire 		     [1:0]		KEY // active LOW

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
);

//  PLATFORM INSTANCE //////////////////////////////////////////////////////////////////////////
platform platform_inst (
     .clk50m                    (clk50m)

    ,.clk_async                 ()
    ,.clk_progmem               ()

    ,.pulse1m                   ()
    ,.pulse1m_ungated           ()
    ,.pulse50k                  ()
    ,.pulse1k                   ()

    ,.sysreset                  ()

    ,.visor_break_mode          ()

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

    ,.ADC_CS_N                  (ADC_CS_N)
    ,.ADC_SADDR                 (ADC_SADDR)
    ,.ADC_SCLK                  (ADC_SCLK)
    ,.ADC_SDAT                  (ADC_SDAT)

    ,.anmux_ctrl                (anmux_ctrl)

    ,.dip_switch                (dip_switch)

    ,.async_tx_line             (async_tx_line)
    ,.async_rx_line             (async_rx_line)

    ,.dbg_async_tx_line         (dbg_async_tx_line)
    ,.dbg_async_rx_line         (dbg_async_rx_line)

    ,.scope                     (scope)

    ,.power_relay_pwm           (power_relay_pwm)
    ,.power_lost                (power_lost)
    ,.ignition_switch_off       (ignition_switch_off)

    ,.beeper_enable             (beeper_enable)

    ,.ftdi_power                (ftdi_power)

    ,.ign_coil_wht_lo           (ign_coil_wht_lo)
    ,.injector1_open            (injector1_open)
);


endmodule
