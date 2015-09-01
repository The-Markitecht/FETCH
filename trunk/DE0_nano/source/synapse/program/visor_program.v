
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







addr == 16'h00 ? 16'he00f :  // <0065> jmp :main
addr == 16'h01 ? 16'h015a :  // <0065> "


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

// print a fixed-length string from packed words in program space.
// pass its word address (not its byte address) in a,  its length (bytes) in b.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_fixed // = 0x00c2
addr == 16'hc2 ? 16'h2002 :  // <0121> push i // func print_fixed
addr == 16'hc3 ? 16'h2003 :  // <0121> push j // "
addr == 16'hc4 ? 16'h2004 :  // <0121> push x // "
addr == 16'hc5 ? 16'h2005 :  // <0121> push y // "
addr == 16'hc6 ? 16'h2006 :  // <0121> push g6 // "
addr == 16'hc7 ? 16'h203e :  // <0121> push rtna // "
addr == 16'hc8 ? 16'h0800 :  // <0122> i = a
addr == 16'hc9 ? 16'h0e01 :  // <0123> j = 1
addr == 16'hca ? 16'h1001 :  // <0124> x = b
addr == 16'hcb ? 16'h1760 :  // <0125> y = -1
// :next_word // = 0x00cc
addr == 16'hcc ? 16'he002 :  // <0127> br xz :done
addr == 16'hcd ? 16'h00e2 :  // <0127> "
addr == 16'hce ? 16'h1320 :  // <0128> x = ad2
addr == 16'hcf ? 16'hd002 :  // <0129> fetch g6 from i
addr == 16'hd0 ? 16'h1bb0 :  // <0129> "
// now x = bytes remaining, i = current word address, g6 = data word.
addr == 16'hd1 ? 16'h0006 :  // <0131> a = g6 // putchar g6
addr == 16'hd2 ? 16'hfba0 :  // <0131> putchar g6
addr == 16'hd3 ? 16'h0002 :  // <0131> "
addr == 16'hd4 ? 16'hfc00 :  // <0131> "
addr == 16'hd5 ? 16'he002 :  // <0132> br xz :done
addr == 16'hd6 ? 16'h00e2 :  // <0132> "
addr == 16'hd7 ? 16'h1320 :  // <0133> x = ad2
addr == 16'hd8 ? 16'h0006 :  // <0134> a = g6
addr == 16'hd9 ? 16'h0353 :  // <0135> a = a>>4
addr == 16'hda ? 16'h0353 :  // <0136> a = a>>4
addr == 16'hdb ? 16'hfba0 :  // <0137> putchar a
addr == 16'hdc ? 16'h0002 :  // <0137> "
addr == 16'hdd ? 16'hfc00 :  // <0137> "
addr == 16'hde ? 16'hc800 :  // <0138> i = i+j
addr == 16'hdf ? 16'h0b10 :  // <0138> "
addr == 16'he0 ? 16'he00f :  // <0139> jmp :next_word
addr == 16'he1 ? 16'h00cc :  // <0139> "
// :done // = 0x00e2
addr == 16'he2 ? 16'hf808 :  // <0141> pop rtna // end_func
addr == 16'he3 ? 16'h1808 :  // <0141> pop g6 // "
addr == 16'he4 ? 16'h1408 :  // <0141> pop y // "
addr == 16'he5 ? 16'h1008 :  // <0141> pop x // "
addr == 16'he6 ? 16'h0c08 :  // <0141> pop j // "
addr == 16'he7 ? 16'h0808 :  // <0141> pop i // "
addr == 16'he8 ? 16'hfc00 :  // <0141> end_func

// print a null-terminated string from packed words in program space.
// pass its word address (not its byte address) in a.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_nt // = 0x00e9
addr == 16'he9 ? 16'h2002 :  // <0147> push i // func print_nt
addr == 16'hea ? 16'h2003 :  // <0147> push j // "
addr == 16'heb ? 16'h2004 :  // <0147> push x // "
addr == 16'hec ? 16'h203e :  // <0147> push rtna // "
addr == 16'hed ? 16'h0800 :  // <0148> i = a
addr == 16'hee ? 16'h0e01 :  // <0149> j = 1
// :next_word // = 0x00ef
addr == 16'hef ? 16'hd002 :  // <0151> fetch x from i
addr == 16'hf0 ? 16'h13b0 :  // <0151> "
// now i = current word address, x = data word, b = low byte mask, a = data byte.
addr == 16'hf1 ? 16'h0004 :  // <0153> a = x
addr == 16'hf2 ? 16'h06ff :  // <0154> b = 0xff
addr == 16'hf3 ? 16'he003 :  // <0155> br and0z :done
addr == 16'hf4 ? 16'h0105 :  // <0155> "
addr == 16'hf5 ? 16'hfba0 :  // <0156> putchar a
addr == 16'hf6 ? 16'h0002 :  // <0156> "
addr == 16'hf7 ? 16'hfc00 :  // <0156> "
addr == 16'hf8 ? 16'h0004 :  // <0157> a = x
addr == 16'hf9 ? 16'h0353 :  // <0158> a = a>>4
addr == 16'hfa ? 16'h0353 :  // <0159> a = a>>4
addr == 16'hfb ? 16'h06ff :  // <0160> b = 0xff
addr == 16'hfc ? 16'he003 :  // <0161> br and0z :done
addr == 16'hfd ? 16'h0105 :  // <0161> "
addr == 16'hfe ? 16'hfba0 :  // <0162> putchar a
addr == 16'hff ? 16'h0002 :  // <0162> "
addr == 16'h100 ? 16'hfc00 :  // <0162> "
addr == 16'h101 ? 16'hc800 :  // <0163> i = i+j
addr == 16'h102 ? 16'h0b10 :  // <0163> "
addr == 16'h103 ? 16'he00f :  // <0164> jmp :next_word
addr == 16'h104 ? 16'h00ef :  // <0164> "
// :done // = 0x0105
addr == 16'h105 ? 16'hf808 :  // <0166> pop rtna // end_func
addr == 16'h106 ? 16'h1008 :  // <0166> pop x // "
addr == 16'h107 ? 16'h0c08 :  // <0166> pop j // "
addr == 16'h108 ? 16'h0808 :  // <0166> pop i // "
addr == 16'h109 ? 16'hfc00 :  // <0166> end_func

// routine waits a number of milliseconds given in a.
// ######## func spinwait // = 0x010a
addr == 16'h10a ? 16'h2004 :  // <0002> push x // func spinwait
addr == 16'h10b ? 16'h2005 :  // <0002> push y // "
//patch
//rtn
addr == 16'h10c ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x010d
addr == 16'h10d ? 16'h13a0 :  // <0007> x = 16666
addr == 16'h10e ? 16'h411a :  // <0007> "
addr == 16'h10f ? 16'h1760 :  // <0008> y = -1
addr == 16'h110 ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x0111
// use of the ad2 name overrides auto-nop here.
addr == 16'h111 ? 16'h1320 :  // <0012> x = ad2
addr == 16'h112 ? 16'he402 :  // <0013> bn xz :spinwait_inner
addr == 16'h113 ? 16'h0111 :  // <0013> "
addr == 16'h114 ? 16'hc800 :  // <0014> a = a+b
addr == 16'h115 ? 16'h0300 :  // <0014> "
addr == 16'h116 ? 16'he400 :  // <0015> bn az :spinwait_outer
addr == 16'h117 ? 16'h010d :  // <0015> "
addr == 16'h118 ? 16'h1408 :  // <0016> pop y // end_func
addr == 16'h119 ? 16'h1008 :  // <0016> pop x // "
addr == 16'h11a ? 16'hfc00 :  // <0016> end_func





