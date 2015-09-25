
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
addr == 16'h01 ? 16'h014b :  // <0071> "


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
addr == 16'h13 ? 16'h0204 :  // <0069> a = $arx_busy_mask
// :wait_for_busy // = 0x0014
addr == 16'h14 ? 16'h0412 :  // <0071> b = atx_ctrl
addr == 16'h15 ? 16'he003 :  // <0072> br and0z :wait_for_busy
addr == 16'h16 ? 16'h0014 :  // <0072> "
// :wait_for_idle // = 0x0017
addr == 16'h17 ? 16'h0412 :  // <0074> b = atx_ctrl
addr == 16'h18 ? 16'he403 :  // <0075> bn and0z :wait_for_idle
addr == 16'h19 ? 16'h0017 :  // <0075> "
addr == 16'h1a ? 16'h0011 :  // <0076> a = atx_data
addr == 16'h1b ? 16'hfc00 :  // <0077> swapra = nop

// returns a character in a, or -1 if none.
// this version can miss characters if not polled while the character is arriving.
// ######## func pollchar_atx // = 0x001c
// check for UART is busy, then idle.
addr == 16'h1c ? 16'h0204 :  // <0084> a = $arx_busy_mask
addr == 16'h1d ? 16'h0412 :  // <0085> b = atx_ctrl
addr == 16'h1e ? 16'he003 :  // <0086> br and0z :none
addr == 16'h1f ? 16'h0025 :  // <0086> "
// :wait_for_idle // = 0x0020
addr == 16'h20 ? 16'h0412 :  // <0088> b = atx_ctrl
addr == 16'h21 ? 16'he403 :  // <0089> bn and0z :wait_for_idle
addr == 16'h22 ? 16'h0020 :  // <0089> "
addr == 16'h23 ? 16'h0011 :  // <0090> a = atx_data
addr == 16'h24 ? 16'hfc00 :  // <0091> swapra = nop
// :none // = 0x0025
addr == 16'h25 ? 16'h0360 :  // <0094> a = -1
addr == 16'h26 ? 16'hfc00 :  // <0095> swapra = nop



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
addr == 16'h32 ? 16'h0350 :  // <0015> a = a>>1
addr == 16'h33 ? 16'h0404 :  // <0016> b = x
addr == 16'h34 ? 16'hc800 :  // <0017> fetch a from a+b
addr == 16'h35 ? 16'hd300 :  // <0017> "
addr == 16'h36 ? 16'h03b0 :  // <0017> "
addr == 16'h37 ? 16'h06ff :  // <0018> b = 0xff
addr == 16'h38 ? 16'hc800 :  // <0019> a = and
addr == 16'h39 ? 16'h0330 :  // <0019> "
addr == 16'h3a ? 16'hfc00 :  // <0020> swapra = nop

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// ######## func find_in_fetch // = 0x003b
addr == 16'h3b ? 16'h2002 :  // <0029> push i // func find_in_fetch
addr == 16'h3c ? 16'h2003 :  // <0029> push j // "
addr == 16'h3d ? 16'h2005 :  // <0029> push y // "
addr == 16'h3e ? 16'h203e :  // <0029> push rtna // "
addr == 16'h3f ? 16'h1400 :  // <0030> y = a
addr == 16'h40 ? 16'h0f60 :  // <0031> j = -1
// :again // = 0x0041
addr == 16'h41 ? 16'he001 :  // <0033> br iz :fail
addr == 16'h42 ? 16'h0051 :  // <0033> "
addr == 16'h43 ? 16'h0b10 :  // <0034> i = ad1
addr == 16'h44 ? 16'h0002 :  // <0035> a = i
addr == 16'h45 ? 16'hfba0 :  // <0036> call :fetch_byte
addr == 16'h46 ? 16'h0027 :  // <0036> "
addr == 16'h47 ? 16'hfc00 :  // <0036> "
addr == 16'h48 ? 16'h0405 :  // <0037> b = y
addr == 16'h49 ? 16'he407 :  // <0038> bn eq :again
addr == 16'h4a ? 16'h0041 :  // <0038> "
// :found // = 0x004b
addr == 16'h4b ? 16'h0002 :  // <0040> a = i
addr == 16'h4c ? 16'hf808 :  // <0041> pop rtna // rtn
addr == 16'h4d ? 16'h1408 :  // <0041> pop y // "
addr == 16'h4e ? 16'h0c08 :  // <0041> pop j // "
addr == 16'h4f ? 16'h0808 :  // <0041> pop i // "
addr == 16'h50 ? 16'hfc00 :  // <0041> swapra = nop
// :fail // = 0x0051
addr == 16'h51 ? 16'h0360 :  // <0044> a = -1
addr == 16'h52 ? 16'hf808 :  // <0045> pop rtna // end_func
addr == 16'h53 ? 16'h1408 :  // <0045> pop y // "
addr == 16'h54 ? 16'h0c08 :  // <0045> pop j // "
addr == 16'h55 ? 16'h0808 :  // <0045> pop i // "
addr == 16'h56 ? 16'hfc00 :  // <0045> swapra = nop



// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x0057
// "0123456789abcdef"
addr == 16'h57 ? 16'h3130 :  // <0050> 10
addr == 16'h58 ? 16'h3332 :  // <0050> 32
addr == 16'h59 ? 16'h3534 :  // <0050> 54
addr == 16'h5a ? 16'h3736 :  // <0050> 76
addr == 16'h5b ? 16'h3938 :  // <0050> 98
addr == 16'h5c ? 16'h6261 :  // <0050> ba
addr == 16'h5d ? 16'h6463 :  // <0050> dc
addr == 16'h5e ? 16'h6665 :  // <0050> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// ######## func put4x // = 0x005f
addr == 16'h5f ? 16'h2004 :  // <0054> push x // func put4x
addr == 16'h60 ? 16'h2006 :  // <0054> push g6 // "
addr == 16'h61 ? 16'h203e :  // <0054> push rtna // "
addr == 16'h62 ? 16'h13a0 :  // <0055> x = :hexdigits
addr == 16'h63 ? 16'h0057 :  // <0055> "

addr == 16'h64 ? 16'h1800 :  // <0057> g6 = a
addr == 16'h65 ? 16'h07a0 :  // <0058> b = 0xF000
addr == 16'h66 ? 16'hf000 :  // <0058> "
addr == 16'h67 ? 16'hc800 :  // <0059> a = and
addr == 16'h68 ? 16'h0330 :  // <0059> "
addr == 16'h69 ? 16'h0353 :  // <0060> a = a>>4
addr == 16'h6a ? 16'h0353 :  // <0061> a = a>>4
addr == 16'h6b ? 16'h0353 :  // <0062> a = a>>4
addr == 16'h6c ? 16'hfba0 :  // <0063> call fetch_byte
addr == 16'h6d ? 16'h0027 :  // <0063> "
addr == 16'h6e ? 16'hfc00 :  // <0063> "
addr == 16'h6f ? 16'hfba0 :  // <0064> putchar a
addr == 16'h70 ? 16'h0004 :  // <0064> "
addr == 16'h71 ? 16'hfc00 :  // <0064> "

addr == 16'h72 ? 16'h0006 :  // <0066> a = g6
addr == 16'h73 ? 16'h07a0 :  // <0067> b = 0x0F00
addr == 16'h74 ? 16'h0f00 :  // <0067> "
addr == 16'h75 ? 16'hc800 :  // <0068> a = and
addr == 16'h76 ? 16'h0330 :  // <0068> "
addr == 16'h77 ? 16'h0353 :  // <0069> a = a>>4
addr == 16'h78 ? 16'h0353 :  // <0070> a = a>>4
addr == 16'h79 ? 16'hfba0 :  // <0071> call fetch_byte
addr == 16'h7a ? 16'h0027 :  // <0071> "
addr == 16'h7b ? 16'hfc00 :  // <0071> "
addr == 16'h7c ? 16'hfba0 :  // <0072> putchar a
addr == 16'h7d ? 16'h0004 :  // <0072> "
addr == 16'h7e ? 16'hfc00 :  // <0072> "

addr == 16'h7f ? 16'h0006 :  // <0074> a = g6
addr == 16'h80 ? 16'h06f0 :  // <0075> b = 0x00F0
addr == 16'h81 ? 16'hc800 :  // <0076> a = and
addr == 16'h82 ? 16'h0330 :  // <0076> "
addr == 16'h83 ? 16'h0353 :  // <0077> a = a>>4
addr == 16'h84 ? 16'hfba0 :  // <0078> call fetch_byte
addr == 16'h85 ? 16'h0027 :  // <0078> "
addr == 16'h86 ? 16'hfc00 :  // <0078> "
addr == 16'h87 ? 16'hfba0 :  // <0079> putchar a
addr == 16'h88 ? 16'h0004 :  // <0079> "
addr == 16'h89 ? 16'hfc00 :  // <0079> "

addr == 16'h8a ? 16'h0006 :  // <0081> a = g6
addr == 16'h8b ? 16'h060f :  // <0082> b = 0x000F
addr == 16'h8c ? 16'hc800 :  // <0083> a = and
addr == 16'h8d ? 16'h0330 :  // <0083> "
addr == 16'h8e ? 16'hfba0 :  // <0084> call fetch_byte
addr == 16'h8f ? 16'h0027 :  // <0084> "
addr == 16'h90 ? 16'hfc00 :  // <0084> "
addr == 16'h91 ? 16'hfba0 :  // <0085> putchar a
addr == 16'h92 ? 16'h0004 :  // <0085> "
addr == 16'h93 ? 16'hfc00 :  // <0085> "

