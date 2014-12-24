
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
// JTAG UART notes:
// - on read, program MUST test bit 15 of jtag_uart_data_lsw.  jtag uart continues to
// report the same data byte on subsequent reads when no further data has arrived.
// bit 15 RVALID = 1 is the only indication of proper data.
// - reading jtag_uart_data_msw also counts as a FIFO read, causing loss of a data byte,
// probably because jtag uart has no byteenable wires.
// - on write, the data is lost if the write FIFO is full.  Avalon is not stalled.
// alias_both av_ctrl          [incr counter]
//    vdefine av_write_mask                   0x0001
// alias_src  av_waitrequest   [incr counter]



// :begin // = 0x0000
addr == 16'h00 ? 16'h2601 :  // <0048> leds = 1
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
addr == 16'h01 ? 16'h1200 :  // <0091> x = 0
addr == 16'h02 ? 16'h1601 :  // <0092> y = 1
// :patch // = 0x0003

addr == 16'h03 ? 16'h0009 :  // <0095> a = leds
addr == 16'h04 ? 16'h0601 :  // <0096> b = 1
addr == 16'h05 ? 16'hc800 :  // <0097> nop
addr == 16'h06 ? 16'h2700 :  // <0098> leds = a+b

// // Avalon write to JTAG UART.
// putasc A
// putasc B
// putasc C
// putasc D
// putasc E
// putasc F
// putasc G
// putasc H
// putasc I
// putasc J
// putasc K
// putasc L
// putasc M
// putasc N

// // Avalon read from JTAG UART.
// :poll_jtag_uart
// a = 0x1234
// call put4x
// a = 1000
// call :spinwait
// putasc "/"
// a = 1000
// call :spinwait
// av_ad_hi = $jtag_uart_data_lsw_hi
// av_ad_lo = $jtag_uart_data_lsw_lo
// a = av_write_data
// a = av_read_data
// call put4x
// a = 1000
// call :spinwait
// putasc ","
// a = 1000
// call :spinwait
// av_ad_hi = $jtag_uart_data_msw_hi
// av_ad_lo = $jtag_uart_data_msw_lo
// a = av_write_data
// a = av_read_data
// call put4x
// a = 1000
// call :spinwait
// putasc ","
// a = 1000
// call :spinwait
// av_ad_hi = $jtag_uart_ctrl_lsw_hi
// av_ad_lo = $jtag_uart_ctrl_lsw_lo
// a = av_write_data
// a = av_read_data
// call put4x
// a = 1000
// call :spinwait
// putasc ","
// a = 1000
// call :spinwait
// av_ad_hi = $jtag_uart_ctrl_msw_hi
// av_ad_lo = $jtag_uart_ctrl_msw_lo
// a = av_write_data
// a = av_read_data
// call put4x
// a = 1000
// call :spinwait
// putasc "/"
// a = 1000
// call :spinwait
// a = 0x5678
// call put4x
// a = 1000
// call :spinwait
// putasc "\r"
// putasc "\n"
// a = 1000
// call :spinwait
// jmp :poll_jtag_uart

// Avalon write to SDRAM.
addr == 16'h07 ? 16'h3200 :  // <0176> av_ad_hi = 0
addr == 16'h08 ? 16'h3620 :  // <0177> av_ad_lo = 0x20
addr == 16'h09 ? 16'h2ba0 :  // <0178> av_write_data = 0x6789
addr == 16'h0a ? 16'h6789 :  // <0178> "
// Avalon read from SDRAM.
addr == 16'h0b ? 16'h000a :  // <0180> a = av_write_data
addr == 16'h0c ? 16'h000b :  // <0181> a = av_read_data
addr == 16'h0d ? 16'hfba0 :  // <0182> call put4x
addr == 16'h0e ? 16'h00bc :  // <0182> "
addr == 16'h0f ? 16'hfc00 :  // <0182> "
addr == 16'h10 ? 16'h03a0 :  // <0183> a = 1000
addr == 16'h11 ? 16'h03e8 :  // <0183> "
addr == 16'h12 ? 16'hfba0 :  // <0184> call :spinwait
addr == 16'h13 ? 16'h007d :  // <0184> "
addr == 16'h14 ? 16'hfc00 :  // <0184> "

