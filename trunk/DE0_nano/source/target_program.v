
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
addr == 16'h01 ? 16'h00df :  // <0049> "

// register names for use by debugger.
addr == 16'h02 ? 16'h000a :  // <0052> ([src rstk])
// "\r      a"
addr == 16'h03 ? 16'h200d :  // <0053>   
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
// "\r      x"
addr == 16'h13 ? 16'h200d :  // <0057>   
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
// "\r   keys"
addr == 16'h23 ? 16'h200d :  // <0061>   
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
addr == 16'h2c ? 16'hc800 :  // <0006> nop
addr == 16'h2d ? 16'he002 :  // <0007> br and0z :pick_byte_even
addr == 16'h2e ? 16'h0037 :  // <0007> "
addr == 16'h2f ? 16'h0350 :  // <0008> a = a>>1
addr == 16'h30 ? 16'h0404 :  // <0009> b = x
addr == 16'h31 ? 16'hc800 :  // <0010> nop
addr == 16'h32 ? 16'hd300 :  // <0011> fetch a from a+b
addr == 16'h33 ? 16'h03b0 :  // <0011> "
addr == 16'h34 ? 16'h0353 :  // <0012> a = a>>4
addr == 16'h35 ? 16'h0353 :  // <0013> a = a>>4
addr == 16'h36 ? 16'hfc00 :  // <0014> rtn
// :pick_byte_even // = 0x0037
addr == 16'h37 ? 16'h0350 :  // <0016> a = a>>1
addr == 16'h38 ? 16'h0404 :  // <0017> b = x
addr == 16'h39 ? 16'hc800 :  // <0018> nop
addr == 16'h3a ? 16'hd300 :  // <0019> fetch a from a+b
addr == 16'h3b ? 16'h03b0 :  // <0019> "
addr == 16'h3c ? 16'h06ff :  // <0020> b = 0xff
addr == 16'h3d ? 16'hc800 :  // <0021> nop
addr == 16'h3e ? 16'h0330 :  // <0022> a = and
addr == 16'h3f ? 16'hfc00 :  // <0023> rtn

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// func find_in_fetch // = 0x0040
addr == 16'h40 ? 16'h2802 :  // <0031> push i // func find_in_fetch
addr == 16'h41 ? 16'h2803 :  // <0031> push j // "
addr == 16'h42 ? 16'h2805 :  // <0031> push y // "
addr == 16'h43 ? 16'h283e :  // <0031> push rtna // "
addr == 16'h44 ? 16'h1400 :  // <0032> y = a
addr == 16'h45 ? 16'h0e00 :  // <0033> j = 0
addr == 16'h46 ? 16'hc800 :  // <0034> nop
addr == 16'h47 ? 16'he001 :  // <0035> br 1z :fail
addr == 16'h48 ? 16'h005a :  // <0035> "
addr == 16'h49 ? 16'h0f60 :  // <0036> j = -1
addr == 16'h4a ? 16'hc800 :  // <0037> nop
// :again // = 0x004b
addr == 16'h4b ? 16'h0b10 :  // <0039> i = i+j
addr == 16'h4c ? 16'h0002 :  // <0040> a = i
addr == 16'h4d ? 16'hfba0 :  // <0041> call :fetch_byte
addr == 16'h4e ? 16'h002b :  // <0041> "
addr == 16'h4f ? 16'hfc00 :  // <0041> "
addr == 16'h50 ? 16'h0405 :  // <0042> b = y
addr == 16'h51 ? 16'hc800 :  // <0043> nop
addr == 16'h52 ? 16'he407 :  // <0044> bn eq :again
addr == 16'h53 ? 16'h004b :  // <0044> "
// :found // = 0x0054
addr == 16'h54 ? 16'h0002 :  // <0046> a = i
addr == 16'h55 ? 16'hf80a :  // <0047> pop rtna // rtn
addr == 16'h56 ? 16'h140a :  // <0047> pop y // "
addr == 16'h57 ? 16'h0c0a :  // <0047> pop j // "
addr == 16'h58 ? 16'h080a :  // <0047> pop i // "
addr == 16'h59 ? 16'hfc00 :  // <0047> rtn
// :fail // = 0x005a
addr == 16'h5a ? 16'h0360 :  // <0049> a = -1
addr == 16'h5b ? 16'hf80a :  // <0050> pop rtna // rtn
addr == 16'h5c ? 16'h140a :  // <0050> pop y // "
addr == 16'h5d ? 16'h0c0a :  // <0050> pop j // "
addr == 16'h5e ? 16'h080a :  // <0050> pop i // "
addr == 16'h5f ? 16'hfc00 :  // <0050> rtn