// ######## func fletcher16_init // = 0x011b
addr == 16'h11b ? 16'h1a00 :  // <0005> $fletcher_sum1_reg = 0
addr == 16'h11c ? 16'h1e00 :  // <0006> $fletcher_sum2_reg = 0
addr == 16'h11d ? 16'hfc00 :  // <0007> end_func

// compute the modulus(255) of a number given in a.  return remainder in a.
// ######## func mod255 // = 0x011e
// while a is greater than 254, subtract 255.
// :mod255_again // = 0x011e
addr == 16'h11e ? 16'h06fe :  // <0013> b = 0xfe
addr == 16'h11f ? 16'he006 :  // <0014> br gt :mod255_greater
addr == 16'h120 ? 16'h0122 :  // <0014> "
addr == 16'h121 ? 16'hfc00 :  // <0015> rtn
// :mod255_greater // = 0x0122
addr == 16'h122 ? 16'h07a0 :  // <0017> b = 0xff01
addr == 16'h123 ? 16'hff01 :  // <0017> "
addr == 16'h124 ? 16'hc800 :  // <0018> a = a+b
addr == 16'h125 ? 16'h0300 :  // <0018> "
addr == 16'h126 ? 16'he00f :  // <0019> jmp :mod255_again
addr == 16'h127 ? 16'h011e :  // <0019> "
addr == 16'h128 ? 16'hfc00 :  // <0020> end_func

// accumulate a Fletcher16 checksum, given the next byte of data in a.
// ######## func fletcher16_input8 // = 0x0129
addr == 16'h129 ? 16'h203e :  // <0023> push rtna // func fletcher16_input8
addr == 16'h12a ? 16'h0406 :  // <0024> b = $fletcher_sum1_reg
addr == 16'h12b ? 16'hc800 :  // <0025> a = a+b
addr == 16'h12c ? 16'h0300 :  // <0025> "
addr == 16'h12d ? 16'hfba0 :  // <0026> call :mod255
addr == 16'h12e ? 16'h011e :  // <0026> "
addr == 16'h12f ? 16'hfc00 :  // <0026> "
addr == 16'h130 ? 16'h1800 :  // <0027> $fletcher_sum1_reg = a

addr == 16'h131 ? 16'h0407 :  // <0029> b = $fletcher_sum2_reg
addr == 16'h132 ? 16'hc800 :  // <0030> a = a+b
addr == 16'h133 ? 16'h0300 :  // <0030> "
addr == 16'h134 ? 16'hfba0 :  // <0031> call :mod255
addr == 16'h135 ? 16'h011e :  // <0031> "
addr == 16'h136 ? 16'hfc00 :  // <0031> "
addr == 16'h137 ? 16'h1c00 :  // <0032> $fletcher_sum2_reg = a
addr == 16'h138 ? 16'hf808 :  // <0033> pop rtna // end_func
addr == 16'h139 ? 16'hfc00 :  // <0033> end_func

// accumulate a Fletcher16 checksum, given the next word of data in a.
// ######## func fletcher16_input16 // = 0x013a
addr == 16'h13a ? 16'h2002 :  // <0036> push i // func fletcher16_input16
addr == 16'h13b ? 16'h203e :  // <0036> push rtna // "
addr == 16'h13c ? 16'h0b53 :  // <0037> i = a>>4
addr == 16'h13d ? 16'h06ff :  // <0038> b = 0xff
addr == 16'h13e ? 16'hc800 :  // <0039> a = and
addr == 16'h13f ? 16'h0330 :  // <0039> "
addr == 16'h140 ? 16'hfba0 :  // <0040> call :fletcher16_input8
addr == 16'h141 ? 16'h0129 :  // <0040> "
addr == 16'h142 ? 16'hfc00 :  // <0040> "
addr == 16'h143 ? 16'h0002 :  // <0041> a = i
addr == 16'h144 ? 16'h0353 :  // <0042> a = a>>4
addr == 16'h145 ? 16'hfba0 :  // <0043> call :fletcher16_input8
addr == 16'h146 ? 16'h0129 :  // <0043> "
addr == 16'h147 ? 16'hfc00 :  // <0043> "
addr == 16'h148 ? 16'hf808 :  // <0044> pop rtna // end_func
addr == 16'h149 ? 16'h0808 :  // <0044> pop i // "
addr == 16'h14a ? 16'hfc00 :  // <0044> end_func

// return the combined 16-bit result of Fletcher16 checksum in a.
// ######## func fletcher16_result // = 0x014b
addr == 16'h14b ? 16'h0007 :  // <0048> a = $fletcher_sum2_reg
addr == 16'h14c ? 16'h0352 :  // <0049> a = a<<4
addr == 16'h14d ? 16'h0352 :  // <0050> a = a<<4
addr == 16'h14e ? 16'h0406 :  // <0051> b = $fletcher_sum1_reg
addr == 16'h14f ? 16'hc800 :  // <0052> a = or
addr == 16'h150 ? 16'h0334 :  // <0052> "
addr == 16'h151 ? 16'hfc00 :  // <0053> end_func




// :boot_msg // = 0x0152
// "\r\nVISOR\x0"
addr == 16'h152 ? 16'h0a0d :  // <0085>   
addr == 16'h153 ? 16'h4956 :  // <0085> IV
addr == 16'h154 ? 16'h4f53 :  // <0085> OS
addr == 16'h155 ? 16'h0052 :  // <0085>  R
// :running_msg // = 0x0156
// "\r\nRUN >\x0"
addr == 16'h156 ? 16'h0a0d :  // <0087>   
addr == 16'h157 ? 16'h5552 :  // <0087> UR
addr == 16'h158 ? 16'h204e :  // <0087>  N
addr == 16'h159 ? 16'h003e :  // <0087>  >

// ////////////////////////////////////////////
// :main // = 0x015a
// put target into reset.
addr == 16'h15a ? 16'h3e02 :  // <0092> bus_ctrl = $tg_reset_mask

// init visor.
addr == 16'h15b ? 16'h3360 :  // <0095> bp3_addr = $bp_disable
addr == 16'h15c ? 16'h2f60 :  // <0096> bp2_addr = $bp_disable
addr == 16'h15d ? 16'h2b60 :  // <0097> bp1_addr = $bp_disable
addr == 16'h15e ? 16'h2760 :  // <0098> bp0_addr = $bp_disable

// startup message
addr == 16'h15f ? 16'h03a0 :  // <0101> a = :boot_msg
addr == 16'h160 ? 16'h0152 :  // <0101> "
addr == 16'h161 ? 16'hfba0 :  // <0102> call :print_nt
addr == 16'h162 ? 16'h00e9 :  // <0102> "
addr == 16'h163 ? 16'hfc00 :  // <0102> "

