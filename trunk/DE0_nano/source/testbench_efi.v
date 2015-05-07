`include <header.v>

module testbench ();

// clock and reset circuits.
reg clk50m = 0;
wire sysclk = clk50m;
always begin
    #5 clk50m = 1;
    #5 clk50m = 0;
end
wire async_pll_lock = 1'b1;
reg rst0 = 1, rst1 = 1, rst2 = 1;
always_ff @(posedge sysclk) begin
    rst0 <= ! async_pll_lock; // hold sysreset high until 3 cycles after async_pll_lock.
    rst1 <= rst0;
    rst2 <= rst1;
end
wire sysreset = rst2;

// realtime counters.  first the 1 MHz.  divide sysclk by 50.
wire timer_enable = 1'b1;
reg[5:0] counter1m = 0;
wire pulse1m = (counter1m == 6'd50) && timer_enable;
always_ff @(posedge sysclk) 
    counter1m <= (pulse1m ? 6'd0 : counter1m + 6'd1);
// slower realtime counters.  these are dividers fed by the 1 MHz.    
wire pulse50k;
cdtimer16 counter50k (
     .sysclk          ( sysclk )  
    ,.sysreset        ( sysreset )  
    ,.data_out        (  )
    ,.data_in         ( 16'd20 )  
    ,.load            ( pulse50k )
    ,.counter_event   ( pulse1m )
    ,.expired         ( pulse50k )
);
wire pulse1k;
cdtimer16 counter1k (
     .sysclk          ( sysclk )  
    ,.sysreset        ( sysreset )  
    ,.data_out        (  )
    ,.data_in         ( 16'd50 )  
    ,.load            ( pulse1k )
    ,.counter_event   ( pulse50k )
    ,.expired         ( pulse1k )
);

wire injector1_open;
reg ign_coil_wht = 0;
reg en = 0;
// fuel injection circuit.
wire puff_event1;
efi_timer efi1 (
     .sysclk                (sysclk)
    ,.sysreset              (sysreset)
    ,.pulse50k              (pulse50k)
    ,.pulse1m               (pulse1m)
    ,.ign_coil              (ign_coil_wht)
    ,.ign_timeout_len_20us  (16'd4000)
    ,.efi_len_us            (16'd3000)
    ,.injector_open         (injector1_open)
    ,.puff_event            (puff_event1)
    ,.efi_enable            (en)
);
   
initial	begin
    $dumpfile("testbench.vcd");
    $dumpvars;

    // times are nanoseconds.
    #1000 en = 1;
    
    #5000000 ign_coil_wht = 1;
    #5000000 ign_coil_wht = 0;
    #5000000 ign_coil_wht = 1;
    #5000000 ign_coil_wht = 0;
    #5000000 ign_coil_wht = 1;
    #5000000 ign_coil_wht = 0;
    #5000000 ign_coil_wht = 1;
    #5000000 ign_coil_wht = 0;
         
    #5000000 ign_coil_wht = 1;
    #5000000 ign_coil_wht = 0;
    #5000000 ign_coil_wht = 1;
    #5000000 ign_coil_wht = 0;
    #5000000 ign_coil_wht = 1;
    #5000000 ign_coil_wht = 0;
    #5000000 ign_coil_wht = 1;
    #5000000 ign_coil_wht = 0;
         
    #5000000 ign_coil_wht = 1;
    #5000000 ign_coil_wht = 0;
    #5000000 ign_coil_wht = 1;
    #5000000 ign_coil_wht = 0;
    #5000000 ign_coil_wht = 1;
    #5000000 ign_coil_wht = 0;
    #5000000 ign_coil_wht = 1;
    #5000000 ign_coil_wht = 0;
         
    // ti000meout case
    #7000000 ign_coil_wht = 1;
    #7000000 ign_coil_wht = 0;
    #7000000 ign_coil_wht = 1;
    #7000000 ign_coil_wht = 0;
    #7000000 ign_coil_wht = 1;
    #7000000 ign_coil_wht = 0;
    #7000000 ign_coil_wht = 1;
    #7000000 ign_coil_wht = 0;
         
    #5000000 ign_coil_wht = 1;
    #5000000 ign_coil_wht = 0;
    #5000000 ign_coil_wht = 1;
    #5000000 ign_coil_wht = 0;
    #5000000 ign_coil_wht = 1;
    #5000000 ign_coil_wht = 0;
    #5000000 ign_coil_wht = 1;
    #5000000 ign_coil_wht = 0;
         
    #5000000 ign_coil_wht = 1;
    #5000000 ign_coil_wht = 0;
    #5000000 ign_coil_wht = 1;
    #5000000 ign_coil_wht = 0;
    #5000000 ign_coil_wht = 1;
    en = 0;
    #5000000 ign_coil_wht = 0;
    #5000000 ign_coil_wht = 1;
    #5000000 ign_coil_wht = 0;
    
    #4000000 $stop;
end
    
endmodule    