addr == 16'h94 ? 16'hf808 :  // <0087> pop rtna // end_func
addr == 16'h95 ? 16'h1808 :  // <0087> pop g6 // "
addr == 16'h96 ? 16'h1008 :  // <0087> pop x // "
addr == 16'h97 ? 16'hfc00 :  // <0087> swapra = nop

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// ######## func get4x // = 0x0098
addr == 16'h98 ? 16'h2002 :  // <0092> push i // func get4x
addr == 16'h99 ? 16'h2003 :  // <0092> push j // "
addr == 16'h9a ? 16'h2004 :  // <0092> push x // "
addr == 16'h9b ? 16'h2005 :  // <0092> push y // "
addr == 16'h9c ? 16'h203e :  // <0092> push rtna // "
// y = digit counter
// j = sum
addr == 16'h9d ? 16'h1604 :  // <0095> y = 4
// :again // = 0x009e
addr == 16'h9e ? 16'hfba0 :  // <0097> getchar
addr == 16'h9f ? 16'h0013 :  // <0097> "
addr == 16'ha0 ? 16'hfc00 :  // <0097> "
addr == 16'ha1 ? 16'h13a0 :  // <0098> x = :hexdigits
addr == 16'ha2 ? 16'h0057 :  // <0098> "
addr == 16'ha3 ? 16'h0a10 :  // <0099> i = 16
addr == 16'ha4 ? 16'hfba0 :  // <0100> call :find_in_fetch
addr == 16'ha5 ? 16'h003b :  // <0100> "
addr == 16'ha6 ? 16'hfc00 :  // <0100> "
addr == 16'ha7 ? 16'h0760 :  // <0101> b = -1
addr == 16'ha8 ? 16'he007 :  // <0102> br eq :fail
addr == 16'ha9 ? 16'h00bd :  // <0102> "
addr == 16'haa ? 16'h0400 :  // <0103> b = a
addr == 16'hab ? 16'h0003 :  // <0104> a = j
addr == 16'hac ? 16'h0352 :  // <0105> a = a<<4
addr == 16'had ? 16'hc800 :  // <0106> j = or
addr == 16'hae ? 16'h0f34 :  // <0106> "
addr == 16'haf ? 16'h1360 :  // <0107> x = -1
addr == 16'hb0 ? 16'hc800 :  // <0108> y = x+y
addr == 16'hb1 ? 16'h1720 :  // <0108> "
addr == 16'hb2 ? 16'h0005 :  // <0109> a = y
addr == 16'hb3 ? 16'he400 :  // <0110> bn az :again
addr == 16'hb4 ? 16'h009e :  // <0110> "
addr == 16'hb5 ? 16'h0003 :  // <0111> a = j
addr == 16'hb6 ? 16'h0600 :  // <0112> b = 0
addr == 16'hb7 ? 16'hf808 :  // <0113> pop rtna // rtn
addr == 16'hb8 ? 16'h1408 :  // <0113> pop y // "
addr == 16'hb9 ? 16'h1008 :  // <0113> pop x // "
addr == 16'hba ? 16'h0c08 :  // <0113> pop j // "
addr == 16'hbb ? 16'h0808 :  // <0113> pop i // "
addr == 16'hbc ? 16'hfc00 :  // <0113> swapra = nop
// :fail // = 0x00bd
addr == 16'hbd ? 16'h0760 :  // <0116> b = -1
addr == 16'hbe ? 16'hf808 :  // <0117> pop rtna // end_func
addr == 16'hbf ? 16'h1408 :  // <0117> pop y // "
addr == 16'hc0 ? 16'h1008 :  // <0117> pop x // "
addr == 16'hc1 ? 16'h0c08 :  // <0117> pop j // "
addr == 16'hc2 ? 16'h0808 :  // <0117> pop i // "
addr == 16'hc3 ? 16'hfc00 :  // <0117> swapra = nop

// print a fixed-length string from packed words in program space.
// pass its word address (not its byte address) in a,  its length (bytes) in b.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_fixed // = 0x00c4
addr == 16'hc4 ? 16'h2002 :  // <0124> push i // func print_fixed
addr == 16'hc5 ? 16'h2003 :  // <0124> push j // "
addr == 16'hc6 ? 16'h2004 :  // <0124> push x // "
addr == 16'hc7 ? 16'h2005 :  // <0124> push y // "
addr == 16'hc8 ? 16'h2006 :  // <0124> push g6 // "
addr == 16'hc9 ? 16'h203e :  // <0124> push rtna // "
addr == 16'hca ? 16'h0800 :  // <0125> i = a
addr == 16'hcb ? 16'h0e01 :  // <0126> j = 1
addr == 16'hcc ? 16'h1001 :  // <0127> x = b
addr == 16'hcd ? 16'h1760 :  // <0128> y = -1
// :next_word // = 0x00ce
addr == 16'hce ? 16'he002 :  // <0130> br xz :done
addr == 16'hcf ? 16'h00e4 :  // <0130> "
addr == 16'hd0 ? 16'h1320 :  // <0131> x = ad2
addr == 16'hd1 ? 16'hd002 :  // <0132> fetch g6 from i
addr == 16'hd2 ? 16'h1bb0 :  // <0132> "
// now x = bytes remaining, i = current word address, g6 = data word.
addr == 16'hd3 ? 16'h0006 :  // <0134> a = g6 // putchar g6
addr == 16'hd4 ? 16'hfba0 :  // <0134> putchar g6
addr == 16'hd5 ? 16'h0004 :  // <0134> "
addr == 16'hd6 ? 16'hfc00 :  // <0134> "
addr == 16'hd7 ? 16'he002 :  // <0135> br xz :done
addr == 16'hd8 ? 16'h00e4 :  // <0135> "
addr == 16'hd9 ? 16'h1320 :  // <0136> x = ad2
addr == 16'hda ? 16'h0006 :  // <0137> a = g6
addr == 16'hdb ? 16'h0353 :  // <0138> a = a>>4
addr == 16'hdc ? 16'h0353 :  // <0139> a = a>>4
addr == 16'hdd ? 16'hfba0 :  // <0140> putchar a
addr == 16'hde ? 16'h0004 :  // <0140> "
addr == 16'hdf ? 16'hfc00 :  // <0140> "
addr == 16'he0 ? 16'hc800 :  // <0141> i = i+j
addr == 16'he1 ? 16'h0b10 :  // <0141> "
addr == 16'he2 ? 16'he00f :  // <0142> jmp :next_word
addr == 16'he3 ? 16'h00ce :  // <0142> "
// :done // = 0x00e4
addr == 16'he4 ? 16'hf808 :  // <0144> pop rtna // end_func
addr == 16'he5 ? 16'h1808 :  // <0144> pop g6 // "
addr == 16'he6 ? 16'h1408 :  // <0144> pop y // "
addr == 16'he7 ? 16'h1008 :  // <0144> pop x // "
addr == 16'he8 ? 16'h0c08 :  // <0144> pop j // "
addr == 16'he9 ? 16'h0808 :  // <0144> pop i // "
addr == 16'hea ? 16'hfc00 :  // <0144> swapra = nop

// print a null-terminated string from packed words in program space.
// pass its word address (not its byte address) in a.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_nt // = 0x00eb
addr == 16'heb ? 16'h2002 :  // <0151> push i // func print_nt
addr == 16'hec ? 16'h2003 :  // <0151> push j // "
addr == 16'hed ? 16'h2004 :  // <0151> push x // "
addr == 16'hee ? 16'h203e :  // <0151> push rtna // "
addr == 16'hef ? 16'h0800 :  // <0152> i = a
addr == 16'hf0 ? 16'h0e01 :  // <0153> j = 1
// :next_word // = 0x00f1
addr == 16'hf1 ? 16'hd002 :  // <0155> fetch x from i
addr == 16'hf2 ? 16'h13b0 :  // <0155> "
// now i = current word address, x = data word, b = low byte mask, a = data byte.
addr == 16'hf3 ? 16'h0004 :  // <0157> a = x
addr == 16'hf4 ? 16'h06ff :  // <0158> b = 0xff
addr == 16'hf5 ? 16'he003 :  // <0159> br and0z :done
addr == 16'hf6 ? 16'h0107 :  // <0159> "
addr == 16'hf7 ? 16'hfba0 :  // <0160> putchar a
addr == 16'hf8 ? 16'h0004 :  // <0160> "
addr == 16'hf9 ? 16'hfc00 :  // <0160> "
addr == 16'hfa ? 16'h0004 :  // <0161> a = x
addr == 16'hfb ? 16'h0353 :  // <0162> a = a>>4
addr == 16'hfc ? 16'h0353 :  // <0163> a = a>>4
addr == 16'hfd ? 16'h06ff :  // <0164> b = 0xff
addr == 16'hfe ? 16'he003 :  // <0165> br and0z :done
addr == 16'hff ? 16'h0107 :  // <0165> "
addr == 16'h100 ? 16'hfba0 :  // <0166> putchar a
addr == 16'h101 ? 16'h0004 :  // <0166> "
addr == 16'h102 ? 16'hfc00 :  // <0166> "
addr == 16'h103 ? 16'hc800 :  // <0167> i = i+j
addr == 16'h104 ? 16'h0b10 :  // <0167> "
addr == 16'h105 ? 16'he00f :  // <0168> jmp :next_word
addr == 16'h106 ? 16'h00f1 :  // <0168> "
// :done // = 0x0107
addr == 16'h107 ? 16'hf808 :  // <0170> pop rtna // end_func
addr == 16'h108 ? 16'h1008 :  // <0170> pop x // "
addr == 16'h109 ? 16'h0c08 :  // <0170> pop j // "
addr == 16'h10a ? 16'h0808 :  // <0170> pop i // "
addr == 16'h10b ? 16'hfc00 :  // <0170> swapra = nop




// ######## func fletcher16_init // = 0x010c
addr == 16'h10c ? 16'h1a00 :  // <0005> $fletcher_sum1_reg = 0
addr == 16'h10d ? 16'h1e00 :  // <0006> $fletcher_sum2_reg = 0
addr == 16'h10e ? 16'hfc00 :  // <0007> swapra = nop

// compute the modulus(255) of a number given in a.  return remainder in a.
// ######## func mod255 // = 0x010f
// while a is greater than 254, subtract 255.
// :mod255_again // = 0x010f
addr == 16'h10f ? 16'h06fe :  // <0014> b = 0xfe
addr == 16'h110 ? 16'he006 :  // <0015> br gt :mod255_greater
addr == 16'h111 ? 16'h0113 :  // <0015> "
addr == 16'h112 ? 16'hfc00 :  // <0016> swapra = nop
// :mod255_greater // = 0x0113
addr == 16'h113 ? 16'h07a0 :  // <0019> b = 0xff01
addr == 16'h114 ? 16'hff01 :  // <0019> "
addr == 16'h115 ? 16'hc800 :  // <0020> a = a+b
addr == 16'h116 ? 16'h0300 :  // <0020> "
addr == 16'h117 ? 16'he00f :  // <0021> jmp :mod255_again
addr == 16'h118 ? 16'h010f :  // <0021> "
addr == 16'h119 ? 16'hfc00 :  // <0022> swapra = nop

// accumulate a Fletcher16 checksum, given the next byte of data in a.
// ######## func fletcher16_input8 // = 0x011a
addr == 16'h11a ? 16'h203e :  // <0026> push rtna // func fletcher16_input8
addr == 16'h11b ? 16'h0406 :  // <0027> b = $fletcher_sum1_reg
addr == 16'h11c ? 16'hc800 :  // <0028> a = a+b
addr == 16'h11d ? 16'h0300 :  // <0028> "
addr == 16'h11e ? 16'hfba0 :  // <0029> call :mod255
addr == 16'h11f ? 16'h010f :  // <0029> "
addr == 16'h120 ? 16'hfc00 :  // <0029> "
addr == 16'h121 ? 16'h1800 :  // <0030> $fletcher_sum1_reg = a

