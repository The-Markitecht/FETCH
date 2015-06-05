
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

// all ignition time vars are expressed in 20us "jiffies" or "jf".
// 5000 RPM = about 140 jf between rising edges on chevy ignition white wire.
// 1000 RPM = about 700 jf
// 100  RPM = about 7000 jf
// setvar ign_history_quarter      ($ign_history_len / 4)
// setvar ign_quarter_avg_shift    ($ign_history_idx_bits - 2)
// ram_define ram_ign_oldest_avg_jf
// ram_define ram_ign_newest_avg_jf

// realtime counting.


addr == 16'h00 ? 16'he00f :  // <0157> jmp :main
addr == 16'h01 ? 16'h0201 :  // <0157> "

addr == 16'h02 ? 16'h001d :  // <0159> emit_debugger_register_table  counter
// "       a"
addr == 16'h03 ? 16'h2020 :  // <0159>   
addr == 16'h04 ? 16'h2020 :  // <0159>   
addr == 16'h05 ? 16'h2020 :  // <0159>   
addr == 16'h06 ? 16'h6120 :  // <0159> a 
// "       b"
addr == 16'h07 ? 16'h2020 :  // <0159>   
addr == 16'h08 ? 16'h2020 :  // <0159>   
addr == 16'h09 ? 16'h2020 :  // <0159>   
addr == 16'h0a ? 16'h6220 :  // <0159> b 
// "       i"
addr == 16'h0b ? 16'h2020 :  // <0159>   
addr == 16'h0c ? 16'h2020 :  // <0159>   
addr == 16'h0d ? 16'h2020 :  // <0159>   
addr == 16'h0e ? 16'h6920 :  // <0159> i 
// "       j"
addr == 16'h0f ? 16'h2020 :  // <0159>   
addr == 16'h10 ? 16'h2020 :  // <0159>   
addr == 16'h11 ? 16'h2020 :  // <0159>   
addr == 16'h12 ? 16'h6a20 :  // <0159> j 
// "       x"
addr == 16'h13 ? 16'h2020 :  // <0159>   
addr == 16'h14 ? 16'h2020 :  // <0159>   
addr == 16'h15 ? 16'h2020 :  // <0159>   
addr == 16'h16 ? 16'h7820 :  // <0159> x 
// "       y"
addr == 16'h17 ? 16'h2020 :  // <0159>   
addr == 16'h18 ? 16'h2020 :  // <0159>   
addr == 16'h19 ? 16'h2020 :  // <0159>   
addr == 16'h1a ? 16'h7920 :  // <0159> y 
// "      g6"
addr == 16'h1b ? 16'h2020 :  // <0159>   
addr == 16'h1c ? 16'h2020 :  // <0159>   
addr == 16'h1d ? 16'h2020 :  // <0159>   
addr == 16'h1e ? 16'h3667 :  // <0159> 6g
// "      g7"
addr == 16'h1f ? 16'h2020 :  // <0159>   
addr == 16'h20 ? 16'h2020 :  // <0159>   
addr == 16'h21 ? 16'h2020 :  // <0159>   
addr == 16'h22 ? 16'h3767 :  // <0159> 7g
// "//rstk  "
addr == 16'h23 ? 16'h2f2f :  // <0159> //
addr == 16'h24 ? 16'h7372 :  // <0159> sr
addr == 16'h25 ? 16'h6b74 :  // <0159> kt
addr == 16'h26 ? 16'h2020 :  // <0159>   
// "  ev_pri"
addr == 16'h27 ? 16'h2020 :  // <0159>   
addr == 16'h28 ? 16'h7665 :  // <0159> ve
addr == 16'h29 ? 16'h705f :  // <0159> p_
addr == 16'h2a ? 16'h6972 :  // <0159> ir
// "softevnt"
addr == 16'h2b ? 16'h6f73 :  // <0159> os
addr == 16'h2c ? 16'h7466 :  // <0159> tf
addr == 16'h2d ? 16'h7665 :  // <0159> ve
addr == 16'h2e ? 16'h746e :  // <0159> tn
// "   usage"
addr == 16'h2f ? 16'h2020 :  // <0159>   
addr == 16'h30 ? 16'h7520 :  // <0159> u 
addr == 16'h31 ? 16'h6173 :  // <0159> as
addr == 16'h32 ? 16'h6567 :  // <0159> eg
// "ustimer0"
addr == 16'h33 ? 16'h7375 :  // <0159> su
addr == 16'h34 ? 16'h6974 :  // <0159> it
addr == 16'h35 ? 16'h656d :  // <0159> em
addr == 16'h36 ? 16'h3072 :  // <0159> 0r
// "mstimer0"
addr == 16'h37 ? 16'h736d :  // <0159> sm
addr == 16'h38 ? 16'h6974 :  // <0159> it
addr == 16'h39 ? 16'h656d :  // <0159> em
addr == 16'h3a ? 16'h3072 :  // <0159> 0r
// "mstimer1"
addr == 16'h3b ? 16'h736d :  // <0159> sm
addr == 16'h3c ? 16'h6974 :  // <0159> it
addr == 16'h3d ? 16'h656d :  // <0159> em
addr == 16'h3e ? 16'h3172 :  // <0159> 1r
// "spi_data"
addr == 16'h3f ? 16'h7073 :  // <0159> ps
addr == 16'h40 ? 16'h5f69 :  // <0159> _i
addr == 16'h41 ? 16'h6164 :  // <0159> ad
addr == 16'h42 ? 16'h6174 :  // <0159> at
// "//avwrdt"
addr == 16'h43 ? 16'h2f2f :  // <0159> //
addr == 16'h44 ? 16'h7661 :  // <0159> va
addr == 16'h45 ? 16'h7277 :  // <0159> rw
addr == 16'h46 ? 16'h7464 :  // <0159> td
// "av_rd_dt"
addr == 16'h47 ? 16'h7661 :  // <0159> va
addr == 16'h48 ? 16'h725f :  // <0159> r_
addr == 16'h49 ? 16'h5f64 :  // <0159> _d
addr == 16'h4a ? 16'h7464 :  // <0159> td
// "av_ad_hi"
addr == 16'h4b ? 16'h7661 :  // <0159> va
addr == 16'h4c ? 16'h615f :  // <0159> a_
addr == 16'h4d ? 16'h5f64 :  // <0159> _d
addr == 16'h4e ? 16'h6968 :  // <0159> ih
// "av_ad_lo"
addr == 16'h4f ? 16'h7661 :  // <0159> va
addr == 16'h50 ? 16'h615f :  // <0159> a_
addr == 16'h51 ? 16'h5f64 :  // <0159> _d
addr == 16'h52 ? 16'h6f6c :  // <0159> ol
// "//uartdt"
addr == 16'h53 ? 16'h2f2f :  // <0159> //
addr == 16'h54 ? 16'h6175 :  // <0159> au
addr == 16'h55 ? 16'h7472 :  // <0159> tr
addr == 16'h56 ? 16'h7464 :  // <0159> td
// "uartstat"
addr == 16'h57 ? 16'h6175 :  // <0159> au
addr == 16'h58 ? 16'h7472 :  // <0159> tr
addr == 16'h59 ? 16'h7473 :  // <0159> ts
addr == 16'h5a ? 16'h7461 :  // <0159> ta
// "    leds"
addr == 16'h5b ? 16'h2020 :  // <0159>   
addr == 16'h5c ? 16'h2020 :  // <0159>   
addr == 16'h5d ? 16'h656c :  // <0159> el
addr == 16'h5e ? 16'h7364 :  // <0159> sd
// "brd_ctrl"
addr == 16'h5f ? 16'h7262 :  // <0159> rb
addr == 16'h60 ? 16'h5f64 :  // <0159> _d
addr == 16'h61 ? 16'h7463 :  // <0159> tc
addr == 16'h62 ? 16'h6c72 :  // <0159> lr
// "   anmux"
addr == 16'h63 ? 16'h2020 :  // <0159>   
addr == 16'h64 ? 16'h6120 :  // <0159> a 
addr == 16'h65 ? 16'h6d6e :  // <0159> mn
addr == 16'h66 ? 16'h7875 :  // <0159> xu
// "pwr_duty"
addr == 16'h67 ? 16'h7770 :  // <0159> wp
addr == 16'h68 ? 16'h5f72 :  // <0159> _r
addr == 16'h69 ? 16'h7564 :  // <0159> ud
addr == 16'h6a ? 16'h7974 :  // <0159> yt
// "efilenus"
addr == 16'h6b ? 16'h6665 :  // <0159> fe
addr == 16'h6c ? 16'h6c69 :  // <0159> li
addr == 16'h6d ? 16'h6e65 :  // <0159> ne
addr == 16'h6e ? 16'h7375 :  // <0159> su
// "igntmout"
addr == 16'h6f ? 16'h6769 :  // <0159> gi
addr == 16'h70 ? 16'h746e :  // <0159> tn
addr == 16'h71 ? 16'h6f6d :  // <0159> om
addr == 16'h72 ? 16'h7475 :  // <0159> tu
// "igntmcap"
addr == 16'h73 ? 16'h6769 :  // <0159> gi
addr == 16'h74 ? 16'h746e :  // <0159> tn
addr == 16'h75 ? 16'h636d :  // <0159> cm
addr == 16'h76 ? 16'h7061 :  // <0159> pa

// libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.

// event loop.  this infrastructure is assembled directly into the main program, not a func.
// first instruction of an event handler should be the 7th cycle after reading its priority from the event controller here.
// :poll_events // = 0x0077
// initialize prior to polling loop, for minimum latency.
addr == 16'h77 ? 16'h07a0 :  // <0006> b = :event_table
addr == 16'h78 ? 16'h027b :  // <0006> "
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
addr == 16'h84 ? 16'h2004 :  // <0044> push x // func putchar_fduart

addr == 16'h85 ? 16'h1000 :  // <0046> x = a

// wait for FIFO to be available.
addr == 16'h86 ? 16'h0202 :  // <0049> a = $atx_fifo_full_mask
// :pcfduart_wait_for_idle // = 0x0087
addr == 16'h87 ? 16'h0415 :  // <0051> b = fduart_status
addr == 16'h88 ? 16'he403 :  // <0052> bn and0z :pcfduart_wait_for_idle
addr == 16'h89 ? 16'h0087 :  // <0052> "

// push word to the UART.  its low byte is a character.
addr == 16'h8a ? 16'h5004 :  // <0055> fduart_data = x
addr == 16'h8b ? 16'h1008 :  // <0056> pop x // end_func
addr == 16'h8c ? 16'hfc00 :  // <0056> end_func

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// ######## func getchar_fduart // = 0x008d
// wait until FIFO is populated.
addr == 16'h8d ? 16'h0208 :  // <0062> a = $arx_fifo_empty_mask
// :wait_for_busy // = 0x008e
addr == 16'h8e ? 16'h0415 :  // <0064> b = fduart_status
addr == 16'h8f ? 16'he403 :  // <0065> bn and0z :wait_for_busy
addr == 16'h90 ? 16'h008e :  // <0065> "
addr == 16'h91 ? 16'h0014 :  // <0066> a = fduart_data
addr == 16'h92 ? 16'hfc00 :  // <0067> end_func

// returns a character in a, or -1 if none.
// ######## func pollchar_fduart // = 0x0093
// check for FIFO is populated.
addr == 16'h93 ? 16'h0208 :  // <0072> a = $arx_fifo_empty_mask
addr == 16'h94 ? 16'h0415 :  // <0073> b = fduart_status
addr == 16'h95 ? 16'he403 :  // <0074> bn and0z :none
addr == 16'h96 ? 16'h0099 :  // <0074> "
addr == 16'h97 ? 16'h0014 :  // <0075> a = fduart_data
addr == 16'h98 ? 16'hfc00 :  // <0076> rtn
// :none // = 0x0099
addr == 16'h99 ? 16'h0360 :  // <0078> a = -1
addr == 16'h9a ? 16'hfc00 :  // <0079> end_func


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
addr == 16'hba ? 16'h01c0 :  // <0063> "
addr == 16'hbb ? 16'hfc00 :  // <0063> "
addr == 16'hbc ? 16'h0000 :  // <0064> a = a // putchar a
addr == 16'hbd ? 16'hfba0 :  // <0064> putchar a
addr == 16'hbe ? 16'h0084 :  // <0064> "
addr == 16'hbf ? 16'hfc00 :  // <0064> "

addr == 16'hc0 ? 16'h0006 :  // <0066> a = g6
addr == 16'hc1 ? 16'h07a0 :  // <0067> b = 0x0F00
addr == 16'hc2 ? 16'h0f00 :  // <0067> "
addr == 16'hc3 ? 16'hc800 :  // <0068> a = and
addr == 16'hc4 ? 16'h0330 :  // <0068> "
addr == 16'hc5 ? 16'h0353 :  // <0069> a = a>>4
addr == 16'hc6 ? 16'h0353 :  // <0070> a = a>>4
addr == 16'hc7 ? 16'hfba0 :  // <0071> call fetch_byte
addr == 16'hc8 ? 16'h01c0 :  // <0071> "
addr == 16'hc9 ? 16'hfc00 :  // <0071> "
addr == 16'hca ? 16'h0000 :  // <0072> a = a // putchar a
addr == 16'hcb ? 16'hfba0 :  // <0072> putchar a
addr == 16'hcc ? 16'h0084 :  // <0072> "
addr == 16'hcd ? 16'hfc00 :  // <0072> "

addr == 16'hce ? 16'h0006 :  // <0074> a = g6
addr == 16'hcf ? 16'h06f0 :  // <0075> b = 0x00F0
addr == 16'hd0 ? 16'hc800 :  // <0076> a = and
addr == 16'hd1 ? 16'h0330 :  // <0076> "
addr == 16'hd2 ? 16'h0353 :  // <0077> a = a>>4
addr == 16'hd3 ? 16'hfba0 :  // <0078> call fetch_byte
addr == 16'hd4 ? 16'h01c0 :  // <0078> "
addr == 16'hd5 ? 16'hfc00 :  // <0078> "
addr == 16'hd6 ? 16'h0000 :  // <0079> a = a // putchar a
addr == 16'hd7 ? 16'hfba0 :  // <0079> putchar a
addr == 16'hd8 ? 16'h0084 :  // <0079> "
addr == 16'hd9 ? 16'hfc00 :  // <0079> "

