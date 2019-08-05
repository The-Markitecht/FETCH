
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
// DON'T reduce visor_num_regs from 32 to 26.  it costs 6% of the core's clock rate!

// application-specific register aliases.  in this case debugging-specific ones.






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
addr == 16'h113 ? 16'h07a0 :  // <0017> b = ([negate 0xfe])
addr == 16'h114 ? 16'hff02 :  // <0017> "
addr == 16'h115 ? 16'hc800 :  // <0018> a = a+b
addr == 16'h116 ? 16'h0300 :  // <0018> "
addr == 16'h117 ? 16'he00f :  // <0019> jmp :mod255_again
addr == 16'h118 ? 16'h010f :  // <0019> "

addr == 16'h119 ? 16'hfc00 :  // <0021> swapra = nop

// accumulate a Fletcher16 checksum, given the next byte of data.
// ######## func fletcher16_input8 // = 0x011a
addr == 16'h11a ? 16'h203e :  // <0030> push rtna // func fletcher16_input8

addr == 16'h11b ? 16'h0406 :  // <0024> b = $fletcher_sum1_reg
addr == 16'h11c ? 16'hc800 :  // <0025> a = a+b
addr == 16'h11d ? 16'h0300 :  // <0025> "
addr == 16'h11e ? 16'hfba0 :  // <0025> callx mod255  a+b  $fletcher_sum1_reg
addr == 16'h11f ? 16'h010f :  // <0025> "
addr == 16'h120 ? 16'hfc00 :  // <0025> "
addr == 16'h121 ? 16'h1800 :  // <0025> ga = a

addr == 16'h122 ? 16'h0006 :  // <0027> a = $fletcher_sum1_reg
addr == 16'h123 ? 16'h0407 :  // <0028> b = $fletcher_sum2_reg
addr == 16'h124 ? 16'hc800 :  // <0029> a = a+b
addr == 16'h125 ? 16'h0300 :  // <0029> "
addr == 16'h126 ? 16'hfba0 :  // <0029> callx mod255  a+b  $fletcher_sum2_reg
addr == 16'h127 ? 16'h010f :  // <0029> "
addr == 16'h128 ? 16'hfc00 :  // <0029> "
addr == 16'h129 ? 16'h1c00 :  // <0029> gb = a

addr == 16'h12a ? 16'hf808 :  // <0031> pop rtna // func fletcher16_input8
addr == 16'h12b ? 16'hfc00 :  // <0031> swapra = nop

// accumulate a Fletcher16 checksum, given the next word of data.
// ######## func fletcher16_input16 // = 0x012c
addr == 16'h12c ? 16'h2002 :  // <0039> push i // func fletcher16_input16
addr == 16'h12d ? 16'h203e :  // <0039> push rtna // "

addr == 16'h12e ? 16'h0b53 :  // <0034> i = a>>4
addr == 16'h12f ? 16'h06ff :  // <0035> b = 0xff
addr == 16'h130 ? 16'hc800 :  // <0036> a = and
addr == 16'h131 ? 16'h0330 :  // <0036> "
addr == 16'h132 ? 16'hfba0 :  // <0036> callx fletcher16_input8  and
addr == 16'h133 ? 16'h011a :  // <0036> "
addr == 16'h134 ? 16'hfc00 :  // <0036> "
addr == 16'h135 ? 16'h0002 :  // <0037> a = i
addr == 16'h136 ? 16'h0353 :  // <0038> a = a>>4
addr == 16'h137 ? 16'hfba0 :  // <0038> callx fletcher16_input8  a>>4
addr == 16'h138 ? 16'h011a :  // <0038> "
addr == 16'h139 ? 16'hfc00 :  // <0038> "

addr == 16'h13a ? 16'hf808 :  // <0040> pop rtna // func fletcher16_input16
addr == 16'h13b ? 16'h0808 :  // <0040> pop i // "
addr == 16'h13c ? 16'hfc00 :  // <0040> swapra = nop

// return the combined 16-bit result of Fletcher16 checksum.
// ######## func fletcher16_result // = 0x013d

addr == 16'h13d ? 16'h0007 :  // <0043> a = $fletcher_sum2_reg
addr == 16'h13e ? 16'h0352 :  // <0044> a = a<<4
addr == 16'h13f ? 16'h0352 :  // <0045> a = a<<4
addr == 16'h140 ? 16'h0406 :  // <0046> b = $fletcher_sum1_reg
addr == 16'h141 ? 16'hc800 :  // <0047> result = or
addr == 16'h142 ? 16'h0334 :  // <0047> "
addr == 16'h143 ? 16'hfc00 :  // <0046> swapra = nop

addr == 16'h144 ? 16'hfc00 :  // <0049> swapra = nop




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
addr == 16'h15c ? 16'h02c9 :  // <0119> "
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
addr == 16'h166 ? 16'h0371 :  // <0131> "
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
addr == 16'h199 ? 16'h01a1 :  // <0159> "
addr == 16'h19a ? 16'h3e08 :  // <0160> bus_ctrl = $bp_step_mask
addr == 16'h19b ? 16'h2409 :  // <0161> bp0_addr = bp0_addr
addr == 16'h19c ? 16'hfba0 :  // <0162> call :wait_for_bp
addr == 16'h19d ? 16'h02c9 :  // <0162> "
addr == 16'h19e ? 16'hfc00 :  // <0162> "
addr == 16'h19f ? 16'he00f :  // <0163> jmp :cmd_loop
addr == 16'h1a0 ? 16'h0161 :  // <0163> "
// :skip_step // = 0x01a1

// command = reset target.
addr == 16'h1a1 ? 16'h0652 :  // <0167> b = 82 // asc b = "R"
addr == 16'h1a2 ? 16'he407 :  // <0168> bn eq :skip_reset
addr == 16'h1a3 ? 16'h01ad :  // <0168> "
addr == 16'h1a4 ? 16'h3e02 :  // <0169> bus_ctrl = $tg_reset_mask
addr == 16'h1a5 ? 16'hc800 :  // <0170> nop
addr == 16'h1a6 ? 16'hc800 :  // <0171> nop
addr == 16'h1a7 ? 16'h3e08 :  // <0172> bus_ctrl = $bp_step_mask
addr == 16'h1a8 ? 16'hfba0 :  // <0173> call :wait_for_bp
addr == 16'h1a9 ? 16'h02c9 :  // <0173> "
addr == 16'h1aa ? 16'hfc00 :  // <0173> "
addr == 16'h1ab ? 16'he00f :  // <0174> jmp :cmd_loop
addr == 16'h1ac ? 16'h0161 :  // <0174> "
// :skip_reset // = 0x01ad

// command = load program.
addr == 16'h1ad ? 16'h066c :  // <0178> b = 108 // asc b = "l"
addr == 16'h1ae ? 16'he407 :  // <0179> bn eq :skip_load
addr == 16'h1af ? 16'h01b5 :  // <0179> "
addr == 16'h1b0 ? 16'hfba0 :  // <0180> call :load_program
addr == 16'h1b1 ? 16'h03d9 :  // <0180> "
addr == 16'h1b2 ? 16'hfc00 :  // <0180> "
addr == 16'h1b3 ? 16'he00f :  // <0181> jmp :cmd_loop
addr == 16'h1b4 ? 16'h0161 :  // <0181> "
// :skip_load // = 0x01b5

