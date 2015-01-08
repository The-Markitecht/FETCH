
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
addr == 16'h1a ? 16'he001 :  // <0028> br iz :fail
addr == 16'h1b ? 16'h002d :  // <0028> "
addr == 16'h1c ? 16'h1400 :  // <0029> y = a
addr == 16'h1d ? 16'h0f60 :  // <0030> j = -1
// :again // = 0x001e
addr == 16'h1e ? 16'hc800 :  // <0032> i = i+j
addr == 16'h1f ? 16'h0b10 :  // <0032> "
addr == 16'h20 ? 16'h0002 :  // <0033> a = i
addr == 16'h21 ? 16'hfba0 :  // <0034> call :fetch_byte
addr == 16'h22 ? 16'h0002 :  // <0034> "
addr == 16'h23 ? 16'hfc00 :  // <0034> "
addr == 16'h24 ? 16'h0405 :  // <0035> b = y
addr == 16'h25 ? 16'he407 :  // <0036> bn eq :again
addr == 16'h26 ? 16'h001e :  // <0036> "
// :found // = 0x0027
addr == 16'h27 ? 16'h0002 :  // <0038> a = i
addr == 16'h28 ? 16'hf808 :  // <0039> pop rtna // rtn
addr == 16'h29 ? 16'h1408 :  // <0039> pop y // "
addr == 16'h2a ? 16'h0c08 :  // <0039> pop j // "
addr == 16'h2b ? 16'h0808 :  // <0039> pop i // "
addr == 16'h2c ? 16'hfc00 :  // <0039> rtn
// :fail // = 0x002d
addr == 16'h2d ? 16'h0360 :  // <0041> a = -1
addr == 16'h2e ? 16'hf808 :  // <0042> pop rtna // rtn
addr == 16'h2f ? 16'h1408 :  // <0042> pop y // "
addr == 16'h30 ? 16'h0c08 :  // <0042> pop j // "
addr == 16'h31 ? 16'h0808 :  // <0042> pop i // "
addr == 16'h32 ? 16'hfc00 :  // <0042> rtn



// driver library for my_uart_v2 simple async transceiver.




// routine sends out the low byte from a to the UART.  blocks until the UART accepts the byte.
// func putchar_atx // = 0x0033
addr == 16'h33 ? 16'h2004 :  // <0031> push x // func putchar_atx

addr == 16'h34 ? 16'h1000 :  // <0033> x = a

// wait for UART to be idle (not busy).
addr == 16'h35 ? 16'h0202 :  // <0036> a = $atx_busy_mask
// :pcatx_wait_for_idle // = 0x0036
addr == 16'h36 ? 16'h0412 :  // <0038> b = atx_ctrl
addr == 16'h37 ? 16'he403 :  // <0039> bn and0z :pcatx_wait_for_idle
addr == 16'h38 ? 16'h0036 :  // <0039> "

// push word to the UART.  its low byte is a character.
addr == 16'h39 ? 16'h4404 :  // <0042> atx_data = x

// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_ctrl.
addr == 16'h3a ? 16'h4a01 :  // <0047> atx_ctrl = $atx_load_mask

// wait until UART is busy, as acknowledgement.
addr == 16'h3b ? 16'h0202 :  // <0050> a = $atx_busy_mask
// :pcatx_wait_for_busy // = 0x003c
addr == 16'h3c ? 16'h0412 :  // <0052> b = atx_ctrl
addr == 16'h3d ? 16'he003 :  // <0053> br and0z :pcatx_wait_for_busy
addr == 16'h3e ? 16'h003c :  // <0053> "
addr == 16'h3f ? 16'h4a00 :  // <0054> atx_ctrl = 0
addr == 16'h40 ? 16'h1008 :  // <0055> pop x // rtn
addr == 16'h41 ? 16'hfc00 :  // <0055> rtn

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// func getchar_atx // = 0x0042
// wait until UART is busy, then idle.
addr == 16'h42 ? 16'h0204 :  // <0061> a = $arx_busy_mask
// :wait_for_busy // = 0x0043
addr == 16'h43 ? 16'h0412 :  // <0063> b = atx_ctrl
addr == 16'h44 ? 16'he003 :  // <0064> br and0z :wait_for_busy
addr == 16'h45 ? 16'h0043 :  // <0064> "
// :wait_for_idle // = 0x0046
addr == 16'h46 ? 16'h0412 :  // <0066> b = atx_ctrl
addr == 16'h47 ? 16'he403 :  // <0067> bn and0z :wait_for_idle
addr == 16'h48 ? 16'h0046 :  // <0067> "
addr == 16'h49 ? 16'h0011 :  // <0068> a = atx_data
addr == 16'h4a ? 16'hfc00 :  // <0069> rtn


// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x004b
// "0123456789abcdef"
addr == 16'h4b ? 16'h3130 :  // <0050> 10
addr == 16'h4c ? 16'h3332 :  // <0050> 32
addr == 16'h4d ? 16'h3534 :  // <0050> 54
addr == 16'h4e ? 16'h3736 :  // <0050> 76
addr == 16'h4f ? 16'h3938 :  // <0050> 98
addr == 16'h50 ? 16'h6261 :  // <0050> ba
addr == 16'h51 ? 16'h6463 :  // <0050> dc
addr == 16'h52 ? 16'h6665 :  // <0050> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x0053
addr == 16'h53 ? 16'h2004 :  // <0054> push x // func put4x
addr == 16'h54 ? 16'h2006 :  // <0054> push g6 // "
addr == 16'h55 ? 16'h203e :  // <0054> push rtna // "
addr == 16'h56 ? 16'h13a0 :  // <0055> x = :hexdigits
addr == 16'h57 ? 16'h004b :  // <0055> "

addr == 16'h58 ? 16'h1800 :  // <0057> g6 = a
addr == 16'h59 ? 16'h07a0 :  // <0058> b = 0xF000
addr == 16'h5a ? 16'hf000 :  // <0058> "
addr == 16'h5b ? 16'hc800 :  // <0059> a = and
addr == 16'h5c ? 16'h0330 :  // <0059> "
addr == 16'h5d ? 16'h0353 :  // <0060> a = a>>4
addr == 16'h5e ? 16'h0353 :  // <0061> a = a>>4
addr == 16'h5f ? 16'h0353 :  // <0062> a = a>>4
addr == 16'h60 ? 16'hfba0 :  // <0063> call fetch_byte
addr == 16'h61 ? 16'h0002 :  // <0063> "
addr == 16'h62 ? 16'hfc00 :  // <0063> "
addr == 16'h63 ? 16'h0000 :  // <0064> a = a // putchar a
addr == 16'h64 ? 16'hfba0 :  // <0064> putchar a
addr == 16'h65 ? 16'h0033 :  // <0064> "
addr == 16'h66 ? 16'hfc00 :  // <0064> "

