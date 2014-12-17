
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
addr == 16'h08 ? 16'h0020 :  // <0055> call :spinwait
addr == 16'h09 ? 16'hfc00 :  // <0055> call :spinwait

// increment LEDs
addr == 16'h0a ? 16'h0009 :  // <0058> a = leds
addr == 16'h0b ? 16'h0601 :  // <0059> b = 1
addr == 16'h0c ? 16'hc800 :  // <0060> nop
addr == 16'h0d ? 16'h2700 :  // <0061> leds = a+b

// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 16'h0e ? 16'h0fa0 :  // <0064> j = :msg
addr == 16'h0f ? 16'h0034 :  // <0064> j = :msg
addr == 16'h10 ? 16'hc800 :  // <0065> nop
addr == 16'h11 ? 16'hd310 :  // <0066> fetch a from i+j
addr == 16'h12 ? 16'h03b0 :  // <0066> fetch a from i+j
addr == 16'h13 ? 16'h2fa0 :  // <0067> putchar a
addr == 16'h14 ? 16'h0100 :  // <0067> putchar a
addr == 16'h15 ? 16'h2800 :  // <0067> putchar a

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

// routine waits a number of milliseconds given in g7.
// func spinwait // = 0x0020
addr == 16'h20 ? 16'h2004 :  // <0083> push x // func spinwait
addr == 16'h21 ? 16'h2005 :  // <0083> push y // func spinwait
addr == 16'h22 ? 16'h2007 :  // <0083> push g7 // func spinwait
// :spinwait_outer // = 0x0023
addr == 16'h23 ? 16'h13a0 :  // <0085> x = 12500
addr == 16'h24 ? 16'h30d4 :  // <0085> x = 12500
addr == 16'h25 ? 16'h1760 :  // <0086> y = -1
addr == 16'h26 ? 16'hc800 :  // <0087> nop
// :spinwait_inner // = 0x0027
addr == 16'h27 ? 16'h1320 :  // <0089> x = x+y
addr == 16'h28 ? 16'hc800 :  // <0090> nop
addr == 16'h29 ? 16'he400 :  // <0091> bn 2z :spinwait_inner
addr == 16'h2a ? 16'h0027 :  // <0091> bn 2z :spinwait_inner
addr == 16'h2b ? 16'h1007 :  // <0092> x = g7
addr == 16'h2c ? 16'hc800 :  // <0093> nop
addr == 16'h2d ? 16'h1f20 :  // <0094> g7 = x+y
addr == 16'h2e ? 16'he400 :  // <0095> bn 2z :spinwait_outer
addr == 16'h2f ? 16'h0023 :  // <0095> bn 2z :spinwait_outer
addr == 16'h30 ? 16'h1c08 :  // <0096> pop g7 // return
addr == 16'h31 ? 16'h1408 :  // <0096> pop y // return
addr == 16'h32 ? 16'h1008 :  // <0096> pop x // return
addr == 16'h33 ? 16'hfc00 :  // <0096> return

// :msg // = 0x0034
// "1234567890abcdef\n\x00"
addr == 16'h34 ? 16'h3231 :  // <0099> 21
addr == 16'h35 ? 16'h3433 :  // <0099> 43
addr == 16'h36 ? 16'h3635 :  // <0099> 65
addr == 16'h37 ? 16'h3837 :  // <0099> 87
addr == 16'h38 ? 16'h3039 :  // <0099> 09
addr == 16'h39 ? 16'h6261 :  // <0099> ba
addr == 16'h3a ? 16'h6463 :  // <0099> dc
addr == 16'h3b ? 16'h6665 :  // <0099> fe
addr == 16'h3c ? 16'h000a :  // <0099>   

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x003d
addr == 16'h3d ? 16'h2002 :  // <0103> push i // func put4x
addr == 16'h3e ? 16'h2003 :  // <0103> push j // func put4x
addr == 16'h3f ? 16'h2006 :  // <0103> push g6 // func put4x
addr == 16'h40 ? 16'h1800 :  // <0104> g6 = a
addr == 16'h41 ? 16'h07a0 :  // <0105> b = 0xF000
addr == 16'h42 ? 16'hf000 :  // <0105> b = 0xF000
addr == 16'h43 ? 16'h0ba0 :  // <0106> i = :hexdigits
addr == 16'h44 ? 16'h0078 :  // <0106> i = :hexdigits
addr == 16'h45 ? 16'h0330 :  // <0107> a = and
addr == 16'h46 ? 16'h0353 :  // <0108> a = a>>4
addr == 16'h47 ? 16'h0353 :  // <0109> a = a>>4
addr == 16'h48 ? 16'h0f53 :  // <0110> j = a>>4
addr == 16'h49 ? 16'hc800 :  // <0111> nop
addr == 16'h4a ? 16'hd310 :  // <0112> fetch a from i+j
addr == 16'h4b ? 16'h03b0 :  // <0112> fetch a from i+j
addr == 16'h4c ? 16'h2fa0 :  // <0113> putchar a
addr == 16'h4d ? 16'h0100 :  // <0113> putchar a
addr == 16'h4e ? 16'h2800 :  // <0113> putchar a

