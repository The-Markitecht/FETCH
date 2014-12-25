
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
// SDRAM notes:
// - all addresses are BYTE addresses.  all must be divisible by 2, because this
// system only supports 16-bit word accesses.  writes to an odd-numbered address
// will be forced to the word boundary instead, overwriting data there.
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



addr == 16'h00 ? 16'he00f :  // <0050> jmp :main
addr == 16'h01 ? 16'h006e :  // <0050> "


// pick a byte from an array of words.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// func fetch_byte // = 0x0002
addr == 16'h02 ? 16'h0601 :  // <0005> b = 1
addr == 16'h03 ? 16'hc800 :  // <0006> nop
addr == 16'h04 ? 16'he002 :  // <0007> br and0z :pick_byte_even
addr == 16'h05 ? 16'h000e :  // <0007> "
addr == 16'h06 ? 16'h0350 :  // <0008> a = a>>1
addr == 16'h07 ? 16'h0404 :  // <0009> b = x
addr == 16'h08 ? 16'hc800 :  // <0010> nop
addr == 16'h09 ? 16'hd300 :  // <0011> fetch a from a+b
addr == 16'h0a ? 16'h03b0 :  // <0011> "
addr == 16'h0b ? 16'h0353 :  // <0012> a = a>>4
addr == 16'h0c ? 16'h0353 :  // <0013> a = a>>4
addr == 16'h0d ? 16'hfc00 :  // <0014> rtn
// :pick_byte_even // = 0x000e
addr == 16'h0e ? 16'h0350 :  // <0016> a = a>>1
addr == 16'h0f ? 16'h0404 :  // <0017> b = x
addr == 16'h10 ? 16'hc800 :  // <0018> nop
addr == 16'h11 ? 16'hd300 :  // <0019> fetch a from a+b
addr == 16'h12 ? 16'h03b0 :  // <0019> "
addr == 16'h13 ? 16'h06ff :  // <0020> b = 0xff
addr == 16'h14 ? 16'hc800 :  // <0021> nop
addr == 16'h15 ? 16'h0330 :  // <0022> a = and
addr == 16'h16 ? 16'hfc00 :  // <0023> rtn


// driver library for JTAG UART accessed by my hardware-assisted Avalon MM master.





// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x0017
addr == 16'h17 ? 16'h2004 :  // <0038> push x // func put4x
addr == 16'h18 ? 16'h2006 :  // <0038> push g6 // "
addr == 16'h19 ? 16'h203e :  // <0038> push rtna // "
addr == 16'h1a ? 16'h13a0 :  // <0039> x = :hexdigits
addr == 16'h1b ? 16'h0054 :  // <0039> "

addr == 16'h1c ? 16'h1800 :  // <0041> g6 = a
addr == 16'h1d ? 16'h07a0 :  // <0042> b = 0xF000
addr == 16'h1e ? 16'hf000 :  // <0042> "
addr == 16'h1f ? 16'hc800 :  // <0043> nop
addr == 16'h20 ? 16'h0330 :  // <0044> a = and
addr == 16'h21 ? 16'h0353 :  // <0045> a = a>>4
addr == 16'h22 ? 16'h0353 :  // <0046> a = a>>4
addr == 16'h23 ? 16'h0353 :  // <0047> a = a>>4
addr == 16'h24 ? 16'hfba0 :  // <0048> call fetch_byte
addr == 16'h25 ? 16'h0002 :  // <0048> "
addr == 16'h26 ? 16'hfc00 :  // <0048> "
addr == 16'h27 ? 16'h33a0 :  // <0049> putchar a
addr == 16'h28 ? 16'h0200 :  // <0049> "
addr == 16'h29 ? 16'h3600 :  // <0049> "
addr == 16'h2a ? 16'h2800 :  // <0049> "

addr == 16'h2b ? 16'h0006 :  // <0051> a = g6
addr == 16'h2c ? 16'h07a0 :  // <0052> b = 0x0F00
addr == 16'h2d ? 16'h0f00 :  // <0052> "
addr == 16'h2e ? 16'hc800 :  // <0053> nop
addr == 16'h2f ? 16'h0330 :  // <0054> a = and
addr == 16'h30 ? 16'h0353 :  // <0055> a = a>>4
addr == 16'h31 ? 16'h0353 :  // <0056> a = a>>4
addr == 16'h32 ? 16'hfba0 :  // <0057> call fetch_byte
addr == 16'h33 ? 16'h0002 :  // <0057> "
addr == 16'h34 ? 16'hfc00 :  // <0057> "
addr == 16'h35 ? 16'h33a0 :  // <0058> putchar a
addr == 16'h36 ? 16'h0200 :  // <0058> "
addr == 16'h37 ? 16'h3600 :  // <0058> "
addr == 16'h38 ? 16'h2800 :  // <0058> "