addr == 16'h67 ? 16'h0006 :  // <0066> a = g6
addr == 16'h68 ? 16'h07a0 :  // <0067> b = 0x0F00
addr == 16'h69 ? 16'h0f00 :  // <0067> "
addr == 16'h6a ? 16'hc800 :  // <0068> a = and
addr == 16'h6b ? 16'h0330 :  // <0068> "
addr == 16'h6c ? 16'h0353 :  // <0069> a = a>>4
addr == 16'h6d ? 16'h0353 :  // <0070> a = a>>4
addr == 16'h6e ? 16'hfba0 :  // <0071> call fetch_byte
addr == 16'h6f ? 16'h0002 :  // <0071> "
addr == 16'h70 ? 16'hfc00 :  // <0071> "
addr == 16'h71 ? 16'h0000 :  // <0072> a = a // putchar a
addr == 16'h72 ? 16'hfba0 :  // <0072> putchar a
addr == 16'h73 ? 16'h0033 :  // <0072> "
addr == 16'h74 ? 16'hfc00 :  // <0072> "

addr == 16'h75 ? 16'h0006 :  // <0074> a = g6
addr == 16'h76 ? 16'h06f0 :  // <0075> b = 0x00F0
addr == 16'h77 ? 16'hc800 :  // <0076> a = and
addr == 16'h78 ? 16'h0330 :  // <0076> "
addr == 16'h79 ? 16'h0353 :  // <0077> a = a>>4
addr == 16'h7a ? 16'hfba0 :  // <0078> call fetch_byte
addr == 16'h7b ? 16'h0002 :  // <0078> "
addr == 16'h7c ? 16'hfc00 :  // <0078> "
addr == 16'h7d ? 16'h0000 :  // <0079> a = a // putchar a
addr == 16'h7e ? 16'hfba0 :  // <0079> putchar a
addr == 16'h7f ? 16'h0033 :  // <0079> "
addr == 16'h80 ? 16'hfc00 :  // <0079> "

addr == 16'h81 ? 16'h0006 :  // <0081> a = g6
addr == 16'h82 ? 16'h060f :  // <0082> b = 0x000F
addr == 16'h83 ? 16'hc800 :  // <0083> a = and
addr == 16'h84 ? 16'h0330 :  // <0083> "
addr == 16'h85 ? 16'hfba0 :  // <0084> call fetch_byte
addr == 16'h86 ? 16'h0002 :  // <0084> "
addr == 16'h87 ? 16'hfc00 :  // <0084> "
addr == 16'h88 ? 16'h0000 :  // <0085> a = a // putchar a
addr == 16'h89 ? 16'hfba0 :  // <0085> putchar a
addr == 16'h8a ? 16'h0033 :  // <0085> "
addr == 16'h8b ? 16'hfc00 :  // <0085> "

addr == 16'h8c ? 16'hf808 :  // <0087> pop rtna // rtn
addr == 16'h8d ? 16'h1808 :  // <0087> pop g6 // "
addr == 16'h8e ? 16'h1008 :  // <0087> pop x // "
addr == 16'h8f ? 16'hfc00 :  // <0087> rtn

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// func get4x // = 0x0090
addr == 16'h90 ? 16'h2002 :  // <0091> push i // func get4x
addr == 16'h91 ? 16'h2003 :  // <0091> push j // "
addr == 16'h92 ? 16'h2004 :  // <0091> push x // "
addr == 16'h93 ? 16'h2005 :  // <0091> push y // "
addr == 16'h94 ? 16'h203e :  // <0091> push rtna // "
// y = digit counter
// j = sum
addr == 16'h95 ? 16'h1604 :  // <0094> y = 4
// :again // = 0x0096
addr == 16'h96 ? 16'hfba0 :  // <0096> getchar
addr == 16'h97 ? 16'h0042 :  // <0096> "
addr == 16'h98 ? 16'hfc00 :  // <0096> "
addr == 16'h99 ? 16'h2000 :  // <0096> push a // "
addr == 16'h9a ? 16'h0000 :  // <0096> a = a // "
addr == 16'h9b ? 16'hfba0 :  // <0096> "
addr == 16'h9c ? 16'h0033 :  // <0096> "
addr == 16'h9d ? 16'hfc00 :  // <0096> "
addr == 16'h9e ? 16'h0008 :  // <0096> pop a // "
addr == 16'h9f ? 16'h13a0 :  // <0097> x = :hexdigits
addr == 16'ha0 ? 16'h004b :  // <0097> "
addr == 16'ha1 ? 16'h0a10 :  // <0098> i = 16
addr == 16'ha2 ? 16'hfba0 :  // <0099> call :find_in_fetch
addr == 16'ha3 ? 16'h0016 :  // <0099> "
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
addr == 16'hb2 ? 16'h0096 :  // <0109> "
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
addr == 16'hbc ? 16'hf808 :  // <0115> pop rtna // rtn
addr == 16'hbd ? 16'h1408 :  // <0115> pop y // "
addr == 16'hbe ? 16'h1008 :  // <0115> pop x // "
addr == 16'hbf ? 16'h0c08 :  // <0115> pop j // "
addr == 16'hc0 ? 16'h0808 :  // <0115> pop i // "
addr == 16'hc1 ? 16'hfc00 :  // <0115> rtn

