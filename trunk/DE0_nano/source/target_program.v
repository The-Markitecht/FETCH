
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
addr == 16'h00 ? 16'h2201 :  // <0028> leds = 1

// using i as index into string.
addr == 16'h01 ? 16'h0a00 :  // <0031> i = 0

// cache the string limit in g6.
addr == 16'h02 ? 16'h0210 :  // <0034> a = 16
addr == 16'h03 ? 16'h0760 :  // <0035> b = 0xffff
addr == 16'h04 ? 16'hc800 :  // <0036> nop
addr == 16'h05 ? 16'h1b38 :  // <0037> g6 = xor

// :again // = 0x06
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

addr == 16'h06 ? 16'h1e64 :  // <0051> g7 = 100
addr == 16'h07 ? 16'hfba0 :  // <0052> call :spinwait
addr == 16'h08 ? 16'h002b :  // <0052> call :spinwait
addr == 16'h09 ? 16'hfc00 :  // <0052> call :spinwait

// increment LEDs
addr == 16'h0a ? 16'h0008 :  // <0055> a = leds
addr == 16'h0b ? 16'h0601 :  // <0056> b = 1
addr == 16'h0c ? 16'hc800 :  // <0057> nop
addr == 16'h0d ? 16'h2300 :  // <0058> leds = a+b

// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 16'h0e ? 16'h0fa0 :  // <0061> j = :msg
addr == 16'h0f ? 16'h0039 :  // <0061> j = :msg
addr == 16'h10 ? 16'hc800 :  // <0062> nop
addr == 16'h11 ? 16'hd310 :  // <0063> fetch g7 from i+j
addr == 16'h12 ? 16'h1fb0 :  // <0063> fetch g7 from i+j
addr == 16'h13 ? 16'hfba0 :  // <0064> call :putchar
addr == 16'h14 ? 16'h0020 :  // <0064> call :putchar
addr == 16'h15 ? 16'hfc00 :  // <0064> call :putchar

// increment index & wrap around end of pattern.
addr == 16'h16 ? 16'h0e01 :  // <0067> j = 1
addr == 16'h17 ? 16'hc800 :  // <0068> nop
addr == 16'h18 ? 16'h0b10 :  // <0069> i = i+j
addr == 16'h19 ? 16'h0c06 :  // <0070> j = g6
addr == 16'h1a ? 16'hc800 :  // <0071> nop
addr == 16'h1b ? 16'he401 :  // <0072> bn 1z :no_wrap
addr == 16'h1c ? 16'h001e :  // <0072> bn 1z :no_wrap
addr == 16'h1d ? 16'h0a00 :  // <0073> i = 0
// :no_wrap // = 0x1e

// repeat forever.
addr == 16'h1e ? 16'he005 :  // <0077> jmp :again
addr == 16'h1f ? 16'h0006 :  // <0077> jmp :again


// routine sends out the low byte from g7 to the UART.  blocks until the UART accepts the byte.
// :putchar // = 0x20
addr == 16'h20 ? 16'h2407 :  // <0082> av_writedata = g7
addr == 16'h21 ? 16'h2ba0 :  // <0083> av_address = $jtag_uart_data
addr == 16'h22 ? 16'h0100 :  // <0083> av_address = $jtag_uart_data
addr == 16'h23 ? 16'h2e01 :  // <0084> av_ctrl = $av_write_mask
addr == 16'h24 ? 16'h0200 :  // <0085> a = 0
// :wait_for_slave // = 0x25
addr == 16'h25 ? 16'h040c :  // <0087> b = av_waitrequest
addr == 16'h26 ? 16'hc800 :  // <0088> nop
addr == 16'h27 ? 16'he404 :  // <0089> bn z :wait_for_slave
addr == 16'h28 ? 16'h0025 :  // <0089> bn z :wait_for_slave
addr == 16'h29 ? 16'h2e00 :  // <0090> av_ctrl = 0
addr == 16'h2a ? 16'hfc00 :  // <0091> return

// routine waits a number of milliseconds given in g7.
// :spinwait // = 0x2b
// :spinwait_outer // = 0x2b
addr == 16'h2b ? 16'h13a0 :  // <0096> x = 12500
addr == 16'h2c ? 16'h30d4 :  // <0096> x = 12500
addr == 16'h2d ? 16'h1760 :  // <0097> y = -1
addr == 16'h2e ? 16'hc800 :  // <0098> nop
// :spinwait_inner // = 0x2f
addr == 16'h2f ? 16'h1320 :  // <0100> x = x+y
addr == 16'h30 ? 16'hc800 :  // <0101> nop
addr == 16'h31 ? 16'he400 :  // <0102> bn 2z :spinwait_inner
addr == 16'h32 ? 16'h002f :  // <0102> bn 2z :spinwait_inner
addr == 16'h33 ? 16'h1007 :  // <0103> x = g7
addr == 16'h34 ? 16'hc800 :  // <0104> nop
addr == 16'h35 ? 16'h1f20 :  // <0105> g7 = x+y
addr == 16'h36 ? 16'he400 :  // <0106> bn 2z :spinwait_outer
addr == 16'h37 ? 16'h002b :  // <0106> bn 2z :spinwait_outer
addr == 16'h38 ? 16'hfc00 :  // <0107> return

// :msg // = 0x39
// "1234567890abcdef\n\x00"
addr == 16'h39 ? 16'h3231 :  // <0110> 21
addr == 16'h3a ? 16'h3433 :  // <0110> 43
addr == 16'h3b ? 16'h3635 :  // <0110> 65
addr == 16'h3c ? 16'h3837 :  // <0110> 87
addr == 16'h3d ? 16'h3039 :  // <0110> 09
addr == 16'h3e ? 16'h6261 :  // <0110> ba
addr == 16'h3f ? 16'h6463 :  // <0110> dc
addr == 16'h40 ? 16'h6665 :  // <0110> fe
addr == 16'h41 ? 16'h000a :  // <0110>   

        
                16'hxxxx;
        endmodule
    
