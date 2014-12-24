
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
//    bus_ctrl = $tg_reset_mask

// init visor.
addr == 16'h00 ? 16'h3360 :  // <0060> bp3_addr = $bp_disable
addr == 16'h01 ? 16'h2f60 :  // <0061> bp2_addr = $bp_disable
addr == 16'h02 ? 16'h2b60 :  // <0062> bp1_addr = $bp_disable
addr == 16'h03 ? 16'h2760 :  // <0063> bp0_addr = $bp_disable

// // UART test character
// putasc T
// getchar
// b = 1
// nop
// a = a+b
// putchar a

// :next_load // = 0x0004

// load target program from UART.
// length, little-endian.  memorize in x.
addr == 16'h04 ? 16'h024c :  // <0077> a = 76 // putasc L
addr == 16'h05 ? 16'h0000 :  // <0077> a = a // putasc L
addr == 16'h06 ? 16'hfba0 :  // <0077> putasc L
addr == 16'h07 ? 16'h0098 :  // <0077> "
addr == 16'h08 ? 16'hfc00 :  // <0077> "
addr == 16'h09 ? 16'hfba0 :  // <0078> get16 x
addr == 16'h0a ? 16'h00a8 :  // <0078> "
addr == 16'h0b ? 16'hfc00 :  // <0078> "
addr == 16'h0c ? 16'h2000 :  // <0078> push a // "
addr == 16'h0d ? 16'hfba0 :  // <0078> "
addr == 16'h0e ? 16'h00a8 :  // <0078> "
addr == 16'h0f ? 16'hfc00 :  // <0078> "
addr == 16'h10 ? 16'h0352 :  // <0078> "
addr == 16'h11 ? 16'h0352 :  // <0078> "
addr == 16'h12 ? 16'h0408 :  // <0078> pop b // "
addr == 16'h13 ? 16'hc800 :  // <0078> "
addr == 16'h14 ? 16'h1334 :  // <0078> "
addr == 16'h15 ? 16'h0004 :  // <0079> a = x
addr == 16'h16 ? 16'hfba0 :  // <0080> call put4x
addr == 16'h17 ? 16'h00b2 :  // <0080> "
addr == 16'h18 ? 16'hfc00 :  // <0080> "
// put target into reset again, in case this is a target warm boot.
addr == 16'h19 ? 16'h3e02 :  // <0082> bus_ctrl = $tg_reset_mask
// load opcodes.  count up address in i.
addr == 16'h1a ? 16'h0a00 :  // <0084> i = 0
addr == 16'h1b ? 16'h0e01 :  // <0085> j = 1
// :loadword // = 0x001c
addr == 16'h1c ? 16'h0241 :  // <0087> a = 65 // putasc A
addr == 16'h1d ? 16'h0000 :  // <0087> a = a // putasc A
addr == 16'h1e ? 16'hfba0 :  // <0087> putasc A
addr == 16'h1f ? 16'h0098 :  // <0087> "
addr == 16'h20 ? 16'hfc00 :  // <0087> "
addr == 16'h21 ? 16'h0002 :  // <0088> a = i
addr == 16'h22 ? 16'hfba0 :  // <0089> call put4x
addr == 16'h23 ? 16'h00b2 :  // <0089> "
addr == 16'h24 ? 16'hfc00 :  // <0089> "
addr == 16'h25 ? 16'h023d :  // <0090> a = 61 // putasc "="
addr == 16'h26 ? 16'h0000 :  // <0090> a = a // putasc "="
addr == 16'h27 ? 16'hfba0 :  // <0090> putasc "="
addr == 16'h28 ? 16'h0098 :  // <0090> "
addr == 16'h29 ? 16'hfc00 :  // <0090> "
addr == 16'h2a ? 16'hfba0 :  // <0091> get16 g6
addr == 16'h2b ? 16'h00a8 :  // <0091> "
addr == 16'h2c ? 16'hfc00 :  // <0091> "
addr == 16'h2d ? 16'h2000 :  // <0091> push a // "
addr == 16'h2e ? 16'hfba0 :  // <0091> "
addr == 16'h2f ? 16'h00a8 :  // <0091> "
addr == 16'h30 ? 16'hfc00 :  // <0091> "
addr == 16'h31 ? 16'h0352 :  // <0091> "
addr == 16'h32 ? 16'h0352 :  // <0091> "
addr == 16'h33 ? 16'h0408 :  // <0091> pop b // "
addr == 16'h34 ? 16'hc800 :  // <0091> "
addr == 16'h35 ? 16'h1b34 :  // <0091> "
addr == 16'h36 ? 16'h0006 :  // <0092> a = g6
addr == 16'h37 ? 16'hfba0 :  // <0093> call put4x
addr == 16'h38 ? 16'h00b2 :  // <0093> "
addr == 16'h39 ? 16'hfc00 :  // <0093> "
addr == 16'h3a ? 16'h023d :  // <0094> a = 61 // putasc "="
addr == 16'h3b ? 16'h0000 :  // <0094> a = a // putasc "="
addr == 16'h3c ? 16'hfba0 :  // <0094> putasc "="
addr == 16'h3d ? 16'h0098 :  // <0094> "
addr == 16'h3e ? 16'hfc00 :  // <0094> "
addr == 16'h3f ? 16'h4c02 :  // <0095> m9k_addr = i
addr == 16'h40 ? 16'h5006 :  // <0096> m9k_data = g6
addr == 16'h41 ? 16'h0014 :  // <0097> a = m9k_data
addr == 16'h42 ? 16'hfba0 :  // <0098> call put4x
addr == 16'h43 ? 16'h00b2 :  // <0098> "
addr == 16'h44 ? 16'hfc00 :  // <0098> "
addr == 16'h45 ? 16'h020d :  // <0099> a = 13 // putasc "\r"
addr == 16'h46 ? 16'h0000 :  // <0099> a = a // putasc "\r"
addr == 16'h47 ? 16'hfba0 :  // <0099> putasc "\r"
addr == 16'h48 ? 16'h0098 :  // <0099> "
addr == 16'h49 ? 16'hfc00 :  // <0099> "
addr == 16'h4a ? 16'h020a :  // <0100> a = 10 // putasc "\n"
addr == 16'h4b ? 16'h0000 :  // <0100> a = a // putasc "\n"
addr == 16'h4c ? 16'hfba0 :  // <0100> putasc "\n"
addr == 16'h4d ? 16'h0098 :  // <0100> "
addr == 16'h4e ? 16'hfc00 :  // <0100> "
addr == 16'h4f ? 16'h0b10 :  // <0101> i = i+j
addr == 16'h50 ? 16'h0002 :  // <0102> a = i
addr == 16'h51 ? 16'h0404 :  // <0103> b = x
addr == 16'h52 ? 16'hc800 :  // <0104> nop
addr == 16'h53 ? 16'he407 :  // <0105> bn eq :loadword
addr == 16'h54 ? 16'h001c :  // <0105> "

