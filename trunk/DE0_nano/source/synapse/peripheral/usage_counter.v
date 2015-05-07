`include <header.v>

// synthesize with SystemVerilog

// this module counts how many times the MCU is found "busy" i.e. hasn't polled this module recently.
// typically this would be connected to (and measuring) the register read acknowledge signal for 
// the event_controller's event priority status register.
// the counter can be read & cleared by the MCU to determine MCU utilization.

module usage_counter (
      input wire                      sysclk            
    , input wire                      sysreset          
    ,output wire[15:0]                counter_out        
    , input wire                      counter_reset
    , input wire                      observable_pulse
    , input wire                      sample_enable
);      

    // timer since last observable_pulse.
    // this times out a little slower than the MCU can repeat its idle loop.
    reg[2:0] timer;
    wire timeout = timer == 3'd0;
    always_ff @(posedge sysclk)
        if (observable_pulse)
            timer <= 3'd5;
        else if ( ! timeout)
            timer <= timer - 3'd1;

    // busy counter.  this increments each sysclk cycle where sample_enable 
    // is true and timeout is true.  so sample_enable should be pulsed periodically to cause sampling.
    reg[15:0] busy_cnt = 0;
    assign counter_out = busy_cnt;
    always_ff @(posedge sysclk , posedge sysreset, posedge counter_reset)
        if (sysreset)
            busy_cnt <= 0;
        else if (counter_reset)
            busy_cnt <= 0;
        else if (sample_enable && timeout) 
            busy_cnt <= busy_cnt + 16'd1;
    
endmodule
