
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


addr == 16'h00 ? 16'he00f :  // <0072> jmp :main
addr == 16'h01 ? 16'h014d :  // <0072> "


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
addr == 16'h12 ? 16'hfc00 :  // <0061> swapra = nop

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
addr == 16'h1b ? 16'hfc00 :  // <0075> swapra = nop

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
addr == 16'h24 ? 16'hfc00 :  // <0088> swapra = nop
// :none // = 0x0025
addr == 16'h25 ? 16'h0360 :  // <0091> a = -1
addr == 16'h26 ? 16'hfc00 :  // <0091> swapra = nop



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
addr == 16'h31 ? 16'hfc00 :  // <0011> swapra = nop
// :pick_byte_even // = 0x0032
addr == 16'h32 ? 16'h0350 :  // <0014> a = a>>1
addr == 16'h33 ? 16'h0404 :  // <0015> b = x
addr == 16'h34 ? 16'hc800 :  // <0016> fetch a from a+b
addr == 16'h35 ? 16'hd300 :  // <0016> "
addr == 16'h36 ? 16'h03b0 :  // <0016> "
addr == 16'h37 ? 16'h06ff :  // <0017> b = 0xff
addr == 16'h38 ? 16'hc800 :  // <0018> a = and
addr == 16'h39 ? 16'h0330 :  // <0018> "
addr == 16'h3a ? 16'hfc00 :  // <0018> swapra = nop

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
addr == 16'h42 ? 16'h0051 :  // <0031> "
addr == 16'h43 ? 16'h0b10 :  // <0032> i = ad1
addr == 16'h44 ? 16'h0002 :  // <0033> a = i
addr == 16'h45 ? 16'hfba0 :  // <0034> call :fetch_byte
addr == 16'h46 ? 16'h0027 :  // <0034> "
addr == 16'h47 ? 16'hfc00 :  // <0034> "
addr == 16'h48 ? 16'h0405 :  // <0035> b = y
addr == 16'h49 ? 16'he407 :  // <0036> bn eq :again
addr == 16'h4a ? 16'h0041 :  // <0036> "
// :found // = 0x004b
addr == 16'h4b ? 16'h0002 :  // <0038> a = i
addr == 16'h4c ? 16'hf808 :  // <0039> pop rtna // rtn
addr == 16'h4d ? 16'h1408 :  // <0039> pop y // "
addr == 16'h4e ? 16'h0c08 :  // <0039> pop j // "
addr == 16'h4f ? 16'h0808 :  // <0039> pop i // "
addr == 16'h50 ? 16'hfc00 :  // <0038> swapra = nop
// :fail // = 0x0051
addr == 16'h51 ? 16'h0360 :  // <0041> a = -1
addr == 16'h52 ? 16'hf808 :  // <0042> pop rtna // end_func
addr == 16'h53 ? 16'h1408 :  // <0042> pop y // "
addr == 16'h54 ? 16'h0c08 :  // <0042> pop j // "
addr == 16'h55 ? 16'h0808 :  // <0042> pop i // "
addr == 16'h56 ? 16'hfc00 :  // <0041> swapra = nop



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
addr == 16'h60 ? 16'h2006 :  // <0054> push ga // "
addr == 16'h61 ? 16'h203e :  // <0054> push rtna // "
addr == 16'h62 ? 16'h13a0 :  // <0055> x = :hexdigits
addr == 16'h63 ? 16'h0057 :  // <0055> "

addr == 16'h64 ? 16'h1800 :  // <0057> ga = a
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

addr == 16'h72 ? 16'h0006 :  // <0066> a = ga
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

addr == 16'h7f ? 16'h0006 :  // <0074> a = ga
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

addr == 16'h8a ? 16'h0006 :  // <0081> a = ga
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
addr == 16'h95 ? 16'h1808 :  // <0087> pop ga // "
addr == 16'h96 ? 16'h1008 :  // <0087> pop x // "
addr == 16'h97 ? 16'hfc00 :  // <0086> swapra = nop

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// ######## func get4x // = 0x0098
addr == 16'h98 ? 16'h2002 :  // <0091> push i // func get4x
addr == 16'h99 ? 16'h2003 :  // <0091> push j // "
addr == 16'h9a ? 16'h2004 :  // <0091> push x // "
addr == 16'h9b ? 16'h2005 :  // <0091> push y // "
addr == 16'h9c ? 16'h203e :  // <0091> push rtna // "
// y = digit counter
// j = sum
addr == 16'h9d ? 16'h1604 :  // <0094> y = 4
// :again // = 0x009e
addr == 16'h9e ? 16'hfba0 :  // <0096> getchar
addr == 16'h9f ? 16'h0013 :  // <0096> "
addr == 16'ha0 ? 16'hfc00 :  // <0096> "
addr == 16'ha1 ? 16'h13a0 :  // <0097> x = :hexdigits
addr == 16'ha2 ? 16'h0057 :  // <0097> "
addr == 16'ha3 ? 16'h0a10 :  // <0098> i = 16
addr == 16'ha4 ? 16'hfba0 :  // <0099> call :find_in_fetch
addr == 16'ha5 ? 16'h003b :  // <0099> "
addr == 16'ha6 ? 16'hfc00 :  // <0099> "
addr == 16'ha7 ? 16'h0760 :  // <0100> b = -1
addr == 16'ha8 ? 16'he007 :  // <0101> br eq :fail
addr == 16'ha9 ? 16'h00bd :  // <0101> "
addr == 16'haa ? 16'h0400 :  // <0102> b = a
addr == 16'hab ? 16'h0003 :  // <0103> a = j
addr == 16'hac ? 16'h0352 :  // <0104> a = a<<4
addr == 16'had ? 16'hc800 :  // <0105> j = or
addr == 16'hae ? 16'h0f34 :  // <0105> "
addr == 16'haf ? 16'h1360 :  // <0106> x = -1
addr == 16'hb0 ? 16'hc800 :  // <0107> y = x+y
addr == 16'hb1 ? 16'h1720 :  // <0107> "
addr == 16'hb2 ? 16'h0005 :  // <0108> a = y
addr == 16'hb3 ? 16'he400 :  // <0109> bn az :again
addr == 16'hb4 ? 16'h009e :  // <0109> "
addr == 16'hb5 ? 16'h0003 :  // <0110> a = j
addr == 16'hb6 ? 16'h0600 :  // <0111> b = 0
addr == 16'hb7 ? 16'hf808 :  // <0112> pop rtna // rtn
addr == 16'hb8 ? 16'h1408 :  // <0112> pop y // "
addr == 16'hb9 ? 16'h1008 :  // <0112> pop x // "
addr == 16'hba ? 16'h0c08 :  // <0112> pop j // "
addr == 16'hbb ? 16'h0808 :  // <0112> pop i // "
addr == 16'hbc ? 16'hfc00 :  // <0111> swapra = nop
// :fail // = 0x00bd
addr == 16'hbd ? 16'h0760 :  // <0114> b = -1
addr == 16'hbe ? 16'hf808 :  // <0115> pop rtna // end_func
addr == 16'hbf ? 16'h1408 :  // <0115> pop y // "
addr == 16'hc0 ? 16'h1008 :  // <0115> pop x // "
addr == 16'hc1 ? 16'h0c08 :  // <0115> pop j // "
addr == 16'hc2 ? 16'h0808 :  // <0115> pop i // "
addr == 16'hc3 ? 16'hfc00 :  // <0114> swapra = nop

// print a fixed-length string from packed words in program space.
// pass its word address (not its byte address) in a,  its length (bytes) in b.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_fixed // = 0x00c4
addr == 16'hc4 ? 16'h2002 :  // <0121> push i // func print_fixed
addr == 16'hc5 ? 16'h2003 :  // <0121> push j // "
addr == 16'hc6 ? 16'h2004 :  // <0121> push x // "
addr == 16'hc7 ? 16'h2005 :  // <0121> push y // "
addr == 16'hc8 ? 16'h2006 :  // <0121> push ga // "
addr == 16'hc9 ? 16'h203e :  // <0121> push rtna // "
addr == 16'hca ? 16'h0800 :  // <0122> i = a
addr == 16'hcb ? 16'h0e01 :  // <0123> j = 1
addr == 16'hcc ? 16'h1001 :  // <0124> x = b
addr == 16'hcd ? 16'h1760 :  // <0125> y = -1
// :next_word // = 0x00ce
addr == 16'hce ? 16'he002 :  // <0127> br xz :done
addr == 16'hcf ? 16'h00e4 :  // <0127> "
addr == 16'hd0 ? 16'h1320 :  // <0128> x = ad2
addr == 16'hd1 ? 16'hd002 :  // <0129> fetch ga from i
addr == 16'hd2 ? 16'h1bb0 :  // <0129> "
// now x = bytes remaining, i = current word address, ga = data word.
addr == 16'hd3 ? 16'h0006 :  // <0131> a = ga // putchar ga
addr == 16'hd4 ? 16'hfba0 :  // <0131> putchar ga
addr == 16'hd5 ? 16'h0004 :  // <0131> "
addr == 16'hd6 ? 16'hfc00 :  // <0131> "
addr == 16'hd7 ? 16'he002 :  // <0132> br xz :done
addr == 16'hd8 ? 16'h00e4 :  // <0132> "
addr == 16'hd9 ? 16'h1320 :  // <0133> x = ad2
addr == 16'hda ? 16'h0006 :  // <0134> a = ga
addr == 16'hdb ? 16'h0353 :  // <0135> a = a>>4
addr == 16'hdc ? 16'h0353 :  // <0136> a = a>>4
addr == 16'hdd ? 16'hfba0 :  // <0137> putchar a
addr == 16'hde ? 16'h0004 :  // <0137> "
addr == 16'hdf ? 16'hfc00 :  // <0137> "
addr == 16'he0 ? 16'hc800 :  // <0138> i = i+j
addr == 16'he1 ? 16'h0b10 :  // <0138> "
addr == 16'he2 ? 16'he00f :  // <0139> jmp :next_word
addr == 16'he3 ? 16'h00ce :  // <0139> "
// :done // = 0x00e4
addr == 16'he4 ? 16'hf808 :  // <0141> pop rtna // end_func
addr == 16'he5 ? 16'h1808 :  // <0141> pop ga // "
addr == 16'he6 ? 16'h1408 :  // <0141> pop y // "
addr == 16'he7 ? 16'h1008 :  // <0141> pop x // "
addr == 16'he8 ? 16'h0c08 :  // <0141> pop j // "
addr == 16'he9 ? 16'h0808 :  // <0141> pop i // "
addr == 16'hea ? 16'hfc00 :  // <0140> swapra = nop

