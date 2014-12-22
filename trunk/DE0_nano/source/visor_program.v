
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


// :begin // = 0x0000
// put target into reset.
addr == 16'h00 ? 16'h3e02 :  // <0056> bus_ctrl = $tg_reset_mask

// init visor.
addr == 16'h01 ? 16'h3360 :  // <0059> bp3_addr = $bp_disable
addr == 16'h02 ? 16'h2f60 :  // <0060> bp2_addr = $bp_disable
addr == 16'h03 ? 16'h2b60 :  // <0061> bp1_addr = $bp_disable
addr == 16'h04 ? 16'h2760 :  // <0062> bp0_addr = $bp_disable

// // UART test character
// putasc T
// getchar
// b = 1
// nop
// a = a+b
// putchar a

// :next_load // = 0x0005

// load target program from UART.
// length, little-endian.  memorize in x.
addr == 16'h05 ? 16'h024c :  // <0076> a = 76 // putasc L
addr == 16'h06 ? 16'hfba0 :  // <0076> putasc L
addr == 16'h07 ? 16'h0092 :  // <0076> "
addr == 16'h08 ? 16'hfc00 :  // <0076> "
addr == 16'h09 ? 16'hfba0 :  // <0077> get16 x
addr == 16'h0a ? 16'h00a2 :  // <0077> "
addr == 16'h0b ? 16'hfc00 :  // <0077> "
addr == 16'h0c ? 16'h2000 :  // <0077> push a // "
addr == 16'h0d ? 16'hfba0 :  // <0077> "
addr == 16'h0e ? 16'h00a2 :  // <0077> "
addr == 16'h0f ? 16'hfc00 :  // <0077> "
addr == 16'h10 ? 16'h0352 :  // <0077> "
addr == 16'h11 ? 16'h0352 :  // <0077> "
addr == 16'h12 ? 16'h0408 :  // <0077> pop b // "
addr == 16'h13 ? 16'hc800 :  // <0077> "
addr == 16'h14 ? 16'h1334 :  // <0077> "
addr == 16'h15 ? 16'h0004 :  // <0078> a = x
addr == 16'h16 ? 16'hfba0 :  // <0079> call put4x
addr == 16'h17 ? 16'h00ac :  // <0079> "
addr == 16'h18 ? 16'hfc00 :  // <0079> "
// put target into reset again, in case this is a target warm boot.
addr == 16'h19 ? 16'h3e02 :  // <0081> bus_ctrl = $tg_reset_mask
// load opcodes.  count up address in i.
addr == 16'h1a ? 16'h0a00 :  // <0083> i = 0
addr == 16'h1b ? 16'h0e01 :  // <0084> j = 1
// :loadword // = 0x001c
addr == 16'h1c ? 16'h0241 :  // <0086> a = 65 // putasc A
addr == 16'h1d ? 16'hfba0 :  // <0086> putasc A
addr == 16'h1e ? 16'h0092 :  // <0086> "
addr == 16'h1f ? 16'hfc00 :  // <0086> "
addr == 16'h20 ? 16'h0002 :  // <0087> a = i
addr == 16'h21 ? 16'hfba0 :  // <0088> call put4x
addr == 16'h22 ? 16'h00ac :  // <0088> "
addr == 16'h23 ? 16'hfc00 :  // <0088> "
addr == 16'h24 ? 16'h023d :  // <0089> a = 61 // putasc "="
addr == 16'h25 ? 16'hfba0 :  // <0089> putasc "="
addr == 16'h26 ? 16'h0092 :  // <0089> "
addr == 16'h27 ? 16'hfc00 :  // <0089> "
addr == 16'h28 ? 16'hfba0 :  // <0090> get16 g6
addr == 16'h29 ? 16'h00a2 :  // <0090> "
addr == 16'h2a ? 16'hfc00 :  // <0090> "
addr == 16'h2b ? 16'h2000 :  // <0090> push a // "
addr == 16'h2c ? 16'hfba0 :  // <0090> "
addr == 16'h2d ? 16'h00a2 :  // <0090> "
addr == 16'h2e ? 16'hfc00 :  // <0090> "
addr == 16'h2f ? 16'h0352 :  // <0090> "
addr == 16'h30 ? 16'h0352 :  // <0090> "
addr == 16'h31 ? 16'h0408 :  // <0090> pop b // "
addr == 16'h32 ? 16'hc800 :  // <0090> "
addr == 16'h33 ? 16'h1b34 :  // <0090> "
addr == 16'h34 ? 16'h0006 :  // <0091> a = g6
addr == 16'h35 ? 16'hfba0 :  // <0092> call put4x
addr == 16'h36 ? 16'h00ac :  // <0092> "
addr == 16'h37 ? 16'hfc00 :  // <0092> "
addr == 16'h38 ? 16'h023d :  // <0093> a = 61 // putasc "="
addr == 16'h39 ? 16'hfba0 :  // <0093> putasc "="
addr == 16'h3a ? 16'h0092 :  // <0093> "
addr == 16'h3b ? 16'hfc00 :  // <0093> "
addr == 16'h3c ? 16'h4c02 :  // <0094> m9k_addr = i
addr == 16'h3d ? 16'h5006 :  // <0095> m9k_data = g6
addr == 16'h3e ? 16'h0014 :  // <0096> a = m9k_data
addr == 16'h3f ? 16'hfba0 :  // <0097> call put4x
addr == 16'h40 ? 16'h00ac :  // <0097> "
addr == 16'h41 ? 16'hfc00 :  // <0097> "
addr == 16'h42 ? 16'h020d :  // <0098> a = 13 // putasc "\r"
addr == 16'h43 ? 16'hfba0 :  // <0098> putasc "\r"
addr == 16'h44 ? 16'h0092 :  // <0098> "
addr == 16'h45 ? 16'hfc00 :  // <0098> "
addr == 16'h46 ? 16'h020a :  // <0099> a = 10 // putasc "\n"
addr == 16'h47 ? 16'hfba0 :  // <0099> putasc "\n"
addr == 16'h48 ? 16'h0092 :  // <0099> "
addr == 16'h49 ? 16'hfc00 :  // <0099> "
addr == 16'h4a ? 16'h0b10 :  // <0100> i = i+j
addr == 16'h4b ? 16'h0002 :  // <0101> a = i
addr == 16'h4c ? 16'h0404 :  // <0102> b = x
addr == 16'h4d ? 16'hc800 :  // <0103> nop
addr == 16'h4e ? 16'he407 :  // <0104> bn eq :loadword
addr == 16'h4f ? 16'h001c :  // <0104> "

