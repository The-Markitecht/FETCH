
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
addr == 16'h00 ? 16'h2601 :  // <0038> leds = 1
addr == 16'h01 ? 16'h2e00 :  // <0039> atx_ctrl = 0

addr == 16'h02 ? 16'h0241 :  // <0041> a = 65
addr == 16'h03 ? 16'h2000 :  // <0042> push a // push a
addr == 16'h04 ? 16'h0242 :  // <0043> a = 66
addr == 16'h05 ? 16'h2000 :  // <0044> push a // push a
addr == 16'h06 ? 16'h0243 :  // <0045> a = 67
addr == 16'h07 ? 16'h2000 :  // <0046> push a // push a
addr == 16'h08 ? 16'h0244 :  // <0047> a = 68
addr == 16'h09 ? 16'h2000 :  // <0048> push a // push a
addr == 16'h0a ? 16'h0245 :  // <0049> a = 69
addr == 16'h0b ? 16'h2000 :  // <0050> push a // push a

addr == 16'h0c ? 16'h0408 :  // <0052> pop b // pop b
addr == 16'h0d ? 16'h0001 :  // <0053> a = b // putchar b
addr == 16'h0e ? 16'hfba0 :  // <0053> putchar b
addr == 16'h0f ? 16'h0105 :  // <0053> "
addr == 16'h10 ? 16'hfc00 :  // <0053> "
addr == 16'h11 ? 16'h0408 :  // <0054> pop b // pop b
addr == 16'h12 ? 16'h0001 :  // <0055> a = b // putchar b
addr == 16'h13 ? 16'hfba0 :  // <0055> putchar b
addr == 16'h14 ? 16'h0105 :  // <0055> "
addr == 16'h15 ? 16'hfc00 :  // <0055> "
addr == 16'h16 ? 16'h0408 :  // <0056> pop b // pop b
addr == 16'h17 ? 16'h0001 :  // <0057> a = b // putchar b
addr == 16'h18 ? 16'hfba0 :  // <0057> putchar b
addr == 16'h19 ? 16'h0105 :  // <0057> "
addr == 16'h1a ? 16'hfc00 :  // <0057> "
addr == 16'h1b ? 16'h0408 :  // <0058> pop b // pop b
addr == 16'h1c ? 16'h0001 :  // <0059> a = b // putchar b
addr == 16'h1d ? 16'hfba0 :  // <0059> putchar b
addr == 16'h1e ? 16'h0105 :  // <0059> "
addr == 16'h1f ? 16'hfc00 :  // <0059> "
addr == 16'h20 ? 16'h0408 :  // <0060> pop b // pop b
addr == 16'h21 ? 16'h0001 :  // <0061> a = b // putchar b
addr == 16'h22 ? 16'hfba0 :  // <0061> putchar b
addr == 16'h23 ? 16'h0105 :  // <0061> "
addr == 16'h24 ? 16'hfc00 :  // <0061> "

addr == 16'h25 ? 16'h03a0 :  // <0063> a = 0x1234
addr == 16'h26 ? 16'h1234 :  // <0063> "
addr == 16'h27 ? 16'hfba0 :  // <0064> call put4x
addr == 16'h28 ? 16'h0081 :  // <0064> "
addr == 16'h29 ? 16'hfc00 :  // <0064> "

//patch
addr == 16'h2a ? 16'h1200 :  // <0067> x = 0
addr == 16'h2b ? 16'h1601 :  // <0068> y = 1
// :patch // = 0x002c

addr == 16'h2c ? 16'h0009 :  // <0071> a = leds
addr == 16'h2d ? 16'h0601 :  // <0072> b = 1
addr == 16'h2e ? 16'hc800 :  // <0073> nop
addr == 16'h2f ? 16'h2700 :  // <0074> leds = a+b

