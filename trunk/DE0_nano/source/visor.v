`timescale 1 ns / 1 ns

// synthesize with SystemVerilog

////////////////////////////////////////////////////////////////////////////
// debugging supervisor module.  
// to be inserted between Synapse316 MCU and its code ROM.

module visor #(
    parameter IPR_WIDTH = 16,
    parameter IPR_TOP = IPR_WIDTH - 1,
    parameter NUM_REGS = 16,
    parameter TOP_REG = NUM_REGS - 1,
    parameter REGS_FLAT_WIDTH = NUM_REGS * 16,
    parameter NUM_DATA_INPUTS = 16,
    parameter TOP_DATA_INPUT = NUM_DATA_INPUTS - 1,
    parameter DATA_INPUT_FLAT_WIDTH = NUM_DATA_INPUTS * 16,
    parameter DEBUG_IN_WIDTH = 3,
    parameter DEBUG_OUT_WIDTH = 6,
    parameter DEBUG_REG_NUM = TOP_REG,
    parameter DEBUG_DATA_INPUT_NUM = TOP_DATA_INPUT    
) (
     input 		          		sysclk
    ,input 		          		sysreset
    
    // signals from target's code ROM.
    ,input[15:0]                 rom_code_in
    ,input                       rom_code_ready
    
    // signals to & from the target MCU.
    ,input[15:0]                 tg_code_addr
    ,output[15:0]                tg_code_in
    ,output                      tg_code_ready
    ,output[DEBUG_IN_WIDTH-1:0]  tg_debug_in
    ,input[DEBUG_OUT_WIDTH-1:0]  tg_debug_out
//    ,input[REGS_FLAT_WIDTH-1:0]  tg_r_flat
//    ,input[TOP_REG:0]            tg_r_load
    ,output                      tg_reset
    ,input[15:0]                 tg_to_visor_reg
    ,output[15:0]                tg_from_visor_reg
/*    
use the target's muxer to access ALL its registers, even operator results.
do that by stuffing an artificial instruction into target, then single-stepping.    
this 2-register coupling depends on visor ability to insert & execute its own instructions in
target's exr.  then (harder) put the correct content back into target's exr so it resumes OK.
might need a few special cycles in the target to reload its pipeline.
and restrict the visor so it interferes ONLY after ordinary assignment cycles, when target's
control flags are in a known state.  the same state the visor needs them to be in for copying
in/out of the target's registers.
  */  
);

// supervisor Synapse 316 with its own code ROM.  totally independent of the target MCU.
wire[15:0] code_addr;
wire[15:0] code_fetched;
wire[REGS_FLAT_WIDTH-1:0]     r_flat;
wire[TOP_REG:0] r_load;
wire[DATA_INPUT_FLAT_WIDTH-1:0]   data_in_flat;
visor_program rom(
    .addr(code_addr),
    .data(code_fetched)
);
synapse316 mcu(
    .sysclk          (sysclk      ) ,
    .sysreset        (sysreset   ) ,
    .code_addr       (code_addr   ) ,
    .code_in         (code_fetched) ,
    .code_ready      (1'b1  ) ,
    .r_flat          (r_flat),
    .r_load          (r_load),
    .data_in_flat    (data_in_flat),
    .debug_out       (),
    .debug_in        (0)    
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

// plumbing of target outputs, visor inputs.
reg bp_hit = 0;
//reg step_cycle = 0;
reg[15:0] exr_shadow = 0;    
wire tg_loading_exr = tg_debug_out[1];
wire tg_enable_exec = tg_debug_out[0];
assign data_in[0].d = tg_code_addr;
assign data_in[1].d = tg_to_visor_reg;
assign data_in[2].d[DEBUG_OUT_WIDTH-1:0] = tg_debug_out;
assign data_in[3].d = exr_shadow; 
assign data_in[4].d = {15'h0, bp_hit}; 

// plumbing of target inputs, visor outputs.
assign tg_debug_in = {regs[15].r[DEBUG_IN_WIDTH-1:0]}; // {debug_force_exec, debug_force_load_exr, debug_hold}
//wire step_cmd = regs[14].r[3];
//reg last_step_cmd = 0;
wire divert_code_bus = regs[14].r[2];
assign tg_reset =  sysreset || regs[14].r[1];
assign tg_code_ready = divert_code_bus ? (regs[14].r[0] /* || step_cycle */ ) : (rom_code_ready && ! bp_hit);
assign tg_from_visor_reg = regs[13].r;
assign tg_code_in = divert_code_bus ? regs[12].r : rom_code_in;
wire[15:0] bp3_addr = regs[11].r;
wire[15:0] bp2_addr = regs[10].r;
wire[15:0] bp1_addr = regs[9].r;
wire[15:0] bp0_addr = regs[8].r;

// debugger logic
always @(posedge sysreset or posedge sysclk) begin
    if (sysreset) begin
        exr_shadow <= 0;
        bp_hit <= 0;
        //step_cycle <= 0;
        //last_step_cmd <= 0;
    end else if (sysclk) begin
        if (tg_loading_exr && ! divert_code_bus)
            exr_shadow <= rom_code_in;
            
        if (r_load[8] || r_load[9] || r_load[10] || r_load[11])
            bp_hit <= 0;
        else if ((tg_code_addr == bp0_addr || tg_code_addr == bp1_addr || 
            tg_code_addr == bp2_addr || tg_code_addr == bp3_addr) && tg_enable_exec)
            bp_hit <= 1;
        
        // if (step_cmd && ! last_step_cmd)
            // step_cycle <= 1;
        // else
            // step_cycle <= 0;
        // last_step_cmd = step_cmd;            
    end
end    


endmodule