// fill SDRAM first page with a pattern.
addr == 16'h15 ? 16'h0257 :  // <0187> a = 87 // putasc W
addr == 16'h16 ? 16'h33a0 :  // <0187> putasc W
addr == 16'h17 ? 16'h0200 :  // <0187> "
addr == 16'h18 ? 16'h3600 :  // <0187> "
addr == 16'h19 ? 16'h2800 :  // <0187> "
addr == 16'h1a ? 16'h1200 :  // <0188> x = 0x0000
// :fill_more // = 0x001b
addr == 16'h1b ? 16'h3200 :  // <0190> av_ad_hi = 0
addr == 16'h1c ? 16'h3404 :  // <0191> av_ad_lo = x
addr == 16'h1d ? 16'h0004 :  // <0192> a = x
addr == 16'h1e ? 16'h0760 :  // <0193> b = 0xffff
addr == 16'h1f ? 16'hc800 :  // <0194> nop
addr == 16'h20 ? 16'h1b38 :  // <0195> g6 = xor
addr == 16'h21 ? 16'h2806 :  // <0196> av_write_data = g6
addr == 16'h22 ? 16'h1602 :  // <0197> y = 2
addr == 16'h23 ? 16'hc800 :  // <0198> nop
addr == 16'h24 ? 16'h1320 :  // <0199> x = x+y
addr == 16'h25 ? 16'he400 :  // <0200> bn 2z :fill_more
addr == 16'h26 ? 16'h001b :  // <0200> "

// verify pattern in SDRAM.
addr == 16'h27 ? 16'h1200 :  // <0203> x = 0x0000
// :verify_more // = 0x0028
addr == 16'h28 ? 16'h3200 :  // <0205> av_ad_hi = 0
addr == 16'h29 ? 16'h3404 :  // <0206> av_ad_lo = x
addr == 16'h2a ? 16'h180a :  // <0207> g6 = av_write_data
addr == 16'h2b ? 16'h180b :  // <0208> g6 = av_read_data
addr == 16'h2c ? 16'h0004 :  // <0209> a = x
addr == 16'h2d ? 16'hfba0 :  // <0210> call put4x
addr == 16'h2e ? 16'h00bc :  // <0210> "
addr == 16'h2f ? 16'hfc00 :  // <0210> "
addr == 16'h30 ? 16'h023d :  // <0211> a = 61 // putasc "="
addr == 16'h31 ? 16'h33a0 :  // <0211> putasc "="
addr == 16'h32 ? 16'h0200 :  // <0211> "
addr == 16'h33 ? 16'h3600 :  // <0211> "
addr == 16'h34 ? 16'h2800 :  // <0211> "
addr == 16'h35 ? 16'h03a0 :  // <0212> a = 500
addr == 16'h36 ? 16'h01f4 :  // <0212> "
addr == 16'h37 ? 16'hfba0 :  // <0213> call :spinwait
addr == 16'h38 ? 16'h007d :  // <0213> "
addr == 16'h39 ? 16'hfc00 :  // <0213> "
addr == 16'h3a ? 16'h0006 :  // <0214> a = g6
addr == 16'h3b ? 16'hfba0 :  // <0215> call put4x
addr == 16'h3c ? 16'h00bc :  // <0215> "
addr == 16'h3d ? 16'hfc00 :  // <0215> "
addr == 16'h3e ? 16'h020d :  // <0216> a = 13 // putasc "\r"
addr == 16'h3f ? 16'h33a0 :  // <0216> putasc "\r"
addr == 16'h40 ? 16'h0200 :  // <0216> "
addr == 16'h41 ? 16'h3600 :  // <0216> "
addr == 16'h42 ? 16'h2800 :  // <0216> "
addr == 16'h43 ? 16'h020a :  // <0217> a = 10 // putasc "\n"
addr == 16'h44 ? 16'h33a0 :  // <0217> putasc "\n"
addr == 16'h45 ? 16'h0200 :  // <0217> "
addr == 16'h46 ? 16'h3600 :  // <0217> "
addr == 16'h47 ? 16'h2800 :  // <0217> "
addr == 16'h48 ? 16'h03a0 :  // <0218> a = 500
addr == 16'h49 ? 16'h01f4 :  // <0218> "
addr == 16'h4a ? 16'hfba0 :  // <0219> call :spinwait
addr == 16'h4b ? 16'h007d :  // <0219> "
addr == 16'h4c ? 16'hfc00 :  // <0219> "
addr == 16'h4d ? 16'h1602 :  // <0220> y = 2
addr == 16'h4e ? 16'hc800 :  // <0221> nop
addr == 16'h4f ? 16'h1320 :  // <0222> x = x+y
addr == 16'h50 ? 16'he400 :  // <0223> bn 2z :verify_more
addr == 16'h51 ? 16'h0028 :  // <0223> "


