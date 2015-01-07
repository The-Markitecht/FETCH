
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
addr == 16'h01 ? 16'h00d9 :  // <0051> "


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
addr == 16'h51 ? 16'h3130 :  // <0051> 10
addr == 16'h52 ? 16'h3332 :  // <0051> 32
addr == 16'h53 ? 16'h3534 :  // <0051> 54
addr == 16'h54 ? 16'h3736 :  // <0051> 76
addr == 16'h55 ? 16'h3938 :  // <0051> 98
addr == 16'h56 ? 16'h6261 :  // <0051> ba
addr == 16'h57 ? 16'h6463 :  // <0051> dc
addr == 16'h58 ? 16'h6665 :  // <0051> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x0059
addr == 16'h59 ? 16'h2004 :  // <0055> push x // func put4x
addr == 16'h5a ? 16'h2006 :  // <0055> push g6 // "
addr == 16'h5b ? 16'h203e :  // <0055> push rtna // "
addr == 16'h5c ? 16'h13a0 :  // <0056> x = :hexdigits
addr == 16'h5d ? 16'h0051 :  // <0056> "

addr == 16'h5e ? 16'h1800 :  // <0058> g6 = a
addr == 16'h5f ? 16'h07a0 :  // <0059> b = 0xF000
addr == 16'h60 ? 16'hf000 :  // <0059> "
addr == 16'h61 ? 16'hc800 :  // <0060> nop
addr == 16'h62 ? 16'h0330 :  // <0061> a = and
addr == 16'h63 ? 16'h0353 :  // <0062> a = a>>4
addr == 16'h64 ? 16'h0353 :  // <0063> a = a>>4
addr == 16'h65 ? 16'h0353 :  // <0064> a = a>>4
addr == 16'h66 ? 16'hfba0 :  // <0065> call fetch_byte
addr == 16'h67 ? 16'h0002 :  // <0065> "
addr == 16'h68 ? 16'hfc00 :  // <0065> "
addr == 16'h69 ? 16'h0000 :  // <0066> a = a // putchar a
addr == 16'h6a ? 16'hfba0 :  // <0066> putchar a
addr == 16'h6b ? 16'h0037 :  // <0066> "
addr == 16'h6c ? 16'hfc00 :  // <0066> "

addr == 16'h6d ? 16'h0006 :  // <0068> a = g6
addr == 16'h6e ? 16'h07a0 :  // <0069> b = 0x0F00
addr == 16'h6f ? 16'h0f00 :  // <0069> "
addr == 16'h70 ? 16'hc800 :  // <0070> nop
addr == 16'h71 ? 16'h0330 :  // <0071> a = and
addr == 16'h72 ? 16'h0353 :  // <0072> a = a>>4
addr == 16'h73 ? 16'h0353 :  // <0073> a = a>>4
addr == 16'h74 ? 16'hfba0 :  // <0074> call fetch_byte
addr == 16'h75 ? 16'h0002 :  // <0074> "
addr == 16'h76 ? 16'hfc00 :  // <0074> "
addr == 16'h77 ? 16'h0000 :  // <0075> a = a // putchar a
addr == 16'h78 ? 16'hfba0 :  // <0075> putchar a
addr == 16'h79 ? 16'h0037 :  // <0075> "
addr == 16'h7a ? 16'hfc00 :  // <0075> "

addr == 16'h7b ? 16'h0006 :  // <0077> a = g6
addr == 16'h7c ? 16'h06f0 :  // <0078> b = 0x00F0
addr == 16'h7d ? 16'hc800 :  // <0079> nop
addr == 16'h7e ? 16'h0330 :  // <0080> a = and
addr == 16'h7f ? 16'h0353 :  // <0081> a = a>>4
addr == 16'h80 ? 16'hfba0 :  // <0082> call fetch_byte
addr == 16'h81 ? 16'h0002 :  // <0082> "
addr == 16'h82 ? 16'hfc00 :  // <0082> "
addr == 16'h83 ? 16'h0000 :  // <0083> a = a // putchar a
addr == 16'h84 ? 16'hfba0 :  // <0083> putchar a
addr == 16'h85 ? 16'h0037 :  // <0083> "
addr == 16'h86 ? 16'hfc00 :  // <0083> "

addr == 16'h87 ? 16'h0006 :  // <0085> a = g6
addr == 16'h88 ? 16'h060f :  // <0086> b = 0x000F
addr == 16'h89 ? 16'hc800 :  // <0087> nop
addr == 16'h8a ? 16'h0330 :  // <0088> a = and
addr == 16'h8b ? 16'hfba0 :  // <0089> call fetch_byte
addr == 16'h8c ? 16'h0002 :  // <0089> "
addr == 16'h8d ? 16'hfc00 :  // <0089> "
addr == 16'h8e ? 16'h0000 :  // <0090> a = a // putchar a
addr == 16'h8f ? 16'hfba0 :  // <0090> putchar a
addr == 16'h90 ? 16'h0037 :  // <0090> "
addr == 16'h91 ? 16'hfc00 :  // <0090> "

