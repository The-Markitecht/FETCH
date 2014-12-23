
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

// all Avalon addresses are BYTE addresses.  all Avalon sizes are in BYTES.
// alias_both av_ctrl          [incr counter]
//    vdefine av_write_mask                   0x0001
// alias_src  av_waitrequest   [incr counter]



// :begin // = 0x0000
addr == 16'h00 ? 16'h2601 :  // <0040> leds = 1
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
addr == 16'h01 ? 16'h1200 :  // <0083> x = 0
addr == 16'h02 ? 16'h1601 :  // <0084> y = 1
// :patch // = 0x0003

addr == 16'h03 ? 16'h0009 :  // <0087> a = leds
addr == 16'h04 ? 16'h0601 :  // <0088> b = 1
addr == 16'h05 ? 16'hc800 :  // <0089> nop
addr == 16'h06 ? 16'h2700 :  // <0090> leds = a+b

// Avalon write to JTAG UART.
addr == 16'h07 ? 16'h0241 :  // <0093> a = 65 // putasc A
addr == 16'h08 ? 16'h2800 :  // <0093> putasc A
addr == 16'h09 ? 16'h2fa0 :  // <0093> "
addr == 16'h0a ? 16'h0200 :  // <0093> "
addr == 16'h0b ? 16'h3200 :  // <0093> "
addr == 16'h0c ? 16'h0242 :  // <0094> a = 66 // putasc B
addr == 16'h0d ? 16'h2800 :  // <0094> putasc B
addr == 16'h0e ? 16'h2fa0 :  // <0094> "
addr == 16'h0f ? 16'h0200 :  // <0094> "
addr == 16'h10 ? 16'h3200 :  // <0094> "
addr == 16'h11 ? 16'h0243 :  // <0095> a = 67 // putasc C
addr == 16'h12 ? 16'h2800 :  // <0095> putasc C
addr == 16'h13 ? 16'h2fa0 :  // <0095> "
addr == 16'h14 ? 16'h0200 :  // <0095> "
addr == 16'h15 ? 16'h3200 :  // <0095> "

// Avalon read from JTAG UART.
// :poll_jtag_uart // = 0x0016
addr == 16'h16 ? 16'h03a0 :  // <0099> a = 1000
addr == 16'h17 ? 16'h03e8 :  // <0099> "
addr == 16'h18 ? 16'hfba0 :  // <0100> call :spinwait
addr == 16'h19 ? 16'h00d8 :  // <0100> "
addr == 16'h1a ? 16'hfc00 :  // <0100> "

