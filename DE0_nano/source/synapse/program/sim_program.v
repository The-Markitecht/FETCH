
        `include "header.v"

        module sim_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.

addr == 16'h00 ? 16'he00f :  // <0004> jmp :main
addr == 16'h01 ? 16'h06ea :  // <0004> "


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

addr == 16'h02 ? 16'h0026 :  // <0197> emit_debugger_register_table  counter
// "       a"
addr == 16'h03 ? 16'h2020 :  // <0197>   
addr == 16'h04 ? 16'h2020 :  // <0197>   
addr == 16'h05 ? 16'h2020 :  // <0197>   
addr == 16'h06 ? 16'h6120 :  // <0197> a 
// "       b"
addr == 16'h07 ? 16'h2020 :  // <0197>   
addr == 16'h08 ? 16'h2020 :  // <0197>   
addr == 16'h09 ? 16'h2020 :  // <0197>   
addr == 16'h0a ? 16'h6220 :  // <0197> b 
// "       i"
addr == 16'h0b ? 16'h2020 :  // <0197>   
addr == 16'h0c ? 16'h2020 :  // <0197>   
addr == 16'h0d ? 16'h2020 :  // <0197>   
addr == 16'h0e ? 16'h6920 :  // <0197> i 
// "       j"
addr == 16'h0f ? 16'h2020 :  // <0197>   
addr == 16'h10 ? 16'h2020 :  // <0197>   
addr == 16'h11 ? 16'h2020 :  // <0197>   
addr == 16'h12 ? 16'h6a20 :  // <0197> j 
// "       x"
addr == 16'h13 ? 16'h2020 :  // <0197>   
addr == 16'h14 ? 16'h2020 :  // <0197>   
addr == 16'h15 ? 16'h2020 :  // <0197>   
addr == 16'h16 ? 16'h7820 :  // <0197> x 
// "       y"
addr == 16'h17 ? 16'h2020 :  // <0197>   
addr == 16'h18 ? 16'h2020 :  // <0197>   
addr == 16'h19 ? 16'h2020 :  // <0197>   
addr == 16'h1a ? 16'h7920 :  // <0197> y 
// "      ga"
addr == 16'h1b ? 16'h2020 :  // <0197>   
addr == 16'h1c ? 16'h2020 :  // <0197>   
addr == 16'h1d ? 16'h2020 :  // <0197>   
addr == 16'h1e ? 16'h6167 :  // <0197> ag
// "      gb"
addr == 16'h1f ? 16'h2020 :  // <0197>   
addr == 16'h20 ? 16'h2020 :  // <0197>   
addr == 16'h21 ? 16'h2020 :  // <0197>   
addr == 16'h22 ? 16'h6267 :  // <0197> bg
// "      pa"
addr == 16'h23 ? 16'h2020 :  // <0197>   
addr == 16'h24 ? 16'h2020 :  // <0197>   
addr == 16'h25 ? 16'h2020 :  // <0197>   
addr == 16'h26 ? 16'h6170 :  // <0197> ap
// "      pb"
addr == 16'h27 ? 16'h2020 :  // <0197>   
addr == 16'h28 ? 16'h2020 :  // <0197>   
addr == 16'h29 ? 16'h2020 :  // <0197>   
addr == 16'h2a ? 16'h6270 :  // <0197> bp
// "      pc"
addr == 16'h2b ? 16'h2020 :  // <0197>   
addr == 16'h2c ? 16'h2020 :  // <0197>   
addr == 16'h2d ? 16'h2020 :  // <0197>   
addr == 16'h2e ? 16'h6370 :  // <0197> cp
// "      pd"
addr == 16'h2f ? 16'h2020 :  // <0197>   
addr == 16'h30 ? 16'h2020 :  // <0197>   
addr == 16'h31 ? 16'h2020 :  // <0197>   
addr == 16'h32 ? 16'h6470 :  // <0197> dp
// "//rstk  "
addr == 16'h33 ? 16'h2f2f :  // <0197> //
addr == 16'h34 ? 16'h7372 :  // <0197> sr
addr == 16'h35 ? 16'h6b74 :  // <0197> kt
addr == 16'h36 ? 16'h2020 :  // <0197>   
// "  ev_pri"
addr == 16'h37 ? 16'h2020 :  // <0197>   
addr == 16'h38 ? 16'h7665 :  // <0197> ve
addr == 16'h39 ? 16'h705f :  // <0197> p_
addr == 16'h3a ? 16'h6972 :  // <0197> ir
// "softevnt"
addr == 16'h3b ? 16'h6f73 :  // <0197> os
addr == 16'h3c ? 16'h7466 :  // <0197> tf
addr == 16'h3d ? 16'h7665 :  // <0197> ve
addr == 16'h3e ? 16'h746e :  // <0197> tn
// "   usage"
addr == 16'h3f ? 16'h2020 :  // <0197>   
addr == 16'h40 ? 16'h7520 :  // <0197> u 
addr == 16'h41 ? 16'h6173 :  // <0197> as
addr == 16'h42 ? 16'h6567 :  // <0197> eg
// "prductlo"
addr == 16'h43 ? 16'h7270 :  // <0197> rp
addr == 16'h44 ? 16'h7564 :  // <0197> ud
addr == 16'h45 ? 16'h7463 :  // <0197> tc
addr == 16'h46 ? 16'h6f6c :  // <0197> ol
// "prducthi"
addr == 16'h47 ? 16'h7270 :  // <0197> rp
addr == 16'h48 ? 16'h7564 :  // <0197> ud
addr == 16'h49 ? 16'h7463 :  // <0197> tc
addr == 16'h4a ? 16'h6968 :  // <0197> ih
// "ustimer0"
addr == 16'h4b ? 16'h7375 :  // <0197> su
addr == 16'h4c ? 16'h6974 :  // <0197> it
addr == 16'h4d ? 16'h656d :  // <0197> em
addr == 16'h4e ? 16'h3072 :  // <0197> 0r
// "mstimer0"
addr == 16'h4f ? 16'h736d :  // <0197> sm
addr == 16'h50 ? 16'h6974 :  // <0197> it
addr == 16'h51 ? 16'h656d :  // <0197> em
addr == 16'h52 ? 16'h3072 :  // <0197> 0r
// "mstimer1"
addr == 16'h53 ? 16'h736d :  // <0197> sm
addr == 16'h54 ? 16'h6974 :  // <0197> it
addr == 16'h55 ? 16'h656d :  // <0197> em
addr == 16'h56 ? 16'h3172 :  // <0197> 1r
// "mstimer2"
addr == 16'h57 ? 16'h736d :  // <0197> sm
addr == 16'h58 ? 16'h6974 :  // <0197> it
addr == 16'h59 ? 16'h656d :  // <0197> em
addr == 16'h5a ? 16'h3272 :  // <0197> 2r
// "spi_data"
addr == 16'h5b ? 16'h7073 :  // <0197> ps
addr == 16'h5c ? 16'h5f69 :  // <0197> _i
addr == 16'h5d ? 16'h6164 :  // <0197> ad
addr == 16'h5e ? 16'h6174 :  // <0197> at
// "//avwrdt"
addr == 16'h5f ? 16'h2f2f :  // <0197> //
addr == 16'h60 ? 16'h7661 :  // <0197> va
addr == 16'h61 ? 16'h7277 :  // <0197> rw
addr == 16'h62 ? 16'h7464 :  // <0197> td
// "av_rd_dt"
addr == 16'h63 ? 16'h7661 :  // <0197> va
addr == 16'h64 ? 16'h725f :  // <0197> r_
addr == 16'h65 ? 16'h5f64 :  // <0197> _d
addr == 16'h66 ? 16'h7464 :  // <0197> td
// "av_ad_hi"
addr == 16'h67 ? 16'h7661 :  // <0197> va
addr == 16'h68 ? 16'h615f :  // <0197> a_
addr == 16'h69 ? 16'h5f64 :  // <0197> _d
addr == 16'h6a ? 16'h6968 :  // <0197> ih
// "av_ad_lo"
addr == 16'h6b ? 16'h7661 :  // <0197> va
addr == 16'h6c ? 16'h615f :  // <0197> a_
addr == 16'h6d ? 16'h5f64 :  // <0197> _d
addr == 16'h6e ? 16'h6f6c :  // <0197> ol
// "//dromad"
addr == 16'h6f ? 16'h2f2f :  // <0197> //
addr == 16'h70 ? 16'h7264 :  // <0197> rd
addr == 16'h71 ? 16'h6d6f :  // <0197> mo
addr == 16'h72 ? 16'h6461 :  // <0197> da
// "dromdata"
addr == 16'h73 ? 16'h7264 :  // <0197> rd
addr == 16'h74 ? 16'h6d6f :  // <0197> mo
addr == 16'h75 ? 16'h6164 :  // <0197> ad
addr == 16'h76 ? 16'h6174 :  // <0197> at
// "//uartdt"
addr == 16'h77 ? 16'h2f2f :  // <0197> //
addr == 16'h78 ? 16'h6175 :  // <0197> au
addr == 16'h79 ? 16'h7472 :  // <0197> tr
addr == 16'h7a ? 16'h7464 :  // <0197> td
// "uartstat"
addr == 16'h7b ? 16'h6175 :  // <0197> au
addr == 16'h7c ? 16'h7472 :  // <0197> tr
addr == 16'h7d ? 16'h7473 :  // <0197> ts
addr == 16'h7e ? 16'h7461 :  // <0197> ta
// "    leds"
addr == 16'h7f ? 16'h2020 :  // <0197>   
addr == 16'h80 ? 16'h2020 :  // <0197>   
addr == 16'h81 ? 16'h656c :  // <0197> el
addr == 16'h82 ? 16'h7364 :  // <0197> sd
// "brd_ctrl"
addr == 16'h83 ? 16'h7262 :  // <0197> rb
addr == 16'h84 ? 16'h5f64 :  // <0197> _d
addr == 16'h85 ? 16'h7463 :  // <0197> tc
addr == 16'h86 ? 16'h6c72 :  // <0197> lr
// "   anmux"
addr == 16'h87 ? 16'h2020 :  // <0197>   
addr == 16'h88 ? 16'h6120 :  // <0197> a 
addr == 16'h89 ? 16'h6d6e :  // <0197> mn
addr == 16'h8a ? 16'h7875 :  // <0197> xu
// "pwr_duty"
addr == 16'h8b ? 16'h7770 :  // <0197> wp
addr == 16'h8c ? 16'h5f72 :  // <0197> _r
addr == 16'h8d ? 16'h7564 :  // <0197> ud
addr == 16'h8e ? 16'h7974 :  // <0197> yt
// "igntmcap"
addr == 16'h8f ? 16'h6769 :  // <0197> gi
addr == 16'h90 ? 16'h746e :  // <0197> tn
addr == 16'h91 ? 16'h636d :  // <0197> cm
addr == 16'h92 ? 16'h7061 :  // <0197> pa
// "igntmout"
addr == 16'h93 ? 16'h6769 :  // <0197> gi
addr == 16'h94 ? 16'h746e :  // <0197> tn
addr == 16'h95 ? 16'h6f6d :  // <0197> om
addr == 16'h96 ? 16'h7475 :  // <0197> tu
// "puflenus"
addr == 16'h97 ? 16'h7570 :  // <0197> up
addr == 16'h98 ? 16'h6c66 :  // <0197> lf
addr == 16'h99 ? 16'h6e65 :  // <0197> ne
addr == 16'h9a ? 16'h7375 :  // <0197> su

// string resources
// :boot_msg // = 0x009b
// "TGT\r\n\x0"
addr == 16'h9b ? 16'h4754 :  // <0201> GT
addr == 16'h9c ? 16'h0d54 :  // <0201>  T
addr == 16'h9d ? 16'h000a :  // <0201>   

// libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.

// event loop.  this infrastructure is assembled directly into the main program, not a func.
// first instruction of an event handler should be the 7th cycle after reading its priority from the event controller here.
// :poll_events // = 0x009e
// initialize prior to polling loop, for minimum latency.
addr == 16'h9e ? 16'h07a0 :  // <0006> b = :event_table
addr == 16'h9f ? 16'h0715 :  // <0006> "
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
addr == 16'hd4 ? 16'h3006 :  // <0054> push ga // "
addr == 16'hd5 ? 16'h303e :  // <0054> push rtna // "
addr == 16'hd6 ? 16'h13a0 :  // <0055> x = :hexdigits
addr == 16'hd7 ? 16'h00cb :  // <0055> "

addr == 16'hd8 ? 16'h1800 :  // <0057> ga = a
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

addr == 16'he6 ? 16'h0006 :  // <0066> a = ga
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

addr == 16'hf3 ? 16'h0006 :  // <0074> a = ga
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

addr == 16'hfe ? 16'h0006 :  // <0081> a = ga
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
addr == 16'h109 ? 16'h180c :  // <0087> pop ga // "
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
addr == 16'h13c ? 16'h3006 :  // <0121> push ga // "
addr == 16'h13d ? 16'h303e :  // <0121> push rtna // "
addr == 16'h13e ? 16'h0800 :  // <0122> i = a
addr == 16'h13f ? 16'h0e01 :  // <0123> j = 1
addr == 16'h140 ? 16'h1001 :  // <0124> x = b
addr == 16'h141 ? 16'h1760 :  // <0125> y = -1
// :next_word // = 0x0142
addr == 16'h142 ? 16'he002 :  // <0127> br xz :done
addr == 16'h143 ? 16'h0158 :  // <0127> "
addr == 16'h144 ? 16'h1320 :  // <0128> x = ad2
addr == 16'h145 ? 16'hd002 :  // <0129> fetch ga from i
addr == 16'h146 ? 16'h1bb0 :  // <0129> "
// now x = bytes remaining, i = current word address, ga = data word.
addr == 16'h147 ? 16'h0006 :  // <0131> a = ga // putchar ga
addr == 16'h148 ? 16'hfba0 :  // <0131> putchar ga
addr == 16'h149 ? 16'h00ab :  // <0131> "
addr == 16'h14a ? 16'hfc00 :  // <0131> "
addr == 16'h14b ? 16'he002 :  // <0132> br xz :done
addr == 16'h14c ? 16'h0158 :  // <0132> "
addr == 16'h14d ? 16'h1320 :  // <0133> x = ad2
addr == 16'h14e ? 16'h0006 :  // <0134> a = ga
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
addr == 16'h159 ? 16'h180c :  // <0141> pop ga // "
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




// ######## func fletcher16_init // = 0x022d

addr == 16'h22d ? 16'h2a00 :  // <0005> $fletcher_sum1_reg = 0
addr == 16'h22e ? 16'h2e00 :  // <0006> $fletcher_sum2_reg = 0

addr == 16'h22f ? 16'hfc00 :  // <0008> swapra = nop

// return the modulus(255) of a given number.
// ######## func mod255 // = 0x0230

// while a is greater than 254, subtract 255.
// :mod255_again // = 0x0230
addr == 16'h230 ? 16'h06fe :  // <0013> b = 0xfe
addr == 16'h231 ? 16'he006 :  // <0014> br gt :mod255_greater
addr == 16'h232 ? 16'h0234 :  // <0014> "
addr == 16'h233 ? 16'hfc00 :  // <0014> swapra = nop
// :mod255_greater // = 0x0234
addr == 16'h234 ? 16'h07a0 :  // <0017> b = ([negate 0xfe])
addr == 16'h235 ? 16'hff02 :  // <0017> "
addr == 16'h236 ? 16'hc800 :  // <0018> a = a+b
addr == 16'h237 ? 16'h0300 :  // <0018> "
addr == 16'h238 ? 16'he00f :  // <0019> jmp :mod255_again
addr == 16'h239 ? 16'h0230 :  // <0019> "

addr == 16'h23a ? 16'hfc00 :  // <0021> swapra = nop

// accumulate a Fletcher16 checksum, given the next byte of data.
// ######## func fletcher16_input8 // = 0x023b
addr == 16'h23b ? 16'h303e :  // <0030> push rtna // func fletcher16_input8

addr == 16'h23c ? 16'h040a :  // <0024> b = $fletcher_sum1_reg
addr == 16'h23d ? 16'hc800 :  // <0025> a = a+b
addr == 16'h23e ? 16'h0300 :  // <0025> "
addr == 16'h23f ? 16'hfba0 :  // <0025> callx mod255  a+b  $fletcher_sum1_reg
addr == 16'h240 ? 16'h0230 :  // <0025> "
addr == 16'h241 ? 16'hfc00 :  // <0025> "
addr == 16'h242 ? 16'h2800 :  // <0025> pc = a

addr == 16'h243 ? 16'h000a :  // <0027> a = $fletcher_sum1_reg
addr == 16'h244 ? 16'h040b :  // <0028> b = $fletcher_sum2_reg
addr == 16'h245 ? 16'hc800 :  // <0029> a = a+b
addr == 16'h246 ? 16'h0300 :  // <0029> "
addr == 16'h247 ? 16'hfba0 :  // <0029> callx mod255  a+b  $fletcher_sum2_reg
addr == 16'h248 ? 16'h0230 :  // <0029> "
addr == 16'h249 ? 16'hfc00 :  // <0029> "
addr == 16'h24a ? 16'h2c00 :  // <0029> pd = a

addr == 16'h24b ? 16'hf80c :  // <0031> pop rtna // func fletcher16_input8
addr == 16'h24c ? 16'hfc00 :  // <0031> swapra = nop

// accumulate a Fletcher16 checksum, given the next word of data.
// ######## func fletcher16_input16 // = 0x024d
addr == 16'h24d ? 16'h3002 :  // <0039> push i // func fletcher16_input16
addr == 16'h24e ? 16'h303e :  // <0039> push rtna // "

addr == 16'h24f ? 16'h0b53 :  // <0034> i = a>>4
addr == 16'h250 ? 16'h06ff :  // <0035> b = 0xff
addr == 16'h251 ? 16'hc800 :  // <0036> a = and
addr == 16'h252 ? 16'h0330 :  // <0036> "
addr == 16'h253 ? 16'hfba0 :  // <0036> callx fletcher16_input8  and
addr == 16'h254 ? 16'h023b :  // <0036> "
addr == 16'h255 ? 16'hfc00 :  // <0036> "
addr == 16'h256 ? 16'h0002 :  // <0037> a = i
addr == 16'h257 ? 16'h0353 :  // <0038> a = a>>4
addr == 16'h258 ? 16'hfba0 :  // <0038> callx fletcher16_input8  a>>4
addr == 16'h259 ? 16'h023b :  // <0038> "
addr == 16'h25a ? 16'hfc00 :  // <0038> "

addr == 16'h25b ? 16'hf80c :  // <0040> pop rtna // func fletcher16_input16
addr == 16'h25c ? 16'h080c :  // <0040> pop i // "
addr == 16'h25d ? 16'hfc00 :  // <0040> swapra = nop

// return the combined 16-bit result of Fletcher16 checksum.
// ######## func fletcher16_result // = 0x025e

addr == 16'h25e ? 16'h000b :  // <0043> a = $fletcher_sum2_reg
addr == 16'h25f ? 16'h0352 :  // <0044> a = a<<4
addr == 16'h260 ? 16'h0352 :  // <0045> a = a<<4
addr == 16'h261 ? 16'h040a :  // <0046> b = $fletcher_sum1_reg
addr == 16'h262 ? 16'hc800 :  // <0047> result = or
addr == 16'h263 ? 16'h0334 :  // <0047> "
addr == 16'h264 ? 16'hfc00 :  // <0046> swapra = nop

addr == 16'h265 ? 16'hfc00 :  // <0049> swapra = nop











// ######## func init_drom // = 0x0266
addr == 16'h266 ? 16'h3002 :  // <0125> push i // func init_drom

// copy entire ROM content to a shadow area in RAM.
addr == 16'h267 ? 16'h67a0 :  // <0119> av_ad_hi = ($drom_shadow_base >> 16)
addr == 16'h268 ? 16'h0100 :  // <0119> "
addr == 16'h269 ? 16'h0a00 :  // <0124> i = 0
// :loop_617 // = 0x026a

addr == 16'h26a ? 16'h6c02 :  // <0120> drom_ad = i
addr == 16'h26b ? 16'h6802 :  // <0121> av_ad_lo = i
addr == 16'h26c ? 16'h5c1c :  // <0122> av_write_data = drom_data


addr == 16'h26d ? 16'h0002 :  // <0124> a = i
addr == 16'h26e ? 16'h0601 :  // <0124> b = 1
addr == 16'h26f ? 16'hc800 :  // <0124> i = a+b
addr == 16'h270 ? 16'h0b00 :  // <0124> "


addr == 16'h271 ? 16'h0002 :  // <0124> a = i
addr == 16'h272 ? 16'h07a0 :  // <0124> b = $drom_shadow_len_bytes
addr == 16'h273 ? 16'h0b48 :  // <0124> "
addr == 16'h274 ? 16'he005 :  // <0124> br lt :loop_617
addr == 16'h275 ? 16'h026a :  // <0124> "

// :end_617 // = 0x0276

addr == 16'h276 ? 16'h080c :  // <0126> pop i // func init_drom
addr == 16'h277 ? 16'hfc00 :  // <0126> swapra = nop

// ######## func load_afrc_cmd // = 0x0278
addr == 16'h278 ? 16'h3002 :  // <0161> push i // func load_afrc_cmd
addr == 16'h279 ? 16'h3005 :  // <0161> push y // "
addr == 16'h27a ? 16'h303e :  // <0161> push rtna // "

// loads 1 row only.

addr == 16'h27b ? 16'hfba0 :  // <0130> callx fletcher16_init
addr == 16'h27c ? 16'h022d :  // <0130> "
addr == 16'h27d ? 16'hfc00 :  // <0130> "
// expect valid row index.
addr == 16'h27e ? 16'hfba0 :  // <0132> call  get4x
addr == 16'h27f ? 16'h010c :  // <0132> "
addr == 16'h280 ? 16'hfc00 :  // <0132> "
addr == 16'h281 ? 16'h1400 :  // <0133> y = a
addr == 16'h282 ? 16'hfba0 :  // <0134> callx fletcher16_input16  a
addr == 16'h283 ? 16'h024d :  // <0134> "
addr == 16'h284 ? 16'hfc00 :  // <0134> "

addr == 16'h285 ? 16'h0005 :  // <0155> a = y
addr == 16'h286 ? 16'h0640 :  // <0155> b = 64

addr == 16'h287 ? 16'he405 :  // <0135> bn lt :else_647
addr == 16'h288 ? 16'h02ab :  // <0135> "

// set RAM address to start of given row.  call struct_read for its side effect on Avalon address regs.
addr == 16'h289 ? 16'h0005 :  // <0137> a = y
addr == 16'h28a ? 16'h0610 :  // <0138> b = $afrc_rpm_cols
addr == 16'h28b ? 16'hc800 :  // <0139> nop
addr == 16'h28c ? 16'hc800 :  // <0140> nop
addr == 16'h28d ? 16'hc800 :  // <0141> nop
addr == 16'h28e ? 16'hc800 :  // <0142> nop
addr == 16'h28f ? 16'h0410 :  // <0143> b = product_lo

addr == 16'h290 ? 16'h0351 :  // <0144> a = a<<1
addr == 16'h291 ? 16'h0600 :  // <0144> b = 0
addr == 16'h292 ? 16'h67a0 :  // <0144> av_ad_hi = 256
addr == 16'h293 ? 16'h0100 :  // <0144> "
addr == 16'h294 ? 16'h6b00 :  // <0144> av_ad_lo = ad0
addr == 16'h295 ? 16'h0417 :  // <0144> b = av_begin_read
addr == 16'h296 ? 16'h0418 :  // <0144> b = av_read_data


// expect each cell value back-to-back.
addr == 16'h297 ? 16'h0a00 :  // <0154> i = 0
// :loop_663 // = 0x0298

addr == 16'h298 ? 16'hfba0 :  // <0147> call  get4x
addr == 16'h299 ? 16'h010c :  // <0147> "
addr == 16'h29a ? 16'hfc00 :  // <0147> "
addr == 16'h29b ? 16'h5c00 :  // <0148> av_write_data = a
addr == 16'h29c ? 16'hfba0 :  // <0149> callx fletcher16_input16  a
addr == 16'h29d ? 16'h024d :  // <0149> "
addr == 16'h29e ? 16'hfc00 :  // <0149> "
addr == 16'h29f ? 16'h001a :  // <0150> a = av_ad_lo
addr == 16'h2a0 ? 16'h0602 :  // <0151> b = 2
addr == 16'h2a1 ? 16'hc800 :  // <0152> av_ad_lo = a+b
addr == 16'h2a2 ? 16'h6b00 :  // <0152> "


addr == 16'h2a3 ? 16'h0002 :  // <0154> a = i
addr == 16'h2a4 ? 16'h0601 :  // <0154> b = 1
addr == 16'h2a5 ? 16'hc800 :  // <0154> i = a+b
addr == 16'h2a6 ? 16'h0b00 :  // <0154> "


addr == 16'h2a7 ? 16'h0002 :  // <0154> a = i
addr == 16'h2a8 ? 16'h0610 :  // <0154> b = $afrc_rpm_cols
addr == 16'h2a9 ? 16'he005 :  // <0154> br lt :loop_663
addr == 16'h2aa ? 16'h0298 :  // <0154> "

// :end_663 // = 0x02ab


// reply with checksum
addr == 16'h2ab ? 16'hfba0 :  // <0158> callx fletcher16_result a
addr == 16'h2ac ? 16'h025e :  // <0158> "
addr == 16'h2ad ? 16'hfc00 :  // <0158> "
addr == 16'h2ae ? 16'hfba0 :  // <0159> call put4x
addr == 16'h2af ? 16'h00d3 :  // <0159> "
addr == 16'h2b0 ? 16'hfc00 :  // <0159> "
addr == 16'h2b1 ? 16'h020d :  // <0160> a = 13 // puteol
addr == 16'h2b2 ? 16'hfba0 :  // <0160> puteol
addr == 16'h2b3 ? 16'h00ab :  // <0160> "
addr == 16'h2b4 ? 16'hfc00 :  // <0160> "
addr == 16'h2b5 ? 16'h020a :  // <0160> a = 10 // puteol
addr == 16'h2b6 ? 16'hfba0 :  // <0160> puteol
addr == 16'h2b7 ? 16'h00ab :  // <0160> "
addr == 16'h2b8 ? 16'hfc00 :  // <0160> "

addr == 16'h2b9 ? 16'hf80c :  // <0162> pop rtna // func load_afrc_cmd
addr == 16'h2ba ? 16'h140c :  // <0162> pop y // "
addr == 16'h2bb ? 16'h080c :  // <0162> pop i // "
addr == 16'h2bc ? 16'hfc00 :  // <0162> swapra = nop

// ######## func load_row_cmd // = 0x02bd
addr == 16'h2bd ? 16'h3002 :  // <0183> push i // func load_row_cmd
addr == 16'h2be ? 16'h303e :  // <0183> push rtna // "

// loads 1 row of data having the given number of words.
// start of row address must be already loaded into av_ad_hi and av_ad_lo.

addr == 16'h2bf ? 16'hfba0 :  // <0167> callx fletcher16_init
addr == 16'h2c0 ? 16'h022d :  // <0167> "
addr == 16'h2c1 ? 16'hfc00 :  // <0167> "

// expect each cell value back-to-back.
addr == 16'h2c2 ? 16'h0a00 :  // <0177> i = 0
// :loop_706 // = 0x02c3

addr == 16'h2c3 ? 16'hfba0 :  // <0170> call  get4x
addr == 16'h2c4 ? 16'h010c :  // <0170> "
addr == 16'h2c5 ? 16'hfc00 :  // <0170> "
addr == 16'h2c6 ? 16'h5c00 :  // <0171> av_write_data = a
addr == 16'h2c7 ? 16'hfba0 :  // <0172> callx fletcher16_input16  a
addr == 16'h2c8 ? 16'h024d :  // <0172> "
addr == 16'h2c9 ? 16'hfc00 :  // <0172> "
addr == 16'h2ca ? 16'h001a :  // <0173> a = av_ad_lo
addr == 16'h2cb ? 16'h0602 :  // <0174> b = 2
addr == 16'h2cc ? 16'hc800 :  // <0175> av_ad_lo = a+b
addr == 16'h2cd ? 16'h6b00 :  // <0175> "


addr == 16'h2ce ? 16'h0002 :  // <0177> a = i
addr == 16'h2cf ? 16'h0601 :  // <0177> b = 1
addr == 16'h2d0 ? 16'hc800 :  // <0177> i = a+b
addr == 16'h2d1 ? 16'h0b00 :  // <0177> "


addr == 16'h2d2 ? 16'h0002 :  // <0177> a = i
addr == 16'h2d3 ? 16'h0408 :  // <0177> b = num_words
addr == 16'h2d4 ? 16'he005 :  // <0177> br lt :loop_706
addr == 16'h2d5 ? 16'h02c3 :  // <0177> "

// :end_706 // = 0x02d6

// reply with checksum
addr == 16'h2d6 ? 16'hfba0 :  // <0180> callx fletcher16_result a
addr == 16'h2d7 ? 16'h025e :  // <0180> "
addr == 16'h2d8 ? 16'hfc00 :  // <0180> "
addr == 16'h2d9 ? 16'hfba0 :  // <0181> call put4x
addr == 16'h2da ? 16'h00d3 :  // <0181> "
addr == 16'h2db ? 16'hfc00 :  // <0181> "
addr == 16'h2dc ? 16'h020d :  // <0182> a = 13 // puteol
addr == 16'h2dd ? 16'hfba0 :  // <0182> puteol
addr == 16'h2de ? 16'h00ab :  // <0182> "
addr == 16'h2df ? 16'hfc00 :  // <0182> "
addr == 16'h2e0 ? 16'h020a :  // <0182> a = 10 // puteol
addr == 16'h2e1 ? 16'hfba0 :  // <0182> puteol
addr == 16'h2e2 ? 16'h00ab :  // <0182> "
addr == 16'h2e3 ? 16'hfc00 :  // <0182> "

addr == 16'h2e4 ? 16'hf80c :  // <0184> pop rtna // func load_row_cmd
addr == 16'h2e5 ? 16'h080c :  // <0184> pop i // "
addr == 16'h2e6 ? 16'hfc00 :  // <0184> swapra = nop

// ######## func load_rpm_ref_cmd // = 0x02e7
addr == 16'h2e7 ? 16'h303e :  // <0189> push rtna // func load_rpm_ref_cmd

addr == 16'h2e8 ? 16'h0600 :  // <0186> b = 0

addr == 16'h2e9 ? 16'h0351 :  // <0187> a = a<<1
addr == 16'h2ea ? 16'h07a0 :  // <0187> b = 2560
addr == 16'h2eb ? 16'h0a00 :  // <0187> "
addr == 16'h2ec ? 16'h67a0 :  // <0187> av_ad_hi = 256
addr == 16'h2ed ? 16'h0100 :  // <0187> "
addr == 16'h2ee ? 16'h6b00 :  // <0187> av_ad_lo = ad0
addr == 16'h2ef ? 16'h0417 :  // <0187> b = av_begin_read
addr == 16'h2f0 ? 16'h0418 :  // <0187> b = av_read_data

addr == 16'h2f1 ? 16'h2210 :  // <0188> pa = 16
addr == 16'h2f2 ? 16'hfba0 :  // <0188> callx load_row_cmd $rpm_ref_num_cells
addr == 16'h2f3 ? 16'h02bd :  // <0188> "
addr == 16'h2f4 ? 16'hfc00 :  // <0188> "

addr == 16'h2f5 ? 16'hf80c :  // <0190> pop rtna // func load_rpm_ref_cmd
addr == 16'h2f6 ? 16'hfc00 :  // <0190> swapra = nop

// ######## func load_maf_ref_cmd // = 0x02f7
addr == 16'h2f7 ? 16'h303e :  // <0195> push rtna // func load_maf_ref_cmd

addr == 16'h2f8 ? 16'h0600 :  // <0192> b = 0

addr == 16'h2f9 ? 16'h0351 :  // <0193> a = a<<1
addr == 16'h2fa ? 16'h07a0 :  // <0193> b = 2048
addr == 16'h2fb ? 16'h0800 :  // <0193> "
addr == 16'h2fc ? 16'h67a0 :  // <0193> av_ad_hi = 256
addr == 16'h2fd ? 16'h0100 :  // <0193> "
addr == 16'h2fe ? 16'h6b00 :  // <0193> av_ad_lo = ad0
addr == 16'h2ff ? 16'h0417 :  // <0193> b = av_begin_read
addr == 16'h300 ? 16'h0418 :  // <0193> b = av_read_data

addr == 16'h301 ? 16'h23a0 :  // <0194> pa = 256
addr == 16'h302 ? 16'h0100 :  // <0194> "
addr == 16'h303 ? 16'hfba0 :  // <0194> callx load_row_cmd $maf_ref_num_cells
addr == 16'h304 ? 16'h02bd :  // <0194> "
addr == 16'h305 ? 16'hfc00 :  // <0194> "

addr == 16'h306 ? 16'hf80c :  // <0196> pop rtna // func load_maf_ref_cmd
addr == 16'h307 ? 16'hfc00 :  // <0196> swapra = nop

// ######## func load_block_temp_ref_cmd // = 0x0308
addr == 16'h308 ? 16'h303e :  // <0201> push rtna // func load_block_temp_ref_cmd

addr == 16'h309 ? 16'h0600 :  // <0198> b = 0

addr == 16'h30a ? 16'h0351 :  // <0199> a = a<<1
addr == 16'h30b ? 16'h07a0 :  // <0199> b = 2592
addr == 16'h30c ? 16'h0a20 :  // <0199> "
addr == 16'h30d ? 16'h67a0 :  // <0199> av_ad_hi = 256
addr == 16'h30e ? 16'h0100 :  // <0199> "
addr == 16'h30f ? 16'h6b00 :  // <0199> av_ad_lo = ad0
addr == 16'h310 ? 16'h0417 :  // <0199> b = av_begin_read
addr == 16'h311 ? 16'h0418 :  // <0199> b = av_read_data

addr == 16'h312 ? 16'h2240 :  // <0200> pa = 64
addr == 16'h313 ? 16'hfba0 :  // <0200> callx load_row_cmd $block_temp_num_cells
addr == 16'h314 ? 16'h02bd :  // <0200> "
addr == 16'h315 ? 16'hfc00 :  // <0200> "

addr == 16'h316 ? 16'hf80c :  // <0202> pop rtna // func load_block_temp_ref_cmd
addr == 16'h317 ? 16'hfc00 :  // <0202> swapra = nop

// ######## func load_block_temp_map_cmd // = 0x0318
addr == 16'h318 ? 16'h303e :  // <0207> push rtna // func load_block_temp_map_cmd

addr == 16'h319 ? 16'h0600 :  // <0204> b = 0

addr == 16'h31a ? 16'h0351 :  // <0205> a = a<<1
addr == 16'h31b ? 16'h07a0 :  // <0205> b = 2720
addr == 16'h31c ? 16'h0aa0 :  // <0205> "
addr == 16'h31d ? 16'h67a0 :  // <0205> av_ad_hi = 256
addr == 16'h31e ? 16'h0100 :  // <0205> "
addr == 16'h31f ? 16'h6b00 :  // <0205> av_ad_lo = ad0
addr == 16'h320 ? 16'h0417 :  // <0205> b = av_begin_read
addr == 16'h321 ? 16'h0418 :  // <0205> b = av_read_data

addr == 16'h322 ? 16'h2240 :  // <0206> pa = 64
addr == 16'h323 ? 16'hfba0 :  // <0206> callx load_row_cmd $block_temp_num_cells
addr == 16'h324 ? 16'h02bd :  // <0206> "
addr == 16'h325 ? 16'hfc00 :  // <0206> "

addr == 16'h326 ? 16'hf80c :  // <0208> pop rtna // func load_block_temp_map_cmd
addr == 16'h327 ? 16'hfc00 :  // <0208> swapra = nop

// ######## func load_afterstart_ref_cmd // = 0x0328
addr == 16'h328 ? 16'h303e :  // <0213> push rtna // func load_afterstart_ref_cmd

addr == 16'h329 ? 16'h0600 :  // <0210> b = 0

addr == 16'h32a ? 16'h0351 :  // <0211> a = a<<1
addr == 16'h32b ? 16'h07a0 :  // <0211> b = 2848
addr == 16'h32c ? 16'h0b20 :  // <0211> "
addr == 16'h32d ? 16'h67a0 :  // <0211> av_ad_hi = 256
addr == 16'h32e ? 16'h0100 :  // <0211> "
addr == 16'h32f ? 16'h6b00 :  // <0211> av_ad_lo = ad0
addr == 16'h330 ? 16'h0417 :  // <0211> b = av_begin_read
addr == 16'h331 ? 16'h0418 :  // <0211> b = av_read_data

addr == 16'h332 ? 16'h220a :  // <0212> pa = 10
addr == 16'h333 ? 16'hfba0 :  // <0212> callx load_row_cmd $afterstart_num_cells
addr == 16'h334 ? 16'h02bd :  // <0212> "
addr == 16'h335 ? 16'hfc00 :  // <0212> "

addr == 16'h336 ? 16'hf80c :  // <0214> pop rtna // func load_afterstart_ref_cmd
addr == 16'h337 ? 16'hfc00 :  // <0214> swapra = nop

// ######## func load_afterstart_map_cmd // = 0x0338
addr == 16'h338 ? 16'h303e :  // <0219> push rtna // func load_afterstart_map_cmd

addr == 16'h339 ? 16'h0600 :  // <0216> b = 0

addr == 16'h33a ? 16'h0351 :  // <0217> a = a<<1
addr == 16'h33b ? 16'h07a0 :  // <0217> b = 2868
addr == 16'h33c ? 16'h0b34 :  // <0217> "
addr == 16'h33d ? 16'h67a0 :  // <0217> av_ad_hi = 256
addr == 16'h33e ? 16'h0100 :  // <0217> "
addr == 16'h33f ? 16'h6b00 :  // <0217> av_ad_lo = ad0
addr == 16'h340 ? 16'h0417 :  // <0217> b = av_begin_read
addr == 16'h341 ? 16'h0418 :  // <0217> b = av_read_data

addr == 16'h342 ? 16'h220a :  // <0218> pa = 10
addr == 16'h343 ? 16'hfba0 :  // <0218> callx load_row_cmd $afterstart_num_cells
addr == 16'h344 ? 16'h02bd :  // <0218> "
addr == 16'h345 ? 16'hfc00 :  // <0218> "

addr == 16'h346 ? 16'hf80c :  // <0220> pop rtna // func load_afterstart_map_cmd
addr == 16'h347 ? 16'hfc00 :  // <0220> swapra = nop




// when commands share a common suffix, the longer command must come FIRST here.
// :cmd_table // = 0x0348
// "  hello"
addr == 16'h348 ? 16'h2020 :  // <0006>   
addr == 16'h349 ? 16'h6568 :  // <0006> eh
addr == 16'h34a ? 16'h6c6c :  // <0006> ll
addr == 16'h34b ? 16'h006f :  // <0006>  o
addr == 16'h34c ? 16'h0410 :  // <0007> ([label hello_cmd])
// "  plstp"
addr == 16'h34d ? 16'h2020 :  // <0008>   
addr == 16'h34e ? 16'h6c70 :  // <0008> lp
addr == 16'h34f ? 16'h7473 :  // <0008> ts
addr == 16'h350 ? 16'h0070 :  // <0008>  p
addr == 16'h351 ? 16'h0414 :  // <0009> ([label set_plan_stop_cmd])
// "   plcr"
addr == 16'h352 ? 16'h2020 :  // <0010>   
addr == 16'h353 ? 16'h7020 :  // <0010> p 
addr == 16'h354 ? 16'h636c :  // <0010> cl
addr == 16'h355 ? 16'h0072 :  // <0010>  r
addr == 16'h356 ? 16'h041f :  // <0011> ([label set_plan_crank_cmd])
//"   plwm"
//([label set_plan_warmup_cmd])
// "   plrn"
addr == 16'h357 ? 16'h2020 :  // <0014>   
addr == 16'h358 ? 16'h7020 :  // <0014> p 
addr == 16'h359 ? 16'h726c :  // <0014> rl
addr == 16'h35a ? 16'h006e :  // <0014>  n
addr == 16'h35b ? 16'h042a :  // <0015> ([label set_plan_run_cmd])
//"   plln"
//([label set_plan_learn_cmd])
// "   afrc"
addr == 16'h35c ? 16'h2020 :  // <0018>   
addr == 16'h35d ? 16'h6120 :  // <0018> a 
addr == 16'h35e ? 16'h7266 :  // <0018> rf
addr == 16'h35f ? 16'h0063 :  // <0018>  c
addr == 16'h360 ? 16'h0697 :  // <0019> ([label dump_afrc_cmd])
// " ldafrc"
addr == 16'h361 ? 16'h6c20 :  // <0020> l 
addr == 16'h362 ? 16'h6164 :  // <0020> ad
addr == 16'h363 ? 16'h7266 :  // <0020> rf
addr == 16'h364 ? 16'h0063 :  // <0020>  c
addr == 16'h365 ? 16'h0278 :  // <0021> ([label load_afrc_cmd])
// "  ldrpm"
addr == 16'h366 ? 16'h2020 :  // <0022>   
addr == 16'h367 ? 16'h646c :  // <0022> dl
addr == 16'h368 ? 16'h7072 :  // <0022> pr
addr == 16'h369 ? 16'h006d :  // <0022>  m
addr == 16'h36a ? 16'h02e7 :  // <0023> ([label load_rpm_ref_cmd])
// "  ldmaf"
addr == 16'h36b ? 16'h2020 :  // <0024>   
addr == 16'h36c ? 16'h646c :  // <0024> dl
addr == 16'h36d ? 16'h616d :  // <0024> am
addr == 16'h36e ? 16'h0066 :  // <0024>  f
addr == 16'h36f ? 16'h02f7 :  // <0025> ([label load_maf_ref_cmd])
// "ldbtref"
addr == 16'h370 ? 16'h646c :  // <0026> dl
addr == 16'h371 ? 16'h7462 :  // <0026> tb
addr == 16'h372 ? 16'h6572 :  // <0026> er
addr == 16'h373 ? 16'h0066 :  // <0026>  f
addr == 16'h374 ? 16'h0308 :  // <0027> ([label load_block_temp_ref_cmd])
// "ldbtmap"
addr == 16'h375 ? 16'h646c :  // <0028> dl
addr == 16'h376 ? 16'h7462 :  // <0028> tb
addr == 16'h377 ? 16'h616d :  // <0028> am
addr == 16'h378 ? 16'h0070 :  // <0028>  p
addr == 16'h379 ? 16'h0318 :  // <0029> ([label load_block_temp_map_cmd])
// "ldastref"
addr == 16'h37a ? 16'h646c :  // <0030> dl
addr == 16'h37b ? 16'h7361 :  // <0030> sa
addr == 16'h37c ? 16'h7274 :  // <0030> rt
addr == 16'h37d ? 16'h6665 :  // <0030> fe
addr == 16'h37e ? 16'h0328 :  // <0031> ([label load_afterstart_ref_cmd])
// "ldastmap"
addr == 16'h37f ? 16'h646c :  // <0032> dl
addr == 16'h380 ? 16'h7361 :  // <0032> sa
addr == 16'h381 ? 16'h6d74 :  // <0032> mt
addr == 16'h382 ? 16'h7061 :  // <0032> pa
addr == 16'h383 ? 16'h0338 :  // <0033> ([label load_afterstart_map_cmd])
// "      ,"
addr == 16'h384 ? 16'h2020 :  // <0034>   
addr == 16'h385 ? 16'h2020 :  // <0034>   
addr == 16'h386 ? 16'h2020 :  // <0034>   
addr == 16'h387 ? 16'h002c :  // <0034>  ,
addr == 16'h388 ? 16'h04dc :  // <0035> ([label trim_lean_cmd])
// "      ."
addr == 16'h389 ? 16'h2020 :  // <0036>   
addr == 16'h38a ? 16'h2020 :  // <0036>   
addr == 16'h38b ? 16'h2020 :  // <0036>   
addr == 16'h38c ? 16'h002e :  // <0036>  .
addr == 16'h38d ? 16'h04ed :  // <0037> ([label trim_rich_cmd])
// "      \["
addr == 16'h38e ? 16'h2020 :  // <0038>   
addr == 16'h38f ? 16'h2020 :  // <0038>   
addr == 16'h390 ? 16'h2020 :  // <0038>   
addr == 16'h391 ? 16'h005b :  // <0038>  [
addr == 16'h392 ? 16'h04fe :  // <0039> ([label trim_2lean_cmd])
// "      \]"
addr == 16'h393 ? 16'h2020 :  // <0040>   
addr == 16'h394 ? 16'h2020 :  // <0040>   
addr == 16'h395 ? 16'h2020 :  // <0040>   
addr == 16'h396 ? 16'h005d :  // <0040>  ]
addr == 16'h397 ? 16'h050f :  // <0041> ([label trim_2rich_cmd])
// "\x0\x0"
addr == 16'h398 ? 16'h0000 :  // <0042>   


// ######## func parse_key // = 0x0399
addr == 16'h399 ? 16'h3002 :  // <0060> push i // func parse_key
addr == 16'h39a ? 16'h3004 :  // <0060> push x // "
addr == 16'h39b ? 16'h3005 :  // <0060> push y // "
addr == 16'h39c ? 16'h303e :  // <0060> push rtna // "

// memorize into ram_key_buf, pushing down existing content.
addr == 16'h39d ? 16'h1008 :  // <0047> x = key
addr == 16'h39e ? 16'h0a07 :  // <0056> i = $key_buf_max
// :loop_926 // = 0x039f

addr == 16'h39f ? 16'h0002 :  // <0048> a = i

addr == 16'h3a0 ? 16'h0351 :  // <0049> a = a<<1
addr == 16'h3a1 ? 16'h0600 :  // <0049> b = 0
addr == 16'h3a2 ? 16'h6600 :  // <0049> av_ad_hi = 0
addr == 16'h3a3 ? 16'h6b00 :  // <0049> av_ad_lo = ad0
addr == 16'h3a4 ? 16'h0417 :  // <0049> b = av_begin_read
addr == 16'h3a5 ? 16'h0418 :  // <0049> b = av_read_data

addr == 16'h3a6 ? 16'h1401 :  // <0050> y = b
addr == 16'h3a7 ? 16'h0002 :  // <0051> a = i
addr == 16'h3a8 ? 16'h0404 :  // <0052> b = x

addr == 16'h3a9 ? 16'h0351 :  // <0053> a = a<<1
addr == 16'h3aa ? 16'h3001 :  // <0053> push b // push b
addr == 16'h3ab ? 16'h0600 :  // <0053> b = 0
addr == 16'h3ac ? 16'h6600 :  // <0053> av_ad_hi = 0
addr == 16'h3ad ? 16'h6b00 :  // <0053> av_ad_lo = ad0
addr == 16'h3ae ? 16'h5c0c :  // <0053> pop av_write_data // pop av_write_data

addr == 16'h3af ? 16'h1005 :  // <0054> x = y


addr == 16'h3b0 ? 16'h0002 :  // <0056> a = i
addr == 16'h3b1 ? 16'h0600 :  // <0056> b = 0
addr == 16'h3b2 ? 16'he007 :  // <0056> br eq :end_926
addr == 16'h3b3 ? 16'h03bc :  // <0056> "


addr == 16'h3b4 ? 16'h0002 :  // <0056> a = i
addr == 16'h3b5 ? 16'h0760 :  // <0056> b = -1
addr == 16'h3b6 ? 16'hc800 :  // <0056> i = a+b
addr == 16'h3b7 ? 16'h0b00 :  // <0056> "


addr == 16'h3b8 ? 16'h0002 :  // <0056> a = i
addr == 16'h3b9 ? 16'h0600 :  // <0056> b = 0
addr == 16'h3ba ? 16'he405 :  // <0056> bn lt :loop_926
addr == 16'h3bb ? 16'h039f :  // <0056> "

// :end_926 // = 0x03bc

addr == 16'h3bc ? 16'h0008 :  // <0059> a = key
addr == 16'h3bd ? 16'h060d :  // <0059> b = 13

addr == 16'h3be ? 16'he407 :  // <0057> bn eq :else_958
addr == 16'h3bf ? 16'h03c3 :  // <0057> "

addr == 16'h3c0 ? 16'hfba0 :  // <0058> callx  parse_command
addr == 16'h3c1 ? 16'h03ca :  // <0058> "
addr == 16'h3c2 ? 16'hfc00 :  // <0058> "


addr == 16'h3c3 ? 16'hf80c :  // <0061> pop rtna // func parse_key
addr == 16'h3c4 ? 16'h140c :  // <0061> pop y // "
addr == 16'h3c5 ? 16'h100c :  // <0061> pop x // "
addr == 16'h3c6 ? 16'h080c :  // <0061> pop i // "
addr == 16'h3c7 ? 16'hfc00 :  // <0061> swapra = nop

// :cmd_ack_msg // = 0x03c8
// "OK\x0"
addr == 16'h3c8 ? 16'h4b4f :  // <0063> KO
addr == 16'h3c9 ? 16'h0000 :  // <0063>   

// ######## func parse_command // = 0x03ca
addr == 16'h3ca ? 16'h3002 :  // <0104> push i // func parse_command
addr == 16'h3cb ? 16'h3004 :  // <0104> push x // "
addr == 16'h3cc ? 16'h3005 :  // <0104> push y // "
addr == 16'h3cd ? 16'h303e :  // <0104> push rtna // "

addr == 16'h3ce ? 16'h13a0 :  // <0066> x = :cmd_table
addr == 16'h3cf ? 16'h0348 :  // <0066> "
// :next_cmd // = 0x03d0
addr == 16'h3d0 ? 16'hd004 :  // <0068> fetch a from x
addr == 16'h3d1 ? 16'h03b0 :  // <0068> "
addr == 16'h3d2 ? 16'he000 :  // <0069> br az :done
addr == 16'h3d3 ? 16'h040b :  // <0069> "

addr == 16'h3d4 ? 16'h0a00 :  // <0085> i = 0
// :loop_980 // = 0x03d5

addr == 16'h3d5 ? 16'h0002 :  // <0071> a = i
addr == 16'h3d6 ? 16'hfba0 :  // <0072> call :fetch_byte
addr == 16'h3d7 ? 16'h01ec :  // <0072> "
addr == 16'h3d8 ? 16'hfc00 :  // <0072> "
addr == 16'h3d9 ? 16'h1400 :  // <0073> y = a
addr == 16'h3da ? 16'h0620 :  // <0074> b = 32 // asc b = " "

addr == 16'h3db ? 16'h0000 :  // <0083> a = a
addr == 16'h3dc ? 16'h0401 :  // <0083> b = b

addr == 16'h3dd ? 16'he007 :  // <0075> br eq :else_989
addr == 16'h3de ? 16'h03ec :  // <0075> "

addr == 16'h3df ? 16'h062a :  // <0076> b = 42 // asc b = "*"
addr == 16'h3e0 ? 16'he007 :  // <0077> br eq :matched
addr == 16'h3e1 ? 16'h03f4 :  // <0077> "
// parameter character.  succeed early.
addr == 16'h3e2 ? 16'h0002 :  // <0079> a = i

addr == 16'h3e3 ? 16'h0351 :  // <0080> a = a<<1
addr == 16'h3e4 ? 16'h0600 :  // <0080> b = 0
addr == 16'h3e5 ? 16'h6600 :  // <0080> av_ad_hi = 0
addr == 16'h3e6 ? 16'h6b00 :  // <0080> av_ad_lo = ad0
addr == 16'h3e7 ? 16'h0417 :  // <0080> b = av_begin_read
addr == 16'h3e8 ? 16'h0418 :  // <0080> b = av_read_data

addr == 16'h3e9 ? 16'h0005 :  // <0081> a = y
addr == 16'h3ea ? 16'he407 :  // <0082> bn eq :no_match
addr == 16'h3eb ? 16'h0400 :  // <0082> "



addr == 16'h3ec ? 16'h0002 :  // <0085> a = i
addr == 16'h3ed ? 16'h0601 :  // <0085> b = 1
addr == 16'h3ee ? 16'hc800 :  // <0085> i = a+b
addr == 16'h3ef ? 16'h0b00 :  // <0085> "


addr == 16'h3f0 ? 16'h0002 :  // <0085> a = i
addr == 16'h3f1 ? 16'h0607 :  // <0085> b = $key_buf_max
addr == 16'h3f2 ? 16'he005 :  // <0085> br lt :loop_980
addr == 16'h3f3 ? 16'h03d5 :  // <0085> "

// :end_980 // = 0x03f4

// at this point we have a match on the record beginning at x.
// :matched // = 0x03f4
addr == 16'h3f4 ? 16'h23a0 :  // <0089> pa = :cmd_ack_msg
addr == 16'h3f5 ? 16'h03c8 :  // <0089> "
addr == 16'h3f6 ? 16'hfba0 :  // <0089> callx  set_text_flag  :cmd_ack_msg
addr == 16'h3f7 ? 16'h0ac5 :  // <0089> "
addr == 16'h3f8 ? 16'hfc00 :  // <0089> "
addr == 16'h3f9 ? 16'h1604 :  // <0090> y = ($key_buf_len / 2)
addr == 16'h3fa ? 16'hc800 :  // <0091> fetch rtna from x+y
addr == 16'h3fb ? 16'hd320 :  // <0091> "
addr == 16'h3fc ? 16'hfbb0 :  // <0091> "
addr == 16'h3fd ? 16'hfc00 :  // <0092> swapra = nop
addr == 16'h3fe ? 16'he00f :  // <0094> jmp :done
addr == 16'h3ff ? 16'h040b :  // <0094> "

// :no_match // = 0x0400
// if ram_terminal_connected is still 0, quit searching after the very first command in the table.
addr == 16'h400 ? 16'h6600 :  // <0098> ram a = $ram_terminal_connected // av_ad_hi = 0
addr == 16'h401 ? 16'h6a94 :  // <0098> ram a = $ram_terminal_connected // av_ad_lo = 148
addr == 16'h402 ? 16'h0017 :  // <0098> ram a = $ram_terminal_connected // a = av_write_data // start read cycle
addr == 16'h403 ? 16'h0018 :  // <0098> ram a = $ram_terminal_connected // a = av_read_data // finish read cycle
addr == 16'h404 ? 16'he000 :  // <0099> br az :done
addr == 16'h405 ? 16'h040b :  // <0099> "

addr == 16'h406 ? 16'h1605 :  // <0101> y = (($key_buf_len / 2) + 1)
addr == 16'h407 ? 16'hc800 :  // <0102> x = x+y
addr == 16'h408 ? 16'h1320 :  // <0102> "
addr == 16'h409 ? 16'he00f :  // <0103> jmp :next_cmd
addr == 16'h40a ? 16'h03d0 :  // <0103> "
// :done // = 0x040b

addr == 16'h40b ? 16'hf80c :  // <0106> pop rtna // func parse_command
addr == 16'h40c ? 16'h140c :  // <0106> pop y // "
addr == 16'h40d ? 16'h100c :  // <0106> pop x // "
addr == 16'h40e ? 16'h080c :  // <0106> pop i // "
addr == 16'h40f ? 16'hfc00 :  // <0106> swapra = nop

// ######## func hello_cmd // = 0x0410

addr == 16'h410 ? 16'h6600 :  // <0108> ram $ram_terminal_connected = 1 // av_ad_hi = 0
addr == 16'h411 ? 16'h6a94 :  // <0108> ram $ram_terminal_connected = 1 // av_ad_lo = 148
addr == 16'h412 ? 16'h5e01 :  // <0108> ram $ram_terminal_connected = 1 // av_write_data = 1

addr == 16'h413 ? 16'hfc00 :  // <0110> swapra = nop

// ######## func set_plan_stop_cmd // = 0x0414
addr == 16'h414 ? 16'h303e :  // <0115> push rtna // func set_plan_stop_cmd

addr == 16'h415 ? 16'h6600 :  // <0112> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h416 ? 16'h6a8e :  // <0112> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'h417 ? 16'hf817 :  // <0112> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h418 ? 16'hf818 :  // <0112> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h419 ? 16'hfc00 :  // <0113> swapra = nop
addr == 16'h41a ? 16'hfba0 :  // <0115> callx  init_plan_stop
addr == 16'h41b ? 16'h0437 :  // <0115> "
addr == 16'h41c ? 16'hfc00 :  // <0115> "

addr == 16'h41d ? 16'hf80c :  // <0117> pop rtna // func set_plan_stop_cmd
addr == 16'h41e ? 16'hfc00 :  // <0117> swapra = nop

// ######## func set_plan_crank_cmd // = 0x041f
addr == 16'h41f ? 16'h303e :  // <0122> push rtna // func set_plan_crank_cmd

addr == 16'h420 ? 16'h6600 :  // <0119> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h421 ? 16'h6a8e :  // <0119> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'h422 ? 16'hf817 :  // <0119> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h423 ? 16'hf818 :  // <0119> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h424 ? 16'hfc00 :  // <0120> swapra = nop
addr == 16'h425 ? 16'hfba0 :  // <0122> callx  init_plan_crank
addr == 16'h426 ? 16'h0476 :  // <0122> "
addr == 16'h427 ? 16'hfc00 :  // <0122> "

addr == 16'h428 ? 16'hf80c :  // <0124> pop rtna // func set_plan_crank_cmd
addr == 16'h429 ? 16'hfc00 :  // <0124> swapra = nop

// ######## func set_plan_run_cmd // = 0x042a
addr == 16'h42a ? 16'h303e :  // <0129> push rtna // func set_plan_run_cmd

addr == 16'h42b ? 16'h6600 :  // <0126> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h42c ? 16'h6a8e :  // <0126> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'h42d ? 16'hf817 :  // <0126> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h42e ? 16'hf818 :  // <0126> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h42f ? 16'hfc00 :  // <0127> swapra = nop
addr == 16'h430 ? 16'hfba0 :  // <0129> callx  init_plan_run
addr == 16'h431 ? 16'h0521 :  // <0129> "
addr == 16'h432 ? 16'hfc00 :  // <0129> "

addr == 16'h433 ? 16'hf80c :  // <0131> pop rtna // func set_plan_run_cmd
addr == 16'h434 ? 16'hfc00 :  // <0131> swapra = nop


// :plan_name_stop // = 0x0435
// "STP\x0"
addr == 16'h435 ? 16'h5453 :  // <0002> TS
addr == 16'h436 ? 16'h0050 :  // <0002>  P

// ######## func init_plan_stop // = 0x0437
addr == 16'h437 ? 16'h303e :  // <0023> push rtna // func init_plan_stop

// set up the stop plan.
addr == 16'h438 ? 16'hfba0 :  // <0006> callx  clear_ign_history
addr == 16'h439 ? 16'h07b2 :  // <0006> "
addr == 16'h43a ? 16'hfc00 :  // <0006> "
// set noise filter to measure RPM between 50 and 1160 to indicate cranking.
addr == 16'h43b ? 16'h6600 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_hi = 0
addr == 16'h43c ? 16'h6a82 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_lo = 130
addr == 16'h43d ? 16'h5fa0 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_write_data = 603
addr == 16'h43e ? 16'h025b :  // <0008> "
addr == 16'h43f ? 16'h6600 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h440 ? 16'h6a84 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 132
addr == 16'h441 ? 16'h5fa0 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h442 ? 16'h36b0 :  // <0009> "
addr == 16'h443 ? 16'h93a0 :  // <0010> ign_timeout_len_jf = ([rpm_to_jf 50])
addr == 16'h444 ? 16'h36b0 :  // <0010> "
// normally puff length is not touched by an init func.
// this one does it because it's part of the program boot,
// and also a good idea whenever stopping the engine.
// this might interrupt a puff in mid-pulse, but no matter in this case.
addr == 16'h445 ? 16'h6600 :  // <0015> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h446 ? 16'h6a90 :  // <0015> ram $ram_next_puff_len_us = 0 // av_ad_lo = 144
addr == 16'h447 ? 16'h5e00 :  // <0015> ram $ram_next_puff_len_us = 0 // av_write_data = 0
addr == 16'h448 ? 16'h9600 :  // <0016> puff_len_us = 0

// memorize state.
addr == 16'h449 ? 16'h6600 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_ad_hi = 0
addr == 16'h44a ? 16'h6a88 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_ad_lo = 136
addr == 16'h44b ? 16'h5fa0 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_write_data = :plan_name_stop
addr == 16'h44c ? 16'h0435 :  // <0019> "
addr == 16'h44d ? 16'h6600 :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_ad_hi = 0
addr == 16'h44e ? 16'h6a8a :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_ad_lo = 138
addr == 16'h44f ? 16'h5fa0 :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_write_data = :puff_len_stop
addr == 16'h450 ? 16'h045c :  // <0020> "
addr == 16'h451 ? 16'h6600 :  // <0021> ram $ram_transition_func = :leave_stop // av_ad_hi = 0
addr == 16'h452 ? 16'h6a8c :  // <0021> ram $ram_transition_func = :leave_stop // av_ad_lo = 140
addr == 16'h453 ? 16'h5fa0 :  // <0021> ram $ram_transition_func = :leave_stop // av_write_data = :leave_stop
addr == 16'h454 ? 16'h0460 :  // <0021> "
addr == 16'h455 ? 16'h6600 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_hi = 0
addr == 16'h456 ? 16'h6a8e :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_lo = 142
addr == 16'h457 ? 16'h5fa0 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_write_data = :destroy_plan_stop
addr == 16'h458 ? 16'h045b :  // <0022> "

addr == 16'h459 ? 16'hf80c :  // <0024> pop rtna // func init_plan_stop
addr == 16'h45a ? 16'hfc00 :  // <0024> swapra = nop

// ######## func destroy_plan_stop // = 0x045b


addr == 16'h45b ? 16'hfc00 :  // <0027> swapra = nop

// ######## func puff_len_stop // = 0x045c

addr == 16'h45c ? 16'h6600 :  // <0029> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h45d ? 16'h6a90 :  // <0029> ram $ram_next_puff_len_us = 0 // av_ad_lo = 144
addr == 16'h45e ? 16'h5e00 :  // <0029> ram $ram_next_puff_len_us = 0 // av_write_data = 0

addr == 16'h45f ? 16'hfc00 :  // <0031> swapra = nop

// ######## func leave_stop // = 0x0460
addr == 16'h460 ? 16'h303e :  // <0044> push rtna // func leave_stop

// leave stop plan if ignition switch is turned on AND more than half if the ignition history is valid.
// requiring both conditions prevents spurious noise readings from starting up the injection.
addr == 16'h461 ? 16'h0022 :  // <0035> a = power_duty
addr == 16'h462 ? 16'h0680 :  // <0036> b = $ign_switch_off_mask
addr == 16'h463 ? 16'he403 :  // <0037> bn and0z :stay
addr == 16'h464 ? 16'h0472 :  // <0037> "
addr == 16'h465 ? 16'h6600 :  // <0038> ram a = $ram_ign_bad_samples // av_ad_hi = 0
addr == 16'h466 ? 16'h6a80 :  // <0038> ram a = $ram_ign_bad_samples // av_ad_lo = 128
addr == 16'h467 ? 16'h0017 :  // <0038> ram a = $ram_ign_bad_samples // a = av_write_data // start read cycle
addr == 16'h468 ? 16'h0018 :  // <0038> ram a = $ram_ign_bad_samples // a = av_read_data // finish read cycle
addr == 16'h469 ? 16'h0608 :  // <0039> b = ($ign_history_len / 2)
addr == 16'h46a ? 16'he006 :  // <0040> br gt :stay
addr == 16'h46b ? 16'h0472 :  // <0040> "
addr == 16'h46c ? 16'hfba0 :  // <0041> callx  destroy_plan_stop
addr == 16'h46d ? 16'h045b :  // <0041> "
addr == 16'h46e ? 16'hfc00 :  // <0041> "
addr == 16'h46f ? 16'hfba0 :  // <0042> callx  init_plan_crank
addr == 16'h470 ? 16'h0476 :  // <0042> "
addr == 16'h471 ? 16'hfc00 :  // <0042> "
// :stay // = 0x0472

addr == 16'h472 ? 16'hf80c :  // <0045> pop rtna // func leave_stop
addr == 16'h473 ? 16'hfc00 :  // <0045> swapra = nop



// escalating puff length by 1500 us per puff while cranking slowly at e.g. 80 RPM
// on a frozen winter morning will ramp up from 10000 to 20000 us length in about 5 seconds.

// :plan_name_crank // = 0x0474
// "CR\x0"
addr == 16'h474 ? 16'h5243 :  // <0011> RC
addr == 16'h475 ? 16'h0000 :  // <0011>   

// ######## func init_plan_crank // = 0x0476
addr == 16'h476 ? 16'h303e :  // <0033> push rtna // func init_plan_crank

// set up the crank plan.
addr == 16'h477 ? 16'h6600 :  // <0015> ram $ram_puff_count = 0 // av_ad_hi = 0
addr == 16'h478 ? 16'h6a92 :  // <0015> ram $ram_puff_count = 0 // av_ad_lo = 146
addr == 16'h479 ? 16'h5e00 :  // <0015> ram $ram_puff_count = 0 // av_write_data = 0
// set noise filter to measure RPM between 50 and 8000 to indicate running.
addr == 16'h47a ? 16'h6600 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_ad_hi = 0
addr == 16'h47b ? 16'h6a82 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_ad_lo = 130
addr == 16'h47c ? 16'h5e57 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_write_data = 87
addr == 16'h47d ? 16'h6600 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h47e ? 16'h6a84 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 132
addr == 16'h47f ? 16'h5fa0 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h480 ? 16'h36b0 :  // <0018> "
addr == 16'h481 ? 16'h93a0 :  // <0019> ign_timeout_len_jf = ([rpm_to_jf 50])
addr == 16'h482 ? 16'h36b0 :  // <0019> "
// normally puff length is not touched by an init func.
// this one does it because it's the beginning of a crank cycle, and puff length
// should be enabled for the first puff.  otherwise the first puff would be missed.
addr == 16'h483 ? 16'h6600 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_hi = 0
addr == 16'h484 ? 16'h6a90 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_lo = 144
addr == 16'h485 ? 16'h5fa0 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_write_data = 12000
addr == 16'h486 ? 16'h2ee0 :  // <0023> "
addr == 16'h487 ? 16'h97a0 :  // <0024> puff_len_us = $crank_min_puff_len_us
addr == 16'h488 ? 16'h2ee0 :  // <0024> "
// clear ignition history again to eliminate samples where the motor kept spinning after switching from plan_run to plan_stop.
addr == 16'h489 ? 16'hfba0 :  // <0026> callx  clear_ign_history
addr == 16'h48a ? 16'h07b2 :  // <0026> "
addr == 16'h48b ? 16'hfc00 :  // <0026> "

// memorize state.
addr == 16'h48c ? 16'h6600 :  // <0029> ram $ram_plan_name = :plan_name_crank // av_ad_hi = 0
addr == 16'h48d ? 16'h6a88 :  // <0029> ram $ram_plan_name = :plan_name_crank // av_ad_lo = 136
addr == 16'h48e ? 16'h5fa0 :  // <0029> ram $ram_plan_name = :plan_name_crank // av_write_data = :plan_name_crank
addr == 16'h48f ? 16'h0474 :  // <0029> "
addr == 16'h490 ? 16'h6600 :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_ad_hi = 0
addr == 16'h491 ? 16'h6a8a :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_ad_lo = 138
addr == 16'h492 ? 16'h5fa0 :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_write_data = :puff_len_crank
addr == 16'h493 ? 16'h049f :  // <0030> "
addr == 16'h494 ? 16'h6600 :  // <0031> ram $ram_transition_func = :leave_crank // av_ad_hi = 0
addr == 16'h495 ? 16'h6a8c :  // <0031> ram $ram_transition_func = :leave_crank // av_ad_lo = 140
addr == 16'h496 ? 16'h5fa0 :  // <0031> ram $ram_transition_func = :leave_crank // av_write_data = :leave_crank
addr == 16'h497 ? 16'h04bd :  // <0031> "
addr == 16'h498 ? 16'h6600 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_hi = 0
addr == 16'h499 ? 16'h6a8e :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_lo = 142
addr == 16'h49a ? 16'h5fa0 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_write_data = :destroy_plan_crank
addr == 16'h49b ? 16'h049e :  // <0032> "

addr == 16'h49c ? 16'hf80c :  // <0034> pop rtna // func init_plan_crank
addr == 16'h49d ? 16'hfc00 :  // <0034> swapra = nop

// ######## func destroy_plan_crank // = 0x049e


addr == 16'h49e ? 16'hfc00 :  // <0037> swapra = nop

// ######## func puff_len_crank // = 0x049f
addr == 16'h49f ? 16'h303e :  // <0054> push rtna // func puff_len_crank

addr == 16'h4a0 ? 16'h6600 :  // <0039> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h4a1 ? 16'h6a92 :  // <0039> ram a = $ram_puff_count // av_ad_lo = 146
addr == 16'h4a2 ? 16'h0017 :  // <0039> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h4a3 ? 16'h0018 :  // <0039> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h4a4 ? 16'h0602 :  // <0040> b = $crank_max_puffs
addr == 16'h4a5 ? 16'he006 :  // <0041> br gt :puff_limit
addr == 16'h4a6 ? 16'h04b4 :  // <0041> "
// linear escalation from min to max puff length, at a slope of crank_incr_us_per_puff.
addr == 16'h4a7 ? 16'h07a0 :  // <0043> b = $crank_incr_us_per_puff
addr == 16'h4a8 ? 16'h0bb8 :  // <0043> "
addr == 16'h4a9 ? 16'hfba0 :  // <0044> call :multiply
addr == 16'h4aa ? 16'h0180 :  // <0044> "
addr == 16'h4ab ? 16'hfc00 :  // <0044> "
addr == 16'h4ac ? 16'h07a0 :  // <0045> b = $crank_min_puff_len_us
addr == 16'h4ad ? 16'h2ee0 :  // <0045> "
addr == 16'h4ae ? 16'h6600 :  // <0046> ram $ram_next_puff_len_us = a+b // av_ad_hi = 0
addr == 16'h4af ? 16'h6a90 :  // <0046> ram $ram_next_puff_len_us = a+b // av_ad_lo = 144
addr == 16'h4b0 ? 16'hc800 :  // <0046> ram $ram_next_puff_len_us = a+b // av_write_data = a+b
addr == 16'h4b1 ? 16'h5f00 :  // <0046> "
addr == 16'h4b2 ? 16'he00f :  // <0047> jmp :done
addr == 16'h4b3 ? 16'h04bb :  // <0047> "
// :puff_limit // = 0x04b4
// prevent the puff counter from going higher & eventually rolling over.
addr == 16'h4b4 ? 16'h6600 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_ad_hi = 0
addr == 16'h4b5 ? 16'h6a92 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_ad_lo = 146
addr == 16'h4b6 ? 16'h5e02 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_write_data = 2
// accept max puff len.
addr == 16'h4b7 ? 16'h6600 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_hi = 0
addr == 16'h4b8 ? 16'h6a90 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_lo = 144
addr == 16'h4b9 ? 16'h5fa0 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_write_data = 20000
addr == 16'h4ba ? 16'h4e20 :  // <0052> "
// :done // = 0x04bb

addr == 16'h4bb ? 16'hf80c :  // <0055> pop rtna // func puff_len_crank
addr == 16'h4bc ? 16'hfc00 :  // <0055> swapra = nop

// ######## func leave_crank // = 0x04bd
addr == 16'h4bd ? 16'h303e :  // <0071> push rtna // func leave_crank

addr == 16'h4be ? 16'hfba0 :  // <0057> callx  check_engine_stop  a
addr == 16'h4bf ? 16'h0bd1 :  // <0057> "
addr == 16'h4c0 ? 16'hfc00 :  // <0057> "
addr == 16'h4c1 ? 16'h0008 :  // <0057> a = pa
addr == 16'h4c2 ? 16'he400 :  // <0058> bn az :done
addr == 16'h4c3 ? 16'h04d8 :  // <0058> "

// transition to warmup if RPM exceeds crank_success_rpm.
addr == 16'h4c4 ? 16'h6600 :  // <0061> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h4c5 ? 16'h6a7e :  // <0061> ram a = $ram_rpm_valid // av_ad_lo = 126
addr == 16'h4c6 ? 16'h0017 :  // <0061> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h4c7 ? 16'h0018 :  // <0061> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle
addr == 16'h4c8 ? 16'he000 :  // <0062> br az :stay
addr == 16'h4c9 ? 16'h04d8 :  // <0062> "
addr == 16'h4ca ? 16'h6600 :  // <0063> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h4cb ? 16'h6a7c :  // <0063> ram a = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h4cc ? 16'h0017 :  // <0063> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h4cd ? 16'h0018 :  // <0063> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle
addr == 16'h4ce ? 16'h07a0 :  // <0064> b = $crank_success_rpm
addr == 16'h4cf ? 16'h0320 :  // <0064> "
addr == 16'h4d0 ? 16'he005 :  // <0065> br lt :stay
addr == 16'h4d1 ? 16'h04d8 :  // <0065> "
addr == 16'h4d2 ? 16'hfba0 :  // <0066> callx  destroy_plan_crank
addr == 16'h4d3 ? 16'h049e :  // <0066> "
addr == 16'h4d4 ? 16'hfc00 :  // <0066> "
addr == 16'h4d5 ? 16'hfba0 :  // <0067> callx  init_plan_run
addr == 16'h4d6 ? 16'h0521 :  // <0067> "
addr == 16'h4d7 ? 16'hfc00 :  // <0067> "
// :stay // = 0x04d8

// :done // = 0x04d8

addr == 16'h4d8 ? 16'hf80c :  // <0072> pop rtna // func leave_crank
addr == 16'h4d9 ? 16'hfc00 :  // <0072> swapra = nop


// :plan_name_run // = 0x04da
// "RN\x0"
addr == 16'h4da ? 16'h4e52 :  // <0002> NR
addr == 16'h4db ? 16'h0000 :  // <0002>   


// 0.5 to 2.0 trim factor equivalent.









// ######## func trim_lean_cmd // = 0x04dc

addr == 16'h4dc ? 16'h6600 :  // <0037> ram a = $ram_run_manual_trim // av_ad_hi = 0
addr == 16'h4dd ? 16'h6aaa :  // <0037> ram a = $ram_run_manual_trim // av_ad_lo = 170
addr == 16'h4de ? 16'h0017 :  // <0037> ram a = $ram_run_manual_trim // a = av_write_data // start read cycle
addr == 16'h4df ? 16'h0018 :  // <0037> ram a = $ram_run_manual_trim // a = av_read_data // finish read cycle

addr == 16'h4e0 ? 16'h0000 :  // <0042> a = a
addr == 16'h4e1 ? 16'h0600 :  // <0042> b = 0

addr == 16'h4e2 ? 16'he407 :  // <0038> bn eq :else_1250
addr == 16'h4e3 ? 16'h04e6 :  // <0038> "


addr == 16'h4e4 ? 16'he00f :  // <0040> jmp :end_1250
addr == 16'h4e5 ? 16'h04ec :  // <0040> "

addr == 16'h4e6 ? 16'h07a0 :  // <0041> b = ([negate $run_manual_trim_step])
addr == 16'h4e7 ? 16'hff40 :  // <0041> "
addr == 16'h4e8 ? 16'h6600 :  // <0042> ram $ram_run_manual_trim = a+b // av_ad_hi = 0
addr == 16'h4e9 ? 16'h6aaa :  // <0042> ram $ram_run_manual_trim = a+b // av_ad_lo = 170
addr == 16'h4ea ? 16'hc800 :  // <0042> ram $ram_run_manual_trim = a+b // av_write_data = a+b
addr == 16'h4eb ? 16'h5f00 :  // <0042> "


addr == 16'h4ec ? 16'hfc00 :  // <0044> swapra = nop

// ######## func trim_rich_cmd // = 0x04ed

addr == 16'h4ed ? 16'h6600 :  // <0046> ram a = $ram_run_manual_trim // av_ad_hi = 0
addr == 16'h4ee ? 16'h6aaa :  // <0046> ram a = $ram_run_manual_trim // av_ad_lo = 170
addr == 16'h4ef ? 16'h0017 :  // <0046> ram a = $ram_run_manual_trim // a = av_write_data // start read cycle
addr == 16'h4f0 ? 16'h0018 :  // <0046> ram a = $ram_run_manual_trim // a = av_read_data // finish read cycle

addr == 16'h4f1 ? 16'h0000 :  // <0051> a = a
addr == 16'h4f2 ? 16'h07a0 :  // <0051> b = 800
addr == 16'h4f3 ? 16'h0320 :  // <0051> "

addr == 16'h4f4 ? 16'he406 :  // <0047> bn gt :else_1268
addr == 16'h4f5 ? 16'h04f8 :  // <0047> "


addr == 16'h4f6 ? 16'he00f :  // <0049> jmp :end_1268
addr == 16'h4f7 ? 16'h04fd :  // <0049> "

addr == 16'h4f8 ? 16'h06c0 :  // <0050> b = $run_manual_trim_step
addr == 16'h4f9 ? 16'h6600 :  // <0051> ram $ram_run_manual_trim = a+b // av_ad_hi = 0
addr == 16'h4fa ? 16'h6aaa :  // <0051> ram $ram_run_manual_trim = a+b // av_ad_lo = 170
addr == 16'h4fb ? 16'hc800 :  // <0051> ram $ram_run_manual_trim = a+b // av_write_data = a+b
addr == 16'h4fc ? 16'h5f00 :  // <0051> "


addr == 16'h4fd ? 16'hfc00 :  // <0053> swapra = nop

// ######## func trim_2lean_cmd // = 0x04fe

addr == 16'h4fe ? 16'h6600 :  // <0055> ram a = $ram_run_manual_trim // av_ad_hi = 0
addr == 16'h4ff ? 16'h6aaa :  // <0055> ram a = $ram_run_manual_trim // av_ad_lo = 170
addr == 16'h500 ? 16'h0017 :  // <0055> ram a = $ram_run_manual_trim // a = av_write_data // start read cycle
addr == 16'h501 ? 16'h0018 :  // <0055> ram a = $ram_run_manual_trim // a = av_read_data // finish read cycle

addr == 16'h502 ? 16'h0000 :  // <0060> a = a
addr == 16'h503 ? 16'h0600 :  // <0060> b = 0

addr == 16'h504 ? 16'he407 :  // <0056> bn eq :else_1284
addr == 16'h505 ? 16'h0508 :  // <0056> "


addr == 16'h506 ? 16'he00f :  // <0058> jmp :end_1284
addr == 16'h507 ? 16'h050e :  // <0058> "

addr == 16'h508 ? 16'h07a0 :  // <0059> b = ([negate [expr $run_manual_trim_step * 8]])
addr == 16'h509 ? 16'hfa00 :  // <0059> "
addr == 16'h50a ? 16'h6600 :  // <0060> ram $ram_run_manual_trim = a+b // av_ad_hi = 0
addr == 16'h50b ? 16'h6aaa :  // <0060> ram $ram_run_manual_trim = a+b // av_ad_lo = 170
addr == 16'h50c ? 16'hc800 :  // <0060> ram $ram_run_manual_trim = a+b // av_write_data = a+b
addr == 16'h50d ? 16'h5f00 :  // <0060> "


addr == 16'h50e ? 16'hfc00 :  // <0062> swapra = nop

// ######## func trim_2rich_cmd // = 0x050f

addr == 16'h50f ? 16'h6600 :  // <0064> ram a = $ram_run_manual_trim // av_ad_hi = 0
addr == 16'h510 ? 16'h6aaa :  // <0064> ram a = $ram_run_manual_trim // av_ad_lo = 170
addr == 16'h511 ? 16'h0017 :  // <0064> ram a = $ram_run_manual_trim // a = av_write_data // start read cycle
addr == 16'h512 ? 16'h0018 :  // <0064> ram a = $ram_run_manual_trim // a = av_read_data // finish read cycle

addr == 16'h513 ? 16'h0000 :  // <0069> a = a
addr == 16'h514 ? 16'h07a0 :  // <0069> b = 800
addr == 16'h515 ? 16'h0320 :  // <0069> "

addr == 16'h516 ? 16'he406 :  // <0065> bn gt :else_1302
addr == 16'h517 ? 16'h051a :  // <0065> "


addr == 16'h518 ? 16'he00f :  // <0067> jmp :end_1302
addr == 16'h519 ? 16'h0520 :  // <0067> "

addr == 16'h51a ? 16'h07a0 :  // <0068> b = ($run_manual_trim_step * 8)
addr == 16'h51b ? 16'h0600 :  // <0068> "
addr == 16'h51c ? 16'h6600 :  // <0069> ram $ram_run_manual_trim = a+b // av_ad_hi = 0
addr == 16'h51d ? 16'h6aaa :  // <0069> ram $ram_run_manual_trim = a+b // av_ad_lo = 170
addr == 16'h51e ? 16'hc800 :  // <0069> ram $ram_run_manual_trim = a+b // av_write_data = a+b
addr == 16'h51f ? 16'h5f00 :  // <0069> "


addr == 16'h520 ? 16'hfc00 :  // <0071> swapra = nop

// ######## func init_plan_run // = 0x0521

// set up the run plan.
// this code is repeated each crank cycle, so don't depend on RAM already being 0.
addr == 16'h521 ? 16'h6600 :  // <0075> ram $ram_maf_valid = 0 // av_ad_hi = 0
addr == 16'h522 ? 16'h6a96 :  // <0075> ram $ram_maf_valid = 0 // av_ad_lo = 150
addr == 16'h523 ? 16'h5e00 :  // <0075> ram $ram_maf_valid = 0 // av_write_data = 0
addr == 16'h524 ? 16'h6600 :  // <0076> ram $ram_afrc_maf_row_idx = 0 // av_ad_hi = 0
addr == 16'h525 ? 16'h6a9c :  // <0076> ram $ram_afrc_maf_row_idx = 0 // av_ad_lo = 156
addr == 16'h526 ? 16'h5e00 :  // <0076> ram $ram_afrc_maf_row_idx = 0 // av_write_data = 0
addr == 16'h527 ? 16'h6600 :  // <0077> ram $ram_afrc_rpm_col_idx = 0 // av_ad_hi = 0
addr == 16'h528 ? 16'h6a9e :  // <0077> ram $ram_afrc_rpm_col_idx = 0 // av_ad_lo = 158
addr == 16'h529 ? 16'h5e00 :  // <0077> ram $ram_afrc_rpm_col_idx = 0 // av_write_data = 0
addr == 16'h52a ? 16'h6600 :  // <0078> ram $ram_block_temp_map_idx = 0 // av_ad_hi = 0
addr == 16'h52b ? 16'h6aa0 :  // <0078> ram $ram_block_temp_map_idx = 0 // av_ad_lo = 160
addr == 16'h52c ? 16'h5e00 :  // <0078> ram $ram_block_temp_map_idx = 0 // av_write_data = 0
addr == 16'h52d ? 16'h6600 :  // <0079> ram $ram_block_temp_trim = $trim_unity // av_ad_hi = 0
addr == 16'h52e ? 16'h6aa2 :  // <0079> ram $ram_block_temp_trim = $trim_unity // av_ad_lo = 162
addr == 16'h52f ? 16'h5fa0 :  // <0079> ram $ram_block_temp_trim = $trim_unity // av_write_data = 8192
addr == 16'h530 ? 16'h2000 :  // <0079> "
addr == 16'h531 ? 16'h6600 :  // <0080> ram $ram_afterstart_map_idx = 0 // av_ad_hi = 0
addr == 16'h532 ? 16'h6aa4 :  // <0080> ram $ram_afterstart_map_idx = 0 // av_ad_lo = 164
addr == 16'h533 ? 16'h5e00 :  // <0080> ram $ram_afterstart_map_idx = 0 // av_write_data = 0
addr == 16'h534 ? 16'h6600 :  // <0081> ram $ram_afterstart_trim = $trim_unity // av_ad_hi = 0
addr == 16'h535 ? 16'h6aa6 :  // <0081> ram $ram_afterstart_trim = $trim_unity // av_ad_lo = 166
addr == 16'h536 ? 16'h5fa0 :  // <0081> ram $ram_afterstart_trim = $trim_unity // av_write_data = 8192
addr == 16'h537 ? 16'h2000 :  // <0081> "
addr == 16'h538 ? 16'h6600 :  // <0082> ram $ram_o2_trim = $trim_unity // av_ad_hi = 0
addr == 16'h539 ? 16'h6aa8 :  // <0082> ram $ram_o2_trim = $trim_unity // av_ad_lo = 168
addr == 16'h53a ? 16'h5fa0 :  // <0082> ram $ram_o2_trim = $trim_unity // av_write_data = 8192
addr == 16'h53b ? 16'h2000 :  // <0082> "
addr == 16'h53c ? 16'h6600 :  // <0083> ram $ram_puff_count = 0 // av_ad_hi = 0
addr == 16'h53d ? 16'h6a92 :  // <0083> ram $ram_puff_count = 0 // av_ad_lo = 146
addr == 16'h53e ? 16'h5e00 :  // <0083> ram $ram_puff_count = 0 // av_write_data = 0
addr == 16'h53f ? 16'h6600 :  // <0084> ram $ram_run_manual_trim = $trim_unity // av_ad_hi = 0
addr == 16'h540 ? 16'h6aaa :  // <0084> ram $ram_run_manual_trim = $trim_unity // av_ad_lo = 170
addr == 16'h541 ? 16'h5fa0 :  // <0084> ram $ram_run_manual_trim = $trim_unity // av_write_data = 8192
addr == 16'h542 ? 16'h2000 :  // <0084> "
addr == 16'h543 ? 16'h6600 :  // <0085> ram $ram_o2_trim = $trim_unity // av_ad_hi = 0
addr == 16'h544 ? 16'h6aa8 :  // <0085> ram $ram_o2_trim = $trim_unity // av_ad_lo = 168
addr == 16'h545 ? 16'h5fa0 :  // <0085> ram $ram_o2_trim = $trim_unity // av_write_data = 8192
addr == 16'h546 ? 16'h2000 :  // <0085> "
addr == 16'h547 ? 16'h6600 :  // <0086> ram $ram_total_trim = 0 // av_ad_hi = 0
addr == 16'h548 ? 16'h6aac :  // <0086> ram $ram_total_trim = 0 // av_ad_lo = 172
addr == 16'h549 ? 16'h5e00 :  // <0086> ram $ram_total_trim = 0 // av_write_data = 0

// memorize state.
addr == 16'h54a ? 16'h6600 :  // <0089> ram $ram_plan_name = :plan_name_run // av_ad_hi = 0
addr == 16'h54b ? 16'h6a88 :  // <0089> ram $ram_plan_name = :plan_name_run // av_ad_lo = 136
addr == 16'h54c ? 16'h5fa0 :  // <0089> ram $ram_plan_name = :plan_name_run // av_write_data = :plan_name_run
addr == 16'h54d ? 16'h04da :  // <0089> "
addr == 16'h54e ? 16'h6600 :  // <0090> ram $ram_puff_len_func = :puff_len_run // av_ad_hi = 0
addr == 16'h54f ? 16'h6a8a :  // <0090> ram $ram_puff_len_func = :puff_len_run // av_ad_lo = 138
addr == 16'h550 ? 16'h5fa0 :  // <0090> ram $ram_puff_len_func = :puff_len_run // av_write_data = :puff_len_run
addr == 16'h551 ? 16'h05a1 :  // <0090> "
addr == 16'h552 ? 16'h6600 :  // <0091> ram $ram_transition_func = :leave_run // av_ad_hi = 0
addr == 16'h553 ? 16'h6a8c :  // <0091> ram $ram_transition_func = :leave_run // av_ad_lo = 140
addr == 16'h554 ? 16'h5fa0 :  // <0091> ram $ram_transition_func = :leave_run // av_write_data = :leave_run
addr == 16'h555 ? 16'h061d :  // <0091> "
addr == 16'h556 ? 16'h6600 :  // <0092> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_hi = 0
addr == 16'h557 ? 16'h6a8e :  // <0092> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_lo = 142
addr == 16'h558 ? 16'h5fa0 :  // <0092> ram $ram_destroy_plan_func = :destroy_plan_run // av_write_data = :destroy_plan_run
addr == 16'h559 ? 16'h055b :  // <0092> "

addr == 16'h55a ? 16'hfc00 :  // <0094> swapra = nop

// ######## func destroy_plan_run // = 0x055b


addr == 16'h55b ? 16'hfc00 :  // <0097> swapra = nop

// ######## func combine_trim // = 0x055c
addr == 16'h55c ? 16'h3002 :  // <0138> push i // func combine_trim
addr == 16'h55d ? 16'h3003 :  // <0138> push j // "
addr == 16'h55e ? 16'h3004 :  // <0138> push x // "

// combine the given increment with the given total trim factor, returning
// the new total trim.  this process is complicated by the decision to keep the
// 0.5 offset in the integer representation scheme.  that's done in case i ever
// have to calculate puff without the aid of a hardware multiplier.
// the process is to add the offset to each argument, multiply them,
// undo the offsets, and saturate to prevent excess accumulation.
addr == 16'h55f ? 16'h0008 :  // <0105> a = total
addr == 16'h560 ? 16'h07a0 :  // <0106> b = $trim_unity
addr == 16'h561 ? 16'h2000 :  // <0106> "
addr == 16'h562 ? 16'hc800 :  // <0107> a = a+b
addr == 16'h563 ? 16'h0300 :  // <0107> "
addr == 16'h564 ? 16'h0809 :  // <0108> i = increment
addr == 16'h565 ? 16'h0fa0 :  // <0109> j = $trim_unity
addr == 16'h566 ? 16'h2000 :  // <0109> "
addr == 16'h567 ? 16'hc800 :  // <0110> b = i+j
addr == 16'h568 ? 16'h0710 :  // <0110> "
addr == 16'h569 ? 16'hc800 :  // <0111> nop
addr == 16'h56a ? 16'hc800 :  // <0112> nop
addr == 16'h56b ? 16'hc800 :  // <0113> nop
addr == 16'h56c ? 16'hc800 :  // <0114> nop
// total = product / 16384 = product >> 14
// this cancels the two offsets that were added prior to the mult.
addr == 16'h56d ? 16'h1011 :  // <0117> x = product_hi
addr == 16'h56e ? 16'h0010 :  // <0118> a = product_lo
addr == 16'h56f ? 16'h0353 :  // <0119> a = a>>4
addr == 16'h570 ? 16'h0353 :  // <0120> a = a>>4
addr == 16'h571 ? 16'h0353 :  // <0121> a = a>>4
addr == 16'h572 ? 16'h0350 :  // <0122> a = a>>1
addr == 16'h573 ? 16'h2350 :  // <0123> out_total = a>>1
addr == 16'h574 ? 16'h0004 :  // <0124> a = x
addr == 16'h575 ? 16'h07a0 :  // <0125> b = 0x3fff
addr == 16'h576 ? 16'h3fff :  // <0125> "
addr == 16'h577 ? 16'hc800 :  // <0126> a = and
addr == 16'h578 ? 16'h0330 :  // <0126> "
addr == 16'h579 ? 16'h0351 :  // <0127> a = a<<1
addr == 16'h57a ? 16'h0351 :  // <0128> a = a<<1
addr == 16'h57b ? 16'h0408 :  // <0129> b = out_total
addr == 16'h57c ? 16'hc800 :  // <0130> a = or
addr == 16'h57d ? 16'h0334 :  // <0130> "
// subtract the unity offset to get back to the correct integer representation.
addr == 16'h57e ? 16'h07a0 :  // <0132> b = ([negate $trim_unity])
addr == 16'h57f ? 16'he000 :  // <0132> "
addr == 16'h580 ? 16'hc800 :  // <0133> out_total = a+b
addr == 16'h581 ? 16'h2300 :  // <0133> "
// clamp.

addr == 16'h582 ? 16'h0008 :  // <0137> a = out_total
addr == 16'h583 ? 16'h07a0 :  // <0137> b = 24576
addr == 16'h584 ? 16'h6000 :  // <0137> "

addr == 16'h585 ? 16'he406 :  // <0135> bn gt :else_1413
addr == 16'h586 ? 16'h0589 :  // <0135> "

addr == 16'h587 ? 16'h23a0 :  // <0136> out_total = $trim_double
addr == 16'h588 ? 16'h6000 :  // <0136> "


addr == 16'h589 ? 16'h100c :  // <0139> pop x // func combine_trim
addr == 16'h58a ? 16'h0c0c :  // <0139> pop j // "
addr == 16'h58b ? 16'h080c :  // <0139> pop i // "
addr == 16'h58c ? 16'hfc00 :  // <0139> swapra = nop

// ######## func fetch_afrc // = 0x058d

// look up Air/Fuel Ratio Correction in AFRC map.
// index rows by MAF.
addr == 16'h58d ? 16'h0008 :  // <0143> a = maf_row_idx
addr == 16'h58e ? 16'h0610 :  // <0144> b = $afrc_rpm_cols
addr == 16'h58f ? 16'hc800 :  // <0145> nop
addr == 16'h590 ? 16'hc800 :  // <0146> nop
addr == 16'h591 ? 16'hc800 :  // <0147> nop
addr == 16'h592 ? 16'hc800 :  // <0148> nop
addr == 16'h593 ? 16'h0410 :  // <0149> b = product_lo
// index columns by RPM.
addr == 16'h594 ? 16'h0009 :  // <0151> a = rpm_col_idx
addr == 16'h595 ? 16'hc800 :  // <0152> a = a+b
addr == 16'h596 ? 16'h0300 :  // <0152> "

addr == 16'h597 ? 16'h0351 :  // <0153> a = a<<1
addr == 16'h598 ? 16'h0600 :  // <0153> b = 0
addr == 16'h599 ? 16'h67a0 :  // <0153> av_ad_hi = 256
addr == 16'h59a ? 16'h0100 :  // <0153> "
addr == 16'h59b ? 16'h6b00 :  // <0153> av_ad_lo = ad0
addr == 16'h59c ? 16'h0417 :  // <0153> b = av_begin_read
addr == 16'h59d ? 16'h0418 :  // <0153> b = av_read_data

addr == 16'h59e ? 16'h2001 :  // <0154> afrc = b
addr == 16'h59f ? 16'hfc00 :  // <0153> swapra = nop

addr == 16'h5a0 ? 16'hfc00 :  // <0156> swapra = nop

// ######## func puff_len_run // = 0x05a1
addr == 16'h5a1 ? 16'h3004 :  // <0239> push x // func puff_len_run
addr == 16'h5a2 ? 16'h3007 :  // <0239> push gb // "
addr == 16'h5a3 ? 16'h303e :  // <0239> push rtna // "

addr == 16'h5a4 ? 16'h6600 :  // <0158> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h5a5 ? 16'h6a7e :  // <0158> ram a = $ram_rpm_valid // av_ad_lo = 126
addr == 16'h5a6 ? 16'h0017 :  // <0158> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h5a7 ? 16'h0018 :  // <0158> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle
addr == 16'h5a8 ? 16'he000 :  // <0159> br az :abort
addr == 16'h5a9 ? 16'h0619 :  // <0159> "
addr == 16'h5aa ? 16'h6600 :  // <0160> ram a = $ram_maf_valid // av_ad_hi = 0
addr == 16'h5ab ? 16'h6a96 :  // <0160> ram a = $ram_maf_valid // av_ad_lo = 150
addr == 16'h5ac ? 16'h0017 :  // <0160> ram a = $ram_maf_valid // a = av_write_data // start read cycle
addr == 16'h5ad ? 16'h0018 :  // <0160> ram a = $ram_maf_valid // a = av_read_data // finish read cycle
addr == 16'h5ae ? 16'he000 :  // <0161> br az :abort
addr == 16'h5af ? 16'h0619 :  // <0161> "

// look up Air/Fuel Ratio Correction in AFRC map.
addr == 16'h5b0 ? 16'h6600 :  // <0164> ram pa = $ram_afrc_maf_row_idx // av_ad_hi = 0
addr == 16'h5b1 ? 16'h6a9c :  // <0164> ram pa = $ram_afrc_maf_row_idx // av_ad_lo = 156
addr == 16'h5b2 ? 16'h2017 :  // <0164> ram pa = $ram_afrc_maf_row_idx // pa = av_write_data // start read cycle
addr == 16'h5b3 ? 16'h2018 :  // <0164> ram pa = $ram_afrc_maf_row_idx // pa = av_read_data // finish read cycle
addr == 16'h5b4 ? 16'h6600 :  // <0165> ram pb = $ram_afrc_rpm_col_idx // av_ad_hi = 0
addr == 16'h5b5 ? 16'h6a9e :  // <0165> ram pb = $ram_afrc_rpm_col_idx // av_ad_lo = 158
addr == 16'h5b6 ? 16'h2417 :  // <0165> ram pb = $ram_afrc_rpm_col_idx // pb = av_write_data // start read cycle
addr == 16'h5b7 ? 16'h2418 :  // <0165> ram pb = $ram_afrc_rpm_col_idx // pb = av_read_data // finish read cycle
addr == 16'h5b8 ? 16'hfba0 :  // <0166> callx fetch_afrc pa pb ga
addr == 16'h5b9 ? 16'h058d :  // <0166> "
addr == 16'h5ba ? 16'hfc00 :  // <0166> "
addr == 16'h5bb ? 16'h1808 :  // <0166> ga = pa
// now ga = total trim factor as integer.

// apply block temperature trim factor.
addr == 16'h5bc ? 16'h6600 :  // <0170> ram b = $ram_block_temp_trim // av_ad_hi = 0
addr == 16'h5bd ? 16'h6aa2 :  // <0170> ram b = $ram_block_temp_trim // av_ad_lo = 162
addr == 16'h5be ? 16'h0417 :  // <0170> ram b = $ram_block_temp_trim // b = av_write_data // start read cycle
addr == 16'h5bf ? 16'h0418 :  // <0170> ram b = $ram_block_temp_trim // b = av_read_data // finish read cycle
addr == 16'h5c0 ? 16'h2006 :  // <0171> pa = ga
addr == 16'h5c1 ? 16'h2401 :  // <0171> pb = b
addr == 16'h5c2 ? 16'hfba0 :  // <0171> callx combine_trim ga b ga
addr == 16'h5c3 ? 16'h055c :  // <0171> "
addr == 16'h5c4 ? 16'hfc00 :  // <0171> "
addr == 16'h5c5 ? 16'h1808 :  // <0171> ga = pa

// apply afterstart trim factor.
addr == 16'h5c6 ? 16'hfba0 :  // <0174> callx interpret_puff_count
addr == 16'h5c7 ? 16'h0657 :  // <0174> "
addr == 16'h5c8 ? 16'hfc00 :  // <0174> "
addr == 16'h5c9 ? 16'h6600 :  // <0175> ram b = $ram_afterstart_trim // av_ad_hi = 0
addr == 16'h5ca ? 16'h6aa6 :  // <0175> ram b = $ram_afterstart_trim // av_ad_lo = 166
addr == 16'h5cb ? 16'h0417 :  // <0175> ram b = $ram_afterstart_trim // b = av_write_data // start read cycle
addr == 16'h5cc ? 16'h0418 :  // <0175> ram b = $ram_afterstart_trim // b = av_read_data // finish read cycle
addr == 16'h5cd ? 16'h2006 :  // <0176> pa = ga
addr == 16'h5ce ? 16'h2401 :  // <0176> pb = b
addr == 16'h5cf ? 16'hfba0 :  // <0176> callx combine_trim ga b ga
addr == 16'h5d0 ? 16'h055c :  // <0176> "
addr == 16'h5d1 ? 16'hfc00 :  // <0176> "
addr == 16'h5d2 ? 16'h1808 :  // <0176> ga = pa

// apply stoich learning trim factor.
addr == 16'h5d3 ? 16'h6600 :  // <0179> ram b = $ram_o2_trim // av_ad_hi = 0
addr == 16'h5d4 ? 16'h6aa8 :  // <0179> ram b = $ram_o2_trim // av_ad_lo = 168
addr == 16'h5d5 ? 16'h0417 :  // <0179> ram b = $ram_o2_trim // b = av_write_data // start read cycle
addr == 16'h5d6 ? 16'h0418 :  // <0179> ram b = $ram_o2_trim // b = av_read_data // finish read cycle
addr == 16'h5d7 ? 16'h2006 :  // <0180> pa = ga
addr == 16'h5d8 ? 16'h2401 :  // <0180> pb = b
addr == 16'h5d9 ? 16'hfba0 :  // <0180> callx combine_trim ga b ga
addr == 16'h5da ? 16'h055c :  // <0180> "
addr == 16'h5db ? 16'hfc00 :  // <0180> "
addr == 16'h5dc ? 16'h1808 :  // <0180> ga = pa

// apply manual trim factor.
addr == 16'h5dd ? 16'h6600 :  // <0183> ram b = $ram_run_manual_trim // av_ad_hi = 0
addr == 16'h5de ? 16'h6aaa :  // <0183> ram b = $ram_run_manual_trim // av_ad_lo = 170
addr == 16'h5df ? 16'h0417 :  // <0183> ram b = $ram_run_manual_trim // b = av_write_data // start read cycle
addr == 16'h5e0 ? 16'h0418 :  // <0183> ram b = $ram_run_manual_trim // b = av_read_data // finish read cycle
addr == 16'h5e1 ? 16'h2006 :  // <0184> pa = ga
addr == 16'h5e2 ? 16'h2401 :  // <0184> pb = b
addr == 16'h5e3 ? 16'hfba0 :  // <0184> callx combine_trim ga b ga
addr == 16'h5e4 ? 16'h055c :  // <0184> "
addr == 16'h5e5 ? 16'hfc00 :  // <0184> "
addr == 16'h5e6 ? 16'h1808 :  // <0184> ga = pa

// final multiplication for puff length.
// (MAF linear flow) * (stoich ratio constant) * (total trim as floating point) = (puff length jf).
// here the total trim float will have to be represented as a fraction (num/denom).
// stoich ratio constant (8) (really the conversion factor from linear
// flow to nominal jf)  is folded into that denominator (16384) at compile time.
// that makes denom = 2048 = 11 bits.  so:
// gb = (puff len jf) = (MAF linear flow) * [(total trim) + trim_unity] >> 11
addr == 16'h5e7 ? 16'h0006 :  // <0193> a = ga
addr == 16'h5e8 ? 16'h07a0 :  // <0194> b = $trim_unity
addr == 16'h5e9 ? 16'h2000 :  // <0194> "
addr == 16'h5ea ? 16'hc800 :  // <0195> a = a+b
addr == 16'h5eb ? 16'h0300 :  // <0195> "
addr == 16'h5ec ? 16'h6600 :  // <0196> ram b = $ram_maf_flow_hi_res // av_ad_hi = 0
addr == 16'h5ed ? 16'h6a9a :  // <0196> ram b = $ram_maf_flow_hi_res // av_ad_lo = 154
addr == 16'h5ee ? 16'h0417 :  // <0196> ram b = $ram_maf_flow_hi_res // b = av_write_data // start read cycle
addr == 16'h5ef ? 16'h0418 :  // <0196> ram b = $ram_maf_flow_hi_res // b = av_read_data // finish read cycle
addr == 16'h5f0 ? 16'hc800 :  // <0197> nop
addr == 16'h5f1 ? 16'hc800 :  // <0198> nop
addr == 16'h5f2 ? 16'hc800 :  // <0199> nop
addr == 16'h5f3 ? 16'hc800 :  // <0200> nop
// gb = 32-bit product shifted >> 11.  lower 11 bits of product_hi are
// explicitly moved to upper 11 bits of gb.
addr == 16'h5f4 ? 16'h0010 :  // <0203> a = product_lo
addr == 16'h5f5 ? 16'h0411 :  // <0204> b = product_hi
addr == 16'h5f6 ? 16'h0353 :  // <0205> a = a>>4
addr == 16'h5f7 ? 16'h0353 :  // <0206> a = a>>4
addr == 16'h5f8 ? 16'h0350 :  // <0207> a = a>>1
addr == 16'h5f9 ? 16'h0350 :  // <0208> a = a>>1
addr == 16'h5fa ? 16'h1f50 :  // <0209> gb = a>>1
addr == 16'h5fb ? 16'h0001 :  // <0210> a = b
addr == 16'h5fc ? 16'h0352 :  // <0211> a = a<<4
addr == 16'h5fd ? 16'h0351 :  // <0212> a = a<<1
addr == 16'h5fe ? 16'h0407 :  // <0213> b = gb
addr == 16'h5ff ? 16'hc800 :  // <0214> gb = or
addr == 16'h600 ? 16'h1f34 :  // <0214> "

// clamp the (puff length jf) to sane range.
// max is the floating duty cycle.  7/8 of puff cycle, or 87.5%.
addr == 16'h601 ? 16'h6600 :  // <0218> ram a = $ram_ign_avg_jf // av_ad_hi = 0
addr == 16'h602 ? 16'h6a7a :  // <0218> ram a = $ram_ign_avg_jf // av_ad_lo = 122
addr == 16'h603 ? 16'h0017 :  // <0218> ram a = $ram_ign_avg_jf // a = av_write_data // start read cycle
addr == 16'h604 ? 16'h0018 :  // <0218> ram a = $ram_ign_avg_jf // a = av_read_data // finish read cycle
addr == 16'h605 ? 16'h0350 :  // <0219> a = a>>1
addr == 16'h606 ? 16'h0350 :  // <0220> a = a>>1
addr == 16'h607 ? 16'h0350 :  // <0221> a = a>>1
addr == 16'h608 ? 16'h0760 :  // <0222> b = 0xffff
addr == 16'h609 ? 16'hc800 :  // <0223> a = xor
addr == 16'h60a ? 16'h0338 :  // <0223> "
addr == 16'h60b ? 16'h6600 :  // <0224> ram b = $ram_ign_avg_jf // av_ad_hi = 0
addr == 16'h60c ? 16'h6a7a :  // <0224> ram b = $ram_ign_avg_jf // av_ad_lo = 122
addr == 16'h60d ? 16'h0417 :  // <0224> ram b = $ram_ign_avg_jf // b = av_write_data // start read cycle
addr == 16'h60e ? 16'h0418 :  // <0224> ram b = $ram_ign_avg_jf // b = av_read_data // finish read cycle
addr == 16'h60f ? 16'hc800 :  // <0225> x = a+b
addr == 16'h610 ? 16'h1300 :  // <0225> "

addr == 16'h611 ? 16'h0007 :  // <0228> a = gb
addr == 16'h612 ? 16'h0404 :  // <0228> b = x

addr == 16'h613 ? 16'he406 :  // <0226> bn gt :else_1555
addr == 16'h614 ? 16'h0616 :  // <0226> "

addr == 16'h615 ? 16'h1c04 :  // <0227> gb = x

// min is the safety amount to keep motor running and maybe prevent leaning damage.
//patch: don't know a proper minimum.

// shut off puff during closed throttle engine braking.
//patch: not implemented.

// memorize total puff.
addr == 16'h616 ? 16'h6600 :  // <0236> ram $ram_next_puff_len_us = ga // av_ad_hi = 0
addr == 16'h617 ? 16'h6a90 :  // <0236> ram $ram_next_puff_len_us = ga // av_ad_lo = 144
addr == 16'h618 ? 16'h5c06 :  // <0236> ram $ram_next_puff_len_us = ga // av_write_data = ga

// :abort // = 0x0619

addr == 16'h619 ? 16'hf80c :  // <0240> pop rtna // func puff_len_run
addr == 16'h61a ? 16'h1c0c :  // <0240> pop gb // "
addr == 16'h61b ? 16'h100c :  // <0240> pop x // "
addr == 16'h61c ? 16'hfc00 :  // <0240> swapra = nop

// ######## func leave_run // = 0x061d
addr == 16'h61d ? 16'h303e :  // <0243> push rtna // func leave_run

addr == 16'h61e ? 16'hfba0 :  // <0242> callx  check_engine_stop  pa
addr == 16'h61f ? 16'h0bd1 :  // <0242> "
addr == 16'h620 ? 16'hfc00 :  // <0242> "

addr == 16'h621 ? 16'hf80c :  // <0244> pop rtna // func leave_run
addr == 16'h622 ? 16'hfc00 :  // <0244> swapra = nop

// ######## func interpret_block_temp // = 0x0623
addr == 16'h623 ? 16'h3002 :  // <0262> push i // func interpret_block_temp
addr == 16'h624 ? 16'h3007 :  // <0262> push gb // "

// look up block temperature map trim factor.
addr == 16'h625 ? 16'h0202 :  // <0247> a = $anmux_engine_block_temp

addr == 16'h626 ? 16'h0351 :  // <0248> a = a<<1
addr == 16'h627 ? 16'h0616 :  // <0248> b = 22
addr == 16'h628 ? 16'h6600 :  // <0248> av_ad_hi = 0
addr == 16'h629 ? 16'h6b00 :  // <0248> av_ad_lo = ad0
addr == 16'h62a ? 16'h0417 :  // <0248> b = av_begin_read
addr == 16'h62b ? 16'h0418 :  // <0248> b = av_read_data

addr == 16'h62c ? 16'h1c01 :  // <0249> gb = b
addr == 16'h62d ? 16'h0a00 :  // <0260> i = 0
// :loop_1581 // = 0x062e

addr == 16'h62e ? 16'h0002 :  // <0250> a = i

addr == 16'h62f ? 16'h0351 :  // <0251> a = a<<1
addr == 16'h630 ? 16'h07a0 :  // <0251> b = 2592
addr == 16'h631 ? 16'h0a20 :  // <0251> "
addr == 16'h632 ? 16'h67a0 :  // <0251> av_ad_hi = 256
addr == 16'h633 ? 16'h0100 :  // <0251> "
addr == 16'h634 ? 16'h6b00 :  // <0251> av_ad_lo = ad0
addr == 16'h635 ? 16'h0417 :  // <0251> b = av_begin_read
addr == 16'h636 ? 16'h0418 :  // <0251> b = av_read_data


addr == 16'h637 ? 16'h0001 :  // <0258> a = b
addr == 16'h638 ? 16'h0407 :  // <0258> b = gb

addr == 16'h639 ? 16'he406 :  // <0252> bn gt :else_1593
addr == 16'h63a ? 16'h064c :  // <0252> "

addr == 16'h63b ? 16'h6600 :  // <0253> ram $ram_block_temp_map_idx = i // av_ad_hi = 0
addr == 16'h63c ? 16'h6aa0 :  // <0253> ram $ram_block_temp_map_idx = i // av_ad_lo = 160
addr == 16'h63d ? 16'h5c02 :  // <0253> ram $ram_block_temp_map_idx = i // av_write_data = i
addr == 16'h63e ? 16'h0002 :  // <0254> a = i

addr == 16'h63f ? 16'h0351 :  // <0255> a = a<<1
addr == 16'h640 ? 16'h07a0 :  // <0255> b = 2720
addr == 16'h641 ? 16'h0aa0 :  // <0255> "
addr == 16'h642 ? 16'h67a0 :  // <0255> av_ad_hi = 256
addr == 16'h643 ? 16'h0100 :  // <0255> "
addr == 16'h644 ? 16'h6b00 :  // <0255> av_ad_lo = ad0
addr == 16'h645 ? 16'h0417 :  // <0255> b = av_begin_read
addr == 16'h646 ? 16'h0418 :  // <0255> b = av_read_data

addr == 16'h647 ? 16'h6600 :  // <0256> ram $ram_block_temp_trim = b // av_ad_hi = 0
addr == 16'h648 ? 16'h6aa2 :  // <0256> ram $ram_block_temp_trim = b // av_ad_lo = 162
addr == 16'h649 ? 16'h5c01 :  // <0256> ram $ram_block_temp_trim = b // av_write_data = b
addr == 16'h64a ? 16'he00f :  // <0257> jmp :temp_done
addr == 16'h64b ? 16'h0654 :  // <0257> "



addr == 16'h64c ? 16'h0002 :  // <0260> a = i
addr == 16'h64d ? 16'h0601 :  // <0260> b = 1
addr == 16'h64e ? 16'hc800 :  // <0260> i = a+b
addr == 16'h64f ? 16'h0b00 :  // <0260> "


addr == 16'h650 ? 16'h0002 :  // <0260> a = i
addr == 16'h651 ? 16'h0640 :  // <0260> b = $block_temp_num_cells
addr == 16'h652 ? 16'he005 :  // <0260> br lt :loop_1581
addr == 16'h653 ? 16'h062e :  // <0260> "

// :end_1581 // = 0x0654
// :temp_done // = 0x0654

addr == 16'h654 ? 16'h1c0c :  // <0263> pop gb // func interpret_block_temp
addr == 16'h655 ? 16'h080c :  // <0263> pop i // "
addr == 16'h656 ? 16'hfc00 :  // <0263> swapra = nop

// ######## func interpret_puff_count // = 0x0657
addr == 16'h657 ? 16'h3002 :  // <0283> push i // func interpret_puff_count
addr == 16'h658 ? 16'h3003 :  // <0283> push j // "
addr == 16'h659 ? 16'h3007 :  // <0283> push gb // "

// look up afterstart trim factor.
addr == 16'h65a ? 16'h6600 :  // <0266> ram gb = $ram_puff_count // av_ad_hi = 0
addr == 16'h65b ? 16'h6a92 :  // <0266> ram gb = $ram_puff_count // av_ad_lo = 146
addr == 16'h65c ? 16'h1c17 :  // <0266> ram gb = $ram_puff_count // gb = av_write_data // start read cycle
addr == 16'h65d ? 16'h1c18 :  // <0266> ram gb = $ram_puff_count // gb = av_read_data // finish read cycle
addr == 16'h65e ? 16'h0a00 :  // <0278> i = 0
// :loop_1630 // = 0x065f

addr == 16'h65f ? 16'h0002 :  // <0267> a = i

addr == 16'h660 ? 16'h0351 :  // <0268> a = a<<1
addr == 16'h661 ? 16'h07a0 :  // <0268> b = 2848
addr == 16'h662 ? 16'h0b20 :  // <0268> "
addr == 16'h663 ? 16'h67a0 :  // <0268> av_ad_hi = 256
addr == 16'h664 ? 16'h0100 :  // <0268> "
addr == 16'h665 ? 16'h6b00 :  // <0268> av_ad_lo = ad0
addr == 16'h666 ? 16'h0417 :  // <0268> b = av_begin_read
addr == 16'h667 ? 16'h0418 :  // <0268> b = av_read_data


addr == 16'h668 ? 16'h0001 :  // <0276> a = b
addr == 16'h669 ? 16'h0407 :  // <0276> b = gb

addr == 16'h66a ? 16'he406 :  // <0269> bn gt :else_1642
addr == 16'h66b ? 16'h067f :  // <0269> "

addr == 16'h66c ? 16'h0f60 :  // <0270> j = -1
addr == 16'h66d ? 16'h6600 :  // <0271> ram $ram_afterstart_map_idx = i+j // av_ad_hi = 0
addr == 16'h66e ? 16'h6aa4 :  // <0271> ram $ram_afterstart_map_idx = i+j // av_ad_lo = 164
addr == 16'h66f ? 16'hc800 :  // <0271> ram $ram_afterstart_map_idx = i+j // av_write_data = i+j
addr == 16'h670 ? 16'h5f10 :  // <0271> "
addr == 16'h671 ? 16'h0002 :  // <0272> a = i

addr == 16'h672 ? 16'h0351 :  // <0273> a = a<<1
addr == 16'h673 ? 16'h07a0 :  // <0273> b = 2868
addr == 16'h674 ? 16'h0b34 :  // <0273> "
addr == 16'h675 ? 16'h67a0 :  // <0273> av_ad_hi = 256
addr == 16'h676 ? 16'h0100 :  // <0273> "
addr == 16'h677 ? 16'h6b00 :  // <0273> av_ad_lo = ad0
addr == 16'h678 ? 16'h0417 :  // <0273> b = av_begin_read
addr == 16'h679 ? 16'h0418 :  // <0273> b = av_read_data

addr == 16'h67a ? 16'h6600 :  // <0274> ram $ram_afterstart_trim = b // av_ad_hi = 0
addr == 16'h67b ? 16'h6aa6 :  // <0274> ram $ram_afterstart_trim = b // av_ad_lo = 166
addr == 16'h67c ? 16'h5c01 :  // <0274> ram $ram_afterstart_trim = b // av_write_data = b
addr == 16'h67d ? 16'he00f :  // <0275> jmp :done
addr == 16'h67e ? 16'h0693 :  // <0275> "



addr == 16'h67f ? 16'h0002 :  // <0278> a = i
addr == 16'h680 ? 16'h0601 :  // <0278> b = 1
addr == 16'h681 ? 16'hc800 :  // <0278> i = a+b
addr == 16'h682 ? 16'h0b00 :  // <0278> "


addr == 16'h683 ? 16'h0002 :  // <0278> a = i
addr == 16'h684 ? 16'h060a :  // <0278> b = $afterstart_num_cells
addr == 16'h685 ? 16'he005 :  // <0278> br lt :loop_1630
addr == 16'h686 ? 16'h065f :  // <0278> "

// :end_1630 // = 0x0687
addr == 16'h687 ? 16'h0209 :  // <0279> a = ($afterstart_num_cells - 1)

addr == 16'h688 ? 16'h0351 :  // <0280> a = a<<1
addr == 16'h689 ? 16'h07a0 :  // <0280> b = 2868
addr == 16'h68a ? 16'h0b34 :  // <0280> "
addr == 16'h68b ? 16'h67a0 :  // <0280> av_ad_hi = 256
addr == 16'h68c ? 16'h0100 :  // <0280> "
addr == 16'h68d ? 16'h6b00 :  // <0280> av_ad_lo = ad0
addr == 16'h68e ? 16'h0417 :  // <0280> b = av_begin_read
addr == 16'h68f ? 16'h0418 :  // <0280> b = av_read_data

addr == 16'h690 ? 16'h6600 :  // <0281> ram $ram_afterstart_trim = b // av_ad_hi = 0
addr == 16'h691 ? 16'h6aa6 :  // <0281> ram $ram_afterstart_trim = b // av_ad_lo = 166
addr == 16'h692 ? 16'h5c01 :  // <0281> ram $ram_afterstart_trim = b // av_write_data = b
// :done // = 0x0693

addr == 16'h693 ? 16'h1c0c :  // <0284> pop gb // func interpret_puff_count
addr == 16'h694 ? 16'h0c0c :  // <0284> pop j // "
addr == 16'h695 ? 16'h080c :  // <0284> pop i // "
addr == 16'h696 ? 16'hfc00 :  // <0284> swapra = nop

// ######## func dump_afrc_cmd // = 0x0697
addr == 16'h697 ? 16'h3002 :  // <0308> push i // func dump_afrc_cmd
addr == 16'h698 ? 16'h3004 :  // <0308> push x // "
addr == 16'h699 ? 16'h3006 :  // <0308> push ga // "
addr == 16'h69a ? 16'h3007 :  // <0308> push gb // "
addr == 16'h69b ? 16'h303e :  // <0308> push rtna // "

addr == 16'h69c ? 16'h020d :  // <0286> a = 13 // puteol
addr == 16'h69d ? 16'hfba0 :  // <0286> puteol
addr == 16'h69e ? 16'h00ab :  // <0286> "
addr == 16'h69f ? 16'hfc00 :  // <0286> "
addr == 16'h6a0 ? 16'h020a :  // <0286> a = 10 // puteol
addr == 16'h6a1 ? 16'hfba0 :  // <0286> puteol
addr == 16'h6a2 ? 16'h00ab :  // <0286> "
addr == 16'h6a3 ? 16'hfc00 :  // <0286> "
addr == 16'h6a4 ? 16'h6600 :  // <0287> ram ga = $ram_afrc_maf_row_idx // av_ad_hi = 0
addr == 16'h6a5 ? 16'h6a9c :  // <0287> ram ga = $ram_afrc_maf_row_idx // av_ad_lo = 156
addr == 16'h6a6 ? 16'h1817 :  // <0287> ram ga = $ram_afrc_maf_row_idx // ga = av_write_data // start read cycle
addr == 16'h6a7 ? 16'h1818 :  // <0287> ram ga = $ram_afrc_maf_row_idx // ga = av_read_data // finish read cycle
addr == 16'h6a8 ? 16'h6600 :  // <0288> ram gb = $ram_afrc_rpm_col_idx // av_ad_hi = 0
addr == 16'h6a9 ? 16'h6a9e :  // <0288> ram gb = $ram_afrc_rpm_col_idx // av_ad_lo = 158
addr == 16'h6aa ? 16'h1c17 :  // <0288> ram gb = $ram_afrc_rpm_col_idx // gb = av_write_data // start read cycle
addr == 16'h6ab ? 16'h1c18 :  // <0288> ram gb = $ram_afrc_rpm_col_idx // gb = av_read_data // finish read cycle
addr == 16'h6ac ? 16'h67a0 :  // <0289> av_ad_hi = ([ram_join $ram_afrc_map] >> 16)
addr == 16'h6ad ? 16'h0100 :  // <0289> "
addr == 16'h6ae ? 16'h6a00 :  // <0290> av_ad_lo = ([ram_join $ram_afrc_map] & 0xffff)
addr == 16'h6af ? 16'h0a00 :  // <0307> i = 0
// :loop_1711 // = 0x06b0

addr == 16'h6b0 ? 16'h1200 :  // <0304> x = 0
// :loop_1712 // = 0x06b1

addr == 16'h6b1 ? 16'h0017 :  // <0291> a = av_begin_read
addr == 16'h6b2 ? 16'h0018 :  // <0292> a = av_read_data
addr == 16'h6b3 ? 16'hfba0 :  // <0293> call put4x
addr == 16'h6b4 ? 16'h00d3 :  // <0293> "
addr == 16'h6b5 ? 16'hfc00 :  // <0293> "

addr == 16'h6b6 ? 16'h0004 :  // <0298> a = x
addr == 16'h6b7 ? 16'h0407 :  // <0298> b = gb

addr == 16'h6b8 ? 16'he407 :  // <0294> bn eq :else_1720
addr == 16'h6b9 ? 16'h06c0 :  // <0294> "

addr == 16'h6ba ? 16'h023c :  // <0295> a = 60 // putasc "<"
addr == 16'h6bb ? 16'hfba0 :  // <0295> putasc "<"
addr == 16'h6bc ? 16'h00ab :  // <0295> "
addr == 16'h6bd ? 16'hfc00 :  // <0295> "

addr == 16'h6be ? 16'he00f :  // <0297> jmp :end_1720
addr == 16'h6bf ? 16'h06c4 :  // <0297> "

addr == 16'h6c0 ? 16'h0220 :  // <0298> a = 32 // putasc " "
addr == 16'h6c1 ? 16'hfba0 :  // <0298> putasc " "
addr == 16'h6c2 ? 16'h00ab :  // <0298> "
addr == 16'h6c3 ? 16'hfc00 :  // <0298> "

addr == 16'h6c4 ? 16'h0220 :  // <0299> a = 32 // putasc " "
addr == 16'h6c5 ? 16'hfba0 :  // <0299> putasc " "
addr == 16'h6c6 ? 16'h00ab :  // <0299> "
addr == 16'h6c7 ? 16'hfc00 :  // <0299> "
addr == 16'h6c8 ? 16'h001a :  // <0300> a = av_ad_lo
addr == 16'h6c9 ? 16'h0602 :  // <0301> b = 2
addr == 16'h6ca ? 16'hc800 :  // <0302> av_ad_lo = a+b
addr == 16'h6cb ? 16'h6b00 :  // <0302> "


addr == 16'h6cc ? 16'h0004 :  // <0304> a = x
addr == 16'h6cd ? 16'h0601 :  // <0304> b = 1
addr == 16'h6ce ? 16'hc800 :  // <0304> x = a+b
addr == 16'h6cf ? 16'h1300 :  // <0304> "


addr == 16'h6d0 ? 16'h0004 :  // <0304> a = x
addr == 16'h6d1 ? 16'h0610 :  // <0304> b = $afrc_rpm_cols
addr == 16'h6d2 ? 16'he005 :  // <0304> br lt :loop_1712
addr == 16'h6d3 ? 16'h06b1 :  // <0304> "

// :end_1712 // = 0x06d4
addr == 16'h6d4 ? 16'h020d :  // <0305> a = 13 // puteol
addr == 16'h6d5 ? 16'hfba0 :  // <0305> puteol
addr == 16'h6d6 ? 16'h00ab :  // <0305> "
addr == 16'h6d7 ? 16'hfc00 :  // <0305> "
addr == 16'h6d8 ? 16'h020a :  // <0305> a = 10 // puteol
addr == 16'h6d9 ? 16'hfba0 :  // <0305> puteol
addr == 16'h6da ? 16'h00ab :  // <0305> "
addr == 16'h6db ? 16'hfc00 :  // <0305> "


addr == 16'h6dc ? 16'h0002 :  // <0307> a = i
addr == 16'h6dd ? 16'h0601 :  // <0307> b = 1
addr == 16'h6de ? 16'hc800 :  // <0307> i = a+b
addr == 16'h6df ? 16'h0b00 :  // <0307> "


addr == 16'h6e0 ? 16'h0002 :  // <0307> a = i
addr == 16'h6e1 ? 16'h0640 :  // <0307> b = $afrc_maf_rows
addr == 16'h6e2 ? 16'he005 :  // <0307> br lt :loop_1711
addr == 16'h6e3 ? 16'h06b0 :  // <0307> "

// :end_1711 // = 0x06e4

addr == 16'h6e4 ? 16'hf80c :  // <0309> pop rtna // func dump_afrc_cmd
addr == 16'h6e5 ? 16'h1c0c :  // <0309> pop gb // "
addr == 16'h6e6 ? 16'h180c :  // <0309> pop ga // "
addr == 16'h6e7 ? 16'h100c :  // <0309> pop x // "
addr == 16'h6e8 ? 16'h080c :  // <0309> pop i // "
addr == 16'h6e9 ? 16'hfc00 :  // <0309> swapra = nop



// #########################################################################
// :main // = 0x06ea
addr == 16'h6ea ? 16'h03a0 :  // <0224> a = :boot_msg
addr == 16'h6eb ? 16'h009b :  // <0224> "
addr == 16'h6ec ? 16'hfba0 :  // <0225> call :print_nt
addr == 16'h6ed ? 16'h015f :  // <0225> "
addr == 16'h6ee ? 16'hfc00 :  // <0225> "

// clear the first 64k of RAM.
addr == 16'h6ef ? 16'h6600 :  // <0228> av_ad_hi = 0
addr == 16'h6f0 ? 16'hfba0 :  // <0228> callx  clear_ram_page  0
addr == 16'h6f1 ? 16'h0abd :  // <0228> "
addr == 16'h6f2 ? 16'hfc00 :  // <0228> "

addr == 16'h6f3 ? 16'hfba0 :  // <0230> callx  init_drom
addr == 16'h6f4 ? 16'h0266 :  // <0230> "
addr == 16'h6f5 ? 16'hfc00 :  // <0230> "

// init fuel injection.
addr == 16'h6f6 ? 16'hfba0 :  // <0233> callx  init_plan_stop
addr == 16'h6f7 ? 16'h0437 :  // <0233> "
addr == 16'h6f8 ? 16'hfc00 :  // <0233> "

// power up FTDI USB board, and init any other special board control functions.
addr == 16'h6f9 ? 16'h8280 :  // <0236> board_ctrl = $ftdi_power_mask
addr == 16'h6fa ? 16'hfba0 :  // <0237> callx postpone_comm_restart
addr == 16'h6fb ? 16'h0a94 :  // <0237> "
addr == 16'h6fc ? 16'hfc00 :  // <0237> "

// check initial state of power management circuits.
// if power is lost or ignition switch is off already, open relay & abort run.
// that's important because then the event controller booted up too late to
// see edges on those 2 signals.  regular system would never shut itself down.
// this setup is the last thing done prior to the event handler loop.
addr == 16'h6fd ? 16'h8a00 :  // <0244> power_duty = $power_duty_closing

addr == 16'h6fe ? 16'h0022 :  // <0248> a = power_duty
addr == 16'h6ff ? 16'h06c0 :  // <0248> b = ( $power_lost_mask | $ign_switch_off_mask )

addr == 16'h700 ? 16'he003 :  // <0245> br and0z :else_1792
addr == 16'h701 ? 16'h0707 :  // <0245> "

addr == 16'h702 ? 16'h8a32 :  // <0246> power_duty = $power_duty_opening
addr == 16'h703 ? 16'h7fa0 :  // <0247> error_halt_code $err_power_lost_at_boot // leds = 0xfffb
addr == 16'h704 ? 16'hfffb :  // <0247> "
addr == 16'h705 ? 16'he00f :  // <0247> error_halt_code $err_power_lost_at_boot
addr == 16'h706 ? 16'h0705 :  // <0247> "

addr == 16'h707 ? 16'h6600 :  // <0249> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h708 ? 16'h6a3c :  // <0249> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 60
addr == 16'h709 ? 16'h5f60 :  // <0249> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h70a ? 16'h6600 :  // <0250> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_hi = 0
addr == 16'h70b ? 16'h6a3e :  // <0250> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_lo = 62
addr == 16'h70c ? 16'h5e02 :  // <0250> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_write_data = 2

// start handling events.
addr == 16'h70d ? 16'h3ba0 :  // <0253> soft_event = $event_controller_reset_mask
addr == 16'h70e ? 16'h8000 :  // <0253> "
addr == 16'h70f ? 16'h3a00 :  // <0254> soft_event = 0
addr == 16'h710 ? 16'h4fa0 :  // <0255> mstimer0 = 1000
addr == 16'h711 ? 16'h03e8 :  // <0255> "
addr == 16'h712 ? 16'h5614 :  // <0256> mstimer2 = $plan_tick_ms
addr == 16'h713 ? 16'he00f :  // <0257> jmp :poll_events
addr == 16'h714 ? 16'h009e :  // <0257> "

// event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.
// event 0 not used in this app anyway.
// :event_table // = 0x0715
addr == 16'h715 ? 16'h009e :  // <0262> ([label :poll_events])
addr == 16'h716 ? 16'h09ef :  // <0263> ([label :power_lost_handler])
addr == 16'h717 ? 16'h072a :  // <0264> ([label :ign_capture_handler])
addr == 16'h718 ? 16'h07cc :  // <0265> ([label :ign_capture_timeout_handler])
addr == 16'h719 ? 16'h0a23 :  // <0266> ([label :puff1_done_handler])
addr == 16'h71a ? 16'h07d1 :  // <0267> ([label :ustimer0_handler])
addr == 16'h71b ? 16'h096a :  // <0268> ([label :spi_done_handler])
addr == 16'h71c ? 16'h07d3 :  // <0269> ([label :mstimer0_handler])
addr == 16'h71d ? 16'h0936 :  // <0270> ([label :mstimer1_handler])
addr == 16'h71e ? 16'h0802 :  // <0271> ([label :mstimer2_handler])
addr == 16'h71f ? 16'h082e :  // <0272> ([label :uart_rx_handler])
addr == 16'h720 ? 16'h0847 :  // <0273> ([label :uart_rx_overflow_handler])
addr == 16'h721 ? 16'h084f :  // <0274> ([label :uart_tx_overflow_handler])
addr == 16'h722 ? 16'h0856 :  // <0275> ([label :key0_handler])
addr == 16'h723 ? 16'h0860 :  // <0276> ([label :key1_handler])
addr == 16'h724 ? 16'h0a06 :  // <0277> ([label :ign_switch_off_handler])
addr == 16'h725 ? 16'h0a19 :  // <0278> ([label :ign_switch_on_handler])
addr == 16'h726 ? 16'h086a :  // <0279> ([label :softevent3_handler])
addr == 16'h727 ? 16'h086c :  // <0280> ([label :softevent2_handler])
addr == 16'h728 ? 16'h086e :  // <0281> ([label :softevent1_handler])
addr == 16'h729 ? 16'h0870 :  // <0282> ([label :softevent0_handler])

// #########################################################################

// ######## event ign_capture_handler // = 0x072a
// discard outlier time.
addr == 16'h72a ? 16'h1823 :  // <0288> g6 = ign_capture_jf
addr == 16'h72b ? 16'h6600 :  // <0289> ram b = $ram_ign_fastest_jf // av_ad_hi = 0
addr == 16'h72c ? 16'h6a82 :  // <0289> ram b = $ram_ign_fastest_jf // av_ad_lo = 130
addr == 16'h72d ? 16'h0417 :  // <0289> ram b = $ram_ign_fastest_jf // b = av_write_data // start read cycle
addr == 16'h72e ? 16'h0418 :  // <0289> ram b = $ram_ign_fastest_jf // b = av_read_data // finish read cycle

addr == 16'h72f ? 16'h0006 :  // <0292> a = g6
addr == 16'h730 ? 16'h0401 :  // <0292> b = b

addr == 16'h731 ? 16'he405 :  // <0290> bn lt :else_1841
addr == 16'h732 ? 16'h0734 :  // <0290> "

addr == 16'h733 ? 16'h1a00 :  // <0291> g6 = 0

addr == 16'h734 ? 16'h6600 :  // <0293> ram b = $ram_ign_slowest_jf // av_ad_hi = 0
addr == 16'h735 ? 16'h6a84 :  // <0293> ram b = $ram_ign_slowest_jf // av_ad_lo = 132
addr == 16'h736 ? 16'h0417 :  // <0293> ram b = $ram_ign_slowest_jf // b = av_write_data // start read cycle
addr == 16'h737 ? 16'h0418 :  // <0293> ram b = $ram_ign_slowest_jf // b = av_read_data // finish read cycle

addr == 16'h738 ? 16'h0006 :  // <0296> a = g6
addr == 16'h739 ? 16'h0401 :  // <0296> b = b

addr == 16'h73a ? 16'he406 :  // <0294> bn gt :else_1850
addr == 16'h73b ? 16'h073d :  // <0294> "

addr == 16'h73c ? 16'h1a00 :  // <0295> g6 = 0


// increment buffer index and memorize time.
addr == 16'h73d ? 16'h6600 :  // <0299> ram a = $ram_ign_history_idx // av_ad_hi = 0
addr == 16'h73e ? 16'h6a58 :  // <0299> ram a = $ram_ign_history_idx // av_ad_lo = 88
addr == 16'h73f ? 16'h0017 :  // <0299> ram a = $ram_ign_history_idx // a = av_write_data // start read cycle
addr == 16'h740 ? 16'h0018 :  // <0299> ram a = $ram_ign_history_idx // a = av_read_data // finish read cycle
addr == 16'h741 ? 16'h0601 :  // <0300> b = 1
addr == 16'h742 ? 16'hc800 :  // <0301> a = a+b
addr == 16'h743 ? 16'h0300 :  // <0301> "
addr == 16'h744 ? 16'h060f :  // <0302> b = $ign_history_idx_mask
addr == 16'h745 ? 16'hc800 :  // <0303> a = and
addr == 16'h746 ? 16'h0330 :  // <0303> "
addr == 16'h747 ? 16'h6600 :  // <0304> ram $ram_ign_history_idx = a // av_ad_hi = 0
addr == 16'h748 ? 16'h6a58 :  // <0304> ram $ram_ign_history_idx = a // av_ad_lo = 88
addr == 16'h749 ? 16'h5c00 :  // <0304> ram $ram_ign_history_idx = a // av_write_data = a
addr == 16'h74a ? 16'h0406 :  // <0305> b = g6

addr == 16'h74b ? 16'h0351 :  // <0306> a = a<<1
addr == 16'h74c ? 16'h3001 :  // <0306> push b // push b
addr == 16'h74d ? 16'h065a :  // <0306> b = 90
addr == 16'h74e ? 16'h6600 :  // <0306> av_ad_hi = 0
addr == 16'h74f ? 16'h6b00 :  // <0306> av_ad_lo = ad0
addr == 16'h750 ? 16'h5c0c :  // <0306> pop av_write_data // pop av_write_data


// ////////// compute new jiffy estimate.
// average entire history.
// x = total, y = sample, i = index = loop count, g6 = count of invalid samples.
addr == 16'h751 ? 16'h1200 :  // <0311> x = 0
addr == 16'h752 ? 16'h1a00 :  // <0312> g6 = 0
addr == 16'h753 ? 16'h0a00 :  // <0328> i = 0
// :loop_1875 // = 0x0754

addr == 16'h754 ? 16'h0002 :  // <0313> a = i

addr == 16'h755 ? 16'h0351 :  // <0314> a = a<<1
addr == 16'h756 ? 16'h065a :  // <0314> b = 90
addr == 16'h757 ? 16'h6600 :  // <0314> av_ad_hi = 0
addr == 16'h758 ? 16'h6b00 :  // <0314> av_ad_lo = ad0
addr == 16'h759 ? 16'h0417 :  // <0314> b = av_begin_read
addr == 16'h75a ? 16'h0418 :  // <0314> b = av_read_data

addr == 16'h75b ? 16'h1401 :  // <0315> y = b

addr == 16'h75c ? 16'h0005 :  // <0326> a = y
addr == 16'h75d ? 16'h0600 :  // <0326> b = 0

addr == 16'h75e ? 16'he407 :  // <0316> bn eq :else_1886
addr == 16'h75f ? 16'h0766 :  // <0316> "

addr == 16'h760 ? 16'h0006 :  // <0317> a = g6
addr == 16'h761 ? 16'h0601 :  // <0318> b = 1
addr == 16'h762 ? 16'hc800 :  // <0319> g6 = a+b
addr == 16'h763 ? 16'h1b00 :  // <0319> "

addr == 16'h764 ? 16'he00f :  // <0321> jmp :end_1886
addr == 16'h765 ? 16'h076d :  // <0321> "

addr == 16'h766 ? 16'h0208 :  // <0322> a = ($ign_history_len / 2)
addr == 16'h767 ? 16'h0405 :  // <0323> b = y
addr == 16'h768 ? 16'hc800 :  // <0324> a = a+b
addr == 16'h769 ? 16'h0300 :  // <0324> "
addr == 16'h76a ? 16'h1753 :  // <0325> y = a>>$ign_history_idx_bits
addr == 16'h76b ? 16'hc800 :  // <0326> x = x+y
addr == 16'h76c ? 16'h1320 :  // <0326> "



addr == 16'h76d ? 16'h0002 :  // <0328> a = i
addr == 16'h76e ? 16'h0601 :  // <0328> b = 1
addr == 16'h76f ? 16'hc800 :  // <0328> i = a+b
addr == 16'h770 ? 16'h0b00 :  // <0328> "


addr == 16'h771 ? 16'h0002 :  // <0328> a = i
addr == 16'h772 ? 16'h0610 :  // <0328> b = $ign_history_len
addr == 16'h773 ? 16'he005 :  // <0328> br lt :loop_1875
addr == 16'h774 ? 16'h0754 :  // <0328> "

// :end_1875 // = 0x0775
addr == 16'h775 ? 16'h6600 :  // <0329> ram $ram_ign_avg_jf = x // av_ad_hi = 0
addr == 16'h776 ? 16'h6a7a :  // <0329> ram $ram_ign_avg_jf = x // av_ad_lo = 122
addr == 16'h777 ? 16'h5c04 :  // <0329> ram $ram_ign_avg_jf = x // av_write_data = x
addr == 16'h778 ? 16'h6600 :  // <0330> ram $ram_ign_bad_samples = g6 // av_ad_hi = 0
addr == 16'h779 ? 16'h6a80 :  // <0330> ram $ram_ign_bad_samples = g6 // av_ad_lo = 128
addr == 16'h77a ? 16'h5c06 :  // <0330> ram $ram_ign_bad_samples = g6 // av_write_data = g6
//patch: dividing before summing (instead of after) is much simpler and faster because it prevents overflow.
// but it means we could be reading as much as 16 jf too low (16 = ign_history_len).
// that error is way less than 1 RPM on the slow end,
// or about 1,000 RPM too fast on the fast end!
// might need to tighten that up.  one simple way might be adding ign_history_len / 2 to each history record prior to dividing.
// that didn't seem to help much in simple testing.
// probly because jf_to_rpm has only 32 RPM resolution.


addr == 16'h77b ? 16'h0006 :  // <0359> a = g6
addr == 16'h77c ? 16'h0604 :  // <0359> b = ( $ign_history_len / 4 )

addr == 16'h77d ? 16'he406 :  // <0339> bn gt :else_1917
addr == 16'h77e ? 16'h0784 :  // <0339> "

addr == 16'h77f ? 16'h6600 :  // <0340> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h780 ? 16'h6a7e :  // <0340> ram $ram_rpm_valid = 0 // av_ad_lo = 126
addr == 16'h781 ? 16'h5e00 :  // <0340> ram $ram_rpm_valid = 0 // av_write_data = 0

addr == 16'h782 ? 16'he00f :  // <0342> jmp :end_1917
addr == 16'h783 ? 16'h07b0 :  // <0342> "

// convert jiffies b to new RPM estimate.
addr == 16'h784 ? 16'h2004 :  // <0344> pa = x
addr == 16'h785 ? 16'hfba0 :  // <0344> callx  jf_to_rpm  x  pa
addr == 16'h786 ? 16'h0bc5 :  // <0344> "
addr == 16'h787 ? 16'hfc00 :  // <0344> "
addr == 16'h788 ? 16'h6600 :  // <0345> ram $ram_avg_rpm = pa // av_ad_hi = 0
addr == 16'h789 ? 16'h6a7c :  // <0345> ram $ram_avg_rpm = pa // av_ad_lo = 124
addr == 16'h78a ? 16'h5c08 :  // <0345> ram $ram_avg_rpm = pa // av_write_data = pa
addr == 16'h78b ? 16'h6600 :  // <0346> ram $ram_rpm_valid = 1 // av_ad_hi = 0
addr == 16'h78c ? 16'h6a7e :  // <0346> ram $ram_rpm_valid = 1 // av_ad_lo = 126
addr == 16'h78d ? 16'h5e01 :  // <0346> ram $ram_rpm_valid = 1 // av_write_data = 1

// find RPM column in AFRC map.
addr == 16'h78e ? 16'h6600 :  // <0349> ram gb = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h78f ? 16'h6a7c :  // <0349> ram gb = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h790 ? 16'h1c17 :  // <0349> ram gb = $ram_avg_rpm // gb = av_write_data // start read cycle
addr == 16'h791 ? 16'h1c18 :  // <0349> ram gb = $ram_avg_rpm // gb = av_read_data // finish read cycle
addr == 16'h792 ? 16'h0a00 :  // <0357> i = 0
// :loop_1938 // = 0x0793

addr == 16'h793 ? 16'h0002 :  // <0350> a = i

addr == 16'h794 ? 16'h0351 :  // <0351> a = a<<1
addr == 16'h795 ? 16'h07a0 :  // <0351> b = 2560
addr == 16'h796 ? 16'h0a00 :  // <0351> "
addr == 16'h797 ? 16'h67a0 :  // <0351> av_ad_hi = 256
addr == 16'h798 ? 16'h0100 :  // <0351> "
addr == 16'h799 ? 16'h6b00 :  // <0351> av_ad_lo = ad0
addr == 16'h79a ? 16'h0417 :  // <0351> b = av_begin_read
addr == 16'h79b ? 16'h0418 :  // <0351> b = av_read_data


addr == 16'h79c ? 16'h0001 :  // <0355> a = b
addr == 16'h79d ? 16'h0407 :  // <0355> b = gb

addr == 16'h79e ? 16'he406 :  // <0352> bn gt :else_1950
addr == 16'h79f ? 16'h07a5 :  // <0352> "

addr == 16'h7a0 ? 16'h6600 :  // <0353> ram $ram_afrc_rpm_col_idx = i // av_ad_hi = 0
addr == 16'h7a1 ? 16'h6a9e :  // <0353> ram $ram_afrc_rpm_col_idx = i // av_ad_lo = 158
addr == 16'h7a2 ? 16'h5c02 :  // <0353> ram $ram_afrc_rpm_col_idx = i // av_write_data = i
addr == 16'h7a3 ? 16'he00f :  // <0354> jmp :rpm_found
addr == 16'h7a4 ? 16'h07b0 :  // <0354> "



addr == 16'h7a5 ? 16'h0002 :  // <0357> a = i
addr == 16'h7a6 ? 16'h0601 :  // <0357> b = 1
addr == 16'h7a7 ? 16'hc800 :  // <0357> i = a+b
addr == 16'h7a8 ? 16'h0b00 :  // <0357> "


addr == 16'h7a9 ? 16'h0002 :  // <0357> a = i
addr == 16'h7aa ? 16'h0610 :  // <0357> b = $rpm_ref_num_cells
addr == 16'h7ab ? 16'he005 :  // <0357> br lt :loop_1938
addr == 16'h7ac ? 16'h0793 :  // <0357> "

// :end_1938 // = 0x07ad
addr == 16'h7ad ? 16'h6600 :  // <0358> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h7ae ? 16'h6a7e :  // <0358> ram $ram_rpm_valid = 0 // av_ad_lo = 126
addr == 16'h7af ? 16'h5e00 :  // <0358> ram $ram_rpm_valid = 0 // av_write_data = 0
// :rpm_found // = 0x07b0

addr == 16'h7b0 ? 16'he00f :  // <0360> end_event
addr == 16'h7b1 ? 16'h009e :  // <0360> "

// ######## func clear_ign_history // = 0x07b2
addr == 16'h7b2 ? 16'h3002 :  // <0373> push i // func clear_ign_history

// invalidate the RPM estimate.
addr == 16'h7b3 ? 16'h6600 :  // <0364> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h7b4 ? 16'h6a7e :  // <0364> ram $ram_rpm_valid = 0 // av_ad_lo = 126
addr == 16'h7b5 ? 16'h5e00 :  // <0364> ram $ram_rpm_valid = 0 // av_write_data = 0
// the last known RPM estimate is retained here, not cleared.
// clear the history so it won't be valid again until several more valid samples are collected.
addr == 16'h7b6 ? 16'h6600 :  // <0367> ram $ram_ign_bad_samples = $ign_history_len // av_ad_hi = 0
addr == 16'h7b7 ? 16'h6a80 :  // <0367> ram $ram_ign_bad_samples = $ign_history_len // av_ad_lo = 128
addr == 16'h7b8 ? 16'h5e10 :  // <0367> ram $ram_ign_bad_samples = $ign_history_len // av_write_data = 16
addr == 16'h7b9 ? 16'h0a00 :  // <0372> i = 0
// :loop_1977 // = 0x07ba

addr == 16'h7ba ? 16'h0002 :  // <0368> a = i
addr == 16'h7bb ? 16'h0600 :  // <0369> b = 0

addr == 16'h7bc ? 16'h0351 :  // <0370> a = a<<1
addr == 16'h7bd ? 16'h3001 :  // <0370> push b // push b
addr == 16'h7be ? 16'h065a :  // <0370> b = 90
addr == 16'h7bf ? 16'h6600 :  // <0370> av_ad_hi = 0
addr == 16'h7c0 ? 16'h6b00 :  // <0370> av_ad_lo = ad0
addr == 16'h7c1 ? 16'h5c0c :  // <0370> pop av_write_data // pop av_write_data



addr == 16'h7c2 ? 16'h0002 :  // <0372> a = i
addr == 16'h7c3 ? 16'h0601 :  // <0372> b = 1
addr == 16'h7c4 ? 16'hc800 :  // <0372> i = a+b
addr == 16'h7c5 ? 16'h0b00 :  // <0372> "


addr == 16'h7c6 ? 16'h0002 :  // <0372> a = i
addr == 16'h7c7 ? 16'h0610 :  // <0372> b = $ign_history_len
addr == 16'h7c8 ? 16'he005 :  // <0372> br lt :loop_1977
addr == 16'h7c9 ? 16'h07ba :  // <0372> "

// :end_1977 // = 0x07ca

addr == 16'h7ca ? 16'h080c :  // <0374> pop i // func clear_ign_history
addr == 16'h7cb ? 16'hfc00 :  // <0374> swapra = nop

// ######## event ign_capture_timeout_handler // = 0x07cc
// it's been too long since the last ignition pulse detect.
addr == 16'h7cc ? 16'hfba0 :  // <0377> callx clear_ign_history
addr == 16'h7cd ? 16'h07b2 :  // <0377> "
addr == 16'h7ce ? 16'hfc00 :  // <0377> "
addr == 16'h7cf ? 16'he00f :  // <0378> end_event
addr == 16'h7d0 ? 16'h009e :  // <0378> "

// ######## event ustimer0_handler // = 0x07d1
addr == 16'h7d1 ? 16'he00f :  // <0381> end_event
addr == 16'h7d2 ? 16'h009e :  // <0381> "

// ######## event mstimer0_handler // = 0x07d3
// unified 1-second periodic timer for all low-resolution tasks.

// start timer again.
addr == 16'h7d3 ? 16'h4fa0 :  // <0387> mstimer0 = 1000
addr == 16'h7d4 ? 16'h03e8 :  // <0387> "

// realtime counters in RAM.
addr == 16'h7d5 ? 16'h6600 :  // <0390> ram a = $ram_seconds_cnt // av_ad_hi = 0
addr == 16'h7d6 ? 16'h6a42 :  // <0390> ram a = $ram_seconds_cnt // av_ad_lo = 66
addr == 16'h7d7 ? 16'h0017 :  // <0390> ram a = $ram_seconds_cnt // a = av_write_data // start read cycle
addr == 16'h7d8 ? 16'h0018 :  // <0390> ram a = $ram_seconds_cnt // a = av_read_data // finish read cycle
addr == 16'h7d9 ? 16'h0601 :  // <0391> b = 1
addr == 16'h7da ? 16'hc800 :  // <0392> a = a+b
addr == 16'h7db ? 16'h0300 :  // <0392> "

addr == 16'h7dc ? 16'h0000 :  // <0401> a = a
addr == 16'h7dd ? 16'h063c :  // <0401> b = 60

addr == 16'h7de ? 16'he407 :  // <0393> bn eq :else_2014
addr == 16'h7df ? 16'h07f1 :  // <0393> "

addr == 16'h7e0 ? 16'h6600 :  // <0394> ram $ram_seconds_cnt = 0 // av_ad_hi = 0
addr == 16'h7e1 ? 16'h6a42 :  // <0394> ram $ram_seconds_cnt = 0 // av_ad_lo = 66
addr == 16'h7e2 ? 16'h5e00 :  // <0394> ram $ram_seconds_cnt = 0 // av_write_data = 0
addr == 16'h7e3 ? 16'h6600 :  // <0395> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h7e4 ? 16'h6a40 :  // <0395> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'h7e5 ? 16'h0017 :  // <0395> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h7e6 ? 16'h0018 :  // <0395> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h7e7 ? 16'h0601 :  // <0396> b = 1
addr == 16'h7e8 ? 16'h6600 :  // <0397> ram $ram_minutes_cnt = a+b // av_ad_hi = 0
addr == 16'h7e9 ? 16'h6a40 :  // <0397> ram $ram_minutes_cnt = a+b // av_ad_lo = 64
addr == 16'h7ea ? 16'hc800 :  // <0397> ram $ram_minutes_cnt = a+b // av_write_data = a+b
addr == 16'h7eb ? 16'h5f00 :  // <0397> "
addr == 16'h7ec ? 16'hfba0 :  // <0398> callx minute_events
addr == 16'h7ed ? 16'h0a32 :  // <0398> "
addr == 16'h7ee ? 16'hfc00 :  // <0398> "

addr == 16'h7ef ? 16'he00f :  // <0400> jmp :end_2014
addr == 16'h7f0 ? 16'h07f4 :  // <0400> "

addr == 16'h7f1 ? 16'h6600 :  // <0401> ram $ram_seconds_cnt = a // av_ad_hi = 0
addr == 16'h7f2 ? 16'h6a42 :  // <0401> ram $ram_seconds_cnt = a // av_ad_lo = 66
addr == 16'h7f3 ? 16'h5c00 :  // <0401> ram $ram_seconds_cnt = a // av_write_data = a


// all 1-second functions here.
addr == 16'h7f4 ? 16'hfba0 :  // <0404> callx check_power_relay
addr == 16'h7f5 ? 16'h0a3a :  // <0404> "
addr == 16'h7f6 ? 16'hfc00 :  // <0404> "
addr == 16'h7f7 ? 16'hfba0 :  // <0405> callx check_communication
addr == 16'h7f8 ? 16'h0a67 :  // <0405> "
addr == 16'h7f9 ? 16'hfc00 :  // <0405> "
addr == 16'h7fa ? 16'hfba0 :  // <0406> callx start_daq_pass
addr == 16'h7fb ? 16'h088b :  // <0406> "
addr == 16'h7fc ? 16'hfc00 :  // <0406> "
addr == 16'h7fd ? 16'he00f :  // <0407> end_event
addr == 16'h7fe ? 16'h009e :  // <0407> "

// :plan_transition_msg // = 0x07ff
// "PLAN\x0"
addr == 16'h7ff ? 16'h4c50 :  // <0410> LP
addr == 16'h800 ? 16'h4e41 :  // <0410> NA
addr == 16'h801 ? 16'h0000 :  // <0410>   

// ######## event mstimer2_handler // = 0x0802
// engine management plan tick timer.

// restart timer.
addr == 16'h802 ? 16'h5614 :  // <0416> mstimer2 = $plan_tick_ms

// start another TPS reading prior to every plan tick.
// this will also invoke a o2 reading.  that's done last of all prior to plan_tick,
// so there's minimal latency between that and the plan_tick utilizing it.
addr == 16'h803 ? 16'h6600 :  // <0421> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h804 ? 16'h6a36 :  // <0421> ram a = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'h805 ? 16'h0017 :  // <0421> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h806 ? 16'h0018 :  // <0421> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle

addr == 16'h807 ? 16'h0000 :  // <0424> a = a
addr == 16'h808 ? 16'h0600 :  // <0424> b = 0

addr == 16'h809 ? 16'he407 :  // <0422> bn eq :else_2057
addr == 16'h80a ? 16'h080f :  // <0422> "

addr == 16'h80b ? 16'h2206 :  // <0423> pa = 6
addr == 16'h80c ? 16'hfba0 :  // <0423> callx  begin_adc_conversion  $tps_adc_channel
addr == 16'h80d ? 16'h095c :  // <0423> "
addr == 16'h80e ? 16'hfc00 :  // <0423> "

addr == 16'h80f ? 16'he00f :  // <0425> end_event
addr == 16'h810 ? 16'h009e :  // <0425> "

// ######## func plan_tick // = 0x0811
addr == 16'h811 ? 16'h3004 :  // <0442> push x // func plan_tick
addr == 16'h812 ? 16'h303e :  // <0442> push rtna // "

// poll the engine management plan.
// call the transition function for the current plan.
// this might perform a transition to some other plan, so it's done first.
addr == 16'h813 ? 16'h6600 :  // <0431> ram rtna = $ram_transition_func // av_ad_hi = 0
addr == 16'h814 ? 16'h6a8c :  // <0431> ram rtna = $ram_transition_func // av_ad_lo = 140
addr == 16'h815 ? 16'hf817 :  // <0431> ram rtna = $ram_transition_func // rtna = av_write_data // start read cycle
addr == 16'h816 ? 16'hf818 :  // <0431> ram rtna = $ram_transition_func // rtna = av_read_data // finish read cycle
addr == 16'h817 ? 16'h103e :  // <0432> x = rtna
addr == 16'h818 ? 16'hfc00 :  // <0433> swapra = nop
addr == 16'h819 ? 16'h6600 :  // <0435> ram b = $ram_transition_func // av_ad_hi = 0
addr == 16'h81a ? 16'h6a8c :  // <0435> ram b = $ram_transition_func // av_ad_lo = 140
addr == 16'h81b ? 16'h0417 :  // <0435> ram b = $ram_transition_func // b = av_write_data // start read cycle
addr == 16'h81c ? 16'h0418 :  // <0435> ram b = $ram_transition_func // b = av_read_data // finish read cycle

addr == 16'h81d ? 16'h0004 :  // <0438> a = x
addr == 16'h81e ? 16'h0401 :  // <0438> b = b

addr == 16'h81f ? 16'he007 :  // <0436> br eq :else_2079
addr == 16'h820 ? 16'h0826 :  // <0436> "

addr == 16'h821 ? 16'h23a0 :  // <0437> pa = :plan_transition_msg
addr == 16'h822 ? 16'h07ff :  // <0437> "
addr == 16'h823 ? 16'hfba0 :  // <0437> callx  set_text_flag  :plan_transition_msg
addr == 16'h824 ? 16'h0ac5 :  // <0437> "
addr == 16'h825 ? 16'hfc00 :  // <0437> "

// call the puff length function for the current plan.
// this is done last, so if a plan transition just happened, its new puff length will init here.
addr == 16'h826 ? 16'h6600 :  // <0441> ram rtna = $ram_puff_len_func // av_ad_hi = 0
addr == 16'h827 ? 16'h6a8a :  // <0441> ram rtna = $ram_puff_len_func // av_ad_lo = 138
addr == 16'h828 ? 16'hf817 :  // <0441> ram rtna = $ram_puff_len_func // rtna = av_write_data // start read cycle
addr == 16'h829 ? 16'hf818 :  // <0441> ram rtna = $ram_puff_len_func // rtna = av_read_data // finish read cycle
addr == 16'h82a ? 16'hfc00 :  // <0442> swapra = nop

addr == 16'h82b ? 16'hf80c :  // <0445> pop rtna // func plan_tick
addr == 16'h82c ? 16'h100c :  // <0445> pop x // "
addr == 16'h82d ? 16'hfc00 :  // <0445> swapra = nop

// ######## event uart_rx_handler // = 0x082e
// :again // = 0x082e
addr == 16'h82e ? 16'hfba0 :  // <0448> pollchar
addr == 16'h82f ? 16'h00ba :  // <0448> "
addr == 16'h830 ? 16'hfc00 :  // <0448> "
addr == 16'h831 ? 16'h1000 :  // <0449> x = a

addr == 16'h832 ? 16'h0004 :  // <0452> a = x
addr == 16'h833 ? 16'h0760 :  // <0452> b = -1

addr == 16'h834 ? 16'he407 :  // <0450> bn eq :else_2100
addr == 16'h835 ? 16'h0838 :  // <0450> "

addr == 16'h836 ? 16'he00f :  // <0451> event_return
addr == 16'h837 ? 16'h009e :  // <0451> "


addr == 16'h838 ? 16'h0004 :  // <0455> a = x
addr == 16'h839 ? 16'h060a :  // <0455> b = 10

addr == 16'h83a ? 16'he407 :  // <0453> bn eq :else_2106
addr == 16'h83b ? 16'h083f :  // <0453> "

addr == 16'h83c ? 16'hfba0 :  // <0454> callx  postpone_comm_restart
addr == 16'h83d ? 16'h0a94 :  // <0454> "
addr == 16'h83e ? 16'hfc00 :  // <0454> "

addr == 16'h83f ? 16'h2004 :  // <0456> pa = x
addr == 16'h840 ? 16'hfba0 :  // <0456> callx  parse_key  x
addr == 16'h841 ? 16'h0399 :  // <0456> "
addr == 16'h842 ? 16'hfc00 :  // <0456> "
addr == 16'h843 ? 16'he00f :  // <0457> jmp :again
addr == 16'h844 ? 16'h082e :  // <0457> "
addr == 16'h845 ? 16'he00f :  // <0458> end_event
addr == 16'h846 ? 16'h009e :  // <0458> "

// ######## event uart_rx_overflow_handler // = 0x0847
addr == 16'h847 ? 16'h7fa0 :  // <0461> error_halt_code $err_rx_overflow // leds = 0xfffe
addr == 16'h848 ? 16'hfffe :  // <0461> "
addr == 16'h849 ? 16'he00f :  // <0461> error_halt_code $err_rx_overflow
addr == 16'h84a ? 16'h0849 :  // <0461> "
addr == 16'h84b ? 16'he00f :  // <0462> end_event
addr == 16'h84c ? 16'h009e :  // <0462> "

// :tx_overflow_msg // = 0x084d
// "TXO\x0"
addr == 16'h84d ? 16'h5854 :  // <0465> XT
addr == 16'h84e ? 16'h004f :  // <0465>  O

// ######## event uart_tx_overflow_handler // = 0x084f
// error_halt_code $err_tx_overflow
addr == 16'h84f ? 16'h23a0 :  // <0469> pa = :tx_overflow_msg
addr == 16'h850 ? 16'h084d :  // <0469> "
addr == 16'h851 ? 16'hfba0 :  // <0469> callx  set_text_flag  :tx_overflow_msg
addr == 16'h852 ? 16'h0ac5 :  // <0469> "
addr == 16'h853 ? 16'hfc00 :  // <0469> "
addr == 16'h854 ? 16'he00f :  // <0470> end_event
addr == 16'h855 ? 16'h009e :  // <0470> "

// ######## event key0_handler // = 0x0856
addr == 16'h856 ? 16'h026b :  // <0473> a = 107 // putasc "k"
addr == 16'h857 ? 16'hfba0 :  // <0473> putasc "k"
addr == 16'h858 ? 16'h00ab :  // <0473> "
addr == 16'h859 ? 16'hfc00 :  // <0473> "
addr == 16'h85a ? 16'h0230 :  // <0474> a = 48 // putasc "0"
addr == 16'h85b ? 16'hfba0 :  // <0474> putasc "0"
addr == 16'h85c ? 16'h00ab :  // <0474> "
addr == 16'h85d ? 16'hfc00 :  // <0474> "
addr == 16'h85e ? 16'he00f :  // <0475> end_event
addr == 16'h85f ? 16'h009e :  // <0475> "

// ######## event key1_handler // = 0x0860
addr == 16'h860 ? 16'h026b :  // <0478> a = 107 // putasc "k"
addr == 16'h861 ? 16'hfba0 :  // <0478> putasc "k"
addr == 16'h862 ? 16'h00ab :  // <0478> "
addr == 16'h863 ? 16'hfc00 :  // <0478> "
addr == 16'h864 ? 16'h0231 :  // <0479> a = 49 // putasc "1"
addr == 16'h865 ? 16'hfba0 :  // <0479> putasc "1"
addr == 16'h866 ? 16'h00ab :  // <0479> "
addr == 16'h867 ? 16'hfc00 :  // <0479> "
addr == 16'h868 ? 16'he00f :  // <0480> end_event
addr == 16'h869 ? 16'h009e :  // <0480> "

// ######## event softevent3_handler // = 0x086a
addr == 16'h86a ? 16'he00f :  // <0483> end_event
addr == 16'h86b ? 16'h009e :  // <0483> "

// ######## event softevent2_handler // = 0x086c
addr == 16'h86c ? 16'he00f :  // <0486> end_event
addr == 16'h86d ? 16'h009e :  // <0486> "

// ######## event softevent1_handler // = 0x086e
addr == 16'h86e ? 16'he00f :  // <0489> end_event
addr == 16'h86f ? 16'h009e :  // <0489> "

// ######## event softevent0_handler // = 0x0870
addr == 16'h870 ? 16'he00f :  // <0492> end_event
addr == 16'h871 ? 16'h009e :  // <0492> "

// :rpm_msg // = 0x0872
// ": rpm=\x0"
addr == 16'h872 ? 16'h203a :  // <0495>  :
addr == 16'h873 ? 16'h7072 :  // <0495> pr
addr == 16'h874 ? 16'h3d6d :  // <0495> =m
addr == 16'h875 ? 16'h0000 :  // <0495>   

// :puff_len_msg // = 0x0876
// " pfl=\x0"
addr == 16'h876 ? 16'h7020 :  // <0498> p 
addr == 16'h877 ? 16'h6c66 :  // <0498> lf
addr == 16'h878 ? 16'h003d :  // <0498>  =

// :afrc_coords_msg // = 0x0879
// " map=\x0"
addr == 16'h879 ? 16'h6d20 :  // <0501> m 
addr == 16'h87a ? 16'h7061 :  // <0501> pa
addr == 16'h87b ? 16'h003d :  // <0501>  =

// :o2_msg // = 0x087c
// " o2=\x0"
addr == 16'h87c ? 16'h6f20 :  // <0504> o 
addr == 16'h87d ? 16'h3d32 :  // <0504> =2
addr == 16'h87e ? 16'h0000 :  // <0504>   

// :maf_msg // = 0x087f
// " af=\x0"
addr == 16'h87f ? 16'h6120 :  // <0507> a 
addr == 16'h880 ? 16'h3d66 :  // <0507> =f
addr == 16'h881 ? 16'h0000 :  // <0507>   

// :tps_msg // = 0x0882
// " tp=\x0"
addr == 16'h882 ? 16'h7420 :  // <0510> t 
addr == 16'h883 ? 16'h3d70 :  // <0510> =p
addr == 16'h884 ? 16'h0000 :  // <0510>   

// :block_temp_idx_msg // = 0x0885
// " bti=\x0"
addr == 16'h885 ? 16'h6220 :  // <0513> b 
addr == 16'h886 ? 16'h6974 :  // <0513> it
addr == 16'h887 ? 16'h003d :  // <0513>  =

// :afterstart_idx_msg // = 0x0888
// " asi=\x0"
addr == 16'h888 ? 16'h6120 :  // <0516> a 
addr == 16'h889 ? 16'h6973 :  // <0516> is
addr == 16'h88a ? 16'h003d :  // <0516>  =

// ######## func start_daq_pass // = 0x088b
addr == 16'h88b ? 16'h3004 :  // <0592> push x // func start_daq_pass
addr == 16'h88c ? 16'h303e :  // <0592> push rtna // "

// daq pass counter in RAM.
addr == 16'h88d ? 16'h6600 :  // <0520> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h88e ? 16'h6a14 :  // <0520> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h88f ? 16'h0017 :  // <0520> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h890 ? 16'h0018 :  // <0520> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h891 ? 16'h0601 :  // <0521> b = 1
addr == 16'h892 ? 16'hc800 :  // <0522> a = a+b
addr == 16'h893 ? 16'h0300 :  // <0522> "
addr == 16'h894 ? 16'h7c00 :  // <0523> leds = a
addr == 16'h895 ? 16'h6600 :  // <0524> ram $ram_daq_pass_cnt = a // av_ad_hi = 0
addr == 16'h896 ? 16'h6a14 :  // <0524> ram $ram_daq_pass_cnt = a // av_ad_lo = 20
addr == 16'h897 ? 16'h5c00 :  // <0524> ram $ram_daq_pass_cnt = a // av_write_data = a
addr == 16'h898 ? 16'hfba0 :  // <0525> call :put4x
addr == 16'h899 ? 16'h00d3 :  // <0525> "
addr == 16'h89a ? 16'hfc00 :  // <0525> "

addr == 16'h89b ? 16'h03a0 :  // <0527> a = :rpm_msg
addr == 16'h89c ? 16'h0872 :  // <0527> "
addr == 16'h89d ? 16'hfba0 :  // <0528> call :print_nt
addr == 16'h89e ? 16'h015f :  // <0528> "
addr == 16'h89f ? 16'hfc00 :  // <0528> "
addr == 16'h8a0 ? 16'h0200 :  // <0529> a = 0
addr == 16'h8a1 ? 16'h6600 :  // <0530> ram x = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h8a2 ? 16'h6a7e :  // <0530> ram x = $ram_rpm_valid // av_ad_lo = 126
addr == 16'h8a3 ? 16'h1017 :  // <0530> ram x = $ram_rpm_valid // x = av_write_data // start read cycle
addr == 16'h8a4 ? 16'h1018 :  // <0530> ram x = $ram_rpm_valid // x = av_read_data // finish read cycle

addr == 16'h8a5 ? 16'h0004 :  // <0533> a = x
addr == 16'h8a6 ? 16'h0600 :  // <0533> b = 0

addr == 16'h8a7 ? 16'he007 :  // <0531> br eq :else_2215
addr == 16'h8a8 ? 16'h08ad :  // <0531> "

addr == 16'h8a9 ? 16'h6600 :  // <0532> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h8aa ? 16'h6a7c :  // <0532> ram a = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h8ab ? 16'h0017 :  // <0532> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h8ac ? 16'h0018 :  // <0532> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle

addr == 16'h8ad ? 16'hfba0 :  // <0534> call :put4x
addr == 16'h8ae ? 16'h00d3 :  // <0534> "
addr == 16'h8af ? 16'hfc00 :  // <0534> "

addr == 16'h8b0 ? 16'h03a0 :  // <0536> a = :puff_len_msg
addr == 16'h8b1 ? 16'h0876 :  // <0536> "
addr == 16'h8b2 ? 16'hfba0 :  // <0537> call :print_nt
addr == 16'h8b3 ? 16'h015f :  // <0537> "
addr == 16'h8b4 ? 16'hfc00 :  // <0537> "
addr == 16'h8b5 ? 16'h0025 :  // <0538> a = puff_len_us
addr == 16'h8b6 ? 16'hfba0 :  // <0539> call :put4x
addr == 16'h8b7 ? 16'h00d3 :  // <0539> "
addr == 16'h8b8 ? 16'hfc00 :  // <0539> "
addr == 16'h8b9 ? 16'h022c :  // <0540> a = 44 // putasc ","
addr == 16'h8ba ? 16'hfba0 :  // <0540> putasc ","
addr == 16'h8bb ? 16'h00ab :  // <0540> "
addr == 16'h8bc ? 16'hfc00 :  // <0540> "
addr == 16'h8bd ? 16'h6600 :  // <0541> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h8be ? 16'h6a92 :  // <0541> ram a = $ram_puff_count // av_ad_lo = 146
addr == 16'h8bf ? 16'h0017 :  // <0541> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h8c0 ? 16'h0018 :  // <0541> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h8c1 ? 16'hfba0 :  // <0542> call :put4x
addr == 16'h8c2 ? 16'h00d3 :  // <0542> "
addr == 16'h8c3 ? 16'hfc00 :  // <0542> "

addr == 16'h8c4 ? 16'h03a0 :  // <0544> a = :afrc_coords_msg
addr == 16'h8c5 ? 16'h0879 :  // <0544> "
addr == 16'h8c6 ? 16'hfba0 :  // <0545> call :print_nt
addr == 16'h8c7 ? 16'h015f :  // <0545> "
addr == 16'h8c8 ? 16'hfc00 :  // <0545> "
addr == 16'h8c9 ? 16'h6600 :  // <0546> ram a = $ram_afrc_rpm_col_idx // av_ad_hi = 0
addr == 16'h8ca ? 16'h6a9e :  // <0546> ram a = $ram_afrc_rpm_col_idx // av_ad_lo = 158
addr == 16'h8cb ? 16'h0017 :  // <0546> ram a = $ram_afrc_rpm_col_idx // a = av_write_data // start read cycle
addr == 16'h8cc ? 16'h0018 :  // <0546> ram a = $ram_afrc_rpm_col_idx // a = av_read_data // finish read cycle
addr == 16'h8cd ? 16'hfba0 :  // <0547> call :put4x
addr == 16'h8ce ? 16'h00d3 :  // <0547> "
addr == 16'h8cf ? 16'hfc00 :  // <0547> "
addr == 16'h8d0 ? 16'h022c :  // <0548> a = 44 // putasc ","
addr == 16'h8d1 ? 16'hfba0 :  // <0548> putasc ","
addr == 16'h8d2 ? 16'h00ab :  // <0548> "
addr == 16'h8d3 ? 16'hfc00 :  // <0548> "
addr == 16'h8d4 ? 16'h6600 :  // <0549> ram a = $ram_afrc_maf_row_idx // av_ad_hi = 0
addr == 16'h8d5 ? 16'h6a9c :  // <0549> ram a = $ram_afrc_maf_row_idx // av_ad_lo = 156
addr == 16'h8d6 ? 16'h0017 :  // <0549> ram a = $ram_afrc_maf_row_idx // a = av_write_data // start read cycle
addr == 16'h8d7 ? 16'h0018 :  // <0549> ram a = $ram_afrc_maf_row_idx // a = av_read_data // finish read cycle
addr == 16'h8d8 ? 16'hfba0 :  // <0550> call :put4x
addr == 16'h8d9 ? 16'h00d3 :  // <0550> "
addr == 16'h8da ? 16'hfc00 :  // <0550> "

addr == 16'h8db ? 16'h03a0 :  // <0552> a = :o2_msg
addr == 16'h8dc ? 16'h087c :  // <0552> "
addr == 16'h8dd ? 16'hfba0 :  // <0553> call :print_nt
addr == 16'h8de ? 16'h015f :  // <0553> "
addr == 16'h8df ? 16'hfc00 :  // <0553> "
addr == 16'h8e0 ? 16'h0205 :  // <0554> a = $o2_adc_channel

addr == 16'h8e1 ? 16'h0351 :  // <0555> a = a<<1
addr == 16'h8e2 ? 16'h0626 :  // <0555> b = 38
addr == 16'h8e3 ? 16'h6600 :  // <0555> av_ad_hi = 0
addr == 16'h8e4 ? 16'h6b00 :  // <0555> av_ad_lo = ad0
addr == 16'h8e5 ? 16'h0417 :  // <0555> b = av_begin_read
addr == 16'h8e6 ? 16'h0418 :  // <0555> b = av_read_data

addr == 16'h8e7 ? 16'h0001 :  // <0556> a = b
addr == 16'h8e8 ? 16'hfba0 :  // <0557> call :put4x
addr == 16'h8e9 ? 16'h00d3 :  // <0557> "
addr == 16'h8ea ? 16'hfc00 :  // <0557> "

addr == 16'h8eb ? 16'h03a0 :  // <0559> a = :maf_msg
addr == 16'h8ec ? 16'h087f :  // <0559> "
addr == 16'h8ed ? 16'hfba0 :  // <0560> call :print_nt
addr == 16'h8ee ? 16'h015f :  // <0560> "
addr == 16'h8ef ? 16'hfc00 :  // <0560> "
addr == 16'h8f0 ? 16'h6600 :  // <0561> ram a = $ram_maf_adc_filtered // av_ad_hi = 0
addr == 16'h8f1 ? 16'h6a98 :  // <0561> ram a = $ram_maf_adc_filtered // av_ad_lo = 152
addr == 16'h8f2 ? 16'h0017 :  // <0561> ram a = $ram_maf_adc_filtered // a = av_write_data // start read cycle
addr == 16'h8f3 ? 16'h0018 :  // <0561> ram a = $ram_maf_adc_filtered // a = av_read_data // finish read cycle
addr == 16'h8f4 ? 16'hfba0 :  // <0562> call :put4x
addr == 16'h8f5 ? 16'h00d3 :  // <0562> "
addr == 16'h8f6 ? 16'hfc00 :  // <0562> "

addr == 16'h8f7 ? 16'h03a0 :  // <0564> a = :tps_msg
addr == 16'h8f8 ? 16'h0882 :  // <0564> "
addr == 16'h8f9 ? 16'hfba0 :  // <0565> call :print_nt
addr == 16'h8fa ? 16'h015f :  // <0565> "
addr == 16'h8fb ? 16'hfc00 :  // <0565> "
addr == 16'h8fc ? 16'h0206 :  // <0566> a = $tps_adc_channel

addr == 16'h8fd ? 16'h0351 :  // <0567> a = a<<1
addr == 16'h8fe ? 16'h0626 :  // <0567> b = 38
addr == 16'h8ff ? 16'h6600 :  // <0567> av_ad_hi = 0
addr == 16'h900 ? 16'h6b00 :  // <0567> av_ad_lo = ad0
addr == 16'h901 ? 16'h0417 :  // <0567> b = av_begin_read
addr == 16'h902 ? 16'h0418 :  // <0567> b = av_read_data

addr == 16'h903 ? 16'h0001 :  // <0568> a = b
addr == 16'h904 ? 16'hfba0 :  // <0569> call :put4x
addr == 16'h905 ? 16'h00d3 :  // <0569> "
addr == 16'h906 ? 16'hfc00 :  // <0569> "
addr == 16'h907 ? 16'h022c :  // <0570> a = 44 // putasc ","
addr == 16'h908 ? 16'hfba0 :  // <0570> putasc ","
addr == 16'h909 ? 16'h00ab :  // <0570> "
addr == 16'h90a ? 16'hfc00 :  // <0570> "
addr == 16'h90b ? 16'h6600 :  // <0571> ram a = $ram_tps_avg // av_ad_hi = 0
addr == 16'h90c ? 16'h6aae :  // <0571> ram a = $ram_tps_avg // av_ad_lo = 174
addr == 16'h90d ? 16'h0017 :  // <0571> ram a = $ram_tps_avg // a = av_write_data // start read cycle
addr == 16'h90e ? 16'h0018 :  // <0571> ram a = $ram_tps_avg // a = av_read_data // finish read cycle
addr == 16'h90f ? 16'hfba0 :  // <0572> call :put4x
addr == 16'h910 ? 16'h00d3 :  // <0572> "
addr == 16'h911 ? 16'hfc00 :  // <0572> "

addr == 16'h912 ? 16'h03a0 :  // <0574> a = :block_temp_idx_msg
addr == 16'h913 ? 16'h0885 :  // <0574> "
addr == 16'h914 ? 16'hfba0 :  // <0575> call :print_nt
addr == 16'h915 ? 16'h015f :  // <0575> "
addr == 16'h916 ? 16'hfc00 :  // <0575> "
addr == 16'h917 ? 16'h6600 :  // <0576> ram a = $ram_block_temp_map_idx // av_ad_hi = 0
addr == 16'h918 ? 16'h6aa0 :  // <0576> ram a = $ram_block_temp_map_idx // av_ad_lo = 160
addr == 16'h919 ? 16'h0017 :  // <0576> ram a = $ram_block_temp_map_idx // a = av_write_data // start read cycle
addr == 16'h91a ? 16'h0018 :  // <0576> ram a = $ram_block_temp_map_idx // a = av_read_data // finish read cycle
addr == 16'h91b ? 16'hfba0 :  // <0577> call :put4x
addr == 16'h91c ? 16'h00d3 :  // <0577> "
addr == 16'h91d ? 16'hfc00 :  // <0577> "

addr == 16'h91e ? 16'h03a0 :  // <0579> a = :afterstart_idx_msg
addr == 16'h91f ? 16'h0888 :  // <0579> "
addr == 16'h920 ? 16'hfba0 :  // <0580> call :print_nt
addr == 16'h921 ? 16'h015f :  // <0580> "
addr == 16'h922 ? 16'hfc00 :  // <0580> "
addr == 16'h923 ? 16'h6600 :  // <0581> ram a = $ram_afterstart_map_idx // av_ad_hi = 0
addr == 16'h924 ? 16'h6aa4 :  // <0581> ram a = $ram_afterstart_map_idx // av_ad_lo = 164
addr == 16'h925 ? 16'h0017 :  // <0581> ram a = $ram_afterstart_map_idx // a = av_write_data // start read cycle
addr == 16'h926 ? 16'h0018 :  // <0581> ram a = $ram_afterstart_map_idx // a = av_read_data // finish read cycle
addr == 16'h927 ? 16'hfba0 :  // <0582> call :put4x
addr == 16'h928 ? 16'h00d3 :  // <0582> "
addr == 16'h929 ? 16'hfc00 :  // <0582> "

// start to acquire & report all anmux channels.
addr == 16'h92a ? 16'h0207 :  // <0585> a = ($anmux_num_channels - 1)
addr == 16'h92b ? 16'hfba0 :  // <0586> call :anmux_set_chn
addr == 16'h92c ? 16'h00c2 :  // <0586> "
addr == 16'h92d ? 16'hfc00 :  // <0586> "
addr == 16'h92e ? 16'h5205 :  // <0587> mstimer1 = $anmux_settle_ms

// observe MCU utilization.  this RAM variable can be seen by the debugger.
addr == 16'h92f ? 16'h6600 :  // <0590> ram $ram_mcu_usage_cnt = usage_count // av_ad_hi = 0
addr == 16'h930 ? 16'h6a44 :  // <0590> ram $ram_mcu_usage_cnt = usage_count // av_ad_lo = 68
addr == 16'h931 ? 16'h5c0f :  // <0590> ram $ram_mcu_usage_cnt = usage_count // av_write_data = usage_count
addr == 16'h932 ? 16'h3e00 :  // <0591> usage_count = 0

addr == 16'h933 ? 16'hf80c :  // <0593> pop rtna // func start_daq_pass
addr == 16'h934 ? 16'h100c :  // <0593> pop x // "
addr == 16'h935 ? 16'hfc00 :  // <0593> swapra = nop

// ######## event mstimer1_handler // = 0x0936
// anmux signal has settled.

addr == 16'h936 ? 16'h6600 :  // <0597> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h937 ? 16'h6a36 :  // <0597> ram a = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'h938 ? 16'h0017 :  // <0597> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h939 ? 16'h0018 :  // <0597> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle

addr == 16'h93a ? 16'h0000 :  // <0602> a = a
addr == 16'h93b ? 16'h0600 :  // <0602> b = 0

addr == 16'h93c ? 16'he007 :  // <0598> br eq :else_2364
addr == 16'h93d ? 16'h0941 :  // <0598> "

// ADC is busy right now.  wait a while & try again.
addr == 16'h93e ? 16'h5202 :  // <0600> mstimer1 = $anmux_retry_ms
addr == 16'h93f ? 16'he00f :  // <0601> event_return
addr == 16'h940 ? 16'h009e :  // <0601> "


// start a reading from the current anmux channel.
addr == 16'h941 ? 16'h0220 :  // <0605> a = 32 // putasc " "
addr == 16'h942 ? 16'hfba0 :  // <0605> putasc " "
addr == 16'h943 ? 16'h00ab :  // <0605> "
addr == 16'h944 ? 16'hfc00 :  // <0605> "
addr == 16'h945 ? 16'h0273 :  // <0606> a = 115 // putasc "s"
addr == 16'h946 ? 16'hfba0 :  // <0606> putasc "s"
addr == 16'h947 ? 16'h00ab :  // <0606> "
addr == 16'h948 ? 16'hfc00 :  // <0606> "
addr == 16'h949 ? 16'hfba0 :  // <0607> call :anmux_get_chn
addr == 16'h94a ? 16'h00c6 :  // <0607> "
addr == 16'h94b ? 16'hfc00 :  // <0607> "
addr == 16'h94c ? 16'h0630 :  // <0608> b = 48 // asc b = "0"
addr == 16'h94d ? 16'hc800 :  // <0609> a = a+b // putchar a+b
addr == 16'h94e ? 16'h0300 :  // <0609> "
addr == 16'h94f ? 16'hfba0 :  // <0609> putchar a+b
addr == 16'h950 ? 16'h00ab :  // <0609> "
addr == 16'h951 ? 16'hfc00 :  // <0609> "
addr == 16'h952 ? 16'h023d :  // <0610> a = 61 // putasc "="
addr == 16'h953 ? 16'hfba0 :  // <0610> putasc "="
addr == 16'h954 ? 16'h00ab :  // <0610> "
addr == 16'h955 ? 16'hfc00 :  // <0610> "
addr == 16'h956 ? 16'h2207 :  // <0611> pa = 7
addr == 16'h957 ? 16'hfba0 :  // <0611> callx  begin_adc_conversion  $anmux_adc_channel
addr == 16'h958 ? 16'h095c :  // <0611> "
addr == 16'h959 ? 16'hfc00 :  // <0611> "
addr == 16'h95a ? 16'he00f :  // <0612> end_event
addr == 16'h95b ? 16'h009e :  // <0612> "

// ######## func begin_adc_conversion // = 0x095c

// begin SPI transaction, specifying Nano ADC channel to take effect NEXT
// conversion after this one.

addr == 16'h95c ? 16'h6600 :  // <0618> ram $ram_adc_chn_pending = next_channel // av_ad_hi = 0
addr == 16'h95d ? 16'h6a36 :  // <0618> ram $ram_adc_chn_pending = next_channel // av_ad_lo = 54
addr == 16'h95e ? 16'h5c08 :  // <0618> ram $ram_adc_chn_pending = next_channel // av_write_data = next_channel
addr == 16'h95f ? 16'h0008 :  // <0619> a = next_channel
addr == 16'h960 ? 16'h0352 :  // <0620> a = a<<4
addr == 16'h961 ? 16'h0352 :  // <0621> a = a<<4
addr == 16'h962 ? 16'h0351 :  // <0622> a = a<<1
addr == 16'h963 ? 16'h0351 :  // <0623> a = a<<1
addr == 16'h964 ? 16'h0351 :  // <0624> a = a<<1
addr == 16'h965 ? 16'h5800 :  // <0625> spi_data = a
addr == 16'h966 ? 16'h6600 :  // <0626> ram $ram_adc_junk = 1 // av_ad_hi = 0
addr == 16'h967 ? 16'h6a38 :  // <0626> ram $ram_adc_junk = 1 // av_ad_lo = 56
addr == 16'h968 ? 16'h5e01 :  // <0626> ram $ram_adc_junk = 1 // av_write_data = 1

addr == 16'h969 ? 16'hfc00 :  // <0628> swapra = nop

// ######## event spi_done_handler // = 0x096a
// discard the results of the first SPI exchange with the ADC.  that's only for writing the channel num out to the ADC.
addr == 16'h96a ? 16'h6600 :  // <0631> ram a = $ram_adc_junk // av_ad_hi = 0
addr == 16'h96b ? 16'h6a38 :  // <0631> ram a = $ram_adc_junk // av_ad_lo = 56
addr == 16'h96c ? 16'h0017 :  // <0631> ram a = $ram_adc_junk // a = av_write_data // start read cycle
addr == 16'h96d ? 16'h0018 :  // <0631> ram a = $ram_adc_junk // a = av_read_data // finish read cycle

addr == 16'h96e ? 16'h0000 :  // <0643> a = a
addr == 16'h96f ? 16'h0600 :  // <0643> b = 0

addr == 16'h970 ? 16'he007 :  // <0632> br eq :else_2416
addr == 16'h971 ? 16'h0981 :  // <0632> "

// start another SPI exchange to retrieve the actual reading.
addr == 16'h972 ? 16'h6600 :  // <0634> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h973 ? 16'h6a36 :  // <0634> ram a = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'h974 ? 16'h0017 :  // <0634> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h975 ? 16'h0018 :  // <0634> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle
addr == 16'h976 ? 16'h0352 :  // <0635> a = a<<4
addr == 16'h977 ? 16'h0352 :  // <0636> a = a<<4
addr == 16'h978 ? 16'h0351 :  // <0637> a = a<<1
addr == 16'h979 ? 16'h0351 :  // <0638> a = a<<1
addr == 16'h97a ? 16'h0351 :  // <0639> a = a<<1
addr == 16'h97b ? 16'h5800 :  // <0640> spi_data = a
addr == 16'h97c ? 16'h6600 :  // <0641> ram $ram_adc_junk = 0 // av_ad_hi = 0
addr == 16'h97d ? 16'h6a38 :  // <0641> ram $ram_adc_junk = 0 // av_ad_lo = 56
addr == 16'h97e ? 16'h5e00 :  // <0641> ram $ram_adc_junk = 0 // av_write_data = 0
addr == 16'h97f ? 16'he00f :  // <0642> event_return
addr == 16'h980 ? 16'h009e :  // <0642> "


// memorize an actual ADC reading.
addr == 16'h981 ? 16'h6600 :  // <0646> ram i = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h982 ? 16'h6a36 :  // <0646> ram i = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'h983 ? 16'h0817 :  // <0646> ram i = $ram_adc_chn_pending // i = av_write_data // start read cycle
addr == 16'h984 ? 16'h0818 :  // <0646> ram i = $ram_adc_chn_pending // i = av_read_data // finish read cycle
addr == 16'h985 ? 16'h6600 :  // <0647> ram $ram_adc_chn_pending = 0 // av_ad_hi = 0
addr == 16'h986 ? 16'h6a36 :  // <0647> ram $ram_adc_chn_pending = 0 // av_ad_lo = 54
addr == 16'h987 ? 16'h5e00 :  // <0647> ram $ram_adc_chn_pending = 0 // av_write_data = 0
addr == 16'h988 ? 16'h0002 :  // <0648> a = i
addr == 16'h989 ? 16'h0416 :  // <0649> b = spi_data

addr == 16'h98a ? 16'h0351 :  // <0650> a = a<<1
addr == 16'h98b ? 16'h3001 :  // <0650> push b // push b
addr == 16'h98c ? 16'h0626 :  // <0650> b = 38
addr == 16'h98d ? 16'h6600 :  // <0650> av_ad_hi = 0
addr == 16'h98e ? 16'h6b00 :  // <0650> av_ad_lo = ad0
addr == 16'h98f ? 16'h5c0c :  // <0650> pop av_write_data // pop av_write_data


// react to ADC reading.

addr == 16'h990 ? 16'h0002 :  // <0657> a = i
addr == 16'h991 ? 16'h0606 :  // <0657> b = 6

addr == 16'h992 ? 16'he407 :  // <0653> bn eq :else_2450
addr == 16'h993 ? 16'h099d :  // <0653> "

addr == 16'h994 ? 16'h2205 :  // <0654> pa = 5
addr == 16'h995 ? 16'hfba0 :  // <0654> callx  begin_adc_conversion  $o2_adc_channel
addr == 16'h996 ? 16'h095c :  // <0654> "
addr == 16'h997 ? 16'hfc00 :  // <0654> "
addr == 16'h998 ? 16'hfba0 :  // <0655> callx  interpret_tps
addr == 16'h999 ? 16'h0b8a :  // <0655> "
addr == 16'h99a ? 16'hfc00 :  // <0655> "
addr == 16'h99b ? 16'he00f :  // <0656> event_return
addr == 16'h99c ? 16'h009e :  // <0656> "


addr == 16'h99d ? 16'h0002 :  // <0661> a = i
addr == 16'h99e ? 16'h0605 :  // <0661> b = 5

addr == 16'h99f ? 16'he407 :  // <0658> bn eq :else_2463
addr == 16'h9a0 ? 16'h09a7 :  // <0658> "

addr == 16'h9a1 ? 16'h2204 :  // <0659> pa = 4
addr == 16'h9a2 ? 16'hfba0 :  // <0659> callx  begin_adc_conversion  $maf_adc_channel
addr == 16'h9a3 ? 16'h095c :  // <0659> "
addr == 16'h9a4 ? 16'hfc00 :  // <0659> "
addr == 16'h9a5 ? 16'he00f :  // <0660> event_return
addr == 16'h9a6 ? 16'h009e :  // <0660> "


addr == 16'h9a7 ? 16'h0002 :  // <0666> a = i
addr == 16'h9a8 ? 16'h0604 :  // <0666> b = 4

addr == 16'h9a9 ? 16'he407 :  // <0662> bn eq :else_2473
addr == 16'h9aa ? 16'h09b3 :  // <0662> "

addr == 16'h9ab ? 16'hfba0 :  // <0663> callx  interpret_maf
addr == 16'h9ac ? 16'h0b4a :  // <0663> "
addr == 16'h9ad ? 16'hfc00 :  // <0663> "
addr == 16'h9ae ? 16'hfba0 :  // <0664> callx  plan_tick
addr == 16'h9af ? 16'h0811 :  // <0664> "
addr == 16'h9b0 ? 16'hfc00 :  // <0664> "
addr == 16'h9b1 ? 16'he00f :  // <0665> event_return
addr == 16'h9b2 ? 16'h009e :  // <0665> "


addr == 16'h9b3 ? 16'h0002 :  // <0694> a = i
addr == 16'h9b4 ? 16'h0607 :  // <0694> b = 7

addr == 16'h9b5 ? 16'he407 :  // <0667> bn eq :else_2485
addr == 16'h9b6 ? 16'h09eb :  // <0667> "

// report anmux reading.
addr == 16'h9b7 ? 16'h0016 :  // <0669> a = spi_data
addr == 16'h9b8 ? 16'hfba0 :  // <0670> call :put4x
addr == 16'h9b9 ? 16'h00d3 :  // <0670> "
addr == 16'h9ba ? 16'hfc00 :  // <0670> "

// memorize anmux reading.
addr == 16'h9bb ? 16'hfba0 :  // <0673> call :anmux_get_chn
addr == 16'h9bc ? 16'h00c6 :  // <0673> "
addr == 16'h9bd ? 16'hfc00 :  // <0673> "
addr == 16'h9be ? 16'h0416 :  // <0674> b = spi_data

addr == 16'h9bf ? 16'h0351 :  // <0675> a = a<<1
addr == 16'h9c0 ? 16'h3001 :  // <0675> push b // push b
addr == 16'h9c1 ? 16'h0616 :  // <0675> b = 22
addr == 16'h9c2 ? 16'h6600 :  // <0675> av_ad_hi = 0
addr == 16'h9c3 ? 16'h6b00 :  // <0675> av_ad_lo = ad0
addr == 16'h9c4 ? 16'h5c0c :  // <0675> pop av_write_data // pop av_write_data


// decrement anmux channel & start waiting again.
addr == 16'h9c5 ? 16'hfba0 :  // <0678> call :anmux_get_chn
addr == 16'h9c6 ? 16'h00c6 :  // <0678> "
addr == 16'h9c7 ? 16'hfc00 :  // <0678> "

addr == 16'h9c8 ? 16'h0000 :  // <0685> a = a
addr == 16'h9c9 ? 16'h0600 :  // <0685> b = 0

addr == 16'h9ca ? 16'he007 :  // <0679> br eq :else_2506
addr == 16'h9cb ? 16'h09d5 :  // <0679> "

addr == 16'h9cc ? 16'h0760 :  // <0680> b = -1
addr == 16'h9cd ? 16'hc800 :  // <0681> a = a+b
addr == 16'h9ce ? 16'h0300 :  // <0681> "
addr == 16'h9cf ? 16'hfba0 :  // <0682> call :anmux_set_chn
addr == 16'h9d0 ? 16'h00c2 :  // <0682> "
addr == 16'h9d1 ? 16'hfc00 :  // <0682> "
addr == 16'h9d2 ? 16'h5205 :  // <0683> mstimer1 = $anmux_settle_ms
addr == 16'h9d3 ? 16'he00f :  // <0684> event_return
addr == 16'h9d4 ? 16'h009e :  // <0684> "


// end of temperature daq pass.
addr == 16'h9d5 ? 16'hfba0 :  // <0688> callx  interpret_block_temp
addr == 16'h9d6 ? 16'h0623 :  // <0688> "
addr == 16'h9d7 ? 16'hfc00 :  // <0688> "
addr == 16'h9d8 ? 16'hfba0 :  // <0689> callx  report_plan
addr == 16'h9d9 ? 16'h0b2f :  // <0689> "
addr == 16'h9da ? 16'hfc00 :  // <0689> "
addr == 16'h9db ? 16'hfba0 :  // <0690> callx  report_text_flags
addr == 16'h9dc ? 16'h0afc :  // <0690> "
addr == 16'h9dd ? 16'hfc00 :  // <0690> "
addr == 16'h9de ? 16'h020d :  // <0691> a = 13 // puteol
addr == 16'h9df ? 16'hfba0 :  // <0691> puteol
addr == 16'h9e0 ? 16'h00ab :  // <0691> "
addr == 16'h9e1 ? 16'hfc00 :  // <0691> "
addr == 16'h9e2 ? 16'h020a :  // <0691> a = 10 // puteol
addr == 16'h9e3 ? 16'hfba0 :  // <0691> puteol
addr == 16'h9e4 ? 16'h00ab :  // <0691> "
addr == 16'h9e5 ? 16'hfc00 :  // <0691> "
addr == 16'h9e6 ? 16'h6600 :  // <0692> ram $ram_dial_setting = spi_data // av_ad_hi = 0
addr == 16'h9e7 ? 16'h6a3a :  // <0692> ram $ram_dial_setting = spi_data // av_ad_lo = 58
addr == 16'h9e8 ? 16'h5c16 :  // <0692> ram $ram_dial_setting = spi_data // av_write_data = spi_data
addr == 16'h9e9 ? 16'he00f :  // <0693> event_return
addr == 16'h9ea ? 16'h009e :  // <0693> "

addr == 16'h9eb ? 16'he00f :  // <0695> end_event
addr == 16'h9ec ? 16'h009e :  // <0695> "

// :power_lost_msg // = 0x09ed
// "PWL\x0"
addr == 16'h9ed ? 16'h5750 :  // <0698> WP
addr == 16'h9ee ? 16'h004c :  // <0698>  L

// ######## event power_lost_handler // = 0x09ef
// at this time we have less than 2 ms of usable run time left.

// this must be an uncommanded loss of main power, because if it was commanded,
// no more events would be handled; this event handler wouldn't have a chance to run.
// immediately set the power relay PWM to full power for a few seconds,
// in case the power relay opened accidentally e.g. due to a hard pothole.
addr == 16'h9ef ? 16'h8a00 :  // <0707> power_duty = $power_duty_closing
addr == 16'h9f0 ? 16'h6600 :  // <0708> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h9f1 ? 16'h6a14 :  // <0708> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h9f2 ? 16'h0017 :  // <0708> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h9f3 ? 16'h0018 :  // <0708> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h9f4 ? 16'h0602 :  // <0709> b = $relay_hold_passes
addr == 16'h9f5 ? 16'h6600 :  // <0710> ram $ram_relay_hold_at_pass = a+b // av_ad_hi = 0
addr == 16'h9f6 ? 16'h6a3e :  // <0710> ram $ram_relay_hold_at_pass = a+b // av_ad_lo = 62
addr == 16'h9f7 ? 16'hc800 :  // <0710> ram $ram_relay_hold_at_pass = a+b // av_write_data = a+b
addr == 16'h9f8 ? 16'h5f00 :  // <0710> "

// pause any non-vital power-hogging operations, to conserve power for the EEPROM write.

// save persistent data in case the power remains down e.g. due to battery disconnect.
addr == 16'h9f9 ? 16'hfba0 :  // <0715> callx  save_persistent_data
addr == 16'h9fa ? 16'h0a66 :  // <0715> "
addr == 16'h9fb ? 16'hfc00 :  // <0715> "

addr == 16'h9fc ? 16'h23a0 :  // <0717> pa = :power_lost_msg
addr == 16'h9fd ? 16'h09ed :  // <0717> "
addr == 16'h9fe ? 16'hfba0 :  // <0717> callx  set_text_flag  :power_lost_msg
addr == 16'h9ff ? 16'h0ac5 :  // <0717> "
addr == 16'ha00 ? 16'hfc00 :  // <0717> "
addr == 16'ha01 ? 16'he00f :  // <0718> end_event
addr == 16'ha02 ? 16'h009e :  // <0718> "

// :ign_off_msg // = 0x0a03
// "IGOF\x0"
addr == 16'ha03 ? 16'h4749 :  // <0721> GI
addr == 16'ha04 ? 16'h464f :  // <0721> FO
addr == 16'ha05 ? 16'h0000 :  // <0721>   

// ######## event ign_switch_off_handler // = 0x0a06
// set power-down deadline in RAM.  this makes the system remain powered for several more minutes, for cooldown data logging.
addr == 16'ha06 ? 16'h6600 :  // <0725> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'ha07 ? 16'h6a40 :  // <0725> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'ha08 ? 16'h0017 :  // <0725> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'ha09 ? 16'h0018 :  // <0725> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'ha0a ? 16'h060a :  // <0726> b = $power_extend_minutes
addr == 16'ha0b ? 16'h6600 :  // <0727> ram $ram_power_down_at_min = a+b // av_ad_hi = 0
addr == 16'ha0c ? 16'h6a3c :  // <0727> ram $ram_power_down_at_min = a+b // av_ad_lo = 60
addr == 16'ha0d ? 16'hc800 :  // <0727> ram $ram_power_down_at_min = a+b // av_write_data = a+b
addr == 16'ha0e ? 16'h5f00 :  // <0727> "
addr == 16'ha0f ? 16'h23a0 :  // <0728> pa = :ign_off_msg
addr == 16'ha10 ? 16'h0a03 :  // <0728> "
addr == 16'ha11 ? 16'hfba0 :  // <0728> callx  set_text_flag   :ign_off_msg
addr == 16'ha12 ? 16'h0ac5 :  // <0728> "
addr == 16'ha13 ? 16'hfc00 :  // <0728> "
addr == 16'ha14 ? 16'he00f :  // <0729> end_event
addr == 16'ha15 ? 16'h009e :  // <0729> "

// :ign_on_msg // = 0x0a16
// "IGON\x0"
addr == 16'ha16 ? 16'h4749 :  // <0732> GI
addr == 16'ha17 ? 16'h4e4f :  // <0732> NO
addr == 16'ha18 ? 16'h0000 :  // <0732>   

// ######## event ign_switch_on_handler // = 0x0a19
addr == 16'ha19 ? 16'h6600 :  // <0735> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'ha1a ? 16'h6a3c :  // <0735> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 60
addr == 16'ha1b ? 16'h5f60 :  // <0735> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'ha1c ? 16'h23a0 :  // <0736> pa = :ign_on_msg
addr == 16'ha1d ? 16'h0a16 :  // <0736> "
addr == 16'ha1e ? 16'hfba0 :  // <0736> callx  set_text_flag   :ign_on_msg
addr == 16'ha1f ? 16'h0ac5 :  // <0736> "
addr == 16'ha20 ? 16'hfc00 :  // <0736> "
addr == 16'ha21 ? 16'he00f :  // <0737> end_event
addr == 16'ha22 ? 16'h009e :  // <0737> "

// ######## event puff1_done_handler // = 0x0a23
// puff just finished.  set length of next puff.
addr == 16'ha23 ? 16'h6600 :  // <0741> ram puff_len_us = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'ha24 ? 16'h6a90 :  // <0741> ram puff_len_us = $ram_next_puff_len_us // av_ad_lo = 144
addr == 16'ha25 ? 16'h9417 :  // <0741> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_write_data // start read cycle
addr == 16'ha26 ? 16'h9418 :  // <0741> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_read_data // finish read cycle

// count puffs.
addr == 16'ha27 ? 16'h6600 :  // <0744> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'ha28 ? 16'h6a92 :  // <0744> ram a = $ram_puff_count // av_ad_lo = 146
addr == 16'ha29 ? 16'h0017 :  // <0744> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'ha2a ? 16'h0018 :  // <0744> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'ha2b ? 16'h0601 :  // <0745> b = 1
addr == 16'ha2c ? 16'h6600 :  // <0746> ram $ram_puff_count = a+b // av_ad_hi = 0
addr == 16'ha2d ? 16'h6a92 :  // <0746> ram $ram_puff_count = a+b // av_ad_lo = 146
addr == 16'ha2e ? 16'hc800 :  // <0746> ram $ram_puff_count = a+b // av_write_data = a+b
addr == 16'ha2f ? 16'h5f00 :  // <0746> "

// hack to set puff length strictly by a hard-wired knob.
// ram a = $ram_dial_setting
// a = a<<1
// a = a<<1
// a = a<<1
// bn az :nonzero
// a = 1
// :nonzero
// puff_len_us = a
addr == 16'ha30 ? 16'he00f :  // <0757> end_event
addr == 16'ha31 ? 16'h009e :  // <0757> "

// ######## func minute_events // = 0x0a32
addr == 16'ha32 ? 16'h303e :  // <0761> push rtna // func minute_events

addr == 16'ha33 ? 16'hfba0 :  // <0760> callx  check_power_down
addr == 16'ha34 ? 16'h0a4f :  // <0760> "
addr == 16'ha35 ? 16'hfc00 :  // <0760> "

addr == 16'ha36 ? 16'hf80c :  // <0762> pop rtna // func minute_events
addr == 16'ha37 ? 16'hfc00 :  // <0762> swapra = nop

// :power_hold_msg // = 0x0a38
// "PWH\x0"
addr == 16'ha38 ? 16'h5750 :  // <0764> WP
addr == 16'ha39 ? 16'h0048 :  // <0764>  H

// ######## func check_power_relay // = 0x0a3a
addr == 16'ha3a ? 16'h303e :  // <0774> push rtna // func check_power_relay

addr == 16'ha3b ? 16'h6600 :  // <0767> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'ha3c ? 16'h6a14 :  // <0767> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'ha3d ? 16'h0017 :  // <0767> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'ha3e ? 16'h0018 :  // <0767> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'ha3f ? 16'h6600 :  // <0768> ram b = $ram_relay_hold_at_pass // av_ad_hi = 0
addr == 16'ha40 ? 16'h6a3e :  // <0768> ram b = $ram_relay_hold_at_pass // av_ad_lo = 62
addr == 16'ha41 ? 16'h0417 :  // <0768> ram b = $ram_relay_hold_at_pass // b = av_write_data // start read cycle
addr == 16'ha42 ? 16'h0418 :  // <0768> ram b = $ram_relay_hold_at_pass // b = av_read_data // finish read cycle

addr == 16'ha43 ? 16'h0000 :  // <0773> a = a
addr == 16'ha44 ? 16'h0401 :  // <0773> b = b

addr == 16'ha45 ? 16'he407 :  // <0769> bn eq :else_2629
addr == 16'ha46 ? 16'h0a4d :  // <0769> "

// time to begin "solenoid saver" coil power reduction by PWM.
addr == 16'ha47 ? 16'h8a19 :  // <0771> power_duty = $power_duty_holding
addr == 16'ha48 ? 16'h23a0 :  // <0772> pa = :power_hold_msg
addr == 16'ha49 ? 16'h0a38 :  // <0772> "
addr == 16'ha4a ? 16'hfba0 :  // <0772> callx  set_text_flag  :power_hold_msg
addr == 16'ha4b ? 16'h0ac5 :  // <0772> "
addr == 16'ha4c ? 16'hfc00 :  // <0772> "


addr == 16'ha4d ? 16'hf80c :  // <0775> pop rtna // func check_power_relay
addr == 16'ha4e ? 16'hfc00 :  // <0775> swapra = nop

// ######## func check_power_down // = 0x0a4f

// check power-down deadline in RAM.
addr == 16'ha4f ? 16'h6600 :  // <0778> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'ha50 ? 16'h6a40 :  // <0778> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'ha51 ? 16'h0017 :  // <0778> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'ha52 ? 16'h0018 :  // <0778> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'ha53 ? 16'h6600 :  // <0779> ram b = $ram_power_down_at_min // av_ad_hi = 0
addr == 16'ha54 ? 16'h6a3c :  // <0779> ram b = $ram_power_down_at_min // av_ad_lo = 60
addr == 16'ha55 ? 16'h0417 :  // <0779> ram b = $ram_power_down_at_min // b = av_write_data // start read cycle
addr == 16'ha56 ? 16'h0418 :  // <0779> ram b = $ram_power_down_at_min // b = av_read_data // finish read cycle

addr == 16'ha57 ? 16'h0000 :  // <0782> a = a
addr == 16'ha58 ? 16'h0401 :  // <0782> b = b

addr == 16'ha59 ? 16'he407 :  // <0780> bn eq :else_2649
addr == 16'ha5a ? 16'h0a5d :  // <0780> "

addr == 16'ha5b ? 16'he00f :  // <0781> jmp :power_down
addr == 16'ha5c ? 16'h0a5e :  // <0781> "


addr == 16'ha5d ? 16'hfc00 :  // <0784> swapra = nop

// :power_down // = 0x0a5e
// this code never returns.
addr == 16'ha5e ? 16'hfba0 :  // <0787> callx  save_persistent_data
addr == 16'ha5f ? 16'h0a66 :  // <0787> "
addr == 16'ha60 ? 16'hfc00 :  // <0787> "
addr == 16'ha61 ? 16'h8a32 :  // <0788> power_duty = $power_duty_opening
addr == 16'ha62 ? 16'h7fa0 :  // <0789> error_halt_code $err_power_down // leds = 0xfffc
addr == 16'ha63 ? 16'hfffc :  // <0789> "
addr == 16'ha64 ? 16'he00f :  // <0789> error_halt_code $err_power_down
addr == 16'ha65 ? 16'h0a64 :  // <0789> "

// ######## func save_persistent_data // = 0x0a66


addr == 16'ha66 ? 16'hfc00 :  // <0793> swapra = nop

// ######## func check_communication // = 0x0a67
addr == 16'ha67 ? 16'h303e :  // <0813> push rtna // func check_communication

addr == 16'ha68 ? 16'h6600 :  // <0795> ram a = $ram_ftdi_downtime_remain_sec // av_ad_hi = 0
addr == 16'ha69 ? 16'h6a12 :  // <0795> ram a = $ram_ftdi_downtime_remain_sec // av_ad_lo = 18
addr == 16'ha6a ? 16'h0017 :  // <0795> ram a = $ram_ftdi_downtime_remain_sec // a = av_write_data // start read cycle
addr == 16'ha6b ? 16'h0018 :  // <0795> ram a = $ram_ftdi_downtime_remain_sec // a = av_read_data // finish read cycle

addr == 16'ha6c ? 16'h0000 :  // <0803> a = a
addr == 16'ha6d ? 16'h0600 :  // <0803> b = 0

addr == 16'ha6e ? 16'he007 :  // <0796> br eq :else_2670
addr == 16'ha6f ? 16'h0a7d :  // <0796> "

addr == 16'ha70 ? 16'h0760 :  // <0797> b = -1
addr == 16'ha71 ? 16'hc800 :  // <0798> a = a+b
addr == 16'ha72 ? 16'h0300 :  // <0798> "
addr == 16'ha73 ? 16'h6600 :  // <0799> ram $ram_ftdi_downtime_remain_sec = a // av_ad_hi = 0
addr == 16'ha74 ? 16'h6a12 :  // <0799> ram $ram_ftdi_downtime_remain_sec = a // av_ad_lo = 18
addr == 16'ha75 ? 16'h5c00 :  // <0799> ram $ram_ftdi_downtime_remain_sec = a // av_write_data = a

addr == 16'ha76 ? 16'h0000 :  // <0802> a = a
addr == 16'ha77 ? 16'h0600 :  // <0802> b = 0

addr == 16'ha78 ? 16'he407 :  // <0800> bn eq :else_2680
addr == 16'ha79 ? 16'h0a7d :  // <0800> "

addr == 16'ha7a ? 16'hfba0 :  // <0801> callx  ftdi_power_on
addr == 16'ha7b ? 16'h0ab1 :  // <0801> "
addr == 16'ha7c ? 16'hfc00 :  // <0801> "



addr == 16'ha7d ? 16'h6600 :  // <0805> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'ha7e ? 16'h6a40 :  // <0805> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'ha7f ? 16'h0017 :  // <0805> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'ha80 ? 16'h0018 :  // <0805> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'ha81 ? 16'h6600 :  // <0806> ram b = $ram_comm_restart_at_min // av_ad_hi = 0
addr == 16'ha82 ? 16'h6a10 :  // <0806> ram b = $ram_comm_restart_at_min // av_ad_lo = 16
addr == 16'ha83 ? 16'h0417 :  // <0806> ram b = $ram_comm_restart_at_min // b = av_write_data // start read cycle
addr == 16'ha84 ? 16'h0418 :  // <0806> ram b = $ram_comm_restart_at_min // b = av_read_data // finish read cycle

addr == 16'ha85 ? 16'h0000 :  // <0812> a = a
addr == 16'ha86 ? 16'h0401 :  // <0812> b = b

addr == 16'ha87 ? 16'he407 :  // <0807> bn eq :else_2695
addr == 16'ha88 ? 16'h0a92 :  // <0807> "

// comm restart is required.
addr == 16'ha89 ? 16'hfba0 :  // <0809> callx  postpone_comm_restart
addr == 16'ha8a ? 16'h0a94 :  // <0809> "
addr == 16'ha8b ? 16'hfc00 :  // <0809> "
addr == 16'ha8c ? 16'h6600 :  // <0810> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_hi = 0
addr == 16'ha8d ? 16'h6a12 :  // <0810> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_lo = 18
addr == 16'ha8e ? 16'h5e05 :  // <0810> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_write_data = 5
addr == 16'ha8f ? 16'hfba0 :  // <0811> callx  ftdi_power_off
addr == 16'ha90 ? 16'h0aa1 :  // <0811> "
addr == 16'ha91 ? 16'hfc00 :  // <0811> "


addr == 16'ha92 ? 16'hf80c :  // <0814> pop rtna // func check_communication
addr == 16'ha93 ? 16'hfc00 :  // <0814> swapra = nop

// ######## func postpone_comm_restart // = 0x0a94

addr == 16'ha94 ? 16'h6600 :  // <0816> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'ha95 ? 16'h6a40 :  // <0816> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'ha96 ? 16'h0017 :  // <0816> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'ha97 ? 16'h0018 :  // <0816> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'ha98 ? 16'h0602 :  // <0817> b = $comm_grace_period_min
addr == 16'ha99 ? 16'h6600 :  // <0818> ram $ram_comm_restart_at_min = a+b // av_ad_hi = 0
addr == 16'ha9a ? 16'h6a10 :  // <0818> ram $ram_comm_restart_at_min = a+b // av_ad_lo = 16
addr == 16'ha9b ? 16'hc800 :  // <0818> ram $ram_comm_restart_at_min = a+b // av_write_data = a+b
addr == 16'ha9c ? 16'h5f00 :  // <0818> "

addr == 16'ha9d ? 16'hfc00 :  // <0820> swapra = nop

// :ftdi_off_msg // = 0x0a9e
// "FTOF\x0"
addr == 16'ha9e ? 16'h5446 :  // <0822> TF
addr == 16'ha9f ? 16'h464f :  // <0822> FO
addr == 16'haa0 ? 16'h0000 :  // <0822>   

// ######## func ftdi_power_off // = 0x0aa1
addr == 16'haa1 ? 16'h303e :  // <0829> push rtna // func ftdi_power_off

addr == 16'haa2 ? 16'h0020 :  // <0825> a = board_ctrl
addr == 16'haa3 ? 16'h07a0 :  // <0826> b = $not_ftdi_power_mask
addr == 16'haa4 ? 16'hff7f :  // <0826> "
addr == 16'haa5 ? 16'hc800 :  // <0827> board_ctrl = and
addr == 16'haa6 ? 16'h8330 :  // <0827> "
addr == 16'haa7 ? 16'h23a0 :  // <0828> pa = :ftdi_off_msg
addr == 16'haa8 ? 16'h0a9e :  // <0828> "
addr == 16'haa9 ? 16'hfba0 :  // <0828> callx  set_text_flag  :ftdi_off_msg
addr == 16'haaa ? 16'h0ac5 :  // <0828> "
addr == 16'haab ? 16'hfc00 :  // <0828> "

addr == 16'haac ? 16'hf80c :  // <0830> pop rtna // func ftdi_power_off
addr == 16'haad ? 16'hfc00 :  // <0830> swapra = nop

// :ftdi_on_msg // = 0x0aae
// "FTON\x0"
addr == 16'haae ? 16'h5446 :  // <0832> TF
addr == 16'haaf ? 16'h4e4f :  // <0832> NO
addr == 16'hab0 ? 16'h0000 :  // <0832>   

// ######## func ftdi_power_on // = 0x0ab1
addr == 16'hab1 ? 16'h303e :  // <0839> push rtna // func ftdi_power_on

addr == 16'hab2 ? 16'h0020 :  // <0835> a = board_ctrl
addr == 16'hab3 ? 16'h0680 :  // <0836> b = $ftdi_power_mask
addr == 16'hab4 ? 16'hc800 :  // <0837> board_ctrl = or
addr == 16'hab5 ? 16'h8334 :  // <0837> "
addr == 16'hab6 ? 16'h23a0 :  // <0838> pa = :ftdi_on_msg
addr == 16'hab7 ? 16'h0aae :  // <0838> "
addr == 16'hab8 ? 16'hfba0 :  // <0838> callx  set_text_flag  :ftdi_on_msg
addr == 16'hab9 ? 16'h0ac5 :  // <0838> "
addr == 16'haba ? 16'hfc00 :  // <0838> "

addr == 16'habb ? 16'hf80c :  // <0840> pop rtna // func ftdi_power_on
addr == 16'habc ? 16'hfc00 :  // <0840> swapra = nop

// ######## func clear_ram_page // = 0x0abd

addr == 16'habd ? 16'h0200 :  // <0842> a = 0
addr == 16'habe ? 16'h0602 :  // <0843> b = 2
// :clear_next_word // = 0x0abf
addr == 16'habf ? 16'h6800 :  // <0845> av_ad_lo = a
addr == 16'hac0 ? 16'h5e00 :  // <0846> av_write_data = 0
addr == 16'hac1 ? 16'h0300 :  // <0847> a = ad0
addr == 16'hac2 ? 16'he400 :  // <0848> bn az :clear_next_word
addr == 16'hac3 ? 16'h0abf :  // <0848> "

addr == 16'hac4 ? 16'hfc00 :  // <0850> swapra = nop

// ######## func set_text_flag // = 0x0ac5

addr == 16'hac5 ? 16'h0408 :  // <0852> b = flag_addr
addr == 16'hac6 ? 16'h6600 :  // <0853> ram a = $ram_next_tfp_idx // av_ad_hi = 0
addr == 16'hac7 ? 16'h6a56 :  // <0853> ram a = $ram_next_tfp_idx // av_ad_lo = 86
addr == 16'hac8 ? 16'h0017 :  // <0853> ram a = $ram_next_tfp_idx // a = av_write_data // start read cycle
addr == 16'hac9 ? 16'h0018 :  // <0853> ram a = $ram_next_tfp_idx // a = av_read_data // finish read cycle

addr == 16'haca ? 16'h0351 :  // <0854> a = a<<1
addr == 16'hacb ? 16'h3001 :  // <0854> push b // push b
addr == 16'hacc ? 16'h0646 :  // <0854> b = 70
addr == 16'hacd ? 16'h6600 :  // <0854> av_ad_hi = 0
addr == 16'hace ? 16'h6b00 :  // <0854> av_ad_lo = ad0
addr == 16'hacf ? 16'h5c0c :  // <0854> pop av_write_data // pop av_write_data

addr == 16'had0 ? 16'h0008 :  // <0855> a = flag_addr
addr == 16'had1 ? 16'h0760 :  // <0856> b = -1
addr == 16'had2 ? 16'hc800 :  // <0857> a = a+b
addr == 16'had3 ? 16'h0300 :  // <0857> "
addr == 16'had4 ? 16'h0607 :  // <0858> b = $tfp_mask
addr == 16'had5 ? 16'h6600 :  // <0859> ram $ram_next_tfp_idx = and // av_ad_hi = 0
addr == 16'had6 ? 16'h6a56 :  // <0859> ram $ram_next_tfp_idx = and // av_ad_lo = 86
addr == 16'had7 ? 16'hc800 :  // <0859> ram $ram_next_tfp_idx = and // av_write_data = and
addr == 16'had8 ? 16'h5f30 :  // <0859> "

addr == 16'had9 ? 16'hfc00 :  // <0861> swapra = nop

// ######## func unique_text_flag // = 0x0ada
addr == 16'hada ? 16'h3002 :  // <0872> push i // func unique_text_flag
addr == 16'hadb ? 16'h303e :  // <0872> push rtna // "

addr == 16'hadc ? 16'h0a00 :  // <0869> i = 0
// :loop_2780 // = 0x0add

addr == 16'hadd ? 16'h0002 :  // <0863> a = i

addr == 16'hade ? 16'h0351 :  // <0864> a = a<<1
addr == 16'hadf ? 16'h0646 :  // <0864> b = 70
addr == 16'hae0 ? 16'h6600 :  // <0864> av_ad_hi = 0
addr == 16'hae1 ? 16'h6b00 :  // <0864> av_ad_lo = ad0
addr == 16'hae2 ? 16'h0417 :  // <0864> b = av_begin_read
addr == 16'hae3 ? 16'h0418 :  // <0864> b = av_read_data


addr == 16'hae4 ? 16'h0001 :  // <0867> a = b
addr == 16'hae5 ? 16'h0408 :  // <0867> b = flag_addr

addr == 16'hae6 ? 16'he407 :  // <0865> bn eq :else_2790
addr == 16'hae7 ? 16'h0aea :  // <0865> "

addr == 16'hae8 ? 16'he00f :  // <0866> jmp :skip
addr == 16'hae9 ? 16'h0af6 :  // <0866> "



addr == 16'haea ? 16'h0002 :  // <0869> a = i
addr == 16'haeb ? 16'h0601 :  // <0869> b = 1
addr == 16'haec ? 16'hc800 :  // <0869> i = a+b
addr == 16'haed ? 16'h0b00 :  // <0869> "


addr == 16'haee ? 16'h0002 :  // <0869> a = i
addr == 16'haef ? 16'h0608 :  // <0869> b = $num_text_flag_pointers
addr == 16'haf0 ? 16'he005 :  // <0869> br lt :loop_2780
addr == 16'haf1 ? 16'h0add :  // <0869> "

// :end_2780 // = 0x0af2
addr == 16'haf2 ? 16'h2008 :  // <0870> pa = flag_addr
addr == 16'haf3 ? 16'hfba0 :  // <0870> callx  set_text_flag  flag_addr
addr == 16'haf4 ? 16'h0ac5 :  // <0870> "
addr == 16'haf5 ? 16'hfc00 :  // <0870> "
// :skip // = 0x0af6

addr == 16'haf6 ? 16'hf80c :  // <0873> pop rtna // func unique_text_flag
addr == 16'haf7 ? 16'h080c :  // <0873> pop i // "
addr == 16'haf8 ? 16'hfc00 :  // <0873> swapra = nop

// :text_flags_msg // = 0x0af9
// " tf=\x0"
addr == 16'haf9 ? 16'h7420 :  // <0875> t 
addr == 16'hafa ? 16'h3d66 :  // <0875> =f
addr == 16'hafb ? 16'h0000 :  // <0875>   

// ######## func report_text_flags // = 0x0afc
addr == 16'hafc ? 16'h3002 :  // <0891> push i // func report_text_flags
addr == 16'hafd ? 16'h303e :  // <0891> push rtna // "

addr == 16'hafe ? 16'h03a0 :  // <0878> a = :text_flags_msg
addr == 16'haff ? 16'h0af9 :  // <0878> "
addr == 16'hb00 ? 16'hfba0 :  // <0879> call :print_nt
addr == 16'hb01 ? 16'h015f :  // <0879> "
addr == 16'hb02 ? 16'hfc00 :  // <0879> "
addr == 16'hb03 ? 16'h0a00 :  // <0890> i = 0
// :loop_2819 // = 0x0b04

addr == 16'hb04 ? 16'h0002 :  // <0880> a = i

addr == 16'hb05 ? 16'h0351 :  // <0881> a = a<<1
addr == 16'hb06 ? 16'h0646 :  // <0881> b = 70
addr == 16'hb07 ? 16'h6600 :  // <0881> av_ad_hi = 0
addr == 16'hb08 ? 16'h6b00 :  // <0881> av_ad_lo = ad0
addr == 16'hb09 ? 16'h0417 :  // <0881> b = av_begin_read
addr == 16'hb0a ? 16'h0418 :  // <0881> b = av_read_data


addr == 16'hb0b ? 16'h0001 :  // <0888> a = b
addr == 16'hb0c ? 16'h0600 :  // <0888> b = 0

addr == 16'hb0d ? 16'he007 :  // <0882> br eq :else_2829
addr == 16'hb0e ? 16'h0b1e :  // <0882> "

addr == 16'hb0f ? 16'hfba0 :  // <0883> call :print_nt
addr == 16'hb10 ? 16'h015f :  // <0883> "
addr == 16'hb11 ? 16'hfc00 :  // <0883> "
addr == 16'hb12 ? 16'h022c :  // <0884> a = 44 // putasc ","
addr == 16'hb13 ? 16'hfba0 :  // <0884> putasc ","
addr == 16'hb14 ? 16'h00ab :  // <0884> "
addr == 16'hb15 ? 16'hfc00 :  // <0884> "
addr == 16'hb16 ? 16'h0002 :  // <0885> a = i
addr == 16'hb17 ? 16'h0600 :  // <0886> b = 0

addr == 16'hb18 ? 16'h0351 :  // <0887> a = a<<1
addr == 16'hb19 ? 16'h3001 :  // <0887> push b // push b
addr == 16'hb1a ? 16'h0646 :  // <0887> b = 70
addr == 16'hb1b ? 16'h6600 :  // <0887> av_ad_hi = 0
addr == 16'hb1c ? 16'h6b00 :  // <0887> av_ad_lo = ad0
addr == 16'hb1d ? 16'h5c0c :  // <0887> pop av_write_data // pop av_write_data




addr == 16'hb1e ? 16'h0002 :  // <0890> a = i
addr == 16'hb1f ? 16'h0601 :  // <0890> b = 1
addr == 16'hb20 ? 16'hc800 :  // <0890> i = a+b
addr == 16'hb21 ? 16'h0b00 :  // <0890> "


addr == 16'hb22 ? 16'h0002 :  // <0890> a = i
addr == 16'hb23 ? 16'h0608 :  // <0890> b = $num_text_flag_pointers
addr == 16'hb24 ? 16'he005 :  // <0890> br lt :loop_2819
addr == 16'hb25 ? 16'h0b04 :  // <0890> "

// :end_2819 // = 0x0b26

addr == 16'hb26 ? 16'hf80c :  // <0892> pop rtna // func report_text_flags
addr == 16'hb27 ? 16'h080c :  // <0892> pop i // "
addr == 16'hb28 ? 16'hfc00 :  // <0892> swapra = nop

// :plan_msg // = 0x0b29
// " pl=\x0"
addr == 16'hb29 ? 16'h7020 :  // <0894> p 
addr == 16'hb2a ? 16'h3d6c :  // <0894> =l
addr == 16'hb2b ? 16'h0000 :  // <0894>   
// :manual_trim_msg // = 0x0b2c
// " mt=\x0"
addr == 16'hb2c ? 16'h6d20 :  // <0896> m 
addr == 16'hb2d ? 16'h3d74 :  // <0896> =t
addr == 16'hb2e ? 16'h0000 :  // <0896>   

// ######## func report_plan // = 0x0b2f
addr == 16'hb2f ? 16'h303e :  // <0908> push rtna // func report_plan

addr == 16'hb30 ? 16'h03a0 :  // <0899> a = :plan_msg
addr == 16'hb31 ? 16'h0b29 :  // <0899> "
addr == 16'hb32 ? 16'hfba0 :  // <0900> call :print_nt
addr == 16'hb33 ? 16'h015f :  // <0900> "
addr == 16'hb34 ? 16'hfc00 :  // <0900> "
addr == 16'hb35 ? 16'h6600 :  // <0901> ram a = $ram_plan_name // av_ad_hi = 0
addr == 16'hb36 ? 16'h6a88 :  // <0901> ram a = $ram_plan_name // av_ad_lo = 136
addr == 16'hb37 ? 16'h0017 :  // <0901> ram a = $ram_plan_name // a = av_write_data // start read cycle
addr == 16'hb38 ? 16'h0018 :  // <0901> ram a = $ram_plan_name // a = av_read_data // finish read cycle
addr == 16'hb39 ? 16'hfba0 :  // <0902> call :print_nt
addr == 16'hb3a ? 16'h015f :  // <0902> "
addr == 16'hb3b ? 16'hfc00 :  // <0902> "

addr == 16'hb3c ? 16'h03a0 :  // <0904> a = :manual_trim_msg
addr == 16'hb3d ? 16'h0b2c :  // <0904> "
addr == 16'hb3e ? 16'hfba0 :  // <0905> call :print_nt
addr == 16'hb3f ? 16'h015f :  // <0905> "
addr == 16'hb40 ? 16'hfc00 :  // <0905> "
addr == 16'hb41 ? 16'h6600 :  // <0906> ram a = $ram_run_manual_trim // av_ad_hi = 0
addr == 16'hb42 ? 16'h6aaa :  // <0906> ram a = $ram_run_manual_trim // av_ad_lo = 170
addr == 16'hb43 ? 16'h0017 :  // <0906> ram a = $ram_run_manual_trim // a = av_write_data // start read cycle
addr == 16'hb44 ? 16'h0018 :  // <0906> ram a = $ram_run_manual_trim // a = av_read_data // finish read cycle
addr == 16'hb45 ? 16'hfba0 :  // <0907> call :put4x
addr == 16'hb46 ? 16'h00d3 :  // <0907> "
addr == 16'hb47 ? 16'hfc00 :  // <0907> "

addr == 16'hb48 ? 16'hf80c :  // <0909> pop rtna // func report_plan
addr == 16'hb49 ? 16'hfc00 :  // <0909> swapra = nop

// ######## func interpret_maf // = 0x0b4a
addr == 16'hb4a ? 16'h3002 :  // <0942> push i // func interpret_maf
addr == 16'hb4b ? 16'h3004 :  // <0942> push x // "

// offset and clamp the MAF ADC count to 0..511.
addr == 16'hb4c ? 16'h0204 :  // <0912> a = $maf_adc_channel

addr == 16'hb4d ? 16'h0351 :  // <0913> a = a<<1
addr == 16'hb4e ? 16'h0626 :  // <0913> b = 38
addr == 16'hb4f ? 16'h6600 :  // <0913> av_ad_hi = 0
addr == 16'hb50 ? 16'h6b00 :  // <0913> av_ad_lo = ad0
addr == 16'hb51 ? 16'h0417 :  // <0913> b = av_begin_read
addr == 16'hb52 ? 16'h0418 :  // <0913> b = av_read_data

addr == 16'hb53 ? 16'h0001 :  // <0914> a = b
addr == 16'hb54 ? 16'h0350 :  // <0915> a = a>>1
addr == 16'hb55 ? 16'h07a0 :  // <0916> b = 0x01ff
addr == 16'hb56 ? 16'h01ff :  // <0916> "
//patch: do some averaging here, like interpret_tps.
addr == 16'hb57 ? 16'hc800 :  // <0918> x = and
addr == 16'hb58 ? 16'h1330 :  // <0918> "
addr == 16'hb59 ? 16'h6600 :  // <0919> ram $ram_maf_adc_filtered = and // av_ad_hi = 0
addr == 16'hb5a ? 16'h6a98 :  // <0919> ram $ram_maf_adc_filtered = and // av_ad_lo = 152
addr == 16'hb5b ? 16'hc800 :  // <0919> ram $ram_maf_adc_filtered = and // av_write_data = and
addr == 16'hb5c ? 16'h5f30 :  // <0919> "

// recover linear flow from MAF ADC count using hi-res method,
// for actual flow feeding into final puff multiply later.
// 256 cell Brute-force lookup might take e.g. 80us to run.  That's 4 jf,
// or 5% of ignition cycle at max RPM.
addr == 16'hb5d ? 16'h6600 :  // <0925> ram $ram_maf_valid = 0 // av_ad_hi = 0
addr == 16'hb5e ? 16'h6a96 :  // <0925> ram $ram_maf_valid = 0 // av_ad_lo = 150
addr == 16'hb5f ? 16'h5e00 :  // <0925> ram $ram_maf_valid = 0 // av_write_data = 0
addr == 16'hb60 ? 16'h0a00 :  // <0934> i = 0
// :loop_2912 // = 0x0b61

addr == 16'hb61 ? 16'h0002 :  // <0926> a = i

addr == 16'hb62 ? 16'h0351 :  // <0927> a = a<<1
addr == 16'hb63 ? 16'h07a0 :  // <0927> b = 2048
addr == 16'hb64 ? 16'h0800 :  // <0927> "
addr == 16'hb65 ? 16'h67a0 :  // <0927> av_ad_hi = 256
addr == 16'hb66 ? 16'h0100 :  // <0927> "
addr == 16'hb67 ? 16'h6b00 :  // <0927> av_ad_lo = ad0
addr == 16'hb68 ? 16'h0417 :  // <0927> b = av_begin_read
addr == 16'hb69 ? 16'h0418 :  // <0927> b = av_read_data


addr == 16'hb6a ? 16'h0001 :  // <0932> a = b
addr == 16'hb6b ? 16'h0404 :  // <0932> b = x

addr == 16'hb6c ? 16'he406 :  // <0928> bn gt :else_2924
addr == 16'hb6d ? 16'h0b76 :  // <0928> "

addr == 16'hb6e ? 16'h6600 :  // <0929> ram $ram_maf_flow_hi_res = i // av_ad_hi = 0
addr == 16'hb6f ? 16'h6a9a :  // <0929> ram $ram_maf_flow_hi_res = i // av_ad_lo = 154
addr == 16'hb70 ? 16'h5c02 :  // <0929> ram $ram_maf_flow_hi_res = i // av_write_data = i
addr == 16'hb71 ? 16'h6600 :  // <0930> ram $ram_maf_valid = 1 // av_ad_hi = 0
addr == 16'hb72 ? 16'h6a96 :  // <0930> ram $ram_maf_valid = 1 // av_ad_lo = 150
addr == 16'hb73 ? 16'h5e01 :  // <0930> ram $ram_maf_valid = 1 // av_write_data = 1
addr == 16'hb74 ? 16'he00f :  // <0931> jmp :maf_done
addr == 16'hb75 ? 16'h0b7f :  // <0931> "



addr == 16'hb76 ? 16'h0002 :  // <0934> a = i
addr == 16'hb77 ? 16'h0601 :  // <0934> b = 1
addr == 16'hb78 ? 16'hc800 :  // <0934> i = a+b
addr == 16'hb79 ? 16'h0b00 :  // <0934> "


addr == 16'hb7a ? 16'h0002 :  // <0934> a = i
addr == 16'hb7b ? 16'h07a0 :  // <0934> b = $maf_ref_num_cells
addr == 16'hb7c ? 16'h0100 :  // <0934> "
addr == 16'hb7d ? 16'he005 :  // <0934> br lt :loop_2912
addr == 16'hb7e ? 16'h0b61 :  // <0934> "

// :end_2912 // = 0x0b7f
// :maf_done // = 0x0b7f

// quantize linear flow from hi-res to lo-res for indexing into AFRC map rows.
// Lo-res = hi-res >> 2.
addr == 16'hb7f ? 16'h6600 :  // <0939> ram a = $ram_maf_flow_hi_res // av_ad_hi = 0
addr == 16'hb80 ? 16'h6a9a :  // <0939> ram a = $ram_maf_flow_hi_res // av_ad_lo = 154
addr == 16'hb81 ? 16'h0017 :  // <0939> ram a = $ram_maf_flow_hi_res // a = av_write_data // start read cycle
addr == 16'hb82 ? 16'h0018 :  // <0939> ram a = $ram_maf_flow_hi_res // a = av_read_data // finish read cycle
addr == 16'hb83 ? 16'h0350 :  // <0940> a = a>>1
addr == 16'hb84 ? 16'h6600 :  // <0941> ram $ram_afrc_maf_row_idx = a>>1 // av_ad_hi = 0
addr == 16'hb85 ? 16'h6a9c :  // <0941> ram $ram_afrc_maf_row_idx = a>>1 // av_ad_lo = 156
addr == 16'hb86 ? 16'h5f50 :  // <0941> ram $ram_afrc_maf_row_idx = a>>1 // av_write_data = a>>1

addr == 16'hb87 ? 16'h100c :  // <0943> pop x // func interpret_maf
addr == 16'hb88 ? 16'h080c :  // <0943> pop i // "
addr == 16'hb89 ? 16'hfc00 :  // <0943> swapra = nop

// ######## func interpret_tps // = 0x0b8a
addr == 16'hb8a ? 16'h3002 :  // <0971> push i // func interpret_tps
addr == 16'hb8b ? 16'h3004 :  // <0971> push x // "
addr == 16'hb8c ? 16'h3005 :  // <0971> push y // "
addr == 16'hb8d ? 16'h3006 :  // <0971> push ga // "
addr == 16'hb8e ? 16'h3007 :  // <0971> push gb // "

addr == 16'hb8f ? 16'h0206 :  // <0945> a = $tps_adc_channel

addr == 16'hb90 ? 16'h0351 :  // <0946> a = a<<1
addr == 16'hb91 ? 16'h0626 :  // <0946> b = 38
addr == 16'hb92 ? 16'h6600 :  // <0946> av_ad_hi = 0
addr == 16'hb93 ? 16'h6b00 :  // <0946> av_ad_lo = ad0
addr == 16'hb94 ? 16'h0417 :  // <0946> b = av_begin_read
addr == 16'hb95 ? 16'h0418 :  // <0946> b = av_read_data

// reverse the scale.
addr == 16'hb96 ? 16'h03a0 :  // <0948> a = 0x0fff
addr == 16'hb97 ? 16'h0fff :  // <0948> "
addr == 16'hb98 ? 16'hc800 :  // <0949> b = xor
addr == 16'hb99 ? 16'h0738 :  // <0949> "
// memorize reading into slot 0 and shift history up 1 slot.  total up as we go.
addr == 16'hb9a ? 16'h1801 :  // <0951> ga = b
addr == 16'hb9b ? 16'h1200 :  // <0952> x = 0
addr == 16'hb9c ? 16'h0a00 :  // <0963> i = 0
// :loop_2972 // = 0x0b9d

addr == 16'hb9d ? 16'h0002 :  // <0953> a = i

addr == 16'hb9e ? 16'h0351 :  // <0954> a = a<<1
addr == 16'hb9f ? 16'h06b0 :  // <0954> b = 176
addr == 16'hba0 ? 16'h6600 :  // <0954> av_ad_hi = 0
addr == 16'hba1 ? 16'h6b00 :  // <0954> av_ad_lo = ad0
addr == 16'hba2 ? 16'h0417 :  // <0954> b = av_begin_read
addr == 16'hba3 ? 16'h0418 :  // <0954> b = av_read_data

addr == 16'hba4 ? 16'h1c01 :  // <0955> gb = b
addr == 16'hba5 ? 16'h1401 :  // <0956> y = b
addr == 16'hba6 ? 16'hc800 :  // <0957> x = x+y
addr == 16'hba7 ? 16'h1320 :  // <0957> "
addr == 16'hba8 ? 16'h0002 :  // <0958> a = i
addr == 16'hba9 ? 16'h0406 :  // <0959> b = ga

addr == 16'hbaa ? 16'h0351 :  // <0960> a = a<<1
addr == 16'hbab ? 16'h3001 :  // <0960> push b // push b
addr == 16'hbac ? 16'h06b0 :  // <0960> b = 176
addr == 16'hbad ? 16'h6600 :  // <0960> av_ad_hi = 0
addr == 16'hbae ? 16'h6b00 :  // <0960> av_ad_lo = ad0
addr == 16'hbaf ? 16'h5c0c :  // <0960> pop av_write_data // pop av_write_data

addr == 16'hbb0 ? 16'h1807 :  // <0961> ga = gb


addr == 16'hbb1 ? 16'h0002 :  // <0963> a = i
addr == 16'hbb2 ? 16'h0601 :  // <0963> b = 1
addr == 16'hbb3 ? 16'hc800 :  // <0963> i = a+b
addr == 16'hbb4 ? 16'h0b00 :  // <0963> "


addr == 16'hbb5 ? 16'h0002 :  // <0963> a = i
addr == 16'hbb6 ? 16'h0604 :  // <0963> b = $tps_history_len
addr == 16'hbb7 ? 16'he005 :  // <0963> br lt :loop_2972
addr == 16'hbb8 ? 16'h0b9d :  // <0963> "

// :end_2972 // = 0x0bb9
// memorize average.
addr == 16'hbb9 ? 16'h0004 :  // <0965> a = x
addr == 16'hbba ? 16'h0350 :  // <0966> a = a>>1
addr == 16'hbbb ? 16'h1b50 :  // <0967> ga = a>>1
addr == 16'hbbc ? 16'h6600 :  // <0968> ram $ram_tps_avg = ga // av_ad_hi = 0
addr == 16'hbbd ? 16'h6aae :  // <0968> ram $ram_tps_avg = ga // av_ad_lo = 174
addr == 16'hbbe ? 16'h5c06 :  // <0968> ram $ram_tps_avg = ga // av_write_data = ga

// :end // = 0x0bbf

addr == 16'hbbf ? 16'h1c0c :  // <0972> pop gb // func interpret_tps
addr == 16'hbc0 ? 16'h180c :  // <0972> pop ga // "
addr == 16'hbc1 ? 16'h140c :  // <0972> pop y // "
addr == 16'hbc2 ? 16'h100c :  // <0972> pop x // "
addr == 16'hbc3 ? 16'h080c :  // <0972> pop i // "
addr == 16'hbc4 ? 16'hfc00 :  // <0972> swapra = nop

// ######## func jf_to_rpm // = 0x0bc5
addr == 16'hbc5 ? 16'h303e :  // <0982> push rtna // func jf_to_rpm

// resolution = 32 rpm.
addr == 16'hbc6 ? 16'h0408 :  // <0975> b = jiffies
addr == 16'hbc7 ? 16'h03a0 :  // <0976> a = 0x5573
addr == 16'hbc8 ? 16'h5573 :  // <0976> "
// = 700000 >> 5
addr == 16'hbc9 ? 16'hfba0 :  // <0978> call :divide
addr == 16'hbca ? 16'h019c :  // <0978> "
addr == 16'hbcb ? 16'hfc00 :  // <0978> "
addr == 16'hbcc ? 16'h0001 :  // <0979> a = b
addr == 16'hbcd ? 16'h0352 :  // <0980> a = a<<4
addr == 16'hbce ? 16'h2351 :  // <0981> rpm = a<<1

addr == 16'hbcf ? 16'hf80c :  // <0983> pop rtna // func jf_to_rpm
addr == 16'hbd0 ? 16'hfc00 :  // <0983> swapra = nop

// ######## func check_engine_stop // = 0x0bd1
addr == 16'hbd1 ? 16'h303e :  // <0999> push rtna // func check_engine_stop

// returns 1 if transitioned to stop, else 0.

// transition to plan_stop if ignition switch is turned off AND rpm estimate is invalid.
// requiring both conditions prevents spurious noise readings from shutting down the injection.

addr == 16'hbd2 ? 16'h0022 :  // <0997> a = power_duty
addr == 16'hbd3 ? 16'h0680 :  // <0997> b = ( 0x0080 )

addr == 16'hbd4 ? 16'he003 :  // <0989> br and0z :else_3028
addr == 16'hbd5 ? 16'h0be9 :  // <0989> "

addr == 16'hbd6 ? 16'h6600 :  // <0990> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'hbd7 ? 16'h6a7e :  // <0990> ram a = $ram_rpm_valid // av_ad_lo = 126
addr == 16'hbd8 ? 16'h0017 :  // <0990> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'hbd9 ? 16'h0018 :  // <0990> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle

addr == 16'hbda ? 16'h0000 :  // <0996> a = a
addr == 16'hbdb ? 16'h0600 :  // <0996> b = 0

addr == 16'hbdc ? 16'he407 :  // <0991> bn eq :else_3036
addr == 16'hbdd ? 16'h0be9 :  // <0991> "

addr == 16'hbde ? 16'h6600 :  // <0992> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'hbdf ? 16'h6a8e :  // <0992> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'hbe0 ? 16'hf817 :  // <0992> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'hbe1 ? 16'hf818 :  // <0992> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'hbe2 ? 16'hfc00 :  // <0993> swapra = nop
addr == 16'hbe3 ? 16'hfba0 :  // <0995> callx  init_plan_stop
addr == 16'hbe4 ? 16'h0437 :  // <0995> "
addr == 16'hbe5 ? 16'hfc00 :  // <0995> "
addr == 16'hbe6 ? 16'h2201 :  // <0996> did_stop = 1
addr == 16'hbe7 ? 16'hf80c :  // <0996> pop rtna // rtn 1
addr == 16'hbe8 ? 16'hfc00 :  // <0995> swapra = nop


addr == 16'hbe9 ? 16'h2200 :  // <0998> did_stop = 0
addr == 16'hbea ? 16'hf80c :  // <0998> pop rtna // rtn 0
addr == 16'hbeb ? 16'hfc00 :  // <0997> swapra = nop

addr == 16'hbec ? 16'hf80c :  // <1000> pop rtna // func check_engine_stop
addr == 16'hbed ? 16'hfc00 :  // <1000> swapra = nop


        
                16'hxxxx;
        endmodule
    
