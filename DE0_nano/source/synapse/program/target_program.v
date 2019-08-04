
        `include "header.v"

        module target_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.

addr == 16'h00 ? 16'he00f :  // <0004> jmp :main
addr == 16'h01 ? 16'h0202 :  // <0004> "


// size of register file.  all registers are external to the Synapse316 core.
// min_num_regs <= num_regs <= max_num_regs.
//vdefine num_regs                32
//vdefine top_reg                 $num_regs - 1
// those 2 have been moved to the assembly program to be distinct for each core.

// Synapse instruction set architecture constants.

// Synapse instruction set codes.

// debugging supervisor contants.  these are also required by implementation of the target MCU core.

// program code dimensions.


// register file configuration.
// num_gp should include the p registers and the operators.  everything beneath the peripherals.

// application-specific register aliases.
// patch: g6, g7 obsolete.



// I/O expansion bus.

addr == 16'h02 ? 16'h0011 :  // <0039> emit_debugger_register_table  counter
// "       a"
addr == 16'h03 ? 16'h2020 :  // <0039>   
addr == 16'h04 ? 16'h2020 :  // <0039>   
addr == 16'h05 ? 16'h2020 :  // <0039>   
addr == 16'h06 ? 16'h6120 :  // <0039> a 
// "       b"
addr == 16'h07 ? 16'h2020 :  // <0039>   
addr == 16'h08 ? 16'h2020 :  // <0039>   
addr == 16'h09 ? 16'h2020 :  // <0039>   
addr == 16'h0a ? 16'h6220 :  // <0039> b 
// "       i"
addr == 16'h0b ? 16'h2020 :  // <0039>   
addr == 16'h0c ? 16'h2020 :  // <0039>   
addr == 16'h0d ? 16'h2020 :  // <0039>   
addr == 16'h0e ? 16'h6920 :  // <0039> i 
// "       j"
addr == 16'h0f ? 16'h2020 :  // <0039>   
addr == 16'h10 ? 16'h2020 :  // <0039>   
addr == 16'h11 ? 16'h2020 :  // <0039>   
addr == 16'h12 ? 16'h6a20 :  // <0039> j 
// "       x"
addr == 16'h13 ? 16'h2020 :  // <0039>   
addr == 16'h14 ? 16'h2020 :  // <0039>   
addr == 16'h15 ? 16'h2020 :  // <0039>   
addr == 16'h16 ? 16'h7820 :  // <0039> x 
// "       y"
addr == 16'h17 ? 16'h2020 :  // <0039>   
addr == 16'h18 ? 16'h2020 :  // <0039>   
addr == 16'h19 ? 16'h2020 :  // <0039>   
addr == 16'h1a ? 16'h7920 :  // <0039> y 
// "      ga"
addr == 16'h1b ? 16'h2020 :  // <0039>   
addr == 16'h1c ? 16'h2020 :  // <0039>   
addr == 16'h1d ? 16'h2020 :  // <0039>   
addr == 16'h1e ? 16'h6167 :  // <0039> ag
// "      gb"
addr == 16'h1f ? 16'h2020 :  // <0039>   
addr == 16'h20 ? 16'h2020 :  // <0039>   
addr == 16'h21 ? 16'h2020 :  // <0039>   
addr == 16'h22 ? 16'h6267 :  // <0039> bg
// "      pa"
addr == 16'h23 ? 16'h2020 :  // <0039>   
addr == 16'h24 ? 16'h2020 :  // <0039>   
addr == 16'h25 ? 16'h2020 :  // <0039>   
addr == 16'h26 ? 16'h6170 :  // <0039> ap
// "      pb"
addr == 16'h27 ? 16'h2020 :  // <0039>   
addr == 16'h28 ? 16'h2020 :  // <0039>   
addr == 16'h29 ? 16'h2020 :  // <0039>   
addr == 16'h2a ? 16'h6270 :  // <0039> bp
// "      pc"
addr == 16'h2b ? 16'h2020 :  // <0039>   
addr == 16'h2c ? 16'h2020 :  // <0039>   
addr == 16'h2d ? 16'h2020 :  // <0039>   
addr == 16'h2e ? 16'h6370 :  // <0039> cp
// "      pd"
addr == 16'h2f ? 16'h2020 :  // <0039>   
addr == 16'h30 ? 16'h2020 :  // <0039>   
addr == 16'h31 ? 16'h2020 :  // <0039>   
addr == 16'h32 ? 16'h6470 :  // <0039> dp
// "//rstk  "
addr == 16'h33 ? 16'h2f2f :  // <0039> //
addr == 16'h34 ? 16'h7372 :  // <0039> sr
addr == 16'h35 ? 16'h6b74 :  // <0039> kt
addr == 16'h36 ? 16'h2020 :  // <0039>   
// "//uartdt"
addr == 16'h37 ? 16'h2f2f :  // <0039> //
addr == 16'h38 ? 16'h6175 :  // <0039> au
addr == 16'h39 ? 16'h7472 :  // <0039> tr
addr == 16'h3a ? 16'h7464 :  // <0039> td
// "uartstat"
addr == 16'h3b ? 16'h6175 :  // <0039> au
addr == 16'h3c ? 16'h7472 :  // <0039> tr
addr == 16'h3d ? 16'h7473 :  // <0039> ts
addr == 16'h3e ? 16'h7461 :  // <0039> ta
// "//edata "
addr == 16'h3f ? 16'h2f2f :  // <0039> //
addr == 16'h40 ? 16'h6465 :  // <0039> de
addr == 16'h41 ? 16'h7461 :  // <0039> ta
addr == 16'h42 ? 16'h2061 :  // <0039>  a
// "   eaddr"
addr == 16'h43 ? 16'h2020 :  // <0039>   
addr == 16'h44 ? 16'h6520 :  // <0039> e 
addr == 16'h45 ? 16'h6461 :  // <0039> da
addr == 16'h46 ? 16'h7264 :  // <0039> rd

// string resources
// :boot_msg // = 0x0047
// "TGT\r\n\x0"
addr == 16'h47 ? 16'h4754 :  // <0043> GT
addr == 16'h48 ? 16'h0d54 :  // <0043>  T
addr == 16'h49 ? 16'h000a :  // <0043>   
// :fail_msg // = 0x004a
// "FAIL TEST \x0"
addr == 16'h4a ? 16'h4146 :  // <0045> AF
addr == 16'h4b ? 16'h4c49 :  // <0045> LI
addr == 16'h4c ? 16'h5420 :  // <0045> T 
addr == 16'h4d ? 16'h5345 :  // <0045> SE
addr == 16'h4e ? 16'h2054 :  // <0045>  T
addr == 16'h4f ? 16'h0000 :  // <0045>   

// libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.

// driver library for synapse316_uart simple async transceiver.






// routine sends out the low byte from a to the UART.  blocks until the FIFO accepts the byte.
// ######## func putchar_fduart // = 0x0050
addr == 16'h50 ? 16'h3004 :  // <0046> push x // func putchar_fduart

addr == 16'h51 ? 16'h1000 :  // <0048> x = a

// wait for FIFO to be available.
addr == 16'h52 ? 16'h0202 :  // <0051> a = $atx_fifo_full_mask
// :pcfduart_wait_for_idle // = 0x0053
addr == 16'h53 ? 16'h040e :  // <0053> b = fduart_status
addr == 16'h54 ? 16'he403 :  // <0054> bn and0z :pcfduart_wait_for_idle
addr == 16'h55 ? 16'h0053 :  // <0054> "

// push word to the UART.  its low byte is a character.
addr == 16'h56 ? 16'h3404 :  // <0057> fduart_data = x
addr == 16'h57 ? 16'h100c :  // <0058> pop x // end_func
addr == 16'h58 ? 16'hfc00 :  // <0057> swapra = nop

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// ######## func getchar_fduart // = 0x0059
// wait until FIFO is populated.
addr == 16'h59 ? 16'h0208 :  // <0064> a = $arx_fifo_empty_mask
// :wait_for_busy // = 0x005a
addr == 16'h5a ? 16'h040e :  // <0066> b = fduart_status
addr == 16'h5b ? 16'he403 :  // <0067> bn and0z :wait_for_busy
addr == 16'h5c ? 16'h005a :  // <0067> "
addr == 16'h5d ? 16'h000d :  // <0068> a = fduart_data
addr == 16'h5e ? 16'hfc00 :  // <0068> swapra = nop

// returns a character in a, or -1 if none.
// ######## func pollchar_fduart // = 0x005f
// check for FIFO is populated.
addr == 16'h5f ? 16'h0208 :  // <0074> a = $arx_fifo_empty_mask
addr == 16'h60 ? 16'h040e :  // <0075> b = fduart_status
addr == 16'h61 ? 16'he403 :  // <0076> bn and0z :none
addr == 16'h62 ? 16'h0065 :  // <0076> "
addr == 16'h63 ? 16'h000d :  // <0077> a = fduart_data
addr == 16'h64 ? 16'hfc00 :  // <0077> swapra = nop
// :none // = 0x0065
addr == 16'h65 ? 16'h0360 :  // <0080> a = -1
addr == 16'h66 ? 16'hfc00 :  // <0080> swapra = nop




// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x0067
// "0123456789abcdef"
addr == 16'h67 ? 16'h3130 :  // <0050> 10
addr == 16'h68 ? 16'h3332 :  // <0050> 32
addr == 16'h69 ? 16'h3534 :  // <0050> 54
addr == 16'h6a ? 16'h3736 :  // <0050> 76
addr == 16'h6b ? 16'h3938 :  // <0050> 98
addr == 16'h6c ? 16'h6261 :  // <0050> ba
addr == 16'h6d ? 16'h6463 :  // <0050> dc
addr == 16'h6e ? 16'h6665 :  // <0050> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// ######## func put4x // = 0x006f
addr == 16'h6f ? 16'h3004 :  // <0054> push x // func put4x
addr == 16'h70 ? 16'h3006 :  // <0054> push ga // "
addr == 16'h71 ? 16'h303e :  // <0054> push rtna // "
addr == 16'h72 ? 16'h13a0 :  // <0055> x = :hexdigits
addr == 16'h73 ? 16'h0067 :  // <0055> "

addr == 16'h74 ? 16'h1800 :  // <0057> ga = a
addr == 16'h75 ? 16'h07a0 :  // <0058> b = 0xF000
addr == 16'h76 ? 16'hf000 :  // <0058> "
addr == 16'h77 ? 16'hc800 :  // <0059> a = and
addr == 16'h78 ? 16'h0330 :  // <0059> "
addr == 16'h79 ? 16'h0353 :  // <0060> a = a>>4
addr == 16'h7a ? 16'h0353 :  // <0061> a = a>>4
addr == 16'h7b ? 16'h0353 :  // <0062> a = a>>4
addr == 16'h7c ? 16'hfba0 :  // <0063> call fetch_byte
addr == 16'h7d ? 16'h0188 :  // <0063> "
addr == 16'h7e ? 16'hfc00 :  // <0063> "
addr == 16'h7f ? 16'hfba0 :  // <0064> putchar a
addr == 16'h80 ? 16'h0050 :  // <0064> "
addr == 16'h81 ? 16'hfc00 :  // <0064> "

addr == 16'h82 ? 16'h0006 :  // <0066> a = ga
addr == 16'h83 ? 16'h07a0 :  // <0067> b = 0x0F00
addr == 16'h84 ? 16'h0f00 :  // <0067> "
addr == 16'h85 ? 16'hc800 :  // <0068> a = and
addr == 16'h86 ? 16'h0330 :  // <0068> "
addr == 16'h87 ? 16'h0353 :  // <0069> a = a>>4
addr == 16'h88 ? 16'h0353 :  // <0070> a = a>>4
addr == 16'h89 ? 16'hfba0 :  // <0071> call fetch_byte
addr == 16'h8a ? 16'h0188 :  // <0071> "
addr == 16'h8b ? 16'hfc00 :  // <0071> "
addr == 16'h8c ? 16'hfba0 :  // <0072> putchar a
addr == 16'h8d ? 16'h0050 :  // <0072> "
addr == 16'h8e ? 16'hfc00 :  // <0072> "

addr == 16'h8f ? 16'h0006 :  // <0074> a = ga
addr == 16'h90 ? 16'h06f0 :  // <0075> b = 0x00F0
addr == 16'h91 ? 16'hc800 :  // <0076> a = and
addr == 16'h92 ? 16'h0330 :  // <0076> "
addr == 16'h93 ? 16'h0353 :  // <0077> a = a>>4
addr == 16'h94 ? 16'hfba0 :  // <0078> call fetch_byte
addr == 16'h95 ? 16'h0188 :  // <0078> "
addr == 16'h96 ? 16'hfc00 :  // <0078> "
addr == 16'h97 ? 16'hfba0 :  // <0079> putchar a
addr == 16'h98 ? 16'h0050 :  // <0079> "
addr == 16'h99 ? 16'hfc00 :  // <0079> "

addr == 16'h9a ? 16'h0006 :  // <0081> a = ga
addr == 16'h9b ? 16'h060f :  // <0082> b = 0x000F
addr == 16'h9c ? 16'hc800 :  // <0083> a = and
addr == 16'h9d ? 16'h0330 :  // <0083> "
addr == 16'h9e ? 16'hfba0 :  // <0084> call fetch_byte
addr == 16'h9f ? 16'h0188 :  // <0084> "
addr == 16'ha0 ? 16'hfc00 :  // <0084> "
addr == 16'ha1 ? 16'hfba0 :  // <0085> putchar a
addr == 16'ha2 ? 16'h0050 :  // <0085> "
addr == 16'ha3 ? 16'hfc00 :  // <0085> "

addr == 16'ha4 ? 16'hf80c :  // <0087> pop rtna // end_func
addr == 16'ha5 ? 16'h180c :  // <0087> pop ga // "
addr == 16'ha6 ? 16'h100c :  // <0087> pop x // "
addr == 16'ha7 ? 16'hfc00 :  // <0086> swapra = nop

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// ######## func get4x // = 0x00a8
addr == 16'ha8 ? 16'h3002 :  // <0091> push i // func get4x
addr == 16'ha9 ? 16'h3003 :  // <0091> push j // "
addr == 16'haa ? 16'h3004 :  // <0091> push x // "
addr == 16'hab ? 16'h3005 :  // <0091> push y // "
addr == 16'hac ? 16'h303e :  // <0091> push rtna // "
// y = digit counter
// j = sum
addr == 16'had ? 16'h1604 :  // <0094> y = 4
// :again // = 0x00ae
addr == 16'hae ? 16'hfba0 :  // <0096> getchar
addr == 16'haf ? 16'h0059 :  // <0096> "
addr == 16'hb0 ? 16'hfc00 :  // <0096> "
addr == 16'hb1 ? 16'h13a0 :  // <0097> x = :hexdigits
addr == 16'hb2 ? 16'h0067 :  // <0097> "
addr == 16'hb3 ? 16'h0a10 :  // <0098> i = 16
addr == 16'hb4 ? 16'hfba0 :  // <0099> call :find_in_fetch
addr == 16'hb5 ? 16'h019c :  // <0099> "
addr == 16'hb6 ? 16'hfc00 :  // <0099> "
addr == 16'hb7 ? 16'h0760 :  // <0100> b = -1
addr == 16'hb8 ? 16'he007 :  // <0101> br eq :fail
addr == 16'hb9 ? 16'h00cd :  // <0101> "
addr == 16'hba ? 16'h0400 :  // <0102> b = a
addr == 16'hbb ? 16'h0003 :  // <0103> a = j
addr == 16'hbc ? 16'h0352 :  // <0104> a = a<<4
addr == 16'hbd ? 16'hc800 :  // <0105> j = or
addr == 16'hbe ? 16'h0f34 :  // <0105> "
addr == 16'hbf ? 16'h1360 :  // <0106> x = -1
addr == 16'hc0 ? 16'hc800 :  // <0107> y = x+y
addr == 16'hc1 ? 16'h1720 :  // <0107> "
addr == 16'hc2 ? 16'h0005 :  // <0108> a = y
addr == 16'hc3 ? 16'he400 :  // <0109> bn az :again
addr == 16'hc4 ? 16'h00ae :  // <0109> "
addr == 16'hc5 ? 16'h0003 :  // <0110> a = j
addr == 16'hc6 ? 16'h0600 :  // <0111> b = 0
addr == 16'hc7 ? 16'hf80c :  // <0112> pop rtna // rtn
addr == 16'hc8 ? 16'h140c :  // <0112> pop y // "
addr == 16'hc9 ? 16'h100c :  // <0112> pop x // "
addr == 16'hca ? 16'h0c0c :  // <0112> pop j // "
addr == 16'hcb ? 16'h080c :  // <0112> pop i // "
addr == 16'hcc ? 16'hfc00 :  // <0111> swapra = nop
// :fail // = 0x00cd
addr == 16'hcd ? 16'h0760 :  // <0114> b = -1
addr == 16'hce ? 16'hf80c :  // <0115> pop rtna // end_func
addr == 16'hcf ? 16'h140c :  // <0115> pop y // "
addr == 16'hd0 ? 16'h100c :  // <0115> pop x // "
addr == 16'hd1 ? 16'h0c0c :  // <0115> pop j // "
addr == 16'hd2 ? 16'h080c :  // <0115> pop i // "
addr == 16'hd3 ? 16'hfc00 :  // <0114> swapra = nop

// print a fixed-length string from packed words in program space.
// pass its word address (not its byte address) in a,  its length (bytes) in b.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_fixed // = 0x00d4
addr == 16'hd4 ? 16'h3002 :  // <0121> push i // func print_fixed
addr == 16'hd5 ? 16'h3003 :  // <0121> push j // "
addr == 16'hd6 ? 16'h3004 :  // <0121> push x // "
addr == 16'hd7 ? 16'h3005 :  // <0121> push y // "
addr == 16'hd8 ? 16'h3006 :  // <0121> push ga // "
addr == 16'hd9 ? 16'h303e :  // <0121> push rtna // "
addr == 16'hda ? 16'h0800 :  // <0122> i = a
addr == 16'hdb ? 16'h0e01 :  // <0123> j = 1
addr == 16'hdc ? 16'h1001 :  // <0124> x = b
addr == 16'hdd ? 16'h1760 :  // <0125> y = -1
// :next_word // = 0x00de
addr == 16'hde ? 16'he002 :  // <0127> br xz :done
addr == 16'hdf ? 16'h00f4 :  // <0127> "
addr == 16'he0 ? 16'h1320 :  // <0128> x = ad2
addr == 16'he1 ? 16'hd002 :  // <0129> fetch ga from i
addr == 16'he2 ? 16'h1bb0 :  // <0129> "
// now x = bytes remaining, i = current word address, ga = data word.
addr == 16'he3 ? 16'h0006 :  // <0131> a = ga // putchar ga
addr == 16'he4 ? 16'hfba0 :  // <0131> putchar ga
addr == 16'he5 ? 16'h0050 :  // <0131> "
addr == 16'he6 ? 16'hfc00 :  // <0131> "
addr == 16'he7 ? 16'he002 :  // <0132> br xz :done
addr == 16'he8 ? 16'h00f4 :  // <0132> "
addr == 16'he9 ? 16'h1320 :  // <0133> x = ad2
addr == 16'hea ? 16'h0006 :  // <0134> a = ga
addr == 16'heb ? 16'h0353 :  // <0135> a = a>>4
addr == 16'hec ? 16'h0353 :  // <0136> a = a>>4
addr == 16'hed ? 16'hfba0 :  // <0137> putchar a
addr == 16'hee ? 16'h0050 :  // <0137> "
addr == 16'hef ? 16'hfc00 :  // <0137> "
addr == 16'hf0 ? 16'hc800 :  // <0138> i = i+j
addr == 16'hf1 ? 16'h0b10 :  // <0138> "
addr == 16'hf2 ? 16'he00f :  // <0139> jmp :next_word
addr == 16'hf3 ? 16'h00de :  // <0139> "
// :done // = 0x00f4
addr == 16'hf4 ? 16'hf80c :  // <0141> pop rtna // end_func
addr == 16'hf5 ? 16'h180c :  // <0141> pop ga // "
addr == 16'hf6 ? 16'h140c :  // <0141> pop y // "
addr == 16'hf7 ? 16'h100c :  // <0141> pop x // "
addr == 16'hf8 ? 16'h0c0c :  // <0141> pop j // "
addr == 16'hf9 ? 16'h080c :  // <0141> pop i // "
addr == 16'hfa ? 16'hfc00 :  // <0140> swapra = nop

// print a null-terminated string from packed words in program space.
// pass its word address (not its byte address) in a.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_nt // = 0x00fb
addr == 16'hfb ? 16'h3002 :  // <0147> push i // func print_nt
addr == 16'hfc ? 16'h3003 :  // <0147> push j // "
addr == 16'hfd ? 16'h3004 :  // <0147> push x // "
addr == 16'hfe ? 16'h303e :  // <0147> push rtna // "
addr == 16'hff ? 16'h0800 :  // <0148> i = a
addr == 16'h100 ? 16'h0e01 :  // <0149> j = 1
// :next_word // = 0x0101
addr == 16'h101 ? 16'hd002 :  // <0151> fetch x from i
addr == 16'h102 ? 16'h13b0 :  // <0151> "
// now i = current word address, x = data word, b = low byte mask, a = data byte.
addr == 16'h103 ? 16'h0004 :  // <0153> a = x
addr == 16'h104 ? 16'h06ff :  // <0154> b = 0xff
addr == 16'h105 ? 16'he003 :  // <0155> br and0z :done
addr == 16'h106 ? 16'h0117 :  // <0155> "
addr == 16'h107 ? 16'hfba0 :  // <0156> putchar a
addr == 16'h108 ? 16'h0050 :  // <0156> "
addr == 16'h109 ? 16'hfc00 :  // <0156> "
addr == 16'h10a ? 16'h0004 :  // <0157> a = x
addr == 16'h10b ? 16'h0353 :  // <0158> a = a>>4
addr == 16'h10c ? 16'h0353 :  // <0159> a = a>>4
addr == 16'h10d ? 16'h06ff :  // <0160> b = 0xff
addr == 16'h10e ? 16'he003 :  // <0161> br and0z :done
addr == 16'h10f ? 16'h0117 :  // <0161> "
addr == 16'h110 ? 16'hfba0 :  // <0162> putchar a
addr == 16'h111 ? 16'h0050 :  // <0162> "
addr == 16'h112 ? 16'hfc00 :  // <0162> "
addr == 16'h113 ? 16'hc800 :  // <0163> i = i+j
addr == 16'h114 ? 16'h0b10 :  // <0163> "
addr == 16'h115 ? 16'he00f :  // <0164> jmp :next_word
addr == 16'h116 ? 16'h0101 :  // <0164> "
// :done // = 0x0117
addr == 16'h117 ? 16'hf80c :  // <0166> pop rtna // end_func
addr == 16'h118 ? 16'h100c :  // <0166> pop x // "
addr == 16'h119 ? 16'h0c0c :  // <0166> pop j // "
addr == 16'h11a ? 16'h080c :  // <0166> pop i // "
addr == 16'h11b ? 16'hfc00 :  // <0165> swapra = nop


// function library for simple integer math.

// ######## func multiply // = 0x011c
addr == 16'h11c ? 16'h3002 :  // <0004> push i // func multiply
addr == 16'h11d ? 16'h3003 :  // <0004> push j // "
addr == 16'h11e ? 16'h3004 :  // <0004> push x // "
addr == 16'h11f ? 16'h3005 :  // <0004> push y // "
// unsigned 16-bit multiplication.  a = a * b.
// it's easy to roll over the 16-bit result by passing operands whose bit widths total more than 16.
// bigger/safer/faster math can be obtained from Altera IP blocks.

// x = operand a
// y = operand b
// i = total
// x is shifted right so its low bit can be tested each time.
// y is shifted left so its value (for summing) increases each time.
addr == 16'h120 ? 16'h1000 :  // <0014> x = a
addr == 16'h121 ? 16'h1401 :  // <0015> y = b
addr == 16'h122 ? 16'h0a00 :  // <0016> i = 0
// :again // = 0x0123
addr == 16'h123 ? 16'he002 :  // <0018> br xz :done
addr == 16'h124 ? 16'h0132 :  // <0018> "
addr == 16'h125 ? 16'h0004 :  // <0019> a = x
addr == 16'h126 ? 16'h0601 :  // <0020> b = 1
addr == 16'h127 ? 16'he003 :  // <0021> br and0z :skip_add
addr == 16'h128 ? 16'h012c :  // <0021> "
addr == 16'h129 ? 16'h0c05 :  // <0022> j = y
addr == 16'h12a ? 16'hc800 :  // <0023> i = i+j
addr == 16'h12b ? 16'h0b10 :  // <0023> "
// :skip_add // = 0x012c
addr == 16'h12c ? 16'h0004 :  // <0025> a = x
addr == 16'h12d ? 16'h1350 :  // <0026> x = a>>1
addr == 16'h12e ? 16'h0005 :  // <0027> a = y
addr == 16'h12f ? 16'h1751 :  // <0028> y = a<<1
addr == 16'h130 ? 16'he00f :  // <0029> jmp :again
addr == 16'h131 ? 16'h0123 :  // <0029> "
// :done // = 0x0132
addr == 16'h132 ? 16'h0002 :  // <0031> a = i
addr == 16'h133 ? 16'h140c :  // <0032> pop y // end_func
addr == 16'h134 ? 16'h100c :  // <0032> pop x // "
addr == 16'h135 ? 16'h0c0c :  // <0032> pop j // "
addr == 16'h136 ? 16'h080c :  // <0032> pop i // "
addr == 16'h137 ? 16'hfc00 :  // <0031> swapra = nop

// ######## func divide // = 0x0138
addr == 16'h138 ? 16'h3002 :  // <0034> push i // func divide
addr == 16'h139 ? 16'h3003 :  // <0034> push j // "
addr == 16'h13a ? 16'h3004 :  // <0034> push x // "
addr == 16'h13b ? 16'h3005 :  // <0034> push y // "
addr == 16'h13c ? 16'h3006 :  // <0034> push g6 // "
addr == 16'h13d ? 16'h3007 :  // <0034> push g7 // "
// unsigned 15-bit division.  b = a / b.  return remainder in a.
// division by zero results in zero.
// THE HIGH BIT OF A MUST BE 0!!  ALSO THE HIGH BIT OF B MUST BE 0!!
// 1 in the high bit of either operand results in infinite loop or wrong results.
// bigger/safer/faster math can be obtained from Altera IP blocks.

// degenerate cases.
addr == 16'h13e ? 16'he005 :  // <0042> br lt :zero
addr == 16'h13f ? 16'h0179 :  // <0042> "
addr == 16'h140 ? 16'he000 :  // <0043> br az :zero
addr == 16'h141 ? 16'h0179 :  // <0043> "
addr == 16'h142 ? 16'h1000 :  // <0044> x = a
//    g7 = x
addr == 16'h143 ? 16'h0001 :  // <0046> a = b
addr == 16'h144 ? 16'he000 :  // <0047> br az :zero
addr == 16'h145 ? 16'h0179 :  // <0047> "
// now operands are x / a.  also another copy of x in g7.

// // test for special case where high bit of dividend is 1.
// y = 0
// i = a
// a = x
// b = 0x8000
// br and0z :msb_zero
// y = 1
// x = a>>1
// :msb_zero
// a = i
// // when msb was 1, then y = 1 and dividend x is shifted right 1.

// shift "temp" divisor g6 left until it exceeds dividend, then right 1.
addr == 16'h146 ? 16'h0404 :  // <0063> b = x
addr == 16'h147 ? 16'h0a00 :  // <0064> i = 0
addr == 16'h148 ? 16'h0e01 :  // <0065> j = 1
// :shift_again // = 0x0149
addr == 16'h149 ? 16'he006 :  // <0067> br gt :shift_done
addr == 16'h14a ? 16'h014f :  // <0067> "
addr == 16'h14b ? 16'h0351 :  // <0068> a = a<<1
addr == 16'h14c ? 16'h0b10 :  // <0069> i = ad1
addr == 16'h14d ? 16'he00f :  // <0070> jmp :shift_again
addr == 16'h14e ? 16'h0149 :  // <0070> "
// :shift_done // = 0x014f
addr == 16'h14f ? 16'h1b50 :  // <0072> g6 = a>>1
// now operands are x / g6.  i = number of passes of long division required.
// notice i was not decremented here, so it has 1 more in it than the number of shifts required for digit parity.
// that's exactly what it needs for correctness.

// // compensate for special case where msb was 1.  then 1 more division pass is needed.
// j = y
// i = i+j
// x = g7

// long division.  g7 = quotient.
addr == 16'h150 ? 16'h1e00 :  // <0083> g7 = 0
addr == 16'h151 ? 16'h0f60 :  // <0084> j = -1
// :again // = 0x0152
addr == 16'h152 ? 16'he001 :  // <0086> br iz :done
addr == 16'h153 ? 16'h0170 :  // <0086> "
addr == 16'h154 ? 16'h0006 :  // <0087> a = g6
addr == 16'h155 ? 16'h0404 :  // <0088> b = x
addr == 16'h156 ? 16'he006 :  // <0089> br gt :result0
addr == 16'h157 ? 16'h0168 :  // <0089> "
// temp does fit; output a 1.
addr == 16'h158 ? 16'h0007 :  // <0091> a = g7
addr == 16'h159 ? 16'h0351 :  // <0092> a = a<<1
addr == 16'h15a ? 16'h0601 :  // <0093> b = 1
addr == 16'h15b ? 16'hc800 :  // <0094> g7 = or
addr == 16'h15c ? 16'h1f34 :  // <0094> "
// dividend = dividend - temp
addr == 16'h15d ? 16'h0006 :  // <0096> a = g6
addr == 16'h15e ? 16'h0760 :  // <0097> b = -1
addr == 16'h15f ? 16'hc800 :  // <0098> a = xor
addr == 16'h160 ? 16'h0338 :  // <0098> "
addr == 16'h161 ? 16'h0601 :  // <0099> b = 1
addr == 16'h162 ? 16'hc800 :  // <0100> y = a+b
addr == 16'h163 ? 16'h1700 :  // <0100> "
addr == 16'h164 ? 16'hc800 :  // <0101> x = x+y
addr == 16'h165 ? 16'h1320 :  // <0101> "
addr == 16'h166 ? 16'he00f :  // <0102> jmp :next
addr == 16'h167 ? 16'h016a :  // <0102> "
// :result0 // = 0x0168
// temp does not fit; output a 0.
addr == 16'h168 ? 16'h0007 :  // <0105> a = g7
addr == 16'h169 ? 16'h1f51 :  // <0106> g7 = a<<1
// no change to dividend.
// :next // = 0x016a
addr == 16'h16a ? 16'h0006 :  // <0109> a = g6
addr == 16'h16b ? 16'h1b50 :  // <0110> g6 = a>>1
addr == 16'h16c ? 16'hc800 :  // <0111> i = i+j
addr == 16'h16d ? 16'h0b10 :  // <0111> "
addr == 16'h16e ? 16'he00f :  // <0112> jmp :again
addr == 16'h16f ? 16'h0152 :  // <0112> "

// :done // = 0x0170
addr == 16'h170 ? 16'h0407 :  // <0115> b = g7
addr == 16'h171 ? 16'h0004 :  // <0116> a = x
addr == 16'h172 ? 16'h1c0c :  // <0117> pop g7 // rtn
addr == 16'h173 ? 16'h180c :  // <0117> pop g6 // "
addr == 16'h174 ? 16'h140c :  // <0117> pop y // "
addr == 16'h175 ? 16'h100c :  // <0117> pop x // "
addr == 16'h176 ? 16'h0c0c :  // <0117> pop j // "
addr == 16'h177 ? 16'h080c :  // <0117> pop i // "
addr == 16'h178 ? 16'hfc00 :  // <0116> swapra = nop

// :zero // = 0x0179
addr == 16'h179 ? 16'h0600 :  // <0120> b = 0
addr == 16'h17a ? 16'h1c0c :  // <0121> pop g7 // rtn
addr == 16'h17b ? 16'h180c :  // <0121> pop g6 // "
addr == 16'h17c ? 16'h140c :  // <0121> pop y // "
addr == 16'h17d ? 16'h100c :  // <0121> pop x // "
addr == 16'h17e ? 16'h0c0c :  // <0121> pop j // "
addr == 16'h17f ? 16'h080c :  // <0121> pop i // "
addr == 16'h180 ? 16'hfc00 :  // <0120> swapra = nop
addr == 16'h181 ? 16'h1c0c :  // <0122> pop g7 // end_func
addr == 16'h182 ? 16'h180c :  // <0122> pop g6 // "
addr == 16'h183 ? 16'h140c :  // <0122> pop y // "
addr == 16'h184 ? 16'h100c :  // <0122> pop x // "
addr == 16'h185 ? 16'h0c0c :  // <0122> pop j // "
addr == 16'h186 ? 16'h080c :  // <0122> pop i // "
addr == 16'h187 ? 16'hfc00 :  // <0121> swapra = nop


//func multiply32 {arg_a in pa} {arg_b in pb} {product_lo out pa} {product_hi out pb} {
//// unsigned 16-bit multiplication with 32-bit product.

//// ga = product_lo
//// gb = product_hi
//// pa is shifted right so its low bit can be tested each time.
//// pb is shifted left so its value (for summing) increases each time.
//FAIL:  because pb is shifting, it will be destroyed in cases where total bits > 16.
//despite supporting carry overflow, the algorithm still assumes total bits <= 16.
//also i think the loop order is backward for correctly shifting into the hi word.
//could fix that by reversing the hi word shift.
//ga = 0
//gb = 0
//:again
//br xz :done
//a = arg_a
//b = 1
//br and0z :skip_add
//a = ga
//b = arg_b
//ga = a+b
//br ad0c :carry
//a = gb
//gb = a<<1
//jmp :carry_done
//:carry
//a = gb
//a = a<<1
//b = 1
//gb = a+b
//:carry_done
//:skip_add
//a = arg_a
//arg_a = a>>1
//a = arg_b
//arg_b = a<<1
//jmp :again
//:done
//product_lo = ga
//product_hi = gb
//end_func


// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// ######## func fetch_byte // = 0x0188
addr == 16'h188 ? 16'h0601 :  // <0005> b = 1
addr == 16'h189 ? 16'he003 :  // <0006> br and0z :pick_byte_even
addr == 16'h18a ? 16'h0193 :  // <0006> "
addr == 16'h18b ? 16'h0350 :  // <0007> a = a>>1
addr == 16'h18c ? 16'h0404 :  // <0008> b = x
addr == 16'h18d ? 16'hc800 :  // <0009> fetch a from a+b
addr == 16'h18e ? 16'hd300 :  // <0009> "
addr == 16'h18f ? 16'h03b0 :  // <0009> "
addr == 16'h190 ? 16'h0353 :  // <0010> a = a>>4
addr == 16'h191 ? 16'h0353 :  // <0011> a = a>>4
addr == 16'h192 ? 16'hfc00 :  // <0011> swapra = nop
// :pick_byte_even // = 0x0193
addr == 16'h193 ? 16'h0350 :  // <0014> a = a>>1
addr == 16'h194 ? 16'h0404 :  // <0015> b = x
addr == 16'h195 ? 16'hc800 :  // <0016> fetch a from a+b
addr == 16'h196 ? 16'hd300 :  // <0016> "
addr == 16'h197 ? 16'h03b0 :  // <0016> "
addr == 16'h198 ? 16'h06ff :  // <0017> b = 0xff
addr == 16'h199 ? 16'hc800 :  // <0018> a = and
addr == 16'h19a ? 16'h0330 :  // <0018> "
addr == 16'h19b ? 16'hfc00 :  // <0018> swapra = nop

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// ######## func find_in_fetch // = 0x019c
addr == 16'h19c ? 16'h3002 :  // <0027> push i // func find_in_fetch
addr == 16'h19d ? 16'h3003 :  // <0027> push j // "
addr == 16'h19e ? 16'h3005 :  // <0027> push y // "
addr == 16'h19f ? 16'h303e :  // <0027> push rtna // "
addr == 16'h1a0 ? 16'h1400 :  // <0028> y = a
addr == 16'h1a1 ? 16'h0f60 :  // <0029> j = -1
// :again // = 0x01a2
addr == 16'h1a2 ? 16'he001 :  // <0031> br iz :fail
addr == 16'h1a3 ? 16'h01b2 :  // <0031> "
addr == 16'h1a4 ? 16'h0b10 :  // <0032> i = ad1
addr == 16'h1a5 ? 16'h0002 :  // <0033> a = i
addr == 16'h1a6 ? 16'hfba0 :  // <0034> call :fetch_byte
addr == 16'h1a7 ? 16'h0188 :  // <0034> "
addr == 16'h1a8 ? 16'hfc00 :  // <0034> "
addr == 16'h1a9 ? 16'h0405 :  // <0035> b = y
addr == 16'h1aa ? 16'he407 :  // <0036> bn eq :again
addr == 16'h1ab ? 16'h01a2 :  // <0036> "
// :found // = 0x01ac
addr == 16'h1ac ? 16'h0002 :  // <0038> a = i
addr == 16'h1ad ? 16'hf80c :  // <0039> pop rtna // rtn
addr == 16'h1ae ? 16'h140c :  // <0039> pop y // "
addr == 16'h1af ? 16'h0c0c :  // <0039> pop j // "
addr == 16'h1b0 ? 16'h080c :  // <0039> pop i // "
addr == 16'h1b1 ? 16'hfc00 :  // <0038> swapra = nop
// :fail // = 0x01b2
addr == 16'h1b2 ? 16'h0360 :  // <0041> a = -1
addr == 16'h1b3 ? 16'hf80c :  // <0042> pop rtna // end_func
addr == 16'h1b4 ? 16'h140c :  // <0042> pop y // "
addr == 16'h1b5 ? 16'h0c0c :  // <0042> pop j // "
addr == 16'h1b6 ? 16'h080c :  // <0042> pop i // "
addr == 16'h1b7 ? 16'hfc00 :  // <0041> swapra = nop


// routine waits a number of milliseconds given in a.
// ######## func spinwait // = 0x01b8
addr == 16'h1b8 ? 16'h3004 :  // <0002> push x // func spinwait
addr == 16'h1b9 ? 16'h3005 :  // <0002> push y // "
//patch
//rtn
addr == 16'h1ba ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x01bb
addr == 16'h1bb ? 16'h13a0 :  // <0007> x = 16666
addr == 16'h1bc ? 16'h411a :  // <0007> "
addr == 16'h1bd ? 16'h1760 :  // <0008> y = -1
addr == 16'h1be ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x01bf
// use of the ad2 name overrides auto-nop here.
addr == 16'h1bf ? 16'h1320 :  // <0012> x = ad2
addr == 16'h1c0 ? 16'he402 :  // <0013> bn xz :spinwait_inner
addr == 16'h1c1 ? 16'h01bf :  // <0013> "
addr == 16'h1c2 ? 16'hc800 :  // <0014> a = a+b
addr == 16'h1c3 ? 16'h0300 :  // <0014> "
addr == 16'h1c4 ? 16'he400 :  // <0015> bn az :spinwait_outer
addr == 16'h1c5 ? 16'h01bb :  // <0015> "
addr == 16'h1c6 ? 16'h140c :  // <0016> pop y // end_func
addr == 16'h1c7 ? 16'h100c :  // <0016> pop x // "
addr == 16'h1c8 ? 16'hfc00 :  // <0015> swapra = nop




// ######## func fletcher16_init // = 0x01c9

addr == 16'h1c9 ? 16'h2a00 :  // <0005> $fletcher_sum1_reg = 0
addr == 16'h1ca ? 16'h2e00 :  // <0006> $fletcher_sum2_reg = 0

addr == 16'h1cb ? 16'hfc00 :  // <0008> swapra = nop

// return the modulus(255) of a given number.
// ######## func mod255 // = 0x01cc

// while a is greater than 254, subtract 255.
// :mod255_again // = 0x01cc
addr == 16'h1cc ? 16'h06fe :  // <0013> b = 0xfe
addr == 16'h1cd ? 16'he006 :  // <0014> br gt :mod255_greater
addr == 16'h1ce ? 16'h01d0 :  // <0014> "
addr == 16'h1cf ? 16'hfc00 :  // <0014> swapra = nop
// :mod255_greater // = 0x01d0
addr == 16'h1d0 ? 16'h07a0 :  // <0017> b = ([negate 0xfe])
addr == 16'h1d1 ? 16'hff02 :  // <0017> "
addr == 16'h1d2 ? 16'hc800 :  // <0018> a = a+b
addr == 16'h1d3 ? 16'h0300 :  // <0018> "
addr == 16'h1d4 ? 16'he00f :  // <0019> jmp :mod255_again
addr == 16'h1d5 ? 16'h01cc :  // <0019> "

addr == 16'h1d6 ? 16'hfc00 :  // <0021> swapra = nop

// accumulate a Fletcher16 checksum, given the next byte of data.
// ######## func fletcher16_input8 // = 0x01d7
addr == 16'h1d7 ? 16'h303e :  // <0030> push rtna // func fletcher16_input8

addr == 16'h1d8 ? 16'h040a :  // <0024> b = $fletcher_sum1_reg
addr == 16'h1d9 ? 16'hc800 :  // <0025> a = a+b
addr == 16'h1da ? 16'h0300 :  // <0025> "
addr == 16'h1db ? 16'hfba0 :  // <0025> callx mod255  a+b  $fletcher_sum1_reg
addr == 16'h1dc ? 16'h01cc :  // <0025> "
addr == 16'h1dd ? 16'hfc00 :  // <0025> "
addr == 16'h1de ? 16'h2800 :  // <0025> pc = a

addr == 16'h1df ? 16'h000a :  // <0027> a = $fletcher_sum1_reg
addr == 16'h1e0 ? 16'h040b :  // <0028> b = $fletcher_sum2_reg
addr == 16'h1e1 ? 16'hc800 :  // <0029> a = a+b
addr == 16'h1e2 ? 16'h0300 :  // <0029> "
addr == 16'h1e3 ? 16'hfba0 :  // <0029> callx mod255  a+b  $fletcher_sum2_reg
addr == 16'h1e4 ? 16'h01cc :  // <0029> "
addr == 16'h1e5 ? 16'hfc00 :  // <0029> "
addr == 16'h1e6 ? 16'h2c00 :  // <0029> pd = a

addr == 16'h1e7 ? 16'hf80c :  // <0031> pop rtna // func fletcher16_input8
addr == 16'h1e8 ? 16'hfc00 :  // <0031> swapra = nop

// accumulate a Fletcher16 checksum, given the next word of data.
// ######## func fletcher16_input16 // = 0x01e9
addr == 16'h1e9 ? 16'h3002 :  // <0039> push i // func fletcher16_input16
addr == 16'h1ea ? 16'h303e :  // <0039> push rtna // "

addr == 16'h1eb ? 16'h0b53 :  // <0034> i = a>>4
addr == 16'h1ec ? 16'h06ff :  // <0035> b = 0xff
addr == 16'h1ed ? 16'hc800 :  // <0036> a = and
addr == 16'h1ee ? 16'h0330 :  // <0036> "
addr == 16'h1ef ? 16'hfba0 :  // <0036> callx fletcher16_input8  and
addr == 16'h1f0 ? 16'h01d7 :  // <0036> "
addr == 16'h1f1 ? 16'hfc00 :  // <0036> "
addr == 16'h1f2 ? 16'h0002 :  // <0037> a = i
addr == 16'h1f3 ? 16'h0353 :  // <0038> a = a>>4
addr == 16'h1f4 ? 16'hfba0 :  // <0038> callx fletcher16_input8  a>>4
addr == 16'h1f5 ? 16'h01d7 :  // <0038> "
addr == 16'h1f6 ? 16'hfc00 :  // <0038> "

addr == 16'h1f7 ? 16'hf80c :  // <0040> pop rtna // func fletcher16_input16
addr == 16'h1f8 ? 16'h080c :  // <0040> pop i // "
addr == 16'h1f9 ? 16'hfc00 :  // <0040> swapra = nop

// return the combined 16-bit result of Fletcher16 checksum.
// ######## func fletcher16_result // = 0x01fa

addr == 16'h1fa ? 16'h000b :  // <0043> a = $fletcher_sum2_reg
addr == 16'h1fb ? 16'h0352 :  // <0044> a = a<<4
addr == 16'h1fc ? 16'h0352 :  // <0045> a = a<<4
addr == 16'h1fd ? 16'h040a :  // <0046> b = $fletcher_sum1_reg
addr == 16'h1fe ? 16'hc800 :  // <0047> result = or
addr == 16'h1ff ? 16'h0334 :  // <0047> "
addr == 16'h200 ? 16'hfc00 :  // <0046> swapra = nop

addr == 16'h201 ? 16'hfc00 :  // <0049> swapra = nop




// #########################################################################
// :main // = 0x0202

addr == 16'h202 ? 16'h03a0 :  // <0105> a = :boot_msg
addr == 16'h203 ? 16'h0047 :  // <0105> "
addr == 16'h204 ? 16'hfba0 :  // <0106> call print_nt
addr == 16'h205 ? 16'h00fb :  // <0106> "
addr == 16'h206 ? 16'hfc00 :  // <0106> "

// :begin_test // = 0x0207

// clear out contents
addr == 16'h207 ? 16'h4200 :  // <0111> ewrite 0 0
addr == 16'h208 ? 16'hc800 :  // <0111> "
addr == 16'h209 ? 16'h3e00 :  // <0111> "
addr == 16'h20a ? 16'h4201 :  // <0112> ewrite 1 0
addr == 16'h20b ? 16'hc800 :  // <0112> "
addr == 16'h20c ? 16'h3e00 :  // <0112> "
addr == 16'h20d ? 16'h4202 :  // <0113> ewrite 2 0
addr == 16'h20e ? 16'hc800 :  // <0113> "
addr == 16'h20f ? 16'h3e00 :  // <0113> "
addr == 16'h210 ? 16'h4203 :  // <0114> ewrite 3 0
addr == 16'h211 ? 16'hc800 :  // <0114> "
addr == 16'h212 ? 16'h3e00 :  // <0114> "
// etest  0 0 0x00
// etest  0 0 0x00

addr == 16'h213 ? 16'h0200 :  // <0115> a = 0
addr == 16'h214 ? 16'hfba0 :  // <0115> call put4x
addr == 16'h215 ? 16'h006f :  // <0115> "
addr == 16'h216 ? 16'hfc00 :  // <0115> "
addr == 16'h217 ? 16'h023a :  // <0115> a = 58 // putasc :
addr == 16'h218 ? 16'hfba0 :  // <0115> putasc :
addr == 16'h219 ? 16'h0050 :  // <0115> "
addr == 16'h21a ? 16'hfc00 :  // <0115> "
addr == 16'h21b ? 16'h0220 :  // <0115> a = 32 // putasc { }
addr == 16'h21c ? 16'hfba0 :  // <0115> putasc { }
addr == 16'h21d ? 16'h0050 :  // <0115> "
addr == 16'h21e ? 16'hfc00 :  // <0115> "
addr == 16'h21f ? 16'h4200 :  // <0115> eread 0 ga
addr == 16'h220 ? 16'h180f :  // <0115> "
addr == 16'h221 ? 16'hc800 :  // <0115> "
addr == 16'h222 ? 16'h180f :  // <0115> "
addr == 16'h223 ? 16'h0006 :  // <0115> a = ga
addr == 16'h224 ? 16'hfba0 :  // <0115> call put4x
addr == 16'h225 ? 16'h006f :  // <0115> "
addr == 16'h226 ? 16'hfc00 :  // <0115> "
addr == 16'h227 ? 16'h020d :  // <0115> a = 13 // puteol
addr == 16'h228 ? 16'hfba0 :  // <0115> puteol
addr == 16'h229 ? 16'h0050 :  // <0115> "
addr == 16'h22a ? 16'hfc00 :  // <0115> "
addr == 16'h22b ? 16'h020a :  // <0115> a = 10 // puteol
addr == 16'h22c ? 16'hfba0 :  // <0115> puteol
addr == 16'h22d ? 16'h0050 :  // <0115> "
addr == 16'h22e ? 16'hfc00 :  // <0115> "



addr == 16'h22f ? 16'h0006 :  // <0115> a = ga
addr == 16'h230 ? 16'h0600 :  // <0115> b = 0

addr == 16'h231 ? 16'he007 :  // <0113> br eq :else_561
addr == 16'h232 ? 16'h0237 :  // <0113> "

addr == 16'h233 ? 16'h2200 :  // <0114> pa = 0x00
addr == 16'h234 ? 16'hfba0 :  // <0114> callx fail 0x00
addr == 16'h235 ? 16'h0489 :  // <0114> "
addr == 16'h236 ? 16'hfc00 :  // <0114> "


// etest  1 0 0x01
// etest  1 0 0x01

addr == 16'h237 ? 16'h0201 :  // <0116> a = 1
addr == 16'h238 ? 16'hfba0 :  // <0116> call put4x
addr == 16'h239 ? 16'h006f :  // <0116> "
addr == 16'h23a ? 16'hfc00 :  // <0116> "
addr == 16'h23b ? 16'h023a :  // <0116> a = 58 // putasc :
addr == 16'h23c ? 16'hfba0 :  // <0116> putasc :
addr == 16'h23d ? 16'h0050 :  // <0116> "
addr == 16'h23e ? 16'hfc00 :  // <0116> "
addr == 16'h23f ? 16'h0220 :  // <0116> a = 32 // putasc { }
addr == 16'h240 ? 16'hfba0 :  // <0116> putasc { }
addr == 16'h241 ? 16'h0050 :  // <0116> "
addr == 16'h242 ? 16'hfc00 :  // <0116> "
addr == 16'h243 ? 16'h4201 :  // <0116> eread 1 ga
addr == 16'h244 ? 16'h180f :  // <0116> "
addr == 16'h245 ? 16'hc800 :  // <0116> "
addr == 16'h246 ? 16'h180f :  // <0116> "
addr == 16'h247 ? 16'h0006 :  // <0116> a = ga
addr == 16'h248 ? 16'hfba0 :  // <0116> call put4x
addr == 16'h249 ? 16'h006f :  // <0116> "
addr == 16'h24a ? 16'hfc00 :  // <0116> "
addr == 16'h24b ? 16'h020d :  // <0116> a = 13 // puteol
addr == 16'h24c ? 16'hfba0 :  // <0116> puteol
addr == 16'h24d ? 16'h0050 :  // <0116> "
addr == 16'h24e ? 16'hfc00 :  // <0116> "
addr == 16'h24f ? 16'h020a :  // <0116> a = 10 // puteol
addr == 16'h250 ? 16'hfba0 :  // <0116> puteol
addr == 16'h251 ? 16'h0050 :  // <0116> "
addr == 16'h252 ? 16'hfc00 :  // <0116> "



addr == 16'h253 ? 16'h0006 :  // <0116> a = ga
addr == 16'h254 ? 16'h0600 :  // <0116> b = 0

addr == 16'h255 ? 16'he007 :  // <0114> br eq :else_597
addr == 16'h256 ? 16'h025b :  // <0114> "

addr == 16'h257 ? 16'h2201 :  // <0115> pa = 0x01
addr == 16'h258 ? 16'hfba0 :  // <0115> callx fail 0x01
addr == 16'h259 ? 16'h0489 :  // <0115> "
addr == 16'h25a ? 16'hfc00 :  // <0115> "


// etest  2 0 0x02
// etest  2 0 0x02

addr == 16'h25b ? 16'h0202 :  // <0117> a = 2
addr == 16'h25c ? 16'hfba0 :  // <0117> call put4x
addr == 16'h25d ? 16'h006f :  // <0117> "
addr == 16'h25e ? 16'hfc00 :  // <0117> "
addr == 16'h25f ? 16'h023a :  // <0117> a = 58 // putasc :
addr == 16'h260 ? 16'hfba0 :  // <0117> putasc :
addr == 16'h261 ? 16'h0050 :  // <0117> "
addr == 16'h262 ? 16'hfc00 :  // <0117> "
addr == 16'h263 ? 16'h0220 :  // <0117> a = 32 // putasc { }
addr == 16'h264 ? 16'hfba0 :  // <0117> putasc { }
addr == 16'h265 ? 16'h0050 :  // <0117> "
addr == 16'h266 ? 16'hfc00 :  // <0117> "
addr == 16'h267 ? 16'h4202 :  // <0117> eread 2 ga
addr == 16'h268 ? 16'h180f :  // <0117> "
addr == 16'h269 ? 16'hc800 :  // <0117> "
addr == 16'h26a ? 16'h180f :  // <0117> "
addr == 16'h26b ? 16'h0006 :  // <0117> a = ga
addr == 16'h26c ? 16'hfba0 :  // <0117> call put4x
addr == 16'h26d ? 16'h006f :  // <0117> "
addr == 16'h26e ? 16'hfc00 :  // <0117> "
addr == 16'h26f ? 16'h020d :  // <0117> a = 13 // puteol
addr == 16'h270 ? 16'hfba0 :  // <0117> puteol
addr == 16'h271 ? 16'h0050 :  // <0117> "
addr == 16'h272 ? 16'hfc00 :  // <0117> "
addr == 16'h273 ? 16'h020a :  // <0117> a = 10 // puteol
addr == 16'h274 ? 16'hfba0 :  // <0117> puteol
addr == 16'h275 ? 16'h0050 :  // <0117> "
addr == 16'h276 ? 16'hfc00 :  // <0117> "



addr == 16'h277 ? 16'h0006 :  // <0117> a = ga
addr == 16'h278 ? 16'h0600 :  // <0117> b = 0

addr == 16'h279 ? 16'he007 :  // <0115> br eq :else_633
addr == 16'h27a ? 16'h027f :  // <0115> "

addr == 16'h27b ? 16'h2202 :  // <0116> pa = 0x02
addr == 16'h27c ? 16'hfba0 :  // <0116> callx fail 0x02
addr == 16'h27d ? 16'h0489 :  // <0116> "
addr == 16'h27e ? 16'hfc00 :  // <0116> "


// etest  3 0 0x03
// etest  3 0 0x03

addr == 16'h27f ? 16'h0203 :  // <0118> a = 3
addr == 16'h280 ? 16'hfba0 :  // <0118> call put4x
addr == 16'h281 ? 16'h006f :  // <0118> "
addr == 16'h282 ? 16'hfc00 :  // <0118> "
addr == 16'h283 ? 16'h023a :  // <0118> a = 58 // putasc :
addr == 16'h284 ? 16'hfba0 :  // <0118> putasc :
addr == 16'h285 ? 16'h0050 :  // <0118> "
addr == 16'h286 ? 16'hfc00 :  // <0118> "
addr == 16'h287 ? 16'h0220 :  // <0118> a = 32 // putasc { }
addr == 16'h288 ? 16'hfba0 :  // <0118> putasc { }
addr == 16'h289 ? 16'h0050 :  // <0118> "
addr == 16'h28a ? 16'hfc00 :  // <0118> "
addr == 16'h28b ? 16'h4203 :  // <0118> eread 3 ga
addr == 16'h28c ? 16'h180f :  // <0118> "
addr == 16'h28d ? 16'hc800 :  // <0118> "
addr == 16'h28e ? 16'h180f :  // <0118> "
addr == 16'h28f ? 16'h0006 :  // <0118> a = ga
addr == 16'h290 ? 16'hfba0 :  // <0118> call put4x
addr == 16'h291 ? 16'h006f :  // <0118> "
addr == 16'h292 ? 16'hfc00 :  // <0118> "
addr == 16'h293 ? 16'h020d :  // <0118> a = 13 // puteol
addr == 16'h294 ? 16'hfba0 :  // <0118> puteol
addr == 16'h295 ? 16'h0050 :  // <0118> "
addr == 16'h296 ? 16'hfc00 :  // <0118> "
addr == 16'h297 ? 16'h020a :  // <0118> a = 10 // puteol
addr == 16'h298 ? 16'hfba0 :  // <0118> puteol
addr == 16'h299 ? 16'h0050 :  // <0118> "
addr == 16'h29a ? 16'hfc00 :  // <0118> "



addr == 16'h29b ? 16'h0006 :  // <0118> a = ga
addr == 16'h29c ? 16'h0600 :  // <0118> b = 0

addr == 16'h29d ? 16'he007 :  // <0116> br eq :else_669
addr == 16'h29e ? 16'h02a3 :  // <0116> "

addr == 16'h29f ? 16'h2203 :  // <0117> pa = 0x03
addr == 16'h2a0 ? 16'hfba0 :  // <0117> callx fail 0x03
addr == 16'h2a1 ? 16'h0489 :  // <0117> "
addr == 16'h2a2 ? 16'hfc00 :  // <0117> "



// test for sufficient wait states on read.
addr == 16'h2a3 ? 16'h4201 :  // <0121> ewrite 1 0x18
addr == 16'h2a4 ? 16'hc800 :  // <0121> "
addr == 16'h2a5 ? 16'h3e18 :  // <0121> "
addr == 16'h2a6 ? 16'h4201 :  // <0122> eread 1 ga
addr == 16'h2a7 ? 16'h180f :  // <0122> "
addr == 16'h2a8 ? 16'hc800 :  // <0122> "
addr == 16'h2a9 ? 16'h180f :  // <0122> "
// another read after some cycles have elapsed.
addr == 16'h2aa ? 16'h4201 :  // <0124> eread 1 gb
addr == 16'h2ab ? 16'h1c0f :  // <0124> "
addr == 16'h2ac ? 16'hc800 :  // <0124> "
addr == 16'h2ad ? 16'h1c0f :  // <0124> "
addr == 16'h2ae ? 16'h0006 :  // <0125> a = ga
addr == 16'h2af ? 16'hfba0 :  // <0126> call put4x
addr == 16'h2b0 ? 16'h006f :  // <0126> "
addr == 16'h2b1 ? 16'hfc00 :  // <0126> "
addr == 16'h2b2 ? 16'h020d :  // <0127> a = 13 // puteol
addr == 16'h2b3 ? 16'hfba0 :  // <0127> puteol
addr == 16'h2b4 ? 16'h0050 :  // <0127> "
addr == 16'h2b5 ? 16'hfc00 :  // <0127> "
addr == 16'h2b6 ? 16'h020a :  // <0127> a = 10 // puteol
addr == 16'h2b7 ? 16'hfba0 :  // <0127> puteol
addr == 16'h2b8 ? 16'h0050 :  // <0127> "
addr == 16'h2b9 ? 16'hfc00 :  // <0127> "
addr == 16'h2ba ? 16'h0007 :  // <0128> a = gb
addr == 16'h2bb ? 16'hfba0 :  // <0129> call put4x
addr == 16'h2bc ? 16'h006f :  // <0129> "
addr == 16'h2bd ? 16'hfc00 :  // <0129> "
addr == 16'h2be ? 16'h020d :  // <0130> a = 13 // puteol
addr == 16'h2bf ? 16'hfba0 :  // <0130> puteol
addr == 16'h2c0 ? 16'h0050 :  // <0130> "
addr == 16'h2c1 ? 16'hfc00 :  // <0130> "
addr == 16'h2c2 ? 16'h020a :  // <0130> a = 10 // puteol
addr == 16'h2c3 ? 16'hfba0 :  // <0130> puteol
addr == 16'h2c4 ? 16'h0050 :  // <0130> "
addr == 16'h2c5 ? 16'hfc00 :  // <0130> "

addr == 16'h2c6 ? 16'h0006 :  // <0133> a = ga
addr == 16'h2c7 ? 16'h0407 :  // <0133> b = gb

addr == 16'h2c8 ? 16'he007 :  // <0131> br eq :else_712
addr == 16'h2c9 ? 16'h02ce :  // <0131> "

addr == 16'h2ca ? 16'h220f :  // <0132> pa = 0x0f
addr == 16'h2cb ? 16'hfba0 :  // <0132> callx fail 0x0f
addr == 16'h2cc ? 16'h0489 :  // <0132> "
addr == 16'h2cd ? 16'hfc00 :  // <0132> "


// basic function test.
// consecutive writes, different addresses.
// consecutive reads, different addresses.
addr == 16'h2ce ? 16'h4200 :  // <0138> ewrite 0 0x40
addr == 16'h2cf ? 16'hc800 :  // <0138> "
addr == 16'h2d0 ? 16'h3e40 :  // <0138> "
addr == 16'h2d1 ? 16'h4201 :  // <0139> ewrite 1 0x41
addr == 16'h2d2 ? 16'hc800 :  // <0139> "
addr == 16'h2d3 ? 16'h3e41 :  // <0139> "
addr == 16'h2d4 ? 16'h4202 :  // <0140> ewrite 2 0x42
addr == 16'h2d5 ? 16'hc800 :  // <0140> "
addr == 16'h2d6 ? 16'h3e42 :  // <0140> "
addr == 16'h2d7 ? 16'h4203 :  // <0141> ewrite 3 0x43
addr == 16'h2d8 ? 16'hc800 :  // <0141> "
addr == 16'h2d9 ? 16'h3e43 :  // <0141> "
// etest  0 0x40 0x10
// etest  0 0x40 0x10

addr == 16'h2da ? 16'h0200 :  // <0142> a = 0
addr == 16'h2db ? 16'hfba0 :  // <0142> call put4x
addr == 16'h2dc ? 16'h006f :  // <0142> "
addr == 16'h2dd ? 16'hfc00 :  // <0142> "
addr == 16'h2de ? 16'h023a :  // <0142> a = 58 // putasc :
addr == 16'h2df ? 16'hfba0 :  // <0142> putasc :
addr == 16'h2e0 ? 16'h0050 :  // <0142> "
addr == 16'h2e1 ? 16'hfc00 :  // <0142> "
addr == 16'h2e2 ? 16'h0220 :  // <0142> a = 32 // putasc { }
addr == 16'h2e3 ? 16'hfba0 :  // <0142> putasc { }
addr == 16'h2e4 ? 16'h0050 :  // <0142> "
addr == 16'h2e5 ? 16'hfc00 :  // <0142> "
addr == 16'h2e6 ? 16'h4200 :  // <0142> eread 0 ga
addr == 16'h2e7 ? 16'h180f :  // <0142> "
addr == 16'h2e8 ? 16'hc800 :  // <0142> "
addr == 16'h2e9 ? 16'h180f :  // <0142> "
addr == 16'h2ea ? 16'h0006 :  // <0142> a = ga
addr == 16'h2eb ? 16'hfba0 :  // <0142> call put4x
addr == 16'h2ec ? 16'h006f :  // <0142> "
addr == 16'h2ed ? 16'hfc00 :  // <0142> "
addr == 16'h2ee ? 16'h020d :  // <0142> a = 13 // puteol
addr == 16'h2ef ? 16'hfba0 :  // <0142> puteol
addr == 16'h2f0 ? 16'h0050 :  // <0142> "
addr == 16'h2f1 ? 16'hfc00 :  // <0142> "
addr == 16'h2f2 ? 16'h020a :  // <0142> a = 10 // puteol
addr == 16'h2f3 ? 16'hfba0 :  // <0142> puteol
addr == 16'h2f4 ? 16'h0050 :  // <0142> "
addr == 16'h2f5 ? 16'hfc00 :  // <0142> "



addr == 16'h2f6 ? 16'h0006 :  // <0142> a = ga
addr == 16'h2f7 ? 16'h0640 :  // <0142> b = 0x40

addr == 16'h2f8 ? 16'he007 :  // <0140> br eq :else_760
addr == 16'h2f9 ? 16'h02fe :  // <0140> "

addr == 16'h2fa ? 16'h2210 :  // <0141> pa = 0x10
addr == 16'h2fb ? 16'hfba0 :  // <0141> callx fail 0x10
addr == 16'h2fc ? 16'h0489 :  // <0141> "
addr == 16'h2fd ? 16'hfc00 :  // <0141> "


// etest  1 0x41 0x11
// etest  1 0x41 0x11

addr == 16'h2fe ? 16'h0201 :  // <0143> a = 1
addr == 16'h2ff ? 16'hfba0 :  // <0143> call put4x
addr == 16'h300 ? 16'h006f :  // <0143> "
addr == 16'h301 ? 16'hfc00 :  // <0143> "
addr == 16'h302 ? 16'h023a :  // <0143> a = 58 // putasc :
addr == 16'h303 ? 16'hfba0 :  // <0143> putasc :
addr == 16'h304 ? 16'h0050 :  // <0143> "
addr == 16'h305 ? 16'hfc00 :  // <0143> "
addr == 16'h306 ? 16'h0220 :  // <0143> a = 32 // putasc { }
addr == 16'h307 ? 16'hfba0 :  // <0143> putasc { }
addr == 16'h308 ? 16'h0050 :  // <0143> "
addr == 16'h309 ? 16'hfc00 :  // <0143> "
addr == 16'h30a ? 16'h4201 :  // <0143> eread 1 ga
addr == 16'h30b ? 16'h180f :  // <0143> "
addr == 16'h30c ? 16'hc800 :  // <0143> "
addr == 16'h30d ? 16'h180f :  // <0143> "
addr == 16'h30e ? 16'h0006 :  // <0143> a = ga
addr == 16'h30f ? 16'hfba0 :  // <0143> call put4x
addr == 16'h310 ? 16'h006f :  // <0143> "
addr == 16'h311 ? 16'hfc00 :  // <0143> "
addr == 16'h312 ? 16'h020d :  // <0143> a = 13 // puteol
addr == 16'h313 ? 16'hfba0 :  // <0143> puteol
addr == 16'h314 ? 16'h0050 :  // <0143> "
addr == 16'h315 ? 16'hfc00 :  // <0143> "
addr == 16'h316 ? 16'h020a :  // <0143> a = 10 // puteol
addr == 16'h317 ? 16'hfba0 :  // <0143> puteol
addr == 16'h318 ? 16'h0050 :  // <0143> "
addr == 16'h319 ? 16'hfc00 :  // <0143> "



addr == 16'h31a ? 16'h0006 :  // <0143> a = ga
addr == 16'h31b ? 16'h0641 :  // <0143> b = 0x41

addr == 16'h31c ? 16'he007 :  // <0141> br eq :else_796
addr == 16'h31d ? 16'h0322 :  // <0141> "

addr == 16'h31e ? 16'h2211 :  // <0142> pa = 0x11
addr == 16'h31f ? 16'hfba0 :  // <0142> callx fail 0x11
addr == 16'h320 ? 16'h0489 :  // <0142> "
addr == 16'h321 ? 16'hfc00 :  // <0142> "


// etest  2 0x42 0x12
// etest  2 0x42 0x12

addr == 16'h322 ? 16'h0202 :  // <0144> a = 2
addr == 16'h323 ? 16'hfba0 :  // <0144> call put4x
addr == 16'h324 ? 16'h006f :  // <0144> "
addr == 16'h325 ? 16'hfc00 :  // <0144> "
addr == 16'h326 ? 16'h023a :  // <0144> a = 58 // putasc :
addr == 16'h327 ? 16'hfba0 :  // <0144> putasc :
addr == 16'h328 ? 16'h0050 :  // <0144> "
addr == 16'h329 ? 16'hfc00 :  // <0144> "
addr == 16'h32a ? 16'h0220 :  // <0144> a = 32 // putasc { }
addr == 16'h32b ? 16'hfba0 :  // <0144> putasc { }
addr == 16'h32c ? 16'h0050 :  // <0144> "
addr == 16'h32d ? 16'hfc00 :  // <0144> "
addr == 16'h32e ? 16'h4202 :  // <0144> eread 2 ga
addr == 16'h32f ? 16'h180f :  // <0144> "
addr == 16'h330 ? 16'hc800 :  // <0144> "
addr == 16'h331 ? 16'h180f :  // <0144> "
addr == 16'h332 ? 16'h0006 :  // <0144> a = ga
addr == 16'h333 ? 16'hfba0 :  // <0144> call put4x
addr == 16'h334 ? 16'h006f :  // <0144> "
addr == 16'h335 ? 16'hfc00 :  // <0144> "
addr == 16'h336 ? 16'h020d :  // <0144> a = 13 // puteol
addr == 16'h337 ? 16'hfba0 :  // <0144> puteol
addr == 16'h338 ? 16'h0050 :  // <0144> "
addr == 16'h339 ? 16'hfc00 :  // <0144> "
addr == 16'h33a ? 16'h020a :  // <0144> a = 10 // puteol
addr == 16'h33b ? 16'hfba0 :  // <0144> puteol
addr == 16'h33c ? 16'h0050 :  // <0144> "
addr == 16'h33d ? 16'hfc00 :  // <0144> "



addr == 16'h33e ? 16'h0006 :  // <0144> a = ga
addr == 16'h33f ? 16'h0642 :  // <0144> b = 0x42

addr == 16'h340 ? 16'he007 :  // <0142> br eq :else_832
addr == 16'h341 ? 16'h0346 :  // <0142> "

addr == 16'h342 ? 16'h2212 :  // <0143> pa = 0x12
addr == 16'h343 ? 16'hfba0 :  // <0143> callx fail 0x12
addr == 16'h344 ? 16'h0489 :  // <0143> "
addr == 16'h345 ? 16'hfc00 :  // <0143> "


// etest  3 0x43 0x13
// etest  3 0x43 0x13

addr == 16'h346 ? 16'h0203 :  // <0145> a = 3
addr == 16'h347 ? 16'hfba0 :  // <0145> call put4x
addr == 16'h348 ? 16'h006f :  // <0145> "
addr == 16'h349 ? 16'hfc00 :  // <0145> "
addr == 16'h34a ? 16'h023a :  // <0145> a = 58 // putasc :
addr == 16'h34b ? 16'hfba0 :  // <0145> putasc :
addr == 16'h34c ? 16'h0050 :  // <0145> "
addr == 16'h34d ? 16'hfc00 :  // <0145> "
addr == 16'h34e ? 16'h0220 :  // <0145> a = 32 // putasc { }
addr == 16'h34f ? 16'hfba0 :  // <0145> putasc { }
addr == 16'h350 ? 16'h0050 :  // <0145> "
addr == 16'h351 ? 16'hfc00 :  // <0145> "
addr == 16'h352 ? 16'h4203 :  // <0145> eread 3 ga
addr == 16'h353 ? 16'h180f :  // <0145> "
addr == 16'h354 ? 16'hc800 :  // <0145> "
addr == 16'h355 ? 16'h180f :  // <0145> "
addr == 16'h356 ? 16'h0006 :  // <0145> a = ga
addr == 16'h357 ? 16'hfba0 :  // <0145> call put4x
addr == 16'h358 ? 16'h006f :  // <0145> "
addr == 16'h359 ? 16'hfc00 :  // <0145> "
addr == 16'h35a ? 16'h020d :  // <0145> a = 13 // puteol
addr == 16'h35b ? 16'hfba0 :  // <0145> puteol
addr == 16'h35c ? 16'h0050 :  // <0145> "
addr == 16'h35d ? 16'hfc00 :  // <0145> "
addr == 16'h35e ? 16'h020a :  // <0145> a = 10 // puteol
addr == 16'h35f ? 16'hfba0 :  // <0145> puteol
addr == 16'h360 ? 16'h0050 :  // <0145> "
addr == 16'h361 ? 16'hfc00 :  // <0145> "



addr == 16'h362 ? 16'h0006 :  // <0145> a = ga
addr == 16'h363 ? 16'h0643 :  // <0145> b = 0x43

addr == 16'h364 ? 16'he007 :  // <0143> br eq :else_868
addr == 16'h365 ? 16'h036a :  // <0143> "

addr == 16'h366 ? 16'h2213 :  // <0144> pa = 0x13
addr == 16'h367 ? 16'hfba0 :  // <0144> callx fail 0x13
addr == 16'h368 ? 16'h0489 :  // <0144> "
addr == 16'h369 ? 16'hfc00 :  // <0144> "



// consecutive writes, same address.
addr == 16'h36a ? 16'h4203 :  // <0148> ewrite 3 0x51
addr == 16'h36b ? 16'hc800 :  // <0148> "
addr == 16'h36c ? 16'h3e51 :  // <0148> "
addr == 16'h36d ? 16'h4203 :  // <0149> ewrite 3 0x52
addr == 16'h36e ? 16'hc800 :  // <0149> "
addr == 16'h36f ? 16'h3e52 :  // <0149> "
addr == 16'h370 ? 16'h4203 :  // <0150> ewrite 3 0x53
addr == 16'h371 ? 16'hc800 :  // <0150> "
addr == 16'h372 ? 16'h3e53 :  // <0150> "
addr == 16'h373 ? 16'h4203 :  // <0151> ewrite 3 0x54
addr == 16'h374 ? 16'hc800 :  // <0151> "
addr == 16'h375 ? 16'h3e54 :  // <0151> "
addr == 16'h376 ? 16'h4203 :  // <0152> ewrite 3 0x55
addr == 16'h377 ? 16'hc800 :  // <0152> "
addr == 16'h378 ? 16'h3e55 :  // <0152> "
// etest  3 0x55 0x20
// etest  3 0x55 0x20

addr == 16'h379 ? 16'h0203 :  // <0153> a = 3
addr == 16'h37a ? 16'hfba0 :  // <0153> call put4x
addr == 16'h37b ? 16'h006f :  // <0153> "
addr == 16'h37c ? 16'hfc00 :  // <0153> "
addr == 16'h37d ? 16'h023a :  // <0153> a = 58 // putasc :
addr == 16'h37e ? 16'hfba0 :  // <0153> putasc :
addr == 16'h37f ? 16'h0050 :  // <0153> "
addr == 16'h380 ? 16'hfc00 :  // <0153> "
addr == 16'h381 ? 16'h0220 :  // <0153> a = 32 // putasc { }
addr == 16'h382 ? 16'hfba0 :  // <0153> putasc { }
addr == 16'h383 ? 16'h0050 :  // <0153> "
addr == 16'h384 ? 16'hfc00 :  // <0153> "
addr == 16'h385 ? 16'h4203 :  // <0153> eread 3 ga
addr == 16'h386 ? 16'h180f :  // <0153> "
addr == 16'h387 ? 16'hc800 :  // <0153> "
addr == 16'h388 ? 16'h180f :  // <0153> "
addr == 16'h389 ? 16'h0006 :  // <0153> a = ga
addr == 16'h38a ? 16'hfba0 :  // <0153> call put4x
addr == 16'h38b ? 16'h006f :  // <0153> "
addr == 16'h38c ? 16'hfc00 :  // <0153> "
addr == 16'h38d ? 16'h020d :  // <0153> a = 13 // puteol
addr == 16'h38e ? 16'hfba0 :  // <0153> puteol
addr == 16'h38f ? 16'h0050 :  // <0153> "
addr == 16'h390 ? 16'hfc00 :  // <0153> "
addr == 16'h391 ? 16'h020a :  // <0153> a = 10 // puteol
addr == 16'h392 ? 16'hfba0 :  // <0153> puteol
addr == 16'h393 ? 16'h0050 :  // <0153> "
addr == 16'h394 ? 16'hfc00 :  // <0153> "



addr == 16'h395 ? 16'h0006 :  // <0153> a = ga
addr == 16'h396 ? 16'h0655 :  // <0153> b = 0x55

addr == 16'h397 ? 16'he007 :  // <0151> br eq :else_919
addr == 16'h398 ? 16'h039d :  // <0151> "

addr == 16'h399 ? 16'h2220 :  // <0152> pa = 0x20
addr == 16'h39a ? 16'hfba0 :  // <0152> callx fail 0x20
addr == 16'h39b ? 16'h0489 :  // <0152> "
addr == 16'h39c ? 16'hfc00 :  // <0152> "



// consecutive write/read write/read turarounds, same address.
addr == 16'h39d ? 16'h4203 :  // <0156> ewrite 3 0x30
addr == 16'h39e ? 16'hc800 :  // <0156> "
addr == 16'h39f ? 16'h3e30 :  // <0156> "
// etest  3 0x30 0x30
// etest  3 0x30 0x30

addr == 16'h3a0 ? 16'h0203 :  // <0157> a = 3
addr == 16'h3a1 ? 16'hfba0 :  // <0157> call put4x
addr == 16'h3a2 ? 16'h006f :  // <0157> "
addr == 16'h3a3 ? 16'hfc00 :  // <0157> "
addr == 16'h3a4 ? 16'h023a :  // <0157> a = 58 // putasc :
addr == 16'h3a5 ? 16'hfba0 :  // <0157> putasc :
addr == 16'h3a6 ? 16'h0050 :  // <0157> "
addr == 16'h3a7 ? 16'hfc00 :  // <0157> "
addr == 16'h3a8 ? 16'h0220 :  // <0157> a = 32 // putasc { }
addr == 16'h3a9 ? 16'hfba0 :  // <0157> putasc { }
addr == 16'h3aa ? 16'h0050 :  // <0157> "
addr == 16'h3ab ? 16'hfc00 :  // <0157> "
addr == 16'h3ac ? 16'h4203 :  // <0157> eread 3 ga
addr == 16'h3ad ? 16'h180f :  // <0157> "
addr == 16'h3ae ? 16'hc800 :  // <0157> "
addr == 16'h3af ? 16'h180f :  // <0157> "
addr == 16'h3b0 ? 16'h0006 :  // <0157> a = ga
addr == 16'h3b1 ? 16'hfba0 :  // <0157> call put4x
addr == 16'h3b2 ? 16'h006f :  // <0157> "
addr == 16'h3b3 ? 16'hfc00 :  // <0157> "
addr == 16'h3b4 ? 16'h020d :  // <0157> a = 13 // puteol
addr == 16'h3b5 ? 16'hfba0 :  // <0157> puteol
addr == 16'h3b6 ? 16'h0050 :  // <0157> "
addr == 16'h3b7 ? 16'hfc00 :  // <0157> "
addr == 16'h3b8 ? 16'h020a :  // <0157> a = 10 // puteol
addr == 16'h3b9 ? 16'hfba0 :  // <0157> puteol
addr == 16'h3ba ? 16'h0050 :  // <0157> "
addr == 16'h3bb ? 16'hfc00 :  // <0157> "



addr == 16'h3bc ? 16'h0006 :  // <0157> a = ga
addr == 16'h3bd ? 16'h0630 :  // <0157> b = 0x30

addr == 16'h3be ? 16'he007 :  // <0155> br eq :else_958
addr == 16'h3bf ? 16'h03c4 :  // <0155> "

addr == 16'h3c0 ? 16'h2230 :  // <0156> pa = 0x30
addr == 16'h3c1 ? 16'hfba0 :  // <0156> callx fail 0x30
addr == 16'h3c2 ? 16'h0489 :  // <0156> "
addr == 16'h3c3 ? 16'hfc00 :  // <0156> "


addr == 16'h3c4 ? 16'h4203 :  // <0158> ewrite 3 0x31
addr == 16'h3c5 ? 16'hc800 :  // <0158> "
addr == 16'h3c6 ? 16'h3e31 :  // <0158> "
// etest  3 0x31 0x31
// etest  3 0x31 0x31

addr == 16'h3c7 ? 16'h0203 :  // <0159> a = 3
addr == 16'h3c8 ? 16'hfba0 :  // <0159> call put4x
addr == 16'h3c9 ? 16'h006f :  // <0159> "
addr == 16'h3ca ? 16'hfc00 :  // <0159> "
addr == 16'h3cb ? 16'h023a :  // <0159> a = 58 // putasc :
addr == 16'h3cc ? 16'hfba0 :  // <0159> putasc :
addr == 16'h3cd ? 16'h0050 :  // <0159> "
addr == 16'h3ce ? 16'hfc00 :  // <0159> "
addr == 16'h3cf ? 16'h0220 :  // <0159> a = 32 // putasc { }
addr == 16'h3d0 ? 16'hfba0 :  // <0159> putasc { }
addr == 16'h3d1 ? 16'h0050 :  // <0159> "
addr == 16'h3d2 ? 16'hfc00 :  // <0159> "
addr == 16'h3d3 ? 16'h4203 :  // <0159> eread 3 ga
addr == 16'h3d4 ? 16'h180f :  // <0159> "
addr == 16'h3d5 ? 16'hc800 :  // <0159> "
addr == 16'h3d6 ? 16'h180f :  // <0159> "
addr == 16'h3d7 ? 16'h0006 :  // <0159> a = ga
addr == 16'h3d8 ? 16'hfba0 :  // <0159> call put4x
addr == 16'h3d9 ? 16'h006f :  // <0159> "
addr == 16'h3da ? 16'hfc00 :  // <0159> "
addr == 16'h3db ? 16'h020d :  // <0159> a = 13 // puteol
addr == 16'h3dc ? 16'hfba0 :  // <0159> puteol
addr == 16'h3dd ? 16'h0050 :  // <0159> "
addr == 16'h3de ? 16'hfc00 :  // <0159> "
addr == 16'h3df ? 16'h020a :  // <0159> a = 10 // puteol
addr == 16'h3e0 ? 16'hfba0 :  // <0159> puteol
addr == 16'h3e1 ? 16'h0050 :  // <0159> "
addr == 16'h3e2 ? 16'hfc00 :  // <0159> "



addr == 16'h3e3 ? 16'h0006 :  // <0159> a = ga
addr == 16'h3e4 ? 16'h0631 :  // <0159> b = 0x31

addr == 16'h3e5 ? 16'he007 :  // <0157> br eq :else_997
addr == 16'h3e6 ? 16'h03eb :  // <0157> "

addr == 16'h3e7 ? 16'h2231 :  // <0158> pa = 0x31
addr == 16'h3e8 ? 16'hfba0 :  // <0158> callx fail 0x31
addr == 16'h3e9 ? 16'h0489 :  // <0158> "
addr == 16'h3ea ? 16'hfc00 :  // <0158> "


addr == 16'h3eb ? 16'h4203 :  // <0160> ewrite 3 0x32
addr == 16'h3ec ? 16'hc800 :  // <0160> "
addr == 16'h3ed ? 16'h3e32 :  // <0160> "
// etest  3 0x32 0x32
// etest  3 0x32 0x32

addr == 16'h3ee ? 16'h0203 :  // <0161> a = 3
addr == 16'h3ef ? 16'hfba0 :  // <0161> call put4x
addr == 16'h3f0 ? 16'h006f :  // <0161> "
addr == 16'h3f1 ? 16'hfc00 :  // <0161> "
addr == 16'h3f2 ? 16'h023a :  // <0161> a = 58 // putasc :
addr == 16'h3f3 ? 16'hfba0 :  // <0161> putasc :
addr == 16'h3f4 ? 16'h0050 :  // <0161> "
addr == 16'h3f5 ? 16'hfc00 :  // <0161> "
addr == 16'h3f6 ? 16'h0220 :  // <0161> a = 32 // putasc { }
addr == 16'h3f7 ? 16'hfba0 :  // <0161> putasc { }
addr == 16'h3f8 ? 16'h0050 :  // <0161> "
addr == 16'h3f9 ? 16'hfc00 :  // <0161> "
addr == 16'h3fa ? 16'h4203 :  // <0161> eread 3 ga
addr == 16'h3fb ? 16'h180f :  // <0161> "
addr == 16'h3fc ? 16'hc800 :  // <0161> "
addr == 16'h3fd ? 16'h180f :  // <0161> "
addr == 16'h3fe ? 16'h0006 :  // <0161> a = ga
addr == 16'h3ff ? 16'hfba0 :  // <0161> call put4x
addr == 16'h400 ? 16'h006f :  // <0161> "
addr == 16'h401 ? 16'hfc00 :  // <0161> "
addr == 16'h402 ? 16'h020d :  // <0161> a = 13 // puteol
addr == 16'h403 ? 16'hfba0 :  // <0161> puteol
addr == 16'h404 ? 16'h0050 :  // <0161> "
addr == 16'h405 ? 16'hfc00 :  // <0161> "
addr == 16'h406 ? 16'h020a :  // <0161> a = 10 // puteol
addr == 16'h407 ? 16'hfba0 :  // <0161> puteol
addr == 16'h408 ? 16'h0050 :  // <0161> "
addr == 16'h409 ? 16'hfc00 :  // <0161> "



addr == 16'h40a ? 16'h0006 :  // <0161> a = ga
addr == 16'h40b ? 16'h0632 :  // <0161> b = 0x32

addr == 16'h40c ? 16'he007 :  // <0159> br eq :else_1036
addr == 16'h40d ? 16'h0412 :  // <0159> "

addr == 16'h40e ? 16'h2232 :  // <0160> pa = 0x32
addr == 16'h40f ? 16'hfba0 :  // <0160> callx fail 0x32
addr == 16'h410 ? 16'h0489 :  // <0160> "
addr == 16'h411 ? 16'hfc00 :  // <0160> "



// consecutive write/read write/read turarounds, different addresses.
addr == 16'h412 ? 16'h4200 :  // <0164> ewrite 0 0x40
addr == 16'h413 ? 16'hc800 :  // <0164> "
addr == 16'h414 ? 16'h3e40 :  // <0164> "
// etest  0 0x40 0x40
// etest  0 0x40 0x40

addr == 16'h415 ? 16'h0200 :  // <0165> a = 0
addr == 16'h416 ? 16'hfba0 :  // <0165> call put4x
addr == 16'h417 ? 16'h006f :  // <0165> "
addr == 16'h418 ? 16'hfc00 :  // <0165> "
addr == 16'h419 ? 16'h023a :  // <0165> a = 58 // putasc :
addr == 16'h41a ? 16'hfba0 :  // <0165> putasc :
addr == 16'h41b ? 16'h0050 :  // <0165> "
addr == 16'h41c ? 16'hfc00 :  // <0165> "
addr == 16'h41d ? 16'h0220 :  // <0165> a = 32 // putasc { }
addr == 16'h41e ? 16'hfba0 :  // <0165> putasc { }
addr == 16'h41f ? 16'h0050 :  // <0165> "
addr == 16'h420 ? 16'hfc00 :  // <0165> "
addr == 16'h421 ? 16'h4200 :  // <0165> eread 0 ga
addr == 16'h422 ? 16'h180f :  // <0165> "
addr == 16'h423 ? 16'hc800 :  // <0165> "
addr == 16'h424 ? 16'h180f :  // <0165> "
addr == 16'h425 ? 16'h0006 :  // <0165> a = ga
addr == 16'h426 ? 16'hfba0 :  // <0165> call put4x
addr == 16'h427 ? 16'h006f :  // <0165> "
addr == 16'h428 ? 16'hfc00 :  // <0165> "
addr == 16'h429 ? 16'h020d :  // <0165> a = 13 // puteol
addr == 16'h42a ? 16'hfba0 :  // <0165> puteol
addr == 16'h42b ? 16'h0050 :  // <0165> "
addr == 16'h42c ? 16'hfc00 :  // <0165> "
addr == 16'h42d ? 16'h020a :  // <0165> a = 10 // puteol
addr == 16'h42e ? 16'hfba0 :  // <0165> puteol
addr == 16'h42f ? 16'h0050 :  // <0165> "
addr == 16'h430 ? 16'hfc00 :  // <0165> "



addr == 16'h431 ? 16'h0006 :  // <0165> a = ga
addr == 16'h432 ? 16'h0640 :  // <0165> b = 0x40

addr == 16'h433 ? 16'he007 :  // <0163> br eq :else_1075
addr == 16'h434 ? 16'h0439 :  // <0163> "

addr == 16'h435 ? 16'h2240 :  // <0164> pa = 0x40
addr == 16'h436 ? 16'hfba0 :  // <0164> callx fail 0x40
addr == 16'h437 ? 16'h0489 :  // <0164> "
addr == 16'h438 ? 16'hfc00 :  // <0164> "


addr == 16'h439 ? 16'h4201 :  // <0166> ewrite 1 0x41
addr == 16'h43a ? 16'hc800 :  // <0166> "
addr == 16'h43b ? 16'h3e41 :  // <0166> "
// etest  1 0x41 0x41
// etest  1 0x41 0x41

addr == 16'h43c ? 16'h0201 :  // <0167> a = 1
addr == 16'h43d ? 16'hfba0 :  // <0167> call put4x
addr == 16'h43e ? 16'h006f :  // <0167> "
addr == 16'h43f ? 16'hfc00 :  // <0167> "
addr == 16'h440 ? 16'h023a :  // <0167> a = 58 // putasc :
addr == 16'h441 ? 16'hfba0 :  // <0167> putasc :
addr == 16'h442 ? 16'h0050 :  // <0167> "
addr == 16'h443 ? 16'hfc00 :  // <0167> "
addr == 16'h444 ? 16'h0220 :  // <0167> a = 32 // putasc { }
addr == 16'h445 ? 16'hfba0 :  // <0167> putasc { }
addr == 16'h446 ? 16'h0050 :  // <0167> "
addr == 16'h447 ? 16'hfc00 :  // <0167> "
addr == 16'h448 ? 16'h4201 :  // <0167> eread 1 ga
addr == 16'h449 ? 16'h180f :  // <0167> "
addr == 16'h44a ? 16'hc800 :  // <0167> "
addr == 16'h44b ? 16'h180f :  // <0167> "
addr == 16'h44c ? 16'h0006 :  // <0167> a = ga
addr == 16'h44d ? 16'hfba0 :  // <0167> call put4x
addr == 16'h44e ? 16'h006f :  // <0167> "
addr == 16'h44f ? 16'hfc00 :  // <0167> "
addr == 16'h450 ? 16'h020d :  // <0167> a = 13 // puteol
addr == 16'h451 ? 16'hfba0 :  // <0167> puteol
addr == 16'h452 ? 16'h0050 :  // <0167> "
addr == 16'h453 ? 16'hfc00 :  // <0167> "
addr == 16'h454 ? 16'h020a :  // <0167> a = 10 // puteol
addr == 16'h455 ? 16'hfba0 :  // <0167> puteol
addr == 16'h456 ? 16'h0050 :  // <0167> "
addr == 16'h457 ? 16'hfc00 :  // <0167> "



addr == 16'h458 ? 16'h0006 :  // <0167> a = ga
addr == 16'h459 ? 16'h0641 :  // <0167> b = 0x41

addr == 16'h45a ? 16'he007 :  // <0165> br eq :else_1114
addr == 16'h45b ? 16'h0460 :  // <0165> "

addr == 16'h45c ? 16'h2241 :  // <0166> pa = 0x41
addr == 16'h45d ? 16'hfba0 :  // <0166> callx fail 0x41
addr == 16'h45e ? 16'h0489 :  // <0166> "
addr == 16'h45f ? 16'hfc00 :  // <0166> "


addr == 16'h460 ? 16'h4202 :  // <0168> ewrite 2 0x42
addr == 16'h461 ? 16'hc800 :  // <0168> "
addr == 16'h462 ? 16'h3e42 :  // <0168> "
// etest  2 0x42 0x42
// etest  2 0x42 0x42

addr == 16'h463 ? 16'h0202 :  // <0169> a = 2
addr == 16'h464 ? 16'hfba0 :  // <0169> call put4x
addr == 16'h465 ? 16'h006f :  // <0169> "
addr == 16'h466 ? 16'hfc00 :  // <0169> "
addr == 16'h467 ? 16'h023a :  // <0169> a = 58 // putasc :
addr == 16'h468 ? 16'hfba0 :  // <0169> putasc :
addr == 16'h469 ? 16'h0050 :  // <0169> "
addr == 16'h46a ? 16'hfc00 :  // <0169> "
addr == 16'h46b ? 16'h0220 :  // <0169> a = 32 // putasc { }
addr == 16'h46c ? 16'hfba0 :  // <0169> putasc { }
addr == 16'h46d ? 16'h0050 :  // <0169> "
addr == 16'h46e ? 16'hfc00 :  // <0169> "
addr == 16'h46f ? 16'h4202 :  // <0169> eread 2 ga
addr == 16'h470 ? 16'h180f :  // <0169> "
addr == 16'h471 ? 16'hc800 :  // <0169> "
addr == 16'h472 ? 16'h180f :  // <0169> "
addr == 16'h473 ? 16'h0006 :  // <0169> a = ga
addr == 16'h474 ? 16'hfba0 :  // <0169> call put4x
addr == 16'h475 ? 16'h006f :  // <0169> "
addr == 16'h476 ? 16'hfc00 :  // <0169> "
addr == 16'h477 ? 16'h020d :  // <0169> a = 13 // puteol
addr == 16'h478 ? 16'hfba0 :  // <0169> puteol
addr == 16'h479 ? 16'h0050 :  // <0169> "
addr == 16'h47a ? 16'hfc00 :  // <0169> "
addr == 16'h47b ? 16'h020a :  // <0169> a = 10 // puteol
addr == 16'h47c ? 16'hfba0 :  // <0169> puteol
addr == 16'h47d ? 16'h0050 :  // <0169> "
addr == 16'h47e ? 16'hfc00 :  // <0169> "



addr == 16'h47f ? 16'h0006 :  // <0169> a = ga
addr == 16'h480 ? 16'h0642 :  // <0169> b = 0x42

addr == 16'h481 ? 16'he007 :  // <0167> br eq :else_1153
addr == 16'h482 ? 16'h0487 :  // <0167> "

addr == 16'h483 ? 16'h2242 :  // <0168> pa = 0x42
addr == 16'h484 ? 16'hfba0 :  // <0168> callx fail 0x42
addr == 16'h485 ? 16'h0489 :  // <0168> "
addr == 16'h486 ? 16'hfc00 :  // <0168> "



//TODO: test exp_r_read with a read-sensitive counter.
// also test a write-sensitive counter.


addr == 16'h487 ? 16'he00f :  // <0175> jmp :begin_test
addr == 16'h488 ? 16'h0207 :  // <0175> "

// ######## func fail // = 0x0489
addr == 16'h489 ? 16'h303e :  // <0185> push rtna // func fail

addr == 16'h48a ? 16'h03a0 :  // <0178> a = :fail_msg
addr == 16'h48b ? 16'h004a :  // <0178> "
addr == 16'h48c ? 16'hfba0 :  // <0179> call print_nt
addr == 16'h48d ? 16'h00fb :  // <0179> "
addr == 16'h48e ? 16'hfc00 :  // <0179> "
addr == 16'h48f ? 16'h0008 :  // <0180> a = fail_code_num
addr == 16'h490 ? 16'hfba0 :  // <0181> call put4x
addr == 16'h491 ? 16'h006f :  // <0181> "
addr == 16'h492 ? 16'hfc00 :  // <0181> "
addr == 16'h493 ? 16'h020d :  // <0182> a = 13 // puteol
addr == 16'h494 ? 16'hfba0 :  // <0182> puteol
addr == 16'h495 ? 16'h0050 :  // <0182> "
addr == 16'h496 ? 16'hfc00 :  // <0182> "
addr == 16'h497 ? 16'h020a :  // <0182> a = 10 // puteol
addr == 16'h498 ? 16'hfba0 :  // <0182> puteol
addr == 16'h499 ? 16'h0050 :  // <0182> "
addr == 16'h49a ? 16'hfc00 :  // <0182> "
// :fail_halt // = 0x049b
addr == 16'h49b ? 16'he00f :  // <0184> jmp :fail_halt
addr == 16'h49c ? 16'h049b :  // <0184> "

addr == 16'h49d ? 16'hf80c :  // <0186> pop rtna // func fail
addr == 16'h49e ? 16'hfc00 :  // <0186> swapra = nop

        
                16'hxxxx;
        endmodule
    
