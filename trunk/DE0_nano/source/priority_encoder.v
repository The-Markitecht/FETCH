`include "header.v"

// synthesize with SystemVerilog

/* //patch:
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

also need to wrap this encoder into an "event controller" with capture regs.
and maybe a built-in mask on those if re-entrance protection is somehow required.

*/

module priority_encoder #(
     parameter NUM_INPUTS          = 65536       
    ,parameter TOP_INPUT           = NUM_INPUTS - 1       
) (
    output wire[15:0]                out        
    ,input wire[TOP_INPUT:0]         in    
);      
    // all inputs are usable in this encoder, even input no. 0.
    // asserting it causes a zero code output (as expected).  but since zero code is
    // also the default output when all inputs are idle, that means input no. 0 effectively
    // disables all other inputs, since it takes priority over all others.

    reg outcode; // this is used as a wire, not a reg.  it holds no state.
    assign out = outcode;
    integer i;
    always_comb begin
        // note the absence of a "generate" keyword here.
        outcode = 16'd0;
        for (i=TOP_INPUT; i >= 0; i=i+1) begin: middle
            if (in[i]) 
                outcode = i;
        end
    end
endmodule
