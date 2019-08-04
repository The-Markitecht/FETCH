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
);      

    // control sequence registers.
    reg pend_write = 0;
    always_ff @(posedge sysclk) 
        pend_write <= data_load;
    reg pend_read = 0; //TODO: eliminate this register.
    always_ff @(posedge sysclk) 
        pend_read <= data_read;

    // address register
    std_reg addr_reg (sysclk, sysreset, address_out, data_in, address_load);

    // address decoder.
    genvar i;
    generate  
        for (i=0; i < NUM_REGS; i=i+1) begin: body
            assign r_load[i] = (address_out == i ? pend_write : 1'b0);
            assign r_read[i] = (address_out == i ? pend_read : 1'b0);
        end
    endgenerate     

    // data write register.
    std_reg data_write_reg (sysclk, sysreset, r_load_data, data_in, data_load);

    // data read register.
    std_reg data_read_reg (sysclk, sysreset, data_out, r[address_out], pend_read);
    
endmodule
