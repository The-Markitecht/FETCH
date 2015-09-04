
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

// size of register file.  all registers are external to the Synapse316 core.
// min_num_regs <= num_regs <= max_num_regs.
//vdefine num_regs                32
//vdefine top_reg                 $num_regs - 1
// those 2 have been moved to the assembly program to be distinct for each core.

// Synapse instruction set architecture constants.

// Synapse instruction set codes.

// debugging supervisor contants.  these are also required by implementation of the target MCU core.

// program code dimensions.

// these are for the VISOR code, not the TARGET code.

// register file configuration

// application-specific register aliases.






// Synapse instruction set architecture constants.


addr == 16'h00 ? 16'he00f :  // <0071> jmp :main
addr == 16'h01 ? 16'h0138 :  // <0071> "


// driver library for my_uart_v2 simple async transceiver.



// :eol_msg // = 0x0002
// "\r\n\x0"
addr == 16'h02 ? 16'h0a0d :  // <0011>   
addr == 16'h03 ? 16'h0000 :  // <0011>   


// routine sends out the low byte from a to the UART.  blocks until the UART accepts the byte.
// ######## func putchar_atx // = 0x0004
addr == 16'h04 ? 16'h2004 :  // <0038> push x // func putchar_atx

addr == 16'h05 ? 16'h1000 :  // <0040> x = a

// wait for UART to be idle (not busy).
addr == 16'h06 ? 16'h0202 :  // <0043> a = $atx_busy_mask
// :pcatx_wait_for_idle // = 0x0007
addr == 16'h07 ? 16'h0412 :  // <0045> b = atx_ctrl
addr == 16'h08 ? 16'he403 :  // <0046> bn and0z :pcatx_wait_for_idle
addr == 16'h09 ? 16'h0007 :  // <0046> "

// push word to the UART.  its low byte is a character.
addr == 16'h0a ? 16'h4404 :  // <0049> atx_data = x

// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_ctrl.
addr == 16'h0b ? 16'h4a01 :  // <0054> atx_ctrl = $atx_load_mask

// wait until UART is busy, as acknowledgement.
addr == 16'h0c ? 16'h0202 :  // <0057> a = $atx_busy_mask
// :pcatx_wait_for_busy // = 0x000d
addr == 16'h0d ? 16'h0412 :  // <0059> b = atx_ctrl
addr == 16'h0e ? 16'he003 :  // <0060> br and0z :pcatx_wait_for_busy
addr == 16'h0f ? 16'h000d :  // <0060> "
addr == 16'h10 ? 16'h4a00 :  // <0061> atx_ctrl = 0
addr == 16'h11 ? 16'h1008 :  // <0062> pop x // end_func
addr == 16'h12 ? 16'hfc00 :  // <0062> swapra = nop

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// ######## func getchar_atx // = 0x0013
// wait until UART is busy, then idle.
addr == 16'h13 ? 16'h0204 :  // <0068> a = $arx_busy_mask
// :wait_for_busy // = 0x0014
addr == 16'h14 ? 16'h0412 :  // <0070> b = atx_ctrl
addr == 16'h15 ? 16'he003 :  // <0071> br and0z :wait_for_busy
addr == 16'h16 ? 16'h0014 :  // <0071> "
// :wait_for_idle // = 0x0017
addr == 16'h17 ? 16'h0412 :  // <0073> b = atx_ctrl
addr == 16'h18 ? 16'he403 :  // <0074> bn and0z :wait_for_idle
addr == 16'h19 ? 16'h0017 :  // <0074> "
addr == 16'h1a ? 16'h0011 :  // <0075> a = atx_data
addr == 16'h1b ? 16'hfc00 :  // <0076> swapra = nop

// returns a character in a, or -1 if none.
// this version can miss characters if not polled while the character is arriving.
// ######## func pollchar_atx // = 0x001c
// check for UART is busy, then idle.
addr == 16'h1c ? 16'h0204 :  // <0082> a = $arx_busy_mask
addr == 16'h1d ? 16'h0412 :  // <0083> b = atx_ctrl
addr == 16'h1e ? 16'he003 :  // <0084> br and0z :none
addr == 16'h1f ? 16'h0025 :  // <0084> "
// :wait_for_idle // = 0x0020
addr == 16'h20 ? 16'h0412 :  // <0086> b = atx_ctrl
addr == 16'h21 ? 16'he403 :  // <0087> bn and0z :wait_for_idle
addr == 16'h22 ? 16'h0020 :  // <0087> "
addr == 16'h23 ? 16'h0011 :  // <0088> a = atx_data
addr == 16'h24 ? 16'hfc00 :  // <0089> swapra = nop
// :none // = 0x0025
addr == 16'h25 ? 16'h0360 :  // <0091> a = -1
addr == 16'h26 ? 16'hfc00 :  // <0092> swapra = nop



// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// ######## func fetch_byte // = 0x0027
addr == 16'h27 ? 16'h0601 :  // <0005> b = 1
addr == 16'h28 ? 16'he003 :  // <0006> br and0z :pick_byte_even
addr == 16'h29 ? 16'h0032 :  // <0006> "
addr == 16'h2a ? 16'h0350 :  // <0007> a = a>>1
addr == 16'h2b ? 16'h0404 :  // <0008> b = x
addr == 16'h2c ? 16'hc800 :  // <0009> fetch a from a+b
addr == 16'h2d ? 16'hd300 :  // <0009> "
addr == 16'h2e ? 16'h03b0 :  // <0009> "
addr == 16'h2f ? 16'h0353 :  // <0010> a = a>>4
addr == 16'h30 ? 16'h0353 :  // <0011> a = a>>4
addr == 16'h31 ? 16'hfc00 :  // <0012> swapra = nop
// :pick_byte_even // = 0x0032
addr == 16'h32 ? 16'h0350 :  // <0014> a = a>>1
addr == 16'h33 ? 16'h0404 :  // <0015> b = x
addr == 16'h34 ? 16'hc800 :  // <0016> fetch a from a+b
addr == 16'h35 ? 16'hd300 :  // <0016> "
addr == 16'h36 ? 16'h03b0 :  // <0016> "
addr == 16'h37 ? 16'h06ff :  // <0017> b = 0xff
addr == 16'h38 ? 16'hc800 :  // <0018> a = and
addr == 16'h39 ? 16'h0330 :  // <0018> "
addr == 16'h3a ? 16'hfc00 :  // <0019> swapra = nop

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// ######## func find_in_fetch // = 0x003b
addr == 16'h3b ? 16'h2002 :  // <0027> push i // func find_in_fetch
addr == 16'h3c ? 16'h2003 :  // <0027> push j // "
addr == 16'h3d ? 16'h2005 :  // <0027> push y // "
addr == 16'h3e ? 16'h203e :  // <0027> push rtna // "
addr == 16'h3f ? 16'h1400 :  // <0028> y = a
addr == 16'h40 ? 16'h0f60 :  // <0029> j = -1
// :again // = 0x0041
addr == 16'h41 ? 16'he001 :  // <0031> br iz :fail
addr == 16'h42 ? 16'h0050 :  // <0031> "
addr == 16'h43 ? 16'h0b10 :  // <0032> i = ad1
addr == 16'h44 ? 16'h0002 :  // <0033> a = i

addr == 16'h45 ? 16'hfa27 :  // <0034> rtna = 39
addr == 16'h46 ? 16'hfc00 :  // <0034> swapra = nop

addr == 16'h47 ? 16'h0405 :  // <0035> b = y
addr == 16'h48 ? 16'he407 :  // <0036> bn eq :again
addr == 16'h49 ? 16'h0041 :  // <0036> "
// :found // = 0x004a
addr == 16'h4a ? 16'h0002 :  // <0038> a = i
addr == 16'h4b ? 16'hf808 :  // <0039> pop rtna // rtn
addr == 16'h4c ? 16'h1408 :  // <0039> pop y // "
addr == 16'h4d ? 16'h0c08 :  // <0039> pop j // "
addr == 16'h4e ? 16'h0808 :  // <0039> pop i // "
addr == 16'h4f ? 16'hfc00 :  // <0039> swapra = nop
// :fail // = 0x0050
addr == 16'h50 ? 16'h0360 :  // <0041> a = -1
addr == 16'h51 ? 16'hf808 :  // <0042> pop rtna // end_func
addr == 16'h52 ? 16'h1408 :  // <0042> pop y // "
addr == 16'h53 ? 16'h0c08 :  // <0042> pop j // "
addr == 16'h54 ? 16'h0808 :  // <0042> pop i // "
addr == 16'h55 ? 16'hfc00 :  // <0042> swapra = nop



// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x0056
// "0123456789abcdef"
addr == 16'h56 ? 16'h3130 :  // <0050> 10
addr == 16'h57 ? 16'h3332 :  // <0050> 32
addr == 16'h58 ? 16'h3534 :  // <0050> 54
addr == 16'h59 ? 16'h3736 :  // <0050> 76
addr == 16'h5a ? 16'h3938 :  // <0050> 98
addr == 16'h5b ? 16'h6261 :  // <0050> ba
addr == 16'h5c ? 16'h6463 :  // <0050> dc
addr == 16'h5d ? 16'h6665 :  // <0050> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// ######## func put4x // = 0x005e
addr == 16'h5e ? 16'h2004 :  // <0054> push x // func put4x
addr == 16'h5f ? 16'h2006 :  // <0054> push g6 // "
addr == 16'h60 ? 16'h203e :  // <0054> push rtna // "
addr == 16'h61 ? 16'h13a0 :  // <0055> x = :hexdigits
addr == 16'h62 ? 16'h0056 :  // <0055> "

addr == 16'h63 ? 16'h1800 :  // <0057> g6 = a
addr == 16'h64 ? 16'h07a0 :  // <0058> b = 0xF000
addr == 16'h65 ? 16'hf000 :  // <0058> "
addr == 16'h66 ? 16'hc800 :  // <0059> a = and
addr == 16'h67 ? 16'h0330 :  // <0059> "
addr == 16'h68 ? 16'h0353 :  // <0060> a = a>>4
addr == 16'h69 ? 16'h0353 :  // <0061> a = a>>4
addr == 16'h6a ? 16'h0353 :  // <0062> a = a>>4

addr == 16'h6b ? 16'hfa27 :  // <0063> rtna = 39
addr == 16'h6c ? 16'hfc00 :  // <0063> swapra = nop


addr == 16'h6d ? 16'hfa04 :  // <0064> rtna = 4
addr == 16'h6e ? 16'hfc00 :  // <0064> swapra = nop


