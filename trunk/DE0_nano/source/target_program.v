
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

//patch
// :patch // = 0x0001
addr == 16'h01 ? 16'h0009 :  // <0035> a = leds
addr == 16'h02 ? 16'h0601 :  // <0036> b = 1
addr == 16'h03 ? 16'hc800 :  // <0037> nop
addr == 16'h04 ? 16'h2700 :  // <0038> leds = a+b

addr == 16'h05 ? 16'h0641 :  // <0040> b = 65
addr == 16'h06 ? 16'h2fa0 :  // <0041> putchar b
addr == 16'h07 ? 16'h0100 :  // <0041> putchar b
addr == 16'h08 ? 16'h2801 :  // <0041> "

addr == 16'h09 ? 16'h13a0 :  // <0043> x = 65000
addr == 16'h0a ? 16'hfde8 :  // <0043> x = 65000
addr == 16'h0b ? 16'h1760 :  // <0044> y = -1
addr == 16'h0c ? 16'hc800 :  // <0045> nop
// :wait3 // = 0x000d
addr == 16'h0d ? 16'h1320 :  // <0047> x = x+y
addr == 16'h0e ? 16'hc800 :  // <0048> nop
addr == 16'h0f ? 16'he400 :  // <0049> bn 2z :wait3
addr == 16'h10 ? 16'h000d :  // <0049> bn 2z :wait3

addr == 16'h11 ? 16'he00f :  // <0051> jmp :patch
addr == 16'h12 ? 16'h0001 :  // <0051> jmp :patch





// using i as index into string.
addr == 16'h13 ? 16'h0a00 :  // <0058> i = 0

// cache the string limit in g6.
addr == 16'h14 ? 16'h0210 :  // <0061> a = 16
addr == 16'h15 ? 16'h0760 :  // <0062> b = 0xffff
addr == 16'h16 ? 16'hc800 :  // <0063> nop
addr == 16'h17 ? 16'h1b38 :  // <0064> g6 = xor

// :again // = 0x0018
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

addr == 16'h18 ? 16'h0264 :  // <0078> a = 100
addr == 16'h19 ? 16'hfba0 :  // <0079> call :spinwait
addr == 16'h1a ? 16'h0032 :  // <0079> "
addr == 16'h1b ? 16'hfc00 :  // <0079> "

// increment LEDs
addr == 16'h1c ? 16'h0009 :  // <0082> a = leds
addr == 16'h1d ? 16'h0601 :  // <0083> b = 1
addr == 16'h1e ? 16'hc800 :  // <0084> nop
addr == 16'h1f ? 16'h2700 :  // <0085> leds = a+b

// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 16'h20 ? 16'h0fa0 :  // <0088> j = :msg
addr == 16'h21 ? 16'h0044 :  // <0088> j = :msg
addr == 16'h22 ? 16'hc800 :  // <0089> nop
addr == 16'h23 ? 16'hd310 :  // <0090> fetch a from i+j
addr == 16'h24 ? 16'h03b0 :  // <0090> "
addr == 16'h25 ? 16'h2fa0 :  // <0091> putchar a
addr == 16'h26 ? 16'h0100 :  // <0091> putchar a
addr == 16'h27 ? 16'h2800 :  // <0091> "

// increment index & wrap around end of pattern.
addr == 16'h28 ? 16'h0e01 :  // <0094> j = 1
addr == 16'h29 ? 16'hc800 :  // <0095> nop
addr == 16'h2a ? 16'h0b10 :  // <0096> i = i+j
addr == 16'h2b ? 16'h0c06 :  // <0097> j = g6
addr == 16'h2c ? 16'hc800 :  // <0098> nop
addr == 16'h2d ? 16'he401 :  // <0099> bn 1z :no_wrap
addr == 16'h2e ? 16'h0030 :  // <0099> bn 1z :no_wrap
addr == 16'h2f ? 16'h0a00 :  // <0100> i = 0
// :no_wrap // = 0x0030

// repeat forever.
addr == 16'h30 ? 16'he00f :  // <0104> jmp :again
addr == 16'h31 ? 16'h0018 :  // <0104> jmp :again

