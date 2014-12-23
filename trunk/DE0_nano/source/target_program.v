
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
addr == 16'h00 ? 16'h2601 :  // <0036> leds = 1
// atx_ctrl = 0

// a = 65
// push a
// a = 66
// push a
// a = 67
// push a
// a = 68
// push a
// a = 69
// push a

// pop b
// putchar b
// pop b
// putchar b
// pop b
// putchar b
// pop b
// putchar b
// pop b
// putchar b

// a = 0x1234
// call put4x

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
addr == 16'h01 ? 16'h1200 :  // <0079> x = 0
addr == 16'h02 ? 16'h1601 :  // <0080> y = 1
// :patch // = 0x0003

addr == 16'h03 ? 16'h0009 :  // <0083> a = leds
addr == 16'h04 ? 16'h0601 :  // <0084> b = 1
addr == 16'h05 ? 16'hc800 :  // <0085> nop
addr == 16'h06 ? 16'h2700 :  // <0086> leds = a+b

addr == 16'h07 ? 16'h0241 :  // <0088> a = 65
addr == 16'h08 ? 16'h2800 :  // <0089> putchar_avalon_hw a
addr == 16'h09 ? 16'h2fa0 :  // <0089> "
addr == 16'h0a ? 16'h0200 :  // <0089> "
addr == 16'h0b ? 16'h3200 :  // <0089> "
addr == 16'h0c ? 16'h0242 :  // <0090> a = 66
addr == 16'h0d ? 16'h2800 :  // <0091> putchar_avalon_hw a
addr == 16'h0e ? 16'h2fa0 :  // <0091> "
addr == 16'h0f ? 16'h0200 :  // <0091> "
addr == 16'h10 ? 16'h3200 :  // <0091> "
addr == 16'h11 ? 16'h0243 :  // <0092> a = 67
addr == 16'h12 ? 16'h2800 :  // <0093> putchar_avalon_hw a
addr == 16'h13 ? 16'h2fa0 :  // <0093> "
addr == 16'h14 ? 16'h0200 :  // <0093> "
addr == 16'h15 ? 16'h3200 :  // <0093> "

// // Avalon write to SDRAM.  triggered by av_ad_lo.
// av_data = 0x6789
// av_ad_hi = 0
// av_ad_lo = 0x20
// // clear av_data so we can recognize if it doesn't get filled.
// av_data = 0
// // Avalon read from SDRAM.  triggered by av_ad_lo.
// a = av_ad_lo
// leds = av_data

// :wait_key_press // = 0x0016
addr == 16'h16 ? 16'h0203 :  // <0106> a = 0x03
addr == 16'h17 ? 16'h040d :  // <0107> b = keys
addr == 16'h18 ? 16'hc800 :  // <0108> nop
addr == 16'h19 ? 16'he007 :  // <0109> br eq :wait_key_press
addr == 16'h1a ? 16'h0016 :  // <0109> "
// :wait_key_release // = 0x001b
addr == 16'h1b ? 16'h040d :  // <0111> b = keys
addr == 16'h1c ? 16'hc800 :  // <0112> nop
addr == 16'h1d ? 16'he407 :  // <0113> bn eq :wait_key_release
addr == 16'h1e ? 16'h001b :  // <0113> "

// getchar
// b = 1
// nop
// putchar a+b

// b = 85
// putchar b

// x = x+y
// nop
// a = x
// call put4x

addr == 16'h1f ? 16'h0264 :  // <0128> a = 100
addr == 16'h20 ? 16'hfba0 :  // <0129> call :spinwait
addr == 16'h21 ? 16'h004a :  // <0129> "
addr == 16'h22 ? 16'hfc00 :  // <0129> "

// b = 32
// putchar b
// m9k_addr = x
// a = m9k_data
// call put4x

// b = 13
// putchar b
// b = 10
// putchar b

addr == 16'h23 ? 16'he00f :  // <0142> jmp :patch
addr == 16'h24 ? 16'h0003 :  // <0142> "





// using i as index into string.
addr == 16'h25 ? 16'h0a00 :  // <0149> i = 0

// cache the string limit in g6.
addr == 16'h26 ? 16'h0210 :  // <0152> a = 16
addr == 16'h27 ? 16'h0760 :  // <0153> b = 0xffff
addr == 16'h28 ? 16'hc800 :  // <0154> nop
addr == 16'h29 ? 16'h1b38 :  // <0155> g6 = xor