// driver library for JTAG UART accessed by my hardware-assisted Avalon MM master.





// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x0060
// "0123456789abcdef"
addr == 16'h60 ? 16'h3130 :  // <0047> 10
addr == 16'h61 ? 16'h3332 :  // <0047> 32
addr == 16'h62 ? 16'h3534 :  // <0047> 54
addr == 16'h63 ? 16'h3736 :  // <0047> 76
addr == 16'h64 ? 16'h3938 :  // <0047> 98
addr == 16'h65 ? 16'h6261 :  // <0047> ba
addr == 16'h66 ? 16'h6463 :  // <0047> dc
addr == 16'h67 ? 16'h6665 :  // <0047> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x0068
addr == 16'h68 ? 16'h2804 :  // <0051> push x // func put4x
addr == 16'h69 ? 16'h2806 :  // <0051> push g6 // "
addr == 16'h6a ? 16'h283e :  // <0051> push rtna // "
addr == 16'h6b ? 16'h13a0 :  // <0052> x = :hexdigits
addr == 16'h6c ? 16'h0060 :  // <0052> "

addr == 16'h6d ? 16'h1800 :  // <0054> g6 = a
addr == 16'h6e ? 16'h07a0 :  // <0055> b = 0xF000
addr == 16'h6f ? 16'hf000 :  // <0055> "
addr == 16'h70 ? 16'hc800 :  // <0056> nop
addr == 16'h71 ? 16'h0330 :  // <0057> a = and
addr == 16'h72 ? 16'h0353 :  // <0058> a = a>>4
addr == 16'h73 ? 16'h0353 :  // <0059> a = a>>4
addr == 16'h74 ? 16'h0353 :  // <0060> a = a>>4
addr == 16'h75 ? 16'hfba0 :  // <0061> call fetch_byte
addr == 16'h76 ? 16'h002b :  // <0061> "
addr == 16'h77 ? 16'hfc00 :  // <0061> "
addr == 16'h78 ? 16'h37a0 :  // <0062> putchar a
addr == 16'h79 ? 16'h0200 :  // <0062> "
addr == 16'h7a ? 16'h3a00 :  // <0062> "
addr == 16'h7b ? 16'h2c00 :  // <0062> "

addr == 16'h7c ? 16'h0006 :  // <0064> a = g6
addr == 16'h7d ? 16'h07a0 :  // <0065> b = 0x0F00
addr == 16'h7e ? 16'h0f00 :  // <0065> "
addr == 16'h7f ? 16'hc800 :  // <0066> nop
addr == 16'h80 ? 16'h0330 :  // <0067> a = and
addr == 16'h81 ? 16'h0353 :  // <0068> a = a>>4
addr == 16'h82 ? 16'h0353 :  // <0069> a = a>>4
addr == 16'h83 ? 16'hfba0 :  // <0070> call fetch_byte
addr == 16'h84 ? 16'h002b :  // <0070> "
addr == 16'h85 ? 16'hfc00 :  // <0070> "
addr == 16'h86 ? 16'h37a0 :  // <0071> putchar a
addr == 16'h87 ? 16'h0200 :  // <0071> "
addr == 16'h88 ? 16'h3a00 :  // <0071> "
addr == 16'h89 ? 16'h2c00 :  // <0071> "

addr == 16'h8a ? 16'h0006 :  // <0073> a = g6
addr == 16'h8b ? 16'h06f0 :  // <0074> b = 0x00F0
addr == 16'h8c ? 16'hc800 :  // <0075> nop
addr == 16'h8d ? 16'h0330 :  // <0076> a = and
addr == 16'h8e ? 16'h0353 :  // <0077> a = a>>4
addr == 16'h8f ? 16'hfba0 :  // <0078> call fetch_byte
addr == 16'h90 ? 16'h002b :  // <0078> "
addr == 16'h91 ? 16'hfc00 :  // <0078> "
addr == 16'h92 ? 16'h37a0 :  // <0079> putchar a
addr == 16'h93 ? 16'h0200 :  // <0079> "
addr == 16'h94 ? 16'h3a00 :  // <0079> "
addr == 16'h95 ? 16'h2c00 :  // <0079> "