addr == 16'hda ? 16'h0006 :  // <0081> a = g6
addr == 16'hdb ? 16'h060f :  // <0082> b = 0x000F
addr == 16'hdc ? 16'hc800 :  // <0083> a = and
addr == 16'hdd ? 16'h0330 :  // <0083> "
addr == 16'hde ? 16'hfba0 :  // <0084> call fetch_byte
addr == 16'hdf ? 16'h01c0 :  // <0084> "
addr == 16'he0 ? 16'hfc00 :  // <0084> "
addr == 16'he1 ? 16'h0000 :  // <0085> a = a // putchar a
addr == 16'he2 ? 16'hfba0 :  // <0085> putchar a
addr == 16'he3 ? 16'h0084 :  // <0085> "
addr == 16'he4 ? 16'hfc00 :  // <0085> "

addr == 16'he5 ? 16'hf808 :  // <0087> pop rtna // end_func
addr == 16'he6 ? 16'h1808 :  // <0087> pop g6 // "
addr == 16'he7 ? 16'h1008 :  // <0087> pop x // "
addr == 16'he8 ? 16'hfc00 :  // <0087> end_func

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// ######## func get4x // = 0x00e9
addr == 16'he9 ? 16'h2002 :  // <0091> push i // func get4x
addr == 16'hea ? 16'h2003 :  // <0091> push j // "
addr == 16'heb ? 16'h2004 :  // <0091> push x // "
addr == 16'hec ? 16'h2005 :  // <0091> push y // "
addr == 16'hed ? 16'h203e :  // <0091> push rtna // "
// y = digit counter
// j = sum
addr == 16'hee ? 16'h1604 :  // <0094> y = 4
// :again // = 0x00ef
addr == 16'hef ? 16'hfba0 :  // <0096> getchar
addr == 16'hf0 ? 16'h008d :  // <0096> "
addr == 16'hf1 ? 16'hfc00 :  // <0096> "
addr == 16'hf2 ? 16'h13a0 :  // <0097> x = :hexdigits
addr == 16'hf3 ? 16'h00a4 :  // <0097> "
addr == 16'hf4 ? 16'h0a10 :  // <0098> i = 16
addr == 16'hf5 ? 16'hfba0 :  // <0099> call :find_in_fetch
addr == 16'hf6 ? 16'h01d4 :  // <0099> "
addr == 16'hf7 ? 16'hfc00 :  // <0099> "
addr == 16'hf8 ? 16'h0760 :  // <0100> b = -1
addr == 16'hf9 ? 16'he007 :  // <0101> br eq :fail
addr == 16'hfa ? 16'h010e :  // <0101> "
addr == 16'hfb ? 16'h0400 :  // <0102> b = a
addr == 16'hfc ? 16'h0003 :  // <0103> a = j
addr == 16'hfd ? 16'h0352 :  // <0104> a = a<<4
addr == 16'hfe ? 16'hc800 :  // <0105> j = or
addr == 16'hff ? 16'h0f34 :  // <0105> "
addr == 16'h100 ? 16'h1360 :  // <0106> x = -1
addr == 16'h101 ? 16'hc800 :  // <0107> y = x+y
addr == 16'h102 ? 16'h1720 :  // <0107> "
addr == 16'h103 ? 16'h0005 :  // <0108> a = y
addr == 16'h104 ? 16'he400 :  // <0109> bn az :again
addr == 16'h105 ? 16'h00ef :  // <0109> "
addr == 16'h106 ? 16'h0003 :  // <0110> a = j
addr == 16'h107 ? 16'h0600 :  // <0111> b = 0
addr == 16'h108 ? 16'hf808 :  // <0112> pop rtna // rtn
addr == 16'h109 ? 16'h1408 :  // <0112> pop y // "
addr == 16'h10a ? 16'h1008 :  // <0112> pop x // "
addr == 16'h10b ? 16'h0c08 :  // <0112> pop j // "
addr == 16'h10c ? 16'h0808 :  // <0112> pop i // "
addr == 16'h10d ? 16'hfc00 :  // <0112> rtn
// :fail // = 0x010e
addr == 16'h10e ? 16'h0760 :  // <0114> b = -1
addr == 16'h10f ? 16'hf808 :  // <0115> pop rtna // end_func
addr == 16'h110 ? 16'h1408 :  // <0115> pop y // "
addr == 16'h111 ? 16'h1008 :  // <0115> pop x // "
addr == 16'h112 ? 16'h0c08 :  // <0115> pop j // "
addr == 16'h113 ? 16'h0808 :  // <0115> pop i // "
addr == 16'h114 ? 16'hfc00 :  // <0115> end_func


// function library for simple integer math.

// ######## func multiply // = 0x0115
addr == 16'h115 ? 16'h2002 :  // <0004> push i // func multiply
addr == 16'h116 ? 16'h2003 :  // <0004> push j // "
addr == 16'h117 ? 16'h2004 :  // <0004> push x // "
addr == 16'h118 ? 16'h2005 :  // <0004> push y // "
// 16-bit multiplication.  a = a * b.

addr == 16'h119 ? 16'h1000 :  // <0007> x = a
addr == 16'h11a ? 16'h1401 :  // <0008> y = b
addr == 16'h11b ? 16'h0a00 :  // <0009> i = 0
// :again // = 0x011c
addr == 16'h11c ? 16'he002 :  // <0011> br xz :done
addr == 16'h11d ? 16'h012b :  // <0011> "
addr == 16'h11e ? 16'h0004 :  // <0012> a = x
addr == 16'h11f ? 16'h0601 :  // <0013> b = 1
addr == 16'h120 ? 16'he003 :  // <0014> br and0z :skip_add
addr == 16'h121 ? 16'h0125 :  // <0014> "
addr == 16'h122 ? 16'h0c05 :  // <0015> j = y
addr == 16'h123 ? 16'hc800 :  // <0016> i = i+j
addr == 16'h124 ? 16'h0b10 :  // <0016> "
// :skip_add // = 0x0125
addr == 16'h125 ? 16'h0004 :  // <0018> a = x
addr == 16'h126 ? 16'h1350 :  // <0019> x = a>>1
addr == 16'h127 ? 16'h0005 :  // <0020> a = y
addr == 16'h128 ? 16'h1751 :  // <0021> y = a<<1
addr == 16'h129 ? 16'he00f :  // <0022> jmp :again
addr == 16'h12a ? 16'h011c :  // <0022> "
// :done // = 0x012b
addr == 16'h12b ? 16'h0002 :  // <0024> a = i
addr == 16'h12c ? 16'h1408 :  // <0025> pop y // end_func
addr == 16'h12d ? 16'h1008 :  // <0025> pop x // "
addr == 16'h12e ? 16'h0c08 :  // <0025> pop j // "
addr == 16'h12f ? 16'h0808 :  // <0025> pop i // "
addr == 16'h130 ? 16'hfc00 :  // <0025> end_func

// ######## func divide // = 0x0131
addr == 16'h131 ? 16'h2002 :  // <0027> push i // func divide
addr == 16'h132 ? 16'h2003 :  // <0027> push j // "
addr == 16'h133 ? 16'h2004 :  // <0027> push x // "
addr == 16'h134 ? 16'h2005 :  // <0027> push y // "
addr == 16'h135 ? 16'h2006 :  // <0027> push g6 // "
addr == 16'h136 ? 16'h2007 :  // <0027> push g7 // "
// 16-bit division.  b = a / b.  return remainder in a.
// division by zero results in zero.

