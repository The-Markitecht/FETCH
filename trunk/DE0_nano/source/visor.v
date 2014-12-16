`include "header.v"
`include "visor_program_defines.v"

// synthesize with SystemVerilog

////////////////////////////////////////////////////////////////////////////
// debugging supervisor module.  
// to be inserted between Synapse316 MCU and its code ROM.

module visor (
     input 		          		sysclk
    ,input 		          		sysreset
    
    // signals from target's code ROM.
    ,input[15:0]                 rom_code_in
    ,input                       rom_code_ready
    
    // signals to & from the target MCU.
    ,input[15:0]                 tg_code_addr
    ,output[15:0]                tg_code_in
    ,output                      tg_code_ready
    ,output[`DEBUG_IN_WIDTH-1:0] tg_debug_in
    ,input[`DEBUG_OUT_WIDTH-1:0] tg_debug_out
    ,output                      tg_reset
    ,input[15:0]                 tg_peek_data
    ,output[15:0]                tg_poke_data
    
    // Avalon MM master
    ,output[15:0]                av_address
    ,input                       av_waitrequest
    ,output[15:0]                av_writedata
    ,output                      av_write
);

// supervisor Synapse 316 with its own code ROM.  totally independent of the target MCU.
wire[15:0] code_addr;
wire[15:0] code_fetched;
wire[15:0]                r[`VISOR_TOP_REG:0];
wire[`VISOR_TOP_REG:0]    r_read;  
wire[`VISOR_TOP_REG:0]    r_load;
wire[15:0]                r_load_data;  
visor_program rom(
    .addr(code_addr),
    .data(code_fetched)
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
    .debug_in        (0)    
);    

std_reg gp_reg[`VISOR_TOP_GP:0](sysclk, sysreset, r[`VISOR_TOP_GP:0], r_load_data, r_load[`VISOR_TOP_GP:0]);

// plumbing of visor outputs, target inputs.
std_reg output_reg[5:0](sysclk, sysreset, r[`DR_POKE_DATA:`DR_BP0_ADDR], r_load_data, r_load[`DR_POKE_DATA:`DR_BP0_ADDR]);
wire[15:0] force_opcode         = r[`DR_FORCE_OPCODE];
wire[15:0] poke_data            = r[`DR_POKE_DATA];

// irregular sized outputs.
reg bp_hit = 0;
reg bp_matched = 0;
wire divert_code_bus = r[`DR_BUS_CTRL][2];
assign tg_reset      =  sysreset || r[`DR_BUS_CTRL][1];
assign tg_code_ready = divert_code_bus ? (r[`DR_BUS_CTRL][0] /* || step_cycle */ ) : (rom_code_ready && ! bp_hit);
assign tg_code_in = divert_code_bus ? force_opcode : rom_code_in;
std_reg #(.WIDTH(3)) bus_ctrl_reg(sysclk, sysreset, r[`DR_BUS_CTRL][2:0], r_load_data[2:0], r_load[`DR_BUS_CTRL]);

std_reg #(.WIDTH(3)) force_reg(sysclk, sysreset, r[`DR_TG_FORCE][`DEBUG_IN_WIDTH-1:0], r_load_data[`DEBUG_IN_WIDTH-1:0], r_load[`DR_TG_FORCE]);
assign tg_debug_in   = r[`DR_TG_FORCE][`DEBUG_IN_WIDTH-1:0]; // {debug_force_exec, debug_force_load_exr, debug_hold_state}

// plumbing of visor inputs, target outputs.
reg[15:0] exr_shadow = 0;    
assign r[`SR_EXR_SHADOW] = exr_shadow; 
assign r[`SR_TG_CODE_ADDR] = tg_code_addr; 
assign r[`SR_PEEK_DATA] = tg_peek_data; 

// irregular sized inputs.
//assign r[`SR_TG_DEBUG_OUT][`DEBUG_OUT_WIDTH-1:0] = tg_debug_out;
assign r[`SR_BP_STATUS] = {15'h0, bp_hit}; 

//reg step_cycle = 0;
//wire step_cmd = regs[14][3];
//reg last_step_cmd = 0;

// debugger logic
wire tg_debug_loading_exr = tg_debug_out[1];
wire tg_debug_enable_exec = tg_debug_out[0];
wire bp_matched_comb =   tg_code_addr == r[`DR_BP0_ADDR] 
                      || tg_code_addr == r[`DR_BP1_ADDR] 
                      || tg_code_addr == r[`DR_BP2_ADDR] 
                      || tg_code_addr == r[`DR_BP3_ADDR];
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

endmodule
