
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


addr == 16'h00 ? 16'he00f :  // <0049> jmp :main
addr == 16'h01 ? 16'h00ff :  // <0049> "

// register names for use by debugger.
addr == 16'h02 ? 16'h000a :  // <0052> ([src rstk])
// "\r\n     a"
addr == 16'h03 ? 16'h0a0d :  // <0053>   
addr == 16'h04 ? 16'h2020 :  // <0053>   
addr == 16'h05 ? 16'h2020 :  // <0053>   
addr == 16'h06 ? 16'h6120 :  // <0053> a 
// "       b"
addr == 16'h07 ? 16'h2020 :  // <0054>   
addr == 16'h08 ? 16'h2020 :  // <0054>   
addr == 16'h09 ? 16'h2020 :  // <0054>   
addr == 16'h0a ? 16'h6220 :  // <0054> b 
// "       i"
addr == 16'h0b ? 16'h2020 :  // <0055>   
addr == 16'h0c ? 16'h2020 :  // <0055>   
addr == 16'h0d ? 16'h2020 :  // <0055>   
addr == 16'h0e ? 16'h6920 :  // <0055> i 
// "       j"
addr == 16'h0f ? 16'h2020 :  // <0056>   
addr == 16'h10 ? 16'h2020 :  // <0056>   
addr == 16'h11 ? 16'h2020 :  // <0056>   
addr == 16'h12 ? 16'h6a20 :  // <0056> j 
// "\r\n     x"
addr == 16'h13 ? 16'h0a0d :  // <0057>   
addr == 16'h14 ? 16'h2020 :  // <0057>   
addr == 16'h15 ? 16'h2020 :  // <0057>   
addr == 16'h16 ? 16'h7820 :  // <0057> x 
// "       y"
addr == 16'h17 ? 16'h2020 :  // <0058>   
addr == 16'h18 ? 16'h2020 :  // <0058>   
addr == 16'h19 ? 16'h2020 :  // <0058>   
addr == 16'h1a ? 16'h7920 :  // <0058> y 
// "      g6"
addr == 16'h1b ? 16'h2020 :  // <0059>   
addr == 16'h1c ? 16'h2020 :  // <0059>   
addr == 16'h1d ? 16'h2020 :  // <0059>   
addr == 16'h1e ? 16'h3667 :  // <0059> 6g
// "      g7"
addr == 16'h1f ? 16'h2020 :  // <0060>   
addr == 16'h20 ? 16'h2020 :  // <0060>   
addr == 16'h21 ? 16'h2020 :  // <0060>   
addr == 16'h22 ? 16'h3767 :  // <0060> 7g
// "\r\n  keys"
addr == 16'h23 ? 16'h0a0d :  // <0061>   
addr == 16'h24 ? 16'h2020 :  // <0061>   
addr == 16'h25 ? 16'h656b :  // <0061> ek
addr == 16'h26 ? 16'h7379 :  // <0061> sy
// "    leds"
addr == 16'h27 ? 16'h2020 :  // <0062>   
addr == 16'h28 ? 16'h2020 :  // <0062>   
addr == 16'h29 ? 16'h656c :  // <0062> el
addr == 16'h2a ? 16'h7364 :  // <0062> sd

// libraries

// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// func fetch_byte // = 0x002b
addr == 16'h2b ? 16'h0601 :  // <0005> b = 1
addr == 16'h2c ? 16'he003 :  // <0006> br and0z :pick_byte_even
addr == 16'h2d ? 16'h0036 :  // <0006> "
addr == 16'h2e ? 16'h0350 :  // <0007> a = a>>1
addr == 16'h2f ? 16'h0404 :  // <0008> b = x
addr == 16'h30 ? 16'hc800 :  // <0009> fetch a from a+b
addr == 16'h31 ? 16'hd300 :  // <0009> "
addr == 16'h32 ? 16'h03b0 :  // <0009> "
addr == 16'h33 ? 16'h0353 :  // <0010> a = a>>4
addr == 16'h34 ? 16'h0353 :  // <0011> a = a>>4
addr == 16'h35 ? 16'hfc00 :  // <0012> rtn
// :pick_byte_even // = 0x0036
addr == 16'h36 ? 16'h0350 :  // <0014> a = a>>1
addr == 16'h37 ? 16'h0404 :  // <0015> b = x
addr == 16'h38 ? 16'hc800 :  // <0016> fetch a from a+b
addr == 16'h39 ? 16'hd300 :  // <0016> "
addr == 16'h3a ? 16'h03b0 :  // <0016> "
addr == 16'h3b ? 16'h06ff :  // <0017> b = 0xff
addr == 16'h3c ? 16'hc800 :  // <0018> a = and
addr == 16'h3d ? 16'h0330 :  // <0018> "
addr == 16'h3e ? 16'hfc00 :  // <0019> rtn

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// func find_in_fetch // = 0x003f
addr == 16'h3f ? 16'h2802 :  // <0027> push i // func find_in_fetch
addr == 16'h40 ? 16'h2803 :  // <0027> push j // "
addr == 16'h41 ? 16'h2805 :  // <0027> push y // "
addr == 16'h42 ? 16'h283e :  // <0027> push rtna // "
addr == 16'h43 ? 16'h1400 :  // <0028> y = a
addr == 16'h44 ? 16'h0f60 :  // <0029> j = -1
// :again // = 0x0045
addr == 16'h45 ? 16'he001 :  // <0031> br iz :fail
addr == 16'h46 ? 16'h0055 :  // <0031> "
addr == 16'h47 ? 16'h0b10 :  // <0032> i = ad1
addr == 16'h48 ? 16'h0002 :  // <0033> a = i
addr == 16'h49 ? 16'hfba0 :  // <0034> call :fetch_byte
addr == 16'h4a ? 16'h002b :  // <0034> "
addr == 16'h4b ? 16'hfc00 :  // <0034> "
addr == 16'h4c ? 16'h0405 :  // <0035> b = y
addr == 16'h4d ? 16'he407 :  // <0036> bn eq :again
addr == 16'h4e ? 16'h0045 :  // <0036> "
// :found // = 0x004f
addr == 16'h4f ? 16'h0002 :  // <0038> a = i
addr == 16'h50 ? 16'hf80a :  // <0039> pop rtna // rtn
addr == 16'h51 ? 16'h140a :  // <0039> pop y // "
addr == 16'h52 ? 16'h0c0a :  // <0039> pop j // "
addr == 16'h53 ? 16'h080a :  // <0039> pop i // "
addr == 16'h54 ? 16'hfc00 :  // <0039> rtn
// :fail // = 0x0055
addr == 16'h55 ? 16'h0360 :  // <0041> a = -1
addr == 16'h56 ? 16'hf80a :  // <0042> pop rtna // rtn
addr == 16'h57 ? 16'h140a :  // <0042> pop y // "
addr == 16'h58 ? 16'h0c0a :  // <0042> pop j // "
addr == 16'h59 ? 16'h080a :  // <0042> pop i // "
addr == 16'h5a ? 16'hfc00 :  // <0042> rtn



// driver library for JTAG UART accessed by my hardware-assisted Avalon MM master.



// func getchar_jtag_func // = 0x005b
addr == 16'h5b ? 16'h07a0 :  // <0031> b = 0x8000
addr == 16'h5c ? 16'h8000 :  // <0031> "
addr == 16'h5d ? 16'h37a0 :  // <0032> av_ad_hi = $::asm::jtag_uart_data_lsw_hi
addr == 16'h5e ? 16'h0200 :  // <0032> "
addr == 16'h5f ? 16'h3a00 :  // <0033> av_ad_lo = $::asm::jtag_uart_data_lsw_lo
// :poll // = 0x0060
addr == 16'h60 ? 16'h000b :  // <0035> a = av_write_data
addr == 16'h61 ? 16'h000c :  // <0036> a = av_read_data
addr == 16'h62 ? 16'he003 :  // <0037> br and0z :poll
addr == 16'h63 ? 16'h0060 :  // <0037> "
addr == 16'h64 ? 16'h06ff :  // <0038> b = 0xff
addr == 16'h65 ? 16'hc800 :  // <0039> a = and
addr == 16'h66 ? 16'h0330 :  // <0039> "
addr == 16'h67 ? 16'hfc00 :  // <0040> rtn

// returns a character in a, or -1 if none.
// func pollchar_jtag_func // = 0x0068
addr == 16'h68 ? 16'h07a0 :  // <0044> b = 0x8000
addr == 16'h69 ? 16'h8000 :  // <0044> "
addr == 16'h6a ? 16'h37a0 :  // <0045> av_ad_hi = $::asm::jtag_uart_data_lsw_hi
addr == 16'h6b ? 16'h0200 :  // <0045> "
addr == 16'h6c ? 16'h3a00 :  // <0046> av_ad_lo = $::asm::jtag_uart_data_lsw_lo
addr == 16'h6d ? 16'h000b :  // <0047> a = av_write_data
addr == 16'h6e ? 16'h000c :  // <0048> a = av_read_data
addr == 16'h6f ? 16'he403 :  // <0049> bn and0z :gotchar
addr == 16'h70 ? 16'h0075 :  // <0049> "
addr == 16'h71 ? 16'h06ff :  // <0050> b = 0xff
addr == 16'h72 ? 16'hc800 :  // <0051> a = and
addr == 16'h73 ? 16'h0330 :  // <0051> "
addr == 16'h74 ? 16'hfc00 :  // <0052> rtn
// :gotchar // = 0x0075
addr == 16'h75 ? 16'h0360 :  // <0054> a = -1
addr == 16'h76 ? 16'hfc00 :  // <0055> rtn

// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x0077
// "0123456789abcdef"
addr == 16'h77 ? 16'h3130 :  // <0054> 10
addr == 16'h78 ? 16'h3332 :  // <0054> 32
addr == 16'h79 ? 16'h3534 :  // <0054> 54
addr == 16'h7a ? 16'h3736 :  // <0054> 76
addr == 16'h7b ? 16'h3938 :  // <0054> 98
addr == 16'h7c ? 16'h6261 :  // <0054> ba
addr == 16'h7d ? 16'h6463 :  // <0054> dc
addr == 16'h7e ? 16'h6665 :  // <0054> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x007f
addr == 16'h7f ? 16'h2804 :  // <0058> push x // func put4x
addr == 16'h80 ? 16'h2806 :  // <0058> push g6 // "
addr == 16'h81 ? 16'h283e :  // <0058> push rtna // "
addr == 16'h82 ? 16'h13a0 :  // <0059> x = :hexdigits
addr == 16'h83 ? 16'h0077 :  // <0059> "

