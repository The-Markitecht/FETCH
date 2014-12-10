
        `timescale 1 ns / 1 ns

        module target_program (
            input[15:0] addr
            ,output[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.
// to write some data on the UART.

// application-specific register aliases.

// :begin // = 0x00
addr == 16'h00 ? 16'h2a01 :  // <0012> leds = 0b00000001
addr == 16'h01 ? 16'h2600 :  // <0013> atx_load = 0

// using x as pass counter.  shows on LEDs.
addr == 16'h02 ? 16'h13a0 :  // <0016> x = 0xff00
addr == 16'h03 ? 16'hff00 :  // <0016> x = 0xff00
addr == 16'h04 ? 16'h1760 :  // <0017> y = -1

// using i as index into string.
addr == 16'h05 ? 16'h0a00 :  // <0020> i = 0

// cache the string limit.
addr == 16'h06 ? 16'h0205 :  // <0023> a = 5
addr == 16'h07 ? 16'h0760 :  // <0024> b = 0xffff
addr == 16'h08 ? 16'hc800 :  // <0025> nop
addr == 16'h09 ? 16'h1b38 :  // <0026> g6 = xor

// :again // = 0x0a
addr == 16'h0a ? 16'h1320 :  // <0029> x = x+y
addr == 16'h0b ? 16'hc800 :  // <0030> nop
addr == 16'h0c ? 16'h0004 :  // <0031> a = x
addr == 16'h0d ? 16'h0353 :  // <0032> a = a>>4
addr == 16'h0e ? 16'h2b53 :  // <0033> leds = a>>4

// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 16'h0f ? 16'h0fa0 :  // <0036> j = :test_pattern
addr == 16'h10 ? 16'h002f :  // <0036> j = :test_pattern
addr == 16'h11 ? 16'hc800 :  // <0037> nop
addr == 16'h12 ? 16'hd310 :  // <0038> fetch g7 from i+j
addr == 16'h13 ? 16'h1fb0 :  // <0038> fetch g7 from i+j
addr == 16'h14 ? 16'hbfa0 :  // <0039> call :putchar
addr == 16'h15 ? 16'h0021 :  // <0039> call :putchar
addr == 16'h16 ? 16'hfc00 :  // <0039> call :putchar

// increment index & wrap around end of pattern.
addr == 16'h17 ? 16'h0e01 :  // <0042> j = 1
addr == 16'h18 ? 16'hc800 :  // <0043> nop
addr == 16'h19 ? 16'h0b10 :  // <0044> i = i+j
addr == 16'h1a ? 16'h0c06 :  // <0045> j = g6
addr == 16'h1b ? 16'hc800 :  // <0046> nop
addr == 16'h1c ? 16'he401 :  // <0047> bn 1z :no_wrap
addr == 16'h1d ? 16'h001f :  // <0047> bn 1z :no_wrap
addr == 16'h1e ? 16'h0a00 :  // <0048> i = 0
// :no_wrap // = 0x1f

// repeat forever.
addr == 16'h1f ? 16'he005 :  // <0052> br always :again
addr == 16'h20 ? 16'h000a :  // <0052> br always :again


// routine sends out the low byte from g7 to the UART.  blocks until the UART accepts the byte.
// :putchar // = 0x21

// wait for UART to be idle (not busy).
addr == 16'h21 ? 16'h0201 :  // <0059> a = 1
// :wait_for_idle // = 0x22
addr == 16'h22 ? 16'h0440 :  // <0061> b = atx_busy
addr == 16'h23 ? 16'hc800 :  // <0062> nop
addr == 16'h24 ? 16'he402 :  // <0063> bn and0z :wait_for_idle
addr == 16'h25 ? 16'h0022 :  // <0063> bn and0z :wait_for_idle

// push word to the UART.  its low byte is a character.
addr == 16'h26 ? 16'h2007 :  // <0066> atx_data = g7

// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_load.
addr == 16'h27 ? 16'h2601 :  // <0071> atx_load = 1

// wait until UART is busy, as acknowledgement.
addr == 16'h28 ? 16'h0201 :  // <0074> a = 1
// :wait_for_busy // = 0x29
addr == 16'h29 ? 16'h0440 :  // <0076> b = atx_busy
addr == 16'h2a ? 16'h2a04 :  // <0077> leds = 0b00000100
addr == 16'h2b ? 16'he002 :  // <0078> br and0z :wait_for_busy
addr == 16'h2c ? 16'h0029 :  // <0078> br and0z :wait_for_busy

addr == 16'h2d ? 16'h2600 :  // <0080> atx_load = 0
addr == 16'h2e ? 16'hfc00 :  // <0081> return


// :test_pattern // = 0x2f
addr == 16'h2f ? 16'h0055 :  // <0085> 0x55
addr == 16'h30 ? 16'h00aa :  // <0086> 0xaa
addr == 16'h31 ? 16'h0041 :  // <0087> 0b01000001
addr == 16'h32 ? 16'h0042 :  // <0088> 66
addr == 16'h33 ? 16'h000d :  // <0089> 0x0d
addr == 16'h34 ? 16'h000a :  // <0090> 0x0a

// :msg // = 0x35
// "testes, testes,\n\t 1...\n\t 2...\n\t 3?? \n\x00"
addr == 16'h35 ? 16'h6574 :  // <0093> et
addr == 16'h36 ? 16'h7473 :  // <0093> ts
addr == 16'h37 ? 16'h7365 :  // <0093> se
addr == 16'h38 ? 16'h202c :  // <0093>  ,
addr == 16'h39 ? 16'h6574 :  // <0093> et
addr == 16'h3a ? 16'h7473 :  // <0093> ts
addr == 16'h3b ? 16'h7365 :  // <0093> se
addr == 16'h3c ? 16'h0a2c :  // <0093>  ,
addr == 16'h3d ? 16'h2009 :  // <0093>   
addr == 16'h3e ? 16'h2e31 :  // <0093> .1
addr == 16'h3f ? 16'h2e2e :  // <0093> ..
addr == 16'h40 ? 16'h090a :  // <0093>   
addr == 16'h41 ? 16'h3220 :  // <0093> 2 
addr == 16'h42 ? 16'h2e2e :  // <0093> ..
addr == 16'h43 ? 16'h0a2e :  // <0093>  .
addr == 16'h44 ? 16'h2009 :  // <0093>   
addr == 16'h45 ? 16'h3f33 :  // <0093> ?3
addr == 16'h46 ? 16'h203f :  // <0093>  ?
addr == 16'h47 ? 16'h000a :  // <0093>   

        
                16'hxxxx;
        endmodule
    