addr == 16'h1b ? 16'h03a0 :  // <0102> a = 0x1234
addr == 16'h1c ? 16'h1234 :  // <0102> "
addr == 16'h1d ? 16'hfba0 :  // <0103> call put4x
addr == 16'h1e ? 16'h0117 :  // <0103> "
addr == 16'h1f ? 16'hfc00 :  // <0103> "
addr == 16'h20 ? 16'h03a0 :  // <0104> a = 1000
addr == 16'h21 ? 16'h03e8 :  // <0104> "
addr == 16'h22 ? 16'hfba0 :  // <0105> call :spinwait
addr == 16'h23 ? 16'h00d8 :  // <0105> "
addr == 16'h24 ? 16'hfc00 :  // <0105> "
addr == 16'h25 ? 16'h022f :  // <0106> a = 47 // putasc "/"
addr == 16'h26 ? 16'h2800 :  // <0106> putasc "/"
addr == 16'h27 ? 16'h2fa0 :  // <0106> "
addr == 16'h28 ? 16'h0200 :  // <0106> "
addr == 16'h29 ? 16'h3200 :  // <0106> "
addr == 16'h2a ? 16'h03a0 :  // <0107> a = 1000
addr == 16'h2b ? 16'h03e8 :  // <0107> "
addr == 16'h2c ? 16'hfba0 :  // <0108> call :spinwait
addr == 16'h2d ? 16'h00d8 :  // <0108> "
addr == 16'h2e ? 16'hfc00 :  // <0108> "
addr == 16'h2f ? 16'h2fa0 :  // <0109> av_ad_hi = $jtag_uart_data_lsw_hi
addr == 16'h30 ? 16'h0200 :  // <0109> "
addr == 16'h31 ? 16'h3200 :  // <0110> av_ad_lo = $jtag_uart_data_lsw_lo
addr == 16'h32 ? 16'h000a :  // <0111> a = av_data
addr == 16'h33 ? 16'hfba0 :  // <0112> call put4x
addr == 16'h34 ? 16'h0117 :  // <0112> "
addr == 16'h35 ? 16'hfc00 :  // <0112> "
addr == 16'h36 ? 16'h03a0 :  // <0113> a = 1000
addr == 16'h37 ? 16'h03e8 :  // <0113> "
addr == 16'h38 ? 16'hfba0 :  // <0114> call :spinwait
addr == 16'h39 ? 16'h00d8 :  // <0114> "
addr == 16'h3a ? 16'hfc00 :  // <0114> "
addr == 16'h3b ? 16'h022c :  // <0115> a = 44 // putasc ","
addr == 16'h3c ? 16'h2800 :  // <0115> putasc ","
addr == 16'h3d ? 16'h2fa0 :  // <0115> "
addr == 16'h3e ? 16'h0200 :  // <0115> "
addr == 16'h3f ? 16'h3200 :  // <0115> "
addr == 16'h40 ? 16'h03a0 :  // <0116> a = 1000
addr == 16'h41 ? 16'h03e8 :  // <0116> "
addr == 16'h42 ? 16'hfba0 :  // <0117> call :spinwait
addr == 16'h43 ? 16'h00d8 :  // <0117> "
addr == 16'h44 ? 16'hfc00 :  // <0117> "
addr == 16'h45 ? 16'h2fa0 :  // <0118> av_ad_hi = $jtag_uart_data_msw_hi
addr == 16'h46 ? 16'h0200 :  // <0118> "
addr == 16'h47 ? 16'h3202 :  // <0119> av_ad_lo = $jtag_uart_data_msw_lo
addr == 16'h48 ? 16'h000a :  // <0120> a = av_data
addr == 16'h49 ? 16'hfba0 :  // <0121> call put4x
addr == 16'h4a ? 16'h0117 :  // <0121> "
addr == 16'h4b ? 16'hfc00 :  // <0121> "
addr == 16'h4c ? 16'h03a0 :  // <0122> a = 1000
addr == 16'h4d ? 16'h03e8 :  // <0122> "
addr == 16'h4e ? 16'hfba0 :  // <0123> call :spinwait
addr == 16'h4f ? 16'h00d8 :  // <0123> "
addr == 16'h50 ? 16'hfc00 :  // <0123> "
addr == 16'h51 ? 16'h022c :  // <0124> a = 44 // putasc ","
addr == 16'h52 ? 16'h2800 :  // <0124> putasc ","
addr == 16'h53 ? 16'h2fa0 :  // <0124> "
addr == 16'h54 ? 16'h0200 :  // <0124> "
addr == 16'h55 ? 16'h3200 :  // <0124> "
addr == 16'h56 ? 16'h03a0 :  // <0125> a = 1000
addr == 16'h57 ? 16'h03e8 :  // <0125> "
addr == 16'h58 ? 16'hfba0 :  // <0126> call :spinwait
addr == 16'h59 ? 16'h00d8 :  // <0126> "
addr == 16'h5a ? 16'hfc00 :  // <0126> "
addr == 16'h5b ? 16'h2fa0 :  // <0127> av_ad_hi = $jtag_uart_ctrl_lsw_hi
addr == 16'h5c ? 16'h0200 :  // <0127> "
addr == 16'h5d ? 16'h3204 :  // <0128> av_ad_lo = $jtag_uart_ctrl_lsw_lo
addr == 16'h5e ? 16'h000a :  // <0129> a = av_data
addr == 16'h5f ? 16'hfba0 :  // <0130> call put4x
addr == 16'h60 ? 16'h0117 :  // <0130> "
addr == 16'h61 ? 16'hfc00 :  // <0130> "
addr == 16'h62 ? 16'h03a0 :  // <0131> a = 1000
addr == 16'h63 ? 16'h03e8 :  // <0131> "
addr == 16'h64 ? 16'hfba0 :  // <0132> call :spinwait
addr == 16'h65 ? 16'h00d8 :  // <0132> "
addr == 16'h66 ? 16'hfc00 :  // <0132> "
addr == 16'h67 ? 16'h022c :  // <0133> a = 44 // putasc ","
addr == 16'h68 ? 16'h2800 :  // <0133> putasc ","
addr == 16'h69 ? 16'h2fa0 :  // <0133> "
addr == 16'h6a ? 16'h0200 :  // <0133> "
addr == 16'h6b ? 16'h3200 :  // <0133> "
addr == 16'h6c ? 16'h03a0 :  // <0134> a = 1000
addr == 16'h6d ? 16'h03e8 :  // <0134> "
addr == 16'h6e ? 16'hfba0 :  // <0135> call :spinwait
addr == 16'h6f ? 16'h00d8 :  // <0135> "
addr == 16'h70 ? 16'hfc00 :  // <0135> "
addr == 16'h71 ? 16'h2fa0 :  // <0136> av_ad_hi = $jtag_uart_ctrl_msw_hi
addr == 16'h72 ? 16'h0200 :  // <0136> "
addr == 16'h73 ? 16'h3206 :  // <0137> av_ad_lo = $jtag_uart_ctrl_msw_lo
addr == 16'h74 ? 16'h000a :  // <0138> a = av_data
addr == 16'h75 ? 16'hfba0 :  // <0139> call put4x
addr == 16'h76 ? 16'h0117 :  // <0139> "
addr == 16'h77 ? 16'hfc00 :  // <0139> "
addr == 16'h78 ? 16'h03a0 :  // <0140> a = 1000
addr == 16'h79 ? 16'h03e8 :  // <0140> "
addr == 16'h7a ? 16'hfba0 :  // <0141> call :spinwait
addr == 16'h7b ? 16'h00d8 :  // <0141> "
addr == 16'h7c ? 16'hfc00 :  // <0141> "
addr == 16'h7d ? 16'h022f :  // <0142> a = 47 // putasc "/"
addr == 16'h7e ? 16'h2800 :  // <0142> putasc "/"
addr == 16'h7f ? 16'h2fa0 :  // <0142> "
addr == 16'h80 ? 16'h0200 :  // <0142> "
addr == 16'h81 ? 16'h3200 :  // <0142> "
addr == 16'h82 ? 16'h03a0 :  // <0143> a = 1000
addr == 16'h83 ? 16'h03e8 :  // <0143> "
addr == 16'h84 ? 16'hfba0 :  // <0144> call :spinwait
addr == 16'h85 ? 16'h00d8 :  // <0144> "
addr == 16'h86 ? 16'hfc00 :  // <0144> "
addr == 16'h87 ? 16'h03a0 :  // <0145> a = 0x5678
addr == 16'h88 ? 16'h5678 :  // <0145> "
addr == 16'h89 ? 16'hfba0 :  // <0146> call put4x
addr == 16'h8a ? 16'h0117 :  // <0146> "
addr == 16'h8b ? 16'hfc00 :  // <0146> "
addr == 16'h8c ? 16'h03a0 :  // <0147> a = 1000
addr == 16'h8d ? 16'h03e8 :  // <0147> "
addr == 16'h8e ? 16'hfba0 :  // <0148> call :spinwait
addr == 16'h8f ? 16'h00d8 :  // <0148> "
addr == 16'h90 ? 16'hfc00 :  // <0148> "
addr == 16'h91 ? 16'h020d :  // <0149> a = 13 // putasc "\r"
addr == 16'h92 ? 16'h2800 :  // <0149> putasc "\r"
addr == 16'h93 ? 16'h2fa0 :  // <0149> "
addr == 16'h94 ? 16'h0200 :  // <0149> "
addr == 16'h95 ? 16'h3200 :  // <0149> "
addr == 16'h96 ? 16'h020a :  // <0150> a = 10 // putasc "\n"
addr == 16'h97 ? 16'h2800 :  // <0150> putasc "\n"
addr == 16'h98 ? 16'h2fa0 :  // <0150> "
addr == 16'h99 ? 16'h0200 :  // <0150> "
addr == 16'h9a ? 16'h3200 :  // <0150> "