// release target reset, to run.
addr == 16'h55 ? 16'h0252 :  // <0108> a = 82 // putasc R
addr == 16'h56 ? 16'h0000 :  // <0108> a = a // putasc R
addr == 16'h57 ? 16'hfba0 :  // <0108> putasc R
addr == 16'h58 ? 16'h0098 :  // <0108> "
addr == 16'h59 ? 16'hfc00 :  // <0108> "
addr == 16'h5a ? 16'h3e00 :  // <0109> bus_ctrl = 0
addr == 16'h5b ? 16'he00f :  // <0110> jmp :next_load
addr == 16'h5c ? 16'h0004 :  // <0110> "

// :halt // = 0x005d
addr == 16'h5d ? 16'he00f :  // <0113> jmp :halt
addr == 16'h5e ? 16'h005d :  // <0113> "

// set a breakpoint, wait til it hits.
addr == 16'h5f ? 16'h2615 :  // <0116> bp0_addr = 0x15
// :main_loop // = 0x0060
addr == 16'h60 ? 16'hfba0 :  // <0118> call :wait_for_bp
addr == 16'h61 ? 16'h0092 :  // <0118> "
addr == 16'h62 ? 16'hfc00 :  // <0118> "

// observe a register.
addr == 16'h63 ? 16'h3e04 :  // <0121> bus_ctrl = $divert_code_bus_mask
addr == 16'h64 ? 16'h4201 :  // <0122> tg_force = $hold_state_mask
addr == 16'h65 ? 16'hd289 :  // <0123> fetch force_opcode from ([label observe] + 7)
addr == 16'h66 ? 16'h37b0 :  // <0123> "
addr == 16'h67 ? 16'h4203 :  // <0124> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h68 ? 16'h4205 :  // <0125> tg_force = ($hold_state_mask | $force_exec_mask)
addr == 16'h69 ? 16'h4201 :  // <0126> tg_force = $hold_state_mask
// target's r7 value is now in peek_data.

