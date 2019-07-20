`include <header.v>

module cdtimer16 (
     input wire                  sysclk            
    ,input wire                  sysreset          

    ,output wire[15:0]           data_out
    ,input wire[15:0]            data_in           
    ,input wire                  load
    
    ,input wire                  counter_event
    
    ,output wire                 expired
);
    // 16-bit countdown timer/counter module.

    // counter_event rising edge detector.
    reg event_last = 0;
    always_ff @(posedge sysclk)
        event_last <= counter_event;
    wire event_edge = counter_event && ! event_last;

    // loadable 16-bit down counter.
    reg[15:0] cnt = 0;
    assign data_out = cnt;
    assign expired = cnt == 16'd0;
    always_ff @(posedge sysclk, posedge sysreset) begin
        if (sysreset)
            cnt <= 0;
        else if (load)
            cnt <= data_in;
        else if ( event_edge && ! expired)
            cnt <= cnt - 16'd1;
    end
endmodule
