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
std_reg output_reg[7:0](sysclk, sysreset, r[`VIO+7:`VIO], r_load_data, r_load[`VIO+7:`VIO]);
wire[15:0] bp_addr[3:0];
assign bp_addr[0]               = r[`VIO + 0];
assign bp_addr[1]               = r[`VIO + 1];
assign bp_addr[2]               = r[`VIO + 2];
assign bp_addr[3]               = r[`VIO + 3];
wire[15:0] force_opcode         = r[`VIO + 4];
wire[15:0] poke_data            = r[`VIO + 5];
assign av_writedata             = r[`VIO + 6];
assign av_address               = r[`VIO + 7];

// irregular sized outputs.
reg bp_hit = 0;
wire divert_code_bus = r[`VIO + 8][2];
assign tg_reset      =  sysreset || r[`VIO + 8][1];
assign tg_code_ready = divert_code_bus ? (r[`VIO + 8][0] /* || step_cycle */ ) : (rom_code_ready && ! bp_hit);
assign tg_code_in = divert_code_bus ? force_opcode : rom_code_in;
std_reg #(.WIDTH(3)) bus_ctrl_reg(sysclk, sysreset, r[`VIO + 8][2:0], r_load_data[2:0], r_load[`VIO + 8]);

std_reg #(.WIDTH(3)) force_reg(sysclk, sysreset, r[`VIO + 9][`DEBUG_IN_WIDTH-1:0], r_load_data[`DEBUG_IN_WIDTH-1:0], r_load[`VIO + 9]);
assign tg_debug_in   = r[`VIO + 9][`DEBUG_IN_WIDTH-1:0]; // {debug_force_exec, debug_force_load_exr, debug_hold}

std_reg #(.WIDTH(2)) av_ctrl_reg(sysclk, sysreset, r[`VIO + 10][1:0], r_load_data[1:0], r_load[`VIO + 10]);
assign av_write      = r[`VIO + 10][0];

// plumbing of visor inputs, target outputs.
reg[15:0] exr_shadow = 0;    
assign r[`VIO + 11] = exr_shadow; 
assign r[`VIO + 12] = tg_code_addr; 
assign r[`VIO + 13] = tg_peek_data; 

// irregular sized inputs.
assign r[`VIO + 14][`DEBUG_OUT_WIDTH-1:0] = tg_debug_out;
assign r[`VIO + 15] = {15'h0, bp_hit}; 
assign r[`VIO + 16] = {15'h0, av_waitrequest}; 

//reg step_cycle = 0;
//wire step_cmd = regs[14][3];
//reg last_step_cmd = 0;

// debugger logic
wire tg_loading_exr = tg_debug_out[1];
wire tg_enable_exec = tg_debug_out[0];
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
        else if ((tg_code_addr == bp_addr[0] || tg_code_addr == bp_addr[1] || 
            tg_code_addr == bp_addr[2] || tg_code_addr == bp_addr[3]) && tg_enable_exec)
            bp_hit <= 1;
        
        // if (step_cmd && ! last_step_cmd)
            // step_cycle <= 1;
        // else
            // step_cycle <= 0;
        // last_step_cmd = step_cmd;            
    end
end    


endmodule