// refill target exr so it can resume seamlessly.
addr == 16'h6a ? 16'h3415 :  // <0130> force_opcode = exr_shadow
addr == 16'h6b ? 16'h4203 :  // <0131> tg_force = ($hold_state_mask | $force_load_exr_mask)
addr == 16'h6c ? 16'h4200 :  // <0132> tg_force = 0
addr == 16'h6d ? 16'h3e00 :  // <0133> bus_ctrl = 0

// interrupt the target and single step it a few times.
addr == 16'h6e ? 16'h3e08 :  // <0136> bus_ctrl = $bp_step_mask
addr == 16'h6f ? 16'hfba0 :  // <0137> call :wait_for_bp
addr == 16'h70 ? 16'h0092 :  // <0137> "
addr == 16'h71 ? 16'hfc00 :  // <0137> "
addr == 16'h72 ? 16'h2409 :  // <0138> bp0_addr = bp0_addr
addr == 16'h73 ? 16'hfba0 :  // <0139> call :wait_for_bp
addr == 16'h74 ? 16'h0092 :  // <0139> "
addr == 16'h75 ? 16'hfc00 :  // <0139> "
addr == 16'h76 ? 16'h2409 :  // <0140> bp0_addr = bp0_addr
addr == 16'h77 ? 16'hfba0 :  // <0141> call :wait_for_bp
addr == 16'h78 ? 16'h0092 :  // <0141> "
addr == 16'h79 ? 16'hfc00 :  // <0141> "
addr == 16'h7a ? 16'h2409 :  // <0142> bp0_addr = bp0_addr
addr == 16'h7b ? 16'hfba0 :  // <0143> call :wait_for_bp
addr == 16'h7c ? 16'h0092 :  // <0143> "
addr == 16'h7d ? 16'hfc00 :  // <0143> "
addr == 16'h7e ? 16'h3e00 :  // <0144> bus_ctrl = 0

// release target to pass breakpoint once.
addr == 16'h7f ? 16'h2409 :  // <0147> bp0_addr = bp0_addr

addr == 16'h80 ? 16'he00f :  // <0149> jmp :main_loop
addr == 16'h81 ? 16'h0060 :  // <0149> "