// command = run full speed.
addr == 16'h1b5 ? 16'h0672 :  // <0185> b = 114 // asc b = "r"
addr == 16'h1b6 ? 16'he407 :  // <0186> bn eq :skip_run
addr == 16'h1b7 ? 16'h01bc :  // <0186> "
// release target reset, to run.
addr == 16'h1b8 ? 16'h3e00 :  // <0188> bus_ctrl = 0
addr == 16'h1b9 ? 16'h2409 :  // <0189> bp0_addr = bp0_addr
addr == 16'h1ba ? 16'he00f :  // <0190> jmp :cmd_loop
addr == 16'h1bb ? 16'h0161 :  // <0190> "
// :skip_run // = 0x01bc

// command = set breakpoint.
addr == 16'h1bc ? 16'h0662 :  // <0194> b = 98 // asc b = "b"
addr == 16'h1bd ? 16'he407 :  // <0195> bn eq :skip_setbrk
addr == 16'h1be ? 16'h01c4 :  // <0195> "
addr == 16'h1bf ? 16'hfba0 :  // <0196> call :set_bp
addr == 16'h1c0 ? 16'h02cd :  // <0196> "
addr == 16'h1c1 ? 16'hfc00 :  // <0196> "
addr == 16'h1c2 ? 16'he00f :  // <0197> jmp :cmd_loop
addr == 16'h1c3 ? 16'h0161 :  // <0197> "
// :skip_setbrk // = 0x01c4

// command = poke register.
addr == 16'h1c4 ? 16'h066f :  // <0201> b = 111 // asc b = "o"
addr == 16'h1c5 ? 16'he407 :  // <0202> bn eq :skip_poke
addr == 16'h1c6 ? 16'h01cc :  // <0202> "
addr == 16'h1c7 ? 16'hfba0 :  // <0203> call :poke_cmd
addr == 16'h1c8 ? 16'h031b :  // <0203> "
addr == 16'h1c9 ? 16'hfc00 :  // <0203> "
addr == 16'h1ca ? 16'he00f :  // <0204> jmp :cmd_loop
addr == 16'h1cb ? 16'h0161 :  // <0204> "
// :skip_poke // = 0x01cc

// command = dump Avalon data e.g. from SDRAM.
addr == 16'h1cc ? 16'h0675 :  // <0208> b = 117 // asc b = "u"
addr == 16'h1cd ? 16'he407 :  // <0209> bn eq :skip_dump
addr == 16'h1ce ? 16'h01d4 :  // <0209> "
addr == 16'h1cf ? 16'hfba0 :  // <0210> call :dump_avalon
addr == 16'h1d0 ? 16'h01df :  // <0210> "
addr == 16'h1d1 ? 16'hfc00 :  // <0210> "
addr == 16'h1d2 ? 16'he00f :  // <0211> jmp :cmd_loop
addr == 16'h1d3 ? 16'h0161 :  // <0211> "
// :skip_dump // = 0x01d4

addr == 16'h1d4 ? 16'h023f :  // <0214> a = 63 // putasc "?"
addr == 16'h1d5 ? 16'hfba0 :  // <0214> putasc "?"
addr == 16'h1d6 ? 16'h0004 :  // <0214> "
addr == 16'h1d7 ? 16'hfc00 :  // <0214> "
addr == 16'h1d8 ? 16'h03a0 :  // <0215> a = :eol_msg // puteol
addr == 16'h1d9 ? 16'h0002 :  // <0215> "
addr == 16'h1da ? 16'hfba0 :  // <0215> puteol
addr == 16'h1db ? 16'h00eb :  // <0215> "
addr == 16'h1dc ? 16'hfc00 :  // <0215> "
addr == 16'h1dd ? 16'he00f :  // <0216> jmp :cmd_loop
addr == 16'h1de ? 16'h0161 :  // <0216> "


// ######## func dump_avalon // = 0x01df
addr == 16'h1df ? 16'h2002 :  // <0245> push i // func dump_avalon
addr == 16'h1e0 ? 16'h2003 :  // <0245> push j // "
addr == 16'h1e1 ? 16'h2004 :  // <0245> push x // "
addr == 16'h1e2 ? 16'h2005 :  // <0245> push y // "
addr == 16'h1e3 ? 16'h2006 :  // <0245> push ga // "
addr == 16'h1e4 ? 16'h2007 :  // <0245> push gb // "
addr == 16'h1e5 ? 16'h203e :  // <0245> push rtna // "
// test case: u0010 0011 0013 0012 0000 0000 0080.

// this func may borrow some peripheral registers to hold temporary data.
// but it can only borrow registers that don't have side effects that are relevant to this function.

// parse av_write_data reg address into av_data_regs high byte.
addr == 16'h1e6 ? 16'hfba0 :  // <0254> call :get4x
addr == 16'h1e7 ? 16'h0098 :  // <0254> "
addr == 16'h1e8 ? 16'hfc00 :  // <0254> "
addr == 16'h1e9 ? 16'h0801 :  // <0255> i = b
addr == 16'h1ea ? 16'he401 :  // <0256> bn iz :fail
addr == 16'h1eb ? 16'h02a2 :  // <0256> "
addr == 16'h1ec ? 16'h0352 :  // <0257> a = a<<4
addr == 16'h1ed ? 16'h1b52 :  // <0258> $av_data_regs = a<<4
addr == 16'h1ee ? 16'hfba0 :  // <0259> getchar_echo
addr == 16'h1ef ? 16'h0013 :  // <0259> "
addr == 16'h1f0 ? 16'hfc00 :  // <0259> "
addr == 16'h1f1 ? 16'h2000 :  // <0259> push a // "
addr == 16'h1f2 ? 16'hfba0 :  // <0259> "
addr == 16'h1f3 ? 16'h0004 :  // <0259> "
addr == 16'h1f4 ? 16'hfc00 :  // <0259> "
addr == 16'h1f5 ? 16'h0008 :  // <0259> pop a // "

// parse av_read_data reg address into av_data_regs low byte.
addr == 16'h1f6 ? 16'hfba0 :  // <0262> call :get4x
addr == 16'h1f7 ? 16'h0098 :  // <0262> "
addr == 16'h1f8 ? 16'hfc00 :  // <0262> "
addr == 16'h1f9 ? 16'h0801 :  // <0263> i = b
addr == 16'h1fa ? 16'he401 :  // <0264> bn iz :fail
addr == 16'h1fb ? 16'h02a2 :  // <0264> "
addr == 16'h1fc ? 16'h0406 :  // <0265> b = $av_data_regs
addr == 16'h1fd ? 16'hc800 :  // <0266> $av_data_regs = or
addr == 16'h1fe ? 16'h1b34 :  // <0266> "
addr == 16'h1ff ? 16'hfba0 :  // <0267> getchar_echo
addr == 16'h200 ? 16'h0013 :  // <0267> "
addr == 16'h201 ? 16'hfc00 :  // <0267> "
addr == 16'h202 ? 16'h2000 :  // <0267> push a // "
addr == 16'h203 ? 16'hfba0 :  // <0267> "
addr == 16'h204 ? 16'h0004 :  // <0267> "
addr == 16'h205 ? 16'hfc00 :  // <0267> "
addr == 16'h206 ? 16'h0008 :  // <0267> pop a // "