// :again // = 0x002a
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

addr == 16'h2a ? 16'h0264 :  // <0169> a = 100
addr == 16'h2b ? 16'hfba0 :  // <0170> call :spinwait
addr == 16'h2c ? 16'h004a :  // <0170> "
addr == 16'h2d ? 16'hfc00 :  // <0170> "

// increment LEDs
addr == 16'h2e ? 16'h0009 :  // <0173> a = leds
addr == 16'h2f ? 16'h0601 :  // <0174> b = 1
addr == 16'h30 ? 16'hc800 :  // <0175> nop
addr == 16'h31 ? 16'h2700 :  // <0176> leds = a+b

// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 16'h32 ? 16'h0fa0 :  // <0179> j = :msg
addr == 16'h33 ? 16'h0041 :  // <0179> "
addr == 16'h34 ? 16'hc800 :  // <0180> nop
addr == 16'h35 ? 16'hd310 :  // <0181> fetch a from i+j
addr == 16'h36 ? 16'h03b0 :  // <0181> "
//    putchar a

// increment index & wrap around end of pattern.
addr == 16'h37 ? 16'h0e01 :  // <0185> j = 1
addr == 16'h38 ? 16'hc800 :  // <0186> nop
addr == 16'h39 ? 16'h0b10 :  // <0187> i = i+j
addr == 16'h3a ? 16'h0c06 :  // <0188> j = g6
addr == 16'h3b ? 16'hc800 :  // <0189> nop
addr == 16'h3c ? 16'he401 :  // <0190> bn 1z :no_wrap
addr == 16'h3d ? 16'h003f :  // <0190> "
addr == 16'h3e ? 16'h0a00 :  // <0191> i = 0
// :no_wrap // = 0x003f

// repeat forever.
addr == 16'h3f ? 16'he00f :  // <0195> jmp :again
addr == 16'h40 ? 16'h002a :  // <0195> "

// :msg // = 0x0041
// "1234567890abcdef\n\x00"
addr == 16'h41 ? 16'h3231 :  // <0198> 21
addr == 16'h42 ? 16'h3433 :  // <0198> 43
addr == 16'h43 ? 16'h3635 :  // <0198> 65
addr == 16'h44 ? 16'h3837 :  // <0198> 87
addr == 16'h45 ? 16'h3039 :  // <0198> 09
addr == 16'h46 ? 16'h6261 :  // <0198> ba
addr == 16'h47 ? 16'h6463 :  // <0198> dc
addr == 16'h48 ? 16'h6665 :  // <0198> fe
addr == 16'h49 ? 16'h000a :  // <0198>   

// routine waits a number of milliseconds given in a.
// func spinwait // = 0x004a
addr == 16'h4a ? 16'h2004 :  // <0201> push x // func spinwait
addr == 16'h4b ? 16'h2005 :  // <0201> push y // "
addr == 16'h4c ? 16'h0760 :  // <0202> b = -1
// :spinwait_outer // = 0x004d
addr == 16'h4d ? 16'h13a0 :  // <0204> x = 12500
addr == 16'h4e ? 16'h30d4 :  // <0204> "
addr == 16'h4f ? 16'h1760 :  // <0205> y = -1
addr == 16'h50 ? 16'hc800 :  // <0206> nop
// :spinwait_inner // = 0x0051
addr == 16'h51 ? 16'h1320 :  // <0208> x = x+y
addr == 16'h52 ? 16'hc800 :  // <0209> nop
addr == 16'h53 ? 16'he400 :  // <0210> bn 2z :spinwait_inner
addr == 16'h54 ? 16'h0051 :  // <0210> "
addr == 16'h55 ? 16'h0300 :  // <0211> a = a+b
addr == 16'h56 ? 16'hc800 :  // <0212> nop
addr == 16'h57 ? 16'he404 :  // <0213> bn z :spinwait_outer
addr == 16'h58 ? 16'h004d :  // <0213> "
addr == 16'h59 ? 16'h1408 :  // <0214> pop y // return
addr == 16'h5a ? 16'h1008 :  // <0214> pop x // "
addr == 16'h5b ? 16'hfc00 :  // <0214> return

