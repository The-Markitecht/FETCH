
        `include "header.v"

        module target_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.

// register file configuration

// application-specific register aliases.

// throttle for each pass of data acquisition.
// delay for anmux settling.


// all Avalon addresses are BYTE addresses.  all Avalon sizes are in BYTES.
// SDRAM notes:
// - all addresses are BYTE addresses.  all must be divisible by 2, because this
// system only supports 16-bit word accesses.  writes to an odd-numbered address
// will be forced to the word boundary instead, overwriting data there.
// - any read involves about 7 wait states, occasionally up to 12.  (those are
// code_ready stalled cycles induced by Altera SDRAM controller through my Avalon-MM master.
// plus time to e.g. set Avalon addres regs.  measured by scope with 50 MHz synapse sysclk on DE0 Nano).
// - evidently no time difference between same-row and other-row reads (SDRAM row=512 words).
// - evidently no time difference between first read and sequential burst-read.
// - any write seems to take about 1 wait state, but is likely to be completing in the
// background while the MCU moves on.  accessing again within 5 cycles or so may
// cause wait states there until SDRAM controller is ready for it.
// - apparently Altera's claims of SDRAM controller approaching 1 word per clock cycle must be
// using e.g. Avalon burst transfers or Avalon-ST.  don't think my Avalon-MM master can go that fast.


// // I/O expansion bus.
// alias_both exp                  [incr counter]
// alias_both exp_addr             [incr counter]
// vdefine exp_num_regs 32
// vdefine exp_top_reg ($exp_num_regs - 1)
// setvar exp_counter -1

// alias_src  keys                 [incr exp_counter]@exp
// alias_both leds                 [incr exp_counter]@exp

// alias_both anmux_ctrl           [incr exp_counter]@exp
// vdefine     anmux_enable_mask       0x0008
// vdefine     anmux_channel_mask      0x0007




// power relay duty cycles, in microseconds.  duty cycle time = relay OFF time.
// relay actually remains energized for about another 5 us after pwm goes high,
// due to the optocoupler pullup taking some time to climb through the MOSFET's threshold.

// SETTING efi_len_us NON-ZERO ENABLES FUEL INJECTION!!  zero disables it.
// MUST SET ign_timeout_len_20us NON-ZERO PRIOR TO ENABLING!
// otherwise the module latches up in a non-working state.



addr == 16'h00 ? 16'he00f :  // <0132> jmp :main
addr == 16'h01 ? 16'h0158 :  // <0132> "

addr == 16'h02 ? 16'h001c :  // <0134> emit_debugger_register_table  counter
// "       a"
addr == 16'h03 ? 16'h2020 :  // <0134>   
addr == 16'h04 ? 16'h2020 :  // <0134>   
addr == 16'h05 ? 16'h2020 :  // <0134>   
addr == 16'h06 ? 16'h6120 :  // <0134> a 
// "       b"
addr == 16'h07 ? 16'h2020 :  // <0134>   
addr == 16'h08 ? 16'h2020 :  // <0134>   
addr == 16'h09 ? 16'h2020 :  // <0134>   
addr == 16'h0a ? 16'h6220 :  // <0134> b 
// "       i"
addr == 16'h0b ? 16'h2020 :  // <0134>   
addr == 16'h0c ? 16'h2020 :  // <0134>   
addr == 16'h0d ? 16'h2020 :  // <0134>   
addr == 16'h0e ? 16'h6920 :  // <0134> i 
// "       j"
addr == 16'h0f ? 16'h2020 :  // <0134>   
addr == 16'h10 ? 16'h2020 :  // <0134>   
addr == 16'h11 ? 16'h2020 :  // <0134>   
addr == 16'h12 ? 16'h6a20 :  // <0134> j 
// "       x"
addr == 16'h13 ? 16'h2020 :  // <0134>   
addr == 16'h14 ? 16'h2020 :  // <0134>   
addr == 16'h15 ? 16'h2020 :  // <0134>   
addr == 16'h16 ? 16'h7820 :  // <0134> x 
// "       y"
addr == 16'h17 ? 16'h2020 :  // <0134>   
addr == 16'h18 ? 16'h2020 :  // <0134>   
addr == 16'h19 ? 16'h2020 :  // <0134>   
addr == 16'h1a ? 16'h7920 :  // <0134> y 
// "      g6"
addr == 16'h1b ? 16'h2020 :  // <0134>   
addr == 16'h1c ? 16'h2020 :  // <0134>   
addr == 16'h1d ? 16'h2020 :  // <0134>   
addr == 16'h1e ? 16'h3667 :  // <0134> 6g
// "      g7"
addr == 16'h1f ? 16'h2020 :  // <0134>   
addr == 16'h20 ? 16'h2020 :  // <0134>   
addr == 16'h21 ? 16'h2020 :  // <0134>   
addr == 16'h22 ? 16'h3767 :  // <0134> 7g
// "//rstk  "
addr == 16'h23 ? 16'h2f2f :  // <0134> //
addr == 16'h24 ? 16'h7372 :  // <0134> sr
addr == 16'h25 ? 16'h6b74 :  // <0134> kt
addr == 16'h26 ? 16'h2020 :  // <0134>   
// "  ev_pri"
addr == 16'h27 ? 16'h2020 :  // <0134>   
addr == 16'h28 ? 16'h7665 :  // <0134> ve
addr == 16'h29 ? 16'h705f :  // <0134> p_
addr == 16'h2a ? 16'h6972 :  // <0134> ir
// "softevnt"
addr == 16'h2b ? 16'h6f73 :  // <0134> os
addr == 16'h2c ? 16'h7466 :  // <0134> tf
addr == 16'h2d ? 16'h7665 :  // <0134> ve
addr == 16'h2e ? 16'h746e :  // <0134> tn
// "   usage"
addr == 16'h2f ? 16'h2020 :  // <0134>   
addr == 16'h30 ? 16'h7520 :  // <0134> u 
addr == 16'h31 ? 16'h6173 :  // <0134> as
addr == 16'h32 ? 16'h6567 :  // <0134> eg
// "ustimer0"
addr == 16'h33 ? 16'h7375 :  // <0134> su
addr == 16'h34 ? 16'h6974 :  // <0134> it
addr == 16'h35 ? 16'h656d :  // <0134> em
addr == 16'h36 ? 16'h3072 :  // <0134> 0r
// "mstimer0"
addr == 16'h37 ? 16'h736d :  // <0134> sm
addr == 16'h38 ? 16'h6974 :  // <0134> it
addr == 16'h39 ? 16'h656d :  // <0134> em
addr == 16'h3a ? 16'h3072 :  // <0134> 0r
// "mstimer1"
addr == 16'h3b ? 16'h736d :  // <0134> sm
addr == 16'h3c ? 16'h6974 :  // <0134> it
addr == 16'h3d ? 16'h656d :  // <0134> em
addr == 16'h3e ? 16'h3172 :  // <0134> 1r
// "spi_data"
addr == 16'h3f ? 16'h7073 :  // <0134> ps
addr == 16'h40 ? 16'h5f69 :  // <0134> _i
addr == 16'h41 ? 16'h6164 :  // <0134> ad
addr == 16'h42 ? 16'h6174 :  // <0134> at
// "//avwrdt"
addr == 16'h43 ? 16'h2f2f :  // <0134> //
addr == 16'h44 ? 16'h7661 :  // <0134> va
addr == 16'h45 ? 16'h7277 :  // <0134> rw
addr == 16'h46 ? 16'h7464 :  // <0134> td
// "av_rd_dt"
addr == 16'h47 ? 16'h7661 :  // <0134> va
addr == 16'h48 ? 16'h725f :  // <0134> r_
addr == 16'h49 ? 16'h5f64 :  // <0134> _d
addr == 16'h4a ? 16'h7464 :  // <0134> td
// "av_ad_hi"
addr == 16'h4b ? 16'h7661 :  // <0134> va
addr == 16'h4c ? 16'h615f :  // <0134> a_
addr == 16'h4d ? 16'h5f64 :  // <0134> _d
addr == 16'h4e ? 16'h6968 :  // <0134> ih
// "av_ad_lo"
addr == 16'h4f ? 16'h7661 :  // <0134> va
addr == 16'h50 ? 16'h615f :  // <0134> a_
addr == 16'h51 ? 16'h5f64 :  // <0134> _d
addr == 16'h52 ? 16'h6f6c :  // <0134> ol
// "//uartdt"
addr == 16'h53 ? 16'h2f2f :  // <0134> //
addr == 16'h54 ? 16'h6175 :  // <0134> au
addr == 16'h55 ? 16'h7472 :  // <0134> tr
addr == 16'h56 ? 16'h7464 :  // <0134> td
// "uartstat"
addr == 16'h57 ? 16'h6175 :  // <0134> au
addr == 16'h58 ? 16'h7472 :  // <0134> tr
addr == 16'h59 ? 16'h7473 :  // <0134> ts
addr == 16'h5a ? 16'h7461 :  // <0134> ta
// "    leds"
addr == 16'h5b ? 16'h2020 :  // <0134>   
addr == 16'h5c ? 16'h2020 :  // <0134>   
addr == 16'h5d ? 16'h656c :  // <0134> el
addr == 16'h5e ? 16'h7364 :  // <0134> sd
// "brd_ctrl"
addr == 16'h5f ? 16'h7262 :  // <0134> rb
addr == 16'h60 ? 16'h5f64 :  // <0134> _d
addr == 16'h61 ? 16'h7463 :  // <0134> tc
addr == 16'h62 ? 16'h6c72 :  // <0134> lr
// "   anmux"
addr == 16'h63 ? 16'h2020 :  // <0134>   
addr == 16'h64 ? 16'h6120 :  // <0134> a 
addr == 16'h65 ? 16'h6d6e :  // <0134> mn
addr == 16'h66 ? 16'h7875 :  // <0134> xu
// "pwr_duty"
addr == 16'h67 ? 16'h7770 :  // <0134> wp
addr == 16'h68 ? 16'h5f72 :  // <0134> _r
addr == 16'h69 ? 16'h7564 :  // <0134> ud
addr == 16'h6a ? 16'h7974 :  // <0134> yt
// "efilenus"
addr == 16'h6b ? 16'h6665 :  // <0134> fe
addr == 16'h6c ? 16'h6c69 :  // <0134> li
addr == 16'h6d ? 16'h6e65 :  // <0134> ne
addr == 16'h6e ? 16'h7375 :  // <0134> su
// "igntmout"
addr == 16'h6f ? 16'h6769 :  // <0134> gi
addr == 16'h70 ? 16'h746e :  // <0134> tn
addr == 16'h71 ? 16'h6f6d :  // <0134> om
addr == 16'h72 ? 16'h7475 :  // <0134> tu

// libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.

// event loop.  this infrastructure is assembled directly into the main program, not a func.
// first instruction of an event handler should be the 7th cycle after reading its priority from the event controller here.
// :poll_events // = 0x0073
// initialize prior to polling loop, for minimum latency.
addr == 16'h73 ? 16'h07a0 :  // <0006> b = :event_table
addr == 16'h74 ? 16'h018a :  // <0006> "
// 3-cycle polling loop.
// :poll_events_again // = 0x0075
addr == 16'h75 ? 16'h0009 :  // <0009> a = event_priority
addr == 16'h76 ? 16'he000 :  // <0010> br 0z :poll_events_again
addr == 16'h77 ? 16'h0075 :  // <0010> "
// acknowledge the event to clear its capture register.  do this right away,
// so another occurrence of the same event can be captured right away in the controller.
addr == 16'h78 ? 16'h2400 :  // <0013> event_priority = a
// compute an address in the event_table.  note the absence of a wait state for the adder here (not needed).
addr == 16'h79 ? 16'hd300 :  // <0015> fetch rtna from ad0
addr == 16'h7a ? 16'hfbb0 :  // <0015> "
// jump to the address given in the event_table.  each handler MUST end with a end_event.
// each handler does NOT need to save ANY registers (e.g. no convention_gpx).  they can all be trashed.
// each handler is passed the event priority in a, in case the same handler is used on multiple priorities.
addr == 16'h7b ? 16'hfc00 :  // <0019> swapra = nop
// just returned here from the handler, in case the handler accidentally did a rtn.  this should NEVER happen.
addr == 16'h7c ? 16'h5ba0 :  // <0021> error_halt_code 0xffc0 // leds = 0xffc0
addr == 16'h7d ? 16'hffc0 :  // <0021> "
addr == 16'h7e ? 16'he00f :  // <0021> error_halt_code 0xffc0
addr == 16'h7f ? 16'h007e :  // <0021> "


// driver library for synapse316_uart simple async transceiver.






// routine sends out the low byte from a to the UART.  blocks until the FIFO accepts the byte.
// ######## func putchar_fduart // = 0x0080
addr == 16'h80 ? 16'h2004 :  // <0044> push x // func putchar_fduart

addr == 16'h81 ? 16'h1000 :  // <0046> x = a

// wait for FIFO to be available.
addr == 16'h82 ? 16'h0202 :  // <0049> a = $atx_fifo_full_mask
// :pcfduart_wait_for_idle // = 0x0083
addr == 16'h83 ? 16'h0415 :  // <0051> b = fduart_status
addr == 16'h84 ? 16'he403 :  // <0052> bn and0z :pcfduart_wait_for_idle
addr == 16'h85 ? 16'h0083 :  // <0052> "

// push word to the UART.  its low byte is a character.
addr == 16'h86 ? 16'h5004 :  // <0055> fduart_data = x
addr == 16'h87 ? 16'h1008 :  // <0056> pop x // end_func
addr == 16'h88 ? 16'hfc00 :  // <0056> end_func

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// ######## func getchar_fduart // = 0x0089
// wait until FIFO is populated.
addr == 16'h89 ? 16'h0208 :  // <0062> a = $arx_fifo_empty_mask
// :wait_for_busy // = 0x008a
addr == 16'h8a ? 16'h0415 :  // <0064> b = fduart_status
addr == 16'h8b ? 16'he403 :  // <0065> bn and0z :wait_for_busy
addr == 16'h8c ? 16'h008a :  // <0065> "
addr == 16'h8d ? 16'h0014 :  // <0066> a = fduart_data
addr == 16'h8e ? 16'hfc00 :  // <0067> end_func

// returns a character in a, or -1 if none.
// ######## func pollchar_fduart // = 0x008f
// check for FIFO is populated.
addr == 16'h8f ? 16'h0208 :  // <0072> a = $arx_fifo_empty_mask
addr == 16'h90 ? 16'h0415 :  // <0073> b = fduart_status
addr == 16'h91 ? 16'he403 :  // <0074> bn and0z :none
addr == 16'h92 ? 16'h0095 :  // <0074> "
addr == 16'h93 ? 16'h0014 :  // <0075> a = fduart_data
addr == 16'h94 ? 16'hfc00 :  // <0076> rtn
// :none // = 0x0095
addr == 16'h95 ? 16'h0360 :  // <0078> a = -1
addr == 16'h96 ? 16'hfc00 :  // <0079> end_func


// pass desired anmux channel in a.
// after this returns, CALLER MUST WAIT for muxer & current driver to
// settle down.  some delay for that is absolutely required (per testing).
// 5 ms wait works well 2015/04.
// ######## func anmux_set_chn // = 0x0097
// set & enable analog muxer
addr == 16'h97 ? 16'h0608 :  // <0007> b = $anmux_enable_mask
addr == 16'h98 ? 16'hc800 :  // <0008> anmux_ctrl = or
addr == 16'h99 ? 16'h6334 :  // <0008> "
addr == 16'h9a ? 16'hfc00 :  // <0009> end_func

// ######## func anmux_get_chn // = 0x009b
addr == 16'h9b ? 16'h0018 :  // <0012> a = anmux_ctrl
addr == 16'h9c ? 16'h0607 :  // <0013> b = $anmux_channel_mask
addr == 16'h9d ? 16'hc800 :  // <0014> a = and
addr == 16'h9e ? 16'h0330 :  // <0014> "
addr == 16'h9f ? 16'hfc00 :  // <0015> end_func


// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// ######## func fetch_byte // = 0x00a0
addr == 16'ha0 ? 16'h0601 :  // <0005> b = 1
addr == 16'ha1 ? 16'he003 :  // <0006> br and0z :pick_byte_even
addr == 16'ha2 ? 16'h00ab :  // <0006> "
addr == 16'ha3 ? 16'h0350 :  // <0007> a = a>>1
addr == 16'ha4 ? 16'h0404 :  // <0008> b = x
addr == 16'ha5 ? 16'hc800 :  // <0009> fetch a from a+b
addr == 16'ha6 ? 16'hd300 :  // <0009> "
addr == 16'ha7 ? 16'h03b0 :  // <0009> "
addr == 16'ha8 ? 16'h0353 :  // <0010> a = a>>4
addr == 16'ha9 ? 16'h0353 :  // <0011> a = a>>4
addr == 16'haa ? 16'hfc00 :  // <0012> rtn
// :pick_byte_even // = 0x00ab
addr == 16'hab ? 16'h0350 :  // <0014> a = a>>1
addr == 16'hac ? 16'h0404 :  // <0015> b = x
addr == 16'had ? 16'hc800 :  // <0016> fetch a from a+b
addr == 16'hae ? 16'hd300 :  // <0016> "
addr == 16'haf ? 16'h03b0 :  // <0016> "
addr == 16'hb0 ? 16'h06ff :  // <0017> b = 0xff
addr == 16'hb1 ? 16'hc800 :  // <0018> a = and
addr == 16'hb2 ? 16'h0330 :  // <0018> "
addr == 16'hb3 ? 16'hfc00 :  // <0019> end_func

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// ######## func find_in_fetch // = 0x00b4
addr == 16'hb4 ? 16'h2002 :  // <0027> push i // func find_in_fetch
addr == 16'hb5 ? 16'h2003 :  // <0027> push j // "
addr == 16'hb6 ? 16'h2005 :  // <0027> push y // "
addr == 16'hb7 ? 16'h203e :  // <0027> push rtna // "
addr == 16'hb8 ? 16'h1400 :  // <0028> y = a
addr == 16'hb9 ? 16'h0f60 :  // <0029> j = -1
// :again // = 0x00ba
addr == 16'hba ? 16'he001 :  // <0031> br iz :fail
addr == 16'hbb ? 16'h00ca :  // <0031> "
addr == 16'hbc ? 16'h0b10 :  // <0032> i = ad1
addr == 16'hbd ? 16'h0002 :  // <0033> a = i
addr == 16'hbe ? 16'hfba0 :  // <0034> call :fetch_byte
addr == 16'hbf ? 16'h00a0 :  // <0034> "
addr == 16'hc0 ? 16'hfc00 :  // <0034> "
addr == 16'hc1 ? 16'h0405 :  // <0035> b = y
addr == 16'hc2 ? 16'he407 :  // <0036> bn eq :again
addr == 16'hc3 ? 16'h00ba :  // <0036> "
// :found // = 0x00c4
addr == 16'hc4 ? 16'h0002 :  // <0038> a = i
addr == 16'hc5 ? 16'hf808 :  // <0039> pop rtna // rtn
addr == 16'hc6 ? 16'h1408 :  // <0039> pop y // "
addr == 16'hc7 ? 16'h0c08 :  // <0039> pop j // "
addr == 16'hc8 ? 16'h0808 :  // <0039> pop i // "
addr == 16'hc9 ? 16'hfc00 :  // <0039> rtn
// :fail // = 0x00ca
addr == 16'hca ? 16'h0360 :  // <0041> a = -1
addr == 16'hcb ? 16'hf808 :  // <0042> pop rtna // end_func
addr == 16'hcc ? 16'h1408 :  // <0042> pop y // "
addr == 16'hcd ? 16'h0c08 :  // <0042> pop j // "
addr == 16'hce ? 16'h0808 :  // <0042> pop i // "
addr == 16'hcf ? 16'hfc00 :  // <0042> end_func



// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x00d0
// "0123456789abcdef"
addr == 16'hd0 ? 16'h3130 :  // <0054> 10
addr == 16'hd1 ? 16'h3332 :  // <0054> 32
addr == 16'hd2 ? 16'h3534 :  // <0054> 54
addr == 16'hd3 ? 16'h3736 :  // <0054> 76
addr == 16'hd4 ? 16'h3938 :  // <0054> 98
addr == 16'hd5 ? 16'h6261 :  // <0054> ba
addr == 16'hd6 ? 16'h6463 :  // <0054> dc
addr == 16'hd7 ? 16'h6665 :  // <0054> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// ######## func put4x // = 0x00d8
addr == 16'hd8 ? 16'h2004 :  // <0058> push x // func put4x
addr == 16'hd9 ? 16'h2006 :  // <0058> push g6 // "
addr == 16'hda ? 16'h203e :  // <0058> push rtna // "
addr == 16'hdb ? 16'h13a0 :  // <0059> x = :hexdigits
addr == 16'hdc ? 16'h00d0 :  // <0059> "

addr == 16'hdd ? 16'h1800 :  // <0061> g6 = a
addr == 16'hde ? 16'h07a0 :  // <0062> b = 0xF000
addr == 16'hdf ? 16'hf000 :  // <0062> "
addr == 16'he0 ? 16'hc800 :  // <0063> a = and
addr == 16'he1 ? 16'h0330 :  // <0063> "
addr == 16'he2 ? 16'h0353 :  // <0064> a = a>>4
addr == 16'he3 ? 16'h0353 :  // <0065> a = a>>4
addr == 16'he4 ? 16'h0353 :  // <0066> a = a>>4
addr == 16'he5 ? 16'hfba0 :  // <0067> call fetch_byte
addr == 16'he6 ? 16'h00a0 :  // <0067> "
addr == 16'he7 ? 16'hfc00 :  // <0067> "
addr == 16'he8 ? 16'h0000 :  // <0068> a = a // putchar a
addr == 16'he9 ? 16'hfba0 :  // <0068> putchar a
addr == 16'hea ? 16'h0080 :  // <0068> "
addr == 16'heb ? 16'hfc00 :  // <0068> "

addr == 16'hec ? 16'h0006 :  // <0070> a = g6
addr == 16'hed ? 16'h07a0 :  // <0071> b = 0x0F00
addr == 16'hee ? 16'h0f00 :  // <0071> "
addr == 16'hef ? 16'hc800 :  // <0072> a = and
addr == 16'hf0 ? 16'h0330 :  // <0072> "
addr == 16'hf1 ? 16'h0353 :  // <0073> a = a>>4
addr == 16'hf2 ? 16'h0353 :  // <0074> a = a>>4
addr == 16'hf3 ? 16'hfba0 :  // <0075> call fetch_byte
addr == 16'hf4 ? 16'h00a0 :  // <0075> "
addr == 16'hf5 ? 16'hfc00 :  // <0075> "
addr == 16'hf6 ? 16'h0000 :  // <0076> a = a // putchar a
addr == 16'hf7 ? 16'hfba0 :  // <0076> putchar a
addr == 16'hf8 ? 16'h0080 :  // <0076> "
addr == 16'hf9 ? 16'hfc00 :  // <0076> "

addr == 16'hfa ? 16'h0006 :  // <0078> a = g6
addr == 16'hfb ? 16'h06f0 :  // <0079> b = 0x00F0
addr == 16'hfc ? 16'hc800 :  // <0080> a = and
addr == 16'hfd ? 16'h0330 :  // <0080> "
addr == 16'hfe ? 16'h0353 :  // <0081> a = a>>4
addr == 16'hff ? 16'hfba0 :  // <0082> call fetch_byte
addr == 16'h100 ? 16'h00a0 :  // <0082> "
addr == 16'h101 ? 16'hfc00 :  // <0082> "
addr == 16'h102 ? 16'h0000 :  // <0083> a = a // putchar a
addr == 16'h103 ? 16'hfba0 :  // <0083> putchar a
addr == 16'h104 ? 16'h0080 :  // <0083> "
addr == 16'h105 ? 16'hfc00 :  // <0083> "

addr == 16'h106 ? 16'h0006 :  // <0085> a = g6
addr == 16'h107 ? 16'h060f :  // <0086> b = 0x000F
addr == 16'h108 ? 16'hc800 :  // <0087> a = and
addr == 16'h109 ? 16'h0330 :  // <0087> "
addr == 16'h10a ? 16'hfba0 :  // <0088> call fetch_byte
addr == 16'h10b ? 16'h00a0 :  // <0088> "
addr == 16'h10c ? 16'hfc00 :  // <0088> "
addr == 16'h10d ? 16'h0000 :  // <0089> a = a // putchar a
addr == 16'h10e ? 16'hfba0 :  // <0089> putchar a
addr == 16'h10f ? 16'h0080 :  // <0089> "
addr == 16'h110 ? 16'hfc00 :  // <0089> "

addr == 16'h111 ? 16'hf808 :  // <0091> pop rtna // end_func
addr == 16'h112 ? 16'h1808 :  // <0091> pop g6 // "
addr == 16'h113 ? 16'h1008 :  // <0091> pop x // "
addr == 16'h114 ? 16'hfc00 :  // <0091> end_func

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// ######## func get4x // = 0x0115
addr == 16'h115 ? 16'h2002 :  // <0095> push i // func get4x
addr == 16'h116 ? 16'h2003 :  // <0095> push j // "
addr == 16'h117 ? 16'h2004 :  // <0095> push x // "
addr == 16'h118 ? 16'h2005 :  // <0095> push y // "
addr == 16'h119 ? 16'h203e :  // <0095> push rtna // "
// y = digit counter
// j = sum
addr == 16'h11a ? 16'h1604 :  // <0098> y = 4
// :again // = 0x011b
addr == 16'h11b ? 16'hfba0 :  // <0100> getchar
addr == 16'h11c ? 16'h0089 :  // <0100> "
addr == 16'h11d ? 16'hfc00 :  // <0100> "
addr == 16'h11e ? 16'h2000 :  // <0100> push a // "
addr == 16'h11f ? 16'h0000 :  // <0100> a = a // "
addr == 16'h120 ? 16'hfba0 :  // <0100> "
addr == 16'h121 ? 16'h0080 :  // <0100> "
addr == 16'h122 ? 16'hfc00 :  // <0100> "
addr == 16'h123 ? 16'h0008 :  // <0100> pop a // "
addr == 16'h124 ? 16'h13a0 :  // <0101> x = :hexdigits
addr == 16'h125 ? 16'h00d0 :  // <0101> "
addr == 16'h126 ? 16'h0a10 :  // <0102> i = 16
addr == 16'h127 ? 16'hfba0 :  // <0103> call :find_in_fetch
addr == 16'h128 ? 16'h00b4 :  // <0103> "
addr == 16'h129 ? 16'hfc00 :  // <0103> "
addr == 16'h12a ? 16'h0760 :  // <0104> b = -1
addr == 16'h12b ? 16'he007 :  // <0105> br eq :fail
addr == 16'h12c ? 16'h0140 :  // <0105> "
addr == 16'h12d ? 16'h0400 :  // <0106> b = a
addr == 16'h12e ? 16'h0003 :  // <0107> a = j
addr == 16'h12f ? 16'h0352 :  // <0108> a = a<<4
addr == 16'h130 ? 16'hc800 :  // <0109> j = or
addr == 16'h131 ? 16'h0f34 :  // <0109> "
addr == 16'h132 ? 16'h1360 :  // <0110> x = -1
addr == 16'h133 ? 16'hc800 :  // <0111> y = x+y
addr == 16'h134 ? 16'h1720 :  // <0111> "
addr == 16'h135 ? 16'h0005 :  // <0112> a = y
addr == 16'h136 ? 16'he400 :  // <0113> bn az :again
addr == 16'h137 ? 16'h011b :  // <0113> "
addr == 16'h138 ? 16'h0003 :  // <0114> a = j
addr == 16'h139 ? 16'h0600 :  // <0115> b = 0
addr == 16'h13a ? 16'hf808 :  // <0116> pop rtna // rtn
addr == 16'h13b ? 16'h1408 :  // <0116> pop y // "
addr == 16'h13c ? 16'h1008 :  // <0116> pop x // "
addr == 16'h13d ? 16'h0c08 :  // <0116> pop j // "
addr == 16'h13e ? 16'h0808 :  // <0116> pop i // "
addr == 16'h13f ? 16'hfc00 :  // <0116> rtn
// :fail // = 0x0140
addr == 16'h140 ? 16'h0760 :  // <0118> b = -1
addr == 16'h141 ? 16'hf808 :  // <0119> pop rtna // end_func
addr == 16'h142 ? 16'h1408 :  // <0119> pop y // "
addr == 16'h143 ? 16'h1008 :  // <0119> pop x // "
addr == 16'h144 ? 16'h0c08 :  // <0119> pop j // "
addr == 16'h145 ? 16'h0808 :  // <0119> pop i // "
addr == 16'h146 ? 16'hfc00 :  // <0119> end_func

// routine waits a number of milliseconds given in a.
// ######## func spinwait // = 0x0147
addr == 16'h147 ? 16'h2004 :  // <0002> push x // func spinwait
addr == 16'h148 ? 16'h2005 :  // <0002> push y // "
//patch
//rtn
addr == 16'h149 ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x014a
addr == 16'h14a ? 16'h13a0 :  // <0007> x = 16666
addr == 16'h14b ? 16'h411a :  // <0007> "
addr == 16'h14c ? 16'h1760 :  // <0008> y = -1
addr == 16'h14d ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x014e
// use of the ad2 name overrides auto-nop here.
addr == 16'h14e ? 16'h1320 :  // <0012> x = ad2
addr == 16'h14f ? 16'he402 :  // <0013> bn xz :spinwait_inner
addr == 16'h150 ? 16'h014e :  // <0013> "
addr == 16'h151 ? 16'hc800 :  // <0014> a = a+b
addr == 16'h152 ? 16'h0300 :  // <0014> "
addr == 16'h153 ? 16'he400 :  // <0015> bn az :spinwait_outer
addr == 16'h154 ? 16'h014a :  // <0015> "
addr == 16'h155 ? 16'h1408 :  // <0016> pop y // end_func
addr == 16'h156 ? 16'h1008 :  // <0016> pop x // "
addr == 16'h157 ? 16'hfc00 :  // <0016> end_func



// #########################################################################
// :main // = 0x0158

// soft_event = $event_controller_reset_mask
// soft_event = 0
// mstimer0 = 1000
// :waiting
// a = event_priority
// br az :waiting
// event_priority = a
// putasc "."
// jmp :main

// clear the first 64k of RAM.
addr == 16'h158 ? 16'h4a00 :  // <0159> av_ad_hi = 0
addr == 16'h159 ? 16'h0200 :  // <0160> a = 0
addr == 16'h15a ? 16'h0602 :  // <0161> b = 2
// :clear_next_word // = 0x015b
addr == 16'h15b ? 16'h4c00 :  // <0163> av_ad_lo = a
addr == 16'h15c ? 16'h4200 :  // <0164> av_write_data = 0
addr == 16'h15d ? 16'h0300 :  // <0165> a = ad0
addr == 16'h15e ? 16'he400 :  // <0166> bn az :clear_next_word
addr == 16'h15f ? 16'h015b :  // <0166> "

// init RAM variables.
addr == 16'h160 ? 16'h4a00 :  // <0169> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h161 ? 16'h4e04 :  // <0169> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 4
addr == 16'h162 ? 16'h4360 :  // <0169> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h163 ? 16'h4a00 :  // <0170> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_hi = 0
addr == 16'h164 ? 16'h4e06 :  // <0170> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_lo = 6
addr == 16'h165 ? 16'h4202 :  // <0170> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_write_data = 2

// init fuel injection.
addr == 16'h166 ? 16'h6fa0 :  // <0173> ign_timeout_len_20us = 0xfffc
addr == 16'h167 ? 16'hfffc :  // <0173> "
addr == 16'h168 ? 16'h6ba0 :  // <0174> efi_len_us = 3000
addr == 16'h169 ? 16'h0bb8 :  // <0174> "

// power up FTDI USB board, and init any other special board control functions.
addr == 16'h16a ? 16'h5e80 :  // <0177> board_ctrl = $ftdi_power_mask

//patch
// :testagain // = 0x016b
addr == 16'h16b ? 16'h5e40 :  // <0181> board_ctrl = $beeper_enable_mask
addr == 16'h16c ? 16'h03a0 :  // <0182> a = 1000
addr == 16'h16d ? 16'h03e8 :  // <0182> "
addr == 16'h16e ? 16'hfba0 :  // <0183> call :spinwait
addr == 16'h16f ? 16'h0147 :  // <0183> "
addr == 16'h170 ? 16'hfc00 :  // <0183> "
addr == 16'h171 ? 16'h5e80 :  // <0184> board_ctrl = $ftdi_power_mask
addr == 16'h172 ? 16'h03a0 :  // <0185> a = 1000
addr == 16'h173 ? 16'h03e8 :  // <0185> "
addr == 16'h174 ? 16'hfba0 :  // <0186> call :spinwait
addr == 16'h175 ? 16'h0147 :  // <0186> "
addr == 16'h176 ? 16'hfc00 :  // <0186> "
addr == 16'h177 ? 16'he00f :  // <0187> br always :testagain
addr == 16'h178 ? 16'h016b :  // <0187> "


// check initial state of power management circuits.
// if power is lost or ignition switch is off already, open relay & abort run.
// that's important because then the event controller booted up too late to
// see edges on those 2 signals.  regular system would never shut itself down.
// this setup is the last thing done prior to the event handler loop.
addr == 16'h179 ? 16'h6600 :  // <0195> power_duty = $power_duty_closing
addr == 16'h17a ? 16'h0019 :  // <0196> a = power_duty
addr == 16'h17b ? 16'h06c0 :  // <0197> b = ($power_lost_mask | $ignition_switch_off_mask)
addr == 16'h17c ? 16'he003 :  // <0198> br and0z :skip_power_lost
addr == 16'h17d ? 16'h0183 :  // <0198> "
addr == 16'h17e ? 16'h6632 :  // <0199> power_duty = $power_duty_opening
addr == 16'h17f ? 16'h5ba0 :  // <0200> error_halt_code $err_power_lost_at_boot // leds = 0xfffb
addr == 16'h180 ? 16'hfffb :  // <0200> "
addr == 16'h181 ? 16'he00f :  // <0200> error_halt_code $err_power_lost_at_boot
addr == 16'h182 ? 16'h0181 :  // <0200> "
// :skip_power_lost // = 0x0183

// start handling events.
addr == 16'h183 ? 16'h2ba0 :  // <0204> soft_event = $event_controller_reset_mask
addr == 16'h184 ? 16'h8000 :  // <0204> "
addr == 16'h185 ? 16'h2a00 :  // <0205> soft_event = 0
addr == 16'h186 ? 16'h37a0 :  // <0206> mstimer0 = 1000
addr == 16'h187 ? 16'h03e8 :  // <0206> "
addr == 16'h188 ? 16'he00f :  // <0207> jmp :poll_events
addr == 16'h189 ? 16'h0073 :  // <0207> "

// event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.
// event 0 not used in this app anyway.
// :event_table // = 0x018a
addr == 16'h18a ? 16'h0073 :  // <0212> ([label :poll_events])
addr == 16'h18b ? 16'h026a :  // <0213> ([label :power_lost_handler])
addr == 16'h18c ? 16'h0289 :  // <0214> ([label :puff1_done_handler])
addr == 16'h18d ? 16'h019c :  // <0215> ([label :ustimer0_handler])
addr == 16'h18e ? 16'h019e :  // <0216> ([label :spi_done_handler])
addr == 16'h18f ? 16'h01d1 :  // <0217> ([label :mstimer0_handler])
addr == 16'h190 ? 16'h01f9 :  // <0218> ([label :mstimer1_handler])
addr == 16'h191 ? 16'h021a :  // <0219> ([label :uart_rx_handler])
addr == 16'h192 ? 16'h021c :  // <0220> ([label :uart_rx_overflow_handler])
addr == 16'h193 ? 16'h0222 :  // <0221> ([label :uart_tx_overflow_handler])
addr == 16'h194 ? 16'h0228 :  // <0222> ([label :key0_handler])
addr == 16'h195 ? 16'h0234 :  // <0223> ([label :key1_handler])
addr == 16'h196 ? 16'h0279 :  // <0224> ([label :ignition_switch_off_handler])
addr == 16'h197 ? 16'h0284 :  // <0225> ([label :ignition_switch_on_handler])
addr == 16'h198 ? 16'h0240 :  // <0226> ([label :softevent3_handler])
addr == 16'h199 ? 16'h0242 :  // <0227> ([label :softevent2_handler])
addr == 16'h19a ? 16'h0244 :  // <0228> ([label :softevent1_handler])
addr == 16'h19b ? 16'h0246 :  // <0229> ([label :softevent0_handler])

// #########################################################################

// ######## event ustimer0_handler // = 0x019c
addr == 16'h19c ? 16'he00f :  // <0234> end_event
addr == 16'h19d ? 16'h0073 :  // <0234> "

// ######## event spi_done_handler // = 0x019e
// discard-counter in RAM.
addr == 16'h19e ? 16'h4a00 :  // <0238> ram a = $ram_daq_discard_cnt // av_ad_hi = 0
addr == 16'h19f ? 16'h4e02 :  // <0238> ram a = $ram_daq_discard_cnt // av_ad_lo = 2
addr == 16'h1a0 ? 16'h0010 :  // <0238> ram a = $ram_daq_discard_cnt // a = av_write_data // start read cycle
addr == 16'h1a1 ? 16'h0011 :  // <0238> ram a = $ram_daq_discard_cnt // a = av_read_data // finish read cycle
addr == 16'h1a2 ? 16'he000 :  // <0239> br az :report
addr == 16'h1a3 ? 16'h01b0 :  // <0239> "
addr == 16'h1a4 ? 16'h0760 :  // <0240> b = -1
addr == 16'h1a5 ? 16'hc800 :  // <0241> a = a+b
addr == 16'h1a6 ? 16'h0300 :  // <0241> "
addr == 16'h1a7 ? 16'h4a00 :  // <0242> ram $ram_daq_discard_cnt = a // av_ad_hi = 0
addr == 16'h1a8 ? 16'h4e02 :  // <0242> ram $ram_daq_discard_cnt = a // av_ad_lo = 2
addr == 16'h1a9 ? 16'h4000 :  // <0242> ram $ram_daq_discard_cnt = a // av_write_data = a
addr == 16'h1aa ? 16'h0207 :  // <0243> a = $anmux_adc_channel
addr == 16'h1ab ? 16'hfba0 :  // <0244> call :begin_adc_conversion
addr == 16'h1ac ? 16'h0263 :  // <0244> "
addr == 16'h1ad ? 16'hfc00 :  // <0244> "
addr == 16'h1ae ? 16'he00f :  // <0245> event_return
addr == 16'h1af ? 16'h0073 :  // <0245> "

// report ADC reading.
// :report // = 0x01b0
addr == 16'h1b0 ? 16'h000f :  // <0249> a = spi_data
addr == 16'h1b1 ? 16'hfba0 :  // <0250> call :put4x
addr == 16'h1b2 ? 16'h00d8 :  // <0250> "
addr == 16'h1b3 ? 16'hfc00 :  // <0250> "

// decrement anmux channel & start waiting again.
addr == 16'h1b4 ? 16'hfba0 :  // <0253> call :anmux_get_chn
addr == 16'h1b5 ? 16'h009b :  // <0253> "
addr == 16'h1b6 ? 16'hfc00 :  // <0253> "
addr == 16'h1b7 ? 16'he000 :  // <0254> br az :all_done
addr == 16'h1b8 ? 16'h01c2 :  // <0254> "
addr == 16'h1b9 ? 16'h0760 :  // <0255> b = -1
addr == 16'h1ba ? 16'hc800 :  // <0256> a = a+b
addr == 16'h1bb ? 16'h0300 :  // <0256> "
addr == 16'h1bc ? 16'hfba0 :  // <0257> call :anmux_set_chn
addr == 16'h1bd ? 16'h0097 :  // <0257> "
addr == 16'h1be ? 16'hfc00 :  // <0257> "
addr == 16'h1bf ? 16'h3a05 :  // <0258> mstimer1 = $anmux_settle_ms
addr == 16'h1c0 ? 16'he00f :  // <0259> event_return
addr == 16'h1c1 ? 16'h0073 :  // <0259> "

// end of daq pass.
// :all_done // = 0x01c2
addr == 16'h1c2 ? 16'h020d :  // <0263> a = 13 // puteol
addr == 16'h1c3 ? 16'h0000 :  // <0263> a = a // puteol
addr == 16'h1c4 ? 16'hfba0 :  // <0263> puteol
addr == 16'h1c5 ? 16'h0080 :  // <0263> "
addr == 16'h1c6 ? 16'hfc00 :  // <0263> "
addr == 16'h1c7 ? 16'h020a :  // <0263> a = 10 // puteol
addr == 16'h1c8 ? 16'h0000 :  // <0263> a = a // puteol
addr == 16'h1c9 ? 16'hfba0 :  // <0263> puteol
addr == 16'h1ca ? 16'h0080 :  // <0263> "
addr == 16'h1cb ? 16'hfc00 :  // <0263> "
addr == 16'h1cc ? 16'h4a00 :  // <0264> ram $ram_dial_setting = spi_data // av_ad_hi = 0
addr == 16'h1cd ? 16'h4e0e :  // <0264> ram $ram_dial_setting = spi_data // av_ad_lo = 14
addr == 16'h1ce ? 16'h400f :  // <0264> ram $ram_dial_setting = spi_data // av_write_data = spi_data
addr == 16'h1cf ? 16'he00f :  // <0265> end_event
addr == 16'h1d0 ? 16'h0073 :  // <0265> "

// ######## event mstimer0_handler // = 0x01d1
// unified 1-second periodic timer for all low-resolution tasks.

// start timer again.
addr == 16'h1d1 ? 16'h37a0 :  // <0271> mstimer0 = 1000
addr == 16'h1d2 ? 16'h03e8 :  // <0271> "

// realtime counters in RAM.
addr == 16'h1d3 ? 16'h4a00 :  // <0274> ram a = $ram_seconds_cnt // av_ad_hi = 0
addr == 16'h1d4 ? 16'h4e0a :  // <0274> ram a = $ram_seconds_cnt // av_ad_lo = 10
addr == 16'h1d5 ? 16'h0010 :  // <0274> ram a = $ram_seconds_cnt // a = av_write_data // start read cycle
addr == 16'h1d6 ? 16'h0011 :  // <0274> ram a = $ram_seconds_cnt // a = av_read_data // finish read cycle
addr == 16'h1d7 ? 16'h0601 :  // <0275> b = 1
addr == 16'h1d8 ? 16'hc800 :  // <0276> a = a+b
addr == 16'h1d9 ? 16'h0300 :  // <0276> "
addr == 16'h1da ? 16'h063c :  // <0277> b = 60
addr == 16'h1db ? 16'he407 :  // <0278> bn eq :same_minute
addr == 16'h1dc ? 16'h01ee :  // <0278> "
addr == 16'h1dd ? 16'h4a00 :  // <0279> ram $ram_seconds_cnt = 0 // av_ad_hi = 0
addr == 16'h1de ? 16'h4e0a :  // <0279> ram $ram_seconds_cnt = 0 // av_ad_lo = 10
addr == 16'h1df ? 16'h4200 :  // <0279> ram $ram_seconds_cnt = 0 // av_write_data = 0
addr == 16'h1e0 ? 16'h4a00 :  // <0280> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h1e1 ? 16'h4e08 :  // <0280> ram a = $ram_minutes_cnt // av_ad_lo = 8
addr == 16'h1e2 ? 16'h0010 :  // <0280> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h1e3 ? 16'h0011 :  // <0280> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h1e4 ? 16'h0601 :  // <0281> b = 1
addr == 16'h1e5 ? 16'h4a00 :  // <0282> ram $ram_minutes_cnt = a+b // av_ad_hi = 0
addr == 16'h1e6 ? 16'h4e08 :  // <0282> ram $ram_minutes_cnt = a+b // av_ad_lo = 8
addr == 16'h1e7 ? 16'hc800 :  // <0282> ram $ram_minutes_cnt = a+b // av_write_data = a+b
addr == 16'h1e8 ? 16'h4300 :  // <0282> "
addr == 16'h1e9 ? 16'hfba0 :  // <0283> call :minute_events
addr == 16'h1ea ? 16'h0296 :  // <0283> "
addr == 16'h1eb ? 16'hfc00 :  // <0283> "
addr == 16'h1ec ? 16'he00f :  // <0284> jmp :minutes_done
addr == 16'h1ed ? 16'h01f1 :  // <0284> "
// :same_minute // = 0x01ee
addr == 16'h1ee ? 16'h4a00 :  // <0286> ram $ram_seconds_cnt = a // av_ad_hi = 0
addr == 16'h1ef ? 16'h4e0a :  // <0286> ram $ram_seconds_cnt = a // av_ad_lo = 10
addr == 16'h1f0 ? 16'h4000 :  // <0286> ram $ram_seconds_cnt = a // av_write_data = a
// :minutes_done // = 0x01f1

addr == 16'h1f1 ? 16'hfba0 :  // <0289> call :check_power_relay
addr == 16'h1f2 ? 16'h029c :  // <0289> "
addr == 16'h1f3 ? 16'hfc00 :  // <0289> "
addr == 16'h1f4 ? 16'hfba0 :  // <0290> call :start_daq_pass
addr == 16'h1f5 ? 16'h0248 :  // <0290> "
addr == 16'h1f6 ? 16'hfc00 :  // <0290> "
addr == 16'h1f7 ? 16'he00f :  // <0291> end_event
addr == 16'h1f8 ? 16'h0073 :  // <0291> "

// ######## event mstimer1_handler // = 0x01f9
// start a reading from the current anmux channel.
addr == 16'h1f9 ? 16'h4a00 :  // <0295> ram $ram_daq_discard_cnt = $anmux_num_discards // av_ad_hi = 0
addr == 16'h1fa ? 16'h4e02 :  // <0295> ram $ram_daq_discard_cnt = $anmux_num_discards // av_ad_lo = 2
addr == 16'h1fb ? 16'h4202 :  // <0295> ram $ram_daq_discard_cnt = $anmux_num_discards // av_write_data = 2
addr == 16'h1fc ? 16'h0220 :  // <0296> a = 32 // putasc " "
addr == 16'h1fd ? 16'h0000 :  // <0296> a = a // putasc " "
addr == 16'h1fe ? 16'hfba0 :  // <0296> putasc " "
addr == 16'h1ff ? 16'h0080 :  // <0296> "
addr == 16'h200 ? 16'hfc00 :  // <0296> "
addr == 16'h201 ? 16'h0273 :  // <0297> a = 115 // putasc "s"
addr == 16'h202 ? 16'h0000 :  // <0297> a = a // putasc "s"
addr == 16'h203 ? 16'hfba0 :  // <0297> putasc "s"
addr == 16'h204 ? 16'h0080 :  // <0297> "
addr == 16'h205 ? 16'hfc00 :  // <0297> "
addr == 16'h206 ? 16'hfba0 :  // <0298> call :anmux_get_chn
addr == 16'h207 ? 16'h009b :  // <0298> "
addr == 16'h208 ? 16'hfc00 :  // <0298> "
addr == 16'h209 ? 16'h0630 :  // <0299> b = 48 // asc b = "0"
addr == 16'h20a ? 16'hc800 :  // <0300> a = a+b // putchar a+b
addr == 16'h20b ? 16'h0300 :  // <0300> "
addr == 16'h20c ? 16'hfba0 :  // <0300> putchar a+b
addr == 16'h20d ? 16'h0080 :  // <0300> "
addr == 16'h20e ? 16'hfc00 :  // <0300> "
addr == 16'h20f ? 16'h023d :  // <0301> a = 61 // putasc "="
addr == 16'h210 ? 16'h0000 :  // <0301> a = a // putasc "="
addr == 16'h211 ? 16'hfba0 :  // <0301> putasc "="
addr == 16'h212 ? 16'h0080 :  // <0301> "
addr == 16'h213 ? 16'hfc00 :  // <0301> "
addr == 16'h214 ? 16'h0207 :  // <0302> a = $anmux_adc_channel
addr == 16'h215 ? 16'hfba0 :  // <0303> call :begin_adc_conversion
addr == 16'h216 ? 16'h0263 :  // <0303> "
addr == 16'h217 ? 16'hfc00 :  // <0303> "
addr == 16'h218 ? 16'he00f :  // <0304> end_event
addr == 16'h219 ? 16'h0073 :  // <0304> "

// ######## event uart_rx_handler // = 0x021a
// handle data here
addr == 16'h21a ? 16'he00f :  // <0308> end_event
addr == 16'h21b ? 16'h0073 :  // <0308> "

// ######## event uart_rx_overflow_handler // = 0x021c
addr == 16'h21c ? 16'h5ba0 :  // <0311> error_halt_code $err_rx_overflow // leds = 0xfffe
addr == 16'h21d ? 16'hfffe :  // <0311> "
addr == 16'h21e ? 16'he00f :  // <0311> error_halt_code $err_rx_overflow
addr == 16'h21f ? 16'h021e :  // <0311> "
addr == 16'h220 ? 16'he00f :  // <0312> end_event
addr == 16'h221 ? 16'h0073 :  // <0312> "

// ######## event uart_tx_overflow_handler // = 0x0222
addr == 16'h222 ? 16'h5ba0 :  // <0315> error_halt_code $err_tx_overflow // leds = 0xfffd
addr == 16'h223 ? 16'hfffd :  // <0315> "
addr == 16'h224 ? 16'he00f :  // <0315> error_halt_code $err_tx_overflow
addr == 16'h225 ? 16'h0224 :  // <0315> "
addr == 16'h226 ? 16'he00f :  // <0316> end_event
addr == 16'h227 ? 16'h0073 :  // <0316> "

// ######## event key0_handler // = 0x0228
addr == 16'h228 ? 16'h026b :  // <0319> a = 107 // putasc "k"
addr == 16'h229 ? 16'h0000 :  // <0319> a = a // putasc "k"
addr == 16'h22a ? 16'hfba0 :  // <0319> putasc "k"
addr == 16'h22b ? 16'h0080 :  // <0319> "
addr == 16'h22c ? 16'hfc00 :  // <0319> "
addr == 16'h22d ? 16'h0230 :  // <0320> a = 48 // putasc "0"
addr == 16'h22e ? 16'h0000 :  // <0320> a = a // putasc "0"
addr == 16'h22f ? 16'hfba0 :  // <0320> putasc "0"
addr == 16'h230 ? 16'h0080 :  // <0320> "
addr == 16'h231 ? 16'hfc00 :  // <0320> "
addr == 16'h232 ? 16'he00f :  // <0321> end_event
addr == 16'h233 ? 16'h0073 :  // <0321> "

// ######## event key1_handler // = 0x0234
addr == 16'h234 ? 16'h026b :  // <0324> a = 107 // putasc "k"
addr == 16'h235 ? 16'h0000 :  // <0324> a = a // putasc "k"
addr == 16'h236 ? 16'hfba0 :  // <0324> putasc "k"
addr == 16'h237 ? 16'h0080 :  // <0324> "
addr == 16'h238 ? 16'hfc00 :  // <0324> "
addr == 16'h239 ? 16'h0231 :  // <0325> a = 49 // putasc "1"
addr == 16'h23a ? 16'h0000 :  // <0325> a = a // putasc "1"
addr == 16'h23b ? 16'hfba0 :  // <0325> putasc "1"
addr == 16'h23c ? 16'h0080 :  // <0325> "
addr == 16'h23d ? 16'hfc00 :  // <0325> "
addr == 16'h23e ? 16'he00f :  // <0326> end_event
addr == 16'h23f ? 16'h0073 :  // <0326> "

// ######## event softevent3_handler // = 0x0240
addr == 16'h240 ? 16'he00f :  // <0329> end_event
addr == 16'h241 ? 16'h0073 :  // <0329> "

// ######## event softevent2_handler // = 0x0242
addr == 16'h242 ? 16'he00f :  // <0332> end_event
addr == 16'h243 ? 16'h0073 :  // <0332> "

// ######## event softevent1_handler // = 0x0244
addr == 16'h244 ? 16'he00f :  // <0335> end_event
addr == 16'h245 ? 16'h0073 :  // <0335> "

// ######## event softevent0_handler // = 0x0246
addr == 16'h246 ? 16'he00f :  // <0338> end_event
addr == 16'h247 ? 16'h0073 :  // <0338> "

// ######## func start_daq_pass // = 0x0248
addr == 16'h248 ? 16'h203e :  // <0340> push rtna // func start_daq_pass
// daq pass counter in RAM.
addr == 16'h249 ? 16'h4a00 :  // <0342> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h24a ? 16'h4e00 :  // <0342> ram a = $ram_daq_pass_cnt // av_ad_lo = 0
addr == 16'h24b ? 16'h0010 :  // <0342> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h24c ? 16'h0011 :  // <0342> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h24d ? 16'h0601 :  // <0343> b = 1
addr == 16'h24e ? 16'hc800 :  // <0344> a = a+b
addr == 16'h24f ? 16'h0300 :  // <0344> "
addr == 16'h250 ? 16'h5800 :  // <0345> leds = a
addr == 16'h251 ? 16'h4a00 :  // <0346> ram $ram_daq_pass_cnt = a // av_ad_hi = 0
addr == 16'h252 ? 16'h4e00 :  // <0346> ram $ram_daq_pass_cnt = a // av_ad_lo = 0
addr == 16'h253 ? 16'h4000 :  // <0346> ram $ram_daq_pass_cnt = a // av_write_data = a
addr == 16'h254 ? 16'hfba0 :  // <0347> call :put4x
addr == 16'h255 ? 16'h00d8 :  // <0347> "
addr == 16'h256 ? 16'hfc00 :  // <0347> "
addr == 16'h257 ? 16'h023a :  // <0348> a = 58 // putasc ":"
addr == 16'h258 ? 16'h0000 :  // <0348> a = a // putasc ":"
addr == 16'h259 ? 16'hfba0 :  // <0348> putasc ":"
addr == 16'h25a ? 16'h0080 :  // <0348> "
addr == 16'h25b ? 16'hfc00 :  // <0348> "

// start to acquire & report all anmux channels.
addr == 16'h25c ? 16'h0207 :  // <0351> a = 7
addr == 16'h25d ? 16'hfba0 :  // <0352> call :anmux_set_chn
addr == 16'h25e ? 16'h0097 :  // <0352> "
addr == 16'h25f ? 16'hfc00 :  // <0352> "
addr == 16'h260 ? 16'h3a05 :  // <0353> mstimer1 = $anmux_settle_ms

// // observe MCU utilization.
// a = usage_count
// call :put4x
// usage_count = 0
addr == 16'h261 ? 16'hf808 :  // <0359> pop rtna // end_func
addr == 16'h262 ? 16'hfc00 :  // <0359> end_func

// ######## func begin_adc_conversion // = 0x0263
// begin SPI transaction, specifying Nano ADC channel to take effect NEXT
// conversion after this one.  pass that in a.

addr == 16'h263 ? 16'h0352 :  // <0365> a = a<<4
addr == 16'h264 ? 16'h0352 :  // <0366> a = a<<4
addr == 16'h265 ? 16'h0351 :  // <0367> a = a<<1
addr == 16'h266 ? 16'h0351 :  // <0368> a = a<<1
addr == 16'h267 ? 16'h0351 :  // <0369> a = a<<1
addr == 16'h268 ? 16'h3c00 :  // <0370> spi_data = a
addr == 16'h269 ? 16'hfc00 :  // <0371> end_func

// ######## event power_lost_handler // = 0x026a
// at this time we have less than 2 ms of usable run time left.

// this must be an uncommanded loss of main power, because if it was commanded,
// no more events would be handled; this event handler wouldn't have a chance to run.
// immediately set the power relay PWM to full power for a few seconds,
// in case the power relay opened accidentally e.g. due to a hard pothole.
addr == 16'h26a ? 16'h6600 :  // <0380> power_duty = $power_duty_closing
addr == 16'h26b ? 16'h4a00 :  // <0381> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h26c ? 16'h4e00 :  // <0381> ram a = $ram_daq_pass_cnt // av_ad_lo = 0
addr == 16'h26d ? 16'h0010 :  // <0381> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h26e ? 16'h0011 :  // <0381> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h26f ? 16'h0602 :  // <0382> b = $relay_hold_passes
addr == 16'h270 ? 16'h4a00 :  // <0383> ram $ram_relay_hold_at_pass = a+b // av_ad_hi = 0
addr == 16'h271 ? 16'h4e06 :  // <0383> ram $ram_relay_hold_at_pass = a+b // av_ad_lo = 6
addr == 16'h272 ? 16'hc800 :  // <0383> ram $ram_relay_hold_at_pass = a+b // av_write_data = a+b
addr == 16'h273 ? 16'h4300 :  // <0383> "

// pause any non-vital power-hogging operations, to conserve power for the EEPROM write.

// save persistent data in case the power remains down e.g. due to battery disconnect.
addr == 16'h274 ? 16'hfba0 :  // <0388> call :save_persistent_data
addr == 16'h275 ? 16'h02c3 :  // <0388> "
addr == 16'h276 ? 16'hfc00 :  // <0388> "
addr == 16'h277 ? 16'he00f :  // <0389> end_event
addr == 16'h278 ? 16'h0073 :  // <0389> "

// ######## event ignition_switch_off_handler // = 0x0279
// set power-down deadline in RAM.  this makes the system remain powered for several more minutes, for cooldown data logging.
addr == 16'h279 ? 16'h4a00 :  // <0393> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h27a ? 16'h4e08 :  // <0393> ram a = $ram_minutes_cnt // av_ad_lo = 8
addr == 16'h27b ? 16'h0010 :  // <0393> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h27c ? 16'h0011 :  // <0393> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h27d ? 16'h060a :  // <0394> b = $power_extend_minutes
addr == 16'h27e ? 16'h4a00 :  // <0395> ram $ram_power_down_at_min = a+b // av_ad_hi = 0
addr == 16'h27f ? 16'h4e04 :  // <0395> ram $ram_power_down_at_min = a+b // av_ad_lo = 4
addr == 16'h280 ? 16'hc800 :  // <0395> ram $ram_power_down_at_min = a+b // av_write_data = a+b
addr == 16'h281 ? 16'h4300 :  // <0395> "
addr == 16'h282 ? 16'he00f :  // <0396> end_event
addr == 16'h283 ? 16'h0073 :  // <0396> "

// ######## event ignition_switch_on_handler // = 0x0284
addr == 16'h284 ? 16'h4a00 :  // <0399> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h285 ? 16'h4e04 :  // <0399> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 4
addr == 16'h286 ? 16'h4360 :  // <0399> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h287 ? 16'he00f :  // <0400> end_event
addr == 16'h288 ? 16'h0073 :  // <0400> "

// ######## event puff1_done_handler // = 0x0289
addr == 16'h289 ? 16'h4a00 :  // <0403> ram a = $ram_dial_setting // av_ad_hi = 0
addr == 16'h28a ? 16'h4e0e :  // <0403> ram a = $ram_dial_setting // av_ad_lo = 14
addr == 16'h28b ? 16'h0010 :  // <0403> ram a = $ram_dial_setting // a = av_write_data // start read cycle
addr == 16'h28c ? 16'h0011 :  // <0403> ram a = $ram_dial_setting // a = av_read_data // finish read cycle
addr == 16'h28d ? 16'h0351 :  // <0404> a = a<<1
addr == 16'h28e ? 16'h0351 :  // <0405> a = a<<1
addr == 16'h28f ? 16'h0351 :  // <0406> a = a<<1
addr == 16'h290 ? 16'he400 :  // <0407> bn az :nonzero
addr == 16'h291 ? 16'h0293 :  // <0407> "
addr == 16'h292 ? 16'h0201 :  // <0408> a = 1
// :nonzero // = 0x0293
addr == 16'h293 ? 16'h6800 :  // <0410> efi_len_us = a
addr == 16'h294 ? 16'he00f :  // <0411> end_event
addr == 16'h295 ? 16'h0073 :  // <0411> "

// ######## func minute_events // = 0x0296
addr == 16'h296 ? 16'h203e :  // <0413> push rtna // func minute_events
addr == 16'h297 ? 16'hfba0 :  // <0414> call :check_power_down
addr == 16'h298 ? 16'h02a8 :  // <0414> "
addr == 16'h299 ? 16'hfc00 :  // <0414> "
addr == 16'h29a ? 16'hf808 :  // <0415> pop rtna // end_func
addr == 16'h29b ? 16'hfc00 :  // <0415> end_func

// ######## func check_power_relay // = 0x029c
addr == 16'h29c ? 16'h4a00 :  // <0418> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h29d ? 16'h4e00 :  // <0418> ram a = $ram_daq_pass_cnt // av_ad_lo = 0
addr == 16'h29e ? 16'h0010 :  // <0418> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h29f ? 16'h0011 :  // <0418> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h2a0 ? 16'h4a00 :  // <0419> ram b = $ram_relay_hold_at_pass // av_ad_hi = 0
addr == 16'h2a1 ? 16'h4e06 :  // <0419> ram b = $ram_relay_hold_at_pass // av_ad_lo = 6
addr == 16'h2a2 ? 16'h0410 :  // <0419> ram b = $ram_relay_hold_at_pass // b = av_write_data // start read cycle
addr == 16'h2a3 ? 16'h0411 :  // <0419> ram b = $ram_relay_hold_at_pass // b = av_read_data // finish read cycle
addr == 16'h2a4 ? 16'he407 :  // <0420> bn eq :done
addr == 16'h2a5 ? 16'h02a7 :  // <0420> "
// time to begin "solenoid saver" coil power reduction by PWM.
addr == 16'h2a6 ? 16'h6619 :  // <0422> power_duty = $power_duty_holding
// :done // = 0x02a7
addr == 16'h2a7 ? 16'hfc00 :  // <0424> end_func

// ######## func check_power_down // = 0x02a8
addr == 16'h2a8 ? 16'h203e :  // <0426> push rtna // func check_power_down
// check power-down deadline in RAM.
addr == 16'h2a9 ? 16'h4a00 :  // <0428> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h2aa ? 16'h4e08 :  // <0428> ram a = $ram_minutes_cnt // av_ad_lo = 8
addr == 16'h2ab ? 16'h0010 :  // <0428> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h2ac ? 16'h0011 :  // <0428> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h2ad ? 16'h4a00 :  // <0429> ram b = $ram_power_down_at_min // av_ad_hi = 0
addr == 16'h2ae ? 16'h4e04 :  // <0429> ram b = $ram_power_down_at_min // av_ad_lo = 4
addr == 16'h2af ? 16'h0410 :  // <0429> ram b = $ram_power_down_at_min // b = av_write_data // start read cycle
addr == 16'h2b0 ? 16'h0411 :  // <0429> ram b = $ram_power_down_at_min // b = av_read_data // finish read cycle
addr == 16'h2b1 ? 16'he407 :  // <0430> bn eq :done
addr == 16'h2b2 ? 16'h02b6 :  // <0430> "
addr == 16'h2b3 ? 16'hfba0 :  // <0431> call :power_down
addr == 16'h2b4 ? 16'h02b8 :  // <0431> "
addr == 16'h2b5 ? 16'hfc00 :  // <0431> "
// :done // = 0x02b6
addr == 16'h2b6 ? 16'hf808 :  // <0433> pop rtna // end_func
addr == 16'h2b7 ? 16'hfc00 :  // <0433> end_func

// ######## func power_down // = 0x02b8
addr == 16'h2b8 ? 16'h203e :  // <0435> push rtna // func power_down
// this function never returns.
addr == 16'h2b9 ? 16'hfba0 :  // <0437> call :save_persistent_data
addr == 16'h2ba ? 16'h02c3 :  // <0437> "
addr == 16'h2bb ? 16'hfc00 :  // <0437> "
addr == 16'h2bc ? 16'h6632 :  // <0438> power_duty = $power_duty_opening
addr == 16'h2bd ? 16'h5ba0 :  // <0439> error_halt_code $err_power_down // leds = 0xfffc
addr == 16'h2be ? 16'hfffc :  // <0439> "
addr == 16'h2bf ? 16'he00f :  // <0439> error_halt_code $err_power_down
addr == 16'h2c0 ? 16'h02bf :  // <0439> "
addr == 16'h2c1 ? 16'hf808 :  // <0440> pop rtna // end_func
addr == 16'h2c2 ? 16'hfc00 :  // <0440> end_func

// ######## func save_persistent_data // = 0x02c3
addr == 16'h2c3 ? 16'hfc00 :  // <0443> end_func

        
                16'hxxxx;
        endmodule
    
