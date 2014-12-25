
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
addr == 16'h01 ? 16'h0088 :  // <0051> "


// pick a byte from an array of words.  fetch & return it in a.
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


// driver library for my_uart_v2 simple async transceiver.




// routine sends out the low byte from a to the UART.  blocks until the UART accepts the byte.
// func putchar_atx // = 0x0017
addr == 16'h17 ? 16'h2004 :  // <0024> push x // func putchar_atx

addr == 16'h18 ? 16'h1000 :  // <0026> x = a

// wait for UART to be idle (not busy).
addr == 16'h19 ? 16'h0202 :  // <0029> a = $atx_busy_mask
// :pcatx_wait_for_idle // = 0x001a
addr == 16'h1a ? 16'h0412 :  // <0031> b = atx_ctrl
addr == 16'h1b ? 16'hc800 :  // <0032> nop
addr == 16'h1c ? 16'he402 :  // <0033> bn and0z :pcatx_wait_for_idle
addr == 16'h1d ? 16'h001a :  // <0033> "

// push word to the UART.  its low byte is a character.
addr == 16'h1e ? 16'h4404 :  // <0036> atx_data = x

// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_ctrl.
addr == 16'h1f ? 16'h4a01 :  // <0041> atx_ctrl = $atx_load_mask

// wait until UART is busy, as acknowledgement.
addr == 16'h20 ? 16'h0202 :  // <0044> a = $atx_busy_mask
// :pcatx_wait_for_busy // = 0x0021
addr == 16'h21 ? 16'h0412 :  // <0046> b = atx_ctrl
addr == 16'h22 ? 16'he002 :  // <0047> br and0z :pcatx_wait_for_busy
addr == 16'h23 ? 16'h0021 :  // <0047> "

addr == 16'h24 ? 16'h4a00 :  // <0049> atx_ctrl = 0
addr == 16'h25 ? 16'h1008 :  // <0050> pop x // rtn
addr == 16'h26 ? 16'hfc00 :  // <0050> rtn

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// func getchar_atx // = 0x0027
// wait until UART is busy, then idle.
addr == 16'h27 ? 16'h0204 :  // <0056> a = $arx_busy_mask
// :wait_for_busy // = 0x0028
addr == 16'h28 ? 16'h0412 :  // <0058> b = atx_ctrl
addr == 16'h29 ? 16'he002 :  // <0059> br and0z :wait_for_busy
addr == 16'h2a ? 16'h0028 :  // <0059> "
// :wait_for_idle // = 0x002b
addr == 16'h2b ? 16'h0412 :  // <0061> b = atx_ctrl
addr == 16'h2c ? 16'hc800 :  // <0062> nop
addr == 16'h2d ? 16'he402 :  // <0063> bn and0z :wait_for_idle
addr == 16'h2e ? 16'h002b :  // <0063> "
addr == 16'h2f ? 16'h0011 :  // <0064> a = atx_data
addr == 16'h30 ? 16'hfc00 :  // <0065> rtn


// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x0031
addr == 16'h31 ? 16'h2004 :  // <0038> push x // func put4x
addr == 16'h32 ? 16'h2006 :  // <0038> push g6 // "
addr == 16'h33 ? 16'h203e :  // <0038> push rtna // "
addr == 16'h34 ? 16'h13a0 :  // <0039> x = :hexdigits
addr == 16'h35 ? 16'h006e :  // <0039> "

addr == 16'h36 ? 16'h1800 :  // <0041> g6 = a
addr == 16'h37 ? 16'h07a0 :  // <0042> b = 0xF000
addr == 16'h38 ? 16'hf000 :  // <0042> "
addr == 16'h39 ? 16'hc800 :  // <0043> nop
addr == 16'h3a ? 16'h0330 :  // <0044> a = and
addr == 16'h3b ? 16'h0353 :  // <0045> a = a>>4
addr == 16'h3c ? 16'h0353 :  // <0046> a = a>>4
addr == 16'h3d ? 16'h0353 :  // <0047> a = a>>4
addr == 16'h3e ? 16'hfba0 :  // <0048> call fetch_byte
addr == 16'h3f ? 16'h0002 :  // <0048> "
addr == 16'h40 ? 16'hfc00 :  // <0048> "
addr == 16'h41 ? 16'h0000 :  // <0049> a = a // putchar a
addr == 16'h42 ? 16'hfba0 :  // <0049> putchar a
addr == 16'h43 ? 16'h0017 :  // <0049> "
addr == 16'h44 ? 16'hfc00 :  // <0049> "

