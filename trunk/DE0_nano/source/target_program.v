
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

addr == 16'h06 ? 16'h0641 :  // <0049> b = 65
addr == 16'h07 ? 16'h1001 :  // <0050> putchar b
addr == 16'h08 ? 16'hfba0 :  // <0050> putchar b
addr == 16'h09 ? 16'h00d0 :  // <0050> "
addr == 16'h0a ? 16'hfc00 :  // <0050> "

addr == 16'h0b ? 16'h0264 :  // <0052> a = 100
addr == 16'h0c ? 16'hfba0 :  // <0053> call :spinwait
addr == 16'h0d ? 16'h003a :  // <0053> "
addr == 16'h0e ? 16'hfc00 :  // <0053> "

addr == 16'h0f ? 16'he00f :  // <0055> jmp :patch
addr == 16'h10 ? 16'h0002 :  // <0055> "





// using i as index into string.
addr == 16'h11 ? 16'h0a00 :  // <0062> i = 0

// cache the string limit in g6.
addr == 16'h12 ? 16'h0210 :  // <0065> a = 16
addr == 16'h13 ? 16'h0760 :  // <0066> b = 0xffff
addr == 16'h14 ? 16'hc800 :  // <0067> nop
addr == 16'h15 ? 16'h1b38 :  // <0068> g6 = xor

// :again // = 0x0016
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

addr == 16'h16 ? 16'h0264 :  // <0082> a = 100
addr == 16'h17 ? 16'hfba0 :  // <0083> call :spinwait
addr == 16'h18 ? 16'h003a :  // <0083> "
addr == 16'h19 ? 16'hfc00 :  // <0083> "

// increment LEDs
addr == 16'h1a ? 16'h0009 :  // <0086> a = leds
addr == 16'h1b ? 16'h0601 :  // <0087> b = 1
addr == 16'h1c ? 16'hc800 :  // <0088> nop
addr == 16'h1d ? 16'h2700 :  // <0089> leds = a+b

// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 16'h1e ? 16'h0fa0 :  // <0092> j = :msg
addr == 16'h1f ? 16'h0031 :  // <0092> "
addr == 16'h20 ? 16'hc800 :  // <0093> nop
addr == 16'h21 ? 16'hd310 :  // <0094> fetch a from i+j
addr == 16'h22 ? 16'h03b0 :  // <0094> "
addr == 16'h23 ? 16'h1000 :  // <0095> putchar a
addr == 16'h24 ? 16'hfba0 :  // <0095> putchar a
addr == 16'h25 ? 16'h00d0 :  // <0095> "
addr == 16'h26 ? 16'hfc00 :  // <0095> "

// increment index & wrap around end of pattern.
addr == 16'h27 ? 16'h0e01 :  // <0098> j = 1
addr == 16'h28 ? 16'hc800 :  // <0099> nop
addr == 16'h29 ? 16'h0b10 :  // <0100> i = i+j
addr == 16'h2a ? 16'h0c06 :  // <0101> j = g6
addr == 16'h2b ? 16'hc800 :  // <0102> nop
addr == 16'h2c ? 16'he401 :  // <0103> bn 1z :no_wrap
addr == 16'h2d ? 16'h002f :  // <0103> "
addr == 16'h2e ? 16'h0a00 :  // <0104> i = 0
// :no_wrap // = 0x002f

// repeat forever.
addr == 16'h2f ? 16'he00f :  // <0108> jmp :again
addr == 16'h30 ? 16'h0016 :  // <0108> "

// :msg // = 0x0031
// "1234567890abcdef\n\x00"
addr == 16'h31 ? 16'h3231 :  // <0111> 21
addr == 16'h32 ? 16'h3433 :  // <0111> 43
addr == 16'h33 ? 16'h3635 :  // <0111> 65
addr == 16'h34 ? 16'h3837 :  // <0111> 87
addr == 16'h35 ? 16'h3039 :  // <0111> 09
addr == 16'h36 ? 16'h6261 :  // <0111> ba
addr == 16'h37 ? 16'h6463 :  // <0111> dc
addr == 16'h38 ? 16'h6665 :  // <0111> fe
addr == 16'h39 ? 16'h000a :  // <0111>   