addr == 16'h122 ? 16'h0407 :  // <0032> b = $fletcher_sum2_reg
addr == 16'h123 ? 16'hc800 :  // <0033> a = a+b
addr == 16'h124 ? 16'h0300 :  // <0033> "
addr == 16'h125 ? 16'hfba0 :  // <0034> call :mod255
addr == 16'h126 ? 16'h010f :  // <0034> "
addr == 16'h127 ? 16'hfc00 :  // <0034> "
addr == 16'h128 ? 16'h1c00 :  // <0035> $fletcher_sum2_reg = a
addr == 16'h129 ? 16'hf808 :  // <0036> pop rtna // end_func
addr == 16'h12a ? 16'hfc00 :  // <0036> swapra = nop

// accumulate a Fletcher16 checksum, given the next word of data in a.
// ######## func fletcher16_input16 // = 0x012b
addr == 16'h12b ? 16'h2002 :  // <0040> push i // func fletcher16_input16
addr == 16'h12c ? 16'h203e :  // <0040> push rtna // "
addr == 16'h12d ? 16'h0b53 :  // <0041> i = a>>4
addr == 16'h12e ? 16'h06ff :  // <0042> b = 0xff
addr == 16'h12f ? 16'hc800 :  // <0043> a = and
addr == 16'h130 ? 16'h0330 :  // <0043> "
addr == 16'h131 ? 16'hfba0 :  // <0044> call :fletcher16_input8
addr == 16'h132 ? 16'h011a :  // <0044> "
addr == 16'h133 ? 16'hfc00 :  // <0044> "
addr == 16'h134 ? 16'h0002 :  // <0045> a = i
addr == 16'h135 ? 16'h0353 :  // <0046> a = a>>4
addr == 16'h136 ? 16'hfba0 :  // <0047> call :fletcher16_input8
addr == 16'h137 ? 16'h011a :  // <0047> "
addr == 16'h138 ? 16'hfc00 :  // <0047> "
addr == 16'h139 ? 16'hf808 :  // <0048> pop rtna // end_func
addr == 16'h13a ? 16'h0808 :  // <0048> pop i // "
addr == 16'h13b ? 16'hfc00 :  // <0048> swapra = nop

// return the combined 16-bit result of Fletcher16 checksum in a.
// ######## func fletcher16_result // = 0x013c
addr == 16'h13c ? 16'h0007 :  // <0053> a = $fletcher_sum2_reg
addr == 16'h13d ? 16'h0352 :  // <0054> a = a<<4
addr == 16'h13e ? 16'h0352 :  // <0055> a = a<<4
addr == 16'h13f ? 16'h0406 :  // <0056> b = $fletcher_sum1_reg
addr == 16'h140 ? 16'hc800 :  // <0057> a = or
addr == 16'h141 ? 16'h0334 :  // <0057> "
addr == 16'h142 ? 16'hfc00 :  // <0058> swapra = nop




// :boot_msg // = 0x0143
// "\r\nVISOR\x0"
addr == 16'h143 ? 16'h0a0d :  // <0090>   
addr == 16'h144 ? 16'h4956 :  // <0090> IV
addr == 16'h145 ? 16'h4f53 :  // <0090> OS
addr == 16'h146 ? 16'h0052 :  // <0090>  R
// :running_msg // = 0x0147
// "\r\nRUN >\x0"
addr == 16'h147 ? 16'h0a0d :  // <0092>   
addr == 16'h148 ? 16'h5552 :  // <0092> UR
addr == 16'h149 ? 16'h204e :  // <0092>  N
addr == 16'h14a ? 16'h003e :  // <0092>  >

// ////////////////////////////////////////////
// :main // = 0x014b
// put target into reset.
addr == 16'h14b ? 16'h3e02 :  // <0097> bus_ctrl = $tg_reset_mask

// init visor.
addr == 16'h14c ? 16'h3360 :  // <0100> bp3_addr = $bp_disable
addr == 16'h14d ? 16'h2f60 :  // <0101> bp2_addr = $bp_disable
addr == 16'h14e ? 16'h2b60 :  // <0102> bp1_addr = $bp_disable
addr == 16'h14f ? 16'h2760 :  // <0103> bp0_addr = $bp_disable

// startup message
addr == 16'h150 ? 16'h03a0 :  // <0106> a = :boot_msg
addr == 16'h151 ? 16'h0143 :  // <0106> "
addr == 16'h152 ? 16'hfba0 :  // <0107> call :print_nt
addr == 16'h153 ? 16'h00eb :  // <0107> "
addr == 16'h154 ? 16'hfc00 :  // <0107> "

// check for bootloader signal.
addr == 16'h155 ? 16'h0019 :  // <0110> a = boot_break
addr == 16'h156 ? 16'he400 :  // <0111> bn az :boot_run
addr == 16'h157 ? 16'h015e :  // <0111> "
// ^^^ for press-to-debug; runs target by default.
// br az :boot_run
// ^^^ for press-to-run; debugs target by default.

// step into the first target instruction.
addr == 16'h158 ? 16'h3e08 :  // <0117> bus_ctrl = $bp_step_mask
addr == 16'h159 ? 16'hfba0 :  // <0118> call :wait_for_bp
addr == 16'h15a ? 16'h02c7 :  // <0118> "
addr == 16'h15b ? 16'hfc00 :  // <0118> "
addr == 16'h15c ? 16'he00f :  // <0119> jmp :cmd_loop
addr == 16'h15d ? 16'h015f :  // <0119> "
// :boot_run // = 0x015e
// release target reset, to run.
addr == 16'h15e ? 16'h3e00 :  // <0122> bus_ctrl = 0

// command prompt loop.
// :cmd_loop // = 0x015f
addr == 16'h15f ? 16'h000f :  // <0126> a = bus_ctrl
addr == 16'h160 ? 16'h0600 :  // <0127> b = 0
addr == 16'h161 ? 16'he007 :  // <0128> br eq :running_prompt
addr == 16'h162 ? 16'h0184 :  // <0128> "

addr == 16'h163 ? 16'hfba0 :  // <0130> call :dump_target
addr == 16'h164 ? 16'h036f :  // <0130> "
addr == 16'h165 ? 16'hfc00 :  // <0130> "
addr == 16'h166 ? 16'h0016 :  // <0131> a = tg_code_addr
addr == 16'h167 ? 16'hfba0 :  // <0132> call :put4x
addr == 16'h168 ? 16'h005f :  // <0132> "
addr == 16'h169 ? 16'hfc00 :  // <0132> "
addr == 16'h16a ? 16'h022c :  // <0133> a = 44 // putasc ","
addr == 16'h16b ? 16'hfba0 :  // <0133> putasc ","
addr == 16'h16c ? 16'h0004 :  // <0133> "
addr == 16'h16d ? 16'hfc00 :  // <0133> "
addr == 16'h16e ? 16'h0015 :  // <0134> a = exr_shadow
addr == 16'h16f ? 16'hfba0 :  // <0135> call :put4x
addr == 16'h170 ? 16'h005f :  // <0135> "
addr == 16'h171 ? 16'hfc00 :  // <0135> "
addr == 16'h172 ? 16'h0220 :  // <0136> a = 32 // putasc " "
addr == 16'h173 ? 16'hfba0 :  // <0136> putasc " "
addr == 16'h174 ? 16'h0004 :  // <0136> "
addr == 16'h175 ? 16'hfc00 :  // <0136> "
addr == 16'h176 ? 16'h023e :  // <0137> a = 62 // putasc ">"
addr == 16'h177 ? 16'hfba0 :  // <0137> putasc ">"
addr == 16'h178 ? 16'h0004 :  // <0137> "
addr == 16'h179 ? 16'hfc00 :  // <0137> "
addr == 16'h17a ? 16'hfba0 :  // <0138> getchar_echo
addr == 16'h17b ? 16'h0013 :  // <0138> "
addr == 16'h17c ? 16'hfc00 :  // <0138> "
addr == 16'h17d ? 16'h2000 :  // <0138> push a // "
addr == 16'h17e ? 16'hfba0 :  // <0138> "
addr == 16'h17f ? 16'h0004 :  // <0138> "
addr == 16'h180 ? 16'hfc00 :  // <0138> "
addr == 16'h181 ? 16'h0008 :  // <0138> pop a // "
addr == 16'h182 ? 16'he00f :  // <0139> jmp :parse_cmd
addr == 16'h183 ? 16'h0195 :  // <0139> "

// :running_prompt // = 0x0184
addr == 16'h184 ? 16'h03a0 :  // <0142> a = :running_msg
addr == 16'h185 ? 16'h0147 :  // <0142> "
addr == 16'h186 ? 16'hfba0 :  // <0143> call :print_nt
addr == 16'h187 ? 16'h00eb :  // <0143> "
addr == 16'h188 ? 16'hfc00 :  // <0143> "
// :run_poll // = 0x0189
addr == 16'h189 ? 16'hfba0 :  // <0145> pollchar
addr == 16'h18a ? 16'h001c :  // <0145> "
addr == 16'h18b ? 16'hfc00 :  // <0145> "
addr == 16'h18c ? 16'h0760 :  // <0146> b = -1
addr == 16'h18d ? 16'he407 :  // <0147> bn eq :parse_cmd
addr == 16'h18e ? 16'h0195 :  // <0147> "
addr == 16'h18f ? 16'h0018 :  // <0148> a = bp_status
addr == 16'h190 ? 16'he000 :  // <0149> br az :run_poll
addr == 16'h191 ? 16'h0189 :  // <0149> "
// target hit a breakpoint; switch to stepping mode.
addr == 16'h192 ? 16'h3e08 :  // <0151> bus_ctrl = $bp_step_mask
addr == 16'h193 ? 16'he00f :  // <0152> jmp :cmd_loop
addr == 16'h194 ? 16'h015f :  // <0152> "

// :parse_cmd // = 0x0195

// command = step next instruction.
addr == 16'h195 ? 16'h066e :  // <0157> b = 110 // asc b = "n"
addr == 16'h196 ? 16'he407 :  // <0158> bn eq :skip_step
addr == 16'h197 ? 16'h019f :  // <0158> "
addr == 16'h198 ? 16'h3e08 :  // <0159> bus_ctrl = $bp_step_mask
addr == 16'h199 ? 16'h2409 :  // <0160> bp0_addr = bp0_addr
addr == 16'h19a ? 16'hfba0 :  // <0161> call :wait_for_bp
addr == 16'h19b ? 16'h02c7 :  // <0161> "
addr == 16'h19c ? 16'hfc00 :  // <0161> "
addr == 16'h19d ? 16'he00f :  // <0162> jmp :cmd_loop
addr == 16'h19e ? 16'h015f :  // <0162> "
// :skip_step // = 0x019f

