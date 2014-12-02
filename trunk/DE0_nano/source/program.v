
    `timescale 1 ns / 1 ns

    module coderom (
        input[15:0] addr
        ,output[15:0] data
    );
        assign data = 

// write some data on the UART.
addr == 8'h00 ? 16'h2a01 :  // leds = 0b00000001
addr == 8'h01 ? 16'h2600 :  // atx_load = 0
addr == 8'h02 ? 16'hd22a :  // fetcha = 0x2a
addr == 8'h03 ? 16'h07b0 :  // b = fetchd
// using x as pass counter.  shows on LEDs.
addr == 8'h04 ? 16'h1240 :  // x = 0x40
addr == 8'h05 ? 16'h1601 :  // y = 1
addr == 8'h06 ? 16'hd3a0 :  // fetcha = :test_pattern
addr == 8'h07 ? 16'h001c :  // fetcha = :test_pattern
addr == 8'h08 ? 16'h07b0 :  // b = fetchd
// :again // = 0x09
// wait for UART to be idle (not busy).
addr == 8'h09 ? 16'h0004 :  // a = x
addr == 8'h0a ? 16'h0353 :  // a = a>>4
addr == 8'h0b ? 16'h2b53 :  // leds = a>>4
addr == 8'h0c ? 16'h0201 :  // a = 1
// :wait_for_idle // = 0x0d
addr == 8'h0d ? 16'h0440 :  // b = atx_busy
addr == 8'h0e ? 16'hc800 :  // nop = nop
addr == 8'h0f ? 16'he402 :  // bn and0z :wait_for_idle
addr == 8'h10 ? 16'h000d :  // bn and0z :wait_for_idle
// write a byte to UART.
// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_load.
addr == 8'h11 ? 16'h2255 :  // atx_data = 0x55
// that doesn't have to be a imm16 any more.  it could be a small-constant assign.
addr == 8'h12 ? 16'h2601 :  // atx_load = 1
// wait until UART is busy, as acknowledgement.
addr == 8'h13 ? 16'h0201 :  // a = 1
// :wait_for_busy // = 0x14
addr == 8'h14 ? 16'h0440 :  // b = atx_busy
addr == 8'h15 ? 16'h2a04 :  // leds = 0b00000100
addr == 8'h16 ? 16'h1320 :  // x = ad2
addr == 8'h17 ? 16'he002 :  // br and0z :wait_for_busy
addr == 8'h18 ? 16'h0014 :  // br and0z :wait_for_busy
addr == 8'h19 ? 16'h2600 :  // atx_load = 0
addr == 8'h1a ? 16'he005 :  // br always :again
addr == 8'h1b ? 16'h0009 :  // br always :again
// :test_pattern // = 0x1c
addr == 8'h1c ? 16'h0055 :  // 0x55
addr == 8'h1d ? 16'h00aa :  // 0xaa
addr == 8'h1e ? 16'h0055 :  // 0x55
addr == 8'h1f ? 16'h00aa :  // 0xaa
addr == 8'h20 ? 16'h0044 :  // 0b01000100
addr == 8'h21 ? 16'h0000 :  // 0
// :msg // = 0x22
// "testes, testes,\n\t 1...\n\t 2...\n\t 3?? \n"
addr == 8'h22 ? 16'h6574 :  // et
addr == 8'h23 ? 16'h7473 :  // ts
addr == 8'h24 ? 16'h7365 :  // se
addr == 8'h25 ? 16'h202c :  //  ,
addr == 8'h26 ? 16'h6574 :  // et
addr == 8'h27 ? 16'h7473 :  // ts
addr == 8'h28 ? 16'h7365 :  // se
addr == 8'h29 ? 16'h0a2c :  //  ,
addr == 8'h2a ? 16'h2009 :  //   
addr == 8'h2b ? 16'h2e31 :  // .1
addr == 8'h2c ? 16'h2e2e :  // ..
addr == 8'h2d ? 16'h090a :  //   
addr == 8'h2e ? 16'h3220 :  // 2 
addr == 8'h2f ? 16'h2e2e :  // ..
addr == 8'h30 ? 16'h0a2e :  //  .
addr == 8'h31 ? 16'h2009 :  //   
addr == 8'h32 ? 16'h3f33 :  // ?3
addr == 8'h33 ? 16'h203f :  //  ?
addr == 8'h34 ? 16'h000a :  //   
        
            16'hxxxx;
    endmodule