addr == 16'h96 ? 16'h0006 :  // <0081> a = g6
addr == 16'h97 ? 16'h060f :  // <0082> b = 0x000F
addr == 16'h98 ? 16'hc800 :  // <0083> nop
addr == 16'h99 ? 16'h0330 :  // <0084> a = and
addr == 16'h9a ? 16'hfba0 :  // <0085> call fetch_byte
addr == 16'h9b ? 16'h002b :  // <0085> "
addr == 16'h9c ? 16'hfc00 :  // <0085> "
addr == 16'h9d ? 16'h37a0 :  // <0086> putchar a
addr == 16'h9e ? 16'h0200 :  // <0086> "
addr == 16'h9f ? 16'h3a00 :  // <0086> "
addr == 16'ha0 ? 16'h2c00 :  // <0086> "

addr == 16'ha1 ? 16'hf80a :  // <0088> pop rtna // rtn
addr == 16'ha2 ? 16'h180a :  // <0088> pop g6 // "
addr == 16'ha3 ? 16'h100a :  // <0088> pop x // "
addr == 16'ha4 ? 16'hfc00 :  // <0088> rtn

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// func get4x // = 0x00a5
addr == 16'ha5 ? 16'h2802 :  // <0092> push i // func get4x
addr == 16'ha6 ? 16'h2803 :  // <0092> push j // "
addr == 16'ha7 ? 16'h2804 :  // <0092> push x // "
addr == 16'ha8 ? 16'h2805 :  // <0092> push y // "
addr == 16'ha9 ? 16'h283e :  // <0092> push rtna // "
// y = digit counter
// j = sum
addr == 16'haa ? 16'h1604 :  // <0095> y = 4
// :again // = 0x00ab
addr == 16'hab ? 16'h13a0 :  // <0098> x = :hexdigits
addr == 16'hac ? 16'h0060 :  // <0098> "
addr == 16'had ? 16'h0a10 :  // <0099> i = 16
addr == 16'hae ? 16'hfba0 :  // <0100> call :find_in_fetch
addr == 16'haf ? 16'h0040 :  // <0100> "
addr == 16'hb0 ? 16'hfc00 :  // <0100> "
addr == 16'hb1 ? 16'h0760 :  // <0101> b = -1
addr == 16'hb2 ? 16'he007 :  // <0102> br eq :fail
addr == 16'hb3 ? 16'h00c6 :  // <0102> "
addr == 16'hb4 ? 16'h0400 :  // <0103> b = a
addr == 16'hb5 ? 16'h0003 :  // <0104> a = j
addr == 16'hb6 ? 16'h0352 :  // <0105> a = a<<4
addr == 16'hb7 ? 16'hc800 :  // <0106> nop
addr == 16'hb8 ? 16'h0f34 :  // <0107> j = or
addr == 16'hb9 ? 16'h1360 :  // <0108> x = -1
addr == 16'hba ? 16'hc800 :  // <0109> nop
addr == 16'hbb ? 16'h1720 :  // <0110> y = x+y
addr == 16'hbc ? 16'he400 :  // <0111> bn 2z :again
addr == 16'hbd ? 16'h00ab :  // <0111> "
addr == 16'hbe ? 16'h0003 :  // <0112> a = j
addr == 16'hbf ? 16'h0600 :  // <0113> b = 0
addr == 16'hc0 ? 16'hf80a :  // <0114> pop rtna // rtn
addr == 16'hc1 ? 16'h140a :  // <0114> pop y // "
addr == 16'hc2 ? 16'h100a :  // <0114> pop x // "
addr == 16'hc3 ? 16'h0c0a :  // <0114> pop j // "
addr == 16'hc4 ? 16'h080a :  // <0114> pop i // "
addr == 16'hc5 ? 16'hfc00 :  // <0114> rtn
// :fail // = 0x00c6
addr == 16'hc6 ? 16'h0760 :  // <0116> b = -1
addr == 16'hc7 ? 16'hf80a :  // <0117> pop rtna // rtn
addr == 16'hc8 ? 16'h140a :  // <0117> pop y // "
addr == 16'hc9 ? 16'h100a :  // <0117> pop x // "
addr == 16'hca ? 16'h0c0a :  // <0117> pop j // "
addr == 16'hcb ? 16'h080a :  // <0117> pop i // "
addr == 16'hcc ? 16'hfc00 :  // <0117> rtn

