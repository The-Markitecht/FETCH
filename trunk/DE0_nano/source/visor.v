`include "header.v"
`include "visor_program_defines.v"

// synthesize with SystemVerilog

////////////////////////////////////////////////////////////////////////////
// debugging supervisor module.  
// to be inserted between Synapse316 MCU and its code ROM.

module visor (
     input wire		          		  sysclk
    ,input wire		          		  sysreset
    ,input wire                       clk_progmem
    ,input wire                       clk_async
    
    // signals from target's code ROM.
    // ,input wire[15:0]                 rom_code_in
    // ,input wire                       rom_code_ready
    
    ,input wire                       mcu_wait
    
    ,input wire                       boot_break
    
    // signals to & from the target MCU.
    ,input wire[15:0]                 tg_code_addr
    ,output wire[15:0]                tg_code_in
    ,output wire                      tg_code_ready
    ,output wire[`DEBUG_IN_WIDTH-1:0] tg_debug_in
    ,input wire[`DEBUG_OUT_WIDTH-1:0] tg_debug_out
    ,output wire                      tg_reset
    ,input wire[15:0]                 tg_peek_data
    ,output wire[15:0]                tg_poke_data
    
    // visor async interface.
    ,input wire                       async_rx_line
    ,output wire                      async_tx_line
    
    // Avalon MM master
    ,output wire[15:0]                av_address
    ,input wire                       av_waitrequest
    ,output wire[15:0]                av_writedata
    ,output wire                      av_write
);