// check for bootloader signal.
addr == 16'h164 ? 16'h0019 :  // <0105> a = boot_break
addr == 16'h165 ? 16'he400 :  // <0106> bn az :boot_run
addr == 16'h166 ? 16'h016d :  // <0106> "
// ^^^ for press-to-debug; runs target by default.
// br az :boot_run
// ^^^ for press-to-run; debugs target by default.

// step into the first target instruction.
addr == 16'h167 ? 16'h3e08 :  // <0112> bus_ctrl = $bp_step_mask
addr == 16'h168 ? 16'hfba0 :  // <0113> call :wait_for_bp
addr == 16'h169 ? 16'h01e7 :  // <0113> "
addr == 16'h16a ? 16'hfc00 :  // <0113> "
addr == 16'h16b ? 16'he00f :  // <0114> jmp :cmd_loop
addr == 16'h16c ? 16'h016e :  // <0114> "
// :boot_run // = 0x016d
// release target reset, to run.
addr == 16'h16d ? 16'h3e00 :  // <0117> bus_ctrl = 0

// command prompt loop.
// :cmd_loop // = 0x016e
addr == 16'h16e ? 16'h000f :  // <0121> a = bus_ctrl
addr == 16'h16f ? 16'h0600 :  // <0122> b = 0
addr == 16'h170 ? 16'he007 :  // <0123> br eq :running_prompt
addr == 16'h171 ? 16'h0193 :  // <0123> "

addr == 16'h172 ? 16'hfba0 :  // <0125> call :dump_target
addr == 16'h173 ? 16'h0292 :  // <0125> "
addr == 16'h174 ? 16'hfc00 :  // <0125> "
addr == 16'h175 ? 16'h0016 :  // <0126> a = tg_code_addr
addr == 16'h176 ? 16'hfba0 :  // <0127> call :put4x
addr == 16'h177 ? 16'h005d :  // <0127> "
addr == 16'h178 ? 16'hfc00 :  // <0127> "
addr == 16'h179 ? 16'h022c :  // <0128> a = 44 // putasc ","
addr == 16'h17a ? 16'hfba0 :  // <0128> putasc ","
addr == 16'h17b ? 16'h0002 :  // <0128> "
addr == 16'h17c ? 16'hfc00 :  // <0128> "
addr == 16'h17d ? 16'h0015 :  // <0129> a = exr_shadow
addr == 16'h17e ? 16'hfba0 :  // <0130> call :put4x
addr == 16'h17f ? 16'h005d :  // <0130> "
addr == 16'h180 ? 16'hfc00 :  // <0130> "
addr == 16'h181 ? 16'h0220 :  // <0131> a = 32 // putasc " "
addr == 16'h182 ? 16'hfba0 :  // <0131> putasc " "
addr == 16'h183 ? 16'h0002 :  // <0131> "
addr == 16'h184 ? 16'hfc00 :  // <0131> "
addr == 16'h185 ? 16'h023e :  // <0132> a = 62 // putasc ">"
addr == 16'h186 ? 16'hfba0 :  // <0132> putasc ">"
addr == 16'h187 ? 16'h0002 :  // <0132> "
addr == 16'h188 ? 16'hfc00 :  // <0132> "
addr == 16'h189 ? 16'hfba0 :  // <0133> getchar_echo
addr == 16'h18a ? 16'h0011 :  // <0133> "
addr == 16'h18b ? 16'hfc00 :  // <0133> "
addr == 16'h18c ? 16'h2000 :  // <0133> push a // "
addr == 16'h18d ? 16'hfba0 :  // <0133> "
addr == 16'h18e ? 16'h0002 :  // <0133> "
addr == 16'h18f ? 16'hfc00 :  // <0133> "
addr == 16'h190 ? 16'h0008 :  // <0133> pop a // "
addr == 16'h191 ? 16'he00f :  // <0134> jmp :parse_cmd
addr == 16'h192 ? 16'h01a4 :  // <0134> "

// :running_prompt // = 0x0193
addr == 16'h193 ? 16'h03a0 :  // <0137> a = :running_msg
addr == 16'h194 ? 16'h0156 :  // <0137> "
addr == 16'h195 ? 16'hfba0 :  // <0138> call :print_nt
addr == 16'h196 ? 16'h00e9 :  // <0138> "
addr == 16'h197 ? 16'hfc00 :  // <0138> "
// :run_poll // = 0x0198
addr == 16'h198 ? 16'hfba0 :  // <0140> pollchar
addr == 16'h199 ? 16'h001a :  // <0140> "
addr == 16'h19a ? 16'hfc00 :  // <0140> "
addr == 16'h19b ? 16'h0760 :  // <0141> b = -1
addr == 16'h19c ? 16'he407 :  // <0142> bn eq :parse_cmd
addr == 16'h19d ? 16'h01a4 :  // <0142> "
addr == 16'h19e ? 16'h0018 :  // <0143> a = bp_status
addr == 16'h19f ? 16'he000 :  // <0144> br az :run_poll
addr == 16'h1a0 ? 16'h0198 :  // <0144> "
// target hit a breakpoint; switch to stepping mode.
addr == 16'h1a1 ? 16'h3e08 :  // <0146> bus_ctrl = $bp_step_mask
addr == 16'h1a2 ? 16'he00f :  // <0147> jmp :cmd_loop
addr == 16'h1a3 ? 16'h016e :  // <0147> "

// :parse_cmd // = 0x01a4

// command = step next instruction.
addr == 16'h1a4 ? 16'h066e :  // <0152> b = 110 // asc b = "n"
addr == 16'h1a5 ? 16'he407 :  // <0153> bn eq :skip_step
addr == 16'h1a6 ? 16'h01ae :  // <0153> "
addr == 16'h1a7 ? 16'h3e08 :  // <0154> bus_ctrl = $bp_step_mask
addr == 16'h1a8 ? 16'h2409 :  // <0155> bp0_addr = bp0_addr
addr == 16'h1a9 ? 16'hfba0 :  // <0156> call :wait_for_bp
addr == 16'h1aa ? 16'h01e7 :  // <0156> "
addr == 16'h1ab ? 16'hfc00 :  // <0156> "
addr == 16'h1ac ? 16'he00f :  // <0157> jmp :cmd_loop
addr == 16'h1ad ? 16'h016e :  // <0157> "
// :skip_step // = 0x01ae

// command = reset target.
addr == 16'h1ae ? 16'h0652 :  // <0161> b = 82 // asc b = "R"
addr == 16'h1af ? 16'he407 :  // <0162> bn eq :skip_reset
addr == 16'h1b0 ? 16'h01ba :  // <0162> "
addr == 16'h1b1 ? 16'h3e02 :  // <0163> bus_ctrl = $tg_reset_mask
addr == 16'h1b2 ? 16'hc800 :  // <0164> nop
addr == 16'h1b3 ? 16'hc800 :  // <0165> nop
addr == 16'h1b4 ? 16'h3e08 :  // <0166> bus_ctrl = $bp_step_mask
addr == 16'h1b5 ? 16'hfba0 :  // <0167> call :wait_for_bp
addr == 16'h1b6 ? 16'h01e7 :  // <0167> "
addr == 16'h1b7 ? 16'hfc00 :  // <0167> "
addr == 16'h1b8 ? 16'he00f :  // <0168> jmp :cmd_loop
addr == 16'h1b9 ? 16'h016e :  // <0168> "
// :skip_reset // = 0x01ba

