
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





//alias_src  tg_debug_out	    [incr counter]


addr == 16'h00 ? 16'he00f :  // <0051> jmp :main
addr == 16'h01 ? 16'h00dd :  // <0051> "


// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// func fetch_byte // = 0x0002
addr == 16'h02 ? 16'h0601 :  // <0005> b = 1
addr == 16'h03 ? 16'he003 :  // <0006> br and0z :pick_byte_even
addr == 16'h04 ? 16'h000d :  // <0006> "
addr == 16'h05 ? 16'h0350 :  // <0007> a = a>>1
addr == 16'h06 ? 16'h0404 :  // <0008> b = x
addr == 16'h07 ? 16'hc800 :  // <0009> fetch a from a+b
addr == 16'h08 ? 16'hd300 :  // <0009> "
addr == 16'h09 ? 16'h03b0 :  // <0009> "
addr == 16'h0a ? 16'h0353 :  // <0010> a = a>>4
addr == 16'h0b ? 16'h0353 :  // <0011> a = a>>4
addr == 16'h0c ? 16'hfc00 :  // <0012> rtn
// :pick_byte_even // = 0x000d
addr == 16'h0d ? 16'h0350 :  // <0014> a = a>>1
addr == 16'h0e ? 16'h0404 :  // <0015> b = x
addr == 16'h0f ? 16'hc800 :  // <0016> fetch a from a+b
addr == 16'h10 ? 16'hd300 :  // <0016> "
addr == 16'h11 ? 16'h03b0 :  // <0016> "
addr == 16'h12 ? 16'h06ff :  // <0017> b = 0xff
addr == 16'h13 ? 16'hc800 :  // <0018> a = and
addr == 16'h14 ? 16'h0330 :  // <0018> "
addr == 16'h15 ? 16'hfc00 :  // <0019> rtn

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// func find_in_fetch // = 0x0016
addr == 16'h16 ? 16'h2002 :  // <0027> push i // func find_in_fetch
addr == 16'h17 ? 16'h2003 :  // <0027> push j // "
addr == 16'h18 ? 16'h2005 :  // <0027> push y // "
addr == 16'h19 ? 16'h203e :  // <0027> push rtna // "
addr == 16'h1a ? 16'h1400 :  // <0028> y = a
addr == 16'h1b ? 16'h0f60 :  // <0029> j = -1
// :again // = 0x001c
addr == 16'h1c ? 16'he001 :  // <0031> br iz :fail
addr == 16'h1d ? 16'h002c :  // <0031> "
addr == 16'h1e ? 16'h0b10 :  // <0032> i = ad1
addr == 16'h1f ? 16'h0002 :  // <0033> a = i
addr == 16'h20 ? 16'hfba0 :  // <0034> call :fetch_byte
addr == 16'h21 ? 16'h0002 :  // <0034> "
addr == 16'h22 ? 16'hfc00 :  // <0034> "
addr == 16'h23 ? 16'h0405 :  // <0035> b = y
addr == 16'h24 ? 16'he407 :  // <0036> bn eq :again
addr == 16'h25 ? 16'h001c :  // <0036> "
// :found // = 0x0026
addr == 16'h26 ? 16'h0002 :  // <0038> a = i
addr == 16'h27 ? 16'hf808 :  // <0039> pop rtna // rtn
addr == 16'h28 ? 16'h1408 :  // <0039> pop y // "
addr == 16'h29 ? 16'h0c08 :  // <0039> pop j // "
addr == 16'h2a ? 16'h0808 :  // <0039> pop i // "
addr == 16'h2b ? 16'hfc00 :  // <0039> rtn
// :fail // = 0x002c
addr == 16'h2c ? 16'h0360 :  // <0041> a = -1
addr == 16'h2d ? 16'hf808 :  // <0042> pop rtna // rtn
addr == 16'h2e ? 16'h1408 :  // <0042> pop y // "
addr == 16'h2f ? 16'h0c08 :  // <0042> pop j // "
addr == 16'h30 ? 16'h0808 :  // <0042> pop i // "
addr == 16'h31 ? 16'hfc00 :  // <0042> rtn



// driver library for my_uart_v2 simple async transceiver.




// routine sends out the low byte from a to the UART.  blocks until the UART accepts the byte.
// func putchar_atx // = 0x0032
addr == 16'h32 ? 16'h2004 :  // <0035> push x // func putchar_atx

addr == 16'h33 ? 16'h1000 :  // <0037> x = a

// wait for UART to be idle (not busy).
addr == 16'h34 ? 16'h0202 :  // <0040> a = $atx_busy_mask
// :pcatx_wait_for_idle // = 0x0035
addr == 16'h35 ? 16'h0412 :  // <0042> b = atx_ctrl
addr == 16'h36 ? 16'he403 :  // <0043> bn and0z :pcatx_wait_for_idle
addr == 16'h37 ? 16'h0035 :  // <0043> "

// push word to the UART.  its low byte is a character.
addr == 16'h38 ? 16'h4404 :  // <0046> atx_data = x

// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_ctrl.
addr == 16'h39 ? 16'h4a01 :  // <0051> atx_ctrl = $atx_load_mask

// wait until UART is busy, as acknowledgement.
addr == 16'h3a ? 16'h0202 :  // <0054> a = $atx_busy_mask
// :pcatx_wait_for_busy // = 0x003b
addr == 16'h3b ? 16'h0412 :  // <0056> b = atx_ctrl
addr == 16'h3c ? 16'he003 :  // <0057> br and0z :pcatx_wait_for_busy
addr == 16'h3d ? 16'h003b :  // <0057> "
addr == 16'h3e ? 16'h4a00 :  // <0058> atx_ctrl = 0
addr == 16'h3f ? 16'h1008 :  // <0059> pop x // rtn
addr == 16'h40 ? 16'hfc00 :  // <0059> rtn

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// func getchar_atx // = 0x0041
// wait until UART is busy, then idle.
addr == 16'h41 ? 16'h0204 :  // <0065> a = $arx_busy_mask
// :wait_for_busy // = 0x0042
addr == 16'h42 ? 16'h0412 :  // <0067> b = atx_ctrl
addr == 16'h43 ? 16'he003 :  // <0068> br and0z :wait_for_busy
addr == 16'h44 ? 16'h0042 :  // <0068> "
// :wait_for_idle // = 0x0045
addr == 16'h45 ? 16'h0412 :  // <0070> b = atx_ctrl
addr == 16'h46 ? 16'he403 :  // <0071> bn and0z :wait_for_idle
addr == 16'h47 ? 16'h0045 :  // <0071> "
addr == 16'h48 ? 16'h0011 :  // <0072> a = atx_data
addr == 16'h49 ? 16'hfc00 :  // <0073> rtn

// returns a character in a, or -1 if none.
// this version can miss characters if not polled while the character is arriving.
// func pollchar_atx // = 0x004a
// check for UART is busy, then idle.
addr == 16'h4a ? 16'h0204 :  // <0079> a = $arx_busy_mask
addr == 16'h4b ? 16'h0412 :  // <0080> b = atx_ctrl
addr == 16'h4c ? 16'he003 :  // <0081> br and0z :none
addr == 16'h4d ? 16'h0053 :  // <0081> "
// :wait_for_idle // = 0x004e
addr == 16'h4e ? 16'h0412 :  // <0083> b = atx_ctrl
addr == 16'h4f ? 16'he403 :  // <0084> bn and0z :wait_for_idle
addr == 16'h50 ? 16'h004e :  // <0084> "
addr == 16'h51 ? 16'h0011 :  // <0085> a = atx_data
addr == 16'h52 ? 16'hfc00 :  // <0086> rtn
// :none // = 0x0053
addr == 16'h53 ? 16'h0360 :  // <0088> a = -1
addr == 16'h54 ? 16'hfc00 :  // <0089> rtn



// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x0055
// "0123456789abcdef"
addr == 16'h55 ? 16'h3130 :  // <0054> 10
addr == 16'h56 ? 16'h3332 :  // <0054> 32
addr == 16'h57 ? 16'h3534 :  // <0054> 54
addr == 16'h58 ? 16'h3736 :  // <0054> 76
addr == 16'h59 ? 16'h3938 :  // <0054> 98
addr == 16'h5a ? 16'h6261 :  // <0054> ba
addr == 16'h5b ? 16'h6463 :  // <0054> dc
addr == 16'h5c ? 16'h6665 :  // <0054> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x005d
addr == 16'h5d ? 16'h2004 :  // <0058> push x // func put4x
addr == 16'h5e ? 16'h2006 :  // <0058> push g6 // "
addr == 16'h5f ? 16'h203e :  // <0058> push rtna // "
addr == 16'h60 ? 16'h13a0 :  // <0059> x = :hexdigits
addr == 16'h61 ? 16'h0055 :  // <0059> "

addr == 16'h62 ? 16'h1800 :  // <0061> g6 = a
addr == 16'h63 ? 16'h07a0 :  // <0062> b = 0xF000
addr == 16'h64 ? 16'hf000 :  // <0062> "
addr == 16'h65 ? 16'hc800 :  // <0063> a = and
addr == 16'h66 ? 16'h0330 :  // <0063> "
addr == 16'h67 ? 16'h0353 :  // <0064> a = a>>4
addr == 16'h68 ? 16'h0353 :  // <0065> a = a>>4
addr == 16'h69 ? 16'h0353 :  // <0066> a = a>>4
addr == 16'h6a ? 16'hfba0 :  // <0067> call fetch_byte
addr == 16'h6b ? 16'h0002 :  // <0067> "
addr == 16'h6c ? 16'hfc00 :  // <0067> "
addr == 16'h6d ? 16'h0000 :  // <0068> a = a // putchar a
addr == 16'h6e ? 16'hfba0 :  // <0068> putchar a
addr == 16'h6f ? 16'h0032 :  // <0068> "
addr == 16'h70 ? 16'hfc00 :  // <0068> "

addr == 16'h71 ? 16'h0006 :  // <0070> a = g6
addr == 16'h72 ? 16'h07a0 :  // <0071> b = 0x0F00
addr == 16'h73 ? 16'h0f00 :  // <0071> "
addr == 16'h74 ? 16'hc800 :  // <0072> a = and
addr == 16'h75 ? 16'h0330 :  // <0072> "
addr == 16'h76 ? 16'h0353 :  // <0073> a = a>>4
addr == 16'h77 ? 16'h0353 :  // <0074> a = a>>4
addr == 16'h78 ? 16'hfba0 :  // <0075> call fetch_byte
addr == 16'h79 ? 16'h0002 :  // <0075> "
addr == 16'h7a ? 16'hfc00 :  // <0075> "
addr == 16'h7b ? 16'h0000 :  // <0076> a = a // putchar a
addr == 16'h7c ? 16'hfba0 :  // <0076> putchar a
addr == 16'h7d ? 16'h0032 :  // <0076> "
addr == 16'h7e ? 16'hfc00 :  // <0076> "

addr == 16'h7f ? 16'h0006 :  // <0078> a = g6
addr == 16'h80 ? 16'h06f0 :  // <0079> b = 0x00F0
addr == 16'h81 ? 16'hc800 :  // <0080> a = and
addr == 16'h82 ? 16'h0330 :  // <0080> "
addr == 16'h83 ? 16'h0353 :  // <0081> a = a>>4
addr == 16'h84 ? 16'hfba0 :  // <0082> call fetch_byte
addr == 16'h85 ? 16'h0002 :  // <0082> "
addr == 16'h86 ? 16'hfc00 :  // <0082> "
addr == 16'h87 ? 16'h0000 :  // <0083> a = a // putchar a
addr == 16'h88 ? 16'hfba0 :  // <0083> putchar a
addr == 16'h89 ? 16'h0032 :  // <0083> "
addr == 16'h8a ? 16'hfc00 :  // <0083> "

addr == 16'h8b ? 16'h0006 :  // <0085> a = g6
addr == 16'h8c ? 16'h060f :  // <0086> b = 0x000F
addr == 16'h8d ? 16'hc800 :  // <0087> a = and
addr == 16'h8e ? 16'h0330 :  // <0087> "
addr == 16'h8f ? 16'hfba0 :  // <0088> call fetch_byte
addr == 16'h90 ? 16'h0002 :  // <0088> "
addr == 16'h91 ? 16'hfc00 :  // <0088> "
addr == 16'h92 ? 16'h0000 :  // <0089> a = a // putchar a
addr == 16'h93 ? 16'hfba0 :  // <0089> putchar a
addr == 16'h94 ? 16'h0032 :  // <0089> "
addr == 16'h95 ? 16'hfc00 :  // <0089> "

addr == 16'h96 ? 16'hf808 :  // <0091> pop rtna // rtn
addr == 16'h97 ? 16'h1808 :  // <0091> pop g6 // "
addr == 16'h98 ? 16'h1008 :  // <0091> pop x // "
addr == 16'h99 ? 16'hfc00 :  // <0091> rtn

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// func get4x // = 0x009a
addr == 16'h9a ? 16'h2002 :  // <0095> push i // func get4x
addr == 16'h9b ? 16'h2003 :  // <0095> push j // "
addr == 16'h9c ? 16'h2004 :  // <0095> push x // "
addr == 16'h9d ? 16'h2005 :  // <0095> push y // "
addr == 16'h9e ? 16'h203e :  // <0095> push rtna // "
// y = digit counter
// j = sum
addr == 16'h9f ? 16'h1604 :  // <0098> y = 4
// :again // = 0x00a0
addr == 16'ha0 ? 16'hfba0 :  // <0100> getchar
addr == 16'ha1 ? 16'h0041 :  // <0100> "
addr == 16'ha2 ? 16'hfc00 :  // <0100> "
addr == 16'ha3 ? 16'h2000 :  // <0100> push a // "
addr == 16'ha4 ? 16'h0000 :  // <0100> a = a // "
addr == 16'ha5 ? 16'hfba0 :  // <0100> "
addr == 16'ha6 ? 16'h0032 :  // <0100> "
addr == 16'ha7 ? 16'hfc00 :  // <0100> "
addr == 16'ha8 ? 16'h0008 :  // <0100> pop a // "
addr == 16'ha9 ? 16'h13a0 :  // <0101> x = :hexdigits
addr == 16'haa ? 16'h0055 :  // <0101> "
addr == 16'hab ? 16'h0a10 :  // <0102> i = 16
addr == 16'hac ? 16'hfba0 :  // <0103> call :find_in_fetch
addr == 16'had ? 16'h0016 :  // <0103> "
addr == 16'hae ? 16'hfc00 :  // <0103> "
addr == 16'haf ? 16'h0760 :  // <0104> b = -1
addr == 16'hb0 ? 16'he007 :  // <0105> br eq :fail
addr == 16'hb1 ? 16'h00c5 :  // <0105> "
addr == 16'hb2 ? 16'h0400 :  // <0106> b = a
addr == 16'hb3 ? 16'h0003 :  // <0107> a = j
addr == 16'hb4 ? 16'h0352 :  // <0108> a = a<<4
addr == 16'hb5 ? 16'hc800 :  // <0109> j = or
addr == 16'hb6 ? 16'h0f34 :  // <0109> "
addr == 16'hb7 ? 16'h1360 :  // <0110> x = -1
addr == 16'hb8 ? 16'hc800 :  // <0111> y = x+y
addr == 16'hb9 ? 16'h1720 :  // <0111> "
addr == 16'hba ? 16'h0005 :  // <0112> a = y
addr == 16'hbb ? 16'he400 :  // <0113> bn az :again
addr == 16'hbc ? 16'h00a0 :  // <0113> "
addr == 16'hbd ? 16'h0003 :  // <0114> a = j
addr == 16'hbe ? 16'h0600 :  // <0115> b = 0
addr == 16'hbf ? 16'hf808 :  // <0116> pop rtna // rtn
addr == 16'hc0 ? 16'h1408 :  // <0116> pop y // "
addr == 16'hc1 ? 16'h1008 :  // <0116> pop x // "
addr == 16'hc2 ? 16'h0c08 :  // <0116> pop j // "
addr == 16'hc3 ? 16'h0808 :  // <0116> pop i // "
addr == 16'hc4 ? 16'hfc00 :  // <0116> rtn
// :fail // = 0x00c5
addr == 16'hc5 ? 16'h0760 :  // <0118> b = -1
addr == 16'hc6 ? 16'hf808 :  // <0119> pop rtna // rtn
addr == 16'hc7 ? 16'h1408 :  // <0119> pop y // "
addr == 16'hc8 ? 16'h1008 :  // <0119> pop x // "
addr == 16'hc9 ? 16'h0c08 :  // <0119> pop j // "
addr == 16'hca ? 16'h0808 :  // <0119> pop i // "
addr == 16'hcb ? 16'hfc00 :  // <0119> rtn