addr == 16'h92 ? 16'hf808 :  // <0092> pop rtna // rtn
addr == 16'h93 ? 16'h1808 :  // <0092> pop g6 // "
addr == 16'h94 ? 16'h1008 :  // <0092> pop x // "
addr == 16'h95 ? 16'hfc00 :  // <0092> rtn

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// func get4x // = 0x0096
addr == 16'h96 ? 16'h2002 :  // <0096> push i // func get4x
addr == 16'h97 ? 16'h2003 :  // <0096> push j // "
addr == 16'h98 ? 16'h2004 :  // <0096> push x // "
addr == 16'h99 ? 16'h2005 :  // <0096> push y // "
addr == 16'h9a ? 16'h203e :  // <0096> push rtna // "
// y = digit counter
// j = sum
addr == 16'h9b ? 16'h1604 :  // <0099> y = 4
// :again // = 0x009c
addr == 16'h9c ? 16'hfba0 :  // <0101> getchar
addr == 16'h9d ? 16'h0047 :  // <0101> "
addr == 16'h9e ? 16'hfc00 :  // <0101> "
addr == 16'h9f ? 16'h2000 :  // <0101> push a // "
addr == 16'ha0 ? 16'h0000 :  // <0101> a = a // "
addr == 16'ha1 ? 16'hfba0 :  // <0101> "
addr == 16'ha2 ? 16'h0037 :  // <0101> "
addr == 16'ha3 ? 16'hfc00 :  // <0101> "
addr == 16'ha4 ? 16'h0008 :  // <0101> pop a // "
addr == 16'ha5 ? 16'h13a0 :  // <0102> x = :hexdigits
addr == 16'ha6 ? 16'h0051 :  // <0102> "
addr == 16'ha7 ? 16'h0a10 :  // <0103> i = 16
addr == 16'ha8 ? 16'hfba0 :  // <0104> call :find_in_fetch
addr == 16'ha9 ? 16'h0017 :  // <0104> "
addr == 16'haa ? 16'hfc00 :  // <0104> "
addr == 16'hab ? 16'h0760 :  // <0105> b = -1
addr == 16'hac ? 16'he007 :  // <0106> br eq :fail
addr == 16'had ? 16'h00c0 :  // <0106> "
addr == 16'hae ? 16'h0400 :  // <0107> b = a
addr == 16'haf ? 16'h0003 :  // <0108> a = j
addr == 16'hb0 ? 16'h0352 :  // <0109> a = a<<4
addr == 16'hb1 ? 16'hc800 :  // <0110> nop
addr == 16'hb2 ? 16'h0f34 :  // <0111> j = or
addr == 16'hb3 ? 16'h1360 :  // <0112> x = -1
addr == 16'hb4 ? 16'hc800 :  // <0113> nop
addr == 16'hb5 ? 16'h1720 :  // <0114> y = x+y
addr == 16'hb6 ? 16'he400 :  // <0115> bn 2z :again
addr == 16'hb7 ? 16'h009c :  // <0115> "
addr == 16'hb8 ? 16'h0003 :  // <0116> a = j
addr == 16'hb9 ? 16'h0600 :  // <0117> b = 0
addr == 16'hba ? 16'hf808 :  // <0118> pop rtna // rtn
addr == 16'hbb ? 16'h1408 :  // <0118> pop y // "
addr == 16'hbc ? 16'h1008 :  // <0118> pop x // "
addr == 16'hbd ? 16'h0c08 :  // <0118> pop j // "
addr == 16'hbe ? 16'h0808 :  // <0118> pop i // "
addr == 16'hbf ? 16'hfc00 :  // <0118> rtn
// :fail // = 0x00c0
addr == 16'hc0 ? 16'h0760 :  // <0120> b = -1
addr == 16'hc1 ? 16'hf808 :  // <0121> pop rtna // rtn
addr == 16'hc2 ? 16'h1408 :  // <0121> pop y // "
addr == 16'hc3 ? 16'h1008 :  // <0121> pop x // "
addr == 16'hc4 ? 16'h0c08 :  // <0121> pop j // "
addr == 16'hc5 ? 16'h0808 :  // <0121> pop i // "
addr == 16'hc6 ? 16'hfc00 :  // <0121> rtn

// routine waits a number of milliseconds given in a.
// func spinwait // = 0x00c7
addr == 16'hc7 ? 16'h2004 :  // <0002> push x // func spinwait
addr == 16'hc8 ? 16'h2005 :  // <0002> push y // "
//patch
//return
addr == 16'hc9 ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x00ca
addr == 16'hca ? 16'h13a0 :  // <0007> x = 12500
addr == 16'hcb ? 16'h30d4 :  // <0007> "
addr == 16'hcc ? 16'h1760 :  // <0008> y = -1
addr == 16'hcd ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x00ce
addr == 16'hce ? 16'h1320 :  // <0011> x = x+y
addr == 16'hcf ? 16'hc800 :  // <0012> nop
addr == 16'hd0 ? 16'he400 :  // <0013> bn 2z :spinwait_inner
addr == 16'hd1 ? 16'h00ce :  // <0013> "
addr == 16'hd2 ? 16'h0300 :  // <0014> a = a+b
addr == 16'hd3 ? 16'hc800 :  // <0015> nop
addr == 16'hd4 ? 16'he404 :  // <0016> bn z :spinwait_outer
addr == 16'hd5 ? 16'h00ca :  // <0016> "
addr == 16'hd6 ? 16'h1408 :  // <0017> pop y // rtn
addr == 16'hd7 ? 16'h1008 :  // <0017> pop x // "
addr == 16'hd8 ? 16'hfc00 :  // <0017> rtn



// ////////////////////////////////////////////
// :main // = 0x00d9
// put target into reset.
addr == 16'hd9 ? 16'h3e02 :  // <0061> bus_ctrl = $tg_reset_mask

// init visor.
addr == 16'hda ? 16'h3360 :  // <0064> bp3_addr = $bp_disable
addr == 16'hdb ? 16'h2f60 :  // <0065> bp2_addr = $bp_disable
addr == 16'hdc ? 16'h2b60 :  // <0066> bp1_addr = $bp_disable
addr == 16'hdd ? 16'h2760 :  // <0067> bp0_addr = $bp_disable

addr == 16'hde ? 16'h0256 :  // <0069> a = 86 // putasc "V"
addr == 16'hdf ? 16'h0000 :  // <0069> a = a // putasc "V"
addr == 16'he0 ? 16'hfba0 :  // <0069> putasc "V"
addr == 16'he1 ? 16'h0037 :  // <0069> "
addr == 16'he2 ? 16'hfc00 :  // <0069> "
addr == 16'he3 ? 16'h0249 :  // <0070> a = 73 // putasc "I"
addr == 16'he4 ? 16'h0000 :  // <0070> a = a // putasc "I"
addr == 16'he5 ? 16'hfba0 :  // <0070> putasc "I"
addr == 16'he6 ? 16'h0037 :  // <0070> "
addr == 16'he7 ? 16'hfc00 :  // <0070> "
addr == 16'he8 ? 16'h0253 :  // <0071> a = 83 // putasc "S"
addr == 16'he9 ? 16'h0000 :  // <0071> a = a // putasc "S"
addr == 16'hea ? 16'hfba0 :  // <0071> putasc "S"
addr == 16'heb ? 16'h0037 :  // <0071> "
addr == 16'hec ? 16'hfc00 :  // <0071> "
addr == 16'hed ? 16'h024f :  // <0072> a = 79 // putasc "O"
addr == 16'hee ? 16'h0000 :  // <0072> a = a // putasc "O"
addr == 16'hef ? 16'hfba0 :  // <0072> putasc "O"
addr == 16'hf0 ? 16'h0037 :  // <0072> "
addr == 16'hf1 ? 16'hfc00 :  // <0072> "
addr == 16'hf2 ? 16'h0252 :  // <0073> a = 82 // putasc "R"
addr == 16'hf3 ? 16'h0000 :  // <0073> a = a // putasc "R"
addr == 16'hf4 ? 16'hfba0 :  // <0073> putasc "R"
addr == 16'hf5 ? 16'h0037 :  // <0073> "
addr == 16'hf6 ? 16'hfc00 :  // <0073> "

