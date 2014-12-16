`include "header.v"
`include "visor_program_defines.v"

// synthesize with SystemVerilog

////////////////////////////////////////////////////////////////////////////
// debugging supervisor module.  
// to be inserted between Synapse316 MCU and its code ROM.

module visor (
     interface            clk            // clock_ifc.s     
    
    // signals to & from the target MCU.
    ,interface            tg_code        // code_ifc.s      
    ,interface            tg_debug       // debug_ifc.m     
    ,output               tg_reset             
    ,input[15:0]          tg_peek_data      
    ,output[15:0]         tg_poke_data      
    
    // signals from target's code ROM.
    ,interface            tg_rom         // code_ifc.m      

    ,interface            av             // avalon_mm_ifc.m 
);

// supervisor Synapse 316 with its own code ROM.  totally independent of the target MCU.
code_ifc    code();
reg_ifc     r[`VISOR_TOP_REG:0]();
visor_program rom(
    .clk, 
    .code
);
debug_ifc   vdebug();
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

genvar i;
generate  
    for (i=0; i < `VISOR_NUM_GP; i=i+1) begin: gp
        std_reg gp_reg(.clk, .r(r[i]));
    end  
endgenerate     

// plumbing of visor outputs, target inputs.
std_reg poke_data_reg(.clk, .r(r[`DR_POKE_DATA]));
assign tg_poke_data = r[`DR_POKE_DATA].q;
std_reg bp0(.clk, .r(r[`DR_BP0_ADDR]));
std_reg bp1(.clk, .r(r[`DR_BP1_ADDR]));
std_reg bp2(.clk, .r(r[`DR_BP2_ADDR]));
std_reg bp3(.clk, .r(r[`DR_BP3_ADDR]));

// irregular sized outputs.
reg bp_hit = 0;
reg bp_matched = 0;
wire divert_code_bus = r[`DR_BUS_CTRL].q[2];
assign tg_reset      =  clk.reset || r[`DR_BUS_CTRL].q[1];
assign tg_code.code_ready = divert_code_bus ? (r[`DR_BUS_CTRL].q[0] /* || step_cycle */ ) : (tg_rom.code_ready && ! bp_hit);
assign tg_code.content = divert_code_bus ? r[`DR_FORCE_OPCODE].q : tg_rom.content;
assign tg_rom.addr = tg_code.addr;
narrow_reg #(.WIDTH(3)) bus_ctrl_reg(.clk, .r(r[`DR_BUS_CTRL]));

narrow_reg #(.WIDTH(`DEBUG_IN_WIDTH)) force_reg(.clk, .r(r[`DR_TG_FORCE]));
assign tg_debug.force_exec      = r[`DR_TG_FORCE].q[2];
assign tg_debug.force_load_exr  = r[`DR_TG_FORCE].q[1];
assign tg_debug.hold_state      = r[`DR_TG_FORCE].q[0];

// plumbing of visor inputs, target outputs.
reg[15:0] exr_shadow = 0;    
assign r[`SR_EXR_SHADOW].q = exr_shadow; 
assign r[`SR_TG_CODE_ADDR].q = tg_code.addr; 
assign r[`SR_PEEK_DATA].q = tg_peek_data; 

// irregular sized inputs.
assign r[`SR_BP_STATUS].q = {15'h0, bp_hit}; 

//reg step_cycle = 0;
//wire step_cmd = regs[14][3];
//reg last_step_cmd = 0;

// debugger logic
wire bp_matched_comb =   tg_code.addr == r[`DR_BP0_ADDR].q 
                      || tg_code.addr == r[`DR_BP1_ADDR].q 
                      || tg_code.addr == r[`DR_BP2_ADDR].q 
                      || tg_code.addr == r[`DR_BP3_ADDR].q;
wire bp_load_comb =    r[`DR_BP0_ADDR].load 
                    || r[`DR_BP1_ADDR].load 
                    || r[`DR_BP2_ADDR].load 
                    || r[`DR_BP3_ADDR].load;
always_ff @(posedge clk.reset or posedge clk.clk) begin
    if (clk.reset) begin
        exr_shadow <= 0;
        bp_hit <= 0;
        bp_matched <= 0;
        //step_cycle <= 0;
        //last_step_cmd <= 0;
    end else if (clk.clk) begin
        if (tg_debug.load_exr && ! divert_code_bus)
            exr_shadow <= tg_rom.content;
            
        if (bp_load_comb) begin
            bp_matched <= 0;
            bp_hit <= 0;
        end else begin
            if (bp_matched_comb) begin
                bp_matched <= 1;
            end
            if (tg_debug.enable_exec && (bp_matched || bp_matched_comb)) begin
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