// supervisor Synapse 316 with its own code ROM.  totally independent of the target MCU.
wire[15:0] code_addr;
wire[15:0] code_fetched;
wire[15:0]                r[`VISOR_TOP_REG:0];
wire[`VISOR_TOP_REG:0]    r_read;  
wire[`VISOR_TOP_REG:0]    r_load;
wire[15:0]                r_load_data;  
// visor_program rom(
    // .addr(code_addr),
    // .data(code_fetched)
// );
visor_pgm rom(
    .clock(clk_progmem),
    .address(code_addr),
    .q(code_fetched)
);
synapse316 #(
    .NUM_REGS(`VISOR_NUM_REGS)
) mcu(
    .sysclk          (sysclk      ) ,
    .sysreset        (sysreset   ) ,
    .code_addr       (code_addr   ) ,
    .code_in         (code_fetched) ,
    .code_ready      (1'b1  ) ,
    .r               (r),
    .r_read          (r_read),
    .r_load          (r_load),
    .r_load_data     (r_load_data),
    .debug_out       (),
    .debug_in        (`DEBUG_IN_WIDTH'd0)    
);    

std_reg gp_reg[`VISOR_TOP_GP:0](sysclk, sysreset, r[`VISOR_TOP_GP:0], r_load_data, r_load[`VISOR_TOP_GP:0]);

stack_reg #(.DEPTH(32)) rstk(sysclk, sysreset, r[`DR_RSTK], r_load_data, r_load[`DR_RSTK], r_read[`DR_RSTK]);

// plumbing of visor outputs, target inputs.
std_reg output_reg[5:0](sysclk, sysreset, r[`DR_POKE_DATA:`DR_BP0_ADDR], r_load_data, r_load[`DR_POKE_DATA:`DR_BP0_ADDR]);
wire[15:0] force_opcode         = r[`DR_FORCE_OPCODE];
wire[15:0] poke_data            = r[`DR_POKE_DATA];

// irregular sized outputs.
reg bp_hit = 0;
reg bp_matched = 0;
wire bp_step = r[`DR_BUS_CTRL][3];
wire divert_code_bus = r[`DR_BUS_CTRL][2];
assign tg_reset      =  sysreset || r[`DR_BUS_CTRL][1];
assign tg_code_ready = divert_code_bus ? r[`DR_BUS_CTRL][0] : ! (mcu_wait || bp_hit);
wire[15:0]                 rom_code_in;
assign tg_code_in = divert_code_bus ? force_opcode : rom_code_in;
std_reg #(.WIDTH(4)) bus_ctrl_reg(sysclk, sysreset, r[`DR_BUS_CTRL], r_load_data[3:0], r_load[`DR_BUS_CTRL]);

std_reg #(.WIDTH(3)) force_reg(sysclk, sysreset, r[`DR_TG_FORCE], r_load_data[`DEBUG_IN_WIDTH-1:0], r_load[`DR_TG_FORCE]);
assign tg_debug_in   = r[`DR_TG_FORCE][`DEBUG_IN_WIDTH-1:0]; // {debug_force_exec, debug_force_load_exr, debug_hold_state}

// plumbing of visor inputs, target outputs.
reg[15:0] exr_shadow = 0;    
assign r[`SR_EXR_SHADOW] = exr_shadow; 
assign r[`SR_TG_CODE_ADDR] = tg_code_addr; 
assign r[`SR_PEEK_DATA] = tg_peek_data; 

// irregular sized inputs.
//assign r[`SR_TG_DEBUG_OUT][`DEBUG_OUT_WIDTH-1:0] = tg_debug_out;
assign r[`SR_BP_STATUS] = {15'h0, bp_hit}; 
assign r[`SR_BOOT_BREAK] = {15'h0, boot_break}; 

// debugger logic
wire tg_debug_loading_exr = tg_debug_out[1];
wire tg_debug_enable_exec = tg_debug_out[0];
wire program_break = tg_debug_out[6];
wire bp_matched_comb =   tg_code_addr == r[`DR_BP0_ADDR] 
                      || tg_code_addr == r[`DR_BP1_ADDR] 
                      || tg_code_addr == r[`DR_BP2_ADDR] 
                      || tg_code_addr == r[`DR_BP3_ADDR]
                      || bp_step || program_break;
wire bp_load_comb =    r_load[`DR_BP0_ADDR] 
                    || r_load[`DR_BP1_ADDR] 
                    || r_load[`DR_BP2_ADDR] 
                    || r_load[`DR_BP3_ADDR];
always_ff @(posedge sysreset or posedge sysclk) begin
    if (sysreset) begin
        exr_shadow <= 0;
        bp_hit <= 0;
        bp_matched <= 0;
        //step_cycle <= 0;
        //last_step_cmd <= 0;
    end else if (sysclk) begin
        if (tg_debug_loading_exr && ! divert_code_bus)
            exr_shadow <= rom_code_in;
            
        if (bp_load_comb) begin
            bp_matched <= 0;
            bp_hit <= 0;
        end else begin
            if (bp_matched_comb) begin
                bp_matched <= 1;
            end
            if (tg_debug_enable_exec && (bp_matched || bp_matched_comb)) begin
                // bp_hit is delayed until the next enable_exec after any address match.
                // that way it only hits on ordinary assignment cycles, no special cycles.
                // that allows the visor to correctly commandeer and later refill exr.
                bp_hit <= 1;
            end
        end        
        
        // if (step_cmd && ! last_step_cmd)
            // step_cycle <= 1;
        // else
            // step_cycle <= 0;
        // last_step_cmd = step_cmd;            
    end
end    

// UART
wire[15:0] atxd;
std_reg #(.WIDTH(8)) atx_data_reg(sysclk, sysreset, atxd, r_load_data[7:0], r_load[`DR_ATX_DATA]);
wire[15:0] atxc;
wire txbsy;
wire rxbsy;
assign r[`DR_ATX_CTRL] = {atxc[15:3], rxbsy, txbsy, atxc[0]};
std_reg #(.WIDTH(1)) atx_ctrl_reg(sysclk, sysreset, atxc, r_load_data[0], r_load[`DR_ATX_CTRL]);
uart_v2_tx utx (
     .uart_sample_clk(clk_async) // clocked at 4x bit rate.
    ,.parallel_in    (atxd[7:0])
    ,.load_data      (r[`DR_ATX_CTRL][0])
    ,.tx_line        (async_tx_line)
    ,.tx_busy        (txbsy)
);    
uart_v2_rx urx (
     .uart_sample_clk(clk_async) // clocked at 4x bit rate.
    ,.rx_line        (async_rx_line)
    ,.rx_busy        (rxbsy)
    ,.parallel_out   (r[`DR_ATX_DATA])
);
assign r[`DR_ATX_DATA][15:8] = 8'd0;


// on-chip M9K RAM for target MCU program.
std_reg #(.WIDTH(10)) m9k_addr_reg(sysclk, sysreset, r[`DR_M9K_ADDR], r_load_data[9:0], r_load[`DR_M9K_ADDR]);
wire[15:0] m9k_data;
std_reg m9k_data_reg(sysclk, sysreset, m9k_data, r_load_data, r_load[`DR_M9K_DATA]);
reg m9k_wren = 0;
always_ff @(posedge sysreset or posedge sysclk) begin
    if (sysreset)
        m9k_wren <= 0;
    else
        m9k_wren <= r_load[`DR_M9K_DATA];
end
ram2port	target_program (
	.address_a ( r[`DR_M9K_ADDR][9:0] ),
	.address_b ( tg_code_addr[9:0] ),
	.clock_a ( clk_progmem ),
	.clock_b ( clk_progmem ),
	.data_a ( m9k_data ),
	.data_b ( 16'd0 ),
	.wren_a ( m9k_wren ),
	.wren_b ( 1'd0 ),
	.q_a ( r[`DR_M9K_DATA] ),
	.q_b ( rom_code_in )
	);
// Quartus II software searches for the altsyncram init_file in the project directory, 
// the project db directory, user libraries, and the current source file location.

// target_program tgrom(
    // .addr(tg_code_addr),
    // .data(rom_code_in)
// );

endmodule
