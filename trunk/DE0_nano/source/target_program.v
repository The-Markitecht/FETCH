
        `include "header.v"

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
// alias_both av_ctrl          [incr counter]
//    vdefine av_write_mask                   0x0001
// alias_src  av_waitrequest   [incr counter]


// :begin // = 0x0000
addr == 16'h00 ? 16'h2601 :  // <0031> leds = 1

// using i as index into string.
addr == 16'h01 ? 16'h0a00 :  // <0034> i = 0

// cache the string limit in g6.
addr == 16'h02 ? 16'h0210 :  // <0037> a = 16
addr == 16'h03 ? 16'h0760 :  // <0038> b = 0xffff
addr == 16'h04 ? 16'hc800 :  // <0039> nop
addr == 16'h05 ? 16'h1b38 :  // <0040> g6 = xor

// :again // = 0x0006
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

addr == 16'h06 ? 16'h1e64 :  // <0054> g7 = 100
addr == 16'h07 ? 16'hfba0 :  // <0055> call :spinwait
addr == 16'h08 ? 16'h0020 :  // <0055> "
addr == 16'h09 ? 16'hfc00 :  // <0055> "

// increment LEDs
addr == 16'h0a ? 16'h0009 :  // <0058> a = leds
addr == 16'h0b ? 16'h0601 :  // <0059> b = 1
addr == 16'h0c ? 16'hc800 :  // <0060> nop
addr == 16'h0d ? 16'h2700 :  // <0061> leds = a+b

// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 16'h0e ? 16'h0fa0 :  // <0064> j = :msg
addr == 16'h0f ? 16'h0032 :  // <0064> j = :msg
addr == 16'h10 ? 16'hc800 :  // <0065> nop
addr == 16'h11 ? 16'hd310 :  // <0066> fetch a from i+j
addr == 16'h12 ? 16'h03b0 :  // <0066> "
addr == 16'h13 ? 16'h2fa0 :  // <0067> putchar a
addr == 16'h14 ? 16'h0100 :  // <0067> putchar a
addr == 16'h15 ? 16'h2800 :  // <0067> "

// increment index & wrap around end of pattern.
addr == 16'h16 ? 16'h0e01 :  // <0070> j = 1
addr == 16'h17 ? 16'hc800 :  // <0071> nop
addr == 16'h18 ? 16'h0b10 :  // <0072> i = i+j
addr == 16'h19 ? 16'h0c06 :  // <0073> j = g6
addr == 16'h1a ? 16'hc800 :  // <0074> nop
addr == 16'h1b ? 16'he401 :  // <0075> bn 1z :no_wrap
addr == 16'h1c ? 16'h001e :  // <0075> bn 1z :no_wrap
addr == 16'h1d ? 16'h0a00 :  // <0076> i = 0
// :no_wrap // = 0x001e

// repeat forever.
addr == 16'h1e ? 16'he005 :  // <0080> jmp :again
addr == 16'h1f ? 16'h0006 :  // <0080> jmp :again

// routine waits a number of milliseconds given in a.
// func spinwait // = 0x0020
addr == 16'h20 ? 16'h2004 :  // <0083> push x // func spinwait
addr == 16'h21 ? 16'h2005 :  // <0083> push y // "
addr == 16'h22 ? 16'h0760 :  // <0084> b = -1
// :spinwait_outer // = 0x0023
addr == 16'h23 ? 16'h13a0 :  // <0086> x = 12500
addr == 16'h24 ? 16'h30d4 :  // <0086> x = 12500
addr == 16'h25 ? 16'h1760 :  // <0087> y = -1
addr == 16'h26 ? 16'hc800 :  // <0088> nop
// :spinwait_inner // = 0x0027
addr == 16'h27 ? 16'h1320 :  // <0090> x = x+y
addr == 16'h28 ? 16'hc800 :  // <0091> nop
addr == 16'h29 ? 16'he400 :  // <0092> bn 2z :spinwait_inner
addr == 16'h2a ? 16'h0027 :  // <0092> bn 2z :spinwait_inner
addr == 16'h2b ? 16'h0300 :  // <0093> a = a+b
addr == 16'h2c ? 16'hc800 :  // <0094> nop
addr == 16'h2d ? 16'he404 :  // <0095> bn z :spinwait_outer
addr == 16'h2e ? 16'h0023 :  // <0095> bn z :spinwait_outer
addr == 16'h2f ? 16'h1408 :  // <0096> pop y // return
addr == 16'h30 ? 16'h1008 :  // <0096> pop x // "
addr == 16'h31 ? 16'hfc00 :  // <0096> return

// :msg // = 0x0032
// "1234567890abcdef\n\x00"
addr == 16'h32 ? 16'h3231 :  // <0099> 21
addr == 16'h33 ? 16'h3433 :  // <0099> 43
addr == 16'h34 ? 16'h3635 :  // <0099> 65
addr == 16'h35 ? 16'h3837 :  // <0099> 87
addr == 16'h36 ? 16'h3039 :  // <0099> 09
addr == 16'h37 ? 16'h6261 :  // <0099> ba
addr == 16'h38 ? 16'h6463 :  // <0099> dc
addr == 16'h39 ? 16'h6665 :  // <0099> fe
addr == 16'h3a ? 16'h000a :  // <0099>   

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x003b
addr == 16'h3b ? 16'h2004 :  // <0103> push x // func put4x
addr == 16'h3c ? 16'h2006 :  // <0103> push g6 // "
addr == 16'h3d ? 16'h203e :  // <0103> push rtna // "
addr == 16'h3e ? 16'h13a0 :  // <0104> x = :hexdigits
addr == 16'h3f ? 16'h0086 :  // <0104> x = :hexdigits

addr == 16'h40 ? 16'h1800 :  // <0106> g6 = a
addr == 16'h41 ? 16'h07a0 :  // <0107> b = 0xF000
addr == 16'h42 ? 16'hf000 :  // <0107> b = 0xF000
addr == 16'h43 ? 16'hc800 :  // <0108> nop
addr == 16'h44 ? 16'h0330 :  // <0109> a = and
addr == 16'h45 ? 16'h0353 :  // <0110> a = a>>4
addr == 16'h46 ? 16'h0353 :  // <0111> a = a>>4
addr == 16'h47 ? 16'h0353 :  // <0112> a = a>>4
addr == 16'h48 ? 16'hfba0 :  // <0113> call pick_byte
addr == 16'h49 ? 16'h0074 :  // <0113> "
addr == 16'h4a ? 16'hfc00 :  // <0113> "
addr == 16'h4b ? 16'h2fa0 :  // <0114> putchar a
addr == 16'h4c ? 16'h0100 :  // <0114> putchar a
addr == 16'h4d ? 16'h2800 :  // <0114> "

addr == 16'h4e ? 16'h0006 :  // <0116> a = g6
addr == 16'h4f ? 16'h07a0 :  // <0117> b = 0x0F00
addr == 16'h50 ? 16'h0f00 :  // <0117> b = 0x0F00
addr == 16'h51 ? 16'hc800 :  // <0118> nop
addr == 16'h52 ? 16'h0330 :  // <0119> a = and
addr == 16'h53 ? 16'h0353 :  // <0120> a = a>>4
addr == 16'h54 ? 16'h0353 :  // <0121> a = a>>4
addr == 16'h55 ? 16'hfba0 :  // <0122> call pick_byte
addr == 16'h56 ? 16'h0074 :  // <0122> "
addr == 16'h57 ? 16'hfc00 :  // <0122> "
addr == 16'h58 ? 16'h2fa0 :  // <0123> putchar a
addr == 16'h59 ? 16'h0100 :  // <0123> putchar a
addr == 16'h5a ? 16'h2800 :  // <0123> "

addr == 16'h5b ? 16'h0006 :  // <0125> a = g6
addr == 16'h5c ? 16'h06f0 :  // <0126> b = 0x00F0
addr == 16'h5d ? 16'hc800 :  // <0127> nop
addr == 16'h5e ? 16'h0330 :  // <0128> a = and
addr == 16'h5f ? 16'h0353 :  // <0129> a = a>>4
addr == 16'h60 ? 16'hfba0 :  // <0130> call pick_byte
addr == 16'h61 ? 16'h0074 :  // <0130> "
addr == 16'h62 ? 16'hfc00 :  // <0130> "
addr == 16'h63 ? 16'h2fa0 :  // <0131> putchar a
addr == 16'h64 ? 16'h0100 :  // <0131> putchar a
addr == 16'h65 ? 16'h2800 :  // <0131> "

addr == 16'h66 ? 16'h0006 :  // <0133> a = g6
addr == 16'h67 ? 16'h060f :  // <0134> b = 0x000F
addr == 16'h68 ? 16'hc800 :  // <0135> nop
addr == 16'h69 ? 16'h0330 :  // <0136> a = and
addr == 16'h6a ? 16'hfba0 :  // <0137> call pick_byte
addr == 16'h6b ? 16'h0074 :  // <0137> "
addr == 16'h6c ? 16'hfc00 :  // <0137> "
addr == 16'h6d ? 16'h2fa0 :  // <0138> putchar a
addr == 16'h6e ? 16'h0100 :  // <0138> putchar a
addr == 16'h6f ? 16'h2800 :  // <0138> "

addr == 16'h70 ? 16'hf808 :  // <0140> pop rtna // return
addr == 16'h71 ? 16'h1808 :  // <0140> pop g6 // "
addr == 16'h72 ? 16'h1008 :  // <0140> pop x // "
addr == 16'h73 ? 16'hfc00 :  // <0140> return

// pick a byte from an array of words.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// func pick_byte // = 0x0074
addr == 16'h74 ? 16'h0601 :  // <0145> b = 1
addr == 16'h75 ? 16'hc800 :  // <0146> nop
addr == 16'h76 ? 16'he002 :  // <0147> br and0z :pick_byte_even
addr == 16'h77 ? 16'h0080 :  // <0147> br and0z :pick_byte_even
addr == 16'h78 ? 16'h0350 :  // <0148> a = a>>1
addr == 16'h79 ? 16'h0404 :  // <0149> b = x
addr == 16'h7a ? 16'hc800 :  // <0150> nop
addr == 16'h7b ? 16'hd300 :  // <0151> fetch a from a+b
addr == 16'h7c ? 16'h03b0 :  // <0151> "
addr == 16'h7d ? 16'h0353 :  // <0152> a = a>>4
addr == 16'h7e ? 16'h0353 :  // <0153> a = a>>4
addr == 16'h7f ? 16'hfc00 :  // <0154> return
// :pick_byte_even // = 0x0080
addr == 16'h80 ? 16'h0350 :  // <0156> a = a>>1
addr == 16'h81 ? 16'h0404 :  // <0157> b = x
addr == 16'h82 ? 16'hc800 :  // <0158> nop
addr == 16'h83 ? 16'hd300 :  // <0159> fetch a from a+b
addr == 16'h84 ? 16'h03b0 :  // <0159> "
addr == 16'h85 ? 16'hfc00 :  // <0160> return

// :hexdigits // = 0x0086
// "0123456789abcdef"
addr == 16'h86 ? 16'h3130 :  // <0163> 10
addr == 16'h87 ? 16'h3332 :  // <0163> 32
addr == 16'h88 ? 16'h3534 :  // <0163> 54
addr == 16'h89 ? 16'h3736 :  // <0163> 76
addr == 16'h8a ? 16'h3938 :  // <0163> 98
addr == 16'h8b ? 16'h6261 :  // <0163> ba
addr == 16'h8c ? 16'h6463 :  // <0163> dc
addr == 16'h8d ? 16'h6665 :  // <0163> fe


        
                16'hxxxx;
        endmodule
    