// print a null-terminated string from packed words in program space.
// pass its word address (not its byte address) in a.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_nt // = 0x00eb
addr == 16'heb ? 16'h2002 :  // <0147> push i // func print_nt
addr == 16'hec ? 16'h2003 :  // <0147> push j // "
addr == 16'hed ? 16'h2004 :  // <0147> push x // "
addr == 16'hee ? 16'h203e :  // <0147> push rtna // "
addr == 16'hef ? 16'h0800 :  // <0148> i = a
addr == 16'hf0 ? 16'h0e01 :  // <0149> j = 1
// :next_word // = 0x00f1
addr == 16'hf1 ? 16'hd002 :  // <0151> fetch x from i
addr == 16'hf2 ? 16'h13b0 :  // <0151> "
// now i = current word address, x = data word, b = low byte mask, a = data byte.
addr == 16'hf3 ? 16'h0004 :  // <0153> a = x
addr == 16'hf4 ? 16'h06ff :  // <0154> b = 0xff
addr == 16'hf5 ? 16'he003 :  // <0155> br and0z :done
addr == 16'hf6 ? 16'h0107 :  // <0155> "
addr == 16'hf7 ? 16'hfba0 :  // <0156> putchar a
addr == 16'hf8 ? 16'h0004 :  // <0156> "
addr == 16'hf9 ? 16'hfc00 :  // <0156> "
addr == 16'hfa ? 16'h0004 :  // <0157> a = x
addr == 16'hfb ? 16'h0353 :  // <0158> a = a>>4
addr == 16'hfc ? 16'h0353 :  // <0159> a = a>>4
addr == 16'hfd ? 16'h06ff :  // <0160> b = 0xff
addr == 16'hfe ? 16'he003 :  // <0161> br and0z :done
addr == 16'hff ? 16'h0107 :  // <0161> "
addr == 16'h100 ? 16'hfba0 :  // <0162> putchar a
addr == 16'h101 ? 16'h0004 :  // <0162> "
addr == 16'h102 ? 16'hfc00 :  // <0162> "
addr == 16'h103 ? 16'hc800 :  // <0163> i = i+j
addr == 16'h104 ? 16'h0b10 :  // <0163> "
addr == 16'h105 ? 16'he00f :  // <0164> jmp :next_word
addr == 16'h106 ? 16'h00f1 :  // <0164> "
// :done // = 0x0107
addr == 16'h107 ? 16'hf808 :  // <0166> pop rtna // end_func
addr == 16'h108 ? 16'h1008 :  // <0166> pop x // "
addr == 16'h109 ? 16'h0c08 :  // <0166> pop j // "
addr == 16'h10a ? 16'h0808 :  // <0166> pop i // "
addr == 16'h10b ? 16'hfc00 :  // <0165> swapra = nop




// ######## func fletcher16_init // = 0x010c

addr == 16'h10c ? 16'h1a00 :  // <0005> $fletcher_sum1_reg = 0
addr == 16'h10d ? 16'h1e00 :  // <0006> $fletcher_sum2_reg = 0

addr == 16'h10e ? 16'hfc00 :  // <0008> swapra = nop

// return the modulus(255) of a given number.
// ######## func mod255 // = 0x010f

// while a is greater than 254, subtract 255.
// :mod255_again // = 0x010f
addr == 16'h10f ? 16'h06fe :  // <0013> b = 0xfe
addr == 16'h110 ? 16'he006 :  // <0014> br gt :mod255_greater
addr == 16'h111 ? 16'h0113 :  // <0014> "
addr == 16'h112 ? 16'hfc00 :  // <0014> swapra = nop
// :mod255_greater // = 0x0113
addr == 16'h113 ? 16'h07a0 :  // <0017> b = ([negate 0xff])
addr == 16'h114 ? 16'hff01 :  // <0017> "
addr == 16'h115 ? 16'hc800 :  // <0018> a = a+b
addr == 16'h116 ? 16'h0300 :  // <0018> "
addr == 16'h117 ? 16'he00f :  // <0019> jmp :mod255_again
addr == 16'h118 ? 16'h010f :  // <0019> "

addr == 16'h119 ? 16'hfc00 :  // <0021> swapra = nop

// accumulate a Fletcher16 checksum, given the next byte of data.
// ######## func fletcher16_input8 // = 0x011a
addr == 16'h11a ? 16'h203e :  // <0046> push rtna // func fletcher16_input8

//TODO: debug only.
//x = a
//putasc " "
//a = x
//call put4x
//a = x

addr == 16'h11b ? 16'h0406 :  // <0031> b = $fletcher_sum1_reg
addr == 16'h11c ? 16'hc800 :  // <0032> a = a+b
addr == 16'h11d ? 16'h0300 :  // <0032> "
addr == 16'h11e ? 16'hfba0 :  // <0032> callx mod255  a+b  $fletcher_sum1_reg
addr == 16'h11f ? 16'h010f :  // <0032> "
addr == 16'h120 ? 16'hfc00 :  // <0032> "
addr == 16'h121 ? 16'h1800 :  // <0032> ga = a

addr == 16'h122 ? 16'h0006 :  // <0034> a = $fletcher_sum1_reg
addr == 16'h123 ? 16'h0407 :  // <0035> b = $fletcher_sum2_reg
addr == 16'h124 ? 16'hc800 :  // <0036> a = a+b
addr == 16'h125 ? 16'h0300 :  // <0036> "
addr == 16'h126 ? 16'hfba0 :  // <0036> callx mod255  a+b  $fletcher_sum2_reg
addr == 16'h127 ? 16'h010f :  // <0036> "
addr == 16'h128 ? 16'hfc00 :  // <0036> "
addr == 16'h129 ? 16'h1c00 :  // <0036> gb = a

//TODO: debug only.
//putasc " "
//a =  $fletcher_sum2_reg
//call put4x
//putasc " "
//a =  $fletcher_sum1_reg
//call put4x
//puteol

addr == 16'h12a ? 16'hf808 :  // <0047> pop rtna // func fletcher16_input8
addr == 16'h12b ? 16'hfc00 :  // <0047> swapra = nop

// accumulate a Fletcher16 checksum, given the next word of data.
// ######## func fletcher16_input16 // = 0x012c
addr == 16'h12c ? 16'h2002 :  // <0055> push i // func fletcher16_input16
addr == 16'h12d ? 16'h203e :  // <0055> push rtna // "

addr == 16'h12e ? 16'h0b53 :  // <0050> i = a>>4
addr == 16'h12f ? 16'h06ff :  // <0051> b = 0xff
addr == 16'h130 ? 16'hc800 :  // <0052> a = and
addr == 16'h131 ? 16'h0330 :  // <0052> "
addr == 16'h132 ? 16'hfba0 :  // <0052> callx fletcher16_input8  and
addr == 16'h133 ? 16'h011a :  // <0052> "
addr == 16'h134 ? 16'hfc00 :  // <0052> "
addr == 16'h135 ? 16'h0002 :  // <0053> a = i
addr == 16'h136 ? 16'h0353 :  // <0054> a = a>>4
addr == 16'h137 ? 16'hfba0 :  // <0054> callx fletcher16_input8  a>>4
addr == 16'h138 ? 16'h011a :  // <0054> "
addr == 16'h139 ? 16'hfc00 :  // <0054> "

addr == 16'h13a ? 16'hf808 :  // <0056> pop rtna // func fletcher16_input16
addr == 16'h13b ? 16'h0808 :  // <0056> pop i // "
addr == 16'h13c ? 16'hfc00 :  // <0056> swapra = nop

// return the combined 16-bit result of Fletcher16 checksum.
// ######## func fletcher16_result // = 0x013d

addr == 16'h13d ? 16'h0007 :  // <0059> a = $fletcher_sum2_reg
addr == 16'h13e ? 16'h0352 :  // <0060> a = a<<4
addr == 16'h13f ? 16'h0352 :  // <0061> a = a<<4
addr == 16'h140 ? 16'h0406 :  // <0062> b = $fletcher_sum1_reg
addr == 16'h141 ? 16'hc800 :  // <0063> result = or
addr == 16'h142 ? 16'h0334 :  // <0063> "
addr == 16'h143 ? 16'hfc00 :  // <0062> swapra = nop

addr == 16'h144 ? 16'hfc00 :  // <0065> swapra = nop




// :boot_msg // = 0x0145
// "\r\nVISOR\x0"
addr == 16'h145 ? 16'h0a0d :  // <0091>   
addr == 16'h146 ? 16'h4956 :  // <0091> IV
addr == 16'h147 ? 16'h4f53 :  // <0091> OS
addr == 16'h148 ? 16'h0052 :  // <0091>  R
// :running_msg // = 0x0149
// "\r\nRUN >\x0"
addr == 16'h149 ? 16'h0a0d :  // <0093>   
addr == 16'h14a ? 16'h5552 :  // <0093> UR
addr == 16'h14b ? 16'h204e :  // <0093>  N
addr == 16'h14c ? 16'h003e :  // <0093>  >

// ////////////////////////////////////////////
// :main // = 0x014d
// put target into reset.
addr == 16'h14d ? 16'h3e02 :  // <0098> bus_ctrl = $tg_reset_mask

// init visor.
addr == 16'h14e ? 16'h3360 :  // <0101> bp3_addr = $bp_disable
addr == 16'h14f ? 16'h2f60 :  // <0102> bp2_addr = $bp_disable
addr == 16'h150 ? 16'h2b60 :  // <0103> bp1_addr = $bp_disable
addr == 16'h151 ? 16'h2760 :  // <0104> bp0_addr = $bp_disable

// startup message
addr == 16'h152 ? 16'h03a0 :  // <0107> a = :boot_msg
addr == 16'h153 ? 16'h0145 :  // <0107> "
addr == 16'h154 ? 16'hfba0 :  // <0108> call :print_nt
addr == 16'h155 ? 16'h00eb :  // <0108> "
addr == 16'h156 ? 16'hfc00 :  // <0108> "

// check for bootloader signal.
addr == 16'h157 ? 16'h0019 :  // <0111> a = boot_break
addr == 16'h158 ? 16'he400 :  // <0112> bn az :boot_run
addr == 16'h159 ? 16'h0160 :  // <0112> "
// ^^^ for press-to-debug; runs target by default.
// br az :boot_run
// ^^^ for press-to-run; debugs target by default.

// step into the first target instruction.
addr == 16'h15a ? 16'h3e08 :  // <0118> bus_ctrl = $bp_step_mask
addr == 16'h15b ? 16'hfba0 :  // <0119> call :wait_for_bp
addr == 16'h15c ? 16'h0306 :  // <0119> "
addr == 16'h15d ? 16'hfc00 :  // <0119> "
addr == 16'h15e ? 16'he00f :  // <0120> jmp :cmd_loop
addr == 16'h15f ? 16'h0161 :  // <0120> "
// :boot_run // = 0x0160
// release target reset, to run.
addr == 16'h160 ? 16'h3e00 :  // <0123> bus_ctrl = 0

// command prompt loop.
// :cmd_loop // = 0x0161
addr == 16'h161 ? 16'h000f :  // <0127> a = bus_ctrl
addr == 16'h162 ? 16'h0600 :  // <0128> b = 0
addr == 16'h163 ? 16'he007 :  // <0129> br eq :running_prompt
addr == 16'h164 ? 16'h0186 :  // <0129> "