// routine waits a number of milliseconds given in a.
// func spinwait // = 0x00c2
addr == 16'hc2 ? 16'h2004 :  // <0002> push x // func spinwait
addr == 16'hc3 ? 16'h2005 :  // <0002> push y // "
//patch
//rtn
addr == 16'hc4 ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x00c5
addr == 16'hc5 ? 16'h13a0 :  // <0007> x = 16666
addr == 16'hc6 ? 16'h411a :  // <0007> "
addr == 16'hc7 ? 16'h1760 :  // <0008> y = -1
addr == 16'hc8 ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x00c9
// use of the ad2 name overrides auto-nop here.
addr == 16'hc9 ? 16'h1320 :  // <0012> x = ad2
addr == 16'hca ? 16'he402 :  // <0013> bn xz :spinwait_inner
addr == 16'hcb ? 16'h00c9 :  // <0013> "
addr == 16'hcc ? 16'hc800 :  // <0014> a = a+b
addr == 16'hcd ? 16'h0300 :  // <0014> "
addr == 16'hce ? 16'he400 :  // <0015> bn az :spinwait_outer
addr == 16'hcf ? 16'h00c5 :  // <0015> "
addr == 16'hd0 ? 16'h1408 :  // <0016> pop y // rtn
addr == 16'hd1 ? 16'h1008 :  // <0016> pop x // "
addr == 16'hd2 ? 16'hfc00 :  // <0016> rtn



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
addr == 16'hdb ? 16'h0033 :  // <0069> "
addr == 16'hdc ? 16'hfc00 :  // <0069> "
addr == 16'hdd ? 16'h0249 :  // <0070> a = 73 // putasc "I"
addr == 16'hde ? 16'h0000 :  // <0070> a = a // putasc "I"
addr == 16'hdf ? 16'hfba0 :  // <0070> putasc "I"
addr == 16'he0 ? 16'h0033 :  // <0070> "
addr == 16'he1 ? 16'hfc00 :  // <0070> "
addr == 16'he2 ? 16'h0253 :  // <0071> a = 83 // putasc "S"
addr == 16'he3 ? 16'h0000 :  // <0071> a = a // putasc "S"
addr == 16'he4 ? 16'hfba0 :  // <0071> putasc "S"
addr == 16'he5 ? 16'h0033 :  // <0071> "
addr == 16'he6 ? 16'hfc00 :  // <0071> "
addr == 16'he7 ? 16'h024f :  // <0072> a = 79 // putasc "O"
addr == 16'he8 ? 16'h0000 :  // <0072> a = a // putasc "O"
addr == 16'he9 ? 16'hfba0 :  // <0072> putasc "O"
addr == 16'hea ? 16'h0033 :  // <0072> "
addr == 16'heb ? 16'hfc00 :  // <0072> "
addr == 16'hec ? 16'h0252 :  // <0073> a = 82 // putasc "R"
addr == 16'hed ? 16'h0000 :  // <0073> a = a // putasc "R"
addr == 16'hee ? 16'hfba0 :  // <0073> putasc "R"
addr == 16'hef ? 16'h0033 :  // <0073> "
addr == 16'hf0 ? 16'hfc00 :  // <0073> "

//call :load_program

// step into the first target instruction.
addr == 16'hf1 ? 16'h3e08 :  // <0078> bus_ctrl = $bp_step_mask
addr == 16'hf2 ? 16'hfba0 :  // <0079> call :wait_for_bp
addr == 16'hf3 ? 16'h0184 :  // <0079> "
addr == 16'hf4 ? 16'hfc00 :  // <0079> "

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
// :cmd_loop // = 0x00f5
addr == 16'hf5 ? 16'h000f :  // <0104> a = bus_ctrl
addr == 16'hf6 ? 16'h0600 :  // <0105> b = 0
addr == 16'hf7 ? 16'he007 :  // <0106> br eq :nodump
addr == 16'hf8 ? 16'h010b :  // <0106> "
addr == 16'hf9 ? 16'hfba0 :  // <0107> call :dump_target
addr == 16'hfa ? 16'h024b :  // <0107> "
addr == 16'hfb ? 16'hfc00 :  // <0107> "
addr == 16'hfc ? 16'h0016 :  // <0108> a = tg_code_addr
addr == 16'hfd ? 16'hfba0 :  // <0109> call :put4x
addr == 16'hfe ? 16'h0053 :  // <0109> "
addr == 16'hff ? 16'hfc00 :  // <0109> "
addr == 16'h100 ? 16'h022c :  // <0110> a = 44 // putasc ","
addr == 16'h101 ? 16'h0000 :  // <0110> a = a // putasc ","
addr == 16'h102 ? 16'hfba0 :  // <0110> putasc ","
addr == 16'h103 ? 16'h0033 :  // <0110> "
addr == 16'h104 ? 16'hfc00 :  // <0110> "
addr == 16'h105 ? 16'h0015 :  // <0111> a = exr_shadow
addr == 16'h106 ? 16'hfba0 :  // <0112> call :put4x
addr == 16'h107 ? 16'h0053 :  // <0112> "
addr == 16'h108 ? 16'hfc00 :  // <0112> "
addr == 16'h109 ? 16'he00f :  // <0113> jmp :prompt_done
addr == 16'h10a ? 16'h011a :  // <0113> "
// :nodump // = 0x010b
addr == 16'h10b ? 16'h0252 :  // <0115> a = 82 // putasc "R"
addr == 16'h10c ? 16'h0000 :  // <0115> a = a // putasc "R"
addr == 16'h10d ? 16'hfba0 :  // <0115> putasc "R"
addr == 16'h10e ? 16'h0033 :  // <0115> "
addr == 16'h10f ? 16'hfc00 :  // <0115> "
addr == 16'h110 ? 16'h0255 :  // <0116> a = 85 // putasc "U"
addr == 16'h111 ? 16'h0000 :  // <0116> a = a // putasc "U"
addr == 16'h112 ? 16'hfba0 :  // <0116> putasc "U"
addr == 16'h113 ? 16'h0033 :  // <0116> "
addr == 16'h114 ? 16'hfc00 :  // <0116> "
addr == 16'h115 ? 16'h024e :  // <0117> a = 78 // putasc "N"
addr == 16'h116 ? 16'h0000 :  // <0117> a = a // putasc "N"
addr == 16'h117 ? 16'hfba0 :  // <0117> putasc "N"
addr == 16'h118 ? 16'h0033 :  // <0117> "
addr == 16'h119 ? 16'hfc00 :  // <0117> "
// :prompt_done // = 0x011a
addr == 16'h11a ? 16'h0220 :  // <0119> a = 32 // putasc " "
addr == 16'h11b ? 16'h0000 :  // <0119> a = a // putasc " "
addr == 16'h11c ? 16'hfba0 :  // <0119> putasc " "
addr == 16'h11d ? 16'h0033 :  // <0119> "
addr == 16'h11e ? 16'hfc00 :  // <0119> "
addr == 16'h11f ? 16'h023e :  // <0120> a = 62 // putasc ">"
addr == 16'h120 ? 16'h0000 :  // <0120> a = a // putasc ">"
addr == 16'h121 ? 16'hfba0 :  // <0120> putasc ">"
addr == 16'h122 ? 16'h0033 :  // <0120> "
addr == 16'h123 ? 16'hfc00 :  // <0120> "
addr == 16'h124 ? 16'hfba0 :  // <0121> getchar
addr == 16'h125 ? 16'h0042 :  // <0121> "
addr == 16'h126 ? 16'hfc00 :  // <0121> "
addr == 16'h127 ? 16'h2000 :  // <0121> push a // "
addr == 16'h128 ? 16'h0000 :  // <0121> a = a // "
addr == 16'h129 ? 16'hfba0 :  // <0121> "
addr == 16'h12a ? 16'h0033 :  // <0121> "
addr == 16'h12b ? 16'hfc00 :  // <0121> "
addr == 16'h12c ? 16'h0008 :  // <0121> pop a // "