// :wait_key_press
// a = 0x03
// b = keys
// nop
// br eq :wait_key_press
// :wait_key_release
// b = keys
// nop
// bn eq :wait_key_release

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

addr == 16'h52 ? 16'h0264 :  // <0249> a = 100
addr == 16'h53 ? 16'hfba0 :  // <0250> call :spinwait
addr == 16'h54 ? 16'h007d :  // <0250> "
addr == 16'h55 ? 16'hfc00 :  // <0250> "

// b = 32
// putchar b
// m9k_addr = x
// a = m9k_data
// call put4x

// b = 13
// putchar b
// b = 10
// putchar b

addr == 16'h56 ? 16'he00f :  // <0263> jmp :patch
addr == 16'h57 ? 16'h0003 :  // <0263> "





// using i as index into string.
addr == 16'h58 ? 16'h0a00 :  // <0270> i = 0

// cache the string limit in g6.
addr == 16'h59 ? 16'h0210 :  // <0273> a = 16
addr == 16'h5a ? 16'h0760 :  // <0274> b = 0xffff
addr == 16'h5b ? 16'hc800 :  // <0275> nop
addr == 16'h5c ? 16'h1b38 :  // <0276> g6 = xor

// :again // = 0x005d
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

addr == 16'h5d ? 16'h0264 :  // <0290> a = 100
addr == 16'h5e ? 16'hfba0 :  // <0291> call :spinwait
addr == 16'h5f ? 16'h007d :  // <0291> "
addr == 16'h60 ? 16'hfc00 :  // <0291> "

// increment LEDs
addr == 16'h61 ? 16'h0009 :  // <0294> a = leds
addr == 16'h62 ? 16'h0601 :  // <0295> b = 1
addr == 16'h63 ? 16'hc800 :  // <0296> nop
addr == 16'h64 ? 16'h2700 :  // <0297> leds = a+b

// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 16'h65 ? 16'h0fa0 :  // <0300> j = :msg
addr == 16'h66 ? 16'h0074 :  // <0300> "
addr == 16'h67 ? 16'hc800 :  // <0301> nop
addr == 16'h68 ? 16'hd310 :  // <0302> fetch a from i+j
addr == 16'h69 ? 16'h03b0 :  // <0302> "
//    putchar a

// increment index & wrap around end of pattern.
addr == 16'h6a ? 16'h0e01 :  // <0306> j = 1
addr == 16'h6b ? 16'hc800 :  // <0307> nop
addr == 16'h6c ? 16'h0b10 :  // <0308> i = i+j
addr == 16'h6d ? 16'h0c06 :  // <0309> j = g6
addr == 16'h6e ? 16'hc800 :  // <0310> nop
addr == 16'h6f ? 16'he401 :  // <0311> bn 1z :no_wrap
addr == 16'h70 ? 16'h0072 :  // <0311> "
addr == 16'h71 ? 16'h0a00 :  // <0312> i = 0
// :no_wrap // = 0x0072

// repeat forever.
addr == 16'h72 ? 16'he00f :  // <0316> jmp :again
addr == 16'h73 ? 16'h005d :  // <0316> "

// :msg // = 0x0074
// "1234567890abcdef\n\x00"
addr == 16'h74 ? 16'h3231 :  // <0319> 21
addr == 16'h75 ? 16'h3433 :  // <0319> 43
addr == 16'h76 ? 16'h3635 :  // <0319> 65
addr == 16'h77 ? 16'h3837 :  // <0319> 87
addr == 16'h78 ? 16'h3039 :  // <0319> 09
addr == 16'h79 ? 16'h6261 :  // <0319> ba
addr == 16'h7a ? 16'h6463 :  // <0319> dc
addr == 16'h7b ? 16'h6665 :  // <0319> fe
addr == 16'h7c ? 16'h000a :  // <0319>   

