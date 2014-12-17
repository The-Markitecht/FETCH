`include "header.v"

////////////////////////////////////////////////////////////////////////////
// Synapse316 with attached debugging supervisor.

module supervised_synapse316 (
     input                       sysclk            
    ,input                       sysreset          

    ,input                       mcu_wait
    
    // register file, for any combination of general-purpose registers and i/o addressing.
    // these ports can run as a 2-dimensional in Quartus or ModelSim.  but that's a syntax error in Icarus, regardless of options.
    ,input[15:0]                 r[`TOP_REG:0]
    ,output[`TOP_REG:0]          r_read    
    ,output[`TOP_REG:0]          r_load
    ,output[15:0]                r_load_data    
    
    // Avalon MM master
    ,output[15:0]                dbg_av_address
    ,input                       dbg_av_waitrequest
    ,output[15:0]                dbg_av_writedata
    ,output                      dbg_av_write
    
); 

// Synapse316 with code ROM.
wire[15:0]                 rom_code_in;
wire                       rom_code_ready = 1;
wire[15:0]                 tg_code_addr;
wire[15:0]                 tg_code_in;
wire                       tg_code_ready;
wire[15:0]                 tg_r[`TOP_REG:0];
wire[`TOP_REG:0]           tg_r_read;  
wire[`TOP_REG:0]           tg_r_load;
wire                       tg_reset;
wire[`DEBUG_IN_WIDTH-1:0]  tg_debug_in;
wire[`DEBUG_OUT_WIDTH-1:0] tg_debug_out; 
target_program rom(
    .addr(tg_code_addr),
    .data(rom_code_in)
);
synapse316 target(
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
    
// debugging supervisor.
visor visr(
     .sysclk          (sysclk)
    ,.sysreset        (sysreset)
    ,.rom_code_in     (mcu_wait ? 16'hffff : rom_code_in)
    ,.rom_code_ready  (rom_code_ready && ! mcu_wait)
    ,.tg_code_addr    (tg_code_addr  )
    ,.tg_code_in      (tg_code_in    )
    ,.tg_code_ready   (tg_code_ready )
    ,.tg_debug_in     (tg_debug_in   )
    ,.tg_debug_out    (tg_debug_out  )
    ,.tg_reset        (tg_reset      )
    ,.tg_peek_data    (peek_data     )
    ,.tg_poke_data    ()
    ,.av_address      (dbg_av_address     )
    ,.av_waitrequest  (dbg_av_waitrequest )
    ,.av_writedata    (dbg_av_writedata   )
    ,.av_write        (dbg_av_write       )    
);

endmodule
