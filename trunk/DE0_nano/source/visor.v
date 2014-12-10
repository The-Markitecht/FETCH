`include "header.v"

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
    ,output[`DEBUG_IN_WIDTH-1:0]  tg_debug_in
    ,input[`DEBUG_OUT_WIDTH-1:0]  tg_debug_out
    ,output                      tg_reset
    ,input[15:0]                 tg_to_visor_reg
    ,output[15:0]                tg_from_visor_reg
    
    // Avalon MM master
    ,output[15:0]                av_address
    ,input                       av_waitrequest
    ,output[15:0]                av_writedata
    ,output                      av_write
);

// supervisor Synapse 316 with its own code ROM.  totally independent of the target MCU.
wire[15:0] code_addr;
wire[15:0] code_fetched;
wire[15:0]     r[`TOP_REG:0];
wire[`TOP_REG:0] r_load;
wire[15:0]   data_in[`TOP_DATA_INPUT:0];
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
    .r               (r),
    .r_load          (r_load),
    .data_in         (data_in),
    .debug_out       (),
    .debug_in        (0)    
);    

// plumbing of target outputs, visor inputs.
reg bp_hit = 0;
//reg step_cycle = 0;
reg[15:0] exr_shadow = 0;    
wire tg_loading_exr = tg_debug_out[1];
wire tg_enable_exec = tg_debug_out[0];
assign data_in[0] = tg_code_addr;
assign data_in[1] = tg_to_visor_reg;
assign data_in[2][`DEBUG_OUT_WIDTH-1:0] = tg_debug_out;
assign data_in[3] = exr_shadow; 
assign data_in[4] = {15'h0, bp_hit}; 
assign data_in[5] = {15'h0, av_waitrequest}; 

// plumbing of target inputs, visor outputs.
assign tg_debug_in = {r[15][`DEBUG_IN_WIDTH-1:0]}; // {debug_force_exec, debug_force_load_exr, debug_hold}
//wire step_cmd = regs[14][3];
//reg last_step_cmd = 0;
wire divert_code_bus = r[14][2];
assign tg_reset =  sysreset || r[14][1];
assign tg_code_ready = divert_code_bus ? (r[14][0] /* || step_cycle */ ) : (rom_code_ready && ! bp_hit);
assign tg_from_visor_reg = r[13];
assign tg_code_in = divert_code_bus ? r[12] : rom_code_in;
wire[15:0] bp3_addr = r[11];
wire[15:0] bp2_addr = r[10];
wire[15:0] bp1_addr = r[9];
wire[15:0] bp0_addr = r[8];
assign av_writedata = r[7];
assign av_write     = r[6][15];
assign av_address   = {1'b0, r[6][14:0]};

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