// routine waits a number of milliseconds given in a.
// func spinwait // = 0x00cc
addr == 16'hcc ? 16'h2004 :  // <0002> push x // func spinwait
addr == 16'hcd ? 16'h2005 :  // <0002> push y // "
//patch
//rtn
addr == 16'hce ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x00cf
addr == 16'hcf ? 16'h13a0 :  // <0007> x = 16666
addr == 16'hd0 ? 16'h411a :  // <0007> "
addr == 16'hd1 ? 16'h1760 :  // <0008> y = -1
addr == 16'hd2 ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x00d3
// use of the ad2 name overrides auto-nop here.
addr == 16'hd3 ? 16'h1320 :  // <0012> x = ad2
addr == 16'hd4 ? 16'he402 :  // <0013> bn xz :spinwait_inner
addr == 16'hd5 ? 16'h00d3 :  // <0013> "
addr == 16'hd6 ? 16'hc800 :  // <0014> a = a+b
addr == 16'hd7 ? 16'h0300 :  // <0014> "
addr == 16'hd8 ? 16'he400 :  // <0015> bn az :spinwait_outer
addr == 16'hd9 ? 16'h00cf :  // <0015> "
addr == 16'hda ? 16'h1408 :  // <0016> pop y // rtn
addr == 16'hdb ? 16'h1008 :  // <0016> pop x // "
addr == 16'hdc ? 16'hfc00 :  // <0016> rtn



// ////////////////////////////////////////////
// :main // = 0x00dd
// put target into reset.
addr == 16'hdd ? 16'h3e02 :  // <0061> bus_ctrl = $tg_reset_mask

// init visor.
addr == 16'hde ? 16'h3360 :  // <0064> bp3_addr = $bp_disable
addr == 16'hdf ? 16'h2f60 :  // <0065> bp2_addr = $bp_disable
addr == 16'he0 ? 16'h2b60 :  // <0066> bp1_addr = $bp_disable
addr == 16'he1 ? 16'h2760 :  // <0067> bp0_addr = $bp_disable

addr == 16'he2 ? 16'h0256 :  // <0069> a = 86 // putasc "V"
addr == 16'he3 ? 16'h0000 :  // <0069> a = a // putasc "V"
addr == 16'he4 ? 16'hfba0 :  // <0069> putasc "V"
addr == 16'he5 ? 16'h0032 :  // <0069> "
addr == 16'he6 ? 16'hfc00 :  // <0069> "
addr == 16'he7 ? 16'h0249 :  // <0070> a = 73 // putasc "I"
addr == 16'he8 ? 16'h0000 :  // <0070> a = a // putasc "I"
addr == 16'he9 ? 16'hfba0 :  // <0070> putasc "I"
addr == 16'hea ? 16'h0032 :  // <0070> "
addr == 16'heb ? 16'hfc00 :  // <0070> "
addr == 16'hec ? 16'h0253 :  // <0071> a = 83 // putasc "S"
addr == 16'hed ? 16'h0000 :  // <0071> a = a // putasc "S"
addr == 16'hee ? 16'hfba0 :  // <0071> putasc "S"
addr == 16'hef ? 16'h0032 :  // <0071> "
addr == 16'hf0 ? 16'hfc00 :  // <0071> "
addr == 16'hf1 ? 16'h024f :  // <0072> a = 79 // putasc "O"
addr == 16'hf2 ? 16'h0000 :  // <0072> a = a // putasc "O"
addr == 16'hf3 ? 16'hfba0 :  // <0072> putasc "O"
addr == 16'hf4 ? 16'h0032 :  // <0072> "
addr == 16'hf5 ? 16'hfc00 :  // <0072> "
addr == 16'hf6 ? 16'h0252 :  // <0073> a = 82 // putasc "R"
addr == 16'hf7 ? 16'h0000 :  // <0073> a = a // putasc "R"
addr == 16'hf8 ? 16'hfba0 :  // <0073> putasc "R"
addr == 16'hf9 ? 16'h0032 :  // <0073> "
addr == 16'hfa ? 16'hfc00 :  // <0073> "

//call :load_program

// step into the first target instruction.
addr == 16'hfb ? 16'h3e08 :  // <0078> bus_ctrl = $bp_step_mask
addr == 16'hfc ? 16'hfba0 :  // <0079> call :wait_for_bp
addr == 16'hfd ? 16'h01ae :  // <0079> "
addr == 16'hfe ? 16'hfc00 :  // <0079> "

// :runagain
// // release target reset, to run.
// bus_ctrl = 0
// bp0_addr = bp0_addr
// a = 1000
// call :spinwait
// bus_ctrl = $bp_step_mask
// call :wait_for_bp
// call :dump_target
// a = tg_code_addr
// call :put4x
// putasc ","
// a = exr_shadow
// call :put4x
// putasc " "
// putasc ">"
// getchar
// a = 1000
// call :spinwait
// jmp :runagain

// command prompt loop.
// :cmd_loop // = 0x00ff
addr == 16'hff ? 16'h000f :  // <0104> a = bus_ctrl
addr == 16'h100 ? 16'h0600 :  // <0105> b = 0
addr == 16'h101 ? 16'he007 :  // <0106> br eq :running_prompt
addr == 16'h102 ? 16'h0128 :  // <0106> "