// :wait_key_press // = 0x0030
addr == 16'h30 ? 16'h0203 :  // <0077> a = 0x03
addr == 16'h31 ? 16'h040e :  // <0078> b = keys
addr == 16'h32 ? 16'hc800 :  // <0079> nop
addr == 16'h33 ? 16'he007 :  // <0080> br eq :wait_key_press
addr == 16'h34 ? 16'h0030 :  // <0080> "
// :wait_key_release // = 0x0035
addr == 16'h35 ? 16'h040e :  // <0082> b = keys
addr == 16'h36 ? 16'hc800 :  // <0083> nop
addr == 16'h37 ? 16'he407 :  // <0084> bn eq :wait_key_release
addr == 16'h38 ? 16'h0035 :  // <0084> "

addr == 16'h39 ? 16'h0655 :  // <0086> b = 85
addr == 16'h3a ? 16'h0001 :  // <0087> a = b // putchar b
addr == 16'h3b ? 16'hfba0 :  // <0087> putchar b
addr == 16'h3c ? 16'h0105 :  // <0087> "
addr == 16'h3d ? 16'hfc00 :  // <0087> "

addr == 16'h3e ? 16'h1320 :  // <0089> x = x+y
addr == 16'h3f ? 16'hc800 :  // <0090> nop
addr == 16'h40 ? 16'h0004 :  // <0091> a = x
addr == 16'h41 ? 16'hfba0 :  // <0092> call put4x
addr == 16'h42 ? 16'h0081 :  // <0092> "
addr == 16'h43 ? 16'hfc00 :  // <0092> "

//    a = 100
//    call :spinwait

addr == 16'h44 ? 16'he00f :  // <0097> jmp :patch
addr == 16'h45 ? 16'h002c :  // <0097> "





// using i as index into string.
addr == 16'h46 ? 16'h0a00 :  // <0104> i = 0

// cache the string limit in g6.
addr == 16'h47 ? 16'h0210 :  // <0107> a = 16
addr == 16'h48 ? 16'h0760 :  // <0108> b = 0xffff
addr == 16'h49 ? 16'hc800 :  // <0109> nop
addr == 16'h4a ? 16'h1b38 :  // <0110> g6 = xor

// :again // = 0x004b
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

addr == 16'h4b ? 16'h0264 :  // <0124> a = 100
addr == 16'h4c ? 16'hfba0 :  // <0125> call :spinwait
addr == 16'h4d ? 16'h006f :  // <0125> "
addr == 16'h4e ? 16'hfc00 :  // <0125> "

// increment LEDs
addr == 16'h4f ? 16'h0009 :  // <0128> a = leds
addr == 16'h50 ? 16'h0601 :  // <0129> b = 1
addr == 16'h51 ? 16'hc800 :  // <0130> nop
addr == 16'h52 ? 16'h2700 :  // <0131> leds = a+b

// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 16'h53 ? 16'h0fa0 :  // <0134> j = :msg
addr == 16'h54 ? 16'h0066 :  // <0134> "
addr == 16'h55 ? 16'hc800 :  // <0135> nop
addr == 16'h56 ? 16'hd310 :  // <0136> fetch a from i+j
addr == 16'h57 ? 16'h03b0 :  // <0136> "
addr == 16'h58 ? 16'h0000 :  // <0137> a = a // putchar a
addr == 16'h59 ? 16'hfba0 :  // <0137> putchar a
addr == 16'h5a ? 16'h0105 :  // <0137> "
addr == 16'h5b ? 16'hfc00 :  // <0137> "

// increment index & wrap around end of pattern.
addr == 16'h5c ? 16'h0e01 :  // <0140> j = 1
addr == 16'h5d ? 16'hc800 :  // <0141> nop
addr == 16'h5e ? 16'h0b10 :  // <0142> i = i+j
addr == 16'h5f ? 16'h0c06 :  // <0143> j = g6
addr == 16'h60 ? 16'hc800 :  // <0144> nop
addr == 16'h61 ? 16'he401 :  // <0145> bn 1z :no_wrap
addr == 16'h62 ? 16'h0064 :  // <0145> "
addr == 16'h63 ? 16'h0a00 :  // <0146> i = 0
// :no_wrap // = 0x0064