addr == 16'h9b ? 16'he00f :  // <0152> jmp :poll_jtag_uart
addr == 16'h9c ? 16'h0016 :  // <0152> "


// Avalon write to SDRAM.  triggered by av_ad_lo.
addr == 16'h9d ? 16'h2ba0 :  // <0156> av_data = 0x6789
addr == 16'h9e ? 16'h6789 :  // <0156> "
addr == 16'h9f ? 16'h2e00 :  // <0157> av_ad_hi = 0
addr == 16'ha0 ? 16'h3220 :  // <0158> av_ad_lo = 0x20
// clear av_data so we can recognize if it doesn't get filled.
addr == 16'ha1 ? 16'h2a00 :  // <0160> av_data = 0
// Avalon read from SDRAM.  triggered by av_ad_lo.
addr == 16'ha2 ? 16'h000c :  // <0162> a = av_ad_lo
addr == 16'ha3 ? 16'h240a :  // <0163> leds = av_data

// :wait_key_press // = 0x00a4
addr == 16'ha4 ? 16'h0203 :  // <0166> a = 0x03
addr == 16'ha5 ? 16'h040d :  // <0167> b = keys
addr == 16'ha6 ? 16'hc800 :  // <0168> nop
addr == 16'ha7 ? 16'he007 :  // <0169> br eq :wait_key_press
addr == 16'ha8 ? 16'h00a4 :  // <0169> "
// :wait_key_release // = 0x00a9
addr == 16'ha9 ? 16'h040d :  // <0171> b = keys
addr == 16'haa ? 16'hc800 :  // <0172> nop
addr == 16'hab ? 16'he407 :  // <0173> bn eq :wait_key_release
addr == 16'hac ? 16'h00a9 :  // <0173> "

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