// command = reset target.
addr == 16'h19f ? 16'h0652 :  // <0166> b = 82 // asc b = "R"
addr == 16'h1a0 ? 16'he407 :  // <0167> bn eq :skip_reset
addr == 16'h1a1 ? 16'h01ab :  // <0167> "
addr == 16'h1a2 ? 16'h3e02 :  // <0168> bus_ctrl = $tg_reset_mask
addr == 16'h1a3 ? 16'hc800 :  // <0169> nop
addr == 16'h1a4 ? 16'hc800 :  // <0170> nop
addr == 16'h1a5 ? 16'h3e08 :  // <0171> bus_ctrl = $bp_step_mask
addr == 16'h1a6 ? 16'hfba0 :  // <0172> call :wait_for_bp
addr == 16'h1a7 ? 16'h02c7 :  // <0172> "
addr == 16'h1a8 ? 16'hfc00 :  // <0172> "
addr == 16'h1a9 ? 16'he00f :  // <0173> jmp :cmd_loop
addr == 16'h1aa ? 16'h015f :  // <0173> "
// :skip_reset // = 0x01ab

// command = load program.
addr == 16'h1ab ? 16'h066c :  // <0177> b = 108 // asc b = "l"
addr == 16'h1ac ? 16'he407 :  // <0178> bn eq :skip_load
addr == 16'h1ad ? 16'h01b3 :  // <0178> "
addr == 16'h1ae ? 16'hfba0 :  // <0179> call :load_program
addr == 16'h1af ? 16'h03d7 :  // <0179> "
addr == 16'h1b0 ? 16'hfc00 :  // <0179> "
addr == 16'h1b1 ? 16'he00f :  // <0180> jmp :cmd_loop
addr == 16'h1b2 ? 16'h015f :  // <0180> "
// :skip_load // = 0x01b3

// command = run full speed.
addr == 16'h1b3 ? 16'h0672 :  // <0184> b = 114 // asc b = "r"
addr == 16'h1b4 ? 16'he407 :  // <0185> bn eq :skip_run
addr == 16'h1b5 ? 16'h01ba :  // <0185> "
// release target reset, to run.
addr == 16'h1b6 ? 16'h3e00 :  // <0187> bus_ctrl = 0
addr == 16'h1b7 ? 16'h2409 :  // <0188> bp0_addr = bp0_addr
addr == 16'h1b8 ? 16'he00f :  // <0189> jmp :cmd_loop
addr == 16'h1b9 ? 16'h015f :  // <0189> "
// :skip_run // = 0x01ba

// command = set breakpoint.
addr == 16'h1ba ? 16'h0662 :  // <0193> b = 98 // asc b = "b"
addr == 16'h1bb ? 16'he407 :  // <0194> bn eq :skip_setbrk
addr == 16'h1bc ? 16'h01c2 :  // <0194> "
addr == 16'h1bd ? 16'hfba0 :  // <0195> call :set_bp
addr == 16'h1be ? 16'h02cb :  // <0195> "
addr == 16'h1bf ? 16'hfc00 :  // <0195> "
addr == 16'h1c0 ? 16'he00f :  // <0196> jmp :cmd_loop
addr == 16'h1c1 ? 16'h015f :  // <0196> "
// :skip_setbrk // = 0x01c2

// command = poke register.
addr == 16'h1c2 ? 16'h066f :  // <0200> b = 111 // asc b = "o"
addr == 16'h1c3 ? 16'he407 :  // <0201> bn eq :skip_poke
addr == 16'h1c4 ? 16'h01ca :  // <0201> "
addr == 16'h1c5 ? 16'hfba0 :  // <0202> call :poke_cmd
addr == 16'h1c6 ? 16'h0319 :  // <0202> "
addr == 16'h1c7 ? 16'hfc00 :  // <0202> "
addr == 16'h1c8 ? 16'he00f :  // <0203> jmp :cmd_loop
addr == 16'h1c9 ? 16'h015f :  // <0203> "
// :skip_poke // = 0x01ca

// command = dump Avalon data e.g. from SDRAM.
addr == 16'h1ca ? 16'h0675 :  // <0207> b = 117 // asc b = "u"
addr == 16'h1cb ? 16'he407 :  // <0208> bn eq :skip_dump
addr == 16'h1cc ? 16'h01d2 :  // <0208> "
addr == 16'h1cd ? 16'hfba0 :  // <0209> call :dump_avalon
addr == 16'h1ce ? 16'h01dd :  // <0209> "
addr == 16'h1cf ? 16'hfc00 :  // <0209> "
addr == 16'h1d0 ? 16'he00f :  // <0210> jmp :cmd_loop
addr == 16'h1d1 ? 16'h015f :  // <0210> "
// :skip_dump // = 0x01d2

addr == 16'h1d2 ? 16'h023f :  // <0213> a = 63 // putasc "?"
addr == 16'h1d3 ? 16'hfba0 :  // <0213> putasc "?"
addr == 16'h1d4 ? 16'h0004 :  // <0213> "
addr == 16'h1d5 ? 16'hfc00 :  // <0213> "
addr == 16'h1d6 ? 16'h03a0 :  // <0214> a = :eol_msg // puteol
addr == 16'h1d7 ? 16'h0002 :  // <0214> "
addr == 16'h1d8 ? 16'hfba0 :  // <0214> puteol
addr == 16'h1d9 ? 16'h00eb :  // <0214> "
addr == 16'h1da ? 16'hfc00 :  // <0214> "
addr == 16'h1db ? 16'he00f :  // <0215> jmp :cmd_loop
addr == 16'h1dc ? 16'h015f :  // <0215> "


// ######## func dump_avalon // = 0x01dd
addr == 16'h1dd ? 16'h2002 :  // <0244> push i // func dump_avalon
addr == 16'h1de ? 16'h2003 :  // <0244> push j // "
addr == 16'h1df ? 16'h2004 :  // <0244> push x // "
addr == 16'h1e0 ? 16'h2005 :  // <0244> push y // "
addr == 16'h1e1 ? 16'h2006 :  // <0244> push g6 // "
addr == 16'h1e2 ? 16'h2007 :  // <0244> push g7 // "
addr == 16'h1e3 ? 16'h203e :  // <0244> push rtna // "
// test case: u0010 0011 0013 0012 0000 0000 0080.

// this func may borrow some peripheral registers to hold temporary data.
// but it can only borrow registers that don't have side effects that are relevant to this function.

// parse av_write_data reg address into av_data_regs high byte.
addr == 16'h1e4 ? 16'hfba0 :  // <0253> call :get4x
addr == 16'h1e5 ? 16'h0098 :  // <0253> "
addr == 16'h1e6 ? 16'hfc00 :  // <0253> "
addr == 16'h1e7 ? 16'h0801 :  // <0254> i = b
addr == 16'h1e8 ? 16'he401 :  // <0255> bn iz :fail
addr == 16'h1e9 ? 16'h02a0 :  // <0255> "
addr == 16'h1ea ? 16'h0352 :  // <0256> a = a<<4
addr == 16'h1eb ? 16'h1b52 :  // <0257> $av_data_regs = a<<4
addr == 16'h1ec ? 16'hfba0 :  // <0258> getchar_echo
addr == 16'h1ed ? 16'h0013 :  // <0258> "
addr == 16'h1ee ? 16'hfc00 :  // <0258> "
addr == 16'h1ef ? 16'h2000 :  // <0258> push a // "
addr == 16'h1f0 ? 16'hfba0 :  // <0258> "
addr == 16'h1f1 ? 16'h0004 :  // <0258> "
addr == 16'h1f2 ? 16'hfc00 :  // <0258> "
addr == 16'h1f3 ? 16'h0008 :  // <0258> pop a // "

// parse av_read_data reg address into av_data_regs low byte.
addr == 16'h1f4 ? 16'hfba0 :  // <0261> call :get4x
addr == 16'h1f5 ? 16'h0098 :  // <0261> "
addr == 16'h1f6 ? 16'hfc00 :  // <0261> "
addr == 16'h1f7 ? 16'h0801 :  // <0262> i = b
addr == 16'h1f8 ? 16'he401 :  // <0263> bn iz :fail
addr == 16'h1f9 ? 16'h02a0 :  // <0263> "
addr == 16'h1fa ? 16'h0406 :  // <0264> b = $av_data_regs
addr == 16'h1fb ? 16'hc800 :  // <0265> $av_data_regs = or
addr == 16'h1fc ? 16'h1b34 :  // <0265> "
addr == 16'h1fd ? 16'hfba0 :  // <0266> getchar_echo
addr == 16'h1fe ? 16'h0013 :  // <0266> "
addr == 16'h1ff ? 16'hfc00 :  // <0266> "
addr == 16'h200 ? 16'h2000 :  // <0266> push a // "
addr == 16'h201 ? 16'hfba0 :  // <0266> "
addr == 16'h202 ? 16'h0004 :  // <0266> "
addr == 16'h203 ? 16'hfc00 :  // <0266> "
addr == 16'h204 ? 16'h0008 :  // <0266> pop a // "

// parse av_ad_lo reg address into av_ad_lo_reg.
addr == 16'h205 ? 16'hfba0 :  // <0269> call :get4x
addr == 16'h206 ? 16'h0098 :  // <0269> "
addr == 16'h207 ? 16'hfc00 :  // <0269> "
addr == 16'h208 ? 16'h0801 :  // <0270> i = b
addr == 16'h209 ? 16'he401 :  // <0271> bn iz :fail
addr == 16'h20a ? 16'h02a0 :  // <0271> "
addr == 16'h20b ? 16'h1c00 :  // <0272> $av_ad_lo_reg = a
addr == 16'h20c ? 16'hfba0 :  // <0273> getchar_echo
addr == 16'h20d ? 16'h0013 :  // <0273> "
addr == 16'h20e ? 16'hfc00 :  // <0273> "
addr == 16'h20f ? 16'h2000 :  // <0273> push a // "
addr == 16'h210 ? 16'hfba0 :  // <0273> "
addr == 16'h211 ? 16'h0004 :  // <0273> "
addr == 16'h212 ? 16'hfc00 :  // <0273> "
addr == 16'h213 ? 16'h0008 :  // <0273> pop a // "

// parse av_ad_hi reg address into x.
addr == 16'h214 ? 16'hfba0 :  // <0276> call :get4x
addr == 16'h215 ? 16'h0098 :  // <0276> "
addr == 16'h216 ? 16'hfc00 :  // <0276> "
addr == 16'h217 ? 16'h0801 :  // <0277> i = b
addr == 16'h218 ? 16'he401 :  // <0278> bn iz :fail
addr == 16'h219 ? 16'h02a0 :  // <0278> "
addr == 16'h21a ? 16'h1000 :  // <0279> x = a
addr == 16'h21b ? 16'hfba0 :  // <0280> getchar_echo
addr == 16'h21c ? 16'h0013 :  // <0280> "
addr == 16'h21d ? 16'hfc00 :  // <0280> "
addr == 16'h21e ? 16'h2000 :  // <0280> push a // "
addr == 16'h21f ? 16'hfba0 :  // <0280> "
addr == 16'h220 ? 16'h0004 :  // <0280> "
addr == 16'h221 ? 16'hfc00 :  // <0280> "
addr == 16'h222 ? 16'h0008 :  // <0280> pop a // "

