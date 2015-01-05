
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
addr == 16'h01 ? 16'h00d3 :  // <0051> "


// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// func fetch_byte // = 0x0002
addr == 16'h02 ? 16'h0601 :  // <0005> b = 1
addr == 16'h03 ? 16'hc800 :  // <0006> nop
addr == 16'h04 ? 16'he002 :  // <0007> br and0z :pick_byte_even
addr == 16'h05 ? 16'h000e :  // <0007> "
addr == 16'h06 ? 16'h0350 :  // <0008> a = a>>1
addr == 16'h07 ? 16'h0404 :  // <0009> b = x
addr == 16'h08 ? 16'hc800 :  // <0010> nop
addr == 16'h09 ? 16'hd300 :  // <0011> fetch a from a+b
addr == 16'h0a ? 16'h03b0 :  // <0011> "
addr == 16'h0b ? 16'h0353 :  // <0012> a = a>>4
addr == 16'h0c ? 16'h0353 :  // <0013> a = a>>4
addr == 16'h0d ? 16'hfc00 :  // <0014> rtn
// :pick_byte_even // = 0x000e
addr == 16'h0e ? 16'h0350 :  // <0016> a = a>>1
addr == 16'h0f ? 16'h0404 :  // <0017> b = x
addr == 16'h10 ? 16'hc800 :  // <0018> nop
addr == 16'h11 ? 16'hd300 :  // <0019> fetch a from a+b
addr == 16'h12 ? 16'h03b0 :  // <0019> "
addr == 16'h13 ? 16'h06ff :  // <0020> b = 0xff
addr == 16'h14 ? 16'hc800 :  // <0021> nop
addr == 16'h15 ? 16'h0330 :  // <0022> a = and
addr == 16'h16 ? 16'hfc00 :  // <0023> rtn

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// func find_in_fetch // = 0x0017
addr == 16'h17 ? 16'h2002 :  // <0031> push i // func find_in_fetch
addr == 16'h18 ? 16'h2003 :  // <0031> push j // "
addr == 16'h19 ? 16'h2005 :  // <0031> push y // "
addr == 16'h1a ? 16'h203e :  // <0031> push rtna // "
addr == 16'h1b ? 16'h1400 :  // <0032> y = a
addr == 16'h1c ? 16'h0e00 :  // <0033> j = 0
addr == 16'h1d ? 16'hc800 :  // <0034> nop
addr == 16'h1e ? 16'he001 :  // <0035> br 1z :fail
addr == 16'h1f ? 16'h0031 :  // <0035> "
addr == 16'h20 ? 16'h0f60 :  // <0036> j = -1
addr == 16'h21 ? 16'hc800 :  // <0037> nop
// :again // = 0x0022
addr == 16'h22 ? 16'h0b10 :  // <0039> i = i+j
addr == 16'h23 ? 16'h0002 :  // <0040> a = i
addr == 16'h24 ? 16'hfba0 :  // <0041> call :fetch_byte
addr == 16'h25 ? 16'h0002 :  // <0041> "
addr == 16'h26 ? 16'hfc00 :  // <0041> "
addr == 16'h27 ? 16'h0405 :  // <0042> b = y
addr == 16'h28 ? 16'hc800 :  // <0043> nop
addr == 16'h29 ? 16'he407 :  // <0044> bn eq :again
addr == 16'h2a ? 16'h0022 :  // <0044> "
// :found // = 0x002b
addr == 16'h2b ? 16'h0002 :  // <0046> a = i
addr == 16'h2c ? 16'hf808 :  // <0047> pop rtna // rtn
addr == 16'h2d ? 16'h1408 :  // <0047> pop y // "
addr == 16'h2e ? 16'h0c08 :  // <0047> pop j // "
addr == 16'h2f ? 16'h0808 :  // <0047> pop i // "
addr == 16'h30 ? 16'hfc00 :  // <0047> rtn
// :fail // = 0x0031
addr == 16'h31 ? 16'h0360 :  // <0049> a = -1
addr == 16'h32 ? 16'hf808 :  // <0050> pop rtna // rtn
addr == 16'h33 ? 16'h1408 :  // <0050> pop y // "
addr == 16'h34 ? 16'h0c08 :  // <0050> pop j // "
addr == 16'h35 ? 16'h0808 :  // <0050> pop i // "
addr == 16'h36 ? 16'hfc00 :  // <0050> rtn



// driver library for my_uart_v2 simple async transceiver.




// routine sends out the low byte from a to the UART.  blocks until the UART accepts the byte.
// func putchar_atx // = 0x0037
addr == 16'h37 ? 16'h2004 :  // <0031> push x // func putchar_atx

addr == 16'h38 ? 16'h1000 :  // <0033> x = a

// wait for UART to be idle (not busy).
addr == 16'h39 ? 16'h0202 :  // <0036> a = $atx_busy_mask
// :pcatx_wait_for_idle // = 0x003a
addr == 16'h3a ? 16'h0412 :  // <0038> b = atx_ctrl
addr == 16'h3b ? 16'hc800 :  // <0039> nop
addr == 16'h3c ? 16'he402 :  // <0040> bn and0z :pcatx_wait_for_idle
addr == 16'h3d ? 16'h003a :  // <0040> "

// push word to the UART.  its low byte is a character.
addr == 16'h3e ? 16'h4404 :  // <0043> atx_data = x

// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_ctrl.
addr == 16'h3f ? 16'h4a01 :  // <0048> atx_ctrl = $atx_load_mask

// wait until UART is busy, as acknowledgement.
addr == 16'h40 ? 16'h0202 :  // <0051> a = $atx_busy_mask
// :pcatx_wait_for_busy // = 0x0041
addr == 16'h41 ? 16'h0412 :  // <0053> b = atx_ctrl
addr == 16'h42 ? 16'he002 :  // <0054> br and0z :pcatx_wait_for_busy
addr == 16'h43 ? 16'h0041 :  // <0054> "