addr == 16'h6f ? 16'h0006 :  // <0066> a = g6
addr == 16'h70 ? 16'h07a0 :  // <0067> b = 0x0F00
addr == 16'h71 ? 16'h0f00 :  // <0067> "
addr == 16'h72 ? 16'hc800 :  // <0068> a = and
addr == 16'h73 ? 16'h0330 :  // <0068> "
addr == 16'h74 ? 16'h0353 :  // <0069> a = a>>4
addr == 16'h75 ? 16'h0353 :  // <0070> a = a>>4

addr == 16'h76 ? 16'hfa27 :  // <0071> rtna = 39
addr == 16'h77 ? 16'hfc00 :  // <0071> swapra = nop


addr == 16'h78 ? 16'hfa04 :  // <0072> rtna = 4
addr == 16'h79 ? 16'hfc00 :  // <0072> swapra = nop


addr == 16'h7a ? 16'h0006 :  // <0074> a = g6
addr == 16'h7b ? 16'h06f0 :  // <0075> b = 0x00F0
addr == 16'h7c ? 16'hc800 :  // <0076> a = and
addr == 16'h7d ? 16'h0330 :  // <0076> "
addr == 16'h7e ? 16'h0353 :  // <0077> a = a>>4

addr == 16'h7f ? 16'hfa27 :  // <0078> rtna = 39
addr == 16'h80 ? 16'hfc00 :  // <0078> swapra = nop


addr == 16'h81 ? 16'hfa04 :  // <0079> rtna = 4
addr == 16'h82 ? 16'hfc00 :  // <0079> swapra = nop


addr == 16'h83 ? 16'h0006 :  // <0081> a = g6
addr == 16'h84 ? 16'h060f :  // <0082> b = 0x000F
addr == 16'h85 ? 16'hc800 :  // <0083> a = and
addr == 16'h86 ? 16'h0330 :  // <0083> "

addr == 16'h87 ? 16'hfa27 :  // <0084> rtna = 39
addr == 16'h88 ? 16'hfc00 :  // <0084> swapra = nop


addr == 16'h89 ? 16'hfa04 :  // <0085> rtna = 4
addr == 16'h8a ? 16'hfc00 :  // <0085> swapra = nop


addr == 16'h8b ? 16'hf808 :  // <0087> pop rtna // end_func
addr == 16'h8c ? 16'h1808 :  // <0087> pop g6 // "
addr == 16'h8d ? 16'h1008 :  // <0087> pop x // "
addr == 16'h8e ? 16'hfc00 :  // <0087> swapra = nop

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// ######## func get4x // = 0x008f
addr == 16'h8f ? 16'h2002 :  // <0091> push i // func get4x
addr == 16'h90 ? 16'h2003 :  // <0091> push j // "
addr == 16'h91 ? 16'h2004 :  // <0091> push x // "
addr == 16'h92 ? 16'h2005 :  // <0091> push y // "
addr == 16'h93 ? 16'h203e :  // <0091> push rtna // "
// y = digit counter
// j = sum
addr == 16'h94 ? 16'h1604 :  // <0094> y = 4
// :again // = 0x0095

addr == 16'h95 ? 16'hfa13 :  // <0096> rtna = 19
addr == 16'h96 ? 16'hfc00 :  // <0096> swapra = nop

addr == 16'h97 ? 16'h13a0 :  // <0097> x = :hexdigits
addr == 16'h98 ? 16'h0056 :  // <0097> "
addr == 16'h99 ? 16'h0a10 :  // <0098> i = 16

addr == 16'h9a ? 16'hfa3b :  // <0099> rtna = 59
addr == 16'h9b ? 16'hfc00 :  // <0099> swapra = nop

addr == 16'h9c ? 16'h0760 :  // <0100> b = -1
addr == 16'h9d ? 16'he007 :  // <0101> br eq :fail
addr == 16'h9e ? 16'h00b2 :  // <0101> "
addr == 16'h9f ? 16'h0400 :  // <0102> b = a
addr == 16'ha0 ? 16'h0003 :  // <0103> a = j
addr == 16'ha1 ? 16'h0352 :  // <0104> a = a<<4
addr == 16'ha2 ? 16'hc800 :  // <0105> j = or
addr == 16'ha3 ? 16'h0f34 :  // <0105> "
addr == 16'ha4 ? 16'h1360 :  // <0106> x = -1
addr == 16'ha5 ? 16'hc800 :  // <0107> y = x+y
addr == 16'ha6 ? 16'h1720 :  // <0107> "
addr == 16'ha7 ? 16'h0005 :  // <0108> a = y
addr == 16'ha8 ? 16'he400 :  // <0109> bn az :again
addr == 16'ha9 ? 16'h0095 :  // <0109> "
addr == 16'haa ? 16'h0003 :  // <0110> a = j
addr == 16'hab ? 16'h0600 :  // <0111> b = 0
addr == 16'hac ? 16'hf808 :  // <0112> pop rtna // rtn
addr == 16'had ? 16'h1408 :  // <0112> pop y // "
addr == 16'hae ? 16'h1008 :  // <0112> pop x // "
addr == 16'haf ? 16'h0c08 :  // <0112> pop j // "
addr == 16'hb0 ? 16'h0808 :  // <0112> pop i // "
addr == 16'hb1 ? 16'hfc00 :  // <0112> swapra = nop
// :fail // = 0x00b2
addr == 16'hb2 ? 16'h0760 :  // <0114> b = -1
addr == 16'hb3 ? 16'hf808 :  // <0115> pop rtna // end_func
addr == 16'hb4 ? 16'h1408 :  // <0115> pop y // "
addr == 16'hb5 ? 16'h1008 :  // <0115> pop x // "
addr == 16'hb6 ? 16'h0c08 :  // <0115> pop j // "
addr == 16'hb7 ? 16'h0808 :  // <0115> pop i // "
addr == 16'hb8 ? 16'hfc00 :  // <0115> swapra = nop

// print a fixed-length string from packed words in program space.
// pass its word address (not its byte address) in a,  its length (bytes) in b.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_fixed // = 0x00b9
addr == 16'hb9 ? 16'h2002 :  // <0121> push i // func print_fixed
addr == 16'hba ? 16'h2003 :  // <0121> push j // "
addr == 16'hbb ? 16'h2004 :  // <0121> push x // "
addr == 16'hbc ? 16'h2005 :  // <0121> push y // "
addr == 16'hbd ? 16'h2006 :  // <0121> push g6 // "
addr == 16'hbe ? 16'h203e :  // <0121> push rtna // "
addr == 16'hbf ? 16'h0800 :  // <0122> i = a
addr == 16'hc0 ? 16'h0e01 :  // <0123> j = 1
addr == 16'hc1 ? 16'h1001 :  // <0124> x = b
addr == 16'hc2 ? 16'h1760 :  // <0125> y = -1
// :next_word // = 0x00c3
addr == 16'hc3 ? 16'he002 :  // <0127> br xz :done
addr == 16'hc4 ? 16'h00d7 :  // <0127> "
addr == 16'hc5 ? 16'h1320 :  // <0128> x = ad2
addr == 16'hc6 ? 16'hd002 :  // <0129> fetch g6 from i
addr == 16'hc7 ? 16'h1bb0 :  // <0129> "
// now x = bytes remaining, i = current word address, g6 = data word.
addr == 16'hc8 ? 16'h0006 :  // <0131> a = g6 // putchar g6

addr == 16'hc9 ? 16'hfa04 :  // <0131> rtna = 4
addr == 16'hca ? 16'hfc00 :  // <0131> swapra = nop

addr == 16'hcb ? 16'he002 :  // <0132> br xz :done
addr == 16'hcc ? 16'h00d7 :  // <0132> "
addr == 16'hcd ? 16'h1320 :  // <0133> x = ad2
addr == 16'hce ? 16'h0006 :  // <0134> a = g6
addr == 16'hcf ? 16'h0353 :  // <0135> a = a>>4
addr == 16'hd0 ? 16'h0353 :  // <0136> a = a>>4

addr == 16'hd1 ? 16'hfa04 :  // <0137> rtna = 4
addr == 16'hd2 ? 16'hfc00 :  // <0137> swapra = nop

addr == 16'hd3 ? 16'hc800 :  // <0138> i = i+j
addr == 16'hd4 ? 16'h0b10 :  // <0138> "
addr == 16'hd5 ? 16'he00f :  // <0139> jmp :next_word
addr == 16'hd6 ? 16'h00c3 :  // <0139> "
// :done // = 0x00d7
addr == 16'hd7 ? 16'hf808 :  // <0141> pop rtna // end_func
addr == 16'hd8 ? 16'h1808 :  // <0141> pop g6 // "
addr == 16'hd9 ? 16'h1408 :  // <0141> pop y // "
addr == 16'hda ? 16'h1008 :  // <0141> pop x // "
addr == 16'hdb ? 16'h0c08 :  // <0141> pop j // "
addr == 16'hdc ? 16'h0808 :  // <0141> pop i // "
addr == 16'hdd ? 16'hfc00 :  // <0141> swapra = nop

// print a null-terminated string from packed words in program space.
// pass its word address (not its byte address) in a.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_nt // = 0x00de
addr == 16'hde ? 16'h2002 :  // <0147> push i // func print_nt
addr == 16'hdf ? 16'h2003 :  // <0147> push j // "
addr == 16'he0 ? 16'h2004 :  // <0147> push x // "
addr == 16'he1 ? 16'h203e :  // <0147> push rtna // "
addr == 16'he2 ? 16'h0800 :  // <0148> i = a
addr == 16'he3 ? 16'h0e01 :  // <0149> j = 1
// :next_word // = 0x00e4
addr == 16'he4 ? 16'hd002 :  // <0151> fetch x from i
addr == 16'he5 ? 16'h13b0 :  // <0151> "
// now i = current word address, x = data word, b = low byte mask, a = data byte.
addr == 16'he6 ? 16'h0004 :  // <0153> a = x
addr == 16'he7 ? 16'h06ff :  // <0154> b = 0xff
addr == 16'he8 ? 16'he003 :  // <0155> br and0z :done
addr == 16'he9 ? 16'h00f8 :  // <0155> "

addr == 16'hea ? 16'hfa04 :  // <0156> rtna = 4
addr == 16'heb ? 16'hfc00 :  // <0156> swapra = nop

addr == 16'hec ? 16'h0004 :  // <0157> a = x
addr == 16'hed ? 16'h0353 :  // <0158> a = a>>4
addr == 16'hee ? 16'h0353 :  // <0159> a = a>>4
addr == 16'hef ? 16'h06ff :  // <0160> b = 0xff
addr == 16'hf0 ? 16'he003 :  // <0161> br and0z :done
addr == 16'hf1 ? 16'h00f8 :  // <0161> "

addr == 16'hf2 ? 16'hfa04 :  // <0162> rtna = 4
addr == 16'hf3 ? 16'hfc00 :  // <0162> swapra = nop

