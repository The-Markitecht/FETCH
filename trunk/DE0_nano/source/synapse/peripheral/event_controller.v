`include "header.v"

// synthesize with SystemVerilog

// this module receives and prioritizes events from other peripherals, to be handled by the MCU.

/* design notes:

edge detectors on each input.  those each can set a RS capture flop.  
EDR_EVENT_PRIORITY reads from a priority encoder summarizing the capture flops.
writing a priority value back to EDR_EVENT_PRIORITY clears the indexed capture flop.

note that EDR_EVENT_PRIORITY can change (to a more urgent priority) during an event handler.
so the MCU core MUST copy the EDR_EVENT_PRIORITY value to another register (or the stack) 
before using that value to clear the flop (ack the event).  even if it's done as soon as
the MCU detects the event.  otherwise the wrong event might get ack'd, resulting in a missed
high-priority event.

how to keep event handlers really short/fast so they don't have to overlap at all?
(that would require guards against reentrance of the same one etc..)
add enough gp regs to make each event handler into its own state machine.  
but that's really well outside the scope and appeal of the synapse316 concept.  (is it really?)
instead i could just use SDRAM to hold state.  but it can stall for "long" periods
during a refresh or row fetch etc.  use a m9k sram block instead.  call it ocram.  
or if the state data is just a couple words, push them into a simple FIFO.  let it signal
back into the event controller.  but it's usually healthier to restrict the FIFO
to depth 1 only.  so FIFO's just a more restrictive way of declaring
dedicated state registers.  

bottom line: really need to stick to original event handler concept, where they're
fast & not allowed to overlap.  that means factoring out all wait loops.
some existing wait loops:
- func spi_exchange: move this to a TeePee FSM.  classic case for that.
- func anmux_read_chn: it waits 10ms for the analog circuit to settle.  instead set a 
dedicated countdown timer & let it signal the event dispatcher.  classic case for that.  
make it one of a bank of microsecond countdown timers. 
- my_uart_v2 driver: instead drive it in 2 event handlers:  rx is urgent priority,
tx is long priority.  or better yet, insert FIFO's and run all driver code in the 
caller's context.  no events at all.  classic case for that.  that also takes care of
clock domain crossing.

on the other hand, keeping those algorithms in the Synapse makes them debuggable.
but really only during initial development e.g. bringup a new peripheral.
after that the bugs they'd experience in software stem mostly from failing to make
timing because other event handlers ran too long.  that's hard to debug with my tools.
it's better to move those algorithms out to the fabric after each new peripheral is 
tested out by a soft driver.  like i did with Avalon bus master.

that means eventually the majority of event signals will be from timers.  or small FIFOs/regs
containing pointers to RAM data frames ready for next pipeline stage.  that could
work really well to transparently implement one or more buffer pools.  management
is fully automated by simple FIFOs as long as the consumer always pushes the emptied
buffer back into a designated "free" queue.  then each buffer address exists at all
times in exactly one of the following places:  free q, producer routine, laden q, consumer routine.
various subsystems can share a free q if their buffers are of a usable size.
but never share a laden q, since that indicates the payload data type.


*/

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
    always_ff @(posedge sysclk, posedge sysreset)
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