addr == 16'h4f ? 16'h0006 :  // <0115> a = g6
addr == 16'h50 ? 16'h07a0 :  // <0116> b = 0x0F00
addr == 16'h51 ? 16'h0f00 :  // <0116> b = 0x0F00
addr == 16'h52 ? 16'h0ba0 :  // <0117> i = :hexdigits
addr == 16'h53 ? 16'h0078 :  // <0117> i = :hexdigits
addr == 16'h54 ? 16'h0330 :  // <0118> a = and
addr == 16'h55 ? 16'h0353 :  // <0119> a = a>>4
addr == 16'h56 ? 16'h0f53 :  // <0120> j = a>>4
addr == 16'h57 ? 16'hc800 :  // <0121> nop
addr == 16'h58 ? 16'hd310 :  // <0122> fetch a from i+j
addr == 16'h59 ? 16'h03b0 :  // <0122> fetch a from i+j
addr == 16'h5a ? 16'h2fa0 :  // <0123> putchar a
addr == 16'h5b ? 16'h0100 :  // <0123> putchar a
addr == 16'h5c ? 16'h2800 :  // <0123> putchar a

addr == 16'h5d ? 16'h0006 :  // <0125> a = g6
addr == 16'h5e ? 16'h06f0 :  // <0126> b = 0x00F0
addr == 16'h5f ? 16'h0ba0 :  // <0127> i = :hexdigits
addr == 16'h60 ? 16'h0078 :  // <0127> i = :hexdigits
addr == 16'h61 ? 16'h0330 :  // <0128> a = and
addr == 16'h62 ? 16'h0f53 :  // <0129> j = a>>4
addr == 16'h63 ? 16'hc800 :  // <0130> nop
addr == 16'h64 ? 16'hd310 :  // <0131> fetch a from i+j
addr == 16'h65 ? 16'h03b0 :  // <0131> fetch a from i+j
addr == 16'h66 ? 16'h2fa0 :  // <0132> putchar a
addr == 16'h67 ? 16'h0100 :  // <0132> putchar a
addr == 16'h68 ? 16'h2800 :  // <0132> putchar a

addr == 16'h69 ? 16'h0006 :  // <0134> a = g6
addr == 16'h6a ? 16'h060f :  // <0135> b = 0x000F
addr == 16'h6b ? 16'h0ba0 :  // <0136> i = :hexdigits
addr == 16'h6c ? 16'h0078 :  // <0136> i = :hexdigits
addr == 16'h6d ? 16'h0f30 :  // <0137> j = and
addr == 16'h6e ? 16'hc800 :  // <0138> nop
addr == 16'h6f ? 16'hd310 :  // <0139> fetch a from i+j
addr == 16'h70 ? 16'h03b0 :  // <0139> fetch a from i+j
addr == 16'h71 ? 16'h2fa0 :  // <0140> putchar a
addr == 16'h72 ? 16'h0100 :  // <0140> putchar a
addr == 16'h73 ? 16'h2800 :  // <0140> putchar a

addr == 16'h74 ? 16'h1808 :  // <0142> pop g6 // return
addr == 16'h75 ? 16'h0c08 :  // <0142> pop j // return
addr == 16'h76 ? 16'h0808 :  // <0142> pop i // return
addr == 16'h77 ? 16'hfc00 :  // <0142> return

// :hexdigits // = 0x0078
// "0 1 2 3 4 5 6 7 8 9 a b c d e f "
addr == 16'h78 ? 16'h2030 :  // <0145>  0
addr == 16'h79 ? 16'h2031 :  // <0145>  1
addr == 16'h7a ? 16'h2032 :  // <0145>  2
addr == 16'h7b ? 16'h2033 :  // <0145>  3
addr == 16'h7c ? 16'h2034 :  // <0145>  4
addr == 16'h7d ? 16'h2035 :  // <0145>  5
addr == 16'h7e ? 16'h2036 :  // <0145>  6
addr == 16'h7f ? 16'h2037 :  // <0145>  7
addr == 16'h80 ? 16'h2038 :  // <0145>  8
addr == 16'h81 ? 16'h2039 :  // <0145>  9
addr == 16'h82 ? 16'h2061 :  // <0145>  a
addr == 16'h83 ? 16'h2062 :  // <0145>  b
addr == 16'h84 ? 16'h2063 :  // <0145>  c
addr == 16'h85 ? 16'h2064 :  // <0145>  d
addr == 16'h86 ? 16'h2065 :  // <0145>  e
addr == 16'h87 ? 16'h2066 :  // <0145>  f


        
                16'hxxxx;
        endmodule
    
