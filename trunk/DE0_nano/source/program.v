
    `timescale 1 ns / 1 ns

    module coderom (
        input[15:0] addr
        ,output[15:0] data
    );
        assign data = 

// write some data on the UART.
addr == 8'h00 ? 16'h2a01 :  // leds = 0b00000001
addr == 8'h01 ? 16'h2600 :  // atx_load = 0
// using x as pass counter.  shows on LEDs.
addr == 8'h02 ? 16'h13a0 :  // x = 0xff00
addr == 8'h03 ? 16'hff00 :  // x = 0xff00
addr == 8'h04 ? 16'h1760 :  // y = -1
// using i as index into string.
addr == 8'h05 ? 16'h0a00 :  // i = 0
// cache the string limit.
addr == 8'h06 ? 16'h0205 :  // a = 5
addr == 8'h07 ? 16'h07a0 :  // b = 0xffff
addr == 8'h08 ? 16'hffff :  // b = 0xffff
addr == 8'h09 ? 16'hc800 :  // nop = nop
addr == 8'h0a ? 16'h1b38 :  // g6 = xor0
// :again // = 0x0b
addr == 8'h0b ? 16'h1320 :  // x = x+y
addr == 8'h0c ? 16'hc800 :  // nop = nop
addr == 8'h0d ? 16'h0004 :  // a = x
addr == 8'h0e ? 16'h0353 :  // a = a>>4
addr == 8'h0f ? 16'h2b53 :  // leds = a>>4
// wait for UART to be idle (not busy).
addr == 8'h10 ? 16'h0201 :  // a = 1
// :wait_for_idle // = 0x11
addr == 8'h11 ? 16'h0440 :  // b = atx_busy
addr == 8'h12 ? 16'hc800 :  // nop = nop
addr == 8'h13 ? 16'he402 :  // bn and0z :wait_for_idle
addr == 8'h14 ? 16'h0011 :  // bn and0z :wait_for_idle
// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 8'h15 ? 16'h0fa0 :  // j = :test_pattern
addr == 8'h16 ? 16'h002b :  // j = :test_pattern
addr == 8'h17 ? 16'hc800 :  // nop = nop
addr == 8'h18 ? 16'hd310 :  // fetcha = i+j
addr == 8'h19 ? 16'h23b0 :  // atx_data = fetchd
// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_load.
addr == 8'h1a ? 16'h2601 :  // atx_load = 1
// wait until UART is busy, as acknowledgement.
addr == 8'h1b ? 16'h0201 :  // a = 1
// :wait_for_busy // = 0x1c
addr == 8'h1c ? 16'h0440 :  // b = atx_busy
addr == 8'h1d ? 16'h2a04 :  // leds = 0b00000100
addr == 8'h1e ? 16'he002 :  // br and0z :wait_for_busy
addr == 8'h1f ? 16'h001c :  // br and0z :wait_for_busy
addr == 8'h20 ? 16'h2600 :  // atx_load = 0
// increment index & wrap around end of pattern.
addr == 8'h21 ? 16'h0e01 :  // j = 1
addr == 8'h22 ? 16'hc800 :  // nop = nop
addr == 8'h23 ? 16'h0b10 :  // i = i+j
addr == 8'h24 ? 16'h0c06 :  // j = g6
addr == 8'h25 ? 16'hc800 :  // nop = nop
addr == 8'h26 ? 16'he401 :  // bn 1z :no_wrap
addr == 8'h27 ? 16'h0029 :  // bn 1z :no_wrap
addr == 8'h28 ? 16'h0a00 :  // i = 0
// :no_wrap // = 0x29
// repeat forever.
addr == 8'h29 ? 16'he005 :  // br always :again
addr == 8'h2a ? 16'h000b :  // br always :again
// :test_pattern // = 0x2b
addr == 8'h2b ? 16'h0055 :  // 0x55
addr == 8'h2c ? 16'h00aa :  // 0xaa
addr == 8'h2d ? 16'h0041 :  // 0b01000001
addr == 8'h2e ? 16'h0042 :  // 66
addr == 8'h2f ? 16'h000d :  // 0x0d
addr == 8'h30 ? 16'h000a :  // 0x0a
// :msg // = 0x31
// "testes, testes,\n\t 1...\n\t 2...\n\t 3?? \n\x00"
addr == 8'h31 ? 16'h6574 :  // et
addr == 8'h32 ? 16'h7473 :  // ts
addr == 8'h33 ? 16'h7365 :  // se
addr == 8'h34 ? 16'h202c :  //  ,
addr == 8'h35 ? 16'h6574 :  // et
addr == 8'h36 ? 16'h7473 :  // ts
addr == 8'h37 ? 16'h7365 :  // se
addr == 8'h38 ? 16'h0a2c :  //  ,
addr == 8'h39 ? 16'h2009 :  //   
addr == 8'h3a ? 16'h2e31 :  // .1
addr == 8'h3b ? 16'h2e2e :  // ..
addr == 8'h3c ? 16'h090a :  //   
addr == 8'h3d ? 16'h3220 :  // 2 
addr == 8'h3e ? 16'h2e2e :  // ..
addr == 8'h3f ? 16'h0a2e :  //  .
addr == 8'h40 ? 16'h2009 :  //   
addr == 8'h41 ? 16'h3f33 :  // ?3
addr == 8'h42 ? 16'h203f :  //  ?
addr == 8'h43 ? 16'h000a :  //   
        
            16'hxxxx;
    endmodule