// routine waits a number of milliseconds given in a.
// func spinwait // = 0x00cd
addr == 16'hcd ? 16'h2804 :  // <0002> push x // func spinwait
addr == 16'hce ? 16'h2805 :  // <0002> push y // "
//patch
//return
addr == 16'hcf ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x00d0
addr == 16'hd0 ? 16'h13a0 :  // <0007> x = 12500
addr == 16'hd1 ? 16'h30d4 :  // <0007> "
addr == 16'hd2 ? 16'h1760 :  // <0008> y = -1
addr == 16'hd3 ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x00d4
addr == 16'hd4 ? 16'h1320 :  // <0011> x = x+y
addr == 16'hd5 ? 16'hc800 :  // <0012> nop
addr == 16'hd6 ? 16'he400 :  // <0013> bn 2z :spinwait_inner
addr == 16'hd7 ? 16'h00d4 :  // <0013> "
addr == 16'hd8 ? 16'h0300 :  // <0014> a = a+b
addr == 16'hd9 ? 16'hc800 :  // <0015> nop
addr == 16'hda ? 16'he404 :  // <0016> bn z :spinwait_outer
addr == 16'hdb ? 16'h00d0 :  // <0016> "
addr == 16'hdc ? 16'h140a :  // <0017> pop y // rtn
addr == 16'hdd ? 16'h100a :  // <0017> pop x // "
addr == 16'hde ? 16'hfc00 :  // <0017> rtn



// ////////////////////////////////////////////
// :main // = 0x00df
addr == 16'hdf ? 16'h2601 :  // <0072> leds = 1
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
addr == 16'he0 ? 16'h1200 :  // <0115> x = 0
addr == 16'he1 ? 16'h1601 :  // <0116> y = 1
// :patch // = 0x00e2

addr == 16'he2 ? 16'h0009 :  // <0119> a = leds
addr == 16'he3 ? 16'h0601 :  // <0120> b = 1
addr == 16'he4 ? 16'hc800 :  // <0121> nop
addr == 16'he5 ? 16'h2700 :  // <0122> leds = a+b

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
addr == 16'he6 ? 16'h3600 :  // <0200> av_ad_hi = 0
addr == 16'he7 ? 16'h3a20 :  // <0201> av_ad_lo = 0x20
addr == 16'he8 ? 16'h2fa0 :  // <0202> av_write_data = 0x6789
addr == 16'he9 ? 16'h6789 :  // <0202> "
// Avalon read from SDRAM.
addr == 16'hea ? 16'h000b :  // <0204> a = av_write_data
addr == 16'heb ? 16'h000c :  // <0205> a = av_read_data
addr == 16'hec ? 16'hfba0 :  // <0206> call put4x
addr == 16'hed ? 16'h0068 :  // <0206> "
addr == 16'hee ? 16'hfc00 :  // <0206> "
addr == 16'hef ? 16'h03a0 :  // <0207> a = 1000
addr == 16'hf0 ? 16'h03e8 :  // <0207> "
addr == 16'hf1 ? 16'hfba0 :  // <0208> call :spinwait
addr == 16'hf2 ? 16'h00cd :  // <0208> "
addr == 16'hf3 ? 16'hfc00 :  // <0208> "

