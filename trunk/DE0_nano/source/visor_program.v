
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
addr == 16'h37 ? 16'h2004 :  // <0024> push x // func putchar_atx

addr == 16'h38 ? 16'h1000 :  // <0026> x = a

// wait for UART to be idle (not busy).
addr == 16'h39 ? 16'h0202 :  // <0029> a = $atx_busy_mask
// :pcatx_wait_for_idle // = 0x003a
addr == 16'h3a ? 16'h0412 :  // <0031> b = atx_ctrl
addr == 16'h3b ? 16'hc800 :  // <0032> nop
addr == 16'h3c ? 16'he402 :  // <0033> bn and0z :pcatx_wait_for_idle
addr == 16'h3d ? 16'h003a :  // <0033> "

// push word to the UART.  its low byte is a character.
addr == 16'h3e ? 16'h4404 :  // <0036> atx_data = x

// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_ctrl.
addr == 16'h3f ? 16'h4a01 :  // <0041> atx_ctrl = $atx_load_mask

// wait until UART is busy, as acknowledgement.
addr == 16'h40 ? 16'h0202 :  // <0044> a = $atx_busy_mask
// :pcatx_wait_for_busy // = 0x0041
addr == 16'h41 ? 16'h0412 :  // <0046> b = atx_ctrl
addr == 16'h42 ? 16'he002 :  // <0047> br and0z :pcatx_wait_for_busy
addr == 16'h43 ? 16'h0041 :  // <0047> "

addr == 16'h44 ? 16'h4a00 :  // <0049> atx_ctrl = 0
addr == 16'h45 ? 16'h1008 :  // <0050> pop x // rtn
addr == 16'h46 ? 16'hfc00 :  // <0050> rtn

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// func getchar_atx // = 0x0047
// wait until UART is busy, then idle.
addr == 16'h47 ? 16'h0204 :  // <0056> a = $arx_busy_mask
// :wait_for_busy // = 0x0048
addr == 16'h48 ? 16'h0412 :  // <0058> b = atx_ctrl
addr == 16'h49 ? 16'he002 :  // <0059> br and0z :wait_for_busy
addr == 16'h4a ? 16'h0048 :  // <0059> "
// :wait_for_idle // = 0x004b
addr == 16'h4b ? 16'h0412 :  // <0061> b = atx_ctrl
addr == 16'h4c ? 16'hc800 :  // <0062> nop
addr == 16'h4d ? 16'he402 :  // <0063> bn and0z :wait_for_idle
addr == 16'h4e ? 16'h004b :  // <0063> "
addr == 16'h4f ? 16'h0011 :  // <0064> a = atx_data
addr == 16'h50 ? 16'hfc00 :  // <0065> rtn


// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x0051
// "0123456789abcdef"
addr == 16'h51 ? 16'h3130 :  // <0042> 10
addr == 16'h52 ? 16'h3332 :  // <0042> 32
addr == 16'h53 ? 16'h3534 :  // <0042> 54
addr == 16'h54 ? 16'h3736 :  // <0042> 76
addr == 16'h55 ? 16'h3938 :  // <0042> 98
addr == 16'h56 ? 16'h6261 :  // <0042> ba
addr == 16'h57 ? 16'h6463 :  // <0042> dc
addr == 16'h58 ? 16'h6665 :  // <0042> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x0059
addr == 16'h59 ? 16'h2004 :  // <0046> push x // func put4x
addr == 16'h5a ? 16'h2006 :  // <0046> push g6 // "
addr == 16'h5b ? 16'h203e :  // <0046> push rtna // "
addr == 16'h5c ? 16'h13a0 :  // <0047> x = :hexdigits
addr == 16'h5d ? 16'h0051 :  // <0047> "

addr == 16'h5e ? 16'h1800 :  // <0049> g6 = a
addr == 16'h5f ? 16'h07a0 :  // <0050> b = 0xF000
addr == 16'h60 ? 16'hf000 :  // <0050> "
addr == 16'h61 ? 16'hc800 :  // <0051> nop
addr == 16'h62 ? 16'h0330 :  // <0052> a = and
addr == 16'h63 ? 16'h0353 :  // <0053> a = a>>4
addr == 16'h64 ? 16'h0353 :  // <0054> a = a>>4
addr == 16'h65 ? 16'h0353 :  // <0055> a = a>>4
addr == 16'h66 ? 16'hfba0 :  // <0056> call fetch_byte
addr == 16'h67 ? 16'h0002 :  // <0056> "
addr == 16'h68 ? 16'hfc00 :  // <0056> "
addr == 16'h69 ? 16'h0000 :  // <0057> a = a // putchar a
addr == 16'h6a ? 16'hfba0 :  // <0057> putchar a
addr == 16'h6b ? 16'h0037 :  // <0057> "
addr == 16'h6c ? 16'hfc00 :  // <0057> "

addr == 16'h6d ? 16'h0006 :  // <0059> a = g6
addr == 16'h6e ? 16'h07a0 :  // <0060> b = 0x0F00
addr == 16'h6f ? 16'h0f00 :  // <0060> "
addr == 16'h70 ? 16'hc800 :  // <0061> nop
addr == 16'h71 ? 16'h0330 :  // <0062> a = and
addr == 16'h72 ? 16'h0353 :  // <0063> a = a>>4
addr == 16'h73 ? 16'h0353 :  // <0064> a = a>>4
addr == 16'h74 ? 16'hfba0 :  // <0065> call fetch_byte
addr == 16'h75 ? 16'h0002 :  // <0065> "
addr == 16'h76 ? 16'hfc00 :  // <0065> "
addr == 16'h77 ? 16'h0000 :  // <0066> a = a // putchar a
addr == 16'h78 ? 16'hfba0 :  // <0066> putchar a
addr == 16'h79 ? 16'h0037 :  // <0066> "
addr == 16'h7a ? 16'hfc00 :  // <0066> "