addr == 16'had ? 16'h0264 :  // <0188> a = 100
addr == 16'hae ? 16'hfba0 :  // <0189> call :spinwait
addr == 16'haf ? 16'h00d8 :  // <0189> "
addr == 16'hb0 ? 16'hfc00 :  // <0189> "

// b = 32
// putchar b
// m9k_addr = x
// a = m9k_data
// call put4x

// b = 13
// putchar b
// b = 10
// putchar b

addr == 16'hb1 ? 16'he00f :  // <0202> jmp :patch
addr == 16'hb2 ? 16'h0003 :  // <0202> "





// using i as index into string.
addr == 16'hb3 ? 16'h0a00 :  // <0209> i = 0

// cache the string limit in g6.
addr == 16'hb4 ? 16'h0210 :  // <0212> a = 16
addr == 16'hb5 ? 16'h0760 :  // <0213> b = 0xffff
addr == 16'hb6 ? 16'hc800 :  // <0214> nop
addr == 16'hb7 ? 16'h1b38 :  // <0215> g6 = xor

// :again // = 0x00b8
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

addr == 16'hb8 ? 16'h0264 :  // <0229> a = 100
addr == 16'hb9 ? 16'hfba0 :  // <0230> call :spinwait
addr == 16'hba ? 16'h00d8 :  // <0230> "
addr == 16'hbb ? 16'hfc00 :  // <0230> "

// increment LEDs
addr == 16'hbc ? 16'h0009 :  // <0233> a = leds
addr == 16'hbd ? 16'h0601 :  // <0234> b = 1
addr == 16'hbe ? 16'hc800 :  // <0235> nop
addr == 16'hbf ? 16'h2700 :  // <0236> leds = a+b

// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 16'hc0 ? 16'h0fa0 :  // <0239> j = :msg
addr == 16'hc1 ? 16'h00cf :  // <0239> "
addr == 16'hc2 ? 16'hc800 :  // <0240> nop
addr == 16'hc3 ? 16'hd310 :  // <0241> fetch a from i+j
addr == 16'hc4 ? 16'h03b0 :  // <0241> "
//    putchar a

// increment index & wrap around end of pattern.
addr == 16'hc5 ? 16'h0e01 :  // <0245> j = 1
addr == 16'hc6 ? 16'hc800 :  // <0246> nop
addr == 16'hc7 ? 16'h0b10 :  // <0247> i = i+j
addr == 16'hc8 ? 16'h0c06 :  // <0248> j = g6
addr == 16'hc9 ? 16'hc800 :  // <0249> nop
addr == 16'hca ? 16'he401 :  // <0250> bn 1z :no_wrap
addr == 16'hcb ? 16'h00cd :  // <0250> "
addr == 16'hcc ? 16'h0a00 :  // <0251> i = 0
// :no_wrap // = 0x00cd

// repeat forever.
addr == 16'hcd ? 16'he00f :  // <0255> jmp :again
addr == 16'hce ? 16'h00b8 :  // <0255> "

