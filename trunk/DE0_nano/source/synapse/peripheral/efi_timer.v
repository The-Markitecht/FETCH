`include "header.v"

module efi_timer (
    input           sysclk,
    input           sysreset,
    input           pulse50k,
    input           pulse1m,
    input           ign_coil,
    input[15:0]     ign_timeout_len_20us,
    input[15:0]     efi_len_us,
    output reg      injector_open,  // to injector solenoid driver.
    output          puff_event // to MCU for coordination.  rising and falling edges signal start and end of injection time.
);
    // fuel injection timing circuit.
    // injector opens after the 4th rising edge of signal from ignition coil.
    // also then efi_reload pulses 1 sysclk cycle to restart the injection timing cycle.
    // efi_reload freq = 1 to 10,000 Hz.
    
    //patch: HOW TO KNOW WHERE TO BEGIN COUNTING IGNITION PULSES?? 
    // which of the 4 is the correct one to start on?
    // there MUST be a sensor on the camshaft etc..
    // maybe it doesn't matter.  each bank has 4 injectors in parallel anyway.
    
    wire ign_coil_sync;
    wire ign_coil_debounced;
    wire ign_4th_rise;
    wire ign_timeout;
    wire efi_trigger_comb = ign_4th_rise || ign_timeout;
    reg efi_trigger_last = 0;
    always_ff @(posedge sysclk)
        efi_trigger_last <= efi_trigger_comb; 
    wire efi_trigger_edge = efi_trigger_comb && ! efi_trigger_last;
    wire efi_reload = efi_trigger_edge;
    wire efi_closed;
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
        ,.data_out        ( )
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
        ,.load            ( efi_trigger_edge )
        ,.counter_event   ( pulse1m )
        ,.expired         ( efi_closed )
    );
    syncer efi_syncer(sysclk, ! efi_closed, injector_open);
    assign puff_event = injector_open; // no injector PWM implemented in this version.
endmodule