// command = load program.
addr == 16'h1ba ? 16'h066c :  // <0172> b = 108 // asc b = "l"
addr == 16'h1bb ? 16'he407 :  // <0173> bn eq :skip_load
addr == 16'h1bc ? 16'h01c2 :  // <0173> "
addr == 16'h1bd ? 16'hfba0 :  // <0174> call :load_program
addr == 16'h1be ? 16'h0300 :  // <0174> "
addr == 16'h1bf ? 16'hfc00 :  // <0174> "
addr == 16'h1c0 ? 16'he00f :  // <0175> jmp :cmd_loop
addr == 16'h1c1 ? 16'h016e :  // <0175> "
// :skip_load // = 0x01c2

// command = run full speed.
addr == 16'h1c2 ? 16'h0672 :  // <0179> b = 114 // asc b = "r"
addr == 16'h1c3 ? 16'he407 :  // <0180> bn eq :skip_run
addr == 16'h1c4 ? 16'h01c9 :  // <0180> "
// release target reset, to run.
addr == 16'h1c5 ? 16'h3e00 :  // <0182> bus_ctrl = 0
addr == 16'h1c6 ? 16'h2409 :  // <0183> bp0_addr = bp0_addr
addr == 16'h1c7 ? 16'he00f :  // <0184> jmp :cmd_loop
addr == 16'h1c8 ? 16'h016e :  // <0184> "
// :skip_run // = 0x01c9

// command = set breakpoint.
addr == 16'h1c9 ? 16'h0662 :  // <0188> b = 98 // asc b = "b"
addr == 16'h1ca ? 16'he407 :  // <0189> bn eq :skip_setbrk
addr == 16'h1cb ? 16'h01d1 :  // <0189> "
addr == 16'h1cc ? 16'hfba0 :  // <0190> call :set_bp
addr == 16'h1cd ? 16'h01eb :  // <0190> "
addr == 16'h1ce ? 16'hfc00 :  // <0190> "
addr == 16'h1cf ? 16'he00f :  // <0191> jmp :cmd_loop
addr == 16'h1d0 ? 16'h016e :  // <0191> "
// :skip_setbrk // = 0x01d1

// command = poke register.
addr == 16'h1d1 ? 16'h066f :  // <0195> b = 111 // asc b = "o"
addr == 16'h1d2 ? 16'he407 :  // <0196> bn eq :skip_poke
addr == 16'h1d3 ? 16'h01d9 :  // <0196> "
addr == 16'h1d4 ? 16'hfba0 :  // <0197> call :poke_cmd
addr == 16'h1d5 ? 16'h023c :  // <0197> "
addr == 16'h1d6 ? 16'hfc00 :  // <0197> "
addr == 16'h1d7 ? 16'he00f :  // <0198> jmp :cmd_loop
addr == 16'h1d8 ? 16'h016e :  // <0198> "
// :skip_poke // = 0x01d9

addr == 16'h1d9 ? 16'h023f :  // <0201> a = 63 // putasc "?"
addr == 16'h1da ? 16'hfba0 :  // <0201> putasc "?"
addr == 16'h1db ? 16'h0002 :  // <0201> "
addr == 16'h1dc ? 16'hfc00 :  // <0201> "
addr == 16'h1dd ? 16'h020d :  // <0202> a = 13 // puteol
addr == 16'h1de ? 16'hfba0 :  // <0202> puteol
addr == 16'h1df ? 16'h0002 :  // <0202> "
addr == 16'h1e0 ? 16'hfc00 :  // <0202> "
addr == 16'h1e1 ? 16'h020a :  // <0202> a = 10 // puteol
addr == 16'h1e2 ? 16'hfba0 :  // <0202> puteol
addr == 16'h1e3 ? 16'h0002 :  // <0202> "
addr == 16'h1e4 ? 16'hfc00 :  // <0202> "
addr == 16'h1e5 ? 16'he00f :  // <0203> jmp :cmd_loop
addr == 16'h1e6 ? 16'h016e :  // <0203> "


// ######## func wait_for_bp // = 0x01e7
// :poll // = 0x01e7
addr == 16'h1e7 ? 16'h0018 :  // <0234> a = bp_status
addr == 16'h1e8 ? 16'he000 :  // <0235> br az :poll
addr == 16'h1e9 ? 16'h01e7 :  // <0235> "
addr == 16'h1ea ? 16'hfc00 :  // <0236> end_func