// :msg // = 0x00cf
// "1234567890abcdef\n\x00"
addr == 16'hcf ? 16'h3231 :  // <0258> 21
addr == 16'hd0 ? 16'h3433 :  // <0258> 43
addr == 16'hd1 ? 16'h3635 :  // <0258> 65
addr == 16'hd2 ? 16'h3837 :  // <0258> 87
addr == 16'hd3 ? 16'h3039 :  // <0258> 09
addr == 16'hd4 ? 16'h6261 :  // <0258> ba
addr == 16'hd5 ? 16'h6463 :  // <0258> dc
addr == 16'hd6 ? 16'h6665 :  // <0258> fe
addr == 16'hd7 ? 16'h000a :  // <0258>   

// routine waits a number of milliseconds given in a.
// func spinwait // = 0x00d8
addr == 16'hd8 ? 16'h2004 :  // <0261> push x // func spinwait
addr == 16'hd9 ? 16'h2005 :  // <0261> push y // "
addr == 16'hda ? 16'h0760 :  // <0262> b = -1
// :spinwait_outer // = 0x00db
addr == 16'hdb ? 16'h13a0 :  // <0264> x = 12500
addr == 16'hdc ? 16'h30d4 :  // <0264> "
addr == 16'hdd ? 16'h1760 :  // <0265> y = -1
addr == 16'hde ? 16'hc800 :  // <0266> nop
// :spinwait_inner // = 0x00df
addr == 16'hdf ? 16'h1320 :  // <0268> x = x+y
addr == 16'he0 ? 16'hc800 :  // <0269> nop
addr == 16'he1 ? 16'he400 :  // <0270> bn 2z :spinwait_inner
addr == 16'he2 ? 16'h00df :  // <0270> "
addr == 16'he3 ? 16'h0300 :  // <0271> a = a+b
addr == 16'he4 ? 16'hc800 :  // <0272> nop
addr == 16'he5 ? 16'he404 :  // <0273> bn z :spinwait_outer
addr == 16'he6 ? 16'h00db :  // <0273> "
addr == 16'he7 ? 16'h1408 :  // <0274> pop y // return
addr == 16'he8 ? 16'h1008 :  // <0274> pop x // "
addr == 16'he9 ? 16'hfc00 :  // <0274> return

// compute the modulus(255) of a number given in a.  return remainder in a.
// func mod255 // = 0x00ea
addr == 16'hea ? 16'h2006 :  // <0277> push g6 // func mod255
addr == 16'heb ? 16'h2007 :  // <0277> push g7 // "
// while a is greater than 254, subtract 255.
// :mod255_again // = 0x00ec
addr == 16'hec ? 16'h06fe :  // <0280> b = 0xfe
addr == 16'hed ? 16'hc800 :  // <0281> nop
addr == 16'hee ? 16'he006 :  // <0282> br gt :mod255_greater
addr == 16'hef ? 16'h00f3 :  // <0282> "
addr == 16'hf0 ? 16'h1c08 :  // <0283> pop g7 // return
addr == 16'hf1 ? 16'h1808 :  // <0283> pop g6 // "
addr == 16'hf2 ? 16'hfc00 :  // <0283> return
// :mod255_greater // = 0x00f3
addr == 16'hf3 ? 16'h07a0 :  // <0285> b = 0xff01
addr == 16'hf4 ? 16'hff01 :  // <0285> "
addr == 16'hf5 ? 16'hc800 :  // <0286> nop
addr == 16'hf6 ? 16'h0300 :  // <0287> a = a+b
addr == 16'hf7 ? 16'he00f :  // <0288> jmp :mod255_again
addr == 16'hf8 ? 16'h00ec :  // <0288> "

// set up Fletcher16 checksum algorithm to accumulate in the 2 given register names.

addr == 16'hf9 ? 16'h1a00 :  // <0298> fletcher16_init g6 g7
addr == 16'hfa ? 16'h1e00 :  // <0298> "

// accumulate a Fletcher16 checksum in g6 and g7,
// given the next byte of data in a.
// func fletcher16_input // = 0x00fb
addr == 16'hfb ? 16'h2006 :  // <0302> push g6 // func fletcher16_input
addr == 16'hfc ? 16'h2007 :  // <0302> push g7 // "
addr == 16'hfd ? 16'h203e :  // <0302> push rtna // "
//patch: need a way to declare summing registers as "static" or "preserve" so they're not auto-stacked.
addr == 16'hfe ? 16'h0406 :  // <0304> b = $fletcher_sum1_reg
addr == 16'hff ? 16'hc800 :  // <0305> nop
addr == 16'h100 ? 16'h0300 :  // <0306> a = a+b
addr == 16'h101 ? 16'hfba0 :  // <0307> call :mod255
addr == 16'h102 ? 16'h00ea :  // <0307> "
addr == 16'h103 ? 16'hfc00 :  // <0307> "
addr == 16'h104 ? 16'h1800 :  // <0308> $fletcher_sum1_reg = a