// repeat forever.
addr == 16'h64 ? 16'he00f :  // <0150> jmp :again
addr == 16'h65 ? 16'h004b :  // <0150> "

// :msg // = 0x0066
// "1234567890abcdef\n\x00"
addr == 16'h66 ? 16'h3231 :  // <0153> 21
addr == 16'h67 ? 16'h3433 :  // <0153> 43
addr == 16'h68 ? 16'h3635 :  // <0153> 65
addr == 16'h69 ? 16'h3837 :  // <0153> 87
addr == 16'h6a ? 16'h3039 :  // <0153> 09
addr == 16'h6b ? 16'h6261 :  // <0153> ba
addr == 16'h6c ? 16'h6463 :  // <0153> dc
addr == 16'h6d ? 16'h6665 :  // <0153> fe
addr == 16'h6e ? 16'h000a :  // <0153>   

// routine waits a number of milliseconds given in a.
// func spinwait // = 0x006f
addr == 16'h6f ? 16'h2004 :  // <0156> push x // func spinwait
addr == 16'h70 ? 16'h2005 :  // <0156> push y // "
addr == 16'h71 ? 16'h0760 :  // <0157> b = -1
// :spinwait_outer // = 0x0072
addr == 16'h72 ? 16'h13a0 :  // <0159> x = 12500
addr == 16'h73 ? 16'h30d4 :  // <0159> "
addr == 16'h74 ? 16'h1760 :  // <0160> y = -1
addr == 16'h75 ? 16'hc800 :  // <0161> nop
// :spinwait_inner // = 0x0076
addr == 16'h76 ? 16'h1320 :  // <0163> x = x+y
addr == 16'h77 ? 16'hc800 :  // <0164> nop
addr == 16'h78 ? 16'he400 :  // <0165> bn 2z :spinwait_inner
addr == 16'h79 ? 16'h0076 :  // <0165> "
addr == 16'h7a ? 16'h0300 :  // <0166> a = a+b
addr == 16'h7b ? 16'hc800 :  // <0167> nop
addr == 16'h7c ? 16'he404 :  // <0168> bn z :spinwait_outer
addr == 16'h7d ? 16'h0072 :  // <0168> "
addr == 16'h7e ? 16'h1408 :  // <0169> pop y // return
addr == 16'h7f ? 16'h1008 :  // <0169> pop x // "
addr == 16'h80 ? 16'hfc00 :  // <0169> return

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x0081
addr == 16'h81 ? 16'h2004 :  // <0173> push x // func put4x
addr == 16'h82 ? 16'h2006 :  // <0173> push g6 // "
addr == 16'h83 ? 16'h203e :  // <0173> push rtna // "
addr == 16'h84 ? 16'h13a0 :  // <0174> x = :hexdigits
addr == 16'h85 ? 16'h00be :  // <0174> "

addr == 16'h86 ? 16'h1800 :  // <0176> g6 = a
addr == 16'h87 ? 16'h07a0 :  // <0177> b = 0xF000
addr == 16'h88 ? 16'hf000 :  // <0177> "
addr == 16'h89 ? 16'hc800 :  // <0178> nop
addr == 16'h8a ? 16'h0330 :  // <0179> a = and
addr == 16'h8b ? 16'h0353 :  // <0180> a = a>>4
addr == 16'h8c ? 16'h0353 :  // <0181> a = a>>4
addr == 16'h8d ? 16'h0353 :  // <0182> a = a>>4
addr == 16'h8e ? 16'hfba0 :  // <0183> call fetch_byte
addr == 16'h8f ? 16'h00c6 :  // <0183> "
addr == 16'h90 ? 16'hfc00 :  // <0183> "
addr == 16'h91 ? 16'h0000 :  // <0184> a = a // putchar a
addr == 16'h92 ? 16'hfba0 :  // <0184> putchar a
addr == 16'h93 ? 16'h0105 :  // <0184> "
addr == 16'h94 ? 16'hfc00 :  // <0184> "

