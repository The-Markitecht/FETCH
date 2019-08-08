`include <header.v>
`include "target_program_defines.v"

module down_counter  #(
     parameter WIDTH         = `WW
) (
     input wire                  sysclk            
    ,input wire                  sysreset          

    ,input wire[MSB:0]           data_in           
    
    ,output wire[MSB:0]          counter_data_out
    ,input wire                  counter_load
    
    ,input wire                  counter_tick
    
    ,output wire                 expired
);
    // 16-bit countdown timer/counter module.
    // counts rising edges of the counter_tick signal.
    // offers 1 exposed register:  the counter.  read/write.
    // when it reaches zero, the counter asserts expired, and it stops counting. 

    localparam MSB = WIDTH - 1;

    // counter_tick rising edge detector.
    reg event_last = 0;
    always_ff @(posedge sysclk)
        event_last <= counter_tick;
    wire event_edge = counter_tick && ! event_last;

    // loadable down counter.
    reg[MSB:0] cnt = 0;
    assign counter_data_out = cnt;
    assign expired = cnt == 0;
    always_ff @(posedge sysclk, posedge sysreset) begin
        if (sysreset)
            cnt <= 0;
        else if (counter_load)
            cnt <= data_in;
        else if ( event_edge && ! expired)
            cnt <= cnt - 1'd1;
    end
endmodule