// routine waits a number of milliseconds given in a.
// func spinwait // = 0x007d
addr == 16'h7d ? 16'h2004 :  // <0322> push x // func spinwait
addr == 16'h7e ? 16'h2005 :  // <0322> push y // "
//patch
//return
addr == 16'h7f ? 16'h0760 :  // <0325> b = -1
// :spinwait_outer // = 0x0080
addr == 16'h80 ? 16'h13a0 :  // <0327> x = 12500
addr == 16'h81 ? 16'h30d4 :  // <0327> "
addr == 16'h82 ? 16'h1760 :  // <0328> y = -1
addr == 16'h83 ? 16'hc800 :  // <0329> nop
// :spinwait_inner // = 0x0084
addr == 16'h84 ? 16'h1320 :  // <0331> x = x+y
addr == 16'h85 ? 16'hc800 :  // <0332> nop
addr == 16'h86 ? 16'he400 :  // <0333> bn 2z :spinwait_inner
addr == 16'h87 ? 16'h0084 :  // <0333> "
addr == 16'h88 ? 16'h0300 :  // <0334> a = a+b
addr == 16'h89 ? 16'hc800 :  // <0335> nop
addr == 16'h8a ? 16'he404 :  // <0336> bn z :spinwait_outer
addr == 16'h8b ? 16'h0080 :  // <0336> "
addr == 16'h8c ? 16'h1408 :  // <0337> pop y // return
addr == 16'h8d ? 16'h1008 :  // <0337> pop x // "
addr == 16'h8e ? 16'hfc00 :  // <0337> return

// compute the modulus(255) of a number given in a.  return remainder in a.
// func mod255 // = 0x008f
addr == 16'h8f ? 16'h2006 :  // <0340> push g6 // func mod255
addr == 16'h90 ? 16'h2007 :  // <0340> push g7 // "
// while a is greater than 254, subtract 255.
// :mod255_again // = 0x0091
addr == 16'h91 ? 16'h06fe :  // <0343> b = 0xfe
addr == 16'h92 ? 16'hc800 :  // <0344> nop
addr == 16'h93 ? 16'he006 :  // <0345> br gt :mod255_greater
addr == 16'h94 ? 16'h0098 :  // <0345> "
addr == 16'h95 ? 16'h1c08 :  // <0346> pop g7 // return
addr == 16'h96 ? 16'h1808 :  // <0346> pop g6 // "
addr == 16'h97 ? 16'hfc00 :  // <0346> return
// :mod255_greater // = 0x0098
addr == 16'h98 ? 16'h07a0 :  // <0348> b = 0xff01
addr == 16'h99 ? 16'hff01 :  // <0348> "
addr == 16'h9a ? 16'hc800 :  // <0349> nop
addr == 16'h9b ? 16'h0300 :  // <0350> a = a+b
addr == 16'h9c ? 16'he00f :  // <0351> jmp :mod255_again
addr == 16'h9d ? 16'h0091 :  // <0351> "

// set up Fletcher16 checksum algorithm to accumulate in the 2 given register names.

addr == 16'h9e ? 16'h1a00 :  // <0361> fletcher16_init g6 g7
addr == 16'h9f ? 16'h1e00 :  // <0361> "

// accumulate a Fletcher16 checksum in g6 and g7,
// given the next byte of data in a.
// func fletcher16_input // = 0x00a0
addr == 16'ha0 ? 16'h2006 :  // <0365> push g6 // func fletcher16_input
addr == 16'ha1 ? 16'h2007 :  // <0365> push g7 // "
addr == 16'ha2 ? 16'h203e :  // <0365> push rtna // "
//patch: need a way to declare summing registers as "static" or "preserve" so they're not auto-stacked.
addr == 16'ha3 ? 16'h0406 :  // <0367> b = $fletcher_sum1_reg
addr == 16'ha4 ? 16'hc800 :  // <0368> nop
addr == 16'ha5 ? 16'h0300 :  // <0369> a = a+b
addr == 16'ha6 ? 16'hfba0 :  // <0370> call :mod255
addr == 16'ha7 ? 16'h008f :  // <0370> "
addr == 16'ha8 ? 16'hfc00 :  // <0370> "
addr == 16'ha9 ? 16'h1800 :  // <0371> $fletcher_sum1_reg = a

