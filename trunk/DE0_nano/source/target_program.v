
        `timescale 1 ns / 1 ns

        module target_program (
            input[15:0] addr
            ,output[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.
// to write some data on the UART.

// register file configuration

// application-specific register aliases.

// :begin // = 0x00
addr == 16'h00 ? 16'h2201 :  // <0022> leds = 0b00000001
addr == 16'h01 ? 16'h2a00 :  // <0023> atx_ctrl = 0

// using x as pass counter.  shows on LEDs.
addr == 16'h02 ? 16'h13a0 :  // <0026> x = 0xff00
addr == 16'h03 ? 16'hff00 :  // <0026> x = 0xff00
addr == 16'h04 ? 16'h1760 :  // <0027> y = -1

// using i as index into string.
addr == 16'h05 ? 16'h0a00 :  // <0030> i = 0

// cache the string limit.
addr == 16'h06 ? 16'h0205 :  // <0033> a = 5
addr == 16'h07 ? 16'h0760 :  // <0034> b = 0xffff
addr == 16'h08 ? 16'hc800 :  // <0035> nop
addr == 16'h09 ? 16'h1b38 :  // <0036> g6 = xor

// :again // = 0x0a
addr == 16'h0a ? 16'h1320 :  // <0039> x = x+y
addr == 16'h0b ? 16'hc800 :  // <0040> nop
addr == 16'h0c ? 16'h0004 :  // <0041> a = x
addr == 16'h0d ? 16'h0353 :  // <0042> a = a>>4
addr == 16'h0e ? 16'h2353 :  // <0043> leds = a>>4

// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 16'h0f ? 16'h0fa0 :  // <0046> j = :test_pattern
addr == 16'h10 ? 16'h002f :  // <0046> j = :test_pattern
addr == 16'h11 ? 16'hc800 :  // <0047> nop
addr == 16'h12 ? 16'hd310 :  // <0048> fetch g7 from i+j
addr == 16'h13 ? 16'h1fb0 :  // <0048> fetch g7 from i+j
addr == 16'h14 ? 16'hfba0 :  // <0049> call :putchar
addr == 16'h15 ? 16'h0021 :  // <0049> call :putchar
addr == 16'h16 ? 16'hfc00 :  // <0049> call :putchar

// increment index & wrap around end of pattern.
addr == 16'h17 ? 16'h0e01 :  // <0052> j = 1
addr == 16'h18 ? 16'hc800 :  // <0053> nop
addr == 16'h19 ? 16'h0b10 :  // <0054> i = i+j
addr == 16'h1a ? 16'h0c06 :  // <0055> j = g6
addr == 16'h1b ? 16'hc800 :  // <0056> nop
addr == 16'h1c ? 16'he401 :  // <0057> bn 1z :no_wrap
addr == 16'h1d ? 16'h001f :  // <0057> bn 1z :no_wrap
addr == 16'h1e ? 16'h0a00 :  // <0058> i = 0
// :no_wrap // = 0x1f

// repeat forever.
addr == 16'h1f ? 16'he005 :  // <0062> br always :again
addr == 16'h20 ? 16'h000a :  // <0062> br always :again


// routine sends out the low byte from g7 to the UART.  blocks until the UART accepts the byte.
// :putchar // = 0x21

// wait for UART to be idle (not busy).
addr == 16'h21 ? 16'h0202 :  // <0069> a = $atx_busy
// :wait_for_idle // = 0x22
addr == 16'h22 ? 16'h040a :  // <0071> b = atx_ctrl
addr == 16'h23 ? 16'hc800 :  // <0072> nop
addr == 16'h24 ? 16'he402 :  // <0073> bn and0z :wait_for_idle
addr == 16'h25 ? 16'h0022 :  // <0073> bn and0z :wait_for_idle

// push word to the UART.  its low byte is a character.
addr == 16'h26 ? 16'h2407 :  // <0076> atx_data = g7

// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_ctrl.
addr == 16'h27 ? 16'h2a01 :  // <0081> atx_ctrl = $atx_load

// wait until UART is busy, as acknowledgement.
addr == 16'h28 ? 16'h0202 :  // <0084> a = $atx_busy
// :wait_for_busy // = 0x29
addr == 16'h29 ? 16'h040a :  // <0086> b = atx_ctrl
addr == 16'h2a ? 16'h2204 :  // <0087> leds = 0b00000100
addr == 16'h2b ? 16'he002 :  // <0088> br and0z :wait_for_busy
addr == 16'h2c ? 16'h0029 :  // <0088> br and0z :wait_for_busy

addr == 16'h2d ? 16'h2a00 :  // <0090> atx_ctrl = 0
addr == 16'h2e ? 16'hfc00 :  // <0091> return


// :test_pattern // = 0x2f
addr == 16'h2f ? 16'h0055 :  // <0095> 0x55
addr == 16'h30 ? 16'h00aa :  // <0096> 0xaa
addr == 16'h31 ? 16'h0041 :  // <0097> 0b01000001
addr == 16'h32 ? 16'h0042 :  // <0098> 66
addr == 16'h33 ? 16'h000d :  // <0099> 0x0d
addr == 16'h34 ? 16'h000a :  // <0100> 0x0a

// :msg // = 0x35
// "testes, testes,\n\t 1...\n\t 2...\n\t 3?? \n\x00"
addr == 16'h35 ? 16'h6574 :  // <0103> et
addr == 16'h36 ? 16'h7473 :  // <0103> ts
addr == 16'h37 ? 16'h7365 :  // <0103> se
addr == 16'h38 ? 16'h202c :  // <0103>  ,
addr == 16'h39 ? 16'h6574 :  // <0103> et
addr == 16'h3a ? 16'h7473 :  // <0103> ts
addr == 16'h3b ? 16'h7365 :  // <0103> se
addr == 16'h3c ? 16'h0a2c :  // <0103>  ,
addr == 16'h3d ? 16'h2009 :  // <0103>   
addr == 16'h3e ? 16'h2e31 :  // <0103> .1
addr == 16'h3f ? 16'h2e2e :  // <0103> ..
addr == 16'h40 ? 16'h090a :  // <0103>   
addr == 16'h41 ? 16'h3220 :  // <0103> 2 
addr == 16'h42 ? 16'h2e2e :  // <0103> ..
addr == 16'h43 ? 16'h0a2e :  // <0103>  .
addr == 16'h44 ? 16'h2009 :  // <0103>   
addr == 16'h45 ? 16'h3f33 :  // <0103> ?3
addr == 16'h46 ? 16'h203f :  // <0103>  ?
addr == 16'h47 ? 16'h000a :  // <0103>   

        
                16'hxxxx;
        endmodule
    
