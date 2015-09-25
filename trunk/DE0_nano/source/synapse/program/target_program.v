
        `include "header.v"

        module target_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.

addr == 16'h00 ? 16'he00f :  // <0004> jmp :main
addr == 16'h01 ? 16'h050d :  // <0004> "


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
addr == 16'h8f ? 16'h054c :  // <0006> "
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
addr == 16'ha4 ? 16'h0208 :  // <0065> a = $arx_fifo_empty_mask
// :wait_for_busy // = 0x00a5
addr == 16'ha5 ? 16'h041a :  // <0067> b = fduart_status
addr == 16'ha6 ? 16'he403 :  // <0068> bn and0z :wait_for_busy
addr == 16'ha7 ? 16'h00a5 :  // <0068> "
addr == 16'ha8 ? 16'h0019 :  // <0069> a = fduart_data
addr == 16'ha9 ? 16'hfc00 :  // <0070> swapra = nop

// returns a character in a, or -1 if none.
// ######## func pollchar_fduart // = 0x00aa
// check for FIFO is populated.
addr == 16'haa ? 16'h0208 :  // <0076> a = $arx_fifo_empty_mask
addr == 16'hab ? 16'h041a :  // <0077> b = fduart_status
addr == 16'hac ? 16'he403 :  // <0078> bn and0z :none
addr == 16'had ? 16'h00b0 :  // <0078> "
addr == 16'hae ? 16'h0019 :  // <0079> a = fduart_data
addr == 16'haf ? 16'hfc00 :  // <0080> swapra = nop
// :none // = 0x00b0
addr == 16'hb0 ? 16'h0360 :  // <0083> a = -1
addr == 16'hb1 ? 16'hfc00 :  // <0084> swapra = nop


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
addr == 16'hb6 ? 16'h001d :  // <0013> a = anmux_ctrl
addr == 16'hb7 ? 16'h0607 :  // <0014> b = $anmux_channel_mask
addr == 16'hb8 ? 16'hc800 :  // <0015> a = and
addr == 16'hb9 ? 16'h0330 :  // <0015> "
addr == 16'hba ? 16'hfc00 :  // <0016> swapra = nop


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
addr == 16'hfc ? 16'h3002 :  // <0092> push i // func get4x
addr == 16'hfd ? 16'h3003 :  // <0092> push j // "
addr == 16'hfe ? 16'h3004 :  // <0092> push x // "
addr == 16'hff ? 16'h3005 :  // <0092> push y // "
addr == 16'h100 ? 16'h303e :  // <0092> push rtna // "
// y = digit counter
// j = sum
addr == 16'h101 ? 16'h1604 :  // <0095> y = 4
// :again // = 0x0102
addr == 16'h102 ? 16'hfba0 :  // <0097> getchar
addr == 16'h103 ? 16'h00a4 :  // <0097> "
addr == 16'h104 ? 16'hfc00 :  // <0097> "
addr == 16'h105 ? 16'h13a0 :  // <0098> x = :hexdigits
addr == 16'h106 ? 16'h00bb :  // <0098> "
addr == 16'h107 ? 16'h0a10 :  // <0099> i = 16
addr == 16'h108 ? 16'hfba0 :  // <0100> call :find_in_fetch
addr == 16'h109 ? 16'h01f0 :  // <0100> "
addr == 16'h10a ? 16'hfc00 :  // <0100> "
addr == 16'h10b ? 16'h0760 :  // <0101> b = -1
addr == 16'h10c ? 16'he007 :  // <0102> br eq :fail
addr == 16'h10d ? 16'h0121 :  // <0102> "
addr == 16'h10e ? 16'h0400 :  // <0103> b = a
addr == 16'h10f ? 16'h0003 :  // <0104> a = j
addr == 16'h110 ? 16'h0352 :  // <0105> a = a<<4
addr == 16'h111 ? 16'hc800 :  // <0106> j = or
addr == 16'h112 ? 16'h0f34 :  // <0106> "
addr == 16'h113 ? 16'h1360 :  // <0107> x = -1
addr == 16'h114 ? 16'hc800 :  // <0108> y = x+y
addr == 16'h115 ? 16'h1720 :  // <0108> "
addr == 16'h116 ? 16'h0005 :  // <0109> a = y
addr == 16'h117 ? 16'he400 :  // <0110> bn az :again
addr == 16'h118 ? 16'h0102 :  // <0110> "
addr == 16'h119 ? 16'h0003 :  // <0111> a = j
addr == 16'h11a ? 16'h0600 :  // <0112> b = 0
addr == 16'h11b ? 16'hf80c :  // <0113> pop rtna // rtn
addr == 16'h11c ? 16'h140c :  // <0113> pop y // "
addr == 16'h11d ? 16'h100c :  // <0113> pop x // "
addr == 16'h11e ? 16'h0c0c :  // <0113> pop j // "
addr == 16'h11f ? 16'h080c :  // <0113> pop i // "
addr == 16'h120 ? 16'hfc00 :  // <0113> swapra = nop
// :fail // = 0x0121
addr == 16'h121 ? 16'h0760 :  // <0116> b = -1
addr == 16'h122 ? 16'hf80c :  // <0117> pop rtna // end_func
addr == 16'h123 ? 16'h140c :  // <0117> pop y // "
addr == 16'h124 ? 16'h100c :  // <0117> pop x // "
addr == 16'h125 ? 16'h0c0c :  // <0117> pop j // "
addr == 16'h126 ? 16'h080c :  // <0117> pop i // "
addr == 16'h127 ? 16'hfc00 :  // <0117> swapra = nop

// print a fixed-length string from packed words in program space.
// pass its word address (not its byte address) in a,  its length (bytes) in b.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_fixed // = 0x0128
addr == 16'h128 ? 16'h3002 :  // <0124> push i // func print_fixed
addr == 16'h129 ? 16'h3003 :  // <0124> push j // "
addr == 16'h12a ? 16'h3004 :  // <0124> push x // "
addr == 16'h12b ? 16'h3005 :  // <0124> push y // "
addr == 16'h12c ? 16'h3006 :  // <0124> push g6 // "
addr == 16'h12d ? 16'h303e :  // <0124> push rtna // "
addr == 16'h12e ? 16'h0800 :  // <0125> i = a
addr == 16'h12f ? 16'h0e01 :  // <0126> j = 1
addr == 16'h130 ? 16'h1001 :  // <0127> x = b
addr == 16'h131 ? 16'h1760 :  // <0128> y = -1
// :next_word // = 0x0132
addr == 16'h132 ? 16'he002 :  // <0130> br xz :done
addr == 16'h133 ? 16'h0148 :  // <0130> "
addr == 16'h134 ? 16'h1320 :  // <0131> x = ad2
addr == 16'h135 ? 16'hd002 :  // <0132> fetch g6 from i
addr == 16'h136 ? 16'h1bb0 :  // <0132> "
// now x = bytes remaining, i = current word address, g6 = data word.
addr == 16'h137 ? 16'h0006 :  // <0134> a = g6 // putchar g6
addr == 16'h138 ? 16'hfba0 :  // <0134> putchar g6
addr == 16'h139 ? 16'h009b :  // <0134> "
addr == 16'h13a ? 16'hfc00 :  // <0134> "
addr == 16'h13b ? 16'he002 :  // <0135> br xz :done
addr == 16'h13c ? 16'h0148 :  // <0135> "
addr == 16'h13d ? 16'h1320 :  // <0136> x = ad2
addr == 16'h13e ? 16'h0006 :  // <0137> a = g6
addr == 16'h13f ? 16'h0353 :  // <0138> a = a>>4
addr == 16'h140 ? 16'h0353 :  // <0139> a = a>>4
addr == 16'h141 ? 16'hfba0 :  // <0140> putchar a
addr == 16'h142 ? 16'h009b :  // <0140> "
addr == 16'h143 ? 16'hfc00 :  // <0140> "
addr == 16'h144 ? 16'hc800 :  // <0141> i = i+j
addr == 16'h145 ? 16'h0b10 :  // <0141> "
addr == 16'h146 ? 16'he00f :  // <0142> jmp :next_word
addr == 16'h147 ? 16'h0132 :  // <0142> "
// :done // = 0x0148
addr == 16'h148 ? 16'hf80c :  // <0144> pop rtna // end_func
addr == 16'h149 ? 16'h180c :  // <0144> pop g6 // "
addr == 16'h14a ? 16'h140c :  // <0144> pop y // "
addr == 16'h14b ? 16'h100c :  // <0144> pop x // "
addr == 16'h14c ? 16'h0c0c :  // <0144> pop j // "
addr == 16'h14d ? 16'h080c :  // <0144> pop i // "
addr == 16'h14e ? 16'hfc00 :  // <0144> swapra = nop

// print a null-terminated string from packed words in program space.
// pass its word address (not its byte address) in a.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_nt // = 0x014f
addr == 16'h14f ? 16'h3002 :  // <0151> push i // func print_nt
addr == 16'h150 ? 16'h3003 :  // <0151> push j // "
addr == 16'h151 ? 16'h3004 :  // <0151> push x // "
addr == 16'h152 ? 16'h303e :  // <0151> push rtna // "
addr == 16'h153 ? 16'h0800 :  // <0152> i = a
addr == 16'h154 ? 16'h0e01 :  // <0153> j = 1
// :next_word // = 0x0155
addr == 16'h155 ? 16'hd002 :  // <0155> fetch x from i
addr == 16'h156 ? 16'h13b0 :  // <0155> "
// now i = current word address, x = data word, b = low byte mask, a = data byte.
addr == 16'h157 ? 16'h0004 :  // <0157> a = x
addr == 16'h158 ? 16'h06ff :  // <0158> b = 0xff
addr == 16'h159 ? 16'he003 :  // <0159> br and0z :done
addr == 16'h15a ? 16'h016b :  // <0159> "
addr == 16'h15b ? 16'hfba0 :  // <0160> putchar a
addr == 16'h15c ? 16'h009b :  // <0160> "
addr == 16'h15d ? 16'hfc00 :  // <0160> "
addr == 16'h15e ? 16'h0004 :  // <0161> a = x
addr == 16'h15f ? 16'h0353 :  // <0162> a = a>>4
addr == 16'h160 ? 16'h0353 :  // <0163> a = a>>4
addr == 16'h161 ? 16'h06ff :  // <0164> b = 0xff
addr == 16'h162 ? 16'he003 :  // <0165> br and0z :done
addr == 16'h163 ? 16'h016b :  // <0165> "
addr == 16'h164 ? 16'hfba0 :  // <0166> putchar a
addr == 16'h165 ? 16'h009b :  // <0166> "
addr == 16'h166 ? 16'hfc00 :  // <0166> "
addr == 16'h167 ? 16'hc800 :  // <0167> i = i+j
addr == 16'h168 ? 16'h0b10 :  // <0167> "
addr == 16'h169 ? 16'he00f :  // <0168> jmp :next_word
addr == 16'h16a ? 16'h0155 :  // <0168> "
// :done // = 0x016b
addr == 16'h16b ? 16'hf80c :  // <0170> pop rtna // end_func
addr == 16'h16c ? 16'h100c :  // <0170> pop x // "
addr == 16'h16d ? 16'h0c0c :  // <0170> pop j // "
addr == 16'h16e ? 16'h080c :  // <0170> pop i // "
addr == 16'h16f ? 16'hfc00 :  // <0170> swapra = nop


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
addr == 16'h18c ? 16'h3002 :  // <0030> push i // func divide
addr == 16'h18d ? 16'h3003 :  // <0030> push j // "
addr == 16'h18e ? 16'h3004 :  // <0030> push x // "
addr == 16'h18f ? 16'h3005 :  // <0030> push y // "
addr == 16'h190 ? 16'h3006 :  // <0030> push g6 // "
addr == 16'h191 ? 16'h3007 :  // <0030> push g7 // "
// unsigned 15-bit division.  b = a / b.  return remainder in a.
// division by zero results in zero.
// THE HIGH BIT OF A MUST BE 0!!  ALSO THE HIGH BIT OF B MUST BE 0!!
// 1 in the high bit of either operand results in infinite loop or wrong results.
// bigger/safer/faster math can be obtained from Altera IP blocks.

// degenerate cases.
addr == 16'h192 ? 16'he005 :  // <0038> br lt :zero
addr == 16'h193 ? 16'h01cd :  // <0038> "
addr == 16'h194 ? 16'he000 :  // <0039> br az :zero
addr == 16'h195 ? 16'h01cd :  // <0039> "
addr == 16'h196 ? 16'h1000 :  // <0040> x = a
//    g7 = x
addr == 16'h197 ? 16'h0001 :  // <0042> a = b
addr == 16'h198 ? 16'he000 :  // <0043> br az :zero
addr == 16'h199 ? 16'h01cd :  // <0043> "
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
addr == 16'h19a ? 16'h0404 :  // <0059> b = x
addr == 16'h19b ? 16'h0a00 :  // <0060> i = 0
addr == 16'h19c ? 16'h0e01 :  // <0061> j = 1
// :shift_again // = 0x019d
addr == 16'h19d ? 16'he006 :  // <0063> br gt :shift_done
addr == 16'h19e ? 16'h01a3 :  // <0063> "
addr == 16'h19f ? 16'h0351 :  // <0064> a = a<<1
addr == 16'h1a0 ? 16'h0b10 :  // <0065> i = ad1
addr == 16'h1a1 ? 16'he00f :  // <0066> jmp :shift_again
addr == 16'h1a2 ? 16'h019d :  // <0066> "
// :shift_done // = 0x01a3
addr == 16'h1a3 ? 16'h1b50 :  // <0068> g6 = a>>1
// now operands are x / g6.  i = number of passes of long division required.
// notice i was not decremented here, so it has 1 more in it than the number of shifts required for digit parity.
// that's exactly what it needs for correctness.

// // compensate for special case where msb was 1.  then 1 more division pass is needed.
// j = y
// i = i+j
// x = g7

// long division.  g7 = quotient.
addr == 16'h1a4 ? 16'h1e00 :  // <0079> g7 = 0
addr == 16'h1a5 ? 16'h0f60 :  // <0080> j = -1
// :again // = 0x01a6
addr == 16'h1a6 ? 16'he001 :  // <0082> br iz :done
addr == 16'h1a7 ? 16'h01c4 :  // <0082> "
addr == 16'h1a8 ? 16'h0006 :  // <0083> a = g6
addr == 16'h1a9 ? 16'h0404 :  // <0084> b = x
addr == 16'h1aa ? 16'he006 :  // <0085> br gt :result0
addr == 16'h1ab ? 16'h01bc :  // <0085> "
// temp does fit; output a 1.
addr == 16'h1ac ? 16'h0007 :  // <0087> a = g7
addr == 16'h1ad ? 16'h0351 :  // <0088> a = a<<1
addr == 16'h1ae ? 16'h0601 :  // <0089> b = 1
addr == 16'h1af ? 16'hc800 :  // <0090> g7 = or
addr == 16'h1b0 ? 16'h1f34 :  // <0090> "
// dividend = dividend - temp
addr == 16'h1b1 ? 16'h0006 :  // <0092> a = g6
addr == 16'h1b2 ? 16'h0760 :  // <0093> b = -1
addr == 16'h1b3 ? 16'hc800 :  // <0094> a = xor
addr == 16'h1b4 ? 16'h0338 :  // <0094> "
addr == 16'h1b5 ? 16'h0601 :  // <0095> b = 1
addr == 16'h1b6 ? 16'hc800 :  // <0096> y = a+b
addr == 16'h1b7 ? 16'h1700 :  // <0096> "
addr == 16'h1b8 ? 16'hc800 :  // <0097> x = x+y
addr == 16'h1b9 ? 16'h1320 :  // <0097> "
addr == 16'h1ba ? 16'he00f :  // <0098> jmp :next
addr == 16'h1bb ? 16'h01be :  // <0098> "
// :result0 // = 0x01bc
// temp does not fit; output a 0.
addr == 16'h1bc ? 16'h0007 :  // <0101> a = g7
addr == 16'h1bd ? 16'h1f51 :  // <0102> g7 = a<<1
// no change to dividend.
// :next // = 0x01be
addr == 16'h1be ? 16'h0006 :  // <0105> a = g6
addr == 16'h1bf ? 16'h1b50 :  // <0106> g6 = a>>1
addr == 16'h1c0 ? 16'hc800 :  // <0107> i = i+j
addr == 16'h1c1 ? 16'h0b10 :  // <0107> "
addr == 16'h1c2 ? 16'he00f :  // <0108> jmp :again
addr == 16'h1c3 ? 16'h01a6 :  // <0108> "

// :done // = 0x01c4
addr == 16'h1c4 ? 16'h0407 :  // <0111> b = g7
addr == 16'h1c5 ? 16'h0004 :  // <0112> a = x
addr == 16'h1c6 ? 16'h1c0c :  // <0113> pop g7 // rtn
addr == 16'h1c7 ? 16'h180c :  // <0113> pop g6 // "
addr == 16'h1c8 ? 16'h140c :  // <0113> pop y // "
addr == 16'h1c9 ? 16'h100c :  // <0113> pop x // "
addr == 16'h1ca ? 16'h0c0c :  // <0113> pop j // "
addr == 16'h1cb ? 16'h080c :  // <0113> pop i // "
addr == 16'h1cc ? 16'hfc00 :  // <0113> swapra = nop

// :zero // = 0x01cd
addr == 16'h1cd ? 16'h0600 :  // <0117> b = 0
addr == 16'h1ce ? 16'h1c0c :  // <0118> pop g7 // rtn
addr == 16'h1cf ? 16'h180c :  // <0118> pop g6 // "
addr == 16'h1d0 ? 16'h140c :  // <0118> pop y // "
addr == 16'h1d1 ? 16'h100c :  // <0118> pop x // "
addr == 16'h1d2 ? 16'h0c0c :  // <0118> pop j // "
addr == 16'h1d3 ? 16'h080c :  // <0118> pop i // "
addr == 16'h1d4 ? 16'hfc00 :  // <0118> swapra = nop
addr == 16'h1d5 ? 16'h1c0c :  // <0120> pop g7 // end_func
addr == 16'h1d6 ? 16'h180c :  // <0120> pop g6 // "
addr == 16'h1d7 ? 16'h140c :  // <0120> pop y // "
addr == 16'h1d8 ? 16'h100c :  // <0120> pop x // "
addr == 16'h1d9 ? 16'h0c0c :  // <0120> pop j // "
addr == 16'h1da ? 16'h080c :  // <0120> pop i // "
addr == 16'h1db ? 16'hfc00 :  // <0120> swapra = nop


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
addr == 16'h1e7 ? 16'h0350 :  // <0015> a = a>>1
addr == 16'h1e8 ? 16'h0404 :  // <0016> b = x
addr == 16'h1e9 ? 16'hc800 :  // <0017> fetch a from a+b
addr == 16'h1ea ? 16'hd300 :  // <0017> "
addr == 16'h1eb ? 16'h03b0 :  // <0017> "
addr == 16'h1ec ? 16'h06ff :  // <0018> b = 0xff
addr == 16'h1ed ? 16'hc800 :  // <0019> a = and
addr == 16'h1ee ? 16'h0330 :  // <0019> "
addr == 16'h1ef ? 16'hfc00 :  // <0020> swapra = nop

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// ######## func find_in_fetch // = 0x01f0
addr == 16'h1f0 ? 16'h3002 :  // <0029> push i // func find_in_fetch
addr == 16'h1f1 ? 16'h3003 :  // <0029> push j // "
addr == 16'h1f2 ? 16'h3005 :  // <0029> push y // "
addr == 16'h1f3 ? 16'h303e :  // <0029> push rtna // "
addr == 16'h1f4 ? 16'h1400 :  // <0030> y = a
addr == 16'h1f5 ? 16'h0f60 :  // <0031> j = -1
// :again // = 0x01f6
addr == 16'h1f6 ? 16'he001 :  // <0033> br iz :fail
addr == 16'h1f7 ? 16'h0206 :  // <0033> "
addr == 16'h1f8 ? 16'h0b10 :  // <0034> i = ad1
addr == 16'h1f9 ? 16'h0002 :  // <0035> a = i
addr == 16'h1fa ? 16'hfba0 :  // <0036> call :fetch_byte
addr == 16'h1fb ? 16'h01dc :  // <0036> "
addr == 16'h1fc ? 16'hfc00 :  // <0036> "
addr == 16'h1fd ? 16'h0405 :  // <0037> b = y
addr == 16'h1fe ? 16'he407 :  // <0038> bn eq :again
addr == 16'h1ff ? 16'h01f6 :  // <0038> "
// :found // = 0x0200
addr == 16'h200 ? 16'h0002 :  // <0040> a = i
addr == 16'h201 ? 16'hf80c :  // <0041> pop rtna // rtn
addr == 16'h202 ? 16'h140c :  // <0041> pop y // "
addr == 16'h203 ? 16'h0c0c :  // <0041> pop j // "
addr == 16'h204 ? 16'h080c :  // <0041> pop i // "
addr == 16'h205 ? 16'hfc00 :  // <0041> swapra = nop
// :fail // = 0x0206
addr == 16'h206 ? 16'h0360 :  // <0044> a = -1
addr == 16'h207 ? 16'hf80c :  // <0045> pop rtna // end_func
addr == 16'h208 ? 16'h140c :  // <0045> pop y // "
addr == 16'h209 ? 16'h0c0c :  // <0045> pop j // "
addr == 16'h20a ? 16'h080c :  // <0045> pop i // "
addr == 16'h20b ? 16'hfc00 :  // <0045> swapra = nop


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
addr == 16'h221 ? 16'h02b6 :  // <0006> ([label hello_cmd])
// "  plstp"
addr == 16'h222 ? 16'h2020 :  // <0007>   
addr == 16'h223 ? 16'h6c70 :  // <0007> lp
addr == 16'h224 ? 16'h7473 :  // <0007> ts
addr == 16'h225 ? 16'h0070 :  // <0007>  p
addr == 16'h226 ? 16'h02ba :  // <0008> ([label set_plan_stop_cmd])
// "   plcr"
addr == 16'h227 ? 16'h2020 :  // <0009>   
addr == 16'h228 ? 16'h7020 :  // <0009> p 
addr == 16'h229 ? 16'h636c :  // <0009> cl
addr == 16'h22a ? 16'h0072 :  // <0009>  r
addr == 16'h22b ? 16'h02c5 :  // <0010> ([label set_plan_crank_cmd])
// "   plwm"
addr == 16'h22c ? 16'h2020 :  // <0011>   
addr == 16'h22d ? 16'h7020 :  // <0011> p 
addr == 16'h22e ? 16'h776c :  // <0011> wl
addr == 16'h22f ? 16'h006d :  // <0011>  m
addr == 16'h230 ? 16'h02d0 :  // <0012> ([label set_plan_warmup_cmd])
// "   plrn"
addr == 16'h231 ? 16'h2020 :  // <0013>   
addr == 16'h232 ? 16'h7020 :  // <0013> p 
addr == 16'h233 ? 16'h726c :  // <0013> rl
addr == 16'h234 ? 16'h006e :  // <0013>  n
addr == 16'h235 ? 16'h02db :  // <0014> ([label set_plan_run_cmd])
// "   plln"
addr == 16'h236 ? 16'h2020 :  // <0015>   
addr == 16'h237 ? 16'h7020 :  // <0015> p 
addr == 16'h238 ? 16'h6c6c :  // <0015> ll
addr == 16'h239 ? 16'h006e :  // <0015>  n
addr == 16'h23a ? 16'h02e6 :  // <0016> ([label set_plan_learn_cmd])
// "clstmap"
addr == 16'h23b ? 16'h6c63 :  // <0017> lc
addr == 16'h23c ? 16'h7473 :  // <0017> ts
addr == 16'h23d ? 16'h616d :  // <0017> am
addr == 16'h23e ? 16'h0070 :  // <0017>  p
addr == 16'h23f ? 16'h04f9 :  // <0018> ([label clear_smap_cmd])
// "\x0\x0"
addr == 16'h240 ? 16'h0000 :  // <0019>   


// ########  // = 0x0241
addr == 16'h241 ? 16'h3002 :  // <0037> push i // 
addr == 16'h242 ? 16'h3004 :  // <0037> push x // "
addr == 16'h243 ? 16'h3005 :  // <0037> push y // "

// memorize into ram_key_buf, pushing down existing content.
addr == 16'h244 ? 16'h1008 :  // <0039> x = key
addr == 16'h245 ? 16'h0a07 :  // <0048> i = $key_buf_max
// :loop_581 // = 0x0246

addr == 16'h246 ? 16'h0002 :  // <0049> a = i

addr == 16'h247 ? 16'h0351 :  // <0050> a = a<<1
addr == 16'h248 ? 16'h0600 :  // <0050> b = 0
addr == 16'h249 ? 16'h5e00 :  // <0050> av_ad_hi = 0
addr == 16'h24a ? 16'h6300 :  // <0050> av_ad_lo = ad0
addr == 16'h24b ? 16'h0415 :  // <0050> b = av_write_data
addr == 16'h24c ? 16'h0416 :  // <0050> b = av_read_data

addr == 16'h24d ? 16'h1401 :  // <0051> y = b
addr == 16'h24e ? 16'h0002 :  // <0052> a = i
addr == 16'h24f ? 16'h0404 :  // <0053> b = x

addr == 16'h250 ? 16'h0351 :  // <0054> a = a<<1
addr == 16'h251 ? 16'h3001 :  // <0054> push b // push b
addr == 16'h252 ? 16'h0600 :  // <0054> b = 0
addr == 16'h253 ? 16'h5e00 :  // <0054> av_ad_hi = 0
addr == 16'h254 ? 16'h6300 :  // <0054> av_ad_lo = ad0
addr == 16'h255 ? 16'h540c :  // <0054> pop av_write_data // pop av_write_data

addr == 16'h256 ? 16'h1005 :  // <0055> x = y


addr == 16'h257 ? 16'h0002 :  // <0057> a = i
addr == 16'h258 ? 16'h0600 :  // <0057> b = 0
addr == 16'h259 ? 16'he007 :  // <0057> br eq :end_581
addr == 16'h25a ? 16'h0263 :  // <0057> "


addr == 16'h25b ? 16'h0002 :  // <0057> a = i
addr == 16'h25c ? 16'h0760 :  // <0057> b = -1
addr == 16'h25d ? 16'hc800 :  // <0057> i = a+b
addr == 16'h25e ? 16'h0b00 :  // <0057> "


addr == 16'h25f ? 16'h0002 :  // <0057> a = i
addr == 16'h260 ? 16'h0600 :  // <0057> b = 0
addr == 16'h261 ? 16'he405 :  // <0057> bn lt :loop_581
addr == 16'h262 ? 16'h0246 :  // <0057> "

// :end_581 // = 0x0263

addr == 16'h263 ? 16'h0008 :  // <0060> a = key
addr == 16'h264 ? 16'h060d :  // <0060> b = 13

addr == 16'h265 ? 16'he407 :  // <0060> bn eq :else_613
addr == 16'h266 ? 16'h026a :  // <0060> "

addr == 16'h267 ? 16'hfba0 :  // <0062> callx  parse_command
addr == 16'h268 ? 16'h0270 :  // <0062> "
addr == 16'h269 ? 16'hfc00 :  // <0062> "


addr == 16'h26a ? 16'h140c :  // <0066> pop y // 
addr == 16'h26b ? 16'h100c :  // <0066> pop x // "
addr == 16'h26c ? 16'h080c :  // <0066> pop i // "
addr == 16'h26d ? 16'hfc00 :  // <0066> swapra = nop

// :cmd_ack_msg // = 0x026e
// "OK\x0"
addr == 16'h26e ? 16'h4b4f :  // <0070> KO
addr == 16'h26f ? 16'h0000 :  // <0070>   

// ########  // = 0x0270
addr == 16'h270 ? 16'h3002 :  // <0111> push i // 
addr == 16'h271 ? 16'h3004 :  // <0111> push x // "
addr == 16'h272 ? 16'h3005 :  // <0111> push y // "
addr == 16'h273 ? 16'h303e :  // <0111> push rtna // "

addr == 16'h274 ? 16'h13a0 :  // <0112> x = :cmd_table
addr == 16'h275 ? 16'h021d :  // <0112> "
// :next_cmd // = 0x0276
addr == 16'h276 ? 16'hd004 :  // <0114> fetch a from x
addr == 16'h277 ? 16'h03b0 :  // <0114> "
addr == 16'h278 ? 16'he000 :  // <0115> br az :done
addr == 16'h279 ? 16'h02b1 :  // <0115> "

addr == 16'h27a ? 16'h0a00 :  // <0131> i = 0
// :loop_634 // = 0x027b

addr == 16'h27b ? 16'h0002 :  // <0132> a = i
addr == 16'h27c ? 16'hfba0 :  // <0133> call :fetch_byte
addr == 16'h27d ? 16'h01dc :  // <0133> "
addr == 16'h27e ? 16'hfc00 :  // <0133> "
addr == 16'h27f ? 16'h1400 :  // <0134> y = a
addr == 16'h280 ? 16'h0620 :  // <0135> b = 32 // asc b = " "

addr == 16'h281 ? 16'h0000 :  // <0144> a = a
addr == 16'h282 ? 16'h0401 :  // <0144> b = b

addr == 16'h283 ? 16'he007 :  // <0144> br eq :else_643
addr == 16'h284 ? 16'h0292 :  // <0144> "

addr == 16'h285 ? 16'h062a :  // <0146> b = 42 // asc b = "*"
addr == 16'h286 ? 16'he007 :  // <0147> br eq :matched
addr == 16'h287 ? 16'h029a :  // <0147> "
// parameter character.  succeed early.
addr == 16'h288 ? 16'h0002 :  // <0149> a = i

addr == 16'h289 ? 16'h0351 :  // <0150> a = a<<1
addr == 16'h28a ? 16'h0600 :  // <0150> b = 0
addr == 16'h28b ? 16'h5e00 :  // <0150> av_ad_hi = 0
addr == 16'h28c ? 16'h6300 :  // <0150> av_ad_lo = ad0
addr == 16'h28d ? 16'h0415 :  // <0150> b = av_write_data
addr == 16'h28e ? 16'h0416 :  // <0150> b = av_read_data

addr == 16'h28f ? 16'h0005 :  // <0151> a = y
addr == 16'h290 ? 16'he407 :  // <0152> bn eq :no_match
addr == 16'h291 ? 16'h02a6 :  // <0152> "



addr == 16'h292 ? 16'h0002 :  // <0156> a = i
addr == 16'h293 ? 16'h0601 :  // <0156> b = 1
addr == 16'h294 ? 16'hc800 :  // <0156> i = a+b
addr == 16'h295 ? 16'h0b00 :  // <0156> "


addr == 16'h296 ? 16'h0002 :  // <0156> a = i
addr == 16'h297 ? 16'h0607 :  // <0156> b = $key_buf_max
addr == 16'h298 ? 16'he005 :  // <0156> br lt :loop_634
addr == 16'h299 ? 16'h027b :  // <0156> "

// :end_634 // = 0x029a

// at this point we have a match on the record beginning at x.
// :matched // = 0x029a
addr == 16'h29a ? 16'h23a0 :  // <0160> pa = :cmd_ack_msg
addr == 16'h29b ? 16'h026e :  // <0160> "
addr == 16'h29c ? 16'hfba0 :  // <0160> callx  set_text_flag  :cmd_ack_msg
addr == 16'h29d ? 16'h07f9 :  // <0160> "
addr == 16'h29e ? 16'hfc00 :  // <0160> "
addr == 16'h29f ? 16'h1604 :  // <0161> y = ($key_buf_len / 2)
addr == 16'h2a0 ? 16'hc800 :  // <0162> fetch rtna from x+y
addr == 16'h2a1 ? 16'hd320 :  // <0162> "
addr == 16'h2a2 ? 16'hfbb0 :  // <0162> "
addr == 16'h2a3 ? 16'hfc00 :  // <0163> swapra = nop
addr == 16'h2a4 ? 16'he00f :  // <0165> jmp :done
addr == 16'h2a5 ? 16'h02b1 :  // <0165> "

// :no_match // = 0x02a6
// if ram_terminal_connected is still 0, quit searching after the very first command in the table.
addr == 16'h2a6 ? 16'h5e00 :  // <0169> ram a = $ram_terminal_connected // av_ad_hi = 0
addr == 16'h2a7 ? 16'h6296 :  // <0169> ram a = $ram_terminal_connected // av_ad_lo = 150
addr == 16'h2a8 ? 16'h0015 :  // <0169> ram a = $ram_terminal_connected // a = av_write_data // start read cycle
addr == 16'h2a9 ? 16'h0016 :  // <0169> ram a = $ram_terminal_connected // a = av_read_data // finish read cycle
addr == 16'h2aa ? 16'he000 :  // <0170> br az :done
addr == 16'h2ab ? 16'h02b1 :  // <0170> "

addr == 16'h2ac ? 16'h1605 :  // <0172> y = (($key_buf_len / 2) + 1)
addr == 16'h2ad ? 16'hc800 :  // <0173> x = x+y
addr == 16'h2ae ? 16'h1320 :  // <0173> "
addr == 16'h2af ? 16'he00f :  // <0174> jmp :next_cmd
addr == 16'h2b0 ? 16'h0276 :  // <0174> "
// :done // = 0x02b1

addr == 16'h2b1 ? 16'hf80c :  // <0177> pop rtna // 
addr == 16'h2b2 ? 16'h140c :  // <0177> pop y // "
addr == 16'h2b3 ? 16'h100c :  // <0177> pop x // "
addr == 16'h2b4 ? 16'h080c :  // <0177> pop i // "
addr == 16'h2b5 ? 16'hfc00 :  // <0177> swapra = nop

// ########  // = 0x02b6

addr == 16'h2b6 ? 16'h5e00 :  // <0183> ram $ram_terminal_connected = 1 // av_ad_hi = 0
addr == 16'h2b7 ? 16'h6296 :  // <0183> ram $ram_terminal_connected = 1 // av_ad_lo = 150
addr == 16'h2b8 ? 16'h5601 :  // <0183> ram $ram_terminal_connected = 1 // av_write_data = 1

addr == 16'h2b9 ? 16'hfc00 :  // <0185> swapra = nop

// ########  // = 0x02ba
addr == 16'h2ba ? 16'h303e :  // <0192> push rtna // 

addr == 16'h2bb ? 16'h5e00 :  // <0193> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h2bc ? 16'h6290 :  // <0193> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h2bd ? 16'hf815 :  // <0193> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h2be ? 16'hf816 :  // <0193> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h2bf ? 16'hfc00 :  // <0194> swapra = nop
addr == 16'h2c0 ? 16'hfba0 :  // <0196> callx  init_plan_stop
addr == 16'h2c1 ? 16'h02f3 :  // <0196> "
addr == 16'h2c2 ? 16'hfc00 :  // <0196> "

addr == 16'h2c3 ? 16'hf80c :  // <0198> pop rtna // 
addr == 16'h2c4 ? 16'hfc00 :  // <0198> swapra = nop

// ########  // = 0x02c5
addr == 16'h2c5 ? 16'h303e :  // <0205> push rtna // 

addr == 16'h2c6 ? 16'h5e00 :  // <0206> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h2c7 ? 16'h6290 :  // <0206> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h2c8 ? 16'hf815 :  // <0206> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h2c9 ? 16'hf816 :  // <0206> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h2ca ? 16'hfc00 :  // <0207> swapra = nop
addr == 16'h2cb ? 16'hfba0 :  // <0209> callx  init_plan_crank
addr == 16'h2cc ? 16'h032e :  // <0209> "
addr == 16'h2cd ? 16'hfc00 :  // <0209> "

addr == 16'h2ce ? 16'hf80c :  // <0211> pop rtna // 
addr == 16'h2cf ? 16'hfc00 :  // <0211> swapra = nop

// ########  // = 0x02d0
addr == 16'h2d0 ? 16'h303e :  // <0218> push rtna // 

addr == 16'h2d1 ? 16'h5e00 :  // <0219> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h2d2 ? 16'h6290 :  // <0219> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h2d3 ? 16'hf815 :  // <0219> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h2d4 ? 16'hf816 :  // <0219> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h2d5 ? 16'hfc00 :  // <0220> swapra = nop
addr == 16'h2d6 ? 16'hfba0 :  // <0222> callx  init_plan_warmup
addr == 16'h2d7 ? 16'h0390 :  // <0222> "
addr == 16'h2d8 ? 16'hfc00 :  // <0222> "

addr == 16'h2d9 ? 16'hf80c :  // <0224> pop rtna // 
addr == 16'h2da ? 16'hfc00 :  // <0224> swapra = nop

// ########  // = 0x02db
addr == 16'h2db ? 16'h303e :  // <0231> push rtna // 

addr == 16'h2dc ? 16'h5e00 :  // <0232> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h2dd ? 16'h6290 :  // <0232> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h2de ? 16'hf815 :  // <0232> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h2df ? 16'hf816 :  // <0232> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h2e0 ? 16'hfc00 :  // <0233> swapra = nop
addr == 16'h2e1 ? 16'hfba0 :  // <0235> callx  init_plan_run
addr == 16'h2e2 ? 16'h0413 :  // <0235> "
addr == 16'h2e3 ? 16'hfc00 :  // <0235> "

addr == 16'h2e4 ? 16'hf80c :  // <0237> pop rtna // 
addr == 16'h2e5 ? 16'hfc00 :  // <0237> swapra = nop

// ########  // = 0x02e6
addr == 16'h2e6 ? 16'h303e :  // <0244> push rtna // 

addr == 16'h2e7 ? 16'h5e00 :  // <0245> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h2e8 ? 16'h6290 :  // <0245> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h2e9 ? 16'hf815 :  // <0245> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h2ea ? 16'hf816 :  // <0245> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h2eb ? 16'hfc00 :  // <0246> swapra = nop
addr == 16'h2ec ? 16'hfba0 :  // <0248> callx  init_plan_learn_stoich
addr == 16'h2ed ? 16'h041a :  // <0248> "
addr == 16'h2ee ? 16'hfc00 :  // <0248> "

addr == 16'h2ef ? 16'hf80c :  // <0250> pop rtna // 
addr == 16'h2f0 ? 16'hfc00 :  // <0250> swapra = nop


// :plan_name_stop // = 0x02f1
// "STP\x0"
addr == 16'h2f1 ? 16'h5453 :  // <0002> TS
addr == 16'h2f2 ? 16'h0050 :  // <0002>  P

// ########  // = 0x02f3

// set up the stop plan.
addr == 16'h2f3 ? 16'hfba0 :  // <0025> callx  clear_ign_history
addr == 16'h2f4 ? 16'h05c3 :  // <0025> "
addr == 16'h2f5 ? 16'hfc00 :  // <0025> "
// set noise filter to measure RPM between 50 and 1160 to indicate cranking.
addr == 16'h2f6 ? 16'h5e00 :  // <0027> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_hi = 0
addr == 16'h2f7 ? 16'h6284 :  // <0027> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_lo = 132
addr == 16'h2f8 ? 16'h57a0 :  // <0027> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_write_data = 603
addr == 16'h2f9 ? 16'h025b :  // <0027> "
addr == 16'h2fa ? 16'h5e00 :  // <0028> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h2fb ? 16'h6286 :  // <0028> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 134
addr == 16'h2fc ? 16'h57a0 :  // <0028> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h2fd ? 16'h36b0 :  // <0028> "
addr == 16'h2fe ? 16'h83a0 :  // <0029> ign_timeout_len_jf = ([rpm_to_jf 50])
addr == 16'h2ff ? 16'h36b0 :  // <0029> "
// normally puff length is not touched by an init func.
// this one does it because it's part of the program boot,
// and also a good idea whenever stopping the engine.
// this might interrupt a puff in mid-pulse, but no matter in this case.
addr == 16'h300 ? 16'h5e00 :  // <0034> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h301 ? 16'h6292 :  // <0034> ram $ram_next_puff_len_us = 0 // av_ad_lo = 146
addr == 16'h302 ? 16'h5600 :  // <0034> ram $ram_next_puff_len_us = 0 // av_write_data = 0
addr == 16'h303 ? 16'h8600 :  // <0035> puff_len_us = 0

// memorize state.
addr == 16'h304 ? 16'h5e00 :  // <0038> ram $ram_plan_name = :plan_name_stop // av_ad_hi = 0
addr == 16'h305 ? 16'h628a :  // <0038> ram $ram_plan_name = :plan_name_stop // av_ad_lo = 138
addr == 16'h306 ? 16'h57a0 :  // <0038> ram $ram_plan_name = :plan_name_stop // av_write_data = :plan_name_stop
addr == 16'h307 ? 16'h02f1 :  // <0038> "
addr == 16'h308 ? 16'h5e00 :  // <0039> ram $ram_puff_len_func = :puff_len_stop // av_ad_hi = 0
addr == 16'h309 ? 16'h628c :  // <0039> ram $ram_puff_len_func = :puff_len_stop // av_ad_lo = 140
addr == 16'h30a ? 16'h57a0 :  // <0039> ram $ram_puff_len_func = :puff_len_stop // av_write_data = :puff_len_stop
addr == 16'h30b ? 16'h0316 :  // <0039> "
addr == 16'h30c ? 16'h5e00 :  // <0040> ram $ram_transition_func = :leave_stop // av_ad_hi = 0
addr == 16'h30d ? 16'h628e :  // <0040> ram $ram_transition_func = :leave_stop // av_ad_lo = 142
addr == 16'h30e ? 16'h57a0 :  // <0040> ram $ram_transition_func = :leave_stop // av_write_data = :leave_stop
addr == 16'h30f ? 16'h031a :  // <0040> "
addr == 16'h310 ? 16'h5e00 :  // <0041> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_hi = 0
addr == 16'h311 ? 16'h6290 :  // <0041> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_lo = 144
addr == 16'h312 ? 16'h57a0 :  // <0041> ram $ram_destroy_plan_func = :destroy_plan_stop // av_write_data = :destroy_plan_stop
addr == 16'h313 ? 16'h0315 :  // <0041> "

addr == 16'h314 ? 16'hfc00 :  // <0043> swapra = nop

// ########  // = 0x0315


addr == 16'h315 ? 16'hfc00 :  // <0049> swapra = nop

// ########  // = 0x0316

addr == 16'h316 ? 16'h5e00 :  // <0055> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h317 ? 16'h6292 :  // <0055> ram $ram_next_puff_len_us = 0 // av_ad_lo = 146
addr == 16'h318 ? 16'h5600 :  // <0055> ram $ram_next_puff_len_us = 0 // av_write_data = 0

addr == 16'h319 ? 16'hfc00 :  // <0057> swapra = nop

// ########  // = 0x031a

// leave stop plan if ignition switch is turned on AND more than half if the ignition history is valid.
// requiring both conditions prevents spurious noise readings from starting up the injection.
addr == 16'h31a ? 16'h001e :  // <0075> a = power_duty
addr == 16'h31b ? 16'h0680 :  // <0076> b = $ign_switch_off_mask
addr == 16'h31c ? 16'he403 :  // <0077> bn and0z :stay
addr == 16'h31d ? 16'h032b :  // <0077> "
addr == 16'h31e ? 16'h5e00 :  // <0078> ram a = $ram_ign_bad_samples // av_ad_hi = 0
addr == 16'h31f ? 16'h6282 :  // <0078> ram a = $ram_ign_bad_samples // av_ad_lo = 130
addr == 16'h320 ? 16'h0015 :  // <0078> ram a = $ram_ign_bad_samples // a = av_write_data // start read cycle
addr == 16'h321 ? 16'h0016 :  // <0078> ram a = $ram_ign_bad_samples // a = av_read_data // finish read cycle
addr == 16'h322 ? 16'h0608 :  // <0079> b = ($ign_history_len / 2)
addr == 16'h323 ? 16'he006 :  // <0080> br gt :stay
addr == 16'h324 ? 16'h032b :  // <0080> "
addr == 16'h325 ? 16'hfba0 :  // <0081> callx  destroy_plan_stop
addr == 16'h326 ? 16'h0315 :  // <0081> "
addr == 16'h327 ? 16'hfc00 :  // <0081> "
addr == 16'h328 ? 16'hfba0 :  // <0082> callx  init_plan_crank
addr == 16'h329 ? 16'h032e :  // <0082> "
addr == 16'h32a ? 16'hfc00 :  // <0082> "
// :stay // = 0x032b

addr == 16'h32b ? 16'hfc00 :  // <0085> swapra = nop



// escalating puff length by 1500 us per puff while cranking slowly at e.g. 80 RPM
// on a frozen winter morning will ramp up from 5000 to 20000 us length in about 7 seconds.

// :plan_name_crank // = 0x032c
// "CR\x0"
addr == 16'h32c ? 16'h5243 :  // <0011> RC
addr == 16'h32d ? 16'h0000 :  // <0011>   

// ########  // = 0x032e

// set up the crank plan.
addr == 16'h32e ? 16'h5e00 :  // <0035> ram $ram_puff_count = 0 // av_ad_hi = 0
addr == 16'h32f ? 16'h6294 :  // <0035> ram $ram_puff_count = 0 // av_ad_lo = 148
addr == 16'h330 ? 16'h5600 :  // <0035> ram $ram_puff_count = 0 // av_write_data = 0
// set noise filter to measure RPM between 50 and 8000 to indicate running.
addr == 16'h331 ? 16'h5e00 :  // <0037> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_ad_hi = 0
addr == 16'h332 ? 16'h6284 :  // <0037> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_ad_lo = 132
addr == 16'h333 ? 16'h5657 :  // <0037> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_write_data = 87
addr == 16'h334 ? 16'h5e00 :  // <0038> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h335 ? 16'h6286 :  // <0038> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 134
addr == 16'h336 ? 16'h57a0 :  // <0038> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h337 ? 16'h36b0 :  // <0038> "
addr == 16'h338 ? 16'h83a0 :  // <0039> ign_timeout_len_jf = ([rpm_to_jf 50])
addr == 16'h339 ? 16'h36b0 :  // <0039> "
// normally puff length is not touched by an init func.
// this one does it because it's the beginning of a crank cycle, and puff length
// should be enabled for the first puff.  otherwise the first puff would be missed.
addr == 16'h33a ? 16'h5e00 :  // <0043> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_hi = 0
addr == 16'h33b ? 16'h6292 :  // <0043> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_lo = 146
addr == 16'h33c ? 16'h57a0 :  // <0043> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_write_data = 5000
addr == 16'h33d ? 16'h1388 :  // <0043> "
addr == 16'h33e ? 16'h87a0 :  // <0044> puff_len_us = $crank_min_puff_len_us
addr == 16'h33f ? 16'h1388 :  // <0044> "
// clear ignition history again to eliminate samples where the motor kept spinning after switching from plan_run to plan_stop.
addr == 16'h340 ? 16'hfba0 :  // <0046> callx  clear_ign_history
addr == 16'h341 ? 16'h05c3 :  // <0046> "
addr == 16'h342 ? 16'hfc00 :  // <0046> "

// memorize state.
addr == 16'h343 ? 16'h5e00 :  // <0049> ram $ram_plan_name = :plan_name_crank // av_ad_hi = 0
addr == 16'h344 ? 16'h628a :  // <0049> ram $ram_plan_name = :plan_name_crank // av_ad_lo = 138
addr == 16'h345 ? 16'h57a0 :  // <0049> ram $ram_plan_name = :plan_name_crank // av_write_data = :plan_name_crank
addr == 16'h346 ? 16'h032c :  // <0049> "
addr == 16'h347 ? 16'h5e00 :  // <0050> ram $ram_puff_len_func = :puff_len_crank // av_ad_hi = 0
addr == 16'h348 ? 16'h628c :  // <0050> ram $ram_puff_len_func = :puff_len_crank // av_ad_lo = 140
addr == 16'h349 ? 16'h57a0 :  // <0050> ram $ram_puff_len_func = :puff_len_crank // av_write_data = :puff_len_crank
addr == 16'h34a ? 16'h0355 :  // <0050> "
addr == 16'h34b ? 16'h5e00 :  // <0051> ram $ram_transition_func = :leave_crank // av_ad_hi = 0
addr == 16'h34c ? 16'h628e :  // <0051> ram $ram_transition_func = :leave_crank // av_ad_lo = 142
addr == 16'h34d ? 16'h57a0 :  // <0051> ram $ram_transition_func = :leave_crank // av_write_data = :leave_crank
addr == 16'h34e ? 16'h0373 :  // <0051> "
addr == 16'h34f ? 16'h5e00 :  // <0052> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_hi = 0
addr == 16'h350 ? 16'h6290 :  // <0052> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_lo = 144
addr == 16'h351 ? 16'h57a0 :  // <0052> ram $ram_destroy_plan_func = :destroy_plan_crank // av_write_data = :destroy_plan_crank
addr == 16'h352 ? 16'h0354 :  // <0052> "

addr == 16'h353 ? 16'hfc00 :  // <0054> swapra = nop

// ########  // = 0x0354


addr == 16'h354 ? 16'hfc00 :  // <0060> swapra = nop

// ########  // = 0x0355
addr == 16'h355 ? 16'h303e :  // <0079> push rtna // 

addr == 16'h356 ? 16'h5e00 :  // <0080> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h357 ? 16'h6294 :  // <0080> ram a = $ram_puff_count // av_ad_lo = 148
addr == 16'h358 ? 16'h0015 :  // <0080> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h359 ? 16'h0016 :  // <0080> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h35a ? 16'h060a :  // <0081> b = $crank_max_puffs
addr == 16'h35b ? 16'he006 :  // <0082> br gt :puff_limit
addr == 16'h35c ? 16'h036a :  // <0082> "
// linear escalation from min to max puff length, at a slope of crank_incr_us_per_puff.
addr == 16'h35d ? 16'h07a0 :  // <0084> b = $crank_incr_us_per_puff
addr == 16'h35e ? 16'h05dc :  // <0084> "
addr == 16'h35f ? 16'hfba0 :  // <0085> call :multiply
addr == 16'h360 ? 16'h0170 :  // <0085> "
addr == 16'h361 ? 16'hfc00 :  // <0085> "
addr == 16'h362 ? 16'h07a0 :  // <0086> b = $crank_min_puff_len_us
addr == 16'h363 ? 16'h1388 :  // <0086> "
addr == 16'h364 ? 16'h5e00 :  // <0087> ram $ram_next_puff_len_us = a+b // av_ad_hi = 0
addr == 16'h365 ? 16'h6292 :  // <0087> ram $ram_next_puff_len_us = a+b // av_ad_lo = 146
addr == 16'h366 ? 16'hc800 :  // <0087> ram $ram_next_puff_len_us = a+b // av_write_data = a+b
addr == 16'h367 ? 16'h5700 :  // <0087> "
addr == 16'h368 ? 16'he00f :  // <0088> jmp :done
addr == 16'h369 ? 16'h0371 :  // <0088> "
// :puff_limit // = 0x036a
// prevent the puff counter from going higher & eventually rolling over.
addr == 16'h36a ? 16'h5e00 :  // <0091> ram $ram_puff_count = $crank_max_puffs // av_ad_hi = 0
addr == 16'h36b ? 16'h6294 :  // <0091> ram $ram_puff_count = $crank_max_puffs // av_ad_lo = 148
addr == 16'h36c ? 16'h560a :  // <0091> ram $ram_puff_count = $crank_max_puffs // av_write_data = 10
// accept max puff len.
addr == 16'h36d ? 16'h5e00 :  // <0093> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_hi = 0
addr == 16'h36e ? 16'h6292 :  // <0093> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_lo = 146
addr == 16'h36f ? 16'h57a0 :  // <0093> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_write_data = 20000
addr == 16'h370 ? 16'h4e20 :  // <0093> "
// :done // = 0x0371

addr == 16'h371 ? 16'hf80c :  // <0096> pop rtna // 
addr == 16'h372 ? 16'hfc00 :  // <0096> swapra = nop

// ########  // = 0x0373

addr == 16'h373 ? 16'hfba0 :  // <0115> callx  check_engine_stop  a
addr == 16'h374 ? 16'h0858 :  // <0115> "
addr == 16'h375 ? 16'hfc00 :  // <0115> "
addr == 16'h376 ? 16'h0008 :  // <0115> a = pa
addr == 16'h377 ? 16'he400 :  // <0116> bn az :done
addr == 16'h378 ? 16'h038d :  // <0116> "

// transition to warmup if RPM exceeds crank_success_rpm.
addr == 16'h379 ? 16'h5e00 :  // <0119> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h37a ? 16'h6280 :  // <0119> ram a = $ram_rpm_valid // av_ad_lo = 128
addr == 16'h37b ? 16'h0015 :  // <0119> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h37c ? 16'h0016 :  // <0119> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle
addr == 16'h37d ? 16'he000 :  // <0120> br az :stay
addr == 16'h37e ? 16'h038d :  // <0120> "
addr == 16'h37f ? 16'h5e00 :  // <0121> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h380 ? 16'h627e :  // <0121> ram a = $ram_avg_rpm // av_ad_lo = 126
addr == 16'h381 ? 16'h0015 :  // <0121> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h382 ? 16'h0016 :  // <0121> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle
addr == 16'h383 ? 16'h07a0 :  // <0122> b = $crank_success_rpm
addr == 16'h384 ? 16'h0320 :  // <0122> "
addr == 16'h385 ? 16'he005 :  // <0123> br lt :stay
addr == 16'h386 ? 16'h038d :  // <0123> "
addr == 16'h387 ? 16'hfba0 :  // <0124> callx  destroy_plan_crank
addr == 16'h388 ? 16'h0354 :  // <0124> "
addr == 16'h389 ? 16'hfc00 :  // <0124> "
addr == 16'h38a ? 16'hfba0 :  // <0125> callx  init_plan_warmup
addr == 16'h38b ? 16'h0390 :  // <0125> "
addr == 16'h38c ? 16'hfc00 :  // <0125> "
// :stay // = 0x038d

// :done // = 0x038d

addr == 16'h38d ? 16'hfc00 :  // <0130> swapra = nop



// 0x4c0 = 1216 = 120 degF at the sensor location outside the engine block.
// 750 = 0 degF.
// max 6000 & min 4500 over a temp range 750 to 0x4c0 gives 6900 us puff at 74 deg F.  program rev 594.
// this is used if the engine temp is unavailable.

// :plan_name_warmup // = 0x038e
// "WM\x0"
addr == 16'h38e ? 16'h4d57 :  // <0016> MW
addr == 16'h38f ? 16'h0000 :  // <0016>   

// ########  // = 0x0390

// set up the warmup plan.
addr == 16'h390 ? 16'h5e00 :  // <0031> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h391 ? 16'h6214 :  // <0031> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h392 ? 16'h0015 :  // <0031> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h393 ? 16'h0016 :  // <0031> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h394 ? 16'h063c :  // <0032> b = $warmup_timeout_sec
addr == 16'h395 ? 16'h5e00 :  // <0033> ram $ram_warmup_timeout_at_pass = a+b // av_ad_hi = 0
addr == 16'h396 ? 16'h6298 :  // <0033> ram $ram_warmup_timeout_at_pass = a+b // av_ad_lo = 152
addr == 16'h397 ? 16'hc800 :  // <0033> ram $ram_warmup_timeout_at_pass = a+b // av_write_data = a+b
addr == 16'h398 ? 16'h5700 :  // <0033> "

// memorize state.
addr == 16'h399 ? 16'h5e00 :  // <0036> ram $ram_plan_name = :plan_name_warmup // av_ad_hi = 0
addr == 16'h39a ? 16'h628a :  // <0036> ram $ram_plan_name = :plan_name_warmup // av_ad_lo = 138
addr == 16'h39b ? 16'h57a0 :  // <0036> ram $ram_plan_name = :plan_name_warmup // av_write_data = :plan_name_warmup
addr == 16'h39c ? 16'h038e :  // <0036> "
addr == 16'h39d ? 16'h5e00 :  // <0037> ram $ram_puff_len_func = :puff_len_warmup // av_ad_hi = 0
addr == 16'h39e ? 16'h628c :  // <0037> ram $ram_puff_len_func = :puff_len_warmup // av_ad_lo = 140
addr == 16'h39f ? 16'h57a0 :  // <0037> ram $ram_puff_len_func = :puff_len_warmup // av_write_data = :puff_len_warmup
addr == 16'h3a0 ? 16'h03ab :  // <0037> "
addr == 16'h3a1 ? 16'h5e00 :  // <0038> ram $ram_transition_func = :leave_warmup // av_ad_hi = 0
addr == 16'h3a2 ? 16'h628e :  // <0038> ram $ram_transition_func = :leave_warmup // av_ad_lo = 142
addr == 16'h3a3 ? 16'h57a0 :  // <0038> ram $ram_transition_func = :leave_warmup // av_write_data = :leave_warmup
addr == 16'h3a4 ? 16'h03dd :  // <0038> "
addr == 16'h3a5 ? 16'h5e00 :  // <0039> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_ad_hi = 0
addr == 16'h3a6 ? 16'h6290 :  // <0039> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_ad_lo = 144
addr == 16'h3a7 ? 16'h57a0 :  // <0039> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_write_data = :destroy_plan_warmup
addr == 16'h3a8 ? 16'h03aa :  // <0039> "

addr == 16'h3a9 ? 16'hfc00 :  // <0041> swapra = nop

// ########  // = 0x03aa


addr == 16'h3aa ? 16'hfc00 :  // <0047> swapra = nop

// ########  // = 0x03ab
addr == 16'h3ab ? 16'h3004 :  // <0086> push x // 
addr == 16'h3ac ? 16'h303e :  // <0086> push rtna // "

// x = enrichment us.
addr == 16'h3ad ? 16'h13a0 :  // <0088> x = $warmup_limping_enrichment_us
addr == 16'h3ae ? 16'h07d0 :  // <0088> "

// check engine block temp sensor.  if valid, enrich by a linear function:
// {warmup_min_temp_adc...warmup_success_temp_adc} -> {$warmup_max_enrichment_us...0}
addr == 16'h3af ? 16'h0202 :  // <0092> a = $anmux_engine_block_temp

addr == 16'h3b0 ? 16'h0351 :  // <0093> a = a<<1
addr == 16'h3b1 ? 16'h0618 :  // <0093> b = 24
addr == 16'h3b2 ? 16'h5e00 :  // <0093> av_ad_hi = 0
addr == 16'h3b3 ? 16'h6300 :  // <0093> av_ad_lo = ad0
addr == 16'h3b4 ? 16'h0415 :  // <0093> b = av_write_data
addr == 16'h3b5 ? 16'h0416 :  // <0093> b = av_read_data

// b = sensor reading in adc counts.
addr == 16'h3b6 ? 16'h03a0 :  // <0095> a = $temp_ceiling_adc
addr == 16'h3b7 ? 16'h0ff0 :  // <0095> "
addr == 16'h3b8 ? 16'he005 :  // <0096> br lt :temp_invalid
addr == 16'h3b9 ? 16'h03d3 :  // <0096> "
addr == 16'h3ba ? 16'h03a0 :  // <0097> a = $warmup_success_temp_adc
addr == 16'h3bb ? 16'h04c0 :  // <0097> "
addr == 16'h3bc ? 16'he005 :  // <0098> br lt :too_warm
addr == 16'h3bd ? 16'h03d3 :  // <0098> "
addr == 16'h3be ? 16'h03a0 :  // <0099> a = $warmup_min_temp_adc
addr == 16'h3bf ? 16'h02ee :  // <0099> "
addr == 16'h3c0 ? 16'he005 :  // <0100> br lt :in_range
addr == 16'h3c1 ? 16'h03c4 :  // <0100> "
addr == 16'h3c2 ? 16'h07a0 :  // <0101> b = $warmup_min_temp_adc
addr == 16'h3c3 ? 16'h02ee :  // <0101> "
// :in_range // = 0x03c4
// negate the sensor reading so as to subtract it from warmup_success_temp_adc.
addr == 16'h3c4 ? 16'h0360 :  // <0104> a = 0xffff
addr == 16'h3c5 ? 16'hc800 :  // <0105> b = xor
addr == 16'h3c6 ? 16'h0738 :  // <0105> "
addr == 16'h3c7 ? 16'h0201 :  // <0106> a = 1
addr == 16'h3c8 ? 16'hc800 :  // <0107> b = a+b
addr == 16'h3c9 ? 16'h0700 :  // <0107> "
addr == 16'h3ca ? 16'h03a0 :  // <0108> a = $warmup_success_temp_adc
addr == 16'h3cb ? 16'h04c0 :  // <0108> "
addr == 16'h3cc ? 16'hc800 :  // <0109> b = a+b
addr == 16'h3cd ? 16'h0700 :  // <0109> "
// b = how many counts "cold" we are.  multiply that by the slope warmup_us_per_cold_adc.
addr == 16'h3ce ? 16'h020c :  // <0111> a = $warmup_us_per_cold_adc
addr == 16'h3cf ? 16'hfba0 :  // <0112> call :multiply
addr == 16'h3d0 ? 16'h0170 :  // <0112> "
addr == 16'h3d1 ? 16'hfc00 :  // <0112> "
addr == 16'h3d2 ? 16'h1000 :  // <0113> x = a
// :too_warm // = 0x03d3
// :temp_invalid // = 0x03d3

// apply total of base amount and enrichment.
// $warmup_min_puff_len_us <= total <= ($warmup_min_puff_len_us + $warmup_max_enrichment_us)
addr == 16'h3d3 ? 16'h03a0 :  // <0119> a = $warmup_min_puff_len_us
addr == 16'h3d4 ? 16'h09c4 :  // <0119> "
addr == 16'h3d5 ? 16'h0404 :  // <0120> b = x
addr == 16'h3d6 ? 16'h5e00 :  // <0121> ram $ram_next_puff_len_us = a+b // av_ad_hi = 0
addr == 16'h3d7 ? 16'h6292 :  // <0121> ram $ram_next_puff_len_us = a+b // av_ad_lo = 146
addr == 16'h3d8 ? 16'hc800 :  // <0121> ram $ram_next_puff_len_us = a+b // av_write_data = a+b
addr == 16'h3d9 ? 16'h5700 :  // <0121> "

addr == 16'h3da ? 16'hf80c :  // <0123> pop rtna // 
addr == 16'h3db ? 16'h100c :  // <0123> pop x // "
addr == 16'h3dc ? 16'hfc00 :  // <0123> swapra = nop

// ########  // = 0x03dd

addr == 16'h3dd ? 16'hfba0 :  // <0154> callx  check_engine_stop  a
addr == 16'h3de ? 16'h0858 :  // <0154> "
addr == 16'h3df ? 16'hfc00 :  // <0154> "
addr == 16'h3e0 ? 16'h0008 :  // <0154> a = pa
addr == 16'h3e1 ? 16'he400 :  // <0155> bn az :done
addr == 16'h3e2 ? 16'h0410 :  // <0155> "

// transition to plan_run if warmup has expired.
addr == 16'h3e3 ? 16'h5e00 :  // <0158> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h3e4 ? 16'h6214 :  // <0158> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h3e5 ? 16'h0015 :  // <0158> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h3e6 ? 16'h0016 :  // <0158> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h3e7 ? 16'h5e00 :  // <0159> ram b = $ram_warmup_timeout_at_pass // av_ad_hi = 0
addr == 16'h3e8 ? 16'h6298 :  // <0159> ram b = $ram_warmup_timeout_at_pass // av_ad_lo = 152
addr == 16'h3e9 ? 16'h0415 :  // <0159> ram b = $ram_warmup_timeout_at_pass // b = av_write_data // start read cycle
addr == 16'h3ea ? 16'h0416 :  // <0159> ram b = $ram_warmup_timeout_at_pass // b = av_read_data // finish read cycle

addr == 16'h3eb ? 16'h0000 :  // <0164> a = a
addr == 16'h3ec ? 16'h0401 :  // <0164> b = b

addr == 16'h3ed ? 16'he406 :  // <0164> bn gt :else_1005
addr == 16'h3ee ? 16'h03f7 :  // <0164> "

addr == 16'h3ef ? 16'hfba0 :  // <0166> callx  destroy_plan_warmup
addr == 16'h3f0 ? 16'h03aa :  // <0166> "
addr == 16'h3f1 ? 16'hfc00 :  // <0166> "
addr == 16'h3f2 ? 16'hfba0 :  // <0167> callx  init_plan_run
addr == 16'h3f3 ? 16'h0413 :  // <0167> "
addr == 16'h3f4 ? 16'hfc00 :  // <0167> "
addr == 16'h3f5 ? 16'he00f :  // <0168> jmp :done
addr == 16'h3f6 ? 16'h0410 :  // <0168> "


// transition to plan_run if engine block temp sensor is valid, and temp
// exceeds warmup_success_temp_adc.
addr == 16'h3f7 ? 16'h0202 :  // <0174> a = $anmux_engine_block_temp

addr == 16'h3f8 ? 16'h0351 :  // <0175> a = a<<1
addr == 16'h3f9 ? 16'h0618 :  // <0175> b = 24
addr == 16'h3fa ? 16'h5e00 :  // <0175> av_ad_hi = 0
addr == 16'h3fb ? 16'h6300 :  // <0175> av_ad_lo = ad0
addr == 16'h3fc ? 16'h0415 :  // <0175> b = av_write_data
addr == 16'h3fd ? 16'h0416 :  // <0175> b = av_read_data

addr == 16'h3fe ? 16'h03a0 :  // <0176> a = $temp_ceiling_adc
addr == 16'h3ff ? 16'h0ff0 :  // <0176> "

addr == 16'h400 ? 16'h0000 :  // <0183> a = a
addr == 16'h401 ? 16'h0401 :  // <0183> b = b

addr == 16'h402 ? 16'he406 :  // <0183> bn gt :else_1026
addr == 16'h403 ? 16'h0410 :  // <0183> "

addr == 16'h404 ? 16'h03a0 :  // <0185> a = $warmup_success_temp_adc
addr == 16'h405 ? 16'h04c0 :  // <0185> "

addr == 16'h406 ? 16'h0000 :  // <0189> a = a
addr == 16'h407 ? 16'h0401 :  // <0189> b = b

addr == 16'h408 ? 16'he405 :  // <0189> bn lt :else_1032
addr == 16'h409 ? 16'h0410 :  // <0189> "

addr == 16'h40a ? 16'hfba0 :  // <0191> callx  destroy_plan_warmup
addr == 16'h40b ? 16'h03aa :  // <0191> "
addr == 16'h40c ? 16'hfc00 :  // <0191> "
addr == 16'h40d ? 16'hfba0 :  // <0192> callx  init_plan_run
addr == 16'h40e ? 16'h0413 :  // <0192> "
addr == 16'h40f ? 16'hfc00 :  // <0192> "



// :done // = 0x0410

addr == 16'h410 ? 16'hfc00 :  // <0200> swapra = nop


// :plan_name_run // = 0x0411
// "RN\x0"
addr == 16'h411 ? 16'h4e52 :  // <0002> NR
addr == 16'h412 ? 16'h0000 :  // <0002>   

// trim puff length by o2 sensor every 200 ms.

// trim puff length as needed, by about 1000 us per second.



// ########  // = 0x0413

// set up the run plan.

// memorize state.
addr == 16'h413 ? 16'h5e00 :  // <0029> ram $ram_plan_name = :plan_name_run // av_ad_hi = 0
addr == 16'h414 ? 16'h628a :  // <0029> ram $ram_plan_name = :plan_name_run // av_ad_lo = 138
addr == 16'h415 ? 16'h57a0 :  // <0029> ram $ram_plan_name = :plan_name_run // av_write_data = :plan_name_run
addr == 16'h416 ? 16'h0411 :  // <0029> "
addr == 16'h417 ? 16'h5e00 :  // <0030> ram $ram_puff_len_func = :puff_len_run // av_ad_hi = 0
addr == 16'h418 ? 16'h628c :  // <0030> ram $ram_puff_len_func = :puff_len_run // av_ad_lo = 140
addr == 16'h419 ? 16'h57a0 :  // <0030> ram $ram_puff_len_func = :puff_len_run // av_write_data = :puff_len_run
addr == 16'h41a ? 16'h0425 :  // <0030> "
addr == 16'h41b ? 16'h5e00 :  // <0031> ram $ram_transition_func = :leave_run // av_ad_hi = 0
addr == 16'h41c ? 16'h628e :  // <0031> ram $ram_transition_func = :leave_run // av_ad_lo = 142
addr == 16'h41d ? 16'h57a0 :  // <0031> ram $ram_transition_func = :leave_run // av_write_data = :leave_run
addr == 16'h41e ? 16'h0460 :  // <0031> "
addr == 16'h41f ? 16'h5e00 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_hi = 0
addr == 16'h420 ? 16'h6290 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_lo = 144
addr == 16'h421 ? 16'h57a0 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_run // av_write_data = :destroy_plan_run
addr == 16'h422 ? 16'h0424 :  // <0032> "

addr == 16'h423 ? 16'hfc00 :  // <0034> swapra = nop

// ########  // = 0x0424


addr == 16'h424 ? 16'hfc00 :  // <0040> swapra = nop

// ########  // = 0x0425
addr == 16'h425 ? 16'h3002 :  // <0069> push i // 
addr == 16'h426 ? 16'h3003 :  // <0069> push j // "

addr == 16'h427 ? 16'h5e00 :  // <0070> ram i = $ram_run_ticks_remain // av_ad_hi = 0
addr == 16'h428 ? 16'h629a :  // <0070> ram i = $ram_run_ticks_remain // av_ad_lo = 154
addr == 16'h429 ? 16'h0815 :  // <0070> ram i = $ram_run_ticks_remain // i = av_write_data // start read cycle
addr == 16'h42a ? 16'h0816 :  // <0070> ram i = $ram_run_ticks_remain // i = av_read_data // finish read cycle

addr == 16'h42b ? 16'h0002 :  // <0094> a = i
addr == 16'h42c ? 16'h0600 :  // <0094> b = 0

addr == 16'h42d ? 16'he406 :  // <0094> bn gt :else_1069
addr == 16'h42e ? 16'h0436 :  // <0094> "

addr == 16'h42f ? 16'h0f60 :  // <0096> j = -1
addr == 16'h430 ? 16'h5e00 :  // <0097> ram $ram_run_ticks_remain = i+j // av_ad_hi = 0
addr == 16'h431 ? 16'h629a :  // <0097> ram $ram_run_ticks_remain = i+j // av_ad_lo = 154
addr == 16'h432 ? 16'hc800 :  // <0097> ram $ram_run_ticks_remain = i+j // av_write_data = i+j
addr == 16'h433 ? 16'h5710 :  // <0097> "

addr == 16'h434 ? 16'he00f :  // <0099> jmp :end_1069
addr == 16'h435 ? 16'h045d :  // <0099> "

addr == 16'h436 ? 16'h5e00 :  // <0100> ram $ram_run_ticks_remain = $run_ticks_per_o2_trim // av_ad_hi = 0
addr == 16'h437 ? 16'h629a :  // <0100> ram $ram_run_ticks_remain = $run_ticks_per_o2_trim // av_ad_lo = 154
addr == 16'h438 ? 16'h560a :  // <0100> ram $ram_run_ticks_remain = $run_ticks_per_o2_trim // av_write_data = 10

// i = old puff length, j = puff length increment.
addr == 16'h439 ? 16'h5e00 :  // <0103> ram i = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'h43a ? 16'h6292 :  // <0103> ram i = $ram_next_puff_len_us // av_ad_lo = 146
addr == 16'h43b ? 16'h0815 :  // <0103> ram i = $ram_next_puff_len_us // i = av_write_data // start read cycle
addr == 16'h43c ? 16'h0816 :  // <0103> ram i = $ram_next_puff_len_us // i = av_read_data // finish read cycle
addr == 16'h43d ? 16'h0e00 :  // <0104> j = 0
addr == 16'h43e ? 16'h0205 :  // <0105> a = $o2_adc_channel

addr == 16'h43f ? 16'h0351 :  // <0106> a = a<<1
addr == 16'h440 ? 16'h0628 :  // <0106> b = 40
addr == 16'h441 ? 16'h5e00 :  // <0106> av_ad_hi = 0
addr == 16'h442 ? 16'h6300 :  // <0106> av_ad_lo = ad0
addr == 16'h443 ? 16'h0415 :  // <0106> b = av_write_data
addr == 16'h444 ? 16'h0416 :  // <0106> b = av_read_data


addr == 16'h445 ? 16'h0001 :  // <0117> a = b
addr == 16'h446 ? 16'h07a0 :  // <0117> b = 588
addr == 16'h447 ? 16'h024c :  // <0117> "

addr == 16'h448 ? 16'he405 :  // <0117> bn lt :else_1096
addr == 16'h449 ? 16'h0452 :  // <0117> "

// sensing a lean condition.  trim up to enrich.

addr == 16'h44a ? 16'h0002 :  // <0122> a = i
addr == 16'h44b ? 16'h07a0 :  // <0122> b = 10000
addr == 16'h44c ? 16'h2710 :  // <0122> "

addr == 16'h44d ? 16'he405 :  // <0122> bn lt :else_1101
addr == 16'h44e ? 16'h0450 :  // <0122> "

addr == 16'h44f ? 16'h0ec8 :  // <0124> j = $run_puff_step_up_us


addr == 16'h450 ? 16'he00f :  // <0128> jmp :end_1096
addr == 16'h451 ? 16'h0459 :  // <0128> "

// sensing a rich condition.  trim down to lean it out.

addr == 16'h452 ? 16'h0002 :  // <0132> a = i
addr == 16'h453 ? 16'h07a0 :  // <0132> b = 2000
addr == 16'h454 ? 16'h07d0 :  // <0132> "

addr == 16'h455 ? 16'he406 :  // <0132> bn gt :else_1109
addr == 16'h456 ? 16'h0459 :  // <0132> "

addr == 16'h457 ? 16'h0fa0 :  // <0134> j = $run_puff_step_down_us
addr == 16'h458 ? 16'hff9b :  // <0134> "


addr == 16'h459 ? 16'h5e00 :  // <0139> ram $ram_next_puff_len_us = i+j // av_ad_hi = 0
addr == 16'h45a ? 16'h6292 :  // <0139> ram $ram_next_puff_len_us = i+j // av_ad_lo = 146
addr == 16'h45b ? 16'hc800 :  // <0139> ram $ram_next_puff_len_us = i+j // av_write_data = i+j
addr == 16'h45c ? 16'h5710 :  // <0139> "


addr == 16'h45d ? 16'h0c0c :  // <0143> pop j // 
addr == 16'h45e ? 16'h080c :  // <0143> pop i // "
addr == 16'h45f ? 16'hfc00 :  // <0143> swapra = nop

// ########  // = 0x0460

        
                16'hxxxx;
        endmodule
    