addr == 16'h44 ? 16'h4a00 :  // <0056> atx_ctrl = 0
addr == 16'h45 ? 16'h1008 :  // <0057> pop x // rtn
addr == 16'h46 ? 16'hfc00 :  // <0057> rtn

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// func getchar_atx // = 0x0047
// wait until UART is busy, then idle.
addr == 16'h47 ? 16'h0204 :  // <0063> a = $arx_busy_mask
// :wait_for_busy // = 0x0048
addr == 16'h48 ? 16'h0412 :  // <0065> b = atx_ctrl
addr == 16'h49 ? 16'he002 :  // <0066> br and0z :wait_for_busy
addr == 16'h4a ? 16'h0048 :  // <0066> "
// :wait_for_idle // = 0x004b
addr == 16'h4b ? 16'h0412 :  // <0068> b = atx_ctrl
addr == 16'h4c ? 16'hc800 :  // <0069> nop
addr == 16'h4d ? 16'he402 :  // <0070> bn and0z :wait_for_idle
addr == 16'h4e ? 16'h004b :  // <0070> "
addr == 16'h4f ? 16'h0011 :  // <0071> a = atx_data
addr == 16'h50 ? 16'hfc00 :  // <0072> rtn


// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x0051
// "0123456789abcdef"
addr == 16'h51 ? 16'h3130 :  // <0047> 10
addr == 16'h52 ? 16'h3332 :  // <0047> 32
addr == 16'h53 ? 16'h3534 :  // <0047> 54
addr == 16'h54 ? 16'h3736 :  // <0047> 76
addr == 16'h55 ? 16'h3938 :  // <0047> 98
addr == 16'h56 ? 16'h6261 :  // <0047> ba
addr == 16'h57 ? 16'h6463 :  // <0047> dc
addr == 16'h58 ? 16'h6665 :  // <0047> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x0059
addr == 16'h59 ? 16'h2004 :  // <0051> push x // func put4x
addr == 16'h5a ? 16'h2006 :  // <0051> push g6 // "
addr == 16'h5b ? 16'h203e :  // <0051> push rtna // "
addr == 16'h5c ? 16'h13a0 :  // <0052> x = :hexdigits
addr == 16'h5d ? 16'h0051 :  // <0052> "

addr == 16'h5e ? 16'h1800 :  // <0054> g6 = a
addr == 16'h5f ? 16'h07a0 :  // <0055> b = 0xF000
addr == 16'h60 ? 16'hf000 :  // <0055> "
addr == 16'h61 ? 16'hc800 :  // <0056> nop
addr == 16'h62 ? 16'h0330 :  // <0057> a = and
addr == 16'h63 ? 16'h0353 :  // <0058> a = a>>4
addr == 16'h64 ? 16'h0353 :  // <0059> a = a>>4
addr == 16'h65 ? 16'h0353 :  // <0060> a = a>>4
addr == 16'h66 ? 16'hfba0 :  // <0061> call fetch_byte
addr == 16'h67 ? 16'h0002 :  // <0061> "
addr == 16'h68 ? 16'hfc00 :  // <0061> "
addr == 16'h69 ? 16'h0000 :  // <0062> a = a // putchar a
addr == 16'h6a ? 16'hfba0 :  // <0062> putchar a
addr == 16'h6b ? 16'h0037 :  // <0062> "
addr == 16'h6c ? 16'hfc00 :  // <0062> "

addr == 16'h6d ? 16'h0006 :  // <0064> a = g6
addr == 16'h6e ? 16'h07a0 :  // <0065> b = 0x0F00
addr == 16'h6f ? 16'h0f00 :  // <0065> "
addr == 16'h70 ? 16'hc800 :  // <0066> nop
addr == 16'h71 ? 16'h0330 :  // <0067> a = and
addr == 16'h72 ? 16'h0353 :  // <0068> a = a>>4
addr == 16'h73 ? 16'h0353 :  // <0069> a = a>>4
addr == 16'h74 ? 16'hfba0 :  // <0070> call fetch_byte
addr == 16'h75 ? 16'h0002 :  // <0070> "
addr == 16'h76 ? 16'hfc00 :  // <0070> "
addr == 16'h77 ? 16'h0000 :  // <0071> a = a // putchar a
addr == 16'h78 ? 16'hfba0 :  // <0071> putchar a
addr == 16'h79 ? 16'h0037 :  // <0071> "
addr == 16'h7a ? 16'hfc00 :  // <0071> "

addr == 16'h7b ? 16'h0006 :  // <0073> a = g6
addr == 16'h7c ? 16'h06f0 :  // <0074> b = 0x00F0
addr == 16'h7d ? 16'hc800 :  // <0075> nop
addr == 16'h7e ? 16'h0330 :  // <0076> a = and
addr == 16'h7f ? 16'h0353 :  // <0077> a = a>>4
addr == 16'h80 ? 16'hfba0 :  // <0078> call fetch_byte
addr == 16'h81 ? 16'h0002 :  // <0078> "
addr == 16'h82 ? 16'hfc00 :  // <0078> "
addr == 16'h83 ? 16'h0000 :  // <0079> a = a // putchar a
addr == 16'h84 ? 16'hfba0 :  // <0079> putchar a
addr == 16'h85 ? 16'h0037 :  // <0079> "
addr == 16'h86 ? 16'hfc00 :  // <0079> "

addr == 16'h87 ? 16'h0006 :  // <0081> a = g6
addr == 16'h88 ? 16'h060f :  // <0082> b = 0x000F
addr == 16'h89 ? 16'hc800 :  // <0083> nop
addr == 16'h8a ? 16'h0330 :  // <0084> a = and
addr == 16'h8b ? 16'hfba0 :  // <0085> call fetch_byte
addr == 16'h8c ? 16'h0002 :  // <0085> "
addr == 16'h8d ? 16'hfc00 :  // <0085> "
addr == 16'h8e ? 16'h0000 :  // <0086> a = a // putchar a
addr == 16'h8f ? 16'hfba0 :  // <0086> putchar a
addr == 16'h90 ? 16'h0037 :  // <0086> "
addr == 16'h91 ? 16'hfc00 :  // <0086> "