addr == 16'h7b ? 16'h0006 :  // <0068> a = g6
addr == 16'h7c ? 16'h06f0 :  // <0069> b = 0x00F0
addr == 16'h7d ? 16'hc800 :  // <0070> nop
addr == 16'h7e ? 16'h0330 :  // <0071> a = and
addr == 16'h7f ? 16'h0353 :  // <0072> a = a>>4
addr == 16'h80 ? 16'hfba0 :  // <0073> call fetch_byte
addr == 16'h81 ? 16'h0002 :  // <0073> "
addr == 16'h82 ? 16'hfc00 :  // <0073> "
addr == 16'h83 ? 16'h0000 :  // <0074> a = a // putchar a
addr == 16'h84 ? 16'hfba0 :  // <0074> putchar a
addr == 16'h85 ? 16'h0037 :  // <0074> "
addr == 16'h86 ? 16'hfc00 :  // <0074> "

addr == 16'h87 ? 16'h0006 :  // <0076> a = g6
addr == 16'h88 ? 16'h060f :  // <0077> b = 0x000F
addr == 16'h89 ? 16'hc800 :  // <0078> nop
addr == 16'h8a ? 16'h0330 :  // <0079> a = and
addr == 16'h8b ? 16'hfba0 :  // <0080> call fetch_byte
addr == 16'h8c ? 16'h0002 :  // <0080> "
addr == 16'h8d ? 16'hfc00 :  // <0080> "
addr == 16'h8e ? 16'h0000 :  // <0081> a = a // putchar a
addr == 16'h8f ? 16'hfba0 :  // <0081> putchar a
addr == 16'h90 ? 16'h0037 :  // <0081> "
addr == 16'h91 ? 16'hfc00 :  // <0081> "

addr == 16'h92 ? 16'hf808 :  // <0083> pop rtna // rtn
addr == 16'h93 ? 16'h1808 :  // <0083> pop g6 // "
addr == 16'h94 ? 16'h1008 :  // <0083> pop x // "
addr == 16'h95 ? 16'hfc00 :  // <0083> rtn

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// func get4x // = 0x0096
addr == 16'h96 ? 16'h2002 :  // <0087> push i // func get4x
addr == 16'h97 ? 16'h2003 :  // <0087> push j // "
addr == 16'h98 ? 16'h2004 :  // <0087> push x // "
addr == 16'h99 ? 16'h2005 :  // <0087> push y // "
addr == 16'h9a ? 16'h203e :  // <0087> push rtna // "
// y = digit counter
// j = sum
addr == 16'h9b ? 16'h1604 :  // <0090> y = 4
// :again // = 0x009c
addr == 16'h9c ? 16'hfba0 :  // <0092> getchar
addr == 16'h9d ? 16'h0047 :  // <0092> "
addr == 16'h9e ? 16'hfc00 :  // <0092> "
addr == 16'h9f ? 16'h13a0 :  // <0093> x = :hexdigits
addr == 16'ha0 ? 16'h0051 :  // <0093> "
addr == 16'ha1 ? 16'h0a10 :  // <0094> i = 16
addr == 16'ha2 ? 16'hfba0 :  // <0095> call :find_in_fetch
addr == 16'ha3 ? 16'h0017 :  // <0095> "
addr == 16'ha4 ? 16'hfc00 :  // <0095> "
addr == 16'ha5 ? 16'h0760 :  // <0096> b = -1
addr == 16'ha6 ? 16'he007 :  // <0097> br eq :fail
addr == 16'ha7 ? 16'h00ba :  // <0097> "
addr == 16'ha8 ? 16'h0400 :  // <0098> b = a
addr == 16'ha9 ? 16'h0003 :  // <0099> a = j
addr == 16'haa ? 16'h0352 :  // <0100> a = a<<4
addr == 16'hab ? 16'hc800 :  // <0101> nop
addr == 16'hac ? 16'h0f34 :  // <0102> j = or
addr == 16'had ? 16'h1360 :  // <0103> x = -1
addr == 16'hae ? 16'hc800 :  // <0104> nop
addr == 16'haf ? 16'h1720 :  // <0105> y = x+y
addr == 16'hb0 ? 16'he400 :  // <0106> bn 2z :again
addr == 16'hb1 ? 16'h009c :  // <0106> "
addr == 16'hb2 ? 16'h0003 :  // <0107> a = j
addr == 16'hb3 ? 16'h0600 :  // <0108> b = 0
addr == 16'hb4 ? 16'hf808 :  // <0109> pop rtna // rtn
addr == 16'hb5 ? 16'h1408 :  // <0109> pop y // "
addr == 16'hb6 ? 16'h1008 :  // <0109> pop x // "
addr == 16'hb7 ? 16'h0c08 :  // <0109> pop j // "
addr == 16'hb8 ? 16'h0808 :  // <0109> pop i // "
addr == 16'hb9 ? 16'hfc00 :  // <0109> rtn
// :fail // = 0x00ba
addr == 16'hba ? 16'h0760 :  // <0111> b = -1
addr == 16'hbb ? 16'hf808 :  // <0112> pop rtna // rtn
addr == 16'hbc ? 16'h1408 :  // <0112> pop y // "
addr == 16'hbd ? 16'h1008 :  // <0112> pop x // "
addr == 16'hbe ? 16'h0c08 :  // <0112> pop j // "
addr == 16'hbf ? 16'h0808 :  // <0112> pop i // "
addr == 16'hc0 ? 16'hfc00 :  // <0112> rtn

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
addr == 16'hf3 ? 16'h0176 :  // <0079> "
addr == 16'hf4 ? 16'hfc00 :  // <0079> "