// parse start byte address high word into target's avalon master.
addr == 16'h223 ? 16'hfba0 :  // <0283> call :get4x
addr == 16'h224 ? 16'h0098 :  // <0283> "
addr == 16'h225 ? 16'hfc00 :  // <0283> "
addr == 16'h226 ? 16'h0801 :  // <0284> i = b
addr == 16'h227 ? 16'he401 :  // <0285> bn iz :fail
addr == 16'h228 ? 16'h02a0 :  // <0285> "
addr == 16'h229 ? 16'h3800 :  // <0286> poke_data = a
addr == 16'h22a ? 16'h0004 :  // <0287> a = x
addr == 16'h22b ? 16'hfba0 :  // <0288> call :poke
addr == 16'h22c ? 16'h0350 :  // <0288> "
addr == 16'h22d ? 16'hfc00 :  // <0288> "
addr == 16'h22e ? 16'hfba0 :  // <0289> getchar_echo
addr == 16'h22f ? 16'h0013 :  // <0289> "
addr == 16'h230 ? 16'hfc00 :  // <0289> "
addr == 16'h231 ? 16'h2000 :  // <0289> push a // "
addr == 16'h232 ? 16'hfba0 :  // <0289> "
addr == 16'h233 ? 16'h0004 :  // <0289> "
addr == 16'h234 ? 16'hfc00 :  // <0289> "
addr == 16'h235 ? 16'h0008 :  // <0289> pop a // "

// parse start byte address low word into target's avalon master.
addr == 16'h236 ? 16'hfba0 :  // <0292> call :get4x
addr == 16'h237 ? 16'h0098 :  // <0292> "
addr == 16'h238 ? 16'hfc00 :  // <0292> "
addr == 16'h239 ? 16'h0801 :  // <0293> i = b
addr == 16'h23a ? 16'he401 :  // <0294> bn iz :fail
addr == 16'h23b ? 16'h02a0 :  // <0294> "
addr == 16'h23c ? 16'h3800 :  // <0295> poke_data = a
addr == 16'h23d ? 16'h0007 :  // <0296> a = $av_ad_lo_reg
addr == 16'h23e ? 16'hfba0 :  // <0297> call :poke
addr == 16'h23f ? 16'h0350 :  // <0297> "
addr == 16'h240 ? 16'hfc00 :  // <0297> "
addr == 16'h241 ? 16'hfba0 :  // <0298> getchar_echo
addr == 16'h242 ? 16'h0013 :  // <0298> "
addr == 16'h243 ? 16'hfc00 :  // <0298> "
addr == 16'h244 ? 16'h2000 :  // <0298> push a // "
addr == 16'h245 ? 16'hfba0 :  // <0298> "
addr == 16'h246 ? 16'h0004 :  // <0298> "
addr == 16'h247 ? 16'hfc00 :  // <0298> "
addr == 16'h248 ? 16'h0008 :  // <0298> pop a // "

// parse length (in bytes) into i.
addr == 16'h249 ? 16'hfba0 :  // <0301> call :get4x
addr == 16'h24a ? 16'h0098 :  // <0301> "
addr == 16'h24b ? 16'hfc00 :  // <0301> "
addr == 16'h24c ? 16'h1001 :  // <0302> x = b
addr == 16'h24d ? 16'he402 :  // <0303> bn xz :fail
addr == 16'h24e ? 16'h02a0 :  // <0303> "
addr == 16'h24f ? 16'h0b50 :  // <0304> i = a>>1
addr == 16'h250 ? 16'he001 :  // <0305> br iz :fail
addr == 16'h251 ? 16'h02a0 :  // <0305> "

addr == 16'h252 ? 16'hfba0 :  // <0307> getchar_echo
addr == 16'h253 ? 16'h0013 :  // <0307> "
addr == 16'h254 ? 16'hfc00 :  // <0307> "
addr == 16'h255 ? 16'h2000 :  // <0307> push a // "
addr == 16'h256 ? 16'hfba0 :  // <0307> "
addr == 16'h257 ? 16'h0004 :  // <0307> "
addr == 16'h258 ? 16'hfc00 :  // <0307> "
addr == 16'h259 ? 16'h0008 :  // <0307> pop a // "
addr == 16'h25a ? 16'h062e :  // <0308> b = 46 // asc b = "."
addr == 16'h25b ? 16'he407 :  // <0309> bn eq :fail
addr == 16'h25c ? 16'h02a0 :  // <0309> "

// :next_row // = 0x025d
// print row header.
addr == 16'h25d ? 16'h03a0 :  // <0313> a = :eol_msg // puteol
addr == 16'h25e ? 16'h0002 :  // <0313> "
addr == 16'h25f ? 16'hfba0 :  // <0313> puteol
addr == 16'h260 ? 16'h00eb :  // <0313> "
addr == 16'h261 ? 16'hfc00 :  // <0313> "
addr == 16'h262 ? 16'h0007 :  // <0314> a = $av_ad_lo_reg
addr == 16'h263 ? 16'hfba0 :  // <0315> call :peek
addr == 16'h264 ? 16'h0361 :  // <0315> "
addr == 16'h265 ? 16'hfc00 :  // <0315> "
addr == 16'h266 ? 16'h0017 :  // <0316> a = peek_data
addr == 16'h267 ? 16'hfba0 :  // <0317> call :put4x
addr == 16'h268 ? 16'h005f :  // <0317> "
addr == 16'h269 ? 16'hfc00 :  // <0317> "
addr == 16'h26a ? 16'h023a :  // <0318> a = 58 // putasc ":"
addr == 16'h26b ? 16'hfba0 :  // <0318> putasc ":"
addr == 16'h26c ? 16'h0004 :  // <0318> "
addr == 16'h26d ? 16'hfc00 :  // <0318> "

// print 8 data words.
addr == 16'h26e ? 16'h1208 :  // <0321> x = 8
// :next_word // = 0x026f
// print data word from target's avalon master.
addr == 16'h26f ? 16'h0220 :  // <0324> a = 32 // putasc " "
addr == 16'h270 ? 16'hfba0 :  // <0324> putasc " "
addr == 16'h271 ? 16'h0004 :  // <0324> "
addr == 16'h272 ? 16'hfc00 :  // <0324> "
addr == 16'h273 ? 16'h0006 :  // <0325> a = $av_data_regs
addr == 16'h274 ? 16'hfba0 :  // <0326> call :peek_avalon
addr == 16'h275 ? 16'h02b1 :  // <0326> "
addr == 16'h276 ? 16'hfc00 :  // <0326> "
addr == 16'h277 ? 16'h0017 :  // <0327> a = peek_data
addr == 16'h278 ? 16'hfba0 :  // <0328> call :put4x
addr == 16'h279 ? 16'h005f :  // <0328> "
addr == 16'h27a ? 16'hfc00 :  // <0328> "

// increment target's av_ad_lo.
addr == 16'h27b ? 16'h0007 :  // <0331> a = $av_ad_lo_reg
addr == 16'h27c ? 16'hfba0 :  // <0332> call :peek
addr == 16'h27d ? 16'h0361 :  // <0332> "
addr == 16'h27e ? 16'hfc00 :  // <0332> "
addr == 16'h27f ? 16'h0017 :  // <0333> a = peek_data
addr == 16'h280 ? 16'h0602 :  // <0334> b = 2
addr == 16'h281 ? 16'hc800 :  // <0335> poke_data = a+b
addr == 16'h282 ? 16'h3b00 :  // <0335> "
addr == 16'h283 ? 16'h0007 :  // <0336> a = $av_ad_lo_reg
addr == 16'h284 ? 16'hfba0 :  // <0337> call :poke
addr == 16'h285 ? 16'h0350 :  // <0337> "
addr == 16'h286 ? 16'hfc00 :  // <0337> "

// check if all words have been dumped.
addr == 16'h287 ? 16'h0f60 :  // <0340> j = -1
addr == 16'h288 ? 16'hc800 :  // <0341> i = i+j
addr == 16'h289 ? 16'h0b10 :  // <0341> "
addr == 16'h28a ? 16'he001 :  // <0342> br iz :done
addr == 16'h28b ? 16'h0293 :  // <0342> "

// check for end of row.
addr == 16'h28c ? 16'h1760 :  // <0345> y = -1
addr == 16'h28d ? 16'hc800 :  // <0346> x = x+y
addr == 16'h28e ? 16'h1320 :  // <0346> "
addr == 16'h28f ? 16'he402 :  // <0347> bn xz :next_word
addr == 16'h290 ? 16'h026f :  // <0347> "
addr == 16'h291 ? 16'he00f :  // <0348> jmp :next_row
addr == 16'h292 ? 16'h025d :  // <0348> "

// :done // = 0x0293
addr == 16'h293 ? 16'h03a0 :  // <0351> a = :eol_msg // puteol
addr == 16'h294 ? 16'h0002 :  // <0351> "
addr == 16'h295 ? 16'hfba0 :  // <0351> puteol
addr == 16'h296 ? 16'h00eb :  // <0351> "
addr == 16'h297 ? 16'hfc00 :  // <0351> "
addr == 16'h298 ? 16'hf808 :  // <0352> pop rtna // rtn
addr == 16'h299 ? 16'h1c08 :  // <0352> pop g7 // "
addr == 16'h29a ? 16'h1808 :  // <0352> pop g6 // "
addr == 16'h29b ? 16'h1408 :  // <0352> pop y // "
addr == 16'h29c ? 16'h1008 :  // <0352> pop x // "
addr == 16'h29d ? 16'h0c08 :  // <0352> pop j // "
addr == 16'h29e ? 16'h0808 :  // <0352> pop i // "
addr == 16'h29f ? 16'hfc00 :  // <0352> swapra = nop

// :fail // = 0x02a0
addr == 16'h2a0 ? 16'h023f :  // <0356> a = 63 // putasc "?"
addr == 16'h2a1 ? 16'hfba0 :  // <0356> putasc "?"
addr == 16'h2a2 ? 16'h0004 :  // <0356> "
addr == 16'h2a3 ? 16'hfc00 :  // <0356> "
addr == 16'h2a4 ? 16'h03a0 :  // <0357> a = :eol_msg // puteol
addr == 16'h2a5 ? 16'h0002 :  // <0357> "
addr == 16'h2a6 ? 16'hfba0 :  // <0357> puteol
addr == 16'h2a7 ? 16'h00eb :  // <0357> "
addr == 16'h2a8 ? 16'hfc00 :  // <0357> "
addr == 16'h2a9 ? 16'hf808 :  // <0358> pop rtna // end_func
addr == 16'h2aa ? 16'h1c08 :  // <0358> pop g7 // "
addr == 16'h2ab ? 16'h1808 :  // <0358> pop g6 // "
addr == 16'h2ac ? 16'h1408 :  // <0358> pop y // "
addr == 16'h2ad ? 16'h1008 :  // <0358> pop x // "
addr == 16'h2ae ? 16'h0c08 :  // <0358> pop j // "
addr == 16'h2af ? 16'h0808 :  // <0358> pop i // "
addr == 16'h2b0 ? 16'hfc00 :  // <0358> swapra = nop