// release target reset, to run.
addr == 16'h50 ? 16'h0252 :  // <0107> a = 82 // putasc R
addr == 16'h51 ? 16'hfba0 :  // <0107> putasc R
addr == 16'h52 ? 16'h0092 :  // <0107> "
addr == 16'h53 ? 16'hfc00 :  // <0107> "
addr == 16'h54 ? 16'h3e00 :  // <0108> bus_ctrl = 0
addr == 16'h55 ? 16'he00f :  // <0109> jmp :next_load
addr == 16'h56 ? 16'h0005 :  // <0109> "

// :halt // = 0x0057
addr == 16'h57 ? 16'he00f :  // <0112> jmp :halt
addr == 16'h58 ? 16'h0057 :  // <0112> "

// set a breakpoint, wait til it hits.
addr == 16'h59 ? 16'h2615 :  // <0115> bp0_addr = 0x15
// :main_loop // = 0x005a
addr == 16'h5a ? 16'hfba0 :  // <0117> call :wait_for_bp
addr == 16'h5b ? 16'h008c :  // <0117> "
addr == 16'h5c ? 16'hfc00 :  // <0117> "

// observe a register.
addr == 16'h5d ? 16'h3e04 :  // <0120> bus_ctrl = $divert_code_bus_mask
addr == 16'h5e ? 16'h4201 :  // <0121> tg_force = $hold_state_mask
addr == 16'h5f ? 16'hd283 :  // <0122> fetch force_opcode from ([label observe] + 7)
addr == 16'h60 ? 16'h37b0 :  // <0122> "
addr == 16'h61 ? 16'h4203 :  // <0123> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h62 ? 16'h4205 :  // <0124> tg_force = ($hold_state_mask | $force_exec_mask)
addr == 16'h63 ? 16'h4201 :  // <0125> tg_force = $hold_state_mask
// target's r7 value is now in peek_data.

// refill target exr so it can resume seamlessly.
addr == 16'h64 ? 16'h3415 :  // <0129> force_opcode = exr_shadow
addr == 16'h65 ? 16'h4203 :  // <0130> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h66 ? 16'h4200 :  // <0131> tg_force = 0
addr == 16'h67 ? 16'h3e00 :  // <0132> bus_ctrl = 0