addr == 16'hf4 ? 16'hc800 :  // <0163> i = i+j
addr == 16'hf5 ? 16'h0b10 :  // <0163> "
addr == 16'hf6 ? 16'he00f :  // <0164> jmp :next_word
addr == 16'hf7 ? 16'h00e4 :  // <0164> "
// :done // = 0x00f8
addr == 16'hf8 ? 16'hf808 :  // <0166> pop rtna // end_func
addr == 16'hf9 ? 16'h1008 :  // <0166> pop x // "
addr == 16'hfa ? 16'h0c08 :  // <0166> pop j // "
addr == 16'hfb ? 16'h0808 :  // <0166> pop i // "
addr == 16'hfc ? 16'hfc00 :  // <0166> swapra = nop




// ######## func fletcher16_init // = 0x00fd
addr == 16'hfd ? 16'h1a00 :  // <0005> $fletcher_sum1_reg = 0
addr == 16'hfe ? 16'h1e00 :  // <0006> $fletcher_sum2_reg = 0
addr == 16'hff ? 16'hfc00 :  // <0007> swapra = nop

// compute the modulus(255) of a number given in a.  return remainder in a.
// ######## func mod255 // = 0x0100
// while a is greater than 254, subtract 255.
// :mod255_again // = 0x0100
addr == 16'h100 ? 16'h06fe :  // <0013> b = 0xfe
addr == 16'h101 ? 16'he006 :  // <0014> br gt :mod255_greater
addr == 16'h102 ? 16'h0104 :  // <0014> "
addr == 16'h103 ? 16'hfc00 :  // <0015> swapra = nop
// :mod255_greater // = 0x0104
addr == 16'h104 ? 16'h07a0 :  // <0017> b = 0xff01
addr == 16'h105 ? 16'hff01 :  // <0017> "
addr == 16'h106 ? 16'hc800 :  // <0018> a = a+b
addr == 16'h107 ? 16'h0300 :  // <0018> "
addr == 16'h108 ? 16'he00f :  // <0019> jmp :mod255_again
addr == 16'h109 ? 16'h0100 :  // <0019> "
addr == 16'h10a ? 16'hfc00 :  // <0020> swapra = nop

// accumulate a Fletcher16 checksum, given the next byte of data in a.
// ######## func fletcher16_input8 // = 0x010b
addr == 16'h10b ? 16'h203e :  // <0023> push rtna // func fletcher16_input8
addr == 16'h10c ? 16'h0406 :  // <0024> b = $fletcher_sum1_reg
addr == 16'h10d ? 16'hc800 :  // <0025> a = a+b
addr == 16'h10e ? 16'h0300 :  // <0025> "

addr == 16'h10f ? 16'hfba0 :  // <0026> rtna = 256
addr == 16'h110 ? 16'h0100 :  // <0026> "
addr == 16'h111 ? 16'hfc00 :  // <0026> swapra = nop

addr == 16'h112 ? 16'h1800 :  // <0027> $fletcher_sum1_reg = a

addr == 16'h113 ? 16'h0407 :  // <0029> b = $fletcher_sum2_reg
addr == 16'h114 ? 16'hc800 :  // <0030> a = a+b
addr == 16'h115 ? 16'h0300 :  // <0030> "

addr == 16'h116 ? 16'hfba0 :  // <0031> rtna = 256
addr == 16'h117 ? 16'h0100 :  // <0031> "
addr == 16'h118 ? 16'hfc00 :  // <0031> swapra = nop

addr == 16'h119 ? 16'h1c00 :  // <0032> $fletcher_sum2_reg = a
addr == 16'h11a ? 16'hf808 :  // <0033> pop rtna // end_func
addr == 16'h11b ? 16'hfc00 :  // <0033> swapra = nop

// accumulate a Fletcher16 checksum, given the next word of data in a.
// ######## func fletcher16_input16 // = 0x011c
addr == 16'h11c ? 16'h2002 :  // <0036> push i // func fletcher16_input16
addr == 16'h11d ? 16'h203e :  // <0036> push rtna // "
addr == 16'h11e ? 16'h0b53 :  // <0037> i = a>>4
addr == 16'h11f ? 16'h06ff :  // <0038> b = 0xff
addr == 16'h120 ? 16'hc800 :  // <0039> a = and
addr == 16'h121 ? 16'h0330 :  // <0039> "

addr == 16'h122 ? 16'hfba0 :  // <0040> rtna = 267
addr == 16'h123 ? 16'h010b :  // <0040> "
addr == 16'h124 ? 16'hfc00 :  // <0040> swapra = nop

addr == 16'h125 ? 16'h0002 :  // <0041> a = i
addr == 16'h126 ? 16'h0353 :  // <0042> a = a>>4

addr == 16'h127 ? 16'hfba0 :  // <0043> rtna = 267
addr == 16'h128 ? 16'h010b :  // <0043> "
addr == 16'h129 ? 16'hfc00 :  // <0043> swapra = nop

addr == 16'h12a ? 16'hf808 :  // <0044> pop rtna // end_func
addr == 16'h12b ? 16'h0808 :  // <0044> pop i // "
addr == 16'h12c ? 16'hfc00 :  // <0044> swapra = nop

// return the combined 16-bit result of Fletcher16 checksum in a.
// ######## func fletcher16_result // = 0x012d
addr == 16'h12d ? 16'h0007 :  // <0048> a = $fletcher_sum2_reg
addr == 16'h12e ? 16'h0352 :  // <0049> a = a<<4
addr == 16'h12f ? 16'h0352 :  // <0050> a = a<<4
addr == 16'h130 ? 16'h0406 :  // <0051> b = $fletcher_sum1_reg
addr == 16'h131 ? 16'hc800 :  // <0052> a = or
addr == 16'h132 ? 16'h0334 :  // <0052> "
addr == 16'h133 ? 16'hfc00 :  // <0053> swapra = nop




// :boot_msg // = 0x0134
// "\r\nVISOR\x0"
addr == 16'h134 ? 16'h0a0d :  // <0090>   
addr == 16'h135 ? 16'h4956 :  // <0090> IV
addr == 16'h136 ? 16'h4f53 :  // <0090> OS
addr == 16'h137 ? 16'h0052 :  // <0090>  R
// :running_msg // = 0x0138
// "\r\nRUN >\x0"
addr == 16'h138 ? 16'h0a0d :  // <0092>   
addr == 16'h139 ? 16'h5552 :  // <0092> UR
addr == 16'h13a ? 16'h204e :  // <0092>  N
addr == 16'h13b ? 16'h003e :  // <0092>  >

// ////////////////////////////////////////////
// :main // = 0x013c
// put target into reset.
addr == 16'h13c ? 16'h3e02 :  // <0097> bus_ctrl = $tg_reset_mask

// init visor.
addr == 16'h13d ? 16'h3360 :  // <0100> bp3_addr = $bp_disable
addr == 16'h13e ? 16'h2f60 :  // <0101> bp2_addr = $bp_disable
addr == 16'h13f ? 16'h2b60 :  // <0102> bp1_addr = $bp_disable
addr == 16'h140 ? 16'h2760 :  // <0103> bp0_addr = $bp_disable

// startup message
addr == 16'h141 ? 16'h03a0 :  // <0106> a = :boot_msg
addr == 16'h142 ? 16'h0134 :  // <0106> "

addr == 16'h143 ? 16'hfade :  // <0107> rtna = 222
addr == 16'h144 ? 16'hfc00 :  // <0107> swapra = nop


// check for bootloader signal.
addr == 16'h145 ? 16'h0019 :  // <0110> a = boot_break
addr == 16'h146 ? 16'he400 :  // <0111> bn az :boot_run
addr == 16'h147 ? 16'h0149 :  // <0111> "
// ^^^ for press-to-debug; runs target by default.
// br az :boot_run
// ^^^ for press-to-run; debugs target by default.

// step into the first target instruction.
addr == 16'h148 ? 16'h3e08 :  // <0117> bus_ctrl = $bp_step_mask

addr == 16'h149 ? 16'hfba0 :  // <0118> rtna = 635
addr == 16'h14a ? 16'h027b :  // <0118> "
addr == 16'h14b ? 16'hfc00 :  // <0118> swapra = nop

addr == 16'h14c ? 16'he00f :  // <0119> jmp :cmd_loop
addr == 16'h14d ? 16'h014a :  // <0119> "
// :boot_run // = 0x014e
// release target reset, to run.
addr == 16'h14e ? 16'h3e00 :  // <0122> bus_ctrl = 0

// command prompt loop.
// :cmd_loop // = 0x014f
addr == 16'h14f ? 16'h000f :  // <0126> a = bus_ctrl
addr == 16'h150 ? 16'h0600 :  // <0127> b = 0
addr == 16'h151 ? 16'he007 :  // <0128> br eq :running_prompt
addr == 16'h152 ? 16'h0167 :  // <0128> "


addr == 16'h153 ? 16'hfba0 :  // <0130> rtna = 787
addr == 16'h154 ? 16'h0313 :  // <0130> "
addr == 16'h155 ? 16'hfc00 :  // <0130> swapra = nop

addr == 16'h156 ? 16'h0016 :  // <0131> a = tg_code_addr

addr == 16'h157 ? 16'hfa5e :  // <0132> rtna = 94
addr == 16'h158 ? 16'hfc00 :  // <0132> swapra = nop

addr == 16'h159 ? 16'h022c :  // <0133> a = 44 // putasc ","

addr == 16'h15a ? 16'hfa04 :  // <0133> rtna = 4
addr == 16'h15b ? 16'hfc00 :  // <0133> swapra = nop

addr == 16'h15c ? 16'h0015 :  // <0134> a = exr_shadow

addr == 16'h15d ? 16'hfa5e :  // <0135> rtna = 94
addr == 16'h15e ? 16'hfc00 :  // <0135> swapra = nop

addr == 16'h15f ? 16'h0220 :  // <0136> a = 32 // putasc " "

addr == 16'h160 ? 16'hfa04 :  // <0136> rtna = 4
addr == 16'h161 ? 16'hfc00 :  // <0136> swapra = nop

addr == 16'h162 ? 16'h023e :  // <0137> a = 62 // putasc ">"

addr == 16'h163 ? 16'hfa04 :  // <0137> rtna = 4
addr == 16'h164 ? 16'hfc00 :  // <0137> swapra = nop


addr == 16'h165 ? 16'hfa13 :  // <0138> rtna = 19
addr == 16'h166 ? 16'hfc00 :  // <0138> swapra = nop

addr == 16'h167 ? 16'h2000 :  // <0138> push a // "

addr == 16'h168 ? 16'hfa04 :  // <0138> rtna = 4
addr == 16'h169 ? 16'hfc00 :  // <0138> swapra = nop

addr == 16'h16a ? 16'h0008 :  // <0138> pop a // "
addr == 16'h16b ? 16'he00f :  // <0139> jmp :parse_cmd
addr == 16'h16c ? 16'h0176 :  // <0139> "