addr == 16'h105 ? 16'h0407 :  // <0310> b = $fletcher_sum2_reg
addr == 16'h106 ? 16'hc800 :  // <0311> nop
addr == 16'h107 ? 16'h0300 :  // <0312> a = a+b
addr == 16'h108 ? 16'hfba0 :  // <0313> call :mod255
addr == 16'h109 ? 16'h00ea :  // <0313> "
addr == 16'h10a ? 16'hfc00 :  // <0313> "
addr == 16'h10b ? 16'h1c00 :  // <0314> $fletcher_sum2_reg = a
addr == 16'h10c ? 16'hf808 :  // <0315> pop rtna // return
addr == 16'h10d ? 16'h1c08 :  // <0315> pop g7 // "
addr == 16'h10e ? 16'h1808 :  // <0315> pop g6 // "
addr == 16'h10f ? 16'hfc00 :  // <0315> return

// return the combined 16-bit result of Fletcher16 checksum in a.
// func fletcher16_result // = 0x0110
addr == 16'h110 ? 16'h0007 :  // <0319> a = $fletcher_sum2_reg
addr == 16'h111 ? 16'h0352 :  // <0320> a = a<<4
addr == 16'h112 ? 16'h0352 :  // <0321> a = a<<4
addr == 16'h113 ? 16'h0406 :  // <0322> b = $fletcher_sum1_reg
addr == 16'h114 ? 16'hc800 :  // <0323> nop
addr == 16'h115 ? 16'h0334 :  // <0324> a = or
addr == 16'h116 ? 16'hfc00 :  // <0325> return

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x0117
addr == 16'h117 ? 16'h2004 :  // <0329> push x // func put4x
addr == 16'h118 ? 16'h2006 :  // <0329> push g6 // "
addr == 16'h119 ? 16'h203e :  // <0329> push rtna // "
addr == 16'h11a ? 16'h13a0 :  // <0330> x = :hexdigits
addr == 16'h11b ? 16'h0154 :  // <0330> "

addr == 16'h11c ? 16'h1800 :  // <0332> g6 = a
addr == 16'h11d ? 16'h07a0 :  // <0333> b = 0xF000
addr == 16'h11e ? 16'hf000 :  // <0333> "
addr == 16'h11f ? 16'hc800 :  // <0334> nop
addr == 16'h120 ? 16'h0330 :  // <0335> a = and
addr == 16'h121 ? 16'h0353 :  // <0336> a = a>>4
addr == 16'h122 ? 16'h0353 :  // <0337> a = a>>4
addr == 16'h123 ? 16'h0353 :  // <0338> a = a>>4
addr == 16'h124 ? 16'hfba0 :  // <0339> call fetch_byte
addr == 16'h125 ? 16'h015c :  // <0339> "
addr == 16'h126 ? 16'hfc00 :  // <0339> "
addr == 16'h127 ? 16'h2800 :  // <0340> putchar a
addr == 16'h128 ? 16'h2fa0 :  // <0340> "
addr == 16'h129 ? 16'h0200 :  // <0340> "
addr == 16'h12a ? 16'h3200 :  // <0340> "

addr == 16'h12b ? 16'h0006 :  // <0342> a = g6
addr == 16'h12c ? 16'h07a0 :  // <0343> b = 0x0F00
addr == 16'h12d ? 16'h0f00 :  // <0343> "
addr == 16'h12e ? 16'hc800 :  // <0344> nop
addr == 16'h12f ? 16'h0330 :  // <0345> a = and
addr == 16'h130 ? 16'h0353 :  // <0346> a = a>>4
addr == 16'h131 ? 16'h0353 :  // <0347> a = a>>4
addr == 16'h132 ? 16'hfba0 :  // <0348> call fetch_byte
addr == 16'h133 ? 16'h015c :  // <0348> "
addr == 16'h134 ? 16'hfc00 :  // <0348> "
addr == 16'h135 ? 16'h2800 :  // <0349> putchar a
addr == 16'h136 ? 16'h2fa0 :  // <0349> "
addr == 16'h137 ? 16'h0200 :  // <0349> "
addr == 16'h138 ? 16'h3200 :  // <0349> "