// command prompt loop.
// :cmd_loop // = 0x00f5
addr == 16'hf5 ? 16'hfba0 :  // <0083> call :dump_target
addr == 16'hf6 ? 16'h01ef :  // <0083> "
addr == 16'hf7 ? 16'hfc00 :  // <0083> "
addr == 16'hf8 ? 16'h0016 :  // <0084> a = tg_code_addr
addr == 16'hf9 ? 16'hfba0 :  // <0085> call :put4x
addr == 16'hfa ? 16'h0059 :  // <0085> "
addr == 16'hfb ? 16'hfc00 :  // <0085> "
addr == 16'hfc ? 16'h0220 :  // <0086> a = 32 // putasc " "
addr == 16'hfd ? 16'h0000 :  // <0086> a = a // putasc " "
addr == 16'hfe ? 16'hfba0 :  // <0086> putasc " "
addr == 16'hff ? 16'h0037 :  // <0086> "
addr == 16'h100 ? 16'hfc00 :  // <0086> "
addr == 16'h101 ? 16'h023e :  // <0087> a = 62 // putasc ">"
addr == 16'h102 ? 16'h0000 :  // <0087> a = a // putasc ">"
addr == 16'h103 ? 16'hfba0 :  // <0087> putasc ">"
addr == 16'h104 ? 16'h0037 :  // <0087> "
addr == 16'h105 ? 16'hfc00 :  // <0087> "
addr == 16'h106 ? 16'hfba0 :  // <0088> getchar
addr == 16'h107 ? 16'h0047 :  // <0088> "
addr == 16'h108 ? 16'hfc00 :  // <0088> "
addr == 16'h109 ? 16'h1000 :  // <0089> x = a
addr == 16'h10a ? 16'h0000 :  // <0090> a = a // putchar a
addr == 16'h10b ? 16'hfba0 :  // <0090> putchar a
addr == 16'h10c ? 16'h0037 :  // <0090> "
addr == 16'h10d ? 16'hfc00 :  // <0090> "
addr == 16'h10e ? 16'h020d :  // <0091> a = 13 // putasc "\r"
addr == 16'h10f ? 16'h0000 :  // <0091> a = a // putasc "\r"
addr == 16'h110 ? 16'hfba0 :  // <0091> putasc "\r"
addr == 16'h111 ? 16'h0037 :  // <0091> "
addr == 16'h112 ? 16'hfc00 :  // <0091> "
addr == 16'h113 ? 16'h020a :  // <0092> a = 10 // putasc "\n"
addr == 16'h114 ? 16'h0000 :  // <0092> a = a // putasc "\n"
addr == 16'h115 ? 16'hfba0 :  // <0092> putasc "\n"
addr == 16'h116 ? 16'h0037 :  // <0092> "
addr == 16'h117 ? 16'hfc00 :  // <0092> "
addr == 16'h118 ? 16'h0004 :  // <0093> a = x

// command = step next instruction.
addr == 16'h119 ? 16'h066e :  // <0096> b = 110 // asc b = "n"
addr == 16'h11a ? 16'hc800 :  // <0097> nop
addr == 16'h11b ? 16'he407 :  // <0098> bn eq :skip_step
addr == 16'h11c ? 16'h0124 :  // <0098> "
addr == 16'h11d ? 16'h3e08 :  // <0099> bus_ctrl = $bp_step_mask
addr == 16'h11e ? 16'h2409 :  // <0100> bp0_addr = bp0_addr
addr == 16'h11f ? 16'hfba0 :  // <0101> call :wait_for_bp
addr == 16'h120 ? 16'h0176 :  // <0101> "
addr == 16'h121 ? 16'hfc00 :  // <0101> "
addr == 16'h122 ? 16'he00f :  // <0102> jmp :cmd_loop
addr == 16'h123 ? 16'h00f5 :  // <0102> "
// :skip_step // = 0x0124

// command = reset target.
addr == 16'h124 ? 16'h0652 :  // <0106> b = 82 // asc b = "R"
addr == 16'h125 ? 16'hc800 :  // <0107> nop
addr == 16'h126 ? 16'he407 :  // <0108> bn eq :skip_reset
addr == 16'h127 ? 16'h0131 :  // <0108> "
addr == 16'h128 ? 16'h3e02 :  // <0109> bus_ctrl = $tg_reset_mask
addr == 16'h129 ? 16'hc800 :  // <0110> nop
addr == 16'h12a ? 16'hc800 :  // <0111> nop
addr == 16'h12b ? 16'h3e08 :  // <0112> bus_ctrl = $bp_step_mask
addr == 16'h12c ? 16'hfba0 :  // <0113> call :wait_for_bp
addr == 16'h12d ? 16'h0176 :  // <0113> "
addr == 16'h12e ? 16'hfc00 :  // <0113> "
addr == 16'h12f ? 16'he00f :  // <0114> jmp :cmd_loop
addr == 16'h130 ? 16'h00f5 :  // <0114> "
// :skip_reset // = 0x0131

// command = load program.
addr == 16'h131 ? 16'h066c :  // <0118> b = 108 // asc b = "l"
addr == 16'h132 ? 16'hc800 :  // <0119> nop
addr == 16'h133 ? 16'he407 :  // <0120> bn eq :skip_load
addr == 16'h134 ? 16'h013a :  // <0120> "
addr == 16'h135 ? 16'hfba0 :  // <0121> call :load_program
addr == 16'h136 ? 16'h017c :  // <0121> "
addr == 16'h137 ? 16'hfc00 :  // <0121> "
addr == 16'h138 ? 16'he00f :  // <0122> jmp :cmd_loop
addr == 16'h139 ? 16'h00f5 :  // <0122> "
// :skip_load // = 0x013a

// command = run full speed.
addr == 16'h13a ? 16'h0672 :  // <0126> b = 114 // asc b = "r"
addr == 16'h13b ? 16'hc800 :  // <0127> nop
addr == 16'h13c ? 16'he407 :  // <0128> bn eq :skip_run
addr == 16'h13d ? 16'h0141 :  // <0128> "
// release target reset, to run.
addr == 16'h13e ? 16'h3e00 :  // <0130> bus_ctrl = 0
addr == 16'h13f ? 16'he00f :  // <0131> jmp :cmd_loop
addr == 16'h140 ? 16'h00f5 :  // <0131> "
// :skip_run // = 0x0141

// command = interrupt / break target.
addr == 16'h141 ? 16'h0669 :  // <0135> b = 105 // asc b = "i"
addr == 16'h142 ? 16'hc800 :  // <0136> nop
addr == 16'h143 ? 16'he407 :  // <0137> bn eq :skip_brk
addr == 16'h144 ? 16'h014c :  // <0137> "
addr == 16'h145 ? 16'h3e00 :  // <0138> bus_ctrl = 0
addr == 16'h146 ? 16'h3e08 :  // <0139> bus_ctrl = $bp_step_mask
addr == 16'h147 ? 16'hfba0 :  // <0140> call :wait_for_bp
addr == 16'h148 ? 16'h0176 :  // <0140> "
addr == 16'h149 ? 16'hfc00 :  // <0140> "
addr == 16'h14a ? 16'he00f :  // <0141> jmp :cmd_loop
addr == 16'h14b ? 16'h00f5 :  // <0141> "
// :skip_brk // = 0x014c