// :running_prompt // = 0x016d
addr == 16'h16d ? 16'h03a0 :  // <0142> a = :running_msg
addr == 16'h16e ? 16'h0138 :  // <0142> "

addr == 16'h16f ? 16'hfade :  // <0143> rtna = 222
addr == 16'h170 ? 16'hfc00 :  // <0143> swapra = nop

// :run_poll // = 0x0171

addr == 16'h171 ? 16'hfa1c :  // <0145> rtna = 28
addr == 16'h172 ? 16'hfc00 :  // <0145> swapra = nop

addr == 16'h173 ? 16'h0760 :  // <0146> b = -1
addr == 16'h174 ? 16'he407 :  // <0147> bn eq :parse_cmd
addr == 16'h175 ? 16'h0176 :  // <0147> "
addr == 16'h176 ? 16'h0018 :  // <0148> a = bp_status
addr == 16'h177 ? 16'he000 :  // <0149> br az :run_poll
addr == 16'h178 ? 16'h0171 :  // <0149> "
// target hit a breakpoint; switch to stepping mode.
addr == 16'h179 ? 16'h3e08 :  // <0151> bus_ctrl = $bp_step_mask
addr == 16'h17a ? 16'he00f :  // <0152> jmp :cmd_loop
addr == 16'h17b ? 16'h014f :  // <0152> "

// :parse_cmd // = 0x017c

// command = step next instruction.
addr == 16'h17c ? 16'h066e :  // <0157> b = 110 // asc b = "n"
addr == 16'h17d ? 16'he407 :  // <0158> bn eq :skip_step
addr == 16'h17e ? 16'h017f :  // <0158> "
addr == 16'h17f ? 16'h3e08 :  // <0159> bus_ctrl = $bp_step_mask
addr == 16'h180 ? 16'h2409 :  // <0160> bp0_addr = bp0_addr

addr == 16'h181 ? 16'hfba0 :  // <0161> rtna = 635
addr == 16'h182 ? 16'h027b :  // <0161> "
addr == 16'h183 ? 16'hfc00 :  // <0161> swapra = nop

addr == 16'h184 ? 16'he00f :  // <0162> jmp :cmd_loop
addr == 16'h185 ? 16'h014f :  // <0162> "
// :skip_step // = 0x0186

// command = reset target.
addr == 16'h186 ? 16'h0652 :  // <0166> b = 82 // asc b = "R"
addr == 16'h187 ? 16'he407 :  // <0167> bn eq :skip_reset
addr == 16'h188 ? 16'h018a :  // <0167> "
addr == 16'h189 ? 16'h3e02 :  // <0168> bus_ctrl = $tg_reset_mask
addr == 16'h18a ? 16'hc800 :  // <0169> nop
addr == 16'h18b ? 16'hc800 :  // <0170> nop
addr == 16'h18c ? 16'h3e08 :  // <0171> bus_ctrl = $bp_step_mask

addr == 16'h18d ? 16'hfba0 :  // <0172> rtna = 635
addr == 16'h18e ? 16'h027b :  // <0172> "
addr == 16'h18f ? 16'hfc00 :  // <0172> swapra = nop

addr == 16'h190 ? 16'he00f :  // <0173> jmp :cmd_loop
addr == 16'h191 ? 16'h014f :  // <0173> "
// :skip_reset // = 0x0192

// command = load program.
addr == 16'h192 ? 16'h066c :  // <0177> b = 108 // asc b = "l"
addr == 16'h193 ? 16'he407 :  // <0178> bn eq :skip_load
addr == 16'h194 ? 16'h0191 :  // <0178> "

addr == 16'h195 ? 16'hfba0 :  // <0179> rtna = 881
addr == 16'h196 ? 16'h0371 :  // <0179> "
addr == 16'h197 ? 16'hfc00 :  // <0179> swapra = nop

addr == 16'h198 ? 16'he00f :  // <0180> jmp :cmd_loop
addr == 16'h199 ? 16'h014f :  // <0180> "
// :skip_load // = 0x019a

// command = run full speed.
addr == 16'h19a ? 16'h0672 :  // <0184> b = 114 // asc b = "r"
addr == 16'h19b ? 16'he407 :  // <0185> bn eq :skip_run
addr == 16'h19c ? 16'h0198 :  // <0185> "
// release target reset, to run.
addr == 16'h19d ? 16'h3e00 :  // <0187> bus_ctrl = 0
addr == 16'h19e ? 16'h2409 :  // <0188> bp0_addr = bp0_addr
addr == 16'h19f ? 16'he00f :  // <0189> jmp :cmd_loop
addr == 16'h1a0 ? 16'h014f :  // <0189> "
// :skip_run // = 0x01a1

// command = set breakpoint.
addr == 16'h1a1 ? 16'h0662 :  // <0193> b = 98 // asc b = "b"
addr == 16'h1a2 ? 16'he407 :  // <0194> bn eq :skip_setbrk
addr == 16'h1a3 ? 16'h019f :  // <0194> "

addr == 16'h1a4 ? 16'hfba0 :  // <0195> rtna = 639
addr == 16'h1a5 ? 16'h027f :  // <0195> "
addr == 16'h1a6 ? 16'hfc00 :  // <0195> swapra = nop

addr == 16'h1a7 ? 16'he00f :  // <0196> jmp :cmd_loop
addr == 16'h1a8 ? 16'h014f :  // <0196> "
// :skip_setbrk // = 0x01a9

// command = poke register.
addr == 16'h1a9 ? 16'h066f :  // <0200> b = 111 // asc b = "o"
addr == 16'h1aa ? 16'he407 :  // <0201> bn eq :skip_poke
addr == 16'h1ab ? 16'h01a6 :  // <0201> "

addr == 16'h1ac ? 16'hfba0 :  // <0202> rtna = 710
addr == 16'h1ad ? 16'h02c6 :  // <0202> "
addr == 16'h1ae ? 16'hfc00 :  // <0202> swapra = nop

addr == 16'h1af ? 16'he00f :  // <0203> jmp :cmd_loop
addr == 16'h1b0 ? 16'h014f :  // <0203> "
// :skip_poke // = 0x01b1

// command = dump Avalon data e.g. from SDRAM.
addr == 16'h1b1 ? 16'h0675 :  // <0207> b = 117 // asc b = "u"
addr == 16'h1b2 ? 16'he407 :  // <0208> bn eq :skip_dump
addr == 16'h1b3 ? 16'h01ad :  // <0208> "

addr == 16'h1b4 ? 16'hfba0 :  // <0209> rtna = 438
addr == 16'h1b5 ? 16'h01b6 :  // <0209> "
addr == 16'h1b6 ? 16'hfc00 :  // <0209> swapra = nop

addr == 16'h1b7 ? 16'he00f :  // <0210> jmp :cmd_loop
addr == 16'h1b8 ? 16'h014f :  // <0210> "
// :skip_dump // = 0x01b9

addr == 16'h1b9 ? 16'h023f :  // <0213> a = 63 // putasc "?"

addr == 16'h1ba ? 16'hfa04 :  // <0213> rtna = 4
addr == 16'h1bb ? 16'hfc00 :  // <0213> swapra = nop

addr == 16'h1bc ? 16'h03a0 :  // <0214> a = :eol_msg // puteol
addr == 16'h1bd ? 16'h0002 :  // <0214> "

addr == 16'h1be ? 16'hfade :  // <0214> rtna = 222
addr == 16'h1bf ? 16'hfc00 :  // <0214> swapra = nop

addr == 16'h1c0 ? 16'he00f :  // <0215> jmp :cmd_loop
addr == 16'h1c1 ? 16'h014f :  // <0215> "


// ######## func dump_avalon // = 0x01c2
addr == 16'h1c2 ? 16'h2002 :  // <0244> push i // func dump_avalon
addr == 16'h1c3 ? 16'h2003 :  // <0244> push j // "
addr == 16'h1c4 ? 16'h2004 :  // <0244> push x // "
addr == 16'h1c5 ? 16'h2005 :  // <0244> push y // "
addr == 16'h1c6 ? 16'h2006 :  // <0244> push g6 // "
addr == 16'h1c7 ? 16'h2007 :  // <0244> push g7 // "
addr == 16'h1c8 ? 16'h203e :  // <0244> push rtna // "
// test case: u0010 0011 0013 0012 0000 0000 0080.

// this func may borrow some peripheral registers to hold temporary data.
// but it can only borrow registers that don't have side effects that are relevant to this function.

// parse av_write_data reg address into av_data_regs high byte.

addr == 16'h1c9 ? 16'hfa8f :  // <0253> rtna = 143
addr == 16'h1ca ? 16'hfc00 :  // <0253> swapra = nop

addr == 16'h1cb ? 16'h0801 :  // <0254> i = b
addr == 16'h1cc ? 16'he401 :  // <0255> bn iz :fail
addr == 16'h1cd ? 16'h0258 :  // <0255> "
addr == 16'h1ce ? 16'h0352 :  // <0256> a = a<<4
addr == 16'h1cf ? 16'h1b52 :  // <0257> $av_data_regs = a<<4

addr == 16'h1d0 ? 16'hfa13 :  // <0258> rtna = 19
addr == 16'h1d1 ? 16'hfc00 :  // <0258> swapra = nop

addr == 16'h1d2 ? 16'h2000 :  // <0258> push a // "

addr == 16'h1d3 ? 16'hfa04 :  // <0258> rtna = 4
addr == 16'h1d4 ? 16'hfc00 :  // <0258> swapra = nop

addr == 16'h1d5 ? 16'h0008 :  // <0258> pop a // "

// parse av_read_data reg address into av_data_regs low byte.

addr == 16'h1d6 ? 16'hfa8f :  // <0261> rtna = 143
addr == 16'h1d7 ? 16'hfc00 :  // <0261> swapra = nop

addr == 16'h1d8 ? 16'h0801 :  // <0262> i = b
addr == 16'h1d9 ? 16'he401 :  // <0263> bn iz :fail
addr == 16'h1da ? 16'h0258 :  // <0263> "
addr == 16'h1db ? 16'h0406 :  // <0264> b = $av_data_regs
addr == 16'h1dc ? 16'hc800 :  // <0265> $av_data_regs = or
addr == 16'h1dd ? 16'h1b34 :  // <0265> "

addr == 16'h1de ? 16'hfa13 :  // <0266> rtna = 19
addr == 16'h1df ? 16'hfc00 :  // <0266> swapra = nop

addr == 16'h1e0 ? 16'h2000 :  // <0266> push a // "

addr == 16'h1e1 ? 16'hfa04 :  // <0266> rtna = 4
addr == 16'h1e2 ? 16'hfc00 :  // <0266> swapra = nop