addr == 16'h92 ? 16'hf808 :  // <0088> pop rtna // rtn
addr == 16'h93 ? 16'h1808 :  // <0088> pop g6 // "
addr == 16'h94 ? 16'h1008 :  // <0088> pop x // "
addr == 16'h95 ? 16'hfc00 :  // <0088> rtn

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// func get4x // = 0x0096
addr == 16'h96 ? 16'h2002 :  // <0092> push i // func get4x
addr == 16'h97 ? 16'h2003 :  // <0092> push j // "
addr == 16'h98 ? 16'h2004 :  // <0092> push x // "
addr == 16'h99 ? 16'h2005 :  // <0092> push y // "
addr == 16'h9a ? 16'h203e :  // <0092> push rtna // "
// y = digit counter
// j = sum
addr == 16'h9b ? 16'h1604 :  // <0095> y = 4
// :again // = 0x009c
addr == 16'h9c ? 16'hfba0 :  // <0097> getchar
addr == 16'h9d ? 16'h0047 :  // <0097> "
addr == 16'h9e ? 16'hfc00 :  // <0097> "
addr == 16'h9f ? 16'h13a0 :  // <0098> x = :hexdigits
addr == 16'ha0 ? 16'h0051 :  // <0098> "
addr == 16'ha1 ? 16'h0a10 :  // <0099> i = 16
addr == 16'ha2 ? 16'hfba0 :  // <0100> call :find_in_fetch
addr == 16'ha3 ? 16'h0017 :  // <0100> "
addr == 16'ha4 ? 16'hfc00 :  // <0100> "
addr == 16'ha5 ? 16'h0760 :  // <0101> b = -1
addr == 16'ha6 ? 16'he007 :  // <0102> br eq :fail
addr == 16'ha7 ? 16'h00ba :  // <0102> "
addr == 16'ha8 ? 16'h0400 :  // <0103> b = a
addr == 16'ha9 ? 16'h0003 :  // <0104> a = j
addr == 16'haa ? 16'h0352 :  // <0105> a = a<<4
addr == 16'hab ? 16'hc800 :  // <0106> nop
addr == 16'hac ? 16'h0f34 :  // <0107> j = or
addr == 16'had ? 16'h1360 :  // <0108> x = -1
addr == 16'hae ? 16'hc800 :  // <0109> nop
addr == 16'haf ? 16'h1720 :  // <0110> y = x+y
addr == 16'hb0 ? 16'he400 :  // <0111> bn 2z :again
addr == 16'hb1 ? 16'h009c :  // <0111> "
addr == 16'hb2 ? 16'h0003 :  // <0112> a = j
addr == 16'hb3 ? 16'h0600 :  // <0113> b = 0
addr == 16'hb4 ? 16'hf808 :  // <0114> pop rtna // rtn
addr == 16'hb5 ? 16'h1408 :  // <0114> pop y // "
addr == 16'hb6 ? 16'h1008 :  // <0114> pop x // "
addr == 16'hb7 ? 16'h0c08 :  // <0114> pop j // "
addr == 16'hb8 ? 16'h0808 :  // <0114> pop i // "
addr == 16'hb9 ? 16'hfc00 :  // <0114> rtn
// :fail // = 0x00ba
addr == 16'hba ? 16'h0760 :  // <0116> b = -1
addr == 16'hbb ? 16'hf808 :  // <0117> pop rtna // rtn
addr == 16'hbc ? 16'h1408 :  // <0117> pop y // "
addr == 16'hbd ? 16'h1008 :  // <0117> pop x // "
addr == 16'hbe ? 16'h0c08 :  // <0117> pop j // "
addr == 16'hbf ? 16'h0808 :  // <0117> pop i // "
addr == 16'hc0 ? 16'hfc00 :  // <0117> rtn

// routine waits a number of milliseconds given in a.
// func spinwait // = 0x00c1
addr == 16'hc1 ? 16'h2004 :  // <0002> push x // func spinwait
addr == 16'hc2 ? 16'h2005 :  // <0002> push y // "
//patch
//return
addr == 16'hc3 ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x00c4
addr == 16'hc4 ? 16'h13a0 :  // <0007> x = 12500
addr == 16'hc5 ? 16'h30d4 :  // <0007> "
addr == 16'hc6 ? 16'h1760 :  // <0008> y = -1
addr == 16'hc7 ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x00c8
addr == 16'hc8 ? 16'h1320 :  // <0011> x = x+y
addr == 16'hc9 ? 16'hc800 :  // <0012> nop
addr == 16'hca ? 16'he400 :  // <0013> bn 2z :spinwait_inner
addr == 16'hcb ? 16'h00c8 :  // <0013> "
addr == 16'hcc ? 16'h0300 :  // <0014> a = a+b
addr == 16'hcd ? 16'hc800 :  // <0015> nop
addr == 16'hce ? 16'he404 :  // <0016> bn z :spinwait_outer
addr == 16'hcf ? 16'h00c4 :  // <0016> "
addr == 16'hd0 ? 16'h1408 :  // <0017> pop y // rtn
addr == 16'hd1 ? 16'h1008 :  // <0017> pop x // "
addr == 16'hd2 ? 16'hfc00 :  // <0017> rtn



// ////////////////////////////////////////////
// :main // = 0x00d3
// put target into reset.
addr == 16'hd3 ? 16'h3e02 :  // <0061> bus_ctrl = $tg_reset_mask

// init visor.
addr == 16'hd4 ? 16'h3360 :  // <0064> bp3_addr = $bp_disable
addr == 16'hd5 ? 16'h2f60 :  // <0065> bp2_addr = $bp_disable
addr == 16'hd6 ? 16'h2b60 :  // <0066> bp1_addr = $bp_disable
addr == 16'hd7 ? 16'h2760 :  // <0067> bp0_addr = $bp_disable

