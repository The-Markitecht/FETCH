
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
addr == 16'h01 ? 16'h00e1 :  // <0049> "

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
addr == 16'h43 ? 16'he001 :  // <0028> br iz :fail
addr == 16'h44 ? 16'h0056 :  // <0028> "
addr == 16'h45 ? 16'h1400 :  // <0029> y = a
addr == 16'h46 ? 16'h0f60 :  // <0030> j = -1
// :again // = 0x0047
addr == 16'h47 ? 16'hc800 :  // <0032> i = i+j
addr == 16'h48 ? 16'h0b10 :  // <0032> "
addr == 16'h49 ? 16'h0002 :  // <0033> a = i
addr == 16'h4a ? 16'hfba0 :  // <0034> call :fetch_byte
addr == 16'h4b ? 16'h002b :  // <0034> "
addr == 16'h4c ? 16'hfc00 :  // <0034> "
addr == 16'h4d ? 16'h0405 :  // <0035> b = y
addr == 16'h4e ? 16'he407 :  // <0036> bn eq :again
addr == 16'h4f ? 16'h0047 :  // <0036> "
// :found // = 0x0050
addr == 16'h50 ? 16'h0002 :  // <0038> a = i
addr == 16'h51 ? 16'hf80a :  // <0039> pop rtna // rtn
addr == 16'h52 ? 16'h140a :  // <0039> pop y // "
addr == 16'h53 ? 16'h0c0a :  // <0039> pop j // "
addr == 16'h54 ? 16'h080a :  // <0039> pop i // "
addr == 16'h55 ? 16'hfc00 :  // <0039> rtn
// :fail // = 0x0056
addr == 16'h56 ? 16'h0360 :  // <0041> a = -1
addr == 16'h57 ? 16'hf80a :  // <0042> pop rtna // rtn
addr == 16'h58 ? 16'h140a :  // <0042> pop y // "
addr == 16'h59 ? 16'h0c0a :  // <0042> pop j // "
addr == 16'h5a ? 16'h080a :  // <0042> pop i // "
addr == 16'h5b ? 16'hfc00 :  // <0042> rtn



// driver library for JTAG UART accessed by my hardware-assisted Avalon MM master.





// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x005c
// "0123456789abcdef"
addr == 16'h5c ? 16'h3130 :  // <0050> 10
addr == 16'h5d ? 16'h3332 :  // <0050> 32
addr == 16'h5e ? 16'h3534 :  // <0050> 54
addr == 16'h5f ? 16'h3736 :  // <0050> 76
addr == 16'h60 ? 16'h3938 :  // <0050> 98
addr == 16'h61 ? 16'h6261 :  // <0050> ba
addr == 16'h62 ? 16'h6463 :  // <0050> dc
addr == 16'h63 ? 16'h6665 :  // <0050> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x0064
addr == 16'h64 ? 16'h2804 :  // <0054> push x // func put4x
addr == 16'h65 ? 16'h2806 :  // <0054> push g6 // "
addr == 16'h66 ? 16'h283e :  // <0054> push rtna // "
addr == 16'h67 ? 16'h13a0 :  // <0055> x = :hexdigits
addr == 16'h68 ? 16'h005c :  // <0055> "

addr == 16'h69 ? 16'h1800 :  // <0057> g6 = a
addr == 16'h6a ? 16'h07a0 :  // <0058> b = 0xF000
addr == 16'h6b ? 16'hf000 :  // <0058> "
addr == 16'h6c ? 16'hc800 :  // <0059> a = and
addr == 16'h6d ? 16'h0330 :  // <0059> "
addr == 16'h6e ? 16'h0353 :  // <0060> a = a>>4
addr == 16'h6f ? 16'h0353 :  // <0061> a = a>>4
addr == 16'h70 ? 16'h0353 :  // <0062> a = a>>4
addr == 16'h71 ? 16'hfba0 :  // <0063> call fetch_byte
addr == 16'h72 ? 16'h002b :  // <0063> "
addr == 16'h73 ? 16'hfc00 :  // <0063> "
addr == 16'h74 ? 16'h37a0 :  // <0064> putchar a
addr == 16'h75 ? 16'h0200 :  // <0064> "
addr == 16'h76 ? 16'h3a00 :  // <0064> "
addr == 16'h77 ? 16'h2c00 :  // <0064> "

