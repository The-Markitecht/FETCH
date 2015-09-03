
        `include "header.v"

        module target_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.


// size of register file.  all registers are external to the Synapse316 core.
// min_num_regs <= num_regs <= max_num_regs.
//vdefine num_regs                32
//vdefine top_reg                 $num_regs - 1
// those 2 have been moved to the assembly program to be distinct for each core.

// Synapse instruction set architecture constants.

// Synapse instruction set codes.

// debugging supervisor contants.  these are also required by implementation of the target MCU core.

// program code dimensions.


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

// SETTING puff_len_us NON-ZERO ENABLES FUEL INJECTION!!  zero disables it.
// MUST SET ign_timeout_len_jf NON-ZERO PRIOR TO ENABLING!
// otherwise the module latches up in a non-working state.

// all ignition time vars are expressed in jf "jiffies" or "jf".
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

addr == 16'h00 ? 16'he00f :  // <0167> jmp :main
addr == 16'h01 ? 16'h0209 :  // <0167> "

addr == 16'h02 ? 16'h001d :  // <0169> emit_debugger_register_table  counter
// "       a"
addr == 16'h03 ? 16'h2020 :  // <0169>   
addr == 16'h04 ? 16'h2020 :  // <0169>   
addr == 16'h05 ? 16'h2020 :  // <0169>   
addr == 16'h06 ? 16'h6120 :  // <0169> a 
// "       b"
addr == 16'h07 ? 16'h2020 :  // <0169>   
addr == 16'h08 ? 16'h2020 :  // <0169>   
addr == 16'h09 ? 16'h2020 :  // <0169>   
addr == 16'h0a ? 16'h6220 :  // <0169> b 
// "       i"
addr == 16'h0b ? 16'h2020 :  // <0169>   
addr == 16'h0c ? 16'h2020 :  // <0169>   
addr == 16'h0d ? 16'h2020 :  // <0169>   
addr == 16'h0e ? 16'h6920 :  // <0169> i 
// "       j"
addr == 16'h0f ? 16'h2020 :  // <0169>   
addr == 16'h10 ? 16'h2020 :  // <0169>   
addr == 16'h11 ? 16'h2020 :  // <0169>   
addr == 16'h12 ? 16'h6a20 :  // <0169> j 
// "       x"
addr == 16'h13 ? 16'h2020 :  // <0169>   
addr == 16'h14 ? 16'h2020 :  // <0169>   
addr == 16'h15 ? 16'h2020 :  // <0169>   
addr == 16'h16 ? 16'h7820 :  // <0169> x 
// "       y"
addr == 16'h17 ? 16'h2020 :  // <0169>   
addr == 16'h18 ? 16'h2020 :  // <0169>   
addr == 16'h19 ? 16'h2020 :  // <0169>   
addr == 16'h1a ? 16'h7920 :  // <0169> y 
// "      g6"
addr == 16'h1b ? 16'h2020 :  // <0169>   
addr == 16'h1c ? 16'h2020 :  // <0169>   
addr == 16'h1d ? 16'h2020 :  // <0169>   
addr == 16'h1e ? 16'h3667 :  // <0169> 6g
// "      g7"
addr == 16'h1f ? 16'h2020 :  // <0169>   
addr == 16'h20 ? 16'h2020 :  // <0169>   
addr == 16'h21 ? 16'h2020 :  // <0169>   
addr == 16'h22 ? 16'h3767 :  // <0169> 7g
// "//rstk  "
addr == 16'h23 ? 16'h2f2f :  // <0169> //
addr == 16'h24 ? 16'h7372 :  // <0169> sr
addr == 16'h25 ? 16'h6b74 :  // <0169> kt
addr == 16'h26 ? 16'h2020 :  // <0169>   
// "  ev_pri"
addr == 16'h27 ? 16'h2020 :  // <0169>   
addr == 16'h28 ? 16'h7665 :  // <0169> ve
addr == 16'h29 ? 16'h705f :  // <0169> p_
addr == 16'h2a ? 16'h6972 :  // <0169> ir
// "softevnt"
addr == 16'h2b ? 16'h6f73 :  // <0169> os
addr == 16'h2c ? 16'h7466 :  // <0169> tf
addr == 16'h2d ? 16'h7665 :  // <0169> ve
addr == 16'h2e ? 16'h746e :  // <0169> tn
// "   usage"
addr == 16'h2f ? 16'h2020 :  // <0169>   
addr == 16'h30 ? 16'h7520 :  // <0169> u 
addr == 16'h31 ? 16'h6173 :  // <0169> as
addr == 16'h32 ? 16'h6567 :  // <0169> eg
// "ustimer0"
addr == 16'h33 ? 16'h7375 :  // <0169> su
addr == 16'h34 ? 16'h6974 :  // <0169> it
addr == 16'h35 ? 16'h656d :  // <0169> em
addr == 16'h36 ? 16'h3072 :  // <0169> 0r
// "mstimer0"
addr == 16'h37 ? 16'h736d :  // <0169> sm
addr == 16'h38 ? 16'h6974 :  // <0169> it
addr == 16'h39 ? 16'h656d :  // <0169> em
addr == 16'h3a ? 16'h3072 :  // <0169> 0r
// "mstimer1"
addr == 16'h3b ? 16'h736d :  // <0169> sm
addr == 16'h3c ? 16'h6974 :  // <0169> it
addr == 16'h3d ? 16'h656d :  // <0169> em
addr == 16'h3e ? 16'h3172 :  // <0169> 1r
// "spi_data"
addr == 16'h3f ? 16'h7073 :  // <0169> ps
addr == 16'h40 ? 16'h5f69 :  // <0169> _i
addr == 16'h41 ? 16'h6164 :  // <0169> ad
addr == 16'h42 ? 16'h6174 :  // <0169> at
// "//avwrdt"
addr == 16'h43 ? 16'h2f2f :  // <0169> //
addr == 16'h44 ? 16'h7661 :  // <0169> va
addr == 16'h45 ? 16'h7277 :  // <0169> rw
addr == 16'h46 ? 16'h7464 :  // <0169> td
// "av_rd_dt"
addr == 16'h47 ? 16'h7661 :  // <0169> va
addr == 16'h48 ? 16'h725f :  // <0169> r_
addr == 16'h49 ? 16'h5f64 :  // <0169> _d
addr == 16'h4a ? 16'h7464 :  // <0169> td
// "av_ad_hi"
addr == 16'h4b ? 16'h7661 :  // <0169> va
addr == 16'h4c ? 16'h615f :  // <0169> a_
addr == 16'h4d ? 16'h5f64 :  // <0169> _d
addr == 16'h4e ? 16'h6968 :  // <0169> ih
// "av_ad_lo"
addr == 16'h4f ? 16'h7661 :  // <0169> va
addr == 16'h50 ? 16'h615f :  // <0169> a_
addr == 16'h51 ? 16'h5f64 :  // <0169> _d
addr == 16'h52 ? 16'h6f6c :  // <0169> ol
// "//uartdt"
addr == 16'h53 ? 16'h2f2f :  // <0169> //
addr == 16'h54 ? 16'h6175 :  // <0169> au
addr == 16'h55 ? 16'h7472 :  // <0169> tr
addr == 16'h56 ? 16'h7464 :  // <0169> td
// "uartstat"
addr == 16'h57 ? 16'h6175 :  // <0169> au
addr == 16'h58 ? 16'h7472 :  // <0169> tr
addr == 16'h59 ? 16'h7473 :  // <0169> ts
addr == 16'h5a ? 16'h7461 :  // <0169> ta
// "    leds"
addr == 16'h5b ? 16'h2020 :  // <0169>   
addr == 16'h5c ? 16'h2020 :  // <0169>   
addr == 16'h5d ? 16'h656c :  // <0169> el
addr == 16'h5e ? 16'h7364 :  // <0169> sd
// "brd_ctrl"
addr == 16'h5f ? 16'h7262 :  // <0169> rb
addr == 16'h60 ? 16'h5f64 :  // <0169> _d
addr == 16'h61 ? 16'h7463 :  // <0169> tc
addr == 16'h62 ? 16'h6c72 :  // <0169> lr
// "   anmux"
addr == 16'h63 ? 16'h2020 :  // <0169>   
addr == 16'h64 ? 16'h6120 :  // <0169> a 
addr == 16'h65 ? 16'h6d6e :  // <0169> mn
addr == 16'h66 ? 16'h7875 :  // <0169> xu
// "pwr_duty"
addr == 16'h67 ? 16'h7770 :  // <0169> wp
addr == 16'h68 ? 16'h5f72 :  // <0169> _r
addr == 16'h69 ? 16'h7564 :  // <0169> ud
addr == 16'h6a ? 16'h7974 :  // <0169> yt
// "efilenus"
addr == 16'h6b ? 16'h6665 :  // <0169> fe
addr == 16'h6c ? 16'h6c69 :  // <0169> li
addr == 16'h6d ? 16'h6e65 :  // <0169> ne
addr == 16'h6e ? 16'h7375 :  // <0169> su
// "igntmout"
addr == 16'h6f ? 16'h6769 :  // <0169> gi
addr == 16'h70 ? 16'h746e :  // <0169> tn
addr == 16'h71 ? 16'h6f6d :  // <0169> om
addr == 16'h72 ? 16'h7475 :  // <0169> tu
// "igntmcap"
addr == 16'h73 ? 16'h6769 :  // <0169> gi
addr == 16'h74 ? 16'h746e :  // <0169> tn
addr == 16'h75 ? 16'h636d :  // <0169> cm
addr == 16'h76 ? 16'h7061 :  // <0169> pa

// libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.

// event loop.  this infrastructure is assembled directly into the main program, not a func.
// first instruction of an event handler should be the 7th cycle after reading its priority from the event controller here.
// :poll_events // = 0x0077
// initialize prior to polling loop, for minimum latency.
addr == 16'h77 ? 16'h07a0 :  // <0006> b = :event_table
addr == 16'h78 ? 16'h0238 :  // <0006> "
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
addr == 16'hba ? 16'h01c5 :  // <0063> "
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
addr == 16'hc7 ? 16'h01c5 :  // <0071> "
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
addr == 16'hd2 ? 16'h01c5 :  // <0078> "
addr == 16'hd3 ? 16'hfc00 :  // <0078> "
addr == 16'hd4 ? 16'hfba0 :  // <0079> putchar a
addr == 16'hd5 ? 16'h0084 :  // <0079> "
addr == 16'hd6 ? 16'hfc00 :  // <0079> "

addr == 16'hd7 ? 16'h0006 :  // <0081> a = g6
addr == 16'hd8 ? 16'h060f :  // <0082> b = 0x000F
addr == 16'hd9 ? 16'hc800 :  // <0083> a = and
addr == 16'hda ? 16'h0330 :  // <0083> "
addr == 16'hdb ? 16'hfba0 :  // <0084> call fetch_byte
addr == 16'hdc ? 16'h01c5 :  // <0084> "
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
addr == 16'hf2 ? 16'h01d9 :  // <0099> "
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

// print a fixed-length string from packed words in program space.
// pass its word address (not its byte address) in a,  its length (bytes) in b.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_fixed // = 0x0111
addr == 16'h111 ? 16'h2002 :  // <0121> push i // func print_fixed
addr == 16'h112 ? 16'h2003 :  // <0121> push j // "
addr == 16'h113 ? 16'h2004 :  // <0121> push x // "
addr == 16'h114 ? 16'h2005 :  // <0121> push y // "
addr == 16'h115 ? 16'h2006 :  // <0121> push g6 // "
addr == 16'h116 ? 16'h203e :  // <0121> push rtna // "
addr == 16'h117 ? 16'h0800 :  // <0122> i = a
addr == 16'h118 ? 16'h0e01 :  // <0123> j = 1
addr == 16'h119 ? 16'h1001 :  // <0124> x = b
addr == 16'h11a ? 16'h1760 :  // <0125> y = -1
// :next_word // = 0x011b
addr == 16'h11b ? 16'he002 :  // <0127> br xz :done
addr == 16'h11c ? 16'h0131 :  // <0127> "
addr == 16'h11d ? 16'h1320 :  // <0128> x = ad2
addr == 16'h11e ? 16'hd002 :  // <0129> fetch g6 from i
addr == 16'h11f ? 16'h1bb0 :  // <0129> "
// now x = bytes remaining, i = current word address, g6 = data word.
addr == 16'h120 ? 16'h0006 :  // <0131> a = g6 // putchar g6
addr == 16'h121 ? 16'hfba0 :  // <0131> putchar g6
addr == 16'h122 ? 16'h0084 :  // <0131> "
addr == 16'h123 ? 16'hfc00 :  // <0131> "
addr == 16'h124 ? 16'he002 :  // <0132> br xz :done
addr == 16'h125 ? 16'h0131 :  // <0132> "
addr == 16'h126 ? 16'h1320 :  // <0133> x = ad2
addr == 16'h127 ? 16'h0006 :  // <0134> a = g6
addr == 16'h128 ? 16'h0353 :  // <0135> a = a>>4
addr == 16'h129 ? 16'h0353 :  // <0136> a = a>>4
addr == 16'h12a ? 16'hfba0 :  // <0137> putchar a
addr == 16'h12b ? 16'h0084 :  // <0137> "
addr == 16'h12c ? 16'hfc00 :  // <0137> "
addr == 16'h12d ? 16'hc800 :  // <0138> i = i+j
addr == 16'h12e ? 16'h0b10 :  // <0138> "
addr == 16'h12f ? 16'he00f :  // <0139> jmp :next_word
addr == 16'h130 ? 16'h011b :  // <0139> "
// :done // = 0x0131
addr == 16'h131 ? 16'hf808 :  // <0141> pop rtna // end_func
addr == 16'h132 ? 16'h1808 :  // <0141> pop g6 // "
addr == 16'h133 ? 16'h1408 :  // <0141> pop y // "
addr == 16'h134 ? 16'h1008 :  // <0141> pop x // "
addr == 16'h135 ? 16'h0c08 :  // <0141> pop j // "
addr == 16'h136 ? 16'h0808 :  // <0141> pop i // "
addr == 16'h137 ? 16'hfc00 :  // <0141> end_func

// print a null-terminated string from packed words in program space.
// pass its word address (not its byte address) in a.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_nt // = 0x0138
addr == 16'h138 ? 16'h2002 :  // <0147> push i // func print_nt
addr == 16'h139 ? 16'h2003 :  // <0147> push j // "
addr == 16'h13a ? 16'h2004 :  // <0147> push x // "
addr == 16'h13b ? 16'h203e :  // <0147> push rtna // "
addr == 16'h13c ? 16'h0800 :  // <0148> i = a
addr == 16'h13d ? 16'h0e01 :  // <0149> j = 1
// :next_word // = 0x013e
addr == 16'h13e ? 16'hd002 :  // <0151> fetch x from i
addr == 16'h13f ? 16'h13b0 :  // <0151> "
// now i = current word address, x = data word, b = low byte mask, a = data byte.
addr == 16'h140 ? 16'h0004 :  // <0153> a = x
addr == 16'h141 ? 16'h06ff :  // <0154> b = 0xff
addr == 16'h142 ? 16'he003 :  // <0155> br and0z :done
addr == 16'h143 ? 16'h0154 :  // <0155> "
addr == 16'h144 ? 16'hfba0 :  // <0156> putchar a
addr == 16'h145 ? 16'h0084 :  // <0156> "
addr == 16'h146 ? 16'hfc00 :  // <0156> "
addr == 16'h147 ? 16'h0004 :  // <0157> a = x
addr == 16'h148 ? 16'h0353 :  // <0158> a = a>>4
addr == 16'h149 ? 16'h0353 :  // <0159> a = a>>4
addr == 16'h14a ? 16'h06ff :  // <0160> b = 0xff
addr == 16'h14b ? 16'he003 :  // <0161> br and0z :done
addr == 16'h14c ? 16'h0154 :  // <0161> "
addr == 16'h14d ? 16'hfba0 :  // <0162> putchar a
addr == 16'h14e ? 16'h0084 :  // <0162> "
addr == 16'h14f ? 16'hfc00 :  // <0162> "
addr == 16'h150 ? 16'hc800 :  // <0163> i = i+j
addr == 16'h151 ? 16'h0b10 :  // <0163> "
addr == 16'h152 ? 16'he00f :  // <0164> jmp :next_word
addr == 16'h153 ? 16'h013e :  // <0164> "
// :done // = 0x0154
addr == 16'h154 ? 16'hf808 :  // <0166> pop rtna // end_func
addr == 16'h155 ? 16'h1008 :  // <0166> pop x // "
addr == 16'h156 ? 16'h0c08 :  // <0166> pop j // "
addr == 16'h157 ? 16'h0808 :  // <0166> pop i // "
addr == 16'h158 ? 16'hfc00 :  // <0166> end_func


// function library for simple integer math.

// ######## func multiply // = 0x0159
addr == 16'h159 ? 16'h2002 :  // <0004> push i // func multiply
addr == 16'h15a ? 16'h2003 :  // <0004> push j // "
addr == 16'h15b ? 16'h2004 :  // <0004> push x // "
addr == 16'h15c ? 16'h2005 :  // <0004> push y // "
// unsigned 16-bit multiplication.  a = a * b.
// it's easy to roll over the 16-bit result by passing operands whose bit widths total more than 16.
// bigger/safer/faster math can be obtained from Altera IP blocks.

addr == 16'h15d ? 16'h1000 :  // <0009> x = a
addr == 16'h15e ? 16'h1401 :  // <0010> y = b
addr == 16'h15f ? 16'h0a00 :  // <0011> i = 0
// :again // = 0x0160
addr == 16'h160 ? 16'he002 :  // <0013> br xz :done
addr == 16'h161 ? 16'h016f :  // <0013> "
addr == 16'h162 ? 16'h0004 :  // <0014> a = x
addr == 16'h163 ? 16'h0601 :  // <0015> b = 1
addr == 16'h164 ? 16'he003 :  // <0016> br and0z :skip_add
addr == 16'h165 ? 16'h0169 :  // <0016> "
addr == 16'h166 ? 16'h0c05 :  // <0017> j = y
addr == 16'h167 ? 16'hc800 :  // <0018> i = i+j
addr == 16'h168 ? 16'h0b10 :  // <0018> "
// :skip_add // = 0x0169
addr == 16'h169 ? 16'h0004 :  // <0020> a = x
addr == 16'h16a ? 16'h1350 :  // <0021> x = a>>1
addr == 16'h16b ? 16'h0005 :  // <0022> a = y
addr == 16'h16c ? 16'h1751 :  // <0023> y = a<<1
addr == 16'h16d ? 16'he00f :  // <0024> jmp :again
addr == 16'h16e ? 16'h0160 :  // <0024> "
// :done // = 0x016f
addr == 16'h16f ? 16'h0002 :  // <0026> a = i
addr == 16'h170 ? 16'h1408 :  // <0027> pop y // end_func
addr == 16'h171 ? 16'h1008 :  // <0027> pop x // "
addr == 16'h172 ? 16'h0c08 :  // <0027> pop j // "
addr == 16'h173 ? 16'h0808 :  // <0027> pop i // "
addr == 16'h174 ? 16'hfc00 :  // <0027> end_func

// ######## func divide // = 0x0175
addr == 16'h175 ? 16'h2002 :  // <0029> push i // func divide
addr == 16'h176 ? 16'h2003 :  // <0029> push j // "
addr == 16'h177 ? 16'h2004 :  // <0029> push x // "
addr == 16'h178 ? 16'h2005 :  // <0029> push y // "
addr == 16'h179 ? 16'h2006 :  // <0029> push g6 // "
addr == 16'h17a ? 16'h2007 :  // <0029> push g7 // "
// unsigned 15-bit division.  b = a / b.  return remainder in a.
// division by zero results in zero.
// THE HIGH BIT OF A MUST BE 0!!  ALSO THE HIGH BIT OF B MUST BE 0!!
// 1 in the high bit of either operand results in infinite loop or wrong results.
// bigger/safer/faster math can be obtained from Altera IP blocks.

// degenerate cases.
addr == 16'h17b ? 16'he005 :  // <0037> br lt :zero
addr == 16'h17c ? 16'h01b6 :  // <0037> "
addr == 16'h17d ? 16'he000 :  // <0038> br az :zero
addr == 16'h17e ? 16'h01b6 :  // <0038> "
addr == 16'h17f ? 16'h1000 :  // <0039> x = a
//    g7 = x
addr == 16'h180 ? 16'h0001 :  // <0041> a = b
addr == 16'h181 ? 16'he000 :  // <0042> br az :zero
addr == 16'h182 ? 16'h01b6 :  // <0042> "
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
addr == 16'h183 ? 16'h0404 :  // <0058> b = x
addr == 16'h184 ? 16'h0a00 :  // <0059> i = 0
addr == 16'h185 ? 16'h0e01 :  // <0060> j = 1
// :shift_again // = 0x0186
addr == 16'h186 ? 16'he006 :  // <0062> br gt :shift_done
addr == 16'h187 ? 16'h018c :  // <0062> "
addr == 16'h188 ? 16'h0351 :  // <0063> a = a<<1
addr == 16'h189 ? 16'h0b10 :  // <0064> i = ad1
addr == 16'h18a ? 16'he00f :  // <0065> jmp :shift_again
addr == 16'h18b ? 16'h0186 :  // <0065> "
// :shift_done // = 0x018c
addr == 16'h18c ? 16'h1b50 :  // <0067> g6 = a>>1
// now operands are x / g6.  i = number of passes of long division required.
// notice i was not decremented here, so it has 1 more in it than the number of shifts required for digit parity.
// that's exactly what it needs for correctness.

// // compensate for special case where msb was 1.  then 1 more division pass is needed.
// j = y
// i = i+j
// x = g7

// long division.  g7 = quotient.
addr == 16'h18d ? 16'h1e00 :  // <0078> g7 = 0
addr == 16'h18e ? 16'h0f60 :  // <0079> j = -1
// :again // = 0x018f
addr == 16'h18f ? 16'he001 :  // <0081> br iz :done
addr == 16'h190 ? 16'h01ad :  // <0081> "
addr == 16'h191 ? 16'h0006 :  // <0082> a = g6
addr == 16'h192 ? 16'h0404 :  // <0083> b = x
addr == 16'h193 ? 16'he006 :  // <0084> br gt :result0
addr == 16'h194 ? 16'h01a5 :  // <0084> "
// temp does fit; output a 1.
addr == 16'h195 ? 16'h0007 :  // <0086> a = g7
addr == 16'h196 ? 16'h0351 :  // <0087> a = a<<1
addr == 16'h197 ? 16'h0601 :  // <0088> b = 1
addr == 16'h198 ? 16'hc800 :  // <0089> g7 = or
addr == 16'h199 ? 16'h1f34 :  // <0089> "
// dividend = dividend - temp
addr == 16'h19a ? 16'h0006 :  // <0091> a = g6
addr == 16'h19b ? 16'h0760 :  // <0092> b = -1
addr == 16'h19c ? 16'hc800 :  // <0093> a = xor
addr == 16'h19d ? 16'h0338 :  // <0093> "
addr == 16'h19e ? 16'h0601 :  // <0094> b = 1
addr == 16'h19f ? 16'hc800 :  // <0095> y = a+b
addr == 16'h1a0 ? 16'h1700 :  // <0095> "
addr == 16'h1a1 ? 16'hc800 :  // <0096> x = x+y
addr == 16'h1a2 ? 16'h1320 :  // <0096> "
addr == 16'h1a3 ? 16'he00f :  // <0097> jmp :next
addr == 16'h1a4 ? 16'h01a7 :  // <0097> "
// :result0 // = 0x01a5
// temp does not fit; output a 0.
addr == 16'h1a5 ? 16'h0007 :  // <0100> a = g7
addr == 16'h1a6 ? 16'h1f51 :  // <0101> g7 = a<<1
// no change to dividend.
// :next // = 0x01a7
addr == 16'h1a7 ? 16'h0006 :  // <0104> a = g6
addr == 16'h1a8 ? 16'h1b50 :  // <0105> g6 = a>>1
addr == 16'h1a9 ? 16'hc800 :  // <0106> i = i+j
addr == 16'h1aa ? 16'h0b10 :  // <0106> "
addr == 16'h1ab ? 16'he00f :  // <0107> jmp :again
addr == 16'h1ac ? 16'h018f :  // <0107> "

// :done // = 0x01ad
addr == 16'h1ad ? 16'h0407 :  // <0110> b = g7
addr == 16'h1ae ? 16'h0004 :  // <0111> a = x
addr == 16'h1af ? 16'h1c08 :  // <0112> pop g7 // rtn
addr == 16'h1b0 ? 16'h1808 :  // <0112> pop g6 // "
addr == 16'h1b1 ? 16'h1408 :  // <0112> pop y // "
addr == 16'h1b2 ? 16'h1008 :  // <0112> pop x // "
addr == 16'h1b3 ? 16'h0c08 :  // <0112> pop j // "
addr == 16'h1b4 ? 16'h0808 :  // <0112> pop i // "
addr == 16'h1b5 ? 16'hfc00 :  // <0112> rtn

// :zero // = 0x01b6
addr == 16'h1b6 ? 16'h0600 :  // <0115> b = 0
addr == 16'h1b7 ? 16'h1c08 :  // <0116> pop g7 // rtn
addr == 16'h1b8 ? 16'h1808 :  // <0116> pop g6 // "
addr == 16'h1b9 ? 16'h1408 :  // <0116> pop y // "
addr == 16'h1ba ? 16'h1008 :  // <0116> pop x // "
addr == 16'h1bb ? 16'h0c08 :  // <0116> pop j // "
addr == 16'h1bc ? 16'h0808 :  // <0116> pop i // "
addr == 16'h1bd ? 16'hfc00 :  // <0116> rtn
addr == 16'h1be ? 16'h1c08 :  // <0117> pop g7 // end_func
addr == 16'h1bf ? 16'h1808 :  // <0117> pop g6 // "
addr == 16'h1c0 ? 16'h1408 :  // <0117> pop y // "
addr == 16'h1c1 ? 16'h1008 :  // <0117> pop x // "
addr == 16'h1c2 ? 16'h0c08 :  // <0117> pop j // "
addr == 16'h1c3 ? 16'h0808 :  // <0117> pop i // "
addr == 16'h1c4 ? 16'hfc00 :  // <0117> end_func


// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// ######## func fetch_byte // = 0x01c5
addr == 16'h1c5 ? 16'h0601 :  // <0005> b = 1
addr == 16'h1c6 ? 16'he003 :  // <0006> br and0z :pick_byte_even
addr == 16'h1c7 ? 16'h01d0 :  // <0006> "
addr == 16'h1c8 ? 16'h0350 :  // <0007> a = a>>1
addr == 16'h1c9 ? 16'h0404 :  // <0008> b = x
addr == 16'h1ca ? 16'hc800 :  // <0009> fetch a from a+b
addr == 16'h1cb ? 16'hd300 :  // <0009> "
addr == 16'h1cc ? 16'h03b0 :  // <0009> "
addr == 16'h1cd ? 16'h0353 :  // <0010> a = a>>4
addr == 16'h1ce ? 16'h0353 :  // <0011> a = a>>4
addr == 16'h1cf ? 16'hfc00 :  // <0012> rtn
// :pick_byte_even // = 0x01d0
addr == 16'h1d0 ? 16'h0350 :  // <0014> a = a>>1
addr == 16'h1d1 ? 16'h0404 :  // <0015> b = x
addr == 16'h1d2 ? 16'hc800 :  // <0016> fetch a from a+b
addr == 16'h1d3 ? 16'hd300 :  // <0016> "
addr == 16'h1d4 ? 16'h03b0 :  // <0016> "
addr == 16'h1d5 ? 16'h06ff :  // <0017> b = 0xff
addr == 16'h1d6 ? 16'hc800 :  // <0018> a = and
addr == 16'h1d7 ? 16'h0330 :  // <0018> "
addr == 16'h1d8 ? 16'hfc00 :  // <0019> end_func

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// ######## func find_in_fetch // = 0x01d9
addr == 16'h1d9 ? 16'h2002 :  // <0027> push i // func find_in_fetch
addr == 16'h1da ? 16'h2003 :  // <0027> push j // "
addr == 16'h1db ? 16'h2005 :  // <0027> push y // "
addr == 16'h1dc ? 16'h203e :  // <0027> push rtna // "
addr == 16'h1dd ? 16'h1400 :  // <0028> y = a
addr == 16'h1de ? 16'h0f60 :  // <0029> j = -1
// :again // = 0x01df
addr == 16'h1df ? 16'he001 :  // <0031> br iz :fail
addr == 16'h1e0 ? 16'h01ef :  // <0031> "
addr == 16'h1e1 ? 16'h0b10 :  // <0032> i = ad1
addr == 16'h1e2 ? 16'h0002 :  // <0033> a = i
addr == 16'h1e3 ? 16'hfba0 :  // <0034> call :fetch_byte
addr == 16'h1e4 ? 16'h01c5 :  // <0034> "
addr == 16'h1e5 ? 16'hfc00 :  // <0034> "
addr == 16'h1e6 ? 16'h0405 :  // <0035> b = y
addr == 16'h1e7 ? 16'he407 :  // <0036> bn eq :again
addr == 16'h1e8 ? 16'h01df :  // <0036> "
// :found // = 0x01e9
addr == 16'h1e9 ? 16'h0002 :  // <0038> a = i
addr == 16'h1ea ? 16'hf808 :  // <0039> pop rtna // rtn
addr == 16'h1eb ? 16'h1408 :  // <0039> pop y // "
addr == 16'h1ec ? 16'h0c08 :  // <0039> pop j // "
addr == 16'h1ed ? 16'h0808 :  // <0039> pop i // "
addr == 16'h1ee ? 16'hfc00 :  // <0039> rtn
// :fail // = 0x01ef
addr == 16'h1ef ? 16'h0360 :  // <0041> a = -1
addr == 16'h1f0 ? 16'hf808 :  // <0042> pop rtna // end_func
addr == 16'h1f1 ? 16'h1408 :  // <0042> pop y // "
addr == 16'h1f2 ? 16'h0c08 :  // <0042> pop j // "
addr == 16'h1f3 ? 16'h0808 :  // <0042> pop i // "
addr == 16'h1f4 ? 16'hfc00 :  // <0042> end_func


// routine waits a number of milliseconds given in a.
// ######## func spinwait // = 0x01f5
addr == 16'h1f5 ? 16'h2004 :  // <0002> push x // func spinwait
addr == 16'h1f6 ? 16'h2005 :  // <0002> push y // "
//patch
//rtn
addr == 16'h1f7 ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x01f8
addr == 16'h1f8 ? 16'h13a0 :  // <0007> x = 16666
addr == 16'h1f9 ? 16'h411a :  // <0007> "
addr == 16'h1fa ? 16'h1760 :  // <0008> y = -1
addr == 16'h1fb ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x01fc
// use of the ad2 name overrides auto-nop here.
addr == 16'h1fc ? 16'h1320 :  // <0012> x = ad2
addr == 16'h1fd ? 16'he402 :  // <0013> bn xz :spinwait_inner
addr == 16'h1fe ? 16'h01fc :  // <0013> "
addr == 16'h1ff ? 16'hc800 :  // <0014> a = a+b
addr == 16'h200 ? 16'h0300 :  // <0014> "
addr == 16'h201 ? 16'he400 :  // <0015> bn az :spinwait_outer
addr == 16'h202 ? 16'h01f8 :  // <0015> "
addr == 16'h203 ? 16'h1408 :  // <0016> pop y // end_func
addr == 16'h204 ? 16'h1008 :  // <0016> pop x // "
addr == 16'h205 ? 16'hfc00 :  // <0016> end_func



// string resources
// :boot_msg // = 0x0206
// "TGT\r\n\x0"
addr == 16'h206 ? 16'h4754 :  // <0184> GT
addr == 16'h207 ? 16'h0d54 :  // <0184>  T
addr == 16'h208 ? 16'h000a :  // <0184>   

// #########################################################################
// :main // = 0x0209
addr == 16'h209 ? 16'h03a0 :  // <0188> a = :boot_msg
addr == 16'h20a ? 16'h0206 :  // <0188> "
addr == 16'h20b ? 16'hfba0 :  // <0189> call :print_nt
addr == 16'h20c ? 16'h0138 :  // <0189> "
addr == 16'h20d ? 16'hfc00 :  // <0189> "

// clear the first 64k of RAM.
addr == 16'h20e ? 16'h4a00 :  // <0192> av_ad_hi = 0
addr == 16'h20f ? 16'h0200 :  // <0193> a = 0
addr == 16'h210 ? 16'h0602 :  // <0194> b = 2
// :clear_next_word // = 0x0211
addr == 16'h211 ? 16'h4c00 :  // <0196> av_ad_lo = a
addr == 16'h212 ? 16'h4200 :  // <0197> av_write_data = 0
addr == 16'h213 ? 16'h0300 :  // <0198> a = ad0
addr == 16'h214 ? 16'he400 :  // <0199> bn az :clear_next_word
addr == 16'h215 ? 16'h0211 :  // <0199> "

// init RAM variables.
addr == 16'h216 ? 16'h4a00 :  // <0202> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h217 ? 16'h4e08 :  // <0202> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 8
addr == 16'h218 ? 16'h4360 :  // <0202> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h219 ? 16'h4a00 :  // <0203> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_hi = 0
addr == 16'h21a ? 16'h4e0a :  // <0203> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_lo = 10
addr == 16'h21b ? 16'h4202 :  // <0203> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_write_data = 2

// init fuel injection.
addr == 16'h21c ? 16'h6fa0 :  // <0206> ign_timeout_len_jf = 0xfffc
addr == 16'h21d ? 16'hfffc :  // <0206> "
addr == 16'h21e ? 16'h6ba0 :  // <0207> puff_len_us = 3000
addr == 16'h21f ? 16'h0bb8 :  // <0207> "
addr == 16'h220 ? 16'hfba0 :  // <0208> call :set_engine_stopped
addr == 16'h221 ? 16'h024f :  // <0208> "
addr == 16'h222 ? 16'hfc00 :  // <0208> "

// power up FTDI USB board, and init any other special board control functions.
addr == 16'h223 ? 16'h5e80 :  // <0211> board_ctrl = $ftdi_power_mask
addr == 16'h224 ? 16'hfba0 :  // <0212> call :postpone_comm_restart
addr == 16'h225 ? 16'h046f :  // <0212> "
addr == 16'h226 ? 16'hfc00 :  // <0212> "

// check initial state of power management circuits.
// if power is lost or ignition switch is off already, open relay & abort run.
// that's important because then the event controller booted up too late to
// see edges on those 2 signals.  regular system would never shut itself down.
// this setup is the last thing done prior to the event handler loop.
addr == 16'h227 ? 16'h6600 :  // <0219> power_duty = $power_duty_closing
addr == 16'h228 ? 16'h0019 :  // <0220> a = power_duty
addr == 16'h229 ? 16'h06c0 :  // <0221> b = ($power_lost_mask | $ign_switch_off_mask)
addr == 16'h22a ? 16'he003 :  // <0222> br and0z :skip_power_lost
addr == 16'h22b ? 16'h0231 :  // <0222> "
addr == 16'h22c ? 16'h6632 :  // <0223> power_duty = $power_duty_opening
addr == 16'h22d ? 16'h5ba0 :  // <0224> error_halt_code $err_power_lost_at_boot // leds = 0xfffb
addr == 16'h22e ? 16'hfffb :  // <0224> "
addr == 16'h22f ? 16'he00f :  // <0224> error_halt_code $err_power_lost_at_boot
addr == 16'h230 ? 16'h022f :  // <0224> "
// :skip_power_lost // = 0x0231

// start handling events.
addr == 16'h231 ? 16'h2ba0 :  // <0228> soft_event = $event_controller_reset_mask
addr == 16'h232 ? 16'h8000 :  // <0228> "
addr == 16'h233 ? 16'h2a00 :  // <0229> soft_event = 0
addr == 16'h234 ? 16'h37a0 :  // <0230> mstimer0 = 1000
addr == 16'h235 ? 16'h03e8 :  // <0230> "
addr == 16'h236 ? 16'he00f :  // <0231> jmp :poll_events
addr == 16'h237 ? 16'h0077 :  // <0231> "

// event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.
// event 0 not used in this app anyway.
// :event_table // = 0x0238
addr == 16'h238 ? 16'h0077 :  // <0236> ([label :poll_events])
addr == 16'h239 ? 16'h03d1 :  // <0237> ([label :power_lost_handler])
addr == 16'h23a ? 16'h0262 :  // <0238> ([label :ign_capture_handler])
addr == 16'h23b ? 16'h02d3 :  // <0239> ([label :ign_capture_timeout_handler])
addr == 16'h23c ? 16'h0400 :  // <0240> ([label :puff1_done_handler])
addr == 16'h23d ? 16'h02d8 :  // <0241> ([label :ustimer0_handler])
addr == 16'h23e ? 16'h02da :  // <0242> ([label :spi_done_handler])
addr == 16'h23f ? 16'h030e :  // <0243> ([label :mstimer0_handler])
addr == 16'h240 ? 16'h0339 :  // <0244> ([label :mstimer1_handler])
addr == 16'h241 ? 16'h0357 :  // <0245> ([label :uart_rx_handler])
addr == 16'h242 ? 16'h0367 :  // <0246> ([label :uart_rx_overflow_handler])
addr == 16'h243 ? 16'h036d :  // <0247> ([label :uart_tx_overflow_handler])
addr == 16'h244 ? 16'h0373 :  // <0248> ([label :key0_handler])
addr == 16'h245 ? 16'h037d :  // <0249> ([label :key1_handler])
addr == 16'h246 ? 16'h03e3 :  // <0250> ([label :ign_switch_off_handler])
addr == 16'h247 ? 16'h03f6 :  // <0251> ([label :ign_switch_on_handler])
addr == 16'h248 ? 16'h0387 :  // <0252> ([label :softevent3_handler])
addr == 16'h249 ? 16'h0389 :  // <0253> ([label :softevent2_handler])
addr == 16'h24a ? 16'h038b :  // <0254> ([label :softevent1_handler])
addr == 16'h24b ? 16'h038d :  // <0255> ([label :softevent0_handler])

// #########################################################################

// :engine_stopped_msg // = 0x024c
// "ESTP\x0"
addr == 16'h24c ? 16'h5345 :  // <0260> SE
addr == 16'h24d ? 16'h5054 :  // <0260> PT
addr == 16'h24e ? 16'h0000 :  // <0260>   

// ######## func set_engine_stopped // = 0x024f
addr == 16'h24f ? 16'h203e :  // <0262> push rtna // func set_engine_stopped
addr == 16'h250 ? 16'hfba0 :  // <0263> call :clear_ign_history
addr == 16'h251 ? 16'h02bd :  // <0263> "
addr == 16'h252 ? 16'hfc00 :  // <0263> "

// for startup, look for RPM between 50 and 1160
addr == 16'h253 ? 16'h4a00 :  // <0266> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_hi = 0
addr == 16'h254 ? 16'h4e34 :  // <0266> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_lo = 52
addr == 16'h255 ? 16'h43a0 :  // <0266> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_write_data = 603
addr == 16'h256 ? 16'h025b :  // <0266> "
addr == 16'h257 ? 16'h4a00 :  // <0267> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h258 ? 16'h4e36 :  // <0267> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 54
addr == 16'h259 ? 16'h43a0 :  // <0267> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h25a ? 16'h36b0 :  // <0267> "

addr == 16'h25b ? 16'h03a0 :  // <0269> a = :engine_stopped_msg
addr == 16'h25c ? 16'h024c :  // <0269> "
addr == 16'h25d ? 16'hfba0 :  // <0270> call :set_text_flag
addr == 16'h25e ? 16'h0498 :  // <0270> "
addr == 16'h25f ? 16'hfc00 :  // <0270> "
addr == 16'h260 ? 16'hf808 :  // <0271> pop rtna // end_func
addr == 16'h261 ? 16'hfc00 :  // <0271> end_func

// func wrap_history_idx
// :again
// b = $ign_history_len
// br lt :done
// b = ([negate $ign_history_len])
// a = a+b
// jmp :again
// :done
// end_func

// ######## event ign_capture_handler // = 0x0262
// discard outlier time.
addr == 16'h262 ? 16'h181c :  // <0285> g6 = ign_capture_jf
addr == 16'h263 ? 16'h4a00 :  // <0286> ram b = $ram_ign_fastest_jf // av_ad_hi = 0
addr == 16'h264 ? 16'h4e34 :  // <0286> ram b = $ram_ign_fastest_jf // av_ad_lo = 52
addr == 16'h265 ? 16'h0410 :  // <0286> ram b = $ram_ign_fastest_jf // b = av_write_data // start read cycle
addr == 16'h266 ? 16'h0411 :  // <0286> ram b = $ram_ign_fastest_jf // b = av_read_data // finish read cycle
addr == 16'h267 ? 16'h0006 :  // <0287> a = g6
addr == 16'h268 ? 16'he006 :  // <0288> br gt :fastest_ok
addr == 16'h269 ? 16'h026b :  // <0288> "
addr == 16'h26a ? 16'h1a00 :  // <0289> g6 = 0
// :fastest_ok // = 0x026b
addr == 16'h26b ? 16'h4a00 :  // <0291> ram b = $ram_ign_slowest_jf // av_ad_hi = 0
addr == 16'h26c ? 16'h4e36 :  // <0291> ram b = $ram_ign_slowest_jf // av_ad_lo = 54
addr == 16'h26d ? 16'h0410 :  // <0291> ram b = $ram_ign_slowest_jf // b = av_write_data // start read cycle
addr == 16'h26e ? 16'h0411 :  // <0291> ram b = $ram_ign_slowest_jf // b = av_read_data // finish read cycle
addr == 16'h26f ? 16'h0006 :  // <0292> a = g6
addr == 16'h270 ? 16'he005 :  // <0293> br lt :slowest_ok
addr == 16'h271 ? 16'h0273 :  // <0293> "
addr == 16'h272 ? 16'h1a00 :  // <0294> g6 = 0
// :slowest_ok // = 0x0273

// increment buffer index and memorize time.
addr == 16'h273 ? 16'h4a00 :  // <0298> ram a = $ram_ign_history_idx // av_ad_hi = 0
addr == 16'h274 ? 16'h4e0c :  // <0298> ram a = $ram_ign_history_idx // av_ad_lo = 12
addr == 16'h275 ? 16'h0010 :  // <0298> ram a = $ram_ign_history_idx // a = av_write_data // start read cycle
addr == 16'h276 ? 16'h0011 :  // <0298> ram a = $ram_ign_history_idx // a = av_read_data // finish read cycle
addr == 16'h277 ? 16'h0601 :  // <0299> b = 1
addr == 16'h278 ? 16'hc800 :  // <0300> a = a+b
addr == 16'h279 ? 16'h0300 :  // <0300> "
addr == 16'h27a ? 16'h060f :  // <0301> b = $ign_history_idx_mask
addr == 16'h27b ? 16'hc800 :  // <0302> a = and
addr == 16'h27c ? 16'h0330 :  // <0302> "
addr == 16'h27d ? 16'h4a00 :  // <0303> ram $ram_ign_history_idx = a // av_ad_hi = 0
addr == 16'h27e ? 16'h4e0c :  // <0303> ram $ram_ign_history_idx = a // av_ad_lo = 12
addr == 16'h27f ? 16'h4000 :  // <0303> ram $ram_ign_history_idx = a // av_write_data = a
addr == 16'h280 ? 16'h0406 :  // <0304> b = g6

addr == 16'h281 ? 16'h0351 :  // <0305> a = a<<1
addr == 16'h282 ? 16'h2001 :  // <0305> push b // push b
addr == 16'h283 ? 16'h060e :  // <0305> b = 14
addr == 16'h284 ? 16'h4a00 :  // <0305> av_ad_hi = 0
addr == 16'h285 ? 16'h4f00 :  // <0305> av_ad_lo = ad0
addr == 16'h286 ? 16'h4008 :  // <0305> pop av_write_data // pop av_write_data


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
// x = total, i = index = loop count, g6 = count of invalid samples.
addr == 16'h287 ? 16'h1200 :  // <0332> x = 0
addr == 16'h288 ? 16'h0a10 :  // <0333> i = $ign_history_len
addr == 16'h289 ? 16'h0f60 :  // <0334> j = -1
addr == 16'h28a ? 16'h1a00 :  // <0335> g6 = 0
// :next_avg // = 0x028b
addr == 16'h28b ? 16'hc800 :  // <0337> i = i+j
addr == 16'h28c ? 16'h0b10 :  // <0337> "
addr == 16'h28d ? 16'h0002 :  // <0338> a = i

addr == 16'h28e ? 16'h0351 :  // <0339> a = a<<1
addr == 16'h28f ? 16'h060e :  // <0339> b = 14
addr == 16'h290 ? 16'h4a00 :  // <0339> av_ad_hi = 0
addr == 16'h291 ? 16'h4f00 :  // <0339> av_ad_lo = ad0
addr == 16'h292 ? 16'h0410 :  // <0339> b = av_write_data
addr == 16'h293 ? 16'h0411 :  // <0339> b = av_read_data

addr == 16'h294 ? 16'h0200 :  // <0340> a = 0
addr == 16'h295 ? 16'he407 :  // <0341> bn eq :valid_sample
addr == 16'h296 ? 16'h029d :  // <0341> "
addr == 16'h297 ? 16'h0006 :  // <0342> a = g6
addr == 16'h298 ? 16'h0601 :  // <0343> b = 1
addr == 16'h299 ? 16'hc800 :  // <0344> g6 = a+b
addr == 16'h29a ? 16'h1b00 :  // <0344> "
addr == 16'h29b ? 16'he00f :  // <0345> jmp :sample_done
addr == 16'h29c ? 16'h02a3 :  // <0345> "
// :valid_sample // = 0x029d
addr == 16'h29d ? 16'h0208 :  // <0347> a = ($ign_history_len / 2)
addr == 16'h29e ? 16'hc800 :  // <0348> a = a+b
addr == 16'h29f ? 16'h0300 :  // <0348> "
addr == 16'h2a0 ? 16'h1753 :  // <0349> y = a>>$ign_history_idx_bits
addr == 16'h2a1 ? 16'hc800 :  // <0350> x = x+y
addr == 16'h2a2 ? 16'h1320 :  // <0350> "
// :sample_done // = 0x02a3
addr == 16'h2a3 ? 16'he401 :  // <0352> bn iz :next_avg
addr == 16'h2a4 ? 16'h028b :  // <0352> "
addr == 16'h2a5 ? 16'h4a00 :  // <0353> ram $ram_ign_avg_jf = x // av_ad_hi = 0
addr == 16'h2a6 ? 16'h4e2e :  // <0353> ram $ram_ign_avg_jf = x // av_ad_lo = 46
addr == 16'h2a7 ? 16'h4004 :  // <0353> ram $ram_ign_avg_jf = x // av_write_data = x
//patch: dividing before summing (instead of after) is much simpler and faster because it prevents overflow.
// but it means we could be reading as much as 16 jf too low (16 = ign_history_len).
// that error is way less than 1 RPM on the slow end,
// or about 1,000 RPM too fast on the fast end!
// might need to tighten that up.  one simple way might be adding ign_history_len / 2 to each history record prior to dividing.
// that didn't seem to help much in simple testing.

addr == 16'h2a8 ? 16'h0006 :  // <0361> a = g6
addr == 16'h2a9 ? 16'h0604 :  // <0362> b = ($ign_history_len / 4)
addr == 16'h2aa ? 16'he006 :  // <0363> br gt :partial_history
addr == 16'h2ab ? 16'h02b8 :  // <0363> "
// convert jiffies b to new RPM estimate.
addr == 16'h2ac ? 16'h0004 :  // <0365> a = x
addr == 16'h2ad ? 16'hfba0 :  // <0366> call :jf_to_rpm
addr == 16'h2ae ? 16'h04dc :  // <0366> "
addr == 16'h2af ? 16'hfc00 :  // <0366> "
addr == 16'h2b0 ? 16'h4a00 :  // <0367> ram $ram_avg_rpm = a // av_ad_hi = 0
addr == 16'h2b1 ? 16'h4e30 :  // <0367> ram $ram_avg_rpm = a // av_ad_lo = 48
addr == 16'h2b2 ? 16'h4000 :  // <0367> ram $ram_avg_rpm = a // av_write_data = a
addr == 16'h2b3 ? 16'h4a00 :  // <0368> ram $ram_rpm_valid = 1 // av_ad_hi = 0
addr == 16'h2b4 ? 16'h4e32 :  // <0368> ram $ram_rpm_valid = 1 // av_ad_lo = 50
addr == 16'h2b5 ? 16'h4201 :  // <0368> ram $ram_rpm_valid = 1 // av_write_data = 1
addr == 16'h2b6 ? 16'he00f :  // <0369> jmp :done
addr == 16'h2b7 ? 16'h0365 :  // <0369> "
// :partial_history // = 0x02b8
addr == 16'h2b8 ? 16'h4a00 :  // <0371> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h2b9 ? 16'h4e32 :  // <0371> ram $ram_rpm_valid = 0 // av_ad_lo = 50
addr == 16'h2ba ? 16'h4200 :  // <0371> ram $ram_rpm_valid = 0 // av_write_data = 0

// :done // = 0x02bb
addr == 16'h2bb ? 16'he00f :  // <0374> end_event
addr == 16'h2bc ? 16'h0077 :  // <0374> "

// ######## func clear_ign_history // = 0x02bd
addr == 16'h2bd ? 16'h2002 :  // <0376> push i // func clear_ign_history
addr == 16'h2be ? 16'h2003 :  // <0376> push j // "
// invalidate the RPM estimate.
addr == 16'h2bf ? 16'h4a00 :  // <0378> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h2c0 ? 16'h4e32 :  // <0378> ram $ram_rpm_valid = 0 // av_ad_lo = 50
addr == 16'h2c1 ? 16'h4200 :  // <0378> ram $ram_rpm_valid = 0 // av_write_data = 0
// the last known RPM estimate is retained here, not cleared.
// clear the history so it won't be valid again until several more valid samples are collected.
addr == 16'h2c2 ? 16'h0a10 :  // <0381> i = $ign_history_len
addr == 16'h2c3 ? 16'h0f60 :  // <0382> j = -1
// :next // = 0x02c4
addr == 16'h2c4 ? 16'h0002 :  // <0384> a = i
addr == 16'h2c5 ? 16'h0600 :  // <0385> b = 0

addr == 16'h2c6 ? 16'h0351 :  // <0386> a = a<<1
addr == 16'h2c7 ? 16'h2001 :  // <0386> push b // push b
addr == 16'h2c8 ? 16'h060e :  // <0386> b = 14
addr == 16'h2c9 ? 16'h4a00 :  // <0386> av_ad_hi = 0
addr == 16'h2ca ? 16'h4f00 :  // <0386> av_ad_lo = ad0
addr == 16'h2cb ? 16'h4008 :  // <0386> pop av_write_data // pop av_write_data

addr == 16'h2cc ? 16'hc800 :  // <0387> i = i+j
addr == 16'h2cd ? 16'h0b10 :  // <0387> "
addr == 16'h2ce ? 16'he401 :  // <0388> bn iz :next
addr == 16'h2cf ? 16'h02c4 :  // <0388> "
addr == 16'h2d0 ? 16'h0c08 :  // <0389> pop j // end_func
addr == 16'h2d1 ? 16'h0808 :  // <0389> pop i // "
addr == 16'h2d2 ? 16'hfc00 :  // <0389> end_func

// ######## event ign_capture_timeout_handler // = 0x02d3
// it's been too long since the last ignition pulse detect.
addr == 16'h2d3 ? 16'hfba0 :  // <0393> call :clear_ign_history
addr == 16'h2d4 ? 16'h02bd :  // <0393> "
addr == 16'h2d5 ? 16'hfc00 :  // <0393> "
addr == 16'h2d6 ? 16'he00f :  // <0394> end_event
addr == 16'h2d7 ? 16'h0077 :  // <0394> "

// ######## event ustimer0_handler // = 0x02d8
addr == 16'h2d8 ? 16'he00f :  // <0397> end_event
addr == 16'h2d9 ? 16'h0077 :  // <0397> "

// ######## event spi_done_handler // = 0x02da
// discard-counter in RAM.
addr == 16'h2da ? 16'h4a00 :  // <0401> ram a = $ram_daq_discard_cnt // av_ad_hi = 0
addr == 16'h2db ? 16'h4e06 :  // <0401> ram a = $ram_daq_discard_cnt // av_ad_lo = 6
addr == 16'h2dc ? 16'h0010 :  // <0401> ram a = $ram_daq_discard_cnt // a = av_write_data // start read cycle
addr == 16'h2dd ? 16'h0011 :  // <0401> ram a = $ram_daq_discard_cnt // a = av_read_data // finish read cycle
addr == 16'h2de ? 16'he000 :  // <0402> br az :report
addr == 16'h2df ? 16'h02ec :  // <0402> "
addr == 16'h2e0 ? 16'h0760 :  // <0403> b = -1
addr == 16'h2e1 ? 16'hc800 :  // <0404> a = a+b
addr == 16'h2e2 ? 16'h0300 :  // <0404> "
addr == 16'h2e3 ? 16'h4a00 :  // <0405> ram $ram_daq_discard_cnt = a // av_ad_hi = 0
addr == 16'h2e4 ? 16'h4e06 :  // <0405> ram $ram_daq_discard_cnt = a // av_ad_lo = 6
addr == 16'h2e5 ? 16'h4000 :  // <0405> ram $ram_daq_discard_cnt = a // av_write_data = a
addr == 16'h2e6 ? 16'h0207 :  // <0406> a = $anmux_adc_channel
addr == 16'h2e7 ? 16'hfba0 :  // <0407> call :begin_adc_conversion
addr == 16'h2e8 ? 16'h03ca :  // <0407> "
addr == 16'h2e9 ? 16'hfc00 :  // <0407> "
addr == 16'h2ea ? 16'he00f :  // <0408> event_return
addr == 16'h2eb ? 16'h0077 :  // <0408> "

// report ADC reading.
// :report // = 0x02ec
addr == 16'h2ec ? 16'h000f :  // <0412> a = spi_data
addr == 16'h2ed ? 16'hfba0 :  // <0413> call :put4x
addr == 16'h2ee ? 16'h00ac :  // <0413> "
addr == 16'h2ef ? 16'hfc00 :  // <0413> "

// decrement anmux channel & start waiting again.
addr == 16'h2f0 ? 16'hfba0 :  // <0416> call :anmux_get_chn
addr == 16'h2f1 ? 16'h009f :  // <0416> "
addr == 16'h2f2 ? 16'hfc00 :  // <0416> "
addr == 16'h2f3 ? 16'he000 :  // <0417> br az :all_done
addr == 16'h2f4 ? 16'h02fe :  // <0417> "
addr == 16'h2f5 ? 16'h0760 :  // <0418> b = -1
addr == 16'h2f6 ? 16'hc800 :  // <0419> a = a+b
addr == 16'h2f7 ? 16'h0300 :  // <0419> "
addr == 16'h2f8 ? 16'hfba0 :  // <0420> call :anmux_set_chn
addr == 16'h2f9 ? 16'h009b :  // <0420> "
addr == 16'h2fa ? 16'hfc00 :  // <0420> "
addr == 16'h2fb ? 16'h3a05 :  // <0421> mstimer1 = $anmux_settle_ms
addr == 16'h2fc ? 16'he00f :  // <0422> event_return
addr == 16'h2fd ? 16'h0077 :  // <0422> "

// end of daq pass.
// :all_done // = 0x02fe
addr == 16'h2fe ? 16'hfba0 :  // <0426> call :report_text_flags
addr == 16'h2ff ? 16'h04b1 :  // <0426> "
addr == 16'h300 ? 16'hfc00 :  // <0426> "
addr == 16'h301 ? 16'h020d :  // <0427> a = 13 // puteol
addr == 16'h302 ? 16'hfba0 :  // <0427> puteol
addr == 16'h303 ? 16'h0084 :  // <0427> "
addr == 16'h304 ? 16'hfc00 :  // <0427> "
addr == 16'h305 ? 16'h020a :  // <0427> a = 10 // puteol
addr == 16'h306 ? 16'hfba0 :  // <0427> puteol
addr == 16'h307 ? 16'h0084 :  // <0427> "
addr == 16'h308 ? 16'hfc00 :  // <0427> "
addr == 16'h309 ? 16'h4a00 :  // <0428> ram $ram_dial_setting = spi_data // av_ad_hi = 0
addr == 16'h30a ? 16'h4e3e :  // <0428> ram $ram_dial_setting = spi_data // av_ad_lo = 62
addr == 16'h30b ? 16'h400f :  // <0428> ram $ram_dial_setting = spi_data // av_write_data = spi_data
addr == 16'h30c ? 16'he00f :  // <0429> end_event
addr == 16'h30d ? 16'h0077 :  // <0429> "

// ######## event mstimer0_handler // = 0x030e
// unified 1-second periodic timer for all low-resolution tasks.

// start timer again.
addr == 16'h30e ? 16'h37a0 :  // <0435> mstimer0 = 1000
addr == 16'h30f ? 16'h03e8 :  // <0435> "

// realtime counters in RAM.
addr == 16'h310 ? 16'h4a00 :  // <0438> ram a = $ram_seconds_cnt // av_ad_hi = 0
addr == 16'h311 ? 16'h4e3a :  // <0438> ram a = $ram_seconds_cnt // av_ad_lo = 58
addr == 16'h312 ? 16'h0010 :  // <0438> ram a = $ram_seconds_cnt // a = av_write_data // start read cycle
addr == 16'h313 ? 16'h0011 :  // <0438> ram a = $ram_seconds_cnt // a = av_read_data // finish read cycle
addr == 16'h314 ? 16'h0601 :  // <0439> b = 1
addr == 16'h315 ? 16'hc800 :  // <0440> a = a+b
addr == 16'h316 ? 16'h0300 :  // <0440> "
addr == 16'h317 ? 16'h063c :  // <0441> b = 60
addr == 16'h318 ? 16'he407 :  // <0442> bn eq :same_minute
addr == 16'h319 ? 16'h032b :  // <0442> "
addr == 16'h31a ? 16'h4a00 :  // <0443> ram $ram_seconds_cnt = 0 // av_ad_hi = 0
addr == 16'h31b ? 16'h4e3a :  // <0443> ram $ram_seconds_cnt = 0 // av_ad_lo = 58
addr == 16'h31c ? 16'h4200 :  // <0443> ram $ram_seconds_cnt = 0 // av_write_data = 0
addr == 16'h31d ? 16'h4a00 :  // <0444> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h31e ? 16'h4e38 :  // <0444> ram a = $ram_minutes_cnt // av_ad_lo = 56
addr == 16'h31f ? 16'h0010 :  // <0444> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h320 ? 16'h0011 :  // <0444> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h321 ? 16'h0601 :  // <0445> b = 1
addr == 16'h322 ? 16'h4a00 :  // <0446> ram $ram_minutes_cnt = a+b // av_ad_hi = 0
addr == 16'h323 ? 16'h4e38 :  // <0446> ram $ram_minutes_cnt = a+b // av_ad_lo = 56
addr == 16'h324 ? 16'hc800 :  // <0446> ram $ram_minutes_cnt = a+b // av_write_data = a+b
addr == 16'h325 ? 16'h4300 :  // <0446> "
addr == 16'h326 ? 16'hfba0 :  // <0447> call :minute_events
addr == 16'h327 ? 16'h040d :  // <0447> "
addr == 16'h328 ? 16'hfc00 :  // <0447> "
addr == 16'h329 ? 16'he00f :  // <0448> jmp :minutes_done
addr == 16'h32a ? 16'h032e :  // <0448> "
// :same_minute // = 0x032b
addr == 16'h32b ? 16'h4a00 :  // <0450> ram $ram_seconds_cnt = a // av_ad_hi = 0
addr == 16'h32c ? 16'h4e3a :  // <0450> ram $ram_seconds_cnt = a // av_ad_lo = 58
addr == 16'h32d ? 16'h4000 :  // <0450> ram $ram_seconds_cnt = a // av_write_data = a
// :minutes_done // = 0x032e

addr == 16'h32e ? 16'hfba0 :  // <0453> call :check_power_relay
addr == 16'h32f ? 16'h0415 :  // <0453> "
addr == 16'h330 ? 16'hfc00 :  // <0453> "
addr == 16'h331 ? 16'hfba0 :  // <0454> call :check_communication
addr == 16'h332 ? 16'h0444 :  // <0454> "
addr == 16'h333 ? 16'hfc00 :  // <0454> "
addr == 16'h334 ? 16'hfba0 :  // <0455> call :start_daq_pass
addr == 16'h335 ? 16'h0396 :  // <0455> "
addr == 16'h336 ? 16'hfc00 :  // <0455> "
addr == 16'h337 ? 16'he00f :  // <0456> end_event
addr == 16'h338 ? 16'h0077 :  // <0456> "

// ######## event mstimer1_handler // = 0x0339
// start a reading from the current anmux channel.
addr == 16'h339 ? 16'h4a00 :  // <0460> ram $ram_daq_discard_cnt = $anmux_num_discards // av_ad_hi = 0
addr == 16'h33a ? 16'h4e06 :  // <0460> ram $ram_daq_discard_cnt = $anmux_num_discards // av_ad_lo = 6
addr == 16'h33b ? 16'h4202 :  // <0460> ram $ram_daq_discard_cnt = $anmux_num_discards // av_write_data = 2
addr == 16'h33c ? 16'h0220 :  // <0461> a = 32 // putasc " "
addr == 16'h33d ? 16'hfba0 :  // <0461> putasc " "
addr == 16'h33e ? 16'h0084 :  // <0461> "
addr == 16'h33f ? 16'hfc00 :  // <0461> "
addr == 16'h340 ? 16'h0273 :  // <0462> a = 115 // putasc "s"
addr == 16'h341 ? 16'hfba0 :  // <0462> putasc "s"
addr == 16'h342 ? 16'h0084 :  // <0462> "
addr == 16'h343 ? 16'hfc00 :  // <0462> "
addr == 16'h344 ? 16'hfba0 :  // <0463> call :anmux_get_chn
addr == 16'h345 ? 16'h009f :  // <0463> "
addr == 16'h346 ? 16'hfc00 :  // <0463> "
addr == 16'h347 ? 16'h0630 :  // <0464> b = 48 // asc b = "0"
addr == 16'h348 ? 16'hc800 :  // <0465> a = a+b // putchar a+b
addr == 16'h349 ? 16'h0300 :  // <0465> "
addr == 16'h34a ? 16'hfba0 :  // <0465> putchar a+b
addr == 16'h34b ? 16'h0084 :  // <0465> "
addr == 16'h34c ? 16'hfc00 :  // <0465> "
addr == 16'h34d ? 16'h023d :  // <0466> a = 61 // putasc "="
addr == 16'h34e ? 16'hfba0 :  // <0466> putasc "="
addr == 16'h34f ? 16'h0084 :  // <0466> "
addr == 16'h350 ? 16'hfc00 :  // <0466> "
addr == 16'h351 ? 16'h0207 :  // <0467> a = $anmux_adc_channel
addr == 16'h352 ? 16'hfba0 :  // <0468> call :begin_adc_conversion
addr == 16'h353 ? 16'h03ca :  // <0468> "
addr == 16'h354 ? 16'hfc00 :  // <0468> "
addr == 16'h355 ? 16'he00f :  // <0469> end_event
addr == 16'h356 ? 16'h0077 :  // <0469> "

// ######## event uart_rx_handler // = 0x0357
// :again // = 0x0357
addr == 16'h357 ? 16'hfba0 :  // <0473> pollchar
addr == 16'h358 ? 16'h0093 :  // <0473> "
addr == 16'h359 ? 16'hfc00 :  // <0473> "
addr == 16'h35a ? 16'h0760 :  // <0474> b = -1
addr == 16'h35b ? 16'he007 :  // <0475> br eq :done
addr == 16'h35c ? 16'h02bb :  // <0475> "
addr == 16'h35d ? 16'h060a :  // <0476> b = 10
addr == 16'h35e ? 16'he407 :  // <0477> bn eq :skip_lf
addr == 16'h35f ? 16'h0363 :  // <0477> "
addr == 16'h360 ? 16'hfba0 :  // <0478> call :postpone_comm_restart
addr == 16'h361 ? 16'h046f :  // <0478> "
addr == 16'h362 ? 16'hfc00 :  // <0478> "
// :skip_lf // = 0x0363
addr == 16'h363 ? 16'he00f :  // <0480> jmp :again
addr == 16'h364 ? 16'h0357 :  // <0480> "
// :done // = 0x0365
addr == 16'h365 ? 16'he00f :  // <0482> end_event
addr == 16'h366 ? 16'h0077 :  // <0482> "

// ######## event uart_rx_overflow_handler // = 0x0367
addr == 16'h367 ? 16'h5ba0 :  // <0485> error_halt_code $err_rx_overflow // leds = 0xfffe
addr == 16'h368 ? 16'hfffe :  // <0485> "
addr == 16'h369 ? 16'he00f :  // <0485> error_halt_code $err_rx_overflow
addr == 16'h36a ? 16'h0369 :  // <0485> "
addr == 16'h36b ? 16'he00f :  // <0486> end_event
addr == 16'h36c ? 16'h0077 :  // <0486> "

// ######## event uart_tx_overflow_handler // = 0x036d
addr == 16'h36d ? 16'h5ba0 :  // <0489> error_halt_code $err_tx_overflow // leds = 0xfffd
addr == 16'h36e ? 16'hfffd :  // <0489> "
addr == 16'h36f ? 16'he00f :  // <0489> error_halt_code $err_tx_overflow
addr == 16'h370 ? 16'h036f :  // <0489> "
addr == 16'h371 ? 16'he00f :  // <0490> end_event
addr == 16'h372 ? 16'h0077 :  // <0490> "

// ######## event key0_handler // = 0x0373
addr == 16'h373 ? 16'h026b :  // <0493> a = 107 // putasc "k"
addr == 16'h374 ? 16'hfba0 :  // <0493> putasc "k"
addr == 16'h375 ? 16'h0084 :  // <0493> "
addr == 16'h376 ? 16'hfc00 :  // <0493> "
addr == 16'h377 ? 16'h0230 :  // <0494> a = 48 // putasc "0"
addr == 16'h378 ? 16'hfba0 :  // <0494> putasc "0"
addr == 16'h379 ? 16'h0084 :  // <0494> "
addr == 16'h37a ? 16'hfc00 :  // <0494> "
addr == 16'h37b ? 16'he00f :  // <0495> end_event
addr == 16'h37c ? 16'h0077 :  // <0495> "

// ######## event key1_handler // = 0x037d
addr == 16'h37d ? 16'h026b :  // <0498> a = 107 // putasc "k"
addr == 16'h37e ? 16'hfba0 :  // <0498> putasc "k"
addr == 16'h37f ? 16'h0084 :  // <0498> "
addr == 16'h380 ? 16'hfc00 :  // <0498> "
addr == 16'h381 ? 16'h0231 :  // <0499> a = 49 // putasc "1"
addr == 16'h382 ? 16'hfba0 :  // <0499> putasc "1"
addr == 16'h383 ? 16'h0084 :  // <0499> "
addr == 16'h384 ? 16'hfc00 :  // <0499> "
addr == 16'h385 ? 16'he00f :  // <0500> end_event
addr == 16'h386 ? 16'h0077 :  // <0500> "

// ######## event softevent3_handler // = 0x0387
addr == 16'h387 ? 16'he00f :  // <0503> end_event
addr == 16'h388 ? 16'h0077 :  // <0503> "

// ######## event softevent2_handler // = 0x0389
addr == 16'h389 ? 16'he00f :  // <0506> end_event
addr == 16'h38a ? 16'h0077 :  // <0506> "

// ######## event softevent1_handler // = 0x038b
addr == 16'h38b ? 16'he00f :  // <0509> end_event
addr == 16'h38c ? 16'h0077 :  // <0509> "

// ######## event softevent0_handler // = 0x038d
addr == 16'h38d ? 16'he00f :  // <0512> end_event
addr == 16'h38e ? 16'h0077 :  // <0512> "

// :rpm_msg // = 0x038f
// ": rpm=\x0"
addr == 16'h38f ? 16'h203a :  // <0515>  :
addr == 16'h390 ? 16'h7072 :  // <0515> pr
addr == 16'h391 ? 16'h3d6d :  // <0515> =m
addr == 16'h392 ? 16'h0000 :  // <0515>   

// :puff_len_msg // = 0x0393
// " efi=\x0"
addr == 16'h393 ? 16'h6520 :  // <0518> e 
addr == 16'h394 ? 16'h6966 :  // <0518> if
addr == 16'h395 ? 16'h003d :  // <0518>  =

// ######## func start_daq_pass // = 0x0396
addr == 16'h396 ? 16'h2004 :  // <0520> push x // func start_daq_pass
addr == 16'h397 ? 16'h203e :  // <0520> push rtna // "
// daq pass counter in RAM.
addr == 16'h398 ? 16'h4a00 :  // <0522> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h399 ? 16'h4e04 :  // <0522> ram a = $ram_daq_pass_cnt // av_ad_lo = 4
addr == 16'h39a ? 16'h0010 :  // <0522> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h39b ? 16'h0011 :  // <0522> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h39c ? 16'h0601 :  // <0523> b = 1
addr == 16'h39d ? 16'hc800 :  // <0524> a = a+b
addr == 16'h39e ? 16'h0300 :  // <0524> "
addr == 16'h39f ? 16'h5800 :  // <0525> leds = a
addr == 16'h3a0 ? 16'h4a00 :  // <0526> ram $ram_daq_pass_cnt = a // av_ad_hi = 0
addr == 16'h3a1 ? 16'h4e04 :  // <0526> ram $ram_daq_pass_cnt = a // av_ad_lo = 4
addr == 16'h3a2 ? 16'h4000 :  // <0526> ram $ram_daq_pass_cnt = a // av_write_data = a
addr == 16'h3a3 ? 16'hfba0 :  // <0527> call :put4x
addr == 16'h3a4 ? 16'h00ac :  // <0527> "
addr == 16'h3a5 ? 16'hfc00 :  // <0527> "

addr == 16'h3a6 ? 16'h03a0 :  // <0529> a = :rpm_msg
addr == 16'h3a7 ? 16'h038f :  // <0529> "
addr == 16'h3a8 ? 16'hfba0 :  // <0530> call :print_nt
addr == 16'h3a9 ? 16'h0138 :  // <0530> "
addr == 16'h3aa ? 16'hfc00 :  // <0530> "
addr == 16'h3ab ? 16'h0200 :  // <0531> a = 0
addr == 16'h3ac ? 16'h4a00 :  // <0532> ram x = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h3ad ? 16'h4e32 :  // <0532> ram x = $ram_rpm_valid // av_ad_lo = 50
addr == 16'h3ae ? 16'h1010 :  // <0532> ram x = $ram_rpm_valid // x = av_write_data // start read cycle
addr == 16'h3af ? 16'h1011 :  // <0532> ram x = $ram_rpm_valid // x = av_read_data // finish read cycle
addr == 16'h3b0 ? 16'he002 :  // <0533> br xz :skip_rpm
addr == 16'h3b1 ? 16'h03b6 :  // <0533> "
addr == 16'h3b2 ? 16'h4a00 :  // <0534> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h3b3 ? 16'h4e30 :  // <0534> ram a = $ram_avg_rpm // av_ad_lo = 48
addr == 16'h3b4 ? 16'h0010 :  // <0534> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h3b5 ? 16'h0011 :  // <0534> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle
// :skip_rpm // = 0x03b6
addr == 16'h3b6 ? 16'hfba0 :  // <0536> call :put4x
addr == 16'h3b7 ? 16'h00ac :  // <0536> "
addr == 16'h3b8 ? 16'hfc00 :  // <0536> "

addr == 16'h3b9 ? 16'h03a0 :  // <0538> a = :puff_len_msg
addr == 16'h3ba ? 16'h0393 :  // <0538> "
addr == 16'h3bb ? 16'hfba0 :  // <0539> call :print_nt
addr == 16'h3bc ? 16'h0138 :  // <0539> "
addr == 16'h3bd ? 16'hfc00 :  // <0539> "
addr == 16'h3be ? 16'h001a :  // <0540> a = puff_len_us
addr == 16'h3bf ? 16'hfba0 :  // <0541> call :put4x
addr == 16'h3c0 ? 16'h00ac :  // <0541> "
addr == 16'h3c1 ? 16'hfc00 :  // <0541> "

// start to acquire & report all anmux channels.
addr == 16'h3c2 ? 16'h0207 :  // <0544> a = 7
addr == 16'h3c3 ? 16'hfba0 :  // <0545> call :anmux_set_chn
addr == 16'h3c4 ? 16'h009b :  // <0545> "
addr == 16'h3c5 ? 16'hfc00 :  // <0545> "
addr == 16'h3c6 ? 16'h3a05 :  // <0546> mstimer1 = $anmux_settle_ms

// // observe MCU utilization.
// a = usage_count
// call :put4x
// usage_count = 0
addr == 16'h3c7 ? 16'hf808 :  // <0552> pop rtna // end_func
addr == 16'h3c8 ? 16'h1008 :  // <0552> pop x // "
addr == 16'h3c9 ? 16'hfc00 :  // <0552> end_func

// ######## func begin_adc_conversion // = 0x03ca
// begin SPI transaction, specifying Nano ADC channel to take effect NEXT
// conversion after this one.  pass that in a.

addr == 16'h3ca ? 16'h0352 :  // <0558> a = a<<4
addr == 16'h3cb ? 16'h0352 :  // <0559> a = a<<4
addr == 16'h3cc ? 16'h0351 :  // <0560> a = a<<1
addr == 16'h3cd ? 16'h0351 :  // <0561> a = a<<1
addr == 16'h3ce ? 16'h0351 :  // <0562> a = a<<1
addr == 16'h3cf ? 16'h3c00 :  // <0563> spi_data = a
addr == 16'h3d0 ? 16'hfc00 :  // <0564> end_func

// ######## event power_lost_handler // = 0x03d1
// at this time we have less than 2 ms of usable run time left.

// this must be an uncommanded loss of main power, because if it was commanded,
// no more events would be handled; this event handler wouldn't have a chance to run.
// immediately set the power relay PWM to full power for a few seconds,
// in case the power relay opened accidentally e.g. due to a hard pothole.
addr == 16'h3d1 ? 16'h6600 :  // <0573> power_duty = $power_duty_closing
addr == 16'h3d2 ? 16'h4a00 :  // <0574> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h3d3 ? 16'h4e04 :  // <0574> ram a = $ram_daq_pass_cnt // av_ad_lo = 4
addr == 16'h3d4 ? 16'h0010 :  // <0574> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h3d5 ? 16'h0011 :  // <0574> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h3d6 ? 16'h0602 :  // <0575> b = $relay_hold_passes
addr == 16'h3d7 ? 16'h4a00 :  // <0576> ram $ram_relay_hold_at_pass = a+b // av_ad_hi = 0
addr == 16'h3d8 ? 16'h4e0a :  // <0576> ram $ram_relay_hold_at_pass = a+b // av_ad_lo = 10
addr == 16'h3d9 ? 16'hc800 :  // <0576> ram $ram_relay_hold_at_pass = a+b // av_write_data = a+b
addr == 16'h3da ? 16'h4300 :  // <0576> "

// pause any non-vital power-hogging operations, to conserve power for the EEPROM write.

// save persistent data in case the power remains down e.g. due to battery disconnect.
addr == 16'h3db ? 16'hfba0 :  // <0581> call :save_persistent_data
addr == 16'h3dc ? 16'h0443 :  // <0581> "
addr == 16'h3dd ? 16'hfc00 :  // <0581> "
addr == 16'h3de ? 16'he00f :  // <0582> end_event
addr == 16'h3df ? 16'h0077 :  // <0582> "

// :ign_off_msg // = 0x03e0
// "IGOF\x0"
addr == 16'h3e0 ? 16'h4749 :  // <0585> GI
addr == 16'h3e1 ? 16'h464f :  // <0585> FO
addr == 16'h3e2 ? 16'h0000 :  // <0585>   

// ######## event ign_switch_off_handler // = 0x03e3
// set power-down deadline in RAM.  this makes the system remain powered for several more minutes, for cooldown data logging.
addr == 16'h3e3 ? 16'h4a00 :  // <0589> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h3e4 ? 16'h4e38 :  // <0589> ram a = $ram_minutes_cnt // av_ad_lo = 56
addr == 16'h3e5 ? 16'h0010 :  // <0589> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h3e6 ? 16'h0011 :  // <0589> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h3e7 ? 16'h060a :  // <0590> b = $power_extend_minutes
addr == 16'h3e8 ? 16'h4a00 :  // <0591> ram $ram_power_down_at_min = a+b // av_ad_hi = 0
addr == 16'h3e9 ? 16'h4e08 :  // <0591> ram $ram_power_down_at_min = a+b // av_ad_lo = 8
addr == 16'h3ea ? 16'hc800 :  // <0591> ram $ram_power_down_at_min = a+b // av_write_data = a+b
addr == 16'h3eb ? 16'h4300 :  // <0591> "
addr == 16'h3ec ? 16'h03a0 :  // <0592> a = :ign_off_msg
addr == 16'h3ed ? 16'h03e0 :  // <0592> "
addr == 16'h3ee ? 16'hfba0 :  // <0593> call :set_text_flag
addr == 16'h3ef ? 16'h0498 :  // <0593> "
addr == 16'h3f0 ? 16'hfc00 :  // <0593> "
addr == 16'h3f1 ? 16'he00f :  // <0594> end_event
addr == 16'h3f2 ? 16'h0077 :  // <0594> "

// :ign_on_msg // = 0x03f3
// "IGON\x0"
addr == 16'h3f3 ? 16'h4749 :  // <0597> GI
addr == 16'h3f4 ? 16'h4e4f :  // <0597> NO
addr == 16'h3f5 ? 16'h0000 :  // <0597>   

// ######## event ign_switch_on_handler // = 0x03f6
addr == 16'h3f6 ? 16'h4a00 :  // <0600> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h3f7 ? 16'h4e08 :  // <0600> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 8
addr == 16'h3f8 ? 16'h4360 :  // <0600> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h3f9 ? 16'h03a0 :  // <0601> a = :ign_on_msg
addr == 16'h3fa ? 16'h03f3 :  // <0601> "
addr == 16'h3fb ? 16'hfba0 :  // <0602> call :set_text_flag
addr == 16'h3fc ? 16'h0498 :  // <0602> "
addr == 16'h3fd ? 16'hfc00 :  // <0602> "
addr == 16'h3fe ? 16'he00f :  // <0603> end_event
addr == 16'h3ff ? 16'h0077 :  // <0603> "

// ######## event puff1_done_handler // = 0x0400
addr == 16'h400 ? 16'h4a00 :  // <0606> ram a = $ram_dial_setting // av_ad_hi = 0
addr == 16'h401 ? 16'h4e3e :  // <0606> ram a = $ram_dial_setting // av_ad_lo = 62
addr == 16'h402 ? 16'h0010 :  // <0606> ram a = $ram_dial_setting // a = av_write_data // start read cycle
addr == 16'h403 ? 16'h0011 :  // <0606> ram a = $ram_dial_setting // a = av_read_data // finish read cycle
addr == 16'h404 ? 16'h0351 :  // <0607> a = a<<1
addr == 16'h405 ? 16'h0351 :  // <0608> a = a<<1
addr == 16'h406 ? 16'h0351 :  // <0609> a = a<<1
addr == 16'h407 ? 16'he400 :  // <0610> bn az :nonzero
addr == 16'h408 ? 16'h040a :  // <0610> "
addr == 16'h409 ? 16'h0201 :  // <0611> a = 1
// :nonzero // = 0x040a
addr == 16'h40a ? 16'h6800 :  // <0613> puff_len_us = a
addr == 16'h40b ? 16'he00f :  // <0614> end_event
addr == 16'h40c ? 16'h0077 :  // <0614> "

// ######## func minute_events // = 0x040d
addr == 16'h40d ? 16'h203e :  // <0616> push rtna // func minute_events
addr == 16'h40e ? 16'hfba0 :  // <0617> call :check_power_down
addr == 16'h40f ? 16'h0428 :  // <0617> "
addr == 16'h410 ? 16'hfc00 :  // <0617> "
addr == 16'h411 ? 16'hf808 :  // <0618> pop rtna // end_func
addr == 16'h412 ? 16'hfc00 :  // <0618> end_func

// :power_hold_msg // = 0x0413
// "PWH\x0"
addr == 16'h413 ? 16'h5750 :  // <0621> WP
addr == 16'h414 ? 16'h0048 :  // <0621>  H

// ######## func check_power_relay // = 0x0415
addr == 16'h415 ? 16'h203e :  // <0623> push rtna // func check_power_relay
addr == 16'h416 ? 16'h4a00 :  // <0624> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h417 ? 16'h4e04 :  // <0624> ram a = $ram_daq_pass_cnt // av_ad_lo = 4
addr == 16'h418 ? 16'h0010 :  // <0624> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h419 ? 16'h0011 :  // <0624> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h41a ? 16'h4a00 :  // <0625> ram b = $ram_relay_hold_at_pass // av_ad_hi = 0
addr == 16'h41b ? 16'h4e0a :  // <0625> ram b = $ram_relay_hold_at_pass // av_ad_lo = 10
addr == 16'h41c ? 16'h0410 :  // <0625> ram b = $ram_relay_hold_at_pass // b = av_write_data // start read cycle
addr == 16'h41d ? 16'h0411 :  // <0625> ram b = $ram_relay_hold_at_pass // b = av_read_data // finish read cycle
addr == 16'h41e ? 16'he407 :  // <0626> bn eq :done
addr == 16'h41f ? 16'h0426 :  // <0626> "
// time to begin "solenoid saver" coil power reduction by PWM.
addr == 16'h420 ? 16'h6619 :  // <0628> power_duty = $power_duty_holding
addr == 16'h421 ? 16'h03a0 :  // <0629> a = :power_hold_msg
addr == 16'h422 ? 16'h0413 :  // <0629> "
addr == 16'h423 ? 16'hfba0 :  // <0630> call :set_text_flag
addr == 16'h424 ? 16'h0498 :  // <0630> "
addr == 16'h425 ? 16'hfc00 :  // <0630> "
// :done // = 0x0426
addr == 16'h426 ? 16'hf808 :  // <0632> pop rtna // end_func
addr == 16'h427 ? 16'hfc00 :  // <0632> end_func

// ######## func check_power_down // = 0x0428
addr == 16'h428 ? 16'h203e :  // <0634> push rtna // func check_power_down
// check power-down deadline in RAM.
addr == 16'h429 ? 16'h4a00 :  // <0636> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h42a ? 16'h4e38 :  // <0636> ram a = $ram_minutes_cnt // av_ad_lo = 56
addr == 16'h42b ? 16'h0010 :  // <0636> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h42c ? 16'h0011 :  // <0636> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h42d ? 16'h4a00 :  // <0637> ram b = $ram_power_down_at_min // av_ad_hi = 0
addr == 16'h42e ? 16'h4e08 :  // <0637> ram b = $ram_power_down_at_min // av_ad_lo = 8
addr == 16'h42f ? 16'h0410 :  // <0637> ram b = $ram_power_down_at_min // b = av_write_data // start read cycle
addr == 16'h430 ? 16'h0411 :  // <0637> ram b = $ram_power_down_at_min // b = av_read_data // finish read cycle
addr == 16'h431 ? 16'he407 :  // <0638> bn eq :done
addr == 16'h432 ? 16'h0436 :  // <0638> "
addr == 16'h433 ? 16'hfba0 :  // <0639> call :power_down
addr == 16'h434 ? 16'h0438 :  // <0639> "
addr == 16'h435 ? 16'hfc00 :  // <0639> "
// :done // = 0x0436
addr == 16'h436 ? 16'hf808 :  // <0641> pop rtna // end_func
addr == 16'h437 ? 16'hfc00 :  // <0641> end_func

// ######## func power_down // = 0x0438
addr == 16'h438 ? 16'h203e :  // <0643> push rtna // func power_down
// this function never returns.
addr == 16'h439 ? 16'hfba0 :  // <0645> call :save_persistent_data
addr == 16'h43a ? 16'h0443 :  // <0645> "
addr == 16'h43b ? 16'hfc00 :  // <0645> "
addr == 16'h43c ? 16'h6632 :  // <0646> power_duty = $power_duty_opening
addr == 16'h43d ? 16'h5ba0 :  // <0647> error_halt_code $err_power_down // leds = 0xfffc
addr == 16'h43e ? 16'hfffc :  // <0647> "
addr == 16'h43f ? 16'he00f :  // <0647> error_halt_code $err_power_down
addr == 16'h440 ? 16'h043f :  // <0647> "
addr == 16'h441 ? 16'hf808 :  // <0648> pop rtna // end_func
addr == 16'h442 ? 16'hfc00 :  // <0648> end_func

// ######## func save_persistent_data // = 0x0443
addr == 16'h443 ? 16'hfc00 :  // <0651> end_func

// ######## func check_communication // = 0x0444
addr == 16'h444 ? 16'h203e :  // <0653> push rtna // func check_communication
addr == 16'h445 ? 16'h4a00 :  // <0654> ram a = $ram_ftdi_downtime_remain_sec // av_ad_hi = 0
addr == 16'h446 ? 16'h4e02 :  // <0654> ram a = $ram_ftdi_downtime_remain_sec // av_ad_lo = 2
addr == 16'h447 ? 16'h0010 :  // <0654> ram a = $ram_ftdi_downtime_remain_sec // a = av_write_data // start read cycle
addr == 16'h448 ? 16'h0011 :  // <0654> ram a = $ram_ftdi_downtime_remain_sec // a = av_read_data // finish read cycle
addr == 16'h449 ? 16'he000 :  // <0655> br az :skip_ftdi_powerup
addr == 16'h44a ? 16'h045a :  // <0655> "
addr == 16'h44b ? 16'h0760 :  // <0656> b = -1
addr == 16'h44c ? 16'hc800 :  // <0657> a = a+b
addr == 16'h44d ? 16'h0300 :  // <0657> "
addr == 16'h44e ? 16'h4a00 :  // <0658> ram $ram_ftdi_downtime_remain_sec = a // av_ad_hi = 0
addr == 16'h44f ? 16'h4e02 :  // <0658> ram $ram_ftdi_downtime_remain_sec = a // av_ad_lo = 2
addr == 16'h450 ? 16'h4000 :  // <0658> ram $ram_ftdi_downtime_remain_sec = a // av_write_data = a
addr == 16'h451 ? 16'he000 :  // <0659> br az :do_power_on
addr == 16'h452 ? 16'h0455 :  // <0659> "
addr == 16'h453 ? 16'hf808 :  // <0660> pop rtna // rtn
addr == 16'h454 ? 16'hfc00 :  // <0660> rtn
// :do_power_on // = 0x0455
addr == 16'h455 ? 16'hfba0 :  // <0662> call :ftdi_power_on
addr == 16'h456 ? 16'h048c :  // <0662> "
addr == 16'h457 ? 16'hfc00 :  // <0662> "
addr == 16'h458 ? 16'hf808 :  // <0663> pop rtna // rtn
addr == 16'h459 ? 16'hfc00 :  // <0663> rtn
// :skip_ftdi_powerup // = 0x045a

addr == 16'h45a ? 16'h4a00 :  // <0666> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h45b ? 16'h4e38 :  // <0666> ram a = $ram_minutes_cnt // av_ad_lo = 56
addr == 16'h45c ? 16'h0010 :  // <0666> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h45d ? 16'h0011 :  // <0666> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h45e ? 16'h4a00 :  // <0667> ram b = $ram_comm_restart_at_min // av_ad_hi = 0
addr == 16'h45f ? 16'h4e00 :  // <0667> ram b = $ram_comm_restart_at_min // av_ad_lo = 0
addr == 16'h460 ? 16'h0410 :  // <0667> ram b = $ram_comm_restart_at_min // b = av_write_data // start read cycle
addr == 16'h461 ? 16'h0411 :  // <0667> ram b = $ram_comm_restart_at_min // b = av_read_data // finish read cycle
addr == 16'h462 ? 16'he407 :  // <0668> bn eq :done
addr == 16'h463 ? 16'h046d :  // <0668> "
// comm restart is required.
addr == 16'h464 ? 16'hfba0 :  // <0670> call :postpone_comm_restart
addr == 16'h465 ? 16'h046f :  // <0670> "
addr == 16'h466 ? 16'hfc00 :  // <0670> "
addr == 16'h467 ? 16'h4a00 :  // <0671> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_hi = 0
addr == 16'h468 ? 16'h4e02 :  // <0671> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_lo = 2
addr == 16'h469 ? 16'h4205 :  // <0671> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_write_data = 5
addr == 16'h46a ? 16'hfba0 :  // <0672> call :ftdi_power_off
addr == 16'h46b ? 16'h047c :  // <0672> "
addr == 16'h46c ? 16'hfc00 :  // <0672> "
// :done // = 0x046d
addr == 16'h46d ? 16'hf808 :  // <0674> pop rtna // end_func
addr == 16'h46e ? 16'hfc00 :  // <0674> end_func

// ######## func postpone_comm_restart // = 0x046f
addr == 16'h46f ? 16'h4a00 :  // <0677> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h470 ? 16'h4e38 :  // <0677> ram a = $ram_minutes_cnt // av_ad_lo = 56
addr == 16'h471 ? 16'h0010 :  // <0677> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h472 ? 16'h0011 :  // <0677> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h473 ? 16'h0602 :  // <0678> b = $comm_grace_period_min
addr == 16'h474 ? 16'h4a00 :  // <0679> ram $ram_comm_restart_at_min = a+b // av_ad_hi = 0
addr == 16'h475 ? 16'h4e00 :  // <0679> ram $ram_comm_restart_at_min = a+b // av_ad_lo = 0
addr == 16'h476 ? 16'hc800 :  // <0679> ram $ram_comm_restart_at_min = a+b // av_write_data = a+b
addr == 16'h477 ? 16'h4300 :  // <0679> "
addr == 16'h478 ? 16'hfc00 :  // <0680> end_func

// :ftdi_off_msg // = 0x0479
// "FTOF\x0"
addr == 16'h479 ? 16'h5446 :  // <0683> TF
addr == 16'h47a ? 16'h464f :  // <0683> FO
addr == 16'h47b ? 16'h0000 :  // <0683>   

// ######## func ftdi_power_off // = 0x047c
addr == 16'h47c ? 16'h203e :  // <0685> push rtna // func ftdi_power_off
addr == 16'h47d ? 16'h0017 :  // <0686> a = board_ctrl
addr == 16'h47e ? 16'h07a0 :  // <0687> b = $not_ftdi_power_mask
addr == 16'h47f ? 16'hff7f :  // <0687> "
addr == 16'h480 ? 16'hc800 :  // <0688> board_ctrl = and
addr == 16'h481 ? 16'h5f30 :  // <0688> "
addr == 16'h482 ? 16'h03a0 :  // <0689> a = :ftdi_off_msg
addr == 16'h483 ? 16'h0479 :  // <0689> "
addr == 16'h484 ? 16'hfba0 :  // <0690> call :set_text_flag
addr == 16'h485 ? 16'h0498 :  // <0690> "
addr == 16'h486 ? 16'hfc00 :  // <0690> "
addr == 16'h487 ? 16'hf808 :  // <0691> pop rtna // end_func
addr == 16'h488 ? 16'hfc00 :  // <0691> end_func

// :ftdi_on_msg // = 0x0489
// "FTON\x0"
addr == 16'h489 ? 16'h5446 :  // <0694> TF
addr == 16'h48a ? 16'h4e4f :  // <0694> NO
addr == 16'h48b ? 16'h0000 :  // <0694>   

// ######## func ftdi_power_on // = 0x048c
addr == 16'h48c ? 16'h203e :  // <0696> push rtna // func ftdi_power_on
addr == 16'h48d ? 16'h0017 :  // <0697> a = board_ctrl
addr == 16'h48e ? 16'h0680 :  // <0698> b = $ftdi_power_mask
addr == 16'h48f ? 16'hc800 :  // <0699> board_ctrl = or
addr == 16'h490 ? 16'h5f34 :  // <0699> "
addr == 16'h491 ? 16'h03a0 :  // <0700> a = :ftdi_on_msg
addr == 16'h492 ? 16'h0489 :  // <0700> "
addr == 16'h493 ? 16'hfba0 :  // <0701> call :set_text_flag
addr == 16'h494 ? 16'h0498 :  // <0701> "
addr == 16'h495 ? 16'hfc00 :  // <0701> "
addr == 16'h496 ? 16'hf808 :  // <0702> pop rtna // end_func
addr == 16'h497 ? 16'hfc00 :  // <0702> end_func

// ######## func set_text_flag // = 0x0498
addr == 16'h498 ? 16'h0400 :  // <0705> b = a
addr == 16'h499 ? 16'h4a00 :  // <0706> ram a = $ram_next_tfp_idx // av_ad_hi = 0
addr == 16'h49a ? 16'h4e50 :  // <0706> ram a = $ram_next_tfp_idx // av_ad_lo = 80
addr == 16'h49b ? 16'h0010 :  // <0706> ram a = $ram_next_tfp_idx // a = av_write_data // start read cycle
addr == 16'h49c ? 16'h0011 :  // <0706> ram a = $ram_next_tfp_idx // a = av_read_data // finish read cycle
addr == 16'h49d ? 16'h2000 :  // <0707> push a // push a

addr == 16'h49e ? 16'h0351 :  // <0708> a = a<<1
addr == 16'h49f ? 16'h2001 :  // <0708> push b // push b
addr == 16'h4a0 ? 16'h0640 :  // <0708> b = 64
addr == 16'h4a1 ? 16'h4a00 :  // <0708> av_ad_hi = 0
addr == 16'h4a2 ? 16'h4f00 :  // <0708> av_ad_lo = ad0
addr == 16'h4a3 ? 16'h4008 :  // <0708> pop av_write_data // pop av_write_data

addr == 16'h4a4 ? 16'h0008 :  // <0709> pop a // pop a
addr == 16'h4a5 ? 16'h0760 :  // <0710> b = -1
addr == 16'h4a6 ? 16'hc800 :  // <0711> a = a+b
addr == 16'h4a7 ? 16'h0300 :  // <0711> "
addr == 16'h4a8 ? 16'h0607 :  // <0712> b = $tfp_mask
addr == 16'h4a9 ? 16'h4a00 :  // <0713> ram $ram_next_tfp_idx = and // av_ad_hi = 0
addr == 16'h4aa ? 16'h4e50 :  // <0713> ram $ram_next_tfp_idx = and // av_ad_lo = 80
addr == 16'h4ab ? 16'hc800 :  // <0713> ram $ram_next_tfp_idx = and // av_write_data = and
addr == 16'h4ac ? 16'h4330 :  // <0713> "
addr == 16'h4ad ? 16'hfc00 :  // <0714> end_func

// :text_flags_msg // = 0x04ae
// " tf=\x0"
addr == 16'h4ae ? 16'h7420 :  // <0717> t 
addr == 16'h4af ? 16'h3d66 :  // <0717> =f
addr == 16'h4b0 ? 16'h0000 :  // <0717>   

// ######## func report_text_flags // = 0x04b1
addr == 16'h4b1 ? 16'h2002 :  // <0719> push i // func report_text_flags
addr == 16'h4b2 ? 16'h2003 :  // <0719> push j // "
addr == 16'h4b3 ? 16'h203e :  // <0719> push rtna // "
addr == 16'h4b4 ? 16'h03a0 :  // <0720> a = :text_flags_msg
addr == 16'h4b5 ? 16'h04ae :  // <0720> "
addr == 16'h4b6 ? 16'hfba0 :  // <0721> call :print_nt
addr == 16'h4b7 ? 16'h0138 :  // <0721> "
addr == 16'h4b8 ? 16'hfc00 :  // <0721> "
addr == 16'h4b9 ? 16'h0a08 :  // <0722> i = $num_text_flag_pointers
addr == 16'h4ba ? 16'h0f60 :  // <0723> j = -1
// :next_ptr // = 0x04bb
addr == 16'h4bb ? 16'hc800 :  // <0725> i = i+j
addr == 16'h4bc ? 16'h0b10 :  // <0725> "
addr == 16'h4bd ? 16'h0002 :  // <0726> a = i

addr == 16'h4be ? 16'h0351 :  // <0727> a = a<<1
addr == 16'h4bf ? 16'h0640 :  // <0727> b = 64
addr == 16'h4c0 ? 16'h4a00 :  // <0727> av_ad_hi = 0
addr == 16'h4c1 ? 16'h4f00 :  // <0727> av_ad_lo = ad0
addr == 16'h4c2 ? 16'h0410 :  // <0727> b = av_write_data
addr == 16'h4c3 ? 16'h0411 :  // <0727> b = av_read_data

addr == 16'h4c4 ? 16'h0001 :  // <0728> a = b
addr == 16'h4c5 ? 16'he000 :  // <0729> br az :skip
addr == 16'h4c6 ? 16'h04d6 :  // <0729> "
addr == 16'h4c7 ? 16'hfba0 :  // <0730> call :print_nt
addr == 16'h4c8 ? 16'h0138 :  // <0730> "
addr == 16'h4c9 ? 16'hfc00 :  // <0730> "
addr == 16'h4ca ? 16'h022c :  // <0731> a = 44 // putasc ","
addr == 16'h4cb ? 16'hfba0 :  // <0731> putasc ","
addr == 16'h4cc ? 16'h0084 :  // <0731> "
addr == 16'h4cd ? 16'hfc00 :  // <0731> "
addr == 16'h4ce ? 16'h0002 :  // <0732> a = i
addr == 16'h4cf ? 16'h0600 :  // <0733> b = 0

addr == 16'h4d0 ? 16'h0351 :  // <0734> a = a<<1
addr == 16'h4d1 ? 16'h2001 :  // <0734> push b // push b
addr == 16'h4d2 ? 16'h0640 :  // <0734> b = 64
addr == 16'h4d3 ? 16'h4a00 :  // <0734> av_ad_hi = 0
addr == 16'h4d4 ? 16'h4f00 :  // <0734> av_ad_lo = ad0
addr == 16'h4d5 ? 16'h4008 :  // <0734> pop av_write_data // pop av_write_data

// :skip // = 0x04d6
addr == 16'h4d6 ? 16'he401 :  // <0736> bn iz :next_ptr
addr == 16'h4d7 ? 16'h04bb :  // <0736> "
addr == 16'h4d8 ? 16'hf808 :  // <0737> pop rtna // end_func
addr == 16'h4d9 ? 16'h0c08 :  // <0737> pop j // "
addr == 16'h4da ? 16'h0808 :  // <0737> pop i // "
addr == 16'h4db ? 16'hfc00 :  // <0737> end_func

// ######## func jf_to_rpm // = 0x04dc
addr == 16'h4dc ? 16'h203e :  // <0739> push rtna // func jf_to_rpm
// pass jiffies in a.  return rpm in a.
// resolution = 32 rpm.
addr == 16'h4dd ? 16'h0400 :  // <0742> b = a
addr == 16'h4de ? 16'h03a0 :  // <0743> a = 0x5573
addr == 16'h4df ? 16'h5573 :  // <0743> "
// = 700000 >> 5
addr == 16'h4e0 ? 16'hfba0 :  // <0745> call :divide
addr == 16'h4e1 ? 16'h0175 :  // <0745> "
addr == 16'h4e2 ? 16'hfc00 :  // <0745> "
addr == 16'h4e3 ? 16'h0001 :  // <0746> a = b
addr == 16'h4e4 ? 16'h0352 :  // <0747> a = a<<4
addr == 16'h4e5 ? 16'h0351 :  // <0748> a = a<<1
addr == 16'h4e6 ? 16'hf808 :  // <0749> pop rtna // end_func
addr == 16'h4e7 ? 16'hfc00 :  // <0749> end_func

        
                16'hxxxx;
        endmodule
    
