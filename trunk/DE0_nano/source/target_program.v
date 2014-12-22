
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
addr == 16'h00 ? 16'h2601 :  // <0041> leds = 1
addr == 16'h01 ? 16'h2e00 :  // <0042> atx_ctrl = 0

addr == 16'h02 ? 16'h0241 :  // <0044> a = 65
addr == 16'h03 ? 16'h2000 :  // <0045> push a // push a
addr == 16'h04 ? 16'h0242 :  // <0046> a = 66
addr == 16'h05 ? 16'h2000 :  // <0047> push a // push a
addr == 16'h06 ? 16'h0243 :  // <0048> a = 67
addr == 16'h07 ? 16'h2000 :  // <0049> push a // push a
addr == 16'h08 ? 16'h0244 :  // <0050> a = 68
addr == 16'h09 ? 16'h2000 :  // <0051> push a // push a
addr == 16'h0a ? 16'h0245 :  // <0052> a = 69
addr == 16'h0b ? 16'h2000 :  // <0053> push a // push a

addr == 16'h0c ? 16'h0408 :  // <0055> pop b // pop b
addr == 16'h0d ? 16'h0001 :  // <0056> a = b // putchar b
addr == 16'h0e ? 16'hfba0 :  // <0056> putchar b
addr == 16'h0f ? 16'h012c :  // <0056> "
addr == 16'h10 ? 16'hfc00 :  // <0056> "
addr == 16'h11 ? 16'h0408 :  // <0057> pop b // pop b
addr == 16'h12 ? 16'h0001 :  // <0058> a = b // putchar b
addr == 16'h13 ? 16'hfba0 :  // <0058> putchar b
addr == 16'h14 ? 16'h012c :  // <0058> "
addr == 16'h15 ? 16'hfc00 :  // <0058> "
addr == 16'h16 ? 16'h0408 :  // <0059> pop b // pop b
addr == 16'h17 ? 16'h0001 :  // <0060> a = b // putchar b
addr == 16'h18 ? 16'hfba0 :  // <0060> putchar b
addr == 16'h19 ? 16'h012c :  // <0060> "
addr == 16'h1a ? 16'hfc00 :  // <0060> "
addr == 16'h1b ? 16'h0408 :  // <0061> pop b // pop b
addr == 16'h1c ? 16'h0001 :  // <0062> a = b // putchar b
addr == 16'h1d ? 16'hfba0 :  // <0062> putchar b
addr == 16'h1e ? 16'h012c :  // <0062> "
addr == 16'h1f ? 16'hfc00 :  // <0062> "
addr == 16'h20 ? 16'h0408 :  // <0063> pop b // pop b
addr == 16'h21 ? 16'h0001 :  // <0064> a = b // putchar b
addr == 16'h22 ? 16'hfba0 :  // <0064> putchar b
addr == 16'h23 ? 16'h012c :  // <0064> "
addr == 16'h24 ? 16'hfc00 :  // <0064> "

addr == 16'h25 ? 16'h03a0 :  // <0066> a = 0x1234
addr == 16'h26 ? 16'h1234 :  // <0066> "
addr == 16'h27 ? 16'hfba0 :  // <0067> call put4x
addr == 16'h28 ? 16'h00a8 :  // <0067> "
addr == 16'h29 ? 16'hfc00 :  // <0067> "

addr == 16'h2a ? 16'h13a0 :  // <0069> x = 0x1234
addr == 16'h2b ? 16'h1234 :  // <0069> "
addr == 16'h2c ? 16'h1601 :  // <0070> y = 1
addr == 16'h2d ? 16'h0200 :  // <0071> a = 0
// :nextwrite // = 0x002e
addr == 16'h2e ? 16'h3800 :  // <0073> m9k_addr = a
addr == 16'h2f ? 16'h3c04 :  // <0074> m9k_data = x
addr == 16'h30 ? 16'h1320 :  // <0075> x = x+y
addr == 16'h31 ? 16'h0601 :  // <0076> b = 1
addr == 16'h32 ? 16'hc800 :  // <0077> nop
addr == 16'h33 ? 16'h0300 :  // <0078> a = a+b
addr == 16'h34 ? 16'h07a0 :  // <0079> b = 1024
addr == 16'h35 ? 16'h0400 :  // <0079> "
addr == 16'h36 ? 16'hc800 :  // <0080> nop
addr == 16'h37 ? 16'he005 :  // <0081> br lt :nextwrite
addr == 16'h38 ? 16'h002e :  // <0081> "