addr == 16'hd8 ? 16'h0256 :  // <0069> a = 86 // putasc "V"
addr == 16'hd9 ? 16'h0000 :  // <0069> a = a // putasc "V"
addr == 16'hda ? 16'hfba0 :  // <0069> putasc "V"
addr == 16'hdb ? 16'h0037 :  // <0069> "
addr == 16'hdc ? 16'hfc00 :  // <0069> "
addr == 16'hdd ? 16'h0249 :  // <0070> a = 73 // putasc "I"
addr == 16'hde ? 16'h0000 :  // <0070> a = a // putasc "I"
addr == 16'hdf ? 16'hfba0 :  // <0070> putasc "I"
addr == 16'he0 ? 16'h0037 :  // <0070> "
addr == 16'he1 ? 16'hfc00 :  // <0070> "
addr == 16'he2 ? 16'h0253 :  // <0071> a = 83 // putasc "S"
addr == 16'he3 ? 16'h0000 :  // <0071> a = a // putasc "S"
addr == 16'he4 ? 16'hfba0 :  // <0071> putasc "S"
addr == 16'he5 ? 16'h0037 :  // <0071> "
addr == 16'he6 ? 16'hfc00 :  // <0071> "
addr == 16'he7 ? 16'h024f :  // <0072> a = 79 // putasc "O"
addr == 16'he8 ? 16'h0000 :  // <0072> a = a // putasc "O"
addr == 16'he9 ? 16'hfba0 :  // <0072> putasc "O"
addr == 16'hea ? 16'h0037 :  // <0072> "
addr == 16'heb ? 16'hfc00 :  // <0072> "
addr == 16'hec ? 16'h0252 :  // <0073> a = 82 // putasc "R"
addr == 16'hed ? 16'h0000 :  // <0073> a = a // putasc "R"
addr == 16'hee ? 16'hfba0 :  // <0073> putasc "R"
addr == 16'hef ? 16'h0037 :  // <0073> "
addr == 16'hf0 ? 16'hfc00 :  // <0073> "

//call :load_program

// step into the first target instruction.
addr == 16'hf1 ? 16'h3e08 :  // <0078> bus_ctrl = $bp_step_mask
addr == 16'hf2 ? 16'hfba0 :  // <0079> call :wait_for_bp
addr == 16'hf3 ? 16'h017f :  // <0079> "
addr == 16'hf4 ? 16'hfc00 :  // <0079> "

// command prompt loop.
// :cmd_loop // = 0x00f5
addr == 16'hf5 ? 16'hfba0 :  // <0083> call :dump_target
addr == 16'hf6 ? 16'h01ec :  // <0083> "
addr == 16'hf7 ? 16'hfc00 :  // <0083> "
addr == 16'hf8 ? 16'h0016 :  // <0084> a = tg_code_addr
addr == 16'hf9 ? 16'hfba0 :  // <0085> call :put4x
addr == 16'hfa ? 16'h0059 :  // <0085> "
addr == 16'hfb ? 16'hfc00 :  // <0085> "
addr == 16'hfc ? 16'h022c :  // <0086> a = 44 // putasc ","
addr == 16'hfd ? 16'h0000 :  // <0086> a = a // putasc ","
addr == 16'hfe ? 16'hfba0 :  // <0086> putasc ","
addr == 16'hff ? 16'h0037 :  // <0086> "
addr == 16'h100 ? 16'hfc00 :  // <0086> "
addr == 16'h101 ? 16'h0015 :  // <0087> a = exr_shadow
addr == 16'h102 ? 16'hfba0 :  // <0088> call :put4x
addr == 16'h103 ? 16'h0059 :  // <0088> "
addr == 16'h104 ? 16'hfc00 :  // <0088> "
addr == 16'h105 ? 16'h0220 :  // <0089> a = 32 // putasc " "
addr == 16'h106 ? 16'h0000 :  // <0089> a = a // putasc " "
addr == 16'h107 ? 16'hfba0 :  // <0089> putasc " "
addr == 16'h108 ? 16'h0037 :  // <0089> "
addr == 16'h109 ? 16'hfc00 :  // <0089> "
addr == 16'h10a ? 16'h023e :  // <0090> a = 62 // putasc ">"
addr == 16'h10b ? 16'h0000 :  // <0090> a = a // putasc ">"
addr == 16'h10c ? 16'hfba0 :  // <0090> putasc ">"
addr == 16'h10d ? 16'h0037 :  // <0090> "
addr == 16'h10e ? 16'hfc00 :  // <0090> "
addr == 16'h10f ? 16'hfba0 :  // <0091> getchar
addr == 16'h110 ? 16'h0047 :  // <0091> "
addr == 16'h111 ? 16'hfc00 :  // <0091> "
addr == 16'h112 ? 16'h1000 :  // <0092> x = a
addr == 16'h113 ? 16'h0000 :  // <0093> a = a // putchar a
addr == 16'h114 ? 16'hfba0 :  // <0093> putchar a
addr == 16'h115 ? 16'h0037 :  // <0093> "
addr == 16'h116 ? 16'hfc00 :  // <0093> "
addr == 16'h117 ? 16'h020d :  // <0094> a = 13 // puteol
addr == 16'h118 ? 16'h0000 :  // <0094> a = a // puteol
addr == 16'h119 ? 16'hfba0 :  // <0094> puteol
addr == 16'h11a ? 16'h0037 :  // <0094> "
addr == 16'h11b ? 16'hfc00 :  // <0094> "
addr == 16'h11c ? 16'h020a :  // <0094> a = 10 // puteol
addr == 16'h11d ? 16'h0000 :  // <0094> a = a // puteol
addr == 16'h11e ? 16'hfba0 :  // <0094> puteol
addr == 16'h11f ? 16'h0037 :  // <0094> "
addr == 16'h120 ? 16'hfc00 :  // <0094> "
addr == 16'h121 ? 16'h0004 :  // <0095> a = x

