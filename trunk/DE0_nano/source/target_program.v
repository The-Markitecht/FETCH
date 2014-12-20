
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


//patch
// :patch // = 0x0002
addr == 16'h02 ? 16'h0009 :  // <0044> a = leds
addr == 16'h03 ? 16'h0601 :  // <0045> b = 1
addr == 16'h04 ? 16'hc800 :  // <0046> nop
addr == 16'h05 ? 16'h2700 :  // <0047> leds = a+b

//    b = 65
//    putchar b

addr == 16'h06 ? 16'he00f :  // <0052> jmp :patch
addr == 16'h07 ? 16'h0002 :  // <0052> "





// using i as index into string.
addr == 16'h08 ? 16'h0a00 :  // <0059> i = 0

// cache the string limit in g6.
addr == 16'h09 ? 16'h0210 :  // <0062> a = 16
addr == 16'h0a ? 16'h0760 :  // <0063> b = 0xffff
addr == 16'h0b ? 16'hc800 :  // <0064> nop
addr == 16'h0c ? 16'h1b38 :  // <0065> g6 = xor

// :again // = 0x000d
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

addr == 16'h0d ? 16'h0264 :  // <0079> a = 100
addr == 16'h0e ? 16'hfba0 :  // <0080> call :spinwait
addr == 16'h0f ? 16'h0031 :  // <0080> "
addr == 16'h10 ? 16'hfc00 :  // <0080> "

// increment LEDs
addr == 16'h11 ? 16'h0009 :  // <0083> a = leds
addr == 16'h12 ? 16'h0601 :  // <0084> b = 1
addr == 16'h13 ? 16'hc800 :  // <0085> nop
addr == 16'h14 ? 16'h2700 :  // <0086> leds = a+b

// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 16'h15 ? 16'h0fa0 :  // <0089> j = :msg
addr == 16'h16 ? 16'h0028 :  // <0089> "
addr == 16'h17 ? 16'hc800 :  // <0090> nop
addr == 16'h18 ? 16'hd310 :  // <0091> fetch a from i+j
addr == 16'h19 ? 16'h03b0 :  // <0091> "
addr == 16'h1a ? 16'h1000 :  // <0092> putchar a
addr == 16'h1b ? 16'hfba0 :  // <0092> "
addr == 16'h1c ? 16'h00c7 :  // <0092> "
addr == 16'h1d ? 16'hfc00 :  // <0092> "

// increment index & wrap around end of pattern.
addr == 16'h1e ? 16'h0e01 :  // <0095> j = 1
addr == 16'h1f ? 16'hc800 :  // <0096> nop
addr == 16'h20 ? 16'h0b10 :  // <0097> i = i+j
addr == 16'h21 ? 16'h0c06 :  // <0098> j = g6
addr == 16'h22 ? 16'hc800 :  // <0099> nop
addr == 16'h23 ? 16'he401 :  // <0100> bn 1z :no_wrap
addr == 16'h24 ? 16'h0026 :  // <0100> "
addr == 16'h25 ? 16'h0a00 :  // <0101> i = 0
// :no_wrap // = 0x0026

// repeat forever.
addr == 16'h26 ? 16'he00f :  // <0105> jmp :again
addr == 16'h27 ? 16'h000d :  // <0105> "

// :msg // = 0x0028
// "1234567890abcdef\n\x00"
addr == 16'h28 ? 16'h3231 :  // <0108> 21
addr == 16'h29 ? 16'h3433 :  // <0108> 43
addr == 16'h2a ? 16'h3635 :  // <0108> 65
addr == 16'h2b ? 16'h3837 :  // <0108> 87
addr == 16'h2c ? 16'h3039 :  // <0108> 09
addr == 16'h2d ? 16'h6261 :  // <0108> ba
addr == 16'h2e ? 16'h6463 :  // <0108> dc
addr == 16'h2f ? 16'h6665 :  // <0108> fe
addr == 16'h30 ? 16'h000a :  // <0108>   