//patch
addr == 16'h39 ? 16'h1200 :  // <0084> x = 0
addr == 16'h3a ? 16'h1601 :  // <0085> y = 1
// :patch // = 0x003b

addr == 16'h3b ? 16'h0009 :  // <0088> a = leds
addr == 16'h3c ? 16'h0601 :  // <0089> b = 1
addr == 16'h3d ? 16'hc800 :  // <0090> nop
addr == 16'h3e ? 16'h2700 :  // <0091> leds = a+b

// :wait_key_press // = 0x003f
addr == 16'h3f ? 16'h0203 :  // <0094> a = 0x03
addr == 16'h40 ? 16'h0410 :  // <0095> b = keys
addr == 16'h41 ? 16'hc800 :  // <0096> nop
addr == 16'h42 ? 16'he007 :  // <0097> br eq :wait_key_press
addr == 16'h43 ? 16'h003f :  // <0097> "
// :wait_key_release // = 0x0044
addr == 16'h44 ? 16'h0410 :  // <0099> b = keys
addr == 16'h45 ? 16'hc800 :  // <0100> nop
addr == 16'h46 ? 16'he407 :  // <0101> bn eq :wait_key_release
addr == 16'h47 ? 16'h0044 :  // <0101> "

addr == 16'h48 ? 16'h0655 :  // <0103> b = 85
addr == 16'h49 ? 16'h0001 :  // <0104> a = b // putchar b
addr == 16'h4a ? 16'hfba0 :  // <0104> putchar b
addr == 16'h4b ? 16'h012c :  // <0104> "
addr == 16'h4c ? 16'hfc00 :  // <0104> "

addr == 16'h4d ? 16'h1320 :  // <0106> x = x+y
addr == 16'h4e ? 16'hc800 :  // <0107> nop
addr == 16'h4f ? 16'h0004 :  // <0108> a = x
addr == 16'h50 ? 16'hfba0 :  // <0109> call put4x
addr == 16'h51 ? 16'h00a8 :  // <0109> "
addr == 16'h52 ? 16'hfc00 :  // <0109> "

addr == 16'h53 ? 16'h0264 :  // <0111> a = 100
addr == 16'h54 ? 16'hfba0 :  // <0112> call :spinwait
addr == 16'h55 ? 16'h0096 :  // <0112> "
addr == 16'h56 ? 16'hfc00 :  // <0112> "

addr == 16'h57 ? 16'h0620 :  // <0114> b = 32
addr == 16'h58 ? 16'h0001 :  // <0115> a = b // putchar b
addr == 16'h59 ? 16'hfba0 :  // <0115> putchar b
addr == 16'h5a ? 16'h012c :  // <0115> "
addr == 16'h5b ? 16'hfc00 :  // <0115> "
addr == 16'h5c ? 16'h3804 :  // <0116> m9k_addr = x
addr == 16'h5d ? 16'h000f :  // <0117> a = m9k_data
addr == 16'h5e ? 16'hfba0 :  // <0118> call put4x
addr == 16'h5f ? 16'h00a8 :  // <0118> "
addr == 16'h60 ? 16'hfc00 :  // <0118> "
addr == 16'h61 ? 16'h060d :  // <0119> b = 13
addr == 16'h62 ? 16'h0001 :  // <0120> a = b // putchar b
addr == 16'h63 ? 16'hfba0 :  // <0120> putchar b
addr == 16'h64 ? 16'h012c :  // <0120> "
addr == 16'h65 ? 16'hfc00 :  // <0120> "
addr == 16'h66 ? 16'h060a :  // <0121> b = 10
addr == 16'h67 ? 16'h0001 :  // <0122> a = b // putchar b
addr == 16'h68 ? 16'hfba0 :  // <0122> putchar b
addr == 16'h69 ? 16'h012c :  // <0122> "
addr == 16'h6a ? 16'hfc00 :  // <0122> "

addr == 16'h6b ? 16'he00f :  // <0124> jmp :patch
addr == 16'h6c ? 16'h003b :  // <0124> "





// using i as index into string.
addr == 16'h6d ? 16'h0a00 :  // <0131> i = 0