addr == 16'h103 ? 16'hfba0 :  // <0108> call :dump_target
addr == 16'h104 ? 16'h0275 :  // <0108> "
addr == 16'h105 ? 16'hfc00 :  // <0108> "
addr == 16'h106 ? 16'h0016 :  // <0109> a = tg_code_addr
addr == 16'h107 ? 16'hfba0 :  // <0110> call :put4x
addr == 16'h108 ? 16'h005d :  // <0110> "
addr == 16'h109 ? 16'hfc00 :  // <0110> "
addr == 16'h10a ? 16'h022c :  // <0111> a = 44 // putasc ","
addr == 16'h10b ? 16'h0000 :  // <0111> a = a // putasc ","
addr == 16'h10c ? 16'hfba0 :  // <0111> putasc ","
addr == 16'h10d ? 16'h0032 :  // <0111> "
addr == 16'h10e ? 16'hfc00 :  // <0111> "
addr == 16'h10f ? 16'h0015 :  // <0112> a = exr_shadow
addr == 16'h110 ? 16'hfba0 :  // <0113> call :put4x
addr == 16'h111 ? 16'h005d :  // <0113> "
addr == 16'h112 ? 16'hfc00 :  // <0113> "
addr == 16'h113 ? 16'h0220 :  // <0114> a = 32 // putasc " "
addr == 16'h114 ? 16'h0000 :  // <0114> a = a // putasc " "
addr == 16'h115 ? 16'hfba0 :  // <0114> putasc " "
addr == 16'h116 ? 16'h0032 :  // <0114> "
addr == 16'h117 ? 16'hfc00 :  // <0114> "
addr == 16'h118 ? 16'h023e :  // <0115> a = 62 // putasc ">"
addr == 16'h119 ? 16'h0000 :  // <0115> a = a // putasc ">"
addr == 16'h11a ? 16'hfba0 :  // <0115> putasc ">"
addr == 16'h11b ? 16'h0032 :  // <0115> "
addr == 16'h11c ? 16'hfc00 :  // <0115> "
addr == 16'h11d ? 16'hfba0 :  // <0116> getchar
addr == 16'h11e ? 16'h0041 :  // <0116> "
addr == 16'h11f ? 16'hfc00 :  // <0116> "
addr == 16'h120 ? 16'h2000 :  // <0116> push a // "
addr == 16'h121 ? 16'h0000 :  // <0116> a = a // "
addr == 16'h122 ? 16'hfba0 :  // <0116> "
addr == 16'h123 ? 16'h0032 :  // <0116> "
addr == 16'h124 ? 16'hfc00 :  // <0116> "
addr == 16'h125 ? 16'h0008 :  // <0116> pop a // "
addr == 16'h126 ? 16'he00f :  // <0117> jmp :parse_cmd
addr == 16'h127 ? 16'h0157 :  // <0117> "

// :running_prompt // = 0x0128
addr == 16'h128 ? 16'h020d :  // <0120> a = 13 // puteol
addr == 16'h129 ? 16'h0000 :  // <0120> a = a // puteol
addr == 16'h12a ? 16'hfba0 :  // <0120> puteol
addr == 16'h12b ? 16'h0032 :  // <0120> "
addr == 16'h12c ? 16'hfc00 :  // <0120> "
addr == 16'h12d ? 16'h020a :  // <0120> a = 10 // puteol
addr == 16'h12e ? 16'h0000 :  // <0120> a = a // puteol
addr == 16'h12f ? 16'hfba0 :  // <0120> puteol
addr == 16'h130 ? 16'h0032 :  // <0120> "
addr == 16'h131 ? 16'hfc00 :  // <0120> "
addr == 16'h132 ? 16'h0252 :  // <0121> a = 82 // putasc "R"
addr == 16'h133 ? 16'h0000 :  // <0121> a = a // putasc "R"
addr == 16'h134 ? 16'hfba0 :  // <0121> putasc "R"
addr == 16'h135 ? 16'h0032 :  // <0121> "
addr == 16'h136 ? 16'hfc00 :  // <0121> "
addr == 16'h137 ? 16'h0255 :  // <0122> a = 85 // putasc "U"
addr == 16'h138 ? 16'h0000 :  // <0122> a = a // putasc "U"
addr == 16'h139 ? 16'hfba0 :  // <0122> putasc "U"
addr == 16'h13a ? 16'h0032 :  // <0122> "
addr == 16'h13b ? 16'hfc00 :  // <0122> "
addr == 16'h13c ? 16'h024e :  // <0123> a = 78 // putasc "N"
addr == 16'h13d ? 16'h0000 :  // <0123> a = a // putasc "N"
addr == 16'h13e ? 16'hfba0 :  // <0123> putasc "N"
addr == 16'h13f ? 16'h0032 :  // <0123> "
addr == 16'h140 ? 16'hfc00 :  // <0123> "
addr == 16'h141 ? 16'h0220 :  // <0124> a = 32 // putasc " "
addr == 16'h142 ? 16'h0000 :  // <0124> a = a // putasc " "
addr == 16'h143 ? 16'hfba0 :  // <0124> putasc " "
addr == 16'h144 ? 16'h0032 :  // <0124> "
addr == 16'h145 ? 16'hfc00 :  // <0124> "
addr == 16'h146 ? 16'h023e :  // <0125> a = 62 // putasc ">"
addr == 16'h147 ? 16'h0000 :  // <0125> a = a // putasc ">"
addr == 16'h148 ? 16'hfba0 :  // <0125> putasc ">"
addr == 16'h149 ? 16'h0032 :  // <0125> "
addr == 16'h14a ? 16'hfc00 :  // <0125> "
// :run_poll // = 0x014b
addr == 16'h14b ? 16'hfba0 :  // <0127> pollchar
addr == 16'h14c ? 16'h004a :  // <0127> "
addr == 16'h14d ? 16'hfc00 :  // <0127> "
addr == 16'h14e ? 16'h0760 :  // <0128> b = -1
addr == 16'h14f ? 16'he407 :  // <0129> bn eq :parse_cmd
addr == 16'h150 ? 16'h0157 :  // <0129> "
addr == 16'h151 ? 16'h0018 :  // <0130> a = bp_status
addr == 16'h152 ? 16'he000 :  // <0131> br az :run_poll
addr == 16'h153 ? 16'h014b :  // <0131> "
// target hit a breakpoint; switch to stepping mode.
addr == 16'h154 ? 16'h3e08 :  // <0133> bus_ctrl = $bp_step_mask
addr == 16'h155 ? 16'he00f :  // <0134> jmp :cmd_loop
addr == 16'h156 ? 16'h00ff :  // <0134> "

// :parse_cmd // = 0x0157

// command = step next instruction.
addr == 16'h157 ? 16'h066e :  // <0139> b = 110 // asc b = "n"
addr == 16'h158 ? 16'he407 :  // <0140> bn eq :skip_step
addr == 16'h159 ? 16'h0161 :  // <0140> "
addr == 16'h15a ? 16'h3e08 :  // <0141> bus_ctrl = $bp_step_mask
addr == 16'h15b ? 16'h2409 :  // <0142> bp0_addr = bp0_addr
addr == 16'h15c ? 16'hfba0 :  // <0143> call :wait_for_bp
addr == 16'h15d ? 16'h01ae :  // <0143> "
addr == 16'h15e ? 16'hfc00 :  // <0143> "
addr == 16'h15f ? 16'he00f :  // <0144> jmp :cmd_loop
addr == 16'h160 ? 16'h00ff :  // <0144> "
// :skip_step // = 0x0161