addr == 16'h1e3 ? 16'h0008 :  // <0266> pop a // "

// parse av_ad_lo reg address into av_ad_lo_reg.

addr == 16'h1e4 ? 16'hfa8f :  // <0269> rtna = 143
addr == 16'h1e5 ? 16'hfc00 :  // <0269> swapra = nop

addr == 16'h1e6 ? 16'h0801 :  // <0270> i = b
addr == 16'h1e7 ? 16'he401 :  // <0271> bn iz :fail
addr == 16'h1e8 ? 16'h0258 :  // <0271> "
addr == 16'h1e9 ? 16'h1c00 :  // <0272> $av_ad_lo_reg = a

addr == 16'h1ea ? 16'hfa13 :  // <0273> rtna = 19
addr == 16'h1eb ? 16'hfc00 :  // <0273> swapra = nop

addr == 16'h1ec ? 16'h2000 :  // <0273> push a // "

addr == 16'h1ed ? 16'hfa04 :  // <0273> rtna = 4
addr == 16'h1ee ? 16'hfc00 :  // <0273> swapra = nop

addr == 16'h1ef ? 16'h0008 :  // <0273> pop a // "

// parse av_ad_hi reg address into x.

addr == 16'h1f0 ? 16'hfa8f :  // <0276> rtna = 143
addr == 16'h1f1 ? 16'hfc00 :  // <0276> swapra = nop

addr == 16'h1f2 ? 16'h0801 :  // <0277> i = b
addr == 16'h1f3 ? 16'he401 :  // <0278> bn iz :fail
addr == 16'h1f4 ? 16'h0258 :  // <0278> "
addr == 16'h1f5 ? 16'h1000 :  // <0279> x = a

addr == 16'h1f6 ? 16'hfa13 :  // <0280> rtna = 19
addr == 16'h1f7 ? 16'hfc00 :  // <0280> swapra = nop

addr == 16'h1f8 ? 16'h2000 :  // <0280> push a // "

addr == 16'h1f9 ? 16'hfa04 :  // <0280> rtna = 4
addr == 16'h1fa ? 16'hfc00 :  // <0280> swapra = nop

addr == 16'h1fb ? 16'h0008 :  // <0280> pop a // "

// parse start byte address high word into target's avalon master.

addr == 16'h1fc ? 16'hfa8f :  // <0283> rtna = 143
addr == 16'h1fd ? 16'hfc00 :  // <0283> swapra = nop

addr == 16'h1fe ? 16'h0801 :  // <0284> i = b
addr == 16'h1ff ? 16'he401 :  // <0285> bn iz :fail
addr == 16'h200 ? 16'h0258 :  // <0285> "
addr == 16'h201 ? 16'h3800 :  // <0286> poke_data = a
addr == 16'h202 ? 16'h0004 :  // <0287> a = x

addr == 16'h203 ? 16'hfba0 :  // <0288> rtna = 758
addr == 16'h204 ? 16'h02f6 :  // <0288> "
addr == 16'h205 ? 16'hfc00 :  // <0288> swapra = nop


addr == 16'h206 ? 16'hfa13 :  // <0289> rtna = 19
addr == 16'h207 ? 16'hfc00 :  // <0289> swapra = nop

addr == 16'h208 ? 16'h2000 :  // <0289> push a // "

addr == 16'h209 ? 16'hfa04 :  // <0289> rtna = 4
addr == 16'h20a ? 16'hfc00 :  // <0289> swapra = nop

addr == 16'h20b ? 16'h0008 :  // <0289> pop a // "

// parse start byte address low word into target's avalon master.

addr == 16'h20c ? 16'hfa8f :  // <0292> rtna = 143
addr == 16'h20d ? 16'hfc00 :  // <0292> swapra = nop

addr == 16'h20e ? 16'h0801 :  // <0293> i = b
addr == 16'h20f ? 16'he401 :  // <0294> bn iz :fail
addr == 16'h210 ? 16'h0258 :  // <0294> "
addr == 16'h211 ? 16'h3800 :  // <0295> poke_data = a
addr == 16'h212 ? 16'h0007 :  // <0296> a = $av_ad_lo_reg

addr == 16'h213 ? 16'hfba0 :  // <0297> rtna = 758
addr == 16'h214 ? 16'h02f6 :  // <0297> "
addr == 16'h215 ? 16'hfc00 :  // <0297> swapra = nop


addr == 16'h216 ? 16'hfa13 :  // <0298> rtna = 19
addr == 16'h217 ? 16'hfc00 :  // <0298> swapra = nop

addr == 16'h218 ? 16'h2000 :  // <0298> push a // "

addr == 16'h219 ? 16'hfa04 :  // <0298> rtna = 4
addr == 16'h21a ? 16'hfc00 :  // <0298> swapra = nop

addr == 16'h21b ? 16'h0008 :  // <0298> pop a // "

// parse length (in bytes) into i.

addr == 16'h21c ? 16'hfa8f :  // <0301> rtna = 143
addr == 16'h21d ? 16'hfc00 :  // <0301> swapra = nop

addr == 16'h21e ? 16'h1001 :  // <0302> x = b
addr == 16'h21f ? 16'he402 :  // <0303> bn xz :fail
addr == 16'h220 ? 16'h0258 :  // <0303> "
addr == 16'h221 ? 16'h0b50 :  // <0304> i = a>>1
addr == 16'h222 ? 16'he001 :  // <0305> br iz :fail
addr == 16'h223 ? 16'h0258 :  // <0305> "


addr == 16'h224 ? 16'hfa13 :  // <0307> rtna = 19
addr == 16'h225 ? 16'hfc00 :  // <0307> swapra = nop

addr == 16'h226 ? 16'h2000 :  // <0307> push a // "

addr == 16'h227 ? 16'hfa04 :  // <0307> rtna = 4
addr == 16'h228 ? 16'hfc00 :  // <0307> swapra = nop

addr == 16'h229 ? 16'h0008 :  // <0307> pop a // "
addr == 16'h22a ? 16'h062e :  // <0308> b = 46 // asc b = "."
addr == 16'h22b ? 16'he407 :  // <0309> bn eq :fail
addr == 16'h22c ? 16'h0258 :  // <0309> "

// :next_row // = 0x022d
// print row header.
addr == 16'h22d ? 16'h03a0 :  // <0313> a = :eol_msg // puteol
addr == 16'h22e ? 16'h0002 :  // <0313> "

addr == 16'h22f ? 16'hfade :  // <0313> rtna = 222
addr == 16'h230 ? 16'hfc00 :  // <0313> swapra = nop

addr == 16'h231 ? 16'h0007 :  // <0314> a = $av_ad_lo_reg

addr == 16'h232 ? 16'hfba0 :  // <0315> rtna = 774
addr == 16'h233 ? 16'h0306 :  // <0315> "
addr == 16'h234 ? 16'hfc00 :  // <0315> swapra = nop

addr == 16'h235 ? 16'h0017 :  // <0316> a = peek_data

addr == 16'h236 ? 16'hfa5e :  // <0317> rtna = 94
addr == 16'h237 ? 16'hfc00 :  // <0317> swapra = nop

addr == 16'h238 ? 16'h023a :  // <0318> a = 58 // putasc ":"

addr == 16'h239 ? 16'hfa04 :  // <0318> rtna = 4
addr == 16'h23a ? 16'hfc00 :  // <0318> swapra = nop


// print 8 data words.
addr == 16'h23b ? 16'h1208 :  // <0321> x = 8
// :next_word // = 0x023c
// print data word from target's avalon master.
addr == 16'h23c ? 16'h0220 :  // <0324> a = 32 // putasc " "

addr == 16'h23d ? 16'hfa04 :  // <0324> rtna = 4
addr == 16'h23e ? 16'hfc00 :  // <0324> swapra = nop

addr == 16'h23f ? 16'h0006 :  // <0325> a = $av_data_regs

addr == 16'h240 ? 16'hfba0 :  // <0326> rtna = 615
addr == 16'h241 ? 16'h0267 :  // <0326> "
addr == 16'h242 ? 16'hfc00 :  // <0326> swapra = nop

addr == 16'h243 ? 16'h0017 :  // <0327> a = peek_data

addr == 16'h244 ? 16'hfa5e :  // <0328> rtna = 94
addr == 16'h245 ? 16'hfc00 :  // <0328> swapra = nop


// increment target's av_ad_lo.
addr == 16'h246 ? 16'h0007 :  // <0331> a = $av_ad_lo_reg

addr == 16'h247 ? 16'hfba0 :  // <0332> rtna = 774
addr == 16'h248 ? 16'h0306 :  // <0332> "
addr == 16'h249 ? 16'hfc00 :  // <0332> swapra = nop

addr == 16'h24a ? 16'h0017 :  // <0333> a = peek_data
addr == 16'h24b ? 16'h0602 :  // <0334> b = 2
addr == 16'h24c ? 16'hc800 :  // <0335> poke_data = a+b
addr == 16'h24d ? 16'h3b00 :  // <0335> "
addr == 16'h24e ? 16'h0007 :  // <0336> a = $av_ad_lo_reg

addr == 16'h24f ? 16'hfba0 :  // <0337> rtna = 758
addr == 16'h250 ? 16'h02f6 :  // <0337> "
addr == 16'h251 ? 16'hfc00 :  // <0337> swapra = nop


// check if all words have been dumped.
addr == 16'h252 ? 16'h0f60 :  // <0340> j = -1
addr == 16'h253 ? 16'hc800 :  // <0341> i = i+j
addr == 16'h254 ? 16'h0b10 :  // <0341> "
addr == 16'h255 ? 16'he001 :  // <0342> br iz :done
addr == 16'h256 ? 16'h024c :  // <0342> "

// check for end of row.
addr == 16'h257 ? 16'h1760 :  // <0345> y = -1
addr == 16'h258 ? 16'hc800 :  // <0346> x = x+y
addr == 16'h259 ? 16'h1320 :  // <0346> "
addr == 16'h25a ? 16'he402 :  // <0347> bn xz :next_word
addr == 16'h25b ? 16'h023c :  // <0347> "
addr == 16'h25c ? 16'he00f :  // <0348> jmp :next_row
addr == 16'h25d ? 16'h022d :  // <0348> "

// :done // = 0x025e
addr == 16'h25e ? 16'h03a0 :  // <0351> a = :eol_msg // puteol
addr == 16'h25f ? 16'h0002 :  // <0351> "

addr == 16'h260 ? 16'hfade :  // <0351> rtna = 222
addr == 16'h261 ? 16'hfc00 :  // <0351> swapra = nop