//call :load_program

// step into the first target instruction.
addr == 16'hf7 ? 16'h3e08 :  // <0078> bus_ctrl = $bp_step_mask
addr == 16'hf8 ? 16'hfba0 :  // <0079> call :wait_for_bp
addr == 16'hf9 ? 16'h0190 :  // <0079> "
addr == 16'hfa ? 16'hfc00 :  // <0079> "

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
// :cmd_loop // = 0x00fb
addr == 16'hfb ? 16'h000f :  // <0104> a = bus_ctrl
addr == 16'hfc ? 16'h0600 :  // <0105> b = 0
addr == 16'hfd ? 16'hc800 :  // <0106> nop
addr == 16'hfe ? 16'he007 :  // <0107> br eq :nodump
addr == 16'hff ? 16'h0112 :  // <0107> "
addr == 16'h100 ? 16'hfba0 :  // <0108> call :dump_target
addr == 16'h101 ? 16'h025f :  // <0108> "
addr == 16'h102 ? 16'hfc00 :  // <0108> "
addr == 16'h103 ? 16'h0016 :  // <0109> a = tg_code_addr
addr == 16'h104 ? 16'hfba0 :  // <0110> call :put4x
addr == 16'h105 ? 16'h0059 :  // <0110> "
addr == 16'h106 ? 16'hfc00 :  // <0110> "
addr == 16'h107 ? 16'h022c :  // <0111> a = 44 // putasc ","
addr == 16'h108 ? 16'h0000 :  // <0111> a = a // putasc ","
addr == 16'h109 ? 16'hfba0 :  // <0111> putasc ","
addr == 16'h10a ? 16'h0037 :  // <0111> "
addr == 16'h10b ? 16'hfc00 :  // <0111> "
addr == 16'h10c ? 16'h0015 :  // <0112> a = exr_shadow
addr == 16'h10d ? 16'hfba0 :  // <0113> call :put4x
addr == 16'h10e ? 16'h0059 :  // <0113> "
addr == 16'h10f ? 16'hfc00 :  // <0113> "
addr == 16'h110 ? 16'he00f :  // <0114> jmp :prompt_done
addr == 16'h111 ? 16'h0121 :  // <0114> "
// :nodump // = 0x0112
addr == 16'h112 ? 16'h0252 :  // <0116> a = 82 // putasc "R"
addr == 16'h113 ? 16'h0000 :  // <0116> a = a // putasc "R"
addr == 16'h114 ? 16'hfba0 :  // <0116> putasc "R"
addr == 16'h115 ? 16'h0037 :  // <0116> "
addr == 16'h116 ? 16'hfc00 :  // <0116> "
addr == 16'h117 ? 16'h0255 :  // <0117> a = 85 // putasc "U"
addr == 16'h118 ? 16'h0000 :  // <0117> a = a // putasc "U"
addr == 16'h119 ? 16'hfba0 :  // <0117> putasc "U"
addr == 16'h11a ? 16'h0037 :  // <0117> "
addr == 16'h11b ? 16'hfc00 :  // <0117> "
addr == 16'h11c ? 16'h024e :  // <0118> a = 78 // putasc "N"
addr == 16'h11d ? 16'h0000 :  // <0118> a = a // putasc "N"
addr == 16'h11e ? 16'hfba0 :  // <0118> putasc "N"
addr == 16'h11f ? 16'h0037 :  // <0118> "
addr == 16'h120 ? 16'hfc00 :  // <0118> "
// :prompt_done // = 0x0121
addr == 16'h121 ? 16'h0220 :  // <0120> a = 32 // putasc " "
addr == 16'h122 ? 16'h0000 :  // <0120> a = a // putasc " "
addr == 16'h123 ? 16'hfba0 :  // <0120> putasc " "
addr == 16'h124 ? 16'h0037 :  // <0120> "
addr == 16'h125 ? 16'hfc00 :  // <0120> "
addr == 16'h126 ? 16'h023e :  // <0121> a = 62 // putasc ">"
addr == 16'h127 ? 16'h0000 :  // <0121> a = a // putasc ">"
addr == 16'h128 ? 16'hfba0 :  // <0121> putasc ">"
addr == 16'h129 ? 16'h0037 :  // <0121> "
addr == 16'h12a ? 16'hfc00 :  // <0121> "
addr == 16'h12b ? 16'hfba0 :  // <0122> getchar
addr == 16'h12c ? 16'h0047 :  // <0122> "
addr == 16'h12d ? 16'hfc00 :  // <0122> "
addr == 16'h12e ? 16'h2000 :  // <0122> push a // "
addr == 16'h12f ? 16'h0000 :  // <0122> a = a // "
addr == 16'h130 ? 16'hfba0 :  // <0122> "
addr == 16'h131 ? 16'h0037 :  // <0122> "
addr == 16'h132 ? 16'hfc00 :  // <0122> "
addr == 16'h133 ? 16'h0008 :  // <0122> pop a // "

// command = step next instruction.
addr == 16'h134 ? 16'h066e :  // <0125> b = 110 // asc b = "n"
addr == 16'h135 ? 16'hc800 :  // <0126> nop
addr == 16'h136 ? 16'he407 :  // <0127> bn eq :skip_step
addr == 16'h137 ? 16'h013f :  // <0127> "
addr == 16'h138 ? 16'h3e08 :  // <0128> bus_ctrl = $bp_step_mask
addr == 16'h139 ? 16'h2409 :  // <0129> bp0_addr = bp0_addr
addr == 16'h13a ? 16'hfba0 :  // <0130> call :wait_for_bp
addr == 16'h13b ? 16'h0190 :  // <0130> "
addr == 16'h13c ? 16'hfc00 :  // <0130> "
addr == 16'h13d ? 16'he00f :  // <0131> jmp :cmd_loop
addr == 16'h13e ? 16'h00fb :  // <0131> "
// :skip_step // = 0x013f