addr == 16'h95 ? 16'h0006 :  // <0186> a = g6
addr == 16'h96 ? 16'h07a0 :  // <0187> b = 0x0F00
addr == 16'h97 ? 16'h0f00 :  // <0187> "
addr == 16'h98 ? 16'hc800 :  // <0188> nop
addr == 16'h99 ? 16'h0330 :  // <0189> a = and
addr == 16'h9a ? 16'h0353 :  // <0190> a = a>>4
addr == 16'h9b ? 16'h0353 :  // <0191> a = a>>4
addr == 16'h9c ? 16'hfba0 :  // <0192> call fetch_byte
addr == 16'h9d ? 16'h00c6 :  // <0192> "
addr == 16'h9e ? 16'hfc00 :  // <0192> "
addr == 16'h9f ? 16'h0000 :  // <0193> a = a // putchar a
addr == 16'ha0 ? 16'hfba0 :  // <0193> putchar a
addr == 16'ha1 ? 16'h0105 :  // <0193> "
addr == 16'ha2 ? 16'hfc00 :  // <0193> "

addr == 16'ha3 ? 16'h0006 :  // <0195> a = g6
addr == 16'ha4 ? 16'h06f0 :  // <0196> b = 0x00F0
addr == 16'ha5 ? 16'hc800 :  // <0197> nop
addr == 16'ha6 ? 16'h0330 :  // <0198> a = and
addr == 16'ha7 ? 16'h0353 :  // <0199> a = a>>4
addr == 16'ha8 ? 16'hfba0 :  // <0200> call fetch_byte
addr == 16'ha9 ? 16'h00c6 :  // <0200> "
addr == 16'haa ? 16'hfc00 :  // <0200> "
addr == 16'hab ? 16'h0000 :  // <0201> a = a // putchar a
addr == 16'hac ? 16'hfba0 :  // <0201> putchar a
addr == 16'had ? 16'h0105 :  // <0201> "
addr == 16'hae ? 16'hfc00 :  // <0201> "

addr == 16'haf ? 16'h0006 :  // <0203> a = g6
addr == 16'hb0 ? 16'h060f :  // <0204> b = 0x000F
addr == 16'hb1 ? 16'hc800 :  // <0205> nop
addr == 16'hb2 ? 16'h0330 :  // <0206> a = and
addr == 16'hb3 ? 16'hfba0 :  // <0207> call fetch_byte
addr == 16'hb4 ? 16'h00c6 :  // <0207> "
addr == 16'hb5 ? 16'hfc00 :  // <0207> "
addr == 16'hb6 ? 16'h0000 :  // <0208> a = a // putchar a
addr == 16'hb7 ? 16'hfba0 :  // <0208> putchar a
addr == 16'hb8 ? 16'h0105 :  // <0208> "
addr == 16'hb9 ? 16'hfc00 :  // <0208> "

addr == 16'hba ? 16'hf808 :  // <0210> pop rtna // return
addr == 16'hbb ? 16'h1808 :  // <0210> pop g6 // "
addr == 16'hbc ? 16'h1008 :  // <0210> pop x // "
addr == 16'hbd ? 16'hfc00 :  // <0210> return

// :hexdigits // = 0x00be
// "0123456789abcdef"
addr == 16'hbe ? 16'h3130 :  // <0213> 10
addr == 16'hbf ? 16'h3332 :  // <0213> 32
addr == 16'hc0 ? 16'h3534 :  // <0213> 54
addr == 16'hc1 ? 16'h3736 :  // <0213> 76
addr == 16'hc2 ? 16'h3938 :  // <0213> 98
addr == 16'hc3 ? 16'h6261 :  // <0213> ba
addr == 16'hc4 ? 16'h6463 :  // <0213> dc
addr == 16'hc5 ? 16'h6665 :  // <0213> fe

