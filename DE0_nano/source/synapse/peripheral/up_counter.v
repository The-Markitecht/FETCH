`include <header.v>
`include "target_program_defines.v"

module up_counter  #(
     parameter WIDTH         = `WW
) (
     input wire                  sysclk            
    ,input wire                  sysreset          

    ,input wire[MSB:0]           data_in           
    
    ,output wire[MSB:0]          counter_data_out
    ,input wire                  counter_load
    
    ,output wire[MSB:0]          compare_data_out
    ,input wire                  compare_load
    
    ,input wire                  counter_tick
    
    ,output wire                 expired
);
    // 16-bit countdown timer/counter module.
    // counts rising edges of the counter_tick signal.
    // offers 2 exposed register:  the counter, and the output comparison value.
    // both are read/write.
    // when those two match, the counter asserts expired, and it stops counting. 

    localparam MSB = WIDTH - 1;

    reg[MSB:0] cnt = 0;
    
    // counter_tick rising edge detector.
    reg event_last = 0;
    always_ff @(posedge sysclk)
        event_last <= counter_tick;
    wire event_edge = counter_tick && ! event_last;

    // output compare unit.
    std_reg #(.STORAGE_WIDTH(WIDTH), .OUTPUT_WIDTH(WIDTH)) compare_reg
        (sysclk, sysreset, compare_data_out, data_in, compare_load);
    assign expired = cnt == compare_data_out;

    // loadable up counter.
    assign counter_data_out = cnt;
    always_ff @(posedge sysclk, posedge sysreset) begin
        if (sysreset)
            cnt <= 0;
        else if (counter_load)
            cnt <= data_in;
        else if ( event_edge && ! expired)
            cnt <= cnt + 1'd1;
    end
endmodule