// command = reset target.
addr == 16'h13f ? 16'h0652 :  // <0135> b = 82 // asc b = "R"
addr == 16'h140 ? 16'hc800 :  // <0136> nop
addr == 16'h141 ? 16'he407 :  // <0137> bn eq :skip_reset
addr == 16'h142 ? 16'h014c :  // <0137> "
addr == 16'h143 ? 16'h3e02 :  // <0138> bus_ctrl = $tg_reset_mask
addr == 16'h144 ? 16'hc800 :  // <0139> nop
addr == 16'h145 ? 16'hc800 :  // <0140> nop
addr == 16'h146 ? 16'h3e08 :  // <0141> bus_ctrl = $bp_step_mask
addr == 16'h147 ? 16'hfba0 :  // <0142> call :wait_for_bp
addr == 16'h148 ? 16'h0190 :  // <0142> "
addr == 16'h149 ? 16'hfc00 :  // <0142> "
addr == 16'h14a ? 16'he00f :  // <0143> jmp :cmd_loop
addr == 16'h14b ? 16'h00fb :  // <0143> "
// :skip_reset // = 0x014c

// command = load program.
addr == 16'h14c ? 16'h066c :  // <0147> b = 108 // asc b = "l"
addr == 16'h14d ? 16'hc800 :  // <0148> nop
addr == 16'h14e ? 16'he407 :  // <0149> bn eq :skip_load
addr == 16'h14f ? 16'h0155 :  // <0149> "
addr == 16'h150 ? 16'hfba0 :  // <0150> call :load_program
addr == 16'h151 ? 16'h01f2 :  // <0150> "
addr == 16'h152 ? 16'hfc00 :  // <0150> "
addr == 16'h153 ? 16'he00f :  // <0151> jmp :cmd_loop
addr == 16'h154 ? 16'h00fb :  // <0151> "
// :skip_load // = 0x0155

// command = run full speed.
addr == 16'h155 ? 16'h0672 :  // <0155> b = 114 // asc b = "r"
addr == 16'h156 ? 16'hc800 :  // <0156> nop
addr == 16'h157 ? 16'he407 :  // <0157> bn eq :skip_run
addr == 16'h158 ? 16'h015d :  // <0157> "
// release target reset, to run.
addr == 16'h159 ? 16'h3e00 :  // <0159> bus_ctrl = 0
addr == 16'h15a ? 16'h2409 :  // <0160> bp0_addr = bp0_addr
addr == 16'h15b ? 16'he00f :  // <0161> jmp :cmd_loop
addr == 16'h15c ? 16'h00fb :  // <0161> "
// :skip_run // = 0x015d

// // command = interrupt / break target.
// asc b = "i"
// nop
// bn eq :skip_brk
// bus_ctrl = 0
// bus_ctrl = $bp_step_mask
// call :wait_for_bp
// jmp :cmd_loop
// :skip_brk

// command = set breakpoint.
addr == 16'h15d ? 16'h0662 :  // <0175> b = 98 // asc b = "b"
addr == 16'h15e ? 16'hc800 :  // <0176> nop
addr == 16'h15f ? 16'he407 :  // <0177> bn eq :skip_setbrk
addr == 16'h160 ? 16'h0166 :  // <0177> "
addr == 16'h161 ? 16'hfba0 :  // <0178> call :set_bp
addr == 16'h162 ? 16'h0196 :  // <0178> "
addr == 16'h163 ? 16'hfc00 :  // <0178> "
addr == 16'h164 ? 16'he00f :  // <0179> jmp :cmd_loop
addr == 16'h165 ? 16'h00fb :  // <0179> "
// :skip_setbrk // = 0x0166

addr == 16'h166 ? 16'h023f :  // <0182> a = 63 // putasc "?"
addr == 16'h167 ? 16'h0000 :  // <0182> a = a // putasc "?"
addr == 16'h168 ? 16'hfba0 :  // <0182> putasc "?"
addr == 16'h169 ? 16'h0037 :  // <0182> "
addr == 16'h16a ? 16'hfc00 :  // <0182> "
addr == 16'h16b ? 16'h020d :  // <0183> a = 13 // puteol
addr == 16'h16c ? 16'h0000 :  // <0183> a = a // puteol
addr == 16'h16d ? 16'hfba0 :  // <0183> puteol
addr == 16'h16e ? 16'h0037 :  // <0183> "
addr == 16'h16f ? 16'hfc00 :  // <0183> "
addr == 16'h170 ? 16'h020a :  // <0183> a = 10 // puteol
addr == 16'h171 ? 16'h0000 :  // <0183> a = a // puteol
addr == 16'h172 ? 16'hfba0 :  // <0183> puteol
addr == 16'h173 ? 16'h0037 :  // <0183> "
addr == 16'h174 ? 16'hfc00 :  // <0183> "
addr == 16'h175 ? 16'he00f :  // <0184> jmp :cmd_loop
addr == 16'h176 ? 16'h00fb :  // <0184> "

// demonstrations //////////////////////////////

// set a breakpoint, wait til it hits.
addr == 16'h177 ? 16'h2615 :  // <0189> bp0_addr = 0x15
// :main_loop // = 0x0178
addr == 16'h178 ? 16'hfba0 :  // <0191> call :wait_for_bp
addr == 16'h179 ? 16'h0190 :  // <0191> "
addr == 16'h17a ? 16'hfc00 :  // <0191> "

// release target to run full speed.
addr == 16'h17b ? 16'h3e00 :  // <0194> bus_ctrl = 0