// interrupt the target and single step it a few times.
addr == 16'h68 ? 16'h3e08 :  // <0135> bus_ctrl = $bp_step_mask
addr == 16'h69 ? 16'hfba0 :  // <0136> call :wait_for_bp
addr == 16'h6a ? 16'h008c :  // <0136> "
addr == 16'h6b ? 16'hfc00 :  // <0136> "
addr == 16'h6c ? 16'h2409 :  // <0137> bp0_addr = bp0_addr
addr == 16'h6d ? 16'hfba0 :  // <0138> call :wait_for_bp
addr == 16'h6e ? 16'h008c :  // <0138> "
addr == 16'h6f ? 16'hfc00 :  // <0138> "
addr == 16'h70 ? 16'h2409 :  // <0139> bp0_addr = bp0_addr
addr == 16'h71 ? 16'hfba0 :  // <0140> call :wait_for_bp
addr == 16'h72 ? 16'h008c :  // <0140> "
addr == 16'h73 ? 16'hfc00 :  // <0140> "
addr == 16'h74 ? 16'h2409 :  // <0141> bp0_addr = bp0_addr
addr == 16'h75 ? 16'hfba0 :  // <0142> call :wait_for_bp
addr == 16'h76 ? 16'h008c :  // <0142> "
addr == 16'h77 ? 16'hfc00 :  // <0142> "
addr == 16'h78 ? 16'h3e00 :  // <0143> bus_ctrl = 0

// release target to pass breakpoint once.
addr == 16'h79 ? 16'h2409 :  // <0146> bp0_addr = bp0_addr

addr == 16'h7a ? 16'he00f :  // <0148> jmp :main_loop
addr == 16'h7b ? 16'h005a :  // <0148> "

// :observe // = 0x007c
// these instructions are assembled in the visor program, but passed to the target to execute.
addr == 16'h7c ? 16'h7c00 :  // <0153> debug_peek_reg = r0
addr == 16'h7d ? 16'h7c01 :  // <0154> debug_peek_reg = r1
addr == 16'h7e ? 16'h7c02 :  // <0155> debug_peek_reg = r2
addr == 16'h7f ? 16'h7c03 :  // <0156> debug_peek_reg = r3
addr == 16'h80 ? 16'h7c04 :  // <0157> debug_peek_reg = r4
addr == 16'h81 ? 16'h7c05 :  // <0158> debug_peek_reg = r5
addr == 16'h82 ? 16'h7c06 :  // <0159> debug_peek_reg = r6
addr == 16'h83 ? 16'h7c07 :  // <0160> debug_peek_reg = r7
addr == 16'h84 ? 16'h7c08 :  // <0161> debug_peek_reg = r8
addr == 16'h85 ? 16'h7c09 :  // <0162> debug_peek_reg = r9
addr == 16'h86 ? 16'h7c0a :  // <0163> debug_peek_reg = r10
addr == 16'h87 ? 16'h7c0b :  // <0164> debug_peek_reg = r11
addr == 16'h88 ? 16'h7c0c :  // <0165> debug_peek_reg = r12
addr == 16'h89 ? 16'h7c0d :  // <0166> debug_peek_reg = r13
addr == 16'h8a ? 16'h7c0e :  // <0167> debug_peek_reg = r14
addr == 16'h8b ? 16'h7c0f :  // <0168> debug_peek_reg = r15

// func wait_for_bp // = 0x008c
addr == 16'h8c ? 16'h0200 :  // <0171> a = 0
addr == 16'h8d ? 16'h0418 :  // <0172> b = bp_status
addr == 16'h8e ? 16'hc800 :  // <0173> nop
addr == 16'h8f ? 16'he004 :  // <0174> br z :wait_for_bp
addr == 16'h90 ? 16'h008c :  // <0174> "
addr == 16'h91 ? 16'hfc00 :  // <0175> return


// routine sends out the low byte from a to the UART.  blocks until the UART accepts the byte.
// func putchar_atx // = 0x0092
addr == 16'h92 ? 16'h2004 :  // <0179> push x // func putchar_atx

addr == 16'h93 ? 16'h1000 :  // <0181> x = a

// wait for UART to be idle (not busy).
addr == 16'h94 ? 16'h0202 :  // <0184> a = $atx_busy_mask
// :pcatx_wait_for_idle // = 0x0095
addr == 16'h95 ? 16'h0412 :  // <0186> b = atx_ctrl
addr == 16'h96 ? 16'hc800 :  // <0187> nop
addr == 16'h97 ? 16'he402 :  // <0188> bn and0z :pcatx_wait_for_idle
addr == 16'h98 ? 16'h0095 :  // <0188> "

