
////////////////////////////////////////////////////////////////////////////
// Synapse316 with attached debugging supervisor.

module supervised_synapse316 #(
    parameter IPR_WIDTH = 16,
    parameter IPR_TOP = IPR_WIDTH - 1,
    parameter NUM_REGS = 16,
    parameter TOP_REG = NUM_REGS - 1,
    parameter NUM_DATA_INPUTS = 16,
    parameter TOP_DATA_INPUT = NUM_DATA_INPUTS - 1,
    parameter DEBUG_IN_WIDTH = 3,
    parameter DEBUG_OUT_WIDTH = 6,
    parameter DEBUG_REG_NUM = TOP_REG,
    parameter DEBUG_DATA_INPUT_NUM = TOP_DATA_INPUT
) (
     input                       sysclk            
    ,input                       sysreset          

    ,output[15:0]                r[TOP_REG:0]
    ,output[TOP_REG:0]           r_load
    
    ,input[15:0]                 data_in[TOP_DATA_INPUT:0]
    
    // Avalon MM master
    ,output[15:0]                dbg_av_address
    ,input                       dbg_av_waitrequest
    ,output[15:0]                dbg_av_writedata
    ,output                      dbg_av_write
    
); 

// Synapse316 with code ROM.
wire[15:0]                 rom_code_in;
wire                       rom_code_ready = 1;
reg                        rom_wait = 0; // useful for simulation only.
wire[15:0]                 tg_code_addr;
wire[15:0]                 tg_code_in;
wire                       tg_code_ready;
wire[15:0]                 tg_r[TOP_REG:0];
wire[TOP_REG:0]            tg_r_load;
wire                       tg_reset;
wire[DEBUG_IN_WIDTH-1:0]   tg_debug_in;
wire[DEBUG_OUT_WIDTH-1:0]  tg_debug_out; 
wire[15:0]                 tg_from_visor;
assign r = tg_r;
assign r_load = tg_r_load;
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
    .r_load          (tg_r_load),
    .data_in         ({tg_from_visor, data_in}),
    .debug_out       (tg_debug_out),
    .debug_in        (tg_debug_in)
);    

// debugging supervisor.
visor visr(
     .sysclk          (sysclk)
    ,.sysreset        (sysreset)
    ,.rom_code_in     (rom_wait ? 16'hffff : rom_code_in)
    ,.rom_code_ready  (rom_code_ready && ! rom_wait)
    ,.tg_code_addr    (tg_code_addr  )
    ,.tg_code_in      (tg_code_in    )
    ,.tg_code_ready   (tg_code_ready )
    ,.tg_debug_in     (tg_debug_in   )
    ,.tg_debug_out    (tg_debug_out  )
    ,.tg_reset        (tg_reset      )
    ,.tg_to_visor_reg (r[DEBUG_REG_NUM]    )
    ,.tg_from_visor_reg(tg_from_visor)
    ,.av_address      (dbg_av_address     )
    ,.av_waitrequest  (dbg_av_waitrequest )
    ,.av_writedata    (dbg_av_writedata   )
    ,.av_write        (dbg_av_write       )    
);

endmodule