// ######## func set_bp // = 0x01eb
addr == 16'h1eb ? 16'h2004 :  // <0238> push x // func set_bp
addr == 16'h1ec ? 16'h2005 :  // <0238> push y // "
addr == 16'h1ed ? 16'h203e :  // <0238> push rtna // "
addr == 16'h1ee ? 16'hfba0 :  // <0239> getchar_echo
addr == 16'h1ef ? 16'h0011 :  // <0239> "
addr == 16'h1f0 ? 16'hfc00 :  // <0239> "
addr == 16'h1f1 ? 16'h2000 :  // <0239> push a // "
addr == 16'h1f2 ? 16'hfba0 :  // <0239> "
addr == 16'h1f3 ? 16'h0002 :  // <0239> "
addr == 16'h1f4 ? 16'hfc00 :  // <0239> "
addr == 16'h1f5 ? 16'h0008 :  // <0239> pop a // "
addr == 16'h1f6 ? 16'h1000 :  // <0240> x = a
addr == 16'h1f7 ? 16'hfba0 :  // <0241> getchar_echo
addr == 16'h1f8 ? 16'h0011 :  // <0241> "
addr == 16'h1f9 ? 16'hfc00 :  // <0241> "
addr == 16'h1fa ? 16'h2000 :  // <0241> push a // "
addr == 16'h1fb ? 16'hfba0 :  // <0241> "
addr == 16'h1fc ? 16'h0002 :  // <0241> "
addr == 16'h1fd ? 16'hfc00 :  // <0241> "
addr == 16'h1fe ? 16'h0008 :  // <0241> pop a // "
addr == 16'h1ff ? 16'h063d :  // <0242> b = 61 // asc b = "="
addr == 16'h200 ? 16'he407 :  // <0243> bn eq :fail
addr == 16'h201 ? 16'h022c :  // <0243> "
addr == 16'h202 ? 16'hfba0 :  // <0244> call :get4x
addr == 16'h203 ? 16'h0096 :  // <0244> "
addr == 16'h204 ? 16'hfc00 :  // <0244> "
addr == 16'h205 ? 16'h1400 :  // <0245> y = a
addr == 16'h206 ? 16'h0200 :  // <0246> a = 0
addr == 16'h207 ? 16'he407 :  // <0247> bn eq :fail
addr == 16'h208 ? 16'h022c :  // <0247> "
addr == 16'h209 ? 16'h0004 :  // <0248> a = x
addr == 16'h20a ? 16'h0630 :  // <0249> b = 48 // asc b = "0"
addr == 16'h20b ? 16'he007 :  // <0250> br eq :b0
addr == 16'h20c ? 16'h0218 :  // <0250> "
addr == 16'h20d ? 16'h0631 :  // <0251> b = 49 // asc b = "1"
addr == 16'h20e ? 16'he007 :  // <0252> br eq :b1
addr == 16'h20f ? 16'h021d :  // <0252> "
addr == 16'h210 ? 16'h0632 :  // <0253> b = 50 // asc b = "2"
addr == 16'h211 ? 16'he007 :  // <0254> br eq :b2
addr == 16'h212 ? 16'h0222 :  // <0254> "
addr == 16'h213 ? 16'h0633 :  // <0255> b = 51 // asc b = "3"
addr == 16'h214 ? 16'he007 :  // <0256> br eq :b3
addr == 16'h215 ? 16'h0227 :  // <0256> "
addr == 16'h216 ? 16'he00f :  // <0257> jmp :fail
addr == 16'h217 ? 16'h022c :  // <0257> "
// :b0 // = 0x0218
addr == 16'h218 ? 16'h2405 :  // <0259> bp0_addr = y
addr == 16'h219 ? 16'hf808 :  // <0260> pop rtna // rtn
addr == 16'h21a ? 16'h1408 :  // <0260> pop y // "
addr == 16'h21b ? 16'h1008 :  // <0260> pop x // "
addr == 16'h21c ? 16'hfc00 :  // <0260> rtn
// :b1 // = 0x021d
addr == 16'h21d ? 16'h2805 :  // <0262> bp1_addr = y
addr == 16'h21e ? 16'hf808 :  // <0263> pop rtna // rtn
addr == 16'h21f ? 16'h1408 :  // <0263> pop y // "
addr == 16'h220 ? 16'h1008 :  // <0263> pop x // "
addr == 16'h221 ? 16'hfc00 :  // <0263> rtn
// :b2 // = 0x0222
addr == 16'h222 ? 16'h2c05 :  // <0265> bp2_addr = y
addr == 16'h223 ? 16'hf808 :  // <0266> pop rtna // rtn
addr == 16'h224 ? 16'h1408 :  // <0266> pop y // "
addr == 16'h225 ? 16'h1008 :  // <0266> pop x // "
addr == 16'h226 ? 16'hfc00 :  // <0266> rtn
// :b3 // = 0x0227
addr == 16'h227 ? 16'h3005 :  // <0268> bp3_addr = y
addr == 16'h228 ? 16'hf808 :  // <0269> pop rtna // rtn
addr == 16'h229 ? 16'h1408 :  // <0269> pop y // "
addr == 16'h22a ? 16'h1008 :  // <0269> pop x // "
addr == 16'h22b ? 16'hfc00 :  // <0269> rtn

// :fail // = 0x022c
addr == 16'h22c ? 16'h023f :  // <0272> a = 63 // putasc "?"
addr == 16'h22d ? 16'hfba0 :  // <0272> putasc "?"
addr == 16'h22e ? 16'h0002 :  // <0272> "
addr == 16'h22f ? 16'hfc00 :  // <0272> "
addr == 16'h230 ? 16'h020d :  // <0273> a = 13 // puteol
addr == 16'h231 ? 16'hfba0 :  // <0273> puteol
addr == 16'h232 ? 16'h0002 :  // <0273> "
addr == 16'h233 ? 16'hfc00 :  // <0273> "
addr == 16'h234 ? 16'h020a :  // <0273> a = 10 // puteol
addr == 16'h235 ? 16'hfba0 :  // <0273> puteol
addr == 16'h236 ? 16'h0002 :  // <0273> "
addr == 16'h237 ? 16'hfc00 :  // <0273> "
addr == 16'h238 ? 16'hf808 :  // <0274> pop rtna // end_func
addr == 16'h239 ? 16'h1408 :  // <0274> pop y // "
addr == 16'h23a ? 16'h1008 :  // <0274> pop x // "
addr == 16'h23b ? 16'hfc00 :  // <0274> end_func

// ######## func poke_cmd // = 0x023c
addr == 16'h23c ? 16'h2004 :  // <0276> push x // func poke_cmd
addr == 16'h23d ? 16'h203e :  // <0276> push rtna // "
// x = destination register address to poke.
addr == 16'h23e ? 16'hfba0 :  // <0278> call :get4x
addr == 16'h23f ? 16'h0096 :  // <0278> "
addr == 16'h240 ? 16'hfc00 :  // <0278> "
addr == 16'h241 ? 16'h1000 :  // <0279> x = a
addr == 16'h242 ? 16'h0200 :  // <0280> a = 0
addr == 16'h243 ? 16'he407 :  // <0281> bn eq :fail
addr == 16'h244 ? 16'h025e :  // <0281> "

addr == 16'h245 ? 16'hfba0 :  // <0283> getchar_echo
addr == 16'h246 ? 16'h0011 :  // <0283> "
addr == 16'h247 ? 16'hfc00 :  // <0283> "
addr == 16'h248 ? 16'h2000 :  // <0283> push a // "
addr == 16'h249 ? 16'hfba0 :  // <0283> "
addr == 16'h24a ? 16'h0002 :  // <0283> "
addr == 16'h24b ? 16'hfc00 :  // <0283> "
addr == 16'h24c ? 16'h0008 :  // <0283> pop a // "
addr == 16'h24d ? 16'h063d :  // <0284> b = 61 // asc b = "="
addr == 16'h24e ? 16'he407 :  // <0285> bn eq :fail
addr == 16'h24f ? 16'h025e :  // <0285> "

// parse value to poke.
addr == 16'h250 ? 16'hfba0 :  // <0288> call :get4x
addr == 16'h251 ? 16'h0096 :  // <0288> "
addr == 16'h252 ? 16'hfc00 :  // <0288> "
addr == 16'h253 ? 16'h3800 :  // <0289> poke_data = a
addr == 16'h254 ? 16'h0200 :  // <0290> a = 0
addr == 16'h255 ? 16'he407 :  // <0291> bn eq :fail
addr == 16'h256 ? 16'h025e :  // <0291> "

addr == 16'h257 ? 16'h0004 :  // <0293> a = x
addr == 16'h258 ? 16'hfba0 :  // <0294> call :poke
addr == 16'h259 ? 16'h0276 :  // <0294> "
addr == 16'h25a ? 16'hfc00 :  // <0294> "
addr == 16'h25b ? 16'hf808 :  // <0295> pop rtna // rtn
addr == 16'h25c ? 16'h1008 :  // <0295> pop x // "
addr == 16'h25d ? 16'hfc00 :  // <0295> rtn