addr == 16'h165 ? 16'hfba0 :  // <0131> call :dump_target
addr == 16'h166 ? 16'h03ae :  // <0131> "
addr == 16'h167 ? 16'hfc00 :  // <0131> "
addr == 16'h168 ? 16'h0016 :  // <0132> a = tg_code_addr
addr == 16'h169 ? 16'hfba0 :  // <0133> call :put4x
addr == 16'h16a ? 16'h005f :  // <0133> "
addr == 16'h16b ? 16'hfc00 :  // <0133> "
addr == 16'h16c ? 16'h022c :  // <0134> a = 44 // putasc ","
addr == 16'h16d ? 16'hfba0 :  // <0134> putasc ","
addr == 16'h16e ? 16'h0004 :  // <0134> "
addr == 16'h16f ? 16'hfc00 :  // <0134> "
addr == 16'h170 ? 16'h0015 :  // <0135> a = exr_shadow
addr == 16'h171 ? 16'hfba0 :  // <0136> call :put4x
addr == 16'h172 ? 16'h005f :  // <0136> "
addr == 16'h173 ? 16'hfc00 :  // <0136> "
addr == 16'h174 ? 16'h0220 :  // <0137> a = 32 // putasc " "
addr == 16'h175 ? 16'hfba0 :  // <0137> putasc " "
addr == 16'h176 ? 16'h0004 :  // <0137> "
addr == 16'h177 ? 16'hfc00 :  // <0137> "
addr == 16'h178 ? 16'h023e :  // <0138> a = 62 // putasc ">"
addr == 16'h179 ? 16'hfba0 :  // <0138> putasc ">"
addr == 16'h17a ? 16'h0004 :  // <0138> "
addr == 16'h17b ? 16'hfc00 :  // <0138> "
addr == 16'h17c ? 16'hfba0 :  // <0139> getchar_echo
addr == 16'h17d ? 16'h0013 :  // <0139> "
addr == 16'h17e ? 16'hfc00 :  // <0139> "
addr == 16'h17f ? 16'h2000 :  // <0139> push a // "
addr == 16'h180 ? 16'hfba0 :  // <0139> "
addr == 16'h181 ? 16'h0004 :  // <0139> "
addr == 16'h182 ? 16'hfc00 :  // <0139> "
addr == 16'h183 ? 16'h0008 :  // <0139> pop a // "
addr == 16'h184 ? 16'he00f :  // <0140> jmp :parse_cmd
addr == 16'h185 ? 16'h0197 :  // <0140> "

// :running_prompt // = 0x0186
addr == 16'h186 ? 16'h03a0 :  // <0143> a = :running_msg
addr == 16'h187 ? 16'h0149 :  // <0143> "
addr == 16'h188 ? 16'hfba0 :  // <0144> call :print_nt
addr == 16'h189 ? 16'h00eb :  // <0144> "
addr == 16'h18a ? 16'hfc00 :  // <0144> "
// :run_poll // = 0x018b
addr == 16'h18b ? 16'hfba0 :  // <0146> pollchar
addr == 16'h18c ? 16'h001c :  // <0146> "
addr == 16'h18d ? 16'hfc00 :  // <0146> "
addr == 16'h18e ? 16'h0760 :  // <0147> b = -1
addr == 16'h18f ? 16'he407 :  // <0148> bn eq :parse_cmd
addr == 16'h190 ? 16'h0197 :  // <0148> "
addr == 16'h191 ? 16'h0018 :  // <0149> a = bp_status
addr == 16'h192 ? 16'he000 :  // <0150> br az :run_poll
addr == 16'h193 ? 16'h018b :  // <0150> "
// target hit a breakpoint; switch to stepping mode.
addr == 16'h194 ? 16'h3e08 :  // <0152> bus_ctrl = $bp_step_mask
addr == 16'h195 ? 16'he00f :  // <0153> jmp :cmd_loop
addr == 16'h196 ? 16'h0161 :  // <0153> "

// :parse_cmd // = 0x0197

// command = step next instruction.
addr == 16'h197 ? 16'h066e :  // <0158> b = 110 // asc b = "n"
addr == 16'h198 ? 16'he407 :  // <0159> bn eq :skip_step
addr == 16'h199 ? 16'h019f :  // <0159> "
addr == 16'h19a ? 16'hfba0 :  // <0160> call :step_target
addr == 16'h19b ? 16'h01e0 :  // <0160> "
addr == 16'h19c ? 16'hfc00 :  // <0160> "
addr == 16'h19d ? 16'he00f :  // <0161> jmp :cmd_loop
addr == 16'h19e ? 16'h0161 :  // <0161> "
// :skip_step // = 0x019f

// command = reset target.
addr == 16'h19f ? 16'h0652 :  // <0165> b = 82 // asc b = "R"
addr == 16'h1a0 ? 16'he407 :  // <0166> bn eq :skip_reset
addr == 16'h1a1 ? 16'h01ab :  // <0166> "
addr == 16'h1a2 ? 16'h3e02 :  // <0167> bus_ctrl = $tg_reset_mask
addr == 16'h1a3 ? 16'hc800 :  // <0168> nop
addr == 16'h1a4 ? 16'hc800 :  // <0169> nop
addr == 16'h1a5 ? 16'h3e08 :  // <0170> bus_ctrl = $bp_step_mask
addr == 16'h1a6 ? 16'hfba0 :  // <0171> call :wait_for_bp
addr == 16'h1a7 ? 16'h0306 :  // <0171> "
addr == 16'h1a8 ? 16'hfc00 :  // <0171> "
addr == 16'h1a9 ? 16'he00f :  // <0172> jmp :cmd_loop
addr == 16'h1aa ? 16'h0161 :  // <0172> "
// :skip_reset // = 0x01ab

// command = load program.
addr == 16'h1ab ? 16'h066c :  // <0176> b = 108 // asc b = "l"
addr == 16'h1ac ? 16'he407 :  // <0177> bn eq :skip_load
addr == 16'h1ad ? 16'h01b6 :  // <0177> "
addr == 16'h1ae ? 16'hfba0 :  // <0178> call :step_until_safe
addr == 16'h1af ? 16'h01ee :  // <0178> "
addr == 16'h1b0 ? 16'hfc00 :  // <0178> "
addr == 16'h1b1 ? 16'hfba0 :  // <0179> call :load_program
addr == 16'h1b2 ? 16'h0425 :  // <0179> "
addr == 16'h1b3 ? 16'hfc00 :  // <0179> "
addr == 16'h1b4 ? 16'he00f :  // <0180> jmp :cmd_loop
addr == 16'h1b5 ? 16'h0161 :  // <0180> "
// :skip_load // = 0x01b6

// command = run full speed.
addr == 16'h1b6 ? 16'h0672 :  // <0184> b = 114 // asc b = "r"
addr == 16'h1b7 ? 16'he407 :  // <0185> bn eq :skip_run
addr == 16'h1b8 ? 16'h01bd :  // <0185> "
// release target reset, to run.
addr == 16'h1b9 ? 16'h3e00 :  // <0187> bus_ctrl = 0
addr == 16'h1ba ? 16'h2409 :  // <0188> bp0_addr = bp0_addr
addr == 16'h1bb ? 16'he00f :  // <0189> jmp :cmd_loop
addr == 16'h1bc ? 16'h0161 :  // <0189> "
// :skip_run // = 0x01bd

// command = set breakpoint.
addr == 16'h1bd ? 16'h0662 :  // <0193> b = 98 // asc b = "b"
addr == 16'h1be ? 16'he407 :  // <0194> bn eq :skip_setbrk
addr == 16'h1bf ? 16'h01c5 :  // <0194> "
addr == 16'h1c0 ? 16'hfba0 :  // <0195> call :set_bp
addr == 16'h1c1 ? 16'h030a :  // <0195> "
addr == 16'h1c2 ? 16'hfc00 :  // <0195> "
addr == 16'h1c3 ? 16'he00f :  // <0196> jmp :cmd_loop
addr == 16'h1c4 ? 16'h0161 :  // <0196> "
// :skip_setbrk // = 0x01c5

// command = poke register.
addr == 16'h1c5 ? 16'h066f :  // <0200> b = 111 // asc b = "o"
addr == 16'h1c6 ? 16'he407 :  // <0201> bn eq :skip_poke
addr == 16'h1c7 ? 16'h01cd :  // <0201> "
addr == 16'h1c8 ? 16'hfba0 :  // <0202> call :poke_cmd
addr == 16'h1c9 ? 16'h0358 :  // <0202> "
addr == 16'h1ca ? 16'hfc00 :  // <0202> "
addr == 16'h1cb ? 16'he00f :  // <0203> jmp :cmd_loop
addr == 16'h1cc ? 16'h0161 :  // <0203> "
// :skip_poke // = 0x01cd

// command = dump Avalon data e.g. from SDRAM.
addr == 16'h1cd ? 16'h0675 :  // <0207> b = 117 // asc b = "u"
addr == 16'h1ce ? 16'he407 :  // <0208> bn eq :skip_dump
addr == 16'h1cf ? 16'h01d5 :  // <0208> "
addr == 16'h1d0 ? 16'hfba0 :  // <0209> call :dump_avalon
addr == 16'h1d1 ? 16'h021c :  // <0209> "
addr == 16'h1d2 ? 16'hfc00 :  // <0209> "
addr == 16'h1d3 ? 16'he00f :  // <0210> jmp :cmd_loop
addr == 16'h1d4 ? 16'h0161 :  // <0210> "
// :skip_dump // = 0x01d5

addr == 16'h1d5 ? 16'h023f :  // <0213> a = 63 // putasc "?"
addr == 16'h1d6 ? 16'hfba0 :  // <0213> putasc "?"
addr == 16'h1d7 ? 16'h0004 :  // <0213> "
addr == 16'h1d8 ? 16'hfc00 :  // <0213> "
addr == 16'h1d9 ? 16'h03a0 :  // <0214> a = :eol_msg // puteol
addr == 16'h1da ? 16'h0002 :  // <0214> "
addr == 16'h1db ? 16'hfba0 :  // <0214> puteol
addr == 16'h1dc ? 16'h00eb :  // <0214> "
addr == 16'h1dd ? 16'hfc00 :  // <0214> "
addr == 16'h1de ? 16'he00f :  // <0215> jmp :cmd_loop
addr == 16'h1df ? 16'h0161 :  // <0215> "


// ######## func step_target // = 0x01e0
addr == 16'h1e0 ? 16'h203e :  // <0244> push rtna // func step_target
addr == 16'h1e1 ? 16'h3e08 :  // <0245> bus_ctrl = $bp_step_mask
addr == 16'h1e2 ? 16'h2409 :  // <0246> bp0_addr = bp0_addr
addr == 16'h1e3 ? 16'hfba0 :  // <0247> call :wait_for_bp
addr == 16'h1e4 ? 16'h0306 :  // <0247> "
addr == 16'h1e5 ? 16'hfc00 :  // <0247> "
addr == 16'h1e6 ? 16'hf808 :  // <0248> pop rtna // end_func
addr == 16'h1e7 ? 16'hfc00 :  // <0247> swapra = nop


