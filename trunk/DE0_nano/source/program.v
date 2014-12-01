
    `timescale 1 ns / 1 ns

    module coderom (
        input[15:0] addr
        ,output[15:0] data
    );
        assign data = 

// write some data on the UART.
addr == 8'h00 ? 16'h2a01 :  // leds = 0x01
addr == 8'h01 ? 16'h2600 :  // atx_load = 0
// using x as pass counter.  shows on LEDs.
addr == 8'h02 ? 16'h1240 :  // x = 0x40
addr == 8'h03 ? 16'h1601 :  // y = 1
// :again  // = 0x04
// wait for UART to be idle (not busy).
addr == 8'h04 ? 16'h0004 :  // a = x
addr == 8'h05 ? 16'h0353 :  // a = a>>4
addr == 8'h06 ? 16'h2b53 :  // leds = a>>4
addr == 8'h07 ? 16'h0201 :  // a = 1
// :wait_for_idle  // = 0x08
addr == 8'h08 ? 16'h0440 :  // b = atx_busy
addr == 8'h09 ? 16'hc800 :  // nop = nop
addr == 8'h0a ? 16'he402 :  // bn and0z :wait_for_idle
addr == 8'h0b ? 16'h0008 :  // bn and0z :wait_for_idle
// write a byte to UART.
// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_load.
addr == 8'h0c ? 16'h23a0 :  // atx_data = imm16
addr == 8'h0d ? 16'h0055 :  // 0x55
// that doesn't have to be a imm16 any more.  it could be a small-constant assign.
addr == 8'h0e ? 16'h2601 :  // atx_load = 1
// wait until UART is busy, as acknowledgement.
addr == 8'h0f ? 16'h0201 :  // a = 1
// :wait_for_busy  // = 0x10
addr == 8'h10 ? 16'h0440 :  // b = atx_busy
addr == 8'h11 ? 16'h2a04 :  // leds = 0x04
addr == 8'h12 ? 16'h1320 :  // x = ad2
addr == 8'h13 ? 16'he002 :  // br and0z :wait_for_busy
addr == 8'h14 ? 16'h0010 :  // br and0z :wait_for_busy
addr == 8'h15 ? 16'h2600 :  // atx_load = 0
addr == 8'h16 ? 16'he005 :  // br always :again
addr == 8'h17 ? 16'h0004 :  // br always :again
        
            16'hxxxx;
    endmodule