// command = reset target.
addr == 16'h161 ? 16'h0652 :  // <0148> b = 82 // asc b = "R"
addr == 16'h162 ? 16'he407 :  // <0149> bn eq :skip_reset
addr == 16'h163 ? 16'h016d :  // <0149> "
addr == 16'h164 ? 16'h3e02 :  // <0150> bus_ctrl = $tg_reset_mask
addr == 16'h165 ? 16'hc800 :  // <0151> nop
addr == 16'h166 ? 16'hc800 :  // <0152> nop
addr == 16'h167 ? 16'h3e08 :  // <0153> bus_ctrl = $bp_step_mask
addr == 16'h168 ? 16'hfba0 :  // <0154> call :wait_for_bp
addr == 16'h169 ? 16'h01ae :  // <0154> "
addr == 16'h16a ? 16'hfc00 :  // <0154> "
addr == 16'h16b ? 16'he00f :  // <0155> jmp :cmd_loop
addr == 16'h16c ? 16'h00ff :  // <0155> "
// :skip_reset // = 0x016d

// command = load program.
addr == 16'h16d ? 16'h066c :  // <0159> b = 108 // asc b = "l"
addr == 16'h16e ? 16'he407 :  // <0160> bn eq :skip_load
addr == 16'h16f ? 16'h0175 :  // <0160> "
addr == 16'h170 ? 16'hfba0 :  // <0161> call :load_program
addr == 16'h171 ? 16'h0208 :  // <0161> "
addr == 16'h172 ? 16'hfc00 :  // <0161> "
addr == 16'h173 ? 16'he00f :  // <0162> jmp :cmd_loop
addr == 16'h174 ? 16'h00ff :  // <0162> "
// :skip_load // = 0x0175

// command = run full speed.
addr == 16'h175 ? 16'h0672 :  // <0166> b = 114 // asc b = "r"
addr == 16'h176 ? 16'he407 :  // <0167> bn eq :skip_run
addr == 16'h177 ? 16'h017c :  // <0167> "
// release target reset, to run.
addr == 16'h178 ? 16'h3e00 :  // <0169> bus_ctrl = 0
addr == 16'h179 ? 16'h2409 :  // <0170> bp0_addr = bp0_addr
addr == 16'h17a ? 16'he00f :  // <0171> jmp :cmd_loop
addr == 16'h17b ? 16'h00ff :  // <0171> "
// :skip_run // = 0x017c

// // command = interrupt / break target.
// asc b = "i"
// bn eq :skip_brk
// bus_ctrl = 0
// bus_ctrl = $bp_step_mask
// call :wait_for_bp
// jmp :cmd_loop
// :skip_brk

// command = set breakpoint.
addr == 16'h17c ? 16'h0662 :  // <0184> b = 98 // asc b = "b"
addr == 16'h17d ? 16'he407 :  // <0185> bn eq :skip_setbrk
addr == 16'h17e ? 16'h0184 :  // <0185> "
addr == 16'h17f ? 16'hfba0 :  // <0186> call :set_bp
addr == 16'h180 ? 16'h01b2 :  // <0186> "
addr == 16'h181 ? 16'hfc00 :  // <0186> "
addr == 16'h182 ? 16'he00f :  // <0187> jmp :cmd_loop
addr == 16'h183 ? 16'h00ff :  // <0187> "
// :skip_setbrk // = 0x0184

addr == 16'h184 ? 16'h023f :  // <0190> a = 63 // putasc "?"
addr == 16'h185 ? 16'h0000 :  // <0190> a = a // putasc "?"
addr == 16'h186 ? 16'hfba0 :  // <0190> putasc "?"
addr == 16'h187 ? 16'h0032 :  // <0190> "
addr == 16'h188 ? 16'hfc00 :  // <0190> "
addr == 16'h189 ? 16'h020d :  // <0191> a = 13 // puteol
addr == 16'h18a ? 16'h0000 :  // <0191> a = a // puteol
addr == 16'h18b ? 16'hfba0 :  // <0191> puteol
addr == 16'h18c ? 16'h0032 :  // <0191> "
addr == 16'h18d ? 16'hfc00 :  // <0191> "
addr == 16'h18e ? 16'h020a :  // <0191> a = 10 // puteol
addr == 16'h18f ? 16'h0000 :  // <0191> a = a // puteol
addr == 16'h190 ? 16'hfba0 :  // <0191> puteol
addr == 16'h191 ? 16'h0032 :  // <0191> "
addr == 16'h192 ? 16'hfc00 :  // <0191> "
addr == 16'h193 ? 16'he00f :  // <0192> jmp :cmd_loop
addr == 16'h194 ? 16'h00ff :  // <0192> "

// demonstrations //////////////////////////////

// set a breakpoint, wait til it hits.
addr == 16'h195 ? 16'h2615 :  // <0197> bp0_addr = 0x15
// :main_loop // = 0x0196
addr == 16'h196 ? 16'hfba0 :  // <0199> call :wait_for_bp
addr == 16'h197 ? 16'h01ae :  // <0199> "
addr == 16'h198 ? 16'hfc00 :  // <0199> "

// release target to run full speed.
addr == 16'h199 ? 16'h3e00 :  // <0202> bus_ctrl = 0

// interrupt the target and single step it a few times.
addr == 16'h19a ? 16'h3e08 :  // <0205> bus_ctrl = $bp_step_mask
addr == 16'h19b ? 16'hfba0 :  // <0206> call :wait_for_bp
addr == 16'h19c ? 16'h01ae :  // <0206> "
addr == 16'h19d ? 16'hfc00 :  // <0206> "
addr == 16'h19e ? 16'h2409 :  // <0207> bp0_addr = bp0_addr
addr == 16'h19f ? 16'hfba0 :  // <0208> call :wait_for_bp
addr == 16'h1a0 ? 16'h01ae :  // <0208> "
addr == 16'h1a1 ? 16'hfc00 :  // <0208> "
addr == 16'h1a2 ? 16'h2409 :  // <0209> bp0_addr = bp0_addr
addr == 16'h1a3 ? 16'hfba0 :  // <0210> call :wait_for_bp
addr == 16'h1a4 ? 16'h01ae :  // <0210> "
addr == 16'h1a5 ? 16'hfc00 :  // <0210> "
addr == 16'h1a6 ? 16'h2409 :  // <0211> bp0_addr = bp0_addr
addr == 16'h1a7 ? 16'hfba0 :  // <0212> call :wait_for_bp
addr == 16'h1a8 ? 16'h01ae :  // <0212> "
addr == 16'h1a9 ? 16'hfc00 :  // <0212> "
addr == 16'h1aa ? 16'h3e00 :  // <0213> bus_ctrl = 0

// release target to pass breakpoint once.
addr == 16'h1ab ? 16'h2409 :  // <0216> bp0_addr = bp0_addr

addr == 16'h1ac ? 16'he00f :  // <0218> jmp :main_loop
addr == 16'h1ad ? 16'h0196 :  // <0218> "

// func wait_for_bp // = 0x01ae
// :poll // = 0x01ae
addr == 16'h1ae ? 16'h0018 :  // <0222> a = bp_status
addr == 16'h1af ? 16'he000 :  // <0223> br az :poll
addr == 16'h1b0 ? 16'h01ae :  // <0223> "
addr == 16'h1b1 ? 16'hfc00 :  // <0224> rtn