// command = step next instruction.
addr == 16'h12d ? 16'h066e :  // <0124> b = 110 // asc b = "n"
addr == 16'h12e ? 16'he407 :  // <0125> bn eq :skip_step
addr == 16'h12f ? 16'h0137 :  // <0125> "
addr == 16'h130 ? 16'h3e08 :  // <0126> bus_ctrl = $bp_step_mask
addr == 16'h131 ? 16'h2409 :  // <0127> bp0_addr = bp0_addr
addr == 16'h132 ? 16'hfba0 :  // <0128> call :wait_for_bp
addr == 16'h133 ? 16'h0184 :  // <0128> "
addr == 16'h134 ? 16'hfc00 :  // <0128> "
addr == 16'h135 ? 16'he00f :  // <0129> jmp :cmd_loop
addr == 16'h136 ? 16'h00f5 :  // <0129> "
// :skip_step // = 0x0137

// command = reset target.
addr == 16'h137 ? 16'h0652 :  // <0133> b = 82 // asc b = "R"
addr == 16'h138 ? 16'he407 :  // <0134> bn eq :skip_reset
addr == 16'h139 ? 16'h0143 :  // <0134> "
addr == 16'h13a ? 16'h3e02 :  // <0135> bus_ctrl = $tg_reset_mask
addr == 16'h13b ? 16'hc800 :  // <0136> nop
addr == 16'h13c ? 16'hc800 :  // <0137> nop
addr == 16'h13d ? 16'h3e08 :  // <0138> bus_ctrl = $bp_step_mask
addr == 16'h13e ? 16'hfba0 :  // <0139> call :wait_for_bp
addr == 16'h13f ? 16'h0184 :  // <0139> "
addr == 16'h140 ? 16'hfc00 :  // <0139> "
addr == 16'h141 ? 16'he00f :  // <0140> jmp :cmd_loop
addr == 16'h142 ? 16'h00f5 :  // <0140> "
// :skip_reset // = 0x0143

// command = load program.
addr == 16'h143 ? 16'h066c :  // <0144> b = 108 // asc b = "l"
addr == 16'h144 ? 16'he407 :  // <0145> bn eq :skip_load
addr == 16'h145 ? 16'h014b :  // <0145> "
addr == 16'h146 ? 16'hfba0 :  // <0146> call :load_program
addr == 16'h147 ? 16'h01de :  // <0146> "
addr == 16'h148 ? 16'hfc00 :  // <0146> "
addr == 16'h149 ? 16'he00f :  // <0147> jmp :cmd_loop
addr == 16'h14a ? 16'h00f5 :  // <0147> "
// :skip_load // = 0x014b

// command = run full speed.
addr == 16'h14b ? 16'h0672 :  // <0151> b = 114 // asc b = "r"
addr == 16'h14c ? 16'he407 :  // <0152> bn eq :skip_run
addr == 16'h14d ? 16'h0152 :  // <0152> "
// release target reset, to run.
addr == 16'h14e ? 16'h3e00 :  // <0154> bus_ctrl = 0
addr == 16'h14f ? 16'h2409 :  // <0155> bp0_addr = bp0_addr
addr == 16'h150 ? 16'he00f :  // <0156> jmp :cmd_loop
addr == 16'h151 ? 16'h00f5 :  // <0156> "
// :skip_run // = 0x0152

// // command = interrupt / break target.
// asc b = "i"
// bn eq :skip_brk
// bus_ctrl = 0
// bus_ctrl = $bp_step_mask
// call :wait_for_bp
// jmp :cmd_loop
// :skip_brk

// command = set breakpoint.
addr == 16'h152 ? 16'h0662 :  // <0169> b = 98 // asc b = "b"
addr == 16'h153 ? 16'he407 :  // <0170> bn eq :skip_setbrk
addr == 16'h154 ? 16'h015a :  // <0170> "
addr == 16'h155 ? 16'hfba0 :  // <0171> call :set_bp
addr == 16'h156 ? 16'h0188 :  // <0171> "
addr == 16'h157 ? 16'hfc00 :  // <0171> "
addr == 16'h158 ? 16'he00f :  // <0172> jmp :cmd_loop
addr == 16'h159 ? 16'h00f5 :  // <0172> "
// :skip_setbrk // = 0x015a

addr == 16'h15a ? 16'h023f :  // <0175> a = 63 // putasc "?"
addr == 16'h15b ? 16'h0000 :  // <0175> a = a // putasc "?"
addr == 16'h15c ? 16'hfba0 :  // <0175> putasc "?"
addr == 16'h15d ? 16'h0033 :  // <0175> "
addr == 16'h15e ? 16'hfc00 :  // <0175> "
addr == 16'h15f ? 16'h020d :  // <0176> a = 13 // puteol
addr == 16'h160 ? 16'h0000 :  // <0176> a = a // puteol
addr == 16'h161 ? 16'hfba0 :  // <0176> puteol
addr == 16'h162 ? 16'h0033 :  // <0176> "
addr == 16'h163 ? 16'hfc00 :  // <0176> "
addr == 16'h164 ? 16'h020a :  // <0176> a = 10 // puteol
addr == 16'h165 ? 16'h0000 :  // <0176> a = a // puteol
addr == 16'h166 ? 16'hfba0 :  // <0176> puteol
addr == 16'h167 ? 16'h0033 :  // <0176> "
addr == 16'h168 ? 16'hfc00 :  // <0176> "
addr == 16'h169 ? 16'he00f :  // <0177> jmp :cmd_loop
addr == 16'h16a ? 16'h00f5 :  // <0177> "

