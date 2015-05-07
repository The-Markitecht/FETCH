`include <header.v>
`include "target_program_defines.v"
`include "visor_program_defines.v"

////////////////////////////////////////////////////////////////////////////
// Synapse316 with attached debugging supervisor.
// supervisor is inserted between target Synapse316 MCU and its code memory.

module supervised_synapse316 (
     input wire                       sysclk            
    ,input wire                       sysreset          
    ,input wire                       clk_progmem
    ,input wire                       clk_async
    
    ,input wire                       mcu_wait_in    
    ,output wire                      visor_break_mode
    
    ,input wire                       boot_break
    
    // register file, for any combination of general-purpose registers and i/o addressing.
    // these ports can run as a 2-dimensional in Quartus or ModelSim.  but that's a syntax error in Icarus, regardless of options.
    ,input wire[15:0]                 r[`TOP_REG:0]
    ,output wire[`TOP_REG:0]          r_read    
    ,output wire[`TOP_REG:0]          r_load
    ,output wire[15:0]                r_load_data    

    // visor async interface.
    ,input wire                       dbg_async_rx_line
    ,output wire                      dbg_async_tx_line
); 

// ################################ target Synapse316 with code ROM.

wire[15:0]                 tg_code_addr;
wire[15:0]                 tg_code_in;
wire                       tg_code_ready;
wire[15:0]                 tg_r[`TOP_REG:0];
wire[`TOP_REG:0]           tg_r_read;  
wire[`TOP_REG:0]           tg_r_load;
wire                       tg_reset;
wire[`DEBUG_IN_WIDTH-1:0]  tg_debug_in;
wire[`DEBUG_OUT_WIDTH-1:0] tg_debug_out; 
// wire[15:0]                 rom_code_in;
// wire                       rom_code_ready = 1;
// target_program rom(
    // .addr(tg_code_addr),
    // .data(rom_code_in)
// );
synapse316 target (
    .sysclk          (sysclk      ) ,
    .sysreset        (tg_reset    ) ,
    .code_addr       (tg_code_addr   ) ,
    .code_in         (tg_code_in) ,
    .code_ready      (tg_code_ready  ) ,
    .r               (tg_r),
    .r_read          (tg_r_read),
    .r_load          (tg_r_load),
    .r_load_data     (r_load_data),
    .debug_out       (tg_debug_out),
    .debug_in        (tg_debug_in)
);    

// slice DEBUG_PEEK_REG off the top of the target's register file.
wire[15:0] peek_data;
assign tg_r[`DEBUG_PEEK_REG] = peek_data;
assign tg_r[`DEBUG_PEEK_REG-1:0] = r[`DEBUG_PEEK_REG-1:0];
assign r_read = {1'b0, tg_r_read[`DEBUG_PEEK_REG-1:0]};
assign r_load = {1'b0, tg_r_load[`DEBUG_PEEK_REG-1:0]};
std_reg peek_data_reg (sysclk, sysreset, peek_data, r_load_data, tg_r_load[`DEBUG_PEEK_REG]);
    
// ############################## supervisor Synapse316 
// with its own code ROM.  totally independent of the target MCU.

wire[15:0] code_addr;
wire[15:0] code_fetched;
wire[15:0]                vr[`VISOR_TOP_REG:0];
wire[`VISOR_TOP_REG:0]    vr_read;  
wire[`VISOR_TOP_REG:0]    vr_load;
wire[15:0]                vr_load_data;  
// visor_program rom(
    // .addr(code_addr),
    // .data(code_fetched)
// );
visor_pgm visor_rom(
    .clock(clk_progmem),
    .address(code_addr[9:0]),
    .q(code_fetched)
);
synapse316 #(.NUM_REGS(`VISOR_NUM_REGS)) visor (
    .sysclk          (sysclk      ) ,
    .sysreset        (sysreset   ) ,
    .code_addr       (code_addr   ) ,
    .code_in         (code_fetched) ,
    .code_ready      (1'b1  ) ,
    .r               (vr),
    .r_read          (vr_read),
    .r_load          (vr_load),
    .r_load_data     (vr_load_data),
    .debug_out       (),
    .debug_in        (`DEBUG_IN_WIDTH'd0)    
);    

std_reg gp_reg[`VISOR_TOP_GP:0](sysclk, sysreset, vr[`VISOR_TOP_GP:0], vr_load_data, vr_load[`VISOR_TOP_GP:0]);

stack_reg #(.DEPTH(32)) rstk(sysclk, sysreset, vr[`DR_RSTK], vr_load_data, vr_load[`DR_RSTK], vr_read[`DR_RSTK]);

// plumbing of visor outputs, target inputs.
std_reg output_reg[5:0](sysclk, sysreset, vr[`DR_POKE_DATA:`DR_BP0_ADDR], vr_load_data, vr_load[`DR_POKE_DATA:`DR_BP0_ADDR]);
wire[15:0] force_opcode         = vr[`DR_FORCE_OPCODE];
wire[15:0] poke_data            = vr[`DR_POKE_DATA];

// irregular sized outputs.
reg bp_hit = 0;
reg bp_matched = 0;
wire bp_step = vr[`DR_BUS_CTRL][3];
wire divert_code_bus = vr[`DR_BUS_CTRL][2];
assign tg_reset      =  sysreset || vr[`DR_BUS_CTRL][1];
assign tg_code_ready = divert_code_bus ? vr[`DR_BUS_CTRL][0] : ! (mcu_wait_in || bp_hit);
assign visor_break_mode = ! tg_code_ready;
wire[15:0]                 rom_code_in;
assign tg_code_in = divert_code_bus ? force_opcode : rom_code_in;
std_reg #(.WIDTH(4)) bus_ctrl_reg(sysclk, sysreset, vr[`DR_BUS_CTRL], vr_load_data[3:0], vr_load[`DR_BUS_CTRL]);

std_reg #(.WIDTH(3)) force_reg(sysclk, sysreset, vr[`DR_TG_FORCE], vr_load_data[`DEBUG_IN_WIDTH-1:0], vr_load[`DR_TG_FORCE]);
assign tg_debug_in   = vr[`DR_TG_FORCE][`DEBUG_IN_WIDTH-1:0]; // {debug_force_exec, debug_force_load_exr, debug_hold_state}

// plumbing of visor inputs, target outputs.
reg[15:0] exr_shadow = 0;    
assign vr[`SR_EXR_SHADOW] = exr_shadow; 
assign vr[`SR_TG_CODE_ADDR] = tg_code_addr; 
assign vr[`SR_PEEK_DATA] = peek_data; 

// irregular sized inputs.
//assign vr[`SR_TG_DEBUG_OUT][`DEBUG_OUT_WIDTH-1:0] = tg_debug_out;
assign vr[`SR_BP_STATUS] = {15'h0, bp_hit}; 
assign vr[`SR_BOOT_BREAK] = {15'h0, boot_break}; 

// hardware breakpoints & debugger logic.
wire tg_debug_loading_exr = tg_debug_out[1];
wire tg_debug_enable_exec = tg_debug_out[0];
wire program_break = tg_debug_out[6];
wire bp_matched_comb =   tg_code_addr == vr[`DR_BP0_ADDR] 
                      || tg_code_addr == vr[`DR_BP1_ADDR] 
                      || tg_code_addr == vr[`DR_BP2_ADDR] 
                      || tg_code_addr == vr[`DR_BP3_ADDR]
                      || bp_step || program_break;
wire bp_load_comb =    vr_load[`DR_BP0_ADDR] 
                    || vr_load[`DR_BP1_ADDR] 
                    || vr_load[`DR_BP2_ADDR] 
                    || vr_load[`DR_BP3_ADDR];
always_ff @(posedge sysreset, posedge sysclk) begin
    if (sysreset) begin
        exr_shadow <= 0;
        bp_hit <= 0;
        bp_matched <= 0;
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
    end
end    

// debugger UART
wire[15:0] atxd;
std_reg #(.WIDTH(8)) atx_data_reg(sysclk, sysreset, atxd, vr_load_data[7:0], vr_load[`DR_ATX_DATA]);
wire[15:0] atxc;
wire txbsy;
wire rxbsy;
assign vr[`DR_ATX_CTRL] = {atxc[15:3], rxbsy, txbsy, atxc[0]};
std_reg #(.WIDTH(1)) atx_ctrl_reg(sysclk, sysreset, atxc, vr_load_data[0], vr_load[`DR_ATX_CTRL]);
uart_v2_tx utx (
     .uart_sample_clk(clk_async) // clocked at 4x bit rate.
    ,.parallel_in    (atxd[7:0])
    ,.load_data      (vr[`DR_ATX_CTRL][0])
    ,.tx_line        (dbg_async_tx_line)
    ,.tx_busy        (txbsy)
);    
uart_v2_rx urx (
     .uart_sample_clk(clk_async) // clocked at 4x bit rate.
    ,.rx_line        (dbg_async_rx_line)
    ,.rx_busy        (rxbsy)
    ,.parallel_out   (vr[`DR_ATX_DATA][7:0])
);
assign vr[`DR_ATX_DATA][15:8] = 8'd0;


// on-chip M9K RAM for target MCU program.  dual-ported.
std_reg #(.WIDTH(10)) m9k_addr_reg(sysclk, sysreset, vr[`DR_M9K_ADDR], vr_load_data[9:0], vr_load[`DR_M9K_ADDR]);
wire[15:0] m9k_data;
std_reg m9k_data_reg(sysclk, sysreset, m9k_data, vr_load_data, vr_load[`DR_M9K_DATA]);
reg m9k_wren = 0;
always_ff @(posedge sysreset, posedge sysclk) begin
    if (sysreset)
        m9k_wren <= 0;
    else
        m9k_wren <= vr_load[`DR_M9K_DATA];
end
ram2port	target_program (
	.address_a ( vr[`DR_M9K_ADDR][9:0] ),
	.address_b ( tg_code_addr[9:0] ),
	.clock_a ( clk_progmem ),
	.clock_b ( clk_progmem ),
	.data_a ( m9k_data ),
	.data_b ( 16'd0 ),
	.wren_a ( m9k_wren ),
	.wren_b ( 1'd0 ),
	.q_a ( vr[`DR_M9K_DATA] ),
	.q_b ( rom_code_in )
	);
// Quartus II software searches for the altsyncram init_file in the project directory, 
// the project db directory, user libraries, and the current source file location.

// target_program tgrom(
    // .addr(tg_code_addr),
    // .data(rom_code_in)
// );

endmodule