// :fail // = 0x025e
addr == 16'h25e ? 16'h023f :  // <0298> a = 63 // putasc "?"
addr == 16'h25f ? 16'hfba0 :  // <0298> putasc "?"
addr == 16'h260 ? 16'h0002 :  // <0298> "
addr == 16'h261 ? 16'hfc00 :  // <0298> "
addr == 16'h262 ? 16'h020d :  // <0299> a = 13 // puteol
addr == 16'h263 ? 16'hfba0 :  // <0299> puteol
addr == 16'h264 ? 16'h0002 :  // <0299> "
addr == 16'h265 ? 16'hfc00 :  // <0299> "
addr == 16'h266 ? 16'h020a :  // <0299> a = 10 // puteol
addr == 16'h267 ? 16'hfba0 :  // <0299> puteol
addr == 16'h268 ? 16'h0002 :  // <0299> "
addr == 16'h269 ? 16'hfc00 :  // <0299> "
addr == 16'h26a ? 16'hf808 :  // <0300> pop rtna // end_func
addr == 16'h26b ? 16'h1008 :  // <0300> pop x // "
addr == 16'h26c ? 16'hfc00 :  // <0300> end_func

// force execution of the opcode passed in force_opcode.
// ######## func force_instruction // = 0x026d
addr == 16'h26d ? 16'h3e04 :  // <0304> bus_ctrl = $divert_code_bus_mask
addr == 16'h26e ? 16'h4201 :  // <0305> tg_force = $hold_state_mask
addr == 16'h26f ? 16'h4203 :  // <0306> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h270 ? 16'h4205 :  // <0307> tg_force = ($hold_state_mask | $force_exec_mask)
addr == 16'h271 ? 16'h4201 :  // <0308> tg_force = $hold_state_mask
// refill target exr so it can resume seamlessly.
addr == 16'h272 ? 16'h3415 :  // <0310> force_opcode = exr_shadow
addr == 16'h273 ? 16'h4203 :  // <0311> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h274 ? 16'h4200 :  // <0312> tg_force = 0
addr == 16'h275 ? 16'hfc00 :  // <0313> end_func

// poke a register.  pass the value in poke_data.
// pass its register address in a.
// ######## func poke // = 0x0276
addr == 16'h276 ? 16'h203e :  // <0317> push rtna // func poke
addr == 16'h277 ? 16'h07a0 :  // <0319> b = $dest_mask
addr == 16'h278 ? 16'hfc00 :  // <0319> "
addr == 16'h279 ? 16'hc800 :  // <0320> a = and
addr == 16'h27a ? 16'h0330 :  // <0320> "
addr == 16'h27b ? 16'h07a0 :  // <0321> b = ([src dbgpoke])
addr == 16'h27c ? 16'h03c0 :  // <0321> "
addr == 16'h27d ? 16'hc800 :  // <0322> force_opcode = or
addr == 16'h27e ? 16'h3734 :  // <0322> "
addr == 16'h27f ? 16'hfba0 :  // <0323> call :force_instruction
addr == 16'h280 ? 16'h026d :  // <0323> "
addr == 16'h281 ? 16'hfc00 :  // <0323> "
addr == 16'h282 ? 16'hf808 :  // <0324> pop rtna // end_func
addr == 16'h283 ? 16'hfc00 :  // <0324> end_func

// observe a register.  return its value in peek_data.
// pass its register address in a.
// ######## func peek // = 0x0284
addr == 16'h284 ? 16'h203e :  // <0328> push rtna // func peek
addr == 16'h285 ? 16'h07a0 :  // <0330> b = $src_mask
addr == 16'h286 ? 16'h03ff :  // <0330> "
addr == 16'h287 ? 16'hc800 :  // <0331> a = and
addr == 16'h288 ? 16'h0330 :  // <0331> "
addr == 16'h289 ? 16'h07a0 :  // <0332> b = ([dest nop] << $dest_lsb)
addr == 16'h28a ? 16'hc800 :  // <0332> "
addr == 16'h28b ? 16'hc800 :  // <0333> force_opcode = or
addr == 16'h28c ? 16'h3734 :  // <0333> "
addr == 16'h28d ? 16'hfba0 :  // <0334> call :force_instruction
addr == 16'h28e ? 16'h026d :  // <0334> "
addr == 16'h28f ? 16'hfc00 :  // <0334> "
// target's register value is now in peek_data.
addr == 16'h290 ? 16'hf808 :  // <0336> pop rtna // end_func
addr == 16'h291 ? 16'hfc00 :  // <0336> end_func

// show target status display.
// ######## func dump_target // = 0x0292
addr == 16'h292 ? 16'h2002 :  // <0339> push i // func dump_target
addr == 16'h293 ? 16'h2003 :  // <0339> push j // "
addr == 16'h294 ? 16'h203e :  // <0339> push rtna // "
addr == 16'h295 ? 16'h020d :  // <0340> a = 13 // puteol
addr == 16'h296 ? 16'hfba0 :  // <0340> puteol
addr == 16'h297 ? 16'h0002 :  // <0340> "
addr == 16'h298 ? 16'hfc00 :  // <0340> "
addr == 16'h299 ? 16'h020a :  // <0340> a = 10 // puteol
addr == 16'h29a ? 16'hfba0 :  // <0340> puteol
addr == 16'h29b ? 16'h0002 :  // <0340> "
addr == 16'h29c ? 16'hfc00 :  // <0340> "
addr == 16'h29d ? 16'h0a00 :  // <0341> i = 0
addr == 16'h29e ? 16'h0e01 :  // <0342> j = 1
// :next_reg // = 0x029f
// fetch register name from table in target program.
// i = register number.
// peek is skipped for any reg name starting with 2 slashes (good for read-sensitive regs).
addr == 16'h29f ? 16'h0002 :  // <0347> a = i
addr == 16'h2a0 ? 16'h0351 :  // <0348> a = a<<1
addr == 16'h2a1 ? 16'h0351 :  // <0349> a = a<<1
addr == 16'h2a2 ? 16'h0603 :  // <0350> b = 3
addr == 16'h2a3 ? 16'hc800 :  // <0351> a = a+b
addr == 16'h2a4 ? 16'h0300 :  // <0351> "
addr == 16'h2a5 ? 16'h0404 :  // <0352> b = x
addr == 16'h2a6 ? 16'hc800 :  // <0353> m9k_addr = a+b
addr == 16'h2a7 ? 16'h4f00 :  // <0353> "
addr == 16'h2a8 ? 16'h0014 :  // <0354> a = m9k_data
addr == 16'h2a9 ? 16'h07a0 :  // <0355> b = 0x2f2f
addr == 16'h2aa ? 16'h2f2f :  // <0355> "
addr == 16'h2ab ? 16'he007 :  // <0356> br eq :no_peek
addr == 16'h2ac ? 16'h02ce :  // <0356> "
addr == 16'h2ad ? 16'h0220 :  // <0357> a = 32 // putasc " "
addr == 16'h2ae ? 16'hfba0 :  // <0357> putasc " "
addr == 16'h2af ? 16'h0002 :  // <0357> "
addr == 16'h2b0 ? 16'hfc00 :  // <0357> "
addr == 16'h2b1 ? 16'h0220 :  // <0358> a = 32 // putasc " "
addr == 16'h2b2 ? 16'hfba0 :  // <0358> putasc " "
addr == 16'h2b3 ? 16'h0002 :  // <0358> "
addr == 16'h2b4 ? 16'hfc00 :  // <0358> "
addr == 16'h2b5 ? 16'h0013 :  // <0359> a = m9k_addr
addr == 16'h2b6 ? 16'h0608 :  // <0360> b = 8
addr == 16'h2b7 ? 16'hfba0 :  // <0361> call :print_fixed_target
addr == 16'h2b8 ? 16'h02d9 :  // <0361> "
addr == 16'h2b9 ? 16'hfc00 :  // <0361> "
addr == 16'h2ba ? 16'h023d :  // <0362> a = 61 // putasc "="
addr == 16'h2bb ? 16'hfba0 :  // <0362> putasc "="
addr == 16'h2bc ? 16'h0002 :  // <0362> "
addr == 16'h2bd ? 16'hfc00 :  // <0362> "
addr == 16'h2be ? 16'h0002 :  // <0363> a = i
addr == 16'h2bf ? 16'hfba0 :  // <0364> call :peek
addr == 16'h2c0 ? 16'h0284 :  // <0364> "
addr == 16'h2c1 ? 16'hfc00 :  // <0364> "
addr == 16'h2c2 ? 16'h0017 :  // <0365> a = peek_data
addr == 16'h2c3 ? 16'hfba0 :  // <0366> call :put4x
addr == 16'h2c4 ? 16'h005d :  // <0366> "
addr == 16'h2c5 ? 16'hfc00 :  // <0366> "
addr == 16'h2c6 ? 16'h020d :  // <0367> a = 13 // puteol
addr == 16'h2c7 ? 16'hfba0 :  // <0367> puteol
addr == 16'h2c8 ? 16'h0002 :  // <0367> "
addr == 16'h2c9 ? 16'hfc00 :  // <0367> "
addr == 16'h2ca ? 16'h020a :  // <0367> a = 10 // puteol
addr == 16'h2cb ? 16'hfba0 :  // <0367> puteol
addr == 16'h2cc ? 16'h0002 :  // <0367> "
addr == 16'h2cd ? 16'hfc00 :  // <0367> "
// :no_peek // = 0x02ce
addr == 16'h2ce ? 16'hc800 :  // <0369> i = i+j
addr == 16'h2cf ? 16'h0b10 :  // <0369> "
// loop up to the number of registers in the target program's register name table.
addr == 16'h2d0 ? 16'h4e02 :  // <0371> m9k_addr = 2
addr == 16'h2d1 ? 16'h0414 :  // <0372> b = m9k_data
addr == 16'h2d2 ? 16'h0002 :  // <0373> a = i
addr == 16'h2d3 ? 16'he407 :  // <0374> bn eq :next_reg
addr == 16'h2d4 ? 16'h029f :  // <0374> "
addr == 16'h2d5 ? 16'hf808 :  // <0375> pop rtna // end_func
addr == 16'h2d6 ? 16'h0c08 :  // <0375> pop j // "
addr == 16'h2d7 ? 16'h0808 :  // <0375> pop i // "
addr == 16'h2d8 ? 16'hfc00 :  // <0375> end_func

