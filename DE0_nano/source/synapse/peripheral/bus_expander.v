`include <header.v>

// synthesize with SystemVerilog
        
module bus_expander #(
     parameter NUM_REGS          = 65536       
    ,parameter TOP_REG           = NUM_REGS - 1       
) (
     input wire                  sysclk            
    ,input wire                  sysreset          

    // connect to master as one data register.
    ,output wire[15:0]           data_out
    ,input wire[15:0]            data_in           
    ,input wire                  data_load
    ,input wire                  data_read

    // connect to master as one address register.
    ,output wire[15:0]           address_out
    //,input wire[15:0]            address_in  // same as data_in.
    ,input wire                  address_load
    //,input wire                  address_read // not used.
    
    // connect as master, to as many slave registers as needed, up to NUM_REGS.
    ,input  wire[15:0]                r[TOP_REG:0]
    ,output wire[TOP_REG:0]           r_read    
    ,output wire[TOP_REG:0]           r_load
    ,output wire[15:0]                r_load_data      
    
    // connect to debugger as needed.
    ,output wire                      critical_section
);      
    // MCU should always write the address register first, then write the data register.
    // or write the address register first, then read the data register TWICE.  the first is a throwaway.

    // control sequence registers.
    reg pend_write = 0;
    always_ff @(posedge sysclk) 
        pend_write <= data_load;
    reg pend_read = 0; 
    always_ff @(posedge sysclk) 
        pend_read <= data_read;

    // address register
    std_reg addr_reg (sysclk, sysreset, address_out, data_in, address_load);

    // address decoder.
    genvar i;
    generate  
        for (i=0; i < NUM_REGS; i=i+1) begin: body
            assign r_load[i] = (address_out == i ? pend_write : 1'b0);
            assign r_read[i] = (address_out == i ? data_read && pend_read : 1'b0);
            // that combinational expression (data_read && pend_read) could be moved to the input side of 
            // pend_read instead.  as in pend_read <= data_read && ! pend_read;
            // but that just makes the expression's delay stack up with that of the MCU's address decoder
            // instead of the expander's address decoder.  bad move; the expander has less need for high clock rates,
            // and its peripherals are often ignoring the read ack signal anyway.  the expander never ignores it.
        end
    endgenerate     

    // data write register.
    std_reg data_write_reg (sysclk, sysreset, r_load_data, data_in, data_load);

    // data read register.
    // while the MCU core triggers this register to load on 2 consecutive cycles, only
    // the latter of those is reported to the peripheral, by pend_read.
    // that's important for read-sensitive devices like FIFOs.
    std_reg data_read_reg (sysclk, sysreset, data_out, r[address_out], data_read);

    // notify debugger etc. when the expander is busy.
    // this is important not because the expander is sensitive to the interruption itself
    // (it doesn't seem to be in casual tests), but because the
    // debugger is likely to access peripherals through the expander using additional operations
    // during the break.  that will definitely destroy the target's pending access.
    reg critical = 0;
    assign critical_section = critical;
    always_ff @(posedge sysclk) 
        if (address_load)
            critical <= 1'b1;
        else if (pend_read || pend_write)
            critical <= 1'b0;
    
endmodule
