`include "header.v"
`include "visor_program_defines.v"

// synthesize with SystemVerilog

////////////////////////////////////////////////////////////////////////////
// debugging supervisor module.  
// to be inserted between Synapse316 MCU and its code ROM.

module visor (
    clock_ifc.s                  clk
    
    // signals to & from the target MCU.
    ,code_ifc.s                  tg_code
    ,debug_ifc.m                 tg_debug
    ,output                      tg_reset
    ,input[15:0]                 tg_peek_data
    ,output[15:0]                tg_poke_data
    
    // signals from target's code ROM.
    ,code_ifc.m                  tg_rom

    ,avalon_mm_ifc.m             av
);

// supervisor Synapse 316 with its own code ROM.  totally independent of the target MCU.
code_ifc    code;
reg_ifc     r[`VISOR_TOP_REG:0];
visor_program rom(.code);
debug_ifc   vdebug;
assign vdebug.hold_state = 0;
assign vdebug.force_load_exr = 0;
assign vdebug.force_exec = 0;
synapse316 #(
    .NUM_REGS(`VISOR_NUM_REGS)
) mcu(
    .clk,
    .code,
    .r,
    .debug(vdebug)
);

std_reg gp_reg[`VISOR_TOP_GP:0](.clk, .r(r[`VISOR_TOP_GP:0]));

// plumbing of visor outputs, target inputs.
std_reg output_reg[5:0](.clk, .r(r[`DR_POKE_DATA:`DR_BP0_ADDR]));
assign tg_poke_data = r[`DR_POKE_DATA].q;

// irregular sized outputs.
reg bp_hit = 0;
wire divert_code_bus = r[`DR_BUS_CTRL].q[2];
assign tg_reset      =  sysreset || r[`DR_BUS_CTRL].q[1];
assign tg_code.code_ready = divert_code_bus ? (r[`DR_BUS_CTRL].q[0] /* || step_cycle */ ) : (tg_rom.code_ready && ! bp_hit);
assign tg_code.content = divert_code_bus ? r[`DR_FORCE_OPCODE].q : tg_rom.content;
patch: stopped here.  can't slice a whole interface.  figure out how to wire these odd i/o's.
make a width-adapter module??  yeah!
std_reg #(.WIDTH(3)) bus_ctrl_reg(.clk, .r(r[`DR_BUS_CTRL][2:0], r_load_data[2:0], r_load[`DR_BUS_CTRL]);

std_reg #(.WIDTH(3)) force_reg(sysclk, sysreset, r[`DR_TG_FORCE][`DEBUG_IN_WIDTH-1:0], r_load_data[`DEBUG_IN_WIDTH-1:0], r_load[`DR_TG_FORCE]);
assign tg_debug_in   = r[`DR_TG_FORCE][`DEBUG_IN_WIDTH-1:0]; // {debug_force_exec, debug_force_load_exr, debug_hold}

// plumbing of visor inputs, target outputs.
reg[15:0] exr_shadow = 0;    
assign r[`SR_EXR_SHADOW] = exr_shadow; 
assign r[`SR_TG_CODE_ADDR] = tg_code_addr; 
assign r[`SR_PEEK_DATA] = tg_peek_data; 

// irregular sized inputs.
assign r[`SR_TG_DEBUG_OUT][`DEBUG_OUT_WIDTH-1:0] = tg_debug_out;
assign r[`SR_BP_STATUS] = {15'h0, bp_hit}; 

//reg step_cycle = 0;
//wire step_cmd = regs[14][3];
//reg last_step_cmd = 0;

// debugger logic
always @(posedge sysreset or posedge sysclk) begin
    if (sysreset) begin
        exr_shadow <= 0;
        bp_hit <= 0;
        //step_cycle <= 0;
        //last_step_cmd <= 0;
    end else if (sysclk) begin
        if (tg_debug.loading_exr && ! divert_code_bus)
            exr_shadow <= tg_rom.content;
            
        if (r[`DR_BP0_ADDR].load || r[`DR_BP1_ADDR].load || r[`DR_BP2_ADDR].load || r[`DR_BP3_ADDR].load)
            bp_hit <= 0;
        else if ((tg_code_addr == r[`DR_BP0_ADDR].q 
            || tg_code_addr == r[`DR_BP1_ADDR].q 
            || tg_code_addr == r[`DR_BP2_ADDR].q 
            || tg_code_addr == r[`DR_BP3_ADDR].q) 
            && tg_debug.enable_exec)
            bp_hit <= 1;
        
        // if (step_cmd && ! last_step_cmd)
            // step_cycle <= 1;
        // else
            // step_cycle <= 0;
        // last_step_cmd = step_cmd;            
    end
end    


endmodule