// cache the string limit in g6.
addr == 16'h6e ? 16'h0210 :  // <0134> a = 16
addr == 16'h6f ? 16'h0760 :  // <0135> b = 0xffff
addr == 16'h70 ? 16'hc800 :  // <0136> nop
addr == 16'h71 ? 16'h1b38 :  // <0137> g6 = xor

// :again // = 0x0072
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

addr == 16'h72 ? 16'h0264 :  // <0151> a = 100
addr == 16'h73 ? 16'hfba0 :  // <0152> call :spinwait
addr == 16'h74 ? 16'h0096 :  // <0152> "
addr == 16'h75 ? 16'hfc00 :  // <0152> "

// increment LEDs
addr == 16'h76 ? 16'h0009 :  // <0155> a = leds
addr == 16'h77 ? 16'h0601 :  // <0156> b = 1
addr == 16'h78 ? 16'hc800 :  // <0157> nop
addr == 16'h79 ? 16'h2700 :  // <0158> leds = a+b

// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 16'h7a ? 16'h0fa0 :  // <0161> j = :msg
addr == 16'h7b ? 16'h008d :  // <0161> "
addr == 16'h7c ? 16'hc800 :  // <0162> nop
addr == 16'h7d ? 16'hd310 :  // <0163> fetch a from i+j
addr == 16'h7e ? 16'h03b0 :  // <0163> "
addr == 16'h7f ? 16'h0000 :  // <0164> a = a // putchar a
addr == 16'h80 ? 16'hfba0 :  // <0164> putchar a
addr == 16'h81 ? 16'h012c :  // <0164> "
addr == 16'h82 ? 16'hfc00 :  // <0164> "

// increment index & wrap around end of pattern.
addr == 16'h83 ? 16'h0e01 :  // <0167> j = 1
addr == 16'h84 ? 16'hc800 :  // <0168> nop
addr == 16'h85 ? 16'h0b10 :  // <0169> i = i+j
addr == 16'h86 ? 16'h0c06 :  // <0170> j = g6
addr == 16'h87 ? 16'hc800 :  // <0171> nop
addr == 16'h88 ? 16'he401 :  // <0172> bn 1z :no_wrap
addr == 16'h89 ? 16'h008b :  // <0172> "
addr == 16'h8a ? 16'h0a00 :  // <0173> i = 0
// :no_wrap // = 0x008b

// repeat forever.
addr == 16'h8b ? 16'he00f :  // <0177> jmp :again
addr == 16'h8c ? 16'h0072 :  // <0177> "

// :msg // = 0x008d
// "1234567890abcdef\n\x00"
addr == 16'h8d ? 16'h3231 :  // <0180> 21
addr == 16'h8e ? 16'h3433 :  // <0180> 43
addr == 16'h8f ? 16'h3635 :  // <0180> 65
addr == 16'h90 ? 16'h3837 :  // <0180> 87
addr == 16'h91 ? 16'h3039 :  // <0180> 09
addr == 16'h92 ? 16'h6261 :  // <0180> ba
addr == 16'h93 ? 16'h6463 :  // <0180> dc
addr == 16'h94 ? 16'h6665 :  // <0180> fe
addr == 16'h95 ? 16'h000a :  // <0180>   

// routine waits a number of milliseconds given in a.
// func spinwait // = 0x0096
addr == 16'h96 ? 16'h2004 :  // <0183> push x // func spinwait
addr == 16'h97 ? 16'h2005 :  // <0183> push y // "
addr == 16'h98 ? 16'h0760 :  // <0184> b = -1
// :spinwait_outer // = 0x0099
addr == 16'h99 ? 16'h13a0 :  // <0186> x = 12500
addr == 16'h9a ? 16'h30d4 :  // <0186> "
addr == 16'h9b ? 16'h1760 :  // <0187> y = -1
addr == 16'h9c ? 16'hc800 :  // <0188> nop
// :spinwait_inner // = 0x009d
addr == 16'h9d ? 16'h1320 :  // <0190> x = x+y
addr == 16'h9e ? 16'hc800 :  // <0191> nop
addr == 16'h9f ? 16'he400 :  // <0192> bn 2z :spinwait_inner
addr == 16'ha0 ? 16'h009d :  // <0192> "
addr == 16'ha1 ? 16'h0300 :  // <0193> a = a+b
addr == 16'ha2 ? 16'hc800 :  // <0194> nop
addr == 16'ha3 ? 16'he404 :  // <0195> bn z :spinwait_outer
addr == 16'ha4 ? 16'h0099 :  // <0195> "
addr == 16'ha5 ? 16'h1408 :  // <0196> pop y // return
addr == 16'ha6 ? 16'h1008 :  // <0196> pop x // "
addr == 16'ha7 ? 16'hfc00 :  // <0196> return

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x00a8
addr == 16'ha8 ? 16'h2004 :  // <0200> push x // func put4x
addr == 16'ha9 ? 16'h2006 :  // <0200> push g6 // "
addr == 16'haa ? 16'h203e :  // <0200> push rtna // "
addr == 16'hab ? 16'h13a0 :  // <0201> x = :hexdigits
addr == 16'hac ? 16'h00e5 :  // <0201> "