// :unsafe_msg // = 0x01e8
// "\r\n!UNSAFE!\r\n"
addr == 16'h1e8 ? 16'h0a0d :  // <0252>   
addr == 16'h1e9 ? 16'h5521 :  // <0252> U!
addr == 16'h1ea ? 16'h534e :  // <0252> SN
addr == 16'h1eb ? 16'h4641 :  // <0252> FA
addr == 16'h1ec ? 16'h2145 :  // <0252> !E
addr == 16'h1ed ? 16'h0a0d :  // <0252>   

// ######## func step_until_safe // = 0x01ee
addr == 16'h1ee ? 16'h203e :  // <0254> push rtna // func step_until_safe
addr == 16'h1ef ? 16'h0015 :  // <0255> a = exr_shadow
addr == 16'h1f0 ? 16'h07a0 :  // <0256> b = $exr_unsafe_mask
addr == 16'h1f1 ? 16'hc000 :  // <0256> "

addr == 16'h1f2 ? 16'hc800 :  // <0260> a = and
addr == 16'h1f3 ? 16'h0330 :  // <0260> "
addr == 16'h1f4 ? 16'h07a0 :  // <0260> b = 0xc000
addr == 16'h1f5 ? 16'hc000 :  // <0260> "

addr == 16'h1f6 ? 16'he407 :  // <0257> bn eq :else_502
addr == 16'h1f7 ? 16'h01fb :  // <0257> "

// exr shows a branch in progress.  not safe to load a new program right now.
addr == 16'h1f8 ? 16'hfba0 :  // <0259> call step_target
addr == 16'h1f9 ? 16'h01e0 :  // <0259> "
addr == 16'h1fa ? 16'hfc00 :  // <0259> "


addr == 16'h1fb ? 16'h0015 :  // <0262> a = exr_shadow
addr == 16'h1fc ? 16'h07a0 :  // <0263> b = $exr_unsafe_mask
addr == 16'h1fd ? 16'hc000 :  // <0263> "

addr == 16'h1fe ? 16'hc800 :  // <0267> a = and
addr == 16'h1ff ? 16'h0330 :  // <0267> "
addr == 16'h200 ? 16'h07a0 :  // <0267> b = 0xc000
addr == 16'h201 ? 16'hc000 :  // <0267> "

addr == 16'h202 ? 16'he407 :  // <0264> bn eq :else_514
addr == 16'h203 ? 16'h0207 :  // <0264> "

// exr shows a branch in progress.  not safe to load a new program right now.
addr == 16'h204 ? 16'hfba0 :  // <0266> call step_target
addr == 16'h205 ? 16'h01e0 :  // <0266> "
addr == 16'h206 ? 16'hfc00 :  // <0266> "


addr == 16'h207 ? 16'h0015 :  // <0269> a = exr_shadow
addr == 16'h208 ? 16'h07a0 :  // <0270> b = $exr_unsafe_mask
addr == 16'h209 ? 16'hc000 :  // <0270> "

addr == 16'h20a ? 16'hc800 :  // <0276> a = and
addr == 16'h20b ? 16'h0330 :  // <0276> "
addr == 16'h20c ? 16'h07a0 :  // <0276> b = 0xc000
addr == 16'h20d ? 16'hc000 :  // <0276> "

addr == 16'h20e ? 16'he407 :  // <0271> bn eq :else_526
addr == 16'h20f ? 16'h021a :  // <0271> "

// failed to step to a safe state.
addr == 16'h210 ? 16'h03a0 :  // <0273> a = :unsafe_msg
addr == 16'h211 ? 16'h01e8 :  // <0273> "
addr == 16'h212 ? 16'hfba0 :  // <0274> call print_nt
addr == 16'h213 ? 16'h00eb :  // <0274> "
addr == 16'h214 ? 16'hfc00 :  // <0274> "
addr == 16'h215 ? 16'h03a0 :  // <0275> a = :eol_msg // puteol
addr == 16'h216 ? 16'h0002 :  // <0275> "
addr == 16'h217 ? 16'hfba0 :  // <0275> puteol
addr == 16'h218 ? 16'h00eb :  // <0275> "
addr == 16'h219 ? 16'hfc00 :  // <0275> "

addr == 16'h21a ? 16'hf808 :  // <0277> pop rtna // end_func
addr == 16'h21b ? 16'hfc00 :  // <0276> swapra = nop

// ######## func dump_avalon // = 0x021c
addr == 16'h21c ? 16'h2002 :  // <0279> push i // func dump_avalon
addr == 16'h21d ? 16'h2003 :  // <0279> push j // "
addr == 16'h21e ? 16'h2004 :  // <0279> push x // "
addr == 16'h21f ? 16'h2005 :  // <0279> push y // "
addr == 16'h220 ? 16'h2006 :  // <0279> push ga // "
addr == 16'h221 ? 16'h2007 :  // <0279> push gb // "
addr == 16'h222 ? 16'h203e :  // <0279> push rtna // "
// test case: u0010 0011 0013 0012 0000 0000 0080.

// this func may borrow some peripheral registers to hold temporary data.
// but it can only borrow registers that don't have side effects that are relevant to this function.

// parse av_write_data reg address into av_data_regs high byte.
addr == 16'h223 ? 16'hfba0 :  // <0288> call :get4x
addr == 16'h224 ? 16'h0098 :  // <0288> "
addr == 16'h225 ? 16'hfc00 :  // <0288> "
addr == 16'h226 ? 16'h0801 :  // <0289> i = b
addr == 16'h227 ? 16'he401 :  // <0290> bn iz :fail
addr == 16'h228 ? 16'h02df :  // <0290> "
addr == 16'h229 ? 16'h0352 :  // <0291> a = a<<4
addr == 16'h22a ? 16'h1b52 :  // <0292> $av_data_regs = a<<4
addr == 16'h22b ? 16'hfba0 :  // <0293> getchar_echo
addr == 16'h22c ? 16'h0013 :  // <0293> "
addr == 16'h22d ? 16'hfc00 :  // <0293> "
addr == 16'h22e ? 16'h2000 :  // <0293> push a // "
addr == 16'h22f ? 16'hfba0 :  // <0293> "
addr == 16'h230 ? 16'h0004 :  // <0293> "
addr == 16'h231 ? 16'hfc00 :  // <0293> "
addr == 16'h232 ? 16'h0008 :  // <0293> pop a // "

// parse av_read_data reg address into av_data_regs low byte.
addr == 16'h233 ? 16'hfba0 :  // <0296> call :get4x
addr == 16'h234 ? 16'h0098 :  // <0296> "
addr == 16'h235 ? 16'hfc00 :  // <0296> "
addr == 16'h236 ? 16'h0801 :  // <0297> i = b
addr == 16'h237 ? 16'he401 :  // <0298> bn iz :fail
addr == 16'h238 ? 16'h02df :  // <0298> "
addr == 16'h239 ? 16'h0406 :  // <0299> b = $av_data_regs
addr == 16'h23a ? 16'hc800 :  // <0300> $av_data_regs = or
addr == 16'h23b ? 16'h1b34 :  // <0300> "
addr == 16'h23c ? 16'hfba0 :  // <0301> getchar_echo
addr == 16'h23d ? 16'h0013 :  // <0301> "
addr == 16'h23e ? 16'hfc00 :  // <0301> "
addr == 16'h23f ? 16'h2000 :  // <0301> push a // "
addr == 16'h240 ? 16'hfba0 :  // <0301> "
addr == 16'h241 ? 16'h0004 :  // <0301> "
addr == 16'h242 ? 16'hfc00 :  // <0301> "
addr == 16'h243 ? 16'h0008 :  // <0301> pop a // "

// parse av_ad_lo reg address into av_ad_lo_reg.
addr == 16'h244 ? 16'hfba0 :  // <0304> call :get4x
addr == 16'h245 ? 16'h0098 :  // <0304> "
addr == 16'h246 ? 16'hfc00 :  // <0304> "
addr == 16'h247 ? 16'h0801 :  // <0305> i = b
addr == 16'h248 ? 16'he401 :  // <0306> bn iz :fail
addr == 16'h249 ? 16'h02df :  // <0306> "
addr == 16'h24a ? 16'h1c00 :  // <0307> $av_ad_lo_reg = a
addr == 16'h24b ? 16'hfba0 :  // <0308> getchar_echo
addr == 16'h24c ? 16'h0013 :  // <0308> "
addr == 16'h24d ? 16'hfc00 :  // <0308> "
addr == 16'h24e ? 16'h2000 :  // <0308> push a // "
addr == 16'h24f ? 16'hfba0 :  // <0308> "
addr == 16'h250 ? 16'h0004 :  // <0308> "
addr == 16'h251 ? 16'hfc00 :  // <0308> "
addr == 16'h252 ? 16'h0008 :  // <0308> pop a // "

// parse av_ad_hi reg address into x.
addr == 16'h253 ? 16'hfba0 :  // <0311> call :get4x
addr == 16'h254 ? 16'h0098 :  // <0311> "
addr == 16'h255 ? 16'hfc00 :  // <0311> "
addr == 16'h256 ? 16'h0801 :  // <0312> i = b
addr == 16'h257 ? 16'he401 :  // <0313> bn iz :fail
addr == 16'h258 ? 16'h02df :  // <0313> "
addr == 16'h259 ? 16'h1000 :  // <0314> x = a
addr == 16'h25a ? 16'hfba0 :  // <0315> getchar_echo
addr == 16'h25b ? 16'h0013 :  // <0315> "
addr == 16'h25c ? 16'hfc00 :  // <0315> "
addr == 16'h25d ? 16'h2000 :  // <0315> push a // "
addr == 16'h25e ? 16'hfba0 :  // <0315> "
addr == 16'h25f ? 16'h0004 :  // <0315> "
addr == 16'h260 ? 16'hfc00 :  // <0315> "
addr == 16'h261 ? 16'h0008 :  // <0315> pop a // "

// parse start byte address high word into target's avalon master.
addr == 16'h262 ? 16'hfba0 :  // <0318> call :get4x
addr == 16'h263 ? 16'h0098 :  // <0318> "
addr == 16'h264 ? 16'hfc00 :  // <0318> "
addr == 16'h265 ? 16'h0801 :  // <0319> i = b
addr == 16'h266 ? 16'he401 :  // <0320> bn iz :fail
addr == 16'h267 ? 16'h02df :  // <0320> "
addr == 16'h268 ? 16'h3800 :  // <0321> poke_data = a
addr == 16'h269 ? 16'h0004 :  // <0322> a = x
addr == 16'h26a ? 16'hfba0 :  // <0323> call :poke
addr == 16'h26b ? 16'h038f :  // <0323> "
addr == 16'h26c ? 16'hfc00 :  // <0323> "
addr == 16'h26d ? 16'hfba0 :  // <0324> getchar_echo
addr == 16'h26e ? 16'h0013 :  // <0324> "
addr == 16'h26f ? 16'hfc00 :  // <0324> "
addr == 16'h270 ? 16'h2000 :  // <0324> push a // "
addr == 16'h271 ? 16'hfba0 :  // <0324> "
addr == 16'h272 ? 16'h0004 :  // <0324> "
addr == 16'h273 ? 16'hfc00 :  // <0324> "
addr == 16'h274 ? 16'h0008 :  // <0324> pop a // "

