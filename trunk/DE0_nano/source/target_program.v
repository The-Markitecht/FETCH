
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
addr == 16'h00 ? 16'h2601 :  // <0033> leds = 1
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
addr == 16'h01 ? 16'h1200 :  // <0076> x = 0
addr == 16'h02 ? 16'h1601 :  // <0077> y = 1
// :patch // = 0x0003

addr == 16'h03 ? 16'h0009 :  // <0080> a = leds
addr == 16'h04 ? 16'h0601 :  // <0081> b = 1
addr == 16'h05 ? 16'hc800 :  // <0082> nop
addr == 16'h06 ? 16'h2700 :  // <0083> leds = a+b

// :wait_key_press // = 0x0007
addr == 16'h07 ? 16'h0203 :  // <0086> a = 0x03
addr == 16'h08 ? 16'h040c :  // <0087> b = keys
addr == 16'h09 ? 16'hc800 :  // <0088> nop
addr == 16'h0a ? 16'he007 :  // <0089> br eq :wait_key_press
addr == 16'h0b ? 16'h0007 :  // <0089> "
// :wait_key_release // = 0x000c
addr == 16'h0c ? 16'h040c :  // <0091> b = keys
addr == 16'h0d ? 16'hc800 :  // <0092> nop
addr == 16'h0e ? 16'he407 :  // <0093> bn eq :wait_key_release
addr == 16'h0f ? 16'h000c :  // <0093> "

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

addr == 16'h10 ? 16'h0264 :  // <0108> a = 100
addr == 16'h11 ? 16'hfba0 :  // <0109> call :spinwait
addr == 16'h12 ? 16'h003b :  // <0109> "
addr == 16'h13 ? 16'hfc00 :  // <0109> "

// b = 32
// putchar b
// m9k_addr = x
// a = m9k_data
// call put4x

// b = 13
// putchar b
// b = 10
// putchar b

addr == 16'h14 ? 16'he00f :  // <0122> jmp :patch
addr == 16'h15 ? 16'h0003 :  // <0122> "





// using i as index into string.
addr == 16'h16 ? 16'h0a00 :  // <0129> i = 0

// cache the string limit in g6.
addr == 16'h17 ? 16'h0210 :  // <0132> a = 16
addr == 16'h18 ? 16'h0760 :  // <0133> b = 0xffff
addr == 16'h19 ? 16'hc800 :  // <0134> nop
addr == 16'h1a ? 16'h1b38 :  // <0135> g6 = xor

// :again // = 0x001b
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

addr == 16'h1b ? 16'h0264 :  // <0149> a = 100
addr == 16'h1c ? 16'hfba0 :  // <0150> call :spinwait
addr == 16'h1d ? 16'h003b :  // <0150> "
addr == 16'h1e ? 16'hfc00 :  // <0150> "

// increment LEDs
addr == 16'h1f ? 16'h0009 :  // <0153> a = leds
addr == 16'h20 ? 16'h0601 :  // <0154> b = 1
addr == 16'h21 ? 16'hc800 :  // <0155> nop
addr == 16'h22 ? 16'h2700 :  // <0156> leds = a+b

// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 16'h23 ? 16'h0fa0 :  // <0159> j = :msg
addr == 16'h24 ? 16'h0032 :  // <0159> "
addr == 16'h25 ? 16'hc800 :  // <0160> nop
addr == 16'h26 ? 16'hd310 :  // <0161> fetch a from i+j
addr == 16'h27 ? 16'h03b0 :  // <0161> "
//    putchar a

// increment index & wrap around end of pattern.
addr == 16'h28 ? 16'h0e01 :  // <0165> j = 1
addr == 16'h29 ? 16'hc800 :  // <0166> nop
addr == 16'h2a ? 16'h0b10 :  // <0167> i = i+j
addr == 16'h2b ? 16'h0c06 :  // <0168> j = g6
addr == 16'h2c ? 16'hc800 :  // <0169> nop
addr == 16'h2d ? 16'he401 :  // <0170> bn 1z :no_wrap
addr == 16'h2e ? 16'h0030 :  // <0170> "
addr == 16'h2f ? 16'h0a00 :  // <0171> i = 0
// :no_wrap // = 0x0030

// repeat forever.
addr == 16'h30 ? 16'he00f :  // <0175> jmp :again
addr == 16'h31 ? 16'h001b :  // <0175> "

// :msg // = 0x0032
// "1234567890abcdef\n\x00"
addr == 16'h32 ? 16'h3231 :  // <0178> 21
addr == 16'h33 ? 16'h3433 :  // <0178> 43
addr == 16'h34 ? 16'h3635 :  // <0178> 65
addr == 16'h35 ? 16'h3837 :  // <0178> 87
addr == 16'h36 ? 16'h3039 :  // <0178> 09
addr == 16'h37 ? 16'h6261 :  // <0178> ba
addr == 16'h38 ? 16'h6463 :  // <0178> dc
addr == 16'h39 ? 16'h6665 :  // <0178> fe
addr == 16'h3a ? 16'h000a :  // <0178>   

