
// this file corrected 9/2011 to utilize opposing clock edges.

module synchronizer3
#(parameter width = 1, parameter msb = width - 1)
(
    input in_clk,
    input out_clk,
    input reset,
    input reset_level,
    input[msb:0] in,
    output[msb:0] out
);
    // 3 stage synchronizer register.
    // samples input on rising edge of clock in_clk, and
    // synchronizes it to rising edge of clock out_clk.
    // minimum latency is 1 full out_clk cycle plus half of an in_clk cycle.
    // 3 stages MUST be used if the sender is a combinational circuit,
    // as it may glitch while the receiver is sampling, even if a 2-stage
    // synchronizer appears in between.
    
    // this is the full-featured version.

    reg[msb:0] in_sync;
    always @(posedge in_clk) 
        in_sync <= reset ? {width{reset_level}} : in;    
    reg[msb:0] r0;
    always @(negedge out_clk)
        r0 <= reset ? {width{reset_level}} : in_sync;
    reg[msb:0] r1;
    always @(posedge out_clk)
        r1 <= reset ? {width{reset_level}} : r0;
    assign out = r1;
endmodule

module syncer3
#(parameter width = 1, parameter msb = width - 1)
(
    input in_clk,
    input out_clk,
    input[msb:0] in,
    output[msb:0] out
);
    // 3 stage synchronizer register.
    // samples input on rising edge of clock in_clk, and
    // synchronizes it to rising edge of clock out_clk.
    // minimum latency is 1 full out_clk cycle plus half of an in_clk cycle.
    // 3 stages MUST be used if the sender is a combinational circuit,
    // as it may glitch while the receiver is sampling, even if a 2-stage
    // synchronizer appears in between.

    // this is the simplified easy-to-use version.

    synchronizer3 #(.width(width)) s1 (
        .in_clk(in_clk),
        .out_clk(out_clk),
        .reset(1'b0),
        .reset_level(1'b0),
        .in(in),
        .out(out)
    );
endmodule

module synchronizer
#(parameter width = 1, parameter msb = width - 1)
(
    input clk,
    input reset,
    input reset_level,
    input[msb:0] in,
    output[msb:0] out
);
    // 2 stage synchronizer register.
    // synchronizes input to rising edge of clock clk.
    // samples input on falling edge of clk.
    // adds 1 full cycle of latency.
    // this is the full-featured version.

    reg[msb:0] r0;
    always @(negedge clk)
        r0 <= reset ? {width{reset_level}} : in;
    reg[msb:0] r1;
    always @(posedge clk)
        r1 <= reset ? {width{reset_level}} : r0;
    assign out = r1;
endmodule

module syncer
#(parameter width = 1, parameter msb = width - 1)
(
    input clk,
    input[msb:0] in,
    output[msb:0] out
);
    // 2 stage synchronizer register.
    // synchronizes input to rising edge of clock clk.
    // samples input on falling edge of clk.
    // adds 1 full cycle of latency.
    // this is the simplified easy-to-use version.

    synchronizer #(.width(width)) s1 (
        .clk(clk),
        .reset(1'b0),
        .reset_level(1'b0),
        .in(in),
        .out(out)
    );
endmodule