addr == 16'h262 ? 16'hf808 :  // <0352> pop rtna // rtn
addr == 16'h263 ? 16'h1c08 :  // <0352> pop g7 // "
addr == 16'h264 ? 16'h1808 :  // <0352> pop g6 // "
addr == 16'h265 ? 16'h1408 :  // <0352> pop y // "
addr == 16'h266 ? 16'h1008 :  // <0352> pop x // "
addr == 16'h267 ? 16'h0c08 :  // <0352> pop j // "
addr == 16'h268 ? 16'h0808 :  // <0352> pop i // "
addr == 16'h269 ? 16'hfc00 :  // <0352> swapra = nop

// :fail // = 0x026a
addr == 16'h26a ? 16'h023f :  // <0355> a = 63 // putasc "?"

addr == 16'h26b ? 16'hfa04 :  // <0355> rtna = 4
addr == 16'h26c ? 16'hfc00 :  // <0355> swapra = nop

addr == 16'h26d ? 16'h03a0 :  // <0356> a = :eol_msg // puteol
addr == 16'h26e ? 16'h0002 :  // <0356> "

addr == 16'h26f ? 16'hfade :  // <0356> rtna = 222
addr == 16'h270 ? 16'hfc00 :  // <0356> swapra = nop

addr == 16'h271 ? 16'hf808 :  // <0357> pop rtna // end_func
addr == 16'h272 ? 16'h1c08 :  // <0357> pop g7 // "
addr == 16'h273 ? 16'h1808 :  // <0357> pop g6 // "
addr == 16'h274 ? 16'h1408 :  // <0357> pop y // "
addr == 16'h275 ? 16'h1008 :  // <0357> pop x // "
addr == 16'h276 ? 16'h0c08 :  // <0357> pop j // "
addr == 16'h277 ? 16'h0808 :  // <0357> pop i // "
addr == 16'h278 ? 16'hfc00 :  // <0357> swapra = nop

// trigger a read in the target's avalon master.  return the data in peek_data.
// the 32-bit avalon address must already be poked into the target's avalon master.
// pass av_data_regs in a.  av_write_data reg address in its high byte; av_read_data reg address in its low byte.
// ######## func peek_avalon // = 0x0279
addr == 16'h279 ? 16'h203e :  // <0362> push rtna // func peek_avalon
// peek the target's av_write_data register to trigger an avalon read as a side effect.
addr == 16'h27a ? 16'h2000 :  // <0364> push a // push a
addr == 16'h27b ? 16'h0353 :  // <0365> a = a>>4
addr == 16'h27c ? 16'h0353 :  // <0366> a = a>>4

addr == 16'h27d ? 16'hfba0 :  // <0367> rtna = 774
addr == 16'h27e ? 16'h0306 :  // <0367> "
addr == 16'h27f ? 16'hfc00 :  // <0367> swapra = nop


// wait for target's avalon master to receive data e.g. from SDRAM controller.
addr == 16'h280 ? 16'h020f :  // <0370> a = 15
addr == 16'h281 ? 16'h0760 :  // <0371> b = -1
// :wait // = 0x0282
addr == 16'h282 ? 16'hc800 :  // <0373> a = a+b
addr == 16'h283 ? 16'h0300 :  // <0373> "
addr == 16'h284 ? 16'he400 :  // <0374> bn az :wait
addr == 16'h285 ? 16'h0282 :  // <0374> "

// peek data word from target's avalon master.
addr == 16'h286 ? 16'h0008 :  // <0377> pop a // pop a
addr == 16'h287 ? 16'h06ff :  // <0378> b = 0xff
addr == 16'h288 ? 16'hc800 :  // <0379> a = and
addr == 16'h289 ? 16'h0330 :  // <0379> "

addr == 16'h28a ? 16'hfba0 :  // <0380> rtna = 774
addr == 16'h28b ? 16'h0306 :  // <0380> "
addr == 16'h28c ? 16'hfc00 :  // <0380> swapra = nop

addr == 16'h28d ? 16'hf808 :  // <0381> pop rtna // end_func
addr == 16'h28e ? 16'hfc00 :  // <0381> swapra = nop

// ######## func wait_for_bp // = 0x028f
// :poll // = 0x028f
addr == 16'h28f ? 16'h0018 :  // <0385> a = bp_status
addr == 16'h290 ? 16'he000 :  // <0386> br az :poll
addr == 16'h291 ? 16'h028f :  // <0386> "
addr == 16'h292 ? 16'hfc00 :  // <0387> swapra = nop

// ######## func set_bp // = 0x0293
addr == 16'h293 ? 16'h2004 :  // <0389> push x // func set_bp
addr == 16'h294 ? 16'h2005 :  // <0389> push y // "
addr == 16'h295 ? 16'h203e :  // <0389> push rtna // "

addr == 16'h296 ? 16'hfa13 :  // <0390> rtna = 19
addr == 16'h297 ? 16'hfc00 :  // <0390> swapra = nop

addr == 16'h298 ? 16'h2000 :  // <0390> push a // "

addr == 16'h299 ? 16'hfa04 :  // <0390> rtna = 4
addr == 16'h29a ? 16'hfc00 :  // <0390> swapra = nop

addr == 16'h29b ? 16'h0008 :  // <0390> pop a // "
addr == 16'h29c ? 16'h1000 :  // <0391> x = a

addr == 16'h29d ? 16'hfa13 :  // <0392> rtna = 19
addr == 16'h29e ? 16'hfc00 :  // <0392> swapra = nop

addr == 16'h29f ? 16'h2000 :  // <0392> push a // "

addr == 16'h2a0 ? 16'hfa04 :  // <0392> rtna = 4
addr == 16'h2a1 ? 16'hfc00 :  // <0392> swapra = nop

addr == 16'h2a2 ? 16'h0008 :  // <0392> pop a // "
addr == 16'h2a3 ? 16'h063d :  // <0393> b = 61 // asc b = "="
addr == 16'h2a4 ? 16'he407 :  // <0394> bn eq :fail
addr == 16'h2a5 ? 16'h02bb :  // <0394> "

addr == 16'h2a6 ? 16'hfa8f :  // <0395> rtna = 143
addr == 16'h2a7 ? 16'hfc00 :  // <0395> swapra = nop

addr == 16'h2a8 ? 16'h1400 :  // <0396> y = a
addr == 16'h2a9 ? 16'h0200 :  // <0397> a = 0
addr == 16'h2aa ? 16'he407 :  // <0398> bn eq :fail
addr == 16'h2ab ? 16'h02bb :  // <0398> "
addr == 16'h2ac ? 16'h0004 :  // <0399> a = x
addr == 16'h2ad ? 16'h0630 :  // <0400> b = 48 // asc b = "0"
addr == 16'h2ae ? 16'he007 :  // <0401> br eq :b0
addr == 16'h2af ? 16'h02a7 :  // <0401> "
addr == 16'h2b0 ? 16'h0631 :  // <0402> b = 49 // asc b = "1"
addr == 16'h2b1 ? 16'he007 :  // <0403> br eq :b1
addr == 16'h2b2 ? 16'h02ac :  // <0403> "
addr == 16'h2b3 ? 16'h0632 :  // <0404> b = 50 // asc b = "2"
addr == 16'h2b4 ? 16'he007 :  // <0405> br eq :b2
addr == 16'h2b5 ? 16'h02b1 :  // <0405> "
addr == 16'h2b6 ? 16'h0633 :  // <0406> b = 51 // asc b = "3"
addr == 16'h2b7 ? 16'he007 :  // <0407> br eq :b3
addr == 16'h2b8 ? 16'h02b6 :  // <0407> "
addr == 16'h2b9 ? 16'he00f :  // <0408> jmp :fail
addr == 16'h2ba ? 16'h02bb :  // <0408> "
// :b0 // = 0x02bb
addr == 16'h2bb ? 16'h2405 :  // <0410> bp0_addr = y
addr == 16'h2bc ? 16'hf808 :  // <0411> pop rtna // rtn
addr == 16'h2bd ? 16'h1408 :  // <0411> pop y // "
addr == 16'h2be ? 16'h1008 :  // <0411> pop x // "
addr == 16'h2bf ? 16'hfc00 :  // <0411> swapra = nop
// :b1 // = 0x02c0
addr == 16'h2c0 ? 16'h2805 :  // <0413> bp1_addr = y
addr == 16'h2c1 ? 16'hf808 :  // <0414> pop rtna // rtn
addr == 16'h2c2 ? 16'h1408 :  // <0414> pop y // "
addr == 16'h2c3 ? 16'h1008 :  // <0414> pop x // "
addr == 16'h2c4 ? 16'hfc00 :  // <0414> swapra = nop
// :b2 // = 0x02c5
addr == 16'h2c5 ? 16'h2c05 :  // <0416> bp2_addr = y
addr == 16'h2c6 ? 16'hf808 :  // <0417> pop rtna // rtn
addr == 16'h2c7 ? 16'h1408 :  // <0417> pop y // "
addr == 16'h2c8 ? 16'h1008 :  // <0417> pop x // "
addr == 16'h2c9 ? 16'hfc00 :  // <0417> swapra = nop
// :b3 // = 0x02ca
addr == 16'h2ca ? 16'h3005 :  // <0419> bp3_addr = y
addr == 16'h2cb ? 16'hf808 :  // <0420> pop rtna // rtn
addr == 16'h2cc ? 16'h1408 :  // <0420> pop y // "
addr == 16'h2cd ? 16'h1008 :  // <0420> pop x // "
addr == 16'h2ce ? 16'hfc00 :  // <0420> swapra = nop

// :fail // = 0x02cf
addr == 16'h2cf ? 16'h023f :  // <0423> a = 63 // putasc "?"

addr == 16'h2d0 ? 16'hfa04 :  // <0423> rtna = 4
addr == 16'h2d1 ? 16'hfc00 :  // <0423> swapra = nop

addr == 16'h2d2 ? 16'h03a0 :  // <0424> a = :eol_msg // puteol
addr == 16'h2d3 ? 16'h0002 :  // <0424> "

addr == 16'h2d4 ? 16'hfade :  // <0424> rtna = 222
addr == 16'h2d5 ? 16'hfc00 :  // <0424> swapra = nop

addr == 16'h2d6 ? 16'hf808 :  // <0425> pop rtna // end_func
addr == 16'h2d7 ? 16'h1408 :  // <0425> pop y // "
addr == 16'h2d8 ? 16'h1008 :  // <0425> pop x // "
addr == 16'h2d9 ? 16'hfc00 :  // <0425> swapra = nop

// ######## func poke_cmd // = 0x02da
addr == 16'h2da ? 16'h2004 :  // <0427> push x // func poke_cmd
addr == 16'h2db ? 16'h203e :  // <0427> push rtna // "
// x = destination register address to poke.

addr == 16'h2dc ? 16'hfa8f :  // <0429> rtna = 143
addr == 16'h2dd ? 16'hfc00 :  // <0429> swapra = nop