addr == 16'h39 ? 16'h0006 :  // <0060> a = g6
addr == 16'h3a ? 16'h06f0 :  // <0061> b = 0x00F0
addr == 16'h3b ? 16'hc800 :  // <0062> nop
addr == 16'h3c ? 16'h0330 :  // <0063> a = and
addr == 16'h3d ? 16'h0353 :  // <0064> a = a>>4
addr == 16'h3e ? 16'hfba0 :  // <0065> call fetch_byte
addr == 16'h3f ? 16'h0002 :  // <0065> "
addr == 16'h40 ? 16'hfc00 :  // <0065> "
addr == 16'h41 ? 16'h33a0 :  // <0066> putchar a
addr == 16'h42 ? 16'h0200 :  // <0066> "
addr == 16'h43 ? 16'h3600 :  // <0066> "
addr == 16'h44 ? 16'h2800 :  // <0066> "

addr == 16'h45 ? 16'h0006 :  // <0068> a = g6
addr == 16'h46 ? 16'h060f :  // <0069> b = 0x000F
addr == 16'h47 ? 16'hc800 :  // <0070> nop
addr == 16'h48 ? 16'h0330 :  // <0071> a = and
addr == 16'h49 ? 16'hfba0 :  // <0072> call fetch_byte
addr == 16'h4a ? 16'h0002 :  // <0072> "
addr == 16'h4b ? 16'hfc00 :  // <0072> "
addr == 16'h4c ? 16'h33a0 :  // <0073> putchar a
addr == 16'h4d ? 16'h0200 :  // <0073> "
addr == 16'h4e ? 16'h3600 :  // <0073> "
addr == 16'h4f ? 16'h2800 :  // <0073> "

addr == 16'h50 ? 16'hf808 :  // <0075> pop rtna // rtn
addr == 16'h51 ? 16'h1808 :  // <0075> pop g6 // "
addr == 16'h52 ? 16'h1008 :  // <0075> pop x // "
addr == 16'h53 ? 16'hfc00 :  // <0075> rtn

// :hexdigits // = 0x0054
// "0123456789abcdef"
addr == 16'h54 ? 16'h3130 :  // <0078> 10
addr == 16'h55 ? 16'h3332 :  // <0078> 32
addr == 16'h56 ? 16'h3534 :  // <0078> 54
addr == 16'h57 ? 16'h3736 :  // <0078> 76
addr == 16'h58 ? 16'h3938 :  // <0078> 98
addr == 16'h59 ? 16'h6261 :  // <0078> ba
addr == 16'h5a ? 16'h6463 :  // <0078> dc
addr == 16'h5b ? 16'h6665 :  // <0078> fe


// routine waits a number of milliseconds given in a.
// func spinwait // = 0x005c
addr == 16'h5c ? 16'h2004 :  // <0002> push x // func spinwait
addr == 16'h5d ? 16'h2005 :  // <0002> push y // "
//patch
//return
addr == 16'h5e ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x005f
addr == 16'h5f ? 16'h13a0 :  // <0007> x = 12500
addr == 16'h60 ? 16'h30d4 :  // <0007> "
addr == 16'h61 ? 16'h1760 :  // <0008> y = -1
addr == 16'h62 ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x0063
addr == 16'h63 ? 16'h1320 :  // <0011> x = x+y
addr == 16'h64 ? 16'hc800 :  // <0012> nop
addr == 16'h65 ? 16'he400 :  // <0013> bn 2z :spinwait_inner
addr == 16'h66 ? 16'h0063 :  // <0013> "
addr == 16'h67 ? 16'h0300 :  // <0014> a = a+b
addr == 16'h68 ? 16'hc800 :  // <0015> nop
addr == 16'h69 ? 16'he404 :  // <0016> bn z :spinwait_outer
addr == 16'h6a ? 16'h005f :  // <0016> "
addr == 16'h6b ? 16'h1408 :  // <0017> pop y // rtn
addr == 16'h6c ? 16'h1008 :  // <0017> pop x // "
addr == 16'h6d ? 16'hfc00 :  // <0017> rtn



// :main // = 0x006e
addr == 16'h6e ? 16'h2601 :  // <0058> leds = 1
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
addr == 16'h6f ? 16'h1200 :  // <0101> x = 0
addr == 16'h70 ? 16'h1601 :  // <0102> y = 1
// :patch // = 0x0071