addr == 16'h45 ? 16'h0006 :  // <0051> a = g6
addr == 16'h46 ? 16'h07a0 :  // <0052> b = 0x0F00
addr == 16'h47 ? 16'h0f00 :  // <0052> "
addr == 16'h48 ? 16'hc800 :  // <0053> nop
addr == 16'h49 ? 16'h0330 :  // <0054> a = and
addr == 16'h4a ? 16'h0353 :  // <0055> a = a>>4
addr == 16'h4b ? 16'h0353 :  // <0056> a = a>>4
addr == 16'h4c ? 16'hfba0 :  // <0057> call fetch_byte
addr == 16'h4d ? 16'h0002 :  // <0057> "
addr == 16'h4e ? 16'hfc00 :  // <0057> "
addr == 16'h4f ? 16'h0000 :  // <0058> a = a // putchar a
addr == 16'h50 ? 16'hfba0 :  // <0058> putchar a
addr == 16'h51 ? 16'h0017 :  // <0058> "
addr == 16'h52 ? 16'hfc00 :  // <0058> "

addr == 16'h53 ? 16'h0006 :  // <0060> a = g6
addr == 16'h54 ? 16'h06f0 :  // <0061> b = 0x00F0
addr == 16'h55 ? 16'hc800 :  // <0062> nop
addr == 16'h56 ? 16'h0330 :  // <0063> a = and
addr == 16'h57 ? 16'h0353 :  // <0064> a = a>>4
addr == 16'h58 ? 16'hfba0 :  // <0065> call fetch_byte
addr == 16'h59 ? 16'h0002 :  // <0065> "
addr == 16'h5a ? 16'hfc00 :  // <0065> "
addr == 16'h5b ? 16'h0000 :  // <0066> a = a // putchar a
addr == 16'h5c ? 16'hfba0 :  // <0066> putchar a
addr == 16'h5d ? 16'h0017 :  // <0066> "
addr == 16'h5e ? 16'hfc00 :  // <0066> "

addr == 16'h5f ? 16'h0006 :  // <0068> a = g6
addr == 16'h60 ? 16'h060f :  // <0069> b = 0x000F
addr == 16'h61 ? 16'hc800 :  // <0070> nop
addr == 16'h62 ? 16'h0330 :  // <0071> a = and
addr == 16'h63 ? 16'hfba0 :  // <0072> call fetch_byte
addr == 16'h64 ? 16'h0002 :  // <0072> "
addr == 16'h65 ? 16'hfc00 :  // <0072> "
addr == 16'h66 ? 16'h0000 :  // <0073> a = a // putchar a
addr == 16'h67 ? 16'hfba0 :  // <0073> putchar a
addr == 16'h68 ? 16'h0017 :  // <0073> "
addr == 16'h69 ? 16'hfc00 :  // <0073> "

addr == 16'h6a ? 16'hf808 :  // <0075> pop rtna // rtn
addr == 16'h6b ? 16'h1808 :  // <0075> pop g6 // "
addr == 16'h6c ? 16'h1008 :  // <0075> pop x // "
addr == 16'h6d ? 16'hfc00 :  // <0075> rtn

// :hexdigits // = 0x006e
// "0123456789abcdef"
addr == 16'h6e ? 16'h3130 :  // <0078> 10
addr == 16'h6f ? 16'h3332 :  // <0078> 32
addr == 16'h70 ? 16'h3534 :  // <0078> 54
addr == 16'h71 ? 16'h3736 :  // <0078> 76
addr == 16'h72 ? 16'h3938 :  // <0078> 98
addr == 16'h73 ? 16'h6261 :  // <0078> ba
addr == 16'h74 ? 16'h6463 :  // <0078> dc
addr == 16'h75 ? 16'h6665 :  // <0078> fe


// routine waits a number of milliseconds given in a.
// func spinwait // = 0x0076
addr == 16'h76 ? 16'h2004 :  // <0002> push x // func spinwait
addr == 16'h77 ? 16'h2005 :  // <0002> push y // "
//patch
//return
addr == 16'h78 ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x0079
addr == 16'h79 ? 16'h13a0 :  // <0007> x = 12500
addr == 16'h7a ? 16'h30d4 :  // <0007> "
addr == 16'h7b ? 16'h1760 :  // <0008> y = -1
addr == 16'h7c ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x007d
addr == 16'h7d ? 16'h1320 :  // <0011> x = x+y
addr == 16'h7e ? 16'hc800 :  // <0012> nop
addr == 16'h7f ? 16'he400 :  // <0013> bn 2z :spinwait_inner
addr == 16'h80 ? 16'h007d :  // <0013> "
addr == 16'h81 ? 16'h0300 :  // <0014> a = a+b
addr == 16'h82 ? 16'hc800 :  // <0015> nop
addr == 16'h83 ? 16'he404 :  // <0016> bn z :spinwait_outer
addr == 16'h84 ? 16'h0079 :  // <0016> "
addr == 16'h85 ? 16'h1408 :  // <0017> pop y // rtn
addr == 16'h86 ? 16'h1008 :  // <0017> pop x // "
addr == 16'h87 ? 16'hfc00 :  // <0017> rtn