// command = step next instruction.
addr == 16'h122 ? 16'h066e :  // <0098> b = 110 // asc b = "n"
addr == 16'h123 ? 16'hc800 :  // <0099> nop
addr == 16'h124 ? 16'he407 :  // <0100> bn eq :skip_step
addr == 16'h125 ? 16'h012d :  // <0100> "
addr == 16'h126 ? 16'h3e08 :  // <0101> bus_ctrl = $bp_step_mask
addr == 16'h127 ? 16'h2409 :  // <0102> bp0_addr = bp0_addr
addr == 16'h128 ? 16'hfba0 :  // <0103> call :wait_for_bp
addr == 16'h129 ? 16'h017f :  // <0103> "
addr == 16'h12a ? 16'hfc00 :  // <0103> "
addr == 16'h12b ? 16'he00f :  // <0104> jmp :cmd_loop
addr == 16'h12c ? 16'h00f5 :  // <0104> "
// :skip_step // = 0x012d

// command = reset target.
addr == 16'h12d ? 16'h0652 :  // <0108> b = 82 // asc b = "R"
addr == 16'h12e ? 16'hc800 :  // <0109> nop
addr == 16'h12f ? 16'he407 :  // <0110> bn eq :skip_reset
addr == 16'h130 ? 16'h013a :  // <0110> "
addr == 16'h131 ? 16'h3e02 :  // <0111> bus_ctrl = $tg_reset_mask
addr == 16'h132 ? 16'hc800 :  // <0112> nop
addr == 16'h133 ? 16'hc800 :  // <0113> nop
addr == 16'h134 ? 16'h3e08 :  // <0114> bus_ctrl = $bp_step_mask
addr == 16'h135 ? 16'hfba0 :  // <0115> call :wait_for_bp
addr == 16'h136 ? 16'h017f :  // <0115> "
addr == 16'h137 ? 16'hfc00 :  // <0115> "
addr == 16'h138 ? 16'he00f :  // <0116> jmp :cmd_loop
addr == 16'h139 ? 16'h00f5 :  // <0116> "
// :skip_reset // = 0x013a

// command = load program.
addr == 16'h13a ? 16'h066c :  // <0120> b = 108 // asc b = "l"
addr == 16'h13b ? 16'hc800 :  // <0121> nop
addr == 16'h13c ? 16'he407 :  // <0122> bn eq :skip_load
addr == 16'h13d ? 16'h0143 :  // <0122> "
addr == 16'h13e ? 16'hfba0 :  // <0123> call :load_program
addr == 16'h13f ? 16'h0185 :  // <0123> "
addr == 16'h140 ? 16'hfc00 :  // <0123> "
addr == 16'h141 ? 16'he00f :  // <0124> jmp :cmd_loop
addr == 16'h142 ? 16'h00f5 :  // <0124> "
// :skip_load // = 0x0143

// command = run full speed.
addr == 16'h143 ? 16'h0672 :  // <0128> b = 114 // asc b = "r"
addr == 16'h144 ? 16'hc800 :  // <0129> nop
addr == 16'h145 ? 16'he407 :  // <0130> bn eq :skip_run
addr == 16'h146 ? 16'h014a :  // <0130> "
// release target reset, to run.
addr == 16'h147 ? 16'h3e00 :  // <0132> bus_ctrl = 0
addr == 16'h148 ? 16'he00f :  // <0133> jmp :cmd_loop
addr == 16'h149 ? 16'h00f5 :  // <0133> "
// :skip_run // = 0x014a

// command = interrupt / break target.
addr == 16'h14a ? 16'h0669 :  // <0137> b = 105 // asc b = "i"
addr == 16'h14b ? 16'hc800 :  // <0138> nop
addr == 16'h14c ? 16'he407 :  // <0139> bn eq :skip_brk
addr == 16'h14d ? 16'h0155 :  // <0139> "
addr == 16'h14e ? 16'h3e00 :  // <0140> bus_ctrl = 0
addr == 16'h14f ? 16'h3e08 :  // <0141> bus_ctrl = $bp_step_mask
addr == 16'h150 ? 16'hfba0 :  // <0142> call :wait_for_bp
addr == 16'h151 ? 16'h017f :  // <0142> "
addr == 16'h152 ? 16'hfc00 :  // <0142> "
addr == 16'h153 ? 16'he00f :  // <0143> jmp :cmd_loop
addr == 16'h154 ? 16'h00f5 :  // <0143> "
// :skip_brk // = 0x0155

addr == 16'h155 ? 16'h023f :  // <0146> a = 63 // putasc "?"
addr == 16'h156 ? 16'h0000 :  // <0146> a = a // putasc "?"
addr == 16'h157 ? 16'hfba0 :  // <0146> putasc "?"
addr == 16'h158 ? 16'h0037 :  // <0146> "
addr == 16'h159 ? 16'hfc00 :  // <0146> "
addr == 16'h15a ? 16'h020d :  // <0147> a = 13 // puteol
addr == 16'h15b ? 16'h0000 :  // <0147> a = a // puteol
addr == 16'h15c ? 16'hfba0 :  // <0147> puteol
addr == 16'h15d ? 16'h0037 :  // <0147> "
addr == 16'h15e ? 16'hfc00 :  // <0147> "
addr == 16'h15f ? 16'h020a :  // <0147> a = 10 // puteol
addr == 16'h160 ? 16'h0000 :  // <0147> a = a // puteol
addr == 16'h161 ? 16'hfba0 :  // <0147> puteol
addr == 16'h162 ? 16'h0037 :  // <0147> "
addr == 16'h163 ? 16'hfc00 :  // <0147> "
addr == 16'h164 ? 16'he00f :  // <0148> jmp :cmd_loop
addr == 16'h165 ? 16'h00f5 :  // <0148> "

// demonstrations //////////////////////////////

// set a breakpoint, wait til it hits.
addr == 16'h166 ? 16'h2615 :  // <0153> bp0_addr = 0x15
// :main_loop // = 0x0167
addr == 16'h167 ? 16'hfba0 :  // <0155> call :wait_for_bp
addr == 16'h168 ? 16'h017f :  // <0155> "
addr == 16'h169 ? 16'hfc00 :  // <0155> "