// parse av_ad_lo reg address into av_ad_lo_reg.
addr == 16'h207 ? 16'hfba0 :  // <0270> call :get4x
addr == 16'h208 ? 16'h0098 :  // <0270> "
addr == 16'h209 ? 16'hfc00 :  // <0270> "
addr == 16'h20a ? 16'h0801 :  // <0271> i = b
addr == 16'h20b ? 16'he401 :  // <0272> bn iz :fail
addr == 16'h20c ? 16'h02a2 :  // <0272> "
addr == 16'h20d ? 16'h1c00 :  // <0273> $av_ad_lo_reg = a
addr == 16'h20e ? 16'hfba0 :  // <0274> getchar_echo
addr == 16'h20f ? 16'h0013 :  // <0274> "
addr == 16'h210 ? 16'hfc00 :  // <0274> "
addr == 16'h211 ? 16'h2000 :  // <0274> push a // "
addr == 16'h212 ? 16'hfba0 :  // <0274> "
addr == 16'h213 ? 16'h0004 :  // <0274> "
addr == 16'h214 ? 16'hfc00 :  // <0274> "
addr == 16'h215 ? 16'h0008 :  // <0274> pop a // "

// parse av_ad_hi reg address into x.
addr == 16'h216 ? 16'hfba0 :  // <0277> call :get4x
addr == 16'h217 ? 16'h0098 :  // <0277> "
addr == 16'h218 ? 16'hfc00 :  // <0277> "
addr == 16'h219 ? 16'h0801 :  // <0278> i = b
addr == 16'h21a ? 16'he401 :  // <0279> bn iz :fail
addr == 16'h21b ? 16'h02a2 :  // <0279> "
addr == 16'h21c ? 16'h1000 :  // <0280> x = a
addr == 16'h21d ? 16'hfba0 :  // <0281> getchar_echo
addr == 16'h21e ? 16'h0013 :  // <0281> "
addr == 16'h21f ? 16'hfc00 :  // <0281> "
addr == 16'h220 ? 16'h2000 :  // <0281> push a // "
addr == 16'h221 ? 16'hfba0 :  // <0281> "
addr == 16'h222 ? 16'h0004 :  // <0281> "
addr == 16'h223 ? 16'hfc00 :  // <0281> "
addr == 16'h224 ? 16'h0008 :  // <0281> pop a // "

// parse start byte address high word into target's avalon master.
addr == 16'h225 ? 16'hfba0 :  // <0284> call :get4x
addr == 16'h226 ? 16'h0098 :  // <0284> "
addr == 16'h227 ? 16'hfc00 :  // <0284> "
addr == 16'h228 ? 16'h0801 :  // <0285> i = b
addr == 16'h229 ? 16'he401 :  // <0286> bn iz :fail
addr == 16'h22a ? 16'h02a2 :  // <0286> "
addr == 16'h22b ? 16'h3800 :  // <0287> poke_data = a
addr == 16'h22c ? 16'h0004 :  // <0288> a = x
addr == 16'h22d ? 16'hfba0 :  // <0289> call :poke
addr == 16'h22e ? 16'h0352 :  // <0289> "
addr == 16'h22f ? 16'hfc00 :  // <0289> "
addr == 16'h230 ? 16'hfba0 :  // <0290> getchar_echo
addr == 16'h231 ? 16'h0013 :  // <0290> "
addr == 16'h232 ? 16'hfc00 :  // <0290> "
addr == 16'h233 ? 16'h2000 :  // <0290> push a // "
addr == 16'h234 ? 16'hfba0 :  // <0290> "
addr == 16'h235 ? 16'h0004 :  // <0290> "
addr == 16'h236 ? 16'hfc00 :  // <0290> "
addr == 16'h237 ? 16'h0008 :  // <0290> pop a // "

// parse start byte address low word into target's avalon master.
addr == 16'h238 ? 16'hfba0 :  // <0293> call :get4x
addr == 16'h239 ? 16'h0098 :  // <0293> "
addr == 16'h23a ? 16'hfc00 :  // <0293> "
addr == 16'h23b ? 16'h0801 :  // <0294> i = b
addr == 16'h23c ? 16'he401 :  // <0295> bn iz :fail
addr == 16'h23d ? 16'h02a2 :  // <0295> "
addr == 16'h23e ? 16'h3800 :  // <0296> poke_data = a
addr == 16'h23f ? 16'h0007 :  // <0297> a = $av_ad_lo_reg
addr == 16'h240 ? 16'hfba0 :  // <0298> call :poke
addr == 16'h241 ? 16'h0352 :  // <0298> "
addr == 16'h242 ? 16'hfc00 :  // <0298> "
addr == 16'h243 ? 16'hfba0 :  // <0299> getchar_echo
addr == 16'h244 ? 16'h0013 :  // <0299> "
addr == 16'h245 ? 16'hfc00 :  // <0299> "
addr == 16'h246 ? 16'h2000 :  // <0299> push a // "
addr == 16'h247 ? 16'hfba0 :  // <0299> "
addr == 16'h248 ? 16'h0004 :  // <0299> "
addr == 16'h249 ? 16'hfc00 :  // <0299> "
addr == 16'h24a ? 16'h0008 :  // <0299> pop a // "

// parse length (in bytes) into i.
addr == 16'h24b ? 16'hfba0 :  // <0302> call :get4x
addr == 16'h24c ? 16'h0098 :  // <0302> "
addr == 16'h24d ? 16'hfc00 :  // <0302> "
addr == 16'h24e ? 16'h1001 :  // <0303> x = b
addr == 16'h24f ? 16'he402 :  // <0304> bn xz :fail
addr == 16'h250 ? 16'h02a2 :  // <0304> "
addr == 16'h251 ? 16'h0b50 :  // <0305> i = a>>1
addr == 16'h252 ? 16'he001 :  // <0306> br iz :fail
addr == 16'h253 ? 16'h02a2 :  // <0306> "

addr == 16'h254 ? 16'hfba0 :  // <0308> getchar_echo
addr == 16'h255 ? 16'h0013 :  // <0308> "
addr == 16'h256 ? 16'hfc00 :  // <0308> "
addr == 16'h257 ? 16'h2000 :  // <0308> push a // "
addr == 16'h258 ? 16'hfba0 :  // <0308> "
addr == 16'h259 ? 16'h0004 :  // <0308> "
addr == 16'h25a ? 16'hfc00 :  // <0308> "
addr == 16'h25b ? 16'h0008 :  // <0308> pop a // "
addr == 16'h25c ? 16'h062e :  // <0309> b = 46 // asc b = "."
addr == 16'h25d ? 16'he407 :  // <0310> bn eq :fail
addr == 16'h25e ? 16'h02a2 :  // <0310> "

// :next_row // = 0x025f
// print row header.
addr == 16'h25f ? 16'h03a0 :  // <0314> a = :eol_msg // puteol
addr == 16'h260 ? 16'h0002 :  // <0314> "
addr == 16'h261 ? 16'hfba0 :  // <0314> puteol
addr == 16'h262 ? 16'h00eb :  // <0314> "
addr == 16'h263 ? 16'hfc00 :  // <0314> "
addr == 16'h264 ? 16'h0007 :  // <0315> a = $av_ad_lo_reg
addr == 16'h265 ? 16'hfba0 :  // <0316> call :peek
addr == 16'h266 ? 16'h0363 :  // <0316> "
addr == 16'h267 ? 16'hfc00 :  // <0316> "
addr == 16'h268 ? 16'h0017 :  // <0317> a = peek_data
addr == 16'h269 ? 16'hfba0 :  // <0318> call :put4x
addr == 16'h26a ? 16'h005f :  // <0318> "
addr == 16'h26b ? 16'hfc00 :  // <0318> "
addr == 16'h26c ? 16'h023a :  // <0319> a = 58 // putasc ":"
addr == 16'h26d ? 16'hfba0 :  // <0319> putasc ":"
addr == 16'h26e ? 16'h0004 :  // <0319> "
addr == 16'h26f ? 16'hfc00 :  // <0319> "

