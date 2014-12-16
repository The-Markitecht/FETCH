
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
addr == 16'h08 ? 16'h002b :  // <0055> call :spinwait
addr == 16'h09 ? 16'hfc00 :  // <0055> call :spinwait

// increment LEDs
addr == 16'h0a ? 16'h0009 :  // <0058> a = leds
addr == 16'h0b ? 16'h0601 :  // <0059> b = 1
addr == 16'h0c ? 16'hc800 :  // <0060> nop
addr == 16'h0d ? 16'h2700 :  // <0061> leds = a+b

// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 16'h0e ? 16'h0fa0 :  // <0064> j = :msg
addr == 16'h0f ? 16'h003f :  // <0064> j = :msg
addr == 16'h10 ? 16'hc800 :  // <0065> nop
addr == 16'h11 ? 16'hd310 :  // <0066> fetch g7 from i+j
addr == 16'h12 ? 16'h1fb0 :  // <0066> fetch g7 from i+j
addr == 16'h13 ? 16'hfba0 :  // <0067> call :putchar
addr == 16'h14 ? 16'h0020 :  // <0067> call :putchar
addr == 16'h15 ? 16'hfc00 :  // <0067> call :putchar

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


// routine sends out the low byte from g7 to the UART.  blocks until the UART accepts the byte.
// func putchar // = 0x0020
addr == 16'h20 ? 16'h2807 :  // <0085> av_writedata = g7
addr == 16'h21 ? 16'h2fa0 :  // <0086> av_address = $jtag_uart_data
addr == 16'h22 ? 16'h0100 :  // <0086> av_address = $jtag_uart_data
addr == 16'h23 ? 16'h3201 :  // <0087> av_ctrl = $av_write_mask
addr == 16'h24 ? 16'h0200 :  // <0088> a = 0
// :wait_for_slave // = 0x0025
addr == 16'h25 ? 16'h040d :  // <0090> b = av_waitrequest
addr == 16'h26 ? 16'hc800 :  // <0091> nop
addr == 16'h27 ? 16'he404 :  // <0092> bn z :wait_for_slave
addr == 16'h28 ? 16'h0025 :  // <0092> bn z :wait_for_slave
addr == 16'h29 ? 16'h3200 :  // <0093> av_ctrl = 0
addr == 16'h2a ? 16'hfc00 :  // <0094> return

// routine waits a number of milliseconds given in g7.
// func spinwait // = 0x002b
addr == 16'h2b ? 16'h2004 :  // <0097> push x // func spinwait
addr == 16'h2c ? 16'h2005 :  // <0097> push y // func spinwait
addr == 16'h2d ? 16'h2007 :  // <0097> push g7 // func spinwait
// :spinwait_outer // = 0x002e
addr == 16'h2e ? 16'h13a0 :  // <0099> x = 12500
addr == 16'h2f ? 16'h30d4 :  // <0099> x = 12500
addr == 16'h30 ? 16'h1760 :  // <0100> y = -1
addr == 16'h31 ? 16'hc800 :  // <0101> nop
// :spinwait_inner // = 0x0032
addr == 16'h32 ? 16'h1320 :  // <0103> x = x+y
addr == 16'h33 ? 16'hc800 :  // <0104> nop
addr == 16'h34 ? 16'he400 :  // <0105> bn 2z :spinwait_inner
addr == 16'h35 ? 16'h0032 :  // <0105> bn 2z :spinwait_inner
addr == 16'h36 ? 16'h1007 :  // <0106> x = g7
addr == 16'h37 ? 16'hc800 :  // <0107> nop
addr == 16'h38 ? 16'h1f20 :  // <0108> g7 = x+y
addr == 16'h39 ? 16'he400 :  // <0109> bn 2z :spinwait_outer
addr == 16'h3a ? 16'h002e :  // <0109> bn 2z :spinwait_outer
addr == 16'h3b ? 16'h1c08 :  // <0110> pop g7 // return
addr == 16'h3c ? 16'h1408 :  // <0110> pop y // return
addr == 16'h3d ? 16'h1008 :  // <0110> pop x // return
addr == 16'h3e ? 16'hfc00 :  // <0110> return

// :msg // = 0x003f
// "1234567890abcdef\n\x00"
addr == 16'h3f ? 16'h3231 :  // <0113> 21
addr == 16'h40 ? 16'h3433 :  // <0113> 43
addr == 16'h41 ? 16'h3635 :  // <0113> 65
addr == 16'h42 ? 16'h3837 :  // <0113> 87
addr == 16'h43 ? 16'h3039 :  // <0113> 09
addr == 16'h44 ? 16'h6261 :  // <0113> ba
addr == 16'h45 ? 16'h6463 :  // <0113> dc
addr == 16'h46 ? 16'h6665 :  // <0113> fe
addr == 16'h47 ? 16'h000a :  // <0113>   

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x0048
addr == 16'h48 ? 16'h2002 :  // <0117> push i // func put4x
addr == 16'h49 ? 16'h2003 :  // <0117> push j // func put4x
addr == 16'h4a ? 16'h2006 :  // <0117> push g6 // func put4x
addr == 16'h4b ? 16'h2007 :  // <0117> push g7 // func put4x
addr == 16'h4c ? 16'h203e :  // <0117> push rtna // func put4x
addr == 16'h4d ? 16'h1800 :  // <0118> g6 = a
addr == 16'h4e ? 16'h07a0 :  // <0119> b = 0xF000
addr == 16'h4f ? 16'hf000 :  // <0119> b = 0xF000
addr == 16'h50 ? 16'h0ba0 :  // <0120> i = :hexdigits
addr == 16'h51 ? 16'h0087 :  // <0120> i = :hexdigits
addr == 16'h52 ? 16'h0330 :  // <0121> a = and
addr == 16'h53 ? 16'h0353 :  // <0122> a = a>>4
addr == 16'h54 ? 16'h0353 :  // <0123> a = a>>4
addr == 16'h55 ? 16'h0f53 :  // <0124> j = a>>4
addr == 16'h56 ? 16'hc800 :  // <0125> nop
addr == 16'h57 ? 16'hd310 :  // <0126> fetch g7 from i+j
addr == 16'h58 ? 16'h1fb0 :  // <0126> fetch g7 from i+j
addr == 16'h59 ? 16'hfba0 :  // <0127> call :putchar
addr == 16'h5a ? 16'h0020 :  // <0127> call :putchar
addr == 16'h5b ? 16'hfc00 :  // <0127> call :putchar

