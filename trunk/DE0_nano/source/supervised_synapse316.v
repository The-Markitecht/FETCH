`include "header.v"

////////////////////////////////////////////////////////////////////////////
// Synapse316 with attached debugging supervisor.

module supervised_synapse316 (
     interface          clk               // clock_ifc.s      
    ,interface          r[`TOP_REG:0]     // reg_ifc.m        
    ,input              mcu_wait          
    ,interface          av                // avalon_mm_ifc.m    
    ,interface          dbg_av            // avalon_mm_ifc.m  
); 

// Synapse316 with code ROM.
code_ifc                    rom_code();
code_ifc                    dbg_code();
code_ifc                    tg_code();
clock_ifc                   tg_clk();
reg_ifc                     tg_r[`TOP_REG:0]();
debug_ifc                   tg_debug();
target_program rom(
    .clk            (tg_clk),
    .code           (rom_code)
);
synapse316 target(
    .clk            (tg_clk),
    .code           (tg_code),
    .r              (tg_r),
    .debug          (tg_debug)
);    
// slice DEBUG_PEEK_REG off the top of the target's register file.
std_reg peek_data_reg (.clk, .r(tg_r[`DEBUG_PEEK_REG]));
genvar i;
generate  
    for (i=0; i < `DEBUG_PEEK_REG; i=i+1) begin: reg_pass_thru
//        reg_passthru pass(  .rs(tg_r[i]),  .rm(r[i])  );
        assign r[i].d = tg_r[i].d;
        assign r[i].load = tg_r[i].load;
        assign r[i].read = tg_r[i].read;
        assign tg_r[i].q = r[i].q;
    end  
endgenerate     
    
// debugging supervisor.
visor visr(
     .clk
    ,.tg_rom            (dbg_code)
    ,.tg_code
    ,.tg_debug
    ,.tg_reset          (tg_clk.reset  )
    ,.tg_peek_data      (tg_r[`DEBUG_PEEK_REG].q)
    ,.tg_poke_data      ()
    ,.av                (dbg_av)    
);

// insert mcu_wait between the target's real code rom and the visor.
assign tg_clk.clk = clk.clk;
assign rom_code.addr = dbg_code.addr;
//patch: this next line is only helpful for simulation. the design could run faster without it.
assign dbg_code.content = (mcu_wait ? 16'hffff : tg_code.content);
assign dbg_code.code_ready = rom_code.code_ready && ! mcu_wait;


endmodule
