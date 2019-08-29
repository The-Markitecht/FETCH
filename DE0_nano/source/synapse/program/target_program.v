
        `include "header.v"

        module target_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.

addr == 16'h00 ? 16'he00f :  // <0004> jmp :main
addr == 16'h01 ? 16'h06f4 :  // <0004> "


// Synapse instruction set architecture constants.

// Synapse instruction set codes.

// debugging supervisor contants.  these are also required by implementation of the target MCU core.

// size of external register file.  all these registers are external to the Synapse316 core.
// min_populated_ext_regs <= num_populated_ext_regs <= max_populated_ext_regs <= 48 supported in the core's muxer and module ports.
// all those numbers are smaller than src_max and dest_max addresses of the architecture.
// from num_populated_ext_regs through max_populated_ext_regs the external address space
// is stubbed as "don't care" values by the Synapse core.
// that doesn't affect operator results and other addresses implemented internally by the Synapse core.
//vdefine num_populated_ext_regs            32
//vdefine top_populated_ext_reg             $num_populated_ext_regs - 1
// those 2 have been moved to the assembly program to be distinct for each core.

// register addresses of operators and their operands.


// program code dimensions.


// register file configuration.
// beyond top_populated_ext_reg the external address space is stubbed as "don't care" values by the Synapse core.
// that doesn't affect operator results and other addresses implemented internally by the Synapse core.

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
// 8750 RPM = about 80 jf between rising edges on chevy ignition white wire.  ignition counter noise blanking begins here in svn revision 627.
// 5000 RPM = about 140 jf
// 1000 RPM = about 700 jf
//  100 RPM = about 7000 jf
//   22 RPM = about 32000 jf, the slowest figure that's safe for the divide routine.

// fuel injection puff driver.
// SETTING puff_len_us NON-ZERO ENABLES FUEL INJECTION!!  zero disables it.
// MUST SET ign_timeout_len_jf NON-ZERO PRIOR TO ENABLING!
// otherwise the module latches up in a non-working state.

// engine state management.  each engine state is called a "plan".

addr == 16'h02 ? 16'h0026 :  // <0200> emit_debugger_register_table  counter
// "       a"
addr == 16'h03 ? 16'h2020 :  // <0200>   
addr == 16'h04 ? 16'h2020 :  // <0200>   
addr == 16'h05 ? 16'h2020 :  // <0200>   
addr == 16'h06 ? 16'h6120 :  // <0200> a 
// "       b"
addr == 16'h07 ? 16'h2020 :  // <0200>   
addr == 16'h08 ? 16'h2020 :  // <0200>   
addr == 16'h09 ? 16'h2020 :  // <0200>   
addr == 16'h0a ? 16'h6220 :  // <0200> b 
// "       i"
addr == 16'h0b ? 16'h2020 :  // <0200>   
addr == 16'h0c ? 16'h2020 :  // <0200>   
addr == 16'h0d ? 16'h2020 :  // <0200>   
addr == 16'h0e ? 16'h6920 :  // <0200> i 
// "       j"
addr == 16'h0f ? 16'h2020 :  // <0200>   
addr == 16'h10 ? 16'h2020 :  // <0200>   
addr == 16'h11 ? 16'h2020 :  // <0200>   
addr == 16'h12 ? 16'h6a20 :  // <0200> j 
// "       x"
addr == 16'h13 ? 16'h2020 :  // <0200>   
addr == 16'h14 ? 16'h2020 :  // <0200>   
addr == 16'h15 ? 16'h2020 :  // <0200>   
addr == 16'h16 ? 16'h7820 :  // <0200> x 
// "       y"
addr == 16'h17 ? 16'h2020 :  // <0200>   
addr == 16'h18 ? 16'h2020 :  // <0200>   
addr == 16'h19 ? 16'h2020 :  // <0200>   
addr == 16'h1a ? 16'h7920 :  // <0200> y 
// "      ga"
addr == 16'h1b ? 16'h2020 :  // <0200>   
addr == 16'h1c ? 16'h2020 :  // <0200>   
addr == 16'h1d ? 16'h2020 :  // <0200>   
addr == 16'h1e ? 16'h6167 :  // <0200> ag
// "      gb"
addr == 16'h1f ? 16'h2020 :  // <0200>   
addr == 16'h20 ? 16'h2020 :  // <0200>   
addr == 16'h21 ? 16'h2020 :  // <0200>   
addr == 16'h22 ? 16'h6267 :  // <0200> bg
// "      pa"
addr == 16'h23 ? 16'h2020 :  // <0200>   
addr == 16'h24 ? 16'h2020 :  // <0200>   
addr == 16'h25 ? 16'h2020 :  // <0200>   
addr == 16'h26 ? 16'h6170 :  // <0200> ap
// "      pb"
addr == 16'h27 ? 16'h2020 :  // <0200>   
addr == 16'h28 ? 16'h2020 :  // <0200>   
addr == 16'h29 ? 16'h2020 :  // <0200>   
addr == 16'h2a ? 16'h6270 :  // <0200> bp
// "      pc"
addr == 16'h2b ? 16'h2020 :  // <0200>   
addr == 16'h2c ? 16'h2020 :  // <0200>   
addr == 16'h2d ? 16'h2020 :  // <0200>   
addr == 16'h2e ? 16'h6370 :  // <0200> cp
// "      pd"
addr == 16'h2f ? 16'h2020 :  // <0200>   
addr == 16'h30 ? 16'h2020 :  // <0200>   
addr == 16'h31 ? 16'h2020 :  // <0200>   
addr == 16'h32 ? 16'h6470 :  // <0200> dp
// "//rstk  "
addr == 16'h33 ? 16'h2f2f :  // <0200> //
addr == 16'h34 ? 16'h7372 :  // <0200> sr
addr == 16'h35 ? 16'h6b74 :  // <0200> kt
addr == 16'h36 ? 16'h2020 :  // <0200>   
// "  ev_pri"
addr == 16'h37 ? 16'h2020 :  // <0200>   
addr == 16'h38 ? 16'h7665 :  // <0200> ve
addr == 16'h39 ? 16'h705f :  // <0200> p_
addr == 16'h3a ? 16'h6972 :  // <0200> ir
// "softevnt"
addr == 16'h3b ? 16'h6f73 :  // <0200> os
addr == 16'h3c ? 16'h7466 :  // <0200> tf
addr == 16'h3d ? 16'h7665 :  // <0200> ve
addr == 16'h3e ? 16'h746e :  // <0200> tn
// "   usage"
addr == 16'h3f ? 16'h2020 :  // <0200>   
addr == 16'h40 ? 16'h7520 :  // <0200> u 
addr == 16'h41 ? 16'h6173 :  // <0200> as
addr == 16'h42 ? 16'h6567 :  // <0200> eg
// "prductlo"
addr == 16'h43 ? 16'h7270 :  // <0200> rp
addr == 16'h44 ? 16'h7564 :  // <0200> ud
addr == 16'h45 ? 16'h7463 :  // <0200> tc
addr == 16'h46 ? 16'h6f6c :  // <0200> ol
// "prducthi"
addr == 16'h47 ? 16'h7270 :  // <0200> rp
addr == 16'h48 ? 16'h7564 :  // <0200> ud
addr == 16'h49 ? 16'h7463 :  // <0200> tc
addr == 16'h4a ? 16'h6968 :  // <0200> ih
// "ustimer0"
addr == 16'h4b ? 16'h7375 :  // <0200> su
addr == 16'h4c ? 16'h6974 :  // <0200> it
addr == 16'h4d ? 16'h656d :  // <0200> em
addr == 16'h4e ? 16'h3072 :  // <0200> 0r
// "mstimer0"
addr == 16'h4f ? 16'h736d :  // <0200> sm
addr == 16'h50 ? 16'h6974 :  // <0200> it
addr == 16'h51 ? 16'h656d :  // <0200> em
addr == 16'h52 ? 16'h3072 :  // <0200> 0r
// "mstimer1"
addr == 16'h53 ? 16'h736d :  // <0200> sm
addr == 16'h54 ? 16'h6974 :  // <0200> it
addr == 16'h55 ? 16'h656d :  // <0200> em
addr == 16'h56 ? 16'h3172 :  // <0200> 1r
// "mstimer2"
addr == 16'h57 ? 16'h736d :  // <0200> sm
addr == 16'h58 ? 16'h6974 :  // <0200> it
addr == 16'h59 ? 16'h656d :  // <0200> em
addr == 16'h5a ? 16'h3272 :  // <0200> 2r
// "spi_data"
addr == 16'h5b ? 16'h7073 :  // <0200> ps
addr == 16'h5c ? 16'h5f69 :  // <0200> _i
addr == 16'h5d ? 16'h6164 :  // <0200> ad
addr == 16'h5e ? 16'h6174 :  // <0200> at
// "//avwrdt"
addr == 16'h5f ? 16'h2f2f :  // <0200> //
addr == 16'h60 ? 16'h7661 :  // <0200> va
addr == 16'h61 ? 16'h7277 :  // <0200> rw
addr == 16'h62 ? 16'h7464 :  // <0200> td
// "av_rd_dt"
addr == 16'h63 ? 16'h7661 :  // <0200> va
addr == 16'h64 ? 16'h725f :  // <0200> r_
addr == 16'h65 ? 16'h5f64 :  // <0200> _d
addr == 16'h66 ? 16'h7464 :  // <0200> td
// "av_ad_hi"
addr == 16'h67 ? 16'h7661 :  // <0200> va
addr == 16'h68 ? 16'h615f :  // <0200> a_
addr == 16'h69 ? 16'h5f64 :  // <0200> _d
addr == 16'h6a ? 16'h6968 :  // <0200> ih
// "av_ad_lo"
addr == 16'h6b ? 16'h7661 :  // <0200> va
addr == 16'h6c ? 16'h615f :  // <0200> a_
addr == 16'h6d ? 16'h5f64 :  // <0200> _d
addr == 16'h6e ? 16'h6f6c :  // <0200> ol
// "//dromad"
addr == 16'h6f ? 16'h2f2f :  // <0200> //
addr == 16'h70 ? 16'h7264 :  // <0200> rd
addr == 16'h71 ? 16'h6d6f :  // <0200> mo
addr == 16'h72 ? 16'h6461 :  // <0200> da
// "dromdata"
addr == 16'h73 ? 16'h7264 :  // <0200> rd
addr == 16'h74 ? 16'h6d6f :  // <0200> mo
addr == 16'h75 ? 16'h6164 :  // <0200> ad
addr == 16'h76 ? 16'h6174 :  // <0200> at
// "//uartdt"
addr == 16'h77 ? 16'h2f2f :  // <0200> //
addr == 16'h78 ? 16'h6175 :  // <0200> au
addr == 16'h79 ? 16'h7472 :  // <0200> tr
addr == 16'h7a ? 16'h7464 :  // <0200> td
// "uartstat"
addr == 16'h7b ? 16'h6175 :  // <0200> au
addr == 16'h7c ? 16'h7472 :  // <0200> tr
addr == 16'h7d ? 16'h7473 :  // <0200> ts
addr == 16'h7e ? 16'h7461 :  // <0200> ta
// "    leds"
addr == 16'h7f ? 16'h2020 :  // <0200>   
addr == 16'h80 ? 16'h2020 :  // <0200>   
addr == 16'h81 ? 16'h656c :  // <0200> el
addr == 16'h82 ? 16'h7364 :  // <0200> sd
// "brd_ctrl"
addr == 16'h83 ? 16'h7262 :  // <0200> rb
addr == 16'h84 ? 16'h5f64 :  // <0200> _d
addr == 16'h85 ? 16'h7463 :  // <0200> tc
addr == 16'h86 ? 16'h6c72 :  // <0200> lr
// "   anmux"
addr == 16'h87 ? 16'h2020 :  // <0200>   
addr == 16'h88 ? 16'h6120 :  // <0200> a 
addr == 16'h89 ? 16'h6d6e :  // <0200> mn
addr == 16'h8a ? 16'h7875 :  // <0200> xu
// "pwr_duty"
addr == 16'h8b ? 16'h7770 :  // <0200> wp
addr == 16'h8c ? 16'h5f72 :  // <0200> _r
addr == 16'h8d ? 16'h7564 :  // <0200> ud
addr == 16'h8e ? 16'h7974 :  // <0200> yt
// "igntmcap"
addr == 16'h8f ? 16'h6769 :  // <0200> gi
addr == 16'h90 ? 16'h746e :  // <0200> tn
addr == 16'h91 ? 16'h636d :  // <0200> cm
addr == 16'h92 ? 16'h7061 :  // <0200> pa
// "igntmout"
addr == 16'h93 ? 16'h6769 :  // <0200> gi
addr == 16'h94 ? 16'h746e :  // <0200> tn
addr == 16'h95 ? 16'h6f6d :  // <0200> om
addr == 16'h96 ? 16'h7475 :  // <0200> tu
// "puflenus"
addr == 16'h97 ? 16'h7570 :  // <0200> up
addr == 16'h98 ? 16'h6c66 :  // <0200> lf
addr == 16'h99 ? 16'h6e65 :  // <0200> ne
addr == 16'h9a ? 16'h7375 :  // <0200> su

// string resources
// :boot_msg // = 0x009b
// "TGT\r\n\x0"
addr == 16'h9b ? 16'h4754 :  // <0204> GT
addr == 16'h9c ? 16'h0d54 :  // <0204>  T
addr == 16'h9d ? 16'h000a :  // <0204>   

// libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.

// event loop.  this infrastructure is assembled directly into the main program, not a func.
// first instruction of an event handler should be the 7th cycle after reading its priority from the event controller here.
// :poll_events // = 0x009e
// initialize prior to polling loop, for minimum latency.
addr == 16'h9e ? 16'h07a0 :  // <0006> b = :event_table
addr == 16'h9f ? 16'h07f4 :  // <0006> "
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
addr == 16'h234 ? 16'h07a0 :  // <0017> b = ([negate 0xff])
addr == 16'h235 ? 16'hff01 :  // <0017> "
addr == 16'h236 ? 16'hc800 :  // <0018> a = a+b
addr == 16'h237 ? 16'h0300 :  // <0018> "
addr == 16'h238 ? 16'he00f :  // <0019> jmp :mod255_again
addr == 16'h239 ? 16'h0230 :  // <0019> "

addr == 16'h23a ? 16'hfc00 :  // <0021> swapra = nop

// accumulate a Fletcher16 checksum, given the next byte of data.
// ######## func fletcher16_input8 // = 0x023b
addr == 16'h23b ? 16'h303e :  // <0046> push rtna // func fletcher16_input8

//TODO: debug only.
//x = a
//putasc " "
//a = x
//call put4x
//a = x

addr == 16'h23c ? 16'h040a :  // <0031> b = $fletcher_sum1_reg
addr == 16'h23d ? 16'hc800 :  // <0032> a = a+b
addr == 16'h23e ? 16'h0300 :  // <0032> "
addr == 16'h23f ? 16'hfba0 :  // <0032> callx mod255  a+b  $fletcher_sum1_reg
addr == 16'h240 ? 16'h0230 :  // <0032> "
addr == 16'h241 ? 16'hfc00 :  // <0032> "
addr == 16'h242 ? 16'h2800 :  // <0032> pc = a

addr == 16'h243 ? 16'h000a :  // <0034> a = $fletcher_sum1_reg
addr == 16'h244 ? 16'h040b :  // <0035> b = $fletcher_sum2_reg
addr == 16'h245 ? 16'hc800 :  // <0036> a = a+b
addr == 16'h246 ? 16'h0300 :  // <0036> "
addr == 16'h247 ? 16'hfba0 :  // <0036> callx mod255  a+b  $fletcher_sum2_reg
addr == 16'h248 ? 16'h0230 :  // <0036> "
addr == 16'h249 ? 16'hfc00 :  // <0036> "
addr == 16'h24a ? 16'h2c00 :  // <0036> pd = a

//TODO: debug only.
//putasc " "
//a =  $fletcher_sum2_reg
//call put4x
//putasc " "
//a =  $fletcher_sum1_reg
//call put4x
//puteol

addr == 16'h24b ? 16'hf80c :  // <0047> pop rtna // func fletcher16_input8
addr == 16'h24c ? 16'hfc00 :  // <0047> swapra = nop

// accumulate a Fletcher16 checksum, given the next word of data.
// ######## func fletcher16_input16 // = 0x024d
addr == 16'h24d ? 16'h3002 :  // <0055> push i // func fletcher16_input16
addr == 16'h24e ? 16'h303e :  // <0055> push rtna // "

addr == 16'h24f ? 16'h0b53 :  // <0050> i = a>>4
addr == 16'h250 ? 16'h06ff :  // <0051> b = 0xff
addr == 16'h251 ? 16'hc800 :  // <0052> a = and
addr == 16'h252 ? 16'h0330 :  // <0052> "
addr == 16'h253 ? 16'hfba0 :  // <0052> callx fletcher16_input8  and
addr == 16'h254 ? 16'h023b :  // <0052> "
addr == 16'h255 ? 16'hfc00 :  // <0052> "
addr == 16'h256 ? 16'h0002 :  // <0053> a = i
addr == 16'h257 ? 16'h0353 :  // <0054> a = a>>4
addr == 16'h258 ? 16'hfba0 :  // <0054> callx fletcher16_input8  a>>4
addr == 16'h259 ? 16'h023b :  // <0054> "
addr == 16'h25a ? 16'hfc00 :  // <0054> "

addr == 16'h25b ? 16'hf80c :  // <0056> pop rtna // func fletcher16_input16
addr == 16'h25c ? 16'h080c :  // <0056> pop i // "
addr == 16'h25d ? 16'hfc00 :  // <0056> swapra = nop

// return the combined 16-bit result of Fletcher16 checksum.
// ######## func fletcher16_result // = 0x025e

addr == 16'h25e ? 16'h000b :  // <0059> a = $fletcher_sum2_reg
addr == 16'h25f ? 16'h0352 :  // <0060> a = a<<4
addr == 16'h260 ? 16'h0352 :  // <0061> a = a<<4
addr == 16'h261 ? 16'h040a :  // <0062> b = $fletcher_sum1_reg
addr == 16'h262 ? 16'hc800 :  // <0063> result = or
addr == 16'h263 ? 16'h0334 :  // <0063> "
addr == 16'h264 ? 16'hfc00 :  // <0062> swapra = nop

addr == 16'h265 ? 16'hfc00 :  // <0065> swapra = nop





// the higher-res MAF ref is used to recover absolute flow.
// so it has more cells than afrc_maf_rows.






// ######## func init_drom // = 0x0266
addr == 16'h266 ? 16'h3002 :  // <0122> push i // func init_drom

// copy entire ROM content to a shadow area in RAM.
addr == 16'h267 ? 16'h67a0 :  // <0116> av_ad_hi = ($drom_shadow_base >> 16)
addr == 16'h268 ? 16'h0100 :  // <0116> "
addr == 16'h269 ? 16'h0a00 :  // <0121> i = 0
// :loop_617 // = 0x026a

addr == 16'h26a ? 16'h6c02 :  // <0117> drom_ad = i
addr == 16'h26b ? 16'h6802 :  // <0118> av_ad_lo = i
addr == 16'h26c ? 16'h5c1c :  // <0119> av_write_data = drom_data


addr == 16'h26d ? 16'h0002 :  // <0121> a = i
addr == 16'h26e ? 16'h0601 :  // <0121> b = 1
addr == 16'h26f ? 16'hc800 :  // <0121> i = a+b
addr == 16'h270 ? 16'h0b00 :  // <0121> "


addr == 16'h271 ? 16'h0002 :  // <0121> a = i
addr == 16'h272 ? 16'h07a0 :  // <0121> b = $drom_shadow_len_bytes
addr == 16'h273 ? 16'h0b48 :  // <0121> "
addr == 16'h274 ? 16'he005 :  // <0121> br lt :loop_617
addr == 16'h275 ? 16'h026a :  // <0121> "

// :end_617 // = 0x0276

addr == 16'h276 ? 16'h080c :  // <0123> pop i // func init_drom
addr == 16'h277 ? 16'hfc00 :  // <0123> swapra = nop

// ######## func load_afrc_cmd // = 0x0278
addr == 16'h278 ? 16'h3002 :  // <0158> push i // func load_afrc_cmd
addr == 16'h279 ? 16'h3005 :  // <0158> push y // "
addr == 16'h27a ? 16'h303e :  // <0158> push rtna // "

// loads 1 row only.

addr == 16'h27b ? 16'hfba0 :  // <0127> callx fletcher16_init
addr == 16'h27c ? 16'h022d :  // <0127> "
addr == 16'h27d ? 16'hfc00 :  // <0127> "
// expect valid row index.
addr == 16'h27e ? 16'hfba0 :  // <0129> call  get4x
addr == 16'h27f ? 16'h010c :  // <0129> "
addr == 16'h280 ? 16'hfc00 :  // <0129> "
addr == 16'h281 ? 16'h1400 :  // <0130> y = a
addr == 16'h282 ? 16'hfba0 :  // <0131> callx fletcher16_input16  a
addr == 16'h283 ? 16'h024d :  // <0131> "
addr == 16'h284 ? 16'hfc00 :  // <0131> "

addr == 16'h285 ? 16'h0005 :  // <0152> a = y
addr == 16'h286 ? 16'h0640 :  // <0152> b = 64

addr == 16'h287 ? 16'he405 :  // <0132> bn lt :else_647
addr == 16'h288 ? 16'h02ac :  // <0132> "

// set RAM address to start of given row.  call struct_read for its side effect on Avalon address regs.
addr == 16'h289 ? 16'h0005 :  // <0134> a = y
addr == 16'h28a ? 16'h0610 :  // <0135> b = $afrc_rpm_cols
addr == 16'h28b ? 16'hc800 :  // <0136> nop
addr == 16'h28c ? 16'hc800 :  // <0137> nop
addr == 16'h28d ? 16'hc800 :  // <0138> nop
addr == 16'h28e ? 16'hc800 :  // <0139> nop
addr == 16'h28f ? 16'h0410 :  // <0140> b = product_lo
addr == 16'h290 ? 16'h0200 :  // <0141> a = 0

addr == 16'h291 ? 16'h0351 :  // <0141> a = a<<1
addr == 16'h292 ? 16'h0600 :  // <0141> b = 0
addr == 16'h293 ? 16'h67a0 :  // <0141> av_ad_hi = 256
addr == 16'h294 ? 16'h0100 :  // <0141> "
addr == 16'h295 ? 16'h6b00 :  // <0141> av_ad_lo = ad0
addr == 16'h296 ? 16'h0417 :  // <0141> b = av_begin_read

addr == 16'h297 ? 16'h0018 :  // <0141> a = av_read_data

// expect each cell value back-to-back.
addr == 16'h298 ? 16'h0a00 :  // <0151> i = 0
// :loop_664 // = 0x0299

addr == 16'h299 ? 16'hfba0 :  // <0144> call  get4x
addr == 16'h29a ? 16'h010c :  // <0144> "
addr == 16'h29b ? 16'hfc00 :  // <0144> "
addr == 16'h29c ? 16'h5c00 :  // <0145> av_write_data = a
addr == 16'h29d ? 16'hfba0 :  // <0146> callx fletcher16_input16  a
addr == 16'h29e ? 16'h024d :  // <0146> "
addr == 16'h29f ? 16'hfc00 :  // <0146> "
addr == 16'h2a0 ? 16'h001a :  // <0147> a = av_ad_lo
addr == 16'h2a1 ? 16'h0602 :  // <0148> b = 2
addr == 16'h2a2 ? 16'hc800 :  // <0149> av_ad_lo = a+b
addr == 16'h2a3 ? 16'h6b00 :  // <0149> "


addr == 16'h2a4 ? 16'h0002 :  // <0151> a = i
addr == 16'h2a5 ? 16'h0601 :  // <0151> b = 1
addr == 16'h2a6 ? 16'hc800 :  // <0151> i = a+b
addr == 16'h2a7 ? 16'h0b00 :  // <0151> "


addr == 16'h2a8 ? 16'h0002 :  // <0151> a = i
addr == 16'h2a9 ? 16'h0610 :  // <0151> b = $afrc_rpm_cols
addr == 16'h2aa ? 16'he005 :  // <0151> br lt :loop_664
addr == 16'h2ab ? 16'h0299 :  // <0151> "

// :end_664 // = 0x02ac


// reply with checksum
addr == 16'h2ac ? 16'hfba0 :  // <0155> callx fletcher16_result a
addr == 16'h2ad ? 16'h025e :  // <0155> "
addr == 16'h2ae ? 16'hfc00 :  // <0155> "
addr == 16'h2af ? 16'hfba0 :  // <0156> call put4x
addr == 16'h2b0 ? 16'h00d3 :  // <0156> "
addr == 16'h2b1 ? 16'hfc00 :  // <0156> "
addr == 16'h2b2 ? 16'h020d :  // <0157> a = 13 // puteol
addr == 16'h2b3 ? 16'hfba0 :  // <0157> puteol
addr == 16'h2b4 ? 16'h00ab :  // <0157> "
addr == 16'h2b5 ? 16'hfc00 :  // <0157> "
addr == 16'h2b6 ? 16'h020a :  // <0157> a = 10 // puteol
addr == 16'h2b7 ? 16'hfba0 :  // <0157> puteol
addr == 16'h2b8 ? 16'h00ab :  // <0157> "
addr == 16'h2b9 ? 16'hfc00 :  // <0157> "

addr == 16'h2ba ? 16'hf80c :  // <0159> pop rtna // func load_afrc_cmd
addr == 16'h2bb ? 16'h140c :  // <0159> pop y // "
addr == 16'h2bc ? 16'h080c :  // <0159> pop i // "
addr == 16'h2bd ? 16'hfc00 :  // <0159> swapra = nop

// ######## func load_row_cmd // = 0x02be
addr == 16'h2be ? 16'h3002 :  // <0180> push i // func load_row_cmd
addr == 16'h2bf ? 16'h303e :  // <0180> push rtna // "

// loads 1 row of data having the given number of words.
// start of row address must be already loaded into av_ad_hi and av_ad_lo.

addr == 16'h2c0 ? 16'hfba0 :  // <0164> callx fletcher16_init
addr == 16'h2c1 ? 16'h022d :  // <0164> "
addr == 16'h2c2 ? 16'hfc00 :  // <0164> "

// expect each cell value back-to-back.
addr == 16'h2c3 ? 16'h0a00 :  // <0174> i = 0
// :loop_707 // = 0x02c4

addr == 16'h2c4 ? 16'hfba0 :  // <0167> call  get4x
addr == 16'h2c5 ? 16'h010c :  // <0167> "
addr == 16'h2c6 ? 16'hfc00 :  // <0167> "
addr == 16'h2c7 ? 16'h5c00 :  // <0168> av_write_data = a
addr == 16'h2c8 ? 16'hfba0 :  // <0169> callx fletcher16_input16  a
addr == 16'h2c9 ? 16'h024d :  // <0169> "
addr == 16'h2ca ? 16'hfc00 :  // <0169> "
addr == 16'h2cb ? 16'h001a :  // <0170> a = av_ad_lo
addr == 16'h2cc ? 16'h0602 :  // <0171> b = 2
addr == 16'h2cd ? 16'hc800 :  // <0172> av_ad_lo = a+b
addr == 16'h2ce ? 16'h6b00 :  // <0172> "


addr == 16'h2cf ? 16'h0002 :  // <0174> a = i
addr == 16'h2d0 ? 16'h0601 :  // <0174> b = 1
addr == 16'h2d1 ? 16'hc800 :  // <0174> i = a+b
addr == 16'h2d2 ? 16'h0b00 :  // <0174> "


addr == 16'h2d3 ? 16'h0002 :  // <0174> a = i
addr == 16'h2d4 ? 16'h0408 :  // <0174> b = num_words
addr == 16'h2d5 ? 16'he005 :  // <0174> br lt :loop_707
addr == 16'h2d6 ? 16'h02c4 :  // <0174> "

// :end_707 // = 0x02d7

// reply with checksum
addr == 16'h2d7 ? 16'hfba0 :  // <0177> callx fletcher16_result a
addr == 16'h2d8 ? 16'h025e :  // <0177> "
addr == 16'h2d9 ? 16'hfc00 :  // <0177> "
addr == 16'h2da ? 16'hfba0 :  // <0178> call put4x
addr == 16'h2db ? 16'h00d3 :  // <0178> "
addr == 16'h2dc ? 16'hfc00 :  // <0178> "
addr == 16'h2dd ? 16'h020d :  // <0179> a = 13 // puteol
addr == 16'h2de ? 16'hfba0 :  // <0179> puteol
addr == 16'h2df ? 16'h00ab :  // <0179> "
addr == 16'h2e0 ? 16'hfc00 :  // <0179> "
addr == 16'h2e1 ? 16'h020a :  // <0179> a = 10 // puteol
addr == 16'h2e2 ? 16'hfba0 :  // <0179> puteol
addr == 16'h2e3 ? 16'h00ab :  // <0179> "
addr == 16'h2e4 ? 16'hfc00 :  // <0179> "

addr == 16'h2e5 ? 16'hf80c :  // <0181> pop rtna // func load_row_cmd
addr == 16'h2e6 ? 16'h080c :  // <0181> pop i // "
addr == 16'h2e7 ? 16'hfc00 :  // <0181> swapra = nop

// ######## func load_rpm_ref_cmd // = 0x02e8
addr == 16'h2e8 ? 16'h303e :  // <0185> push rtna // func load_rpm_ref_cmd

addr == 16'h2e9 ? 16'h0200 :  // <0183> a = 0

addr == 16'h2ea ? 16'h0351 :  // <0183> a = a<<1
addr == 16'h2eb ? 16'h07a0 :  // <0183> b = 2560
addr == 16'h2ec ? 16'h0a00 :  // <0183> "
addr == 16'h2ed ? 16'h67a0 :  // <0183> av_ad_hi = 256
addr == 16'h2ee ? 16'h0100 :  // <0183> "
addr == 16'h2ef ? 16'h6b00 :  // <0183> av_ad_lo = ad0
addr == 16'h2f0 ? 16'h0417 :  // <0183> b = av_begin_read

addr == 16'h2f1 ? 16'h0018 :  // <0183> a = av_read_data
addr == 16'h2f2 ? 16'h2210 :  // <0184> pa = 16
addr == 16'h2f3 ? 16'hfba0 :  // <0184> callx load_row_cmd $rpm_ref_num_cells
addr == 16'h2f4 ? 16'h02be :  // <0184> "
addr == 16'h2f5 ? 16'hfc00 :  // <0184> "

addr == 16'h2f6 ? 16'hf80c :  // <0186> pop rtna // func load_rpm_ref_cmd
addr == 16'h2f7 ? 16'hfc00 :  // <0186> swapra = nop

// ######## func load_maf_ref_cmd // = 0x02f8
addr == 16'h2f8 ? 16'h303e :  // <0190> push rtna // func load_maf_ref_cmd

addr == 16'h2f9 ? 16'h0200 :  // <0188> a = 0

addr == 16'h2fa ? 16'h0351 :  // <0188> a = a<<1
addr == 16'h2fb ? 16'h07a0 :  // <0188> b = 2048
addr == 16'h2fc ? 16'h0800 :  // <0188> "
addr == 16'h2fd ? 16'h67a0 :  // <0188> av_ad_hi = 256
addr == 16'h2fe ? 16'h0100 :  // <0188> "
addr == 16'h2ff ? 16'h6b00 :  // <0188> av_ad_lo = ad0
addr == 16'h300 ? 16'h0417 :  // <0188> b = av_begin_read

addr == 16'h301 ? 16'h0018 :  // <0188> a = av_read_data
addr == 16'h302 ? 16'h23a0 :  // <0189> pa = 256
addr == 16'h303 ? 16'h0100 :  // <0189> "
addr == 16'h304 ? 16'hfba0 :  // <0189> callx load_row_cmd $maf_ref_num_cells
addr == 16'h305 ? 16'h02be :  // <0189> "
addr == 16'h306 ? 16'hfc00 :  // <0189> "

addr == 16'h307 ? 16'hf80c :  // <0191> pop rtna // func load_maf_ref_cmd
addr == 16'h308 ? 16'hfc00 :  // <0191> swapra = nop

// ######## func load_block_temp_ref_cmd // = 0x0309
addr == 16'h309 ? 16'h303e :  // <0195> push rtna // func load_block_temp_ref_cmd

addr == 16'h30a ? 16'h0200 :  // <0193> a = 0

addr == 16'h30b ? 16'h0351 :  // <0193> a = a<<1
addr == 16'h30c ? 16'h07a0 :  // <0193> b = 2592
addr == 16'h30d ? 16'h0a20 :  // <0193> "
addr == 16'h30e ? 16'h67a0 :  // <0193> av_ad_hi = 256
addr == 16'h30f ? 16'h0100 :  // <0193> "
addr == 16'h310 ? 16'h6b00 :  // <0193> av_ad_lo = ad0
addr == 16'h311 ? 16'h0417 :  // <0193> b = av_begin_read

addr == 16'h312 ? 16'h0018 :  // <0193> a = av_read_data
addr == 16'h313 ? 16'h2240 :  // <0194> pa = 64
addr == 16'h314 ? 16'hfba0 :  // <0194> callx load_row_cmd $block_temp_num_cells
addr == 16'h315 ? 16'h02be :  // <0194> "
addr == 16'h316 ? 16'hfc00 :  // <0194> "

addr == 16'h317 ? 16'hf80c :  // <0196> pop rtna // func load_block_temp_ref_cmd
addr == 16'h318 ? 16'hfc00 :  // <0196> swapra = nop

// ######## func load_block_temp_map_cmd // = 0x0319
addr == 16'h319 ? 16'h303e :  // <0200> push rtna // func load_block_temp_map_cmd

addr == 16'h31a ? 16'h0200 :  // <0198> a = 0

addr == 16'h31b ? 16'h0351 :  // <0198> a = a<<1
addr == 16'h31c ? 16'h07a0 :  // <0198> b = 2720
addr == 16'h31d ? 16'h0aa0 :  // <0198> "
addr == 16'h31e ? 16'h67a0 :  // <0198> av_ad_hi = 256
addr == 16'h31f ? 16'h0100 :  // <0198> "
addr == 16'h320 ? 16'h6b00 :  // <0198> av_ad_lo = ad0
addr == 16'h321 ? 16'h0417 :  // <0198> b = av_begin_read

addr == 16'h322 ? 16'h0018 :  // <0198> a = av_read_data
addr == 16'h323 ? 16'h2240 :  // <0199> pa = 64
addr == 16'h324 ? 16'hfba0 :  // <0199> callx load_row_cmd $block_temp_num_cells
addr == 16'h325 ? 16'h02be :  // <0199> "
addr == 16'h326 ? 16'hfc00 :  // <0199> "

addr == 16'h327 ? 16'hf80c :  // <0201> pop rtna // func load_block_temp_map_cmd
addr == 16'h328 ? 16'hfc00 :  // <0201> swapra = nop

// ######## func load_afterstart_ref_cmd // = 0x0329
addr == 16'h329 ? 16'h303e :  // <0205> push rtna // func load_afterstart_ref_cmd

addr == 16'h32a ? 16'h0200 :  // <0203> a = 0

addr == 16'h32b ? 16'h0351 :  // <0203> a = a<<1
addr == 16'h32c ? 16'h07a0 :  // <0203> b = 2848
addr == 16'h32d ? 16'h0b20 :  // <0203> "
addr == 16'h32e ? 16'h67a0 :  // <0203> av_ad_hi = 256
addr == 16'h32f ? 16'h0100 :  // <0203> "
addr == 16'h330 ? 16'h6b00 :  // <0203> av_ad_lo = ad0
addr == 16'h331 ? 16'h0417 :  // <0203> b = av_begin_read

addr == 16'h332 ? 16'h0018 :  // <0203> a = av_read_data
addr == 16'h333 ? 16'h220a :  // <0204> pa = 10
addr == 16'h334 ? 16'hfba0 :  // <0204> callx load_row_cmd $afterstart_num_cells
addr == 16'h335 ? 16'h02be :  // <0204> "
addr == 16'h336 ? 16'hfc00 :  // <0204> "

addr == 16'h337 ? 16'hf80c :  // <0206> pop rtna // func load_afterstart_ref_cmd
addr == 16'h338 ? 16'hfc00 :  // <0206> swapra = nop

// ######## func load_afterstart_map_cmd // = 0x0339
addr == 16'h339 ? 16'h303e :  // <0210> push rtna // func load_afterstart_map_cmd

addr == 16'h33a ? 16'h0200 :  // <0208> a = 0

addr == 16'h33b ? 16'h0351 :  // <0208> a = a<<1
addr == 16'h33c ? 16'h07a0 :  // <0208> b = 2868
addr == 16'h33d ? 16'h0b34 :  // <0208> "
addr == 16'h33e ? 16'h67a0 :  // <0208> av_ad_hi = 256
addr == 16'h33f ? 16'h0100 :  // <0208> "
addr == 16'h340 ? 16'h6b00 :  // <0208> av_ad_lo = ad0
addr == 16'h341 ? 16'h0417 :  // <0208> b = av_begin_read

addr == 16'h342 ? 16'h0018 :  // <0208> a = av_read_data
addr == 16'h343 ? 16'h220a :  // <0209> pa = 10
addr == 16'h344 ? 16'hfba0 :  // <0209> callx load_row_cmd $afterstart_num_cells
addr == 16'h345 ? 16'h02be :  // <0209> "
addr == 16'h346 ? 16'hfc00 :  // <0209> "

addr == 16'h347 ? 16'hf80c :  // <0211> pop rtna // func load_afterstart_map_cmd
addr == 16'h348 ? 16'hfc00 :  // <0211> swapra = nop




// command strings must be exactly key_buf_max bytes long (currently 7).
// the other byte is the carriage return.
// when commands share a common suffix, the longer command must come FIRST here.
// :cmd_table // = 0x0349
// "  hello"
addr == 16'h349 ? 16'h2020 :  // <0008>   
addr == 16'h34a ? 16'h6568 :  // <0008> eh
addr == 16'h34b ? 16'h6c6c :  // <0008> ll
addr == 16'h34c ? 16'h006f :  // <0008>  o
addr == 16'h34d ? 16'h0414 :  // <0009> ([label hello_cmd])
// "  plstp"
addr == 16'h34e ? 16'h2020 :  // <0010>   
addr == 16'h34f ? 16'h6c70 :  // <0010> lp
addr == 16'h350 ? 16'h7473 :  // <0010> ts
addr == 16'h351 ? 16'h0070 :  // <0010>  p
addr == 16'h352 ? 16'h0418 :  // <0011> ([label set_plan_stop_cmd])
// "   plcr"
addr == 16'h353 ? 16'h2020 :  // <0012>   
addr == 16'h354 ? 16'h7020 :  // <0012> p 
addr == 16'h355 ? 16'h636c :  // <0012> cl
addr == 16'h356 ? 16'h0072 :  // <0012>  r
addr == 16'h357 ? 16'h0423 :  // <0013> ([label set_plan_crank_cmd])
//"   plwm"
//([label set_plan_warmup_cmd])
// "   plrn"
addr == 16'h358 ? 16'h2020 :  // <0016>   
addr == 16'h359 ? 16'h7020 :  // <0016> p 
addr == 16'h35a ? 16'h726c :  // <0016> rl
addr == 16'h35b ? 16'h006e :  // <0016>  n
addr == 16'h35c ? 16'h042e :  // <0017> ([label set_plan_run_cmd])
//"   plln"
//([label set_plan_learn_cmd])
// "  stoff"
addr == 16'h35d ? 16'h2020 :  // <0020>   
addr == 16'h35e ? 16'h7473 :  // <0020> ts
addr == 16'h35f ? 16'h666f :  // <0020> fo
addr == 16'h360 ? 16'h0066 :  // <0020>  f
addr == 16'h361 ? 16'h0439 :  // <0021> ([label status_off_cmd])
// "   ston"
addr == 16'h362 ? 16'h2020 :  // <0022>   
addr == 16'h363 ? 16'h7320 :  // <0022> s 
addr == 16'h364 ? 16'h6f74 :  // <0022> ot
addr == 16'h365 ? 16'h006e :  // <0022>  n
addr == 16'h366 ? 16'h043d :  // <0023> ([label status_on_cmd])
// " ldafrc"
addr == 16'h367 ? 16'h6c20 :  // <0024> l 
addr == 16'h368 ? 16'h6164 :  // <0024> ad
addr == 16'h369 ? 16'h7266 :  // <0024> rf
addr == 16'h36a ? 16'h0063 :  // <0024>  c
addr == 16'h36b ? 16'h0278 :  // <0025> ([label load_afrc_cmd])
// when commands share a common suffix, the longer command must come FIRST here.
// "   afrc"
addr == 16'h36c ? 16'h2020 :  // <0027>   
addr == 16'h36d ? 16'h6120 :  // <0027> a 
addr == 16'h36e ? 16'h7266 :  // <0027> rf
addr == 16'h36f ? 16'h0063 :  // <0027>  c
addr == 16'h370 ? 16'h06a1 :  // <0028> ([label dump_afrc_cmd])
// "  ldrpm"
addr == 16'h371 ? 16'h2020 :  // <0029>   
addr == 16'h372 ? 16'h646c :  // <0029> dl
addr == 16'h373 ? 16'h7072 :  // <0029> pr
addr == 16'h374 ? 16'h006d :  // <0029>  m
addr == 16'h375 ? 16'h02e8 :  // <0030> ([label load_rpm_ref_cmd])
// "  ldmaf"
addr == 16'h376 ? 16'h2020 :  // <0031>   
addr == 16'h377 ? 16'h646c :  // <0031> dl
addr == 16'h378 ? 16'h616d :  // <0031> am
addr == 16'h379 ? 16'h0066 :  // <0031>  f
addr == 16'h37a ? 16'h02f8 :  // <0032> ([label load_maf_ref_cmd])
// "ldbtref"
addr == 16'h37b ? 16'h646c :  // <0033> dl
addr == 16'h37c ? 16'h7462 :  // <0033> tb
addr == 16'h37d ? 16'h6572 :  // <0033> er
addr == 16'h37e ? 16'h0066 :  // <0033>  f
addr == 16'h37f ? 16'h0309 :  // <0034> ([label load_block_temp_ref_cmd])
// "ldbtmap"
addr == 16'h380 ? 16'h646c :  // <0035> dl
addr == 16'h381 ? 16'h7462 :  // <0035> tb
addr == 16'h382 ? 16'h616d :  // <0035> am
addr == 16'h383 ? 16'h0070 :  // <0035>  p
addr == 16'h384 ? 16'h0319 :  // <0036> ([label load_block_temp_map_cmd])
// "ldasref"
addr == 16'h385 ? 16'h646c :  // <0037> dl
addr == 16'h386 ? 16'h7361 :  // <0037> sa
addr == 16'h387 ? 16'h6572 :  // <0037> er
addr == 16'h388 ? 16'h0066 :  // <0037>  f
addr == 16'h389 ? 16'h0329 :  // <0038> ([label load_afterstart_ref_cmd])
// "ldasmap"
addr == 16'h38a ? 16'h646c :  // <0039> dl
addr == 16'h38b ? 16'h7361 :  // <0039> sa
addr == 16'h38c ? 16'h616d :  // <0039> am
addr == 16'h38d ? 16'h0070 :  // <0039>  p
addr == 16'h38e ? 16'h0339 :  // <0040> ([label load_afterstart_map_cmd])
// "      ,"
addr == 16'h38f ? 16'h2020 :  // <0041>   
addr == 16'h390 ? 16'h2020 :  // <0041>   
addr == 16'h391 ? 16'h2020 :  // <0041>   
addr == 16'h392 ? 16'h002c :  // <0041>  ,
addr == 16'h393 ? 16'h04e8 :  // <0042> ([label trim_lean_cmd])
// "      ."
addr == 16'h394 ? 16'h2020 :  // <0043>   
addr == 16'h395 ? 16'h2020 :  // <0043>   
addr == 16'h396 ? 16'h2020 :  // <0043>   
addr == 16'h397 ? 16'h002e :  // <0043>  .
addr == 16'h398 ? 16'h04f9 :  // <0044> ([label trim_rich_cmd])
// "     \["
addr == 16'h399 ? 16'h2020 :  // <0045>   
addr == 16'h39a ? 16'h2020 :  // <0045>   
addr == 16'h39b ? 16'h5b20 :  // <0045> [ 
addr == 16'h39c ? 16'h050a :  // <0046> ([label trim_2lean_cmd])
// "     \]"
addr == 16'h39d ? 16'h2020 :  // <0047>   
addr == 16'h39e ? 16'h2020 :  // <0047>   
addr == 16'h39f ? 16'h5d20 :  // <0047> ] 
addr == 16'h3a0 ? 16'h051b :  // <0048> ([label trim_2rich_cmd])
// "\x0\x0"
addr == 16'h3a1 ? 16'h0000 :  // <0049>   


// ######## func parse_key // = 0x03a2
addr == 16'h3a2 ? 16'h3002 :  // <0063> push i // func parse_key
addr == 16'h3a3 ? 16'h3004 :  // <0063> push x // "
addr == 16'h3a4 ? 16'h3005 :  // <0063> push y // "
addr == 16'h3a5 ? 16'h303e :  // <0063> push rtna // "

// memorize into ram_key_buf, pushing down existing content.
addr == 16'h3a6 ? 16'h1008 :  // <0054> x = key
addr == 16'h3a7 ? 16'h0a07 :  // <0059> i = $key_buf_max
// :loop_935 // = 0x03a8

addr == 16'h3a8 ? 16'h0002 :  // <0055> a = i

addr == 16'h3a9 ? 16'h0351 :  // <0055> a = a<<1
addr == 16'h3aa ? 16'h0600 :  // <0055> b = 0
addr == 16'h3ab ? 16'h6600 :  // <0055> av_ad_hi = 0
addr == 16'h3ac ? 16'h6b00 :  // <0055> av_ad_lo = ad0
addr == 16'h3ad ? 16'h0417 :  // <0055> b = av_begin_read

addr == 16'h3ae ? 16'h1418 :  // <0055> y = av_read_data
addr == 16'h3af ? 16'h3004 :  // <0056> push x // push x
addr == 16'h3b0 ? 16'h0002 :  // <0056> a = i

addr == 16'h3b1 ? 16'h0351 :  // <0056> a = a<<1
addr == 16'h3b2 ? 16'h0600 :  // <0056> b = 0
addr == 16'h3b3 ? 16'h6600 :  // <0056> av_ad_hi = 0
addr == 16'h3b4 ? 16'h6b00 :  // <0056> av_ad_lo = ad0

addr == 16'h3b5 ? 16'h5c0c :  // <0056> pop av_write_data // pop av_write_data
addr == 16'h3b6 ? 16'h1005 :  // <0057> x = y


addr == 16'h3b7 ? 16'h0002 :  // <0059> a = i
addr == 16'h3b8 ? 16'h0600 :  // <0059> b = 0
addr == 16'h3b9 ? 16'he007 :  // <0059> br eq :end_935
addr == 16'h3ba ? 16'h03c3 :  // <0059> "


addr == 16'h3bb ? 16'h0002 :  // <0059> a = i
addr == 16'h3bc ? 16'h0760 :  // <0059> b = -1
addr == 16'h3bd ? 16'hc800 :  // <0059> i = a+b
addr == 16'h3be ? 16'h0b00 :  // <0059> "


addr == 16'h3bf ? 16'h0002 :  // <0059> a = i
addr == 16'h3c0 ? 16'h0600 :  // <0059> b = 0
addr == 16'h3c1 ? 16'he405 :  // <0059> bn lt :loop_935
addr == 16'h3c2 ? 16'h03a8 :  // <0059> "

// :end_935 // = 0x03c3

addr == 16'h3c3 ? 16'h0008 :  // <0062> a = key
addr == 16'h3c4 ? 16'h060d :  // <0062> b = 13

addr == 16'h3c5 ? 16'he407 :  // <0060> bn eq :else_965
addr == 16'h3c6 ? 16'h03ca :  // <0060> "

addr == 16'h3c7 ? 16'hfba0 :  // <0061> callx  parse_command
addr == 16'h3c8 ? 16'h03d1 :  // <0061> "
addr == 16'h3c9 ? 16'hfc00 :  // <0061> "


addr == 16'h3ca ? 16'hf80c :  // <0064> pop rtna // func parse_key
addr == 16'h3cb ? 16'h140c :  // <0064> pop y // "
addr == 16'h3cc ? 16'h100c :  // <0064> pop x // "
addr == 16'h3cd ? 16'h080c :  // <0064> pop i // "
addr == 16'h3ce ? 16'hfc00 :  // <0064> swapra = nop

// :cmd_ack_msg // = 0x03cf
// "OK\x0"
addr == 16'h3cf ? 16'h4b4f :  // <0066> KO
addr == 16'h3d0 ? 16'h0000 :  // <0066>   

// ######## func parse_command // = 0x03d1
addr == 16'h3d1 ? 16'h3002 :  // <0106> push i // func parse_command
addr == 16'h3d2 ? 16'h3004 :  // <0106> push x // "
addr == 16'h3d3 ? 16'h3005 :  // <0106> push y // "
addr == 16'h3d4 ? 16'h303e :  // <0106> push rtna // "

addr == 16'h3d5 ? 16'h13a0 :  // <0069> x = :cmd_table
addr == 16'h3d6 ? 16'h0349 :  // <0069> "
// :next_cmd // = 0x03d7
addr == 16'h3d7 ? 16'hd004 :  // <0071> fetch a from x
addr == 16'h3d8 ? 16'h03b0 :  // <0071> "
addr == 16'h3d9 ? 16'he000 :  // <0072> br az :done
addr == 16'h3da ? 16'h040f :  // <0072> "

addr == 16'h3db ? 16'h0a00 :  // <0087> i = 0
// :loop_987 // = 0x03dc

addr == 16'h3dc ? 16'h0002 :  // <0074> a = i
addr == 16'h3dd ? 16'hfba0 :  // <0075> call :fetch_byte
addr == 16'h3de ? 16'h01ec :  // <0075> "
addr == 16'h3df ? 16'hfc00 :  // <0075> "
addr == 16'h3e0 ? 16'h1400 :  // <0076> y = a
addr == 16'h3e1 ? 16'h0620 :  // <0077> b = 32 // asc b = " "

addr == 16'h3e2 ? 16'h0000 :  // <0085> a = a
addr == 16'h3e3 ? 16'h0401 :  // <0085> b = b

addr == 16'h3e4 ? 16'he007 :  // <0078> br eq :else_996
addr == 16'h3e5 ? 16'h03f0 :  // <0078> "

//asc b = "*"
//br eq :matched
//// parameter character.  succeed early.
addr == 16'h3e6 ? 16'h0002 :  // <0082> a = i

addr == 16'h3e7 ? 16'h0351 :  // <0082> a = a<<1
addr == 16'h3e8 ? 16'h0600 :  // <0082> b = 0
addr == 16'h3e9 ? 16'h6600 :  // <0082> av_ad_hi = 0
addr == 16'h3ea ? 16'h6b00 :  // <0082> av_ad_lo = ad0
addr == 16'h3eb ? 16'h0417 :  // <0082> b = av_begin_read

addr == 16'h3ec ? 16'h0418 :  // <0082> b = av_read_data
addr == 16'h3ed ? 16'h0005 :  // <0083> a = y
addr == 16'h3ee ? 16'he407 :  // <0084> bn eq :no_match
addr == 16'h3ef ? 16'h0404 :  // <0084> "



addr == 16'h3f0 ? 16'h0002 :  // <0087> a = i
addr == 16'h3f1 ? 16'h0601 :  // <0087> b = 1
addr == 16'h3f2 ? 16'hc800 :  // <0087> i = a+b
addr == 16'h3f3 ? 16'h0b00 :  // <0087> "


addr == 16'h3f4 ? 16'h0002 :  // <0087> a = i
addr == 16'h3f5 ? 16'h0607 :  // <0087> b = $key_buf_max
addr == 16'h3f6 ? 16'he005 :  // <0087> br lt :loop_987
addr == 16'h3f7 ? 16'h03dc :  // <0087> "

// :end_987 // = 0x03f8

// at this point we have a match on the record beginning at x.
// :matched // = 0x03f8
addr == 16'h3f8 ? 16'h23a0 :  // <0091> pa = :cmd_ack_msg
addr == 16'h3f9 ? 16'h03cf :  // <0091> "
addr == 16'h3fa ? 16'hfba0 :  // <0091> callx  set_text_flag  :cmd_ack_msg
addr == 16'h3fb ? 16'h0bc0 :  // <0091> "
addr == 16'h3fc ? 16'hfc00 :  // <0091> "
addr == 16'h3fd ? 16'h1604 :  // <0092> y = ($key_buf_len / 2)
addr == 16'h3fe ? 16'hc800 :  // <0093> fetch rtna from x+y
addr == 16'h3ff ? 16'hd320 :  // <0093> "
addr == 16'h400 ? 16'hfbb0 :  // <0093> "
addr == 16'h401 ? 16'hfc00 :  // <0094> swapra = nop
addr == 16'h402 ? 16'he00f :  // <0096> jmp :done
addr == 16'h403 ? 16'h040f :  // <0096> "

// :no_match // = 0x0404
// if ram_terminal_connected is still 0, quit searching after the very first command in the table.
addr == 16'h404 ? 16'h6600 :  // <0100> ram a = $ram_terminal_connected // av_ad_hi = 0
addr == 16'h405 ? 16'h6a96 :  // <0100> ram a = $ram_terminal_connected // av_ad_lo = 150
addr == 16'h406 ? 16'h0017 :  // <0100> ram a = $ram_terminal_connected // a = av_write_data // start read cycle
addr == 16'h407 ? 16'h0018 :  // <0100> ram a = $ram_terminal_connected // a = av_read_data // finish read cycle
addr == 16'h408 ? 16'he000 :  // <0101> br az :done
addr == 16'h409 ? 16'h040f :  // <0101> "

addr == 16'h40a ? 16'h1605 :  // <0103> y = (($key_buf_len / 2) + 1)
addr == 16'h40b ? 16'hc800 :  // <0104> x = x+y
addr == 16'h40c ? 16'h1320 :  // <0104> "
addr == 16'h40d ? 16'he00f :  // <0105> jmp :next_cmd
addr == 16'h40e ? 16'h03d7 :  // <0105> "
// :done // = 0x040f

addr == 16'h40f ? 16'hf80c :  // <0108> pop rtna // func parse_command
addr == 16'h410 ? 16'h140c :  // <0108> pop y // "
addr == 16'h411 ? 16'h100c :  // <0108> pop x // "
addr == 16'h412 ? 16'h080c :  // <0108> pop i // "
addr == 16'h413 ? 16'hfc00 :  // <0108> swapra = nop

// ######## func hello_cmd // = 0x0414

addr == 16'h414 ? 16'h6600 :  // <0110> ram $ram_terminal_connected = 1 // av_ad_hi = 0
addr == 16'h415 ? 16'h6a96 :  // <0110> ram $ram_terminal_connected = 1 // av_ad_lo = 150
addr == 16'h416 ? 16'h5e01 :  // <0110> ram $ram_terminal_connected = 1 // av_write_data = 1

addr == 16'h417 ? 16'hfc00 :  // <0112> swapra = nop

// ######## func set_plan_stop_cmd // = 0x0418
addr == 16'h418 ? 16'h303e :  // <0117> push rtna // func set_plan_stop_cmd

addr == 16'h419 ? 16'h6600 :  // <0114> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h41a ? 16'h6a90 :  // <0114> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h41b ? 16'hf817 :  // <0114> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h41c ? 16'hf818 :  // <0114> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h41d ? 16'hfc00 :  // <0115> swapra = nop
addr == 16'h41e ? 16'hfba0 :  // <0117> callx  init_plan_stop
addr == 16'h41f ? 16'h0443 :  // <0117> "
addr == 16'h420 ? 16'hfc00 :  // <0117> "

addr == 16'h421 ? 16'hf80c :  // <0119> pop rtna // func set_plan_stop_cmd
addr == 16'h422 ? 16'hfc00 :  // <0119> swapra = nop

// ######## func set_plan_crank_cmd // = 0x0423
addr == 16'h423 ? 16'h303e :  // <0124> push rtna // func set_plan_crank_cmd

addr == 16'h424 ? 16'h6600 :  // <0121> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h425 ? 16'h6a90 :  // <0121> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h426 ? 16'hf817 :  // <0121> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h427 ? 16'hf818 :  // <0121> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h428 ? 16'hfc00 :  // <0122> swapra = nop
addr == 16'h429 ? 16'hfba0 :  // <0124> callx  init_plan_crank
addr == 16'h42a ? 16'h0482 :  // <0124> "
addr == 16'h42b ? 16'hfc00 :  // <0124> "

addr == 16'h42c ? 16'hf80c :  // <0126> pop rtna // func set_plan_crank_cmd
addr == 16'h42d ? 16'hfc00 :  // <0126> swapra = nop

// ######## func set_plan_run_cmd // = 0x042e
addr == 16'h42e ? 16'h303e :  // <0131> push rtna // func set_plan_run_cmd

addr == 16'h42f ? 16'h6600 :  // <0128> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h430 ? 16'h6a90 :  // <0128> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h431 ? 16'hf817 :  // <0128> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h432 ? 16'hf818 :  // <0128> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h433 ? 16'hfc00 :  // <0129> swapra = nop
addr == 16'h434 ? 16'hfba0 :  // <0131> callx  init_plan_run
addr == 16'h435 ? 16'h052d :  // <0131> "
addr == 16'h436 ? 16'hfc00 :  // <0131> "

addr == 16'h437 ? 16'hf80c :  // <0133> pop rtna // func set_plan_run_cmd
addr == 16'h438 ? 16'hfc00 :  // <0133> swapra = nop

// ######## func status_off_cmd // = 0x0439

addr == 16'h439 ? 16'h6600 :  // <0135> ram $ram_enable_status_report = 0 // av_ad_hi = 0
addr == 16'h43a ? 16'h6a3c :  // <0135> ram $ram_enable_status_report = 0 // av_ad_lo = 60
addr == 16'h43b ? 16'h5e00 :  // <0135> ram $ram_enable_status_report = 0 // av_write_data = 0

addr == 16'h43c ? 16'hfc00 :  // <0137> swapra = nop

// ######## func status_on_cmd // = 0x043d

addr == 16'h43d ? 16'h6600 :  // <0139> ram $ram_enable_status_report = 1 // av_ad_hi = 0
addr == 16'h43e ? 16'h6a3c :  // <0139> ram $ram_enable_status_report = 1 // av_ad_lo = 60
addr == 16'h43f ? 16'h5e01 :  // <0139> ram $ram_enable_status_report = 1 // av_write_data = 1

addr == 16'h440 ? 16'hfc00 :  // <0141> swapra = nop


// :plan_name_stop // = 0x0441
// "STP\x0"
addr == 16'h441 ? 16'h5453 :  // <0002> TS
addr == 16'h442 ? 16'h0050 :  // <0002>  P

// ######## func init_plan_stop // = 0x0443
addr == 16'h443 ? 16'h303e :  // <0023> push rtna // func init_plan_stop

// set up the stop plan.
addr == 16'h444 ? 16'hfba0 :  // <0006> callx  clear_ign_history
addr == 16'h445 ? 16'h088f :  // <0006> "
addr == 16'h446 ? 16'hfc00 :  // <0006> "
// set noise filter to measure RPM between 50 and 1160 to indicate cranking.
addr == 16'h447 ? 16'h6600 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_hi = 0
addr == 16'h448 ? 16'h6a84 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_lo = 132
addr == 16'h449 ? 16'h5fa0 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_write_data = 603
addr == 16'h44a ? 16'h025b :  // <0008> "
addr == 16'h44b ? 16'h6600 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h44c ? 16'h6a86 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 134
addr == 16'h44d ? 16'h5fa0 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h44e ? 16'h36b0 :  // <0009> "
addr == 16'h44f ? 16'h93a0 :  // <0010> ign_timeout_len_jf = ([rpm_to_jf 50])
addr == 16'h450 ? 16'h36b0 :  // <0010> "
// normally puff length is not touched by an init func.
// this one does it because it's part of the program boot,
// and also a good idea whenever stopping the engine.
// this might interrupt a puff in mid-pulse, but no matter in this case.
addr == 16'h451 ? 16'h6600 :  // <0015> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h452 ? 16'h6a92 :  // <0015> ram $ram_next_puff_len_us = 0 // av_ad_lo = 146
addr == 16'h453 ? 16'h5e00 :  // <0015> ram $ram_next_puff_len_us = 0 // av_write_data = 0
addr == 16'h454 ? 16'h9600 :  // <0016> puff_len_us = 0

// memorize state.
addr == 16'h455 ? 16'h6600 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_ad_hi = 0
addr == 16'h456 ? 16'h6a8a :  // <0019> ram $ram_plan_name = :plan_name_stop // av_ad_lo = 138
addr == 16'h457 ? 16'h5fa0 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_write_data = :plan_name_stop
addr == 16'h458 ? 16'h0441 :  // <0019> "
addr == 16'h459 ? 16'h6600 :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_ad_hi = 0
addr == 16'h45a ? 16'h6a8c :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_ad_lo = 140
addr == 16'h45b ? 16'h5fa0 :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_write_data = :puff_len_stop
addr == 16'h45c ? 16'h0468 :  // <0020> "
addr == 16'h45d ? 16'h6600 :  // <0021> ram $ram_transition_func = :leave_stop // av_ad_hi = 0
addr == 16'h45e ? 16'h6a8e :  // <0021> ram $ram_transition_func = :leave_stop // av_ad_lo = 142
addr == 16'h45f ? 16'h5fa0 :  // <0021> ram $ram_transition_func = :leave_stop // av_write_data = :leave_stop
addr == 16'h460 ? 16'h046c :  // <0021> "
addr == 16'h461 ? 16'h6600 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_hi = 0
addr == 16'h462 ? 16'h6a90 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_lo = 144
addr == 16'h463 ? 16'h5fa0 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_write_data = :destroy_plan_stop
addr == 16'h464 ? 16'h0467 :  // <0022> "

addr == 16'h465 ? 16'hf80c :  // <0024> pop rtna // func init_plan_stop
addr == 16'h466 ? 16'hfc00 :  // <0024> swapra = nop

// ######## func destroy_plan_stop // = 0x0467


addr == 16'h467 ? 16'hfc00 :  // <0027> swapra = nop

// ######## func puff_len_stop // = 0x0468

addr == 16'h468 ? 16'h6600 :  // <0029> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h469 ? 16'h6a92 :  // <0029> ram $ram_next_puff_len_us = 0 // av_ad_lo = 146
addr == 16'h46a ? 16'h5e00 :  // <0029> ram $ram_next_puff_len_us = 0 // av_write_data = 0

addr == 16'h46b ? 16'hfc00 :  // <0031> swapra = nop

// ######## func leave_stop // = 0x046c
addr == 16'h46c ? 16'h303e :  // <0044> push rtna // func leave_stop

// leave stop plan if ignition switch is turned on AND more than half if the ignition history is valid.
// requiring both conditions prevents spurious noise readings from starting up the injection.
addr == 16'h46d ? 16'h0022 :  // <0035> a = power_duty
addr == 16'h46e ? 16'h0680 :  // <0036> b = $ign_switch_off_mask
addr == 16'h46f ? 16'he403 :  // <0037> bn and0z :stay
addr == 16'h470 ? 16'h047e :  // <0037> "
addr == 16'h471 ? 16'h6600 :  // <0038> ram a = $ram_ign_bad_samples // av_ad_hi = 0
addr == 16'h472 ? 16'h6a82 :  // <0038> ram a = $ram_ign_bad_samples // av_ad_lo = 130
addr == 16'h473 ? 16'h0017 :  // <0038> ram a = $ram_ign_bad_samples // a = av_write_data // start read cycle
addr == 16'h474 ? 16'h0018 :  // <0038> ram a = $ram_ign_bad_samples // a = av_read_data // finish read cycle
addr == 16'h475 ? 16'h0608 :  // <0039> b = ($ign_history_len / 2)
addr == 16'h476 ? 16'he006 :  // <0040> br gt :stay
addr == 16'h477 ? 16'h047e :  // <0040> "
addr == 16'h478 ? 16'hfba0 :  // <0041> callx  destroy_plan_stop
addr == 16'h479 ? 16'h0467 :  // <0041> "
addr == 16'h47a ? 16'hfc00 :  // <0041> "
addr == 16'h47b ? 16'hfba0 :  // <0042> callx  init_plan_crank
addr == 16'h47c ? 16'h0482 :  // <0042> "
addr == 16'h47d ? 16'hfc00 :  // <0042> "
// :stay // = 0x047e

addr == 16'h47e ? 16'hf80c :  // <0045> pop rtna // func leave_stop
addr == 16'h47f ? 16'hfc00 :  // <0045> swapra = nop



// escalating puff length by 1500 us per puff while cranking slowly at e.g. 80 RPM
// on a frozen winter morning will ramp up from 10000 to 20000 us length in about 5 seconds.

// :plan_name_crank // = 0x0480
// "CR\x0"
addr == 16'h480 ? 16'h5243 :  // <0011> RC
addr == 16'h481 ? 16'h0000 :  // <0011>   

// ######## func init_plan_crank // = 0x0482
addr == 16'h482 ? 16'h303e :  // <0033> push rtna // func init_plan_crank

// set up the crank plan.
addr == 16'h483 ? 16'h6600 :  // <0015> ram $ram_puff_count = 0 // av_ad_hi = 0
addr == 16'h484 ? 16'h6a94 :  // <0015> ram $ram_puff_count = 0 // av_ad_lo = 148
addr == 16'h485 ? 16'h5e00 :  // <0015> ram $ram_puff_count = 0 // av_write_data = 0
// set noise filter to measure RPM between 50 and 8000 to indicate running.
addr == 16'h486 ? 16'h6600 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_ad_hi = 0
addr == 16'h487 ? 16'h6a84 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_ad_lo = 132
addr == 16'h488 ? 16'h5e57 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_write_data = 87
addr == 16'h489 ? 16'h6600 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h48a ? 16'h6a86 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 134
addr == 16'h48b ? 16'h5fa0 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h48c ? 16'h36b0 :  // <0018> "
addr == 16'h48d ? 16'h93a0 :  // <0019> ign_timeout_len_jf = ([rpm_to_jf 50])
addr == 16'h48e ? 16'h36b0 :  // <0019> "
// normally puff length is not touched by an init func.
// this one does it because it's the beginning of a crank cycle, and puff length
// should be enabled for the first puff.  otherwise the first puff would be missed.
addr == 16'h48f ? 16'h6600 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_hi = 0
addr == 16'h490 ? 16'h6a92 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_lo = 146
addr == 16'h491 ? 16'h5fa0 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_write_data = 12000
addr == 16'h492 ? 16'h2ee0 :  // <0023> "
addr == 16'h493 ? 16'h97a0 :  // <0024> puff_len_us = $crank_min_puff_len_us
addr == 16'h494 ? 16'h2ee0 :  // <0024> "
// clear ignition history again to eliminate samples where the motor kept spinning after switching from plan_run to plan_stop.
addr == 16'h495 ? 16'hfba0 :  // <0026> callx  clear_ign_history
addr == 16'h496 ? 16'h088f :  // <0026> "
addr == 16'h497 ? 16'hfc00 :  // <0026> "

// memorize state.
addr == 16'h498 ? 16'h6600 :  // <0029> ram $ram_plan_name = :plan_name_crank // av_ad_hi = 0
addr == 16'h499 ? 16'h6a8a :  // <0029> ram $ram_plan_name = :plan_name_crank // av_ad_lo = 138
addr == 16'h49a ? 16'h5fa0 :  // <0029> ram $ram_plan_name = :plan_name_crank // av_write_data = :plan_name_crank
addr == 16'h49b ? 16'h0480 :  // <0029> "
addr == 16'h49c ? 16'h6600 :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_ad_hi = 0
addr == 16'h49d ? 16'h6a8c :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_ad_lo = 140
addr == 16'h49e ? 16'h5fa0 :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_write_data = :puff_len_crank
addr == 16'h49f ? 16'h04ab :  // <0030> "
addr == 16'h4a0 ? 16'h6600 :  // <0031> ram $ram_transition_func = :leave_crank // av_ad_hi = 0
addr == 16'h4a1 ? 16'h6a8e :  // <0031> ram $ram_transition_func = :leave_crank // av_ad_lo = 142
addr == 16'h4a2 ? 16'h5fa0 :  // <0031> ram $ram_transition_func = :leave_crank // av_write_data = :leave_crank
addr == 16'h4a3 ? 16'h04c9 :  // <0031> "
addr == 16'h4a4 ? 16'h6600 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_hi = 0
addr == 16'h4a5 ? 16'h6a90 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_lo = 144
addr == 16'h4a6 ? 16'h5fa0 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_write_data = :destroy_plan_crank
addr == 16'h4a7 ? 16'h04aa :  // <0032> "

addr == 16'h4a8 ? 16'hf80c :  // <0034> pop rtna // func init_plan_crank
addr == 16'h4a9 ? 16'hfc00 :  // <0034> swapra = nop

// ######## func destroy_plan_crank // = 0x04aa


addr == 16'h4aa ? 16'hfc00 :  // <0037> swapra = nop

// ######## func puff_len_crank // = 0x04ab
addr == 16'h4ab ? 16'h303e :  // <0054> push rtna // func puff_len_crank

addr == 16'h4ac ? 16'h6600 :  // <0039> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h4ad ? 16'h6a94 :  // <0039> ram a = $ram_puff_count // av_ad_lo = 148
addr == 16'h4ae ? 16'h0017 :  // <0039> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h4af ? 16'h0018 :  // <0039> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h4b0 ? 16'h0602 :  // <0040> b = $crank_max_puffs
addr == 16'h4b1 ? 16'he006 :  // <0041> br gt :puff_limit
addr == 16'h4b2 ? 16'h04c0 :  // <0041> "
// linear escalation from min to max puff length, at a slope of crank_incr_us_per_puff.
addr == 16'h4b3 ? 16'h07a0 :  // <0043> b = $crank_incr_us_per_puff
addr == 16'h4b4 ? 16'h0bb8 :  // <0043> "
addr == 16'h4b5 ? 16'hfba0 :  // <0044> call :multiply
addr == 16'h4b6 ? 16'h0180 :  // <0044> "
addr == 16'h4b7 ? 16'hfc00 :  // <0044> "
addr == 16'h4b8 ? 16'h07a0 :  // <0045> b = $crank_min_puff_len_us
addr == 16'h4b9 ? 16'h2ee0 :  // <0045> "
addr == 16'h4ba ? 16'h6600 :  // <0046> ram $ram_next_puff_len_us = a+b // av_ad_hi = 0
addr == 16'h4bb ? 16'h6a92 :  // <0046> ram $ram_next_puff_len_us = a+b // av_ad_lo = 146
addr == 16'h4bc ? 16'hc800 :  // <0046> ram $ram_next_puff_len_us = a+b // av_write_data = a+b
addr == 16'h4bd ? 16'h5f00 :  // <0046> "
addr == 16'h4be ? 16'he00f :  // <0047> jmp :done
addr == 16'h4bf ? 16'h04c7 :  // <0047> "
// :puff_limit // = 0x04c0
// prevent the puff counter from going higher & eventually rolling over.
addr == 16'h4c0 ? 16'h6600 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_ad_hi = 0
addr == 16'h4c1 ? 16'h6a94 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_ad_lo = 148
addr == 16'h4c2 ? 16'h5e02 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_write_data = 2
// accept max puff len.
addr == 16'h4c3 ? 16'h6600 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_hi = 0
addr == 16'h4c4 ? 16'h6a92 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_lo = 146
addr == 16'h4c5 ? 16'h5fa0 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_write_data = 20000
addr == 16'h4c6 ? 16'h4e20 :  // <0052> "
// :done // = 0x04c7

addr == 16'h4c7 ? 16'hf80c :  // <0055> pop rtna // func puff_len_crank
addr == 16'h4c8 ? 16'hfc00 :  // <0055> swapra = nop

// ######## func leave_crank // = 0x04c9
addr == 16'h4c9 ? 16'h303e :  // <0071> push rtna // func leave_crank

addr == 16'h4ca ? 16'hfba0 :  // <0057> callx  check_engine_stop  a
addr == 16'h4cb ? 16'h0cc6 :  // <0057> "
addr == 16'h4cc ? 16'hfc00 :  // <0057> "
addr == 16'h4cd ? 16'h0008 :  // <0057> a = pa
addr == 16'h4ce ? 16'he400 :  // <0058> bn az :done
addr == 16'h4cf ? 16'h04e4 :  // <0058> "

// transition to warmup if RPM exceeds crank_success_rpm.
addr == 16'h4d0 ? 16'h6600 :  // <0061> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h4d1 ? 16'h6a80 :  // <0061> ram a = $ram_rpm_valid // av_ad_lo = 128
addr == 16'h4d2 ? 16'h0017 :  // <0061> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h4d3 ? 16'h0018 :  // <0061> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle
addr == 16'h4d4 ? 16'he000 :  // <0062> br az :stay
addr == 16'h4d5 ? 16'h04e4 :  // <0062> "
addr == 16'h4d6 ? 16'h6600 :  // <0063> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h4d7 ? 16'h6a7e :  // <0063> ram a = $ram_avg_rpm // av_ad_lo = 126
addr == 16'h4d8 ? 16'h0017 :  // <0063> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h4d9 ? 16'h0018 :  // <0063> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle
addr == 16'h4da ? 16'h07a0 :  // <0064> b = $crank_success_rpm
addr == 16'h4db ? 16'h0320 :  // <0064> "
addr == 16'h4dc ? 16'he005 :  // <0065> br lt :stay
addr == 16'h4dd ? 16'h04e4 :  // <0065> "
addr == 16'h4de ? 16'hfba0 :  // <0066> callx  destroy_plan_crank
addr == 16'h4df ? 16'h04aa :  // <0066> "
addr == 16'h4e0 ? 16'hfc00 :  // <0066> "
addr == 16'h4e1 ? 16'hfba0 :  // <0067> callx  init_plan_run
addr == 16'h4e2 ? 16'h052d :  // <0067> "
addr == 16'h4e3 ? 16'hfc00 :  // <0067> "
// :stay // = 0x04e4

// :done // = 0x04e4

addr == 16'h4e4 ? 16'hf80c :  // <0072> pop rtna // func leave_crank
addr == 16'h4e5 ? 16'hfc00 :  // <0072> swapra = nop


// :plan_name_run // = 0x04e6
// "RN\x0"
addr == 16'h4e6 ? 16'h4e52 :  // <0002> NR
addr == 16'h4e7 ? 16'h0000 :  // <0002>   


// 0.5 to 2.0 trim factor equivalent.









// ######## func trim_lean_cmd // = 0x04e8

addr == 16'h4e8 ? 16'h6600 :  // <0037> ram a = $ram_run_manual_trim // av_ad_hi = 0
addr == 16'h4e9 ? 16'h6aac :  // <0037> ram a = $ram_run_manual_trim // av_ad_lo = 172
addr == 16'h4ea ? 16'h0017 :  // <0037> ram a = $ram_run_manual_trim // a = av_write_data // start read cycle
addr == 16'h4eb ? 16'h0018 :  // <0037> ram a = $ram_run_manual_trim // a = av_read_data // finish read cycle

addr == 16'h4ec ? 16'h0000 :  // <0042> a = a
addr == 16'h4ed ? 16'h0600 :  // <0042> b = 0

addr == 16'h4ee ? 16'he407 :  // <0038> bn eq :else_1262
addr == 16'h4ef ? 16'h04f2 :  // <0038> "


addr == 16'h4f0 ? 16'he00f :  // <0040> jmp :end_1262
addr == 16'h4f1 ? 16'h04f8 :  // <0040> "

addr == 16'h4f2 ? 16'h07a0 :  // <0041> b = ([negate $run_manual_trim_step])
addr == 16'h4f3 ? 16'hff40 :  // <0041> "
addr == 16'h4f4 ? 16'h6600 :  // <0042> ram $ram_run_manual_trim = a+b // av_ad_hi = 0
addr == 16'h4f5 ? 16'h6aac :  // <0042> ram $ram_run_manual_trim = a+b // av_ad_lo = 172
addr == 16'h4f6 ? 16'hc800 :  // <0042> ram $ram_run_manual_trim = a+b // av_write_data = a+b
addr == 16'h4f7 ? 16'h5f00 :  // <0042> "


addr == 16'h4f8 ? 16'hfc00 :  // <0044> swapra = nop

// ######## func trim_rich_cmd // = 0x04f9

addr == 16'h4f9 ? 16'h6600 :  // <0046> ram a = $ram_run_manual_trim // av_ad_hi = 0
addr == 16'h4fa ? 16'h6aac :  // <0046> ram a = $ram_run_manual_trim // av_ad_lo = 172
addr == 16'h4fb ? 16'h0017 :  // <0046> ram a = $ram_run_manual_trim // a = av_write_data // start read cycle
addr == 16'h4fc ? 16'h0018 :  // <0046> ram a = $ram_run_manual_trim // a = av_read_data // finish read cycle

addr == 16'h4fd ? 16'h0000 :  // <0051> a = a
addr == 16'h4fe ? 16'h07a0 :  // <0051> b = 800
addr == 16'h4ff ? 16'h0320 :  // <0051> "

addr == 16'h500 ? 16'he406 :  // <0047> bn gt :else_1280
addr == 16'h501 ? 16'h0504 :  // <0047> "


addr == 16'h502 ? 16'he00f :  // <0049> jmp :end_1280
addr == 16'h503 ? 16'h0509 :  // <0049> "

addr == 16'h504 ? 16'h06c0 :  // <0050> b = $run_manual_trim_step
addr == 16'h505 ? 16'h6600 :  // <0051> ram $ram_run_manual_trim = a+b // av_ad_hi = 0
addr == 16'h506 ? 16'h6aac :  // <0051> ram $ram_run_manual_trim = a+b // av_ad_lo = 172
addr == 16'h507 ? 16'hc800 :  // <0051> ram $ram_run_manual_trim = a+b // av_write_data = a+b
addr == 16'h508 ? 16'h5f00 :  // <0051> "


addr == 16'h509 ? 16'hfc00 :  // <0053> swapra = nop

// ######## func trim_2lean_cmd // = 0x050a

addr == 16'h50a ? 16'h6600 :  // <0055> ram a = $ram_run_manual_trim // av_ad_hi = 0
addr == 16'h50b ? 16'h6aac :  // <0055> ram a = $ram_run_manual_trim // av_ad_lo = 172
addr == 16'h50c ? 16'h0017 :  // <0055> ram a = $ram_run_manual_trim // a = av_write_data // start read cycle
addr == 16'h50d ? 16'h0018 :  // <0055> ram a = $ram_run_manual_trim // a = av_read_data // finish read cycle

addr == 16'h50e ? 16'h0000 :  // <0060> a = a
addr == 16'h50f ? 16'h0600 :  // <0060> b = 0

addr == 16'h510 ? 16'he407 :  // <0056> bn eq :else_1296
addr == 16'h511 ? 16'h0514 :  // <0056> "


addr == 16'h512 ? 16'he00f :  // <0058> jmp :end_1296
addr == 16'h513 ? 16'h051a :  // <0058> "

addr == 16'h514 ? 16'h07a0 :  // <0059> b = ([negate [expr $run_manual_trim_step * 8]])
addr == 16'h515 ? 16'hfa00 :  // <0059> "
addr == 16'h516 ? 16'h6600 :  // <0060> ram $ram_run_manual_trim = a+b // av_ad_hi = 0
addr == 16'h517 ? 16'h6aac :  // <0060> ram $ram_run_manual_trim = a+b // av_ad_lo = 172
addr == 16'h518 ? 16'hc800 :  // <0060> ram $ram_run_manual_trim = a+b // av_write_data = a+b
addr == 16'h519 ? 16'h5f00 :  // <0060> "


addr == 16'h51a ? 16'hfc00 :  // <0062> swapra = nop

// ######## func trim_2rich_cmd // = 0x051b

addr == 16'h51b ? 16'h6600 :  // <0064> ram a = $ram_run_manual_trim // av_ad_hi = 0
addr == 16'h51c ? 16'h6aac :  // <0064> ram a = $ram_run_manual_trim // av_ad_lo = 172
addr == 16'h51d ? 16'h0017 :  // <0064> ram a = $ram_run_manual_trim // a = av_write_data // start read cycle
addr == 16'h51e ? 16'h0018 :  // <0064> ram a = $ram_run_manual_trim // a = av_read_data // finish read cycle

addr == 16'h51f ? 16'h0000 :  // <0069> a = a
addr == 16'h520 ? 16'h07a0 :  // <0069> b = 800
addr == 16'h521 ? 16'h0320 :  // <0069> "

addr == 16'h522 ? 16'he406 :  // <0065> bn gt :else_1314
addr == 16'h523 ? 16'h0526 :  // <0065> "


addr == 16'h524 ? 16'he00f :  // <0067> jmp :end_1314
addr == 16'h525 ? 16'h052c :  // <0067> "

addr == 16'h526 ? 16'h07a0 :  // <0068> b = ($run_manual_trim_step * 8)
addr == 16'h527 ? 16'h0600 :  // <0068> "
addr == 16'h528 ? 16'h6600 :  // <0069> ram $ram_run_manual_trim = a+b // av_ad_hi = 0
addr == 16'h529 ? 16'h6aac :  // <0069> ram $ram_run_manual_trim = a+b // av_ad_lo = 172
addr == 16'h52a ? 16'hc800 :  // <0069> ram $ram_run_manual_trim = a+b // av_write_data = a+b
addr == 16'h52b ? 16'h5f00 :  // <0069> "


addr == 16'h52c ? 16'hfc00 :  // <0071> swapra = nop

// ######## func init_plan_run // = 0x052d

// set up the run plan.
// this code is repeated each crank cycle, so don't depend on RAM already being 0.
addr == 16'h52d ? 16'h6600 :  // <0075> ram $ram_maf_valid = 0 // av_ad_hi = 0
addr == 16'h52e ? 16'h6a98 :  // <0075> ram $ram_maf_valid = 0 // av_ad_lo = 152
addr == 16'h52f ? 16'h5e00 :  // <0075> ram $ram_maf_valid = 0 // av_write_data = 0
addr == 16'h530 ? 16'h6600 :  // <0076> ram $ram_afrc_maf_row_idx = 0 // av_ad_hi = 0
addr == 16'h531 ? 16'h6a9e :  // <0076> ram $ram_afrc_maf_row_idx = 0 // av_ad_lo = 158
addr == 16'h532 ? 16'h5e00 :  // <0076> ram $ram_afrc_maf_row_idx = 0 // av_write_data = 0
addr == 16'h533 ? 16'h6600 :  // <0077> ram $ram_afrc_rpm_col_idx = 0 // av_ad_hi = 0
addr == 16'h534 ? 16'h6aa0 :  // <0077> ram $ram_afrc_rpm_col_idx = 0 // av_ad_lo = 160
addr == 16'h535 ? 16'h5e00 :  // <0077> ram $ram_afrc_rpm_col_idx = 0 // av_write_data = 0
addr == 16'h536 ? 16'h6600 :  // <0078> ram $ram_block_temp_map_idx = 0 // av_ad_hi = 0
addr == 16'h537 ? 16'h6aa2 :  // <0078> ram $ram_block_temp_map_idx = 0 // av_ad_lo = 162
addr == 16'h538 ? 16'h5e00 :  // <0078> ram $ram_block_temp_map_idx = 0 // av_write_data = 0
addr == 16'h539 ? 16'h6600 :  // <0079> ram $ram_block_temp_trim = $trim_unity // av_ad_hi = 0
addr == 16'h53a ? 16'h6aa4 :  // <0079> ram $ram_block_temp_trim = $trim_unity // av_ad_lo = 164
addr == 16'h53b ? 16'h5fa0 :  // <0079> ram $ram_block_temp_trim = $trim_unity // av_write_data = 8192
addr == 16'h53c ? 16'h2000 :  // <0079> "
addr == 16'h53d ? 16'h6600 :  // <0080> ram $ram_afterstart_map_idx = 0 // av_ad_hi = 0
addr == 16'h53e ? 16'h6aa6 :  // <0080> ram $ram_afterstart_map_idx = 0 // av_ad_lo = 166
addr == 16'h53f ? 16'h5e00 :  // <0080> ram $ram_afterstart_map_idx = 0 // av_write_data = 0
addr == 16'h540 ? 16'h6600 :  // <0081> ram $ram_afterstart_trim = $trim_unity // av_ad_hi = 0
addr == 16'h541 ? 16'h6aa8 :  // <0081> ram $ram_afterstart_trim = $trim_unity // av_ad_lo = 168
addr == 16'h542 ? 16'h5fa0 :  // <0081> ram $ram_afterstart_trim = $trim_unity // av_write_data = 8192
addr == 16'h543 ? 16'h2000 :  // <0081> "
addr == 16'h544 ? 16'h6600 :  // <0082> ram $ram_o2_trim = $trim_unity // av_ad_hi = 0
addr == 16'h545 ? 16'h6aaa :  // <0082> ram $ram_o2_trim = $trim_unity // av_ad_lo = 170
addr == 16'h546 ? 16'h5fa0 :  // <0082> ram $ram_o2_trim = $trim_unity // av_write_data = 8192
addr == 16'h547 ? 16'h2000 :  // <0082> "
addr == 16'h548 ? 16'h6600 :  // <0083> ram $ram_puff_count = 0 // av_ad_hi = 0
addr == 16'h549 ? 16'h6a94 :  // <0083> ram $ram_puff_count = 0 // av_ad_lo = 148
addr == 16'h54a ? 16'h5e00 :  // <0083> ram $ram_puff_count = 0 // av_write_data = 0
addr == 16'h54b ? 16'h6600 :  // <0084> ram $ram_run_manual_trim = $trim_unity // av_ad_hi = 0
addr == 16'h54c ? 16'h6aac :  // <0084> ram $ram_run_manual_trim = $trim_unity // av_ad_lo = 172
addr == 16'h54d ? 16'h5fa0 :  // <0084> ram $ram_run_manual_trim = $trim_unity // av_write_data = 8192
addr == 16'h54e ? 16'h2000 :  // <0084> "
addr == 16'h54f ? 16'h6600 :  // <0085> ram $ram_o2_trim = $trim_unity // av_ad_hi = 0
addr == 16'h550 ? 16'h6aaa :  // <0085> ram $ram_o2_trim = $trim_unity // av_ad_lo = 170
addr == 16'h551 ? 16'h5fa0 :  // <0085> ram $ram_o2_trim = $trim_unity // av_write_data = 8192
addr == 16'h552 ? 16'h2000 :  // <0085> "
addr == 16'h553 ? 16'h6600 :  // <0086> ram $ram_total_trim = 0 // av_ad_hi = 0
addr == 16'h554 ? 16'h6aae :  // <0086> ram $ram_total_trim = 0 // av_ad_lo = 174
addr == 16'h555 ? 16'h5e00 :  // <0086> ram $ram_total_trim = 0 // av_write_data = 0

// memorize state.
addr == 16'h556 ? 16'h6600 :  // <0089> ram $ram_plan_name = :plan_name_run // av_ad_hi = 0
addr == 16'h557 ? 16'h6a8a :  // <0089> ram $ram_plan_name = :plan_name_run // av_ad_lo = 138
addr == 16'h558 ? 16'h5fa0 :  // <0089> ram $ram_plan_name = :plan_name_run // av_write_data = :plan_name_run
addr == 16'h559 ? 16'h04e6 :  // <0089> "
addr == 16'h55a ? 16'h6600 :  // <0090> ram $ram_puff_len_func = :puff_len_run // av_ad_hi = 0
addr == 16'h55b ? 16'h6a8c :  // <0090> ram $ram_puff_len_func = :puff_len_run // av_ad_lo = 140
addr == 16'h55c ? 16'h5fa0 :  // <0090> ram $ram_puff_len_func = :puff_len_run // av_write_data = :puff_len_run
addr == 16'h55d ? 16'h05ac :  // <0090> "
addr == 16'h55e ? 16'h6600 :  // <0091> ram $ram_transition_func = :leave_run // av_ad_hi = 0
addr == 16'h55f ? 16'h6a8e :  // <0091> ram $ram_transition_func = :leave_run // av_ad_lo = 142
addr == 16'h560 ? 16'h5fa0 :  // <0091> ram $ram_transition_func = :leave_run // av_write_data = :leave_run
addr == 16'h561 ? 16'h0628 :  // <0091> "
addr == 16'h562 ? 16'h6600 :  // <0092> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_hi = 0
addr == 16'h563 ? 16'h6a90 :  // <0092> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_lo = 144
addr == 16'h564 ? 16'h5fa0 :  // <0092> ram $ram_destroy_plan_func = :destroy_plan_run // av_write_data = :destroy_plan_run
addr == 16'h565 ? 16'h0567 :  // <0092> "

addr == 16'h566 ? 16'hfc00 :  // <0094> swapra = nop

// ######## func destroy_plan_run // = 0x0567


addr == 16'h567 ? 16'hfc00 :  // <0097> swapra = nop

// ######## func combine_trim // = 0x0568
addr == 16'h568 ? 16'h3002 :  // <0138> push i // func combine_trim
addr == 16'h569 ? 16'h3003 :  // <0138> push j // "
addr == 16'h56a ? 16'h3004 :  // <0138> push x // "

// combine the given increment with the given total trim factor, returning
// the new total trim.  this process is complicated by the decision to keep the
// 0.5 offset in the integer representation scheme.  that's done in case i ever
// have to calculate puff without the aid of a hardware multiplier.
// the process is to add the offset to each argument, multiply them,
// undo the offsets, and saturate to prevent excess accumulation.
addr == 16'h56b ? 16'h0008 :  // <0105> a = total
addr == 16'h56c ? 16'h07a0 :  // <0106> b = $trim_unity
addr == 16'h56d ? 16'h2000 :  // <0106> "
addr == 16'h56e ? 16'hc800 :  // <0107> a = a+b
addr == 16'h56f ? 16'h0300 :  // <0107> "
addr == 16'h570 ? 16'h0809 :  // <0108> i = increment
addr == 16'h571 ? 16'h0fa0 :  // <0109> j = $trim_unity
addr == 16'h572 ? 16'h2000 :  // <0109> "
addr == 16'h573 ? 16'hc800 :  // <0110> b = i+j
addr == 16'h574 ? 16'h0710 :  // <0110> "
addr == 16'h575 ? 16'hc800 :  // <0111> nop
addr == 16'h576 ? 16'hc800 :  // <0112> nop
addr == 16'h577 ? 16'hc800 :  // <0113> nop
addr == 16'h578 ? 16'hc800 :  // <0114> nop
// total = product / 16384 = product >> 14
// this cancels the two offsets that were added prior to the mult.
addr == 16'h579 ? 16'h1011 :  // <0117> x = product_hi
addr == 16'h57a ? 16'h0010 :  // <0118> a = product_lo
addr == 16'h57b ? 16'h0353 :  // <0119> a = a>>4
addr == 16'h57c ? 16'h0353 :  // <0120> a = a>>4
addr == 16'h57d ? 16'h0353 :  // <0121> a = a>>4
addr == 16'h57e ? 16'h0350 :  // <0122> a = a>>1
addr == 16'h57f ? 16'h2350 :  // <0123> out_total = a>>1
addr == 16'h580 ? 16'h0004 :  // <0124> a = x
addr == 16'h581 ? 16'h07a0 :  // <0125> b = 0x3fff
addr == 16'h582 ? 16'h3fff :  // <0125> "
addr == 16'h583 ? 16'hc800 :  // <0126> a = and
addr == 16'h584 ? 16'h0330 :  // <0126> "
addr == 16'h585 ? 16'h0351 :  // <0127> a = a<<1
addr == 16'h586 ? 16'h0351 :  // <0128> a = a<<1
addr == 16'h587 ? 16'h0408 :  // <0129> b = out_total
addr == 16'h588 ? 16'hc800 :  // <0130> a = or
addr == 16'h589 ? 16'h0334 :  // <0130> "
// subtract the unity offset to get back to the correct integer representation.
addr == 16'h58a ? 16'h07a0 :  // <0132> b = ([negate $trim_unity])
addr == 16'h58b ? 16'he000 :  // <0132> "
addr == 16'h58c ? 16'hc800 :  // <0133> out_total = a+b
addr == 16'h58d ? 16'h2300 :  // <0133> "
// clamp.

addr == 16'h58e ? 16'h0008 :  // <0137> a = out_total
addr == 16'h58f ? 16'h07a0 :  // <0137> b = 24576
addr == 16'h590 ? 16'h6000 :  // <0137> "

addr == 16'h591 ? 16'he406 :  // <0135> bn gt :else_1425
addr == 16'h592 ? 16'h0595 :  // <0135> "

addr == 16'h593 ? 16'h23a0 :  // <0136> out_total = $trim_double
addr == 16'h594 ? 16'h6000 :  // <0136> "


addr == 16'h595 ? 16'h100c :  // <0139> pop x // func combine_trim
addr == 16'h596 ? 16'h0c0c :  // <0139> pop j // "
addr == 16'h597 ? 16'h080c :  // <0139> pop i // "
addr == 16'h598 ? 16'hfc00 :  // <0139> swapra = nop

// ######## func fetch_afrc // = 0x0599

// look up Air/Fuel Ratio Correction in AFRC map.
// index rows by MAF.
addr == 16'h599 ? 16'h0008 :  // <0143> a = maf_row_idx
addr == 16'h59a ? 16'h0610 :  // <0144> b = $afrc_rpm_cols
addr == 16'h59b ? 16'hc800 :  // <0145> nop
addr == 16'h59c ? 16'hc800 :  // <0146> nop
addr == 16'h59d ? 16'hc800 :  // <0147> nop
addr == 16'h59e ? 16'hc800 :  // <0148> nop
addr == 16'h59f ? 16'h0410 :  // <0149> b = product_lo
// index columns by RPM.
addr == 16'h5a0 ? 16'h0009 :  // <0151> a = rpm_col_idx
addr == 16'h5a1 ? 16'hc800 :  // <0152> a = a+b
addr == 16'h5a2 ? 16'h0300 :  // <0152> "

addr == 16'h5a3 ? 16'h0351 :  // <0152> a = a<<1
addr == 16'h5a4 ? 16'h0600 :  // <0152> b = 0
addr == 16'h5a5 ? 16'h67a0 :  // <0152> av_ad_hi = 256
addr == 16'h5a6 ? 16'h0100 :  // <0152> "
addr == 16'h5a7 ? 16'h6b00 :  // <0152> av_ad_lo = ad0
addr == 16'h5a8 ? 16'h0417 :  // <0152> b = av_begin_read

addr == 16'h5a9 ? 16'h2018 :  // <0153> afrc = av_read_data
addr == 16'h5aa ? 16'hfc00 :  // <0152> swapra = nop

addr == 16'h5ab ? 16'hfc00 :  // <0155> swapra = nop

// ######## func puff_len_run // = 0x05ac
addr == 16'h5ac ? 16'h3004 :  // <0238> push x // func puff_len_run
addr == 16'h5ad ? 16'h3007 :  // <0238> push gb // "
addr == 16'h5ae ? 16'h303e :  // <0238> push rtna // "

addr == 16'h5af ? 16'h6600 :  // <0157> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h5b0 ? 16'h6a80 :  // <0157> ram a = $ram_rpm_valid // av_ad_lo = 128
addr == 16'h5b1 ? 16'h0017 :  // <0157> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h5b2 ? 16'h0018 :  // <0157> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle
addr == 16'h5b3 ? 16'he000 :  // <0158> br az :abort
addr == 16'h5b4 ? 16'h0624 :  // <0158> "
addr == 16'h5b5 ? 16'h6600 :  // <0159> ram a = $ram_maf_valid // av_ad_hi = 0
addr == 16'h5b6 ? 16'h6a98 :  // <0159> ram a = $ram_maf_valid // av_ad_lo = 152
addr == 16'h5b7 ? 16'h0017 :  // <0159> ram a = $ram_maf_valid // a = av_write_data // start read cycle
addr == 16'h5b8 ? 16'h0018 :  // <0159> ram a = $ram_maf_valid // a = av_read_data // finish read cycle
addr == 16'h5b9 ? 16'he000 :  // <0160> br az :abort
addr == 16'h5ba ? 16'h0624 :  // <0160> "

// look up Air/Fuel Ratio Correction in AFRC map.
addr == 16'h5bb ? 16'h6600 :  // <0163> ram pa = $ram_afrc_maf_row_idx // av_ad_hi = 0
addr == 16'h5bc ? 16'h6a9e :  // <0163> ram pa = $ram_afrc_maf_row_idx // av_ad_lo = 158
addr == 16'h5bd ? 16'h2017 :  // <0163> ram pa = $ram_afrc_maf_row_idx // pa = av_write_data // start read cycle
addr == 16'h5be ? 16'h2018 :  // <0163> ram pa = $ram_afrc_maf_row_idx // pa = av_read_data // finish read cycle
addr == 16'h5bf ? 16'h6600 :  // <0164> ram pb = $ram_afrc_rpm_col_idx // av_ad_hi = 0
addr == 16'h5c0 ? 16'h6aa0 :  // <0164> ram pb = $ram_afrc_rpm_col_idx // av_ad_lo = 160
addr == 16'h5c1 ? 16'h2417 :  // <0164> ram pb = $ram_afrc_rpm_col_idx // pb = av_write_data // start read cycle
addr == 16'h5c2 ? 16'h2418 :  // <0164> ram pb = $ram_afrc_rpm_col_idx // pb = av_read_data // finish read cycle
addr == 16'h5c3 ? 16'hfba0 :  // <0165> callx fetch_afrc pa pb ga
addr == 16'h5c4 ? 16'h0599 :  // <0165> "
addr == 16'h5c5 ? 16'hfc00 :  // <0165> "
addr == 16'h5c6 ? 16'h1808 :  // <0165> ga = pa
// now ga = total trim factor as integer.

// apply block temperature trim factor.
addr == 16'h5c7 ? 16'h6600 :  // <0169> ram b = $ram_block_temp_trim // av_ad_hi = 0
addr == 16'h5c8 ? 16'h6aa4 :  // <0169> ram b = $ram_block_temp_trim // av_ad_lo = 164
addr == 16'h5c9 ? 16'h0417 :  // <0169> ram b = $ram_block_temp_trim // b = av_write_data // start read cycle
addr == 16'h5ca ? 16'h0418 :  // <0169> ram b = $ram_block_temp_trim // b = av_read_data // finish read cycle
addr == 16'h5cb ? 16'h2006 :  // <0170> pa = ga
addr == 16'h5cc ? 16'h2401 :  // <0170> pb = b
addr == 16'h5cd ? 16'hfba0 :  // <0170> callx combine_trim ga b ga
addr == 16'h5ce ? 16'h0568 :  // <0170> "
addr == 16'h5cf ? 16'hfc00 :  // <0170> "
addr == 16'h5d0 ? 16'h1808 :  // <0170> ga = pa

// apply afterstart trim factor.
addr == 16'h5d1 ? 16'hfba0 :  // <0173> callx interpret_puff_count
addr == 16'h5d2 ? 16'h0661 :  // <0173> "
addr == 16'h5d3 ? 16'hfc00 :  // <0173> "
addr == 16'h5d4 ? 16'h6600 :  // <0174> ram b = $ram_afterstart_trim // av_ad_hi = 0
addr == 16'h5d5 ? 16'h6aa8 :  // <0174> ram b = $ram_afterstart_trim // av_ad_lo = 168
addr == 16'h5d6 ? 16'h0417 :  // <0174> ram b = $ram_afterstart_trim // b = av_write_data // start read cycle
addr == 16'h5d7 ? 16'h0418 :  // <0174> ram b = $ram_afterstart_trim // b = av_read_data // finish read cycle
addr == 16'h5d8 ? 16'h2006 :  // <0175> pa = ga
addr == 16'h5d9 ? 16'h2401 :  // <0175> pb = b
addr == 16'h5da ? 16'hfba0 :  // <0175> callx combine_trim ga b ga
addr == 16'h5db ? 16'h0568 :  // <0175> "
addr == 16'h5dc ? 16'hfc00 :  // <0175> "
addr == 16'h5dd ? 16'h1808 :  // <0175> ga = pa

// apply stoich learning trim factor.
addr == 16'h5de ? 16'h6600 :  // <0178> ram b = $ram_o2_trim // av_ad_hi = 0
addr == 16'h5df ? 16'h6aaa :  // <0178> ram b = $ram_o2_trim // av_ad_lo = 170
addr == 16'h5e0 ? 16'h0417 :  // <0178> ram b = $ram_o2_trim // b = av_write_data // start read cycle
addr == 16'h5e1 ? 16'h0418 :  // <0178> ram b = $ram_o2_trim // b = av_read_data // finish read cycle
addr == 16'h5e2 ? 16'h2006 :  // <0179> pa = ga
addr == 16'h5e3 ? 16'h2401 :  // <0179> pb = b
addr == 16'h5e4 ? 16'hfba0 :  // <0179> callx combine_trim ga b ga
addr == 16'h5e5 ? 16'h0568 :  // <0179> "
addr == 16'h5e6 ? 16'hfc00 :  // <0179> "
addr == 16'h5e7 ? 16'h1808 :  // <0179> ga = pa

// apply manual trim factor.
addr == 16'h5e8 ? 16'h6600 :  // <0182> ram b = $ram_run_manual_trim // av_ad_hi = 0
addr == 16'h5e9 ? 16'h6aac :  // <0182> ram b = $ram_run_manual_trim // av_ad_lo = 172
addr == 16'h5ea ? 16'h0417 :  // <0182> ram b = $ram_run_manual_trim // b = av_write_data // start read cycle
addr == 16'h5eb ? 16'h0418 :  // <0182> ram b = $ram_run_manual_trim // b = av_read_data // finish read cycle
addr == 16'h5ec ? 16'h2006 :  // <0183> pa = ga
addr == 16'h5ed ? 16'h2401 :  // <0183> pb = b
addr == 16'h5ee ? 16'hfba0 :  // <0183> callx combine_trim ga b ga
addr == 16'h5ef ? 16'h0568 :  // <0183> "
addr == 16'h5f0 ? 16'hfc00 :  // <0183> "
addr == 16'h5f1 ? 16'h1808 :  // <0183> ga = pa

// final multiplication for puff length.
// (MAF linear flow) * (stoich ratio constant) * (total trim as floating point) = (puff length jf).
// here the total trim float will have to be represented as a fraction (num/denom).
// stoich ratio constant (8) (really the conversion factor from linear
// flow to nominal jf)  is folded into that denominator (16384) at compile time.
// that makes denom = 2048 = 11 bits.  so:
// gb = (puff len jf) = (MAF linear flow) * [(total trim) + trim_unity] >> 11
addr == 16'h5f2 ? 16'h0006 :  // <0192> a = ga
addr == 16'h5f3 ? 16'h07a0 :  // <0193> b = $trim_unity
addr == 16'h5f4 ? 16'h2000 :  // <0193> "
addr == 16'h5f5 ? 16'hc800 :  // <0194> a = a+b
addr == 16'h5f6 ? 16'h0300 :  // <0194> "
addr == 16'h5f7 ? 16'h6600 :  // <0195> ram b = $ram_maf_flow_hi_res // av_ad_hi = 0
addr == 16'h5f8 ? 16'h6a9c :  // <0195> ram b = $ram_maf_flow_hi_res // av_ad_lo = 156
addr == 16'h5f9 ? 16'h0417 :  // <0195> ram b = $ram_maf_flow_hi_res // b = av_write_data // start read cycle
addr == 16'h5fa ? 16'h0418 :  // <0195> ram b = $ram_maf_flow_hi_res // b = av_read_data // finish read cycle
addr == 16'h5fb ? 16'hc800 :  // <0196> nop
addr == 16'h5fc ? 16'hc800 :  // <0197> nop
addr == 16'h5fd ? 16'hc800 :  // <0198> nop
addr == 16'h5fe ? 16'hc800 :  // <0199> nop
// gb = 32-bit product shifted >> 11.  lower 11 bits of product_hi are
// explicitly moved to upper 11 bits of gb.
addr == 16'h5ff ? 16'h0010 :  // <0202> a = product_lo
addr == 16'h600 ? 16'h0411 :  // <0203> b = product_hi
addr == 16'h601 ? 16'h0353 :  // <0204> a = a>>4
addr == 16'h602 ? 16'h0353 :  // <0205> a = a>>4
addr == 16'h603 ? 16'h0350 :  // <0206> a = a>>1
addr == 16'h604 ? 16'h0350 :  // <0207> a = a>>1
addr == 16'h605 ? 16'h1f50 :  // <0208> gb = a>>1
addr == 16'h606 ? 16'h0001 :  // <0209> a = b
addr == 16'h607 ? 16'h0352 :  // <0210> a = a<<4
addr == 16'h608 ? 16'h0351 :  // <0211> a = a<<1
addr == 16'h609 ? 16'h0407 :  // <0212> b = gb
addr == 16'h60a ? 16'hc800 :  // <0213> gb = or
addr == 16'h60b ? 16'h1f34 :  // <0213> "

// clamp the (puff length jf) to sane range.
// max is the floating duty cycle.  7/8 of puff cycle, or 87.5%.
addr == 16'h60c ? 16'h6600 :  // <0217> ram a = $ram_ign_avg_jf // av_ad_hi = 0
addr == 16'h60d ? 16'h6a7c :  // <0217> ram a = $ram_ign_avg_jf // av_ad_lo = 124
addr == 16'h60e ? 16'h0017 :  // <0217> ram a = $ram_ign_avg_jf // a = av_write_data // start read cycle
addr == 16'h60f ? 16'h0018 :  // <0217> ram a = $ram_ign_avg_jf // a = av_read_data // finish read cycle
addr == 16'h610 ? 16'h0350 :  // <0218> a = a>>1
addr == 16'h611 ? 16'h0350 :  // <0219> a = a>>1
addr == 16'h612 ? 16'h0350 :  // <0220> a = a>>1
addr == 16'h613 ? 16'h0760 :  // <0221> b = 0xffff
addr == 16'h614 ? 16'hc800 :  // <0222> a = xor
addr == 16'h615 ? 16'h0338 :  // <0222> "
addr == 16'h616 ? 16'h6600 :  // <0223> ram b = $ram_ign_avg_jf // av_ad_hi = 0
addr == 16'h617 ? 16'h6a7c :  // <0223> ram b = $ram_ign_avg_jf // av_ad_lo = 124
addr == 16'h618 ? 16'h0417 :  // <0223> ram b = $ram_ign_avg_jf // b = av_write_data // start read cycle
addr == 16'h619 ? 16'h0418 :  // <0223> ram b = $ram_ign_avg_jf // b = av_read_data // finish read cycle
addr == 16'h61a ? 16'hc800 :  // <0224> x = a+b
addr == 16'h61b ? 16'h1300 :  // <0224> "

addr == 16'h61c ? 16'h0007 :  // <0227> a = gb
addr == 16'h61d ? 16'h0404 :  // <0227> b = x

addr == 16'h61e ? 16'he406 :  // <0225> bn gt :else_1566
addr == 16'h61f ? 16'h0621 :  // <0225> "

addr == 16'h620 ? 16'h1c04 :  // <0226> gb = x

// min is the safety amount to keep motor running and maybe prevent leaning damage.
//patch: don't know a proper minimum.

// shut off puff during closed throttle engine braking.
//patch: not implemented.

// memorize total puff.
addr == 16'h621 ? 16'h6600 :  // <0235> ram $ram_next_puff_len_us = ga // av_ad_hi = 0
addr == 16'h622 ? 16'h6a92 :  // <0235> ram $ram_next_puff_len_us = ga // av_ad_lo = 146
addr == 16'h623 ? 16'h5c06 :  // <0235> ram $ram_next_puff_len_us = ga // av_write_data = ga

// :abort // = 0x0624

addr == 16'h624 ? 16'hf80c :  // <0239> pop rtna // func puff_len_run
addr == 16'h625 ? 16'h1c0c :  // <0239> pop gb // "
addr == 16'h626 ? 16'h100c :  // <0239> pop x // "
addr == 16'h627 ? 16'hfc00 :  // <0239> swapra = nop

// ######## func leave_run // = 0x0628
addr == 16'h628 ? 16'h303e :  // <0242> push rtna // func leave_run

addr == 16'h629 ? 16'hfba0 :  // <0241> callx  check_engine_stop  pa
addr == 16'h62a ? 16'h0cc6 :  // <0241> "
addr == 16'h62b ? 16'hfc00 :  // <0241> "

addr == 16'h62c ? 16'hf80c :  // <0243> pop rtna // func leave_run
addr == 16'h62d ? 16'hfc00 :  // <0243> swapra = nop

// ######## func interpret_block_temp // = 0x062e
addr == 16'h62e ? 16'h3002 :  // <0257> push i // func interpret_block_temp
addr == 16'h62f ? 16'h3007 :  // <0257> push gb // "

// look up block temperature map trim factor.
addr == 16'h630 ? 16'h0202 :  // <0246> a = 2

addr == 16'h631 ? 16'h0351 :  // <0246> a = a<<1
addr == 16'h632 ? 16'h0616 :  // <0246> b = 22
addr == 16'h633 ? 16'h6600 :  // <0246> av_ad_hi = 0
addr == 16'h634 ? 16'h6b00 :  // <0246> av_ad_lo = ad0
addr == 16'h635 ? 16'h0417 :  // <0246> b = av_begin_read

addr == 16'h636 ? 16'h1c18 :  // <0246> gb = av_read_data
addr == 16'h637 ? 16'h0a00 :  // <0255> i = 0
// :loop_1591 // = 0x0638

addr == 16'h638 ? 16'h0002 :  // <0247> a = i

addr == 16'h639 ? 16'h0351 :  // <0247> a = a<<1
addr == 16'h63a ? 16'h07a0 :  // <0247> b = 2592
addr == 16'h63b ? 16'h0a20 :  // <0247> "
addr == 16'h63c ? 16'h67a0 :  // <0247> av_ad_hi = 256
addr == 16'h63d ? 16'h0100 :  // <0247> "
addr == 16'h63e ? 16'h6b00 :  // <0247> av_ad_lo = ad0
addr == 16'h63f ? 16'h0417 :  // <0247> b = av_begin_read

addr == 16'h640 ? 16'h0418 :  // <0247> b = av_read_data

addr == 16'h641 ? 16'h0001 :  // <0253> a = b
addr == 16'h642 ? 16'h0407 :  // <0253> b = gb

addr == 16'h643 ? 16'he406 :  // <0248> bn gt :else_1603
addr == 16'h644 ? 16'h0656 :  // <0248> "

addr == 16'h645 ? 16'h6600 :  // <0249> ram $ram_block_temp_map_idx = i // av_ad_hi = 0
addr == 16'h646 ? 16'h6aa2 :  // <0249> ram $ram_block_temp_map_idx = i // av_ad_lo = 162
addr == 16'h647 ? 16'h5c02 :  // <0249> ram $ram_block_temp_map_idx = i // av_write_data = i
addr == 16'h648 ? 16'h0002 :  // <0250> a = i

addr == 16'h649 ? 16'h0351 :  // <0250> a = a<<1
addr == 16'h64a ? 16'h07a0 :  // <0250> b = 2720
addr == 16'h64b ? 16'h0aa0 :  // <0250> "
addr == 16'h64c ? 16'h67a0 :  // <0250> av_ad_hi = 256
addr == 16'h64d ? 16'h0100 :  // <0250> "
addr == 16'h64e ? 16'h6b00 :  // <0250> av_ad_lo = ad0
addr == 16'h64f ? 16'h0417 :  // <0250> b = av_begin_read

addr == 16'h650 ? 16'h0418 :  // <0250> b = av_read_data
addr == 16'h651 ? 16'h6600 :  // <0251> ram $ram_block_temp_trim = b // av_ad_hi = 0
addr == 16'h652 ? 16'h6aa4 :  // <0251> ram $ram_block_temp_trim = b // av_ad_lo = 164
addr == 16'h653 ? 16'h5c01 :  // <0251> ram $ram_block_temp_trim = b // av_write_data = b
addr == 16'h654 ? 16'he00f :  // <0252> jmp :temp_done
addr == 16'h655 ? 16'h065e :  // <0252> "



addr == 16'h656 ? 16'h0002 :  // <0255> a = i
addr == 16'h657 ? 16'h0601 :  // <0255> b = 1
addr == 16'h658 ? 16'hc800 :  // <0255> i = a+b
addr == 16'h659 ? 16'h0b00 :  // <0255> "


addr == 16'h65a ? 16'h0002 :  // <0255> a = i
addr == 16'h65b ? 16'h0640 :  // <0255> b = $block_temp_num_cells
addr == 16'h65c ? 16'he005 :  // <0255> br lt :loop_1591
addr == 16'h65d ? 16'h0638 :  // <0255> "

// :end_1591 // = 0x065e
// :temp_done // = 0x065e

addr == 16'h65e ? 16'h1c0c :  // <0258> pop gb // func interpret_block_temp
addr == 16'h65f ? 16'h080c :  // <0258> pop i // "
addr == 16'h660 ? 16'hfc00 :  // <0258> swapra = nop

// ######## func interpret_puff_count // = 0x0661
addr == 16'h661 ? 16'h3002 :  // <0275> push i // func interpret_puff_count
addr == 16'h662 ? 16'h3003 :  // <0275> push j // "
addr == 16'h663 ? 16'h3007 :  // <0275> push gb // "

// look up afterstart trim factor.
addr == 16'h664 ? 16'h6600 :  // <0261> ram gb = $ram_puff_count // av_ad_hi = 0
addr == 16'h665 ? 16'h6a94 :  // <0261> ram gb = $ram_puff_count // av_ad_lo = 148
addr == 16'h666 ? 16'h1c17 :  // <0261> ram gb = $ram_puff_count // gb = av_write_data // start read cycle
addr == 16'h667 ? 16'h1c18 :  // <0261> ram gb = $ram_puff_count // gb = av_read_data // finish read cycle
addr == 16'h668 ? 16'h0a00 :  // <0271> i = 0
// :loop_1640 // = 0x0669

addr == 16'h669 ? 16'h0002 :  // <0262> a = i

addr == 16'h66a ? 16'h0351 :  // <0262> a = a<<1
addr == 16'h66b ? 16'h07a0 :  // <0262> b = 2848
addr == 16'h66c ? 16'h0b20 :  // <0262> "
addr == 16'h66d ? 16'h67a0 :  // <0262> av_ad_hi = 256
addr == 16'h66e ? 16'h0100 :  // <0262> "
addr == 16'h66f ? 16'h6b00 :  // <0262> av_ad_lo = ad0
addr == 16'h670 ? 16'h0417 :  // <0262> b = av_begin_read

addr == 16'h671 ? 16'h0418 :  // <0262> b = av_read_data

addr == 16'h672 ? 16'h0001 :  // <0269> a = b
addr == 16'h673 ? 16'h0407 :  // <0269> b = gb

addr == 16'h674 ? 16'he406 :  // <0263> bn gt :else_1652
addr == 16'h675 ? 16'h0689 :  // <0263> "

addr == 16'h676 ? 16'h0f60 :  // <0264> j = -1
addr == 16'h677 ? 16'h6600 :  // <0265> ram $ram_afterstart_map_idx = i+j // av_ad_hi = 0
addr == 16'h678 ? 16'h6aa6 :  // <0265> ram $ram_afterstart_map_idx = i+j // av_ad_lo = 166
addr == 16'h679 ? 16'hc800 :  // <0265> ram $ram_afterstart_map_idx = i+j // av_write_data = i+j
addr == 16'h67a ? 16'h5f10 :  // <0265> "
addr == 16'h67b ? 16'h0002 :  // <0266> a = i

addr == 16'h67c ? 16'h0351 :  // <0266> a = a<<1
addr == 16'h67d ? 16'h07a0 :  // <0266> b = 2868
addr == 16'h67e ? 16'h0b34 :  // <0266> "
addr == 16'h67f ? 16'h67a0 :  // <0266> av_ad_hi = 256
addr == 16'h680 ? 16'h0100 :  // <0266> "
addr == 16'h681 ? 16'h6b00 :  // <0266> av_ad_lo = ad0
addr == 16'h682 ? 16'h0417 :  // <0266> b = av_begin_read

addr == 16'h683 ? 16'h0418 :  // <0266> b = av_read_data
addr == 16'h684 ? 16'h6600 :  // <0267> ram $ram_afterstart_trim = b // av_ad_hi = 0
addr == 16'h685 ? 16'h6aa8 :  // <0267> ram $ram_afterstart_trim = b // av_ad_lo = 168
addr == 16'h686 ? 16'h5c01 :  // <0267> ram $ram_afterstart_trim = b // av_write_data = b
addr == 16'h687 ? 16'he00f :  // <0268> jmp :done
addr == 16'h688 ? 16'h069d :  // <0268> "



addr == 16'h689 ? 16'h0002 :  // <0271> a = i
addr == 16'h68a ? 16'h0601 :  // <0271> b = 1
addr == 16'h68b ? 16'hc800 :  // <0271> i = a+b
addr == 16'h68c ? 16'h0b00 :  // <0271> "


addr == 16'h68d ? 16'h0002 :  // <0271> a = i
addr == 16'h68e ? 16'h060a :  // <0271> b = $afterstart_num_cells
addr == 16'h68f ? 16'he005 :  // <0271> br lt :loop_1640
addr == 16'h690 ? 16'h0669 :  // <0271> "

// :end_1640 // = 0x0691
addr == 16'h691 ? 16'h0209 :  // <0272> a = 9

addr == 16'h692 ? 16'h0351 :  // <0272> a = a<<1
addr == 16'h693 ? 16'h07a0 :  // <0272> b = 2868
addr == 16'h694 ? 16'h0b34 :  // <0272> "
addr == 16'h695 ? 16'h67a0 :  // <0272> av_ad_hi = 256
addr == 16'h696 ? 16'h0100 :  // <0272> "
addr == 16'h697 ? 16'h6b00 :  // <0272> av_ad_lo = ad0
addr == 16'h698 ? 16'h0417 :  // <0272> b = av_begin_read

addr == 16'h699 ? 16'h0418 :  // <0272> b = av_read_data
addr == 16'h69a ? 16'h6600 :  // <0273> ram $ram_afterstart_trim = b // av_ad_hi = 0
addr == 16'h69b ? 16'h6aa8 :  // <0273> ram $ram_afterstart_trim = b // av_ad_lo = 168
addr == 16'h69c ? 16'h5c01 :  // <0273> ram $ram_afterstart_trim = b // av_write_data = b
// :done // = 0x069d

addr == 16'h69d ? 16'h1c0c :  // <0276> pop gb // func interpret_puff_count
addr == 16'h69e ? 16'h0c0c :  // <0276> pop j // "
addr == 16'h69f ? 16'h080c :  // <0276> pop i // "
addr == 16'h6a0 ? 16'hfc00 :  // <0276> swapra = nop

// ######## func dump_afrc_cmd // = 0x06a1
addr == 16'h6a1 ? 16'h3002 :  // <0300> push i // func dump_afrc_cmd
addr == 16'h6a2 ? 16'h3004 :  // <0300> push x // "
addr == 16'h6a3 ? 16'h3006 :  // <0300> push ga // "
addr == 16'h6a4 ? 16'h3007 :  // <0300> push gb // "
addr == 16'h6a5 ? 16'h303e :  // <0300> push rtna // "

addr == 16'h6a6 ? 16'h020d :  // <0278> a = 13 // puteol
addr == 16'h6a7 ? 16'hfba0 :  // <0278> puteol
addr == 16'h6a8 ? 16'h00ab :  // <0278> "
addr == 16'h6a9 ? 16'hfc00 :  // <0278> "
addr == 16'h6aa ? 16'h020a :  // <0278> a = 10 // puteol
addr == 16'h6ab ? 16'hfba0 :  // <0278> puteol
addr == 16'h6ac ? 16'h00ab :  // <0278> "
addr == 16'h6ad ? 16'hfc00 :  // <0278> "
addr == 16'h6ae ? 16'h6600 :  // <0279> ram ga = $ram_afrc_maf_row_idx // av_ad_hi = 0
addr == 16'h6af ? 16'h6a9e :  // <0279> ram ga = $ram_afrc_maf_row_idx // av_ad_lo = 158
addr == 16'h6b0 ? 16'h1817 :  // <0279> ram ga = $ram_afrc_maf_row_idx // ga = av_write_data // start read cycle
addr == 16'h6b1 ? 16'h1818 :  // <0279> ram ga = $ram_afrc_maf_row_idx // ga = av_read_data // finish read cycle
addr == 16'h6b2 ? 16'h6600 :  // <0280> ram gb = $ram_afrc_rpm_col_idx // av_ad_hi = 0
addr == 16'h6b3 ? 16'h6aa0 :  // <0280> ram gb = $ram_afrc_rpm_col_idx // av_ad_lo = 160
addr == 16'h6b4 ? 16'h1c17 :  // <0280> ram gb = $ram_afrc_rpm_col_idx // gb = av_write_data // start read cycle
addr == 16'h6b5 ? 16'h1c18 :  // <0280> ram gb = $ram_afrc_rpm_col_idx // gb = av_read_data // finish read cycle
addr == 16'h6b6 ? 16'h67a0 :  // <0281> av_ad_hi = ([ram_to_int $ram_afrc_map] >> 16)
addr == 16'h6b7 ? 16'h0100 :  // <0281> "
addr == 16'h6b8 ? 16'h6a00 :  // <0282> av_ad_lo = ([ram_to_int $ram_afrc_map] & 0xffff)
addr == 16'h6b9 ? 16'h0a00 :  // <0299> i = 0
// :loop_1721 // = 0x06ba

addr == 16'h6ba ? 16'h1200 :  // <0296> x = 0
// :loop_1722 // = 0x06bb

addr == 16'h6bb ? 16'h0017 :  // <0283> a = av_begin_read
addr == 16'h6bc ? 16'h0018 :  // <0284> a = av_read_data
addr == 16'h6bd ? 16'hfba0 :  // <0285> call put4x
addr == 16'h6be ? 16'h00d3 :  // <0285> "
addr == 16'h6bf ? 16'hfc00 :  // <0285> "

addr == 16'h6c0 ? 16'h0004 :  // <0290> a = x
addr == 16'h6c1 ? 16'h0407 :  // <0290> b = gb

addr == 16'h6c2 ? 16'he407 :  // <0286> bn eq :else_1730
addr == 16'h6c3 ? 16'h06ca :  // <0286> "

addr == 16'h6c4 ? 16'h023c :  // <0287> a = 60 // putasc "<"
addr == 16'h6c5 ? 16'hfba0 :  // <0287> putasc "<"
addr == 16'h6c6 ? 16'h00ab :  // <0287> "
addr == 16'h6c7 ? 16'hfc00 :  // <0287> "

addr == 16'h6c8 ? 16'he00f :  // <0289> jmp :end_1730
addr == 16'h6c9 ? 16'h06ce :  // <0289> "

addr == 16'h6ca ? 16'h0220 :  // <0290> a = 32 // putasc " "
addr == 16'h6cb ? 16'hfba0 :  // <0290> putasc " "
addr == 16'h6cc ? 16'h00ab :  // <0290> "
addr == 16'h6cd ? 16'hfc00 :  // <0290> "

addr == 16'h6ce ? 16'h0220 :  // <0291> a = 32 // putasc " "
addr == 16'h6cf ? 16'hfba0 :  // <0291> putasc " "
addr == 16'h6d0 ? 16'h00ab :  // <0291> "
addr == 16'h6d1 ? 16'hfc00 :  // <0291> "
addr == 16'h6d2 ? 16'h001a :  // <0292> a = av_ad_lo
addr == 16'h6d3 ? 16'h0602 :  // <0293> b = 2
addr == 16'h6d4 ? 16'hc800 :  // <0294> av_ad_lo = a+b
addr == 16'h6d5 ? 16'h6b00 :  // <0294> "


addr == 16'h6d6 ? 16'h0004 :  // <0296> a = x
addr == 16'h6d7 ? 16'h0601 :  // <0296> b = 1
addr == 16'h6d8 ? 16'hc800 :  // <0296> x = a+b
addr == 16'h6d9 ? 16'h1300 :  // <0296> "


addr == 16'h6da ? 16'h0004 :  // <0296> a = x
addr == 16'h6db ? 16'h0610 :  // <0296> b = $afrc_rpm_cols
addr == 16'h6dc ? 16'he005 :  // <0296> br lt :loop_1722
addr == 16'h6dd ? 16'h06bb :  // <0296> "

// :end_1722 // = 0x06de
addr == 16'h6de ? 16'h020d :  // <0297> a = 13 // puteol
addr == 16'h6df ? 16'hfba0 :  // <0297> puteol
addr == 16'h6e0 ? 16'h00ab :  // <0297> "
addr == 16'h6e1 ? 16'hfc00 :  // <0297> "
addr == 16'h6e2 ? 16'h020a :  // <0297> a = 10 // puteol
addr == 16'h6e3 ? 16'hfba0 :  // <0297> puteol
addr == 16'h6e4 ? 16'h00ab :  // <0297> "
addr == 16'h6e5 ? 16'hfc00 :  // <0297> "


addr == 16'h6e6 ? 16'h0002 :  // <0299> a = i
addr == 16'h6e7 ? 16'h0601 :  // <0299> b = 1
addr == 16'h6e8 ? 16'hc800 :  // <0299> i = a+b
addr == 16'h6e9 ? 16'h0b00 :  // <0299> "


addr == 16'h6ea ? 16'h0002 :  // <0299> a = i
addr == 16'h6eb ? 16'h0640 :  // <0299> b = $afrc_maf_rows
addr == 16'h6ec ? 16'he005 :  // <0299> br lt :loop_1721
addr == 16'h6ed ? 16'h06ba :  // <0299> "

// :end_1721 // = 0x06ee

addr == 16'h6ee ? 16'hf80c :  // <0301> pop rtna // func dump_afrc_cmd
addr == 16'h6ef ? 16'h1c0c :  // <0301> pop gb // "
addr == 16'h6f0 ? 16'h180c :  // <0301> pop ga // "
addr == 16'h6f1 ? 16'h100c :  // <0301> pop x // "
addr == 16'h6f2 ? 16'h080c :  // <0301> pop i // "
addr == 16'h6f3 ? 16'hfc00 :  // <0301> swapra = nop



// #########################################################################
// :main // = 0x06f4
addr == 16'h6f4 ? 16'h03a0 :  // <0227> a = :boot_msg
addr == 16'h6f5 ? 16'h009b :  // <0227> "
addr == 16'h6f6 ? 16'hfba0 :  // <0228> call :print_nt
addr == 16'h6f7 ? 16'h015f :  // <0228> "
addr == 16'h6f8 ? 16'hfc00 :  // <0228> "

// clear the first 64k of RAM.
addr == 16'h6f9 ? 16'h6600 :  // <0231> av_ad_hi = 0
addr == 16'h6fa ? 16'hfba0 :  // <0231> callx  clear_ram_page  0
addr == 16'h6fb ? 16'h0bb8 :  // <0231> "
addr == 16'h6fc ? 16'hfc00 :  // <0231> "



// write has 6 cases:
//  offset in a.
//  offset in some other register.
//  offset is constant.
addr == 16'h6fd ? 16'h0231 :  // <0233> a = 0x31
addr == 16'h6fe ? 16'h1261 :  // <0233> x = 0x61
addr == 16'h6ff ? 16'h3004 :  // <0233> push x // push x

addr == 16'h700 ? 16'h0351 :  // <0233> a = a<<1
addr == 16'h701 ? 16'h07a0 :  // <0233> b = 8192
addr == 16'h702 ? 16'h2000 :  // <0233> "
addr == 16'h703 ? 16'h6601 :  // <0233> av_ad_hi = 1
addr == 16'h704 ? 16'h6b00 :  // <0233> av_ad_lo = ad0

addr == 16'h705 ? 16'h5c0c :  // <0233> pop av_write_data // pop av_write_data
addr == 16'h706 ? 16'h1632 :  // <0233> y = 0x32
addr == 16'h707 ? 16'h1262 :  // <0233> x = 0x62
addr == 16'h708 ? 16'h3004 :  // <0233> push x // push x
addr == 16'h709 ? 16'h0005 :  // <0233> a = y

addr == 16'h70a ? 16'h0351 :  // <0233> a = a<<1
addr == 16'h70b ? 16'h07a0 :  // <0233> b = 8192
addr == 16'h70c ? 16'h2000 :  // <0233> "
addr == 16'h70d ? 16'h6601 :  // <0233> av_ad_hi = 1
addr == 16'h70e ? 16'h6b00 :  // <0233> av_ad_lo = ad0

addr == 16'h70f ? 16'h5c0c :  // <0233> pop av_write_data // pop av_write_data
addr == 16'h710 ? 16'h1263 :  // <0233> x = 0x63
addr == 16'h711 ? 16'h3004 :  // <0233> push x // push x
addr == 16'h712 ? 16'h0233 :  // <0233> a = 0x33

addr == 16'h713 ? 16'h0351 :  // <0233> a = a<<1
addr == 16'h714 ? 16'h07a0 :  // <0233> b = 8192
addr == 16'h715 ? 16'h2000 :  // <0233> "
addr == 16'h716 ? 16'h6601 :  // <0233> av_ad_hi = 1
addr == 16'h717 ? 16'h6b00 :  // <0233> av_ad_lo = ad0

addr == 16'h718 ? 16'h5c0c :  // <0233> pop av_write_data // pop av_write_data
// and those 3 again, with data content as a constant instead of a register.
addr == 16'h719 ? 16'h0241 :  // <0233> a = 0x41

addr == 16'h71a ? 16'h0351 :  // <0233> a = a<<1
addr == 16'h71b ? 16'h07a0 :  // <0233> b = 8192
addr == 16'h71c ? 16'h2000 :  // <0233> "
addr == 16'h71d ? 16'h6601 :  // <0233> av_ad_hi = 1
addr == 16'h71e ? 16'h6b00 :  // <0233> av_ad_lo = ad0

addr == 16'h71f ? 16'h5e71 :  // <0233> av_write_data = 0x71
addr == 16'h720 ? 16'h1642 :  // <0233> y = 0x42
addr == 16'h721 ? 16'h0005 :  // <0233> a = y

addr == 16'h722 ? 16'h0351 :  // <0233> a = a<<1
addr == 16'h723 ? 16'h07a0 :  // <0233> b = 8192
addr == 16'h724 ? 16'h2000 :  // <0233> "
addr == 16'h725 ? 16'h6601 :  // <0233> av_ad_hi = 1
addr == 16'h726 ? 16'h6b00 :  // <0233> av_ad_lo = ad0

addr == 16'h727 ? 16'h5e72 :  // <0233> av_write_data = 0x72
addr == 16'h728 ? 16'h0243 :  // <0233> a = 0x43

addr == 16'h729 ? 16'h0351 :  // <0233> a = a<<1
addr == 16'h72a ? 16'h07a0 :  // <0233> b = 8192
addr == 16'h72b ? 16'h2000 :  // <0233> "
addr == 16'h72c ? 16'h6601 :  // <0233> av_ad_hi = 1
addr == 16'h72d ? 16'h6b00 :  // <0233> av_ad_lo = ad0

addr == 16'h72e ? 16'h5e73 :  // <0233> av_write_data = 0x73

// read has the same 3 cases of offset.
// test all those using the first case of write.
addr == 16'h72f ? 16'h0231 :  // <0233> a = 0x31

addr == 16'h730 ? 16'h0351 :  // <0233> a = a<<1
addr == 16'h731 ? 16'h07a0 :  // <0233> b = 8192
addr == 16'h732 ? 16'h2000 :  // <0233> "
addr == 16'h733 ? 16'h6601 :  // <0233> av_ad_hi = 1
addr == 16'h734 ? 16'h6b00 :  // <0233> av_ad_lo = ad0
addr == 16'h735 ? 16'h0417 :  // <0233> b = av_begin_read

addr == 16'h736 ? 16'h0818 :  // <0233> i = av_read_data

addr == 16'h737 ? 16'h0002 :  // <0233> a = i
addr == 16'h738 ? 16'h0661 :  // <0233> b = 0x61

addr == 16'h739 ? 16'he007 :  // <0231> br eq :else_1849
addr == 16'h73a ? 16'h073d :  // <0231> "

addr == 16'h73b ? 16'he00f :  // <0232> jmp :struct_test_error
addr == 16'h73c ? 16'h07cc :  // <0232> "

addr == 16'h73d ? 16'h1631 :  // <0233> y = 0x31
addr == 16'h73e ? 16'h0005 :  // <0233> a = y

addr == 16'h73f ? 16'h0351 :  // <0233> a = a<<1
addr == 16'h740 ? 16'h07a0 :  // <0233> b = 8192
addr == 16'h741 ? 16'h2000 :  // <0233> "
addr == 16'h742 ? 16'h6601 :  // <0233> av_ad_hi = 1
addr == 16'h743 ? 16'h6b00 :  // <0233> av_ad_lo = ad0
addr == 16'h744 ? 16'h0417 :  // <0233> b = av_begin_read

addr == 16'h745 ? 16'h0818 :  // <0233> i = av_read_data

addr == 16'h746 ? 16'h0002 :  // <0233> a = i
addr == 16'h747 ? 16'h0661 :  // <0233> b = 0x61

addr == 16'h748 ? 16'he007 :  // <0231> br eq :else_1864
addr == 16'h749 ? 16'h074c :  // <0231> "

addr == 16'h74a ? 16'he00f :  // <0232> jmp :struct_test_error
addr == 16'h74b ? 16'h07cc :  // <0232> "

addr == 16'h74c ? 16'h0231 :  // <0233> a = 0x31

addr == 16'h74d ? 16'h0351 :  // <0233> a = a<<1
addr == 16'h74e ? 16'h07a0 :  // <0233> b = 8192
addr == 16'h74f ? 16'h2000 :  // <0233> "
addr == 16'h750 ? 16'h6601 :  // <0233> av_ad_hi = 1
addr == 16'h751 ? 16'h6b00 :  // <0233> av_ad_lo = ad0
addr == 16'h752 ? 16'h0417 :  // <0233> b = av_begin_read

addr == 16'h753 ? 16'h0818 :  // <0233> i = av_read_data

addr == 16'h754 ? 16'h0002 :  // <0233> a = i
addr == 16'h755 ? 16'h0661 :  // <0233> b = 0x61

addr == 16'h756 ? 16'he007 :  // <0231> br eq :else_1878
addr == 16'h757 ? 16'h075a :  // <0231> "

addr == 16'h758 ? 16'he00f :  // <0232> jmp :struct_test_error
addr == 16'h759 ? 16'h07cc :  // <0232> "


// use read to verify all cases of write.
addr == 16'h75a ? 16'h0232 :  // <0233> a = 0x32

addr == 16'h75b ? 16'h0351 :  // <0233> a = a<<1
addr == 16'h75c ? 16'h07a0 :  // <0233> b = 8192
addr == 16'h75d ? 16'h2000 :  // <0233> "
addr == 16'h75e ? 16'h6601 :  // <0233> av_ad_hi = 1
addr == 16'h75f ? 16'h6b00 :  // <0233> av_ad_lo = ad0
addr == 16'h760 ? 16'h0417 :  // <0233> b = av_begin_read

addr == 16'h761 ? 16'h0818 :  // <0233> i = av_read_data

addr == 16'h762 ? 16'h0002 :  // <0233> a = i
addr == 16'h763 ? 16'h0662 :  // <0233> b = 0x62

addr == 16'h764 ? 16'he007 :  // <0231> br eq :else_1892
addr == 16'h765 ? 16'h0768 :  // <0231> "

addr == 16'h766 ? 16'he00f :  // <0232> jmp :struct_test_error
addr == 16'h767 ? 16'h07cc :  // <0232> "

addr == 16'h768 ? 16'h0232 :  // <0233> a = 0x32

addr == 16'h769 ? 16'h0351 :  // <0233> a = a<<1
addr == 16'h76a ? 16'h07a0 :  // <0233> b = 8192
addr == 16'h76b ? 16'h2000 :  // <0233> "
addr == 16'h76c ? 16'h6601 :  // <0233> av_ad_hi = 1
addr == 16'h76d ? 16'h6b00 :  // <0233> av_ad_lo = ad0
addr == 16'h76e ? 16'h0417 :  // <0233> b = av_begin_read

addr == 16'h76f ? 16'h0818 :  // <0233> i = av_read_data

addr == 16'h770 ? 16'h0002 :  // <0233> a = i
addr == 16'h771 ? 16'h0662 :  // <0233> b = 0x62

addr == 16'h772 ? 16'he007 :  // <0231> br eq :else_1906
addr == 16'h773 ? 16'h0776 :  // <0231> "

addr == 16'h774 ? 16'he00f :  // <0232> jmp :struct_test_error
addr == 16'h775 ? 16'h07cc :  // <0232> "

addr == 16'h776 ? 16'h0233 :  // <0233> a = 0x33

addr == 16'h777 ? 16'h0351 :  // <0233> a = a<<1
addr == 16'h778 ? 16'h07a0 :  // <0233> b = 8192
addr == 16'h779 ? 16'h2000 :  // <0233> "
addr == 16'h77a ? 16'h6601 :  // <0233> av_ad_hi = 1
addr == 16'h77b ? 16'h6b00 :  // <0233> av_ad_lo = ad0
addr == 16'h77c ? 16'h0417 :  // <0233> b = av_begin_read

addr == 16'h77d ? 16'h0818 :  // <0233> i = av_read_data

addr == 16'h77e ? 16'h0002 :  // <0233> a = i
addr == 16'h77f ? 16'h0663 :  // <0233> b = 0x63

addr == 16'h780 ? 16'he007 :  // <0231> br eq :else_1920
addr == 16'h781 ? 16'h0784 :  // <0231> "

addr == 16'h782 ? 16'he00f :  // <0232> jmp :struct_test_error
addr == 16'h783 ? 16'h07cc :  // <0232> "

addr == 16'h784 ? 16'h0241 :  // <0233> a = 0x41

addr == 16'h785 ? 16'h0351 :  // <0233> a = a<<1
addr == 16'h786 ? 16'h07a0 :  // <0233> b = 8192
addr == 16'h787 ? 16'h2000 :  // <0233> "
addr == 16'h788 ? 16'h6601 :  // <0233> av_ad_hi = 1
addr == 16'h789 ? 16'h6b00 :  // <0233> av_ad_lo = ad0
addr == 16'h78a ? 16'h0417 :  // <0233> b = av_begin_read

addr == 16'h78b ? 16'h0818 :  // <0233> i = av_read_data

addr == 16'h78c ? 16'h0002 :  // <0233> a = i
addr == 16'h78d ? 16'h0671 :  // <0233> b = 0x71

addr == 16'h78e ? 16'he007 :  // <0231> br eq :else_1934
addr == 16'h78f ? 16'h0792 :  // <0231> "

addr == 16'h790 ? 16'he00f :  // <0232> jmp :struct_test_error
addr == 16'h791 ? 16'h07cc :  // <0232> "

addr == 16'h792 ? 16'h0242 :  // <0233> a = 0x42

addr == 16'h793 ? 16'h0351 :  // <0233> a = a<<1
addr == 16'h794 ? 16'h07a0 :  // <0233> b = 8192
addr == 16'h795 ? 16'h2000 :  // <0233> "
addr == 16'h796 ? 16'h6601 :  // <0233> av_ad_hi = 1
addr == 16'h797 ? 16'h6b00 :  // <0233> av_ad_lo = ad0
addr == 16'h798 ? 16'h0417 :  // <0233> b = av_begin_read

addr == 16'h799 ? 16'h0818 :  // <0233> i = av_read_data

addr == 16'h79a ? 16'h0002 :  // <0233> a = i
addr == 16'h79b ? 16'h0672 :  // <0233> b = 0x72

addr == 16'h79c ? 16'he007 :  // <0231> br eq :else_1948
addr == 16'h79d ? 16'h07a0 :  // <0231> "

addr == 16'h79e ? 16'he00f :  // <0232> jmp :struct_test_error
addr == 16'h79f ? 16'h07cc :  // <0232> "

addr == 16'h7a0 ? 16'h0243 :  // <0233> a = 0x43

addr == 16'h7a1 ? 16'h0351 :  // <0233> a = a<<1
addr == 16'h7a2 ? 16'h07a0 :  // <0233> b = 8192
addr == 16'h7a3 ? 16'h2000 :  // <0233> "
addr == 16'h7a4 ? 16'h6601 :  // <0233> av_ad_hi = 1
addr == 16'h7a5 ? 16'h6b00 :  // <0233> av_ad_lo = ad0
addr == 16'h7a6 ? 16'h0417 :  // <0233> b = av_begin_read

addr == 16'h7a7 ? 16'h0818 :  // <0233> i = av_read_data

addr == 16'h7a8 ? 16'h0002 :  // <0233> a = i
addr == 16'h7a9 ? 16'h0673 :  // <0233> b = 0x73

addr == 16'h7aa ? 16'he007 :  // <0231> br eq :else_1962
addr == 16'h7ab ? 16'h07ae :  // <0231> "

addr == 16'h7ac ? 16'he00f :  // <0232> jmp :struct_test_error
addr == 16'h7ad ? 16'h07cc :  // <0232> "


// read can also leave the result in av_read_data if needed.
addr == 16'h7ae ? 16'h0243 :  // <0233> a = 0x43

addr == 16'h7af ? 16'h0351 :  // <0233> a = a<<1
addr == 16'h7b0 ? 16'h07a0 :  // <0233> b = 8192
addr == 16'h7b1 ? 16'h2000 :  // <0233> "
addr == 16'h7b2 ? 16'h6601 :  // <0233> av_ad_hi = 1
addr == 16'h7b3 ? 16'h6b00 :  // <0233> av_ad_lo = ad0
addr == 16'h7b4 ? 16'h0417 :  // <0233> b = av_begin_read


addr == 16'h7b5 ? 16'h0018 :  // <0233> a = av_read_data
addr == 16'h7b6 ? 16'h0673 :  // <0233> b = 0x73

addr == 16'h7b7 ? 16'he007 :  // <0231> br eq :else_1975
addr == 16'h7b8 ? 16'h07bb :  // <0231> "

addr == 16'h7b9 ? 16'he00f :  // <0232> jmp :struct_test_error
addr == 16'h7ba ? 16'h07cc :  // <0232> "


// read with an expression for the offset.
addr == 16'h7bb ? 16'h0241 :  // <0233> a = 65

addr == 16'h7bc ? 16'h0351 :  // <0233> a = a<<1
addr == 16'h7bd ? 16'h07a0 :  // <0233> b = 8192
addr == 16'h7be ? 16'h2000 :  // <0233> "
addr == 16'h7bf ? 16'h6601 :  // <0233> av_ad_hi = 1
addr == 16'h7c0 ? 16'h6b00 :  // <0233> av_ad_lo = ad0
addr == 16'h7c1 ? 16'h0417 :  // <0233> b = av_begin_read

addr == 16'h7c2 ? 16'h0818 :  // <0233> i = av_read_data

addr == 16'h7c3 ? 16'h0002 :  // <0233> a = i
addr == 16'h7c4 ? 16'h0671 :  // <0233> b = 0x71

addr == 16'h7c5 ? 16'he007 :  // <0231> br eq :else_1989
addr == 16'h7c6 ? 16'h07c9 :  // <0231> "

addr == 16'h7c7 ? 16'he00f :  // <0232> jmp :struct_test_error
addr == 16'h7c8 ? 16'h07cc :  // <0232> "


// :struct_test_ok // = 0x07c9
addr == 16'h7c9 ? 16'hc800 :  // <0233> nop
addr == 16'h7ca ? 16'he00f :  // <0233> jmp :struct_test_ok
addr == 16'h7cb ? 16'h07c9 :  // <0233> "

// :struct_test_error // = 0x07cc
addr == 16'h7cc ? 16'hc800 :  // <0233> nop
addr == 16'h7cd ? 16'he00f :  // <0233> jmp :struct_test_error
addr == 16'h7ce ? 16'h07cc :  // <0233> "


addr == 16'h7cf ? 16'hfba0 :  // <0235> callx  init_drom
addr == 16'h7d0 ? 16'h0266 :  // <0235> "
addr == 16'h7d1 ? 16'hfc00 :  // <0235> "

// init fuel injection.
addr == 16'h7d2 ? 16'hfba0 :  // <0238> callx  init_plan_stop
addr == 16'h7d3 ? 16'h0443 :  // <0238> "
addr == 16'h7d4 ? 16'hfc00 :  // <0238> "

// power up FTDI USB board, and init any other special board control functions.
addr == 16'h7d5 ? 16'h8280 :  // <0241> board_ctrl = $ftdi_power_mask
addr == 16'h7d6 ? 16'hfba0 :  // <0242> callx postpone_comm_restart
addr == 16'h7d7 ? 16'h0b8f :  // <0242> "
addr == 16'h7d8 ? 16'hfc00 :  // <0242> "

// check initial state of power management circuits.
// if power is lost or ignition switch is off already, open relay & abort run.
// that's important because then the event controller booted up too late to
// see edges on those 2 signals.  regular system would never shut itself down.
// this setup is the last thing done prior to the event handler loop.
addr == 16'h7d9 ? 16'h8a00 :  // <0249> power_duty = $power_duty_closing

addr == 16'h7da ? 16'h0022 :  // <0253> a = power_duty
addr == 16'h7db ? 16'h06c0 :  // <0253> b = ( $power_lost_mask | $ign_switch_off_mask )

addr == 16'h7dc ? 16'he003 :  // <0250> br and0z :else_2012
addr == 16'h7dd ? 16'h07e3 :  // <0250> "

addr == 16'h7de ? 16'h8a32 :  // <0251> power_duty = $power_duty_opening
addr == 16'h7df ? 16'h7fa0 :  // <0252> error_halt_code $err_power_lost_at_boot // leds = 0xfffb
addr == 16'h7e0 ? 16'hfffb :  // <0252> "
addr == 16'h7e1 ? 16'he00f :  // <0252> error_halt_code $err_power_lost_at_boot
addr == 16'h7e2 ? 16'h07e1 :  // <0252> "

addr == 16'h7e3 ? 16'h6600 :  // <0254> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h7e4 ? 16'h6a3e :  // <0254> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 62
addr == 16'h7e5 ? 16'h5f60 :  // <0254> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h7e6 ? 16'h6600 :  // <0255> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_hi = 0
addr == 16'h7e7 ? 16'h6a40 :  // <0255> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_lo = 64
addr == 16'h7e8 ? 16'h5e02 :  // <0255> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_write_data = 2

// start handling events.
addr == 16'h7e9 ? 16'h3ba0 :  // <0258> soft_event = $event_controller_reset_mask
addr == 16'h7ea ? 16'h8000 :  // <0258> "
addr == 16'h7eb ? 16'h3a00 :  // <0259> soft_event = 0
addr == 16'h7ec ? 16'h4fa0 :  // <0260> mstimer0 = 1000
addr == 16'h7ed ? 16'h03e8 :  // <0260> "
addr == 16'h7ee ? 16'h5614 :  // <0261> mstimer2 = $plan_tick_ms
addr == 16'h7ef ? 16'h6600 :  // <0262> ram $ram_enable_status_report = 1 // av_ad_hi = 0
addr == 16'h7f0 ? 16'h6a3c :  // <0262> ram $ram_enable_status_report = 1 // av_ad_lo = 60
addr == 16'h7f1 ? 16'h5e01 :  // <0262> ram $ram_enable_status_report = 1 // av_write_data = 1
addr == 16'h7f2 ? 16'he00f :  // <0263> jmp :poll_events
addr == 16'h7f3 ? 16'h009e :  // <0263> "

// event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.
// event 0 not used in this app anyway.
// :event_table // = 0x07f4
addr == 16'h7f4 ? 16'h009e :  // <0268> ([label :poll_events])
addr == 16'h7f5 ? 16'h0aea :  // <0269> ([label :power_lost_handler])
addr == 16'h7f6 ? 16'h0809 :  // <0270> ([label :ign_capture_handler])
addr == 16'h7f7 ? 16'h08a7 :  // <0271> ([label :ign_capture_timeout_handler])
addr == 16'h7f8 ? 16'h0b1e :  // <0272> ([label :puff1_done_handler])
addr == 16'h7f9 ? 16'h08ac :  // <0273> ([label :ustimer0_handler])
addr == 16'h7fa ? 16'h0a57 :  // <0274> ([label :spi_done_handler])
addr == 16'h7fb ? 16'h08ae :  // <0275> ([label :mstimer0_handler])
addr == 16'h7fc ? 16'h0a1b :  // <0276> ([label :mstimer1_handler])
addr == 16'h7fd ? 16'h08dd :  // <0277> ([label :mstimer2_handler])
addr == 16'h7fe ? 16'h0909 :  // <0278> ([label :uart_rx_handler])
addr == 16'h7ff ? 16'h0922 :  // <0279> ([label :uart_rx_overflow_handler])
addr == 16'h800 ? 16'h092a :  // <0280> ([label :uart_tx_overflow_handler])
addr == 16'h801 ? 16'h0931 :  // <0281> ([label :key0_handler])
addr == 16'h802 ? 16'h093b :  // <0282> ([label :key1_handler])
addr == 16'h803 ? 16'h0b01 :  // <0283> ([label :ign_switch_off_handler])
addr == 16'h804 ? 16'h0b14 :  // <0284> ([label :ign_switch_on_handler])
addr == 16'h805 ? 16'h0945 :  // <0285> ([label :softevent3_handler])
addr == 16'h806 ? 16'h0947 :  // <0286> ([label :softevent2_handler])
addr == 16'h807 ? 16'h0949 :  // <0287> ([label :softevent1_handler])
addr == 16'h808 ? 16'h094b :  // <0288> ([label :softevent0_handler])

// #########################################################################

// ######## event ign_capture_handler // = 0x0809
// discard outlier time.
addr == 16'h809 ? 16'h1823 :  // <0294> g6 = ign_capture_jf
addr == 16'h80a ? 16'h6600 :  // <0295> ram b = $ram_ign_fastest_jf // av_ad_hi = 0
addr == 16'h80b ? 16'h6a84 :  // <0295> ram b = $ram_ign_fastest_jf // av_ad_lo = 132
addr == 16'h80c ? 16'h0417 :  // <0295> ram b = $ram_ign_fastest_jf // b = av_write_data // start read cycle
addr == 16'h80d ? 16'h0418 :  // <0295> ram b = $ram_ign_fastest_jf // b = av_read_data // finish read cycle

addr == 16'h80e ? 16'h0006 :  // <0298> a = g6
addr == 16'h80f ? 16'h0401 :  // <0298> b = b

addr == 16'h810 ? 16'he405 :  // <0296> bn lt :else_2064
addr == 16'h811 ? 16'h0813 :  // <0296> "

addr == 16'h812 ? 16'h1a00 :  // <0297> g6 = 0

addr == 16'h813 ? 16'h6600 :  // <0299> ram b = $ram_ign_slowest_jf // av_ad_hi = 0
addr == 16'h814 ? 16'h6a86 :  // <0299> ram b = $ram_ign_slowest_jf // av_ad_lo = 134
addr == 16'h815 ? 16'h0417 :  // <0299> ram b = $ram_ign_slowest_jf // b = av_write_data // start read cycle
addr == 16'h816 ? 16'h0418 :  // <0299> ram b = $ram_ign_slowest_jf // b = av_read_data // finish read cycle

addr == 16'h817 ? 16'h0006 :  // <0302> a = g6
addr == 16'h818 ? 16'h0401 :  // <0302> b = b

addr == 16'h819 ? 16'he406 :  // <0300> bn gt :else_2073
addr == 16'h81a ? 16'h081c :  // <0300> "

addr == 16'h81b ? 16'h1a00 :  // <0301> g6 = 0


// increment buffer index and memorize time.
addr == 16'h81c ? 16'h6600 :  // <0305> ram a = $ram_ign_history_idx // av_ad_hi = 0
addr == 16'h81d ? 16'h6a5a :  // <0305> ram a = $ram_ign_history_idx // av_ad_lo = 90
addr == 16'h81e ? 16'h0017 :  // <0305> ram a = $ram_ign_history_idx // a = av_write_data // start read cycle
addr == 16'h81f ? 16'h0018 :  // <0305> ram a = $ram_ign_history_idx // a = av_read_data // finish read cycle
addr == 16'h820 ? 16'h0601 :  // <0306> b = 1
addr == 16'h821 ? 16'hc800 :  // <0307> a = a+b
addr == 16'h822 ? 16'h0300 :  // <0307> "
addr == 16'h823 ? 16'h060f :  // <0308> b = $ign_history_idx_mask
addr == 16'h824 ? 16'hc800 :  // <0309> a = and
addr == 16'h825 ? 16'h0330 :  // <0309> "
addr == 16'h826 ? 16'h6600 :  // <0310> ram $ram_ign_history_idx = a // av_ad_hi = 0
addr == 16'h827 ? 16'h6a5a :  // <0310> ram $ram_ign_history_idx = a // av_ad_lo = 90
addr == 16'h828 ? 16'h5c00 :  // <0310> ram $ram_ign_history_idx = a // av_write_data = a
addr == 16'h829 ? 16'h3006 :  // <0311> push g6 // push g6

addr == 16'h82a ? 16'h0351 :  // <0311> a = a<<1
addr == 16'h82b ? 16'h065c :  // <0311> b = 92
addr == 16'h82c ? 16'h6600 :  // <0311> av_ad_hi = 0
addr == 16'h82d ? 16'h6b00 :  // <0311> av_ad_lo = ad0

addr == 16'h82e ? 16'h5c0c :  // <0311> pop av_write_data // pop av_write_data

// ////////// compute new jiffy estimate.
// average entire history.
// x = total, y = sample, i = index = loop count, g6 = count of invalid samples.
addr == 16'h82f ? 16'h1200 :  // <0316> x = 0
addr == 16'h830 ? 16'h1a00 :  // <0317> g6 = 0
addr == 16'h831 ? 16'h0a00 :  // <0331> i = 0
// :loop_2097 // = 0x0832

addr == 16'h832 ? 16'h0002 :  // <0318> a = i

addr == 16'h833 ? 16'h0351 :  // <0318> a = a<<1
addr == 16'h834 ? 16'h065c :  // <0318> b = 92
addr == 16'h835 ? 16'h6600 :  // <0318> av_ad_hi = 0
addr == 16'h836 ? 16'h6b00 :  // <0318> av_ad_lo = ad0
addr == 16'h837 ? 16'h0417 :  // <0318> b = av_begin_read

addr == 16'h838 ? 16'h1418 :  // <0318> y = av_read_data

addr == 16'h839 ? 16'h0005 :  // <0329> a = y
addr == 16'h83a ? 16'h0600 :  // <0329> b = 0

addr == 16'h83b ? 16'he407 :  // <0319> bn eq :else_2107
addr == 16'h83c ? 16'h0843 :  // <0319> "

addr == 16'h83d ? 16'h0006 :  // <0320> a = g6
addr == 16'h83e ? 16'h0601 :  // <0321> b = 1
addr == 16'h83f ? 16'hc800 :  // <0322> g6 = a+b
addr == 16'h840 ? 16'h1b00 :  // <0322> "

addr == 16'h841 ? 16'he00f :  // <0324> jmp :end_2107
addr == 16'h842 ? 16'h084a :  // <0324> "

addr == 16'h843 ? 16'h0208 :  // <0325> a = ($ign_history_len / 2)
addr == 16'h844 ? 16'h0405 :  // <0326> b = y
addr == 16'h845 ? 16'hc800 :  // <0327> a = a+b
addr == 16'h846 ? 16'h0300 :  // <0327> "
addr == 16'h847 ? 16'h1753 :  // <0328> y = a>>$ign_history_idx_bits
addr == 16'h848 ? 16'hc800 :  // <0329> x = x+y
addr == 16'h849 ? 16'h1320 :  // <0329> "



addr == 16'h84a ? 16'h0002 :  // <0331> a = i
addr == 16'h84b ? 16'h0601 :  // <0331> b = 1
addr == 16'h84c ? 16'hc800 :  // <0331> i = a+b
addr == 16'h84d ? 16'h0b00 :  // <0331> "


addr == 16'h84e ? 16'h0002 :  // <0331> a = i
addr == 16'h84f ? 16'h0610 :  // <0331> b = $ign_history_len
addr == 16'h850 ? 16'he005 :  // <0331> br lt :loop_2097
addr == 16'h851 ? 16'h0832 :  // <0331> "

// :end_2097 // = 0x0852
addr == 16'h852 ? 16'h6600 :  // <0332> ram $ram_ign_avg_jf = x // av_ad_hi = 0
addr == 16'h853 ? 16'h6a7c :  // <0332> ram $ram_ign_avg_jf = x // av_ad_lo = 124
addr == 16'h854 ? 16'h5c04 :  // <0332> ram $ram_ign_avg_jf = x // av_write_data = x
addr == 16'h855 ? 16'h6600 :  // <0333> ram $ram_ign_bad_samples = g6 // av_ad_hi = 0
addr == 16'h856 ? 16'h6a82 :  // <0333> ram $ram_ign_bad_samples = g6 // av_ad_lo = 130
addr == 16'h857 ? 16'h5c06 :  // <0333> ram $ram_ign_bad_samples = g6 // av_write_data = g6
//patch: dividing before summing (instead of after) is much simpler and faster because it prevents overflow.
// but it means we could be reading as much as 16 jf too low (16 = ign_history_len).
// that error is way less than 1 RPM on the slow end,
// or about 1,000 RPM too fast on the fast end!
// might need to tighten that up.  one simple way might be adding ign_history_len / 2 to each history record prior to dividing.
// that didn't seem to help much in simple testing.
// probly because jf_to_rpm has only 32 RPM resolution.


addr == 16'h858 ? 16'h0006 :  // <0361> a = g6
addr == 16'h859 ? 16'h0604 :  // <0361> b = ( $ign_history_len / 4 )

addr == 16'h85a ? 16'he406 :  // <0342> bn gt :else_2138
addr == 16'h85b ? 16'h0861 :  // <0342> "

addr == 16'h85c ? 16'h6600 :  // <0343> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h85d ? 16'h6a80 :  // <0343> ram $ram_rpm_valid = 0 // av_ad_lo = 128
addr == 16'h85e ? 16'h5e00 :  // <0343> ram $ram_rpm_valid = 0 // av_write_data = 0

addr == 16'h85f ? 16'he00f :  // <0345> jmp :end_2138
addr == 16'h860 ? 16'h088d :  // <0345> "

// convert jiffies b to new RPM estimate.
addr == 16'h861 ? 16'h2004 :  // <0347> pa = x
addr == 16'h862 ? 16'hfba0 :  // <0347> callx  jf_to_rpm  x  pa
addr == 16'h863 ? 16'h0cba :  // <0347> "
addr == 16'h864 ? 16'hfc00 :  // <0347> "
addr == 16'h865 ? 16'h6600 :  // <0348> ram $ram_avg_rpm = pa // av_ad_hi = 0
addr == 16'h866 ? 16'h6a7e :  // <0348> ram $ram_avg_rpm = pa // av_ad_lo = 126
addr == 16'h867 ? 16'h5c08 :  // <0348> ram $ram_avg_rpm = pa // av_write_data = pa
addr == 16'h868 ? 16'h6600 :  // <0349> ram $ram_rpm_valid = 1 // av_ad_hi = 0
addr == 16'h869 ? 16'h6a80 :  // <0349> ram $ram_rpm_valid = 1 // av_ad_lo = 128
addr == 16'h86a ? 16'h5e01 :  // <0349> ram $ram_rpm_valid = 1 // av_write_data = 1

// find RPM column in AFRC map.
addr == 16'h86b ? 16'h6600 :  // <0352> ram gb = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h86c ? 16'h6a7e :  // <0352> ram gb = $ram_avg_rpm // av_ad_lo = 126
addr == 16'h86d ? 16'h1c17 :  // <0352> ram gb = $ram_avg_rpm // gb = av_write_data // start read cycle
addr == 16'h86e ? 16'h1c18 :  // <0352> ram gb = $ram_avg_rpm // gb = av_read_data // finish read cycle
addr == 16'h86f ? 16'h0a00 :  // <0359> i = 0
// :loop_2159 // = 0x0870

addr == 16'h870 ? 16'h0002 :  // <0353> a = i

addr == 16'h871 ? 16'h0351 :  // <0353> a = a<<1
addr == 16'h872 ? 16'h07a0 :  // <0353> b = 2560
addr == 16'h873 ? 16'h0a00 :  // <0353> "
addr == 16'h874 ? 16'h67a0 :  // <0353> av_ad_hi = 256
addr == 16'h875 ? 16'h0100 :  // <0353> "
addr == 16'h876 ? 16'h6b00 :  // <0353> av_ad_lo = ad0
addr == 16'h877 ? 16'h0417 :  // <0353> b = av_begin_read

addr == 16'h878 ? 16'h0418 :  // <0353> b = av_read_data

addr == 16'h879 ? 16'h0001 :  // <0357> a = b
addr == 16'h87a ? 16'h0407 :  // <0357> b = gb

addr == 16'h87b ? 16'he406 :  // <0354> bn gt :else_2171
addr == 16'h87c ? 16'h0882 :  // <0354> "

addr == 16'h87d ? 16'h6600 :  // <0355> ram $ram_afrc_rpm_col_idx = i // av_ad_hi = 0
addr == 16'h87e ? 16'h6aa0 :  // <0355> ram $ram_afrc_rpm_col_idx = i // av_ad_lo = 160
addr == 16'h87f ? 16'h5c02 :  // <0355> ram $ram_afrc_rpm_col_idx = i // av_write_data = i
addr == 16'h880 ? 16'he00f :  // <0356> jmp :rpm_found
addr == 16'h881 ? 16'h088d :  // <0356> "



addr == 16'h882 ? 16'h0002 :  // <0359> a = i
addr == 16'h883 ? 16'h0601 :  // <0359> b = 1
addr == 16'h884 ? 16'hc800 :  // <0359> i = a+b
addr == 16'h885 ? 16'h0b00 :  // <0359> "


addr == 16'h886 ? 16'h0002 :  // <0359> a = i
addr == 16'h887 ? 16'h0610 :  // <0359> b = $rpm_ref_num_cells
addr == 16'h888 ? 16'he005 :  // <0359> br lt :loop_2159
addr == 16'h889 ? 16'h0870 :  // <0359> "

// :end_2159 // = 0x088a
addr == 16'h88a ? 16'h6600 :  // <0360> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h88b ? 16'h6a80 :  // <0360> ram $ram_rpm_valid = 0 // av_ad_lo = 128
addr == 16'h88c ? 16'h5e00 :  // <0360> ram $ram_rpm_valid = 0 // av_write_data = 0
// :rpm_found // = 0x088d

addr == 16'h88d ? 16'he00f :  // <0362> end_event
addr == 16'h88e ? 16'h009e :  // <0362> "

// ######## func clear_ign_history // = 0x088f
addr == 16'h88f ? 16'h3002 :  // <0373> push i // func clear_ign_history

// invalidate the RPM estimate.
addr == 16'h890 ? 16'h6600 :  // <0366> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h891 ? 16'h6a80 :  // <0366> ram $ram_rpm_valid = 0 // av_ad_lo = 128
addr == 16'h892 ? 16'h5e00 :  // <0366> ram $ram_rpm_valid = 0 // av_write_data = 0
// the last known RPM estimate is retained here, not cleared.
// clear the history so it won't be valid again until several more valid samples are collected.
addr == 16'h893 ? 16'h6600 :  // <0369> ram $ram_ign_bad_samples = $ign_history_len // av_ad_hi = 0
addr == 16'h894 ? 16'h6a82 :  // <0369> ram $ram_ign_bad_samples = $ign_history_len // av_ad_lo = 130
addr == 16'h895 ? 16'h5e10 :  // <0369> ram $ram_ign_bad_samples = $ign_history_len // av_write_data = 16
addr == 16'h896 ? 16'h0a00 :  // <0372> i = 0
// :loop_2198 // = 0x0897

addr == 16'h897 ? 16'h0002 :  // <0370> a = i

addr == 16'h898 ? 16'h0351 :  // <0370> a = a<<1
addr == 16'h899 ? 16'h065c :  // <0370> b = 92
addr == 16'h89a ? 16'h6600 :  // <0370> av_ad_hi = 0
addr == 16'h89b ? 16'h6b00 :  // <0370> av_ad_lo = ad0

addr == 16'h89c ? 16'h5e00 :  // <0370> av_write_data = 0


addr == 16'h89d ? 16'h0002 :  // <0372> a = i
addr == 16'h89e ? 16'h0601 :  // <0372> b = 1
addr == 16'h89f ? 16'hc800 :  // <0372> i = a+b
addr == 16'h8a0 ? 16'h0b00 :  // <0372> "


addr == 16'h8a1 ? 16'h0002 :  // <0372> a = i
addr == 16'h8a2 ? 16'h0610 :  // <0372> b = $ign_history_len
addr == 16'h8a3 ? 16'he005 :  // <0372> br lt :loop_2198
addr == 16'h8a4 ? 16'h0897 :  // <0372> "

// :end_2198 // = 0x08a5

addr == 16'h8a5 ? 16'h080c :  // <0374> pop i // func clear_ign_history
addr == 16'h8a6 ? 16'hfc00 :  // <0374> swapra = nop

// ######## event ign_capture_timeout_handler // = 0x08a7
// it's been too long since the last ignition pulse detect.
addr == 16'h8a7 ? 16'hfba0 :  // <0377> callx clear_ign_history
addr == 16'h8a8 ? 16'h088f :  // <0377> "
addr == 16'h8a9 ? 16'hfc00 :  // <0377> "
addr == 16'h8aa ? 16'he00f :  // <0378> end_event
addr == 16'h8ab ? 16'h009e :  // <0378> "

// ######## event ustimer0_handler // = 0x08ac
addr == 16'h8ac ? 16'he00f :  // <0381> end_event
addr == 16'h8ad ? 16'h009e :  // <0381> "

// ######## event mstimer0_handler // = 0x08ae
// unified 1-second periodic timer for all low-resolution tasks.

// start timer again.
addr == 16'h8ae ? 16'h4fa0 :  // <0387> mstimer0 = 1000
addr == 16'h8af ? 16'h03e8 :  // <0387> "

// realtime counters in RAM.
addr == 16'h8b0 ? 16'h6600 :  // <0390> ram a = $ram_seconds_cnt // av_ad_hi = 0
addr == 16'h8b1 ? 16'h6a44 :  // <0390> ram a = $ram_seconds_cnt // av_ad_lo = 68
addr == 16'h8b2 ? 16'h0017 :  // <0390> ram a = $ram_seconds_cnt // a = av_write_data // start read cycle
addr == 16'h8b3 ? 16'h0018 :  // <0390> ram a = $ram_seconds_cnt // a = av_read_data // finish read cycle
addr == 16'h8b4 ? 16'h0601 :  // <0391> b = 1
addr == 16'h8b5 ? 16'hc800 :  // <0392> a = a+b
addr == 16'h8b6 ? 16'h0300 :  // <0392> "

addr == 16'h8b7 ? 16'h0000 :  // <0401> a = a
addr == 16'h8b8 ? 16'h063c :  // <0401> b = 60

addr == 16'h8b9 ? 16'he407 :  // <0393> bn eq :else_2233
addr == 16'h8ba ? 16'h08cc :  // <0393> "

addr == 16'h8bb ? 16'h6600 :  // <0394> ram $ram_seconds_cnt = 0 // av_ad_hi = 0
addr == 16'h8bc ? 16'h6a44 :  // <0394> ram $ram_seconds_cnt = 0 // av_ad_lo = 68
addr == 16'h8bd ? 16'h5e00 :  // <0394> ram $ram_seconds_cnt = 0 // av_write_data = 0
addr == 16'h8be ? 16'h6600 :  // <0395> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h8bf ? 16'h6a42 :  // <0395> ram a = $ram_minutes_cnt // av_ad_lo = 66
addr == 16'h8c0 ? 16'h0017 :  // <0395> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h8c1 ? 16'h0018 :  // <0395> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h8c2 ? 16'h0601 :  // <0396> b = 1
addr == 16'h8c3 ? 16'h6600 :  // <0397> ram $ram_minutes_cnt = a+b // av_ad_hi = 0
addr == 16'h8c4 ? 16'h6a42 :  // <0397> ram $ram_minutes_cnt = a+b // av_ad_lo = 66
addr == 16'h8c5 ? 16'hc800 :  // <0397> ram $ram_minutes_cnt = a+b // av_write_data = a+b
addr == 16'h8c6 ? 16'h5f00 :  // <0397> "
addr == 16'h8c7 ? 16'hfba0 :  // <0398> callx minute_events
addr == 16'h8c8 ? 16'h0b2d :  // <0398> "
addr == 16'h8c9 ? 16'hfc00 :  // <0398> "

addr == 16'h8ca ? 16'he00f :  // <0400> jmp :end_2233
addr == 16'h8cb ? 16'h08cf :  // <0400> "

addr == 16'h8cc ? 16'h6600 :  // <0401> ram $ram_seconds_cnt = a // av_ad_hi = 0
addr == 16'h8cd ? 16'h6a44 :  // <0401> ram $ram_seconds_cnt = a // av_ad_lo = 68
addr == 16'h8ce ? 16'h5c00 :  // <0401> ram $ram_seconds_cnt = a // av_write_data = a


// all 1-second functions here.
addr == 16'h8cf ? 16'hfba0 :  // <0404> callx check_power_relay
addr == 16'h8d0 ? 16'h0b35 :  // <0404> "
addr == 16'h8d1 ? 16'hfc00 :  // <0404> "
addr == 16'h8d2 ? 16'hfba0 :  // <0405> callx check_communication
addr == 16'h8d3 ? 16'h0b62 :  // <0405> "
addr == 16'h8d4 ? 16'hfc00 :  // <0405> "
addr == 16'h8d5 ? 16'hfba0 :  // <0406> callx start_daq_pass
addr == 16'h8d6 ? 16'h0966 :  // <0406> "
addr == 16'h8d7 ? 16'hfc00 :  // <0406> "
addr == 16'h8d8 ? 16'he00f :  // <0407> end_event
addr == 16'h8d9 ? 16'h009e :  // <0407> "

// :plan_transition_msg // = 0x08da
// "PLAN\x0"
addr == 16'h8da ? 16'h4c50 :  // <0410> LP
addr == 16'h8db ? 16'h4e41 :  // <0410> NA
addr == 16'h8dc ? 16'h0000 :  // <0410>   

// ######## event mstimer2_handler // = 0x08dd
// engine management plan tick timer.

// restart timer.
addr == 16'h8dd ? 16'h5614 :  // <0416> mstimer2 = $plan_tick_ms

// start another TPS reading prior to every plan tick.
// this will also invoke a o2 reading.  that's done last of all prior to plan_tick,
// so there's minimal latency between that and the plan_tick utilizing it.
addr == 16'h8de ? 16'h6600 :  // <0421> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h8df ? 16'h6a36 :  // <0421> ram a = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'h8e0 ? 16'h0017 :  // <0421> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h8e1 ? 16'h0018 :  // <0421> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle

addr == 16'h8e2 ? 16'h0000 :  // <0424> a = a
addr == 16'h8e3 ? 16'h0600 :  // <0424> b = 0

addr == 16'h8e4 ? 16'he407 :  // <0422> bn eq :else_2276
addr == 16'h8e5 ? 16'h08ea :  // <0422> "

addr == 16'h8e6 ? 16'h2206 :  // <0423> pa = 6
addr == 16'h8e7 ? 16'hfba0 :  // <0423> callx  begin_adc_conversion  $tps_adc_channel
addr == 16'h8e8 ? 16'h0a49 :  // <0423> "
addr == 16'h8e9 ? 16'hfc00 :  // <0423> "

addr == 16'h8ea ? 16'he00f :  // <0425> end_event
addr == 16'h8eb ? 16'h009e :  // <0425> "

// ######## func plan_tick // = 0x08ec
addr == 16'h8ec ? 16'h3004 :  // <0442> push x // func plan_tick
addr == 16'h8ed ? 16'h303e :  // <0442> push rtna // "

// poll the engine management plan.
// call the transition function for the current plan.
// this might perform a transition to some other plan, so it's done first.
addr == 16'h8ee ? 16'h6600 :  // <0431> ram rtna = $ram_transition_func // av_ad_hi = 0
addr == 16'h8ef ? 16'h6a8e :  // <0431> ram rtna = $ram_transition_func // av_ad_lo = 142
addr == 16'h8f0 ? 16'hf817 :  // <0431> ram rtna = $ram_transition_func // rtna = av_write_data // start read cycle
addr == 16'h8f1 ? 16'hf818 :  // <0431> ram rtna = $ram_transition_func // rtna = av_read_data // finish read cycle
addr == 16'h8f2 ? 16'h103e :  // <0432> x = rtna
addr == 16'h8f3 ? 16'hfc00 :  // <0433> swapra = nop
addr == 16'h8f4 ? 16'h6600 :  // <0435> ram b = $ram_transition_func // av_ad_hi = 0
addr == 16'h8f5 ? 16'h6a8e :  // <0435> ram b = $ram_transition_func // av_ad_lo = 142
addr == 16'h8f6 ? 16'h0417 :  // <0435> ram b = $ram_transition_func // b = av_write_data // start read cycle
addr == 16'h8f7 ? 16'h0418 :  // <0435> ram b = $ram_transition_func // b = av_read_data // finish read cycle

addr == 16'h8f8 ? 16'h0004 :  // <0438> a = x
addr == 16'h8f9 ? 16'h0401 :  // <0438> b = b

addr == 16'h8fa ? 16'he007 :  // <0436> br eq :else_2298
addr == 16'h8fb ? 16'h0901 :  // <0436> "

addr == 16'h8fc ? 16'h23a0 :  // <0437> pa = :plan_transition_msg
addr == 16'h8fd ? 16'h08da :  // <0437> "
addr == 16'h8fe ? 16'hfba0 :  // <0437> callx  set_text_flag  :plan_transition_msg
addr == 16'h8ff ? 16'h0bc0 :  // <0437> "
addr == 16'h900 ? 16'hfc00 :  // <0437> "

// call the puff length function for the current plan.
// this is done last, so if a plan transition just happened, its new puff length will init here.
addr == 16'h901 ? 16'h6600 :  // <0441> ram rtna = $ram_puff_len_func // av_ad_hi = 0
addr == 16'h902 ? 16'h6a8c :  // <0441> ram rtna = $ram_puff_len_func // av_ad_lo = 140
addr == 16'h903 ? 16'hf817 :  // <0441> ram rtna = $ram_puff_len_func // rtna = av_write_data // start read cycle
addr == 16'h904 ? 16'hf818 :  // <0441> ram rtna = $ram_puff_len_func // rtna = av_read_data // finish read cycle
addr == 16'h905 ? 16'hfc00 :  // <0442> swapra = nop

addr == 16'h906 ? 16'hf80c :  // <0445> pop rtna // func plan_tick
addr == 16'h907 ? 16'h100c :  // <0445> pop x // "
addr == 16'h908 ? 16'hfc00 :  // <0445> swapra = nop

// ######## event uart_rx_handler // = 0x0909
// :again // = 0x0909
addr == 16'h909 ? 16'hfba0 :  // <0448> pollchar
addr == 16'h90a ? 16'h00ba :  // <0448> "
addr == 16'h90b ? 16'hfc00 :  // <0448> "
addr == 16'h90c ? 16'h1000 :  // <0449> x = a

addr == 16'h90d ? 16'h0004 :  // <0452> a = x
addr == 16'h90e ? 16'h0760 :  // <0452> b = -1

addr == 16'h90f ? 16'he407 :  // <0450> bn eq :else_2319
addr == 16'h910 ? 16'h0913 :  // <0450> "

addr == 16'h911 ? 16'he00f :  // <0451> event_return
addr == 16'h912 ? 16'h009e :  // <0451> "


addr == 16'h913 ? 16'h0004 :  // <0455> a = x
addr == 16'h914 ? 16'h060a :  // <0455> b = 10

addr == 16'h915 ? 16'he407 :  // <0453> bn eq :else_2325
addr == 16'h916 ? 16'h091a :  // <0453> "

addr == 16'h917 ? 16'hfba0 :  // <0454> callx  postpone_comm_restart
addr == 16'h918 ? 16'h0b8f :  // <0454> "
addr == 16'h919 ? 16'hfc00 :  // <0454> "

addr == 16'h91a ? 16'h2004 :  // <0456> pa = x
addr == 16'h91b ? 16'hfba0 :  // <0456> callx  parse_key  x
addr == 16'h91c ? 16'h03a2 :  // <0456> "
addr == 16'h91d ? 16'hfc00 :  // <0456> "
addr == 16'h91e ? 16'he00f :  // <0457> jmp :again
addr == 16'h91f ? 16'h0909 :  // <0457> "
addr == 16'h920 ? 16'he00f :  // <0458> end_event
addr == 16'h921 ? 16'h009e :  // <0458> "

// ######## event uart_rx_overflow_handler // = 0x0922
addr == 16'h922 ? 16'h7fa0 :  // <0461> error_halt_code $err_rx_overflow // leds = 0xfffe
addr == 16'h923 ? 16'hfffe :  // <0461> "
addr == 16'h924 ? 16'he00f :  // <0461> error_halt_code $err_rx_overflow
addr == 16'h925 ? 16'h0924 :  // <0461> "
addr == 16'h926 ? 16'he00f :  // <0462> end_event
addr == 16'h927 ? 16'h009e :  // <0462> "

// :tx_overflow_msg // = 0x0928
// "TXO\x0"
addr == 16'h928 ? 16'h5854 :  // <0465> XT
addr == 16'h929 ? 16'h004f :  // <0465>  O

// ######## event uart_tx_overflow_handler // = 0x092a
// error_halt_code $err_tx_overflow
addr == 16'h92a ? 16'h23a0 :  // <0469> pa = :tx_overflow_msg
addr == 16'h92b ? 16'h0928 :  // <0469> "
addr == 16'h92c ? 16'hfba0 :  // <0469> callx  set_text_flag  :tx_overflow_msg
addr == 16'h92d ? 16'h0bc0 :  // <0469> "
addr == 16'h92e ? 16'hfc00 :  // <0469> "
addr == 16'h92f ? 16'he00f :  // <0470> end_event
addr == 16'h930 ? 16'h009e :  // <0470> "

// ######## event key0_handler // = 0x0931
addr == 16'h931 ? 16'h026b :  // <0473> a = 107 // putasc "k"
addr == 16'h932 ? 16'hfba0 :  // <0473> putasc "k"
addr == 16'h933 ? 16'h00ab :  // <0473> "
addr == 16'h934 ? 16'hfc00 :  // <0473> "
addr == 16'h935 ? 16'h0230 :  // <0474> a = 48 // putasc "0"
addr == 16'h936 ? 16'hfba0 :  // <0474> putasc "0"
addr == 16'h937 ? 16'h00ab :  // <0474> "
addr == 16'h938 ? 16'hfc00 :  // <0474> "
addr == 16'h939 ? 16'he00f :  // <0475> end_event
addr == 16'h93a ? 16'h009e :  // <0475> "

// ######## event key1_handler // = 0x093b
addr == 16'h93b ? 16'h026b :  // <0478> a = 107 // putasc "k"
addr == 16'h93c ? 16'hfba0 :  // <0478> putasc "k"
addr == 16'h93d ? 16'h00ab :  // <0478> "
addr == 16'h93e ? 16'hfc00 :  // <0478> "
addr == 16'h93f ? 16'h0231 :  // <0479> a = 49 // putasc "1"
addr == 16'h940 ? 16'hfba0 :  // <0479> putasc "1"
addr == 16'h941 ? 16'h00ab :  // <0479> "
addr == 16'h942 ? 16'hfc00 :  // <0479> "
addr == 16'h943 ? 16'he00f :  // <0480> end_event
addr == 16'h944 ? 16'h009e :  // <0480> "

// ######## event softevent3_handler // = 0x0945
addr == 16'h945 ? 16'he00f :  // <0483> end_event
addr == 16'h946 ? 16'h009e :  // <0483> "

// ######## event softevent2_handler // = 0x0947
addr == 16'h947 ? 16'he00f :  // <0486> end_event
addr == 16'h948 ? 16'h009e :  // <0486> "

// ######## event softevent1_handler // = 0x0949
addr == 16'h949 ? 16'he00f :  // <0489> end_event
addr == 16'h94a ? 16'h009e :  // <0489> "

// ######## event softevent0_handler // = 0x094b
addr == 16'h94b ? 16'he00f :  // <0492> end_event
addr == 16'h94c ? 16'h009e :  // <0492> "

// :rpm_msg // = 0x094d
// ": rpm=\x0"
addr == 16'h94d ? 16'h203a :  // <0495>  :
addr == 16'h94e ? 16'h7072 :  // <0495> pr
addr == 16'h94f ? 16'h3d6d :  // <0495> =m
addr == 16'h950 ? 16'h0000 :  // <0495>   

// :puff_len_msg // = 0x0951
// " pfl=\x0"
addr == 16'h951 ? 16'h7020 :  // <0498> p 
addr == 16'h952 ? 16'h6c66 :  // <0498> lf
addr == 16'h953 ? 16'h003d :  // <0498>  =

// :afrc_coords_msg // = 0x0954
// " map=\x0"
addr == 16'h954 ? 16'h6d20 :  // <0501> m 
addr == 16'h955 ? 16'h7061 :  // <0501> pa
addr == 16'h956 ? 16'h003d :  // <0501>  =

// :o2_msg // = 0x0957
// " o2=\x0"
addr == 16'h957 ? 16'h6f20 :  // <0504> o 
addr == 16'h958 ? 16'h3d32 :  // <0504> =2
addr == 16'h959 ? 16'h0000 :  // <0504>   

// :maf_msg // = 0x095a
// " af=\x0"
addr == 16'h95a ? 16'h6120 :  // <0507> a 
addr == 16'h95b ? 16'h3d66 :  // <0507> =f
addr == 16'h95c ? 16'h0000 :  // <0507>   

// :tps_msg // = 0x095d
// " tp=\x0"
addr == 16'h95d ? 16'h7420 :  // <0510> t 
addr == 16'h95e ? 16'h3d70 :  // <0510> =p
addr == 16'h95f ? 16'h0000 :  // <0510>   

// :block_temp_idx_msg // = 0x0960
// " bti=\x0"
addr == 16'h960 ? 16'h6220 :  // <0513> b 
addr == 16'h961 ? 16'h6974 :  // <0513> it
addr == 16'h962 ? 16'h003d :  // <0513>  =

// :afterstart_idx_msg // = 0x0963
// " asi=\x0"
addr == 16'h963 ? 16'h6120 :  // <0516> a 
addr == 16'h964 ? 16'h6973 :  // <0516> is
addr == 16'h965 ? 16'h003d :  // <0516>  =

// ######## func start_daq_pass // = 0x0966
addr == 16'h966 ? 16'h3002 :  // <0594> push i // func start_daq_pass
addr == 16'h967 ? 16'h3004 :  // <0594> push x // "
addr == 16'h968 ? 16'h303e :  // <0594> push rtna // "

// daq pass counter in RAM.
addr == 16'h969 ? 16'h6600 :  // <0520> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h96a ? 16'h6a14 :  // <0520> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h96b ? 16'h0017 :  // <0520> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h96c ? 16'h0018 :  // <0520> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h96d ? 16'h0601 :  // <0521> b = 1
addr == 16'h96e ? 16'hc800 :  // <0522> a = a+b
addr == 16'h96f ? 16'h0300 :  // <0522> "
addr == 16'h970 ? 16'h0800 :  // <0523> i = a
addr == 16'h971 ? 16'h7c02 :  // <0524> leds = i
addr == 16'h972 ? 16'h6600 :  // <0525> ram $ram_daq_pass_cnt = i // av_ad_hi = 0
addr == 16'h973 ? 16'h6a14 :  // <0525> ram $ram_daq_pass_cnt = i // av_ad_lo = 20
addr == 16'h974 ? 16'h5c02 :  // <0525> ram $ram_daq_pass_cnt = i // av_write_data = i

addr == 16'h975 ? 16'h6600 :  // <0527> ram a = $ram_enable_status_report // av_ad_hi = 0
addr == 16'h976 ? 16'h6a3c :  // <0527> ram a = $ram_enable_status_report // av_ad_lo = 60
addr == 16'h977 ? 16'h0017 :  // <0527> ram a = $ram_enable_status_report // a = av_write_data // start read cycle
addr == 16'h978 ? 16'h0018 :  // <0527> ram a = $ram_enable_status_report // a = av_read_data // finish read cycle

addr == 16'h979 ? 16'h0000 :  // <0584> a = a
addr == 16'h97a ? 16'h0600 :  // <0584> b = 0

addr == 16'h97b ? 16'he007 :  // <0528> br eq :else_2427
addr == 16'h97c ? 16'h0a0e :  // <0528> "

addr == 16'h97d ? 16'h0002 :  // <0529> a = i
addr == 16'h97e ? 16'hfba0 :  // <0530> call :put4x
addr == 16'h97f ? 16'h00d3 :  // <0530> "
addr == 16'h980 ? 16'hfc00 :  // <0530> "

addr == 16'h981 ? 16'h03a0 :  // <0532> a = :rpm_msg
addr == 16'h982 ? 16'h094d :  // <0532> "
addr == 16'h983 ? 16'hfba0 :  // <0533> call :print_nt
addr == 16'h984 ? 16'h015f :  // <0533> "
addr == 16'h985 ? 16'hfc00 :  // <0533> "
addr == 16'h986 ? 16'h0200 :  // <0534> a = 0
addr == 16'h987 ? 16'h6600 :  // <0535> ram x = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h988 ? 16'h6a80 :  // <0535> ram x = $ram_rpm_valid // av_ad_lo = 128
addr == 16'h989 ? 16'h1017 :  // <0535> ram x = $ram_rpm_valid // x = av_write_data // start read cycle
addr == 16'h98a ? 16'h1018 :  // <0535> ram x = $ram_rpm_valid // x = av_read_data // finish read cycle

addr == 16'h98b ? 16'h0004 :  // <0538> a = x
addr == 16'h98c ? 16'h0600 :  // <0538> b = 0

addr == 16'h98d ? 16'he007 :  // <0536> br eq :else_2445
addr == 16'h98e ? 16'h0993 :  // <0536> "

addr == 16'h98f ? 16'h6600 :  // <0537> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h990 ? 16'h6a7e :  // <0537> ram a = $ram_avg_rpm // av_ad_lo = 126
addr == 16'h991 ? 16'h0017 :  // <0537> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h992 ? 16'h0018 :  // <0537> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle

addr == 16'h993 ? 16'hfba0 :  // <0539> call :put4x
addr == 16'h994 ? 16'h00d3 :  // <0539> "
addr == 16'h995 ? 16'hfc00 :  // <0539> "

addr == 16'h996 ? 16'h03a0 :  // <0541> a = :puff_len_msg
addr == 16'h997 ? 16'h0951 :  // <0541> "
addr == 16'h998 ? 16'hfba0 :  // <0542> call :print_nt
addr == 16'h999 ? 16'h015f :  // <0542> "
addr == 16'h99a ? 16'hfc00 :  // <0542> "
addr == 16'h99b ? 16'h0025 :  // <0543> a = puff_len_us
addr == 16'h99c ? 16'hfba0 :  // <0544> call :put4x
addr == 16'h99d ? 16'h00d3 :  // <0544> "
addr == 16'h99e ? 16'hfc00 :  // <0544> "
addr == 16'h99f ? 16'h022c :  // <0545> a = 44 // putasc ","
addr == 16'h9a0 ? 16'hfba0 :  // <0545> putasc ","
addr == 16'h9a1 ? 16'h00ab :  // <0545> "
addr == 16'h9a2 ? 16'hfc00 :  // <0545> "
addr == 16'h9a3 ? 16'h6600 :  // <0546> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h9a4 ? 16'h6a94 :  // <0546> ram a = $ram_puff_count // av_ad_lo = 148
addr == 16'h9a5 ? 16'h0017 :  // <0546> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h9a6 ? 16'h0018 :  // <0546> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h9a7 ? 16'hfba0 :  // <0547> call :put4x
addr == 16'h9a8 ? 16'h00d3 :  // <0547> "
addr == 16'h9a9 ? 16'hfc00 :  // <0547> "

addr == 16'h9aa ? 16'h03a0 :  // <0549> a = :afrc_coords_msg
addr == 16'h9ab ? 16'h0954 :  // <0549> "
addr == 16'h9ac ? 16'hfba0 :  // <0550> call :print_nt
addr == 16'h9ad ? 16'h015f :  // <0550> "
addr == 16'h9ae ? 16'hfc00 :  // <0550> "
addr == 16'h9af ? 16'h6600 :  // <0551> ram a = $ram_afrc_rpm_col_idx // av_ad_hi = 0
addr == 16'h9b0 ? 16'h6aa0 :  // <0551> ram a = $ram_afrc_rpm_col_idx // av_ad_lo = 160
addr == 16'h9b1 ? 16'h0017 :  // <0551> ram a = $ram_afrc_rpm_col_idx // a = av_write_data // start read cycle
addr == 16'h9b2 ? 16'h0018 :  // <0551> ram a = $ram_afrc_rpm_col_idx // a = av_read_data // finish read cycle
addr == 16'h9b3 ? 16'hfba0 :  // <0552> call :put4x
addr == 16'h9b4 ? 16'h00d3 :  // <0552> "
addr == 16'h9b5 ? 16'hfc00 :  // <0552> "
addr == 16'h9b6 ? 16'h022c :  // <0553> a = 44 // putasc ","
addr == 16'h9b7 ? 16'hfba0 :  // <0553> putasc ","
addr == 16'h9b8 ? 16'h00ab :  // <0553> "
addr == 16'h9b9 ? 16'hfc00 :  // <0553> "
addr == 16'h9ba ? 16'h6600 :  // <0554> ram a = $ram_afrc_maf_row_idx // av_ad_hi = 0
addr == 16'h9bb ? 16'h6a9e :  // <0554> ram a = $ram_afrc_maf_row_idx // av_ad_lo = 158
addr == 16'h9bc ? 16'h0017 :  // <0554> ram a = $ram_afrc_maf_row_idx // a = av_write_data // start read cycle
addr == 16'h9bd ? 16'h0018 :  // <0554> ram a = $ram_afrc_maf_row_idx // a = av_read_data // finish read cycle
addr == 16'h9be ? 16'hfba0 :  // <0555> call :put4x
addr == 16'h9bf ? 16'h00d3 :  // <0555> "
addr == 16'h9c0 ? 16'hfc00 :  // <0555> "

addr == 16'h9c1 ? 16'h03a0 :  // <0557> a = :o2_msg
addr == 16'h9c2 ? 16'h0957 :  // <0557> "
addr == 16'h9c3 ? 16'hfba0 :  // <0558> call :print_nt
addr == 16'h9c4 ? 16'h015f :  // <0558> "
addr == 16'h9c5 ? 16'hfc00 :  // <0558> "
addr == 16'h9c6 ? 16'h0205 :  // <0559> a = 5

addr == 16'h9c7 ? 16'h0351 :  // <0559> a = a<<1
addr == 16'h9c8 ? 16'h0626 :  // <0559> b = 38
addr == 16'h9c9 ? 16'h6600 :  // <0559> av_ad_hi = 0
addr == 16'h9ca ? 16'h6b00 :  // <0559> av_ad_lo = ad0
addr == 16'h9cb ? 16'h0417 :  // <0559> b = av_begin_read

addr == 16'h9cc ? 16'h0018 :  // <0559> a = av_read_data
addr == 16'h9cd ? 16'hfba0 :  // <0560> call :put4x
addr == 16'h9ce ? 16'h00d3 :  // <0560> "
addr == 16'h9cf ? 16'hfc00 :  // <0560> "

addr == 16'h9d0 ? 16'h03a0 :  // <0562> a = :maf_msg
addr == 16'h9d1 ? 16'h095a :  // <0562> "
addr == 16'h9d2 ? 16'hfba0 :  // <0563> call :print_nt
addr == 16'h9d3 ? 16'h015f :  // <0563> "
addr == 16'h9d4 ? 16'hfc00 :  // <0563> "
addr == 16'h9d5 ? 16'h6600 :  // <0564> ram a = $ram_maf_adc_filtered // av_ad_hi = 0
addr == 16'h9d6 ? 16'h6a9a :  // <0564> ram a = $ram_maf_adc_filtered // av_ad_lo = 154
addr == 16'h9d7 ? 16'h0017 :  // <0564> ram a = $ram_maf_adc_filtered // a = av_write_data // start read cycle
addr == 16'h9d8 ? 16'h0018 :  // <0564> ram a = $ram_maf_adc_filtered // a = av_read_data // finish read cycle
addr == 16'h9d9 ? 16'hfba0 :  // <0565> call :put4x
addr == 16'h9da ? 16'h00d3 :  // <0565> "
addr == 16'h9db ? 16'hfc00 :  // <0565> "

addr == 16'h9dc ? 16'h03a0 :  // <0567> a = :tps_msg
addr == 16'h9dd ? 16'h095d :  // <0567> "
addr == 16'h9de ? 16'hfba0 :  // <0568> call :print_nt
addr == 16'h9df ? 16'h015f :  // <0568> "
addr == 16'h9e0 ? 16'hfc00 :  // <0568> "
addr == 16'h9e1 ? 16'h0206 :  // <0569> a = 6

addr == 16'h9e2 ? 16'h0351 :  // <0569> a = a<<1
addr == 16'h9e3 ? 16'h0626 :  // <0569> b = 38
addr == 16'h9e4 ? 16'h6600 :  // <0569> av_ad_hi = 0
addr == 16'h9e5 ? 16'h6b00 :  // <0569> av_ad_lo = ad0
addr == 16'h9e6 ? 16'h0417 :  // <0569> b = av_begin_read

addr == 16'h9e7 ? 16'h0018 :  // <0569> a = av_read_data
addr == 16'h9e8 ? 16'hfba0 :  // <0570> call :put4x
addr == 16'h9e9 ? 16'h00d3 :  // <0570> "
addr == 16'h9ea ? 16'hfc00 :  // <0570> "
addr == 16'h9eb ? 16'h022c :  // <0571> a = 44 // putasc ","
addr == 16'h9ec ? 16'hfba0 :  // <0571> putasc ","
addr == 16'h9ed ? 16'h00ab :  // <0571> "
addr == 16'h9ee ? 16'hfc00 :  // <0571> "
addr == 16'h9ef ? 16'h6600 :  // <0572> ram a = $ram_tps_avg // av_ad_hi = 0
addr == 16'h9f0 ? 16'h6ab0 :  // <0572> ram a = $ram_tps_avg // av_ad_lo = 176
addr == 16'h9f1 ? 16'h0017 :  // <0572> ram a = $ram_tps_avg // a = av_write_data // start read cycle
addr == 16'h9f2 ? 16'h0018 :  // <0572> ram a = $ram_tps_avg // a = av_read_data // finish read cycle
addr == 16'h9f3 ? 16'hfba0 :  // <0573> call :put4x
addr == 16'h9f4 ? 16'h00d3 :  // <0573> "
addr == 16'h9f5 ? 16'hfc00 :  // <0573> "

addr == 16'h9f6 ? 16'h03a0 :  // <0575> a = :block_temp_idx_msg
addr == 16'h9f7 ? 16'h0960 :  // <0575> "
addr == 16'h9f8 ? 16'hfba0 :  // <0576> call :print_nt
addr == 16'h9f9 ? 16'h015f :  // <0576> "
addr == 16'h9fa ? 16'hfc00 :  // <0576> "
addr == 16'h9fb ? 16'h6600 :  // <0577> ram a = $ram_block_temp_map_idx // av_ad_hi = 0
addr == 16'h9fc ? 16'h6aa2 :  // <0577> ram a = $ram_block_temp_map_idx // av_ad_lo = 162
addr == 16'h9fd ? 16'h0017 :  // <0577> ram a = $ram_block_temp_map_idx // a = av_write_data // start read cycle
addr == 16'h9fe ? 16'h0018 :  // <0577> ram a = $ram_block_temp_map_idx // a = av_read_data // finish read cycle
addr == 16'h9ff ? 16'hfba0 :  // <0578> call :put4x
addr == 16'ha00 ? 16'h00d3 :  // <0578> "
addr == 16'ha01 ? 16'hfc00 :  // <0578> "

addr == 16'ha02 ? 16'h03a0 :  // <0580> a = :afterstart_idx_msg
addr == 16'ha03 ? 16'h0963 :  // <0580> "
addr == 16'ha04 ? 16'hfba0 :  // <0581> call :print_nt
addr == 16'ha05 ? 16'h015f :  // <0581> "
addr == 16'ha06 ? 16'hfc00 :  // <0581> "
addr == 16'ha07 ? 16'h6600 :  // <0582> ram a = $ram_afterstart_map_idx // av_ad_hi = 0
addr == 16'ha08 ? 16'h6aa6 :  // <0582> ram a = $ram_afterstart_map_idx // av_ad_lo = 166
addr == 16'ha09 ? 16'h0017 :  // <0582> ram a = $ram_afterstart_map_idx // a = av_write_data // start read cycle
addr == 16'ha0a ? 16'h0018 :  // <0582> ram a = $ram_afterstart_map_idx // a = av_read_data // finish read cycle
addr == 16'ha0b ? 16'hfba0 :  // <0583> call :put4x
addr == 16'ha0c ? 16'h00d3 :  // <0583> "
addr == 16'ha0d ? 16'hfc00 :  // <0583> "


// start to acquire & report all anmux channels.
addr == 16'ha0e ? 16'h0207 :  // <0587> a = ($anmux_num_channels - 1)
addr == 16'ha0f ? 16'hfba0 :  // <0588> call :anmux_set_chn
addr == 16'ha10 ? 16'h00c2 :  // <0588> "
addr == 16'ha11 ? 16'hfc00 :  // <0588> "
addr == 16'ha12 ? 16'h5205 :  // <0589> mstimer1 = $anmux_settle_ms

// observe MCU utilization.  this RAM variable can be seen by the debugger.
addr == 16'ha13 ? 16'h6600 :  // <0592> ram $ram_mcu_usage_cnt = usage_count // av_ad_hi = 0
addr == 16'ha14 ? 16'h6a46 :  // <0592> ram $ram_mcu_usage_cnt = usage_count // av_ad_lo = 70
addr == 16'ha15 ? 16'h5c0f :  // <0592> ram $ram_mcu_usage_cnt = usage_count // av_write_data = usage_count
addr == 16'ha16 ? 16'h3e00 :  // <0593> usage_count = 0

addr == 16'ha17 ? 16'hf80c :  // <0595> pop rtna // func start_daq_pass
addr == 16'ha18 ? 16'h100c :  // <0595> pop x // "
addr == 16'ha19 ? 16'h080c :  // <0595> pop i // "
addr == 16'ha1a ? 16'hfc00 :  // <0595> swapra = nop

// ######## event mstimer1_handler // = 0x0a1b
// anmux signal has settled.

addr == 16'ha1b ? 16'h6600 :  // <0599> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'ha1c ? 16'h6a36 :  // <0599> ram a = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'ha1d ? 16'h0017 :  // <0599> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'ha1e ? 16'h0018 :  // <0599> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle

addr == 16'ha1f ? 16'h0000 :  // <0604> a = a
addr == 16'ha20 ? 16'h0600 :  // <0604> b = 0

addr == 16'ha21 ? 16'he007 :  // <0600> br eq :else_2593
addr == 16'ha22 ? 16'h0a26 :  // <0600> "

// ADC is busy right now.  wait a while & try again.
addr == 16'ha23 ? 16'h5202 :  // <0602> mstimer1 = $anmux_retry_ms
addr == 16'ha24 ? 16'he00f :  // <0603> event_return
addr == 16'ha25 ? 16'h009e :  // <0603> "


// start a reading from the current anmux channel.
addr == 16'ha26 ? 16'h6600 :  // <0607> ram a = $ram_enable_status_report // av_ad_hi = 0
addr == 16'ha27 ? 16'h6a3c :  // <0607> ram a = $ram_enable_status_report // av_ad_lo = 60
addr == 16'ha28 ? 16'h0017 :  // <0607> ram a = $ram_enable_status_report // a = av_write_data // start read cycle
addr == 16'ha29 ? 16'h0018 :  // <0607> ram a = $ram_enable_status_report // a = av_read_data // finish read cycle

addr == 16'ha2a ? 16'h0000 :  // <0615> a = a
addr == 16'ha2b ? 16'h0600 :  // <0615> b = 0

addr == 16'ha2c ? 16'he007 :  // <0608> br eq :else_2604
addr == 16'ha2d ? 16'h0a43 :  // <0608> "

addr == 16'ha2e ? 16'h0220 :  // <0609> a = 32 // putasc " "
addr == 16'ha2f ? 16'hfba0 :  // <0609> putasc " "
addr == 16'ha30 ? 16'h00ab :  // <0609> "
addr == 16'ha31 ? 16'hfc00 :  // <0609> "
addr == 16'ha32 ? 16'h0273 :  // <0610> a = 115 // putasc "s"
addr == 16'ha33 ? 16'hfba0 :  // <0610> putasc "s"
addr == 16'ha34 ? 16'h00ab :  // <0610> "
addr == 16'ha35 ? 16'hfc00 :  // <0610> "
addr == 16'ha36 ? 16'hfba0 :  // <0611> call :anmux_get_chn
addr == 16'ha37 ? 16'h00c6 :  // <0611> "
addr == 16'ha38 ? 16'hfc00 :  // <0611> "
addr == 16'ha39 ? 16'h0630 :  // <0612> b = 48 // asc b = "0"
addr == 16'ha3a ? 16'hc800 :  // <0613> a = a+b // putchar a+b
addr == 16'ha3b ? 16'h0300 :  // <0613> "
addr == 16'ha3c ? 16'hfba0 :  // <0613> putchar a+b
addr == 16'ha3d ? 16'h00ab :  // <0613> "
addr == 16'ha3e ? 16'hfc00 :  // <0613> "
addr == 16'ha3f ? 16'h023d :  // <0614> a = 61 // putasc "="
addr == 16'ha40 ? 16'hfba0 :  // <0614> putasc "="
addr == 16'ha41 ? 16'h00ab :  // <0614> "
addr == 16'ha42 ? 16'hfc00 :  // <0614> "

addr == 16'ha43 ? 16'h2207 :  // <0616> pa = 7
addr == 16'ha44 ? 16'hfba0 :  // <0616> callx  begin_adc_conversion  $anmux_adc_channel
addr == 16'ha45 ? 16'h0a49 :  // <0616> "
addr == 16'ha46 ? 16'hfc00 :  // <0616> "
addr == 16'ha47 ? 16'he00f :  // <0617> end_event
addr == 16'ha48 ? 16'h009e :  // <0617> "

// ######## func begin_adc_conversion // = 0x0a49

// begin SPI transaction, specifying Nano ADC channel to take effect NEXT
// conversion after this one.

addr == 16'ha49 ? 16'h6600 :  // <0623> ram $ram_adc_chn_pending = next_channel // av_ad_hi = 0
addr == 16'ha4a ? 16'h6a36 :  // <0623> ram $ram_adc_chn_pending = next_channel // av_ad_lo = 54
addr == 16'ha4b ? 16'h5c08 :  // <0623> ram $ram_adc_chn_pending = next_channel // av_write_data = next_channel
addr == 16'ha4c ? 16'h0008 :  // <0624> a = next_channel
addr == 16'ha4d ? 16'h0352 :  // <0625> a = a<<4
addr == 16'ha4e ? 16'h0352 :  // <0626> a = a<<4
addr == 16'ha4f ? 16'h0351 :  // <0627> a = a<<1
addr == 16'ha50 ? 16'h0351 :  // <0628> a = a<<1
addr == 16'ha51 ? 16'h0351 :  // <0629> a = a<<1
addr == 16'ha52 ? 16'h5800 :  // <0630> spi_data = a
addr == 16'ha53 ? 16'h6600 :  // <0631> ram $ram_adc_junk = 1 // av_ad_hi = 0
addr == 16'ha54 ? 16'h6a38 :  // <0631> ram $ram_adc_junk = 1 // av_ad_lo = 56
addr == 16'ha55 ? 16'h5e01 :  // <0631> ram $ram_adc_junk = 1 // av_write_data = 1

addr == 16'ha56 ? 16'hfc00 :  // <0633> swapra = nop

// ######## event spi_done_handler // = 0x0a57
// discard the results of the first SPI exchange with the ADC.  that's only for writing the channel num out to the ADC.
addr == 16'ha57 ? 16'h6600 :  // <0636> ram a = $ram_adc_junk // av_ad_hi = 0
addr == 16'ha58 ? 16'h6a38 :  // <0636> ram a = $ram_adc_junk // av_ad_lo = 56
addr == 16'ha59 ? 16'h0017 :  // <0636> ram a = $ram_adc_junk // a = av_write_data // start read cycle
addr == 16'ha5a ? 16'h0018 :  // <0636> ram a = $ram_adc_junk // a = av_read_data // finish read cycle

addr == 16'ha5b ? 16'h0000 :  // <0648> a = a
addr == 16'ha5c ? 16'h0600 :  // <0648> b = 0

addr == 16'ha5d ? 16'he007 :  // <0637> br eq :else_2653
addr == 16'ha5e ? 16'h0a6e :  // <0637> "

// start another SPI exchange to retrieve the actual reading.
addr == 16'ha5f ? 16'h6600 :  // <0639> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'ha60 ? 16'h6a36 :  // <0639> ram a = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'ha61 ? 16'h0017 :  // <0639> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'ha62 ? 16'h0018 :  // <0639> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle
addr == 16'ha63 ? 16'h0352 :  // <0640> a = a<<4
addr == 16'ha64 ? 16'h0352 :  // <0641> a = a<<4
addr == 16'ha65 ? 16'h0351 :  // <0642> a = a<<1
addr == 16'ha66 ? 16'h0351 :  // <0643> a = a<<1
addr == 16'ha67 ? 16'h0351 :  // <0644> a = a<<1
addr == 16'ha68 ? 16'h5800 :  // <0645> spi_data = a
addr == 16'ha69 ? 16'h6600 :  // <0646> ram $ram_adc_junk = 0 // av_ad_hi = 0
addr == 16'ha6a ? 16'h6a38 :  // <0646> ram $ram_adc_junk = 0 // av_ad_lo = 56
addr == 16'ha6b ? 16'h5e00 :  // <0646> ram $ram_adc_junk = 0 // av_write_data = 0
addr == 16'ha6c ? 16'he00f :  // <0647> event_return
addr == 16'ha6d ? 16'h009e :  // <0647> "


// memorize an actual ADC reading.
addr == 16'ha6e ? 16'h6600 :  // <0651> ram i = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'ha6f ? 16'h6a36 :  // <0651> ram i = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'ha70 ? 16'h0817 :  // <0651> ram i = $ram_adc_chn_pending // i = av_write_data // start read cycle
addr == 16'ha71 ? 16'h0818 :  // <0651> ram i = $ram_adc_chn_pending // i = av_read_data // finish read cycle
addr == 16'ha72 ? 16'h6600 :  // <0652> ram $ram_adc_chn_pending = 0 // av_ad_hi = 0
addr == 16'ha73 ? 16'h6a36 :  // <0652> ram $ram_adc_chn_pending = 0 // av_ad_lo = 54
addr == 16'ha74 ? 16'h5e00 :  // <0652> ram $ram_adc_chn_pending = 0 // av_write_data = 0
addr == 16'ha75 ? 16'h3016 :  // <0653> push spi_data // push spi_data
addr == 16'ha76 ? 16'h0002 :  // <0653> a = i

addr == 16'ha77 ? 16'h0351 :  // <0653> a = a<<1
addr == 16'ha78 ? 16'h0626 :  // <0653> b = 38
addr == 16'ha79 ? 16'h6600 :  // <0653> av_ad_hi = 0
addr == 16'ha7a ? 16'h6b00 :  // <0653> av_ad_lo = ad0

addr == 16'ha7b ? 16'h5c0c :  // <0653> pop av_write_data // pop av_write_data

// react to ADC reading.

addr == 16'ha7c ? 16'h0002 :  // <0660> a = i
addr == 16'ha7d ? 16'h0606 :  // <0660> b = 6

addr == 16'ha7e ? 16'he407 :  // <0656> bn eq :else_2686
addr == 16'ha7f ? 16'h0a89 :  // <0656> "

addr == 16'ha80 ? 16'h2205 :  // <0657> pa = 5
addr == 16'ha81 ? 16'hfba0 :  // <0657> callx  begin_adc_conversion  $o2_adc_channel
addr == 16'ha82 ? 16'h0a49 :  // <0657> "
addr == 16'ha83 ? 16'hfc00 :  // <0657> "
addr == 16'ha84 ? 16'hfba0 :  // <0658> callx  interpret_tps
addr == 16'ha85 ? 16'h0c81 :  // <0658> "
addr == 16'ha86 ? 16'hfc00 :  // <0658> "
addr == 16'ha87 ? 16'he00f :  // <0659> event_return
addr == 16'ha88 ? 16'h009e :  // <0659> "


addr == 16'ha89 ? 16'h0002 :  // <0664> a = i
addr == 16'ha8a ? 16'h0605 :  // <0664> b = 5

addr == 16'ha8b ? 16'he407 :  // <0661> bn eq :else_2699
addr == 16'ha8c ? 16'h0a93 :  // <0661> "

addr == 16'ha8d ? 16'h2204 :  // <0662> pa = 4
addr == 16'ha8e ? 16'hfba0 :  // <0662> callx  begin_adc_conversion  $maf_adc_channel
addr == 16'ha8f ? 16'h0a49 :  // <0662> "
addr == 16'ha90 ? 16'hfc00 :  // <0662> "
addr == 16'ha91 ? 16'he00f :  // <0663> event_return
addr == 16'ha92 ? 16'h009e :  // <0663> "


addr == 16'ha93 ? 16'h0002 :  // <0669> a = i
addr == 16'ha94 ? 16'h0604 :  // <0669> b = 4

addr == 16'ha95 ? 16'he407 :  // <0665> bn eq :else_2709
addr == 16'ha96 ? 16'h0a9f :  // <0665> "

addr == 16'ha97 ? 16'hfba0 :  // <0666> callx  interpret_maf
addr == 16'ha98 ? 16'h0c42 :  // <0666> "
addr == 16'ha99 ? 16'hfc00 :  // <0666> "
addr == 16'ha9a ? 16'hfba0 :  // <0667> callx  plan_tick
addr == 16'ha9b ? 16'h08ec :  // <0667> "
addr == 16'ha9c ? 16'hfc00 :  // <0667> "
addr == 16'ha9d ? 16'he00f :  // <0668> event_return
addr == 16'ha9e ? 16'h009e :  // <0668> "


addr == 16'ha9f ? 16'h0002 :  // <0708> a = i
addr == 16'haa0 ? 16'h0607 :  // <0708> b = 7

addr == 16'haa1 ? 16'he407 :  // <0670> bn eq :else_2721
addr == 16'haa2 ? 16'h0ae6 :  // <0670> "

addr == 16'haa3 ? 16'h6600 :  // <0671> ram a = $ram_enable_status_report // av_ad_hi = 0
addr == 16'haa4 ? 16'h6a3c :  // <0671> ram a = $ram_enable_status_report // av_ad_lo = 60
addr == 16'haa5 ? 16'h0017 :  // <0671> ram a = $ram_enable_status_report // a = av_write_data // start read cycle
addr == 16'haa6 ? 16'h0018 :  // <0671> ram a = $ram_enable_status_report // a = av_read_data // finish read cycle

addr == 16'haa7 ? 16'h0000 :  // <0677> a = a
addr == 16'haa8 ? 16'h0600 :  // <0677> b = 0

addr == 16'haa9 ? 16'he007 :  // <0672> br eq :else_2729
addr == 16'haaa ? 16'h0aaf :  // <0672> "

// report anmux reading.
addr == 16'haab ? 16'h0016 :  // <0674> a = spi_data

addr == 16'haac ? 16'hfba0 :  // <0676> call :put4x
addr == 16'haad ? 16'h00d3 :  // <0676> "
addr == 16'haae ? 16'hfc00 :  // <0676> "


// memorize anmux reading.
addr == 16'haaf ? 16'hfba0 :  // <0680> call :anmux_get_chn
addr == 16'hab0 ? 16'h00c6 :  // <0680> "
addr == 16'hab1 ? 16'hfc00 :  // <0680> "
addr == 16'hab2 ? 16'h3016 :  // <0681> push spi_data // push spi_data

addr == 16'hab3 ? 16'h0351 :  // <0681> a = a<<1
addr == 16'hab4 ? 16'h0616 :  // <0681> b = 22
addr == 16'hab5 ? 16'h6600 :  // <0681> av_ad_hi = 0
addr == 16'hab6 ? 16'h6b00 :  // <0681> av_ad_lo = ad0

addr == 16'hab7 ? 16'h5c0c :  // <0681> pop av_write_data // pop av_write_data

// decrement anmux channel & start waiting again.
addr == 16'hab8 ? 16'hfba0 :  // <0684> call :anmux_get_chn
addr == 16'hab9 ? 16'h00c6 :  // <0684> "
addr == 16'haba ? 16'hfc00 :  // <0684> "

addr == 16'habb ? 16'h0000 :  // <0691> a = a
addr == 16'habc ? 16'h0600 :  // <0691> b = 0

addr == 16'habd ? 16'he007 :  // <0685> br eq :else_2749
addr == 16'habe ? 16'h0ac8 :  // <0685> "

addr == 16'habf ? 16'h0760 :  // <0686> b = -1
addr == 16'hac0 ? 16'hc800 :  // <0687> a = a+b
addr == 16'hac1 ? 16'h0300 :  // <0687> "
addr == 16'hac2 ? 16'hfba0 :  // <0688> call :anmux_set_chn
addr == 16'hac3 ? 16'h00c2 :  // <0688> "
addr == 16'hac4 ? 16'hfc00 :  // <0688> "
addr == 16'hac5 ? 16'h5205 :  // <0689> mstimer1 = $anmux_settle_ms
addr == 16'hac6 ? 16'he00f :  // <0690> event_return
addr == 16'hac7 ? 16'h009e :  // <0690> "


// end of temperature daq pass.
addr == 16'hac8 ? 16'hfba0 :  // <0694> callx  interpret_block_temp
addr == 16'hac9 ? 16'h062e :  // <0694> "
addr == 16'haca ? 16'hfc00 :  // <0694> "

// wrap up status report on UART.
addr == 16'hacb ? 16'h6600 :  // <0697> ram a = $ram_enable_status_report // av_ad_hi = 0
addr == 16'hacc ? 16'h6a3c :  // <0697> ram a = $ram_enable_status_report // av_ad_lo = 60
addr == 16'hacd ? 16'h0017 :  // <0697> ram a = $ram_enable_status_report // a = av_write_data // start read cycle
addr == 16'hace ? 16'h0018 :  // <0697> ram a = $ram_enable_status_report // a = av_read_data // finish read cycle

addr == 16'hacf ? 16'h0000 :  // <0702> a = a
addr == 16'had0 ? 16'h0600 :  // <0702> b = 0

addr == 16'had1 ? 16'he007 :  // <0698> br eq :else_2769
addr == 16'had2 ? 16'h0ae1 :  // <0698> "

addr == 16'had3 ? 16'hfba0 :  // <0699> callx  report_plan
addr == 16'had4 ? 16'h0c27 :  // <0699> "
addr == 16'had5 ? 16'hfc00 :  // <0699> "
addr == 16'had6 ? 16'hfba0 :  // <0700> callx  report_text_flags
addr == 16'had7 ? 16'h0bf6 :  // <0700> "
addr == 16'had8 ? 16'hfc00 :  // <0700> "
addr == 16'had9 ? 16'h020d :  // <0701> a = 13 // puteol
addr == 16'hada ? 16'hfba0 :  // <0701> puteol
addr == 16'hadb ? 16'h00ab :  // <0701> "
addr == 16'hadc ? 16'hfc00 :  // <0701> "
addr == 16'hadd ? 16'h020a :  // <0701> a = 10 // puteol
addr == 16'hade ? 16'hfba0 :  // <0701> puteol
addr == 16'hadf ? 16'h00ab :  // <0701> "
addr == 16'hae0 ? 16'hfc00 :  // <0701> "


//TODO: is this a hack??
addr == 16'hae1 ? 16'h6600 :  // <0705> ram $ram_dial_setting = spi_data // av_ad_hi = 0
addr == 16'hae2 ? 16'h6a3a :  // <0705> ram $ram_dial_setting = spi_data // av_ad_lo = 58
addr == 16'hae3 ? 16'h5c16 :  // <0705> ram $ram_dial_setting = spi_data // av_write_data = spi_data

addr == 16'hae4 ? 16'he00f :  // <0707> event_return
addr == 16'hae5 ? 16'h009e :  // <0707> "

addr == 16'hae6 ? 16'he00f :  // <0709> end_event
addr == 16'hae7 ? 16'h009e :  // <0709> "

// :power_lost_msg // = 0x0ae8
// "PWL\x0"
addr == 16'hae8 ? 16'h5750 :  // <0712> WP
addr == 16'hae9 ? 16'h004c :  // <0712>  L

// ######## event power_lost_handler // = 0x0aea
// at this time we have less than 2 ms of usable run time left.

// this must be an uncommanded loss of main power, because if it was commanded,
// no more events would be handled; this event handler wouldn't have a chance to run.
// immediately set the power relay PWM to full power for a few seconds,
// in case the power relay opened accidentally e.g. due to a hard pothole.
addr == 16'haea ? 16'h8a00 :  // <0721> power_duty = $power_duty_closing
addr == 16'haeb ? 16'h6600 :  // <0722> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'haec ? 16'h6a14 :  // <0722> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'haed ? 16'h0017 :  // <0722> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'haee ? 16'h0018 :  // <0722> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'haef ? 16'h0602 :  // <0723> b = $relay_hold_passes
addr == 16'haf0 ? 16'h6600 :  // <0724> ram $ram_relay_hold_at_pass = a+b // av_ad_hi = 0
addr == 16'haf1 ? 16'h6a40 :  // <0724> ram $ram_relay_hold_at_pass = a+b // av_ad_lo = 64
addr == 16'haf2 ? 16'hc800 :  // <0724> ram $ram_relay_hold_at_pass = a+b // av_write_data = a+b
addr == 16'haf3 ? 16'h5f00 :  // <0724> "

// pause any non-vital power-hogging operations, to conserve power for the EEPROM write.

// save persistent data in case the power remains down e.g. due to battery disconnect.
addr == 16'haf4 ? 16'hfba0 :  // <0729> callx  save_persistent_data
addr == 16'haf5 ? 16'h0b61 :  // <0729> "
addr == 16'haf6 ? 16'hfc00 :  // <0729> "

addr == 16'haf7 ? 16'h23a0 :  // <0731> pa = :power_lost_msg
addr == 16'haf8 ? 16'h0ae8 :  // <0731> "
addr == 16'haf9 ? 16'hfba0 :  // <0731> callx  set_text_flag  :power_lost_msg
addr == 16'hafa ? 16'h0bc0 :  // <0731> "
addr == 16'hafb ? 16'hfc00 :  // <0731> "
addr == 16'hafc ? 16'he00f :  // <0732> end_event
addr == 16'hafd ? 16'h009e :  // <0732> "

// :ign_off_msg // = 0x0afe
// "IGOF\x0"
addr == 16'hafe ? 16'h4749 :  // <0735> GI
addr == 16'haff ? 16'h464f :  // <0735> FO
addr == 16'hb00 ? 16'h0000 :  // <0735>   

// ######## event ign_switch_off_handler // = 0x0b01
// set power-down deadline in RAM.  this makes the system remain powered for several more minutes, for cooldown data logging.
addr == 16'hb01 ? 16'h6600 :  // <0739> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'hb02 ? 16'h6a42 :  // <0739> ram a = $ram_minutes_cnt // av_ad_lo = 66
addr == 16'hb03 ? 16'h0017 :  // <0739> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'hb04 ? 16'h0018 :  // <0739> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'hb05 ? 16'h060a :  // <0740> b = $power_extend_minutes
addr == 16'hb06 ? 16'h6600 :  // <0741> ram $ram_power_down_at_min = a+b // av_ad_hi = 0
addr == 16'hb07 ? 16'h6a3e :  // <0741> ram $ram_power_down_at_min = a+b // av_ad_lo = 62
addr == 16'hb08 ? 16'hc800 :  // <0741> ram $ram_power_down_at_min = a+b // av_write_data = a+b
addr == 16'hb09 ? 16'h5f00 :  // <0741> "
addr == 16'hb0a ? 16'h23a0 :  // <0742> pa = :ign_off_msg
addr == 16'hb0b ? 16'h0afe :  // <0742> "
addr == 16'hb0c ? 16'hfba0 :  // <0742> callx  set_text_flag   :ign_off_msg
addr == 16'hb0d ? 16'h0bc0 :  // <0742> "
addr == 16'hb0e ? 16'hfc00 :  // <0742> "
addr == 16'hb0f ? 16'he00f :  // <0743> end_event
addr == 16'hb10 ? 16'h009e :  // <0743> "

// :ign_on_msg // = 0x0b11
// "IGON\x0"
addr == 16'hb11 ? 16'h4749 :  // <0746> GI
addr == 16'hb12 ? 16'h4e4f :  // <0746> NO
addr == 16'hb13 ? 16'h0000 :  // <0746>   

// ######## event ign_switch_on_handler // = 0x0b14
addr == 16'hb14 ? 16'h6600 :  // <0749> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'hb15 ? 16'h6a3e :  // <0749> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 62
addr == 16'hb16 ? 16'h5f60 :  // <0749> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'hb17 ? 16'h23a0 :  // <0750> pa = :ign_on_msg
addr == 16'hb18 ? 16'h0b11 :  // <0750> "
addr == 16'hb19 ? 16'hfba0 :  // <0750> callx  set_text_flag   :ign_on_msg
addr == 16'hb1a ? 16'h0bc0 :  // <0750> "
addr == 16'hb1b ? 16'hfc00 :  // <0750> "
addr == 16'hb1c ? 16'he00f :  // <0751> end_event
addr == 16'hb1d ? 16'h009e :  // <0751> "

// ######## event puff1_done_handler // = 0x0b1e
// puff just finished.  set length of next puff.
addr == 16'hb1e ? 16'h6600 :  // <0755> ram puff_len_us = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'hb1f ? 16'h6a92 :  // <0755> ram puff_len_us = $ram_next_puff_len_us // av_ad_lo = 146
addr == 16'hb20 ? 16'h9417 :  // <0755> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_write_data // start read cycle
addr == 16'hb21 ? 16'h9418 :  // <0755> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_read_data // finish read cycle

// count puffs.
addr == 16'hb22 ? 16'h6600 :  // <0758> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'hb23 ? 16'h6a94 :  // <0758> ram a = $ram_puff_count // av_ad_lo = 148
addr == 16'hb24 ? 16'h0017 :  // <0758> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'hb25 ? 16'h0018 :  // <0758> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'hb26 ? 16'h0601 :  // <0759> b = 1
addr == 16'hb27 ? 16'h6600 :  // <0760> ram $ram_puff_count = a+b // av_ad_hi = 0
addr == 16'hb28 ? 16'h6a94 :  // <0760> ram $ram_puff_count = a+b // av_ad_lo = 148
addr == 16'hb29 ? 16'hc800 :  // <0760> ram $ram_puff_count = a+b // av_write_data = a+b
addr == 16'hb2a ? 16'h5f00 :  // <0760> "

// hack to set puff length strictly by a hard-wired knob.
// ram a = $ram_dial_setting
// a = a<<1
// a = a<<1
// a = a<<1
// bn az :nonzero
// a = 1
// :nonzero
// puff_len_us = a
addr == 16'hb2b ? 16'he00f :  // <0771> end_event
addr == 16'hb2c ? 16'h009e :  // <0771> "

// ######## func minute_events // = 0x0b2d
addr == 16'hb2d ? 16'h303e :  // <0775> push rtna // func minute_events

addr == 16'hb2e ? 16'hfba0 :  // <0774> callx  check_power_down
addr == 16'hb2f ? 16'h0b4a :  // <0774> "
addr == 16'hb30 ? 16'hfc00 :  // <0774> "

addr == 16'hb31 ? 16'hf80c :  // <0776> pop rtna // func minute_events
addr == 16'hb32 ? 16'hfc00 :  // <0776> swapra = nop

// :power_hold_msg // = 0x0b33
// "PWH\x0"
addr == 16'hb33 ? 16'h5750 :  // <0778> WP
addr == 16'hb34 ? 16'h0048 :  // <0778>  H

// ######## func check_power_relay // = 0x0b35
addr == 16'hb35 ? 16'h303e :  // <0788> push rtna // func check_power_relay

addr == 16'hb36 ? 16'h6600 :  // <0781> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'hb37 ? 16'h6a14 :  // <0781> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'hb38 ? 16'h0017 :  // <0781> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'hb39 ? 16'h0018 :  // <0781> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'hb3a ? 16'h6600 :  // <0782> ram b = $ram_relay_hold_at_pass // av_ad_hi = 0
addr == 16'hb3b ? 16'h6a40 :  // <0782> ram b = $ram_relay_hold_at_pass // av_ad_lo = 64
addr == 16'hb3c ? 16'h0417 :  // <0782> ram b = $ram_relay_hold_at_pass // b = av_write_data // start read cycle
addr == 16'hb3d ? 16'h0418 :  // <0782> ram b = $ram_relay_hold_at_pass // b = av_read_data // finish read cycle

addr == 16'hb3e ? 16'h0000 :  // <0787> a = a
addr == 16'hb3f ? 16'h0401 :  // <0787> b = b

addr == 16'hb40 ? 16'he407 :  // <0783> bn eq :else_2880
addr == 16'hb41 ? 16'h0b48 :  // <0783> "

// time to begin "solenoid saver" coil power reduction by PWM.
addr == 16'hb42 ? 16'h8a19 :  // <0785> power_duty = $power_duty_holding
addr == 16'hb43 ? 16'h23a0 :  // <0786> pa = :power_hold_msg
addr == 16'hb44 ? 16'h0b33 :  // <0786> "
addr == 16'hb45 ? 16'hfba0 :  // <0786> callx  set_text_flag  :power_hold_msg
addr == 16'hb46 ? 16'h0bc0 :  // <0786> "
addr == 16'hb47 ? 16'hfc00 :  // <0786> "


addr == 16'hb48 ? 16'hf80c :  // <0789> pop rtna // func check_power_relay
addr == 16'hb49 ? 16'hfc00 :  // <0789> swapra = nop

// ######## func check_power_down // = 0x0b4a

// check power-down deadline in RAM.
addr == 16'hb4a ? 16'h6600 :  // <0792> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'hb4b ? 16'h6a42 :  // <0792> ram a = $ram_minutes_cnt // av_ad_lo = 66
addr == 16'hb4c ? 16'h0017 :  // <0792> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'hb4d ? 16'h0018 :  // <0792> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'hb4e ? 16'h6600 :  // <0793> ram b = $ram_power_down_at_min // av_ad_hi = 0
addr == 16'hb4f ? 16'h6a3e :  // <0793> ram b = $ram_power_down_at_min // av_ad_lo = 62
addr == 16'hb50 ? 16'h0417 :  // <0793> ram b = $ram_power_down_at_min // b = av_write_data // start read cycle
addr == 16'hb51 ? 16'h0418 :  // <0793> ram b = $ram_power_down_at_min // b = av_read_data // finish read cycle

addr == 16'hb52 ? 16'h0000 :  // <0796> a = a
addr == 16'hb53 ? 16'h0401 :  // <0796> b = b

addr == 16'hb54 ? 16'he407 :  // <0794> bn eq :else_2900
addr == 16'hb55 ? 16'h0b58 :  // <0794> "

addr == 16'hb56 ? 16'he00f :  // <0795> jmp :power_down
addr == 16'hb57 ? 16'h0b59 :  // <0795> "


addr == 16'hb58 ? 16'hfc00 :  // <0798> swapra = nop

// :power_down // = 0x0b59
// this code never returns.
addr == 16'hb59 ? 16'hfba0 :  // <0801> callx  save_persistent_data
addr == 16'hb5a ? 16'h0b61 :  // <0801> "
addr == 16'hb5b ? 16'hfc00 :  // <0801> "
addr == 16'hb5c ? 16'h8a32 :  // <0802> power_duty = $power_duty_opening
addr == 16'hb5d ? 16'h7fa0 :  // <0803> error_halt_code $err_power_down // leds = 0xfffc
addr == 16'hb5e ? 16'hfffc :  // <0803> "
addr == 16'hb5f ? 16'he00f :  // <0803> error_halt_code $err_power_down
addr == 16'hb60 ? 16'h0b5f :  // <0803> "

// ######## func save_persistent_data // = 0x0b61


addr == 16'hb61 ? 16'hfc00 :  // <0807> swapra = nop

// ######## func check_communication // = 0x0b62
addr == 16'hb62 ? 16'h303e :  // <0827> push rtna // func check_communication

addr == 16'hb63 ? 16'h6600 :  // <0809> ram a = $ram_ftdi_downtime_remain_sec // av_ad_hi = 0
addr == 16'hb64 ? 16'h6a12 :  // <0809> ram a = $ram_ftdi_downtime_remain_sec // av_ad_lo = 18
addr == 16'hb65 ? 16'h0017 :  // <0809> ram a = $ram_ftdi_downtime_remain_sec // a = av_write_data // start read cycle
addr == 16'hb66 ? 16'h0018 :  // <0809> ram a = $ram_ftdi_downtime_remain_sec // a = av_read_data // finish read cycle

addr == 16'hb67 ? 16'h0000 :  // <0817> a = a
addr == 16'hb68 ? 16'h0600 :  // <0817> b = 0

addr == 16'hb69 ? 16'he007 :  // <0810> br eq :else_2921
addr == 16'hb6a ? 16'h0b78 :  // <0810> "

addr == 16'hb6b ? 16'h0760 :  // <0811> b = -1
addr == 16'hb6c ? 16'hc800 :  // <0812> a = a+b
addr == 16'hb6d ? 16'h0300 :  // <0812> "
addr == 16'hb6e ? 16'h6600 :  // <0813> ram $ram_ftdi_downtime_remain_sec = a // av_ad_hi = 0
addr == 16'hb6f ? 16'h6a12 :  // <0813> ram $ram_ftdi_downtime_remain_sec = a // av_ad_lo = 18
addr == 16'hb70 ? 16'h5c00 :  // <0813> ram $ram_ftdi_downtime_remain_sec = a // av_write_data = a

addr == 16'hb71 ? 16'h0000 :  // <0816> a = a
addr == 16'hb72 ? 16'h0600 :  // <0816> b = 0

addr == 16'hb73 ? 16'he407 :  // <0814> bn eq :else_2931
addr == 16'hb74 ? 16'h0b78 :  // <0814> "

addr == 16'hb75 ? 16'hfba0 :  // <0815> callx  ftdi_power_on
addr == 16'hb76 ? 16'h0bac :  // <0815> "
addr == 16'hb77 ? 16'hfc00 :  // <0815> "



addr == 16'hb78 ? 16'h6600 :  // <0819> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'hb79 ? 16'h6a42 :  // <0819> ram a = $ram_minutes_cnt // av_ad_lo = 66
addr == 16'hb7a ? 16'h0017 :  // <0819> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'hb7b ? 16'h0018 :  // <0819> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'hb7c ? 16'h6600 :  // <0820> ram b = $ram_comm_restart_at_min // av_ad_hi = 0
addr == 16'hb7d ? 16'h6a10 :  // <0820> ram b = $ram_comm_restart_at_min // av_ad_lo = 16
addr == 16'hb7e ? 16'h0417 :  // <0820> ram b = $ram_comm_restart_at_min // b = av_write_data // start read cycle
addr == 16'hb7f ? 16'h0418 :  // <0820> ram b = $ram_comm_restart_at_min // b = av_read_data // finish read cycle

addr == 16'hb80 ? 16'h0000 :  // <0826> a = a
addr == 16'hb81 ? 16'h0401 :  // <0826> b = b

addr == 16'hb82 ? 16'he407 :  // <0821> bn eq :else_2946
addr == 16'hb83 ? 16'h0b8d :  // <0821> "

// comm restart is required.
addr == 16'hb84 ? 16'hfba0 :  // <0823> callx  postpone_comm_restart
addr == 16'hb85 ? 16'h0b8f :  // <0823> "
addr == 16'hb86 ? 16'hfc00 :  // <0823> "
addr == 16'hb87 ? 16'h6600 :  // <0824> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_hi = 0
addr == 16'hb88 ? 16'h6a12 :  // <0824> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_lo = 18
addr == 16'hb89 ? 16'h5e05 :  // <0824> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_write_data = 5
addr == 16'hb8a ? 16'hfba0 :  // <0825> callx  ftdi_power_off
addr == 16'hb8b ? 16'h0b9c :  // <0825> "
addr == 16'hb8c ? 16'hfc00 :  // <0825> "


addr == 16'hb8d ? 16'hf80c :  // <0828> pop rtna // func check_communication
addr == 16'hb8e ? 16'hfc00 :  // <0828> swapra = nop

// ######## func postpone_comm_restart // = 0x0b8f

addr == 16'hb8f ? 16'h6600 :  // <0830> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'hb90 ? 16'h6a42 :  // <0830> ram a = $ram_minutes_cnt // av_ad_lo = 66
addr == 16'hb91 ? 16'h0017 :  // <0830> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'hb92 ? 16'h0018 :  // <0830> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'hb93 ? 16'h0602 :  // <0831> b = $comm_grace_period_min
addr == 16'hb94 ? 16'h6600 :  // <0832> ram $ram_comm_restart_at_min = a+b // av_ad_hi = 0
addr == 16'hb95 ? 16'h6a10 :  // <0832> ram $ram_comm_restart_at_min = a+b // av_ad_lo = 16
addr == 16'hb96 ? 16'hc800 :  // <0832> ram $ram_comm_restart_at_min = a+b // av_write_data = a+b
addr == 16'hb97 ? 16'h5f00 :  // <0832> "

addr == 16'hb98 ? 16'hfc00 :  // <0834> swapra = nop

// :ftdi_off_msg // = 0x0b99
// "FTOF\x0"
addr == 16'hb99 ? 16'h5446 :  // <0836> TF
addr == 16'hb9a ? 16'h464f :  // <0836> FO
addr == 16'hb9b ? 16'h0000 :  // <0836>   

// ######## func ftdi_power_off // = 0x0b9c
addr == 16'hb9c ? 16'h303e :  // <0843> push rtna // func ftdi_power_off

addr == 16'hb9d ? 16'h0020 :  // <0839> a = board_ctrl
addr == 16'hb9e ? 16'h07a0 :  // <0840> b = $not_ftdi_power_mask
addr == 16'hb9f ? 16'hff7f :  // <0840> "
addr == 16'hba0 ? 16'hc800 :  // <0841> board_ctrl = and
addr == 16'hba1 ? 16'h8330 :  // <0841> "
addr == 16'hba2 ? 16'h23a0 :  // <0842> pa = :ftdi_off_msg
addr == 16'hba3 ? 16'h0b99 :  // <0842> "
addr == 16'hba4 ? 16'hfba0 :  // <0842> callx  set_text_flag  :ftdi_off_msg
addr == 16'hba5 ? 16'h0bc0 :  // <0842> "
addr == 16'hba6 ? 16'hfc00 :  // <0842> "

addr == 16'hba7 ? 16'hf80c :  // <0844> pop rtna // func ftdi_power_off
addr == 16'hba8 ? 16'hfc00 :  // <0844> swapra = nop

// :ftdi_on_msg // = 0x0ba9
// "FTON\x0"
addr == 16'hba9 ? 16'h5446 :  // <0846> TF
addr == 16'hbaa ? 16'h4e4f :  // <0846> NO
addr == 16'hbab ? 16'h0000 :  // <0846>   

// ######## func ftdi_power_on // = 0x0bac
addr == 16'hbac ? 16'h303e :  // <0853> push rtna // func ftdi_power_on

addr == 16'hbad ? 16'h0020 :  // <0849> a = board_ctrl
addr == 16'hbae ? 16'h0680 :  // <0850> b = $ftdi_power_mask
addr == 16'hbaf ? 16'hc800 :  // <0851> board_ctrl = or
addr == 16'hbb0 ? 16'h8334 :  // <0851> "
addr == 16'hbb1 ? 16'h23a0 :  // <0852> pa = :ftdi_on_msg
addr == 16'hbb2 ? 16'h0ba9 :  // <0852> "
addr == 16'hbb3 ? 16'hfba0 :  // <0852> callx  set_text_flag  :ftdi_on_msg
addr == 16'hbb4 ? 16'h0bc0 :  // <0852> "
addr == 16'hbb5 ? 16'hfc00 :  // <0852> "

addr == 16'hbb6 ? 16'hf80c :  // <0854> pop rtna // func ftdi_power_on
addr == 16'hbb7 ? 16'hfc00 :  // <0854> swapra = nop

// ######## func clear_ram_page // = 0x0bb8

addr == 16'hbb8 ? 16'h0200 :  // <0856> a = 0
addr == 16'hbb9 ? 16'h0602 :  // <0857> b = 2
// :clear_next_word // = 0x0bba
addr == 16'hbba ? 16'h6800 :  // <0859> av_ad_lo = a
addr == 16'hbbb ? 16'h5e00 :  // <0860> av_write_data = 0
addr == 16'hbbc ? 16'h0300 :  // <0861> a = ad0
addr == 16'hbbd ? 16'he400 :  // <0862> bn az :clear_next_word
addr == 16'hbbe ? 16'h0bba :  // <0862> "

addr == 16'hbbf ? 16'hfc00 :  // <0864> swapra = nop

// ######## func set_text_flag // = 0x0bc0

addr == 16'hbc0 ? 16'h6600 :  // <0866> ram a = $ram_next_tfp_idx // av_ad_hi = 0
addr == 16'hbc1 ? 16'h6a58 :  // <0866> ram a = $ram_next_tfp_idx // av_ad_lo = 88
addr == 16'hbc2 ? 16'h0017 :  // <0866> ram a = $ram_next_tfp_idx // a = av_write_data // start read cycle
addr == 16'hbc3 ? 16'h0018 :  // <0866> ram a = $ram_next_tfp_idx // a = av_read_data // finish read cycle
addr == 16'hbc4 ? 16'h3008 :  // <0867> push flag_addr // push flag_addr

addr == 16'hbc5 ? 16'h0351 :  // <0867> a = a<<1
addr == 16'hbc6 ? 16'h0648 :  // <0867> b = 72
addr == 16'hbc7 ? 16'h6600 :  // <0867> av_ad_hi = 0
addr == 16'hbc8 ? 16'h6b00 :  // <0867> av_ad_lo = ad0

addr == 16'hbc9 ? 16'h5c0c :  // <0867> pop av_write_data // pop av_write_data
addr == 16'hbca ? 16'h0008 :  // <0868> a = flag_addr
//TODO: ^^^ is this a bug?  should be ram a = $ram_next_tfp_idx instead??
addr == 16'hbcb ? 16'h0760 :  // <0870> b = -1
addr == 16'hbcc ? 16'hc800 :  // <0871> a = a+b
addr == 16'hbcd ? 16'h0300 :  // <0871> "
addr == 16'hbce ? 16'h0607 :  // <0872> b = $tfp_mask
addr == 16'hbcf ? 16'h6600 :  // <0873> ram $ram_next_tfp_idx = and // av_ad_hi = 0
addr == 16'hbd0 ? 16'h6a58 :  // <0873> ram $ram_next_tfp_idx = and // av_ad_lo = 88
addr == 16'hbd1 ? 16'hc800 :  // <0873> ram $ram_next_tfp_idx = and // av_write_data = and
addr == 16'hbd2 ? 16'h5f30 :  // <0873> "

addr == 16'hbd3 ? 16'hfc00 :  // <0875> swapra = nop

// ######## func unique_text_flag // = 0x0bd4
addr == 16'hbd4 ? 16'h3002 :  // <0885> push i // func unique_text_flag
addr == 16'hbd5 ? 16'h303e :  // <0885> push rtna // "

addr == 16'hbd6 ? 16'h0a00 :  // <0882> i = 0
// :loop_3030 // = 0x0bd7

addr == 16'hbd7 ? 16'h0002 :  // <0877> a = i

addr == 16'hbd8 ? 16'h0351 :  // <0877> a = a<<1
addr == 16'hbd9 ? 16'h0648 :  // <0877> b = 72
addr == 16'hbda ? 16'h6600 :  // <0877> av_ad_hi = 0
addr == 16'hbdb ? 16'h6b00 :  // <0877> av_ad_lo = ad0
addr == 16'hbdc ? 16'h0417 :  // <0877> b = av_begin_read

addr == 16'hbdd ? 16'h0418 :  // <0877> b = av_read_data

addr == 16'hbde ? 16'h0001 :  // <0880> a = b
addr == 16'hbdf ? 16'h0408 :  // <0880> b = flag_addr

addr == 16'hbe0 ? 16'he407 :  // <0878> bn eq :else_3040
addr == 16'hbe1 ? 16'h0be4 :  // <0878> "

addr == 16'hbe2 ? 16'he00f :  // <0879> jmp :skip
addr == 16'hbe3 ? 16'h0bf0 :  // <0879> "



addr == 16'hbe4 ? 16'h0002 :  // <0882> a = i
addr == 16'hbe5 ? 16'h0601 :  // <0882> b = 1
addr == 16'hbe6 ? 16'hc800 :  // <0882> i = a+b
addr == 16'hbe7 ? 16'h0b00 :  // <0882> "


addr == 16'hbe8 ? 16'h0002 :  // <0882> a = i
addr == 16'hbe9 ? 16'h0608 :  // <0882> b = $num_text_flag_pointers
addr == 16'hbea ? 16'he005 :  // <0882> br lt :loop_3030
addr == 16'hbeb ? 16'h0bd7 :  // <0882> "

// :end_3030 // = 0x0bec
addr == 16'hbec ? 16'h2008 :  // <0883> pa = flag_addr
addr == 16'hbed ? 16'hfba0 :  // <0883> callx  set_text_flag  flag_addr
addr == 16'hbee ? 16'h0bc0 :  // <0883> "
addr == 16'hbef ? 16'hfc00 :  // <0883> "
// :skip // = 0x0bf0

addr == 16'hbf0 ? 16'hf80c :  // <0886> pop rtna // func unique_text_flag
addr == 16'hbf1 ? 16'h080c :  // <0886> pop i // "
addr == 16'hbf2 ? 16'hfc00 :  // <0886> swapra = nop

// :text_flags_msg // = 0x0bf3
// " tf=\x0"
addr == 16'hbf3 ? 16'h7420 :  // <0888> t 
addr == 16'hbf4 ? 16'h3d66 :  // <0888> =f
addr == 16'hbf5 ? 16'h0000 :  // <0888>   

// ######## func report_text_flags // = 0x0bf6
addr == 16'hbf6 ? 16'h3002 :  // <0901> push i // func report_text_flags
addr == 16'hbf7 ? 16'h303e :  // <0901> push rtna // "

addr == 16'hbf8 ? 16'h03a0 :  // <0891> a = :text_flags_msg
addr == 16'hbf9 ? 16'h0bf3 :  // <0891> "
addr == 16'hbfa ? 16'hfba0 :  // <0892> call :print_nt
addr == 16'hbfb ? 16'h015f :  // <0892> "
addr == 16'hbfc ? 16'hfc00 :  // <0892> "
addr == 16'hbfd ? 16'h0a00 :  // <0900> i = 0
// :loop_3069 // = 0x0bfe

addr == 16'hbfe ? 16'h0002 :  // <0893> a = i

addr == 16'hbff ? 16'h0351 :  // <0893> a = a<<1
addr == 16'hc00 ? 16'h0648 :  // <0893> b = 72
addr == 16'hc01 ? 16'h6600 :  // <0893> av_ad_hi = 0
addr == 16'hc02 ? 16'h6b00 :  // <0893> av_ad_lo = ad0
addr == 16'hc03 ? 16'h0417 :  // <0893> b = av_begin_read

addr == 16'hc04 ? 16'h0418 :  // <0893> b = av_read_data

addr == 16'hc05 ? 16'h0001 :  // <0898> a = b
addr == 16'hc06 ? 16'h0600 :  // <0898> b = 0

addr == 16'hc07 ? 16'he007 :  // <0894> br eq :else_3079
addr == 16'hc08 ? 16'h0c16 :  // <0894> "

addr == 16'hc09 ? 16'hfba0 :  // <0895> call :print_nt
addr == 16'hc0a ? 16'h015f :  // <0895> "
addr == 16'hc0b ? 16'hfc00 :  // <0895> "
addr == 16'hc0c ? 16'h022c :  // <0896> a = 44 // putasc ","
addr == 16'hc0d ? 16'hfba0 :  // <0896> putasc ","
addr == 16'hc0e ? 16'h00ab :  // <0896> "
addr == 16'hc0f ? 16'hfc00 :  // <0896> "
addr == 16'hc10 ? 16'h0002 :  // <0897> a = i

addr == 16'hc11 ? 16'h0351 :  // <0897> a = a<<1
addr == 16'hc12 ? 16'h0648 :  // <0897> b = 72
addr == 16'hc13 ? 16'h6600 :  // <0897> av_ad_hi = 0
addr == 16'hc14 ? 16'h6b00 :  // <0897> av_ad_lo = ad0

addr == 16'hc15 ? 16'h5e00 :  // <0897> av_write_data = 0



addr == 16'hc16 ? 16'h0002 :  // <0900> a = i
addr == 16'hc17 ? 16'h0601 :  // <0900> b = 1
addr == 16'hc18 ? 16'hc800 :  // <0900> i = a+b
addr == 16'hc19 ? 16'h0b00 :  // <0900> "


addr == 16'hc1a ? 16'h0002 :  // <0900> a = i
addr == 16'hc1b ? 16'h0608 :  // <0900> b = $num_text_flag_pointers
addr == 16'hc1c ? 16'he005 :  // <0900> br lt :loop_3069
addr == 16'hc1d ? 16'h0bfe :  // <0900> "

// :end_3069 // = 0x0c1e

addr == 16'hc1e ? 16'hf80c :  // <0902> pop rtna // func report_text_flags
addr == 16'hc1f ? 16'h080c :  // <0902> pop i // "
addr == 16'hc20 ? 16'hfc00 :  // <0902> swapra = nop

// :plan_msg // = 0x0c21
// " pl=\x0"
addr == 16'hc21 ? 16'h7020 :  // <0904> p 
addr == 16'hc22 ? 16'h3d6c :  // <0904> =l
addr == 16'hc23 ? 16'h0000 :  // <0904>   
// :manual_trim_msg // = 0x0c24
// " mt=\x0"
addr == 16'hc24 ? 16'h6d20 :  // <0906> m 
addr == 16'hc25 ? 16'h3d74 :  // <0906> =t
addr == 16'hc26 ? 16'h0000 :  // <0906>   

// ######## func report_plan // = 0x0c27
addr == 16'hc27 ? 16'h303e :  // <0918> push rtna // func report_plan

addr == 16'hc28 ? 16'h03a0 :  // <0909> a = :plan_msg
addr == 16'hc29 ? 16'h0c21 :  // <0909> "
addr == 16'hc2a ? 16'hfba0 :  // <0910> call :print_nt
addr == 16'hc2b ? 16'h015f :  // <0910> "
addr == 16'hc2c ? 16'hfc00 :  // <0910> "
addr == 16'hc2d ? 16'h6600 :  // <0911> ram a = $ram_plan_name // av_ad_hi = 0
addr == 16'hc2e ? 16'h6a8a :  // <0911> ram a = $ram_plan_name // av_ad_lo = 138
addr == 16'hc2f ? 16'h0017 :  // <0911> ram a = $ram_plan_name // a = av_write_data // start read cycle
addr == 16'hc30 ? 16'h0018 :  // <0911> ram a = $ram_plan_name // a = av_read_data // finish read cycle
addr == 16'hc31 ? 16'hfba0 :  // <0912> call :print_nt
addr == 16'hc32 ? 16'h015f :  // <0912> "
addr == 16'hc33 ? 16'hfc00 :  // <0912> "

addr == 16'hc34 ? 16'h03a0 :  // <0914> a = :manual_trim_msg
addr == 16'hc35 ? 16'h0c24 :  // <0914> "
addr == 16'hc36 ? 16'hfba0 :  // <0915> call :print_nt
addr == 16'hc37 ? 16'h015f :  // <0915> "
addr == 16'hc38 ? 16'hfc00 :  // <0915> "
addr == 16'hc39 ? 16'h6600 :  // <0916> ram a = $ram_run_manual_trim // av_ad_hi = 0
addr == 16'hc3a ? 16'h6aac :  // <0916> ram a = $ram_run_manual_trim // av_ad_lo = 172
addr == 16'hc3b ? 16'h0017 :  // <0916> ram a = $ram_run_manual_trim // a = av_write_data // start read cycle
addr == 16'hc3c ? 16'h0018 :  // <0916> ram a = $ram_run_manual_trim // a = av_read_data // finish read cycle
addr == 16'hc3d ? 16'hfba0 :  // <0917> call :put4x
addr == 16'hc3e ? 16'h00d3 :  // <0917> "
addr == 16'hc3f ? 16'hfc00 :  // <0917> "

addr == 16'hc40 ? 16'hf80c :  // <0919> pop rtna // func report_plan
addr == 16'hc41 ? 16'hfc00 :  // <0919> swapra = nop

// ######## func interpret_maf // = 0x0c42
addr == 16'hc42 ? 16'h3002 :  // <0951> push i // func interpret_maf
addr == 16'hc43 ? 16'h3004 :  // <0951> push x // "

// range 0 to 1023 = 0x3ff at the ADC.

// offset and clamp the MAF ADC count to 0..511.
addr == 16'hc44 ? 16'h0204 :  // <0924> a = 4

addr == 16'hc45 ? 16'h0351 :  // <0924> a = a<<1
addr == 16'hc46 ? 16'h0626 :  // <0924> b = 38
addr == 16'hc47 ? 16'h6600 :  // <0924> av_ad_hi = 0
addr == 16'hc48 ? 16'h6b00 :  // <0924> av_ad_lo = ad0
addr == 16'hc49 ? 16'h0417 :  // <0924> b = av_begin_read

addr == 16'hc4a ? 16'h0018 :  // <0924> a = av_read_data
addr == 16'hc4b ? 16'h0350 :  // <0925> a = a>>1
addr == 16'hc4c ? 16'h07a0 :  // <0926> b = 0x01ff
addr == 16'hc4d ? 16'h01ff :  // <0926> "
//patch: do some averaging here, like interpret_tps.
addr == 16'hc4e ? 16'hc800 :  // <0928> x = and
addr == 16'hc4f ? 16'h1330 :  // <0928> "
addr == 16'hc50 ? 16'h6600 :  // <0929> ram $ram_maf_adc_filtered = and // av_ad_hi = 0
addr == 16'hc51 ? 16'h6a9a :  // <0929> ram $ram_maf_adc_filtered = and // av_ad_lo = 154
addr == 16'hc52 ? 16'hc800 :  // <0929> ram $ram_maf_adc_filtered = and // av_write_data = and
addr == 16'hc53 ? 16'h5f30 :  // <0929> "

// recover linear flow from MAF ADC count using hi-res method,
// for actual flow feeding into final puff multiply later.
// 256 cell Brute-force lookup might take e.g. 80us to run.  That's 4 jf,
// or 5% of ignition cycle at max RPM.
addr == 16'hc54 ? 16'h6600 :  // <0935> ram $ram_maf_valid = 0 // av_ad_hi = 0
addr == 16'hc55 ? 16'h6a98 :  // <0935> ram $ram_maf_valid = 0 // av_ad_lo = 152
addr == 16'hc56 ? 16'h5e00 :  // <0935> ram $ram_maf_valid = 0 // av_write_data = 0
addr == 16'hc57 ? 16'h0a00 :  // <0943> i = 0
// :loop_3159 // = 0x0c58

addr == 16'hc58 ? 16'h0002 :  // <0936> a = i

addr == 16'hc59 ? 16'h0351 :  // <0936> a = a<<1
addr == 16'hc5a ? 16'h07a0 :  // <0936> b = 2048
addr == 16'hc5b ? 16'h0800 :  // <0936> "
addr == 16'hc5c ? 16'h67a0 :  // <0936> av_ad_hi = 256
addr == 16'hc5d ? 16'h0100 :  // <0936> "
addr == 16'hc5e ? 16'h6b00 :  // <0936> av_ad_lo = ad0
addr == 16'hc5f ? 16'h0417 :  // <0936> b = av_begin_read

addr == 16'hc60 ? 16'h0418 :  // <0936> b = av_read_data

addr == 16'hc61 ? 16'h0001 :  // <0941> a = b
addr == 16'hc62 ? 16'h0404 :  // <0941> b = x

addr == 16'hc63 ? 16'he406 :  // <0937> bn gt :else_3171
addr == 16'hc64 ? 16'h0c6d :  // <0937> "

addr == 16'hc65 ? 16'h6600 :  // <0938> ram $ram_maf_flow_hi_res = i // av_ad_hi = 0
addr == 16'hc66 ? 16'h6a9c :  // <0938> ram $ram_maf_flow_hi_res = i // av_ad_lo = 156
addr == 16'hc67 ? 16'h5c02 :  // <0938> ram $ram_maf_flow_hi_res = i // av_write_data = i
addr == 16'hc68 ? 16'h6600 :  // <0939> ram $ram_maf_valid = 1 // av_ad_hi = 0
addr == 16'hc69 ? 16'h6a98 :  // <0939> ram $ram_maf_valid = 1 // av_ad_lo = 152
addr == 16'hc6a ? 16'h5e01 :  // <0939> ram $ram_maf_valid = 1 // av_write_data = 1
addr == 16'hc6b ? 16'he00f :  // <0940> jmp :maf_done
addr == 16'hc6c ? 16'h0c76 :  // <0940> "



addr == 16'hc6d ? 16'h0002 :  // <0943> a = i
addr == 16'hc6e ? 16'h0601 :  // <0943> b = 1
addr == 16'hc6f ? 16'hc800 :  // <0943> i = a+b
addr == 16'hc70 ? 16'h0b00 :  // <0943> "


addr == 16'hc71 ? 16'h0002 :  // <0943> a = i
addr == 16'hc72 ? 16'h07a0 :  // <0943> b = $maf_ref_num_cells
addr == 16'hc73 ? 16'h0100 :  // <0943> "
addr == 16'hc74 ? 16'he005 :  // <0943> br lt :loop_3159
addr == 16'hc75 ? 16'h0c58 :  // <0943> "

// :end_3159 // = 0x0c76
// :maf_done // = 0x0c76

// quantize linear flow from hi-res to lo-res for indexing into AFRC map rows.
// Lo-res = hi-res >> 2.
addr == 16'hc76 ? 16'h6600 :  // <0948> ram a = $ram_maf_flow_hi_res // av_ad_hi = 0
addr == 16'hc77 ? 16'h6a9c :  // <0948> ram a = $ram_maf_flow_hi_res // av_ad_lo = 156
addr == 16'hc78 ? 16'h0017 :  // <0948> ram a = $ram_maf_flow_hi_res // a = av_write_data // start read cycle
addr == 16'hc79 ? 16'h0018 :  // <0948> ram a = $ram_maf_flow_hi_res // a = av_read_data // finish read cycle
addr == 16'hc7a ? 16'h0350 :  // <0949> a = a>>1
addr == 16'hc7b ? 16'h6600 :  // <0950> ram $ram_afrc_maf_row_idx = a>>1 // av_ad_hi = 0
addr == 16'hc7c ? 16'h6a9e :  // <0950> ram $ram_afrc_maf_row_idx = a>>1 // av_ad_lo = 158
addr == 16'hc7d ? 16'h5f50 :  // <0950> ram $ram_afrc_maf_row_idx = a>>1 // av_write_data = a>>1

addr == 16'hc7e ? 16'h100c :  // <0952> pop x // func interpret_maf
addr == 16'hc7f ? 16'h080c :  // <0952> pop i // "
addr == 16'hc80 ? 16'hfc00 :  // <0952> swapra = nop

// ######## func interpret_tps // = 0x0c81
addr == 16'hc81 ? 16'h3002 :  // <0975> push i // func interpret_tps
addr == 16'hc82 ? 16'h3004 :  // <0975> push x // "
addr == 16'hc83 ? 16'h3005 :  // <0975> push y // "
addr == 16'hc84 ? 16'h3006 :  // <0975> push ga // "
addr == 16'hc85 ? 16'h3007 :  // <0975> push gb // "

addr == 16'hc86 ? 16'h0206 :  // <0954> a = 6

addr == 16'hc87 ? 16'h0351 :  // <0954> a = a<<1
addr == 16'hc88 ? 16'h0626 :  // <0954> b = 38
addr == 16'hc89 ? 16'h6600 :  // <0954> av_ad_hi = 0
addr == 16'hc8a ? 16'h6b00 :  // <0954> av_ad_lo = ad0
addr == 16'hc8b ? 16'h0417 :  // <0954> b = av_begin_read

addr == 16'hc8c ? 16'h0418 :  // <0954> b = av_read_data
// reverse the scale.
addr == 16'hc8d ? 16'h03a0 :  // <0956> a = 0x0fff
addr == 16'hc8e ? 16'h0fff :  // <0956> "
addr == 16'hc8f ? 16'hc800 :  // <0957> b = xor
addr == 16'hc90 ? 16'h0738 :  // <0957> "
// memorize reading into slot 0 and shift history up 1 slot.  total up as we go.
addr == 16'hc91 ? 16'h1801 :  // <0959> ga = b
addr == 16'hc92 ? 16'h1200 :  // <0960> x = 0
addr == 16'hc93 ? 16'h0a00 :  // <0967> i = 0
// :loop_3219 // = 0x0c94

addr == 16'hc94 ? 16'h0002 :  // <0961> a = i

addr == 16'hc95 ? 16'h0351 :  // <0961> a = a<<1
addr == 16'hc96 ? 16'h06b2 :  // <0961> b = 178
addr == 16'hc97 ? 16'h6600 :  // <0961> av_ad_hi = 0
addr == 16'hc98 ? 16'h6b00 :  // <0961> av_ad_lo = ad0
addr == 16'hc99 ? 16'h0417 :  // <0961> b = av_begin_read

addr == 16'hc9a ? 16'h1c18 :  // <0961> gb = av_read_data
addr == 16'hc9b ? 16'h1407 :  // <0962> y = gb
addr == 16'hc9c ? 16'hc800 :  // <0963> x = x+y
addr == 16'hc9d ? 16'h1320 :  // <0963> "
addr == 16'hc9e ? 16'h3006 :  // <0964> push ga // push ga
addr == 16'hc9f ? 16'h0002 :  // <0964> a = i

addr == 16'hca0 ? 16'h0351 :  // <0964> a = a<<1
addr == 16'hca1 ? 16'h06b2 :  // <0964> b = 178
addr == 16'hca2 ? 16'h6600 :  // <0964> av_ad_hi = 0
addr == 16'hca3 ? 16'h6b00 :  // <0964> av_ad_lo = ad0

addr == 16'hca4 ? 16'h5c0c :  // <0964> pop av_write_data // pop av_write_data
addr == 16'hca5 ? 16'h1807 :  // <0965> ga = gb


addr == 16'hca6 ? 16'h0002 :  // <0967> a = i
addr == 16'hca7 ? 16'h0601 :  // <0967> b = 1
addr == 16'hca8 ? 16'hc800 :  // <0967> i = a+b
addr == 16'hca9 ? 16'h0b00 :  // <0967> "


addr == 16'hcaa ? 16'h0002 :  // <0967> a = i
addr == 16'hcab ? 16'h0604 :  // <0967> b = $tps_history_len
addr == 16'hcac ? 16'he005 :  // <0967> br lt :loop_3219
addr == 16'hcad ? 16'h0c94 :  // <0967> "

// :end_3219 // = 0x0cae
// memorize average.
addr == 16'hcae ? 16'h0004 :  // <0969> a = x
addr == 16'hcaf ? 16'h0350 :  // <0970> a = a>>1
addr == 16'hcb0 ? 16'h1b50 :  // <0971> ga = a>>1
addr == 16'hcb1 ? 16'h6600 :  // <0972> ram $ram_tps_avg = ga // av_ad_hi = 0
addr == 16'hcb2 ? 16'h6ab0 :  // <0972> ram $ram_tps_avg = ga // av_ad_lo = 176
addr == 16'hcb3 ? 16'h5c06 :  // <0972> ram $ram_tps_avg = ga // av_write_data = ga

// :end // = 0x0cb4

addr == 16'hcb4 ? 16'h1c0c :  // <0976> pop gb // func interpret_tps
addr == 16'hcb5 ? 16'h180c :  // <0976> pop ga // "
addr == 16'hcb6 ? 16'h140c :  // <0976> pop y // "
addr == 16'hcb7 ? 16'h100c :  // <0976> pop x // "
addr == 16'hcb8 ? 16'h080c :  // <0976> pop i // "
addr == 16'hcb9 ? 16'hfc00 :  // <0976> swapra = nop

// ######## func jf_to_rpm // = 0x0cba
addr == 16'hcba ? 16'h303e :  // <0986> push rtna // func jf_to_rpm

// resolution = 32 rpm.
addr == 16'hcbb ? 16'h0408 :  // <0979> b = jiffies
addr == 16'hcbc ? 16'h03a0 :  // <0980> a = 0x5573
addr == 16'hcbd ? 16'h5573 :  // <0980> "
// = 700000 >> 5
addr == 16'hcbe ? 16'hfba0 :  // <0982> call :divide
addr == 16'hcbf ? 16'h019c :  // <0982> "
addr == 16'hcc0 ? 16'hfc00 :  // <0982> "
addr == 16'hcc1 ? 16'h0001 :  // <0983> a = b
addr == 16'hcc2 ? 16'h0352 :  // <0984> a = a<<4
addr == 16'hcc3 ? 16'h2351 :  // <0985> rpm = a<<1

addr == 16'hcc4 ? 16'hf80c :  // <0987> pop rtna // func jf_to_rpm
addr == 16'hcc5 ? 16'hfc00 :  // <0987> swapra = nop

// ######## func check_engine_stop // = 0x0cc6
addr == 16'hcc6 ? 16'h303e :  // <1003> push rtna // func check_engine_stop

// returns 1 if transitioned to stop, else 0.

// transition to plan_stop if ignition switch is turned off AND rpm estimate is invalid.
// requiring both conditions prevents spurious noise readings from shutting down the injection.

addr == 16'hcc7 ? 16'h0022 :  // <1001> a = power_duty
addr == 16'hcc8 ? 16'h0680 :  // <1001> b = ( 0x0080 )

addr == 16'hcc9 ? 16'he003 :  // <0993> br and0z :else_3273
addr == 16'hcca ? 16'h0cde :  // <0993> "

addr == 16'hccb ? 16'h6600 :  // <0994> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'hccc ? 16'h6a80 :  // <0994> ram a = $ram_rpm_valid // av_ad_lo = 128
addr == 16'hccd ? 16'h0017 :  // <0994> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'hcce ? 16'h0018 :  // <0994> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle

addr == 16'hccf ? 16'h0000 :  // <1000> a = a
addr == 16'hcd0 ? 16'h0600 :  // <1000> b = 0

addr == 16'hcd1 ? 16'he407 :  // <0995> bn eq :else_3281
addr == 16'hcd2 ? 16'h0cde :  // <0995> "

addr == 16'hcd3 ? 16'h6600 :  // <0996> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'hcd4 ? 16'h6a90 :  // <0996> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'hcd5 ? 16'hf817 :  // <0996> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'hcd6 ? 16'hf818 :  // <0996> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'hcd7 ? 16'hfc00 :  // <0997> swapra = nop
addr == 16'hcd8 ? 16'hfba0 :  // <0999> callx  init_plan_stop
addr == 16'hcd9 ? 16'h0443 :  // <0999> "
addr == 16'hcda ? 16'hfc00 :  // <0999> "
addr == 16'hcdb ? 16'h2201 :  // <1000> did_stop = 1
addr == 16'hcdc ? 16'hf80c :  // <1000> pop rtna // rtn 1
addr == 16'hcdd ? 16'hfc00 :  // <0999> swapra = nop


addr == 16'hcde ? 16'h2200 :  // <1002> did_stop = 0
addr == 16'hcdf ? 16'hf80c :  // <1002> pop rtna // rtn 0
addr == 16'hce0 ? 16'hfc00 :  // <1001> swapra = nop

addr == 16'hce1 ? 16'hf80c :  // <1004> pop rtna // func check_engine_stop
addr == 16'hce2 ? 16'hfc00 :  // <1004> swapra = nop


        
                16'hxxxx;
        endmodule
    