// degenerate cases.
addr == 16'h137 ? 16'he005 :  // <0032> br lt :zero
addr == 16'h138 ? 16'h0170 :  // <0032> "
addr == 16'h139 ? 16'he000 :  // <0033> br az :zero
addr == 16'h13a ? 16'h0170 :  // <0033> "
addr == 16'h13b ? 16'h1000 :  // <0034> x = a
addr == 16'h13c ? 16'h0001 :  // <0035> a = b
addr == 16'h13d ? 16'he000 :  // <0036> br az :zero
addr == 16'h13e ? 16'h0170 :  // <0036> "
// now operands are x / a.

// shift "temp" divisor g6 left until it exceeds dividend, then right 1.
addr == 16'h13f ? 16'h0404 :  // <0040> b = x
addr == 16'h140 ? 16'h0a00 :  // <0041> i = 0
addr == 16'h141 ? 16'h0e01 :  // <0042> j = 1
// :shift_again // = 0x0142
addr == 16'h142 ? 16'he006 :  // <0044> br gt :shift_done
addr == 16'h143 ? 16'h0148 :  // <0044> "
addr == 16'h144 ? 16'h0351 :  // <0045> a = a<<1
addr == 16'h145 ? 16'h0b10 :  // <0046> i = ad1
addr == 16'h146 ? 16'he00f :  // <0047> jmp :shift_again
addr == 16'h147 ? 16'h0142 :  // <0047> "
// :shift_done // = 0x0148
addr == 16'h148 ? 16'h1b50 :  // <0049> g6 = a>>1
// now operands are x / g6.
// notice i was not decremented here, so it has 1 more in it than the number of shifts required for digit parity.
// that's exactly what it needs for correctness.

// long division.  g7 = quotient.
addr == 16'h149 ? 16'h1e00 :  // <0055> g7 = 0
addr == 16'h14a ? 16'h0f60 :  // <0056> j = -1
// :again // = 0x014b
addr == 16'h14b ? 16'he001 :  // <0058> br iz :done
addr == 16'h14c ? 16'h0167 :  // <0058> "
addr == 16'h14d ? 16'h0006 :  // <0059> a = g6
addr == 16'h14e ? 16'h0404 :  // <0060> b = x
addr == 16'h14f ? 16'he006 :  // <0061> br gt :result0
addr == 16'h150 ? 16'h015f :  // <0061> "
// temp does fit; output a 1.
addr == 16'h151 ? 16'h0007 :  // <0063> a = g7
addr == 16'h152 ? 16'h0351 :  // <0064> a = a<<1
addr == 16'h153 ? 16'h0601 :  // <0065> b = 1
addr == 16'h154 ? 16'hc800 :  // <0066> g7 = or
addr == 16'h155 ? 16'h1f34 :  // <0066> "
// dividend = dividend - temp
addr == 16'h156 ? 16'h0006 :  // <0068> a = g6
addr == 16'h157 ? 16'h0760 :  // <0069> b = -1
addr == 16'h158 ? 16'hc800 :  // <0070> a = xor
addr == 16'h159 ? 16'h0338 :  // <0070> "
addr == 16'h15a ? 16'h0601 :  // <0071> b = 1
addr == 16'h15b ? 16'hc800 :  // <0072> y = a+b
addr == 16'h15c ? 16'h1700 :  // <0072> "
addr == 16'h15d ? 16'hc800 :  // <0073> x = x+y
addr == 16'h15e ? 16'h1320 :  // <0073> "
// :result0 // = 0x015f
// temp does not fit; output a 0.
addr == 16'h15f ? 16'h0007 :  // <0076> a = g7
addr == 16'h160 ? 16'h1f51 :  // <0077> g7 = a<<1
// no change to dividend.
// :next // = 0x0161
addr == 16'h161 ? 16'h0006 :  // <0080> a = g6
addr == 16'h162 ? 16'h1b50 :  // <0081> g6 = a>>1
addr == 16'h163 ? 16'hc800 :  // <0082> i = i+j
addr == 16'h164 ? 16'h0b10 :  // <0082> "
addr == 16'h165 ? 16'he00f :  // <0083> jmp :again
addr == 16'h166 ? 16'h014b :  // <0083> "

// :done // = 0x0167
addr == 16'h167 ? 16'h0407 :  // <0086> b = g7
addr == 16'h168 ? 16'h0004 :  // <0087> a = x
addr == 16'h169 ? 16'h1c08 :  // <0088> pop g7 // rtn
addr == 16'h16a ? 16'h1808 :  // <0088> pop g6 // "
addr == 16'h16b ? 16'h1408 :  // <0088> pop y // "
addr == 16'h16c ? 16'h1008 :  // <0088> pop x // "
addr == 16'h16d ? 16'h0c08 :  // <0088> pop j // "
addr == 16'h16e ? 16'h0808 :  // <0088> pop i // "
addr == 16'h16f ? 16'hfc00 :  // <0088> rtn

// :zero // = 0x0170
addr == 16'h170 ? 16'h0600 :  // <0091> b = 0
addr == 16'h171 ? 16'h1c08 :  // <0092> pop g7 // rtn
addr == 16'h172 ? 16'h1808 :  // <0092> pop g6 // "
addr == 16'h173 ? 16'h1408 :  // <0092> pop y // "
addr == 16'h174 ? 16'h1008 :  // <0092> pop x // "
addr == 16'h175 ? 16'h0c08 :  // <0092> pop j // "
addr == 16'h176 ? 16'h0808 :  // <0092> pop i // "
addr == 16'h177 ? 16'hfc00 :  // <0092> rtn
addr == 16'h178 ? 16'h1c08 :  // <0093> pop g7 // end_func
addr == 16'h179 ? 16'h1808 :  // <0093> pop g6 // "
addr == 16'h17a ? 16'h1408 :  // <0093> pop y // "
addr == 16'h17b ? 16'h1008 :  // <0093> pop x // "
addr == 16'h17c ? 16'h0c08 :  // <0093> pop j // "
addr == 16'h17d ? 16'h0808 :  // <0093> pop i // "
addr == 16'h17e ? 16'hfc00 :  // <0093> end_func

