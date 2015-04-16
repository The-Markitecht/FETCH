`include "header.v"

module cdpwm #(
     parameter WIDTH = 16
    ,parameter START = 65535
) (
     input wire                  sysclk            
    ,input wire                  sysreset          

    ,input wire                  counter_event

    ,output wire[15:0]           counter_value
    
    ,output wire[15:0]           duty
    , input wire                 duty_load
    , input wire[MSB:0]          data_in
        
    ,output wire                 pwm_signal
);
    // simple countdown PWM output module. 
    // start value is fixed at design time, not software programmable.
    // duty cycle is software programmable.
    // counter value is exposed to let software synchronize to the counter.  
    // so this can be used as a simple periodic timer too.
    // pwm_signal is registered to prevent sending glitches to off-chip circuits routinely.
    // but there's no built-in protection from glitching when duty cycle is altered.
    // the best time to set duty would be during the low time right after a counter rollover.
    // at that time START has just been loaded into the counter.
    // duty = 0 makes output always low.
    // duty = START + 1 makes output always high.
    
    localparam MSB = WIDTH - 1;
    
    // counter_event rising edge detector.
    reg event_last = 0;
    always_ff @(posedge sysclk)
        event_last <= counter_event;
    wire event_edge = counter_event && ! event_last;

    // free-running down counter.
    reg[MSB:0] cnt = 0;
    assign counter_value = cnt;
    wire expired = cnt == '0;
    always_ff @(posedge sysclk, posedge sysreset) begin
        if (sysreset)
            cnt <= 0;
        else if (event_edge) begin
            if (expired)
                cnt <= START;
            else 
                cnt <= cnt - 'd1;
        end
    end
    
    // duty cycle register & signal generator.
    std_reg duty_reg(sysclk, sysreset, duty, data_in, duty_load);
    wire pwm_comb = cnt < duty;
    reg pwm_reg = 0;
    always_ff @(posedge sysclk)
        pwm_reg <= pwm_comb;
    assign pwm_signal = pwm_reg;
endmodule