addr == 16'h71 ? 16'h0009 :  // <0105> a = leds
addr == 16'h72 ? 16'h0601 :  // <0106> b = 1
addr == 16'h73 ? 16'hc800 :  // <0107> nop
addr == 16'h74 ? 16'h2700 :  // <0108> leds = a+b

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
addr == 16'h75 ? 16'h3200 :  // <0186> av_ad_hi = 0
addr == 16'h76 ? 16'h3620 :  // <0187> av_ad_lo = 0x20
addr == 16'h77 ? 16'h2ba0 :  // <0188> av_write_data = 0x6789
addr == 16'h78 ? 16'h6789 :  // <0188> "
// Avalon read from SDRAM.
addr == 16'h79 ? 16'h000a :  // <0190> a = av_write_data
addr == 16'h7a ? 16'h000b :  // <0191> a = av_read_data
addr == 16'h7b ? 16'hfba0 :  // <0192> call put4x
addr == 16'h7c ? 16'h0017 :  // <0192> "
addr == 16'h7d ? 16'hfc00 :  // <0192> "
addr == 16'h7e ? 16'h03a0 :  // <0193> a = 1000
addr == 16'h7f ? 16'h03e8 :  // <0193> "
addr == 16'h80 ? 16'hfba0 :  // <0194> call :spinwait
addr == 16'h81 ? 16'h005c :  // <0194> "
addr == 16'h82 ? 16'hfc00 :  // <0194> "

// fill SDRAM first page with a pattern.
addr == 16'h83 ? 16'h0257 :  // <0197> a = 87 // putasc W
addr == 16'h84 ? 16'h33a0 :  // <0197> putasc W
addr == 16'h85 ? 16'h0200 :  // <0197> "
addr == 16'h86 ? 16'h3600 :  // <0197> "
addr == 16'h87 ? 16'h2800 :  // <0197> "
addr == 16'h88 ? 16'h1200 :  // <0198> x = 0x0000
// :fill_more // = 0x0089
addr == 16'h89 ? 16'h3200 :  // <0200> av_ad_hi = 0
addr == 16'h8a ? 16'h3404 :  // <0201> av_ad_lo = x
addr == 16'h8b ? 16'h0004 :  // <0202> a = x
addr == 16'h8c ? 16'h0760 :  // <0203> b = 0xffff
addr == 16'h8d ? 16'hc800 :  // <0204> nop
addr == 16'h8e ? 16'h1b38 :  // <0205> g6 = xor
addr == 16'h8f ? 16'h2806 :  // <0206> av_write_data = g6
addr == 16'h90 ? 16'h1602 :  // <0207> y = 2
addr == 16'h91 ? 16'hc800 :  // <0208> nop
addr == 16'h92 ? 16'h1320 :  // <0209> x = x+y
addr == 16'h93 ? 16'he400 :  // <0210> bn 2z :fill_more
addr == 16'h94 ? 16'h0089 :  // <0210> "

// verify pattern in SDRAM.
addr == 16'h95 ? 16'h1200 :  // <0213> x = 0x0000
// :verify_more // = 0x0096
addr == 16'h96 ? 16'h3200 :  // <0215> av_ad_hi = 0
addr == 16'h97 ? 16'h3404 :  // <0216> av_ad_lo = x
addr == 16'h98 ? 16'h180a :  // <0217> g6 = av_write_data
addr == 16'h99 ? 16'h180b :  // <0218> g6 = av_read_data
addr == 16'h9a ? 16'h0004 :  // <0219> a = x
addr == 16'h9b ? 16'hfba0 :  // <0220> call put4x
addr == 16'h9c ? 16'h0017 :  // <0220> "
addr == 16'h9d ? 16'hfc00 :  // <0220> "
addr == 16'h9e ? 16'h023d :  // <0221> a = 61 // putasc "="
addr == 16'h9f ? 16'h33a0 :  // <0221> putasc "="
addr == 16'ha0 ? 16'h0200 :  // <0221> "
addr == 16'ha1 ? 16'h3600 :  // <0221> "
addr == 16'ha2 ? 16'h2800 :  // <0221> "
addr == 16'ha3 ? 16'h03a0 :  // <0222> a = 500
addr == 16'ha4 ? 16'h01f4 :  // <0222> "
addr == 16'ha5 ? 16'hfba0 :  // <0223> call :spinwait
addr == 16'ha6 ? 16'h005c :  // <0223> "
addr == 16'ha7 ? 16'hfc00 :  // <0223> "
addr == 16'ha8 ? 16'h0006 :  // <0224> a = g6
addr == 16'ha9 ? 16'hfba0 :  // <0225> call put4x
addr == 16'haa ? 16'h0017 :  // <0225> "
addr == 16'hab ? 16'hfc00 :  // <0225> "
addr == 16'hac ? 16'h020d :  // <0226> a = 13 // putasc "\r"
addr == 16'had ? 16'h33a0 :  // <0226> putasc "\r"
addr == 16'hae ? 16'h0200 :  // <0226> "
addr == 16'haf ? 16'h3600 :  // <0226> "
addr == 16'hb0 ? 16'h2800 :  // <0226> "
addr == 16'hb1 ? 16'h020a :  // <0227> a = 10 // putasc "\n"
addr == 16'hb2 ? 16'h33a0 :  // <0227> putasc "\n"
addr == 16'hb3 ? 16'h0200 :  // <0227> "
addr == 16'hb4 ? 16'h3600 :  // <0227> "
addr == 16'hb5 ? 16'h2800 :  // <0227> "
addr == 16'hb6 ? 16'h03a0 :  // <0228> a = 500
addr == 16'hb7 ? 16'h01f4 :  // <0228> "
addr == 16'hb8 ? 16'hfba0 :  // <0229> call :spinwait
addr == 16'hb9 ? 16'h005c :  // <0229> "
addr == 16'hba ? 16'hfc00 :  // <0229> "
addr == 16'hbb ? 16'h1602 :  // <0230> y = 2
addr == 16'hbc ? 16'hc800 :  // <0231> nop
addr == 16'hbd ? 16'h1320 :  // <0232> x = x+y
addr == 16'hbe ? 16'he400 :  // <0233> bn 2z :verify_more
addr == 16'hbf ? 16'h0096 :  // <0233> "


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