// pick a byte from an array of words.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// func fetch_byte // = 0x00c6
addr == 16'hc6 ? 16'h0601 :  // <0218> b = 1
addr == 16'hc7 ? 16'hc800 :  // <0219> nop
addr == 16'hc8 ? 16'he002 :  // <0220> br and0z :pick_byte_even
addr == 16'hc9 ? 16'h00d2 :  // <0220> "
addr == 16'hca ? 16'h0350 :  // <0221> a = a>>1
addr == 16'hcb ? 16'h0404 :  // <0222> b = x
addr == 16'hcc ? 16'hc800 :  // <0223> nop
addr == 16'hcd ? 16'hd300 :  // <0224> fetch a from a+b
addr == 16'hce ? 16'h03b0 :  // <0224> "
addr == 16'hcf ? 16'h0353 :  // <0225> a = a>>4
addr == 16'hd0 ? 16'h0353 :  // <0226> a = a>>4
addr == 16'hd1 ? 16'hfc00 :  // <0227> return
// :pick_byte_even // = 0x00d2
addr == 16'hd2 ? 16'h0350 :  // <0229> a = a>>1
addr == 16'hd3 ? 16'h0404 :  // <0230> b = x
addr == 16'hd4 ? 16'hc800 :  // <0231> nop
addr == 16'hd5 ? 16'hd300 :  // <0232> fetch a from a+b
addr == 16'hd6 ? 16'h03b0 :  // <0232> "
addr == 16'hd7 ? 16'hfc00 :  // <0233> return

// compute the modulus(255) of a number given in a.  return remainder in a.
// func mod255 // = 0x00d8
addr == 16'hd8 ? 16'h2006 :  // <0236> push g6 // func mod255
addr == 16'hd9 ? 16'h2007 :  // <0236> push g7 // "
// while a is greater than 254, subtract 255.
// :mod255_again // = 0x00da
addr == 16'hda ? 16'h06fe :  // <0239> b = 0xfe
addr == 16'hdb ? 16'hc800 :  // <0240> nop
addr == 16'hdc ? 16'he006 :  // <0241> br gt :mod255_greater
addr == 16'hdd ? 16'h00e1 :  // <0241> "
addr == 16'hde ? 16'h1c08 :  // <0242> pop g7 // return
addr == 16'hdf ? 16'h1808 :  // <0242> pop g6 // "
addr == 16'he0 ? 16'hfc00 :  // <0242> return
// :mod255_greater // = 0x00e1
addr == 16'he1 ? 16'h07a0 :  // <0244> b = 0xff01
addr == 16'he2 ? 16'hff01 :  // <0244> "
addr == 16'he3 ? 16'hc800 :  // <0245> nop
addr == 16'he4 ? 16'h0300 :  // <0246> a = a+b
addr == 16'he5 ? 16'he00f :  // <0247> jmp :mod255_again
addr == 16'he6 ? 16'h00da :  // <0247> "

// set up Fletcher16 checksum algorithm to accumulate in the 2 given register names.

addr == 16'he7 ? 16'h1a00 :  // <0257> fletcher16_init g6 g7
addr == 16'he8 ? 16'h1e00 :  // <0257> "

// accumulate a Fletcher16 checksum in g6 and g7,
// given the next byte of data in a.
// func fletcher16_input // = 0x00e9
addr == 16'he9 ? 16'h2006 :  // <0261> push g6 // func fletcher16_input
addr == 16'hea ? 16'h2007 :  // <0261> push g7 // "
addr == 16'heb ? 16'h203e :  // <0261> push rtna // "
//patch: need a way to declare summing registers as "static" or "preserve" so they're not auto-stacked.
addr == 16'hec ? 16'h0406 :  // <0263> b = $fletcher_sum1_reg
addr == 16'hed ? 16'hc800 :  // <0264> nop
addr == 16'hee ? 16'h0300 :  // <0265> a = a+b
addr == 16'hef ? 16'hfba0 :  // <0266> call :mod255
addr == 16'hf0 ? 16'h00d8 :  // <0266> "
addr == 16'hf1 ? 16'hfc00 :  // <0266> "
addr == 16'hf2 ? 16'h1800 :  // <0267> $fletcher_sum1_reg = a