// print 8 data words.
addr == 16'h270 ? 16'h1208 :  // <0322> x = 8
// :next_word // = 0x0271
// print data word from target's avalon master.
addr == 16'h271 ? 16'h0220 :  // <0325> a = 32 // putasc " "
addr == 16'h272 ? 16'hfba0 :  // <0325> putasc " "
addr == 16'h273 ? 16'h0004 :  // <0325> "
addr == 16'h274 ? 16'hfc00 :  // <0325> "
addr == 16'h275 ? 16'h0006 :  // <0326> a = $av_data_regs
addr == 16'h276 ? 16'hfba0 :  // <0327> call :peek_avalon
addr == 16'h277 ? 16'h02b3 :  // <0327> "
addr == 16'h278 ? 16'hfc00 :  // <0327> "
addr == 16'h279 ? 16'h0017 :  // <0328> a = peek_data
addr == 16'h27a ? 16'hfba0 :  // <0329> call :put4x
addr == 16'h27b ? 16'h005f :  // <0329> "
addr == 16'h27c ? 16'hfc00 :  // <0329> "

// increment target's av_ad_lo.
addr == 16'h27d ? 16'h0007 :  // <0332> a = $av_ad_lo_reg
addr == 16'h27e ? 16'hfba0 :  // <0333> call :peek
addr == 16'h27f ? 16'h0363 :  // <0333> "
addr == 16'h280 ? 16'hfc00 :  // <0333> "
addr == 16'h281 ? 16'h0017 :  // <0334> a = peek_data
addr == 16'h282 ? 16'h0602 :  // <0335> b = 2
addr == 16'h283 ? 16'hc800 :  // <0336> poke_data = a+b
addr == 16'h284 ? 16'h3b00 :  // <0336> "
addr == 16'h285 ? 16'h0007 :  // <0337> a = $av_ad_lo_reg
addr == 16'h286 ? 16'hfba0 :  // <0338> call :poke
addr == 16'h287 ? 16'h0352 :  // <0338> "
addr == 16'h288 ? 16'hfc00 :  // <0338> "

// check if all words have been dumped.
addr == 16'h289 ? 16'h0f60 :  // <0341> j = -1
addr == 16'h28a ? 16'hc800 :  // <0342> i = i+j
addr == 16'h28b ? 16'h0b10 :  // <0342> "
addr == 16'h28c ? 16'he001 :  // <0343> br iz :done
addr == 16'h28d ? 16'h0295 :  // <0343> "

// check for end of row.
addr == 16'h28e ? 16'h1760 :  // <0346> y = -1
addr == 16'h28f ? 16'hc800 :  // <0347> x = x+y
addr == 16'h290 ? 16'h1320 :  // <0347> "
addr == 16'h291 ? 16'he402 :  // <0348> bn xz :next_word
addr == 16'h292 ? 16'h0271 :  // <0348> "
addr == 16'h293 ? 16'he00f :  // <0349> jmp :next_row
addr == 16'h294 ? 16'h025f :  // <0349> "

// :done // = 0x0295
addr == 16'h295 ? 16'h03a0 :  // <0352> a = :eol_msg // puteol
addr == 16'h296 ? 16'h0002 :  // <0352> "
addr == 16'h297 ? 16'hfba0 :  // <0352> puteol
addr == 16'h298 ? 16'h00eb :  // <0352> "
addr == 16'h299 ? 16'hfc00 :  // <0352> "
addr == 16'h29a ? 16'hf808 :  // <0353> pop rtna // rtn
addr == 16'h29b ? 16'h1c08 :  // <0353> pop gb // "
addr == 16'h29c ? 16'h1808 :  // <0353> pop ga // "
addr == 16'h29d ? 16'h1408 :  // <0353> pop y // "
addr == 16'h29e ? 16'h1008 :  // <0353> pop x // "
addr == 16'h29f ? 16'h0c08 :  // <0353> pop j // "
addr == 16'h2a0 ? 16'h0808 :  // <0353> pop i // "
addr == 16'h2a1 ? 16'hfc00 :  // <0352> swapra = nop

// :fail // = 0x02a2
addr == 16'h2a2 ? 16'h023f :  // <0356> a = 63 // putasc "?"
addr == 16'h2a3 ? 16'hfba0 :  // <0356> putasc "?"
addr == 16'h2a4 ? 16'h0004 :  // <0356> "
addr == 16'h2a5 ? 16'hfc00 :  // <0356> "
addr == 16'h2a6 ? 16'h03a0 :  // <0357> a = :eol_msg // puteol
addr == 16'h2a7 ? 16'h0002 :  // <0357> "
addr == 16'h2a8 ? 16'hfba0 :  // <0357> puteol
addr == 16'h2a9 ? 16'h00eb :  // <0357> "
addr == 16'h2aa ? 16'hfc00 :  // <0357> "
addr == 16'h2ab ? 16'hf808 :  // <0358> pop rtna // end_func
addr == 16'h2ac ? 16'h1c08 :  // <0358> pop gb // "
addr == 16'h2ad ? 16'h1808 :  // <0358> pop ga // "
addr == 16'h2ae ? 16'h1408 :  // <0358> pop y // "
addr == 16'h2af ? 16'h1008 :  // <0358> pop x // "
addr == 16'h2b0 ? 16'h0c08 :  // <0358> pop j // "
addr == 16'h2b1 ? 16'h0808 :  // <0358> pop i // "
addr == 16'h2b2 ? 16'hfc00 :  // <0357> swapra = nop

// trigger a read in the target's avalon master.  return the data in peek_data.
// the 32-bit avalon address must already be poked into the target's avalon master.
// pass av_data_regs in a.  av_write_data reg address in its high byte; av_read_data reg address in its low byte.
// ######## func peek_avalon // = 0x02b3
addr == 16'h2b3 ? 16'h203e :  // <0363> push rtna // func peek_avalon
// peek the target's av_write_data register to trigger an avalon read as a side effect.
addr == 16'h2b4 ? 16'h2000 :  // <0365> push a // push a
addr == 16'h2b5 ? 16'h0353 :  // <0366> a = a>>4
addr == 16'h2b6 ? 16'h0353 :  // <0367> a = a>>4
addr == 16'h2b7 ? 16'hfba0 :  // <0368> call :peek
addr == 16'h2b8 ? 16'h0363 :  // <0368> "
addr == 16'h2b9 ? 16'hfc00 :  // <0368> "

// wait for target's avalon master to receive data e.g. from SDRAM controller.
addr == 16'h2ba ? 16'h020f :  // <0371> a = 15
addr == 16'h2bb ? 16'h0760 :  // <0372> b = -1
// :wait // = 0x02bc
addr == 16'h2bc ? 16'hc800 :  // <0374> a = a+b
addr == 16'h2bd ? 16'h0300 :  // <0374> "
addr == 16'h2be ? 16'he400 :  // <0375> bn az :wait
addr == 16'h2bf ? 16'h02bc :  // <0375> "

// peek data word from target's avalon master.
addr == 16'h2c0 ? 16'h0008 :  // <0378> pop a // pop a
addr == 16'h2c1 ? 16'h06ff :  // <0379> b = 0xff
addr == 16'h2c2 ? 16'hc800 :  // <0380> a = and
addr == 16'h2c3 ? 16'h0330 :  // <0380> "
addr == 16'h2c4 ? 16'hfba0 :  // <0381> call :peek
addr == 16'h2c5 ? 16'h0363 :  // <0381> "
addr == 16'h2c6 ? 16'hfc00 :  // <0381> "
addr == 16'h2c7 ? 16'hf808 :  // <0382> pop rtna // end_func
addr == 16'h2c8 ? 16'hfc00 :  // <0381> swapra = nop

