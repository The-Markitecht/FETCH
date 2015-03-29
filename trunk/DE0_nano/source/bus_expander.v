`include "header.v"

// synthesize with SystemVerilog

// old system: 3504 LE 85 MHz
// same system using expander: 3506 LE 73.5 MHz !  WHAT HAPPENED??
// note: at least 8 bits of the data bus width were optimized away, so area is probably optimistic.
        
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
    // this port shares certain bus signals with the data register port above.
    ,output wire[15:0]           address_out
    ,input wire                  address_load
    
    // connect as master, to as many slave registers as needed, up to NUM_REGS.
    ,input  wire[15:0]                r[TOP_REG:0]
    ,output wire[TOP_REG:0]           r_read    
    ,output wire[TOP_REG:0]           r_load
    ,output wire[15:0]                r_load_data        
);      

    std_reg addr_reg (sysclk, sysreset, address_out, data_in, address_load);

    assign data_out = r[address_out];
    
    assign r_load_data = data_in;

    genvar i;
    generate  
        for (i=0; i < NUM_REGS; i=i+1) begin: middle
            assign r_load[i] = (address_out == i ? data_load : 1'b0);
            assign r_read[i] = (address_out == i ? data_read : 1'b0);
        end
    endgenerate     
endmodule