// func set_bp // = 0x01b2
addr == 16'h1b2 ? 16'h2004 :  // <0226> push x // func set_bp
addr == 16'h1b3 ? 16'h2005 :  // <0226> push y // "
addr == 16'h1b4 ? 16'h203e :  // <0226> push rtna // "
addr == 16'h1b5 ? 16'hfba0 :  // <0227> getchar
addr == 16'h1b6 ? 16'h0041 :  // <0227> "
addr == 16'h1b7 ? 16'hfc00 :  // <0227> "
addr == 16'h1b8 ? 16'h2000 :  // <0227> push a // "
addr == 16'h1b9 ? 16'h0000 :  // <0227> a = a // "
addr == 16'h1ba ? 16'hfba0 :  // <0227> "
addr == 16'h1bb ? 16'h0032 :  // <0227> "
addr == 16'h1bc ? 16'hfc00 :  // <0227> "
addr == 16'h1bd ? 16'h0008 :  // <0227> pop a // "
addr == 16'h1be ? 16'h1000 :  // <0228> x = a
addr == 16'h1bf ? 16'hfba0 :  // <0229> getchar
addr == 16'h1c0 ? 16'h0041 :  // <0229> "
addr == 16'h1c1 ? 16'hfc00 :  // <0229> "
addr == 16'h1c2 ? 16'h2000 :  // <0229> push a // "
addr == 16'h1c3 ? 16'h0000 :  // <0229> a = a // "
addr == 16'h1c4 ? 16'hfba0 :  // <0229> "
addr == 16'h1c5 ? 16'h0032 :  // <0229> "
addr == 16'h1c6 ? 16'hfc00 :  // <0229> "
addr == 16'h1c7 ? 16'h0008 :  // <0229> pop a // "
addr == 16'h1c8 ? 16'h063d :  // <0230> b = 61 // asc b = "="
addr == 16'h1c9 ? 16'he407 :  // <0231> bn eq :fail
addr == 16'h1ca ? 16'h01f5 :  // <0231> "
addr == 16'h1cb ? 16'hfba0 :  // <0232> call :get4x
addr == 16'h1cc ? 16'h009a :  // <0232> "
addr == 16'h1cd ? 16'hfc00 :  // <0232> "
addr == 16'h1ce ? 16'h1400 :  // <0233> y = a
addr == 16'h1cf ? 16'h0200 :  // <0234> a = 0
addr == 16'h1d0 ? 16'he407 :  // <0235> bn eq :fail
addr == 16'h1d1 ? 16'h01f5 :  // <0235> "
addr == 16'h1d2 ? 16'h0004 :  // <0236> a = x
addr == 16'h1d3 ? 16'h0630 :  // <0237> b = 48 // asc b = "0"
addr == 16'h1d4 ? 16'he007 :  // <0238> br eq :b0
addr == 16'h1d5 ? 16'h01e1 :  // <0238> "
addr == 16'h1d6 ? 16'h0631 :  // <0239> b = 49 // asc b = "1"
addr == 16'h1d7 ? 16'he007 :  // <0240> br eq :b1
addr == 16'h1d8 ? 16'h01e6 :  // <0240> "
addr == 16'h1d9 ? 16'h0632 :  // <0241> b = 50 // asc b = "2"
addr == 16'h1da ? 16'he007 :  // <0242> br eq :b2
addr == 16'h1db ? 16'h01eb :  // <0242> "
addr == 16'h1dc ? 16'h0633 :  // <0243> b = 51 // asc b = "3"
addr == 16'h1dd ? 16'he007 :  // <0244> br eq :b3
addr == 16'h1de ? 16'h01f0 :  // <0244> "
addr == 16'h1df ? 16'he00f :  // <0245> jmp :fail
addr == 16'h1e0 ? 16'h01f5 :  // <0245> "
// :b0 // = 0x01e1
addr == 16'h1e1 ? 16'h2405 :  // <0247> bp0_addr = y
addr == 16'h1e2 ? 16'hf808 :  // <0248> pop rtna // rtn
addr == 16'h1e3 ? 16'h1408 :  // <0248> pop y // "
addr == 16'h1e4 ? 16'h1008 :  // <0248> pop x // "
addr == 16'h1e5 ? 16'hfc00 :  // <0248> rtn
// :b1 // = 0x01e6
addr == 16'h1e6 ? 16'h2805 :  // <0250> bp1_addr = y
addr == 16'h1e7 ? 16'hf808 :  // <0251> pop rtna // rtn
addr == 16'h1e8 ? 16'h1408 :  // <0251> pop y // "
addr == 16'h1e9 ? 16'h1008 :  // <0251> pop x // "
addr == 16'h1ea ? 16'hfc00 :  // <0251> rtn
// :b2 // = 0x01eb
addr == 16'h1eb ? 16'h2c05 :  // <0253> bp2_addr = y
addr == 16'h1ec ? 16'hf808 :  // <0254> pop rtna // rtn
addr == 16'h1ed ? 16'h1408 :  // <0254> pop y // "
addr == 16'h1ee ? 16'h1008 :  // <0254> pop x // "
addr == 16'h1ef ? 16'hfc00 :  // <0254> rtn
// :b3 // = 0x01f0
addr == 16'h1f0 ? 16'h3005 :  // <0256> bp3_addr = y
addr == 16'h1f1 ? 16'hf808 :  // <0257> pop rtna // rtn
addr == 16'h1f2 ? 16'h1408 :  // <0257> pop y // "
addr == 16'h1f3 ? 16'h1008 :  // <0257> pop x // "
addr == 16'h1f4 ? 16'hfc00 :  // <0257> rtn
// :fail // = 0x01f5
addr == 16'h1f5 ? 16'h023f :  // <0259> a = 63 // putasc "?"
addr == 16'h1f6 ? 16'h0000 :  // <0259> a = a // putasc "?"
addr == 16'h1f7 ? 16'hfba0 :  // <0259> putasc "?"
addr == 16'h1f8 ? 16'h0032 :  // <0259> "
addr == 16'h1f9 ? 16'hfc00 :  // <0259> "
addr == 16'h1fa ? 16'h020d :  // <0260> a = 13 // puteol
addr == 16'h1fb ? 16'h0000 :  // <0260> a = a // puteol
addr == 16'h1fc ? 16'hfba0 :  // <0260> puteol
addr == 16'h1fd ? 16'h0032 :  // <0260> "
addr == 16'h1fe ? 16'hfc00 :  // <0260> "
addr == 16'h1ff ? 16'h020a :  // <0260> a = 10 // puteol
addr == 16'h200 ? 16'h0000 :  // <0260> a = a // puteol
addr == 16'h201 ? 16'hfba0 :  // <0260> puteol
addr == 16'h202 ? 16'h0032 :  // <0260> "
addr == 16'h203 ? 16'hfc00 :  // <0260> "
addr == 16'h204 ? 16'hf808 :  // <0261> pop rtna // rtn
addr == 16'h205 ? 16'h1408 :  // <0261> pop y // "
addr == 16'h206 ? 16'h1008 :  // <0261> pop x // "
addr == 16'h207 ? 16'hfc00 :  // <0261> rtn

