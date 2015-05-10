`include <header.v>

module efi_timer (
     input wire         sysclk
    ,input wire         sysreset
    ,input wire         pulse50k
    ,input wire         pulse1m
    ,input wire         ign_coil
    ,input wire[15:0]   ign_timeout_len_20us
    ,input wire[15:0]   efi_len_us
    ,output reg         injector_open  // to injector solenoid driver.
    ,output wire        puff_event // to MCU for coordination.  rising and falling edges signal start and end of injection time.
    ,input wire         efi_enable // from MCU for coordination.  rising edge is required for initialization.  low level prevents further triggering.
    ,output wire[7:0]   leds
);
    // fuel injection timing circuit.
    // injector opens after the 4th rising edge of signal from ignition coil.
    // also then efi_reload pulses 1 sysclk cycle to restart the injection timing cycle.
    // efi_reload freq = 1 to 10,000 Hz.
    
    // parent MUST SET ign_timeout_len_20us BEFORE efi_enable POSEDGE!
    // otherwise the module latches up in an always-off state.
    
    //patch: HOW TO KNOW WHERE TO BEGIN COUNTING IGNITION PULSES?? 
    // which of the 4 is the correct one to start on?
    // there MUST be a sensor on the camshaft etc..
    // maybe it doesn't matter.  each bank has 4 injectors in parallel anyway.
        
    wire[31:0] junk;
    wire[7:0] capdata;
        
    wire ign_coil_sync;
    wire ign_coil_debounced;
    wire ign_4th_rise;
    wire ign_timeout;
    wire efi_trigger_comb = ign_4th_rise || ign_timeout;
    reg efi_trigger_last = 0;
    always_ff @(posedge sysclk)
        efi_trigger_last <= efi_trigger_comb; 
    wire efi_trigger_rise = efi_trigger_comb && ! efi_trigger_last;
    wire efi_closed;
    wire efi_reload = (efi_trigger_rise && efi_enable) || ! efi_enable;
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
        ,.load            ( efi_reload )
        ,.counter_event   ( ign_coil_debounced )
        ,.expired         ( ign_4th_rise )
    );
    cdtimer16 ign_timeout_cnt (
         .sysclk          ( sysclk )  
        ,.sysreset        ( sysreset )  
        ,.data_out        (  )
        ,.data_in         ( ign_timeout_len_20us )  
        ,.load            ( efi_reload )
        ,.counter_event   ( pulse50k )
        ,.expired         ( ign_timeout )
    );
    cdtimer16 efi_open_cnt (
         .sysclk          ( sysclk )  
        ,.sysreset        ( sysreset )  
        ,.data_out        (  )
        ,.data_in         ( efi_len_us )  
        ,.load            ( efi_trigger_rise )
        ,.counter_event   ( pulse1m )
        ,.expired         ( efi_closed )
    );
    syncer efi_syncer(sysclk, ! efi_closed, injector_open);
    assign puff_event = injector_open; // no injector PWM implemented in this version.

    //assign leds[7] = ign_coil_sync;
    //assign leds[6] = ign_coil_debounced;
    //assign leds[5] = efi_reload;
    //assign leds[4] = efi_enable;
    //assign leds[3] = pulse50k;
    //assign leds[4] = pulse1m;
    // reg[7:0] cap = 0;
    // assign capdata = {efi_reload, ign_4th_rise, ign_timeout, efi_trigger_comb, 
        // efi_trigger_rise, 3'd0};
    // always_ff @(posedge sysclk)
        // cap <= cap | capdata;
    // assign leds[7:3] = cap[7:3];
    wire[4:0] len_ms = efi_len_us[14:10]; // roughly milliseconds.
    // bar display, instead of binary:
    assign leds[7] = len_ms >= 5'd16;
    assign leds[6] = len_ms >= 5'd8;
    assign leds[5] = len_ms >= 5'd4;
    assign leds[4] = len_ms >= 5'd2;
    assign leds[3] = len_ms >= 5'd1;
    
endmodule