addr == 16'h2de ? 16'h1000 :  // <0430> x = a
addr == 16'h2df ? 16'h0200 :  // <0431> a = 0
addr == 16'h2e0 ? 16'he407 :  // <0432> bn eq :fail
addr == 16'h2e1 ? 16'h02e3 :  // <0432> "


addr == 16'h2e2 ? 16'hfa13 :  // <0434> rtna = 19
addr == 16'h2e3 ? 16'hfc00 :  // <0434> swapra = nop

addr == 16'h2e4 ? 16'h2000 :  // <0434> push a // "

addr == 16'h2e5 ? 16'hfa04 :  // <0434> rtna = 4
addr == 16'h2e6 ? 16'hfc00 :  // <0434> swapra = nop

addr == 16'h2e7 ? 16'h0008 :  // <0434> pop a // "
addr == 16'h2e8 ? 16'h063d :  // <0435> b = 61 // asc b = "="
addr == 16'h2e9 ? 16'he407 :  // <0436> bn eq :fail
addr == 16'h2ea ? 16'h02e3 :  // <0436> "

// parse value to poke.

addr == 16'h2eb ? 16'hfa8f :  // <0439> rtna = 143
addr == 16'h2ec ? 16'hfc00 :  // <0439> swapra = nop

addr == 16'h2ed ? 16'h3800 :  // <0440> poke_data = a
addr == 16'h2ee ? 16'h0200 :  // <0441> a = 0
addr == 16'h2ef ? 16'he407 :  // <0442> bn eq :fail
addr == 16'h2f0 ? 16'h02e3 :  // <0442> "

addr == 16'h2f1 ? 16'h0004 :  // <0444> a = x

addr == 16'h2f2 ? 16'hfba0 :  // <0445> rtna = 758
addr == 16'h2f3 ? 16'h02f6 :  // <0445> "
addr == 16'h2f4 ? 16'hfc00 :  // <0445> swapra = nop

addr == 16'h2f5 ? 16'hf808 :  // <0446> pop rtna // rtn
addr == 16'h2f6 ? 16'h1008 :  // <0446> pop x // "
addr == 16'h2f7 ? 16'hfc00 :  // <0446> swapra = nop

// :fail // = 0x02f8
addr == 16'h2f8 ? 16'h023f :  // <0449> a = 63 // putasc "?"

addr == 16'h2f9 ? 16'hfa04 :  // <0449> rtna = 4
addr == 16'h2fa ? 16'hfc00 :  // <0449> swapra = nop

addr == 16'h2fb ? 16'h03a0 :  // <0450> a = :eol_msg // puteol
addr == 16'h2fc ? 16'h0002 :  // <0450> "

addr == 16'h2fd ? 16'hfade :  // <0450> rtna = 222
addr == 16'h2fe ? 16'hfc00 :  // <0450> swapra = nop

addr == 16'h2ff ? 16'hf808 :  // <0451> pop rtna // end_func
addr == 16'h300 ? 16'h1008 :  // <0451> pop x // "
addr == 16'h301 ? 16'hfc00 :  // <0451> swapra = nop

// force execution of the opcode passed in force_opcode.
// ######## func force_instruction // = 0x0302
addr == 16'h302 ? 16'h3e04 :  // <0455> bus_ctrl = $divert_code_bus_mask
addr == 16'h303 ? 16'h4201 :  // <0456> tg_force = $hold_state_mask
addr == 16'h304 ? 16'h4203 :  // <0457> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h305 ? 16'h4205 :  // <0458> tg_force = ($hold_state_mask | $force_exec_mask)
addr == 16'h306 ? 16'h4201 :  // <0459> tg_force = $hold_state_mask
// refill target exr so it can resume seamlessly.
addr == 16'h307 ? 16'h3415 :  // <0461> force_opcode = exr_shadow
addr == 16'h308 ? 16'h4203 :  // <0462> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h309 ? 16'h4200 :  // <0463> tg_force = 0
addr == 16'h30a ? 16'hfc00 :  // <0464> swapra = nop

// write to a register in the target MCU.  pass the value in poke_data.
// pass its register address in a.
// ######## func poke // = 0x030b
addr == 16'h30b ? 16'h203e :  // <0468> push rtna // func poke
addr == 16'h30c ? 16'h063f :  // <0469> b = $dest_mask
addr == 16'h30d ? 16'hc800 :  // <0470> a = and
addr == 16'h30e ? 16'h0330 :  // <0470> "
addr == 16'h30f ? 16'h0352 :  // <0471> a = a<<4
addr == 16'h310 ? 16'h0352 :  // <0472> a = a<<4
addr == 16'h311 ? 16'h0351 :  // <0473> a = a<<1
addr == 16'h312 ? 16'h0351 :  // <0474> a = a<<1
addr == 16'h313 ? 16'h07a0 :  // <0475> b = ([src dbgpoke])
addr == 16'h314 ? 16'h03c0 :  // <0475> "
addr == 16'h315 ? 16'hc800 :  // <0476> force_opcode = or
addr == 16'h316 ? 16'h3734 :  // <0476> "

addr == 16'h317 ? 16'hfba0 :  // <0477> rtna = 770
addr == 16'h318 ? 16'h0302 :  // <0477> "
addr == 16'h319 ? 16'hfc00 :  // <0477> swapra = nop

addr == 16'h31a ? 16'hf808 :  // <0478> pop rtna // end_func
addr == 16'h31b ? 16'hfc00 :  // <0478> swapra = nop

// observe a register in the target MCU.  return its value in peek_data.
// pass its register address in a.
// ######## func peek // = 0x031c
addr == 16'h31c ? 16'h203e :  // <0482> push rtna // func peek
addr == 16'h31d ? 16'h07a0 :  // <0483> b = $src_mask
addr == 16'h31e ? 16'h03ff :  // <0483> "
addr == 16'h31f ? 16'hc800 :  // <0484> a = and
addr == 16'h320 ? 16'h0330 :  // <0484> "
addr == 16'h321 ? 16'h07a0 :  // <0485> b = ([dest nop] << $dest_lsb)
addr == 16'h322 ? 16'hc800 :  // <0485> "
addr == 16'h323 ? 16'hc800 :  // <0486> force_opcode = or
addr == 16'h324 ? 16'h3734 :  // <0486> "

addr == 16'h325 ? 16'hfba0 :  // <0487> rtna = 770
addr == 16'h326 ? 16'h0302 :  // <0487> "
addr == 16'h327 ? 16'hfc00 :  // <0487> swapra = nop

// target's register value is now in peek_data.
addr == 16'h328 ? 16'hf808 :  // <0489> pop rtna // end_func
addr == 16'h329 ? 16'hfc00 :  // <0489> swapra = nop

// show target status display.
// ######## func dump_target // = 0x032a
addr == 16'h32a ? 16'h2002 :  // <0492> push i // func dump_target
addr == 16'h32b ? 16'h2003 :  // <0492> push j // "
addr == 16'h32c ? 16'h203e :  // <0492> push rtna // "
addr == 16'h32d ? 16'h03a0 :  // <0493> a = :eol_msg // puteol
addr == 16'h32e ? 16'h0002 :  // <0493> "

addr == 16'h32f ? 16'hfade :  // <0493> rtna = 222
addr == 16'h330 ? 16'hfc00 :  // <0493> swapra = nop

addr == 16'h331 ? 16'h0a00 :  // <0494> i = 0
addr == 16'h332 ? 16'h0e01 :  // <0495> j = 1
// :next_reg // = 0x0333
// fetch register name from table in target program.
// i = register number.
// peek is skipped for any reg name starting with 2 slashes (good for read-sensitive regs).
addr == 16'h333 ? 16'h0002 :  // <0500> a = i
addr == 16'h334 ? 16'h0351 :  // <0501> a = a<<1
addr == 16'h335 ? 16'h0351 :  // <0502> a = a<<1
addr == 16'h336 ? 16'h0603 :  // <0503> b = 3
addr == 16'h337 ? 16'hc800 :  // <0504> a = a+b
addr == 16'h338 ? 16'h0300 :  // <0504> "
addr == 16'h339 ? 16'h0404 :  // <0505> b = x
addr == 16'h33a ? 16'hc800 :  // <0506> m9k_addr = a+b
addr == 16'h33b ? 16'h4f00 :  // <0506> "
addr == 16'h33c ? 16'h0014 :  // <0507> a = m9k_data
addr == 16'h33d ? 16'h07a0 :  // <0508> b = 0x2f2f
addr == 16'h33e ? 16'h2f2f :  // <0508> "
addr == 16'h33f ? 16'he007 :  // <0509> br eq :no_peek
addr == 16'h340 ? 16'h0341 :  // <0509> "
addr == 16'h341 ? 16'h0220 :  // <0510> a = 32 // putasc " "

addr == 16'h342 ? 16'hfa04 :  // <0510> rtna = 4
addr == 16'h343 ? 16'hfc00 :  // <0510> swapra = nop

addr == 16'h344 ? 16'h0220 :  // <0511> a = 32 // putasc " "

addr == 16'h345 ? 16'hfa04 :  // <0511> rtna = 4
addr == 16'h346 ? 16'hfc00 :  // <0511> swapra = nop

addr == 16'h347 ? 16'h0013 :  // <0512> a = m9k_addr
addr == 16'h348 ? 16'h0608 :  // <0513> b = 8

addr == 16'h349 ? 16'hfba0 :  // <0514> rtna = 844
addr == 16'h34a ? 16'h034c :  // <0514> "
addr == 16'h34b ? 16'hfc00 :  // <0514> swapra = nop

addr == 16'h34c ? 16'h023d :  // <0515> a = 61 // putasc "="

addr == 16'h34d ? 16'hfa04 :  // <0515> rtna = 4
addr == 16'h34e ? 16'hfc00 :  // <0515> swapra = nop

addr == 16'h34f ? 16'h0002 :  // <0516> a = i

addr == 16'h350 ? 16'hfba0 :  // <0517> rtna = 796
addr == 16'h351 ? 16'h031c :  // <0517> "
addr == 16'h352 ? 16'hfc00 :  // <0517> swapra = nop

addr == 16'h353 ? 16'h0017 :  // <0518> a = peek_data

addr == 16'h354 ? 16'hfa5e :  // <0519> rtna = 94
addr == 16'h355 ? 16'hfc00 :  // <0519> swapra = nop

addr == 16'h356 ? 16'h03a0 :  // <0520> a = :eol_msg // puteol
addr == 16'h357 ? 16'h0002 :  // <0520> "

addr == 16'h358 ? 16'hfade :  // <0520> rtna = 222
addr == 16'h359 ? 16'hfc00 :  // <0520> swapra = nop