// :verify_all // = 0x00f4
addr == 16'hf4 ? 16'h03a0 :  // <0211> a = 1000
addr == 16'hf5 ? 16'h03e8 :  // <0211> "
addr == 16'hf6 ? 16'hfba0 :  // <0212> call :spinwait
addr == 16'hf7 ? 16'h00cd :  // <0212> "
addr == 16'hf8 ? 16'hfc00 :  // <0212> "
addr == 16'hf9 ? 16'h022d :  // <0213> a = 45 // putasc {-}
addr == 16'hfa ? 16'h37a0 :  // <0213> putasc {-}
addr == 16'hfb ? 16'h0200 :  // <0213> "
addr == 16'hfc ? 16'h3a00 :  // <0213> "
addr == 16'hfd ? 16'h2c00 :  // <0213> "
addr == 16'hfe ? 16'h0ba0 :  // <0214> i = 0x200
addr == 16'hff ? 16'h0200 :  // <0214> "
addr == 16'h100 ? 16'h0f60 :  // <0215> j = -1
addr == 16'h101 ? 16'hc800 :  // <0216> nop
// :next_page // = 0x0102
addr == 16'h102 ? 16'h0b10 :  // <0218> i = i+j
addr == 16'h103 ? 16'h3402 :  // <0219> av_ad_hi = i

// fill SDRAM page with a pattern.
addr == 16'h104 ? 16'h0257 :  // <0222> a = 87 // putasc W
addr == 16'h105 ? 16'h37a0 :  // <0222> putasc W
addr == 16'h106 ? 16'h0200 :  // <0222> "
addr == 16'h107 ? 16'h3a00 :  // <0222> "
addr == 16'h108 ? 16'h2c00 :  // <0222> "
addr == 16'h109 ? 16'h1200 :  // <0223> x = 0x0000
// :fill_more // = 0x010a
addr == 16'h10a ? 16'h0004 :  // <0225> a = x
addr == 16'h10b ? 16'h0760 :  // <0226> b = 0xffff
addr == 16'h10c ? 16'hc800 :  // <0227> nop
addr == 16'h10d ? 16'h1b38 :  // <0228> g6 = xor
addr == 16'h10e ? 16'h3402 :  // <0229> av_ad_hi = i
addr == 16'h10f ? 16'h3804 :  // <0230> av_ad_lo = x
addr == 16'h110 ? 16'h2c06 :  // <0231> av_write_data = g6
addr == 16'h111 ? 16'h1602 :  // <0232> y = 2
addr == 16'h112 ? 16'hc800 :  // <0233> nop
addr == 16'h113 ? 16'h1320 :  // <0234> x = x+y
addr == 16'h114 ? 16'he400 :  // <0235> bn 2z :fill_more
addr == 16'h115 ? 16'h010a :  // <0235> "

// verify pattern in SDRAM.
addr == 16'h116 ? 16'h1200 :  // <0238> x = 0x0000
// :verify_more // = 0x0117
addr == 16'h117 ? 16'h3402 :  // <0240> av_ad_hi = i
addr == 16'h118 ? 16'h3804 :  // <0241> av_ad_lo = x
addr == 16'h119 ? 16'h180b :  // <0242> g6 = av_write_data
addr == 16'h11a ? 16'h180c :  // <0243> g6 = av_read_data
// a = x
// call put4x
// putasc "="
// a = 500
// call :spinwait
// a = g6
// call put4x
// putasc "\r"
// putasc "\n"
// a = 500
// call :spinwait
addr == 16'h11b ? 16'h0004 :  // <0255> a = x
addr == 16'h11c ? 16'h0760 :  // <0256> b = 0xffff
addr == 16'h11d ? 16'hc800 :  // <0257> nop
addr == 16'h11e ? 16'h0338 :  // <0258> a = xor
addr == 16'h11f ? 16'h0406 :  // <0259> b = g6
addr == 16'h120 ? 16'hc800 :  // <0260> nop
addr == 16'h121 ? 16'he407 :  // <0261> bn eq :sdram_err
addr == 16'h122 ? 16'h012f :  // <0261> "
addr == 16'h123 ? 16'h1602 :  // <0262> y = 2
addr == 16'h124 ? 16'hc800 :  // <0263> nop
addr == 16'h125 ? 16'h1320 :  // <0264> x = x+y
addr == 16'h126 ? 16'he400 :  // <0265> bn 2z :verify_more
addr == 16'h127 ? 16'h0117 :  // <0265> "

