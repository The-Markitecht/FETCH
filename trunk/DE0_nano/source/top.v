module top #(
    parameter IPR_WIDTH = 16,
    parameter IPR_TOP = IPR_WIDTH - 1,
    parameter NUM_REGS = 16,
    parameter TOP_REG = NUM_REGS - 1,
    parameter REGS_FLAT_WIDTH = NUM_REGS * 16,
    parameter NUM_DATA_INPUTS = 16,
    parameter TOP_DATA_INPUT = NUM_DATA_INPUTS - 1,
    parameter DATA_INPUT_FLAT_WIDTH = NUM_DATA_INPUTS * 16
) (
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

wire[31:0] junk;

// LED counter
reg[31:0] cnt = 32'd0;
always @(posedge clk50m) begin
    cnt <= cnt + 32'd1;    
end
//assign LED[7] = cnt[26];
//assign LED[6] = cnt[25];

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

// qsys1 u0 (
    // .clk_clk           (clk50m),          
    // .reset_reset_n  (1'b1),   
    // .uart0_rxd         (GPIO_2[10]),       
    // .uart0_txd         (GPIO_2[11])
    // //.anmux_ctrl_export ({GPIO_2[3], GPIO_2[2], GPIO_2[0], GPIO_2[1]}), // dg408 pins en, a2, a1, a0
    // // .gp_out0_export    ({junk[31:8], LED[7:0]}),   
    // // .gp_in0_export     ({ 30'b0, KEY[1:0]}),    
    // // .adc_OUT           (ADC_SADDR),         
    // // .adc_IN            (ADC_SDAT),          
    // // .adc_CS_n          (ADC_CS_N),          
    // // .adc_CLK           (ADC_SCLK)           
// );

// PLL for UARTs.
wire clk_async;          // 4x desired bit rate.  460,800 hz for 115,200 bps.   38,400 hz for 9,600 bps.
async_pll async_pll_inst (
    .inclk0 ( clk50m ),
    .c0 ( clk_async ),
    .locked (  )
);

// Synapse 316 with code ROM.
wire[15:0]                 rom_code_in;
wire                       rom_code_ready;
wire[15:0]                 tg_code_addr;
wire[15:0]                 tg_code_in;
wire                       tg_code_ready;
wire[REGS_FLAT_WIDTH-1:0]  tg_r_flat;
wire[TOP_REG:0]            tg_r_load;
wire[DATA_INPUT_FLAT_WIDTH-1:0]   data_in_flat;
wire                       tg_reset;
program rom(
    .addr(code_addr),
    .data(code_fetched)
);
synapse316 mcu(
    .sysclk          (clk50m      ) ,
    .sysreset        (tg_reset    ) ,
    .code_addr       (tg_code_addr   ) ,
    .code_in         (tg_code_in) ,
    .code_ready      (tg_code_ready  ) ,
    .r_flat          (tg_r_flat),
    .r_load          (tg_r_load),
    .data_in_flat    (data_in_flat)
);    
genvar i;
generate  
    for (i=0; i < NUM_REGS; i=i+1) begin: regs
        wire[15:0] r = r_flat[i*16+15:i*16];
    end  
endgenerate     
generate  
    for (i=0; i < NUM_DATA_INPUTS; i=i+1) begin: data_in
        wire[15:0] d;
        assign data_in_flat[i*16+15:i*16] = d;
    end  
endgenerate     

// debugging supervisor.
visor vis(
    ,sysclk          (clk50m)
    ,sysreset        (1'b0)
                     
    ,led             (LED)
                     
    ,rom_code_in     (rom_code_in   )
    ,rom_code_ready  (rom_code_ready)
                                          
    ,tg_code_addr    (tg_code_addr  )
    ,tg_code_in      (tg_code_in    )
    ,tg_code_ready   (tg_code_ready )
    ,tg_r_flat       (tg_r_flat     )
    ,tg_r_load       (tg_r_load     )
    ,tg_reset        (tg_reset      )
);



// UART
wire txbsy; // this wire was ineffective in fixing ambiguous muxa_comb.
uart_v2_tx utx (
     .uart_sample_clk(clk_async) // clocked at 4x bit rate.
    ,.parallel_in    (regs[8].r[7:0])
    ,.load_data      (regs[9].r[0])
    ,.tx_line        (GPIO_2[11])
    ,.tx_busy        (txbsy)
);    
assign data_in[0].d = {15'd0, txbsy};


endmodule