addr == 16'had ? 16'h1800 :  // <0203> g6 = a
addr == 16'hae ? 16'h07a0 :  // <0204> b = 0xF000
addr == 16'haf ? 16'hf000 :  // <0204> "
addr == 16'hb0 ? 16'hc800 :  // <0205> nop
addr == 16'hb1 ? 16'h0330 :  // <0206> a = and
addr == 16'hb2 ? 16'h0353 :  // <0207> a = a>>4
addr == 16'hb3 ? 16'h0353 :  // <0208> a = a>>4
addr == 16'hb4 ? 16'h0353 :  // <0209> a = a>>4
addr == 16'hb5 ? 16'hfba0 :  // <0210> call fetch_byte
addr == 16'hb6 ? 16'h00ed :  // <0210> "
addr == 16'hb7 ? 16'hfc00 :  // <0210> "
addr == 16'hb8 ? 16'h0000 :  // <0211> a = a // putchar a
addr == 16'hb9 ? 16'hfba0 :  // <0211> putchar a
addr == 16'hba ? 16'h012c :  // <0211> "
addr == 16'hbb ? 16'hfc00 :  // <0211> "

addr == 16'hbc ? 16'h0006 :  // <0213> a = g6
addr == 16'hbd ? 16'h07a0 :  // <0214> b = 0x0F00
addr == 16'hbe ? 16'h0f00 :  // <0214> "
addr == 16'hbf ? 16'hc800 :  // <0215> nop
addr == 16'hc0 ? 16'h0330 :  // <0216> a = and
addr == 16'hc1 ? 16'h0353 :  // <0217> a = a>>4
addr == 16'hc2 ? 16'h0353 :  // <0218> a = a>>4
addr == 16'hc3 ? 16'hfba0 :  // <0219> call fetch_byte
addr == 16'hc4 ? 16'h00ed :  // <0219> "
addr == 16'hc5 ? 16'hfc00 :  // <0219> "
addr == 16'hc6 ? 16'h0000 :  // <0220> a = a // putchar a
addr == 16'hc7 ? 16'hfba0 :  // <0220> putchar a
addr == 16'hc8 ? 16'h012c :  // <0220> "
addr == 16'hc9 ? 16'hfc00 :  // <0220> "

addr == 16'hca ? 16'h0006 :  // <0222> a = g6
addr == 16'hcb ? 16'h06f0 :  // <0223> b = 0x00F0
addr == 16'hcc ? 16'hc800 :  // <0224> nop
addr == 16'hcd ? 16'h0330 :  // <0225> a = and
addr == 16'hce ? 16'h0353 :  // <0226> a = a>>4
addr == 16'hcf ? 16'hfba0 :  // <0227> call fetch_byte
addr == 16'hd0 ? 16'h00ed :  // <0227> "
addr == 16'hd1 ? 16'hfc00 :  // <0227> "
addr == 16'hd2 ? 16'h0000 :  // <0228> a = a // putchar a
addr == 16'hd3 ? 16'hfba0 :  // <0228> putchar a
addr == 16'hd4 ? 16'h012c :  // <0228> "
addr == 16'hd5 ? 16'hfc00 :  // <0228> "

addr == 16'hd6 ? 16'h0006 :  // <0230> a = g6
addr == 16'hd7 ? 16'h060f :  // <0231> b = 0x000F
addr == 16'hd8 ? 16'hc800 :  // <0232> nop
addr == 16'hd9 ? 16'h0330 :  // <0233> a = and
addr == 16'hda ? 16'hfba0 :  // <0234> call fetch_byte
addr == 16'hdb ? 16'h00ed :  // <0234> "
addr == 16'hdc ? 16'hfc00 :  // <0234> "
addr == 16'hdd ? 16'h0000 :  // <0235> a = a // putchar a
addr == 16'hde ? 16'hfba0 :  // <0235> putchar a
addr == 16'hdf ? 16'h012c :  // <0235> "
addr == 16'he0 ? 16'hfc00 :  // <0235> "