addr == 16'h78 ? 16'h0006 :  // <0066> a = g6
addr == 16'h79 ? 16'h07a0 :  // <0067> b = 0x0F00
addr == 16'h7a ? 16'h0f00 :  // <0067> "
addr == 16'h7b ? 16'hc800 :  // <0068> a = and
addr == 16'h7c ? 16'h0330 :  // <0068> "
addr == 16'h7d ? 16'h0353 :  // <0069> a = a>>4
addr == 16'h7e ? 16'h0353 :  // <0070> a = a>>4
addr == 16'h7f ? 16'hfba0 :  // <0071> call fetch_byte
addr == 16'h80 ? 16'h002b :  // <0071> "
addr == 16'h81 ? 16'hfc00 :  // <0071> "
addr == 16'h82 ? 16'h37a0 :  // <0072> putchar a
addr == 16'h83 ? 16'h0200 :  // <0072> "
addr == 16'h84 ? 16'h3a00 :  // <0072> "
addr == 16'h85 ? 16'h2c00 :  // <0072> "

addr == 16'h86 ? 16'h0006 :  // <0074> a = g6
addr == 16'h87 ? 16'h06f0 :  // <0075> b = 0x00F0
addr == 16'h88 ? 16'hc800 :  // <0076> a = and
addr == 16'h89 ? 16'h0330 :  // <0076> "
addr == 16'h8a ? 16'h0353 :  // <0077> a = a>>4
addr == 16'h8b ? 16'hfba0 :  // <0078> call fetch_byte
addr == 16'h8c ? 16'h002b :  // <0078> "
addr == 16'h8d ? 16'hfc00 :  // <0078> "
addr == 16'h8e ? 16'h37a0 :  // <0079> putchar a
addr == 16'h8f ? 16'h0200 :  // <0079> "
addr == 16'h90 ? 16'h3a00 :  // <0079> "
addr == 16'h91 ? 16'h2c00 :  // <0079> "

addr == 16'h92 ? 16'h0006 :  // <0081> a = g6
addr == 16'h93 ? 16'h060f :  // <0082> b = 0x000F
addr == 16'h94 ? 16'hc800 :  // <0083> a = and
addr == 16'h95 ? 16'h0330 :  // <0083> "
addr == 16'h96 ? 16'hfba0 :  // <0084> call fetch_byte
addr == 16'h97 ? 16'h002b :  // <0084> "
addr == 16'h98 ? 16'hfc00 :  // <0084> "
addr == 16'h99 ? 16'h37a0 :  // <0085> putchar a
addr == 16'h9a ? 16'h0200 :  // <0085> "
addr == 16'h9b ? 16'h3a00 :  // <0085> "
addr == 16'h9c ? 16'h2c00 :  // <0085> "