// demonstrations //////////////////////////////

// set a breakpoint, wait til it hits.
addr == 16'h16b ? 16'h2615 :  // <0182> bp0_addr = 0x15
// :main_loop // = 0x016c
addr == 16'h16c ? 16'hfba0 :  // <0184> call :wait_for_bp
addr == 16'h16d ? 16'h0184 :  // <0184> "
addr == 16'h16e ? 16'hfc00 :  // <0184> "

// release target to run full speed.
addr == 16'h16f ? 16'h3e00 :  // <0187> bus_ctrl = 0

// interrupt the target and single step it a few times.
addr == 16'h170 ? 16'h3e08 :  // <0190> bus_ctrl = $bp_step_mask
addr == 16'h171 ? 16'hfba0 :  // <0191> call :wait_for_bp
addr == 16'h172 ? 16'h0184 :  // <0191> "
addr == 16'h173 ? 16'hfc00 :  // <0191> "
addr == 16'h174 ? 16'h2409 :  // <0192> bp0_addr = bp0_addr
addr == 16'h175 ? 16'hfba0 :  // <0193> call :wait_for_bp
addr == 16'h176 ? 16'h0184 :  // <0193> "
addr == 16'h177 ? 16'hfc00 :  // <0193> "
addr == 16'h178 ? 16'h2409 :  // <0194> bp0_addr = bp0_addr
addr == 16'h179 ? 16'hfba0 :  // <0195> call :wait_for_bp
addr == 16'h17a ? 16'h0184 :  // <0195> "
addr == 16'h17b ? 16'hfc00 :  // <0195> "
addr == 16'h17c ? 16'h2409 :  // <0196> bp0_addr = bp0_addr
addr == 16'h17d ? 16'hfba0 :  // <0197> call :wait_for_bp
addr == 16'h17e ? 16'h0184 :  // <0197> "
addr == 16'h17f ? 16'hfc00 :  // <0197> "
addr == 16'h180 ? 16'h3e00 :  // <0198> bus_ctrl = 0

// release target to pass breakpoint once.
addr == 16'h181 ? 16'h2409 :  // <0201> bp0_addr = bp0_addr

addr == 16'h182 ? 16'he00f :  // <0203> jmp :main_loop
addr == 16'h183 ? 16'h016c :  // <0203> "

// func wait_for_bp // = 0x0184
addr == 16'h184 ? 16'h0018 :  // <0206> a = bp_status
addr == 16'h185 ? 16'he000 :  // <0207> br az :wait_for_bp
addr == 16'h186 ? 16'h0184 :  // <0207> "
addr == 16'h187 ? 16'hfc00 :  // <0208> rtn

// func set_bp // = 0x0188
addr == 16'h188 ? 16'h2004 :  // <0210> push x // func set_bp
addr == 16'h189 ? 16'h2005 :  // <0210> push y // "
addr == 16'h18a ? 16'h203e :  // <0210> push rtna // "
addr == 16'h18b ? 16'hfba0 :  // <0211> getchar
addr == 16'h18c ? 16'h0042 :  // <0211> "
addr == 16'h18d ? 16'hfc00 :  // <0211> "
addr == 16'h18e ? 16'h2000 :  // <0211> push a // "
addr == 16'h18f ? 16'h0000 :  // <0211> a = a // "
addr == 16'h190 ? 16'hfba0 :  // <0211> "
addr == 16'h191 ? 16'h0033 :  // <0211> "
addr == 16'h192 ? 16'hfc00 :  // <0211> "
addr == 16'h193 ? 16'h0008 :  // <0211> pop a // "
addr == 16'h194 ? 16'h1000 :  // <0212> x = a
addr == 16'h195 ? 16'hfba0 :  // <0213> getchar
addr == 16'h196 ? 16'h0042 :  // <0213> "
addr == 16'h197 ? 16'hfc00 :  // <0213> "
addr == 16'h198 ? 16'h2000 :  // <0213> push a // "
addr == 16'h199 ? 16'h0000 :  // <0213> a = a // "
addr == 16'h19a ? 16'hfba0 :  // <0213> "
addr == 16'h19b ? 16'h0033 :  // <0213> "
addr == 16'h19c ? 16'hfc00 :  // <0213> "
addr == 16'h19d ? 16'h0008 :  // <0213> pop a // "
addr == 16'h19e ? 16'h063d :  // <0214> b = 61 // asc b = "="
addr == 16'h19f ? 16'he407 :  // <0215> bn eq :fail
addr == 16'h1a0 ? 16'h01cb :  // <0215> "
addr == 16'h1a1 ? 16'hfba0 :  // <0216> call :get4x
addr == 16'h1a2 ? 16'h0090 :  // <0216> "
addr == 16'h1a3 ? 16'hfc00 :  // <0216> "
addr == 16'h1a4 ? 16'h1400 :  // <0217> y = a
addr == 16'h1a5 ? 16'h0200 :  // <0218> a = 0
addr == 16'h1a6 ? 16'he407 :  // <0219> bn eq :fail
addr == 16'h1a7 ? 16'h01cb :  // <0219> "
addr == 16'h1a8 ? 16'h0004 :  // <0220> a = x
addr == 16'h1a9 ? 16'h0600 :  // <0221> b = 0
addr == 16'h1aa ? 16'he007 :  // <0222> br eq :b0
addr == 16'h1ab ? 16'h01b7 :  // <0222> "
addr == 16'h1ac ? 16'h0601 :  // <0223> b = 1
addr == 16'h1ad ? 16'he007 :  // <0224> br eq :b1
addr == 16'h1ae ? 16'h01bc :  // <0224> "
addr == 16'h1af ? 16'h0602 :  // <0225> b = 2
addr == 16'h1b0 ? 16'he007 :  // <0226> br eq :b2
addr == 16'h1b1 ? 16'h01c1 :  // <0226> "
addr == 16'h1b2 ? 16'h0603 :  // <0227> b = 3
addr == 16'h1b3 ? 16'he007 :  // <0228> br eq :b3
addr == 16'h1b4 ? 16'h01c6 :  // <0228> "
addr == 16'h1b5 ? 16'he00f :  // <0229> jmp :fail
addr == 16'h1b6 ? 16'h01cb :  // <0229> "
// :b0 // = 0x01b7
addr == 16'h1b7 ? 16'h2405 :  // <0231> bp0_addr = y
addr == 16'h1b8 ? 16'hf808 :  // <0232> pop rtna // rtn
addr == 16'h1b9 ? 16'h1408 :  // <0232> pop y // "
addr == 16'h1ba ? 16'h1008 :  // <0232> pop x // "
addr == 16'h1bb ? 16'hfc00 :  // <0232> rtn
// :b1 // = 0x01bc
addr == 16'h1bc ? 16'h2805 :  // <0234> bp1_addr = y
addr == 16'h1bd ? 16'hf808 :  // <0235> pop rtna // rtn
addr == 16'h1be ? 16'h1408 :  // <0235> pop y // "
addr == 16'h1bf ? 16'h1008 :  // <0235> pop x // "
addr == 16'h1c0 ? 16'hfc00 :  // <0235> rtn
// :b2 // = 0x01c1
addr == 16'h1c1 ? 16'h2c05 :  // <0237> bp2_addr = y
addr == 16'h1c2 ? 16'hf808 :  // <0238> pop rtna // rtn
addr == 16'h1c3 ? 16'h1408 :  // <0238> pop y // "
addr == 16'h1c4 ? 16'h1008 :  // <0238> pop x // "
addr == 16'h1c5 ? 16'hfc00 :  // <0238> rtn
// :b3 // = 0x01c6
addr == 16'h1c6 ? 16'h3005 :  // <0240> bp3_addr = y
addr == 16'h1c7 ? 16'hf808 :  // <0241> pop rtna // rtn
addr == 16'h1c8 ? 16'h1408 :  // <0241> pop y // "
addr == 16'h1c9 ? 16'h1008 :  // <0241> pop x // "
addr == 16'h1ca ? 16'hfc00 :  // <0241> rtn
// :fail // = 0x01cb
addr == 16'h1cb ? 16'h023f :  // <0243> a = 63 // putasc "?"
addr == 16'h1cc ? 16'h0000 :  // <0243> a = a // putasc "?"
addr == 16'h1cd ? 16'hfba0 :  // <0243> putasc "?"
addr == 16'h1ce ? 16'h0033 :  // <0243> "
addr == 16'h1cf ? 16'hfc00 :  // <0243> "
addr == 16'h1d0 ? 16'h020d :  // <0244> a = 13 // puteol
addr == 16'h1d1 ? 16'h0000 :  // <0244> a = a // puteol
addr == 16'h1d2 ? 16'hfba0 :  // <0244> puteol
addr == 16'h1d3 ? 16'h0033 :  // <0244> "
addr == 16'h1d4 ? 16'hfc00 :  // <0244> "
addr == 16'h1d5 ? 16'h020a :  // <0244> a = 10 // puteol
addr == 16'h1d6 ? 16'h0000 :  // <0244> a = a // puteol
addr == 16'h1d7 ? 16'hfba0 :  // <0244> puteol
addr == 16'h1d8 ? 16'h0033 :  // <0244> "
addr == 16'h1d9 ? 16'hfc00 :  // <0244> "
addr == 16'h1da ? 16'hf808 :  // <0245> pop rtna // rtn
addr == 16'h1db ? 16'h1408 :  // <0245> pop y // "
addr == 16'h1dc ? 16'h1008 :  // <0245> pop x // "
addr == 16'h1dd ? 16'hfc00 :  // <0245> rtn