// ######## func testmath // = 0x017f
addr == 16'h17f ? 16'h2002 :  // <0095> push i // func testmath
addr == 16'h180 ? 16'h2004 :  // <0095> push x // "
addr == 16'h181 ? 16'h2005 :  // <0095> push y // "
addr == 16'h182 ? 16'h203e :  // <0095> push rtna // "
addr == 16'h183 ? 16'h1000 :  // <0096> x = a
addr == 16'h184 ? 16'h1401 :  // <0097> y = b
addr == 16'h185 ? 16'h0220 :  // <0098> a = 32 // putasc " "
addr == 16'h186 ? 16'h0000 :  // <0098> a = a // putasc " "
addr == 16'h187 ? 16'hfba0 :  // <0098> putasc " "
addr == 16'h188 ? 16'h0084 :  // <0098> "
addr == 16'h189 ? 16'hfc00 :  // <0098> "
addr == 16'h18a ? 16'h0004 :  // <0099> a = x
addr == 16'h18b ? 16'hfba0 :  // <0100> call :put4x
addr == 16'h18c ? 16'h00ac :  // <0100> "
addr == 16'h18d ? 16'hfc00 :  // <0100> "
addr == 16'h18e ? 16'h022c :  // <0101> a = 44 // putasc ","
addr == 16'h18f ? 16'h0000 :  // <0101> a = a // putasc ","
addr == 16'h190 ? 16'hfba0 :  // <0101> putasc ","
addr == 16'h191 ? 16'h0084 :  // <0101> "
addr == 16'h192 ? 16'hfc00 :  // <0101> "
addr == 16'h193 ? 16'h0005 :  // <0102> a = y
addr == 16'h194 ? 16'hfba0 :  // <0103> call :put4x
addr == 16'h195 ? 16'h00ac :  // <0103> "
addr == 16'h196 ? 16'hfc00 :  // <0103> "
addr == 16'h197 ? 16'h023d :  // <0104> a = 61 // putasc "="
addr == 16'h198 ? 16'h0000 :  // <0104> a = a // putasc "="
addr == 16'h199 ? 16'hfba0 :  // <0104> putasc "="
addr == 16'h19a ? 16'h0084 :  // <0104> "
addr == 16'h19b ? 16'hfc00 :  // <0104> "
addr == 16'h19c ? 16'h0004 :  // <0105> a = x
addr == 16'h19d ? 16'h0405 :  // <0106> b = y
addr == 16'h19e ? 16'hfba0 :  // <0107> call :multiply
addr == 16'h19f ? 16'h0115 :  // <0107> "
addr == 16'h1a0 ? 16'hfc00 :  // <0107> "
addr == 16'h1a1 ? 16'hfba0 :  // <0108> call :put4x
addr == 16'h1a2 ? 16'h00ac :  // <0108> "
addr == 16'h1a3 ? 16'hfc00 :  // <0108> "
addr == 16'h1a4 ? 16'h0272 :  // <0109> a = 114 // putasc "r"
addr == 16'h1a5 ? 16'h0000 :  // <0109> a = a // putasc "r"
addr == 16'h1a6 ? 16'hfba0 :  // <0109> putasc "r"
addr == 16'h1a7 ? 16'h0084 :  // <0109> "
addr == 16'h1a8 ? 16'hfc00 :  // <0109> "
addr == 16'h1a9 ? 16'h0004 :  // <0110> a = x
addr == 16'h1aa ? 16'h0405 :  // <0111> b = y
addr == 16'h1ab ? 16'hfba0 :  // <0112> call :divide
addr == 16'h1ac ? 16'h0131 :  // <0112> "
addr == 16'h1ad ? 16'hfc00 :  // <0112> "
addr == 16'h1ae ? 16'h0801 :  // <0113> i = b
addr == 16'h1af ? 16'hfba0 :  // <0114> call :put4x
addr == 16'h1b0 ? 16'h00ac :  // <0114> "
addr == 16'h1b1 ? 16'hfc00 :  // <0114> "
addr == 16'h1b2 ? 16'h0271 :  // <0115> a = 113 // putasc "q"
addr == 16'h1b3 ? 16'h0000 :  // <0115> a = a // putasc "q"
addr == 16'h1b4 ? 16'hfba0 :  // <0115> putasc "q"
addr == 16'h1b5 ? 16'h0084 :  // <0115> "
addr == 16'h1b6 ? 16'hfc00 :  // <0115> "
addr == 16'h1b7 ? 16'h0002 :  // <0116> a = i
addr == 16'h1b8 ? 16'hfba0 :  // <0117> call :put4x
addr == 16'h1b9 ? 16'h00ac :  // <0117> "
addr == 16'h1ba ? 16'hfc00 :  // <0117> "
addr == 16'h1bb ? 16'hf808 :  // <0118> pop rtna // end_func
addr == 16'h1bc ? 16'h1408 :  // <0118> pop y // "
addr == 16'h1bd ? 16'h1008 :  // <0118> pop x // "
addr == 16'h1be ? 16'h0808 :  // <0118> pop i // "
addr == 16'h1bf ? 16'hfc00 :  // <0118> end_func

// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// ######## func fetch_byte // = 0x01c0
addr == 16'h1c0 ? 16'h0601 :  // <0005> b = 1
addr == 16'h1c1 ? 16'he003 :  // <0006> br and0z :pick_byte_even
addr == 16'h1c2 ? 16'h01cb :  // <0006> "
addr == 16'h1c3 ? 16'h0350 :  // <0007> a = a>>1
addr == 16'h1c4 ? 16'h0404 :  // <0008> b = x
addr == 16'h1c5 ? 16'hc800 :  // <0009> fetch a from a+b
addr == 16'h1c6 ? 16'hd300 :  // <0009> "
addr == 16'h1c7 ? 16'h03b0 :  // <0009> "
addr == 16'h1c8 ? 16'h0353 :  // <0010> a = a>>4
addr == 16'h1c9 ? 16'h0353 :  // <0011> a = a>>4
addr == 16'h1ca ? 16'hfc00 :  // <0012> rtn
// :pick_byte_even // = 0x01cb
addr == 16'h1cb ? 16'h0350 :  // <0014> a = a>>1
addr == 16'h1cc ? 16'h0404 :  // <0015> b = x
addr == 16'h1cd ? 16'hc800 :  // <0016> fetch a from a+b
addr == 16'h1ce ? 16'hd300 :  // <0016> "
addr == 16'h1cf ? 16'h03b0 :  // <0016> "
addr == 16'h1d0 ? 16'h06ff :  // <0017> b = 0xff
addr == 16'h1d1 ? 16'hc800 :  // <0018> a = and
addr == 16'h1d2 ? 16'h0330 :  // <0018> "
addr == 16'h1d3 ? 16'hfc00 :  // <0019> end_func

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// ######## func find_in_fetch // = 0x01d4
addr == 16'h1d4 ? 16'h2002 :  // <0027> push i // func find_in_fetch
addr == 16'h1d5 ? 16'h2003 :  // <0027> push j // "
addr == 16'h1d6 ? 16'h2005 :  // <0027> push y // "
addr == 16'h1d7 ? 16'h203e :  // <0027> push rtna // "
addr == 16'h1d8 ? 16'h1400 :  // <0028> y = a
addr == 16'h1d9 ? 16'h0f60 :  // <0029> j = -1
// :again // = 0x01da
addr == 16'h1da ? 16'he001 :  // <0031> br iz :fail
addr == 16'h1db ? 16'h01ea :  // <0031> "
addr == 16'h1dc ? 16'h0b10 :  // <0032> i = ad1
addr == 16'h1dd ? 16'h0002 :  // <0033> a = i
addr == 16'h1de ? 16'hfba0 :  // <0034> call :fetch_byte
addr == 16'h1df ? 16'h01c0 :  // <0034> "
addr == 16'h1e0 ? 16'hfc00 :  // <0034> "
addr == 16'h1e1 ? 16'h0405 :  // <0035> b = y
addr == 16'h1e2 ? 16'he407 :  // <0036> bn eq :again
addr == 16'h1e3 ? 16'h01da :  // <0036> "
// :found // = 0x01e4
addr == 16'h1e4 ? 16'h0002 :  // <0038> a = i
addr == 16'h1e5 ? 16'hf808 :  // <0039> pop rtna // rtn
addr == 16'h1e6 ? 16'h1408 :  // <0039> pop y // "
addr == 16'h1e7 ? 16'h0c08 :  // <0039> pop j // "
addr == 16'h1e8 ? 16'h0808 :  // <0039> pop i // "
addr == 16'h1e9 ? 16'hfc00 :  // <0039> rtn
// :fail // = 0x01ea
addr == 16'h1ea ? 16'h0360 :  // <0041> a = -1
addr == 16'h1eb ? 16'hf808 :  // <0042> pop rtna // end_func
addr == 16'h1ec ? 16'h1408 :  // <0042> pop y // "
addr == 16'h1ed ? 16'h0c08 :  // <0042> pop j // "
addr == 16'h1ee ? 16'h0808 :  // <0042> pop i // "
addr == 16'h1ef ? 16'hfc00 :  // <0042> end_func