// routine waits a number of milliseconds given in a.
// func spinwait // = 0x003a
addr == 16'h3a ? 16'h2004 :  // <0114> push x // func spinwait
addr == 16'h3b ? 16'h2005 :  // <0114> push y // "
addr == 16'h3c ? 16'h0760 :  // <0115> b = -1
// :spinwait_outer // = 0x003d
addr == 16'h3d ? 16'h13a0 :  // <0117> x = 12500
addr == 16'h3e ? 16'h30d4 :  // <0117> "
addr == 16'h3f ? 16'h1760 :  // <0118> y = -1
addr == 16'h40 ? 16'hc800 :  // <0119> nop
// :spinwait_inner // = 0x0041
addr == 16'h41 ? 16'h1320 :  // <0121> x = x+y
addr == 16'h42 ? 16'hc800 :  // <0122> nop
addr == 16'h43 ? 16'he400 :  // <0123> bn 2z :spinwait_inner
addr == 16'h44 ? 16'h0041 :  // <0123> "
addr == 16'h45 ? 16'h0300 :  // <0124> a = a+b
addr == 16'h46 ? 16'hc800 :  // <0125> nop
addr == 16'h47 ? 16'he404 :  // <0126> bn z :spinwait_outer
addr == 16'h48 ? 16'h003d :  // <0126> "
addr == 16'h49 ? 16'h1408 :  // <0127> pop y // return
addr == 16'h4a ? 16'h1008 :  // <0127> pop x // "
addr == 16'h4b ? 16'hfc00 :  // <0127> return

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x004c
addr == 16'h4c ? 16'h2004 :  // <0131> push x // func put4x
addr == 16'h4d ? 16'h2006 :  // <0131> push g6 // "
addr == 16'h4e ? 16'h203e :  // <0131> push rtna // "
addr == 16'h4f ? 16'h13a0 :  // <0132> x = :hexdigits
addr == 16'h50 ? 16'h0089 :  // <0132> "

addr == 16'h51 ? 16'h1800 :  // <0134> g6 = a
addr == 16'h52 ? 16'h07a0 :  // <0135> b = 0xF000
addr == 16'h53 ? 16'hf000 :  // <0135> "
addr == 16'h54 ? 16'hc800 :  // <0136> nop
addr == 16'h55 ? 16'h0330 :  // <0137> a = and
addr == 16'h56 ? 16'h0353 :  // <0138> a = a>>4
addr == 16'h57 ? 16'h0353 :  // <0139> a = a>>4
addr == 16'h58 ? 16'h0353 :  // <0140> a = a>>4
addr == 16'h59 ? 16'hfba0 :  // <0141> call fetch_byte
addr == 16'h5a ? 16'h0091 :  // <0141> "
addr == 16'h5b ? 16'hfc00 :  // <0141> "
addr == 16'h5c ? 16'h1000 :  // <0142> putchar a
addr == 16'h5d ? 16'hfba0 :  // <0142> putchar a
addr == 16'h5e ? 16'h00d0 :  // <0142> "
addr == 16'h5f ? 16'hfc00 :  // <0142> "

addr == 16'h60 ? 16'h0006 :  // <0144> a = g6
addr == 16'h61 ? 16'h07a0 :  // <0145> b = 0x0F00
addr == 16'h62 ? 16'h0f00 :  // <0145> "
addr == 16'h63 ? 16'hc800 :  // <0146> nop
addr == 16'h64 ? 16'h0330 :  // <0147> a = and
addr == 16'h65 ? 16'h0353 :  // <0148> a = a>>4
addr == 16'h66 ? 16'h0353 :  // <0149> a = a>>4
addr == 16'h67 ? 16'hfba0 :  // <0150> call fetch_byte
addr == 16'h68 ? 16'h0091 :  // <0150> "
addr == 16'h69 ? 16'hfc00 :  // <0150> "
addr == 16'h6a ? 16'h1000 :  // <0151> putchar a
addr == 16'h6b ? 16'hfba0 :  // <0151> putchar a
addr == 16'h6c ? 16'h00d0 :  // <0151> "
addr == 16'h6d ? 16'hfc00 :  // <0151> "

addr == 16'h6e ? 16'h0006 :  // <0153> a = g6
addr == 16'h6f ? 16'h06f0 :  // <0154> b = 0x00F0
addr == 16'h70 ? 16'hc800 :  // <0155> nop
addr == 16'h71 ? 16'h0330 :  // <0156> a = and
addr == 16'h72 ? 16'h0353 :  // <0157> a = a>>4
addr == 16'h73 ? 16'hfba0 :  // <0158> call fetch_byte
addr == 16'h74 ? 16'h0091 :  // <0158> "
addr == 16'h75 ? 16'hfc00 :  // <0158> "
addr == 16'h76 ? 16'h1000 :  // <0159> putchar a
addr == 16'h77 ? 16'hfba0 :  // <0159> putchar a
addr == 16'h78 ? 16'h00d0 :  // <0159> "
addr == 16'h79 ? 16'hfc00 :  // <0159> "