// func load_program // = 0x01de
addr == 16'h1de ? 16'h2002 :  // <0247> push i // func load_program
addr == 16'h1df ? 16'h2003 :  // <0247> push j // "
addr == 16'h1e0 ? 16'h2004 :  // <0247> push x // "
addr == 16'h1e1 ? 16'h2006 :  // <0247> push g6 // "
addr == 16'h1e2 ? 16'h203e :  // <0247> push rtna // "
// load target program from UART.
// length, little-endian.  memorize in x.
addr == 16'h1e3 ? 16'h024c :  // <0250> a = 76 // putasc L
addr == 16'h1e4 ? 16'h0000 :  // <0250> a = a // putasc L
addr == 16'h1e5 ? 16'hfba0 :  // <0250> putasc L
addr == 16'h1e6 ? 16'h0033 :  // <0250> "
addr == 16'h1e7 ? 16'hfc00 :  // <0250> "
addr == 16'h1e8 ? 16'hfba0 :  // <0251> get16 x
addr == 16'h1e9 ? 16'h0042 :  // <0251> "
addr == 16'h1ea ? 16'hfc00 :  // <0251> "
addr == 16'h1eb ? 16'h2000 :  // <0251> push a // "
addr == 16'h1ec ? 16'hfba0 :  // <0251> "
addr == 16'h1ed ? 16'h0042 :  // <0251> "
addr == 16'h1ee ? 16'hfc00 :  // <0251> "
addr == 16'h1ef ? 16'h0352 :  // <0251> "
addr == 16'h1f0 ? 16'h0352 :  // <0251> "
addr == 16'h1f1 ? 16'h0408 :  // <0251> pop b // "
addr == 16'h1f2 ? 16'hc800 :  // <0251> "
addr == 16'h1f3 ? 16'h1334 :  // <0251> "
addr == 16'h1f4 ? 16'h0004 :  // <0252> a = x
addr == 16'h1f5 ? 16'hfba0 :  // <0253> call put4x
addr == 16'h1f6 ? 16'h0053 :  // <0253> "
addr == 16'h1f7 ? 16'hfc00 :  // <0253> "
// put target into reset again, in case this is a target warm boot.
addr == 16'h1f8 ? 16'h3e02 :  // <0255> bus_ctrl = $tg_reset_mask
// load opcodes.  count up address in i.
addr == 16'h1f9 ? 16'h0a00 :  // <0257> i = 0
addr == 16'h1fa ? 16'h0e01 :  // <0258> j = 1
// :loadword // = 0x01fb
addr == 16'h1fb ? 16'h0241 :  // <0260> a = 65 // putasc A
addr == 16'h1fc ? 16'h0000 :  // <0260> a = a // putasc A
addr == 16'h1fd ? 16'hfba0 :  // <0260> putasc A
addr == 16'h1fe ? 16'h0033 :  // <0260> "
addr == 16'h1ff ? 16'hfc00 :  // <0260> "
addr == 16'h200 ? 16'h0002 :  // <0261> a = i
addr == 16'h201 ? 16'hfba0 :  // <0262> call put4x
addr == 16'h202 ? 16'h0053 :  // <0262> "
addr == 16'h203 ? 16'hfc00 :  // <0262> "
addr == 16'h204 ? 16'h023d :  // <0263> a = 61 // putasc "="
addr == 16'h205 ? 16'h0000 :  // <0263> a = a // putasc "="
addr == 16'h206 ? 16'hfba0 :  // <0263> putasc "="
addr == 16'h207 ? 16'h0033 :  // <0263> "
addr == 16'h208 ? 16'hfc00 :  // <0263> "
addr == 16'h209 ? 16'hfba0 :  // <0264> get16 g6
addr == 16'h20a ? 16'h0042 :  // <0264> "
addr == 16'h20b ? 16'hfc00 :  // <0264> "
addr == 16'h20c ? 16'h2000 :  // <0264> push a // "
addr == 16'h20d ? 16'hfba0 :  // <0264> "
addr == 16'h20e ? 16'h0042 :  // <0264> "
addr == 16'h20f ? 16'hfc00 :  // <0264> "
addr == 16'h210 ? 16'h0352 :  // <0264> "
addr == 16'h211 ? 16'h0352 :  // <0264> "
addr == 16'h212 ? 16'h0408 :  // <0264> pop b // "
addr == 16'h213 ? 16'hc800 :  // <0264> "
addr == 16'h214 ? 16'h1b34 :  // <0264> "
addr == 16'h215 ? 16'h0006 :  // <0265> a = g6
addr == 16'h216 ? 16'hfba0 :  // <0266> call put4x
addr == 16'h217 ? 16'h0053 :  // <0266> "
addr == 16'h218 ? 16'hfc00 :  // <0266> "
addr == 16'h219 ? 16'h023d :  // <0267> a = 61 // putasc "="
addr == 16'h21a ? 16'h0000 :  // <0267> a = a // putasc "="
addr == 16'h21b ? 16'hfba0 :  // <0267> putasc "="
addr == 16'h21c ? 16'h0033 :  // <0267> "
addr == 16'h21d ? 16'hfc00 :  // <0267> "
addr == 16'h21e ? 16'h4c02 :  // <0268> m9k_addr = i
addr == 16'h21f ? 16'h5006 :  // <0269> m9k_data = g6
addr == 16'h220 ? 16'h0014 :  // <0270> a = m9k_data
addr == 16'h221 ? 16'hfba0 :  // <0271> call put4x
addr == 16'h222 ? 16'h0053 :  // <0271> "
addr == 16'h223 ? 16'hfc00 :  // <0271> "
addr == 16'h224 ? 16'h020d :  // <0272> a = 13 // puteol
addr == 16'h225 ? 16'h0000 :  // <0272> a = a // puteol
addr == 16'h226 ? 16'hfba0 :  // <0272> puteol
addr == 16'h227 ? 16'h0033 :  // <0272> "
addr == 16'h228 ? 16'hfc00 :  // <0272> "
addr == 16'h229 ? 16'h020a :  // <0272> a = 10 // puteol
addr == 16'h22a ? 16'h0000 :  // <0272> a = a // puteol
addr == 16'h22b ? 16'hfba0 :  // <0272> puteol
addr == 16'h22c ? 16'h0033 :  // <0272> "
addr == 16'h22d ? 16'hfc00 :  // <0272> "
addr == 16'h22e ? 16'hc800 :  // <0273> i = i+j
addr == 16'h22f ? 16'h0b10 :  // <0273> "
addr == 16'h230 ? 16'h0002 :  // <0274> a = i
addr == 16'h231 ? 16'h0404 :  // <0275> b = x
addr == 16'h232 ? 16'he407 :  // <0276> bn eq :loadword
addr == 16'h233 ? 16'h01fb :  // <0276> "
addr == 16'h234 ? 16'hf808 :  // <0277> pop rtna // rtn
addr == 16'h235 ? 16'h1808 :  // <0277> pop g6 // "
addr == 16'h236 ? 16'h1008 :  // <0277> pop x // "
addr == 16'h237 ? 16'h0c08 :  // <0277> pop j // "
addr == 16'h238 ? 16'h0808 :  // <0277> pop i // "
addr == 16'h239 ? 16'hfc00 :  // <0277> rtn