addr == 16'h14c ? 16'h023f :  // <0144> a = 63 // putasc "?"
addr == 16'h14d ? 16'h0000 :  // <0144> a = a // putasc "?"
addr == 16'h14e ? 16'hfba0 :  // <0144> putasc "?"
addr == 16'h14f ? 16'h0037 :  // <0144> "
addr == 16'h150 ? 16'hfc00 :  // <0144> "
addr == 16'h151 ? 16'h020d :  // <0145> a = 13 // putasc "\r"
addr == 16'h152 ? 16'h0000 :  // <0145> a = a // putasc "\r"
addr == 16'h153 ? 16'hfba0 :  // <0145> putasc "\r"
addr == 16'h154 ? 16'h0037 :  // <0145> "
addr == 16'h155 ? 16'hfc00 :  // <0145> "
addr == 16'h156 ? 16'h020a :  // <0146> a = 10 // putasc "\n"
addr == 16'h157 ? 16'h0000 :  // <0146> a = a // putasc "\n"
addr == 16'h158 ? 16'hfba0 :  // <0146> putasc "\n"
addr == 16'h159 ? 16'h0037 :  // <0146> "
addr == 16'h15a ? 16'hfc00 :  // <0146> "
addr == 16'h15b ? 16'he00f :  // <0147> jmp :cmd_loop
addr == 16'h15c ? 16'h00f5 :  // <0147> "

// demonstrations //////////////////////////////

// set a breakpoint, wait til it hits.
addr == 16'h15d ? 16'h2615 :  // <0152> bp0_addr = 0x15
// :main_loop // = 0x015e
addr == 16'h15e ? 16'hfba0 :  // <0154> call :wait_for_bp
addr == 16'h15f ? 16'h0176 :  // <0154> "
addr == 16'h160 ? 16'hfc00 :  // <0154> "

// release target to run full speed.
addr == 16'h161 ? 16'h3e00 :  // <0157> bus_ctrl = 0

// interrupt the target and single step it a few times.
addr == 16'h162 ? 16'h3e08 :  // <0160> bus_ctrl = $bp_step_mask
addr == 16'h163 ? 16'hfba0 :  // <0161> call :wait_for_bp
addr == 16'h164 ? 16'h0176 :  // <0161> "
addr == 16'h165 ? 16'hfc00 :  // <0161> "
addr == 16'h166 ? 16'h2409 :  // <0162> bp0_addr = bp0_addr
addr == 16'h167 ? 16'hfba0 :  // <0163> call :wait_for_bp
addr == 16'h168 ? 16'h0176 :  // <0163> "
addr == 16'h169 ? 16'hfc00 :  // <0163> "
addr == 16'h16a ? 16'h2409 :  // <0164> bp0_addr = bp0_addr
addr == 16'h16b ? 16'hfba0 :  // <0165> call :wait_for_bp
addr == 16'h16c ? 16'h0176 :  // <0165> "
addr == 16'h16d ? 16'hfc00 :  // <0165> "
addr == 16'h16e ? 16'h2409 :  // <0166> bp0_addr = bp0_addr
addr == 16'h16f ? 16'hfba0 :  // <0167> call :wait_for_bp
addr == 16'h170 ? 16'h0176 :  // <0167> "
addr == 16'h171 ? 16'hfc00 :  // <0167> "
addr == 16'h172 ? 16'h3e00 :  // <0168> bus_ctrl = 0

// release target to pass breakpoint once.
addr == 16'h173 ? 16'h2409 :  // <0171> bp0_addr = bp0_addr

addr == 16'h174 ? 16'he00f :  // <0173> jmp :main_loop
addr == 16'h175 ? 16'h015e :  // <0173> "

// func wait_for_bp // = 0x0176
addr == 16'h176 ? 16'h0200 :  // <0176> a = 0
addr == 16'h177 ? 16'h0418 :  // <0177> b = bp_status
addr == 16'h178 ? 16'hc800 :  // <0178> nop
addr == 16'h179 ? 16'he004 :  // <0179> br z :wait_for_bp
addr == 16'h17a ? 16'h0176 :  // <0179> "
addr == 16'h17b ? 16'hfc00 :  // <0180> rtn