// print a fixed-length string from packed words in TARGET program space.
// pass its word address (not its byte address) in a,  its length (bytes) in b.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_fixed_target // = 0x02d9
addr == 16'h2d9 ? 16'h2002 :  // <0381> push i // func print_fixed_target
addr == 16'h2da ? 16'h2003 :  // <0381> push j // "
addr == 16'h2db ? 16'h2004 :  // <0381> push x // "
addr == 16'h2dc ? 16'h2005 :  // <0381> push y // "
addr == 16'h2dd ? 16'h2006 :  // <0381> push g6 // "
addr == 16'h2de ? 16'h203e :  // <0381> push rtna // "
addr == 16'h2df ? 16'h0800 :  // <0382> i = a
addr == 16'h2e0 ? 16'h0e01 :  // <0383> j = 1
addr == 16'h2e1 ? 16'h1001 :  // <0384> x = b
addr == 16'h2e2 ? 16'h1760 :  // <0385> y = -1
// :next_word // = 0x02e3
addr == 16'h2e3 ? 16'he002 :  // <0387> br xz :done
addr == 16'h2e4 ? 16'h02f9 :  // <0387> "
addr == 16'h2e5 ? 16'h1320 :  // <0388> x = ad2
addr == 16'h2e6 ? 16'h4c02 :  // <0389> m9k_addr = i
addr == 16'h2e7 ? 16'h1814 :  // <0390> g6 = m9k_data
// now x = bytes remaining, i = current word address, g6 = data word.
addr == 16'h2e8 ? 16'h0006 :  // <0392> a = g6 // putchar g6
addr == 16'h2e9 ? 16'hfba0 :  // <0392> putchar g6
addr == 16'h2ea ? 16'h0002 :  // <0392> "
addr == 16'h2eb ? 16'hfc00 :  // <0392> "
addr == 16'h2ec ? 16'he002 :  // <0393> br xz :done
addr == 16'h2ed ? 16'h02f9 :  // <0393> "
addr == 16'h2ee ? 16'h1320 :  // <0394> x = ad2
addr == 16'h2ef ? 16'h0006 :  // <0395> a = g6
addr == 16'h2f0 ? 16'h0353 :  // <0396> a = a>>4
addr == 16'h2f1 ? 16'h0353 :  // <0397> a = a>>4
addr == 16'h2f2 ? 16'hfba0 :  // <0398> putchar a
addr == 16'h2f3 ? 16'h0002 :  // <0398> "
addr == 16'h2f4 ? 16'hfc00 :  // <0398> "
addr == 16'h2f5 ? 16'hc800 :  // <0399> i = i+j
addr == 16'h2f6 ? 16'h0b10 :  // <0399> "
addr == 16'h2f7 ? 16'he00f :  // <0400> jmp :next_word
addr == 16'h2f8 ? 16'h02e3 :  // <0400> "
// :done // = 0x02f9
addr == 16'h2f9 ? 16'hf808 :  // <0402> pop rtna // end_func
addr == 16'h2fa ? 16'h1808 :  // <0402> pop g6 // "
addr == 16'h2fb ? 16'h1408 :  // <0402> pop y // "
addr == 16'h2fc ? 16'h1008 :  // <0402> pop x // "
addr == 16'h2fd ? 16'h0c08 :  // <0402> pop j // "
addr == 16'h2fe ? 16'h0808 :  // <0402> pop i // "
addr == 16'h2ff ? 16'hfc00 :  // <0402> end_func

// ######## func load_program // = 0x0300
addr == 16'h300 ? 16'h2002 :  // <0404> push i // func load_program
addr == 16'h301 ? 16'h2003 :  // <0404> push j // "
addr == 16'h302 ? 16'h2004 :  // <0404> push x // "
addr == 16'h303 ? 16'h203e :  // <0404> push rtna // "
// load target program from UART.

