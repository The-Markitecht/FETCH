`include <header.v>

////////////////////////////////////////////////////////////////////////////
// Synapse316 with attached Java execution hardware and JVM local RAM.
// this module can replace a plain Synapse316 core module as the visor's debugging target.

module jstack_machine #(
) (
     input wire                  sysclk            
    ,input wire                  sysreset          

    ,output wire[IPR_TOP:0]      code_addr         
    ,input wire[15:0]            code_in     
    ,input wire                  code_ready

    // signals for use only by a debugging supervisor.
    ,input wire[`DEBUG_IN_WIDTH-1:0]   debug_in // connect to 0 if supervisor not present.
    ,output wire[`DEBUG_OUT_WIDTH-1:0] debug_out // do not connect if supervisor not present.
    
    // register file, for any combination of general-purpose registers and i/o addressing.
    // these ports can run as a 2-dimensional in Quartus or ModelSim.  but that's a syntax error in Icarus, regardless of options.
    ,input  wire[15:0]                r[TOP_REG:0]
    ,output wire[TOP_REG:0]           r_read    
    ,output wire[TOP_REG:0]           r_load
    ,output wire[15:0]                r_load_data    
); 

// Synapse316 controller.
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

// GP register file.
std_reg gp_reg[`TOP_GP:0](sysclk, sysreset, r[`TOP_GP:0], r_load_data, r_load[`TOP_GP:0]);
    
/*
these parts below don't comply with design in bytecodes.tcl.

// on-chip dual-ported M9K RAM for JVM operands + locals + call stack.  
std_reg #(.WIDTH(`JSTACK_ADDR_WIDTH)) ja_addr_reg(sysclk, sysreset, r[`DR_JA_ADDR], r_load_data[`JSTACK_ADDR_TOP:0], r_load[`DR_JA_ADDR]);
std_reg #(.WIDTH(`JSTACK_ADDR_WIDTH)) jb_addr_reg(sysclk, sysreset, r[`DR_JB_ADDR], r_load_data[`JSTACK_ADDR_TOP:0], r_load[`DR_JB_ADDR]);
//wire[15:0] ja_data, jb_data;
//std_reg ja_data_reg(sysclk, sysreset, ja_data, r_load_data, r_load[`DR_JA_DATA]);
reg ja_wren = 0;
always_ff @(posedge sysreset, posedge sysclk) begin
    if (sysreset)
        ja_wren <= 0;
    else
        ja_wren <= r_load[`DR_JA_DATA];
end
jstack_m9k  jstack_ram (
	.address_a ( r[`DR_JA_ADDR][`JSTACK_ADDR_TOP:0] ),
	.address_b ( r[`DR_JB_ADDR][`JSTACK_ADDR_TOP:0] ),
	.clock_a ( clk_progmem ),
	.clock_b ( clk_progmem ),
	.data_a ( ja_data ),
	.data_b ( 16'd0 ),
	.wren_a ( ja_wren ),
	.wren_b ( 1'd0 ),
	.q_a ( r[`SR_JA_DATA] ),
	.q_b ( r[`SR_JB_DATA] )
	);
// Quartus II software searches for the altsyncram init_file in the project directory, 
// the project db directory, user libraries, and the current source file location.
wire ja_data = r[`SR_JA_DATA];
wire jb_data = r[`SR_JB_DATA];

// JVM stack pointer.  points into jstack_ram.
reg[15:0] jsp = 0;
wire load_jsp = |r_load[`DR_JSP_MAX:`DR_JSP_MIN];
wire[15:0] jsp_inc;
wire do_jsp_inc;
always_ff @(posedge sysreset, posedge sysclk) begin
    if (sysreset)
        jsp <= 0;
    else if (do_jsp_inc)
        jsp <= jsp + jsp_inc;
    else if (load_jsp)
        jsp <= r_load_data;
end

// JSP increment operator.  a countdown shifter provides a delay before JSP is incremented.
// length of delay depends on which register address was written.
wire load_jsp_inc = |r_load[`DR_JSP_INC_MAX:`DR_JSP_INC_MIN];
std_reg jsp_inc_reg(sysclk, sysreset, jsp_inc, r_load_data, load_jsp_inc);
reg[3:0] jsp_inc_shift = 0;
assign do_jsp_inc = jsp_inc_shift[0];
always_ff @(posedge sysreset, posedge sysclk) begin
    if (sysreset)
        jsp_inc_shift <= 0;
    else if (r_load[`DR_JSP_INC_MIN])
        jsp_inc_shift <= 4'b0001;
    else if (r_load[`DR_JSP_INC_MIN+1])
        jsp_inc_shift <= 4'b0010;
    else if (r_load[`DR_JSP_INC_MIN+2])
        jsp_inc_shift <= 4'b0100;
    else if (r_load[`DR_JSP_INC_MIN+3])
        jsp_inc_shift <= 4'b1000;
    else 
        jsp_inc_shift <= {1'b0, jsp_inc_shift[3:1]};
end

// JOFS operator provides memory addressing by an offset relative to JSP.
std_reg jofs_reg(sysclk, sysreset, ja_data, r_load_data, r_load[`DR_JA_DATA]);
wire[15:0] jofs_sum_comb = jsp + jofs;
*/