addr == 16'h139 ? 16'h0006 :  // <0351> a = g6
addr == 16'h13a ? 16'h06f0 :  // <0352> b = 0x00F0
addr == 16'h13b ? 16'hc800 :  // <0353> nop
addr == 16'h13c ? 16'h0330 :  // <0354> a = and
addr == 16'h13d ? 16'h0353 :  // <0355> a = a>>4
addr == 16'h13e ? 16'hfba0 :  // <0356> call fetch_byte
addr == 16'h13f ? 16'h015c :  // <0356> "
addr == 16'h140 ? 16'hfc00 :  // <0356> "
addr == 16'h141 ? 16'h2800 :  // <0357> putchar a
addr == 16'h142 ? 16'h2fa0 :  // <0357> "
addr == 16'h143 ? 16'h0200 :  // <0357> "
addr == 16'h144 ? 16'h3200 :  // <0357> "

addr == 16'h145 ? 16'h0006 :  // <0359> a = g6
addr == 16'h146 ? 16'h060f :  // <0360> b = 0x000F
addr == 16'h147 ? 16'hc800 :  // <0361> nop
addr == 16'h148 ? 16'h0330 :  // <0362> a = and
addr == 16'h149 ? 16'hfba0 :  // <0363> call fetch_byte
addr == 16'h14a ? 16'h015c :  // <0363> "
addr == 16'h14b ? 16'hfc00 :  // <0363> "
addr == 16'h14c ? 16'h2800 :  // <0364> putchar a
addr == 16'h14d ? 16'h2fa0 :  // <0364> "
addr == 16'h14e ? 16'h0200 :  // <0364> "
addr == 16'h14f ? 16'h3200 :  // <0364> "

addr == 16'h150 ? 16'hf808 :  // <0366> pop rtna // return
addr == 16'h151 ? 16'h1808 :  // <0366> pop g6 // "
addr == 16'h152 ? 16'h1008 :  // <0366> pop x // "
addr == 16'h153 ? 16'hfc00 :  // <0366> return

// :hexdigits // = 0x0154
// "0123456789abcdef"
addr == 16'h154 ? 16'h3130 :  // <0369> 10
addr == 16'h155 ? 16'h3332 :  // <0369> 32
addr == 16'h156 ? 16'h3534 :  // <0369> 54
addr == 16'h157 ? 16'h3736 :  // <0369> 76
addr == 16'h158 ? 16'h3938 :  // <0369> 98
addr == 16'h159 ? 16'h6261 :  // <0369> ba
addr == 16'h15a ? 16'h6463 :  // <0369> dc
addr == 16'h15b ? 16'h6665 :  // <0369> fe

// pick a byte from an array of words.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// func fetch_byte // = 0x015c
addr == 16'h15c ? 16'h0601 :  // <0374> b = 1
addr == 16'h15d ? 16'hc800 :  // <0375> nop
addr == 16'h15e ? 16'he002 :  // <0376> br and0z :pick_byte_even
addr == 16'h15f ? 16'h0168 :  // <0376> "
addr == 16'h160 ? 16'h0350 :  // <0377> a = a>>1
addr == 16'h161 ? 16'h0404 :  // <0378> b = x
addr == 16'h162 ? 16'hc800 :  // <0379> nop
addr == 16'h163 ? 16'hd300 :  // <0380> fetch a from a+b
addr == 16'h164 ? 16'h03b0 :  // <0380> "
addr == 16'h165 ? 16'h0353 :  // <0381> a = a>>4
addr == 16'h166 ? 16'h0353 :  // <0382> a = a>>4
addr == 16'h167 ? 16'hfc00 :  // <0383> return
// :pick_byte_even // = 0x0168
addr == 16'h168 ? 16'h0350 :  // <0385> a = a>>1
addr == 16'h169 ? 16'h0404 :  // <0386> b = x
addr == 16'h16a ? 16'hc800 :  // <0387> nop
addr == 16'h16b ? 16'hd300 :  // <0388> fetch a from a+b
addr == 16'h16c ? 16'h03b0 :  // <0388> "
addr == 16'h16d ? 16'hfc00 :  // <0389> return

        
                16'hxxxx;
        endmodule
    