// release target to run full speed.
addr == 16'h16a ? 16'h3e00 :  // <0158> bus_ctrl = 0

// interrupt the target and single step it a few times.
addr == 16'h16b ? 16'h3e08 :  // <0161> bus_ctrl = $bp_step_mask
addr == 16'h16c ? 16'hfba0 :  // <0162> call :wait_for_bp
addr == 16'h16d ? 16'h017f :  // <0162> "
addr == 16'h16e ? 16'hfc00 :  // <0162> "
addr == 16'h16f ? 16'h2409 :  // <0163> bp0_addr = bp0_addr
addr == 16'h170 ? 16'hfba0 :  // <0164> call :wait_for_bp
addr == 16'h171 ? 16'h017f :  // <0164> "
addr == 16'h172 ? 16'hfc00 :  // <0164> "
addr == 16'h173 ? 16'h2409 :  // <0165> bp0_addr = bp0_addr
addr == 16'h174 ? 16'hfba0 :  // <0166> call :wait_for_bp
addr == 16'h175 ? 16'h017f :  // <0166> "
addr == 16'h176 ? 16'hfc00 :  // <0166> "
addr == 16'h177 ? 16'h2409 :  // <0167> bp0_addr = bp0_addr
addr == 16'h178 ? 16'hfba0 :  // <0168> call :wait_for_bp
addr == 16'h179 ? 16'h017f :  // <0168> "
addr == 16'h17a ? 16'hfc00 :  // <0168> "
addr == 16'h17b ? 16'h3e00 :  // <0169> bus_ctrl = 0

// release target to pass breakpoint once.
addr == 16'h17c ? 16'h2409 :  // <0172> bp0_addr = bp0_addr

addr == 16'h17d ? 16'he00f :  // <0174> jmp :main_loop
addr == 16'h17e ? 16'h0167 :  // <0174> "

// func wait_for_bp // = 0x017f
addr == 16'h17f ? 16'h0200 :  // <0177> a = 0
addr == 16'h180 ? 16'h0418 :  // <0178> b = bp_status
addr == 16'h181 ? 16'hc800 :  // <0179> nop
addr == 16'h182 ? 16'he004 :  // <0180> br z :wait_for_bp
addr == 16'h183 ? 16'h017f :  // <0180> "
addr == 16'h184 ? 16'hfc00 :  // <0181> rtn

// func load_program // = 0x0185
addr == 16'h185 ? 16'h2002 :  // <0183> push i // func load_program
addr == 16'h186 ? 16'h2003 :  // <0183> push j // "
addr == 16'h187 ? 16'h2004 :  // <0183> push x // "
addr == 16'h188 ? 16'h2006 :  // <0183> push g6 // "
addr == 16'h189 ? 16'h203e :  // <0183> push rtna // "
// load target program from UART.
// length, little-endian.  memorize in x.
addr == 16'h18a ? 16'h024c :  // <0186> a = 76 // putasc L
addr == 16'h18b ? 16'h0000 :  // <0186> a = a // putasc L
addr == 16'h18c ? 16'hfba0 :  // <0186> putasc L
addr == 16'h18d ? 16'h0037 :  // <0186> "
addr == 16'h18e ? 16'hfc00 :  // <0186> "
addr == 16'h18f ? 16'hfba0 :  // <0187> get16 x
addr == 16'h190 ? 16'h0047 :  // <0187> "
addr == 16'h191 ? 16'hfc00 :  // <0187> "
addr == 16'h192 ? 16'h2000 :  // <0187> push a // "
addr == 16'h193 ? 16'hfba0 :  // <0187> "
addr == 16'h194 ? 16'h0047 :  // <0187> "
addr == 16'h195 ? 16'hfc00 :  // <0187> "
addr == 16'h196 ? 16'h0352 :  // <0187> "
addr == 16'h197 ? 16'h0352 :  // <0187> "
addr == 16'h198 ? 16'h0408 :  // <0187> pop b // "
addr == 16'h199 ? 16'hc800 :  // <0187> "
addr == 16'h19a ? 16'h1334 :  // <0187> "
addr == 16'h19b ? 16'h0004 :  // <0188> a = x
addr == 16'h19c ? 16'hfba0 :  // <0189> call put4x
addr == 16'h19d ? 16'h0059 :  // <0189> "
addr == 16'h19e ? 16'hfc00 :  // <0189> "
// put target into reset again, in case this is a target warm boot.
addr == 16'h19f ? 16'h3e02 :  // <0191> bus_ctrl = $tg_reset_mask
// load opcodes.  count up address in i.
addr == 16'h1a0 ? 16'h0a00 :  // <0193> i = 0
addr == 16'h1a1 ? 16'h0e01 :  // <0194> j = 1
// :loadword // = 0x01a2
addr == 16'h1a2 ? 16'h0241 :  // <0196> a = 65 // putasc A
addr == 16'h1a3 ? 16'h0000 :  // <0196> a = a // putasc A
addr == 16'h1a4 ? 16'hfba0 :  // <0196> putasc A
addr == 16'h1a5 ? 16'h0037 :  // <0196> "
addr == 16'h1a6 ? 16'hfc00 :  // <0196> "
addr == 16'h1a7 ? 16'h0002 :  // <0197> a = i
addr == 16'h1a8 ? 16'hfba0 :  // <0198> call put4x
addr == 16'h1a9 ? 16'h0059 :  // <0198> "
addr == 16'h1aa ? 16'hfc00 :  // <0198> "
addr == 16'h1ab ? 16'h023d :  // <0199> a = 61 // putasc "="
addr == 16'h1ac ? 16'h0000 :  // <0199> a = a // putasc "="
addr == 16'h1ad ? 16'hfba0 :  // <0199> putasc "="
addr == 16'h1ae ? 16'h0037 :  // <0199> "
addr == 16'h1af ? 16'hfc00 :  // <0199> "
addr == 16'h1b0 ? 16'hfba0 :  // <0200> get16 g6
addr == 16'h1b1 ? 16'h0047 :  // <0200> "
addr == 16'h1b2 ? 16'hfc00 :  // <0200> "
addr == 16'h1b3 ? 16'h2000 :  // <0200> push a // "
addr == 16'h1b4 ? 16'hfba0 :  // <0200> "
addr == 16'h1b5 ? 16'h0047 :  // <0200> "
addr == 16'h1b6 ? 16'hfc00 :  // <0200> "
addr == 16'h1b7 ? 16'h0352 :  // <0200> "
addr == 16'h1b8 ? 16'h0352 :  // <0200> "
addr == 16'h1b9 ? 16'h0408 :  // <0200> pop b // "
addr == 16'h1ba ? 16'hc800 :  // <0200> "
addr == 16'h1bb ? 16'h1b34 :  // <0200> "
addr == 16'h1bc ? 16'h0006 :  // <0201> a = g6
addr == 16'h1bd ? 16'hfba0 :  // <0202> call put4x
addr == 16'h1be ? 16'h0059 :  // <0202> "
addr == 16'h1bf ? 16'hfc00 :  // <0202> "
addr == 16'h1c0 ? 16'h023d :  // <0203> a = 61 // putasc "="
addr == 16'h1c1 ? 16'h0000 :  // <0203> a = a // putasc "="
addr == 16'h1c2 ? 16'hfba0 :  // <0203> putasc "="
addr == 16'h1c3 ? 16'h0037 :  // <0203> "
addr == 16'h1c4 ? 16'hfc00 :  // <0203> "
addr == 16'h1c5 ? 16'h4c02 :  // <0204> m9k_addr = i
addr == 16'h1c6 ? 16'h5006 :  // <0205> m9k_data = g6
addr == 16'h1c7 ? 16'h0014 :  // <0206> a = m9k_data
addr == 16'h1c8 ? 16'hfba0 :  // <0207> call put4x
addr == 16'h1c9 ? 16'h0059 :  // <0207> "
addr == 16'h1ca ? 16'hfc00 :  // <0207> "
addr == 16'h1cb ? 16'h020d :  // <0208> a = 13 // puteol
addr == 16'h1cc ? 16'h0000 :  // <0208> a = a // puteol
addr == 16'h1cd ? 16'hfba0 :  // <0208> puteol
addr == 16'h1ce ? 16'h0037 :  // <0208> "
addr == 16'h1cf ? 16'hfc00 :  // <0208> "
addr == 16'h1d0 ? 16'h020a :  // <0208> a = 10 // puteol
addr == 16'h1d1 ? 16'h0000 :  // <0208> a = a // puteol
addr == 16'h1d2 ? 16'hfba0 :  // <0208> puteol
addr == 16'h1d3 ? 16'h0037 :  // <0208> "
addr == 16'h1d4 ? 16'hfc00 :  // <0208> "
addr == 16'h1d5 ? 16'h0b10 :  // <0209> i = i+j
addr == 16'h1d6 ? 16'h0002 :  // <0210> a = i
addr == 16'h1d7 ? 16'h0404 :  // <0211> b = x
addr == 16'h1d8 ? 16'hc800 :  // <0212> nop
addr == 16'h1d9 ? 16'he407 :  // <0213> bn eq :loadword
addr == 16'h1da ? 16'h01a2 :  // <0213> "