// func load_program // = 0x0208
addr == 16'h208 ? 16'h2002 :  // <0263> push i // func load_program
addr == 16'h209 ? 16'h2003 :  // <0263> push j // "
addr == 16'h20a ? 16'h2004 :  // <0263> push x // "
addr == 16'h20b ? 16'h2006 :  // <0263> push g6 // "
addr == 16'h20c ? 16'h203e :  // <0263> push rtna // "
// load target program from UART.
// length, little-endian.  memorize in x.
addr == 16'h20d ? 16'h024c :  // <0266> a = 76 // putasc L
addr == 16'h20e ? 16'h0000 :  // <0266> a = a // putasc L
addr == 16'h20f ? 16'hfba0 :  // <0266> putasc L
addr == 16'h210 ? 16'h0032 :  // <0266> "
addr == 16'h211 ? 16'hfc00 :  // <0266> "
addr == 16'h212 ? 16'hfba0 :  // <0267> get16 x
addr == 16'h213 ? 16'h0041 :  // <0267> "
addr == 16'h214 ? 16'hfc00 :  // <0267> "
addr == 16'h215 ? 16'h2000 :  // <0267> push a // "
addr == 16'h216 ? 16'hfba0 :  // <0267> "
addr == 16'h217 ? 16'h0041 :  // <0267> "
addr == 16'h218 ? 16'hfc00 :  // <0267> "
addr == 16'h219 ? 16'h0352 :  // <0267> "
addr == 16'h21a ? 16'h0352 :  // <0267> "
addr == 16'h21b ? 16'h0408 :  // <0267> pop b // "
addr == 16'h21c ? 16'hc800 :  // <0267> "
addr == 16'h21d ? 16'h1334 :  // <0267> "
addr == 16'h21e ? 16'h0004 :  // <0268> a = x
addr == 16'h21f ? 16'hfba0 :  // <0269> call put4x
addr == 16'h220 ? 16'h005d :  // <0269> "
addr == 16'h221 ? 16'hfc00 :  // <0269> "
// put target into reset again, in case this is a target warm boot.
addr == 16'h222 ? 16'h3e02 :  // <0271> bus_ctrl = $tg_reset_mask
// load opcodes.  count up address in i.
addr == 16'h223 ? 16'h0a00 :  // <0273> i = 0
addr == 16'h224 ? 16'h0e01 :  // <0274> j = 1
// :loadword // = 0x0225
addr == 16'h225 ? 16'h0241 :  // <0276> a = 65 // putasc A
addr == 16'h226 ? 16'h0000 :  // <0276> a = a // putasc A
addr == 16'h227 ? 16'hfba0 :  // <0276> putasc A
addr == 16'h228 ? 16'h0032 :  // <0276> "
addr == 16'h229 ? 16'hfc00 :  // <0276> "
addr == 16'h22a ? 16'h0002 :  // <0277> a = i
addr == 16'h22b ? 16'hfba0 :  // <0278> call put4x
addr == 16'h22c ? 16'h005d :  // <0278> "
addr == 16'h22d ? 16'hfc00 :  // <0278> "
addr == 16'h22e ? 16'h023d :  // <0279> a = 61 // putasc "="
addr == 16'h22f ? 16'h0000 :  // <0279> a = a // putasc "="
addr == 16'h230 ? 16'hfba0 :  // <0279> putasc "="
addr == 16'h231 ? 16'h0032 :  // <0279> "
addr == 16'h232 ? 16'hfc00 :  // <0279> "
addr == 16'h233 ? 16'hfba0 :  // <0280> get16 g6
addr == 16'h234 ? 16'h0041 :  // <0280> "
addr == 16'h235 ? 16'hfc00 :  // <0280> "
addr == 16'h236 ? 16'h2000 :  // <0280> push a // "
addr == 16'h237 ? 16'hfba0 :  // <0280> "
addr == 16'h238 ? 16'h0041 :  // <0280> "
addr == 16'h239 ? 16'hfc00 :  // <0280> "
addr == 16'h23a ? 16'h0352 :  // <0280> "
addr == 16'h23b ? 16'h0352 :  // <0280> "
addr == 16'h23c ? 16'h0408 :  // <0280> pop b // "
addr == 16'h23d ? 16'hc800 :  // <0280> "
addr == 16'h23e ? 16'h1b34 :  // <0280> "
addr == 16'h23f ? 16'h0006 :  // <0281> a = g6
addr == 16'h240 ? 16'hfba0 :  // <0282> call put4x
addr == 16'h241 ? 16'h005d :  // <0282> "
addr == 16'h242 ? 16'hfc00 :  // <0282> "
addr == 16'h243 ? 16'h023d :  // <0283> a = 61 // putasc "="
addr == 16'h244 ? 16'h0000 :  // <0283> a = a // putasc "="
addr == 16'h245 ? 16'hfba0 :  // <0283> putasc "="
addr == 16'h246 ? 16'h0032 :  // <0283> "
addr == 16'h247 ? 16'hfc00 :  // <0283> "
addr == 16'h248 ? 16'h4c02 :  // <0284> m9k_addr = i
addr == 16'h249 ? 16'h5006 :  // <0285> m9k_data = g6
addr == 16'h24a ? 16'h0014 :  // <0286> a = m9k_data
addr == 16'h24b ? 16'hfba0 :  // <0287> call put4x
addr == 16'h24c ? 16'h005d :  // <0287> "
addr == 16'h24d ? 16'hfc00 :  // <0287> "
addr == 16'h24e ? 16'h020d :  // <0288> a = 13 // puteol
addr == 16'h24f ? 16'h0000 :  // <0288> a = a // puteol
addr == 16'h250 ? 16'hfba0 :  // <0288> puteol
addr == 16'h251 ? 16'h0032 :  // <0288> "
addr == 16'h252 ? 16'hfc00 :  // <0288> "
addr == 16'h253 ? 16'h020a :  // <0288> a = 10 // puteol
addr == 16'h254 ? 16'h0000 :  // <0288> a = a // puteol
addr == 16'h255 ? 16'hfba0 :  // <0288> puteol
addr == 16'h256 ? 16'h0032 :  // <0288> "
addr == 16'h257 ? 16'hfc00 :  // <0288> "
addr == 16'h258 ? 16'hc800 :  // <0289> i = i+j
addr == 16'h259 ? 16'h0b10 :  // <0289> "
addr == 16'h25a ? 16'h0002 :  // <0290> a = i
addr == 16'h25b ? 16'h0404 :  // <0291> b = x
addr == 16'h25c ? 16'he407 :  // <0292> bn eq :loadword
addr == 16'h25d ? 16'h0225 :  // <0292> "
addr == 16'h25e ? 16'hf808 :  // <0293> pop rtna // rtn
addr == 16'h25f ? 16'h1808 :  // <0293> pop g6 // "
addr == 16'h260 ? 16'h1008 :  // <0293> pop x // "
addr == 16'h261 ? 16'h0c08 :  // <0293> pop j // "
addr == 16'h262 ? 16'h0808 :  // <0293> pop i // "
addr == 16'h263 ? 16'hfc00 :  // <0293> rtn

// observe a register.  return its value in peek_data.
// pass its register address in a.
// func peek // = 0x0264
addr == 16'h264 ? 16'h07a0 :  // <0298> b = 0x3ff
addr == 16'h265 ? 16'h03ff :  // <0298> "
addr == 16'h266 ? 16'hc800 :  // <0299> a = and
addr == 16'h267 ? 16'h0330 :  // <0299> "
// debug_peek_reg = 31 << 10
addr == 16'h268 ? 16'h07a0 :  // <0301> b = 0x7c00
addr == 16'h269 ? 16'h7c00 :  // <0301> "
addr == 16'h26a ? 16'hc800 :  // <0302> force_opcode = or
addr == 16'h26b ? 16'h3734 :  // <0302> "
addr == 16'h26c ? 16'h3e04 :  // <0303> bus_ctrl = $divert_code_bus_mask
addr == 16'h26d ? 16'h4201 :  // <0304> tg_force = $hold_state_mask
addr == 16'h26e ? 16'h4203 :  // <0305> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h26f ? 16'h4205 :  // <0306> tg_force = ($hold_state_mask | $force_exec_mask)
addr == 16'h270 ? 16'h4201 :  // <0307> tg_force = $hold_state_mask
// target's register value is now in peek_data.
// refill target exr so it can resume seamlessly.
addr == 16'h271 ? 16'h3415 :  // <0310> force_opcode = exr_shadow
addr == 16'h272 ? 16'h4203 :  // <0311> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h273 ? 16'h4200 :  // <0312> tg_force = 0
addr == 16'h274 ? 16'hfc00 :  // <0313> rtn