// routine waits a number of milliseconds given in a.
// func spinwait // = 0x003b
addr == 16'h3b ? 16'h2004 :  // <0181> push x // func spinwait
addr == 16'h3c ? 16'h2005 :  // <0181> push y // "
addr == 16'h3d ? 16'h0760 :  // <0182> b = -1
// :spinwait_outer // = 0x003e
addr == 16'h3e ? 16'h13a0 :  // <0184> x = 12500
addr == 16'h3f ? 16'h30d4 :  // <0184> "
addr == 16'h40 ? 16'h1760 :  // <0185> y = -1
addr == 16'h41 ? 16'hc800 :  // <0186> nop
// :spinwait_inner // = 0x0042
addr == 16'h42 ? 16'h1320 :  // <0188> x = x+y
addr == 16'h43 ? 16'hc800 :  // <0189> nop
addr == 16'h44 ? 16'he400 :  // <0190> bn 2z :spinwait_inner
addr == 16'h45 ? 16'h0042 :  // <0190> "
addr == 16'h46 ? 16'h0300 :  // <0191> a = a+b
addr == 16'h47 ? 16'hc800 :  // <0192> nop
addr == 16'h48 ? 16'he404 :  // <0193> bn z :spinwait_outer
addr == 16'h49 ? 16'h003e :  // <0193> "
addr == 16'h4a ? 16'h1408 :  // <0194> pop y // return
addr == 16'h4b ? 16'h1008 :  // <0194> pop x // "
addr == 16'h4c ? 16'hfc00 :  // <0194> return

// compute the modulus(255) of a number given in a.  return remainder in a.
// func mod255 // = 0x004d
addr == 16'h4d ? 16'h2006 :  // <0197> push g6 // func mod255
addr == 16'h4e ? 16'h2007 :  // <0197> push g7 // "
// while a is greater than 254, subtract 255.
// :mod255_again // = 0x004f
addr == 16'h4f ? 16'h06fe :  // <0200> b = 0xfe
addr == 16'h50 ? 16'hc800 :  // <0201> nop
addr == 16'h51 ? 16'he006 :  // <0202> br gt :mod255_greater
addr == 16'h52 ? 16'h0056 :  // <0202> "
addr == 16'h53 ? 16'h1c08 :  // <0203> pop g7 // return
addr == 16'h54 ? 16'h1808 :  // <0203> pop g6 // "
addr == 16'h55 ? 16'hfc00 :  // <0203> return
// :mod255_greater // = 0x0056
addr == 16'h56 ? 16'h07a0 :  // <0205> b = 0xff01
addr == 16'h57 ? 16'hff01 :  // <0205> "
addr == 16'h58 ? 16'hc800 :  // <0206> nop
addr == 16'h59 ? 16'h0300 :  // <0207> a = a+b
addr == 16'h5a ? 16'he00f :  // <0208> jmp :mod255_again
addr == 16'h5b ? 16'h004f :  // <0208> "

// set up Fletcher16 checksum algorithm to accumulate in the 2 given register names.

addr == 16'h5c ? 16'h1a00 :  // <0218> fletcher16_init g6 g7
addr == 16'h5d ? 16'h1e00 :  // <0218> "

// accumulate a Fletcher16 checksum in g6 and g7,
// given the next byte of data in a.
// func fletcher16_input // = 0x005e
addr == 16'h5e ? 16'h2006 :  // <0222> push g6 // func fletcher16_input
addr == 16'h5f ? 16'h2007 :  // <0222> push g7 // "
addr == 16'h60 ? 16'h203e :  // <0222> push rtna // "
//patch: need a way to declare summing registers as "static" or "preserve" so they're not auto-stacked.
addr == 16'h61 ? 16'h0406 :  // <0224> b = $fletcher_sum1_reg
addr == 16'h62 ? 16'hc800 :  // <0225> nop
addr == 16'h63 ? 16'h0300 :  // <0226> a = a+b
addr == 16'h64 ? 16'hfba0 :  // <0227> call :mod255
addr == 16'h65 ? 16'h004d :  // <0227> "
addr == 16'h66 ? 16'hfc00 :  // <0227> "
addr == 16'h67 ? 16'h1800 :  // <0228> $fletcher_sum1_reg = a

addr == 16'h68 ? 16'h0407 :  // <0230> b = $fletcher_sum2_reg
addr == 16'h69 ? 16'hc800 :  // <0231> nop
addr == 16'h6a ? 16'h0300 :  // <0232> a = a+b
addr == 16'h6b ? 16'hfba0 :  // <0233> call :mod255
addr == 16'h6c ? 16'h004d :  // <0233> "
addr == 16'h6d ? 16'hfc00 :  // <0233> "
addr == 16'h6e ? 16'h1c00 :  // <0234> $fletcher_sum2_reg = a
addr == 16'h6f ? 16'hf808 :  // <0235> pop rtna // return
addr == 16'h70 ? 16'h1c08 :  // <0235> pop g7 // "
addr == 16'h71 ? 16'h1808 :  // <0235> pop g6 // "
addr == 16'h72 ? 16'hfc00 :  // <0235> return

// return the combined 16-bit result of Fletcher16 checksum in a.
// func fletcher16_result // = 0x0073
addr == 16'h73 ? 16'h0007 :  // <0239> a = $fletcher_sum2_reg
addr == 16'h74 ? 16'h0352 :  // <0240> a = a<<4
addr == 16'h75 ? 16'h0352 :  // <0241> a = a<<4
addr == 16'h76 ? 16'h0406 :  // <0242> b = $fletcher_sum1_reg
addr == 16'h77 ? 16'hc800 :  // <0243> nop
addr == 16'h78 ? 16'h0334 :  // <0244> a = or
addr == 16'h79 ? 16'hfc00 :  // <0245> return

        
                16'hxxxx;
        endmodule
    
