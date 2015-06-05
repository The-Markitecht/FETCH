
        `include "header.v"

        module visor_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.
// for debugging supervisor mcu.

// register file configuration

// application-specific register aliases.





//alias_src  tg_debug_out	    [incr counter]  {}


addr == 16'h00 ? 16'he00f :  // <0052> jmp :main
addr == 16'h01 ? 16'h00d7 :  // <0052> "


// driver library for my_uart_v2 simple async transceiver.




// routine sends out the low byte from a to the UART.  blocks until the UART accepts the byte.
// ######## func putchar_atx // = 0x0002
addr == 16'h02 ? 16'h2004 :  // <0035> push x // func putchar_atx

addr == 16'h03 ? 16'h1000 :  // <0037> x = a

// wait for UART to be idle (not busy).
addr == 16'h04 ? 16'h0202 :  // <0040> a = $atx_busy_mask
// :pcatx_wait_for_idle // = 0x0005
addr == 16'h05 ? 16'h0412 :  // <0042> b = atx_ctrl
addr == 16'h06 ? 16'he403 :  // <0043> bn and0z :pcatx_wait_for_idle
addr == 16'h07 ? 16'h0005 :  // <0043> "

// push word to the UART.  its low byte is a character.
addr == 16'h08 ? 16'h4404 :  // <0046> atx_data = x

// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_ctrl.
addr == 16'h09 ? 16'h4a01 :  // <0051> atx_ctrl = $atx_load_mask

// wait until UART is busy, as acknowledgement.
addr == 16'h0a ? 16'h0202 :  // <0054> a = $atx_busy_mask
// :pcatx_wait_for_busy // = 0x000b
addr == 16'h0b ? 16'h0412 :  // <0056> b = atx_ctrl
addr == 16'h0c ? 16'he003 :  // <0057> br and0z :pcatx_wait_for_busy
addr == 16'h0d ? 16'h000b :  // <0057> "
addr == 16'h0e ? 16'h4a00 :  // <0058> atx_ctrl = 0
addr == 16'h0f ? 16'h1008 :  // <0059> pop x // end_func
addr == 16'h10 ? 16'hfc00 :  // <0059> end_func

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// ######## func getchar_atx // = 0x0011
// wait until UART is busy, then idle.
addr == 16'h11 ? 16'h0204 :  // <0065> a = $arx_busy_mask
// :wait_for_busy // = 0x0012
addr == 16'h12 ? 16'h0412 :  // <0067> b = atx_ctrl
addr == 16'h13 ? 16'he003 :  // <0068> br and0z :wait_for_busy
addr == 16'h14 ? 16'h0012 :  // <0068> "
// :wait_for_idle // = 0x0015
addr == 16'h15 ? 16'h0412 :  // <0070> b = atx_ctrl
addr == 16'h16 ? 16'he403 :  // <0071> bn and0z :wait_for_idle
addr == 16'h17 ? 16'h0015 :  // <0071> "
addr == 16'h18 ? 16'h0011 :  // <0072> a = atx_data
addr == 16'h19 ? 16'hfc00 :  // <0073> end_func

// returns a character in a, or -1 if none.
// this version can miss characters if not polled while the character is arriving.
// ######## func pollchar_atx // = 0x001a
// check for UART is busy, then idle.
addr == 16'h1a ? 16'h0204 :  // <0079> a = $arx_busy_mask
addr == 16'h1b ? 16'h0412 :  // <0080> b = atx_ctrl
addr == 16'h1c ? 16'he003 :  // <0081> br and0z :none
addr == 16'h1d ? 16'h0023 :  // <0081> "
// :wait_for_idle // = 0x001e
addr == 16'h1e ? 16'h0412 :  // <0083> b = atx_ctrl
addr == 16'h1f ? 16'he403 :  // <0084> bn and0z :wait_for_idle
addr == 16'h20 ? 16'h001e :  // <0084> "
addr == 16'h21 ? 16'h0011 :  // <0085> a = atx_data
addr == 16'h22 ? 16'hfc00 :  // <0086> rtn
// :none // = 0x0023
addr == 16'h23 ? 16'h0360 :  // <0088> a = -1
addr == 16'h24 ? 16'hfc00 :  // <0089> end_func



// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// ######## func fetch_byte // = 0x0025
addr == 16'h25 ? 16'h0601 :  // <0005> b = 1
addr == 16'h26 ? 16'he003 :  // <0006> br and0z :pick_byte_even
addr == 16'h27 ? 16'h0030 :  // <0006> "
addr == 16'h28 ? 16'h0350 :  // <0007> a = a>>1
addr == 16'h29 ? 16'h0404 :  // <0008> b = x
addr == 16'h2a ? 16'hc800 :  // <0009> fetch a from a+b
addr == 16'h2b ? 16'hd300 :  // <0009> "
addr == 16'h2c ? 16'h03b0 :  // <0009> "
addr == 16'h2d ? 16'h0353 :  // <0010> a = a>>4
addr == 16'h2e ? 16'h0353 :  // <0011> a = a>>4
addr == 16'h2f ? 16'hfc00 :  // <0012> rtn
// :pick_byte_even // = 0x0030
addr == 16'h30 ? 16'h0350 :  // <0014> a = a>>1
addr == 16'h31 ? 16'h0404 :  // <0015> b = x
addr == 16'h32 ? 16'hc800 :  // <0016> fetch a from a+b
addr == 16'h33 ? 16'hd300 :  // <0016> "
addr == 16'h34 ? 16'h03b0 :  // <0016> "
addr == 16'h35 ? 16'h06ff :  // <0017> b = 0xff
addr == 16'h36 ? 16'hc800 :  // <0018> a = and
addr == 16'h37 ? 16'h0330 :  // <0018> "
addr == 16'h38 ? 16'hfc00 :  // <0019> end_func

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// ######## func find_in_fetch // = 0x0039
addr == 16'h39 ? 16'h2002 :  // <0027> push i // func find_in_fetch
addr == 16'h3a ? 16'h2003 :  // <0027> push j // "
addr == 16'h3b ? 16'h2005 :  // <0027> push y // "
addr == 16'h3c ? 16'h203e :  // <0027> push rtna // "
addr == 16'h3d ? 16'h1400 :  // <0028> y = a
addr == 16'h3e ? 16'h0f60 :  // <0029> j = -1
// :again // = 0x003f
addr == 16'h3f ? 16'he001 :  // <0031> br iz :fail
addr == 16'h40 ? 16'h004f :  // <0031> "
addr == 16'h41 ? 16'h0b10 :  // <0032> i = ad1
addr == 16'h42 ? 16'h0002 :  // <0033> a = i
addr == 16'h43 ? 16'hfba0 :  // <0034> call :fetch_byte
addr == 16'h44 ? 16'h0025 :  // <0034> "
addr == 16'h45 ? 16'hfc00 :  // <0034> "
addr == 16'h46 ? 16'h0405 :  // <0035> b = y
addr == 16'h47 ? 16'he407 :  // <0036> bn eq :again
addr == 16'h48 ? 16'h003f :  // <0036> "
// :found // = 0x0049
addr == 16'h49 ? 16'h0002 :  // <0038> a = i
addr == 16'h4a ? 16'hf808 :  // <0039> pop rtna // rtn
addr == 16'h4b ? 16'h1408 :  // <0039> pop y // "
addr == 16'h4c ? 16'h0c08 :  // <0039> pop j // "
addr == 16'h4d ? 16'h0808 :  // <0039> pop i // "
addr == 16'h4e ? 16'hfc00 :  // <0039> rtn
// :fail // = 0x004f
addr == 16'h4f ? 16'h0360 :  // <0041> a = -1
addr == 16'h50 ? 16'hf808 :  // <0042> pop rtna // end_func
addr == 16'h51 ? 16'h1408 :  // <0042> pop y // "
addr == 16'h52 ? 16'h0c08 :  // <0042> pop j // "
addr == 16'h53 ? 16'h0808 :  // <0042> pop i // "
addr == 16'h54 ? 16'hfc00 :  // <0042> end_func



// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x0055
// "0123456789abcdef"
addr == 16'h55 ? 16'h3130 :  // <0050> 10
addr == 16'h56 ? 16'h3332 :  // <0050> 32
addr == 16'h57 ? 16'h3534 :  // <0050> 54
addr == 16'h58 ? 16'h3736 :  // <0050> 76
addr == 16'h59 ? 16'h3938 :  // <0050> 98
addr == 16'h5a ? 16'h6261 :  // <0050> ba
addr == 16'h5b ? 16'h6463 :  // <0050> dc
addr == 16'h5c ? 16'h6665 :  // <0050> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// ######## func put4x // = 0x005d
addr == 16'h5d ? 16'h2004 :  // <0054> push x // func put4x
addr == 16'h5e ? 16'h2006 :  // <0054> push g6 // "
addr == 16'h5f ? 16'h203e :  // <0054> push rtna // "
addr == 16'h60 ? 16'h13a0 :  // <0055> x = :hexdigits
addr == 16'h61 ? 16'h0055 :  // <0055> "

addr == 16'h62 ? 16'h1800 :  // <0057> g6 = a
addr == 16'h63 ? 16'h07a0 :  // <0058> b = 0xF000
addr == 16'h64 ? 16'hf000 :  // <0058> "
addr == 16'h65 ? 16'hc800 :  // <0059> a = and
addr == 16'h66 ? 16'h0330 :  // <0059> "
addr == 16'h67 ? 16'h0353 :  // <0060> a = a>>4
addr == 16'h68 ? 16'h0353 :  // <0061> a = a>>4
addr == 16'h69 ? 16'h0353 :  // <0062> a = a>>4
addr == 16'h6a ? 16'hfba0 :  // <0063> call fetch_byte
addr == 16'h6b ? 16'h0025 :  // <0063> "
addr == 16'h6c ? 16'hfc00 :  // <0063> "
addr == 16'h6d ? 16'h0000 :  // <0064> a = a // putchar a
addr == 16'h6e ? 16'hfba0 :  // <0064> putchar a
addr == 16'h6f ? 16'h0002 :  // <0064> "
addr == 16'h70 ? 16'hfc00 :  // <0064> "

addr == 16'h71 ? 16'h0006 :  // <0066> a = g6
addr == 16'h72 ? 16'h07a0 :  // <0067> b = 0x0F00
addr == 16'h73 ? 16'h0f00 :  // <0067> "
addr == 16'h74 ? 16'hc800 :  // <0068> a = and
addr == 16'h75 ? 16'h0330 :  // <0068> "
addr == 16'h76 ? 16'h0353 :  // <0069> a = a>>4
addr == 16'h77 ? 16'h0353 :  // <0070> a = a>>4
addr == 16'h78 ? 16'hfba0 :  // <0071> call fetch_byte
addr == 16'h79 ? 16'h0025 :  // <0071> "
addr == 16'h7a ? 16'hfc00 :  // <0071> "
addr == 16'h7b ? 16'h0000 :  // <0072> a = a // putchar a
addr == 16'h7c ? 16'hfba0 :  // <0072> putchar a
addr == 16'h7d ? 16'h0002 :  // <0072> "
addr == 16'h7e ? 16'hfc00 :  // <0072> "

addr == 16'h7f ? 16'h0006 :  // <0074> a = g6
addr == 16'h80 ? 16'h06f0 :  // <0075> b = 0x00F0
addr == 16'h81 ? 16'hc800 :  // <0076> a = and
addr == 16'h82 ? 16'h0330 :  // <0076> "
addr == 16'h83 ? 16'h0353 :  // <0077> a = a>>4
addr == 16'h84 ? 16'hfba0 :  // <0078> call fetch_byte
addr == 16'h85 ? 16'h0025 :  // <0078> "
addr == 16'h86 ? 16'hfc00 :  // <0078> "
addr == 16'h87 ? 16'h0000 :  // <0079> a = a // putchar a
addr == 16'h88 ? 16'hfba0 :  // <0079> putchar a
addr == 16'h89 ? 16'h0002 :  // <0079> "
addr == 16'h8a ? 16'hfc00 :  // <0079> "

addr == 16'h8b ? 16'h0006 :  // <0081> a = g6
addr == 16'h8c ? 16'h060f :  // <0082> b = 0x000F
addr == 16'h8d ? 16'hc800 :  // <0083> a = and
addr == 16'h8e ? 16'h0330 :  // <0083> "
addr == 16'h8f ? 16'hfba0 :  // <0084> call fetch_byte
addr == 16'h90 ? 16'h0025 :  // <0084> "
addr == 16'h91 ? 16'hfc00 :  // <0084> "
addr == 16'h92 ? 16'h0000 :  // <0085> a = a // putchar a
addr == 16'h93 ? 16'hfba0 :  // <0085> putchar a
addr == 16'h94 ? 16'h0002 :  // <0085> "
addr == 16'h95 ? 16'hfc00 :  // <0085> "

addr == 16'h96 ? 16'hf808 :  // <0087> pop rtna // end_func
addr == 16'h97 ? 16'h1808 :  // <0087> pop g6 // "
addr == 16'h98 ? 16'h1008 :  // <0087> pop x // "
addr == 16'h99 ? 16'hfc00 :  // <0087> end_func

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// ######## func get4x // = 0x009a
addr == 16'h9a ? 16'h2002 :  // <0091> push i // func get4x
addr == 16'h9b ? 16'h2003 :  // <0091> push j // "
addr == 16'h9c ? 16'h2004 :  // <0091> push x // "
addr == 16'h9d ? 16'h2005 :  // <0091> push y // "
addr == 16'h9e ? 16'h203e :  // <0091> push rtna // "
// y = digit counter
// j = sum
addr == 16'h9f ? 16'h1604 :  // <0094> y = 4
// :again // = 0x00a0
addr == 16'ha0 ? 16'hfba0 :  // <0096> getchar
addr == 16'ha1 ? 16'h0011 :  // <0096> "
addr == 16'ha2 ? 16'hfc00 :  // <0096> "
addr == 16'ha3 ? 16'h13a0 :  // <0097> x = :hexdigits
addr == 16'ha4 ? 16'h0055 :  // <0097> "
addr == 16'ha5 ? 16'h0a10 :  // <0098> i = 16
addr == 16'ha6 ? 16'hfba0 :  // <0099> call :find_in_fetch
addr == 16'ha7 ? 16'h0039 :  // <0099> "
addr == 16'ha8 ? 16'hfc00 :  // <0099> "
addr == 16'ha9 ? 16'h0760 :  // <0100> b = -1
addr == 16'haa ? 16'he007 :  // <0101> br eq :fail
addr == 16'hab ? 16'h00bf :  // <0101> "
addr == 16'hac ? 16'h0400 :  // <0102> b = a
addr == 16'had ? 16'h0003 :  // <0103> a = j
addr == 16'hae ? 16'h0352 :  // <0104> a = a<<4
addr == 16'haf ? 16'hc800 :  // <0105> j = or
addr == 16'hb0 ? 16'h0f34 :  // <0105> "
addr == 16'hb1 ? 16'h1360 :  // <0106> x = -1
addr == 16'hb2 ? 16'hc800 :  // <0107> y = x+y
addr == 16'hb3 ? 16'h1720 :  // <0107> "
addr == 16'hb4 ? 16'h0005 :  // <0108> a = y
addr == 16'hb5 ? 16'he400 :  // <0109> bn az :again
addr == 16'hb6 ? 16'h00a0 :  // <0109> "
addr == 16'hb7 ? 16'h0003 :  // <0110> a = j
addr == 16'hb8 ? 16'h0600 :  // <0111> b = 0
addr == 16'hb9 ? 16'hf808 :  // <0112> pop rtna // rtn
addr == 16'hba ? 16'h1408 :  // <0112> pop y // "
addr == 16'hbb ? 16'h1008 :  // <0112> pop x // "
addr == 16'hbc ? 16'h0c08 :  // <0112> pop j // "
addr == 16'hbd ? 16'h0808 :  // <0112> pop i // "
addr == 16'hbe ? 16'hfc00 :  // <0112> rtn
// :fail // = 0x00bf
addr == 16'hbf ? 16'h0760 :  // <0114> b = -1
addr == 16'hc0 ? 16'hf808 :  // <0115> pop rtna // end_func
addr == 16'hc1 ? 16'h1408 :  // <0115> pop y // "
addr == 16'hc2 ? 16'h1008 :  // <0115> pop x // "
addr == 16'hc3 ? 16'h0c08 :  // <0115> pop j // "
addr == 16'hc4 ? 16'h0808 :  // <0115> pop i // "
addr == 16'hc5 ? 16'hfc00 :  // <0115> end_func

// routine waits a number of milliseconds given in a.
// ######## func spinwait // = 0x00c6
addr == 16'hc6 ? 16'h2004 :  // <0002> push x // func spinwait
addr == 16'hc7 ? 16'h2005 :  // <0002> push y // "
//patch
//rtn
addr == 16'hc8 ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x00c9
addr == 16'hc9 ? 16'h13a0 :  // <0007> x = 16666
addr == 16'hca ? 16'h411a :  // <0007> "
addr == 16'hcb ? 16'h1760 :  // <0008> y = -1
addr == 16'hcc ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x00cd
// use of the ad2 name overrides auto-nop here.
addr == 16'hcd ? 16'h1320 :  // <0012> x = ad2
addr == 16'hce ? 16'he402 :  // <0013> bn xz :spinwait_inner
addr == 16'hcf ? 16'h00cd :  // <0013> "
addr == 16'hd0 ? 16'hc800 :  // <0014> a = a+b
addr == 16'hd1 ? 16'h0300 :  // <0014> "
addr == 16'hd2 ? 16'he400 :  // <0015> bn az :spinwait_outer
addr == 16'hd3 ? 16'h00c9 :  // <0015> "
addr == 16'hd4 ? 16'h1408 :  // <0016> pop y // end_func
addr == 16'hd5 ? 16'h1008 :  // <0016> pop x // "
addr == 16'hd6 ? 16'hfc00 :  // <0016> end_func




// ////////////////////////////////////////////
// :main // = 0x00d7
// put target into reset.
addr == 16'hd7 ? 16'h3e02 :  // <0070> bus_ctrl = $tg_reset_mask

// init visor.
addr == 16'hd8 ? 16'h3360 :  // <0073> bp3_addr = $bp_disable
addr == 16'hd9 ? 16'h2f60 :  // <0074> bp2_addr = $bp_disable
addr == 16'hda ? 16'h2b60 :  // <0075> bp1_addr = $bp_disable
addr == 16'hdb ? 16'h2760 :  // <0076> bp0_addr = $bp_disable

// startup message
addr == 16'hdc ? 16'h020d :  // <0079> a = 13 // puteol
addr == 16'hdd ? 16'h0000 :  // <0079> a = a // puteol
addr == 16'hde ? 16'hfba0 :  // <0079> puteol
addr == 16'hdf ? 16'h0002 :  // <0079> "
addr == 16'he0 ? 16'hfc00 :  // <0079> "
addr == 16'he1 ? 16'h020a :  // <0079> a = 10 // puteol
addr == 16'he2 ? 16'h0000 :  // <0079> a = a // puteol
addr == 16'he3 ? 16'hfba0 :  // <0079> puteol
addr == 16'he4 ? 16'h0002 :  // <0079> "
addr == 16'he5 ? 16'hfc00 :  // <0079> "
addr == 16'he6 ? 16'h0256 :  // <0080> a = 86 // putasc "V"
addr == 16'he7 ? 16'h0000 :  // <0080> a = a // putasc "V"
addr == 16'he8 ? 16'hfba0 :  // <0080> putasc "V"
addr == 16'he9 ? 16'h0002 :  // <0080> "
addr == 16'hea ? 16'hfc00 :  // <0080> "
addr == 16'heb ? 16'h0249 :  // <0081> a = 73 // putasc "I"
addr == 16'hec ? 16'h0000 :  // <0081> a = a // putasc "I"
addr == 16'hed ? 16'hfba0 :  // <0081> putasc "I"
addr == 16'hee ? 16'h0002 :  // <0081> "
addr == 16'hef ? 16'hfc00 :  // <0081> "
addr == 16'hf0 ? 16'h0253 :  // <0082> a = 83 // putasc "S"
addr == 16'hf1 ? 16'h0000 :  // <0082> a = a // putasc "S"
addr == 16'hf2 ? 16'hfba0 :  // <0082> putasc "S"
addr == 16'hf3 ? 16'h0002 :  // <0082> "
addr == 16'hf4 ? 16'hfc00 :  // <0082> "
addr == 16'hf5 ? 16'h024f :  // <0083> a = 79 // putasc "O"
addr == 16'hf6 ? 16'h0000 :  // <0083> a = a // putasc "O"
addr == 16'hf7 ? 16'hfba0 :  // <0083> putasc "O"
addr == 16'hf8 ? 16'h0002 :  // <0083> "
addr == 16'hf9 ? 16'hfc00 :  // <0083> "
addr == 16'hfa ? 16'h0252 :  // <0084> a = 82 // putasc "R"
addr == 16'hfb ? 16'h0000 :  // <0084> a = a // putasc "R"
addr == 16'hfc ? 16'hfba0 :  // <0084> putasc "R"
addr == 16'hfd ? 16'h0002 :  // <0084> "
addr == 16'hfe ? 16'hfc00 :  // <0084> "

// check for bootloader signal.
addr == 16'hff ? 16'h0019 :  // <0087> a = boot_break
addr == 16'h100 ? 16'he400 :  // <0088> bn az :boot_run
addr == 16'h101 ? 16'h0108 :  // <0088> "
// ^^^ for press-to-debug; runs target by default.
// br az :boot_run
// ^^^ for press-to-run; debugs target by default.
// step into the first target instruction.
addr == 16'h102 ? 16'h3e08 :  // <0093> bus_ctrl = $bp_step_mask
addr == 16'h103 ? 16'hfba0 :  // <0094> call :wait_for_bp
addr == 16'h104 ? 16'h01b8 :  // <0094> "
addr == 16'h105 ? 16'hfc00 :  // <0094> "
addr == 16'h106 ? 16'he00f :  // <0095> jmp :cmd_loop
addr == 16'h107 ? 16'h0109 :  // <0095> "
// release target reset, to run.
// :boot_run // = 0x0108
addr == 16'h108 ? 16'h3e00 :  // <0098> bus_ctrl = 0

// command prompt loop.
// :cmd_loop // = 0x0109
addr == 16'h109 ? 16'h000f :  // <0102> a = bus_ctrl
addr == 16'h10a ? 16'h0600 :  // <0103> b = 0
addr == 16'h10b ? 16'he007 :  // <0104> br eq :running_prompt
addr == 16'h10c ? 16'h0132 :  // <0104> "

addr == 16'h10d ? 16'hfba0 :  // <0106> call :dump_target
addr == 16'h10e ? 16'h027f :  // <0106> "
addr == 16'h10f ? 16'hfc00 :  // <0106> "
addr == 16'h110 ? 16'h0016 :  // <0107> a = tg_code_addr
addr == 16'h111 ? 16'hfba0 :  // <0108> call :put4x
addr == 16'h112 ? 16'h005d :  // <0108> "
addr == 16'h113 ? 16'hfc00 :  // <0108> "
addr == 16'h114 ? 16'h022c :  // <0109> a = 44 // putasc ","
addr == 16'h115 ? 16'h0000 :  // <0109> a = a // putasc ","
addr == 16'h116 ? 16'hfba0 :  // <0109> putasc ","
addr == 16'h117 ? 16'h0002 :  // <0109> "
addr == 16'h118 ? 16'hfc00 :  // <0109> "
addr == 16'h119 ? 16'h0015 :  // <0110> a = exr_shadow
addr == 16'h11a ? 16'hfba0 :  // <0111> call :put4x
addr == 16'h11b ? 16'h005d :  // <0111> "
addr == 16'h11c ? 16'hfc00 :  // <0111> "
addr == 16'h11d ? 16'h0220 :  // <0112> a = 32 // putasc " "
addr == 16'h11e ? 16'h0000 :  // <0112> a = a // putasc " "
addr == 16'h11f ? 16'hfba0 :  // <0112> putasc " "
addr == 16'h120 ? 16'h0002 :  // <0112> "
addr == 16'h121 ? 16'hfc00 :  // <0112> "
addr == 16'h122 ? 16'h023e :  // <0113> a = 62 // putasc ">"
addr == 16'h123 ? 16'h0000 :  // <0113> a = a // putasc ">"
addr == 16'h124 ? 16'hfba0 :  // <0113> putasc ">"
addr == 16'h125 ? 16'h0002 :  // <0113> "
addr == 16'h126 ? 16'hfc00 :  // <0113> "
addr == 16'h127 ? 16'hfba0 :  // <0114> getchar_echo
addr == 16'h128 ? 16'h0011 :  // <0114> "
addr == 16'h129 ? 16'hfc00 :  // <0114> "
addr == 16'h12a ? 16'h2000 :  // <0114> push a // "
addr == 16'h12b ? 16'h0000 :  // <0114> a = a // "
addr == 16'h12c ? 16'hfba0 :  // <0114> "
addr == 16'h12d ? 16'h0002 :  // <0114> "
addr == 16'h12e ? 16'hfc00 :  // <0114> "
addr == 16'h12f ? 16'h0008 :  // <0114> pop a // "
addr == 16'h130 ? 16'he00f :  // <0115> jmp :parse_cmd
addr == 16'h131 ? 16'h0161 :  // <0115> "

// :running_prompt // = 0x0132
addr == 16'h132 ? 16'h020d :  // <0118> a = 13 // puteol
addr == 16'h133 ? 16'h0000 :  // <0118> a = a // puteol
addr == 16'h134 ? 16'hfba0 :  // <0118> puteol
addr == 16'h135 ? 16'h0002 :  // <0118> "
addr == 16'h136 ? 16'hfc00 :  // <0118> "
addr == 16'h137 ? 16'h020a :  // <0118> a = 10 // puteol
addr == 16'h138 ? 16'h0000 :  // <0118> a = a // puteol
addr == 16'h139 ? 16'hfba0 :  // <0118> puteol
addr == 16'h13a ? 16'h0002 :  // <0118> "
addr == 16'h13b ? 16'hfc00 :  // <0118> "
addr == 16'h13c ? 16'h0252 :  // <0119> a = 82 // putasc "R"
addr == 16'h13d ? 16'h0000 :  // <0119> a = a // putasc "R"
addr == 16'h13e ? 16'hfba0 :  // <0119> putasc "R"
addr == 16'h13f ? 16'h0002 :  // <0119> "
addr == 16'h140 ? 16'hfc00 :  // <0119> "
addr == 16'h141 ? 16'h0255 :  // <0120> a = 85 // putasc "U"
addr == 16'h142 ? 16'h0000 :  // <0120> a = a // putasc "U"
addr == 16'h143 ? 16'hfba0 :  // <0120> putasc "U"
addr == 16'h144 ? 16'h0002 :  // <0120> "
addr == 16'h145 ? 16'hfc00 :  // <0120> "
addr == 16'h146 ? 16'h024e :  // <0121> a = 78 // putasc "N"
addr == 16'h147 ? 16'h0000 :  // <0121> a = a // putasc "N"
addr == 16'h148 ? 16'hfba0 :  // <0121> putasc "N"
addr == 16'h149 ? 16'h0002 :  // <0121> "
addr == 16'h14a ? 16'hfc00 :  // <0121> "
addr == 16'h14b ? 16'h0220 :  // <0122> a = 32 // putasc " "
addr == 16'h14c ? 16'h0000 :  // <0122> a = a // putasc " "
addr == 16'h14d ? 16'hfba0 :  // <0122> putasc " "
addr == 16'h14e ? 16'h0002 :  // <0122> "
addr == 16'h14f ? 16'hfc00 :  // <0122> "
addr == 16'h150 ? 16'h023e :  // <0123> a = 62 // putasc ">"
addr == 16'h151 ? 16'h0000 :  // <0123> a = a // putasc ">"
addr == 16'h152 ? 16'hfba0 :  // <0123> putasc ">"
addr == 16'h153 ? 16'h0002 :  // <0123> "
addr == 16'h154 ? 16'hfc00 :  // <0123> "
// :run_poll // = 0x0155
addr == 16'h155 ? 16'hfba0 :  // <0125> pollchar
addr == 16'h156 ? 16'h001a :  // <0125> "
addr == 16'h157 ? 16'hfc00 :  // <0125> "
addr == 16'h158 ? 16'h0760 :  // <0126> b = -1
addr == 16'h159 ? 16'he407 :  // <0127> bn eq :parse_cmd
addr == 16'h15a ? 16'h0161 :  // <0127> "
addr == 16'h15b ? 16'h0018 :  // <0128> a = bp_status
addr == 16'h15c ? 16'he000 :  // <0129> br az :run_poll
addr == 16'h15d ? 16'h0155 :  // <0129> "
// target hit a breakpoint; switch to stepping mode.
addr == 16'h15e ? 16'h3e08 :  // <0131> bus_ctrl = $bp_step_mask
addr == 16'h15f ? 16'he00f :  // <0132> jmp :cmd_loop
addr == 16'h160 ? 16'h0109 :  // <0132> "

// :parse_cmd // = 0x0161

// command = step next instruction.
addr == 16'h161 ? 16'h066e :  // <0137> b = 110 // asc b = "n"
addr == 16'h162 ? 16'he407 :  // <0138> bn eq :skip_step
addr == 16'h163 ? 16'h016b :  // <0138> "
addr == 16'h164 ? 16'h3e08 :  // <0139> bus_ctrl = $bp_step_mask
addr == 16'h165 ? 16'h2409 :  // <0140> bp0_addr = bp0_addr
addr == 16'h166 ? 16'hfba0 :  // <0141> call :wait_for_bp
addr == 16'h167 ? 16'h01b8 :  // <0141> "
addr == 16'h168 ? 16'hfc00 :  // <0141> "
addr == 16'h169 ? 16'he00f :  // <0142> jmp :cmd_loop
addr == 16'h16a ? 16'h0109 :  // <0142> "
// :skip_step // = 0x016b

// command = reset target.
addr == 16'h16b ? 16'h0652 :  // <0146> b = 82 // asc b = "R"
addr == 16'h16c ? 16'he407 :  // <0147> bn eq :skip_reset
addr == 16'h16d ? 16'h0177 :  // <0147> "
addr == 16'h16e ? 16'h3e02 :  // <0148> bus_ctrl = $tg_reset_mask
addr == 16'h16f ? 16'hc800 :  // <0149> nop
addr == 16'h170 ? 16'hc800 :  // <0150> nop
addr == 16'h171 ? 16'h3e08 :  // <0151> bus_ctrl = $bp_step_mask
addr == 16'h172 ? 16'hfba0 :  // <0152> call :wait_for_bp
addr == 16'h173 ? 16'h01b8 :  // <0152> "
addr == 16'h174 ? 16'hfc00 :  // <0152> "
addr == 16'h175 ? 16'he00f :  // <0153> jmp :cmd_loop
addr == 16'h176 ? 16'h0109 :  // <0153> "
// :skip_reset // = 0x0177

// command = load program.
addr == 16'h177 ? 16'h066c :  // <0157> b = 108 // asc b = "l"
addr == 16'h178 ? 16'he407 :  // <0158> bn eq :skip_load
addr == 16'h179 ? 16'h017f :  // <0158> "
addr == 16'h17a ? 16'hfba0 :  // <0159> call :load_program
addr == 16'h17b ? 16'h0212 :  // <0159> "
addr == 16'h17c ? 16'hfc00 :  // <0159> "
addr == 16'h17d ? 16'he00f :  // <0160> jmp :cmd_loop
addr == 16'h17e ? 16'h0109 :  // <0160> "
// :skip_load // = 0x017f

// command = run full speed.
addr == 16'h17f ? 16'h0672 :  // <0164> b = 114 // asc b = "r"
addr == 16'h180 ? 16'he407 :  // <0165> bn eq :skip_run
addr == 16'h181 ? 16'h0186 :  // <0165> "
// release target reset, to run.
addr == 16'h182 ? 16'h3e00 :  // <0167> bus_ctrl = 0
addr == 16'h183 ? 16'h2409 :  // <0168> bp0_addr = bp0_addr
addr == 16'h184 ? 16'he00f :  // <0169> jmp :cmd_loop
addr == 16'h185 ? 16'h0109 :  // <0169> "
// :skip_run // = 0x0186

// command = set breakpoint.
addr == 16'h186 ? 16'h0662 :  // <0173> b = 98 // asc b = "b"
addr == 16'h187 ? 16'he407 :  // <0174> bn eq :skip_setbrk
addr == 16'h188 ? 16'h018e :  // <0174> "
addr == 16'h189 ? 16'hfba0 :  // <0175> call :set_bp
addr == 16'h18a ? 16'h01bc :  // <0175> "
addr == 16'h18b ? 16'hfc00 :  // <0175> "
addr == 16'h18c ? 16'he00f :  // <0176> jmp :cmd_loop
addr == 16'h18d ? 16'h0109 :  // <0176> "
// :skip_setbrk // = 0x018e

addr == 16'h18e ? 16'h023f :  // <0179> a = 63 // putasc "?"
addr == 16'h18f ? 16'h0000 :  // <0179> a = a // putasc "?"
addr == 16'h190 ? 16'hfba0 :  // <0179> putasc "?"
addr == 16'h191 ? 16'h0002 :  // <0179> "
addr == 16'h192 ? 16'hfc00 :  // <0179> "
addr == 16'h193 ? 16'h020d :  // <0180> a = 13 // puteol
addr == 16'h194 ? 16'h0000 :  // <0180> a = a // puteol
addr == 16'h195 ? 16'hfba0 :  // <0180> puteol
addr == 16'h196 ? 16'h0002 :  // <0180> "
addr == 16'h197 ? 16'hfc00 :  // <0180> "
addr == 16'h198 ? 16'h020a :  // <0180> a = 10 // puteol
addr == 16'h199 ? 16'h0000 :  // <0180> a = a // puteol
addr == 16'h19a ? 16'hfba0 :  // <0180> puteol
addr == 16'h19b ? 16'h0002 :  // <0180> "
addr == 16'h19c ? 16'hfc00 :  // <0180> "
addr == 16'h19d ? 16'he00f :  // <0181> jmp :cmd_loop
addr == 16'h19e ? 16'h0109 :  // <0181> "

// demonstrations //////////////////////////////

// set a breakpoint, wait til it hits.
addr == 16'h19f ? 16'h2615 :  // <0186> bp0_addr = 0x15
// :main_loop // = 0x01a0
addr == 16'h1a0 ? 16'hfba0 :  // <0188> call :wait_for_bp
addr == 16'h1a1 ? 16'h01b8 :  // <0188> "
addr == 16'h1a2 ? 16'hfc00 :  // <0188> "

// release target to run full speed.
addr == 16'h1a3 ? 16'h3e00 :  // <0191> bus_ctrl = 0

// interrupt the target and single step it a few times.
addr == 16'h1a4 ? 16'h3e08 :  // <0194> bus_ctrl = $bp_step_mask
addr == 16'h1a5 ? 16'hfba0 :  // <0195> call :wait_for_bp
addr == 16'h1a6 ? 16'h01b8 :  // <0195> "
addr == 16'h1a7 ? 16'hfc00 :  // <0195> "
addr == 16'h1a8 ? 16'h2409 :  // <0196> bp0_addr = bp0_addr
addr == 16'h1a9 ? 16'hfba0 :  // <0197> call :wait_for_bp
addr == 16'h1aa ? 16'h01b8 :  // <0197> "
addr == 16'h1ab ? 16'hfc00 :  // <0197> "
addr == 16'h1ac ? 16'h2409 :  // <0198> bp0_addr = bp0_addr
addr == 16'h1ad ? 16'hfba0 :  // <0199> call :wait_for_bp
addr == 16'h1ae ? 16'h01b8 :  // <0199> "
addr == 16'h1af ? 16'hfc00 :  // <0199> "
addr == 16'h1b0 ? 16'h2409 :  // <0200> bp0_addr = bp0_addr
addr == 16'h1b1 ? 16'hfba0 :  // <0201> call :wait_for_bp
addr == 16'h1b2 ? 16'h01b8 :  // <0201> "
addr == 16'h1b3 ? 16'hfc00 :  // <0201> "
addr == 16'h1b4 ? 16'h3e00 :  // <0202> bus_ctrl = 0

// release target to pass breakpoint once.
addr == 16'h1b5 ? 16'h2409 :  // <0205> bp0_addr = bp0_addr

addr == 16'h1b6 ? 16'he00f :  // <0207> jmp :main_loop
addr == 16'h1b7 ? 16'h01a0 :  // <0207> "

// ######## func wait_for_bp // = 0x01b8
// :poll // = 0x01b8
addr == 16'h1b8 ? 16'h0018 :  // <0211> a = bp_status
addr == 16'h1b9 ? 16'he000 :  // <0212> br az :poll
addr == 16'h1ba ? 16'h01b8 :  // <0212> "
addr == 16'h1bb ? 16'hfc00 :  // <0213> end_func

// ######## func set_bp // = 0x01bc
addr == 16'h1bc ? 16'h2004 :  // <0215> push x // func set_bp
addr == 16'h1bd ? 16'h2005 :  // <0215> push y // "
addr == 16'h1be ? 16'h203e :  // <0215> push rtna // "
addr == 16'h1bf ? 16'hfba0 :  // <0216> getchar_echo
addr == 16'h1c0 ? 16'h0011 :  // <0216> "
addr == 16'h1c1 ? 16'hfc00 :  // <0216> "
addr == 16'h1c2 ? 16'h2000 :  // <0216> push a // "
addr == 16'h1c3 ? 16'h0000 :  // <0216> a = a // "
addr == 16'h1c4 ? 16'hfba0 :  // <0216> "
addr == 16'h1c5 ? 16'h0002 :  // <0216> "
addr == 16'h1c6 ? 16'hfc00 :  // <0216> "
addr == 16'h1c7 ? 16'h0008 :  // <0216> pop a // "
addr == 16'h1c8 ? 16'h1000 :  // <0217> x = a
addr == 16'h1c9 ? 16'hfba0 :  // <0218> getchar_echo
addr == 16'h1ca ? 16'h0011 :  // <0218> "
addr == 16'h1cb ? 16'hfc00 :  // <0218> "
addr == 16'h1cc ? 16'h2000 :  // <0218> push a // "
addr == 16'h1cd ? 16'h0000 :  // <0218> a = a // "
addr == 16'h1ce ? 16'hfba0 :  // <0218> "
addr == 16'h1cf ? 16'h0002 :  // <0218> "
addr == 16'h1d0 ? 16'hfc00 :  // <0218> "
addr == 16'h1d1 ? 16'h0008 :  // <0218> pop a // "
addr == 16'h1d2 ? 16'h063d :  // <0219> b = 61 // asc b = "="
addr == 16'h1d3 ? 16'he407 :  // <0220> bn eq :fail
addr == 16'h1d4 ? 16'h01ff :  // <0220> "
addr == 16'h1d5 ? 16'hfba0 :  // <0221> call :get4x
addr == 16'h1d6 ? 16'h009a :  // <0221> "
addr == 16'h1d7 ? 16'hfc00 :  // <0221> "
addr == 16'h1d8 ? 16'h1400 :  // <0222> y = a
addr == 16'h1d9 ? 16'h0200 :  // <0223> a = 0
addr == 16'h1da ? 16'he407 :  // <0224> bn eq :fail
addr == 16'h1db ? 16'h01ff :  // <0224> "
addr == 16'h1dc ? 16'h0004 :  // <0225> a = x
addr == 16'h1dd ? 16'h0630 :  // <0226> b = 48 // asc b = "0"
addr == 16'h1de ? 16'he007 :  // <0227> br eq :b0
addr == 16'h1df ? 16'h01eb :  // <0227> "
addr == 16'h1e0 ? 16'h0631 :  // <0228> b = 49 // asc b = "1"
addr == 16'h1e1 ? 16'he007 :  // <0229> br eq :b1
addr == 16'h1e2 ? 16'h01f0 :  // <0229> "
addr == 16'h1e3 ? 16'h0632 :  // <0230> b = 50 // asc b = "2"
addr == 16'h1e4 ? 16'he007 :  // <0231> br eq :b2
addr == 16'h1e5 ? 16'h01f5 :  // <0231> "
addr == 16'h1e6 ? 16'h0633 :  // <0232> b = 51 // asc b = "3"
addr == 16'h1e7 ? 16'he007 :  // <0233> br eq :b3
addr == 16'h1e8 ? 16'h01fa :  // <0233> "
addr == 16'h1e9 ? 16'he00f :  // <0234> jmp :fail
addr == 16'h1ea ? 16'h01ff :  // <0234> "
// :b0 // = 0x01eb
addr == 16'h1eb ? 16'h2405 :  // <0236> bp0_addr = y
addr == 16'h1ec ? 16'hf808 :  // <0237> pop rtna // rtn
addr == 16'h1ed ? 16'h1408 :  // <0237> pop y // "
addr == 16'h1ee ? 16'h1008 :  // <0237> pop x // "
addr == 16'h1ef ? 16'hfc00 :  // <0237> rtn
// :b1 // = 0x01f0
addr == 16'h1f0 ? 16'h2805 :  // <0239> bp1_addr = y
addr == 16'h1f1 ? 16'hf808 :  // <0240> pop rtna // rtn
addr == 16'h1f2 ? 16'h1408 :  // <0240> pop y // "
addr == 16'h1f3 ? 16'h1008 :  // <0240> pop x // "
addr == 16'h1f4 ? 16'hfc00 :  // <0240> rtn
// :b2 // = 0x01f5
addr == 16'h1f5 ? 16'h2c05 :  // <0242> bp2_addr = y
addr == 16'h1f6 ? 16'hf808 :  // <0243> pop rtna // rtn
addr == 16'h1f7 ? 16'h1408 :  // <0243> pop y // "
addr == 16'h1f8 ? 16'h1008 :  // <0243> pop x // "
addr == 16'h1f9 ? 16'hfc00 :  // <0243> rtn
// :b3 // = 0x01fa
addr == 16'h1fa ? 16'h3005 :  // <0245> bp3_addr = y
addr == 16'h1fb ? 16'hf808 :  // <0246> pop rtna // rtn
addr == 16'h1fc ? 16'h1408 :  // <0246> pop y // "
addr == 16'h1fd ? 16'h1008 :  // <0246> pop x // "
addr == 16'h1fe ? 16'hfc00 :  // <0246> rtn
// :fail // = 0x01ff
addr == 16'h1ff ? 16'h023f :  // <0248> a = 63 // putasc "?"
addr == 16'h200 ? 16'h0000 :  // <0248> a = a // putasc "?"
addr == 16'h201 ? 16'hfba0 :  // <0248> putasc "?"
addr == 16'h202 ? 16'h0002 :  // <0248> "
addr == 16'h203 ? 16'hfc00 :  // <0248> "
addr == 16'h204 ? 16'h020d :  // <0249> a = 13 // puteol
addr == 16'h205 ? 16'h0000 :  // <0249> a = a // puteol
addr == 16'h206 ? 16'hfba0 :  // <0249> puteol
addr == 16'h207 ? 16'h0002 :  // <0249> "
addr == 16'h208 ? 16'hfc00 :  // <0249> "
addr == 16'h209 ? 16'h020a :  // <0249> a = 10 // puteol
addr == 16'h20a ? 16'h0000 :  // <0249> a = a // puteol
addr == 16'h20b ? 16'hfba0 :  // <0249> puteol
addr == 16'h20c ? 16'h0002 :  // <0249> "
addr == 16'h20d ? 16'hfc00 :  // <0249> "
addr == 16'h20e ? 16'hf808 :  // <0250> pop rtna // end_func
addr == 16'h20f ? 16'h1408 :  // <0250> pop y // "
addr == 16'h210 ? 16'h1008 :  // <0250> pop x // "
addr == 16'h211 ? 16'hfc00 :  // <0250> end_func

// ######## func load_program // = 0x0212
addr == 16'h212 ? 16'h2002 :  // <0252> push i // func load_program
addr == 16'h213 ? 16'h2003 :  // <0252> push j // "
addr == 16'h214 ? 16'h2004 :  // <0252> push x // "
addr == 16'h215 ? 16'h2006 :  // <0252> push g6 // "
addr == 16'h216 ? 16'h203e :  // <0252> push rtna // "
// load target program from UART.
// length, little-endian.  memorize in x.
addr == 16'h217 ? 16'h024c :  // <0255> a = 76 // putasc L
addr == 16'h218 ? 16'h0000 :  // <0255> a = a // putasc L
addr == 16'h219 ? 16'hfba0 :  // <0255> putasc L
addr == 16'h21a ? 16'h0002 :  // <0255> "
addr == 16'h21b ? 16'hfc00 :  // <0255> "
addr == 16'h21c ? 16'hfba0 :  // <0256> get16 x
addr == 16'h21d ? 16'h0011 :  // <0256> "
addr == 16'h21e ? 16'hfc00 :  // <0256> "
addr == 16'h21f ? 16'h2000 :  // <0256> push a // "
addr == 16'h220 ? 16'hfba0 :  // <0256> "
addr == 16'h221 ? 16'h0011 :  // <0256> "
addr == 16'h222 ? 16'hfc00 :  // <0256> "
addr == 16'h223 ? 16'h0352 :  // <0256> "
addr == 16'h224 ? 16'h0352 :  // <0256> "
addr == 16'h225 ? 16'h0408 :  // <0256> pop b // "
addr == 16'h226 ? 16'hc800 :  // <0256> "
addr == 16'h227 ? 16'h1334 :  // <0256> "
addr == 16'h228 ? 16'h0004 :  // <0257> a = x
addr == 16'h229 ? 16'hfba0 :  // <0258> call put4x
addr == 16'h22a ? 16'h005d :  // <0258> "
addr == 16'h22b ? 16'hfc00 :  // <0258> "
// put target into reset again, in case this is a target warm boot.
addr == 16'h22c ? 16'h3e02 :  // <0260> bus_ctrl = $tg_reset_mask
// load opcodes.  count up address in i.
addr == 16'h22d ? 16'h0a00 :  // <0262> i = 0
addr == 16'h22e ? 16'h0e01 :  // <0263> j = 1
// :loadword // = 0x022f
addr == 16'h22f ? 16'h0241 :  // <0265> a = 65 // putasc A
addr == 16'h230 ? 16'h0000 :  // <0265> a = a // putasc A
addr == 16'h231 ? 16'hfba0 :  // <0265> putasc A
addr == 16'h232 ? 16'h0002 :  // <0265> "
addr == 16'h233 ? 16'hfc00 :  // <0265> "
addr == 16'h234 ? 16'h0002 :  // <0266> a = i
addr == 16'h235 ? 16'hfba0 :  // <0267> call put4x
addr == 16'h236 ? 16'h005d :  // <0267> "
addr == 16'h237 ? 16'hfc00 :  // <0267> "
addr == 16'h238 ? 16'h023d :  // <0268> a = 61 // putasc "="
addr == 16'h239 ? 16'h0000 :  // <0268> a = a // putasc "="
addr == 16'h23a ? 16'hfba0 :  // <0268> putasc "="
addr == 16'h23b ? 16'h0002 :  // <0268> "
addr == 16'h23c ? 16'hfc00 :  // <0268> "
addr == 16'h23d ? 16'hfba0 :  // <0269> get16 g6
addr == 16'h23e ? 16'h0011 :  // <0269> "
addr == 16'h23f ? 16'hfc00 :  // <0269> "
addr == 16'h240 ? 16'h2000 :  // <0269> push a // "
addr == 16'h241 ? 16'hfba0 :  // <0269> "
addr == 16'h242 ? 16'h0011 :  // <0269> "
addr == 16'h243 ? 16'hfc00 :  // <0269> "
addr == 16'h244 ? 16'h0352 :  // <0269> "
addr == 16'h245 ? 16'h0352 :  // <0269> "
addr == 16'h246 ? 16'h0408 :  // <0269> pop b // "
addr == 16'h247 ? 16'hc800 :  // <0269> "
addr == 16'h248 ? 16'h1b34 :  // <0269> "
addr == 16'h249 ? 16'h0006 :  // <0270> a = g6
addr == 16'h24a ? 16'hfba0 :  // <0271> call put4x
addr == 16'h24b ? 16'h005d :  // <0271> "
addr == 16'h24c ? 16'hfc00 :  // <0271> "
addr == 16'h24d ? 16'h023d :  // <0272> a = 61 // putasc "="
addr == 16'h24e ? 16'h0000 :  // <0272> a = a // putasc "="
addr == 16'h24f ? 16'hfba0 :  // <0272> putasc "="
addr == 16'h250 ? 16'h0002 :  // <0272> "
addr == 16'h251 ? 16'hfc00 :  // <0272> "
addr == 16'h252 ? 16'h4c02 :  // <0273> m9k_addr = i
addr == 16'h253 ? 16'h5006 :  // <0274> m9k_data = g6
addr == 16'h254 ? 16'h0014 :  // <0275> a = m9k_data
addr == 16'h255 ? 16'hfba0 :  // <0276> call put4x
addr == 16'h256 ? 16'h005d :  // <0276> "
addr == 16'h257 ? 16'hfc00 :  // <0276> "
addr == 16'h258 ? 16'h020d :  // <0277> a = 13 // puteol
addr == 16'h259 ? 16'h0000 :  // <0277> a = a // puteol
addr == 16'h25a ? 16'hfba0 :  // <0277> puteol
addr == 16'h25b ? 16'h0002 :  // <0277> "
addr == 16'h25c ? 16'hfc00 :  // <0277> "
addr == 16'h25d ? 16'h020a :  // <0277> a = 10 // puteol
addr == 16'h25e ? 16'h0000 :  // <0277> a = a // puteol
addr == 16'h25f ? 16'hfba0 :  // <0277> puteol
addr == 16'h260 ? 16'h0002 :  // <0277> "
addr == 16'h261 ? 16'hfc00 :  // <0277> "
addr == 16'h262 ? 16'hc800 :  // <0278> i = i+j
addr == 16'h263 ? 16'h0b10 :  // <0278> "
addr == 16'h264 ? 16'h0002 :  // <0279> a = i
addr == 16'h265 ? 16'h0404 :  // <0280> b = x
addr == 16'h266 ? 16'he407 :  // <0281> bn eq :loadword
addr == 16'h267 ? 16'h022f :  // <0281> "
addr == 16'h268 ? 16'hf808 :  // <0282> pop rtna // end_func
addr == 16'h269 ? 16'h1808 :  // <0282> pop g6 // "
addr == 16'h26a ? 16'h1008 :  // <0282> pop x // "
addr == 16'h26b ? 16'h0c08 :  // <0282> pop j // "
addr == 16'h26c ? 16'h0808 :  // <0282> pop i // "
addr == 16'h26d ? 16'hfc00 :  // <0282> end_func

// observe a register.  return its value in peek_data.
// pass its register address in a.
// ######## func peek // = 0x026e
addr == 16'h26e ? 16'h07a0 :  // <0287> b = 0x3ff
addr == 16'h26f ? 16'h03ff :  // <0287> "
addr == 16'h270 ? 16'hc800 :  // <0288> a = and
addr == 16'h271 ? 16'h0330 :  // <0288> "
// debug_peek_reg = 31 << 10
addr == 16'h272 ? 16'h07a0 :  // <0290> b = 0x7c00
addr == 16'h273 ? 16'h7c00 :  // <0290> "
addr == 16'h274 ? 16'hc800 :  // <0291> force_opcode = or
addr == 16'h275 ? 16'h3734 :  // <0291> "
addr == 16'h276 ? 16'h3e04 :  // <0292> bus_ctrl = $divert_code_bus_mask
addr == 16'h277 ? 16'h4201 :  // <0293> tg_force = $hold_state_mask
addr == 16'h278 ? 16'h4203 :  // <0294> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h279 ? 16'h4205 :  // <0295> tg_force = ($hold_state_mask | $force_exec_mask)
addr == 16'h27a ? 16'h4201 :  // <0296> tg_force = $hold_state_mask
// target's register value is now in peek_data.
// refill target exr so it can resume seamlessly.
addr == 16'h27b ? 16'h3415 :  // <0299> force_opcode = exr_shadow
addr == 16'h27c ? 16'h4203 :  // <0300> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h27d ? 16'h4200 :  // <0301> tg_force = 0
addr == 16'h27e ? 16'hfc00 :  // <0302> end_func

// show target status display.
// ######## func dump_target // = 0x027f
addr == 16'h27f ? 16'h2002 :  // <0305> push i // func dump_target
addr == 16'h280 ? 16'h2003 :  // <0305> push j // "
addr == 16'h281 ? 16'h2004 :  // <0305> push x // "
addr == 16'h282 ? 16'h2005 :  // <0305> push y // "
addr == 16'h283 ? 16'h203e :  // <0305> push rtna // "
addr == 16'h284 ? 16'h020d :  // <0306> a = 13 // puteol
addr == 16'h285 ? 16'h0000 :  // <0306> a = a // puteol
addr == 16'h286 ? 16'hfba0 :  // <0306> puteol
addr == 16'h287 ? 16'h0002 :  // <0306> "
addr == 16'h288 ? 16'hfc00 :  // <0306> "
addr == 16'h289 ? 16'h020a :  // <0306> a = 10 // puteol
addr == 16'h28a ? 16'h0000 :  // <0306> a = a // puteol
addr == 16'h28b ? 16'hfba0 :  // <0306> puteol
addr == 16'h28c ? 16'h0002 :  // <0306> "
addr == 16'h28d ? 16'hfc00 :  // <0306> "
addr == 16'h28e ? 16'h0a00 :  // <0307> i = 0
// :next_reg // = 0x028f
// fetch register name from table in target program.
// i = register number.  x = 2-byte word index within each name string.
// peek is skipped for any reg name starting with 2 slashes (good for read-sensitive regs).
addr == 16'h28f ? 16'h1200 :  // <0312> x = 0
addr == 16'h290 ? 16'h1601 :  // <0313> y = 1
// :next_chars // = 0x0291
addr == 16'h291 ? 16'h0002 :  // <0315> a = i
addr == 16'h292 ? 16'h0351 :  // <0316> a = a<<1
addr == 16'h293 ? 16'h0351 :  // <0317> a = a<<1
addr == 16'h294 ? 16'h0603 :  // <0318> b = 3
addr == 16'h295 ? 16'hc800 :  // <0319> a = a+b
addr == 16'h296 ? 16'h0300 :  // <0319> "
addr == 16'h297 ? 16'h0404 :  // <0320> b = x
addr == 16'h298 ? 16'hc800 :  // <0321> m9k_addr = a+b
addr == 16'h299 ? 16'h4f00 :  // <0321> "
addr == 16'h29a ? 16'h0014 :  // <0322> a = m9k_data
addr == 16'h29b ? 16'h07a0 :  // <0323> b = 0x2f2f
addr == 16'h29c ? 16'h2f2f :  // <0323> "
addr == 16'h29d ? 16'he007 :  // <0324> br eq :no_peek
addr == 16'h29e ? 16'h02c7 :  // <0324> "
addr == 16'h29f ? 16'h0014 :  // <0325> a = m9k_data // putchar m9k_data
addr == 16'h2a0 ? 16'hfba0 :  // <0325> putchar m9k_data
addr == 16'h2a1 ? 16'h0002 :  // <0325> "
addr == 16'h2a2 ? 16'hfc00 :  // <0325> "
addr == 16'h2a3 ? 16'h0014 :  // <0326> a = m9k_data
addr == 16'h2a4 ? 16'h0353 :  // <0327> a = a>>4
addr == 16'h2a5 ? 16'h0353 :  // <0328> a = a>>4
addr == 16'h2a6 ? 16'h0000 :  // <0329> a = a // putchar a
addr == 16'h2a7 ? 16'hfba0 :  // <0329> putchar a
addr == 16'h2a8 ? 16'h0002 :  // <0329> "
addr == 16'h2a9 ? 16'hfc00 :  // <0329> "
addr == 16'h2aa ? 16'hc800 :  // <0330> x = x+y
addr == 16'h2ab ? 16'h1320 :  // <0330> "
addr == 16'h2ac ? 16'h0004 :  // <0331> a = x
addr == 16'h2ad ? 16'h0604 :  // <0332> b = 4
addr == 16'h2ae ? 16'he407 :  // <0333> bn eq :next_chars
addr == 16'h2af ? 16'h0291 :  // <0333> "
addr == 16'h2b0 ? 16'h023d :  // <0334> a = 61 // putasc "="
addr == 16'h2b1 ? 16'h0000 :  // <0334> a = a // putasc "="
addr == 16'h2b2 ? 16'hfba0 :  // <0334> putasc "="
addr == 16'h2b3 ? 16'h0002 :  // <0334> "
addr == 16'h2b4 ? 16'hfc00 :  // <0334> "
addr == 16'h2b5 ? 16'h0002 :  // <0335> a = i
addr == 16'h2b6 ? 16'hfba0 :  // <0336> call :peek
addr == 16'h2b7 ? 16'h026e :  // <0336> "
addr == 16'h2b8 ? 16'hfc00 :  // <0336> "
addr == 16'h2b9 ? 16'h0017 :  // <0337> a = peek_data
addr == 16'h2ba ? 16'hfba0 :  // <0338> call :put4x
addr == 16'h2bb ? 16'h005d :  // <0338> "
addr == 16'h2bc ? 16'hfc00 :  // <0338> "
addr == 16'h2bd ? 16'h020d :  // <0339> a = 13 // puteol
addr == 16'h2be ? 16'h0000 :  // <0339> a = a // puteol
addr == 16'h2bf ? 16'hfba0 :  // <0339> puteol
addr == 16'h2c0 ? 16'h0002 :  // <0339> "
addr == 16'h2c1 ? 16'hfc00 :  // <0339> "
addr == 16'h2c2 ? 16'h020a :  // <0339> a = 10 // puteol
addr == 16'h2c3 ? 16'h0000 :  // <0339> a = a // puteol
addr == 16'h2c4 ? 16'hfba0 :  // <0339> puteol
addr == 16'h2c5 ? 16'h0002 :  // <0339> "
addr == 16'h2c6 ? 16'hfc00 :  // <0339> "
// :no_peek // = 0x02c7
addr == 16'h2c7 ? 16'h0e01 :  // <0341> j = 1
addr == 16'h2c8 ? 16'hc800 :  // <0342> i = i+j
addr == 16'h2c9 ? 16'h0b10 :  // <0342> "
// loop up to the number of registers in the target program's register name table.
addr == 16'h2ca ? 16'h4e02 :  // <0344> m9k_addr = 2
addr == 16'h2cb ? 16'h0414 :  // <0345> b = m9k_data
addr == 16'h2cc ? 16'h0002 :  // <0346> a = i
addr == 16'h2cd ? 16'he407 :  // <0347> bn eq :next_reg
addr == 16'h2ce ? 16'h028f :  // <0347> "
addr == 16'h2cf ? 16'hf808 :  // <0348> pop rtna // end_func
addr == 16'h2d0 ? 16'h1408 :  // <0348> pop y // "
addr == 16'h2d1 ? 16'h1008 :  // <0348> pop x // "
addr == 16'h2d2 ? 16'h0c08 :  // <0348> pop j // "
addr == 16'h2d3 ? 16'h0808 :  // <0348> pop i // "
addr == 16'h2d4 ? 16'hfc00 :  // <0348> end_func

        
                16'hxxxx;
        endmodule
    
