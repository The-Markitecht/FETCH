
        `include "header.v"

        module target_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.

addr == 16'h00 ? 16'he00f :  // <0004> jmp :main
addr == 16'h01 ? 16'h05a9 :  // <0004> "


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
// patch: g6, g7 obsolete.

// throttle for each pass of data acquisition.
// delay for anmux settling.
// engine plan tick timer.


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





// ADC handling.

// power relay duty cycles, in microseconds.  duty cycle time = relay OFF time.
// relay actually remains energized for about another 5 us after pwm goes high,
// due to the optocoupler pullup taking some time to climb through the MOSFET's threshold.

// realtime counting.

// text flag reporting.

// error code constants.

// ignition time capture.
// all ignition time vars are expressed in jf "jiffies" or "jf".
// 5000 RPM = about 140 jf between rising edges on chevy ignition white wire.
// 1000 RPM = about 700 jf
//  100 RPM = about 7000 jf
//   22 RPM = about 32000 jf, the slowest figure that's safe for the divide routine.

// fuel injection puff driver.
// SETTING puff_len_us NON-ZERO ENABLES FUEL INJECTION!!  zero disables it.
// MUST SET ign_timeout_len_jf NON-ZERO PRIOR TO ENABLING!
// otherwise the module latches up in a non-working state.

// engine state management.  each engine state is called a "plan".

addr == 16'h02 ? 16'h0022 :  // <0188> emit_debugger_register_table  counter
// "       a"
addr == 16'h03 ? 16'h2020 :  // <0188>   
addr == 16'h04 ? 16'h2020 :  // <0188>   
addr == 16'h05 ? 16'h2020 :  // <0188>   
addr == 16'h06 ? 16'h6120 :  // <0188> a 
// "       b"
addr == 16'h07 ? 16'h2020 :  // <0188>   
addr == 16'h08 ? 16'h2020 :  // <0188>   
addr == 16'h09 ? 16'h2020 :  // <0188>   
addr == 16'h0a ? 16'h6220 :  // <0188> b 
// "       i"
addr == 16'h0b ? 16'h2020 :  // <0188>   
addr == 16'h0c ? 16'h2020 :  // <0188>   
addr == 16'h0d ? 16'h2020 :  // <0188>   
addr == 16'h0e ? 16'h6920 :  // <0188> i 
// "       j"
addr == 16'h0f ? 16'h2020 :  // <0188>   
addr == 16'h10 ? 16'h2020 :  // <0188>   
addr == 16'h11 ? 16'h2020 :  // <0188>   
addr == 16'h12 ? 16'h6a20 :  // <0188> j 
// "       x"
addr == 16'h13 ? 16'h2020 :  // <0188>   
addr == 16'h14 ? 16'h2020 :  // <0188>   
addr == 16'h15 ? 16'h2020 :  // <0188>   
addr == 16'h16 ? 16'h7820 :  // <0188> x 
// "       y"
addr == 16'h17 ? 16'h2020 :  // <0188>   
addr == 16'h18 ? 16'h2020 :  // <0188>   
addr == 16'h19 ? 16'h2020 :  // <0188>   
addr == 16'h1a ? 16'h7920 :  // <0188> y 
// "      ga"
addr == 16'h1b ? 16'h2020 :  // <0188>   
addr == 16'h1c ? 16'h2020 :  // <0188>   
addr == 16'h1d ? 16'h2020 :  // <0188>   
addr == 16'h1e ? 16'h6167 :  // <0188> ag
// "      gb"
addr == 16'h1f ? 16'h2020 :  // <0188>   
addr == 16'h20 ? 16'h2020 :  // <0188>   
addr == 16'h21 ? 16'h2020 :  // <0188>   
addr == 16'h22 ? 16'h6267 :  // <0188> bg
// "      pa"
addr == 16'h23 ? 16'h2020 :  // <0188>   
addr == 16'h24 ? 16'h2020 :  // <0188>   
addr == 16'h25 ? 16'h2020 :  // <0188>   
addr == 16'h26 ? 16'h6170 :  // <0188> ap
// "      pb"
addr == 16'h27 ? 16'h2020 :  // <0188>   
addr == 16'h28 ? 16'h2020 :  // <0188>   
addr == 16'h29 ? 16'h2020 :  // <0188>   
addr == 16'h2a ? 16'h6270 :  // <0188> bp
// "      pc"
addr == 16'h2b ? 16'h2020 :  // <0188>   
addr == 16'h2c ? 16'h2020 :  // <0188>   
addr == 16'h2d ? 16'h2020 :  // <0188>   
addr == 16'h2e ? 16'h6370 :  // <0188> cp
// "      pd"
addr == 16'h2f ? 16'h2020 :  // <0188>   
addr == 16'h30 ? 16'h2020 :  // <0188>   
addr == 16'h31 ? 16'h2020 :  // <0188>   
addr == 16'h32 ? 16'h6470 :  // <0188> dp
// "//rstk  "
addr == 16'h33 ? 16'h2f2f :  // <0188> //
addr == 16'h34 ? 16'h7372 :  // <0188> sr
addr == 16'h35 ? 16'h6b74 :  // <0188> kt
addr == 16'h36 ? 16'h2020 :  // <0188>   
// "  ev_pri"
addr == 16'h37 ? 16'h2020 :  // <0188>   
addr == 16'h38 ? 16'h7665 :  // <0188> ve
addr == 16'h39 ? 16'h705f :  // <0188> p_
addr == 16'h3a ? 16'h6972 :  // <0188> ir
// "softevnt"
addr == 16'h3b ? 16'h6f73 :  // <0188> os
addr == 16'h3c ? 16'h7466 :  // <0188> tf
addr == 16'h3d ? 16'h7665 :  // <0188> ve
addr == 16'h3e ? 16'h746e :  // <0188> tn
// "   usage"
addr == 16'h3f ? 16'h2020 :  // <0188>   
addr == 16'h40 ? 16'h7520 :  // <0188> u 
addr == 16'h41 ? 16'h6173 :  // <0188> as
addr == 16'h42 ? 16'h6567 :  // <0188> eg
// "ustimer0"
addr == 16'h43 ? 16'h7375 :  // <0188> su
addr == 16'h44 ? 16'h6974 :  // <0188> it
addr == 16'h45 ? 16'h656d :  // <0188> em
addr == 16'h46 ? 16'h3072 :  // <0188> 0r
// "mstimer0"
addr == 16'h47 ? 16'h736d :  // <0188> sm
addr == 16'h48 ? 16'h6974 :  // <0188> it
addr == 16'h49 ? 16'h656d :  // <0188> em
addr == 16'h4a ? 16'h3072 :  // <0188> 0r
// "mstimer1"
addr == 16'h4b ? 16'h736d :  // <0188> sm
addr == 16'h4c ? 16'h6974 :  // <0188> it
addr == 16'h4d ? 16'h656d :  // <0188> em
addr == 16'h4e ? 16'h3172 :  // <0188> 1r
// "mstimer2"
addr == 16'h4f ? 16'h736d :  // <0188> sm
addr == 16'h50 ? 16'h6974 :  // <0188> it
addr == 16'h51 ? 16'h656d :  // <0188> em
addr == 16'h52 ? 16'h3272 :  // <0188> 2r
// "spi_data"
addr == 16'h53 ? 16'h7073 :  // <0188> ps
addr == 16'h54 ? 16'h5f69 :  // <0188> _i
addr == 16'h55 ? 16'h6164 :  // <0188> ad
addr == 16'h56 ? 16'h6174 :  // <0188> at
// "//avwrdt"
addr == 16'h57 ? 16'h2f2f :  // <0188> //
addr == 16'h58 ? 16'h7661 :  // <0188> va
addr == 16'h59 ? 16'h7277 :  // <0188> rw
addr == 16'h5a ? 16'h7464 :  // <0188> td
// "av_rd_dt"
addr == 16'h5b ? 16'h7661 :  // <0188> va
addr == 16'h5c ? 16'h725f :  // <0188> r_
addr == 16'h5d ? 16'h5f64 :  // <0188> _d
addr == 16'h5e ? 16'h7464 :  // <0188> td
// "av_ad_hi"
addr == 16'h5f ? 16'h7661 :  // <0188> va
addr == 16'h60 ? 16'h615f :  // <0188> a_
addr == 16'h61 ? 16'h5f64 :  // <0188> _d
addr == 16'h62 ? 16'h6968 :  // <0188> ih
// "av_ad_lo"
addr == 16'h63 ? 16'h7661 :  // <0188> va
addr == 16'h64 ? 16'h615f :  // <0188> a_
addr == 16'h65 ? 16'h5f64 :  // <0188> _d
addr == 16'h66 ? 16'h6f6c :  // <0188> ol
// "//uartdt"
addr == 16'h67 ? 16'h2f2f :  // <0188> //
addr == 16'h68 ? 16'h6175 :  // <0188> au
addr == 16'h69 ? 16'h7472 :  // <0188> tr
addr == 16'h6a ? 16'h7464 :  // <0188> td
// "uartstat"
addr == 16'h6b ? 16'h6175 :  // <0188> au
addr == 16'h6c ? 16'h7472 :  // <0188> tr
addr == 16'h6d ? 16'h7473 :  // <0188> ts
addr == 16'h6e ? 16'h7461 :  // <0188> ta
// "    leds"
addr == 16'h6f ? 16'h2020 :  // <0188>   
addr == 16'h70 ? 16'h2020 :  // <0188>   
addr == 16'h71 ? 16'h656c :  // <0188> el
addr == 16'h72 ? 16'h7364 :  // <0188> sd
// "brd_ctrl"
addr == 16'h73 ? 16'h7262 :  // <0188> rb
addr == 16'h74 ? 16'h5f64 :  // <0188> _d
addr == 16'h75 ? 16'h7463 :  // <0188> tc
addr == 16'h76 ? 16'h6c72 :  // <0188> lr
// "   anmux"
addr == 16'h77 ? 16'h2020 :  // <0188>   
addr == 16'h78 ? 16'h6120 :  // <0188> a 
addr == 16'h79 ? 16'h6d6e :  // <0188> mn
addr == 16'h7a ? 16'h7875 :  // <0188> xu
// "pwr_duty"
addr == 16'h7b ? 16'h7770 :  // <0188> wp
addr == 16'h7c ? 16'h5f72 :  // <0188> _r
addr == 16'h7d ? 16'h7564 :  // <0188> ud
addr == 16'h7e ? 16'h7974 :  // <0188> yt
// "igntmcap"
addr == 16'h7f ? 16'h6769 :  // <0188> gi
addr == 16'h80 ? 16'h746e :  // <0188> tn
addr == 16'h81 ? 16'h636d :  // <0188> cm
addr == 16'h82 ? 16'h7061 :  // <0188> pa
// "igntmout"
addr == 16'h83 ? 16'h6769 :  // <0188> gi
addr == 16'h84 ? 16'h746e :  // <0188> tn
addr == 16'h85 ? 16'h6f6d :  // <0188> om
addr == 16'h86 ? 16'h7475 :  // <0188> tu
// "puflenus"
addr == 16'h87 ? 16'h7570 :  // <0188> up
addr == 16'h88 ? 16'h6c66 :  // <0188> lf
addr == 16'h89 ? 16'h6e65 :  // <0188> ne
addr == 16'h8a ? 16'h7375 :  // <0188> su

// string resources
// :boot_msg // = 0x008b
// "TGT\r\n\x0"
addr == 16'h8b ? 16'h4754 :  // <0192> GT
addr == 16'h8c ? 16'h0d54 :  // <0192>  T
addr == 16'h8d ? 16'h000a :  // <0192>   

// libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.

// event loop.  this infrastructure is assembled directly into the main program, not a func.
// first instruction of an event handler should be the 7th cycle after reading its priority from the event controller here.
// :poll_events // = 0x008e
// initialize prior to polling loop, for minimum latency.
addr == 16'h8e ? 16'h07a0 :  // <0006> b = :event_table
addr == 16'h8f ? 16'h05ec :  // <0006> "
// 3-cycle polling loop.
// :poll_events_again // = 0x0090
addr == 16'h90 ? 16'h000d :  // <0009> a = event_priority
addr == 16'h91 ? 16'he000 :  // <0010> br 0z :poll_events_again
addr == 16'h92 ? 16'h0090 :  // <0010> "
// acknowledge the event to clear its capture register.  do this right away,
// so another occurrence of the same event can be captured right away in the controller.
addr == 16'h93 ? 16'h3400 :  // <0013> event_priority = a
// compute an address in the event_table.  note the absence of a wait state for the adder here (not needed).
addr == 16'h94 ? 16'hd300 :  // <0015> fetch rtna from ad0
addr == 16'h95 ? 16'hfbb0 :  // <0015> "
// jump to the address given in the event_table.  each handler MUST end with a end_event.
// each handler does NOT need to save ANY registers (e.g. no convention_gpx).  they can all be trashed.
// each handler is passed the event priority in a, in case the same handler is used on multiple priorities.
addr == 16'h96 ? 16'hfc00 :  // <0019> swapra = nop
// just returned here from the handler, in case the handler accidentally did a rtn.  this should NEVER happen.
addr == 16'h97 ? 16'h6fa0 :  // <0021> error_halt_code 0xffc0 // leds = 0xffc0
addr == 16'h98 ? 16'hffc0 :  // <0021> "
addr == 16'h99 ? 16'he00f :  // <0021> error_halt_code 0xffc0
addr == 16'h9a ? 16'h0099 :  // <0021> "


// driver library for synapse316_uart simple async transceiver.






// routine sends out the low byte from a to the UART.  blocks until the FIFO accepts the byte.
// ######## func putchar_fduart // = 0x009b
addr == 16'h9b ? 16'h3004 :  // <0046> push x // func putchar_fduart

addr == 16'h9c ? 16'h1000 :  // <0048> x = a

// wait for FIFO to be available.
addr == 16'h9d ? 16'h0202 :  // <0051> a = $atx_fifo_full_mask
// :pcfduart_wait_for_idle // = 0x009e
addr == 16'h9e ? 16'h041a :  // <0053> b = fduart_status
addr == 16'h9f ? 16'he403 :  // <0054> bn and0z :pcfduart_wait_for_idle
addr == 16'ha0 ? 16'h009e :  // <0054> "

// push word to the UART.  its low byte is a character.
addr == 16'ha1 ? 16'h6404 :  // <0057> fduart_data = x
addr == 16'ha2 ? 16'h100c :  // <0058> pop x // end_func
addr == 16'ha3 ? 16'hfc00 :  // <0058> swapra = nop

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// ######## func getchar_fduart // = 0x00a4
// wait until FIFO is populated.
addr == 16'ha4 ? 16'h0208 :  // <0064> a = $arx_fifo_empty_mask
// :wait_for_busy // = 0x00a5
addr == 16'ha5 ? 16'h041a :  // <0066> b = fduart_status
addr == 16'ha6 ? 16'he403 :  // <0067> bn and0z :wait_for_busy
addr == 16'ha7 ? 16'h00a5 :  // <0067> "
addr == 16'ha8 ? 16'h0019 :  // <0068> a = fduart_data
addr == 16'ha9 ? 16'hfc00 :  // <0069> swapra = nop

// returns a character in a, or -1 if none.
// ######## func pollchar_fduart // = 0x00aa
// check for FIFO is populated.
addr == 16'haa ? 16'h0208 :  // <0074> a = $arx_fifo_empty_mask
addr == 16'hab ? 16'h041a :  // <0075> b = fduart_status
addr == 16'hac ? 16'he403 :  // <0076> bn and0z :none
addr == 16'had ? 16'h00b0 :  // <0076> "
addr == 16'hae ? 16'h0019 :  // <0077> a = fduart_data
addr == 16'haf ? 16'hfc00 :  // <0078> swapra = nop
// :none // = 0x00b0
addr == 16'hb0 ? 16'h0360 :  // <0080> a = -1
addr == 16'hb1 ? 16'hfc00 :  // <0081> swapra = nop


// pass desired anmux channel in a.
// after this returns, CALLER MUST WAIT for muxer & current driver to
// settle down.  some delay for that is absolutely required (per testing).
// 5 ms wait works well 2015/04.
// ######## func anmux_set_chn // = 0x00b2
// set & enable analog muxer
addr == 16'hb2 ? 16'h0608 :  // <0007> b = $anmux_enable_mask
addr == 16'hb3 ? 16'hc800 :  // <0008> anmux_ctrl = or
addr == 16'hb4 ? 16'h7734 :  // <0008> "
addr == 16'hb5 ? 16'hfc00 :  // <0009> swapra = nop

// ######## func anmux_get_chn // = 0x00b6
addr == 16'hb6 ? 16'h001d :  // <0012> a = anmux_ctrl
addr == 16'hb7 ? 16'h0607 :  // <0013> b = $anmux_channel_mask
addr == 16'hb8 ? 16'hc800 :  // <0014> a = and
addr == 16'hb9 ? 16'h0330 :  // <0014> "
addr == 16'hba ? 16'hfc00 :  // <0015> swapra = nop


// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x00bb
// "0123456789abcdef"
addr == 16'hbb ? 16'h3130 :  // <0050> 10
addr == 16'hbc ? 16'h3332 :  // <0050> 32
addr == 16'hbd ? 16'h3534 :  // <0050> 54
addr == 16'hbe ? 16'h3736 :  // <0050> 76
addr == 16'hbf ? 16'h3938 :  // <0050> 98
addr == 16'hc0 ? 16'h6261 :  // <0050> ba
addr == 16'hc1 ? 16'h6463 :  // <0050> dc
addr == 16'hc2 ? 16'h6665 :  // <0050> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// ######## func put4x // = 0x00c3
addr == 16'hc3 ? 16'h3004 :  // <0054> push x // func put4x
addr == 16'hc4 ? 16'h3006 :  // <0054> push g6 // "
addr == 16'hc5 ? 16'h303e :  // <0054> push rtna // "
addr == 16'hc6 ? 16'h13a0 :  // <0055> x = :hexdigits
addr == 16'hc7 ? 16'h00bb :  // <0055> "

addr == 16'hc8 ? 16'h1800 :  // <0057> g6 = a
addr == 16'hc9 ? 16'h07a0 :  // <0058> b = 0xF000
addr == 16'hca ? 16'hf000 :  // <0058> "
addr == 16'hcb ? 16'hc800 :  // <0059> a = and
addr == 16'hcc ? 16'h0330 :  // <0059> "
addr == 16'hcd ? 16'h0353 :  // <0060> a = a>>4
addr == 16'hce ? 16'h0353 :  // <0061> a = a>>4
addr == 16'hcf ? 16'h0353 :  // <0062> a = a>>4
addr == 16'hd0 ? 16'hfba0 :  // <0063> call fetch_byte
addr == 16'hd1 ? 16'h01dc :  // <0063> "
addr == 16'hd2 ? 16'hfc00 :  // <0063> "
addr == 16'hd3 ? 16'hfba0 :  // <0064> putchar a
addr == 16'hd4 ? 16'h009b :  // <0064> "
addr == 16'hd5 ? 16'hfc00 :  // <0064> "

addr == 16'hd6 ? 16'h0006 :  // <0066> a = g6
addr == 16'hd7 ? 16'h07a0 :  // <0067> b = 0x0F00
addr == 16'hd8 ? 16'h0f00 :  // <0067> "
addr == 16'hd9 ? 16'hc800 :  // <0068> a = and
addr == 16'hda ? 16'h0330 :  // <0068> "
addr == 16'hdb ? 16'h0353 :  // <0069> a = a>>4
addr == 16'hdc ? 16'h0353 :  // <0070> a = a>>4
addr == 16'hdd ? 16'hfba0 :  // <0071> call fetch_byte
addr == 16'hde ? 16'h01dc :  // <0071> "
addr == 16'hdf ? 16'hfc00 :  // <0071> "
addr == 16'he0 ? 16'hfba0 :  // <0072> putchar a
addr == 16'he1 ? 16'h009b :  // <0072> "
addr == 16'he2 ? 16'hfc00 :  // <0072> "

addr == 16'he3 ? 16'h0006 :  // <0074> a = g6
addr == 16'he4 ? 16'h06f0 :  // <0075> b = 0x00F0
addr == 16'he5 ? 16'hc800 :  // <0076> a = and
addr == 16'he6 ? 16'h0330 :  // <0076> "
addr == 16'he7 ? 16'h0353 :  // <0077> a = a>>4
addr == 16'he8 ? 16'hfba0 :  // <0078> call fetch_byte
addr == 16'he9 ? 16'h01dc :  // <0078> "
addr == 16'hea ? 16'hfc00 :  // <0078> "
addr == 16'heb ? 16'hfba0 :  // <0079> putchar a
addr == 16'hec ? 16'h009b :  // <0079> "
addr == 16'hed ? 16'hfc00 :  // <0079> "

addr == 16'hee ? 16'h0006 :  // <0081> a = g6
addr == 16'hef ? 16'h060f :  // <0082> b = 0x000F
addr == 16'hf0 ? 16'hc800 :  // <0083> a = and
addr == 16'hf1 ? 16'h0330 :  // <0083> "
addr == 16'hf2 ? 16'hfba0 :  // <0084> call fetch_byte
addr == 16'hf3 ? 16'h01dc :  // <0084> "
addr == 16'hf4 ? 16'hfc00 :  // <0084> "
addr == 16'hf5 ? 16'hfba0 :  // <0085> putchar a
addr == 16'hf6 ? 16'h009b :  // <0085> "
addr == 16'hf7 ? 16'hfc00 :  // <0085> "

addr == 16'hf8 ? 16'hf80c :  // <0087> pop rtna // end_func
addr == 16'hf9 ? 16'h180c :  // <0087> pop g6 // "
addr == 16'hfa ? 16'h100c :  // <0087> pop x // "
addr == 16'hfb ? 16'hfc00 :  // <0087> swapra = nop

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// ######## func get4x // = 0x00fc
addr == 16'hfc ? 16'h3002 :  // <0091> push i // func get4x
addr == 16'hfd ? 16'h3003 :  // <0091> push j // "
addr == 16'hfe ? 16'h3004 :  // <0091> push x // "
addr == 16'hff ? 16'h3005 :  // <0091> push y // "
addr == 16'h100 ? 16'h303e :  // <0091> push rtna // "
// y = digit counter
// j = sum
addr == 16'h101 ? 16'h1604 :  // <0094> y = 4
// :again // = 0x0102
addr == 16'h102 ? 16'hfba0 :  // <0096> getchar
addr == 16'h103 ? 16'h00a4 :  // <0096> "
addr == 16'h104 ? 16'hfc00 :  // <0096> "
addr == 16'h105 ? 16'h13a0 :  // <0097> x = :hexdigits
addr == 16'h106 ? 16'h00bb :  // <0097> "
addr == 16'h107 ? 16'h0a10 :  // <0098> i = 16
addr == 16'h108 ? 16'hfba0 :  // <0099> call :find_in_fetch
addr == 16'h109 ? 16'h01f0 :  // <0099> "
addr == 16'h10a ? 16'hfc00 :  // <0099> "
addr == 16'h10b ? 16'h0760 :  // <0100> b = -1
addr == 16'h10c ? 16'he007 :  // <0101> br eq :fail
addr == 16'h10d ? 16'h0121 :  // <0101> "
addr == 16'h10e ? 16'h0400 :  // <0102> b = a
addr == 16'h10f ? 16'h0003 :  // <0103> a = j
addr == 16'h110 ? 16'h0352 :  // <0104> a = a<<4
addr == 16'h111 ? 16'hc800 :  // <0105> j = or
addr == 16'h112 ? 16'h0f34 :  // <0105> "
addr == 16'h113 ? 16'h1360 :  // <0106> x = -1
addr == 16'h114 ? 16'hc800 :  // <0107> y = x+y
addr == 16'h115 ? 16'h1720 :  // <0107> "
addr == 16'h116 ? 16'h0005 :  // <0108> a = y
addr == 16'h117 ? 16'he400 :  // <0109> bn az :again
addr == 16'h118 ? 16'h0102 :  // <0109> "
addr == 16'h119 ? 16'h0003 :  // <0110> a = j
addr == 16'h11a ? 16'h0600 :  // <0111> b = 0
addr == 16'h11b ? 16'hf80c :  // <0112> pop rtna // rtn
addr == 16'h11c ? 16'h140c :  // <0112> pop y // "
addr == 16'h11d ? 16'h100c :  // <0112> pop x // "
addr == 16'h11e ? 16'h0c0c :  // <0112> pop j // "
addr == 16'h11f ? 16'h080c :  // <0112> pop i // "
addr == 16'h120 ? 16'hfc00 :  // <0112> swapra = nop
// :fail // = 0x0121
addr == 16'h121 ? 16'h0760 :  // <0114> b = -1
addr == 16'h122 ? 16'hf80c :  // <0115> pop rtna // end_func
addr == 16'h123 ? 16'h140c :  // <0115> pop y // "
addr == 16'h124 ? 16'h100c :  // <0115> pop x // "
addr == 16'h125 ? 16'h0c0c :  // <0115> pop j // "
addr == 16'h126 ? 16'h080c :  // <0115> pop i // "
addr == 16'h127 ? 16'hfc00 :  // <0115> swapra = nop

// print a fixed-length string from packed words in program space.
// pass its word address (not its byte address) in a,  its length (bytes) in b.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_fixed // = 0x0128
addr == 16'h128 ? 16'h3002 :  // <0121> push i // func print_fixed
addr == 16'h129 ? 16'h3003 :  // <0121> push j // "
addr == 16'h12a ? 16'h3004 :  // <0121> push x // "
addr == 16'h12b ? 16'h3005 :  // <0121> push y // "
addr == 16'h12c ? 16'h3006 :  // <0121> push g6 // "
addr == 16'h12d ? 16'h303e :  // <0121> push rtna // "
addr == 16'h12e ? 16'h0800 :  // <0122> i = a
addr == 16'h12f ? 16'h0e01 :  // <0123> j = 1
addr == 16'h130 ? 16'h1001 :  // <0124> x = b
addr == 16'h131 ? 16'h1760 :  // <0125> y = -1
// :next_word // = 0x0132
addr == 16'h132 ? 16'he002 :  // <0127> br xz :done
addr == 16'h133 ? 16'h0148 :  // <0127> "
addr == 16'h134 ? 16'h1320 :  // <0128> x = ad2
addr == 16'h135 ? 16'hd002 :  // <0129> fetch g6 from i
addr == 16'h136 ? 16'h1bb0 :  // <0129> "
// now x = bytes remaining, i = current word address, g6 = data word.
addr == 16'h137 ? 16'h0006 :  // <0131> a = g6 // putchar g6
addr == 16'h138 ? 16'hfba0 :  // <0131> putchar g6
addr == 16'h139 ? 16'h009b :  // <0131> "
addr == 16'h13a ? 16'hfc00 :  // <0131> "
addr == 16'h13b ? 16'he002 :  // <0132> br xz :done
addr == 16'h13c ? 16'h0148 :  // <0132> "
addr == 16'h13d ? 16'h1320 :  // <0133> x = ad2
addr == 16'h13e ? 16'h0006 :  // <0134> a = g6
addr == 16'h13f ? 16'h0353 :  // <0135> a = a>>4
addr == 16'h140 ? 16'h0353 :  // <0136> a = a>>4
addr == 16'h141 ? 16'hfba0 :  // <0137> putchar a
addr == 16'h142 ? 16'h009b :  // <0137> "
addr == 16'h143 ? 16'hfc00 :  // <0137> "
addr == 16'h144 ? 16'hc800 :  // <0138> i = i+j
addr == 16'h145 ? 16'h0b10 :  // <0138> "
addr == 16'h146 ? 16'he00f :  // <0139> jmp :next_word
addr == 16'h147 ? 16'h0132 :  // <0139> "
// :done // = 0x0148
addr == 16'h148 ? 16'hf80c :  // <0141> pop rtna // end_func
addr == 16'h149 ? 16'h180c :  // <0141> pop g6 // "
addr == 16'h14a ? 16'h140c :  // <0141> pop y // "
addr == 16'h14b ? 16'h100c :  // <0141> pop x // "
addr == 16'h14c ? 16'h0c0c :  // <0141> pop j // "
addr == 16'h14d ? 16'h080c :  // <0141> pop i // "
addr == 16'h14e ? 16'hfc00 :  // <0141> swapra = nop

// print a null-terminated string from packed words in program space.
// pass its word address (not its byte address) in a.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_nt // = 0x014f
addr == 16'h14f ? 16'h3002 :  // <0147> push i // func print_nt
addr == 16'h150 ? 16'h3003 :  // <0147> push j // "
addr == 16'h151 ? 16'h3004 :  // <0147> push x // "
addr == 16'h152 ? 16'h303e :  // <0147> push rtna // "
addr == 16'h153 ? 16'h0800 :  // <0148> i = a
addr == 16'h154 ? 16'h0e01 :  // <0149> j = 1
// :next_word // = 0x0155
addr == 16'h155 ? 16'hd002 :  // <0151> fetch x from i
addr == 16'h156 ? 16'h13b0 :  // <0151> "
// now i = current word address, x = data word, b = low byte mask, a = data byte.
addr == 16'h157 ? 16'h0004 :  // <0153> a = x
addr == 16'h158 ? 16'h06ff :  // <0154> b = 0xff
addr == 16'h159 ? 16'he003 :  // <0155> br and0z :done
addr == 16'h15a ? 16'h016b :  // <0155> "
addr == 16'h15b ? 16'hfba0 :  // <0156> putchar a
addr == 16'h15c ? 16'h009b :  // <0156> "
addr == 16'h15d ? 16'hfc00 :  // <0156> "
addr == 16'h15e ? 16'h0004 :  // <0157> a = x
addr == 16'h15f ? 16'h0353 :  // <0158> a = a>>4
addr == 16'h160 ? 16'h0353 :  // <0159> a = a>>4
addr == 16'h161 ? 16'h06ff :  // <0160> b = 0xff
addr == 16'h162 ? 16'he003 :  // <0161> br and0z :done
addr == 16'h163 ? 16'h016b :  // <0161> "
addr == 16'h164 ? 16'hfba0 :  // <0162> putchar a
addr == 16'h165 ? 16'h009b :  // <0162> "
addr == 16'h166 ? 16'hfc00 :  // <0162> "
addr == 16'h167 ? 16'hc800 :  // <0163> i = i+j
addr == 16'h168 ? 16'h0b10 :  // <0163> "
addr == 16'h169 ? 16'he00f :  // <0164> jmp :next_word
addr == 16'h16a ? 16'h0155 :  // <0164> "
// :done // = 0x016b
addr == 16'h16b ? 16'hf80c :  // <0166> pop rtna // end_func
addr == 16'h16c ? 16'h100c :  // <0166> pop x // "
addr == 16'h16d ? 16'h0c0c :  // <0166> pop j // "
addr == 16'h16e ? 16'h080c :  // <0166> pop i // "
addr == 16'h16f ? 16'hfc00 :  // <0166> swapra = nop


// function library for simple integer math.

// ######## func multiply // = 0x0170
addr == 16'h170 ? 16'h3002 :  // <0004> push i // func multiply
addr == 16'h171 ? 16'h3003 :  // <0004> push j // "
addr == 16'h172 ? 16'h3004 :  // <0004> push x // "
addr == 16'h173 ? 16'h3005 :  // <0004> push y // "
// unsigned 16-bit multiplication.  a = a * b.
// it's easy to roll over the 16-bit result by passing operands whose bit widths total more than 16.
// bigger/safer/faster math can be obtained from Altera IP blocks.

addr == 16'h174 ? 16'h1000 :  // <0009> x = a
addr == 16'h175 ? 16'h1401 :  // <0010> y = b
addr == 16'h176 ? 16'h0a00 :  // <0011> i = 0
// :again // = 0x0177
addr == 16'h177 ? 16'he002 :  // <0013> br xz :done
addr == 16'h178 ? 16'h0186 :  // <0013> "
addr == 16'h179 ? 16'h0004 :  // <0014> a = x
addr == 16'h17a ? 16'h0601 :  // <0015> b = 1
addr == 16'h17b ? 16'he003 :  // <0016> br and0z :skip_add
addr == 16'h17c ? 16'h0180 :  // <0016> "
addr == 16'h17d ? 16'h0c05 :  // <0017> j = y
addr == 16'h17e ? 16'hc800 :  // <0018> i = i+j
addr == 16'h17f ? 16'h0b10 :  // <0018> "
// :skip_add // = 0x0180
addr == 16'h180 ? 16'h0004 :  // <0020> a = x
addr == 16'h181 ? 16'h1350 :  // <0021> x = a>>1
addr == 16'h182 ? 16'h0005 :  // <0022> a = y
addr == 16'h183 ? 16'h1751 :  // <0023> y = a<<1
addr == 16'h184 ? 16'he00f :  // <0024> jmp :again
addr == 16'h185 ? 16'h0177 :  // <0024> "
// :done // = 0x0186
addr == 16'h186 ? 16'h0002 :  // <0026> a = i
addr == 16'h187 ? 16'h140c :  // <0027> pop y // end_func
addr == 16'h188 ? 16'h100c :  // <0027> pop x // "
addr == 16'h189 ? 16'h0c0c :  // <0027> pop j // "
addr == 16'h18a ? 16'h080c :  // <0027> pop i // "
addr == 16'h18b ? 16'hfc00 :  // <0027> swapra = nop

// ######## func divide // = 0x018c
addr == 16'h18c ? 16'h3002 :  // <0029> push i // func divide
addr == 16'h18d ? 16'h3003 :  // <0029> push j // "
addr == 16'h18e ? 16'h3004 :  // <0029> push x // "
addr == 16'h18f ? 16'h3005 :  // <0029> push y // "
addr == 16'h190 ? 16'h3006 :  // <0029> push g6 // "
addr == 16'h191 ? 16'h3007 :  // <0029> push g7 // "
// unsigned 15-bit division.  b = a / b.  return remainder in a.
// division by zero results in zero.
// THE HIGH BIT OF A MUST BE 0!!  ALSO THE HIGH BIT OF B MUST BE 0!!
// 1 in the high bit of either operand results in infinite loop or wrong results.
// bigger/safer/faster math can be obtained from Altera IP blocks.

// degenerate cases.
addr == 16'h192 ? 16'he005 :  // <0037> br lt :zero
addr == 16'h193 ? 16'h01cd :  // <0037> "
addr == 16'h194 ? 16'he000 :  // <0038> br az :zero
addr == 16'h195 ? 16'h01cd :  // <0038> "
addr == 16'h196 ? 16'h1000 :  // <0039> x = a
//    g7 = x
addr == 16'h197 ? 16'h0001 :  // <0041> a = b
addr == 16'h198 ? 16'he000 :  // <0042> br az :zero
addr == 16'h199 ? 16'h01cd :  // <0042> "
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
addr == 16'h19a ? 16'h0404 :  // <0058> b = x
addr == 16'h19b ? 16'h0a00 :  // <0059> i = 0
addr == 16'h19c ? 16'h0e01 :  // <0060> j = 1
// :shift_again // = 0x019d
addr == 16'h19d ? 16'he006 :  // <0062> br gt :shift_done
addr == 16'h19e ? 16'h01a3 :  // <0062> "
addr == 16'h19f ? 16'h0351 :  // <0063> a = a<<1
addr == 16'h1a0 ? 16'h0b10 :  // <0064> i = ad1
addr == 16'h1a1 ? 16'he00f :  // <0065> jmp :shift_again
addr == 16'h1a2 ? 16'h019d :  // <0065> "
// :shift_done // = 0x01a3
addr == 16'h1a3 ? 16'h1b50 :  // <0067> g6 = a>>1
// now operands are x / g6.  i = number of passes of long division required.
// notice i was not decremented here, so it has 1 more in it than the number of shifts required for digit parity.
// that's exactly what it needs for correctness.

// // compensate for special case where msb was 1.  then 1 more division pass is needed.
// j = y
// i = i+j
// x = g7

// long division.  g7 = quotient.
addr == 16'h1a4 ? 16'h1e00 :  // <0078> g7 = 0
addr == 16'h1a5 ? 16'h0f60 :  // <0079> j = -1
// :again // = 0x01a6
addr == 16'h1a6 ? 16'he001 :  // <0081> br iz :done
addr == 16'h1a7 ? 16'h01c4 :  // <0081> "
addr == 16'h1a8 ? 16'h0006 :  // <0082> a = g6
addr == 16'h1a9 ? 16'h0404 :  // <0083> b = x
addr == 16'h1aa ? 16'he006 :  // <0084> br gt :result0
addr == 16'h1ab ? 16'h01bc :  // <0084> "
// temp does fit; output a 1.
addr == 16'h1ac ? 16'h0007 :  // <0086> a = g7
addr == 16'h1ad ? 16'h0351 :  // <0087> a = a<<1
addr == 16'h1ae ? 16'h0601 :  // <0088> b = 1
addr == 16'h1af ? 16'hc800 :  // <0089> g7 = or
addr == 16'h1b0 ? 16'h1f34 :  // <0089> "
// dividend = dividend - temp
addr == 16'h1b1 ? 16'h0006 :  // <0091> a = g6
addr == 16'h1b2 ? 16'h0760 :  // <0092> b = -1
addr == 16'h1b3 ? 16'hc800 :  // <0093> a = xor
addr == 16'h1b4 ? 16'h0338 :  // <0093> "
addr == 16'h1b5 ? 16'h0601 :  // <0094> b = 1
addr == 16'h1b6 ? 16'hc800 :  // <0095> y = a+b
addr == 16'h1b7 ? 16'h1700 :  // <0095> "
addr == 16'h1b8 ? 16'hc800 :  // <0096> x = x+y
addr == 16'h1b9 ? 16'h1320 :  // <0096> "
addr == 16'h1ba ? 16'he00f :  // <0097> jmp :next
addr == 16'h1bb ? 16'h01be :  // <0097> "
// :result0 // = 0x01bc
// temp does not fit; output a 0.
addr == 16'h1bc ? 16'h0007 :  // <0100> a = g7
addr == 16'h1bd ? 16'h1f51 :  // <0101> g7 = a<<1
// no change to dividend.
// :next // = 0x01be
addr == 16'h1be ? 16'h0006 :  // <0104> a = g6
addr == 16'h1bf ? 16'h1b50 :  // <0105> g6 = a>>1
addr == 16'h1c0 ? 16'hc800 :  // <0106> i = i+j
addr == 16'h1c1 ? 16'h0b10 :  // <0106> "
addr == 16'h1c2 ? 16'he00f :  // <0107> jmp :again
addr == 16'h1c3 ? 16'h01a6 :  // <0107> "

// :done // = 0x01c4
addr == 16'h1c4 ? 16'h0407 :  // <0110> b = g7
addr == 16'h1c5 ? 16'h0004 :  // <0111> a = x
addr == 16'h1c6 ? 16'h1c0c :  // <0112> pop g7 // rtn
addr == 16'h1c7 ? 16'h180c :  // <0112> pop g6 // "
addr == 16'h1c8 ? 16'h140c :  // <0112> pop y // "
addr == 16'h1c9 ? 16'h100c :  // <0112> pop x // "
addr == 16'h1ca ? 16'h0c0c :  // <0112> pop j // "
addr == 16'h1cb ? 16'h080c :  // <0112> pop i // "
addr == 16'h1cc ? 16'hfc00 :  // <0112> swapra = nop

// :zero // = 0x01cd
addr == 16'h1cd ? 16'h0600 :  // <0115> b = 0
addr == 16'h1ce ? 16'h1c0c :  // <0116> pop g7 // rtn
addr == 16'h1cf ? 16'h180c :  // <0116> pop g6 // "
addr == 16'h1d0 ? 16'h140c :  // <0116> pop y // "
addr == 16'h1d1 ? 16'h100c :  // <0116> pop x // "
addr == 16'h1d2 ? 16'h0c0c :  // <0116> pop j // "
addr == 16'h1d3 ? 16'h080c :  // <0116> pop i // "
addr == 16'h1d4 ? 16'hfc00 :  // <0116> swapra = nop
addr == 16'h1d5 ? 16'h1c0c :  // <0117> pop g7 // end_func
addr == 16'h1d6 ? 16'h180c :  // <0117> pop g6 // "
addr == 16'h1d7 ? 16'h140c :  // <0117> pop y // "
addr == 16'h1d8 ? 16'h100c :  // <0117> pop x // "
addr == 16'h1d9 ? 16'h0c0c :  // <0117> pop j // "
addr == 16'h1da ? 16'h080c :  // <0117> pop i // "
addr == 16'h1db ? 16'hfc00 :  // <0117> swapra = nop


// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// ######## func fetch_byte // = 0x01dc
addr == 16'h1dc ? 16'h0601 :  // <0005> b = 1
addr == 16'h1dd ? 16'he003 :  // <0006> br and0z :pick_byte_even
addr == 16'h1de ? 16'h01e7 :  // <0006> "
addr == 16'h1df ? 16'h0350 :  // <0007> a = a>>1
addr == 16'h1e0 ? 16'h0404 :  // <0008> b = x
addr == 16'h1e1 ? 16'hc800 :  // <0009> fetch a from a+b
addr == 16'h1e2 ? 16'hd300 :  // <0009> "
addr == 16'h1e3 ? 16'h03b0 :  // <0009> "
addr == 16'h1e4 ? 16'h0353 :  // <0010> a = a>>4
addr == 16'h1e5 ? 16'h0353 :  // <0011> a = a>>4
addr == 16'h1e6 ? 16'hfc00 :  // <0012> swapra = nop
// :pick_byte_even // = 0x01e7
addr == 16'h1e7 ? 16'h0350 :  // <0014> a = a>>1
addr == 16'h1e8 ? 16'h0404 :  // <0015> b = x
addr == 16'h1e9 ? 16'hc800 :  // <0016> fetch a from a+b
addr == 16'h1ea ? 16'hd300 :  // <0016> "
addr == 16'h1eb ? 16'h03b0 :  // <0016> "
addr == 16'h1ec ? 16'h06ff :  // <0017> b = 0xff
addr == 16'h1ed ? 16'hc800 :  // <0018> a = and
addr == 16'h1ee ? 16'h0330 :  // <0018> "
addr == 16'h1ef ? 16'hfc00 :  // <0019> swapra = nop

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// ######## func find_in_fetch // = 0x01f0
addr == 16'h1f0 ? 16'h3002 :  // <0027> push i // func find_in_fetch
addr == 16'h1f1 ? 16'h3003 :  // <0027> push j // "
addr == 16'h1f2 ? 16'h3005 :  // <0027> push y // "
addr == 16'h1f3 ? 16'h303e :  // <0027> push rtna // "
addr == 16'h1f4 ? 16'h1400 :  // <0028> y = a
addr == 16'h1f5 ? 16'h0f60 :  // <0029> j = -1
// :again // = 0x01f6
addr == 16'h1f6 ? 16'he001 :  // <0031> br iz :fail
addr == 16'h1f7 ? 16'h0206 :  // <0031> "
addr == 16'h1f8 ? 16'h0b10 :  // <0032> i = ad1
addr == 16'h1f9 ? 16'h0002 :  // <0033> a = i
addr == 16'h1fa ? 16'hfba0 :  // <0034> call :fetch_byte
addr == 16'h1fb ? 16'h01dc :  // <0034> "
addr == 16'h1fc ? 16'hfc00 :  // <0034> "
addr == 16'h1fd ? 16'h0405 :  // <0035> b = y
addr == 16'h1fe ? 16'he407 :  // <0036> bn eq :again
addr == 16'h1ff ? 16'h01f6 :  // <0036> "
// :found // = 0x0200
addr == 16'h200 ? 16'h0002 :  // <0038> a = i
addr == 16'h201 ? 16'hf80c :  // <0039> pop rtna // rtn
addr == 16'h202 ? 16'h140c :  // <0039> pop y // "
addr == 16'h203 ? 16'h0c0c :  // <0039> pop j // "
addr == 16'h204 ? 16'h080c :  // <0039> pop i // "
addr == 16'h205 ? 16'hfc00 :  // <0039> swapra = nop
// :fail // = 0x0206
addr == 16'h206 ? 16'h0360 :  // <0041> a = -1
addr == 16'h207 ? 16'hf80c :  // <0042> pop rtna // end_func
addr == 16'h208 ? 16'h140c :  // <0042> pop y // "
addr == 16'h209 ? 16'h0c0c :  // <0042> pop j // "
addr == 16'h20a ? 16'h080c :  // <0042> pop i // "
addr == 16'h20b ? 16'hfc00 :  // <0042> swapra = nop


// routine waits a number of milliseconds given in a.
// ######## func spinwait // = 0x020c
addr == 16'h20c ? 16'h3004 :  // <0002> push x // func spinwait
addr == 16'h20d ? 16'h3005 :  // <0002> push y // "
//patch
//rtn
addr == 16'h20e ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x020f
addr == 16'h20f ? 16'h13a0 :  // <0007> x = 16666
addr == 16'h210 ? 16'h411a :  // <0007> "
addr == 16'h211 ? 16'h1760 :  // <0008> y = -1
addr == 16'h212 ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x0213
// use of the ad2 name overrides auto-nop here.
addr == 16'h213 ? 16'h1320 :  // <0012> x = ad2
addr == 16'h214 ? 16'he402 :  // <0013> bn xz :spinwait_inner
addr == 16'h215 ? 16'h0213 :  // <0013> "
addr == 16'h216 ? 16'hc800 :  // <0014> a = a+b
addr == 16'h217 ? 16'h0300 :  // <0014> "
addr == 16'h218 ? 16'he400 :  // <0015> bn az :spinwait_outer
addr == 16'h219 ? 16'h020f :  // <0015> "
addr == 16'h21a ? 16'h140c :  // <0016> pop y // end_func
addr == 16'h21b ? 16'h100c :  // <0016> pop x // "
addr == 16'h21c ? 16'hfc00 :  // <0016> swapra = nop




// :cmd_table // = 0x021d
// "  hello"
addr == 16'h21d ? 16'h2020 :  // <0005>   
addr == 16'h21e ? 16'h6568 :  // <0005> eh
addr == 16'h21f ? 16'h6c6c :  // <0005> ll
addr == 16'h220 ? 16'h006f :  // <0005>  o
addr == 16'h221 ? 16'h02ba :  // <0006> ([label hello_cmd])
// "  plstp"
addr == 16'h222 ? 16'h2020 :  // <0007>   
addr == 16'h223 ? 16'h6c70 :  // <0007> lp
addr == 16'h224 ? 16'h7473 :  // <0007> ts
addr == 16'h225 ? 16'h0070 :  // <0007>  p
addr == 16'h226 ? 16'h02be :  // <0008> ([label set_plan_stop_cmd])
// "   plcr"
addr == 16'h227 ? 16'h2020 :  // <0009>   
addr == 16'h228 ? 16'h7020 :  // <0009> p 
addr == 16'h229 ? 16'h636c :  // <0009> cl
addr == 16'h22a ? 16'h0072 :  // <0009>  r
addr == 16'h22b ? 16'h02c9 :  // <0010> ([label set_plan_crank_cmd])
// "   plwm"
addr == 16'h22c ? 16'h2020 :  // <0011>   
addr == 16'h22d ? 16'h7020 :  // <0011> p 
addr == 16'h22e ? 16'h776c :  // <0011> wl
addr == 16'h22f ? 16'h006d :  // <0011>  m
addr == 16'h230 ? 16'h02d4 :  // <0012> ([label set_plan_warmup_cmd])
// "   plrn"
addr == 16'h231 ? 16'h2020 :  // <0013>   
addr == 16'h232 ? 16'h7020 :  // <0013> p 
addr == 16'h233 ? 16'h726c :  // <0013> rl
addr == 16'h234 ? 16'h006e :  // <0013>  n
addr == 16'h235 ? 16'h02df :  // <0014> ([label set_plan_run_cmd])
// "   plln"
addr == 16'h236 ? 16'h2020 :  // <0015>   
addr == 16'h237 ? 16'h7020 :  // <0015> p 
addr == 16'h238 ? 16'h6c6c :  // <0015> ll
addr == 16'h239 ? 16'h006e :  // <0015>  n
addr == 16'h23a ? 16'h02ea :  // <0016> ([label set_plan_learn_cmd])
// "clstmap"
addr == 16'h23b ? 16'h6c63 :  // <0017> lc
addr == 16'h23c ? 16'h7473 :  // <0017> ts
addr == 16'h23d ? 16'h616d :  // <0017> am
addr == 16'h23e ? 16'h0070 :  // <0017>  p
addr == 16'h23f ? 16'h0594 :  // <0018> ([label clear_smap_cmd])
// "\x0\x0"
addr == 16'h240 ? 16'h0000 :  // <0019>   


// ######## func parse_key // = 0x0241
addr == 16'h241 ? 16'h3002 :  // <0022> push i // func parse_key
addr == 16'h242 ? 16'h3004 :  // <0022> push x // "
addr == 16'h243 ? 16'h3005 :  // <0022> push y // "
addr == 16'h244 ? 16'h303e :  // <0022> push rtna // "
// memorize into ram_key_buf, pushing down existing content.
addr == 16'h245 ? 16'h3000 :  // <0024> push a // push a
addr == 16'h246 ? 16'h1000 :  // <0025> x = a
addr == 16'h247 ? 16'h0a07 :  // <0034> i = $key_buf_max
// :loop_583 // = 0x0248

addr == 16'h248 ? 16'h0002 :  // <0034> a = i

addr == 16'h249 ? 16'h0351 :  // <0034> a = a<<1
addr == 16'h24a ? 16'h0600 :  // <0034> b = 0
addr == 16'h24b ? 16'h5e00 :  // <0034> av_ad_hi = 0
addr == 16'h24c ? 16'h6300 :  // <0034> av_ad_lo = ad0
addr == 16'h24d ? 16'h0415 :  // <0034> b = av_write_data
addr == 16'h24e ? 16'h0416 :  // <0034> b = av_read_data

addr == 16'h24f ? 16'h1401 :  // <0034> y = b
addr == 16'h250 ? 16'h0002 :  // <0034> a = i
addr == 16'h251 ? 16'h0404 :  // <0034> b = x

addr == 16'h252 ? 16'h0351 :  // <0034> a = a<<1
addr == 16'h253 ? 16'h3001 :  // <0034> push b // push b
addr == 16'h254 ? 16'h0600 :  // <0034> b = 0
addr == 16'h255 ? 16'h5e00 :  // <0034> av_ad_hi = 0
addr == 16'h256 ? 16'h6300 :  // <0034> av_ad_lo = ad0
addr == 16'h257 ? 16'h540c :  // <0034> pop av_write_data // pop av_write_data

addr == 16'h258 ? 16'h1005 :  // <0034> x = y


addr == 16'h259 ? 16'h0002 :  // <0034> a = i
addr == 16'h25a ? 16'h0600 :  // <0034> b = 0
addr == 16'h25b ? 16'he007 :  // <0034> br eq :end_583
addr == 16'h25c ? 16'h0265 :  // <0034> "


addr == 16'h25d ? 16'h0002 :  // <0034> a = i
addr == 16'h25e ? 16'h0760 :  // <0034> b = -1
addr == 16'h25f ? 16'hc800 :  // <0034> i = a+b
addr == 16'h260 ? 16'h0b00 :  // <0034> "


addr == 16'h261 ? 16'h0002 :  // <0034> a = i
addr == 16'h262 ? 16'h0600 :  // <0034> b = 0
addr == 16'h263 ? 16'he405 :  // <0034> bn lt :loop_583
addr == 16'h264 ? 16'h0248 :  // <0034> "

// :end_583 // = 0x0265
addr == 16'h265 ? 16'h000c :  // <0035> pop a // pop a

addr == 16'h266 ? 16'h0000 :  // <0038> a = a
addr == 16'h267 ? 16'h060d :  // <0038> b = 13


addr == 16'h268 ? 16'he407 :  // <0038> bn eq :else_616
addr == 16'h269 ? 16'h026d :  // <0038> "

addr == 16'h26a ? 16'hfba0 :  // <0038> call :parse_command
addr == 16'h26b ? 16'h0274 :  // <0038> "
addr == 16'h26c ? 16'hfc00 :  // <0038> "


// :else_616 // = 0x026d

// :end_616 // = 0x026d

addr == 16'h26d ? 16'hf80c :  // <0039> pop rtna // end_func
addr == 16'h26e ? 16'h140c :  // <0039> pop y // "
addr == 16'h26f ? 16'h100c :  // <0039> pop x // "
addr == 16'h270 ? 16'h080c :  // <0039> pop i // "
addr == 16'h271 ? 16'hfc00 :  // <0039> swapra = nop

// :cmd_ack_msg // = 0x0272
// "OK\x0"
addr == 16'h272 ? 16'h4b4f :  // <0042> KO
addr == 16'h273 ? 16'h0000 :  // <0042>   

// ######## func parse_command // = 0x0274
addr == 16'h274 ? 16'h3002 :  // <0044> push i // func parse_command
addr == 16'h275 ? 16'h3004 :  // <0044> push x // "
addr == 16'h276 ? 16'h3005 :  // <0044> push y // "
addr == 16'h277 ? 16'h303e :  // <0044> push rtna // "
addr == 16'h278 ? 16'h13a0 :  // <0045> x = :cmd_table
addr == 16'h279 ? 16'h021d :  // <0045> "
// :next_cmd // = 0x027a
addr == 16'h27a ? 16'hd004 :  // <0047> fetch a from x
addr == 16'h27b ? 16'h03b0 :  // <0047> "
addr == 16'h27c ? 16'he000 :  // <0048> br az :done
addr == 16'h27d ? 16'h02b5 :  // <0048> "

addr == 16'h27e ? 16'h0a00 :  // <0064> i = 0
// :loop_638 // = 0x027f

addr == 16'h27f ? 16'h0002 :  // <0064> a = i
addr == 16'h280 ? 16'hfba0 :  // <0064> call :fetch_byte
addr == 16'h281 ? 16'h01dc :  // <0064> "
addr == 16'h282 ? 16'hfc00 :  // <0064> "
addr == 16'h283 ? 16'h1400 :  // <0064> y = a
addr == 16'h284 ? 16'h0620 :  // <0064> b = 32 // asc b = " "

addr == 16'h285 ? 16'h0000 :  // <0064> a = a
addr == 16'h286 ? 16'h0401 :  // <0064> b = b


addr == 16'h287 ? 16'he007 :  // <0064> br eq :else_647
addr == 16'h288 ? 16'h0296 :  // <0064> "

addr == 16'h289 ? 16'h062a :  // <0064> b = 42 // asc b = "*"
addr == 16'h28a ? 16'he007 :  // <0064> br eq :matched
addr == 16'h28b ? 16'h029e :  // <0064> "
// parameter character.  succeed early.
addr == 16'h28c ? 16'h0002 :  // <0064> a = i

addr == 16'h28d ? 16'h0351 :  // <0064> a = a<<1
addr == 16'h28e ? 16'h0600 :  // <0064> b = 0
addr == 16'h28f ? 16'h5e00 :  // <0064> av_ad_hi = 0
addr == 16'h290 ? 16'h6300 :  // <0064> av_ad_lo = ad0
addr == 16'h291 ? 16'h0415 :  // <0064> b = av_write_data
addr == 16'h292 ? 16'h0416 :  // <0064> b = av_read_data

addr == 16'h293 ? 16'h0005 :  // <0064> a = y
addr == 16'h294 ? 16'he407 :  // <0064> bn eq :no_match
addr == 16'h295 ? 16'h02aa :  // <0064> "


// :else_647 // = 0x0296

// :end_647 // = 0x0296



addr == 16'h296 ? 16'h0002 :  // <0064> a = i
addr == 16'h297 ? 16'h0601 :  // <0064> b = 1
addr == 16'h298 ? 16'hc800 :  // <0064> i = a+b
addr == 16'h299 ? 16'h0b00 :  // <0064> "


addr == 16'h29a ? 16'h0002 :  // <0064> a = i
addr == 16'h29b ? 16'h0607 :  // <0064> b = $key_buf_max
addr == 16'h29c ? 16'he005 :  // <0064> br lt :loop_638
addr == 16'h29d ? 16'h027f :  // <0064> "

// :end_638 // = 0x029e

// at this point we have a match on the record beginning at x.
// :matched // = 0x029e
addr == 16'h29e ? 16'h03a0 :  // <0068> a = :cmd_ack_msg
addr == 16'h29f ? 16'h0272 :  // <0068> "
addr == 16'h2a0 ? 16'hfba0 :  // <0069> call :set_text_flag
addr == 16'h2a1 ? 16'h08f2 :  // <0069> "
addr == 16'h2a2 ? 16'hfc00 :  // <0069> "
addr == 16'h2a3 ? 16'h1604 :  // <0070> y = ($key_buf_len / 2)
addr == 16'h2a4 ? 16'hc800 :  // <0071> fetch rtna from x+y
addr == 16'h2a5 ? 16'hd320 :  // <0071> "
addr == 16'h2a6 ? 16'hfbb0 :  // <0071> "
addr == 16'h2a7 ? 16'hfc00 :  // <0072> swapra = nop
addr == 16'h2a8 ? 16'he00f :  // <0073> jmp :done
addr == 16'h2a9 ? 16'h02b5 :  // <0073> "

// :no_match // = 0x02aa
// if ram_terminal_connected is still 0, quit searching after the very first command in the table.
addr == 16'h2aa ? 16'h5e00 :  // <0077> ram a = $ram_terminal_connected // av_ad_hi = 0
addr == 16'h2ab ? 16'h6296 :  // <0077> ram a = $ram_terminal_connected // av_ad_lo = 150
addr == 16'h2ac ? 16'h0015 :  // <0077> ram a = $ram_terminal_connected // a = av_write_data // start read cycle
addr == 16'h2ad ? 16'h0016 :  // <0077> ram a = $ram_terminal_connected // a = av_read_data // finish read cycle
addr == 16'h2ae ? 16'he000 :  // <0078> br az :done
addr == 16'h2af ? 16'h02b5 :  // <0078> "

addr == 16'h2b0 ? 16'h1605 :  // <0080> y = (($key_buf_len / 2) + 1)
addr == 16'h2b1 ? 16'hc800 :  // <0081> x = x+y
addr == 16'h2b2 ? 16'h1320 :  // <0081> "
addr == 16'h2b3 ? 16'he00f :  // <0082> jmp :next_cmd
addr == 16'h2b4 ? 16'h027a :  // <0082> "
// :done // = 0x02b5
addr == 16'h2b5 ? 16'hf80c :  // <0084> pop rtna // end_func
addr == 16'h2b6 ? 16'h140c :  // <0084> pop y // "
addr == 16'h2b7 ? 16'h100c :  // <0084> pop x // "
addr == 16'h2b8 ? 16'h080c :  // <0084> pop i // "
addr == 16'h2b9 ? 16'hfc00 :  // <0084> swapra = nop

// ######## func hello_cmd // = 0x02ba
addr == 16'h2ba ? 16'h5e00 :  // <0087> ram $ram_terminal_connected = 1 // av_ad_hi = 0
addr == 16'h2bb ? 16'h6296 :  // <0087> ram $ram_terminal_connected = 1 // av_ad_lo = 150
addr == 16'h2bc ? 16'h5601 :  // <0087> ram $ram_terminal_connected = 1 // av_write_data = 1
addr == 16'h2bd ? 16'hfc00 :  // <0088> swapra = nop

// ######## func set_plan_stop_cmd // = 0x02be
addr == 16'h2be ? 16'h303e :  // <0090> push rtna // func set_plan_stop_cmd
addr == 16'h2bf ? 16'h5e00 :  // <0091> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h2c0 ? 16'h6290 :  // <0091> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h2c1 ? 16'hf815 :  // <0091> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h2c2 ? 16'hf816 :  // <0091> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h2c3 ? 16'hfc00 :  // <0092> swapra = nop
addr == 16'h2c4 ? 16'hfba0 :  // <0093> call :init_plan_stop
addr == 16'h2c5 ? 16'h02f7 :  // <0093> "
addr == 16'h2c6 ? 16'hfc00 :  // <0093> "
addr == 16'h2c7 ? 16'hf80c :  // <0094> pop rtna // end_func
addr == 16'h2c8 ? 16'hfc00 :  // <0094> swapra = nop

// ######## func set_plan_crank_cmd // = 0x02c9
addr == 16'h2c9 ? 16'h303e :  // <0096> push rtna // func set_plan_crank_cmd
addr == 16'h2ca ? 16'h5e00 :  // <0097> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h2cb ? 16'h6290 :  // <0097> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h2cc ? 16'hf815 :  // <0097> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h2cd ? 16'hf816 :  // <0097> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h2ce ? 16'hfc00 :  // <0098> swapra = nop
addr == 16'h2cf ? 16'hfba0 :  // <0099> call :init_plan_crank
addr == 16'h2d0 ? 16'h0336 :  // <0099> "
addr == 16'h2d1 ? 16'hfc00 :  // <0099> "
addr == 16'h2d2 ? 16'hf80c :  // <0100> pop rtna // end_func
addr == 16'h2d3 ? 16'hfc00 :  // <0100> swapra = nop

// ######## func set_plan_warmup_cmd // = 0x02d4
addr == 16'h2d4 ? 16'h303e :  // <0102> push rtna // func set_plan_warmup_cmd
addr == 16'h2d5 ? 16'h5e00 :  // <0103> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h2d6 ? 16'h6290 :  // <0103> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h2d7 ? 16'hf815 :  // <0103> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h2d8 ? 16'hf816 :  // <0103> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h2d9 ? 16'hfc00 :  // <0104> swapra = nop
addr == 16'h2da ? 16'hfba0 :  // <0105> call :init_plan_warmup
addr == 16'h2db ? 16'h039b :  // <0105> "
addr == 16'h2dc ? 16'hfc00 :  // <0105> "
addr == 16'h2dd ? 16'hf80c :  // <0106> pop rtna // end_func
addr == 16'h2de ? 16'hfc00 :  // <0106> swapra = nop

// ######## func set_plan_run_cmd // = 0x02df
addr == 16'h2df ? 16'h303e :  // <0108> push rtna // func set_plan_run_cmd
addr == 16'h2e0 ? 16'h5e00 :  // <0109> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h2e1 ? 16'h6290 :  // <0109> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h2e2 ? 16'hf815 :  // <0109> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h2e3 ? 16'hf816 :  // <0109> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h2e4 ? 16'hfc00 :  // <0110> swapra = nop
addr == 16'h2e5 ? 16'hfba0 :  // <0111> call :init_plan_run
addr == 16'h2e6 ? 16'h041f :  // <0111> "
addr == 16'h2e7 ? 16'hfc00 :  // <0111> "
addr == 16'h2e8 ? 16'hf80c :  // <0112> pop rtna // end_func
addr == 16'h2e9 ? 16'hfc00 :  // <0112> swapra = nop

// ######## func set_plan_learn_cmd // = 0x02ea
addr == 16'h2ea ? 16'h303e :  // <0114> push rtna // func set_plan_learn_cmd
addr == 16'h2eb ? 16'h5e00 :  // <0115> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h2ec ? 16'h6290 :  // <0115> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h2ed ? 16'hf815 :  // <0115> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h2ee ? 16'hf816 :  // <0115> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h2ef ? 16'hfc00 :  // <0116> swapra = nop
addr == 16'h2f0 ? 16'hfba0 :  // <0117> call :init_plan_learn_stoich
addr == 16'h2f1 ? 16'h049e :  // <0117> "
addr == 16'h2f2 ? 16'hfc00 :  // <0117> "
addr == 16'h2f3 ? 16'hf80c :  // <0118> pop rtna // end_func
addr == 16'h2f4 ? 16'hfc00 :  // <0118> swapra = nop


// :plan_name_stop // = 0x02f5
// "STP\x0"
addr == 16'h2f5 ? 16'h5453 :  // <0002> TS
addr == 16'h2f6 ? 16'h0050 :  // <0002>  P

// ######## func init_plan_stop // = 0x02f7
addr == 16'h2f7 ? 16'h303e :  // <0004> push rtna // func init_plan_stop
// set up the stop plan.
addr == 16'h2f8 ? 16'hfba0 :  // <0006> call :clear_ign_history
addr == 16'h2f9 ? 16'h0667 :  // <0006> "
addr == 16'h2fa ? 16'hfc00 :  // <0006> "
// set noise filter to measure RPM between 50 and 1160 to indicate cranking.
addr == 16'h2fb ? 16'h5e00 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_hi = 0
addr == 16'h2fc ? 16'h6284 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_lo = 132
addr == 16'h2fd ? 16'h57a0 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_write_data = 603
addr == 16'h2fe ? 16'h025b :  // <0008> "
addr == 16'h2ff ? 16'h5e00 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h300 ? 16'h6286 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 134
addr == 16'h301 ? 16'h57a0 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h302 ? 16'h36b0 :  // <0009> "
addr == 16'h303 ? 16'h83a0 :  // <0010> ign_timeout_len_jf = ([rpm_to_jf 50])
addr == 16'h304 ? 16'h36b0 :  // <0010> "
// normally puff length is not touched by an init func.
// this one does it because it's part of the program boot,
// and also a good idea whenever stopping the engine.
// this might interrupt a puff in mid-pulse, but no matter in this case.
addr == 16'h305 ? 16'h5e00 :  // <0015> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h306 ? 16'h6292 :  // <0015> ram $ram_next_puff_len_us = 0 // av_ad_lo = 146
addr == 16'h307 ? 16'h5600 :  // <0015> ram $ram_next_puff_len_us = 0 // av_write_data = 0
addr == 16'h308 ? 16'h8600 :  // <0016> puff_len_us = 0

// memorize state.
addr == 16'h309 ? 16'h5e00 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_ad_hi = 0
addr == 16'h30a ? 16'h628a :  // <0019> ram $ram_plan_name = :plan_name_stop // av_ad_lo = 138
addr == 16'h30b ? 16'h57a0 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_write_data = :plan_name_stop
addr == 16'h30c ? 16'h02f5 :  // <0019> "
addr == 16'h30d ? 16'h5e00 :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_ad_hi = 0
addr == 16'h30e ? 16'h628c :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_ad_lo = 140
addr == 16'h30f ? 16'h57a0 :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_write_data = :puff_len_stop
addr == 16'h310 ? 16'h031c :  // <0020> "
addr == 16'h311 ? 16'h5e00 :  // <0021> ram $ram_transition_func = :leave_stop // av_ad_hi = 0
addr == 16'h312 ? 16'h628e :  // <0021> ram $ram_transition_func = :leave_stop // av_ad_lo = 142
addr == 16'h313 ? 16'h57a0 :  // <0021> ram $ram_transition_func = :leave_stop // av_write_data = :leave_stop
addr == 16'h314 ? 16'h0320 :  // <0021> "
addr == 16'h315 ? 16'h5e00 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_hi = 0
addr == 16'h316 ? 16'h6290 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_lo = 144
addr == 16'h317 ? 16'h57a0 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_write_data = :destroy_plan_stop
addr == 16'h318 ? 16'h031b :  // <0022> "
addr == 16'h319 ? 16'hf80c :  // <0023> pop rtna // end_func
addr == 16'h31a ? 16'hfc00 :  // <0023> swapra = nop

// ######## func destroy_plan_stop // = 0x031b
addr == 16'h31b ? 16'hfc00 :  // <0026> swapra = nop

// ######## func puff_len_stop // = 0x031c
addr == 16'h31c ? 16'h5e00 :  // <0029> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h31d ? 16'h6292 :  // <0029> ram $ram_next_puff_len_us = 0 // av_ad_lo = 146
addr == 16'h31e ? 16'h5600 :  // <0029> ram $ram_next_puff_len_us = 0 // av_write_data = 0
addr == 16'h31f ? 16'hfc00 :  // <0030> swapra = nop

// ######## func leave_stop // = 0x0320
addr == 16'h320 ? 16'h303e :  // <0032> push rtna // func leave_stop
// leave stop plan if ignition switch is turned on AND more than half if the ignition history is valid.
// requiring both conditions prevents spurious noise readings from starting up the injection.
addr == 16'h321 ? 16'h001e :  // <0035> a = power_duty
addr == 16'h322 ? 16'h0680 :  // <0036> b = $ign_switch_off_mask
addr == 16'h323 ? 16'he403 :  // <0037> bn and0z :stay
addr == 16'h324 ? 16'h0332 :  // <0037> "
addr == 16'h325 ? 16'h5e00 :  // <0038> ram a = $ram_ign_bad_samples // av_ad_hi = 0
addr == 16'h326 ? 16'h6282 :  // <0038> ram a = $ram_ign_bad_samples // av_ad_lo = 130
addr == 16'h327 ? 16'h0015 :  // <0038> ram a = $ram_ign_bad_samples // a = av_write_data // start read cycle
addr == 16'h328 ? 16'h0016 :  // <0038> ram a = $ram_ign_bad_samples // a = av_read_data // finish read cycle
addr == 16'h329 ? 16'h0608 :  // <0039> b = ($ign_history_len / 2)
addr == 16'h32a ? 16'he006 :  // <0040> br gt :stay
addr == 16'h32b ? 16'h0332 :  // <0040> "
addr == 16'h32c ? 16'hfba0 :  // <0041> call :destroy_plan_stop
addr == 16'h32d ? 16'h031b :  // <0041> "
addr == 16'h32e ? 16'hfc00 :  // <0041> "
addr == 16'h32f ? 16'hfba0 :  // <0042> call :init_plan_crank
addr == 16'h330 ? 16'h0336 :  // <0042> "
addr == 16'h331 ? 16'hfc00 :  // <0042> "
// :stay // = 0x0332
addr == 16'h332 ? 16'hf80c :  // <0044> pop rtna // end_func
addr == 16'h333 ? 16'hfc00 :  // <0044> swapra = nop



// escalating puff length by 1500 us per puff while cranking slowly at e.g. 80 RPM
// on a frozen winter morning will ramp up from 5000 to 20000 us length in about 7 seconds.

// :plan_name_crank // = 0x0334
// "CR\x0"
addr == 16'h334 ? 16'h5243 :  // <0011> RC
addr == 16'h335 ? 16'h0000 :  // <0011>   

// ######## func init_plan_crank // = 0x0336
addr == 16'h336 ? 16'h303e :  // <0013> push rtna // func init_plan_crank
// set up the crank plan.
addr == 16'h337 ? 16'h5e00 :  // <0015> ram $ram_puff_count = 0 // av_ad_hi = 0
addr == 16'h338 ? 16'h6294 :  // <0015> ram $ram_puff_count = 0 // av_ad_lo = 148
addr == 16'h339 ? 16'h5600 :  // <0015> ram $ram_puff_count = 0 // av_write_data = 0
// set noise filter to measure RPM between 50 and 8000 to indicate running.
addr == 16'h33a ? 16'h5e00 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_ad_hi = 0
addr == 16'h33b ? 16'h6284 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_ad_lo = 132
addr == 16'h33c ? 16'h5657 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_write_data = 87
addr == 16'h33d ? 16'h5e00 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h33e ? 16'h6286 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 134
addr == 16'h33f ? 16'h57a0 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h340 ? 16'h36b0 :  // <0018> "
addr == 16'h341 ? 16'h83a0 :  // <0019> ign_timeout_len_jf = ([rpm_to_jf 50])
addr == 16'h342 ? 16'h36b0 :  // <0019> "
// normally puff length is not touched by an init func.
// this one does it because it's the beginning of a crank cycle, and puff length
// should be enabled for the first puff.  otherwise the first puff would be missed.
addr == 16'h343 ? 16'h5e00 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_hi = 0
addr == 16'h344 ? 16'h6292 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_lo = 146
addr == 16'h345 ? 16'h57a0 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_write_data = 5000
addr == 16'h346 ? 16'h1388 :  // <0023> "
addr == 16'h347 ? 16'h87a0 :  // <0024> puff_len_us = $crank_min_puff_len_us
addr == 16'h348 ? 16'h1388 :  // <0024> "
// clear ignition history again to eliminate samples where the motor kept spinning after switching from plan_run to plan_stop.
addr == 16'h349 ? 16'hfba0 :  // <0026> call :clear_ign_history
addr == 16'h34a ? 16'h0667 :  // <0026> "
addr == 16'h34b ? 16'hfc00 :  // <0026> "

// memorize state.
addr == 16'h34c ? 16'h5e00 :  // <0029> ram $ram_plan_name = :plan_name_crank // av_ad_hi = 0
addr == 16'h34d ? 16'h628a :  // <0029> ram $ram_plan_name = :plan_name_crank // av_ad_lo = 138
addr == 16'h34e ? 16'h57a0 :  // <0029> ram $ram_plan_name = :plan_name_crank // av_write_data = :plan_name_crank
addr == 16'h34f ? 16'h0334 :  // <0029> "
addr == 16'h350 ? 16'h5e00 :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_ad_hi = 0
addr == 16'h351 ? 16'h628c :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_ad_lo = 140
addr == 16'h352 ? 16'h57a0 :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_write_data = :puff_len_crank
addr == 16'h353 ? 16'h035f :  // <0030> "
addr == 16'h354 ? 16'h5e00 :  // <0031> ram $ram_transition_func = :leave_crank // av_ad_hi = 0
addr == 16'h355 ? 16'h628e :  // <0031> ram $ram_transition_func = :leave_crank // av_ad_lo = 142
addr == 16'h356 ? 16'h57a0 :  // <0031> ram $ram_transition_func = :leave_crank // av_write_data = :leave_crank
addr == 16'h357 ? 16'h037d :  // <0031> "
addr == 16'h358 ? 16'h5e00 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_hi = 0
addr == 16'h359 ? 16'h6290 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_lo = 144
addr == 16'h35a ? 16'h57a0 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_write_data = :destroy_plan_crank
addr == 16'h35b ? 16'h035e :  // <0032> "
addr == 16'h35c ? 16'hf80c :  // <0033> pop rtna // end_func
addr == 16'h35d ? 16'hfc00 :  // <0033> swapra = nop

// ######## func destroy_plan_crank // = 0x035e
addr == 16'h35e ? 16'hfc00 :  // <0036> swapra = nop

// ######## func puff_len_crank // = 0x035f
addr == 16'h35f ? 16'h303e :  // <0038> push rtna // func puff_len_crank
addr == 16'h360 ? 16'h5e00 :  // <0039> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h361 ? 16'h6294 :  // <0039> ram a = $ram_puff_count // av_ad_lo = 148
addr == 16'h362 ? 16'h0015 :  // <0039> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h363 ? 16'h0016 :  // <0039> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h364 ? 16'h060a :  // <0040> b = $crank_max_puffs
addr == 16'h365 ? 16'he006 :  // <0041> br gt :puff_limit
addr == 16'h366 ? 16'h0374 :  // <0041> "
// linear escalation from min to max puff length, at a slope of crank_incr_us_per_puff.
addr == 16'h367 ? 16'h07a0 :  // <0043> b = $crank_incr_us_per_puff
addr == 16'h368 ? 16'h05dc :  // <0043> "
addr == 16'h369 ? 16'hfba0 :  // <0044> call :multiply
addr == 16'h36a ? 16'h0170 :  // <0044> "
addr == 16'h36b ? 16'hfc00 :  // <0044> "
addr == 16'h36c ? 16'h07a0 :  // <0045> b = $crank_min_puff_len_us
addr == 16'h36d ? 16'h1388 :  // <0045> "
addr == 16'h36e ? 16'h5e00 :  // <0046> ram $ram_next_puff_len_us = a+b // av_ad_hi = 0
addr == 16'h36f ? 16'h6292 :  // <0046> ram $ram_next_puff_len_us = a+b // av_ad_lo = 146
addr == 16'h370 ? 16'hc800 :  // <0046> ram $ram_next_puff_len_us = a+b // av_write_data = a+b
addr == 16'h371 ? 16'h5700 :  // <0046> "
addr == 16'h372 ? 16'he00f :  // <0047> jmp :done
addr == 16'h373 ? 16'h037b :  // <0047> "
// :puff_limit // = 0x0374
// prevent the puff counter from going higher & eventually rolling over.
addr == 16'h374 ? 16'h5e00 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_ad_hi = 0
addr == 16'h375 ? 16'h6294 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_ad_lo = 148
addr == 16'h376 ? 16'h560a :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_write_data = 10
// accept max puff len.
addr == 16'h377 ? 16'h5e00 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_hi = 0
addr == 16'h378 ? 16'h6292 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_lo = 146
addr == 16'h379 ? 16'h57a0 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_write_data = 20000
addr == 16'h37a ? 16'h4e20 :  // <0052> "
// :done // = 0x037b
addr == 16'h37b ? 16'hf80c :  // <0054> pop rtna // end_func
addr == 16'h37c ? 16'hfc00 :  // <0054> swapra = nop

// ######## func leave_crank // = 0x037d
addr == 16'h37d ? 16'h303e :  // <0056> push rtna // func leave_crank
addr == 16'h37e ? 16'hfba0 :  // <0057> call :check_engine_stop
addr == 16'h37f ? 16'h0956 :  // <0057> "
addr == 16'h380 ? 16'hfc00 :  // <0057> "
addr == 16'h381 ? 16'he400 :  // <0058> bn az :done
addr == 16'h382 ? 16'h0397 :  // <0058> "

// transition to warmup if RPM exceeds crank_success_rpm.
addr == 16'h383 ? 16'h5e00 :  // <0061> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h384 ? 16'h6280 :  // <0061> ram a = $ram_rpm_valid // av_ad_lo = 128
addr == 16'h385 ? 16'h0015 :  // <0061> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h386 ? 16'h0016 :  // <0061> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle
addr == 16'h387 ? 16'he000 :  // <0062> br az :stay
addr == 16'h388 ? 16'h0397 :  // <0062> "
addr == 16'h389 ? 16'h5e00 :  // <0063> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h38a ? 16'h627e :  // <0063> ram a = $ram_avg_rpm // av_ad_lo = 126
addr == 16'h38b ? 16'h0015 :  // <0063> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h38c ? 16'h0016 :  // <0063> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle
addr == 16'h38d ? 16'h07a0 :  // <0064> b = $crank_success_rpm
addr == 16'h38e ? 16'h0320 :  // <0064> "
addr == 16'h38f ? 16'he005 :  // <0065> br lt :stay
addr == 16'h390 ? 16'h0397 :  // <0065> "
addr == 16'h391 ? 16'hfba0 :  // <0066> call :destroy_plan_crank
addr == 16'h392 ? 16'h035e :  // <0066> "
addr == 16'h393 ? 16'hfc00 :  // <0066> "
addr == 16'h394 ? 16'hfba0 :  // <0067> call :init_plan_warmup
addr == 16'h395 ? 16'h039b :  // <0067> "
addr == 16'h396 ? 16'hfc00 :  // <0067> "
// :stay // = 0x0397

// :done // = 0x0397
addr == 16'h397 ? 16'hf80c :  // <0071> pop rtna // end_func
addr == 16'h398 ? 16'hfc00 :  // <0071> swapra = nop



// 0x4c0 = 1216 = 120 degF at the sensor location outside the engine block.
// 750 = 0 degF.
// max 6000 & min 4500 over a temp range 750 to 0x4c0 gives 6900 us puff at 74 deg F.  program rev 594.
// this is used if the engine temp is unavailable.

// :plan_name_warmup // = 0x0399
// "WM\x0"
addr == 16'h399 ? 16'h4d57 :  // <0016> MW
addr == 16'h39a ? 16'h0000 :  // <0016>   

// ######## func init_plan_warmup // = 0x039b
// set up the warmup plan.
addr == 16'h39b ? 16'h5e00 :  // <0020> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h39c ? 16'h6214 :  // <0020> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h39d ? 16'h0015 :  // <0020> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h39e ? 16'h0016 :  // <0020> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h39f ? 16'h063c :  // <0021> b = $warmup_timeout_sec
addr == 16'h3a0 ? 16'h5e00 :  // <0022> ram $ram_warmup_timeout_at_pass = a+b // av_ad_hi = 0
addr == 16'h3a1 ? 16'h6298 :  // <0022> ram $ram_warmup_timeout_at_pass = a+b // av_ad_lo = 152
addr == 16'h3a2 ? 16'hc800 :  // <0022> ram $ram_warmup_timeout_at_pass = a+b // av_write_data = a+b
addr == 16'h3a3 ? 16'h5700 :  // <0022> "

// memorize state.
addr == 16'h3a4 ? 16'h5e00 :  // <0025> ram $ram_plan_name = :plan_name_warmup // av_ad_hi = 0
addr == 16'h3a5 ? 16'h628a :  // <0025> ram $ram_plan_name = :plan_name_warmup // av_ad_lo = 138
addr == 16'h3a6 ? 16'h57a0 :  // <0025> ram $ram_plan_name = :plan_name_warmup // av_write_data = :plan_name_warmup
addr == 16'h3a7 ? 16'h0399 :  // <0025> "
addr == 16'h3a8 ? 16'h5e00 :  // <0026> ram $ram_puff_len_func = :puff_len_warmup // av_ad_hi = 0
addr == 16'h3a9 ? 16'h628c :  // <0026> ram $ram_puff_len_func = :puff_len_warmup // av_ad_lo = 140
addr == 16'h3aa ? 16'h57a0 :  // <0026> ram $ram_puff_len_func = :puff_len_warmup // av_write_data = :puff_len_warmup
addr == 16'h3ab ? 16'h03b6 :  // <0026> "
addr == 16'h3ac ? 16'h5e00 :  // <0027> ram $ram_transition_func = :leave_warmup // av_ad_hi = 0
addr == 16'h3ad ? 16'h628e :  // <0027> ram $ram_transition_func = :leave_warmup // av_ad_lo = 142
addr == 16'h3ae ? 16'h57a0 :  // <0027> ram $ram_transition_func = :leave_warmup // av_write_data = :leave_warmup
addr == 16'h3af ? 16'h03e8 :  // <0027> "
addr == 16'h3b0 ? 16'h5e00 :  // <0028> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_ad_hi = 0
addr == 16'h3b1 ? 16'h6290 :  // <0028> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_ad_lo = 144
addr == 16'h3b2 ? 16'h57a0 :  // <0028> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_write_data = :destroy_plan_warmup
addr == 16'h3b3 ? 16'h03b5 :  // <0028> "
addr == 16'h3b4 ? 16'hfc00 :  // <0029> swapra = nop

// ######## func destroy_plan_warmup // = 0x03b5
addr == 16'h3b5 ? 16'hfc00 :  // <0032> swapra = nop

// ######## func puff_len_warmup // = 0x03b6
addr == 16'h3b6 ? 16'h3004 :  // <0034> push x // func puff_len_warmup
addr == 16'h3b7 ? 16'h303e :  // <0034> push rtna // "
// x = enrichment us.
addr == 16'h3b8 ? 16'h13a0 :  // <0036> x = $warmup_limping_enrichment_us
addr == 16'h3b9 ? 16'h07d0 :  // <0036> "

// check engine block temp sensor.  if valid, enrich by a linear function:
// {warmup_min_temp_adc...warmup_success_temp_adc} -> {$warmup_max_enrichment_us...0}
addr == 16'h3ba ? 16'h0202 :  // <0040> a = $anmux_engine_block_temp

addr == 16'h3bb ? 16'h0351 :  // <0041> a = a<<1
addr == 16'h3bc ? 16'h0618 :  // <0041> b = 24
addr == 16'h3bd ? 16'h5e00 :  // <0041> av_ad_hi = 0
addr == 16'h3be ? 16'h6300 :  // <0041> av_ad_lo = ad0
addr == 16'h3bf ? 16'h0415 :  // <0041> b = av_write_data
addr == 16'h3c0 ? 16'h0416 :  // <0041> b = av_read_data

// b = sensor reading in adc counts.
addr == 16'h3c1 ? 16'h03a0 :  // <0043> a = $temp_ceiling_adc
addr == 16'h3c2 ? 16'h0ff0 :  // <0043> "
addr == 16'h3c3 ? 16'he005 :  // <0044> br lt :temp_invalid
addr == 16'h3c4 ? 16'h03de :  // <0044> "
addr == 16'h3c5 ? 16'h03a0 :  // <0045> a = $warmup_success_temp_adc
addr == 16'h3c6 ? 16'h04c0 :  // <0045> "
addr == 16'h3c7 ? 16'he005 :  // <0046> br lt :too_warm
addr == 16'h3c8 ? 16'h03de :  // <0046> "
addr == 16'h3c9 ? 16'h03a0 :  // <0047> a = $warmup_min_temp_adc
addr == 16'h3ca ? 16'h02ee :  // <0047> "
addr == 16'h3cb ? 16'he005 :  // <0048> br lt :in_range
addr == 16'h3cc ? 16'h03cf :  // <0048> "
addr == 16'h3cd ? 16'h07a0 :  // <0049> b = $warmup_min_temp_adc
addr == 16'h3ce ? 16'h02ee :  // <0049> "
// :in_range // = 0x03cf
// negate the sensor reading so as to subtract it from warmup_success_temp_adc.
addr == 16'h3cf ? 16'h0360 :  // <0052> a = 0xffff
addr == 16'h3d0 ? 16'hc800 :  // <0053> b = xor
addr == 16'h3d1 ? 16'h0738 :  // <0053> "
addr == 16'h3d2 ? 16'h0201 :  // <0054> a = 1
addr == 16'h3d3 ? 16'hc800 :  // <0055> b = a+b
addr == 16'h3d4 ? 16'h0700 :  // <0055> "
addr == 16'h3d5 ? 16'h03a0 :  // <0056> a = $warmup_success_temp_adc
addr == 16'h3d6 ? 16'h04c0 :  // <0056> "
addr == 16'h3d7 ? 16'hc800 :  // <0057> b = a+b
addr == 16'h3d8 ? 16'h0700 :  // <0057> "
// b = how many counts "cold" we are.  multiply that by the slope warmup_us_per_cold_adc.
addr == 16'h3d9 ? 16'h020c :  // <0059> a = $warmup_us_per_cold_adc
addr == 16'h3da ? 16'hfba0 :  // <0060> call :multiply
addr == 16'h3db ? 16'h0170 :  // <0060> "
addr == 16'h3dc ? 16'hfc00 :  // <0060> "
addr == 16'h3dd ? 16'h1000 :  // <0061> x = a
// :too_warm // = 0x03de
// :temp_invalid // = 0x03de

// apply total of base amount and enrichment.
// $warmup_min_puff_len_us <= total <= ($warmup_min_puff_len_us + $warmup_max_enrichment_us)
addr == 16'h3de ? 16'h03a0 :  // <0067> a = $warmup_min_puff_len_us
addr == 16'h3df ? 16'h09c4 :  // <0067> "
addr == 16'h3e0 ? 16'h0404 :  // <0068> b = x
addr == 16'h3e1 ? 16'h5e00 :  // <0069> ram $ram_next_puff_len_us = a+b // av_ad_hi = 0
addr == 16'h3e2 ? 16'h6292 :  // <0069> ram $ram_next_puff_len_us = a+b // av_ad_lo = 146
addr == 16'h3e3 ? 16'hc800 :  // <0069> ram $ram_next_puff_len_us = a+b // av_write_data = a+b
addr == 16'h3e4 ? 16'h5700 :  // <0069> "
addr == 16'h3e5 ? 16'hf80c :  // <0070> pop rtna // end_func
addr == 16'h3e6 ? 16'h100c :  // <0070> pop x // "
addr == 16'h3e7 ? 16'hfc00 :  // <0070> swapra = nop

// ######## func leave_warmup // = 0x03e8
addr == 16'h3e8 ? 16'h303e :  // <0072> push rtna // func leave_warmup
addr == 16'h3e9 ? 16'hfba0 :  // <0073> call :check_engine_stop
addr == 16'h3ea ? 16'h0956 :  // <0073> "
addr == 16'h3eb ? 16'hfc00 :  // <0073> "
addr == 16'h3ec ? 16'he400 :  // <0074> bn az :done
addr == 16'h3ed ? 16'h041b :  // <0074> "

// transition to plan_run if warmup has expired.
addr == 16'h3ee ? 16'h5e00 :  // <0077> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h3ef ? 16'h6214 :  // <0077> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h3f0 ? 16'h0015 :  // <0077> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h3f1 ? 16'h0016 :  // <0077> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h3f2 ? 16'h5e00 :  // <0078> ram b = $ram_warmup_timeout_at_pass // av_ad_hi = 0
addr == 16'h3f3 ? 16'h6298 :  // <0078> ram b = $ram_warmup_timeout_at_pass // av_ad_lo = 152
addr == 16'h3f4 ? 16'h0415 :  // <0078> ram b = $ram_warmup_timeout_at_pass // b = av_write_data // start read cycle
addr == 16'h3f5 ? 16'h0416 :  // <0078> ram b = $ram_warmup_timeout_at_pass // b = av_read_data // finish read cycle

addr == 16'h3f6 ? 16'h0000 :  // <0083> a = a
addr == 16'h3f7 ? 16'h0401 :  // <0083> b = b


addr == 16'h3f8 ? 16'he406 :  // <0083> bn gt :else_1016
addr == 16'h3f9 ? 16'h0402 :  // <0083> "

addr == 16'h3fa ? 16'hfba0 :  // <0083> call :destroy_plan_warmup
addr == 16'h3fb ? 16'h03b5 :  // <0083> "
addr == 16'h3fc ? 16'hfc00 :  // <0083> "
addr == 16'h3fd ? 16'hfba0 :  // <0083> call :init_plan_run
addr == 16'h3fe ? 16'h041f :  // <0083> "
addr == 16'h3ff ? 16'hfc00 :  // <0083> "
addr == 16'h400 ? 16'he00f :  // <0083> jmp :done
addr == 16'h401 ? 16'h041b :  // <0083> "


// :else_1016 // = 0x0402

// :end_1016 // = 0x0402


// transition to plan_run if engine block temp sensor is valid, and temp
// exceeds warmup_success_temp_adc.
addr == 16'h402 ? 16'h0202 :  // <0087> a = $anmux_engine_block_temp

addr == 16'h403 ? 16'h0351 :  // <0088> a = a<<1
addr == 16'h404 ? 16'h0618 :  // <0088> b = 24
addr == 16'h405 ? 16'h5e00 :  // <0088> av_ad_hi = 0
addr == 16'h406 ? 16'h6300 :  // <0088> av_ad_lo = ad0
addr == 16'h407 ? 16'h0415 :  // <0088> b = av_write_data
addr == 16'h408 ? 16'h0416 :  // <0088> b = av_read_data

addr == 16'h409 ? 16'h03a0 :  // <0089> a = $temp_ceiling_adc
addr == 16'h40a ? 16'h0ff0 :  // <0089> "

addr == 16'h40b ? 16'h0000 :  // <0096> a = a
addr == 16'h40c ? 16'h0401 :  // <0096> b = b


addr == 16'h40d ? 16'he406 :  // <0096> bn gt :else_1037
addr == 16'h40e ? 16'h041b :  // <0096> "

addr == 16'h40f ? 16'h03a0 :  // <0096> a = $warmup_success_temp_adc
addr == 16'h410 ? 16'h04c0 :  // <0096> "

addr == 16'h411 ? 16'h0000 :  // <0096> a = a
addr == 16'h412 ? 16'h0401 :  // <0096> b = b


addr == 16'h413 ? 16'he405 :  // <0096> bn lt :else_1043
addr == 16'h414 ? 16'h041b :  // <0096> "

addr == 16'h415 ? 16'hfba0 :  // <0096> call :destroy_plan_warmup
addr == 16'h416 ? 16'h03b5 :  // <0096> "
addr == 16'h417 ? 16'hfc00 :  // <0096> "
addr == 16'h418 ? 16'hfba0 :  // <0096> call :init_plan_run
addr == 16'h419 ? 16'h041f :  // <0096> "
addr == 16'h41a ? 16'hfc00 :  // <0096> "


// :else_1043 // = 0x041b

// :end_1043 // = 0x041b



// :else_1037 // = 0x041b

// :end_1037 // = 0x041b


// :done // = 0x041b
addr == 16'h41b ? 16'hf80c :  // <0099> pop rtna // end_func
addr == 16'h41c ? 16'hfc00 :  // <0099> swapra = nop


// :plan_name_run // = 0x041d
// "RN\x0"
addr == 16'h41d ? 16'h4e52 :  // <0002> NR
addr == 16'h41e ? 16'h0000 :  // <0002>   

// trim puff length by o2 sensor every 200 ms.

// trim puff length as needed, by about 1000 us per second.



// ######## func init_plan_run // = 0x041f
// set up the run plan.

// memorize state.
addr == 16'h41f ? 16'h5e00 :  // <0021> ram $ram_plan_name = :plan_name_run // av_ad_hi = 0
addr == 16'h420 ? 16'h628a :  // <0021> ram $ram_plan_name = :plan_name_run // av_ad_lo = 138
addr == 16'h421 ? 16'h57a0 :  // <0021> ram $ram_plan_name = :plan_name_run // av_write_data = :plan_name_run
addr == 16'h422 ? 16'h041d :  // <0021> "
addr == 16'h423 ? 16'h5e00 :  // <0022> ram $ram_puff_len_func = :puff_len_run // av_ad_hi = 0
addr == 16'h424 ? 16'h628c :  // <0022> ram $ram_puff_len_func = :puff_len_run // av_ad_lo = 140
addr == 16'h425 ? 16'h57a0 :  // <0022> ram $ram_puff_len_func = :puff_len_run // av_write_data = :puff_len_run
addr == 16'h426 ? 16'h0431 :  // <0022> "
addr == 16'h427 ? 16'h5e00 :  // <0023> ram $ram_transition_func = :leave_run // av_ad_hi = 0
addr == 16'h428 ? 16'h628e :  // <0023> ram $ram_transition_func = :leave_run // av_ad_lo = 142
addr == 16'h429 ? 16'h57a0 :  // <0023> ram $ram_transition_func = :leave_run // av_write_data = :leave_run
addr == 16'h42a ? 16'h046c :  // <0023> "
addr == 16'h42b ? 16'h5e00 :  // <0024> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_hi = 0
addr == 16'h42c ? 16'h6290 :  // <0024> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_lo = 144
addr == 16'h42d ? 16'h57a0 :  // <0024> ram $ram_destroy_plan_func = :destroy_plan_run // av_write_data = :destroy_plan_run
addr == 16'h42e ? 16'h0430 :  // <0024> "
addr == 16'h42f ? 16'hfc00 :  // <0025> swapra = nop

// ######## func destroy_plan_run // = 0x0430
addr == 16'h430 ? 16'hfc00 :  // <0028> swapra = nop

// ######## func puff_len_run // = 0x0431
addr == 16'h431 ? 16'h3002 :  // <0030> push i // func puff_len_run
addr == 16'h432 ? 16'h3003 :  // <0030> push j // "
addr == 16'h433 ? 16'h5e00 :  // <0031> ram i = $ram_run_ticks_remain // av_ad_hi = 0
addr == 16'h434 ? 16'h629a :  // <0031> ram i = $ram_run_ticks_remain // av_ad_lo = 154
addr == 16'h435 ? 16'h0815 :  // <0031> ram i = $ram_run_ticks_remain // i = av_write_data // start read cycle
addr == 16'h436 ? 16'h0816 :  // <0031> ram i = $ram_run_ticks_remain // i = av_read_data // finish read cycle

addr == 16'h437 ? 16'h0002 :  // <0055> a = i
addr == 16'h438 ? 16'h0600 :  // <0055> b = 0


addr == 16'h439 ? 16'he406 :  // <0055> bn gt :else_1081
addr == 16'h43a ? 16'h0442 :  // <0055> "

addr == 16'h43b ? 16'h0f60 :  // <0055> j = -1
addr == 16'h43c ? 16'h5e00 :  // <0055> ram $ram_run_ticks_remain = i+j // av_ad_hi = 0
addr == 16'h43d ? 16'h629a :  // <0055> ram $ram_run_ticks_remain = i+j // av_ad_lo = 154
addr == 16'h43e ? 16'hc800 :  // <0055> ram $ram_run_ticks_remain = i+j // av_write_data = i+j
addr == 16'h43f ? 16'h5710 :  // <0055> "

addr == 16'h440 ? 16'he00f :  // <0055> jmp :end_1081
addr == 16'h441 ? 16'h0469 :  // <0055> "
// :else_1081 // = 0x0442

addr == 16'h442 ? 16'h5e00 :  // <0055> ram $ram_run_ticks_remain = $run_ticks_per_o2_trim // av_ad_hi = 0
addr == 16'h443 ? 16'h629a :  // <0055> ram $ram_run_ticks_remain = $run_ticks_per_o2_trim // av_ad_lo = 154
addr == 16'h444 ? 16'h560a :  // <0055> ram $ram_run_ticks_remain = $run_ticks_per_o2_trim // av_write_data = 10

// i = old puff length, j = puff length increment.
addr == 16'h445 ? 16'h5e00 :  // <0055> ram i = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'h446 ? 16'h6292 :  // <0055> ram i = $ram_next_puff_len_us // av_ad_lo = 146
addr == 16'h447 ? 16'h0815 :  // <0055> ram i = $ram_next_puff_len_us // i = av_write_data // start read cycle
addr == 16'h448 ? 16'h0816 :  // <0055> ram i = $ram_next_puff_len_us // i = av_read_data // finish read cycle
addr == 16'h449 ? 16'h0e00 :  // <0055> j = 0
addr == 16'h44a ? 16'h0205 :  // <0055> a = $o2_adc_channel

addr == 16'h44b ? 16'h0351 :  // <0055> a = a<<1
addr == 16'h44c ? 16'h0628 :  // <0055> b = 40
addr == 16'h44d ? 16'h5e00 :  // <0055> av_ad_hi = 0
addr == 16'h44e ? 16'h6300 :  // <0055> av_ad_lo = ad0
addr == 16'h44f ? 16'h0415 :  // <0055> b = av_write_data
addr == 16'h450 ? 16'h0416 :  // <0055> b = av_read_data


addr == 16'h451 ? 16'h0001 :  // <0055> a = b
addr == 16'h452 ? 16'h07a0 :  // <0055> b = 588
addr == 16'h453 ? 16'h024c :  // <0055> "


addr == 16'h454 ? 16'he405 :  // <0055> bn lt :else_1108
addr == 16'h455 ? 16'h045e :  // <0055> "

// sensing a lean condition.  trim up to enrich.

addr == 16'h456 ? 16'h0002 :  // <0055> a = i
addr == 16'h457 ? 16'h07a0 :  // <0055> b = 10000
addr == 16'h458 ? 16'h2710 :  // <0055> "


addr == 16'h459 ? 16'he405 :  // <0055> bn lt :else_1113
addr == 16'h45a ? 16'h045c :  // <0055> "

addr == 16'h45b ? 16'h0ec8 :  // <0055> j = $run_puff_step_up_us


// :else_1113 // = 0x045c

// :end_1113 // = 0x045c


addr == 16'h45c ? 16'he00f :  // <0055> jmp :end_1108
addr == 16'h45d ? 16'h0465 :  // <0055> "
// :else_1108 // = 0x045e

// sensing a rich condition.  trim down to lean it out.

addr == 16'h45e ? 16'h0002 :  // <0055> a = i
addr == 16'h45f ? 16'h07a0 :  // <0055> b = 2000
addr == 16'h460 ? 16'h07d0 :  // <0055> "


addr == 16'h461 ? 16'he406 :  // <0055> bn gt :else_1121
addr == 16'h462 ? 16'h0465 :  // <0055> "

addr == 16'h463 ? 16'h0fa0 :  // <0055> j = $run_puff_step_down_us
addr == 16'h464 ? 16'hff9b :  // <0055> "


// :else_1121 // = 0x0465

// :end_1121 // = 0x0465


// :end_1108 // = 0x0465

addr == 16'h465 ? 16'h5e00 :  // <0055> ram $ram_next_puff_len_us = i+j // av_ad_hi = 0
addr == 16'h466 ? 16'h6292 :  // <0055> ram $ram_next_puff_len_us = i+j // av_ad_lo = 146
addr == 16'h467 ? 16'hc800 :  // <0055> ram $ram_next_puff_len_us = i+j // av_write_data = i+j
addr == 16'h468 ? 16'h5710 :  // <0055> "

// :end_1081 // = 0x0469

addr == 16'h469 ? 16'h0c0c :  // <0056> pop j // end_func
addr == 16'h46a ? 16'h080c :  // <0056> pop i // "
addr == 16'h46b ? 16'hfc00 :  // <0056> swapra = nop

// ######## func leave_run // = 0x046c
addr == 16'h46c ? 16'h303e :  // <0058> push rtna // func leave_run
addr == 16'h46d ? 16'hfba0 :  // <0059> call :check_engine_stop
addr == 16'h46e ? 16'h0956 :  // <0059> "
addr == 16'h46f ? 16'hfc00 :  // <0059> "
addr == 16'h470 ? 16'hf80c :  // <0060> pop rtna // end_func
addr == 16'h471 ? 16'hfc00 :  // <0060> swapra = nop



// :rpm_cells // = 0x0472
addr == 16'h472 ? 16'h01f4 :  // <0004> 500
addr == 16'h473 ? 16'h0271 :  // <0005> 625
addr == 16'h474 ? 16'h030d :  // <0006> 781
addr == 16'h475 ? 16'h03d1 :  // <0007> 977
addr == 16'h476 ? 16'h04c5 :  // <0008> 1221
addr == 16'h477 ? 16'h05f6 :  // <0009> 1526
addr == 16'h478 ? 16'h0773 :  // <0010> 1907
addr == 16'h479 ? 16'h0950 :  // <0011> 2384
addr == 16'h47a ? 16'h0ba4 :  // <0012> 2980
addr == 16'h47b ? 16'h0e8d :  // <0013> 3725
addr == 16'h47c ? 16'h1231 :  // <0014> 4657
addr == 16'h47d ? 16'h16bd :  // <0015> 5821
addr == 16'h47e ? 16'h1c6c :  // <0016> 7276
addr == 16'h47f ? 16'hffff :  // <0017> 0xffff


// trim puff length by o2 sensor every 200 ms.

// trim puff length as needed.

// o2 sensor interpetation & state machine.

// ######## func find_rpm_cell // = 0x0480
addr == 16'h480 ? 16'h3002 :  // <0042> push i // func find_rpm_cell
addr == 16'h481 ? 16'h3003 :  // <0042> push j // "
addr == 16'h482 ? 16'h3005 :  // <0042> push y // "
addr == 16'h483 ? 16'h1400 :  // <0043> y = a
addr == 16'h484 ? 16'h0a01 :  // <0044> i = 1
addr == 16'h485 ? 16'h0760 :  // <0045> b = 0xffff
addr == 16'h486 ? 16'he007 :  // <0046> br eq :found
addr == 16'h487 ? 16'h0495 :  // <0046> "
// :next_cell // = 0x0488
addr == 16'h488 ? 16'h0fa0 :  // <0048> j = :rpm_cells
addr == 16'h489 ? 16'h0472 :  // <0048> "
addr == 16'h48a ? 16'hc800 :  // <0049> fetch a from i+j
addr == 16'h48b ? 16'hd310 :  // <0049> "
addr == 16'h48c ? 16'h03b0 :  // <0049> "
addr == 16'h48d ? 16'h0405 :  // <0050> b = y
addr == 16'h48e ? 16'he006 :  // <0051> br gt :found
addr == 16'h48f ? 16'h0495 :  // <0051> "
addr == 16'h490 ? 16'h0e01 :  // <0052> j = 1
addr == 16'h491 ? 16'hc800 :  // <0053> i = i+j
addr == 16'h492 ? 16'h0b10 :  // <0053> "
addr == 16'h493 ? 16'he00f :  // <0054> jmp :next_cell
addr == 16'h494 ? 16'h0488 :  // <0054> "
// :found // = 0x0495
addr == 16'h495 ? 16'h0f60 :  // <0056> j = -1
addr == 16'h496 ? 16'hc800 :  // <0057> a = i+j
addr == 16'h497 ? 16'h0310 :  // <0057> "
addr == 16'h498 ? 16'h140c :  // <0058> pop y // end_func
addr == 16'h499 ? 16'h0c0c :  // <0058> pop j // "
addr == 16'h49a ? 16'h080c :  // <0058> pop i // "
addr == 16'h49b ? 16'hfc00 :  // <0058> swapra = nop

// :plan_name_learn_stoich // = 0x049c
// "LN\x0"
addr == 16'h49c ? 16'h4e4c :  // <0061> NL
addr == 16'h49d ? 16'h0000 :  // <0061>   

// ######## func init_plan_learn_stoich // = 0x049e
// set up the learn_stoich plan.

// memorize state.
addr == 16'h49e ? 16'h5e00 :  // <0067> ram $ram_plan_name = :plan_name_learn_stoich // av_ad_hi = 0
addr == 16'h49f ? 16'h628a :  // <0067> ram $ram_plan_name = :plan_name_learn_stoich // av_ad_lo = 138
addr == 16'h4a0 ? 16'h57a0 :  // <0067> ram $ram_plan_name = :plan_name_learn_stoich // av_write_data = :plan_name_learn_stoich
addr == 16'h4a1 ? 16'h049c :  // <0067> "
addr == 16'h4a2 ? 16'h5e00 :  // <0068> ram $ram_puff_len_func = :puff_len_learn_stoich // av_ad_hi = 0
addr == 16'h4a3 ? 16'h628c :  // <0068> ram $ram_puff_len_func = :puff_len_learn_stoich // av_ad_lo = 140
addr == 16'h4a4 ? 16'h57a0 :  // <0068> ram $ram_puff_len_func = :puff_len_learn_stoich // av_write_data = :puff_len_learn_stoich
addr == 16'h4a5 ? 16'h04b0 :  // <0068> "
addr == 16'h4a6 ? 16'h5e00 :  // <0069> ram $ram_transition_func = :leave_learn_stoich // av_ad_hi = 0
addr == 16'h4a7 ? 16'h628e :  // <0069> ram $ram_transition_func = :leave_learn_stoich // av_ad_lo = 142
addr == 16'h4a8 ? 16'h57a0 :  // <0069> ram $ram_transition_func = :leave_learn_stoich // av_write_data = :leave_learn_stoich
addr == 16'h4a9 ? 16'h058e :  // <0069> "
addr == 16'h4aa ? 16'h5e00 :  // <0070> ram $ram_destroy_plan_func = :destroy_plan_learn_stoich // av_ad_hi = 0
addr == 16'h4ab ? 16'h6290 :  // <0070> ram $ram_destroy_plan_func = :destroy_plan_learn_stoich // av_ad_lo = 144
addr == 16'h4ac ? 16'h57a0 :  // <0070> ram $ram_destroy_plan_func = :destroy_plan_learn_stoich // av_write_data = :destroy_plan_learn_stoich
addr == 16'h4ad ? 16'h04af :  // <0070> "
addr == 16'h4ae ? 16'hfc00 :  // <0071> swapra = nop

// ######## func destroy_plan_learn_stoich // = 0x04af
addr == 16'h4af ? 16'hfc00 :  // <0074> swapra = nop


// ######## func puff_len_learn_stoich // = 0x04b0
addr == 16'h4b0 ? 16'h3002 :  // <0077> push i // func puff_len_learn_stoich
addr == 16'h4b1 ? 16'h3003 :  // <0077> push j // "
addr == 16'h4b2 ? 16'h3006 :  // <0077> push g6 // "
addr == 16'h4b3 ? 16'h3007 :  // <0077> push g7 // "
addr == 16'h4b4 ? 16'h303e :  // <0077> push rtna // "
addr == 16'h4b5 ? 16'h5e00 :  // <0078> ram i = $ram_lrns_ticks_remain // av_ad_hi = 0
addr == 16'h4b6 ? 16'h62b6 :  // <0078> ram i = $ram_lrns_ticks_remain // av_ad_lo = 182
addr == 16'h4b7 ? 16'h0815 :  // <0078> ram i = $ram_lrns_ticks_remain // i = av_write_data // start read cycle
addr == 16'h4b8 ? 16'h0816 :  // <0078> ram i = $ram_lrns_ticks_remain // i = av_read_data // finish read cycle

addr == 16'h4b9 ? 16'h0002 :  // <0107> a = i
addr == 16'h4ba ? 16'h0600 :  // <0107> b = 0


addr == 16'h4bb ? 16'he406 :  // <0107> bn gt :else_1211
addr == 16'h4bc ? 16'h04c4 :  // <0107> "

addr == 16'h4bd ? 16'h0f60 :  // <0107> j = -1
addr == 16'h4be ? 16'h5e00 :  // <0107> ram $ram_lrns_ticks_remain = i+j // av_ad_hi = 0
addr == 16'h4bf ? 16'h62b6 :  // <0107> ram $ram_lrns_ticks_remain = i+j // av_ad_lo = 182
addr == 16'h4c0 ? 16'hc800 :  // <0107> ram $ram_lrns_ticks_remain = i+j // av_write_data = i+j
addr == 16'h4c1 ? 16'h5710 :  // <0107> "

addr == 16'h4c2 ? 16'he00f :  // <0107> jmp :end_1211
addr == 16'h4c3 ? 16'h04f6 :  // <0107> "
// :else_1211 // = 0x04c4

addr == 16'h4c4 ? 16'h5e00 :  // <0107> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_ad_hi = 0
addr == 16'h4c5 ? 16'h62b6 :  // <0107> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_ad_lo = 182
addr == 16'h4c6 ? 16'h560a :  // <0107> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_write_data = 10

// i = old puff length, j = puff length increment.
addr == 16'h4c7 ? 16'h5e00 :  // <0107> ram i = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'h4c8 ? 16'h6292 :  // <0107> ram i = $ram_next_puff_len_us // av_ad_lo = 146
addr == 16'h4c9 ? 16'h0815 :  // <0107> ram i = $ram_next_puff_len_us // i = av_write_data // start read cycle
addr == 16'h4ca ? 16'h0816 :  // <0107> ram i = $ram_next_puff_len_us // i = av_read_data // finish read cycle
addr == 16'h4cb ? 16'h0e00 :  // <0107> j = 0
addr == 16'h4cc ? 16'h5e00 :  // <0107> ram g6 = $ram_o2_state // av_ad_hi = 0
addr == 16'h4cd ? 16'h62b8 :  // <0107> ram g6 = $ram_o2_state // av_ad_lo = 184
addr == 16'h4ce ? 16'h1815 :  // <0107> ram g6 = $ram_o2_state // g6 = av_write_data // start read cycle
addr == 16'h4cf ? 16'h1816 :  // <0107> ram g6 = $ram_o2_state // g6 = av_read_data // finish read cycle
addr == 16'h4d0 ? 16'hfba0 :  // <0107> call :interpret_o2
addr == 16'h4d1 ? 16'h0551 :  // <0107> "
addr == 16'h4d2 ? 16'hfc00 :  // <0107> "
addr == 16'h4d3 ? 16'h5e00 :  // <0107> ram g7 = $ram_o2_state // av_ad_hi = 0
addr == 16'h4d4 ? 16'h62b8 :  // <0107> ram g7 = $ram_o2_state // av_ad_lo = 184
addr == 16'h4d5 ? 16'h1c15 :  // <0107> ram g7 = $ram_o2_state // g7 = av_write_data // start read cycle
addr == 16'h4d6 ? 16'h1c16 :  // <0107> ram g7 = $ram_o2_state // g7 = av_read_data // finish read cycle

addr == 16'h4d7 ? 16'h0007 :  // <0107> a = g7
addr == 16'h4d8 ? 16'h0601 :  // <0107> b = 1


addr == 16'h4d9 ? 16'he407 :  // <0107> bn eq :else_1241
addr == 16'h4da ? 16'h04eb :  // <0107> "

// sensing a lean condition.  trim up to enrich.

addr == 16'h4db ? 16'h0002 :  // <0107> a = i
addr == 16'h4dc ? 16'h07a0 :  // <0107> b = 10000
addr == 16'h4dd ? 16'h2710 :  // <0107> "


addr == 16'h4de ? 16'he405 :  // <0107> bn lt :else_1246
addr == 16'h4df ? 16'h04e2 :  // <0107> "

addr == 16'h4e0 ? 16'h0fa0 :  // <0107> j = $lrns_puff_step_up_us
addr == 16'h4e1 ? 16'h03e8 :  // <0107> "


// :else_1246 // = 0x04e2

// :end_1246 // = 0x04e2


addr == 16'h4e2 ? 16'h0006 :  // <0107> a = g6
addr == 16'h4e3 ? 16'h0602 :  // <0107> b = 2


addr == 16'h4e4 ? 16'he407 :  // <0107> bn eq :else_1252
addr == 16'h4e5 ? 16'h04e9 :  // <0107> "

// o2 state just switched to lean.  adjust map.
addr == 16'h4e6 ? 16'hfba0 :  // <0107> call :learn_smap
addr == 16'h4e7 ? 16'h0502 :  // <0107> "
addr == 16'h4e8 ? 16'hfc00 :  // <0107> "


// :else_1252 // = 0x04e9

// :end_1252 // = 0x04e9


addr == 16'h4e9 ? 16'he00f :  // <0107> jmp :end_1241
addr == 16'h4ea ? 16'h04f2 :  // <0107> "
// :else_1241 // = 0x04eb

// sensing a rich condition.  trim down to lean it out.

addr == 16'h4eb ? 16'h0002 :  // <0107> a = i
addr == 16'h4ec ? 16'h07a0 :  // <0107> b = 2000
addr == 16'h4ed ? 16'h07d0 :  // <0107> "


addr == 16'h4ee ? 16'he406 :  // <0107> bn gt :else_1262
addr == 16'h4ef ? 16'h04f2 :  // <0107> "

addr == 16'h4f0 ? 16'h0fa0 :  // <0107> j = $lrns_puff_step_down_us
addr == 16'h4f1 ? 16'hff9b :  // <0107> "


// :else_1262 // = 0x04f2

// :end_1262 // = 0x04f2


// :end_1241 // = 0x04f2

addr == 16'h4f2 ? 16'h5e00 :  // <0107> ram $ram_next_puff_len_us = i+j // av_ad_hi = 0
addr == 16'h4f3 ? 16'h6292 :  // <0107> ram $ram_next_puff_len_us = i+j // av_ad_lo = 146
addr == 16'h4f4 ? 16'hc800 :  // <0107> ram $ram_next_puff_len_us = i+j // av_write_data = i+j
addr == 16'h4f5 ? 16'h5710 :  // <0107> "

// :end_1211 // = 0x04f6

addr == 16'h4f6 ? 16'hf80c :  // <0108> pop rtna // end_func
addr == 16'h4f7 ? 16'h1c0c :  // <0108> pop g7 // "
addr == 16'h4f8 ? 16'h180c :  // <0108> pop g6 // "
addr == 16'h4f9 ? 16'h0c0c :  // <0108> pop j // "
addr == 16'h4fa ? 16'h080c :  // <0108> pop i // "
addr == 16'h4fb ? 16'hfc00 :  // <0108> swapra = nop

// :lrns_enrich_msg // = 0x04fc
// "lrnR\x0"
addr == 16'h4fc ? 16'h726c :  // <0111> rl
addr == 16'h4fd ? 16'h526e :  // <0111> Rn
addr == 16'h4fe ? 16'h0000 :  // <0111>   
// :lrns_lean_msg // = 0x04ff
// "lrnL\x0"
addr == 16'h4ff ? 16'h726c :  // <0113> rl
addr == 16'h500 ? 16'h4c6e :  // <0113> Ln
addr == 16'h501 ? 16'h0000 :  // <0113>   

// ######## func learn_smap // = 0x0502
addr == 16'h502 ? 16'h3002 :  // <0115> push i // func learn_smap
addr == 16'h503 ? 16'h3004 :  // <0115> push x // "
addr == 16'h504 ? 16'h3005 :  // <0115> push y // "
addr == 16'h505 ? 16'h3006 :  // <0115> push g6 // "
addr == 16'h506 ? 16'h303e :  // <0115> push rtna // "
addr == 16'h507 ? 16'h5e00 :  // <0116> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h508 ? 16'h6280 :  // <0116> ram a = $ram_rpm_valid // av_ad_lo = 128
addr == 16'h509 ? 16'h0015 :  // <0116> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h50a ? 16'h0016 :  // <0116> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle

addr == 16'h50b ? 16'h0000 :  // <0143> a = a
addr == 16'h50c ? 16'h0601 :  // <0143> b = 1


addr == 16'h50d ? 16'he407 :  // <0143> bn eq :else_1293
addr == 16'h50e ? 16'h054b :  // <0143> "

// let g6 = map cell num.  x = map puff len.  i = observed stoich puff len.
addr == 16'h50f ? 16'h5e00 :  // <0143> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h510 ? 16'h627e :  // <0143> ram a = $ram_avg_rpm // av_ad_lo = 126
addr == 16'h511 ? 16'h0015 :  // <0143> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h512 ? 16'h0016 :  // <0143> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle
addr == 16'h513 ? 16'hfba0 :  // <0143> call :find_rpm_cell
addr == 16'h514 ? 16'h0480 :  // <0143> "
addr == 16'h515 ? 16'hfc00 :  // <0143> "
addr == 16'h516 ? 16'h1800 :  // <0143> g6 = a

addr == 16'h517 ? 16'h0351 :  // <0143> a = a<<1
addr == 16'h518 ? 16'h069c :  // <0143> b = 156
addr == 16'h519 ? 16'h5e00 :  // <0143> av_ad_hi = 0
addr == 16'h51a ? 16'h6300 :  // <0143> av_ad_lo = ad0
addr == 16'h51b ? 16'h0415 :  // <0143> b = av_write_data
addr == 16'h51c ? 16'h0416 :  // <0143> b = av_read_data

addr == 16'h51d ? 16'h1001 :  // <0143> x = b
addr == 16'h51e ? 16'h5e00 :  // <0143> ram i = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'h51f ? 16'h6292 :  // <0143> ram i = $ram_next_puff_len_us // av_ad_lo = 146
addr == 16'h520 ? 16'h0815 :  // <0143> ram i = $ram_next_puff_len_us // i = av_write_data // start read cycle
addr == 16'h521 ? 16'h0816 :  // <0143> ram i = $ram_next_puff_len_us // i = av_read_data // finish read cycle
addr == 16'h522 ? 16'h17a0 :  // <0143> y = (0xffff - $lrns_map_step + 1)
addr == 16'h523 ? 16'hff38 :  // <0143> "

addr == 16'h524 ? 16'hc800 :  // <0143> a = x+y
addr == 16'h525 ? 16'h0320 :  // <0143> "
addr == 16'h526 ? 16'h0402 :  // <0143> b = i


addr == 16'h527 ? 16'he406 :  // <0143> bn gt :else_1319
addr == 16'h528 ? 16'h0537 :  // <0143> "

// map is richer than observed stoich.  lean the map 1 step.
addr == 16'h529 ? 16'h0006 :  // <0143> a = g6
addr == 16'h52a ? 16'hc800 :  // <0143> b = x+y
addr == 16'h52b ? 16'h0720 :  // <0143> "

addr == 16'h52c ? 16'h0351 :  // <0143> a = a<<1
addr == 16'h52d ? 16'h3001 :  // <0143> push b // push b
addr == 16'h52e ? 16'h069c :  // <0143> b = 156
addr == 16'h52f ? 16'h5e00 :  // <0143> av_ad_hi = 0
addr == 16'h530 ? 16'h6300 :  // <0143> av_ad_lo = ad0
addr == 16'h531 ? 16'h540c :  // <0143> pop av_write_data // pop av_write_data

addr == 16'h532 ? 16'h03a0 :  // <0143> a = :lrns_enrich_msg
addr == 16'h533 ? 16'h04fc :  // <0143> "
addr == 16'h534 ? 16'hfba0 :  // <0143> call :set_text_flag
addr == 16'h535 ? 16'h08f2 :  // <0143> "
addr == 16'h536 ? 16'hfc00 :  // <0143> "


// :else_1319 // = 0x0537

// :end_1319 // = 0x0537

addr == 16'h537 ? 16'h16c8 :  // <0143> y = $lrns_map_step

addr == 16'h538 ? 16'hc800 :  // <0143> a = x+y
addr == 16'h539 ? 16'h0320 :  // <0143> "
addr == 16'h53a ? 16'h0402 :  // <0143> b = i


addr == 16'h53b ? 16'he405 :  // <0143> bn lt :else_1339
addr == 16'h53c ? 16'h054b :  // <0143> "

// map is leaner than observed stoich.  rich the map 1 step.
addr == 16'h53d ? 16'h0006 :  // <0143> a = g6
addr == 16'h53e ? 16'hc800 :  // <0143> b = x+y
addr == 16'h53f ? 16'h0720 :  // <0143> "

addr == 16'h540 ? 16'h0351 :  // <0143> a = a<<1
addr == 16'h541 ? 16'h3001 :  // <0143> push b // push b
addr == 16'h542 ? 16'h069c :  // <0143> b = 156
addr == 16'h543 ? 16'h5e00 :  // <0143> av_ad_hi = 0
addr == 16'h544 ? 16'h6300 :  // <0143> av_ad_lo = ad0
addr == 16'h545 ? 16'h540c :  // <0143> pop av_write_data // pop av_write_data

addr == 16'h546 ? 16'h03a0 :  // <0143> a = :lrns_lean_msg
addr == 16'h547 ? 16'h04ff :  // <0143> "
addr == 16'h548 ? 16'hfba0 :  // <0143> call :set_text_flag
addr == 16'h549 ? 16'h08f2 :  // <0143> "
addr == 16'h54a ? 16'hfc00 :  // <0143> "


// :else_1339 // = 0x054b

// :end_1339 // = 0x054b



// :else_1293 // = 0x054b

// :end_1293 // = 0x054b

addr == 16'h54b ? 16'hf80c :  // <0144> pop rtna // end_func
addr == 16'h54c ? 16'h180c :  // <0144> pop g6 // "
addr == 16'h54d ? 16'h140c :  // <0144> pop y // "
addr == 16'h54e ? 16'h100c :  // <0144> pop x // "
addr == 16'h54f ? 16'h080c :  // <0144> pop i // "
addr == 16'h550 ? 16'hfc00 :  // <0144> swapra = nop

// ######## func interpret_o2 // = 0x0551
addr == 16'h551 ? 16'h5e00 :  // <0147> ram a = $ram_o2_state // av_ad_hi = 0
addr == 16'h552 ? 16'h62b8 :  // <0147> ram a = $ram_o2_state // av_ad_lo = 184
addr == 16'h553 ? 16'h0015 :  // <0147> ram a = $ram_o2_state // a = av_write_data // start read cycle
addr == 16'h554 ? 16'h0016 :  // <0147> ram a = $ram_o2_state // a = av_read_data // finish read cycle

addr == 16'h555 ? 16'h0000 :  // <0157> a = a
addr == 16'h556 ? 16'h0601 :  // <0157> b = 1


addr == 16'h557 ? 16'he007 :  // <0157> br eq :else_1367
addr == 16'h558 ? 16'h056c :  // <0157> "

// check sensor for lean state.
addr == 16'h559 ? 16'h0205 :  // <0157> a = $o2_adc_channel

addr == 16'h55a ? 16'h0351 :  // <0157> a = a<<1
addr == 16'h55b ? 16'h0628 :  // <0157> b = 40
addr == 16'h55c ? 16'h5e00 :  // <0157> av_ad_hi = 0
addr == 16'h55d ? 16'h6300 :  // <0157> av_ad_lo = ad0
addr == 16'h55e ? 16'h0415 :  // <0157> b = av_write_data
addr == 16'h55f ? 16'h0416 :  // <0157> b = av_read_data

addr == 16'h560 ? 16'h03a0 :  // <0157> a = $o2_lean_thresh_adc
addr == 16'h561 ? 16'h01c2 :  // <0157> "

addr == 16'h562 ? 16'h0000 :  // <0157> a = a
addr == 16'h563 ? 16'h0401 :  // <0157> b = b


addr == 16'h564 ? 16'he406 :  // <0157> bn gt :else_1380
addr == 16'h565 ? 16'h056c :  // <0157> "

addr == 16'h566 ? 16'h5e00 :  // <0157> ram $ram_o2_state = $o2_state_lean // av_ad_hi = 0
addr == 16'h567 ? 16'h62b8 :  // <0157> ram $ram_o2_state = $o2_state_lean // av_ad_lo = 184
addr == 16'h568 ? 16'h5601 :  // <0157> ram $ram_o2_state = $o2_state_lean // av_write_data = 1
addr == 16'h569 ? 16'h5e00 :  // <0157> ram $ram_o2_been_lean = 1 // av_ad_hi = 0
addr == 16'h56a ? 16'h62bc :  // <0157> ram $ram_o2_been_lean = 1 // av_ad_lo = 188
addr == 16'h56b ? 16'h5601 :  // <0157> ram $ram_o2_been_lean = 1 // av_write_data = 1


// :else_1380 // = 0x056c

// :end_1380 // = 0x056c



// :else_1367 // = 0x056c

// :end_1367 // = 0x056c


addr == 16'h56c ? 16'h0000 :  // <0167> a = a
addr == 16'h56d ? 16'h0602 :  // <0167> b = 2


addr == 16'h56e ? 16'he007 :  // <0167> br eq :else_1390
addr == 16'h56f ? 16'h0583 :  // <0167> "

// check sensor for rich state.
addr == 16'h570 ? 16'h0205 :  // <0167> a = $o2_adc_channel

addr == 16'h571 ? 16'h0351 :  // <0167> a = a<<1
addr == 16'h572 ? 16'h0628 :  // <0167> b = 40
addr == 16'h573 ? 16'h5e00 :  // <0167> av_ad_hi = 0
addr == 16'h574 ? 16'h6300 :  // <0167> av_ad_lo = ad0
addr == 16'h575 ? 16'h0415 :  // <0167> b = av_write_data
addr == 16'h576 ? 16'h0416 :  // <0167> b = av_read_data

addr == 16'h577 ? 16'h03a0 :  // <0167> a = $o2_rich_thresh_adc
addr == 16'h578 ? 16'h02bc :  // <0167> "

addr == 16'h579 ? 16'h0000 :  // <0167> a = a
addr == 16'h57a ? 16'h0401 :  // <0167> b = b


addr == 16'h57b ? 16'he406 :  // <0167> bn gt :else_1403
addr == 16'h57c ? 16'h0583 :  // <0167> "

addr == 16'h57d ? 16'h5e00 :  // <0167> ram $ram_o2_state = $o2_state_rich // av_ad_hi = 0
addr == 16'h57e ? 16'h62b8 :  // <0167> ram $ram_o2_state = $o2_state_rich // av_ad_lo = 184
addr == 16'h57f ? 16'h5602 :  // <0167> ram $ram_o2_state = $o2_state_rich // av_write_data = 2
addr == 16'h580 ? 16'h5e00 :  // <0167> ram $ram_o2_been_rich = 1 // av_ad_hi = 0
addr == 16'h581 ? 16'h62ba :  // <0167> ram $ram_o2_been_rich = 1 // av_ad_lo = 186
addr == 16'h582 ? 16'h5601 :  // <0167> ram $ram_o2_been_rich = 1 // av_write_data = 1


// :else_1403 // = 0x0583

// :end_1403 // = 0x0583



// :else_1390 // = 0x0583

// :end_1390 // = 0x0583

addr == 16'h583 ? 16'hfc00 :  // <0168> swapra = nop

// ######## func init_o2_state // = 0x0584
addr == 16'h584 ? 16'h5e00 :  // <0171> ram $ram_o2_state = $o2_state_init // av_ad_hi = 0
addr == 16'h585 ? 16'h62b8 :  // <0171> ram $ram_o2_state = $o2_state_init // av_ad_lo = 184
addr == 16'h586 ? 16'h5600 :  // <0171> ram $ram_o2_state = $o2_state_init // av_write_data = 0
addr == 16'h587 ? 16'h5e00 :  // <0172> ram $ram_o2_been_lean = 0 // av_ad_hi = 0
addr == 16'h588 ? 16'h62bc :  // <0172> ram $ram_o2_been_lean = 0 // av_ad_lo = 188
addr == 16'h589 ? 16'h5600 :  // <0172> ram $ram_o2_been_lean = 0 // av_write_data = 0
addr == 16'h58a ? 16'h5e00 :  // <0173> ram $ram_o2_been_rich = 0 // av_ad_hi = 0
addr == 16'h58b ? 16'h62ba :  // <0173> ram $ram_o2_been_rich = 0 // av_ad_lo = 186
addr == 16'h58c ? 16'h5600 :  // <0173> ram $ram_o2_been_rich = 0 // av_write_data = 0
addr == 16'h58d ? 16'hfc00 :  // <0174> swapra = nop

// ######## func leave_learn_stoich // = 0x058e
addr == 16'h58e ? 16'h303e :  // <0176> push rtna // func leave_learn_stoich
addr == 16'h58f ? 16'hfba0 :  // <0177> call :check_engine_stop
addr == 16'h590 ? 16'h0956 :  // <0177> "
addr == 16'h591 ? 16'hfc00 :  // <0177> "
addr == 16'h592 ? 16'hf80c :  // <0178> pop rtna // end_func
addr == 16'h593 ? 16'hfc00 :  // <0178> swapra = nop

// ######## func clear_smap_cmd // = 0x0594
addr == 16'h594 ? 16'h3002 :  // <0180> push i // func clear_smap_cmd
addr == 16'h595 ? 16'h0a00 :  // <0185> i = 0
// :loop_1429 // = 0x0596

addr == 16'h596 ? 16'h0002 :  // <0185> a = i
addr == 16'h597 ? 16'h07a0 :  // <0185> b = 3000
addr == 16'h598 ? 16'h0bb8 :  // <0185> "

addr == 16'h599 ? 16'h0351 :  // <0185> a = a<<1
addr == 16'h59a ? 16'h3001 :  // <0185> push b // push b
addr == 16'h59b ? 16'h069c :  // <0185> b = 156
addr == 16'h59c ? 16'h5e00 :  // <0185> av_ad_hi = 0
addr == 16'h59d ? 16'h6300 :  // <0185> av_ad_lo = ad0
addr == 16'h59e ? 16'h540c :  // <0185> pop av_write_data // pop av_write_data



addr == 16'h59f ? 16'h0002 :  // <0185> a = i
addr == 16'h5a0 ? 16'h0601 :  // <0185> b = 1
addr == 16'h5a1 ? 16'hc800 :  // <0185> i = a+b
addr == 16'h5a2 ? 16'h0b00 :  // <0185> "


addr == 16'h5a3 ? 16'h0002 :  // <0185> a = i
addr == 16'h5a4 ? 16'h060d :  // <0185> b = $num_rpm_cells
addr == 16'h5a5 ? 16'he005 :  // <0185> br lt :loop_1429
addr == 16'h5a6 ? 16'h0596 :  // <0185> "

// :end_1429 // = 0x05a7
addr == 16'h5a7 ? 16'h080c :  // <0186> pop i // end_func
addr == 16'h5a8 ? 16'hfc00 :  // <0186> swapra = nop


// #########################################################################
// :main // = 0x05a9
addr == 16'h5a9 ? 16'h03a0 :  // <0213> a = :boot_msg
addr == 16'h5aa ? 16'h008b :  // <0213> "
addr == 16'h5ab ? 16'hfba0 :  // <0214> call :print_nt
addr == 16'h5ac ? 16'h014f :  // <0214> "
addr == 16'h5ad ? 16'hfc00 :  // <0214> "

// clear the first 64k of RAM.
addr == 16'h5ae ? 16'h5e00 :  // <0217> av_ad_hi = 0
addr == 16'h5af ? 16'hfba0 :  // <0218> call :clear_ram_page
addr == 16'h5b0 ? 16'h08ea :  // <0218> "
addr == 16'h5b1 ? 16'hfc00 :  // <0218> "


// ########  // = 0x05b2
addr == 16'h5b2 ? 16'h303e :  // <0220> push rtna // 

addr == 16'h5b3 ? 16'h0261 :  // <0220> a = 97 // putasc "a"
addr == 16'h5b4 ? 16'hfba0 :  // <0220> putasc "a"
addr == 16'h5b5 ? 16'h009b :  // <0220> "
addr == 16'h5b6 ? 16'hfc00 :  // <0220> "

addr == 16'h5b7 ? 16'hf80c :  // <0220> pop rtna // 
addr == 16'h5b8 ? 16'hfc00 :  // <0220> swapra = nop
// ########  // = 0x05b9
addr == 16'h5b9 ? 16'h303e :  // <0220> push rtna // 

addr == 16'h5ba ? 16'h0262 :  // <0220> a = 98 // putasc "b"
addr == 16'h5bb ? 16'hfba0 :  // <0220> putasc "b"
addr == 16'h5bc ? 16'h009b :  // <0220> "
addr == 16'h5bd ? 16'hfc00 :  // <0220> "

addr == 16'h5be ? 16'hf80c :  // <0220> pop rtna // 
addr == 16'h5bf ? 16'hfc00 :  // <0220> swapra = nop
// ########  // = 0x05c0
addr == 16'h5c0 ? 16'h303e :  // <0220> push rtna // 

addr == 16'h5c1 ? 16'h0263 :  // <0220> a = 99 // putasc "c"
addr == 16'h5c2 ? 16'hfba0 :  // <0220> putasc "c"
addr == 16'h5c3 ? 16'h009b :  // <0220> "
addr == 16'h5c4 ? 16'hfc00 :  // <0220> "

addr == 16'h5c5 ? 16'hf80c :  // <0220> pop rtna // 
addr == 16'h5c6 ? 16'hfc00 :  // <0220> swapra = nop
addr == 16'h5c7 ? 16'h2004 :  // <0220> pa = x
addr == 16'h5c8 ? 16'h2403 :  // <0220> pb = j
addr == 16'h5c9 ? 16'hfba0 :  // <0220> callx find_cell_test {rpm in x} {tps in j} {cell out i}
addr == 16'h5ca ? 16'h05c0 :  // <0220> "
addr == 16'h5cb ? 16'hfc00 :  // <0220> "
addr == 16'h5cc ? 16'h0808 :  // <0220> i = pa


// init fuel injection.
addr == 16'h5cd ? 16'hfba0 :  // <0223> call :init_plan_stop
addr == 16'h5ce ? 16'h02f7 :  // <0223> "
addr == 16'h5cf ? 16'hfc00 :  // <0223> "

// power up FTDI USB board, and init any other special board control functions.
addr == 16'h5d0 ? 16'h7280 :  // <0226> board_ctrl = $ftdi_power_mask
addr == 16'h5d1 ? 16'hfba0 :  // <0227> call :postpone_comm_restart
addr == 16'h5d2 ? 16'h08c1 :  // <0227> "
addr == 16'h5d3 ? 16'hfc00 :  // <0227> "

// check initial state of power management circuits.
// if power is lost or ignition switch is off already, open relay & abort run.
// that's important because then the event controller booted up too late to
// see edges on those 2 signals.  regular system would never shut itself down.
// this setup is the last thing done prior to the event handler loop.
addr == 16'h5d4 ? 16'h7a00 :  // <0234> power_duty = $power_duty_closing

addr == 16'h5d5 ? 16'h001e :  // <0238> a = power_duty
addr == 16'h5d6 ? 16'h06c0 :  // <0238> b = ( $power_lost_mask | $ign_switch_off_mask )


addr == 16'h5d7 ? 16'he003 :  // <0238> br and0z :else_1495
addr == 16'h5d8 ? 16'h05de :  // <0238> "

addr == 16'h5d9 ? 16'h7a32 :  // <0238> power_duty = $power_duty_opening
addr == 16'h5da ? 16'h6fa0 :  // <0238> error_halt_code $err_power_lost_at_boot // leds = 0xfffb
addr == 16'h5db ? 16'hfffb :  // <0238> "
addr == 16'h5dc ? 16'he00f :  // <0238> error_halt_code $err_power_lost_at_boot
addr == 16'h5dd ? 16'h05dc :  // <0238> "


// :else_1495 // = 0x05de

// :end_1495 // = 0x05de

addr == 16'h5de ? 16'h5e00 :  // <0239> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h5df ? 16'h623e :  // <0239> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 62
addr == 16'h5e0 ? 16'h5760 :  // <0239> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h5e1 ? 16'h5e00 :  // <0240> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_hi = 0
addr == 16'h5e2 ? 16'h6240 :  // <0240> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_lo = 64
addr == 16'h5e3 ? 16'h5602 :  // <0240> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_write_data = 2

// start handling events.
addr == 16'h5e4 ? 16'h3ba0 :  // <0243> soft_event = $event_controller_reset_mask
addr == 16'h5e5 ? 16'h8000 :  // <0243> "
addr == 16'h5e6 ? 16'h3a00 :  // <0244> soft_event = 0
addr == 16'h5e7 ? 16'h47a0 :  // <0245> mstimer0 = 1000
addr == 16'h5e8 ? 16'h03e8 :  // <0245> "
addr == 16'h5e9 ? 16'h4e14 :  // <0246> mstimer2 = $plan_tick_ms
addr == 16'h5ea ? 16'he00f :  // <0247> jmp :poll_events
addr == 16'h5eb ? 16'h008e :  // <0247> "

// event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.
// event 0 not used in this app anyway.
// :event_table // = 0x05ec
addr == 16'h5ec ? 16'h008e :  // <0252> ([label :poll_events])
addr == 16'h5ed ? 16'h0816 :  // <0253> ([label :power_lost_handler])
addr == 16'h5ee ? 16'h0601 :  // <0254> ([label :ign_capture_handler])
addr == 16'h5ef ? 16'h0681 :  // <0255> ([label :ign_capture_timeout_handler])
addr == 16'h5f0 ? 16'h084a :  // <0256> ([label :puff1_done_handler])
addr == 16'h5f1 ? 16'h0686 :  // <0257> ([label :ustimer0_handler])
addr == 16'h5f2 ? 16'h07b1 :  // <0258> ([label :spi_done_handler])
addr == 16'h5f3 ? 16'h0688 :  // <0259> ([label :mstimer0_handler])
addr == 16'h5f4 ? 16'h077e :  // <0260> ([label :mstimer1_handler])
addr == 16'h5f5 ? 16'h06b7 :  // <0261> ([label :mstimer2_handler])
addr == 16'h5f6 ? 16'h06de :  // <0262> ([label :uart_rx_handler])
addr == 16'h5f7 ? 16'h06f7 :  // <0263> ([label :uart_rx_overflow_handler])
addr == 16'h5f8 ? 16'h06fd :  // <0264> ([label :uart_tx_overflow_handler])
addr == 16'h5f9 ? 16'h0703 :  // <0265> ([label :key0_handler])
addr == 16'h5fa ? 16'h070d :  // <0266> ([label :key1_handler])
addr == 16'h5fb ? 16'h082d :  // <0267> ([label :ign_switch_off_handler])
addr == 16'h5fc ? 16'h0840 :  // <0268> ([label :ign_switch_on_handler])
addr == 16'h5fd ? 16'h0717 :  // <0269> ([label :softevent3_handler])
addr == 16'h5fe ? 16'h0719 :  // <0270> ([label :softevent2_handler])
addr == 16'h5ff ? 16'h071b :  // <0271> ([label :softevent1_handler])
addr == 16'h600 ? 16'h071d :  // <0272> ([label :softevent0_handler])

// #########################################################################

// ######## event ign_capture_handler // = 0x0601
// discard outlier time.
addr == 16'h601 ? 16'h181f :  // <0278> g6 = ign_capture_jf
addr == 16'h602 ? 16'h5e00 :  // <0279> ram b = $ram_ign_fastest_jf // av_ad_hi = 0
addr == 16'h603 ? 16'h6284 :  // <0279> ram b = $ram_ign_fastest_jf // av_ad_lo = 132
addr == 16'h604 ? 16'h0415 :  // <0279> ram b = $ram_ign_fastest_jf // b = av_write_data // start read cycle
addr == 16'h605 ? 16'h0416 :  // <0279> ram b = $ram_ign_fastest_jf // b = av_read_data // finish read cycle

addr == 16'h606 ? 16'h0006 :  // <0282> a = g6
addr == 16'h607 ? 16'h0401 :  // <0282> b = b


addr == 16'h608 ? 16'he405 :  // <0282> bn lt :else_1544
addr == 16'h609 ? 16'h060b :  // <0282> "

addr == 16'h60a ? 16'h1a00 :  // <0282> g6 = 0


// :else_1544 // = 0x060b

// :end_1544 // = 0x060b

addr == 16'h60b ? 16'h5e00 :  // <0283> ram b = $ram_ign_slowest_jf // av_ad_hi = 0
addr == 16'h60c ? 16'h6286 :  // <0283> ram b = $ram_ign_slowest_jf // av_ad_lo = 134
addr == 16'h60d ? 16'h0415 :  // <0283> ram b = $ram_ign_slowest_jf // b = av_write_data // start read cycle
addr == 16'h60e ? 16'h0416 :  // <0283> ram b = $ram_ign_slowest_jf // b = av_read_data // finish read cycle

addr == 16'h60f ? 16'h0006 :  // <0286> a = g6
addr == 16'h610 ? 16'h0401 :  // <0286> b = b


addr == 16'h611 ? 16'he406 :  // <0286> bn gt :else_1553
addr == 16'h612 ? 16'h0614 :  // <0286> "

addr == 16'h613 ? 16'h1a00 :  // <0286> g6 = 0


// :else_1553 // = 0x0614

// :end_1553 // = 0x0614


// increment buffer index and memorize time.
addr == 16'h614 ? 16'h5e00 :  // <0289> ram a = $ram_ign_history_idx // av_ad_hi = 0
addr == 16'h615 ? 16'h625a :  // <0289> ram a = $ram_ign_history_idx // av_ad_lo = 90
addr == 16'h616 ? 16'h0015 :  // <0289> ram a = $ram_ign_history_idx // a = av_write_data // start read cycle
addr == 16'h617 ? 16'h0016 :  // <0289> ram a = $ram_ign_history_idx // a = av_read_data // finish read cycle
addr == 16'h618 ? 16'h0601 :  // <0290> b = 1
addr == 16'h619 ? 16'hc800 :  // <0291> a = a+b
addr == 16'h61a ? 16'h0300 :  // <0291> "
addr == 16'h61b ? 16'h060f :  // <0292> b = $ign_history_idx_mask
addr == 16'h61c ? 16'hc800 :  // <0293> a = and
addr == 16'h61d ? 16'h0330 :  // <0293> "
addr == 16'h61e ? 16'h5e00 :  // <0294> ram $ram_ign_history_idx = a // av_ad_hi = 0
addr == 16'h61f ? 16'h625a :  // <0294> ram $ram_ign_history_idx = a // av_ad_lo = 90
addr == 16'h620 ? 16'h5400 :  // <0294> ram $ram_ign_history_idx = a // av_write_data = a
addr == 16'h621 ? 16'h0406 :  // <0295> b = g6

addr == 16'h622 ? 16'h0351 :  // <0296> a = a<<1
addr == 16'h623 ? 16'h3001 :  // <0296> push b // push b
addr == 16'h624 ? 16'h065c :  // <0296> b = 92
addr == 16'h625 ? 16'h5e00 :  // <0296> av_ad_hi = 0
addr == 16'h626 ? 16'h6300 :  // <0296> av_ad_lo = ad0
addr == 16'h627 ? 16'h540c :  // <0296> pop av_write_data // pop av_write_data


// ////////// compute new jiffy estimate.
// average entire history.
// x = total, y = sample, i = index = loop count, g6 = count of invalid samples.
addr == 16'h628 ? 16'h1200 :  // <0301> x = 0
addr == 16'h629 ? 16'h1a00 :  // <0302> g6 = 0
addr == 16'h62a ? 16'h0a00 :  // <0318> i = 0
// :loop_1578 // = 0x062b

addr == 16'h62b ? 16'h0002 :  // <0318> a = i

addr == 16'h62c ? 16'h0351 :  // <0318> a = a<<1
addr == 16'h62d ? 16'h065c :  // <0318> b = 92
addr == 16'h62e ? 16'h5e00 :  // <0318> av_ad_hi = 0
addr == 16'h62f ? 16'h6300 :  // <0318> av_ad_lo = ad0
addr == 16'h630 ? 16'h0415 :  // <0318> b = av_write_data
addr == 16'h631 ? 16'h0416 :  // <0318> b = av_read_data

addr == 16'h632 ? 16'h1401 :  // <0318> y = b

addr == 16'h633 ? 16'h0005 :  // <0318> a = y
addr == 16'h634 ? 16'h0600 :  // <0318> b = 0


addr == 16'h635 ? 16'he407 :  // <0318> bn eq :else_1589
addr == 16'h636 ? 16'h063d :  // <0318> "

addr == 16'h637 ? 16'h0006 :  // <0318> a = g6
addr == 16'h638 ? 16'h0601 :  // <0318> b = 1
addr == 16'h639 ? 16'hc800 :  // <0318> g6 = a+b
addr == 16'h63a ? 16'h1b00 :  // <0318> "

addr == 16'h63b ? 16'he00f :  // <0318> jmp :end_1589
addr == 16'h63c ? 16'h0644 :  // <0318> "
// :else_1589 // = 0x063d

addr == 16'h63d ? 16'h0208 :  // <0318> a = ($ign_history_len / 2)
addr == 16'h63e ? 16'h0405 :  // <0318> b = y
addr == 16'h63f ? 16'hc800 :  // <0318> a = a+b
addr == 16'h640 ? 16'h0300 :  // <0318> "
addr == 16'h641 ? 16'h1753 :  // <0318> y = a>>$ign_history_idx_bits
addr == 16'h642 ? 16'hc800 :  // <0318> x = x+y
addr == 16'h643 ? 16'h1320 :  // <0318> "

// :end_1589 // = 0x0644



addr == 16'h644 ? 16'h0002 :  // <0318> a = i
addr == 16'h645 ? 16'h0601 :  // <0318> b = 1
addr == 16'h646 ? 16'hc800 :  // <0318> i = a+b
addr == 16'h647 ? 16'h0b00 :  // <0318> "


addr == 16'h648 ? 16'h0002 :  // <0318> a = i
addr == 16'h649 ? 16'h0610 :  // <0318> b = $ign_history_len
addr == 16'h64a ? 16'he005 :  // <0318> br lt :loop_1578
addr == 16'h64b ? 16'h062b :  // <0318> "

// :end_1578 // = 0x064c
addr == 16'h64c ? 16'h5e00 :  // <0319> ram $ram_ign_avg_jf = x // av_ad_hi = 0
addr == 16'h64d ? 16'h627c :  // <0319> ram $ram_ign_avg_jf = x // av_ad_lo = 124
addr == 16'h64e ? 16'h5404 :  // <0319> ram $ram_ign_avg_jf = x // av_write_data = x
addr == 16'h64f ? 16'h5e00 :  // <0320> ram $ram_ign_bad_samples = g6 // av_ad_hi = 0
addr == 16'h650 ? 16'h6282 :  // <0320> ram $ram_ign_bad_samples = g6 // av_ad_lo = 130
addr == 16'h651 ? 16'h5406 :  // <0320> ram $ram_ign_bad_samples = g6 // av_write_data = g6
//patch: dividing before summing (instead of after) is much simpler and faster because it prevents overflow.
// but it means we could be reading as much as 16 jf too low (16 = ign_history_len).
// that error is way less than 1 RPM on the slow end,
// or about 1,000 RPM too fast on the fast end!
// might need to tighten that up.  one simple way might be adding ign_history_len / 2 to each history record prior to dividing.
// that didn't seem to help much in simple testing.
// probly because jf_to_rpm has only 32 RPM resolution.


addr == 16'h652 ? 16'h0006 :  // <0337> a = g6
addr == 16'h653 ? 16'h0604 :  // <0337> b = ( $ign_history_len / 4 )


addr == 16'h654 ? 16'he406 :  // <0337> bn gt :else_1620
addr == 16'h655 ? 16'h065b :  // <0337> "

addr == 16'h656 ? 16'h5e00 :  // <0337> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h657 ? 16'h6280 :  // <0337> ram $ram_rpm_valid = 0 // av_ad_lo = 128
addr == 16'h658 ? 16'h5600 :  // <0337> ram $ram_rpm_valid = 0 // av_write_data = 0

addr == 16'h659 ? 16'he00f :  // <0337> jmp :end_1620
addr == 16'h65a ? 16'h0665 :  // <0337> "
// :else_1620 // = 0x065b

// convert jiffies b to new RPM estimate.
addr == 16'h65b ? 16'h0004 :  // <0337> a = x
addr == 16'h65c ? 16'hfba0 :  // <0337> call :jf_to_rpm
addr == 16'h65d ? 16'h094a :  // <0337> "
addr == 16'h65e ? 16'hfc00 :  // <0337> "
addr == 16'h65f ? 16'h5e00 :  // <0337> ram $ram_avg_rpm = a // av_ad_hi = 0
addr == 16'h660 ? 16'h627e :  // <0337> ram $ram_avg_rpm = a // av_ad_lo = 126
addr == 16'h661 ? 16'h5400 :  // <0337> ram $ram_avg_rpm = a // av_write_data = a
addr == 16'h662 ? 16'h5e00 :  // <0337> ram $ram_rpm_valid = 1 // av_ad_hi = 0
addr == 16'h663 ? 16'h6280 :  // <0337> ram $ram_rpm_valid = 1 // av_ad_lo = 128
addr == 16'h664 ? 16'h5601 :  // <0337> ram $ram_rpm_valid = 1 // av_write_data = 1

// :end_1620 // = 0x0665

addr == 16'h665 ? 16'he00f :  // <0338> end_event
addr == 16'h666 ? 16'h008e :  // <0338> "

// ######## func clear_ign_history // = 0x0667
addr == 16'h667 ? 16'h3002 :  // <0340> push i // func clear_ign_history
// invalidate the RPM estimate.
addr == 16'h668 ? 16'h5e00 :  // <0342> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h669 ? 16'h6280 :  // <0342> ram $ram_rpm_valid = 0 // av_ad_lo = 128
addr == 16'h66a ? 16'h5600 :  // <0342> ram $ram_rpm_valid = 0 // av_write_data = 0
// the last known RPM estimate is retained here, not cleared.
// clear the history so it won't be valid again until several more valid samples are collected.
addr == 16'h66b ? 16'h5e00 :  // <0345> ram $ram_ign_bad_samples = $ign_history_len // av_ad_hi = 0
addr == 16'h66c ? 16'h6282 :  // <0345> ram $ram_ign_bad_samples = $ign_history_len // av_ad_lo = 130
addr == 16'h66d ? 16'h5610 :  // <0345> ram $ram_ign_bad_samples = $ign_history_len // av_write_data = 16
addr == 16'h66e ? 16'h0a00 :  // <0350> i = 0
// :loop_1646 // = 0x066f

addr == 16'h66f ? 16'h0002 :  // <0350> a = i
addr == 16'h670 ? 16'h0600 :  // <0350> b = 0

addr == 16'h671 ? 16'h0351 :  // <0350> a = a<<1
addr == 16'h672 ? 16'h3001 :  // <0350> push b // push b
addr == 16'h673 ? 16'h065c :  // <0350> b = 92
addr == 16'h674 ? 16'h5e00 :  // <0350> av_ad_hi = 0
addr == 16'h675 ? 16'h6300 :  // <0350> av_ad_lo = ad0
addr == 16'h676 ? 16'h540c :  // <0350> pop av_write_data // pop av_write_data



addr == 16'h677 ? 16'h0002 :  // <0350> a = i
addr == 16'h678 ? 16'h0601 :  // <0350> b = 1
addr == 16'h679 ? 16'hc800 :  // <0350> i = a+b
addr == 16'h67a ? 16'h0b00 :  // <0350> "


addr == 16'h67b ? 16'h0002 :  // <0350> a = i
addr == 16'h67c ? 16'h0610 :  // <0350> b = $ign_history_len
addr == 16'h67d ? 16'he005 :  // <0350> br lt :loop_1646
addr == 16'h67e ? 16'h066f :  // <0350> "

// :end_1646 // = 0x067f
addr == 16'h67f ? 16'h080c :  // <0351> pop i // end_func
addr == 16'h680 ? 16'hfc00 :  // <0351> swapra = nop

// ######## event ign_capture_timeout_handler // = 0x0681
// it's been too long since the last ignition pulse detect.
addr == 16'h681 ? 16'hfba0 :  // <0355> call :clear_ign_history
addr == 16'h682 ? 16'h0667 :  // <0355> "
addr == 16'h683 ? 16'hfc00 :  // <0355> "
addr == 16'h684 ? 16'he00f :  // <0356> end_event
addr == 16'h685 ? 16'h008e :  // <0356> "

// ######## event ustimer0_handler // = 0x0686
addr == 16'h686 ? 16'he00f :  // <0359> end_event
addr == 16'h687 ? 16'h008e :  // <0359> "

// ######## event mstimer0_handler // = 0x0688
// unified 1-second periodic timer for all low-resolution tasks.

// start timer again.
addr == 16'h688 ? 16'h47a0 :  // <0365> mstimer0 = 1000
addr == 16'h689 ? 16'h03e8 :  // <0365> "

// realtime counters in RAM.
addr == 16'h68a ? 16'h5e00 :  // <0368> ram a = $ram_seconds_cnt // av_ad_hi = 0
addr == 16'h68b ? 16'h6244 :  // <0368> ram a = $ram_seconds_cnt // av_ad_lo = 68
addr == 16'h68c ? 16'h0015 :  // <0368> ram a = $ram_seconds_cnt // a = av_write_data // start read cycle
addr == 16'h68d ? 16'h0016 :  // <0368> ram a = $ram_seconds_cnt // a = av_read_data // finish read cycle
addr == 16'h68e ? 16'h0601 :  // <0369> b = 1
addr == 16'h68f ? 16'hc800 :  // <0370> a = a+b
addr == 16'h690 ? 16'h0300 :  // <0370> "

addr == 16'h691 ? 16'h0000 :  // <0379> a = a
addr == 16'h692 ? 16'h063c :  // <0379> b = 60


addr == 16'h693 ? 16'he407 :  // <0379> bn eq :else_1683
addr == 16'h694 ? 16'h06a6 :  // <0379> "

addr == 16'h695 ? 16'h5e00 :  // <0379> ram $ram_seconds_cnt = 0 // av_ad_hi = 0
addr == 16'h696 ? 16'h6244 :  // <0379> ram $ram_seconds_cnt = 0 // av_ad_lo = 68
addr == 16'h697 ? 16'h5600 :  // <0379> ram $ram_seconds_cnt = 0 // av_write_data = 0
addr == 16'h698 ? 16'h5e00 :  // <0379> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h699 ? 16'h6242 :  // <0379> ram a = $ram_minutes_cnt // av_ad_lo = 66
addr == 16'h69a ? 16'h0015 :  // <0379> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h69b ? 16'h0016 :  // <0379> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h69c ? 16'h0601 :  // <0379> b = 1
addr == 16'h69d ? 16'h5e00 :  // <0379> ram $ram_minutes_cnt = a+b // av_ad_hi = 0
addr == 16'h69e ? 16'h6242 :  // <0379> ram $ram_minutes_cnt = a+b // av_ad_lo = 66
addr == 16'h69f ? 16'hc800 :  // <0379> ram $ram_minutes_cnt = a+b // av_write_data = a+b
addr == 16'h6a0 ? 16'h5700 :  // <0379> "
addr == 16'h6a1 ? 16'hfba0 :  // <0379> call :minute_events
addr == 16'h6a2 ? 16'h0859 :  // <0379> "
addr == 16'h6a3 ? 16'hfc00 :  // <0379> "

addr == 16'h6a4 ? 16'he00f :  // <0379> jmp :end_1683
addr == 16'h6a5 ? 16'h06a9 :  // <0379> "
// :else_1683 // = 0x06a6

addr == 16'h6a6 ? 16'h5e00 :  // <0379> ram $ram_seconds_cnt = a // av_ad_hi = 0
addr == 16'h6a7 ? 16'h6244 :  // <0379> ram $ram_seconds_cnt = a // av_ad_lo = 68
addr == 16'h6a8 ? 16'h5400 :  // <0379> ram $ram_seconds_cnt = a // av_write_data = a

// :end_1683 // = 0x06a9


// all 1-second functions here.
addr == 16'h6a9 ? 16'hfba0 :  // <0382> call :check_power_relay
addr == 16'h6aa ? 16'h0861 :  // <0382> "
addr == 16'h6ab ? 16'hfc00 :  // <0382> "
addr == 16'h6ac ? 16'hfba0 :  // <0383> call :check_communication
addr == 16'h6ad ? 16'h0894 :  // <0383> "
addr == 16'h6ae ? 16'hfc00 :  // <0383> "
addr == 16'h6af ? 16'hfba0 :  // <0384> call :start_daq_pass
addr == 16'h6b0 ? 16'h0729 :  // <0384> "
addr == 16'h6b1 ? 16'hfc00 :  // <0384> "
addr == 16'h6b2 ? 16'he00f :  // <0385> end_event
addr == 16'h6b3 ? 16'h008e :  // <0385> "

// :plan_transition_msg // = 0x06b4
// "PLAN\x0"
addr == 16'h6b4 ? 16'h4c50 :  // <0388> LP
addr == 16'h6b5 ? 16'h4e41 :  // <0388> NA
addr == 16'h6b6 ? 16'h0000 :  // <0388>   

// ######## event mstimer2_handler // = 0x06b7
// engine management plan tick timer.

// restart timer.
addr == 16'h6b7 ? 16'h4e14 :  // <0394> mstimer2 = $plan_tick_ms

// poll the engine management plan.
// call the transition function for the current plan.
// this might perform a transition to some other plan, so it's done first.
addr == 16'h6b8 ? 16'h5e00 :  // <0399> ram rtna = $ram_transition_func // av_ad_hi = 0
addr == 16'h6b9 ? 16'h628e :  // <0399> ram rtna = $ram_transition_func // av_ad_lo = 142
addr == 16'h6ba ? 16'hf815 :  // <0399> ram rtna = $ram_transition_func // rtna = av_write_data // start read cycle
addr == 16'h6bb ? 16'hf816 :  // <0399> ram rtna = $ram_transition_func // rtna = av_read_data // finish read cycle
addr == 16'h6bc ? 16'h103e :  // <0400> x = rtna
addr == 16'h6bd ? 16'hfc00 :  // <0401> swapra = nop
addr == 16'h6be ? 16'h5e00 :  // <0402> ram b = $ram_transition_func // av_ad_hi = 0
addr == 16'h6bf ? 16'h628e :  // <0402> ram b = $ram_transition_func // av_ad_lo = 142
addr == 16'h6c0 ? 16'h0415 :  // <0402> ram b = $ram_transition_func // b = av_write_data // start read cycle
addr == 16'h6c1 ? 16'h0416 :  // <0402> ram b = $ram_transition_func // b = av_read_data // finish read cycle

addr == 16'h6c2 ? 16'h0004 :  // <0406> a = x
addr == 16'h6c3 ? 16'h0401 :  // <0406> b = b


addr == 16'h6c4 ? 16'he007 :  // <0406> br eq :else_1732
addr == 16'h6c5 ? 16'h06cb :  // <0406> "

addr == 16'h6c6 ? 16'h03a0 :  // <0406> a = :plan_transition_msg
addr == 16'h6c7 ? 16'h06b4 :  // <0406> "
addr == 16'h6c8 ? 16'hfba0 :  // <0406> call :set_text_flag
addr == 16'h6c9 ? 16'h08f2 :  // <0406> "
addr == 16'h6ca ? 16'hfc00 :  // <0406> "


// :else_1732 // = 0x06cb

// :end_1732 // = 0x06cb

// call the puff length function for the current plan.
// this is done last, so if a plan transition just happened, its new puff length will init here.
addr == 16'h6cb ? 16'h5e00 :  // <0409> ram rtna = $ram_puff_len_func // av_ad_hi = 0
addr == 16'h6cc ? 16'h628c :  // <0409> ram rtna = $ram_puff_len_func // av_ad_lo = 140
addr == 16'h6cd ? 16'hf815 :  // <0409> ram rtna = $ram_puff_len_func // rtna = av_write_data // start read cycle
addr == 16'h6ce ? 16'hf816 :  // <0409> ram rtna = $ram_puff_len_func // rtna = av_read_data // finish read cycle
addr == 16'h6cf ? 16'hfc00 :  // <0410> swapra = nop

// start another o2 reading every plan tick.
addr == 16'h6d0 ? 16'h5e00 :  // <0413> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h6d1 ? 16'h6238 :  // <0413> ram a = $ram_adc_chn_pending // av_ad_lo = 56
addr == 16'h6d2 ? 16'h0015 :  // <0413> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h6d3 ? 16'h0016 :  // <0413> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle

addr == 16'h6d4 ? 16'h0000 :  // <0417> a = a
addr == 16'h6d5 ? 16'h0600 :  // <0417> b = 0


addr == 16'h6d6 ? 16'he407 :  // <0417> bn eq :else_1750
addr == 16'h6d7 ? 16'h06dc :  // <0417> "

addr == 16'h6d8 ? 16'h0205 :  // <0417> a = $o2_adc_channel
addr == 16'h6d9 ? 16'hfba0 :  // <0417> call :begin_adc_conversion
addr == 16'h6da ? 16'h07a4 :  // <0417> "
addr == 16'h6db ? 16'hfc00 :  // <0417> "


// :else_1750 // = 0x06dc

// :end_1750 // = 0x06dc

addr == 16'h6dc ? 16'he00f :  // <0418> end_event
addr == 16'h6dd ? 16'h008e :  // <0418> "

// ######## event uart_rx_handler // = 0x06de
// :again // = 0x06de
addr == 16'h6de ? 16'hfba0 :  // <0422> pollchar
addr == 16'h6df ? 16'h00aa :  // <0422> "
addr == 16'h6e0 ? 16'hfc00 :  // <0422> "
addr == 16'h6e1 ? 16'h1000 :  // <0423> x = a

addr == 16'h6e2 ? 16'h0004 :  // <0426> a = x
addr == 16'h6e3 ? 16'h0760 :  // <0426> b = -1


addr == 16'h6e4 ? 16'he407 :  // <0426> bn eq :else_1764
addr == 16'h6e5 ? 16'h06e8 :  // <0426> "

addr == 16'h6e6 ? 16'he00f :  // <0426> event_return
addr == 16'h6e7 ? 16'h008e :  // <0426> "


// :else_1764 // = 0x06e8

// :end_1764 // = 0x06e8


addr == 16'h6e8 ? 16'h0004 :  // <0429> a = x
addr == 16'h6e9 ? 16'h060a :  // <0429> b = 10


addr == 16'h6ea ? 16'he407 :  // <0429> bn eq :else_1770
addr == 16'h6eb ? 16'h06ef :  // <0429> "

addr == 16'h6ec ? 16'hfba0 :  // <0429> call :postpone_comm_restart
addr == 16'h6ed ? 16'h08c1 :  // <0429> "
addr == 16'h6ee ? 16'hfc00 :  // <0429> "


// :else_1770 // = 0x06ef

// :end_1770 // = 0x06ef

addr == 16'h6ef ? 16'h0004 :  // <0430> a = x
addr == 16'h6f0 ? 16'hfba0 :  // <0431> call :parse_key
addr == 16'h6f1 ? 16'h0241 :  // <0431> "
addr == 16'h6f2 ? 16'hfc00 :  // <0431> "
addr == 16'h6f3 ? 16'he00f :  // <0432> jmp :again
addr == 16'h6f4 ? 16'h06de :  // <0432> "
addr == 16'h6f5 ? 16'he00f :  // <0433> end_event
addr == 16'h6f6 ? 16'h008e :  // <0433> "

// ######## event uart_rx_overflow_handler // = 0x06f7
addr == 16'h6f7 ? 16'h6fa0 :  // <0436> error_halt_code $err_rx_overflow // leds = 0xfffe
addr == 16'h6f8 ? 16'hfffe :  // <0436> "
addr == 16'h6f9 ? 16'he00f :  // <0436> error_halt_code $err_rx_overflow
addr == 16'h6fa ? 16'h06f9 :  // <0436> "
addr == 16'h6fb ? 16'he00f :  // <0437> end_event
addr == 16'h6fc ? 16'h008e :  // <0437> "

// ######## event uart_tx_overflow_handler // = 0x06fd
addr == 16'h6fd ? 16'h6fa0 :  // <0440> error_halt_code $err_tx_overflow // leds = 0xfffd
addr == 16'h6fe ? 16'hfffd :  // <0440> "
addr == 16'h6ff ? 16'he00f :  // <0440> error_halt_code $err_tx_overflow
addr == 16'h700 ? 16'h06ff :  // <0440> "
addr == 16'h701 ? 16'he00f :  // <0441> end_event
addr == 16'h702 ? 16'h008e :  // <0441> "

// ######## event key0_handler // = 0x0703
addr == 16'h703 ? 16'h026b :  // <0444> a = 107 // putasc "k"
addr == 16'h704 ? 16'hfba0 :  // <0444> putasc "k"
addr == 16'h705 ? 16'h009b :  // <0444> "
addr == 16'h706 ? 16'hfc00 :  // <0444> "
addr == 16'h707 ? 16'h0230 :  // <0445> a = 48 // putasc "0"
addr == 16'h708 ? 16'hfba0 :  // <0445> putasc "0"
addr == 16'h709 ? 16'h009b :  // <0445> "
addr == 16'h70a ? 16'hfc00 :  // <0445> "
addr == 16'h70b ? 16'he00f :  // <0446> end_event
addr == 16'h70c ? 16'h008e :  // <0446> "

// ######## event key1_handler // = 0x070d
addr == 16'h70d ? 16'h026b :  // <0449> a = 107 // putasc "k"
addr == 16'h70e ? 16'hfba0 :  // <0449> putasc "k"
addr == 16'h70f ? 16'h009b :  // <0449> "
addr == 16'h710 ? 16'hfc00 :  // <0449> "
addr == 16'h711 ? 16'h0231 :  // <0450> a = 49 // putasc "1"
addr == 16'h712 ? 16'hfba0 :  // <0450> putasc "1"
addr == 16'h713 ? 16'h009b :  // <0450> "
addr == 16'h714 ? 16'hfc00 :  // <0450> "
addr == 16'h715 ? 16'he00f :  // <0451> end_event
addr == 16'h716 ? 16'h008e :  // <0451> "

// ######## event softevent3_handler // = 0x0717
addr == 16'h717 ? 16'he00f :  // <0454> end_event
addr == 16'h718 ? 16'h008e :  // <0454> "

// ######## event softevent2_handler // = 0x0719
addr == 16'h719 ? 16'he00f :  // <0457> end_event
addr == 16'h71a ? 16'h008e :  // <0457> "

// ######## event softevent1_handler // = 0x071b
addr == 16'h71b ? 16'he00f :  // <0460> end_event
addr == 16'h71c ? 16'h008e :  // <0460> "

// ######## event softevent0_handler // = 0x071d
addr == 16'h71d ? 16'he00f :  // <0463> end_event
addr == 16'h71e ? 16'h008e :  // <0463> "

// :rpm_msg // = 0x071f
// ": rpm=\x0"
addr == 16'h71f ? 16'h203a :  // <0466>  :
addr == 16'h720 ? 16'h7072 :  // <0466> pr
addr == 16'h721 ? 16'h3d6d :  // <0466> =m
addr == 16'h722 ? 16'h0000 :  // <0466>   

// :puff_len_msg // = 0x0723
// " pfl=\x0"
addr == 16'h723 ? 16'h7020 :  // <0469> p 
addr == 16'h724 ? 16'h6c66 :  // <0469> lf
addr == 16'h725 ? 16'h003d :  // <0469>  =

// :o2_msg // = 0x0726
// " o2=\x0"
addr == 16'h726 ? 16'h6f20 :  // <0472> o 
addr == 16'h727 ? 16'h3d32 :  // <0472> =2
addr == 16'h728 ? 16'h0000 :  // <0472>   

// ######## func start_daq_pass // = 0x0729
addr == 16'h729 ? 16'h3004 :  // <0474> push x // func start_daq_pass
addr == 16'h72a ? 16'h303e :  // <0474> push rtna // "
// daq pass counter in RAM.
addr == 16'h72b ? 16'h5e00 :  // <0476> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h72c ? 16'h6214 :  // <0476> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h72d ? 16'h0015 :  // <0476> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h72e ? 16'h0016 :  // <0476> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h72f ? 16'h0601 :  // <0477> b = 1
addr == 16'h730 ? 16'hc800 :  // <0478> a = a+b
addr == 16'h731 ? 16'h0300 :  // <0478> "
addr == 16'h732 ? 16'h6c00 :  // <0479> leds = a
addr == 16'h733 ? 16'h5e00 :  // <0480> ram $ram_daq_pass_cnt = a // av_ad_hi = 0
addr == 16'h734 ? 16'h6214 :  // <0480> ram $ram_daq_pass_cnt = a // av_ad_lo = 20
addr == 16'h735 ? 16'h5400 :  // <0480> ram $ram_daq_pass_cnt = a // av_write_data = a
addr == 16'h736 ? 16'hfba0 :  // <0481> call :put4x
addr == 16'h737 ? 16'h00c3 :  // <0481> "
addr == 16'h738 ? 16'hfc00 :  // <0481> "

addr == 16'h739 ? 16'h03a0 :  // <0483> a = :rpm_msg
addr == 16'h73a ? 16'h071f :  // <0483> "
addr == 16'h73b ? 16'hfba0 :  // <0484> call :print_nt
addr == 16'h73c ? 16'h014f :  // <0484> "
addr == 16'h73d ? 16'hfc00 :  // <0484> "
addr == 16'h73e ? 16'h0200 :  // <0485> a = 0
addr == 16'h73f ? 16'h5e00 :  // <0486> ram x = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h740 ? 16'h6280 :  // <0486> ram x = $ram_rpm_valid // av_ad_lo = 128
addr == 16'h741 ? 16'h1015 :  // <0486> ram x = $ram_rpm_valid // x = av_write_data // start read cycle
addr == 16'h742 ? 16'h1016 :  // <0486> ram x = $ram_rpm_valid // x = av_read_data // finish read cycle

addr == 16'h743 ? 16'h0004 :  // <0489> a = x
addr == 16'h744 ? 16'h0600 :  // <0489> b = 0


addr == 16'h745 ? 16'he007 :  // <0489> br eq :else_1861
addr == 16'h746 ? 16'h074b :  // <0489> "

addr == 16'h747 ? 16'h5e00 :  // <0489> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h748 ? 16'h627e :  // <0489> ram a = $ram_avg_rpm // av_ad_lo = 126
addr == 16'h749 ? 16'h0015 :  // <0489> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h74a ? 16'h0016 :  // <0489> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle


// :else_1861 // = 0x074b

// :end_1861 // = 0x074b

addr == 16'h74b ? 16'hfba0 :  // <0490> call :put4x
addr == 16'h74c ? 16'h00c3 :  // <0490> "
addr == 16'h74d ? 16'hfc00 :  // <0490> "

addr == 16'h74e ? 16'h03a0 :  // <0492> a = :puff_len_msg
addr == 16'h74f ? 16'h0723 :  // <0492> "
addr == 16'h750 ? 16'hfba0 :  // <0493> call :print_nt
addr == 16'h751 ? 16'h014f :  // <0493> "
addr == 16'h752 ? 16'hfc00 :  // <0493> "
addr == 16'h753 ? 16'h0021 :  // <0494> a = puff_len_us
addr == 16'h754 ? 16'hfba0 :  // <0495> call :put4x
addr == 16'h755 ? 16'h00c3 :  // <0495> "
addr == 16'h756 ? 16'hfc00 :  // <0495> "
addr == 16'h757 ? 16'h022c :  // <0496> a = 44 // putasc ","
addr == 16'h758 ? 16'hfba0 :  // <0496> putasc ","
addr == 16'h759 ? 16'h009b :  // <0496> "
addr == 16'h75a ? 16'hfc00 :  // <0496> "
addr == 16'h75b ? 16'h5e00 :  // <0497> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h75c ? 16'h6294 :  // <0497> ram a = $ram_puff_count // av_ad_lo = 148
addr == 16'h75d ? 16'h0015 :  // <0497> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h75e ? 16'h0016 :  // <0497> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h75f ? 16'hfba0 :  // <0498> call :put4x
addr == 16'h760 ? 16'h00c3 :  // <0498> "
addr == 16'h761 ? 16'hfc00 :  // <0498> "

addr == 16'h762 ? 16'h03a0 :  // <0500> a = :o2_msg
addr == 16'h763 ? 16'h0726 :  // <0500> "
addr == 16'h764 ? 16'hfba0 :  // <0501> call :print_nt
addr == 16'h765 ? 16'h014f :  // <0501> "
addr == 16'h766 ? 16'hfc00 :  // <0501> "
addr == 16'h767 ? 16'h0205 :  // <0502> a = $o2_adc_channel

addr == 16'h768 ? 16'h0351 :  // <0503> a = a<<1
addr == 16'h769 ? 16'h0628 :  // <0503> b = 40
addr == 16'h76a ? 16'h5e00 :  // <0503> av_ad_hi = 0
addr == 16'h76b ? 16'h6300 :  // <0503> av_ad_lo = ad0
addr == 16'h76c ? 16'h0415 :  // <0503> b = av_write_data
addr == 16'h76d ? 16'h0416 :  // <0503> b = av_read_data

addr == 16'h76e ? 16'h0001 :  // <0504> a = b
addr == 16'h76f ? 16'hfba0 :  // <0505> call :put4x
addr == 16'h770 ? 16'h00c3 :  // <0505> "
addr == 16'h771 ? 16'hfc00 :  // <0505> "

// start to acquire & report all anmux channels.
addr == 16'h772 ? 16'h0207 :  // <0508> a = ($anmux_num_channels - 1)
addr == 16'h773 ? 16'hfba0 :  // <0509> call :anmux_set_chn
addr == 16'h774 ? 16'h00b2 :  // <0509> "
addr == 16'h775 ? 16'hfc00 :  // <0509> "
addr == 16'h776 ? 16'h4a05 :  // <0510> mstimer1 = $anmux_settle_ms

// // observe MCU utilization.  this RAM variable can be seen by the debugger.
addr == 16'h777 ? 16'h5e00 :  // <0513> ram $ram_mcu_usage_cnt = usage_count // av_ad_hi = 0
addr == 16'h778 ? 16'h6246 :  // <0513> ram $ram_mcu_usage_cnt = usage_count // av_ad_lo = 70
addr == 16'h779 ? 16'h540f :  // <0513> ram $ram_mcu_usage_cnt = usage_count // av_write_data = usage_count
addr == 16'h77a ? 16'h3e00 :  // <0514> usage_count = 0
addr == 16'h77b ? 16'hf80c :  // <0515> pop rtna // end_func
addr == 16'h77c ? 16'h100c :  // <0515> pop x // "
addr == 16'h77d ? 16'hfc00 :  // <0515> swapra = nop

// ######## event mstimer1_handler // = 0x077e
// anmux signal has settled.

addr == 16'h77e ? 16'h5e00 :  // <0520> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h77f ? 16'h6238 :  // <0520> ram a = $ram_adc_chn_pending // av_ad_lo = 56
addr == 16'h780 ? 16'h0015 :  // <0520> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h781 ? 16'h0016 :  // <0520> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle

addr == 16'h782 ? 16'h0000 :  // <0525> a = a
addr == 16'h783 ? 16'h0600 :  // <0525> b = 0


addr == 16'h784 ? 16'he007 :  // <0525> br eq :else_1924
addr == 16'h785 ? 16'h0789 :  // <0525> "

// ADC is busy right now.  wait a while & try again.
addr == 16'h786 ? 16'h4a02 :  // <0525> mstimer1 = $anmux_retry_ms
addr == 16'h787 ? 16'he00f :  // <0525> event_return
addr == 16'h788 ? 16'h008e :  // <0525> "


// :else_1924 // = 0x0789

// :end_1924 // = 0x0789


// start a reading from the current anmux channel.
addr == 16'h789 ? 16'h0220 :  // <0528> a = 32 // putasc " "
addr == 16'h78a ? 16'hfba0 :  // <0528> putasc " "
addr == 16'h78b ? 16'h009b :  // <0528> "
addr == 16'h78c ? 16'hfc00 :  // <0528> "
addr == 16'h78d ? 16'h0273 :  // <0529> a = 115 // putasc "s"
addr == 16'h78e ? 16'hfba0 :  // <0529> putasc "s"
addr == 16'h78f ? 16'h009b :  // <0529> "
addr == 16'h790 ? 16'hfc00 :  // <0529> "
addr == 16'h791 ? 16'hfba0 :  // <0530> call :anmux_get_chn
addr == 16'h792 ? 16'h00b6 :  // <0530> "
addr == 16'h793 ? 16'hfc00 :  // <0530> "
addr == 16'h794 ? 16'h0630 :  // <0531> b = 48 // asc b = "0"
addr == 16'h795 ? 16'hc800 :  // <0532> a = a+b // putchar a+b
addr == 16'h796 ? 16'h0300 :  // <0532> "
addr == 16'h797 ? 16'hfba0 :  // <0532> putchar a+b
addr == 16'h798 ? 16'h009b :  // <0532> "
addr == 16'h799 ? 16'hfc00 :  // <0532> "
addr == 16'h79a ? 16'h023d :  // <0533> a = 61 // putasc "="
addr == 16'h79b ? 16'hfba0 :  // <0533> putasc "="
addr == 16'h79c ? 16'h009b :  // <0533> "
addr == 16'h79d ? 16'hfc00 :  // <0533> "
addr == 16'h79e ? 16'h0207 :  // <0534> a = $anmux_adc_channel
addr == 16'h79f ? 16'hfba0 :  // <0535> call :begin_adc_conversion
addr == 16'h7a0 ? 16'h07a4 :  // <0535> "
addr == 16'h7a1 ? 16'hfc00 :  // <0535> "
addr == 16'h7a2 ? 16'he00f :  // <0536> end_event
addr == 16'h7a3 ? 16'h008e :  // <0536> "

// ######## func begin_adc_conversion // = 0x07a4
// begin SPI transaction, specifying Nano ADC channel to take effect NEXT
// conversion after this one.  pass that in a.

addr == 16'h7a4 ? 16'h5e00 :  // <0542> ram $ram_adc_chn_pending = a // av_ad_hi = 0
addr == 16'h7a5 ? 16'h6238 :  // <0542> ram $ram_adc_chn_pending = a // av_ad_lo = 56
addr == 16'h7a6 ? 16'h5400 :  // <0542> ram $ram_adc_chn_pending = a // av_write_data = a
addr == 16'h7a7 ? 16'h0352 :  // <0543> a = a<<4
addr == 16'h7a8 ? 16'h0352 :  // <0544> a = a<<4
addr == 16'h7a9 ? 16'h0351 :  // <0545> a = a<<1
addr == 16'h7aa ? 16'h0351 :  // <0546> a = a<<1
addr == 16'h7ab ? 16'h0351 :  // <0547> a = a<<1
addr == 16'h7ac ? 16'h5000 :  // <0548> spi_data = a
addr == 16'h7ad ? 16'h5e00 :  // <0549> ram $ram_adc_junk = 1 // av_ad_hi = 0
addr == 16'h7ae ? 16'h623a :  // <0549> ram $ram_adc_junk = 1 // av_ad_lo = 58
addr == 16'h7af ? 16'h5601 :  // <0549> ram $ram_adc_junk = 1 // av_write_data = 1
addr == 16'h7b0 ? 16'hfc00 :  // <0550> swapra = nop

// ######## event spi_done_handler // = 0x07b1
// discard the results of the first SPI exchange with the ADC.  that's only for writing the channel num out to the ADC.
addr == 16'h7b1 ? 16'h5e00 :  // <0554> ram a = $ram_adc_junk // av_ad_hi = 0
addr == 16'h7b2 ? 16'h623a :  // <0554> ram a = $ram_adc_junk // av_ad_lo = 58
addr == 16'h7b3 ? 16'h0015 :  // <0554> ram a = $ram_adc_junk // a = av_write_data // start read cycle
addr == 16'h7b4 ? 16'h0016 :  // <0554> ram a = $ram_adc_junk // a = av_read_data // finish read cycle

addr == 16'h7b5 ? 16'h0000 :  // <0566> a = a
addr == 16'h7b6 ? 16'h0600 :  // <0566> b = 0


addr == 16'h7b7 ? 16'he007 :  // <0566> br eq :else_1975
addr == 16'h7b8 ? 16'h07c8 :  // <0566> "

// start another SPI exchange to retrieve the actual reading.
addr == 16'h7b9 ? 16'h5e00 :  // <0566> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h7ba ? 16'h6238 :  // <0566> ram a = $ram_adc_chn_pending // av_ad_lo = 56
addr == 16'h7bb ? 16'h0015 :  // <0566> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h7bc ? 16'h0016 :  // <0566> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle
addr == 16'h7bd ? 16'h0352 :  // <0566> a = a<<4
addr == 16'h7be ? 16'h0352 :  // <0566> a = a<<4
addr == 16'h7bf ? 16'h0351 :  // <0566> a = a<<1
addr == 16'h7c0 ? 16'h0351 :  // <0566> a = a<<1
addr == 16'h7c1 ? 16'h0351 :  // <0566> a = a<<1
addr == 16'h7c2 ? 16'h5000 :  // <0566> spi_data = a
addr == 16'h7c3 ? 16'h5e00 :  // <0566> ram $ram_adc_junk = 0 // av_ad_hi = 0
addr == 16'h7c4 ? 16'h623a :  // <0566> ram $ram_adc_junk = 0 // av_ad_lo = 58
addr == 16'h7c5 ? 16'h5600 :  // <0566> ram $ram_adc_junk = 0 // av_write_data = 0
addr == 16'h7c6 ? 16'he00f :  // <0566> event_return
addr == 16'h7c7 ? 16'h008e :  // <0566> "


// :else_1975 // = 0x07c8

// :end_1975 // = 0x07c8


// memorize an actual ADC reading.
addr == 16'h7c8 ? 16'h5e00 :  // <0569> ram i = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h7c9 ? 16'h6238 :  // <0569> ram i = $ram_adc_chn_pending // av_ad_lo = 56
addr == 16'h7ca ? 16'h0815 :  // <0569> ram i = $ram_adc_chn_pending // i = av_write_data // start read cycle
addr == 16'h7cb ? 16'h0816 :  // <0569> ram i = $ram_adc_chn_pending // i = av_read_data // finish read cycle
addr == 16'h7cc ? 16'h5e00 :  // <0570> ram $ram_adc_chn_pending = 0 // av_ad_hi = 0
addr == 16'h7cd ? 16'h6238 :  // <0570> ram $ram_adc_chn_pending = 0 // av_ad_lo = 56
addr == 16'h7ce ? 16'h5600 :  // <0570> ram $ram_adc_chn_pending = 0 // av_write_data = 0
addr == 16'h7cf ? 16'h0002 :  // <0571> a = i
addr == 16'h7d0 ? 16'h0414 :  // <0572> b = spi_data

addr == 16'h7d1 ? 16'h0351 :  // <0573> a = a<<1
addr == 16'h7d2 ? 16'h3001 :  // <0573> push b // push b
addr == 16'h7d3 ? 16'h0628 :  // <0573> b = 40
addr == 16'h7d4 ? 16'h5e00 :  // <0573> av_ad_hi = 0
addr == 16'h7d5 ? 16'h6300 :  // <0573> av_ad_lo = ad0
addr == 16'h7d6 ? 16'h540c :  // <0573> pop av_write_data // pop av_write_data


addr == 16'h7d7 ? 16'h0002 :  // <0576> a = i
addr == 16'h7d8 ? 16'h0605 :  // <0576> b = 5


addr == 16'h7d9 ? 16'he407 :  // <0576> bn eq :else_2009
addr == 16'h7da ? 16'h07dd :  // <0576> "

addr == 16'h7db ? 16'he00f :  // <0576> event_return
addr == 16'h7dc ? 16'h008e :  // <0576> "


// :else_2009 // = 0x07dd

// :end_2009 // = 0x07dd


addr == 16'h7dd ? 16'h0002 :  // <0603> a = i
addr == 16'h7de ? 16'h0607 :  // <0603> b = 7


addr == 16'h7df ? 16'he407 :  // <0603> bn eq :else_2015
addr == 16'h7e0 ? 16'h0812 :  // <0603> "

// report anmux reading.
addr == 16'h7e1 ? 16'h0014 :  // <0603> a = spi_data
addr == 16'h7e2 ? 16'hfba0 :  // <0603> call :put4x
addr == 16'h7e3 ? 16'h00c3 :  // <0603> "
addr == 16'h7e4 ? 16'hfc00 :  // <0603> "

// memorize anmux reading.
addr == 16'h7e5 ? 16'hfba0 :  // <0603> call :anmux_get_chn
addr == 16'h7e6 ? 16'h00b6 :  // <0603> "
addr == 16'h7e7 ? 16'hfc00 :  // <0603> "
addr == 16'h7e8 ? 16'h0414 :  // <0603> b = spi_data

addr == 16'h7e9 ? 16'h0351 :  // <0603> a = a<<1
addr == 16'h7ea ? 16'h3001 :  // <0603> push b // push b
addr == 16'h7eb ? 16'h0618 :  // <0603> b = 24
addr == 16'h7ec ? 16'h5e00 :  // <0603> av_ad_hi = 0
addr == 16'h7ed ? 16'h6300 :  // <0603> av_ad_lo = ad0
addr == 16'h7ee ? 16'h540c :  // <0603> pop av_write_data // pop av_write_data


// decrement anmux channel & start waiting again.
addr == 16'h7ef ? 16'hfba0 :  // <0603> call :anmux_get_chn
addr == 16'h7f0 ? 16'h00b6 :  // <0603> "
addr == 16'h7f1 ? 16'hfc00 :  // <0603> "

addr == 16'h7f2 ? 16'h0000 :  // <0603> a = a
addr == 16'h7f3 ? 16'h0600 :  // <0603> b = 0


addr == 16'h7f4 ? 16'he007 :  // <0603> br eq :else_2036
addr == 16'h7f5 ? 16'h07ff :  // <0603> "

addr == 16'h7f6 ? 16'h0760 :  // <0603> b = -1
addr == 16'h7f7 ? 16'hc800 :  // <0603> a = a+b
addr == 16'h7f8 ? 16'h0300 :  // <0603> "
addr == 16'h7f9 ? 16'hfba0 :  // <0603> call :anmux_set_chn
addr == 16'h7fa ? 16'h00b2 :  // <0603> "
addr == 16'h7fb ? 16'hfc00 :  // <0603> "
addr == 16'h7fc ? 16'h4a05 :  // <0603> mstimer1 = $anmux_settle_ms
addr == 16'h7fd ? 16'he00f :  // <0603> event_return
addr == 16'h7fe ? 16'h008e :  // <0603> "


// :else_2036 // = 0x07ff

// :end_2036 // = 0x07ff


// end of temperature daq pass.
addr == 16'h7ff ? 16'hfba0 :  // <0603> call :report_plan
addr == 16'h800 ? 16'h093b :  // <0603> "
addr == 16'h801 ? 16'hfc00 :  // <0603> "
addr == 16'h802 ? 16'hfba0 :  // <0603> call :report_text_flags
addr == 16'h803 ? 16'h090b :  // <0603> "
addr == 16'h804 ? 16'hfc00 :  // <0603> "
addr == 16'h805 ? 16'h020d :  // <0603> a = 13 // puteol
addr == 16'h806 ? 16'hfba0 :  // <0603> puteol
addr == 16'h807 ? 16'h009b :  // <0603> "
addr == 16'h808 ? 16'hfc00 :  // <0603> "
addr == 16'h809 ? 16'h020a :  // <0603> a = 10 // puteol
addr == 16'h80a ? 16'hfba0 :  // <0603> puteol
addr == 16'h80b ? 16'h009b :  // <0603> "
addr == 16'h80c ? 16'hfc00 :  // <0603> "
addr == 16'h80d ? 16'h5e00 :  // <0603> ram $ram_dial_setting = spi_data // av_ad_hi = 0
addr == 16'h80e ? 16'h623c :  // <0603> ram $ram_dial_setting = spi_data // av_ad_lo = 60
addr == 16'h80f ? 16'h5414 :  // <0603> ram $ram_dial_setting = spi_data // av_write_data = spi_data
addr == 16'h810 ? 16'he00f :  // <0603> event_return
addr == 16'h811 ? 16'h008e :  // <0603> "


// :else_2015 // = 0x0812

// :end_2015 // = 0x0812

addr == 16'h812 ? 16'he00f :  // <0604> end_event
addr == 16'h813 ? 16'h008e :  // <0604> "

// :power_lost_msg // = 0x0814
// "PWL\x0"
addr == 16'h814 ? 16'h5750 :  // <0607> WP
addr == 16'h815 ? 16'h004c :  // <0607>  L

// ######## event power_lost_handler // = 0x0816
// at this time we have less than 2 ms of usable run time left.

// this must be an uncommanded loss of main power, because if it was commanded,
// no more events would be handled; this event handler wouldn't have a chance to run.
// immediately set the power relay PWM to full power for a few seconds,
// in case the power relay opened accidentally e.g. due to a hard pothole.
addr == 16'h816 ? 16'h7a00 :  // <0616> power_duty = $power_duty_closing
addr == 16'h817 ? 16'h5e00 :  // <0617> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h818 ? 16'h6214 :  // <0617> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h819 ? 16'h0015 :  // <0617> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h81a ? 16'h0016 :  // <0617> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h81b ? 16'h0602 :  // <0618> b = $relay_hold_passes
addr == 16'h81c ? 16'h5e00 :  // <0619> ram $ram_relay_hold_at_pass = a+b // av_ad_hi = 0
addr == 16'h81d ? 16'h6240 :  // <0619> ram $ram_relay_hold_at_pass = a+b // av_ad_lo = 64
addr == 16'h81e ? 16'hc800 :  // <0619> ram $ram_relay_hold_at_pass = a+b // av_write_data = a+b
addr == 16'h81f ? 16'h5700 :  // <0619> "

// pause any non-vital power-hogging operations, to conserve power for the EEPROM write.

// save persistent data in case the power remains down e.g. due to battery disconnect.
addr == 16'h820 ? 16'hfba0 :  // <0624> call :save_persistent_data
addr == 16'h821 ? 16'h0893 :  // <0624> "
addr == 16'h822 ? 16'hfc00 :  // <0624> "

addr == 16'h823 ? 16'h03a0 :  // <0626> a = :power_lost_msg
addr == 16'h824 ? 16'h0814 :  // <0626> "
addr == 16'h825 ? 16'hfba0 :  // <0627> call :set_text_flag
addr == 16'h826 ? 16'h08f2 :  // <0627> "
addr == 16'h827 ? 16'hfc00 :  // <0627> "
addr == 16'h828 ? 16'he00f :  // <0628> end_event
addr == 16'h829 ? 16'h008e :  // <0628> "

// :ign_off_msg // = 0x082a
// "IGOF\x0"
addr == 16'h82a ? 16'h4749 :  // <0631> GI
addr == 16'h82b ? 16'h464f :  // <0631> FO
addr == 16'h82c ? 16'h0000 :  // <0631>   

// ######## event ign_switch_off_handler // = 0x082d
// set power-down deadline in RAM.  this makes the system remain powered for several more minutes, for cooldown data logging.
addr == 16'h82d ? 16'h5e00 :  // <0635> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h82e ? 16'h6242 :  // <0635> ram a = $ram_minutes_cnt // av_ad_lo = 66
addr == 16'h82f ? 16'h0015 :  // <0635> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h830 ? 16'h0016 :  // <0635> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h831 ? 16'h060a :  // <0636> b = $power_extend_minutes
addr == 16'h832 ? 16'h5e00 :  // <0637> ram $ram_power_down_at_min = a+b // av_ad_hi = 0
addr == 16'h833 ? 16'h623e :  // <0637> ram $ram_power_down_at_min = a+b // av_ad_lo = 62
addr == 16'h834 ? 16'hc800 :  // <0637> ram $ram_power_down_at_min = a+b // av_write_data = a+b
addr == 16'h835 ? 16'h5700 :  // <0637> "
addr == 16'h836 ? 16'h03a0 :  // <0638> a = :ign_off_msg
addr == 16'h837 ? 16'h082a :  // <0638> "
addr == 16'h838 ? 16'hfba0 :  // <0639> call :set_text_flag
addr == 16'h839 ? 16'h08f2 :  // <0639> "
addr == 16'h83a ? 16'hfc00 :  // <0639> "
addr == 16'h83b ? 16'he00f :  // <0640> end_event
addr == 16'h83c ? 16'h008e :  // <0640> "

// :ign_on_msg // = 0x083d
// "IGON\x0"
addr == 16'h83d ? 16'h4749 :  // <0643> GI
addr == 16'h83e ? 16'h4e4f :  // <0643> NO
addr == 16'h83f ? 16'h0000 :  // <0643>   

// ######## event ign_switch_on_handler // = 0x0840
addr == 16'h840 ? 16'h5e00 :  // <0646> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h841 ? 16'h623e :  // <0646> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 62
addr == 16'h842 ? 16'h5760 :  // <0646> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h843 ? 16'h03a0 :  // <0647> a = :ign_on_msg
addr == 16'h844 ? 16'h083d :  // <0647> "
addr == 16'h845 ? 16'hfba0 :  // <0648> call :set_text_flag
addr == 16'h846 ? 16'h08f2 :  // <0648> "
addr == 16'h847 ? 16'hfc00 :  // <0648> "
addr == 16'h848 ? 16'he00f :  // <0649> end_event
addr == 16'h849 ? 16'h008e :  // <0649> "

// ######## event puff1_done_handler // = 0x084a
// puff just finished.  set length of next puff.
addr == 16'h84a ? 16'h5e00 :  // <0653> ram puff_len_us = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'h84b ? 16'h6292 :  // <0653> ram puff_len_us = $ram_next_puff_len_us // av_ad_lo = 146
addr == 16'h84c ? 16'h8415 :  // <0653> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_write_data // start read cycle
addr == 16'h84d ? 16'h8416 :  // <0653> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_read_data // finish read cycle

// count puffs.
addr == 16'h84e ? 16'h5e00 :  // <0656> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h84f ? 16'h6294 :  // <0656> ram a = $ram_puff_count // av_ad_lo = 148
addr == 16'h850 ? 16'h0015 :  // <0656> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h851 ? 16'h0016 :  // <0656> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h852 ? 16'h0601 :  // <0657> b = 1
addr == 16'h853 ? 16'h5e00 :  // <0658> ram $ram_puff_count = a+b // av_ad_hi = 0
addr == 16'h854 ? 16'h6294 :  // <0658> ram $ram_puff_count = a+b // av_ad_lo = 148
addr == 16'h855 ? 16'hc800 :  // <0658> ram $ram_puff_count = a+b // av_write_data = a+b
addr == 16'h856 ? 16'h5700 :  // <0658> "

// hack to set puff length strictly by a hard-wired knob.
// ram a = $ram_dial_setting
// a = a<<1
// a = a<<1
// a = a<<1
// bn az :nonzero
// a = 1
// :nonzero
// puff_len_us = a
addr == 16'h857 ? 16'he00f :  // <0669> end_event
addr == 16'h858 ? 16'h008e :  // <0669> "

// ######## func minute_events // = 0x0859
addr == 16'h859 ? 16'h303e :  // <0671> push rtna // func minute_events
addr == 16'h85a ? 16'hfba0 :  // <0672> call :check_power_down
addr == 16'h85b ? 16'h0876 :  // <0672> "
addr == 16'h85c ? 16'hfc00 :  // <0672> "
addr == 16'h85d ? 16'hf80c :  // <0673> pop rtna // end_func
addr == 16'h85e ? 16'hfc00 :  // <0673> swapra = nop

// :power_hold_msg // = 0x085f
// "PWH\x0"
addr == 16'h85f ? 16'h5750 :  // <0676> WP
addr == 16'h860 ? 16'h0048 :  // <0676>  H

// ######## func check_power_relay // = 0x0861
addr == 16'h861 ? 16'h303e :  // <0678> push rtna // func check_power_relay
addr == 16'h862 ? 16'h5e00 :  // <0679> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h863 ? 16'h6214 :  // <0679> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h864 ? 16'h0015 :  // <0679> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h865 ? 16'h0016 :  // <0679> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h866 ? 16'h5e00 :  // <0680> ram b = $ram_relay_hold_at_pass // av_ad_hi = 0
addr == 16'h867 ? 16'h6240 :  // <0680> ram b = $ram_relay_hold_at_pass // av_ad_lo = 64
addr == 16'h868 ? 16'h0415 :  // <0680> ram b = $ram_relay_hold_at_pass // b = av_write_data // start read cycle
addr == 16'h869 ? 16'h0416 :  // <0680> ram b = $ram_relay_hold_at_pass // b = av_read_data // finish read cycle

addr == 16'h86a ? 16'h0000 :  // <0686> a = a
addr == 16'h86b ? 16'h0401 :  // <0686> b = b


addr == 16'h86c ? 16'he407 :  // <0686> bn eq :else_2156
addr == 16'h86d ? 16'h0874 :  // <0686> "

// time to begin "solenoid saver" coil power reduction by PWM.
addr == 16'h86e ? 16'h7a19 :  // <0686> power_duty = $power_duty_holding
addr == 16'h86f ? 16'h03a0 :  // <0686> a = :power_hold_msg
addr == 16'h870 ? 16'h085f :  // <0686> "
addr == 16'h871 ? 16'hfba0 :  // <0686> call :set_text_flag
addr == 16'h872 ? 16'h08f2 :  // <0686> "
addr == 16'h873 ? 16'hfc00 :  // <0686> "


// :else_2156 // = 0x0874

// :end_2156 // = 0x0874

addr == 16'h874 ? 16'hf80c :  // <0687> pop rtna // end_func
addr == 16'h875 ? 16'hfc00 :  // <0687> swapra = nop

// ######## func check_power_down // = 0x0876
addr == 16'h876 ? 16'h303e :  // <0689> push rtna // func check_power_down
// check power-down deadline in RAM.
addr == 16'h877 ? 16'h5e00 :  // <0691> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h878 ? 16'h6242 :  // <0691> ram a = $ram_minutes_cnt // av_ad_lo = 66
addr == 16'h879 ? 16'h0015 :  // <0691> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h87a ? 16'h0016 :  // <0691> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h87b ? 16'h5e00 :  // <0692> ram b = $ram_power_down_at_min // av_ad_hi = 0
addr == 16'h87c ? 16'h623e :  // <0692> ram b = $ram_power_down_at_min // av_ad_lo = 62
addr == 16'h87d ? 16'h0415 :  // <0692> ram b = $ram_power_down_at_min // b = av_write_data // start read cycle
addr == 16'h87e ? 16'h0416 :  // <0692> ram b = $ram_power_down_at_min // b = av_read_data // finish read cycle

addr == 16'h87f ? 16'h0000 :  // <0695> a = a
addr == 16'h880 ? 16'h0401 :  // <0695> b = b


addr == 16'h881 ? 16'he407 :  // <0695> bn eq :else_2177
addr == 16'h882 ? 16'h0886 :  // <0695> "

addr == 16'h883 ? 16'hfba0 :  // <0695> call :power_down
addr == 16'h884 ? 16'h0888 :  // <0695> "
addr == 16'h885 ? 16'hfc00 :  // <0695> "


// :else_2177 // = 0x0886

// :end_2177 // = 0x0886

addr == 16'h886 ? 16'hf80c :  // <0696> pop rtna // end_func
addr == 16'h887 ? 16'hfc00 :  // <0696> swapra = nop

// ######## func power_down // = 0x0888
addr == 16'h888 ? 16'h303e :  // <0698> push rtna // func power_down
// this function never returns.
addr == 16'h889 ? 16'hfba0 :  // <0700> call :save_persistent_data
addr == 16'h88a ? 16'h0893 :  // <0700> "
addr == 16'h88b ? 16'hfc00 :  // <0700> "
addr == 16'h88c ? 16'h7a32 :  // <0701> power_duty = $power_duty_opening
addr == 16'h88d ? 16'h6fa0 :  // <0702> error_halt_code $err_power_down // leds = 0xfffc
addr == 16'h88e ? 16'hfffc :  // <0702> "
addr == 16'h88f ? 16'he00f :  // <0702> error_halt_code $err_power_down
addr == 16'h890 ? 16'h088f :  // <0702> "
addr == 16'h891 ? 16'hf80c :  // <0703> pop rtna // end_func
addr == 16'h892 ? 16'hfc00 :  // <0703> swapra = nop

// ######## func save_persistent_data // = 0x0893
addr == 16'h893 ? 16'hfc00 :  // <0706> swapra = nop

// ######## func check_communication // = 0x0894
addr == 16'h894 ? 16'h303e :  // <0708> push rtna // func check_communication
addr == 16'h895 ? 16'h5e00 :  // <0709> ram a = $ram_ftdi_downtime_remain_sec // av_ad_hi = 0
addr == 16'h896 ? 16'h6212 :  // <0709> ram a = $ram_ftdi_downtime_remain_sec // av_ad_lo = 18
addr == 16'h897 ? 16'h0015 :  // <0709> ram a = $ram_ftdi_downtime_remain_sec // a = av_write_data // start read cycle
addr == 16'h898 ? 16'h0016 :  // <0709> ram a = $ram_ftdi_downtime_remain_sec // a = av_read_data // finish read cycle

addr == 16'h899 ? 16'h0000 :  // <0717> a = a
addr == 16'h89a ? 16'h0600 :  // <0717> b = 0


addr == 16'h89b ? 16'he007 :  // <0717> br eq :else_2203
addr == 16'h89c ? 16'h08aa :  // <0717> "

addr == 16'h89d ? 16'h0760 :  // <0717> b = -1
addr == 16'h89e ? 16'hc800 :  // <0717> a = a+b
addr == 16'h89f ? 16'h0300 :  // <0717> "
addr == 16'h8a0 ? 16'h5e00 :  // <0717> ram $ram_ftdi_downtime_remain_sec = a // av_ad_hi = 0
addr == 16'h8a1 ? 16'h6212 :  // <0717> ram $ram_ftdi_downtime_remain_sec = a // av_ad_lo = 18
addr == 16'h8a2 ? 16'h5400 :  // <0717> ram $ram_ftdi_downtime_remain_sec = a // av_write_data = a

addr == 16'h8a3 ? 16'h0000 :  // <0717> a = a
addr == 16'h8a4 ? 16'h0600 :  // <0717> b = 0


addr == 16'h8a5 ? 16'he407 :  // <0717> bn eq :else_2213
addr == 16'h8a6 ? 16'h08aa :  // <0717> "

addr == 16'h8a7 ? 16'hfba0 :  // <0717> call :ftdi_power_on
addr == 16'h8a8 ? 16'h08de :  // <0717> "
addr == 16'h8a9 ? 16'hfc00 :  // <0717> "


// :else_2213 // = 0x08aa

// :end_2213 // = 0x08aa



// :else_2203 // = 0x08aa

// :end_2203 // = 0x08aa


addr == 16'h8aa ? 16'h5e00 :  // <0719> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h8ab ? 16'h6242 :  // <0719> ram a = $ram_minutes_cnt // av_ad_lo = 66
addr == 16'h8ac ? 16'h0015 :  // <0719> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h8ad ? 16'h0016 :  // <0719> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h8ae ? 16'h5e00 :  // <0720> ram b = $ram_comm_restart_at_min // av_ad_hi = 0
addr == 16'h8af ? 16'h6210 :  // <0720> ram b = $ram_comm_restart_at_min // av_ad_lo = 16
addr == 16'h8b0 ? 16'h0415 :  // <0720> ram b = $ram_comm_restart_at_min // b = av_write_data // start read cycle
addr == 16'h8b1 ? 16'h0416 :  // <0720> ram b = $ram_comm_restart_at_min // b = av_read_data // finish read cycle

addr == 16'h8b2 ? 16'h0000 :  // <0726> a = a
addr == 16'h8b3 ? 16'h0401 :  // <0726> b = b


addr == 16'h8b4 ? 16'he407 :  // <0726> bn eq :else_2228
addr == 16'h8b5 ? 16'h08bf :  // <0726> "

// comm restart is required.
addr == 16'h8b6 ? 16'hfba0 :  // <0726> call :postpone_comm_restart
addr == 16'h8b7 ? 16'h08c1 :  // <0726> "
addr == 16'h8b8 ? 16'hfc00 :  // <0726> "
addr == 16'h8b9 ? 16'h5e00 :  // <0726> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_hi = 0
addr == 16'h8ba ? 16'h6212 :  // <0726> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_lo = 18
addr == 16'h8bb ? 16'h5605 :  // <0726> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_write_data = 5
addr == 16'h8bc ? 16'hfba0 :  // <0726> call :ftdi_power_off
addr == 16'h8bd ? 16'h08ce :  // <0726> "
addr == 16'h8be ? 16'hfc00 :  // <0726> "


// :else_2228 // = 0x08bf

// :end_2228 // = 0x08bf

addr == 16'h8bf ? 16'hf80c :  // <0727> pop rtna // end_func
addr == 16'h8c0 ? 16'hfc00 :  // <0727> swapra = nop

// ######## func postpone_comm_restart // = 0x08c1
addr == 16'h8c1 ? 16'h5e00 :  // <0730> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h8c2 ? 16'h6242 :  // <0730> ram a = $ram_minutes_cnt // av_ad_lo = 66
addr == 16'h8c3 ? 16'h0015 :  // <0730> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h8c4 ? 16'h0016 :  // <0730> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h8c5 ? 16'h0602 :  // <0731> b = $comm_grace_period_min
addr == 16'h8c6 ? 16'h5e00 :  // <0732> ram $ram_comm_restart_at_min = a+b // av_ad_hi = 0
addr == 16'h8c7 ? 16'h6210 :  // <0732> ram $ram_comm_restart_at_min = a+b // av_ad_lo = 16
addr == 16'h8c8 ? 16'hc800 :  // <0732> ram $ram_comm_restart_at_min = a+b // av_write_data = a+b
addr == 16'h8c9 ? 16'h5700 :  // <0732> "
addr == 16'h8ca ? 16'hfc00 :  // <0733> swapra = nop

// :ftdi_off_msg // = 0x08cb
// "FTOF\x0"
addr == 16'h8cb ? 16'h5446 :  // <0736> TF
addr == 16'h8cc ? 16'h464f :  // <0736> FO
addr == 16'h8cd ? 16'h0000 :  // <0736>   

// ######## func ftdi_power_off // = 0x08ce
addr == 16'h8ce ? 16'h303e :  // <0738> push rtna // func ftdi_power_off
addr == 16'h8cf ? 16'h001c :  // <0739> a = board_ctrl
addr == 16'h8d0 ? 16'h07a0 :  // <0740> b = $not_ftdi_power_mask
addr == 16'h8d1 ? 16'hff7f :  // <0740> "
addr == 16'h8d2 ? 16'hc800 :  // <0741> board_ctrl = and
addr == 16'h8d3 ? 16'h7330 :  // <0741> "
addr == 16'h8d4 ? 16'h03a0 :  // <0742> a = :ftdi_off_msg
addr == 16'h8d5 ? 16'h08cb :  // <0742> "
addr == 16'h8d6 ? 16'hfba0 :  // <0743> call :set_text_flag
addr == 16'h8d7 ? 16'h08f2 :  // <0743> "
addr == 16'h8d8 ? 16'hfc00 :  // <0743> "
addr == 16'h8d9 ? 16'hf80c :  // <0744> pop rtna // end_func
addr == 16'h8da ? 16'hfc00 :  // <0744> swapra = nop

// :ftdi_on_msg // = 0x08db
// "FTON\x0"
addr == 16'h8db ? 16'h5446 :  // <0747> TF
addr == 16'h8dc ? 16'h4e4f :  // <0747> NO
addr == 16'h8dd ? 16'h0000 :  // <0747>   

// ######## func ftdi_power_on // = 0x08de
addr == 16'h8de ? 16'h303e :  // <0749> push rtna // func ftdi_power_on
addr == 16'h8df ? 16'h001c :  // <0750> a = board_ctrl
addr == 16'h8e0 ? 16'h0680 :  // <0751> b = $ftdi_power_mask
addr == 16'h8e1 ? 16'hc800 :  // <0752> board_ctrl = or
addr == 16'h8e2 ? 16'h7334 :  // <0752> "
addr == 16'h8e3 ? 16'h03a0 :  // <0753> a = :ftdi_on_msg
addr == 16'h8e4 ? 16'h08db :  // <0753> "
addr == 16'h8e5 ? 16'hfba0 :  // <0754> call :set_text_flag
addr == 16'h8e6 ? 16'h08f2 :  // <0754> "
addr == 16'h8e7 ? 16'hfc00 :  // <0754> "
addr == 16'h8e8 ? 16'hf80c :  // <0755> pop rtna // end_func
addr == 16'h8e9 ? 16'hfc00 :  // <0755> swapra = nop

// ######## func clear_ram_page // = 0x08ea
// pass the page to be cleared in av_ad_hi.
addr == 16'h8ea ? 16'h0200 :  // <0759> a = 0
addr == 16'h8eb ? 16'h0602 :  // <0760> b = 2
// :clear_next_word // = 0x08ec
addr == 16'h8ec ? 16'h6000 :  // <0762> av_ad_lo = a
addr == 16'h8ed ? 16'h5600 :  // <0763> av_write_data = 0
addr == 16'h8ee ? 16'h0300 :  // <0764> a = ad0
addr == 16'h8ef ? 16'he400 :  // <0765> bn az :clear_next_word
addr == 16'h8f0 ? 16'h08ec :  // <0765> "
addr == 16'h8f1 ? 16'hfc00 :  // <0766> swapra = nop

// ######## func set_text_flag // = 0x08f2
addr == 16'h8f2 ? 16'h0400 :  // <0769> b = a
addr == 16'h8f3 ? 16'h5e00 :  // <0770> ram a = $ram_next_tfp_idx // av_ad_hi = 0
addr == 16'h8f4 ? 16'h6258 :  // <0770> ram a = $ram_next_tfp_idx // av_ad_lo = 88
addr == 16'h8f5 ? 16'h0015 :  // <0770> ram a = $ram_next_tfp_idx // a = av_write_data // start read cycle
addr == 16'h8f6 ? 16'h0016 :  // <0770> ram a = $ram_next_tfp_idx // a = av_read_data // finish read cycle
addr == 16'h8f7 ? 16'h3000 :  // <0771> push a // push a

addr == 16'h8f8 ? 16'h0351 :  // <0772> a = a<<1
addr == 16'h8f9 ? 16'h3001 :  // <0772> push b // push b
addr == 16'h8fa ? 16'h0648 :  // <0772> b = 72
addr == 16'h8fb ? 16'h5e00 :  // <0772> av_ad_hi = 0
addr == 16'h8fc ? 16'h6300 :  // <0772> av_ad_lo = ad0
addr == 16'h8fd ? 16'h540c :  // <0772> pop av_write_data // pop av_write_data

addr == 16'h8fe ? 16'h000c :  // <0773> pop a // pop a
addr == 16'h8ff ? 16'h0760 :  // <0774> b = -1
addr == 16'h900 ? 16'hc800 :  // <0775> a = a+b
addr == 16'h901 ? 16'h0300 :  // <0775> "
addr == 16'h902 ? 16'h0607 :  // <0776> b = $tfp_mask
addr == 16'h903 ? 16'h5e00 :  // <0777> ram $ram_next_tfp_idx = and // av_ad_hi = 0
addr == 16'h904 ? 16'h6258 :  // <0777> ram $ram_next_tfp_idx = and // av_ad_lo = 88
addr == 16'h905 ? 16'hc800 :  // <0777> ram $ram_next_tfp_idx = and // av_write_data = and
addr == 16'h906 ? 16'h5730 :  // <0777> "
addr == 16'h907 ? 16'hfc00 :  // <0778> swapra = nop

// :text_flags_msg // = 0x0908
// " tf=\x0"
addr == 16'h908 ? 16'h7420 :  // <0781> t 
addr == 16'h909 ? 16'h3d66 :  // <0781> =f
addr == 16'h90a ? 16'h0000 :  // <0781>   

// ######## func report_text_flags // = 0x090b
addr == 16'h90b ? 16'h3002 :  // <0783> push i // func report_text_flags
addr == 16'h90c ? 16'h303e :  // <0783> push rtna // "
addr == 16'h90d ? 16'h03a0 :  // <0784> a = :text_flags_msg
addr == 16'h90e ? 16'h0908 :  // <0784> "
addr == 16'h90f ? 16'hfba0 :  // <0785> call :print_nt
addr == 16'h910 ? 16'h014f :  // <0785> "
addr == 16'h911 ? 16'hfc00 :  // <0785> "
addr == 16'h912 ? 16'h0a00 :  // <0796> i = 0
// :loop_2322 // = 0x0913

addr == 16'h913 ? 16'h0002 :  // <0796> a = i

addr == 16'h914 ? 16'h0351 :  // <0796> a = a<<1
addr == 16'h915 ? 16'h0648 :  // <0796> b = 72
addr == 16'h916 ? 16'h5e00 :  // <0796> av_ad_hi = 0
addr == 16'h917 ? 16'h6300 :  // <0796> av_ad_lo = ad0
addr == 16'h918 ? 16'h0415 :  // <0796> b = av_write_data
addr == 16'h919 ? 16'h0416 :  // <0796> b = av_read_data


addr == 16'h91a ? 16'h0001 :  // <0796> a = b
addr == 16'h91b ? 16'h0600 :  // <0796> b = 0


addr == 16'h91c ? 16'he007 :  // <0796> br eq :else_2332
addr == 16'h91d ? 16'h092d :  // <0796> "

addr == 16'h91e ? 16'hfba0 :  // <0796> call :print_nt
addr == 16'h91f ? 16'h014f :  // <0796> "
addr == 16'h920 ? 16'hfc00 :  // <0796> "
addr == 16'h921 ? 16'h022c :  // <0796> a = 44 // putasc ","
addr == 16'h922 ? 16'hfba0 :  // <0796> putasc ","
addr == 16'h923 ? 16'h009b :  // <0796> "
addr == 16'h924 ? 16'hfc00 :  // <0796> "
addr == 16'h925 ? 16'h0002 :  // <0796> a = i
addr == 16'h926 ? 16'h0600 :  // <0796> b = 0

addr == 16'h927 ? 16'h0351 :  // <0796> a = a<<1
addr == 16'h928 ? 16'h3001 :  // <0796> push b // push b
addr == 16'h929 ? 16'h0648 :  // <0796> b = 72
addr == 16'h92a ? 16'h5e00 :  // <0796> av_ad_hi = 0
addr == 16'h92b ? 16'h6300 :  // <0796> av_ad_lo = ad0
addr == 16'h92c ? 16'h540c :  // <0796> pop av_write_data // pop av_write_data



// :else_2332 // = 0x092d

// :end_2332 // = 0x092d



addr == 16'h92d ? 16'h0002 :  // <0796> a = i
addr == 16'h92e ? 16'h0601 :  // <0796> b = 1
addr == 16'h92f ? 16'hc800 :  // <0796> i = a+b
addr == 16'h930 ? 16'h0b00 :  // <0796> "


addr == 16'h931 ? 16'h0002 :  // <0796> a = i
addr == 16'h932 ? 16'h0608 :  // <0796> b = $num_text_flag_pointers
addr == 16'h933 ? 16'he005 :  // <0796> br lt :loop_2322
addr == 16'h934 ? 16'h0913 :  // <0796> "

// :end_2322 // = 0x0935
addr == 16'h935 ? 16'hf80c :  // <0797> pop rtna // end_func
addr == 16'h936 ? 16'h080c :  // <0797> pop i // "
addr == 16'h937 ? 16'hfc00 :  // <0797> swapra = nop

// :plan_msg // = 0x0938
// " pl=\x0"
addr == 16'h938 ? 16'h7020 :  // <0800> p 
addr == 16'h939 ? 16'h3d6c :  // <0800> =l
addr == 16'h93a ? 16'h0000 :  // <0800>   

// ######## func report_plan // = 0x093b
addr == 16'h93b ? 16'h303e :  // <0802> push rtna // func report_plan
addr == 16'h93c ? 16'h03a0 :  // <0803> a = :plan_msg
addr == 16'h93d ? 16'h0938 :  // <0803> "
addr == 16'h93e ? 16'hfba0 :  // <0804> call :print_nt
addr == 16'h93f ? 16'h014f :  // <0804> "
addr == 16'h940 ? 16'hfc00 :  // <0804> "
addr == 16'h941 ? 16'h5e00 :  // <0805> ram a = $ram_plan_name // av_ad_hi = 0
addr == 16'h942 ? 16'h628a :  // <0805> ram a = $ram_plan_name // av_ad_lo = 138
addr == 16'h943 ? 16'h0015 :  // <0805> ram a = $ram_plan_name // a = av_write_data // start read cycle
addr == 16'h944 ? 16'h0016 :  // <0805> ram a = $ram_plan_name // a = av_read_data // finish read cycle
addr == 16'h945 ? 16'hfba0 :  // <0806> call :print_nt
addr == 16'h946 ? 16'h014f :  // <0806> "
addr == 16'h947 ? 16'hfc00 :  // <0806> "
addr == 16'h948 ? 16'hf80c :  // <0807> pop rtna // end_func
addr == 16'h949 ? 16'hfc00 :  // <0807> swapra = nop

// ######## func jf_to_rpm // = 0x094a
addr == 16'h94a ? 16'h303e :  // <0809> push rtna // func jf_to_rpm
// pass jiffies in a.  return rpm in a.
// resolution = 32 rpm.
addr == 16'h94b ? 16'h0400 :  // <0812> b = a
addr == 16'h94c ? 16'h03a0 :  // <0813> a = 0x5573
addr == 16'h94d ? 16'h5573 :  // <0813> "
// = 700000 >> 5
addr == 16'h94e ? 16'hfba0 :  // <0815> call :divide
addr == 16'h94f ? 16'h018c :  // <0815> "
addr == 16'h950 ? 16'hfc00 :  // <0815> "
addr == 16'h951 ? 16'h0001 :  // <0816> a = b
addr == 16'h952 ? 16'h0352 :  // <0817> a = a<<4
addr == 16'h953 ? 16'h0351 :  // <0818> a = a<<1
addr == 16'h954 ? 16'hf80c :  // <0819> pop rtna // end_func
addr == 16'h955 ? 16'hfc00 :  // <0819> swapra = nop

// ######## func check_engine_stop // = 0x0956
addr == 16'h956 ? 16'h303e :  // <0821> push rtna // func check_engine_stop
// returns a=1 if transitioned to stop, else a=0.

// transition to plan_stop if ignition switch is turned off AND rpm estimate is invalid.
// requiring both conditions prevents spurious noise readings from shutting down the injection.

addr == 16'h957 ? 16'h001e :  // <0835> a = power_duty
addr == 16'h958 ? 16'h0680 :  // <0835> b = ( 0x0080 )


addr == 16'h959 ? 16'he003 :  // <0835> br and0z :else_2393
addr == 16'h95a ? 16'h096e :  // <0835> "

addr == 16'h95b ? 16'h5e00 :  // <0835> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h95c ? 16'h6280 :  // <0835> ram a = $ram_rpm_valid // av_ad_lo = 128
addr == 16'h95d ? 16'h0015 :  // <0835> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h95e ? 16'h0016 :  // <0835> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle

addr == 16'h95f ? 16'h0000 :  // <0835> a = a
addr == 16'h960 ? 16'h0600 :  // <0835> b = 0


addr == 16'h961 ? 16'he407 :  // <0835> bn eq :else_2401
addr == 16'h962 ? 16'h096e :  // <0835> "

addr == 16'h963 ? 16'h5e00 :  // <0835> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h964 ? 16'h6290 :  // <0835> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h965 ? 16'hf815 :  // <0835> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h966 ? 16'hf816 :  // <0835> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h967 ? 16'hfc00 :  // <0835> swapra = nop
addr == 16'h968 ? 16'hfba0 :  // <0835> call :init_plan_stop
addr == 16'h969 ? 16'h02f7 :  // <0835> "
addr == 16'h96a ? 16'hfc00 :  // <0835> "
addr == 16'h96b ? 16'h0201 :  // <0835> a = 1
addr == 16'h96c ? 16'hf80c :  // <0835> pop rtna // rtn
addr == 16'h96d ? 16'hfc00 :  // <0835> swapra = nop


// :else_2401 // = 0x096e

// :end_2401 // = 0x096e



// :else_2393 // = 0x096e

// :end_2393 // = 0x096e

addr == 16'h96e ? 16'h0200 :  // <0836> a = 0
addr == 16'h96f ? 16'hf80c :  // <0837> pop rtna // end_func
addr == 16'h970 ? 16'hfc00 :  // <0837> swapra = nop


        
                16'hxxxx;
        endmodule
    