// length, little-endian.  memorize in x.
addr == 16'h304 ? 16'h020d :  // <0408> a = 13 // puteol
addr == 16'h305 ? 16'hfba0 :  // <0408> puteol
addr == 16'h306 ? 16'h0002 :  // <0408> "
addr == 16'h307 ? 16'hfc00 :  // <0408> "
addr == 16'h308 ? 16'h020a :  // <0408> a = 10 // puteol
addr == 16'h309 ? 16'hfba0 :  // <0408> puteol
addr == 16'h30a ? 16'h0002 :  // <0408> "
addr == 16'h30b ? 16'hfc00 :  // <0408> "
addr == 16'h30c ? 16'h024c :  // <0409> a = 76 // putasc L
addr == 16'h30d ? 16'hfba0 :  // <0409> putasc L
addr == 16'h30e ? 16'h0002 :  // <0409> "
addr == 16'h30f ? 16'hfc00 :  // <0409> "
addr == 16'h310 ? 16'hfba0 :  // <0410> get16 x
addr == 16'h311 ? 16'h0011 :  // <0410> "
addr == 16'h312 ? 16'hfc00 :  // <0410> "
addr == 16'h313 ? 16'h2000 :  // <0410> push a // "
addr == 16'h314 ? 16'hfba0 :  // <0410> "
addr == 16'h315 ? 16'h0011 :  // <0410> "
addr == 16'h316 ? 16'hfc00 :  // <0410> "
addr == 16'h317 ? 16'h0352 :  // <0410> "
addr == 16'h318 ? 16'h0352 :  // <0410> "
addr == 16'h319 ? 16'h0408 :  // <0410> pop b // "
addr == 16'h31a ? 16'hc800 :  // <0410> "
addr == 16'h31b ? 16'h1334 :  // <0410> "
addr == 16'h31c ? 16'h0004 :  // <0411> a = x
addr == 16'h31d ? 16'hfba0 :  // <0412> call :put4x
addr == 16'h31e ? 16'h005d :  // <0412> "
addr == 16'h31f ? 16'hfc00 :  // <0412> "
addr == 16'h320 ? 16'h020d :  // <0413> a = 13 // puteol
addr == 16'h321 ? 16'hfba0 :  // <0413> puteol
addr == 16'h322 ? 16'h0002 :  // <0413> "
addr == 16'h323 ? 16'hfc00 :  // <0413> "
addr == 16'h324 ? 16'h020a :  // <0413> a = 10 // puteol
addr == 16'h325 ? 16'hfba0 :  // <0413> puteol
addr == 16'h326 ? 16'h0002 :  // <0413> "
addr == 16'h327 ? 16'hfc00 :  // <0413> "

// put target into reset again, in case this is a target warm boot.
addr == 16'h328 ? 16'h3e02 :  // <0416> bus_ctrl = $tg_reset_mask

// load opcodes.  count up address in i.
addr == 16'h329 ? 16'h0a00 :  // <0419> i = 0
addr == 16'h32a ? 16'h0e01 :  // <0420> j = 1
addr == 16'h32b ? 16'hfba0 :  // <0421> call :fletcher16_init
addr == 16'h32c ? 16'h011b :  // <0421> "
addr == 16'h32d ? 16'hfc00 :  // <0421> "
// :loadword // = 0x032e
// receive, store in RAM.
addr == 16'h32e ? 16'hfba0 :  // <0424> get16 a
addr == 16'h32f ? 16'h0011 :  // <0424> "
addr == 16'h330 ? 16'hfc00 :  // <0424> "
addr == 16'h331 ? 16'h2000 :  // <0424> push a // "
addr == 16'h332 ? 16'hfba0 :  // <0424> "
addr == 16'h333 ? 16'h0011 :  // <0424> "
addr == 16'h334 ? 16'hfc00 :  // <0424> "
addr == 16'h335 ? 16'h0352 :  // <0424> "
addr == 16'h336 ? 16'h0352 :  // <0424> "
addr == 16'h337 ? 16'h0408 :  // <0424> pop b // "
addr == 16'h338 ? 16'hc800 :  // <0424> "
addr == 16'h339 ? 16'h0334 :  // <0424> "
addr == 16'h33a ? 16'h4c02 :  // <0425> m9k_addr = i
addr == 16'h33b ? 16'h5000 :  // <0426> m9k_data = a

// read back from RAM and build checksum.
addr == 16'h33c ? 16'h0014 :  // <0429> a = m9k_data
addr == 16'h33d ? 16'hfba0 :  // <0430> call :fletcher16_input16
addr == 16'h33e ? 16'h013a :  // <0430> "
addr == 16'h33f ? 16'hfc00 :  // <0430> "

//  show decimated feedback text, for more speed:
addr == 16'h340 ? 16'h0002 :  // <0433> a = i
addr == 16'h341 ? 16'h061f :  // <0434> b = 0x1f
addr == 16'h342 ? 16'he403 :  // <0435> bn and0z :skip_text
addr == 16'h343 ? 16'h0348 :  // <0435> "
addr == 16'h344 ? 16'h022e :  // <0436> a = 46 // putasc "."
addr == 16'h345 ? 16'hfba0 :  // <0436> putasc "."
addr == 16'h346 ? 16'h0002 :  // <0436> "
addr == 16'h347 ? 16'hfc00 :  // <0436> "
// :skip_text // = 0x0348

addr == 16'h348 ? 16'hc800 :  // <0439> i = i+j
addr == 16'h349 ? 16'h0b10 :  // <0439> "
addr == 16'h34a ? 16'h0002 :  // <0440> a = i
addr == 16'h34b ? 16'h0404 :  // <0441> b = x
addr == 16'h34c ? 16'he407 :  // <0442> bn eq :loadword
addr == 16'h34d ? 16'h032e :  // <0442> "
addr == 16'h34e ? 16'h020d :  // <0443> a = 13 // puteol
addr == 16'h34f ? 16'hfba0 :  // <0443> puteol
addr == 16'h350 ? 16'h0002 :  // <0443> "
addr == 16'h351 ? 16'hfc00 :  // <0443> "
addr == 16'h352 ? 16'h020a :  // <0443> a = 10 // puteol
addr == 16'h353 ? 16'hfba0 :  // <0443> puteol
addr == 16'h354 ? 16'h0002 :  // <0443> "
addr == 16'h355 ? 16'hfc00 :  // <0443> "
addr == 16'h356 ? 16'hfba0 :  // <0444> call :fletcher16_result
addr == 16'h357 ? 16'h014b :  // <0444> "
addr == 16'h358 ? 16'hfc00 :  // <0444> "
addr == 16'h359 ? 16'hfba0 :  // <0445> call :put4x
addr == 16'h35a ? 16'h005d :  // <0445> "
addr == 16'h35b ? 16'hfc00 :  // <0445> "
addr == 16'h35c ? 16'h020d :  // <0446> a = 13 // puteol
addr == 16'h35d ? 16'hfba0 :  // <0446> puteol
addr == 16'h35e ? 16'h0002 :  // <0446> "
addr == 16'h35f ? 16'hfc00 :  // <0446> "
addr == 16'h360 ? 16'h020a :  // <0446> a = 10 // puteol
addr == 16'h361 ? 16'hfba0 :  // <0446> puteol
addr == 16'h362 ? 16'h0002 :  // <0446> "
addr == 16'h363 ? 16'hfc00 :  // <0446> "
addr == 16'h364 ? 16'hf808 :  // <0447> pop rtna // end_func
addr == 16'h365 ? 16'h1008 :  // <0447> pop x // "
addr == 16'h366 ? 16'h0c08 :  // <0447> pop j // "
addr == 16'h367 ? 16'h0808 :  // <0447> pop i // "
addr == 16'h368 ? 16'hfc00 :  // <0447> end_func


        
                16'hxxxx;
        endmodule
    
