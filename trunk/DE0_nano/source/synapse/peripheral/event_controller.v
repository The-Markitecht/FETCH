`include <header.v>

// synthesize with SystemVerilog

// this module receives and prioritizes events from other peripherals, to be handled by the MCU.

module event_controller #(
     parameter NUM_INPUTS          = 64       
    ,parameter TOP_INPUT           = NUM_INPUTS - 1       
) (
      input wire                      sysclk            
    , input wire                      sysreset          
    ,output wire[15:0]                priority_out        
    , input wire                      priority_load
    , input wire[15:0]                data_in        
    , input wire[TOP_INPUT:0]         event_signals   
        // MOST URGENT signal comes FIRST in the instantiation.
        // this module CONTAINS NO SYNCHRONIZERS on the event signals.  external
        // SYNCHRONIZERS ARE REQUIRED on any event signals not on sysclk domain.    
);      

    integer i;
    genvar g;

    // REVERSE the event_signals in the design, so MOST URGENT signal comes FIRST in the instantiation!
    // this makes the signal order in the event_controller instantiation match the handler table in assembler.
    wire[TOP_INPUT:0] reversed;
    generate
        for (g = 0; g < NUM_INPUTS; g=g+1) begin : body
            assign reversed[g] = event_signals[TOP_INPUT - g];
        end
    endgenerate
        
    // edge detectors
    reg[TOP_INPUT:0] last;
    always_ff @(posedge sysclk)
        last <= reversed;
    wire[TOP_INPUT:0] edge_detect = reversed & ~ last;

    // capture registers
    reg[TOP_INPUT:0] capture = 0;
    always_ff @(posedge sysclk , posedge sysreset)
        for (i = 0; i < NUM_INPUTS; i=i+1)
            if (sysreset)
                capture[i] <= 1'b0; // system-wide reset.
            else if (edge_detect[i]) 
                capture[i] <= 1'b1; // set on edge detected.
            else if (priority_load && data_in == i) 
                capture[i] <= 1'b0; // clear on a matching write from MCU core.  this is skipped if edge_detect on same cycle.
                
    // priority encoder with registered output.
    wire[15:0] priority_comb;
    priority_encoder #(.NUM_INPUTS(NUM_INPUTS)) encoder (priority_comb, capture);
    reg[15:0] priority_reg = 0;
    always_ff @(posedge sysclk)
        priority_reg <= priority_comb;
    assign priority_out = priority_reg;
    
endmodule