addr == 16'h84 ? 16'h1800 :  // <0061> g6 = a
addr == 16'h85 ? 16'h07a0 :  // <0062> b = 0xF000
addr == 16'h86 ? 16'hf000 :  // <0062> "
addr == 16'h87 ? 16'hc800 :  // <0063> a = and
addr == 16'h88 ? 16'h0330 :  // <0063> "
addr == 16'h89 ? 16'h0353 :  // <0064> a = a>>4
addr == 16'h8a ? 16'h0353 :  // <0065> a = a>>4
addr == 16'h8b ? 16'h0353 :  // <0066> a = a>>4
addr == 16'h8c ? 16'hfba0 :  // <0067> call fetch_byte
addr == 16'h8d ? 16'h002b :  // <0067> "
addr == 16'h8e ? 16'hfc00 :  // <0067> "
addr == 16'h8f ? 16'h37a0 :  // <0068> putchar a
addr == 16'h90 ? 16'h0200 :  // <0068> "
addr == 16'h91 ? 16'h3a00 :  // <0068> "
addr == 16'h92 ? 16'h2c00 :  // <0068> "

addr == 16'h93 ? 16'h0006 :  // <0070> a = g6
addr == 16'h94 ? 16'h07a0 :  // <0071> b = 0x0F00
addr == 16'h95 ? 16'h0f00 :  // <0071> "
addr == 16'h96 ? 16'hc800 :  // <0072> a = and
addr == 16'h97 ? 16'h0330 :  // <0072> "
addr == 16'h98 ? 16'h0353 :  // <0073> a = a>>4
addr == 16'h99 ? 16'h0353 :  // <0074> a = a>>4
addr == 16'h9a ? 16'hfba0 :  // <0075> call fetch_byte
addr == 16'h9b ? 16'h002b :  // <0075> "
addr == 16'h9c ? 16'hfc00 :  // <0075> "
addr == 16'h9d ? 16'h37a0 :  // <0076> putchar a
addr == 16'h9e ? 16'h0200 :  // <0076> "
addr == 16'h9f ? 16'h3a00 :  // <0076> "
addr == 16'ha0 ? 16'h2c00 :  // <0076> "

addr == 16'ha1 ? 16'h0006 :  // <0078> a = g6
addr == 16'ha2 ? 16'h06f0 :  // <0079> b = 0x00F0
addr == 16'ha3 ? 16'hc800 :  // <0080> a = and
addr == 16'ha4 ? 16'h0330 :  // <0080> "
addr == 16'ha5 ? 16'h0353 :  // <0081> a = a>>4
addr == 16'ha6 ? 16'hfba0 :  // <0082> call fetch_byte
addr == 16'ha7 ? 16'h002b :  // <0082> "
addr == 16'ha8 ? 16'hfc00 :  // <0082> "
addr == 16'ha9 ? 16'h37a0 :  // <0083> putchar a
addr == 16'haa ? 16'h0200 :  // <0083> "
addr == 16'hab ? 16'h3a00 :  // <0083> "
addr == 16'hac ? 16'h2c00 :  // <0083> "

addr == 16'had ? 16'h0006 :  // <0085> a = g6
addr == 16'hae ? 16'h060f :  // <0086> b = 0x000F
addr == 16'haf ? 16'hc800 :  // <0087> a = and
addr == 16'hb0 ? 16'h0330 :  // <0087> "
addr == 16'hb1 ? 16'hfba0 :  // <0088> call fetch_byte
addr == 16'hb2 ? 16'h002b :  // <0088> "
addr == 16'hb3 ? 16'hfc00 :  // <0088> "
addr == 16'hb4 ? 16'h37a0 :  // <0089> putchar a
addr == 16'hb5 ? 16'h0200 :  // <0089> "
addr == 16'hb6 ? 16'h3a00 :  // <0089> "
addr == 16'hb7 ? 16'h2c00 :  // <0089> "

