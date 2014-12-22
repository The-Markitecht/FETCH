
        `include "header.v"

        module target_program (
            input wire[15:0] addr
            ,output wire[15:0] data
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
addr == 16'h00 ? 16'h2601 :  // <0039> leds = 1
addr == 16'h01 ? 16'h2e00 :  // <0040> atx_ctrl = 0

addr == 16'h02 ? 16'h0241 :  // <0042> a = 65
addr == 16'h03 ? 16'h2000 :  // <0043> push a // push a
addr == 16'h04 ? 16'h0242 :  // <0044> a = 66
addr == 16'h05 ? 16'h2000 :  // <0045> push a // push a
addr == 16'h06 ? 16'h0243 :  // <0046> a = 67
addr == 16'h07 ? 16'h2000 :  // <0047> push a // push a
addr == 16'h08 ? 16'h0244 :  // <0048> a = 68
addr == 16'h09 ? 16'h2000 :  // <0049> push a // push a
addr == 16'h0a ? 16'h0245 :  // <0050> a = 69
addr == 16'h0b ? 16'h2000 :  // <0051> push a // push a

addr == 16'h0c ? 16'h0408 :  // <0053> pop b // pop b
addr == 16'h0d ? 16'h0001 :  // <0054> a = b // putchar b
addr == 16'h0e ? 16'hfba0 :  // <0054> putchar b
addr == 16'h0f ? 16'h0113 :  // <0054> "
addr == 16'h10 ? 16'hfc00 :  // <0054> "
addr == 16'h11 ? 16'h0408 :  // <0055> pop b // pop b
addr == 16'h12 ? 16'h0001 :  // <0056> a = b // putchar b
addr == 16'h13 ? 16'hfba0 :  // <0056> putchar b
addr == 16'h14 ? 16'h0113 :  // <0056> "
addr == 16'h15 ? 16'hfc00 :  // <0056> "
addr == 16'h16 ? 16'h0408 :  // <0057> pop b // pop b
addr == 16'h17 ? 16'h0001 :  // <0058> a = b // putchar b
addr == 16'h18 ? 16'hfba0 :  // <0058> putchar b
addr == 16'h19 ? 16'h0113 :  // <0058> "
addr == 16'h1a ? 16'hfc00 :  // <0058> "
addr == 16'h1b ? 16'h0408 :  // <0059> pop b // pop b
addr == 16'h1c ? 16'h0001 :  // <0060> a = b // putchar b
addr == 16'h1d ? 16'hfba0 :  // <0060> putchar b
addr == 16'h1e ? 16'h0113 :  // <0060> "
addr == 16'h1f ? 16'hfc00 :  // <0060> "
addr == 16'h20 ? 16'h0408 :  // <0061> pop b // pop b
addr == 16'h21 ? 16'h0001 :  // <0062> a = b // putchar b
addr == 16'h22 ? 16'hfba0 :  // <0062> putchar b
addr == 16'h23 ? 16'h0113 :  // <0062> "
addr == 16'h24 ? 16'hfc00 :  // <0062> "

addr == 16'h25 ? 16'h03a0 :  // <0064> a = 0x1234
addr == 16'h26 ? 16'h1234 :  // <0064> "
addr == 16'h27 ? 16'hfba0 :  // <0065> call put4x
addr == 16'h28 ? 16'h008f :  // <0065> "
addr == 16'h29 ? 16'hfc00 :  // <0065> "

// x = 0x1234
// y = 1
// a = 0
// :nextwrite
// m9k_addr = a
// m9k_data = x
// x = x+y
// b = 1
// nop
// a = a+b
// b = 1024
// nop
// br lt :nextwrite

//patch
addr == 16'h2a ? 16'h1200 :  // <0082> x = 0
addr == 16'h2b ? 16'h1601 :  // <0083> y = 1
// :patch // = 0x002c

addr == 16'h2c ? 16'h0009 :  // <0086> a = leds
addr == 16'h2d ? 16'h0601 :  // <0087> b = 1
addr == 16'h2e ? 16'hc800 :  // <0088> nop
addr == 16'h2f ? 16'h2700 :  // <0089> leds = a+b

// :wait_key_press
// a = 0x03
// b = keys
// nop
// br eq :wait_key_press
// :wait_key_release
// b = keys
// nop
// bn eq :wait_key_release

addr == 16'h30 ? 16'hfba0 :  // <0101> getchar
addr == 16'h31 ? 16'h0123 :  // <0101> "
addr == 16'h32 ? 16'hfc00 :  // <0101> "
addr == 16'h33 ? 16'h0601 :  // <0102> b = 1
addr == 16'h34 ? 16'hc800 :  // <0103> nop
addr == 16'h35 ? 16'h0300 :  // <0104> a = a+b // putchar a+b
addr == 16'h36 ? 16'hfba0 :  // <0104> putchar a+b
addr == 16'h37 ? 16'h0113 :  // <0104> "
addr == 16'h38 ? 16'hfc00 :  // <0104> "

addr == 16'h39 ? 16'h0655 :  // <0106> b = 85
addr == 16'h3a ? 16'h0001 :  // <0107> a = b // putchar b
addr == 16'h3b ? 16'hfba0 :  // <0107> putchar b
addr == 16'h3c ? 16'h0113 :  // <0107> "
addr == 16'h3d ? 16'hfc00 :  // <0107> "

addr == 16'h3e ? 16'h1320 :  // <0109> x = x+y
addr == 16'h3f ? 16'hc800 :  // <0110> nop
addr == 16'h40 ? 16'h0004 :  // <0111> a = x
addr == 16'h41 ? 16'hfba0 :  // <0112> call put4x
addr == 16'h42 ? 16'h008f :  // <0112> "
addr == 16'h43 ? 16'hfc00 :  // <0112> "

addr == 16'h44 ? 16'h0264 :  // <0114> a = 100
addr == 16'h45 ? 16'hfba0 :  // <0115> call :spinwait
addr == 16'h46 ? 16'h007d :  // <0115> "
addr == 16'h47 ? 16'hfc00 :  // <0115> "

// b = 32
// putchar b
// m9k_addr = x
// a = m9k_data
// call put4x

addr == 16'h48 ? 16'h060d :  // <0123> b = 13
addr == 16'h49 ? 16'h0001 :  // <0124> a = b // putchar b
addr == 16'h4a ? 16'hfba0 :  // <0124> putchar b
addr == 16'h4b ? 16'h0113 :  // <0124> "
addr == 16'h4c ? 16'hfc00 :  // <0124> "
addr == 16'h4d ? 16'h060a :  // <0125> b = 10
addr == 16'h4e ? 16'h0001 :  // <0126> a = b // putchar b
addr == 16'h4f ? 16'hfba0 :  // <0126> putchar b
addr == 16'h50 ? 16'h0113 :  // <0126> "
addr == 16'h51 ? 16'hfc00 :  // <0126> "

addr == 16'h52 ? 16'he00f :  // <0128> jmp :patch
addr == 16'h53 ? 16'h002c :  // <0128> "





// using i as index into string.
addr == 16'h54 ? 16'h0a00 :  // <0135> i = 0

// cache the string limit in g6.
addr == 16'h55 ? 16'h0210 :  // <0138> a = 16
addr == 16'h56 ? 16'h0760 :  // <0139> b = 0xffff
addr == 16'h57 ? 16'hc800 :  // <0140> nop
addr == 16'h58 ? 16'h1b38 :  // <0141> g6 = xor

// :again // = 0x0059
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

addr == 16'h59 ? 16'h0264 :  // <0155> a = 100
addr == 16'h5a ? 16'hfba0 :  // <0156> call :spinwait
addr == 16'h5b ? 16'h007d :  // <0156> "
addr == 16'h5c ? 16'hfc00 :  // <0156> "

// increment LEDs
addr == 16'h5d ? 16'h0009 :  // <0159> a = leds
addr == 16'h5e ? 16'h0601 :  // <0160> b = 1
addr == 16'h5f ? 16'hc800 :  // <0161> nop
addr == 16'h60 ? 16'h2700 :  // <0162> leds = a+b

// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 16'h61 ? 16'h0fa0 :  // <0165> j = :msg
addr == 16'h62 ? 16'h0074 :  // <0165> "
addr == 16'h63 ? 16'hc800 :  // <0166> nop
addr == 16'h64 ? 16'hd310 :  // <0167> fetch a from i+j
addr == 16'h65 ? 16'h03b0 :  // <0167> "
addr == 16'h66 ? 16'h0000 :  // <0168> a = a // putchar a
addr == 16'h67 ? 16'hfba0 :  // <0168> putchar a
addr == 16'h68 ? 16'h0113 :  // <0168> "
addr == 16'h69 ? 16'hfc00 :  // <0168> "

// increment index & wrap around end of pattern.
addr == 16'h6a ? 16'h0e01 :  // <0171> j = 1
addr == 16'h6b ? 16'hc800 :  // <0172> nop
addr == 16'h6c ? 16'h0b10 :  // <0173> i = i+j
addr == 16'h6d ? 16'h0c06 :  // <0174> j = g6
addr == 16'h6e ? 16'hc800 :  // <0175> nop
addr == 16'h6f ? 16'he401 :  // <0176> bn 1z :no_wrap
addr == 16'h70 ? 16'h0072 :  // <0176> "
addr == 16'h71 ? 16'h0a00 :  // <0177> i = 0
// :no_wrap // = 0x0072

// repeat forever.
addr == 16'h72 ? 16'he00f :  // <0181> jmp :again
addr == 16'h73 ? 16'h0059 :  // <0181> "

// :msg // = 0x0074
// "1234567890abcdef\n\x00"
addr == 16'h74 ? 16'h3231 :  // <0184> 21
addr == 16'h75 ? 16'h3433 :  // <0184> 43
addr == 16'h76 ? 16'h3635 :  // <0184> 65
addr == 16'h77 ? 16'h3837 :  // <0184> 87
addr == 16'h78 ? 16'h3039 :  // <0184> 09
addr == 16'h79 ? 16'h6261 :  // <0184> ba
addr == 16'h7a ? 16'h6463 :  // <0184> dc
addr == 16'h7b ? 16'h6665 :  // <0184> fe
addr == 16'h7c ? 16'h000a :  // <0184>   

// routine waits a number of milliseconds given in a.
// func spinwait // = 0x007d
addr == 16'h7d ? 16'h2004 :  // <0187> push x // func spinwait
addr == 16'h7e ? 16'h2005 :  // <0187> push y // "
addr == 16'h7f ? 16'h0760 :  // <0188> b = -1
// :spinwait_outer // = 0x0080
addr == 16'h80 ? 16'h13a0 :  // <0190> x = 12500
addr == 16'h81 ? 16'h30d4 :  // <0190> "
addr == 16'h82 ? 16'h1760 :  // <0191> y = -1
addr == 16'h83 ? 16'hc800 :  // <0192> nop
// :spinwait_inner // = 0x0084
addr == 16'h84 ? 16'h1320 :  // <0194> x = x+y
addr == 16'h85 ? 16'hc800 :  // <0195> nop
addr == 16'h86 ? 16'he400 :  // <0196> bn 2z :spinwait_inner
addr == 16'h87 ? 16'h0084 :  // <0196> "
addr == 16'h88 ? 16'h0300 :  // <0197> a = a+b
addr == 16'h89 ? 16'hc800 :  // <0198> nop
addr == 16'h8a ? 16'he404 :  // <0199> bn z :spinwait_outer
addr == 16'h8b ? 16'h0080 :  // <0199> "
addr == 16'h8c ? 16'h1408 :  // <0200> pop y // return
addr == 16'h8d ? 16'h1008 :  // <0200> pop x // "
addr == 16'h8e ? 16'hfc00 :  // <0200> return

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x008f
addr == 16'h8f ? 16'h2004 :  // <0204> push x // func put4x
addr == 16'h90 ? 16'h2006 :  // <0204> push g6 // "
addr == 16'h91 ? 16'h203e :  // <0204> push rtna // "
addr == 16'h92 ? 16'h13a0 :  // <0205> x = :hexdigits
addr == 16'h93 ? 16'h00cc :  // <0205> "

addr == 16'h94 ? 16'h1800 :  // <0207> g6 = a
addr == 16'h95 ? 16'h07a0 :  // <0208> b = 0xF000
addr == 16'h96 ? 16'hf000 :  // <0208> "
addr == 16'h97 ? 16'hc800 :  // <0209> nop
addr == 16'h98 ? 16'h0330 :  // <0210> a = and
addr == 16'h99 ? 16'h0353 :  // <0211> a = a>>4
addr == 16'h9a ? 16'h0353 :  // <0212> a = a>>4
addr == 16'h9b ? 16'h0353 :  // <0213> a = a>>4
addr == 16'h9c ? 16'hfba0 :  // <0214> call fetch_byte
addr == 16'h9d ? 16'h00d4 :  // <0214> "
addr == 16'h9e ? 16'hfc00 :  // <0214> "
addr == 16'h9f ? 16'h0000 :  // <0215> a = a // putchar a
addr == 16'ha0 ? 16'hfba0 :  // <0215> putchar a
addr == 16'ha1 ? 16'h0113 :  // <0215> "
addr == 16'ha2 ? 16'hfc00 :  // <0215> "

addr == 16'ha3 ? 16'h0006 :  // <0217> a = g6
addr == 16'ha4 ? 16'h07a0 :  // <0218> b = 0x0F00
addr == 16'ha5 ? 16'h0f00 :  // <0218> "
addr == 16'ha6 ? 16'hc800 :  // <0219> nop
addr == 16'ha7 ? 16'h0330 :  // <0220> a = and
addr == 16'ha8 ? 16'h0353 :  // <0221> a = a>>4
addr == 16'ha9 ? 16'h0353 :  // <0222> a = a>>4
addr == 16'haa ? 16'hfba0 :  // <0223> call fetch_byte
addr == 16'hab ? 16'h00d4 :  // <0223> "
addr == 16'hac ? 16'hfc00 :  // <0223> "
addr == 16'had ? 16'h0000 :  // <0224> a = a // putchar a
addr == 16'hae ? 16'hfba0 :  // <0224> putchar a
addr == 16'haf ? 16'h0113 :  // <0224> "
addr == 16'hb0 ? 16'hfc00 :  // <0224> "

addr == 16'hb1 ? 16'h0006 :  // <0226> a = g6
addr == 16'hb2 ? 16'h06f0 :  // <0227> b = 0x00F0
addr == 16'hb3 ? 16'hc800 :  // <0228> nop
addr == 16'hb4 ? 16'h0330 :  // <0229> a = and
addr == 16'hb5 ? 16'h0353 :  // <0230> a = a>>4
addr == 16'hb6 ? 16'hfba0 :  // <0231> call fetch_byte
addr == 16'hb7 ? 16'h00d4 :  // <0231> "
addr == 16'hb8 ? 16'hfc00 :  // <0231> "
addr == 16'hb9 ? 16'h0000 :  // <0232> a = a // putchar a
addr == 16'hba ? 16'hfba0 :  // <0232> putchar a
addr == 16'hbb ? 16'h0113 :  // <0232> "
addr == 16'hbc ? 16'hfc00 :  // <0232> "

addr == 16'hbd ? 16'h0006 :  // <0234> a = g6
addr == 16'hbe ? 16'h060f :  // <0235> b = 0x000F
addr == 16'hbf ? 16'hc800 :  // <0236> nop
addr == 16'hc0 ? 16'h0330 :  // <0237> a = and
addr == 16'hc1 ? 16'hfba0 :  // <0238> call fetch_byte
addr == 16'hc2 ? 16'h00d4 :  // <0238> "
addr == 16'hc3 ? 16'hfc00 :  // <0238> "
addr == 16'hc4 ? 16'h0000 :  // <0239> a = a // putchar a
addr == 16'hc5 ? 16'hfba0 :  // <0239> putchar a
addr == 16'hc6 ? 16'h0113 :  // <0239> "
addr == 16'hc7 ? 16'hfc00 :  // <0239> "

addr == 16'hc8 ? 16'hf808 :  // <0241> pop rtna // return
addr == 16'hc9 ? 16'h1808 :  // <0241> pop g6 // "
addr == 16'hca ? 16'h1008 :  // <0241> pop x // "
addr == 16'hcb ? 16'hfc00 :  // <0241> return

// :hexdigits // = 0x00cc
// "0123456789abcdef"
addr == 16'hcc ? 16'h3130 :  // <0244> 10
addr == 16'hcd ? 16'h3332 :  // <0244> 32
addr == 16'hce ? 16'h3534 :  // <0244> 54
addr == 16'hcf ? 16'h3736 :  // <0244> 76
addr == 16'hd0 ? 16'h3938 :  // <0244> 98
addr == 16'hd1 ? 16'h6261 :  // <0244> ba
addr == 16'hd2 ? 16'h6463 :  // <0244> dc
addr == 16'hd3 ? 16'h6665 :  // <0244> fe

// pick a byte from an array of words.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// func fetch_byte // = 0x00d4
addr == 16'hd4 ? 16'h0601 :  // <0249> b = 1
addr == 16'hd5 ? 16'hc800 :  // <0250> nop
addr == 16'hd6 ? 16'he002 :  // <0251> br and0z :pick_byte_even
addr == 16'hd7 ? 16'h00e0 :  // <0251> "
addr == 16'hd8 ? 16'h0350 :  // <0252> a = a>>1
addr == 16'hd9 ? 16'h0404 :  // <0253> b = x
addr == 16'hda ? 16'hc800 :  // <0254> nop
addr == 16'hdb ? 16'hd300 :  // <0255> fetch a from a+b
addr == 16'hdc ? 16'h03b0 :  // <0255> "
addr == 16'hdd ? 16'h0353 :  // <0256> a = a>>4
addr == 16'hde ? 16'h0353 :  // <0257> a = a>>4
addr == 16'hdf ? 16'hfc00 :  // <0258> return
// :pick_byte_even // = 0x00e0
addr == 16'he0 ? 16'h0350 :  // <0260> a = a>>1
addr == 16'he1 ? 16'h0404 :  // <0261> b = x
addr == 16'he2 ? 16'hc800 :  // <0262> nop
addr == 16'he3 ? 16'hd300 :  // <0263> fetch a from a+b
addr == 16'he4 ? 16'h03b0 :  // <0263> "
addr == 16'he5 ? 16'hfc00 :  // <0264> return

// compute the modulus(255) of a number given in a.  return remainder in a.
// func mod255 // = 0x00e6
addr == 16'he6 ? 16'h2006 :  // <0267> push g6 // func mod255
addr == 16'he7 ? 16'h2007 :  // <0267> push g7 // "
// while a is greater than 254, subtract 255.
// :mod255_again // = 0x00e8
addr == 16'he8 ? 16'h06fe :  // <0270> b = 0xfe
addr == 16'he9 ? 16'hc800 :  // <0271> nop
addr == 16'hea ? 16'he006 :  // <0272> br gt :mod255_greater
addr == 16'heb ? 16'h00ef :  // <0272> "
addr == 16'hec ? 16'h1c08 :  // <0273> pop g7 // return
addr == 16'hed ? 16'h1808 :  // <0273> pop g6 // "
addr == 16'hee ? 16'hfc00 :  // <0273> return
// :mod255_greater // = 0x00ef
addr == 16'hef ? 16'h07a0 :  // <0275> b = 0xff01
addr == 16'hf0 ? 16'hff01 :  // <0275> "
addr == 16'hf1 ? 16'hc800 :  // <0276> nop
addr == 16'hf2 ? 16'h0300 :  // <0277> a = a+b
addr == 16'hf3 ? 16'he00f :  // <0278> jmp :mod255_again
addr == 16'hf4 ? 16'h00e8 :  // <0278> "

// set up Fletcher16 checksum algorithm to accumulate in the 2 given register names.

addr == 16'hf5 ? 16'h1a00 :  // <0288> fletcher16_init g6 g7
addr == 16'hf6 ? 16'h1e00 :  // <0288> "

// accumulate a Fletcher16 checksum in g6 and g7,
// given the next byte of data in a.
// func fletcher16_input // = 0x00f7
addr == 16'hf7 ? 16'h2006 :  // <0292> push g6 // func fletcher16_input
addr == 16'hf8 ? 16'h2007 :  // <0292> push g7 // "
addr == 16'hf9 ? 16'h203e :  // <0292> push rtna // "
//patch: need a way to declare summing registers as "static" or "preserve" so they're not auto-stacked.
addr == 16'hfa ? 16'h0406 :  // <0294> b = $fletcher_sum1_reg
addr == 16'hfb ? 16'hc800 :  // <0295> nop
addr == 16'hfc ? 16'h0300 :  // <0296> a = a+b
addr == 16'hfd ? 16'hfba0 :  // <0297> call :mod255
addr == 16'hfe ? 16'h00e6 :  // <0297> "
addr == 16'hff ? 16'hfc00 :  // <0297> "
addr == 16'h100 ? 16'h1800 :  // <0298> $fletcher_sum1_reg = a

addr == 16'h101 ? 16'h0407 :  // <0300> b = $fletcher_sum2_reg
addr == 16'h102 ? 16'hc800 :  // <0301> nop
addr == 16'h103 ? 16'h0300 :  // <0302> a = a+b
addr == 16'h104 ? 16'hfba0 :  // <0303> call :mod255
addr == 16'h105 ? 16'h00e6 :  // <0303> "
addr == 16'h106 ? 16'hfc00 :  // <0303> "
addr == 16'h107 ? 16'h1c00 :  // <0304> $fletcher_sum2_reg = a
addr == 16'h108 ? 16'hf808 :  // <0305> pop rtna // return
addr == 16'h109 ? 16'h1c08 :  // <0305> pop g7 // "
addr == 16'h10a ? 16'h1808 :  // <0305> pop g6 // "
addr == 16'h10b ? 16'hfc00 :  // <0305> return

// return the combined 16-bit result of Fletcher16 checksum in a.
// func fletcher16_result // = 0x010c
addr == 16'h10c ? 16'h0007 :  // <0309> a = $fletcher_sum2_reg
addr == 16'h10d ? 16'h0352 :  // <0310> a = a<<4
addr == 16'h10e ? 16'h0352 :  // <0311> a = a<<4
addr == 16'h10f ? 16'h0406 :  // <0312> b = $fletcher_sum1_reg
addr == 16'h110 ? 16'hc800 :  // <0313> nop
addr == 16'h111 ? 16'h0334 :  // <0314> a = or
addr == 16'h112 ? 16'hfc00 :  // <0315> return

// routine sends out the low byte from a to the UART.  blocks until the UART accepts the byte.
// func putchar_atx // = 0x0113
addr == 16'h113 ? 16'h2004 :  // <0318> push x // func putchar_atx

addr == 16'h114 ? 16'h1000 :  // <0320> x = a

// wait for UART to be idle (not busy).
addr == 16'h115 ? 16'h0202 :  // <0323> a = $atx_busy_mask
// :pcatx_wait_for_idle // = 0x0116
addr == 16'h116 ? 16'h040b :  // <0325> b = atx_ctrl
addr == 16'h117 ? 16'hc800 :  // <0326> nop
addr == 16'h118 ? 16'he402 :  // <0327> bn and0z :pcatx_wait_for_idle
addr == 16'h119 ? 16'h0116 :  // <0327> "

// push word to the UART.  its low byte is a character.
addr == 16'h11a ? 16'h2804 :  // <0330> atx_data = x

// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_ctrl.
addr == 16'h11b ? 16'h2e01 :  // <0335> atx_ctrl = $atx_load_mask

// wait until UART is busy, as acknowledgement.
addr == 16'h11c ? 16'h0202 :  // <0338> a = $atx_busy_mask
// :pcatx_wait_for_busy // = 0x011d
addr == 16'h11d ? 16'h040b :  // <0340> b = atx_ctrl
addr == 16'h11e ? 16'he002 :  // <0341> br and0z :pcatx_wait_for_busy
addr == 16'h11f ? 16'h011d :  // <0341> "

addr == 16'h120 ? 16'h2e00 :  // <0343> atx_ctrl = 0
addr == 16'h121 ? 16'h1008 :  // <0344> pop x // return
addr == 16'h122 ? 16'hfc00 :  // <0344> return

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// func getchar_atx // = 0x0123
// wait until UART is busy, then idle.
addr == 16'h123 ? 16'h0204 :  // <0350> a = $arx_busy_mask
// :wait_for_busy // = 0x0124
addr == 16'h124 ? 16'h040b :  // <0352> b = atx_ctrl
addr == 16'h125 ? 16'he002 :  // <0353> br and0z :wait_for_busy
addr == 16'h126 ? 16'h0124 :  // <0353> "
// :wait_for_idle // = 0x0127
addr == 16'h127 ? 16'h040b :  // <0355> b = atx_ctrl
addr == 16'h128 ? 16'hc800 :  // <0356> nop
addr == 16'h129 ? 16'he402 :  // <0357> bn and0z :wait_for_idle
addr == 16'h12a ? 16'h0127 :  // <0357> "
addr == 16'h12b ? 16'h000a :  // <0358> a = atx_data
addr == 16'h12c ? 16'hfc00 :  // <0359> return

        
                16'hxxxx;
        endmodule
    
