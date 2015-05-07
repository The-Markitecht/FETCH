`include <header.v>

// synthesize with SystemVerilog

// old system: 3504 LE 85 MHz
// same system using expander: 3505 LE 73 MHz !  WHAT HAPPENED??
    // not much clues from timequest: none of the modified paths were in the critical list.
    // could be the different assemble.tcl affected the timing...
    // but i'm back to 86 MHz after more very slight changes.
// note: at least 8 bits of the data bus width were optimized away, so area is probably optimistic.

/*
//patch: this version needs some improvement.
it's not actually removing the expanded space from the core space.  it's just
providing another 16 address bits, and those bits are stored outside of the exr,
in the preceding instruction.  
the expanded space is still mux'd into the bus on the same cycle as any other data.
so the reg-to-reg path is actually much longer with the expander inserted.

right now the reduced core address space is making up for that with a small speed boost.
but that balance will be severely upset when the expanded space scales up to hundreds or thousands.
that's likely to happen when/if i add enough gp regs to make each event handler into its
own state machine.  but that's really well outside the scope of the synapse316 concept.

a good place to start would be declaring 1 cycle latency when reading through the expander, 
much like i did for the core's adders.  then implement that latency as a reg
in the expander's data path.  macro a similar solution for the writing through the expander.
*/
        
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
        for (i=0; i < NUM_REGS; i=i+1) begin: body
            assign r_load[i] = (address_out == i ? data_load : 1'b0);
            assign r_read[i] = (address_out == i ? data_read : 1'b0);
        end
    endgenerate     
endmodule