addr == 16'hb8 ? 16'hf80a :  // <0091> pop rtna // rtn
addr == 16'hb9 ? 16'h180a :  // <0091> pop g6 // "
addr == 16'hba ? 16'h100a :  // <0091> pop x // "
addr == 16'hbb ? 16'hfc00 :  // <0091> rtn

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// func get4x // = 0x00bc
addr == 16'hbc ? 16'h2802 :  // <0095> push i // func get4x
addr == 16'hbd ? 16'h2803 :  // <0095> push j // "
addr == 16'hbe ? 16'h2804 :  // <0095> push x // "
addr == 16'hbf ? 16'h2805 :  // <0095> push y // "
addr == 16'hc0 ? 16'h283e :  // <0095> push rtna // "
// y = digit counter
// j = sum
addr == 16'hc1 ? 16'h1604 :  // <0098> y = 4
// :again // = 0x00c2
addr == 16'hc2 ? 16'hfba0 :  // <0100> getchar
addr == 16'hc3 ? 16'h005b :  // <0100> "
addr == 16'hc4 ? 16'hfc00 :  // <0100> "
addr == 16'hc5 ? 16'h2800 :  // <0100> push a // "
addr == 16'hc6 ? 16'h37a0 :  // <0100> "
addr == 16'hc7 ? 16'h0200 :  // <0100> "
addr == 16'hc8 ? 16'h3a00 :  // <0100> "
addr == 16'hc9 ? 16'h2c00 :  // <0100> "
addr == 16'hca ? 16'h000a :  // <0100> pop a // "
addr == 16'hcb ? 16'h13a0 :  // <0101> x = :hexdigits
addr == 16'hcc ? 16'h0077 :  // <0101> "
addr == 16'hcd ? 16'h0a10 :  // <0102> i = 16
addr == 16'hce ? 16'hfba0 :  // <0103> call :find_in_fetch
addr == 16'hcf ? 16'h003f :  // <0103> "
addr == 16'hd0 ? 16'hfc00 :  // <0103> "
addr == 16'hd1 ? 16'h0760 :  // <0104> b = -1
addr == 16'hd2 ? 16'he007 :  // <0105> br eq :fail
addr == 16'hd3 ? 16'h00e7 :  // <0105> "
addr == 16'hd4 ? 16'h0400 :  // <0106> b = a
addr == 16'hd5 ? 16'h0003 :  // <0107> a = j
addr == 16'hd6 ? 16'h0352 :  // <0108> a = a<<4
addr == 16'hd7 ? 16'hc800 :  // <0109> j = or
addr == 16'hd8 ? 16'h0f34 :  // <0109> "
addr == 16'hd9 ? 16'h1360 :  // <0110> x = -1
addr == 16'hda ? 16'hc800 :  // <0111> y = x+y
addr == 16'hdb ? 16'h1720 :  // <0111> "
addr == 16'hdc ? 16'h0005 :  // <0112> a = y
addr == 16'hdd ? 16'he400 :  // <0113> bn az :again
addr == 16'hde ? 16'h00c2 :  // <0113> "
addr == 16'hdf ? 16'h0003 :  // <0114> a = j
addr == 16'he0 ? 16'h0600 :  // <0115> b = 0
addr == 16'he1 ? 16'hf80a :  // <0116> pop rtna // rtn
addr == 16'he2 ? 16'h140a :  // <0116> pop y // "
addr == 16'he3 ? 16'h100a :  // <0116> pop x // "
addr == 16'he4 ? 16'h0c0a :  // <0116> pop j // "
addr == 16'he5 ? 16'h080a :  // <0116> pop i // "
addr == 16'he6 ? 16'hfc00 :  // <0116> rtn
// :fail // = 0x00e7
addr == 16'he7 ? 16'h0760 :  // <0118> b = -1
addr == 16'he8 ? 16'hf80a :  // <0119> pop rtna // rtn
addr == 16'he9 ? 16'h140a :  // <0119> pop y // "
addr == 16'hea ? 16'h100a :  // <0119> pop x // "
addr == 16'heb ? 16'h0c0a :  // <0119> pop j // "
addr == 16'hec ? 16'h080a :  // <0119> pop i // "
addr == 16'hed ? 16'hfc00 :  // <0119> rtn

// routine waits a number of milliseconds given in a.
// func spinwait // = 0x00ee
addr == 16'hee ? 16'h2804 :  // <0002> push x // func spinwait
addr == 16'hef ? 16'h2805 :  // <0002> push y // "
//patch
//rtn
addr == 16'hf0 ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x00f1
addr == 16'hf1 ? 16'h13a0 :  // <0007> x = 16666
addr == 16'hf2 ? 16'h411a :  // <0007> "
addr == 16'hf3 ? 16'h1760 :  // <0008> y = -1
addr == 16'hf4 ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x00f5
// use of the ad2 name overrides auto-nop here.
addr == 16'hf5 ? 16'h1320 :  // <0012> x = ad2
addr == 16'hf6 ? 16'he402 :  // <0013> bn xz :spinwait_inner
addr == 16'hf7 ? 16'h00f5 :  // <0013> "
addr == 16'hf8 ? 16'hc800 :  // <0014> a = a+b
addr == 16'hf9 ? 16'h0300 :  // <0014> "
addr == 16'hfa ? 16'he400 :  // <0015> bn az :spinwait_outer
addr == 16'hfb ? 16'h00f1 :  // <0015> "
addr == 16'hfc ? 16'h140a :  // <0016> pop y // rtn
addr == 16'hfd ? 16'h100a :  // <0016> pop x // "
addr == 16'hfe ? 16'hfc00 :  // <0016> rtn



// ////////////////////////////////////////////
// :main // = 0x00ff

addr == 16'hff ? 16'h2600 :  // <0073> leds = 0

// a = g6
// b = 1
// a = a+b
// g6 = a
// a = a>>4
// leds = a>>4