// interrupt the target and single step it a few times.
addr == 16'h17c ? 16'h3e08 :  // <0197> bus_ctrl = $bp_step_mask
addr == 16'h17d ? 16'hfba0 :  // <0198> call :wait_for_bp
addr == 16'h17e ? 16'h0190 :  // <0198> "
addr == 16'h17f ? 16'hfc00 :  // <0198> "
addr == 16'h180 ? 16'h2409 :  // <0199> bp0_addr = bp0_addr
addr == 16'h181 ? 16'hfba0 :  // <0200> call :wait_for_bp
addr == 16'h182 ? 16'h0190 :  // <0200> "
addr == 16'h183 ? 16'hfc00 :  // <0200> "
addr == 16'h184 ? 16'h2409 :  // <0201> bp0_addr = bp0_addr
addr == 16'h185 ? 16'hfba0 :  // <0202> call :wait_for_bp
addr == 16'h186 ? 16'h0190 :  // <0202> "
addr == 16'h187 ? 16'hfc00 :  // <0202> "
addr == 16'h188 ? 16'h2409 :  // <0203> bp0_addr = bp0_addr
addr == 16'h189 ? 16'hfba0 :  // <0204> call :wait_for_bp
addr == 16'h18a ? 16'h0190 :  // <0204> "
addr == 16'h18b ? 16'hfc00 :  // <0204> "
addr == 16'h18c ? 16'h3e00 :  // <0205> bus_ctrl = 0

// release target to pass breakpoint once.
addr == 16'h18d ? 16'h2409 :  // <0208> bp0_addr = bp0_addr

addr == 16'h18e ? 16'he00f :  // <0210> jmp :main_loop
addr == 16'h18f ? 16'h0178 :  // <0210> "

// func wait_for_bp // = 0x0190
addr == 16'h190 ? 16'h0200 :  // <0213> a = 0
addr == 16'h191 ? 16'h0418 :  // <0214> b = bp_status
addr == 16'h192 ? 16'hc800 :  // <0215> nop
addr == 16'h193 ? 16'he004 :  // <0216> br z :wait_for_bp
addr == 16'h194 ? 16'h0190 :  // <0216> "
addr == 16'h195 ? 16'hfc00 :  // <0217> rtn

// func set_bp // = 0x0196
addr == 16'h196 ? 16'h2004 :  // <0219> push x // func set_bp
addr == 16'h197 ? 16'h2005 :  // <0219> push y // "
addr == 16'h198 ? 16'h203e :  // <0219> push rtna // "
addr == 16'h199 ? 16'hfba0 :  // <0220> getchar
addr == 16'h19a ? 16'h0047 :  // <0220> "
addr == 16'h19b ? 16'hfc00 :  // <0220> "
addr == 16'h19c ? 16'h2000 :  // <0220> push a // "
addr == 16'h19d ? 16'h0000 :  // <0220> a = a // "
addr == 16'h19e ? 16'hfba0 :  // <0220> "
addr == 16'h19f ? 16'h0037 :  // <0220> "
addr == 16'h1a0 ? 16'hfc00 :  // <0220> "
addr == 16'h1a1 ? 16'h0008 :  // <0220> pop a // "
addr == 16'h1a2 ? 16'h1000 :  // <0221> x = a
addr == 16'h1a3 ? 16'hfba0 :  // <0222> getchar
addr == 16'h1a4 ? 16'h0047 :  // <0222> "
addr == 16'h1a5 ? 16'hfc00 :  // <0222> "
addr == 16'h1a6 ? 16'h2000 :  // <0222> push a // "
addr == 16'h1a7 ? 16'h0000 :  // <0222> a = a // "
addr == 16'h1a8 ? 16'hfba0 :  // <0222> "
addr == 16'h1a9 ? 16'h0037 :  // <0222> "
addr == 16'h1aa ? 16'hfc00 :  // <0222> "
addr == 16'h1ab ? 16'h0008 :  // <0222> pop a // "
addr == 16'h1ac ? 16'h063d :  // <0223> b = 61 // asc b = "="
addr == 16'h1ad ? 16'hc800 :  // <0224> nop
addr == 16'h1ae ? 16'he407 :  // <0225> bn eq :fail
addr == 16'h1af ? 16'h01df :  // <0225> "
addr == 16'h1b0 ? 16'hfba0 :  // <0226> call :get4x
addr == 16'h1b1 ? 16'h0096 :  // <0226> "
addr == 16'h1b2 ? 16'hfc00 :  // <0226> "
addr == 16'h1b3 ? 16'h1400 :  // <0227> y = a
addr == 16'h1b4 ? 16'h0200 :  // <0228> a = 0
addr == 16'h1b5 ? 16'hc800 :  // <0229> nop
addr == 16'h1b6 ? 16'he407 :  // <0230> bn eq :fail
addr == 16'h1b7 ? 16'h01df :  // <0230> "
addr == 16'h1b8 ? 16'h0004 :  // <0231> a = x
addr == 16'h1b9 ? 16'h0600 :  // <0232> b = 0
addr == 16'h1ba ? 16'hc800 :  // <0233> nop
addr == 16'h1bb ? 16'he007 :  // <0234> br eq :b0
addr == 16'h1bc ? 16'h01cb :  // <0234> "
addr == 16'h1bd ? 16'h0601 :  // <0235> b = 1
addr == 16'h1be ? 16'hc800 :  // <0236> nop
addr == 16'h1bf ? 16'he007 :  // <0237> br eq :b1
addr == 16'h1c0 ? 16'h01d0 :  // <0237> "
addr == 16'h1c1 ? 16'h0602 :  // <0238> b = 2
addr == 16'h1c2 ? 16'hc800 :  // <0239> nop
addr == 16'h1c3 ? 16'he007 :  // <0240> br eq :b2
addr == 16'h1c4 ? 16'h01d5 :  // <0240> "
addr == 16'h1c5 ? 16'h0603 :  // <0241> b = 3
addr == 16'h1c6 ? 16'hc800 :  // <0242> nop
addr == 16'h1c7 ? 16'he007 :  // <0243> br eq :b3
addr == 16'h1c8 ? 16'h01da :  // <0243> "
addr == 16'h1c9 ? 16'he00f :  // <0244> jmp :fail
addr == 16'h1ca ? 16'h01df :  // <0244> "
// :b0 // = 0x01cb
addr == 16'h1cb ? 16'h2405 :  // <0246> bp0_addr = y
addr == 16'h1cc ? 16'hf808 :  // <0247> pop rtna // rtn
addr == 16'h1cd ? 16'h1408 :  // <0247> pop y // "
addr == 16'h1ce ? 16'h1008 :  // <0247> pop x // "
addr == 16'h1cf ? 16'hfc00 :  // <0247> rtn
// :b1 // = 0x01d0
addr == 16'h1d0 ? 16'h2805 :  // <0249> bp1_addr = y
addr == 16'h1d1 ? 16'hf808 :  // <0250> pop rtna // rtn
addr == 16'h1d2 ? 16'h1408 :  // <0250> pop y // "
addr == 16'h1d3 ? 16'h1008 :  // <0250> pop x // "
addr == 16'h1d4 ? 16'hfc00 :  // <0250> rtn
// :b2 // = 0x01d5
addr == 16'h1d5 ? 16'h2c05 :  // <0252> bp2_addr = y
addr == 16'h1d6 ? 16'hf808 :  // <0253> pop rtna // rtn
addr == 16'h1d7 ? 16'h1408 :  // <0253> pop y // "
addr == 16'h1d8 ? 16'h1008 :  // <0253> pop x // "
addr == 16'h1d9 ? 16'hfc00 :  // <0253> rtn
// :b3 // = 0x01da
addr == 16'h1da ? 16'h3005 :  // <0255> bp3_addr = y
addr == 16'h1db ? 16'hf808 :  // <0256> pop rtna // rtn
addr == 16'h1dc ? 16'h1408 :  // <0256> pop y // "
addr == 16'h1dd ? 16'h1008 :  // <0256> pop x // "
addr == 16'h1de ? 16'hfc00 :  // <0256> rtn
// :fail // = 0x01df
addr == 16'h1df ? 16'h023f :  // <0258> a = 63 // putasc "?"
addr == 16'h1e0 ? 16'h0000 :  // <0258> a = a // putasc "?"
addr == 16'h1e1 ? 16'hfba0 :  // <0258> putasc "?"
addr == 16'h1e2 ? 16'h0037 :  // <0258> "
addr == 16'h1e3 ? 16'hfc00 :  // <0258> "
addr == 16'h1e4 ? 16'h020d :  // <0259> a = 13 // puteol
addr == 16'h1e5 ? 16'h0000 :  // <0259> a = a // puteol
addr == 16'h1e6 ? 16'hfba0 :  // <0259> puteol
addr == 16'h1e7 ? 16'h0037 :  // <0259> "
addr == 16'h1e8 ? 16'hfc00 :  // <0259> "
addr == 16'h1e9 ? 16'h020a :  // <0259> a = 10 // puteol
addr == 16'h1ea ? 16'h0000 :  // <0259> a = a // puteol
addr == 16'h1eb ? 16'hfba0 :  // <0259> puteol
addr == 16'h1ec ? 16'h0037 :  // <0259> "
addr == 16'h1ed ? 16'hfc00 :  // <0259> "
addr == 16'h1ee ? 16'hf808 :  // <0260> pop rtna // rtn
addr == 16'h1ef ? 16'h1408 :  // <0260> pop y // "
addr == 16'h1f0 ? 16'h1008 :  // <0260> pop x // "
addr == 16'h1f1 ? 16'hfc00 :  // <0260> rtn