// parse start byte address low word into target's avalon master.
addr == 16'h275 ? 16'hfba0 :  // <0327> call :get4x
addr == 16'h276 ? 16'h0098 :  // <0327> "
addr == 16'h277 ? 16'hfc00 :  // <0327> "
addr == 16'h278 ? 16'h0801 :  // <0328> i = b
addr == 16'h279 ? 16'he401 :  // <0329> bn iz :fail
addr == 16'h27a ? 16'h02df :  // <0329> "
addr == 16'h27b ? 16'h3800 :  // <0330> poke_data = a
addr == 16'h27c ? 16'h0007 :  // <0331> a = $av_ad_lo_reg
addr == 16'h27d ? 16'hfba0 :  // <0332> call :poke
addr == 16'h27e ? 16'h038f :  // <0332> "
addr == 16'h27f ? 16'hfc00 :  // <0332> "
addr == 16'h280 ? 16'hfba0 :  // <0333> getchar_echo
addr == 16'h281 ? 16'h0013 :  // <0333> "
addr == 16'h282 ? 16'hfc00 :  // <0333> "
addr == 16'h283 ? 16'h2000 :  // <0333> push a // "
addr == 16'h284 ? 16'hfba0 :  // <0333> "
addr == 16'h285 ? 16'h0004 :  // <0333> "
addr == 16'h286 ? 16'hfc00 :  // <0333> "
addr == 16'h287 ? 16'h0008 :  // <0333> pop a // "

// parse length (in bytes) into i.
addr == 16'h288 ? 16'hfba0 :  // <0336> call :get4x
addr == 16'h289 ? 16'h0098 :  // <0336> "
addr == 16'h28a ? 16'hfc00 :  // <0336> "
addr == 16'h28b ? 16'h1001 :  // <0337> x = b
addr == 16'h28c ? 16'he402 :  // <0338> bn xz :fail
addr == 16'h28d ? 16'h02df :  // <0338> "
addr == 16'h28e ? 16'h0b50 :  // <0339> i = a>>1
addr == 16'h28f ? 16'he001 :  // <0340> br iz :fail
addr == 16'h290 ? 16'h02df :  // <0340> "

addr == 16'h291 ? 16'hfba0 :  // <0342> getchar_echo
addr == 16'h292 ? 16'h0013 :  // <0342> "
addr == 16'h293 ? 16'hfc00 :  // <0342> "
addr == 16'h294 ? 16'h2000 :  // <0342> push a // "
addr == 16'h295 ? 16'hfba0 :  // <0342> "
addr == 16'h296 ? 16'h0004 :  // <0342> "
addr == 16'h297 ? 16'hfc00 :  // <0342> "
addr == 16'h298 ? 16'h0008 :  // <0342> pop a // "
addr == 16'h299 ? 16'h062e :  // <0343> b = 46 // asc b = "."
addr == 16'h29a ? 16'he407 :  // <0344> bn eq :fail
addr == 16'h29b ? 16'h02df :  // <0344> "

// :next_row // = 0x029c
// print row header.
addr == 16'h29c ? 16'h03a0 :  // <0348> a = :eol_msg // puteol
addr == 16'h29d ? 16'h0002 :  // <0348> "
addr == 16'h29e ? 16'hfba0 :  // <0348> puteol
addr == 16'h29f ? 16'h00eb :  // <0348> "
addr == 16'h2a0 ? 16'hfc00 :  // <0348> "
addr == 16'h2a1 ? 16'h0007 :  // <0349> a = $av_ad_lo_reg
addr == 16'h2a2 ? 16'hfba0 :  // <0350> call :peek
addr == 16'h2a3 ? 16'h03a0 :  // <0350> "
addr == 16'h2a4 ? 16'hfc00 :  // <0350> "
addr == 16'h2a5 ? 16'h0017 :  // <0351> a = peek_data
addr == 16'h2a6 ? 16'hfba0 :  // <0352> call :put4x
addr == 16'h2a7 ? 16'h005f :  // <0352> "
addr == 16'h2a8 ? 16'hfc00 :  // <0352> "
addr == 16'h2a9 ? 16'h023a :  // <0353> a = 58 // putasc ":"
addr == 16'h2aa ? 16'hfba0 :  // <0353> putasc ":"
addr == 16'h2ab ? 16'h0004 :  // <0353> "
addr == 16'h2ac ? 16'hfc00 :  // <0353> "

// print 8 data words.
addr == 16'h2ad ? 16'h1208 :  // <0356> x = 8
// :next_word // = 0x02ae
// print data word from target's avalon master.
addr == 16'h2ae ? 16'h0220 :  // <0359> a = 32 // putasc " "
addr == 16'h2af ? 16'hfba0 :  // <0359> putasc " "
addr == 16'h2b0 ? 16'h0004 :  // <0359> "
addr == 16'h2b1 ? 16'hfc00 :  // <0359> "
addr == 16'h2b2 ? 16'h0006 :  // <0360> a = $av_data_regs
addr == 16'h2b3 ? 16'hfba0 :  // <0361> call :peek_avalon
addr == 16'h2b4 ? 16'h02f0 :  // <0361> "
addr == 16'h2b5 ? 16'hfc00 :  // <0361> "
addr == 16'h2b6 ? 16'h0017 :  // <0362> a = peek_data
addr == 16'h2b7 ? 16'hfba0 :  // <0363> call :put4x
addr == 16'h2b8 ? 16'h005f :  // <0363> "
addr == 16'h2b9 ? 16'hfc00 :  // <0363> "

// increment target's av_ad_lo.
addr == 16'h2ba ? 16'h0007 :  // <0366> a = $av_ad_lo_reg
addr == 16'h2bb ? 16'hfba0 :  // <0367> call :peek
addr == 16'h2bc ? 16'h03a0 :  // <0367> "
addr == 16'h2bd ? 16'hfc00 :  // <0367> "
addr == 16'h2be ? 16'h0017 :  // <0368> a = peek_data
addr == 16'h2bf ? 16'h0602 :  // <0369> b = 2
addr == 16'h2c0 ? 16'hc800 :  // <0370> poke_data = a+b
addr == 16'h2c1 ? 16'h3b00 :  // <0370> "
addr == 16'h2c2 ? 16'h0007 :  // <0371> a = $av_ad_lo_reg
addr == 16'h2c3 ? 16'hfba0 :  // <0372> call :poke
addr == 16'h2c4 ? 16'h038f :  // <0372> "
addr == 16'h2c5 ? 16'hfc00 :  // <0372> "

// check if all words have been dumped.
addr == 16'h2c6 ? 16'h0f60 :  // <0375> j = -1
addr == 16'h2c7 ? 16'hc800 :  // <0376> i = i+j
addr == 16'h2c8 ? 16'h0b10 :  // <0376> "
addr == 16'h2c9 ? 16'he001 :  // <0377> br iz :done
addr == 16'h2ca ? 16'h02d2 :  // <0377> "

// check for end of row.
addr == 16'h2cb ? 16'h1760 :  // <0380> y = -1
addr == 16'h2cc ? 16'hc800 :  // <0381> x = x+y
addr == 16'h2cd ? 16'h1320 :  // <0381> "
addr == 16'h2ce ? 16'he402 :  // <0382> bn xz :next_word
addr == 16'h2cf ? 16'h02ae :  // <0382> "
addr == 16'h2d0 ? 16'he00f :  // <0383> jmp :next_row
addr == 16'h2d1 ? 16'h029c :  // <0383> "

// :done // = 0x02d2
addr == 16'h2d2 ? 16'h03a0 :  // <0386> a = :eol_msg // puteol
addr == 16'h2d3 ? 16'h0002 :  // <0386> "
addr == 16'h2d4 ? 16'hfba0 :  // <0386> puteol
addr == 16'h2d5 ? 16'h00eb :  // <0386> "
addr == 16'h2d6 ? 16'hfc00 :  // <0386> "
addr == 16'h2d7 ? 16'hf808 :  // <0387> pop rtna // rtn
addr == 16'h2d8 ? 16'h1c08 :  // <0387> pop gb // "
addr == 16'h2d9 ? 16'h1808 :  // <0387> pop ga // "
addr == 16'h2da ? 16'h1408 :  // <0387> pop y // "
addr == 16'h2db ? 16'h1008 :  // <0387> pop x // "
addr == 16'h2dc ? 16'h0c08 :  // <0387> pop j // "
addr == 16'h2dd ? 16'h0808 :  // <0387> pop i // "
addr == 16'h2de ? 16'hfc00 :  // <0386> swapra = nop

// :fail // = 0x02df
addr == 16'h2df ? 16'h023f :  // <0390> a = 63 // putasc "?"
addr == 16'h2e0 ? 16'hfba0 :  // <0390> putasc "?"
addr == 16'h2e1 ? 16'h0004 :  // <0390> "
addr == 16'h2e2 ? 16'hfc00 :  // <0390> "
addr == 16'h2e3 ? 16'h03a0 :  // <0391> a = :eol_msg // puteol
addr == 16'h2e4 ? 16'h0002 :  // <0391> "
addr == 16'h2e5 ? 16'hfba0 :  // <0391> puteol
addr == 16'h2e6 ? 16'h00eb :  // <0391> "
addr == 16'h2e7 ? 16'hfc00 :  // <0391> "
addr == 16'h2e8 ? 16'hf808 :  // <0392> pop rtna // end_func
addr == 16'h2e9 ? 16'h1c08 :  // <0392> pop gb // "
addr == 16'h2ea ? 16'h1808 :  // <0392> pop ga // "
addr == 16'h2eb ? 16'h1408 :  // <0392> pop y // "
addr == 16'h2ec ? 16'h1008 :  // <0392> pop x // "
addr == 16'h2ed ? 16'h0c08 :  // <0392> pop j // "
addr == 16'h2ee ? 16'h0808 :  // <0392> pop i // "
addr == 16'h2ef ? 16'hfc00 :  // <0391> swapra = nop