// trigger a read in the target's avalon master.  return the data in peek_data.
// the 32-bit avalon address must already be poked into the target's avalon master.
// pass av_data_regs in a.  av_write_data reg address in its high byte; av_read_data reg address in its low byte.
// ######## func peek_avalon // = 0x02b1
addr == 16'h2b1 ? 16'h203e :  // <0364> push rtna // func peek_avalon
// peek the target's av_write_data register to trigger an avalon read as a side effect.
addr == 16'h2b2 ? 16'h2000 :  // <0366> push a // push a
addr == 16'h2b3 ? 16'h0353 :  // <0367> a = a>>4
addr == 16'h2b4 ? 16'h0353 :  // <0368> a = a>>4
addr == 16'h2b5 ? 16'hfba0 :  // <0369> call :peek
addr == 16'h2b6 ? 16'h0361 :  // <0369> "
addr == 16'h2b7 ? 16'hfc00 :  // <0369> "

// wait for target's avalon master to receive data e.g. from SDRAM controller.
addr == 16'h2b8 ? 16'h020f :  // <0372> a = 15
addr == 16'h2b9 ? 16'h0760 :  // <0373> b = -1
// :wait // = 0x02ba
addr == 16'h2ba ? 16'hc800 :  // <0375> a = a+b
addr == 16'h2bb ? 16'h0300 :  // <0375> "
addr == 16'h2bc ? 16'he400 :  // <0376> bn az :wait
addr == 16'h2bd ? 16'h02ba :  // <0376> "

// peek data word from target's avalon master.
addr == 16'h2be ? 16'h0008 :  // <0379> pop a // pop a
addr == 16'h2bf ? 16'h06ff :  // <0380> b = 0xff
addr == 16'h2c0 ? 16'hc800 :  // <0381> a = and
addr == 16'h2c1 ? 16'h0330 :  // <0381> "
addr == 16'h2c2 ? 16'hfba0 :  // <0382> call :peek
addr == 16'h2c3 ? 16'h0361 :  // <0382> "
addr == 16'h2c4 ? 16'hfc00 :  // <0382> "
addr == 16'h2c5 ? 16'hf808 :  // <0383> pop rtna // end_func
addr == 16'h2c6 ? 16'hfc00 :  // <0383> swapra = nop

// ######## func wait_for_bp // = 0x02c7
// :poll // = 0x02c7
addr == 16'h2c7 ? 16'h0018 :  // <0388> a = bp_status
addr == 16'h2c8 ? 16'he000 :  // <0389> br az :poll
addr == 16'h2c9 ? 16'h02c7 :  // <0389> "
addr == 16'h2ca ? 16'hfc00 :  // <0390> swapra = nop

// ######## func set_bp // = 0x02cb
addr == 16'h2cb ? 16'h2004 :  // <0393> push x // func set_bp
addr == 16'h2cc ? 16'h2005 :  // <0393> push y // "
addr == 16'h2cd ? 16'h203e :  // <0393> push rtna // "
addr == 16'h2ce ? 16'hfba0 :  // <0394> getchar_echo
addr == 16'h2cf ? 16'h0013 :  // <0394> "
addr == 16'h2d0 ? 16'hfc00 :  // <0394> "
addr == 16'h2d1 ? 16'h2000 :  // <0394> push a // "
addr == 16'h2d2 ? 16'hfba0 :  // <0394> "
addr == 16'h2d3 ? 16'h0004 :  // <0394> "
addr == 16'h2d4 ? 16'hfc00 :  // <0394> "
addr == 16'h2d5 ? 16'h0008 :  // <0394> pop a // "
addr == 16'h2d6 ? 16'h1000 :  // <0395> x = a
addr == 16'h2d7 ? 16'hfba0 :  // <0396> getchar_echo
addr == 16'h2d8 ? 16'h0013 :  // <0396> "
addr == 16'h2d9 ? 16'hfc00 :  // <0396> "
addr == 16'h2da ? 16'h2000 :  // <0396> push a // "
addr == 16'h2db ? 16'hfba0 :  // <0396> "
addr == 16'h2dc ? 16'h0004 :  // <0396> "
addr == 16'h2dd ? 16'hfc00 :  // <0396> "
addr == 16'h2de ? 16'h0008 :  // <0396> pop a // "
addr == 16'h2df ? 16'h063d :  // <0397> b = 61 // asc b = "="
addr == 16'h2e0 ? 16'he407 :  // <0398> bn eq :fail
addr == 16'h2e1 ? 16'h030c :  // <0398> "
addr == 16'h2e2 ? 16'hfba0 :  // <0399> call :get4x
addr == 16'h2e3 ? 16'h0098 :  // <0399> "
addr == 16'h2e4 ? 16'hfc00 :  // <0399> "
addr == 16'h2e5 ? 16'h1400 :  // <0400> y = a
addr == 16'h2e6 ? 16'h0200 :  // <0401> a = 0
addr == 16'h2e7 ? 16'he407 :  // <0402> bn eq :fail
addr == 16'h2e8 ? 16'h030c :  // <0402> "
addr == 16'h2e9 ? 16'h0004 :  // <0403> a = x
addr == 16'h2ea ? 16'h0630 :  // <0404> b = 48 // asc b = "0"
addr == 16'h2eb ? 16'he007 :  // <0405> br eq :b0
addr == 16'h2ec ? 16'h02f8 :  // <0405> "
addr == 16'h2ed ? 16'h0631 :  // <0406> b = 49 // asc b = "1"
addr == 16'h2ee ? 16'he007 :  // <0407> br eq :b1
addr == 16'h2ef ? 16'h02fd :  // <0407> "
addr == 16'h2f0 ? 16'h0632 :  // <0408> b = 50 // asc b = "2"
addr == 16'h2f1 ? 16'he007 :  // <0409> br eq :b2
addr == 16'h2f2 ? 16'h0302 :  // <0409> "
addr == 16'h2f3 ? 16'h0633 :  // <0410> b = 51 // asc b = "3"
addr == 16'h2f4 ? 16'he007 :  // <0411> br eq :b3
addr == 16'h2f5 ? 16'h0307 :  // <0411> "
addr == 16'h2f6 ? 16'he00f :  // <0412> jmp :fail
addr == 16'h2f7 ? 16'h030c :  // <0412> "
// :b0 // = 0x02f8
addr == 16'h2f8 ? 16'h2405 :  // <0414> bp0_addr = y
addr == 16'h2f9 ? 16'hf808 :  // <0415> pop rtna // rtn
addr == 16'h2fa ? 16'h1408 :  // <0415> pop y // "
addr == 16'h2fb ? 16'h1008 :  // <0415> pop x // "
addr == 16'h2fc ? 16'hfc00 :  // <0415> swapra = nop
// :b1 // = 0x02fd
addr == 16'h2fd ? 16'h2805 :  // <0418> bp1_addr = y
addr == 16'h2fe ? 16'hf808 :  // <0419> pop rtna // rtn
addr == 16'h2ff ? 16'h1408 :  // <0419> pop y // "
addr == 16'h300 ? 16'h1008 :  // <0419> pop x // "
addr == 16'h301 ? 16'hfc00 :  // <0419> swapra = nop
// :b2 // = 0x0302
addr == 16'h302 ? 16'h2c05 :  // <0422> bp2_addr = y
addr == 16'h303 ? 16'hf808 :  // <0423> pop rtna // rtn
addr == 16'h304 ? 16'h1408 :  // <0423> pop y // "
addr == 16'h305 ? 16'h1008 :  // <0423> pop x // "
addr == 16'h306 ? 16'hfc00 :  // <0423> swapra = nop
// :b3 // = 0x0307
addr == 16'h307 ? 16'h3005 :  // <0426> bp3_addr = y
addr == 16'h308 ? 16'hf808 :  // <0427> pop rtna // rtn
addr == 16'h309 ? 16'h1408 :  // <0427> pop y // "
addr == 16'h30a ? 16'h1008 :  // <0427> pop x // "
addr == 16'h30b ? 16'hfc00 :  // <0427> swapra = nop

// :fail // = 0x030c
addr == 16'h30c ? 16'h023f :  // <0431> a = 63 // putasc "?"
addr == 16'h30d ? 16'hfba0 :  // <0431> putasc "?"
addr == 16'h30e ? 16'h0004 :  // <0431> "
addr == 16'h30f ? 16'hfc00 :  // <0431> "
addr == 16'h310 ? 16'h03a0 :  // <0432> a = :eol_msg // puteol
addr == 16'h311 ? 16'h0002 :  // <0432> "
addr == 16'h312 ? 16'hfba0 :  // <0432> puteol
addr == 16'h313 ? 16'h00eb :  // <0432> "
addr == 16'h314 ? 16'hfc00 :  // <0432> "
addr == 16'h315 ? 16'hf808 :  // <0433> pop rtna // end_func
addr == 16'h316 ? 16'h1408 :  // <0433> pop y // "
addr == 16'h317 ? 16'h1008 :  // <0433> pop x // "
addr == 16'h318 ? 16'hfc00 :  // <0433> swapra = nop

// ######## func poke_cmd // = 0x0319
addr == 16'h319 ? 16'h2004 :  // <0436> push x // func poke_cmd
addr == 16'h31a ? 16'h203e :  // <0436> push rtna // "
// x = destination register address to poke.
addr == 16'h31b ? 16'hfba0 :  // <0438> call :get4x
addr == 16'h31c ? 16'h0098 :  // <0438> "
addr == 16'h31d ? 16'hfc00 :  // <0438> "
addr == 16'h31e ? 16'h1000 :  // <0439> x = a
addr == 16'h31f ? 16'h0200 :  // <0440> a = 0
addr == 16'h320 ? 16'he407 :  // <0441> bn eq :fail
addr == 16'h321 ? 16'h033b :  // <0441> "

addr == 16'h322 ? 16'hfba0 :  // <0443> getchar_echo
addr == 16'h323 ? 16'h0013 :  // <0443> "
addr == 16'h324 ? 16'hfc00 :  // <0443> "
addr == 16'h325 ? 16'h2000 :  // <0443> push a // "
addr == 16'h326 ? 16'hfba0 :  // <0443> "
addr == 16'h327 ? 16'h0004 :  // <0443> "
addr == 16'h328 ? 16'hfc00 :  // <0443> "
addr == 16'h329 ? 16'h0008 :  // <0443> pop a // "
addr == 16'h32a ? 16'h063d :  // <0444> b = 61 // asc b = "="
addr == 16'h32b ? 16'he407 :  // <0445> bn eq :fail
addr == 16'h32c ? 16'h033b :  // <0445> "