// func load_program // = 0x01f2
addr == 16'h1f2 ? 16'h2002 :  // <0262> push i // func load_program
addr == 16'h1f3 ? 16'h2003 :  // <0262> push j // "
addr == 16'h1f4 ? 16'h2004 :  // <0262> push x // "
addr == 16'h1f5 ? 16'h2006 :  // <0262> push g6 // "
addr == 16'h1f6 ? 16'h203e :  // <0262> push rtna // "
// load target program from UART.
// length, little-endian.  memorize in x.
addr == 16'h1f7 ? 16'h024c :  // <0265> a = 76 // putasc L
addr == 16'h1f8 ? 16'h0000 :  // <0265> a = a // putasc L
addr == 16'h1f9 ? 16'hfba0 :  // <0265> putasc L
addr == 16'h1fa ? 16'h0037 :  // <0265> "
addr == 16'h1fb ? 16'hfc00 :  // <0265> "
addr == 16'h1fc ? 16'hfba0 :  // <0266> get16 x
addr == 16'h1fd ? 16'h0047 :  // <0266> "
addr == 16'h1fe ? 16'hfc00 :  // <0266> "
addr == 16'h1ff ? 16'h2000 :  // <0266> push a // "
addr == 16'h200 ? 16'hfba0 :  // <0266> "
addr == 16'h201 ? 16'h0047 :  // <0266> "
addr == 16'h202 ? 16'hfc00 :  // <0266> "
addr == 16'h203 ? 16'h0352 :  // <0266> "
addr == 16'h204 ? 16'h0352 :  // <0266> "
addr == 16'h205 ? 16'h0408 :  // <0266> pop b // "
addr == 16'h206 ? 16'hc800 :  // <0266> "
addr == 16'h207 ? 16'h1334 :  // <0266> "
addr == 16'h208 ? 16'h0004 :  // <0267> a = x
addr == 16'h209 ? 16'hfba0 :  // <0268> call put4x
addr == 16'h20a ? 16'h0059 :  // <0268> "
addr == 16'h20b ? 16'hfc00 :  // <0268> "
// put target into reset again, in case this is a target warm boot.
addr == 16'h20c ? 16'h3e02 :  // <0270> bus_ctrl = $tg_reset_mask
// load opcodes.  count up address in i.
addr == 16'h20d ? 16'h0a00 :  // <0272> i = 0
addr == 16'h20e ? 16'h0e01 :  // <0273> j = 1
// :loadword // = 0x020f
addr == 16'h20f ? 16'h0241 :  // <0275> a = 65 // putasc A
addr == 16'h210 ? 16'h0000 :  // <0275> a = a // putasc A
addr == 16'h211 ? 16'hfba0 :  // <0275> putasc A
addr == 16'h212 ? 16'h0037 :  // <0275> "
addr == 16'h213 ? 16'hfc00 :  // <0275> "
addr == 16'h214 ? 16'h0002 :  // <0276> a = i
addr == 16'h215 ? 16'hfba0 :  // <0277> call put4x
addr == 16'h216 ? 16'h0059 :  // <0277> "
addr == 16'h217 ? 16'hfc00 :  // <0277> "
addr == 16'h218 ? 16'h023d :  // <0278> a = 61 // putasc "="
addr == 16'h219 ? 16'h0000 :  // <0278> a = a // putasc "="
addr == 16'h21a ? 16'hfba0 :  // <0278> putasc "="
addr == 16'h21b ? 16'h0037 :  // <0278> "
addr == 16'h21c ? 16'hfc00 :  // <0278> "
addr == 16'h21d ? 16'hfba0 :  // <0279> get16 g6
addr == 16'h21e ? 16'h0047 :  // <0279> "
addr == 16'h21f ? 16'hfc00 :  // <0279> "
addr == 16'h220 ? 16'h2000 :  // <0279> push a // "
addr == 16'h221 ? 16'hfba0 :  // <0279> "
addr == 16'h222 ? 16'h0047 :  // <0279> "
addr == 16'h223 ? 16'hfc00 :  // <0279> "
addr == 16'h224 ? 16'h0352 :  // <0279> "
addr == 16'h225 ? 16'h0352 :  // <0279> "
addr == 16'h226 ? 16'h0408 :  // <0279> pop b // "
addr == 16'h227 ? 16'hc800 :  // <0279> "
addr == 16'h228 ? 16'h1b34 :  // <0279> "
addr == 16'h229 ? 16'h0006 :  // <0280> a = g6
addr == 16'h22a ? 16'hfba0 :  // <0281> call put4x
addr == 16'h22b ? 16'h0059 :  // <0281> "
addr == 16'h22c ? 16'hfc00 :  // <0281> "
addr == 16'h22d ? 16'h023d :  // <0282> a = 61 // putasc "="
addr == 16'h22e ? 16'h0000 :  // <0282> a = a // putasc "="
addr == 16'h22f ? 16'hfba0 :  // <0282> putasc "="
addr == 16'h230 ? 16'h0037 :  // <0282> "
addr == 16'h231 ? 16'hfc00 :  // <0282> "
addr == 16'h232 ? 16'h4c02 :  // <0283> m9k_addr = i
addr == 16'h233 ? 16'h5006 :  // <0284> m9k_data = g6
addr == 16'h234 ? 16'h0014 :  // <0285> a = m9k_data
addr == 16'h235 ? 16'hfba0 :  // <0286> call put4x
addr == 16'h236 ? 16'h0059 :  // <0286> "
addr == 16'h237 ? 16'hfc00 :  // <0286> "
addr == 16'h238 ? 16'h020d :  // <0287> a = 13 // puteol
addr == 16'h239 ? 16'h0000 :  // <0287> a = a // puteol
addr == 16'h23a ? 16'hfba0 :  // <0287> puteol
addr == 16'h23b ? 16'h0037 :  // <0287> "
addr == 16'h23c ? 16'hfc00 :  // <0287> "
addr == 16'h23d ? 16'h020a :  // <0287> a = 10 // puteol
addr == 16'h23e ? 16'h0000 :  // <0287> a = a // puteol
addr == 16'h23f ? 16'hfba0 :  // <0287> puteol
addr == 16'h240 ? 16'h0037 :  // <0287> "
addr == 16'h241 ? 16'hfc00 :  // <0287> "
addr == 16'h242 ? 16'h0b10 :  // <0288> i = i+j
addr == 16'h243 ? 16'h0002 :  // <0289> a = i
addr == 16'h244 ? 16'h0404 :  // <0290> b = x
addr == 16'h245 ? 16'hc800 :  // <0291> nop
addr == 16'h246 ? 16'he407 :  // <0292> bn eq :loadword
addr == 16'h247 ? 16'h020f :  // <0292> "
addr == 16'h248 ? 16'hf808 :  // <0293> pop rtna // rtn
addr == 16'h249 ? 16'h1808 :  // <0293> pop g6 // "
addr == 16'h24a ? 16'h1008 :  // <0293> pop x // "
addr == 16'h24b ? 16'h0c08 :  // <0293> pop j // "
addr == 16'h24c ? 16'h0808 :  // <0293> pop i // "
addr == 16'h24d ? 16'hfc00 :  // <0293> rtn

