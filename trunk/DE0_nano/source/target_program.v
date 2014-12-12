
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

addr == 16'h00 ? 16'h2202 :  // <0029> leds = 2
// :patch // = 0x01
addr == 16'h01 ? 16'h0008 :  // <0031> a = leds
addr == 16'h02 ? 16'h0601 :  // <0032> b = 1
addr == 16'h03 ? 16'hc800 :  // <0033> nop
addr == 16'h04 ? 16'h2300 :  // <0034> leds = a+b
addr == 16'h05 ? 16'h1e64 :  // <0035> g7 = 100
addr == 16'h06 ? 16'hfba0 :  // <0036> call :spinwait
addr == 16'h07 ? 16'h0036 :  // <0036> call :spinwait
addr == 16'h08 ? 16'hfc00 :  // <0036> call :spinwait
addr == 16'h09 ? 16'he005 :  // <0037> jmp :patch
addr == 16'h0a ? 16'h0001 :  // <0037> jmp :patch


addr == 16'h0b ? 16'h2201 :  // <0040> leds = 1

// using i as index into string.
addr == 16'h0c ? 16'h0a00 :  // <0043> i = 0

// cache the string limit in g6.
addr == 16'h0d ? 16'h0210 :  // <0046> a = 16
addr == 16'h0e ? 16'h0760 :  // <0047> b = 0xffff
addr == 16'h0f ? 16'hc800 :  // <0048> nop
addr == 16'h10 ? 16'h1b38 :  // <0049> g6 = xor

// :again // = 0x11
// // wait for keypress.
// :wait_key_press
// a = 0
// b = keys
// nop
// br z :wait_key_press
// :wait_key_release
// b = keys
// nop
// bn z :wait_key_release

addr == 16'h11 ? 16'h1e64 :  // <0063> g7 = 100
addr == 16'h12 ? 16'hfba0 :  // <0064> call :spinwait
addr == 16'h13 ? 16'h0036 :  // <0064> call :spinwait
addr == 16'h14 ? 16'hfc00 :  // <0064> call :spinwait

// increment LEDs
addr == 16'h15 ? 16'h0008 :  // <0067> a = leds
addr == 16'h16 ? 16'h0601 :  // <0068> b = 1
addr == 16'h17 ? 16'hc800 :  // <0069> nop
addr == 16'h18 ? 16'h2300 :  // <0070> leds = a+b

// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 16'h19 ? 16'h0fa0 :  // <0073> j = :msg
addr == 16'h1a ? 16'h0044 :  // <0073> j = :msg
addr == 16'h1b ? 16'hc800 :  // <0074> nop
addr == 16'h1c ? 16'hd310 :  // <0075> fetch g7 from i+j
addr == 16'h1d ? 16'h1fb0 :  // <0075> fetch g7 from i+j
addr == 16'h1e ? 16'hfba0 :  // <0076> call :putchar
addr == 16'h1f ? 16'h002b :  // <0076> call :putchar
addr == 16'h20 ? 16'hfc00 :  // <0076> call :putchar

// increment index & wrap around end of pattern.
addr == 16'h21 ? 16'h0e01 :  // <0079> j = 1
addr == 16'h22 ? 16'hc800 :  // <0080> nop
addr == 16'h23 ? 16'h0b10 :  // <0081> i = i+j
addr == 16'h24 ? 16'h0c06 :  // <0082> j = g6
addr == 16'h25 ? 16'hc800 :  // <0083> nop
addr == 16'h26 ? 16'he401 :  // <0084> bn 1z :no_wrap
addr == 16'h27 ? 16'h0029 :  // <0084> bn 1z :no_wrap
addr == 16'h28 ? 16'h0a00 :  // <0085> i = 0
// :no_wrap // = 0x29

// repeat forever.
addr == 16'h29 ? 16'he005 :  // <0089> jmp :again
addr == 16'h2a ? 16'h0011 :  // <0089> jmp :again


// routine sends out the low byte from g7 to the UART.  blocks until the UART accepts the byte.
// :putchar // = 0x2b
addr == 16'h2b ? 16'h2407 :  // <0094> av_writedata = g7
addr == 16'h2c ? 16'h2ba0 :  // <0095> av_address = $jtag_uart_data
addr == 16'h2d ? 16'h0100 :  // <0095> av_address = $jtag_uart_data
addr == 16'h2e ? 16'h2e01 :  // <0096> av_ctrl = $av_write_mask
addr == 16'h2f ? 16'h0200 :  // <0097> a = 0
// :wait_for_slave // = 0x30
addr == 16'h30 ? 16'h040c :  // <0099> b = av_waitrequest
addr == 16'h31 ? 16'hc800 :  // <0100> nop
addr == 16'h32 ? 16'he404 :  // <0101> bn z :wait_for_slave
addr == 16'h33 ? 16'h0030 :  // <0101> bn z :wait_for_slave
addr == 16'h34 ? 16'h2e00 :  // <0102> av_ctrl = 0
addr == 16'h35 ? 16'hfc00 :  // <0103> return

// routine waits a number of milliseconds given in g7.
// :spinwait // = 0x36
// :spinwait_outer // = 0x36
addr == 16'h36 ? 16'h13a0 :  // <0108> x = 12500
addr == 16'h37 ? 16'h30d4 :  // <0108> x = 12500
addr == 16'h38 ? 16'h1760 :  // <0109> y = -1
addr == 16'h39 ? 16'hc800 :  // <0110> nop
// :spinwait_inner // = 0x3a
addr == 16'h3a ? 16'h1320 :  // <0112> x = x+y
addr == 16'h3b ? 16'hc800 :  // <0113> nop
addr == 16'h3c ? 16'he400 :  // <0114> bn 2z :spinwait_inner
addr == 16'h3d ? 16'h003a :  // <0114> bn 2z :spinwait_inner
addr == 16'h3e ? 16'h1007 :  // <0115> x = g7
addr == 16'h3f ? 16'hc800 :  // <0116> nop
addr == 16'h40 ? 16'h1f20 :  // <0117> g7 = x+y
addr == 16'h41 ? 16'he400 :  // <0118> bn 2z :spinwait_outer
addr == 16'h42 ? 16'h0036 :  // <0118> bn 2z :spinwait_outer
addr == 16'h43 ? 16'hfc00 :  // <0119> return

// :msg // = 0x44
// "1234567890abcdef\n\x00"
addr == 16'h44 ? 16'h3231 :  // <0122> 21
addr == 16'h45 ? 16'h3433 :  // <0122> 43
addr == 16'h46 ? 16'h3635 :  // <0122> 65
addr == 16'h47 ? 16'h3837 :  // <0122> 87
addr == 16'h48 ? 16'h3039 :  // <0122> 09
addr == 16'h49 ? 16'h6261 :  // <0122> ba
addr == 16'h4a ? 16'h6463 :  // <0122> dc
addr == 16'h4b ? 16'h6665 :  // <0122> fe
addr == 16'h4c ? 16'h000a :  // <0122>   

        
                16'hxxxx;
        endmodule
    