// :observe // = 0x0082
// these instructions are assembled in the visor program, but passed to the target to execute.
addr == 16'h82 ? 16'h7c00 :  // <0154> debug_peek_reg = r0
addr == 16'h83 ? 16'h7c01 :  // <0155> debug_peek_reg = r1
addr == 16'h84 ? 16'h7c02 :  // <0156> debug_peek_reg = r2
addr == 16'h85 ? 16'h7c03 :  // <0157> debug_peek_reg = r3
addr == 16'h86 ? 16'h7c04 :  // <0158> debug_peek_reg = r4
addr == 16'h87 ? 16'h7c05 :  // <0159> debug_peek_reg = r5
addr == 16'h88 ? 16'h7c06 :  // <0160> debug_peek_reg = r6
addr == 16'h89 ? 16'h7c07 :  // <0161> debug_peek_reg = r7
addr == 16'h8a ? 16'h7c08 :  // <0162> debug_peek_reg = r8
addr == 16'h8b ? 16'h7c09 :  // <0163> debug_peek_reg = r9
addr == 16'h8c ? 16'h7c0a :  // <0164> debug_peek_reg = r10
addr == 16'h8d ? 16'h7c0b :  // <0165> debug_peek_reg = r11
addr == 16'h8e ? 16'h7c0c :  // <0166> debug_peek_reg = r12
addr == 16'h8f ? 16'h7c0d :  // <0167> debug_peek_reg = r13
addr == 16'h90 ? 16'h7c0e :  // <0168> debug_peek_reg = r14
addr == 16'h91 ? 16'h7c0f :  // <0169> debug_peek_reg = r15

// func wait_for_bp // = 0x0092
addr == 16'h92 ? 16'h0200 :  // <0172> a = 0
addr == 16'h93 ? 16'h0418 :  // <0173> b = bp_status
addr == 16'h94 ? 16'hc800 :  // <0174> nop
addr == 16'h95 ? 16'he004 :  // <0175> br z :wait_for_bp
addr == 16'h96 ? 16'h0092 :  // <0175> "
addr == 16'h97 ? 16'hfc00 :  // <0176> return


// routine sends out the low byte from a to the UART.  blocks until the UART accepts the byte.
// func putchar_atx // = 0x0098
addr == 16'h98 ? 16'h2004 :  // <0180> push x // func putchar_atx

addr == 16'h99 ? 16'h1000 :  // <0182> x = a

// wait for UART to be idle (not busy).
addr == 16'h9a ? 16'h0202 :  // <0185> a = $atx_busy_mask
// :pcatx_wait_for_idle // = 0x009b
addr == 16'h9b ? 16'h0412 :  // <0187> b = atx_ctrl
addr == 16'h9c ? 16'hc800 :  // <0188> nop
addr == 16'h9d ? 16'he402 :  // <0189> bn and0z :pcatx_wait_for_idle
addr == 16'h9e ? 16'h009b :  // <0189> "

// push word to the UART.  its low byte is a character.
addr == 16'h9f ? 16'h4404 :  // <0192> atx_data = x

// can't use the actual register load strobe that occurs here, because it's
// much too fast for the UART to sample.
// instead use a dedicated output word atx_ctrl.
addr == 16'ha0 ? 16'h4a01 :  // <0197> atx_ctrl = $atx_load_mask

// wait until UART is busy, as acknowledgement.
addr == 16'ha1 ? 16'h0202 :  // <0200> a = $atx_busy_mask
// :pcatx_wait_for_busy // = 0x00a2
addr == 16'ha2 ? 16'h0412 :  // <0202> b = atx_ctrl
addr == 16'ha3 ? 16'he002 :  // <0203> br and0z :pcatx_wait_for_busy
addr == 16'ha4 ? 16'h00a2 :  // <0203> "

