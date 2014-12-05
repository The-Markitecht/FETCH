module visor #(
    parameter IPR_WIDTH = 16,
    parameter IPR_TOP = IPR_WIDTH - 1,
    parameter NUM_REGS = 16,
    parameter TOP_REG = NUM_REGS - 1,
    parameter REGS_FLAT_WIDTH = NUM_REGS * 16,
    parameter NUM_DATA_INPUTS = 16,
    parameter TOP_DATA_INPUT = NUM_DATA_INPUTS - 1,
    parameter DATA_INPUT_FLAT_WIDTH = NUM_DATA_INPUTS * 16
) (
     input 		          		sysclk
    ,input 		          		sysreset
    
    // status LEDs output by the supervisor.
    ,output[7:0]		         led
    
    // signals from target's code ROM.
    ,input[15:0]                 rom_code_in
    ,input                       rom_code_ready
    
    // signals to & from the target MCU.
    ,input[15:0]                 tg_code_addr
    ,output[15:0]                tg_code_in
    ,output                      tg_code_ready
//    ,input[REGS_FLAT_WIDTH-1:0]  tg_r_flat
//    ,input[TOP_REG:0]            tg_r_load
    ,output                      tg_reset
    ,input[15:0]                 tg_to_visor_reg
    ,output[15:0]                tg_from_visor_reg
    
use the target's muxer to access ALL its registers, even operator results.
do that by stuffing an artificial instruction into target, then single-stepping.    
this 2-register coupling depends on visor ability to insert & execute its own instructions in
target's exr.  then (harder) put the correct content back into target's exr so it resumes OK.
might need a few special cycles in the target to reload its pipeline.
and restrict the visor so it interferes ONLY after ordinary assignment cycles, when target's
control flags are in a known state.  the same state the visor needs them to be in for copying
in/out of the target's registers.
    
);

////////////////////////////////////////////////////////////////////////////
// debugging supervisor module.  
// to be inserted between Synapse316 MCU and its code ROM.


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
    .data_in_flat    (data_in_flat)
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

assign led[7:0] = regs[10].r[7:0];



endmodule