// ######## func wait_for_bp // = 0x02c9
// :poll // = 0x02c9
addr == 16'h2c9 ? 16'h0018 :  // <0386> a = bp_status
addr == 16'h2ca ? 16'he000 :  // <0387> br az :poll
addr == 16'h2cb ? 16'h02c9 :  // <0387> "
addr == 16'h2cc ? 16'hfc00 :  // <0387> swapra = nop

// ######## func set_bp // = 0x02cd
addr == 16'h2cd ? 16'h2004 :  // <0390> push x // func set_bp
addr == 16'h2ce ? 16'h2005 :  // <0390> push y // "
addr == 16'h2cf ? 16'h203e :  // <0390> push rtna // "
addr == 16'h2d0 ? 16'hfba0 :  // <0391> getchar_echo
addr == 16'h2d1 ? 16'h0013 :  // <0391> "
addr == 16'h2d2 ? 16'hfc00 :  // <0391> "
addr == 16'h2d3 ? 16'h2000 :  // <0391> push a // "
addr == 16'h2d4 ? 16'hfba0 :  // <0391> "
addr == 16'h2d5 ? 16'h0004 :  // <0391> "
addr == 16'h2d6 ? 16'hfc00 :  // <0391> "
addr == 16'h2d7 ? 16'h0008 :  // <0391> pop a // "
addr == 16'h2d8 ? 16'h1000 :  // <0392> x = a
addr == 16'h2d9 ? 16'hfba0 :  // <0393> getchar_echo
addr == 16'h2da ? 16'h0013 :  // <0393> "
addr == 16'h2db ? 16'hfc00 :  // <0393> "
addr == 16'h2dc ? 16'h2000 :  // <0393> push a // "
addr == 16'h2dd ? 16'hfba0 :  // <0393> "
addr == 16'h2de ? 16'h0004 :  // <0393> "
addr == 16'h2df ? 16'hfc00 :  // <0393> "
addr == 16'h2e0 ? 16'h0008 :  // <0393> pop a // "
addr == 16'h2e1 ? 16'h063d :  // <0394> b = 61 // asc b = "="
addr == 16'h2e2 ? 16'he407 :  // <0395> bn eq :fail
addr == 16'h2e3 ? 16'h030e :  // <0395> "
addr == 16'h2e4 ? 16'hfba0 :  // <0396> call :get4x
addr == 16'h2e5 ? 16'h0098 :  // <0396> "
addr == 16'h2e6 ? 16'hfc00 :  // <0396> "
addr == 16'h2e7 ? 16'h1400 :  // <0397> y = a
addr == 16'h2e8 ? 16'h0200 :  // <0398> a = 0
addr == 16'h2e9 ? 16'he407 :  // <0399> bn eq :fail
addr == 16'h2ea ? 16'h030e :  // <0399> "
addr == 16'h2eb ? 16'h0004 :  // <0400> a = x
addr == 16'h2ec ? 16'h0630 :  // <0401> b = 48 // asc b = "0"
addr == 16'h2ed ? 16'he007 :  // <0402> br eq :b0
addr == 16'h2ee ? 16'h02fa :  // <0402> "
addr == 16'h2ef ? 16'h0631 :  // <0403> b = 49 // asc b = "1"
addr == 16'h2f0 ? 16'he007 :  // <0404> br eq :b1
addr == 16'h2f1 ? 16'h02ff :  // <0404> "
addr == 16'h2f2 ? 16'h0632 :  // <0405> b = 50 // asc b = "2"
addr == 16'h2f3 ? 16'he007 :  // <0406> br eq :b2
addr == 16'h2f4 ? 16'h0304 :  // <0406> "
addr == 16'h2f5 ? 16'h0633 :  // <0407> b = 51 // asc b = "3"
addr == 16'h2f6 ? 16'he007 :  // <0408> br eq :b3
addr == 16'h2f7 ? 16'h0309 :  // <0408> "
addr == 16'h2f8 ? 16'he00f :  // <0409> jmp :fail
addr == 16'h2f9 ? 16'h030e :  // <0409> "
// :b0 // = 0x02fa
addr == 16'h2fa ? 16'h2405 :  // <0411> bp0_addr = y
addr == 16'h2fb ? 16'hf808 :  // <0412> pop rtna // rtn
addr == 16'h2fc ? 16'h1408 :  // <0412> pop y // "
addr == 16'h2fd ? 16'h1008 :  // <0412> pop x // "
addr == 16'h2fe ? 16'hfc00 :  // <0411> swapra = nop
// :b1 // = 0x02ff
addr == 16'h2ff ? 16'h2805 :  // <0414> bp1_addr = y
addr == 16'h300 ? 16'hf808 :  // <0415> pop rtna // rtn
addr == 16'h301 ? 16'h1408 :  // <0415> pop y // "
addr == 16'h302 ? 16'h1008 :  // <0415> pop x // "
addr == 16'h303 ? 16'hfc00 :  // <0414> swapra = nop
// :b2 // = 0x0304
addr == 16'h304 ? 16'h2c05 :  // <0417> bp2_addr = y
addr == 16'h305 ? 16'hf808 :  // <0418> pop rtna // rtn
addr == 16'h306 ? 16'h1408 :  // <0418> pop y // "
addr == 16'h307 ? 16'h1008 :  // <0418> pop x // "
addr == 16'h308 ? 16'hfc00 :  // <0417> swapra = nop
// :b3 // = 0x0309
addr == 16'h309 ? 16'h3005 :  // <0420> bp3_addr = y
addr == 16'h30a ? 16'hf808 :  // <0421> pop rtna // rtn
addr == 16'h30b ? 16'h1408 :  // <0421> pop y // "
addr == 16'h30c ? 16'h1008 :  // <0421> pop x // "
addr == 16'h30d ? 16'hfc00 :  // <0420> swapra = nop

// :fail // = 0x030e
addr == 16'h30e ? 16'h023f :  // <0424> a = 63 // putasc "?"
addr == 16'h30f ? 16'hfba0 :  // <0424> putasc "?"
addr == 16'h310 ? 16'h0004 :  // <0424> "
addr == 16'h311 ? 16'hfc00 :  // <0424> "
addr == 16'h312 ? 16'h03a0 :  // <0425> a = :eol_msg // puteol
addr == 16'h313 ? 16'h0002 :  // <0425> "
addr == 16'h314 ? 16'hfba0 :  // <0425> puteol
addr == 16'h315 ? 16'h00eb :  // <0425> "
addr == 16'h316 ? 16'hfc00 :  // <0425> "
addr == 16'h317 ? 16'hf808 :  // <0426> pop rtna // end_func
addr == 16'h318 ? 16'h1408 :  // <0426> pop y // "
addr == 16'h319 ? 16'h1008 :  // <0426> pop x // "
addr == 16'h31a ? 16'hfc00 :  // <0425> swapra = nop

// ######## func poke_cmd // = 0x031b
addr == 16'h31b ? 16'h2004 :  // <0428> push x // func poke_cmd
addr == 16'h31c ? 16'h203e :  // <0428> push rtna // "
// x = destination register address to poke.
addr == 16'h31d ? 16'hfba0 :  // <0430> call :get4x
addr == 16'h31e ? 16'h0098 :  // <0430> "
addr == 16'h31f ? 16'hfc00 :  // <0430> "
addr == 16'h320 ? 16'h1000 :  // <0431> x = a
addr == 16'h321 ? 16'h0200 :  // <0432> a = 0
addr == 16'h322 ? 16'he407 :  // <0433> bn eq :fail
addr == 16'h323 ? 16'h033d :  // <0433> "