// :main // = 0x0088
// put target into reset.
//    bus_ctrl = $tg_reset_mask

// init visor.
addr == 16'h88 ? 16'h3360 :  // <0063> bp3_addr = $bp_disable
addr == 16'h89 ? 16'h2f60 :  // <0064> bp2_addr = $bp_disable
addr == 16'h8a ? 16'h2b60 :  // <0065> bp1_addr = $bp_disable
addr == 16'h8b ? 16'h2760 :  // <0066> bp0_addr = $bp_disable

// // UART test character
// putasc T
// getchar
// b = 1
// nop
// a = a+b
// putchar a

// :next_load // = 0x008c

// load target program from UART.
// length, little-endian.  memorize in x.
addr == 16'h8c ? 16'h024c :  // <0080> a = 76 // putasc L
addr == 16'h8d ? 16'h0000 :  // <0080> a = a // putasc L
addr == 16'h8e ? 16'hfba0 :  // <0080> putasc L
addr == 16'h8f ? 16'h0017 :  // <0080> "
addr == 16'h90 ? 16'hfc00 :  // <0080> "
addr == 16'h91 ? 16'hfba0 :  // <0081> get16 x
addr == 16'h92 ? 16'h0027 :  // <0081> "
addr == 16'h93 ? 16'hfc00 :  // <0081> "
addr == 16'h94 ? 16'h2000 :  // <0081> push a // "
addr == 16'h95 ? 16'hfba0 :  // <0081> "
addr == 16'h96 ? 16'h0027 :  // <0081> "
addr == 16'h97 ? 16'hfc00 :  // <0081> "
addr == 16'h98 ? 16'h0352 :  // <0081> "
addr == 16'h99 ? 16'h0352 :  // <0081> "
addr == 16'h9a ? 16'h0408 :  // <0081> pop b // "
addr == 16'h9b ? 16'hc800 :  // <0081> "
addr == 16'h9c ? 16'h1334 :  // <0081> "
addr == 16'h9d ? 16'h0004 :  // <0082> a = x
addr == 16'h9e ? 16'hfba0 :  // <0083> call put4x
addr == 16'h9f ? 16'h0031 :  // <0083> "
addr == 16'ha0 ? 16'hfc00 :  // <0083> "
// put target into reset again, in case this is a target warm boot.
addr == 16'ha1 ? 16'h3e02 :  // <0085> bus_ctrl = $tg_reset_mask
// load opcodes.  count up address in i.
addr == 16'ha2 ? 16'h0a00 :  // <0087> i = 0
addr == 16'ha3 ? 16'h0e01 :  // <0088> j = 1
// :loadword // = 0x00a4
addr == 16'ha4 ? 16'h0241 :  // <0090> a = 65 // putasc A
addr == 16'ha5 ? 16'h0000 :  // <0090> a = a // putasc A
addr == 16'ha6 ? 16'hfba0 :  // <0090> putasc A
addr == 16'ha7 ? 16'h0017 :  // <0090> "
addr == 16'ha8 ? 16'hfc00 :  // <0090> "
addr == 16'ha9 ? 16'h0002 :  // <0091> a = i
addr == 16'haa ? 16'hfba0 :  // <0092> call put4x
addr == 16'hab ? 16'h0031 :  // <0092> "
addr == 16'hac ? 16'hfc00 :  // <0092> "
addr == 16'had ? 16'h023d :  // <0093> a = 61 // putasc "="
addr == 16'hae ? 16'h0000 :  // <0093> a = a // putasc "="
addr == 16'haf ? 16'hfba0 :  // <0093> putasc "="
addr == 16'hb0 ? 16'h0017 :  // <0093> "
addr == 16'hb1 ? 16'hfc00 :  // <0093> "
addr == 16'hb2 ? 16'hfba0 :  // <0094> get16 g6
addr == 16'hb3 ? 16'h0027 :  // <0094> "
addr == 16'hb4 ? 16'hfc00 :  // <0094> "
addr == 16'hb5 ? 16'h2000 :  // <0094> push a // "
addr == 16'hb6 ? 16'hfba0 :  // <0094> "
addr == 16'hb7 ? 16'h0027 :  // <0094> "
addr == 16'hb8 ? 16'hfc00 :  // <0094> "
addr == 16'hb9 ? 16'h0352 :  // <0094> "
addr == 16'hba ? 16'h0352 :  // <0094> "
addr == 16'hbb ? 16'h0408 :  // <0094> pop b // "
addr == 16'hbc ? 16'hc800 :  // <0094> "
addr == 16'hbd ? 16'h1b34 :  // <0094> "
addr == 16'hbe ? 16'h0006 :  // <0095> a = g6
addr == 16'hbf ? 16'hfba0 :  // <0096> call put4x
addr == 16'hc0 ? 16'h0031 :  // <0096> "
addr == 16'hc1 ? 16'hfc00 :  // <0096> "
addr == 16'hc2 ? 16'h023d :  // <0097> a = 61 // putasc "="
addr == 16'hc3 ? 16'h0000 :  // <0097> a = a // putasc "="
addr == 16'hc4 ? 16'hfba0 :  // <0097> putasc "="
addr == 16'hc5 ? 16'h0017 :  // <0097> "
addr == 16'hc6 ? 16'hfc00 :  // <0097> "
addr == 16'hc7 ? 16'h4c02 :  // <0098> m9k_addr = i
addr == 16'hc8 ? 16'h5006 :  // <0099> m9k_data = g6
addr == 16'hc9 ? 16'h0014 :  // <0100> a = m9k_data
addr == 16'hca ? 16'hfba0 :  // <0101> call put4x
addr == 16'hcb ? 16'h0031 :  // <0101> "
addr == 16'hcc ? 16'hfc00 :  // <0101> "
addr == 16'hcd ? 16'h020d :  // <0102> a = 13 // putasc "\r"
addr == 16'hce ? 16'h0000 :  // <0102> a = a // putasc "\r"
addr == 16'hcf ? 16'hfba0 :  // <0102> putasc "\r"
addr == 16'hd0 ? 16'h0017 :  // <0102> "
addr == 16'hd1 ? 16'hfc00 :  // <0102> "
addr == 16'hd2 ? 16'h020a :  // <0103> a = 10 // putasc "\n"
addr == 16'hd3 ? 16'h0000 :  // <0103> a = a // putasc "\n"
addr == 16'hd4 ? 16'hfba0 :  // <0103> putasc "\n"
addr == 16'hd5 ? 16'h0017 :  // <0103> "
addr == 16'hd6 ? 16'hfc00 :  // <0103> "
addr == 16'hd7 ? 16'h0b10 :  // <0104> i = i+j
addr == 16'hd8 ? 16'h0002 :  // <0105> a = i
addr == 16'hd9 ? 16'h0404 :  // <0106> b = x
addr == 16'hda ? 16'hc800 :  // <0107> nop
addr == 16'hdb ? 16'he407 :  // <0108> bn eq :loadword
addr == 16'hdc ? 16'h00a4 :  // <0108> "