// routine waits a number of milliseconds given in a.
// func spinwait // = 0x0032
addr == 16'h32 ? 16'h2004 :  // <0107> push x // func spinwait
addr == 16'h33 ? 16'h2005 :  // <0107> push y // "
addr == 16'h34 ? 16'h0760 :  // <0108> b = -1
// :spinwait_outer // = 0x0035
addr == 16'h35 ? 16'h13a0 :  // <0110> x = 12500
addr == 16'h36 ? 16'h30d4 :  // <0110> x = 12500
addr == 16'h37 ? 16'h1760 :  // <0111> y = -1
addr == 16'h38 ? 16'hc800 :  // <0112> nop
// :spinwait_inner // = 0x0039
addr == 16'h39 ? 16'h1320 :  // <0114> x = x+y
addr == 16'h3a ? 16'hc800 :  // <0115> nop
addr == 16'h3b ? 16'he400 :  // <0116> bn 2z :spinwait_inner
addr == 16'h3c ? 16'h0039 :  // <0116> bn 2z :spinwait_inner
addr == 16'h3d ? 16'h0300 :  // <0117> a = a+b
addr == 16'h3e ? 16'hc800 :  // <0118> nop
addr == 16'h3f ? 16'he404 :  // <0119> bn z :spinwait_outer
addr == 16'h40 ? 16'h0035 :  // <0119> bn z :spinwait_outer
addr == 16'h41 ? 16'h1408 :  // <0120> pop y // return
addr == 16'h42 ? 16'h1008 :  // <0120> pop x // "
addr == 16'h43 ? 16'hfc00 :  // <0120> return

// :msg // = 0x0044
// "1234567890abcdef\n\x00"
addr == 16'h44 ? 16'h3231 :  // <0123> 21
addr == 16'h45 ? 16'h3433 :  // <0123> 43
addr == 16'h46 ? 16'h3635 :  // <0123> 65
addr == 16'h47 ? 16'h3837 :  // <0123> 87
addr == 16'h48 ? 16'h3039 :  // <0123> 09
addr == 16'h49 ? 16'h6261 :  // <0123> ba
addr == 16'h4a ? 16'h6463 :  // <0123> dc
addr == 16'h4b ? 16'h6665 :  // <0123> fe
addr == 16'h4c ? 16'h000a :  // <0123>   

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x004d
addr == 16'h4d ? 16'h2004 :  // <0127> push x // func put4x
addr == 16'h4e ? 16'h2006 :  // <0127> push g6 // "
addr == 16'h4f ? 16'h203e :  // <0127> push rtna // "
addr == 16'h50 ? 16'h13a0 :  // <0128> x = :hexdigits
addr == 16'h51 ? 16'h0086 :  // <0128> x = :hexdigits

addr == 16'h52 ? 16'h1800 :  // <0130> g6 = a
addr == 16'h53 ? 16'h07a0 :  // <0131> b = 0xF000
addr == 16'h54 ? 16'hf000 :  // <0131> b = 0xF000
addr == 16'h55 ? 16'hc800 :  // <0132> nop
addr == 16'h56 ? 16'h0330 :  // <0133> a = and
addr == 16'h57 ? 16'h0353 :  // <0134> a = a>>4
addr == 16'h58 ? 16'h0353 :  // <0135> a = a>>4
addr == 16'h59 ? 16'h0353 :  // <0136> a = a>>4
addr == 16'h5a ? 16'hfba0 :  // <0137> call fetch_byte
addr == 16'h5b ? 16'h008e :  // <0137> "
addr == 16'h5c ? 16'hfc00 :  // <0137> "
addr == 16'h5d ? 16'h2fa0 :  // <0138> putchar a
addr == 16'h5e ? 16'h0100 :  // <0138> putchar a
addr == 16'h5f ? 16'h2800 :  // <0138> "

addr == 16'h60 ? 16'h0006 :  // <0140> a = g6
addr == 16'h61 ? 16'h07a0 :  // <0141> b = 0x0F00
addr == 16'h62 ? 16'h0f00 :  // <0141> b = 0x0F00
addr == 16'h63 ? 16'hc800 :  // <0142> nop
addr == 16'h64 ? 16'h0330 :  // <0143> a = and
addr == 16'h65 ? 16'h0353 :  // <0144> a = a>>4
addr == 16'h66 ? 16'h0353 :  // <0145> a = a>>4
addr == 16'h67 ? 16'hfba0 :  // <0146> call fetch_byte
addr == 16'h68 ? 16'h008e :  // <0146> "
addr == 16'h69 ? 16'hfc00 :  // <0146> "
addr == 16'h6a ? 16'h2fa0 :  // <0147> putchar a
addr == 16'h6b ? 16'h0100 :  // <0147> putchar a
addr == 16'h6c ? 16'h2800 :  // <0147> "

