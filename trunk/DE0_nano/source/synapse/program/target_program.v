
        `include "header.v"

        module target_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.

addr == 16'h00 ? 16'he00f :  // <0004> jmp :main
addr == 16'h01 ? 16'h078d :  // <0004> "


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
// all ignition time vars are expressed in 20us "jiffies" or "jf".
// 8750 RPM = about 80 jf between rising edges on chevy ignition white wire.  ignition counter noise blanking begins here in rev 627.
// 5000 RPM = about 140 jf
// 1000 RPM = about 700 jf
//  100 RPM = about 7000 jf
//   22 RPM = about 32000 jf, the slowest figure that's safe for the divide routine.

// fuel injection puff driver.
// SETTING puff_len_us NON-ZERO ENABLES FUEL INJECTION!!  zero disables it.
// MUST SET ign_timeout_len_jf NON-ZERO PRIOR TO ENABLING!
// otherwise the module latches up in a non-working state.

// engine state management.  each engine state is called a "plan".

addr == 16'h02 ? 16'h0026 :  // <0196> emit_debugger_register_table  counter
// "       a"
addr == 16'h03 ? 16'h2020 :  // <0196>   
addr == 16'h04 ? 16'h2020 :  // <0196>   
addr == 16'h05 ? 16'h2020 :  // <0196>   
addr == 16'h06 ? 16'h6120 :  // <0196> a 
// "       b"
addr == 16'h07 ? 16'h2020 :  // <0196>   
addr == 16'h08 ? 16'h2020 :  // <0196>   
addr == 16'h09 ? 16'h2020 :  // <0196>   
addr == 16'h0a ? 16'h6220 :  // <0196> b 
// "       i"
addr == 16'h0b ? 16'h2020 :  // <0196>   
addr == 16'h0c ? 16'h2020 :  // <0196>   
addr == 16'h0d ? 16'h2020 :  // <0196>   
addr == 16'h0e ? 16'h6920 :  // <0196> i 
// "       j"
addr == 16'h0f ? 16'h2020 :  // <0196>   
addr == 16'h10 ? 16'h2020 :  // <0196>   
addr == 16'h11 ? 16'h2020 :  // <0196>   
addr == 16'h12 ? 16'h6a20 :  // <0196> j 
// "       x"
addr == 16'h13 ? 16'h2020 :  // <0196>   
addr == 16'h14 ? 16'h2020 :  // <0196>   
addr == 16'h15 ? 16'h2020 :  // <0196>   
addr == 16'h16 ? 16'h7820 :  // <0196> x 
// "       y"
addr == 16'h17 ? 16'h2020 :  // <0196>   
addr == 16'h18 ? 16'h2020 :  // <0196>   
addr == 16'h19 ? 16'h2020 :  // <0196>   
addr == 16'h1a ? 16'h7920 :  // <0196> y 
// "      ga"
addr == 16'h1b ? 16'h2020 :  // <0196>   
addr == 16'h1c ? 16'h2020 :  // <0196>   
addr == 16'h1d ? 16'h2020 :  // <0196>   
addr == 16'h1e ? 16'h6167 :  // <0196> ag
// "      gb"
addr == 16'h1f ? 16'h2020 :  // <0196>   
addr == 16'h20 ? 16'h2020 :  // <0196>   
addr == 16'h21 ? 16'h2020 :  // <0196>   
addr == 16'h22 ? 16'h6267 :  // <0196> bg
// "      pa"
addr == 16'h23 ? 16'h2020 :  // <0196>   
addr == 16'h24 ? 16'h2020 :  // <0196>   
addr == 16'h25 ? 16'h2020 :  // <0196>   
addr == 16'h26 ? 16'h6170 :  // <0196> ap
// "      pb"
addr == 16'h27 ? 16'h2020 :  // <0196>   
addr == 16'h28 ? 16'h2020 :  // <0196>   
addr == 16'h29 ? 16'h2020 :  // <0196>   
addr == 16'h2a ? 16'h6270 :  // <0196> bp
// "      pc"
addr == 16'h2b ? 16'h2020 :  // <0196>   
addr == 16'h2c ? 16'h2020 :  // <0196>   
addr == 16'h2d ? 16'h2020 :  // <0196>   
addr == 16'h2e ? 16'h6370 :  // <0196> cp
// "      pd"
addr == 16'h2f ? 16'h2020 :  // <0196>   
addr == 16'h30 ? 16'h2020 :  // <0196>   
addr == 16'h31 ? 16'h2020 :  // <0196>   
addr == 16'h32 ? 16'h6470 :  // <0196> dp
// "//rstk  "
addr == 16'h33 ? 16'h2f2f :  // <0196> //
addr == 16'h34 ? 16'h7372 :  // <0196> sr
addr == 16'h35 ? 16'h6b74 :  // <0196> kt
addr == 16'h36 ? 16'h2020 :  // <0196>   
// "  ev_pri"
addr == 16'h37 ? 16'h2020 :  // <0196>   
addr == 16'h38 ? 16'h7665 :  // <0196> ve
addr == 16'h39 ? 16'h705f :  // <0196> p_
addr == 16'h3a ? 16'h6972 :  // <0196> ir
// "softevnt"
addr == 16'h3b ? 16'h6f73 :  // <0196> os
addr == 16'h3c ? 16'h7466 :  // <0196> tf
addr == 16'h3d ? 16'h7665 :  // <0196> ve
addr == 16'h3e ? 16'h746e :  // <0196> tn
// "   usage"
addr == 16'h3f ? 16'h2020 :  // <0196>   
addr == 16'h40 ? 16'h7520 :  // <0196> u 
addr == 16'h41 ? 16'h6173 :  // <0196> as
addr == 16'h42 ? 16'h6567 :  // <0196> eg
// "prductlo"
addr == 16'h43 ? 16'h7270 :  // <0196> rp
addr == 16'h44 ? 16'h7564 :  // <0196> ud
addr == 16'h45 ? 16'h7463 :  // <0196> tc
addr == 16'h46 ? 16'h6f6c :  // <0196> ol
// "prducthi"
addr == 16'h47 ? 16'h7270 :  // <0196> rp
addr == 16'h48 ? 16'h7564 :  // <0196> ud
addr == 16'h49 ? 16'h7463 :  // <0196> tc
addr == 16'h4a ? 16'h6968 :  // <0196> ih
// "ustimer0"
addr == 16'h4b ? 16'h7375 :  // <0196> su
addr == 16'h4c ? 16'h6974 :  // <0196> it
addr == 16'h4d ? 16'h656d :  // <0196> em
addr == 16'h4e ? 16'h3072 :  // <0196> 0r
// "mstimer0"
addr == 16'h4f ? 16'h736d :  // <0196> sm
addr == 16'h50 ? 16'h6974 :  // <0196> it
addr == 16'h51 ? 16'h656d :  // <0196> em
addr == 16'h52 ? 16'h3072 :  // <0196> 0r
// "mstimer1"
addr == 16'h53 ? 16'h736d :  // <0196> sm
addr == 16'h54 ? 16'h6974 :  // <0196> it
addr == 16'h55 ? 16'h656d :  // <0196> em
addr == 16'h56 ? 16'h3172 :  // <0196> 1r
// "mstimer2"
addr == 16'h57 ? 16'h736d :  // <0196> sm
addr == 16'h58 ? 16'h6974 :  // <0196> it
addr == 16'h59 ? 16'h656d :  // <0196> em
addr == 16'h5a ? 16'h3272 :  // <0196> 2r
// "spi_data"
addr == 16'h5b ? 16'h7073 :  // <0196> ps
addr == 16'h5c ? 16'h5f69 :  // <0196> _i
addr == 16'h5d ? 16'h6164 :  // <0196> ad
addr == 16'h5e ? 16'h6174 :  // <0196> at
// "//avwrdt"
addr == 16'h5f ? 16'h2f2f :  // <0196> //
addr == 16'h60 ? 16'h7661 :  // <0196> va
addr == 16'h61 ? 16'h7277 :  // <0196> rw
addr == 16'h62 ? 16'h7464 :  // <0196> td
// "av_rd_dt"
addr == 16'h63 ? 16'h7661 :  // <0196> va
addr == 16'h64 ? 16'h725f :  // <0196> r_
addr == 16'h65 ? 16'h5f64 :  // <0196> _d
addr == 16'h66 ? 16'h7464 :  // <0196> td
// "av_ad_hi"
addr == 16'h67 ? 16'h7661 :  // <0196> va
addr == 16'h68 ? 16'h615f :  // <0196> a_
addr == 16'h69 ? 16'h5f64 :  // <0196> _d
addr == 16'h6a ? 16'h6968 :  // <0196> ih
// "av_ad_lo"
addr == 16'h6b ? 16'h7661 :  // <0196> va
addr == 16'h6c ? 16'h615f :  // <0196> a_
addr == 16'h6d ? 16'h5f64 :  // <0196> _d
addr == 16'h6e ? 16'h6f6c :  // <0196> ol
// "//rom_ad"
addr == 16'h6f ? 16'h2f2f :  // <0196> //
addr == 16'h70 ? 16'h6f72 :  // <0196> or
addr == 16'h71 ? 16'h5f6d :  // <0196> _m
addr == 16'h72 ? 16'h6461 :  // <0196> da
// "rom_data"
addr == 16'h73 ? 16'h6f72 :  // <0196> or
addr == 16'h74 ? 16'h5f6d :  // <0196> _m
addr == 16'h75 ? 16'h6164 :  // <0196> ad
addr == 16'h76 ? 16'h6174 :  // <0196> at
// "//uartdt"
addr == 16'h77 ? 16'h2f2f :  // <0196> //
addr == 16'h78 ? 16'h6175 :  // <0196> au
addr == 16'h79 ? 16'h7472 :  // <0196> tr
addr == 16'h7a ? 16'h7464 :  // <0196> td
// "uartstat"
addr == 16'h7b ? 16'h6175 :  // <0196> au
addr == 16'h7c ? 16'h7472 :  // <0196> tr
addr == 16'h7d ? 16'h7473 :  // <0196> ts
addr == 16'h7e ? 16'h7461 :  // <0196> ta
// "    leds"
addr == 16'h7f ? 16'h2020 :  // <0196>   
addr == 16'h80 ? 16'h2020 :  // <0196>   
addr == 16'h81 ? 16'h656c :  // <0196> el
addr == 16'h82 ? 16'h7364 :  // <0196> sd
// "brd_ctrl"
addr == 16'h83 ? 16'h7262 :  // <0196> rb
addr == 16'h84 ? 16'h5f64 :  // <0196> _d
addr == 16'h85 ? 16'h7463 :  // <0196> tc
addr == 16'h86 ? 16'h6c72 :  // <0196> lr
// "   anmux"
addr == 16'h87 ? 16'h2020 :  // <0196>   
addr == 16'h88 ? 16'h6120 :  // <0196> a 
addr == 16'h89 ? 16'h6d6e :  // <0196> mn
addr == 16'h8a ? 16'h7875 :  // <0196> xu
// "pwr_duty"
addr == 16'h8b ? 16'h7770 :  // <0196> wp
addr == 16'h8c ? 16'h5f72 :  // <0196> _r
addr == 16'h8d ? 16'h7564 :  // <0196> ud
addr == 16'h8e ? 16'h7974 :  // <0196> yt
// "igntmcap"
addr == 16'h8f ? 16'h6769 :  // <0196> gi
addr == 16'h90 ? 16'h746e :  // <0196> tn
addr == 16'h91 ? 16'h636d :  // <0196> cm
addr == 16'h92 ? 16'h7061 :  // <0196> pa
// "igntmout"
addr == 16'h93 ? 16'h6769 :  // <0196> gi
addr == 16'h94 ? 16'h746e :  // <0196> tn
addr == 16'h95 ? 16'h6f6d :  // <0196> om
addr == 16'h96 ? 16'h7475 :  // <0196> tu
// "puflenus"
addr == 16'h97 ? 16'h7570 :  // <0196> up
addr == 16'h98 ? 16'h6c66 :  // <0196> lf
addr == 16'h99 ? 16'h6e65 :  // <0196> ne
addr == 16'h9a ? 16'h7375 :  // <0196> su

// string resources
// :boot_msg // = 0x009b
// "TGT\r\n\x0"
addr == 16'h9b ? 16'h4754 :  // <0200> GT
addr == 16'h9c ? 16'h0d54 :  // <0200>  T
addr == 16'h9d ? 16'h000a :  // <0200>   

// libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.

// event loop.  this infrastructure is assembled directly into the main program, not a func.
// first instruction of an event handler should be the 7th cycle after reading its priority from the event controller here.
// :poll_events // = 0x009e
// initialize prior to polling loop, for minimum latency.
addr == 16'h9e ? 16'h07a0 :  // <0006> b = :event_table
addr == 16'h9f ? 16'h07fe :  // <0006> "
// 3-cycle polling loop.
// :poll_events_again // = 0x00a0
addr == 16'ha0 ? 16'h000d :  // <0009> a = event_priority
addr == 16'ha1 ? 16'he000 :  // <0010> br 0z :poll_events_again
addr == 16'ha2 ? 16'h00a0 :  // <0010> "
// acknowledge the event to clear its capture register.  do this right away,
// so another occurrence of the same event can be captured right away in the controller.
addr == 16'ha3 ? 16'h3400 :  // <0013> event_priority = a
// compute an address in the event_table.  note the absence of a wait state for the adder here (not needed).
addr == 16'ha4 ? 16'hd300 :  // <0015> fetch rtna from ad0
addr == 16'ha5 ? 16'hfbb0 :  // <0015> "
// jump to the address given in the event_table.  each handler MUST end with a end_event.
// each handler does NOT need to save ANY registers (e.g. no convention_gpx).  they can all be trashed.
// each handler is passed the event priority in a, in case the same handler is used on multiple priorities.
addr == 16'ha6 ? 16'hfc00 :  // <0019> swapra = nop
// just returned here from the handler, in case the handler accidentally did a rtn.  this should NEVER happen.
addr == 16'ha7 ? 16'h7fa0 :  // <0021> error_halt_code 0xffc0 // leds = 0xffc0
addr == 16'ha8 ? 16'hffc0 :  // <0021> "
addr == 16'ha9 ? 16'he00f :  // <0021> error_halt_code 0xffc0
addr == 16'haa ? 16'h00a9 :  // <0021> "


// driver library for synapse316_uart simple async transceiver.






// routine sends out the low byte from a to the UART.  blocks until the FIFO accepts the byte.
// ######## func putchar_fduart // = 0x00ab
addr == 16'hab ? 16'h3004 :  // <0046> push x // func putchar_fduart

addr == 16'hac ? 16'h1000 :  // <0048> x = a

// wait for FIFO to be available.
addr == 16'had ? 16'h0202 :  // <0051> a = $atx_fifo_full_mask
// :pcfduart_wait_for_idle // = 0x00ae
addr == 16'hae ? 16'h041e :  // <0053> b = fduart_status
addr == 16'haf ? 16'he403 :  // <0054> bn and0z :pcfduart_wait_for_idle
addr == 16'hb0 ? 16'h00ae :  // <0054> "

// push word to the UART.  its low byte is a character.
addr == 16'hb1 ? 16'h7404 :  // <0057> fduart_data = x
addr == 16'hb2 ? 16'h100c :  // <0058> pop x // end_func
addr == 16'hb3 ? 16'hfc00 :  // <0057> swapra = nop

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// ######## func getchar_fduart // = 0x00b4
// wait until FIFO is populated.
addr == 16'hb4 ? 16'h0208 :  // <0064> a = $arx_fifo_empty_mask
// :wait_for_busy // = 0x00b5
addr == 16'hb5 ? 16'h041e :  // <0066> b = fduart_status
addr == 16'hb6 ? 16'he403 :  // <0067> bn and0z :wait_for_busy
addr == 16'hb7 ? 16'h00b5 :  // <0067> "
addr == 16'hb8 ? 16'h001d :  // <0068> a = fduart_data
addr == 16'hb9 ? 16'hfc00 :  // <0068> swapra = nop

// returns a character in a, or -1 if none.
// ######## func pollchar_fduart // = 0x00ba
// check for FIFO is populated.
addr == 16'hba ? 16'h0208 :  // <0074> a = $arx_fifo_empty_mask
addr == 16'hbb ? 16'h041e :  // <0075> b = fduart_status
addr == 16'hbc ? 16'he403 :  // <0076> bn and0z :none
addr == 16'hbd ? 16'h00c0 :  // <0076> "
addr == 16'hbe ? 16'h001d :  // <0077> a = fduart_data
addr == 16'hbf ? 16'hfc00 :  // <0077> swapra = nop
// :none // = 0x00c0
addr == 16'hc0 ? 16'h0360 :  // <0080> a = -1
addr == 16'hc1 ? 16'hfc00 :  // <0080> swapra = nop


// pass desired anmux channel in a.
// after this returns, CALLER MUST WAIT for muxer & current driver to
// settle down.  some delay for that is absolutely required (per testing).
// 5 ms wait works well 2015/04.
// ######## func anmux_set_chn // = 0x00c2
// set & enable analog muxer
addr == 16'hc2 ? 16'h0608 :  // <0007> b = $anmux_enable_mask
addr == 16'hc3 ? 16'hc800 :  // <0008> anmux_ctrl = or
addr == 16'hc4 ? 16'h8734 :  // <0008> "
addr == 16'hc5 ? 16'hfc00 :  // <0008> swapra = nop

// ######## func anmux_get_chn // = 0x00c6
addr == 16'hc6 ? 16'h0021 :  // <0012> a = anmux_ctrl
addr == 16'hc7 ? 16'h0607 :  // <0013> b = $anmux_channel_mask
addr == 16'hc8 ? 16'hc800 :  // <0014> a = and
addr == 16'hc9 ? 16'h0330 :  // <0014> "
addr == 16'hca ? 16'hfc00 :  // <0014> swapra = nop


// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x00cb
// "0123456789abcdef"
addr == 16'hcb ? 16'h3130 :  // <0050> 10
addr == 16'hcc ? 16'h3332 :  // <0050> 32
addr == 16'hcd ? 16'h3534 :  // <0050> 54
addr == 16'hce ? 16'h3736 :  // <0050> 76
addr == 16'hcf ? 16'h3938 :  // <0050> 98
addr == 16'hd0 ? 16'h6261 :  // <0050> ba
addr == 16'hd1 ? 16'h6463 :  // <0050> dc
addr == 16'hd2 ? 16'h6665 :  // <0050> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// ######## func put4x // = 0x00d3
addr == 16'hd3 ? 16'h3004 :  // <0054> push x // func put4x
addr == 16'hd4 ? 16'h3006 :  // <0054> push g6 // "
addr == 16'hd5 ? 16'h303e :  // <0054> push rtna // "
addr == 16'hd6 ? 16'h13a0 :  // <0055> x = :hexdigits
addr == 16'hd7 ? 16'h00cb :  // <0055> "

addr == 16'hd8 ? 16'h1800 :  // <0057> g6 = a
addr == 16'hd9 ? 16'h07a0 :  // <0058> b = 0xF000
addr == 16'hda ? 16'hf000 :  // <0058> "
addr == 16'hdb ? 16'hc800 :  // <0059> a = and
addr == 16'hdc ? 16'h0330 :  // <0059> "
addr == 16'hdd ? 16'h0353 :  // <0060> a = a>>4
addr == 16'hde ? 16'h0353 :  // <0061> a = a>>4
addr == 16'hdf ? 16'h0353 :  // <0062> a = a>>4
addr == 16'he0 ? 16'hfba0 :  // <0063> call fetch_byte
addr == 16'he1 ? 16'h01ec :  // <0063> "
addr == 16'he2 ? 16'hfc00 :  // <0063> "
addr == 16'he3 ? 16'hfba0 :  // <0064> putchar a
addr == 16'he4 ? 16'h00ab :  // <0064> "
addr == 16'he5 ? 16'hfc00 :  // <0064> "

addr == 16'he6 ? 16'h0006 :  // <0066> a = g6
addr == 16'he7 ? 16'h07a0 :  // <0067> b = 0x0F00
addr == 16'he8 ? 16'h0f00 :  // <0067> "
addr == 16'he9 ? 16'hc800 :  // <0068> a = and
addr == 16'hea ? 16'h0330 :  // <0068> "
addr == 16'heb ? 16'h0353 :  // <0069> a = a>>4
addr == 16'hec ? 16'h0353 :  // <0070> a = a>>4
addr == 16'hed ? 16'hfba0 :  // <0071> call fetch_byte
addr == 16'hee ? 16'h01ec :  // <0071> "
addr == 16'hef ? 16'hfc00 :  // <0071> "
addr == 16'hf0 ? 16'hfba0 :  // <0072> putchar a
addr == 16'hf1 ? 16'h00ab :  // <0072> "
addr == 16'hf2 ? 16'hfc00 :  // <0072> "

addr == 16'hf3 ? 16'h0006 :  // <0074> a = g6
addr == 16'hf4 ? 16'h06f0 :  // <0075> b = 0x00F0
addr == 16'hf5 ? 16'hc800 :  // <0076> a = and
addr == 16'hf6 ? 16'h0330 :  // <0076> "
addr == 16'hf7 ? 16'h0353 :  // <0077> a = a>>4
addr == 16'hf8 ? 16'hfba0 :  // <0078> call fetch_byte
addr == 16'hf9 ? 16'h01ec :  // <0078> "
addr == 16'hfa ? 16'hfc00 :  // <0078> "
addr == 16'hfb ? 16'hfba0 :  // <0079> putchar a
addr == 16'hfc ? 16'h00ab :  // <0079> "
addr == 16'hfd ? 16'hfc00 :  // <0079> "

addr == 16'hfe ? 16'h0006 :  // <0081> a = g6
addr == 16'hff ? 16'h060f :  // <0082> b = 0x000F
addr == 16'h100 ? 16'hc800 :  // <0083> a = and
addr == 16'h101 ? 16'h0330 :  // <0083> "
addr == 16'h102 ? 16'hfba0 :  // <0084> call fetch_byte
addr == 16'h103 ? 16'h01ec :  // <0084> "
addr == 16'h104 ? 16'hfc00 :  // <0084> "
addr == 16'h105 ? 16'hfba0 :  // <0085> putchar a
addr == 16'h106 ? 16'h00ab :  // <0085> "
addr == 16'h107 ? 16'hfc00 :  // <0085> "

addr == 16'h108 ? 16'hf80c :  // <0087> pop rtna // end_func
addr == 16'h109 ? 16'h180c :  // <0087> pop g6 // "
addr == 16'h10a ? 16'h100c :  // <0087> pop x // "
addr == 16'h10b ? 16'hfc00 :  // <0086> swapra = nop

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// ######## func get4x // = 0x010c
addr == 16'h10c ? 16'h3002 :  // <0091> push i // func get4x
addr == 16'h10d ? 16'h3003 :  // <0091> push j // "
addr == 16'h10e ? 16'h3004 :  // <0091> push x // "
addr == 16'h10f ? 16'h3005 :  // <0091> push y // "
addr == 16'h110 ? 16'h303e :  // <0091> push rtna // "
// y = digit counter
// j = sum
addr == 16'h111 ? 16'h1604 :  // <0094> y = 4
// :again // = 0x0112
addr == 16'h112 ? 16'hfba0 :  // <0096> getchar
addr == 16'h113 ? 16'h00b4 :  // <0096> "
addr == 16'h114 ? 16'hfc00 :  // <0096> "
addr == 16'h115 ? 16'h13a0 :  // <0097> x = :hexdigits
addr == 16'h116 ? 16'h00cb :  // <0097> "
addr == 16'h117 ? 16'h0a10 :  // <0098> i = 16
addr == 16'h118 ? 16'hfba0 :  // <0099> call :find_in_fetch
addr == 16'h119 ? 16'h0200 :  // <0099> "
addr == 16'h11a ? 16'hfc00 :  // <0099> "
addr == 16'h11b ? 16'h0760 :  // <0100> b = -1
addr == 16'h11c ? 16'he007 :  // <0101> br eq :fail
addr == 16'h11d ? 16'h0131 :  // <0101> "
addr == 16'h11e ? 16'h0400 :  // <0102> b = a
addr == 16'h11f ? 16'h0003 :  // <0103> a = j
addr == 16'h120 ? 16'h0352 :  // <0104> a = a<<4
addr == 16'h121 ? 16'hc800 :  // <0105> j = or
addr == 16'h122 ? 16'h0f34 :  // <0105> "
addr == 16'h123 ? 16'h1360 :  // <0106> x = -1
addr == 16'h124 ? 16'hc800 :  // <0107> y = x+y
addr == 16'h125 ? 16'h1720 :  // <0107> "
addr == 16'h126 ? 16'h0005 :  // <0108> a = y
addr == 16'h127 ? 16'he400 :  // <0109> bn az :again
addr == 16'h128 ? 16'h0112 :  // <0109> "
addr == 16'h129 ? 16'h0003 :  // <0110> a = j
addr == 16'h12a ? 16'h0600 :  // <0111> b = 0
addr == 16'h12b ? 16'hf80c :  // <0112> pop rtna // rtn
addr == 16'h12c ? 16'h140c :  // <0112> pop y // "
addr == 16'h12d ? 16'h100c :  // <0112> pop x // "
addr == 16'h12e ? 16'h0c0c :  // <0112> pop j // "
addr == 16'h12f ? 16'h080c :  // <0112> pop i // "
addr == 16'h130 ? 16'hfc00 :  // <0111> swapra = nop
// :fail // = 0x0131
addr == 16'h131 ? 16'h0760 :  // <0114> b = -1
addr == 16'h132 ? 16'hf80c :  // <0115> pop rtna // end_func
addr == 16'h133 ? 16'h140c :  // <0115> pop y // "
addr == 16'h134 ? 16'h100c :  // <0115> pop x // "
addr == 16'h135 ? 16'h0c0c :  // <0115> pop j // "
addr == 16'h136 ? 16'h080c :  // <0115> pop i // "
addr == 16'h137 ? 16'hfc00 :  // <0114> swapra = nop

// print a fixed-length string from packed words in program space.
// pass its word address (not its byte address) in a,  its length (bytes) in b.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_fixed // = 0x0138
addr == 16'h138 ? 16'h3002 :  // <0121> push i // func print_fixed
addr == 16'h139 ? 16'h3003 :  // <0121> push j // "
addr == 16'h13a ? 16'h3004 :  // <0121> push x // "
addr == 16'h13b ? 16'h3005 :  // <0121> push y // "
addr == 16'h13c ? 16'h3006 :  // <0121> push g6 // "
addr == 16'h13d ? 16'h303e :  // <0121> push rtna // "
addr == 16'h13e ? 16'h0800 :  // <0122> i = a
addr == 16'h13f ? 16'h0e01 :  // <0123> j = 1
addr == 16'h140 ? 16'h1001 :  // <0124> x = b
addr == 16'h141 ? 16'h1760 :  // <0125> y = -1
// :next_word // = 0x0142
addr == 16'h142 ? 16'he002 :  // <0127> br xz :done
addr == 16'h143 ? 16'h0158 :  // <0127> "
addr == 16'h144 ? 16'h1320 :  // <0128> x = ad2
addr == 16'h145 ? 16'hd002 :  // <0129> fetch g6 from i
addr == 16'h146 ? 16'h1bb0 :  // <0129> "
// now x = bytes remaining, i = current word address, g6 = data word.
addr == 16'h147 ? 16'h0006 :  // <0131> a = g6 // putchar g6
addr == 16'h148 ? 16'hfba0 :  // <0131> putchar g6
addr == 16'h149 ? 16'h00ab :  // <0131> "
addr == 16'h14a ? 16'hfc00 :  // <0131> "
addr == 16'h14b ? 16'he002 :  // <0132> br xz :done
addr == 16'h14c ? 16'h0158 :  // <0132> "
addr == 16'h14d ? 16'h1320 :  // <0133> x = ad2
addr == 16'h14e ? 16'h0006 :  // <0134> a = g6
addr == 16'h14f ? 16'h0353 :  // <0135> a = a>>4
addr == 16'h150 ? 16'h0353 :  // <0136> a = a>>4
addr == 16'h151 ? 16'hfba0 :  // <0137> putchar a
addr == 16'h152 ? 16'h00ab :  // <0137> "
addr == 16'h153 ? 16'hfc00 :  // <0137> "
addr == 16'h154 ? 16'hc800 :  // <0138> i = i+j
addr == 16'h155 ? 16'h0b10 :  // <0138> "
addr == 16'h156 ? 16'he00f :  // <0139> jmp :next_word
addr == 16'h157 ? 16'h0142 :  // <0139> "
// :done // = 0x0158
addr == 16'h158 ? 16'hf80c :  // <0141> pop rtna // end_func
addr == 16'h159 ? 16'h180c :  // <0141> pop g6 // "
addr == 16'h15a ? 16'h140c :  // <0141> pop y // "
addr == 16'h15b ? 16'h100c :  // <0141> pop x // "
addr == 16'h15c ? 16'h0c0c :  // <0141> pop j // "
addr == 16'h15d ? 16'h080c :  // <0141> pop i // "
addr == 16'h15e ? 16'hfc00 :  // <0140> swapra = nop

// print a null-terminated string from packed words in program space.
// pass its word address (not its byte address) in a.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_nt // = 0x015f
addr == 16'h15f ? 16'h3002 :  // <0147> push i // func print_nt
addr == 16'h160 ? 16'h3003 :  // <0147> push j // "
addr == 16'h161 ? 16'h3004 :  // <0147> push x // "
addr == 16'h162 ? 16'h303e :  // <0147> push rtna // "
addr == 16'h163 ? 16'h0800 :  // <0148> i = a
addr == 16'h164 ? 16'h0e01 :  // <0149> j = 1
// :next_word // = 0x0165
addr == 16'h165 ? 16'hd002 :  // <0151> fetch x from i
addr == 16'h166 ? 16'h13b0 :  // <0151> "
// now i = current word address, x = data word, b = low byte mask, a = data byte.
addr == 16'h167 ? 16'h0004 :  // <0153> a = x
addr == 16'h168 ? 16'h06ff :  // <0154> b = 0xff
addr == 16'h169 ? 16'he003 :  // <0155> br and0z :done
addr == 16'h16a ? 16'h017b :  // <0155> "
addr == 16'h16b ? 16'hfba0 :  // <0156> putchar a
addr == 16'h16c ? 16'h00ab :  // <0156> "
addr == 16'h16d ? 16'hfc00 :  // <0156> "
addr == 16'h16e ? 16'h0004 :  // <0157> a = x
addr == 16'h16f ? 16'h0353 :  // <0158> a = a>>4
addr == 16'h170 ? 16'h0353 :  // <0159> a = a>>4
addr == 16'h171 ? 16'h06ff :  // <0160> b = 0xff
addr == 16'h172 ? 16'he003 :  // <0161> br and0z :done
addr == 16'h173 ? 16'h017b :  // <0161> "
addr == 16'h174 ? 16'hfba0 :  // <0162> putchar a
addr == 16'h175 ? 16'h00ab :  // <0162> "
addr == 16'h176 ? 16'hfc00 :  // <0162> "
addr == 16'h177 ? 16'hc800 :  // <0163> i = i+j
addr == 16'h178 ? 16'h0b10 :  // <0163> "
addr == 16'h179 ? 16'he00f :  // <0164> jmp :next_word
addr == 16'h17a ? 16'h0165 :  // <0164> "
// :done // = 0x017b
addr == 16'h17b ? 16'hf80c :  // <0166> pop rtna // end_func
addr == 16'h17c ? 16'h100c :  // <0166> pop x // "
addr == 16'h17d ? 16'h0c0c :  // <0166> pop j // "
addr == 16'h17e ? 16'h080c :  // <0166> pop i // "
addr == 16'h17f ? 16'hfc00 :  // <0165> swapra = nop


// function library for simple integer math.

// ######## func multiply // = 0x0180
addr == 16'h180 ? 16'h3002 :  // <0004> push i // func multiply
addr == 16'h181 ? 16'h3003 :  // <0004> push j // "
addr == 16'h182 ? 16'h3004 :  // <0004> push x // "
addr == 16'h183 ? 16'h3005 :  // <0004> push y // "
// unsigned 16-bit multiplication.  a = a * b.
// it's easy to roll over the 16-bit result by passing operands whose bit widths total more than 16.
// bigger/safer/faster math can be obtained from Altera IP blocks.

// x = operand a
// y = operand b
// i = total
// x is shifted right so its low bit can be tested each time.
// y is shifted left so its value (for summing) increases each time.
addr == 16'h184 ? 16'h1000 :  // <0014> x = a
addr == 16'h185 ? 16'h1401 :  // <0015> y = b
addr == 16'h186 ? 16'h0a00 :  // <0016> i = 0
// :again // = 0x0187
addr == 16'h187 ? 16'he002 :  // <0018> br xz :done
addr == 16'h188 ? 16'h0196 :  // <0018> "
addr == 16'h189 ? 16'h0004 :  // <0019> a = x
addr == 16'h18a ? 16'h0601 :  // <0020> b = 1
addr == 16'h18b ? 16'he003 :  // <0021> br and0z :skip_add
addr == 16'h18c ? 16'h0190 :  // <0021> "
addr == 16'h18d ? 16'h0c05 :  // <0022> j = y
addr == 16'h18e ? 16'hc800 :  // <0023> i = i+j
addr == 16'h18f ? 16'h0b10 :  // <0023> "
// :skip_add // = 0x0190
addr == 16'h190 ? 16'h0004 :  // <0025> a = x
addr == 16'h191 ? 16'h1350 :  // <0026> x = a>>1
addr == 16'h192 ? 16'h0005 :  // <0027> a = y
addr == 16'h193 ? 16'h1751 :  // <0028> y = a<<1
addr == 16'h194 ? 16'he00f :  // <0029> jmp :again
addr == 16'h195 ? 16'h0187 :  // <0029> "
// :done // = 0x0196
addr == 16'h196 ? 16'h0002 :  // <0031> a = i
addr == 16'h197 ? 16'h140c :  // <0032> pop y // end_func
addr == 16'h198 ? 16'h100c :  // <0032> pop x // "
addr == 16'h199 ? 16'h0c0c :  // <0032> pop j // "
addr == 16'h19a ? 16'h080c :  // <0032> pop i // "
addr == 16'h19b ? 16'hfc00 :  // <0031> swapra = nop

// ######## func divide // = 0x019c
addr == 16'h19c ? 16'h3002 :  // <0034> push i // func divide
addr == 16'h19d ? 16'h3003 :  // <0034> push j // "
addr == 16'h19e ? 16'h3004 :  // <0034> push x // "
addr == 16'h19f ? 16'h3005 :  // <0034> push y // "
addr == 16'h1a0 ? 16'h3006 :  // <0034> push g6 // "
addr == 16'h1a1 ? 16'h3007 :  // <0034> push g7 // "
// unsigned 15-bit division.  b = a / b.  return remainder in a.
// division by zero results in zero.
// THE HIGH BIT OF A MUST BE 0!!  ALSO THE HIGH BIT OF B MUST BE 0!!
// 1 in the high bit of either operand results in infinite loop or wrong results.
// bigger/safer/faster math can be obtained from Altera IP blocks.

// degenerate cases.
addr == 16'h1a2 ? 16'he005 :  // <0042> br lt :zero
addr == 16'h1a3 ? 16'h01dd :  // <0042> "
addr == 16'h1a4 ? 16'he000 :  // <0043> br az :zero
addr == 16'h1a5 ? 16'h01dd :  // <0043> "
addr == 16'h1a6 ? 16'h1000 :  // <0044> x = a
//    g7 = x
addr == 16'h1a7 ? 16'h0001 :  // <0046> a = b
addr == 16'h1a8 ? 16'he000 :  // <0047> br az :zero
addr == 16'h1a9 ? 16'h01dd :  // <0047> "
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
addr == 16'h1aa ? 16'h0404 :  // <0063> b = x
addr == 16'h1ab ? 16'h0a00 :  // <0064> i = 0
addr == 16'h1ac ? 16'h0e01 :  // <0065> j = 1
// :shift_again // = 0x01ad
addr == 16'h1ad ? 16'he006 :  // <0067> br gt :shift_done
addr == 16'h1ae ? 16'h01b3 :  // <0067> "
addr == 16'h1af ? 16'h0351 :  // <0068> a = a<<1
addr == 16'h1b0 ? 16'h0b10 :  // <0069> i = ad1
addr == 16'h1b1 ? 16'he00f :  // <0070> jmp :shift_again
addr == 16'h1b2 ? 16'h01ad :  // <0070> "
// :shift_done // = 0x01b3
addr == 16'h1b3 ? 16'h1b50 :  // <0072> g6 = a>>1
// now operands are x / g6.  i = number of passes of long division required.
// notice i was not decremented here, so it has 1 more in it than the number of shifts required for digit parity.
// that's exactly what it needs for correctness.

// // compensate for special case where msb was 1.  then 1 more division pass is needed.
// j = y
// i = i+j
// x = g7

// long division.  g7 = quotient.
addr == 16'h1b4 ? 16'h1e00 :  // <0083> g7 = 0
addr == 16'h1b5 ? 16'h0f60 :  // <0084> j = -1
// :again // = 0x01b6
addr == 16'h1b6 ? 16'he001 :  // <0086> br iz :done
addr == 16'h1b7 ? 16'h01d4 :  // <0086> "
addr == 16'h1b8 ? 16'h0006 :  // <0087> a = g6
addr == 16'h1b9 ? 16'h0404 :  // <0088> b = x
addr == 16'h1ba ? 16'he006 :  // <0089> br gt :result0
addr == 16'h1bb ? 16'h01cc :  // <0089> "
// temp does fit; output a 1.
addr == 16'h1bc ? 16'h0007 :  // <0091> a = g7
addr == 16'h1bd ? 16'h0351 :  // <0092> a = a<<1
addr == 16'h1be ? 16'h0601 :  // <0093> b = 1
addr == 16'h1bf ? 16'hc800 :  // <0094> g7 = or
addr == 16'h1c0 ? 16'h1f34 :  // <0094> "
// dividend = dividend - temp
addr == 16'h1c1 ? 16'h0006 :  // <0096> a = g6
addr == 16'h1c2 ? 16'h0760 :  // <0097> b = -1
addr == 16'h1c3 ? 16'hc800 :  // <0098> a = xor
addr == 16'h1c4 ? 16'h0338 :  // <0098> "
addr == 16'h1c5 ? 16'h0601 :  // <0099> b = 1
addr == 16'h1c6 ? 16'hc800 :  // <0100> y = a+b
addr == 16'h1c7 ? 16'h1700 :  // <0100> "
addr == 16'h1c8 ? 16'hc800 :  // <0101> x = x+y
addr == 16'h1c9 ? 16'h1320 :  // <0101> "
addr == 16'h1ca ? 16'he00f :  // <0102> jmp :next
addr == 16'h1cb ? 16'h01ce :  // <0102> "
// :result0 // = 0x01cc
// temp does not fit; output a 0.
addr == 16'h1cc ? 16'h0007 :  // <0105> a = g7
addr == 16'h1cd ? 16'h1f51 :  // <0106> g7 = a<<1
// no change to dividend.
// :next // = 0x01ce
addr == 16'h1ce ? 16'h0006 :  // <0109> a = g6
addr == 16'h1cf ? 16'h1b50 :  // <0110> g6 = a>>1
addr == 16'h1d0 ? 16'hc800 :  // <0111> i = i+j
addr == 16'h1d1 ? 16'h0b10 :  // <0111> "
addr == 16'h1d2 ? 16'he00f :  // <0112> jmp :again
addr == 16'h1d3 ? 16'h01b6 :  // <0112> "

// :done // = 0x01d4
addr == 16'h1d4 ? 16'h0407 :  // <0115> b = g7
addr == 16'h1d5 ? 16'h0004 :  // <0116> a = x
addr == 16'h1d6 ? 16'h1c0c :  // <0117> pop g7 // rtn
addr == 16'h1d7 ? 16'h180c :  // <0117> pop g6 // "
addr == 16'h1d8 ? 16'h140c :  // <0117> pop y // "
addr == 16'h1d9 ? 16'h100c :  // <0117> pop x // "
addr == 16'h1da ? 16'h0c0c :  // <0117> pop j // "
addr == 16'h1db ? 16'h080c :  // <0117> pop i // "
addr == 16'h1dc ? 16'hfc00 :  // <0116> swapra = nop

// :zero // = 0x01dd
addr == 16'h1dd ? 16'h0600 :  // <0120> b = 0
addr == 16'h1de ? 16'h1c0c :  // <0121> pop g7 // rtn
addr == 16'h1df ? 16'h180c :  // <0121> pop g6 // "
addr == 16'h1e0 ? 16'h140c :  // <0121> pop y // "
addr == 16'h1e1 ? 16'h100c :  // <0121> pop x // "
addr == 16'h1e2 ? 16'h0c0c :  // <0121> pop j // "
addr == 16'h1e3 ? 16'h080c :  // <0121> pop i // "
addr == 16'h1e4 ? 16'hfc00 :  // <0120> swapra = nop
addr == 16'h1e5 ? 16'h1c0c :  // <0122> pop g7 // end_func
addr == 16'h1e6 ? 16'h180c :  // <0122> pop g6 // "
addr == 16'h1e7 ? 16'h140c :  // <0122> pop y // "
addr == 16'h1e8 ? 16'h100c :  // <0122> pop x // "
addr == 16'h1e9 ? 16'h0c0c :  // <0122> pop j // "
addr == 16'h1ea ? 16'h080c :  // <0122> pop i // "
addr == 16'h1eb ? 16'hfc00 :  // <0121> swapra = nop


//func multiply32 {arg_a in pa} {arg_b in pb} {product_lo out pa} {product_hi out pb} {
//// unsigned 16-bit multiplication with 32-bit product.

//// ga = product_lo
//// gb = product_hi
//// pa is shifted right so its low bit can be tested each time.
//// pb is shifted left so its value (for summing) increases each time.
//FAIL:  because pb is shifting, it will be destroyed in cases where total bits > 16.
//despite supporting carry overflow, the algorithm still assumes total bits <= 16.
//also i think the loop order is backward for correctly shifting into the hi word.
//could fix that by reversing the hi word shift.
//ga = 0
//gb = 0
//:again
//br xz :done
//a = arg_a
//b = 1
//br and0z :skip_add
//a = ga
//b = arg_b
//ga = a+b
//br ad0c :carry
//a = gb
//gb = a<<1
//jmp :carry_done
//:carry
//a = gb
//a = a<<1
//b = 1
//gb = a+b
//:carry_done
//:skip_add
//a = arg_a
//arg_a = a>>1
//a = arg_b
//arg_b = a<<1
//jmp :again
//:done
//product_lo = ga
//product_hi = gb
//end_func


// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// ######## func fetch_byte // = 0x01ec
addr == 16'h1ec ? 16'h0601 :  // <0005> b = 1
addr == 16'h1ed ? 16'he003 :  // <0006> br and0z :pick_byte_even
addr == 16'h1ee ? 16'h01f7 :  // <0006> "
addr == 16'h1ef ? 16'h0350 :  // <0007> a = a>>1
addr == 16'h1f0 ? 16'h0404 :  // <0008> b = x
addr == 16'h1f1 ? 16'hc800 :  // <0009> fetch a from a+b
addr == 16'h1f2 ? 16'hd300 :  // <0009> "
addr == 16'h1f3 ? 16'h03b0 :  // <0009> "
addr == 16'h1f4 ? 16'h0353 :  // <0010> a = a>>4
addr == 16'h1f5 ? 16'h0353 :  // <0011> a = a>>4
addr == 16'h1f6 ? 16'hfc00 :  // <0011> swapra = nop
// :pick_byte_even // = 0x01f7
addr == 16'h1f7 ? 16'h0350 :  // <0014> a = a>>1
addr == 16'h1f8 ? 16'h0404 :  // <0015> b = x
addr == 16'h1f9 ? 16'hc800 :  // <0016> fetch a from a+b
addr == 16'h1fa ? 16'hd300 :  // <0016> "
addr == 16'h1fb ? 16'h03b0 :  // <0016> "
addr == 16'h1fc ? 16'h06ff :  // <0017> b = 0xff
addr == 16'h1fd ? 16'hc800 :  // <0018> a = and
addr == 16'h1fe ? 16'h0330 :  // <0018> "
addr == 16'h1ff ? 16'hfc00 :  // <0018> swapra = nop

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// ######## func find_in_fetch // = 0x0200
addr == 16'h200 ? 16'h3002 :  // <0027> push i // func find_in_fetch
addr == 16'h201 ? 16'h3003 :  // <0027> push j // "
addr == 16'h202 ? 16'h3005 :  // <0027> push y // "
addr == 16'h203 ? 16'h303e :  // <0027> push rtna // "
addr == 16'h204 ? 16'h1400 :  // <0028> y = a
addr == 16'h205 ? 16'h0f60 :  // <0029> j = -1
// :again // = 0x0206
addr == 16'h206 ? 16'he001 :  // <0031> br iz :fail
addr == 16'h207 ? 16'h0216 :  // <0031> "
addr == 16'h208 ? 16'h0b10 :  // <0032> i = ad1
addr == 16'h209 ? 16'h0002 :  // <0033> a = i
addr == 16'h20a ? 16'hfba0 :  // <0034> call :fetch_byte
addr == 16'h20b ? 16'h01ec :  // <0034> "
addr == 16'h20c ? 16'hfc00 :  // <0034> "
addr == 16'h20d ? 16'h0405 :  // <0035> b = y
addr == 16'h20e ? 16'he407 :  // <0036> bn eq :again
addr == 16'h20f ? 16'h0206 :  // <0036> "
// :found // = 0x0210
addr == 16'h210 ? 16'h0002 :  // <0038> a = i
addr == 16'h211 ? 16'hf80c :  // <0039> pop rtna // rtn
addr == 16'h212 ? 16'h140c :  // <0039> pop y // "
addr == 16'h213 ? 16'h0c0c :  // <0039> pop j // "
addr == 16'h214 ? 16'h080c :  // <0039> pop i // "
addr == 16'h215 ? 16'hfc00 :  // <0038> swapra = nop
// :fail // = 0x0216
addr == 16'h216 ? 16'h0360 :  // <0041> a = -1
addr == 16'h217 ? 16'hf80c :  // <0042> pop rtna // end_func
addr == 16'h218 ? 16'h140c :  // <0042> pop y // "
addr == 16'h219 ? 16'h0c0c :  // <0042> pop j // "
addr == 16'h21a ? 16'h080c :  // <0042> pop i // "
addr == 16'h21b ? 16'hfc00 :  // <0041> swapra = nop


// routine waits a number of milliseconds given in a.
// ######## func spinwait // = 0x021c
addr == 16'h21c ? 16'h3004 :  // <0002> push x // func spinwait
addr == 16'h21d ? 16'h3005 :  // <0002> push y // "
//patch
//rtn
addr == 16'h21e ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x021f
addr == 16'h21f ? 16'h13a0 :  // <0007> x = 16666
addr == 16'h220 ? 16'h411a :  // <0007> "
addr == 16'h221 ? 16'h1760 :  // <0008> y = -1
addr == 16'h222 ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x0223
// use of the ad2 name overrides auto-nop here.
addr == 16'h223 ? 16'h1320 :  // <0012> x = ad2
addr == 16'h224 ? 16'he402 :  // <0013> bn xz :spinwait_inner
addr == 16'h225 ? 16'h0223 :  // <0013> "
addr == 16'h226 ? 16'hc800 :  // <0014> a = a+b
addr == 16'h227 ? 16'h0300 :  // <0014> "
addr == 16'h228 ? 16'he400 :  // <0015> bn az :spinwait_outer
addr == 16'h229 ? 16'h021f :  // <0015> "
addr == 16'h22a ? 16'h140c :  // <0016> pop y // end_func
addr == 16'h22b ? 16'h100c :  // <0016> pop x // "
addr == 16'h22c ? 16'hfc00 :  // <0015> swapra = nop







// ######## func init_data_rom // = 0x022d
addr == 16'h22d ? 16'h3002 :  // <0026> push i // func init_data_rom

// copy entire ROM content to a shadow area in RAM.
addr == 16'h22e ? 16'h67a0 :  // <0020> av_ad_hi = ($drom_shadow_base >> 16)
addr == 16'h22f ? 16'h0100 :  // <0020> "
addr == 16'h230 ? 16'h0a00 :  // <0025> i = 0
// :loop_560 // = 0x0231

addr == 16'h231 ? 16'h6c02 :  // <0021> data_rom_ad = i
addr == 16'h232 ? 16'h6802 :  // <0022> av_ad_lo = i
addr == 16'h233 ? 16'h5c1c :  // <0023> av_write_data = data_rom_data


addr == 16'h234 ? 16'h0002 :  // <0025> a = i
addr == 16'h235 ? 16'h0601 :  // <0025> b = 1
addr == 16'h236 ? 16'hc800 :  // <0025> i = a+b
addr == 16'h237 ? 16'h0b00 :  // <0025> "


addr == 16'h238 ? 16'h0002 :  // <0025> a = i
addr == 16'h239 ? 16'h07a0 :  // <0025> b = $drom_shadow_len_bytes
addr == 16'h23a ? 16'h0800 :  // <0025> "
addr == 16'h23b ? 16'he005 :  // <0025> br lt :loop_560
addr == 16'h23c ? 16'h0231 :  // <0025> "

// :end_560 // = 0x023d

addr == 16'h23d ? 16'h080c :  // <0027> pop i // func init_data_rom
addr == 16'h23e ? 16'hfc00 :  // <0027> swapra = nop



// when commands share a common suffix, the longer command must come FIRST here.
// :cmd_table // = 0x023f
// "  hello"
addr == 16'h23f ? 16'h2020 :  // <0006>   
addr == 16'h240 ? 16'h6568 :  // <0006> eh
addr == 16'h241 ? 16'h6c6c :  // <0006> ll
addr == 16'h242 ? 16'h006f :  // <0006>  o
addr == 16'h243 ? 16'h0307 :  // <0007> ([label hello_cmd])
// "  plstp"
addr == 16'h244 ? 16'h2020 :  // <0008>   
addr == 16'h245 ? 16'h6c70 :  // <0008> lp
addr == 16'h246 ? 16'h7473 :  // <0008> ts
addr == 16'h247 ? 16'h0070 :  // <0008>  p
addr == 16'h248 ? 16'h030b :  // <0009> ([label set_plan_stop_cmd])
// "   plcr"
addr == 16'h249 ? 16'h2020 :  // <0010>   
addr == 16'h24a ? 16'h7020 :  // <0010> p 
addr == 16'h24b ? 16'h636c :  // <0010> cl
addr == 16'h24c ? 16'h0072 :  // <0010>  r
addr == 16'h24d ? 16'h0316 :  // <0011> ([label set_plan_crank_cmd])
// "   plwm"
addr == 16'h24e ? 16'h2020 :  // <0012>   
addr == 16'h24f ? 16'h7020 :  // <0012> p 
addr == 16'h250 ? 16'h776c :  // <0012> wl
addr == 16'h251 ? 16'h006d :  // <0012>  m
addr == 16'h252 ? 16'h0321 :  // <0013> ([label set_plan_warmup_cmd])
// "   plrn"
addr == 16'h253 ? 16'h2020 :  // <0014>   
addr == 16'h254 ? 16'h7020 :  // <0014> p 
addr == 16'h255 ? 16'h726c :  // <0014> rl
addr == 16'h256 ? 16'h006e :  // <0014>  n
addr == 16'h257 ? 16'h032c :  // <0015> ([label set_plan_run_cmd])
// "   plln"
addr == 16'h258 ? 16'h2020 :  // <0016>   
addr == 16'h259 ? 16'h7020 :  // <0016> p 
addr == 16'h25a ? 16'h6c6c :  // <0016> ll
addr == 16'h25b ? 16'h006e :  // <0016>  n
addr == 16'h25c ? 16'h0337 :  // <0017> ([label set_plan_learn_cmd])
// " ldsmap"
addr == 16'h25d ? 16'h6c20 :  // <0018> l 
addr == 16'h25e ? 16'h7364 :  // <0018> sd
addr == 16'h25f ? 16'h616d :  // <0018> am
addr == 16'h260 ? 16'h0070 :  // <0018>  p
addr == 16'h261 ? 16'h0635 :  // <0019> ([label load_smap_cmd])
// " clsmap"
addr == 16'h262 ? 16'h6320 :  // <0020> c 
addr == 16'h263 ? 16'h736c :  // <0020> sl
addr == 16'h264 ? 16'h616d :  // <0020> am
addr == 16'h265 ? 16'h0070 :  // <0020>  p
addr == 16'h266 ? 16'h0651 :  // <0021> ([label clear_smap_cmd])
// "   smap"
addr == 16'h267 ? 16'h2020 :  // <0022>   
addr == 16'h268 ? 16'h7320 :  // <0022> s 
addr == 16'h269 ? 16'h616d :  // <0022> am
addr == 16'h26a ? 16'h0070 :  // <0022>  p
addr == 16'h26b ? 16'h05d0 :  // <0023> ([label dump_smap_cmd])
// "   ltps"
addr == 16'h26c ? 16'h2020 :  // <0024>   
addr == 16'h26d ? 16'h6c20 :  // <0024> l 
addr == 16'h26e ? 16'h7074 :  // <0024> pt
addr == 16'h26f ? 16'h0073 :  // <0024>  s
addr == 16'h270 ? 16'h0689 :  // <0025> ([label learn_tps_ref_cmd])
// " ldtpsr"
addr == 16'h271 ? 16'h6c20 :  // <0026> l 
addr == 16'h272 ? 16'h7464 :  // <0026> td
addr == 16'h273 ? 16'h7370 :  // <0026> sp
addr == 16'h274 ? 16'h0072 :  // <0026>  r
addr == 16'h275 ? 16'h0666 :  // <0027> ([label load_tps_ref_cmd])
// " ldtpse"
addr == 16'h276 ? 16'h6c20 :  // <0028> l 
addr == 16'h277 ? 16'h7464 :  // <0028> td
addr == 16'h278 ? 16'h7370 :  // <0028> sp
addr == 16'h279 ? 16'h0065 :  // <0028>  e
addr == 16'h27a ? 16'h0634 :  // <0029> ([label load_tps_enrich_cmd])
// "      ,"
addr == 16'h27b ? 16'h2020 :  // <0030>   
addr == 16'h27c ? 16'h2020 :  // <0030>   
addr == 16'h27d ? 16'h2020 :  // <0030>   
addr == 16'h27e ? 16'h002c :  // <0030>  ,
addr == 16'h27f ? 16'h06a1 :  // <0031> ([label trim_lean_cmd])
// "      ."
addr == 16'h280 ? 16'h2020 :  // <0032>   
addr == 16'h281 ? 16'h2020 :  // <0032>   
addr == 16'h282 ? 16'h2020 :  // <0032>   
addr == 16'h283 ? 16'h002e :  // <0032>  .
addr == 16'h284 ? 16'h06b4 :  // <0033> ([label trim_rich_cmd])
// "      \["
addr == 16'h285 ? 16'h2020 :  // <0034>   
addr == 16'h286 ? 16'h2020 :  // <0034>   
addr == 16'h287 ? 16'h2020 :  // <0034>   
addr == 16'h288 ? 16'h005b :  // <0034>  [
addr == 16'h289 ? 16'h06c7 :  // <0035> ([label trim_2lean_cmd])
// "      \]"
addr == 16'h28a ? 16'h2020 :  // <0036>   
addr == 16'h28b ? 16'h2020 :  // <0036>   
addr == 16'h28c ? 16'h2020 :  // <0036>   
addr == 16'h28d ? 16'h005d :  // <0036>  ]
addr == 16'h28e ? 16'h06da :  // <0037> ([label trim_2rich_cmd])
// "\x0\x0"
addr == 16'h28f ? 16'h0000 :  // <0038>   


// ######## func parse_key // = 0x0290
addr == 16'h290 ? 16'h3002 :  // <0056> push i // func parse_key
addr == 16'h291 ? 16'h3004 :  // <0056> push x // "
addr == 16'h292 ? 16'h3005 :  // <0056> push y // "
addr == 16'h293 ? 16'h303e :  // <0056> push rtna // "

// memorize into ram_key_buf, pushing down existing content.
addr == 16'h294 ? 16'h1008 :  // <0043> x = key
addr == 16'h295 ? 16'h0a07 :  // <0052> i = $key_buf_max
// :loop_661 // = 0x0296

addr == 16'h296 ? 16'h0002 :  // <0044> a = i

addr == 16'h297 ? 16'h0351 :  // <0045> a = a<<1
addr == 16'h298 ? 16'h0600 :  // <0045> b = 0
addr == 16'h299 ? 16'h6600 :  // <0045> av_ad_hi = 0
addr == 16'h29a ? 16'h6b00 :  // <0045> av_ad_lo = ad0
addr == 16'h29b ? 16'h0417 :  // <0045> b = av_write_data
addr == 16'h29c ? 16'h0418 :  // <0045> b = av_read_data

addr == 16'h29d ? 16'h1401 :  // <0046> y = b
addr == 16'h29e ? 16'h0002 :  // <0047> a = i
addr == 16'h29f ? 16'h0404 :  // <0048> b = x

addr == 16'h2a0 ? 16'h0351 :  // <0049> a = a<<1
addr == 16'h2a1 ? 16'h3001 :  // <0049> push b // push b
addr == 16'h2a2 ? 16'h0600 :  // <0049> b = 0
addr == 16'h2a3 ? 16'h6600 :  // <0049> av_ad_hi = 0
addr == 16'h2a4 ? 16'h6b00 :  // <0049> av_ad_lo = ad0
addr == 16'h2a5 ? 16'h5c0c :  // <0049> pop av_write_data // pop av_write_data

addr == 16'h2a6 ? 16'h1005 :  // <0050> x = y


addr == 16'h2a7 ? 16'h0002 :  // <0052> a = i
addr == 16'h2a8 ? 16'h0600 :  // <0052> b = 0
addr == 16'h2a9 ? 16'he007 :  // <0052> br eq :end_661
addr == 16'h2aa ? 16'h02b3 :  // <0052> "


addr == 16'h2ab ? 16'h0002 :  // <0052> a = i
addr == 16'h2ac ? 16'h0760 :  // <0052> b = -1
addr == 16'h2ad ? 16'hc800 :  // <0052> i = a+b
addr == 16'h2ae ? 16'h0b00 :  // <0052> "


addr == 16'h2af ? 16'h0002 :  // <0052> a = i
addr == 16'h2b0 ? 16'h0600 :  // <0052> b = 0
addr == 16'h2b1 ? 16'he405 :  // <0052> bn lt :loop_661
addr == 16'h2b2 ? 16'h0296 :  // <0052> "

// :end_661 // = 0x02b3

addr == 16'h2b3 ? 16'h0008 :  // <0055> a = key
addr == 16'h2b4 ? 16'h060d :  // <0055> b = 13

addr == 16'h2b5 ? 16'he407 :  // <0053> bn eq :else_693
addr == 16'h2b6 ? 16'h02ba :  // <0053> "

addr == 16'h2b7 ? 16'hfba0 :  // <0054> callx  parse_command
addr == 16'h2b8 ? 16'h02c1 :  // <0054> "
addr == 16'h2b9 ? 16'hfc00 :  // <0054> "


addr == 16'h2ba ? 16'hf80c :  // <0057> pop rtna // func parse_key
addr == 16'h2bb ? 16'h140c :  // <0057> pop y // "
addr == 16'h2bc ? 16'h100c :  // <0057> pop x // "
addr == 16'h2bd ? 16'h080c :  // <0057> pop i // "
addr == 16'h2be ? 16'hfc00 :  // <0057> swapra = nop

// :cmd_ack_msg // = 0x02bf
// "OK\x0"
addr == 16'h2bf ? 16'h4b4f :  // <0059> KO
addr == 16'h2c0 ? 16'h0000 :  // <0059>   

// ######## func parse_command // = 0x02c1
addr == 16'h2c1 ? 16'h3002 :  // <0100> push i // func parse_command
addr == 16'h2c2 ? 16'h3004 :  // <0100> push x // "
addr == 16'h2c3 ? 16'h3005 :  // <0100> push y // "
addr == 16'h2c4 ? 16'h303e :  // <0100> push rtna // "

addr == 16'h2c5 ? 16'h13a0 :  // <0062> x = :cmd_table
addr == 16'h2c6 ? 16'h023f :  // <0062> "
// :next_cmd // = 0x02c7
addr == 16'h2c7 ? 16'hd004 :  // <0064> fetch a from x
addr == 16'h2c8 ? 16'h03b0 :  // <0064> "
addr == 16'h2c9 ? 16'he000 :  // <0065> br az :done
addr == 16'h2ca ? 16'h0302 :  // <0065> "

addr == 16'h2cb ? 16'h0a00 :  // <0081> i = 0
// :loop_715 // = 0x02cc

addr == 16'h2cc ? 16'h0002 :  // <0067> a = i
addr == 16'h2cd ? 16'hfba0 :  // <0068> call :fetch_byte
addr == 16'h2ce ? 16'h01ec :  // <0068> "
addr == 16'h2cf ? 16'hfc00 :  // <0068> "
addr == 16'h2d0 ? 16'h1400 :  // <0069> y = a
addr == 16'h2d1 ? 16'h0620 :  // <0070> b = 32 // asc b = " "

addr == 16'h2d2 ? 16'h0000 :  // <0079> a = a
addr == 16'h2d3 ? 16'h0401 :  // <0079> b = b

addr == 16'h2d4 ? 16'he007 :  // <0071> br eq :else_724
addr == 16'h2d5 ? 16'h02e3 :  // <0071> "

addr == 16'h2d6 ? 16'h062a :  // <0072> b = 42 // asc b = "*"
addr == 16'h2d7 ? 16'he007 :  // <0073> br eq :matched
addr == 16'h2d8 ? 16'h02eb :  // <0073> "
// parameter character.  succeed early.
addr == 16'h2d9 ? 16'h0002 :  // <0075> a = i

addr == 16'h2da ? 16'h0351 :  // <0076> a = a<<1
addr == 16'h2db ? 16'h0600 :  // <0076> b = 0
addr == 16'h2dc ? 16'h6600 :  // <0076> av_ad_hi = 0
addr == 16'h2dd ? 16'h6b00 :  // <0076> av_ad_lo = ad0
addr == 16'h2de ? 16'h0417 :  // <0076> b = av_write_data
addr == 16'h2df ? 16'h0418 :  // <0076> b = av_read_data

addr == 16'h2e0 ? 16'h0005 :  // <0077> a = y
addr == 16'h2e1 ? 16'he407 :  // <0078> bn eq :no_match
addr == 16'h2e2 ? 16'h02f7 :  // <0078> "



addr == 16'h2e3 ? 16'h0002 :  // <0081> a = i
addr == 16'h2e4 ? 16'h0601 :  // <0081> b = 1
addr == 16'h2e5 ? 16'hc800 :  // <0081> i = a+b
addr == 16'h2e6 ? 16'h0b00 :  // <0081> "


addr == 16'h2e7 ? 16'h0002 :  // <0081> a = i
addr == 16'h2e8 ? 16'h0607 :  // <0081> b = $key_buf_max
addr == 16'h2e9 ? 16'he005 :  // <0081> br lt :loop_715
addr == 16'h2ea ? 16'h02cc :  // <0081> "

// :end_715 // = 0x02eb

// at this point we have a match on the record beginning at x.
// :matched // = 0x02eb
addr == 16'h2eb ? 16'h23a0 :  // <0085> pa = :cmd_ack_msg
addr == 16'h2ec ? 16'h02bf :  // <0085> "
addr == 16'h2ed ? 16'hfba0 :  // <0085> callx  set_text_flag  :cmd_ack_msg
addr == 16'h2ee ? 16'h0b51 :  // <0085> "
addr == 16'h2ef ? 16'hfc00 :  // <0085> "
addr == 16'h2f0 ? 16'h1604 :  // <0086> y = ($key_buf_len / 2)
addr == 16'h2f1 ? 16'hc800 :  // <0087> fetch rtna from x+y
addr == 16'h2f2 ? 16'hd320 :  // <0087> "
addr == 16'h2f3 ? 16'hfbb0 :  // <0087> "
addr == 16'h2f4 ? 16'hfc00 :  // <0088> swapra = nop
addr == 16'h2f5 ? 16'he00f :  // <0090> jmp :done
addr == 16'h2f6 ? 16'h0302 :  // <0090> "

// :no_match // = 0x02f7
// if ram_terminal_connected is still 0, quit searching after the very first command in the table.
addr == 16'h2f7 ? 16'h6600 :  // <0094> ram a = $ram_terminal_connected // av_ad_hi = 0
addr == 16'h2f8 ? 16'h6a94 :  // <0094> ram a = $ram_terminal_connected // av_ad_lo = 148
addr == 16'h2f9 ? 16'h0017 :  // <0094> ram a = $ram_terminal_connected // a = av_write_data // start read cycle
addr == 16'h2fa ? 16'h0018 :  // <0094> ram a = $ram_terminal_connected // a = av_read_data // finish read cycle
addr == 16'h2fb ? 16'he000 :  // <0095> br az :done
addr == 16'h2fc ? 16'h0302 :  // <0095> "

addr == 16'h2fd ? 16'h1605 :  // <0097> y = (($key_buf_len / 2) + 1)
addr == 16'h2fe ? 16'hc800 :  // <0098> x = x+y
addr == 16'h2ff ? 16'h1320 :  // <0098> "
addr == 16'h300 ? 16'he00f :  // <0099> jmp :next_cmd
addr == 16'h301 ? 16'h02c7 :  // <0099> "
// :done // = 0x0302

addr == 16'h302 ? 16'hf80c :  // <0102> pop rtna // func parse_command
addr == 16'h303 ? 16'h140c :  // <0102> pop y // "
addr == 16'h304 ? 16'h100c :  // <0102> pop x // "
addr == 16'h305 ? 16'h080c :  // <0102> pop i // "
addr == 16'h306 ? 16'hfc00 :  // <0102> swapra = nop

// ######## func hello_cmd // = 0x0307

addr == 16'h307 ? 16'h6600 :  // <0104> ram $ram_terminal_connected = 1 // av_ad_hi = 0
addr == 16'h308 ? 16'h6a94 :  // <0104> ram $ram_terminal_connected = 1 // av_ad_lo = 148
addr == 16'h309 ? 16'h5e01 :  // <0104> ram $ram_terminal_connected = 1 // av_write_data = 1

addr == 16'h30a ? 16'hfc00 :  // <0106> swapra = nop

// ######## func set_plan_stop_cmd // = 0x030b
addr == 16'h30b ? 16'h303e :  // <0111> push rtna // func set_plan_stop_cmd

addr == 16'h30c ? 16'h6600 :  // <0108> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h30d ? 16'h6a8e :  // <0108> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'h30e ? 16'hf817 :  // <0108> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h30f ? 16'hf818 :  // <0108> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h310 ? 16'hfc00 :  // <0109> swapra = nop
addr == 16'h311 ? 16'hfba0 :  // <0111> callx  init_plan_stop
addr == 16'h312 ? 16'h0344 :  // <0111> "
addr == 16'h313 ? 16'hfc00 :  // <0111> "

addr == 16'h314 ? 16'hf80c :  // <0113> pop rtna // func set_plan_stop_cmd
addr == 16'h315 ? 16'hfc00 :  // <0113> swapra = nop

// ######## func set_plan_crank_cmd // = 0x0316
addr == 16'h316 ? 16'h303e :  // <0118> push rtna // func set_plan_crank_cmd

addr == 16'h317 ? 16'h6600 :  // <0115> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h318 ? 16'h6a8e :  // <0115> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'h319 ? 16'hf817 :  // <0115> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h31a ? 16'hf818 :  // <0115> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h31b ? 16'hfc00 :  // <0116> swapra = nop
addr == 16'h31c ? 16'hfba0 :  // <0118> callx  init_plan_crank
addr == 16'h31d ? 16'h0383 :  // <0118> "
addr == 16'h31e ? 16'hfc00 :  // <0118> "

addr == 16'h31f ? 16'hf80c :  // <0120> pop rtna // func set_plan_crank_cmd
addr == 16'h320 ? 16'hfc00 :  // <0120> swapra = nop

// ######## func set_plan_warmup_cmd // = 0x0321
addr == 16'h321 ? 16'h303e :  // <0125> push rtna // func set_plan_warmup_cmd

addr == 16'h322 ? 16'h6600 :  // <0122> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h323 ? 16'h6a8e :  // <0122> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'h324 ? 16'hf817 :  // <0122> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h325 ? 16'hf818 :  // <0122> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h326 ? 16'hfc00 :  // <0123> swapra = nop
addr == 16'h327 ? 16'hfba0 :  // <0125> callx  init_plan_warmup
addr == 16'h328 ? 16'h03e9 :  // <0125> "
addr == 16'h329 ? 16'hfc00 :  // <0125> "

addr == 16'h32a ? 16'hf80c :  // <0127> pop rtna // func set_plan_warmup_cmd
addr == 16'h32b ? 16'hfc00 :  // <0127> swapra = nop

// ######## func set_plan_run_cmd // = 0x032c
addr == 16'h32c ? 16'h303e :  // <0132> push rtna // func set_plan_run_cmd

addr == 16'h32d ? 16'h6600 :  // <0129> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h32e ? 16'h6a8e :  // <0129> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'h32f ? 16'hf817 :  // <0129> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h330 ? 16'hf818 :  // <0129> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h331 ? 16'hfc00 :  // <0130> swapra = nop
addr == 16'h332 ? 16'hfba0 :  // <0132> callx  init_plan_run
addr == 16'h333 ? 16'h06ed :  // <0132> "
addr == 16'h334 ? 16'hfc00 :  // <0132> "

addr == 16'h335 ? 16'hf80c :  // <0134> pop rtna // func set_plan_run_cmd
addr == 16'h336 ? 16'hfc00 :  // <0134> swapra = nop

// ######## func set_plan_learn_cmd // = 0x0337
addr == 16'h337 ? 16'h303e :  // <0139> push rtna // func set_plan_learn_cmd

addr == 16'h338 ? 16'h6600 :  // <0136> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h339 ? 16'h6a8e :  // <0136> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'h33a ? 16'hf817 :  // <0136> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h33b ? 16'hf818 :  // <0136> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h33c ? 16'hfc00 :  // <0137> swapra = nop
addr == 16'h33d ? 16'hfba0 :  // <0139> callx  init_plan_learn_stoich
addr == 16'h33e ? 16'h0489 :  // <0139> "
addr == 16'h33f ? 16'hfc00 :  // <0139> "

addr == 16'h340 ? 16'hf80c :  // <0141> pop rtna // func set_plan_learn_cmd
addr == 16'h341 ? 16'hfc00 :  // <0141> swapra = nop


// :plan_name_stop // = 0x0342
// "STP\x0"
addr == 16'h342 ? 16'h5453 :  // <0002> TS
addr == 16'h343 ? 16'h0050 :  // <0002>  P

// ######## func init_plan_stop // = 0x0344
addr == 16'h344 ? 16'h303e :  // <0023> push rtna // func init_plan_stop

// set up the stop plan.
addr == 16'h345 ? 16'hfba0 :  // <0006> callx  clear_ign_history
addr == 16'h346 ? 16'h0879 :  // <0006> "
addr == 16'h347 ? 16'hfc00 :  // <0006> "
// set noise filter to measure RPM between 50 and 1160 to indicate cranking.
addr == 16'h348 ? 16'h6600 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_hi = 0
addr == 16'h349 ? 16'h6a82 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_lo = 130
addr == 16'h34a ? 16'h5fa0 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_write_data = 603
addr == 16'h34b ? 16'h025b :  // <0008> "
addr == 16'h34c ? 16'h6600 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h34d ? 16'h6a84 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 132
addr == 16'h34e ? 16'h5fa0 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h34f ? 16'h36b0 :  // <0009> "
addr == 16'h350 ? 16'h93a0 :  // <0010> ign_timeout_len_jf = ([rpm_to_jf 50])
addr == 16'h351 ? 16'h36b0 :  // <0010> "
// normally puff length is not touched by an init func.
// this one does it because it's part of the program boot,
// and also a good idea whenever stopping the engine.
// this might interrupt a puff in mid-pulse, but no matter in this case.
addr == 16'h352 ? 16'h6600 :  // <0015> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h353 ? 16'h6a90 :  // <0015> ram $ram_next_puff_len_us = 0 // av_ad_lo = 144
addr == 16'h354 ? 16'h5e00 :  // <0015> ram $ram_next_puff_len_us = 0 // av_write_data = 0
addr == 16'h355 ? 16'h9600 :  // <0016> puff_len_us = 0

// memorize state.
addr == 16'h356 ? 16'h6600 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_ad_hi = 0
addr == 16'h357 ? 16'h6a88 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_ad_lo = 136
addr == 16'h358 ? 16'h5fa0 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_write_data = :plan_name_stop
addr == 16'h359 ? 16'h0342 :  // <0019> "
addr == 16'h35a ? 16'h6600 :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_ad_hi = 0
addr == 16'h35b ? 16'h6a8a :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_ad_lo = 138
addr == 16'h35c ? 16'h5fa0 :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_write_data = :puff_len_stop
addr == 16'h35d ? 16'h0369 :  // <0020> "
addr == 16'h35e ? 16'h6600 :  // <0021> ram $ram_transition_func = :leave_stop // av_ad_hi = 0
addr == 16'h35f ? 16'h6a8c :  // <0021> ram $ram_transition_func = :leave_stop // av_ad_lo = 140
addr == 16'h360 ? 16'h5fa0 :  // <0021> ram $ram_transition_func = :leave_stop // av_write_data = :leave_stop
addr == 16'h361 ? 16'h036d :  // <0021> "
addr == 16'h362 ? 16'h6600 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_hi = 0
addr == 16'h363 ? 16'h6a8e :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_lo = 142
addr == 16'h364 ? 16'h5fa0 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_write_data = :destroy_plan_stop
addr == 16'h365 ? 16'h0368 :  // <0022> "

addr == 16'h366 ? 16'hf80c :  // <0024> pop rtna // func init_plan_stop
addr == 16'h367 ? 16'hfc00 :  // <0024> swapra = nop

// ######## func destroy_plan_stop // = 0x0368


addr == 16'h368 ? 16'hfc00 :  // <0027> swapra = nop

// ######## func puff_len_stop // = 0x0369

addr == 16'h369 ? 16'h6600 :  // <0029> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h36a ? 16'h6a90 :  // <0029> ram $ram_next_puff_len_us = 0 // av_ad_lo = 144
addr == 16'h36b ? 16'h5e00 :  // <0029> ram $ram_next_puff_len_us = 0 // av_write_data = 0

addr == 16'h36c ? 16'hfc00 :  // <0031> swapra = nop

// ######## func leave_stop // = 0x036d
addr == 16'h36d ? 16'h303e :  // <0044> push rtna // func leave_stop

// leave stop plan if ignition switch is turned on AND more than half if the ignition history is valid.
// requiring both conditions prevents spurious noise readings from starting up the injection.
addr == 16'h36e ? 16'h0022 :  // <0035> a = power_duty
addr == 16'h36f ? 16'h0680 :  // <0036> b = $ign_switch_off_mask
addr == 16'h370 ? 16'he403 :  // <0037> bn and0z :stay
addr == 16'h371 ? 16'h037f :  // <0037> "
addr == 16'h372 ? 16'h6600 :  // <0038> ram a = $ram_ign_bad_samples // av_ad_hi = 0
addr == 16'h373 ? 16'h6a80 :  // <0038> ram a = $ram_ign_bad_samples // av_ad_lo = 128
addr == 16'h374 ? 16'h0017 :  // <0038> ram a = $ram_ign_bad_samples // a = av_write_data // start read cycle
addr == 16'h375 ? 16'h0018 :  // <0038> ram a = $ram_ign_bad_samples // a = av_read_data // finish read cycle
addr == 16'h376 ? 16'h0608 :  // <0039> b = ($ign_history_len / 2)
addr == 16'h377 ? 16'he006 :  // <0040> br gt :stay
addr == 16'h378 ? 16'h037f :  // <0040> "
addr == 16'h379 ? 16'hfba0 :  // <0041> callx  destroy_plan_stop
addr == 16'h37a ? 16'h0368 :  // <0041> "
addr == 16'h37b ? 16'hfc00 :  // <0041> "
addr == 16'h37c ? 16'hfba0 :  // <0042> callx  init_plan_crank
addr == 16'h37d ? 16'h0383 :  // <0042> "
addr == 16'h37e ? 16'hfc00 :  // <0042> "
// :stay // = 0x037f

addr == 16'h37f ? 16'hf80c :  // <0045> pop rtna // func leave_stop
addr == 16'h380 ? 16'hfc00 :  // <0045> swapra = nop



// escalating puff length by 1500 us per puff while cranking slowly at e.g. 80 RPM
// on a frozen winter morning will ramp up from 10000 to 20000 us length in about 5 seconds.

// :plan_name_crank // = 0x0381
// "CR\x0"
addr == 16'h381 ? 16'h5243 :  // <0011> RC
addr == 16'h382 ? 16'h0000 :  // <0011>   

// ######## func init_plan_crank // = 0x0383
addr == 16'h383 ? 16'h303e :  // <0033> push rtna // func init_plan_crank

// set up the crank plan.
addr == 16'h384 ? 16'h6600 :  // <0015> ram $ram_puff_count = 0 // av_ad_hi = 0
addr == 16'h385 ? 16'h6a92 :  // <0015> ram $ram_puff_count = 0 // av_ad_lo = 146
addr == 16'h386 ? 16'h5e00 :  // <0015> ram $ram_puff_count = 0 // av_write_data = 0
// set noise filter to measure RPM between 50 and 8000 to indicate running.
addr == 16'h387 ? 16'h6600 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_ad_hi = 0
addr == 16'h388 ? 16'h6a82 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_ad_lo = 130
addr == 16'h389 ? 16'h5e57 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_write_data = 87
addr == 16'h38a ? 16'h6600 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h38b ? 16'h6a84 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 132
addr == 16'h38c ? 16'h5fa0 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h38d ? 16'h36b0 :  // <0018> "
addr == 16'h38e ? 16'h93a0 :  // <0019> ign_timeout_len_jf = ([rpm_to_jf 50])
addr == 16'h38f ? 16'h36b0 :  // <0019> "
// normally puff length is not touched by an init func.
// this one does it because it's the beginning of a crank cycle, and puff length
// should be enabled for the first puff.  otherwise the first puff would be missed.
addr == 16'h390 ? 16'h6600 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_hi = 0
addr == 16'h391 ? 16'h6a90 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_lo = 144
addr == 16'h392 ? 16'h5fa0 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_write_data = 10000
addr == 16'h393 ? 16'h2710 :  // <0023> "
addr == 16'h394 ? 16'h97a0 :  // <0024> puff_len_us = $crank_min_puff_len_us
addr == 16'h395 ? 16'h2710 :  // <0024> "
// clear ignition history again to eliminate samples where the motor kept spinning after switching from plan_run to plan_stop.
addr == 16'h396 ? 16'hfba0 :  // <0026> callx  clear_ign_history
addr == 16'h397 ? 16'h0879 :  // <0026> "
addr == 16'h398 ? 16'hfc00 :  // <0026> "

// memorize state.
addr == 16'h399 ? 16'h6600 :  // <0029> ram $ram_plan_name = :plan_name_crank // av_ad_hi = 0
addr == 16'h39a ? 16'h6a88 :  // <0029> ram $ram_plan_name = :plan_name_crank // av_ad_lo = 136
addr == 16'h39b ? 16'h5fa0 :  // <0029> ram $ram_plan_name = :plan_name_crank // av_write_data = :plan_name_crank
addr == 16'h39c ? 16'h0381 :  // <0029> "
addr == 16'h39d ? 16'h6600 :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_ad_hi = 0
addr == 16'h39e ? 16'h6a8a :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_ad_lo = 138
addr == 16'h39f ? 16'h5fa0 :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_write_data = :puff_len_crank
addr == 16'h3a0 ? 16'h03ac :  // <0030> "
addr == 16'h3a1 ? 16'h6600 :  // <0031> ram $ram_transition_func = :leave_crank // av_ad_hi = 0
addr == 16'h3a2 ? 16'h6a8c :  // <0031> ram $ram_transition_func = :leave_crank // av_ad_lo = 140
addr == 16'h3a3 ? 16'h5fa0 :  // <0031> ram $ram_transition_func = :leave_crank // av_write_data = :leave_crank
addr == 16'h3a4 ? 16'h03ca :  // <0031> "
addr == 16'h3a5 ? 16'h6600 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_hi = 0
addr == 16'h3a6 ? 16'h6a8e :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_lo = 142
addr == 16'h3a7 ? 16'h5fa0 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_write_data = :destroy_plan_crank
addr == 16'h3a8 ? 16'h03ab :  // <0032> "

addr == 16'h3a9 ? 16'hf80c :  // <0034> pop rtna // func init_plan_crank
addr == 16'h3aa ? 16'hfc00 :  // <0034> swapra = nop

// ######## func destroy_plan_crank // = 0x03ab


addr == 16'h3ab ? 16'hfc00 :  // <0037> swapra = nop

// ######## func puff_len_crank // = 0x03ac
addr == 16'h3ac ? 16'h303e :  // <0054> push rtna // func puff_len_crank

addr == 16'h3ad ? 16'h6600 :  // <0039> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h3ae ? 16'h6a92 :  // <0039> ram a = $ram_puff_count // av_ad_lo = 146
addr == 16'h3af ? 16'h0017 :  // <0039> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h3b0 ? 16'h0018 :  // <0039> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h3b1 ? 16'h0604 :  // <0040> b = $crank_max_puffs
addr == 16'h3b2 ? 16'he006 :  // <0041> br gt :puff_limit
addr == 16'h3b3 ? 16'h03c1 :  // <0041> "
// linear escalation from min to max puff length, at a slope of crank_incr_us_per_puff.
addr == 16'h3b4 ? 16'h07a0 :  // <0043> b = $crank_incr_us_per_puff
addr == 16'h3b5 ? 16'h09c4 :  // <0043> "
addr == 16'h3b6 ? 16'hfba0 :  // <0044> call :multiply
addr == 16'h3b7 ? 16'h0180 :  // <0044> "
addr == 16'h3b8 ? 16'hfc00 :  // <0044> "
addr == 16'h3b9 ? 16'h07a0 :  // <0045> b = $crank_min_puff_len_us
addr == 16'h3ba ? 16'h2710 :  // <0045> "
addr == 16'h3bb ? 16'h6600 :  // <0046> ram $ram_next_puff_len_us = a+b // av_ad_hi = 0
addr == 16'h3bc ? 16'h6a90 :  // <0046> ram $ram_next_puff_len_us = a+b // av_ad_lo = 144
addr == 16'h3bd ? 16'hc800 :  // <0046> ram $ram_next_puff_len_us = a+b // av_write_data = a+b
addr == 16'h3be ? 16'h5f00 :  // <0046> "
addr == 16'h3bf ? 16'he00f :  // <0047> jmp :done
addr == 16'h3c0 ? 16'h03c8 :  // <0047> "
// :puff_limit // = 0x03c1
// prevent the puff counter from going higher & eventually rolling over.
addr == 16'h3c1 ? 16'h6600 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_ad_hi = 0
addr == 16'h3c2 ? 16'h6a92 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_ad_lo = 146
addr == 16'h3c3 ? 16'h5e04 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_write_data = 4
// accept max puff len.
addr == 16'h3c4 ? 16'h6600 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_hi = 0
addr == 16'h3c5 ? 16'h6a90 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_lo = 144
addr == 16'h3c6 ? 16'h5fa0 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_write_data = 20000
addr == 16'h3c7 ? 16'h4e20 :  // <0052> "
// :done // = 0x03c8

addr == 16'h3c8 ? 16'hf80c :  // <0055> pop rtna // func puff_len_crank
addr == 16'h3c9 ? 16'hfc00 :  // <0055> swapra = nop

// ######## func leave_crank // = 0x03ca
addr == 16'h3ca ? 16'h303e :  // <0071> push rtna // func leave_crank

addr == 16'h3cb ? 16'hfba0 :  // <0057> callx  check_engine_stop  a
addr == 16'h3cc ? 16'h0c8a :  // <0057> "
addr == 16'h3cd ? 16'hfc00 :  // <0057> "
addr == 16'h3ce ? 16'h0008 :  // <0057> a = pa
addr == 16'h3cf ? 16'he400 :  // <0058> bn az :done
addr == 16'h3d0 ? 16'h03e5 :  // <0058> "

// transition to warmup if RPM exceeds crank_success_rpm.
addr == 16'h3d1 ? 16'h6600 :  // <0061> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h3d2 ? 16'h6a7e :  // <0061> ram a = $ram_rpm_valid // av_ad_lo = 126
addr == 16'h3d3 ? 16'h0017 :  // <0061> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h3d4 ? 16'h0018 :  // <0061> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle
addr == 16'h3d5 ? 16'he000 :  // <0062> br az :stay
addr == 16'h3d6 ? 16'h03e5 :  // <0062> "
addr == 16'h3d7 ? 16'h6600 :  // <0063> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h3d8 ? 16'h6a7c :  // <0063> ram a = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h3d9 ? 16'h0017 :  // <0063> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h3da ? 16'h0018 :  // <0063> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle
addr == 16'h3db ? 16'h07a0 :  // <0064> b = $crank_success_rpm
addr == 16'h3dc ? 16'h0320 :  // <0064> "
addr == 16'h3dd ? 16'he005 :  // <0065> br lt :stay
addr == 16'h3de ? 16'h03e5 :  // <0065> "
addr == 16'h3df ? 16'hfba0 :  // <0066> callx  destroy_plan_crank
addr == 16'h3e0 ? 16'h03ab :  // <0066> "
addr == 16'h3e1 ? 16'hfc00 :  // <0066> "
addr == 16'h3e2 ? 16'hfba0 :  // <0067> callx  init_plan_warmup
addr == 16'h3e3 ? 16'h03e9 :  // <0067> "
addr == 16'h3e4 ? 16'hfc00 :  // <0067> "
// :stay // = 0x03e5

// :done // = 0x03e5

addr == 16'h3e5 ? 16'hf80c :  // <0072> pop rtna // func leave_crank
addr == 16'h3e6 ? 16'hfc00 :  // <0072> swapra = nop



// 0x4c0 = 1216 = 120 degF at the sensor location outside the engine block.
// 750 = 0 degF.
// max 6000 & min 4500 over a temp range 750 to 0x4c0 gives 6900 us puff at 74 deg F.  program rev 594.
// this is used if the engine temp is unavailable.

// :plan_name_warmup // = 0x03e7
// "WM\x0"
addr == 16'h3e7 ? 16'h4d57 :  // <0016> MW
addr == 16'h3e8 ? 16'h0000 :  // <0016>   

// ######## func init_plan_warmup // = 0x03e9

// set up the warmup plan.
addr == 16'h3e9 ? 16'h6600 :  // <0020> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h3ea ? 16'h6a14 :  // <0020> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h3eb ? 16'h0017 :  // <0020> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h3ec ? 16'h0018 :  // <0020> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h3ed ? 16'h063c :  // <0021> b = $warmup_timeout_sec
addr == 16'h3ee ? 16'h6600 :  // <0022> ram $ram_warmup_timeout_at_pass = a+b // av_ad_hi = 0
addr == 16'h3ef ? 16'h6a96 :  // <0022> ram $ram_warmup_timeout_at_pass = a+b // av_ad_lo = 150
addr == 16'h3f0 ? 16'hc800 :  // <0022> ram $ram_warmup_timeout_at_pass = a+b // av_write_data = a+b
addr == 16'h3f1 ? 16'h5f00 :  // <0022> "

// memorize state.
addr == 16'h3f2 ? 16'h6600 :  // <0025> ram $ram_plan_name = :plan_name_warmup // av_ad_hi = 0
addr == 16'h3f3 ? 16'h6a88 :  // <0025> ram $ram_plan_name = :plan_name_warmup // av_ad_lo = 136
addr == 16'h3f4 ? 16'h5fa0 :  // <0025> ram $ram_plan_name = :plan_name_warmup // av_write_data = :plan_name_warmup
addr == 16'h3f5 ? 16'h03e7 :  // <0025> "
addr == 16'h3f6 ? 16'h6600 :  // <0026> ram $ram_puff_len_func = :puff_len_warmup // av_ad_hi = 0
addr == 16'h3f7 ? 16'h6a8a :  // <0026> ram $ram_puff_len_func = :puff_len_warmup // av_ad_lo = 138
addr == 16'h3f8 ? 16'h5fa0 :  // <0026> ram $ram_puff_len_func = :puff_len_warmup // av_write_data = :puff_len_warmup
addr == 16'h3f9 ? 16'h0404 :  // <0026> "
addr == 16'h3fa ? 16'h6600 :  // <0027> ram $ram_transition_func = :leave_warmup // av_ad_hi = 0
addr == 16'h3fb ? 16'h6a8c :  // <0027> ram $ram_transition_func = :leave_warmup // av_ad_lo = 140
addr == 16'h3fc ? 16'h5fa0 :  // <0027> ram $ram_transition_func = :leave_warmup // av_write_data = :leave_warmup
addr == 16'h3fd ? 16'h0436 :  // <0027> "
addr == 16'h3fe ? 16'h6600 :  // <0028> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_ad_hi = 0
addr == 16'h3ff ? 16'h6a8e :  // <0028> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_ad_lo = 142
addr == 16'h400 ? 16'h5fa0 :  // <0028> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_write_data = :destroy_plan_warmup
addr == 16'h401 ? 16'h0403 :  // <0028> "

addr == 16'h402 ? 16'hfc00 :  // <0030> swapra = nop

// ######## func destroy_plan_warmup // = 0x0403


addr == 16'h403 ? 16'hfc00 :  // <0033> swapra = nop

// ######## func puff_len_warmup // = 0x0404
addr == 16'h404 ? 16'h3004 :  // <0070> push x // func puff_len_warmup
addr == 16'h405 ? 16'h303e :  // <0070> push rtna // "

// x = enrichment us.
addr == 16'h406 ? 16'h13a0 :  // <0036> x = $warmup_limping_enrichment_us
addr == 16'h407 ? 16'h07d0 :  // <0036> "

// check engine block temp sensor.  if valid, enrich by a linear function:
// {warmup_min_temp_adc...warmup_success_temp_adc} -> {$warmup_max_enrichment_us...0}
addr == 16'h408 ? 16'h0202 :  // <0040> a = $anmux_engine_block_temp

addr == 16'h409 ? 16'h0351 :  // <0041> a = a<<1
addr == 16'h40a ? 16'h0616 :  // <0041> b = 22
addr == 16'h40b ? 16'h6600 :  // <0041> av_ad_hi = 0
addr == 16'h40c ? 16'h6b00 :  // <0041> av_ad_lo = ad0
addr == 16'h40d ? 16'h0417 :  // <0041> b = av_write_data
addr == 16'h40e ? 16'h0418 :  // <0041> b = av_read_data

// b = sensor reading in adc counts.
addr == 16'h40f ? 16'h03a0 :  // <0043> a = $temp_ceiling_adc
addr == 16'h410 ? 16'h0ff0 :  // <0043> "
addr == 16'h411 ? 16'he005 :  // <0044> br lt :temp_invalid
addr == 16'h412 ? 16'h042c :  // <0044> "
addr == 16'h413 ? 16'h03a0 :  // <0045> a = $warmup_success_temp_adc
addr == 16'h414 ? 16'h04c0 :  // <0045> "
addr == 16'h415 ? 16'he005 :  // <0046> br lt :too_warm
addr == 16'h416 ? 16'h042c :  // <0046> "
addr == 16'h417 ? 16'h03a0 :  // <0047> a = $warmup_min_temp_adc
addr == 16'h418 ? 16'h02ee :  // <0047> "
addr == 16'h419 ? 16'he005 :  // <0048> br lt :in_range
addr == 16'h41a ? 16'h041d :  // <0048> "
addr == 16'h41b ? 16'h07a0 :  // <0049> b = $warmup_min_temp_adc
addr == 16'h41c ? 16'h02ee :  // <0049> "
// :in_range // = 0x041d
// negate the sensor reading so as to subtract it from warmup_success_temp_adc.
addr == 16'h41d ? 16'h0360 :  // <0052> a = 0xffff
addr == 16'h41e ? 16'hc800 :  // <0053> b = xor
addr == 16'h41f ? 16'h0738 :  // <0053> "
addr == 16'h420 ? 16'h0201 :  // <0054> a = 1
addr == 16'h421 ? 16'hc800 :  // <0055> b = a+b
addr == 16'h422 ? 16'h0700 :  // <0055> "
addr == 16'h423 ? 16'h03a0 :  // <0056> a = $warmup_success_temp_adc
addr == 16'h424 ? 16'h04c0 :  // <0056> "
addr == 16'h425 ? 16'hc800 :  // <0057> b = a+b
addr == 16'h426 ? 16'h0700 :  // <0057> "
// b = how many counts "cold" we are.  multiply that by the slope warmup_us_per_cold_adc.
addr == 16'h427 ? 16'h020c :  // <0059> a = $warmup_us_per_cold_adc
addr == 16'h428 ? 16'hfba0 :  // <0060> call :multiply
addr == 16'h429 ? 16'h0180 :  // <0060> "
addr == 16'h42a ? 16'hfc00 :  // <0060> "
addr == 16'h42b ? 16'h1000 :  // <0061> x = a
// :too_warm // = 0x042c
// :temp_invalid // = 0x042c

// apply total of base amount and enrichment.
// $warmup_min_puff_len_us <= total <= ($warmup_min_puff_len_us + $warmup_max_enrichment_us)
addr == 16'h42c ? 16'h03a0 :  // <0067> a = $warmup_min_puff_len_us
addr == 16'h42d ? 16'h09c4 :  // <0067> "
addr == 16'h42e ? 16'h0404 :  // <0068> b = x
addr == 16'h42f ? 16'h6600 :  // <0069> ram $ram_next_puff_len_us = a+b // av_ad_hi = 0
addr == 16'h430 ? 16'h6a90 :  // <0069> ram $ram_next_puff_len_us = a+b // av_ad_lo = 144
addr == 16'h431 ? 16'hc800 :  // <0069> ram $ram_next_puff_len_us = a+b // av_write_data = a+b
addr == 16'h432 ? 16'h5f00 :  // <0069> "

addr == 16'h433 ? 16'hf80c :  // <0071> pop rtna // func puff_len_warmup
addr == 16'h434 ? 16'h100c :  // <0071> pop x // "
addr == 16'h435 ? 16'hfc00 :  // <0071> swapra = nop

// ######## func leave_warmup // = 0x0436
addr == 16'h436 ? 16'h303e :  // <0099> push rtna // func leave_warmup

addr == 16'h437 ? 16'hfba0 :  // <0073> callx  check_engine_stop  a
addr == 16'h438 ? 16'h0c8a :  // <0073> "
addr == 16'h439 ? 16'hfc00 :  // <0073> "
addr == 16'h43a ? 16'h0008 :  // <0073> a = pa
addr == 16'h43b ? 16'he400 :  // <0074> bn az :done
addr == 16'h43c ? 16'h046a :  // <0074> "

// transition to plan_run if warmup has expired.
addr == 16'h43d ? 16'h6600 :  // <0077> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h43e ? 16'h6a14 :  // <0077> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h43f ? 16'h0017 :  // <0077> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h440 ? 16'h0018 :  // <0077> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h441 ? 16'h6600 :  // <0078> ram b = $ram_warmup_timeout_at_pass // av_ad_hi = 0
addr == 16'h442 ? 16'h6a96 :  // <0078> ram b = $ram_warmup_timeout_at_pass // av_ad_lo = 150
addr == 16'h443 ? 16'h0417 :  // <0078> ram b = $ram_warmup_timeout_at_pass // b = av_write_data // start read cycle
addr == 16'h444 ? 16'h0418 :  // <0078> ram b = $ram_warmup_timeout_at_pass // b = av_read_data // finish read cycle

addr == 16'h445 ? 16'h0000 :  // <0083> a = a
addr == 16'h446 ? 16'h0401 :  // <0083> b = b

addr == 16'h447 ? 16'he406 :  // <0079> bn gt :else_1095
addr == 16'h448 ? 16'h0451 :  // <0079> "

addr == 16'h449 ? 16'hfba0 :  // <0080> callx  destroy_plan_warmup
addr == 16'h44a ? 16'h0403 :  // <0080> "
addr == 16'h44b ? 16'hfc00 :  // <0080> "
addr == 16'h44c ? 16'hfba0 :  // <0081> callx  init_plan_run
addr == 16'h44d ? 16'h06ed :  // <0081> "
addr == 16'h44e ? 16'hfc00 :  // <0081> "
addr == 16'h44f ? 16'he00f :  // <0082> jmp :done
addr == 16'h450 ? 16'h046a :  // <0082> "


// transition to plan_run if engine block temp sensor is valid, and temp
// exceeds warmup_success_temp_adc.
addr == 16'h451 ? 16'h0202 :  // <0087> a = $anmux_engine_block_temp

addr == 16'h452 ? 16'h0351 :  // <0088> a = a<<1
addr == 16'h453 ? 16'h0616 :  // <0088> b = 22
addr == 16'h454 ? 16'h6600 :  // <0088> av_ad_hi = 0
addr == 16'h455 ? 16'h6b00 :  // <0088> av_ad_lo = ad0
addr == 16'h456 ? 16'h0417 :  // <0088> b = av_write_data
addr == 16'h457 ? 16'h0418 :  // <0088> b = av_read_data

addr == 16'h458 ? 16'h03a0 :  // <0089> a = $temp_ceiling_adc
addr == 16'h459 ? 16'h0ff0 :  // <0089> "

addr == 16'h45a ? 16'h0000 :  // <0096> a = a
addr == 16'h45b ? 16'h0401 :  // <0096> b = b

addr == 16'h45c ? 16'he406 :  // <0090> bn gt :else_1116
addr == 16'h45d ? 16'h046a :  // <0090> "

addr == 16'h45e ? 16'h03a0 :  // <0091> a = $warmup_success_temp_adc
addr == 16'h45f ? 16'h04c0 :  // <0091> "

addr == 16'h460 ? 16'h0000 :  // <0095> a = a
addr == 16'h461 ? 16'h0401 :  // <0095> b = b

addr == 16'h462 ? 16'he405 :  // <0092> bn lt :else_1122
addr == 16'h463 ? 16'h046a :  // <0092> "

addr == 16'h464 ? 16'hfba0 :  // <0093> callx  destroy_plan_warmup
addr == 16'h465 ? 16'h0403 :  // <0093> "
addr == 16'h466 ? 16'hfc00 :  // <0093> "
addr == 16'h467 ? 16'hfba0 :  // <0094> callx  init_plan_run
addr == 16'h468 ? 16'h06ed :  // <0094> "
addr == 16'h469 ? 16'hfc00 :  // <0094> "



// :done // = 0x046a

addr == 16'h46a ? 16'hf80c :  // <0100> pop rtna // func leave_warmup
addr == 16'h46b ? 16'hfc00 :  // <0100> swapra = nop



// :rpm_cells // = 0x046c
addr == 16'h46c ? 16'h01f4 :  // <0004> 500
addr == 16'h46d ? 16'h0271 :  // <0005> 625
addr == 16'h46e ? 16'h030d :  // <0006> 781
addr == 16'h46f ? 16'h03d1 :  // <0007> 977
addr == 16'h470 ? 16'h04c5 :  // <0008> 1221
addr == 16'h471 ? 16'h05f6 :  // <0009> 1526
addr == 16'h472 ? 16'h0773 :  // <0010> 1907
addr == 16'h473 ? 16'h0950 :  // <0011> 2384
addr == 16'h474 ? 16'h0ba4 :  // <0012> 2980
addr == 16'h475 ? 16'h0e8d :  // <0013> 3725
addr == 16'h476 ? 16'h1231 :  // <0014> 4657
addr == 16'h477 ? 16'h16bd :  // <0015> 5821
addr == 16'h478 ? 16'h1c6c :  // <0016> 7276
addr == 16'h479 ? 16'hffff :  // <0017> 0xffff




// trim puff length by o2 sensor every 200 ms.

// trim puff length as needed.

// o2 sensor interpetation & state machine.

// default maps
// :default_tps_reference // = 0x047a
addr == 16'h47a ? 16'h0100 :  // <0064> 0x0100
addr == 16'h47b ? 16'h0540 :  // <0065> 0x0540
addr == 16'h47c ? 16'h0540 :  // <0066> 0x0540
addr == 16'h47d ? 16'h0540 :  // <0067> 0x0540
addr == 16'h47e ? 16'h0540 :  // <0068> 0x0540
addr == 16'h47f ? 16'h0540 :  // <0069> 0x0540
addr == 16'h480 ? 16'h0540 :  // <0070> 0x0540
addr == 16'h481 ? 16'h0540 :  // <0071> 0x0540
addr == 16'h482 ? 16'h0540 :  // <0072> 0x0540
addr == 16'h483 ? 16'h0540 :  // <0073> 0x0540
addr == 16'h484 ? 16'h0540 :  // <0074> 0x0540
addr == 16'h485 ? 16'h0540 :  // <0075> 0x0540
addr == 16'h486 ? 16'h0b00 :  // <0076> 0x0b00

// :plan_name_learn_stoich // = 0x0487
// "LN\x0"
addr == 16'h487 ? 16'h4e4c :  // <0079> NL
addr == 16'h488 ? 16'h0000 :  // <0079>   

// ######## func init_plan_learn_stoich // = 0x0489

// set up the learn_stoich plan.
addr == 16'h489 ? 16'h6600 :  // <0083> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_ad_hi = 0
addr == 16'h48a ? 16'h6ba0 :  // <0083> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_ad_lo = 348
addr == 16'h48b ? 16'h015c :  // <0083> "
addr == 16'h48c ? 16'h5e0a :  // <0083> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_write_data = 10

// memorize state.
addr == 16'h48d ? 16'h6600 :  // <0086> ram $ram_plan_name = :plan_name_learn_stoich // av_ad_hi = 0
addr == 16'h48e ? 16'h6a88 :  // <0086> ram $ram_plan_name = :plan_name_learn_stoich // av_ad_lo = 136
addr == 16'h48f ? 16'h5fa0 :  // <0086> ram $ram_plan_name = :plan_name_learn_stoich // av_write_data = :plan_name_learn_stoich
addr == 16'h490 ? 16'h0487 :  // <0086> "
addr == 16'h491 ? 16'h6600 :  // <0087> ram $ram_puff_len_func = :puff_len_learn_stoich // av_ad_hi = 0
addr == 16'h492 ? 16'h6a8a :  // <0087> ram $ram_puff_len_func = :puff_len_learn_stoich // av_ad_lo = 138
addr == 16'h493 ? 16'h5fa0 :  // <0087> ram $ram_puff_len_func = :puff_len_learn_stoich // av_write_data = :puff_len_learn_stoich
addr == 16'h494 ? 16'h04a3 :  // <0087> "
addr == 16'h495 ? 16'h6600 :  // <0088> ram $ram_transition_func = :leave_learn_stoich // av_ad_hi = 0
addr == 16'h496 ? 16'h6a8c :  // <0088> ram $ram_transition_func = :leave_learn_stoich // av_ad_lo = 140
addr == 16'h497 ? 16'h5fa0 :  // <0088> ram $ram_transition_func = :leave_learn_stoich // av_write_data = :leave_learn_stoich
addr == 16'h498 ? 16'h05ad :  // <0088> "
addr == 16'h499 ? 16'h6600 :  // <0089> ram $ram_destroy_plan_func = :destroy_plan_learn_stoich // av_ad_hi = 0
addr == 16'h49a ? 16'h6a8e :  // <0089> ram $ram_destroy_plan_func = :destroy_plan_learn_stoich // av_ad_lo = 142
addr == 16'h49b ? 16'h5fa0 :  // <0089> ram $ram_destroy_plan_func = :destroy_plan_learn_stoich // av_write_data = :destroy_plan_learn_stoich
addr == 16'h49c ? 16'h049e :  // <0089> "

addr == 16'h49d ? 16'hfc00 :  // <0091> swapra = nop

// ######## func destroy_plan_learn_stoich // = 0x049e


addr == 16'h49e ? 16'hfc00 :  // <0094> swapra = nop

// :lrns_trim_up_msg // = 0x049f
// "trR\x0"
addr == 16'h49f ? 16'h7274 :  // <0096> rt
addr == 16'h4a0 ? 16'h0052 :  // <0096>  R
// :lrns_trim_down_msg // = 0x04a1
// "trL\x0"
addr == 16'h4a1 ? 16'h7274 :  // <0098> rt
addr == 16'h4a2 ? 16'h004c :  // <0098>  L

// ######## func puff_len_learn_stoich // = 0x04a3
addr == 16'h4a3 ? 16'h3002 :  // <0133> push i // func puff_len_learn_stoich
addr == 16'h4a4 ? 16'h3003 :  // <0133> push j // "
addr == 16'h4a5 ? 16'h3006 :  // <0133> push g6 // "
addr == 16'h4a6 ? 16'h3007 :  // <0133> push g7 // "
addr == 16'h4a7 ? 16'h303e :  // <0133> push rtna // "

addr == 16'h4a8 ? 16'h6600 :  // <0101> ram i = $ram_lrns_ticks_remain // av_ad_hi = 0
addr == 16'h4a9 ? 16'h6ba0 :  // <0101> ram i = $ram_lrns_ticks_remain // av_ad_lo = 348
addr == 16'h4aa ? 16'h015c :  // <0101> "
addr == 16'h4ab ? 16'h0817 :  // <0101> ram i = $ram_lrns_ticks_remain // i = av_write_data // start read cycle
addr == 16'h4ac ? 16'h0818 :  // <0101> ram i = $ram_lrns_ticks_remain // i = av_read_data // finish read cycle

addr == 16'h4ad ? 16'h0002 :  // <0132> a = i
addr == 16'h4ae ? 16'h0600 :  // <0132> b = 0

addr == 16'h4af ? 16'he406 :  // <0102> bn gt :else_1199
addr == 16'h4b0 ? 16'h04b9 :  // <0102> "

addr == 16'h4b1 ? 16'h0f60 :  // <0103> j = -1
addr == 16'h4b2 ? 16'h6600 :  // <0104> ram $ram_lrns_ticks_remain = i+j // av_ad_hi = 0
addr == 16'h4b3 ? 16'h6ba0 :  // <0104> ram $ram_lrns_ticks_remain = i+j // av_ad_lo = 348
addr == 16'h4b4 ? 16'h015c :  // <0104> "
addr == 16'h4b5 ? 16'hc800 :  // <0104> ram $ram_lrns_ticks_remain = i+j // av_write_data = i+j
addr == 16'h4b6 ? 16'h5f10 :  // <0104> "

addr == 16'h4b7 ? 16'he00f :  // <0106> jmp :end_1199
addr == 16'h4b8 ? 16'h04f8 :  // <0106> "

addr == 16'h4b9 ? 16'h6600 :  // <0107> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_ad_hi = 0
addr == 16'h4ba ? 16'h6ba0 :  // <0107> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_ad_lo = 348
addr == 16'h4bb ? 16'h015c :  // <0107> "
addr == 16'h4bc ? 16'h5e0a :  // <0107> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_write_data = 10

// i = old puff length, j = puff length increment.
addr == 16'h4bd ? 16'h6600 :  // <0110> ram i = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'h4be ? 16'h6a90 :  // <0110> ram i = $ram_next_puff_len_us // av_ad_lo = 144
addr == 16'h4bf ? 16'h0817 :  // <0110> ram i = $ram_next_puff_len_us // i = av_write_data // start read cycle
addr == 16'h4c0 ? 16'h0818 :  // <0110> ram i = $ram_next_puff_len_us // i = av_read_data // finish read cycle
addr == 16'h4c1 ? 16'h0e00 :  // <0111> j = 0
addr == 16'h4c2 ? 16'h6600 :  // <0112> ram g6 = $ram_o2_state // av_ad_hi = 0
addr == 16'h4c3 ? 16'h6ba0 :  // <0112> ram g6 = $ram_o2_state // av_ad_lo = 350
addr == 16'h4c4 ? 16'h015e :  // <0112> "
addr == 16'h4c5 ? 16'h1817 :  // <0112> ram g6 = $ram_o2_state // g6 = av_write_data // start read cycle
addr == 16'h4c6 ? 16'h1818 :  // <0112> ram g6 = $ram_o2_state // g6 = av_read_data // finish read cycle
addr == 16'h4c7 ? 16'hfba0 :  // <0113> callx  interpret_o2
addr == 16'h4c8 ? 16'h0568 :  // <0113> "
addr == 16'h4c9 ? 16'hfc00 :  // <0113> "
addr == 16'h4ca ? 16'h6600 :  // <0114> ram g7 = $ram_o2_state // av_ad_hi = 0
addr == 16'h4cb ? 16'h6ba0 :  // <0114> ram g7 = $ram_o2_state // av_ad_lo = 350
addr == 16'h4cc ? 16'h015e :  // <0114> "
addr == 16'h4cd ? 16'h1c17 :  // <0114> ram g7 = $ram_o2_state // g7 = av_write_data // start read cycle
addr == 16'h4ce ? 16'h1c18 :  // <0114> ram g7 = $ram_o2_state // g7 = av_read_data // finish read cycle

addr == 16'h4cf ? 16'h0007 :  // <0131> a = g7
addr == 16'h4d0 ? 16'h0601 :  // <0131> b = 1

addr == 16'h4d1 ? 16'he407 :  // <0115> bn eq :else_1233
addr == 16'h4d2 ? 16'h04e8 :  // <0115> "

// sensing a lean condition.  trim up to enrich.

addr == 16'h4d3 ? 16'h0002 :  // <0119> a = i
addr == 16'h4d4 ? 16'h07a0 :  // <0119> b = 10000
addr == 16'h4d5 ? 16'h2710 :  // <0119> "

addr == 16'h4d6 ? 16'he405 :  // <0117> bn lt :else_1238
addr == 16'h4d7 ? 16'h04da :  // <0117> "

addr == 16'h4d8 ? 16'h0fa0 :  // <0118> j = $lrns_puff_step_up_us
addr == 16'h4d9 ? 16'h0258 :  // <0118> "

addr == 16'h4da ? 16'h23a0 :  // <0120> pa = :lrns_trim_up_msg
addr == 16'h4db ? 16'h049f :  // <0120> "
addr == 16'h4dc ? 16'hfba0 :  // <0120> callx  set_text_flag  :lrns_trim_up_msg
addr == 16'h4dd ? 16'h0b51 :  // <0120> "
addr == 16'h4de ? 16'hfc00 :  // <0120> "

addr == 16'h4df ? 16'h0006 :  // <0124> a = g6
addr == 16'h4e0 ? 16'h0602 :  // <0124> b = 2

addr == 16'h4e1 ? 16'he407 :  // <0121> bn eq :else_1249
addr == 16'h4e2 ? 16'h04e6 :  // <0121> "

// o2 state just switched to lean.  adjust map.
addr == 16'h4e3 ? 16'hfba0 :  // <0123> callx  learn_smap
addr == 16'h4e4 ? 16'h0504 :  // <0123> "
addr == 16'h4e5 ? 16'hfc00 :  // <0123> "


addr == 16'h4e6 ? 16'he00f :  // <0126> jmp :end_1233
addr == 16'h4e7 ? 16'h04f4 :  // <0126> "

// sensing a rich condition.  trim down to lean it out.

addr == 16'h4e8 ? 16'h0002 :  // <0130> a = i
addr == 16'h4e9 ? 16'h07a0 :  // <0130> b = 2000
addr == 16'h4ea ? 16'h07d0 :  // <0130> "

addr == 16'h4eb ? 16'he406 :  // <0128> bn gt :else_1259
addr == 16'h4ec ? 16'h04ef :  // <0128> "

addr == 16'h4ed ? 16'h0fa0 :  // <0129> j = $lrns_puff_step_down_us
addr == 16'h4ee ? 16'hffdf :  // <0129> "

addr == 16'h4ef ? 16'h23a0 :  // <0131> pa = :lrns_trim_down_msg
addr == 16'h4f0 ? 16'h04a1 :  // <0131> "
addr == 16'h4f1 ? 16'hfba0 :  // <0131> callx  set_text_flag  :lrns_trim_down_msg
addr == 16'h4f2 ? 16'h0b51 :  // <0131> "
addr == 16'h4f3 ? 16'hfc00 :  // <0131> "

addr == 16'h4f4 ? 16'h6600 :  // <0132> ram $ram_next_puff_len_us = i+j // av_ad_hi = 0
addr == 16'h4f5 ? 16'h6a90 :  // <0132> ram $ram_next_puff_len_us = i+j // av_ad_lo = 144
addr == 16'h4f6 ? 16'hc800 :  // <0132> ram $ram_next_puff_len_us = i+j // av_write_data = i+j
addr == 16'h4f7 ? 16'h5f10 :  // <0132> "


addr == 16'h4f8 ? 16'hf80c :  // <0134> pop rtna // func puff_len_learn_stoich
addr == 16'h4f9 ? 16'h1c0c :  // <0134> pop g7 // "
addr == 16'h4fa ? 16'h180c :  // <0134> pop g6 // "
addr == 16'h4fb ? 16'h0c0c :  // <0134> pop j // "
addr == 16'h4fc ? 16'h080c :  // <0134> pop i // "
addr == 16'h4fd ? 16'hfc00 :  // <0134> swapra = nop

// :lrns_enrich_msg // = 0x04fe
// "lrnR\x0"
addr == 16'h4fe ? 16'h726c :  // <0136> rl
addr == 16'h4ff ? 16'h526e :  // <0136> Rn
addr == 16'h500 ? 16'h0000 :  // <0136>   
// :lrns_lean_msg // = 0x0501
// "lrnL\x0"
addr == 16'h501 ? 16'h726c :  // <0138> rl
addr == 16'h502 ? 16'h4c6e :  // <0138> Ln
addr == 16'h503 ? 16'h0000 :  // <0138>   

// ######## func learn_smap // = 0x0504
addr == 16'h504 ? 16'h3002 :  // <0175> push i // func learn_smap
addr == 16'h505 ? 16'h3004 :  // <0175> push x // "
addr == 16'h506 ? 16'h3005 :  // <0175> push y // "
addr == 16'h507 ? 16'h303e :  // <0175> push rtna // "

addr == 16'h508 ? 16'h6600 :  // <0141> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h509 ? 16'h6a7e :  // <0141> ram a = $ram_rpm_valid // av_ad_lo = 126
addr == 16'h50a ? 16'h0017 :  // <0141> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h50b ? 16'h0018 :  // <0141> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle

addr == 16'h50c ? 16'h0000 :  // <0174> a = a
addr == 16'h50d ? 16'h0601 :  // <0174> b = 1

addr == 16'h50e ? 16'he407 :  // <0142> bn eq :else_1294
addr == 16'h50f ? 16'h055f :  // <0142> "

// let g6 = map cell num.  x = map puff len.  i = observed stoich puff len.
addr == 16'h510 ? 16'h6600 :  // <0144> ram pa = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h511 ? 16'h6a7c :  // <0144> ram pa = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h512 ? 16'h2017 :  // <0144> ram pa = $ram_avg_rpm // pa = av_write_data // start read cycle
addr == 16'h513 ? 16'h2018 :  // <0144> ram pa = $ram_avg_rpm // pa = av_read_data // finish read cycle
addr == 16'h514 ? 16'hfba0 :  // <0145> callx  find_rpm_cell  pa  g6
addr == 16'h515 ? 16'h05b3 :  // <0145> "
addr == 16'h516 ? 16'hfc00 :  // <0145> "
addr == 16'h517 ? 16'h1808 :  // <0145> g6 = pa
addr == 16'h518 ? 16'h0006 :  // <0146> a = g6

addr == 16'h519 ? 16'h0351 :  // <0147> a = a<<1
addr == 16'h51a ? 16'h0698 :  // <0147> b = 152
addr == 16'h51b ? 16'h6600 :  // <0147> av_ad_hi = 0
addr == 16'h51c ? 16'h6b00 :  // <0147> av_ad_lo = ad0
addr == 16'h51d ? 16'h0417 :  // <0147> b = av_write_data
addr == 16'h51e ? 16'h0418 :  // <0147> b = av_read_data

addr == 16'h51f ? 16'h1001 :  // <0148> x = b
addr == 16'h520 ? 16'h6600 :  // <0149> ram i = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'h521 ? 16'h6a90 :  // <0149> ram i = $ram_next_puff_len_us // av_ad_lo = 144
addr == 16'h522 ? 16'h0817 :  // <0149> ram i = $ram_next_puff_len_us // i = av_write_data // start read cycle
addr == 16'h523 ? 16'h0818 :  // <0149> ram i = $ram_next_puff_len_us // i = av_read_data // finish read cycle
addr == 16'h524 ? 16'h17a0 :  // <0150> y = (0xffff - $lrns_map_step + 1)
addr == 16'h525 ? 16'hff38 :  // <0150> "

addr == 16'h526 ? 16'hc800 :  // <0157> a = x+y
addr == 16'h527 ? 16'h0320 :  // <0157> "
addr == 16'h528 ? 16'h0402 :  // <0157> b = i

addr == 16'h529 ? 16'he406 :  // <0151> bn gt :else_1321
addr == 16'h52a ? 16'h0539 :  // <0151> "

// map is richer than observed stoich.  lean the map 1 step.
addr == 16'h52b ? 16'h0006 :  // <0153> a = g6
addr == 16'h52c ? 16'hc800 :  // <0154> b = x+y
addr == 16'h52d ? 16'h0720 :  // <0154> "

addr == 16'h52e ? 16'h0351 :  // <0155> a = a<<1
addr == 16'h52f ? 16'h3001 :  // <0155> push b // push b
addr == 16'h530 ? 16'h0698 :  // <0155> b = 152
addr == 16'h531 ? 16'h6600 :  // <0155> av_ad_hi = 0
addr == 16'h532 ? 16'h6b00 :  // <0155> av_ad_lo = ad0
addr == 16'h533 ? 16'h5c0c :  // <0155> pop av_write_data // pop av_write_data

addr == 16'h534 ? 16'h23a0 :  // <0156> pa = :lrns_lean_msg
addr == 16'h535 ? 16'h0501 :  // <0156> "
addr == 16'h536 ? 16'hfba0 :  // <0156> callx  set_text_flag  :lrns_lean_msg
addr == 16'h537 ? 16'h0b51 :  // <0156> "
addr == 16'h538 ? 16'hfc00 :  // <0156> "

addr == 16'h539 ? 16'h16c8 :  // <0158> y = $lrns_map_step

addr == 16'h53a ? 16'hc800 :  // <0165> a = x+y
addr == 16'h53b ? 16'h0320 :  // <0165> "
addr == 16'h53c ? 16'h0402 :  // <0165> b = i

addr == 16'h53d ? 16'he405 :  // <0159> bn lt :else_1341
addr == 16'h53e ? 16'h054d :  // <0159> "

// map is leaner than observed stoich.  rich the map 1 step.
addr == 16'h53f ? 16'h0006 :  // <0161> a = g6
addr == 16'h540 ? 16'hc800 :  // <0162> b = x+y
addr == 16'h541 ? 16'h0720 :  // <0162> "

addr == 16'h542 ? 16'h0351 :  // <0163> a = a<<1
addr == 16'h543 ? 16'h3001 :  // <0163> push b // push b
addr == 16'h544 ? 16'h0698 :  // <0163> b = 152
addr == 16'h545 ? 16'h6600 :  // <0163> av_ad_hi = 0
addr == 16'h546 ? 16'h6b00 :  // <0163> av_ad_lo = ad0
addr == 16'h547 ? 16'h5c0c :  // <0163> pop av_write_data // pop av_write_data

addr == 16'h548 ? 16'h23a0 :  // <0164> pa = :lrns_enrich_msg
addr == 16'h549 ? 16'h04fe :  // <0164> "
addr == 16'h54a ? 16'hfba0 :  // <0164> callx  set_text_flag  :lrns_enrich_msg
addr == 16'h54b ? 16'h0b51 :  // <0164> "
addr == 16'h54c ? 16'hfc00 :  // <0164> "


// dump smap if we haven't done so lately.
addr == 16'h54d ? 16'h6600 :  // <0168> ram a = $ram_last_learn_second // av_ad_hi = 0
addr == 16'h54e ? 16'h6ab2 :  // <0168> ram a = $ram_last_learn_second // av_ad_lo = 178
addr == 16'h54f ? 16'h0017 :  // <0168> ram a = $ram_last_learn_second // a = av_write_data // start read cycle
addr == 16'h550 ? 16'h0018 :  // <0168> ram a = $ram_last_learn_second // a = av_read_data // finish read cycle
addr == 16'h551 ? 16'h6600 :  // <0169> ram b = $ram_seconds_cnt // av_ad_hi = 0
addr == 16'h552 ? 16'h6a42 :  // <0169> ram b = $ram_seconds_cnt // av_ad_lo = 66
addr == 16'h553 ? 16'h0417 :  // <0169> ram b = $ram_seconds_cnt // b = av_write_data // start read cycle
addr == 16'h554 ? 16'h0418 :  // <0169> ram b = $ram_seconds_cnt // b = av_read_data // finish read cycle

addr == 16'h555 ? 16'h0000 :  // <0173> a = a
addr == 16'h556 ? 16'h0401 :  // <0173> b = b

addr == 16'h557 ? 16'he007 :  // <0170> br eq :else_1367
addr == 16'h558 ? 16'h055f :  // <0170> "

addr == 16'h559 ? 16'h6600 :  // <0171> ram $ram_last_learn_second = b // av_ad_hi = 0
addr == 16'h55a ? 16'h6ab2 :  // <0171> ram $ram_last_learn_second = b // av_ad_lo = 178
addr == 16'h55b ? 16'h5c01 :  // <0171> ram $ram_last_learn_second = b // av_write_data = b
addr == 16'h55c ? 16'hfba0 :  // <0172> callx  dump_smap_cmd
addr == 16'h55d ? 16'h05d0 :  // <0172> "
addr == 16'h55e ? 16'hfc00 :  // <0172> "



addr == 16'h55f ? 16'hf80c :  // <0176> pop rtna // func learn_smap
addr == 16'h560 ? 16'h140c :  // <0176> pop y // "
addr == 16'h561 ? 16'h100c :  // <0176> pop x // "
addr == 16'h562 ? 16'h080c :  // <0176> pop i // "
addr == 16'h563 ? 16'hfc00 :  // <0176> swapra = nop

// :o2_rich_msg // = 0x0564
// "o2R\x0"
addr == 16'h564 ? 16'h326f :  // <0178> 2o
addr == 16'h565 ? 16'h0052 :  // <0178>  R
// :o2_lean_msg // = 0x0566
// "o2L\x0"
addr == 16'h566 ? 16'h326f :  // <0180> 2o
addr == 16'h567 ? 16'h004c :  // <0180>  L

// ######## func interpret_o2 // = 0x0568

addr == 16'h568 ? 16'h6600 :  // <0183> ram a = $ram_o2_state // av_ad_hi = 0
addr == 16'h569 ? 16'h6ba0 :  // <0183> ram a = $ram_o2_state // av_ad_lo = 350
addr == 16'h56a ? 16'h015e :  // <0183> "
addr == 16'h56b ? 16'h0017 :  // <0183> ram a = $ram_o2_state // a = av_write_data // start read cycle
addr == 16'h56c ? 16'h0018 :  // <0183> ram a = $ram_o2_state // a = av_read_data // finish read cycle

addr == 16'h56d ? 16'h0000 :  // <0194> a = a
addr == 16'h56e ? 16'h0601 :  // <0194> b = 1

addr == 16'h56f ? 16'he007 :  // <0184> br eq :else_1391
addr == 16'h570 ? 16'h0586 :  // <0184> "

// check sensor for lean state.
addr == 16'h571 ? 16'h0205 :  // <0186> a = $o2_adc_channel

addr == 16'h572 ? 16'h0351 :  // <0187> a = a<<1
addr == 16'h573 ? 16'h0626 :  // <0187> b = 38
addr == 16'h574 ? 16'h6600 :  // <0187> av_ad_hi = 0
addr == 16'h575 ? 16'h6b00 :  // <0187> av_ad_lo = ad0
addr == 16'h576 ? 16'h0417 :  // <0187> b = av_write_data
addr == 16'h577 ? 16'h0418 :  // <0187> b = av_read_data

addr == 16'h578 ? 16'h03a0 :  // <0188> a = $o2_lean_thresh_adc
addr == 16'h579 ? 16'h01c2 :  // <0188> "

addr == 16'h57a ? 16'h0000 :  // <0193> a = a
addr == 16'h57b ? 16'h0401 :  // <0193> b = b

addr == 16'h57c ? 16'he406 :  // <0189> bn gt :else_1404
addr == 16'h57d ? 16'h0586 :  // <0189> "

addr == 16'h57e ? 16'h6600 :  // <0190> ram $ram_o2_state = $o2_state_lean // av_ad_hi = 0
addr == 16'h57f ? 16'h6ba0 :  // <0190> ram $ram_o2_state = $o2_state_lean // av_ad_lo = 350
addr == 16'h580 ? 16'h015e :  // <0190> "
addr == 16'h581 ? 16'h5e01 :  // <0190> ram $ram_o2_state = $o2_state_lean // av_write_data = 1
addr == 16'h582 ? 16'h6600 :  // <0191> ram $ram_o2_been_lean = 1 // av_ad_hi = 0
addr == 16'h583 ? 16'h6ba0 :  // <0191> ram $ram_o2_been_lean = 1 // av_ad_lo = 354
addr == 16'h584 ? 16'h0162 :  // <0191> "
addr == 16'h585 ? 16'h5e01 :  // <0191> ram $ram_o2_been_lean = 1 // av_write_data = 1
// callx  set_text_flag  :o2_lean_msg



addr == 16'h586 ? 16'h0000 :  // <0205> a = a
addr == 16'h587 ? 16'h0602 :  // <0205> b = 2

addr == 16'h588 ? 16'he007 :  // <0195> br eq :else_1416
addr == 16'h589 ? 16'h059f :  // <0195> "

// check sensor for rich state.
addr == 16'h58a ? 16'h0205 :  // <0197> a = $o2_adc_channel

addr == 16'h58b ? 16'h0351 :  // <0198> a = a<<1
addr == 16'h58c ? 16'h0626 :  // <0198> b = 38
addr == 16'h58d ? 16'h6600 :  // <0198> av_ad_hi = 0
addr == 16'h58e ? 16'h6b00 :  // <0198> av_ad_lo = ad0
addr == 16'h58f ? 16'h0417 :  // <0198> b = av_write_data
addr == 16'h590 ? 16'h0418 :  // <0198> b = av_read_data

addr == 16'h591 ? 16'h03a0 :  // <0199> a = $o2_rich_thresh_adc
addr == 16'h592 ? 16'h02bc :  // <0199> "

addr == 16'h593 ? 16'h0000 :  // <0204> a = a
addr == 16'h594 ? 16'h0401 :  // <0204> b = b

addr == 16'h595 ? 16'he405 :  // <0200> bn lt :else_1429
addr == 16'h596 ? 16'h059f :  // <0200> "

addr == 16'h597 ? 16'h6600 :  // <0201> ram $ram_o2_state = $o2_state_rich // av_ad_hi = 0
addr == 16'h598 ? 16'h6ba0 :  // <0201> ram $ram_o2_state = $o2_state_rich // av_ad_lo = 350
addr == 16'h599 ? 16'h015e :  // <0201> "
addr == 16'h59a ? 16'h5e02 :  // <0201> ram $ram_o2_state = $o2_state_rich // av_write_data = 2
addr == 16'h59b ? 16'h6600 :  // <0202> ram $ram_o2_been_rich = 1 // av_ad_hi = 0
addr == 16'h59c ? 16'h6ba0 :  // <0202> ram $ram_o2_been_rich = 1 // av_ad_lo = 352
addr == 16'h59d ? 16'h0160 :  // <0202> "
addr == 16'h59e ? 16'h5e01 :  // <0202> ram $ram_o2_been_rich = 1 // av_write_data = 1
// callx  set_text_flag  :o2_rich_msg



addr == 16'h59f ? 16'hfc00 :  // <0207> swapra = nop

// ######## func init_o2_state // = 0x05a0

addr == 16'h5a0 ? 16'h6600 :  // <0209> ram $ram_o2_state = $o2_state_init // av_ad_hi = 0
addr == 16'h5a1 ? 16'h6ba0 :  // <0209> ram $ram_o2_state = $o2_state_init // av_ad_lo = 350
addr == 16'h5a2 ? 16'h015e :  // <0209> "
addr == 16'h5a3 ? 16'h5e00 :  // <0209> ram $ram_o2_state = $o2_state_init // av_write_data = 0
addr == 16'h5a4 ? 16'h6600 :  // <0210> ram $ram_o2_been_lean = 0 // av_ad_hi = 0
addr == 16'h5a5 ? 16'h6ba0 :  // <0210> ram $ram_o2_been_lean = 0 // av_ad_lo = 354
addr == 16'h5a6 ? 16'h0162 :  // <0210> "
addr == 16'h5a7 ? 16'h5e00 :  // <0210> ram $ram_o2_been_lean = 0 // av_write_data = 0
addr == 16'h5a8 ? 16'h6600 :  // <0211> ram $ram_o2_been_rich = 0 // av_ad_hi = 0
addr == 16'h5a9 ? 16'h6ba0 :  // <0211> ram $ram_o2_been_rich = 0 // av_ad_lo = 352
addr == 16'h5aa ? 16'h0160 :  // <0211> "
addr == 16'h5ab ? 16'h5e00 :  // <0211> ram $ram_o2_been_rich = 0 // av_write_data = 0

addr == 16'h5ac ? 16'hfc00 :  // <0213> swapra = nop

// ######## func leave_learn_stoich // = 0x05ad
addr == 16'h5ad ? 16'h303e :  // <0216> push rtna // func leave_learn_stoich

addr == 16'h5ae ? 16'hfba0 :  // <0215> callx  check_engine_stop  pa
addr == 16'h5af ? 16'h0c8a :  // <0215> "
addr == 16'h5b0 ? 16'hfc00 :  // <0215> "

addr == 16'h5b1 ? 16'hf80c :  // <0217> pop rtna // func leave_learn_stoich
addr == 16'h5b2 ? 16'hfc00 :  // <0217> swapra = nop

// ######## func find_rpm_cell // = 0x05b3
addr == 16'h5b3 ? 16'h3002 :  // <0234> push i // func find_rpm_cell
addr == 16'h5b4 ? 16'h3003 :  // <0234> push j // "

addr == 16'h5b5 ? 16'h0a01 :  // <0219> i = 1
addr == 16'h5b6 ? 16'h0008 :  // <0220> a = rpm
addr == 16'h5b7 ? 16'h0760 :  // <0221> b = 0xffff
addr == 16'h5b8 ? 16'he007 :  // <0222> br eq :found
addr == 16'h5b9 ? 16'h05c7 :  // <0222> "
// :next_cell // = 0x05ba
addr == 16'h5ba ? 16'h0fa0 :  // <0224> j = :rpm_cells
addr == 16'h5bb ? 16'h046c :  // <0224> "
addr == 16'h5bc ? 16'hc800 :  // <0225> fetch a from i+j
addr == 16'h5bd ? 16'hd310 :  // <0225> "
addr == 16'h5be ? 16'h03b0 :  // <0225> "
addr == 16'h5bf ? 16'h0408 :  // <0226> b = rpm
addr == 16'h5c0 ? 16'he006 :  // <0227> br gt :found
addr == 16'h5c1 ? 16'h05c7 :  // <0227> "
addr == 16'h5c2 ? 16'h0e01 :  // <0228> j = 1
addr == 16'h5c3 ? 16'hc800 :  // <0229> i = i+j
addr == 16'h5c4 ? 16'h0b10 :  // <0229> "
addr == 16'h5c5 ? 16'he00f :  // <0230> jmp :next_cell
addr == 16'h5c6 ? 16'h05ba :  // <0230> "
// :found // = 0x05c7
addr == 16'h5c7 ? 16'h0f60 :  // <0232> j = -1
addr == 16'h5c8 ? 16'hc800 :  // <0233> cell = i+j
addr == 16'h5c9 ? 16'h2310 :  // <0233> "
addr == 16'h5ca ? 16'h0c0c :  // <0233> pop j // rtn i+j
addr == 16'h5cb ? 16'h080c :  // <0233> pop i // "
addr == 16'h5cc ? 16'hfc00 :  // <0232> swapra = nop

addr == 16'h5cd ? 16'h0c0c :  // <0235> pop j // func find_rpm_cell
addr == 16'h5ce ? 16'h080c :  // <0235> pop i // "
addr == 16'h5cf ? 16'hfc00 :  // <0235> swapra = nop

// ######## func dump_smap_cmd // = 0x05d0
addr == 16'h5d0 ? 16'h3004 :  // <0274> push x // func dump_smap_cmd
addr == 16'h5d1 ? 16'h303e :  // <0274> push rtna // "

addr == 16'h5d2 ? 16'h020d :  // <0237> a = 13 // puteol
addr == 16'h5d3 ? 16'hfba0 :  // <0237> puteol
addr == 16'h5d4 ? 16'h00ab :  // <0237> "
addr == 16'h5d5 ? 16'hfc00 :  // <0237> "
addr == 16'h5d6 ? 16'h020a :  // <0237> a = 10 // puteol
addr == 16'h5d7 ? 16'hfba0 :  // <0237> puteol
addr == 16'h5d8 ? 16'h00ab :  // <0237> "
addr == 16'h5d9 ? 16'hfc00 :  // <0237> "
addr == 16'h5da ? 16'h6600 :  // <0238> ram pa = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h5db ? 16'h6a7c :  // <0238> ram pa = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h5dc ? 16'h2017 :  // <0238> ram pa = $ram_avg_rpm // pa = av_write_data // start read cycle
addr == 16'h5dd ? 16'h2018 :  // <0238> ram pa = $ram_avg_rpm // pa = av_read_data // finish read cycle
addr == 16'h5de ? 16'hfba0 :  // <0239> callx  find_rpm_cell  pa  pa
addr == 16'h5df ? 16'h05b3 :  // <0239> "
addr == 16'h5e0 ? 16'hfc00 :  // <0239> "
addr == 16'h5e1 ? 16'h1200 :  // <0249> x = 0
// :loop_1505 // = 0x05e2

addr == 16'h5e2 ? 16'h0004 :  // <0240> a = x

addr == 16'h5e3 ? 16'h0351 :  // <0241> a = a<<1
addr == 16'h5e4 ? 16'h0698 :  // <0241> b = 152
addr == 16'h5e5 ? 16'h6600 :  // <0241> av_ad_hi = 0
addr == 16'h5e6 ? 16'h6b00 :  // <0241> av_ad_lo = ad0
addr == 16'h5e7 ? 16'h0417 :  // <0241> b = av_write_data
addr == 16'h5e8 ? 16'h0418 :  // <0241> b = av_read_data

addr == 16'h5e9 ? 16'h0001 :  // <0242> a = b
addr == 16'h5ea ? 16'hfba0 :  // <0243> call put4x
addr == 16'h5eb ? 16'h00d3 :  // <0243> "
addr == 16'h5ec ? 16'hfc00 :  // <0243> "

addr == 16'h5ed ? 16'h0004 :  // <0246> a = x
addr == 16'h5ee ? 16'h0408 :  // <0246> b = pa

addr == 16'h5ef ? 16'he407 :  // <0244> bn eq :else_1519
addr == 16'h5f0 ? 16'h05f5 :  // <0244> "

addr == 16'h5f1 ? 16'h023c :  // <0245> a = 60 // putasc "<"
addr == 16'h5f2 ? 16'hfba0 :  // <0245> putasc "<"
addr == 16'h5f3 ? 16'h00ab :  // <0245> "
addr == 16'h5f4 ? 16'hfc00 :  // <0245> "

addr == 16'h5f5 ? 16'h0220 :  // <0247> a = 32 // putasc " "
addr == 16'h5f6 ? 16'hfba0 :  // <0247> putasc " "
addr == 16'h5f7 ? 16'h00ab :  // <0247> "
addr == 16'h5f8 ? 16'hfc00 :  // <0247> "


addr == 16'h5f9 ? 16'h0004 :  // <0249> a = x
addr == 16'h5fa ? 16'h0601 :  // <0249> b = 1
addr == 16'h5fb ? 16'hc800 :  // <0249> x = a+b
addr == 16'h5fc ? 16'h1300 :  // <0249> "


addr == 16'h5fd ? 16'h0004 :  // <0249> a = x
addr == 16'h5fe ? 16'h060d :  // <0249> b = $num_rpm_cells
addr == 16'h5ff ? 16'he005 :  // <0249> br lt :loop_1505
addr == 16'h600 ? 16'h05e2 :  // <0249> "

// :end_1505 // = 0x0601
addr == 16'h601 ? 16'h020d :  // <0250> a = 13 // puteol
addr == 16'h602 ? 16'hfba0 :  // <0250> puteol
addr == 16'h603 ? 16'h00ab :  // <0250> "
addr == 16'h604 ? 16'hfc00 :  // <0250> "
addr == 16'h605 ? 16'h020a :  // <0250> a = 10 // puteol
addr == 16'h606 ? 16'hfba0 :  // <0250> puteol
addr == 16'h607 ? 16'h00ab :  // <0250> "
addr == 16'h608 ? 16'hfc00 :  // <0250> "
addr == 16'h609 ? 16'h1200 :  // <0260> x = 0
// :loop_1545 // = 0x060a

addr == 16'h60a ? 16'h0004 :  // <0251> a = x

addr == 16'h60b ? 16'h0351 :  // <0252> a = a<<1
addr == 16'h60c ? 16'h06b4 :  // <0252> b = 180
addr == 16'h60d ? 16'h6600 :  // <0252> av_ad_hi = 0
addr == 16'h60e ? 16'h6b00 :  // <0252> av_ad_lo = ad0
addr == 16'h60f ? 16'h0417 :  // <0252> b = av_write_data
addr == 16'h610 ? 16'h0418 :  // <0252> b = av_read_data

addr == 16'h611 ? 16'h0001 :  // <0253> a = b
addr == 16'h612 ? 16'hfba0 :  // <0254> call put4x
addr == 16'h613 ? 16'h00d3 :  // <0254> "
addr == 16'h614 ? 16'hfc00 :  // <0254> "

addr == 16'h615 ? 16'h0004 :  // <0257> a = x
addr == 16'h616 ? 16'h0408 :  // <0257> b = pa

addr == 16'h617 ? 16'he407 :  // <0255> bn eq :else_1559
addr == 16'h618 ? 16'h061d :  // <0255> "

addr == 16'h619 ? 16'h023c :  // <0256> a = 60 // putasc "<"
addr == 16'h61a ? 16'hfba0 :  // <0256> putasc "<"
addr == 16'h61b ? 16'h00ab :  // <0256> "
addr == 16'h61c ? 16'hfc00 :  // <0256> "

addr == 16'h61d ? 16'h0220 :  // <0258> a = 32 // putasc " "
addr == 16'h61e ? 16'hfba0 :  // <0258> putasc " "
addr == 16'h61f ? 16'h00ab :  // <0258> "
addr == 16'h620 ? 16'hfc00 :  // <0258> "


addr == 16'h621 ? 16'h0004 :  // <0260> a = x
addr == 16'h622 ? 16'h0601 :  // <0260> b = 1
addr == 16'h623 ? 16'hc800 :  // <0260> x = a+b
addr == 16'h624 ? 16'h1300 :  // <0260> "


addr == 16'h625 ? 16'h0004 :  // <0260> a = x
addr == 16'h626 ? 16'h060d :  // <0260> b = $num_tps_cells
addr == 16'h627 ? 16'he005 :  // <0260> br lt :loop_1545
addr == 16'h628 ? 16'h060a :  // <0260> "

// :end_1545 // = 0x0629
addr == 16'h629 ? 16'h020d :  // <0261> a = 13 // puteol
addr == 16'h62a ? 16'hfba0 :  // <0261> puteol
addr == 16'h62b ? 16'h00ab :  // <0261> "
addr == 16'h62c ? 16'hfc00 :  // <0261> "
addr == 16'h62d ? 16'h020a :  // <0261> a = 10 // puteol
addr == 16'h62e ? 16'hfba0 :  // <0261> puteol
addr == 16'h62f ? 16'h00ab :  // <0261> "
addr == 16'h630 ? 16'hfc00 :  // <0261> "
// ram pa = $ram_tps_state
// for {x = 0} {x lt $num_tps_states} step y = 1 {
// a = x
// struct_read $ram_tps_enrich_thou
// a = b
// call put4x
// if x eq pa {
// putasc "<"
// }
// putasc " "
// }
// puteol

addr == 16'h631 ? 16'hf80c :  // <0275> pop rtna // func dump_smap_cmd
addr == 16'h632 ? 16'h100c :  // <0275> pop x // "
addr == 16'h633 ? 16'hfc00 :  // <0275> swapra = nop

// ######## func load_tps_enrich_cmd // = 0x0634

// for {i = 0} {i lt $num_tps_states} step j = 1 {
// call  get4x
// b = a
// a = i
// struct_write $ram_tps_enrich_thou
// getchar
// }

addr == 16'h634 ? 16'hfc00 :  // <0285> swapra = nop

// ######## func load_smap_cmd // = 0x0635
addr == 16'h635 ? 16'h3002 :  // <0294> push i // func load_smap_cmd
addr == 16'h636 ? 16'h303e :  // <0294> push rtna // "

addr == 16'h637 ? 16'h0a00 :  // <0293> i = 0
// :loop_1591 // = 0x0638

addr == 16'h638 ? 16'hfba0 :  // <0287> call  get4x
addr == 16'h639 ? 16'h010c :  // <0287> "
addr == 16'h63a ? 16'hfc00 :  // <0287> "
addr == 16'h63b ? 16'h0400 :  // <0288> b = a
addr == 16'h63c ? 16'h0002 :  // <0289> a = i

addr == 16'h63d ? 16'h0351 :  // <0290> a = a<<1
addr == 16'h63e ? 16'h3001 :  // <0290> push b // push b
addr == 16'h63f ? 16'h0698 :  // <0290> b = 152
addr == 16'h640 ? 16'h6600 :  // <0290> av_ad_hi = 0
addr == 16'h641 ? 16'h6b00 :  // <0290> av_ad_lo = ad0
addr == 16'h642 ? 16'h5c0c :  // <0290> pop av_write_data // pop av_write_data

addr == 16'h643 ? 16'hfba0 :  // <0291> getchar
addr == 16'h644 ? 16'h00b4 :  // <0291> "
addr == 16'h645 ? 16'hfc00 :  // <0291> "


addr == 16'h646 ? 16'h0002 :  // <0293> a = i
addr == 16'h647 ? 16'h0601 :  // <0293> b = 1
addr == 16'h648 ? 16'hc800 :  // <0293> i = a+b
addr == 16'h649 ? 16'h0b00 :  // <0293> "


addr == 16'h64a ? 16'h0002 :  // <0293> a = i
addr == 16'h64b ? 16'h060d :  // <0293> b = $num_rpm_cells
addr == 16'h64c ? 16'he005 :  // <0293> br lt :loop_1591
addr == 16'h64d ? 16'h0638 :  // <0293> "

// :end_1591 // = 0x064e

addr == 16'h64e ? 16'hf80c :  // <0295> pop rtna // func load_smap_cmd
addr == 16'h64f ? 16'h080c :  // <0295> pop i // "
addr == 16'h650 ? 16'hfc00 :  // <0295> swapra = nop

// ######## func clear_smap_cmd // = 0x0651
addr == 16'h651 ? 16'h3002 :  // <0302> push i // func clear_smap_cmd

addr == 16'h652 ? 16'h0a00 :  // <0301> i = 0
// :loop_1618 // = 0x0653

addr == 16'h653 ? 16'h0002 :  // <0297> a = i
addr == 16'h654 ? 16'h07a0 :  // <0298> b = 3000
addr == 16'h655 ? 16'h0bb8 :  // <0298> "

addr == 16'h656 ? 16'h0351 :  // <0299> a = a<<1
addr == 16'h657 ? 16'h3001 :  // <0299> push b // push b
addr == 16'h658 ? 16'h0698 :  // <0299> b = 152
addr == 16'h659 ? 16'h6600 :  // <0299> av_ad_hi = 0
addr == 16'h65a ? 16'h6b00 :  // <0299> av_ad_lo = ad0
addr == 16'h65b ? 16'h5c0c :  // <0299> pop av_write_data // pop av_write_data



addr == 16'h65c ? 16'h0002 :  // <0301> a = i
addr == 16'h65d ? 16'h0601 :  // <0301> b = 1
addr == 16'h65e ? 16'hc800 :  // <0301> i = a+b
addr == 16'h65f ? 16'h0b00 :  // <0301> "


addr == 16'h660 ? 16'h0002 :  // <0301> a = i
addr == 16'h661 ? 16'h060d :  // <0301> b = $num_rpm_cells
addr == 16'h662 ? 16'he005 :  // <0301> br lt :loop_1618
addr == 16'h663 ? 16'h0653 :  // <0301> "

// :end_1618 // = 0x0664

addr == 16'h664 ? 16'h080c :  // <0303> pop i // func clear_smap_cmd
addr == 16'h665 ? 16'hfc00 :  // <0303> swapra = nop

// ######## func load_tps_ref_cmd // = 0x0666
addr == 16'h666 ? 16'h3002 :  // <0315> push i // func load_tps_ref_cmd
addr == 16'h667 ? 16'h3006 :  // <0315> push ga // "
addr == 16'h668 ? 16'h303e :  // <0315> push rtna // "

addr == 16'h669 ? 16'h0a00 :  // <0314> i = 0
// :loop_1641 // = 0x066a

addr == 16'h66a ? 16'hfba0 :  // <0305> call  get4x
addr == 16'h66b ? 16'h010c :  // <0305> "
addr == 16'h66c ? 16'hfc00 :  // <0305> "
addr == 16'h66d ? 16'h1800 :  // <0306> ga = a
addr == 16'h66e ? 16'h0400 :  // <0307> b = a
addr == 16'h66f ? 16'h0002 :  // <0308> a = i

addr == 16'h670 ? 16'h0351 :  // <0309> a = a<<1
addr == 16'h671 ? 16'h3001 :  // <0309> push b // push b
addr == 16'h672 ? 16'h06b4 :  // <0309> b = 180
addr == 16'h673 ? 16'h6600 :  // <0309> av_ad_hi = 0
addr == 16'h674 ? 16'h6b00 :  // <0309> av_ad_lo = ad0
addr == 16'h675 ? 16'h5c0c :  // <0309> pop av_write_data // pop av_write_data

addr == 16'h676 ? 16'h0006 :  // <0310> a = ga
addr == 16'h677 ? 16'hfba0 :  // <0311> call put4x
addr == 16'h678 ? 16'h00d3 :  // <0311> "
addr == 16'h679 ? 16'hfc00 :  // <0311> "
addr == 16'h67a ? 16'hfba0 :  // <0312> getchar
addr == 16'h67b ? 16'h00b4 :  // <0312> "
addr == 16'h67c ? 16'hfc00 :  // <0312> "


addr == 16'h67d ? 16'h0002 :  // <0314> a = i
addr == 16'h67e ? 16'h0601 :  // <0314> b = 1
addr == 16'h67f ? 16'hc800 :  // <0314> i = a+b
addr == 16'h680 ? 16'h0b00 :  // <0314> "


addr == 16'h681 ? 16'h0002 :  // <0314> a = i
addr == 16'h682 ? 16'h060d :  // <0314> b = $num_tps_cells
addr == 16'h683 ? 16'he005 :  // <0314> br lt :loop_1641
addr == 16'h684 ? 16'h066a :  // <0314> "

// :end_1641 // = 0x0685

addr == 16'h685 ? 16'hf80c :  // <0316> pop rtna // func load_tps_ref_cmd
addr == 16'h686 ? 16'h180c :  // <0316> pop ga // "
addr == 16'h687 ? 16'h080c :  // <0316> pop i // "
addr == 16'h688 ? 16'hfc00 :  // <0316> swapra = nop

// ######## func learn_tps_ref_cmd // = 0x0689
addr == 16'h689 ? 16'h303e :  // <0322> push rtna // func learn_tps_ref_cmd

addr == 16'h68a ? 16'h6600 :  // <0318> ram pa = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h68b ? 16'h6a7c :  // <0318> ram pa = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h68c ? 16'h2017 :  // <0318> ram pa = $ram_avg_rpm // pa = av_write_data // start read cycle
addr == 16'h68d ? 16'h2018 :  // <0318> ram pa = $ram_avg_rpm // pa = av_read_data // finish read cycle
addr == 16'h68e ? 16'hfba0 :  // <0319> callx  find_rpm_cell  pa  a
addr == 16'h68f ? 16'h05b3 :  // <0319> "
addr == 16'h690 ? 16'hfc00 :  // <0319> "
addr == 16'h691 ? 16'h0008 :  // <0319> a = pa
addr == 16'h692 ? 16'h6600 :  // <0320> ram b = $ram_tps_avg // av_ad_hi = 0
addr == 16'h693 ? 16'h6ba0 :  // <0320> ram b = $ram_tps_avg // av_ad_lo = 338
addr == 16'h694 ? 16'h0152 :  // <0320> "
addr == 16'h695 ? 16'h0417 :  // <0320> ram b = $ram_tps_avg // b = av_write_data // start read cycle
addr == 16'h696 ? 16'h0418 :  // <0320> ram b = $ram_tps_avg // b = av_read_data // finish read cycle

addr == 16'h697 ? 16'h0351 :  // <0321> a = a<<1
addr == 16'h698 ? 16'h3001 :  // <0321> push b // push b
addr == 16'h699 ? 16'h06b4 :  // <0321> b = 180
addr == 16'h69a ? 16'h6600 :  // <0321> av_ad_hi = 0
addr == 16'h69b ? 16'h6b00 :  // <0321> av_ad_lo = ad0
addr == 16'h69c ? 16'h5c0c :  // <0321> pop av_write_data // pop av_write_data


addr == 16'h69d ? 16'hf80c :  // <0323> pop rtna // func learn_tps_ref_cmd
addr == 16'h69e ? 16'hfc00 :  // <0323> swapra = nop


// :plan_name_run // = 0x069f
// "RN\x0"
addr == 16'h69f ? 16'h4e52 :  // <0002> NR
addr == 16'h6a0 ? 16'h0000 :  // <0002>   


// max trim is about 200 thou prior to multiplier overflow.
// or more if the smap puff is below 8000.
// trim resolution is 4 thou due to multiplier.
// smap resolution for trimming is 16 us.
// final trim enrichment us resolution is 16 us.

// ######## func trim_lean_cmd // = 0x06a1

addr == 16'h6a1 ? 16'h6600 :  // <0016> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h6a2 ? 16'h6ba0 :  // <0016> ram a = $ram_run_manual_trim_thou // av_ad_lo = 356
addr == 16'h6a3 ? 16'h0164 :  // <0016> "
addr == 16'h6a4 ? 16'h0017 :  // <0016> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h6a5 ? 16'h0018 :  // <0016> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle

addr == 16'h6a6 ? 16'h0000 :  // <0021> a = a
addr == 16'h6a7 ? 16'h0600 :  // <0021> b = 0

addr == 16'h6a8 ? 16'he407 :  // <0017> bn eq :else_1704
addr == 16'h6a9 ? 16'h06ac :  // <0017> "


addr == 16'h6aa ? 16'he00f :  // <0019> jmp :end_1704
addr == 16'h6ab ? 16'h06b3 :  // <0019> "

addr == 16'h6ac ? 16'h07a0 :  // <0020> b = (($run_manual_trim_step_thou ^ 0xffff) + 1)
addr == 16'h6ad ? 16'hfffc :  // <0020> "
addr == 16'h6ae ? 16'h6600 :  // <0021> ram $ram_run_manual_trim_thou = a+b // av_ad_hi = 0
addr == 16'h6af ? 16'h6ba0 :  // <0021> ram $ram_run_manual_trim_thou = a+b // av_ad_lo = 356
addr == 16'h6b0 ? 16'h0164 :  // <0021> "
addr == 16'h6b1 ? 16'hc800 :  // <0021> ram $ram_run_manual_trim_thou = a+b // av_write_data = a+b
addr == 16'h6b2 ? 16'h5f00 :  // <0021> "


addr == 16'h6b3 ? 16'hfc00 :  // <0023> swapra = nop

// ######## func trim_rich_cmd // = 0x06b4

addr == 16'h6b4 ? 16'h6600 :  // <0025> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h6b5 ? 16'h6ba0 :  // <0025> ram a = $ram_run_manual_trim_thou // av_ad_lo = 356
addr == 16'h6b6 ? 16'h0164 :  // <0025> "
addr == 16'h6b7 ? 16'h0017 :  // <0025> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h6b8 ? 16'h0018 :  // <0025> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle

addr == 16'h6b9 ? 16'h0000 :  // <0030> a = a
addr == 16'h6ba ? 16'h07a0 :  // <0030> b = 800
addr == 16'h6bb ? 16'h0320 :  // <0030> "

addr == 16'h6bc ? 16'he406 :  // <0026> bn gt :else_1724
addr == 16'h6bd ? 16'h06c0 :  // <0026> "


addr == 16'h6be ? 16'he00f :  // <0028> jmp :end_1724
addr == 16'h6bf ? 16'h06c6 :  // <0028> "

addr == 16'h6c0 ? 16'h0604 :  // <0029> b = $run_manual_trim_step_thou
addr == 16'h6c1 ? 16'h6600 :  // <0030> ram $ram_run_manual_trim_thou = a+b // av_ad_hi = 0
addr == 16'h6c2 ? 16'h6ba0 :  // <0030> ram $ram_run_manual_trim_thou = a+b // av_ad_lo = 356
addr == 16'h6c3 ? 16'h0164 :  // <0030> "
addr == 16'h6c4 ? 16'hc800 :  // <0030> ram $ram_run_manual_trim_thou = a+b // av_write_data = a+b
addr == 16'h6c5 ? 16'h5f00 :  // <0030> "


addr == 16'h6c6 ? 16'hfc00 :  // <0032> swapra = nop

// ######## func trim_2lean_cmd // = 0x06c7

addr == 16'h6c7 ? 16'h6600 :  // <0034> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h6c8 ? 16'h6ba0 :  // <0034> ram a = $ram_run_manual_trim_thou // av_ad_lo = 356
addr == 16'h6c9 ? 16'h0164 :  // <0034> "
addr == 16'h6ca ? 16'h0017 :  // <0034> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h6cb ? 16'h0018 :  // <0034> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle

addr == 16'h6cc ? 16'h0000 :  // <0039> a = a
addr == 16'h6cd ? 16'h0600 :  // <0039> b = 0

addr == 16'h6ce ? 16'he407 :  // <0035> bn eq :else_1742
addr == 16'h6cf ? 16'h06d2 :  // <0035> "


addr == 16'h6d0 ? 16'he00f :  // <0037> jmp :end_1742
addr == 16'h6d1 ? 16'h06d9 :  // <0037> "

addr == 16'h6d2 ? 16'h07a0 :  // <0038> b = ((($run_manual_trim_step_thou << 3) ^ 0xffff) + 1)
addr == 16'h6d3 ? 16'hffe0 :  // <0038> "
addr == 16'h6d4 ? 16'h6600 :  // <0039> ram $ram_run_manual_trim_thou = a+b // av_ad_hi = 0
addr == 16'h6d5 ? 16'h6ba0 :  // <0039> ram $ram_run_manual_trim_thou = a+b // av_ad_lo = 356
addr == 16'h6d6 ? 16'h0164 :  // <0039> "
addr == 16'h6d7 ? 16'hc800 :  // <0039> ram $ram_run_manual_trim_thou = a+b // av_write_data = a+b
addr == 16'h6d8 ? 16'h5f00 :  // <0039> "


addr == 16'h6d9 ? 16'hfc00 :  // <0041> swapra = nop

// ######## func trim_2rich_cmd // = 0x06da

addr == 16'h6da ? 16'h6600 :  // <0043> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h6db ? 16'h6ba0 :  // <0043> ram a = $ram_run_manual_trim_thou // av_ad_lo = 356
addr == 16'h6dc ? 16'h0164 :  // <0043> "
addr == 16'h6dd ? 16'h0017 :  // <0043> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h6de ? 16'h0018 :  // <0043> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle

addr == 16'h6df ? 16'h0000 :  // <0048> a = a
addr == 16'h6e0 ? 16'h07a0 :  // <0048> b = 800
addr == 16'h6e1 ? 16'h0320 :  // <0048> "

addr == 16'h6e2 ? 16'he406 :  // <0044> bn gt :else_1762
addr == 16'h6e3 ? 16'h06e6 :  // <0044> "


addr == 16'h6e4 ? 16'he00f :  // <0046> jmp :end_1762
addr == 16'h6e5 ? 16'h06ec :  // <0046> "

addr == 16'h6e6 ? 16'h0620 :  // <0047> b = ($run_manual_trim_step_thou << 3)
addr == 16'h6e7 ? 16'h6600 :  // <0048> ram $ram_run_manual_trim_thou = a+b // av_ad_hi = 0
addr == 16'h6e8 ? 16'h6ba0 :  // <0048> ram $ram_run_manual_trim_thou = a+b // av_ad_lo = 356
addr == 16'h6e9 ? 16'h0164 :  // <0048> "
addr == 16'h6ea ? 16'hc800 :  // <0048> ram $ram_run_manual_trim_thou = a+b // av_write_data = a+b
addr == 16'h6eb ? 16'h5f00 :  // <0048> "


addr == 16'h6ec ? 16'hfc00 :  // <0050> swapra = nop

// ######## func init_plan_run // = 0x06ed

// set up the run plan.
addr == 16'h6ed ? 16'h6600 :  // <0053> ram $ram_run_manual_trim_thou = 0 // av_ad_hi = 0
addr == 16'h6ee ? 16'h6ba0 :  // <0053> ram $ram_run_manual_trim_thou = 0 // av_ad_lo = 356
addr == 16'h6ef ? 16'h0164 :  // <0053> "
addr == 16'h6f0 ? 16'h5e00 :  // <0053> ram $ram_run_manual_trim_thou = 0 // av_write_data = 0

// memorize state.
addr == 16'h6f1 ? 16'h6600 :  // <0056> ram $ram_plan_name = :plan_name_run // av_ad_hi = 0
addr == 16'h6f2 ? 16'h6a88 :  // <0056> ram $ram_plan_name = :plan_name_run // av_ad_lo = 136
addr == 16'h6f3 ? 16'h5fa0 :  // <0056> ram $ram_plan_name = :plan_name_run // av_write_data = :plan_name_run
addr == 16'h6f4 ? 16'h069f :  // <0056> "
addr == 16'h6f5 ? 16'h6600 :  // <0057> ram $ram_puff_len_func = :puff_len_run // av_ad_hi = 0
addr == 16'h6f6 ? 16'h6a8a :  // <0057> ram $ram_puff_len_func = :puff_len_run // av_ad_lo = 138
addr == 16'h6f7 ? 16'h5fa0 :  // <0057> ram $ram_puff_len_func = :puff_len_run // av_write_data = :puff_len_run
addr == 16'h6f8 ? 16'h0709 :  // <0057> "
addr == 16'h6f9 ? 16'h6600 :  // <0058> ram $ram_transition_func = :leave_run // av_ad_hi = 0
addr == 16'h6fa ? 16'h6a8c :  // <0058> ram $ram_transition_func = :leave_run // av_ad_lo = 140
addr == 16'h6fb ? 16'h5fa0 :  // <0058> ram $ram_transition_func = :leave_run // av_write_data = :leave_run
addr == 16'h6fc ? 16'h0787 :  // <0058> "
addr == 16'h6fd ? 16'h6600 :  // <0059> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_hi = 0
addr == 16'h6fe ? 16'h6a8e :  // <0059> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_lo = 142
addr == 16'h6ff ? 16'h5fa0 :  // <0059> ram $ram_destroy_plan_func = :destroy_plan_run // av_write_data = :destroy_plan_run
addr == 16'h700 ? 16'h0702 :  // <0059> "

addr == 16'h701 ? 16'hfc00 :  // <0061> swapra = nop

// ######## func destroy_plan_run // = 0x0702


addr == 16'h702 ? 16'hfc00 :  // <0064> swapra = nop

// :tps_accel2_msg // = 0x0703
// "tpsa2\x0"
addr == 16'h703 ? 16'h7074 :  // <0066> pt
addr == 16'h704 ? 16'h6173 :  // <0066> as
addr == 16'h705 ? 16'h0032 :  // <0066>  2
// :tps_open_msg // = 0x0706
// "tpsop\x0"
addr == 16'h706 ? 16'h7074 :  // <0068> pt
addr == 16'h707 ? 16'h6f73 :  // <0068> os
addr == 16'h708 ? 16'h0070 :  // <0068>  p

// ######## func puff_len_run // = 0x0709
addr == 16'h709 ? 16'h3004 :  // <0237> push x // func puff_len_run
addr == 16'h70a ? 16'h3006 :  // <0237> push ga // "
addr == 16'h70b ? 16'h3007 :  // <0237> push gb // "
addr == 16'h70c ? 16'h303e :  // <0237> push rtna // "

addr == 16'h70d ? 16'h6600 :  // <0071> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h70e ? 16'h6a7e :  // <0071> ram a = $ram_rpm_valid // av_ad_lo = 126
addr == 16'h70f ? 16'h0017 :  // <0071> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h710 ? 16'h0018 :  // <0071> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle

addr == 16'h711 ? 16'h0000 :  // <0236> a = a
addr == 16'h712 ? 16'h0601 :  // <0236> b = 1

addr == 16'h713 ? 16'he407 :  // <0072> bn eq :else_1811
addr == 16'h714 ? 16'h0782 :  // <0072> "




// offset and clamp the MAF ADC count to 0..511.


// recover linear flow from MAF ADC count using hi-res method,
// for actual flow feeding into final puff multiply.
// table len 256
// Brute-force lookup might take e.g. 80us to run.  That's 4 jf,
// or 5% of ignition cycle at max RPM.


// quantize linear flow from hi-res to lo-res for indexing into AFRC map.
// Lo-res = hi-res >> 2.


// look up Air/Fuel Ratio Correction in AFRC map.
// index rows by MAF.
addr == 16'h715 ? 16'h6600 :  // <0102> ram a = $ram_afrc_maf_row_idx // av_ad_hi = 0
addr == 16'h716 ? 16'h6ba0 :  // <0102> ram a = $ram_afrc_maf_row_idx // av_ad_lo = 364
addr == 16'h717 ? 16'h016c :  // <0102> "
addr == 16'h718 ? 16'h0017 :  // <0102> ram a = $ram_afrc_maf_row_idx // a = av_write_data // start read cycle
addr == 16'h719 ? 16'h0018 :  // <0102> ram a = $ram_afrc_maf_row_idx // a = av_read_data // finish read cycle
addr == 16'h71a ? 16'h0610 :  // <0103> b = $afrc_rpm_cols
addr == 16'h71b ? 16'hc800 :  // <0104> nop
addr == 16'h71c ? 16'hc800 :  // <0105> nop
addr == 16'h71d ? 16'hc800 :  // <0106> nop
addr == 16'h71e ? 16'hc800 :  // <0107> nop
addr == 16'h71f ? 16'h0410 :  // <0108> b = product_lo
// index columns by RPM.
addr == 16'h720 ? 16'h6600 :  // <0110> ram a = $ram_afrc_rpm_col_idx // av_ad_hi = 0
addr == 16'h721 ? 16'h6ba0 :  // <0110> ram a = $ram_afrc_rpm_col_idx // av_ad_lo = 366
addr == 16'h722 ? 16'h016e :  // <0110> "
addr == 16'h723 ? 16'h0017 :  // <0110> ram a = $ram_afrc_rpm_col_idx // a = av_write_data // start read cycle
addr == 16'h724 ? 16'h0018 :  // <0110> ram a = $ram_afrc_rpm_col_idx // a = av_read_data // finish read cycle
addr == 16'h725 ? 16'hc800 :  // <0111> a = a+b
addr == 16'h726 ? 16'h0300 :  // <0111> "

addr == 16'h727 ? 16'h0351 :  // <0112> a = a<<1
addr == 16'h728 ? 16'h0600 :  // <0112> b = 0
addr == 16'h729 ? 16'h67a0 :  // <0112> av_ad_hi = 256
addr == 16'h72a ? 16'h0100 :  // <0112> "
addr == 16'h72b ? 16'h6b00 :  // <0112> av_ad_lo = ad0
addr == 16'h72c ? 16'h0417 :  // <0112> b = av_write_data
addr == 16'h72d ? 16'h0418 :  // <0112> b = av_read_data

addr == 16'h72e ? 16'h1801 :  // <0113> ga = b

// ga = total trim factor as integer.


// look up block temperature map trim factor.


// look up afterstart map trim factor.


// apply stoich learning trim factor.


// apply manual trim factor.

// clamp the total trim between 0.5 and 2.0 trim factor equivalent
// ( = 0 to 24576 inclusive).  best to do this instead using saturating addition (at 24576) in the previous step.


// final multiplication for puff length.
// (MAF linear flow) * (stoich ratio constant) * (total trim as floating point) = (puff length jf).
// here the total trim float will have to be represented as a fraction (num/denom).
// stoich ratio constant (8) (really the conversion factor from linear
// flow to nominal jf)  is folded into that denominator (16384) at compile time.
// that makes denom = 2048 = 11 bits.  so:
// gb = (puff len jf) = (MAF linear flow) * [(total trim) + 8192] >> 11
addr == 16'h72f ? 16'h0006 :  // <0140> a = ga
addr == 16'h730 ? 16'h07a0 :  // <0141> b = 8192
addr == 16'h731 ? 16'h2000 :  // <0141> "
addr == 16'h732 ? 16'hc800 :  // <0142> a = a+b
addr == 16'h733 ? 16'h0300 :  // <0142> "
addr == 16'h734 ? 16'h6600 :  // <0143> ram b = $ram_maf_flow_hi_res // av_ad_hi = 0
addr == 16'h735 ? 16'h6ba0 :  // <0143> ram b = $ram_maf_flow_hi_res // av_ad_lo = 362
addr == 16'h736 ? 16'h016a :  // <0143> "
addr == 16'h737 ? 16'h0417 :  // <0143> ram b = $ram_maf_flow_hi_res // b = av_write_data // start read cycle
addr == 16'h738 ? 16'h0418 :  // <0143> ram b = $ram_maf_flow_hi_res // b = av_read_data // finish read cycle
addr == 16'h739 ? 16'hc800 :  // <0144> nop
addr == 16'h73a ? 16'hc800 :  // <0145> nop
addr == 16'h73b ? 16'hc800 :  // <0146> nop
addr == 16'h73c ? 16'hc800 :  // <0147> nop
// gb = 32-bit product shifted >> 11.  lower 11 bits of product_hi are
// explicitly moved to upper 11 bits of gb.
addr == 16'h73d ? 16'h0010 :  // <0150> a = product_lo
addr == 16'h73e ? 16'h0411 :  // <0151> b = product_hi
addr == 16'h73f ? 16'h0353 :  // <0152> a = a>>4
addr == 16'h740 ? 16'h0353 :  // <0153> a = a>>4
addr == 16'h741 ? 16'h0350 :  // <0154> a = a>>1
addr == 16'h742 ? 16'h0350 :  // <0155> a = a>>1
addr == 16'h743 ? 16'h1f50 :  // <0156> gb = a>>1
addr == 16'h744 ? 16'h0001 :  // <0157> a = b
addr == 16'h745 ? 16'h0352 :  // <0158> a = a<<4
addr == 16'h746 ? 16'h0351 :  // <0159> a = a<<1
addr == 16'h747 ? 16'h0407 :  // <0160> b = gb
addr == 16'h748 ? 16'hc800 :  // <0161> gb = or
addr == 16'h749 ? 16'h1f34 :  // <0161> "


// clamp the (puff length jf) to sane range.  max is the floating duty cycle.  min is the safety amount to keep motor running and maybe prevent leaning damage.
addr == 16'h74a ? 16'h6600 :  // <0165> ram a = $ram_ign_avg_jf // av_ad_hi = 0
addr == 16'h74b ? 16'h6a7a :  // <0165> ram a = $ram_ign_avg_jf // av_ad_lo = 122
addr == 16'h74c ? 16'h0017 :  // <0165> ram a = $ram_ign_avg_jf // a = av_write_data // start read cycle
addr == 16'h74d ? 16'h0018 :  // <0165> ram a = $ram_ign_avg_jf // a = av_read_data // finish read cycle
addr == 16'h74e ? 16'h0350 :  // <0166> a = a>>1
addr == 16'h74f ? 16'h0350 :  // <0167> a = a>>1
addr == 16'h750 ? 16'h0350 :  // <0168> a = a>>1
addr == 16'h751 ? 16'h0760 :  // <0169> b = 0xffff
addr == 16'h752 ? 16'hc800 :  // <0170> a = xor
addr == 16'h753 ? 16'h0338 :  // <0170> "
addr == 16'h754 ? 16'h6600 :  // <0171> ram b = $ram_ign_avg_jf // av_ad_hi = 0
addr == 16'h755 ? 16'h6a7a :  // <0171> ram b = $ram_ign_avg_jf // av_ad_lo = 122
addr == 16'h756 ? 16'h0417 :  // <0171> ram b = $ram_ign_avg_jf // b = av_write_data // start read cycle
addr == 16'h757 ? 16'h0418 :  // <0171> ram b = $ram_ign_avg_jf // b = av_read_data // finish read cycle
addr == 16'h758 ? 16'hc800 :  // <0172> x = a+b
addr == 16'h759 ? 16'h1300 :  // <0172> "

addr == 16'h75a ? 16'h0007 :  // <0175> a = gb
addr == 16'h75b ? 16'h0404 :  // <0175> b = x

addr == 16'h75c ? 16'he406 :  // <0173> bn gt :else_1884
addr == 16'h75d ? 16'h075f :  // <0173> "

addr == 16'h75e ? 16'h1c04 :  // <0174> gb = x

//patch: don't know a proper minimum.

// shut off puff during closed throttle engine braking.
//patch: not implemented.

// old code:
// read smap puff into ga
addr == 16'h75f ? 16'h6600 :  // <0183> ram pa = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h760 ? 16'h6a7c :  // <0183> ram pa = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h761 ? 16'h2017 :  // <0183> ram pa = $ram_avg_rpm // pa = av_write_data // start read cycle
addr == 16'h762 ? 16'h2018 :  // <0183> ram pa = $ram_avg_rpm // pa = av_read_data // finish read cycle
addr == 16'h763 ? 16'hfba0 :  // <0184> callx  find_rpm_cell  pa  a
addr == 16'h764 ? 16'h05b3 :  // <0184> "
addr == 16'h765 ? 16'hfc00 :  // <0184> "
addr == 16'h766 ? 16'h0008 :  // <0184> a = pa
addr == 16'h767 ? 16'h1c00 :  // <0185> gb = a

addr == 16'h768 ? 16'h0351 :  // <0186> a = a<<1
addr == 16'h769 ? 16'h0698 :  // <0186> b = 152
addr == 16'h76a ? 16'h6600 :  // <0186> av_ad_hi = 0
addr == 16'h76b ? 16'h6b00 :  // <0186> av_ad_lo = ad0
addr == 16'h76c ? 16'h0417 :  // <0186> b = av_write_data
addr == 16'h76d ? 16'h0418 :  // <0186> b = av_read_data

addr == 16'h76e ? 16'h1801 :  // <0187> ga = b

// calculate manual enrichment in us.  apply a total of 10 bits of right-shift to
// implement division by 1024 (thou unit).  spread them out to prevent overflow.
addr == 16'h76f ? 16'h6600 :  // <0191> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h770 ? 16'h6ba0 :  // <0191> ram a = $ram_run_manual_trim_thou // av_ad_lo = 356
addr == 16'h771 ? 16'h0164 :  // <0191> "
addr == 16'h772 ? 16'h0017 :  // <0191> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h773 ? 16'h0018 :  // <0191> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle
addr == 16'h774 ? 16'h0350 :  // <0192> a = a>>1
addr == 16'h775 ? 16'h0750 :  // <0193> b = a>>1
addr == 16'h776 ? 16'h0006 :  // <0194> a = ga
addr == 16'h777 ? 16'h0353 :  // <0195> a = a>>4
addr == 16'h778 ? 16'hfba0 :  // <0196> call  multiply
addr == 16'h779 ? 16'h0180 :  // <0196> "
addr == 16'h77a ? 16'hfc00 :  // <0196> "
addr == 16'h77b ? 16'h0353 :  // <0197> a = a>>4

// add enrichment to smap puff.
addr == 16'h77c ? 16'h0406 :  // <0200> b = ga
addr == 16'h77d ? 16'hc800 :  // <0201> ga = a+b
addr == 16'h77e ? 16'h1b00 :  // <0201> "

//// determine TPS enrichment for acceleration.
//ram x = $ram_tps_state
//if x eq $tps_state_accel2 {
//callx  unique_text_flag  :tps_accel2_msg
//}
//if x eq $tps_state_open {
//callx  unique_text_flag  :tps_open_msg
//}
//// index into maps by TPS state.
//i = 0
//j = $num_tps_cells
//y = -1
//:next_state
//br xz :found_state
//i = i+j
//x = x+y
//jmp :next_state
//:found_state
//// index into maps by RPM.
//j = gb
//a = i+j
//// convert from words to bytes.
//a = a<<1
//// add map address.
//b = :ram_tps_closed_enrich_us
//a = a+b

//// add enrichment to smap puff.
//b = ga
//ga = a+b

// memorize total puff.
addr == 16'h77f ? 16'h6600 :  // <0235> ram $ram_next_puff_len_us = ga // av_ad_hi = 0
addr == 16'h780 ? 16'h6a90 :  // <0235> ram $ram_next_puff_len_us = ga // av_ad_lo = 144
addr == 16'h781 ? 16'h5c06 :  // <0235> ram $ram_next_puff_len_us = ga // av_write_data = ga


addr == 16'h782 ? 16'hf80c :  // <0238> pop rtna // func puff_len_run
addr == 16'h783 ? 16'h1c0c :  // <0238> pop gb // "
addr == 16'h784 ? 16'h180c :  // <0238> pop ga // "
addr == 16'h785 ? 16'h100c :  // <0238> pop x // "
addr == 16'h786 ? 16'hfc00 :  // <0238> swapra = nop

// ######## func leave_run // = 0x0787
addr == 16'h787 ? 16'h303e :  // <0241> push rtna // func leave_run

addr == 16'h788 ? 16'hfba0 :  // <0240> callx  check_engine_stop  pa
addr == 16'h789 ? 16'h0c8a :  // <0240> "
addr == 16'h78a ? 16'hfc00 :  // <0240> "

addr == 16'h78b ? 16'hf80c :  // <0242> pop rtna // func leave_run
addr == 16'h78c ? 16'hfc00 :  // <0242> swapra = nop



// #########################################################################
// :main // = 0x078d
addr == 16'h78d ? 16'h03a0 :  // <0222> a = :boot_msg
addr == 16'h78e ? 16'h009b :  // <0222> "
addr == 16'h78f ? 16'hfba0 :  // <0223> call :print_nt
addr == 16'h790 ? 16'h015f :  // <0223> "
addr == 16'h791 ? 16'hfc00 :  // <0223> "

// clear the first 64k of RAM.
addr == 16'h792 ? 16'h6600 :  // <0226> av_ad_hi = 0
addr == 16'h793 ? 16'hfba0 :  // <0226> callx  clear_ram_page  0
addr == 16'h794 ? 16'h0b49 :  // <0226> "
addr == 16'h795 ? 16'hfc00 :  // <0226> "

addr == 16'h796 ? 16'hfba0 :  // <0228> callx  init_data_rom
addr == 16'h797 ? 16'h022d :  // <0228> "
addr == 16'h798 ? 16'hfc00 :  // <0228> "

// init fuel injection.
addr == 16'h799 ? 16'hfba0 :  // <0231> callx  init_plan_stop
addr == 16'h79a ? 16'h0344 :  // <0231> "
addr == 16'h79b ? 16'hfc00 :  // <0231> "
addr == 16'h79c ? 16'h0a00 :  // <0236> i = 0
// :loop_1948 // = 0x079d

addr == 16'h79d ? 16'h0002 :  // <0232> a = i
addr == 16'h79e ? 16'h07a0 :  // <0233> b = 0x1194
addr == 16'h79f ? 16'h1194 :  // <0233> "

addr == 16'h7a0 ? 16'h0351 :  // <0234> a = a<<1
addr == 16'h7a1 ? 16'h3001 :  // <0234> push b // push b
addr == 16'h7a2 ? 16'h0698 :  // <0234> b = 152
addr == 16'h7a3 ? 16'h6600 :  // <0234> av_ad_hi = 0
addr == 16'h7a4 ? 16'h6b00 :  // <0234> av_ad_lo = ad0
addr == 16'h7a5 ? 16'h5c0c :  // <0234> pop av_write_data // pop av_write_data



addr == 16'h7a6 ? 16'h0002 :  // <0236> a = i
addr == 16'h7a7 ? 16'h0601 :  // <0236> b = 1
addr == 16'h7a8 ? 16'hc800 :  // <0236> i = a+b
addr == 16'h7a9 ? 16'h0b00 :  // <0236> "


addr == 16'h7aa ? 16'h0002 :  // <0236> a = i
addr == 16'h7ab ? 16'h060d :  // <0236> b = $num_rpm_cells
addr == 16'h7ac ? 16'he005 :  // <0236> br lt :loop_1948
addr == 16'h7ad ? 16'h079d :  // <0236> "

// :end_1948 // = 0x07ae
addr == 16'h7ae ? 16'h0a00 :  // <0252> i = 0
// :loop_1966 // = 0x07af

addr == 16'h7af ? 16'h0002 :  // <0237> a = i
addr == 16'h7b0 ? 16'h07a0 :  // <0238> b = :default_tps_reference
addr == 16'h7b1 ? 16'h047a :  // <0238> "
addr == 16'h7b2 ? 16'hc800 :  // <0239> fetch b from a+b
addr == 16'h7b3 ? 16'hd300 :  // <0239> "
addr == 16'h7b4 ? 16'h07b0 :  // <0239> "
addr == 16'h7b5 ? 16'h0002 :  // <0240> a = i

addr == 16'h7b6 ? 16'h0351 :  // <0241> a = a<<1
addr == 16'h7b7 ? 16'h3001 :  // <0241> push b // push b
addr == 16'h7b8 ? 16'h06b4 :  // <0241> b = 180
addr == 16'h7b9 ? 16'h6600 :  // <0241> av_ad_hi = 0
addr == 16'h7ba ? 16'h6b00 :  // <0241> av_ad_lo = ad0
addr == 16'h7bb ? 16'h5c0c :  // <0241> pop av_write_data // pop av_write_data

addr == 16'h7bc ? 16'h0002 :  // <0242> a = i
addr == 16'h7bd ? 16'h07a0 :  // <0243> b = 0x2000
addr == 16'h7be ? 16'h2000 :  // <0243> "

addr == 16'h7bf ? 16'h0351 :  // <0244> a = a<<1
addr == 16'h7c0 ? 16'h3001 :  // <0244> push b // push b
addr == 16'h7c1 ? 16'h07a0 :  // <0244> b = 260
addr == 16'h7c2 ? 16'h0104 :  // <0244> "
addr == 16'h7c3 ? 16'h6600 :  // <0244> av_ad_hi = 0
addr == 16'h7c4 ? 16'h6b00 :  // <0244> av_ad_lo = ad0
addr == 16'h7c5 ? 16'h5c0c :  // <0244> pop av_write_data // pop av_write_data

addr == 16'h7c6 ? 16'h0002 :  // <0245> a = i
addr == 16'h7c7 ? 16'h07a0 :  // <0246> b = 0x4000
addr == 16'h7c8 ? 16'h4000 :  // <0246> "

addr == 16'h7c9 ? 16'h0351 :  // <0247> a = a<<1
addr == 16'h7ca ? 16'h3001 :  // <0247> push b // push b
addr == 16'h7cb ? 16'h07a0 :  // <0247> b = 286
addr == 16'h7cc ? 16'h011e :  // <0247> "
addr == 16'h7cd ? 16'h6600 :  // <0247> av_ad_hi = 0
addr == 16'h7ce ? 16'h6b00 :  // <0247> av_ad_lo = ad0
addr == 16'h7cf ? 16'h5c0c :  // <0247> pop av_write_data // pop av_write_data

addr == 16'h7d0 ? 16'h0002 :  // <0248> a = i
addr == 16'h7d1 ? 16'h07a0 :  // <0249> b = 0x8000
addr == 16'h7d2 ? 16'h8000 :  // <0249> "

addr == 16'h7d3 ? 16'h0351 :  // <0250> a = a<<1
addr == 16'h7d4 ? 16'h3001 :  // <0250> push b // push b
addr == 16'h7d5 ? 16'h07a0 :  // <0250> b = 312
addr == 16'h7d6 ? 16'h0138 :  // <0250> "
addr == 16'h7d7 ? 16'h6600 :  // <0250> av_ad_hi = 0
addr == 16'h7d8 ? 16'h6b00 :  // <0250> av_ad_lo = ad0
addr == 16'h7d9 ? 16'h5c0c :  // <0250> pop av_write_data // pop av_write_data



addr == 16'h7da ? 16'h0002 :  // <0252> a = i
addr == 16'h7db ? 16'h0601 :  // <0252> b = 1
addr == 16'h7dc ? 16'hc800 :  // <0252> i = a+b
addr == 16'h7dd ? 16'h0b00 :  // <0252> "


addr == 16'h7de ? 16'h0002 :  // <0252> a = i
addr == 16'h7df ? 16'h060d :  // <0252> b = $num_tps_cells
addr == 16'h7e0 ? 16'he005 :  // <0252> br lt :loop_1966
addr == 16'h7e1 ? 16'h07af :  // <0252> "

// :end_1966 // = 0x07e2

// power up FTDI USB board, and init any other special board control functions.
addr == 16'h7e2 ? 16'h8280 :  // <0255> board_ctrl = $ftdi_power_mask
addr == 16'h7e3 ? 16'hfba0 :  // <0256> callx postpone_comm_restart
addr == 16'h7e4 ? 16'h0b20 :  // <0256> "
addr == 16'h7e5 ? 16'hfc00 :  // <0256> "

// check initial state of power management circuits.
// if power is lost or ignition switch is off already, open relay & abort run.
// that's important because then the event controller booted up too late to
// see edges on those 2 signals.  regular system would never shut itself down.
// this setup is the last thing done prior to the event handler loop.
addr == 16'h7e6 ? 16'h8a00 :  // <0263> power_duty = $power_duty_closing

addr == 16'h7e7 ? 16'h0022 :  // <0267> a = power_duty
addr == 16'h7e8 ? 16'h06c0 :  // <0267> b = ( $power_lost_mask | $ign_switch_off_mask )

addr == 16'h7e9 ? 16'he003 :  // <0264> br and0z :else_2025
addr == 16'h7ea ? 16'h07f0 :  // <0264> "

addr == 16'h7eb ? 16'h8a32 :  // <0265> power_duty = $power_duty_opening
addr == 16'h7ec ? 16'h7fa0 :  // <0266> error_halt_code $err_power_lost_at_boot // leds = 0xfffb
addr == 16'h7ed ? 16'hfffb :  // <0266> "
addr == 16'h7ee ? 16'he00f :  // <0266> error_halt_code $err_power_lost_at_boot
addr == 16'h7ef ? 16'h07ee :  // <0266> "

addr == 16'h7f0 ? 16'h6600 :  // <0268> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h7f1 ? 16'h6a3c :  // <0268> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 60
addr == 16'h7f2 ? 16'h5f60 :  // <0268> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h7f3 ? 16'h6600 :  // <0269> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_hi = 0
addr == 16'h7f4 ? 16'h6a3e :  // <0269> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_lo = 62
addr == 16'h7f5 ? 16'h5e02 :  // <0269> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_write_data = 2

// start handling events.
addr == 16'h7f6 ? 16'h3ba0 :  // <0272> soft_event = $event_controller_reset_mask
addr == 16'h7f7 ? 16'h8000 :  // <0272> "
addr == 16'h7f8 ? 16'h3a00 :  // <0273> soft_event = 0
addr == 16'h7f9 ? 16'h4fa0 :  // <0274> mstimer0 = 1000
addr == 16'h7fa ? 16'h03e8 :  // <0274> "
addr == 16'h7fb ? 16'h5614 :  // <0275> mstimer2 = $plan_tick_ms
addr == 16'h7fc ? 16'he00f :  // <0276> jmp :poll_events
addr == 16'h7fd ? 16'h009e :  // <0276> "

// event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.
// event 0 not used in this app anyway.
// :event_table // = 0x07fe
addr == 16'h7fe ? 16'h009e :  // <0281> ([label :poll_events])
addr == 16'h7ff ? 16'h0a7b :  // <0282> ([label :power_lost_handler])
addr == 16'h800 ? 16'h0813 :  // <0283> ([label :ign_capture_handler])
addr == 16'h801 ? 16'h0893 :  // <0284> ([label :ign_capture_timeout_handler])
addr == 16'h802 ? 16'h0aaf :  // <0285> ([label :puff1_done_handler])
addr == 16'h803 ? 16'h0898 :  // <0286> ([label :ustimer0_handler])
addr == 16'h804 ? 16'h09f9 :  // <0287> ([label :spi_done_handler])
addr == 16'h805 ? 16'h089a :  // <0288> ([label :mstimer0_handler])
addr == 16'h806 ? 16'h09c5 :  // <0289> ([label :mstimer1_handler])
addr == 16'h807 ? 16'h08c9 :  // <0290> ([label :mstimer2_handler])
addr == 16'h808 ? 16'h08f5 :  // <0291> ([label :uart_rx_handler])
addr == 16'h809 ? 16'h090e :  // <0292> ([label :uart_rx_overflow_handler])
addr == 16'h80a ? 16'h0916 :  // <0293> ([label :uart_tx_overflow_handler])
addr == 16'h80b ? 16'h091d :  // <0294> ([label :key0_handler])
addr == 16'h80c ? 16'h0927 :  // <0295> ([label :key1_handler])
addr == 16'h80d ? 16'h0a92 :  // <0296> ([label :ign_switch_off_handler])
addr == 16'h80e ? 16'h0aa5 :  // <0297> ([label :ign_switch_on_handler])
addr == 16'h80f ? 16'h0931 :  // <0298> ([label :softevent3_handler])
addr == 16'h810 ? 16'h0933 :  // <0299> ([label :softevent2_handler])
addr == 16'h811 ? 16'h0935 :  // <0300> ([label :softevent1_handler])
addr == 16'h812 ? 16'h0937 :  // <0301> ([label :softevent0_handler])

// #########################################################################

// ######## event ign_capture_handler // = 0x0813
// discard outlier time.
addr == 16'h813 ? 16'h1823 :  // <0307> g6 = ign_capture_jf
addr == 16'h814 ? 16'h6600 :  // <0308> ram b = $ram_ign_fastest_jf // av_ad_hi = 0
addr == 16'h815 ? 16'h6a82 :  // <0308> ram b = $ram_ign_fastest_jf // av_ad_lo = 130
addr == 16'h816 ? 16'h0417 :  // <0308> ram b = $ram_ign_fastest_jf // b = av_write_data // start read cycle
addr == 16'h817 ? 16'h0418 :  // <0308> ram b = $ram_ign_fastest_jf // b = av_read_data // finish read cycle

addr == 16'h818 ? 16'h0006 :  // <0311> a = g6
addr == 16'h819 ? 16'h0401 :  // <0311> b = b

addr == 16'h81a ? 16'he405 :  // <0309> bn lt :else_2074
addr == 16'h81b ? 16'h081d :  // <0309> "

addr == 16'h81c ? 16'h1a00 :  // <0310> g6 = 0

addr == 16'h81d ? 16'h6600 :  // <0312> ram b = $ram_ign_slowest_jf // av_ad_hi = 0
addr == 16'h81e ? 16'h6a84 :  // <0312> ram b = $ram_ign_slowest_jf // av_ad_lo = 132
addr == 16'h81f ? 16'h0417 :  // <0312> ram b = $ram_ign_slowest_jf // b = av_write_data // start read cycle
addr == 16'h820 ? 16'h0418 :  // <0312> ram b = $ram_ign_slowest_jf // b = av_read_data // finish read cycle

addr == 16'h821 ? 16'h0006 :  // <0315> a = g6
addr == 16'h822 ? 16'h0401 :  // <0315> b = b

addr == 16'h823 ? 16'he406 :  // <0313> bn gt :else_2083
addr == 16'h824 ? 16'h0826 :  // <0313> "

addr == 16'h825 ? 16'h1a00 :  // <0314> g6 = 0


// increment buffer index and memorize time.
addr == 16'h826 ? 16'h6600 :  // <0318> ram a = $ram_ign_history_idx // av_ad_hi = 0
addr == 16'h827 ? 16'h6a58 :  // <0318> ram a = $ram_ign_history_idx // av_ad_lo = 88
addr == 16'h828 ? 16'h0017 :  // <0318> ram a = $ram_ign_history_idx // a = av_write_data // start read cycle
addr == 16'h829 ? 16'h0018 :  // <0318> ram a = $ram_ign_history_idx // a = av_read_data // finish read cycle
addr == 16'h82a ? 16'h0601 :  // <0319> b = 1
addr == 16'h82b ? 16'hc800 :  // <0320> a = a+b
addr == 16'h82c ? 16'h0300 :  // <0320> "
addr == 16'h82d ? 16'h060f :  // <0321> b = $ign_history_idx_mask
addr == 16'h82e ? 16'hc800 :  // <0322> a = and
addr == 16'h82f ? 16'h0330 :  // <0322> "
addr == 16'h830 ? 16'h6600 :  // <0323> ram $ram_ign_history_idx = a // av_ad_hi = 0
addr == 16'h831 ? 16'h6a58 :  // <0323> ram $ram_ign_history_idx = a // av_ad_lo = 88
addr == 16'h832 ? 16'h5c00 :  // <0323> ram $ram_ign_history_idx = a // av_write_data = a
addr == 16'h833 ? 16'h0406 :  // <0324> b = g6

addr == 16'h834 ? 16'h0351 :  // <0325> a = a<<1
addr == 16'h835 ? 16'h3001 :  // <0325> push b // push b
addr == 16'h836 ? 16'h065a :  // <0325> b = 90
addr == 16'h837 ? 16'h6600 :  // <0325> av_ad_hi = 0
addr == 16'h838 ? 16'h6b00 :  // <0325> av_ad_lo = ad0
addr == 16'h839 ? 16'h5c0c :  // <0325> pop av_write_data // pop av_write_data


// ////////// compute new jiffy estimate.
// average entire history.
// x = total, y = sample, i = index = loop count, g6 = count of invalid samples.
addr == 16'h83a ? 16'h1200 :  // <0330> x = 0
addr == 16'h83b ? 16'h1a00 :  // <0331> g6 = 0
addr == 16'h83c ? 16'h0a00 :  // <0347> i = 0
// :loop_2108 // = 0x083d

addr == 16'h83d ? 16'h0002 :  // <0332> a = i

addr == 16'h83e ? 16'h0351 :  // <0333> a = a<<1
addr == 16'h83f ? 16'h065a :  // <0333> b = 90
addr == 16'h840 ? 16'h6600 :  // <0333> av_ad_hi = 0
addr == 16'h841 ? 16'h6b00 :  // <0333> av_ad_lo = ad0
addr == 16'h842 ? 16'h0417 :  // <0333> b = av_write_data
addr == 16'h843 ? 16'h0418 :  // <0333> b = av_read_data

addr == 16'h844 ? 16'h1401 :  // <0334> y = b

addr == 16'h845 ? 16'h0005 :  // <0345> a = y
addr == 16'h846 ? 16'h0600 :  // <0345> b = 0

addr == 16'h847 ? 16'he407 :  // <0335> bn eq :else_2119
addr == 16'h848 ? 16'h084f :  // <0335> "

addr == 16'h849 ? 16'h0006 :  // <0336> a = g6
addr == 16'h84a ? 16'h0601 :  // <0337> b = 1
addr == 16'h84b ? 16'hc800 :  // <0338> g6 = a+b
addr == 16'h84c ? 16'h1b00 :  // <0338> "

addr == 16'h84d ? 16'he00f :  // <0340> jmp :end_2119
addr == 16'h84e ? 16'h0856 :  // <0340> "

addr == 16'h84f ? 16'h0208 :  // <0341> a = ($ign_history_len / 2)
addr == 16'h850 ? 16'h0405 :  // <0342> b = y
addr == 16'h851 ? 16'hc800 :  // <0343> a = a+b
addr == 16'h852 ? 16'h0300 :  // <0343> "
addr == 16'h853 ? 16'h1753 :  // <0344> y = a>>$ign_history_idx_bits
addr == 16'h854 ? 16'hc800 :  // <0345> x = x+y
addr == 16'h855 ? 16'h1320 :  // <0345> "



addr == 16'h856 ? 16'h0002 :  // <0347> a = i
addr == 16'h857 ? 16'h0601 :  // <0347> b = 1
addr == 16'h858 ? 16'hc800 :  // <0347> i = a+b
addr == 16'h859 ? 16'h0b00 :  // <0347> "


addr == 16'h85a ? 16'h0002 :  // <0347> a = i
addr == 16'h85b ? 16'h0610 :  // <0347> b = $ign_history_len
addr == 16'h85c ? 16'he005 :  // <0347> br lt :loop_2108
addr == 16'h85d ? 16'h083d :  // <0347> "

// :end_2108 // = 0x085e
addr == 16'h85e ? 16'h6600 :  // <0348> ram $ram_ign_avg_jf = x // av_ad_hi = 0
addr == 16'h85f ? 16'h6a7a :  // <0348> ram $ram_ign_avg_jf = x // av_ad_lo = 122
addr == 16'h860 ? 16'h5c04 :  // <0348> ram $ram_ign_avg_jf = x // av_write_data = x
addr == 16'h861 ? 16'h6600 :  // <0349> ram $ram_ign_bad_samples = g6 // av_ad_hi = 0
addr == 16'h862 ? 16'h6a80 :  // <0349> ram $ram_ign_bad_samples = g6 // av_ad_lo = 128
addr == 16'h863 ? 16'h5c06 :  // <0349> ram $ram_ign_bad_samples = g6 // av_write_data = g6
//patch: dividing before summing (instead of after) is much simpler and faster because it prevents overflow.
// but it means we could be reading as much as 16 jf too low (16 = ign_history_len).
// that error is way less than 1 RPM on the slow end,
// or about 1,000 RPM too fast on the fast end!
// might need to tighten that up.  one simple way might be adding ign_history_len / 2 to each history record prior to dividing.
// that didn't seem to help much in simple testing.
// probly because jf_to_rpm has only 32 RPM resolution.


addr == 16'h864 ? 16'h0006 :  // <0365> a = g6
addr == 16'h865 ? 16'h0604 :  // <0365> b = ( $ign_history_len / 4 )

addr == 16'h866 ? 16'he406 :  // <0358> bn gt :else_2150
addr == 16'h867 ? 16'h086d :  // <0358> "

addr == 16'h868 ? 16'h6600 :  // <0359> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h869 ? 16'h6a7e :  // <0359> ram $ram_rpm_valid = 0 // av_ad_lo = 126
addr == 16'h86a ? 16'h5e00 :  // <0359> ram $ram_rpm_valid = 0 // av_write_data = 0

addr == 16'h86b ? 16'he00f :  // <0361> jmp :end_2150
addr == 16'h86c ? 16'h0877 :  // <0361> "

// convert jiffies b to new RPM estimate.
addr == 16'h86d ? 16'h2004 :  // <0363> pa = x
addr == 16'h86e ? 16'hfba0 :  // <0363> callx  jf_to_rpm  x  pa
addr == 16'h86f ? 16'h0c7e :  // <0363> "
addr == 16'h870 ? 16'hfc00 :  // <0363> "
addr == 16'h871 ? 16'h6600 :  // <0364> ram $ram_avg_rpm = pa // av_ad_hi = 0
addr == 16'h872 ? 16'h6a7c :  // <0364> ram $ram_avg_rpm = pa // av_ad_lo = 124
addr == 16'h873 ? 16'h5c08 :  // <0364> ram $ram_avg_rpm = pa // av_write_data = pa
addr == 16'h874 ? 16'h6600 :  // <0365> ram $ram_rpm_valid = 1 // av_ad_hi = 0
addr == 16'h875 ? 16'h6a7e :  // <0365> ram $ram_rpm_valid = 1 // av_ad_lo = 126
addr == 16'h876 ? 16'h5e01 :  // <0365> ram $ram_rpm_valid = 1 // av_write_data = 1

addr == 16'h877 ? 16'he00f :  // <0366> end_event
addr == 16'h878 ? 16'h009e :  // <0366> "

// ######## func clear_ign_history // = 0x0879
addr == 16'h879 ? 16'h3002 :  // <0379> push i // func clear_ign_history

// invalidate the RPM estimate.
addr == 16'h87a ? 16'h6600 :  // <0370> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h87b ? 16'h6a7e :  // <0370> ram $ram_rpm_valid = 0 // av_ad_lo = 126
addr == 16'h87c ? 16'h5e00 :  // <0370> ram $ram_rpm_valid = 0 // av_write_data = 0
// the last known RPM estimate is retained here, not cleared.
// clear the history so it won't be valid again until several more valid samples are collected.
addr == 16'h87d ? 16'h6600 :  // <0373> ram $ram_ign_bad_samples = $ign_history_len // av_ad_hi = 0
addr == 16'h87e ? 16'h6a80 :  // <0373> ram $ram_ign_bad_samples = $ign_history_len // av_ad_lo = 128
addr == 16'h87f ? 16'h5e10 :  // <0373> ram $ram_ign_bad_samples = $ign_history_len // av_write_data = 16
addr == 16'h880 ? 16'h0a00 :  // <0378> i = 0
// :loop_2176 // = 0x0881

addr == 16'h881 ? 16'h0002 :  // <0374> a = i
addr == 16'h882 ? 16'h0600 :  // <0375> b = 0

addr == 16'h883 ? 16'h0351 :  // <0376> a = a<<1
addr == 16'h884 ? 16'h3001 :  // <0376> push b // push b
addr == 16'h885 ? 16'h065a :  // <0376> b = 90
addr == 16'h886 ? 16'h6600 :  // <0376> av_ad_hi = 0
addr == 16'h887 ? 16'h6b00 :  // <0376> av_ad_lo = ad0
addr == 16'h888 ? 16'h5c0c :  // <0376> pop av_write_data // pop av_write_data



addr == 16'h889 ? 16'h0002 :  // <0378> a = i
addr == 16'h88a ? 16'h0601 :  // <0378> b = 1
addr == 16'h88b ? 16'hc800 :  // <0378> i = a+b
addr == 16'h88c ? 16'h0b00 :  // <0378> "


addr == 16'h88d ? 16'h0002 :  // <0378> a = i
addr == 16'h88e ? 16'h0610 :  // <0378> b = $ign_history_len
addr == 16'h88f ? 16'he005 :  // <0378> br lt :loop_2176
addr == 16'h890 ? 16'h0881 :  // <0378> "

// :end_2176 // = 0x0891

addr == 16'h891 ? 16'h080c :  // <0380> pop i // func clear_ign_history
addr == 16'h892 ? 16'hfc00 :  // <0380> swapra = nop

// ######## event ign_capture_timeout_handler // = 0x0893
// it's been too long since the last ignition pulse detect.
addr == 16'h893 ? 16'hfba0 :  // <0383> callx clear_ign_history
addr == 16'h894 ? 16'h0879 :  // <0383> "
addr == 16'h895 ? 16'hfc00 :  // <0383> "
addr == 16'h896 ? 16'he00f :  // <0384> end_event
addr == 16'h897 ? 16'h009e :  // <0384> "

// ######## event ustimer0_handler // = 0x0898
addr == 16'h898 ? 16'he00f :  // <0387> end_event
addr == 16'h899 ? 16'h009e :  // <0387> "

// ######## event mstimer0_handler // = 0x089a
// unified 1-second periodic timer for all low-resolution tasks.

// start timer again.
addr == 16'h89a ? 16'h4fa0 :  // <0393> mstimer0 = 1000
addr == 16'h89b ? 16'h03e8 :  // <0393> "

// realtime counters in RAM.
addr == 16'h89c ? 16'h6600 :  // <0396> ram a = $ram_seconds_cnt // av_ad_hi = 0
addr == 16'h89d ? 16'h6a42 :  // <0396> ram a = $ram_seconds_cnt // av_ad_lo = 66
addr == 16'h89e ? 16'h0017 :  // <0396> ram a = $ram_seconds_cnt // a = av_write_data // start read cycle
addr == 16'h89f ? 16'h0018 :  // <0396> ram a = $ram_seconds_cnt // a = av_read_data // finish read cycle
addr == 16'h8a0 ? 16'h0601 :  // <0397> b = 1
addr == 16'h8a1 ? 16'hc800 :  // <0398> a = a+b
addr == 16'h8a2 ? 16'h0300 :  // <0398> "

addr == 16'h8a3 ? 16'h0000 :  // <0407> a = a
addr == 16'h8a4 ? 16'h063c :  // <0407> b = 60

addr == 16'h8a5 ? 16'he407 :  // <0399> bn eq :else_2213
addr == 16'h8a6 ? 16'h08b8 :  // <0399> "

addr == 16'h8a7 ? 16'h6600 :  // <0400> ram $ram_seconds_cnt = 0 // av_ad_hi = 0
addr == 16'h8a8 ? 16'h6a42 :  // <0400> ram $ram_seconds_cnt = 0 // av_ad_lo = 66
addr == 16'h8a9 ? 16'h5e00 :  // <0400> ram $ram_seconds_cnt = 0 // av_write_data = 0
addr == 16'h8aa ? 16'h6600 :  // <0401> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h8ab ? 16'h6a40 :  // <0401> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'h8ac ? 16'h0017 :  // <0401> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h8ad ? 16'h0018 :  // <0401> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h8ae ? 16'h0601 :  // <0402> b = 1
addr == 16'h8af ? 16'h6600 :  // <0403> ram $ram_minutes_cnt = a+b // av_ad_hi = 0
addr == 16'h8b0 ? 16'h6a40 :  // <0403> ram $ram_minutes_cnt = a+b // av_ad_lo = 64
addr == 16'h8b1 ? 16'hc800 :  // <0403> ram $ram_minutes_cnt = a+b // av_write_data = a+b
addr == 16'h8b2 ? 16'h5f00 :  // <0403> "
addr == 16'h8b3 ? 16'hfba0 :  // <0404> callx minute_events
addr == 16'h8b4 ? 16'h0abe :  // <0404> "
addr == 16'h8b5 ? 16'hfc00 :  // <0404> "

addr == 16'h8b6 ? 16'he00f :  // <0406> jmp :end_2213
addr == 16'h8b7 ? 16'h08bb :  // <0406> "

addr == 16'h8b8 ? 16'h6600 :  // <0407> ram $ram_seconds_cnt = a // av_ad_hi = 0
addr == 16'h8b9 ? 16'h6a42 :  // <0407> ram $ram_seconds_cnt = a // av_ad_lo = 66
addr == 16'h8ba ? 16'h5c00 :  // <0407> ram $ram_seconds_cnt = a // av_write_data = a


// all 1-second functions here.
addr == 16'h8bb ? 16'hfba0 :  // <0410> callx check_power_relay
addr == 16'h8bc ? 16'h0ac6 :  // <0410> "
addr == 16'h8bd ? 16'hfc00 :  // <0410> "
addr == 16'h8be ? 16'hfba0 :  // <0411> callx check_communication
addr == 16'h8bf ? 16'h0af3 :  // <0411> "
addr == 16'h8c0 ? 16'hfc00 :  // <0411> "
addr == 16'h8c1 ? 16'hfba0 :  // <0412> callx start_daq_pass
addr == 16'h8c2 ? 16'h0946 :  // <0412> "
addr == 16'h8c3 ? 16'hfc00 :  // <0412> "
addr == 16'h8c4 ? 16'he00f :  // <0413> end_event
addr == 16'h8c5 ? 16'h009e :  // <0413> "

// :plan_transition_msg // = 0x08c6
// "PLAN\x0"
addr == 16'h8c6 ? 16'h4c50 :  // <0416> LP
addr == 16'h8c7 ? 16'h4e41 :  // <0416> NA
addr == 16'h8c8 ? 16'h0000 :  // <0416>   

// ######## event mstimer2_handler // = 0x08c9
// engine management plan tick timer.

// restart timer.
addr == 16'h8c9 ? 16'h5614 :  // <0422> mstimer2 = $plan_tick_ms

// start another TPS reading prior to every plan tick.
// this will also invoke a o2 reading.  that's done last of all prior to plan_tick,
// so there's minimal latency between that and the plan_tick utilizing it.
addr == 16'h8ca ? 16'h6600 :  // <0427> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h8cb ? 16'h6a36 :  // <0427> ram a = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'h8cc ? 16'h0017 :  // <0427> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h8cd ? 16'h0018 :  // <0427> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle

addr == 16'h8ce ? 16'h0000 :  // <0430> a = a
addr == 16'h8cf ? 16'h0600 :  // <0430> b = 0

addr == 16'h8d0 ? 16'he407 :  // <0428> bn eq :else_2256
addr == 16'h8d1 ? 16'h08d6 :  // <0428> "

addr == 16'h8d2 ? 16'h2206 :  // <0429> pa = 6
addr == 16'h8d3 ? 16'hfba0 :  // <0429> callx  begin_adc_conversion  $tps_adc_channel
addr == 16'h8d4 ? 16'h09eb :  // <0429> "
addr == 16'h8d5 ? 16'hfc00 :  // <0429> "

addr == 16'h8d6 ? 16'he00f :  // <0431> end_event
addr == 16'h8d7 ? 16'h009e :  // <0431> "

// ######## func plan_tick // = 0x08d8
addr == 16'h8d8 ? 16'h3004 :  // <0448> push x // func plan_tick
addr == 16'h8d9 ? 16'h303e :  // <0448> push rtna // "

// poll the engine management plan.
// call the transition function for the current plan.
// this might perform a transition to some other plan, so it's done first.
addr == 16'h8da ? 16'h6600 :  // <0437> ram rtna = $ram_transition_func // av_ad_hi = 0
addr == 16'h8db ? 16'h6a8c :  // <0437> ram rtna = $ram_transition_func // av_ad_lo = 140
addr == 16'h8dc ? 16'hf817 :  // <0437> ram rtna = $ram_transition_func // rtna = av_write_data // start read cycle
addr == 16'h8dd ? 16'hf818 :  // <0437> ram rtna = $ram_transition_func // rtna = av_read_data // finish read cycle
addr == 16'h8de ? 16'h103e :  // <0438> x = rtna
addr == 16'h8df ? 16'hfc00 :  // <0439> swapra = nop
addr == 16'h8e0 ? 16'h6600 :  // <0441> ram b = $ram_transition_func // av_ad_hi = 0
addr == 16'h8e1 ? 16'h6a8c :  // <0441> ram b = $ram_transition_func // av_ad_lo = 140
addr == 16'h8e2 ? 16'h0417 :  // <0441> ram b = $ram_transition_func // b = av_write_data // start read cycle
addr == 16'h8e3 ? 16'h0418 :  // <0441> ram b = $ram_transition_func // b = av_read_data // finish read cycle

addr == 16'h8e4 ? 16'h0004 :  // <0444> a = x
addr == 16'h8e5 ? 16'h0401 :  // <0444> b = b

addr == 16'h8e6 ? 16'he007 :  // <0442> br eq :else_2278
addr == 16'h8e7 ? 16'h08ed :  // <0442> "

addr == 16'h8e8 ? 16'h23a0 :  // <0443> pa = :plan_transition_msg
addr == 16'h8e9 ? 16'h08c6 :  // <0443> "
addr == 16'h8ea ? 16'hfba0 :  // <0443> callx  set_text_flag  :plan_transition_msg
addr == 16'h8eb ? 16'h0b51 :  // <0443> "
addr == 16'h8ec ? 16'hfc00 :  // <0443> "

// call the puff length function for the current plan.
// this is done last, so if a plan transition just happened, its new puff length will init here.
addr == 16'h8ed ? 16'h6600 :  // <0447> ram rtna = $ram_puff_len_func // av_ad_hi = 0
addr == 16'h8ee ? 16'h6a8a :  // <0447> ram rtna = $ram_puff_len_func // av_ad_lo = 138
addr == 16'h8ef ? 16'hf817 :  // <0447> ram rtna = $ram_puff_len_func // rtna = av_write_data // start read cycle
addr == 16'h8f0 ? 16'hf818 :  // <0447> ram rtna = $ram_puff_len_func // rtna = av_read_data // finish read cycle
addr == 16'h8f1 ? 16'hfc00 :  // <0448> swapra = nop

addr == 16'h8f2 ? 16'hf80c :  // <0451> pop rtna // func plan_tick
addr == 16'h8f3 ? 16'h100c :  // <0451> pop x // "
addr == 16'h8f4 ? 16'hfc00 :  // <0451> swapra = nop

// ######## event uart_rx_handler // = 0x08f5
// :again // = 0x08f5
addr == 16'h8f5 ? 16'hfba0 :  // <0454> pollchar
addr == 16'h8f6 ? 16'h00ba :  // <0454> "
addr == 16'h8f7 ? 16'hfc00 :  // <0454> "
addr == 16'h8f8 ? 16'h1000 :  // <0455> x = a

addr == 16'h8f9 ? 16'h0004 :  // <0458> a = x
addr == 16'h8fa ? 16'h0760 :  // <0458> b = -1

addr == 16'h8fb ? 16'he407 :  // <0456> bn eq :else_2299
addr == 16'h8fc ? 16'h08ff :  // <0456> "

addr == 16'h8fd ? 16'he00f :  // <0457> event_return
addr == 16'h8fe ? 16'h009e :  // <0457> "


addr == 16'h8ff ? 16'h0004 :  // <0461> a = x
addr == 16'h900 ? 16'h060a :  // <0461> b = 10

addr == 16'h901 ? 16'he407 :  // <0459> bn eq :else_2305
addr == 16'h902 ? 16'h0906 :  // <0459> "

addr == 16'h903 ? 16'hfba0 :  // <0460> callx  postpone_comm_restart
addr == 16'h904 ? 16'h0b20 :  // <0460> "
addr == 16'h905 ? 16'hfc00 :  // <0460> "

addr == 16'h906 ? 16'h2004 :  // <0462> pa = x
addr == 16'h907 ? 16'hfba0 :  // <0462> callx  parse_key  x
addr == 16'h908 ? 16'h0290 :  // <0462> "
addr == 16'h909 ? 16'hfc00 :  // <0462> "
addr == 16'h90a ? 16'he00f :  // <0463> jmp :again
addr == 16'h90b ? 16'h08f5 :  // <0463> "
addr == 16'h90c ? 16'he00f :  // <0464> end_event
addr == 16'h90d ? 16'h009e :  // <0464> "

// ######## event uart_rx_overflow_handler // = 0x090e
addr == 16'h90e ? 16'h7fa0 :  // <0467> error_halt_code $err_rx_overflow // leds = 0xfffe
addr == 16'h90f ? 16'hfffe :  // <0467> "
addr == 16'h910 ? 16'he00f :  // <0467> error_halt_code $err_rx_overflow
addr == 16'h911 ? 16'h0910 :  // <0467> "
addr == 16'h912 ? 16'he00f :  // <0468> end_event
addr == 16'h913 ? 16'h009e :  // <0468> "

// :tx_overflow_msg // = 0x0914
// "TXO\x0"
addr == 16'h914 ? 16'h5854 :  // <0471> XT
addr == 16'h915 ? 16'h004f :  // <0471>  O

// ######## event uart_tx_overflow_handler // = 0x0916
// error_halt_code $err_tx_overflow
addr == 16'h916 ? 16'h23a0 :  // <0475> pa = :tx_overflow_msg
addr == 16'h917 ? 16'h0914 :  // <0475> "
addr == 16'h918 ? 16'hfba0 :  // <0475> callx  set_text_flag  :tx_overflow_msg
addr == 16'h919 ? 16'h0b51 :  // <0475> "
addr == 16'h91a ? 16'hfc00 :  // <0475> "
addr == 16'h91b ? 16'he00f :  // <0476> end_event
addr == 16'h91c ? 16'h009e :  // <0476> "

// ######## event key0_handler // = 0x091d
addr == 16'h91d ? 16'h026b :  // <0479> a = 107 // putasc "k"
addr == 16'h91e ? 16'hfba0 :  // <0479> putasc "k"
addr == 16'h91f ? 16'h00ab :  // <0479> "
addr == 16'h920 ? 16'hfc00 :  // <0479> "
addr == 16'h921 ? 16'h0230 :  // <0480> a = 48 // putasc "0"
addr == 16'h922 ? 16'hfba0 :  // <0480> putasc "0"
addr == 16'h923 ? 16'h00ab :  // <0480> "
addr == 16'h924 ? 16'hfc00 :  // <0480> "
addr == 16'h925 ? 16'he00f :  // <0481> end_event
addr == 16'h926 ? 16'h009e :  // <0481> "

// ######## event key1_handler // = 0x0927
addr == 16'h927 ? 16'h026b :  // <0484> a = 107 // putasc "k"
addr == 16'h928 ? 16'hfba0 :  // <0484> putasc "k"
addr == 16'h929 ? 16'h00ab :  // <0484> "
addr == 16'h92a ? 16'hfc00 :  // <0484> "
addr == 16'h92b ? 16'h0231 :  // <0485> a = 49 // putasc "1"
addr == 16'h92c ? 16'hfba0 :  // <0485> putasc "1"
addr == 16'h92d ? 16'h00ab :  // <0485> "
addr == 16'h92e ? 16'hfc00 :  // <0485> "
addr == 16'h92f ? 16'he00f :  // <0486> end_event
addr == 16'h930 ? 16'h009e :  // <0486> "

// ######## event softevent3_handler // = 0x0931
addr == 16'h931 ? 16'he00f :  // <0489> end_event
addr == 16'h932 ? 16'h009e :  // <0489> "

// ######## event softevent2_handler // = 0x0933
addr == 16'h933 ? 16'he00f :  // <0492> end_event
addr == 16'h934 ? 16'h009e :  // <0492> "

// ######## event softevent1_handler // = 0x0935
addr == 16'h935 ? 16'he00f :  // <0495> end_event
addr == 16'h936 ? 16'h009e :  // <0495> "

// ######## event softevent0_handler // = 0x0937
addr == 16'h937 ? 16'he00f :  // <0498> end_event
addr == 16'h938 ? 16'h009e :  // <0498> "

// :rpm_msg // = 0x0939
// ": rpm=\x0"
addr == 16'h939 ? 16'h203a :  // <0501>  :
addr == 16'h93a ? 16'h7072 :  // <0501> pr
addr == 16'h93b ? 16'h3d6d :  // <0501> =m
addr == 16'h93c ? 16'h0000 :  // <0501>   

// :puff_len_msg // = 0x093d
// " pfl=\x0"
addr == 16'h93d ? 16'h7020 :  // <0504> p 
addr == 16'h93e ? 16'h6c66 :  // <0504> lf
addr == 16'h93f ? 16'h003d :  // <0504>  =

// :o2_msg // = 0x0940
// " o2=\x0"
addr == 16'h940 ? 16'h6f20 :  // <0507> o 
addr == 16'h941 ? 16'h3d32 :  // <0507> =2
addr == 16'h942 ? 16'h0000 :  // <0507>   

// :tps_msg // = 0x0943
// " tp=\x0"
addr == 16'h943 ? 16'h7420 :  // <0510> t 
addr == 16'h944 ? 16'h3d70 :  // <0510> =p
addr == 16'h945 ? 16'h0000 :  // <0510>   

// ######## func start_daq_pass // = 0x0946
addr == 16'h946 ? 16'h3004 :  // <0567> push x // func start_daq_pass
addr == 16'h947 ? 16'h303e :  // <0567> push rtna // "

// daq pass counter in RAM.
addr == 16'h948 ? 16'h6600 :  // <0514> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h949 ? 16'h6a14 :  // <0514> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h94a ? 16'h0017 :  // <0514> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h94b ? 16'h0018 :  // <0514> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h94c ? 16'h0601 :  // <0515> b = 1
addr == 16'h94d ? 16'hc800 :  // <0516> a = a+b
addr == 16'h94e ? 16'h0300 :  // <0516> "
addr == 16'h94f ? 16'h7c00 :  // <0517> leds = a
addr == 16'h950 ? 16'h6600 :  // <0518> ram $ram_daq_pass_cnt = a // av_ad_hi = 0
addr == 16'h951 ? 16'h6a14 :  // <0518> ram $ram_daq_pass_cnt = a // av_ad_lo = 20
addr == 16'h952 ? 16'h5c00 :  // <0518> ram $ram_daq_pass_cnt = a // av_write_data = a
addr == 16'h953 ? 16'hfba0 :  // <0519> call :put4x
addr == 16'h954 ? 16'h00d3 :  // <0519> "
addr == 16'h955 ? 16'hfc00 :  // <0519> "

addr == 16'h956 ? 16'h03a0 :  // <0521> a = :rpm_msg
addr == 16'h957 ? 16'h0939 :  // <0521> "
addr == 16'h958 ? 16'hfba0 :  // <0522> call :print_nt
addr == 16'h959 ? 16'h015f :  // <0522> "
addr == 16'h95a ? 16'hfc00 :  // <0522> "
addr == 16'h95b ? 16'h0200 :  // <0523> a = 0
addr == 16'h95c ? 16'h6600 :  // <0524> ram x = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h95d ? 16'h6a7e :  // <0524> ram x = $ram_rpm_valid // av_ad_lo = 126
addr == 16'h95e ? 16'h1017 :  // <0524> ram x = $ram_rpm_valid // x = av_write_data // start read cycle
addr == 16'h95f ? 16'h1018 :  // <0524> ram x = $ram_rpm_valid // x = av_read_data // finish read cycle

addr == 16'h960 ? 16'h0004 :  // <0527> a = x
addr == 16'h961 ? 16'h0600 :  // <0527> b = 0

addr == 16'h962 ? 16'he007 :  // <0525> br eq :else_2402
addr == 16'h963 ? 16'h0968 :  // <0525> "

addr == 16'h964 ? 16'h6600 :  // <0526> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h965 ? 16'h6a7c :  // <0526> ram a = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h966 ? 16'h0017 :  // <0526> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h967 ? 16'h0018 :  // <0526> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle

addr == 16'h968 ? 16'hfba0 :  // <0528> call :put4x
addr == 16'h969 ? 16'h00d3 :  // <0528> "
addr == 16'h96a ? 16'hfc00 :  // <0528> "

addr == 16'h96b ? 16'h03a0 :  // <0530> a = :puff_len_msg
addr == 16'h96c ? 16'h093d :  // <0530> "
addr == 16'h96d ? 16'hfba0 :  // <0531> call :print_nt
addr == 16'h96e ? 16'h015f :  // <0531> "
addr == 16'h96f ? 16'hfc00 :  // <0531> "
addr == 16'h970 ? 16'h0025 :  // <0532> a = puff_len_us
addr == 16'h971 ? 16'hfba0 :  // <0533> call :put4x
addr == 16'h972 ? 16'h00d3 :  // <0533> "
addr == 16'h973 ? 16'hfc00 :  // <0533> "
addr == 16'h974 ? 16'h022c :  // <0534> a = 44 // putasc ","
addr == 16'h975 ? 16'hfba0 :  // <0534> putasc ","
addr == 16'h976 ? 16'h00ab :  // <0534> "
addr == 16'h977 ? 16'hfc00 :  // <0534> "
addr == 16'h978 ? 16'h6600 :  // <0535> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h979 ? 16'h6a92 :  // <0535> ram a = $ram_puff_count // av_ad_lo = 146
addr == 16'h97a ? 16'h0017 :  // <0535> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h97b ? 16'h0018 :  // <0535> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h97c ? 16'hfba0 :  // <0536> call :put4x
addr == 16'h97d ? 16'h00d3 :  // <0536> "
addr == 16'h97e ? 16'hfc00 :  // <0536> "

addr == 16'h97f ? 16'h03a0 :  // <0538> a = :o2_msg
addr == 16'h980 ? 16'h0940 :  // <0538> "
addr == 16'h981 ? 16'hfba0 :  // <0539> call :print_nt
addr == 16'h982 ? 16'h015f :  // <0539> "
addr == 16'h983 ? 16'hfc00 :  // <0539> "
addr == 16'h984 ? 16'h0205 :  // <0540> a = $o2_adc_channel

addr == 16'h985 ? 16'h0351 :  // <0541> a = a<<1
addr == 16'h986 ? 16'h0626 :  // <0541> b = 38
addr == 16'h987 ? 16'h6600 :  // <0541> av_ad_hi = 0
addr == 16'h988 ? 16'h6b00 :  // <0541> av_ad_lo = ad0
addr == 16'h989 ? 16'h0417 :  // <0541> b = av_write_data
addr == 16'h98a ? 16'h0418 :  // <0541> b = av_read_data

addr == 16'h98b ? 16'h0001 :  // <0542> a = b
addr == 16'h98c ? 16'hfba0 :  // <0543> call :put4x
addr == 16'h98d ? 16'h00d3 :  // <0543> "
addr == 16'h98e ? 16'hfc00 :  // <0543> "

addr == 16'h98f ? 16'h03a0 :  // <0545> a = :tps_msg
addr == 16'h990 ? 16'h0943 :  // <0545> "
addr == 16'h991 ? 16'hfba0 :  // <0546> call :print_nt
addr == 16'h992 ? 16'h015f :  // <0546> "
addr == 16'h993 ? 16'hfc00 :  // <0546> "
addr == 16'h994 ? 16'h0206 :  // <0547> a = $tps_adc_channel

addr == 16'h995 ? 16'h0351 :  // <0548> a = a<<1
addr == 16'h996 ? 16'h0626 :  // <0548> b = 38
addr == 16'h997 ? 16'h6600 :  // <0548> av_ad_hi = 0
addr == 16'h998 ? 16'h6b00 :  // <0548> av_ad_lo = ad0
addr == 16'h999 ? 16'h0417 :  // <0548> b = av_write_data
addr == 16'h99a ? 16'h0418 :  // <0548> b = av_read_data

addr == 16'h99b ? 16'h0001 :  // <0549> a = b
addr == 16'h99c ? 16'hfba0 :  // <0550> call :put4x
addr == 16'h99d ? 16'h00d3 :  // <0550> "
addr == 16'h99e ? 16'hfc00 :  // <0550> "
addr == 16'h99f ? 16'h022c :  // <0551> a = 44 // putasc ","
addr == 16'h9a0 ? 16'hfba0 :  // <0551> putasc ","
addr == 16'h9a1 ? 16'h00ab :  // <0551> "
addr == 16'h9a2 ? 16'hfc00 :  // <0551> "
addr == 16'h9a3 ? 16'h6600 :  // <0552> ram a = $ram_tps_avg // av_ad_hi = 0
addr == 16'h9a4 ? 16'h6ba0 :  // <0552> ram a = $ram_tps_avg // av_ad_lo = 338
addr == 16'h9a5 ? 16'h0152 :  // <0552> "
addr == 16'h9a6 ? 16'h0017 :  // <0552> ram a = $ram_tps_avg // a = av_write_data // start read cycle
addr == 16'h9a7 ? 16'h0018 :  // <0552> ram a = $ram_tps_avg // a = av_read_data // finish read cycle
addr == 16'h9a8 ? 16'hfba0 :  // <0553> call :put4x
addr == 16'h9a9 ? 16'h00d3 :  // <0553> "
addr == 16'h9aa ? 16'hfc00 :  // <0553> "
addr == 16'h9ab ? 16'h022c :  // <0554> a = 44 // putasc ","
addr == 16'h9ac ? 16'hfba0 :  // <0554> putasc ","
addr == 16'h9ad ? 16'h00ab :  // <0554> "
addr == 16'h9ae ? 16'hfc00 :  // <0554> "
addr == 16'h9af ? 16'h6600 :  // <0555> ram a = $ram_tps_state // av_ad_hi = 0
addr == 16'h9b0 ? 16'h6ace :  // <0555> ram a = $ram_tps_state // av_ad_lo = 206
addr == 16'h9b1 ? 16'h0017 :  // <0555> ram a = $ram_tps_state // a = av_write_data // start read cycle
addr == 16'h9b2 ? 16'h0018 :  // <0555> ram a = $ram_tps_state // a = av_read_data // finish read cycle
addr == 16'h9b3 ? 16'h0630 :  // <0556> b = 48 // asc b = "0"
addr == 16'h9b4 ? 16'hc800 :  // <0557> a = a+b // putchar a+b
addr == 16'h9b5 ? 16'h0300 :  // <0557> "
addr == 16'h9b6 ? 16'hfba0 :  // <0557> putchar a+b
addr == 16'h9b7 ? 16'h00ab :  // <0557> "
addr == 16'h9b8 ? 16'hfc00 :  // <0557> "

// start to acquire & report all anmux channels.
addr == 16'h9b9 ? 16'h0207 :  // <0560> a = ($anmux_num_channels - 1)
addr == 16'h9ba ? 16'hfba0 :  // <0561> call :anmux_set_chn
addr == 16'h9bb ? 16'h00c2 :  // <0561> "
addr == 16'h9bc ? 16'hfc00 :  // <0561> "
addr == 16'h9bd ? 16'h5205 :  // <0562> mstimer1 = $anmux_settle_ms

// observe MCU utilization.  this RAM variable can be seen by the debugger.
addr == 16'h9be ? 16'h6600 :  // <0565> ram $ram_mcu_usage_cnt = usage_count // av_ad_hi = 0
addr == 16'h9bf ? 16'h6a44 :  // <0565> ram $ram_mcu_usage_cnt = usage_count // av_ad_lo = 68
addr == 16'h9c0 ? 16'h5c0f :  // <0565> ram $ram_mcu_usage_cnt = usage_count // av_write_data = usage_count
addr == 16'h9c1 ? 16'h3e00 :  // <0566> usage_count = 0

addr == 16'h9c2 ? 16'hf80c :  // <0568> pop rtna // func start_daq_pass
addr == 16'h9c3 ? 16'h100c :  // <0568> pop x // "
addr == 16'h9c4 ? 16'hfc00 :  // <0568> swapra = nop

// ######## event mstimer1_handler // = 0x09c5
// anmux signal has settled.

addr == 16'h9c5 ? 16'h6600 :  // <0572> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h9c6 ? 16'h6a36 :  // <0572> ram a = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'h9c7 ? 16'h0017 :  // <0572> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h9c8 ? 16'h0018 :  // <0572> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle

addr == 16'h9c9 ? 16'h0000 :  // <0577> a = a
addr == 16'h9ca ? 16'h0600 :  // <0577> b = 0

addr == 16'h9cb ? 16'he007 :  // <0573> br eq :else_2507
addr == 16'h9cc ? 16'h09d0 :  // <0573> "

// ADC is busy right now.  wait a while & try again.
addr == 16'h9cd ? 16'h5202 :  // <0575> mstimer1 = $anmux_retry_ms
addr == 16'h9ce ? 16'he00f :  // <0576> event_return
addr == 16'h9cf ? 16'h009e :  // <0576> "


// start a reading from the current anmux channel.
addr == 16'h9d0 ? 16'h0220 :  // <0580> a = 32 // putasc " "
addr == 16'h9d1 ? 16'hfba0 :  // <0580> putasc " "
addr == 16'h9d2 ? 16'h00ab :  // <0580> "
addr == 16'h9d3 ? 16'hfc00 :  // <0580> "
addr == 16'h9d4 ? 16'h0273 :  // <0581> a = 115 // putasc "s"
addr == 16'h9d5 ? 16'hfba0 :  // <0581> putasc "s"
addr == 16'h9d6 ? 16'h00ab :  // <0581> "
addr == 16'h9d7 ? 16'hfc00 :  // <0581> "
addr == 16'h9d8 ? 16'hfba0 :  // <0582> call :anmux_get_chn
addr == 16'h9d9 ? 16'h00c6 :  // <0582> "
addr == 16'h9da ? 16'hfc00 :  // <0582> "
addr == 16'h9db ? 16'h0630 :  // <0583> b = 48 // asc b = "0"
addr == 16'h9dc ? 16'hc800 :  // <0584> a = a+b // putchar a+b
addr == 16'h9dd ? 16'h0300 :  // <0584> "
addr == 16'h9de ? 16'hfba0 :  // <0584> putchar a+b
addr == 16'h9df ? 16'h00ab :  // <0584> "
addr == 16'h9e0 ? 16'hfc00 :  // <0584> "
addr == 16'h9e1 ? 16'h023d :  // <0585> a = 61 // putasc "="
addr == 16'h9e2 ? 16'hfba0 :  // <0585> putasc "="
addr == 16'h9e3 ? 16'h00ab :  // <0585> "
addr == 16'h9e4 ? 16'hfc00 :  // <0585> "
addr == 16'h9e5 ? 16'h2207 :  // <0586> pa = 7
addr == 16'h9e6 ? 16'hfba0 :  // <0586> callx  begin_adc_conversion  $anmux_adc_channel
addr == 16'h9e7 ? 16'h09eb :  // <0586> "
addr == 16'h9e8 ? 16'hfc00 :  // <0586> "
addr == 16'h9e9 ? 16'he00f :  // <0587> end_event
addr == 16'h9ea ? 16'h009e :  // <0587> "

// ######## func begin_adc_conversion // = 0x09eb

// begin SPI transaction, specifying Nano ADC channel to take effect NEXT
// conversion after this one.

addr == 16'h9eb ? 16'h6600 :  // <0593> ram $ram_adc_chn_pending = next_channel // av_ad_hi = 0
addr == 16'h9ec ? 16'h6a36 :  // <0593> ram $ram_adc_chn_pending = next_channel // av_ad_lo = 54
addr == 16'h9ed ? 16'h5c08 :  // <0593> ram $ram_adc_chn_pending = next_channel // av_write_data = next_channel
addr == 16'h9ee ? 16'h0008 :  // <0594> a = next_channel
addr == 16'h9ef ? 16'h0352 :  // <0595> a = a<<4
addr == 16'h9f0 ? 16'h0352 :  // <0596> a = a<<4
addr == 16'h9f1 ? 16'h0351 :  // <0597> a = a<<1
addr == 16'h9f2 ? 16'h0351 :  // <0598> a = a<<1
addr == 16'h9f3 ? 16'h0351 :  // <0599> a = a<<1
addr == 16'h9f4 ? 16'h5800 :  // <0600> spi_data = a
addr == 16'h9f5 ? 16'h6600 :  // <0601> ram $ram_adc_junk = 1 // av_ad_hi = 0
addr == 16'h9f6 ? 16'h6a38 :  // <0601> ram $ram_adc_junk = 1 // av_ad_lo = 56
addr == 16'h9f7 ? 16'h5e01 :  // <0601> ram $ram_adc_junk = 1 // av_write_data = 1

addr == 16'h9f8 ? 16'hfc00 :  // <0603> swapra = nop

// ######## event spi_done_handler // = 0x09f9
// discard the results of the first SPI exchange with the ADC.  that's only for writing the channel num out to the ADC.
addr == 16'h9f9 ? 16'h6600 :  // <0606> ram a = $ram_adc_junk // av_ad_hi = 0
addr == 16'h9fa ? 16'h6a38 :  // <0606> ram a = $ram_adc_junk // av_ad_lo = 56
addr == 16'h9fb ? 16'h0017 :  // <0606> ram a = $ram_adc_junk // a = av_write_data // start read cycle
addr == 16'h9fc ? 16'h0018 :  // <0606> ram a = $ram_adc_junk // a = av_read_data // finish read cycle

addr == 16'h9fd ? 16'h0000 :  // <0618> a = a
addr == 16'h9fe ? 16'h0600 :  // <0618> b = 0

addr == 16'h9ff ? 16'he007 :  // <0607> br eq :else_2559
addr == 16'ha00 ? 16'h0a10 :  // <0607> "

// start another SPI exchange to retrieve the actual reading.
addr == 16'ha01 ? 16'h6600 :  // <0609> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'ha02 ? 16'h6a36 :  // <0609> ram a = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'ha03 ? 16'h0017 :  // <0609> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'ha04 ? 16'h0018 :  // <0609> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle
addr == 16'ha05 ? 16'h0352 :  // <0610> a = a<<4
addr == 16'ha06 ? 16'h0352 :  // <0611> a = a<<4
addr == 16'ha07 ? 16'h0351 :  // <0612> a = a<<1
addr == 16'ha08 ? 16'h0351 :  // <0613> a = a<<1
addr == 16'ha09 ? 16'h0351 :  // <0614> a = a<<1
addr == 16'ha0a ? 16'h5800 :  // <0615> spi_data = a
addr == 16'ha0b ? 16'h6600 :  // <0616> ram $ram_adc_junk = 0 // av_ad_hi = 0
addr == 16'ha0c ? 16'h6a38 :  // <0616> ram $ram_adc_junk = 0 // av_ad_lo = 56
addr == 16'ha0d ? 16'h5e00 :  // <0616> ram $ram_adc_junk = 0 // av_write_data = 0
addr == 16'ha0e ? 16'he00f :  // <0617> event_return
addr == 16'ha0f ? 16'h009e :  // <0617> "


// memorize an actual ADC reading.
addr == 16'ha10 ? 16'h6600 :  // <0621> ram i = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'ha11 ? 16'h6a36 :  // <0621> ram i = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'ha12 ? 16'h0817 :  // <0621> ram i = $ram_adc_chn_pending // i = av_write_data // start read cycle
addr == 16'ha13 ? 16'h0818 :  // <0621> ram i = $ram_adc_chn_pending // i = av_read_data // finish read cycle
addr == 16'ha14 ? 16'h6600 :  // <0622> ram $ram_adc_chn_pending = 0 // av_ad_hi = 0
addr == 16'ha15 ? 16'h6a36 :  // <0622> ram $ram_adc_chn_pending = 0 // av_ad_lo = 54
addr == 16'ha16 ? 16'h5e00 :  // <0622> ram $ram_adc_chn_pending = 0 // av_write_data = 0
addr == 16'ha17 ? 16'h0002 :  // <0623> a = i
addr == 16'ha18 ? 16'h0416 :  // <0624> b = spi_data

addr == 16'ha19 ? 16'h0351 :  // <0625> a = a<<1
addr == 16'ha1a ? 16'h3001 :  // <0625> push b // push b
addr == 16'ha1b ? 16'h0626 :  // <0625> b = 38
addr == 16'ha1c ? 16'h6600 :  // <0625> av_ad_hi = 0
addr == 16'ha1d ? 16'h6b00 :  // <0625> av_ad_lo = ad0
addr == 16'ha1e ? 16'h5c0c :  // <0625> pop av_write_data // pop av_write_data


// react to ADC reading.

addr == 16'ha1f ? 16'h0002 :  // <0632> a = i
addr == 16'ha20 ? 16'h0606 :  // <0632> b = 6

addr == 16'ha21 ? 16'he407 :  // <0628> bn eq :else_2593
addr == 16'ha22 ? 16'h0a2c :  // <0628> "

addr == 16'ha23 ? 16'h2205 :  // <0629> pa = 5
addr == 16'ha24 ? 16'hfba0 :  // <0629> callx  begin_adc_conversion  $o2_adc_channel
addr == 16'ha25 ? 16'h09eb :  // <0629> "
addr == 16'ha26 ? 16'hfc00 :  // <0629> "
addr == 16'ha27 ? 16'hfba0 :  // <0630> callx  interpret_tps
addr == 16'ha28 ? 16'h0bd8 :  // <0630> "
addr == 16'ha29 ? 16'hfc00 :  // <0630> "
addr == 16'ha2a ? 16'he00f :  // <0631> event_return
addr == 16'ha2b ? 16'h009e :  // <0631> "


addr == 16'ha2c ? 16'h0002 :  // <0636> a = i
addr == 16'ha2d ? 16'h0605 :  // <0636> b = 5

addr == 16'ha2e ? 16'he407 :  // <0633> bn eq :else_2606
addr == 16'ha2f ? 16'h0a36 :  // <0633> "

addr == 16'ha30 ? 16'h2204 :  // <0634> pa = 4
addr == 16'ha31 ? 16'hfba0 :  // <0634> callx  begin_adc_conversion  $maf_adc_channel
addr == 16'ha32 ? 16'h09eb :  // <0634> "
addr == 16'ha33 ? 16'hfc00 :  // <0634> "
addr == 16'ha34 ? 16'he00f :  // <0635> event_return
addr == 16'ha35 ? 16'h009e :  // <0635> "


addr == 16'ha36 ? 16'h0002 :  // <0641> a = i
addr == 16'ha37 ? 16'h0604 :  // <0641> b = 4

addr == 16'ha38 ? 16'he407 :  // <0637> bn eq :else_2616
addr == 16'ha39 ? 16'h0a42 :  // <0637> "

addr == 16'ha3a ? 16'hfba0 :  // <0638> callx  interpret_maf
addr == 16'ha3b ? 16'h0bd7 :  // <0638> "
addr == 16'ha3c ? 16'hfc00 :  // <0638> "
addr == 16'ha3d ? 16'hfba0 :  // <0639> callx  plan_tick
addr == 16'ha3e ? 16'h08d8 :  // <0639> "
addr == 16'ha3f ? 16'hfc00 :  // <0639> "
addr == 16'ha40 ? 16'he00f :  // <0640> event_return
addr == 16'ha41 ? 16'h009e :  // <0640> "


addr == 16'ha42 ? 16'h0002 :  // <0668> a = i
addr == 16'ha43 ? 16'h0607 :  // <0668> b = 7

addr == 16'ha44 ? 16'he407 :  // <0642> bn eq :else_2628
addr == 16'ha45 ? 16'h0a77 :  // <0642> "

// report anmux reading.
addr == 16'ha46 ? 16'h0016 :  // <0644> a = spi_data
addr == 16'ha47 ? 16'hfba0 :  // <0645> call :put4x
addr == 16'ha48 ? 16'h00d3 :  // <0645> "
addr == 16'ha49 ? 16'hfc00 :  // <0645> "

// memorize anmux reading.
addr == 16'ha4a ? 16'hfba0 :  // <0648> call :anmux_get_chn
addr == 16'ha4b ? 16'h00c6 :  // <0648> "
addr == 16'ha4c ? 16'hfc00 :  // <0648> "
addr == 16'ha4d ? 16'h0416 :  // <0649> b = spi_data

addr == 16'ha4e ? 16'h0351 :  // <0650> a = a<<1
addr == 16'ha4f ? 16'h3001 :  // <0650> push b // push b
addr == 16'ha50 ? 16'h0616 :  // <0650> b = 22
addr == 16'ha51 ? 16'h6600 :  // <0650> av_ad_hi = 0
addr == 16'ha52 ? 16'h6b00 :  // <0650> av_ad_lo = ad0
addr == 16'ha53 ? 16'h5c0c :  // <0650> pop av_write_data // pop av_write_data


// decrement anmux channel & start waiting again.
addr == 16'ha54 ? 16'hfba0 :  // <0653> call :anmux_get_chn
addr == 16'ha55 ? 16'h00c6 :  // <0653> "
addr == 16'ha56 ? 16'hfc00 :  // <0653> "

addr == 16'ha57 ? 16'h0000 :  // <0660> a = a
addr == 16'ha58 ? 16'h0600 :  // <0660> b = 0

addr == 16'ha59 ? 16'he007 :  // <0654> br eq :else_2649
addr == 16'ha5a ? 16'h0a64 :  // <0654> "

addr == 16'ha5b ? 16'h0760 :  // <0655> b = -1
addr == 16'ha5c ? 16'hc800 :  // <0656> a = a+b
addr == 16'ha5d ? 16'h0300 :  // <0656> "
addr == 16'ha5e ? 16'hfba0 :  // <0657> call :anmux_set_chn
addr == 16'ha5f ? 16'h00c2 :  // <0657> "
addr == 16'ha60 ? 16'hfc00 :  // <0657> "
addr == 16'ha61 ? 16'h5205 :  // <0658> mstimer1 = $anmux_settle_ms
addr == 16'ha62 ? 16'he00f :  // <0659> event_return
addr == 16'ha63 ? 16'h009e :  // <0659> "


// end of temperature daq pass.
addr == 16'ha64 ? 16'hfba0 :  // <0663> callx  report_plan
addr == 16'ha65 ? 16'h0bbb :  // <0663> "
addr == 16'ha66 ? 16'hfc00 :  // <0663> "
addr == 16'ha67 ? 16'hfba0 :  // <0664> callx  report_text_flags
addr == 16'ha68 ? 16'h0b88 :  // <0664> "
addr == 16'ha69 ? 16'hfc00 :  // <0664> "
addr == 16'ha6a ? 16'h020d :  // <0665> a = 13 // puteol
addr == 16'ha6b ? 16'hfba0 :  // <0665> puteol
addr == 16'ha6c ? 16'h00ab :  // <0665> "
addr == 16'ha6d ? 16'hfc00 :  // <0665> "
addr == 16'ha6e ? 16'h020a :  // <0665> a = 10 // puteol
addr == 16'ha6f ? 16'hfba0 :  // <0665> puteol
addr == 16'ha70 ? 16'h00ab :  // <0665> "
addr == 16'ha71 ? 16'hfc00 :  // <0665> "
addr == 16'ha72 ? 16'h6600 :  // <0666> ram $ram_dial_setting = spi_data // av_ad_hi = 0
addr == 16'ha73 ? 16'h6a3a :  // <0666> ram $ram_dial_setting = spi_data // av_ad_lo = 58
addr == 16'ha74 ? 16'h5c16 :  // <0666> ram $ram_dial_setting = spi_data // av_write_data = spi_data
addr == 16'ha75 ? 16'he00f :  // <0667> event_return
addr == 16'ha76 ? 16'h009e :  // <0667> "

addr == 16'ha77 ? 16'he00f :  // <0669> end_event
addr == 16'ha78 ? 16'h009e :  // <0669> "

// :power_lost_msg // = 0x0a79
// "PWL\x0"
addr == 16'ha79 ? 16'h5750 :  // <0672> WP
addr == 16'ha7a ? 16'h004c :  // <0672>  L

// ######## event power_lost_handler // = 0x0a7b
// at this time we have less than 2 ms of usable run time left.

// this must be an uncommanded loss of main power, because if it was commanded,
// no more events would be handled; this event handler wouldn't have a chance to run.
// immediately set the power relay PWM to full power for a few seconds,
// in case the power relay opened accidentally e.g. due to a hard pothole.
addr == 16'ha7b ? 16'h8a00 :  // <0681> power_duty = $power_duty_closing
addr == 16'ha7c ? 16'h6600 :  // <0682> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'ha7d ? 16'h6a14 :  // <0682> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'ha7e ? 16'h0017 :  // <0682> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'ha7f ? 16'h0018 :  // <0682> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'ha80 ? 16'h0602 :  // <0683> b = $relay_hold_passes
addr == 16'ha81 ? 16'h6600 :  // <0684> ram $ram_relay_hold_at_pass = a+b // av_ad_hi = 0
addr == 16'ha82 ? 16'h6a3e :  // <0684> ram $ram_relay_hold_at_pass = a+b // av_ad_lo = 62
addr == 16'ha83 ? 16'hc800 :  // <0684> ram $ram_relay_hold_at_pass = a+b // av_write_data = a+b
addr == 16'ha84 ? 16'h5f00 :  // <0684> "

// pause any non-vital power-hogging operations, to conserve power for the EEPROM write.

// save persistent data in case the power remains down e.g. due to battery disconnect.
addr == 16'ha85 ? 16'hfba0 :  // <0689> callx  save_persistent_data
addr == 16'ha86 ? 16'h0af2 :  // <0689> "
addr == 16'ha87 ? 16'hfc00 :  // <0689> "

addr == 16'ha88 ? 16'h23a0 :  // <0691> pa = :power_lost_msg
addr == 16'ha89 ? 16'h0a79 :  // <0691> "
addr == 16'ha8a ? 16'hfba0 :  // <0691> callx  set_text_flag  :power_lost_msg
addr == 16'ha8b ? 16'h0b51 :  // <0691> "
addr == 16'ha8c ? 16'hfc00 :  // <0691> "
addr == 16'ha8d ? 16'he00f :  // <0692> end_event
addr == 16'ha8e ? 16'h009e :  // <0692> "

// :ign_off_msg // = 0x0a8f
// "IGOF\x0"
addr == 16'ha8f ? 16'h4749 :  // <0695> GI
addr == 16'ha90 ? 16'h464f :  // <0695> FO
addr == 16'ha91 ? 16'h0000 :  // <0695>   

// ######## event ign_switch_off_handler // = 0x0a92
// set power-down deadline in RAM.  this makes the system remain powered for several more minutes, for cooldown data logging.
addr == 16'ha92 ? 16'h6600 :  // <0699> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'ha93 ? 16'h6a40 :  // <0699> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'ha94 ? 16'h0017 :  // <0699> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'ha95 ? 16'h0018 :  // <0699> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'ha96 ? 16'h060a :  // <0700> b = $power_extend_minutes
addr == 16'ha97 ? 16'h6600 :  // <0701> ram $ram_power_down_at_min = a+b // av_ad_hi = 0
addr == 16'ha98 ? 16'h6a3c :  // <0701> ram $ram_power_down_at_min = a+b // av_ad_lo = 60
addr == 16'ha99 ? 16'hc800 :  // <0701> ram $ram_power_down_at_min = a+b // av_write_data = a+b
addr == 16'ha9a ? 16'h5f00 :  // <0701> "
addr == 16'ha9b ? 16'h23a0 :  // <0702> pa = :ign_off_msg
addr == 16'ha9c ? 16'h0a8f :  // <0702> "
addr == 16'ha9d ? 16'hfba0 :  // <0702> callx  set_text_flag   :ign_off_msg
addr == 16'ha9e ? 16'h0b51 :  // <0702> "
addr == 16'ha9f ? 16'hfc00 :  // <0702> "
addr == 16'haa0 ? 16'he00f :  // <0703> end_event
addr == 16'haa1 ? 16'h009e :  // <0703> "

// :ign_on_msg // = 0x0aa2
// "IGON\x0"
addr == 16'haa2 ? 16'h4749 :  // <0706> GI
addr == 16'haa3 ? 16'h4e4f :  // <0706> NO
addr == 16'haa4 ? 16'h0000 :  // <0706>   

// ######## event ign_switch_on_handler // = 0x0aa5
addr == 16'haa5 ? 16'h6600 :  // <0709> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'haa6 ? 16'h6a3c :  // <0709> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 60
addr == 16'haa7 ? 16'h5f60 :  // <0709> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'haa8 ? 16'h23a0 :  // <0710> pa = :ign_on_msg
addr == 16'haa9 ? 16'h0aa2 :  // <0710> "
addr == 16'haaa ? 16'hfba0 :  // <0710> callx  set_text_flag   :ign_on_msg
addr == 16'haab ? 16'h0b51 :  // <0710> "
addr == 16'haac ? 16'hfc00 :  // <0710> "
addr == 16'haad ? 16'he00f :  // <0711> end_event
addr == 16'haae ? 16'h009e :  // <0711> "

// ######## event puff1_done_handler // = 0x0aaf
// puff just finished.  set length of next puff.
addr == 16'haaf ? 16'h6600 :  // <0715> ram puff_len_us = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'hab0 ? 16'h6a90 :  // <0715> ram puff_len_us = $ram_next_puff_len_us // av_ad_lo = 144
addr == 16'hab1 ? 16'h9417 :  // <0715> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_write_data // start read cycle
addr == 16'hab2 ? 16'h9418 :  // <0715> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_read_data // finish read cycle

// count puffs.
addr == 16'hab3 ? 16'h6600 :  // <0718> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'hab4 ? 16'h6a92 :  // <0718> ram a = $ram_puff_count // av_ad_lo = 146
addr == 16'hab5 ? 16'h0017 :  // <0718> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'hab6 ? 16'h0018 :  // <0718> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'hab7 ? 16'h0601 :  // <0719> b = 1
addr == 16'hab8 ? 16'h6600 :  // <0720> ram $ram_puff_count = a+b // av_ad_hi = 0
addr == 16'hab9 ? 16'h6a92 :  // <0720> ram $ram_puff_count = a+b // av_ad_lo = 146
addr == 16'haba ? 16'hc800 :  // <0720> ram $ram_puff_count = a+b // av_write_data = a+b
addr == 16'habb ? 16'h5f00 :  // <0720> "

// hack to set puff length strictly by a hard-wired knob.
// ram a = $ram_dial_setting
// a = a<<1
// a = a<<1
// a = a<<1
// bn az :nonzero
// a = 1
// :nonzero
// puff_len_us = a
addr == 16'habc ? 16'he00f :  // <0731> end_event
addr == 16'habd ? 16'h009e :  // <0731> "

// ######## func minute_events // = 0x0abe
addr == 16'habe ? 16'h303e :  // <0735> push rtna // func minute_events

addr == 16'habf ? 16'hfba0 :  // <0734> callx  check_power_down
addr == 16'hac0 ? 16'h0adb :  // <0734> "
addr == 16'hac1 ? 16'hfc00 :  // <0734> "

addr == 16'hac2 ? 16'hf80c :  // <0736> pop rtna // func minute_events
addr == 16'hac3 ? 16'hfc00 :  // <0736> swapra = nop

// :power_hold_msg // = 0x0ac4
// "PWH\x0"
addr == 16'hac4 ? 16'h5750 :  // <0738> WP
addr == 16'hac5 ? 16'h0048 :  // <0738>  H

// ######## func check_power_relay // = 0x0ac6
addr == 16'hac6 ? 16'h303e :  // <0748> push rtna // func check_power_relay

addr == 16'hac7 ? 16'h6600 :  // <0741> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'hac8 ? 16'h6a14 :  // <0741> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'hac9 ? 16'h0017 :  // <0741> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'haca ? 16'h0018 :  // <0741> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'hacb ? 16'h6600 :  // <0742> ram b = $ram_relay_hold_at_pass // av_ad_hi = 0
addr == 16'hacc ? 16'h6a3e :  // <0742> ram b = $ram_relay_hold_at_pass // av_ad_lo = 62
addr == 16'hacd ? 16'h0417 :  // <0742> ram b = $ram_relay_hold_at_pass // b = av_write_data // start read cycle
addr == 16'hace ? 16'h0418 :  // <0742> ram b = $ram_relay_hold_at_pass // b = av_read_data // finish read cycle

addr == 16'hacf ? 16'h0000 :  // <0747> a = a
addr == 16'had0 ? 16'h0401 :  // <0747> b = b

addr == 16'had1 ? 16'he407 :  // <0743> bn eq :else_2769
addr == 16'had2 ? 16'h0ad9 :  // <0743> "

// time to begin "solenoid saver" coil power reduction by PWM.
addr == 16'had3 ? 16'h8a19 :  // <0745> power_duty = $power_duty_holding
addr == 16'had4 ? 16'h23a0 :  // <0746> pa = :power_hold_msg
addr == 16'had5 ? 16'h0ac4 :  // <0746> "
addr == 16'had6 ? 16'hfba0 :  // <0746> callx  set_text_flag  :power_hold_msg
addr == 16'had7 ? 16'h0b51 :  // <0746> "
addr == 16'had8 ? 16'hfc00 :  // <0746> "


addr == 16'had9 ? 16'hf80c :  // <0749> pop rtna // func check_power_relay
addr == 16'hada ? 16'hfc00 :  // <0749> swapra = nop

// ######## func check_power_down // = 0x0adb

// check power-down deadline in RAM.
addr == 16'hadb ? 16'h6600 :  // <0752> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'hadc ? 16'h6a40 :  // <0752> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'hadd ? 16'h0017 :  // <0752> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'hade ? 16'h0018 :  // <0752> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'hadf ? 16'h6600 :  // <0753> ram b = $ram_power_down_at_min // av_ad_hi = 0
addr == 16'hae0 ? 16'h6a3c :  // <0753> ram b = $ram_power_down_at_min // av_ad_lo = 60
addr == 16'hae1 ? 16'h0417 :  // <0753> ram b = $ram_power_down_at_min // b = av_write_data // start read cycle
addr == 16'hae2 ? 16'h0418 :  // <0753> ram b = $ram_power_down_at_min // b = av_read_data // finish read cycle

addr == 16'hae3 ? 16'h0000 :  // <0756> a = a
addr == 16'hae4 ? 16'h0401 :  // <0756> b = b

addr == 16'hae5 ? 16'he407 :  // <0754> bn eq :else_2789
addr == 16'hae6 ? 16'h0ae9 :  // <0754> "

addr == 16'hae7 ? 16'he00f :  // <0755> jmp :power_down
addr == 16'hae8 ? 16'h0aea :  // <0755> "


addr == 16'hae9 ? 16'hfc00 :  // <0758> swapra = nop

// :power_down // = 0x0aea
// this code never returns.
addr == 16'haea ? 16'hfba0 :  // <0761> callx  save_persistent_data
addr == 16'haeb ? 16'h0af2 :  // <0761> "
addr == 16'haec ? 16'hfc00 :  // <0761> "
addr == 16'haed ? 16'h8a32 :  // <0762> power_duty = $power_duty_opening
addr == 16'haee ? 16'h7fa0 :  // <0763> error_halt_code $err_power_down // leds = 0xfffc
addr == 16'haef ? 16'hfffc :  // <0763> "
addr == 16'haf0 ? 16'he00f :  // <0763> error_halt_code $err_power_down
addr == 16'haf1 ? 16'h0af0 :  // <0763> "

// ######## func save_persistent_data // = 0x0af2


addr == 16'haf2 ? 16'hfc00 :  // <0767> swapra = nop

// ######## func check_communication // = 0x0af3
addr == 16'haf3 ? 16'h303e :  // <0787> push rtna // func check_communication

addr == 16'haf4 ? 16'h6600 :  // <0769> ram a = $ram_ftdi_downtime_remain_sec // av_ad_hi = 0
addr == 16'haf5 ? 16'h6a12 :  // <0769> ram a = $ram_ftdi_downtime_remain_sec // av_ad_lo = 18
addr == 16'haf6 ? 16'h0017 :  // <0769> ram a = $ram_ftdi_downtime_remain_sec // a = av_write_data // start read cycle
addr == 16'haf7 ? 16'h0018 :  // <0769> ram a = $ram_ftdi_downtime_remain_sec // a = av_read_data // finish read cycle

addr == 16'haf8 ? 16'h0000 :  // <0777> a = a
addr == 16'haf9 ? 16'h0600 :  // <0777> b = 0

addr == 16'hafa ? 16'he007 :  // <0770> br eq :else_2810
addr == 16'hafb ? 16'h0b09 :  // <0770> "

addr == 16'hafc ? 16'h0760 :  // <0771> b = -1
addr == 16'hafd ? 16'hc800 :  // <0772> a = a+b
addr == 16'hafe ? 16'h0300 :  // <0772> "
addr == 16'haff ? 16'h6600 :  // <0773> ram $ram_ftdi_downtime_remain_sec = a // av_ad_hi = 0
addr == 16'hb00 ? 16'h6a12 :  // <0773> ram $ram_ftdi_downtime_remain_sec = a // av_ad_lo = 18
addr == 16'hb01 ? 16'h5c00 :  // <0773> ram $ram_ftdi_downtime_remain_sec = a // av_write_data = a

addr == 16'hb02 ? 16'h0000 :  // <0776> a = a
addr == 16'hb03 ? 16'h0600 :  // <0776> b = 0

addr == 16'hb04 ? 16'he407 :  // <0774> bn eq :else_2820
addr == 16'hb05 ? 16'h0b09 :  // <0774> "

addr == 16'hb06 ? 16'hfba0 :  // <0775> callx  ftdi_power_on
addr == 16'hb07 ? 16'h0b3d :  // <0775> "
addr == 16'hb08 ? 16'hfc00 :  // <0775> "



addr == 16'hb09 ? 16'h6600 :  // <0779> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'hb0a ? 16'h6a40 :  // <0779> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'hb0b ? 16'h0017 :  // <0779> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'hb0c ? 16'h0018 :  // <0779> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'hb0d ? 16'h6600 :  // <0780> ram b = $ram_comm_restart_at_min // av_ad_hi = 0
addr == 16'hb0e ? 16'h6a10 :  // <0780> ram b = $ram_comm_restart_at_min // av_ad_lo = 16
addr == 16'hb0f ? 16'h0417 :  // <0780> ram b = $ram_comm_restart_at_min // b = av_write_data // start read cycle
addr == 16'hb10 ? 16'h0418 :  // <0780> ram b = $ram_comm_restart_at_min // b = av_read_data // finish read cycle

addr == 16'hb11 ? 16'h0000 :  // <0786> a = a
addr == 16'hb12 ? 16'h0401 :  // <0786> b = b

addr == 16'hb13 ? 16'he407 :  // <0781> bn eq :else_2835
addr == 16'hb14 ? 16'h0b1e :  // <0781> "

// comm restart is required.
addr == 16'hb15 ? 16'hfba0 :  // <0783> callx  postpone_comm_restart
addr == 16'hb16 ? 16'h0b20 :  // <0783> "
addr == 16'hb17 ? 16'hfc00 :  // <0783> "
addr == 16'hb18 ? 16'h6600 :  // <0784> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_hi = 0
addr == 16'hb19 ? 16'h6a12 :  // <0784> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_lo = 18
addr == 16'hb1a ? 16'h5e05 :  // <0784> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_write_data = 5
addr == 16'hb1b ? 16'hfba0 :  // <0785> callx  ftdi_power_off
addr == 16'hb1c ? 16'h0b2d :  // <0785> "
addr == 16'hb1d ? 16'hfc00 :  // <0785> "


addr == 16'hb1e ? 16'hf80c :  // <0788> pop rtna // func check_communication
addr == 16'hb1f ? 16'hfc00 :  // <0788> swapra = nop

// ######## func postpone_comm_restart // = 0x0b20

addr == 16'hb20 ? 16'h6600 :  // <0790> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'hb21 ? 16'h6a40 :  // <0790> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'hb22 ? 16'h0017 :  // <0790> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'hb23 ? 16'h0018 :  // <0790> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'hb24 ? 16'h0602 :  // <0791> b = $comm_grace_period_min
addr == 16'hb25 ? 16'h6600 :  // <0792> ram $ram_comm_restart_at_min = a+b // av_ad_hi = 0
addr == 16'hb26 ? 16'h6a10 :  // <0792> ram $ram_comm_restart_at_min = a+b // av_ad_lo = 16
addr == 16'hb27 ? 16'hc800 :  // <0792> ram $ram_comm_restart_at_min = a+b // av_write_data = a+b
addr == 16'hb28 ? 16'h5f00 :  // <0792> "

addr == 16'hb29 ? 16'hfc00 :  // <0794> swapra = nop

// :ftdi_off_msg // = 0x0b2a
// "FTOF\x0"
addr == 16'hb2a ? 16'h5446 :  // <0796> TF
addr == 16'hb2b ? 16'h464f :  // <0796> FO
addr == 16'hb2c ? 16'h0000 :  // <0796>   

// ######## func ftdi_power_off // = 0x0b2d
addr == 16'hb2d ? 16'h303e :  // <0803> push rtna // func ftdi_power_off

addr == 16'hb2e ? 16'h0020 :  // <0799> a = board_ctrl
addr == 16'hb2f ? 16'h07a0 :  // <0800> b = $not_ftdi_power_mask
addr == 16'hb30 ? 16'hff7f :  // <0800> "
addr == 16'hb31 ? 16'hc800 :  // <0801> board_ctrl = and
addr == 16'hb32 ? 16'h8330 :  // <0801> "
addr == 16'hb33 ? 16'h23a0 :  // <0802> pa = :ftdi_off_msg
addr == 16'hb34 ? 16'h0b2a :  // <0802> "
addr == 16'hb35 ? 16'hfba0 :  // <0802> callx  set_text_flag  :ftdi_off_msg
addr == 16'hb36 ? 16'h0b51 :  // <0802> "
addr == 16'hb37 ? 16'hfc00 :  // <0802> "

addr == 16'hb38 ? 16'hf80c :  // <0804> pop rtna // func ftdi_power_off
addr == 16'hb39 ? 16'hfc00 :  // <0804> swapra = nop

// :ftdi_on_msg // = 0x0b3a
// "FTON\x0"
addr == 16'hb3a ? 16'h5446 :  // <0806> TF
addr == 16'hb3b ? 16'h4e4f :  // <0806> NO
addr == 16'hb3c ? 16'h0000 :  // <0806>   

// ######## func ftdi_power_on // = 0x0b3d
addr == 16'hb3d ? 16'h303e :  // <0813> push rtna // func ftdi_power_on

addr == 16'hb3e ? 16'h0020 :  // <0809> a = board_ctrl
addr == 16'hb3f ? 16'h0680 :  // <0810> b = $ftdi_power_mask
addr == 16'hb40 ? 16'hc800 :  // <0811> board_ctrl = or
addr == 16'hb41 ? 16'h8334 :  // <0811> "
addr == 16'hb42 ? 16'h23a0 :  // <0812> pa = :ftdi_on_msg
addr == 16'hb43 ? 16'h0b3a :  // <0812> "
addr == 16'hb44 ? 16'hfba0 :  // <0812> callx  set_text_flag  :ftdi_on_msg
addr == 16'hb45 ? 16'h0b51 :  // <0812> "
addr == 16'hb46 ? 16'hfc00 :  // <0812> "

addr == 16'hb47 ? 16'hf80c :  // <0814> pop rtna // func ftdi_power_on
addr == 16'hb48 ? 16'hfc00 :  // <0814> swapra = nop

// ######## func clear_ram_page // = 0x0b49

addr == 16'hb49 ? 16'h0200 :  // <0816> a = 0
addr == 16'hb4a ? 16'h0602 :  // <0817> b = 2
// :clear_next_word // = 0x0b4b
addr == 16'hb4b ? 16'h6800 :  // <0819> av_ad_lo = a
addr == 16'hb4c ? 16'h5e00 :  // <0820> av_write_data = 0
addr == 16'hb4d ? 16'h0300 :  // <0821> a = ad0
addr == 16'hb4e ? 16'he400 :  // <0822> bn az :clear_next_word
addr == 16'hb4f ? 16'h0b4b :  // <0822> "

addr == 16'hb50 ? 16'hfc00 :  // <0824> swapra = nop

// ######## func set_text_flag // = 0x0b51

addr == 16'hb51 ? 16'h0408 :  // <0826> b = flag_addr
addr == 16'hb52 ? 16'h6600 :  // <0827> ram a = $ram_next_tfp_idx // av_ad_hi = 0
addr == 16'hb53 ? 16'h6a56 :  // <0827> ram a = $ram_next_tfp_idx // av_ad_lo = 86
addr == 16'hb54 ? 16'h0017 :  // <0827> ram a = $ram_next_tfp_idx // a = av_write_data // start read cycle
addr == 16'hb55 ? 16'h0018 :  // <0827> ram a = $ram_next_tfp_idx // a = av_read_data // finish read cycle

addr == 16'hb56 ? 16'h0351 :  // <0828> a = a<<1
addr == 16'hb57 ? 16'h3001 :  // <0828> push b // push b
addr == 16'hb58 ? 16'h0646 :  // <0828> b = 70
addr == 16'hb59 ? 16'h6600 :  // <0828> av_ad_hi = 0
addr == 16'hb5a ? 16'h6b00 :  // <0828> av_ad_lo = ad0
addr == 16'hb5b ? 16'h5c0c :  // <0828> pop av_write_data // pop av_write_data

addr == 16'hb5c ? 16'h0008 :  // <0829> a = flag_addr
addr == 16'hb5d ? 16'h0760 :  // <0830> b = -1
addr == 16'hb5e ? 16'hc800 :  // <0831> a = a+b
addr == 16'hb5f ? 16'h0300 :  // <0831> "
addr == 16'hb60 ? 16'h0607 :  // <0832> b = $tfp_mask
addr == 16'hb61 ? 16'h6600 :  // <0833> ram $ram_next_tfp_idx = and // av_ad_hi = 0
addr == 16'hb62 ? 16'h6a56 :  // <0833> ram $ram_next_tfp_idx = and // av_ad_lo = 86
addr == 16'hb63 ? 16'hc800 :  // <0833> ram $ram_next_tfp_idx = and // av_write_data = and
addr == 16'hb64 ? 16'h5f30 :  // <0833> "

addr == 16'hb65 ? 16'hfc00 :  // <0835> swapra = nop

// ######## func unique_text_flag // = 0x0b66
addr == 16'hb66 ? 16'h3002 :  // <0846> push i // func unique_text_flag
addr == 16'hb67 ? 16'h303e :  // <0846> push rtna // "

addr == 16'hb68 ? 16'h0a00 :  // <0843> i = 0
// :loop_2920 // = 0x0b69

addr == 16'hb69 ? 16'h0002 :  // <0837> a = i

addr == 16'hb6a ? 16'h0351 :  // <0838> a = a<<1
addr == 16'hb6b ? 16'h0646 :  // <0838> b = 70
addr == 16'hb6c ? 16'h6600 :  // <0838> av_ad_hi = 0
addr == 16'hb6d ? 16'h6b00 :  // <0838> av_ad_lo = ad0
addr == 16'hb6e ? 16'h0417 :  // <0838> b = av_write_data
addr == 16'hb6f ? 16'h0418 :  // <0838> b = av_read_data


addr == 16'hb70 ? 16'h0001 :  // <0841> a = b
addr == 16'hb71 ? 16'h0408 :  // <0841> b = flag_addr

addr == 16'hb72 ? 16'he407 :  // <0839> bn eq :else_2930
addr == 16'hb73 ? 16'h0b76 :  // <0839> "

addr == 16'hb74 ? 16'he00f :  // <0840> jmp :skip
addr == 16'hb75 ? 16'h0b82 :  // <0840> "



addr == 16'hb76 ? 16'h0002 :  // <0843> a = i
addr == 16'hb77 ? 16'h0601 :  // <0843> b = 1
addr == 16'hb78 ? 16'hc800 :  // <0843> i = a+b
addr == 16'hb79 ? 16'h0b00 :  // <0843> "


addr == 16'hb7a ? 16'h0002 :  // <0843> a = i
addr == 16'hb7b ? 16'h0608 :  // <0843> b = $num_text_flag_pointers
addr == 16'hb7c ? 16'he005 :  // <0843> br lt :loop_2920
addr == 16'hb7d ? 16'h0b69 :  // <0843> "

// :end_2920 // = 0x0b7e
addr == 16'hb7e ? 16'h2008 :  // <0844> pa = flag_addr
addr == 16'hb7f ? 16'hfba0 :  // <0844> callx  set_text_flag  flag_addr
addr == 16'hb80 ? 16'h0b51 :  // <0844> "
addr == 16'hb81 ? 16'hfc00 :  // <0844> "
// :skip // = 0x0b82

addr == 16'hb82 ? 16'hf80c :  // <0847> pop rtna // func unique_text_flag
addr == 16'hb83 ? 16'h080c :  // <0847> pop i // "
addr == 16'hb84 ? 16'hfc00 :  // <0847> swapra = nop

// :text_flags_msg // = 0x0b85
// " tf=\x0"
addr == 16'hb85 ? 16'h7420 :  // <0849> t 
addr == 16'hb86 ? 16'h3d66 :  // <0849> =f
addr == 16'hb87 ? 16'h0000 :  // <0849>   

// ######## func report_text_flags // = 0x0b88
addr == 16'hb88 ? 16'h3002 :  // <0865> push i // func report_text_flags
addr == 16'hb89 ? 16'h303e :  // <0865> push rtna // "

addr == 16'hb8a ? 16'h03a0 :  // <0852> a = :text_flags_msg
addr == 16'hb8b ? 16'h0b85 :  // <0852> "
addr == 16'hb8c ? 16'hfba0 :  // <0853> call :print_nt
addr == 16'hb8d ? 16'h015f :  // <0853> "
addr == 16'hb8e ? 16'hfc00 :  // <0853> "
addr == 16'hb8f ? 16'h0a00 :  // <0864> i = 0
// :loop_2959 // = 0x0b90

addr == 16'hb90 ? 16'h0002 :  // <0854> a = i

addr == 16'hb91 ? 16'h0351 :  // <0855> a = a<<1
addr == 16'hb92 ? 16'h0646 :  // <0855> b = 70
addr == 16'hb93 ? 16'h6600 :  // <0855> av_ad_hi = 0
addr == 16'hb94 ? 16'h6b00 :  // <0855> av_ad_lo = ad0
addr == 16'hb95 ? 16'h0417 :  // <0855> b = av_write_data
addr == 16'hb96 ? 16'h0418 :  // <0855> b = av_read_data


addr == 16'hb97 ? 16'h0001 :  // <0862> a = b
addr == 16'hb98 ? 16'h0600 :  // <0862> b = 0

addr == 16'hb99 ? 16'he007 :  // <0856> br eq :else_2969
addr == 16'hb9a ? 16'h0baa :  // <0856> "

addr == 16'hb9b ? 16'hfba0 :  // <0857> call :print_nt
addr == 16'hb9c ? 16'h015f :  // <0857> "
addr == 16'hb9d ? 16'hfc00 :  // <0857> "
addr == 16'hb9e ? 16'h022c :  // <0858> a = 44 // putasc ","
addr == 16'hb9f ? 16'hfba0 :  // <0858> putasc ","
addr == 16'hba0 ? 16'h00ab :  // <0858> "
addr == 16'hba1 ? 16'hfc00 :  // <0858> "
addr == 16'hba2 ? 16'h0002 :  // <0859> a = i
addr == 16'hba3 ? 16'h0600 :  // <0860> b = 0

addr == 16'hba4 ? 16'h0351 :  // <0861> a = a<<1
addr == 16'hba5 ? 16'h3001 :  // <0861> push b // push b
addr == 16'hba6 ? 16'h0646 :  // <0861> b = 70
addr == 16'hba7 ? 16'h6600 :  // <0861> av_ad_hi = 0
addr == 16'hba8 ? 16'h6b00 :  // <0861> av_ad_lo = ad0
addr == 16'hba9 ? 16'h5c0c :  // <0861> pop av_write_data // pop av_write_data




addr == 16'hbaa ? 16'h0002 :  // <0864> a = i
addr == 16'hbab ? 16'h0601 :  // <0864> b = 1
addr == 16'hbac ? 16'hc800 :  // <0864> i = a+b
addr == 16'hbad ? 16'h0b00 :  // <0864> "


addr == 16'hbae ? 16'h0002 :  // <0864> a = i
addr == 16'hbaf ? 16'h0608 :  // <0864> b = $num_text_flag_pointers
addr == 16'hbb0 ? 16'he005 :  // <0864> br lt :loop_2959
addr == 16'hbb1 ? 16'h0b90 :  // <0864> "

// :end_2959 // = 0x0bb2

addr == 16'hbb2 ? 16'hf80c :  // <0866> pop rtna // func report_text_flags
addr == 16'hbb3 ? 16'h080c :  // <0866> pop i // "
addr == 16'hbb4 ? 16'hfc00 :  // <0866> swapra = nop

// :plan_msg // = 0x0bb5
// " pl=\x0"
addr == 16'hbb5 ? 16'h7020 :  // <0868> p 
addr == 16'hbb6 ? 16'h3d6c :  // <0868> =l
addr == 16'hbb7 ? 16'h0000 :  // <0868>   
// :manual_trim_msg // = 0x0bb8
// " mt=\x0"
addr == 16'hbb8 ? 16'h6d20 :  // <0870> m 
addr == 16'hbb9 ? 16'h3d74 :  // <0870> =t
addr == 16'hbba ? 16'h0000 :  // <0870>   

// ######## func report_plan // = 0x0bbb
addr == 16'hbbb ? 16'h303e :  // <0882> push rtna // func report_plan

addr == 16'hbbc ? 16'h03a0 :  // <0873> a = :plan_msg
addr == 16'hbbd ? 16'h0bb5 :  // <0873> "
addr == 16'hbbe ? 16'hfba0 :  // <0874> call :print_nt
addr == 16'hbbf ? 16'h015f :  // <0874> "
addr == 16'hbc0 ? 16'hfc00 :  // <0874> "
addr == 16'hbc1 ? 16'h6600 :  // <0875> ram a = $ram_plan_name // av_ad_hi = 0
addr == 16'hbc2 ? 16'h6a88 :  // <0875> ram a = $ram_plan_name // av_ad_lo = 136
addr == 16'hbc3 ? 16'h0017 :  // <0875> ram a = $ram_plan_name // a = av_write_data // start read cycle
addr == 16'hbc4 ? 16'h0018 :  // <0875> ram a = $ram_plan_name // a = av_read_data // finish read cycle
addr == 16'hbc5 ? 16'hfba0 :  // <0876> call :print_nt
addr == 16'hbc6 ? 16'h015f :  // <0876> "
addr == 16'hbc7 ? 16'hfc00 :  // <0876> "

addr == 16'hbc8 ? 16'h03a0 :  // <0878> a = :manual_trim_msg
addr == 16'hbc9 ? 16'h0bb8 :  // <0878> "
addr == 16'hbca ? 16'hfba0 :  // <0879> call :print_nt
addr == 16'hbcb ? 16'h015f :  // <0879> "
addr == 16'hbcc ? 16'hfc00 :  // <0879> "
addr == 16'hbcd ? 16'h6600 :  // <0880> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'hbce ? 16'h6ba0 :  // <0880> ram a = $ram_run_manual_trim_thou // av_ad_lo = 356
addr == 16'hbcf ? 16'h0164 :  // <0880> "
addr == 16'hbd0 ? 16'h0017 :  // <0880> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'hbd1 ? 16'h0018 :  // <0880> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle
addr == 16'hbd2 ? 16'hfba0 :  // <0881> call :put4x
addr == 16'hbd3 ? 16'h00d3 :  // <0881> "
addr == 16'hbd4 ? 16'hfc00 :  // <0881> "

addr == 16'hbd5 ? 16'hf80c :  // <0883> pop rtna // func report_plan
addr == 16'hbd6 ? 16'hfc00 :  // <0883> swapra = nop

// ######## func interpret_maf // = 0x0bd7



addr == 16'hbd7 ? 16'hfc00 :  // <0887> swapra = nop

// ######## func interpret_tps // = 0x0bd8
addr == 16'hbd8 ? 16'h3002 :  // <0975> push i // func interpret_tps
addr == 16'hbd9 ? 16'h3004 :  // <0975> push x // "
addr == 16'hbda ? 16'h3005 :  // <0975> push y // "
addr == 16'hbdb ? 16'h3006 :  // <0975> push ga // "
addr == 16'hbdc ? 16'h3007 :  // <0975> push gb // "
addr == 16'hbdd ? 16'h303e :  // <0975> push rtna // "

addr == 16'hbde ? 16'h0206 :  // <0889> a = $tps_adc_channel

addr == 16'hbdf ? 16'h0351 :  // <0890> a = a<<1
addr == 16'hbe0 ? 16'h0626 :  // <0890> b = 38
addr == 16'hbe1 ? 16'h6600 :  // <0890> av_ad_hi = 0
addr == 16'hbe2 ? 16'h6b00 :  // <0890> av_ad_lo = ad0
addr == 16'hbe3 ? 16'h0417 :  // <0890> b = av_write_data
addr == 16'hbe4 ? 16'h0418 :  // <0890> b = av_read_data

// reverse the scale.
addr == 16'hbe5 ? 16'h03a0 :  // <0892> a = 0x0fff
addr == 16'hbe6 ? 16'h0fff :  // <0892> "
addr == 16'hbe7 ? 16'hc800 :  // <0893> b = xor
addr == 16'hbe8 ? 16'h0738 :  // <0893> "
// memorize reading into slot 0 and shift history up 1 slot.  total up as we go.
addr == 16'hbe9 ? 16'h1801 :  // <0895> ga = b
addr == 16'hbea ? 16'h1200 :  // <0896> x = 0
addr == 16'hbeb ? 16'h0a00 :  // <0907> i = 0
// :loop_3051 // = 0x0bec

addr == 16'hbec ? 16'h0002 :  // <0897> a = i

addr == 16'hbed ? 16'h0351 :  // <0898> a = a<<1
addr == 16'hbee ? 16'h07a0 :  // <0898> b = 340
addr == 16'hbef ? 16'h0154 :  // <0898> "
addr == 16'hbf0 ? 16'h6600 :  // <0898> av_ad_hi = 0
addr == 16'hbf1 ? 16'h6b00 :  // <0898> av_ad_lo = ad0
addr == 16'hbf2 ? 16'h0417 :  // <0898> b = av_write_data
addr == 16'hbf3 ? 16'h0418 :  // <0898> b = av_read_data

addr == 16'hbf4 ? 16'h1c01 :  // <0899> gb = b
addr == 16'hbf5 ? 16'h1401 :  // <0900> y = b
addr == 16'hbf6 ? 16'hc800 :  // <0901> x = x+y
addr == 16'hbf7 ? 16'h1320 :  // <0901> "
addr == 16'hbf8 ? 16'h0002 :  // <0902> a = i
addr == 16'hbf9 ? 16'h0406 :  // <0903> b = ga

addr == 16'hbfa ? 16'h0351 :  // <0904> a = a<<1
addr == 16'hbfb ? 16'h3001 :  // <0904> push b // push b
addr == 16'hbfc ? 16'h07a0 :  // <0904> b = 340
addr == 16'hbfd ? 16'h0154 :  // <0904> "
addr == 16'hbfe ? 16'h6600 :  // <0904> av_ad_hi = 0
addr == 16'hbff ? 16'h6b00 :  // <0904> av_ad_lo = ad0
addr == 16'hc00 ? 16'h5c0c :  // <0904> pop av_write_data // pop av_write_data

addr == 16'hc01 ? 16'h1807 :  // <0905> ga = gb


addr == 16'hc02 ? 16'h0002 :  // <0907> a = i
addr == 16'hc03 ? 16'h0601 :  // <0907> b = 1
addr == 16'hc04 ? 16'hc800 :  // <0907> i = a+b
addr == 16'hc05 ? 16'h0b00 :  // <0907> "


addr == 16'hc06 ? 16'h0002 :  // <0907> a = i
addr == 16'hc07 ? 16'h0604 :  // <0907> b = $tps_history_len
addr == 16'hc08 ? 16'he005 :  // <0907> br lt :loop_3051
addr == 16'hc09 ? 16'h0bec :  // <0907> "

// :end_3051 // = 0x0c0a
// memorize average.
addr == 16'hc0a ? 16'h0004 :  // <0909> a = x
addr == 16'hc0b ? 16'h0350 :  // <0910> a = a>>1
addr == 16'hc0c ? 16'h1b50 :  // <0911> ga = a>>1
addr == 16'hc0d ? 16'h6600 :  // <0912> ram $ram_tps_avg = ga // av_ad_hi = 0
addr == 16'hc0e ? 16'h6ba0 :  // <0912> ram $ram_tps_avg = ga // av_ad_lo = 338
addr == 16'hc0f ? 16'h0152 :  // <0912> "
addr == 16'hc10 ? 16'h5c06 :  // <0912> ram $ram_tps_avg = ga // av_write_data = ga
// interpret state by comparing vs. reference table.
// compare to idle reference.
addr == 16'hc11 ? 16'h0200 :  // <0915> a = 0

addr == 16'hc12 ? 16'h0351 :  // <0916> a = a<<1
addr == 16'hc13 ? 16'h06b4 :  // <0916> b = 180
addr == 16'hc14 ? 16'h6600 :  // <0916> av_ad_hi = 0
addr == 16'hc15 ? 16'h6b00 :  // <0916> av_ad_lo = ad0
addr == 16'hc16 ? 16'h0417 :  // <0916> b = av_write_data
addr == 16'hc17 ? 16'h0418 :  // <0916> b = av_read_data

addr == 16'hc18 ? 16'h0001 :  // <0917> a = b
addr == 16'hc19 ? 16'h0353 :  // <0918> a = a>>4
addr == 16'hc1a ? 16'hc800 :  // <0919> b = a+b
addr == 16'hc1b ? 16'h0700 :  // <0919> "

addr == 16'hc1c ? 16'h0006 :  // <0923> a = ga
addr == 16'hc1d ? 16'h0401 :  // <0923> b = b

addr == 16'hc1e ? 16'he405 :  // <0920> bn lt :else_3102
addr == 16'hc1f ? 16'h0c25 :  // <0920> "

addr == 16'hc20 ? 16'h6600 :  // <0921> ram $ram_tps_state = $tps_state_closed // av_ad_hi = 0
addr == 16'hc21 ? 16'h6ace :  // <0921> ram $ram_tps_state = $tps_state_closed // av_ad_lo = 206
addr == 16'hc22 ? 16'h5e00 :  // <0921> ram $ram_tps_state = $tps_state_closed // av_write_data = 0
addr == 16'hc23 ? 16'he00f :  // <0922> jmp :end
addr == 16'hc24 ? 16'h0c77 :  // <0922> "

// compare to wide open reference.
addr == 16'hc25 ? 16'h020c :  // <0925> a = ($num_tps_cells - 1)

addr == 16'hc26 ? 16'h0351 :  // <0926> a = a<<1
addr == 16'hc27 ? 16'h06b4 :  // <0926> b = 180
addr == 16'hc28 ? 16'h6600 :  // <0926> av_ad_hi = 0
addr == 16'hc29 ? 16'h6b00 :  // <0926> av_ad_lo = ad0
addr == 16'hc2a ? 16'h0417 :  // <0926> b = av_write_data
addr == 16'hc2b ? 16'h0418 :  // <0926> b = av_read_data

addr == 16'hc2c ? 16'h1001 :  // <0927> x = b
addr == 16'hc2d ? 16'h0001 :  // <0928> a = b
addr == 16'hc2e ? 16'h0350 :  // <0929> a = a>>1
addr == 16'hc2f ? 16'h0350 :  // <0930> a = a>>1
addr == 16'hc30 ? 16'h0760 :  // <0931> b = 0xffff
addr == 16'hc31 ? 16'hc800 :  // <0932> y = xor
addr == 16'hc32 ? 16'h1738 :  // <0932> "

addr == 16'hc33 ? 16'h0006 :  // <0936> a = ga
addr == 16'hc34 ? 16'hc800 :  // <0936> b = x+y
addr == 16'hc35 ? 16'h0720 :  // <0936> "

addr == 16'hc36 ? 16'he406 :  // <0933> bn gt :else_3126
addr == 16'hc37 ? 16'h0c3d :  // <0933> "

addr == 16'hc38 ? 16'h6600 :  // <0934> ram $ram_tps_state = $tps_state_open // av_ad_hi = 0
addr == 16'hc39 ? 16'h6ace :  // <0934> ram $ram_tps_state = $tps_state_open // av_ad_lo = 206
addr == 16'hc3a ? 16'h5e04 :  // <0934> ram $ram_tps_state = $tps_state_open // av_write_data = 4
addr == 16'hc3b ? 16'he00f :  // <0935> jmp :end
addr == 16'hc3c ? 16'h0c77 :  // <0935> "

// compare to current RPM's reference position.
//patch: rework this to compare to the next 2 tps reference cells instead of a fixed margin.
// that way always prevents it from enriching while the tps is still within same ref cell.
addr == 16'hc3d ? 16'h6600 :  // <0940> ram pa = $ram_avg_rpm // av_ad_hi = 0
addr == 16'hc3e ? 16'h6a7c :  // <0940> ram pa = $ram_avg_rpm // av_ad_lo = 124
addr == 16'hc3f ? 16'h2017 :  // <0940> ram pa = $ram_avg_rpm // pa = av_write_data // start read cycle
addr == 16'hc40 ? 16'h2018 :  // <0940> ram pa = $ram_avg_rpm // pa = av_read_data // finish read cycle
addr == 16'hc41 ? 16'hfba0 :  // <0941> callx  find_rpm_cell  pa  a
addr == 16'hc42 ? 16'h05b3 :  // <0941> "
addr == 16'hc43 ? 16'hfc00 :  // <0941> "
addr == 16'hc44 ? 16'h0008 :  // <0941> a = pa

addr == 16'hc45 ? 16'h0351 :  // <0942> a = a<<1
addr == 16'hc46 ? 16'h06b4 :  // <0942> b = 180
addr == 16'hc47 ? 16'h6600 :  // <0942> av_ad_hi = 0
addr == 16'hc48 ? 16'h6b00 :  // <0942> av_ad_lo = ad0
addr == 16'hc49 ? 16'h0417 :  // <0942> b = av_write_data
addr == 16'hc4a ? 16'h0418 :  // <0942> b = av_read_data

addr == 16'hc4b ? 16'h1001 :  // <0943> x = b
// test if it's within 1/16 of reference.
addr == 16'hc4c ? 16'h0004 :  // <0945> a = x
addr == 16'hc4d ? 16'h0353 :  // <0946> a = a>>4
addr == 16'hc4e ? 16'hc800 :  // <0947> a = a+b
addr == 16'hc4f ? 16'h0300 :  // <0947> "

addr == 16'hc50 ? 16'h0000 :  // <0951> a = a
addr == 16'hc51 ? 16'h0406 :  // <0951> b = ga

addr == 16'hc52 ? 16'he406 :  // <0948> bn gt :else_3154
addr == 16'hc53 ? 16'h0c59 :  // <0948> "

addr == 16'hc54 ? 16'h6600 :  // <0949> ram $ram_tps_state = $tps_state_cruise // av_ad_hi = 0
addr == 16'hc55 ? 16'h6ace :  // <0949> ram $ram_tps_state = $tps_state_cruise // av_ad_lo = 206
addr == 16'hc56 ? 16'h5e01 :  // <0949> ram $ram_tps_state = $tps_state_cruise // av_write_data = 1
addr == 16'hc57 ? 16'he00f :  // <0950> jmp :end
addr == 16'hc58 ? 16'h0c77 :  // <0950> "

// test if it's within 1/8 of reference.
addr == 16'hc59 ? 16'h0004 :  // <0953> a = x
addr == 16'hc5a ? 16'h0350 :  // <0954> a = a>>1
addr == 16'hc5b ? 16'h0350 :  // <0955> a = a>>1
addr == 16'hc5c ? 16'h0350 :  // <0956> a = a>>1
addr == 16'hc5d ? 16'h0404 :  // <0957> b = x
addr == 16'hc5e ? 16'hc800 :  // <0958> a = a+b
addr == 16'hc5f ? 16'h0300 :  // <0958> "

addr == 16'hc60 ? 16'h0000 :  // <0962> a = a
addr == 16'hc61 ? 16'h0406 :  // <0962> b = ga

addr == 16'hc62 ? 16'he406 :  // <0959> bn gt :else_3170
addr == 16'hc63 ? 16'h0c69 :  // <0959> "

addr == 16'hc64 ? 16'h6600 :  // <0960> ram $ram_tps_state = $tps_state_accel1 // av_ad_hi = 0
addr == 16'hc65 ? 16'h6ace :  // <0960> ram $ram_tps_state = $tps_state_accel1 // av_ad_lo = 206
addr == 16'hc66 ? 16'h5e02 :  // <0960> ram $ram_tps_state = $tps_state_accel1 // av_write_data = 2
addr == 16'hc67 ? 16'he00f :  // <0961> jmp :end
addr == 16'hc68 ? 16'h0c77 :  // <0961> "

// test if it's within 1/2 of reference.
addr == 16'hc69 ? 16'h0004 :  // <0964> a = x
addr == 16'hc6a ? 16'h0350 :  // <0965> a = a>>1
addr == 16'hc6b ? 16'h0404 :  // <0966> b = x
addr == 16'hc6c ? 16'hc800 :  // <0967> a = a+b
addr == 16'hc6d ? 16'h0300 :  // <0967> "

addr == 16'hc6e ? 16'h0000 :  // <0971> a = a
addr == 16'hc6f ? 16'h0406 :  // <0971> b = ga

addr == 16'hc70 ? 16'he406 :  // <0968> bn gt :else_3184
addr == 16'hc71 ? 16'h0c77 :  // <0968> "

addr == 16'hc72 ? 16'h6600 :  // <0969> ram $ram_tps_state = $tps_state_accel2 // av_ad_hi = 0
addr == 16'hc73 ? 16'h6ace :  // <0969> ram $ram_tps_state = $tps_state_accel2 // av_ad_lo = 206
addr == 16'hc74 ? 16'h5e03 :  // <0969> ram $ram_tps_state = $tps_state_accel2 // av_write_data = 3
addr == 16'hc75 ? 16'he00f :  // <0970> jmp :end
addr == 16'hc76 ? 16'h0c77 :  // <0970> "

// in this case leave ram_tps_state as-is.

// :end // = 0x0c77

addr == 16'hc77 ? 16'hf80c :  // <0976> pop rtna // func interpret_tps
addr == 16'hc78 ? 16'h1c0c :  // <0976> pop gb // "
addr == 16'hc79 ? 16'h180c :  // <0976> pop ga // "
addr == 16'hc7a ? 16'h140c :  // <0976> pop y // "
addr == 16'hc7b ? 16'h100c :  // <0976> pop x // "
addr == 16'hc7c ? 16'h080c :  // <0976> pop i // "
addr == 16'hc7d ? 16'hfc00 :  // <0976> swapra = nop

// ######## func jf_to_rpm // = 0x0c7e
addr == 16'hc7e ? 16'h303e :  // <0986> push rtna // func jf_to_rpm

// resolution = 32 rpm.
addr == 16'hc7f ? 16'h0408 :  // <0979> b = jiffies
addr == 16'hc80 ? 16'h03a0 :  // <0980> a = 0x5573
addr == 16'hc81 ? 16'h5573 :  // <0980> "
// = 700000 >> 5
addr == 16'hc82 ? 16'hfba0 :  // <0982> call :divide
addr == 16'hc83 ? 16'h019c :  // <0982> "
addr == 16'hc84 ? 16'hfc00 :  // <0982> "
addr == 16'hc85 ? 16'h0001 :  // <0983> a = b
addr == 16'hc86 ? 16'h0352 :  // <0984> a = a<<4
addr == 16'hc87 ? 16'h2351 :  // <0985> rpm = a<<1

addr == 16'hc88 ? 16'hf80c :  // <0987> pop rtna // func jf_to_rpm
addr == 16'hc89 ? 16'hfc00 :  // <0987> swapra = nop

// ######## func check_engine_stop // = 0x0c8a
addr == 16'hc8a ? 16'h303e :  // <1003> push rtna // func check_engine_stop

// returns 1 if transitioned to stop, else 0.

// transition to plan_stop if ignition switch is turned off AND rpm estimate is invalid.
// requiring both conditions prevents spurious noise readings from shutting down the injection.

addr == 16'hc8b ? 16'h0022 :  // <1001> a = power_duty
addr == 16'hc8c ? 16'h0680 :  // <1001> b = ( 0x0080 )

addr == 16'hc8d ? 16'he003 :  // <0993> br and0z :else_3213
addr == 16'hc8e ? 16'h0ca2 :  // <0993> "

addr == 16'hc8f ? 16'h6600 :  // <0994> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'hc90 ? 16'h6a7e :  // <0994> ram a = $ram_rpm_valid // av_ad_lo = 126
addr == 16'hc91 ? 16'h0017 :  // <0994> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'hc92 ? 16'h0018 :  // <0994> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle

addr == 16'hc93 ? 16'h0000 :  // <1000> a = a
addr == 16'hc94 ? 16'h0600 :  // <1000> b = 0

addr == 16'hc95 ? 16'he407 :  // <0995> bn eq :else_3221
addr == 16'hc96 ? 16'h0ca2 :  // <0995> "

addr == 16'hc97 ? 16'h6600 :  // <0996> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'hc98 ? 16'h6a8e :  // <0996> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'hc99 ? 16'hf817 :  // <0996> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'hc9a ? 16'hf818 :  // <0996> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'hc9b ? 16'hfc00 :  // <0997> swapra = nop
addr == 16'hc9c ? 16'hfba0 :  // <0999> callx  init_plan_stop
addr == 16'hc9d ? 16'h0344 :  // <0999> "
addr == 16'hc9e ? 16'hfc00 :  // <0999> "
addr == 16'hc9f ? 16'h2201 :  // <1000> did_stop = 1
addr == 16'hca0 ? 16'hf80c :  // <1000> pop rtna // rtn 1
addr == 16'hca1 ? 16'hfc00 :  // <0999> swapra = nop


addr == 16'hca2 ? 16'h2200 :  // <1002> did_stop = 0
addr == 16'hca3 ? 16'hf80c :  // <1002> pop rtna // rtn 0
addr == 16'hca4 ? 16'hfc00 :  // <1001> swapra = nop

addr == 16'hca5 ? 16'hf80c :  // <1004> pop rtna // func check_engine_stop
addr == 16'hca6 ? 16'hfc00 :  // <1004> swapra = nop


        
                16'hxxxx;
        endmodule
    