addr == 16'h128 ? 16'h0002 :  // <0267> a = i
addr == 16'h129 ? 16'h0600 :  // <0268> b = 0
addr == 16'h12a ? 16'hc800 :  // <0269> nop
addr == 16'h12b ? 16'he404 :  // <0270> bn z :next_page
addr == 16'h12c ? 16'h0102 :  // <0270> "
addr == 16'h12d ? 16'he00f :  // <0271> jmp :verify_all
addr == 16'h12e ? 16'h00f4 :  // <0271> "

// :sdram_err // = 0x012f
addr == 16'h12f ? 16'h1400 :  // <0274> y = a
addr == 16'h130 ? 16'h03a0 :  // <0275> a = 1000
addr == 16'h131 ? 16'h03e8 :  // <0275> "
addr == 16'h132 ? 16'hfba0 :  // <0276> call :spinwait
addr == 16'h133 ? 16'h00cd :  // <0276> "
addr == 16'h134 ? 16'hfc00 :  // <0276> "
addr == 16'h135 ? 16'h0006 :  // <0277> a = g6
addr == 16'h136 ? 16'hfba0 :  // <0278> call :put4x
addr == 16'h137 ? 16'h0068 :  // <0278> "
addr == 16'h138 ? 16'hfc00 :  // <0278> "
addr == 16'h139 ? 16'h03a0 :  // <0279> a = 1000
addr == 16'h13a ? 16'h03e8 :  // <0279> "
addr == 16'h13b ? 16'hfba0 :  // <0280> call :spinwait
addr == 16'h13c ? 16'h00cd :  // <0280> "
addr == 16'h13d ? 16'hfc00 :  // <0280> "
addr == 16'h13e ? 16'h0221 :  // <0281> a = 33 // putasc "!"
addr == 16'h13f ? 16'h37a0 :  // <0281> putasc "!"
addr == 16'h140 ? 16'h0200 :  // <0281> "
addr == 16'h141 ? 16'h3a00 :  // <0281> "
addr == 16'h142 ? 16'h2c00 :  // <0281> "
addr == 16'h143 ? 16'h023d :  // <0282> a = 61 // putasc "="
addr == 16'h144 ? 16'h37a0 :  // <0282> putasc "="
addr == 16'h145 ? 16'h0200 :  // <0282> "
addr == 16'h146 ? 16'h3a00 :  // <0282> "
addr == 16'h147 ? 16'h2c00 :  // <0282> "
addr == 16'h148 ? 16'h0005 :  // <0283> a = y
addr == 16'h149 ? 16'hfba0 :  // <0284> call :put4x
addr == 16'h14a ? 16'h0068 :  // <0284> "
addr == 16'h14b ? 16'hfc00 :  // <0284> "
addr == 16'h14c ? 16'h03a0 :  // <0285> a = 1000
addr == 16'h14d ? 16'h03e8 :  // <0285> "
addr == 16'h14e ? 16'hfba0 :  // <0286> call :spinwait
addr == 16'h14f ? 16'h00cd :  // <0286> "
addr == 16'h150 ? 16'hfc00 :  // <0286> "
addr == 16'h151 ? 16'h0240 :  // <0287> a = 64 // putasc "@"
addr == 16'h152 ? 16'h37a0 :  // <0287> putasc "@"
addr == 16'h153 ? 16'h0200 :  // <0287> "
addr == 16'h154 ? 16'h3a00 :  // <0287> "
addr == 16'h155 ? 16'h2c00 :  // <0287> "
addr == 16'h156 ? 16'h000d :  // <0288> a = av_ad_hi
addr == 16'h157 ? 16'hfba0 :  // <0289> call :put4x
addr == 16'h158 ? 16'h0068 :  // <0289> "
addr == 16'h159 ? 16'hfc00 :  // <0289> "
addr == 16'h15a ? 16'h03a0 :  // <0290> a = 1000
addr == 16'h15b ? 16'h03e8 :  // <0290> "
addr == 16'h15c ? 16'hfba0 :  // <0291> call :spinwait
addr == 16'h15d ? 16'h00cd :  // <0291> "
addr == 16'h15e ? 16'hfc00 :  // <0291> "
addr == 16'h15f ? 16'h000e :  // <0292> a = av_ad_lo
addr == 16'h160 ? 16'hfba0 :  // <0293> call put4x
addr == 16'h161 ? 16'h0068 :  // <0293> "
addr == 16'h162 ? 16'hfc00 :  // <0293> "
// :halt // = 0x0163
addr == 16'h163 ? 16'he00f :  // <0295> jmp :halt
addr == 16'h164 ? 16'h0163 :  // <0295> "

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