// :cmd_loop // = 0x0100
addr == 16'h100 ? 16'hfba0 :  // <0083> getchar
addr == 16'h101 ? 16'h005b :  // <0083> "
addr == 16'h102 ? 16'hfc00 :  // <0083> "
addr == 16'h103 ? 16'h2800 :  // <0083> push a // "
addr == 16'h104 ? 16'h37a0 :  // <0083> "
addr == 16'h105 ? 16'h0200 :  // <0083> "
addr == 16'h106 ? 16'h3a00 :  // <0083> "
addr == 16'h107 ? 16'h2c00 :  // <0083> "
addr == 16'h108 ? 16'h000a :  // <0083> pop a // "

// command = set breakpoint.
addr == 16'h109 ? 16'h0662 :  // <0086> b = 98 // asc b = "b"
addr == 16'h10a ? 16'he407 :  // <0087> bn eq :skip_setbrk
addr == 16'h10b ? 16'h011a :  // <0087> "
addr == 16'h10c ? 16'hfba0 :  // <0088> call :set_bp
addr == 16'h10d ? 16'h0126 :  // <0088> "
addr == 16'h10e ? 16'hfc00 :  // <0088> "
addr == 16'h10f ? 16'h0007 :  // <0089> a = g7
addr == 16'h110 ? 16'hfba0 :  // <0090> call :put4x
addr == 16'h111 ? 16'h007f :  // <0090> "
addr == 16'h112 ? 16'hfc00 :  // <0090> "
addr == 16'h113 ? 16'h020a :  // <0091> a = 10 // puteol
addr == 16'h114 ? 16'h37a0 :  // <0091> puteol
addr == 16'h115 ? 16'h0200 :  // <0091> "
addr == 16'h116 ? 16'h3a00 :  // <0091> "
addr == 16'h117 ? 16'h2c00 :  // <0091> "
addr == 16'h118 ? 16'he00f :  // <0092> jmp :cmd_loop
addr == 16'h119 ? 16'h0100 :  // <0092> "
// :skip_setbrk // = 0x011a

addr == 16'h11a ? 16'h023f :  // <0095> a = 63 // putasc "?"
addr == 16'h11b ? 16'h37a0 :  // <0095> putasc "?"
addr == 16'h11c ? 16'h0200 :  // <0095> "
addr == 16'h11d ? 16'h3a00 :  // <0095> "
addr == 16'h11e ? 16'h2c00 :  // <0095> "
addr == 16'h11f ? 16'h020a :  // <0096> a = 10 // puteol
addr == 16'h120 ? 16'h37a0 :  // <0096> puteol
addr == 16'h121 ? 16'h0200 :  // <0096> "
addr == 16'h122 ? 16'h3a00 :  // <0096> "
addr == 16'h123 ? 16'h2c00 :  // <0096> "
addr == 16'h124 ? 16'he00f :  // <0097> jmp :cmd_loop
addr == 16'h125 ? 16'h0100 :  // <0097> "