// trigger a read in the target's avalon master.  return the data in peek_data.
// the 32-bit avalon address must already be poked into the target's avalon master.
// pass av_data_regs in a.  av_write_data reg address in its high byte; av_read_data reg address in its low byte.
// ######## func peek_avalon // = 0x02f0
addr == 16'h2f0 ? 16'h203e :  // <0397> push rtna // func peek_avalon
// peek the target's av_write_data register to trigger an avalon read as a side effect.
addr == 16'h2f1 ? 16'h2000 :  // <0399> push a // push a
addr == 16'h2f2 ? 16'h0353 :  // <0400> a = a>>4
addr == 16'h2f3 ? 16'h0353 :  // <0401> a = a>>4
addr == 16'h2f4 ? 16'hfba0 :  // <0402> call :peek
addr == 16'h2f5 ? 16'h03a0 :  // <0402> "
addr == 16'h2f6 ? 16'hfc00 :  // <0402> "

// wait for target's avalon master to receive data e.g. from SDRAM controller.
addr == 16'h2f7 ? 16'h020f :  // <0405> a = 15
addr == 16'h2f8 ? 16'h0760 :  // <0406> b = -1
// :wait // = 0x02f9
addr == 16'h2f9 ? 16'hc800 :  // <0408> a = a+b
addr == 16'h2fa ? 16'h0300 :  // <0408> "
addr == 16'h2fb ? 16'he400 :  // <0409> bn az :wait
addr == 16'h2fc ? 16'h02f9 :  // <0409> "

// peek data word from target's avalon master.
addr == 16'h2fd ? 16'h0008 :  // <0412> pop a // pop a
addr == 16'h2fe ? 16'h06ff :  // <0413> b = 0xff
addr == 16'h2ff ? 16'hc800 :  // <0414> a = and
addr == 16'h300 ? 16'h0330 :  // <0414> "
addr == 16'h301 ? 16'hfba0 :  // <0415> call :peek
addr == 16'h302 ? 16'h03a0 :  // <0415> "
addr == 16'h303 ? 16'hfc00 :  // <0415> "
addr == 16'h304 ? 16'hf808 :  // <0416> pop rtna // end_func
addr == 16'h305 ? 16'hfc00 :  // <0415> swapra = nop

// ######## func wait_for_bp // = 0x0306
// :poll // = 0x0306
addr == 16'h306 ? 16'h0018 :  // <0420> a = bp_status
addr == 16'h307 ? 16'he000 :  // <0421> br az :poll
addr == 16'h308 ? 16'h0306 :  // <0421> "
addr == 16'h309 ? 16'hfc00 :  // <0421> swapra = nop

// ######## func set_bp // = 0x030a
addr == 16'h30a ? 16'h2004 :  // <0424> push x // func set_bp
addr == 16'h30b ? 16'h2005 :  // <0424> push y // "
addr == 16'h30c ? 16'h203e :  // <0424> push rtna // "
addr == 16'h30d ? 16'hfba0 :  // <0425> getchar_echo
addr == 16'h30e ? 16'h0013 :  // <0425> "
addr == 16'h30f ? 16'hfc00 :  // <0425> "
addr == 16'h310 ? 16'h2000 :  // <0425> push a // "
addr == 16'h311 ? 16'hfba0 :  // <0425> "
addr == 16'h312 ? 16'h0004 :  // <0425> "
addr == 16'h313 ? 16'hfc00 :  // <0425> "
addr == 16'h314 ? 16'h0008 :  // <0425> pop a // "
addr == 16'h315 ? 16'h1000 :  // <0426> x = a
addr == 16'h316 ? 16'hfba0 :  // <0427> getchar_echo
addr == 16'h317 ? 16'h0013 :  // <0427> "
addr == 16'h318 ? 16'hfc00 :  // <0427> "
addr == 16'h319 ? 16'h2000 :  // <0427> push a // "
addr == 16'h31a ? 16'hfba0 :  // <0427> "
addr == 16'h31b ? 16'h0004 :  // <0427> "
addr == 16'h31c ? 16'hfc00 :  // <0427> "
addr == 16'h31d ? 16'h0008 :  // <0427> pop a // "
addr == 16'h31e ? 16'h063d :  // <0428> b = 61 // asc b = "="
addr == 16'h31f ? 16'he407 :  // <0429> bn eq :fail
addr == 16'h320 ? 16'h034b :  // <0429> "
addr == 16'h321 ? 16'hfba0 :  // <0430> call :get4x
addr == 16'h322 ? 16'h0098 :  // <0430> "
addr == 16'h323 ? 16'hfc00 :  // <0430> "
addr == 16'h324 ? 16'h1400 :  // <0431> y = a
addr == 16'h325 ? 16'h0200 :  // <0432> a = 0
addr == 16'h326 ? 16'he407 :  // <0433> bn eq :fail
addr == 16'h327 ? 16'h034b :  // <0433> "
addr == 16'h328 ? 16'h0004 :  // <0434> a = x
addr == 16'h329 ? 16'h0630 :  // <0435> b = 48 // asc b = "0"
addr == 16'h32a ? 16'he007 :  // <0436> br eq :b0
addr == 16'h32b ? 16'h0337 :  // <0436> "
addr == 16'h32c ? 16'h0631 :  // <0437> b = 49 // asc b = "1"
addr == 16'h32d ? 16'he007 :  // <0438> br eq :b1
addr == 16'h32e ? 16'h033c :  // <0438> "
addr == 16'h32f ? 16'h0632 :  // <0439> b = 50 // asc b = "2"
addr == 16'h330 ? 16'he007 :  // <0440> br eq :b2
addr == 16'h331 ? 16'h0341 :  // <0440> "
addr == 16'h332 ? 16'h0633 :  // <0441> b = 51 // asc b = "3"
addr == 16'h333 ? 16'he007 :  // <0442> br eq :b3
addr == 16'h334 ? 16'h0346 :  // <0442> "
addr == 16'h335 ? 16'he00f :  // <0443> jmp :fail
addr == 16'h336 ? 16'h034b :  // <0443> "
// :b0 // = 0x0337
addr == 16'h337 ? 16'h2405 :  // <0445> bp0_addr = y
addr == 16'h338 ? 16'hf808 :  // <0446> pop rtna // rtn
addr == 16'h339 ? 16'h1408 :  // <0446> pop y // "
addr == 16'h33a ? 16'h1008 :  // <0446> pop x // "
addr == 16'h33b ? 16'hfc00 :  // <0445> swapra = nop
// :b1 // = 0x033c
addr == 16'h33c ? 16'h2805 :  // <0448> bp1_addr = y
addr == 16'h33d ? 16'hf808 :  // <0449> pop rtna // rtn
addr == 16'h33e ? 16'h1408 :  // <0449> pop y // "
addr == 16'h33f ? 16'h1008 :  // <0449> pop x // "
addr == 16'h340 ? 16'hfc00 :  // <0448> swapra = nop
// :b2 // = 0x0341
addr == 16'h341 ? 16'h2c05 :  // <0451> bp2_addr = y
addr == 16'h342 ? 16'hf808 :  // <0452> pop rtna // rtn
addr == 16'h343 ? 16'h1408 :  // <0452> pop y // "
addr == 16'h344 ? 16'h1008 :  // <0452> pop x // "
addr == 16'h345 ? 16'hfc00 :  // <0451> swapra = nop
// :b3 // = 0x0346
addr == 16'h346 ? 16'h3005 :  // <0454> bp3_addr = y
addr == 16'h347 ? 16'hf808 :  // <0455> pop rtna // rtn
addr == 16'h348 ? 16'h1408 :  // <0455> pop y // "
addr == 16'h349 ? 16'h1008 :  // <0455> pop x // "
addr == 16'h34a ? 16'hfc00 :  // <0454> swapra = nop

// :fail // = 0x034b
addr == 16'h34b ? 16'h023f :  // <0458> a = 63 // putasc "?"
addr == 16'h34c ? 16'hfba0 :  // <0458> putasc "?"
addr == 16'h34d ? 16'h0004 :  // <0458> "
addr == 16'h34e ? 16'hfc00 :  // <0458> "
addr == 16'h34f ? 16'h03a0 :  // <0459> a = :eol_msg // puteol
addr == 16'h350 ? 16'h0002 :  // <0459> "
addr == 16'h351 ? 16'hfba0 :  // <0459> puteol
addr == 16'h352 ? 16'h00eb :  // <0459> "
addr == 16'h353 ? 16'hfc00 :  // <0459> "
addr == 16'h354 ? 16'hf808 :  // <0460> pop rtna // end_func
addr == 16'h355 ? 16'h1408 :  // <0460> pop y // "
addr == 16'h356 ? 16'h1008 :  // <0460> pop x // "
addr == 16'h357 ? 16'hfc00 :  // <0459> swapra = nop

// ######## func poke_cmd // = 0x0358
addr == 16'h358 ? 16'h2004 :  // <0462> push x // func poke_cmd
addr == 16'h359 ? 16'h203e :  // <0462> push rtna // "
// x = destination register address to poke.
addr == 16'h35a ? 16'hfba0 :  // <0464> call :get4x
addr == 16'h35b ? 16'h0098 :  // <0464> "
addr == 16'h35c ? 16'hfc00 :  // <0464> "
addr == 16'h35d ? 16'h1000 :  // <0465> x = a
addr == 16'h35e ? 16'h0200 :  // <0466> a = 0
addr == 16'h35f ? 16'he407 :  // <0467> bn eq :fail
addr == 16'h360 ? 16'h037a :  // <0467> "

addr == 16'h361 ? 16'hfba0 :  // <0469> getchar_echo
addr == 16'h362 ? 16'h0013 :  // <0469> "
addr == 16'h363 ? 16'hfc00 :  // <0469> "
addr == 16'h364 ? 16'h2000 :  // <0469> push a // "
addr == 16'h365 ? 16'hfba0 :  // <0469> "
addr == 16'h366 ? 16'h0004 :  // <0469> "
addr == 16'h367 ? 16'hfc00 :  // <0469> "
addr == 16'h368 ? 16'h0008 :  // <0469> pop a // "
addr == 16'h369 ? 16'h063d :  // <0470> b = 61 // asc b = "="
addr == 16'h36a ? 16'he407 :  // <0471> bn eq :fail
addr == 16'h36b ? 16'h037a :  // <0471> "

// parse value to poke.
addr == 16'h36c ? 16'hfba0 :  // <0474> call :get4x
addr == 16'h36d ? 16'h0098 :  // <0474> "
addr == 16'h36e ? 16'hfc00 :  // <0474> "
addr == 16'h36f ? 16'h3800 :  // <0475> poke_data = a
addr == 16'h370 ? 16'h0200 :  // <0476> a = 0
addr == 16'h371 ? 16'he407 :  // <0477> bn eq :fail
addr == 16'h372 ? 16'h037a :  // <0477> "

addr == 16'h373 ? 16'h0004 :  // <0479> a = x
addr == 16'h374 ? 16'hfba0 :  // <0480> call :poke
addr == 16'h375 ? 16'h038f :  // <0480> "
addr == 16'h376 ? 16'hfc00 :  // <0480> "
addr == 16'h377 ? 16'hf808 :  // <0481> pop rtna // rtn
addr == 16'h378 ? 16'h1008 :  // <0481> pop x // "
addr == 16'h379 ? 16'hfc00 :  // <0480> swapra = nop