// observe a register.  return its value in peek_data.
// pass its register address in a.
// func peek // = 0x01db
addr == 16'h1db ? 16'h07a0 :  // <0218> b = 0x3ff
addr == 16'h1dc ? 16'h03ff :  // <0218> "
addr == 16'h1dd ? 16'hc800 :  // <0219> nop
addr == 16'h1de ? 16'h0330 :  // <0220> a = and
// debug_peek_reg = 31 << 10
addr == 16'h1df ? 16'h07a0 :  // <0222> b = 0x7c00
addr == 16'h1e0 ? 16'h7c00 :  // <0222> "
addr == 16'h1e1 ? 16'hc800 :  // <0223> nop
addr == 16'h1e2 ? 16'h3734 :  // <0224> force_opcode = or
addr == 16'h1e3 ? 16'h3e04 :  // <0225> bus_ctrl = $divert_code_bus_mask
addr == 16'h1e4 ? 16'h4201 :  // <0226> tg_force = $hold_state_mask
addr == 16'h1e5 ? 16'h4203 :  // <0227> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h1e6 ? 16'h4205 :  // <0228> tg_force = ($hold_state_mask | $force_exec_mask)
addr == 16'h1e7 ? 16'h4201 :  // <0229> tg_force = $hold_state_mask
// target's register value is now in peek_data.
// refill target exr so it can resume seamlessly.
addr == 16'h1e8 ? 16'h3415 :  // <0232> force_opcode = exr_shadow
addr == 16'h1e9 ? 16'h4203 :  // <0233> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h1ea ? 16'h4200 :  // <0234> tg_force = 0
addr == 16'h1eb ? 16'hfc00 :  // <0235> rtn