addr == 16'haa ? 16'h0407 :  // <0373> b = $fletcher_sum2_reg
addr == 16'hab ? 16'hc800 :  // <0374> nop
addr == 16'hac ? 16'h0300 :  // <0375> a = a+b
addr == 16'had ? 16'hfba0 :  // <0376> call :mod255
addr == 16'hae ? 16'h008f :  // <0376> "
addr == 16'haf ? 16'hfc00 :  // <0376> "
addr == 16'hb0 ? 16'h1c00 :  // <0377> $fletcher_sum2_reg = a
addr == 16'hb1 ? 16'hf808 :  // <0378> pop rtna // return
addr == 16'hb2 ? 16'h1c08 :  // <0378> pop g7 // "
addr == 16'hb3 ? 16'h1808 :  // <0378> pop g6 // "
addr == 16'hb4 ? 16'hfc00 :  // <0378> return

// return the combined 16-bit result of Fletcher16 checksum in a.
// func fletcher16_result // = 0x00b5
addr == 16'hb5 ? 16'h0007 :  // <0382> a = $fletcher_sum2_reg
addr == 16'hb6 ? 16'h0352 :  // <0383> a = a<<4
addr == 16'hb7 ? 16'h0352 :  // <0384> a = a<<4
addr == 16'hb8 ? 16'h0406 :  // <0385> b = $fletcher_sum1_reg
addr == 16'hb9 ? 16'hc800 :  // <0386> nop
addr == 16'hba ? 16'h0334 :  // <0387> a = or
addr == 16'hbb ? 16'hfc00 :  // <0388> return

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x00bc
addr == 16'hbc ? 16'h2004 :  // <0392> push x // func put4x
addr == 16'hbd ? 16'h2006 :  // <0392> push g6 // "
addr == 16'hbe ? 16'h203e :  // <0392> push rtna // "
addr == 16'hbf ? 16'h13a0 :  // <0393> x = :hexdigits
addr == 16'hc0 ? 16'h00f9 :  // <0393> "

addr == 16'hc1 ? 16'h1800 :  // <0395> g6 = a
addr == 16'hc2 ? 16'h07a0 :  // <0396> b = 0xF000
addr == 16'hc3 ? 16'hf000 :  // <0396> "
addr == 16'hc4 ? 16'hc800 :  // <0397> nop
addr == 16'hc5 ? 16'h0330 :  // <0398> a = and
addr == 16'hc6 ? 16'h0353 :  // <0399> a = a>>4
addr == 16'hc7 ? 16'h0353 :  // <0400> a = a>>4
addr == 16'hc8 ? 16'h0353 :  // <0401> a = a>>4
addr == 16'hc9 ? 16'hfba0 :  // <0402> call fetch_byte
addr == 16'hca ? 16'h0101 :  // <0402> "
addr == 16'hcb ? 16'hfc00 :  // <0402> "
addr == 16'hcc ? 16'h33a0 :  // <0403> putchar a
addr == 16'hcd ? 16'h0200 :  // <0403> "
addr == 16'hce ? 16'h3600 :  // <0403> "
addr == 16'hcf ? 16'h2800 :  // <0403> "

addr == 16'hd0 ? 16'h0006 :  // <0405> a = g6
addr == 16'hd1 ? 16'h07a0 :  // <0406> b = 0x0F00
addr == 16'hd2 ? 16'h0f00 :  // <0406> "
addr == 16'hd3 ? 16'hc800 :  // <0407> nop
addr == 16'hd4 ? 16'h0330 :  // <0408> a = and
addr == 16'hd5 ? 16'h0353 :  // <0409> a = a>>4
addr == 16'hd6 ? 16'h0353 :  // <0410> a = a>>4
addr == 16'hd7 ? 16'hfba0 :  // <0411> call fetch_byte
addr == 16'hd8 ? 16'h0101 :  // <0411> "
addr == 16'hd9 ? 16'hfc00 :  // <0411> "
addr == 16'hda ? 16'h33a0 :  // <0412> putchar a
addr == 16'hdb ? 16'h0200 :  // <0412> "
addr == 16'hdc ? 16'h3600 :  // <0412> "
addr == 16'hdd ? 16'h2800 :  // <0412> "