// func set_bp // = 0x0126
addr == 16'h126 ? 16'h2802 :  // <0099> push i // func set_bp
addr == 16'h127 ? 16'h2803 :  // <0099> push j // "
addr == 16'h128 ? 16'h2804 :  // <0099> push x // "
addr == 16'h129 ? 16'h2805 :  // <0099> push y // "
addr == 16'h12a ? 16'h2807 :  // <0099> push g7 // "
addr == 16'h12b ? 16'h283e :  // <0099> push rtna // "
addr == 16'h12c ? 16'hfba0 :  // <0100> getchar
addr == 16'h12d ? 16'h005b :  // <0100> "
addr == 16'h12e ? 16'hfc00 :  // <0100> "
addr == 16'h12f ? 16'h2800 :  // <0100> push a // "
addr == 16'h130 ? 16'h37a0 :  // <0100> "
addr == 16'h131 ? 16'h0200 :  // <0100> "
addr == 16'h132 ? 16'h3a00 :  // <0100> "
addr == 16'h133 ? 16'h2c00 :  // <0100> "
addr == 16'h134 ? 16'h000a :  // <0100> pop a // "
addr == 16'h135 ? 16'h1000 :  // <0101> x = a
addr == 16'h136 ? 16'hfba0 :  // <0102> getchar
addr == 16'h137 ? 16'h005b :  // <0102> "
addr == 16'h138 ? 16'hfc00 :  // <0102> "
addr == 16'h139 ? 16'h2800 :  // <0102> push a // "
addr == 16'h13a ? 16'h37a0 :  // <0102> "
addr == 16'h13b ? 16'h0200 :  // <0102> "
addr == 16'h13c ? 16'h3a00 :  // <0102> "
addr == 16'h13d ? 16'h2c00 :  // <0102> "
addr == 16'h13e ? 16'h000a :  // <0102> pop a // "
addr == 16'h13f ? 16'h063d :  // <0103> b = 61 // asc b = "="
addr == 16'h140 ? 16'he407 :  // <0104> bn eq :fail
addr == 16'h141 ? 16'h01b2 :  // <0104> "
addr == 16'h142 ? 16'hfba0 :  // <0105> call :get4x
addr == 16'h143 ? 16'h00bc :  // <0105> "
addr == 16'h144 ? 16'hfc00 :  // <0105> "
addr == 16'h145 ? 16'h1400 :  // <0106> y = a
addr == 16'h146 ? 16'h0200 :  // <0107> a = 0
addr == 16'h147 ? 16'he407 :  // <0108> bn eq :fail
addr == 16'h148 ? 16'h01b2 :  // <0108> "
addr == 16'h149 ? 16'h0004 :  // <0109> a = x
addr == 16'h14a ? 16'h0630 :  // <0110> b = 48 // asc b = "0"
addr == 16'h14b ? 16'he007 :  // <0111> br eq :b0
addr == 16'h14c ? 16'h0158 :  // <0111> "
addr == 16'h14d ? 16'h0631 :  // <0112> b = 49 // asc b = "1"
addr == 16'h14e ? 16'he007 :  // <0113> br eq :b1
addr == 16'h14f ? 16'h0160 :  // <0113> "
addr == 16'h150 ? 16'h0632 :  // <0114> b = 50 // asc b = "2"
addr == 16'h151 ? 16'he007 :  // <0115> br eq :b2
addr == 16'h152 ? 16'h0168 :  // <0115> "
addr == 16'h153 ? 16'h0633 :  // <0116> b = 51 // asc b = "3"
addr == 16'h154 ? 16'he007 :  // <0117> br eq :b3
addr == 16'h155 ? 16'h0170 :  // <0117> "
addr == 16'h156 ? 16'he00f :  // <0118> jmp :fail
addr == 16'h157 ? 16'h01b2 :  // <0118> "
// :b0 // = 0x0158
addr == 16'h158 ? 16'h1c05 :  // <0120> g7 = y
addr == 16'h159 ? 16'hf80a :  // <0121> pop rtna // rtn
addr == 16'h15a ? 16'h1c0a :  // <0121> pop g7 // "
addr == 16'h15b ? 16'h140a :  // <0121> pop y // "
addr == 16'h15c ? 16'h100a :  // <0121> pop x // "
addr == 16'h15d ? 16'h0c0a :  // <0121> pop j // "
addr == 16'h15e ? 16'h080a :  // <0121> pop i // "
addr == 16'h15f ? 16'hfc00 :  // <0121> rtn
// :b1 // = 0x0160
addr == 16'h160 ? 16'h1c05 :  // <0123> g7 = y
addr == 16'h161 ? 16'hf80a :  // <0124> pop rtna // rtn
addr == 16'h162 ? 16'h1c0a :  // <0124> pop g7 // "
addr == 16'h163 ? 16'h140a :  // <0124> pop y // "
addr == 16'h164 ? 16'h100a :  // <0124> pop x // "
addr == 16'h165 ? 16'h0c0a :  // <0124> pop j // "
addr == 16'h166 ? 16'h080a :  // <0124> pop i // "
addr == 16'h167 ? 16'hfc00 :  // <0124> rtn
// :b2 // = 0x0168
addr == 16'h168 ? 16'h1c05 :  // <0126> g7 = y
addr == 16'h169 ? 16'hf80a :  // <0127> pop rtna // rtn
addr == 16'h16a ? 16'h1c0a :  // <0127> pop g7 // "
addr == 16'h16b ? 16'h140a :  // <0127> pop y // "
addr == 16'h16c ? 16'h100a :  // <0127> pop x // "
addr == 16'h16d ? 16'h0c0a :  // <0127> pop j // "
addr == 16'h16e ? 16'h080a :  // <0127> pop i // "
addr == 16'h16f ? 16'hfc00 :  // <0127> rtn
// :b3 // = 0x0170
addr == 16'h170 ? 16'h1c05 :  // <0129> g7 = y
addr == 16'h171 ? 16'hf80a :  // <0130> pop rtna // rtn
addr == 16'h172 ? 16'h1c0a :  // <0130> pop g7 // "
addr == 16'h173 ? 16'h140a :  // <0130> pop y // "
addr == 16'h174 ? 16'h100a :  // <0130> pop x // "
addr == 16'h175 ? 16'h0c0a :  // <0130> pop j // "
addr == 16'h176 ? 16'h080a :  // <0130> pop i // "
addr == 16'h177 ? 16'hfc00 :  // <0130> rtn
// :fail // = 0x0178
addr == 16'h178 ? 16'h023f :  // <0132> a = 63 // putasc "?"
addr == 16'h179 ? 16'h37a0 :  // <0132> putasc "?"
addr == 16'h17a ? 16'h0200 :  // <0132> "
addr == 16'h17b ? 16'h3a00 :  // <0132> "
addr == 16'h17c ? 16'h2c00 :  // <0132> "
addr == 16'h17d ? 16'h020a :  // <0133> a = 10 // puteol
addr == 16'h17e ? 16'h37a0 :  // <0133> puteol
addr == 16'h17f ? 16'h0200 :  // <0133> "
addr == 16'h180 ? 16'h3a00 :  // <0133> "
addr == 16'h181 ? 16'h2c00 :  // <0133> "
addr == 16'h182 ? 16'hf80a :  // <0134> pop rtna // rtn
addr == 16'h183 ? 16'h1c0a :  // <0134> pop g7 // "
addr == 16'h184 ? 16'h140a :  // <0134> pop y // "
addr == 16'h185 ? 16'h100a :  // <0134> pop x // "
addr == 16'h186 ? 16'h0c0a :  // <0134> pop j // "
addr == 16'h187 ? 16'h080a :  // <0134> pop i // "
addr == 16'h188 ? 16'hfc00 :  // <0134> rtn

