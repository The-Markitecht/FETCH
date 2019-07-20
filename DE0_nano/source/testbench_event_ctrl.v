`include <header.v>

// ev[5] is the most urgent.
module testbench (
	input wire[5:0] ev, 
	output wire[15:0] pri_out,
    input wire priority_load,
    input wire[15:0] data_in,
	input wire sysclk,
	input wire sysreset
);

event_controller #(.NUM_INPUTS(6)) events( 
     .sysclk            (sysclk)
    ,.sysreset          (sysreset)
    ,.priority_out      (pri_out)
    ,.priority_load     (priority_load)
    ,.data_in           (data_in)
    ,.event_signals     (ev)
        // MOST urgent events are listed FIRST.
);
 
endmodule    