// routine waits a number of milliseconds given in a.
// ######## func spinwait // = 0x01f0
addr == 16'h1f0 ? 16'h2004 :  // <0002> push x // func spinwait
addr == 16'h1f1 ? 16'h2005 :  // <0002> push y // "
//patch
//rtn
addr == 16'h1f2 ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x01f3
addr == 16'h1f3 ? 16'h13a0 :  // <0007> x = 16666
addr == 16'h1f4 ? 16'h411a :  // <0007> "
addr == 16'h1f5 ? 16'h1760 :  // <0008> y = -1
addr == 16'h1f6 ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x01f7
// use of the ad2 name overrides auto-nop here.
addr == 16'h1f7 ? 16'h1320 :  // <0012> x = ad2
addr == 16'h1f8 ? 16'he402 :  // <0013> bn xz :spinwait_inner
addr == 16'h1f9 ? 16'h01f7 :  // <0013> "
addr == 16'h1fa ? 16'hc800 :  // <0014> a = a+b
addr == 16'h1fb ? 16'h0300 :  // <0014> "
addr == 16'h1fc ? 16'he400 :  // <0015> bn az :spinwait_outer
addr == 16'h1fd ? 16'h01f3 :  // <0015> "
addr == 16'h1fe ? 16'h1408 :  // <0016> pop y // end_func
addr == 16'h1ff ? 16'h1008 :  // <0016> pop x // "
addr == 16'h200 ? 16'hfc00 :  // <0016> end_func



// #########################################################################
// :main // = 0x0201

addr == 16'h201 ? 16'h0200 :  // <0174> 
addr == 16'h202 ? 16'h0600 :  // <0174> 
addr == 16'h203 ? 16'hfba0 :  // <0174> testmath 0 0
addr == 16'h204 ? 16'h017f :  // <0174> "
addr == 16'h205 ? 16'hfc00 :  // <0174> "
addr == 16'h206 ? 16'h0200 :  // <0175> 
addr == 16'h207 ? 16'h0601 :  // <0175> 
addr == 16'h208 ? 16'hfba0 :  // <0175> testmath 0 1
addr == 16'h209 ? 16'h017f :  // <0175> "
addr == 16'h20a ? 16'hfc00 :  // <0175> "
addr == 16'h20b ? 16'h0201 :  // <0176> 
addr == 16'h20c ? 16'h0600 :  // <0176> 
addr == 16'h20d ? 16'hfba0 :  // <0176> testmath 1 0
addr == 16'h20e ? 16'h017f :  // <0176> "
addr == 16'h20f ? 16'hfc00 :  // <0176> "
addr == 16'h210 ? 16'h0201 :  // <0177> 
addr == 16'h211 ? 16'h0601 :  // <0177> 
addr == 16'h212 ? 16'hfba0 :  // <0177> testmath 1 1
addr == 16'h213 ? 16'h017f :  // <0177> "
addr == 16'h214 ? 16'hfc00 :  // <0177> "
addr == 16'h215 ? 16'h0201 :  // <0178> 
addr == 16'h216 ? 16'h0602 :  // <0178> 
addr == 16'h217 ? 16'hfba0 :  // <0178> testmath 1 2
addr == 16'h218 ? 16'h017f :  // <0178> "
addr == 16'h219 ? 16'hfc00 :  // <0178> "
addr == 16'h21a ? 16'h0202 :  // <0179> 
addr == 16'h21b ? 16'h0600 :  // <0179> 
addr == 16'h21c ? 16'hfba0 :  // <0179> testmath 2 0
addr == 16'h21d ? 16'h017f :  // <0179> "
addr == 16'h21e ? 16'hfc00 :  // <0179> "
addr == 16'h21f ? 16'h0202 :  // <0180> 
addr == 16'h220 ? 16'h0601 :  // <0180> 
addr == 16'h221 ? 16'hfba0 :  // <0180> testmath 2 1
addr == 16'h222 ? 16'h017f :  // <0180> "
addr == 16'h223 ? 16'hfc00 :  // <0180> "
addr == 16'h224 ? 16'h0202 :  // <0181> 
addr == 16'h225 ? 16'h0602 :  // <0181> 
addr == 16'h226 ? 16'hfba0 :  // <0181> testmath 2 2
addr == 16'h227 ? 16'h017f :  // <0181> "
addr == 16'h228 ? 16'hfc00 :  // <0181> "
addr == 16'h229 ? 16'h0202 :  // <0182> 
addr == 16'h22a ? 16'h0603 :  // <0182> 
addr == 16'h22b ? 16'hfba0 :  // <0182> testmath 2 3
addr == 16'h22c ? 16'h017f :  // <0182> "
addr == 16'h22d ? 16'hfc00 :  // <0182> "
addr == 16'h22e ? 16'h0202 :  // <0183> 
addr == 16'h22f ? 16'h0604 :  // <0183> 
addr == 16'h230 ? 16'hfba0 :  // <0183> testmath 2 4
addr == 16'h231 ? 16'h017f :  // <0183> "
addr == 16'h232 ? 16'hfc00 :  // <0183> "
addr == 16'h233 ? 16'h0203 :  // <0184> 
addr == 16'h234 ? 16'h0602 :  // <0184> 
addr == 16'h235 ? 16'hfba0 :  // <0184> testmath 3 2
addr == 16'h236 ? 16'h017f :  // <0184> "
addr == 16'h237 ? 16'hfc00 :  // <0184> "
addr == 16'h238 ? 16'h0204 :  // <0185> 
addr == 16'h239 ? 16'h0602 :  // <0185> 
addr == 16'h23a ? 16'hfba0 :  // <0185> testmath 4 2
addr == 16'h23b ? 16'h017f :  // <0185> "
addr == 16'h23c ? 16'hfc00 :  // <0185> "
addr == 16'h23d ? 16'h0207 :  // <0186> 
addr == 16'h23e ? 16'h0609 :  // <0186> 
addr == 16'h23f ? 16'hfba0 :  // <0186> testmath 7 9
addr == 16'h240 ? 16'h017f :  // <0186> "
addr == 16'h241 ? 16'hfc00 :  // <0186> "
addr == 16'h242 ? 16'h02c8 :  // <0187> 
addr == 16'h243 ? 16'h06c8 :  // <0187> 
addr == 16'h244 ? 16'hfba0 :  // <0187> testmath 200 200
addr == 16'h245 ? 16'h017f :  // <0187> "
addr == 16'h246 ? 16'hfc00 :  // <0187> "
addr == 16'h247 ? 16'h0207 :  // <0188> 
addr == 16'h248 ? 16'h0601 :  // <0188> 
addr == 16'h249 ? 16'hfba0 :  // <0188> testmath 7 1
addr == 16'h24a ? 16'h017f :  // <0188> "
addr == 16'h24b ? 16'hfc00 :  // <0188> "
addr == 16'h24c ? 16'h020a :  // <0189> 
addr == 16'h24d ? 16'h0605 :  // <0189> 
addr == 16'h24e ? 16'hfba0 :  // <0189> testmath 10 5
addr == 16'h24f ? 16'h017f :  // <0189> "
addr == 16'h250 ? 16'hfc00 :  // <0189> "
addr == 16'h251 ? 16'h0201 :  // <0190> 
addr == 16'h252 ? 16'h0601 :  // <0190> 
addr == 16'h253 ? 16'hfba0 :  // <0190> testmath 1 1
addr == 16'h254 ? 16'h017f :  // <0190> "
addr == 16'h255 ? 16'hfc00 :  // <0190> "
addr == 16'h256 ? 16'h0264 :  // <0191> 
addr == 16'h257 ? 16'h0605 :  // <0191> 
addr == 16'h258 ? 16'hfba0 :  // <0191> testmath 100 5
addr == 16'h259 ? 16'h017f :  // <0191> "
addr == 16'h25a ? 16'hfc00 :  // <0191> "
addr == 16'h25b ? 16'h0263 :  // <0192> 
addr == 16'h25c ? 16'h0664 :  // <0192> 
addr == 16'h25d ? 16'hfba0 :  // <0192> testmath 99 100
addr == 16'h25e ? 16'h017f :  // <0192> "
addr == 16'h25f ? 16'hfc00 :  // <0192> "
addr == 16'h260 ? 16'h03a0 :  // <0193> 
addr == 16'h261 ? 16'hfde8 :  // <0193> "
addr == 16'h262 ? 16'h07a0 :  // <0193> 
addr == 16'h263 ? 16'h1b58 :  // <0193> "
addr == 16'h264 ? 16'hfba0 :  // <0193> testmath 65000 7000
addr == 16'h265 ? 16'h017f :  // <0193> "
addr == 16'h266 ? 16'hfc00 :  // <0193> "
addr == 16'h267 ? 16'h03a0 :  // <0194> 
addr == 16'h268 ? 16'hfde8 :  // <0194> "
addr == 16'h269 ? 16'h07a0 :  // <0194> 
addr == 16'h26a ? 16'hfde8 :  // <0194> "
addr == 16'h26b ? 16'hfba0 :  // <0194> testmath 65000 65000
addr == 16'h26c ? 16'h017f :  // <0194> "
addr == 16'h26d ? 16'hfc00 :  // <0194> "
addr == 16'h26e ? 16'h03a0 :  // <0195> 
addr == 16'h26f ? 16'hab1d :  // <0195> "
addr == 16'h270 ? 16'h0601 :  // <0195> 
addr == 16'h271 ? 16'hfba0 :  // <0195> testmath 43805 1
addr == 16'h272 ? 16'h017f :  // <0195> "
addr == 16'h273 ? 16'hfc00 :  // <0195> "