// show target status display.
// func dump_target // = 0x0275
addr == 16'h275 ? 16'h2002 :  // <0316> push i // func dump_target
addr == 16'h276 ? 16'h2003 :  // <0316> push j // "
addr == 16'h277 ? 16'h2004 :  // <0316> push x // "
addr == 16'h278 ? 16'h2005 :  // <0316> push y // "
addr == 16'h279 ? 16'h203e :  // <0316> push rtna // "
addr == 16'h27a ? 16'h020d :  // <0317> a = 13 // puteol
addr == 16'h27b ? 16'h0000 :  // <0317> a = a // puteol
addr == 16'h27c ? 16'hfba0 :  // <0317> puteol
addr == 16'h27d ? 16'h0032 :  // <0317> "
addr == 16'h27e ? 16'hfc00 :  // <0317> "
addr == 16'h27f ? 16'h020a :  // <0317> a = 10 // puteol
addr == 16'h280 ? 16'h0000 :  // <0317> a = a // puteol
addr == 16'h281 ? 16'hfba0 :  // <0317> puteol
addr == 16'h282 ? 16'h0032 :  // <0317> "
addr == 16'h283 ? 16'hfc00 :  // <0317> "
addr == 16'h284 ? 16'h0a00 :  // <0318> i = 0
// :next_reg // = 0x0285
// fetch register name from table in target program.
addr == 16'h285 ? 16'h1200 :  // <0321> x = 0
addr == 16'h286 ? 16'h1601 :  // <0322> y = 1
// :next_chars // = 0x0287
addr == 16'h287 ? 16'h0002 :  // <0324> a = i
addr == 16'h288 ? 16'h0351 :  // <0325> a = a<<1
addr == 16'h289 ? 16'h0351 :  // <0326> a = a<<1
addr == 16'h28a ? 16'h0603 :  // <0327> b = 3
addr == 16'h28b ? 16'hc800 :  // <0328> a = a+b
addr == 16'h28c ? 16'h0300 :  // <0328> "
addr == 16'h28d ? 16'h0404 :  // <0329> b = x
addr == 16'h28e ? 16'hc800 :  // <0330> m9k_addr = a+b
addr == 16'h28f ? 16'h4f00 :  // <0330> "
addr == 16'h290 ? 16'h0014 :  // <0331> a = m9k_data // putchar m9k_data
addr == 16'h291 ? 16'hfba0 :  // <0331> putchar m9k_data
addr == 16'h292 ? 16'h0032 :  // <0331> "
addr == 16'h293 ? 16'hfc00 :  // <0331> "
addr == 16'h294 ? 16'h0014 :  // <0332> a = m9k_data
addr == 16'h295 ? 16'h0353 :  // <0333> a = a>>4
addr == 16'h296 ? 16'h0353 :  // <0334> a = a>>4
addr == 16'h297 ? 16'h0000 :  // <0335> a = a // putchar a
addr == 16'h298 ? 16'hfba0 :  // <0335> putchar a
addr == 16'h299 ? 16'h0032 :  // <0335> "
addr == 16'h29a ? 16'hfc00 :  // <0335> "
addr == 16'h29b ? 16'hc800 :  // <0336> x = x+y
addr == 16'h29c ? 16'h1320 :  // <0336> "
addr == 16'h29d ? 16'h0004 :  // <0337> a = x
addr == 16'h29e ? 16'h0604 :  // <0338> b = 4
addr == 16'h29f ? 16'he407 :  // <0339> bn eq :next_chars
addr == 16'h2a0 ? 16'h0287 :  // <0339> "
addr == 16'h2a1 ? 16'h023d :  // <0340> a = 61 // putasc "="
addr == 16'h2a2 ? 16'h0000 :  // <0340> a = a // putasc "="
addr == 16'h2a3 ? 16'hfba0 :  // <0340> putasc "="
addr == 16'h2a4 ? 16'h0032 :  // <0340> "
addr == 16'h2a5 ? 16'hfc00 :  // <0340> "
addr == 16'h2a6 ? 16'h0002 :  // <0341> a = i
addr == 16'h2a7 ? 16'hfba0 :  // <0342> call :peek
addr == 16'h2a8 ? 16'h0264 :  // <0342> "
addr == 16'h2a9 ? 16'hfc00 :  // <0342> "
addr == 16'h2aa ? 16'h0017 :  // <0343> a = peek_data
addr == 16'h2ab ? 16'hfba0 :  // <0344> call :put4x
addr == 16'h2ac ? 16'h005d :  // <0344> "
addr == 16'h2ad ? 16'hfc00 :  // <0344> "
addr == 16'h2ae ? 16'h0220 :  // <0345> a = 32 // putasc " "
addr == 16'h2af ? 16'h0000 :  // <0345> a = a // putasc " "
addr == 16'h2b0 ? 16'hfba0 :  // <0345> putasc " "
addr == 16'h2b1 ? 16'h0032 :  // <0345> "
addr == 16'h2b2 ? 16'hfc00 :  // <0345> "
addr == 16'h2b3 ? 16'h0e01 :  // <0346> j = 1
addr == 16'h2b4 ? 16'hc800 :  // <0347> i = i+j
addr == 16'h2b5 ? 16'h0b10 :  // <0347> "
// loop up to the number of registers in the target program's register name table.
addr == 16'h2b6 ? 16'h4e02 :  // <0349> m9k_addr = 2
addr == 16'h2b7 ? 16'h0414 :  // <0350> b = m9k_data
addr == 16'h2b8 ? 16'h0002 :  // <0351> a = i
addr == 16'h2b9 ? 16'he407 :  // <0352> bn eq :next_reg
addr == 16'h2ba ? 16'h0285 :  // <0352> "
addr == 16'h2bb ? 16'h020d :  // <0353> a = 13 // puteol
addr == 16'h2bc ? 16'h0000 :  // <0353> a = a // puteol
addr == 16'h2bd ? 16'hfba0 :  // <0353> puteol
addr == 16'h2be ? 16'h0032 :  // <0353> "
addr == 16'h2bf ? 16'hfc00 :  // <0353> "
addr == 16'h2c0 ? 16'h020a :  // <0353> a = 10 // puteol
addr == 16'h2c1 ? 16'h0000 :  // <0353> a = a // puteol
addr == 16'h2c2 ? 16'hfba0 :  // <0353> puteol
addr == 16'h2c3 ? 16'h0032 :  // <0353> "
addr == 16'h2c4 ? 16'hfc00 :  // <0353> "
addr == 16'h2c5 ? 16'hf808 :  // <0354> pop rtna // rtn
addr == 16'h2c6 ? 16'h1408 :  // <0354> pop y // "
addr == 16'h2c7 ? 16'h1008 :  // <0354> pop x // "
addr == 16'h2c8 ? 16'h0c08 :  // <0354> pop j // "
addr == 16'h2c9 ? 16'h0808 :  // <0354> pop i // "
addr == 16'h2ca ? 16'hfc00 :  // <0354> rtn
        
                16'hxxxx;
        endmodule
    