addr == 16'hf3 ? 16'h0407 :  // <0269> b = $fletcher_sum2_reg
addr == 16'hf4 ? 16'hc800 :  // <0270> nop
addr == 16'hf5 ? 16'h0300 :  // <0271> a = a+b
addr == 16'hf6 ? 16'hfba0 :  // <0272> call :mod255
addr == 16'hf7 ? 16'h00d8 :  // <0272> "
addr == 16'hf8 ? 16'hfc00 :  // <0272> "
addr == 16'hf9 ? 16'h1c00 :  // <0273> $fletcher_sum2_reg = a
addr == 16'hfa ? 16'hf808 :  // <0274> pop rtna // return
addr == 16'hfb ? 16'h1c08 :  // <0274> pop g7 // "
addr == 16'hfc ? 16'h1808 :  // <0274> pop g6 // "
addr == 16'hfd ? 16'hfc00 :  // <0274> return

// return the combined 16-bit result of Fletcher16 checksum in a.
// func fletcher16_result // = 0x00fe
addr == 16'hfe ? 16'h0007 :  // <0278> a = $fletcher_sum2_reg
addr == 16'hff ? 16'h0352 :  // <0279> a = a<<4
addr == 16'h100 ? 16'h0352 :  // <0280> a = a<<4
addr == 16'h101 ? 16'h0406 :  // <0281> b = $fletcher_sum1_reg
addr == 16'h102 ? 16'hc800 :  // <0282> nop
addr == 16'h103 ? 16'h0334 :  // <0283> a = or
addr == 16'h104 ? 16'hfc00 :  // <0284> return

// routine sends out the low byte from a to the UART.  blocks until the UART accepts the byte.
// func putchar_atx // = 0x0105
addr == 16'h105 ? 16'h2004 :  // <0287> push x // func putchar_atx

addr == 16'h106 ? 16'h1000 :  // <0289> x = a

// wait for UART to be idle (not busy).
addr == 16'h107 ? 16'h0202 :  // <0292> a = $atx_busy_mask
// :pcatx_wait_for_idle // = 0x0108
addr == 16'h108 ? 16'h040b :  // <0294> b = atx_ctrl
addr == 16'h109 ? 16'hc800 :  // <0295> nop
addr == 16'h10a ? 16'he402 :  // <0296> bn and0z :pcatx_wait_for_idle
addr == 16'h10b ? 16'h0108 :  // <0296> "

// push word to the UART.  its low byte is a character.
addr == 16'h10c ? 16'h2804 :  // <0299> atx_data = x

// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_ctrl.
addr == 16'h10d ? 16'h2e01 :  // <0304> atx_ctrl = $atx_load_mask

// wait until UART is busy, as acknowledgement.
addr == 16'h10e ? 16'h0202 :  // <0307> a = $atx_busy_mask
// :pcatx_wait_for_busy // = 0x010f
addr == 16'h10f ? 16'h040b :  // <0309> b = atx_ctrl
addr == 16'h110 ? 16'he002 :  // <0310> br and0z :pcatx_wait_for_busy
addr == 16'h111 ? 16'h010f :  // <0310> "

addr == 16'h112 ? 16'h2e00 :  // <0312> atx_ctrl = 0
addr == 16'h113 ? 16'h1008 :  // <0313> pop x // return
addr == 16'h114 ? 16'hfc00 :  // <0313> return

        
                16'hxxxx;
        endmodule
    