// observe a register.  return its value in peek_data.
// pass its register address in a.
// func peek // = 0x023a
addr == 16'h23a ? 16'h07a0 :  // <0282> b = 0x3ff
addr == 16'h23b ? 16'h03ff :  // <0282> "
addr == 16'h23c ? 16'hc800 :  // <0283> a = and
addr == 16'h23d ? 16'h0330 :  // <0283> "
// debug_peek_reg = 31 << 10
addr == 16'h23e ? 16'h07a0 :  // <0285> b = 0x7c00
addr == 16'h23f ? 16'h7c00 :  // <0285> "
addr == 16'h240 ? 16'hc800 :  // <0286> force_opcode = or
addr == 16'h241 ? 16'h3734 :  // <0286> "
addr == 16'h242 ? 16'h3e04 :  // <0287> bus_ctrl = $divert_code_bus_mask
addr == 16'h243 ? 16'h4201 :  // <0288> tg_force = $hold_state_mask
addr == 16'h244 ? 16'h4203 :  // <0289> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h245 ? 16'h4205 :  // <0290> tg_force = ($hold_state_mask | $force_exec_mask)
addr == 16'h246 ? 16'h4201 :  // <0291> tg_force = $hold_state_mask
// target's register value is now in peek_data.
// refill target exr so it can resume seamlessly.
addr == 16'h247 ? 16'h3415 :  // <0294> force_opcode = exr_shadow
addr == 16'h248 ? 16'h4203 :  // <0295> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h249 ? 16'h4200 :  // <0296> tg_force = 0
addr == 16'h24a ? 16'hfc00 :  // <0297> rtn