addr == 16'h165 ? 16'h0264 :  // <0320> a = 100
addr == 16'h166 ? 16'hfba0 :  // <0321> call :spinwait
addr == 16'h167 ? 16'h00cd :  // <0321> "
addr == 16'h168 ? 16'hfc00 :  // <0321> "

// b = 32
// putchar b
// m9k_addr = x
// a = m9k_data
// call put4x

// b = 13
// putchar b
// b = 10
// putchar b

addr == 16'h169 ? 16'he00f :  // <0334> jmp :patch
addr == 16'h16a ? 16'h00e2 :  // <0334> "





// using i as index into string.
addr == 16'h16b ? 16'h0a00 :  // <0341> i = 0

// cache the string limit in g6.
addr == 16'h16c ? 16'h0210 :  // <0344> a = 16
addr == 16'h16d ? 16'h0760 :  // <0345> b = 0xffff
addr == 16'h16e ? 16'hc800 :  // <0346> nop
addr == 16'h16f ? 16'h1b38 :  // <0347> g6 = xor

// :again // = 0x0170
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

addr == 16'h170 ? 16'h0264 :  // <0361> a = 100
addr == 16'h171 ? 16'hfba0 :  // <0362> call :spinwait
addr == 16'h172 ? 16'h00cd :  // <0362> "
addr == 16'h173 ? 16'hfc00 :  // <0362> "

// increment LEDs
addr == 16'h174 ? 16'h0009 :  // <0365> a = leds
addr == 16'h175 ? 16'h0601 :  // <0366> b = 1
addr == 16'h176 ? 16'hc800 :  // <0367> nop
addr == 16'h177 ? 16'h2700 :  // <0368> leds = a+b

// fetch a word from test pattern to the UART.  its low byte is a character.
addr == 16'h178 ? 16'h0fa0 :  // <0371> j = :msg
addr == 16'h179 ? 16'h0187 :  // <0371> "
addr == 16'h17a ? 16'hc800 :  // <0372> nop
addr == 16'h17b ? 16'hd310 :  // <0373> fetch a from i+j
addr == 16'h17c ? 16'h03b0 :  // <0373> "
//    putchar a

// increment index & wrap around end of pattern.
addr == 16'h17d ? 16'h0e01 :  // <0377> j = 1
addr == 16'h17e ? 16'hc800 :  // <0378> nop
addr == 16'h17f ? 16'h0b10 :  // <0379> i = i+j
addr == 16'h180 ? 16'h0c06 :  // <0380> j = g6
addr == 16'h181 ? 16'hc800 :  // <0381> nop
addr == 16'h182 ? 16'he401 :  // <0382> bn 1z :no_wrap
addr == 16'h183 ? 16'h0185 :  // <0382> "
addr == 16'h184 ? 16'h0a00 :  // <0383> i = 0
// :no_wrap // = 0x0185

// repeat forever.
addr == 16'h185 ? 16'he00f :  // <0387> jmp :again
addr == 16'h186 ? 16'h0170 :  // <0387> "

// :msg // = 0x0187
// "1234567890abcdef\n\x00"
addr == 16'h187 ? 16'h3231 :  // <0390> 21
addr == 16'h188 ? 16'h3433 :  // <0390> 43
addr == 16'h189 ? 16'h3635 :  // <0390> 65
addr == 16'h18a ? 16'h3837 :  // <0390> 87
addr == 16'h18b ? 16'h3039 :  // <0390> 09
addr == 16'h18c ? 16'h6261 :  // <0390> ba
addr == 16'h18d ? 16'h6463 :  // <0390> dc
addr == 16'h18e ? 16'h6665 :  // <0390> fe
addr == 16'h18f ? 16'h000a :  // <0390>   


        
                16'hxxxx;
        endmodule
    