addr == 16'ha5 ? 16'h4a00 :  // <0205> atx_ctrl = 0
addr == 16'ha6 ? 16'h1008 :  // <0206> pop x // return
addr == 16'ha7 ? 16'hfc00 :  // <0206> return

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// func getchar_atx // = 0x00a8
// wait until UART is busy, then idle.
addr == 16'ha8 ? 16'h0204 :  // <0212> a = $arx_busy_mask
// :wait_for_busy // = 0x00a9
addr == 16'ha9 ? 16'h0412 :  // <0214> b = atx_ctrl
addr == 16'haa ? 16'he002 :  // <0215> br and0z :wait_for_busy
addr == 16'hab ? 16'h00a9 :  // <0215> "
// :wait_for_idle // = 0x00ac
addr == 16'hac ? 16'h0412 :  // <0217> b = atx_ctrl
addr == 16'had ? 16'hc800 :  // <0218> nop
addr == 16'hae ? 16'he402 :  // <0219> bn and0z :wait_for_idle
addr == 16'haf ? 16'h00ac :  // <0219> "
addr == 16'hb0 ? 16'h0011 :  // <0220> a = atx_data
addr == 16'hb1 ? 16'hfc00 :  // <0221> return

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x00b2
addr == 16'hb2 ? 16'h2004 :  // <0225> push x // func put4x
addr == 16'hb3 ? 16'h2006 :  // <0225> push g6 // "
addr == 16'hb4 ? 16'h203e :  // <0225> push rtna // "
addr == 16'hb5 ? 16'h13a0 :  // <0226> x = :hexdigits
addr == 16'hb6 ? 16'h00ef :  // <0226> "

addr == 16'hb7 ? 16'h1800 :  // <0228> g6 = a
addr == 16'hb8 ? 16'h07a0 :  // <0229> b = 0xF000
addr == 16'hb9 ? 16'hf000 :  // <0229> "
addr == 16'hba ? 16'hc800 :  // <0230> nop
addr == 16'hbb ? 16'h0330 :  // <0231> a = and
addr == 16'hbc ? 16'h0353 :  // <0232> a = a>>4
addr == 16'hbd ? 16'h0353 :  // <0233> a = a>>4
addr == 16'hbe ? 16'h0353 :  // <0234> a = a>>4
addr == 16'hbf ? 16'hfba0 :  // <0235> call fetch_byte
addr == 16'hc0 ? 16'h00f7 :  // <0235> "
addr == 16'hc1 ? 16'hfc00 :  // <0235> "
addr == 16'hc2 ? 16'h0000 :  // <0236> a = a // putchar a
addr == 16'hc3 ? 16'hfba0 :  // <0236> putchar a
addr == 16'hc4 ? 16'h0098 :  // <0236> "
addr == 16'hc5 ? 16'hfc00 :  // <0236> "

addr == 16'hc6 ? 16'h0006 :  // <0238> a = g6
addr == 16'hc7 ? 16'h07a0 :  // <0239> b = 0x0F00
addr == 16'hc8 ? 16'h0f00 :  // <0239> "
addr == 16'hc9 ? 16'hc800 :  // <0240> nop
addr == 16'hca ? 16'h0330 :  // <0241> a = and
addr == 16'hcb ? 16'h0353 :  // <0242> a = a>>4
addr == 16'hcc ? 16'h0353 :  // <0243> a = a>>4
addr == 16'hcd ? 16'hfba0 :  // <0244> call fetch_byte
addr == 16'hce ? 16'h00f7 :  // <0244> "
addr == 16'hcf ? 16'hfc00 :  // <0244> "
addr == 16'hd0 ? 16'h0000 :  // <0245> a = a // putchar a
addr == 16'hd1 ? 16'hfba0 :  // <0245> putchar a
addr == 16'hd2 ? 16'h0098 :  // <0245> "
addr == 16'hd3 ? 16'hfc00 :  // <0245> "

addr == 16'hd4 ? 16'h0006 :  // <0247> a = g6
addr == 16'hd5 ? 16'h06f0 :  // <0248> b = 0x00F0
addr == 16'hd6 ? 16'hc800 :  // <0249> nop
addr == 16'hd7 ? 16'h0330 :  // <0250> a = and
addr == 16'hd8 ? 16'h0353 :  // <0251> a = a>>4
addr == 16'hd9 ? 16'hfba0 :  // <0252> call fetch_byte
addr == 16'hda ? 16'h00f7 :  // <0252> "
addr == 16'hdb ? 16'hfc00 :  // <0252> "
addr == 16'hdc ? 16'h0000 :  // <0253> a = a // putchar a
addr == 16'hdd ? 16'hfba0 :  // <0253> putchar a
addr == 16'hde ? 16'h0098 :  // <0253> "
addr == 16'hdf ? 16'hfc00 :  // <0253> "

