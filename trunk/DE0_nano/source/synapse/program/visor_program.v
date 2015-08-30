
        `include "header.v"

        module visor_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.
// for debugging supervisor mcu.

// program code dimensions.


// these are for the VISOR code, not the TARGET code.

// register file configuration

// application-specific register aliases.





//alias_src  tg_debug_out	    [incr counter]  {}


addr == 16'h00 ? 16'he00f :  // <0060> jmp :main
addr == 16'h01 ? 16'h012b :  // <0060> "


// driver library for my_uart_v2 simple async transceiver.




// routine sends out the low byte from a to the UART.  blocks until the UART accepts the byte.
// ######## func putchar_atx // = 0x0002
addr == 16'h02 ? 16'h2004 :  // <0037> push x // func putchar_atx

addr == 16'h03 ? 16'h1000 :  // <0039> x = a

// wait for UART to be idle (not busy).
addr == 16'h04 ? 16'h0202 :  // <0042> a = $atx_busy_mask
// :pcatx_wait_for_idle // = 0x0005
addr == 16'h05 ? 16'h0412 :  // <0044> b = atx_ctrl
addr == 16'h06 ? 16'he403 :  // <0045> bn and0z :pcatx_wait_for_idle
addr == 16'h07 ? 16'h0005 :  // <0045> "

// push word to the UART.  its low byte is a character.
addr == 16'h08 ? 16'h4404 :  // <0048> atx_data = x

// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_ctrl.
addr == 16'h09 ? 16'h4a01 :  // <0053> atx_ctrl = $atx_load_mask

// wait until UART is busy, as acknowledgement.
addr == 16'h0a ? 16'h0202 :  // <0056> a = $atx_busy_mask
// :pcatx_wait_for_busy // = 0x000b
addr == 16'h0b ? 16'h0412 :  // <0058> b = atx_ctrl
addr == 16'h0c ? 16'he003 :  // <0059> br and0z :pcatx_wait_for_busy
addr == 16'h0d ? 16'h000b :  // <0059> "
addr == 16'h0e ? 16'h4a00 :  // <0060> atx_ctrl = 0
addr == 16'h0f ? 16'h1008 :  // <0061> pop x // end_func
addr == 16'h10 ? 16'hfc00 :  // <0061> end_func

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// ######## func getchar_atx // = 0x0011
// wait until UART is busy, then idle.
addr == 16'h11 ? 16'h0204 :  // <0067> a = $arx_busy_mask
// :wait_for_busy // = 0x0012
addr == 16'h12 ? 16'h0412 :  // <0069> b = atx_ctrl
addr == 16'h13 ? 16'he003 :  // <0070> br and0z :wait_for_busy
addr == 16'h14 ? 16'h0012 :  // <0070> "
// :wait_for_idle // = 0x0015
addr == 16'h15 ? 16'h0412 :  // <0072> b = atx_ctrl
addr == 16'h16 ? 16'he403 :  // <0073> bn and0z :wait_for_idle
addr == 16'h17 ? 16'h0015 :  // <0073> "
addr == 16'h18 ? 16'h0011 :  // <0074> a = atx_data
addr == 16'h19 ? 16'hfc00 :  // <0075> end_func

// returns a character in a, or -1 if none.
// this version can miss characters if not polled while the character is arriving.
// ######## func pollchar_atx // = 0x001a
// check for UART is busy, then idle.
addr == 16'h1a ? 16'h0204 :  // <0081> a = $arx_busy_mask
addr == 16'h1b ? 16'h0412 :  // <0082> b = atx_ctrl
addr == 16'h1c ? 16'he003 :  // <0083> br and0z :none
addr == 16'h1d ? 16'h0023 :  // <0083> "
// :wait_for_idle // = 0x001e
addr == 16'h1e ? 16'h0412 :  // <0085> b = atx_ctrl
addr == 16'h1f ? 16'he403 :  // <0086> bn and0z :wait_for_idle
addr == 16'h20 ? 16'h001e :  // <0086> "
addr == 16'h21 ? 16'h0011 :  // <0087> a = atx_data
addr == 16'h22 ? 16'hfc00 :  // <0088> rtn
// :none // = 0x0023
addr == 16'h23 ? 16'h0360 :  // <0090> a = -1
addr == 16'h24 ? 16'hfc00 :  // <0091> end_func



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
addr == 16'h6d ? 16'hfba0 :  // <0064> putchar a
addr == 16'h6e ? 16'h0002 :  // <0064> "
addr == 16'h6f ? 16'hfc00 :  // <0064> "

addr == 16'h70 ? 16'h0006 :  // <0066> a = g6
addr == 16'h71 ? 16'h07a0 :  // <0067> b = 0x0F00
addr == 16'h72 ? 16'h0f00 :  // <0067> "
addr == 16'h73 ? 16'hc800 :  // <0068> a = and
addr == 16'h74 ? 16'h0330 :  // <0068> "
addr == 16'h75 ? 16'h0353 :  // <0069> a = a>>4
addr == 16'h76 ? 16'h0353 :  // <0070> a = a>>4
addr == 16'h77 ? 16'hfba0 :  // <0071> call fetch_byte
addr == 16'h78 ? 16'h0025 :  // <0071> "
addr == 16'h79 ? 16'hfc00 :  // <0071> "
addr == 16'h7a ? 16'hfba0 :  // <0072> putchar a
addr == 16'h7b ? 16'h0002 :  // <0072> "
addr == 16'h7c ? 16'hfc00 :  // <0072> "

addr == 16'h7d ? 16'h0006 :  // <0074> a = g6
addr == 16'h7e ? 16'h06f0 :  // <0075> b = 0x00F0
addr == 16'h7f ? 16'hc800 :  // <0076> a = and
addr == 16'h80 ? 16'h0330 :  // <0076> "
addr == 16'h81 ? 16'h0353 :  // <0077> a = a>>4
addr == 16'h82 ? 16'hfba0 :  // <0078> call fetch_byte
addr == 16'h83 ? 16'h0025 :  // <0078> "
addr == 16'h84 ? 16'hfc00 :  // <0078> "
addr == 16'h85 ? 16'hfba0 :  // <0079> putchar a
addr == 16'h86 ? 16'h0002 :  // <0079> "
addr == 16'h87 ? 16'hfc00 :  // <0079> "

addr == 16'h88 ? 16'h0006 :  // <0081> a = g6
addr == 16'h89 ? 16'h060f :  // <0082> b = 0x000F
addr == 16'h8a ? 16'hc800 :  // <0083> a = and
addr == 16'h8b ? 16'h0330 :  // <0083> "
addr == 16'h8c ? 16'hfba0 :  // <0084> call fetch_byte
addr == 16'h8d ? 16'h0025 :  // <0084> "
addr == 16'h8e ? 16'hfc00 :  // <0084> "
addr == 16'h8f ? 16'hfba0 :  // <0085> putchar a
addr == 16'h90 ? 16'h0002 :  // <0085> "
addr == 16'h91 ? 16'hfc00 :  // <0085> "

addr == 16'h92 ? 16'hf808 :  // <0087> pop rtna // end_func
addr == 16'h93 ? 16'h1808 :  // <0087> pop g6 // "
addr == 16'h94 ? 16'h1008 :  // <0087> pop x // "
addr == 16'h95 ? 16'hfc00 :  // <0087> end_func

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// ######## func get4x // = 0x0096
addr == 16'h96 ? 16'h2002 :  // <0091> push i // func get4x
addr == 16'h97 ? 16'h2003 :  // <0091> push j // "
addr == 16'h98 ? 16'h2004 :  // <0091> push x // "
addr == 16'h99 ? 16'h2005 :  // <0091> push y // "
addr == 16'h9a ? 16'h203e :  // <0091> push rtna // "
// y = digit counter
// j = sum
addr == 16'h9b ? 16'h1604 :  // <0094> y = 4
// :again // = 0x009c
addr == 16'h9c ? 16'hfba0 :  // <0096> getchar
addr == 16'h9d ? 16'h0011 :  // <0096> "
addr == 16'h9e ? 16'hfc00 :  // <0096> "
addr == 16'h9f ? 16'h13a0 :  // <0097> x = :hexdigits
addr == 16'ha0 ? 16'h0055 :  // <0097> "
addr == 16'ha1 ? 16'h0a10 :  // <0098> i = 16
addr == 16'ha2 ? 16'hfba0 :  // <0099> call :find_in_fetch
addr == 16'ha3 ? 16'h0039 :  // <0099> "
addr == 16'ha4 ? 16'hfc00 :  // <0099> "
addr == 16'ha5 ? 16'h0760 :  // <0100> b = -1
addr == 16'ha6 ? 16'he007 :  // <0101> br eq :fail
addr == 16'ha7 ? 16'h00bb :  // <0101> "
addr == 16'ha8 ? 16'h0400 :  // <0102> b = a
addr == 16'ha9 ? 16'h0003 :  // <0103> a = j
addr == 16'haa ? 16'h0352 :  // <0104> a = a<<4
addr == 16'hab ? 16'hc800 :  // <0105> j = or
addr == 16'hac ? 16'h0f34 :  // <0105> "
addr == 16'had ? 16'h1360 :  // <0106> x = -1
addr == 16'hae ? 16'hc800 :  // <0107> y = x+y
addr == 16'haf ? 16'h1720 :  // <0107> "
addr == 16'hb0 ? 16'h0005 :  // <0108> a = y
addr == 16'hb1 ? 16'he400 :  // <0109> bn az :again
addr == 16'hb2 ? 16'h009c :  // <0109> "
addr == 16'hb3 ? 16'h0003 :  // <0110> a = j
addr == 16'hb4 ? 16'h0600 :  // <0111> b = 0
addr == 16'hb5 ? 16'hf808 :  // <0112> pop rtna // rtn
addr == 16'hb6 ? 16'h1408 :  // <0112> pop y // "
addr == 16'hb7 ? 16'h1008 :  // <0112> pop x // "
addr == 16'hb8 ? 16'h0c08 :  // <0112> pop j // "
addr == 16'hb9 ? 16'h0808 :  // <0112> pop i // "
addr == 16'hba ? 16'hfc00 :  // <0112> rtn
// :fail // = 0x00bb
addr == 16'hbb ? 16'h0760 :  // <0114> b = -1
addr == 16'hbc ? 16'hf808 :  // <0115> pop rtna // end_func
addr == 16'hbd ? 16'h1408 :  // <0115> pop y // "
addr == 16'hbe ? 16'h1008 :  // <0115> pop x // "
addr == 16'hbf ? 16'h0c08 :  // <0115> pop j // "
addr == 16'hc0 ? 16'h0808 :  // <0115> pop i // "
addr == 16'hc1 ? 16'hfc00 :  // <0115> end_func

// print a null-terminated string from packed words in program space.
// pass its word address (not its byte address) in a.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_nt // = 0x00c2
addr == 16'hc2 ? 16'h2002 :  // <0121> push i // func print_nt
addr == 16'hc3 ? 16'h2003 :  // <0121> push j // "
addr == 16'hc4 ? 16'h2004 :  // <0121> push x // "
addr == 16'hc5 ? 16'h203e :  // <0121> push rtna // "
addr == 16'hc6 ? 16'h0800 :  // <0122> i = a
addr == 16'hc7 ? 16'h0e01 :  // <0123> j = 1
// :next_word // = 0x00c8
addr == 16'hc8 ? 16'hd002 :  // <0125> fetch x from i
addr == 16'hc9 ? 16'h13b0 :  // <0125> "
// now i = current word address, x = data word, b = low byte mask, a = data byte.
addr == 16'hca ? 16'h0004 :  // <0127> a = x
addr == 16'hcb ? 16'h06ff :  // <0128> b = 0xff
addr == 16'hcc ? 16'he003 :  // <0129> br and0z :done
addr == 16'hcd ? 16'h00de :  // <0129> "
addr == 16'hce ? 16'hfba0 :  // <0130> putchar a
addr == 16'hcf ? 16'h0002 :  // <0130> "
addr == 16'hd0 ? 16'hfc00 :  // <0130> "
addr == 16'hd1 ? 16'h0004 :  // <0131> a = x
addr == 16'hd2 ? 16'h0353 :  // <0132> a = a>>4
addr == 16'hd3 ? 16'h0353 :  // <0133> a = a>>4
addr == 16'hd4 ? 16'h06ff :  // <0134> b = 0xff
addr == 16'hd5 ? 16'he003 :  // <0135> br and0z :done
addr == 16'hd6 ? 16'h00de :  // <0135> "
addr == 16'hd7 ? 16'hfba0 :  // <0136> putchar a
addr == 16'hd8 ? 16'h0002 :  // <0136> "
addr == 16'hd9 ? 16'hfc00 :  // <0136> "
addr == 16'hda ? 16'hc800 :  // <0137> i = i+j
addr == 16'hdb ? 16'h0b10 :  // <0137> "
addr == 16'hdc ? 16'he00f :  // <0138> jmp :next_word
addr == 16'hdd ? 16'h00c8 :  // <0138> "
// :done // = 0x00de
addr == 16'hde ? 16'hf808 :  // <0140> pop rtna // end_func
addr == 16'hdf ? 16'h1008 :  // <0140> pop x // "
addr == 16'he0 ? 16'h0c08 :  // <0140> pop j // "
addr == 16'he1 ? 16'h0808 :  // <0140> pop i // "
addr == 16'he2 ? 16'hfc00 :  // <0140> end_func
// routine waits a number of milliseconds given in a.
// ######## func spinwait // = 0x00e3
addr == 16'he3 ? 16'h2004 :  // <0002> push x // func spinwait
addr == 16'he4 ? 16'h2005 :  // <0002> push y // "
//patch
//rtn
addr == 16'he5 ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x00e6
addr == 16'he6 ? 16'h13a0 :  // <0007> x = 16666
addr == 16'he7 ? 16'h411a :  // <0007> "
addr == 16'he8 ? 16'h1760 :  // <0008> y = -1
addr == 16'he9 ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x00ea
// use of the ad2 name overrides auto-nop here.
addr == 16'hea ? 16'h1320 :  // <0012> x = ad2
addr == 16'heb ? 16'he402 :  // <0013> bn xz :spinwait_inner
addr == 16'hec ? 16'h00ea :  // <0013> "
addr == 16'hed ? 16'hc800 :  // <0014> a = a+b
addr == 16'hee ? 16'h0300 :  // <0014> "
addr == 16'hef ? 16'he400 :  // <0015> bn az :spinwait_outer
addr == 16'hf0 ? 16'h00e6 :  // <0015> "
addr == 16'hf1 ? 16'h1408 :  // <0016> pop y // end_func
addr == 16'hf2 ? 16'h1008 :  // <0016> pop x // "
addr == 16'hf3 ? 16'hfc00 :  // <0016> end_func





// ######## func fletcher16_init // = 0x00f4
addr == 16'hf4 ? 16'h1a00 :  // <0005> $fletcher_sum1_reg = 0
addr == 16'hf5 ? 16'h1e00 :  // <0006> $fletcher_sum2_reg = 0
addr == 16'hf6 ? 16'hfc00 :  // <0007> end_func

// compute the modulus(255) of a number given in a.  return remainder in a.
// ######## func mod255 // = 0x00f7
// while a is greater than 254, subtract 255.
// :mod255_again // = 0x00f7
addr == 16'hf7 ? 16'h06fe :  // <0013> b = 0xfe
addr == 16'hf8 ? 16'he006 :  // <0014> br gt :mod255_greater
addr == 16'hf9 ? 16'h00fb :  // <0014> "
addr == 16'hfa ? 16'hfc00 :  // <0015> rtn
// :mod255_greater // = 0x00fb
addr == 16'hfb ? 16'h07a0 :  // <0017> b = 0xff01
addr == 16'hfc ? 16'hff01 :  // <0017> "
addr == 16'hfd ? 16'hc800 :  // <0018> a = a+b
addr == 16'hfe ? 16'h0300 :  // <0018> "
addr == 16'hff ? 16'he00f :  // <0019> jmp :mod255_again
addr == 16'h100 ? 16'h00f7 :  // <0019> "
addr == 16'h101 ? 16'hfc00 :  // <0020> end_func

// accumulate a Fletcher16 checksum, given the next byte of data in a.
// ######## func fletcher16_input8 // = 0x0102
addr == 16'h102 ? 16'h203e :  // <0023> push rtna // func fletcher16_input8
addr == 16'h103 ? 16'h0406 :  // <0024> b = $fletcher_sum1_reg
addr == 16'h104 ? 16'hc800 :  // <0025> a = a+b
addr == 16'h105 ? 16'h0300 :  // <0025> "
addr == 16'h106 ? 16'hfba0 :  // <0026> call :mod255
addr == 16'h107 ? 16'h00f7 :  // <0026> "
addr == 16'h108 ? 16'hfc00 :  // <0026> "
addr == 16'h109 ? 16'h1800 :  // <0027> $fletcher_sum1_reg = a

addr == 16'h10a ? 16'h0407 :  // <0029> b = $fletcher_sum2_reg
addr == 16'h10b ? 16'hc800 :  // <0030> a = a+b
addr == 16'h10c ? 16'h0300 :  // <0030> "
addr == 16'h10d ? 16'hfba0 :  // <0031> call :mod255
addr == 16'h10e ? 16'h00f7 :  // <0031> "
addr == 16'h10f ? 16'hfc00 :  // <0031> "
addr == 16'h110 ? 16'h1c00 :  // <0032> $fletcher_sum2_reg = a
addr == 16'h111 ? 16'hf808 :  // <0033> pop rtna // end_func
addr == 16'h112 ? 16'hfc00 :  // <0033> end_func

// accumulate a Fletcher16 checksum, given the next word of data in a.
// ######## func fletcher16_input16 // = 0x0113
addr == 16'h113 ? 16'h2002 :  // <0036> push i // func fletcher16_input16
addr == 16'h114 ? 16'h203e :  // <0036> push rtna // "
addr == 16'h115 ? 16'h0b53 :  // <0037> i = a>>4
addr == 16'h116 ? 16'h06ff :  // <0038> b = 0xff
addr == 16'h117 ? 16'hc800 :  // <0039> a = and
addr == 16'h118 ? 16'h0330 :  // <0039> "
addr == 16'h119 ? 16'hfba0 :  // <0040> call :fletcher16_input8
addr == 16'h11a ? 16'h0102 :  // <0040> "
addr == 16'h11b ? 16'hfc00 :  // <0040> "
addr == 16'h11c ? 16'h0002 :  // <0041> a = i
addr == 16'h11d ? 16'h0353 :  // <0042> a = a>>4
addr == 16'h11e ? 16'hfba0 :  // <0043> call :fletcher16_input8
addr == 16'h11f ? 16'h0102 :  // <0043> "
addr == 16'h120 ? 16'hfc00 :  // <0043> "
addr == 16'h121 ? 16'hf808 :  // <0044> pop rtna // end_func
addr == 16'h122 ? 16'h0808 :  // <0044> pop i // "
addr == 16'h123 ? 16'hfc00 :  // <0044> end_func

// return the combined 16-bit result of Fletcher16 checksum in a.
// ######## func fletcher16_result // = 0x0124
addr == 16'h124 ? 16'h0007 :  // <0048> a = $fletcher_sum2_reg
addr == 16'h125 ? 16'h0352 :  // <0049> a = a<<4
addr == 16'h126 ? 16'h0352 :  // <0050> a = a<<4
addr == 16'h127 ? 16'h0406 :  // <0051> b = $fletcher_sum1_reg
addr == 16'h128 ? 16'hc800 :  // <0052> a = or
addr == 16'h129 ? 16'h0334 :  // <0052> "
addr == 16'h12a ? 16'hfc00 :  // <0053> end_func




// ////////////////////////////////////////////
// :main // = 0x012b
// put target into reset.
addr == 16'h12b ? 16'h3e02 :  // <0082> bus_ctrl = $tg_reset_mask

// init visor.
addr == 16'h12c ? 16'h3360 :  // <0085> bp3_addr = $bp_disable
addr == 16'h12d ? 16'h2f60 :  // <0086> bp2_addr = $bp_disable
addr == 16'h12e ? 16'h2b60 :  // <0087> bp1_addr = $bp_disable
addr == 16'h12f ? 16'h2760 :  // <0088> bp0_addr = $bp_disable

// startup message
addr == 16'h130 ? 16'h020d :  // <0091> a = 13 // puteol
addr == 16'h131 ? 16'hfba0 :  // <0091> puteol
addr == 16'h132 ? 16'h0002 :  // <0091> "
addr == 16'h133 ? 16'hfc00 :  // <0091> "
addr == 16'h134 ? 16'h020a :  // <0091> a = 10 // puteol
addr == 16'h135 ? 16'hfba0 :  // <0091> puteol
addr == 16'h136 ? 16'h0002 :  // <0091> "
addr == 16'h137 ? 16'hfc00 :  // <0091> "
addr == 16'h138 ? 16'h0256 :  // <0092> a = 86 // putasc "V"
addr == 16'h139 ? 16'hfba0 :  // <0092> putasc "V"
addr == 16'h13a ? 16'h0002 :  // <0092> "
addr == 16'h13b ? 16'hfc00 :  // <0092> "
addr == 16'h13c ? 16'h0249 :  // <0093> a = 73 // putasc "I"
addr == 16'h13d ? 16'hfba0 :  // <0093> putasc "I"
addr == 16'h13e ? 16'h0002 :  // <0093> "
addr == 16'h13f ? 16'hfc00 :  // <0093> "
addr == 16'h140 ? 16'h0253 :  // <0094> a = 83 // putasc "S"
addr == 16'h141 ? 16'hfba0 :  // <0094> putasc "S"
addr == 16'h142 ? 16'h0002 :  // <0094> "
addr == 16'h143 ? 16'hfc00 :  // <0094> "
addr == 16'h144 ? 16'h024f :  // <0095> a = 79 // putasc "O"
addr == 16'h145 ? 16'hfba0 :  // <0095> putasc "O"
addr == 16'h146 ? 16'h0002 :  // <0095> "
addr == 16'h147 ? 16'hfc00 :  // <0095> "
addr == 16'h148 ? 16'h0252 :  // <0096> a = 82 // putasc "R"
addr == 16'h149 ? 16'hfba0 :  // <0096> putasc "R"
addr == 16'h14a ? 16'h0002 :  // <0096> "
addr == 16'h14b ? 16'hfc00 :  // <0096> "

// check for bootloader signal.
addr == 16'h14c ? 16'h0019 :  // <0099> a = boot_break
addr == 16'h14d ? 16'he400 :  // <0100> bn az :boot_run
addr == 16'h14e ? 16'h0155 :  // <0100> "
// ^^^ for press-to-debug; runs target by default.
// br az :boot_run
// ^^^ for press-to-run; debugs target by default.
// step into the first target instruction.
addr == 16'h14f ? 16'h3e08 :  // <0105> bus_ctrl = $bp_step_mask
addr == 16'h150 ? 16'hfba0 :  // <0106> call :wait_for_bp
addr == 16'h151 ? 16'h01f7 :  // <0106> "
addr == 16'h152 ? 16'hfc00 :  // <0106> "
addr == 16'h153 ? 16'he00f :  // <0107> jmp :cmd_loop
addr == 16'h154 ? 16'h0156 :  // <0107> "
// release target reset, to run.
// :boot_run // = 0x0155
addr == 16'h155 ? 16'h3e00 :  // <0110> bus_ctrl = 0

// command prompt loop.
// :cmd_loop // = 0x0156
addr == 16'h156 ? 16'h000f :  // <0114> a = bus_ctrl
addr == 16'h157 ? 16'h0600 :  // <0115> b = 0
addr == 16'h158 ? 16'he007 :  // <0116> br eq :running_prompt
addr == 16'h159 ? 16'h017b :  // <0116> "

addr == 16'h15a ? 16'hfba0 :  // <0118> call :dump_target
addr == 16'h15b ? 16'h02c6 :  // <0118> "
addr == 16'h15c ? 16'hfc00 :  // <0118> "
addr == 16'h15d ? 16'h0016 :  // <0119> a = tg_code_addr
addr == 16'h15e ? 16'hfba0 :  // <0120> call :put4x
addr == 16'h15f ? 16'h005d :  // <0120> "
addr == 16'h160 ? 16'hfc00 :  // <0120> "
addr == 16'h161 ? 16'h022c :  // <0121> a = 44 // putasc ","
addr == 16'h162 ? 16'hfba0 :  // <0121> putasc ","
addr == 16'h163 ? 16'h0002 :  // <0121> "
addr == 16'h164 ? 16'hfc00 :  // <0121> "
addr == 16'h165 ? 16'h0015 :  // <0122> a = exr_shadow
addr == 16'h166 ? 16'hfba0 :  // <0123> call :put4x
addr == 16'h167 ? 16'h005d :  // <0123> "
addr == 16'h168 ? 16'hfc00 :  // <0123> "
addr == 16'h169 ? 16'h0220 :  // <0124> a = 32 // putasc " "
addr == 16'h16a ? 16'hfba0 :  // <0124> putasc " "
addr == 16'h16b ? 16'h0002 :  // <0124> "
addr == 16'h16c ? 16'hfc00 :  // <0124> "
addr == 16'h16d ? 16'h023e :  // <0125> a = 62 // putasc ">"
addr == 16'h16e ? 16'hfba0 :  // <0125> putasc ">"
addr == 16'h16f ? 16'h0002 :  // <0125> "
addr == 16'h170 ? 16'hfc00 :  // <0125> "
addr == 16'h171 ? 16'hfba0 :  // <0126> getchar_echo
addr == 16'h172 ? 16'h0011 :  // <0126> "
addr == 16'h173 ? 16'hfc00 :  // <0126> "
addr == 16'h174 ? 16'h2000 :  // <0126> push a // "
addr == 16'h175 ? 16'hfba0 :  // <0126> "
addr == 16'h176 ? 16'h0002 :  // <0126> "
addr == 16'h177 ? 16'hfc00 :  // <0126> "
addr == 16'h178 ? 16'h0008 :  // <0126> pop a // "
addr == 16'h179 ? 16'he00f :  // <0127> jmp :parse_cmd
addr == 16'h17a ? 16'h01a3 :  // <0127> "

// :running_prompt // = 0x017b
addr == 16'h17b ? 16'h020d :  // <0130> a = 13 // puteol
addr == 16'h17c ? 16'hfba0 :  // <0130> puteol
addr == 16'h17d ? 16'h0002 :  // <0130> "
addr == 16'h17e ? 16'hfc00 :  // <0130> "
addr == 16'h17f ? 16'h020a :  // <0130> a = 10 // puteol
addr == 16'h180 ? 16'hfba0 :  // <0130> puteol
addr == 16'h181 ? 16'h0002 :  // <0130> "
addr == 16'h182 ? 16'hfc00 :  // <0130> "
addr == 16'h183 ? 16'h0252 :  // <0131> a = 82 // putasc "R"
addr == 16'h184 ? 16'hfba0 :  // <0131> putasc "R"
addr == 16'h185 ? 16'h0002 :  // <0131> "
addr == 16'h186 ? 16'hfc00 :  // <0131> "
addr == 16'h187 ? 16'h0255 :  // <0132> a = 85 // putasc "U"
addr == 16'h188 ? 16'hfba0 :  // <0132> putasc "U"
addr == 16'h189 ? 16'h0002 :  // <0132> "
addr == 16'h18a ? 16'hfc00 :  // <0132> "
addr == 16'h18b ? 16'h024e :  // <0133> a = 78 // putasc "N"
addr == 16'h18c ? 16'hfba0 :  // <0133> putasc "N"
addr == 16'h18d ? 16'h0002 :  // <0133> "
addr == 16'h18e ? 16'hfc00 :  // <0133> "
addr == 16'h18f ? 16'h0220 :  // <0134> a = 32 // putasc " "
addr == 16'h190 ? 16'hfba0 :  // <0134> putasc " "
addr == 16'h191 ? 16'h0002 :  // <0134> "
addr == 16'h192 ? 16'hfc00 :  // <0134> "
addr == 16'h193 ? 16'h023e :  // <0135> a = 62 // putasc ">"
addr == 16'h194 ? 16'hfba0 :  // <0135> putasc ">"
addr == 16'h195 ? 16'h0002 :  // <0135> "
addr == 16'h196 ? 16'hfc00 :  // <0135> "
// :run_poll // = 0x0197
addr == 16'h197 ? 16'hfba0 :  // <0137> pollchar
addr == 16'h198 ? 16'h001a :  // <0137> "
addr == 16'h199 ? 16'hfc00 :  // <0137> "
addr == 16'h19a ? 16'h0760 :  // <0138> b = -1
addr == 16'h19b ? 16'he407 :  // <0139> bn eq :parse_cmd
addr == 16'h19c ? 16'h01a3 :  // <0139> "
addr == 16'h19d ? 16'h0018 :  // <0140> a = bp_status
addr == 16'h19e ? 16'he000 :  // <0141> br az :run_poll
addr == 16'h19f ? 16'h0197 :  // <0141> "
// target hit a breakpoint; switch to stepping mode.
addr == 16'h1a0 ? 16'h3e08 :  // <0143> bus_ctrl = $bp_step_mask
addr == 16'h1a1 ? 16'he00f :  // <0144> jmp :cmd_loop
addr == 16'h1a2 ? 16'h0156 :  // <0144> "

// :parse_cmd // = 0x01a3

// command = step next instruction.
addr == 16'h1a3 ? 16'h066e :  // <0149> b = 110 // asc b = "n"
addr == 16'h1a4 ? 16'he407 :  // <0150> bn eq :skip_step
addr == 16'h1a5 ? 16'h01ad :  // <0150> "
addr == 16'h1a6 ? 16'h3e08 :  // <0151> bus_ctrl = $bp_step_mask
addr == 16'h1a7 ? 16'h2409 :  // <0152> bp0_addr = bp0_addr
addr == 16'h1a8 ? 16'hfba0 :  // <0153> call :wait_for_bp
addr == 16'h1a9 ? 16'h01f7 :  // <0153> "
addr == 16'h1aa ? 16'hfc00 :  // <0153> "
addr == 16'h1ab ? 16'he00f :  // <0154> jmp :cmd_loop
addr == 16'h1ac ? 16'h0156 :  // <0154> "
// :skip_step // = 0x01ad

// command = reset target.
addr == 16'h1ad ? 16'h0652 :  // <0158> b = 82 // asc b = "R"
addr == 16'h1ae ? 16'he407 :  // <0159> bn eq :skip_reset
addr == 16'h1af ? 16'h01b9 :  // <0159> "
addr == 16'h1b0 ? 16'h3e02 :  // <0160> bus_ctrl = $tg_reset_mask
addr == 16'h1b1 ? 16'hc800 :  // <0161> nop
addr == 16'h1b2 ? 16'hc800 :  // <0162> nop
addr == 16'h1b3 ? 16'h3e08 :  // <0163> bus_ctrl = $bp_step_mask
addr == 16'h1b4 ? 16'hfba0 :  // <0164> call :wait_for_bp
addr == 16'h1b5 ? 16'h01f7 :  // <0164> "
addr == 16'h1b6 ? 16'hfc00 :  // <0164> "
addr == 16'h1b7 ? 16'he00f :  // <0165> jmp :cmd_loop
addr == 16'h1b8 ? 16'h0156 :  // <0165> "
// :skip_reset // = 0x01b9

// command = load program.
addr == 16'h1b9 ? 16'h066c :  // <0169> b = 108 // asc b = "l"
addr == 16'h1ba ? 16'he407 :  // <0170> bn eq :skip_load
addr == 16'h1bb ? 16'h01c1 :  // <0170> "
addr == 16'h1bc ? 16'hfba0 :  // <0171> call :load_program
addr == 16'h1bd ? 16'h024c :  // <0171> "
addr == 16'h1be ? 16'hfc00 :  // <0171> "
addr == 16'h1bf ? 16'he00f :  // <0172> jmp :cmd_loop
addr == 16'h1c0 ? 16'h0156 :  // <0172> "
// :skip_load // = 0x01c1

// command = run full speed.
addr == 16'h1c1 ? 16'h0672 :  // <0176> b = 114 // asc b = "r"
addr == 16'h1c2 ? 16'he407 :  // <0177> bn eq :skip_run
addr == 16'h1c3 ? 16'h01c8 :  // <0177> "
// release target reset, to run.
addr == 16'h1c4 ? 16'h3e00 :  // <0179> bus_ctrl = 0
addr == 16'h1c5 ? 16'h2409 :  // <0180> bp0_addr = bp0_addr
addr == 16'h1c6 ? 16'he00f :  // <0181> jmp :cmd_loop
addr == 16'h1c7 ? 16'h0156 :  // <0181> "
// :skip_run // = 0x01c8

// command = set breakpoint.
addr == 16'h1c8 ? 16'h0662 :  // <0185> b = 98 // asc b = "b"
addr == 16'h1c9 ? 16'he407 :  // <0186> bn eq :skip_setbrk
addr == 16'h1ca ? 16'h01d0 :  // <0186> "
addr == 16'h1cb ? 16'hfba0 :  // <0187> call :set_bp
addr == 16'h1cc ? 16'h01fb :  // <0187> "
addr == 16'h1cd ? 16'hfc00 :  // <0187> "
addr == 16'h1ce ? 16'he00f :  // <0188> jmp :cmd_loop
addr == 16'h1cf ? 16'h0156 :  // <0188> "
// :skip_setbrk // = 0x01d0

addr == 16'h1d0 ? 16'h023f :  // <0191> a = 63 // putasc "?"
addr == 16'h1d1 ? 16'hfba0 :  // <0191> putasc "?"
addr == 16'h1d2 ? 16'h0002 :  // <0191> "
addr == 16'h1d3 ? 16'hfc00 :  // <0191> "
addr == 16'h1d4 ? 16'h020d :  // <0192> a = 13 // puteol
addr == 16'h1d5 ? 16'hfba0 :  // <0192> puteol
addr == 16'h1d6 ? 16'h0002 :  // <0192> "
addr == 16'h1d7 ? 16'hfc00 :  // <0192> "
addr == 16'h1d8 ? 16'h020a :  // <0192> a = 10 // puteol
addr == 16'h1d9 ? 16'hfba0 :  // <0192> puteol
addr == 16'h1da ? 16'h0002 :  // <0192> "
addr == 16'h1db ? 16'hfc00 :  // <0192> "
addr == 16'h1dc ? 16'he00f :  // <0193> jmp :cmd_loop
addr == 16'h1dd ? 16'h0156 :  // <0193> "

// demonstrations //////////////////////////////

// set a breakpoint, wait til it hits.
addr == 16'h1de ? 16'h2615 :  // <0198> bp0_addr = 0x15
// :main_loop // = 0x01df
addr == 16'h1df ? 16'hfba0 :  // <0200> call :wait_for_bp
addr == 16'h1e0 ? 16'h01f7 :  // <0200> "
addr == 16'h1e1 ? 16'hfc00 :  // <0200> "

// release target to run full speed.
addr == 16'h1e2 ? 16'h3e00 :  // <0203> bus_ctrl = 0

// interrupt the target and single step it a few times.
addr == 16'h1e3 ? 16'h3e08 :  // <0206> bus_ctrl = $bp_step_mask
addr == 16'h1e4 ? 16'hfba0 :  // <0207> call :wait_for_bp
addr == 16'h1e5 ? 16'h01f7 :  // <0207> "
addr == 16'h1e6 ? 16'hfc00 :  // <0207> "
addr == 16'h1e7 ? 16'h2409 :  // <0208> bp0_addr = bp0_addr
addr == 16'h1e8 ? 16'hfba0 :  // <0209> call :wait_for_bp
addr == 16'h1e9 ? 16'h01f7 :  // <0209> "
addr == 16'h1ea ? 16'hfc00 :  // <0209> "
addr == 16'h1eb ? 16'h2409 :  // <0210> bp0_addr = bp0_addr
addr == 16'h1ec ? 16'hfba0 :  // <0211> call :wait_for_bp
addr == 16'h1ed ? 16'h01f7 :  // <0211> "
addr == 16'h1ee ? 16'hfc00 :  // <0211> "
addr == 16'h1ef ? 16'h2409 :  // <0212> bp0_addr = bp0_addr
addr == 16'h1f0 ? 16'hfba0 :  // <0213> call :wait_for_bp
addr == 16'h1f1 ? 16'h01f7 :  // <0213> "
addr == 16'h1f2 ? 16'hfc00 :  // <0213> "
addr == 16'h1f3 ? 16'h3e00 :  // <0214> bus_ctrl = 0

// release target to pass breakpoint once.
addr == 16'h1f4 ? 16'h2409 :  // <0217> bp0_addr = bp0_addr

addr == 16'h1f5 ? 16'he00f :  // <0219> jmp :main_loop
addr == 16'h1f6 ? 16'h01df :  // <0219> "

// ######## func wait_for_bp // = 0x01f7
// :poll // = 0x01f7
addr == 16'h1f7 ? 16'h0018 :  // <0223> a = bp_status
addr == 16'h1f8 ? 16'he000 :  // <0224> br az :poll
addr == 16'h1f9 ? 16'h01f7 :  // <0224> "
addr == 16'h1fa ? 16'hfc00 :  // <0225> end_func

// ######## func set_bp // = 0x01fb
addr == 16'h1fb ? 16'h2004 :  // <0227> push x // func set_bp
addr == 16'h1fc ? 16'h2005 :  // <0227> push y // "
addr == 16'h1fd ? 16'h203e :  // <0227> push rtna // "
addr == 16'h1fe ? 16'hfba0 :  // <0228> getchar_echo
addr == 16'h1ff ? 16'h0011 :  // <0228> "
addr == 16'h200 ? 16'hfc00 :  // <0228> "
addr == 16'h201 ? 16'h2000 :  // <0228> push a // "
addr == 16'h202 ? 16'hfba0 :  // <0228> "
addr == 16'h203 ? 16'h0002 :  // <0228> "
addr == 16'h204 ? 16'hfc00 :  // <0228> "
addr == 16'h205 ? 16'h0008 :  // <0228> pop a // "
addr == 16'h206 ? 16'h1000 :  // <0229> x = a
addr == 16'h207 ? 16'hfba0 :  // <0230> getchar_echo
addr == 16'h208 ? 16'h0011 :  // <0230> "
addr == 16'h209 ? 16'hfc00 :  // <0230> "
addr == 16'h20a ? 16'h2000 :  // <0230> push a // "
addr == 16'h20b ? 16'hfba0 :  // <0230> "
addr == 16'h20c ? 16'h0002 :  // <0230> "
addr == 16'h20d ? 16'hfc00 :  // <0230> "
addr == 16'h20e ? 16'h0008 :  // <0230> pop a // "
addr == 16'h20f ? 16'h063d :  // <0231> b = 61 // asc b = "="
addr == 16'h210 ? 16'he407 :  // <0232> bn eq :fail
addr == 16'h211 ? 16'h023c :  // <0232> "
addr == 16'h212 ? 16'hfba0 :  // <0233> call :get4x
addr == 16'h213 ? 16'h0096 :  // <0233> "
addr == 16'h214 ? 16'hfc00 :  // <0233> "
addr == 16'h215 ? 16'h1400 :  // <0234> y = a
addr == 16'h216 ? 16'h0200 :  // <0235> a = 0
addr == 16'h217 ? 16'he407 :  // <0236> bn eq :fail
addr == 16'h218 ? 16'h023c :  // <0236> "
addr == 16'h219 ? 16'h0004 :  // <0237> a = x
addr == 16'h21a ? 16'h0630 :  // <0238> b = 48 // asc b = "0"
addr == 16'h21b ? 16'he007 :  // <0239> br eq :b0
addr == 16'h21c ? 16'h0228 :  // <0239> "
addr == 16'h21d ? 16'h0631 :  // <0240> b = 49 // asc b = "1"
addr == 16'h21e ? 16'he007 :  // <0241> br eq :b1
addr == 16'h21f ? 16'h022d :  // <0241> "
addr == 16'h220 ? 16'h0632 :  // <0242> b = 50 // asc b = "2"
addr == 16'h221 ? 16'he007 :  // <0243> br eq :b2
addr == 16'h222 ? 16'h0232 :  // <0243> "
addr == 16'h223 ? 16'h0633 :  // <0244> b = 51 // asc b = "3"
addr == 16'h224 ? 16'he007 :  // <0245> br eq :b3
addr == 16'h225 ? 16'h0237 :  // <0245> "
addr == 16'h226 ? 16'he00f :  // <0246> jmp :fail
addr == 16'h227 ? 16'h023c :  // <0246> "
// :b0 // = 0x0228
addr == 16'h228 ? 16'h2405 :  // <0248> bp0_addr = y
addr == 16'h229 ? 16'hf808 :  // <0249> pop rtna // rtn
addr == 16'h22a ? 16'h1408 :  // <0249> pop y // "
addr == 16'h22b ? 16'h1008 :  // <0249> pop x // "
addr == 16'h22c ? 16'hfc00 :  // <0249> rtn
// :b1 // = 0x022d
addr == 16'h22d ? 16'h2805 :  // <0251> bp1_addr = y
addr == 16'h22e ? 16'hf808 :  // <0252> pop rtna // rtn
addr == 16'h22f ? 16'h1408 :  // <0252> pop y // "
addr == 16'h230 ? 16'h1008 :  // <0252> pop x // "
addr == 16'h231 ? 16'hfc00 :  // <0252> rtn
// :b2 // = 0x0232
addr == 16'h232 ? 16'h2c05 :  // <0254> bp2_addr = y
addr == 16'h233 ? 16'hf808 :  // <0255> pop rtna // rtn
addr == 16'h234 ? 16'h1408 :  // <0255> pop y // "
addr == 16'h235 ? 16'h1008 :  // <0255> pop x // "
addr == 16'h236 ? 16'hfc00 :  // <0255> rtn
// :b3 // = 0x0237
addr == 16'h237 ? 16'h3005 :  // <0257> bp3_addr = y
addr == 16'h238 ? 16'hf808 :  // <0258> pop rtna // rtn
addr == 16'h239 ? 16'h1408 :  // <0258> pop y // "
addr == 16'h23a ? 16'h1008 :  // <0258> pop x // "
addr == 16'h23b ? 16'hfc00 :  // <0258> rtn
// :fail // = 0x023c
addr == 16'h23c ? 16'h023f :  // <0260> a = 63 // putasc "?"
addr == 16'h23d ? 16'hfba0 :  // <0260> putasc "?"
addr == 16'h23e ? 16'h0002 :  // <0260> "
addr == 16'h23f ? 16'hfc00 :  // <0260> "
addr == 16'h240 ? 16'h020d :  // <0261> a = 13 // puteol
addr == 16'h241 ? 16'hfba0 :  // <0261> puteol
addr == 16'h242 ? 16'h0002 :  // <0261> "
addr == 16'h243 ? 16'hfc00 :  // <0261> "
addr == 16'h244 ? 16'h020a :  // <0261> a = 10 // puteol
addr == 16'h245 ? 16'hfba0 :  // <0261> puteol
addr == 16'h246 ? 16'h0002 :  // <0261> "
addr == 16'h247 ? 16'hfc00 :  // <0261> "
addr == 16'h248 ? 16'hf808 :  // <0262> pop rtna // end_func
addr == 16'h249 ? 16'h1408 :  // <0262> pop y // "
addr == 16'h24a ? 16'h1008 :  // <0262> pop x // "
addr == 16'h24b ? 16'hfc00 :  // <0262> end_func

// ######## func load_program // = 0x024c
addr == 16'h24c ? 16'h2002 :  // <0264> push i // func load_program
addr == 16'h24d ? 16'h2003 :  // <0264> push j // "
addr == 16'h24e ? 16'h2004 :  // <0264> push x // "
addr == 16'h24f ? 16'h203e :  // <0264> push rtna // "
// load target program from UART.

// length, little-endian.  memorize in x.
addr == 16'h250 ? 16'h020d :  // <0268> a = 13 // puteol
addr == 16'h251 ? 16'hfba0 :  // <0268> puteol
addr == 16'h252 ? 16'h0002 :  // <0268> "
addr == 16'h253 ? 16'hfc00 :  // <0268> "
addr == 16'h254 ? 16'h020a :  // <0268> a = 10 // puteol
addr == 16'h255 ? 16'hfba0 :  // <0268> puteol
addr == 16'h256 ? 16'h0002 :  // <0268> "
addr == 16'h257 ? 16'hfc00 :  // <0268> "
addr == 16'h258 ? 16'h024c :  // <0269> a = 76 // putasc L
addr == 16'h259 ? 16'hfba0 :  // <0269> putasc L
addr == 16'h25a ? 16'h0002 :  // <0269> "
addr == 16'h25b ? 16'hfc00 :  // <0269> "
addr == 16'h25c ? 16'hfba0 :  // <0270> get16 x
addr == 16'h25d ? 16'h0011 :  // <0270> "
addr == 16'h25e ? 16'hfc00 :  // <0270> "
addr == 16'h25f ? 16'h2000 :  // <0270> push a // "
addr == 16'h260 ? 16'hfba0 :  // <0270> "
addr == 16'h261 ? 16'h0011 :  // <0270> "
addr == 16'h262 ? 16'hfc00 :  // <0270> "
addr == 16'h263 ? 16'h0352 :  // <0270> "
addr == 16'h264 ? 16'h0352 :  // <0270> "
addr == 16'h265 ? 16'h0408 :  // <0270> pop b // "
addr == 16'h266 ? 16'hc800 :  // <0270> "
addr == 16'h267 ? 16'h1334 :  // <0270> "
addr == 16'h268 ? 16'h0004 :  // <0271> a = x
addr == 16'h269 ? 16'hfba0 :  // <0272> call :put4x
addr == 16'h26a ? 16'h005d :  // <0272> "
addr == 16'h26b ? 16'hfc00 :  // <0272> "
addr == 16'h26c ? 16'h020d :  // <0273> a = 13 // puteol
addr == 16'h26d ? 16'hfba0 :  // <0273> puteol
addr == 16'h26e ? 16'h0002 :  // <0273> "
addr == 16'h26f ? 16'hfc00 :  // <0273> "
addr == 16'h270 ? 16'h020a :  // <0273> a = 10 // puteol
addr == 16'h271 ? 16'hfba0 :  // <0273> puteol
addr == 16'h272 ? 16'h0002 :  // <0273> "
addr == 16'h273 ? 16'hfc00 :  // <0273> "

// put target into reset again, in case this is a target warm boot.
addr == 16'h274 ? 16'h3e02 :  // <0276> bus_ctrl = $tg_reset_mask

// load opcodes.  count up address in i.
addr == 16'h275 ? 16'h0a00 :  // <0279> i = 0
addr == 16'h276 ? 16'h0e01 :  // <0280> j = 1
addr == 16'h277 ? 16'hfba0 :  // <0281> call :fletcher16_init
addr == 16'h278 ? 16'h00f4 :  // <0281> "
addr == 16'h279 ? 16'hfc00 :  // <0281> "
// :loadword // = 0x027a
// receive, store in RAM.
addr == 16'h27a ? 16'hfba0 :  // <0284> get16 a
addr == 16'h27b ? 16'h0011 :  // <0284> "
addr == 16'h27c ? 16'hfc00 :  // <0284> "
addr == 16'h27d ? 16'h2000 :  // <0284> push a // "
addr == 16'h27e ? 16'hfba0 :  // <0284> "
addr == 16'h27f ? 16'h0011 :  // <0284> "
addr == 16'h280 ? 16'hfc00 :  // <0284> "
addr == 16'h281 ? 16'h0352 :  // <0284> "
addr == 16'h282 ? 16'h0352 :  // <0284> "
addr == 16'h283 ? 16'h0408 :  // <0284> pop b // "
addr == 16'h284 ? 16'hc800 :  // <0284> "
addr == 16'h285 ? 16'h0334 :  // <0284> "
addr == 16'h286 ? 16'h4c02 :  // <0285> m9k_addr = i
addr == 16'h287 ? 16'h5000 :  // <0286> m9k_data = a

// read back from RAM and build checksum.
addr == 16'h288 ? 16'h0014 :  // <0289> a = m9k_data
addr == 16'h289 ? 16'hfba0 :  // <0290> call :fletcher16_input16
addr == 16'h28a ? 16'h0113 :  // <0290> "
addr == 16'h28b ? 16'hfc00 :  // <0290> "

//  show decimated feedback text, for more speed:
addr == 16'h28c ? 16'h0002 :  // <0293> a = i
addr == 16'h28d ? 16'h061f :  // <0294> b = 0x1f
addr == 16'h28e ? 16'he403 :  // <0295> bn and0z :skip_text
addr == 16'h28f ? 16'h0294 :  // <0295> "
addr == 16'h290 ? 16'h022e :  // <0296> a = 46 // putasc "."
addr == 16'h291 ? 16'hfba0 :  // <0296> putasc "."
addr == 16'h292 ? 16'h0002 :  // <0296> "
addr == 16'h293 ? 16'hfc00 :  // <0296> "
// :skip_text // = 0x0294

addr == 16'h294 ? 16'hc800 :  // <0299> i = i+j
addr == 16'h295 ? 16'h0b10 :  // <0299> "
addr == 16'h296 ? 16'h0002 :  // <0300> a = i
addr == 16'h297 ? 16'h0404 :  // <0301> b = x
addr == 16'h298 ? 16'he407 :  // <0302> bn eq :loadword
addr == 16'h299 ? 16'h027a :  // <0302> "
addr == 16'h29a ? 16'h020d :  // <0303> a = 13 // puteol
addr == 16'h29b ? 16'hfba0 :  // <0303> puteol
addr == 16'h29c ? 16'h0002 :  // <0303> "
addr == 16'h29d ? 16'hfc00 :  // <0303> "
addr == 16'h29e ? 16'h020a :  // <0303> a = 10 // puteol
addr == 16'h29f ? 16'hfba0 :  // <0303> puteol
addr == 16'h2a0 ? 16'h0002 :  // <0303> "
addr == 16'h2a1 ? 16'hfc00 :  // <0303> "
addr == 16'h2a2 ? 16'hfba0 :  // <0304> call :fletcher16_result
addr == 16'h2a3 ? 16'h0124 :  // <0304> "
addr == 16'h2a4 ? 16'hfc00 :  // <0304> "
addr == 16'h2a5 ? 16'hfba0 :  // <0305> call :put4x
addr == 16'h2a6 ? 16'h005d :  // <0305> "
addr == 16'h2a7 ? 16'hfc00 :  // <0305> "
addr == 16'h2a8 ? 16'h020d :  // <0306> a = 13 // puteol
addr == 16'h2a9 ? 16'hfba0 :  // <0306> puteol
addr == 16'h2aa ? 16'h0002 :  // <0306> "
addr == 16'h2ab ? 16'hfc00 :  // <0306> "
addr == 16'h2ac ? 16'h020a :  // <0306> a = 10 // puteol
addr == 16'h2ad ? 16'hfba0 :  // <0306> puteol
addr == 16'h2ae ? 16'h0002 :  // <0306> "
addr == 16'h2af ? 16'hfc00 :  // <0306> "
addr == 16'h2b0 ? 16'hf808 :  // <0307> pop rtna // end_func
addr == 16'h2b1 ? 16'h1008 :  // <0307> pop x // "
addr == 16'h2b2 ? 16'h0c08 :  // <0307> pop j // "
addr == 16'h2b3 ? 16'h0808 :  // <0307> pop i // "
addr == 16'h2b4 ? 16'hfc00 :  // <0307> end_func

// observe a register.  return its value in peek_data.
// pass its register address in a.
// ######## func peek // = 0x02b5
addr == 16'h2b5 ? 16'h07a0 :  // <0312> b = 0x3ff
addr == 16'h2b6 ? 16'h03ff :  // <0312> "
addr == 16'h2b7 ? 16'hc800 :  // <0313> a = and
addr == 16'h2b8 ? 16'h0330 :  // <0313> "
// debug_peek_reg = 31 << 10
addr == 16'h2b9 ? 16'h07a0 :  // <0315> b = 0x7c00
addr == 16'h2ba ? 16'h7c00 :  // <0315> "
addr == 16'h2bb ? 16'hc800 :  // <0316> force_opcode = or
addr == 16'h2bc ? 16'h3734 :  // <0316> "
addr == 16'h2bd ? 16'h3e04 :  // <0317> bus_ctrl = $divert_code_bus_mask
addr == 16'h2be ? 16'h4201 :  // <0318> tg_force = $hold_state_mask
addr == 16'h2bf ? 16'h4203 :  // <0319> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h2c0 ? 16'h4205 :  // <0320> tg_force = ($hold_state_mask | $force_exec_mask)
addr == 16'h2c1 ? 16'h4201 :  // <0321> tg_force = $hold_state_mask
// target's register value is now in peek_data.
// refill target exr so it can resume seamlessly.
addr == 16'h2c2 ? 16'h3415 :  // <0324> force_opcode = exr_shadow
addr == 16'h2c3 ? 16'h4203 :  // <0325> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h2c4 ? 16'h4200 :  // <0326> tg_force = 0
addr == 16'h2c5 ? 16'hfc00 :  // <0327> end_func

// show target status display.
// ######## func dump_target // = 0x02c6
addr == 16'h2c6 ? 16'h2002 :  // <0330> push i // func dump_target
addr == 16'h2c7 ? 16'h2003 :  // <0330> push j // "
addr == 16'h2c8 ? 16'h2004 :  // <0330> push x // "
addr == 16'h2c9 ? 16'h2005 :  // <0330> push y // "
addr == 16'h2ca ? 16'h203e :  // <0330> push rtna // "
addr == 16'h2cb ? 16'h020d :  // <0331> a = 13 // puteol
addr == 16'h2cc ? 16'hfba0 :  // <0331> puteol
addr == 16'h2cd ? 16'h0002 :  // <0331> "
addr == 16'h2ce ? 16'hfc00 :  // <0331> "
addr == 16'h2cf ? 16'h020a :  // <0331> a = 10 // puteol
addr == 16'h2d0 ? 16'hfba0 :  // <0331> puteol
addr == 16'h2d1 ? 16'h0002 :  // <0331> "
addr == 16'h2d2 ? 16'hfc00 :  // <0331> "
addr == 16'h2d3 ? 16'h0a00 :  // <0332> i = 0
// :next_reg // = 0x02d4
// fetch register name from table in target program.
// i = register number.  x = 2-byte word index within each name string.
// peek is skipped for any reg name starting with 2 slashes (good for read-sensitive regs).
addr == 16'h2d4 ? 16'h1200 :  // <0337> x = 0
addr == 16'h2d5 ? 16'h1601 :  // <0338> y = 1
// :next_chars // = 0x02d6
addr == 16'h2d6 ? 16'h0002 :  // <0340> a = i
addr == 16'h2d7 ? 16'h0351 :  // <0341> a = a<<1
addr == 16'h2d8 ? 16'h0351 :  // <0342> a = a<<1
addr == 16'h2d9 ? 16'h0603 :  // <0343> b = 3
addr == 16'h2da ? 16'hc800 :  // <0344> a = a+b
addr == 16'h2db ? 16'h0300 :  // <0344> "
addr == 16'h2dc ? 16'h0404 :  // <0345> b = x
addr == 16'h2dd ? 16'hc800 :  // <0346> m9k_addr = a+b
addr == 16'h2de ? 16'h4f00 :  // <0346> "
addr == 16'h2df ? 16'h0014 :  // <0347> a = m9k_data
addr == 16'h2e0 ? 16'h07a0 :  // <0348> b = 0x2f2f
addr == 16'h2e1 ? 16'h2f2f :  // <0348> "
addr == 16'h2e2 ? 16'he007 :  // <0349> br eq :no_peek
addr == 16'h2e3 ? 16'h0308 :  // <0349> "
addr == 16'h2e4 ? 16'h0014 :  // <0350> a = m9k_data // putchar m9k_data
addr == 16'h2e5 ? 16'hfba0 :  // <0350> putchar m9k_data
addr == 16'h2e6 ? 16'h0002 :  // <0350> "
addr == 16'h2e7 ? 16'hfc00 :  // <0350> "
addr == 16'h2e8 ? 16'h0014 :  // <0351> a = m9k_data
addr == 16'h2e9 ? 16'h0353 :  // <0352> a = a>>4
addr == 16'h2ea ? 16'h0353 :  // <0353> a = a>>4
addr == 16'h2eb ? 16'hfba0 :  // <0354> putchar a
addr == 16'h2ec ? 16'h0002 :  // <0354> "
addr == 16'h2ed ? 16'hfc00 :  // <0354> "
addr == 16'h2ee ? 16'hc800 :  // <0355> x = x+y
addr == 16'h2ef ? 16'h1320 :  // <0355> "
addr == 16'h2f0 ? 16'h0004 :  // <0356> a = x
addr == 16'h2f1 ? 16'h0604 :  // <0357> b = 4
addr == 16'h2f2 ? 16'he407 :  // <0358> bn eq :next_chars
addr == 16'h2f3 ? 16'h02d6 :  // <0358> "
addr == 16'h2f4 ? 16'h023d :  // <0359> a = 61 // putasc "="
addr == 16'h2f5 ? 16'hfba0 :  // <0359> putasc "="
addr == 16'h2f6 ? 16'h0002 :  // <0359> "
addr == 16'h2f7 ? 16'hfc00 :  // <0359> "
addr == 16'h2f8 ? 16'h0002 :  // <0360> a = i
addr == 16'h2f9 ? 16'hfba0 :  // <0361> call :peek
addr == 16'h2fa ? 16'h02b5 :  // <0361> "
addr == 16'h2fb ? 16'hfc00 :  // <0361> "
addr == 16'h2fc ? 16'h0017 :  // <0362> a = peek_data
addr == 16'h2fd ? 16'hfba0 :  // <0363> call :put4x
addr == 16'h2fe ? 16'h005d :  // <0363> "
addr == 16'h2ff ? 16'hfc00 :  // <0363> "
addr == 16'h300 ? 16'h020d :  // <0364> a = 13 // puteol
addr == 16'h301 ? 16'hfba0 :  // <0364> puteol
addr == 16'h302 ? 16'h0002 :  // <0364> "
addr == 16'h303 ? 16'hfc00 :  // <0364> "
addr == 16'h304 ? 16'h020a :  // <0364> a = 10 // puteol
addr == 16'h305 ? 16'hfba0 :  // <0364> puteol
addr == 16'h306 ? 16'h0002 :  // <0364> "
addr == 16'h307 ? 16'hfc00 :  // <0364> "
// :no_peek // = 0x0308
addr == 16'h308 ? 16'h0e01 :  // <0366> j = 1
addr == 16'h309 ? 16'hc800 :  // <0367> i = i+j
addr == 16'h30a ? 16'h0b10 :  // <0367> "
// loop up to the number of registers in the target program's register name table.
addr == 16'h30b ? 16'h4e02 :  // <0369> m9k_addr = 2
addr == 16'h30c ? 16'h0414 :  // <0370> b = m9k_data
addr == 16'h30d ? 16'h0002 :  // <0371> a = i
addr == 16'h30e ? 16'he407 :  // <0372> bn eq :next_reg
addr == 16'h30f ? 16'h02d4 :  // <0372> "
addr == 16'h310 ? 16'hf808 :  // <0373> pop rtna // end_func
addr == 16'h311 ? 16'h1408 :  // <0373> pop y // "
addr == 16'h312 ? 16'h1008 :  // <0373> pop x // "
addr == 16'h313 ? 16'h0c08 :  // <0373> pop j // "
addr == 16'h314 ? 16'h0808 :  // <0373> pop i // "
addr == 16'h315 ? 16'hfc00 :  // <0373> end_func

        
                16'hxxxx;
        endmodule
    