addr == 16'h9d ? 16'hf80a :  // <0087> pop rtna // rtn
addr == 16'h9e ? 16'h180a :  // <0087> pop g6 // "
addr == 16'h9f ? 16'h100a :  // <0087> pop x // "
addr == 16'ha0 ? 16'hfc00 :  // <0087> rtn

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// func get4x // = 0x00a1
addr == 16'ha1 ? 16'h2802 :  // <0091> push i // func get4x
addr == 16'ha2 ? 16'h2803 :  // <0091> push j // "
addr == 16'ha3 ? 16'h2804 :  // <0091> push x // "
addr == 16'ha4 ? 16'h2805 :  // <0091> push y // "
addr == 16'ha5 ? 16'h283e :  // <0091> push rtna // "
// y = digit counter
// j = sum
addr == 16'ha6 ? 16'h1604 :  // <0094> y = 4
// :again // = 0x00a7
addr == 16'ha7 ? 16'h2800 :  // <0096> push a // "
addr == 16'ha8 ? 16'h37a0 :  // <0096> "
addr == 16'ha9 ? 16'h0200 :  // <0096> "
addr == 16'haa ? 16'h3a00 :  // <0096> "
addr == 16'hab ? 16'h2c00 :  // <0096> "
addr == 16'hac ? 16'h000a :  // <0096> pop a // "
addr == 16'had ? 16'h13a0 :  // <0097> x = :hexdigits
addr == 16'hae ? 16'h005c :  // <0097> "
addr == 16'haf ? 16'h0a10 :  // <0098> i = 16
addr == 16'hb0 ? 16'hfba0 :  // <0099> call :find_in_fetch
addr == 16'hb1 ? 16'h003f :  // <0099> "
addr == 16'hb2 ? 16'hfc00 :  // <0099> "
addr == 16'hb3 ? 16'h0760 :  // <0100> b = -1
addr == 16'hb4 ? 16'he007 :  // <0101> br eq :fail
addr == 16'hb5 ? 16'h00c9 :  // <0101> "
addr == 16'hb6 ? 16'h0400 :  // <0102> b = a
addr == 16'hb7 ? 16'h0003 :  // <0103> a = j
addr == 16'hb8 ? 16'h0352 :  // <0104> a = a<<4
addr == 16'hb9 ? 16'hc800 :  // <0105> j = or
addr == 16'hba ? 16'h0f34 :  // <0105> "
addr == 16'hbb ? 16'h1360 :  // <0106> x = -1
addr == 16'hbc ? 16'hc800 :  // <0107> y = x+y
addr == 16'hbd ? 16'h1720 :  // <0107> "
addr == 16'hbe ? 16'h0005 :  // <0108> a = y
addr == 16'hbf ? 16'he400 :  // <0109> bn az :again
addr == 16'hc0 ? 16'h00a7 :  // <0109> "
addr == 16'hc1 ? 16'h0003 :  // <0110> a = j
addr == 16'hc2 ? 16'h0600 :  // <0111> b = 0
addr == 16'hc3 ? 16'hf80a :  // <0112> pop rtna // rtn
addr == 16'hc4 ? 16'h140a :  // <0112> pop y // "
addr == 16'hc5 ? 16'h100a :  // <0112> pop x // "
addr == 16'hc6 ? 16'h0c0a :  // <0112> pop j // "
addr == 16'hc7 ? 16'h080a :  // <0112> pop i // "
addr == 16'hc8 ? 16'hfc00 :  // <0112> rtn
// :fail // = 0x00c9
addr == 16'hc9 ? 16'h0760 :  // <0114> b = -1
addr == 16'hca ? 16'hf80a :  // <0115> pop rtna // rtn
addr == 16'hcb ? 16'h140a :  // <0115> pop y // "
addr == 16'hcc ? 16'h100a :  // <0115> pop x // "
addr == 16'hcd ? 16'h0c0a :  // <0115> pop j // "
addr == 16'hce ? 16'h080a :  // <0115> pop i // "
addr == 16'hcf ? 16'hfc00 :  // <0115> rtn