addr == 16'h324 ? 16'hfba0 :  // <0435> getchar_echo
addr == 16'h325 ? 16'h0013 :  // <0435> "
addr == 16'h326 ? 16'hfc00 :  // <0435> "
addr == 16'h327 ? 16'h2000 :  // <0435> push a // "
addr == 16'h328 ? 16'hfba0 :  // <0435> "
addr == 16'h329 ? 16'h0004 :  // <0435> "
addr == 16'h32a ? 16'hfc00 :  // <0435> "
addr == 16'h32b ? 16'h0008 :  // <0435> pop a // "
addr == 16'h32c ? 16'h063d :  // <0436> b = 61 // asc b = "="
addr == 16'h32d ? 16'he407 :  // <0437> bn eq :fail
addr == 16'h32e ? 16'h033d :  // <0437> "

// parse value to poke.
addr == 16'h32f ? 16'hfba0 :  // <0440> call :get4x
addr == 16'h330 ? 16'h0098 :  // <0440> "
addr == 16'h331 ? 16'hfc00 :  // <0440> "
addr == 16'h332 ? 16'h3800 :  // <0441> poke_data = a
addr == 16'h333 ? 16'h0200 :  // <0442> a = 0
addr == 16'h334 ? 16'he407 :  // <0443> bn eq :fail
addr == 16'h335 ? 16'h033d :  // <0443> "

addr == 16'h336 ? 16'h0004 :  // <0445> a = x
addr == 16'h337 ? 16'hfba0 :  // <0446> call :poke
addr == 16'h338 ? 16'h0352 :  // <0446> "
addr == 16'h339 ? 16'hfc00 :  // <0446> "
addr == 16'h33a ? 16'hf808 :  // <0447> pop rtna // rtn
addr == 16'h33b ? 16'h1008 :  // <0447> pop x // "
addr == 16'h33c ? 16'hfc00 :  // <0446> swapra = nop

// :fail // = 0x033d
addr == 16'h33d ? 16'h023f :  // <0450> a = 63 // putasc "?"
addr == 16'h33e ? 16'hfba0 :  // <0450> putasc "?"
addr == 16'h33f ? 16'h0004 :  // <0450> "
addr == 16'h340 ? 16'hfc00 :  // <0450> "
addr == 16'h341 ? 16'h03a0 :  // <0451> a = :eol_msg // puteol
addr == 16'h342 ? 16'h0002 :  // <0451> "
addr == 16'h343 ? 16'hfba0 :  // <0451> puteol
addr == 16'h344 ? 16'h00eb :  // <0451> "
addr == 16'h345 ? 16'hfc00 :  // <0451> "
addr == 16'h346 ? 16'hf808 :  // <0452> pop rtna // end_func
addr == 16'h347 ? 16'h1008 :  // <0452> pop x // "
addr == 16'h348 ? 16'hfc00 :  // <0451> swapra = nop

// force execution of the opcode passed in force_opcode.
// ######## func force_instruction // = 0x0349
addr == 16'h349 ? 16'h3e04 :  // <0456> bus_ctrl = $divert_code_bus_mask
addr == 16'h34a ? 16'h4201 :  // <0457> tg_force = $hold_state_mask
addr == 16'h34b ? 16'h4203 :  // <0458> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h34c ? 16'h4205 :  // <0459> tg_force = ($hold_state_mask | $force_exec_mask)
addr == 16'h34d ? 16'h4201 :  // <0460> tg_force = $hold_state_mask
// refill target exr so it can resume seamlessly.
addr == 16'h34e ? 16'h3415 :  // <0462> force_opcode = exr_shadow
addr == 16'h34f ? 16'h4203 :  // <0463> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h350 ? 16'h4200 :  // <0464> tg_force = 0
addr == 16'h351 ? 16'hfc00 :  // <0464> swapra = nop

// write to a register in the target MCU.  pass the value in poke_data.
// pass its register address in a.
// ######## func poke // = 0x0352
addr == 16'h352 ? 16'h203e :  // <0469> push rtna // func poke
addr == 16'h353 ? 16'h063f :  // <0470> b = $dest_mask
addr == 16'h354 ? 16'hc800 :  // <0471> a = and
addr == 16'h355 ? 16'h0330 :  // <0471> "
addr == 16'h356 ? 16'h0352 :  // <0472> a = a<<4
addr == 16'h357 ? 16'h0352 :  // <0473> a = a<<4
addr == 16'h358 ? 16'h0351 :  // <0474> a = a<<1
addr == 16'h359 ? 16'h0351 :  // <0475> a = a<<1
addr == 16'h35a ? 16'h07a0 :  // <0476> b = ([src dbgpoke])
addr == 16'h35b ? 16'h03c0 :  // <0476> "
addr == 16'h35c ? 16'hc800 :  // <0477> force_opcode = or
addr == 16'h35d ? 16'h3734 :  // <0477> "
addr == 16'h35e ? 16'hfba0 :  // <0478> call :force_instruction
addr == 16'h35f ? 16'h0349 :  // <0478> "
addr == 16'h360 ? 16'hfc00 :  // <0478> "
addr == 16'h361 ? 16'hf808 :  // <0479> pop rtna // end_func
addr == 16'h362 ? 16'hfc00 :  // <0478> swapra = nop

// observe a register in the target MCU.  return its value in peek_data.
// pass its register address in a.
// ######## func peek // = 0x0363
addr == 16'h363 ? 16'h203e :  // <0483> push rtna // func peek
addr == 16'h364 ? 16'h07a0 :  // <0484> b = $src_mask
addr == 16'h365 ? 16'h03ff :  // <0484> "
addr == 16'h366 ? 16'hc800 :  // <0485> a = and
addr == 16'h367 ? 16'h0330 :  // <0485> "
addr == 16'h368 ? 16'h07a0 :  // <0486> b = ([dest nop] << $dest_lsb)
addr == 16'h369 ? 16'hc800 :  // <0486> "
addr == 16'h36a ? 16'hc800 :  // <0487> force_opcode = or
addr == 16'h36b ? 16'h3734 :  // <0487> "
addr == 16'h36c ? 16'hfba0 :  // <0488> call :force_instruction
addr == 16'h36d ? 16'h0349 :  // <0488> "
addr == 16'h36e ? 16'hfc00 :  // <0488> "
// target's register value is now in peek_data.
addr == 16'h36f ? 16'hf808 :  // <0490> pop rtna // end_func
addr == 16'h370 ? 16'hfc00 :  // <0489> swapra = nop