// observe a register.  return its value in peek_data.
// pass its register address in a.
// func peek // = 0x024e
addr == 16'h24e ? 16'h07a0 :  // <0298> b = 0x3ff
addr == 16'h24f ? 16'h03ff :  // <0298> "
addr == 16'h250 ? 16'hc800 :  // <0299> nop
addr == 16'h251 ? 16'h0330 :  // <0300> a = and
// debug_peek_reg = 31 << 10
addr == 16'h252 ? 16'h07a0 :  // <0302> b = 0x7c00
addr == 16'h253 ? 16'h7c00 :  // <0302> "
addr == 16'h254 ? 16'hc800 :  // <0303> nop
addr == 16'h255 ? 16'h3734 :  // <0304> force_opcode = or
addr == 16'h256 ? 16'h3e04 :  // <0305> bus_ctrl = $divert_code_bus_mask
addr == 16'h257 ? 16'h4201 :  // <0306> tg_force = $hold_state_mask
addr == 16'h258 ? 16'h4203 :  // <0307> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h259 ? 16'h4205 :  // <0308> tg_force = ($hold_state_mask | $force_exec_mask)
addr == 16'h25a ? 16'h4201 :  // <0309> tg_force = $hold_state_mask
// target's register value is now in peek_data.
// refill target exr so it can resume seamlessly.
addr == 16'h25b ? 16'h3415 :  // <0312> force_opcode = exr_shadow
addr == 16'h25c ? 16'h4203 :  // <0313> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h25d ? 16'h4200 :  // <0314> tg_force = 0
addr == 16'h25e ? 16'hfc00 :  // <0315> rtn

