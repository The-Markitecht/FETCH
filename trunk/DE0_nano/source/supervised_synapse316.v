module supervised_synapse316 #(
    parameter IPR_WIDTH = 16,
    parameter IPR_TOP = IPR_WIDTH - 1,
    parameter NUM_REGS = 16,
    parameter TOP_REG = NUM_REGS - 1,
    parameter REGS_FLAT_WIDTH = NUM_REGS * 16,
    parameter NUM_DATA_INPUTS = 16,
    parameter TOP_DATA_INPUT = NUM_DATA_INPUTS - 1,
    parameter DATA_INPUT_FLAT_WIDTH = NUM_DATA_INPUTS * 16,
    parameter DEBUG_IN_WIDTH = 1,
    parameter DEBUG_OUT_WIDTH = 6
) (
     input                       sysclk            
    ,input                       sysreset          

    // i/o ports can run as a 2-dimensional in Quartus.  but that's a syntax error in Icarus, regardless of options.
    // so here it's flattened to 1 dimension.
    ,output[REGS_FLAT_WIDTH-1:0] r_flat
    ,output[TOP_REG:0]           r_load
    
    ,input[DATA_INPUT_FLAT_WIDTH-1:0]  data_in_flat
); 

////////////////////////////////////////////////////////////////////////////

// Synapse 316 with code ROM.
wire[15:0]                 rom_code_in;
wire                       rom_code_ready;
wire[15:0]                 tg_code_addr;
wire[15:0]                 tg_code_in;
wire                       tg_code_ready;
wire[REGS_FLAT_WIDTH-1:0]  tg_r_flat;
wire[TOP_REG:0]            tg_r_load;
wire[DATA_INPUT_FLAT_WIDTH-1:0]   data_in_flat;
wire                       tg_reset;
wire[DEBUG_IN_WIDTH-1:0]   tg_debug_in;
wire[DEBUG_OUT_WIDTH-1:0]  tg_debug_out; 
program rom(
    .addr(code_addr),
    .data(code_fetched)
);
synapse316 target(
    .sysclk          (sysclk      ) ,
    .sysreset        (tg_reset    ) ,
    .code_addr       (tg_code_addr   ) ,
    .code_in         (tg_code_in) ,
    .code_ready      (tg_code_ready  ) ,
    .r_flat          (tg_r_flat),
    .r_load          (tg_r_load),
    .data_in_flat    (data_in_flat),
    .debug_out       (tg_debug_out),
    .debug_in        (tg_debug_in)
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

// debugging supervisor.
visor visr(
    ,sysclk          (clk50m)
    ,sysreset        (sysreset)
                     
    ,led             (LED)
                     
    ,rom_code_in     (rom_code_in   )
    ,rom_code_ready  (rom_code_ready)
                                          
    ,tg_code_addr    (tg_code_addr  )
    ,tg_code_in      (tg_code_in    )
    ,tg_code_ready   (tg_code_ready )
    ,tg_r_flat       (tg_r_flat     )
    ,tg_r_load       (tg_r_load     )
    ,tg_reset        (tg_reset      )
    ,tg_to_visor_reg (regs[15].r    )
    ,tg_from_visor_reg(data_in[15].r)
);

endmodule