// show target status display.
// ######## func dump_target // = 0x0371
addr == 16'h371 ? 16'h2002 :  // <0493> push i // func dump_target
addr == 16'h372 ? 16'h2003 :  // <0493> push j // "
addr == 16'h373 ? 16'h203e :  // <0493> push rtna // "
addr == 16'h374 ? 16'h03a0 :  // <0494> a = :eol_msg // puteol
addr == 16'h375 ? 16'h0002 :  // <0494> "
addr == 16'h376 ? 16'hfba0 :  // <0494> puteol
addr == 16'h377 ? 16'h00eb :  // <0494> "
addr == 16'h378 ? 16'hfc00 :  // <0494> "
addr == 16'h379 ? 16'h0a00 :  // <0495> i = 0
addr == 16'h37a ? 16'h0e01 :  // <0496> j = 1
// :next_reg // = 0x037b
// fetch register name from table in target program.
// i = register number.
// peek is skipped for any reg name starting with 2 slashes (good for read-sensitive regs).
addr == 16'h37b ? 16'h0002 :  // <0501> a = i
addr == 16'h37c ? 16'h0351 :  // <0502> a = a<<1
addr == 16'h37d ? 16'h0351 :  // <0503> a = a<<1
addr == 16'h37e ? 16'h0603 :  // <0504> b = 3
addr == 16'h37f ? 16'hc800 :  // <0505> a = a+b
addr == 16'h380 ? 16'h0300 :  // <0505> "
addr == 16'h381 ? 16'h0404 :  // <0506> b = x
addr == 16'h382 ? 16'hc800 :  // <0507> m9k_addr = a+b
addr == 16'h383 ? 16'h4f00 :  // <0507> "
addr == 16'h384 ? 16'h0014 :  // <0508> a = m9k_data
addr == 16'h385 ? 16'h07a0 :  // <0509> b = 0x2f2f
addr == 16'h386 ? 16'h2f2f :  // <0509> "
addr == 16'h387 ? 16'he007 :  // <0510> br eq :no_peek
addr == 16'h388 ? 16'h03a7 :  // <0510> "
addr == 16'h389 ? 16'h0220 :  // <0511> a = 32 // putasc " "
addr == 16'h38a ? 16'hfba0 :  // <0511> putasc " "
addr == 16'h38b ? 16'h0004 :  // <0511> "
addr == 16'h38c ? 16'hfc00 :  // <0511> "
addr == 16'h38d ? 16'h0220 :  // <0512> a = 32 // putasc " "
addr == 16'h38e ? 16'hfba0 :  // <0512> putasc " "
addr == 16'h38f ? 16'h0004 :  // <0512> "
addr == 16'h390 ? 16'hfc00 :  // <0512> "
addr == 16'h391 ? 16'h0013 :  // <0513> a = m9k_addr
addr == 16'h392 ? 16'h0608 :  // <0514> b = 8
addr == 16'h393 ? 16'hfba0 :  // <0515> call :print_fixed_target
addr == 16'h394 ? 16'h03b2 :  // <0515> "
addr == 16'h395 ? 16'hfc00 :  // <0515> "
addr == 16'h396 ? 16'h023d :  // <0516> a = 61 // putasc "="
addr == 16'h397 ? 16'hfba0 :  // <0516> putasc "="
addr == 16'h398 ? 16'h0004 :  // <0516> "
addr == 16'h399 ? 16'hfc00 :  // <0516> "
addr == 16'h39a ? 16'h0002 :  // <0517> a = i
addr == 16'h39b ? 16'hfba0 :  // <0518> call :peek
addr == 16'h39c ? 16'h0363 :  // <0518> "
addr == 16'h39d ? 16'hfc00 :  // <0518> "
addr == 16'h39e ? 16'h0017 :  // <0519> a = peek_data
addr == 16'h39f ? 16'hfba0 :  // <0520> call :put4x
addr == 16'h3a0 ? 16'h005f :  // <0520> "
addr == 16'h3a1 ? 16'hfc00 :  // <0520> "
addr == 16'h3a2 ? 16'h03a0 :  // <0521> a = :eol_msg // puteol
addr == 16'h3a3 ? 16'h0002 :  // <0521> "
addr == 16'h3a4 ? 16'hfba0 :  // <0521> puteol
addr == 16'h3a5 ? 16'h00eb :  // <0521> "
addr == 16'h3a6 ? 16'hfc00 :  // <0521> "
// :no_peek // = 0x03a7
addr == 16'h3a7 ? 16'hc800 :  // <0523> i = i+j
addr == 16'h3a8 ? 16'h0b10 :  // <0523> "
// loop up to the number of registers in the target program's register name table.
addr == 16'h3a9 ? 16'h4e02 :  // <0525> m9k_addr = 2
addr == 16'h3aa ? 16'h0414 :  // <0526> b = m9k_data
addr == 16'h3ab ? 16'h0002 :  // <0527> a = i
addr == 16'h3ac ? 16'he407 :  // <0528> bn eq :next_reg
addr == 16'h3ad ? 16'h037b :  // <0528> "
addr == 16'h3ae ? 16'hf808 :  // <0529> pop rtna // end_func
addr == 16'h3af ? 16'h0c08 :  // <0529> pop j // "
addr == 16'h3b0 ? 16'h0808 :  // <0529> pop i // "
addr == 16'h3b1 ? 16'hfc00 :  // <0528> swapra = nop

// print a fixed-length string from packed words in TARGET program space.
// pass its word address (not its byte address) in a,  its length (bytes) in b.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_fixed_target // = 0x03b2
addr == 16'h3b2 ? 16'h2002 :  // <0535> push i // func print_fixed_target
addr == 16'h3b3 ? 16'h2003 :  // <0535> push j // "
addr == 16'h3b4 ? 16'h2004 :  // <0535> push x // "
addr == 16'h3b5 ? 16'h2005 :  // <0535> push y // "
addr == 16'h3b6 ? 16'h2006 :  // <0535> push ga // "
addr == 16'h3b7 ? 16'h203e :  // <0535> push rtna // "
addr == 16'h3b8 ? 16'h0800 :  // <0536> i = a
addr == 16'h3b9 ? 16'h0e01 :  // <0537> j = 1
addr == 16'h3ba ? 16'h1001 :  // <0538> x = b
addr == 16'h3bb ? 16'h1760 :  // <0539> y = -1
// :next_word // = 0x03bc
addr == 16'h3bc ? 16'he002 :  // <0541> br xz :done
addr == 16'h3bd ? 16'h03d2 :  // <0541> "
addr == 16'h3be ? 16'h1320 :  // <0542> x = ad2
addr == 16'h3bf ? 16'h4c02 :  // <0543> m9k_addr = i
addr == 16'h3c0 ? 16'h1814 :  // <0544> ga = m9k_data
// now x = bytes remaining, i = current word address, g6 = data word.
addr == 16'h3c1 ? 16'h0006 :  // <0546> a = ga // putchar ga
addr == 16'h3c2 ? 16'hfba0 :  // <0546> putchar ga
addr == 16'h3c3 ? 16'h0004 :  // <0546> "
addr == 16'h3c4 ? 16'hfc00 :  // <0546> "
addr == 16'h3c5 ? 16'he002 :  // <0547> br xz :done
addr == 16'h3c6 ? 16'h03d2 :  // <0547> "
addr == 16'h3c7 ? 16'h1320 :  // <0548> x = ad2
addr == 16'h3c8 ? 16'h0006 :  // <0549> a = ga
addr == 16'h3c9 ? 16'h0353 :  // <0550> a = a>>4
addr == 16'h3ca ? 16'h0353 :  // <0551> a = a>>4
addr == 16'h3cb ? 16'hfba0 :  // <0552> putchar a
addr == 16'h3cc ? 16'h0004 :  // <0552> "
addr == 16'h3cd ? 16'hfc00 :  // <0552> "
addr == 16'h3ce ? 16'hc800 :  // <0553> i = i+j
addr == 16'h3cf ? 16'h0b10 :  // <0553> "
addr == 16'h3d0 ? 16'he00f :  // <0554> jmp :next_word
addr == 16'h3d1 ? 16'h03bc :  // <0554> "
// :done // = 0x03d2
addr == 16'h3d2 ? 16'hf808 :  // <0556> pop rtna // end_func
addr == 16'h3d3 ? 16'h1808 :  // <0556> pop ga // "
addr == 16'h3d4 ? 16'h1408 :  // <0556> pop y // "
addr == 16'h3d5 ? 16'h1008 :  // <0556> pop x // "
addr == 16'h3d6 ? 16'h0c08 :  // <0556> pop j // "
addr == 16'h3d7 ? 16'h0808 :  // <0556> pop i // "
addr == 16'h3d8 ? 16'hfc00 :  // <0555> swapra = nop