// parse value to poke.
addr == 16'h32d ? 16'hfba0 :  // <0448> call :get4x
addr == 16'h32e ? 16'h0098 :  // <0448> "
addr == 16'h32f ? 16'hfc00 :  // <0448> "
addr == 16'h330 ? 16'h3800 :  // <0449> poke_data = a
addr == 16'h331 ? 16'h0200 :  // <0450> a = 0
addr == 16'h332 ? 16'he407 :  // <0451> bn eq :fail
addr == 16'h333 ? 16'h033b :  // <0451> "

addr == 16'h334 ? 16'h0004 :  // <0453> a = x
addr == 16'h335 ? 16'hfba0 :  // <0454> call :poke
addr == 16'h336 ? 16'h0350 :  // <0454> "
addr == 16'h337 ? 16'hfc00 :  // <0454> "
addr == 16'h338 ? 16'hf808 :  // <0455> pop rtna // rtn
addr == 16'h339 ? 16'h1008 :  // <0455> pop x // "
addr == 16'h33a ? 16'hfc00 :  // <0455> swapra = nop

// :fail // = 0x033b
addr == 16'h33b ? 16'h023f :  // <0459> a = 63 // putasc "?"
addr == 16'h33c ? 16'hfba0 :  // <0459> putasc "?"
addr == 16'h33d ? 16'h0004 :  // <0459> "
addr == 16'h33e ? 16'hfc00 :  // <0459> "
addr == 16'h33f ? 16'h03a0 :  // <0460> a = :eol_msg // puteol
addr == 16'h340 ? 16'h0002 :  // <0460> "
addr == 16'h341 ? 16'hfba0 :  // <0460> puteol
addr == 16'h342 ? 16'h00eb :  // <0460> "
addr == 16'h343 ? 16'hfc00 :  // <0460> "
addr == 16'h344 ? 16'hf808 :  // <0461> pop rtna // end_func
addr == 16'h345 ? 16'h1008 :  // <0461> pop x // "
addr == 16'h346 ? 16'hfc00 :  // <0461> swapra = nop

// force execution of the opcode passed in force_opcode.
// ######## func force_instruction // = 0x0347
addr == 16'h347 ? 16'h3e04 :  // <0466> bus_ctrl = $divert_code_bus_mask
addr == 16'h348 ? 16'h4201 :  // <0467> tg_force = $hold_state_mask
addr == 16'h349 ? 16'h4203 :  // <0468> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h34a ? 16'h4205 :  // <0469> tg_force = ($hold_state_mask | $force_exec_mask)
addr == 16'h34b ? 16'h4201 :  // <0470> tg_force = $hold_state_mask
// refill target exr so it can resume seamlessly.
addr == 16'h34c ? 16'h3415 :  // <0472> force_opcode = exr_shadow
addr == 16'h34d ? 16'h4203 :  // <0473> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h34e ? 16'h4200 :  // <0474> tg_force = 0
addr == 16'h34f ? 16'hfc00 :  // <0475> swapra = nop

// write to a register in the target MCU.  pass the value in poke_data.
// pass its register address in a.
// ######## func poke // = 0x0350
addr == 16'h350 ? 16'h203e :  // <0480> push rtna // func poke
addr == 16'h351 ? 16'h063f :  // <0481> b = $dest_mask
addr == 16'h352 ? 16'hc800 :  // <0482> a = and
addr == 16'h353 ? 16'h0330 :  // <0482> "
addr == 16'h354 ? 16'h0352 :  // <0483> a = a<<4
addr == 16'h355 ? 16'h0352 :  // <0484> a = a<<4
addr == 16'h356 ? 16'h0351 :  // <0485> a = a<<1
addr == 16'h357 ? 16'h0351 :  // <0486> a = a<<1
addr == 16'h358 ? 16'h07a0 :  // <0487> b = ([src dbgpoke])
addr == 16'h359 ? 16'h03c0 :  // <0487> "
addr == 16'h35a ? 16'hc800 :  // <0488> force_opcode = or
addr == 16'h35b ? 16'h3734 :  // <0488> "
addr == 16'h35c ? 16'hfba0 :  // <0489> call :force_instruction
addr == 16'h35d ? 16'h0347 :  // <0489> "
addr == 16'h35e ? 16'hfc00 :  // <0489> "
addr == 16'h35f ? 16'hf808 :  // <0490> pop rtna // end_func
addr == 16'h360 ? 16'hfc00 :  // <0490> swapra = nop

// observe a register in the target MCU.  return its value in peek_data.
// pass its register address in a.
// ######## func peek // = 0x0361
addr == 16'h361 ? 16'h203e :  // <0495> push rtna // func peek
addr == 16'h362 ? 16'h07a0 :  // <0496> b = $src_mask
addr == 16'h363 ? 16'h03ff :  // <0496> "
addr == 16'h364 ? 16'hc800 :  // <0497> a = and
addr == 16'h365 ? 16'h0330 :  // <0497> "
addr == 16'h366 ? 16'h07a0 :  // <0498> b = ([dest nop] << $dest_lsb)
addr == 16'h367 ? 16'hc800 :  // <0498> "
addr == 16'h368 ? 16'hc800 :  // <0499> force_opcode = or
addr == 16'h369 ? 16'h3734 :  // <0499> "
addr == 16'h36a ? 16'hfba0 :  // <0500> call :force_instruction
addr == 16'h36b ? 16'h0347 :  // <0500> "
addr == 16'h36c ? 16'hfc00 :  // <0500> "
// target's register value is now in peek_data.
addr == 16'h36d ? 16'hf808 :  // <0502> pop rtna // end_func
addr == 16'h36e ? 16'hfc00 :  // <0502> swapra = nop

// show target status display.
// ######## func dump_target // = 0x036f
addr == 16'h36f ? 16'h2002 :  // <0506> push i // func dump_target
addr == 16'h370 ? 16'h2003 :  // <0506> push j // "
addr == 16'h371 ? 16'h203e :  // <0506> push rtna // "
addr == 16'h372 ? 16'h03a0 :  // <0507> a = :eol_msg // puteol
addr == 16'h373 ? 16'h0002 :  // <0507> "
addr == 16'h374 ? 16'hfba0 :  // <0507> puteol
addr == 16'h375 ? 16'h00eb :  // <0507> "
addr == 16'h376 ? 16'hfc00 :  // <0507> "
addr == 16'h377 ? 16'h0a00 :  // <0508> i = 0
addr == 16'h378 ? 16'h0e01 :  // <0509> j = 1
// :next_reg // = 0x0379
// fetch register name from table in target program.
// i = register number.
// peek is skipped for any reg name starting with 2 slashes (good for read-sensitive regs).
addr == 16'h379 ? 16'h0002 :  // <0514> a = i
addr == 16'h37a ? 16'h0351 :  // <0515> a = a<<1
addr == 16'h37b ? 16'h0351 :  // <0516> a = a<<1
addr == 16'h37c ? 16'h0603 :  // <0517> b = 3
addr == 16'h37d ? 16'hc800 :  // <0518> a = a+b
addr == 16'h37e ? 16'h0300 :  // <0518> "
addr == 16'h37f ? 16'h0404 :  // <0519> b = x
addr == 16'h380 ? 16'hc800 :  // <0520> m9k_addr = a+b
addr == 16'h381 ? 16'h4f00 :  // <0520> "
addr == 16'h382 ? 16'h0014 :  // <0521> a = m9k_data
addr == 16'h383 ? 16'h07a0 :  // <0522> b = 0x2f2f
addr == 16'h384 ? 16'h2f2f :  // <0522> "
addr == 16'h385 ? 16'he007 :  // <0523> br eq :no_peek
addr == 16'h386 ? 16'h03a5 :  // <0523> "
addr == 16'h387 ? 16'h0220 :  // <0524> a = 32 // putasc " "
addr == 16'h388 ? 16'hfba0 :  // <0524> putasc " "
addr == 16'h389 ? 16'h0004 :  // <0524> "
addr == 16'h38a ? 16'hfc00 :  // <0524> "
addr == 16'h38b ? 16'h0220 :  // <0525> a = 32 // putasc " "
addr == 16'h38c ? 16'hfba0 :  // <0525> putasc " "
addr == 16'h38d ? 16'h0004 :  // <0525> "
addr == 16'h38e ? 16'hfc00 :  // <0525> "
addr == 16'h38f ? 16'h0013 :  // <0526> a = m9k_addr
addr == 16'h390 ? 16'h0608 :  // <0527> b = 8
addr == 16'h391 ? 16'hfba0 :  // <0528> call :print_fixed_target
addr == 16'h392 ? 16'h03b0 :  // <0528> "
addr == 16'h393 ? 16'hfc00 :  // <0528> "
addr == 16'h394 ? 16'h023d :  // <0529> a = 61 // putasc "="
addr == 16'h395 ? 16'hfba0 :  // <0529> putasc "="
addr == 16'h396 ? 16'h0004 :  // <0529> "
addr == 16'h397 ? 16'hfc00 :  // <0529> "
addr == 16'h398 ? 16'h0002 :  // <0530> a = i
addr == 16'h399 ? 16'hfba0 :  // <0531> call :peek
addr == 16'h39a ? 16'h0361 :  // <0531> "
addr == 16'h39b ? 16'hfc00 :  // <0531> "
addr == 16'h39c ? 16'h0017 :  // <0532> a = peek_data
addr == 16'h39d ? 16'hfba0 :  // <0533> call :put4x
addr == 16'h39e ? 16'h005f :  // <0533> "
addr == 16'h39f ? 16'hfc00 :  // <0533> "
addr == 16'h3a0 ? 16'h03a0 :  // <0534> a = :eol_msg // puteol
addr == 16'h3a1 ? 16'h0002 :  // <0534> "
addr == 16'h3a2 ? 16'hfba0 :  // <0534> puteol
addr == 16'h3a3 ? 16'h00eb :  // <0534> "
addr == 16'h3a4 ? 16'hfc00 :  // <0534> "
// :no_peek // = 0x03a5
addr == 16'h3a5 ? 16'hc800 :  // <0536> i = i+j
addr == 16'h3a6 ? 16'h0b10 :  // <0536> "
// loop up to the number of registers in the target program's register name table.
addr == 16'h3a7 ? 16'h4e02 :  // <0538> m9k_addr = 2
addr == 16'h3a8 ? 16'h0414 :  // <0539> b = m9k_data
addr == 16'h3a9 ? 16'h0002 :  // <0540> a = i
addr == 16'h3aa ? 16'he407 :  // <0541> bn eq :next_reg
addr == 16'h3ab ? 16'h0379 :  // <0541> "
addr == 16'h3ac ? 16'hf808 :  // <0542> pop rtna // end_func
addr == 16'h3ad ? 16'h0c08 :  // <0542> pop j // "
addr == 16'h3ae ? 16'h0808 :  // <0542> pop i // "
addr == 16'h3af ? 16'hfc00 :  // <0542> swapra = nop

