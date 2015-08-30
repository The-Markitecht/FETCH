
        `include "header.v"

        module target_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.




// register file configuration.

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

// all ignition time vars are expressed in 20us "jiffies" or "jf".
// 5000 RPM = about 140 jf between rising edges on chevy ignition white wire.
// 1000 RPM = about 700 jf
//  100 RPM = about 7000 jf
//   22 RPM = about 32000 jf, the slowest figure that's safe for the divide routine.
// setvar ign_history_quarter      ($ign_history_len / 4)
// setvar ign_quarter_avg_shift    ($ign_history_idx_bits - 2)
// ram_define ram_ign_oldest_avg_jf
// ram_define ram_ign_newest_avg_jf

// realtime counting.

// text flag reporting.

// error code constants.

addr == 16'h00 ? 16'he00f :  // <0168> jmp :main
addr == 16'h01 ? 16'h01e2 :  // <0168> "

addr == 16'h02 ? 16'h001d :  // <0170> emit_debugger_register_table  counter
// "       a"
addr == 16'h03 ? 16'h2020 :  // <0170>   
addr == 16'h04 ? 16'h2020 :  // <0170>   
addr == 16'h05 ? 16'h2020 :  // <0170>   
addr == 16'h06 ? 16'h6120 :  // <0170> a 
// "       b"
addr == 16'h07 ? 16'h2020 :  // <0170>   
addr == 16'h08 ? 16'h2020 :  // <0170>   
addr == 16'h09 ? 16'h2020 :  // <0170>   
addr == 16'h0a ? 16'h6220 :  // <0170> b 
// "       i"
addr == 16'h0b ? 16'h2020 :  // <0170>   
addr == 16'h0c ? 16'h2020 :  // <0170>   
addr == 16'h0d ? 16'h2020 :  // <0170>   
addr == 16'h0e ? 16'h6920 :  // <0170> i 
// "       j"
addr == 16'h0f ? 16'h2020 :  // <0170>   
addr == 16'h10 ? 16'h2020 :  // <0170>   
addr == 16'h11 ? 16'h2020 :  // <0170>   
addr == 16'h12 ? 16'h6a20 :  // <0170> j 
// "       x"
addr == 16'h13 ? 16'h2020 :  // <0170>   
addr == 16'h14 ? 16'h2020 :  // <0170>   
addr == 16'h15 ? 16'h2020 :  // <0170>   
addr == 16'h16 ? 16'h7820 :  // <0170> x 
// "       y"
addr == 16'h17 ? 16'h2020 :  // <0170>   
addr == 16'h18 ? 16'h2020 :  // <0170>   
addr == 16'h19 ? 16'h2020 :  // <0170>   
addr == 16'h1a ? 16'h7920 :  // <0170> y 
// "      g6"
addr == 16'h1b ? 16'h2020 :  // <0170>   
addr == 16'h1c ? 16'h2020 :  // <0170>   
addr == 16'h1d ? 16'h2020 :  // <0170>   
addr == 16'h1e ? 16'h3667 :  // <0170> 6g
// "      g7"
addr == 16'h1f ? 16'h2020 :  // <0170>   
addr == 16'h20 ? 16'h2020 :  // <0170>   
addr == 16'h21 ? 16'h2020 :  // <0170>   
addr == 16'h22 ? 16'h3767 :  // <0170> 7g
// "//rstk  "
addr == 16'h23 ? 16'h2f2f :  // <0170> //
addr == 16'h24 ? 16'h7372 :  // <0170> sr
addr == 16'h25 ? 16'h6b74 :  // <0170> kt
addr == 16'h26 ? 16'h2020 :  // <0170>   
// "  ev_pri"
addr == 16'h27 ? 16'h2020 :  // <0170>   
addr == 16'h28 ? 16'h7665 :  // <0170> ve
addr == 16'h29 ? 16'h705f :  // <0170> p_
addr == 16'h2a ? 16'h6972 :  // <0170> ir
// "softevnt"
addr == 16'h2b ? 16'h6f73 :  // <0170> os
addr == 16'h2c ? 16'h7466 :  // <0170> tf
addr == 16'h2d ? 16'h7665 :  // <0170> ve
addr == 16'h2e ? 16'h746e :  // <0170> tn
// "   usage"
addr == 16'h2f ? 16'h2020 :  // <0170>   
addr == 16'h30 ? 16'h7520 :  // <0170> u 
addr == 16'h31 ? 16'h6173 :  // <0170> as
addr == 16'h32 ? 16'h6567 :  // <0170> eg
// "ustimer0"
addr == 16'h33 ? 16'h7375 :  // <0170> su
addr == 16'h34 ? 16'h6974 :  // <0170> it
addr == 16'h35 ? 16'h656d :  // <0170> em
addr == 16'h36 ? 16'h3072 :  // <0170> 0r
// "mstimer0"
addr == 16'h37 ? 16'h736d :  // <0170> sm
addr == 16'h38 ? 16'h6974 :  // <0170> it
addr == 16'h39 ? 16'h656d :  // <0170> em
addr == 16'h3a ? 16'h3072 :  // <0170> 0r
// "mstimer1"
addr == 16'h3b ? 16'h736d :  // <0170> sm
addr == 16'h3c ? 16'h6974 :  // <0170> it
addr == 16'h3d ? 16'h656d :  // <0170> em
addr == 16'h3e ? 16'h3172 :  // <0170> 1r
// "spi_data"
addr == 16'h3f ? 16'h7073 :  // <0170> ps
addr == 16'h40 ? 16'h5f69 :  // <0170> _i
addr == 16'h41 ? 16'h6164 :  // <0170> ad
addr == 16'h42 ? 16'h6174 :  // <0170> at
// "//avwrdt"
addr == 16'h43 ? 16'h2f2f :  // <0170> //
addr == 16'h44 ? 16'h7661 :  // <0170> va
addr == 16'h45 ? 16'h7277 :  // <0170> rw
addr == 16'h46 ? 16'h7464 :  // <0170> td
// "av_rd_dt"
addr == 16'h47 ? 16'h7661 :  // <0170> va
addr == 16'h48 ? 16'h725f :  // <0170> r_
addr == 16'h49 ? 16'h5f64 :  // <0170> _d
addr == 16'h4a ? 16'h7464 :  // <0170> td
// "av_ad_hi"
addr == 16'h4b ? 16'h7661 :  // <0170> va
addr == 16'h4c ? 16'h615f :  // <0170> a_
addr == 16'h4d ? 16'h5f64 :  // <0170> _d
addr == 16'h4e ? 16'h6968 :  // <0170> ih
// "av_ad_lo"
addr == 16'h4f ? 16'h7661 :  // <0170> va
addr == 16'h50 ? 16'h615f :  // <0170> a_
addr == 16'h51 ? 16'h5f64 :  // <0170> _d
addr == 16'h52 ? 16'h6f6c :  // <0170> ol
// "//uartdt"
addr == 16'h53 ? 16'h2f2f :  // <0170> //
addr == 16'h54 ? 16'h6175 :  // <0170> au
addr == 16'h55 ? 16'h7472 :  // <0170> tr
addr == 16'h56 ? 16'h7464 :  // <0170> td
// "uartstat"
addr == 16'h57 ? 16'h6175 :  // <0170> au
addr == 16'h58 ? 16'h7472 :  // <0170> tr
addr == 16'h59 ? 16'h7473 :  // <0170> ts
addr == 16'h5a ? 16'h7461 :  // <0170> ta
// "    leds"
addr == 16'h5b ? 16'h2020 :  // <0170>   
addr == 16'h5c ? 16'h2020 :  // <0170>   
addr == 16'h5d ? 16'h656c :  // <0170> el
addr == 16'h5e ? 16'h7364 :  // <0170> sd
// "brd_ctrl"
addr == 16'h5f ? 16'h7262 :  // <0170> rb
addr == 16'h60 ? 16'h5f64 :  // <0170> _d
addr == 16'h61 ? 16'h7463 :  // <0170> tc
addr == 16'h62 ? 16'h6c72 :  // <0170> lr
// "   anmux"
addr == 16'h63 ? 16'h2020 :  // <0170>   
addr == 16'h64 ? 16'h6120 :  // <0170> a 
addr == 16'h65 ? 16'h6d6e :  // <0170> mn
addr == 16'h66 ? 16'h7875 :  // <0170> xu
// "pwr_duty"
addr == 16'h67 ? 16'h7770 :  // <0170> wp
addr == 16'h68 ? 16'h5f72 :  // <0170> _r
addr == 16'h69 ? 16'h7564 :  // <0170> ud
addr == 16'h6a ? 16'h7974 :  // <0170> yt
// "efilenus"
addr == 16'h6b ? 16'h6665 :  // <0170> fe
addr == 16'h6c ? 16'h6c69 :  // <0170> li
addr == 16'h6d ? 16'h6e65 :  // <0170> ne
addr == 16'h6e ? 16'h7375 :  // <0170> su
// "igntmout"
addr == 16'h6f ? 16'h6769 :  // <0170> gi
addr == 16'h70 ? 16'h746e :  // <0170> tn
addr == 16'h71 ? 16'h6f6d :  // <0170> om
addr == 16'h72 ? 16'h7475 :  // <0170> tu
// "igntmcap"
addr == 16'h73 ? 16'h6769 :  // <0170> gi
addr == 16'h74 ? 16'h746e :  // <0170> tn
addr == 16'h75 ? 16'h636d :  // <0170> cm
addr == 16'h76 ? 16'h7061 :  // <0170> pa

// libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.

// event loop.  this infrastructure is assembled directly into the main program, not a func.
// first instruction of an event handler should be the 7th cycle after reading its priority from the event controller here.
// :poll_events // = 0x0077
// initialize prior to polling loop, for minimum latency.
addr == 16'h77 ? 16'h07a0 :  // <0006> b = :event_table
addr == 16'h78 ? 16'h0211 :  // <0006> "
// 3-cycle polling loop.
// :poll_events_again // = 0x0079
addr == 16'h79 ? 16'h0009 :  // <0009> a = event_priority
addr == 16'h7a ? 16'he000 :  // <0010> br 0z :poll_events_again
addr == 16'h7b ? 16'h0079 :  // <0010> "
// acknowledge the event to clear its capture register.  do this right away,
// so another occurrence of the same event can be captured right away in the controller.
addr == 16'h7c ? 16'h2400 :  // <0013> event_priority = a
// compute an address in the event_table.  note the absence of a wait state for the adder here (not needed).
addr == 16'h7d ? 16'hd300 :  // <0015> fetch rtna from ad0
addr == 16'h7e ? 16'hfbb0 :  // <0015> "
// jump to the address given in the event_table.  each handler MUST end with a end_event.
// each handler does NOT need to save ANY registers (e.g. no convention_gpx).  they can all be trashed.
// each handler is passed the event priority in a, in case the same handler is used on multiple priorities.
addr == 16'h7f ? 16'hfc00 :  // <0019> swapra = nop
// just returned here from the handler, in case the handler accidentally did a rtn.  this should NEVER happen.
addr == 16'h80 ? 16'h5ba0 :  // <0021> error_halt_code 0xffc0 // leds = 0xffc0
addr == 16'h81 ? 16'hffc0 :  // <0021> "
addr == 16'h82 ? 16'he00f :  // <0021> error_halt_code 0xffc0
addr == 16'h83 ? 16'h0082 :  // <0021> "


// driver library for synapse316_uart simple async transceiver.






// routine sends out the low byte from a to the UART.  blocks until the FIFO accepts the byte.
// ######## func putchar_fduart // = 0x0084
addr == 16'h84 ? 16'h2004 :  // <0046> push x // func putchar_fduart

addr == 16'h85 ? 16'h1000 :  // <0048> x = a

// wait for FIFO to be available.
addr == 16'h86 ? 16'h0202 :  // <0051> a = $atx_fifo_full_mask
// :pcfduart_wait_for_idle // = 0x0087
addr == 16'h87 ? 16'h0415 :  // <0053> b = fduart_status
addr == 16'h88 ? 16'he403 :  // <0054> bn and0z :pcfduart_wait_for_idle
addr == 16'h89 ? 16'h0087 :  // <0054> "

// push word to the UART.  its low byte is a character.
addr == 16'h8a ? 16'h5004 :  // <0057> fduart_data = x
addr == 16'h8b ? 16'h1008 :  // <0058> pop x // end_func
addr == 16'h8c ? 16'hfc00 :  // <0058> end_func

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// ######## func getchar_fduart // = 0x008d
// wait until FIFO is populated.
addr == 16'h8d ? 16'h0208 :  // <0064> a = $arx_fifo_empty_mask
// :wait_for_busy // = 0x008e
addr == 16'h8e ? 16'h0415 :  // <0066> b = fduart_status
addr == 16'h8f ? 16'he403 :  // <0067> bn and0z :wait_for_busy
addr == 16'h90 ? 16'h008e :  // <0067> "
addr == 16'h91 ? 16'h0014 :  // <0068> a = fduart_data
addr == 16'h92 ? 16'hfc00 :  // <0069> end_func

// returns a character in a, or -1 if none.
// ######## func pollchar_fduart // = 0x0093
// check for FIFO is populated.
addr == 16'h93 ? 16'h0208 :  // <0074> a = $arx_fifo_empty_mask
addr == 16'h94 ? 16'h0415 :  // <0075> b = fduart_status
addr == 16'h95 ? 16'he403 :  // <0076> bn and0z :none
addr == 16'h96 ? 16'h0099 :  // <0076> "
addr == 16'h97 ? 16'h0014 :  // <0077> a = fduart_data
addr == 16'h98 ? 16'hfc00 :  // <0078> rtn
// :none // = 0x0099
addr == 16'h99 ? 16'h0360 :  // <0080> a = -1
addr == 16'h9a ? 16'hfc00 :  // <0081> end_func


// pass desired anmux channel in a.
// after this returns, CALLER MUST WAIT for muxer & current driver to
// settle down.  some delay for that is absolutely required (per testing).
// 5 ms wait works well 2015/04.
// ######## func anmux_set_chn // = 0x009b
// set & enable analog muxer
addr == 16'h9b ? 16'h0608 :  // <0007> b = $anmux_enable_mask
addr == 16'h9c ? 16'hc800 :  // <0008> anmux_ctrl = or
addr == 16'h9d ? 16'h6334 :  // <0008> "
addr == 16'h9e ? 16'hfc00 :  // <0009> end_func

// ######## func anmux_get_chn // = 0x009f
addr == 16'h9f ? 16'h0018 :  // <0012> a = anmux_ctrl
addr == 16'ha0 ? 16'h0607 :  // <0013> b = $anmux_channel_mask
addr == 16'ha1 ? 16'hc800 :  // <0014> a = and
addr == 16'ha2 ? 16'h0330 :  // <0014> "
addr == 16'ha3 ? 16'hfc00 :  // <0015> end_func


// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x00a4
// "0123456789abcdef"
addr == 16'ha4 ? 16'h3130 :  // <0050> 10
addr == 16'ha5 ? 16'h3332 :  // <0050> 32
addr == 16'ha6 ? 16'h3534 :  // <0050> 54
addr == 16'ha7 ? 16'h3736 :  // <0050> 76
addr == 16'ha8 ? 16'h3938 :  // <0050> 98
addr == 16'ha9 ? 16'h6261 :  // <0050> ba
addr == 16'haa ? 16'h6463 :  // <0050> dc
addr == 16'hab ? 16'h6665 :  // <0050> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// ######## func put4x // = 0x00ac
addr == 16'hac ? 16'h2004 :  // <0054> push x // func put4x
addr == 16'had ? 16'h2006 :  // <0054> push g6 // "
addr == 16'hae ? 16'h203e :  // <0054> push rtna // "
addr == 16'haf ? 16'h13a0 :  // <0055> x = :hexdigits
addr == 16'hb0 ? 16'h00a4 :  // <0055> "

addr == 16'hb1 ? 16'h1800 :  // <0057> g6 = a
addr == 16'hb2 ? 16'h07a0 :  // <0058> b = 0xF000
addr == 16'hb3 ? 16'hf000 :  // <0058> "
addr == 16'hb4 ? 16'hc800 :  // <0059> a = and
addr == 16'hb5 ? 16'h0330 :  // <0059> "
addr == 16'hb6 ? 16'h0353 :  // <0060> a = a>>4
addr == 16'hb7 ? 16'h0353 :  // <0061> a = a>>4
addr == 16'hb8 ? 16'h0353 :  // <0062> a = a>>4
addr == 16'hb9 ? 16'hfba0 :  // <0063> call fetch_byte
addr == 16'hba ? 16'h019e :  // <0063> "
addr == 16'hbb ? 16'hfc00 :  // <0063> "
addr == 16'hbc ? 16'hfba0 :  // <0064> putchar a
addr == 16'hbd ? 16'h0084 :  // <0064> "
addr == 16'hbe ? 16'hfc00 :  // <0064> "

addr == 16'hbf ? 16'h0006 :  // <0066> a = g6
addr == 16'hc0 ? 16'h07a0 :  // <0067> b = 0x0F00
addr == 16'hc1 ? 16'h0f00 :  // <0067> "
addr == 16'hc2 ? 16'hc800 :  // <0068> a = and
addr == 16'hc3 ? 16'h0330 :  // <0068> "
addr == 16'hc4 ? 16'h0353 :  // <0069> a = a>>4
addr == 16'hc5 ? 16'h0353 :  // <0070> a = a>>4
addr == 16'hc6 ? 16'hfba0 :  // <0071> call fetch_byte
addr == 16'hc7 ? 16'h019e :  // <0071> "
addr == 16'hc8 ? 16'hfc00 :  // <0071> "
addr == 16'hc9 ? 16'hfba0 :  // <0072> putchar a
addr == 16'hca ? 16'h0084 :  // <0072> "
addr == 16'hcb ? 16'hfc00 :  // <0072> "

addr == 16'hcc ? 16'h0006 :  // <0074> a = g6
addr == 16'hcd ? 16'h06f0 :  // <0075> b = 0x00F0
addr == 16'hce ? 16'hc800 :  // <0076> a = and
addr == 16'hcf ? 16'h0330 :  // <0076> "
addr == 16'hd0 ? 16'h0353 :  // <0077> a = a>>4
addr == 16'hd1 ? 16'hfba0 :  // <0078> call fetch_byte
addr == 16'hd2 ? 16'h019e :  // <0078> "
addr == 16'hd3 ? 16'hfc00 :  // <0078> "
addr == 16'hd4 ? 16'hfba0 :  // <0079> putchar a
addr == 16'hd5 ? 16'h0084 :  // <0079> "
addr == 16'hd6 ? 16'hfc00 :  // <0079> "

addr == 16'hd7 ? 16'h0006 :  // <0081> a = g6
addr == 16'hd8 ? 16'h060f :  // <0082> b = 0x000F
addr == 16'hd9 ? 16'hc800 :  // <0083> a = and
addr == 16'hda ? 16'h0330 :  // <0083> "
addr == 16'hdb ? 16'hfba0 :  // <0084> call fetch_byte
addr == 16'hdc ? 16'h019e :  // <0084> "
addr == 16'hdd ? 16'hfc00 :  // <0084> "
addr == 16'hde ? 16'hfba0 :  // <0085> putchar a
addr == 16'hdf ? 16'h0084 :  // <0085> "
addr == 16'he0 ? 16'hfc00 :  // <0085> "

addr == 16'he1 ? 16'hf808 :  // <0087> pop rtna // end_func
addr == 16'he2 ? 16'h1808 :  // <0087> pop g6 // "
addr == 16'he3 ? 16'h1008 :  // <0087> pop x // "
addr == 16'he4 ? 16'hfc00 :  // <0087> end_func

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// ######## func get4x // = 0x00e5
addr == 16'he5 ? 16'h2002 :  // <0091> push i // func get4x
addr == 16'he6 ? 16'h2003 :  // <0091> push j // "
addr == 16'he7 ? 16'h2004 :  // <0091> push x // "
addr == 16'he8 ? 16'h2005 :  // <0091> push y // "
addr == 16'he9 ? 16'h203e :  // <0091> push rtna // "
// y = digit counter
// j = sum
addr == 16'hea ? 16'h1604 :  // <0094> y = 4
// :again // = 0x00eb
addr == 16'heb ? 16'hfba0 :  // <0096> getchar
addr == 16'hec ? 16'h008d :  // <0096> "
addr == 16'hed ? 16'hfc00 :  // <0096> "
addr == 16'hee ? 16'h13a0 :  // <0097> x = :hexdigits
addr == 16'hef ? 16'h00a4 :  // <0097> "
addr == 16'hf0 ? 16'h0a10 :  // <0098> i = 16
addr == 16'hf1 ? 16'hfba0 :  // <0099> call :find_in_fetch
addr == 16'hf2 ? 16'h01b2 :  // <0099> "
addr == 16'hf3 ? 16'hfc00 :  // <0099> "
addr == 16'hf4 ? 16'h0760 :  // <0100> b = -1
addr == 16'hf5 ? 16'he007 :  // <0101> br eq :fail
addr == 16'hf6 ? 16'h010a :  // <0101> "
addr == 16'hf7 ? 16'h0400 :  // <0102> b = a
addr == 16'hf8 ? 16'h0003 :  // <0103> a = j
addr == 16'hf9 ? 16'h0352 :  // <0104> a = a<<4
addr == 16'hfa ? 16'hc800 :  // <0105> j = or
addr == 16'hfb ? 16'h0f34 :  // <0105> "
addr == 16'hfc ? 16'h1360 :  // <0106> x = -1
addr == 16'hfd ? 16'hc800 :  // <0107> y = x+y
addr == 16'hfe ? 16'h1720 :  // <0107> "
addr == 16'hff ? 16'h0005 :  // <0108> a = y
addr == 16'h100 ? 16'he400 :  // <0109> bn az :again
addr == 16'h101 ? 16'h00eb :  // <0109> "
addr == 16'h102 ? 16'h0003 :  // <0110> a = j
addr == 16'h103 ? 16'h0600 :  // <0111> b = 0
addr == 16'h104 ? 16'hf808 :  // <0112> pop rtna // rtn
addr == 16'h105 ? 16'h1408 :  // <0112> pop y // "
addr == 16'h106 ? 16'h1008 :  // <0112> pop x // "
addr == 16'h107 ? 16'h0c08 :  // <0112> pop j // "
addr == 16'h108 ? 16'h0808 :  // <0112> pop i // "
addr == 16'h109 ? 16'hfc00 :  // <0112> rtn
// :fail // = 0x010a
addr == 16'h10a ? 16'h0760 :  // <0114> b = -1
addr == 16'h10b ? 16'hf808 :  // <0115> pop rtna // end_func
addr == 16'h10c ? 16'h1408 :  // <0115> pop y // "
addr == 16'h10d ? 16'h1008 :  // <0115> pop x // "
addr == 16'h10e ? 16'h0c08 :  // <0115> pop j // "
addr == 16'h10f ? 16'h0808 :  // <0115> pop i // "
addr == 16'h110 ? 16'hfc00 :  // <0115> end_func

// print a null-terminated string from packed words in program space.
// pass its word address (not its byte address) in a.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_nt // = 0x0111
addr == 16'h111 ? 16'h2002 :  // <0121> push i // func print_nt
addr == 16'h112 ? 16'h2003 :  // <0121> push j // "
addr == 16'h113 ? 16'h2004 :  // <0121> push x // "
addr == 16'h114 ? 16'h203e :  // <0121> push rtna // "
addr == 16'h115 ? 16'h0800 :  // <0122> i = a
addr == 16'h116 ? 16'h0e01 :  // <0123> j = 1
// :next_word // = 0x0117
addr == 16'h117 ? 16'hd002 :  // <0125> fetch x from i
addr == 16'h118 ? 16'h13b0 :  // <0125> "
// now i = current word address, x = data word, b = low byte mask, a = data byte.
addr == 16'h119 ? 16'h0004 :  // <0127> a = x
addr == 16'h11a ? 16'h06ff :  // <0128> b = 0xff
addr == 16'h11b ? 16'he003 :  // <0129> br and0z :done
addr == 16'h11c ? 16'h012d :  // <0129> "
addr == 16'h11d ? 16'hfba0 :  // <0130> putchar a
addr == 16'h11e ? 16'h0084 :  // <0130> "
addr == 16'h11f ? 16'hfc00 :  // <0130> "
addr == 16'h120 ? 16'h0004 :  // <0131> a = x
addr == 16'h121 ? 16'h0353 :  // <0132> a = a>>4
addr == 16'h122 ? 16'h0353 :  // <0133> a = a>>4
addr == 16'h123 ? 16'h06ff :  // <0134> b = 0xff
addr == 16'h124 ? 16'he003 :  // <0135> br and0z :done
addr == 16'h125 ? 16'h012d :  // <0135> "
addr == 16'h126 ? 16'hfba0 :  // <0136> putchar a
addr == 16'h127 ? 16'h0084 :  // <0136> "
addr == 16'h128 ? 16'hfc00 :  // <0136> "
addr == 16'h129 ? 16'hc800 :  // <0137> i = i+j
addr == 16'h12a ? 16'h0b10 :  // <0137> "
addr == 16'h12b ? 16'he00f :  // <0138> jmp :next_word
addr == 16'h12c ? 16'h0117 :  // <0138> "
// :done // = 0x012d
addr == 16'h12d ? 16'hf808 :  // <0140> pop rtna // end_func
addr == 16'h12e ? 16'h1008 :  // <0140> pop x // "
addr == 16'h12f ? 16'h0c08 :  // <0140> pop j // "
addr == 16'h130 ? 16'h0808 :  // <0140> pop i // "
addr == 16'h131 ? 16'hfc00 :  // <0140> end_func

// function library for simple integer math.

// ######## func multiply // = 0x0132
addr == 16'h132 ? 16'h2002 :  // <0004> push i // func multiply
addr == 16'h133 ? 16'h2003 :  // <0004> push j // "
addr == 16'h134 ? 16'h2004 :  // <0004> push x // "
addr == 16'h135 ? 16'h2005 :  // <0004> push y // "
// unsigned 16-bit multiplication.  a = a * b.
// it's easy to roll over the 16-bit result by passing operands whose bit widths total more than 16.
// bigger/safer/faster math can be obtained from Altera IP blocks.

addr == 16'h136 ? 16'h1000 :  // <0009> x = a
addr == 16'h137 ? 16'h1401 :  // <0010> y = b
addr == 16'h138 ? 16'h0a00 :  // <0011> i = 0
// :again // = 0x0139
addr == 16'h139 ? 16'he002 :  // <0013> br xz :done
addr == 16'h13a ? 16'h0148 :  // <0013> "
addr == 16'h13b ? 16'h0004 :  // <0014> a = x
addr == 16'h13c ? 16'h0601 :  // <0015> b = 1
addr == 16'h13d ? 16'he003 :  // <0016> br and0z :skip_add
addr == 16'h13e ? 16'h0142 :  // <0016> "
addr == 16'h13f ? 16'h0c05 :  // <0017> j = y
addr == 16'h140 ? 16'hc800 :  // <0018> i = i+j
addr == 16'h141 ? 16'h0b10 :  // <0018> "
// :skip_add // = 0x0142
addr == 16'h142 ? 16'h0004 :  // <0020> a = x
addr == 16'h143 ? 16'h1350 :  // <0021> x = a>>1
addr == 16'h144 ? 16'h0005 :  // <0022> a = y
addr == 16'h145 ? 16'h1751 :  // <0023> y = a<<1
addr == 16'h146 ? 16'he00f :  // <0024> jmp :again
addr == 16'h147 ? 16'h0139 :  // <0024> "
// :done // = 0x0148
addr == 16'h148 ? 16'h0002 :  // <0026> a = i
addr == 16'h149 ? 16'h1408 :  // <0027> pop y // end_func
addr == 16'h14a ? 16'h1008 :  // <0027> pop x // "
addr == 16'h14b ? 16'h0c08 :  // <0027> pop j // "
addr == 16'h14c ? 16'h0808 :  // <0027> pop i // "
addr == 16'h14d ? 16'hfc00 :  // <0027> end_func

// ######## func divide // = 0x014e
addr == 16'h14e ? 16'h2002 :  // <0029> push i // func divide
addr == 16'h14f ? 16'h2003 :  // <0029> push j // "
addr == 16'h150 ? 16'h2004 :  // <0029> push x // "
addr == 16'h151 ? 16'h2005 :  // <0029> push y // "
addr == 16'h152 ? 16'h2006 :  // <0029> push g6 // "
addr == 16'h153 ? 16'h2007 :  // <0029> push g7 // "
// unsigned 15-bit division.  b = a / b.  return remainder in a.
// division by zero results in zero.
// THE HIGH BIT OF A MUST BE 0!!  ALSO THE HIGH BIT OF B MUST BE 0!!
// 1 in the high bit of either operand results in infinite loop or wrong results.
// bigger/safer/faster math can be obtained from Altera IP blocks.

// degenerate cases.
addr == 16'h154 ? 16'he005 :  // <0037> br lt :zero
addr == 16'h155 ? 16'h018f :  // <0037> "
addr == 16'h156 ? 16'he000 :  // <0038> br az :zero
addr == 16'h157 ? 16'h018f :  // <0038> "
addr == 16'h158 ? 16'h1000 :  // <0039> x = a
//    g7 = x
addr == 16'h159 ? 16'h0001 :  // <0041> a = b
addr == 16'h15a ? 16'he000 :  // <0042> br az :zero
addr == 16'h15b ? 16'h018f :  // <0042> "
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
addr == 16'h15c ? 16'h0404 :  // <0058> b = x
addr == 16'h15d ? 16'h0a00 :  // <0059> i = 0
addr == 16'h15e ? 16'h0e01 :  // <0060> j = 1
// :shift_again // = 0x015f
addr == 16'h15f ? 16'he006 :  // <0062> br gt :shift_done
addr == 16'h160 ? 16'h0165 :  // <0062> "
addr == 16'h161 ? 16'h0351 :  // <0063> a = a<<1
addr == 16'h162 ? 16'h0b10 :  // <0064> i = ad1
addr == 16'h163 ? 16'he00f :  // <0065> jmp :shift_again
addr == 16'h164 ? 16'h015f :  // <0065> "
// :shift_done // = 0x0165
addr == 16'h165 ? 16'h1b50 :  // <0067> g6 = a>>1
// now operands are x / g6.  i = number of passes of long division required.
// notice i was not decremented here, so it has 1 more in it than the number of shifts required for digit parity.
// that's exactly what it needs for correctness.

// // compensate for special case where msb was 1.  then 1 more division pass is needed.
// j = y
// i = i+j
// x = g7

// long division.  g7 = quotient.
addr == 16'h166 ? 16'h1e00 :  // <0078> g7 = 0
addr == 16'h167 ? 16'h0f60 :  // <0079> j = -1
// :again // = 0x0168
addr == 16'h168 ? 16'he001 :  // <0081> br iz :done
addr == 16'h169 ? 16'h0186 :  // <0081> "
addr == 16'h16a ? 16'h0006 :  // <0082> a = g6
addr == 16'h16b ? 16'h0404 :  // <0083> b = x
addr == 16'h16c ? 16'he006 :  // <0084> br gt :result0
addr == 16'h16d ? 16'h017e :  // <0084> "
// temp does fit; output a 1.
addr == 16'h16e ? 16'h0007 :  // <0086> a = g7
addr == 16'h16f ? 16'h0351 :  // <0087> a = a<<1
addr == 16'h170 ? 16'h0601 :  // <0088> b = 1
addr == 16'h171 ? 16'hc800 :  // <0089> g7 = or
addr == 16'h172 ? 16'h1f34 :  // <0089> "
// dividend = dividend - temp
addr == 16'h173 ? 16'h0006 :  // <0091> a = g6
addr == 16'h174 ? 16'h0760 :  // <0092> b = -1
addr == 16'h175 ? 16'hc800 :  // <0093> a = xor
addr == 16'h176 ? 16'h0338 :  // <0093> "
addr == 16'h177 ? 16'h0601 :  // <0094> b = 1
addr == 16'h178 ? 16'hc800 :  // <0095> y = a+b
addr == 16'h179 ? 16'h1700 :  // <0095> "
addr == 16'h17a ? 16'hc800 :  // <0096> x = x+y
addr == 16'h17b ? 16'h1320 :  // <0096> "
addr == 16'h17c ? 16'he00f :  // <0097> jmp :next
addr == 16'h17d ? 16'h0180 :  // <0097> "
// :result0 // = 0x017e
// temp does not fit; output a 0.
addr == 16'h17e ? 16'h0007 :  // <0100> a = g7
addr == 16'h17f ? 16'h1f51 :  // <0101> g7 = a<<1
// no change to dividend.
// :next // = 0x0180
addr == 16'h180 ? 16'h0006 :  // <0104> a = g6
addr == 16'h181 ? 16'h1b50 :  // <0105> g6 = a>>1
addr == 16'h182 ? 16'hc800 :  // <0106> i = i+j
addr == 16'h183 ? 16'h0b10 :  // <0106> "
addr == 16'h184 ? 16'he00f :  // <0107> jmp :again
addr == 16'h185 ? 16'h0168 :  // <0107> "

// :done // = 0x0186
addr == 16'h186 ? 16'h0407 :  // <0110> b = g7
addr == 16'h187 ? 16'h0004 :  // <0111> a = x
addr == 16'h188 ? 16'h1c08 :  // <0112> pop g7 // rtn
addr == 16'h189 ? 16'h1808 :  // <0112> pop g6 // "
addr == 16'h18a ? 16'h1408 :  // <0112> pop y // "
addr == 16'h18b ? 16'h1008 :  // <0112> pop x // "
addr == 16'h18c ? 16'h0c08 :  // <0112> pop j // "
addr == 16'h18d ? 16'h0808 :  // <0112> pop i // "
addr == 16'h18e ? 16'hfc00 :  // <0112> rtn

// :zero // = 0x018f
addr == 16'h18f ? 16'h0600 :  // <0115> b = 0
addr == 16'h190 ? 16'h1c08 :  // <0116> pop g7 // rtn
addr == 16'h191 ? 16'h1808 :  // <0116> pop g6 // "
addr == 16'h192 ? 16'h1408 :  // <0116> pop y // "
addr == 16'h193 ? 16'h1008 :  // <0116> pop x // "
addr == 16'h194 ? 16'h0c08 :  // <0116> pop j // "
addr == 16'h195 ? 16'h0808 :  // <0116> pop i // "
addr == 16'h196 ? 16'hfc00 :  // <0116> rtn
addr == 16'h197 ? 16'h1c08 :  // <0117> pop g7 // end_func
addr == 16'h198 ? 16'h1808 :  // <0117> pop g6 // "
addr == 16'h199 ? 16'h1408 :  // <0117> pop y // "
addr == 16'h19a ? 16'h1008 :  // <0117> pop x // "
addr == 16'h19b ? 16'h0c08 :  // <0117> pop j // "
addr == 16'h19c ? 16'h0808 :  // <0117> pop i // "
addr == 16'h19d ? 16'hfc00 :  // <0117> end_func


// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// ######## func fetch_byte // = 0x019e
addr == 16'h19e ? 16'h0601 :  // <0005> b = 1
addr == 16'h19f ? 16'he003 :  // <0006> br and0z :pick_byte_even
addr == 16'h1a0 ? 16'h01a9 :  // <0006> "
addr == 16'h1a1 ? 16'h0350 :  // <0007> a = a>>1
addr == 16'h1a2 ? 16'h0404 :  // <0008> b = x
addr == 16'h1a3 ? 16'hc800 :  // <0009> fetch a from a+b
addr == 16'h1a4 ? 16'hd300 :  // <0009> "
addr == 16'h1a5 ? 16'h03b0 :  // <0009> "
addr == 16'h1a6 ? 16'h0353 :  // <0010> a = a>>4
addr == 16'h1a7 ? 16'h0353 :  // <0011> a = a>>4
addr == 16'h1a8 ? 16'hfc00 :  // <0012> rtn
// :pick_byte_even // = 0x01a9
addr == 16'h1a9 ? 16'h0350 :  // <0014> a = a>>1
addr == 16'h1aa ? 16'h0404 :  // <0015> b = x
addr == 16'h1ab ? 16'hc800 :  // <0016> fetch a from a+b
addr == 16'h1ac ? 16'hd300 :  // <0016> "
addr == 16'h1ad ? 16'h03b0 :  // <0016> "
addr == 16'h1ae ? 16'h06ff :  // <0017> b = 0xff
addr == 16'h1af ? 16'hc800 :  // <0018> a = and
addr == 16'h1b0 ? 16'h0330 :  // <0018> "
addr == 16'h1b1 ? 16'hfc00 :  // <0019> end_func

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// ######## func find_in_fetch // = 0x01b2
addr == 16'h1b2 ? 16'h2002 :  // <0027> push i // func find_in_fetch
addr == 16'h1b3 ? 16'h2003 :  // <0027> push j // "
addr == 16'h1b4 ? 16'h2005 :  // <0027> push y // "
addr == 16'h1b5 ? 16'h203e :  // <0027> push rtna // "
addr == 16'h1b6 ? 16'h1400 :  // <0028> y = a
addr == 16'h1b7 ? 16'h0f60 :  // <0029> j = -1
// :again // = 0x01b8
addr == 16'h1b8 ? 16'he001 :  // <0031> br iz :fail
addr == 16'h1b9 ? 16'h01c8 :  // <0031> "
addr == 16'h1ba ? 16'h0b10 :  // <0032> i = ad1
addr == 16'h1bb ? 16'h0002 :  // <0033> a = i
addr == 16'h1bc ? 16'hfba0 :  // <0034> call :fetch_byte
addr == 16'h1bd ? 16'h019e :  // <0034> "
addr == 16'h1be ? 16'hfc00 :  // <0034> "
addr == 16'h1bf ? 16'h0405 :  // <0035> b = y
addr == 16'h1c0 ? 16'he407 :  // <0036> bn eq :again
addr == 16'h1c1 ? 16'h01b8 :  // <0036> "
// :found // = 0x01c2
addr == 16'h1c2 ? 16'h0002 :  // <0038> a = i
addr == 16'h1c3 ? 16'hf808 :  // <0039> pop rtna // rtn
addr == 16'h1c4 ? 16'h1408 :  // <0039> pop y // "
addr == 16'h1c5 ? 16'h0c08 :  // <0039> pop j // "
addr == 16'h1c6 ? 16'h0808 :  // <0039> pop i // "
addr == 16'h1c7 ? 16'hfc00 :  // <0039> rtn
// :fail // = 0x01c8
addr == 16'h1c8 ? 16'h0360 :  // <0041> a = -1
addr == 16'h1c9 ? 16'hf808 :  // <0042> pop rtna // end_func
addr == 16'h1ca ? 16'h1408 :  // <0042> pop y // "
addr == 16'h1cb ? 16'h0c08 :  // <0042> pop j // "
addr == 16'h1cc ? 16'h0808 :  // <0042> pop i // "
addr == 16'h1cd ? 16'hfc00 :  // <0042> end_func


// routine waits a number of milliseconds given in a.
// ######## func spinwait // = 0x01ce
addr == 16'h1ce ? 16'h2004 :  // <0002> push x // func spinwait
addr == 16'h1cf ? 16'h2005 :  // <0002> push y // "
//patch
//rtn
addr == 16'h1d0 ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x01d1
addr == 16'h1d1 ? 16'h13a0 :  // <0007> x = 16666
addr == 16'h1d2 ? 16'h411a :  // <0007> "
addr == 16'h1d3 ? 16'h1760 :  // <0008> y = -1
addr == 16'h1d4 ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x01d5
// use of the ad2 name overrides auto-nop here.
addr == 16'h1d5 ? 16'h1320 :  // <0012> x = ad2
addr == 16'h1d6 ? 16'he402 :  // <0013> bn xz :spinwait_inner
addr == 16'h1d7 ? 16'h01d5 :  // <0013> "
addr == 16'h1d8 ? 16'hc800 :  // <0014> a = a+b
addr == 16'h1d9 ? 16'h0300 :  // <0014> "
addr == 16'h1da ? 16'he400 :  // <0015> bn az :spinwait_outer
addr == 16'h1db ? 16'h01d1 :  // <0015> "
addr == 16'h1dc ? 16'h1408 :  // <0016> pop y // end_func
addr == 16'h1dd ? 16'h1008 :  // <0016> pop x // "
addr == 16'h1de ? 16'hfc00 :  // <0016> end_func



// string resources
// :boot_msg // = 0x01df
// "TGT\r\n\x0"
addr == 16'h1df ? 16'h4754 :  // <0184> GT
addr == 16'h1e0 ? 16'h0d54 :  // <0184>  T
addr == 16'h1e1 ? 16'h000a :  // <0184>   

// #########################################################################
// :main // = 0x01e2
addr == 16'h1e2 ? 16'h03a0 :  // <0188> a = :boot_msg
addr == 16'h1e3 ? 16'h01df :  // <0188> "
addr == 16'h1e4 ? 16'hfba0 :  // <0189> call :print_nt
addr == 16'h1e5 ? 16'h0111 :  // <0189> "
addr == 16'h1e6 ? 16'hfc00 :  // <0189> "

// clear the first 64k of RAM.
addr == 16'h1e7 ? 16'h4a00 :  // <0192> av_ad_hi = 0
addr == 16'h1e8 ? 16'h0200 :  // <0193> a = 0
addr == 16'h1e9 ? 16'h0602 :  // <0194> b = 2
// :clear_next_word // = 0x01ea
addr == 16'h1ea ? 16'h4c00 :  // <0196> av_ad_lo = a
addr == 16'h1eb ? 16'h4200 :  // <0197> av_write_data = 0
addr == 16'h1ec ? 16'h0300 :  // <0198> a = ad0
addr == 16'h1ed ? 16'he400 :  // <0199> bn az :clear_next_word
addr == 16'h1ee ? 16'h01ea :  // <0199> "

// init RAM variables.
addr == 16'h1ef ? 16'h4a00 :  // <0202> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h1f0 ? 16'h4e08 :  // <0202> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 8
addr == 16'h1f1 ? 16'h4360 :  // <0202> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h1f2 ? 16'h4a00 :  // <0203> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_hi = 0
addr == 16'h1f3 ? 16'h4e0a :  // <0203> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_lo = 10
addr == 16'h1f4 ? 16'h4202 :  // <0203> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_write_data = 2

// init fuel injection.
addr == 16'h1f5 ? 16'h6fa0 :  // <0206> ign_timeout_len_20us = 0xfffc
addr == 16'h1f6 ? 16'hfffc :  // <0206> "
addr == 16'h1f7 ? 16'h6ba0 :  // <0207> efi_len_us = 3000
addr == 16'h1f8 ? 16'h0bb8 :  // <0207> "
addr == 16'h1f9 ? 16'hfba0 :  // <0208> call :set_engine_stopped
addr == 16'h1fa ? 16'h0227 :  // <0208> "
addr == 16'h1fb ? 16'hfc00 :  // <0208> "

// power up FTDI USB board, and init any other special board control functions.
addr == 16'h1fc ? 16'h5e80 :  // <0211> board_ctrl = $ftdi_power_mask
addr == 16'h1fd ? 16'hfba0 :  // <0212> call :postpone_comm_restart
addr == 16'h1fe ? 16'h0411 :  // <0212> "
addr == 16'h1ff ? 16'hfc00 :  // <0212> "

// check initial state of power management circuits.
// if power is lost or ignition switch is off already, open relay & abort run.
// that's important because then the event controller booted up too late to
// see edges on those 2 signals.  regular system would never shut itself down.
// this setup is the last thing done prior to the event handler loop.
addr == 16'h200 ? 16'h6600 :  // <0219> power_duty = $power_duty_closing
addr == 16'h201 ? 16'h0019 :  // <0220> a = power_duty
addr == 16'h202 ? 16'h06c0 :  // <0221> b = ($power_lost_mask | $ign_switch_off_mask)
addr == 16'h203 ? 16'he003 :  // <0222> br and0z :skip_power_lost
addr == 16'h204 ? 16'h020a :  // <0222> "
addr == 16'h205 ? 16'h6632 :  // <0223> power_duty = $power_duty_opening
addr == 16'h206 ? 16'h5ba0 :  // <0224> error_halt_code $err_power_lost_at_boot // leds = 0xfffb
addr == 16'h207 ? 16'hfffb :  // <0224> "
addr == 16'h208 ? 16'he00f :  // <0224> error_halt_code $err_power_lost_at_boot
addr == 16'h209 ? 16'h0208 :  // <0224> "
// :skip_power_lost // = 0x020a

// start handling events.
addr == 16'h20a ? 16'h2ba0 :  // <0228> soft_event = $event_controller_reset_mask
addr == 16'h20b ? 16'h8000 :  // <0228> "
addr == 16'h20c ? 16'h2a00 :  // <0229> soft_event = 0
addr == 16'h20d ? 16'h37a0 :  // <0230> mstimer0 = 1000
addr == 16'h20e ? 16'h03e8 :  // <0230> "
addr == 16'h20f ? 16'he00f :  // <0231> jmp :poll_events
addr == 16'h210 ? 16'h0077 :  // <0231> "

// event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.
// event 0 not used in this app anyway.
// :event_table // = 0x0211
addr == 16'h211 ? 16'h0077 :  // <0236> ([label :poll_events])
addr == 16'h212 ? 16'h0373 :  // <0237> ([label :power_lost_handler])
addr == 16'h213 ? 16'h023d :  // <0238> ([label :ign_captured_handler])
addr == 16'h214 ? 16'h03a2 :  // <0239> ([label :puff1_done_handler])
addr == 16'h215 ? 16'h0283 :  // <0240> ([label :ustimer0_handler])
addr == 16'h216 ? 16'h0285 :  // <0241> ([label :spi_done_handler])
addr == 16'h217 ? 16'h02b9 :  // <0242> ([label :mstimer0_handler])
addr == 16'h218 ? 16'h02e4 :  // <0243> ([label :mstimer1_handler])
addr == 16'h219 ? 16'h0302 :  // <0244> ([label :uart_rx_handler])
addr == 16'h21a ? 16'h0312 :  // <0245> ([label :uart_rx_overflow_handler])
addr == 16'h21b ? 16'h0318 :  // <0246> ([label :uart_tx_overflow_handler])
addr == 16'h21c ? 16'h031e :  // <0247> ([label :key0_handler])
addr == 16'h21d ? 16'h0328 :  // <0248> ([label :key1_handler])
addr == 16'h21e ? 16'h0385 :  // <0249> ([label :ign_switch_off_handler])
addr == 16'h21f ? 16'h0398 :  // <0250> ([label :ign_switch_on_handler])
addr == 16'h220 ? 16'h0332 :  // <0251> ([label :softevent3_handler])
addr == 16'h221 ? 16'h0334 :  // <0252> ([label :softevent2_handler])
addr == 16'h222 ? 16'h0336 :  // <0253> ([label :softevent1_handler])
addr == 16'h223 ? 16'h0338 :  // <0254> ([label :softevent0_handler])

// #########################################################################

// :engine_stopped_msg // = 0x0224
// "ESTP\x0"
addr == 16'h224 ? 16'h5345 :  // <0259> SE
addr == 16'h225 ? 16'h5054 :  // <0259> PT
addr == 16'h226 ? 16'h0000 :  // <0259>   

// ######## func set_engine_stopped // = 0x0227
addr == 16'h227 ? 16'h203e :  // <0261> push rtna // func set_engine_stopped
addr == 16'h228 ? 16'h4a00 :  // <0262> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h229 ? 16'h4e32 :  // <0262> ram $ram_rpm_valid = 0 // av_ad_lo = 50
addr == 16'h22a ? 16'h4200 :  // <0262> ram $ram_rpm_valid = 0 // av_write_data = 0
addr == 16'h22b ? 16'h4a00 :  // <0263> ram $ram_ign_history_idx = 0 // av_ad_hi = 0
addr == 16'h22c ? 16'h4e0c :  // <0263> ram $ram_ign_history_idx = 0 // av_ad_lo = 12
addr == 16'h22d ? 16'h4200 :  // <0263> ram $ram_ign_history_idx = 0 // av_write_data = 0
// for startup, look for RPM between 50 and 1160
addr == 16'h22e ? 16'h4a00 :  // <0265> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_hi = 0
addr == 16'h22f ? 16'h4e34 :  // <0265> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_lo = 52
addr == 16'h230 ? 16'h43a0 :  // <0265> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_write_data = 603
addr == 16'h231 ? 16'h025b :  // <0265> "
addr == 16'h232 ? 16'h4a00 :  // <0266> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h233 ? 16'h4e36 :  // <0266> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 54
addr == 16'h234 ? 16'h43a0 :  // <0266> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h235 ? 16'h36b0 :  // <0266> "

addr == 16'h236 ? 16'h03a0 :  // <0268> a = :engine_stopped_msg
addr == 16'h237 ? 16'h0224 :  // <0268> "
addr == 16'h238 ? 16'hfba0 :  // <0269> call :set_text_flag
addr == 16'h239 ? 16'h043a :  // <0269> "
addr == 16'h23a ? 16'hfc00 :  // <0269> "
addr == 16'h23b ? 16'hf808 :  // <0270> pop rtna // end_func
addr == 16'h23c ? 16'hfc00 :  // <0270> end_func

// func wrap_history_idx
// :again
// b = $ign_history_len
// br lt :done
// b = ([negate $ign_history_len])
// a = a+b
// jmp :again
// :done
// end_func

// ######## event ign_captured_handler // = 0x023d
// discard outlier time.
addr == 16'h23d ? 16'h001c :  // <0284> a = ign_capture_jf
addr == 16'h23e ? 16'h4a00 :  // <0285> ram b = $ram_ign_fastest_jf // av_ad_hi = 0
addr == 16'h23f ? 16'h4e34 :  // <0285> ram b = $ram_ign_fastest_jf // av_ad_lo = 52
addr == 16'h240 ? 16'h0410 :  // <0285> ram b = $ram_ign_fastest_jf // b = av_write_data // start read cycle
addr == 16'h241 ? 16'h0411 :  // <0285> ram b = $ram_ign_fastest_jf // b = av_read_data // finish read cycle
addr == 16'h242 ? 16'he005 :  // <0286> br lt :done
addr == 16'h243 ? 16'h0310 :  // <0286> "
addr == 16'h244 ? 16'h4a00 :  // <0287> ram b = $ram_ign_slowest_jf // av_ad_hi = 0
addr == 16'h245 ? 16'h4e36 :  // <0287> ram b = $ram_ign_slowest_jf // av_ad_lo = 54
addr == 16'h246 ? 16'h0410 :  // <0287> ram b = $ram_ign_slowest_jf // b = av_write_data // start read cycle
addr == 16'h247 ? 16'h0411 :  // <0287> ram b = $ram_ign_slowest_jf // b = av_read_data // finish read cycle
addr == 16'h248 ? 16'he006 :  // <0288> br gt :done
addr == 16'h249 ? 16'h0310 :  // <0288> "

// increment buffer index and memorize time.
addr == 16'h24a ? 16'h4a00 :  // <0291> ram a = $ram_ign_history_idx // av_ad_hi = 0
addr == 16'h24b ? 16'h4e0c :  // <0291> ram a = $ram_ign_history_idx // av_ad_lo = 12
addr == 16'h24c ? 16'h0010 :  // <0291> ram a = $ram_ign_history_idx // a = av_write_data // start read cycle
addr == 16'h24d ? 16'h0011 :  // <0291> ram a = $ram_ign_history_idx // a = av_read_data // finish read cycle
addr == 16'h24e ? 16'h0601 :  // <0292> b = 1
addr == 16'h24f ? 16'hc800 :  // <0293> a = a+b
addr == 16'h250 ? 16'h0300 :  // <0293> "
addr == 16'h251 ? 16'h060f :  // <0294> b = $ign_history_idx_mask
addr == 16'h252 ? 16'hc800 :  // <0295> a = and
addr == 16'h253 ? 16'h0330 :  // <0295> "
addr == 16'h254 ? 16'he400 :  // <0296> bn az :no_wrap
addr == 16'h255 ? 16'h0259 :  // <0296> "
// history buffer is full now.  average will be valid.
addr == 16'h256 ? 16'h4a00 :  // <0298> ram $ram_rpm_valid = 1 // av_ad_hi = 0
addr == 16'h257 ? 16'h4e32 :  // <0298> ram $ram_rpm_valid = 1 // av_ad_lo = 50
addr == 16'h258 ? 16'h4201 :  // <0298> ram $ram_rpm_valid = 1 // av_write_data = 1
// :no_wrap // = 0x0259
addr == 16'h259 ? 16'h4a00 :  // <0300> ram $ram_ign_history_idx = a // av_ad_hi = 0
addr == 16'h25a ? 16'h4e0c :  // <0300> ram $ram_ign_history_idx = a // av_ad_lo = 12
addr == 16'h25b ? 16'h4000 :  // <0300> ram $ram_ign_history_idx = a // av_write_data = a
addr == 16'h25c ? 16'h2000 :  // <0301> push a // struct_write $ram_ign_history_jf a = ign_capture_jf
addr == 16'h25d ? 16'h2001 :  // <0301> push b // struct_write $ram_ign_history_jf a = ign_capture_jf
addr == 16'h25e ? 16'h0400 :  // <0301> struct_write $ram_ign_history_jf a = ign_capture_jf
addr == 16'h25f ? 16'h020e :  // <0301> struct_write $ram_ign_history_jf a = ign_capture_jf
addr == 16'h260 ? 16'h4a00 :  // <0301> struct_write $ram_ign_history_jf a = ign_capture_jf // av_ad_hi = 0
addr == 16'h261 ? 16'h4f00 :  // <0301> struct_write $ram_ign_history_jf a = ign_capture_jf // av_ad_lo = 14
addr == 16'h262 ? 16'h401c :  // <0301> struct_write $ram_ign_history_jf a = ign_capture_jf // av_write_data = ign_capture_jf
addr == 16'h263 ? 16'h0408 :  // <0301> pop b // struct_write $ram_ign_history_jf a = ign_capture_jf
addr == 16'h264 ? 16'h0008 :  // <0301> pop a // struct_write $ram_ign_history_jf a = ign_capture_jf

// ////////// compute new jiffy estimate.

// // first, total up the oldest 25% of the history
// // this doesn't work above 2^14 jf.  that's below 44 RPM.
// // reg a must be already loaded with the history index most recently written.
// // a=index, i=total, x=loop count.
// i = 0
// x = $ign_history_quarter
// y = -1
// :next_oldest
// b = 1
// a = a+b
// b = $ign_history_idx_mask
// a = and
// struct_read j = $ram_ign_history_jf a
// i = i+j
// x = x+y
// bn xz :next_oldest
// // memorize average.
// a = i
// << for {set n 0} {$n < $ign_avg_shift} {incr n} {parse3 a = a>>1 {}} >>
// ram $ram_ign_oldest_avg_jf = a

// average entire history.
// b = total, i = index = loop count
addr == 16'h265 ? 16'h0600 :  // <0328> b = 0
addr == 16'h266 ? 16'h0a10 :  // <0329> i = $ign_history_len
addr == 16'h267 ? 16'h0f60 :  // <0330> j = -1
// :next_avg // = 0x0268
addr == 16'h268 ? 16'h2001 :  // <0332> push b // struct_read a = $ram_ign_history_jf i
addr == 16'h269 ? 16'h0402 :  // <0332> struct_read a = $ram_ign_history_jf i
addr == 16'h26a ? 16'h020e :  // <0332> struct_read a = $ram_ign_history_jf i
addr == 16'h26b ? 16'h4a00 :  // <0332> struct_read a = $ram_ign_history_jf i // av_ad_hi = 0
addr == 16'h26c ? 16'h4f00 :  // <0332> struct_read a = $ram_ign_history_jf i // av_ad_lo = 14
addr == 16'h26d ? 16'h0010 :  // <0332> struct_read a = $ram_ign_history_jf i // a = av_write_data
addr == 16'h26e ? 16'h0011 :  // <0332> struct_read a = $ram_ign_history_jf i // a = av_read_data
addr == 16'h26f ? 16'h0408 :  // <0332> pop b // struct_read a = $ram_ign_history_jf i
addr == 16'h270 ? 16'h0353 :  // <0333> a = a>>$ign_history_idx_bits
addr == 16'h271 ? 16'hc800 :  // <0334> b = a+b
addr == 16'h272 ? 16'h0700 :  // <0334> "
addr == 16'h273 ? 16'hc800 :  // <0335> i = i+j
addr == 16'h274 ? 16'h0b10 :  // <0335> "
addr == 16'h275 ? 16'he401 :  // <0336> bn iz :next_avg
addr == 16'h276 ? 16'h0268 :  // <0336> "
addr == 16'h277 ? 16'h4a00 :  // <0337> ram $ram_ign_avg_jf = b // av_ad_hi = 0
addr == 16'h278 ? 16'h4e2e :  // <0337> ram $ram_ign_avg_jf = b // av_ad_lo = 46
addr == 16'h279 ? 16'h4001 :  // <0337> ram $ram_ign_avg_jf = b // av_write_data = b

// convert jiffies b to new RPM estimate.
addr == 16'h27a ? 16'h0001 :  // <0340> a = b
addr == 16'h27b ? 16'hfba0 :  // <0341> call :jf_to_rpm
addr == 16'h27c ? 16'h0477 :  // <0341> "
addr == 16'h27d ? 16'hfc00 :  // <0341> "
addr == 16'h27e ? 16'h4a00 :  // <0342> ram $ram_avg_rpm = a // av_ad_hi = 0
addr == 16'h27f ? 16'h4e30 :  // <0342> ram $ram_avg_rpm = a // av_ad_lo = 48
addr == 16'h280 ? 16'h4000 :  // <0342> ram $ram_avg_rpm = a // av_write_data = a

// :done // = 0x0281
addr == 16'h281 ? 16'he00f :  // <0345> end_event
addr == 16'h282 ? 16'h0077 :  // <0345> "

// ######## event ustimer0_handler // = 0x0283
addr == 16'h283 ? 16'he00f :  // <0348> end_event
addr == 16'h284 ? 16'h0077 :  // <0348> "

// ######## event spi_done_handler // = 0x0285
// discard-counter in RAM.
addr == 16'h285 ? 16'h4a00 :  // <0352> ram a = $ram_daq_discard_cnt // av_ad_hi = 0
addr == 16'h286 ? 16'h4e06 :  // <0352> ram a = $ram_daq_discard_cnt // av_ad_lo = 6
addr == 16'h287 ? 16'h0010 :  // <0352> ram a = $ram_daq_discard_cnt // a = av_write_data // start read cycle
addr == 16'h288 ? 16'h0011 :  // <0352> ram a = $ram_daq_discard_cnt // a = av_read_data // finish read cycle
addr == 16'h289 ? 16'he000 :  // <0353> br az :report
addr == 16'h28a ? 16'h0297 :  // <0353> "
addr == 16'h28b ? 16'h0760 :  // <0354> b = -1
addr == 16'h28c ? 16'hc800 :  // <0355> a = a+b
addr == 16'h28d ? 16'h0300 :  // <0355> "
addr == 16'h28e ? 16'h4a00 :  // <0356> ram $ram_daq_discard_cnt = a // av_ad_hi = 0
addr == 16'h28f ? 16'h4e06 :  // <0356> ram $ram_daq_discard_cnt = a // av_ad_lo = 6
addr == 16'h290 ? 16'h4000 :  // <0356> ram $ram_daq_discard_cnt = a // av_write_data = a
addr == 16'h291 ? 16'h0207 :  // <0357> a = $anmux_adc_channel
addr == 16'h292 ? 16'hfba0 :  // <0358> call :begin_adc_conversion
addr == 16'h293 ? 16'h036c :  // <0358> "
addr == 16'h294 ? 16'hfc00 :  // <0358> "
addr == 16'h295 ? 16'he00f :  // <0359> event_return
addr == 16'h296 ? 16'h0077 :  // <0359> "

// report ADC reading.
// :report // = 0x0297
addr == 16'h297 ? 16'h000f :  // <0363> a = spi_data
addr == 16'h298 ? 16'hfba0 :  // <0364> call :put4x
addr == 16'h299 ? 16'h00ac :  // <0364> "
addr == 16'h29a ? 16'hfc00 :  // <0364> "

// decrement anmux channel & start waiting again.
addr == 16'h29b ? 16'hfba0 :  // <0367> call :anmux_get_chn
addr == 16'h29c ? 16'h009f :  // <0367> "
addr == 16'h29d ? 16'hfc00 :  // <0367> "
addr == 16'h29e ? 16'he000 :  // <0368> br az :all_done
addr == 16'h29f ? 16'h02a9 :  // <0368> "
addr == 16'h2a0 ? 16'h0760 :  // <0369> b = -1
addr == 16'h2a1 ? 16'hc800 :  // <0370> a = a+b
addr == 16'h2a2 ? 16'h0300 :  // <0370> "
addr == 16'h2a3 ? 16'hfba0 :  // <0371> call :anmux_set_chn
addr == 16'h2a4 ? 16'h009b :  // <0371> "
addr == 16'h2a5 ? 16'hfc00 :  // <0371> "
addr == 16'h2a6 ? 16'h3a05 :  // <0372> mstimer1 = $anmux_settle_ms
addr == 16'h2a7 ? 16'he00f :  // <0373> event_return
addr == 16'h2a8 ? 16'h0077 :  // <0373> "

// end of daq pass.
// :all_done // = 0x02a9
addr == 16'h2a9 ? 16'hfba0 :  // <0377> call :report_text_flags
addr == 16'h2aa ? 16'h0450 :  // <0377> "
addr == 16'h2ab ? 16'hfc00 :  // <0377> "
addr == 16'h2ac ? 16'h020d :  // <0378> a = 13 // puteol
addr == 16'h2ad ? 16'hfba0 :  // <0378> puteol
addr == 16'h2ae ? 16'h0084 :  // <0378> "
addr == 16'h2af ? 16'hfc00 :  // <0378> "
addr == 16'h2b0 ? 16'h020a :  // <0378> a = 10 // puteol
addr == 16'h2b1 ? 16'hfba0 :  // <0378> puteol
addr == 16'h2b2 ? 16'h0084 :  // <0378> "
addr == 16'h2b3 ? 16'hfc00 :  // <0378> "
addr == 16'h2b4 ? 16'h4a00 :  // <0379> ram $ram_dial_setting = spi_data // av_ad_hi = 0
addr == 16'h2b5 ? 16'h4e3e :  // <0379> ram $ram_dial_setting = spi_data // av_ad_lo = 62
addr == 16'h2b6 ? 16'h400f :  // <0379> ram $ram_dial_setting = spi_data // av_write_data = spi_data
addr == 16'h2b7 ? 16'he00f :  // <0380> end_event
addr == 16'h2b8 ? 16'h0077 :  // <0380> "

// ######## event mstimer0_handler // = 0x02b9
// unified 1-second periodic timer for all low-resolution tasks.

// start timer again.
addr == 16'h2b9 ? 16'h37a0 :  // <0386> mstimer0 = 1000
addr == 16'h2ba ? 16'h03e8 :  // <0386> "

// realtime counters in RAM.
addr == 16'h2bb ? 16'h4a00 :  // <0389> ram a = $ram_seconds_cnt // av_ad_hi = 0
addr == 16'h2bc ? 16'h4e3a :  // <0389> ram a = $ram_seconds_cnt // av_ad_lo = 58
addr == 16'h2bd ? 16'h0010 :  // <0389> ram a = $ram_seconds_cnt // a = av_write_data // start read cycle
addr == 16'h2be ? 16'h0011 :  // <0389> ram a = $ram_seconds_cnt // a = av_read_data // finish read cycle
addr == 16'h2bf ? 16'h0601 :  // <0390> b = 1
addr == 16'h2c0 ? 16'hc800 :  // <0391> a = a+b
addr == 16'h2c1 ? 16'h0300 :  // <0391> "
addr == 16'h2c2 ? 16'h063c :  // <0392> b = 60
addr == 16'h2c3 ? 16'he407 :  // <0393> bn eq :same_minute
addr == 16'h2c4 ? 16'h02d6 :  // <0393> "
addr == 16'h2c5 ? 16'h4a00 :  // <0394> ram $ram_seconds_cnt = 0 // av_ad_hi = 0
addr == 16'h2c6 ? 16'h4e3a :  // <0394> ram $ram_seconds_cnt = 0 // av_ad_lo = 58
addr == 16'h2c7 ? 16'h4200 :  // <0394> ram $ram_seconds_cnt = 0 // av_write_data = 0
addr == 16'h2c8 ? 16'h4a00 :  // <0395> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h2c9 ? 16'h4e38 :  // <0395> ram a = $ram_minutes_cnt // av_ad_lo = 56
addr == 16'h2ca ? 16'h0010 :  // <0395> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h2cb ? 16'h0011 :  // <0395> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h2cc ? 16'h0601 :  // <0396> b = 1
addr == 16'h2cd ? 16'h4a00 :  // <0397> ram $ram_minutes_cnt = a+b // av_ad_hi = 0
addr == 16'h2ce ? 16'h4e38 :  // <0397> ram $ram_minutes_cnt = a+b // av_ad_lo = 56
addr == 16'h2cf ? 16'hc800 :  // <0397> ram $ram_minutes_cnt = a+b // av_write_data = a+b
addr == 16'h2d0 ? 16'h4300 :  // <0397> "
addr == 16'h2d1 ? 16'hfba0 :  // <0398> call :minute_events
addr == 16'h2d2 ? 16'h03af :  // <0398> "
addr == 16'h2d3 ? 16'hfc00 :  // <0398> "
addr == 16'h2d4 ? 16'he00f :  // <0399> jmp :minutes_done
addr == 16'h2d5 ? 16'h02d9 :  // <0399> "
// :same_minute // = 0x02d6
addr == 16'h2d6 ? 16'h4a00 :  // <0401> ram $ram_seconds_cnt = a // av_ad_hi = 0
addr == 16'h2d7 ? 16'h4e3a :  // <0401> ram $ram_seconds_cnt = a // av_ad_lo = 58
addr == 16'h2d8 ? 16'h4000 :  // <0401> ram $ram_seconds_cnt = a // av_write_data = a
// :minutes_done // = 0x02d9

addr == 16'h2d9 ? 16'hfba0 :  // <0404> call :check_power_relay
addr == 16'h2da ? 16'h03b7 :  // <0404> "
addr == 16'h2db ? 16'hfc00 :  // <0404> "
addr == 16'h2dc ? 16'hfba0 :  // <0405> call :check_communication
addr == 16'h2dd ? 16'h03e6 :  // <0405> "
addr == 16'h2de ? 16'hfc00 :  // <0405> "
addr == 16'h2df ? 16'hfba0 :  // <0406> call :start_daq_pass
addr == 16'h2e0 ? 16'h0341 :  // <0406> "
addr == 16'h2e1 ? 16'hfc00 :  // <0406> "
addr == 16'h2e2 ? 16'he00f :  // <0407> end_event
addr == 16'h2e3 ? 16'h0077 :  // <0407> "

// ######## event mstimer1_handler // = 0x02e4
// start a reading from the current anmux channel.
addr == 16'h2e4 ? 16'h4a00 :  // <0411> ram $ram_daq_discard_cnt = $anmux_num_discards // av_ad_hi = 0
addr == 16'h2e5 ? 16'h4e06 :  // <0411> ram $ram_daq_discard_cnt = $anmux_num_discards // av_ad_lo = 6
addr == 16'h2e6 ? 16'h4202 :  // <0411> ram $ram_daq_discard_cnt = $anmux_num_discards // av_write_data = 2
addr == 16'h2e7 ? 16'h0220 :  // <0412> a = 32 // putasc " "
addr == 16'h2e8 ? 16'hfba0 :  // <0412> putasc " "
addr == 16'h2e9 ? 16'h0084 :  // <0412> "
addr == 16'h2ea ? 16'hfc00 :  // <0412> "
addr == 16'h2eb ? 16'h0273 :  // <0413> a = 115 // putasc "s"
addr == 16'h2ec ? 16'hfba0 :  // <0413> putasc "s"
addr == 16'h2ed ? 16'h0084 :  // <0413> "
addr == 16'h2ee ? 16'hfc00 :  // <0413> "
addr == 16'h2ef ? 16'hfba0 :  // <0414> call :anmux_get_chn
addr == 16'h2f0 ? 16'h009f :  // <0414> "
addr == 16'h2f1 ? 16'hfc00 :  // <0414> "
addr == 16'h2f2 ? 16'h0630 :  // <0415> b = 48 // asc b = "0"
addr == 16'h2f3 ? 16'hc800 :  // <0416> a = a+b // putchar a+b
addr == 16'h2f4 ? 16'h0300 :  // <0416> "
addr == 16'h2f5 ? 16'hfba0 :  // <0416> putchar a+b
addr == 16'h2f6 ? 16'h0084 :  // <0416> "
addr == 16'h2f7 ? 16'hfc00 :  // <0416> "
addr == 16'h2f8 ? 16'h023d :  // <0417> a = 61 // putasc "="
addr == 16'h2f9 ? 16'hfba0 :  // <0417> putasc "="
addr == 16'h2fa ? 16'h0084 :  // <0417> "
addr == 16'h2fb ? 16'hfc00 :  // <0417> "
addr == 16'h2fc ? 16'h0207 :  // <0418> a = $anmux_adc_channel
addr == 16'h2fd ? 16'hfba0 :  // <0419> call :begin_adc_conversion
addr == 16'h2fe ? 16'h036c :  // <0419> "
addr == 16'h2ff ? 16'hfc00 :  // <0419> "
addr == 16'h300 ? 16'he00f :  // <0420> end_event
addr == 16'h301 ? 16'h0077 :  // <0420> "

// ######## event uart_rx_handler // = 0x0302
// :again // = 0x0302
addr == 16'h302 ? 16'hfba0 :  // <0424> pollchar
addr == 16'h303 ? 16'h0093 :  // <0424> "
addr == 16'h304 ? 16'hfc00 :  // <0424> "
addr == 16'h305 ? 16'h0760 :  // <0425> b = -1
addr == 16'h306 ? 16'he007 :  // <0426> br eq :done
addr == 16'h307 ? 16'h0281 :  // <0426> "
addr == 16'h308 ? 16'h060a :  // <0427> b = 10
addr == 16'h309 ? 16'he407 :  // <0428> bn eq :skip_lf
addr == 16'h30a ? 16'h030e :  // <0428> "
addr == 16'h30b ? 16'hfba0 :  // <0429> call :postpone_comm_restart
addr == 16'h30c ? 16'h0411 :  // <0429> "
addr == 16'h30d ? 16'hfc00 :  // <0429> "
// :skip_lf // = 0x030e
addr == 16'h30e ? 16'he00f :  // <0431> jmp :again
addr == 16'h30f ? 16'h0302 :  // <0431> "
// :done // = 0x0310
addr == 16'h310 ? 16'he00f :  // <0433> end_event
addr == 16'h311 ? 16'h0077 :  // <0433> "

// ######## event uart_rx_overflow_handler // = 0x0312
addr == 16'h312 ? 16'h5ba0 :  // <0436> error_halt_code $err_rx_overflow // leds = 0xfffe
addr == 16'h313 ? 16'hfffe :  // <0436> "
addr == 16'h314 ? 16'he00f :  // <0436> error_halt_code $err_rx_overflow
addr == 16'h315 ? 16'h0314 :  // <0436> "
addr == 16'h316 ? 16'he00f :  // <0437> end_event
addr == 16'h317 ? 16'h0077 :  // <0437> "

// ######## event uart_tx_overflow_handler // = 0x0318
addr == 16'h318 ? 16'h5ba0 :  // <0440> error_halt_code $err_tx_overflow // leds = 0xfffd
addr == 16'h319 ? 16'hfffd :  // <0440> "
addr == 16'h31a ? 16'he00f :  // <0440> error_halt_code $err_tx_overflow
addr == 16'h31b ? 16'h031a :  // <0440> "
addr == 16'h31c ? 16'he00f :  // <0441> end_event
addr == 16'h31d ? 16'h0077 :  // <0441> "

// ######## event key0_handler // = 0x031e
addr == 16'h31e ? 16'h026b :  // <0444> a = 107 // putasc "k"
addr == 16'h31f ? 16'hfba0 :  // <0444> putasc "k"
addr == 16'h320 ? 16'h0084 :  // <0444> "
addr == 16'h321 ? 16'hfc00 :  // <0444> "
addr == 16'h322 ? 16'h0230 :  // <0445> a = 48 // putasc "0"
addr == 16'h323 ? 16'hfba0 :  // <0445> putasc "0"
addr == 16'h324 ? 16'h0084 :  // <0445> "
addr == 16'h325 ? 16'hfc00 :  // <0445> "
addr == 16'h326 ? 16'he00f :  // <0446> end_event
addr == 16'h327 ? 16'h0077 :  // <0446> "

// ######## event key1_handler // = 0x0328
addr == 16'h328 ? 16'h026b :  // <0449> a = 107 // putasc "k"
addr == 16'h329 ? 16'hfba0 :  // <0449> putasc "k"
addr == 16'h32a ? 16'h0084 :  // <0449> "
addr == 16'h32b ? 16'hfc00 :  // <0449> "
addr == 16'h32c ? 16'h0231 :  // <0450> a = 49 // putasc "1"
addr == 16'h32d ? 16'hfba0 :  // <0450> putasc "1"
addr == 16'h32e ? 16'h0084 :  // <0450> "
addr == 16'h32f ? 16'hfc00 :  // <0450> "
addr == 16'h330 ? 16'he00f :  // <0451> end_event
addr == 16'h331 ? 16'h0077 :  // <0451> "

// ######## event softevent3_handler // = 0x0332
addr == 16'h332 ? 16'he00f :  // <0454> end_event
addr == 16'h333 ? 16'h0077 :  // <0454> "

// ######## event softevent2_handler // = 0x0334
addr == 16'h334 ? 16'he00f :  // <0457> end_event
addr == 16'h335 ? 16'h0077 :  // <0457> "

// ######## event softevent1_handler // = 0x0336
addr == 16'h336 ? 16'he00f :  // <0460> end_event
addr == 16'h337 ? 16'h0077 :  // <0460> "

// ######## event softevent0_handler // = 0x0338
addr == 16'h338 ? 16'he00f :  // <0463> end_event
addr == 16'h339 ? 16'h0077 :  // <0463> "

// :rpm_msg // = 0x033a
// ": rpm=\x0"
addr == 16'h33a ? 16'h203a :  // <0466>  :
addr == 16'h33b ? 16'h7072 :  // <0466> pr
addr == 16'h33c ? 16'h3d6d :  // <0466> =m
addr == 16'h33d ? 16'h0000 :  // <0466>   

// :efi_len_msg // = 0x033e
// " efi=\x0"
addr == 16'h33e ? 16'h6520 :  // <0469> e 
addr == 16'h33f ? 16'h6966 :  // <0469> if
addr == 16'h340 ? 16'h003d :  // <0469>  =

// ######## func start_daq_pass // = 0x0341
addr == 16'h341 ? 16'h203e :  // <0471> push rtna // func start_daq_pass
// daq pass counter in RAM.
addr == 16'h342 ? 16'h4a00 :  // <0473> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h343 ? 16'h4e04 :  // <0473> ram a = $ram_daq_pass_cnt // av_ad_lo = 4
addr == 16'h344 ? 16'h0010 :  // <0473> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h345 ? 16'h0011 :  // <0473> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h346 ? 16'h0601 :  // <0474> b = 1
addr == 16'h347 ? 16'hc800 :  // <0475> a = a+b
addr == 16'h348 ? 16'h0300 :  // <0475> "
addr == 16'h349 ? 16'h5800 :  // <0476> leds = a
addr == 16'h34a ? 16'h4a00 :  // <0477> ram $ram_daq_pass_cnt = a // av_ad_hi = 0
addr == 16'h34b ? 16'h4e04 :  // <0477> ram $ram_daq_pass_cnt = a // av_ad_lo = 4
addr == 16'h34c ? 16'h4000 :  // <0477> ram $ram_daq_pass_cnt = a // av_write_data = a
addr == 16'h34d ? 16'hfba0 :  // <0478> call :put4x
addr == 16'h34e ? 16'h00ac :  // <0478> "
addr == 16'h34f ? 16'hfc00 :  // <0478> "

addr == 16'h350 ? 16'h03a0 :  // <0480> a = :rpm_msg
addr == 16'h351 ? 16'h033a :  // <0480> "
addr == 16'h352 ? 16'hfba0 :  // <0481> call :print_nt
addr == 16'h353 ? 16'h0111 :  // <0481> "
addr == 16'h354 ? 16'hfc00 :  // <0481> "
addr == 16'h355 ? 16'h4a00 :  // <0482> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h356 ? 16'h4e30 :  // <0482> ram a = $ram_avg_rpm // av_ad_lo = 48
addr == 16'h357 ? 16'h0010 :  // <0482> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h358 ? 16'h0011 :  // <0482> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle
addr == 16'h359 ? 16'hfba0 :  // <0483> call :put4x
addr == 16'h35a ? 16'h00ac :  // <0483> "
addr == 16'h35b ? 16'hfc00 :  // <0483> "

addr == 16'h35c ? 16'h03a0 :  // <0485> a = :efi_len_msg
addr == 16'h35d ? 16'h033e :  // <0485> "
addr == 16'h35e ? 16'hfba0 :  // <0486> call :print_nt
addr == 16'h35f ? 16'h0111 :  // <0486> "
addr == 16'h360 ? 16'hfc00 :  // <0486> "
addr == 16'h361 ? 16'h001a :  // <0487> a = efi_len_us
addr == 16'h362 ? 16'hfba0 :  // <0488> call :put4x
addr == 16'h363 ? 16'h00ac :  // <0488> "
addr == 16'h364 ? 16'hfc00 :  // <0488> "

// start to acquire & report all anmux channels.
addr == 16'h365 ? 16'h0207 :  // <0491> a = 7
addr == 16'h366 ? 16'hfba0 :  // <0492> call :anmux_set_chn
addr == 16'h367 ? 16'h009b :  // <0492> "
addr == 16'h368 ? 16'hfc00 :  // <0492> "
addr == 16'h369 ? 16'h3a05 :  // <0493> mstimer1 = $anmux_settle_ms

// // observe MCU utilization.
// a = usage_count
// call :put4x
// usage_count = 0
addr == 16'h36a ? 16'hf808 :  // <0499> pop rtna // end_func
addr == 16'h36b ? 16'hfc00 :  // <0499> end_func

// ######## func begin_adc_conversion // = 0x036c
// begin SPI transaction, specifying Nano ADC channel to take effect NEXT
// conversion after this one.  pass that in a.

addr == 16'h36c ? 16'h0352 :  // <0505> a = a<<4
addr == 16'h36d ? 16'h0352 :  // <0506> a = a<<4
addr == 16'h36e ? 16'h0351 :  // <0507> a = a<<1
addr == 16'h36f ? 16'h0351 :  // <0508> a = a<<1
addr == 16'h370 ? 16'h0351 :  // <0509> a = a<<1
addr == 16'h371 ? 16'h3c00 :  // <0510> spi_data = a
addr == 16'h372 ? 16'hfc00 :  // <0511> end_func

// ######## event power_lost_handler // = 0x0373
// at this time we have less than 2 ms of usable run time left.

// this must be an uncommanded loss of main power, because if it was commanded,
// no more events would be handled; this event handler wouldn't have a chance to run.
// immediately set the power relay PWM to full power for a few seconds,
// in case the power relay opened accidentally e.g. due to a hard pothole.
addr == 16'h373 ? 16'h6600 :  // <0520> power_duty = $power_duty_closing
addr == 16'h374 ? 16'h4a00 :  // <0521> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h375 ? 16'h4e04 :  // <0521> ram a = $ram_daq_pass_cnt // av_ad_lo = 4
addr == 16'h376 ? 16'h0010 :  // <0521> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h377 ? 16'h0011 :  // <0521> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h378 ? 16'h0602 :  // <0522> b = $relay_hold_passes
addr == 16'h379 ? 16'h4a00 :  // <0523> ram $ram_relay_hold_at_pass = a+b // av_ad_hi = 0
addr == 16'h37a ? 16'h4e0a :  // <0523> ram $ram_relay_hold_at_pass = a+b // av_ad_lo = 10
addr == 16'h37b ? 16'hc800 :  // <0523> ram $ram_relay_hold_at_pass = a+b // av_write_data = a+b
addr == 16'h37c ? 16'h4300 :  // <0523> "

// pause any non-vital power-hogging operations, to conserve power for the EEPROM write.

// save persistent data in case the power remains down e.g. due to battery disconnect.
addr == 16'h37d ? 16'hfba0 :  // <0528> call :save_persistent_data
addr == 16'h37e ? 16'h03e5 :  // <0528> "
addr == 16'h37f ? 16'hfc00 :  // <0528> "
addr == 16'h380 ? 16'he00f :  // <0529> end_event
addr == 16'h381 ? 16'h0077 :  // <0529> "

// :ign_off_msg // = 0x0382
// "IGOF\x0"
addr == 16'h382 ? 16'h4749 :  // <0532> GI
addr == 16'h383 ? 16'h464f :  // <0532> FO
addr == 16'h384 ? 16'h0000 :  // <0532>   

// ######## event ign_switch_off_handler // = 0x0385
// set power-down deadline in RAM.  this makes the system remain powered for several more minutes, for cooldown data logging.
addr == 16'h385 ? 16'h4a00 :  // <0536> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h386 ? 16'h4e38 :  // <0536> ram a = $ram_minutes_cnt // av_ad_lo = 56
addr == 16'h387 ? 16'h0010 :  // <0536> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h388 ? 16'h0011 :  // <0536> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h389 ? 16'h060a :  // <0537> b = $power_extend_minutes
addr == 16'h38a ? 16'h4a00 :  // <0538> ram $ram_power_down_at_min = a+b // av_ad_hi = 0
addr == 16'h38b ? 16'h4e08 :  // <0538> ram $ram_power_down_at_min = a+b // av_ad_lo = 8
addr == 16'h38c ? 16'hc800 :  // <0538> ram $ram_power_down_at_min = a+b // av_write_data = a+b
addr == 16'h38d ? 16'h4300 :  // <0538> "
addr == 16'h38e ? 16'h03a0 :  // <0539> a = :ign_off_msg
addr == 16'h38f ? 16'h0382 :  // <0539> "
addr == 16'h390 ? 16'hfba0 :  // <0540> call :set_text_flag
addr == 16'h391 ? 16'h043a :  // <0540> "
addr == 16'h392 ? 16'hfc00 :  // <0540> "
addr == 16'h393 ? 16'he00f :  // <0541> end_event
addr == 16'h394 ? 16'h0077 :  // <0541> "

// :ign_on_msg // = 0x0395
// "IGON\x0"
addr == 16'h395 ? 16'h4749 :  // <0544> GI
addr == 16'h396 ? 16'h4e4f :  // <0544> NO
addr == 16'h397 ? 16'h0000 :  // <0544>   

// ######## event ign_switch_on_handler // = 0x0398
addr == 16'h398 ? 16'h4a00 :  // <0547> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h399 ? 16'h4e08 :  // <0547> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 8
addr == 16'h39a ? 16'h4360 :  // <0547> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h39b ? 16'h03a0 :  // <0548> a = :ign_on_msg
addr == 16'h39c ? 16'h0395 :  // <0548> "
addr == 16'h39d ? 16'hfba0 :  // <0549> call :set_text_flag
addr == 16'h39e ? 16'h043a :  // <0549> "
addr == 16'h39f ? 16'hfc00 :  // <0549> "
addr == 16'h3a0 ? 16'he00f :  // <0550> end_event
addr == 16'h3a1 ? 16'h0077 :  // <0550> "

// ######## event puff1_done_handler // = 0x03a2
addr == 16'h3a2 ? 16'h4a00 :  // <0553> ram a = $ram_dial_setting // av_ad_hi = 0
addr == 16'h3a3 ? 16'h4e3e :  // <0553> ram a = $ram_dial_setting // av_ad_lo = 62
addr == 16'h3a4 ? 16'h0010 :  // <0553> ram a = $ram_dial_setting // a = av_write_data // start read cycle
addr == 16'h3a5 ? 16'h0011 :  // <0553> ram a = $ram_dial_setting // a = av_read_data // finish read cycle
addr == 16'h3a6 ? 16'h0351 :  // <0554> a = a<<1
addr == 16'h3a7 ? 16'h0351 :  // <0555> a = a<<1
addr == 16'h3a8 ? 16'h0351 :  // <0556> a = a<<1
addr == 16'h3a9 ? 16'he400 :  // <0557> bn az :nonzero
addr == 16'h3aa ? 16'h03ac :  // <0557> "
addr == 16'h3ab ? 16'h0201 :  // <0558> a = 1
// :nonzero // = 0x03ac
addr == 16'h3ac ? 16'h6800 :  // <0560> efi_len_us = a
addr == 16'h3ad ? 16'he00f :  // <0561> end_event
addr == 16'h3ae ? 16'h0077 :  // <0561> "

// ######## func minute_events // = 0x03af
addr == 16'h3af ? 16'h203e :  // <0563> push rtna // func minute_events
addr == 16'h3b0 ? 16'hfba0 :  // <0564> call :check_power_down
addr == 16'h3b1 ? 16'h03ca :  // <0564> "
addr == 16'h3b2 ? 16'hfc00 :  // <0564> "
addr == 16'h3b3 ? 16'hf808 :  // <0565> pop rtna // end_func
addr == 16'h3b4 ? 16'hfc00 :  // <0565> end_func

// :power_hold_msg // = 0x03b5
// "PWH\x0"
addr == 16'h3b5 ? 16'h5750 :  // <0568> WP
addr == 16'h3b6 ? 16'h0048 :  // <0568>  H

// ######## func check_power_relay // = 0x03b7
addr == 16'h3b7 ? 16'h203e :  // <0570> push rtna // func check_power_relay
addr == 16'h3b8 ? 16'h4a00 :  // <0571> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h3b9 ? 16'h4e04 :  // <0571> ram a = $ram_daq_pass_cnt // av_ad_lo = 4
addr == 16'h3ba ? 16'h0010 :  // <0571> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h3bb ? 16'h0011 :  // <0571> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h3bc ? 16'h4a00 :  // <0572> ram b = $ram_relay_hold_at_pass // av_ad_hi = 0
addr == 16'h3bd ? 16'h4e0a :  // <0572> ram b = $ram_relay_hold_at_pass // av_ad_lo = 10
addr == 16'h3be ? 16'h0410 :  // <0572> ram b = $ram_relay_hold_at_pass // b = av_write_data // start read cycle
addr == 16'h3bf ? 16'h0411 :  // <0572> ram b = $ram_relay_hold_at_pass // b = av_read_data // finish read cycle
addr == 16'h3c0 ? 16'he407 :  // <0573> bn eq :done
addr == 16'h3c1 ? 16'h03c8 :  // <0573> "
// time to begin "solenoid saver" coil power reduction by PWM.
addr == 16'h3c2 ? 16'h6619 :  // <0575> power_duty = $power_duty_holding
addr == 16'h3c3 ? 16'h03a0 :  // <0576> a = :power_hold_msg
addr == 16'h3c4 ? 16'h03b5 :  // <0576> "
addr == 16'h3c5 ? 16'hfba0 :  // <0577> call :set_text_flag
addr == 16'h3c6 ? 16'h043a :  // <0577> "
addr == 16'h3c7 ? 16'hfc00 :  // <0577> "
// :done // = 0x03c8
addr == 16'h3c8 ? 16'hf808 :  // <0579> pop rtna // end_func
addr == 16'h3c9 ? 16'hfc00 :  // <0579> end_func

// ######## func check_power_down // = 0x03ca
addr == 16'h3ca ? 16'h203e :  // <0581> push rtna // func check_power_down
// check power-down deadline in RAM.
addr == 16'h3cb ? 16'h4a00 :  // <0583> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h3cc ? 16'h4e38 :  // <0583> ram a = $ram_minutes_cnt // av_ad_lo = 56
addr == 16'h3cd ? 16'h0010 :  // <0583> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h3ce ? 16'h0011 :  // <0583> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h3cf ? 16'h4a00 :  // <0584> ram b = $ram_power_down_at_min // av_ad_hi = 0
addr == 16'h3d0 ? 16'h4e08 :  // <0584> ram b = $ram_power_down_at_min // av_ad_lo = 8
addr == 16'h3d1 ? 16'h0410 :  // <0584> ram b = $ram_power_down_at_min // b = av_write_data // start read cycle
addr == 16'h3d2 ? 16'h0411 :  // <0584> ram b = $ram_power_down_at_min // b = av_read_data // finish read cycle
addr == 16'h3d3 ? 16'he407 :  // <0585> bn eq :done
addr == 16'h3d4 ? 16'h03d8 :  // <0585> "
addr == 16'h3d5 ? 16'hfba0 :  // <0586> call :power_down
addr == 16'h3d6 ? 16'h03da :  // <0586> "
addr == 16'h3d7 ? 16'hfc00 :  // <0586> "
// :done // = 0x03d8
addr == 16'h3d8 ? 16'hf808 :  // <0588> pop rtna // end_func
addr == 16'h3d9 ? 16'hfc00 :  // <0588> end_func

// ######## func power_down // = 0x03da
addr == 16'h3da ? 16'h203e :  // <0590> push rtna // func power_down
// this function never returns.
addr == 16'h3db ? 16'hfba0 :  // <0592> call :save_persistent_data
addr == 16'h3dc ? 16'h03e5 :  // <0592> "
addr == 16'h3dd ? 16'hfc00 :  // <0592> "
addr == 16'h3de ? 16'h6632 :  // <0593> power_duty = $power_duty_opening
addr == 16'h3df ? 16'h5ba0 :  // <0594> error_halt_code $err_power_down // leds = 0xfffc
addr == 16'h3e0 ? 16'hfffc :  // <0594> "
addr == 16'h3e1 ? 16'he00f :  // <0594> error_halt_code $err_power_down
addr == 16'h3e2 ? 16'h03e1 :  // <0594> "
addr == 16'h3e3 ? 16'hf808 :  // <0595> pop rtna // end_func
addr == 16'h3e4 ? 16'hfc00 :  // <0595> end_func

// ######## func save_persistent_data // = 0x03e5
addr == 16'h3e5 ? 16'hfc00 :  // <0598> end_func

// ######## func check_communication // = 0x03e6
addr == 16'h3e6 ? 16'h203e :  // <0600> push rtna // func check_communication
addr == 16'h3e7 ? 16'h4a00 :  // <0601> ram a = $ram_ftdi_downtime_remain_sec // av_ad_hi = 0
addr == 16'h3e8 ? 16'h4e02 :  // <0601> ram a = $ram_ftdi_downtime_remain_sec // av_ad_lo = 2
addr == 16'h3e9 ? 16'h0010 :  // <0601> ram a = $ram_ftdi_downtime_remain_sec // a = av_write_data // start read cycle
addr == 16'h3ea ? 16'h0011 :  // <0601> ram a = $ram_ftdi_downtime_remain_sec // a = av_read_data // finish read cycle
addr == 16'h3eb ? 16'he000 :  // <0602> br az :skip_ftdi_powerup
addr == 16'h3ec ? 16'h03fc :  // <0602> "
addr == 16'h3ed ? 16'h0760 :  // <0603> b = -1
addr == 16'h3ee ? 16'hc800 :  // <0604> a = a+b
addr == 16'h3ef ? 16'h0300 :  // <0604> "
addr == 16'h3f0 ? 16'h4a00 :  // <0605> ram $ram_ftdi_downtime_remain_sec = a // av_ad_hi = 0
addr == 16'h3f1 ? 16'h4e02 :  // <0605> ram $ram_ftdi_downtime_remain_sec = a // av_ad_lo = 2
addr == 16'h3f2 ? 16'h4000 :  // <0605> ram $ram_ftdi_downtime_remain_sec = a // av_write_data = a
addr == 16'h3f3 ? 16'he000 :  // <0606> br az :do_power_on
addr == 16'h3f4 ? 16'h03f7 :  // <0606> "
addr == 16'h3f5 ? 16'hf808 :  // <0607> pop rtna // rtn
addr == 16'h3f6 ? 16'hfc00 :  // <0607> rtn
// :do_power_on // = 0x03f7
addr == 16'h3f7 ? 16'hfba0 :  // <0609> call :ftdi_power_on
addr == 16'h3f8 ? 16'h042e :  // <0609> "
addr == 16'h3f9 ? 16'hfc00 :  // <0609> "
addr == 16'h3fa ? 16'hf808 :  // <0610> pop rtna // rtn
addr == 16'h3fb ? 16'hfc00 :  // <0610> rtn
// :skip_ftdi_powerup // = 0x03fc

addr == 16'h3fc ? 16'h4a00 :  // <0613> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h3fd ? 16'h4e38 :  // <0613> ram a = $ram_minutes_cnt // av_ad_lo = 56
addr == 16'h3fe ? 16'h0010 :  // <0613> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h3ff ? 16'h0011 :  // <0613> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h400 ? 16'h4a00 :  // <0614> ram b = $ram_comm_restart_at_min // av_ad_hi = 0
addr == 16'h401 ? 16'h4e00 :  // <0614> ram b = $ram_comm_restart_at_min // av_ad_lo = 0
addr == 16'h402 ? 16'h0410 :  // <0614> ram b = $ram_comm_restart_at_min // b = av_write_data // start read cycle
addr == 16'h403 ? 16'h0411 :  // <0614> ram b = $ram_comm_restart_at_min // b = av_read_data // finish read cycle
addr == 16'h404 ? 16'he407 :  // <0615> bn eq :done
addr == 16'h405 ? 16'h040f :  // <0615> "
// comm restart is required.
addr == 16'h406 ? 16'hfba0 :  // <0617> call :postpone_comm_restart
addr == 16'h407 ? 16'h0411 :  // <0617> "
addr == 16'h408 ? 16'hfc00 :  // <0617> "
addr == 16'h409 ? 16'h4a00 :  // <0618> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_hi = 0
addr == 16'h40a ? 16'h4e02 :  // <0618> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_lo = 2
addr == 16'h40b ? 16'h4205 :  // <0618> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_write_data = 5
addr == 16'h40c ? 16'hfba0 :  // <0619> call :ftdi_power_off
addr == 16'h40d ? 16'h041e :  // <0619> "
addr == 16'h40e ? 16'hfc00 :  // <0619> "
// :done // = 0x040f
addr == 16'h40f ? 16'hf808 :  // <0621> pop rtna // end_func
addr == 16'h410 ? 16'hfc00 :  // <0621> end_func

// ######## func postpone_comm_restart // = 0x0411
addr == 16'h411 ? 16'h4a00 :  // <0624> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h412 ? 16'h4e38 :  // <0624> ram a = $ram_minutes_cnt // av_ad_lo = 56
addr == 16'h413 ? 16'h0010 :  // <0624> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h414 ? 16'h0011 :  // <0624> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h415 ? 16'h0602 :  // <0625> b = $comm_grace_period_min
addr == 16'h416 ? 16'h4a00 :  // <0626> ram $ram_comm_restart_at_min = a+b // av_ad_hi = 0
addr == 16'h417 ? 16'h4e00 :  // <0626> ram $ram_comm_restart_at_min = a+b // av_ad_lo = 0
addr == 16'h418 ? 16'hc800 :  // <0626> ram $ram_comm_restart_at_min = a+b // av_write_data = a+b
addr == 16'h419 ? 16'h4300 :  // <0626> "
addr == 16'h41a ? 16'hfc00 :  // <0627> end_func

// :ftdi_off_msg // = 0x041b
// "FTOF\x0"
addr == 16'h41b ? 16'h5446 :  // <0630> TF
addr == 16'h41c ? 16'h464f :  // <0630> FO
addr == 16'h41d ? 16'h0000 :  // <0630>   

// ######## func ftdi_power_off // = 0x041e
addr == 16'h41e ? 16'h203e :  // <0632> push rtna // func ftdi_power_off
addr == 16'h41f ? 16'h0017 :  // <0633> a = board_ctrl
addr == 16'h420 ? 16'h07a0 :  // <0634> b = $not_ftdi_power_mask
addr == 16'h421 ? 16'hff7f :  // <0634> "
addr == 16'h422 ? 16'hc800 :  // <0635> board_ctrl = and
addr == 16'h423 ? 16'h5f30 :  // <0635> "
addr == 16'h424 ? 16'h03a0 :  // <0636> a = :ftdi_off_msg
addr == 16'h425 ? 16'h041b :  // <0636> "
addr == 16'h426 ? 16'hfba0 :  // <0637> call :set_text_flag
addr == 16'h427 ? 16'h043a :  // <0637> "
addr == 16'h428 ? 16'hfc00 :  // <0637> "
addr == 16'h429 ? 16'hf808 :  // <0638> pop rtna // end_func
addr == 16'h42a ? 16'hfc00 :  // <0638> end_func

// :ftdi_on_msg // = 0x042b
// "FTON\x0"
addr == 16'h42b ? 16'h5446 :  // <0641> TF
addr == 16'h42c ? 16'h4e4f :  // <0641> NO
addr == 16'h42d ? 16'h0000 :  // <0641>   

// ######## func ftdi_power_on // = 0x042e
addr == 16'h42e ? 16'h203e :  // <0643> push rtna // func ftdi_power_on
addr == 16'h42f ? 16'h0017 :  // <0644> a = board_ctrl
addr == 16'h430 ? 16'h0680 :  // <0645> b = $ftdi_power_mask
addr == 16'h431 ? 16'hc800 :  // <0646> board_ctrl = or
addr == 16'h432 ? 16'h5f34 :  // <0646> "
addr == 16'h433 ? 16'h03a0 :  // <0647> a = :ftdi_on_msg
addr == 16'h434 ? 16'h042b :  // <0647> "
addr == 16'h435 ? 16'hfba0 :  // <0648> call :set_text_flag
addr == 16'h436 ? 16'h043a :  // <0648> "
addr == 16'h437 ? 16'hfc00 :  // <0648> "
addr == 16'h438 ? 16'hf808 :  // <0649> pop rtna // end_func
addr == 16'h439 ? 16'hfc00 :  // <0649> end_func

// ######## func set_text_flag // = 0x043a
addr == 16'h43a ? 16'h4a00 :  // <0652> ram b = $ram_next_tfp // av_ad_hi = 0
addr == 16'h43b ? 16'h4e50 :  // <0652> ram b = $ram_next_tfp // av_ad_lo = 80
addr == 16'h43c ? 16'h0410 :  // <0652> ram b = $ram_next_tfp // b = av_write_data // start read cycle
addr == 16'h43d ? 16'h0411 :  // <0652> ram b = $ram_next_tfp // b = av_read_data // finish read cycle
addr == 16'h43e ? 16'h2000 :  // <0653> push a // struct_write $ram_text_flag_pointers  b  =  a
addr == 16'h43f ? 16'h2001 :  // <0653> push b // struct_write $ram_text_flag_pointers  b  =  a
addr == 16'h440 ? 16'h0401 :  // <0653> struct_write $ram_text_flag_pointers  b  =  a
addr == 16'h441 ? 16'h0240 :  // <0653> struct_write $ram_text_flag_pointers  b  =  a
addr == 16'h442 ? 16'h4a00 :  // <0653> struct_write $ram_text_flag_pointers  b  =  a // av_ad_hi = 0
addr == 16'h443 ? 16'h4f00 :  // <0653> struct_write $ram_text_flag_pointers  b  =  a // av_ad_lo = 64
addr == 16'h444 ? 16'h4000 :  // <0653> struct_write $ram_text_flag_pointers  b  =  a // av_write_data = a
addr == 16'h445 ? 16'h0408 :  // <0653> pop b // struct_write $ram_text_flag_pointers  b  =  a
addr == 16'h446 ? 16'h0008 :  // <0653> pop a // struct_write $ram_text_flag_pointers  b  =  a
addr == 16'h447 ? 16'h0360 :  // <0654> a = -1
addr == 16'h448 ? 16'hc800 :  // <0655> b = a+b
addr == 16'h449 ? 16'h0700 :  // <0655> "
addr == 16'h44a ? 16'h0207 :  // <0656> a = $tfp_mask
addr == 16'h44b ? 16'h4a00 :  // <0657> ram $ram_next_tfp = and // av_ad_hi = 0
addr == 16'h44c ? 16'h4e50 :  // <0657> ram $ram_next_tfp = and // av_ad_lo = 80
addr == 16'h44d ? 16'hc800 :  // <0657> ram $ram_next_tfp = and // av_write_data = and
addr == 16'h44e ? 16'h4330 :  // <0657> "
addr == 16'h44f ? 16'hfc00 :  // <0658> end_func

// ######## func report_text_flags // = 0x0450
addr == 16'h450 ? 16'h2002 :  // <0660> push i // func report_text_flags
addr == 16'h451 ? 16'h2003 :  // <0660> push j // "
addr == 16'h452 ? 16'h203e :  // <0660> push rtna // "
addr == 16'h453 ? 16'h0a07 :  // <0661> i = ($num_text_flag_pointers - 1)
addr == 16'h454 ? 16'h0f60 :  // <0662> j = -1
// :next_ptr // = 0x0455
addr == 16'h455 ? 16'h2001 :  // <0664> push b // struct_read a = $ram_text_flag_pointers  i
addr == 16'h456 ? 16'h0402 :  // <0664> struct_read a = $ram_text_flag_pointers  i
addr == 16'h457 ? 16'h0240 :  // <0664> struct_read a = $ram_text_flag_pointers  i
addr == 16'h458 ? 16'h4a00 :  // <0664> struct_read a = $ram_text_flag_pointers  i // av_ad_hi = 0
addr == 16'h459 ? 16'h4f00 :  // <0664> struct_read a = $ram_text_flag_pointers  i // av_ad_lo = 64
addr == 16'h45a ? 16'h0010 :  // <0664> struct_read a = $ram_text_flag_pointers  i // a = av_write_data
addr == 16'h45b ? 16'h0011 :  // <0664> struct_read a = $ram_text_flag_pointers  i // a = av_read_data
addr == 16'h45c ? 16'h0408 :  // <0664> pop b // struct_read a = $ram_text_flag_pointers  i
addr == 16'h45d ? 16'he000 :  // <0665> br az :skip
addr == 16'h45e ? 16'h046f :  // <0665> "
addr == 16'h45f ? 16'hfba0 :  // <0666> call :print_nt
addr == 16'h460 ? 16'h0111 :  // <0666> "
addr == 16'h461 ? 16'hfc00 :  // <0666> "
addr == 16'h462 ? 16'h022c :  // <0667> a = 44 // putasc ","
addr == 16'h463 ? 16'hfba0 :  // <0667> putasc ","
addr == 16'h464 ? 16'h0084 :  // <0667> "
addr == 16'h465 ? 16'hfc00 :  // <0667> "
addr == 16'h466 ? 16'h2000 :  // <0668> push a // struct_write $ram_text_flag_pointers  i  =  0
addr == 16'h467 ? 16'h2001 :  // <0668> push b // struct_write $ram_text_flag_pointers  i  =  0
addr == 16'h468 ? 16'h0402 :  // <0668> struct_write $ram_text_flag_pointers  i  =  0
addr == 16'h469 ? 16'h0240 :  // <0668> struct_write $ram_text_flag_pointers  i  =  0
addr == 16'h46a ? 16'h4a00 :  // <0668> struct_write $ram_text_flag_pointers  i  =  0 // av_ad_hi = 0
addr == 16'h46b ? 16'h4f00 :  // <0668> struct_write $ram_text_flag_pointers  i  =  0 // av_ad_lo = 64
addr == 16'h46c ? 16'h4200 :  // <0668> struct_write $ram_text_flag_pointers  i  =  0 // av_write_data = 0
addr == 16'h46d ? 16'h0408 :  // <0668> pop b // struct_write $ram_text_flag_pointers  i  =  0
addr == 16'h46e ? 16'h0008 :  // <0668> pop a // struct_write $ram_text_flag_pointers  i  =  0
// :skip // = 0x046f
addr == 16'h46f ? 16'hc800 :  // <0670> i = i+j
addr == 16'h470 ? 16'h0b10 :  // <0670> "
addr == 16'h471 ? 16'he401 :  // <0671> bn iz :next_ptr
addr == 16'h472 ? 16'h0455 :  // <0671> "
addr == 16'h473 ? 16'hf808 :  // <0672> pop rtna // end_func
addr == 16'h474 ? 16'h0c08 :  // <0672> pop j // "
addr == 16'h475 ? 16'h0808 :  // <0672> pop i // "
addr == 16'h476 ? 16'hfc00 :  // <0672> end_func

// ######## func jf_to_rpm // = 0x0477
addr == 16'h477 ? 16'h203e :  // <0674> push rtna // func jf_to_rpm
// pass jiffies in a.  return rpm in a.
// resolution = 32 rpm.
addr == 16'h478 ? 16'h0400 :  // <0677> b = a
addr == 16'h479 ? 16'h03a0 :  // <0678> a = 0x5573
addr == 16'h47a ? 16'h5573 :  // <0678> "
// = 700000 >> 5
addr == 16'h47b ? 16'hfba0 :  // <0680> call :divide
addr == 16'h47c ? 16'h014e :  // <0680> "
addr == 16'h47d ? 16'hfc00 :  // <0680> "
addr == 16'h47e ? 16'h0001 :  // <0681> a = b
addr == 16'h47f ? 16'h0352 :  // <0682> a = a<<4
addr == 16'h480 ? 16'h0351 :  // <0683> a = a<<1
addr == 16'h481 ? 16'hf808 :  // <0684> pop rtna // end_func
addr == 16'h482 ? 16'hfc00 :  // <0684> end_func

        
                16'hxxxx;
        endmodule
    