addr == 16'he0 ? 16'h0006 :  // <0255> a = g6
addr == 16'he1 ? 16'h060f :  // <0256> b = 0x000F
addr == 16'he2 ? 16'hc800 :  // <0257> nop
addr == 16'he3 ? 16'h0330 :  // <0258> a = and
addr == 16'he4 ? 16'hfba0 :  // <0259> call fetch_byte
addr == 16'he5 ? 16'h00f7 :  // <0259> "
addr == 16'he6 ? 16'hfc00 :  // <0259> "
addr == 16'he7 ? 16'h0000 :  // <0260> a = a // putchar a
addr == 16'he8 ? 16'hfba0 :  // <0260> putchar a
addr == 16'he9 ? 16'h0098 :  // <0260> "
addr == 16'hea ? 16'hfc00 :  // <0260> "

addr == 16'heb ? 16'hf808 :  // <0262> pop rtna // return
addr == 16'hec ? 16'h1808 :  // <0262> pop g6 // "
addr == 16'hed ? 16'h1008 :  // <0262> pop x // "
addr == 16'hee ? 16'hfc00 :  // <0262> return

// :hexdigits // = 0x00ef
// "0123456789abcdef"
addr == 16'hef ? 16'h3130 :  // <0265> 10
addr == 16'hf0 ? 16'h3332 :  // <0265> 32
addr == 16'hf1 ? 16'h3534 :  // <0265> 54
addr == 16'hf2 ? 16'h3736 :  // <0265> 76
addr == 16'hf3 ? 16'h3938 :  // <0265> 98
addr == 16'hf4 ? 16'h6261 :  // <0265> ba
addr == 16'hf5 ? 16'h6463 :  // <0265> dc
addr == 16'hf6 ? 16'h6665 :  // <0265> fe

// pick a byte from an array of words.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// func fetch_byte // = 0x00f7
addr == 16'hf7 ? 16'h0601 :  // <0270> b = 1
addr == 16'hf8 ? 16'hc800 :  // <0271> nop
addr == 16'hf9 ? 16'he002 :  // <0272> br and0z :pick_byte_even
addr == 16'hfa ? 16'h0103 :  // <0272> "
addr == 16'hfb ? 16'h0350 :  // <0273> a = a>>1
addr == 16'hfc ? 16'h0404 :  // <0274> b = x
addr == 16'hfd ? 16'hc800 :  // <0275> nop
addr == 16'hfe ? 16'hd300 :  // <0276> fetch a from a+b
addr == 16'hff ? 16'h03b0 :  // <0276> "
addr == 16'h100 ? 16'h0353 :  // <0277> a = a>>4
addr == 16'h101 ? 16'h0353 :  // <0278> a = a>>4
addr == 16'h102 ? 16'hfc00 :  // <0279> return
// :pick_byte_even // = 0x0103
addr == 16'h103 ? 16'h0350 :  // <0281> a = a>>1
addr == 16'h104 ? 16'h0404 :  // <0282> b = x
addr == 16'h105 ? 16'hc800 :  // <0283> nop
addr == 16'h106 ? 16'hd300 :  // <0284> fetch a from a+b
addr == 16'h107 ? 16'h03b0 :  // <0284> "
addr == 16'h108 ? 16'h06ff :  // <0285> b = 0xff
addr == 16'h109 ? 16'hc800 :  // <0286> nop
addr == 16'h10a ? 16'h0330 :  // <0287> a = and
addr == 16'h10b ? 16'hfc00 :  // <0288> return

        
                16'hxxxx;
        endmodule
    