// func load_program // = 0x017c
addr == 16'h17c ? 16'h2002 :  // <0182> push i // func load_program
addr == 16'h17d ? 16'h2003 :  // <0182> push j // "
addr == 16'h17e ? 16'h2004 :  // <0182> push x // "
addr == 16'h17f ? 16'h2006 :  // <0182> push g6 // "
addr == 16'h180 ? 16'h203e :  // <0182> push rtna // "
// load target program from UART.
// length, little-endian.  memorize in x.
addr == 16'h181 ? 16'h024c :  // <0185> a = 76 // putasc L
addr == 16'h182 ? 16'h0000 :  // <0185> a = a // putasc L
addr == 16'h183 ? 16'hfba0 :  // <0185> putasc L
addr == 16'h184 ? 16'h0037 :  // <0185> "
addr == 16'h185 ? 16'hfc00 :  // <0185> "
addr == 16'h186 ? 16'hfba0 :  // <0186> get16 x
addr == 16'h187 ? 16'h0047 :  // <0186> "
addr == 16'h188 ? 16'hfc00 :  // <0186> "
addr == 16'h189 ? 16'h2000 :  // <0186> push a // "
addr == 16'h18a ? 16'hfba0 :  // <0186> "
addr == 16'h18b ? 16'h0047 :  // <0186> "
addr == 16'h18c ? 16'hfc00 :  // <0186> "
addr == 16'h18d ? 16'h0352 :  // <0186> "
addr == 16'h18e ? 16'h0352 :  // <0186> "
addr == 16'h18f ? 16'h0408 :  // <0186> pop b // "
addr == 16'h190 ? 16'hc800 :  // <0186> "
addr == 16'h191 ? 16'h1334 :  // <0186> "
addr == 16'h192 ? 16'h0004 :  // <0187> a = x
addr == 16'h193 ? 16'hfba0 :  // <0188> call put4x
addr == 16'h194 ? 16'h0059 :  // <0188> "
addr == 16'h195 ? 16'hfc00 :  // <0188> "
// put target into reset again, in case this is a target warm boot.
addr == 16'h196 ? 16'h3e02 :  // <0190> bus_ctrl = $tg_reset_mask
// load opcodes.  count up address in i.
addr == 16'h197 ? 16'h0a00 :  // <0192> i = 0
addr == 16'h198 ? 16'h0e01 :  // <0193> j = 1
// :loadword // = 0x0199
addr == 16'h199 ? 16'h0241 :  // <0195> a = 65 // putasc A
addr == 16'h19a ? 16'h0000 :  // <0195> a = a // putasc A
addr == 16'h19b ? 16'hfba0 :  // <0195> putasc A
addr == 16'h19c ? 16'h0037 :  // <0195> "
addr == 16'h19d ? 16'hfc00 :  // <0195> "
addr == 16'h19e ? 16'h0002 :  // <0196> a = i
addr == 16'h19f ? 16'hfba0 :  // <0197> call put4x
addr == 16'h1a0 ? 16'h0059 :  // <0197> "
addr == 16'h1a1 ? 16'hfc00 :  // <0197> "
addr == 16'h1a2 ? 16'h023d :  // <0198> a = 61 // putasc "="
addr == 16'h1a3 ? 16'h0000 :  // <0198> a = a // putasc "="
addr == 16'h1a4 ? 16'hfba0 :  // <0198> putasc "="
addr == 16'h1a5 ? 16'h0037 :  // <0198> "
addr == 16'h1a6 ? 16'hfc00 :  // <0198> "
addr == 16'h1a7 ? 16'hfba0 :  // <0199> get16 g6
addr == 16'h1a8 ? 16'h0047 :  // <0199> "
addr == 16'h1a9 ? 16'hfc00 :  // <0199> "
addr == 16'h1aa ? 16'h2000 :  // <0199> push a // "
addr == 16'h1ab ? 16'hfba0 :  // <0199> "
addr == 16'h1ac ? 16'h0047 :  // <0199> "
addr == 16'h1ad ? 16'hfc00 :  // <0199> "
addr == 16'h1ae ? 16'h0352 :  // <0199> "
addr == 16'h1af ? 16'h0352 :  // <0199> "
addr == 16'h1b0 ? 16'h0408 :  // <0199> pop b // "
addr == 16'h1b1 ? 16'hc800 :  // <0199> "
addr == 16'h1b2 ? 16'h1b34 :  // <0199> "
addr == 16'h1b3 ? 16'h0006 :  // <0200> a = g6
addr == 16'h1b4 ? 16'hfba0 :  // <0201> call put4x
addr == 16'h1b5 ? 16'h0059 :  // <0201> "
addr == 16'h1b6 ? 16'hfc00 :  // <0201> "
addr == 16'h1b7 ? 16'h023d :  // <0202> a = 61 // putasc "="
addr == 16'h1b8 ? 16'h0000 :  // <0202> a = a // putasc "="
addr == 16'h1b9 ? 16'hfba0 :  // <0202> putasc "="
addr == 16'h1ba ? 16'h0037 :  // <0202> "
addr == 16'h1bb ? 16'hfc00 :  // <0202> "
addr == 16'h1bc ? 16'h4c02 :  // <0203> m9k_addr = i
addr == 16'h1bd ? 16'h5006 :  // <0204> m9k_data = g6
addr == 16'h1be ? 16'h0014 :  // <0205> a = m9k_data
addr == 16'h1bf ? 16'hfba0 :  // <0206> call put4x
addr == 16'h1c0 ? 16'h0059 :  // <0206> "
addr == 16'h1c1 ? 16'hfc00 :  // <0206> "
addr == 16'h1c2 ? 16'h020d :  // <0207> a = 13 // putasc "\r"
addr == 16'h1c3 ? 16'h0000 :  // <0207> a = a // putasc "\r"
addr == 16'h1c4 ? 16'hfba0 :  // <0207> putasc "\r"
addr == 16'h1c5 ? 16'h0037 :  // <0207> "
addr == 16'h1c6 ? 16'hfc00 :  // <0207> "
addr == 16'h1c7 ? 16'h020a :  // <0208> a = 10 // putasc "\n"
addr == 16'h1c8 ? 16'h0000 :  // <0208> a = a // putasc "\n"
addr == 16'h1c9 ? 16'hfba0 :  // <0208> putasc "\n"
addr == 16'h1ca ? 16'h0037 :  // <0208> "
addr == 16'h1cb ? 16'hfc00 :  // <0208> "
addr == 16'h1cc ? 16'h0b10 :  // <0209> i = i+j
addr == 16'h1cd ? 16'h0002 :  // <0210> a = i
addr == 16'h1ce ? 16'h0404 :  // <0211> b = x
addr == 16'h1cf ? 16'hc800 :  // <0212> nop
addr == 16'h1d0 ? 16'he407 :  // <0213> bn eq :loadword
addr == 16'h1d1 ? 16'h0199 :  // <0213> "

// observe a register.  return its value in peek_data.
// pass its register address in a.
// func peek // = 0x01d2
addr == 16'h1d2 ? 16'h3e04 :  // <0218> bus_ctrl = $divert_code_bus_mask
addr == 16'h1d3 ? 16'h4201 :  // <0219> tg_force = $hold_state_mask
addr == 16'h1d4 ? 16'h07a0 :  // <0220> b = ([label observe])
addr == 16'h1d5 ? 16'h01df :  // <0220> "
addr == 16'h1d6 ? 16'hc800 :  // <0221> nop
addr == 16'h1d7 ? 16'hd300 :  // <0222> fetch force_opcode from a+b
addr == 16'h1d8 ? 16'h37b0 :  // <0222> "
addr == 16'h1d9 ? 16'h4203 :  // <0223> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h1da ? 16'h4205 :  // <0224> tg_force = ($hold_state_mask | $force_exec_mask)
addr == 16'h1db ? 16'h4201 :  // <0225> tg_force = $hold_state_mask
// target's register value is now in peek_data.
// refill target exr so it can resume seamlessly.
addr == 16'h1dc ? 16'h3415 :  // <0228> force_opcode = exr_shadow
addr == 16'h1dd ? 16'h4203 :  // <0229> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h1de ? 16'h4200 :  // <0230> tg_force = 0
addr == 16'h1df ? 16'hfc00 :  // <0231> rtn