// compute the modulus(255) of a number given in a.  return remainder in a.
// func mod255 // = 0x005c
addr == 16'h5c ? 16'h2006 :  // <0217> push g6 // func mod255
addr == 16'h5d ? 16'h2007 :  // <0217> push g7 // "
// while a is greater than 254, subtract 255.
// :mod255_again // = 0x005e
addr == 16'h5e ? 16'h06fe :  // <0220> b = 0xfe
addr == 16'h5f ? 16'hc800 :  // <0221> nop
addr == 16'h60 ? 16'he006 :  // <0222> br gt :mod255_greater
addr == 16'h61 ? 16'h0065 :  // <0222> "
addr == 16'h62 ? 16'h1c08 :  // <0223> pop g7 // return
addr == 16'h63 ? 16'h1808 :  // <0223> pop g6 // "
addr == 16'h64 ? 16'hfc00 :  // <0223> return
// :mod255_greater // = 0x0065
addr == 16'h65 ? 16'h07a0 :  // <0225> b = 0xff01
addr == 16'h66 ? 16'hff01 :  // <0225> "
addr == 16'h67 ? 16'hc800 :  // <0226> nop
addr == 16'h68 ? 16'h0300 :  // <0227> a = a+b
addr == 16'h69 ? 16'he00f :  // <0228> jmp :mod255_again
addr == 16'h6a ? 16'h005e :  // <0228> "

// set up Fletcher16 checksum algorithm to accumulate in the 2 given register names.

addr == 16'h6b ? 16'h1a00 :  // <0238> fletcher16_init g6 g7
addr == 16'h6c ? 16'h1e00 :  // <0238> "

// accumulate a Fletcher16 checksum in g6 and g7,
// given the next byte of data in a.
// func fletcher16_input // = 0x006d
addr == 16'h6d ? 16'h2006 :  // <0242> push g6 // func fletcher16_input
addr == 16'h6e ? 16'h2007 :  // <0242> push g7 // "
addr == 16'h6f ? 16'h203e :  // <0242> push rtna // "
//patch: need a way to declare summing registers as "static" or "preserve" so they're not auto-stacked.
addr == 16'h70 ? 16'h0406 :  // <0244> b = $fletcher_sum1_reg
addr == 16'h71 ? 16'hc800 :  // <0245> nop
addr == 16'h72 ? 16'h0300 :  // <0246> a = a+b
addr == 16'h73 ? 16'hfba0 :  // <0247> call :mod255
addr == 16'h74 ? 16'h005c :  // <0247> "
addr == 16'h75 ? 16'hfc00 :  // <0247> "
addr == 16'h76 ? 16'h1800 :  // <0248> $fletcher_sum1_reg = a

addr == 16'h77 ? 16'h0407 :  // <0250> b = $fletcher_sum2_reg
addr == 16'h78 ? 16'hc800 :  // <0251> nop
addr == 16'h79 ? 16'h0300 :  // <0252> a = a+b
addr == 16'h7a ? 16'hfba0 :  // <0253> call :mod255
addr == 16'h7b ? 16'h005c :  // <0253> "
addr == 16'h7c ? 16'hfc00 :  // <0253> "
addr == 16'h7d ? 16'h1c00 :  // <0254> $fletcher_sum2_reg = a
addr == 16'h7e ? 16'hf808 :  // <0255> pop rtna // return
addr == 16'h7f ? 16'h1c08 :  // <0255> pop g7 // "
addr == 16'h80 ? 16'h1808 :  // <0255> pop g6 // "
addr == 16'h81 ? 16'hfc00 :  // <0255> return

// return the combined 16-bit result of Fletcher16 checksum in a.
// func fletcher16_result // = 0x0082
addr == 16'h82 ? 16'h0007 :  // <0259> a = $fletcher_sum2_reg
addr == 16'h83 ? 16'h0352 :  // <0260> a = a<<4
addr == 16'h84 ? 16'h0352 :  // <0261> a = a<<4
addr == 16'h85 ? 16'h0406 :  // <0262> b = $fletcher_sum1_reg
addr == 16'h86 ? 16'hc800 :  // <0263> nop
addr == 16'h87 ? 16'h0334 :  // <0264> a = or
addr == 16'h88 ? 16'hfc00 :  // <0265> return

        
                16'hxxxx;
        endmodule
    