addr == 16'h5c ? 16'h0006 :  // <0129> a = g6
addr == 16'h5d ? 16'h07a0 :  // <0130> b = 0x0F00
addr == 16'h5e ? 16'h0f00 :  // <0130> b = 0x0F00
addr == 16'h5f ? 16'h0ba0 :  // <0131> i = :hexdigits
addr == 16'h60 ? 16'h0087 :  // <0131> i = :hexdigits
addr == 16'h61 ? 16'h0330 :  // <0132> a = and
addr == 16'h62 ? 16'h0353 :  // <0133> a = a>>4
addr == 16'h63 ? 16'h0f53 :  // <0134> j = a>>4
addr == 16'h64 ? 16'hc800 :  // <0135> nop
addr == 16'h65 ? 16'hd310 :  // <0136> fetch g7 from i+j
addr == 16'h66 ? 16'h1fb0 :  // <0136> fetch g7 from i+j
addr == 16'h67 ? 16'hfba0 :  // <0137> call :putchar
addr == 16'h68 ? 16'h0020 :  // <0137> call :putchar
addr == 16'h69 ? 16'hfc00 :  // <0137> call :putchar

addr == 16'h6a ? 16'h0006 :  // <0139> a = g6
addr == 16'h6b ? 16'h06f0 :  // <0140> b = 0x00F0
addr == 16'h6c ? 16'h0ba0 :  // <0141> i = :hexdigits
addr == 16'h6d ? 16'h0087 :  // <0141> i = :hexdigits
addr == 16'h6e ? 16'h0330 :  // <0142> a = and
addr == 16'h6f ? 16'h0f53 :  // <0143> j = a>>4
addr == 16'h70 ? 16'hc800 :  // <0144> nop
addr == 16'h71 ? 16'hd310 :  // <0145> fetch g7 from i+j
addr == 16'h72 ? 16'h1fb0 :  // <0145> fetch g7 from i+j
addr == 16'h73 ? 16'hfba0 :  // <0146> call :putchar
addr == 16'h74 ? 16'h0020 :  // <0146> call :putchar
addr == 16'h75 ? 16'hfc00 :  // <0146> call :putchar

addr == 16'h76 ? 16'h0006 :  // <0148> a = g6
addr == 16'h77 ? 16'h060f :  // <0149> b = 0x000F
addr == 16'h78 ? 16'h0ba0 :  // <0150> i = :hexdigits
addr == 16'h79 ? 16'h0087 :  // <0150> i = :hexdigits
addr == 16'h7a ? 16'h0f30 :  // <0151> j = and
addr == 16'h7b ? 16'hc800 :  // <0152> nop
addr == 16'h7c ? 16'hd310 :  // <0153> fetch g7 from i+j
addr == 16'h7d ? 16'h1fb0 :  // <0153> fetch g7 from i+j
addr == 16'h7e ? 16'hfba0 :  // <0154> call :putchar
addr == 16'h7f ? 16'h0020 :  // <0154> call :putchar
addr == 16'h80 ? 16'hfc00 :  // <0154> call :putchar

addr == 16'h81 ? 16'hf808 :  // <0156> pop rtna // return
addr == 16'h82 ? 16'h1c08 :  // <0156> pop g7 // return
addr == 16'h83 ? 16'h1808 :  // <0156> pop g6 // return
addr == 16'h84 ? 16'h0c08 :  // <0156> pop j // return
addr == 16'h85 ? 16'h0808 :  // <0156> pop i // return
addr == 16'h86 ? 16'hfc00 :  // <0156> return

// :hexdigits // = 0x0087
// "0123456789abcdef"
addr == 16'h87 ? 16'h3130 :  // <0159> 10
addr == 16'h88 ? 16'h3332 :  // <0159> 32
addr == 16'h89 ? 16'h3534 :  // <0159> 54
addr == 16'h8a ? 16'h3736 :  // <0159> 76
addr == 16'h8b ? 16'h3938 :  // <0159> 98
addr == 16'h8c ? 16'h6261 :  // <0159> ba
addr == 16'h8d ? 16'h6463 :  // <0159> dc
addr == 16'h8e ? 16'h6665 :  // <0159> fe


        
                16'hxxxx;
        endmodule
    