addr == 16'h6d ? 16'h0006 :  // <0149> a = g6
addr == 16'h6e ? 16'h06f0 :  // <0150> b = 0x00F0
addr == 16'h6f ? 16'hc800 :  // <0151> nop
addr == 16'h70 ? 16'h0330 :  // <0152> a = and
addr == 16'h71 ? 16'h0353 :  // <0153> a = a>>4
addr == 16'h72 ? 16'hfba0 :  // <0154> call fetch_byte
addr == 16'h73 ? 16'h008e :  // <0154> "
addr == 16'h74 ? 16'hfc00 :  // <0154> "
addr == 16'h75 ? 16'h2fa0 :  // <0155> putchar a
addr == 16'h76 ? 16'h0100 :  // <0155> putchar a
addr == 16'h77 ? 16'h2800 :  // <0155> "

addr == 16'h78 ? 16'h0006 :  // <0157> a = g6
addr == 16'h79 ? 16'h060f :  // <0158> b = 0x000F
addr == 16'h7a ? 16'hc800 :  // <0159> nop
addr == 16'h7b ? 16'h0330 :  // <0160> a = and
addr == 16'h7c ? 16'hfba0 :  // <0161> call fetch_byte
addr == 16'h7d ? 16'h008e :  // <0161> "
addr == 16'h7e ? 16'hfc00 :  // <0161> "
addr == 16'h7f ? 16'h2fa0 :  // <0162> putchar a
addr == 16'h80 ? 16'h0100 :  // <0162> putchar a
addr == 16'h81 ? 16'h2800 :  // <0162> "

addr == 16'h82 ? 16'hf808 :  // <0164> pop rtna // return
addr == 16'h83 ? 16'h1808 :  // <0164> pop g6 // "
addr == 16'h84 ? 16'h1008 :  // <0164> pop x // "
addr == 16'h85 ? 16'hfc00 :  // <0164> return

// :hexdigits // = 0x0086
// "0123456789abcdef"
addr == 16'h86 ? 16'h3130 :  // <0167> 10
addr == 16'h87 ? 16'h3332 :  // <0167> 32
addr == 16'h88 ? 16'h3534 :  // <0167> 54
addr == 16'h89 ? 16'h3736 :  // <0167> 76
addr == 16'h8a ? 16'h3938 :  // <0167> 98
addr == 16'h8b ? 16'h6261 :  // <0167> ba
addr == 16'h8c ? 16'h6463 :  // <0167> dc
addr == 16'h8d ? 16'h6665 :  // <0167> fe

// pick a byte from an array of words.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// func fetch_byte // = 0x008e
addr == 16'h8e ? 16'h0601 :  // <0172> b = 1
addr == 16'h8f ? 16'hc800 :  // <0173> nop
addr == 16'h90 ? 16'he002 :  // <0174> br and0z :pick_byte_even
addr == 16'h91 ? 16'h009a :  // <0174> br and0z :pick_byte_even
addr == 16'h92 ? 16'h0350 :  // <0175> a = a>>1
addr == 16'h93 ? 16'h0404 :  // <0176> b = x
addr == 16'h94 ? 16'hc800 :  // <0177> nop
addr == 16'h95 ? 16'hd300 :  // <0178> fetch a from a+b
addr == 16'h96 ? 16'h03b0 :  // <0178> "
addr == 16'h97 ? 16'h0353 :  // <0179> a = a>>4
addr == 16'h98 ? 16'h0353 :  // <0180> a = a>>4
addr == 16'h99 ? 16'hfc00 :  // <0181> return
// :pick_byte_even // = 0x009a
addr == 16'h9a ? 16'h0350 :  // <0183> a = a>>1
addr == 16'h9b ? 16'h0404 :  // <0184> b = x
addr == 16'h9c ? 16'hc800 :  // <0185> nop
addr == 16'h9d ? 16'hd300 :  // <0186> fetch a from a+b
addr == 16'h9e ? 16'h03b0 :  // <0186> "
addr == 16'h9f ? 16'hfc00 :  // <0187> return