// push word to the UART.  its low byte is a character.
addr == 16'h99 ? 16'h4404 :  // <0191> atx_data = x

// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_ctrl.
addr == 16'h9a ? 16'h4a01 :  // <0196> atx_ctrl = $atx_load_mask

// wait until UART is busy, as acknowledgement.
addr == 16'h9b ? 16'h0202 :  // <0199> a = $atx_busy_mask
// :pcatx_wait_for_busy // = 0x009c
addr == 16'h9c ? 16'h0412 :  // <0201> b = atx_ctrl
addr == 16'h9d ? 16'he002 :  // <0202> br and0z :pcatx_wait_for_busy
addr == 16'h9e ? 16'h009c :  // <0202> "

addr == 16'h9f ? 16'h4a00 :  // <0204> atx_ctrl = 0
addr == 16'ha0 ? 16'h1008 :  // <0205> pop x // return
addr == 16'ha1 ? 16'hfc00 :  // <0205> return

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// func getchar_atx // = 0x00a2
// wait until UART is busy, then idle.
addr == 16'ha2 ? 16'h0204 :  // <0211> a = $arx_busy_mask
// :wait_for_busy // = 0x00a3
addr == 16'ha3 ? 16'h0412 :  // <0213> b = atx_ctrl
addr == 16'ha4 ? 16'he002 :  // <0214> br and0z :wait_for_busy
addr == 16'ha5 ? 16'h00a3 :  // <0214> "
// :wait_for_idle // = 0x00a6
addr == 16'ha6 ? 16'h0412 :  // <0216> b = atx_ctrl
addr == 16'ha7 ? 16'hc800 :  // <0217> nop
addr == 16'ha8 ? 16'he402 :  // <0218> bn and0z :wait_for_idle
addr == 16'ha9 ? 16'h00a6 :  // <0218> "
addr == 16'haa ? 16'h0011 :  // <0219> a = atx_data
addr == 16'hab ? 16'hfc00 :  // <0220> return

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x00ac
addr == 16'hac ? 16'h2004 :  // <0224> push x // func put4x
addr == 16'had ? 16'h2006 :  // <0224> push g6 // "
addr == 16'hae ? 16'h203e :  // <0224> push rtna // "
addr == 16'haf ? 16'h13a0 :  // <0225> x = :hexdigits
addr == 16'hb0 ? 16'h00e9 :  // <0225> "

addr == 16'hb1 ? 16'h1800 :  // <0227> g6 = a
addr == 16'hb2 ? 16'h07a0 :  // <0228> b = 0xF000
addr == 16'hb3 ? 16'hf000 :  // <0228> "
addr == 16'hb4 ? 16'hc800 :  // <0229> nop
addr == 16'hb5 ? 16'h0330 :  // <0230> a = and
addr == 16'hb6 ? 16'h0353 :  // <0231> a = a>>4
addr == 16'hb7 ? 16'h0353 :  // <0232> a = a>>4
addr == 16'hb8 ? 16'h0353 :  // <0233> a = a>>4
addr == 16'hb9 ? 16'hfba0 :  // <0234> call fetch_byte
addr == 16'hba ? 16'h00f1 :  // <0234> "
addr == 16'hbb ? 16'hfc00 :  // <0234> "
addr == 16'hbc ? 16'h0000 :  // <0235> a = a // putchar a
addr == 16'hbd ? 16'hfba0 :  // <0235> putchar a
addr == 16'hbe ? 16'h0092 :  // <0235> "
addr == 16'hbf ? 16'hfc00 :  // <0235> "

addr == 16'hc0 ? 16'h0006 :  // <0237> a = g6
addr == 16'hc1 ? 16'h07a0 :  // <0238> b = 0x0F00
addr == 16'hc2 ? 16'h0f00 :  // <0238> "
addr == 16'hc3 ? 16'hc800 :  // <0239> nop
addr == 16'hc4 ? 16'h0330 :  // <0240> a = and
addr == 16'hc5 ? 16'h0353 :  // <0241> a = a>>4
addr == 16'hc6 ? 16'h0353 :  // <0242> a = a>>4
addr == 16'hc7 ? 16'hfba0 :  // <0243> call fetch_byte
addr == 16'hc8 ? 16'h00f1 :  // <0243> "
addr == 16'hc9 ? 16'hfc00 :  // <0243> "
addr == 16'hca ? 16'h0000 :  // <0244> a = a // putchar a
addr == 16'hcb ? 16'hfba0 :  // <0244> putchar a
addr == 16'hcc ? 16'h0092 :  // <0244> "
addr == 16'hcd ? 16'hfc00 :  // <0244> "

