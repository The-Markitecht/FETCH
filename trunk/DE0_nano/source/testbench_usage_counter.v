`include <header.v>

module testbench ();

// clock and reset circuits.
reg clk50m = 0;
wire sysclk = clk50m;
always begin
    #5 clk50m = 1;
    #5 clk50m = 0;
end

// SUT
reg obs = 0;
reg en = 0;
usage_counter usage (
     .sysclk               ( sysclk )
    ,.sysreset             ( 1'b0 )
    ,.counter_out          (  )
    ,.counter_reset        ( 1'b0 )
    ,.observable_pulse     ( obs )
    ,.sample_enable        ( en )
);      
   
initial	begin
    $dumpfile("testbench.vcd");
    $dumpvars;

    #10 en = 1;
    #50 en = 0;
    
    #10 obs = 1;
    #10 obs = 0;
    #10 obs = 1;
    #10 obs = 0;
    #10 obs = 1;
    #10 obs = 0;
    
    #10 en = 1;
    #10 obs = 1;
    #10 obs = 0;
    #10 obs = 1;
    #10 obs = 0;
    #10 obs = 1;
    #10 obs = 0;
    #150 en = 0;        
    
    #100 $stop;
end
    
endmodule    