// ######## func load_program // = 0x03d9
addr == 16'h3d9 ? 16'h2002 :  // <0558> push i // func load_program
addr == 16'h3da ? 16'h2003 :  // <0558> push j // "
addr == 16'h3db ? 16'h2004 :  // <0558> push x // "
addr == 16'h3dc ? 16'h203e :  // <0558> push rtna // "
// load target program from UART.

// length, little-endian.  memorize in x.
addr == 16'h3dd ? 16'h03a0 :  // <0562> a = :eol_msg // puteol
addr == 16'h3de ? 16'h0002 :  // <0562> "
addr == 16'h3df ? 16'hfba0 :  // <0562> puteol
addr == 16'h3e0 ? 16'h00eb :  // <0562> "
addr == 16'h3e1 ? 16'hfc00 :  // <0562> "
addr == 16'h3e2 ? 16'h024c :  // <0563> a = 76 // putasc L
addr == 16'h3e3 ? 16'hfba0 :  // <0563> putasc L
addr == 16'h3e4 ? 16'h0004 :  // <0563> "
addr == 16'h3e5 ? 16'hfc00 :  // <0563> "
addr == 16'h3e6 ? 16'hfba0 :  // <0564> get16 x
addr == 16'h3e7 ? 16'h0013 :  // <0564> "
addr == 16'h3e8 ? 16'hfc00 :  // <0564> "
addr == 16'h3e9 ? 16'h2000 :  // <0564> push a // "
addr == 16'h3ea ? 16'hfba0 :  // <0564> "
addr == 16'h3eb ? 16'h0013 :  // <0564> "
addr == 16'h3ec ? 16'hfc00 :  // <0564> "
addr == 16'h3ed ? 16'h0352 :  // <0564> "
addr == 16'h3ee ? 16'h0352 :  // <0564> "
addr == 16'h3ef ? 16'h0408 :  // <0564> pop b // "
addr == 16'h3f0 ? 16'hc800 :  // <0564> "
addr == 16'h3f1 ? 16'h1334 :  // <0564> "
addr == 16'h3f2 ? 16'h0004 :  // <0565> a = x
addr == 16'h3f3 ? 16'hfba0 :  // <0566> call :put4x
addr == 16'h3f4 ? 16'h005f :  // <0566> "
addr == 16'h3f5 ? 16'hfc00 :  // <0566> "
addr == 16'h3f6 ? 16'h03a0 :  // <0567> a = :eol_msg // puteol
addr == 16'h3f7 ? 16'h0002 :  // <0567> "
addr == 16'h3f8 ? 16'hfba0 :  // <0567> puteol
addr == 16'h3f9 ? 16'h00eb :  // <0567> "
addr == 16'h3fa ? 16'hfc00 :  // <0567> "

// put target into reset again, in case this is a target warm boot.
addr == 16'h3fb ? 16'h3e02 :  // <0570> bus_ctrl = $tg_reset_mask

// load opcodes.  count up address in i.
addr == 16'h3fc ? 16'h0a00 :  // <0573> i = 0
addr == 16'h3fd ? 16'h0e01 :  // <0574> j = 1
addr == 16'h3fe ? 16'hfba0 :  // <0575> callx  fletcher16_init
addr == 16'h3ff ? 16'h010c :  // <0575> "
addr == 16'h400 ? 16'hfc00 :  // <0575> "
// :loadword // = 0x0401
// receive, store in RAM.
addr == 16'h401 ? 16'hfba0 :  // <0578> get16 a
addr == 16'h402 ? 16'h0013 :  // <0578> "
addr == 16'h403 ? 16'hfc00 :  // <0578> "
addr == 16'h404 ? 16'h2000 :  // <0578> push a // "
addr == 16'h405 ? 16'hfba0 :  // <0578> "
addr == 16'h406 ? 16'h0013 :  // <0578> "
addr == 16'h407 ? 16'hfc00 :  // <0578> "
addr == 16'h408 ? 16'h0352 :  // <0578> "
addr == 16'h409 ? 16'h0352 :  // <0578> "
addr == 16'h40a ? 16'h0408 :  // <0578> pop b // "
addr == 16'h40b ? 16'hc800 :  // <0578> "
addr == 16'h40c ? 16'h0334 :  // <0578> "
addr == 16'h40d ? 16'h4c02 :  // <0579> m9k_addr = i
addr == 16'h40e ? 16'h5000 :  // <0580> m9k_data = a

// read back from RAM and build checksum.
addr == 16'h40f ? 16'h0014 :  // <0583> a = m9k_data
addr == 16'h410 ? 16'hfba0 :  // <0583> callx  fletcher16_input16  m9k_data
addr == 16'h411 ? 16'h012c :  // <0583> "
addr == 16'h412 ? 16'hfc00 :  // <0583> "

//  show decimated feedback text, for more speed:
addr == 16'h413 ? 16'h0002 :  // <0586> a = i
addr == 16'h414 ? 16'h061f :  // <0587> b = 0x1f
addr == 16'h415 ? 16'he403 :  // <0588> bn and0z :skip_text
addr == 16'h416 ? 16'h041b :  // <0588> "
addr == 16'h417 ? 16'h022e :  // <0589> a = 46 // putasc "."
addr == 16'h418 ? 16'hfba0 :  // <0589> putasc "."
addr == 16'h419 ? 16'h0004 :  // <0589> "
addr == 16'h41a ? 16'hfc00 :  // <0589> "
// :skip_text // = 0x041b

addr == 16'h41b ? 16'hc800 :  // <0592> i = i+j
addr == 16'h41c ? 16'h0b10 :  // <0592> "
addr == 16'h41d ? 16'h0002 :  // <0593> a = i
addr == 16'h41e ? 16'h0404 :  // <0594> b = x
addr == 16'h41f ? 16'he407 :  // <0595> bn eq :loadword
addr == 16'h420 ? 16'h0401 :  // <0595> "
addr == 16'h421 ? 16'h03a0 :  // <0596> a = :eol_msg // puteol
addr == 16'h422 ? 16'h0002 :  // <0596> "
addr == 16'h423 ? 16'hfba0 :  // <0596> puteol
addr == 16'h424 ? 16'h00eb :  // <0596> "
addr == 16'h425 ? 16'hfc00 :  // <0596> "
addr == 16'h426 ? 16'hfba0 :  // <0597> callx fletcher16_result  a
addr == 16'h427 ? 16'h013d :  // <0597> "
addr == 16'h428 ? 16'hfc00 :  // <0597> "
addr == 16'h429 ? 16'hfba0 :  // <0598> call :put4x
addr == 16'h42a ? 16'h005f :  // <0598> "
addr == 16'h42b ? 16'hfc00 :  // <0598> "
addr == 16'h42c ? 16'h03a0 :  // <0599> a = :eol_msg // puteol
addr == 16'h42d ? 16'h0002 :  // <0599> "
addr == 16'h42e ? 16'hfba0 :  // <0599> puteol
addr == 16'h42f ? 16'h00eb :  // <0599> "
addr == 16'h430 ? 16'hfc00 :  // <0599> "
addr == 16'h431 ? 16'hf808 :  // <0600> pop rtna // end_func
addr == 16'h432 ? 16'h1008 :  // <0600> pop x // "
addr == 16'h433 ? 16'h0c08 :  // <0600> pop j // "
addr == 16'h434 ? 16'h0808 :  // <0600> pop i // "
addr == 16'h435 ? 16'hfc00 :  // <0599> swapra = nop


        
                16'hxxxx;
        endmodule
    
