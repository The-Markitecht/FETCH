
        `include "header.v"

        module target_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.

addr == 16'h00 ? 16'he00f :  // <0004> jmp :main
addr == 16'h01 ? 16'h077b :  // <0004> "


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

addr == 16'h02 ? 16'h0022 :  // <0189> emit_debugger_register_table  counter
// "       a"
addr == 16'h03 ? 16'h2020 :  // <0189>   
addr == 16'h04 ? 16'h2020 :  // <0189>   
addr == 16'h05 ? 16'h2020 :  // <0189>   
addr == 16'h06 ? 16'h6120 :  // <0189> a 
// "       b"
addr == 16'h07 ? 16'h2020 :  // <0189>   
addr == 16'h08 ? 16'h2020 :  // <0189>   
addr == 16'h09 ? 16'h2020 :  // <0189>   
addr == 16'h0a ? 16'h6220 :  // <0189> b 
// "       i"
addr == 16'h0b ? 16'h2020 :  // <0189>   
addr == 16'h0c ? 16'h2020 :  // <0189>   
addr == 16'h0d ? 16'h2020 :  // <0189>   
addr == 16'h0e ? 16'h6920 :  // <0189> i 
// "       j"
addr == 16'h0f ? 16'h2020 :  // <0189>   
addr == 16'h10 ? 16'h2020 :  // <0189>   
addr == 16'h11 ? 16'h2020 :  // <0189>   
addr == 16'h12 ? 16'h6a20 :  // <0189> j 
// "       x"
addr == 16'h13 ? 16'h2020 :  // <0189>   
addr == 16'h14 ? 16'h2020 :  // <0189>   
addr == 16'h15 ? 16'h2020 :  // <0189>   
addr == 16'h16 ? 16'h7820 :  // <0189> x 
// "       y"
addr == 16'h17 ? 16'h2020 :  // <0189>   
addr == 16'h18 ? 16'h2020 :  // <0189>   
addr == 16'h19 ? 16'h2020 :  // <0189>   
addr == 16'h1a ? 16'h7920 :  // <0189> y 
// "      ga"
addr == 16'h1b ? 16'h2020 :  // <0189>   
addr == 16'h1c ? 16'h2020 :  // <0189>   
addr == 16'h1d ? 16'h2020 :  // <0189>   
addr == 16'h1e ? 16'h6167 :  // <0189> ag
// "      gb"
addr == 16'h1f ? 16'h2020 :  // <0189>   
addr == 16'h20 ? 16'h2020 :  // <0189>   
addr == 16'h21 ? 16'h2020 :  // <0189>   
addr == 16'h22 ? 16'h6267 :  // <0189> bg
// "      pa"
addr == 16'h23 ? 16'h2020 :  // <0189>   
addr == 16'h24 ? 16'h2020 :  // <0189>   
addr == 16'h25 ? 16'h2020 :  // <0189>   
addr == 16'h26 ? 16'h6170 :  // <0189> ap
// "      pb"
addr == 16'h27 ? 16'h2020 :  // <0189>   
addr == 16'h28 ? 16'h2020 :  // <0189>   
addr == 16'h29 ? 16'h2020 :  // <0189>   
addr == 16'h2a ? 16'h6270 :  // <0189> bp
// "      pc"
addr == 16'h2b ? 16'h2020 :  // <0189>   
addr == 16'h2c ? 16'h2020 :  // <0189>   
addr == 16'h2d ? 16'h2020 :  // <0189>   
addr == 16'h2e ? 16'h6370 :  // <0189> cp
// "      pd"
addr == 16'h2f ? 16'h2020 :  // <0189>   
addr == 16'h30 ? 16'h2020 :  // <0189>   
addr == 16'h31 ? 16'h2020 :  // <0189>   
addr == 16'h32 ? 16'h6470 :  // <0189> dp
// "//rstk  "
addr == 16'h33 ? 16'h2f2f :  // <0189> //
addr == 16'h34 ? 16'h7372 :  // <0189> sr
addr == 16'h35 ? 16'h6b74 :  // <0189> kt
addr == 16'h36 ? 16'h2020 :  // <0189>   
// "  ev_pri"
addr == 16'h37 ? 16'h2020 :  // <0189>   
addr == 16'h38 ? 16'h7665 :  // <0189> ve
addr == 16'h39 ? 16'h705f :  // <0189> p_
addr == 16'h3a ? 16'h6972 :  // <0189> ir
// "softevnt"
addr == 16'h3b ? 16'h6f73 :  // <0189> os
addr == 16'h3c ? 16'h7466 :  // <0189> tf
addr == 16'h3d ? 16'h7665 :  // <0189> ve
addr == 16'h3e ? 16'h746e :  // <0189> tn
// "   usage"
addr == 16'h3f ? 16'h2020 :  // <0189>   
addr == 16'h40 ? 16'h7520 :  // <0189> u 
addr == 16'h41 ? 16'h6173 :  // <0189> as
addr == 16'h42 ? 16'h6567 :  // <0189> eg
// "ustimer0"
addr == 16'h43 ? 16'h7375 :  // <0189> su
addr == 16'h44 ? 16'h6974 :  // <0189> it
addr == 16'h45 ? 16'h656d :  // <0189> em
addr == 16'h46 ? 16'h3072 :  // <0189> 0r
// "mstimer0"
addr == 16'h47 ? 16'h736d :  // <0189> sm
addr == 16'h48 ? 16'h6974 :  // <0189> it
addr == 16'h49 ? 16'h656d :  // <0189> em
addr == 16'h4a ? 16'h3072 :  // <0189> 0r
// "mstimer1"
addr == 16'h4b ? 16'h736d :  // <0189> sm
addr == 16'h4c ? 16'h6974 :  // <0189> it
addr == 16'h4d ? 16'h656d :  // <0189> em
addr == 16'h4e ? 16'h3172 :  // <0189> 1r
// "mstimer2"
addr == 16'h4f ? 16'h736d :  // <0189> sm
addr == 16'h50 ? 16'h6974 :  // <0189> it
addr == 16'h51 ? 16'h656d :  // <0189> em
addr == 16'h52 ? 16'h3272 :  // <0189> 2r
// "spi_data"
addr == 16'h53 ? 16'h7073 :  // <0189> ps
addr == 16'h54 ? 16'h5f69 :  // <0189> _i
addr == 16'h55 ? 16'h6164 :  // <0189> ad
addr == 16'h56 ? 16'h6174 :  // <0189> at
// "//avwrdt"
addr == 16'h57 ? 16'h2f2f :  // <0189> //
addr == 16'h58 ? 16'h7661 :  // <0189> va
addr == 16'h59 ? 16'h7277 :  // <0189> rw
addr == 16'h5a ? 16'h7464 :  // <0189> td
// "av_rd_dt"
addr == 16'h5b ? 16'h7661 :  // <0189> va
addr == 16'h5c ? 16'h725f :  // <0189> r_
addr == 16'h5d ? 16'h5f64 :  // <0189> _d
addr == 16'h5e ? 16'h7464 :  // <0189> td
// "av_ad_hi"
addr == 16'h5f ? 16'h7661 :  // <0189> va
addr == 16'h60 ? 16'h615f :  // <0189> a_
addr == 16'h61 ? 16'h5f64 :  // <0189> _d
addr == 16'h62 ? 16'h6968 :  // <0189> ih
// "av_ad_lo"
addr == 16'h63 ? 16'h7661 :  // <0189> va
addr == 16'h64 ? 16'h615f :  // <0189> a_
addr == 16'h65 ? 16'h5f64 :  // <0189> _d
addr == 16'h66 ? 16'h6f6c :  // <0189> ol
// "//uartdt"
addr == 16'h67 ? 16'h2f2f :  // <0189> //
addr == 16'h68 ? 16'h6175 :  // <0189> au
addr == 16'h69 ? 16'h7472 :  // <0189> tr
addr == 16'h6a ? 16'h7464 :  // <0189> td
// "uartstat"
addr == 16'h6b ? 16'h6175 :  // <0189> au
addr == 16'h6c ? 16'h7472 :  // <0189> tr
addr == 16'h6d ? 16'h7473 :  // <0189> ts
addr == 16'h6e ? 16'h7461 :  // <0189> ta
// "    leds"
addr == 16'h6f ? 16'h2020 :  // <0189>   
addr == 16'h70 ? 16'h2020 :  // <0189>   
addr == 16'h71 ? 16'h656c :  // <0189> el
addr == 16'h72 ? 16'h7364 :  // <0189> sd
// "brd_ctrl"
addr == 16'h73 ? 16'h7262 :  // <0189> rb
addr == 16'h74 ? 16'h5f64 :  // <0189> _d
addr == 16'h75 ? 16'h7463 :  // <0189> tc
addr == 16'h76 ? 16'h6c72 :  // <0189> lr
// "   anmux"
addr == 16'h77 ? 16'h2020 :  // <0189>   
addr == 16'h78 ? 16'h6120 :  // <0189> a 
addr == 16'h79 ? 16'h6d6e :  // <0189> mn
addr == 16'h7a ? 16'h7875 :  // <0189> xu
// "pwr_duty"
addr == 16'h7b ? 16'h7770 :  // <0189> wp
addr == 16'h7c ? 16'h5f72 :  // <0189> _r
addr == 16'h7d ? 16'h7564 :  // <0189> ud
addr == 16'h7e ? 16'h7974 :  // <0189> yt
// "igntmcap"
addr == 16'h7f ? 16'h6769 :  // <0189> gi
addr == 16'h80 ? 16'h746e :  // <0189> tn
addr == 16'h81 ? 16'h636d :  // <0189> cm
addr == 16'h82 ? 16'h7061 :  // <0189> pa
// "igntmout"
addr == 16'h83 ? 16'h6769 :  // <0189> gi
addr == 16'h84 ? 16'h746e :  // <0189> tn
addr == 16'h85 ? 16'h6f6d :  // <0189> om
addr == 16'h86 ? 16'h7475 :  // <0189> tu
// "puflenus"
addr == 16'h87 ? 16'h7570 :  // <0189> up
addr == 16'h88 ? 16'h6c66 :  // <0189> lf
addr == 16'h89 ? 16'h6e65 :  // <0189> ne
addr == 16'h8a ? 16'h7375 :  // <0189> su

// string resources
// :boot_msg // = 0x008b
// "TGT\r\n\x0"
addr == 16'h8b ? 16'h4754 :  // <0193> GT
addr == 16'h8c ? 16'h0d54 :  // <0193>  T
addr == 16'h8d ? 16'h000a :  // <0193>   

// libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.

// event loop.  this infrastructure is assembled directly into the main program, not a func.
// first instruction of an event handler should be the 7th cycle after reading its priority from the event controller here.
// :poll_events // = 0x008e
// initialize prior to polling loop, for minimum latency.
addr == 16'h8e ? 16'h07a0 :  // <0006> b = :event_table
addr == 16'h8f ? 16'h07e1 :  // <0006> "
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
addr == 16'ha3 ? 16'hfc00 :  // <0057> swapra = nop

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
addr == 16'ha9 ? 16'hfc00 :  // <0068> swapra = nop

// returns a character in a, or -1 if none.
// ######## func pollchar_fduart // = 0x00aa
// check for FIFO is populated.
addr == 16'haa ? 16'h0208 :  // <0074> a = $arx_fifo_empty_mask
addr == 16'hab ? 16'h041a :  // <0075> b = fduart_status
addr == 16'hac ? 16'he403 :  // <0076> bn and0z :none
addr == 16'had ? 16'h00b0 :  // <0076> "
addr == 16'hae ? 16'h0019 :  // <0077> a = fduart_data
addr == 16'haf ? 16'hfc00 :  // <0077> swapra = nop
// :none // = 0x00b0
addr == 16'hb0 ? 16'h0360 :  // <0080> a = -1
addr == 16'hb1 ? 16'hfc00 :  // <0080> swapra = nop


// pass desired anmux channel in a.
// after this returns, CALLER MUST WAIT for muxer & current driver to
// settle down.  some delay for that is absolutely required (per testing).
// 5 ms wait works well 2015/04.
// ######## func anmux_set_chn // = 0x00b2
// set & enable analog muxer
addr == 16'hb2 ? 16'h0608 :  // <0007> b = $anmux_enable_mask
addr == 16'hb3 ? 16'hc800 :  // <0008> anmux_ctrl = or
addr == 16'hb4 ? 16'h7734 :  // <0008> "
addr == 16'hb5 ? 16'hfc00 :  // <0008> swapra = nop

// ######## func anmux_get_chn // = 0x00b6
addr == 16'hb6 ? 16'h001d :  // <0012> a = anmux_ctrl
addr == 16'hb7 ? 16'h0607 :  // <0013> b = $anmux_channel_mask
addr == 16'hb8 ? 16'hc800 :  // <0014> a = and
addr == 16'hb9 ? 16'h0330 :  // <0014> "
addr == 16'hba ? 16'hfc00 :  // <0014> swapra = nop


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
addr == 16'hfb ? 16'hfc00 :  // <0086> swapra = nop

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
addr == 16'h120 ? 16'hfc00 :  // <0111> swapra = nop
// :fail // = 0x0121
addr == 16'h121 ? 16'h0760 :  // <0114> b = -1
addr == 16'h122 ? 16'hf80c :  // <0115> pop rtna // end_func
addr == 16'h123 ? 16'h140c :  // <0115> pop y // "
addr == 16'h124 ? 16'h100c :  // <0115> pop x // "
addr == 16'h125 ? 16'h0c0c :  // <0115> pop j // "
addr == 16'h126 ? 16'h080c :  // <0115> pop i // "
addr == 16'h127 ? 16'hfc00 :  // <0114> swapra = nop

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
addr == 16'h14e ? 16'hfc00 :  // <0140> swapra = nop

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
addr == 16'h16f ? 16'hfc00 :  // <0165> swapra = nop


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
addr == 16'h18b ? 16'hfc00 :  // <0026> swapra = nop

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
addr == 16'h1cc ? 16'hfc00 :  // <0111> swapra = nop

// :zero // = 0x01cd
addr == 16'h1cd ? 16'h0600 :  // <0115> b = 0
addr == 16'h1ce ? 16'h1c0c :  // <0116> pop g7 // rtn
addr == 16'h1cf ? 16'h180c :  // <0116> pop g6 // "
addr == 16'h1d0 ? 16'h140c :  // <0116> pop y // "
addr == 16'h1d1 ? 16'h100c :  // <0116> pop x // "
addr == 16'h1d2 ? 16'h0c0c :  // <0116> pop j // "
addr == 16'h1d3 ? 16'h080c :  // <0116> pop i // "
addr == 16'h1d4 ? 16'hfc00 :  // <0115> swapra = nop
addr == 16'h1d5 ? 16'h1c0c :  // <0117> pop g7 // end_func
addr == 16'h1d6 ? 16'h180c :  // <0117> pop g6 // "
addr == 16'h1d7 ? 16'h140c :  // <0117> pop y // "
addr == 16'h1d8 ? 16'h100c :  // <0117> pop x // "
addr == 16'h1d9 ? 16'h0c0c :  // <0117> pop j // "
addr == 16'h1da ? 16'h080c :  // <0117> pop i // "
addr == 16'h1db ? 16'hfc00 :  // <0116> swapra = nop


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
addr == 16'h1e6 ? 16'hfc00 :  // <0011> swapra = nop
// :pick_byte_even // = 0x01e7
addr == 16'h1e7 ? 16'h0350 :  // <0014> a = a>>1
addr == 16'h1e8 ? 16'h0404 :  // <0015> b = x
addr == 16'h1e9 ? 16'hc800 :  // <0016> fetch a from a+b
addr == 16'h1ea ? 16'hd300 :  // <0016> "
addr == 16'h1eb ? 16'h03b0 :  // <0016> "
addr == 16'h1ec ? 16'h06ff :  // <0017> b = 0xff
addr == 16'h1ed ? 16'hc800 :  // <0018> a = and
addr == 16'h1ee ? 16'h0330 :  // <0018> "
addr == 16'h1ef ? 16'hfc00 :  // <0018> swapra = nop

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
addr == 16'h205 ? 16'hfc00 :  // <0038> swapra = nop
// :fail // = 0x0206
addr == 16'h206 ? 16'h0360 :  // <0041> a = -1
addr == 16'h207 ? 16'hf80c :  // <0042> pop rtna // end_func
addr == 16'h208 ? 16'h140c :  // <0042> pop y // "
addr == 16'h209 ? 16'h0c0c :  // <0042> pop j // "
addr == 16'h20a ? 16'h080c :  // <0042> pop i // "
addr == 16'h20b ? 16'hfc00 :  // <0041> swapra = nop


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
addr == 16'h21c ? 16'hfc00 :  // <0015> swapra = nop




// when commands share a common suffix, the longer command must come FIRST here.
// :cmd_table // = 0x021d
// "  hello"
addr == 16'h21d ? 16'h2020 :  // <0006>   
addr == 16'h21e ? 16'h6568 :  // <0006> eh
addr == 16'h21f ? 16'h6c6c :  // <0006> ll
addr == 16'h220 ? 16'h006f :  // <0006>  o
addr == 16'h221 ? 16'h02e5 :  // <0007> ([label hello_cmd])
// "  plstp"
addr == 16'h222 ? 16'h2020 :  // <0008>   
addr == 16'h223 ? 16'h6c70 :  // <0008> lp
addr == 16'h224 ? 16'h7473 :  // <0008> ts
addr == 16'h225 ? 16'h0070 :  // <0008>  p
addr == 16'h226 ? 16'h02e9 :  // <0009> ([label set_plan_stop_cmd])
// "   plcr"
addr == 16'h227 ? 16'h2020 :  // <0010>   
addr == 16'h228 ? 16'h7020 :  // <0010> p 
addr == 16'h229 ? 16'h636c :  // <0010> cl
addr == 16'h22a ? 16'h0072 :  // <0010>  r
addr == 16'h22b ? 16'h02f4 :  // <0011> ([label set_plan_crank_cmd])
// "   plwm"
addr == 16'h22c ? 16'h2020 :  // <0012>   
addr == 16'h22d ? 16'h7020 :  // <0012> p 
addr == 16'h22e ? 16'h776c :  // <0012> wl
addr == 16'h22f ? 16'h006d :  // <0012>  m
addr == 16'h230 ? 16'h02ff :  // <0013> ([label set_plan_warmup_cmd])
// "   plrn"
addr == 16'h231 ? 16'h2020 :  // <0014>   
addr == 16'h232 ? 16'h7020 :  // <0014> p 
addr == 16'h233 ? 16'h726c :  // <0014> rl
addr == 16'h234 ? 16'h006e :  // <0014>  n
addr == 16'h235 ? 16'h030a :  // <0015> ([label set_plan_run_cmd])
// "   plln"
addr == 16'h236 ? 16'h2020 :  // <0016>   
addr == 16'h237 ? 16'h7020 :  // <0016> p 
addr == 16'h238 ? 16'h6c6c :  // <0016> ll
addr == 16'h239 ? 16'h006e :  // <0016>  n
addr == 16'h23a ? 16'h0315 :  // <0017> ([label set_plan_learn_cmd])
// " ldsmap"
addr == 16'h23b ? 16'h6c20 :  // <0018> l 
addr == 16'h23c ? 16'h7364 :  // <0018> sd
addr == 16'h23d ? 16'h616d :  // <0018> am
addr == 16'h23e ? 16'h0070 :  // <0018>  p
addr == 16'h23f ? 16'h064e :  // <0019> ([label load_smap_cmd])
// " clsmap"
addr == 16'h240 ? 16'h6320 :  // <0020> c 
addr == 16'h241 ? 16'h736c :  // <0020> sl
addr == 16'h242 ? 16'h616d :  // <0020> am
addr == 16'h243 ? 16'h0070 :  // <0020>  p
addr == 16'h244 ? 16'h066a :  // <0021> ([label clear_smap_cmd])
// "   smap"
addr == 16'h245 ? 16'h2020 :  // <0022>   
addr == 16'h246 ? 16'h7320 :  // <0022> s 
addr == 16'h247 ? 16'h616d :  // <0022> am
addr == 16'h248 ? 16'h0070 :  // <0022>  p
addr == 16'h249 ? 16'h05a2 :  // <0023> ([label dump_smap_cmd])
// "   ltps"
addr == 16'h24a ? 16'h2020 :  // <0024>   
addr == 16'h24b ? 16'h6c20 :  // <0024> l 
addr == 16'h24c ? 16'h7074 :  // <0024> pt
addr == 16'h24d ? 16'h0073 :  // <0024>  s
addr == 16'h24e ? 16'h06a2 :  // <0025> ([label learn_tps_ref_cmd])
// " ldtpsr"
addr == 16'h24f ? 16'h6c20 :  // <0026> l 
addr == 16'h250 ? 16'h7464 :  // <0026> td
addr == 16'h251 ? 16'h7370 :  // <0026> sp
addr == 16'h252 ? 16'h0072 :  // <0026>  r
addr == 16'h253 ? 16'h067f :  // <0027> ([label load_tps_ref_cmd])
// " ldtpse"
addr == 16'h254 ? 16'h6c20 :  // <0028> l 
addr == 16'h255 ? 16'h7464 :  // <0028> td
addr == 16'h256 ? 16'h7370 :  // <0028> sp
addr == 16'h257 ? 16'h0065 :  // <0028>  e
addr == 16'h258 ? 16'h0632 :  // <0029> ([label load_tps_enrich_cmd])
// "      ,"
addr == 16'h259 ? 16'h2020 :  // <0030>   
addr == 16'h25a ? 16'h2020 :  // <0030>   
addr == 16'h25b ? 16'h2020 :  // <0030>   
addr == 16'h25c ? 16'h002c :  // <0030>  ,
addr == 16'h25d ? 16'h06b9 :  // <0031> ([label trim_lean_cmd])
// "      ."
addr == 16'h25e ? 16'h2020 :  // <0032>   
addr == 16'h25f ? 16'h2020 :  // <0032>   
addr == 16'h260 ? 16'h2020 :  // <0032>   
addr == 16'h261 ? 16'h002e :  // <0032>  .
addr == 16'h262 ? 16'h06ca :  // <0033> ([label trim_rich_cmd])
// "      \["
addr == 16'h263 ? 16'h2020 :  // <0034>   
addr == 16'h264 ? 16'h2020 :  // <0034>   
addr == 16'h265 ? 16'h2020 :  // <0034>   
addr == 16'h266 ? 16'h005b :  // <0034>  [
addr == 16'h267 ? 16'h06db :  // <0035> ([label trim_2lean_cmd])
// "      \]"
addr == 16'h268 ? 16'h2020 :  // <0036>   
addr == 16'h269 ? 16'h2020 :  // <0036>   
addr == 16'h26a ? 16'h2020 :  // <0036>   
addr == 16'h26b ? 16'h005d :  // <0036>  ]
addr == 16'h26c ? 16'h06ec :  // <0037> ([label trim_2rich_cmd])
// "\x0\x0"
addr == 16'h26d ? 16'h0000 :  // <0038>   


// ######## func parse_key // = 0x026e
addr == 16'h26e ? 16'h3002 :  // <0056> push i // func parse_key
addr == 16'h26f ? 16'h3004 :  // <0056> push x // "
addr == 16'h270 ? 16'h3005 :  // <0056> push y // "
addr == 16'h271 ? 16'h303e :  // <0056> push rtna // "

// memorize into ram_key_buf, pushing down existing content.
addr == 16'h272 ? 16'h1008 :  // <0043> x = key
addr == 16'h273 ? 16'h0a07 :  // <0052> i = $key_buf_max
// :loop_627 // = 0x0274

addr == 16'h274 ? 16'h0002 :  // <0044> a = i

addr == 16'h275 ? 16'h0351 :  // <0045> a = a<<1
addr == 16'h276 ? 16'h0600 :  // <0045> b = 0
addr == 16'h277 ? 16'h5e00 :  // <0045> av_ad_hi = 0
addr == 16'h278 ? 16'h6300 :  // <0045> av_ad_lo = ad0
addr == 16'h279 ? 16'h0415 :  // <0045> b = av_write_data
addr == 16'h27a ? 16'h0416 :  // <0045> b = av_read_data

addr == 16'h27b ? 16'h1401 :  // <0046> y = b
addr == 16'h27c ? 16'h0002 :  // <0047> a = i
addr == 16'h27d ? 16'h0404 :  // <0048> b = x

addr == 16'h27e ? 16'h0351 :  // <0049> a = a<<1
addr == 16'h27f ? 16'h3001 :  // <0049> push b // push b
addr == 16'h280 ? 16'h0600 :  // <0049> b = 0
addr == 16'h281 ? 16'h5e00 :  // <0049> av_ad_hi = 0
addr == 16'h282 ? 16'h6300 :  // <0049> av_ad_lo = ad0
addr == 16'h283 ? 16'h540c :  // <0049> pop av_write_data // pop av_write_data

addr == 16'h284 ? 16'h1005 :  // <0050> x = y


addr == 16'h285 ? 16'h0002 :  // <0052> a = i
addr == 16'h286 ? 16'h0600 :  // <0052> b = 0
addr == 16'h287 ? 16'he007 :  // <0052> br eq :end_627
addr == 16'h288 ? 16'h0291 :  // <0052> "


addr == 16'h289 ? 16'h0002 :  // <0052> a = i
addr == 16'h28a ? 16'h0760 :  // <0052> b = -1
addr == 16'h28b ? 16'hc800 :  // <0052> i = a+b
addr == 16'h28c ? 16'h0b00 :  // <0052> "


addr == 16'h28d ? 16'h0002 :  // <0052> a = i
addr == 16'h28e ? 16'h0600 :  // <0052> b = 0
addr == 16'h28f ? 16'he405 :  // <0052> bn lt :loop_627
addr == 16'h290 ? 16'h0274 :  // <0052> "

// :end_627 // = 0x0291

addr == 16'h291 ? 16'h0008 :  // <0055> a = key
addr == 16'h292 ? 16'h060d :  // <0055> b = 13

addr == 16'h293 ? 16'he407 :  // <0053> bn eq :else_659
addr == 16'h294 ? 16'h0298 :  // <0053> "

addr == 16'h295 ? 16'hfba0 :  // <0054> callx  parse_command
addr == 16'h296 ? 16'h029f :  // <0054> "
addr == 16'h297 ? 16'hfc00 :  // <0054> "


addr == 16'h298 ? 16'hf80c :  // <0057> pop rtna // func parse_key
addr == 16'h299 ? 16'h140c :  // <0057> pop y // "
addr == 16'h29a ? 16'h100c :  // <0057> pop x // "
addr == 16'h29b ? 16'h080c :  // <0057> pop i // "
addr == 16'h29c ? 16'hfc00 :  // <0057> swapra = nop

// :cmd_ack_msg // = 0x029d
// "OK\x0"
addr == 16'h29d ? 16'h4b4f :  // <0059> KO
addr == 16'h29e ? 16'h0000 :  // <0059>   

// ######## func parse_command // = 0x029f
addr == 16'h29f ? 16'h3002 :  // <0100> push i // func parse_command
addr == 16'h2a0 ? 16'h3004 :  // <0100> push x // "
addr == 16'h2a1 ? 16'h3005 :  // <0100> push y // "
addr == 16'h2a2 ? 16'h303e :  // <0100> push rtna // "

addr == 16'h2a3 ? 16'h13a0 :  // <0062> x = :cmd_table
addr == 16'h2a4 ? 16'h021d :  // <0062> "
// :next_cmd // = 0x02a5
addr == 16'h2a5 ? 16'hd004 :  // <0064> fetch a from x
addr == 16'h2a6 ? 16'h03b0 :  // <0064> "
addr == 16'h2a7 ? 16'he000 :  // <0065> br az :done
addr == 16'h2a8 ? 16'h02e0 :  // <0065> "

addr == 16'h2a9 ? 16'h0a00 :  // <0081> i = 0
// :loop_681 // = 0x02aa

addr == 16'h2aa ? 16'h0002 :  // <0067> a = i
addr == 16'h2ab ? 16'hfba0 :  // <0068> call :fetch_byte
addr == 16'h2ac ? 16'h01dc :  // <0068> "
addr == 16'h2ad ? 16'hfc00 :  // <0068> "
addr == 16'h2ae ? 16'h1400 :  // <0069> y = a
addr == 16'h2af ? 16'h0620 :  // <0070> b = 32 // asc b = " "

addr == 16'h2b0 ? 16'h0000 :  // <0079> a = a
addr == 16'h2b1 ? 16'h0401 :  // <0079> b = b

addr == 16'h2b2 ? 16'he007 :  // <0071> br eq :else_690
addr == 16'h2b3 ? 16'h02c1 :  // <0071> "

addr == 16'h2b4 ? 16'h062a :  // <0072> b = 42 // asc b = "*"
addr == 16'h2b5 ? 16'he007 :  // <0073> br eq :matched
addr == 16'h2b6 ? 16'h02c9 :  // <0073> "
// parameter character.  succeed early.
addr == 16'h2b7 ? 16'h0002 :  // <0075> a = i

addr == 16'h2b8 ? 16'h0351 :  // <0076> a = a<<1
addr == 16'h2b9 ? 16'h0600 :  // <0076> b = 0
addr == 16'h2ba ? 16'h5e00 :  // <0076> av_ad_hi = 0
addr == 16'h2bb ? 16'h6300 :  // <0076> av_ad_lo = ad0
addr == 16'h2bc ? 16'h0415 :  // <0076> b = av_write_data
addr == 16'h2bd ? 16'h0416 :  // <0076> b = av_read_data

addr == 16'h2be ? 16'h0005 :  // <0077> a = y
addr == 16'h2bf ? 16'he407 :  // <0078> bn eq :no_match
addr == 16'h2c0 ? 16'h02d5 :  // <0078> "



addr == 16'h2c1 ? 16'h0002 :  // <0081> a = i
addr == 16'h2c2 ? 16'h0601 :  // <0081> b = 1
addr == 16'h2c3 ? 16'hc800 :  // <0081> i = a+b
addr == 16'h2c4 ? 16'h0b00 :  // <0081> "


addr == 16'h2c5 ? 16'h0002 :  // <0081> a = i
addr == 16'h2c6 ? 16'h0607 :  // <0081> b = $key_buf_max
addr == 16'h2c7 ? 16'he005 :  // <0081> br lt :loop_681
addr == 16'h2c8 ? 16'h02aa :  // <0081> "

// :end_681 // = 0x02c9

// at this point we have a match on the record beginning at x.
// :matched // = 0x02c9
addr == 16'h2c9 ? 16'h23a0 :  // <0085> pa = :cmd_ack_msg
addr == 16'h2ca ? 16'h029d :  // <0085> "
addr == 16'h2cb ? 16'hfba0 :  // <0085> callx  set_text_flag  :cmd_ack_msg
addr == 16'h2cc ? 16'h0b26 :  // <0085> "
addr == 16'h2cd ? 16'hfc00 :  // <0085> "
addr == 16'h2ce ? 16'h1604 :  // <0086> y = ($key_buf_len / 2)
addr == 16'h2cf ? 16'hc800 :  // <0087> fetch rtna from x+y
addr == 16'h2d0 ? 16'hd320 :  // <0087> "
addr == 16'h2d1 ? 16'hfbb0 :  // <0087> "
addr == 16'h2d2 ? 16'hfc00 :  // <0088> swapra = nop
addr == 16'h2d3 ? 16'he00f :  // <0090> jmp :done
addr == 16'h2d4 ? 16'h02e0 :  // <0090> "

// :no_match // = 0x02d5
// if ram_terminal_connected is still 0, quit searching after the very first command in the table.
addr == 16'h2d5 ? 16'h5e00 :  // <0094> ram a = $ram_terminal_connected // av_ad_hi = 0
addr == 16'h2d6 ? 16'h6294 :  // <0094> ram a = $ram_terminal_connected // av_ad_lo = 148
addr == 16'h2d7 ? 16'h0015 :  // <0094> ram a = $ram_terminal_connected // a = av_write_data // start read cycle
addr == 16'h2d8 ? 16'h0016 :  // <0094> ram a = $ram_terminal_connected // a = av_read_data // finish read cycle
addr == 16'h2d9 ? 16'he000 :  // <0095> br az :done
addr == 16'h2da ? 16'h02e0 :  // <0095> "

addr == 16'h2db ? 16'h1605 :  // <0097> y = (($key_buf_len / 2) + 1)
addr == 16'h2dc ? 16'hc800 :  // <0098> x = x+y
addr == 16'h2dd ? 16'h1320 :  // <0098> "
addr == 16'h2de ? 16'he00f :  // <0099> jmp :next_cmd
addr == 16'h2df ? 16'h02a5 :  // <0099> "
// :done // = 0x02e0

addr == 16'h2e0 ? 16'hf80c :  // <0102> pop rtna // func parse_command
addr == 16'h2e1 ? 16'h140c :  // <0102> pop y // "
addr == 16'h2e2 ? 16'h100c :  // <0102> pop x // "
addr == 16'h2e3 ? 16'h080c :  // <0102> pop i // "
addr == 16'h2e4 ? 16'hfc00 :  // <0102> swapra = nop

// ######## func hello_cmd // = 0x02e5

addr == 16'h2e5 ? 16'h5e00 :  // <0104> ram $ram_terminal_connected = 1 // av_ad_hi = 0
addr == 16'h2e6 ? 16'h6294 :  // <0104> ram $ram_terminal_connected = 1 // av_ad_lo = 148
addr == 16'h2e7 ? 16'h5601 :  // <0104> ram $ram_terminal_connected = 1 // av_write_data = 1

addr == 16'h2e8 ? 16'hfc00 :  // <0106> swapra = nop

// ######## func set_plan_stop_cmd // = 0x02e9
addr == 16'h2e9 ? 16'h303e :  // <0111> push rtna // func set_plan_stop_cmd

addr == 16'h2ea ? 16'h5e00 :  // <0108> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h2eb ? 16'h628e :  // <0108> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'h2ec ? 16'hf815 :  // <0108> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h2ed ? 16'hf816 :  // <0108> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h2ee ? 16'hfc00 :  // <0109> swapra = nop
addr == 16'h2ef ? 16'hfba0 :  // <0111> callx  init_plan_stop
addr == 16'h2f0 ? 16'h0322 :  // <0111> "
addr == 16'h2f1 ? 16'hfc00 :  // <0111> "

addr == 16'h2f2 ? 16'hf80c :  // <0113> pop rtna // func set_plan_stop_cmd
addr == 16'h2f3 ? 16'hfc00 :  // <0113> swapra = nop

// ######## func set_plan_crank_cmd // = 0x02f4
addr == 16'h2f4 ? 16'h303e :  // <0118> push rtna // func set_plan_crank_cmd

addr == 16'h2f5 ? 16'h5e00 :  // <0115> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h2f6 ? 16'h628e :  // <0115> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'h2f7 ? 16'hf815 :  // <0115> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h2f8 ? 16'hf816 :  // <0115> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h2f9 ? 16'hfc00 :  // <0116> swapra = nop
addr == 16'h2fa ? 16'hfba0 :  // <0118> callx  init_plan_crank
addr == 16'h2fb ? 16'h0361 :  // <0118> "
addr == 16'h2fc ? 16'hfc00 :  // <0118> "

addr == 16'h2fd ? 16'hf80c :  // <0120> pop rtna // func set_plan_crank_cmd
addr == 16'h2fe ? 16'hfc00 :  // <0120> swapra = nop

// ######## func set_plan_warmup_cmd // = 0x02ff
addr == 16'h2ff ? 16'h303e :  // <0125> push rtna // func set_plan_warmup_cmd

addr == 16'h300 ? 16'h5e00 :  // <0122> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h301 ? 16'h628e :  // <0122> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'h302 ? 16'hf815 :  // <0122> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h303 ? 16'hf816 :  // <0122> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h304 ? 16'hfc00 :  // <0123> swapra = nop
addr == 16'h305 ? 16'hfba0 :  // <0125> callx  init_plan_warmup
addr == 16'h306 ? 16'h03c7 :  // <0125> "
addr == 16'h307 ? 16'hfc00 :  // <0125> "

addr == 16'h308 ? 16'hf80c :  // <0127> pop rtna // func set_plan_warmup_cmd
addr == 16'h309 ? 16'hfc00 :  // <0127> swapra = nop

// ######## func set_plan_run_cmd // = 0x030a
addr == 16'h30a ? 16'h303e :  // <0132> push rtna // func set_plan_run_cmd

addr == 16'h30b ? 16'h5e00 :  // <0129> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h30c ? 16'h628e :  // <0129> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'h30d ? 16'hf815 :  // <0129> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h30e ? 16'hf816 :  // <0129> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h30f ? 16'hfc00 :  // <0130> swapra = nop
addr == 16'h310 ? 16'hfba0 :  // <0132> callx  init_plan_run
addr == 16'h311 ? 16'h06fd :  // <0132> "
addr == 16'h312 ? 16'hfc00 :  // <0132> "

addr == 16'h313 ? 16'hf80c :  // <0134> pop rtna // func set_plan_run_cmd
addr == 16'h314 ? 16'hfc00 :  // <0134> swapra = nop

// ######## func set_plan_learn_cmd // = 0x0315
addr == 16'h315 ? 16'h303e :  // <0139> push rtna // func set_plan_learn_cmd

addr == 16'h316 ? 16'h5e00 :  // <0136> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h317 ? 16'h628e :  // <0136> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'h318 ? 16'hf815 :  // <0136> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h319 ? 16'hf816 :  // <0136> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h31a ? 16'hfc00 :  // <0137> swapra = nop
addr == 16'h31b ? 16'hfba0 :  // <0139> callx  init_plan_learn_stoich
addr == 16'h31c ? 16'h046c :  // <0139> "
addr == 16'h31d ? 16'hfc00 :  // <0139> "

addr == 16'h31e ? 16'hf80c :  // <0141> pop rtna // func set_plan_learn_cmd
addr == 16'h31f ? 16'hfc00 :  // <0141> swapra = nop


// :plan_name_stop // = 0x0320
// "STP\x0"
addr == 16'h320 ? 16'h5453 :  // <0002> TS
addr == 16'h321 ? 16'h0050 :  // <0002>  P

// ######## func init_plan_stop // = 0x0322
addr == 16'h322 ? 16'h303e :  // <0023> push rtna // func init_plan_stop

// set up the stop plan.
addr == 16'h323 ? 16'hfba0 :  // <0006> callx  clear_ign_history
addr == 16'h324 ? 16'h085c :  // <0006> "
addr == 16'h325 ? 16'hfc00 :  // <0006> "
// set noise filter to measure RPM between 50 and 1160 to indicate cranking.
addr == 16'h326 ? 16'h5e00 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_hi = 0
addr == 16'h327 ? 16'h6282 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_lo = 130
addr == 16'h328 ? 16'h57a0 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_write_data = 603
addr == 16'h329 ? 16'h025b :  // <0008> "
addr == 16'h32a ? 16'h5e00 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h32b ? 16'h6284 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 132
addr == 16'h32c ? 16'h57a0 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h32d ? 16'h36b0 :  // <0009> "
addr == 16'h32e ? 16'h83a0 :  // <0010> ign_timeout_len_jf = ([rpm_to_jf 50])
addr == 16'h32f ? 16'h36b0 :  // <0010> "
// normally puff length is not touched by an init func.
// this one does it because it's part of the program boot,
// and also a good idea whenever stopping the engine.
// this might interrupt a puff in mid-pulse, but no matter in this case.
addr == 16'h330 ? 16'h5e00 :  // <0015> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h331 ? 16'h6290 :  // <0015> ram $ram_next_puff_len_us = 0 // av_ad_lo = 144
addr == 16'h332 ? 16'h5600 :  // <0015> ram $ram_next_puff_len_us = 0 // av_write_data = 0
addr == 16'h333 ? 16'h8600 :  // <0016> puff_len_us = 0

// memorize state.
addr == 16'h334 ? 16'h5e00 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_ad_hi = 0
addr == 16'h335 ? 16'h6288 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_ad_lo = 136
addr == 16'h336 ? 16'h57a0 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_write_data = :plan_name_stop
addr == 16'h337 ? 16'h0320 :  // <0019> "
addr == 16'h338 ? 16'h5e00 :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_ad_hi = 0
addr == 16'h339 ? 16'h628a :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_ad_lo = 138
addr == 16'h33a ? 16'h57a0 :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_write_data = :puff_len_stop
addr == 16'h33b ? 16'h0347 :  // <0020> "
addr == 16'h33c ? 16'h5e00 :  // <0021> ram $ram_transition_func = :leave_stop // av_ad_hi = 0
addr == 16'h33d ? 16'h628c :  // <0021> ram $ram_transition_func = :leave_stop // av_ad_lo = 140
addr == 16'h33e ? 16'h57a0 :  // <0021> ram $ram_transition_func = :leave_stop // av_write_data = :leave_stop
addr == 16'h33f ? 16'h034b :  // <0021> "
addr == 16'h340 ? 16'h5e00 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_hi = 0
addr == 16'h341 ? 16'h628e :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_lo = 142
addr == 16'h342 ? 16'h57a0 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_write_data = :destroy_plan_stop
addr == 16'h343 ? 16'h0346 :  // <0022> "

addr == 16'h344 ? 16'hf80c :  // <0024> pop rtna // func init_plan_stop
addr == 16'h345 ? 16'hfc00 :  // <0024> swapra = nop

// ######## func destroy_plan_stop // = 0x0346


addr == 16'h346 ? 16'hfc00 :  // <0027> swapra = nop

// ######## func puff_len_stop // = 0x0347

addr == 16'h347 ? 16'h5e00 :  // <0029> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h348 ? 16'h6290 :  // <0029> ram $ram_next_puff_len_us = 0 // av_ad_lo = 144
addr == 16'h349 ? 16'h5600 :  // <0029> ram $ram_next_puff_len_us = 0 // av_write_data = 0

addr == 16'h34a ? 16'hfc00 :  // <0031> swapra = nop

// ######## func leave_stop // = 0x034b
addr == 16'h34b ? 16'h303e :  // <0044> push rtna // func leave_stop

// leave stop plan if ignition switch is turned on AND more than half if the ignition history is valid.
// requiring both conditions prevents spurious noise readings from starting up the injection.
addr == 16'h34c ? 16'h001e :  // <0035> a = power_duty
addr == 16'h34d ? 16'h0680 :  // <0036> b = $ign_switch_off_mask
addr == 16'h34e ? 16'he403 :  // <0037> bn and0z :stay
addr == 16'h34f ? 16'h035d :  // <0037> "
addr == 16'h350 ? 16'h5e00 :  // <0038> ram a = $ram_ign_bad_samples // av_ad_hi = 0
addr == 16'h351 ? 16'h6280 :  // <0038> ram a = $ram_ign_bad_samples // av_ad_lo = 128
addr == 16'h352 ? 16'h0015 :  // <0038> ram a = $ram_ign_bad_samples // a = av_write_data // start read cycle
addr == 16'h353 ? 16'h0016 :  // <0038> ram a = $ram_ign_bad_samples // a = av_read_data // finish read cycle
addr == 16'h354 ? 16'h0608 :  // <0039> b = ($ign_history_len / 2)
addr == 16'h355 ? 16'he006 :  // <0040> br gt :stay
addr == 16'h356 ? 16'h035d :  // <0040> "
addr == 16'h357 ? 16'hfba0 :  // <0041> callx  destroy_plan_stop
addr == 16'h358 ? 16'h0346 :  // <0041> "
addr == 16'h359 ? 16'hfc00 :  // <0041> "
addr == 16'h35a ? 16'hfba0 :  // <0042> callx  init_plan_crank
addr == 16'h35b ? 16'h0361 :  // <0042> "
addr == 16'h35c ? 16'hfc00 :  // <0042> "
// :stay // = 0x035d

addr == 16'h35d ? 16'hf80c :  // <0045> pop rtna // func leave_stop
addr == 16'h35e ? 16'hfc00 :  // <0045> swapra = nop



// escalating puff length by 1500 us per puff while cranking slowly at e.g. 80 RPM
// on a frozen winter morning will ramp up from 10000 to 20000 us length in about 5 seconds.

// :plan_name_crank // = 0x035f
// "CR\x0"
addr == 16'h35f ? 16'h5243 :  // <0011> RC
addr == 16'h360 ? 16'h0000 :  // <0011>   

// ######## func init_plan_crank // = 0x0361
addr == 16'h361 ? 16'h303e :  // <0033> push rtna // func init_plan_crank

// set up the crank plan.
addr == 16'h362 ? 16'h5e00 :  // <0015> ram $ram_puff_count = 0 // av_ad_hi = 0
addr == 16'h363 ? 16'h6292 :  // <0015> ram $ram_puff_count = 0 // av_ad_lo = 146
addr == 16'h364 ? 16'h5600 :  // <0015> ram $ram_puff_count = 0 // av_write_data = 0
// set noise filter to measure RPM between 50 and 8000 to indicate running.
addr == 16'h365 ? 16'h5e00 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_ad_hi = 0
addr == 16'h366 ? 16'h6282 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_ad_lo = 130
addr == 16'h367 ? 16'h5657 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_write_data = 87
addr == 16'h368 ? 16'h5e00 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h369 ? 16'h6284 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 132
addr == 16'h36a ? 16'h57a0 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h36b ? 16'h36b0 :  // <0018> "
addr == 16'h36c ? 16'h83a0 :  // <0019> ign_timeout_len_jf = ([rpm_to_jf 50])
addr == 16'h36d ? 16'h36b0 :  // <0019> "
// normally puff length is not touched by an init func.
// this one does it because it's the beginning of a crank cycle, and puff length
// should be enabled for the first puff.  otherwise the first puff would be missed.
addr == 16'h36e ? 16'h5e00 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_hi = 0
addr == 16'h36f ? 16'h6290 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_lo = 144
addr == 16'h370 ? 16'h57a0 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_write_data = 10000
addr == 16'h371 ? 16'h2710 :  // <0023> "
addr == 16'h372 ? 16'h87a0 :  // <0024> puff_len_us = $crank_min_puff_len_us
addr == 16'h373 ? 16'h2710 :  // <0024> "
// clear ignition history again to eliminate samples where the motor kept spinning after switching from plan_run to plan_stop.
addr == 16'h374 ? 16'hfba0 :  // <0026> callx  clear_ign_history
addr == 16'h375 ? 16'h085c :  // <0026> "
addr == 16'h376 ? 16'hfc00 :  // <0026> "

// memorize state.
addr == 16'h377 ? 16'h5e00 :  // <0029> ram $ram_plan_name = :plan_name_crank // av_ad_hi = 0
addr == 16'h378 ? 16'h6288 :  // <0029> ram $ram_plan_name = :plan_name_crank // av_ad_lo = 136
addr == 16'h379 ? 16'h57a0 :  // <0029> ram $ram_plan_name = :plan_name_crank // av_write_data = :plan_name_crank
addr == 16'h37a ? 16'h035f :  // <0029> "
addr == 16'h37b ? 16'h5e00 :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_ad_hi = 0
addr == 16'h37c ? 16'h628a :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_ad_lo = 138
addr == 16'h37d ? 16'h57a0 :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_write_data = :puff_len_crank
addr == 16'h37e ? 16'h038a :  // <0030> "
addr == 16'h37f ? 16'h5e00 :  // <0031> ram $ram_transition_func = :leave_crank // av_ad_hi = 0
addr == 16'h380 ? 16'h628c :  // <0031> ram $ram_transition_func = :leave_crank // av_ad_lo = 140
addr == 16'h381 ? 16'h57a0 :  // <0031> ram $ram_transition_func = :leave_crank // av_write_data = :leave_crank
addr == 16'h382 ? 16'h03a8 :  // <0031> "
addr == 16'h383 ? 16'h5e00 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_hi = 0
addr == 16'h384 ? 16'h628e :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_lo = 142
addr == 16'h385 ? 16'h57a0 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_write_data = :destroy_plan_crank
addr == 16'h386 ? 16'h0389 :  // <0032> "

addr == 16'h387 ? 16'hf80c :  // <0034> pop rtna // func init_plan_crank
addr == 16'h388 ? 16'hfc00 :  // <0034> swapra = nop

// ######## func destroy_plan_crank // = 0x0389


addr == 16'h389 ? 16'hfc00 :  // <0037> swapra = nop

// ######## func puff_len_crank // = 0x038a
addr == 16'h38a ? 16'h303e :  // <0054> push rtna // func puff_len_crank

addr == 16'h38b ? 16'h5e00 :  // <0039> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h38c ? 16'h6292 :  // <0039> ram a = $ram_puff_count // av_ad_lo = 146
addr == 16'h38d ? 16'h0015 :  // <0039> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h38e ? 16'h0016 :  // <0039> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h38f ? 16'h0606 :  // <0040> b = $crank_max_puffs
addr == 16'h390 ? 16'he006 :  // <0041> br gt :puff_limit
addr == 16'h391 ? 16'h039f :  // <0041> "
// linear escalation from min to max puff length, at a slope of crank_incr_us_per_puff.
addr == 16'h392 ? 16'h07a0 :  // <0043> b = $crank_incr_us_per_puff
addr == 16'h393 ? 16'h05dc :  // <0043> "
addr == 16'h394 ? 16'hfba0 :  // <0044> call :multiply
addr == 16'h395 ? 16'h0170 :  // <0044> "
addr == 16'h396 ? 16'hfc00 :  // <0044> "
addr == 16'h397 ? 16'h07a0 :  // <0045> b = $crank_min_puff_len_us
addr == 16'h398 ? 16'h2710 :  // <0045> "
addr == 16'h399 ? 16'h5e00 :  // <0046> ram $ram_next_puff_len_us = a+b // av_ad_hi = 0
addr == 16'h39a ? 16'h6290 :  // <0046> ram $ram_next_puff_len_us = a+b // av_ad_lo = 144
addr == 16'h39b ? 16'hc800 :  // <0046> ram $ram_next_puff_len_us = a+b // av_write_data = a+b
addr == 16'h39c ? 16'h5700 :  // <0046> "
addr == 16'h39d ? 16'he00f :  // <0047> jmp :done
addr == 16'h39e ? 16'h03a6 :  // <0047> "
// :puff_limit // = 0x039f
// prevent the puff counter from going higher & eventually rolling over.
addr == 16'h39f ? 16'h5e00 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_ad_hi = 0
addr == 16'h3a0 ? 16'h6292 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_ad_lo = 146
addr == 16'h3a1 ? 16'h5606 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_write_data = 6
// accept max puff len.
addr == 16'h3a2 ? 16'h5e00 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_hi = 0
addr == 16'h3a3 ? 16'h6290 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_lo = 144
addr == 16'h3a4 ? 16'h57a0 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_write_data = 20000
addr == 16'h3a5 ? 16'h4e20 :  // <0052> "
// :done // = 0x03a6

addr == 16'h3a6 ? 16'hf80c :  // <0055> pop rtna // func puff_len_crank
addr == 16'h3a7 ? 16'hfc00 :  // <0055> swapra = nop

// ######## func leave_crank // = 0x03a8
addr == 16'h3a8 ? 16'h303e :  // <0071> push rtna // func leave_crank

addr == 16'h3a9 ? 16'hfba0 :  // <0057> callx  check_engine_stop  a
addr == 16'h3aa ? 16'h0c5a :  // <0057> "
addr == 16'h3ab ? 16'hfc00 :  // <0057> "
addr == 16'h3ac ? 16'h0008 :  // <0057> a = pa
addr == 16'h3ad ? 16'he400 :  // <0058> bn az :done
addr == 16'h3ae ? 16'h03c3 :  // <0058> "

// transition to warmup if RPM exceeds crank_success_rpm.
addr == 16'h3af ? 16'h5e00 :  // <0061> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h3b0 ? 16'h627e :  // <0061> ram a = $ram_rpm_valid // av_ad_lo = 126
addr == 16'h3b1 ? 16'h0015 :  // <0061> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h3b2 ? 16'h0016 :  // <0061> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle
addr == 16'h3b3 ? 16'he000 :  // <0062> br az :stay
addr == 16'h3b4 ? 16'h03c3 :  // <0062> "
addr == 16'h3b5 ? 16'h5e00 :  // <0063> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h3b6 ? 16'h627c :  // <0063> ram a = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h3b7 ? 16'h0015 :  // <0063> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h3b8 ? 16'h0016 :  // <0063> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle
addr == 16'h3b9 ? 16'h07a0 :  // <0064> b = $crank_success_rpm
addr == 16'h3ba ? 16'h0320 :  // <0064> "
addr == 16'h3bb ? 16'he005 :  // <0065> br lt :stay
addr == 16'h3bc ? 16'h03c3 :  // <0065> "
addr == 16'h3bd ? 16'hfba0 :  // <0066> callx  destroy_plan_crank
addr == 16'h3be ? 16'h0389 :  // <0066> "
addr == 16'h3bf ? 16'hfc00 :  // <0066> "
addr == 16'h3c0 ? 16'hfba0 :  // <0067> callx  init_plan_warmup
addr == 16'h3c1 ? 16'h03c7 :  // <0067> "
addr == 16'h3c2 ? 16'hfc00 :  // <0067> "
// :stay // = 0x03c3

// :done // = 0x03c3

addr == 16'h3c3 ? 16'hf80c :  // <0072> pop rtna // func leave_crank
addr == 16'h3c4 ? 16'hfc00 :  // <0072> swapra = nop



// 0x4c0 = 1216 = 120 degF at the sensor location outside the engine block.
// 750 = 0 degF.
// max 6000 & min 4500 over a temp range 750 to 0x4c0 gives 6900 us puff at 74 deg F.  program rev 594.
// this is used if the engine temp is unavailable.

// :plan_name_warmup // = 0x03c5
// "WM\x0"
addr == 16'h3c5 ? 16'h4d57 :  // <0016> MW
addr == 16'h3c6 ? 16'h0000 :  // <0016>   

// ######## func init_plan_warmup // = 0x03c7

// set up the warmup plan.
addr == 16'h3c7 ? 16'h5e00 :  // <0020> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h3c8 ? 16'h6214 :  // <0020> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h3c9 ? 16'h0015 :  // <0020> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h3ca ? 16'h0016 :  // <0020> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h3cb ? 16'h063c :  // <0021> b = $warmup_timeout_sec
addr == 16'h3cc ? 16'h5e00 :  // <0022> ram $ram_warmup_timeout_at_pass = a+b // av_ad_hi = 0
addr == 16'h3cd ? 16'h6296 :  // <0022> ram $ram_warmup_timeout_at_pass = a+b // av_ad_lo = 150
addr == 16'h3ce ? 16'hc800 :  // <0022> ram $ram_warmup_timeout_at_pass = a+b // av_write_data = a+b
addr == 16'h3cf ? 16'h5700 :  // <0022> "

// memorize state.
addr == 16'h3d0 ? 16'h5e00 :  // <0025> ram $ram_plan_name = :plan_name_warmup // av_ad_hi = 0
addr == 16'h3d1 ? 16'h6288 :  // <0025> ram $ram_plan_name = :plan_name_warmup // av_ad_lo = 136
addr == 16'h3d2 ? 16'h57a0 :  // <0025> ram $ram_plan_name = :plan_name_warmup // av_write_data = :plan_name_warmup
addr == 16'h3d3 ? 16'h03c5 :  // <0025> "
addr == 16'h3d4 ? 16'h5e00 :  // <0026> ram $ram_puff_len_func = :puff_len_warmup // av_ad_hi = 0
addr == 16'h3d5 ? 16'h628a :  // <0026> ram $ram_puff_len_func = :puff_len_warmup // av_ad_lo = 138
addr == 16'h3d6 ? 16'h57a0 :  // <0026> ram $ram_puff_len_func = :puff_len_warmup // av_write_data = :puff_len_warmup
addr == 16'h3d7 ? 16'h03e2 :  // <0026> "
addr == 16'h3d8 ? 16'h5e00 :  // <0027> ram $ram_transition_func = :leave_warmup // av_ad_hi = 0
addr == 16'h3d9 ? 16'h628c :  // <0027> ram $ram_transition_func = :leave_warmup // av_ad_lo = 140
addr == 16'h3da ? 16'h57a0 :  // <0027> ram $ram_transition_func = :leave_warmup // av_write_data = :leave_warmup
addr == 16'h3db ? 16'h0414 :  // <0027> "
addr == 16'h3dc ? 16'h5e00 :  // <0028> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_ad_hi = 0
addr == 16'h3dd ? 16'h628e :  // <0028> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_ad_lo = 142
addr == 16'h3de ? 16'h57a0 :  // <0028> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_write_data = :destroy_plan_warmup
addr == 16'h3df ? 16'h03e1 :  // <0028> "

addr == 16'h3e0 ? 16'hfc00 :  // <0030> swapra = nop

// ######## func destroy_plan_warmup // = 0x03e1


addr == 16'h3e1 ? 16'hfc00 :  // <0033> swapra = nop

// ######## func puff_len_warmup // = 0x03e2
addr == 16'h3e2 ? 16'h3004 :  // <0070> push x // func puff_len_warmup
addr == 16'h3e3 ? 16'h303e :  // <0070> push rtna // "

// x = enrichment us.
addr == 16'h3e4 ? 16'h13a0 :  // <0036> x = $warmup_limping_enrichment_us
addr == 16'h3e5 ? 16'h07d0 :  // <0036> "

// check engine block temp sensor.  if valid, enrich by a linear function:
// {warmup_min_temp_adc...warmup_success_temp_adc} -> {$warmup_max_enrichment_us...0}
addr == 16'h3e6 ? 16'h0202 :  // <0040> a = $anmux_engine_block_temp

addr == 16'h3e7 ? 16'h0351 :  // <0041> a = a<<1
addr == 16'h3e8 ? 16'h0616 :  // <0041> b = 22
addr == 16'h3e9 ? 16'h5e00 :  // <0041> av_ad_hi = 0
addr == 16'h3ea ? 16'h6300 :  // <0041> av_ad_lo = ad0
addr == 16'h3eb ? 16'h0415 :  // <0041> b = av_write_data
addr == 16'h3ec ? 16'h0416 :  // <0041> b = av_read_data

// b = sensor reading in adc counts.
addr == 16'h3ed ? 16'h03a0 :  // <0043> a = $temp_ceiling_adc
addr == 16'h3ee ? 16'h0ff0 :  // <0043> "
addr == 16'h3ef ? 16'he005 :  // <0044> br lt :temp_invalid
addr == 16'h3f0 ? 16'h040a :  // <0044> "
addr == 16'h3f1 ? 16'h03a0 :  // <0045> a = $warmup_success_temp_adc
addr == 16'h3f2 ? 16'h04c0 :  // <0045> "
addr == 16'h3f3 ? 16'he005 :  // <0046> br lt :too_warm
addr == 16'h3f4 ? 16'h040a :  // <0046> "
addr == 16'h3f5 ? 16'h03a0 :  // <0047> a = $warmup_min_temp_adc
addr == 16'h3f6 ? 16'h02ee :  // <0047> "
addr == 16'h3f7 ? 16'he005 :  // <0048> br lt :in_range
addr == 16'h3f8 ? 16'h03fb :  // <0048> "
addr == 16'h3f9 ? 16'h07a0 :  // <0049> b = $warmup_min_temp_adc
addr == 16'h3fa ? 16'h02ee :  // <0049> "
// :in_range // = 0x03fb
// negate the sensor reading so as to subtract it from warmup_success_temp_adc.
addr == 16'h3fb ? 16'h0360 :  // <0052> a = 0xffff
addr == 16'h3fc ? 16'hc800 :  // <0053> b = xor
addr == 16'h3fd ? 16'h0738 :  // <0053> "
addr == 16'h3fe ? 16'h0201 :  // <0054> a = 1
addr == 16'h3ff ? 16'hc800 :  // <0055> b = a+b
addr == 16'h400 ? 16'h0700 :  // <0055> "
addr == 16'h401 ? 16'h03a0 :  // <0056> a = $warmup_success_temp_adc
addr == 16'h402 ? 16'h04c0 :  // <0056> "
addr == 16'h403 ? 16'hc800 :  // <0057> b = a+b
addr == 16'h404 ? 16'h0700 :  // <0057> "
// b = how many counts "cold" we are.  multiply that by the slope warmup_us_per_cold_adc.
addr == 16'h405 ? 16'h020c :  // <0059> a = $warmup_us_per_cold_adc
addr == 16'h406 ? 16'hfba0 :  // <0060> call :multiply
addr == 16'h407 ? 16'h0170 :  // <0060> "
addr == 16'h408 ? 16'hfc00 :  // <0060> "
addr == 16'h409 ? 16'h1000 :  // <0061> x = a
// :too_warm // = 0x040a
// :temp_invalid // = 0x040a

// apply total of base amount and enrichment.
// $warmup_min_puff_len_us <= total <= ($warmup_min_puff_len_us + $warmup_max_enrichment_us)
addr == 16'h40a ? 16'h03a0 :  // <0067> a = $warmup_min_puff_len_us
addr == 16'h40b ? 16'h09c4 :  // <0067> "
addr == 16'h40c ? 16'h0404 :  // <0068> b = x
addr == 16'h40d ? 16'h5e00 :  // <0069> ram $ram_next_puff_len_us = a+b // av_ad_hi = 0
addr == 16'h40e ? 16'h6290 :  // <0069> ram $ram_next_puff_len_us = a+b // av_ad_lo = 144
addr == 16'h40f ? 16'hc800 :  // <0069> ram $ram_next_puff_len_us = a+b // av_write_data = a+b
addr == 16'h410 ? 16'h5700 :  // <0069> "

addr == 16'h411 ? 16'hf80c :  // <0071> pop rtna // func puff_len_warmup
addr == 16'h412 ? 16'h100c :  // <0071> pop x // "
addr == 16'h413 ? 16'hfc00 :  // <0071> swapra = nop

// ######## func leave_warmup // = 0x0414
addr == 16'h414 ? 16'h303e :  // <0099> push rtna // func leave_warmup

addr == 16'h415 ? 16'hfba0 :  // <0073> callx  check_engine_stop  a
addr == 16'h416 ? 16'h0c5a :  // <0073> "
addr == 16'h417 ? 16'hfc00 :  // <0073> "
addr == 16'h418 ? 16'h0008 :  // <0073> a = pa
addr == 16'h419 ? 16'he400 :  // <0074> bn az :done
addr == 16'h41a ? 16'h0448 :  // <0074> "

// transition to plan_run if warmup has expired.
addr == 16'h41b ? 16'h5e00 :  // <0077> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h41c ? 16'h6214 :  // <0077> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h41d ? 16'h0015 :  // <0077> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h41e ? 16'h0016 :  // <0077> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h41f ? 16'h5e00 :  // <0078> ram b = $ram_warmup_timeout_at_pass // av_ad_hi = 0
addr == 16'h420 ? 16'h6296 :  // <0078> ram b = $ram_warmup_timeout_at_pass // av_ad_lo = 150
addr == 16'h421 ? 16'h0415 :  // <0078> ram b = $ram_warmup_timeout_at_pass // b = av_write_data // start read cycle
addr == 16'h422 ? 16'h0416 :  // <0078> ram b = $ram_warmup_timeout_at_pass // b = av_read_data // finish read cycle

addr == 16'h423 ? 16'h0000 :  // <0083> a = a
addr == 16'h424 ? 16'h0401 :  // <0083> b = b

addr == 16'h425 ? 16'he406 :  // <0079> bn gt :else_1061
addr == 16'h426 ? 16'h042f :  // <0079> "

addr == 16'h427 ? 16'hfba0 :  // <0080> callx  destroy_plan_warmup
addr == 16'h428 ? 16'h03e1 :  // <0080> "
addr == 16'h429 ? 16'hfc00 :  // <0080> "
addr == 16'h42a ? 16'hfba0 :  // <0081> callx  init_plan_run
addr == 16'h42b ? 16'h06fd :  // <0081> "
addr == 16'h42c ? 16'hfc00 :  // <0081> "
addr == 16'h42d ? 16'he00f :  // <0082> jmp :done
addr == 16'h42e ? 16'h0448 :  // <0082> "


// transition to plan_run if engine block temp sensor is valid, and temp
// exceeds warmup_success_temp_adc.
addr == 16'h42f ? 16'h0202 :  // <0087> a = $anmux_engine_block_temp

addr == 16'h430 ? 16'h0351 :  // <0088> a = a<<1
addr == 16'h431 ? 16'h0616 :  // <0088> b = 22
addr == 16'h432 ? 16'h5e00 :  // <0088> av_ad_hi = 0
addr == 16'h433 ? 16'h6300 :  // <0088> av_ad_lo = ad0
addr == 16'h434 ? 16'h0415 :  // <0088> b = av_write_data
addr == 16'h435 ? 16'h0416 :  // <0088> b = av_read_data

addr == 16'h436 ? 16'h03a0 :  // <0089> a = $temp_ceiling_adc
addr == 16'h437 ? 16'h0ff0 :  // <0089> "

addr == 16'h438 ? 16'h0000 :  // <0096> a = a
addr == 16'h439 ? 16'h0401 :  // <0096> b = b

addr == 16'h43a ? 16'he406 :  // <0090> bn gt :else_1082
addr == 16'h43b ? 16'h0448 :  // <0090> "

addr == 16'h43c ? 16'h03a0 :  // <0091> a = $warmup_success_temp_adc
addr == 16'h43d ? 16'h04c0 :  // <0091> "

addr == 16'h43e ? 16'h0000 :  // <0095> a = a
addr == 16'h43f ? 16'h0401 :  // <0095> b = b

addr == 16'h440 ? 16'he405 :  // <0092> bn lt :else_1088
addr == 16'h441 ? 16'h0448 :  // <0092> "

addr == 16'h442 ? 16'hfba0 :  // <0093> callx  destroy_plan_warmup
addr == 16'h443 ? 16'h03e1 :  // <0093> "
addr == 16'h444 ? 16'hfc00 :  // <0093> "
addr == 16'h445 ? 16'hfba0 :  // <0094> callx  init_plan_run
addr == 16'h446 ? 16'h06fd :  // <0094> "
addr == 16'h447 ? 16'hfc00 :  // <0094> "



// :done // = 0x0448

addr == 16'h448 ? 16'hf80c :  // <0100> pop rtna // func leave_warmup
addr == 16'h449 ? 16'hfc00 :  // <0100> swapra = nop



// :rpm_cells // = 0x044a
addr == 16'h44a ? 16'h01f4 :  // <0004> 500
addr == 16'h44b ? 16'h0271 :  // <0005> 625
addr == 16'h44c ? 16'h030d :  // <0006> 781
addr == 16'h44d ? 16'h03d1 :  // <0007> 977
addr == 16'h44e ? 16'h04c5 :  // <0008> 1221
addr == 16'h44f ? 16'h05f6 :  // <0009> 1526
addr == 16'h450 ? 16'h0773 :  // <0010> 1907
addr == 16'h451 ? 16'h0950 :  // <0011> 2384
addr == 16'h452 ? 16'h0ba4 :  // <0012> 2980
addr == 16'h453 ? 16'h0e8d :  // <0013> 3725
addr == 16'h454 ? 16'h1231 :  // <0014> 4657
addr == 16'h455 ? 16'h16bd :  // <0015> 5821
addr == 16'h456 ? 16'h1c6c :  // <0016> 7276
addr == 16'h457 ? 16'hffff :  // <0017> 0xffff




// trim puff length by o2 sensor every 200 ms.

// trim puff length as needed.

// o2 sensor interpetation & state machine.

// default maps
// :default_tps_reference // = 0x0458
addr == 16'h458 ? 16'h05f0 :  // <0060> 0x05f0
addr == 16'h459 ? 16'h0680 :  // <0061> 0x0680
addr == 16'h45a ? 16'h0680 :  // <0062> 0x0680
addr == 16'h45b ? 16'h0680 :  // <0063> 0x0680
addr == 16'h45c ? 16'h0680 :  // <0064> 0x0680
addr == 16'h45d ? 16'h0680 :  // <0065> 0x0680
addr == 16'h45e ? 16'h0700 :  // <0066> 0x0700
addr == 16'h45f ? 16'h0780 :  // <0067> 0x0780
addr == 16'h460 ? 16'h0800 :  // <0068> 0x0800
addr == 16'h461 ? 16'h0880 :  // <0069> 0x0880
addr == 16'h462 ? 16'h0900 :  // <0070> 0x0900
addr == 16'h463 ? 16'h0980 :  // <0071> 0x0980
addr == 16'h464 ? 16'h0c80 :  // <0072> 0x0c80
// :default_tps_enrich_thou // = 0x0465
addr == 16'h465 ? 16'h0000 :  // <0074> 0x0000
addr == 16'h466 ? 16'h0000 :  // <0075> 0x0000
addr == 16'h467 ? 16'h0100 :  // <0076> 0x0100
addr == 16'h468 ? 16'h0200 :  // <0077> 0x0200
addr == 16'h469 ? 16'h1388 :  // <0078> 0x1388


// :plan_name_learn_stoich // = 0x046a
// "LN\x0"
addr == 16'h46a ? 16'h4e4c :  // <0082> NL
addr == 16'h46b ? 16'h0000 :  // <0082>   

// ######## func init_plan_learn_stoich // = 0x046c

// set up the learn_stoich plan.
addr == 16'h46c ? 16'h5e00 :  // <0086> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_ad_hi = 0
addr == 16'h46d ? 16'h62e4 :  // <0086> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_ad_lo = 228
addr == 16'h46e ? 16'h560a :  // <0086> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_write_data = 10

// memorize state.
addr == 16'h46f ? 16'h5e00 :  // <0089> ram $ram_plan_name = :plan_name_learn_stoich // av_ad_hi = 0
addr == 16'h470 ? 16'h6288 :  // <0089> ram $ram_plan_name = :plan_name_learn_stoich // av_ad_lo = 136
addr == 16'h471 ? 16'h57a0 :  // <0089> ram $ram_plan_name = :plan_name_learn_stoich // av_write_data = :plan_name_learn_stoich
addr == 16'h472 ? 16'h046a :  // <0089> "
addr == 16'h473 ? 16'h5e00 :  // <0090> ram $ram_puff_len_func = :puff_len_learn_stoich // av_ad_hi = 0
addr == 16'h474 ? 16'h628a :  // <0090> ram $ram_puff_len_func = :puff_len_learn_stoich // av_ad_lo = 138
addr == 16'h475 ? 16'h57a0 :  // <0090> ram $ram_puff_len_func = :puff_len_learn_stoich // av_write_data = :puff_len_learn_stoich
addr == 16'h476 ? 16'h0485 :  // <0090> "
addr == 16'h477 ? 16'h5e00 :  // <0091> ram $ram_transition_func = :leave_learn_stoich // av_ad_hi = 0
addr == 16'h478 ? 16'h628c :  // <0091> ram $ram_transition_func = :leave_learn_stoich // av_ad_lo = 140
addr == 16'h479 ? 16'h57a0 :  // <0091> ram $ram_transition_func = :leave_learn_stoich // av_write_data = :leave_learn_stoich
addr == 16'h47a ? 16'h057f :  // <0091> "
addr == 16'h47b ? 16'h5e00 :  // <0092> ram $ram_destroy_plan_func = :destroy_plan_learn_stoich // av_ad_hi = 0
addr == 16'h47c ? 16'h628e :  // <0092> ram $ram_destroy_plan_func = :destroy_plan_learn_stoich // av_ad_lo = 142
addr == 16'h47d ? 16'h57a0 :  // <0092> ram $ram_destroy_plan_func = :destroy_plan_learn_stoich // av_write_data = :destroy_plan_learn_stoich
addr == 16'h47e ? 16'h0480 :  // <0092> "

addr == 16'h47f ? 16'hfc00 :  // <0094> swapra = nop

// ######## func destroy_plan_learn_stoich // = 0x0480


addr == 16'h480 ? 16'hfc00 :  // <0097> swapra = nop

// :lrns_trim_up_msg // = 0x0481
// "trR\x0"
addr == 16'h481 ? 16'h7274 :  // <0099> rt
addr == 16'h482 ? 16'h0052 :  // <0099>  R
// :lrns_trim_down_msg // = 0x0483
// "trL\x0"
addr == 16'h483 ? 16'h7274 :  // <0101> rt
addr == 16'h484 ? 16'h004c :  // <0101>  L

// ######## func puff_len_learn_stoich // = 0x0485
addr == 16'h485 ? 16'h3002 :  // <0136> push i // func puff_len_learn_stoich
addr == 16'h486 ? 16'h3003 :  // <0136> push j // "
addr == 16'h487 ? 16'h3006 :  // <0136> push g6 // "
addr == 16'h488 ? 16'h3007 :  // <0136> push g7 // "
addr == 16'h489 ? 16'h303e :  // <0136> push rtna // "

addr == 16'h48a ? 16'h5e00 :  // <0104> ram i = $ram_lrns_ticks_remain // av_ad_hi = 0
addr == 16'h48b ? 16'h62e4 :  // <0104> ram i = $ram_lrns_ticks_remain // av_ad_lo = 228
addr == 16'h48c ? 16'h0815 :  // <0104> ram i = $ram_lrns_ticks_remain // i = av_write_data // start read cycle
addr == 16'h48d ? 16'h0816 :  // <0104> ram i = $ram_lrns_ticks_remain // i = av_read_data // finish read cycle

addr == 16'h48e ? 16'h0002 :  // <0135> a = i
addr == 16'h48f ? 16'h0600 :  // <0135> b = 0

addr == 16'h490 ? 16'he406 :  // <0105> bn gt :else_1168
addr == 16'h491 ? 16'h0499 :  // <0105> "

addr == 16'h492 ? 16'h0f60 :  // <0106> j = -1
addr == 16'h493 ? 16'h5e00 :  // <0107> ram $ram_lrns_ticks_remain = i+j // av_ad_hi = 0
addr == 16'h494 ? 16'h62e4 :  // <0107> ram $ram_lrns_ticks_remain = i+j // av_ad_lo = 228
addr == 16'h495 ? 16'hc800 :  // <0107> ram $ram_lrns_ticks_remain = i+j // av_write_data = i+j
addr == 16'h496 ? 16'h5710 :  // <0107> "

addr == 16'h497 ? 16'he00f :  // <0109> jmp :end_1168
addr == 16'h498 ? 16'h04d5 :  // <0109> "

addr == 16'h499 ? 16'h5e00 :  // <0110> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_ad_hi = 0
addr == 16'h49a ? 16'h62e4 :  // <0110> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_ad_lo = 228
addr == 16'h49b ? 16'h560a :  // <0110> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_write_data = 10

// i = old puff length, j = puff length increment.
addr == 16'h49c ? 16'h5e00 :  // <0113> ram i = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'h49d ? 16'h6290 :  // <0113> ram i = $ram_next_puff_len_us // av_ad_lo = 144
addr == 16'h49e ? 16'h0815 :  // <0113> ram i = $ram_next_puff_len_us // i = av_write_data // start read cycle
addr == 16'h49f ? 16'h0816 :  // <0113> ram i = $ram_next_puff_len_us // i = av_read_data // finish read cycle
addr == 16'h4a0 ? 16'h0e00 :  // <0114> j = 0
addr == 16'h4a1 ? 16'h5e00 :  // <0115> ram g6 = $ram_o2_state // av_ad_hi = 0
addr == 16'h4a2 ? 16'h62e6 :  // <0115> ram g6 = $ram_o2_state // av_ad_lo = 230
addr == 16'h4a3 ? 16'h1815 :  // <0115> ram g6 = $ram_o2_state // g6 = av_write_data // start read cycle
addr == 16'h4a4 ? 16'h1816 :  // <0115> ram g6 = $ram_o2_state // g6 = av_read_data // finish read cycle
addr == 16'h4a5 ? 16'hfba0 :  // <0116> callx  interpret_o2
addr == 16'h4a6 ? 16'h0542 :  // <0116> "
addr == 16'h4a7 ? 16'hfc00 :  // <0116> "
addr == 16'h4a8 ? 16'h5e00 :  // <0117> ram g7 = $ram_o2_state // av_ad_hi = 0
addr == 16'h4a9 ? 16'h62e6 :  // <0117> ram g7 = $ram_o2_state // av_ad_lo = 230
addr == 16'h4aa ? 16'h1c15 :  // <0117> ram g7 = $ram_o2_state // g7 = av_write_data // start read cycle
addr == 16'h4ab ? 16'h1c16 :  // <0117> ram g7 = $ram_o2_state // g7 = av_read_data // finish read cycle

addr == 16'h4ac ? 16'h0007 :  // <0134> a = g7
addr == 16'h4ad ? 16'h0601 :  // <0134> b = 1

addr == 16'h4ae ? 16'he407 :  // <0118> bn eq :else_1198
addr == 16'h4af ? 16'h04c5 :  // <0118> "

// sensing a lean condition.  trim up to enrich.

addr == 16'h4b0 ? 16'h0002 :  // <0122> a = i
addr == 16'h4b1 ? 16'h07a0 :  // <0122> b = 10000
addr == 16'h4b2 ? 16'h2710 :  // <0122> "

addr == 16'h4b3 ? 16'he405 :  // <0120> bn lt :else_1203
addr == 16'h4b4 ? 16'h04b7 :  // <0120> "

addr == 16'h4b5 ? 16'h0fa0 :  // <0121> j = $lrns_puff_step_up_us
addr == 16'h4b6 ? 16'h0258 :  // <0121> "

addr == 16'h4b7 ? 16'h23a0 :  // <0123> pa = :lrns_trim_up_msg
addr == 16'h4b8 ? 16'h0481 :  // <0123> "
addr == 16'h4b9 ? 16'hfba0 :  // <0123> callx  set_text_flag  :lrns_trim_up_msg
addr == 16'h4ba ? 16'h0b26 :  // <0123> "
addr == 16'h4bb ? 16'hfc00 :  // <0123> "

addr == 16'h4bc ? 16'h0006 :  // <0127> a = g6
addr == 16'h4bd ? 16'h0602 :  // <0127> b = 2

addr == 16'h4be ? 16'he407 :  // <0124> bn eq :else_1214
addr == 16'h4bf ? 16'h04c3 :  // <0124> "

// o2 state just switched to lean.  adjust map.
addr == 16'h4c0 ? 16'hfba0 :  // <0126> callx  learn_smap
addr == 16'h4c1 ? 16'h04e1 :  // <0126> "
addr == 16'h4c2 ? 16'hfc00 :  // <0126> "


addr == 16'h4c3 ? 16'he00f :  // <0129> jmp :end_1198
addr == 16'h4c4 ? 16'h04d1 :  // <0129> "

// sensing a rich condition.  trim down to lean it out.

addr == 16'h4c5 ? 16'h0002 :  // <0133> a = i
addr == 16'h4c6 ? 16'h07a0 :  // <0133> b = 2000
addr == 16'h4c7 ? 16'h07d0 :  // <0133> "

addr == 16'h4c8 ? 16'he406 :  // <0131> bn gt :else_1224
addr == 16'h4c9 ? 16'h04cc :  // <0131> "

addr == 16'h4ca ? 16'h0fa0 :  // <0132> j = $lrns_puff_step_down_us
addr == 16'h4cb ? 16'hffdf :  // <0132> "

addr == 16'h4cc ? 16'h23a0 :  // <0134> pa = :lrns_trim_down_msg
addr == 16'h4cd ? 16'h0483 :  // <0134> "
addr == 16'h4ce ? 16'hfba0 :  // <0134> callx  set_text_flag  :lrns_trim_down_msg
addr == 16'h4cf ? 16'h0b26 :  // <0134> "
addr == 16'h4d0 ? 16'hfc00 :  // <0134> "

addr == 16'h4d1 ? 16'h5e00 :  // <0135> ram $ram_next_puff_len_us = i+j // av_ad_hi = 0
addr == 16'h4d2 ? 16'h6290 :  // <0135> ram $ram_next_puff_len_us = i+j // av_ad_lo = 144
addr == 16'h4d3 ? 16'hc800 :  // <0135> ram $ram_next_puff_len_us = i+j // av_write_data = i+j
addr == 16'h4d4 ? 16'h5710 :  // <0135> "


addr == 16'h4d5 ? 16'hf80c :  // <0137> pop rtna // func puff_len_learn_stoich
addr == 16'h4d6 ? 16'h1c0c :  // <0137> pop g7 // "
addr == 16'h4d7 ? 16'h180c :  // <0137> pop g6 // "
addr == 16'h4d8 ? 16'h0c0c :  // <0137> pop j // "
addr == 16'h4d9 ? 16'h080c :  // <0137> pop i // "
addr == 16'h4da ? 16'hfc00 :  // <0137> swapra = nop

// :lrns_enrich_msg // = 0x04db
// "lrnR\x0"
addr == 16'h4db ? 16'h726c :  // <0139> rl
addr == 16'h4dc ? 16'h526e :  // <0139> Rn
addr == 16'h4dd ? 16'h0000 :  // <0139>   
// :lrns_lean_msg // = 0x04de
// "lrnL\x0"
addr == 16'h4de ? 16'h726c :  // <0141> rl
addr == 16'h4df ? 16'h4c6e :  // <0141> Ln
addr == 16'h4e0 ? 16'h0000 :  // <0141>   

// ######## func learn_smap // = 0x04e1
addr == 16'h4e1 ? 16'h3002 :  // <0177> push i // func learn_smap
addr == 16'h4e2 ? 16'h3004 :  // <0177> push x // "
addr == 16'h4e3 ? 16'h3005 :  // <0177> push y // "
addr == 16'h4e4 ? 16'h303e :  // <0177> push rtna // "

addr == 16'h4e5 ? 16'h5e00 :  // <0144> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h4e6 ? 16'h627e :  // <0144> ram a = $ram_rpm_valid // av_ad_lo = 126
addr == 16'h4e7 ? 16'h0015 :  // <0144> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h4e8 ? 16'h0016 :  // <0144> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle

addr == 16'h4e9 ? 16'h0000 :  // <0176> a = a
addr == 16'h4ea ? 16'h0601 :  // <0176> b = 1

addr == 16'h4eb ? 16'he407 :  // <0145> bn eq :else_1259
addr == 16'h4ec ? 16'h0539 :  // <0145> "

// let g6 = map cell num.  x = map puff len.  i = observed stoich puff len.
addr == 16'h4ed ? 16'h5e00 :  // <0147> ram pa = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h4ee ? 16'h627c :  // <0147> ram pa = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h4ef ? 16'h2015 :  // <0147> ram pa = $ram_avg_rpm // pa = av_write_data // start read cycle
addr == 16'h4f0 ? 16'h2016 :  // <0147> ram pa = $ram_avg_rpm // pa = av_read_data // finish read cycle
addr == 16'h4f1 ? 16'hfba0 :  // <0148> callx  find_rpm_cell  pa  g6
addr == 16'h4f2 ? 16'h0585 :  // <0148> "
addr == 16'h4f3 ? 16'hfc00 :  // <0148> "
addr == 16'h4f4 ? 16'h1808 :  // <0148> g6 = pa
addr == 16'h4f5 ? 16'h0006 :  // <0149> a = g6

addr == 16'h4f6 ? 16'h0351 :  // <0150> a = a<<1
addr == 16'h4f7 ? 16'h0698 :  // <0150> b = 152
addr == 16'h4f8 ? 16'h5e00 :  // <0150> av_ad_hi = 0
addr == 16'h4f9 ? 16'h6300 :  // <0150> av_ad_lo = ad0
addr == 16'h4fa ? 16'h0415 :  // <0150> b = av_write_data
addr == 16'h4fb ? 16'h0416 :  // <0150> b = av_read_data

addr == 16'h4fc ? 16'h1001 :  // <0151> x = b
addr == 16'h4fd ? 16'h5e00 :  // <0152> ram i = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'h4fe ? 16'h6290 :  // <0152> ram i = $ram_next_puff_len_us // av_ad_lo = 144
addr == 16'h4ff ? 16'h0815 :  // <0152> ram i = $ram_next_puff_len_us // i = av_write_data // start read cycle
addr == 16'h500 ? 16'h0816 :  // <0152> ram i = $ram_next_puff_len_us // i = av_read_data // finish read cycle
addr == 16'h501 ? 16'h17a0 :  // <0153> y = (0xffff - $lrns_map_step + 1)
addr == 16'h502 ? 16'hff38 :  // <0153> "

addr == 16'h503 ? 16'hc800 :  // <0160> a = x+y
addr == 16'h504 ? 16'h0320 :  // <0160> "
addr == 16'h505 ? 16'h0402 :  // <0160> b = i

addr == 16'h506 ? 16'he406 :  // <0154> bn gt :else_1286
addr == 16'h507 ? 16'h0516 :  // <0154> "

// map is richer than observed stoich.  lean the map 1 step.
addr == 16'h508 ? 16'h0006 :  // <0156> a = g6
addr == 16'h509 ? 16'hc800 :  // <0157> b = x+y
addr == 16'h50a ? 16'h0720 :  // <0157> "

addr == 16'h50b ? 16'h0351 :  // <0158> a = a<<1
addr == 16'h50c ? 16'h3001 :  // <0158> push b // push b
addr == 16'h50d ? 16'h0698 :  // <0158> b = 152
addr == 16'h50e ? 16'h5e00 :  // <0158> av_ad_hi = 0
addr == 16'h50f ? 16'h6300 :  // <0158> av_ad_lo = ad0
addr == 16'h510 ? 16'h540c :  // <0158> pop av_write_data // pop av_write_data

addr == 16'h511 ? 16'h23a0 :  // <0159> pa = :lrns_lean_msg
addr == 16'h512 ? 16'h04de :  // <0159> "
addr == 16'h513 ? 16'hfba0 :  // <0159> callx  set_text_flag  :lrns_lean_msg
addr == 16'h514 ? 16'h0b26 :  // <0159> "
addr == 16'h515 ? 16'hfc00 :  // <0159> "

addr == 16'h516 ? 16'h16c8 :  // <0161> y = $lrns_map_step

addr == 16'h517 ? 16'hc800 :  // <0168> a = x+y
addr == 16'h518 ? 16'h0320 :  // <0168> "
addr == 16'h519 ? 16'h0402 :  // <0168> b = i

addr == 16'h51a ? 16'he405 :  // <0162> bn lt :else_1306
addr == 16'h51b ? 16'h052a :  // <0162> "

// map is leaner than observed stoich.  rich the map 1 step.
addr == 16'h51c ? 16'h0006 :  // <0164> a = g6
addr == 16'h51d ? 16'hc800 :  // <0165> b = x+y
addr == 16'h51e ? 16'h0720 :  // <0165> "

addr == 16'h51f ? 16'h0351 :  // <0166> a = a<<1
addr == 16'h520 ? 16'h3001 :  // <0166> push b // push b
addr == 16'h521 ? 16'h0698 :  // <0166> b = 152
addr == 16'h522 ? 16'h5e00 :  // <0166> av_ad_hi = 0
addr == 16'h523 ? 16'h6300 :  // <0166> av_ad_lo = ad0
addr == 16'h524 ? 16'h540c :  // <0166> pop av_write_data // pop av_write_data

addr == 16'h525 ? 16'h23a0 :  // <0167> pa = :lrns_enrich_msg
addr == 16'h526 ? 16'h04db :  // <0167> "
addr == 16'h527 ? 16'hfba0 :  // <0167> callx  set_text_flag  :lrns_enrich_msg
addr == 16'h528 ? 16'h0b26 :  // <0167> "
addr == 16'h529 ? 16'hfc00 :  // <0167> "


// dump smap if we haven't done so lately.
addr == 16'h52a ? 16'h5e00 :  // <0171> ram a = $ram_last_learn_second // av_ad_hi = 0
addr == 16'h52b ? 16'h62b2 :  // <0171> ram a = $ram_last_learn_second // av_ad_lo = 178
addr == 16'h52c ? 16'h0015 :  // <0171> ram a = $ram_last_learn_second // a = av_write_data // start read cycle
addr == 16'h52d ? 16'h0016 :  // <0171> ram a = $ram_last_learn_second // a = av_read_data // finish read cycle
addr == 16'h52e ? 16'h5e00 :  // <0172> ram b = $ram_seconds_cnt // av_ad_hi = 0
addr == 16'h52f ? 16'h6242 :  // <0172> ram b = $ram_seconds_cnt // av_ad_lo = 66
addr == 16'h530 ? 16'h0415 :  // <0172> ram b = $ram_seconds_cnt // b = av_write_data // start read cycle
addr == 16'h531 ? 16'h0416 :  // <0172> ram b = $ram_seconds_cnt // b = av_read_data // finish read cycle

addr == 16'h532 ? 16'h0000 :  // <0175> a = a
addr == 16'h533 ? 16'h0401 :  // <0175> b = b

addr == 16'h534 ? 16'he007 :  // <0173> br eq :else_1332
addr == 16'h535 ? 16'h0539 :  // <0173> "

addr == 16'h536 ? 16'hfba0 :  // <0174> callx  dump_smap_cmd
addr == 16'h537 ? 16'h05a2 :  // <0174> "
addr == 16'h538 ? 16'hfc00 :  // <0174> "



addr == 16'h539 ? 16'hf80c :  // <0178> pop rtna // func learn_smap
addr == 16'h53a ? 16'h140c :  // <0178> pop y // "
addr == 16'h53b ? 16'h100c :  // <0178> pop x // "
addr == 16'h53c ? 16'h080c :  // <0178> pop i // "
addr == 16'h53d ? 16'hfc00 :  // <0178> swapra = nop

// :o2_rich_msg // = 0x053e
// "o2R\x0"
addr == 16'h53e ? 16'h326f :  // <0180> 2o
addr == 16'h53f ? 16'h0052 :  // <0180>  R
// :o2_lean_msg // = 0x0540
// "o2L\x0"
addr == 16'h540 ? 16'h326f :  // <0182> 2o
addr == 16'h541 ? 16'h004c :  // <0182>  L

// ######## func interpret_o2 // = 0x0542

addr == 16'h542 ? 16'h5e00 :  // <0185> ram a = $ram_o2_state // av_ad_hi = 0
addr == 16'h543 ? 16'h62e6 :  // <0185> ram a = $ram_o2_state // av_ad_lo = 230
addr == 16'h544 ? 16'h0015 :  // <0185> ram a = $ram_o2_state // a = av_write_data // start read cycle
addr == 16'h545 ? 16'h0016 :  // <0185> ram a = $ram_o2_state // a = av_read_data // finish read cycle

addr == 16'h546 ? 16'h0000 :  // <0196> a = a
addr == 16'h547 ? 16'h0601 :  // <0196> b = 1

addr == 16'h548 ? 16'he007 :  // <0186> br eq :else_1352
addr == 16'h549 ? 16'h055d :  // <0186> "

// check sensor for lean state.
addr == 16'h54a ? 16'h0205 :  // <0188> a = $o2_adc_channel

addr == 16'h54b ? 16'h0351 :  // <0189> a = a<<1
addr == 16'h54c ? 16'h0626 :  // <0189> b = 38
addr == 16'h54d ? 16'h5e00 :  // <0189> av_ad_hi = 0
addr == 16'h54e ? 16'h6300 :  // <0189> av_ad_lo = ad0
addr == 16'h54f ? 16'h0415 :  // <0189> b = av_write_data
addr == 16'h550 ? 16'h0416 :  // <0189> b = av_read_data

addr == 16'h551 ? 16'h03a0 :  // <0190> a = $o2_lean_thresh_adc
addr == 16'h552 ? 16'h01c2 :  // <0190> "

addr == 16'h553 ? 16'h0000 :  // <0195> a = a
addr == 16'h554 ? 16'h0401 :  // <0195> b = b

addr == 16'h555 ? 16'he406 :  // <0191> bn gt :else_1365
addr == 16'h556 ? 16'h055d :  // <0191> "

addr == 16'h557 ? 16'h5e00 :  // <0192> ram $ram_o2_state = $o2_state_lean // av_ad_hi = 0
addr == 16'h558 ? 16'h62e6 :  // <0192> ram $ram_o2_state = $o2_state_lean // av_ad_lo = 230
addr == 16'h559 ? 16'h5601 :  // <0192> ram $ram_o2_state = $o2_state_lean // av_write_data = 1
addr == 16'h55a ? 16'h5e00 :  // <0193> ram $ram_o2_been_lean = 1 // av_ad_hi = 0
addr == 16'h55b ? 16'h62ea :  // <0193> ram $ram_o2_been_lean = 1 // av_ad_lo = 234
addr == 16'h55c ? 16'h5601 :  // <0193> ram $ram_o2_been_lean = 1 // av_write_data = 1
// callx  set_text_flag  :o2_lean_msg



addr == 16'h55d ? 16'h0000 :  // <0207> a = a
addr == 16'h55e ? 16'h0602 :  // <0207> b = 2

addr == 16'h55f ? 16'he007 :  // <0197> br eq :else_1375
addr == 16'h560 ? 16'h0574 :  // <0197> "

// check sensor for rich state.
addr == 16'h561 ? 16'h0205 :  // <0199> a = $o2_adc_channel

addr == 16'h562 ? 16'h0351 :  // <0200> a = a<<1
addr == 16'h563 ? 16'h0626 :  // <0200> b = 38
addr == 16'h564 ? 16'h5e00 :  // <0200> av_ad_hi = 0
addr == 16'h565 ? 16'h6300 :  // <0200> av_ad_lo = ad0
addr == 16'h566 ? 16'h0415 :  // <0200> b = av_write_data
addr == 16'h567 ? 16'h0416 :  // <0200> b = av_read_data

addr == 16'h568 ? 16'h03a0 :  // <0201> a = $o2_rich_thresh_adc
addr == 16'h569 ? 16'h02bc :  // <0201> "

addr == 16'h56a ? 16'h0000 :  // <0206> a = a
addr == 16'h56b ? 16'h0401 :  // <0206> b = b

addr == 16'h56c ? 16'he405 :  // <0202> bn lt :else_1388
addr == 16'h56d ? 16'h0574 :  // <0202> "

addr == 16'h56e ? 16'h5e00 :  // <0203> ram $ram_o2_state = $o2_state_rich // av_ad_hi = 0
addr == 16'h56f ? 16'h62e6 :  // <0203> ram $ram_o2_state = $o2_state_rich // av_ad_lo = 230
addr == 16'h570 ? 16'h5602 :  // <0203> ram $ram_o2_state = $o2_state_rich // av_write_data = 2
addr == 16'h571 ? 16'h5e00 :  // <0204> ram $ram_o2_been_rich = 1 // av_ad_hi = 0
addr == 16'h572 ? 16'h62e8 :  // <0204> ram $ram_o2_been_rich = 1 // av_ad_lo = 232
addr == 16'h573 ? 16'h5601 :  // <0204> ram $ram_o2_been_rich = 1 // av_write_data = 1
// callx  set_text_flag  :o2_rich_msg



addr == 16'h574 ? 16'hfc00 :  // <0209> swapra = nop

// ######## func init_o2_state // = 0x0575

addr == 16'h575 ? 16'h5e00 :  // <0211> ram $ram_o2_state = $o2_state_init // av_ad_hi = 0
addr == 16'h576 ? 16'h62e6 :  // <0211> ram $ram_o2_state = $o2_state_init // av_ad_lo = 230
addr == 16'h577 ? 16'h5600 :  // <0211> ram $ram_o2_state = $o2_state_init // av_write_data = 0
addr == 16'h578 ? 16'h5e00 :  // <0212> ram $ram_o2_been_lean = 0 // av_ad_hi = 0
addr == 16'h579 ? 16'h62ea :  // <0212> ram $ram_o2_been_lean = 0 // av_ad_lo = 234
addr == 16'h57a ? 16'h5600 :  // <0212> ram $ram_o2_been_lean = 0 // av_write_data = 0
addr == 16'h57b ? 16'h5e00 :  // <0213> ram $ram_o2_been_rich = 0 // av_ad_hi = 0
addr == 16'h57c ? 16'h62e8 :  // <0213> ram $ram_o2_been_rich = 0 // av_ad_lo = 232
addr == 16'h57d ? 16'h5600 :  // <0213> ram $ram_o2_been_rich = 0 // av_write_data = 0

addr == 16'h57e ? 16'hfc00 :  // <0215> swapra = nop

// ######## func leave_learn_stoich // = 0x057f
addr == 16'h57f ? 16'h303e :  // <0218> push rtna // func leave_learn_stoich

addr == 16'h580 ? 16'hfba0 :  // <0217> callx  check_engine_stop  pa
addr == 16'h581 ? 16'h0c5a :  // <0217> "
addr == 16'h582 ? 16'hfc00 :  // <0217> "

addr == 16'h583 ? 16'hf80c :  // <0219> pop rtna // func leave_learn_stoich
addr == 16'h584 ? 16'hfc00 :  // <0219> swapra = nop

// ######## func find_rpm_cell // = 0x0585
addr == 16'h585 ? 16'h3002 :  // <0236> push i // func find_rpm_cell
addr == 16'h586 ? 16'h3003 :  // <0236> push j // "

addr == 16'h587 ? 16'h0a01 :  // <0221> i = 1
addr == 16'h588 ? 16'h0008 :  // <0222> a = rpm
addr == 16'h589 ? 16'h0760 :  // <0223> b = 0xffff
addr == 16'h58a ? 16'he007 :  // <0224> br eq :found
addr == 16'h58b ? 16'h0599 :  // <0224> "
// :next_cell // = 0x058c
addr == 16'h58c ? 16'h0fa0 :  // <0226> j = :rpm_cells
addr == 16'h58d ? 16'h044a :  // <0226> "
addr == 16'h58e ? 16'hc800 :  // <0227> fetch a from i+j
addr == 16'h58f ? 16'hd310 :  // <0227> "
addr == 16'h590 ? 16'h03b0 :  // <0227> "
addr == 16'h591 ? 16'h0408 :  // <0228> b = rpm
addr == 16'h592 ? 16'he006 :  // <0229> br gt :found
addr == 16'h593 ? 16'h0599 :  // <0229> "
addr == 16'h594 ? 16'h0e01 :  // <0230> j = 1
addr == 16'h595 ? 16'hc800 :  // <0231> i = i+j
addr == 16'h596 ? 16'h0b10 :  // <0231> "
addr == 16'h597 ? 16'he00f :  // <0232> jmp :next_cell
addr == 16'h598 ? 16'h058c :  // <0232> "
// :found // = 0x0599
addr == 16'h599 ? 16'h0f60 :  // <0234> j = -1
addr == 16'h59a ? 16'hc800 :  // <0235> cell = i+j
addr == 16'h59b ? 16'h2310 :  // <0235> "
addr == 16'h59c ? 16'h0c0c :  // <0235> pop j // rtn i+j
addr == 16'h59d ? 16'h080c :  // <0235> pop i // "
addr == 16'h59e ? 16'hfc00 :  // <0234> swapra = nop

addr == 16'h59f ? 16'h0c0c :  // <0237> pop j // func find_rpm_cell
addr == 16'h5a0 ? 16'h080c :  // <0237> pop i // "
addr == 16'h5a1 ? 16'hfc00 :  // <0237> swapra = nop

// ######## func dump_smap_cmd // = 0x05a2
addr == 16'h5a2 ? 16'h3004 :  // <0276> push x // func dump_smap_cmd
addr == 16'h5a3 ? 16'h303e :  // <0276> push rtna // "

addr == 16'h5a4 ? 16'h020d :  // <0239> a = 13 // puteol
addr == 16'h5a5 ? 16'hfba0 :  // <0239> puteol
addr == 16'h5a6 ? 16'h009b :  // <0239> "
addr == 16'h5a7 ? 16'hfc00 :  // <0239> "
addr == 16'h5a8 ? 16'h020a :  // <0239> a = 10 // puteol
addr == 16'h5a9 ? 16'hfba0 :  // <0239> puteol
addr == 16'h5aa ? 16'h009b :  // <0239> "
addr == 16'h5ab ? 16'hfc00 :  // <0239> "
addr == 16'h5ac ? 16'h5e00 :  // <0240> ram pa = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h5ad ? 16'h627c :  // <0240> ram pa = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h5ae ? 16'h2015 :  // <0240> ram pa = $ram_avg_rpm // pa = av_write_data // start read cycle
addr == 16'h5af ? 16'h2016 :  // <0240> ram pa = $ram_avg_rpm // pa = av_read_data // finish read cycle
addr == 16'h5b0 ? 16'hfba0 :  // <0241> callx  find_rpm_cell  pa  pa
addr == 16'h5b1 ? 16'h0585 :  // <0241> "
addr == 16'h5b2 ? 16'hfc00 :  // <0241> "
addr == 16'h5b3 ? 16'h1200 :  // <0251> x = 0
// :loop_1459 // = 0x05b4

addr == 16'h5b4 ? 16'h0004 :  // <0242> a = x

addr == 16'h5b5 ? 16'h0351 :  // <0243> a = a<<1
addr == 16'h5b6 ? 16'h0698 :  // <0243> b = 152
addr == 16'h5b7 ? 16'h5e00 :  // <0243> av_ad_hi = 0
addr == 16'h5b8 ? 16'h6300 :  // <0243> av_ad_lo = ad0
addr == 16'h5b9 ? 16'h0415 :  // <0243> b = av_write_data
addr == 16'h5ba ? 16'h0416 :  // <0243> b = av_read_data

addr == 16'h5bb ? 16'h0001 :  // <0244> a = b
addr == 16'h5bc ? 16'hfba0 :  // <0245> call put4x
addr == 16'h5bd ? 16'h00c3 :  // <0245> "
addr == 16'h5be ? 16'hfc00 :  // <0245> "

addr == 16'h5bf ? 16'h0004 :  // <0248> a = x
addr == 16'h5c0 ? 16'h0408 :  // <0248> b = pa

addr == 16'h5c1 ? 16'he407 :  // <0246> bn eq :else_1473
addr == 16'h5c2 ? 16'h05c7 :  // <0246> "

addr == 16'h5c3 ? 16'h023c :  // <0247> a = 60 // putasc "<"
addr == 16'h5c4 ? 16'hfba0 :  // <0247> putasc "<"
addr == 16'h5c5 ? 16'h009b :  // <0247> "
addr == 16'h5c6 ? 16'hfc00 :  // <0247> "

addr == 16'h5c7 ? 16'h0220 :  // <0249> a = 32 // putasc " "
addr == 16'h5c8 ? 16'hfba0 :  // <0249> putasc " "
addr == 16'h5c9 ? 16'h009b :  // <0249> "
addr == 16'h5ca ? 16'hfc00 :  // <0249> "


addr == 16'h5cb ? 16'h0004 :  // <0251> a = x
addr == 16'h5cc ? 16'h0601 :  // <0251> b = 1
addr == 16'h5cd ? 16'hc800 :  // <0251> x = a+b
addr == 16'h5ce ? 16'h1300 :  // <0251> "


addr == 16'h5cf ? 16'h0004 :  // <0251> a = x
addr == 16'h5d0 ? 16'h060d :  // <0251> b = $num_rpm_cells
addr == 16'h5d1 ? 16'he005 :  // <0251> br lt :loop_1459
addr == 16'h5d2 ? 16'h05b4 :  // <0251> "

// :end_1459 // = 0x05d3
addr == 16'h5d3 ? 16'h020d :  // <0252> a = 13 // puteol
addr == 16'h5d4 ? 16'hfba0 :  // <0252> puteol
addr == 16'h5d5 ? 16'h009b :  // <0252> "
addr == 16'h5d6 ? 16'hfc00 :  // <0252> "
addr == 16'h5d7 ? 16'h020a :  // <0252> a = 10 // puteol
addr == 16'h5d8 ? 16'hfba0 :  // <0252> puteol
addr == 16'h5d9 ? 16'h009b :  // <0252> "
addr == 16'h5da ? 16'hfc00 :  // <0252> "
addr == 16'h5db ? 16'h1200 :  // <0262> x = 0
// :loop_1499 // = 0x05dc

addr == 16'h5dc ? 16'h0004 :  // <0253> a = x

addr == 16'h5dd ? 16'h0351 :  // <0254> a = a<<1
addr == 16'h5de ? 16'h06b4 :  // <0254> b = 180
addr == 16'h5df ? 16'h5e00 :  // <0254> av_ad_hi = 0
addr == 16'h5e0 ? 16'h6300 :  // <0254> av_ad_lo = ad0
addr == 16'h5e1 ? 16'h0415 :  // <0254> b = av_write_data
addr == 16'h5e2 ? 16'h0416 :  // <0254> b = av_read_data

addr == 16'h5e3 ? 16'h0001 :  // <0255> a = b
addr == 16'h5e4 ? 16'hfba0 :  // <0256> call put4x
addr == 16'h5e5 ? 16'h00c3 :  // <0256> "
addr == 16'h5e6 ? 16'hfc00 :  // <0256> "

addr == 16'h5e7 ? 16'h0004 :  // <0259> a = x
addr == 16'h5e8 ? 16'h0408 :  // <0259> b = pa

addr == 16'h5e9 ? 16'he407 :  // <0257> bn eq :else_1513
addr == 16'h5ea ? 16'h05ef :  // <0257> "

addr == 16'h5eb ? 16'h023c :  // <0258> a = 60 // putasc "<"
addr == 16'h5ec ? 16'hfba0 :  // <0258> putasc "<"
addr == 16'h5ed ? 16'h009b :  // <0258> "
addr == 16'h5ee ? 16'hfc00 :  // <0258> "

addr == 16'h5ef ? 16'h0220 :  // <0260> a = 32 // putasc " "
addr == 16'h5f0 ? 16'hfba0 :  // <0260> putasc " "
addr == 16'h5f1 ? 16'h009b :  // <0260> "
addr == 16'h5f2 ? 16'hfc00 :  // <0260> "


addr == 16'h5f3 ? 16'h0004 :  // <0262> a = x
addr == 16'h5f4 ? 16'h0601 :  // <0262> b = 1
addr == 16'h5f5 ? 16'hc800 :  // <0262> x = a+b
addr == 16'h5f6 ? 16'h1300 :  // <0262> "


addr == 16'h5f7 ? 16'h0004 :  // <0262> a = x
addr == 16'h5f8 ? 16'h060d :  // <0262> b = $num_tps_cells
addr == 16'h5f9 ? 16'he005 :  // <0262> br lt :loop_1499
addr == 16'h5fa ? 16'h05dc :  // <0262> "

// :end_1499 // = 0x05fb
addr == 16'h5fb ? 16'h020d :  // <0263> a = 13 // puteol
addr == 16'h5fc ? 16'hfba0 :  // <0263> puteol
addr == 16'h5fd ? 16'h009b :  // <0263> "
addr == 16'h5fe ? 16'hfc00 :  // <0263> "
addr == 16'h5ff ? 16'h020a :  // <0263> a = 10 // puteol
addr == 16'h600 ? 16'hfba0 :  // <0263> puteol
addr == 16'h601 ? 16'h009b :  // <0263> "
addr == 16'h602 ? 16'hfc00 :  // <0263> "
addr == 16'h603 ? 16'h5e00 :  // <0264> ram pa = $ram_tps_state // av_ad_hi = 0
addr == 16'h604 ? 16'h62ce :  // <0264> ram pa = $ram_tps_state // av_ad_lo = 206
addr == 16'h605 ? 16'h2015 :  // <0264> ram pa = $ram_tps_state // pa = av_write_data // start read cycle
addr == 16'h606 ? 16'h2016 :  // <0264> ram pa = $ram_tps_state // pa = av_read_data // finish read cycle
addr == 16'h607 ? 16'h1200 :  // <0274> x = 0
// :loop_1543 // = 0x0608

addr == 16'h608 ? 16'h0004 :  // <0265> a = x

addr == 16'h609 ? 16'h0351 :  // <0266> a = a<<1
addr == 16'h60a ? 16'h06d0 :  // <0266> b = 208
addr == 16'h60b ? 16'h5e00 :  // <0266> av_ad_hi = 0
addr == 16'h60c ? 16'h6300 :  // <0266> av_ad_lo = ad0
addr == 16'h60d ? 16'h0415 :  // <0266> b = av_write_data
addr == 16'h60e ? 16'h0416 :  // <0266> b = av_read_data

addr == 16'h60f ? 16'h0001 :  // <0267> a = b
addr == 16'h610 ? 16'hfba0 :  // <0268> call put4x
addr == 16'h611 ? 16'h00c3 :  // <0268> "
addr == 16'h612 ? 16'hfc00 :  // <0268> "

addr == 16'h613 ? 16'h0004 :  // <0271> a = x
addr == 16'h614 ? 16'h0408 :  // <0271> b = pa

addr == 16'h615 ? 16'he407 :  // <0269> bn eq :else_1557
addr == 16'h616 ? 16'h061b :  // <0269> "

addr == 16'h617 ? 16'h023c :  // <0270> a = 60 // putasc "<"
addr == 16'h618 ? 16'hfba0 :  // <0270> putasc "<"
addr == 16'h619 ? 16'h009b :  // <0270> "
addr == 16'h61a ? 16'hfc00 :  // <0270> "

addr == 16'h61b ? 16'h0220 :  // <0272> a = 32 // putasc " "
addr == 16'h61c ? 16'hfba0 :  // <0272> putasc " "
addr == 16'h61d ? 16'h009b :  // <0272> "
addr == 16'h61e ? 16'hfc00 :  // <0272> "


addr == 16'h61f ? 16'h0004 :  // <0274> a = x
addr == 16'h620 ? 16'h0601 :  // <0274> b = 1
addr == 16'h621 ? 16'hc800 :  // <0274> x = a+b
addr == 16'h622 ? 16'h1300 :  // <0274> "


addr == 16'h623 ? 16'h0004 :  // <0274> a = x
addr == 16'h624 ? 16'h0605 :  // <0274> b = $num_tps_states
addr == 16'h625 ? 16'he005 :  // <0274> br lt :loop_1543
addr == 16'h626 ? 16'h0608 :  // <0274> "

// :end_1543 // = 0x0627
addr == 16'h627 ? 16'h020d :  // <0275> a = 13 // puteol
addr == 16'h628 ? 16'hfba0 :  // <0275> puteol
addr == 16'h629 ? 16'h009b :  // <0275> "
addr == 16'h62a ? 16'hfc00 :  // <0275> "
addr == 16'h62b ? 16'h020a :  // <0275> a = 10 // puteol
addr == 16'h62c ? 16'hfba0 :  // <0275> puteol
addr == 16'h62d ? 16'h009b :  // <0275> "
addr == 16'h62e ? 16'hfc00 :  // <0275> "

addr == 16'h62f ? 16'hf80c :  // <0277> pop rtna // func dump_smap_cmd
addr == 16'h630 ? 16'h100c :  // <0277> pop x // "
addr == 16'h631 ? 16'hfc00 :  // <0277> swapra = nop

// ######## func load_tps_enrich_cmd // = 0x0632
addr == 16'h632 ? 16'h3002 :  // <0286> push i // func load_tps_enrich_cmd
addr == 16'h633 ? 16'h303e :  // <0286> push rtna // "

addr == 16'h634 ? 16'h0a00 :  // <0285> i = 0
// :loop_1588 // = 0x0635

addr == 16'h635 ? 16'hfba0 :  // <0279> call  get4x
addr == 16'h636 ? 16'h00fc :  // <0279> "
addr == 16'h637 ? 16'hfc00 :  // <0279> "
addr == 16'h638 ? 16'h0400 :  // <0280> b = a
addr == 16'h639 ? 16'h0002 :  // <0281> a = i

addr == 16'h63a ? 16'h0351 :  // <0282> a = a<<1
addr == 16'h63b ? 16'h3001 :  // <0282> push b // push b
addr == 16'h63c ? 16'h06d0 :  // <0282> b = 208
addr == 16'h63d ? 16'h5e00 :  // <0282> av_ad_hi = 0
addr == 16'h63e ? 16'h6300 :  // <0282> av_ad_lo = ad0
addr == 16'h63f ? 16'h540c :  // <0282> pop av_write_data // pop av_write_data

addr == 16'h640 ? 16'hfba0 :  // <0283> getchar
addr == 16'h641 ? 16'h00a4 :  // <0283> "
addr == 16'h642 ? 16'hfc00 :  // <0283> "


addr == 16'h643 ? 16'h0002 :  // <0285> a = i
addr == 16'h644 ? 16'h0601 :  // <0285> b = 1
addr == 16'h645 ? 16'hc800 :  // <0285> i = a+b
addr == 16'h646 ? 16'h0b00 :  // <0285> "


addr == 16'h647 ? 16'h0002 :  // <0285> a = i
addr == 16'h648 ? 16'h0605 :  // <0285> b = $num_tps_states
addr == 16'h649 ? 16'he005 :  // <0285> br lt :loop_1588
addr == 16'h64a ? 16'h0635 :  // <0285> "

// :end_1588 // = 0x064b

addr == 16'h64b ? 16'hf80c :  // <0287> pop rtna // func load_tps_enrich_cmd
addr == 16'h64c ? 16'h080c :  // <0287> pop i // "
addr == 16'h64d ? 16'hfc00 :  // <0287> swapra = nop

// ######## func load_smap_cmd // = 0x064e
addr == 16'h64e ? 16'h3002 :  // <0296> push i // func load_smap_cmd
addr == 16'h64f ? 16'h303e :  // <0296> push rtna // "

addr == 16'h650 ? 16'h0a00 :  // <0295> i = 0
// :loop_1616 // = 0x0651

addr == 16'h651 ? 16'hfba0 :  // <0289> call  get4x
addr == 16'h652 ? 16'h00fc :  // <0289> "
addr == 16'h653 ? 16'hfc00 :  // <0289> "
addr == 16'h654 ? 16'h0400 :  // <0290> b = a
addr == 16'h655 ? 16'h0002 :  // <0291> a = i

addr == 16'h656 ? 16'h0351 :  // <0292> a = a<<1
addr == 16'h657 ? 16'h3001 :  // <0292> push b // push b
addr == 16'h658 ? 16'h0698 :  // <0292> b = 152
addr == 16'h659 ? 16'h5e00 :  // <0292> av_ad_hi = 0
addr == 16'h65a ? 16'h6300 :  // <0292> av_ad_lo = ad0
addr == 16'h65b ? 16'h540c :  // <0292> pop av_write_data // pop av_write_data

addr == 16'h65c ? 16'hfba0 :  // <0293> getchar
addr == 16'h65d ? 16'h00a4 :  // <0293> "
addr == 16'h65e ? 16'hfc00 :  // <0293> "


addr == 16'h65f ? 16'h0002 :  // <0295> a = i
addr == 16'h660 ? 16'h0601 :  // <0295> b = 1
addr == 16'h661 ? 16'hc800 :  // <0295> i = a+b
addr == 16'h662 ? 16'h0b00 :  // <0295> "


addr == 16'h663 ? 16'h0002 :  // <0295> a = i
addr == 16'h664 ? 16'h060d :  // <0295> b = $num_rpm_cells
addr == 16'h665 ? 16'he005 :  // <0295> br lt :loop_1616
addr == 16'h666 ? 16'h0651 :  // <0295> "

// :end_1616 // = 0x0667

addr == 16'h667 ? 16'hf80c :  // <0297> pop rtna // func load_smap_cmd
addr == 16'h668 ? 16'h080c :  // <0297> pop i // "
addr == 16'h669 ? 16'hfc00 :  // <0297> swapra = nop

// ######## func clear_smap_cmd // = 0x066a
addr == 16'h66a ? 16'h3002 :  // <0304> push i // func clear_smap_cmd

addr == 16'h66b ? 16'h0a00 :  // <0303> i = 0
// :loop_1643 // = 0x066c

addr == 16'h66c ? 16'h0002 :  // <0299> a = i
addr == 16'h66d ? 16'h07a0 :  // <0300> b = 3000
addr == 16'h66e ? 16'h0bb8 :  // <0300> "

addr == 16'h66f ? 16'h0351 :  // <0301> a = a<<1
addr == 16'h670 ? 16'h3001 :  // <0301> push b // push b
addr == 16'h671 ? 16'h0698 :  // <0301> b = 152
addr == 16'h672 ? 16'h5e00 :  // <0301> av_ad_hi = 0
addr == 16'h673 ? 16'h6300 :  // <0301> av_ad_lo = ad0
addr == 16'h674 ? 16'h540c :  // <0301> pop av_write_data // pop av_write_data



addr == 16'h675 ? 16'h0002 :  // <0303> a = i
addr == 16'h676 ? 16'h0601 :  // <0303> b = 1
addr == 16'h677 ? 16'hc800 :  // <0303> i = a+b
addr == 16'h678 ? 16'h0b00 :  // <0303> "


addr == 16'h679 ? 16'h0002 :  // <0303> a = i
addr == 16'h67a ? 16'h060d :  // <0303> b = $num_rpm_cells
addr == 16'h67b ? 16'he005 :  // <0303> br lt :loop_1643
addr == 16'h67c ? 16'h066c :  // <0303> "

// :end_1643 // = 0x067d

addr == 16'h67d ? 16'h080c :  // <0305> pop i // func clear_smap_cmd
addr == 16'h67e ? 16'hfc00 :  // <0305> swapra = nop

// ######## func load_tps_ref_cmd // = 0x067f
addr == 16'h67f ? 16'h3002 :  // <0317> push i // func load_tps_ref_cmd
addr == 16'h680 ? 16'h3006 :  // <0317> push ga // "
addr == 16'h681 ? 16'h303e :  // <0317> push rtna // "

addr == 16'h682 ? 16'h0a00 :  // <0316> i = 0
// :loop_1666 // = 0x0683

addr == 16'h683 ? 16'hfba0 :  // <0307> call  get4x
addr == 16'h684 ? 16'h00fc :  // <0307> "
addr == 16'h685 ? 16'hfc00 :  // <0307> "
addr == 16'h686 ? 16'h1800 :  // <0308> ga = a
addr == 16'h687 ? 16'h0400 :  // <0309> b = a
addr == 16'h688 ? 16'h0002 :  // <0310> a = i

addr == 16'h689 ? 16'h0351 :  // <0311> a = a<<1
addr == 16'h68a ? 16'h3001 :  // <0311> push b // push b
addr == 16'h68b ? 16'h06b4 :  // <0311> b = 180
addr == 16'h68c ? 16'h5e00 :  // <0311> av_ad_hi = 0
addr == 16'h68d ? 16'h6300 :  // <0311> av_ad_lo = ad0
addr == 16'h68e ? 16'h540c :  // <0311> pop av_write_data // pop av_write_data

addr == 16'h68f ? 16'h0006 :  // <0312> a = ga
addr == 16'h690 ? 16'hfba0 :  // <0313> call put4x
addr == 16'h691 ? 16'h00c3 :  // <0313> "
addr == 16'h692 ? 16'hfc00 :  // <0313> "
addr == 16'h693 ? 16'hfba0 :  // <0314> getchar
addr == 16'h694 ? 16'h00a4 :  // <0314> "
addr == 16'h695 ? 16'hfc00 :  // <0314> "


addr == 16'h696 ? 16'h0002 :  // <0316> a = i
addr == 16'h697 ? 16'h0601 :  // <0316> b = 1
addr == 16'h698 ? 16'hc800 :  // <0316> i = a+b
addr == 16'h699 ? 16'h0b00 :  // <0316> "


addr == 16'h69a ? 16'h0002 :  // <0316> a = i
addr == 16'h69b ? 16'h060d :  // <0316> b = $num_tps_cells
addr == 16'h69c ? 16'he005 :  // <0316> br lt :loop_1666
addr == 16'h69d ? 16'h0683 :  // <0316> "

// :end_1666 // = 0x069e

addr == 16'h69e ? 16'hf80c :  // <0318> pop rtna // func load_tps_ref_cmd
addr == 16'h69f ? 16'h180c :  // <0318> pop ga // "
addr == 16'h6a0 ? 16'h080c :  // <0318> pop i // "
addr == 16'h6a1 ? 16'hfc00 :  // <0318> swapra = nop

// ######## func learn_tps_ref_cmd // = 0x06a2
addr == 16'h6a2 ? 16'h303e :  // <0324> push rtna // func learn_tps_ref_cmd

addr == 16'h6a3 ? 16'h5e00 :  // <0320> ram pa = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h6a4 ? 16'h627c :  // <0320> ram pa = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h6a5 ? 16'h2015 :  // <0320> ram pa = $ram_avg_rpm // pa = av_write_data // start read cycle
addr == 16'h6a6 ? 16'h2016 :  // <0320> ram pa = $ram_avg_rpm // pa = av_read_data // finish read cycle
addr == 16'h6a7 ? 16'hfba0 :  // <0321> callx  find_rpm_cell  pa  a
addr == 16'h6a8 ? 16'h0585 :  // <0321> "
addr == 16'h6a9 ? 16'hfc00 :  // <0321> "
addr == 16'h6aa ? 16'h0008 :  // <0321> a = pa
addr == 16'h6ab ? 16'h5e00 :  // <0322> ram b = $ram_tps_avg // av_ad_hi = 0
addr == 16'h6ac ? 16'h62da :  // <0322> ram b = $ram_tps_avg // av_ad_lo = 218
addr == 16'h6ad ? 16'h0415 :  // <0322> ram b = $ram_tps_avg // b = av_write_data // start read cycle
addr == 16'h6ae ? 16'h0416 :  // <0322> ram b = $ram_tps_avg // b = av_read_data // finish read cycle

addr == 16'h6af ? 16'h0351 :  // <0323> a = a<<1
addr == 16'h6b0 ? 16'h3001 :  // <0323> push b // push b
addr == 16'h6b1 ? 16'h06b4 :  // <0323> b = 180
addr == 16'h6b2 ? 16'h5e00 :  // <0323> av_ad_hi = 0
addr == 16'h6b3 ? 16'h6300 :  // <0323> av_ad_lo = ad0
addr == 16'h6b4 ? 16'h540c :  // <0323> pop av_write_data // pop av_write_data


addr == 16'h6b5 ? 16'hf80c :  // <0325> pop rtna // func learn_tps_ref_cmd
addr == 16'h6b6 ? 16'hfc00 :  // <0325> swapra = nop


// :plan_name_run // = 0x06b7
// "RN\x0"
addr == 16'h6b7 ? 16'h4e52 :  // <0002> NR
addr == 16'h6b8 ? 16'h0000 :  // <0002>   


// max trim is about 200 thou prior to multiplier overflow.
// or more if the smap puff is below 8000.
// trim resolution is 4 thou due to multiplier.
// smap resolution for trimming is 16 us.
// final trim enrichment us resolution is 16 us.

// ######## func trim_lean_cmd // = 0x06b9

addr == 16'h6b9 ? 16'h5e00 :  // <0016> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h6ba ? 16'h62ec :  // <0016> ram a = $ram_run_manual_trim_thou // av_ad_lo = 236
addr == 16'h6bb ? 16'h0015 :  // <0016> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h6bc ? 16'h0016 :  // <0016> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle

addr == 16'h6bd ? 16'h0000 :  // <0021> a = a
addr == 16'h6be ? 16'h0600 :  // <0021> b = 0

addr == 16'h6bf ? 16'he7a0 :  // <0017> bn = :else_1727
addr == 16'h6c0 ? 16'h06c3 :  // <0017> "


addr == 16'h6c1 ? 16'he00f :  // <0019> jmp :end_1727
addr == 16'h6c2 ? 16'h06c9 :  // <0019> "

addr == 16'h6c3 ? 16'h07a0 :  // <0020> b = (($run_manual_trim_step_thou ^ 0xffff) + 1)
addr == 16'h6c4 ? 16'hfffc :  // <0020> "
addr == 16'h6c5 ? 16'h5e00 :  // <0021> ram $ram_run_manual_trim_thou = a+b // av_ad_hi = 0
addr == 16'h6c6 ? 16'h62ec :  // <0021> ram $ram_run_manual_trim_thou = a+b // av_ad_lo = 236
addr == 16'h6c7 ? 16'hc800 :  // <0021> ram $ram_run_manual_trim_thou = a+b // av_write_data = a+b
addr == 16'h6c8 ? 16'h5700 :  // <0021> "


addr == 16'h6c9 ? 16'hfc00 :  // <0023> swapra = nop

// ######## func trim_rich_cmd // = 0x06ca

addr == 16'h6ca ? 16'h5e00 :  // <0025> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h6cb ? 16'h62ec :  // <0025> ram a = $ram_run_manual_trim_thou // av_ad_lo = 236
addr == 16'h6cc ? 16'h0015 :  // <0025> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h6cd ? 16'h0016 :  // <0025> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle

addr == 16'h6ce ? 16'h0000 :  // <0030> a = a
addr == 16'h6cf ? 16'h07a0 :  // <0030> b = 800
addr == 16'h6d0 ? 16'h0320 :  // <0030> "

addr == 16'h6d1 ? 16'he406 :  // <0026> bn gt :else_1745
addr == 16'h6d2 ? 16'h06d5 :  // <0026> "


addr == 16'h6d3 ? 16'he00f :  // <0028> jmp :end_1745
addr == 16'h6d4 ? 16'h06da :  // <0028> "

addr == 16'h6d5 ? 16'h0604 :  // <0029> b = $run_manual_trim_step_thou
addr == 16'h6d6 ? 16'h5e00 :  // <0030> ram $ram_run_manual_trim_thou = a+b // av_ad_hi = 0
addr == 16'h6d7 ? 16'h62ec :  // <0030> ram $ram_run_manual_trim_thou = a+b // av_ad_lo = 236
addr == 16'h6d8 ? 16'hc800 :  // <0030> ram $ram_run_manual_trim_thou = a+b // av_write_data = a+b
addr == 16'h6d9 ? 16'h5700 :  // <0030> "


addr == 16'h6da ? 16'hfc00 :  // <0032> swapra = nop

// ######## func trim_2lean_cmd // = 0x06db

addr == 16'h6db ? 16'h5e00 :  // <0034> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h6dc ? 16'h62ec :  // <0034> ram a = $ram_run_manual_trim_thou // av_ad_lo = 236
addr == 16'h6dd ? 16'h0015 :  // <0034> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h6de ? 16'h0016 :  // <0034> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle

addr == 16'h6df ? 16'h0000 :  // <0039> a = a
addr == 16'h6e0 ? 16'h0600 :  // <0039> b = 0

addr == 16'h6e1 ? 16'he7a0 :  // <0035> bn = :else_1761
addr == 16'h6e2 ? 16'h06e5 :  // <0035> "


addr == 16'h6e3 ? 16'he00f :  // <0037> jmp :end_1761
addr == 16'h6e4 ? 16'h06eb :  // <0037> "

addr == 16'h6e5 ? 16'h07a0 :  // <0038> b = ((($run_manual_trim_step_thou << 3) ^ 0xffff) + 1)
addr == 16'h6e6 ? 16'hffe0 :  // <0038> "
addr == 16'h6e7 ? 16'h5e00 :  // <0039> ram $ram_run_manual_trim_thou = a+b // av_ad_hi = 0
addr == 16'h6e8 ? 16'h62ec :  // <0039> ram $ram_run_manual_trim_thou = a+b // av_ad_lo = 236
addr == 16'h6e9 ? 16'hc800 :  // <0039> ram $ram_run_manual_trim_thou = a+b // av_write_data = a+b
addr == 16'h6ea ? 16'h5700 :  // <0039> "


addr == 16'h6eb ? 16'hfc00 :  // <0041> swapra = nop

// ######## func trim_2rich_cmd // = 0x06ec

addr == 16'h6ec ? 16'h5e00 :  // <0043> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h6ed ? 16'h62ec :  // <0043> ram a = $ram_run_manual_trim_thou // av_ad_lo = 236
addr == 16'h6ee ? 16'h0015 :  // <0043> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h6ef ? 16'h0016 :  // <0043> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle

addr == 16'h6f0 ? 16'h0000 :  // <0048> a = a
addr == 16'h6f1 ? 16'h07a0 :  // <0048> b = 800
addr == 16'h6f2 ? 16'h0320 :  // <0048> "

addr == 16'h6f3 ? 16'he406 :  // <0044> bn gt :else_1779
addr == 16'h6f4 ? 16'h06f7 :  // <0044> "


addr == 16'h6f5 ? 16'he00f :  // <0046> jmp :end_1779
addr == 16'h6f6 ? 16'h06fc :  // <0046> "

addr == 16'h6f7 ? 16'h0620 :  // <0047> b = ($run_manual_trim_step_thou << 3)
addr == 16'h6f8 ? 16'h5e00 :  // <0048> ram $ram_run_manual_trim_thou = a+b // av_ad_hi = 0
addr == 16'h6f9 ? 16'h62ec :  // <0048> ram $ram_run_manual_trim_thou = a+b // av_ad_lo = 236
addr == 16'h6fa ? 16'hc800 :  // <0048> ram $ram_run_manual_trim_thou = a+b // av_write_data = a+b
addr == 16'h6fb ? 16'h5700 :  // <0048> "


addr == 16'h6fc ? 16'hfc00 :  // <0050> swapra = nop

// ######## func init_plan_run // = 0x06fd

// set up the run plan.
addr == 16'h6fd ? 16'h5e00 :  // <0053> ram $ram_run_manual_trim_thou = 0 // av_ad_hi = 0
addr == 16'h6fe ? 16'h62ec :  // <0053> ram $ram_run_manual_trim_thou = 0 // av_ad_lo = 236
addr == 16'h6ff ? 16'h5600 :  // <0053> ram $ram_run_manual_trim_thou = 0 // av_write_data = 0

// memorize state.
addr == 16'h700 ? 16'h5e00 :  // <0056> ram $ram_plan_name = :plan_name_run // av_ad_hi = 0
addr == 16'h701 ? 16'h6288 :  // <0056> ram $ram_plan_name = :plan_name_run // av_ad_lo = 136
addr == 16'h702 ? 16'h57a0 :  // <0056> ram $ram_plan_name = :plan_name_run // av_write_data = :plan_name_run
addr == 16'h703 ? 16'h06b7 :  // <0056> "
addr == 16'h704 ? 16'h5e00 :  // <0057> ram $ram_puff_len_func = :puff_len_run // av_ad_hi = 0
addr == 16'h705 ? 16'h628a :  // <0057> ram $ram_puff_len_func = :puff_len_run // av_ad_lo = 138
addr == 16'h706 ? 16'h57a0 :  // <0057> ram $ram_puff_len_func = :puff_len_run // av_write_data = :puff_len_run
addr == 16'h707 ? 16'h0718 :  // <0057> "
addr == 16'h708 ? 16'h5e00 :  // <0058> ram $ram_transition_func = :leave_run // av_ad_hi = 0
addr == 16'h709 ? 16'h628c :  // <0058> ram $ram_transition_func = :leave_run // av_ad_lo = 140
addr == 16'h70a ? 16'h57a0 :  // <0058> ram $ram_transition_func = :leave_run // av_write_data = :leave_run
addr == 16'h70b ? 16'h0775 :  // <0058> "
addr == 16'h70c ? 16'h5e00 :  // <0059> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_hi = 0
addr == 16'h70d ? 16'h628e :  // <0059> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_lo = 142
addr == 16'h70e ? 16'h57a0 :  // <0059> ram $ram_destroy_plan_func = :destroy_plan_run // av_write_data = :destroy_plan_run
addr == 16'h70f ? 16'h0711 :  // <0059> "

addr == 16'h710 ? 16'hfc00 :  // <0061> swapra = nop

// ######## func destroy_plan_run // = 0x0711


addr == 16'h711 ? 16'hfc00 :  // <0064> swapra = nop

// :tps_accel2_msg // = 0x0712
// "tpsa2\x0"
addr == 16'h712 ? 16'h7074 :  // <0066> pt
addr == 16'h713 ? 16'h6173 :  // <0066> as
addr == 16'h714 ? 16'h0032 :  // <0066>  2
// :tps_open_msg // = 0x0715
// "tpsop\x0"
addr == 16'h715 ? 16'h7074 :  // <0068> pt
addr == 16'h716 ? 16'h6f73 :  // <0068> os
addr == 16'h717 ? 16'h0070 :  // <0068>  p

// ######## func puff_len_run // = 0x0718
addr == 16'h718 ? 16'h3004 :  // <0122> push x // func puff_len_run
addr == 16'h719 ? 16'h3006 :  // <0122> push ga // "
addr == 16'h71a ? 16'h303e :  // <0122> push rtna // "

addr == 16'h71b ? 16'h5e00 :  // <0071> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h71c ? 16'h627e :  // <0071> ram a = $ram_rpm_valid // av_ad_lo = 126
addr == 16'h71d ? 16'h0015 :  // <0071> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h71e ? 16'h0016 :  // <0071> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle

addr == 16'h71f ? 16'h0000 :  // <0121> a = a
addr == 16'h720 ? 16'h0601 :  // <0121> b = 1

addr == 16'h721 ? 16'he407 :  // <0072> bn eq :else_1825
addr == 16'h722 ? 16'h0771 :  // <0072> "

// read smap puff into ga
addr == 16'h723 ? 16'h5e00 :  // <0074> ram pa = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h724 ? 16'h627c :  // <0074> ram pa = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h725 ? 16'h2015 :  // <0074> ram pa = $ram_avg_rpm // pa = av_write_data // start read cycle
addr == 16'h726 ? 16'h2016 :  // <0074> ram pa = $ram_avg_rpm // pa = av_read_data // finish read cycle
addr == 16'h727 ? 16'hfba0 :  // <0075> callx  find_rpm_cell  pa  a
addr == 16'h728 ? 16'h0585 :  // <0075> "
addr == 16'h729 ? 16'hfc00 :  // <0075> "
addr == 16'h72a ? 16'h0008 :  // <0075> a = pa

addr == 16'h72b ? 16'h0351 :  // <0076> a = a<<1
addr == 16'h72c ? 16'h0698 :  // <0076> b = 152
addr == 16'h72d ? 16'h5e00 :  // <0076> av_ad_hi = 0
addr == 16'h72e ? 16'h6300 :  // <0076> av_ad_lo = ad0
addr == 16'h72f ? 16'h0415 :  // <0076> b = av_write_data
addr == 16'h730 ? 16'h0416 :  // <0076> b = av_read_data

addr == 16'h731 ? 16'h1801 :  // <0077> ga = b

// calculate manual enrichment in us.  apply a total of 10 bits of right-shift to
// implement division by 1024 (thou unit).  spread them out to prevent overflow.
addr == 16'h732 ? 16'h5e00 :  // <0081> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h733 ? 16'h62ec :  // <0081> ram a = $ram_run_manual_trim_thou // av_ad_lo = 236
addr == 16'h734 ? 16'h0015 :  // <0081> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h735 ? 16'h0016 :  // <0081> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle
addr == 16'h736 ? 16'h0350 :  // <0082> a = a>>1
addr == 16'h737 ? 16'h0750 :  // <0083> b = a>>1
addr == 16'h738 ? 16'h0006 :  // <0084> a = ga
addr == 16'h739 ? 16'h0353 :  // <0085> a = a>>4
addr == 16'h73a ? 16'hfba0 :  // <0086> call  multiply
addr == 16'h73b ? 16'h0170 :  // <0086> "
addr == 16'h73c ? 16'hfc00 :  // <0086> "
addr == 16'h73d ? 16'h0353 :  // <0087> a = a>>4

// add enrichment to smap puff.
addr == 16'h73e ? 16'h0406 :  // <0090> b = ga
addr == 16'h73f ? 16'hc800 :  // <0091> ga = a+b
addr == 16'h740 ? 16'h1b00 :  // <0091> "

// determine TPS enrichment for acceleration.
addr == 16'h741 ? 16'h5e00 :  // <0094> ram x = $ram_tps_state // av_ad_hi = 0
addr == 16'h742 ? 16'h62ce :  // <0094> ram x = $ram_tps_state // av_ad_lo = 206
addr == 16'h743 ? 16'h1015 :  // <0094> ram x = $ram_tps_state // x = av_write_data // start read cycle
addr == 16'h744 ? 16'h1016 :  // <0094> ram x = $ram_tps_state // x = av_read_data // finish read cycle

addr == 16'h745 ? 16'h0004 :  // <0097> a = x
addr == 16'h746 ? 16'h0603 :  // <0097> b = 3

addr == 16'h747 ? 16'he407 :  // <0095> bn eq :else_1863
addr == 16'h748 ? 16'h074e :  // <0095> "

addr == 16'h749 ? 16'h23a0 :  // <0096> pa = :tps_accel2_msg
addr == 16'h74a ? 16'h0712 :  // <0096> "
addr == 16'h74b ? 16'hfba0 :  // <0096> callx  unique_text_flag  :tps_accel2_msg
addr == 16'h74c ? 16'h0b3b :  // <0096> "
addr == 16'h74d ? 16'hfc00 :  // <0096> "


addr == 16'h74e ? 16'h0004 :  // <0100> a = x
addr == 16'h74f ? 16'h0604 :  // <0100> b = 4

addr == 16'h750 ? 16'he407 :  // <0098> bn eq :else_1872
addr == 16'h751 ? 16'h0757 :  // <0098> "

addr == 16'h752 ? 16'h23a0 :  // <0099> pa = :tps_open_msg
addr == 16'h753 ? 16'h0715 :  // <0099> "
addr == 16'h754 ? 16'hfba0 :  // <0099> callx  unique_text_flag  :tps_open_msg
addr == 16'h755 ? 16'h0b3b :  // <0099> "
addr == 16'h756 ? 16'hfc00 :  // <0099> "

addr == 16'h757 ? 16'h0004 :  // <0101> a = x

addr == 16'h758 ? 16'h0351 :  // <0102> a = a<<1
addr == 16'h759 ? 16'h06d0 :  // <0102> b = 208
addr == 16'h75a ? 16'h5e00 :  // <0102> av_ad_hi = 0
addr == 16'h75b ? 16'h6300 :  // <0102> av_ad_lo = ad0
addr == 16'h75c ? 16'h0415 :  // <0102> b = av_write_data
addr == 16'h75d ? 16'h0416 :  // <0102> b = av_read_data


addr == 16'h75e ? 16'h0200 :  // <0117> a = 0
addr == 16'h75f ? 16'h0401 :  // <0117> b = b

addr == 16'h760 ? 16'he007 :  // <0103> br eq :else_1888
addr == 16'h761 ? 16'h076e :  // <0103> "

// calculate TPS enrichment in us.  apply a total of 10 bits of right-shift to
// implement division by 1024 (thou unit).  spread them out to prevent overflow.
addr == 16'h762 ? 16'h0001 :  // <0106> a = b
addr == 16'h763 ? 16'h0350 :  // <0107> a = a>>1
addr == 16'h764 ? 16'h0750 :  // <0108> b = a>>1
addr == 16'h765 ? 16'h0006 :  // <0109> a = ga
addr == 16'h766 ? 16'h0353 :  // <0110> a = a>>4
addr == 16'h767 ? 16'hfba0 :  // <0111> call  multiply
addr == 16'h768 ? 16'h0170 :  // <0111> "
addr == 16'h769 ? 16'hfc00 :  // <0111> "
addr == 16'h76a ? 16'h0353 :  // <0112> a = a>>4

// add enrichment to smap puff.
addr == 16'h76b ? 16'h0406 :  // <0115> b = ga
addr == 16'h76c ? 16'hc800 :  // <0116> ga = a+b
addr == 16'h76d ? 16'h1b00 :  // <0116> "


// memorize total puff.
addr == 16'h76e ? 16'h5e00 :  // <0120> ram $ram_next_puff_len_us = ga // av_ad_hi = 0
addr == 16'h76f ? 16'h6290 :  // <0120> ram $ram_next_puff_len_us = ga // av_ad_lo = 144
addr == 16'h770 ? 16'h5406 :  // <0120> ram $ram_next_puff_len_us = ga // av_write_data = ga


addr == 16'h771 ? 16'hf80c :  // <0123> pop rtna // func puff_len_run
addr == 16'h772 ? 16'h180c :  // <0123> pop ga // "
addr == 16'h773 ? 16'h100c :  // <0123> pop x // "
addr == 16'h774 ? 16'hfc00 :  // <0123> swapra = nop

// ######## func leave_run // = 0x0775
addr == 16'h775 ? 16'h303e :  // <0126> push rtna // func leave_run

addr == 16'h776 ? 16'hfba0 :  // <0125> callx  check_engine_stop  pa
addr == 16'h777 ? 16'h0c5a :  // <0125> "
addr == 16'h778 ? 16'hfc00 :  // <0125> "

addr == 16'h779 ? 16'hf80c :  // <0127> pop rtna // func leave_run
addr == 16'h77a ? 16'hfc00 :  // <0127> swapra = nop



// #########################################################################
// :main // = 0x077b
addr == 16'h77b ? 16'h03a0 :  // <0214> a = :boot_msg
addr == 16'h77c ? 16'h008b :  // <0214> "
addr == 16'h77d ? 16'hfba0 :  // <0215> call :print_nt
addr == 16'h77e ? 16'h014f :  // <0215> "
addr == 16'h77f ? 16'hfc00 :  // <0215> "

// clear the first 64k of RAM.
addr == 16'h780 ? 16'h5e00 :  // <0218> av_ad_hi = 0
addr == 16'h781 ? 16'hfba0 :  // <0218> callx  clear_ram_page  0
addr == 16'h782 ? 16'h0b1e :  // <0218> "
addr == 16'h783 ? 16'hfc00 :  // <0218> "

// init fuel injection.
addr == 16'h784 ? 16'hfba0 :  // <0221> callx  init_plan_stop
addr == 16'h785 ? 16'h0322 :  // <0221> "
addr == 16'h786 ? 16'hfc00 :  // <0221> "
addr == 16'h787 ? 16'h0a00 :  // <0226> i = 0
// :loop_1927 // = 0x0788

addr == 16'h788 ? 16'h0002 :  // <0222> a = i
addr == 16'h789 ? 16'h07a0 :  // <0223> b = 0x0c08
addr == 16'h78a ? 16'h0c08 :  // <0223> "

addr == 16'h78b ? 16'h0351 :  // <0224> a = a<<1
addr == 16'h78c ? 16'h3001 :  // <0224> push b // push b
addr == 16'h78d ? 16'h0698 :  // <0224> b = 152
addr == 16'h78e ? 16'h5e00 :  // <0224> av_ad_hi = 0
addr == 16'h78f ? 16'h6300 :  // <0224> av_ad_lo = ad0
addr == 16'h790 ? 16'h540c :  // <0224> pop av_write_data // pop av_write_data



addr == 16'h791 ? 16'h0002 :  // <0226> a = i
addr == 16'h792 ? 16'h0601 :  // <0226> b = 1
addr == 16'h793 ? 16'hc800 :  // <0226> i = a+b
addr == 16'h794 ? 16'h0b00 :  // <0226> "


addr == 16'h795 ? 16'h0002 :  // <0226> a = i
addr == 16'h796 ? 16'h060d :  // <0226> b = $num_rpm_cells
addr == 16'h797 ? 16'he005 :  // <0226> br lt :loop_1927
addr == 16'h798 ? 16'h0788 :  // <0226> "

// :end_1927 // = 0x0799
addr == 16'h799 ? 16'h0a00 :  // <0233> i = 0
// :loop_1945 // = 0x079a

addr == 16'h79a ? 16'h0002 :  // <0227> a = i
addr == 16'h79b ? 16'h07a0 :  // <0228> b = :default_tps_reference
addr == 16'h79c ? 16'h0458 :  // <0228> "
addr == 16'h79d ? 16'hc800 :  // <0229> fetch b from a+b
addr == 16'h79e ? 16'hd300 :  // <0229> "
addr == 16'h79f ? 16'h07b0 :  // <0229> "
addr == 16'h7a0 ? 16'h0002 :  // <0230> a = i

addr == 16'h7a1 ? 16'h0351 :  // <0231> a = a<<1
addr == 16'h7a2 ? 16'h3001 :  // <0231> push b // push b
addr == 16'h7a3 ? 16'h06b4 :  // <0231> b = 180
addr == 16'h7a4 ? 16'h5e00 :  // <0231> av_ad_hi = 0
addr == 16'h7a5 ? 16'h6300 :  // <0231> av_ad_lo = ad0
addr == 16'h7a6 ? 16'h540c :  // <0231> pop av_write_data // pop av_write_data



addr == 16'h7a7 ? 16'h0002 :  // <0233> a = i
addr == 16'h7a8 ? 16'h0601 :  // <0233> b = 1
addr == 16'h7a9 ? 16'hc800 :  // <0233> i = a+b
addr == 16'h7aa ? 16'h0b00 :  // <0233> "


addr == 16'h7ab ? 16'h0002 :  // <0233> a = i
addr == 16'h7ac ? 16'h060d :  // <0233> b = $num_tps_cells
addr == 16'h7ad ? 16'he005 :  // <0233> br lt :loop_1945
addr == 16'h7ae ? 16'h079a :  // <0233> "

// :end_1945 // = 0x07af
addr == 16'h7af ? 16'h0a00 :  // <0240> i = 0
// :loop_1967 // = 0x07b0

addr == 16'h7b0 ? 16'h0002 :  // <0234> a = i
addr == 16'h7b1 ? 16'h07a0 :  // <0235> b = :default_tps_enrich_thou
addr == 16'h7b2 ? 16'h0465 :  // <0235> "
addr == 16'h7b3 ? 16'hc800 :  // <0236> fetch b from a+b
addr == 16'h7b4 ? 16'hd300 :  // <0236> "
addr == 16'h7b5 ? 16'h07b0 :  // <0236> "
addr == 16'h7b6 ? 16'h0002 :  // <0237> a = i

addr == 16'h7b7 ? 16'h0351 :  // <0238> a = a<<1
addr == 16'h7b8 ? 16'h3001 :  // <0238> push b // push b
addr == 16'h7b9 ? 16'h06d0 :  // <0238> b = 208
addr == 16'h7ba ? 16'h5e00 :  // <0238> av_ad_hi = 0
addr == 16'h7bb ? 16'h6300 :  // <0238> av_ad_lo = ad0
addr == 16'h7bc ? 16'h540c :  // <0238> pop av_write_data // pop av_write_data



addr == 16'h7bd ? 16'h0002 :  // <0240> a = i
addr == 16'h7be ? 16'h0601 :  // <0240> b = 1
addr == 16'h7bf ? 16'hc800 :  // <0240> i = a+b
addr == 16'h7c0 ? 16'h0b00 :  // <0240> "


addr == 16'h7c1 ? 16'h0002 :  // <0240> a = i
addr == 16'h7c2 ? 16'h0605 :  // <0240> b = $num_tps_states
addr == 16'h7c3 ? 16'he005 :  // <0240> br lt :loop_1967
addr == 16'h7c4 ? 16'h07b0 :  // <0240> "

// :end_1967 // = 0x07c5

// power up FTDI USB board, and init any other special board control functions.
addr == 16'h7c5 ? 16'h7280 :  // <0243> board_ctrl = $ftdi_power_mask
addr == 16'h7c6 ? 16'hfba0 :  // <0244> callx postpone_comm_restart
addr == 16'h7c7 ? 16'h0af5 :  // <0244> "
addr == 16'h7c8 ? 16'hfc00 :  // <0244> "

// check initial state of power management circuits.
// if power is lost or ignition switch is off already, open relay & abort run.
// that's important because then the event controller booted up too late to
// see edges on those 2 signals.  regular system would never shut itself down.
// this setup is the last thing done prior to the event handler loop.
addr == 16'h7c9 ? 16'h7a00 :  // <0251> power_duty = $power_duty_closing

addr == 16'h7ca ? 16'h001e :  // <0255> a = power_duty
addr == 16'h7cb ? 16'h06c0 :  // <0255> b = ( $power_lost_mask | $ign_switch_off_mask )

addr == 16'h7cc ? 16'he003 :  // <0252> br and0z :else_1996
addr == 16'h7cd ? 16'h07d3 :  // <0252> "

addr == 16'h7ce ? 16'h7a32 :  // <0253> power_duty = $power_duty_opening
addr == 16'h7cf ? 16'h6fa0 :  // <0254> error_halt_code $err_power_lost_at_boot // leds = 0xfffb
addr == 16'h7d0 ? 16'hfffb :  // <0254> "
addr == 16'h7d1 ? 16'he00f :  // <0254> error_halt_code $err_power_lost_at_boot
addr == 16'h7d2 ? 16'h07d1 :  // <0254> "

addr == 16'h7d3 ? 16'h5e00 :  // <0256> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h7d4 ? 16'h623c :  // <0256> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 60
addr == 16'h7d5 ? 16'h5760 :  // <0256> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h7d6 ? 16'h5e00 :  // <0257> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_hi = 0
addr == 16'h7d7 ? 16'h623e :  // <0257> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_lo = 62
addr == 16'h7d8 ? 16'h5602 :  // <0257> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_write_data = 2

// start handling events.
addr == 16'h7d9 ? 16'h3ba0 :  // <0260> soft_event = $event_controller_reset_mask
addr == 16'h7da ? 16'h8000 :  // <0260> "
addr == 16'h7db ? 16'h3a00 :  // <0261> soft_event = 0
addr == 16'h7dc ? 16'h47a0 :  // <0262> mstimer0 = 1000
addr == 16'h7dd ? 16'h03e8 :  // <0262> "
addr == 16'h7de ? 16'h4e14 :  // <0263> mstimer2 = $plan_tick_ms
addr == 16'h7df ? 16'he00f :  // <0264> jmp :poll_events
addr == 16'h7e0 ? 16'h008e :  // <0264> "

// event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.
// event 0 not used in this app anyway.
// :event_table // = 0x07e1
addr == 16'h7e1 ? 16'h008e :  // <0269> ([label :poll_events])
addr == 16'h7e2 ? 16'h0a50 :  // <0270> ([label :power_lost_handler])
addr == 16'h7e3 ? 16'h07f6 :  // <0271> ([label :ign_capture_handler])
addr == 16'h7e4 ? 16'h0876 :  // <0272> ([label :ign_capture_timeout_handler])
addr == 16'h7e5 ? 16'h0a84 :  // <0273> ([label :puff1_done_handler])
addr == 16'h7e6 ? 16'h087b :  // <0274> ([label :ustimer0_handler])
addr == 16'h7e7 ? 16'h09db :  // <0275> ([label :spi_done_handler])
addr == 16'h7e8 ? 16'h087d :  // <0276> ([label :mstimer0_handler])
addr == 16'h7e9 ? 16'h09a7 :  // <0277> ([label :mstimer1_handler])
addr == 16'h7ea ? 16'h08ac :  // <0278> ([label :mstimer2_handler])
addr == 16'h7eb ? 16'h08d8 :  // <0279> ([label :uart_rx_handler])
addr == 16'h7ec ? 16'h08f1 :  // <0280> ([label :uart_rx_overflow_handler])
addr == 16'h7ed ? 16'h08f9 :  // <0281> ([label :uart_tx_overflow_handler])
addr == 16'h7ee ? 16'h0900 :  // <0282> ([label :key0_handler])
addr == 16'h7ef ? 16'h090a :  // <0283> ([label :key1_handler])
addr == 16'h7f0 ? 16'h0a67 :  // <0284> ([label :ign_switch_off_handler])
addr == 16'h7f1 ? 16'h0a7a :  // <0285> ([label :ign_switch_on_handler])
addr == 16'h7f2 ? 16'h0914 :  // <0286> ([label :softevent3_handler])
addr == 16'h7f3 ? 16'h0916 :  // <0287> ([label :softevent2_handler])
addr == 16'h7f4 ? 16'h0918 :  // <0288> ([label :softevent1_handler])
addr == 16'h7f5 ? 16'h091a :  // <0289> ([label :softevent0_handler])

// #########################################################################

// ######## event ign_capture_handler // = 0x07f6
// discard outlier time.
addr == 16'h7f6 ? 16'h181f :  // <0295> g6 = ign_capture_jf
addr == 16'h7f7 ? 16'h5e00 :  // <0296> ram b = $ram_ign_fastest_jf // av_ad_hi = 0
addr == 16'h7f8 ? 16'h6282 :  // <0296> ram b = $ram_ign_fastest_jf // av_ad_lo = 130
addr == 16'h7f9 ? 16'h0415 :  // <0296> ram b = $ram_ign_fastest_jf // b = av_write_data // start read cycle
addr == 16'h7fa ? 16'h0416 :  // <0296> ram b = $ram_ign_fastest_jf // b = av_read_data // finish read cycle

addr == 16'h7fb ? 16'h0006 :  // <0299> a = g6
addr == 16'h7fc ? 16'h0401 :  // <0299> b = b

addr == 16'h7fd ? 16'he405 :  // <0297> bn lt :else_2045
addr == 16'h7fe ? 16'h0800 :  // <0297> "

addr == 16'h7ff ? 16'h1a00 :  // <0298> g6 = 0

addr == 16'h800 ? 16'h5e00 :  // <0300> ram b = $ram_ign_slowest_jf // av_ad_hi = 0
addr == 16'h801 ? 16'h6284 :  // <0300> ram b = $ram_ign_slowest_jf // av_ad_lo = 132
addr == 16'h802 ? 16'h0415 :  // <0300> ram b = $ram_ign_slowest_jf // b = av_write_data // start read cycle
addr == 16'h803 ? 16'h0416 :  // <0300> ram b = $ram_ign_slowest_jf // b = av_read_data // finish read cycle

addr == 16'h804 ? 16'h0006 :  // <0303> a = g6
addr == 16'h805 ? 16'h0401 :  // <0303> b = b

addr == 16'h806 ? 16'he406 :  // <0301> bn gt :else_2054
addr == 16'h807 ? 16'h0809 :  // <0301> "

addr == 16'h808 ? 16'h1a00 :  // <0302> g6 = 0


// increment buffer index and memorize time.
addr == 16'h809 ? 16'h5e00 :  // <0306> ram a = $ram_ign_history_idx // av_ad_hi = 0
addr == 16'h80a ? 16'h6258 :  // <0306> ram a = $ram_ign_history_idx // av_ad_lo = 88
addr == 16'h80b ? 16'h0015 :  // <0306> ram a = $ram_ign_history_idx // a = av_write_data // start read cycle
addr == 16'h80c ? 16'h0016 :  // <0306> ram a = $ram_ign_history_idx // a = av_read_data // finish read cycle
addr == 16'h80d ? 16'h0601 :  // <0307> b = 1
addr == 16'h80e ? 16'hc800 :  // <0308> a = a+b
addr == 16'h80f ? 16'h0300 :  // <0308> "
addr == 16'h810 ? 16'h060f :  // <0309> b = $ign_history_idx_mask
addr == 16'h811 ? 16'hc800 :  // <0310> a = and
addr == 16'h812 ? 16'h0330 :  // <0310> "
addr == 16'h813 ? 16'h5e00 :  // <0311> ram $ram_ign_history_idx = a // av_ad_hi = 0
addr == 16'h814 ? 16'h6258 :  // <0311> ram $ram_ign_history_idx = a // av_ad_lo = 88
addr == 16'h815 ? 16'h5400 :  // <0311> ram $ram_ign_history_idx = a // av_write_data = a
addr == 16'h816 ? 16'h0406 :  // <0312> b = g6

addr == 16'h817 ? 16'h0351 :  // <0313> a = a<<1
addr == 16'h818 ? 16'h3001 :  // <0313> push b // push b
addr == 16'h819 ? 16'h065a :  // <0313> b = 90
addr == 16'h81a ? 16'h5e00 :  // <0313> av_ad_hi = 0
addr == 16'h81b ? 16'h6300 :  // <0313> av_ad_lo = ad0
addr == 16'h81c ? 16'h540c :  // <0313> pop av_write_data // pop av_write_data


// ////////// compute new jiffy estimate.
// average entire history.
// x = total, y = sample, i = index = loop count, g6 = count of invalid samples.
addr == 16'h81d ? 16'h1200 :  // <0318> x = 0
addr == 16'h81e ? 16'h1a00 :  // <0319> g6 = 0
addr == 16'h81f ? 16'h0a00 :  // <0335> i = 0
// :loop_2079 // = 0x0820

addr == 16'h820 ? 16'h0002 :  // <0320> a = i

addr == 16'h821 ? 16'h0351 :  // <0321> a = a<<1
addr == 16'h822 ? 16'h065a :  // <0321> b = 90
addr == 16'h823 ? 16'h5e00 :  // <0321> av_ad_hi = 0
addr == 16'h824 ? 16'h6300 :  // <0321> av_ad_lo = ad0
addr == 16'h825 ? 16'h0415 :  // <0321> b = av_write_data
addr == 16'h826 ? 16'h0416 :  // <0321> b = av_read_data

addr == 16'h827 ? 16'h1401 :  // <0322> y = b

addr == 16'h828 ? 16'h0005 :  // <0333> a = y
addr == 16'h829 ? 16'h0600 :  // <0333> b = 0

addr == 16'h82a ? 16'he407 :  // <0323> bn eq :else_2090
addr == 16'h82b ? 16'h0832 :  // <0323> "

addr == 16'h82c ? 16'h0006 :  // <0324> a = g6
addr == 16'h82d ? 16'h0601 :  // <0325> b = 1
addr == 16'h82e ? 16'hc800 :  // <0326> g6 = a+b
addr == 16'h82f ? 16'h1b00 :  // <0326> "

addr == 16'h830 ? 16'he00f :  // <0328> jmp :end_2090
addr == 16'h831 ? 16'h0839 :  // <0328> "

addr == 16'h832 ? 16'h0208 :  // <0329> a = ($ign_history_len / 2)
addr == 16'h833 ? 16'h0405 :  // <0330> b = y
addr == 16'h834 ? 16'hc800 :  // <0331> a = a+b
addr == 16'h835 ? 16'h0300 :  // <0331> "
addr == 16'h836 ? 16'h1753 :  // <0332> y = a>>$ign_history_idx_bits
addr == 16'h837 ? 16'hc800 :  // <0333> x = x+y
addr == 16'h838 ? 16'h1320 :  // <0333> "



addr == 16'h839 ? 16'h0002 :  // <0335> a = i
addr == 16'h83a ? 16'h0601 :  // <0335> b = 1
addr == 16'h83b ? 16'hc800 :  // <0335> i = a+b
addr == 16'h83c ? 16'h0b00 :  // <0335> "


addr == 16'h83d ? 16'h0002 :  // <0335> a = i
addr == 16'h83e ? 16'h0610 :  // <0335> b = $ign_history_len
addr == 16'h83f ? 16'he005 :  // <0335> br lt :loop_2079
addr == 16'h840 ? 16'h0820 :  // <0335> "

// :end_2079 // = 0x0841
addr == 16'h841 ? 16'h5e00 :  // <0336> ram $ram_ign_avg_jf = x // av_ad_hi = 0
addr == 16'h842 ? 16'h627a :  // <0336> ram $ram_ign_avg_jf = x // av_ad_lo = 122
addr == 16'h843 ? 16'h5404 :  // <0336> ram $ram_ign_avg_jf = x // av_write_data = x
addr == 16'h844 ? 16'h5e00 :  // <0337> ram $ram_ign_bad_samples = g6 // av_ad_hi = 0
addr == 16'h845 ? 16'h6280 :  // <0337> ram $ram_ign_bad_samples = g6 // av_ad_lo = 128
addr == 16'h846 ? 16'h5406 :  // <0337> ram $ram_ign_bad_samples = g6 // av_write_data = g6
//patch: dividing before summing (instead of after) is much simpler and faster because it prevents overflow.
// but it means we could be reading as much as 16 jf too low (16 = ign_history_len).
// that error is way less than 1 RPM on the slow end,
// or about 1,000 RPM too fast on the fast end!
// might need to tighten that up.  one simple way might be adding ign_history_len / 2 to each history record prior to dividing.
// that didn't seem to help much in simple testing.
// probly because jf_to_rpm has only 32 RPM resolution.


addr == 16'h847 ? 16'h0006 :  // <0353> a = g6
addr == 16'h848 ? 16'h0604 :  // <0353> b = ( $ign_history_len / 4 )

addr == 16'h849 ? 16'he406 :  // <0346> bn gt :else_2121
addr == 16'h84a ? 16'h0850 :  // <0346> "

addr == 16'h84b ? 16'h5e00 :  // <0347> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h84c ? 16'h627e :  // <0347> ram $ram_rpm_valid = 0 // av_ad_lo = 126
addr == 16'h84d ? 16'h5600 :  // <0347> ram $ram_rpm_valid = 0 // av_write_data = 0

addr == 16'h84e ? 16'he00f :  // <0349> jmp :end_2121
addr == 16'h84f ? 16'h085a :  // <0349> "

// convert jiffies b to new RPM estimate.
addr == 16'h850 ? 16'h2004 :  // <0351> pa = x
addr == 16'h851 ? 16'hfba0 :  // <0351> callx  jf_to_rpm  x  pa
addr == 16'h852 ? 16'h0c4e :  // <0351> "
addr == 16'h853 ? 16'hfc00 :  // <0351> "
addr == 16'h854 ? 16'h5e00 :  // <0352> ram $ram_avg_rpm = pa // av_ad_hi = 0
addr == 16'h855 ? 16'h627c :  // <0352> ram $ram_avg_rpm = pa // av_ad_lo = 124
addr == 16'h856 ? 16'h5408 :  // <0352> ram $ram_avg_rpm = pa // av_write_data = pa
addr == 16'h857 ? 16'h5e00 :  // <0353> ram $ram_rpm_valid = 1 // av_ad_hi = 0
addr == 16'h858 ? 16'h627e :  // <0353> ram $ram_rpm_valid = 1 // av_ad_lo = 126
addr == 16'h859 ? 16'h5601 :  // <0353> ram $ram_rpm_valid = 1 // av_write_data = 1

addr == 16'h85a ? 16'he00f :  // <0354> end_event
addr == 16'h85b ? 16'h008e :  // <0354> "

// ######## func clear_ign_history // = 0x085c
addr == 16'h85c ? 16'h3002 :  // <0367> push i // func clear_ign_history

// invalidate the RPM estimate.
addr == 16'h85d ? 16'h5e00 :  // <0358> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h85e ? 16'h627e :  // <0358> ram $ram_rpm_valid = 0 // av_ad_lo = 126
addr == 16'h85f ? 16'h5600 :  // <0358> ram $ram_rpm_valid = 0 // av_write_data = 0
// the last known RPM estimate is retained here, not cleared.
// clear the history so it won't be valid again until several more valid samples are collected.
addr == 16'h860 ? 16'h5e00 :  // <0361> ram $ram_ign_bad_samples = $ign_history_len // av_ad_hi = 0
addr == 16'h861 ? 16'h6280 :  // <0361> ram $ram_ign_bad_samples = $ign_history_len // av_ad_lo = 128
addr == 16'h862 ? 16'h5610 :  // <0361> ram $ram_ign_bad_samples = $ign_history_len // av_write_data = 16
addr == 16'h863 ? 16'h0a00 :  // <0366> i = 0
// :loop_2147 // = 0x0864

addr == 16'h864 ? 16'h0002 :  // <0362> a = i
addr == 16'h865 ? 16'h0600 :  // <0363> b = 0

addr == 16'h866 ? 16'h0351 :  // <0364> a = a<<1
addr == 16'h867 ? 16'h3001 :  // <0364> push b // push b
addr == 16'h868 ? 16'h065a :  // <0364> b = 90
addr == 16'h869 ? 16'h5e00 :  // <0364> av_ad_hi = 0
addr == 16'h86a ? 16'h6300 :  // <0364> av_ad_lo = ad0
addr == 16'h86b ? 16'h540c :  // <0364> pop av_write_data // pop av_write_data



addr == 16'h86c ? 16'h0002 :  // <0366> a = i
addr == 16'h86d ? 16'h0601 :  // <0366> b = 1
addr == 16'h86e ? 16'hc800 :  // <0366> i = a+b
addr == 16'h86f ? 16'h0b00 :  // <0366> "


addr == 16'h870 ? 16'h0002 :  // <0366> a = i
addr == 16'h871 ? 16'h0610 :  // <0366> b = $ign_history_len
addr == 16'h872 ? 16'he005 :  // <0366> br lt :loop_2147
addr == 16'h873 ? 16'h0864 :  // <0366> "

// :end_2147 // = 0x0874

addr == 16'h874 ? 16'h080c :  // <0368> pop i // func clear_ign_history
addr == 16'h875 ? 16'hfc00 :  // <0368> swapra = nop

// ######## event ign_capture_timeout_handler // = 0x0876
// it's been too long since the last ignition pulse detect.
addr == 16'h876 ? 16'hfba0 :  // <0371> callx clear_ign_history
addr == 16'h877 ? 16'h085c :  // <0371> "
addr == 16'h878 ? 16'hfc00 :  // <0371> "
addr == 16'h879 ? 16'he00f :  // <0372> end_event
addr == 16'h87a ? 16'h008e :  // <0372> "

// ######## event ustimer0_handler // = 0x087b
addr == 16'h87b ? 16'he00f :  // <0375> end_event
addr == 16'h87c ? 16'h008e :  // <0375> "

// ######## event mstimer0_handler // = 0x087d
// unified 1-second periodic timer for all low-resolution tasks.

// start timer again.
addr == 16'h87d ? 16'h47a0 :  // <0381> mstimer0 = 1000
addr == 16'h87e ? 16'h03e8 :  // <0381> "

// realtime counters in RAM.
addr == 16'h87f ? 16'h5e00 :  // <0384> ram a = $ram_seconds_cnt // av_ad_hi = 0
addr == 16'h880 ? 16'h6242 :  // <0384> ram a = $ram_seconds_cnt // av_ad_lo = 66
addr == 16'h881 ? 16'h0015 :  // <0384> ram a = $ram_seconds_cnt // a = av_write_data // start read cycle
addr == 16'h882 ? 16'h0016 :  // <0384> ram a = $ram_seconds_cnt // a = av_read_data // finish read cycle
addr == 16'h883 ? 16'h0601 :  // <0385> b = 1
addr == 16'h884 ? 16'hc800 :  // <0386> a = a+b
addr == 16'h885 ? 16'h0300 :  // <0386> "

addr == 16'h886 ? 16'h0000 :  // <0395> a = a
addr == 16'h887 ? 16'h063c :  // <0395> b = 60

addr == 16'h888 ? 16'he407 :  // <0387> bn eq :else_2184
addr == 16'h889 ? 16'h089b :  // <0387> "

addr == 16'h88a ? 16'h5e00 :  // <0388> ram $ram_seconds_cnt = 0 // av_ad_hi = 0
addr == 16'h88b ? 16'h6242 :  // <0388> ram $ram_seconds_cnt = 0 // av_ad_lo = 66
addr == 16'h88c ? 16'h5600 :  // <0388> ram $ram_seconds_cnt = 0 // av_write_data = 0
addr == 16'h88d ? 16'h5e00 :  // <0389> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h88e ? 16'h6240 :  // <0389> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'h88f ? 16'h0015 :  // <0389> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h890 ? 16'h0016 :  // <0389> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h891 ? 16'h0601 :  // <0390> b = 1
addr == 16'h892 ? 16'h5e00 :  // <0391> ram $ram_minutes_cnt = a+b // av_ad_hi = 0
addr == 16'h893 ? 16'h6240 :  // <0391> ram $ram_minutes_cnt = a+b // av_ad_lo = 64
addr == 16'h894 ? 16'hc800 :  // <0391> ram $ram_minutes_cnt = a+b // av_write_data = a+b
addr == 16'h895 ? 16'h5700 :  // <0391> "
addr == 16'h896 ? 16'hfba0 :  // <0392> callx minute_events
addr == 16'h897 ? 16'h0a93 :  // <0392> "
addr == 16'h898 ? 16'hfc00 :  // <0392> "

addr == 16'h899 ? 16'he00f :  // <0394> jmp :end_2184
addr == 16'h89a ? 16'h089e :  // <0394> "

addr == 16'h89b ? 16'h5e00 :  // <0395> ram $ram_seconds_cnt = a // av_ad_hi = 0
addr == 16'h89c ? 16'h6242 :  // <0395> ram $ram_seconds_cnt = a // av_ad_lo = 66
addr == 16'h89d ? 16'h5400 :  // <0395> ram $ram_seconds_cnt = a // av_write_data = a


// all 1-second functions here.
addr == 16'h89e ? 16'hfba0 :  // <0398> callx check_power_relay
addr == 16'h89f ? 16'h0a9b :  // <0398> "
addr == 16'h8a0 ? 16'hfc00 :  // <0398> "
addr == 16'h8a1 ? 16'hfba0 :  // <0399> callx check_communication
addr == 16'h8a2 ? 16'h0ac8 :  // <0399> "
addr == 16'h8a3 ? 16'hfc00 :  // <0399> "
addr == 16'h8a4 ? 16'hfba0 :  // <0400> callx start_daq_pass
addr == 16'h8a5 ? 16'h0929 :  // <0400> "
addr == 16'h8a6 ? 16'hfc00 :  // <0400> "
addr == 16'h8a7 ? 16'he00f :  // <0401> end_event
addr == 16'h8a8 ? 16'h008e :  // <0401> "

// :plan_transition_msg // = 0x08a9
// "PLAN\x0"
addr == 16'h8a9 ? 16'h4c50 :  // <0404> LP
addr == 16'h8aa ? 16'h4e41 :  // <0404> NA
addr == 16'h8ab ? 16'h0000 :  // <0404>   

// ######## event mstimer2_handler // = 0x08ac
// engine management plan tick timer.

// restart timer.
addr == 16'h8ac ? 16'h4e14 :  // <0410> mstimer2 = $plan_tick_ms

// start another TPS reading prior to every plan tick.
// this will also invoke a o2 reading.  that's done last of all prior to plan_tick,
// so there's minimal latency between that and the plan_tick utilizing it.
addr == 16'h8ad ? 16'h5e00 :  // <0415> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h8ae ? 16'h6236 :  // <0415> ram a = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'h8af ? 16'h0015 :  // <0415> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h8b0 ? 16'h0016 :  // <0415> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle

addr == 16'h8b1 ? 16'h0000 :  // <0418> a = a
addr == 16'h8b2 ? 16'h0600 :  // <0418> b = 0

addr == 16'h8b3 ? 16'he407 :  // <0416> bn eq :else_2227
addr == 16'h8b4 ? 16'h08b9 :  // <0416> "

addr == 16'h8b5 ? 16'h2206 :  // <0417> pa = 6
addr == 16'h8b6 ? 16'hfba0 :  // <0417> callx  begin_adc_conversion  $tps_adc_channel
addr == 16'h8b7 ? 16'h09cd :  // <0417> "
addr == 16'h8b8 ? 16'hfc00 :  // <0417> "

addr == 16'h8b9 ? 16'he00f :  // <0419> end_event
addr == 16'h8ba ? 16'h008e :  // <0419> "

// ######## func plan_tick // = 0x08bb
addr == 16'h8bb ? 16'h3004 :  // <0436> push x // func plan_tick
addr == 16'h8bc ? 16'h303e :  // <0436> push rtna // "

// poll the engine management plan.
// call the transition function for the current plan.
// this might perform a transition to some other plan, so it's done first.
addr == 16'h8bd ? 16'h5e00 :  // <0425> ram rtna = $ram_transition_func // av_ad_hi = 0
addr == 16'h8be ? 16'h628c :  // <0425> ram rtna = $ram_transition_func // av_ad_lo = 140
addr == 16'h8bf ? 16'hf815 :  // <0425> ram rtna = $ram_transition_func // rtna = av_write_data // start read cycle
addr == 16'h8c0 ? 16'hf816 :  // <0425> ram rtna = $ram_transition_func // rtna = av_read_data // finish read cycle
addr == 16'h8c1 ? 16'h103e :  // <0426> x = rtna
addr == 16'h8c2 ? 16'hfc00 :  // <0427> swapra = nop
addr == 16'h8c3 ? 16'h5e00 :  // <0429> ram b = $ram_transition_func // av_ad_hi = 0
addr == 16'h8c4 ? 16'h628c :  // <0429> ram b = $ram_transition_func // av_ad_lo = 140
addr == 16'h8c5 ? 16'h0415 :  // <0429> ram b = $ram_transition_func // b = av_write_data // start read cycle
addr == 16'h8c6 ? 16'h0416 :  // <0429> ram b = $ram_transition_func // b = av_read_data // finish read cycle

addr == 16'h8c7 ? 16'h0004 :  // <0432> a = x
addr == 16'h8c8 ? 16'h0401 :  // <0432> b = b

addr == 16'h8c9 ? 16'he007 :  // <0430> br eq :else_2249
addr == 16'h8ca ? 16'h08d0 :  // <0430> "

addr == 16'h8cb ? 16'h23a0 :  // <0431> pa = :plan_transition_msg
addr == 16'h8cc ? 16'h08a9 :  // <0431> "
addr == 16'h8cd ? 16'hfba0 :  // <0431> callx  set_text_flag  :plan_transition_msg
addr == 16'h8ce ? 16'h0b26 :  // <0431> "
addr == 16'h8cf ? 16'hfc00 :  // <0431> "

// call the puff length function for the current plan.
// this is done last, so if a plan transition just happened, its new puff length will init here.
addr == 16'h8d0 ? 16'h5e00 :  // <0435> ram rtna = $ram_puff_len_func // av_ad_hi = 0
addr == 16'h8d1 ? 16'h628a :  // <0435> ram rtna = $ram_puff_len_func // av_ad_lo = 138
addr == 16'h8d2 ? 16'hf815 :  // <0435> ram rtna = $ram_puff_len_func // rtna = av_write_data // start read cycle
addr == 16'h8d3 ? 16'hf816 :  // <0435> ram rtna = $ram_puff_len_func // rtna = av_read_data // finish read cycle
addr == 16'h8d4 ? 16'hfc00 :  // <0436> swapra = nop

addr == 16'h8d5 ? 16'hf80c :  // <0439> pop rtna // func plan_tick
addr == 16'h8d6 ? 16'h100c :  // <0439> pop x // "
addr == 16'h8d7 ? 16'hfc00 :  // <0439> swapra = nop

// ######## event uart_rx_handler // = 0x08d8
// :again // = 0x08d8
addr == 16'h8d8 ? 16'hfba0 :  // <0442> pollchar
addr == 16'h8d9 ? 16'h00aa :  // <0442> "
addr == 16'h8da ? 16'hfc00 :  // <0442> "
addr == 16'h8db ? 16'h1000 :  // <0443> x = a

addr == 16'h8dc ? 16'h0004 :  // <0446> a = x
addr == 16'h8dd ? 16'h0760 :  // <0446> b = -1

addr == 16'h8de ? 16'he407 :  // <0444> bn eq :else_2270
addr == 16'h8df ? 16'h08e2 :  // <0444> "

addr == 16'h8e0 ? 16'he00f :  // <0445> event_return
addr == 16'h8e1 ? 16'h008e :  // <0445> "


addr == 16'h8e2 ? 16'h0004 :  // <0449> a = x
addr == 16'h8e3 ? 16'h060a :  // <0449> b = 10

addr == 16'h8e4 ? 16'he407 :  // <0447> bn eq :else_2276
addr == 16'h8e5 ? 16'h08e9 :  // <0447> "

addr == 16'h8e6 ? 16'hfba0 :  // <0448> callx  postpone_comm_restart
addr == 16'h8e7 ? 16'h0af5 :  // <0448> "
addr == 16'h8e8 ? 16'hfc00 :  // <0448> "

addr == 16'h8e9 ? 16'h2004 :  // <0450> pa = x
addr == 16'h8ea ? 16'hfba0 :  // <0450> callx  parse_key  x
addr == 16'h8eb ? 16'h026e :  // <0450> "
addr == 16'h8ec ? 16'hfc00 :  // <0450> "
addr == 16'h8ed ? 16'he00f :  // <0451> jmp :again
addr == 16'h8ee ? 16'h08d8 :  // <0451> "
addr == 16'h8ef ? 16'he00f :  // <0452> end_event
addr == 16'h8f0 ? 16'h008e :  // <0452> "

// ######## event uart_rx_overflow_handler // = 0x08f1
addr == 16'h8f1 ? 16'h6fa0 :  // <0455> error_halt_code $err_rx_overflow // leds = 0xfffe
addr == 16'h8f2 ? 16'hfffe :  // <0455> "
addr == 16'h8f3 ? 16'he00f :  // <0455> error_halt_code $err_rx_overflow
addr == 16'h8f4 ? 16'h08f3 :  // <0455> "
addr == 16'h8f5 ? 16'he00f :  // <0456> end_event
addr == 16'h8f6 ? 16'h008e :  // <0456> "

// :tx_overflow_msg // = 0x08f7
// "TXO\x0"
addr == 16'h8f7 ? 16'h5854 :  // <0459> XT
addr == 16'h8f8 ? 16'h004f :  // <0459>  O

// ######## event uart_tx_overflow_handler // = 0x08f9
// error_halt_code $err_tx_overflow
addr == 16'h8f9 ? 16'h23a0 :  // <0463> pa = :tx_overflow_msg
addr == 16'h8fa ? 16'h08f7 :  // <0463> "
addr == 16'h8fb ? 16'hfba0 :  // <0463> callx  set_text_flag  :tx_overflow_msg
addr == 16'h8fc ? 16'h0b26 :  // <0463> "
addr == 16'h8fd ? 16'hfc00 :  // <0463> "
addr == 16'h8fe ? 16'he00f :  // <0464> end_event
addr == 16'h8ff ? 16'h008e :  // <0464> "

// ######## event key0_handler // = 0x0900
addr == 16'h900 ? 16'h026b :  // <0467> a = 107 // putasc "k"
addr == 16'h901 ? 16'hfba0 :  // <0467> putasc "k"
addr == 16'h902 ? 16'h009b :  // <0467> "
addr == 16'h903 ? 16'hfc00 :  // <0467> "
addr == 16'h904 ? 16'h0230 :  // <0468> a = 48 // putasc "0"
addr == 16'h905 ? 16'hfba0 :  // <0468> putasc "0"
addr == 16'h906 ? 16'h009b :  // <0468> "
addr == 16'h907 ? 16'hfc00 :  // <0468> "
addr == 16'h908 ? 16'he00f :  // <0469> end_event
addr == 16'h909 ? 16'h008e :  // <0469> "

// ######## event key1_handler // = 0x090a
addr == 16'h90a ? 16'h026b :  // <0472> a = 107 // putasc "k"
addr == 16'h90b ? 16'hfba0 :  // <0472> putasc "k"
addr == 16'h90c ? 16'h009b :  // <0472> "
addr == 16'h90d ? 16'hfc00 :  // <0472> "
addr == 16'h90e ? 16'h0231 :  // <0473> a = 49 // putasc "1"
addr == 16'h90f ? 16'hfba0 :  // <0473> putasc "1"
addr == 16'h910 ? 16'h009b :  // <0473> "
addr == 16'h911 ? 16'hfc00 :  // <0473> "
addr == 16'h912 ? 16'he00f :  // <0474> end_event
addr == 16'h913 ? 16'h008e :  // <0474> "

// ######## event softevent3_handler // = 0x0914
addr == 16'h914 ? 16'he00f :  // <0477> end_event
addr == 16'h915 ? 16'h008e :  // <0477> "

// ######## event softevent2_handler // = 0x0916
addr == 16'h916 ? 16'he00f :  // <0480> end_event
addr == 16'h917 ? 16'h008e :  // <0480> "

// ######## event softevent1_handler // = 0x0918
addr == 16'h918 ? 16'he00f :  // <0483> end_event
addr == 16'h919 ? 16'h008e :  // <0483> "

// ######## event softevent0_handler // = 0x091a
addr == 16'h91a ? 16'he00f :  // <0486> end_event
addr == 16'h91b ? 16'h008e :  // <0486> "

// :rpm_msg // = 0x091c
// ": rpm=\x0"
addr == 16'h91c ? 16'h203a :  // <0489>  :
addr == 16'h91d ? 16'h7072 :  // <0489> pr
addr == 16'h91e ? 16'h3d6d :  // <0489> =m
addr == 16'h91f ? 16'h0000 :  // <0489>   

// :puff_len_msg // = 0x0920
// " pfl=\x0"
addr == 16'h920 ? 16'h7020 :  // <0492> p 
addr == 16'h921 ? 16'h6c66 :  // <0492> lf
addr == 16'h922 ? 16'h003d :  // <0492>  =

// :o2_msg // = 0x0923
// " o2=\x0"
addr == 16'h923 ? 16'h6f20 :  // <0495> o 
addr == 16'h924 ? 16'h3d32 :  // <0495> =2
addr == 16'h925 ? 16'h0000 :  // <0495>   

// :tps_msg // = 0x0926
// " tp=\x0"
addr == 16'h926 ? 16'h7420 :  // <0498> t 
addr == 16'h927 ? 16'h3d70 :  // <0498> =p
addr == 16'h928 ? 16'h0000 :  // <0498>   

// ######## func start_daq_pass // = 0x0929
addr == 16'h929 ? 16'h3004 :  // <0555> push x // func start_daq_pass
addr == 16'h92a ? 16'h303e :  // <0555> push rtna // "

// daq pass counter in RAM.
addr == 16'h92b ? 16'h5e00 :  // <0502> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h92c ? 16'h6214 :  // <0502> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h92d ? 16'h0015 :  // <0502> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h92e ? 16'h0016 :  // <0502> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h92f ? 16'h0601 :  // <0503> b = 1
addr == 16'h930 ? 16'hc800 :  // <0504> a = a+b
addr == 16'h931 ? 16'h0300 :  // <0504> "
addr == 16'h932 ? 16'h6c00 :  // <0505> leds = a
addr == 16'h933 ? 16'h5e00 :  // <0506> ram $ram_daq_pass_cnt = a // av_ad_hi = 0
addr == 16'h934 ? 16'h6214 :  // <0506> ram $ram_daq_pass_cnt = a // av_ad_lo = 20
addr == 16'h935 ? 16'h5400 :  // <0506> ram $ram_daq_pass_cnt = a // av_write_data = a
addr == 16'h936 ? 16'hfba0 :  // <0507> call :put4x
addr == 16'h937 ? 16'h00c3 :  // <0507> "
addr == 16'h938 ? 16'hfc00 :  // <0507> "

addr == 16'h939 ? 16'h03a0 :  // <0509> a = :rpm_msg
addr == 16'h93a ? 16'h091c :  // <0509> "
addr == 16'h93b ? 16'hfba0 :  // <0510> call :print_nt
addr == 16'h93c ? 16'h014f :  // <0510> "
addr == 16'h93d ? 16'hfc00 :  // <0510> "
addr == 16'h93e ? 16'h0200 :  // <0511> a = 0
addr == 16'h93f ? 16'h5e00 :  // <0512> ram x = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h940 ? 16'h627e :  // <0512> ram x = $ram_rpm_valid // av_ad_lo = 126
addr == 16'h941 ? 16'h1015 :  // <0512> ram x = $ram_rpm_valid // x = av_write_data // start read cycle
addr == 16'h942 ? 16'h1016 :  // <0512> ram x = $ram_rpm_valid // x = av_read_data // finish read cycle

addr == 16'h943 ? 16'h0004 :  // <0515> a = x
addr == 16'h944 ? 16'h0600 :  // <0515> b = 0

addr == 16'h945 ? 16'he007 :  // <0513> br eq :else_2373
addr == 16'h946 ? 16'h094b :  // <0513> "

addr == 16'h947 ? 16'h5e00 :  // <0514> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h948 ? 16'h627c :  // <0514> ram a = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h949 ? 16'h0015 :  // <0514> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h94a ? 16'h0016 :  // <0514> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle

addr == 16'h94b ? 16'hfba0 :  // <0516> call :put4x
addr == 16'h94c ? 16'h00c3 :  // <0516> "
addr == 16'h94d ? 16'hfc00 :  // <0516> "

addr == 16'h94e ? 16'h03a0 :  // <0518> a = :puff_len_msg
addr == 16'h94f ? 16'h0920 :  // <0518> "
addr == 16'h950 ? 16'hfba0 :  // <0519> call :print_nt
addr == 16'h951 ? 16'h014f :  // <0519> "
addr == 16'h952 ? 16'hfc00 :  // <0519> "
addr == 16'h953 ? 16'h0021 :  // <0520> a = puff_len_us
addr == 16'h954 ? 16'hfba0 :  // <0521> call :put4x
addr == 16'h955 ? 16'h00c3 :  // <0521> "
addr == 16'h956 ? 16'hfc00 :  // <0521> "
addr == 16'h957 ? 16'h022c :  // <0522> a = 44 // putasc ","
addr == 16'h958 ? 16'hfba0 :  // <0522> putasc ","
addr == 16'h959 ? 16'h009b :  // <0522> "
addr == 16'h95a ? 16'hfc00 :  // <0522> "
addr == 16'h95b ? 16'h5e00 :  // <0523> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h95c ? 16'h6292 :  // <0523> ram a = $ram_puff_count // av_ad_lo = 146
addr == 16'h95d ? 16'h0015 :  // <0523> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h95e ? 16'h0016 :  // <0523> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h95f ? 16'hfba0 :  // <0524> call :put4x
addr == 16'h960 ? 16'h00c3 :  // <0524> "
addr == 16'h961 ? 16'hfc00 :  // <0524> "

addr == 16'h962 ? 16'h03a0 :  // <0526> a = :o2_msg
addr == 16'h963 ? 16'h0923 :  // <0526> "
addr == 16'h964 ? 16'hfba0 :  // <0527> call :print_nt
addr == 16'h965 ? 16'h014f :  // <0527> "
addr == 16'h966 ? 16'hfc00 :  // <0527> "
addr == 16'h967 ? 16'h0205 :  // <0528> a = $o2_adc_channel

addr == 16'h968 ? 16'h0351 :  // <0529> a = a<<1
addr == 16'h969 ? 16'h0626 :  // <0529> b = 38
addr == 16'h96a ? 16'h5e00 :  // <0529> av_ad_hi = 0
addr == 16'h96b ? 16'h6300 :  // <0529> av_ad_lo = ad0
addr == 16'h96c ? 16'h0415 :  // <0529> b = av_write_data
addr == 16'h96d ? 16'h0416 :  // <0529> b = av_read_data

addr == 16'h96e ? 16'h0001 :  // <0530> a = b
addr == 16'h96f ? 16'hfba0 :  // <0531> call :put4x
addr == 16'h970 ? 16'h00c3 :  // <0531> "
addr == 16'h971 ? 16'hfc00 :  // <0531> "

addr == 16'h972 ? 16'h03a0 :  // <0533> a = :tps_msg
addr == 16'h973 ? 16'h0926 :  // <0533> "
addr == 16'h974 ? 16'hfba0 :  // <0534> call :print_nt
addr == 16'h975 ? 16'h014f :  // <0534> "
addr == 16'h976 ? 16'hfc00 :  // <0534> "
addr == 16'h977 ? 16'h0206 :  // <0535> a = $tps_adc_channel

addr == 16'h978 ? 16'h0351 :  // <0536> a = a<<1
addr == 16'h979 ? 16'h0626 :  // <0536> b = 38
addr == 16'h97a ? 16'h5e00 :  // <0536> av_ad_hi = 0
addr == 16'h97b ? 16'h6300 :  // <0536> av_ad_lo = ad0
addr == 16'h97c ? 16'h0415 :  // <0536> b = av_write_data
addr == 16'h97d ? 16'h0416 :  // <0536> b = av_read_data

addr == 16'h97e ? 16'h0001 :  // <0537> a = b
addr == 16'h97f ? 16'hfba0 :  // <0538> call :put4x
addr == 16'h980 ? 16'h00c3 :  // <0538> "
addr == 16'h981 ? 16'hfc00 :  // <0538> "
addr == 16'h982 ? 16'h022c :  // <0539> a = 44 // putasc ","
addr == 16'h983 ? 16'hfba0 :  // <0539> putasc ","
addr == 16'h984 ? 16'h009b :  // <0539> "
addr == 16'h985 ? 16'hfc00 :  // <0539> "
addr == 16'h986 ? 16'h5e00 :  // <0540> ram a = $ram_tps_avg // av_ad_hi = 0
addr == 16'h987 ? 16'h62da :  // <0540> ram a = $ram_tps_avg // av_ad_lo = 218
addr == 16'h988 ? 16'h0015 :  // <0540> ram a = $ram_tps_avg // a = av_write_data // start read cycle
addr == 16'h989 ? 16'h0016 :  // <0540> ram a = $ram_tps_avg // a = av_read_data // finish read cycle
addr == 16'h98a ? 16'hfba0 :  // <0541> call :put4x
addr == 16'h98b ? 16'h00c3 :  // <0541> "
addr == 16'h98c ? 16'hfc00 :  // <0541> "
addr == 16'h98d ? 16'h022c :  // <0542> a = 44 // putasc ","
addr == 16'h98e ? 16'hfba0 :  // <0542> putasc ","
addr == 16'h98f ? 16'h009b :  // <0542> "
addr == 16'h990 ? 16'hfc00 :  // <0542> "
addr == 16'h991 ? 16'h5e00 :  // <0543> ram a = $ram_tps_state // av_ad_hi = 0
addr == 16'h992 ? 16'h62ce :  // <0543> ram a = $ram_tps_state // av_ad_lo = 206
addr == 16'h993 ? 16'h0015 :  // <0543> ram a = $ram_tps_state // a = av_write_data // start read cycle
addr == 16'h994 ? 16'h0016 :  // <0543> ram a = $ram_tps_state // a = av_read_data // finish read cycle
addr == 16'h995 ? 16'h0630 :  // <0544> b = 48 // asc b = "0"
addr == 16'h996 ? 16'hc800 :  // <0545> a = a+b // putchar a+b
addr == 16'h997 ? 16'h0300 :  // <0545> "
addr == 16'h998 ? 16'hfba0 :  // <0545> putchar a+b
addr == 16'h999 ? 16'h009b :  // <0545> "
addr == 16'h99a ? 16'hfc00 :  // <0545> "

// start to acquire & report all anmux channels.
addr == 16'h99b ? 16'h0207 :  // <0548> a = ($anmux_num_channels - 1)
addr == 16'h99c ? 16'hfba0 :  // <0549> call :anmux_set_chn
addr == 16'h99d ? 16'h00b2 :  // <0549> "
addr == 16'h99e ? 16'hfc00 :  // <0549> "
addr == 16'h99f ? 16'h4a05 :  // <0550> mstimer1 = $anmux_settle_ms

// observe MCU utilization.  this RAM variable can be seen by the debugger.
addr == 16'h9a0 ? 16'h5e00 :  // <0553> ram $ram_mcu_usage_cnt = usage_count // av_ad_hi = 0
addr == 16'h9a1 ? 16'h6244 :  // <0553> ram $ram_mcu_usage_cnt = usage_count // av_ad_lo = 68
addr == 16'h9a2 ? 16'h540f :  // <0553> ram $ram_mcu_usage_cnt = usage_count // av_write_data = usage_count
addr == 16'h9a3 ? 16'h3e00 :  // <0554> usage_count = 0

addr == 16'h9a4 ? 16'hf80c :  // <0556> pop rtna // func start_daq_pass
addr == 16'h9a5 ? 16'h100c :  // <0556> pop x // "
addr == 16'h9a6 ? 16'hfc00 :  // <0556> swapra = nop

// ######## event mstimer1_handler // = 0x09a7
// anmux signal has settled.

addr == 16'h9a7 ? 16'h5e00 :  // <0560> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h9a8 ? 16'h6236 :  // <0560> ram a = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'h9a9 ? 16'h0015 :  // <0560> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h9aa ? 16'h0016 :  // <0560> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle

addr == 16'h9ab ? 16'h0000 :  // <0565> a = a
addr == 16'h9ac ? 16'h0600 :  // <0565> b = 0

addr == 16'h9ad ? 16'he007 :  // <0561> br eq :else_2477
addr == 16'h9ae ? 16'h09b2 :  // <0561> "

// ADC is busy right now.  wait a while & try again.
addr == 16'h9af ? 16'h4a02 :  // <0563> mstimer1 = $anmux_retry_ms
addr == 16'h9b0 ? 16'he00f :  // <0564> event_return
addr == 16'h9b1 ? 16'h008e :  // <0564> "


// start a reading from the current anmux channel.
addr == 16'h9b2 ? 16'h0220 :  // <0568> a = 32 // putasc " "
addr == 16'h9b3 ? 16'hfba0 :  // <0568> putasc " "
addr == 16'h9b4 ? 16'h009b :  // <0568> "
addr == 16'h9b5 ? 16'hfc00 :  // <0568> "
addr == 16'h9b6 ? 16'h0273 :  // <0569> a = 115 // putasc "s"
addr == 16'h9b7 ? 16'hfba0 :  // <0569> putasc "s"
addr == 16'h9b8 ? 16'h009b :  // <0569> "
addr == 16'h9b9 ? 16'hfc00 :  // <0569> "
addr == 16'h9ba ? 16'hfba0 :  // <0570> call :anmux_get_chn
addr == 16'h9bb ? 16'h00b6 :  // <0570> "
addr == 16'h9bc ? 16'hfc00 :  // <0570> "
addr == 16'h9bd ? 16'h0630 :  // <0571> b = 48 // asc b = "0"
addr == 16'h9be ? 16'hc800 :  // <0572> a = a+b // putchar a+b
addr == 16'h9bf ? 16'h0300 :  // <0572> "
addr == 16'h9c0 ? 16'hfba0 :  // <0572> putchar a+b
addr == 16'h9c1 ? 16'h009b :  // <0572> "
addr == 16'h9c2 ? 16'hfc00 :  // <0572> "
addr == 16'h9c3 ? 16'h023d :  // <0573> a = 61 // putasc "="
addr == 16'h9c4 ? 16'hfba0 :  // <0573> putasc "="
addr == 16'h9c5 ? 16'h009b :  // <0573> "
addr == 16'h9c6 ? 16'hfc00 :  // <0573> "
addr == 16'h9c7 ? 16'h2207 :  // <0574> pa = 7
addr == 16'h9c8 ? 16'hfba0 :  // <0574> callx  begin_adc_conversion  $anmux_adc_channel
addr == 16'h9c9 ? 16'h09cd :  // <0574> "
addr == 16'h9ca ? 16'hfc00 :  // <0574> "
addr == 16'h9cb ? 16'he00f :  // <0575> end_event
addr == 16'h9cc ? 16'h008e :  // <0575> "

// ######## func begin_adc_conversion // = 0x09cd

// begin SPI transaction, specifying Nano ADC channel to take effect NEXT
// conversion after this one.

addr == 16'h9cd ? 16'h5e00 :  // <0581> ram $ram_adc_chn_pending = next_channel // av_ad_hi = 0
addr == 16'h9ce ? 16'h6236 :  // <0581> ram $ram_adc_chn_pending = next_channel // av_ad_lo = 54
addr == 16'h9cf ? 16'h5408 :  // <0581> ram $ram_adc_chn_pending = next_channel // av_write_data = next_channel
addr == 16'h9d0 ? 16'h0008 :  // <0582> a = next_channel
addr == 16'h9d1 ? 16'h0352 :  // <0583> a = a<<4
addr == 16'h9d2 ? 16'h0352 :  // <0584> a = a<<4
addr == 16'h9d3 ? 16'h0351 :  // <0585> a = a<<1
addr == 16'h9d4 ? 16'h0351 :  // <0586> a = a<<1
addr == 16'h9d5 ? 16'h0351 :  // <0587> a = a<<1
addr == 16'h9d6 ? 16'h5000 :  // <0588> spi_data = a
addr == 16'h9d7 ? 16'h5e00 :  // <0589> ram $ram_adc_junk = 1 // av_ad_hi = 0
addr == 16'h9d8 ? 16'h6238 :  // <0589> ram $ram_adc_junk = 1 // av_ad_lo = 56
addr == 16'h9d9 ? 16'h5601 :  // <0589> ram $ram_adc_junk = 1 // av_write_data = 1

addr == 16'h9da ? 16'hfc00 :  // <0591> swapra = nop

// ######## event spi_done_handler // = 0x09db
// discard the results of the first SPI exchange with the ADC.  that's only for writing the channel num out to the ADC.
addr == 16'h9db ? 16'h5e00 :  // <0594> ram a = $ram_adc_junk // av_ad_hi = 0
addr == 16'h9dc ? 16'h6238 :  // <0594> ram a = $ram_adc_junk // av_ad_lo = 56
addr == 16'h9dd ? 16'h0015 :  // <0594> ram a = $ram_adc_junk // a = av_write_data // start read cycle
addr == 16'h9de ? 16'h0016 :  // <0594> ram a = $ram_adc_junk // a = av_read_data // finish read cycle

addr == 16'h9df ? 16'h0000 :  // <0606> a = a
addr == 16'h9e0 ? 16'h0600 :  // <0606> b = 0

addr == 16'h9e1 ? 16'he007 :  // <0595> br eq :else_2529
addr == 16'h9e2 ? 16'h09f2 :  // <0595> "

// start another SPI exchange to retrieve the actual reading.
addr == 16'h9e3 ? 16'h5e00 :  // <0597> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h9e4 ? 16'h6236 :  // <0597> ram a = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'h9e5 ? 16'h0015 :  // <0597> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h9e6 ? 16'h0016 :  // <0597> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle
addr == 16'h9e7 ? 16'h0352 :  // <0598> a = a<<4
addr == 16'h9e8 ? 16'h0352 :  // <0599> a = a<<4
addr == 16'h9e9 ? 16'h0351 :  // <0600> a = a<<1
addr == 16'h9ea ? 16'h0351 :  // <0601> a = a<<1
addr == 16'h9eb ? 16'h0351 :  // <0602> a = a<<1
addr == 16'h9ec ? 16'h5000 :  // <0603> spi_data = a
addr == 16'h9ed ? 16'h5e00 :  // <0604> ram $ram_adc_junk = 0 // av_ad_hi = 0
addr == 16'h9ee ? 16'h6238 :  // <0604> ram $ram_adc_junk = 0 // av_ad_lo = 56
addr == 16'h9ef ? 16'h5600 :  // <0604> ram $ram_adc_junk = 0 // av_write_data = 0
addr == 16'h9f0 ? 16'he00f :  // <0605> event_return
addr == 16'h9f1 ? 16'h008e :  // <0605> "


// memorize an actual ADC reading.
addr == 16'h9f2 ? 16'h5e00 :  // <0609> ram i = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h9f3 ? 16'h6236 :  // <0609> ram i = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'h9f4 ? 16'h0815 :  // <0609> ram i = $ram_adc_chn_pending // i = av_write_data // start read cycle
addr == 16'h9f5 ? 16'h0816 :  // <0609> ram i = $ram_adc_chn_pending // i = av_read_data // finish read cycle
addr == 16'h9f6 ? 16'h5e00 :  // <0610> ram $ram_adc_chn_pending = 0 // av_ad_hi = 0
addr == 16'h9f7 ? 16'h6236 :  // <0610> ram $ram_adc_chn_pending = 0 // av_ad_lo = 54
addr == 16'h9f8 ? 16'h5600 :  // <0610> ram $ram_adc_chn_pending = 0 // av_write_data = 0
addr == 16'h9f9 ? 16'h0002 :  // <0611> a = i
addr == 16'h9fa ? 16'h0414 :  // <0612> b = spi_data

addr == 16'h9fb ? 16'h0351 :  // <0613> a = a<<1
addr == 16'h9fc ? 16'h3001 :  // <0613> push b // push b
addr == 16'h9fd ? 16'h0626 :  // <0613> b = 38
addr == 16'h9fe ? 16'h5e00 :  // <0613> av_ad_hi = 0
addr == 16'h9ff ? 16'h6300 :  // <0613> av_ad_lo = ad0
addr == 16'ha00 ? 16'h540c :  // <0613> pop av_write_data // pop av_write_data


// react to ADC reading.

addr == 16'ha01 ? 16'h0002 :  // <0620> a = i
addr == 16'ha02 ? 16'h0606 :  // <0620> b = 6

addr == 16'ha03 ? 16'he407 :  // <0616> bn eq :else_2563
addr == 16'ha04 ? 16'h0a0e :  // <0616> "

addr == 16'ha05 ? 16'h2205 :  // <0617> pa = 5
addr == 16'ha06 ? 16'hfba0 :  // <0617> callx  begin_adc_conversion  $o2_adc_channel
addr == 16'ha07 ? 16'h09cd :  // <0617> "
addr == 16'ha08 ? 16'hfc00 :  // <0617> "
addr == 16'ha09 ? 16'hfba0 :  // <0618> callx  interpret_tps
addr == 16'ha0a ? 16'h0bab :  // <0618> "
addr == 16'ha0b ? 16'hfc00 :  // <0618> "
addr == 16'ha0c ? 16'he00f :  // <0619> event_return
addr == 16'ha0d ? 16'h008e :  // <0619> "


addr == 16'ha0e ? 16'h0002 :  // <0624> a = i
addr == 16'ha0f ? 16'h0605 :  // <0624> b = 5

addr == 16'ha10 ? 16'he407 :  // <0621> bn eq :else_2576
addr == 16'ha11 ? 16'h0a17 :  // <0621> "

addr == 16'ha12 ? 16'hfba0 :  // <0622> callx  plan_tick
addr == 16'ha13 ? 16'h08bb :  // <0622> "
addr == 16'ha14 ? 16'hfc00 :  // <0622> "
addr == 16'ha15 ? 16'he00f :  // <0623> event_return
addr == 16'ha16 ? 16'h008e :  // <0623> "


addr == 16'ha17 ? 16'h0002 :  // <0651> a = i
addr == 16'ha18 ? 16'h0607 :  // <0651> b = 7

addr == 16'ha19 ? 16'he407 :  // <0625> bn eq :else_2585
addr == 16'ha1a ? 16'h0a4c :  // <0625> "

// report anmux reading.
addr == 16'ha1b ? 16'h0014 :  // <0627> a = spi_data
addr == 16'ha1c ? 16'hfba0 :  // <0628> call :put4x
addr == 16'ha1d ? 16'h00c3 :  // <0628> "
addr == 16'ha1e ? 16'hfc00 :  // <0628> "

// memorize anmux reading.
addr == 16'ha1f ? 16'hfba0 :  // <0631> call :anmux_get_chn
addr == 16'ha20 ? 16'h00b6 :  // <0631> "
addr == 16'ha21 ? 16'hfc00 :  // <0631> "
addr == 16'ha22 ? 16'h0414 :  // <0632> b = spi_data

addr == 16'ha23 ? 16'h0351 :  // <0633> a = a<<1
addr == 16'ha24 ? 16'h3001 :  // <0633> push b // push b
addr == 16'ha25 ? 16'h0616 :  // <0633> b = 22
addr == 16'ha26 ? 16'h5e00 :  // <0633> av_ad_hi = 0
addr == 16'ha27 ? 16'h6300 :  // <0633> av_ad_lo = ad0
addr == 16'ha28 ? 16'h540c :  // <0633> pop av_write_data // pop av_write_data


// decrement anmux channel & start waiting again.
addr == 16'ha29 ? 16'hfba0 :  // <0636> call :anmux_get_chn
addr == 16'ha2a ? 16'h00b6 :  // <0636> "
addr == 16'ha2b ? 16'hfc00 :  // <0636> "

addr == 16'ha2c ? 16'h0000 :  // <0643> a = a
addr == 16'ha2d ? 16'h0600 :  // <0643> b = 0

addr == 16'ha2e ? 16'he007 :  // <0637> br eq :else_2606
addr == 16'ha2f ? 16'h0a39 :  // <0637> "

addr == 16'ha30 ? 16'h0760 :  // <0638> b = -1
addr == 16'ha31 ? 16'hc800 :  // <0639> a = a+b
addr == 16'ha32 ? 16'h0300 :  // <0639> "
addr == 16'ha33 ? 16'hfba0 :  // <0640> call :anmux_set_chn
addr == 16'ha34 ? 16'h00b2 :  // <0640> "
addr == 16'ha35 ? 16'hfc00 :  // <0640> "
addr == 16'ha36 ? 16'h4a05 :  // <0641> mstimer1 = $anmux_settle_ms
addr == 16'ha37 ? 16'he00f :  // <0642> event_return
addr == 16'ha38 ? 16'h008e :  // <0642> "


// end of temperature daq pass.
addr == 16'ha39 ? 16'hfba0 :  // <0646> callx  report_plan
addr == 16'ha3a ? 16'h0b90 :  // <0646> "
addr == 16'ha3b ? 16'hfc00 :  // <0646> "
addr == 16'ha3c ? 16'hfba0 :  // <0647> callx  report_text_flags
addr == 16'ha3d ? 16'h0b5d :  // <0647> "
addr == 16'ha3e ? 16'hfc00 :  // <0647> "
addr == 16'ha3f ? 16'h020d :  // <0648> a = 13 // puteol
addr == 16'ha40 ? 16'hfba0 :  // <0648> puteol
addr == 16'ha41 ? 16'h009b :  // <0648> "
addr == 16'ha42 ? 16'hfc00 :  // <0648> "
addr == 16'ha43 ? 16'h020a :  // <0648> a = 10 // puteol
addr == 16'ha44 ? 16'hfba0 :  // <0648> puteol
addr == 16'ha45 ? 16'h009b :  // <0648> "
addr == 16'ha46 ? 16'hfc00 :  // <0648> "
addr == 16'ha47 ? 16'h5e00 :  // <0649> ram $ram_dial_setting = spi_data // av_ad_hi = 0
addr == 16'ha48 ? 16'h623a :  // <0649> ram $ram_dial_setting = spi_data // av_ad_lo = 58
addr == 16'ha49 ? 16'h5414 :  // <0649> ram $ram_dial_setting = spi_data // av_write_data = spi_data
addr == 16'ha4a ? 16'he00f :  // <0650> event_return
addr == 16'ha4b ? 16'h008e :  // <0650> "

addr == 16'ha4c ? 16'he00f :  // <0652> end_event
addr == 16'ha4d ? 16'h008e :  // <0652> "

// :power_lost_msg // = 0x0a4e
// "PWL\x0"
addr == 16'ha4e ? 16'h5750 :  // <0655> WP
addr == 16'ha4f ? 16'h004c :  // <0655>  L

// ######## event power_lost_handler // = 0x0a50
// at this time we have less than 2 ms of usable run time left.

// this must be an uncommanded loss of main power, because if it was commanded,
// no more events would be handled; this event handler wouldn't have a chance to run.
// immediately set the power relay PWM to full power for a few seconds,
// in case the power relay opened accidentally e.g. due to a hard pothole.
addr == 16'ha50 ? 16'h7a00 :  // <0664> power_duty = $power_duty_closing
addr == 16'ha51 ? 16'h5e00 :  // <0665> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'ha52 ? 16'h6214 :  // <0665> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'ha53 ? 16'h0015 :  // <0665> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'ha54 ? 16'h0016 :  // <0665> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'ha55 ? 16'h0602 :  // <0666> b = $relay_hold_passes
addr == 16'ha56 ? 16'h5e00 :  // <0667> ram $ram_relay_hold_at_pass = a+b // av_ad_hi = 0
addr == 16'ha57 ? 16'h623e :  // <0667> ram $ram_relay_hold_at_pass = a+b // av_ad_lo = 62
addr == 16'ha58 ? 16'hc800 :  // <0667> ram $ram_relay_hold_at_pass = a+b // av_write_data = a+b
addr == 16'ha59 ? 16'h5700 :  // <0667> "

// pause any non-vital power-hogging operations, to conserve power for the EEPROM write.

// save persistent data in case the power remains down e.g. due to battery disconnect.
addr == 16'ha5a ? 16'hfba0 :  // <0672> callx  save_persistent_data
addr == 16'ha5b ? 16'h0ac7 :  // <0672> "
addr == 16'ha5c ? 16'hfc00 :  // <0672> "

addr == 16'ha5d ? 16'h23a0 :  // <0674> pa = :power_lost_msg
addr == 16'ha5e ? 16'h0a4e :  // <0674> "
addr == 16'ha5f ? 16'hfba0 :  // <0674> callx  set_text_flag  :power_lost_msg
addr == 16'ha60 ? 16'h0b26 :  // <0674> "
addr == 16'ha61 ? 16'hfc00 :  // <0674> "
addr == 16'ha62 ? 16'he00f :  // <0675> end_event
addr == 16'ha63 ? 16'h008e :  // <0675> "

// :ign_off_msg // = 0x0a64
// "IGOF\x0"
addr == 16'ha64 ? 16'h4749 :  // <0678> GI
addr == 16'ha65 ? 16'h464f :  // <0678> FO
addr == 16'ha66 ? 16'h0000 :  // <0678>   

// ######## event ign_switch_off_handler // = 0x0a67
// set power-down deadline in RAM.  this makes the system remain powered for several more minutes, for cooldown data logging.
addr == 16'ha67 ? 16'h5e00 :  // <0682> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'ha68 ? 16'h6240 :  // <0682> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'ha69 ? 16'h0015 :  // <0682> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'ha6a ? 16'h0016 :  // <0682> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'ha6b ? 16'h060a :  // <0683> b = $power_extend_minutes
addr == 16'ha6c ? 16'h5e00 :  // <0684> ram $ram_power_down_at_min = a+b // av_ad_hi = 0
addr == 16'ha6d ? 16'h623c :  // <0684> ram $ram_power_down_at_min = a+b // av_ad_lo = 60
addr == 16'ha6e ? 16'hc800 :  // <0684> ram $ram_power_down_at_min = a+b // av_write_data = a+b
addr == 16'ha6f ? 16'h5700 :  // <0684> "
addr == 16'ha70 ? 16'h23a0 :  // <0685> pa = :ign_off_msg
addr == 16'ha71 ? 16'h0a64 :  // <0685> "
addr == 16'ha72 ? 16'hfba0 :  // <0685> callx  set_text_flag   :ign_off_msg
addr == 16'ha73 ? 16'h0b26 :  // <0685> "
addr == 16'ha74 ? 16'hfc00 :  // <0685> "
addr == 16'ha75 ? 16'he00f :  // <0686> end_event
addr == 16'ha76 ? 16'h008e :  // <0686> "

// :ign_on_msg // = 0x0a77
// "IGON\x0"
addr == 16'ha77 ? 16'h4749 :  // <0689> GI
addr == 16'ha78 ? 16'h4e4f :  // <0689> NO
addr == 16'ha79 ? 16'h0000 :  // <0689>   

// ######## event ign_switch_on_handler // = 0x0a7a
addr == 16'ha7a ? 16'h5e00 :  // <0692> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'ha7b ? 16'h623c :  // <0692> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 60
addr == 16'ha7c ? 16'h5760 :  // <0692> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'ha7d ? 16'h23a0 :  // <0693> pa = :ign_on_msg
addr == 16'ha7e ? 16'h0a77 :  // <0693> "
addr == 16'ha7f ? 16'hfba0 :  // <0693> callx  set_text_flag   :ign_on_msg
addr == 16'ha80 ? 16'h0b26 :  // <0693> "
addr == 16'ha81 ? 16'hfc00 :  // <0693> "
addr == 16'ha82 ? 16'he00f :  // <0694> end_event
addr == 16'ha83 ? 16'h008e :  // <0694> "

// ######## event puff1_done_handler // = 0x0a84
// puff just finished.  set length of next puff.
addr == 16'ha84 ? 16'h5e00 :  // <0698> ram puff_len_us = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'ha85 ? 16'h6290 :  // <0698> ram puff_len_us = $ram_next_puff_len_us // av_ad_lo = 144
addr == 16'ha86 ? 16'h8415 :  // <0698> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_write_data // start read cycle
addr == 16'ha87 ? 16'h8416 :  // <0698> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_read_data // finish read cycle

// count puffs.
addr == 16'ha88 ? 16'h5e00 :  // <0701> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'ha89 ? 16'h6292 :  // <0701> ram a = $ram_puff_count // av_ad_lo = 146
addr == 16'ha8a ? 16'h0015 :  // <0701> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'ha8b ? 16'h0016 :  // <0701> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'ha8c ? 16'h0601 :  // <0702> b = 1
addr == 16'ha8d ? 16'h5e00 :  // <0703> ram $ram_puff_count = a+b // av_ad_hi = 0
addr == 16'ha8e ? 16'h6292 :  // <0703> ram $ram_puff_count = a+b // av_ad_lo = 146
addr == 16'ha8f ? 16'hc800 :  // <0703> ram $ram_puff_count = a+b // av_write_data = a+b
addr == 16'ha90 ? 16'h5700 :  // <0703> "

// hack to set puff length strictly by a hard-wired knob.
// ram a = $ram_dial_setting
// a = a<<1
// a = a<<1
// a = a<<1
// bn az :nonzero
// a = 1
// :nonzero
// puff_len_us = a
addr == 16'ha91 ? 16'he00f :  // <0714> end_event
addr == 16'ha92 ? 16'h008e :  // <0714> "

// ######## func minute_events // = 0x0a93
addr == 16'ha93 ? 16'h303e :  // <0718> push rtna // func minute_events

addr == 16'ha94 ? 16'hfba0 :  // <0717> callx  check_power_down
addr == 16'ha95 ? 16'h0ab0 :  // <0717> "
addr == 16'ha96 ? 16'hfc00 :  // <0717> "

addr == 16'ha97 ? 16'hf80c :  // <0719> pop rtna // func minute_events
addr == 16'ha98 ? 16'hfc00 :  // <0719> swapra = nop

// :power_hold_msg // = 0x0a99
// "PWH\x0"
addr == 16'ha99 ? 16'h5750 :  // <0721> WP
addr == 16'ha9a ? 16'h0048 :  // <0721>  H

// ######## func check_power_relay // = 0x0a9b
addr == 16'ha9b ? 16'h303e :  // <0731> push rtna // func check_power_relay

addr == 16'ha9c ? 16'h5e00 :  // <0724> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'ha9d ? 16'h6214 :  // <0724> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'ha9e ? 16'h0015 :  // <0724> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'ha9f ? 16'h0016 :  // <0724> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'haa0 ? 16'h5e00 :  // <0725> ram b = $ram_relay_hold_at_pass // av_ad_hi = 0
addr == 16'haa1 ? 16'h623e :  // <0725> ram b = $ram_relay_hold_at_pass // av_ad_lo = 62
addr == 16'haa2 ? 16'h0415 :  // <0725> ram b = $ram_relay_hold_at_pass // b = av_write_data // start read cycle
addr == 16'haa3 ? 16'h0416 :  // <0725> ram b = $ram_relay_hold_at_pass // b = av_read_data // finish read cycle

addr == 16'haa4 ? 16'h0000 :  // <0730> a = a
addr == 16'haa5 ? 16'h0401 :  // <0730> b = b

addr == 16'haa6 ? 16'he407 :  // <0726> bn eq :else_2726
addr == 16'haa7 ? 16'h0aae :  // <0726> "

// time to begin "solenoid saver" coil power reduction by PWM.
addr == 16'haa8 ? 16'h7a19 :  // <0728> power_duty = $power_duty_holding
addr == 16'haa9 ? 16'h23a0 :  // <0729> pa = :power_hold_msg
addr == 16'haaa ? 16'h0a99 :  // <0729> "
addr == 16'haab ? 16'hfba0 :  // <0729> callx  set_text_flag  :power_hold_msg
addr == 16'haac ? 16'h0b26 :  // <0729> "
addr == 16'haad ? 16'hfc00 :  // <0729> "


addr == 16'haae ? 16'hf80c :  // <0732> pop rtna // func check_power_relay
addr == 16'haaf ? 16'hfc00 :  // <0732> swapra = nop

// ######## func check_power_down // = 0x0ab0

// check power-down deadline in RAM.
addr == 16'hab0 ? 16'h5e00 :  // <0735> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'hab1 ? 16'h6240 :  // <0735> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'hab2 ? 16'h0015 :  // <0735> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'hab3 ? 16'h0016 :  // <0735> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'hab4 ? 16'h5e00 :  // <0736> ram b = $ram_power_down_at_min // av_ad_hi = 0
addr == 16'hab5 ? 16'h623c :  // <0736> ram b = $ram_power_down_at_min // av_ad_lo = 60
addr == 16'hab6 ? 16'h0415 :  // <0736> ram b = $ram_power_down_at_min // b = av_write_data // start read cycle
addr == 16'hab7 ? 16'h0416 :  // <0736> ram b = $ram_power_down_at_min // b = av_read_data // finish read cycle

addr == 16'hab8 ? 16'h0000 :  // <0739> a = a
addr == 16'hab9 ? 16'h0401 :  // <0739> b = b

addr == 16'haba ? 16'he407 :  // <0737> bn eq :else_2746
addr == 16'habb ? 16'h0abe :  // <0737> "

addr == 16'habc ? 16'he00f :  // <0738> jmp :power_down
addr == 16'habd ? 16'h0abf :  // <0738> "


addr == 16'habe ? 16'hfc00 :  // <0741> swapra = nop

// :power_down // = 0x0abf
// this code never returns.
addr == 16'habf ? 16'hfba0 :  // <0744> callx  save_persistent_data
addr == 16'hac0 ? 16'h0ac7 :  // <0744> "
addr == 16'hac1 ? 16'hfc00 :  // <0744> "
addr == 16'hac2 ? 16'h7a32 :  // <0745> power_duty = $power_duty_opening
addr == 16'hac3 ? 16'h6fa0 :  // <0746> error_halt_code $err_power_down // leds = 0xfffc
addr == 16'hac4 ? 16'hfffc :  // <0746> "
addr == 16'hac5 ? 16'he00f :  // <0746> error_halt_code $err_power_down
addr == 16'hac6 ? 16'h0ac5 :  // <0746> "

// ######## func save_persistent_data // = 0x0ac7


addr == 16'hac7 ? 16'hfc00 :  // <0750> swapra = nop

// ######## func check_communication // = 0x0ac8
addr == 16'hac8 ? 16'h303e :  // <0770> push rtna // func check_communication

addr == 16'hac9 ? 16'h5e00 :  // <0752> ram a = $ram_ftdi_downtime_remain_sec // av_ad_hi = 0
addr == 16'haca ? 16'h6212 :  // <0752> ram a = $ram_ftdi_downtime_remain_sec // av_ad_lo = 18
addr == 16'hacb ? 16'h0015 :  // <0752> ram a = $ram_ftdi_downtime_remain_sec // a = av_write_data // start read cycle
addr == 16'hacc ? 16'h0016 :  // <0752> ram a = $ram_ftdi_downtime_remain_sec // a = av_read_data // finish read cycle

addr == 16'hacd ? 16'h0000 :  // <0760> a = a
addr == 16'hace ? 16'h0600 :  // <0760> b = 0

addr == 16'hacf ? 16'he007 :  // <0753> br eq :else_2767
addr == 16'had0 ? 16'h0ade :  // <0753> "

addr == 16'had1 ? 16'h0760 :  // <0754> b = -1
addr == 16'had2 ? 16'hc800 :  // <0755> a = a+b
addr == 16'had3 ? 16'h0300 :  // <0755> "
addr == 16'had4 ? 16'h5e00 :  // <0756> ram $ram_ftdi_downtime_remain_sec = a // av_ad_hi = 0
addr == 16'had5 ? 16'h6212 :  // <0756> ram $ram_ftdi_downtime_remain_sec = a // av_ad_lo = 18
addr == 16'had6 ? 16'h5400 :  // <0756> ram $ram_ftdi_downtime_remain_sec = a // av_write_data = a

addr == 16'had7 ? 16'h0000 :  // <0759> a = a
addr == 16'had8 ? 16'h0600 :  // <0759> b = 0

addr == 16'had9 ? 16'he407 :  // <0757> bn eq :else_2777
addr == 16'hada ? 16'h0ade :  // <0757> "

addr == 16'hadb ? 16'hfba0 :  // <0758> callx  ftdi_power_on
addr == 16'hadc ? 16'h0b12 :  // <0758> "
addr == 16'hadd ? 16'hfc00 :  // <0758> "



addr == 16'hade ? 16'h5e00 :  // <0762> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'hadf ? 16'h6240 :  // <0762> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'hae0 ? 16'h0015 :  // <0762> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'hae1 ? 16'h0016 :  // <0762> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'hae2 ? 16'h5e00 :  // <0763> ram b = $ram_comm_restart_at_min // av_ad_hi = 0
addr == 16'hae3 ? 16'h6210 :  // <0763> ram b = $ram_comm_restart_at_min // av_ad_lo = 16
addr == 16'hae4 ? 16'h0415 :  // <0763> ram b = $ram_comm_restart_at_min // b = av_write_data // start read cycle
addr == 16'hae5 ? 16'h0416 :  // <0763> ram b = $ram_comm_restart_at_min // b = av_read_data // finish read cycle

addr == 16'hae6 ? 16'h0000 :  // <0769> a = a
addr == 16'hae7 ? 16'h0401 :  // <0769> b = b

addr == 16'hae8 ? 16'he407 :  // <0764> bn eq :else_2792
addr == 16'hae9 ? 16'h0af3 :  // <0764> "

// comm restart is required.
addr == 16'haea ? 16'hfba0 :  // <0766> callx  postpone_comm_restart
addr == 16'haeb ? 16'h0af5 :  // <0766> "
addr == 16'haec ? 16'hfc00 :  // <0766> "
addr == 16'haed ? 16'h5e00 :  // <0767> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_hi = 0
addr == 16'haee ? 16'h6212 :  // <0767> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_lo = 18
addr == 16'haef ? 16'h5605 :  // <0767> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_write_data = 5
addr == 16'haf0 ? 16'hfba0 :  // <0768> callx  ftdi_power_off
addr == 16'haf1 ? 16'h0b02 :  // <0768> "
addr == 16'haf2 ? 16'hfc00 :  // <0768> "


addr == 16'haf3 ? 16'hf80c :  // <0771> pop rtna // func check_communication
addr == 16'haf4 ? 16'hfc00 :  // <0771> swapra = nop

// ######## func postpone_comm_restart // = 0x0af5

addr == 16'haf5 ? 16'h5e00 :  // <0773> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'haf6 ? 16'h6240 :  // <0773> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'haf7 ? 16'h0015 :  // <0773> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'haf8 ? 16'h0016 :  // <0773> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'haf9 ? 16'h0602 :  // <0774> b = $comm_grace_period_min
addr == 16'hafa ? 16'h5e00 :  // <0775> ram $ram_comm_restart_at_min = a+b // av_ad_hi = 0
addr == 16'hafb ? 16'h6210 :  // <0775> ram $ram_comm_restart_at_min = a+b // av_ad_lo = 16
addr == 16'hafc ? 16'hc800 :  // <0775> ram $ram_comm_restart_at_min = a+b // av_write_data = a+b
addr == 16'hafd ? 16'h5700 :  // <0775> "

addr == 16'hafe ? 16'hfc00 :  // <0777> swapra = nop

// :ftdi_off_msg // = 0x0aff
// "FTOF\x0"
addr == 16'haff ? 16'h5446 :  // <0779> TF
addr == 16'hb00 ? 16'h464f :  // <0779> FO
addr == 16'hb01 ? 16'h0000 :  // <0779>   

// ######## func ftdi_power_off // = 0x0b02
addr == 16'hb02 ? 16'h303e :  // <0786> push rtna // func ftdi_power_off

addr == 16'hb03 ? 16'h001c :  // <0782> a = board_ctrl
addr == 16'hb04 ? 16'h07a0 :  // <0783> b = $not_ftdi_power_mask
addr == 16'hb05 ? 16'hff7f :  // <0783> "
addr == 16'hb06 ? 16'hc800 :  // <0784> board_ctrl = and
addr == 16'hb07 ? 16'h7330 :  // <0784> "
addr == 16'hb08 ? 16'h23a0 :  // <0785> pa = :ftdi_off_msg
addr == 16'hb09 ? 16'h0aff :  // <0785> "
addr == 16'hb0a ? 16'hfba0 :  // <0785> callx  set_text_flag  :ftdi_off_msg
addr == 16'hb0b ? 16'h0b26 :  // <0785> "
addr == 16'hb0c ? 16'hfc00 :  // <0785> "

addr == 16'hb0d ? 16'hf80c :  // <0787> pop rtna // func ftdi_power_off
addr == 16'hb0e ? 16'hfc00 :  // <0787> swapra = nop

// :ftdi_on_msg // = 0x0b0f
// "FTON\x0"
addr == 16'hb0f ? 16'h5446 :  // <0789> TF
addr == 16'hb10 ? 16'h4e4f :  // <0789> NO
addr == 16'hb11 ? 16'h0000 :  // <0789>   

// ######## func ftdi_power_on // = 0x0b12
addr == 16'hb12 ? 16'h303e :  // <0796> push rtna // func ftdi_power_on

addr == 16'hb13 ? 16'h001c :  // <0792> a = board_ctrl
addr == 16'hb14 ? 16'h0680 :  // <0793> b = $ftdi_power_mask
addr == 16'hb15 ? 16'hc800 :  // <0794> board_ctrl = or
addr == 16'hb16 ? 16'h7334 :  // <0794> "
addr == 16'hb17 ? 16'h23a0 :  // <0795> pa = :ftdi_on_msg
addr == 16'hb18 ? 16'h0b0f :  // <0795> "
addr == 16'hb19 ? 16'hfba0 :  // <0795> callx  set_text_flag  :ftdi_on_msg
addr == 16'hb1a ? 16'h0b26 :  // <0795> "
addr == 16'hb1b ? 16'hfc00 :  // <0795> "

addr == 16'hb1c ? 16'hf80c :  // <0797> pop rtna // func ftdi_power_on
addr == 16'hb1d ? 16'hfc00 :  // <0797> swapra = nop

// ######## func clear_ram_page // = 0x0b1e

addr == 16'hb1e ? 16'h0200 :  // <0799> a = 0
addr == 16'hb1f ? 16'h0602 :  // <0800> b = 2
// :clear_next_word // = 0x0b20
addr == 16'hb20 ? 16'h6000 :  // <0802> av_ad_lo = a
addr == 16'hb21 ? 16'h5600 :  // <0803> av_write_data = 0
addr == 16'hb22 ? 16'h0300 :  // <0804> a = ad0
addr == 16'hb23 ? 16'he400 :  // <0805> bn az :clear_next_word
addr == 16'hb24 ? 16'h0b20 :  // <0805> "

addr == 16'hb25 ? 16'hfc00 :  // <0807> swapra = nop

// ######## func set_text_flag // = 0x0b26

addr == 16'hb26 ? 16'h0408 :  // <0809> b = flag_addr
addr == 16'hb27 ? 16'h5e00 :  // <0810> ram a = $ram_next_tfp_idx // av_ad_hi = 0
addr == 16'hb28 ? 16'h6256 :  // <0810> ram a = $ram_next_tfp_idx // av_ad_lo = 86
addr == 16'hb29 ? 16'h0015 :  // <0810> ram a = $ram_next_tfp_idx // a = av_write_data // start read cycle
addr == 16'hb2a ? 16'h0016 :  // <0810> ram a = $ram_next_tfp_idx // a = av_read_data // finish read cycle

addr == 16'hb2b ? 16'h0351 :  // <0811> a = a<<1
addr == 16'hb2c ? 16'h3001 :  // <0811> push b // push b
addr == 16'hb2d ? 16'h0646 :  // <0811> b = 70
addr == 16'hb2e ? 16'h5e00 :  // <0811> av_ad_hi = 0
addr == 16'hb2f ? 16'h6300 :  // <0811> av_ad_lo = ad0
addr == 16'hb30 ? 16'h540c :  // <0811> pop av_write_data // pop av_write_data

addr == 16'hb31 ? 16'h0008 :  // <0812> a = flag_addr
addr == 16'hb32 ? 16'h0760 :  // <0813> b = -1
addr == 16'hb33 ? 16'hc800 :  // <0814> a = a+b
addr == 16'hb34 ? 16'h0300 :  // <0814> "
addr == 16'hb35 ? 16'h0607 :  // <0815> b = $tfp_mask
addr == 16'hb36 ? 16'h5e00 :  // <0816> ram $ram_next_tfp_idx = and // av_ad_hi = 0
addr == 16'hb37 ? 16'h6256 :  // <0816> ram $ram_next_tfp_idx = and // av_ad_lo = 86
addr == 16'hb38 ? 16'hc800 :  // <0816> ram $ram_next_tfp_idx = and // av_write_data = and
addr == 16'hb39 ? 16'h5730 :  // <0816> "

addr == 16'hb3a ? 16'hfc00 :  // <0818> swapra = nop

// ######## func unique_text_flag // = 0x0b3b
addr == 16'hb3b ? 16'h3002 :  // <0829> push i // func unique_text_flag
addr == 16'hb3c ? 16'h303e :  // <0829> push rtna // "

addr == 16'hb3d ? 16'h0a00 :  // <0826> i = 0
// :loop_2877 // = 0x0b3e

addr == 16'hb3e ? 16'h0002 :  // <0820> a = i

addr == 16'hb3f ? 16'h0351 :  // <0821> a = a<<1
addr == 16'hb40 ? 16'h0646 :  // <0821> b = 70
addr == 16'hb41 ? 16'h5e00 :  // <0821> av_ad_hi = 0
addr == 16'hb42 ? 16'h6300 :  // <0821> av_ad_lo = ad0
addr == 16'hb43 ? 16'h0415 :  // <0821> b = av_write_data
addr == 16'hb44 ? 16'h0416 :  // <0821> b = av_read_data


addr == 16'hb45 ? 16'h0001 :  // <0824> a = b
addr == 16'hb46 ? 16'h0408 :  // <0824> b = flag_addr

addr == 16'hb47 ? 16'he407 :  // <0822> bn eq :else_2887
addr == 16'hb48 ? 16'h0b4b :  // <0822> "

addr == 16'hb49 ? 16'he00f :  // <0823> jmp :skip
addr == 16'hb4a ? 16'h0b57 :  // <0823> "



addr == 16'hb4b ? 16'h0002 :  // <0826> a = i
addr == 16'hb4c ? 16'h0601 :  // <0826> b = 1
addr == 16'hb4d ? 16'hc800 :  // <0826> i = a+b
addr == 16'hb4e ? 16'h0b00 :  // <0826> "


addr == 16'hb4f ? 16'h0002 :  // <0826> a = i
addr == 16'hb50 ? 16'h0608 :  // <0826> b = $num_text_flag_pointers
addr == 16'hb51 ? 16'he005 :  // <0826> br lt :loop_2877
addr == 16'hb52 ? 16'h0b3e :  // <0826> "

// :end_2877 // = 0x0b53
addr == 16'hb53 ? 16'h2008 :  // <0827> pa = flag_addr
addr == 16'hb54 ? 16'hfba0 :  // <0827> callx  set_text_flag  flag_addr
addr == 16'hb55 ? 16'h0b26 :  // <0827> "
addr == 16'hb56 ? 16'hfc00 :  // <0827> "
// :skip // = 0x0b57

addr == 16'hb57 ? 16'hf80c :  // <0830> pop rtna // func unique_text_flag
addr == 16'hb58 ? 16'h080c :  // <0830> pop i // "
addr == 16'hb59 ? 16'hfc00 :  // <0830> swapra = nop

// :text_flags_msg // = 0x0b5a
// " tf=\x0"
addr == 16'hb5a ? 16'h7420 :  // <0832> t 
addr == 16'hb5b ? 16'h3d66 :  // <0832> =f
addr == 16'hb5c ? 16'h0000 :  // <0832>   

// ######## func report_text_flags // = 0x0b5d
addr == 16'hb5d ? 16'h3002 :  // <0848> push i // func report_text_flags
addr == 16'hb5e ? 16'h303e :  // <0848> push rtna // "

addr == 16'hb5f ? 16'h03a0 :  // <0835> a = :text_flags_msg
addr == 16'hb60 ? 16'h0b5a :  // <0835> "
addr == 16'hb61 ? 16'hfba0 :  // <0836> call :print_nt
addr == 16'hb62 ? 16'h014f :  // <0836> "
addr == 16'hb63 ? 16'hfc00 :  // <0836> "
addr == 16'hb64 ? 16'h0a00 :  // <0847> i = 0
// :loop_2916 // = 0x0b65

addr == 16'hb65 ? 16'h0002 :  // <0837> a = i

addr == 16'hb66 ? 16'h0351 :  // <0838> a = a<<1
addr == 16'hb67 ? 16'h0646 :  // <0838> b = 70
addr == 16'hb68 ? 16'h5e00 :  // <0838> av_ad_hi = 0
addr == 16'hb69 ? 16'h6300 :  // <0838> av_ad_lo = ad0
addr == 16'hb6a ? 16'h0415 :  // <0838> b = av_write_data
addr == 16'hb6b ? 16'h0416 :  // <0838> b = av_read_data


addr == 16'hb6c ? 16'h0001 :  // <0845> a = b
addr == 16'hb6d ? 16'h0600 :  // <0845> b = 0

addr == 16'hb6e ? 16'he007 :  // <0839> br eq :else_2926
addr == 16'hb6f ? 16'h0b7f :  // <0839> "

addr == 16'hb70 ? 16'hfba0 :  // <0840> call :print_nt
addr == 16'hb71 ? 16'h014f :  // <0840> "
addr == 16'hb72 ? 16'hfc00 :  // <0840> "
addr == 16'hb73 ? 16'h022c :  // <0841> a = 44 // putasc ","
addr == 16'hb74 ? 16'hfba0 :  // <0841> putasc ","
addr == 16'hb75 ? 16'h009b :  // <0841> "
addr == 16'hb76 ? 16'hfc00 :  // <0841> "
addr == 16'hb77 ? 16'h0002 :  // <0842> a = i
addr == 16'hb78 ? 16'h0600 :  // <0843> b = 0

addr == 16'hb79 ? 16'h0351 :  // <0844> a = a<<1
addr == 16'hb7a ? 16'h3001 :  // <0844> push b // push b
addr == 16'hb7b ? 16'h0646 :  // <0844> b = 70
addr == 16'hb7c ? 16'h5e00 :  // <0844> av_ad_hi = 0
addr == 16'hb7d ? 16'h6300 :  // <0844> av_ad_lo = ad0
addr == 16'hb7e ? 16'h540c :  // <0844> pop av_write_data // pop av_write_data




addr == 16'hb7f ? 16'h0002 :  // <0847> a = i
addr == 16'hb80 ? 16'h0601 :  // <0847> b = 1
addr == 16'hb81 ? 16'hc800 :  // <0847> i = a+b
addr == 16'hb82 ? 16'h0b00 :  // <0847> "


addr == 16'hb83 ? 16'h0002 :  // <0847> a = i
addr == 16'hb84 ? 16'h0608 :  // <0847> b = $num_text_flag_pointers
addr == 16'hb85 ? 16'he005 :  // <0847> br lt :loop_2916
addr == 16'hb86 ? 16'h0b65 :  // <0847> "

// :end_2916 // = 0x0b87

addr == 16'hb87 ? 16'hf80c :  // <0849> pop rtna // func report_text_flags
addr == 16'hb88 ? 16'h080c :  // <0849> pop i // "
addr == 16'hb89 ? 16'hfc00 :  // <0849> swapra = nop

// :plan_msg // = 0x0b8a
// " pl=\x0"
addr == 16'hb8a ? 16'h7020 :  // <0851> p 
addr == 16'hb8b ? 16'h3d6c :  // <0851> =l
addr == 16'hb8c ? 16'h0000 :  // <0851>   
// :manual_trim_msg // = 0x0b8d
// " mt=\x0"
addr == 16'hb8d ? 16'h6d20 :  // <0853> m 
addr == 16'hb8e ? 16'h3d74 :  // <0853> =t
addr == 16'hb8f ? 16'h0000 :  // <0853>   

// ######## func report_plan // = 0x0b90
addr == 16'hb90 ? 16'h303e :  // <0865> push rtna // func report_plan

addr == 16'hb91 ? 16'h03a0 :  // <0856> a = :plan_msg
addr == 16'hb92 ? 16'h0b8a :  // <0856> "
addr == 16'hb93 ? 16'hfba0 :  // <0857> call :print_nt
addr == 16'hb94 ? 16'h014f :  // <0857> "
addr == 16'hb95 ? 16'hfc00 :  // <0857> "
addr == 16'hb96 ? 16'h5e00 :  // <0858> ram a = $ram_plan_name // av_ad_hi = 0
addr == 16'hb97 ? 16'h6288 :  // <0858> ram a = $ram_plan_name // av_ad_lo = 136
addr == 16'hb98 ? 16'h0015 :  // <0858> ram a = $ram_plan_name // a = av_write_data // start read cycle
addr == 16'hb99 ? 16'h0016 :  // <0858> ram a = $ram_plan_name // a = av_read_data // finish read cycle
addr == 16'hb9a ? 16'hfba0 :  // <0859> call :print_nt
addr == 16'hb9b ? 16'h014f :  // <0859> "
addr == 16'hb9c ? 16'hfc00 :  // <0859> "

addr == 16'hb9d ? 16'h03a0 :  // <0861> a = :manual_trim_msg
addr == 16'hb9e ? 16'h0b8d :  // <0861> "
addr == 16'hb9f ? 16'hfba0 :  // <0862> call :print_nt
addr == 16'hba0 ? 16'h014f :  // <0862> "
addr == 16'hba1 ? 16'hfc00 :  // <0862> "
addr == 16'hba2 ? 16'h5e00 :  // <0863> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'hba3 ? 16'h62ec :  // <0863> ram a = $ram_run_manual_trim_thou // av_ad_lo = 236
addr == 16'hba4 ? 16'h0015 :  // <0863> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'hba5 ? 16'h0016 :  // <0863> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle
addr == 16'hba6 ? 16'hfba0 :  // <0864> call :put4x
addr == 16'hba7 ? 16'h00c3 :  // <0864> "
addr == 16'hba8 ? 16'hfc00 :  // <0864> "

addr == 16'hba9 ? 16'hf80c :  // <0866> pop rtna // func report_plan
addr == 16'hbaa ? 16'hfc00 :  // <0866> swapra = nop

// ######## func interpret_tps // = 0x0bab
addr == 16'hbab ? 16'h3002 :  // <0954> push i // func interpret_tps
addr == 16'hbac ? 16'h3004 :  // <0954> push x // "
addr == 16'hbad ? 16'h3005 :  // <0954> push y // "
addr == 16'hbae ? 16'h3006 :  // <0954> push ga // "
addr == 16'hbaf ? 16'h3007 :  // <0954> push gb // "
addr == 16'hbb0 ? 16'h303e :  // <0954> push rtna // "

addr == 16'hbb1 ? 16'h0206 :  // <0868> a = $tps_adc_channel

addr == 16'hbb2 ? 16'h0351 :  // <0869> a = a<<1
addr == 16'hbb3 ? 16'h0626 :  // <0869> b = 38
addr == 16'hbb4 ? 16'h5e00 :  // <0869> av_ad_hi = 0
addr == 16'hbb5 ? 16'h6300 :  // <0869> av_ad_lo = ad0
addr == 16'hbb6 ? 16'h0415 :  // <0869> b = av_write_data
addr == 16'hbb7 ? 16'h0416 :  // <0869> b = av_read_data

// reverse the scale.
addr == 16'hbb8 ? 16'h03a0 :  // <0871> a = 0x0fff
addr == 16'hbb9 ? 16'h0fff :  // <0871> "
addr == 16'hbba ? 16'hc800 :  // <0872> b = xor
addr == 16'hbbb ? 16'h0738 :  // <0872> "
// memorize reading into slot 0 and shift history up 1 slot.  total up as we go.
addr == 16'hbbc ? 16'h1801 :  // <0874> ga = b
addr == 16'hbbd ? 16'h1200 :  // <0875> x = 0
addr == 16'hbbe ? 16'h0a00 :  // <0886> i = 0
// :loop_3006 // = 0x0bbf

addr == 16'hbbf ? 16'h0002 :  // <0876> a = i

addr == 16'hbc0 ? 16'h0351 :  // <0877> a = a<<1
addr == 16'hbc1 ? 16'h06dc :  // <0877> b = 220
addr == 16'hbc2 ? 16'h5e00 :  // <0877> av_ad_hi = 0
addr == 16'hbc3 ? 16'h6300 :  // <0877> av_ad_lo = ad0
addr == 16'hbc4 ? 16'h0415 :  // <0877> b = av_write_data
addr == 16'hbc5 ? 16'h0416 :  // <0877> b = av_read_data

addr == 16'hbc6 ? 16'h1c01 :  // <0878> gb = b
addr == 16'hbc7 ? 16'h1401 :  // <0879> y = b
addr == 16'hbc8 ? 16'hc800 :  // <0880> x = x+y
addr == 16'hbc9 ? 16'h1320 :  // <0880> "
addr == 16'hbca ? 16'h0002 :  // <0881> a = i
addr == 16'hbcb ? 16'h0406 :  // <0882> b = ga

addr == 16'hbcc ? 16'h0351 :  // <0883> a = a<<1
addr == 16'hbcd ? 16'h3001 :  // <0883> push b // push b
addr == 16'hbce ? 16'h06dc :  // <0883> b = 220
addr == 16'hbcf ? 16'h5e00 :  // <0883> av_ad_hi = 0
addr == 16'hbd0 ? 16'h6300 :  // <0883> av_ad_lo = ad0
addr == 16'hbd1 ? 16'h540c :  // <0883> pop av_write_data // pop av_write_data

addr == 16'hbd2 ? 16'h1807 :  // <0884> ga = gb


addr == 16'hbd3 ? 16'h0002 :  // <0886> a = i
addr == 16'hbd4 ? 16'h0601 :  // <0886> b = 1
addr == 16'hbd5 ? 16'hc800 :  // <0886> i = a+b
addr == 16'hbd6 ? 16'h0b00 :  // <0886> "


addr == 16'hbd7 ? 16'h0002 :  // <0886> a = i
addr == 16'hbd8 ? 16'h0604 :  // <0886> b = $tps_history_len
addr == 16'hbd9 ? 16'he005 :  // <0886> br lt :loop_3006
addr == 16'hbda ? 16'h0bbf :  // <0886> "

// :end_3006 // = 0x0bdb
// memorize average.
addr == 16'hbdb ? 16'h0004 :  // <0888> a = x
addr == 16'hbdc ? 16'h0350 :  // <0889> a = a>>1
addr == 16'hbdd ? 16'h1b50 :  // <0890> ga = a>>1
addr == 16'hbde ? 16'h5e00 :  // <0891> ram $ram_tps_avg = ga // av_ad_hi = 0
addr == 16'hbdf ? 16'h62da :  // <0891> ram $ram_tps_avg = ga // av_ad_lo = 218
addr == 16'hbe0 ? 16'h5406 :  // <0891> ram $ram_tps_avg = ga // av_write_data = ga
// interpret state by comparing vs. reference table.
// compare to idle reference.
addr == 16'hbe1 ? 16'h0200 :  // <0894> a = 0

addr == 16'hbe2 ? 16'h0351 :  // <0895> a = a<<1
addr == 16'hbe3 ? 16'h06b4 :  // <0895> b = 180
addr == 16'hbe4 ? 16'h5e00 :  // <0895> av_ad_hi = 0
addr == 16'hbe5 ? 16'h6300 :  // <0895> av_ad_lo = ad0
addr == 16'hbe6 ? 16'h0415 :  // <0895> b = av_write_data
addr == 16'hbe7 ? 16'h0416 :  // <0895> b = av_read_data

addr == 16'hbe8 ? 16'h0001 :  // <0896> a = b
addr == 16'hbe9 ? 16'h0353 :  // <0897> a = a>>4
addr == 16'hbea ? 16'hc800 :  // <0898> b = a+b
addr == 16'hbeb ? 16'h0700 :  // <0898> "

addr == 16'hbec ? 16'h0006 :  // <0902> a = ga
addr == 16'hbed ? 16'h0401 :  // <0902> b = b

addr == 16'hbee ? 16'he405 :  // <0899> bn lt :else_3054
addr == 16'hbef ? 16'h0bf5 :  // <0899> "

addr == 16'hbf0 ? 16'h5e00 :  // <0900> ram $ram_tps_state = $tps_state_closed // av_ad_hi = 0
addr == 16'hbf1 ? 16'h62ce :  // <0900> ram $ram_tps_state = $tps_state_closed // av_ad_lo = 206
addr == 16'hbf2 ? 16'h5600 :  // <0900> ram $ram_tps_state = $tps_state_closed // av_write_data = 0
addr == 16'hbf3 ? 16'he00f :  // <0901> jmp :end
addr == 16'hbf4 ? 16'h0c47 :  // <0901> "

// compare to wide open reference.
addr == 16'hbf5 ? 16'h020c :  // <0904> a = ($num_tps_cells - 1)

addr == 16'hbf6 ? 16'h0351 :  // <0905> a = a<<1
addr == 16'hbf7 ? 16'h06b4 :  // <0905> b = 180
addr == 16'hbf8 ? 16'h5e00 :  // <0905> av_ad_hi = 0
addr == 16'hbf9 ? 16'h6300 :  // <0905> av_ad_lo = ad0
addr == 16'hbfa ? 16'h0415 :  // <0905> b = av_write_data
addr == 16'hbfb ? 16'h0416 :  // <0905> b = av_read_data

addr == 16'hbfc ? 16'h1001 :  // <0906> x = b
addr == 16'hbfd ? 16'h0001 :  // <0907> a = b
addr == 16'hbfe ? 16'h0350 :  // <0908> a = a>>1
addr == 16'hbff ? 16'h0350 :  // <0909> a = a>>1
addr == 16'hc00 ? 16'h0760 :  // <0910> b = 0xffff
addr == 16'hc01 ? 16'hc800 :  // <0911> y = xor
addr == 16'hc02 ? 16'h1738 :  // <0911> "

addr == 16'hc03 ? 16'h0006 :  // <0915> a = ga
addr == 16'hc04 ? 16'hc800 :  // <0915> b = x+y
addr == 16'hc05 ? 16'h0720 :  // <0915> "

addr == 16'hc06 ? 16'he406 :  // <0912> bn gt :else_3078
addr == 16'hc07 ? 16'h0c0d :  // <0912> "

addr == 16'hc08 ? 16'h5e00 :  // <0913> ram $ram_tps_state = $tps_state_open // av_ad_hi = 0
addr == 16'hc09 ? 16'h62ce :  // <0913> ram $ram_tps_state = $tps_state_open // av_ad_lo = 206
addr == 16'hc0a ? 16'h5604 :  // <0913> ram $ram_tps_state = $tps_state_open // av_write_data = 4
addr == 16'hc0b ? 16'he00f :  // <0914> jmp :end
addr == 16'hc0c ? 16'h0c47 :  // <0914> "

// compare to current RPM's reference position.
//patch: rework this to compare to the next 2 tps reference cells instead of a fixed margin.
// that way always prevents it from enriching while the tps is still within same ref cell.
addr == 16'hc0d ? 16'h5e00 :  // <0919> ram pa = $ram_avg_rpm // av_ad_hi = 0
addr == 16'hc0e ? 16'h627c :  // <0919> ram pa = $ram_avg_rpm // av_ad_lo = 124
addr == 16'hc0f ? 16'h2015 :  // <0919> ram pa = $ram_avg_rpm // pa = av_write_data // start read cycle
addr == 16'hc10 ? 16'h2016 :  // <0919> ram pa = $ram_avg_rpm // pa = av_read_data // finish read cycle
addr == 16'hc11 ? 16'hfba0 :  // <0920> callx  find_rpm_cell  pa  a
addr == 16'hc12 ? 16'h0585 :  // <0920> "
addr == 16'hc13 ? 16'hfc00 :  // <0920> "
addr == 16'hc14 ? 16'h0008 :  // <0920> a = pa

addr == 16'hc15 ? 16'h0351 :  // <0921> a = a<<1
addr == 16'hc16 ? 16'h06b4 :  // <0921> b = 180
addr == 16'hc17 ? 16'h5e00 :  // <0921> av_ad_hi = 0
addr == 16'hc18 ? 16'h6300 :  // <0921> av_ad_lo = ad0
addr == 16'hc19 ? 16'h0415 :  // <0921> b = av_write_data
addr == 16'hc1a ? 16'h0416 :  // <0921> b = av_read_data

addr == 16'hc1b ? 16'h1001 :  // <0922> x = b
// test if it's within 1/16 of reference.
addr == 16'hc1c ? 16'h0004 :  // <0924> a = x
addr == 16'hc1d ? 16'h0353 :  // <0925> a = a>>4
addr == 16'hc1e ? 16'hc800 :  // <0926> a = a+b
addr == 16'hc1f ? 16'h0300 :  // <0926> "

addr == 16'hc20 ? 16'h0000 :  // <0930> a = a
addr == 16'hc21 ? 16'h0406 :  // <0930> b = ga

addr == 16'hc22 ? 16'he406 :  // <0927> bn gt :else_3106
addr == 16'hc23 ? 16'h0c29 :  // <0927> "

addr == 16'hc24 ? 16'h5e00 :  // <0928> ram $ram_tps_state = $tps_state_cruise // av_ad_hi = 0
addr == 16'hc25 ? 16'h62ce :  // <0928> ram $ram_tps_state = $tps_state_cruise // av_ad_lo = 206
addr == 16'hc26 ? 16'h5601 :  // <0928> ram $ram_tps_state = $tps_state_cruise // av_write_data = 1
addr == 16'hc27 ? 16'he00f :  // <0929> jmp :end
addr == 16'hc28 ? 16'h0c47 :  // <0929> "

// test if it's within 1/8 of reference.
addr == 16'hc29 ? 16'h0004 :  // <0932> a = x
addr == 16'hc2a ? 16'h0350 :  // <0933> a = a>>1
addr == 16'hc2b ? 16'h0350 :  // <0934> a = a>>1
addr == 16'hc2c ? 16'h0350 :  // <0935> a = a>>1
addr == 16'hc2d ? 16'h0404 :  // <0936> b = x
addr == 16'hc2e ? 16'hc800 :  // <0937> a = a+b
addr == 16'hc2f ? 16'h0300 :  // <0937> "

addr == 16'hc30 ? 16'h0000 :  // <0941> a = a
addr == 16'hc31 ? 16'h0406 :  // <0941> b = ga

addr == 16'hc32 ? 16'he406 :  // <0938> bn gt :else_3122
addr == 16'hc33 ? 16'h0c39 :  // <0938> "

addr == 16'hc34 ? 16'h5e00 :  // <0939> ram $ram_tps_state = $tps_state_accel1 // av_ad_hi = 0
addr == 16'hc35 ? 16'h62ce :  // <0939> ram $ram_tps_state = $tps_state_accel1 // av_ad_lo = 206
addr == 16'hc36 ? 16'h5602 :  // <0939> ram $ram_tps_state = $tps_state_accel1 // av_write_data = 2
addr == 16'hc37 ? 16'he00f :  // <0940> jmp :end
addr == 16'hc38 ? 16'h0c47 :  // <0940> "

// test if it's within 1/2 of reference.
addr == 16'hc39 ? 16'h0004 :  // <0943> a = x
addr == 16'hc3a ? 16'h0350 :  // <0944> a = a>>1
addr == 16'hc3b ? 16'h0404 :  // <0945> b = x
addr == 16'hc3c ? 16'hc800 :  // <0946> a = a+b
addr == 16'hc3d ? 16'h0300 :  // <0946> "

addr == 16'hc3e ? 16'h0000 :  // <0950> a = a
addr == 16'hc3f ? 16'h0406 :  // <0950> b = ga

addr == 16'hc40 ? 16'he406 :  // <0947> bn gt :else_3136
addr == 16'hc41 ? 16'h0c47 :  // <0947> "

addr == 16'hc42 ? 16'h5e00 :  // <0948> ram $ram_tps_state = $tps_state_accel2 // av_ad_hi = 0
addr == 16'hc43 ? 16'h62ce :  // <0948> ram $ram_tps_state = $tps_state_accel2 // av_ad_lo = 206
addr == 16'hc44 ? 16'h5603 :  // <0948> ram $ram_tps_state = $tps_state_accel2 // av_write_data = 3
addr == 16'hc45 ? 16'he00f :  // <0949> jmp :end
addr == 16'hc46 ? 16'h0c47 :  // <0949> "

// in this case leave ram_tps_state as-is.

// :end // = 0x0c47

addr == 16'hc47 ? 16'hf80c :  // <0955> pop rtna // func interpret_tps
addr == 16'hc48 ? 16'h1c0c :  // <0955> pop gb // "
addr == 16'hc49 ? 16'h180c :  // <0955> pop ga // "
addr == 16'hc4a ? 16'h140c :  // <0955> pop y // "
addr == 16'hc4b ? 16'h100c :  // <0955> pop x // "
addr == 16'hc4c ? 16'h080c :  // <0955> pop i // "
addr == 16'hc4d ? 16'hfc00 :  // <0955> swapra = nop

// ######## func jf_to_rpm // = 0x0c4e
addr == 16'hc4e ? 16'h303e :  // <0965> push rtna // func jf_to_rpm

// resolution = 32 rpm.
addr == 16'hc4f ? 16'h0408 :  // <0958> b = jiffies
addr == 16'hc50 ? 16'h03a0 :  // <0959> a = 0x5573
addr == 16'hc51 ? 16'h5573 :  // <0959> "
// = 700000 >> 5
addr == 16'hc52 ? 16'hfba0 :  // <0961> call :divide
addr == 16'hc53 ? 16'h018c :  // <0961> "
addr == 16'hc54 ? 16'hfc00 :  // <0961> "
addr == 16'hc55 ? 16'h0001 :  // <0962> a = b
addr == 16'hc56 ? 16'h0352 :  // <0963> a = a<<4
addr == 16'hc57 ? 16'h2351 :  // <0964> rpm = a<<1

addr == 16'hc58 ? 16'hf80c :  // <0966> pop rtna // func jf_to_rpm
addr == 16'hc59 ? 16'hfc00 :  // <0966> swapra = nop

// ######## func check_engine_stop // = 0x0c5a
addr == 16'hc5a ? 16'h303e :  // <0982> push rtna // func check_engine_stop

// returns 1 if transitioned to stop, else 0.

// transition to plan_stop if ignition switch is turned off AND rpm estimate is invalid.
// requiring both conditions prevents spurious noise readings from shutting down the injection.

addr == 16'hc5b ? 16'h001e :  // <0980> a = power_duty
addr == 16'hc5c ? 16'h0680 :  // <0980> b = ( 0x0080 )

addr == 16'hc5d ? 16'he003 :  // <0972> br and0z :else_3165
addr == 16'hc5e ? 16'h0c72 :  // <0972> "

addr == 16'hc5f ? 16'h5e00 :  // <0973> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'hc60 ? 16'h627e :  // <0973> ram a = $ram_rpm_valid // av_ad_lo = 126
addr == 16'hc61 ? 16'h0015 :  // <0973> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'hc62 ? 16'h0016 :  // <0973> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle

addr == 16'hc63 ? 16'h0000 :  // <0979> a = a
addr == 16'hc64 ? 16'h0600 :  // <0979> b = 0

addr == 16'hc65 ? 16'he407 :  // <0974> bn eq :else_3173
addr == 16'hc66 ? 16'h0c72 :  // <0974> "

addr == 16'hc67 ? 16'h5e00 :  // <0975> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'hc68 ? 16'h628e :  // <0975> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'hc69 ? 16'hf815 :  // <0975> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'hc6a ? 16'hf816 :  // <0975> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'hc6b ? 16'hfc00 :  // <0976> swapra = nop
addr == 16'hc6c ? 16'hfba0 :  // <0978> callx  init_plan_stop
addr == 16'hc6d ? 16'h0322 :  // <0978> "
addr == 16'hc6e ? 16'hfc00 :  // <0978> "
addr == 16'hc6f ? 16'h2201 :  // <0979> did_stop = 1
addr == 16'hc70 ? 16'hf80c :  // <0979> pop rtna // rtn 1
addr == 16'hc71 ? 16'hfc00 :  // <0978> swapra = nop


addr == 16'hc72 ? 16'h2200 :  // <0981> did_stop = 0
addr == 16'hc73 ? 16'hf80c :  // <0981> pop rtna // rtn 0
addr == 16'hc74 ? 16'hfc00 :  // <0980> swapra = nop

addr == 16'hc75 ? 16'hf80c :  // <0983> pop rtna // func check_engine_stop
addr == 16'hc76 ? 16'hfc00 :  // <0983> swapra = nop


        
                16'hxxxx;
        endmodule
    