// print a fixed-length string from packed words in TARGET program space.
// pass its word address (not its byte address) in a,  its length (bytes) in b.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_fixed_target // = 0x03b0
addr == 16'h3b0 ? 16'h2002 :  // <0549> push i // func print_fixed_target
addr == 16'h3b1 ? 16'h2003 :  // <0549> push j // "
addr == 16'h3b2 ? 16'h2004 :  // <0549> push x // "
addr == 16'h3b3 ? 16'h2005 :  // <0549> push y // "
addr == 16'h3b4 ? 16'h2006 :  // <0549> push g6 // "
addr == 16'h3b5 ? 16'h203e :  // <0549> push rtna // "
addr == 16'h3b6 ? 16'h0800 :  // <0550> i = a
addr == 16'h3b7 ? 16'h0e01 :  // <0551> j = 1
addr == 16'h3b8 ? 16'h1001 :  // <0552> x = b
addr == 16'h3b9 ? 16'h1760 :  // <0553> y = -1
// :next_word // = 0x03ba
addr == 16'h3ba ? 16'he002 :  // <0555> br xz :done
addr == 16'h3bb ? 16'h03d0 :  // <0555> "
addr == 16'h3bc ? 16'h1320 :  // <0556> x = ad2
addr == 16'h3bd ? 16'h4c02 :  // <0557> m9k_addr = i
addr == 16'h3be ? 16'h1814 :  // <0558> g6 = m9k_data
// now x = bytes remaining, i = current word address, g6 = data word.
addr == 16'h3bf ? 16'h0006 :  // <0560> a = g6 // putchar g6
addr == 16'h3c0 ? 16'hfba0 :  // <0560> putchar g6
addr == 16'h3c1 ? 16'h0004 :  // <0560> "
addr == 16'h3c2 ? 16'hfc00 :  // <0560> "
addr == 16'h3c3 ? 16'he002 :  // <0561> br xz :done
addr == 16'h3c4 ? 16'h03d0 :  // <0561> "
addr == 16'h3c5 ? 16'h1320 :  // <0562> x = ad2
addr == 16'h3c6 ? 16'h0006 :  // <0563> a = g6
addr == 16'h3c7 ? 16'h0353 :  // <0564> a = a>>4
addr == 16'h3c8 ? 16'h0353 :  // <0565> a = a>>4
addr == 16'h3c9 ? 16'hfba0 :  // <0566> putchar a
addr == 16'h3ca ? 16'h0004 :  // <0566> "
addr == 16'h3cb ? 16'hfc00 :  // <0566> "
addr == 16'h3cc ? 16'hc800 :  // <0567> i = i+j
addr == 16'h3cd ? 16'h0b10 :  // <0567> "
addr == 16'h3ce ? 16'he00f :  // <0568> jmp :next_word
addr == 16'h3cf ? 16'h03ba :  // <0568> "
// :done // = 0x03d0
addr == 16'h3d0 ? 16'hf808 :  // <0570> pop rtna // end_func
addr == 16'h3d1 ? 16'h1808 :  // <0570> pop g6 // "
addr == 16'h3d2 ? 16'h1408 :  // <0570> pop y // "
addr == 16'h3d3 ? 16'h1008 :  // <0570> pop x // "
addr == 16'h3d4 ? 16'h0c08 :  // <0570> pop j // "
addr == 16'h3d5 ? 16'h0808 :  // <0570> pop i // "
addr == 16'h3d6 ? 16'hfc00 :  // <0570> swapra = nop

// ######## func load_program // = 0x03d7
addr == 16'h3d7 ? 16'h2002 :  // <0573> push i // func load_program
addr == 16'h3d8 ? 16'h2003 :  // <0573> push j // "
addr == 16'h3d9 ? 16'h2004 :  // <0573> push x // "
addr == 16'h3da ? 16'h203e :  // <0573> push rtna // "
// load target program from UART.

// length, little-endian.  memorize in x.
addr == 16'h3db ? 16'h03a0 :  // <0577> a = :eol_msg // puteol
addr == 16'h3dc ? 16'h0002 :  // <0577> "
addr == 16'h3dd ? 16'hfba0 :  // <0577> puteol
addr == 16'h3de ? 16'h00eb :  // <0577> "
addr == 16'h3df ? 16'hfc00 :  // <0577> "
addr == 16'h3e0 ? 16'h024c :  // <0578> a = 76 // putasc L
addr == 16'h3e1 ? 16'hfba0 :  // <0578> putasc L
addr == 16'h3e2 ? 16'h0004 :  // <0578> "
addr == 16'h3e3 ? 16'hfc00 :  // <0578> "
addr == 16'h3e4 ? 16'hfba0 :  // <0579> get16 x
addr == 16'h3e5 ? 16'h0013 :  // <0579> "
addr == 16'h3e6 ? 16'hfc00 :  // <0579> "
addr == 16'h3e7 ? 16'h2000 :  // <0579> push a // "
addr == 16'h3e8 ? 16'hfba0 :  // <0579> "
addr == 16'h3e9 ? 16'h0013 :  // <0579> "
addr == 16'h3ea ? 16'hfc00 :  // <0579> "
addr == 16'h3eb ? 16'h0352 :  // <0579> "
addr == 16'h3ec ? 16'h0352 :  // <0579> "
addr == 16'h3ed ? 16'h0408 :  // <0579> pop b // "
addr == 16'h3ee ? 16'hc800 :  // <0579> "
addr == 16'h3ef ? 16'h1334 :  // <0579> "
addr == 16'h3f0 ? 16'h0004 :  // <0580> a = x
addr == 16'h3f1 ? 16'hfba0 :  // <0581> call :put4x
addr == 16'h3f2 ? 16'h005f :  // <0581> "
addr == 16'h3f3 ? 16'hfc00 :  // <0581> "
addr == 16'h3f4 ? 16'h03a0 :  // <0582> a = :eol_msg // puteol
addr == 16'h3f5 ? 16'h0002 :  // <0582> "
addr == 16'h3f6 ? 16'hfba0 :  // <0582> puteol
addr == 16'h3f7 ? 16'h00eb :  // <0582> "
addr == 16'h3f8 ? 16'hfc00 :  // <0582> "

// put target into reset again, in case this is a target warm boot.
addr == 16'h3f9 ? 16'h3e02 :  // <0585> bus_ctrl = $tg_reset_mask

// load opcodes.  count up address in i.
addr == 16'h3fa ? 16'h0a00 :  // <0588> i = 0
addr == 16'h3fb ? 16'h0e01 :  // <0589> j = 1
addr == 16'h3fc ? 16'hfba0 :  // <0590> call :fletcher16_init
addr == 16'h3fd ? 16'h010c :  // <0590> "
addr == 16'h3fe ? 16'hfc00 :  // <0590> "
// :loadword // = 0x03ff
// receive, store in RAM.
addr == 16'h3ff ? 16'hfba0 :  // <0593> get16 a
addr == 16'h400 ? 16'h0013 :  // <0593> "
addr == 16'h401 ? 16'hfc00 :  // <0593> "
addr == 16'h402 ? 16'h2000 :  // <0593> push a // "
addr == 16'h403 ? 16'hfba0 :  // <0593> "
addr == 16'h404 ? 16'h0013 :  // <0593> "
addr == 16'h405 ? 16'hfc00 :  // <0593> "
addr == 16'h406 ? 16'h0352 :  // <0593> "
addr == 16'h407 ? 16'h0352 :  // <0593> "
addr == 16'h408 ? 16'h0408 :  // <0593> pop b // "
addr == 16'h409 ? 16'hc800 :  // <0593> "
addr == 16'h40a ? 16'h0334 :  // <0593> "
addr == 16'h40b ? 16'h4c02 :  // <0594> m9k_addr = i
addr == 16'h40c ? 16'h5000 :  // <0595> m9k_data = a

// read back from RAM and build checksum.
addr == 16'h40d ? 16'h0014 :  // <0598> a = m9k_data
addr == 16'h40e ? 16'hfba0 :  // <0599> call :fletcher16_input16
addr == 16'h40f ? 16'h012b :  // <0599> "
addr == 16'h410 ? 16'hfc00 :  // <0599> "

//  show decimated feedback text, for more speed:
addr == 16'h411 ? 16'h0002 :  // <0602> a = i
addr == 16'h412 ? 16'h061f :  // <0603> b = 0x1f
addr == 16'h413 ? 16'he403 :  // <0604> bn and0z :skip_text
addr == 16'h414 ? 16'h0419 :  // <0604> "
addr == 16'h415 ? 16'h022e :  // <0605> a = 46 // putasc "."
addr == 16'h416 ? 16'hfba0 :  // <0605> putasc "."
addr == 16'h417 ? 16'h0004 :  // <0605> "
addr == 16'h418 ? 16'hfc00 :  // <0605> "
// :skip_text // = 0x0419

addr == 16'h419 ? 16'hc800 :  // <0608> i = i+j
addr == 16'h41a ? 16'h0b10 :  // <0608> "
addr == 16'h41b ? 16'h0002 :  // <0609> a = i
addr == 16'h41c ? 16'h0404 :  // <0610> b = x
addr == 16'h41d ? 16'he407 :  // <0611> bn eq :loadword
addr == 16'h41e ? 16'h03ff :  // <0611> "
addr == 16'h41f ? 16'h03a0 :  // <0612> a = :eol_msg // puteol
addr == 16'h420 ? 16'h0002 :  // <0612> "
addr == 16'h421 ? 16'hfba0 :  // <0612> puteol
addr == 16'h422 ? 16'h00eb :  // <0612> "
addr == 16'h423 ? 16'hfc00 :  // <0612> "
addr == 16'h424 ? 16'hfba0 :  // <0613> call :fletcher16_result
addr == 16'h425 ? 16'h013c :  // <0613> "
addr == 16'h426 ? 16'hfc00 :  // <0613> "
addr == 16'h427 ? 16'hfba0 :  // <0614> call :put4x
addr == 16'h428 ? 16'h005f :  // <0614> "
addr == 16'h429 ? 16'hfc00 :  // <0614> "
addr == 16'h42a ? 16'h03a0 :  // <0615> a = :eol_msg // puteol
addr == 16'h42b ? 16'h0002 :  // <0615> "
addr == 16'h42c ? 16'hfba0 :  // <0615> puteol
addr == 16'h42d ? 16'h00eb :  // <0615> "
addr == 16'h42e ? 16'hfc00 :  // <0615> "
addr == 16'h42f ? 16'hf808 :  // <0616> pop rtna // end_func
addr == 16'h430 ? 16'h1008 :  // <0616> pop x // "
addr == 16'h431 ? 16'h0c08 :  // <0616> pop j // "
addr == 16'h432 ? 16'h0808 :  // <0616> pop i // "
addr == 16'h433 ? 16'hfc00 :  // <0616> swapra = nop


        
                16'hxxxx;
        endmodule
    