// release target reset, to run.
addr == 16'hdd ? 16'h0252 :  // <0111> a = 82 // putasc R
addr == 16'hde ? 16'h0000 :  // <0111> a = a // putasc R
addr == 16'hdf ? 16'hfba0 :  // <0111> putasc R
addr == 16'he0 ? 16'h0017 :  // <0111> "
addr == 16'he1 ? 16'hfc00 :  // <0111> "
addr == 16'he2 ? 16'h3e00 :  // <0112> bus_ctrl = 0
addr == 16'he3 ? 16'he00f :  // <0113> jmp :next_load
addr == 16'he4 ? 16'h008c :  // <0113> "

// :halt // = 0x00e5
addr == 16'he5 ? 16'he00f :  // <0116> jmp :halt
addr == 16'he6 ? 16'h00e5 :  // <0116> "

// set a breakpoint, wait til it hits.
addr == 16'he7 ? 16'h2615 :  // <0119> bp0_addr = 0x15
// :main_loop // = 0x00e8
addr == 16'he8 ? 16'hfba0 :  // <0121> call :wait_for_bp
addr == 16'he9 ? 16'h011a :  // <0121> "
addr == 16'hea ? 16'hfc00 :  // <0121> "

// observe a register.
addr == 16'heb ? 16'h3e04 :  // <0124> bus_ctrl = $divert_code_bus_mask
addr == 16'hec ? 16'h4201 :  // <0125> tg_force = $hold_state_mask
addr == 16'hed ? 16'hd3a0 :  // <0126> fetch force_opcode from ([label observe] + 7)
addr == 16'hee ? 16'h0111 :  // <0126> "
addr == 16'hef ? 16'h37b0 :  // <0126> "
addr == 16'hf0 ? 16'h4203 :  // <0127> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'hf1 ? 16'h4205 :  // <0128> tg_force = ($hold_state_mask | $force_exec_mask)
addr == 16'hf2 ? 16'h4201 :  // <0129> tg_force = $hold_state_mask
// target's r7 value is now in peek_data.