addr == 16'h274 ? 16'h03a0 :  // <0198> a = 1000
addr == 16'h275 ? 16'h03e8 :  // <0198> "
addr == 16'h276 ? 16'hfba0 :  // <0199> call :spinwait
addr == 16'h277 ? 16'h01f0 :  // <0199> "
addr == 16'h278 ? 16'hfc00 :  // <0199> "
addr == 16'h279 ? 16'he00f :  // <0200> jmp :main
addr == 16'h27a ? 16'h0201 :  // <0200> "

// // clear the first 64k of RAM.
// av_ad_hi = 0
// a = 0
// b = 2
// :clear_next_word
// av_ad_lo = a
// av_write_data = 0
// a = ad0
// bn az :clear_next_word

// // init RAM variables.
// ram $ram_power_down_at_min = $power_down_never
// ram $ram_relay_hold_at_pass = $relay_hold_passes

// // init fuel injection.
// ign_timeout_len_20us = 0xfffc
// efi_len_us = 3000
// call :set_engine_stopped

// // power up FTDI USB board, and init any other special board control functions.
// board_ctrl = $ftdi_power_mask
// call :postpone_comm_restart

// // check initial state of power management circuits.
// // if power is lost or ignition switch is off already, open relay & abort run.
// // that's important because then the event controller booted up too late to
// // see edges on those 2 signals.  regular system would never shut itself down.
// // this setup is the last thing done prior to the event handler loop.
// power_duty = $power_duty_closing
// a = power_duty
// b = ($power_lost_mask | $ign_switch_off_mask)
// br and0z :skip_power_lost
// power_duty = $power_duty_opening
// error_halt_code $err_power_lost_at_boot
// :skip_power_lost

// // start handling events.
// soft_event = $event_controller_reset_mask
// soft_event = 0
// mstimer0 = 1000
// jmp :poll_events

// event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.
// event 0 not used in this app anyway.
// :event_table // = 0x027b
// ([label :poll_events])
// ([label :power_lost_handler])
// ([label :ign_captured_handler])
// ([label :puff1_done_handler])
// ([label :ustimer0_handler])
// ([label :spi_done_handler])
// ([label :mstimer0_handler])
// ([label :mstimer1_handler])
// ([label :uart_rx_handler])
// ([label :uart_rx_overflow_handler])
// ([label :uart_tx_overflow_handler])
// ([label :key0_handler])
// ([label :key1_handler])
// ([label :ign_switch_off_handler])
// ([label :ign_switch_on_handler])
// ([label :softevent3_handler])
// ([label :softevent2_handler])
// ([label :softevent1_handler])
// ([label :softevent0_handler])

// // #########################################################################

// func set_engine_stopped
// ram $ram_rpm_valid = 0
// ram $ram_ign_history_idx = 0
// // for startup, look for RPM between 50 and 1160
// ram $ram_ign_fastest_jf = ([rpm_to_jf 1160])
// ram $ram_ign_slowest_jf = ([rpm_to_jf 50])
// end_func

// // func wrap_history_idx
// // :again
// // b = $ign_history_len
// // br lt :done
// // b = ([negate $ign_history_len])
// // a = a+b
// // jmp :again
// // :done
// // end_func

// event ign_captured_handler
// // discard outlier time.
// a = ign_capture_jf
// ram b = $ram_ign_fastest_jf
// br lt :done
// ram b = $ram_ign_slowest_jf
// br gt :done

// // increment buffer index and memorize time.
// ram a = $ram_ign_history_idx
// b = 1
// a = a+b
// b = $ign_history_idx_mask
// a = and
// ram $ram_ign_history_idx = a
// struct_write $ram_ign_history_jf a = ign_capture_jf

// // ////////// compute new jiffy estimate.