addr == 16'h7a ? 16'h0006 :  // <0161> a = g6
addr == 16'h7b ? 16'h060f :  // <0162> b = 0x000F
addr == 16'h7c ? 16'hc800 :  // <0163> nop
addr == 16'h7d ? 16'h0330 :  // <0164> a = and
addr == 16'h7e ? 16'hfba0 :  // <0165> call fetch_byte
addr == 16'h7f ? 16'h0091 :  // <0165> "
addr == 16'h80 ? 16'hfc00 :  // <0165> "
addr == 16'h81 ? 16'h1000 :  // <0166> putchar a
addr == 16'h82 ? 16'hfba0 :  // <0166> putchar a
addr == 16'h83 ? 16'h00d0 :  // <0166> "
addr == 16'h84 ? 16'hfc00 :  // <0166> "

addr == 16'h85 ? 16'hf808 :  // <0168> pop rtna // return
addr == 16'h86 ? 16'h1808 :  // <0168> pop g6 // "
addr == 16'h87 ? 16'h1008 :  // <0168> pop x // "
addr == 16'h88 ? 16'hfc00 :  // <0168> return

// :hexdigits // = 0x0089
// "0123456789abcdef"
addr == 16'h89 ? 16'h3130 :  // <0171> 10
addr == 16'h8a ? 16'h3332 :  // <0171> 32
addr == 16'h8b ? 16'h3534 :  // <0171> 54
addr == 16'h8c ? 16'h3736 :  // <0171> 76
addr == 16'h8d ? 16'h3938 :  // <0171> 98
addr == 16'h8e ? 16'h6261 :  // <0171> ba
addr == 16'h8f ? 16'h6463 :  // <0171> dc
addr == 16'h90 ? 16'h6665 :  // <0171> fe

// pick a byte from an array of words.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// func fetch_byte // = 0x0091
addr == 16'h91 ? 16'h0601 :  // <0176> b = 1
addr == 16'h92 ? 16'hc800 :  // <0177> nop
addr == 16'h93 ? 16'he002 :  // <0178> br and0z :pick_byte_even
addr == 16'h94 ? 16'h009d :  // <0178> "
addr == 16'h95 ? 16'h0350 :  // <0179> a = a>>1
addr == 16'h96 ? 16'h0404 :  // <0180> b = x
addr == 16'h97 ? 16'hc800 :  // <0181> nop
addr == 16'h98 ? 16'hd300 :  // <0182> fetch a from a+b
addr == 16'h99 ? 16'h03b0 :  // <0182> "
addr == 16'h9a ? 16'h0353 :  // <0183> a = a>>4
addr == 16'h9b ? 16'h0353 :  // <0184> a = a>>4
addr == 16'h9c ? 16'hfc00 :  // <0185> return
// :pick_byte_even // = 0x009d
addr == 16'h9d ? 16'h0350 :  // <0187> a = a>>1
addr == 16'h9e ? 16'h0404 :  // <0188> b = x
addr == 16'h9f ? 16'hc800 :  // <0189> nop
addr == 16'ha0 ? 16'hd300 :  // <0190> fetch a from a+b
addr == 16'ha1 ? 16'h03b0 :  // <0190> "
addr == 16'ha2 ? 16'hfc00 :  // <0191> return

// compute the modulus(255) of a number given in a.  return remainder in a.
// func mod255 // = 0x00a3
addr == 16'ha3 ? 16'h2006 :  // <0194> push g6 // func mod255
addr == 16'ha4 ? 16'h2007 :  // <0194> push g7 // "
// while a is greater than 254, subtract 255.
// :mod255_again // = 0x00a5
addr == 16'ha5 ? 16'h06fe :  // <0197> b = 0xfe
addr == 16'ha6 ? 16'hc800 :  // <0198> nop
addr == 16'ha7 ? 16'he006 :  // <0199> br gt :mod255_greater
addr == 16'ha8 ? 16'h00ac :  // <0199> "
addr == 16'ha9 ? 16'h1c08 :  // <0200> pop g7 // return
addr == 16'haa ? 16'h1808 :  // <0200> pop g6 // "
addr == 16'hab ? 16'hfc00 :  // <0200> return
// :mod255_greater // = 0x00ac
addr == 16'hac ? 16'h07a0 :  // <0202> b = 0xff01
addr == 16'had ? 16'hff01 :  // <0202> "
addr == 16'hae ? 16'hc800 :  // <0203> nop
addr == 16'haf ? 16'h0300 :  // <0204> a = a+b
addr == 16'hb0 ? 16'he00f :  // <0205> jmp :mod255_again
addr == 16'hb1 ? 16'h00a5 :  // <0205> "