// :fail // = 0x037a
addr == 16'h37a ? 16'h023f :  // <0484> a = 63 // putasc "?"
addr == 16'h37b ? 16'hfba0 :  // <0484> putasc "?"
addr == 16'h37c ? 16'h0004 :  // <0484> "
addr == 16'h37d ? 16'hfc00 :  // <0484> "
addr == 16'h37e ? 16'h03a0 :  // <0485> a = :eol_msg // puteol
addr == 16'h37f ? 16'h0002 :  // <0485> "
addr == 16'h380 ? 16'hfba0 :  // <0485> puteol
addr == 16'h381 ? 16'h00eb :  // <0485> "
addr == 16'h382 ? 16'hfc00 :  // <0485> "
addr == 16'h383 ? 16'hf808 :  // <0486> pop rtna // end_func
addr == 16'h384 ? 16'h1008 :  // <0486> pop x // "
addr == 16'h385 ? 16'hfc00 :  // <0485> swapra = nop

// force execution of the opcode passed in force_opcode.
// ######## func force_instruction // = 0x0386
addr == 16'h386 ? 16'h3e04 :  // <0490> bus_ctrl = $divert_code_bus_mask
addr == 16'h387 ? 16'h4201 :  // <0491> tg_force = $hold_state_mask
addr == 16'h388 ? 16'h4203 :  // <0492> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h389 ? 16'h4205 :  // <0493> tg_force = ($hold_state_mask | $force_exec_mask)
addr == 16'h38a ? 16'h4201 :  // <0494> tg_force = $hold_state_mask
// refill target exr so it can resume seamlessly.
addr == 16'h38b ? 16'h3415 :  // <0496> force_opcode = exr_shadow
addr == 16'h38c ? 16'h4203 :  // <0497> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h38d ? 16'h4200 :  // <0498> tg_force = 0
addr == 16'h38e ? 16'hfc00 :  // <0498> swapra = nop

// write to a register in the target MCU.  pass the value in poke_data.
// pass its register address in a.
// ######## func poke // = 0x038f
addr == 16'h38f ? 16'h203e :  // <0503> push rtna // func poke
addr == 16'h390 ? 16'h063f :  // <0504> b = $dest_mask
addr == 16'h391 ? 16'hc800 :  // <0505> a = and
addr == 16'h392 ? 16'h0330 :  // <0505> "
addr == 16'h393 ? 16'h0352 :  // <0506> a = a<<4
addr == 16'h394 ? 16'h0352 :  // <0507> a = a<<4
addr == 16'h395 ? 16'h0351 :  // <0508> a = a<<1
addr == 16'h396 ? 16'h0351 :  // <0509> a = a<<1
addr == 16'h397 ? 16'h07a0 :  // <0510> b = ([src dbgpoke])
addr == 16'h398 ? 16'h03c0 :  // <0510> "
addr == 16'h399 ? 16'hc800 :  // <0511> force_opcode = or
addr == 16'h39a ? 16'h3734 :  // <0511> "
addr == 16'h39b ? 16'hfba0 :  // <0512> call :force_instruction
addr == 16'h39c ? 16'h0386 :  // <0512> "
addr == 16'h39d ? 16'hfc00 :  // <0512> "
addr == 16'h39e ? 16'hf808 :  // <0513> pop rtna // end_func
addr == 16'h39f ? 16'hfc00 :  // <0512> swapra = nop

// observe a register in the target MCU.  return its value in peek_data.
// pass its register address in a.
// ######## func peek // = 0x03a0
addr == 16'h3a0 ? 16'h203e :  // <0517> push rtna // func peek
addr == 16'h3a1 ? 16'h07a0 :  // <0518> b = $src_mask
addr == 16'h3a2 ? 16'h03ff :  // <0518> "
addr == 16'h3a3 ? 16'hc800 :  // <0519> a = and
addr == 16'h3a4 ? 16'h0330 :  // <0519> "
addr == 16'h3a5 ? 16'h07a0 :  // <0520> b = ([dest nop] << $dest_lsb)
addr == 16'h3a6 ? 16'hc800 :  // <0520> "
addr == 16'h3a7 ? 16'hc800 :  // <0521> force_opcode = or
addr == 16'h3a8 ? 16'h3734 :  // <0521> "
addr == 16'h3a9 ? 16'hfba0 :  // <0522> call :force_instruction
addr == 16'h3aa ? 16'h0386 :  // <0522> "
addr == 16'h3ab ? 16'hfc00 :  // <0522> "
// target's register value is now in peek_data.
addr == 16'h3ac ? 16'hf808 :  // <0524> pop rtna // end_func
addr == 16'h3ad ? 16'hfc00 :  // <0523> swapra = nop

// show target status display.
// ######## func dump_target // = 0x03ae
addr == 16'h3ae ? 16'h2002 :  // <0527> push i // func dump_target
addr == 16'h3af ? 16'h2004 :  // <0527> push x // "
addr == 16'h3b0 ? 16'h203e :  // <0527> push rtna // "
addr == 16'h3b1 ? 16'h03a0 :  // <0528> a = :eol_msg // puteol
addr == 16'h3b2 ? 16'h0002 :  // <0528> "
addr == 16'h3b3 ? 16'hfba0 :  // <0528> puteol
addr == 16'h3b4 ? 16'h00eb :  // <0528> "
addr == 16'h3b5 ? 16'hfc00 :  // <0528> "
// verify sane number of registers in the target program's register name table.
addr == 16'h3b6 ? 16'h4e02 :  // <0530> m9k_addr = 2
addr == 16'h3b7 ? 16'h1014 :  // <0531> x = m9k_data

addr == 16'h3b8 ? 16'h0004 :  // <0561> a = x
addr == 16'h3b9 ? 16'h0630 :  // <0561> b = 48

addr == 16'h3ba ? 16'he406 :  // <0532> bn gt :else_954
addr == 16'h3bb ? 16'h03c8 :  // <0532> "

addr == 16'h3bc ? 16'h03a0 :  // <0533> a = :unsafe_msg
addr == 16'h3bd ? 16'h01e8 :  // <0533> "
addr == 16'h3be ? 16'hfba0 :  // <0534> call print_nt
addr == 16'h3bf ? 16'h00eb :  // <0534> "
addr == 16'h3c0 ? 16'hfc00 :  // <0534> "
addr == 16'h3c1 ? 16'h03a0 :  // <0535> a = :eol_msg // puteol
addr == 16'h3c2 ? 16'h0002 :  // <0535> "
addr == 16'h3c3 ? 16'hfba0 :  // <0535> puteol
addr == 16'h3c4 ? 16'h00eb :  // <0535> "
addr == 16'h3c5 ? 16'hfc00 :  // <0535> "

addr == 16'h3c6 ? 16'he00f :  // <0537> jmp :end_954
addr == 16'h3c7 ? 16'h03fa :  // <0537> "

// loop up to the number of registers in the target program's register name table.
addr == 16'h3c8 ? 16'h0a00 :  // <0561> i = 0
// :loop_968 // = 0x03c9

// fetch register name from table in target program.
// i = register number.
// peek is skipped for any reg name starting with 2 slashes (good for read-sensitive regs).
addr == 16'h3c9 ? 16'h0002 :  // <0542> a = i
addr == 16'h3ca ? 16'h0351 :  // <0543> a = a<<1
addr == 16'h3cb ? 16'h0351 :  // <0544> a = a<<1
addr == 16'h3cc ? 16'h0603 :  // <0545> b = 3
addr == 16'h3cd ? 16'hc800 :  // <0546> m9k_addr = a+b
addr == 16'h3ce ? 16'h4f00 :  // <0546> "

addr == 16'h3cf ? 16'h0014 :  // <0559> a = m9k_data
addr == 16'h3d0 ? 16'h07a0 :  // <0559> b = 0x2f2f
addr == 16'h3d1 ? 16'h2f2f :  // <0559> "

addr == 16'h3d2 ? 16'he007 :  // <0547> br eq :else_978
addr == 16'h3d3 ? 16'h03f2 :  // <0547> "

addr == 16'h3d4 ? 16'h0220 :  // <0548> a = 32 // putasc " "
addr == 16'h3d5 ? 16'hfba0 :  // <0548> putasc " "
addr == 16'h3d6 ? 16'h0004 :  // <0548> "
addr == 16'h3d7 ? 16'hfc00 :  // <0548> "
addr == 16'h3d8 ? 16'h0220 :  // <0549> a = 32 // putasc " "
addr == 16'h3d9 ? 16'hfba0 :  // <0549> putasc " "
addr == 16'h3da ? 16'h0004 :  // <0549> "
addr == 16'h3db ? 16'hfc00 :  // <0549> "
addr == 16'h3dc ? 16'h0013 :  // <0550> a = m9k_addr
addr == 16'h3dd ? 16'h0608 :  // <0551> b = 8
addr == 16'h3de ? 16'hfba0 :  // <0552> call :print_fixed_target
addr == 16'h3df ? 16'h03fe :  // <0552> "
addr == 16'h3e0 ? 16'hfc00 :  // <0552> "
addr == 16'h3e1 ? 16'h023d :  // <0553> a = 61 // putasc "="
addr == 16'h3e2 ? 16'hfba0 :  // <0553> putasc "="
addr == 16'h3e3 ? 16'h0004 :  // <0553> "
addr == 16'h3e4 ? 16'hfc00 :  // <0553> "
addr == 16'h3e5 ? 16'h0002 :  // <0554> a = i
addr == 16'h3e6 ? 16'hfba0 :  // <0555> call :peek
addr == 16'h3e7 ? 16'h03a0 :  // <0555> "
addr == 16'h3e8 ? 16'hfc00 :  // <0555> "
addr == 16'h3e9 ? 16'h0017 :  // <0556> a = peek_data
addr == 16'h3ea ? 16'hfba0 :  // <0557> call :put4x
addr == 16'h3eb ? 16'h005f :  // <0557> "
addr == 16'h3ec ? 16'hfc00 :  // <0557> "
addr == 16'h3ed ? 16'h03a0 :  // <0558> a = :eol_msg // puteol
addr == 16'h3ee ? 16'h0002 :  // <0558> "
addr == 16'h3ef ? 16'hfba0 :  // <0558> puteol
addr == 16'h3f0 ? 16'h00eb :  // <0558> "
addr == 16'h3f1 ? 16'hfc00 :  // <0558> "



addr == 16'h3f2 ? 16'h0002 :  // <0561> a = i
addr == 16'h3f3 ? 16'h0601 :  // <0561> b = 1
addr == 16'h3f4 ? 16'hc800 :  // <0561> i = a+b
addr == 16'h3f5 ? 16'h0b00 :  // <0561> "


addr == 16'h3f6 ? 16'h0002 :  // <0561> a = i
addr == 16'h3f7 ? 16'h0404 :  // <0561> b = x
addr == 16'h3f8 ? 16'he005 :  // <0561> br lt :loop_968
addr == 16'h3f9 ? 16'h03c9 :  // <0561> "