// // // first, total up the oldest 25% of the history
// // // this doesn't work above 2^14 jf.  that's below 44 RPM.
// // // reg a must be already loaded with the history index most recently written.
// // // a=index, i=total, x=loop count.
// // i = 0
// // x = $ign_history_quarter
// // y = -1
// // :next_oldest
// // b = 1
// // a = a+b
// // b = $ign_history_idx_mask
// // a = and
// // struct_read j = $ram_ign_history_jf a
// // i = i+j
// // x = x+y
// // bn xz :next_oldest
// // // memorize average.
// // a = i
// // << for {set n 0} {$n < $ign_avg_shift} {incr n} {parse3 a = a>>1 {}} >>
// // ram $ram_ign_oldest_avg_jf = a

// // average entire history.
// // b = total, i = index = loop count
// b = 0
// i = $ign_history_len
// j = -1
// :next_avg
// struct_read a = $ram_ign_history_jf i
// a = a>>$ign_history_idx_bits
// b = a+b
// i = i+j
// bn iz :next_avg
// ram $ram_ign_avg_jf = b

// // convert to new RPM estimate.
// // b = jiffies, i = RPM
// i = 1
// :next_div
// a = i
// i = a<<1
// a = b
// b = a>>1
// // patch: need math, maybe 2 divisions.
// :done
// end_event

// event ustimer0_handler
// end_event

// event spi_done_handler
// // discard-counter in RAM.
// ram a = $ram_daq_discard_cnt
// br az :report
// b = -1
// a = a+b
// ram $ram_daq_discard_cnt = a
// a = $anmux_adc_channel
// call :begin_adc_conversion
// event_return

// // report ADC reading.
// :report
// a = spi_data
// call :put4x

// // decrement anmux channel & start waiting again.
// call :anmux_get_chn
// br az :all_done
// b = -1
// a = a+b
// call :anmux_set_chn
// mstimer1 = $anmux_settle_ms
// event_return

// // end of daq pass.
// :all_done
// puteol
// ram $ram_dial_setting = spi_data
// end_event

// event mstimer0_handler
// // unified 1-second periodic timer for all low-resolution tasks.

// // start timer again.
// mstimer0 = 1000

// // realtime counters in RAM.
// ram a = $ram_seconds_cnt
// b = 1
// a = a+b
// b = 60
// bn eq :same_minute
// ram $ram_seconds_cnt = 0
// ram a = $ram_minutes_cnt
// b = 1
// ram $ram_minutes_cnt = a+b
// call :minute_events
// jmp :minutes_done
// :same_minute
// ram $ram_seconds_cnt = a
// :minutes_done

// call :check_power_relay
// call :check_communication
// call :start_daq_pass
// end_event

// event mstimer1_handler
// // start a reading from the current anmux channel.
// ram $ram_daq_discard_cnt = $anmux_num_discards
// putasc " "
// putasc "s"
// call :anmux_get_chn
// asc b = "0"
// putchar a+b
// putasc "="
// a = $anmux_adc_channel
// call :begin_adc_conversion
// end_event

// event uart_rx_handler
// :again
// pollchar
// b = -1
// br eq :done
// b = 10
// bn eq :skip_lf
// call :postpone_comm_restart
// :skip_lf
// jmp :again
// :done
// end_event

// event uart_rx_overflow_handler
// error_halt_code $err_rx_overflow
// end_event

// event uart_tx_overflow_handler
// error_halt_code $err_tx_overflow
// end_event

// event key0_handler
// putasc "k"
// putasc "0"
// end_event

// event key1_handler
// putasc "k"
// putasc "1"
// end_event

// event softevent3_handler
// end_event

// event softevent2_handler
// end_event

// event softevent1_handler
// end_event

// event softevent0_handler
// end_event

// func start_daq_pass
// // daq pass counter in RAM.
// ram a = $ram_daq_pass_cnt
// b = 1
// a = a+b
// leds = a
// ram $ram_daq_pass_cnt = a
// call :put4x
// putasc ":"

// // start to acquire & report all anmux channels.
// a = 7
// call :anmux_set_chn
// mstimer1 = $anmux_settle_ms

// // // observe MCU utilization.
// // a = usage_count
// // call :put4x
// // usage_count = 0
// end_func

// func begin_adc_conversion
// // begin SPI transaction, specifying Nano ADC channel to take effect NEXT
// // conversion after this one.  pass that in a.

// a = a<<4
// a = a<<4
// a = a<<1
// a = a<<1
// a = a<<1
// spi_data = a
// end_func

// event power_lost_handler
// // at this time we have less than 2 ms of usable run time left.

// // this must be an uncommanded loss of main power, because if it was commanded,
// // no more events would be handled; this event handler wouldn't have a chance to run.
// // immediately set the power relay PWM to full power for a few seconds,
// // in case the power relay opened accidentally e.g. due to a hard pothole.
// power_duty = $power_duty_closing
// ram a = $ram_daq_pass_cnt
// b = $relay_hold_passes
// ram $ram_relay_hold_at_pass = a+b

// // pause any non-vital power-hogging operations, to conserve power for the EEPROM write.

// // save persistent data in case the power remains down e.g. due to battery disconnect.
// call :save_persistent_data
// end_event

// event ign_switch_off_handler
// // set power-down deadline in RAM.  this makes the system remain powered for several more minutes, for cooldown data logging.
// ram a = $ram_minutes_cnt
// b = $power_extend_minutes
// ram $ram_power_down_at_min = a+b
// end_event

// event ign_switch_on_handler
// ram $ram_power_down_at_min = $power_down_never
// end_event

// event puff1_done_handler
// ram a = $ram_dial_setting
// a = a<<1
// a = a<<1
// a = a<<1
// bn az :nonzero
// a = 1
// :nonzero
// efi_len_us = a
// end_event

// func minute_events
// call :check_power_down
// end_func

// func check_power_relay
// ram a = $ram_daq_pass_cnt
// ram b = $ram_relay_hold_at_pass
// bn eq :done
// // time to begin "solenoid saver" coil power reduction by PWM.
// power_duty = $power_duty_holding
// :done
// end_func

// func check_power_down
// // check power-down deadline in RAM.
// ram a = $ram_minutes_cnt
// ram b = $ram_power_down_at_min
// bn eq :done
// call :power_down
// :done
// end_func

// func power_down
// // this function never returns.
// call :save_persistent_data
// power_duty = $power_duty_opening
// error_halt_code $err_power_down
// end_func

// func save_persistent_data
// end_func

// func check_communication
// ram a = $ram_ftdi_downtime_remain_sec
// br az :skip_ftdi_powerup
// b = -1
// a = a+b
// ram $ram_ftdi_downtime_remain_sec = a
// br az :do_power_on
// rtn
// :do_power_on
// call :ftdi_power_on
// rtn
// :skip_ftdi_powerup

// ram a = $ram_minutes_cnt
// ram b = $ram_comm_restart_at_min
// bn eq :done
// // comm restart is required.
// call :postpone_comm_restart
// ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec
// call :ftdi_power_off
// :done
// end_func

// func postpone_comm_restart
// ram a = $ram_minutes_cnt
// b = $comm_grace_period_min
// ram $ram_comm_restart_at_min = a+b
// end_func

// func ftdi_power_off
// a = board_ctrl
// b = $not_ftdi_power_mask
// board_ctrl = and
// end_func

// func ftdi_power_on
// a = board_ctrl
// b = $ftdi_power_mask
// board_ctrl = or
// end_func


        
                16'hxxxx;
        endmodule
    