// routine waits a number of milliseconds given in a.
// func spinwait // = 0x0031
addr == 16'h31 ? 16'h2004 :  // <0111> push x // func spinwait
addr == 16'h32 ? 16'h2005 :  // <0111> push y // "
addr == 16'h33 ? 16'h0760 :  // <0112> b = -1
// :spinwait_outer // = 0x0034
addr == 16'h34 ? 16'h13a0 :  // <0114> x = 12500
addr == 16'h35 ? 16'h30d4 :  // <0114> "
addr == 16'h36 ? 16'h1760 :  // <0115> y = -1
addr == 16'h37 ? 16'hc800 :  // <0116> nop
// :spinwait_inner // = 0x0038
addr == 16'h38 ? 16'h1320 :  // <0118> x = x+y
addr == 16'h39 ? 16'hc800 :  // <0119> nop
addr == 16'h3a ? 16'he400 :  // <0120> bn 2z :spinwait_inner
addr == 16'h3b ? 16'h0038 :  // <0120> "
addr == 16'h3c ? 16'h0300 :  // <0121> a = a+b
addr == 16'h3d ? 16'hc800 :  // <0122> nop
addr == 16'h3e ? 16'he404 :  // <0123> bn z :spinwait_outer
addr == 16'h3f ? 16'h0034 :  // <0123> "
addr == 16'h40 ? 16'h1408 :  // <0124> pop y // return
addr == 16'h41 ? 16'h1008 :  // <0124> pop x // "
addr == 16'h42 ? 16'hfc00 :  // <0124> return

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x0043
addr == 16'h43 ? 16'h2004 :  // <0128> push x // func put4x
addr == 16'h44 ? 16'h2006 :  // <0128> push g6 // "
addr == 16'h45 ? 16'h203e :  // <0128> push rtna // "
addr == 16'h46 ? 16'h13a0 :  // <0129> x = :hexdigits
addr == 16'h47 ? 16'h0080 :  // <0129> "

addr == 16'h48 ? 16'h1800 :  // <0131> g6 = a
addr == 16'h49 ? 16'h07a0 :  // <0132> b = 0xF000
addr == 16'h4a ? 16'hf000 :  // <0132> "
addr == 16'h4b ? 16'hc800 :  // <0133> nop
addr == 16'h4c ? 16'h0330 :  // <0134> a = and
addr == 16'h4d ? 16'h0353 :  // <0135> a = a>>4
addr == 16'h4e ? 16'h0353 :  // <0136> a = a>>4
addr == 16'h4f ? 16'h0353 :  // <0137> a = a>>4
addr == 16'h50 ? 16'hfba0 :  // <0138> call fetch_byte
addr == 16'h51 ? 16'h0088 :  // <0138> "
addr == 16'h52 ? 16'hfc00 :  // <0138> "
addr == 16'h53 ? 16'h1000 :  // <0139> putchar a
addr == 16'h54 ? 16'hfba0 :  // <0139> "
addr == 16'h55 ? 16'h00c7 :  // <0139> "
addr == 16'h56 ? 16'hfc00 :  // <0139> "

addr == 16'h57 ? 16'h0006 :  // <0141> a = g6
addr == 16'h58 ? 16'h07a0 :  // <0142> b = 0x0F00
addr == 16'h59 ? 16'h0f00 :  // <0142> "
addr == 16'h5a ? 16'hc800 :  // <0143> nop
addr == 16'h5b ? 16'h0330 :  // <0144> a = and
addr == 16'h5c ? 16'h0353 :  // <0145> a = a>>4
addr == 16'h5d ? 16'h0353 :  // <0146> a = a>>4
addr == 16'h5e ? 16'hfba0 :  // <0147> call fetch_byte
addr == 16'h5f ? 16'h0088 :  // <0147> "
addr == 16'h60 ? 16'hfc00 :  // <0147> "
addr == 16'h61 ? 16'h1000 :  // <0148> putchar a
addr == 16'h62 ? 16'hfba0 :  // <0148> "
addr == 16'h63 ? 16'h00c7 :  // <0148> "
addr == 16'h64 ? 16'hfc00 :  // <0148> "

addr == 16'h65 ? 16'h0006 :  // <0150> a = g6
addr == 16'h66 ? 16'h06f0 :  // <0151> b = 0x00F0
addr == 16'h67 ? 16'hc800 :  // <0152> nop
addr == 16'h68 ? 16'h0330 :  // <0153> a = and
addr == 16'h69 ? 16'h0353 :  // <0154> a = a>>4
addr == 16'h6a ? 16'hfba0 :  // <0155> call fetch_byte
addr == 16'h6b ? 16'h0088 :  // <0155> "
addr == 16'h6c ? 16'hfc00 :  // <0155> "
addr == 16'h6d ? 16'h1000 :  // <0156> putchar a
addr == 16'h6e ? 16'hfba0 :  // <0156> "
addr == 16'h6f ? 16'h00c7 :  // <0156> "
addr == 16'h70 ? 16'hfc00 :  // <0156> "