// on-chip single-ported M9K RAM for JVM operands + locals + call stack.  
wire[15:0] jram_data, jram_q;
wire jram_wren;
jstack_m9k  jstack_ram (
	.address_a ( jstk_addr_comb ),
	.address_b ( 0 ),
	.clock_a ( clk_progmem ),
	.clock_b ( 0 ),
	.data_a ( jram_data ),
	.data_b ( 16'd0 ),
	.wren_a ( jram_wren ),
	.wren_b ( 1'd0 ),
	.q_a ( jram_q ),
	.q_b (  )
);
assign r[`SR_JRAM] = jram_q;

// addressing adders.
wire[`JSTACK_ADDR_TOP:0] jsp = r[`DR_JSP];
wire[`JSTACK_ADDR_TOP:0] jframe = r[`DR_JFRAME];
std_reg #(.WIDTH(`JSTACK_ADDR_WIDTH)) jsp_inc_reg(sysclk, sysreset, r[`DR_JSP_INC], r_load_data, r_load[`DR_JSP_INC]);
wire[`JSTACK_ADDR_TOP:0] jsp_sum_comb = jsp + r[`DR_JSP_INC];
std_reg #(.WIDTH(`JSTACK_ADDR_WIDTH)) jf_inc_reg(sysclk, sysreset, r[`DR_JF_INC], r_load_data, r_load[`DR_JF_INC]);
wire[`JSTACK_ADDR_TOP:0] jf_sum_comb = jframe + r[`DR_JF_INC];
std_reg #(.WIDTH(`JSTACK_ADDR_WIDTH)) jaddr_reg(sysclk, sysreset, r[`DR_JADDR], r_load_data, r_load[`DR_JADDR]);

// addressing mode capture register.
wire[2:0] amode_set_comb = { r_load[`DR_JSP_INC], r_load[`DR_JF_INC], r_load[`DR_JADDR]);
reg[2:0] amode = 3'b001;
always_ff @(posedge sysreset, posedge sysclk) begin
    if (amode_set_comb != 0) 
        amode <= amode_set_comb;
end

// RAM address muxer.
wire[`JSTACK_ADDR_TOP:0] jstk_addr_comb = 
    amode[1] ? jsp_sum_comb : // jsp-relative addressing, for e.g. jpush.
    amode[0] ? jf_sum_comb :  // jframe-relative addressing, for e.g. istore bytecode.
    r[`DR_JADDR]; // random access.

// RAM write data muxer.
assign jram_data = 
    amode[1] ? jop[3] : // jsp-relative addressing, for e.g. jpush.
    amode[0] ? jop[0] : // jframe-relative addressing, for e.g. istore bytecode. 
    r_load_data; // for random access.
assign jram_wren =
    amode[1] ? do_jpush : // jsp-relative addressing, for e.g. jpush.
    amode[0] ? do_store : // jframe-relative addressing, for e.g. istore bytecode. 
    r_load[DR_JDATA]; // for random access.

// stack pointers.
wire[15:0] jsp_load_data = r_load[`DR_JSP_INC_NOW] ? jsp_sum_comb : r_load_data;
std_reg #(.WIDTH(`JSTACK_ADDR_WIDTH)) jsp_reg(sysclk, sysreset, r[`DR_JSP], jsp_load_data, r_load[`DR_JSP] || r_load[`DR_JSP_INC_NOW]);
wire[15:0] jf_load_data = r_load[`DR_JF_INC_NOW] ? jf_sum_comb : r_load_data;
std_reg #(.WIDTH(`JSTACK_ADDR_WIDTH)) jframe_reg(sysclk, sysreset, r[`DR_JFRAME], jf_load_data, r_load[`DR_JFRAME] || r_load[`DR_JF_INC_NOW]);

    
// operators using jop0 thru jop3.
    
// demo bytecodes
iadd {
    jpopwr = jadd
}    

iload {
    jfinc = [next]
    
}
    
endmodule