// show target status display.
// func dump_target // = 0x025f
addr == 16'h25f ? 16'h2002 :  // <0318> push i // func dump_target
addr == 16'h260 ? 16'h2003 :  // <0318> push j // "
addr == 16'h261 ? 16'h2004 :  // <0318> push x // "
addr == 16'h262 ? 16'h2005 :  // <0318> push y // "
addr == 16'h263 ? 16'h203e :  // <0318> push rtna // "
addr == 16'h264 ? 16'h020d :  // <0319> a = 13 // puteol
addr == 16'h265 ? 16'h0000 :  // <0319> a = a // puteol
addr == 16'h266 ? 16'hfba0 :  // <0319> puteol
addr == 16'h267 ? 16'h0037 :  // <0319> "
addr == 16'h268 ? 16'hfc00 :  // <0319> "
addr == 16'h269 ? 16'h020a :  // <0319> a = 10 // puteol
addr == 16'h26a ? 16'h0000 :  // <0319> a = a // puteol
addr == 16'h26b ? 16'hfba0 :  // <0319> puteol
addr == 16'h26c ? 16'h0037 :  // <0319> "
addr == 16'h26d ? 16'hfc00 :  // <0319> "
addr == 16'h26e ? 16'h0a00 :  // <0320> i = 0
// :next_reg // = 0x026f
// fetch register name from table in target program.
addr == 16'h26f ? 16'h1200 :  // <0323> x = 0
addr == 16'h270 ? 16'h1601 :  // <0324> y = 1
// :next_chars // = 0x0271
addr == 16'h271 ? 16'h0002 :  // <0326> a = i
addr == 16'h272 ? 16'h0351 :  // <0327> a = a<<1
addr == 16'h273 ? 16'h0351 :  // <0328> a = a<<1
addr == 16'h274 ? 16'h0603 :  // <0329> b = 3
addr == 16'h275 ? 16'hc800 :  // <0330> nop
addr == 16'h276 ? 16'h0300 :  // <0331> a = a+b
addr == 16'h277 ? 16'h0404 :  // <0332> b = x
addr == 16'h278 ? 16'hc800 :  // <0333> nop
addr == 16'h279 ? 16'h4f00 :  // <0334> m9k_addr = a+b
addr == 16'h27a ? 16'h0014 :  // <0335> a = m9k_data // putchar m9k_data
addr == 16'h27b ? 16'hfba0 :  // <0335> putchar m9k_data
addr == 16'h27c ? 16'h0037 :  // <0335> "
addr == 16'h27d ? 16'hfc00 :  // <0335> "
addr == 16'h27e ? 16'h0014 :  // <0336> a = m9k_data
addr == 16'h27f ? 16'h0353 :  // <0337> a = a>>4
addr == 16'h280 ? 16'h0353 :  // <0338> a = a>>4
addr == 16'h281 ? 16'h0000 :  // <0339> a = a // putchar a
addr == 16'h282 ? 16'hfba0 :  // <0339> putchar a
addr == 16'h283 ? 16'h0037 :  // <0339> "
addr == 16'h284 ? 16'hfc00 :  // <0339> "
addr == 16'h285 ? 16'h1320 :  // <0340> x = x+y
addr == 16'h286 ? 16'h0004 :  // <0341> a = x
addr == 16'h287 ? 16'h0604 :  // <0342> b = 4
addr == 16'h288 ? 16'hc800 :  // <0343> nop
addr == 16'h289 ? 16'he407 :  // <0344> bn eq :next_chars
addr == 16'h28a ? 16'h0271 :  // <0344> "
addr == 16'h28b ? 16'h023d :  // <0345> a = 61 // putasc "="
addr == 16'h28c ? 16'h0000 :  // <0345> a = a // putasc "="
addr == 16'h28d ? 16'hfba0 :  // <0345> putasc "="
addr == 16'h28e ? 16'h0037 :  // <0345> "
addr == 16'h28f ? 16'hfc00 :  // <0345> "
addr == 16'h290 ? 16'h0002 :  // <0346> a = i
addr == 16'h291 ? 16'hfba0 :  // <0347> call :peek
addr == 16'h292 ? 16'h024e :  // <0347> "
addr == 16'h293 ? 16'hfc00 :  // <0347> "
addr == 16'h294 ? 16'h0017 :  // <0348> a = peek_data
addr == 16'h295 ? 16'hfba0 :  // <0349> call :put4x
addr == 16'h296 ? 16'h0059 :  // <0349> "
addr == 16'h297 ? 16'hfc00 :  // <0349> "
addr == 16'h298 ? 16'h0220 :  // <0350> a = 32 // putasc " "
addr == 16'h299 ? 16'h0000 :  // <0350> a = a // putasc " "
addr == 16'h29a ? 16'hfba0 :  // <0350> putasc " "
addr == 16'h29b ? 16'h0037 :  // <0350> "
addr == 16'h29c ? 16'hfc00 :  // <0350> "
addr == 16'h29d ? 16'h0e01 :  // <0351> j = 1
addr == 16'h29e ? 16'hc800 :  // <0352> nop
addr == 16'h29f ? 16'h0b10 :  // <0353> i = i+j
// loop up to the number of registers in the target program's register name table.
addr == 16'h2a0 ? 16'h4e02 :  // <0355> m9k_addr = 2
addr == 16'h2a1 ? 16'h0414 :  // <0356> b = m9k_data
addr == 16'h2a2 ? 16'h0002 :  // <0357> a = i
addr == 16'h2a3 ? 16'hc800 :  // <0358> nop
addr == 16'h2a4 ? 16'he407 :  // <0359> bn eq :next_reg
addr == 16'h2a5 ? 16'h026f :  // <0359> "
addr == 16'h2a6 ? 16'h020d :  // <0360> a = 13 // puteol
addr == 16'h2a7 ? 16'h0000 :  // <0360> a = a // puteol
addr == 16'h2a8 ? 16'hfba0 :  // <0360> puteol
addr == 16'h2a9 ? 16'h0037 :  // <0360> "
addr == 16'h2aa ? 16'hfc00 :  // <0360> "
addr == 16'h2ab ? 16'h020a :  // <0360> a = 10 // puteol
addr == 16'h2ac ? 16'h0000 :  // <0360> a = a // puteol
addr == 16'h2ad ? 16'hfba0 :  // <0360> puteol
addr == 16'h2ae ? 16'h0037 :  // <0360> "
addr == 16'h2af ? 16'hfc00 :  // <0360> "
addr == 16'h2b0 ? 16'hf808 :  // <0361> pop rtna // rtn
addr == 16'h2b1 ? 16'h1408 :  // <0361> pop y // "
addr == 16'h2b2 ? 16'h1008 :  // <0361> pop x // "
addr == 16'h2b3 ? 16'h0c08 :  // <0361> pop j // "
addr == 16'h2b4 ? 16'h0808 :  // <0361> pop i // "
addr == 16'h2b5 ? 16'hfc00 :  // <0361> rtn
        
                16'hxxxx;
        endmodule
    