addr == 16'h71 ? 16'h0006 :  // <0158> a = g6
addr == 16'h72 ? 16'h060f :  // <0159> b = 0x000F
addr == 16'h73 ? 16'hc800 :  // <0160> nop
addr == 16'h74 ? 16'h0330 :  // <0161> a = and
addr == 16'h75 ? 16'hfba0 :  // <0162> call fetch_byte
addr == 16'h76 ? 16'h0088 :  // <0162> "
addr == 16'h77 ? 16'hfc00 :  // <0162> "
addr == 16'h78 ? 16'h1000 :  // <0163> putchar a
addr == 16'h79 ? 16'hfba0 :  // <0163> "
addr == 16'h7a ? 16'h00c7 :  // <0163> "
addr == 16'h7b ? 16'hfc00 :  // <0163> "

addr == 16'h7c ? 16'hf808 :  // <0165> pop rtna // return
addr == 16'h7d ? 16'h1808 :  // <0165> pop g6 // "
addr == 16'h7e ? 16'h1008 :  // <0165> pop x // "
addr == 16'h7f ? 16'hfc00 :  // <0165> return

// :hexdigits // = 0x0080
// "0123456789abcdef"
addr == 16'h80 ? 16'h3130 :  // <0168> 10
addr == 16'h81 ? 16'h3332 :  // <0168> 32
addr == 16'h82 ? 16'h3534 :  // <0168> 54
addr == 16'h83 ? 16'h3736 :  // <0168> 76
addr == 16'h84 ? 16'h3938 :  // <0168> 98
addr == 16'h85 ? 16'h6261 :  // <0168> ba
addr == 16'h86 ? 16'h6463 :  // <0168> dc
addr == 16'h87 ? 16'h6665 :  // <0168> fe

// pick a byte from an array of words.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// func fetch_byte // = 0x0088
addr == 16'h88 ? 16'h0601 :  // <0173> b = 1
addr == 16'h89 ? 16'hc800 :  // <0174> nop
addr == 16'h8a ? 16'he002 :  // <0175> br and0z :pick_byte_even
addr == 16'h8b ? 16'h0094 :  // <0175> "
addr == 16'h8c ? 16'h0350 :  // <0176> a = a>>1
addr == 16'h8d ? 16'h0404 :  // <0177> b = x
addr == 16'h8e ? 16'hc800 :  // <0178> nop
addr == 16'h8f ? 16'hd300 :  // <0179> fetch a from a+b
addr == 16'h90 ? 16'h03b0 :  // <0179> "
addr == 16'h91 ? 16'h0353 :  // <0180> a = a>>4
addr == 16'h92 ? 16'h0353 :  // <0181> a = a>>4
addr == 16'h93 ? 16'hfc00 :  // <0182> return
// :pick_byte_even // = 0x0094
addr == 16'h94 ? 16'h0350 :  // <0184> a = a>>1
addr == 16'h95 ? 16'h0404 :  // <0185> b = x
addr == 16'h96 ? 16'hc800 :  // <0186> nop
addr == 16'h97 ? 16'hd300 :  // <0187> fetch a from a+b
addr == 16'h98 ? 16'h03b0 :  // <0187> "
addr == 16'h99 ? 16'hfc00 :  // <0188> return

// compute the modulus(255) of a number given in a.  return remainder in a.
// func mod255 // = 0x009a
addr == 16'h9a ? 16'h2006 :  // <0191> push g6 // func mod255
addr == 16'h9b ? 16'h2007 :  // <0191> push g7 // "
// while a is greater than 254, subtract 255.
// :mod255_again // = 0x009c
addr == 16'h9c ? 16'h06fe :  // <0194> b = 0xfe
addr == 16'h9d ? 16'hc800 :  // <0195> nop
addr == 16'h9e ? 16'he006 :  // <0196> br gt :mod255_greater
addr == 16'h9f ? 16'h00a3 :  // <0196> "
addr == 16'ha0 ? 16'h1c08 :  // <0197> pop g7 // return
addr == 16'ha1 ? 16'h1808 :  // <0197> pop g6 // "
addr == 16'ha2 ? 16'hfc00 :  // <0197> return
// :mod255_greater // = 0x00a3
addr == 16'ha3 ? 16'h07a0 :  // <0199> b = 0xff01
addr == 16'ha4 ? 16'hff01 :  // <0199> "
addr == 16'ha5 ? 16'hc800 :  // <0200> nop
addr == 16'ha6 ? 16'h0300 :  // <0201> a = a+b
addr == 16'ha7 ? 16'he00f :  // <0202> jmp :mod255_again
addr == 16'ha8 ? 16'h009c :  // <0202> "