// :observe // = 0x01e0
// these instructions are assembled in the visor program, but passed to the target to execute.
addr == 16'h1e0 ? 16'h7c00 :  // <0236> debug_peek_reg = r0
addr == 16'h1e1 ? 16'h7c01 :  // <0237> debug_peek_reg = r1
addr == 16'h1e2 ? 16'h7c02 :  // <0238> debug_peek_reg = r2
addr == 16'h1e3 ? 16'h7c03 :  // <0239> debug_peek_reg = r3
addr == 16'h1e4 ? 16'h7c04 :  // <0240> debug_peek_reg = r4
addr == 16'h1e5 ? 16'h7c05 :  // <0241> debug_peek_reg = r5
addr == 16'h1e6 ? 16'h7c06 :  // <0242> debug_peek_reg = r6
addr == 16'h1e7 ? 16'h7c07 :  // <0243> debug_peek_reg = r7
addr == 16'h1e8 ? 16'h7c08 :  // <0244> debug_peek_reg = r8
addr == 16'h1e9 ? 16'h7c09 :  // <0245> debug_peek_reg = r9
addr == 16'h1ea ? 16'h7c0a :  // <0246> debug_peek_reg = r10
addr == 16'h1eb ? 16'h7c0b :  // <0247> debug_peek_reg = r11
addr == 16'h1ec ? 16'h7c0c :  // <0248> debug_peek_reg = r12
addr == 16'h1ed ? 16'h7c0d :  // <0249> debug_peek_reg = r13
addr == 16'h1ee ? 16'h7c0e :  // <0250> debug_peek_reg = r14
addr == 16'h1ef ? 16'h7c0f :  // <0251> debug_peek_reg = r15