// compute the modulus(255) of a number given in a.  return remainder in a.
// func mod255 // = 0x00a0
addr == 16'ha0 ? 16'h2006 :  // <0190> push g6 // func mod255
addr == 16'ha1 ? 16'h2007 :  // <0190> push g7 // "
// while a is greater than 254, subtract 255.
// :mod255_again // = 0x00a2
addr == 16'ha2 ? 16'h06fe :  // <0193> b = 0xfe
addr == 16'ha3 ? 16'hc800 :  // <0194> nop
addr == 16'ha4 ? 16'he006 :  // <0195> br gt :mod255_greater
addr == 16'ha5 ? 16'h00a9 :  // <0195> br gt :mod255_greater
addr == 16'ha6 ? 16'h1c08 :  // <0196> pop g7 // return
addr == 16'ha7 ? 16'h1808 :  // <0196> pop g6 // "
addr == 16'ha8 ? 16'hfc00 :  // <0196> return
// :mod255_greater // = 0x00a9
addr == 16'ha9 ? 16'h07a0 :  // <0198> b = 0xff01
addr == 16'haa ? 16'hff01 :  // <0198> b = 0xff01
addr == 16'hab ? 16'hc800 :  // <0199> nop
addr == 16'hac ? 16'h0300 :  // <0200> a = a+b
addr == 16'had ? 16'he00f :  // <0201> jmp :mod255_again
addr == 16'hae ? 16'h00a2 :  // <0201> jmp :mod255_again

// set up Fletcher16 checksum algorithm to accumulate in the 2 given register names.

addr == 16'haf ? 16'h1a00 :  // <0211> fletcher16_init g6 g7
addr == 16'hb0 ? 16'h1e00 :  // <0211> "

// accumulate a Fletcher16 checksum in g6 and g7,
// given the next byte of data in a.
// func fletcher16_input // = 0x00b1
addr == 16'hb1 ? 16'h2006 :  // <0215> push g6 // func fletcher16_input
addr == 16'hb2 ? 16'h2007 :  // <0215> push g7 // "
addr == 16'hb3 ? 16'h203e :  // <0215> push rtna // "
addr == 16'hb4 ? 16'h0406 :  // <0216> b = $fletcher_sum1_reg
addr == 16'hb5 ? 16'hc800 :  // <0217> nop
addr == 16'hb6 ? 16'h0300 :  // <0218> a = a+b
addr == 16'hb7 ? 16'hfba0 :  // <0219> call :mod255
addr == 16'hb8 ? 16'h00a0 :  // <0219> "
addr == 16'hb9 ? 16'hfc00 :  // <0219> "
addr == 16'hba ? 16'h1800 :  // <0220> $fletcher_sum1_reg = a

addr == 16'hbb ? 16'h0407 :  // <0222> b = $fletcher_sum2_reg
addr == 16'hbc ? 16'hc800 :  // <0223> nop
addr == 16'hbd ? 16'h0300 :  // <0224> a = a+b
addr == 16'hbe ? 16'hfba0 :  // <0225> call :mod255
addr == 16'hbf ? 16'h00a0 :  // <0225> "
addr == 16'hc0 ? 16'hfc00 :  // <0225> "
addr == 16'hc1 ? 16'h1c00 :  // <0226> $fletcher_sum2_reg = a
addr == 16'hc2 ? 16'hf808 :  // <0227> pop rtna // return
addr == 16'hc3 ? 16'h1c08 :  // <0227> pop g7 // "
addr == 16'hc4 ? 16'h1808 :  // <0227> pop g6 // "
addr == 16'hc5 ? 16'hfc00 :  // <0227> return

// return the combined 16-bit result of Fletcher16 checksum in a.
// func fletcher16_result // = 0x00c6
addr == 16'hc6 ? 16'h0007 :  // <0231> a = $fletcher_sum2_reg
addr == 16'hc7 ? 16'h0352 :  // <0232> a = a<<4
addr == 16'hc8 ? 16'h0352 :  // <0233> a = a<<4
addr == 16'hc9 ? 16'h0406 :  // <0234> b = $fletcher_sum1_reg
addr == 16'hca ? 16'hc800 :  // <0235> nop
addr == 16'hcb ? 16'h0334 :  // <0236> a = or
addr == 16'hcc ? 16'hfc00 :  // <0237> return

        
                16'hxxxx;
        endmodule
    
