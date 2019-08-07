`include <header.v>
`include "target_program_defines.v"

module double_word_adapter #(
     parameter WW         = `WW 
    ,parameter MSB        = WW - 1       
    ,parameter DW         = `WW * 2
    ,parameter DMSB       = DW - 1       
) (
     input wire                  sysclk            
    ,input wire                  sysreset          

    ,input wire[MSB:0]           data_in           
    
    ,output wire[MSB:0]          data_out_lo
    ,input wire                  read_lo
    ,input wire                  load_lo
    
    ,output wire[MSB:0]          data_out_hi
    ,input wire                  read_hi    
    ,input wire                  load_hi    

    ,input wire[DMSB:0]          double_data_to_read           
    ,output wire                 double_read
    
    ,output wire[DMSB:0]         double_data_to_write
    ,output wire                 double_load
    
);
    // adapts a double-word-wide register onto a word-wide data bus.
    // for accessing and controlling extra-wide peripheral registers.
    
    // all access should be programmed to always occur in order: low word first, then high word.
    
    // reading the low word causes that cycle's value of the high word to be captured and
    // held in a temporary register for one more cycle, so then it can also be read without risk of inconsistency.
    // so the peripheral's high word is not directly readable.
    
    // similarly, the peripheral's low word is not directly writable.
    // attempting to write the low word actually writes a temporary register.  that holds the value for
    // one more cycle, so then the high word can also be written without risk of inconsistency.
    // the peripheral sees all bits arrive simultaneously, during the high word write, 
    // since that's when they are all available.
    
    reg[MSB:0] read_temp = 0;
    always_ff @(posedge sysclk, posedge sysreset) 
        if (sysreset)
            read_temp <= 0;
        if (read_lo)
            read_temp <= double_data_to_read[DMSB:WW];
    assign data_out_hi = read_temp;
    assign data_out_lo = double_data_to_read[MSB:0];
    assign double_read = read_lo;
    
    reg[MSB:0] write_temp = 0;
    always_ff @(posedge sysclk, posedge sysreset) 
        if (sysreset)
            write_temp <= 0;
        if (load_lo)
            write_temp <= data_in;
    assign double_data_to_write = {data_in, write_temp};
    assign double_load = load_hi;
endmodule