// :end_968 // = 0x03fa

addr == 16'h3fa ? 16'hf808 :  // <0562> pop rtna // end_func
addr == 16'h3fb ? 16'h1008 :  // <0562> pop x // "
addr == 16'h3fc ? 16'h0808 :  // <0562> pop i // "
addr == 16'h3fd ? 16'hfc00 :  // <0561> swapra = nop

// print a fixed-length string from packed words in TARGET program space.
// pass its word address (not its byte address) in a,  its length (bytes) in b.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_fixed_target // = 0x03fe
addr == 16'h3fe ? 16'h2002 :  // <0568> push i // func print_fixed_target
addr == 16'h3ff ? 16'h2003 :  // <0568> push j // "
addr == 16'h400 ? 16'h2004 :  // <0568> push x // "
addr == 16'h401 ? 16'h2005 :  // <0568> push y // "
addr == 16'h402 ? 16'h2006 :  // <0568> push ga // "
addr == 16'h403 ? 16'h203e :  // <0568> push rtna // "
addr == 16'h404 ? 16'h0800 :  // <0569> i = a
addr == 16'h405 ? 16'h0e01 :  // <0570> j = 1
addr == 16'h406 ? 16'h1001 :  // <0571> x = b
addr == 16'h407 ? 16'h1760 :  // <0572> y = -1
// :next_word // = 0x0408
addr == 16'h408 ? 16'he002 :  // <0574> br xz :done
addr == 16'h409 ? 16'h041e :  // <0574> "
addr == 16'h40a ? 16'h1320 :  // <0575> x = ad2
addr == 16'h40b ? 16'h4c02 :  // <0576> m9k_addr = i
addr == 16'h40c ? 16'h1814 :  // <0577> ga = m9k_data
// now x = bytes remaining, i = current word address, g6 = data word.
addr == 16'h40d ? 16'h0006 :  // <0579> a = ga // putchar ga
addr == 16'h40e ? 16'hfba0 :  // <0579> putchar ga
addr == 16'h40f ? 16'h0004 :  // <0579> "
addr == 16'h410 ? 16'hfc00 :  // <0579> "
addr == 16'h411 ? 16'he002 :  // <0580> br xz :done
addr == 16'h412 ? 16'h041e :  // <0580> "
addr == 16'h413 ? 16'h1320 :  // <0581> x = ad2
addr == 16'h414 ? 16'h0006 :  // <0582> a = ga
addr == 16'h415 ? 16'h0353 :  // <0583> a = a>>4
addr == 16'h416 ? 16'h0353 :  // <0584> a = a>>4
addr == 16'h417 ? 16'hfba0 :  // <0585> putchar a
addr == 16'h418 ? 16'h0004 :  // <0585> "
addr == 16'h419 ? 16'hfc00 :  // <0585> "
addr == 16'h41a ? 16'hc800 :  // <0586> i = i+j
addr == 16'h41b ? 16'h0b10 :  // <0586> "
addr == 16'h41c ? 16'he00f :  // <0587> jmp :next_word
addr == 16'h41d ? 16'h0408 :  // <0587> "
// :done // = 0x041e
addr == 16'h41e ? 16'hf808 :  // <0589> pop rtna // end_func
addr == 16'h41f ? 16'h1808 :  // <0589> pop ga // "
addr == 16'h420 ? 16'h1408 :  // <0589> pop y // "
addr == 16'h421 ? 16'h1008 :  // <0589> pop x // "
addr == 16'h422 ? 16'h0c08 :  // <0589> pop j // "
addr == 16'h423 ? 16'h0808 :  // <0589> pop i // "
addr == 16'h424 ? 16'hfc00 :  // <0588> swapra = nop

// ######## func load_program // = 0x0425
addr == 16'h425 ? 16'h2002 :  // <0591> push i // func load_program
addr == 16'h426 ? 16'h2003 :  // <0591> push j // "
addr == 16'h427 ? 16'h2004 :  // <0591> push x // "
addr == 16'h428 ? 16'h203e :  // <0591> push rtna // "
// load target program from UART.

// length, little-endian.  memorize in x.
addr == 16'h429 ? 16'h03a0 :  // <0595> a = :eol_msg // puteol
addr == 16'h42a ? 16'h0002 :  // <0595> "
addr == 16'h42b ? 16'hfba0 :  // <0595> puteol
addr == 16'h42c ? 16'h00eb :  // <0595> "
addr == 16'h42d ? 16'hfc00 :  // <0595> "
addr == 16'h42e ? 16'h024c :  // <0596> a = 76 // putasc L
addr == 16'h42f ? 16'hfba0 :  // <0596> putasc L
addr == 16'h430 ? 16'h0004 :  // <0596> "
addr == 16'h431 ? 16'hfc00 :  // <0596> "
addr == 16'h432 ? 16'hfba0 :  // <0597> get16 x
addr == 16'h433 ? 16'h0013 :  // <0597> "
addr == 16'h434 ? 16'hfc00 :  // <0597> "
addr == 16'h435 ? 16'h2000 :  // <0597> push a // "
addr == 16'h436 ? 16'hfba0 :  // <0597> "
addr == 16'h437 ? 16'h0013 :  // <0597> "
addr == 16'h438 ? 16'hfc00 :  // <0597> "
addr == 16'h439 ? 16'h0352 :  // <0597> "
addr == 16'h43a ? 16'h0352 :  // <0597> "
addr == 16'h43b ? 16'h0408 :  // <0597> pop b // "
addr == 16'h43c ? 16'hc800 :  // <0597> "
addr == 16'h43d ? 16'h1334 :  // <0597> "
addr == 16'h43e ? 16'h0004 :  // <0598> a = x
addr == 16'h43f ? 16'hfba0 :  // <0599> call :put4x
addr == 16'h440 ? 16'h005f :  // <0599> "
addr == 16'h441 ? 16'hfc00 :  // <0599> "
addr == 16'h442 ? 16'h03a0 :  // <0600> a = :eol_msg // puteol
addr == 16'h443 ? 16'h0002 :  // <0600> "
addr == 16'h444 ? 16'hfba0 :  // <0600> puteol
addr == 16'h445 ? 16'h00eb :  // <0600> "
addr == 16'h446 ? 16'hfc00 :  // <0600> "

// put target into reset again, in case this is a target warm boot.
addr == 16'h447 ? 16'h3e02 :  // <0603> bus_ctrl = $tg_reset_mask

// load opcodes.  count up address in i.
addr == 16'h448 ? 16'h0a00 :  // <0606> i = 0
addr == 16'h449 ? 16'h0e01 :  // <0607> j = 1
addr == 16'h44a ? 16'hfba0 :  // <0608> callx  fletcher16_init
addr == 16'h44b ? 16'h010c :  // <0608> "
addr == 16'h44c ? 16'hfc00 :  // <0608> "
// :loadword // = 0x044d
// receive, store in RAM.
addr == 16'h44d ? 16'hfba0 :  // <0611> get16 a
addr == 16'h44e ? 16'h0013 :  // <0611> "
addr == 16'h44f ? 16'hfc00 :  // <0611> "
addr == 16'h450 ? 16'h2000 :  // <0611> push a // "
addr == 16'h451 ? 16'hfba0 :  // <0611> "
addr == 16'h452 ? 16'h0013 :  // <0611> "
addr == 16'h453 ? 16'hfc00 :  // <0611> "
addr == 16'h454 ? 16'h0352 :  // <0611> "
addr == 16'h455 ? 16'h0352 :  // <0611> "
addr == 16'h456 ? 16'h0408 :  // <0611> pop b // "
addr == 16'h457 ? 16'hc800 :  // <0611> "
addr == 16'h458 ? 16'h0334 :  // <0611> "
addr == 16'h459 ? 16'h4c02 :  // <0612> m9k_addr = i
addr == 16'h45a ? 16'h5000 :  // <0613> m9k_data = a

// read back from RAM and build checksum.
addr == 16'h45b ? 16'h0014 :  // <0616> a = m9k_data
addr == 16'h45c ? 16'hfba0 :  // <0616> callx  fletcher16_input16  m9k_data
addr == 16'h45d ? 16'h012c :  // <0616> "
addr == 16'h45e ? 16'hfc00 :  // <0616> "

//  show decimated feedback text, for more speed:
addr == 16'h45f ? 16'h0002 :  // <0619> a = i
addr == 16'h460 ? 16'h061f :  // <0620> b = 0x1f
addr == 16'h461 ? 16'he403 :  // <0621> bn and0z :skip_text
addr == 16'h462 ? 16'h0467 :  // <0621> "
addr == 16'h463 ? 16'h022e :  // <0622> a = 46 // putasc "."
addr == 16'h464 ? 16'hfba0 :  // <0622> putasc "."
addr == 16'h465 ? 16'h0004 :  // <0622> "
addr == 16'h466 ? 16'hfc00 :  // <0622> "
// :skip_text // = 0x0467

addr == 16'h467 ? 16'hc800 :  // <0625> i = i+j
addr == 16'h468 ? 16'h0b10 :  // <0625> "
addr == 16'h469 ? 16'h0002 :  // <0626> a = i
addr == 16'h46a ? 16'h0404 :  // <0627> b = x
addr == 16'h46b ? 16'he407 :  // <0628> bn eq :loadword
addr == 16'h46c ? 16'h044d :  // <0628> "
addr == 16'h46d ? 16'h03a0 :  // <0629> a = :eol_msg // puteol
addr == 16'h46e ? 16'h0002 :  // <0629> "
addr == 16'h46f ? 16'hfba0 :  // <0629> puteol
addr == 16'h470 ? 16'h00eb :  // <0629> "
addr == 16'h471 ? 16'hfc00 :  // <0629> "
addr == 16'h472 ? 16'hfba0 :  // <0630> callx fletcher16_result  a
addr == 16'h473 ? 16'h013d :  // <0630> "
addr == 16'h474 ? 16'hfc00 :  // <0630> "
addr == 16'h475 ? 16'hfba0 :  // <0631> call :put4x
addr == 16'h476 ? 16'h005f :  // <0631> "
addr == 16'h477 ? 16'hfc00 :  // <0631> "
addr == 16'h478 ? 16'h03a0 :  // <0632> a = :eol_msg // puteol
addr == 16'h479 ? 16'h0002 :  // <0632> "
addr == 16'h47a ? 16'hfba0 :  // <0632> puteol
addr == 16'h47b ? 16'h00eb :  // <0632> "
addr == 16'h47c ? 16'hfc00 :  // <0632> "
addr == 16'h47d ? 16'hf808 :  // <0633> pop rtna // end_func
addr == 16'h47e ? 16'h1008 :  // <0633> pop x // "
addr == 16'h47f ? 16'h0c08 :  // <0633> pop j // "
addr == 16'h480 ? 16'h0808 :  // <0633> pop i // "
addr == 16'h481 ? 16'hfc00 :  // <0632> swapra = nop


        
                16'hxxxx;
        endmodule
    