addr == 16'he1 ? 16'hf808 :  // <0237> pop rtna // return
addr == 16'he2 ? 16'h1808 :  // <0237> pop g6 // "
addr == 16'he3 ? 16'h1008 :  // <0237> pop x // "
addr == 16'he4 ? 16'hfc00 :  // <0237> return

// :hexdigits // = 0x00e5
// "0123456789abcdef"
addr == 16'he5 ? 16'h3130 :  // <0240> 10
addr == 16'he6 ? 16'h3332 :  // <0240> 32
addr == 16'he7 ? 16'h3534 :  // <0240> 54
addr == 16'he8 ? 16'h3736 :  // <0240> 76
addr == 16'he9 ? 16'h3938 :  // <0240> 98
addr == 16'hea ? 16'h6261 :  // <0240> ba
addr == 16'heb ? 16'h6463 :  // <0240> dc
addr == 16'hec ? 16'h6665 :  // <0240> fe

// pick a byte from an array of words.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// func fetch_byte // = 0x00ed
addr == 16'hed ? 16'h0601 :  // <0245> b = 1
addr == 16'hee ? 16'hc800 :  // <0246> nop
addr == 16'hef ? 16'he002 :  // <0247> br and0z :pick_byte_even
addr == 16'hf0 ? 16'h00f9 :  // <0247> "
addr == 16'hf1 ? 16'h0350 :  // <0248> a = a>>1
addr == 16'hf2 ? 16'h0404 :  // <0249> b = x
addr == 16'hf3 ? 16'hc800 :  // <0250> nop
addr == 16'hf4 ? 16'hd300 :  // <0251> fetch a from a+b
addr == 16'hf5 ? 16'h03b0 :  // <0251> "
addr == 16'hf6 ? 16'h0353 :  // <0252> a = a>>4
addr == 16'hf7 ? 16'h0353 :  // <0253> a = a>>4
addr == 16'hf8 ? 16'hfc00 :  // <0254> return
// :pick_byte_even // = 0x00f9
addr == 16'hf9 ? 16'h0350 :  // <0256> a = a>>1
addr == 16'hfa ? 16'h0404 :  // <0257> b = x
addr == 16'hfb ? 16'hc800 :  // <0258> nop
addr == 16'hfc ? 16'hd300 :  // <0259> fetch a from a+b
addr == 16'hfd ? 16'h03b0 :  // <0259> "
addr == 16'hfe ? 16'hfc00 :  // <0260> return

// compute the modulus(255) of a number given in a.  return remainder in a.
// func mod255 // = 0x00ff
addr == 16'hff ? 16'h2006 :  // <0263> push g6 // func mod255
addr == 16'h100 ? 16'h2007 :  // <0263> push g7 // "
// while a is greater than 254, subtract 255.
// :mod255_again // = 0x0101
addr == 16'h101 ? 16'h06fe :  // <0266> b = 0xfe
addr == 16'h102 ? 16'hc800 :  // <0267> nop
addr == 16'h103 ? 16'he006 :  // <0268> br gt :mod255_greater
addr == 16'h104 ? 16'h0108 :  // <0268> "
addr == 16'h105 ? 16'h1c08 :  // <0269> pop g7 // return
addr == 16'h106 ? 16'h1808 :  // <0269> pop g6 // "
addr == 16'h107 ? 16'hfc00 :  // <0269> return
// :mod255_greater // = 0x0108
addr == 16'h108 ? 16'h07a0 :  // <0271> b = 0xff01
addr == 16'h109 ? 16'hff01 :  // <0271> "
addr == 16'h10a ? 16'hc800 :  // <0272> nop
addr == 16'h10b ? 16'h0300 :  // <0273> a = a+b
addr == 16'h10c ? 16'he00f :  // <0274> jmp :mod255_again
addr == 16'h10d ? 16'h0101 :  // <0274> "

// set up Fletcher16 checksum algorithm to accumulate in the 2 given register names.

addr == 16'h10e ? 16'h1a00 :  // <0284> fletcher16_init g6 g7
addr == 16'h10f ? 16'h1e00 :  // <0284> "