// show target status display.
// func dump_target // = 0x01f0
addr == 16'h1f0 ? 16'h203e :  // <0254> push rtna // func dump_target
addr == 16'h1f1 ? 16'h020d :  // <0255> a = 13 // putasc "\r"
addr == 16'h1f2 ? 16'h0000 :  // <0255> a = a // putasc "\r"
addr == 16'h1f3 ? 16'hfba0 :  // <0255> putasc "\r"
addr == 16'h1f4 ? 16'h0037 :  // <0255> "
addr == 16'h1f5 ? 16'hfc00 :  // <0255> "
addr == 16'h1f6 ? 16'h020a :  // <0256> a = 10 // putasc "\n"
addr == 16'h1f7 ? 16'h0000 :  // <0256> a = a // putasc "\n"
addr == 16'h1f8 ? 16'hfba0 :  // <0256> putasc "\n"
addr == 16'h1f9 ? 16'h0037 :  // <0256> "
addr == 16'h1fa ? 16'hfc00 :  // <0256> "
addr == 16'h1fb ? 16'h0200 :  // <0257> a = 0
addr == 16'h1fc ? 16'hfba0 :  // <0258> call :peek
addr == 16'h1fd ? 16'h01d2 :  // <0258> "
addr == 16'h1fe ? 16'hfc00 :  // <0258> "
addr == 16'h1ff ? 16'h0261 :  // <0259> a = 97 // putasc "a"
addr == 16'h200 ? 16'h0000 :  // <0259> a = a // putasc "a"
addr == 16'h201 ? 16'hfba0 :  // <0259> putasc "a"
addr == 16'h202 ? 16'h0037 :  // <0259> "
addr == 16'h203 ? 16'hfc00 :  // <0259> "
addr == 16'h204 ? 16'h023d :  // <0260> a = 61 // putasc "="
addr == 16'h205 ? 16'h0000 :  // <0260> a = a // putasc "="
addr == 16'h206 ? 16'hfba0 :  // <0260> putasc "="
addr == 16'h207 ? 16'h0037 :  // <0260> "
addr == 16'h208 ? 16'hfc00 :  // <0260> "
addr == 16'h209 ? 16'h0017 :  // <0261> a = peek_data
addr == 16'h20a ? 16'hfba0 :  // <0262> call :put4x
addr == 16'h20b ? 16'h0059 :  // <0262> "
addr == 16'h20c ? 16'hfc00 :  // <0262> "
addr == 16'h20d ? 16'h0220 :  // <0263> a = 32 // putasc " "
addr == 16'h20e ? 16'h0000 :  // <0263> a = a // putasc " "
addr == 16'h20f ? 16'hfba0 :  // <0263> putasc " "
addr == 16'h210 ? 16'h0037 :  // <0263> "
addr == 16'h211 ? 16'hfc00 :  // <0263> "
addr == 16'h212 ? 16'h0201 :  // <0264> a = 1
addr == 16'h213 ? 16'hfba0 :  // <0265> call :peek
addr == 16'h214 ? 16'h01d2 :  // <0265> "
addr == 16'h215 ? 16'hfc00 :  // <0265> "
addr == 16'h216 ? 16'h0262 :  // <0266> a = 98 // putasc "b"
addr == 16'h217 ? 16'h0000 :  // <0266> a = a // putasc "b"
addr == 16'h218 ? 16'hfba0 :  // <0266> putasc "b"
addr == 16'h219 ? 16'h0037 :  // <0266> "
addr == 16'h21a ? 16'hfc00 :  // <0266> "
addr == 16'h21b ? 16'h023d :  // <0267> a = 61 // putasc "="
addr == 16'h21c ? 16'h0000 :  // <0267> a = a // putasc "="
addr == 16'h21d ? 16'hfba0 :  // <0267> putasc "="
addr == 16'h21e ? 16'h0037 :  // <0267> "
addr == 16'h21f ? 16'hfc00 :  // <0267> "
addr == 16'h220 ? 16'h0017 :  // <0268> a = peek_data
addr == 16'h221 ? 16'hfba0 :  // <0269> call :put4x
addr == 16'h222 ? 16'h0059 :  // <0269> "
addr == 16'h223 ? 16'hfc00 :  // <0269> "
addr == 16'h224 ? 16'h0220 :  // <0270> a = 32 // putasc " "
addr == 16'h225 ? 16'h0000 :  // <0270> a = a // putasc " "
addr == 16'h226 ? 16'hfba0 :  // <0270> putasc " "
addr == 16'h227 ? 16'h0037 :  // <0270> "
addr == 16'h228 ? 16'hfc00 :  // <0270> "
addr == 16'h229 ? 16'h0202 :  // <0271> a = 2
addr == 16'h22a ? 16'hfba0 :  // <0272> call :peek
addr == 16'h22b ? 16'h01d2 :  // <0272> "
addr == 16'h22c ? 16'hfc00 :  // <0272> "
addr == 16'h22d ? 16'h0269 :  // <0273> a = 105 // putasc "i"
addr == 16'h22e ? 16'h0000 :  // <0273> a = a // putasc "i"
addr == 16'h22f ? 16'hfba0 :  // <0273> putasc "i"
addr == 16'h230 ? 16'h0037 :  // <0273> "
addr == 16'h231 ? 16'hfc00 :  // <0273> "
addr == 16'h232 ? 16'h023d :  // <0274> a = 61 // putasc "="
addr == 16'h233 ? 16'h0000 :  // <0274> a = a // putasc "="
addr == 16'h234 ? 16'hfba0 :  // <0274> putasc "="
addr == 16'h235 ? 16'h0037 :  // <0274> "
addr == 16'h236 ? 16'hfc00 :  // <0274> "
addr == 16'h237 ? 16'h0017 :  // <0275> a = peek_data
addr == 16'h238 ? 16'hfba0 :  // <0276> call :put4x
addr == 16'h239 ? 16'h0059 :  // <0276> "
addr == 16'h23a ? 16'hfc00 :  // <0276> "
addr == 16'h23b ? 16'h0220 :  // <0277> a = 32 // putasc " "
addr == 16'h23c ? 16'h0000 :  // <0277> a = a // putasc " "
addr == 16'h23d ? 16'hfba0 :  // <0277> putasc " "
addr == 16'h23e ? 16'h0037 :  // <0277> "
addr == 16'h23f ? 16'hfc00 :  // <0277> "
addr == 16'h240 ? 16'h0203 :  // <0278> a = 3
addr == 16'h241 ? 16'hfba0 :  // <0279> call :peek
addr == 16'h242 ? 16'h01d2 :  // <0279> "
addr == 16'h243 ? 16'hfc00 :  // <0279> "
addr == 16'h244 ? 16'h026a :  // <0280> a = 106 // putasc "j"
addr == 16'h245 ? 16'h0000 :  // <0280> a = a // putasc "j"
addr == 16'h246 ? 16'hfba0 :  // <0280> putasc "j"
addr == 16'h247 ? 16'h0037 :  // <0280> "
addr == 16'h248 ? 16'hfc00 :  // <0280> "
addr == 16'h249 ? 16'h023d :  // <0281> a = 61 // putasc "="
addr == 16'h24a ? 16'h0000 :  // <0281> a = a // putasc "="
addr == 16'h24b ? 16'hfba0 :  // <0281> putasc "="
addr == 16'h24c ? 16'h0037 :  // <0281> "
addr == 16'h24d ? 16'hfc00 :  // <0281> "
addr == 16'h24e ? 16'h0017 :  // <0282> a = peek_data
addr == 16'h24f ? 16'hfba0 :  // <0283> call :put4x
addr == 16'h250 ? 16'h0059 :  // <0283> "
addr == 16'h251 ? 16'hfc00 :  // <0283> "
addr == 16'h252 ? 16'h020d :  // <0284> a = 13 // putasc "\r"
addr == 16'h253 ? 16'h0000 :  // <0284> a = a // putasc "\r"
addr == 16'h254 ? 16'hfba0 :  // <0284> putasc "\r"
addr == 16'h255 ? 16'h0037 :  // <0284> "
addr == 16'h256 ? 16'hfc00 :  // <0284> "
addr == 16'h257 ? 16'h020a :  // <0285> a = 10 // putasc "\n"
addr == 16'h258 ? 16'h0000 :  // <0285> a = a // putasc "\n"
addr == 16'h259 ? 16'hfba0 :  // <0285> putasc "\n"
addr == 16'h25a ? 16'h0037 :  // <0285> "
addr == 16'h25b ? 16'hfc00 :  // <0285> "
addr == 16'h25c ? 16'h0204 :  // <0286> a = 4
addr == 16'h25d ? 16'hfba0 :  // <0287> call :peek
addr == 16'h25e ? 16'h01d2 :  // <0287> "
addr == 16'h25f ? 16'hfc00 :  // <0287> "
addr == 16'h260 ? 16'h0278 :  // <0288> a = 120 // putasc "x"
addr == 16'h261 ? 16'h0000 :  // <0288> a = a // putasc "x"
addr == 16'h262 ? 16'hfba0 :  // <0288> putasc "x"
addr == 16'h263 ? 16'h0037 :  // <0288> "
addr == 16'h264 ? 16'hfc00 :  // <0288> "
addr == 16'h265 ? 16'h023d :  // <0289> a = 61 // putasc "="
addr == 16'h266 ? 16'h0000 :  // <0289> a = a // putasc "="
addr == 16'h267 ? 16'hfba0 :  // <0289> putasc "="
addr == 16'h268 ? 16'h0037 :  // <0289> "
addr == 16'h269 ? 16'hfc00 :  // <0289> "
addr == 16'h26a ? 16'h0017 :  // <0290> a = peek_data
addr == 16'h26b ? 16'hfba0 :  // <0291> call :put4x
addr == 16'h26c ? 16'h0059 :  // <0291> "
addr == 16'h26d ? 16'hfc00 :  // <0291> "
addr == 16'h26e ? 16'h0220 :  // <0292> a = 32 // putasc " "
addr == 16'h26f ? 16'h0000 :  // <0292> a = a // putasc " "
addr == 16'h270 ? 16'hfba0 :  // <0292> putasc " "
addr == 16'h271 ? 16'h0037 :  // <0292> "
addr == 16'h272 ? 16'hfc00 :  // <0292> "
addr == 16'h273 ? 16'h0205 :  // <0293> a = 5
addr == 16'h274 ? 16'hfba0 :  // <0294> call :peek
addr == 16'h275 ? 16'h01d2 :  // <0294> "
addr == 16'h276 ? 16'hfc00 :  // <0294> "
addr == 16'h277 ? 16'h0279 :  // <0295> a = 121 // putasc "y"
addr == 16'h278 ? 16'h0000 :  // <0295> a = a // putasc "y"
addr == 16'h279 ? 16'hfba0 :  // <0295> putasc "y"
addr == 16'h27a ? 16'h0037 :  // <0295> "
addr == 16'h27b ? 16'hfc00 :  // <0295> "
addr == 16'h27c ? 16'h023d :  // <0296> a = 61 // putasc "="
addr == 16'h27d ? 16'h0000 :  // <0296> a = a // putasc "="
addr == 16'h27e ? 16'hfba0 :  // <0296> putasc "="
addr == 16'h27f ? 16'h0037 :  // <0296> "
addr == 16'h280 ? 16'hfc00 :  // <0296> "
addr == 16'h281 ? 16'h0017 :  // <0297> a = peek_data
addr == 16'h282 ? 16'hfba0 :  // <0298> call :put4x
addr == 16'h283 ? 16'h0059 :  // <0298> "
addr == 16'h284 ? 16'hfc00 :  // <0298> "
addr == 16'h285 ? 16'h0220 :  // <0299> a = 32 // putasc " "
addr == 16'h286 ? 16'h0000 :  // <0299> a = a // putasc " "
addr == 16'h287 ? 16'hfba0 :  // <0299> putasc " "
addr == 16'h288 ? 16'h0037 :  // <0299> "
addr == 16'h289 ? 16'hfc00 :  // <0299> "
addr == 16'h28a ? 16'h0206 :  // <0300> a = 6
addr == 16'h28b ? 16'hfba0 :  // <0301> call :peek
addr == 16'h28c ? 16'h01d2 :  // <0301> "
addr == 16'h28d ? 16'hfc00 :  // <0301> "
addr == 16'h28e ? 16'h0236 :  // <0302> a = 54 // putasc "6"
addr == 16'h28f ? 16'h0000 :  // <0302> a = a // putasc "6"
addr == 16'h290 ? 16'hfba0 :  // <0302> putasc "6"
addr == 16'h291 ? 16'h0037 :  // <0302> "
addr == 16'h292 ? 16'hfc00 :  // <0302> "
addr == 16'h293 ? 16'h023d :  // <0303> a = 61 // putasc "="
addr == 16'h294 ? 16'h0000 :  // <0303> a = a // putasc "="
addr == 16'h295 ? 16'hfba0 :  // <0303> putasc "="
addr == 16'h296 ? 16'h0037 :  // <0303> "
addr == 16'h297 ? 16'hfc00 :  // <0303> "
addr == 16'h298 ? 16'h0017 :  // <0304> a = peek_data
addr == 16'h299 ? 16'hfba0 :  // <0305> call :put4x
addr == 16'h29a ? 16'h0059 :  // <0305> "
addr == 16'h29b ? 16'hfc00 :  // <0305> "
addr == 16'h29c ? 16'h0220 :  // <0306> a = 32 // putasc " "
addr == 16'h29d ? 16'h0000 :  // <0306> a = a // putasc " "
addr == 16'h29e ? 16'hfba0 :  // <0306> putasc " "
addr == 16'h29f ? 16'h0037 :  // <0306> "
addr == 16'h2a0 ? 16'hfc00 :  // <0306> "
addr == 16'h2a1 ? 16'h0207 :  // <0307> a = 7
addr == 16'h2a2 ? 16'hfba0 :  // <0308> call :peek
addr == 16'h2a3 ? 16'h01d2 :  // <0308> "
addr == 16'h2a4 ? 16'hfc00 :  // <0308> "
addr == 16'h2a5 ? 16'h0237 :  // <0309> a = 55 // putasc "7"
addr == 16'h2a6 ? 16'h0000 :  // <0309> a = a // putasc "7"
addr == 16'h2a7 ? 16'hfba0 :  // <0309> putasc "7"
addr == 16'h2a8 ? 16'h0037 :  // <0309> "
addr == 16'h2a9 ? 16'hfc00 :  // <0309> "
addr == 16'h2aa ? 16'h023d :  // <0310> a = 61 // putasc "="
addr == 16'h2ab ? 16'h0000 :  // <0310> a = a // putasc "="
addr == 16'h2ac ? 16'hfba0 :  // <0310> putasc "="
addr == 16'h2ad ? 16'h0037 :  // <0310> "
addr == 16'h2ae ? 16'hfc00 :  // <0310> "
addr == 16'h2af ? 16'h0017 :  // <0311> a = peek_data
addr == 16'h2b0 ? 16'hfba0 :  // <0312> call :put4x
addr == 16'h2b1 ? 16'h0059 :  // <0312> "
addr == 16'h2b2 ? 16'hfc00 :  // <0312> "
addr == 16'h2b3 ? 16'h020d :  // <0313> a = 13 // putasc "\r"
addr == 16'h2b4 ? 16'h0000 :  // <0313> a = a // putasc "\r"
addr == 16'h2b5 ? 16'hfba0 :  // <0313> putasc "\r"
addr == 16'h2b6 ? 16'h0037 :  // <0313> "
addr == 16'h2b7 ? 16'hfc00 :  // <0313> "
addr == 16'h2b8 ? 16'h020a :  // <0314> a = 10 // putasc "\n"
addr == 16'h2b9 ? 16'h0000 :  // <0314> a = a // putasc "\n"
addr == 16'h2ba ? 16'hfba0 :  // <0314> putasc "\n"
addr == 16'h2bb ? 16'h0037 :  // <0314> "
addr == 16'h2bc ? 16'hfc00 :  // <0314> "
addr == 16'h2bd ? 16'hf808 :  // <0315> pop rtna // rtn
addr == 16'h2be ? 16'hfc00 :  // <0315> rtn
        
                16'hxxxx;
        endmodule
    