addr == 16'hce ? 16'h0006 :  // <0246> a = g6
addr == 16'hcf ? 16'h06f0 :  // <0247> b = 0x00F0
addr == 16'hd0 ? 16'hc800 :  // <0248> nop
addr == 16'hd1 ? 16'h0330 :  // <0249> a = and
addr == 16'hd2 ? 16'h0353 :  // <0250> a = a>>4
addr == 16'hd3 ? 16'hfba0 :  // <0251> call fetch_byte
addr == 16'hd4 ? 16'h00f1 :  // <0251> "
addr == 16'hd5 ? 16'hfc00 :  // <0251> "
addr == 16'hd6 ? 16'h0000 :  // <0252> a = a // putchar a
addr == 16'hd7 ? 16'hfba0 :  // <0252> putchar a
addr == 16'hd8 ? 16'h0092 :  // <0252> "
addr == 16'hd9 ? 16'hfc00 :  // <0252> "

addr == 16'hda ? 16'h0006 :  // <0254> a = g6
addr == 16'hdb ? 16'h060f :  // <0255> b = 0x000F
addr == 16'hdc ? 16'hc800 :  // <0256> nop
addr == 16'hdd ? 16'h0330 :  // <0257> a = and
addr == 16'hde ? 16'hfba0 :  // <0258> call fetch_byte
addr == 16'hdf ? 16'h00f1 :  // <0258> "
addr == 16'he0 ? 16'hfc00 :  // <0258> "
addr == 16'he1 ? 16'h0000 :  // <0259> a = a // putchar a
addr == 16'he2 ? 16'hfba0 :  // <0259> putchar a
addr == 16'he3 ? 16'h0092 :  // <0259> "
addr == 16'he4 ? 16'hfc00 :  // <0259> "

addr == 16'he5 ? 16'hf808 :  // <0261> pop rtna // return
addr == 16'he6 ? 16'h1808 :  // <0261> pop g6 // "
addr == 16'he7 ? 16'h1008 :  // <0261> pop x // "
addr == 16'he8 ? 16'hfc00 :  // <0261> return

// :hexdigits // = 0x00e9
// "0123456789abcdef"
addr == 16'he9 ? 16'h3130 :  // <0264> 10
addr == 16'hea ? 16'h3332 :  // <0264> 32
addr == 16'heb ? 16'h3534 :  // <0264> 54
addr == 16'hec ? 16'h3736 :  // <0264> 76
addr == 16'hed ? 16'h3938 :  // <0264> 98
addr == 16'hee ? 16'h6261 :  // <0264> ba
addr == 16'hef ? 16'h6463 :  // <0264> dc
addr == 16'hf0 ? 16'h6665 :  // <0264> fe

// pick a byte from an array of words.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// func fetch_byte // = 0x00f1
addr == 16'hf1 ? 16'h0601 :  // <0269> b = 1
addr == 16'hf2 ? 16'hc800 :  // <0270> nop
addr == 16'hf3 ? 16'he002 :  // <0271> br and0z :pick_byte_even
addr == 16'hf4 ? 16'h00fd :  // <0271> "
addr == 16'hf5 ? 16'h0350 :  // <0272> a = a>>1
addr == 16'hf6 ? 16'h0404 :  // <0273> b = x
addr == 16'hf7 ? 16'hc800 :  // <0274> nop
addr == 16'hf8 ? 16'hd300 :  // <0275> fetch a from a+b
addr == 16'hf9 ? 16'h03b0 :  // <0275> "
addr == 16'hfa ? 16'h0353 :  // <0276> a = a>>4
addr == 16'hfb ? 16'h0353 :  // <0277> a = a>>4
addr == 16'hfc ? 16'hfc00 :  // <0278> return
// :pick_byte_even // = 0x00fd
addr == 16'hfd ? 16'h0350 :  // <0280> a = a>>1
addr == 16'hfe ? 16'h0404 :  // <0281> b = x
addr == 16'hff ? 16'hc800 :  // <0282> nop
addr == 16'h100 ? 16'hd300 :  // <0283> fetch a from a+b
addr == 16'h101 ? 16'h03b0 :  // <0283> "
addr == 16'h102 ? 16'hfc00 :  // <0284> return

        
                16'hxxxx;
        endmodule
    