// show target status display.
// func dump_target // = 0x01ec
addr == 16'h1ec ? 16'h2002 :  // <0238> push i // func dump_target
addr == 16'h1ed ? 16'h2003 :  // <0238> push j // "
addr == 16'h1ee ? 16'h2004 :  // <0238> push x // "
addr == 16'h1ef ? 16'h2005 :  // <0238> push y // "
addr == 16'h1f0 ? 16'h203e :  // <0238> push rtna // "
addr == 16'h1f1 ? 16'h020d :  // <0239> a = 13 // puteol
addr == 16'h1f2 ? 16'h0000 :  // <0239> a = a // puteol
addr == 16'h1f3 ? 16'hfba0 :  // <0239> puteol
addr == 16'h1f4 ? 16'h0037 :  // <0239> "
addr == 16'h1f5 ? 16'hfc00 :  // <0239> "
addr == 16'h1f6 ? 16'h020a :  // <0239> a = 10 // puteol
addr == 16'h1f7 ? 16'h0000 :  // <0239> a = a // puteol
addr == 16'h1f8 ? 16'hfba0 :  // <0239> puteol
addr == 16'h1f9 ? 16'h0037 :  // <0239> "
addr == 16'h1fa ? 16'hfc00 :  // <0239> "
addr == 16'h1fb ? 16'h0a00 :  // <0240> i = 0
// :next_reg // = 0x01fc
// fetch register name from table in target program.
addr == 16'h1fc ? 16'h1200 :  // <0243> x = 0
addr == 16'h1fd ? 16'h1601 :  // <0244> y = 1
// :next_chars // = 0x01fe
addr == 16'h1fe ? 16'h0002 :  // <0246> a = i
addr == 16'h1ff ? 16'h0351 :  // <0247> a = a<<1
addr == 16'h200 ? 16'h0351 :  // <0248> a = a<<1
addr == 16'h201 ? 16'h0603 :  // <0249> b = 3
addr == 16'h202 ? 16'hc800 :  // <0250> nop
addr == 16'h203 ? 16'h0300 :  // <0251> a = a+b
addr == 16'h204 ? 16'h0404 :  // <0252> b = x
addr == 16'h205 ? 16'hc800 :  // <0253> nop
addr == 16'h206 ? 16'h4f00 :  // <0254> m9k_addr = a+b
addr == 16'h207 ? 16'h0014 :  // <0255> a = m9k_data // putchar m9k_data
addr == 16'h208 ? 16'hfba0 :  // <0255> putchar m9k_data
addr == 16'h209 ? 16'h0037 :  // <0255> "
addr == 16'h20a ? 16'hfc00 :  // <0255> "
addr == 16'h20b ? 16'h0014 :  // <0256> a = m9k_data
addr == 16'h20c ? 16'h0353 :  // <0257> a = a>>4
addr == 16'h20d ? 16'h0353 :  // <0258> a = a>>4
addr == 16'h20e ? 16'h0000 :  // <0259> a = a // putchar a
addr == 16'h20f ? 16'hfba0 :  // <0259> putchar a
addr == 16'h210 ? 16'h0037 :  // <0259> "
addr == 16'h211 ? 16'hfc00 :  // <0259> "
addr == 16'h212 ? 16'h1320 :  // <0260> x = x+y
addr == 16'h213 ? 16'h0004 :  // <0261> a = x
addr == 16'h214 ? 16'h0604 :  // <0262> b = 4
addr == 16'h215 ? 16'hc800 :  // <0263> nop
addr == 16'h216 ? 16'he407 :  // <0264> bn eq :next_chars
addr == 16'h217 ? 16'h01fe :  // <0264> "
addr == 16'h218 ? 16'h023d :  // <0265> a = 61 // putasc "="
addr == 16'h219 ? 16'h0000 :  // <0265> a = a // putasc "="
addr == 16'h21a ? 16'hfba0 :  // <0265> putasc "="
addr == 16'h21b ? 16'h0037 :  // <0265> "
addr == 16'h21c ? 16'hfc00 :  // <0265> "
addr == 16'h21d ? 16'h0002 :  // <0266> a = i
addr == 16'h21e ? 16'hfba0 :  // <0267> call :peek
addr == 16'h21f ? 16'h01db :  // <0267> "
addr == 16'h220 ? 16'hfc00 :  // <0267> "
addr == 16'h221 ? 16'h0017 :  // <0268> a = peek_data
addr == 16'h222 ? 16'hfba0 :  // <0269> call :put4x
addr == 16'h223 ? 16'h0059 :  // <0269> "
addr == 16'h224 ? 16'hfc00 :  // <0269> "
addr == 16'h225 ? 16'h0220 :  // <0270> a = 32 // putasc " "
addr == 16'h226 ? 16'h0000 :  // <0270> a = a // putasc " "
addr == 16'h227 ? 16'hfba0 :  // <0270> putasc " "
addr == 16'h228 ? 16'h0037 :  // <0270> "
addr == 16'h229 ? 16'hfc00 :  // <0270> "
addr == 16'h22a ? 16'h0e01 :  // <0271> j = 1
addr == 16'h22b ? 16'hc800 :  // <0272> nop
addr == 16'h22c ? 16'h0b10 :  // <0273> i = i+j
// loop up to the number of registers in the target program's register name table.
addr == 16'h22d ? 16'h4e02 :  // <0275> m9k_addr = 2
addr == 16'h22e ? 16'h0414 :  // <0276> b = m9k_data
addr == 16'h22f ? 16'h0002 :  // <0277> a = i
addr == 16'h230 ? 16'hc800 :  // <0278> nop
addr == 16'h231 ? 16'he407 :  // <0279> bn eq :next_reg
addr == 16'h232 ? 16'h01fc :  // <0279> "
addr == 16'h233 ? 16'h020d :  // <0280> a = 13 // puteol
addr == 16'h234 ? 16'h0000 :  // <0280> a = a // puteol
addr == 16'h235 ? 16'hfba0 :  // <0280> puteol
addr == 16'h236 ? 16'h0037 :  // <0280> "
addr == 16'h237 ? 16'hfc00 :  // <0280> "
addr == 16'h238 ? 16'h020a :  // <0280> a = 10 // puteol
addr == 16'h239 ? 16'h0000 :  // <0280> a = a // puteol
addr == 16'h23a ? 16'hfba0 :  // <0280> puteol
addr == 16'h23b ? 16'h0037 :  // <0280> "
addr == 16'h23c ? 16'hfc00 :  // <0280> "
addr == 16'h23d ? 16'hf808 :  // <0281> pop rtna // rtn
addr == 16'h23e ? 16'h1408 :  // <0281> pop y // "
addr == 16'h23f ? 16'h1008 :  // <0281> pop x // "
addr == 16'h240 ? 16'h0c08 :  // <0281> pop j // "
addr == 16'h241 ? 16'h0808 :  // <0281> pop i // "
addr == 16'h242 ? 16'hfc00 :  // <0281> rtn
        
                16'hxxxx;
        endmodule
    