// refill target exr so it can resume seamlessly.
addr == 16'hf3 ? 16'h3415 :  // <0133> force_opcode = exr_shadow
addr == 16'hf4 ? 16'h4203 :  // <0134> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'hf5 ? 16'h4200 :  // <0135> tg_force = 0
addr == 16'hf6 ? 16'h3e00 :  // <0136> bus_ctrl = 0

// interrupt the target and single step it a few times.
addr == 16'hf7 ? 16'h3e08 :  // <0139> bus_ctrl = $bp_step_mask
addr == 16'hf8 ? 16'hfba0 :  // <0140> call :wait_for_bp
addr == 16'hf9 ? 16'h011a :  // <0140> "
addr == 16'hfa ? 16'hfc00 :  // <0140> "
addr == 16'hfb ? 16'h2409 :  // <0141> bp0_addr = bp0_addr
addr == 16'hfc ? 16'hfba0 :  // <0142> call :wait_for_bp
addr == 16'hfd ? 16'h011a :  // <0142> "
addr == 16'hfe ? 16'hfc00 :  // <0142> "
addr == 16'hff ? 16'h2409 :  // <0143> bp0_addr = bp0_addr
addr == 16'h100 ? 16'hfba0 :  // <0144> call :wait_for_bp
addr == 16'h101 ? 16'h011a :  // <0144> "
addr == 16'h102 ? 16'hfc00 :  // <0144> "
addr == 16'h103 ? 16'h2409 :  // <0145> bp0_addr = bp0_addr
addr == 16'h104 ? 16'hfba0 :  // <0146> call :wait_for_bp
addr == 16'h105 ? 16'h011a :  // <0146> "
addr == 16'h106 ? 16'hfc00 :  // <0146> "
addr == 16'h107 ? 16'h3e00 :  // <0147> bus_ctrl = 0

// release target to pass breakpoint once.
addr == 16'h108 ? 16'h2409 :  // <0150> bp0_addr = bp0_addr

addr == 16'h109 ? 16'he00f :  // <0152> jmp :main_loop
addr == 16'h10a ? 16'h00e8 :  // <0152> "

// :observe // = 0x010b
// these instructions are assembled in the visor program, but passed to the target to execute.
addr == 16'h10b ? 16'h7c00 :  // <0157> debug_peek_reg = r0
addr == 16'h10c ? 16'h7c01 :  // <0158> debug_peek_reg = r1
addr == 16'h10d ? 16'h7c02 :  // <0159> debug_peek_reg = r2
addr == 16'h10e ? 16'h7c03 :  // <0160> debug_peek_reg = r3
addr == 16'h10f ? 16'h7c04 :  // <0161> debug_peek_reg = r4
addr == 16'h110 ? 16'h7c05 :  // <0162> debug_peek_reg = r5
addr == 16'h111 ? 16'h7c06 :  // <0163> debug_peek_reg = r6
addr == 16'h112 ? 16'h7c07 :  // <0164> debug_peek_reg = r7
addr == 16'h113 ? 16'h7c08 :  // <0165> debug_peek_reg = r8
addr == 16'h114 ? 16'h7c09 :  // <0166> debug_peek_reg = r9
addr == 16'h115 ? 16'h7c0a :  // <0167> debug_peek_reg = r10
addr == 16'h116 ? 16'h7c0b :  // <0168> debug_peek_reg = r11
addr == 16'h117 ? 16'h7c0c :  // <0169> debug_peek_reg = r12
addr == 16'h118 ? 16'h7c0d :  // <0170> debug_peek_reg = r13
addr == 16'h119 ? 16'h7c0e :  // <0171> debug_peek_reg = r14
addr == 16'h11a ? 16'h7c0f :  // <0172> debug_peek_reg = r15

// func wait_for_bp // = 0x011b
addr == 16'h11b ? 16'h0200 :  // <0175> a = 0
addr == 16'h11c ? 16'h0418 :  // <0176> b = bp_status
addr == 16'h11d ? 16'hc800 :  // <0177> nop
addr == 16'h11e ? 16'he004 :  // <0178> br z :wait_for_bp
addr == 16'h11f ? 16'h011b :  // <0178> "
addr == 16'h120 ? 16'hfc00 :  // <0179> rtn

        
                16'hxxxx;
        endmodule
    