// debugging version of get4x
// y = digit counter
// j = sum
addr == 16'h189 ? 16'h1604 :  // <0139> y = 4
// :again // = 0x018a
addr == 16'h18a ? 16'h0009 :  // <0141> a = leds
addr == 16'h18b ? 16'h0601 :  // <0142> b = 1
addr == 16'h18c ? 16'hc800 :  // <0143> leds = a+b
addr == 16'h18d ? 16'h2700 :  // <0143> "
addr == 16'h18e ? 16'hfba0 :  // <0144> getchar
addr == 16'h18f ? 16'h005b :  // <0144> "
addr == 16'h190 ? 16'hfc00 :  // <0144> "
addr == 16'h191 ? 16'h2800 :  // <0144> push a // "
addr == 16'h192 ? 16'h37a0 :  // <0144> "
addr == 16'h193 ? 16'h0200 :  // <0144> "
addr == 16'h194 ? 16'h3a00 :  // <0144> "
addr == 16'h195 ? 16'h2c00 :  // <0144> "
addr == 16'h196 ? 16'h000a :  // <0144> pop a // "
addr == 16'h197 ? 16'h13a0 :  // <0145> x = :hexdigits
addr == 16'h198 ? 16'h0077 :  // <0145> "
addr == 16'h199 ? 16'h0a10 :  // <0146> i = 16
addr == 16'h19a ? 16'hfba0 :  // <0147> call :find_in_fetch
addr == 16'h19b ? 16'h003f :  // <0147> "
addr == 16'h19c ? 16'hfc00 :  // <0147> "
addr == 16'h19d ? 16'h0760 :  // <0148> b = -1
addr == 16'h19e ? 16'he007 :  // <0149> br eq :fail
addr == 16'h19f ? 16'h0178 :  // <0149> "
addr == 16'h1a0 ? 16'h0400 :  // <0150> b = a
addr == 16'h1a1 ? 16'h0003 :  // <0151> a = j
addr == 16'h1a2 ? 16'h0352 :  // <0152> a = a<<4
addr == 16'h1a3 ? 16'hc800 :  // <0153> j = or
addr == 16'h1a4 ? 16'h0f34 :  // <0153> "
addr == 16'h1a5 ? 16'h1360 :  // <0154> x = -1
addr == 16'h1a6 ? 16'hc800 :  // <0155> y = x+y
addr == 16'h1a7 ? 16'h1720 :  // <0155> "
addr == 16'h1a8 ? 16'h0005 :  // <0156> a = y
addr == 16'h1a9 ? 16'he400 :  // <0157> bn az :again
addr == 16'h1aa ? 16'h018a :  // <0157> "
addr == 16'h1ab ? 16'h0003 :  // <0158> a = j
addr == 16'h1ac ? 16'h0600 :  // <0159> b = 0
addr == 16'h1ad ? 16'hfba0 :  // <0160> call :put4x
addr == 16'h1ae ? 16'h007f :  // <0160> "
addr == 16'h1af ? 16'hfc00 :  // <0160> "
addr == 16'h1b0 ? 16'he00f :  // <0161> jmp :main
addr == 16'h1b1 ? 16'h00ff :  // <0161> "
// :fail // = 0x01b2
addr == 16'h1b2 ? 16'h0760 :  // <0163> b = -1
addr == 16'h1b3 ? 16'h023f :  // <0164> a = 63 // putasc "?"
addr == 16'h1b4 ? 16'h37a0 :  // <0164> putasc "?"
addr == 16'h1b5 ? 16'h0200 :  // <0164> "
addr == 16'h1b6 ? 16'h3a00 :  // <0164> "
addr == 16'h1b7 ? 16'h2c00 :  // <0164> "
addr == 16'h1b8 ? 16'he00f :  // <0165> jmp :main
addr == 16'h1b9 ? 16'h00ff :  // <0165> "

// // a = 65
// // push a
// // a = 66
// // push a
// // a = 67
// // push a
// // a = 68
// // push a
// // a = 69
// // push a

// // pop b
// // putchar b
// // pop b
// // putchar b
// // pop b
// // putchar b
// // pop b
// // putchar b
// // pop b
// // putchar b

// // a = 0x1234
// // call put4x

// // x = 0x1234
// // y = 1
// // a = 0
// // :nextwrite
// // m9k_addr = a
// // m9k_data = x
// // x = x+y
// // b = 1
// // a = a+b
// // b = 1024
// // br lt :nextwrite

// //patch
// x = 0
// y = 1
// :patch

// a = leds
// b = 1
// leds = a+b

