`include "header.v"

module top (

//patch:
output[15:0] aout,
input[15:0] cin,
output[15:0] out0,
output[15:0] out1,


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

// clock and reset circuits.
clock_ifc clk();
assign clk.clk = clk50m;
wire clk_async; // PLL output for UARTs.  4x desired bit rate.  460,800 hz for 115,200 bps.   38,400 hz for 9,600 bps.
wire async_pll_lock;
async_pll async_pll_inst (
    .inclk0 ( clk50m ),
    .c0 ( clk_async ),
    .locked ( async_pll_lock )
);
reg rst0 = 1, rst1 = 1, rst2 = 1;
always_ff @(posedge clk.clk) begin
    rst0 <= ! async_pll_lock; // hold sysreset high until 3 cycles after async_pll_lock.
    rst1 <= rst0;
    rst2 <= rst1;
end
assign clk.reset = rst2;

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


// // MCU target plus debugging supervisor and a code ROM for each.
// reg_ifc                r[`TOP_REG:0]();
// avalon_mm_ifc          av();
// avalon_mm_ifc          dbg_av();
// wire mcu_wait;
// supervised_synapse316 mcu(
    // .clk,
    // .r,
    // .mcu_wait,
    // .av,
    // .dbg_av
// );    


//patch: synthesis debugging only.
code_ifc    code();
reg_ifc     r[`TOP_REG:0]();
assign aout = code.addr;
assign code.content = cin;
assign out0 = r[`DR_AV_WRITEDATA].q;
assign out1 = r[`DR_AV_ADDRESS].q;

// target_program rom(
    // .clk, 
    // .code
// );

// debug_ifc   debug();
// assign debug.hold_state = 0;
// assign debug.force_load_exr = 0;
// assign debug.force_exec = 0;
// synapse316 #(
    // .NUM_REGS(`NUM_REGS)
// ) mcu(
    // .clk,
    // .code,
    // .r,
    // .debug(debug)
// );

// genvar i;
// generate  
    // for (i=0; i < `NUM_GP; i=i+1) begin: gp
        // std_reg gp_reg(.clk, .r(r[i]));
    // end  
// endgenerate     

// stack_reg #(.DEPTH(32)) rstk(.clk, .r(r[`DR_RSTK]));

// // plumbing of target MCU outputs.
// narrow_reg #(.WIDTH(8)) led_reg(.clk, .r(r[`DR_LEDS]));
// assign LED = r[`DR_LEDS].q[7:0];

// // plumbing of target MCU inputs.
// assign r[`SR_KEYS].q = {14'h0, KEY}; 


reg_ifc kr();
assign kr.q = {14'h0, ~ KEY}; 
reg_ifc lr();
std_reg led_reg(.clk, .r(lr));
assign LED = lr.q[15:8];
junk316 mcu(.clk, .kr, .lr);


// old direct wiring for software-driven avalon master
//patch: this contains bugs!! improper slicing [1:0] in several places!
// std_reg av_writedata_reg(sysclk, sysreset, r[`DR_AV_WRITEDATA][1:0], r_load_data[1:0], r_load[`DR_AV_WRITEDATA]);
// wire[15:0] av_writedata             = r[`DR_AV_WRITEDATA];
// std_reg av_address_reg(sysclk, sysreset, r[`DR_AV_ADDRESS][1:0], r_load_data[1:0], r_load[`DR_AV_ADDRESS]);
// wire[15:0] av_address               = r[`DR_AV_ADDRESS];
// std_reg #(.WIDTH(2)) av_ctrl_reg(sysclk, sysreset, r[`DR_AV_CTRL][1:0], r_load_data[1:0], r_load[`DR_AV_CTRL]);
// wire av_write      = r[`DR_AV_CTRL][0];

// //patch: move both versions into a new module.
// // Avalon MM master.
// // program should always write the data register last, because writing it triggers the Avalon transaction.
// std_reg av_writedata_reg(.clk, .r(r[`DR_AV_WRITEDATA]));
// assign av.writedata             = r[`DR_AV_WRITEDATA].q;
// std_reg av_address_reg(.clk, .r(r[`DR_AV_ADDRESS]));
// assign av.address               = r[`DR_AV_ADDRESS].q;
// reg av_write = 0;
// reg av_read = 0;
// assign av.write = av_write;
// //assign av.read = av_read;
// always_ff @(posedge clk.clk) begin
    // if (av_write && ! av.waitrequest)
        // av_write <= 0; // write transaction has ended.
    // else if (r[`DR_AV_WRITEDATA].load)
        // av_write <= 1; // begin write transaction.
// end
// wire av_busy = (av_write || av_read) && av.waitrequest; // considering av.waitrequest avoids 1 needless wait state after every transaction.
// assign mcu_wait = av_busy;

// // Qsys system including JTAG UART.
// // in a Nios II Command Shell, type nios2-terminal --help, or just nios2-terminal.
// qsys2 u0 (
    // .clk_clk                      (clk.clk),                      
    // .reset_reset_n                ( ! clk.reset),                
    // .m0_address                   (av.address),                   
    // .m0_read                      (0),                      
    // .m0_waitrequest               (av.waitrequest),               
    // .m0_readdata                  (),                  
    // .m0_write                     (av.write),                     
    // .m0_writedata                 (av.writedata),                 
    // .generic_master_0_reset_reset ()  
// );

// // UART
// std_reg #(.WIDTH(8)) atx_data_reg(sysclk, sysreset, r[`DR_ATX_DATA][7:0], r_load_data[7:0], r_load[`DR_ATX_DATA]);
// std_reg #(.WIDTH(1)) atx_ctrl_reg(sysclk, sysreset, r[`DR_ATX_CTRL][0], r_load_data[0], r_load[`DR_ATX_CTRL]);
// uart_v2_tx utx (
     // .uart_sample_clk(clk_async) // clocked at 4x bit rate.
    // ,.parallel_in    (r[`DR_ATX_DATA][7:0])
    // ,.load_data      (r[`DR_ATX_CTRL][0])
    // ,.tx_line        (GPIO_2[11])
    // ,.tx_busy        (r[`DR_ATX_CTRL][1])
// );    



endmodule