addr == 16'hc0 ? 16'h0264 :  // <0259> a = 100
addr == 16'hc1 ? 16'hfba0 :  // <0260> call :spinwait
addr == 16'hc2 ? 16'h005c :  // <0260> "
addr == 16'hc3 ? 16'hfc00 :  // <0260> "

// b = 32
// putchar b
// m9k_addr = x
// a = m9k_data
// call put4x

// b = 13
// putchar b
// b = 10
// putchar b

addr == 16'hc4 ? 16'he00f :  // <0273> jmp :patch
addr == 16'hc5 ? 16'h0071 :  // <0273> "





// using i as index into string.
addr == 16'hc6 ? 16'h0a00 :  // <0280> i = 0

// cache the string limit in g6.
addr == 16'hc7 ? 16'h0210 :  // <0283> a = 16
addr == 16'hc8 ? 16'h0760 :  // <0284> b = 0xffff
addr == 16'hc9 ? 16'hc800 :  // <0285> nop
addr == 16'hca ? 16'h1b38 :  // <0286> g6 = xor

// :again // = 0x00cb
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

addr == 16'hcb ? 16'h0264 :  // <0300> a = 100
addr == 16'hcc ? 16'hfba0 :  // <0301> call :spinwait
addr == 16'hcd ? 16'h005c :  // <0301> "
addr == 16'hce ? 16'hfc00 :  // <0301> "

// increment LEDs
addr == 16'hcf ? 16'h0009 :  // <0304> a = leds
addr == 16'hd0 ? 16'h0601 :  // <0305> b = 1
addr == 16'hd1 ? 16'hc800 :  // <0306> nop
addr == 16'hd2 ? 16'h2700 :  // <0307> leds = a+b

// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 16'hd3 ? 16'h0fa0 :  // <0310> j = :msg
addr == 16'hd4 ? 16'h00e2 :  // <0310> "
addr == 16'hd5 ? 16'hc800 :  // <0311> nop
addr == 16'hd6 ? 16'hd310 :  // <0312> fetch a from i+j
addr == 16'hd7 ? 16'h03b0 :  // <0312> "
//    putchar a

// increment index & wrap around end of pattern.
addr == 16'hd8 ? 16'h0e01 :  // <0316> j = 1
addr == 16'hd9 ? 16'hc800 :  // <0317> nop
addr == 16'hda ? 16'h0b10 :  // <0318> i = i+j
addr == 16'hdb ? 16'h0c06 :  // <0319> j = g6
addr == 16'hdc ? 16'hc800 :  // <0320> nop
addr == 16'hdd ? 16'he401 :  // <0321> bn 1z :no_wrap
addr == 16'hde ? 16'h00e0 :  // <0321> "
addr == 16'hdf ? 16'h0a00 :  // <0322> i = 0
// :no_wrap // = 0x00e0

// repeat forever.
addr == 16'he0 ? 16'he00f :  // <0326> jmp :again
addr == 16'he1 ? 16'h00cb :  // <0326> "

// :msg // = 0x00e2
// "1234567890abcdef\n\x00"
addr == 16'he2 ? 16'h3231 :  // <0329> 21
addr == 16'he3 ? 16'h3433 :  // <0329> 43
addr == 16'he4 ? 16'h3635 :  // <0329> 65
addr == 16'he5 ? 16'h3837 :  // <0329> 87
addr == 16'he6 ? 16'h3039 :  // <0329> 09
addr == 16'he7 ? 16'h6261 :  // <0329> ba
addr == 16'he8 ? 16'h6463 :  // <0329> dc
addr == 16'he9 ? 16'h6665 :  // <0329> fe
addr == 16'hea ? 16'h000a :  // <0329>   


        
                16'hxxxx;
        endmodule
    