// // // Avalon write to JTAG UART.
// // putasc A
// // putasc B
// // putasc C
// // putasc D
// // putasc E
// // putasc F
// // putasc G
// // putasc H
// // putasc I
// // putasc J
// // putasc K
// // putasc L
// // putasc M
// // putasc N

// // // Avalon read from JTAG UART.
// // :poll_jtag_uart
// // a = 0x1234
// // call put4x
// // a = 1000
// // call :spinwait
// // putasc "/"
// // a = 1000
// // call :spinwait
// // av_ad_hi = $jtag_uart_data_lsw_hi
// // av_ad_lo = $jtag_uart_data_lsw_lo
// // a = av_write_data
// // a = av_read_data
// // call put4x
// // a = 1000
// // call :spinwait
// // putasc ","
// // a = 1000
// // call :spinwait
// // av_ad_hi = $jtag_uart_data_msw_hi
// // av_ad_lo = $jtag_uart_data_msw_lo
// // a = av_write_data
// // a = av_read_data
// // call put4x
// // a = 1000
// // call :spinwait
// // putasc ","
// // a = 1000
// // call :spinwait
// // av_ad_hi = $jtag_uart_ctrl_lsw_hi
// // av_ad_lo = $jtag_uart_ctrl_lsw_lo
// // a = av_write_data
// // a = av_read_data
// // call put4x
// // a = 1000
// // call :spinwait
// // putasc ","
// // a = 1000
// // call :spinwait
// // av_ad_hi = $jtag_uart_ctrl_msw_hi
// // av_ad_lo = $jtag_uart_ctrl_msw_lo
// // a = av_write_data
// // a = av_read_data
// // call put4x
// // a = 1000
// // call :spinwait
// // putasc "/"
// // a = 1000
// // call :spinwait
// // a = 0x5678
// // call put4x
// // a = 1000
// // call :spinwait
// // putasc "\r"
// // putasc "\n"
// // a = 1000
// // call :spinwait
// // jmp :poll_jtag_uart

// // Avalon write to SDRAM.
// av_ad_hi = 0
// av_ad_lo = 0x20
// av_write_data = 0x6789
// // Avalon read from SDRAM.
// a = av_write_data
// a = av_read_data
// call put4x
// a = 1000
// call :spinwait

// :verify_all
// a = 1000
// call :spinwait
// putasc {-}
// i = 0x200
// j = -1
// :next_page
// i = i+j
// av_ad_hi = i

// // fill SDRAM page with a pattern.
// putasc W
// x = 0x0000
// :fill_more
// a = x
// b = 0xffff
// g6 = xor
// av_ad_hi = i
// av_ad_lo = x
// av_write_data = g6
// y = 2
// x = x+y
// bn xz :fill_more

// // verify pattern in SDRAM.
// x = 0x0000
// :verify_more
// av_ad_hi = i
// av_ad_lo = x
// g6 = av_write_data
// g6 = av_read_data
// // a = x
// // call put4x
// // putasc "="
// // a = 500
// // call :spinwait
// // a = g6
// // call put4x
// // putasc "\r"
// // putasc "\n"
// // a = 500
// // call :spinwait
// a = x
// b = 0xffff
// a = xor
// b = g6
// bn eq :sdram_err
// y = 2
// x = x+y
// bn xz :verify_more

// a = i
// b = 0
// bn z :next_page
// jmp :verify_all

// :sdram_err
// y = a
// a = 1000
// call :spinwait
// a = g6
// call :put4x
// a = 1000
// call :spinwait
// putasc "!"
// putasc "="
// a = y
// call :put4x
// a = 1000
// call :spinwait
// putasc "@"
// a = av_ad_hi
// call :put4x
// a = 1000
// call :spinwait
// a = av_ad_lo
// call put4x
// :halt
// jmp :halt

// // :wait_key_press
// // a = 0x03
// // b = keys
// // br eq :wait_key_press
// // :wait_key_release
// // b = keys
// // bn eq :wait_key_release

// // getchar
// // b = 1
// // putchar a+b

// // b = 85
// // putchar b

// // x = x+y
// // a = x
// // call put4x

// a = 100
// call :spinwait

// // b = 32
// // putchar b
// // m9k_addr = x
// // a = m9k_data
// // call put4x

// // b = 13
// // putchar b
// // b = 10
// // putchar b

// jmp :patch





// // using i as index into string.
// i = 0

// // cache the string limit in g6.
// a = 16
// b = 0xffff
// g6 = xor

// :again
// // // wait for keypress.
// // :wait_key_press
// // a = 0
// // b = keys
// // br z :wait_key_press
// // :wait_key_release
// // b = keys
// // bn z :wait_key_release

// a = 100
// call :spinwait

// // increment LEDs
// a = leds
// b = 1
// leds = a+b

// // fetch a word from test pattern to the UART.  its low byte is a character.
// j = :msg
// fetch a from i+j
// //    putchar a

// // increment index & wrap around end of pattern.
// j = 1
// i = i+j
// j = g6
// i = i+j
// bn iz :no_wrap
// i = 0
// :no_wrap

// // repeat forever.
// jmp :again

// :msg
// "1234567890abcdef\n\x00"


        
                16'hxxxx;
        endmodule
    
