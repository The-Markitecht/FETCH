`include <header.v>

module puff_timer (
     input wire         sysclk
    ,input wire         sysreset
    ,input wire         pulse50k
    ,input wire         pulse1m
    ,input wire         ign_coil
    ,input wire[15:0]   ign_timeout_len_jf
    ,input wire[15:0]   puff_len_us
    ,output reg         injector_open  // to injector solenoid driver.
    ,output wire        puff_event // to MCU for coordination.  rising and falling edges signal start and end of injection time.
    ,input wire         puff_enable // from MCU for coordination.  rising edge is required for initialization.  low level prevents further triggering.
    ,input wire         puff_on_timeout // from MCU.
    ,output wire[7:0]   leds
);
    // fuel injection timing circuit.
    // injector opens after the 4th rising edge of signal from ignition coil.
    // also then puff_reload pulses 1 sysclk cycle to restart the injection timing cycle.
    // puff_reload freq = 1 to 10,000 Hz.
    
    // parent MUST SET ign_timeout_len_jf BEFORE puff_enable POSEDGE!
    // otherwise the module latches up in an always-off state.
    
    //patch: HOW TO KNOW WHERE TO BEGIN COUNTING IGNITION PULSES?? 
    // which of the 4 is the correct one to start on?
    // there MUST be a sensor on the camshaft etc..
    // maybe it doesn't matter.  each bank has 4 injectors in parallel anyway.
        
    //patch: split this into 2 modules: puff_timer and ignition_capture.
        
    wire[31:0] junk;
    wire[7:0] capdata;
        
    wire ign_coil_sync;
    wire ign_coil_debounced;
    wire ign_4th_rise;
    wire ign_timeout;
    wire puff_trigger_comb = ign_4th_rise || (ign_timeout && puff_on_timeout);
    reg puff_trigger_last = 0;
    always_ff @(posedge sysclk)
        puff_trigger_last <= puff_trigger_comb; 
    wire puff_trigger_rise = puff_trigger_comb && ! puff_trigger_last;
    wire puff_closed;
    wire puff_reload = (puff_trigger_rise && puff_enable) || ! puff_enable;
    syncer ign_syncer(sysclk, ign_coil, ign_coil_sync);
    debounce_counter #(.WIDTH(4)) ign_coil_debouncer (
         .clk         (sysclk)
        ,.clk_enable  (pulse1m)
        ,.reset       (sysreset)
        ,.data        (ign_coil_sync)
        ,.debounced   (ign_coil_debounced)
    );
    cdtimer16 ign_pulse_cnt (
         .sysclk          ( sysclk )  
        ,.sysreset        ( sysreset )  
        ,.data_out        ( {junk[15:3], leds[2:0]} )
        ,.data_in         ( 16'd4 )  
        ,.load            ( puff_reload )
        ,.counter_event   ( ign_coil_debounced )
        ,.expired         ( ign_4th_rise )
    );
    cdtimer16 ign_timeout_cnt (
         .sysclk          ( sysclk )  
        ,.sysreset        ( sysreset )  
        ,.data_out        (  )
        ,.data_in         ( ign_timeout_len_jf )  
        ,.load            ( puff_reload )
        ,.counter_event   ( pulse50k )
        ,.expired         ( ign_timeout )
    );
    cdtimer16 puff_open_cnt (
         .sysclk          ( sysclk )  
        ,.sysreset        ( sysreset )  
        ,.data_out        (  )
        ,.data_in         ( puff_len_us )  
        ,.load            ( puff_trigger_rise )
        ,.counter_event   ( pulse1m )
        ,.expired         ( puff_closed )
    );
    syncer puff_syncer(sysclk, puff_enable && ! puff_closed, injector_open);
    assign puff_event = injector_open; // no injector PWM implemented in this version.

    //assign leds[7] = ign_coil_sync;
    //assign leds[6] = ign_coil_debounced;
    //assign leds[5] = puff_reload;
    //assign leds[4] = puff_enable;
    //assign leds[3] = pulse50k;
    //assign leds[4] = pulse1m;
    // reg[7:0] cap = 0;
    // assign capdata = {puff_reload, ign_4th_rise, ign_timeout, puff_trigger_comb, 
        // puff_trigger_rise, 3'd0};
    // always_ff @(posedge sysclk)
        // cap <= cap | capdata;
    // assign leds[7:3] = cap[7:3];
    wire[4:0] len_ms = puff_len_us[14:10]; // roughly milliseconds.
    // bar display, instead of binary:
    assign leds[7] = len_ms >= 5'd16;
    assign leds[6] = len_ms >= 5'd8;
    assign leds[5] = len_ms >= 5'd4;
    assign leds[4] = len_ms >= 5'd2;
    assign leds[3] = len_ms >= 5'd1;
    
endmodule