addr == 16'hde ? 16'h0006 :  // <0414> a = g6
addr == 16'hdf ? 16'h06f0 :  // <0415> b = 0x00F0
addr == 16'he0 ? 16'hc800 :  // <0416> nop
addr == 16'he1 ? 16'h0330 :  // <0417> a = and
addr == 16'he2 ? 16'h0353 :  // <0418> a = a>>4
addr == 16'he3 ? 16'hfba0 :  // <0419> call fetch_byte
addr == 16'he4 ? 16'h0101 :  // <0419> "
addr == 16'he5 ? 16'hfc00 :  // <0419> "
addr == 16'he6 ? 16'h33a0 :  // <0420> putchar a
addr == 16'he7 ? 16'h0200 :  // <0420> "
addr == 16'he8 ? 16'h3600 :  // <0420> "
addr == 16'he9 ? 16'h2800 :  // <0420> "

addr == 16'hea ? 16'h0006 :  // <0422> a = g6
addr == 16'heb ? 16'h060f :  // <0423> b = 0x000F
addr == 16'hec ? 16'hc800 :  // <0424> nop
addr == 16'hed ? 16'h0330 :  // <0425> a = and
addr == 16'hee ? 16'hfba0 :  // <0426> call fetch_byte
addr == 16'hef ? 16'h0101 :  // <0426> "
addr == 16'hf0 ? 16'hfc00 :  // <0426> "
addr == 16'hf1 ? 16'h33a0 :  // <0427> putchar a
addr == 16'hf2 ? 16'h0200 :  // <0427> "
addr == 16'hf3 ? 16'h3600 :  // <0427> "
addr == 16'hf4 ? 16'h2800 :  // <0427> "

addr == 16'hf5 ? 16'hf808 :  // <0429> pop rtna // return
addr == 16'hf6 ? 16'h1808 :  // <0429> pop g6 // "
addr == 16'hf7 ? 16'h1008 :  // <0429> pop x // "
addr == 16'hf8 ? 16'hfc00 :  // <0429> return

// :hexdigits // = 0x00f9
// "0123456789abcdef"
addr == 16'hf9 ? 16'h3130 :  // <0432> 10
addr == 16'hfa ? 16'h3332 :  // <0432> 32
addr == 16'hfb ? 16'h3534 :  // <0432> 54
addr == 16'hfc ? 16'h3736 :  // <0432> 76
addr == 16'hfd ? 16'h3938 :  // <0432> 98
addr == 16'hfe ? 16'h6261 :  // <0432> ba
addr == 16'hff ? 16'h6463 :  // <0432> dc
addr == 16'h100 ? 16'h6665 :  // <0432> fe

// pick a byte from an array of words.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// func fetch_byte // = 0x0101
addr == 16'h101 ? 16'h0601 :  // <0437> b = 1
addr == 16'h102 ? 16'hc800 :  // <0438> nop
addr == 16'h103 ? 16'he002 :  // <0439> br and0z :pick_byte_even
addr == 16'h104 ? 16'h010d :  // <0439> "
addr == 16'h105 ? 16'h0350 :  // <0440> a = a>>1
addr == 16'h106 ? 16'h0404 :  // <0441> b = x
addr == 16'h107 ? 16'hc800 :  // <0442> nop
addr == 16'h108 ? 16'hd300 :  // <0443> fetch a from a+b
addr == 16'h109 ? 16'h03b0 :  // <0443> "
addr == 16'h10a ? 16'h0353 :  // <0444> a = a>>4
addr == 16'h10b ? 16'h0353 :  // <0445> a = a>>4
addr == 16'h10c ? 16'hfc00 :  // <0446> return
// :pick_byte_even // = 0x010d
addr == 16'h10d ? 16'h0350 :  // <0448> a = a>>1
addr == 16'h10e ? 16'h0404 :  // <0449> b = x
addr == 16'h10f ? 16'hc800 :  // <0450> nop
addr == 16'h110 ? 16'hd300 :  // <0451> fetch a from a+b
addr == 16'h111 ? 16'h03b0 :  // <0451> "
addr == 16'h112 ? 16'h06ff :  // <0452> b = 0xff
addr == 16'h113 ? 16'hc800 :  // <0453> nop
addr == 16'h114 ? 16'h0330 :  // <0454> a = and
addr == 16'h115 ? 16'hfc00 :  // <0455> return

        
                16'hxxxx;
        endmodule
    