// :no_peek // = 0x035a
addr == 16'h35a ? 16'hc800 :  // <0522> i = i+j
addr == 16'h35b ? 16'h0b10 :  // <0522> "
// loop up to the number of registers in the target program's register name table.
addr == 16'h35c ? 16'h4e02 :  // <0524> m9k_addr = 2
addr == 16'h35d ? 16'h0414 :  // <0525> b = m9k_data
addr == 16'h35e ? 16'h0002 :  // <0526> a = i
addr == 16'h35f ? 16'he407 :  // <0527> bn eq :next_reg
addr == 16'h360 ? 16'h0333 :  // <0527> "
addr == 16'h361 ? 16'hf808 :  // <0528> pop rtna // end_func
addr == 16'h362 ? 16'h0c08 :  // <0528> pop j // "
addr == 16'h363 ? 16'h0808 :  // <0528> pop i // "
addr == 16'h364 ? 16'hfc00 :  // <0528> swapra = nop

// print a fixed-length string from packed words in TARGET program space.
// pass its word address (not its byte address) in a,  its length (bytes) in b.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_fixed_target // = 0x0365
addr == 16'h365 ? 16'h2002 :  // <0534> push i // func print_fixed_target
addr == 16'h366 ? 16'h2003 :  // <0534> push j // "
addr == 16'h367 ? 16'h2004 :  // <0534> push x // "
addr == 16'h368 ? 16'h2005 :  // <0534> push y // "
addr == 16'h369 ? 16'h2006 :  // <0534> push g6 // "
addr == 16'h36a ? 16'h203e :  // <0534> push rtna // "
addr == 16'h36b ? 16'h0800 :  // <0535> i = a
addr == 16'h36c ? 16'h0e01 :  // <0536> j = 1
addr == 16'h36d ? 16'h1001 :  // <0537> x = b
addr == 16'h36e ? 16'h1760 :  // <0538> y = -1
// :next_word // = 0x036f
addr == 16'h36f ? 16'he002 :  // <0540> br xz :done
addr == 16'h370 ? 16'h036a :  // <0540> "
addr == 16'h371 ? 16'h1320 :  // <0541> x = ad2
addr == 16'h372 ? 16'h4c02 :  // <0542> m9k_addr = i
addr == 16'h373 ? 16'h1814 :  // <0543> g6 = m9k_data
// now x = bytes remaining, i = current word address, g6 = data word.
addr == 16'h374 ? 16'h0006 :  // <0545> a = g6 // putchar g6

addr == 16'h375 ? 16'hfa04 :  // <0545> rtna = 4
addr == 16'h376 ? 16'hfc00 :  // <0545> swapra = nop

addr == 16'h377 ? 16'he002 :  // <0546> br xz :done
addr == 16'h378 ? 16'h036a :  // <0546> "
addr == 16'h379 ? 16'h1320 :  // <0547> x = ad2
addr == 16'h37a ? 16'h0006 :  // <0548> a = g6
addr == 16'h37b ? 16'h0353 :  // <0549> a = a>>4
addr == 16'h37c ? 16'h0353 :  // <0550> a = a>>4

addr == 16'h37d ? 16'hfa04 :  // <0551> rtna = 4
addr == 16'h37e ? 16'hfc00 :  // <0551> swapra = nop

addr == 16'h37f ? 16'hc800 :  // <0552> i = i+j
addr == 16'h380 ? 16'h0b10 :  // <0552> "
addr == 16'h381 ? 16'he00f :  // <0553> jmp :next_word
addr == 16'h382 ? 16'h036f :  // <0553> "
// :done // = 0x0383
addr == 16'h383 ? 16'hf808 :  // <0555> pop rtna // end_func
addr == 16'h384 ? 16'h1808 :  // <0555> pop g6 // "
addr == 16'h385 ? 16'h1408 :  // <0555> pop y // "
addr == 16'h386 ? 16'h1008 :  // <0555> pop x // "
addr == 16'h387 ? 16'h0c08 :  // <0555> pop j // "
addr == 16'h388 ? 16'h0808 :  // <0555> pop i // "
addr == 16'h389 ? 16'hfc00 :  // <0555> swapra = nop

// ######## func load_program // = 0x038a
addr == 16'h38a ? 16'h2002 :  // <0557> push i // func load_program
addr == 16'h38b ? 16'h2003 :  // <0557> push j // "
addr == 16'h38c ? 16'h2004 :  // <0557> push x // "
addr == 16'h38d ? 16'h203e :  // <0557> push rtna // "
// load target program from UART.

// length, little-endian.  memorize in x.
addr == 16'h38e ? 16'h03a0 :  // <0561> a = :eol_msg // puteol
addr == 16'h38f ? 16'h0002 :  // <0561> "

addr == 16'h390 ? 16'hfade :  // <0561> rtna = 222
addr == 16'h391 ? 16'hfc00 :  // <0561> swapra = nop

addr == 16'h392 ? 16'h024c :  // <0562> a = 76 // putasc L

addr == 16'h393 ? 16'hfa04 :  // <0562> rtna = 4
addr == 16'h394 ? 16'hfc00 :  // <0562> swapra = nop


addr == 16'h395 ? 16'hfa13 :  // <0563> rtna = 19
addr == 16'h396 ? 16'hfc00 :  // <0563> swapra = nop

addr == 16'h397 ? 16'h2000 :  // <0563> push a // "

addr == 16'h398 ? 16'hfa13 :  // <0563> rtna = 19
addr == 16'h399 ? 16'hfc00 :  // <0563> swapra = nop

addr == 16'h39a ? 16'h0352 :  // <0563> "
addr == 16'h39b ? 16'h0352 :  // <0563> "
addr == 16'h39c ? 16'h0408 :  // <0563> pop b // "
addr == 16'h39d ? 16'hc800 :  // <0563> "
addr == 16'h39e ? 16'h1334 :  // <0563> "
addr == 16'h39f ? 16'h0004 :  // <0564> a = x

addr == 16'h3a0 ? 16'hfa5e :  // <0565> rtna = 94
addr == 16'h3a1 ? 16'hfc00 :  // <0565> swapra = nop

addr == 16'h3a2 ? 16'h03a0 :  // <0566> a = :eol_msg // puteol
addr == 16'h3a3 ? 16'h0002 :  // <0566> "

addr == 16'h3a4 ? 16'hfade :  // <0566> rtna = 222
addr == 16'h3a5 ? 16'hfc00 :  // <0566> swapra = nop


// put target into reset again, in case this is a target warm boot.
addr == 16'h3a6 ? 16'h3e02 :  // <0569> bus_ctrl = $tg_reset_mask

// load opcodes.  count up address in i.
addr == 16'h3a7 ? 16'h0a00 :  // <0572> i = 0
addr == 16'h3a8 ? 16'h0e01 :  // <0573> j = 1

addr == 16'h3a9 ? 16'hfafd :  // <0574> rtna = 253
addr == 16'h3aa ? 16'hfc00 :  // <0574> swapra = nop

// :loadword // = 0x03ab
// receive, store in RAM.

addr == 16'h3ab ? 16'hfa13 :  // <0577> rtna = 19
addr == 16'h3ac ? 16'hfc00 :  // <0577> swapra = nop

addr == 16'h3ad ? 16'h2000 :  // <0577> push a // "

addr == 16'h3ae ? 16'hfa13 :  // <0577> rtna = 19
addr == 16'h3af ? 16'hfc00 :  // <0577> swapra = nop

addr == 16'h3b0 ? 16'h0352 :  // <0577> "
addr == 16'h3b1 ? 16'h0352 :  // <0577> "
addr == 16'h3b2 ? 16'h0408 :  // <0577> pop b // "
addr == 16'h3b3 ? 16'hc800 :  // <0577> "
addr == 16'h3b4 ? 16'h0334 :  // <0577> "
addr == 16'h3b5 ? 16'h4c02 :  // <0578> m9k_addr = i
addr == 16'h3b6 ? 16'h5000 :  // <0579> m9k_data = a

// read back from RAM and build checksum.
addr == 16'h3b7 ? 16'h0014 :  // <0582> a = m9k_data

addr == 16'h3b8 ? 16'hfba0 :  // <0583> rtna = 284
addr == 16'h3b9 ? 16'h011c :  // <0583> "
addr == 16'h3ba ? 16'hfc00 :  // <0583> swapra = nop


//  show decimated feedback text, for more speed:
addr == 16'h3bb ? 16'h0002 :  // <0586> a = i
addr == 16'h3bc ? 16'h061f :  // <0587> b = 0x1f
addr == 16'h3bd ? 16'he403 :  // <0588> bn and0z :skip_text
addr == 16'h3be ? 16'h03a8 :  // <0588> "
addr == 16'h3bf ? 16'h022e :  // <0589> a = 46 // putasc "."

addr == 16'h3c0 ? 16'hfa04 :  // <0589> rtna = 4
addr == 16'h3c1 ? 16'hfc00 :  // <0589> swapra = nop

// :skip_text // = 0x03c2

addr == 16'h3c2 ? 16'hc800 :  // <0592> i = i+j
addr == 16'h3c3 ? 16'h0b10 :  // <0592> "
addr == 16'h3c4 ? 16'h0002 :  // <0593> a = i
addr == 16'h3c5 ? 16'h0404 :  // <0594> b = x
addr == 16'h3c6 ? 16'he407 :  // <0595> bn eq :loadword
addr == 16'h3c7 ? 16'h03ab :  // <0595> "
addr == 16'h3c8 ? 16'h03a0 :  // <0596> a = :eol_msg // puteol
addr == 16'h3c9 ? 16'h0002 :  // <0596> "

addr == 16'h3ca ? 16'hfade :  // <0596> rtna = 222
addr == 16'h3cb ? 16'hfc00 :  // <0596> swapra = nop


addr == 16'h3cc ? 16'hfba0 :  // <0597> rtna = 301
addr == 16'h3cd ? 16'h012d :  // <0597> "
addr == 16'h3ce ? 16'hfc00 :  // <0597> swapra = nop


addr == 16'h3cf ? 16'hfa5e :  // <0598> rtna = 94
addr == 16'h3d0 ? 16'hfc00 :  // <0598> swapra = nop

addr == 16'h3d1 ? 16'h03a0 :  // <0599> a = :eol_msg // puteol
addr == 16'h3d2 ? 16'h0002 :  // <0599> "

addr == 16'h3d3 ? 16'hfade :  // <0599> rtna = 222
addr == 16'h3d4 ? 16'hfc00 :  // <0599> swapra = nop

addr == 16'h3d5 ? 16'hf808 :  // <0600> pop rtna // end_func
addr == 16'h3d6 ? 16'h1008 :  // <0600> pop x // "
addr == 16'h3d7 ? 16'h0c08 :  // <0600> pop j // "
addr == 16'h3d8 ? 16'h0808 :  // <0600> pop i // "
addr == 16'h3d9 ? 16'hfc00 :  // <0600> swapra = nop


        
                16'hxxxx;
        endmodule
    