// set up Fletcher16 checksum algorithm to accumulate in the 2 given register names.

addr == 16'hb2 ? 16'h1a00 :  // <0215> fletcher16_init g6 g7
addr == 16'hb3 ? 16'h1e00 :  // <0215> "

// accumulate a Fletcher16 checksum in g6 and g7,
// given the next byte of data in a.
// func fletcher16_input // = 0x00b4
addr == 16'hb4 ? 16'h2006 :  // <0219> push g6 // func fletcher16_input
addr == 16'hb5 ? 16'h2007 :  // <0219> push g7 // "
addr == 16'hb6 ? 16'h203e :  // <0219> push rtna // "
//patch: need a way to declare summing registers as "static" or "preserve" so they're not auto-stacked.
addr == 16'hb7 ? 16'h0406 :  // <0221> b = $fletcher_sum1_reg
addr == 16'hb8 ? 16'hc800 :  // <0222> nop
addr == 16'hb9 ? 16'h0300 :  // <0223> a = a+b
addr == 16'hba ? 16'hfba0 :  // <0224> call :mod255
addr == 16'hbb ? 16'h00a3 :  // <0224> "
addr == 16'hbc ? 16'hfc00 :  // <0224> "
addr == 16'hbd ? 16'h1800 :  // <0225> $fletcher_sum1_reg = a

addr == 16'hbe ? 16'h0407 :  // <0227> b = $fletcher_sum2_reg
addr == 16'hbf ? 16'hc800 :  // <0228> nop
addr == 16'hc0 ? 16'h0300 :  // <0229> a = a+b
addr == 16'hc1 ? 16'hfba0 :  // <0230> call :mod255
addr == 16'hc2 ? 16'h00a3 :  // <0230> "
addr == 16'hc3 ? 16'hfc00 :  // <0230> "
addr == 16'hc4 ? 16'h1c00 :  // <0231> $fletcher_sum2_reg = a
addr == 16'hc5 ? 16'hf808 :  // <0232> pop rtna // return
addr == 16'hc6 ? 16'h1c08 :  // <0232> pop g7 // "
addr == 16'hc7 ? 16'h1808 :  // <0232> pop g6 // "
addr == 16'hc8 ? 16'hfc00 :  // <0232> return

// return the combined 16-bit result of Fletcher16 checksum in a.
// func fletcher16_result // = 0x00c9
addr == 16'hc9 ? 16'h0007 :  // <0236> a = $fletcher_sum2_reg
addr == 16'hca ? 16'h0352 :  // <0237> a = a<<4
addr == 16'hcb ? 16'h0352 :  // <0238> a = a<<4
addr == 16'hcc ? 16'h0406 :  // <0239> b = $fletcher_sum1_reg
addr == 16'hcd ? 16'hc800 :  // <0240> nop
addr == 16'hce ? 16'h0334 :  // <0241> a = or
addr == 16'hcf ? 16'hfc00 :  // <0242> return

// routine sends out the low byte from x to the UART.  blocks until the UART accepts the byte.
// func putchar_atx // = 0x00d0

// wait for UART to be idle (not busy).
addr == 16'hd0 ? 16'h0202 :  // <0248> a = $atx_busy_mask
// :pcatx_wait_for_idle // = 0x00d1
addr == 16'hd1 ? 16'h040b :  // <0250> b = atx_ctrl
addr == 16'hd2 ? 16'hc800 :  // <0251> nop
addr == 16'hd3 ? 16'he402 :  // <0252> bn and0z :pcatx_wait_for_idle
addr == 16'hd4 ? 16'h00d1 :  // <0252> "

// push word to the UART.  its low byte is a character.
addr == 16'hd5 ? 16'h2804 :  // <0255> atx_data = x

// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_ctrl.
addr == 16'hd6 ? 16'h2e01 :  // <0260> atx_ctrl = $atx_load_mask

// wait until UART is busy, as acknowledgement.
addr == 16'hd7 ? 16'h0202 :  // <0263> a = $atx_busy_mask
// :pcatx_wait_for_busy // = 0x00d8
addr == 16'hd8 ? 16'h040b :  // <0265> b = atx_ctrl
addr == 16'hd9 ? 16'he002 :  // <0266> br and0z :pcatx_wait_for_busy
addr == 16'hda ? 16'h00d8 :  // <0266> "

addr == 16'hdb ? 16'h2e00 :  // <0268> atx_ctrl = 0
addr == 16'hdc ? 16'hfc00 :  // <0269> return

        
                16'hxxxx;
        endmodule
    