// routine waits a number of milliseconds given in a.
// func spinwait // = 0x00d0
addr == 16'hd0 ? 16'h2804 :  // <0002> push x // func spinwait
addr == 16'hd1 ? 16'h2805 :  // <0002> push y // "
//patch
//rtn
addr == 16'hd2 ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x00d3
addr == 16'hd3 ? 16'h13a0 :  // <0007> x = 16666
addr == 16'hd4 ? 16'h411a :  // <0007> "
addr == 16'hd5 ? 16'h1760 :  // <0008> y = -1
addr == 16'hd6 ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x00d7
// use of the ad2 name overrides auto-nop here.
addr == 16'hd7 ? 16'h1320 :  // <0012> x = ad2
addr == 16'hd8 ? 16'he402 :  // <0013> bn xz :spinwait_inner
addr == 16'hd9 ? 16'h00d7 :  // <0013> "
addr == 16'hda ? 16'hc800 :  // <0014> a = a+b
addr == 16'hdb ? 16'h0300 :  // <0014> "
addr == 16'hdc ? 16'he400 :  // <0015> bn az :spinwait_outer
addr == 16'hdd ? 16'h00d3 :  // <0015> "
addr == 16'hde ? 16'h140a :  // <0016> pop y // rtn
addr == 16'hdf ? 16'h100a :  // <0016> pop x // "
addr == 16'he0 ? 16'hfc00 :  // <0016> rtn



// ////////////////////////////////////////////
// :main // = 0x00e1
addr == 16'he1 ? 16'h0006 :  // <0072> a = g6
addr == 16'he2 ? 16'h0601 :  // <0073> b = 1
addr == 16'he3 ? 16'hc800 :  // <0074> a = a+b
addr == 16'he4 ? 16'h0300 :  // <0074> "
addr == 16'he5 ? 16'h1800 :  // <0075> g6 = a
addr == 16'he6 ? 16'h0353 :  // <0076> a = a>>4
addr == 16'he7 ? 16'h2753 :  // <0077> leds = a>>4

// debugging version of get4x
// y = digit counter
// j = sum
addr == 16'he8 ? 16'h1604 :  // <0082> y = 4
// :again // = 0x00e9
addr == 16'he9 ? 16'h0266 :  // <0084> a = 102 // asc a = "f"
addr == 16'hea ? 16'h13a0 :  // <0085> x = :hexdigits
addr == 16'heb ? 16'h005c :  // <0085> "
addr == 16'hec ? 16'h0a10 :  // <0086> i = 16
addr == 16'hed ? 16'hfba0 :  // <0087> call :find_in_fetch
addr == 16'hee ? 16'h003f :  // <0087> "
addr == 16'hef ? 16'hfc00 :  // <0087> "
addr == 16'hf0 ? 16'h0760 :  // <0088> b = -1
addr == 16'hf1 ? 16'he007 :  // <0089> br eq :fail
addr == 16'hf2 ? 16'h0102 :  // <0089> "
addr == 16'hf3 ? 16'h0400 :  // <0090> b = a
addr == 16'hf4 ? 16'h0003 :  // <0091> a = j
addr == 16'hf5 ? 16'h0352 :  // <0092> a = a<<4
addr == 16'hf6 ? 16'hc800 :  // <0093> j = or
addr == 16'hf7 ? 16'h0f34 :  // <0093> "
addr == 16'hf8 ? 16'h1360 :  // <0094> x = -1
addr == 16'hf9 ? 16'hc800 :  // <0095> y = x+y
addr == 16'hfa ? 16'h1720 :  // <0095> "
addr == 16'hfb ? 16'h0005 :  // <0096> a = y
addr == 16'hfc ? 16'he400 :  // <0097> bn az :again
addr == 16'hfd ? 16'h00e9 :  // <0097> "
addr == 16'hfe ? 16'h0003 :  // <0098> a = j
addr == 16'hff ? 16'h0600 :  // <0099> b = 0
addr == 16'h100 ? 16'he00f :  // <0100> jmp :main
addr == 16'h101 ? 16'h00e1 :  // <0100> "
// :fail // = 0x0102
addr == 16'h102 ? 16'h0760 :  // <0102> b = -1
addr == 16'h103 ? 16'he00f :  // <0103> jmp :main
addr == 16'h104 ? 16'h00e1 :  // <0103> "

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
    