// show target status display.
// func dump_target // = 0x024b
addr == 16'h24b ? 16'h2002 :  // <0300> push i // func dump_target
addr == 16'h24c ? 16'h2003 :  // <0300> push j // "
addr == 16'h24d ? 16'h2004 :  // <0300> push x // "
addr == 16'h24e ? 16'h2005 :  // <0300> push y // "
addr == 16'h24f ? 16'h203e :  // <0300> push rtna // "
addr == 16'h250 ? 16'h020d :  // <0301> a = 13 // puteol
addr == 16'h251 ? 16'h0000 :  // <0301> a = a // puteol
addr == 16'h252 ? 16'hfba0 :  // <0301> puteol
addr == 16'h253 ? 16'h0033 :  // <0301> "
addr == 16'h254 ? 16'hfc00 :  // <0301> "
addr == 16'h255 ? 16'h020a :  // <0301> a = 10 // puteol
addr == 16'h256 ? 16'h0000 :  // <0301> a = a // puteol
addr == 16'h257 ? 16'hfba0 :  // <0301> puteol
addr == 16'h258 ? 16'h0033 :  // <0301> "
addr == 16'h259 ? 16'hfc00 :  // <0301> "
addr == 16'h25a ? 16'h0a00 :  // <0302> i = 0
// :next_reg // = 0x025b
// fetch register name from table in target program.
addr == 16'h25b ? 16'h1200 :  // <0305> x = 0
addr == 16'h25c ? 16'h1601 :  // <0306> y = 1
// :next_chars // = 0x025d
addr == 16'h25d ? 16'h0002 :  // <0308> a = i
addr == 16'h25e ? 16'h0351 :  // <0309> a = a<<1
addr == 16'h25f ? 16'h0351 :  // <0310> a = a<<1
addr == 16'h260 ? 16'h0603 :  // <0311> b = 3
addr == 16'h261 ? 16'hc800 :  // <0312> a = a+b
addr == 16'h262 ? 16'h0300 :  // <0312> "
addr == 16'h263 ? 16'h0404 :  // <0313> b = x
addr == 16'h264 ? 16'hc800 :  // <0314> m9k_addr = a+b
addr == 16'h265 ? 16'h4f00 :  // <0314> "
addr == 16'h266 ? 16'h0014 :  // <0315> a = m9k_data // putchar m9k_data
addr == 16'h267 ? 16'hfba0 :  // <0315> putchar m9k_data
addr == 16'h268 ? 16'h0033 :  // <0315> "
addr == 16'h269 ? 16'hfc00 :  // <0315> "
addr == 16'h26a ? 16'h0014 :  // <0316> a = m9k_data
addr == 16'h26b ? 16'h0353 :  // <0317> a = a>>4
addr == 16'h26c ? 16'h0353 :  // <0318> a = a>>4
addr == 16'h26d ? 16'h0000 :  // <0319> a = a // putchar a
addr == 16'h26e ? 16'hfba0 :  // <0319> putchar a
addr == 16'h26f ? 16'h0033 :  // <0319> "
addr == 16'h270 ? 16'hfc00 :  // <0319> "
addr == 16'h271 ? 16'hc800 :  // <0320> x = x+y
addr == 16'h272 ? 16'h1320 :  // <0320> "
addr == 16'h273 ? 16'h0004 :  // <0321> a = x
addr == 16'h274 ? 16'h0604 :  // <0322> b = 4
addr == 16'h275 ? 16'he407 :  // <0323> bn eq :next_chars
addr == 16'h276 ? 16'h025d :  // <0323> "
addr == 16'h277 ? 16'h023d :  // <0324> a = 61 // putasc "="
addr == 16'h278 ? 16'h0000 :  // <0324> a = a // putasc "="
addr == 16'h279 ? 16'hfba0 :  // <0324> putasc "="
addr == 16'h27a ? 16'h0033 :  // <0324> "
addr == 16'h27b ? 16'hfc00 :  // <0324> "
addr == 16'h27c ? 16'h0002 :  // <0325> a = i
addr == 16'h27d ? 16'hfba0 :  // <0326> call :peek
addr == 16'h27e ? 16'h023a :  // <0326> "
addr == 16'h27f ? 16'hfc00 :  // <0326> "
addr == 16'h280 ? 16'h0017 :  // <0327> a = peek_data
addr == 16'h281 ? 16'hfba0 :  // <0328> call :put4x
addr == 16'h282 ? 16'h0053 :  // <0328> "
addr == 16'h283 ? 16'hfc00 :  // <0328> "
addr == 16'h284 ? 16'h0220 :  // <0329> a = 32 // putasc " "
addr == 16'h285 ? 16'h0000 :  // <0329> a = a // putasc " "
addr == 16'h286 ? 16'hfba0 :  // <0329> putasc " "
addr == 16'h287 ? 16'h0033 :  // <0329> "
addr == 16'h288 ? 16'hfc00 :  // <0329> "
addr == 16'h289 ? 16'h0e01 :  // <0330> j = 1
addr == 16'h28a ? 16'hc800 :  // <0331> i = i+j
addr == 16'h28b ? 16'h0b10 :  // <0331> "
// loop up to the number of registers in the target program's register name table.
addr == 16'h28c ? 16'h4e02 :  // <0333> m9k_addr = 2
addr == 16'h28d ? 16'h0414 :  // <0334> b = m9k_data
addr == 16'h28e ? 16'h0002 :  // <0335> a = i
addr == 16'h28f ? 16'he407 :  // <0336> bn eq :next_reg
addr == 16'h290 ? 16'h025b :  // <0336> "
addr == 16'h291 ? 16'h020d :  // <0337> a = 13 // puteol
addr == 16'h292 ? 16'h0000 :  // <0337> a = a // puteol
addr == 16'h293 ? 16'hfba0 :  // <0337> puteol
addr == 16'h294 ? 16'h0033 :  // <0337> "
addr == 16'h295 ? 16'hfc00 :  // <0337> "
addr == 16'h296 ? 16'h020a :  // <0337> a = 10 // puteol
addr == 16'h297 ? 16'h0000 :  // <0337> a = a // puteol
addr == 16'h298 ? 16'hfba0 :  // <0337> puteol
addr == 16'h299 ? 16'h0033 :  // <0337> "
addr == 16'h29a ? 16'hfc00 :  // <0337> "
addr == 16'h29b ? 16'hf808 :  // <0338> pop rtna // rtn
addr == 16'h29c ? 16'h1408 :  // <0338> pop y // "
addr == 16'h29d ? 16'h1008 :  // <0338> pop x // "
addr == 16'h29e ? 16'h0c08 :  // <0338> pop j // "
addr == 16'h29f ? 16'h0808 :  // <0338> pop i // "
addr == 16'h2a0 ? 16'hfc00 :  // <0338> rtn
        
                16'hxxxx;
        endmodule
    