// set up Fletcher16 checksum algorithm to accumulate in the 2 given register names.

addr == 16'ha9 ? 16'h1a00 :  // <0212> fletcher16_init g6 g7
addr == 16'haa ? 16'h1e00 :  // <0212> "

// accumulate a Fletcher16 checksum in g6 and g7,
// given the next byte of data in a.
// func fletcher16_input // = 0x00ab
addr == 16'hab ? 16'h2006 :  // <0216> push g6 // func fletcher16_input
addr == 16'hac ? 16'h2007 :  // <0216> push g7 // "
addr == 16'had ? 16'h203e :  // <0216> push rtna // "
//patch: need a way to declare summing registers as "static" or "preserve" so they're not auto-stacked.
addr == 16'hae ? 16'h0406 :  // <0218> b = $fletcher_sum1_reg
addr == 16'haf ? 16'hc800 :  // <0219> nop
addr == 16'hb0 ? 16'h0300 :  // <0220> a = a+b
addr == 16'hb1 ? 16'hfba0 :  // <0221> call :mod255
addr == 16'hb2 ? 16'h009a :  // <0221> "
addr == 16'hb3 ? 16'hfc00 :  // <0221> "
addr == 16'hb4 ? 16'h1800 :  // <0222> $fletcher_sum1_reg = a

addr == 16'hb5 ? 16'h0407 :  // <0224> b = $fletcher_sum2_reg
addr == 16'hb6 ? 16'hc800 :  // <0225> nop
addr == 16'hb7 ? 16'h0300 :  // <0226> a = a+b
addr == 16'hb8 ? 16'hfba0 :  // <0227> call :mod255
addr == 16'hb9 ? 16'h009a :  // <0227> "
addr == 16'hba ? 16'hfc00 :  // <0227> "
addr == 16'hbb ? 16'h1c00 :  // <0228> $fletcher_sum2_reg = a
addr == 16'hbc ? 16'hf808 :  // <0229> pop rtna // return
addr == 16'hbd ? 16'h1c08 :  // <0229> pop g7 // "
addr == 16'hbe ? 16'h1808 :  // <0229> pop g6 // "
addr == 16'hbf ? 16'hfc00 :  // <0229> return

// return the combined 16-bit result of Fletcher16 checksum in a.
// func fletcher16_result // = 0x00c0
addr == 16'hc0 ? 16'h0007 :  // <0233> a = $fletcher_sum2_reg
addr == 16'hc1 ? 16'h0352 :  // <0234> a = a<<4
addr == 16'hc2 ? 16'h0352 :  // <0235> a = a<<4
addr == 16'hc3 ? 16'h0406 :  // <0236> b = $fletcher_sum1_reg
addr == 16'hc4 ? 16'hc800 :  // <0237> nop
addr == 16'hc5 ? 16'h0334 :  // <0238> a = or
addr == 16'hc6 ? 16'hfc00 :  // <0239> return

// routine sends out the low byte from x to the UART.  blocks until the UART accepts the byte.
// func putchar_atx // = 0x00c7

// wait for UART to be idle (not busy).
addr == 16'hc7 ? 16'h0202 :  // <0245> a = $atx_busy_mask
// :pcatx_wait_for_idle // = 0x00c8
addr == 16'hc8 ? 16'h040b :  // <0247> b = atx_ctrl
addr == 16'hc9 ? 16'hc800 :  // <0248> nop
addr == 16'hca ? 16'he402 :  // <0249> bn and0z :pcatx_wait_for_idle
addr == 16'hcb ? 16'h00c8 :  // <0249> "

// push word to the UART.  its low byte is a character.
addr == 16'hcc ? 16'h2804 :  // <0252> atx_data = x

// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_ctrl.
addr == 16'hcd ? 16'h2e01 :  // <0257> atx_ctrl = $atx_load_mask

// wait until UART is busy, as acknowledgement.
addr == 16'hce ? 16'h0202 :  // <0260> a = $atx_busy_mask
// :pcatx_wait_for_busy // = 0x00cf
addr == 16'hcf ? 16'h040b :  // <0262> b = atx_ctrl
addr == 16'hd0 ? 16'h2604 :  // <0263> leds = 0b00000100
addr == 16'hd1 ? 16'he002 :  // <0264> br and0z :pcatx_wait_for_busy
addr == 16'hd2 ? 16'h00cf :  // <0264> "

addr == 16'hd3 ? 16'h2e00 :  // <0266> atx_ctrl = 0
addr == 16'hd4 ? 16'hfc00 :  // <0267> return

        
                16'hxxxx;
        endmodule
    