// accumulate a Fletcher16 checksum in g6 and g7,
// given the next byte of data in a.
// func fletcher16_input // = 0x0110
addr == 16'h110 ? 16'h2006 :  // <0288> push g6 // func fletcher16_input
addr == 16'h111 ? 16'h2007 :  // <0288> push g7 // "
addr == 16'h112 ? 16'h203e :  // <0288> push rtna // "
//patch: need a way to declare summing registers as "static" or "preserve" so they're not auto-stacked.
addr == 16'h113 ? 16'h0406 :  // <0290> b = $fletcher_sum1_reg
addr == 16'h114 ? 16'hc800 :  // <0291> nop
addr == 16'h115 ? 16'h0300 :  // <0292> a = a+b
addr == 16'h116 ? 16'hfba0 :  // <0293> call :mod255
addr == 16'h117 ? 16'h00ff :  // <0293> "
addr == 16'h118 ? 16'hfc00 :  // <0293> "
addr == 16'h119 ? 16'h1800 :  // <0294> $fletcher_sum1_reg = a

addr == 16'h11a ? 16'h0407 :  // <0296> b = $fletcher_sum2_reg
addr == 16'h11b ? 16'hc800 :  // <0297> nop
addr == 16'h11c ? 16'h0300 :  // <0298> a = a+b
addr == 16'h11d ? 16'hfba0 :  // <0299> call :mod255
addr == 16'h11e ? 16'h00ff :  // <0299> "
addr == 16'h11f ? 16'hfc00 :  // <0299> "
addr == 16'h120 ? 16'h1c00 :  // <0300> $fletcher_sum2_reg = a
addr == 16'h121 ? 16'hf808 :  // <0301> pop rtna // return
addr == 16'h122 ? 16'h1c08 :  // <0301> pop g7 // "
addr == 16'h123 ? 16'h1808 :  // <0301> pop g6 // "
addr == 16'h124 ? 16'hfc00 :  // <0301> return

// return the combined 16-bit result of Fletcher16 checksum in a.
// func fletcher16_result // = 0x0125
addr == 16'h125 ? 16'h0007 :  // <0305> a = $fletcher_sum2_reg
addr == 16'h126 ? 16'h0352 :  // <0306> a = a<<4
addr == 16'h127 ? 16'h0352 :  // <0307> a = a<<4
addr == 16'h128 ? 16'h0406 :  // <0308> b = $fletcher_sum1_reg
addr == 16'h129 ? 16'hc800 :  // <0309> nop
addr == 16'h12a ? 16'h0334 :  // <0310> a = or
addr == 16'h12b ? 16'hfc00 :  // <0311> return

// routine sends out the low byte from a to the UART.  blocks until the UART accepts the byte.
// func putchar_atx // = 0x012c
addr == 16'h12c ? 16'h2004 :  // <0314> push x // func putchar_atx

addr == 16'h12d ? 16'h1000 :  // <0316> x = a

// wait for UART to be idle (not busy).
addr == 16'h12e ? 16'h0202 :  // <0319> a = $atx_busy_mask
// :pcatx_wait_for_idle // = 0x012f
addr == 16'h12f ? 16'h040b :  // <0321> b = atx_ctrl
addr == 16'h130 ? 16'hc800 :  // <0322> nop
addr == 16'h131 ? 16'he402 :  // <0323> bn and0z :pcatx_wait_for_idle
addr == 16'h132 ? 16'h012f :  // <0323> "

// push word to the UART.  its low byte is a character.
addr == 16'h133 ? 16'h2804 :  // <0326> atx_data = x

// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_ctrl.
addr == 16'h134 ? 16'h2e01 :  // <0331> atx_ctrl = $atx_load_mask

// wait until UART is busy, as acknowledgement.
addr == 16'h135 ? 16'h0202 :  // <0334> a = $atx_busy_mask
// :pcatx_wait_for_busy // = 0x0136
addr == 16'h136 ? 16'h040b :  // <0336> b = atx_ctrl
addr == 16'h137 ? 16'he002 :  // <0337> br and0z :pcatx_wait_for_busy
addr == 16'h138 ? 16'h0136 :  // <0337> "

addr == 16'h139 ? 16'h2e00 :  // <0339> atx_ctrl = 0
addr == 16'h13a ? 16'h1008 :  // <0340> pop x // return
addr == 16'h13b ? 16'hfc00 :  // <0340> return

        
                16'hxxxx;
        endmodule
    
