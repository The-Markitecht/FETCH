
        `include "header.v"

        module target_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.

addr == 16'h00 ? 16'he00f :  // <0004> jmp :main
addr == 16'h01 ? 16'h05db :  // <0004> "


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
addr == 16'h9f ? 16'h0606 :  // <0006> "
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
addr == 16'h266 ? 16'h3002 :  // <0036> push i // func init_drom

// copy entire ROM content to a shadow area in RAM.
addr == 16'h267 ? 16'h67a0 :  // <0030> av_ad_hi = ($drom_shadow_base >> 16)
addr == 16'h268 ? 16'h0100 :  // <0030> "
addr == 16'h269 ? 16'h0a00 :  // <0035> i = 0
// :loop_617 // = 0x026a

addr == 16'h26a ? 16'h6c02 :  // <0031> drom_ad = i
addr == 16'h26b ? 16'h6802 :  // <0032> av_ad_lo = i
addr == 16'h26c ? 16'h5c1c :  // <0033> av_write_data = drom_data


addr == 16'h26d ? 16'h0002 :  // <0035> a = i
addr == 16'h26e ? 16'h0601 :  // <0035> b = 1
addr == 16'h26f ? 16'hc800 :  // <0035> i = a+b
addr == 16'h270 ? 16'h0b00 :  // <0035> "


addr == 16'h271 ? 16'h0002 :  // <0035> a = i
addr == 16'h272 ? 16'h07a0 :  // <0035> b = $drom_shadow_len_bytes
addr == 16'h273 ? 16'h0b20 :  // <0035> "
addr == 16'h274 ? 16'he005 :  // <0035> br lt :loop_617
addr == 16'h275 ? 16'h026a :  // <0035> "

// :end_617 // = 0x0276

addr == 16'h276 ? 16'h080c :  // <0037> pop i // func init_drom
addr == 16'h277 ? 16'hfc00 :  // <0037> swapra = nop



// when commands share a common suffix, the longer command must come FIRST here.
// :cmd_table // = 0x0278
// "  hello"
addr == 16'h278 ? 16'h2020 :  // <0006>   
addr == 16'h279 ? 16'h6568 :  // <0006> eh
addr == 16'h27a ? 16'h6c6c :  // <0006> ll
addr == 16'h27b ? 16'h006f :  // <0006>  o
addr == 16'h27c ? 16'h0322 :  // <0007> ([label hello_cmd])
// "  plstp"
addr == 16'h27d ? 16'h2020 :  // <0008>   
addr == 16'h27e ? 16'h6c70 :  // <0008> lp
addr == 16'h27f ? 16'h7473 :  // <0008> ts
addr == 16'h280 ? 16'h0070 :  // <0008>  p
addr == 16'h281 ? 16'h0326 :  // <0009> ([label set_plan_stop_cmd])
// "   plcr"
addr == 16'h282 ? 16'h2020 :  // <0010>   
addr == 16'h283 ? 16'h7020 :  // <0010> p 
addr == 16'h284 ? 16'h636c :  // <0010> cl
addr == 16'h285 ? 16'h0072 :  // <0010>  r
addr == 16'h286 ? 16'h0331 :  // <0011> ([label set_plan_crank_cmd])
//"   plwm"
//([label set_plan_warmup_cmd])
// "   plrn"
addr == 16'h287 ? 16'h2020 :  // <0014>   
addr == 16'h288 ? 16'h7020 :  // <0014> p 
addr == 16'h289 ? 16'h726c :  // <0014> rl
addr == 16'h28a ? 16'h006e :  // <0014>  n
addr == 16'h28b ? 16'h033c :  // <0015> ([label set_plan_run_cmd])
//"   plln"
//([label set_plan_learn_cmd])
// " ldafrc"
addr == 16'h28c ? 16'h6c20 :  // <0018> l 
addr == 16'h28d ? 16'h6164 :  // <0018> ad
addr == 16'h28e ? 16'h7266 :  // <0018> rf
addr == 16'h28f ? 16'h0063 :  // <0018>  c
addr == 16'h290 ? 16'h0596 :  // <0019> ([label load_afrc_cmd])
// "   afrc"
addr == 16'h291 ? 16'h2020 :  // <0020>   
addr == 16'h292 ? 16'h6120 :  // <0020> a 
addr == 16'h293 ? 16'h7266 :  // <0020> rf
addr == 16'h294 ? 16'h0063 :  // <0020>  c
addr == 16'h295 ? 16'h0543 :  // <0021> ([label dump_afrc_cmd])
// "      ,"
addr == 16'h296 ? 16'h2020 :  // <0022>   
addr == 16'h297 ? 16'h2020 :  // <0022>   
addr == 16'h298 ? 16'h2020 :  // <0022>   
addr == 16'h299 ? 16'h002c :  // <0022>  ,
addr == 16'h29a ? 16'h03ee :  // <0023> ([label trim_lean_cmd])
// "      ."
addr == 16'h29b ? 16'h2020 :  // <0024>   
addr == 16'h29c ? 16'h2020 :  // <0024>   
addr == 16'h29d ? 16'h2020 :  // <0024>   
addr == 16'h29e ? 16'h002e :  // <0024>  .
addr == 16'h29f ? 16'h03ff :  // <0025> ([label trim_rich_cmd])
// "      \["
addr == 16'h2a0 ? 16'h2020 :  // <0026>   
addr == 16'h2a1 ? 16'h2020 :  // <0026>   
addr == 16'h2a2 ? 16'h2020 :  // <0026>   
addr == 16'h2a3 ? 16'h005b :  // <0026>  [
addr == 16'h2a4 ? 16'h0410 :  // <0027> ([label trim_2lean_cmd])
// "      \]"
addr == 16'h2a5 ? 16'h2020 :  // <0028>   
addr == 16'h2a6 ? 16'h2020 :  // <0028>   
addr == 16'h2a7 ? 16'h2020 :  // <0028>   
addr == 16'h2a8 ? 16'h005d :  // <0028>  ]
addr == 16'h2a9 ? 16'h0421 :  // <0029> ([label trim_2rich_cmd])
// "\x0\x0"
addr == 16'h2aa ? 16'h0000 :  // <0030>   


// ######## func parse_key // = 0x02ab
addr == 16'h2ab ? 16'h3002 :  // <0048> push i // func parse_key
addr == 16'h2ac ? 16'h3004 :  // <0048> push x // "
addr == 16'h2ad ? 16'h3005 :  // <0048> push y // "
addr == 16'h2ae ? 16'h303e :  // <0048> push rtna // "

// memorize into ram_key_buf, pushing down existing content.
addr == 16'h2af ? 16'h1008 :  // <0035> x = key
addr == 16'h2b0 ? 16'h0a07 :  // <0044> i = $key_buf_max
// :loop_688 // = 0x02b1

addr == 16'h2b1 ? 16'h0002 :  // <0036> a = i

addr == 16'h2b2 ? 16'h0351 :  // <0037> a = a<<1
addr == 16'h2b3 ? 16'h0600 :  // <0037> b = 0
addr == 16'h2b4 ? 16'h6600 :  // <0037> av_ad_hi = 0
addr == 16'h2b5 ? 16'h6b00 :  // <0037> av_ad_lo = ad0
addr == 16'h2b6 ? 16'h0417 :  // <0037> b = av_begin_read
addr == 16'h2b7 ? 16'h0418 :  // <0037> b = av_read_data

addr == 16'h2b8 ? 16'h1401 :  // <0038> y = b
addr == 16'h2b9 ? 16'h0002 :  // <0039> a = i
addr == 16'h2ba ? 16'h0404 :  // <0040> b = x

addr == 16'h2bb ? 16'h0351 :  // <0041> a = a<<1
addr == 16'h2bc ? 16'h3001 :  // <0041> push b // push b
addr == 16'h2bd ? 16'h0600 :  // <0041> b = 0
addr == 16'h2be ? 16'h6600 :  // <0041> av_ad_hi = 0
addr == 16'h2bf ? 16'h6b00 :  // <0041> av_ad_lo = ad0
addr == 16'h2c0 ? 16'h5c0c :  // <0041> pop av_write_data // pop av_write_data

addr == 16'h2c1 ? 16'h1005 :  // <0042> x = y


addr == 16'h2c2 ? 16'h0002 :  // <0044> a = i
addr == 16'h2c3 ? 16'h0600 :  // <0044> b = 0
addr == 16'h2c4 ? 16'he007 :  // <0044> br eq :end_688
addr == 16'h2c5 ? 16'h02ce :  // <0044> "


addr == 16'h2c6 ? 16'h0002 :  // <0044> a = i
addr == 16'h2c7 ? 16'h0760 :  // <0044> b = -1
addr == 16'h2c8 ? 16'hc800 :  // <0044> i = a+b
addr == 16'h2c9 ? 16'h0b00 :  // <0044> "


addr == 16'h2ca ? 16'h0002 :  // <0044> a = i
addr == 16'h2cb ? 16'h0600 :  // <0044> b = 0
addr == 16'h2cc ? 16'he405 :  // <0044> bn lt :loop_688
addr == 16'h2cd ? 16'h02b1 :  // <0044> "

// :end_688 // = 0x02ce

addr == 16'h2ce ? 16'h0008 :  // <0047> a = key
addr == 16'h2cf ? 16'h060d :  // <0047> b = 13

addr == 16'h2d0 ? 16'he407 :  // <0045> bn eq :else_720
addr == 16'h2d1 ? 16'h02d5 :  // <0045> "

addr == 16'h2d2 ? 16'hfba0 :  // <0046> callx  parse_command
addr == 16'h2d3 ? 16'h02dc :  // <0046> "
addr == 16'h2d4 ? 16'hfc00 :  // <0046> "


addr == 16'h2d5 ? 16'hf80c :  // <0049> pop rtna // func parse_key
addr == 16'h2d6 ? 16'h140c :  // <0049> pop y // "
addr == 16'h2d7 ? 16'h100c :  // <0049> pop x // "
addr == 16'h2d8 ? 16'h080c :  // <0049> pop i // "
addr == 16'h2d9 ? 16'hfc00 :  // <0049> swapra = nop

// :cmd_ack_msg // = 0x02da
// "OK\x0"
addr == 16'h2da ? 16'h4b4f :  // <0051> KO
addr == 16'h2db ? 16'h0000 :  // <0051>   

// ######## func parse_command // = 0x02dc
addr == 16'h2dc ? 16'h3002 :  // <0092> push i // func parse_command
addr == 16'h2dd ? 16'h3004 :  // <0092> push x // "
addr == 16'h2de ? 16'h3005 :  // <0092> push y // "
addr == 16'h2df ? 16'h303e :  // <0092> push rtna // "

addr == 16'h2e0 ? 16'h13a0 :  // <0054> x = :cmd_table
addr == 16'h2e1 ? 16'h0278 :  // <0054> "
// :next_cmd // = 0x02e2
addr == 16'h2e2 ? 16'hd004 :  // <0056> fetch a from x
addr == 16'h2e3 ? 16'h03b0 :  // <0056> "
addr == 16'h2e4 ? 16'he000 :  // <0057> br az :done
addr == 16'h2e5 ? 16'h031d :  // <0057> "

addr == 16'h2e6 ? 16'h0a00 :  // <0073> i = 0
// :loop_742 // = 0x02e7

addr == 16'h2e7 ? 16'h0002 :  // <0059> a = i
addr == 16'h2e8 ? 16'hfba0 :  // <0060> call :fetch_byte
addr == 16'h2e9 ? 16'h01ec :  // <0060> "
addr == 16'h2ea ? 16'hfc00 :  // <0060> "
addr == 16'h2eb ? 16'h1400 :  // <0061> y = a
addr == 16'h2ec ? 16'h0620 :  // <0062> b = 32 // asc b = " "

addr == 16'h2ed ? 16'h0000 :  // <0071> a = a
addr == 16'h2ee ? 16'h0401 :  // <0071> b = b

addr == 16'h2ef ? 16'he007 :  // <0063> br eq :else_751
addr == 16'h2f0 ? 16'h02fe :  // <0063> "

addr == 16'h2f1 ? 16'h062a :  // <0064> b = 42 // asc b = "*"
addr == 16'h2f2 ? 16'he007 :  // <0065> br eq :matched
addr == 16'h2f3 ? 16'h0306 :  // <0065> "
// parameter character.  succeed early.
addr == 16'h2f4 ? 16'h0002 :  // <0067> a = i

addr == 16'h2f5 ? 16'h0351 :  // <0068> a = a<<1
addr == 16'h2f6 ? 16'h0600 :  // <0068> b = 0
addr == 16'h2f7 ? 16'h6600 :  // <0068> av_ad_hi = 0
addr == 16'h2f8 ? 16'h6b00 :  // <0068> av_ad_lo = ad0
addr == 16'h2f9 ? 16'h0417 :  // <0068> b = av_begin_read
addr == 16'h2fa ? 16'h0418 :  // <0068> b = av_read_data

addr == 16'h2fb ? 16'h0005 :  // <0069> a = y
addr == 16'h2fc ? 16'he407 :  // <0070> bn eq :no_match
addr == 16'h2fd ? 16'h0312 :  // <0070> "



addr == 16'h2fe ? 16'h0002 :  // <0073> a = i
addr == 16'h2ff ? 16'h0601 :  // <0073> b = 1
addr == 16'h300 ? 16'hc800 :  // <0073> i = a+b
addr == 16'h301 ? 16'h0b00 :  // <0073> "


addr == 16'h302 ? 16'h0002 :  // <0073> a = i
addr == 16'h303 ? 16'h0607 :  // <0073> b = $key_buf_max
addr == 16'h304 ? 16'he005 :  // <0073> br lt :loop_742
addr == 16'h305 ? 16'h02e7 :  // <0073> "

// :end_742 // = 0x0306

// at this point we have a match on the record beginning at x.
// :matched // = 0x0306
addr == 16'h306 ? 16'h23a0 :  // <0077> pa = :cmd_ack_msg
addr == 16'h307 ? 16'h02da :  // <0077> "
addr == 16'h308 ? 16'hfba0 :  // <0077> callx  set_text_flag  :cmd_ack_msg
addr == 16'h309 ? 16'h096f :  // <0077> "
addr == 16'h30a ? 16'hfc00 :  // <0077> "
addr == 16'h30b ? 16'h1604 :  // <0078> y = ($key_buf_len / 2)
addr == 16'h30c ? 16'hc800 :  // <0079> fetch rtna from x+y
addr == 16'h30d ? 16'hd320 :  // <0079> "
addr == 16'h30e ? 16'hfbb0 :  // <0079> "
addr == 16'h30f ? 16'hfc00 :  // <0080> swapra = nop
addr == 16'h310 ? 16'he00f :  // <0082> jmp :done
addr == 16'h311 ? 16'h031d :  // <0082> "

// :no_match // = 0x0312
// if ram_terminal_connected is still 0, quit searching after the very first command in the table.
addr == 16'h312 ? 16'h6600 :  // <0086> ram a = $ram_terminal_connected // av_ad_hi = 0
addr == 16'h313 ? 16'h6a94 :  // <0086> ram a = $ram_terminal_connected // av_ad_lo = 148
addr == 16'h314 ? 16'h0017 :  // <0086> ram a = $ram_terminal_connected // a = av_write_data // start read cycle
addr == 16'h315 ? 16'h0018 :  // <0086> ram a = $ram_terminal_connected // a = av_read_data // finish read cycle
addr == 16'h316 ? 16'he000 :  // <0087> br az :done
addr == 16'h317 ? 16'h031d :  // <0087> "

addr == 16'h318 ? 16'h1605 :  // <0089> y = (($key_buf_len / 2) + 1)
addr == 16'h319 ? 16'hc800 :  // <0090> x = x+y
addr == 16'h31a ? 16'h1320 :  // <0090> "
addr == 16'h31b ? 16'he00f :  // <0091> jmp :next_cmd
addr == 16'h31c ? 16'h02e2 :  // <0091> "
// :done // = 0x031d

addr == 16'h31d ? 16'hf80c :  // <0094> pop rtna // func parse_command
addr == 16'h31e ? 16'h140c :  // <0094> pop y // "
addr == 16'h31f ? 16'h100c :  // <0094> pop x // "
addr == 16'h320 ? 16'h080c :  // <0094> pop i // "
addr == 16'h321 ? 16'hfc00 :  // <0094> swapra = nop

// ######## func hello_cmd // = 0x0322

addr == 16'h322 ? 16'h6600 :  // <0096> ram $ram_terminal_connected = 1 // av_ad_hi = 0
addr == 16'h323 ? 16'h6a94 :  // <0096> ram $ram_terminal_connected = 1 // av_ad_lo = 148
addr == 16'h324 ? 16'h5e01 :  // <0096> ram $ram_terminal_connected = 1 // av_write_data = 1

addr == 16'h325 ? 16'hfc00 :  // <0098> swapra = nop

// ######## func set_plan_stop_cmd // = 0x0326
addr == 16'h326 ? 16'h303e :  // <0103> push rtna // func set_plan_stop_cmd

addr == 16'h327 ? 16'h6600 :  // <0100> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h328 ? 16'h6a8e :  // <0100> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'h329 ? 16'hf817 :  // <0100> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h32a ? 16'hf818 :  // <0100> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h32b ? 16'hfc00 :  // <0101> swapra = nop
addr == 16'h32c ? 16'hfba0 :  // <0103> callx  init_plan_stop
addr == 16'h32d ? 16'h0349 :  // <0103> "
addr == 16'h32e ? 16'hfc00 :  // <0103> "

addr == 16'h32f ? 16'hf80c :  // <0105> pop rtna // func set_plan_stop_cmd
addr == 16'h330 ? 16'hfc00 :  // <0105> swapra = nop

// ######## func set_plan_crank_cmd // = 0x0331
addr == 16'h331 ? 16'h303e :  // <0110> push rtna // func set_plan_crank_cmd

addr == 16'h332 ? 16'h6600 :  // <0107> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h333 ? 16'h6a8e :  // <0107> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'h334 ? 16'hf817 :  // <0107> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h335 ? 16'hf818 :  // <0107> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h336 ? 16'hfc00 :  // <0108> swapra = nop
addr == 16'h337 ? 16'hfba0 :  // <0110> callx  init_plan_crank
addr == 16'h338 ? 16'h0388 :  // <0110> "
addr == 16'h339 ? 16'hfc00 :  // <0110> "

addr == 16'h33a ? 16'hf80c :  // <0112> pop rtna // func set_plan_crank_cmd
addr == 16'h33b ? 16'hfc00 :  // <0112> swapra = nop

// ######## func set_plan_run_cmd // = 0x033c
addr == 16'h33c ? 16'h303e :  // <0117> push rtna // func set_plan_run_cmd

addr == 16'h33d ? 16'h6600 :  // <0114> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h33e ? 16'h6a8e :  // <0114> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'h33f ? 16'hf817 :  // <0114> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h340 ? 16'hf818 :  // <0114> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h341 ? 16'hfc00 :  // <0115> swapra = nop
addr == 16'h342 ? 16'hfba0 :  // <0117> callx  init_plan_run
addr == 16'h343 ? 16'h0433 :  // <0117> "
addr == 16'h344 ? 16'hfc00 :  // <0117> "

addr == 16'h345 ? 16'hf80c :  // <0119> pop rtna // func set_plan_run_cmd
addr == 16'h346 ? 16'hfc00 :  // <0119> swapra = nop


// :plan_name_stop // = 0x0347
// "STP\x0"
addr == 16'h347 ? 16'h5453 :  // <0002> TS
addr == 16'h348 ? 16'h0050 :  // <0002>  P

// ######## func init_plan_stop // = 0x0349
addr == 16'h349 ? 16'h303e :  // <0023> push rtna // func init_plan_stop

// set up the stop plan.
addr == 16'h34a ? 16'hfba0 :  // <0006> callx  clear_ign_history
addr == 16'h34b ? 16'h06a3 :  // <0006> "
addr == 16'h34c ? 16'hfc00 :  // <0006> "
// set noise filter to measure RPM between 50 and 1160 to indicate cranking.
addr == 16'h34d ? 16'h6600 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_hi = 0
addr == 16'h34e ? 16'h6a82 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_lo = 130
addr == 16'h34f ? 16'h5fa0 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_write_data = 603
addr == 16'h350 ? 16'h025b :  // <0008> "
addr == 16'h351 ? 16'h6600 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h352 ? 16'h6a84 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 132
addr == 16'h353 ? 16'h5fa0 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h354 ? 16'h36b0 :  // <0009> "
addr == 16'h355 ? 16'h93a0 :  // <0010> ign_timeout_len_jf = ([rpm_to_jf 50])
addr == 16'h356 ? 16'h36b0 :  // <0010> "
// normally puff length is not touched by an init func.
// this one does it because it's part of the program boot,
// and also a good idea whenever stopping the engine.
// this might interrupt a puff in mid-pulse, but no matter in this case.
addr == 16'h357 ? 16'h6600 :  // <0015> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h358 ? 16'h6a90 :  // <0015> ram $ram_next_puff_len_us = 0 // av_ad_lo = 144
addr == 16'h359 ? 16'h5e00 :  // <0015> ram $ram_next_puff_len_us = 0 // av_write_data = 0
addr == 16'h35a ? 16'h9600 :  // <0016> puff_len_us = 0

// memorize state.
addr == 16'h35b ? 16'h6600 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_ad_hi = 0
addr == 16'h35c ? 16'h6a88 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_ad_lo = 136
addr == 16'h35d ? 16'h5fa0 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_write_data = :plan_name_stop
addr == 16'h35e ? 16'h0347 :  // <0019> "
addr == 16'h35f ? 16'h6600 :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_ad_hi = 0
addr == 16'h360 ? 16'h6a8a :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_ad_lo = 138
addr == 16'h361 ? 16'h5fa0 :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_write_data = :puff_len_stop
addr == 16'h362 ? 16'h036e :  // <0020> "
addr == 16'h363 ? 16'h6600 :  // <0021> ram $ram_transition_func = :leave_stop // av_ad_hi = 0
addr == 16'h364 ? 16'h6a8c :  // <0021> ram $ram_transition_func = :leave_stop // av_ad_lo = 140
addr == 16'h365 ? 16'h5fa0 :  // <0021> ram $ram_transition_func = :leave_stop // av_write_data = :leave_stop
addr == 16'h366 ? 16'h0372 :  // <0021> "
addr == 16'h367 ? 16'h6600 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_hi = 0
addr == 16'h368 ? 16'h6a8e :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_lo = 142
addr == 16'h369 ? 16'h5fa0 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_write_data = :destroy_plan_stop
addr == 16'h36a ? 16'h036d :  // <0022> "

addr == 16'h36b ? 16'hf80c :  // <0024> pop rtna // func init_plan_stop
addr == 16'h36c ? 16'hfc00 :  // <0024> swapra = nop

// ######## func destroy_plan_stop // = 0x036d


addr == 16'h36d ? 16'hfc00 :  // <0027> swapra = nop

// ######## func puff_len_stop // = 0x036e

addr == 16'h36e ? 16'h6600 :  // <0029> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h36f ? 16'h6a90 :  // <0029> ram $ram_next_puff_len_us = 0 // av_ad_lo = 144
addr == 16'h370 ? 16'h5e00 :  // <0029> ram $ram_next_puff_len_us = 0 // av_write_data = 0

addr == 16'h371 ? 16'hfc00 :  // <0031> swapra = nop

// ######## func leave_stop // = 0x0372
addr == 16'h372 ? 16'h303e :  // <0044> push rtna // func leave_stop

// leave stop plan if ignition switch is turned on AND more than half if the ignition history is valid.
// requiring both conditions prevents spurious noise readings from starting up the injection.
addr == 16'h373 ? 16'h0022 :  // <0035> a = power_duty
addr == 16'h374 ? 16'h0680 :  // <0036> b = $ign_switch_off_mask
addr == 16'h375 ? 16'he403 :  // <0037> bn and0z :stay
addr == 16'h376 ? 16'h0384 :  // <0037> "
addr == 16'h377 ? 16'h6600 :  // <0038> ram a = $ram_ign_bad_samples // av_ad_hi = 0
addr == 16'h378 ? 16'h6a80 :  // <0038> ram a = $ram_ign_bad_samples // av_ad_lo = 128
addr == 16'h379 ? 16'h0017 :  // <0038> ram a = $ram_ign_bad_samples // a = av_write_data // start read cycle
addr == 16'h37a ? 16'h0018 :  // <0038> ram a = $ram_ign_bad_samples // a = av_read_data // finish read cycle
addr == 16'h37b ? 16'h0608 :  // <0039> b = ($ign_history_len / 2)
addr == 16'h37c ? 16'he006 :  // <0040> br gt :stay
addr == 16'h37d ? 16'h0384 :  // <0040> "
addr == 16'h37e ? 16'hfba0 :  // <0041> callx  destroy_plan_stop
addr == 16'h37f ? 16'h036d :  // <0041> "
addr == 16'h380 ? 16'hfc00 :  // <0041> "
addr == 16'h381 ? 16'hfba0 :  // <0042> callx  init_plan_crank
addr == 16'h382 ? 16'h0388 :  // <0042> "
addr == 16'h383 ? 16'hfc00 :  // <0042> "
// :stay // = 0x0384

addr == 16'h384 ? 16'hf80c :  // <0045> pop rtna // func leave_stop
addr == 16'h385 ? 16'hfc00 :  // <0045> swapra = nop



// escalating puff length by 1500 us per puff while cranking slowly at e.g. 80 RPM
// on a frozen winter morning will ramp up from 10000 to 20000 us length in about 5 seconds.

// :plan_name_crank // = 0x0386
// "CR\x0"
addr == 16'h386 ? 16'h5243 :  // <0011> RC
addr == 16'h387 ? 16'h0000 :  // <0011>   

// ######## func init_plan_crank // = 0x0388
addr == 16'h388 ? 16'h303e :  // <0033> push rtna // func init_plan_crank

// set up the crank plan.
addr == 16'h389 ? 16'h6600 :  // <0015> ram $ram_puff_count = 0 // av_ad_hi = 0
addr == 16'h38a ? 16'h6a92 :  // <0015> ram $ram_puff_count = 0 // av_ad_lo = 146
addr == 16'h38b ? 16'h5e00 :  // <0015> ram $ram_puff_count = 0 // av_write_data = 0
// set noise filter to measure RPM between 50 and 8000 to indicate running.
addr == 16'h38c ? 16'h6600 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_ad_hi = 0
addr == 16'h38d ? 16'h6a82 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_ad_lo = 130
addr == 16'h38e ? 16'h5e57 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_write_data = 87
addr == 16'h38f ? 16'h6600 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h390 ? 16'h6a84 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 132
addr == 16'h391 ? 16'h5fa0 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h392 ? 16'h36b0 :  // <0018> "
addr == 16'h393 ? 16'h93a0 :  // <0019> ign_timeout_len_jf = ([rpm_to_jf 50])
addr == 16'h394 ? 16'h36b0 :  // <0019> "
// normally puff length is not touched by an init func.
// this one does it because it's the beginning of a crank cycle, and puff length
// should be enabled for the first puff.  otherwise the first puff would be missed.
addr == 16'h395 ? 16'h6600 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_hi = 0
addr == 16'h396 ? 16'h6a90 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_lo = 144
addr == 16'h397 ? 16'h5fa0 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_write_data = 10000
addr == 16'h398 ? 16'h2710 :  // <0023> "
addr == 16'h399 ? 16'h97a0 :  // <0024> puff_len_us = $crank_min_puff_len_us
addr == 16'h39a ? 16'h2710 :  // <0024> "
// clear ignition history again to eliminate samples where the motor kept spinning after switching from plan_run to plan_stop.
addr == 16'h39b ? 16'hfba0 :  // <0026> callx  clear_ign_history
addr == 16'h39c ? 16'h06a3 :  // <0026> "
addr == 16'h39d ? 16'hfc00 :  // <0026> "

// memorize state.
addr == 16'h39e ? 16'h6600 :  // <0029> ram $ram_plan_name = :plan_name_crank // av_ad_hi = 0
addr == 16'h39f ? 16'h6a88 :  // <0029> ram $ram_plan_name = :plan_name_crank // av_ad_lo = 136
addr == 16'h3a0 ? 16'h5fa0 :  // <0029> ram $ram_plan_name = :plan_name_crank // av_write_data = :plan_name_crank
addr == 16'h3a1 ? 16'h0386 :  // <0029> "
addr == 16'h3a2 ? 16'h6600 :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_ad_hi = 0
addr == 16'h3a3 ? 16'h6a8a :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_ad_lo = 138
addr == 16'h3a4 ? 16'h5fa0 :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_write_data = :puff_len_crank
addr == 16'h3a5 ? 16'h03b1 :  // <0030> "
addr == 16'h3a6 ? 16'h6600 :  // <0031> ram $ram_transition_func = :leave_crank // av_ad_hi = 0
addr == 16'h3a7 ? 16'h6a8c :  // <0031> ram $ram_transition_func = :leave_crank // av_ad_lo = 140
addr == 16'h3a8 ? 16'h5fa0 :  // <0031> ram $ram_transition_func = :leave_crank // av_write_data = :leave_crank
addr == 16'h3a9 ? 16'h03cf :  // <0031> "
addr == 16'h3aa ? 16'h6600 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_hi = 0
addr == 16'h3ab ? 16'h6a8e :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_lo = 142
addr == 16'h3ac ? 16'h5fa0 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_write_data = :destroy_plan_crank
addr == 16'h3ad ? 16'h03b0 :  // <0032> "

addr == 16'h3ae ? 16'hf80c :  // <0034> pop rtna // func init_plan_crank
addr == 16'h3af ? 16'hfc00 :  // <0034> swapra = nop

// ######## func destroy_plan_crank // = 0x03b0


addr == 16'h3b0 ? 16'hfc00 :  // <0037> swapra = nop

// ######## func puff_len_crank // = 0x03b1
addr == 16'h3b1 ? 16'h303e :  // <0054> push rtna // func puff_len_crank

addr == 16'h3b2 ? 16'h6600 :  // <0039> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h3b3 ? 16'h6a92 :  // <0039> ram a = $ram_puff_count // av_ad_lo = 146
addr == 16'h3b4 ? 16'h0017 :  // <0039> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h3b5 ? 16'h0018 :  // <0039> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h3b6 ? 16'h0604 :  // <0040> b = $crank_max_puffs
addr == 16'h3b7 ? 16'he006 :  // <0041> br gt :puff_limit
addr == 16'h3b8 ? 16'h03c6 :  // <0041> "
// linear escalation from min to max puff length, at a slope of crank_incr_us_per_puff.
addr == 16'h3b9 ? 16'h07a0 :  // <0043> b = $crank_incr_us_per_puff
addr == 16'h3ba ? 16'h09c4 :  // <0043> "
addr == 16'h3bb ? 16'hfba0 :  // <0044> call :multiply
addr == 16'h3bc ? 16'h0180 :  // <0044> "
addr == 16'h3bd ? 16'hfc00 :  // <0044> "
addr == 16'h3be ? 16'h07a0 :  // <0045> b = $crank_min_puff_len_us
addr == 16'h3bf ? 16'h2710 :  // <0045> "
addr == 16'h3c0 ? 16'h6600 :  // <0046> ram $ram_next_puff_len_us = a+b // av_ad_hi = 0
addr == 16'h3c1 ? 16'h6a90 :  // <0046> ram $ram_next_puff_len_us = a+b // av_ad_lo = 144
addr == 16'h3c2 ? 16'hc800 :  // <0046> ram $ram_next_puff_len_us = a+b // av_write_data = a+b
addr == 16'h3c3 ? 16'h5f00 :  // <0046> "
addr == 16'h3c4 ? 16'he00f :  // <0047> jmp :done
addr == 16'h3c5 ? 16'h03cd :  // <0047> "
// :puff_limit // = 0x03c6
// prevent the puff counter from going higher & eventually rolling over.
addr == 16'h3c6 ? 16'h6600 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_ad_hi = 0
addr == 16'h3c7 ? 16'h6a92 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_ad_lo = 146
addr == 16'h3c8 ? 16'h5e04 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_write_data = 4
// accept max puff len.
addr == 16'h3c9 ? 16'h6600 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_hi = 0
addr == 16'h3ca ? 16'h6a90 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_lo = 144
addr == 16'h3cb ? 16'h5fa0 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_write_data = 20000
addr == 16'h3cc ? 16'h4e20 :  // <0052> "
// :done // = 0x03cd

addr == 16'h3cd ? 16'hf80c :  // <0055> pop rtna // func puff_len_crank
addr == 16'h3ce ? 16'hfc00 :  // <0055> swapra = nop

// ######## func leave_crank // = 0x03cf
addr == 16'h3cf ? 16'h303e :  // <0071> push rtna // func leave_crank

addr == 16'h3d0 ? 16'hfba0 :  // <0057> callx  check_engine_stop  a
addr == 16'h3d1 ? 16'h0a7b :  // <0057> "
addr == 16'h3d2 ? 16'hfc00 :  // <0057> "
addr == 16'h3d3 ? 16'h0008 :  // <0057> a = pa
addr == 16'h3d4 ? 16'he400 :  // <0058> bn az :done
addr == 16'h3d5 ? 16'h03ea :  // <0058> "

// transition to warmup if RPM exceeds crank_success_rpm.
addr == 16'h3d6 ? 16'h6600 :  // <0061> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h3d7 ? 16'h6a7e :  // <0061> ram a = $ram_rpm_valid // av_ad_lo = 126
addr == 16'h3d8 ? 16'h0017 :  // <0061> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h3d9 ? 16'h0018 :  // <0061> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle
addr == 16'h3da ? 16'he000 :  // <0062> br az :stay
addr == 16'h3db ? 16'h03ea :  // <0062> "
addr == 16'h3dc ? 16'h6600 :  // <0063> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h3dd ? 16'h6a7c :  // <0063> ram a = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h3de ? 16'h0017 :  // <0063> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h3df ? 16'h0018 :  // <0063> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle
addr == 16'h3e0 ? 16'h07a0 :  // <0064> b = $crank_success_rpm
addr == 16'h3e1 ? 16'h0320 :  // <0064> "
addr == 16'h3e2 ? 16'he005 :  // <0065> br lt :stay
addr == 16'h3e3 ? 16'h03ea :  // <0065> "
addr == 16'h3e4 ? 16'hfba0 :  // <0066> callx  destroy_plan_crank
addr == 16'h3e5 ? 16'h03b0 :  // <0066> "
addr == 16'h3e6 ? 16'hfc00 :  // <0066> "
addr == 16'h3e7 ? 16'hfba0 :  // <0067> callx  init_plan_run
addr == 16'h3e8 ? 16'h0433 :  // <0067> "
addr == 16'h3e9 ? 16'hfc00 :  // <0067> "
// :stay // = 0x03ea

// :done // = 0x03ea

addr == 16'h3ea ? 16'hf80c :  // <0072> pop rtna // func leave_crank
addr == 16'h3eb ? 16'hfc00 :  // <0072> swapra = nop


// :plan_name_run // = 0x03ec
// "RN\x0"
addr == 16'h3ec ? 16'h4e52 :  // <0002> NR
addr == 16'h3ed ? 16'h0000 :  // <0002>   


// 0.5 to 2.0 trim factor equivalent.









// ######## func trim_lean_cmd // = 0x03ee

addr == 16'h3ee ? 16'h6600 :  // <0037> ram a = $ram_run_manual_trim // av_ad_hi = 0
addr == 16'h3ef ? 16'h6aaa :  // <0037> ram a = $ram_run_manual_trim // av_ad_lo = 170
addr == 16'h3f0 ? 16'h0017 :  // <0037> ram a = $ram_run_manual_trim // a = av_write_data // start read cycle
addr == 16'h3f1 ? 16'h0018 :  // <0037> ram a = $ram_run_manual_trim // a = av_read_data // finish read cycle

addr == 16'h3f2 ? 16'h0000 :  // <0042> a = a
addr == 16'h3f3 ? 16'h0600 :  // <0042> b = 0

addr == 16'h3f4 ? 16'he407 :  // <0038> bn eq :else_1012
addr == 16'h3f5 ? 16'h03f8 :  // <0038> "


addr == 16'h3f6 ? 16'he00f :  // <0040> jmp :end_1012
addr == 16'h3f7 ? 16'h03fe :  // <0040> "

addr == 16'h3f8 ? 16'h07a0 :  // <0041> b = ([negate $run_manual_trim_step])
addr == 16'h3f9 ? 16'hff40 :  // <0041> "
addr == 16'h3fa ? 16'h6600 :  // <0042> ram $ram_run_manual_trim = a+b // av_ad_hi = 0
addr == 16'h3fb ? 16'h6aaa :  // <0042> ram $ram_run_manual_trim = a+b // av_ad_lo = 170
addr == 16'h3fc ? 16'hc800 :  // <0042> ram $ram_run_manual_trim = a+b // av_write_data = a+b
addr == 16'h3fd ? 16'h5f00 :  // <0042> "


addr == 16'h3fe ? 16'hfc00 :  // <0044> swapra = nop

// ######## func trim_rich_cmd // = 0x03ff

addr == 16'h3ff ? 16'h6600 :  // <0046> ram a = $ram_run_manual_trim // av_ad_hi = 0
addr == 16'h400 ? 16'h6aaa :  // <0046> ram a = $ram_run_manual_trim // av_ad_lo = 170
addr == 16'h401 ? 16'h0017 :  // <0046> ram a = $ram_run_manual_trim // a = av_write_data // start read cycle
addr == 16'h402 ? 16'h0018 :  // <0046> ram a = $ram_run_manual_trim // a = av_read_data // finish read cycle

addr == 16'h403 ? 16'h0000 :  // <0051> a = a
addr == 16'h404 ? 16'h07a0 :  // <0051> b = 800
addr == 16'h405 ? 16'h0320 :  // <0051> "

addr == 16'h406 ? 16'he406 :  // <0047> bn gt :else_1030
addr == 16'h407 ? 16'h040a :  // <0047> "


addr == 16'h408 ? 16'he00f :  // <0049> jmp :end_1030
addr == 16'h409 ? 16'h040f :  // <0049> "

addr == 16'h40a ? 16'h06c0 :  // <0050> b = $run_manual_trim_step
addr == 16'h40b ? 16'h6600 :  // <0051> ram $ram_run_manual_trim = a+b // av_ad_hi = 0
addr == 16'h40c ? 16'h6aaa :  // <0051> ram $ram_run_manual_trim = a+b // av_ad_lo = 170
addr == 16'h40d ? 16'hc800 :  // <0051> ram $ram_run_manual_trim = a+b // av_write_data = a+b
addr == 16'h40e ? 16'h5f00 :  // <0051> "


addr == 16'h40f ? 16'hfc00 :  // <0053> swapra = nop

// ######## func trim_2lean_cmd // = 0x0410

addr == 16'h410 ? 16'h6600 :  // <0055> ram a = $ram_run_manual_trim // av_ad_hi = 0
addr == 16'h411 ? 16'h6aaa :  // <0055> ram a = $ram_run_manual_trim // av_ad_lo = 170
addr == 16'h412 ? 16'h0017 :  // <0055> ram a = $ram_run_manual_trim // a = av_write_data // start read cycle
addr == 16'h413 ? 16'h0018 :  // <0055> ram a = $ram_run_manual_trim // a = av_read_data // finish read cycle

addr == 16'h414 ? 16'h0000 :  // <0060> a = a
addr == 16'h415 ? 16'h0600 :  // <0060> b = 0

addr == 16'h416 ? 16'he407 :  // <0056> bn eq :else_1046
addr == 16'h417 ? 16'h041a :  // <0056> "


addr == 16'h418 ? 16'he00f :  // <0058> jmp :end_1046
addr == 16'h419 ? 16'h0420 :  // <0058> "

addr == 16'h41a ? 16'h07a0 :  // <0059> b = ([negate [expr $run_manual_trim_step * 8]])
addr == 16'h41b ? 16'hfa00 :  // <0059> "
addr == 16'h41c ? 16'h6600 :  // <0060> ram $ram_run_manual_trim = a+b // av_ad_hi = 0
addr == 16'h41d ? 16'h6aaa :  // <0060> ram $ram_run_manual_trim = a+b // av_ad_lo = 170
addr == 16'h41e ? 16'hc800 :  // <0060> ram $ram_run_manual_trim = a+b // av_write_data = a+b
addr == 16'h41f ? 16'h5f00 :  // <0060> "


addr == 16'h420 ? 16'hfc00 :  // <0062> swapra = nop

// ######## func trim_2rich_cmd // = 0x0421

addr == 16'h421 ? 16'h6600 :  // <0064> ram a = $ram_run_manual_trim // av_ad_hi = 0
addr == 16'h422 ? 16'h6aaa :  // <0064> ram a = $ram_run_manual_trim // av_ad_lo = 170
addr == 16'h423 ? 16'h0017 :  // <0064> ram a = $ram_run_manual_trim // a = av_write_data // start read cycle
addr == 16'h424 ? 16'h0018 :  // <0064> ram a = $ram_run_manual_trim // a = av_read_data // finish read cycle

addr == 16'h425 ? 16'h0000 :  // <0069> a = a
addr == 16'h426 ? 16'h07a0 :  // <0069> b = 800
addr == 16'h427 ? 16'h0320 :  // <0069> "

addr == 16'h428 ? 16'he406 :  // <0065> bn gt :else_1064
addr == 16'h429 ? 16'h042c :  // <0065> "


addr == 16'h42a ? 16'he00f :  // <0067> jmp :end_1064
addr == 16'h42b ? 16'h0432 :  // <0067> "

addr == 16'h42c ? 16'h07a0 :  // <0068> b = ($run_manual_trim_step * 8)
addr == 16'h42d ? 16'h0600 :  // <0068> "
addr == 16'h42e ? 16'h6600 :  // <0069> ram $ram_run_manual_trim = a+b // av_ad_hi = 0
addr == 16'h42f ? 16'h6aaa :  // <0069> ram $ram_run_manual_trim = a+b // av_ad_lo = 170
addr == 16'h430 ? 16'hc800 :  // <0069> ram $ram_run_manual_trim = a+b // av_write_data = a+b
addr == 16'h431 ? 16'h5f00 :  // <0069> "


addr == 16'h432 ? 16'hfc00 :  // <0071> swapra = nop

// ######## func init_plan_run // = 0x0433

// set up the run plan.
addr == 16'h433 ? 16'h6600 :  // <0074> ram $ram_run_manual_trim = $trim_unity // av_ad_hi = 0
addr == 16'h434 ? 16'h6aaa :  // <0074> ram $ram_run_manual_trim = $trim_unity // av_ad_lo = 170
addr == 16'h435 ? 16'h5fa0 :  // <0074> ram $ram_run_manual_trim = $trim_unity // av_write_data = 8192
addr == 16'h436 ? 16'h2000 :  // <0074> "
addr == 16'h437 ? 16'h6600 :  // <0075> ram $ram_o2_trim = $trim_unity // av_ad_hi = 0
addr == 16'h438 ? 16'h6aa8 :  // <0075> ram $ram_o2_trim = $trim_unity // av_ad_lo = 168
addr == 16'h439 ? 16'h5fa0 :  // <0075> ram $ram_o2_trim = $trim_unity // av_write_data = 8192
addr == 16'h43a ? 16'h2000 :  // <0075> "

// memorize state.
addr == 16'h43b ? 16'h6600 :  // <0078> ram $ram_plan_name = :plan_name_run // av_ad_hi = 0
addr == 16'h43c ? 16'h6a88 :  // <0078> ram $ram_plan_name = :plan_name_run // av_ad_lo = 136
addr == 16'h43d ? 16'h5fa0 :  // <0078> ram $ram_plan_name = :plan_name_run // av_write_data = :plan_name_run
addr == 16'h43e ? 16'h03ec :  // <0078> "
addr == 16'h43f ? 16'h6600 :  // <0079> ram $ram_puff_len_func = :puff_len_run // av_ad_hi = 0
addr == 16'h440 ? 16'h6a8a :  // <0079> ram $ram_puff_len_func = :puff_len_run // av_ad_lo = 138
addr == 16'h441 ? 16'h5fa0 :  // <0079> ram $ram_puff_len_func = :puff_len_run // av_write_data = :puff_len_run
addr == 16'h442 ? 16'h0492 :  // <0079> "
addr == 16'h443 ? 16'h6600 :  // <0080> ram $ram_transition_func = :leave_run // av_ad_hi = 0
addr == 16'h444 ? 16'h6a8c :  // <0080> ram $ram_transition_func = :leave_run // av_ad_lo = 140
addr == 16'h445 ? 16'h5fa0 :  // <0080> ram $ram_transition_func = :leave_run // av_write_data = :leave_run
addr == 16'h446 ? 16'h0509 :  // <0080> "
addr == 16'h447 ? 16'h6600 :  // <0081> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_hi = 0
addr == 16'h448 ? 16'h6a8e :  // <0081> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_lo = 142
addr == 16'h449 ? 16'h5fa0 :  // <0081> ram $ram_destroy_plan_func = :destroy_plan_run // av_write_data = :destroy_plan_run
addr == 16'h44a ? 16'h044c :  // <0081> "

addr == 16'h44b ? 16'hfc00 :  // <0083> swapra = nop

// ######## func destroy_plan_run // = 0x044c


addr == 16'h44c ? 16'hfc00 :  // <0086> swapra = nop

// ######## func combine_trim // = 0x044d
addr == 16'h44d ? 16'h3002 :  // <0127> push i // func combine_trim
addr == 16'h44e ? 16'h3003 :  // <0127> push j // "
addr == 16'h44f ? 16'h3004 :  // <0127> push x // "

// combine the given increment with the given total trim factor, returning
// the new total trim.  this process is complicated by the decision to keep the
// 0.5 offset in the integer representation scheme.  that's done in case i ever
// have to calculate puff without the aid of a hardware multiplier.
// the process is to add the offset to each argument, multiply them,
// undo the offsets, and saturate to prevent excess accumulation.
addr == 16'h450 ? 16'h0008 :  // <0094> a = total
addr == 16'h451 ? 16'h07a0 :  // <0095> b = $trim_unity
addr == 16'h452 ? 16'h2000 :  // <0095> "
addr == 16'h453 ? 16'hc800 :  // <0096> a = a+b
addr == 16'h454 ? 16'h0300 :  // <0096> "
addr == 16'h455 ? 16'h0809 :  // <0097> i = increment
addr == 16'h456 ? 16'h0fa0 :  // <0098> j = $trim_unity
addr == 16'h457 ? 16'h2000 :  // <0098> "
addr == 16'h458 ? 16'hc800 :  // <0099> b = i+j
addr == 16'h459 ? 16'h0710 :  // <0099> "
addr == 16'h45a ? 16'hc800 :  // <0100> nop
addr == 16'h45b ? 16'hc800 :  // <0101> nop
addr == 16'h45c ? 16'hc800 :  // <0102> nop
addr == 16'h45d ? 16'hc800 :  // <0103> nop
// total = product / 16384 = product >> 14
// this cancels the two offsets that were added prior to the mult.
addr == 16'h45e ? 16'h1011 :  // <0106> x = product_hi
addr == 16'h45f ? 16'h0010 :  // <0107> a = product_lo
addr == 16'h460 ? 16'h0353 :  // <0108> a = a>>4
addr == 16'h461 ? 16'h0353 :  // <0109> a = a>>4
addr == 16'h462 ? 16'h0353 :  // <0110> a = a>>4
addr == 16'h463 ? 16'h0350 :  // <0111> a = a>>1
addr == 16'h464 ? 16'h2350 :  // <0112> out_total = a>>1
addr == 16'h465 ? 16'h0004 :  // <0113> a = x
addr == 16'h466 ? 16'h07a0 :  // <0114> b = 0x3fff
addr == 16'h467 ? 16'h3fff :  // <0114> "
addr == 16'h468 ? 16'hc800 :  // <0115> a = and
addr == 16'h469 ? 16'h0330 :  // <0115> "
addr == 16'h46a ? 16'h0351 :  // <0116> a = a<<1
addr == 16'h46b ? 16'h0351 :  // <0117> a = a<<1
addr == 16'h46c ? 16'h0408 :  // <0118> b = out_total
addr == 16'h46d ? 16'hc800 :  // <0119> a = or
addr == 16'h46e ? 16'h0334 :  // <0119> "
// subtract the unity offset to get back to the correct integer representation.
addr == 16'h46f ? 16'h07a0 :  // <0121> b = ([negate $trim_unity])
addr == 16'h470 ? 16'he000 :  // <0121> "
addr == 16'h471 ? 16'hc800 :  // <0122> out_total = a+b
addr == 16'h472 ? 16'h2300 :  // <0122> "
// clamp.

addr == 16'h473 ? 16'h0008 :  // <0126> a = out_total
addr == 16'h474 ? 16'h07a0 :  // <0126> b = 24576
addr == 16'h475 ? 16'h6000 :  // <0126> "

addr == 16'h476 ? 16'he406 :  // <0124> bn gt :else_1142
addr == 16'h477 ? 16'h047a :  // <0124> "

addr == 16'h478 ? 16'h23a0 :  // <0125> out_total = $trim_double
addr == 16'h479 ? 16'h6000 :  // <0125> "


addr == 16'h47a ? 16'h100c :  // <0128> pop x // func combine_trim
addr == 16'h47b ? 16'h0c0c :  // <0128> pop j // "
addr == 16'h47c ? 16'h080c :  // <0128> pop i // "
addr == 16'h47d ? 16'hfc00 :  // <0128> swapra = nop

// ######## func fetch_afrc // = 0x047e

// look up Air/Fuel Ratio Correction in AFRC map.
// index rows by MAF.
addr == 16'h47e ? 16'h0008 :  // <0132> a = maf_row_idx
addr == 16'h47f ? 16'h0610 :  // <0133> b = $afrc_rpm_cols
addr == 16'h480 ? 16'hc800 :  // <0134> nop
addr == 16'h481 ? 16'hc800 :  // <0135> nop
addr == 16'h482 ? 16'hc800 :  // <0136> nop
addr == 16'h483 ? 16'hc800 :  // <0137> nop
addr == 16'h484 ? 16'h0410 :  // <0138> b = product_lo
// index columns by RPM.
addr == 16'h485 ? 16'h0009 :  // <0140> a = rpm_col_idx
addr == 16'h486 ? 16'hc800 :  // <0141> a = a+b
addr == 16'h487 ? 16'h0300 :  // <0141> "

addr == 16'h488 ? 16'h0351 :  // <0142> a = a<<1
addr == 16'h489 ? 16'h0600 :  // <0142> b = 0
addr == 16'h48a ? 16'h67a0 :  // <0142> av_ad_hi = 256
addr == 16'h48b ? 16'h0100 :  // <0142> "
addr == 16'h48c ? 16'h6b00 :  // <0142> av_ad_lo = ad0
addr == 16'h48d ? 16'h0417 :  // <0142> b = av_begin_read
addr == 16'h48e ? 16'h0418 :  // <0142> b = av_read_data

addr == 16'h48f ? 16'h2001 :  // <0143> afrc = b
addr == 16'h490 ? 16'hfc00 :  // <0142> swapra = nop

addr == 16'h491 ? 16'hfc00 :  // <0145> swapra = nop

// ######## func puff_len_run // = 0x0492
addr == 16'h492 ? 16'h3004 :  // <0227> push x // func puff_len_run
addr == 16'h493 ? 16'h3007 :  // <0227> push gb // "
addr == 16'h494 ? 16'h303e :  // <0227> push rtna // "

addr == 16'h495 ? 16'h6600 :  // <0147> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h496 ? 16'h6a7e :  // <0147> ram a = $ram_rpm_valid // av_ad_lo = 126
addr == 16'h497 ? 16'h0017 :  // <0147> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h498 ? 16'h0018 :  // <0147> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle

addr == 16'h499 ? 16'h0000 :  // <0150> a = a
addr == 16'h49a ? 16'h0601 :  // <0150> b = 1

addr == 16'h49b ? 16'he007 :  // <0148> br eq :else_1179
addr == 16'h49c ? 16'h049f :  // <0148> "

addr == 16'h49d ? 16'he00f :  // <0149> jmp :abort
addr == 16'h49e ? 16'h0505 :  // <0149> "


// look up Air/Fuel Ratio Correction in AFRC map.
addr == 16'h49f ? 16'h6600 :  // <0153> ram pa = $ram_afrc_maf_row_idx // av_ad_hi = 0
addr == 16'h4a0 ? 16'h6a9c :  // <0153> ram pa = $ram_afrc_maf_row_idx // av_ad_lo = 156
addr == 16'h4a1 ? 16'h2017 :  // <0153> ram pa = $ram_afrc_maf_row_idx // pa = av_write_data // start read cycle
addr == 16'h4a2 ? 16'h2018 :  // <0153> ram pa = $ram_afrc_maf_row_idx // pa = av_read_data // finish read cycle
addr == 16'h4a3 ? 16'h6600 :  // <0154> ram pb = $ram_afrc_rpm_col_idx // av_ad_hi = 0
addr == 16'h4a4 ? 16'h6a9e :  // <0154> ram pb = $ram_afrc_rpm_col_idx // av_ad_lo = 158
addr == 16'h4a5 ? 16'h2417 :  // <0154> ram pb = $ram_afrc_rpm_col_idx // pb = av_write_data // start read cycle
addr == 16'h4a6 ? 16'h2418 :  // <0154> ram pb = $ram_afrc_rpm_col_idx // pb = av_read_data // finish read cycle
addr == 16'h4a7 ? 16'hfba0 :  // <0155> callx fetch_afrc pa pb ga
addr == 16'h4a8 ? 16'h047e :  // <0155> "
addr == 16'h4a9 ? 16'hfc00 :  // <0155> "
addr == 16'h4aa ? 16'h1808 :  // <0155> ga = pa
// now ga = total trim factor as integer.

// apply block temperature trim factor.
addr == 16'h4ab ? 16'h6600 :  // <0159> ram b = $ram_block_temp_trim // av_ad_hi = 0
addr == 16'h4ac ? 16'h6aa2 :  // <0159> ram b = $ram_block_temp_trim // av_ad_lo = 162
addr == 16'h4ad ? 16'h0417 :  // <0159> ram b = $ram_block_temp_trim // b = av_write_data // start read cycle
addr == 16'h4ae ? 16'h0418 :  // <0159> ram b = $ram_block_temp_trim // b = av_read_data // finish read cycle
addr == 16'h4af ? 16'h2006 :  // <0160> pa = ga
addr == 16'h4b0 ? 16'h2401 :  // <0160> pb = b
addr == 16'h4b1 ? 16'hfba0 :  // <0160> callx combine_trim ga b ga
addr == 16'h4b2 ? 16'h044d :  // <0160> "
addr == 16'h4b3 ? 16'hfc00 :  // <0160> "
addr == 16'h4b4 ? 16'h1808 :  // <0160> ga = pa

// apply afterstart trim factor.
addr == 16'h4b5 ? 16'h6600 :  // <0163> ram b = $ram_afterstart_trim // av_ad_hi = 0
addr == 16'h4b6 ? 16'h6aa6 :  // <0163> ram b = $ram_afterstart_trim // av_ad_lo = 166
addr == 16'h4b7 ? 16'h0417 :  // <0163> ram b = $ram_afterstart_trim // b = av_write_data // start read cycle
addr == 16'h4b8 ? 16'h0418 :  // <0163> ram b = $ram_afterstart_trim // b = av_read_data // finish read cycle
addr == 16'h4b9 ? 16'h2006 :  // <0164> pa = ga
addr == 16'h4ba ? 16'h2401 :  // <0164> pb = b
addr == 16'h4bb ? 16'hfba0 :  // <0164> callx combine_trim ga b ga
addr == 16'h4bc ? 16'h044d :  // <0164> "
addr == 16'h4bd ? 16'hfc00 :  // <0164> "
addr == 16'h4be ? 16'h1808 :  // <0164> ga = pa

// apply stoich learning trim factor.
addr == 16'h4bf ? 16'h6600 :  // <0167> ram b = $ram_o2_trim // av_ad_hi = 0
addr == 16'h4c0 ? 16'h6aa8 :  // <0167> ram b = $ram_o2_trim // av_ad_lo = 168
addr == 16'h4c1 ? 16'h0417 :  // <0167> ram b = $ram_o2_trim // b = av_write_data // start read cycle
addr == 16'h4c2 ? 16'h0418 :  // <0167> ram b = $ram_o2_trim // b = av_read_data // finish read cycle
addr == 16'h4c3 ? 16'h2006 :  // <0168> pa = ga
addr == 16'h4c4 ? 16'h2401 :  // <0168> pb = b
addr == 16'h4c5 ? 16'hfba0 :  // <0168> callx combine_trim ga b ga
addr == 16'h4c6 ? 16'h044d :  // <0168> "
addr == 16'h4c7 ? 16'hfc00 :  // <0168> "
addr == 16'h4c8 ? 16'h1808 :  // <0168> ga = pa

// apply manual trim factor.
addr == 16'h4c9 ? 16'h6600 :  // <0171> ram b = $ram_run_manual_trim // av_ad_hi = 0
addr == 16'h4ca ? 16'h6aaa :  // <0171> ram b = $ram_run_manual_trim // av_ad_lo = 170
addr == 16'h4cb ? 16'h0417 :  // <0171> ram b = $ram_run_manual_trim // b = av_write_data // start read cycle
addr == 16'h4cc ? 16'h0418 :  // <0171> ram b = $ram_run_manual_trim // b = av_read_data // finish read cycle
addr == 16'h4cd ? 16'h2006 :  // <0172> pa = ga
addr == 16'h4ce ? 16'h2401 :  // <0172> pb = b
addr == 16'h4cf ? 16'hfba0 :  // <0172> callx combine_trim ga b ga
addr == 16'h4d0 ? 16'h044d :  // <0172> "
addr == 16'h4d1 ? 16'hfc00 :  // <0172> "
addr == 16'h4d2 ? 16'h1808 :  // <0172> ga = pa

// final multiplication for puff length.
// (MAF linear flow) * (stoich ratio constant) * (total trim as floating point) = (puff length jf).
// here the total trim float will have to be represented as a fraction (num/denom).
// stoich ratio constant (8) (really the conversion factor from linear
// flow to nominal jf)  is folded into that denominator (16384) at compile time.
// that makes denom = 2048 = 11 bits.  so:
// gb = (puff len jf) = (MAF linear flow) * [(total trim) + trim_unity] >> 11
addr == 16'h4d3 ? 16'h0006 :  // <0181> a = ga
addr == 16'h4d4 ? 16'h07a0 :  // <0182> b = $trim_unity
addr == 16'h4d5 ? 16'h2000 :  // <0182> "
addr == 16'h4d6 ? 16'hc800 :  // <0183> a = a+b
addr == 16'h4d7 ? 16'h0300 :  // <0183> "
addr == 16'h4d8 ? 16'h6600 :  // <0184> ram b = $ram_maf_flow_hi_res // av_ad_hi = 0
addr == 16'h4d9 ? 16'h6a9a :  // <0184> ram b = $ram_maf_flow_hi_res // av_ad_lo = 154
addr == 16'h4da ? 16'h0417 :  // <0184> ram b = $ram_maf_flow_hi_res // b = av_write_data // start read cycle
addr == 16'h4db ? 16'h0418 :  // <0184> ram b = $ram_maf_flow_hi_res // b = av_read_data // finish read cycle
addr == 16'h4dc ? 16'hc800 :  // <0185> nop
addr == 16'h4dd ? 16'hc800 :  // <0186> nop
addr == 16'h4de ? 16'hc800 :  // <0187> nop
addr == 16'h4df ? 16'hc800 :  // <0188> nop
// gb = 32-bit product shifted >> 11.  lower 11 bits of product_hi are
// explicitly moved to upper 11 bits of gb.
addr == 16'h4e0 ? 16'h0010 :  // <0191> a = product_lo
addr == 16'h4e1 ? 16'h0411 :  // <0192> b = product_hi
addr == 16'h4e2 ? 16'h0353 :  // <0193> a = a>>4
addr == 16'h4e3 ? 16'h0353 :  // <0194> a = a>>4
addr == 16'h4e4 ? 16'h0350 :  // <0195> a = a>>1
addr == 16'h4e5 ? 16'h0350 :  // <0196> a = a>>1
addr == 16'h4e6 ? 16'h1f50 :  // <0197> gb = a>>1
addr == 16'h4e7 ? 16'h0001 :  // <0198> a = b
addr == 16'h4e8 ? 16'h0352 :  // <0199> a = a<<4
addr == 16'h4e9 ? 16'h0351 :  // <0200> a = a<<1
addr == 16'h4ea ? 16'h0407 :  // <0201> b = gb
addr == 16'h4eb ? 16'hc800 :  // <0202> gb = or
addr == 16'h4ec ? 16'h1f34 :  // <0202> "

// clamp the (puff length jf) to sane range.
// max is the floating duty cycle.  7/8 of puff cycle, or 87.5%.
addr == 16'h4ed ? 16'h6600 :  // <0206> ram a = $ram_ign_avg_jf // av_ad_hi = 0
addr == 16'h4ee ? 16'h6a7a :  // <0206> ram a = $ram_ign_avg_jf // av_ad_lo = 122
addr == 16'h4ef ? 16'h0017 :  // <0206> ram a = $ram_ign_avg_jf // a = av_write_data // start read cycle
addr == 16'h4f0 ? 16'h0018 :  // <0206> ram a = $ram_ign_avg_jf // a = av_read_data // finish read cycle
addr == 16'h4f1 ? 16'h0350 :  // <0207> a = a>>1
addr == 16'h4f2 ? 16'h0350 :  // <0208> a = a>>1
addr == 16'h4f3 ? 16'h0350 :  // <0209> a = a>>1
addr == 16'h4f4 ? 16'h0760 :  // <0210> b = 0xffff
addr == 16'h4f5 ? 16'hc800 :  // <0211> a = xor
addr == 16'h4f6 ? 16'h0338 :  // <0211> "
addr == 16'h4f7 ? 16'h6600 :  // <0212> ram b = $ram_ign_avg_jf // av_ad_hi = 0
addr == 16'h4f8 ? 16'h6a7a :  // <0212> ram b = $ram_ign_avg_jf // av_ad_lo = 122
addr == 16'h4f9 ? 16'h0417 :  // <0212> ram b = $ram_ign_avg_jf // b = av_write_data // start read cycle
addr == 16'h4fa ? 16'h0418 :  // <0212> ram b = $ram_ign_avg_jf // b = av_read_data // finish read cycle
addr == 16'h4fb ? 16'hc800 :  // <0213> x = a+b
addr == 16'h4fc ? 16'h1300 :  // <0213> "

addr == 16'h4fd ? 16'h0007 :  // <0216> a = gb
addr == 16'h4fe ? 16'h0404 :  // <0216> b = x

addr == 16'h4ff ? 16'he406 :  // <0214> bn gt :else_1279
addr == 16'h500 ? 16'h0502 :  // <0214> "

addr == 16'h501 ? 16'h1c04 :  // <0215> gb = x

// min is the safety amount to keep motor running and maybe prevent leaning damage.
//patch: don't know a proper minimum.

// shut off puff during closed throttle engine braking.
//patch: not implemented.

// memorize total puff.
addr == 16'h502 ? 16'h6600 :  // <0224> ram $ram_next_puff_len_us = ga // av_ad_hi = 0
addr == 16'h503 ? 16'h6a90 :  // <0224> ram $ram_next_puff_len_us = ga // av_ad_lo = 144
addr == 16'h504 ? 16'h5c06 :  // <0224> ram $ram_next_puff_len_us = ga // av_write_data = ga

// :abort // = 0x0505

addr == 16'h505 ? 16'hf80c :  // <0228> pop rtna // func puff_len_run
addr == 16'h506 ? 16'h1c0c :  // <0228> pop gb // "
addr == 16'h507 ? 16'h100c :  // <0228> pop x // "
addr == 16'h508 ? 16'hfc00 :  // <0228> swapra = nop

// ######## func leave_run // = 0x0509
addr == 16'h509 ? 16'h303e :  // <0231> push rtna // func leave_run

addr == 16'h50a ? 16'hfba0 :  // <0230> callx  check_engine_stop  pa
addr == 16'h50b ? 16'h0a7b :  // <0230> "
addr == 16'h50c ? 16'hfc00 :  // <0230> "

addr == 16'h50d ? 16'hf80c :  // <0232> pop rtna // func leave_run
addr == 16'h50e ? 16'hfc00 :  // <0232> swapra = nop

// ######## func interpret_block_temp // = 0x050f
addr == 16'h50f ? 16'h3002 :  // <0250> push i // func interpret_block_temp
addr == 16'h510 ? 16'h3007 :  // <0250> push gb // "

// look up block temperature map trim factor.
addr == 16'h511 ? 16'h0202 :  // <0235> a = $anmux_engine_block_temp

addr == 16'h512 ? 16'h0351 :  // <0236> a = a<<1
addr == 16'h513 ? 16'h0616 :  // <0236> b = 22
addr == 16'h514 ? 16'h6600 :  // <0236> av_ad_hi = 0
addr == 16'h515 ? 16'h6b00 :  // <0236> av_ad_lo = ad0
addr == 16'h516 ? 16'h0417 :  // <0236> b = av_begin_read
addr == 16'h517 ? 16'h0418 :  // <0236> b = av_read_data

addr == 16'h518 ? 16'h1c01 :  // <0237> gb = b
addr == 16'h519 ? 16'h0a00 :  // <0248> i = 0
// :loop_1305 // = 0x051a

addr == 16'h51a ? 16'h0002 :  // <0238> a = i

addr == 16'h51b ? 16'h0351 :  // <0239> a = a<<1
addr == 16'h51c ? 16'h07a0 :  // <0239> b = 2592
addr == 16'h51d ? 16'h0a20 :  // <0239> "
addr == 16'h51e ? 16'h67a0 :  // <0239> av_ad_hi = 256
addr == 16'h51f ? 16'h0100 :  // <0239> "
addr == 16'h520 ? 16'h6b00 :  // <0239> av_ad_lo = ad0
addr == 16'h521 ? 16'h0417 :  // <0239> b = av_begin_read
addr == 16'h522 ? 16'h0418 :  // <0239> b = av_read_data


addr == 16'h523 ? 16'h0001 :  // <0246> a = b
addr == 16'h524 ? 16'h0407 :  // <0246> b = gb

addr == 16'h525 ? 16'he406 :  // <0240> bn gt :else_1317
addr == 16'h526 ? 16'h0538 :  // <0240> "

addr == 16'h527 ? 16'h6600 :  // <0241> ram $ram_block_temp_map_idx = i // av_ad_hi = 0
addr == 16'h528 ? 16'h6aa0 :  // <0241> ram $ram_block_temp_map_idx = i // av_ad_lo = 160
addr == 16'h529 ? 16'h5c02 :  // <0241> ram $ram_block_temp_map_idx = i // av_write_data = i
addr == 16'h52a ? 16'h0002 :  // <0242> a = i

addr == 16'h52b ? 16'h0351 :  // <0243> a = a<<1
addr == 16'h52c ? 16'h07a0 :  // <0243> b = 2720
addr == 16'h52d ? 16'h0aa0 :  // <0243> "
addr == 16'h52e ? 16'h67a0 :  // <0243> av_ad_hi = 256
addr == 16'h52f ? 16'h0100 :  // <0243> "
addr == 16'h530 ? 16'h6b00 :  // <0243> av_ad_lo = ad0
addr == 16'h531 ? 16'h0417 :  // <0243> b = av_begin_read
addr == 16'h532 ? 16'h0418 :  // <0243> b = av_read_data

addr == 16'h533 ? 16'h6600 :  // <0244> ram $ram_block_temp_trim = b // av_ad_hi = 0
addr == 16'h534 ? 16'h6aa2 :  // <0244> ram $ram_block_temp_trim = b // av_ad_lo = 162
addr == 16'h535 ? 16'h5c01 :  // <0244> ram $ram_block_temp_trim = b // av_write_data = b
addr == 16'h536 ? 16'he00f :  // <0245> jmp :temp_done
addr == 16'h537 ? 16'h0540 :  // <0245> "



addr == 16'h538 ? 16'h0002 :  // <0248> a = i
addr == 16'h539 ? 16'h0601 :  // <0248> b = 1
addr == 16'h53a ? 16'hc800 :  // <0248> i = a+b
addr == 16'h53b ? 16'h0b00 :  // <0248> "


addr == 16'h53c ? 16'h0002 :  // <0248> a = i
addr == 16'h53d ? 16'h0640 :  // <0248> b = $block_temp_num_cells
addr == 16'h53e ? 16'he005 :  // <0248> br lt :loop_1305
addr == 16'h53f ? 16'h051a :  // <0248> "

// :end_1305 // = 0x0540
// :temp_done // = 0x0540

addr == 16'h540 ? 16'h1c0c :  // <0251> pop gb // func interpret_block_temp
addr == 16'h541 ? 16'h080c :  // <0251> pop i // "
addr == 16'h542 ? 16'hfc00 :  // <0251> swapra = nop

// ######## func dump_afrc_cmd // = 0x0543
addr == 16'h543 ? 16'h3002 :  // <0275> push i // func dump_afrc_cmd
addr == 16'h544 ? 16'h3004 :  // <0275> push x // "
addr == 16'h545 ? 16'h3006 :  // <0275> push ga // "
addr == 16'h546 ? 16'h3007 :  // <0275> push gb // "
addr == 16'h547 ? 16'h303e :  // <0275> push rtna // "

addr == 16'h548 ? 16'h020d :  // <0253> a = 13 // puteol
addr == 16'h549 ? 16'hfba0 :  // <0253> puteol
addr == 16'h54a ? 16'h00ab :  // <0253> "
addr == 16'h54b ? 16'hfc00 :  // <0253> "
addr == 16'h54c ? 16'h020a :  // <0253> a = 10 // puteol
addr == 16'h54d ? 16'hfba0 :  // <0253> puteol
addr == 16'h54e ? 16'h00ab :  // <0253> "
addr == 16'h54f ? 16'hfc00 :  // <0253> "
addr == 16'h550 ? 16'h6600 :  // <0254> ram ga = $ram_afrc_maf_row_idx // av_ad_hi = 0
addr == 16'h551 ? 16'h6a9c :  // <0254> ram ga = $ram_afrc_maf_row_idx // av_ad_lo = 156
addr == 16'h552 ? 16'h1817 :  // <0254> ram ga = $ram_afrc_maf_row_idx // ga = av_write_data // start read cycle
addr == 16'h553 ? 16'h1818 :  // <0254> ram ga = $ram_afrc_maf_row_idx // ga = av_read_data // finish read cycle
addr == 16'h554 ? 16'h6600 :  // <0255> ram gb = $ram_afrc_rpm_col_idx // av_ad_hi = 0
addr == 16'h555 ? 16'h6a9e :  // <0255> ram gb = $ram_afrc_rpm_col_idx // av_ad_lo = 158
addr == 16'h556 ? 16'h1c17 :  // <0255> ram gb = $ram_afrc_rpm_col_idx // gb = av_write_data // start read cycle
addr == 16'h557 ? 16'h1c18 :  // <0255> ram gb = $ram_afrc_rpm_col_idx // gb = av_read_data // finish read cycle
addr == 16'h558 ? 16'h67a0 :  // <0256> av_ad_hi = ([ram_join $ram_afrc_map] >> 16)
addr == 16'h559 ? 16'h0100 :  // <0256> "
addr == 16'h55a ? 16'h6a00 :  // <0257> av_ad_lo = ([ram_join $ram_afrc_map] & 0xffff)
addr == 16'h55b ? 16'h0a00 :  // <0274> i = 0
// :loop_1371 // = 0x055c

addr == 16'h55c ? 16'h1200 :  // <0271> x = 0
// :loop_1372 // = 0x055d

addr == 16'h55d ? 16'h0017 :  // <0258> a = av_begin_read
addr == 16'h55e ? 16'h0018 :  // <0259> a = av_read_data
addr == 16'h55f ? 16'hfba0 :  // <0260> call put4x
addr == 16'h560 ? 16'h00d3 :  // <0260> "
addr == 16'h561 ? 16'hfc00 :  // <0260> "

addr == 16'h562 ? 16'h0004 :  // <0265> a = x
addr == 16'h563 ? 16'h0407 :  // <0265> b = gb

addr == 16'h564 ? 16'he407 :  // <0261> bn eq :else_1380
addr == 16'h565 ? 16'h056c :  // <0261> "

addr == 16'h566 ? 16'h023c :  // <0262> a = 60 // putasc "<"
addr == 16'h567 ? 16'hfba0 :  // <0262> putasc "<"
addr == 16'h568 ? 16'h00ab :  // <0262> "
addr == 16'h569 ? 16'hfc00 :  // <0262> "

addr == 16'h56a ? 16'he00f :  // <0264> jmp :end_1380
addr == 16'h56b ? 16'h0570 :  // <0264> "

addr == 16'h56c ? 16'h0220 :  // <0265> a = 32 // putasc " "
addr == 16'h56d ? 16'hfba0 :  // <0265> putasc " "
addr == 16'h56e ? 16'h00ab :  // <0265> "
addr == 16'h56f ? 16'hfc00 :  // <0265> "

addr == 16'h570 ? 16'h0220 :  // <0266> a = 32 // putasc " "
addr == 16'h571 ? 16'hfba0 :  // <0266> putasc " "
addr == 16'h572 ? 16'h00ab :  // <0266> "
addr == 16'h573 ? 16'hfc00 :  // <0266> "
addr == 16'h574 ? 16'h001a :  // <0267> a = av_ad_lo
addr == 16'h575 ? 16'h0602 :  // <0268> b = 2
addr == 16'h576 ? 16'hc800 :  // <0269> av_ad_lo = a+b
addr == 16'h577 ? 16'h6b00 :  // <0269> "


addr == 16'h578 ? 16'h0004 :  // <0271> a = x
addr == 16'h579 ? 16'h0601 :  // <0271> b = 1
addr == 16'h57a ? 16'hc800 :  // <0271> x = a+b
addr == 16'h57b ? 16'h1300 :  // <0271> "


addr == 16'h57c ? 16'h0004 :  // <0271> a = x
addr == 16'h57d ? 16'h0610 :  // <0271> b = $afrc_rpm_cols
addr == 16'h57e ? 16'he005 :  // <0271> br lt :loop_1372
addr == 16'h57f ? 16'h055d :  // <0271> "

// :end_1372 // = 0x0580
addr == 16'h580 ? 16'h020d :  // <0272> a = 13 // puteol
addr == 16'h581 ? 16'hfba0 :  // <0272> puteol
addr == 16'h582 ? 16'h00ab :  // <0272> "
addr == 16'h583 ? 16'hfc00 :  // <0272> "
addr == 16'h584 ? 16'h020a :  // <0272> a = 10 // puteol
addr == 16'h585 ? 16'hfba0 :  // <0272> puteol
addr == 16'h586 ? 16'h00ab :  // <0272> "
addr == 16'h587 ? 16'hfc00 :  // <0272> "


addr == 16'h588 ? 16'h0002 :  // <0274> a = i
addr == 16'h589 ? 16'h0601 :  // <0274> b = 1
addr == 16'h58a ? 16'hc800 :  // <0274> i = a+b
addr == 16'h58b ? 16'h0b00 :  // <0274> "


addr == 16'h58c ? 16'h0002 :  // <0274> a = i
addr == 16'h58d ? 16'h0640 :  // <0274> b = $afrc_maf_rows
addr == 16'h58e ? 16'he005 :  // <0274> br lt :loop_1371
addr == 16'h58f ? 16'h055c :  // <0274> "

// :end_1371 // = 0x0590

addr == 16'h590 ? 16'hf80c :  // <0276> pop rtna // func dump_afrc_cmd
addr == 16'h591 ? 16'h1c0c :  // <0276> pop gb // "
addr == 16'h592 ? 16'h180c :  // <0276> pop ga // "
addr == 16'h593 ? 16'h100c :  // <0276> pop x // "
addr == 16'h594 ? 16'h080c :  // <0276> pop i // "
addr == 16'h595 ? 16'hfc00 :  // <0276> swapra = nop

// ######## func load_afrc_cmd // = 0x0596
addr == 16'h596 ? 16'h3002 :  // <0311> push i // func load_afrc_cmd
addr == 16'h597 ? 16'h3005 :  // <0311> push y // "
addr == 16'h598 ? 16'h303e :  // <0311> push rtna // "

// loads 1 row only.

addr == 16'h599 ? 16'hfba0 :  // <0280> callx fletcher16_init
addr == 16'h59a ? 16'h022d :  // <0280> "
addr == 16'h59b ? 16'hfc00 :  // <0280> "
// expect valid row index.
addr == 16'h59c ? 16'hfba0 :  // <0282> call  get4x
addr == 16'h59d ? 16'h010c :  // <0282> "
addr == 16'h59e ? 16'hfc00 :  // <0282> "
addr == 16'h59f ? 16'h1400 :  // <0283> y = a
addr == 16'h5a0 ? 16'hfba0 :  // <0284> callx fletcher16_input16  a
addr == 16'h5a1 ? 16'h024d :  // <0284> "
addr == 16'h5a2 ? 16'hfc00 :  // <0284> "

addr == 16'h5a3 ? 16'h0005 :  // <0305> a = y
addr == 16'h5a4 ? 16'h0640 :  // <0305> b = 64

addr == 16'h5a5 ? 16'he405 :  // <0285> bn lt :else_1445
addr == 16'h5a6 ? 16'h05c9 :  // <0285> "

// set RAM address to start of given row.  call struct_read for its side effect on Avalon address regs.
addr == 16'h5a7 ? 16'h0005 :  // <0287> a = y
addr == 16'h5a8 ? 16'h0610 :  // <0288> b = $afrc_rpm_cols
addr == 16'h5a9 ? 16'hc800 :  // <0289> nop
addr == 16'h5aa ? 16'hc800 :  // <0290> nop
addr == 16'h5ab ? 16'hc800 :  // <0291> nop
addr == 16'h5ac ? 16'hc800 :  // <0292> nop
addr == 16'h5ad ? 16'h0410 :  // <0293> b = product_lo

addr == 16'h5ae ? 16'h0351 :  // <0294> a = a<<1
addr == 16'h5af ? 16'h0600 :  // <0294> b = 0
addr == 16'h5b0 ? 16'h67a0 :  // <0294> av_ad_hi = 256
addr == 16'h5b1 ? 16'h0100 :  // <0294> "
addr == 16'h5b2 ? 16'h6b00 :  // <0294> av_ad_lo = ad0
addr == 16'h5b3 ? 16'h0417 :  // <0294> b = av_begin_read
addr == 16'h5b4 ? 16'h0418 :  // <0294> b = av_read_data


// expect each cell value back-to-back.
addr == 16'h5b5 ? 16'h0a00 :  // <0304> i = 0
// :loop_1461 // = 0x05b6

addr == 16'h5b6 ? 16'hfba0 :  // <0297> call  get4x
addr == 16'h5b7 ? 16'h010c :  // <0297> "
addr == 16'h5b8 ? 16'hfc00 :  // <0297> "
addr == 16'h5b9 ? 16'hfba0 :  // <0298> callx fletcher16_input16  a
addr == 16'h5ba ? 16'h024d :  // <0298> "
addr == 16'h5bb ? 16'hfc00 :  // <0298> "
addr == 16'h5bc ? 16'h5c00 :  // <0299> av_write_data = a
addr == 16'h5bd ? 16'h001a :  // <0300> a = av_ad_lo
addr == 16'h5be ? 16'h0602 :  // <0301> b = 2
addr == 16'h5bf ? 16'hc800 :  // <0302> av_ad_lo = a+b
addr == 16'h5c0 ? 16'h6b00 :  // <0302> "


addr == 16'h5c1 ? 16'h0002 :  // <0304> a = i
addr == 16'h5c2 ? 16'h0601 :  // <0304> b = 1
addr == 16'h5c3 ? 16'hc800 :  // <0304> i = a+b
addr == 16'h5c4 ? 16'h0b00 :  // <0304> "


addr == 16'h5c5 ? 16'h0002 :  // <0304> a = i
addr == 16'h5c6 ? 16'h0610 :  // <0304> b = $afrc_rpm_cols
addr == 16'h5c7 ? 16'he005 :  // <0304> br lt :loop_1461
addr == 16'h5c8 ? 16'h05b6 :  // <0304> "

// :end_1461 // = 0x05c9


// reply with checksum
addr == 16'h5c9 ? 16'hfba0 :  // <0308> callx fletcher16_result a
addr == 16'h5ca ? 16'h025e :  // <0308> "
addr == 16'h5cb ? 16'hfc00 :  // <0308> "
addr == 16'h5cc ? 16'hfba0 :  // <0309> call put4x
addr == 16'h5cd ? 16'h00d3 :  // <0309> "
addr == 16'h5ce ? 16'hfc00 :  // <0309> "
addr == 16'h5cf ? 16'h020d :  // <0310> a = 13 // puteol
addr == 16'h5d0 ? 16'hfba0 :  // <0310> puteol
addr == 16'h5d1 ? 16'h00ab :  // <0310> "
addr == 16'h5d2 ? 16'hfc00 :  // <0310> "
addr == 16'h5d3 ? 16'h020a :  // <0310> a = 10 // puteol
addr == 16'h5d4 ? 16'hfba0 :  // <0310> puteol
addr == 16'h5d5 ? 16'h00ab :  // <0310> "
addr == 16'h5d6 ? 16'hfc00 :  // <0310> "

addr == 16'h5d7 ? 16'hf80c :  // <0312> pop rtna // func load_afrc_cmd
addr == 16'h5d8 ? 16'h140c :  // <0312> pop y // "
addr == 16'h5d9 ? 16'h080c :  // <0312> pop i // "
addr == 16'h5da ? 16'hfc00 :  // <0312> swapra = nop


// #########################################################################
// :main // = 0x05db
addr == 16'h5db ? 16'h03a0 :  // <0224> a = :boot_msg
addr == 16'h5dc ? 16'h009b :  // <0224> "
addr == 16'h5dd ? 16'hfba0 :  // <0225> call :print_nt
addr == 16'h5de ? 16'h015f :  // <0225> "
addr == 16'h5df ? 16'hfc00 :  // <0225> "

// clear the first 64k of RAM.
addr == 16'h5e0 ? 16'h6600 :  // <0228> av_ad_hi = 0
addr == 16'h5e1 ? 16'hfba0 :  // <0228> callx  clear_ram_page  0
addr == 16'h5e2 ? 16'h0967 :  // <0228> "
addr == 16'h5e3 ? 16'hfc00 :  // <0228> "

addr == 16'h5e4 ? 16'hfba0 :  // <0230> callx  init_drom
addr == 16'h5e5 ? 16'h0266 :  // <0230> "
addr == 16'h5e6 ? 16'hfc00 :  // <0230> "

// init fuel injection.
addr == 16'h5e7 ? 16'hfba0 :  // <0233> callx  init_plan_stop
addr == 16'h5e8 ? 16'h0349 :  // <0233> "
addr == 16'h5e9 ? 16'hfc00 :  // <0233> "

// power up FTDI USB board, and init any other special board control functions.
addr == 16'h5ea ? 16'h8280 :  // <0236> board_ctrl = $ftdi_power_mask
addr == 16'h5eb ? 16'hfba0 :  // <0237> callx postpone_comm_restart
addr == 16'h5ec ? 16'h093e :  // <0237> "
addr == 16'h5ed ? 16'hfc00 :  // <0237> "

// check initial state of power management circuits.
// if power is lost or ignition switch is off already, open relay & abort run.
// that's important because then the event controller booted up too late to
// see edges on those 2 signals.  regular system would never shut itself down.
// this setup is the last thing done prior to the event handler loop.
addr == 16'h5ee ? 16'h8a00 :  // <0244> power_duty = $power_duty_closing

addr == 16'h5ef ? 16'h0022 :  // <0248> a = power_duty
addr == 16'h5f0 ? 16'h06c0 :  // <0248> b = ( $power_lost_mask | $ign_switch_off_mask )

addr == 16'h5f1 ? 16'he003 :  // <0245> br and0z :else_1521
addr == 16'h5f2 ? 16'h05f8 :  // <0245> "

addr == 16'h5f3 ? 16'h8a32 :  // <0246> power_duty = $power_duty_opening
addr == 16'h5f4 ? 16'h7fa0 :  // <0247> error_halt_code $err_power_lost_at_boot // leds = 0xfffb
addr == 16'h5f5 ? 16'hfffb :  // <0247> "
addr == 16'h5f6 ? 16'he00f :  // <0247> error_halt_code $err_power_lost_at_boot
addr == 16'h5f7 ? 16'h05f6 :  // <0247> "

addr == 16'h5f8 ? 16'h6600 :  // <0249> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h5f9 ? 16'h6a3c :  // <0249> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 60
addr == 16'h5fa ? 16'h5f60 :  // <0249> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h5fb ? 16'h6600 :  // <0250> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_hi = 0
addr == 16'h5fc ? 16'h6a3e :  // <0250> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_lo = 62
addr == 16'h5fd ? 16'h5e02 :  // <0250> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_write_data = 2

// start handling events.
addr == 16'h5fe ? 16'h3ba0 :  // <0253> soft_event = $event_controller_reset_mask
addr == 16'h5ff ? 16'h8000 :  // <0253> "
addr == 16'h600 ? 16'h3a00 :  // <0254> soft_event = 0
addr == 16'h601 ? 16'h4fa0 :  // <0255> mstimer0 = 1000
addr == 16'h602 ? 16'h03e8 :  // <0255> "
addr == 16'h603 ? 16'h5614 :  // <0256> mstimer2 = $plan_tick_ms
addr == 16'h604 ? 16'he00f :  // <0257> jmp :poll_events
addr == 16'h605 ? 16'h009e :  // <0257> "

// event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.
// event 0 not used in this app anyway.
// :event_table // = 0x0606
addr == 16'h606 ? 16'h009e :  // <0262> ([label :poll_events])
addr == 16'h607 ? 16'h0899 :  // <0263> ([label :power_lost_handler])
addr == 16'h608 ? 16'h061b :  // <0264> ([label :ign_capture_handler])
addr == 16'h609 ? 16'h06bd :  // <0265> ([label :ign_capture_timeout_handler])
addr == 16'h60a ? 16'h08cd :  // <0266> ([label :puff1_done_handler])
addr == 16'h60b ? 16'h06c2 :  // <0267> ([label :ustimer0_handler])
addr == 16'h60c ? 16'h0814 :  // <0268> ([label :spi_done_handler])
addr == 16'h60d ? 16'h06c4 :  // <0269> ([label :mstimer0_handler])
addr == 16'h60e ? 16'h07e0 :  // <0270> ([label :mstimer1_handler])
addr == 16'h60f ? 16'h06f3 :  // <0271> ([label :mstimer2_handler])
addr == 16'h610 ? 16'h071f :  // <0272> ([label :uart_rx_handler])
addr == 16'h611 ? 16'h0738 :  // <0273> ([label :uart_rx_overflow_handler])
addr == 16'h612 ? 16'h0740 :  // <0274> ([label :uart_tx_overflow_handler])
addr == 16'h613 ? 16'h0747 :  // <0275> ([label :key0_handler])
addr == 16'h614 ? 16'h0751 :  // <0276> ([label :key1_handler])
addr == 16'h615 ? 16'h08b0 :  // <0277> ([label :ign_switch_off_handler])
addr == 16'h616 ? 16'h08c3 :  // <0278> ([label :ign_switch_on_handler])
addr == 16'h617 ? 16'h075b :  // <0279> ([label :softevent3_handler])
addr == 16'h618 ? 16'h075d :  // <0280> ([label :softevent2_handler])
addr == 16'h619 ? 16'h075f :  // <0281> ([label :softevent1_handler])
addr == 16'h61a ? 16'h0761 :  // <0282> ([label :softevent0_handler])

// #########################################################################

// ######## event ign_capture_handler // = 0x061b
// discard outlier time.
addr == 16'h61b ? 16'h1823 :  // <0288> g6 = ign_capture_jf
addr == 16'h61c ? 16'h6600 :  // <0289> ram b = $ram_ign_fastest_jf // av_ad_hi = 0
addr == 16'h61d ? 16'h6a82 :  // <0289> ram b = $ram_ign_fastest_jf // av_ad_lo = 130
addr == 16'h61e ? 16'h0417 :  // <0289> ram b = $ram_ign_fastest_jf // b = av_write_data // start read cycle
addr == 16'h61f ? 16'h0418 :  // <0289> ram b = $ram_ign_fastest_jf // b = av_read_data // finish read cycle

addr == 16'h620 ? 16'h0006 :  // <0292> a = g6
addr == 16'h621 ? 16'h0401 :  // <0292> b = b

addr == 16'h622 ? 16'he405 :  // <0290> bn lt :else_1570
addr == 16'h623 ? 16'h0625 :  // <0290> "

addr == 16'h624 ? 16'h1a00 :  // <0291> g6 = 0

addr == 16'h625 ? 16'h6600 :  // <0293> ram b = $ram_ign_slowest_jf // av_ad_hi = 0
addr == 16'h626 ? 16'h6a84 :  // <0293> ram b = $ram_ign_slowest_jf // av_ad_lo = 132
addr == 16'h627 ? 16'h0417 :  // <0293> ram b = $ram_ign_slowest_jf // b = av_write_data // start read cycle
addr == 16'h628 ? 16'h0418 :  // <0293> ram b = $ram_ign_slowest_jf // b = av_read_data // finish read cycle

addr == 16'h629 ? 16'h0006 :  // <0296> a = g6
addr == 16'h62a ? 16'h0401 :  // <0296> b = b

addr == 16'h62b ? 16'he406 :  // <0294> bn gt :else_1579
addr == 16'h62c ? 16'h062e :  // <0294> "

addr == 16'h62d ? 16'h1a00 :  // <0295> g6 = 0


// increment buffer index and memorize time.
addr == 16'h62e ? 16'h6600 :  // <0299> ram a = $ram_ign_history_idx // av_ad_hi = 0
addr == 16'h62f ? 16'h6a58 :  // <0299> ram a = $ram_ign_history_idx // av_ad_lo = 88
addr == 16'h630 ? 16'h0017 :  // <0299> ram a = $ram_ign_history_idx // a = av_write_data // start read cycle
addr == 16'h631 ? 16'h0018 :  // <0299> ram a = $ram_ign_history_idx // a = av_read_data // finish read cycle
addr == 16'h632 ? 16'h0601 :  // <0300> b = 1
addr == 16'h633 ? 16'hc800 :  // <0301> a = a+b
addr == 16'h634 ? 16'h0300 :  // <0301> "
addr == 16'h635 ? 16'h060f :  // <0302> b = $ign_history_idx_mask
addr == 16'h636 ? 16'hc800 :  // <0303> a = and
addr == 16'h637 ? 16'h0330 :  // <0303> "
addr == 16'h638 ? 16'h6600 :  // <0304> ram $ram_ign_history_idx = a // av_ad_hi = 0
addr == 16'h639 ? 16'h6a58 :  // <0304> ram $ram_ign_history_idx = a // av_ad_lo = 88
addr == 16'h63a ? 16'h5c00 :  // <0304> ram $ram_ign_history_idx = a // av_write_data = a
addr == 16'h63b ? 16'h0406 :  // <0305> b = g6

addr == 16'h63c ? 16'h0351 :  // <0306> a = a<<1
addr == 16'h63d ? 16'h3001 :  // <0306> push b // push b
addr == 16'h63e ? 16'h065a :  // <0306> b = 90
addr == 16'h63f ? 16'h6600 :  // <0306> av_ad_hi = 0
addr == 16'h640 ? 16'h6b00 :  // <0306> av_ad_lo = ad0
addr == 16'h641 ? 16'h5c0c :  // <0306> pop av_write_data // pop av_write_data


// ////////// compute new jiffy estimate.
// average entire history.
// x = total, y = sample, i = index = loop count, g6 = count of invalid samples.
addr == 16'h642 ? 16'h1200 :  // <0311> x = 0
addr == 16'h643 ? 16'h1a00 :  // <0312> g6 = 0
addr == 16'h644 ? 16'h0a00 :  // <0328> i = 0
// :loop_1604 // = 0x0645

addr == 16'h645 ? 16'h0002 :  // <0313> a = i

addr == 16'h646 ? 16'h0351 :  // <0314> a = a<<1
addr == 16'h647 ? 16'h065a :  // <0314> b = 90
addr == 16'h648 ? 16'h6600 :  // <0314> av_ad_hi = 0
addr == 16'h649 ? 16'h6b00 :  // <0314> av_ad_lo = ad0
addr == 16'h64a ? 16'h0417 :  // <0314> b = av_begin_read
addr == 16'h64b ? 16'h0418 :  // <0314> b = av_read_data

addr == 16'h64c ? 16'h1401 :  // <0315> y = b

addr == 16'h64d ? 16'h0005 :  // <0326> a = y
addr == 16'h64e ? 16'h0600 :  // <0326> b = 0

addr == 16'h64f ? 16'he407 :  // <0316> bn eq :else_1615
addr == 16'h650 ? 16'h0657 :  // <0316> "

addr == 16'h651 ? 16'h0006 :  // <0317> a = g6
addr == 16'h652 ? 16'h0601 :  // <0318> b = 1
addr == 16'h653 ? 16'hc800 :  // <0319> g6 = a+b
addr == 16'h654 ? 16'h1b00 :  // <0319> "

addr == 16'h655 ? 16'he00f :  // <0321> jmp :end_1615
addr == 16'h656 ? 16'h065e :  // <0321> "

addr == 16'h657 ? 16'h0208 :  // <0322> a = ($ign_history_len / 2)
addr == 16'h658 ? 16'h0405 :  // <0323> b = y
addr == 16'h659 ? 16'hc800 :  // <0324> a = a+b
addr == 16'h65a ? 16'h0300 :  // <0324> "
addr == 16'h65b ? 16'h1753 :  // <0325> y = a>>$ign_history_idx_bits
addr == 16'h65c ? 16'hc800 :  // <0326> x = x+y
addr == 16'h65d ? 16'h1320 :  // <0326> "



addr == 16'h65e ? 16'h0002 :  // <0328> a = i
addr == 16'h65f ? 16'h0601 :  // <0328> b = 1
addr == 16'h660 ? 16'hc800 :  // <0328> i = a+b
addr == 16'h661 ? 16'h0b00 :  // <0328> "


addr == 16'h662 ? 16'h0002 :  // <0328> a = i
addr == 16'h663 ? 16'h0610 :  // <0328> b = $ign_history_len
addr == 16'h664 ? 16'he005 :  // <0328> br lt :loop_1604
addr == 16'h665 ? 16'h0645 :  // <0328> "

// :end_1604 // = 0x0666
addr == 16'h666 ? 16'h6600 :  // <0329> ram $ram_ign_avg_jf = x // av_ad_hi = 0
addr == 16'h667 ? 16'h6a7a :  // <0329> ram $ram_ign_avg_jf = x // av_ad_lo = 122
addr == 16'h668 ? 16'h5c04 :  // <0329> ram $ram_ign_avg_jf = x // av_write_data = x
addr == 16'h669 ? 16'h6600 :  // <0330> ram $ram_ign_bad_samples = g6 // av_ad_hi = 0
addr == 16'h66a ? 16'h6a80 :  // <0330> ram $ram_ign_bad_samples = g6 // av_ad_lo = 128
addr == 16'h66b ? 16'h5c06 :  // <0330> ram $ram_ign_bad_samples = g6 // av_write_data = g6
//patch: dividing before summing (instead of after) is much simpler and faster because it prevents overflow.
// but it means we could be reading as much as 16 jf too low (16 = ign_history_len).
// that error is way less than 1 RPM on the slow end,
// or about 1,000 RPM too fast on the fast end!
// might need to tighten that up.  one simple way might be adding ign_history_len / 2 to each history record prior to dividing.
// that didn't seem to help much in simple testing.
// probly because jf_to_rpm has only 32 RPM resolution.


addr == 16'h66c ? 16'h0006 :  // <0359> a = g6
addr == 16'h66d ? 16'h0604 :  // <0359> b = ( $ign_history_len / 4 )

addr == 16'h66e ? 16'he406 :  // <0339> bn gt :else_1646
addr == 16'h66f ? 16'h0675 :  // <0339> "

addr == 16'h670 ? 16'h6600 :  // <0340> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h671 ? 16'h6a7e :  // <0340> ram $ram_rpm_valid = 0 // av_ad_lo = 126
addr == 16'h672 ? 16'h5e00 :  // <0340> ram $ram_rpm_valid = 0 // av_write_data = 0

addr == 16'h673 ? 16'he00f :  // <0342> jmp :end_1646
addr == 16'h674 ? 16'h06a1 :  // <0342> "

// convert jiffies b to new RPM estimate.
addr == 16'h675 ? 16'h2004 :  // <0344> pa = x
addr == 16'h676 ? 16'hfba0 :  // <0344> callx  jf_to_rpm  x  pa
addr == 16'h677 ? 16'h0a6f :  // <0344> "
addr == 16'h678 ? 16'hfc00 :  // <0344> "
addr == 16'h679 ? 16'h6600 :  // <0345> ram $ram_avg_rpm = pa // av_ad_hi = 0
addr == 16'h67a ? 16'h6a7c :  // <0345> ram $ram_avg_rpm = pa // av_ad_lo = 124
addr == 16'h67b ? 16'h5c08 :  // <0345> ram $ram_avg_rpm = pa // av_write_data = pa
addr == 16'h67c ? 16'h6600 :  // <0346> ram $ram_rpm_valid = 1 // av_ad_hi = 0
addr == 16'h67d ? 16'h6a7e :  // <0346> ram $ram_rpm_valid = 1 // av_ad_lo = 126
addr == 16'h67e ? 16'h5e01 :  // <0346> ram $ram_rpm_valid = 1 // av_write_data = 1

// find RPM column in AFRC map.
addr == 16'h67f ? 16'h6600 :  // <0349> ram gb = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h680 ? 16'h6a7c :  // <0349> ram gb = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h681 ? 16'h1c17 :  // <0349> ram gb = $ram_avg_rpm // gb = av_write_data // start read cycle
addr == 16'h682 ? 16'h1c18 :  // <0349> ram gb = $ram_avg_rpm // gb = av_read_data // finish read cycle
addr == 16'h683 ? 16'h0a00 :  // <0357> i = 0
// :loop_1667 // = 0x0684

addr == 16'h684 ? 16'h0002 :  // <0350> a = i

addr == 16'h685 ? 16'h0351 :  // <0351> a = a<<1
addr == 16'h686 ? 16'h07a0 :  // <0351> b = 2560
addr == 16'h687 ? 16'h0a00 :  // <0351> "
addr == 16'h688 ? 16'h67a0 :  // <0351> av_ad_hi = 256
addr == 16'h689 ? 16'h0100 :  // <0351> "
addr == 16'h68a ? 16'h6b00 :  // <0351> av_ad_lo = ad0
addr == 16'h68b ? 16'h0417 :  // <0351> b = av_begin_read
addr == 16'h68c ? 16'h0418 :  // <0351> b = av_read_data


addr == 16'h68d ? 16'h0001 :  // <0355> a = b
addr == 16'h68e ? 16'h0407 :  // <0355> b = gb

addr == 16'h68f ? 16'he406 :  // <0352> bn gt :else_1679
addr == 16'h690 ? 16'h0696 :  // <0352> "

addr == 16'h691 ? 16'h6600 :  // <0353> ram $ram_afrc_rpm_col_idx = i // av_ad_hi = 0
addr == 16'h692 ? 16'h6a9e :  // <0353> ram $ram_afrc_rpm_col_idx = i // av_ad_lo = 158
addr == 16'h693 ? 16'h5c02 :  // <0353> ram $ram_afrc_rpm_col_idx = i // av_write_data = i
addr == 16'h694 ? 16'he00f :  // <0354> jmp :rpm_found
addr == 16'h695 ? 16'h06a1 :  // <0354> "



addr == 16'h696 ? 16'h0002 :  // <0357> a = i
addr == 16'h697 ? 16'h0601 :  // <0357> b = 1
addr == 16'h698 ? 16'hc800 :  // <0357> i = a+b
addr == 16'h699 ? 16'h0b00 :  // <0357> "


addr == 16'h69a ? 16'h0002 :  // <0357> a = i
addr == 16'h69b ? 16'h0610 :  // <0357> b = $rpm_map_num_cells
addr == 16'h69c ? 16'he005 :  // <0357> br lt :loop_1667
addr == 16'h69d ? 16'h0684 :  // <0357> "

// :end_1667 // = 0x069e
addr == 16'h69e ? 16'h6600 :  // <0358> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h69f ? 16'h6a7e :  // <0358> ram $ram_rpm_valid = 0 // av_ad_lo = 126
addr == 16'h6a0 ? 16'h5e00 :  // <0358> ram $ram_rpm_valid = 0 // av_write_data = 0
// :rpm_found // = 0x06a1

addr == 16'h6a1 ? 16'he00f :  // <0360> end_event
addr == 16'h6a2 ? 16'h009e :  // <0360> "

// ######## func clear_ign_history // = 0x06a3
addr == 16'h6a3 ? 16'h3002 :  // <0373> push i // func clear_ign_history

// invalidate the RPM estimate.
addr == 16'h6a4 ? 16'h6600 :  // <0364> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h6a5 ? 16'h6a7e :  // <0364> ram $ram_rpm_valid = 0 // av_ad_lo = 126
addr == 16'h6a6 ? 16'h5e00 :  // <0364> ram $ram_rpm_valid = 0 // av_write_data = 0
// the last known RPM estimate is retained here, not cleared.
// clear the history so it won't be valid again until several more valid samples are collected.
addr == 16'h6a7 ? 16'h6600 :  // <0367> ram $ram_ign_bad_samples = $ign_history_len // av_ad_hi = 0
addr == 16'h6a8 ? 16'h6a80 :  // <0367> ram $ram_ign_bad_samples = $ign_history_len // av_ad_lo = 128
addr == 16'h6a9 ? 16'h5e10 :  // <0367> ram $ram_ign_bad_samples = $ign_history_len // av_write_data = 16
addr == 16'h6aa ? 16'h0a00 :  // <0372> i = 0
// :loop_1706 // = 0x06ab

addr == 16'h6ab ? 16'h0002 :  // <0368> a = i
addr == 16'h6ac ? 16'h0600 :  // <0369> b = 0

addr == 16'h6ad ? 16'h0351 :  // <0370> a = a<<1
addr == 16'h6ae ? 16'h3001 :  // <0370> push b // push b
addr == 16'h6af ? 16'h065a :  // <0370> b = 90
addr == 16'h6b0 ? 16'h6600 :  // <0370> av_ad_hi = 0
addr == 16'h6b1 ? 16'h6b00 :  // <0370> av_ad_lo = ad0
addr == 16'h6b2 ? 16'h5c0c :  // <0370> pop av_write_data // pop av_write_data



addr == 16'h6b3 ? 16'h0002 :  // <0372> a = i
addr == 16'h6b4 ? 16'h0601 :  // <0372> b = 1
addr == 16'h6b5 ? 16'hc800 :  // <0372> i = a+b
addr == 16'h6b6 ? 16'h0b00 :  // <0372> "


addr == 16'h6b7 ? 16'h0002 :  // <0372> a = i
addr == 16'h6b8 ? 16'h0610 :  // <0372> b = $ign_history_len
addr == 16'h6b9 ? 16'he005 :  // <0372> br lt :loop_1706
addr == 16'h6ba ? 16'h06ab :  // <0372> "

// :end_1706 // = 0x06bb

addr == 16'h6bb ? 16'h080c :  // <0374> pop i // func clear_ign_history
addr == 16'h6bc ? 16'hfc00 :  // <0374> swapra = nop

// ######## event ign_capture_timeout_handler // = 0x06bd
// it's been too long since the last ignition pulse detect.
addr == 16'h6bd ? 16'hfba0 :  // <0377> callx clear_ign_history
addr == 16'h6be ? 16'h06a3 :  // <0377> "
addr == 16'h6bf ? 16'hfc00 :  // <0377> "
addr == 16'h6c0 ? 16'he00f :  // <0378> end_event
addr == 16'h6c1 ? 16'h009e :  // <0378> "

// ######## event ustimer0_handler // = 0x06c2
addr == 16'h6c2 ? 16'he00f :  // <0381> end_event
addr == 16'h6c3 ? 16'h009e :  // <0381> "

// ######## event mstimer0_handler // = 0x06c4
// unified 1-second periodic timer for all low-resolution tasks.

// start timer again.
addr == 16'h6c4 ? 16'h4fa0 :  // <0387> mstimer0 = 1000
addr == 16'h6c5 ? 16'h03e8 :  // <0387> "

// realtime counters in RAM.
addr == 16'h6c6 ? 16'h6600 :  // <0390> ram a = $ram_seconds_cnt // av_ad_hi = 0
addr == 16'h6c7 ? 16'h6a42 :  // <0390> ram a = $ram_seconds_cnt // av_ad_lo = 66
addr == 16'h6c8 ? 16'h0017 :  // <0390> ram a = $ram_seconds_cnt // a = av_write_data // start read cycle
addr == 16'h6c9 ? 16'h0018 :  // <0390> ram a = $ram_seconds_cnt // a = av_read_data // finish read cycle
addr == 16'h6ca ? 16'h0601 :  // <0391> b = 1
addr == 16'h6cb ? 16'hc800 :  // <0392> a = a+b
addr == 16'h6cc ? 16'h0300 :  // <0392> "

addr == 16'h6cd ? 16'h0000 :  // <0401> a = a
addr == 16'h6ce ? 16'h063c :  // <0401> b = 60

addr == 16'h6cf ? 16'he407 :  // <0393> bn eq :else_1743
addr == 16'h6d0 ? 16'h06e2 :  // <0393> "

addr == 16'h6d1 ? 16'h6600 :  // <0394> ram $ram_seconds_cnt = 0 // av_ad_hi = 0
addr == 16'h6d2 ? 16'h6a42 :  // <0394> ram $ram_seconds_cnt = 0 // av_ad_lo = 66
addr == 16'h6d3 ? 16'h5e00 :  // <0394> ram $ram_seconds_cnt = 0 // av_write_data = 0
addr == 16'h6d4 ? 16'h6600 :  // <0395> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h6d5 ? 16'h6a40 :  // <0395> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'h6d6 ? 16'h0017 :  // <0395> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h6d7 ? 16'h0018 :  // <0395> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h6d8 ? 16'h0601 :  // <0396> b = 1
addr == 16'h6d9 ? 16'h6600 :  // <0397> ram $ram_minutes_cnt = a+b // av_ad_hi = 0
addr == 16'h6da ? 16'h6a40 :  // <0397> ram $ram_minutes_cnt = a+b // av_ad_lo = 64
addr == 16'h6db ? 16'hc800 :  // <0397> ram $ram_minutes_cnt = a+b // av_write_data = a+b
addr == 16'h6dc ? 16'h5f00 :  // <0397> "
addr == 16'h6dd ? 16'hfba0 :  // <0398> callx minute_events
addr == 16'h6de ? 16'h08dc :  // <0398> "
addr == 16'h6df ? 16'hfc00 :  // <0398> "

addr == 16'h6e0 ? 16'he00f :  // <0400> jmp :end_1743
addr == 16'h6e1 ? 16'h06e5 :  // <0400> "

addr == 16'h6e2 ? 16'h6600 :  // <0401> ram $ram_seconds_cnt = a // av_ad_hi = 0
addr == 16'h6e3 ? 16'h6a42 :  // <0401> ram $ram_seconds_cnt = a // av_ad_lo = 66
addr == 16'h6e4 ? 16'h5c00 :  // <0401> ram $ram_seconds_cnt = a // av_write_data = a


// all 1-second functions here.
addr == 16'h6e5 ? 16'hfba0 :  // <0404> callx check_power_relay
addr == 16'h6e6 ? 16'h08e4 :  // <0404> "
addr == 16'h6e7 ? 16'hfc00 :  // <0404> "
addr == 16'h6e8 ? 16'hfba0 :  // <0405> callx check_communication
addr == 16'h6e9 ? 16'h0911 :  // <0405> "
addr == 16'h6ea ? 16'hfc00 :  // <0405> "
addr == 16'h6eb ? 16'hfba0 :  // <0406> callx start_daq_pass
addr == 16'h6ec ? 16'h0770 :  // <0406> "
addr == 16'h6ed ? 16'hfc00 :  // <0406> "
addr == 16'h6ee ? 16'he00f :  // <0407> end_event
addr == 16'h6ef ? 16'h009e :  // <0407> "

// :plan_transition_msg // = 0x06f0
// "PLAN\x0"
addr == 16'h6f0 ? 16'h4c50 :  // <0410> LP
addr == 16'h6f1 ? 16'h4e41 :  // <0410> NA
addr == 16'h6f2 ? 16'h0000 :  // <0410>   

// ######## event mstimer2_handler // = 0x06f3
// engine management plan tick timer.

// restart timer.
addr == 16'h6f3 ? 16'h5614 :  // <0416> mstimer2 = $plan_tick_ms

// start another TPS reading prior to every plan tick.
// this will also invoke a o2 reading.  that's done last of all prior to plan_tick,
// so there's minimal latency between that and the plan_tick utilizing it.
addr == 16'h6f4 ? 16'h6600 :  // <0421> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h6f5 ? 16'h6a36 :  // <0421> ram a = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'h6f6 ? 16'h0017 :  // <0421> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h6f7 ? 16'h0018 :  // <0421> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle

addr == 16'h6f8 ? 16'h0000 :  // <0424> a = a
addr == 16'h6f9 ? 16'h0600 :  // <0424> b = 0

addr == 16'h6fa ? 16'he407 :  // <0422> bn eq :else_1786
addr == 16'h6fb ? 16'h0700 :  // <0422> "

addr == 16'h6fc ? 16'h2206 :  // <0423> pa = 6
addr == 16'h6fd ? 16'hfba0 :  // <0423> callx  begin_adc_conversion  $tps_adc_channel
addr == 16'h6fe ? 16'h0806 :  // <0423> "
addr == 16'h6ff ? 16'hfc00 :  // <0423> "

addr == 16'h700 ? 16'he00f :  // <0425> end_event
addr == 16'h701 ? 16'h009e :  // <0425> "

// ######## func plan_tick // = 0x0702
addr == 16'h702 ? 16'h3004 :  // <0442> push x // func plan_tick
addr == 16'h703 ? 16'h303e :  // <0442> push rtna // "

// poll the engine management plan.
// call the transition function for the current plan.
// this might perform a transition to some other plan, so it's done first.
addr == 16'h704 ? 16'h6600 :  // <0431> ram rtna = $ram_transition_func // av_ad_hi = 0
addr == 16'h705 ? 16'h6a8c :  // <0431> ram rtna = $ram_transition_func // av_ad_lo = 140
addr == 16'h706 ? 16'hf817 :  // <0431> ram rtna = $ram_transition_func // rtna = av_write_data // start read cycle
addr == 16'h707 ? 16'hf818 :  // <0431> ram rtna = $ram_transition_func // rtna = av_read_data // finish read cycle
addr == 16'h708 ? 16'h103e :  // <0432> x = rtna
addr == 16'h709 ? 16'hfc00 :  // <0433> swapra = nop
addr == 16'h70a ? 16'h6600 :  // <0435> ram b = $ram_transition_func // av_ad_hi = 0
addr == 16'h70b ? 16'h6a8c :  // <0435> ram b = $ram_transition_func // av_ad_lo = 140
addr == 16'h70c ? 16'h0417 :  // <0435> ram b = $ram_transition_func // b = av_write_data // start read cycle
addr == 16'h70d ? 16'h0418 :  // <0435> ram b = $ram_transition_func // b = av_read_data // finish read cycle

addr == 16'h70e ? 16'h0004 :  // <0438> a = x
addr == 16'h70f ? 16'h0401 :  // <0438> b = b

addr == 16'h710 ? 16'he007 :  // <0436> br eq :else_1808
addr == 16'h711 ? 16'h0717 :  // <0436> "

addr == 16'h712 ? 16'h23a0 :  // <0437> pa = :plan_transition_msg
addr == 16'h713 ? 16'h06f0 :  // <0437> "
addr == 16'h714 ? 16'hfba0 :  // <0437> callx  set_text_flag  :plan_transition_msg
addr == 16'h715 ? 16'h096f :  // <0437> "
addr == 16'h716 ? 16'hfc00 :  // <0437> "

// call the puff length function for the current plan.
// this is done last, so if a plan transition just happened, its new puff length will init here.
addr == 16'h717 ? 16'h6600 :  // <0441> ram rtna = $ram_puff_len_func // av_ad_hi = 0
addr == 16'h718 ? 16'h6a8a :  // <0441> ram rtna = $ram_puff_len_func // av_ad_lo = 138
addr == 16'h719 ? 16'hf817 :  // <0441> ram rtna = $ram_puff_len_func // rtna = av_write_data // start read cycle
addr == 16'h71a ? 16'hf818 :  // <0441> ram rtna = $ram_puff_len_func // rtna = av_read_data // finish read cycle
addr == 16'h71b ? 16'hfc00 :  // <0442> swapra = nop

addr == 16'h71c ? 16'hf80c :  // <0445> pop rtna // func plan_tick
addr == 16'h71d ? 16'h100c :  // <0445> pop x // "
addr == 16'h71e ? 16'hfc00 :  // <0445> swapra = nop

// ######## event uart_rx_handler // = 0x071f
// :again // = 0x071f
addr == 16'h71f ? 16'hfba0 :  // <0448> pollchar
addr == 16'h720 ? 16'h00ba :  // <0448> "
addr == 16'h721 ? 16'hfc00 :  // <0448> "
addr == 16'h722 ? 16'h1000 :  // <0449> x = a

addr == 16'h723 ? 16'h0004 :  // <0452> a = x
addr == 16'h724 ? 16'h0760 :  // <0452> b = -1

addr == 16'h725 ? 16'he407 :  // <0450> bn eq :else_1829
addr == 16'h726 ? 16'h0729 :  // <0450> "

addr == 16'h727 ? 16'he00f :  // <0451> event_return
addr == 16'h728 ? 16'h009e :  // <0451> "


addr == 16'h729 ? 16'h0004 :  // <0455> a = x
addr == 16'h72a ? 16'h060a :  // <0455> b = 10

addr == 16'h72b ? 16'he407 :  // <0453> bn eq :else_1835
addr == 16'h72c ? 16'h0730 :  // <0453> "

addr == 16'h72d ? 16'hfba0 :  // <0454> callx  postpone_comm_restart
addr == 16'h72e ? 16'h093e :  // <0454> "
addr == 16'h72f ? 16'hfc00 :  // <0454> "

addr == 16'h730 ? 16'h2004 :  // <0456> pa = x
addr == 16'h731 ? 16'hfba0 :  // <0456> callx  parse_key  x
addr == 16'h732 ? 16'h02ab :  // <0456> "
addr == 16'h733 ? 16'hfc00 :  // <0456> "
addr == 16'h734 ? 16'he00f :  // <0457> jmp :again
addr == 16'h735 ? 16'h071f :  // <0457> "
addr == 16'h736 ? 16'he00f :  // <0458> end_event
addr == 16'h737 ? 16'h009e :  // <0458> "

// ######## event uart_rx_overflow_handler // = 0x0738
addr == 16'h738 ? 16'h7fa0 :  // <0461> error_halt_code $err_rx_overflow // leds = 0xfffe
addr == 16'h739 ? 16'hfffe :  // <0461> "
addr == 16'h73a ? 16'he00f :  // <0461> error_halt_code $err_rx_overflow
addr == 16'h73b ? 16'h073a :  // <0461> "
addr == 16'h73c ? 16'he00f :  // <0462> end_event
addr == 16'h73d ? 16'h009e :  // <0462> "

// :tx_overflow_msg // = 0x073e
// "TXO\x0"
addr == 16'h73e ? 16'h5854 :  // <0465> XT
addr == 16'h73f ? 16'h004f :  // <0465>  O

// ######## event uart_tx_overflow_handler // = 0x0740
// error_halt_code $err_tx_overflow
addr == 16'h740 ? 16'h23a0 :  // <0469> pa = :tx_overflow_msg
addr == 16'h741 ? 16'h073e :  // <0469> "
addr == 16'h742 ? 16'hfba0 :  // <0469> callx  set_text_flag  :tx_overflow_msg
addr == 16'h743 ? 16'h096f :  // <0469> "
addr == 16'h744 ? 16'hfc00 :  // <0469> "
addr == 16'h745 ? 16'he00f :  // <0470> end_event
addr == 16'h746 ? 16'h009e :  // <0470> "

// ######## event key0_handler // = 0x0747
addr == 16'h747 ? 16'h026b :  // <0473> a = 107 // putasc "k"
addr == 16'h748 ? 16'hfba0 :  // <0473> putasc "k"
addr == 16'h749 ? 16'h00ab :  // <0473> "
addr == 16'h74a ? 16'hfc00 :  // <0473> "
addr == 16'h74b ? 16'h0230 :  // <0474> a = 48 // putasc "0"
addr == 16'h74c ? 16'hfba0 :  // <0474> putasc "0"
addr == 16'h74d ? 16'h00ab :  // <0474> "
addr == 16'h74e ? 16'hfc00 :  // <0474> "
addr == 16'h74f ? 16'he00f :  // <0475> end_event
addr == 16'h750 ? 16'h009e :  // <0475> "

// ######## event key1_handler // = 0x0751
addr == 16'h751 ? 16'h026b :  // <0478> a = 107 // putasc "k"
addr == 16'h752 ? 16'hfba0 :  // <0478> putasc "k"
addr == 16'h753 ? 16'h00ab :  // <0478> "
addr == 16'h754 ? 16'hfc00 :  // <0478> "
addr == 16'h755 ? 16'h0231 :  // <0479> a = 49 // putasc "1"
addr == 16'h756 ? 16'hfba0 :  // <0479> putasc "1"
addr == 16'h757 ? 16'h00ab :  // <0479> "
addr == 16'h758 ? 16'hfc00 :  // <0479> "
addr == 16'h759 ? 16'he00f :  // <0480> end_event
addr == 16'h75a ? 16'h009e :  // <0480> "

// ######## event softevent3_handler // = 0x075b
addr == 16'h75b ? 16'he00f :  // <0483> end_event
addr == 16'h75c ? 16'h009e :  // <0483> "

// ######## event softevent2_handler // = 0x075d
addr == 16'h75d ? 16'he00f :  // <0486> end_event
addr == 16'h75e ? 16'h009e :  // <0486> "

// ######## event softevent1_handler // = 0x075f
addr == 16'h75f ? 16'he00f :  // <0489> end_event
addr == 16'h760 ? 16'h009e :  // <0489> "

// ######## event softevent0_handler // = 0x0761
addr == 16'h761 ? 16'he00f :  // <0492> end_event
addr == 16'h762 ? 16'h009e :  // <0492> "

// :rpm_msg // = 0x0763
// ": rpm=\x0"
addr == 16'h763 ? 16'h203a :  // <0495>  :
addr == 16'h764 ? 16'h7072 :  // <0495> pr
addr == 16'h765 ? 16'h3d6d :  // <0495> =m
addr == 16'h766 ? 16'h0000 :  // <0495>   

// :puff_len_msg // = 0x0767
// " pfl=\x0"
addr == 16'h767 ? 16'h7020 :  // <0498> p 
addr == 16'h768 ? 16'h6c66 :  // <0498> lf
addr == 16'h769 ? 16'h003d :  // <0498>  =

// :o2_msg // = 0x076a
// " o2=\x0"
addr == 16'h76a ? 16'h6f20 :  // <0501> o 
addr == 16'h76b ? 16'h3d32 :  // <0501> =2
addr == 16'h76c ? 16'h0000 :  // <0501>   

// :tps_msg // = 0x076d
// " tp=\x0"
addr == 16'h76d ? 16'h7420 :  // <0504> t 
addr == 16'h76e ? 16'h3d70 :  // <0504> =p
addr == 16'h76f ? 16'h0000 :  // <0504>   

// ######## func start_daq_pass // = 0x0770
addr == 16'h770 ? 16'h3004 :  // <0557> push x // func start_daq_pass
addr == 16'h771 ? 16'h303e :  // <0557> push rtna // "

// daq pass counter in RAM.
addr == 16'h772 ? 16'h6600 :  // <0508> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h773 ? 16'h6a14 :  // <0508> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h774 ? 16'h0017 :  // <0508> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h775 ? 16'h0018 :  // <0508> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h776 ? 16'h0601 :  // <0509> b = 1
addr == 16'h777 ? 16'hc800 :  // <0510> a = a+b
addr == 16'h778 ? 16'h0300 :  // <0510> "
addr == 16'h779 ? 16'h7c00 :  // <0511> leds = a
addr == 16'h77a ? 16'h6600 :  // <0512> ram $ram_daq_pass_cnt = a // av_ad_hi = 0
addr == 16'h77b ? 16'h6a14 :  // <0512> ram $ram_daq_pass_cnt = a // av_ad_lo = 20
addr == 16'h77c ? 16'h5c00 :  // <0512> ram $ram_daq_pass_cnt = a // av_write_data = a
addr == 16'h77d ? 16'hfba0 :  // <0513> call :put4x
addr == 16'h77e ? 16'h00d3 :  // <0513> "
addr == 16'h77f ? 16'hfc00 :  // <0513> "

addr == 16'h780 ? 16'h03a0 :  // <0515> a = :rpm_msg
addr == 16'h781 ? 16'h0763 :  // <0515> "
addr == 16'h782 ? 16'hfba0 :  // <0516> call :print_nt
addr == 16'h783 ? 16'h015f :  // <0516> "
addr == 16'h784 ? 16'hfc00 :  // <0516> "
addr == 16'h785 ? 16'h0200 :  // <0517> a = 0
addr == 16'h786 ? 16'h6600 :  // <0518> ram x = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h787 ? 16'h6a7e :  // <0518> ram x = $ram_rpm_valid // av_ad_lo = 126
addr == 16'h788 ? 16'h1017 :  // <0518> ram x = $ram_rpm_valid // x = av_write_data // start read cycle
addr == 16'h789 ? 16'h1018 :  // <0518> ram x = $ram_rpm_valid // x = av_read_data // finish read cycle

addr == 16'h78a ? 16'h0004 :  // <0521> a = x
addr == 16'h78b ? 16'h0600 :  // <0521> b = 0

addr == 16'h78c ? 16'he007 :  // <0519> br eq :else_1932
addr == 16'h78d ? 16'h0792 :  // <0519> "

addr == 16'h78e ? 16'h6600 :  // <0520> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h78f ? 16'h6a7c :  // <0520> ram a = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h790 ? 16'h0017 :  // <0520> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h791 ? 16'h0018 :  // <0520> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle

addr == 16'h792 ? 16'hfba0 :  // <0522> call :put4x
addr == 16'h793 ? 16'h00d3 :  // <0522> "
addr == 16'h794 ? 16'hfc00 :  // <0522> "

addr == 16'h795 ? 16'h03a0 :  // <0524> a = :puff_len_msg
addr == 16'h796 ? 16'h0767 :  // <0524> "
addr == 16'h797 ? 16'hfba0 :  // <0525> call :print_nt
addr == 16'h798 ? 16'h015f :  // <0525> "
addr == 16'h799 ? 16'hfc00 :  // <0525> "
addr == 16'h79a ? 16'h0025 :  // <0526> a = puff_len_us
addr == 16'h79b ? 16'hfba0 :  // <0527> call :put4x
addr == 16'h79c ? 16'h00d3 :  // <0527> "
addr == 16'h79d ? 16'hfc00 :  // <0527> "
addr == 16'h79e ? 16'h022c :  // <0528> a = 44 // putasc ","
addr == 16'h79f ? 16'hfba0 :  // <0528> putasc ","
addr == 16'h7a0 ? 16'h00ab :  // <0528> "
addr == 16'h7a1 ? 16'hfc00 :  // <0528> "
addr == 16'h7a2 ? 16'h6600 :  // <0529> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h7a3 ? 16'h6a92 :  // <0529> ram a = $ram_puff_count // av_ad_lo = 146
addr == 16'h7a4 ? 16'h0017 :  // <0529> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h7a5 ? 16'h0018 :  // <0529> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h7a6 ? 16'hfba0 :  // <0530> call :put4x
addr == 16'h7a7 ? 16'h00d3 :  // <0530> "
addr == 16'h7a8 ? 16'hfc00 :  // <0530> "

addr == 16'h7a9 ? 16'h03a0 :  // <0532> a = :o2_msg
addr == 16'h7aa ? 16'h076a :  // <0532> "
addr == 16'h7ab ? 16'hfba0 :  // <0533> call :print_nt
addr == 16'h7ac ? 16'h015f :  // <0533> "
addr == 16'h7ad ? 16'hfc00 :  // <0533> "
addr == 16'h7ae ? 16'h0205 :  // <0534> a = $o2_adc_channel

addr == 16'h7af ? 16'h0351 :  // <0535> a = a<<1
addr == 16'h7b0 ? 16'h0626 :  // <0535> b = 38
addr == 16'h7b1 ? 16'h6600 :  // <0535> av_ad_hi = 0
addr == 16'h7b2 ? 16'h6b00 :  // <0535> av_ad_lo = ad0
addr == 16'h7b3 ? 16'h0417 :  // <0535> b = av_begin_read
addr == 16'h7b4 ? 16'h0418 :  // <0535> b = av_read_data

addr == 16'h7b5 ? 16'h0001 :  // <0536> a = b
addr == 16'h7b6 ? 16'hfba0 :  // <0537> call :put4x
addr == 16'h7b7 ? 16'h00d3 :  // <0537> "
addr == 16'h7b8 ? 16'hfc00 :  // <0537> "

addr == 16'h7b9 ? 16'h03a0 :  // <0539> a = :tps_msg
addr == 16'h7ba ? 16'h076d :  // <0539> "
addr == 16'h7bb ? 16'hfba0 :  // <0540> call :print_nt
addr == 16'h7bc ? 16'h015f :  // <0540> "
addr == 16'h7bd ? 16'hfc00 :  // <0540> "
addr == 16'h7be ? 16'h0206 :  // <0541> a = $tps_adc_channel

addr == 16'h7bf ? 16'h0351 :  // <0542> a = a<<1
addr == 16'h7c0 ? 16'h0626 :  // <0542> b = 38
addr == 16'h7c1 ? 16'h6600 :  // <0542> av_ad_hi = 0
addr == 16'h7c2 ? 16'h6b00 :  // <0542> av_ad_lo = ad0
addr == 16'h7c3 ? 16'h0417 :  // <0542> b = av_begin_read
addr == 16'h7c4 ? 16'h0418 :  // <0542> b = av_read_data

addr == 16'h7c5 ? 16'h0001 :  // <0543> a = b
addr == 16'h7c6 ? 16'hfba0 :  // <0544> call :put4x
addr == 16'h7c7 ? 16'h00d3 :  // <0544> "
addr == 16'h7c8 ? 16'hfc00 :  // <0544> "
addr == 16'h7c9 ? 16'h022c :  // <0545> a = 44 // putasc ","
addr == 16'h7ca ? 16'hfba0 :  // <0545> putasc ","
addr == 16'h7cb ? 16'h00ab :  // <0545> "
addr == 16'h7cc ? 16'hfc00 :  // <0545> "
addr == 16'h7cd ? 16'h6600 :  // <0546> ram a = $ram_tps_avg // av_ad_hi = 0
addr == 16'h7ce ? 16'h6aae :  // <0546> ram a = $ram_tps_avg // av_ad_lo = 174
addr == 16'h7cf ? 16'h0017 :  // <0546> ram a = $ram_tps_avg // a = av_write_data // start read cycle
addr == 16'h7d0 ? 16'h0018 :  // <0546> ram a = $ram_tps_avg // a = av_read_data // finish read cycle
addr == 16'h7d1 ? 16'hfba0 :  // <0547> call :put4x
addr == 16'h7d2 ? 16'h00d3 :  // <0547> "
addr == 16'h7d3 ? 16'hfc00 :  // <0547> "

// start to acquire & report all anmux channels.
addr == 16'h7d4 ? 16'h0207 :  // <0550> a = ($anmux_num_channels - 1)
addr == 16'h7d5 ? 16'hfba0 :  // <0551> call :anmux_set_chn
addr == 16'h7d6 ? 16'h00c2 :  // <0551> "
addr == 16'h7d7 ? 16'hfc00 :  // <0551> "
addr == 16'h7d8 ? 16'h5205 :  // <0552> mstimer1 = $anmux_settle_ms

// observe MCU utilization.  this RAM variable can be seen by the debugger.
addr == 16'h7d9 ? 16'h6600 :  // <0555> ram $ram_mcu_usage_cnt = usage_count // av_ad_hi = 0
addr == 16'h7da ? 16'h6a44 :  // <0555> ram $ram_mcu_usage_cnt = usage_count // av_ad_lo = 68
addr == 16'h7db ? 16'h5c0f :  // <0555> ram $ram_mcu_usage_cnt = usage_count // av_write_data = usage_count
addr == 16'h7dc ? 16'h3e00 :  // <0556> usage_count = 0

addr == 16'h7dd ? 16'hf80c :  // <0558> pop rtna // func start_daq_pass
addr == 16'h7de ? 16'h100c :  // <0558> pop x // "
addr == 16'h7df ? 16'hfc00 :  // <0558> swapra = nop

// ######## event mstimer1_handler // = 0x07e0
// anmux signal has settled.

addr == 16'h7e0 ? 16'h6600 :  // <0562> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h7e1 ? 16'h6a36 :  // <0562> ram a = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'h7e2 ? 16'h0017 :  // <0562> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h7e3 ? 16'h0018 :  // <0562> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle

addr == 16'h7e4 ? 16'h0000 :  // <0567> a = a
addr == 16'h7e5 ? 16'h0600 :  // <0567> b = 0

addr == 16'h7e6 ? 16'he007 :  // <0563> br eq :else_2022
addr == 16'h7e7 ? 16'h07eb :  // <0563> "

// ADC is busy right now.  wait a while & try again.
addr == 16'h7e8 ? 16'h5202 :  // <0565> mstimer1 = $anmux_retry_ms
addr == 16'h7e9 ? 16'he00f :  // <0566> event_return
addr == 16'h7ea ? 16'h009e :  // <0566> "


// start a reading from the current anmux channel.
addr == 16'h7eb ? 16'h0220 :  // <0570> a = 32 // putasc " "
addr == 16'h7ec ? 16'hfba0 :  // <0570> putasc " "
addr == 16'h7ed ? 16'h00ab :  // <0570> "
addr == 16'h7ee ? 16'hfc00 :  // <0570> "
addr == 16'h7ef ? 16'h0273 :  // <0571> a = 115 // putasc "s"
addr == 16'h7f0 ? 16'hfba0 :  // <0571> putasc "s"
addr == 16'h7f1 ? 16'h00ab :  // <0571> "
addr == 16'h7f2 ? 16'hfc00 :  // <0571> "
addr == 16'h7f3 ? 16'hfba0 :  // <0572> call :anmux_get_chn
addr == 16'h7f4 ? 16'h00c6 :  // <0572> "
addr == 16'h7f5 ? 16'hfc00 :  // <0572> "
addr == 16'h7f6 ? 16'h0630 :  // <0573> b = 48 // asc b = "0"
addr == 16'h7f7 ? 16'hc800 :  // <0574> a = a+b // putchar a+b
addr == 16'h7f8 ? 16'h0300 :  // <0574> "
addr == 16'h7f9 ? 16'hfba0 :  // <0574> putchar a+b
addr == 16'h7fa ? 16'h00ab :  // <0574> "
addr == 16'h7fb ? 16'hfc00 :  // <0574> "
addr == 16'h7fc ? 16'h023d :  // <0575> a = 61 // putasc "="
addr == 16'h7fd ? 16'hfba0 :  // <0575> putasc "="
addr == 16'h7fe ? 16'h00ab :  // <0575> "
addr == 16'h7ff ? 16'hfc00 :  // <0575> "
addr == 16'h800 ? 16'h2207 :  // <0576> pa = 7
addr == 16'h801 ? 16'hfba0 :  // <0576> callx  begin_adc_conversion  $anmux_adc_channel
addr == 16'h802 ? 16'h0806 :  // <0576> "
addr == 16'h803 ? 16'hfc00 :  // <0576> "
addr == 16'h804 ? 16'he00f :  // <0577> end_event
addr == 16'h805 ? 16'h009e :  // <0577> "

// ######## func begin_adc_conversion // = 0x0806

// begin SPI transaction, specifying Nano ADC channel to take effect NEXT
// conversion after this one.

addr == 16'h806 ? 16'h6600 :  // <0583> ram $ram_adc_chn_pending = next_channel // av_ad_hi = 0
addr == 16'h807 ? 16'h6a36 :  // <0583> ram $ram_adc_chn_pending = next_channel // av_ad_lo = 54
addr == 16'h808 ? 16'h5c08 :  // <0583> ram $ram_adc_chn_pending = next_channel // av_write_data = next_channel
addr == 16'h809 ? 16'h0008 :  // <0584> a = next_channel
addr == 16'h80a ? 16'h0352 :  // <0585> a = a<<4
addr == 16'h80b ? 16'h0352 :  // <0586> a = a<<4
addr == 16'h80c ? 16'h0351 :  // <0587> a = a<<1
addr == 16'h80d ? 16'h0351 :  // <0588> a = a<<1
addr == 16'h80e ? 16'h0351 :  // <0589> a = a<<1
addr == 16'h80f ? 16'h5800 :  // <0590> spi_data = a
addr == 16'h810 ? 16'h6600 :  // <0591> ram $ram_adc_junk = 1 // av_ad_hi = 0
addr == 16'h811 ? 16'h6a38 :  // <0591> ram $ram_adc_junk = 1 // av_ad_lo = 56
addr == 16'h812 ? 16'h5e01 :  // <0591> ram $ram_adc_junk = 1 // av_write_data = 1

addr == 16'h813 ? 16'hfc00 :  // <0593> swapra = nop

// ######## event spi_done_handler // = 0x0814
// discard the results of the first SPI exchange with the ADC.  that's only for writing the channel num out to the ADC.
addr == 16'h814 ? 16'h6600 :  // <0596> ram a = $ram_adc_junk // av_ad_hi = 0
addr == 16'h815 ? 16'h6a38 :  // <0596> ram a = $ram_adc_junk // av_ad_lo = 56
addr == 16'h816 ? 16'h0017 :  // <0596> ram a = $ram_adc_junk // a = av_write_data // start read cycle
addr == 16'h817 ? 16'h0018 :  // <0596> ram a = $ram_adc_junk // a = av_read_data // finish read cycle

addr == 16'h818 ? 16'h0000 :  // <0608> a = a
addr == 16'h819 ? 16'h0600 :  // <0608> b = 0

addr == 16'h81a ? 16'he007 :  // <0597> br eq :else_2074
addr == 16'h81b ? 16'h082b :  // <0597> "

// start another SPI exchange to retrieve the actual reading.
addr == 16'h81c ? 16'h6600 :  // <0599> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h81d ? 16'h6a36 :  // <0599> ram a = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'h81e ? 16'h0017 :  // <0599> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h81f ? 16'h0018 :  // <0599> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle
addr == 16'h820 ? 16'h0352 :  // <0600> a = a<<4
addr == 16'h821 ? 16'h0352 :  // <0601> a = a<<4
addr == 16'h822 ? 16'h0351 :  // <0602> a = a<<1
addr == 16'h823 ? 16'h0351 :  // <0603> a = a<<1
addr == 16'h824 ? 16'h0351 :  // <0604> a = a<<1
addr == 16'h825 ? 16'h5800 :  // <0605> spi_data = a
addr == 16'h826 ? 16'h6600 :  // <0606> ram $ram_adc_junk = 0 // av_ad_hi = 0
addr == 16'h827 ? 16'h6a38 :  // <0606> ram $ram_adc_junk = 0 // av_ad_lo = 56
addr == 16'h828 ? 16'h5e00 :  // <0606> ram $ram_adc_junk = 0 // av_write_data = 0
addr == 16'h829 ? 16'he00f :  // <0607> event_return
addr == 16'h82a ? 16'h009e :  // <0607> "


// memorize an actual ADC reading.
addr == 16'h82b ? 16'h6600 :  // <0611> ram i = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h82c ? 16'h6a36 :  // <0611> ram i = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'h82d ? 16'h0817 :  // <0611> ram i = $ram_adc_chn_pending // i = av_write_data // start read cycle
addr == 16'h82e ? 16'h0818 :  // <0611> ram i = $ram_adc_chn_pending // i = av_read_data // finish read cycle
addr == 16'h82f ? 16'h6600 :  // <0612> ram $ram_adc_chn_pending = 0 // av_ad_hi = 0
addr == 16'h830 ? 16'h6a36 :  // <0612> ram $ram_adc_chn_pending = 0 // av_ad_lo = 54
addr == 16'h831 ? 16'h5e00 :  // <0612> ram $ram_adc_chn_pending = 0 // av_write_data = 0
addr == 16'h832 ? 16'h0002 :  // <0613> a = i
addr == 16'h833 ? 16'h0416 :  // <0614> b = spi_data

addr == 16'h834 ? 16'h0351 :  // <0615> a = a<<1
addr == 16'h835 ? 16'h3001 :  // <0615> push b // push b
addr == 16'h836 ? 16'h0626 :  // <0615> b = 38
addr == 16'h837 ? 16'h6600 :  // <0615> av_ad_hi = 0
addr == 16'h838 ? 16'h6b00 :  // <0615> av_ad_lo = ad0
addr == 16'h839 ? 16'h5c0c :  // <0615> pop av_write_data // pop av_write_data


// react to ADC reading.

addr == 16'h83a ? 16'h0002 :  // <0622> a = i
addr == 16'h83b ? 16'h0606 :  // <0622> b = 6

addr == 16'h83c ? 16'he407 :  // <0618> bn eq :else_2108
addr == 16'h83d ? 16'h0847 :  // <0618> "

addr == 16'h83e ? 16'h2205 :  // <0619> pa = 5
addr == 16'h83f ? 16'hfba0 :  // <0619> callx  begin_adc_conversion  $o2_adc_channel
addr == 16'h840 ? 16'h0806 :  // <0619> "
addr == 16'h841 ? 16'hfc00 :  // <0619> "
addr == 16'h842 ? 16'hfba0 :  // <0620> callx  interpret_tps
addr == 16'h843 ? 16'h0a34 :  // <0620> "
addr == 16'h844 ? 16'hfc00 :  // <0620> "
addr == 16'h845 ? 16'he00f :  // <0621> event_return
addr == 16'h846 ? 16'h009e :  // <0621> "


addr == 16'h847 ? 16'h0002 :  // <0626> a = i
addr == 16'h848 ? 16'h0605 :  // <0626> b = 5

addr == 16'h849 ? 16'he407 :  // <0623> bn eq :else_2121
addr == 16'h84a ? 16'h0851 :  // <0623> "

addr == 16'h84b ? 16'h2204 :  // <0624> pa = 4
addr == 16'h84c ? 16'hfba0 :  // <0624> callx  begin_adc_conversion  $maf_adc_channel
addr == 16'h84d ? 16'h0806 :  // <0624> "
addr == 16'h84e ? 16'hfc00 :  // <0624> "
addr == 16'h84f ? 16'he00f :  // <0625> event_return
addr == 16'h850 ? 16'h009e :  // <0625> "


addr == 16'h851 ? 16'h0002 :  // <0631> a = i
addr == 16'h852 ? 16'h0604 :  // <0631> b = 4

addr == 16'h853 ? 16'he407 :  // <0627> bn eq :else_2131
addr == 16'h854 ? 16'h085d :  // <0627> "

addr == 16'h855 ? 16'hfba0 :  // <0628> callx  interpret_maf
addr == 16'h856 ? 16'h09f4 :  // <0628> "
addr == 16'h857 ? 16'hfc00 :  // <0628> "
addr == 16'h858 ? 16'hfba0 :  // <0629> callx  plan_tick
addr == 16'h859 ? 16'h0702 :  // <0629> "
addr == 16'h85a ? 16'hfc00 :  // <0629> "
addr == 16'h85b ? 16'he00f :  // <0630> event_return
addr == 16'h85c ? 16'h009e :  // <0630> "


addr == 16'h85d ? 16'h0002 :  // <0659> a = i
addr == 16'h85e ? 16'h0607 :  // <0659> b = 7

addr == 16'h85f ? 16'he407 :  // <0632> bn eq :else_2143
addr == 16'h860 ? 16'h0895 :  // <0632> "

// report anmux reading.
addr == 16'h861 ? 16'h0016 :  // <0634> a = spi_data
addr == 16'h862 ? 16'hfba0 :  // <0635> call :put4x
addr == 16'h863 ? 16'h00d3 :  // <0635> "
addr == 16'h864 ? 16'hfc00 :  // <0635> "

// memorize anmux reading.
addr == 16'h865 ? 16'hfba0 :  // <0638> call :anmux_get_chn
addr == 16'h866 ? 16'h00c6 :  // <0638> "
addr == 16'h867 ? 16'hfc00 :  // <0638> "
addr == 16'h868 ? 16'h0416 :  // <0639> b = spi_data

addr == 16'h869 ? 16'h0351 :  // <0640> a = a<<1
addr == 16'h86a ? 16'h3001 :  // <0640> push b // push b
addr == 16'h86b ? 16'h0616 :  // <0640> b = 22
addr == 16'h86c ? 16'h6600 :  // <0640> av_ad_hi = 0
addr == 16'h86d ? 16'h6b00 :  // <0640> av_ad_lo = ad0
addr == 16'h86e ? 16'h5c0c :  // <0640> pop av_write_data // pop av_write_data


// decrement anmux channel & start waiting again.
addr == 16'h86f ? 16'hfba0 :  // <0643> call :anmux_get_chn
addr == 16'h870 ? 16'h00c6 :  // <0643> "
addr == 16'h871 ? 16'hfc00 :  // <0643> "

addr == 16'h872 ? 16'h0000 :  // <0650> a = a
addr == 16'h873 ? 16'h0600 :  // <0650> b = 0

addr == 16'h874 ? 16'he007 :  // <0644> br eq :else_2164
addr == 16'h875 ? 16'h087f :  // <0644> "

addr == 16'h876 ? 16'h0760 :  // <0645> b = -1
addr == 16'h877 ? 16'hc800 :  // <0646> a = a+b
addr == 16'h878 ? 16'h0300 :  // <0646> "
addr == 16'h879 ? 16'hfba0 :  // <0647> call :anmux_set_chn
addr == 16'h87a ? 16'h00c2 :  // <0647> "
addr == 16'h87b ? 16'hfc00 :  // <0647> "
addr == 16'h87c ? 16'h5205 :  // <0648> mstimer1 = $anmux_settle_ms
addr == 16'h87d ? 16'he00f :  // <0649> event_return
addr == 16'h87e ? 16'h009e :  // <0649> "


// end of temperature daq pass.
addr == 16'h87f ? 16'hfba0 :  // <0653> callx  interpret_block_temp
addr == 16'h880 ? 16'h050f :  // <0653> "
addr == 16'h881 ? 16'hfc00 :  // <0653> "
addr == 16'h882 ? 16'hfba0 :  // <0654> callx  report_plan
addr == 16'h883 ? 16'h09d9 :  // <0654> "
addr == 16'h884 ? 16'hfc00 :  // <0654> "
addr == 16'h885 ? 16'hfba0 :  // <0655> callx  report_text_flags
addr == 16'h886 ? 16'h09a6 :  // <0655> "
addr == 16'h887 ? 16'hfc00 :  // <0655> "
addr == 16'h888 ? 16'h020d :  // <0656> a = 13 // puteol
addr == 16'h889 ? 16'hfba0 :  // <0656> puteol
addr == 16'h88a ? 16'h00ab :  // <0656> "
addr == 16'h88b ? 16'hfc00 :  // <0656> "
addr == 16'h88c ? 16'h020a :  // <0656> a = 10 // puteol
addr == 16'h88d ? 16'hfba0 :  // <0656> puteol
addr == 16'h88e ? 16'h00ab :  // <0656> "
addr == 16'h88f ? 16'hfc00 :  // <0656> "
addr == 16'h890 ? 16'h6600 :  // <0657> ram $ram_dial_setting = spi_data // av_ad_hi = 0
addr == 16'h891 ? 16'h6a3a :  // <0657> ram $ram_dial_setting = spi_data // av_ad_lo = 58
addr == 16'h892 ? 16'h5c16 :  // <0657> ram $ram_dial_setting = spi_data // av_write_data = spi_data
addr == 16'h893 ? 16'he00f :  // <0658> event_return
addr == 16'h894 ? 16'h009e :  // <0658> "

addr == 16'h895 ? 16'he00f :  // <0660> end_event
addr == 16'h896 ? 16'h009e :  // <0660> "

// :power_lost_msg // = 0x0897
// "PWL\x0"
addr == 16'h897 ? 16'h5750 :  // <0663> WP
addr == 16'h898 ? 16'h004c :  // <0663>  L

// ######## event power_lost_handler // = 0x0899
// at this time we have less than 2 ms of usable run time left.

// this must be an uncommanded loss of main power, because if it was commanded,
// no more events would be handled; this event handler wouldn't have a chance to run.
// immediately set the power relay PWM to full power for a few seconds,
// in case the power relay opened accidentally e.g. due to a hard pothole.
addr == 16'h899 ? 16'h8a00 :  // <0672> power_duty = $power_duty_closing
addr == 16'h89a ? 16'h6600 :  // <0673> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h89b ? 16'h6a14 :  // <0673> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h89c ? 16'h0017 :  // <0673> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h89d ? 16'h0018 :  // <0673> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h89e ? 16'h0602 :  // <0674> b = $relay_hold_passes
addr == 16'h89f ? 16'h6600 :  // <0675> ram $ram_relay_hold_at_pass = a+b // av_ad_hi = 0
addr == 16'h8a0 ? 16'h6a3e :  // <0675> ram $ram_relay_hold_at_pass = a+b // av_ad_lo = 62
addr == 16'h8a1 ? 16'hc800 :  // <0675> ram $ram_relay_hold_at_pass = a+b // av_write_data = a+b
addr == 16'h8a2 ? 16'h5f00 :  // <0675> "

// pause any non-vital power-hogging operations, to conserve power for the EEPROM write.

// save persistent data in case the power remains down e.g. due to battery disconnect.
addr == 16'h8a3 ? 16'hfba0 :  // <0680> callx  save_persistent_data
addr == 16'h8a4 ? 16'h0910 :  // <0680> "
addr == 16'h8a5 ? 16'hfc00 :  // <0680> "

addr == 16'h8a6 ? 16'h23a0 :  // <0682> pa = :power_lost_msg
addr == 16'h8a7 ? 16'h0897 :  // <0682> "
addr == 16'h8a8 ? 16'hfba0 :  // <0682> callx  set_text_flag  :power_lost_msg
addr == 16'h8a9 ? 16'h096f :  // <0682> "
addr == 16'h8aa ? 16'hfc00 :  // <0682> "
addr == 16'h8ab ? 16'he00f :  // <0683> end_event
addr == 16'h8ac ? 16'h009e :  // <0683> "

// :ign_off_msg // = 0x08ad
// "IGOF\x0"
addr == 16'h8ad ? 16'h4749 :  // <0686> GI
addr == 16'h8ae ? 16'h464f :  // <0686> FO
addr == 16'h8af ? 16'h0000 :  // <0686>   

// ######## event ign_switch_off_handler // = 0x08b0
// set power-down deadline in RAM.  this makes the system remain powered for several more minutes, for cooldown data logging.
addr == 16'h8b0 ? 16'h6600 :  // <0690> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h8b1 ? 16'h6a40 :  // <0690> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'h8b2 ? 16'h0017 :  // <0690> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h8b3 ? 16'h0018 :  // <0690> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h8b4 ? 16'h060a :  // <0691> b = $power_extend_minutes
addr == 16'h8b5 ? 16'h6600 :  // <0692> ram $ram_power_down_at_min = a+b // av_ad_hi = 0
addr == 16'h8b6 ? 16'h6a3c :  // <0692> ram $ram_power_down_at_min = a+b // av_ad_lo = 60
addr == 16'h8b7 ? 16'hc800 :  // <0692> ram $ram_power_down_at_min = a+b // av_write_data = a+b
addr == 16'h8b8 ? 16'h5f00 :  // <0692> "
addr == 16'h8b9 ? 16'h23a0 :  // <0693> pa = :ign_off_msg
addr == 16'h8ba ? 16'h08ad :  // <0693> "
addr == 16'h8bb ? 16'hfba0 :  // <0693> callx  set_text_flag   :ign_off_msg
addr == 16'h8bc ? 16'h096f :  // <0693> "
addr == 16'h8bd ? 16'hfc00 :  // <0693> "
addr == 16'h8be ? 16'he00f :  // <0694> end_event
addr == 16'h8bf ? 16'h009e :  // <0694> "

// :ign_on_msg // = 0x08c0
// "IGON\x0"
addr == 16'h8c0 ? 16'h4749 :  // <0697> GI
addr == 16'h8c1 ? 16'h4e4f :  // <0697> NO
addr == 16'h8c2 ? 16'h0000 :  // <0697>   

// ######## event ign_switch_on_handler // = 0x08c3
addr == 16'h8c3 ? 16'h6600 :  // <0700> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h8c4 ? 16'h6a3c :  // <0700> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 60
addr == 16'h8c5 ? 16'h5f60 :  // <0700> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h8c6 ? 16'h23a0 :  // <0701> pa = :ign_on_msg
addr == 16'h8c7 ? 16'h08c0 :  // <0701> "
addr == 16'h8c8 ? 16'hfba0 :  // <0701> callx  set_text_flag   :ign_on_msg
addr == 16'h8c9 ? 16'h096f :  // <0701> "
addr == 16'h8ca ? 16'hfc00 :  // <0701> "
addr == 16'h8cb ? 16'he00f :  // <0702> end_event
addr == 16'h8cc ? 16'h009e :  // <0702> "

// ######## event puff1_done_handler // = 0x08cd
// puff just finished.  set length of next puff.
addr == 16'h8cd ? 16'h6600 :  // <0706> ram puff_len_us = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'h8ce ? 16'h6a90 :  // <0706> ram puff_len_us = $ram_next_puff_len_us // av_ad_lo = 144
addr == 16'h8cf ? 16'h9417 :  // <0706> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_write_data // start read cycle
addr == 16'h8d0 ? 16'h9418 :  // <0706> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_read_data // finish read cycle

// count puffs.
addr == 16'h8d1 ? 16'h6600 :  // <0709> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h8d2 ? 16'h6a92 :  // <0709> ram a = $ram_puff_count // av_ad_lo = 146
addr == 16'h8d3 ? 16'h0017 :  // <0709> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h8d4 ? 16'h0018 :  // <0709> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h8d5 ? 16'h0601 :  // <0710> b = 1
addr == 16'h8d6 ? 16'h6600 :  // <0711> ram $ram_puff_count = a+b // av_ad_hi = 0
addr == 16'h8d7 ? 16'h6a92 :  // <0711> ram $ram_puff_count = a+b // av_ad_lo = 146
addr == 16'h8d8 ? 16'hc800 :  // <0711> ram $ram_puff_count = a+b // av_write_data = a+b
addr == 16'h8d9 ? 16'h5f00 :  // <0711> "

// hack to set puff length strictly by a hard-wired knob.
// ram a = $ram_dial_setting
// a = a<<1
// a = a<<1
// a = a<<1
// bn az :nonzero
// a = 1
// :nonzero
// puff_len_us = a
addr == 16'h8da ? 16'he00f :  // <0722> end_event
addr == 16'h8db ? 16'h009e :  // <0722> "

// ######## func minute_events // = 0x08dc
addr == 16'h8dc ? 16'h303e :  // <0726> push rtna // func minute_events

addr == 16'h8dd ? 16'hfba0 :  // <0725> callx  check_power_down
addr == 16'h8de ? 16'h08f9 :  // <0725> "
addr == 16'h8df ? 16'hfc00 :  // <0725> "

addr == 16'h8e0 ? 16'hf80c :  // <0727> pop rtna // func minute_events
addr == 16'h8e1 ? 16'hfc00 :  // <0727> swapra = nop

// :power_hold_msg // = 0x08e2
// "PWH\x0"
addr == 16'h8e2 ? 16'h5750 :  // <0729> WP
addr == 16'h8e3 ? 16'h0048 :  // <0729>  H

// ######## func check_power_relay // = 0x08e4
addr == 16'h8e4 ? 16'h303e :  // <0739> push rtna // func check_power_relay

addr == 16'h8e5 ? 16'h6600 :  // <0732> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h8e6 ? 16'h6a14 :  // <0732> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h8e7 ? 16'h0017 :  // <0732> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h8e8 ? 16'h0018 :  // <0732> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h8e9 ? 16'h6600 :  // <0733> ram b = $ram_relay_hold_at_pass // av_ad_hi = 0
addr == 16'h8ea ? 16'h6a3e :  // <0733> ram b = $ram_relay_hold_at_pass // av_ad_lo = 62
addr == 16'h8eb ? 16'h0417 :  // <0733> ram b = $ram_relay_hold_at_pass // b = av_write_data // start read cycle
addr == 16'h8ec ? 16'h0418 :  // <0733> ram b = $ram_relay_hold_at_pass // b = av_read_data // finish read cycle

addr == 16'h8ed ? 16'h0000 :  // <0738> a = a
addr == 16'h8ee ? 16'h0401 :  // <0738> b = b

addr == 16'h8ef ? 16'he407 :  // <0734> bn eq :else_2287
addr == 16'h8f0 ? 16'h08f7 :  // <0734> "

// time to begin "solenoid saver" coil power reduction by PWM.
addr == 16'h8f1 ? 16'h8a19 :  // <0736> power_duty = $power_duty_holding
addr == 16'h8f2 ? 16'h23a0 :  // <0737> pa = :power_hold_msg
addr == 16'h8f3 ? 16'h08e2 :  // <0737> "
addr == 16'h8f4 ? 16'hfba0 :  // <0737> callx  set_text_flag  :power_hold_msg
addr == 16'h8f5 ? 16'h096f :  // <0737> "
addr == 16'h8f6 ? 16'hfc00 :  // <0737> "


addr == 16'h8f7 ? 16'hf80c :  // <0740> pop rtna // func check_power_relay
addr == 16'h8f8 ? 16'hfc00 :  // <0740> swapra = nop

// ######## func check_power_down // = 0x08f9

// check power-down deadline in RAM.
addr == 16'h8f9 ? 16'h6600 :  // <0743> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h8fa ? 16'h6a40 :  // <0743> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'h8fb ? 16'h0017 :  // <0743> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h8fc ? 16'h0018 :  // <0743> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h8fd ? 16'h6600 :  // <0744> ram b = $ram_power_down_at_min // av_ad_hi = 0
addr == 16'h8fe ? 16'h6a3c :  // <0744> ram b = $ram_power_down_at_min // av_ad_lo = 60
addr == 16'h8ff ? 16'h0417 :  // <0744> ram b = $ram_power_down_at_min // b = av_write_data // start read cycle
addr == 16'h900 ? 16'h0418 :  // <0744> ram b = $ram_power_down_at_min // b = av_read_data // finish read cycle

addr == 16'h901 ? 16'h0000 :  // <0747> a = a
addr == 16'h902 ? 16'h0401 :  // <0747> b = b

addr == 16'h903 ? 16'he407 :  // <0745> bn eq :else_2307
addr == 16'h904 ? 16'h0907 :  // <0745> "

addr == 16'h905 ? 16'he00f :  // <0746> jmp :power_down
addr == 16'h906 ? 16'h0908 :  // <0746> "


addr == 16'h907 ? 16'hfc00 :  // <0749> swapra = nop

// :power_down // = 0x0908
// this code never returns.
addr == 16'h908 ? 16'hfba0 :  // <0752> callx  save_persistent_data
addr == 16'h909 ? 16'h0910 :  // <0752> "
addr == 16'h90a ? 16'hfc00 :  // <0752> "
addr == 16'h90b ? 16'h8a32 :  // <0753> power_duty = $power_duty_opening
addr == 16'h90c ? 16'h7fa0 :  // <0754> error_halt_code $err_power_down // leds = 0xfffc
addr == 16'h90d ? 16'hfffc :  // <0754> "
addr == 16'h90e ? 16'he00f :  // <0754> error_halt_code $err_power_down
addr == 16'h90f ? 16'h090e :  // <0754> "

// ######## func save_persistent_data // = 0x0910


addr == 16'h910 ? 16'hfc00 :  // <0758> swapra = nop

// ######## func check_communication // = 0x0911
addr == 16'h911 ? 16'h303e :  // <0778> push rtna // func check_communication

addr == 16'h912 ? 16'h6600 :  // <0760> ram a = $ram_ftdi_downtime_remain_sec // av_ad_hi = 0
addr == 16'h913 ? 16'h6a12 :  // <0760> ram a = $ram_ftdi_downtime_remain_sec // av_ad_lo = 18
addr == 16'h914 ? 16'h0017 :  // <0760> ram a = $ram_ftdi_downtime_remain_sec // a = av_write_data // start read cycle
addr == 16'h915 ? 16'h0018 :  // <0760> ram a = $ram_ftdi_downtime_remain_sec // a = av_read_data // finish read cycle

addr == 16'h916 ? 16'h0000 :  // <0768> a = a
addr == 16'h917 ? 16'h0600 :  // <0768> b = 0

addr == 16'h918 ? 16'he007 :  // <0761> br eq :else_2328
addr == 16'h919 ? 16'h0927 :  // <0761> "

addr == 16'h91a ? 16'h0760 :  // <0762> b = -1
addr == 16'h91b ? 16'hc800 :  // <0763> a = a+b
addr == 16'h91c ? 16'h0300 :  // <0763> "
addr == 16'h91d ? 16'h6600 :  // <0764> ram $ram_ftdi_downtime_remain_sec = a // av_ad_hi = 0
addr == 16'h91e ? 16'h6a12 :  // <0764> ram $ram_ftdi_downtime_remain_sec = a // av_ad_lo = 18
addr == 16'h91f ? 16'h5c00 :  // <0764> ram $ram_ftdi_downtime_remain_sec = a // av_write_data = a

addr == 16'h920 ? 16'h0000 :  // <0767> a = a
addr == 16'h921 ? 16'h0600 :  // <0767> b = 0

addr == 16'h922 ? 16'he407 :  // <0765> bn eq :else_2338
addr == 16'h923 ? 16'h0927 :  // <0765> "

addr == 16'h924 ? 16'hfba0 :  // <0766> callx  ftdi_power_on
addr == 16'h925 ? 16'h095b :  // <0766> "
addr == 16'h926 ? 16'hfc00 :  // <0766> "



addr == 16'h927 ? 16'h6600 :  // <0770> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h928 ? 16'h6a40 :  // <0770> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'h929 ? 16'h0017 :  // <0770> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h92a ? 16'h0018 :  // <0770> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h92b ? 16'h6600 :  // <0771> ram b = $ram_comm_restart_at_min // av_ad_hi = 0
addr == 16'h92c ? 16'h6a10 :  // <0771> ram b = $ram_comm_restart_at_min // av_ad_lo = 16
addr == 16'h92d ? 16'h0417 :  // <0771> ram b = $ram_comm_restart_at_min // b = av_write_data // start read cycle
addr == 16'h92e ? 16'h0418 :  // <0771> ram b = $ram_comm_restart_at_min // b = av_read_data // finish read cycle

addr == 16'h92f ? 16'h0000 :  // <0777> a = a
addr == 16'h930 ? 16'h0401 :  // <0777> b = b

addr == 16'h931 ? 16'he407 :  // <0772> bn eq :else_2353
addr == 16'h932 ? 16'h093c :  // <0772> "

// comm restart is required.
addr == 16'h933 ? 16'hfba0 :  // <0774> callx  postpone_comm_restart
addr == 16'h934 ? 16'h093e :  // <0774> "
addr == 16'h935 ? 16'hfc00 :  // <0774> "
addr == 16'h936 ? 16'h6600 :  // <0775> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_hi = 0
addr == 16'h937 ? 16'h6a12 :  // <0775> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_lo = 18
addr == 16'h938 ? 16'h5e05 :  // <0775> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_write_data = 5
addr == 16'h939 ? 16'hfba0 :  // <0776> callx  ftdi_power_off
addr == 16'h93a ? 16'h094b :  // <0776> "
addr == 16'h93b ? 16'hfc00 :  // <0776> "


addr == 16'h93c ? 16'hf80c :  // <0779> pop rtna // func check_communication
addr == 16'h93d ? 16'hfc00 :  // <0779> swapra = nop

// ######## func postpone_comm_restart // = 0x093e

addr == 16'h93e ? 16'h6600 :  // <0781> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h93f ? 16'h6a40 :  // <0781> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'h940 ? 16'h0017 :  // <0781> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h941 ? 16'h0018 :  // <0781> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h942 ? 16'h0602 :  // <0782> b = $comm_grace_period_min
addr == 16'h943 ? 16'h6600 :  // <0783> ram $ram_comm_restart_at_min = a+b // av_ad_hi = 0
addr == 16'h944 ? 16'h6a10 :  // <0783> ram $ram_comm_restart_at_min = a+b // av_ad_lo = 16
addr == 16'h945 ? 16'hc800 :  // <0783> ram $ram_comm_restart_at_min = a+b // av_write_data = a+b
addr == 16'h946 ? 16'h5f00 :  // <0783> "

addr == 16'h947 ? 16'hfc00 :  // <0785> swapra = nop

// :ftdi_off_msg // = 0x0948
// "FTOF\x0"
addr == 16'h948 ? 16'h5446 :  // <0787> TF
addr == 16'h949 ? 16'h464f :  // <0787> FO
addr == 16'h94a ? 16'h0000 :  // <0787>   

// ######## func ftdi_power_off // = 0x094b
addr == 16'h94b ? 16'h303e :  // <0794> push rtna // func ftdi_power_off

addr == 16'h94c ? 16'h0020 :  // <0790> a = board_ctrl
addr == 16'h94d ? 16'h07a0 :  // <0791> b = $not_ftdi_power_mask
addr == 16'h94e ? 16'hff7f :  // <0791> "
addr == 16'h94f ? 16'hc800 :  // <0792> board_ctrl = and
addr == 16'h950 ? 16'h8330 :  // <0792> "
addr == 16'h951 ? 16'h23a0 :  // <0793> pa = :ftdi_off_msg
addr == 16'h952 ? 16'h0948 :  // <0793> "
addr == 16'h953 ? 16'hfba0 :  // <0793> callx  set_text_flag  :ftdi_off_msg
addr == 16'h954 ? 16'h096f :  // <0793> "
addr == 16'h955 ? 16'hfc00 :  // <0793> "

addr == 16'h956 ? 16'hf80c :  // <0795> pop rtna // func ftdi_power_off
addr == 16'h957 ? 16'hfc00 :  // <0795> swapra = nop

// :ftdi_on_msg // = 0x0958
// "FTON\x0"
addr == 16'h958 ? 16'h5446 :  // <0797> TF
addr == 16'h959 ? 16'h4e4f :  // <0797> NO
addr == 16'h95a ? 16'h0000 :  // <0797>   

// ######## func ftdi_power_on // = 0x095b
addr == 16'h95b ? 16'h303e :  // <0804> push rtna // func ftdi_power_on

addr == 16'h95c ? 16'h0020 :  // <0800> a = board_ctrl
addr == 16'h95d ? 16'h0680 :  // <0801> b = $ftdi_power_mask
addr == 16'h95e ? 16'hc800 :  // <0802> board_ctrl = or
addr == 16'h95f ? 16'h8334 :  // <0802> "
addr == 16'h960 ? 16'h23a0 :  // <0803> pa = :ftdi_on_msg
addr == 16'h961 ? 16'h0958 :  // <0803> "
addr == 16'h962 ? 16'hfba0 :  // <0803> callx  set_text_flag  :ftdi_on_msg
addr == 16'h963 ? 16'h096f :  // <0803> "
addr == 16'h964 ? 16'hfc00 :  // <0803> "

addr == 16'h965 ? 16'hf80c :  // <0805> pop rtna // func ftdi_power_on
addr == 16'h966 ? 16'hfc00 :  // <0805> swapra = nop

// ######## func clear_ram_page // = 0x0967

addr == 16'h967 ? 16'h0200 :  // <0807> a = 0
addr == 16'h968 ? 16'h0602 :  // <0808> b = 2
// :clear_next_word // = 0x0969
addr == 16'h969 ? 16'h6800 :  // <0810> av_ad_lo = a
addr == 16'h96a ? 16'h5e00 :  // <0811> av_write_data = 0
addr == 16'h96b ? 16'h0300 :  // <0812> a = ad0
addr == 16'h96c ? 16'he400 :  // <0813> bn az :clear_next_word
addr == 16'h96d ? 16'h0969 :  // <0813> "

addr == 16'h96e ? 16'hfc00 :  // <0815> swapra = nop

// ######## func set_text_flag // = 0x096f

addr == 16'h96f ? 16'h0408 :  // <0817> b = flag_addr
addr == 16'h970 ? 16'h6600 :  // <0818> ram a = $ram_next_tfp_idx // av_ad_hi = 0
addr == 16'h971 ? 16'h6a56 :  // <0818> ram a = $ram_next_tfp_idx // av_ad_lo = 86
addr == 16'h972 ? 16'h0017 :  // <0818> ram a = $ram_next_tfp_idx // a = av_write_data // start read cycle
addr == 16'h973 ? 16'h0018 :  // <0818> ram a = $ram_next_tfp_idx // a = av_read_data // finish read cycle

addr == 16'h974 ? 16'h0351 :  // <0819> a = a<<1
addr == 16'h975 ? 16'h3001 :  // <0819> push b // push b
addr == 16'h976 ? 16'h0646 :  // <0819> b = 70
addr == 16'h977 ? 16'h6600 :  // <0819> av_ad_hi = 0
addr == 16'h978 ? 16'h6b00 :  // <0819> av_ad_lo = ad0
addr == 16'h979 ? 16'h5c0c :  // <0819> pop av_write_data // pop av_write_data

addr == 16'h97a ? 16'h0008 :  // <0820> a = flag_addr
addr == 16'h97b ? 16'h0760 :  // <0821> b = -1
addr == 16'h97c ? 16'hc800 :  // <0822> a = a+b
addr == 16'h97d ? 16'h0300 :  // <0822> "
addr == 16'h97e ? 16'h0607 :  // <0823> b = $tfp_mask
addr == 16'h97f ? 16'h6600 :  // <0824> ram $ram_next_tfp_idx = and // av_ad_hi = 0
addr == 16'h980 ? 16'h6a56 :  // <0824> ram $ram_next_tfp_idx = and // av_ad_lo = 86
addr == 16'h981 ? 16'hc800 :  // <0824> ram $ram_next_tfp_idx = and // av_write_data = and
addr == 16'h982 ? 16'h5f30 :  // <0824> "

addr == 16'h983 ? 16'hfc00 :  // <0826> swapra = nop

// ######## func unique_text_flag // = 0x0984
addr == 16'h984 ? 16'h3002 :  // <0837> push i // func unique_text_flag
addr == 16'h985 ? 16'h303e :  // <0837> push rtna // "

addr == 16'h986 ? 16'h0a00 :  // <0834> i = 0
// :loop_2438 // = 0x0987

addr == 16'h987 ? 16'h0002 :  // <0828> a = i

addr == 16'h988 ? 16'h0351 :  // <0829> a = a<<1
addr == 16'h989 ? 16'h0646 :  // <0829> b = 70
addr == 16'h98a ? 16'h6600 :  // <0829> av_ad_hi = 0
addr == 16'h98b ? 16'h6b00 :  // <0829> av_ad_lo = ad0
addr == 16'h98c ? 16'h0417 :  // <0829> b = av_begin_read
addr == 16'h98d ? 16'h0418 :  // <0829> b = av_read_data


addr == 16'h98e ? 16'h0001 :  // <0832> a = b
addr == 16'h98f ? 16'h0408 :  // <0832> b = flag_addr

addr == 16'h990 ? 16'he407 :  // <0830> bn eq :else_2448
addr == 16'h991 ? 16'h0994 :  // <0830> "

addr == 16'h992 ? 16'he00f :  // <0831> jmp :skip
addr == 16'h993 ? 16'h09a0 :  // <0831> "



addr == 16'h994 ? 16'h0002 :  // <0834> a = i
addr == 16'h995 ? 16'h0601 :  // <0834> b = 1
addr == 16'h996 ? 16'hc800 :  // <0834> i = a+b
addr == 16'h997 ? 16'h0b00 :  // <0834> "


addr == 16'h998 ? 16'h0002 :  // <0834> a = i
addr == 16'h999 ? 16'h0608 :  // <0834> b = $num_text_flag_pointers
addr == 16'h99a ? 16'he005 :  // <0834> br lt :loop_2438
addr == 16'h99b ? 16'h0987 :  // <0834> "

// :end_2438 // = 0x099c
addr == 16'h99c ? 16'h2008 :  // <0835> pa = flag_addr
addr == 16'h99d ? 16'hfba0 :  // <0835> callx  set_text_flag  flag_addr
addr == 16'h99e ? 16'h096f :  // <0835> "
addr == 16'h99f ? 16'hfc00 :  // <0835> "
// :skip // = 0x09a0

addr == 16'h9a0 ? 16'hf80c :  // <0838> pop rtna // func unique_text_flag
addr == 16'h9a1 ? 16'h080c :  // <0838> pop i // "
addr == 16'h9a2 ? 16'hfc00 :  // <0838> swapra = nop

// :text_flags_msg // = 0x09a3
// " tf=\x0"
addr == 16'h9a3 ? 16'h7420 :  // <0840> t 
addr == 16'h9a4 ? 16'h3d66 :  // <0840> =f
addr == 16'h9a5 ? 16'h0000 :  // <0840>   

// ######## func report_text_flags // = 0x09a6
addr == 16'h9a6 ? 16'h3002 :  // <0856> push i // func report_text_flags
addr == 16'h9a7 ? 16'h303e :  // <0856> push rtna // "

addr == 16'h9a8 ? 16'h03a0 :  // <0843> a = :text_flags_msg
addr == 16'h9a9 ? 16'h09a3 :  // <0843> "
addr == 16'h9aa ? 16'hfba0 :  // <0844> call :print_nt
addr == 16'h9ab ? 16'h015f :  // <0844> "
addr == 16'h9ac ? 16'hfc00 :  // <0844> "
addr == 16'h9ad ? 16'h0a00 :  // <0855> i = 0
// :loop_2477 // = 0x09ae

addr == 16'h9ae ? 16'h0002 :  // <0845> a = i

addr == 16'h9af ? 16'h0351 :  // <0846> a = a<<1
addr == 16'h9b0 ? 16'h0646 :  // <0846> b = 70
addr == 16'h9b1 ? 16'h6600 :  // <0846> av_ad_hi = 0
addr == 16'h9b2 ? 16'h6b00 :  // <0846> av_ad_lo = ad0
addr == 16'h9b3 ? 16'h0417 :  // <0846> b = av_begin_read
addr == 16'h9b4 ? 16'h0418 :  // <0846> b = av_read_data


addr == 16'h9b5 ? 16'h0001 :  // <0853> a = b
addr == 16'h9b6 ? 16'h0600 :  // <0853> b = 0

addr == 16'h9b7 ? 16'he007 :  // <0847> br eq :else_2487
addr == 16'h9b8 ? 16'h09c8 :  // <0847> "

addr == 16'h9b9 ? 16'hfba0 :  // <0848> call :print_nt
addr == 16'h9ba ? 16'h015f :  // <0848> "
addr == 16'h9bb ? 16'hfc00 :  // <0848> "
addr == 16'h9bc ? 16'h022c :  // <0849> a = 44 // putasc ","
addr == 16'h9bd ? 16'hfba0 :  // <0849> putasc ","
addr == 16'h9be ? 16'h00ab :  // <0849> "
addr == 16'h9bf ? 16'hfc00 :  // <0849> "
addr == 16'h9c0 ? 16'h0002 :  // <0850> a = i
addr == 16'h9c1 ? 16'h0600 :  // <0851> b = 0

addr == 16'h9c2 ? 16'h0351 :  // <0852> a = a<<1
addr == 16'h9c3 ? 16'h3001 :  // <0852> push b // push b
addr == 16'h9c4 ? 16'h0646 :  // <0852> b = 70
addr == 16'h9c5 ? 16'h6600 :  // <0852> av_ad_hi = 0
addr == 16'h9c6 ? 16'h6b00 :  // <0852> av_ad_lo = ad0
addr == 16'h9c7 ? 16'h5c0c :  // <0852> pop av_write_data // pop av_write_data




addr == 16'h9c8 ? 16'h0002 :  // <0855> a = i
addr == 16'h9c9 ? 16'h0601 :  // <0855> b = 1
addr == 16'h9ca ? 16'hc800 :  // <0855> i = a+b
addr == 16'h9cb ? 16'h0b00 :  // <0855> "


addr == 16'h9cc ? 16'h0002 :  // <0855> a = i
addr == 16'h9cd ? 16'h0608 :  // <0855> b = $num_text_flag_pointers
addr == 16'h9ce ? 16'he005 :  // <0855> br lt :loop_2477
addr == 16'h9cf ? 16'h09ae :  // <0855> "

// :end_2477 // = 0x09d0

addr == 16'h9d0 ? 16'hf80c :  // <0857> pop rtna // func report_text_flags
addr == 16'h9d1 ? 16'h080c :  // <0857> pop i // "
addr == 16'h9d2 ? 16'hfc00 :  // <0857> swapra = nop

// :plan_msg // = 0x09d3
// " pl=\x0"
addr == 16'h9d3 ? 16'h7020 :  // <0859> p 
addr == 16'h9d4 ? 16'h3d6c :  // <0859> =l
addr == 16'h9d5 ? 16'h0000 :  // <0859>   
// :manual_trim_msg // = 0x09d6
// " mt=\x0"
addr == 16'h9d6 ? 16'h6d20 :  // <0861> m 
addr == 16'h9d7 ? 16'h3d74 :  // <0861> =t
addr == 16'h9d8 ? 16'h0000 :  // <0861>   

// ######## func report_plan // = 0x09d9
addr == 16'h9d9 ? 16'h303e :  // <0873> push rtna // func report_plan

addr == 16'h9da ? 16'h03a0 :  // <0864> a = :plan_msg
addr == 16'h9db ? 16'h09d3 :  // <0864> "
addr == 16'h9dc ? 16'hfba0 :  // <0865> call :print_nt
addr == 16'h9dd ? 16'h015f :  // <0865> "
addr == 16'h9de ? 16'hfc00 :  // <0865> "
addr == 16'h9df ? 16'h6600 :  // <0866> ram a = $ram_plan_name // av_ad_hi = 0
addr == 16'h9e0 ? 16'h6a88 :  // <0866> ram a = $ram_plan_name // av_ad_lo = 136
addr == 16'h9e1 ? 16'h0017 :  // <0866> ram a = $ram_plan_name // a = av_write_data // start read cycle
addr == 16'h9e2 ? 16'h0018 :  // <0866> ram a = $ram_plan_name // a = av_read_data // finish read cycle
addr == 16'h9e3 ? 16'hfba0 :  // <0867> call :print_nt
addr == 16'h9e4 ? 16'h015f :  // <0867> "
addr == 16'h9e5 ? 16'hfc00 :  // <0867> "

addr == 16'h9e6 ? 16'h03a0 :  // <0869> a = :manual_trim_msg
addr == 16'h9e7 ? 16'h09d6 :  // <0869> "
addr == 16'h9e8 ? 16'hfba0 :  // <0870> call :print_nt
addr == 16'h9e9 ? 16'h015f :  // <0870> "
addr == 16'h9ea ? 16'hfc00 :  // <0870> "
addr == 16'h9eb ? 16'h6600 :  // <0871> ram a = $ram_run_manual_trim // av_ad_hi = 0
addr == 16'h9ec ? 16'h6aaa :  // <0871> ram a = $ram_run_manual_trim // av_ad_lo = 170
addr == 16'h9ed ? 16'h0017 :  // <0871> ram a = $ram_run_manual_trim // a = av_write_data // start read cycle
addr == 16'h9ee ? 16'h0018 :  // <0871> ram a = $ram_run_manual_trim // a = av_read_data // finish read cycle
addr == 16'h9ef ? 16'hfba0 :  // <0872> call :put4x
addr == 16'h9f0 ? 16'h00d3 :  // <0872> "
addr == 16'h9f1 ? 16'hfc00 :  // <0872> "

addr == 16'h9f2 ? 16'hf80c :  // <0874> pop rtna // func report_plan
addr == 16'h9f3 ? 16'hfc00 :  // <0874> swapra = nop

// ######## func interpret_maf // = 0x09f4
addr == 16'h9f4 ? 16'h3002 :  // <0907> push i // func interpret_maf
addr == 16'h9f5 ? 16'h3004 :  // <0907> push x // "

// offset and clamp the MAF ADC count to 0..511.
addr == 16'h9f6 ? 16'h0204 :  // <0877> a = $maf_adc_channel

addr == 16'h9f7 ? 16'h0351 :  // <0878> a = a<<1
addr == 16'h9f8 ? 16'h0626 :  // <0878> b = 38
addr == 16'h9f9 ? 16'h6600 :  // <0878> av_ad_hi = 0
addr == 16'h9fa ? 16'h6b00 :  // <0878> av_ad_lo = ad0
addr == 16'h9fb ? 16'h0417 :  // <0878> b = av_begin_read
addr == 16'h9fc ? 16'h0418 :  // <0878> b = av_read_data

addr == 16'h9fd ? 16'h0001 :  // <0879> a = b
addr == 16'h9fe ? 16'h0350 :  // <0880> a = a>>1
addr == 16'h9ff ? 16'h07a0 :  // <0881> b = 0x01ff
addr == 16'ha00 ? 16'h01ff :  // <0881> "
//patch: do some averaging here, like interpret_tps.
addr == 16'ha01 ? 16'hc800 :  // <0883> x = and
addr == 16'ha02 ? 16'h1330 :  // <0883> "
addr == 16'ha03 ? 16'h6600 :  // <0884> ram $ram_maf_adc_filtered = and // av_ad_hi = 0
addr == 16'ha04 ? 16'h6a98 :  // <0884> ram $ram_maf_adc_filtered = and // av_ad_lo = 152
addr == 16'ha05 ? 16'hc800 :  // <0884> ram $ram_maf_adc_filtered = and // av_write_data = and
addr == 16'ha06 ? 16'h5f30 :  // <0884> "

// recover linear flow from MAF ADC count using hi-res method,
// for actual flow feeding into final puff multiply later.
// 256 cell Brute-force lookup might take e.g. 80us to run.  That's 4 jf,
// or 5% of ignition cycle at max RPM.
addr == 16'ha07 ? 16'h6600 :  // <0890> ram $ram_maf_valid = 0 // av_ad_hi = 0
addr == 16'ha08 ? 16'h6a96 :  // <0890> ram $ram_maf_valid = 0 // av_ad_lo = 150
addr == 16'ha09 ? 16'h5e00 :  // <0890> ram $ram_maf_valid = 0 // av_write_data = 0
addr == 16'ha0a ? 16'h0a00 :  // <0899> i = 0
// :loop_2570 // = 0x0a0b

addr == 16'ha0b ? 16'h0002 :  // <0891> a = i

addr == 16'ha0c ? 16'h0351 :  // <0892> a = a<<1
addr == 16'ha0d ? 16'h07a0 :  // <0892> b = 2048
addr == 16'ha0e ? 16'h0800 :  // <0892> "
addr == 16'ha0f ? 16'h67a0 :  // <0892> av_ad_hi = 256
addr == 16'ha10 ? 16'h0100 :  // <0892> "
addr == 16'ha11 ? 16'h6b00 :  // <0892> av_ad_lo = ad0
addr == 16'ha12 ? 16'h0417 :  // <0892> b = av_begin_read
addr == 16'ha13 ? 16'h0418 :  // <0892> b = av_read_data


addr == 16'ha14 ? 16'h0001 :  // <0897> a = b
addr == 16'ha15 ? 16'h0404 :  // <0897> b = x

addr == 16'ha16 ? 16'he406 :  // <0893> bn gt :else_2582
addr == 16'ha17 ? 16'h0a20 :  // <0893> "

addr == 16'ha18 ? 16'h6600 :  // <0894> ram $ram_maf_flow_hi_res = i // av_ad_hi = 0
addr == 16'ha19 ? 16'h6a9a :  // <0894> ram $ram_maf_flow_hi_res = i // av_ad_lo = 154
addr == 16'ha1a ? 16'h5c02 :  // <0894> ram $ram_maf_flow_hi_res = i // av_write_data = i
addr == 16'ha1b ? 16'h6600 :  // <0895> ram $ram_maf_valid = 1 // av_ad_hi = 0
addr == 16'ha1c ? 16'h6a96 :  // <0895> ram $ram_maf_valid = 1 // av_ad_lo = 150
addr == 16'ha1d ? 16'h5e01 :  // <0895> ram $ram_maf_valid = 1 // av_write_data = 1
addr == 16'ha1e ? 16'he00f :  // <0896> jmp :maf_done
addr == 16'ha1f ? 16'h0a29 :  // <0896> "



addr == 16'ha20 ? 16'h0002 :  // <0899> a = i
addr == 16'ha21 ? 16'h0601 :  // <0899> b = 1
addr == 16'ha22 ? 16'hc800 :  // <0899> i = a+b
addr == 16'ha23 ? 16'h0b00 :  // <0899> "


addr == 16'ha24 ? 16'h0002 :  // <0899> a = i
addr == 16'ha25 ? 16'h07a0 :  // <0899> b = $maf_map_num_cells
addr == 16'ha26 ? 16'h0100 :  // <0899> "
addr == 16'ha27 ? 16'he005 :  // <0899> br lt :loop_2570
addr == 16'ha28 ? 16'h0a0b :  // <0899> "

// :end_2570 // = 0x0a29
// :maf_done // = 0x0a29

// quantize linear flow from hi-res to lo-res for indexing into AFRC map rows.
// Lo-res = hi-res >> 2.
addr == 16'ha29 ? 16'h6600 :  // <0904> ram a = $ram_maf_flow_hi_res // av_ad_hi = 0
addr == 16'ha2a ? 16'h6a9a :  // <0904> ram a = $ram_maf_flow_hi_res // av_ad_lo = 154
addr == 16'ha2b ? 16'h0017 :  // <0904> ram a = $ram_maf_flow_hi_res // a = av_write_data // start read cycle
addr == 16'ha2c ? 16'h0018 :  // <0904> ram a = $ram_maf_flow_hi_res // a = av_read_data // finish read cycle
addr == 16'ha2d ? 16'h0350 :  // <0905> a = a>>1
addr == 16'ha2e ? 16'h6600 :  // <0906> ram $ram_afrc_maf_row_idx = a>>1 // av_ad_hi = 0
addr == 16'ha2f ? 16'h6a9c :  // <0906> ram $ram_afrc_maf_row_idx = a>>1 // av_ad_lo = 156
addr == 16'ha30 ? 16'h5f50 :  // <0906> ram $ram_afrc_maf_row_idx = a>>1 // av_write_data = a>>1

addr == 16'ha31 ? 16'h100c :  // <0908> pop x // func interpret_maf
addr == 16'ha32 ? 16'h080c :  // <0908> pop i // "
addr == 16'ha33 ? 16'hfc00 :  // <0908> swapra = nop

// ######## func interpret_tps // = 0x0a34
addr == 16'ha34 ? 16'h3002 :  // <0936> push i // func interpret_tps
addr == 16'ha35 ? 16'h3004 :  // <0936> push x // "
addr == 16'ha36 ? 16'h3005 :  // <0936> push y // "
addr == 16'ha37 ? 16'h3006 :  // <0936> push ga // "
addr == 16'ha38 ? 16'h3007 :  // <0936> push gb // "

addr == 16'ha39 ? 16'h0206 :  // <0910> a = $tps_adc_channel

addr == 16'ha3a ? 16'h0351 :  // <0911> a = a<<1
addr == 16'ha3b ? 16'h0626 :  // <0911> b = 38
addr == 16'ha3c ? 16'h6600 :  // <0911> av_ad_hi = 0
addr == 16'ha3d ? 16'h6b00 :  // <0911> av_ad_lo = ad0
addr == 16'ha3e ? 16'h0417 :  // <0911> b = av_begin_read
addr == 16'ha3f ? 16'h0418 :  // <0911> b = av_read_data

// reverse the scale.
addr == 16'ha40 ? 16'h03a0 :  // <0913> a = 0x0fff
addr == 16'ha41 ? 16'h0fff :  // <0913> "
addr == 16'ha42 ? 16'hc800 :  // <0914> b = xor
addr == 16'ha43 ? 16'h0738 :  // <0914> "
// memorize reading into slot 0 and shift history up 1 slot.  total up as we go.
addr == 16'ha44 ? 16'h1801 :  // <0916> ga = b
addr == 16'ha45 ? 16'h1200 :  // <0917> x = 0
addr == 16'ha46 ? 16'h0a00 :  // <0928> i = 0
// :loop_2630 // = 0x0a47

addr == 16'ha47 ? 16'h0002 :  // <0918> a = i

addr == 16'ha48 ? 16'h0351 :  // <0919> a = a<<1
addr == 16'ha49 ? 16'h06b0 :  // <0919> b = 176
addr == 16'ha4a ? 16'h6600 :  // <0919> av_ad_hi = 0
addr == 16'ha4b ? 16'h6b00 :  // <0919> av_ad_lo = ad0
addr == 16'ha4c ? 16'h0417 :  // <0919> b = av_begin_read
addr == 16'ha4d ? 16'h0418 :  // <0919> b = av_read_data

addr == 16'ha4e ? 16'h1c01 :  // <0920> gb = b
addr == 16'ha4f ? 16'h1401 :  // <0921> y = b
addr == 16'ha50 ? 16'hc800 :  // <0922> x = x+y
addr == 16'ha51 ? 16'h1320 :  // <0922> "
addr == 16'ha52 ? 16'h0002 :  // <0923> a = i
addr == 16'ha53 ? 16'h0406 :  // <0924> b = ga

addr == 16'ha54 ? 16'h0351 :  // <0925> a = a<<1
addr == 16'ha55 ? 16'h3001 :  // <0925> push b // push b
addr == 16'ha56 ? 16'h06b0 :  // <0925> b = 176
addr == 16'ha57 ? 16'h6600 :  // <0925> av_ad_hi = 0
addr == 16'ha58 ? 16'h6b00 :  // <0925> av_ad_lo = ad0
addr == 16'ha59 ? 16'h5c0c :  // <0925> pop av_write_data // pop av_write_data

addr == 16'ha5a ? 16'h1807 :  // <0926> ga = gb


addr == 16'ha5b ? 16'h0002 :  // <0928> a = i
addr == 16'ha5c ? 16'h0601 :  // <0928> b = 1
addr == 16'ha5d ? 16'hc800 :  // <0928> i = a+b
addr == 16'ha5e ? 16'h0b00 :  // <0928> "


addr == 16'ha5f ? 16'h0002 :  // <0928> a = i
addr == 16'ha60 ? 16'h0604 :  // <0928> b = $tps_history_len
addr == 16'ha61 ? 16'he005 :  // <0928> br lt :loop_2630
addr == 16'ha62 ? 16'h0a47 :  // <0928> "

// :end_2630 // = 0x0a63
// memorize average.
addr == 16'ha63 ? 16'h0004 :  // <0930> a = x
addr == 16'ha64 ? 16'h0350 :  // <0931> a = a>>1
addr == 16'ha65 ? 16'h1b50 :  // <0932> ga = a>>1
addr == 16'ha66 ? 16'h6600 :  // <0933> ram $ram_tps_avg = ga // av_ad_hi = 0
addr == 16'ha67 ? 16'h6aae :  // <0933> ram $ram_tps_avg = ga // av_ad_lo = 174
addr == 16'ha68 ? 16'h5c06 :  // <0933> ram $ram_tps_avg = ga // av_write_data = ga

// :end // = 0x0a69

addr == 16'ha69 ? 16'h1c0c :  // <0937> pop gb // func interpret_tps
addr == 16'ha6a ? 16'h180c :  // <0937> pop ga // "
addr == 16'ha6b ? 16'h140c :  // <0937> pop y // "
addr == 16'ha6c ? 16'h100c :  // <0937> pop x // "
addr == 16'ha6d ? 16'h080c :  // <0937> pop i // "
addr == 16'ha6e ? 16'hfc00 :  // <0937> swapra = nop

// ######## func jf_to_rpm // = 0x0a6f
addr == 16'ha6f ? 16'h303e :  // <0947> push rtna // func jf_to_rpm

// resolution = 32 rpm.
addr == 16'ha70 ? 16'h0408 :  // <0940> b = jiffies
addr == 16'ha71 ? 16'h03a0 :  // <0941> a = 0x5573
addr == 16'ha72 ? 16'h5573 :  // <0941> "
// = 700000 >> 5
addr == 16'ha73 ? 16'hfba0 :  // <0943> call :divide
addr == 16'ha74 ? 16'h019c :  // <0943> "
addr == 16'ha75 ? 16'hfc00 :  // <0943> "
addr == 16'ha76 ? 16'h0001 :  // <0944> a = b
addr == 16'ha77 ? 16'h0352 :  // <0945> a = a<<4
addr == 16'ha78 ? 16'h2351 :  // <0946> rpm = a<<1

addr == 16'ha79 ? 16'hf80c :  // <0948> pop rtna // func jf_to_rpm
addr == 16'ha7a ? 16'hfc00 :  // <0948> swapra = nop

// ######## func check_engine_stop // = 0x0a7b
addr == 16'ha7b ? 16'h303e :  // <0964> push rtna // func check_engine_stop

// returns 1 if transitioned to stop, else 0.

// transition to plan_stop if ignition switch is turned off AND rpm estimate is invalid.
// requiring both conditions prevents spurious noise readings from shutting down the injection.

addr == 16'ha7c ? 16'h0022 :  // <0962> a = power_duty
addr == 16'ha7d ? 16'h0680 :  // <0962> b = ( 0x0080 )

addr == 16'ha7e ? 16'he003 :  // <0954> br and0z :else_2686
addr == 16'ha7f ? 16'h0a93 :  // <0954> "

addr == 16'ha80 ? 16'h6600 :  // <0955> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'ha81 ? 16'h6a7e :  // <0955> ram a = $ram_rpm_valid // av_ad_lo = 126
addr == 16'ha82 ? 16'h0017 :  // <0955> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'ha83 ? 16'h0018 :  // <0955> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle

addr == 16'ha84 ? 16'h0000 :  // <0961> a = a
addr == 16'ha85 ? 16'h0600 :  // <0961> b = 0

addr == 16'ha86 ? 16'he407 :  // <0956> bn eq :else_2694
addr == 16'ha87 ? 16'h0a93 :  // <0956> "

addr == 16'ha88 ? 16'h6600 :  // <0957> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'ha89 ? 16'h6a8e :  // <0957> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'ha8a ? 16'hf817 :  // <0957> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'ha8b ? 16'hf818 :  // <0957> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'ha8c ? 16'hfc00 :  // <0958> swapra = nop
addr == 16'ha8d ? 16'hfba0 :  // <0960> callx  init_plan_stop
addr == 16'ha8e ? 16'h0349 :  // <0960> "
addr == 16'ha8f ? 16'hfc00 :  // <0960> "
addr == 16'ha90 ? 16'h2201 :  // <0961> did_stop = 1
addr == 16'ha91 ? 16'hf80c :  // <0961> pop rtna // rtn 1
addr == 16'ha92 ? 16'hfc00 :  // <0960> swapra = nop


addr == 16'ha93 ? 16'h2200 :  // <0963> did_stop = 0
addr == 16'ha94 ? 16'hf80c :  // <0963> pop rtna // rtn 0
addr == 16'ha95 ? 16'hfc00 :  // <0962> swapra = nop

addr == 16'ha96 ? 16'hf80c :  // <0965> pop rtna // func check_engine_stop
addr == 16'ha97 ? 16'hfc00 :  // <0965> swapra = nop


        
                16'hxxxx;
        endmodule
    
