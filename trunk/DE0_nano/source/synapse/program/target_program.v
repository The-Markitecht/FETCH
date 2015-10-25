
        `include "header.v"

        module target_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.

addr == 16'h00 ? 16'he00f :  // <0004> jmp :main
addr == 16'h01 ? 16'h076a :  // <0004> "


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
addr == 16'h8f ? 16'h0792 :  // <0006> "
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
addr == 16'h23f ? 16'h063c :  // <0019> ([label load_smap_cmd])
// " clsmap"
addr == 16'h240 ? 16'h6320 :  // <0020> c 
addr == 16'h241 ? 16'h736c :  // <0020> sl
addr == 16'h242 ? 16'h616d :  // <0020> am
addr == 16'h243 ? 16'h0070 :  // <0020>  p
addr == 16'h244 ? 16'h0658 :  // <0021> ([label clear_smap_cmd])
// "   smap"
addr == 16'h245 ? 16'h2020 :  // <0022>   
addr == 16'h246 ? 16'h7320 :  // <0022> s 
addr == 16'h247 ? 16'h616d :  // <0022> am
addr == 16'h248 ? 16'h0070 :  // <0022>  p
addr == 16'h249 ? 16'h0590 :  // <0023> ([label dump_smap_cmd])
// "   ltps"
addr == 16'h24a ? 16'h2020 :  // <0024>   
addr == 16'h24b ? 16'h6c20 :  // <0024> l 
addr == 16'h24c ? 16'h7074 :  // <0024> pt
addr == 16'h24d ? 16'h0073 :  // <0024>  s
addr == 16'h24e ? 16'h0690 :  // <0025> ([label learn_tps_ref_cmd])
// " ldtpsr"
addr == 16'h24f ? 16'h6c20 :  // <0026> l 
addr == 16'h250 ? 16'h7464 :  // <0026> td
addr == 16'h251 ? 16'h7370 :  // <0026> sp
addr == 16'h252 ? 16'h0072 :  // <0026>  r
addr == 16'h253 ? 16'h066d :  // <0027> ([label load_tps_ref_cmd])
// " ldtpse"
addr == 16'h254 ? 16'h6c20 :  // <0028> l 
addr == 16'h255 ? 16'h7464 :  // <0028> td
addr == 16'h256 ? 16'h7370 :  // <0028> sp
addr == 16'h257 ? 16'h0065 :  // <0028>  e
addr == 16'h258 ? 16'h0620 :  // <0029> ([label load_tps_enrich_cmd])
// "      ,"
addr == 16'h259 ? 16'h2020 :  // <0030>   
addr == 16'h25a ? 16'h2020 :  // <0030>   
addr == 16'h25b ? 16'h2020 :  // <0030>   
addr == 16'h25c ? 16'h002c :  // <0030>  ,
addr == 16'h25d ? 16'h06a7 :  // <0031> ([label trim_lean_cmd])
// "      ."
addr == 16'h25e ? 16'h2020 :  // <0032>   
addr == 16'h25f ? 16'h2020 :  // <0032>   
addr == 16'h260 ? 16'h2020 :  // <0032>   
addr == 16'h261 ? 16'h002e :  // <0032>  .
addr == 16'h262 ? 16'h06b8 :  // <0033> ([label trim_rich_cmd])
// "      \["
addr == 16'h263 ? 16'h2020 :  // <0034>   
addr == 16'h264 ? 16'h2020 :  // <0034>   
addr == 16'h265 ? 16'h2020 :  // <0034>   
addr == 16'h266 ? 16'h005b :  // <0034>  [
addr == 16'h267 ? 16'h06c9 :  // <0035> ([label trim_2lean_cmd])
// "      \]"
addr == 16'h268 ? 16'h2020 :  // <0036>   
addr == 16'h269 ? 16'h2020 :  // <0036>   
addr == 16'h26a ? 16'h2020 :  // <0036>   
addr == 16'h26b ? 16'h005d :  // <0036>  ]
addr == 16'h26c ? 16'h06da :  // <0037> ([label trim_2rich_cmd])
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
addr == 16'h2cc ? 16'h0ad7 :  // <0085> "
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
addr == 16'h311 ? 16'h06eb :  // <0132> "
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
addr == 16'h31c ? 16'h045a :  // <0139> "
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
addr == 16'h324 ? 16'h080d :  // <0006> "
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
addr == 16'h375 ? 16'h080d :  // <0026> "
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
addr == 16'h3aa ? 16'h0c0b :  // <0057> "
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
addr == 16'h416 ? 16'h0c0b :  // <0073> "
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
addr == 16'h42b ? 16'h06eb :  // <0081> "
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
addr == 16'h446 ? 16'h06eb :  // <0094> "
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

// :plan_name_learn_stoich // = 0x0458
// "LN\x0"
addr == 16'h458 ? 16'h4e4c :  // <0059> NL
addr == 16'h459 ? 16'h0000 :  // <0059>   

// ######## func init_plan_learn_stoich // = 0x045a

// set up the learn_stoich plan.
addr == 16'h45a ? 16'h5e00 :  // <0063> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_ad_hi = 0
addr == 16'h45b ? 16'h62e4 :  // <0063> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_ad_lo = 228
addr == 16'h45c ? 16'h560a :  // <0063> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_write_data = 10

// memorize state.
addr == 16'h45d ? 16'h5e00 :  // <0066> ram $ram_plan_name = :plan_name_learn_stoich // av_ad_hi = 0
addr == 16'h45e ? 16'h6288 :  // <0066> ram $ram_plan_name = :plan_name_learn_stoich // av_ad_lo = 136
addr == 16'h45f ? 16'h57a0 :  // <0066> ram $ram_plan_name = :plan_name_learn_stoich // av_write_data = :plan_name_learn_stoich
addr == 16'h460 ? 16'h0458 :  // <0066> "
addr == 16'h461 ? 16'h5e00 :  // <0067> ram $ram_puff_len_func = :puff_len_learn_stoich // av_ad_hi = 0
addr == 16'h462 ? 16'h628a :  // <0067> ram $ram_puff_len_func = :puff_len_learn_stoich // av_ad_lo = 138
addr == 16'h463 ? 16'h57a0 :  // <0067> ram $ram_puff_len_func = :puff_len_learn_stoich // av_write_data = :puff_len_learn_stoich
addr == 16'h464 ? 16'h0473 :  // <0067> "
addr == 16'h465 ? 16'h5e00 :  // <0068> ram $ram_transition_func = :leave_learn_stoich // av_ad_hi = 0
addr == 16'h466 ? 16'h628c :  // <0068> ram $ram_transition_func = :leave_learn_stoich // av_ad_lo = 140
addr == 16'h467 ? 16'h57a0 :  // <0068> ram $ram_transition_func = :leave_learn_stoich // av_write_data = :leave_learn_stoich
addr == 16'h468 ? 16'h056d :  // <0068> "
addr == 16'h469 ? 16'h5e00 :  // <0069> ram $ram_destroy_plan_func = :destroy_plan_learn_stoich // av_ad_hi = 0
addr == 16'h46a ? 16'h628e :  // <0069> ram $ram_destroy_plan_func = :destroy_plan_learn_stoich // av_ad_lo = 142
addr == 16'h46b ? 16'h57a0 :  // <0069> ram $ram_destroy_plan_func = :destroy_plan_learn_stoich // av_write_data = :destroy_plan_learn_stoich
addr == 16'h46c ? 16'h046e :  // <0069> "

addr == 16'h46d ? 16'hfc00 :  // <0071> swapra = nop

// ######## func destroy_plan_learn_stoich // = 0x046e


addr == 16'h46e ? 16'hfc00 :  // <0074> swapra = nop

// :lrns_trim_up_msg // = 0x046f
// "trR\x0"
addr == 16'h46f ? 16'h7274 :  // <0076> rt
addr == 16'h470 ? 16'h0052 :  // <0076>  R
// :lrns_trim_down_msg // = 0x0471
// "trL\x0"
addr == 16'h471 ? 16'h7274 :  // <0078> rt
addr == 16'h472 ? 16'h004c :  // <0078>  L

// ######## func puff_len_learn_stoich // = 0x0473
addr == 16'h473 ? 16'h3002 :  // <0113> push i // func puff_len_learn_stoich
addr == 16'h474 ? 16'h3003 :  // <0113> push j // "
addr == 16'h475 ? 16'h3006 :  // <0113> push g6 // "
addr == 16'h476 ? 16'h3007 :  // <0113> push g7 // "
addr == 16'h477 ? 16'h303e :  // <0113> push rtna // "

addr == 16'h478 ? 16'h5e00 :  // <0081> ram i = $ram_lrns_ticks_remain // av_ad_hi = 0
addr == 16'h479 ? 16'h62e4 :  // <0081> ram i = $ram_lrns_ticks_remain // av_ad_lo = 228
addr == 16'h47a ? 16'h0815 :  // <0081> ram i = $ram_lrns_ticks_remain // i = av_write_data // start read cycle
addr == 16'h47b ? 16'h0816 :  // <0081> ram i = $ram_lrns_ticks_remain // i = av_read_data // finish read cycle

addr == 16'h47c ? 16'h0002 :  // <0112> a = i
addr == 16'h47d ? 16'h0600 :  // <0112> b = 0

addr == 16'h47e ? 16'he406 :  // <0082> bn gt :else_1150
addr == 16'h47f ? 16'h0487 :  // <0082> "

addr == 16'h480 ? 16'h0f60 :  // <0083> j = -1
addr == 16'h481 ? 16'h5e00 :  // <0084> ram $ram_lrns_ticks_remain = i+j // av_ad_hi = 0
addr == 16'h482 ? 16'h62e4 :  // <0084> ram $ram_lrns_ticks_remain = i+j // av_ad_lo = 228
addr == 16'h483 ? 16'hc800 :  // <0084> ram $ram_lrns_ticks_remain = i+j // av_write_data = i+j
addr == 16'h484 ? 16'h5710 :  // <0084> "

addr == 16'h485 ? 16'he00f :  // <0086> jmp :end_1150
addr == 16'h486 ? 16'h04c3 :  // <0086> "

addr == 16'h487 ? 16'h5e00 :  // <0087> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_ad_hi = 0
addr == 16'h488 ? 16'h62e4 :  // <0087> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_ad_lo = 228
addr == 16'h489 ? 16'h560a :  // <0087> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_write_data = 10

// i = old puff length, j = puff length increment.
addr == 16'h48a ? 16'h5e00 :  // <0090> ram i = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'h48b ? 16'h6290 :  // <0090> ram i = $ram_next_puff_len_us // av_ad_lo = 144
addr == 16'h48c ? 16'h0815 :  // <0090> ram i = $ram_next_puff_len_us // i = av_write_data // start read cycle
addr == 16'h48d ? 16'h0816 :  // <0090> ram i = $ram_next_puff_len_us // i = av_read_data // finish read cycle
addr == 16'h48e ? 16'h0e00 :  // <0091> j = 0
addr == 16'h48f ? 16'h5e00 :  // <0092> ram g6 = $ram_o2_state // av_ad_hi = 0
addr == 16'h490 ? 16'h62e6 :  // <0092> ram g6 = $ram_o2_state // av_ad_lo = 230
addr == 16'h491 ? 16'h1815 :  // <0092> ram g6 = $ram_o2_state // g6 = av_write_data // start read cycle
addr == 16'h492 ? 16'h1816 :  // <0092> ram g6 = $ram_o2_state // g6 = av_read_data // finish read cycle
addr == 16'h493 ? 16'hfba0 :  // <0093> callx  interpret_o2
addr == 16'h494 ? 16'h0530 :  // <0093> "
addr == 16'h495 ? 16'hfc00 :  // <0093> "
addr == 16'h496 ? 16'h5e00 :  // <0094> ram g7 = $ram_o2_state // av_ad_hi = 0
addr == 16'h497 ? 16'h62e6 :  // <0094> ram g7 = $ram_o2_state // av_ad_lo = 230
addr == 16'h498 ? 16'h1c15 :  // <0094> ram g7 = $ram_o2_state // g7 = av_write_data // start read cycle
addr == 16'h499 ? 16'h1c16 :  // <0094> ram g7 = $ram_o2_state // g7 = av_read_data // finish read cycle

addr == 16'h49a ? 16'h0007 :  // <0111> a = g7
addr == 16'h49b ? 16'h0601 :  // <0111> b = 1

addr == 16'h49c ? 16'he407 :  // <0095> bn eq :else_1180
addr == 16'h49d ? 16'h04b3 :  // <0095> "

// sensing a lean condition.  trim up to enrich.

addr == 16'h49e ? 16'h0002 :  // <0099> a = i
addr == 16'h49f ? 16'h07a0 :  // <0099> b = 10000
addr == 16'h4a0 ? 16'h2710 :  // <0099> "

addr == 16'h4a1 ? 16'he405 :  // <0097> bn lt :else_1185
addr == 16'h4a2 ? 16'h04a5 :  // <0097> "

addr == 16'h4a3 ? 16'h0fa0 :  // <0098> j = $lrns_puff_step_up_us
addr == 16'h4a4 ? 16'h0258 :  // <0098> "

addr == 16'h4a5 ? 16'h23a0 :  // <0100> pa = :lrns_trim_up_msg
addr == 16'h4a6 ? 16'h046f :  // <0100> "
addr == 16'h4a7 ? 16'hfba0 :  // <0100> callx  set_text_flag  :lrns_trim_up_msg
addr == 16'h4a8 ? 16'h0ad7 :  // <0100> "
addr == 16'h4a9 ? 16'hfc00 :  // <0100> "

addr == 16'h4aa ? 16'h0006 :  // <0104> a = g6
addr == 16'h4ab ? 16'h0602 :  // <0104> b = 2

addr == 16'h4ac ? 16'he407 :  // <0101> bn eq :else_1196
addr == 16'h4ad ? 16'h04b1 :  // <0101> "

// o2 state just switched to lean.  adjust map.
addr == 16'h4ae ? 16'hfba0 :  // <0103> callx  learn_smap
addr == 16'h4af ? 16'h04cf :  // <0103> "
addr == 16'h4b0 ? 16'hfc00 :  // <0103> "


addr == 16'h4b1 ? 16'he00f :  // <0106> jmp :end_1180
addr == 16'h4b2 ? 16'h04bf :  // <0106> "

// sensing a rich condition.  trim down to lean it out.

addr == 16'h4b3 ? 16'h0002 :  // <0110> a = i
addr == 16'h4b4 ? 16'h07a0 :  // <0110> b = 2000
addr == 16'h4b5 ? 16'h07d0 :  // <0110> "

addr == 16'h4b6 ? 16'he406 :  // <0108> bn gt :else_1206
addr == 16'h4b7 ? 16'h04ba :  // <0108> "

addr == 16'h4b8 ? 16'h0fa0 :  // <0109> j = $lrns_puff_step_down_us
addr == 16'h4b9 ? 16'hffdf :  // <0109> "

addr == 16'h4ba ? 16'h23a0 :  // <0111> pa = :lrns_trim_down_msg
addr == 16'h4bb ? 16'h0471 :  // <0111> "
addr == 16'h4bc ? 16'hfba0 :  // <0111> callx  set_text_flag  :lrns_trim_down_msg
addr == 16'h4bd ? 16'h0ad7 :  // <0111> "
addr == 16'h4be ? 16'hfc00 :  // <0111> "

addr == 16'h4bf ? 16'h5e00 :  // <0112> ram $ram_next_puff_len_us = i+j // av_ad_hi = 0
addr == 16'h4c0 ? 16'h6290 :  // <0112> ram $ram_next_puff_len_us = i+j // av_ad_lo = 144
addr == 16'h4c1 ? 16'hc800 :  // <0112> ram $ram_next_puff_len_us = i+j // av_write_data = i+j
addr == 16'h4c2 ? 16'h5710 :  // <0112> "


addr == 16'h4c3 ? 16'hf80c :  // <0114> pop rtna // func puff_len_learn_stoich
addr == 16'h4c4 ? 16'h1c0c :  // <0114> pop g7 // "
addr == 16'h4c5 ? 16'h180c :  // <0114> pop g6 // "
addr == 16'h4c6 ? 16'h0c0c :  // <0114> pop j // "
addr == 16'h4c7 ? 16'h080c :  // <0114> pop i // "
addr == 16'h4c8 ? 16'hfc00 :  // <0114> swapra = nop

// :lrns_enrich_msg // = 0x04c9
// "lrnR\x0"
addr == 16'h4c9 ? 16'h726c :  // <0116> rl
addr == 16'h4ca ? 16'h526e :  // <0116> Rn
addr == 16'h4cb ? 16'h0000 :  // <0116>   
// :lrns_lean_msg // = 0x04cc
// "lrnL\x0"
addr == 16'h4cc ? 16'h726c :  // <0118> rl
addr == 16'h4cd ? 16'h4c6e :  // <0118> Ln
addr == 16'h4ce ? 16'h0000 :  // <0118>   

// ######## func learn_smap // = 0x04cf
addr == 16'h4cf ? 16'h3002 :  // <0154> push i // func learn_smap
addr == 16'h4d0 ? 16'h3004 :  // <0154> push x // "
addr == 16'h4d1 ? 16'h3005 :  // <0154> push y // "
addr == 16'h4d2 ? 16'h303e :  // <0154> push rtna // "

addr == 16'h4d3 ? 16'h5e00 :  // <0121> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h4d4 ? 16'h627e :  // <0121> ram a = $ram_rpm_valid // av_ad_lo = 126
addr == 16'h4d5 ? 16'h0015 :  // <0121> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h4d6 ? 16'h0016 :  // <0121> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle

addr == 16'h4d7 ? 16'h0000 :  // <0153> a = a
addr == 16'h4d8 ? 16'h0601 :  // <0153> b = 1

addr == 16'h4d9 ? 16'he407 :  // <0122> bn eq :else_1241
addr == 16'h4da ? 16'h0527 :  // <0122> "

// let g6 = map cell num.  x = map puff len.  i = observed stoich puff len.
addr == 16'h4db ? 16'h5e00 :  // <0124> ram pa = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h4dc ? 16'h627c :  // <0124> ram pa = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h4dd ? 16'h2015 :  // <0124> ram pa = $ram_avg_rpm // pa = av_write_data // start read cycle
addr == 16'h4de ? 16'h2016 :  // <0124> ram pa = $ram_avg_rpm // pa = av_read_data // finish read cycle
addr == 16'h4df ? 16'hfba0 :  // <0125> callx  find_rpm_cell  pa  g6
addr == 16'h4e0 ? 16'h0573 :  // <0125> "
addr == 16'h4e1 ? 16'hfc00 :  // <0125> "
addr == 16'h4e2 ? 16'h1808 :  // <0125> g6 = pa
addr == 16'h4e3 ? 16'h0006 :  // <0126> a = g6

addr == 16'h4e4 ? 16'h0351 :  // <0127> a = a<<1
addr == 16'h4e5 ? 16'h0698 :  // <0127> b = 152
addr == 16'h4e6 ? 16'h5e00 :  // <0127> av_ad_hi = 0
addr == 16'h4e7 ? 16'h6300 :  // <0127> av_ad_lo = ad0
addr == 16'h4e8 ? 16'h0415 :  // <0127> b = av_write_data
addr == 16'h4e9 ? 16'h0416 :  // <0127> b = av_read_data

addr == 16'h4ea ? 16'h1001 :  // <0128> x = b
addr == 16'h4eb ? 16'h5e00 :  // <0129> ram i = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'h4ec ? 16'h6290 :  // <0129> ram i = $ram_next_puff_len_us // av_ad_lo = 144
addr == 16'h4ed ? 16'h0815 :  // <0129> ram i = $ram_next_puff_len_us // i = av_write_data // start read cycle
addr == 16'h4ee ? 16'h0816 :  // <0129> ram i = $ram_next_puff_len_us // i = av_read_data // finish read cycle
addr == 16'h4ef ? 16'h17a0 :  // <0130> y = (0xffff - $lrns_map_step + 1)
addr == 16'h4f0 ? 16'hff38 :  // <0130> "

addr == 16'h4f1 ? 16'hc800 :  // <0137> a = x+y
addr == 16'h4f2 ? 16'h0320 :  // <0137> "
addr == 16'h4f3 ? 16'h0402 :  // <0137> b = i

addr == 16'h4f4 ? 16'he406 :  // <0131> bn gt :else_1268
addr == 16'h4f5 ? 16'h0504 :  // <0131> "

// map is richer than observed stoich.  lean the map 1 step.
addr == 16'h4f6 ? 16'h0006 :  // <0133> a = g6
addr == 16'h4f7 ? 16'hc800 :  // <0134> b = x+y
addr == 16'h4f8 ? 16'h0720 :  // <0134> "

addr == 16'h4f9 ? 16'h0351 :  // <0135> a = a<<1
addr == 16'h4fa ? 16'h3001 :  // <0135> push b // push b
addr == 16'h4fb ? 16'h0698 :  // <0135> b = 152
addr == 16'h4fc ? 16'h5e00 :  // <0135> av_ad_hi = 0
addr == 16'h4fd ? 16'h6300 :  // <0135> av_ad_lo = ad0
addr == 16'h4fe ? 16'h540c :  // <0135> pop av_write_data // pop av_write_data

addr == 16'h4ff ? 16'h23a0 :  // <0136> pa = :lrns_lean_msg
addr == 16'h500 ? 16'h04cc :  // <0136> "
addr == 16'h501 ? 16'hfba0 :  // <0136> callx  set_text_flag  :lrns_lean_msg
addr == 16'h502 ? 16'h0ad7 :  // <0136> "
addr == 16'h503 ? 16'hfc00 :  // <0136> "

addr == 16'h504 ? 16'h16c8 :  // <0138> y = $lrns_map_step

addr == 16'h505 ? 16'hc800 :  // <0145> a = x+y
addr == 16'h506 ? 16'h0320 :  // <0145> "
addr == 16'h507 ? 16'h0402 :  // <0145> b = i

addr == 16'h508 ? 16'he405 :  // <0139> bn lt :else_1288
addr == 16'h509 ? 16'h0518 :  // <0139> "

// map is leaner than observed stoich.  rich the map 1 step.
addr == 16'h50a ? 16'h0006 :  // <0141> a = g6
addr == 16'h50b ? 16'hc800 :  // <0142> b = x+y
addr == 16'h50c ? 16'h0720 :  // <0142> "

addr == 16'h50d ? 16'h0351 :  // <0143> a = a<<1
addr == 16'h50e ? 16'h3001 :  // <0143> push b // push b
addr == 16'h50f ? 16'h0698 :  // <0143> b = 152
addr == 16'h510 ? 16'h5e00 :  // <0143> av_ad_hi = 0
addr == 16'h511 ? 16'h6300 :  // <0143> av_ad_lo = ad0
addr == 16'h512 ? 16'h540c :  // <0143> pop av_write_data // pop av_write_data

addr == 16'h513 ? 16'h23a0 :  // <0144> pa = :lrns_enrich_msg
addr == 16'h514 ? 16'h04c9 :  // <0144> "
addr == 16'h515 ? 16'hfba0 :  // <0144> callx  set_text_flag  :lrns_enrich_msg
addr == 16'h516 ? 16'h0ad7 :  // <0144> "
addr == 16'h517 ? 16'hfc00 :  // <0144> "


// dump smap if we haven't done so lately.
addr == 16'h518 ? 16'h5e00 :  // <0148> ram a = $ram_last_learn_second // av_ad_hi = 0
addr == 16'h519 ? 16'h62b2 :  // <0148> ram a = $ram_last_learn_second // av_ad_lo = 178
addr == 16'h51a ? 16'h0015 :  // <0148> ram a = $ram_last_learn_second // a = av_write_data // start read cycle
addr == 16'h51b ? 16'h0016 :  // <0148> ram a = $ram_last_learn_second // a = av_read_data // finish read cycle
addr == 16'h51c ? 16'h5e00 :  // <0149> ram b = $ram_seconds_cnt // av_ad_hi = 0
addr == 16'h51d ? 16'h6242 :  // <0149> ram b = $ram_seconds_cnt // av_ad_lo = 66
addr == 16'h51e ? 16'h0415 :  // <0149> ram b = $ram_seconds_cnt // b = av_write_data // start read cycle
addr == 16'h51f ? 16'h0416 :  // <0149> ram b = $ram_seconds_cnt // b = av_read_data // finish read cycle

addr == 16'h520 ? 16'h0000 :  // <0152> a = a
addr == 16'h521 ? 16'h0401 :  // <0152> b = b

addr == 16'h522 ? 16'he007 :  // <0150> br eq :else_1314
addr == 16'h523 ? 16'h0527 :  // <0150> "

addr == 16'h524 ? 16'hfba0 :  // <0151> callx  dump_smap_cmd
addr == 16'h525 ? 16'h0590 :  // <0151> "
addr == 16'h526 ? 16'hfc00 :  // <0151> "



addr == 16'h527 ? 16'hf80c :  // <0155> pop rtna // func learn_smap
addr == 16'h528 ? 16'h140c :  // <0155> pop y // "
addr == 16'h529 ? 16'h100c :  // <0155> pop x // "
addr == 16'h52a ? 16'h080c :  // <0155> pop i // "
addr == 16'h52b ? 16'hfc00 :  // <0155> swapra = nop

// :o2_rich_msg // = 0x052c
// "o2R\x0"
addr == 16'h52c ? 16'h326f :  // <0157> 2o
addr == 16'h52d ? 16'h0052 :  // <0157>  R
// :o2_lean_msg // = 0x052e
// "o2L\x0"
addr == 16'h52e ? 16'h326f :  // <0159> 2o
addr == 16'h52f ? 16'h004c :  // <0159>  L

// ######## func interpret_o2 // = 0x0530

addr == 16'h530 ? 16'h5e00 :  // <0162> ram a = $ram_o2_state // av_ad_hi = 0
addr == 16'h531 ? 16'h62e6 :  // <0162> ram a = $ram_o2_state // av_ad_lo = 230
addr == 16'h532 ? 16'h0015 :  // <0162> ram a = $ram_o2_state // a = av_write_data // start read cycle
addr == 16'h533 ? 16'h0016 :  // <0162> ram a = $ram_o2_state // a = av_read_data // finish read cycle

addr == 16'h534 ? 16'h0000 :  // <0173> a = a
addr == 16'h535 ? 16'h0601 :  // <0173> b = 1

addr == 16'h536 ? 16'he007 :  // <0163> br eq :else_1334
addr == 16'h537 ? 16'h054b :  // <0163> "

// check sensor for lean state.
addr == 16'h538 ? 16'h0205 :  // <0165> a = $o2_adc_channel

addr == 16'h539 ? 16'h0351 :  // <0166> a = a<<1
addr == 16'h53a ? 16'h0626 :  // <0166> b = 38
addr == 16'h53b ? 16'h5e00 :  // <0166> av_ad_hi = 0
addr == 16'h53c ? 16'h6300 :  // <0166> av_ad_lo = ad0
addr == 16'h53d ? 16'h0415 :  // <0166> b = av_write_data
addr == 16'h53e ? 16'h0416 :  // <0166> b = av_read_data

addr == 16'h53f ? 16'h03a0 :  // <0167> a = $o2_lean_thresh_adc
addr == 16'h540 ? 16'h01c2 :  // <0167> "

addr == 16'h541 ? 16'h0000 :  // <0172> a = a
addr == 16'h542 ? 16'h0401 :  // <0172> b = b

addr == 16'h543 ? 16'he406 :  // <0168> bn gt :else_1347
addr == 16'h544 ? 16'h054b :  // <0168> "

addr == 16'h545 ? 16'h5e00 :  // <0169> ram $ram_o2_state = $o2_state_lean // av_ad_hi = 0
addr == 16'h546 ? 16'h62e6 :  // <0169> ram $ram_o2_state = $o2_state_lean // av_ad_lo = 230
addr == 16'h547 ? 16'h5601 :  // <0169> ram $ram_o2_state = $o2_state_lean // av_write_data = 1
addr == 16'h548 ? 16'h5e00 :  // <0170> ram $ram_o2_been_lean = 1 // av_ad_hi = 0
addr == 16'h549 ? 16'h62ea :  // <0170> ram $ram_o2_been_lean = 1 // av_ad_lo = 234
addr == 16'h54a ? 16'h5601 :  // <0170> ram $ram_o2_been_lean = 1 // av_write_data = 1
// callx  set_text_flag  :o2_lean_msg



addr == 16'h54b ? 16'h0000 :  // <0184> a = a
addr == 16'h54c ? 16'h0602 :  // <0184> b = 2

addr == 16'h54d ? 16'he007 :  // <0174> br eq :else_1357
addr == 16'h54e ? 16'h0562 :  // <0174> "

// check sensor for rich state.
addr == 16'h54f ? 16'h0205 :  // <0176> a = $o2_adc_channel

addr == 16'h550 ? 16'h0351 :  // <0177> a = a<<1
addr == 16'h551 ? 16'h0626 :  // <0177> b = 38
addr == 16'h552 ? 16'h5e00 :  // <0177> av_ad_hi = 0
addr == 16'h553 ? 16'h6300 :  // <0177> av_ad_lo = ad0
addr == 16'h554 ? 16'h0415 :  // <0177> b = av_write_data
addr == 16'h555 ? 16'h0416 :  // <0177> b = av_read_data

addr == 16'h556 ? 16'h03a0 :  // <0178> a = $o2_rich_thresh_adc
addr == 16'h557 ? 16'h02bc :  // <0178> "

addr == 16'h558 ? 16'h0000 :  // <0183> a = a
addr == 16'h559 ? 16'h0401 :  // <0183> b = b

addr == 16'h55a ? 16'he405 :  // <0179> bn lt :else_1370
addr == 16'h55b ? 16'h0562 :  // <0179> "

addr == 16'h55c ? 16'h5e00 :  // <0180> ram $ram_o2_state = $o2_state_rich // av_ad_hi = 0
addr == 16'h55d ? 16'h62e6 :  // <0180> ram $ram_o2_state = $o2_state_rich // av_ad_lo = 230
addr == 16'h55e ? 16'h5602 :  // <0180> ram $ram_o2_state = $o2_state_rich // av_write_data = 2
addr == 16'h55f ? 16'h5e00 :  // <0181> ram $ram_o2_been_rich = 1 // av_ad_hi = 0
addr == 16'h560 ? 16'h62e8 :  // <0181> ram $ram_o2_been_rich = 1 // av_ad_lo = 232
addr == 16'h561 ? 16'h5601 :  // <0181> ram $ram_o2_been_rich = 1 // av_write_data = 1
// callx  set_text_flag  :o2_rich_msg



addr == 16'h562 ? 16'hfc00 :  // <0186> swapra = nop

// ######## func init_o2_state // = 0x0563

addr == 16'h563 ? 16'h5e00 :  // <0188> ram $ram_o2_state = $o2_state_init // av_ad_hi = 0
addr == 16'h564 ? 16'h62e6 :  // <0188> ram $ram_o2_state = $o2_state_init // av_ad_lo = 230
addr == 16'h565 ? 16'h5600 :  // <0188> ram $ram_o2_state = $o2_state_init // av_write_data = 0
addr == 16'h566 ? 16'h5e00 :  // <0189> ram $ram_o2_been_lean = 0 // av_ad_hi = 0
addr == 16'h567 ? 16'h62ea :  // <0189> ram $ram_o2_been_lean = 0 // av_ad_lo = 234
addr == 16'h568 ? 16'h5600 :  // <0189> ram $ram_o2_been_lean = 0 // av_write_data = 0
addr == 16'h569 ? 16'h5e00 :  // <0190> ram $ram_o2_been_rich = 0 // av_ad_hi = 0
addr == 16'h56a ? 16'h62e8 :  // <0190> ram $ram_o2_been_rich = 0 // av_ad_lo = 232
addr == 16'h56b ? 16'h5600 :  // <0190> ram $ram_o2_been_rich = 0 // av_write_data = 0

addr == 16'h56c ? 16'hfc00 :  // <0192> swapra = nop

// ######## func leave_learn_stoich // = 0x056d
addr == 16'h56d ? 16'h303e :  // <0195> push rtna // func leave_learn_stoich

addr == 16'h56e ? 16'hfba0 :  // <0194> callx  check_engine_stop  pa
addr == 16'h56f ? 16'h0c0b :  // <0194> "
addr == 16'h570 ? 16'hfc00 :  // <0194> "

addr == 16'h571 ? 16'hf80c :  // <0196> pop rtna // func leave_learn_stoich
addr == 16'h572 ? 16'hfc00 :  // <0196> swapra = nop

// ######## func find_rpm_cell // = 0x0573
addr == 16'h573 ? 16'h3002 :  // <0213> push i // func find_rpm_cell
addr == 16'h574 ? 16'h3003 :  // <0213> push j // "

addr == 16'h575 ? 16'h0a01 :  // <0198> i = 1
addr == 16'h576 ? 16'h0008 :  // <0199> a = rpm
addr == 16'h577 ? 16'h0760 :  // <0200> b = 0xffff
addr == 16'h578 ? 16'he007 :  // <0201> br eq :found
addr == 16'h579 ? 16'h0587 :  // <0201> "
// :next_cell // = 0x057a
addr == 16'h57a ? 16'h0fa0 :  // <0203> j = :rpm_cells
addr == 16'h57b ? 16'h044a :  // <0203> "
addr == 16'h57c ? 16'hc800 :  // <0204> fetch a from i+j
addr == 16'h57d ? 16'hd310 :  // <0204> "
addr == 16'h57e ? 16'h03b0 :  // <0204> "
addr == 16'h57f ? 16'h0408 :  // <0205> b = rpm
addr == 16'h580 ? 16'he006 :  // <0206> br gt :found
addr == 16'h581 ? 16'h0587 :  // <0206> "
addr == 16'h582 ? 16'h0e01 :  // <0207> j = 1
addr == 16'h583 ? 16'hc800 :  // <0208> i = i+j
addr == 16'h584 ? 16'h0b10 :  // <0208> "
addr == 16'h585 ? 16'he00f :  // <0209> jmp :next_cell
addr == 16'h586 ? 16'h057a :  // <0209> "
// :found // = 0x0587
addr == 16'h587 ? 16'h0f60 :  // <0211> j = -1
addr == 16'h588 ? 16'hc800 :  // <0212> cell = i+j
addr == 16'h589 ? 16'h2310 :  // <0212> "
addr == 16'h58a ? 16'h0c0c :  // <0212> pop j // rtn i+j
addr == 16'h58b ? 16'h080c :  // <0212> pop i // "
addr == 16'h58c ? 16'hfc00 :  // <0211> swapra = nop

addr == 16'h58d ? 16'h0c0c :  // <0214> pop j // func find_rpm_cell
addr == 16'h58e ? 16'h080c :  // <0214> pop i // "
addr == 16'h58f ? 16'hfc00 :  // <0214> swapra = nop

// ######## func dump_smap_cmd // = 0x0590
addr == 16'h590 ? 16'h3004 :  // <0253> push x // func dump_smap_cmd
addr == 16'h591 ? 16'h303e :  // <0253> push rtna // "

addr == 16'h592 ? 16'h020d :  // <0216> a = 13 // puteol
addr == 16'h593 ? 16'hfba0 :  // <0216> puteol
addr == 16'h594 ? 16'h009b :  // <0216> "
addr == 16'h595 ? 16'hfc00 :  // <0216> "
addr == 16'h596 ? 16'h020a :  // <0216> a = 10 // puteol
addr == 16'h597 ? 16'hfba0 :  // <0216> puteol
addr == 16'h598 ? 16'h009b :  // <0216> "
addr == 16'h599 ? 16'hfc00 :  // <0216> "
addr == 16'h59a ? 16'h5e00 :  // <0217> ram pa = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h59b ? 16'h627c :  // <0217> ram pa = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h59c ? 16'h2015 :  // <0217> ram pa = $ram_avg_rpm // pa = av_write_data // start read cycle
addr == 16'h59d ? 16'h2016 :  // <0217> ram pa = $ram_avg_rpm // pa = av_read_data // finish read cycle
addr == 16'h59e ? 16'hfba0 :  // <0218> callx  find_rpm_cell  pa  pa
addr == 16'h59f ? 16'h0573 :  // <0218> "
addr == 16'h5a0 ? 16'hfc00 :  // <0218> "
addr == 16'h5a1 ? 16'h1200 :  // <0228> x = 0
// :loop_1441 // = 0x05a2

addr == 16'h5a2 ? 16'h0004 :  // <0219> a = x

addr == 16'h5a3 ? 16'h0351 :  // <0220> a = a<<1
addr == 16'h5a4 ? 16'h0698 :  // <0220> b = 152
addr == 16'h5a5 ? 16'h5e00 :  // <0220> av_ad_hi = 0
addr == 16'h5a6 ? 16'h6300 :  // <0220> av_ad_lo = ad0
addr == 16'h5a7 ? 16'h0415 :  // <0220> b = av_write_data
addr == 16'h5a8 ? 16'h0416 :  // <0220> b = av_read_data

addr == 16'h5a9 ? 16'h0001 :  // <0221> a = b
addr == 16'h5aa ? 16'hfba0 :  // <0222> call put4x
addr == 16'h5ab ? 16'h00c3 :  // <0222> "
addr == 16'h5ac ? 16'hfc00 :  // <0222> "

addr == 16'h5ad ? 16'h0004 :  // <0225> a = x
addr == 16'h5ae ? 16'h0408 :  // <0225> b = pa

addr == 16'h5af ? 16'he407 :  // <0223> bn eq :else_1455
addr == 16'h5b0 ? 16'h05b5 :  // <0223> "

addr == 16'h5b1 ? 16'h023c :  // <0224> a = 60 // putasc "<"
addr == 16'h5b2 ? 16'hfba0 :  // <0224> putasc "<"
addr == 16'h5b3 ? 16'h009b :  // <0224> "
addr == 16'h5b4 ? 16'hfc00 :  // <0224> "

addr == 16'h5b5 ? 16'h0220 :  // <0226> a = 32 // putasc " "
addr == 16'h5b6 ? 16'hfba0 :  // <0226> putasc " "
addr == 16'h5b7 ? 16'h009b :  // <0226> "
addr == 16'h5b8 ? 16'hfc00 :  // <0226> "


addr == 16'h5b9 ? 16'h0004 :  // <0228> a = x
addr == 16'h5ba ? 16'h0601 :  // <0228> b = 1
addr == 16'h5bb ? 16'hc800 :  // <0228> x = a+b
addr == 16'h5bc ? 16'h1300 :  // <0228> "


addr == 16'h5bd ? 16'h0004 :  // <0228> a = x
addr == 16'h5be ? 16'h060d :  // <0228> b = $num_rpm_cells
addr == 16'h5bf ? 16'he005 :  // <0228> br lt :loop_1441
addr == 16'h5c0 ? 16'h05a2 :  // <0228> "

// :end_1441 // = 0x05c1
addr == 16'h5c1 ? 16'h020d :  // <0229> a = 13 // puteol
addr == 16'h5c2 ? 16'hfba0 :  // <0229> puteol
addr == 16'h5c3 ? 16'h009b :  // <0229> "
addr == 16'h5c4 ? 16'hfc00 :  // <0229> "
addr == 16'h5c5 ? 16'h020a :  // <0229> a = 10 // puteol
addr == 16'h5c6 ? 16'hfba0 :  // <0229> puteol
addr == 16'h5c7 ? 16'h009b :  // <0229> "
addr == 16'h5c8 ? 16'hfc00 :  // <0229> "
addr == 16'h5c9 ? 16'h1200 :  // <0239> x = 0
// :loop_1481 // = 0x05ca

addr == 16'h5ca ? 16'h0004 :  // <0230> a = x

addr == 16'h5cb ? 16'h0351 :  // <0231> a = a<<1
addr == 16'h5cc ? 16'h06b4 :  // <0231> b = 180
addr == 16'h5cd ? 16'h5e00 :  // <0231> av_ad_hi = 0
addr == 16'h5ce ? 16'h6300 :  // <0231> av_ad_lo = ad0
addr == 16'h5cf ? 16'h0415 :  // <0231> b = av_write_data
addr == 16'h5d0 ? 16'h0416 :  // <0231> b = av_read_data

addr == 16'h5d1 ? 16'h0001 :  // <0232> a = b
addr == 16'h5d2 ? 16'hfba0 :  // <0233> call put4x
addr == 16'h5d3 ? 16'h00c3 :  // <0233> "
addr == 16'h5d4 ? 16'hfc00 :  // <0233> "

addr == 16'h5d5 ? 16'h0004 :  // <0236> a = x
addr == 16'h5d6 ? 16'h0408 :  // <0236> b = pa

addr == 16'h5d7 ? 16'he407 :  // <0234> bn eq :else_1495
addr == 16'h5d8 ? 16'h05dd :  // <0234> "

addr == 16'h5d9 ? 16'h023c :  // <0235> a = 60 // putasc "<"
addr == 16'h5da ? 16'hfba0 :  // <0235> putasc "<"
addr == 16'h5db ? 16'h009b :  // <0235> "
addr == 16'h5dc ? 16'hfc00 :  // <0235> "

addr == 16'h5dd ? 16'h0220 :  // <0237> a = 32 // putasc " "
addr == 16'h5de ? 16'hfba0 :  // <0237> putasc " "
addr == 16'h5df ? 16'h009b :  // <0237> "
addr == 16'h5e0 ? 16'hfc00 :  // <0237> "


addr == 16'h5e1 ? 16'h0004 :  // <0239> a = x
addr == 16'h5e2 ? 16'h0601 :  // <0239> b = 1
addr == 16'h5e3 ? 16'hc800 :  // <0239> x = a+b
addr == 16'h5e4 ? 16'h1300 :  // <0239> "


addr == 16'h5e5 ? 16'h0004 :  // <0239> a = x
addr == 16'h5e6 ? 16'h060d :  // <0239> b = $num_tps_cells
addr == 16'h5e7 ? 16'he005 :  // <0239> br lt :loop_1481
addr == 16'h5e8 ? 16'h05ca :  // <0239> "

// :end_1481 // = 0x05e9
addr == 16'h5e9 ? 16'h020d :  // <0240> a = 13 // puteol
addr == 16'h5ea ? 16'hfba0 :  // <0240> puteol
addr == 16'h5eb ? 16'h009b :  // <0240> "
addr == 16'h5ec ? 16'hfc00 :  // <0240> "
addr == 16'h5ed ? 16'h020a :  // <0240> a = 10 // puteol
addr == 16'h5ee ? 16'hfba0 :  // <0240> puteol
addr == 16'h5ef ? 16'h009b :  // <0240> "
addr == 16'h5f0 ? 16'hfc00 :  // <0240> "
addr == 16'h5f1 ? 16'h5e00 :  // <0241> ram pa = $ram_tps_state // av_ad_hi = 0
addr == 16'h5f2 ? 16'h62ce :  // <0241> ram pa = $ram_tps_state // av_ad_lo = 206
addr == 16'h5f3 ? 16'h2015 :  // <0241> ram pa = $ram_tps_state // pa = av_write_data // start read cycle
addr == 16'h5f4 ? 16'h2016 :  // <0241> ram pa = $ram_tps_state // pa = av_read_data // finish read cycle
addr == 16'h5f5 ? 16'h1200 :  // <0251> x = 0
// :loop_1525 // = 0x05f6

addr == 16'h5f6 ? 16'h0004 :  // <0242> a = x

addr == 16'h5f7 ? 16'h0351 :  // <0243> a = a<<1
addr == 16'h5f8 ? 16'h06d0 :  // <0243> b = 208
addr == 16'h5f9 ? 16'h5e00 :  // <0243> av_ad_hi = 0
addr == 16'h5fa ? 16'h6300 :  // <0243> av_ad_lo = ad0
addr == 16'h5fb ? 16'h0415 :  // <0243> b = av_write_data
addr == 16'h5fc ? 16'h0416 :  // <0243> b = av_read_data

addr == 16'h5fd ? 16'h0001 :  // <0244> a = b
addr == 16'h5fe ? 16'hfba0 :  // <0245> call put4x
addr == 16'h5ff ? 16'h00c3 :  // <0245> "
addr == 16'h600 ? 16'hfc00 :  // <0245> "

addr == 16'h601 ? 16'h0004 :  // <0248> a = x
addr == 16'h602 ? 16'h0408 :  // <0248> b = pa

addr == 16'h603 ? 16'he407 :  // <0246> bn eq :else_1539
addr == 16'h604 ? 16'h0609 :  // <0246> "

addr == 16'h605 ? 16'h023c :  // <0247> a = 60 // putasc "<"
addr == 16'h606 ? 16'hfba0 :  // <0247> putasc "<"
addr == 16'h607 ? 16'h009b :  // <0247> "
addr == 16'h608 ? 16'hfc00 :  // <0247> "

addr == 16'h609 ? 16'h0220 :  // <0249> a = 32 // putasc " "
addr == 16'h60a ? 16'hfba0 :  // <0249> putasc " "
addr == 16'h60b ? 16'h009b :  // <0249> "
addr == 16'h60c ? 16'hfc00 :  // <0249> "


addr == 16'h60d ? 16'h0004 :  // <0251> a = x
addr == 16'h60e ? 16'h0601 :  // <0251> b = 1
addr == 16'h60f ? 16'hc800 :  // <0251> x = a+b
addr == 16'h610 ? 16'h1300 :  // <0251> "


addr == 16'h611 ? 16'h0004 :  // <0251> a = x
addr == 16'h612 ? 16'h0605 :  // <0251> b = $num_tps_states
addr == 16'h613 ? 16'he005 :  // <0251> br lt :loop_1525
addr == 16'h614 ? 16'h05f6 :  // <0251> "

// :end_1525 // = 0x0615
addr == 16'h615 ? 16'h020d :  // <0252> a = 13 // puteol
addr == 16'h616 ? 16'hfba0 :  // <0252> puteol
addr == 16'h617 ? 16'h009b :  // <0252> "
addr == 16'h618 ? 16'hfc00 :  // <0252> "
addr == 16'h619 ? 16'h020a :  // <0252> a = 10 // puteol
addr == 16'h61a ? 16'hfba0 :  // <0252> puteol
addr == 16'h61b ? 16'h009b :  // <0252> "
addr == 16'h61c ? 16'hfc00 :  // <0252> "

addr == 16'h61d ? 16'hf80c :  // <0254> pop rtna // func dump_smap_cmd
addr == 16'h61e ? 16'h100c :  // <0254> pop x // "
addr == 16'h61f ? 16'hfc00 :  // <0254> swapra = nop

// ######## func load_tps_enrich_cmd // = 0x0620
addr == 16'h620 ? 16'h3002 :  // <0263> push i // func load_tps_enrich_cmd
addr == 16'h621 ? 16'h303e :  // <0263> push rtna // "

addr == 16'h622 ? 16'h0a00 :  // <0262> i = 0
// :loop_1570 // = 0x0623

addr == 16'h623 ? 16'hfba0 :  // <0256> call  get4x
addr == 16'h624 ? 16'h00fc :  // <0256> "
addr == 16'h625 ? 16'hfc00 :  // <0256> "
addr == 16'h626 ? 16'h0400 :  // <0257> b = a
addr == 16'h627 ? 16'h0002 :  // <0258> a = i

addr == 16'h628 ? 16'h0351 :  // <0259> a = a<<1
addr == 16'h629 ? 16'h3001 :  // <0259> push b // push b
addr == 16'h62a ? 16'h06d0 :  // <0259> b = 208
addr == 16'h62b ? 16'h5e00 :  // <0259> av_ad_hi = 0
addr == 16'h62c ? 16'h6300 :  // <0259> av_ad_lo = ad0
addr == 16'h62d ? 16'h540c :  // <0259> pop av_write_data // pop av_write_data

addr == 16'h62e ? 16'hfba0 :  // <0260> getchar
addr == 16'h62f ? 16'h00a4 :  // <0260> "
addr == 16'h630 ? 16'hfc00 :  // <0260> "


addr == 16'h631 ? 16'h0002 :  // <0262> a = i
addr == 16'h632 ? 16'h0601 :  // <0262> b = 1
addr == 16'h633 ? 16'hc800 :  // <0262> i = a+b
addr == 16'h634 ? 16'h0b00 :  // <0262> "


addr == 16'h635 ? 16'h0002 :  // <0262> a = i
addr == 16'h636 ? 16'h0605 :  // <0262> b = $num_tps_states
addr == 16'h637 ? 16'he005 :  // <0262> br lt :loop_1570
addr == 16'h638 ? 16'h0623 :  // <0262> "

// :end_1570 // = 0x0639

addr == 16'h639 ? 16'hf80c :  // <0264> pop rtna // func load_tps_enrich_cmd
addr == 16'h63a ? 16'h080c :  // <0264> pop i // "
addr == 16'h63b ? 16'hfc00 :  // <0264> swapra = nop

// ######## func load_smap_cmd // = 0x063c
addr == 16'h63c ? 16'h3002 :  // <0273> push i // func load_smap_cmd
addr == 16'h63d ? 16'h303e :  // <0273> push rtna // "

addr == 16'h63e ? 16'h0a00 :  // <0272> i = 0
// :loop_1598 // = 0x063f

addr == 16'h63f ? 16'hfba0 :  // <0266> call  get4x
addr == 16'h640 ? 16'h00fc :  // <0266> "
addr == 16'h641 ? 16'hfc00 :  // <0266> "
addr == 16'h642 ? 16'h0400 :  // <0267> b = a
addr == 16'h643 ? 16'h0002 :  // <0268> a = i

addr == 16'h644 ? 16'h0351 :  // <0269> a = a<<1
addr == 16'h645 ? 16'h3001 :  // <0269> push b // push b
addr == 16'h646 ? 16'h0698 :  // <0269> b = 152
addr == 16'h647 ? 16'h5e00 :  // <0269> av_ad_hi = 0
addr == 16'h648 ? 16'h6300 :  // <0269> av_ad_lo = ad0
addr == 16'h649 ? 16'h540c :  // <0269> pop av_write_data // pop av_write_data

addr == 16'h64a ? 16'hfba0 :  // <0270> getchar
addr == 16'h64b ? 16'h00a4 :  // <0270> "
addr == 16'h64c ? 16'hfc00 :  // <0270> "


addr == 16'h64d ? 16'h0002 :  // <0272> a = i
addr == 16'h64e ? 16'h0601 :  // <0272> b = 1
addr == 16'h64f ? 16'hc800 :  // <0272> i = a+b
addr == 16'h650 ? 16'h0b00 :  // <0272> "


addr == 16'h651 ? 16'h0002 :  // <0272> a = i
addr == 16'h652 ? 16'h060d :  // <0272> b = $num_rpm_cells
addr == 16'h653 ? 16'he005 :  // <0272> br lt :loop_1598
addr == 16'h654 ? 16'h063f :  // <0272> "

// :end_1598 // = 0x0655

addr == 16'h655 ? 16'hf80c :  // <0274> pop rtna // func load_smap_cmd
addr == 16'h656 ? 16'h080c :  // <0274> pop i // "
addr == 16'h657 ? 16'hfc00 :  // <0274> swapra = nop

// ######## func clear_smap_cmd // = 0x0658
addr == 16'h658 ? 16'h3002 :  // <0281> push i // func clear_smap_cmd

addr == 16'h659 ? 16'h0a00 :  // <0280> i = 0
// :loop_1625 // = 0x065a

addr == 16'h65a ? 16'h0002 :  // <0276> a = i
addr == 16'h65b ? 16'h07a0 :  // <0277> b = 3000
addr == 16'h65c ? 16'h0bb8 :  // <0277> "

addr == 16'h65d ? 16'h0351 :  // <0278> a = a<<1
addr == 16'h65e ? 16'h3001 :  // <0278> push b // push b
addr == 16'h65f ? 16'h0698 :  // <0278> b = 152
addr == 16'h660 ? 16'h5e00 :  // <0278> av_ad_hi = 0
addr == 16'h661 ? 16'h6300 :  // <0278> av_ad_lo = ad0
addr == 16'h662 ? 16'h540c :  // <0278> pop av_write_data // pop av_write_data



addr == 16'h663 ? 16'h0002 :  // <0280> a = i
addr == 16'h664 ? 16'h0601 :  // <0280> b = 1
addr == 16'h665 ? 16'hc800 :  // <0280> i = a+b
addr == 16'h666 ? 16'h0b00 :  // <0280> "


addr == 16'h667 ? 16'h0002 :  // <0280> a = i
addr == 16'h668 ? 16'h060d :  // <0280> b = $num_rpm_cells
addr == 16'h669 ? 16'he005 :  // <0280> br lt :loop_1625
addr == 16'h66a ? 16'h065a :  // <0280> "

// :end_1625 // = 0x066b

addr == 16'h66b ? 16'h080c :  // <0282> pop i // func clear_smap_cmd
addr == 16'h66c ? 16'hfc00 :  // <0282> swapra = nop

// ######## func load_tps_ref_cmd // = 0x066d
addr == 16'h66d ? 16'h3002 :  // <0294> push i // func load_tps_ref_cmd
addr == 16'h66e ? 16'h3006 :  // <0294> push ga // "
addr == 16'h66f ? 16'h303e :  // <0294> push rtna // "

addr == 16'h670 ? 16'h0a00 :  // <0293> i = 0
// :loop_1648 // = 0x0671

addr == 16'h671 ? 16'hfba0 :  // <0284> call  get4x
addr == 16'h672 ? 16'h00fc :  // <0284> "
addr == 16'h673 ? 16'hfc00 :  // <0284> "
addr == 16'h674 ? 16'h1800 :  // <0285> ga = a
addr == 16'h675 ? 16'h0400 :  // <0286> b = a
addr == 16'h676 ? 16'h0002 :  // <0287> a = i

addr == 16'h677 ? 16'h0351 :  // <0288> a = a<<1
addr == 16'h678 ? 16'h3001 :  // <0288> push b // push b
addr == 16'h679 ? 16'h06b4 :  // <0288> b = 180
addr == 16'h67a ? 16'h5e00 :  // <0288> av_ad_hi = 0
addr == 16'h67b ? 16'h6300 :  // <0288> av_ad_lo = ad0
addr == 16'h67c ? 16'h540c :  // <0288> pop av_write_data // pop av_write_data

addr == 16'h67d ? 16'h0006 :  // <0289> a = ga
addr == 16'h67e ? 16'hfba0 :  // <0290> call put4x
addr == 16'h67f ? 16'h00c3 :  // <0290> "
addr == 16'h680 ? 16'hfc00 :  // <0290> "
addr == 16'h681 ? 16'hfba0 :  // <0291> getchar
addr == 16'h682 ? 16'h00a4 :  // <0291> "
addr == 16'h683 ? 16'hfc00 :  // <0291> "


addr == 16'h684 ? 16'h0002 :  // <0293> a = i
addr == 16'h685 ? 16'h0601 :  // <0293> b = 1
addr == 16'h686 ? 16'hc800 :  // <0293> i = a+b
addr == 16'h687 ? 16'h0b00 :  // <0293> "


addr == 16'h688 ? 16'h0002 :  // <0293> a = i
addr == 16'h689 ? 16'h060d :  // <0293> b = $num_tps_cells
addr == 16'h68a ? 16'he005 :  // <0293> br lt :loop_1648
addr == 16'h68b ? 16'h0671 :  // <0293> "

// :end_1648 // = 0x068c

addr == 16'h68c ? 16'hf80c :  // <0295> pop rtna // func load_tps_ref_cmd
addr == 16'h68d ? 16'h180c :  // <0295> pop ga // "
addr == 16'h68e ? 16'h080c :  // <0295> pop i // "
addr == 16'h68f ? 16'hfc00 :  // <0295> swapra = nop

// ######## func learn_tps_ref_cmd // = 0x0690
addr == 16'h690 ? 16'h303e :  // <0301> push rtna // func learn_tps_ref_cmd

addr == 16'h691 ? 16'h5e00 :  // <0297> ram pa = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h692 ? 16'h627c :  // <0297> ram pa = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h693 ? 16'h2015 :  // <0297> ram pa = $ram_avg_rpm // pa = av_write_data // start read cycle
addr == 16'h694 ? 16'h2016 :  // <0297> ram pa = $ram_avg_rpm // pa = av_read_data // finish read cycle
addr == 16'h695 ? 16'hfba0 :  // <0298> callx  find_rpm_cell  pa  a
addr == 16'h696 ? 16'h0573 :  // <0298> "
addr == 16'h697 ? 16'hfc00 :  // <0298> "
addr == 16'h698 ? 16'h0008 :  // <0298> a = pa
addr == 16'h699 ? 16'h5e00 :  // <0299> ram b = $ram_tps_avg // av_ad_hi = 0
addr == 16'h69a ? 16'h62da :  // <0299> ram b = $ram_tps_avg // av_ad_lo = 218
addr == 16'h69b ? 16'h0415 :  // <0299> ram b = $ram_tps_avg // b = av_write_data // start read cycle
addr == 16'h69c ? 16'h0416 :  // <0299> ram b = $ram_tps_avg // b = av_read_data // finish read cycle

addr == 16'h69d ? 16'h0351 :  // <0300> a = a<<1
addr == 16'h69e ? 16'h3001 :  // <0300> push b // push b
addr == 16'h69f ? 16'h06b4 :  // <0300> b = 180
addr == 16'h6a0 ? 16'h5e00 :  // <0300> av_ad_hi = 0
addr == 16'h6a1 ? 16'h6300 :  // <0300> av_ad_lo = ad0
addr == 16'h6a2 ? 16'h540c :  // <0300> pop av_write_data // pop av_write_data


addr == 16'h6a3 ? 16'hf80c :  // <0302> pop rtna // func learn_tps_ref_cmd
addr == 16'h6a4 ? 16'hfc00 :  // <0302> swapra = nop


// :plan_name_run // = 0x06a5
// "RN\x0"
addr == 16'h6a5 ? 16'h4e52 :  // <0002> NR
addr == 16'h6a6 ? 16'h0000 :  // <0002>   


// max trim is about 200 thou prior to multiplier overflow.
// or more if the smap puff is below 8000.
// trim resolution is 4 thou due to multiplier.
// smap resolution for trimming is 16 us.
// final trim enrichment us resolution is 16 us.

// ######## func trim_lean_cmd // = 0x06a7

addr == 16'h6a7 ? 16'h5e00 :  // <0016> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h6a8 ? 16'h62ec :  // <0016> ram a = $ram_run_manual_trim_thou // av_ad_lo = 236
addr == 16'h6a9 ? 16'h0015 :  // <0016> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h6aa ? 16'h0016 :  // <0016> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle

addr == 16'h6ab ? 16'h0000 :  // <0021> a = a
addr == 16'h6ac ? 16'h0600 :  // <0021> b = 0

addr == 16'h6ad ? 16'he7a0 :  // <0017> bn = :else_1709
addr == 16'h6ae ? 16'h06b1 :  // <0017> "


addr == 16'h6af ? 16'he00f :  // <0019> jmp :end_1709
addr == 16'h6b0 ? 16'h06b7 :  // <0019> "

addr == 16'h6b1 ? 16'h07a0 :  // <0020> b = (($run_manual_trim_step_thou ^ 0xffff) + 1)
addr == 16'h6b2 ? 16'hfffc :  // <0020> "
addr == 16'h6b3 ? 16'h5e00 :  // <0021> ram $ram_run_manual_trim_thou = a+b // av_ad_hi = 0
addr == 16'h6b4 ? 16'h62ec :  // <0021> ram $ram_run_manual_trim_thou = a+b // av_ad_lo = 236
addr == 16'h6b5 ? 16'hc800 :  // <0021> ram $ram_run_manual_trim_thou = a+b // av_write_data = a+b
addr == 16'h6b6 ? 16'h5700 :  // <0021> "


addr == 16'h6b7 ? 16'hfc00 :  // <0023> swapra = nop

// ######## func trim_rich_cmd // = 0x06b8

addr == 16'h6b8 ? 16'h5e00 :  // <0025> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h6b9 ? 16'h62ec :  // <0025> ram a = $ram_run_manual_trim_thou // av_ad_lo = 236
addr == 16'h6ba ? 16'h0015 :  // <0025> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h6bb ? 16'h0016 :  // <0025> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle

addr == 16'h6bc ? 16'h0000 :  // <0030> a = a
addr == 16'h6bd ? 16'h07a0 :  // <0030> b = 800
addr == 16'h6be ? 16'h0320 :  // <0030> "

addr == 16'h6bf ? 16'he406 :  // <0026> bn gt :else_1727
addr == 16'h6c0 ? 16'h06c3 :  // <0026> "


addr == 16'h6c1 ? 16'he00f :  // <0028> jmp :end_1727
addr == 16'h6c2 ? 16'h06c8 :  // <0028> "

addr == 16'h6c3 ? 16'h0604 :  // <0029> b = $run_manual_trim_step_thou
addr == 16'h6c4 ? 16'h5e00 :  // <0030> ram $ram_run_manual_trim_thou = a+b // av_ad_hi = 0
addr == 16'h6c5 ? 16'h62ec :  // <0030> ram $ram_run_manual_trim_thou = a+b // av_ad_lo = 236
addr == 16'h6c6 ? 16'hc800 :  // <0030> ram $ram_run_manual_trim_thou = a+b // av_write_data = a+b
addr == 16'h6c7 ? 16'h5700 :  // <0030> "


addr == 16'h6c8 ? 16'hfc00 :  // <0032> swapra = nop

// ######## func trim_2lean_cmd // = 0x06c9

addr == 16'h6c9 ? 16'h5e00 :  // <0034> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h6ca ? 16'h62ec :  // <0034> ram a = $ram_run_manual_trim_thou // av_ad_lo = 236
addr == 16'h6cb ? 16'h0015 :  // <0034> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h6cc ? 16'h0016 :  // <0034> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle

addr == 16'h6cd ? 16'h0000 :  // <0039> a = a
addr == 16'h6ce ? 16'h0600 :  // <0039> b = 0

addr == 16'h6cf ? 16'he7a0 :  // <0035> bn = :else_1743
addr == 16'h6d0 ? 16'h06d3 :  // <0035> "


addr == 16'h6d1 ? 16'he00f :  // <0037> jmp :end_1743
addr == 16'h6d2 ? 16'h06d9 :  // <0037> "

addr == 16'h6d3 ? 16'h07a0 :  // <0038> b = ((($run_manual_trim_step_thou << 3) ^ 0xffff) + 1)
addr == 16'h6d4 ? 16'hffe0 :  // <0038> "
addr == 16'h6d5 ? 16'h5e00 :  // <0039> ram $ram_run_manual_trim_thou = a+b // av_ad_hi = 0
addr == 16'h6d6 ? 16'h62ec :  // <0039> ram $ram_run_manual_trim_thou = a+b // av_ad_lo = 236
addr == 16'h6d7 ? 16'hc800 :  // <0039> ram $ram_run_manual_trim_thou = a+b // av_write_data = a+b
addr == 16'h6d8 ? 16'h5700 :  // <0039> "


addr == 16'h6d9 ? 16'hfc00 :  // <0041> swapra = nop

// ######## func trim_2rich_cmd // = 0x06da

addr == 16'h6da ? 16'h5e00 :  // <0043> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h6db ? 16'h62ec :  // <0043> ram a = $ram_run_manual_trim_thou // av_ad_lo = 236
addr == 16'h6dc ? 16'h0015 :  // <0043> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h6dd ? 16'h0016 :  // <0043> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle

addr == 16'h6de ? 16'h0000 :  // <0048> a = a
addr == 16'h6df ? 16'h07a0 :  // <0048> b = 800
addr == 16'h6e0 ? 16'h0320 :  // <0048> "

addr == 16'h6e1 ? 16'he406 :  // <0044> bn gt :else_1761
addr == 16'h6e2 ? 16'h06e5 :  // <0044> "


addr == 16'h6e3 ? 16'he00f :  // <0046> jmp :end_1761
addr == 16'h6e4 ? 16'h06ea :  // <0046> "

addr == 16'h6e5 ? 16'h0620 :  // <0047> b = ($run_manual_trim_step_thou << 3)
addr == 16'h6e6 ? 16'h5e00 :  // <0048> ram $ram_run_manual_trim_thou = a+b // av_ad_hi = 0
addr == 16'h6e7 ? 16'h62ec :  // <0048> ram $ram_run_manual_trim_thou = a+b // av_ad_lo = 236
addr == 16'h6e8 ? 16'hc800 :  // <0048> ram $ram_run_manual_trim_thou = a+b // av_write_data = a+b
addr == 16'h6e9 ? 16'h5700 :  // <0048> "


addr == 16'h6ea ? 16'hfc00 :  // <0050> swapra = nop

// ######## func init_plan_run // = 0x06eb

// set up the run plan.
addr == 16'h6eb ? 16'h5e00 :  // <0053> ram $ram_run_manual_trim_thou = 0 // av_ad_hi = 0
addr == 16'h6ec ? 16'h62ec :  // <0053> ram $ram_run_manual_trim_thou = 0 // av_ad_lo = 236
addr == 16'h6ed ? 16'h5600 :  // <0053> ram $ram_run_manual_trim_thou = 0 // av_write_data = 0

// memorize state.
addr == 16'h6ee ? 16'h5e00 :  // <0056> ram $ram_plan_name = :plan_name_run // av_ad_hi = 0
addr == 16'h6ef ? 16'h6288 :  // <0056> ram $ram_plan_name = :plan_name_run // av_ad_lo = 136
addr == 16'h6f0 ? 16'h57a0 :  // <0056> ram $ram_plan_name = :plan_name_run // av_write_data = :plan_name_run
addr == 16'h6f1 ? 16'h06a5 :  // <0056> "
addr == 16'h6f2 ? 16'h5e00 :  // <0057> ram $ram_puff_len_func = :puff_len_run // av_ad_hi = 0
addr == 16'h6f3 ? 16'h628a :  // <0057> ram $ram_puff_len_func = :puff_len_run // av_ad_lo = 138
addr == 16'h6f4 ? 16'h57a0 :  // <0057> ram $ram_puff_len_func = :puff_len_run // av_write_data = :puff_len_run
addr == 16'h6f5 ? 16'h0706 :  // <0057> "
addr == 16'h6f6 ? 16'h5e00 :  // <0058> ram $ram_transition_func = :leave_run // av_ad_hi = 0
addr == 16'h6f7 ? 16'h628c :  // <0058> ram $ram_transition_func = :leave_run // av_ad_lo = 140
addr == 16'h6f8 ? 16'h57a0 :  // <0058> ram $ram_transition_func = :leave_run // av_write_data = :leave_run
addr == 16'h6f9 ? 16'h0764 :  // <0058> "
addr == 16'h6fa ? 16'h5e00 :  // <0059> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_hi = 0
addr == 16'h6fb ? 16'h628e :  // <0059> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_lo = 142
addr == 16'h6fc ? 16'h57a0 :  // <0059> ram $ram_destroy_plan_func = :destroy_plan_run // av_write_data = :destroy_plan_run
addr == 16'h6fd ? 16'h06ff :  // <0059> "

addr == 16'h6fe ? 16'hfc00 :  // <0061> swapra = nop

// ######## func destroy_plan_run // = 0x06ff


addr == 16'h6ff ? 16'hfc00 :  // <0064> swapra = nop

// :tps_accel2_msg // = 0x0700
// "tpsa2\x0"
addr == 16'h700 ? 16'h7074 :  // <0066> pt
addr == 16'h701 ? 16'h6173 :  // <0066> as
addr == 16'h702 ? 16'h0032 :  // <0066>  2
// :tps_open_msg // = 0x0703
// "tpsop\x0"
addr == 16'h703 ? 16'h7074 :  // <0068> pt
addr == 16'h704 ? 16'h6f73 :  // <0068> os
addr == 16'h705 ? 16'h0070 :  // <0068>  p

// ######## func puff_len_run // = 0x0706
addr == 16'h706 ? 16'h3004 :  // <0123> push x // func puff_len_run
addr == 16'h707 ? 16'h3006 :  // <0123> push ga // "
addr == 16'h708 ? 16'h303e :  // <0123> push rtna // "

addr == 16'h709 ? 16'h5e00 :  // <0071> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h70a ? 16'h627e :  // <0071> ram a = $ram_rpm_valid // av_ad_lo = 126
addr == 16'h70b ? 16'h0015 :  // <0071> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h70c ? 16'h0016 :  // <0071> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle

addr == 16'h70d ? 16'h0000 :  // <0122> a = a
addr == 16'h70e ? 16'h0601 :  // <0122> b = 1

addr == 16'h70f ? 16'he407 :  // <0072> bn eq :else_1807
addr == 16'h710 ? 16'h0760 :  // <0072> "

// read smap puff into ga
addr == 16'h711 ? 16'h5e00 :  // <0074> ram pa = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h712 ? 16'h627c :  // <0074> ram pa = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h713 ? 16'h2015 :  // <0074> ram pa = $ram_avg_rpm // pa = av_write_data // start read cycle
addr == 16'h714 ? 16'h2016 :  // <0074> ram pa = $ram_avg_rpm // pa = av_read_data // finish read cycle
addr == 16'h715 ? 16'hfba0 :  // <0075> callx  find_rpm_cell  pa  a
addr == 16'h716 ? 16'h0573 :  // <0075> "
addr == 16'h717 ? 16'hfc00 :  // <0075> "
addr == 16'h718 ? 16'h0008 :  // <0075> a = pa

addr == 16'h719 ? 16'h0351 :  // <0076> a = a<<1
addr == 16'h71a ? 16'h0698 :  // <0076> b = 152
addr == 16'h71b ? 16'h5e00 :  // <0076> av_ad_hi = 0
addr == 16'h71c ? 16'h6300 :  // <0076> av_ad_lo = ad0
addr == 16'h71d ? 16'h0415 :  // <0076> b = av_write_data
addr == 16'h71e ? 16'h0416 :  // <0076> b = av_read_data

addr == 16'h71f ? 16'h1801 :  // <0077> ga = b

// calculate manual enrichment in us.  apply a total of 10 bits of right-shift to
// implement division by 1024 (thou unit).  spread them out to prevent overflow.
addr == 16'h720 ? 16'h5e00 :  // <0081> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h721 ? 16'h62ec :  // <0081> ram a = $ram_run_manual_trim_thou // av_ad_lo = 236
addr == 16'h722 ? 16'h0015 :  // <0081> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h723 ? 16'h0016 :  // <0081> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle
addr == 16'h724 ? 16'h0350 :  // <0082> a = a>>1
addr == 16'h725 ? 16'h0750 :  // <0083> b = a>>1
addr == 16'h726 ? 16'h0006 :  // <0084> a = ga
addr == 16'h727 ? 16'h0353 :  // <0085> a = a>>4
addr == 16'h728 ? 16'hfba0 :  // <0086> call  multiply
addr == 16'h729 ? 16'h0170 :  // <0086> "
addr == 16'h72a ? 16'hfc00 :  // <0086> "
addr == 16'h72b ? 16'h0353 :  // <0087> a = a>>4

// add enrichment to smap puff.
addr == 16'h72c ? 16'h0406 :  // <0090> b = ga
addr == 16'h72d ? 16'hc800 :  // <0091> ga = a+b
addr == 16'h72e ? 16'h1b00 :  // <0091> "

// determine TPS enrichment for acceleration.
addr == 16'h72f ? 16'h1a00 :  // <0094> ga = 0
addr == 16'h730 ? 16'h5e00 :  // <0095> ram x = $ram_tps_state // av_ad_hi = 0
addr == 16'h731 ? 16'h62ce :  // <0095> ram x = $ram_tps_state // av_ad_lo = 206
addr == 16'h732 ? 16'h1015 :  // <0095> ram x = $ram_tps_state // x = av_write_data // start read cycle
addr == 16'h733 ? 16'h1016 :  // <0095> ram x = $ram_tps_state // x = av_read_data // finish read cycle

addr == 16'h734 ? 16'h0004 :  // <0098> a = x
addr == 16'h735 ? 16'h0603 :  // <0098> b = 3

addr == 16'h736 ? 16'he407 :  // <0096> bn eq :else_1846
addr == 16'h737 ? 16'h073d :  // <0096> "

addr == 16'h738 ? 16'h23a0 :  // <0097> pa = :tps_accel2_msg
addr == 16'h739 ? 16'h0700 :  // <0097> "
addr == 16'h73a ? 16'hfba0 :  // <0097> callx  unique_text_flag  :tps_accel2_msg
addr == 16'h73b ? 16'h0aec :  // <0097> "
addr == 16'h73c ? 16'hfc00 :  // <0097> "


addr == 16'h73d ? 16'h0004 :  // <0101> a = x
addr == 16'h73e ? 16'h0604 :  // <0101> b = 4

addr == 16'h73f ? 16'he407 :  // <0099> bn eq :else_1855
addr == 16'h740 ? 16'h0746 :  // <0099> "

addr == 16'h741 ? 16'h23a0 :  // <0100> pa = :tps_open_msg
addr == 16'h742 ? 16'h0703 :  // <0100> "
addr == 16'h743 ? 16'hfba0 :  // <0100> callx  unique_text_flag  :tps_open_msg
addr == 16'h744 ? 16'h0aec :  // <0100> "
addr == 16'h745 ? 16'hfc00 :  // <0100> "

addr == 16'h746 ? 16'h0004 :  // <0102> a = x

addr == 16'h747 ? 16'h0351 :  // <0103> a = a<<1
addr == 16'h748 ? 16'h06d0 :  // <0103> b = 208
addr == 16'h749 ? 16'h5e00 :  // <0103> av_ad_hi = 0
addr == 16'h74a ? 16'h6300 :  // <0103> av_ad_lo = ad0
addr == 16'h74b ? 16'h0415 :  // <0103> b = av_write_data
addr == 16'h74c ? 16'h0416 :  // <0103> b = av_read_data


addr == 16'h74d ? 16'h0200 :  // <0118> a = 0
addr == 16'h74e ? 16'h0401 :  // <0118> b = b

addr == 16'h74f ? 16'he007 :  // <0104> br eq :else_1871
addr == 16'h750 ? 16'h075d :  // <0104> "

// calculate TPS enrichment in us.  apply a total of 10 bits of right-shift to
// implement division by 1024 (thou unit).  spread them out to prevent overflow.
addr == 16'h751 ? 16'h0001 :  // <0107> a = b
addr == 16'h752 ? 16'h0350 :  // <0108> a = a>>1
addr == 16'h753 ? 16'h0750 :  // <0109> b = a>>1
addr == 16'h754 ? 16'h0006 :  // <0110> a = ga
addr == 16'h755 ? 16'h0353 :  // <0111> a = a>>4
addr == 16'h756 ? 16'hfba0 :  // <0112> call  multiply
addr == 16'h757 ? 16'h0170 :  // <0112> "
addr == 16'h758 ? 16'hfc00 :  // <0112> "
addr == 16'h759 ? 16'h0353 :  // <0113> a = a>>4

// add enrichment to smap puff.
addr == 16'h75a ? 16'h0406 :  // <0116> b = ga
addr == 16'h75b ? 16'hc800 :  // <0117> ga = a+b
addr == 16'h75c ? 16'h1b00 :  // <0117> "


// memorize total puff.
addr == 16'h75d ? 16'h5e00 :  // <0121> ram $ram_next_puff_len_us = ga // av_ad_hi = 0
addr == 16'h75e ? 16'h6290 :  // <0121> ram $ram_next_puff_len_us = ga // av_ad_lo = 144
addr == 16'h75f ? 16'h5406 :  // <0121> ram $ram_next_puff_len_us = ga // av_write_data = ga


addr == 16'h760 ? 16'hf80c :  // <0124> pop rtna // func puff_len_run
addr == 16'h761 ? 16'h180c :  // <0124> pop ga // "
addr == 16'h762 ? 16'h100c :  // <0124> pop x // "
addr == 16'h763 ? 16'hfc00 :  // <0124> swapra = nop

// ######## func leave_run // = 0x0764
addr == 16'h764 ? 16'h303e :  // <0127> push rtna // func leave_run

addr == 16'h765 ? 16'hfba0 :  // <0126> callx  check_engine_stop  pa
addr == 16'h766 ? 16'h0c0b :  // <0126> "
addr == 16'h767 ? 16'hfc00 :  // <0126> "

addr == 16'h768 ? 16'hf80c :  // <0128> pop rtna // func leave_run
addr == 16'h769 ? 16'hfc00 :  // <0128> swapra = nop



// #########################################################################
// :main // = 0x076a
addr == 16'h76a ? 16'h03a0 :  // <0214> a = :boot_msg
addr == 16'h76b ? 16'h008b :  // <0214> "
addr == 16'h76c ? 16'hfba0 :  // <0215> call :print_nt
addr == 16'h76d ? 16'h014f :  // <0215> "
addr == 16'h76e ? 16'hfc00 :  // <0215> "

// clear the first 64k of RAM.
addr == 16'h76f ? 16'h5e00 :  // <0218> av_ad_hi = 0
addr == 16'h770 ? 16'hfba0 :  // <0218> callx  clear_ram_page  0
addr == 16'h771 ? 16'h0acf :  // <0218> "
addr == 16'h772 ? 16'hfc00 :  // <0218> "

// init fuel injection.
addr == 16'h773 ? 16'hfba0 :  // <0221> callx  init_plan_stop
addr == 16'h774 ? 16'h0322 :  // <0221> "
addr == 16'h775 ? 16'hfc00 :  // <0221> "

// power up FTDI USB board, and init any other special board control functions.
addr == 16'h776 ? 16'h7280 :  // <0224> board_ctrl = $ftdi_power_mask
addr == 16'h777 ? 16'hfba0 :  // <0225> callx postpone_comm_restart
addr == 16'h778 ? 16'h0aa6 :  // <0225> "
addr == 16'h779 ? 16'hfc00 :  // <0225> "

// check initial state of power management circuits.
// if power is lost or ignition switch is off already, open relay & abort run.
// that's important because then the event controller booted up too late to
// see edges on those 2 signals.  regular system would never shut itself down.
// this setup is the last thing done prior to the event handler loop.
addr == 16'h77a ? 16'h7a00 :  // <0232> power_duty = $power_duty_closing

addr == 16'h77b ? 16'h001e :  // <0236> a = power_duty
addr == 16'h77c ? 16'h06c0 :  // <0236> b = ( $power_lost_mask | $ign_switch_off_mask )

addr == 16'h77d ? 16'he003 :  // <0233> br and0z :else_1917
addr == 16'h77e ? 16'h0784 :  // <0233> "

addr == 16'h77f ? 16'h7a32 :  // <0234> power_duty = $power_duty_opening
addr == 16'h780 ? 16'h6fa0 :  // <0235> error_halt_code $err_power_lost_at_boot // leds = 0xfffb
addr == 16'h781 ? 16'hfffb :  // <0235> "
addr == 16'h782 ? 16'he00f :  // <0235> error_halt_code $err_power_lost_at_boot
addr == 16'h783 ? 16'h0782 :  // <0235> "

addr == 16'h784 ? 16'h5e00 :  // <0237> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h785 ? 16'h623c :  // <0237> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 60
addr == 16'h786 ? 16'h5760 :  // <0237> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h787 ? 16'h5e00 :  // <0238> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_hi = 0
addr == 16'h788 ? 16'h623e :  // <0238> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_lo = 62
addr == 16'h789 ? 16'h5602 :  // <0238> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_write_data = 2

// start handling events.
addr == 16'h78a ? 16'h3ba0 :  // <0241> soft_event = $event_controller_reset_mask
addr == 16'h78b ? 16'h8000 :  // <0241> "
addr == 16'h78c ? 16'h3a00 :  // <0242> soft_event = 0
addr == 16'h78d ? 16'h47a0 :  // <0243> mstimer0 = 1000
addr == 16'h78e ? 16'h03e8 :  // <0243> "
addr == 16'h78f ? 16'h4e14 :  // <0244> mstimer2 = $plan_tick_ms
addr == 16'h790 ? 16'he00f :  // <0245> jmp :poll_events
addr == 16'h791 ? 16'h008e :  // <0245> "

// event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.
// event 0 not used in this app anyway.
// :event_table // = 0x0792
addr == 16'h792 ? 16'h008e :  // <0250> ([label :poll_events])
addr == 16'h793 ? 16'h0a01 :  // <0251> ([label :power_lost_handler])
addr == 16'h794 ? 16'h07a7 :  // <0252> ([label :ign_capture_handler])
addr == 16'h795 ? 16'h0827 :  // <0253> ([label :ign_capture_timeout_handler])
addr == 16'h796 ? 16'h0a35 :  // <0254> ([label :puff1_done_handler])
addr == 16'h797 ? 16'h082c :  // <0255> ([label :ustimer0_handler])
addr == 16'h798 ? 16'h098c :  // <0256> ([label :spi_done_handler])
addr == 16'h799 ? 16'h082e :  // <0257> ([label :mstimer0_handler])
addr == 16'h79a ? 16'h0958 :  // <0258> ([label :mstimer1_handler])
addr == 16'h79b ? 16'h085d :  // <0259> ([label :mstimer2_handler])
addr == 16'h79c ? 16'h0889 :  // <0260> ([label :uart_rx_handler])
addr == 16'h79d ? 16'h08a2 :  // <0261> ([label :uart_rx_overflow_handler])
addr == 16'h79e ? 16'h08aa :  // <0262> ([label :uart_tx_overflow_handler])
addr == 16'h79f ? 16'h08b1 :  // <0263> ([label :key0_handler])
addr == 16'h7a0 ? 16'h08bb :  // <0264> ([label :key1_handler])
addr == 16'h7a1 ? 16'h0a18 :  // <0265> ([label :ign_switch_off_handler])
addr == 16'h7a2 ? 16'h0a2b :  // <0266> ([label :ign_switch_on_handler])
addr == 16'h7a3 ? 16'h08c5 :  // <0267> ([label :softevent3_handler])
addr == 16'h7a4 ? 16'h08c7 :  // <0268> ([label :softevent2_handler])
addr == 16'h7a5 ? 16'h08c9 :  // <0269> ([label :softevent1_handler])
addr == 16'h7a6 ? 16'h08cb :  // <0270> ([label :softevent0_handler])

// #########################################################################

// ######## event ign_capture_handler // = 0x07a7
// discard outlier time.
addr == 16'h7a7 ? 16'h181f :  // <0276> g6 = ign_capture_jf
addr == 16'h7a8 ? 16'h5e00 :  // <0277> ram b = $ram_ign_fastest_jf // av_ad_hi = 0
addr == 16'h7a9 ? 16'h6282 :  // <0277> ram b = $ram_ign_fastest_jf // av_ad_lo = 130
addr == 16'h7aa ? 16'h0415 :  // <0277> ram b = $ram_ign_fastest_jf // b = av_write_data // start read cycle
addr == 16'h7ab ? 16'h0416 :  // <0277> ram b = $ram_ign_fastest_jf // b = av_read_data // finish read cycle

addr == 16'h7ac ? 16'h0006 :  // <0280> a = g6
addr == 16'h7ad ? 16'h0401 :  // <0280> b = b

addr == 16'h7ae ? 16'he405 :  // <0278> bn lt :else_1966
addr == 16'h7af ? 16'h07b1 :  // <0278> "

addr == 16'h7b0 ? 16'h1a00 :  // <0279> g6 = 0

addr == 16'h7b1 ? 16'h5e00 :  // <0281> ram b = $ram_ign_slowest_jf // av_ad_hi = 0
addr == 16'h7b2 ? 16'h6284 :  // <0281> ram b = $ram_ign_slowest_jf // av_ad_lo = 132
addr == 16'h7b3 ? 16'h0415 :  // <0281> ram b = $ram_ign_slowest_jf // b = av_write_data // start read cycle
addr == 16'h7b4 ? 16'h0416 :  // <0281> ram b = $ram_ign_slowest_jf // b = av_read_data // finish read cycle

addr == 16'h7b5 ? 16'h0006 :  // <0284> a = g6
addr == 16'h7b6 ? 16'h0401 :  // <0284> b = b

addr == 16'h7b7 ? 16'he406 :  // <0282> bn gt :else_1975
addr == 16'h7b8 ? 16'h07ba :  // <0282> "

addr == 16'h7b9 ? 16'h1a00 :  // <0283> g6 = 0


// increment buffer index and memorize time.
addr == 16'h7ba ? 16'h5e00 :  // <0287> ram a = $ram_ign_history_idx // av_ad_hi = 0
addr == 16'h7bb ? 16'h6258 :  // <0287> ram a = $ram_ign_history_idx // av_ad_lo = 88
addr == 16'h7bc ? 16'h0015 :  // <0287> ram a = $ram_ign_history_idx // a = av_write_data // start read cycle
addr == 16'h7bd ? 16'h0016 :  // <0287> ram a = $ram_ign_history_idx // a = av_read_data // finish read cycle
addr == 16'h7be ? 16'h0601 :  // <0288> b = 1
addr == 16'h7bf ? 16'hc800 :  // <0289> a = a+b
addr == 16'h7c0 ? 16'h0300 :  // <0289> "
addr == 16'h7c1 ? 16'h060f :  // <0290> b = $ign_history_idx_mask
addr == 16'h7c2 ? 16'hc800 :  // <0291> a = and
addr == 16'h7c3 ? 16'h0330 :  // <0291> "
addr == 16'h7c4 ? 16'h5e00 :  // <0292> ram $ram_ign_history_idx = a // av_ad_hi = 0
addr == 16'h7c5 ? 16'h6258 :  // <0292> ram $ram_ign_history_idx = a // av_ad_lo = 88
addr == 16'h7c6 ? 16'h5400 :  // <0292> ram $ram_ign_history_idx = a // av_write_data = a
addr == 16'h7c7 ? 16'h0406 :  // <0293> b = g6

addr == 16'h7c8 ? 16'h0351 :  // <0294> a = a<<1
addr == 16'h7c9 ? 16'h3001 :  // <0294> push b // push b
addr == 16'h7ca ? 16'h065a :  // <0294> b = 90
addr == 16'h7cb ? 16'h5e00 :  // <0294> av_ad_hi = 0
addr == 16'h7cc ? 16'h6300 :  // <0294> av_ad_lo = ad0
addr == 16'h7cd ? 16'h540c :  // <0294> pop av_write_data // pop av_write_data


// ////////// compute new jiffy estimate.
// average entire history.
// x = total, y = sample, i = index = loop count, g6 = count of invalid samples.
addr == 16'h7ce ? 16'h1200 :  // <0299> x = 0
addr == 16'h7cf ? 16'h1a00 :  // <0300> g6 = 0
addr == 16'h7d0 ? 16'h0a00 :  // <0316> i = 0
// :loop_2000 // = 0x07d1

addr == 16'h7d1 ? 16'h0002 :  // <0301> a = i

addr == 16'h7d2 ? 16'h0351 :  // <0302> a = a<<1
addr == 16'h7d3 ? 16'h065a :  // <0302> b = 90
addr == 16'h7d4 ? 16'h5e00 :  // <0302> av_ad_hi = 0
addr == 16'h7d5 ? 16'h6300 :  // <0302> av_ad_lo = ad0
addr == 16'h7d6 ? 16'h0415 :  // <0302> b = av_write_data
addr == 16'h7d7 ? 16'h0416 :  // <0302> b = av_read_data

addr == 16'h7d8 ? 16'h1401 :  // <0303> y = b

addr == 16'h7d9 ? 16'h0005 :  // <0314> a = y
addr == 16'h7da ? 16'h0600 :  // <0314> b = 0

addr == 16'h7db ? 16'he407 :  // <0304> bn eq :else_2011
addr == 16'h7dc ? 16'h07e3 :  // <0304> "

addr == 16'h7dd ? 16'h0006 :  // <0305> a = g6
addr == 16'h7de ? 16'h0601 :  // <0306> b = 1
addr == 16'h7df ? 16'hc800 :  // <0307> g6 = a+b
addr == 16'h7e0 ? 16'h1b00 :  // <0307> "

addr == 16'h7e1 ? 16'he00f :  // <0309> jmp :end_2011
addr == 16'h7e2 ? 16'h07ea :  // <0309> "

addr == 16'h7e3 ? 16'h0208 :  // <0310> a = ($ign_history_len / 2)
addr == 16'h7e4 ? 16'h0405 :  // <0311> b = y
addr == 16'h7e5 ? 16'hc800 :  // <0312> a = a+b
addr == 16'h7e6 ? 16'h0300 :  // <0312> "
addr == 16'h7e7 ? 16'h1753 :  // <0313> y = a>>$ign_history_idx_bits
addr == 16'h7e8 ? 16'hc800 :  // <0314> x = x+y
addr == 16'h7e9 ? 16'h1320 :  // <0314> "



addr == 16'h7ea ? 16'h0002 :  // <0316> a = i
addr == 16'h7eb ? 16'h0601 :  // <0316> b = 1
addr == 16'h7ec ? 16'hc800 :  // <0316> i = a+b
addr == 16'h7ed ? 16'h0b00 :  // <0316> "


addr == 16'h7ee ? 16'h0002 :  // <0316> a = i
addr == 16'h7ef ? 16'h0610 :  // <0316> b = $ign_history_len
addr == 16'h7f0 ? 16'he005 :  // <0316> br lt :loop_2000
addr == 16'h7f1 ? 16'h07d1 :  // <0316> "

// :end_2000 // = 0x07f2
addr == 16'h7f2 ? 16'h5e00 :  // <0317> ram $ram_ign_avg_jf = x // av_ad_hi = 0
addr == 16'h7f3 ? 16'h627a :  // <0317> ram $ram_ign_avg_jf = x // av_ad_lo = 122
addr == 16'h7f4 ? 16'h5404 :  // <0317> ram $ram_ign_avg_jf = x // av_write_data = x
addr == 16'h7f5 ? 16'h5e00 :  // <0318> ram $ram_ign_bad_samples = g6 // av_ad_hi = 0
addr == 16'h7f6 ? 16'h6280 :  // <0318> ram $ram_ign_bad_samples = g6 // av_ad_lo = 128
addr == 16'h7f7 ? 16'h5406 :  // <0318> ram $ram_ign_bad_samples = g6 // av_write_data = g6
//patch: dividing before summing (instead of after) is much simpler and faster because it prevents overflow.
// but it means we could be reading as much as 16 jf too low (16 = ign_history_len).
// that error is way less than 1 RPM on the slow end,
// or about 1,000 RPM too fast on the fast end!
// might need to tighten that up.  one simple way might be adding ign_history_len / 2 to each history record prior to dividing.
// that didn't seem to help much in simple testing.
// probly because jf_to_rpm has only 32 RPM resolution.


addr == 16'h7f8 ? 16'h0006 :  // <0334> a = g6
addr == 16'h7f9 ? 16'h0604 :  // <0334> b = ( $ign_history_len / 4 )

addr == 16'h7fa ? 16'he406 :  // <0327> bn gt :else_2042
addr == 16'h7fb ? 16'h0801 :  // <0327> "

addr == 16'h7fc ? 16'h5e00 :  // <0328> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h7fd ? 16'h627e :  // <0328> ram $ram_rpm_valid = 0 // av_ad_lo = 126
addr == 16'h7fe ? 16'h5600 :  // <0328> ram $ram_rpm_valid = 0 // av_write_data = 0

addr == 16'h7ff ? 16'he00f :  // <0330> jmp :end_2042
addr == 16'h800 ? 16'h080b :  // <0330> "

// convert jiffies b to new RPM estimate.
addr == 16'h801 ? 16'h2004 :  // <0332> pa = x
addr == 16'h802 ? 16'hfba0 :  // <0332> callx  jf_to_rpm  x  pa
addr == 16'h803 ? 16'h0bff :  // <0332> "
addr == 16'h804 ? 16'hfc00 :  // <0332> "
addr == 16'h805 ? 16'h5e00 :  // <0333> ram $ram_avg_rpm = pa // av_ad_hi = 0
addr == 16'h806 ? 16'h627c :  // <0333> ram $ram_avg_rpm = pa // av_ad_lo = 124
addr == 16'h807 ? 16'h5408 :  // <0333> ram $ram_avg_rpm = pa // av_write_data = pa
addr == 16'h808 ? 16'h5e00 :  // <0334> ram $ram_rpm_valid = 1 // av_ad_hi = 0
addr == 16'h809 ? 16'h627e :  // <0334> ram $ram_rpm_valid = 1 // av_ad_lo = 126
addr == 16'h80a ? 16'h5601 :  // <0334> ram $ram_rpm_valid = 1 // av_write_data = 1

addr == 16'h80b ? 16'he00f :  // <0335> end_event
addr == 16'h80c ? 16'h008e :  // <0335> "

// ######## func clear_ign_history // = 0x080d
addr == 16'h80d ? 16'h3002 :  // <0348> push i // func clear_ign_history

// invalidate the RPM estimate.
addr == 16'h80e ? 16'h5e00 :  // <0339> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h80f ? 16'h627e :  // <0339> ram $ram_rpm_valid = 0 // av_ad_lo = 126
addr == 16'h810 ? 16'h5600 :  // <0339> ram $ram_rpm_valid = 0 // av_write_data = 0
// the last known RPM estimate is retained here, not cleared.
// clear the history so it won't be valid again until several more valid samples are collected.
addr == 16'h811 ? 16'h5e00 :  // <0342> ram $ram_ign_bad_samples = $ign_history_len // av_ad_hi = 0
addr == 16'h812 ? 16'h6280 :  // <0342> ram $ram_ign_bad_samples = $ign_history_len // av_ad_lo = 128
addr == 16'h813 ? 16'h5610 :  // <0342> ram $ram_ign_bad_samples = $ign_history_len // av_write_data = 16
addr == 16'h814 ? 16'h0a00 :  // <0347> i = 0
// :loop_2068 // = 0x0815

addr == 16'h815 ? 16'h0002 :  // <0343> a = i
addr == 16'h816 ? 16'h0600 :  // <0344> b = 0

addr == 16'h817 ? 16'h0351 :  // <0345> a = a<<1
addr == 16'h818 ? 16'h3001 :  // <0345> push b // push b
addr == 16'h819 ? 16'h065a :  // <0345> b = 90
addr == 16'h81a ? 16'h5e00 :  // <0345> av_ad_hi = 0
addr == 16'h81b ? 16'h6300 :  // <0345> av_ad_lo = ad0
addr == 16'h81c ? 16'h540c :  // <0345> pop av_write_data // pop av_write_data



addr == 16'h81d ? 16'h0002 :  // <0347> a = i
addr == 16'h81e ? 16'h0601 :  // <0347> b = 1
addr == 16'h81f ? 16'hc800 :  // <0347> i = a+b
addr == 16'h820 ? 16'h0b00 :  // <0347> "


addr == 16'h821 ? 16'h0002 :  // <0347> a = i
addr == 16'h822 ? 16'h0610 :  // <0347> b = $ign_history_len
addr == 16'h823 ? 16'he005 :  // <0347> br lt :loop_2068
addr == 16'h824 ? 16'h0815 :  // <0347> "

// :end_2068 // = 0x0825

addr == 16'h825 ? 16'h080c :  // <0349> pop i // func clear_ign_history
addr == 16'h826 ? 16'hfc00 :  // <0349> swapra = nop

// ######## event ign_capture_timeout_handler // = 0x0827
// it's been too long since the last ignition pulse detect.
addr == 16'h827 ? 16'hfba0 :  // <0352> callx clear_ign_history
addr == 16'h828 ? 16'h080d :  // <0352> "
addr == 16'h829 ? 16'hfc00 :  // <0352> "
addr == 16'h82a ? 16'he00f :  // <0353> end_event
addr == 16'h82b ? 16'h008e :  // <0353> "

// ######## event ustimer0_handler // = 0x082c
addr == 16'h82c ? 16'he00f :  // <0356> end_event
addr == 16'h82d ? 16'h008e :  // <0356> "

// ######## event mstimer0_handler // = 0x082e
// unified 1-second periodic timer for all low-resolution tasks.

// start timer again.
addr == 16'h82e ? 16'h47a0 :  // <0362> mstimer0 = 1000
addr == 16'h82f ? 16'h03e8 :  // <0362> "

// realtime counters in RAM.
addr == 16'h830 ? 16'h5e00 :  // <0365> ram a = $ram_seconds_cnt // av_ad_hi = 0
addr == 16'h831 ? 16'h6242 :  // <0365> ram a = $ram_seconds_cnt // av_ad_lo = 66
addr == 16'h832 ? 16'h0015 :  // <0365> ram a = $ram_seconds_cnt // a = av_write_data // start read cycle
addr == 16'h833 ? 16'h0016 :  // <0365> ram a = $ram_seconds_cnt // a = av_read_data // finish read cycle
addr == 16'h834 ? 16'h0601 :  // <0366> b = 1
addr == 16'h835 ? 16'hc800 :  // <0367> a = a+b
addr == 16'h836 ? 16'h0300 :  // <0367> "

addr == 16'h837 ? 16'h0000 :  // <0376> a = a
addr == 16'h838 ? 16'h063c :  // <0376> b = 60

addr == 16'h839 ? 16'he407 :  // <0368> bn eq :else_2105
addr == 16'h83a ? 16'h084c :  // <0368> "

addr == 16'h83b ? 16'h5e00 :  // <0369> ram $ram_seconds_cnt = 0 // av_ad_hi = 0
addr == 16'h83c ? 16'h6242 :  // <0369> ram $ram_seconds_cnt = 0 // av_ad_lo = 66
addr == 16'h83d ? 16'h5600 :  // <0369> ram $ram_seconds_cnt = 0 // av_write_data = 0
addr == 16'h83e ? 16'h5e00 :  // <0370> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h83f ? 16'h6240 :  // <0370> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'h840 ? 16'h0015 :  // <0370> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h841 ? 16'h0016 :  // <0370> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h842 ? 16'h0601 :  // <0371> b = 1
addr == 16'h843 ? 16'h5e00 :  // <0372> ram $ram_minutes_cnt = a+b // av_ad_hi = 0
addr == 16'h844 ? 16'h6240 :  // <0372> ram $ram_minutes_cnt = a+b // av_ad_lo = 64
addr == 16'h845 ? 16'hc800 :  // <0372> ram $ram_minutes_cnt = a+b // av_write_data = a+b
addr == 16'h846 ? 16'h5700 :  // <0372> "
addr == 16'h847 ? 16'hfba0 :  // <0373> callx minute_events
addr == 16'h848 ? 16'h0a44 :  // <0373> "
addr == 16'h849 ? 16'hfc00 :  // <0373> "

addr == 16'h84a ? 16'he00f :  // <0375> jmp :end_2105
addr == 16'h84b ? 16'h084f :  // <0375> "

addr == 16'h84c ? 16'h5e00 :  // <0376> ram $ram_seconds_cnt = a // av_ad_hi = 0
addr == 16'h84d ? 16'h6242 :  // <0376> ram $ram_seconds_cnt = a // av_ad_lo = 66
addr == 16'h84e ? 16'h5400 :  // <0376> ram $ram_seconds_cnt = a // av_write_data = a


// all 1-second functions here.
addr == 16'h84f ? 16'hfba0 :  // <0379> callx check_power_relay
addr == 16'h850 ? 16'h0a4c :  // <0379> "
addr == 16'h851 ? 16'hfc00 :  // <0379> "
addr == 16'h852 ? 16'hfba0 :  // <0380> callx check_communication
addr == 16'h853 ? 16'h0a79 :  // <0380> "
addr == 16'h854 ? 16'hfc00 :  // <0380> "
addr == 16'h855 ? 16'hfba0 :  // <0381> callx start_daq_pass
addr == 16'h856 ? 16'h08da :  // <0381> "
addr == 16'h857 ? 16'hfc00 :  // <0381> "
addr == 16'h858 ? 16'he00f :  // <0382> end_event
addr == 16'h859 ? 16'h008e :  // <0382> "

// :plan_transition_msg // = 0x085a
// "PLAN\x0"
addr == 16'h85a ? 16'h4c50 :  // <0385> LP
addr == 16'h85b ? 16'h4e41 :  // <0385> NA
addr == 16'h85c ? 16'h0000 :  // <0385>   

// ######## event mstimer2_handler // = 0x085d
// engine management plan tick timer.

// restart timer.
addr == 16'h85d ? 16'h4e14 :  // <0391> mstimer2 = $plan_tick_ms

// start another TPS reading prior to every plan tick.
// this will also invoke a o2 reading.  that's done last of all prior to plan_tick,
// so there's minimal latency between that and the plan_tick utilizing it.
addr == 16'h85e ? 16'h5e00 :  // <0396> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h85f ? 16'h6236 :  // <0396> ram a = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'h860 ? 16'h0015 :  // <0396> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h861 ? 16'h0016 :  // <0396> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle

addr == 16'h862 ? 16'h0000 :  // <0399> a = a
addr == 16'h863 ? 16'h0600 :  // <0399> b = 0

addr == 16'h864 ? 16'he407 :  // <0397> bn eq :else_2148
addr == 16'h865 ? 16'h086a :  // <0397> "

addr == 16'h866 ? 16'h2206 :  // <0398> pa = 6
addr == 16'h867 ? 16'hfba0 :  // <0398> callx  begin_adc_conversion  $tps_adc_channel
addr == 16'h868 ? 16'h097e :  // <0398> "
addr == 16'h869 ? 16'hfc00 :  // <0398> "

addr == 16'h86a ? 16'he00f :  // <0400> end_event
addr == 16'h86b ? 16'h008e :  // <0400> "

// ######## func plan_tick // = 0x086c
addr == 16'h86c ? 16'h3004 :  // <0417> push x // func plan_tick
addr == 16'h86d ? 16'h303e :  // <0417> push rtna // "

// poll the engine management plan.
// call the transition function for the current plan.
// this might perform a transition to some other plan, so it's done first.
addr == 16'h86e ? 16'h5e00 :  // <0406> ram rtna = $ram_transition_func // av_ad_hi = 0
addr == 16'h86f ? 16'h628c :  // <0406> ram rtna = $ram_transition_func // av_ad_lo = 140
addr == 16'h870 ? 16'hf815 :  // <0406> ram rtna = $ram_transition_func // rtna = av_write_data // start read cycle
addr == 16'h871 ? 16'hf816 :  // <0406> ram rtna = $ram_transition_func // rtna = av_read_data // finish read cycle
addr == 16'h872 ? 16'h103e :  // <0407> x = rtna
addr == 16'h873 ? 16'hfc00 :  // <0408> swapra = nop
addr == 16'h874 ? 16'h5e00 :  // <0410> ram b = $ram_transition_func // av_ad_hi = 0
addr == 16'h875 ? 16'h628c :  // <0410> ram b = $ram_transition_func // av_ad_lo = 140
addr == 16'h876 ? 16'h0415 :  // <0410> ram b = $ram_transition_func // b = av_write_data // start read cycle
addr == 16'h877 ? 16'h0416 :  // <0410> ram b = $ram_transition_func // b = av_read_data // finish read cycle

addr == 16'h878 ? 16'h0004 :  // <0413> a = x
addr == 16'h879 ? 16'h0401 :  // <0413> b = b

addr == 16'h87a ? 16'he007 :  // <0411> br eq :else_2170
addr == 16'h87b ? 16'h0881 :  // <0411> "

addr == 16'h87c ? 16'h23a0 :  // <0412> pa = :plan_transition_msg
addr == 16'h87d ? 16'h085a :  // <0412> "
addr == 16'h87e ? 16'hfba0 :  // <0412> callx  set_text_flag  :plan_transition_msg
addr == 16'h87f ? 16'h0ad7 :  // <0412> "
addr == 16'h880 ? 16'hfc00 :  // <0412> "

// call the puff length function for the current plan.
// this is done last, so if a plan transition just happened, its new puff length will init here.
addr == 16'h881 ? 16'h5e00 :  // <0416> ram rtna = $ram_puff_len_func // av_ad_hi = 0
addr == 16'h882 ? 16'h628a :  // <0416> ram rtna = $ram_puff_len_func // av_ad_lo = 138
addr == 16'h883 ? 16'hf815 :  // <0416> ram rtna = $ram_puff_len_func // rtna = av_write_data // start read cycle
addr == 16'h884 ? 16'hf816 :  // <0416> ram rtna = $ram_puff_len_func // rtna = av_read_data // finish read cycle
addr == 16'h885 ? 16'hfc00 :  // <0417> swapra = nop

addr == 16'h886 ? 16'hf80c :  // <0420> pop rtna // func plan_tick
addr == 16'h887 ? 16'h100c :  // <0420> pop x // "
addr == 16'h888 ? 16'hfc00 :  // <0420> swapra = nop

// ######## event uart_rx_handler // = 0x0889
// :again // = 0x0889
addr == 16'h889 ? 16'hfba0 :  // <0423> pollchar
addr == 16'h88a ? 16'h00aa :  // <0423> "
addr == 16'h88b ? 16'hfc00 :  // <0423> "
addr == 16'h88c ? 16'h1000 :  // <0424> x = a

addr == 16'h88d ? 16'h0004 :  // <0427> a = x
addr == 16'h88e ? 16'h0760 :  // <0427> b = -1

addr == 16'h88f ? 16'he407 :  // <0425> bn eq :else_2191
addr == 16'h890 ? 16'h0893 :  // <0425> "

addr == 16'h891 ? 16'he00f :  // <0426> event_return
addr == 16'h892 ? 16'h008e :  // <0426> "


addr == 16'h893 ? 16'h0004 :  // <0430> a = x
addr == 16'h894 ? 16'h060a :  // <0430> b = 10

addr == 16'h895 ? 16'he407 :  // <0428> bn eq :else_2197
addr == 16'h896 ? 16'h089a :  // <0428> "

addr == 16'h897 ? 16'hfba0 :  // <0429> callx  postpone_comm_restart
addr == 16'h898 ? 16'h0aa6 :  // <0429> "
addr == 16'h899 ? 16'hfc00 :  // <0429> "

addr == 16'h89a ? 16'h2004 :  // <0431> pa = x
addr == 16'h89b ? 16'hfba0 :  // <0431> callx  parse_key  x
addr == 16'h89c ? 16'h026e :  // <0431> "
addr == 16'h89d ? 16'hfc00 :  // <0431> "
addr == 16'h89e ? 16'he00f :  // <0432> jmp :again
addr == 16'h89f ? 16'h0889 :  // <0432> "
addr == 16'h8a0 ? 16'he00f :  // <0433> end_event
addr == 16'h8a1 ? 16'h008e :  // <0433> "

// ######## event uart_rx_overflow_handler // = 0x08a2
addr == 16'h8a2 ? 16'h6fa0 :  // <0436> error_halt_code $err_rx_overflow // leds = 0xfffe
addr == 16'h8a3 ? 16'hfffe :  // <0436> "
addr == 16'h8a4 ? 16'he00f :  // <0436> error_halt_code $err_rx_overflow
addr == 16'h8a5 ? 16'h08a4 :  // <0436> "
addr == 16'h8a6 ? 16'he00f :  // <0437> end_event
addr == 16'h8a7 ? 16'h008e :  // <0437> "

// :tx_overflow_msg // = 0x08a8
// "TXO\x0"
addr == 16'h8a8 ? 16'h5854 :  // <0440> XT
addr == 16'h8a9 ? 16'h004f :  // <0440>  O

// ######## event uart_tx_overflow_handler // = 0x08aa
// error_halt_code $err_tx_overflow
addr == 16'h8aa ? 16'h23a0 :  // <0444> pa = :tx_overflow_msg
addr == 16'h8ab ? 16'h08a8 :  // <0444> "
addr == 16'h8ac ? 16'hfba0 :  // <0444> callx  set_text_flag  :tx_overflow_msg
addr == 16'h8ad ? 16'h0ad7 :  // <0444> "
addr == 16'h8ae ? 16'hfc00 :  // <0444> "
addr == 16'h8af ? 16'he00f :  // <0445> end_event
addr == 16'h8b0 ? 16'h008e :  // <0445> "

// ######## event key0_handler // = 0x08b1
addr == 16'h8b1 ? 16'h026b :  // <0448> a = 107 // putasc "k"
addr == 16'h8b2 ? 16'hfba0 :  // <0448> putasc "k"
addr == 16'h8b3 ? 16'h009b :  // <0448> "
addr == 16'h8b4 ? 16'hfc00 :  // <0448> "
addr == 16'h8b5 ? 16'h0230 :  // <0449> a = 48 // putasc "0"
addr == 16'h8b6 ? 16'hfba0 :  // <0449> putasc "0"
addr == 16'h8b7 ? 16'h009b :  // <0449> "
addr == 16'h8b8 ? 16'hfc00 :  // <0449> "
addr == 16'h8b9 ? 16'he00f :  // <0450> end_event
addr == 16'h8ba ? 16'h008e :  // <0450> "

// ######## event key1_handler // = 0x08bb
addr == 16'h8bb ? 16'h026b :  // <0453> a = 107 // putasc "k"
addr == 16'h8bc ? 16'hfba0 :  // <0453> putasc "k"
addr == 16'h8bd ? 16'h009b :  // <0453> "
addr == 16'h8be ? 16'hfc00 :  // <0453> "
addr == 16'h8bf ? 16'h0231 :  // <0454> a = 49 // putasc "1"
addr == 16'h8c0 ? 16'hfba0 :  // <0454> putasc "1"
addr == 16'h8c1 ? 16'h009b :  // <0454> "
addr == 16'h8c2 ? 16'hfc00 :  // <0454> "
addr == 16'h8c3 ? 16'he00f :  // <0455> end_event
addr == 16'h8c4 ? 16'h008e :  // <0455> "

// ######## event softevent3_handler // = 0x08c5
addr == 16'h8c5 ? 16'he00f :  // <0458> end_event
addr == 16'h8c6 ? 16'h008e :  // <0458> "

// ######## event softevent2_handler // = 0x08c7
addr == 16'h8c7 ? 16'he00f :  // <0461> end_event
addr == 16'h8c8 ? 16'h008e :  // <0461> "

// ######## event softevent1_handler // = 0x08c9
addr == 16'h8c9 ? 16'he00f :  // <0464> end_event
addr == 16'h8ca ? 16'h008e :  // <0464> "

// ######## event softevent0_handler // = 0x08cb
addr == 16'h8cb ? 16'he00f :  // <0467> end_event
addr == 16'h8cc ? 16'h008e :  // <0467> "

// :rpm_msg // = 0x08cd
// ": rpm=\x0"
addr == 16'h8cd ? 16'h203a :  // <0470>  :
addr == 16'h8ce ? 16'h7072 :  // <0470> pr
addr == 16'h8cf ? 16'h3d6d :  // <0470> =m
addr == 16'h8d0 ? 16'h0000 :  // <0470>   

// :puff_len_msg // = 0x08d1
// " pfl=\x0"
addr == 16'h8d1 ? 16'h7020 :  // <0473> p 
addr == 16'h8d2 ? 16'h6c66 :  // <0473> lf
addr == 16'h8d3 ? 16'h003d :  // <0473>  =

// :o2_msg // = 0x08d4
// " o2=\x0"
addr == 16'h8d4 ? 16'h6f20 :  // <0476> o 
addr == 16'h8d5 ? 16'h3d32 :  // <0476> =2
addr == 16'h8d6 ? 16'h0000 :  // <0476>   

// :tps_msg // = 0x08d7
// " tp=\x0"
addr == 16'h8d7 ? 16'h7420 :  // <0479> t 
addr == 16'h8d8 ? 16'h3d70 :  // <0479> =p
addr == 16'h8d9 ? 16'h0000 :  // <0479>   

// ######## func start_daq_pass // = 0x08da
addr == 16'h8da ? 16'h3004 :  // <0536> push x // func start_daq_pass
addr == 16'h8db ? 16'h303e :  // <0536> push rtna // "

// daq pass counter in RAM.
addr == 16'h8dc ? 16'h5e00 :  // <0483> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h8dd ? 16'h6214 :  // <0483> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h8de ? 16'h0015 :  // <0483> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h8df ? 16'h0016 :  // <0483> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h8e0 ? 16'h0601 :  // <0484> b = 1
addr == 16'h8e1 ? 16'hc800 :  // <0485> a = a+b
addr == 16'h8e2 ? 16'h0300 :  // <0485> "
addr == 16'h8e3 ? 16'h6c00 :  // <0486> leds = a
addr == 16'h8e4 ? 16'h5e00 :  // <0487> ram $ram_daq_pass_cnt = a // av_ad_hi = 0
addr == 16'h8e5 ? 16'h6214 :  // <0487> ram $ram_daq_pass_cnt = a // av_ad_lo = 20
addr == 16'h8e6 ? 16'h5400 :  // <0487> ram $ram_daq_pass_cnt = a // av_write_data = a
addr == 16'h8e7 ? 16'hfba0 :  // <0488> call :put4x
addr == 16'h8e8 ? 16'h00c3 :  // <0488> "
addr == 16'h8e9 ? 16'hfc00 :  // <0488> "

addr == 16'h8ea ? 16'h03a0 :  // <0490> a = :rpm_msg
addr == 16'h8eb ? 16'h08cd :  // <0490> "
addr == 16'h8ec ? 16'hfba0 :  // <0491> call :print_nt
addr == 16'h8ed ? 16'h014f :  // <0491> "
addr == 16'h8ee ? 16'hfc00 :  // <0491> "
addr == 16'h8ef ? 16'h0200 :  // <0492> a = 0
addr == 16'h8f0 ? 16'h5e00 :  // <0493> ram x = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h8f1 ? 16'h627e :  // <0493> ram x = $ram_rpm_valid // av_ad_lo = 126
addr == 16'h8f2 ? 16'h1015 :  // <0493> ram x = $ram_rpm_valid // x = av_write_data // start read cycle
addr == 16'h8f3 ? 16'h1016 :  // <0493> ram x = $ram_rpm_valid // x = av_read_data // finish read cycle

addr == 16'h8f4 ? 16'h0004 :  // <0496> a = x
addr == 16'h8f5 ? 16'h0600 :  // <0496> b = 0

addr == 16'h8f6 ? 16'he007 :  // <0494> br eq :else_2294
addr == 16'h8f7 ? 16'h08fc :  // <0494> "

addr == 16'h8f8 ? 16'h5e00 :  // <0495> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h8f9 ? 16'h627c :  // <0495> ram a = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h8fa ? 16'h0015 :  // <0495> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h8fb ? 16'h0016 :  // <0495> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle

addr == 16'h8fc ? 16'hfba0 :  // <0497> call :put4x
addr == 16'h8fd ? 16'h00c3 :  // <0497> "
addr == 16'h8fe ? 16'hfc00 :  // <0497> "

addr == 16'h8ff ? 16'h03a0 :  // <0499> a = :puff_len_msg
addr == 16'h900 ? 16'h08d1 :  // <0499> "
addr == 16'h901 ? 16'hfba0 :  // <0500> call :print_nt
addr == 16'h902 ? 16'h014f :  // <0500> "
addr == 16'h903 ? 16'hfc00 :  // <0500> "
addr == 16'h904 ? 16'h0021 :  // <0501> a = puff_len_us
addr == 16'h905 ? 16'hfba0 :  // <0502> call :put4x
addr == 16'h906 ? 16'h00c3 :  // <0502> "
addr == 16'h907 ? 16'hfc00 :  // <0502> "
addr == 16'h908 ? 16'h022c :  // <0503> a = 44 // putasc ","
addr == 16'h909 ? 16'hfba0 :  // <0503> putasc ","
addr == 16'h90a ? 16'h009b :  // <0503> "
addr == 16'h90b ? 16'hfc00 :  // <0503> "
addr == 16'h90c ? 16'h5e00 :  // <0504> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h90d ? 16'h6292 :  // <0504> ram a = $ram_puff_count // av_ad_lo = 146
addr == 16'h90e ? 16'h0015 :  // <0504> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h90f ? 16'h0016 :  // <0504> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h910 ? 16'hfba0 :  // <0505> call :put4x
addr == 16'h911 ? 16'h00c3 :  // <0505> "
addr == 16'h912 ? 16'hfc00 :  // <0505> "

addr == 16'h913 ? 16'h03a0 :  // <0507> a = :o2_msg
addr == 16'h914 ? 16'h08d4 :  // <0507> "
addr == 16'h915 ? 16'hfba0 :  // <0508> call :print_nt
addr == 16'h916 ? 16'h014f :  // <0508> "
addr == 16'h917 ? 16'hfc00 :  // <0508> "
addr == 16'h918 ? 16'h0205 :  // <0509> a = $o2_adc_channel

addr == 16'h919 ? 16'h0351 :  // <0510> a = a<<1
addr == 16'h91a ? 16'h0626 :  // <0510> b = 38
addr == 16'h91b ? 16'h5e00 :  // <0510> av_ad_hi = 0
addr == 16'h91c ? 16'h6300 :  // <0510> av_ad_lo = ad0
addr == 16'h91d ? 16'h0415 :  // <0510> b = av_write_data
addr == 16'h91e ? 16'h0416 :  // <0510> b = av_read_data

addr == 16'h91f ? 16'h0001 :  // <0511> a = b
addr == 16'h920 ? 16'hfba0 :  // <0512> call :put4x
addr == 16'h921 ? 16'h00c3 :  // <0512> "
addr == 16'h922 ? 16'hfc00 :  // <0512> "

addr == 16'h923 ? 16'h03a0 :  // <0514> a = :tps_msg
addr == 16'h924 ? 16'h08d7 :  // <0514> "
addr == 16'h925 ? 16'hfba0 :  // <0515> call :print_nt
addr == 16'h926 ? 16'h014f :  // <0515> "
addr == 16'h927 ? 16'hfc00 :  // <0515> "
addr == 16'h928 ? 16'h0206 :  // <0516> a = $tps_adc_channel

addr == 16'h929 ? 16'h0351 :  // <0517> a = a<<1
addr == 16'h92a ? 16'h0626 :  // <0517> b = 38
addr == 16'h92b ? 16'h5e00 :  // <0517> av_ad_hi = 0
addr == 16'h92c ? 16'h6300 :  // <0517> av_ad_lo = ad0
addr == 16'h92d ? 16'h0415 :  // <0517> b = av_write_data
addr == 16'h92e ? 16'h0416 :  // <0517> b = av_read_data

addr == 16'h92f ? 16'h0001 :  // <0518> a = b
addr == 16'h930 ? 16'hfba0 :  // <0519> call :put4x
addr == 16'h931 ? 16'h00c3 :  // <0519> "
addr == 16'h932 ? 16'hfc00 :  // <0519> "
addr == 16'h933 ? 16'h022c :  // <0520> a = 44 // putasc ","
addr == 16'h934 ? 16'hfba0 :  // <0520> putasc ","
addr == 16'h935 ? 16'h009b :  // <0520> "
addr == 16'h936 ? 16'hfc00 :  // <0520> "
addr == 16'h937 ? 16'h5e00 :  // <0521> ram a = $ram_tps_avg // av_ad_hi = 0
addr == 16'h938 ? 16'h62da :  // <0521> ram a = $ram_tps_avg // av_ad_lo = 218
addr == 16'h939 ? 16'h0015 :  // <0521> ram a = $ram_tps_avg // a = av_write_data // start read cycle
addr == 16'h93a ? 16'h0016 :  // <0521> ram a = $ram_tps_avg // a = av_read_data // finish read cycle
addr == 16'h93b ? 16'hfba0 :  // <0522> call :put4x
addr == 16'h93c ? 16'h00c3 :  // <0522> "
addr == 16'h93d ? 16'hfc00 :  // <0522> "
addr == 16'h93e ? 16'h022c :  // <0523> a = 44 // putasc ","
addr == 16'h93f ? 16'hfba0 :  // <0523> putasc ","
addr == 16'h940 ? 16'h009b :  // <0523> "
addr == 16'h941 ? 16'hfc00 :  // <0523> "
addr == 16'h942 ? 16'h5e00 :  // <0524> ram a = $ram_tps_state // av_ad_hi = 0
addr == 16'h943 ? 16'h62ce :  // <0524> ram a = $ram_tps_state // av_ad_lo = 206
addr == 16'h944 ? 16'h0015 :  // <0524> ram a = $ram_tps_state // a = av_write_data // start read cycle
addr == 16'h945 ? 16'h0016 :  // <0524> ram a = $ram_tps_state // a = av_read_data // finish read cycle
addr == 16'h946 ? 16'h0630 :  // <0525> b = 48 // asc b = "0"
addr == 16'h947 ? 16'hc800 :  // <0526> a = a+b // putchar a+b
addr == 16'h948 ? 16'h0300 :  // <0526> "
addr == 16'h949 ? 16'hfba0 :  // <0526> putchar a+b
addr == 16'h94a ? 16'h009b :  // <0526> "
addr == 16'h94b ? 16'hfc00 :  // <0526> "

// start to acquire & report all anmux channels.
addr == 16'h94c ? 16'h0207 :  // <0529> a = ($anmux_num_channels - 1)
addr == 16'h94d ? 16'hfba0 :  // <0530> call :anmux_set_chn
addr == 16'h94e ? 16'h00b2 :  // <0530> "
addr == 16'h94f ? 16'hfc00 :  // <0530> "
addr == 16'h950 ? 16'h4a05 :  // <0531> mstimer1 = $anmux_settle_ms

// observe MCU utilization.  this RAM variable can be seen by the debugger.
addr == 16'h951 ? 16'h5e00 :  // <0534> ram $ram_mcu_usage_cnt = usage_count // av_ad_hi = 0
addr == 16'h952 ? 16'h6244 :  // <0534> ram $ram_mcu_usage_cnt = usage_count // av_ad_lo = 68
addr == 16'h953 ? 16'h540f :  // <0534> ram $ram_mcu_usage_cnt = usage_count // av_write_data = usage_count
addr == 16'h954 ? 16'h3e00 :  // <0535> usage_count = 0

addr == 16'h955 ? 16'hf80c :  // <0537> pop rtna // func start_daq_pass
addr == 16'h956 ? 16'h100c :  // <0537> pop x // "
addr == 16'h957 ? 16'hfc00 :  // <0537> swapra = nop

// ######## event mstimer1_handler // = 0x0958
// anmux signal has settled.

addr == 16'h958 ? 16'h5e00 :  // <0541> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h959 ? 16'h6236 :  // <0541> ram a = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'h95a ? 16'h0015 :  // <0541> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h95b ? 16'h0016 :  // <0541> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle

addr == 16'h95c ? 16'h0000 :  // <0546> a = a
addr == 16'h95d ? 16'h0600 :  // <0546> b = 0

addr == 16'h95e ? 16'he007 :  // <0542> br eq :else_2398
addr == 16'h95f ? 16'h0963 :  // <0542> "

// ADC is busy right now.  wait a while & try again.
addr == 16'h960 ? 16'h4a02 :  // <0544> mstimer1 = $anmux_retry_ms
addr == 16'h961 ? 16'he00f :  // <0545> event_return
addr == 16'h962 ? 16'h008e :  // <0545> "


// start a reading from the current anmux channel.
addr == 16'h963 ? 16'h0220 :  // <0549> a = 32 // putasc " "
addr == 16'h964 ? 16'hfba0 :  // <0549> putasc " "
addr == 16'h965 ? 16'h009b :  // <0549> "
addr == 16'h966 ? 16'hfc00 :  // <0549> "
addr == 16'h967 ? 16'h0273 :  // <0550> a = 115 // putasc "s"
addr == 16'h968 ? 16'hfba0 :  // <0550> putasc "s"
addr == 16'h969 ? 16'h009b :  // <0550> "
addr == 16'h96a ? 16'hfc00 :  // <0550> "
addr == 16'h96b ? 16'hfba0 :  // <0551> call :anmux_get_chn
addr == 16'h96c ? 16'h00b6 :  // <0551> "
addr == 16'h96d ? 16'hfc00 :  // <0551> "
addr == 16'h96e ? 16'h0630 :  // <0552> b = 48 // asc b = "0"
addr == 16'h96f ? 16'hc800 :  // <0553> a = a+b // putchar a+b
addr == 16'h970 ? 16'h0300 :  // <0553> "
addr == 16'h971 ? 16'hfba0 :  // <0553> putchar a+b
addr == 16'h972 ? 16'h009b :  // <0553> "
addr == 16'h973 ? 16'hfc00 :  // <0553> "
addr == 16'h974 ? 16'h023d :  // <0554> a = 61 // putasc "="
addr == 16'h975 ? 16'hfba0 :  // <0554> putasc "="
addr == 16'h976 ? 16'h009b :  // <0554> "
addr == 16'h977 ? 16'hfc00 :  // <0554> "
addr == 16'h978 ? 16'h2207 :  // <0555> pa = 7
addr == 16'h979 ? 16'hfba0 :  // <0555> callx  begin_adc_conversion  $anmux_adc_channel
addr == 16'h97a ? 16'h097e :  // <0555> "
addr == 16'h97b ? 16'hfc00 :  // <0555> "
addr == 16'h97c ? 16'he00f :  // <0556> end_event
addr == 16'h97d ? 16'h008e :  // <0556> "

// ######## func begin_adc_conversion // = 0x097e

// begin SPI transaction, specifying Nano ADC channel to take effect NEXT
// conversion after this one.

addr == 16'h97e ? 16'h5e00 :  // <0562> ram $ram_adc_chn_pending = next_channel // av_ad_hi = 0
addr == 16'h97f ? 16'h6236 :  // <0562> ram $ram_adc_chn_pending = next_channel // av_ad_lo = 54
addr == 16'h980 ? 16'h5408 :  // <0562> ram $ram_adc_chn_pending = next_channel // av_write_data = next_channel
addr == 16'h981 ? 16'h0008 :  // <0563> a = next_channel
addr == 16'h982 ? 16'h0352 :  // <0564> a = a<<4
addr == 16'h983 ? 16'h0352 :  // <0565> a = a<<4
addr == 16'h984 ? 16'h0351 :  // <0566> a = a<<1
addr == 16'h985 ? 16'h0351 :  // <0567> a = a<<1
addr == 16'h986 ? 16'h0351 :  // <0568> a = a<<1
addr == 16'h987 ? 16'h5000 :  // <0569> spi_data = a
addr == 16'h988 ? 16'h5e00 :  // <0570> ram $ram_adc_junk = 1 // av_ad_hi = 0
addr == 16'h989 ? 16'h6238 :  // <0570> ram $ram_adc_junk = 1 // av_ad_lo = 56
addr == 16'h98a ? 16'h5601 :  // <0570> ram $ram_adc_junk = 1 // av_write_data = 1

addr == 16'h98b ? 16'hfc00 :  // <0572> swapra = nop

// ######## event spi_done_handler // = 0x098c
// discard the results of the first SPI exchange with the ADC.  that's only for writing the channel num out to the ADC.
addr == 16'h98c ? 16'h5e00 :  // <0575> ram a = $ram_adc_junk // av_ad_hi = 0
addr == 16'h98d ? 16'h6238 :  // <0575> ram a = $ram_adc_junk // av_ad_lo = 56
addr == 16'h98e ? 16'h0015 :  // <0575> ram a = $ram_adc_junk // a = av_write_data // start read cycle
addr == 16'h98f ? 16'h0016 :  // <0575> ram a = $ram_adc_junk // a = av_read_data // finish read cycle

addr == 16'h990 ? 16'h0000 :  // <0587> a = a
addr == 16'h991 ? 16'h0600 :  // <0587> b = 0

addr == 16'h992 ? 16'he007 :  // <0576> br eq :else_2450
addr == 16'h993 ? 16'h09a3 :  // <0576> "

// start another SPI exchange to retrieve the actual reading.
addr == 16'h994 ? 16'h5e00 :  // <0578> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h995 ? 16'h6236 :  // <0578> ram a = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'h996 ? 16'h0015 :  // <0578> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h997 ? 16'h0016 :  // <0578> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle
addr == 16'h998 ? 16'h0352 :  // <0579> a = a<<4
addr == 16'h999 ? 16'h0352 :  // <0580> a = a<<4
addr == 16'h99a ? 16'h0351 :  // <0581> a = a<<1
addr == 16'h99b ? 16'h0351 :  // <0582> a = a<<1
addr == 16'h99c ? 16'h0351 :  // <0583> a = a<<1
addr == 16'h99d ? 16'h5000 :  // <0584> spi_data = a
addr == 16'h99e ? 16'h5e00 :  // <0585> ram $ram_adc_junk = 0 // av_ad_hi = 0
addr == 16'h99f ? 16'h6238 :  // <0585> ram $ram_adc_junk = 0 // av_ad_lo = 56
addr == 16'h9a0 ? 16'h5600 :  // <0585> ram $ram_adc_junk = 0 // av_write_data = 0
addr == 16'h9a1 ? 16'he00f :  // <0586> event_return
addr == 16'h9a2 ? 16'h008e :  // <0586> "


// memorize an actual ADC reading.
addr == 16'h9a3 ? 16'h5e00 :  // <0590> ram i = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h9a4 ? 16'h6236 :  // <0590> ram i = $ram_adc_chn_pending // av_ad_lo = 54
addr == 16'h9a5 ? 16'h0815 :  // <0590> ram i = $ram_adc_chn_pending // i = av_write_data // start read cycle
addr == 16'h9a6 ? 16'h0816 :  // <0590> ram i = $ram_adc_chn_pending // i = av_read_data // finish read cycle
addr == 16'h9a7 ? 16'h5e00 :  // <0591> ram $ram_adc_chn_pending = 0 // av_ad_hi = 0
addr == 16'h9a8 ? 16'h6236 :  // <0591> ram $ram_adc_chn_pending = 0 // av_ad_lo = 54
addr == 16'h9a9 ? 16'h5600 :  // <0591> ram $ram_adc_chn_pending = 0 // av_write_data = 0
addr == 16'h9aa ? 16'h0002 :  // <0592> a = i
addr == 16'h9ab ? 16'h0414 :  // <0593> b = spi_data

addr == 16'h9ac ? 16'h0351 :  // <0594> a = a<<1
addr == 16'h9ad ? 16'h3001 :  // <0594> push b // push b
addr == 16'h9ae ? 16'h0626 :  // <0594> b = 38
addr == 16'h9af ? 16'h5e00 :  // <0594> av_ad_hi = 0
addr == 16'h9b0 ? 16'h6300 :  // <0594> av_ad_lo = ad0
addr == 16'h9b1 ? 16'h540c :  // <0594> pop av_write_data // pop av_write_data


// react to ADC reading.

addr == 16'h9b2 ? 16'h0002 :  // <0601> a = i
addr == 16'h9b3 ? 16'h0606 :  // <0601> b = 6

addr == 16'h9b4 ? 16'he407 :  // <0597> bn eq :else_2484
addr == 16'h9b5 ? 16'h09bf :  // <0597> "

addr == 16'h9b6 ? 16'h2205 :  // <0598> pa = 5
addr == 16'h9b7 ? 16'hfba0 :  // <0598> callx  begin_adc_conversion  $o2_adc_channel
addr == 16'h9b8 ? 16'h097e :  // <0598> "
addr == 16'h9b9 ? 16'hfc00 :  // <0598> "
addr == 16'h9ba ? 16'hfba0 :  // <0599> callx  interpret_tps
addr == 16'h9bb ? 16'h0b5c :  // <0599> "
addr == 16'h9bc ? 16'hfc00 :  // <0599> "
addr == 16'h9bd ? 16'he00f :  // <0600> event_return
addr == 16'h9be ? 16'h008e :  // <0600> "


addr == 16'h9bf ? 16'h0002 :  // <0605> a = i
addr == 16'h9c0 ? 16'h0605 :  // <0605> b = 5

addr == 16'h9c1 ? 16'he407 :  // <0602> bn eq :else_2497
addr == 16'h9c2 ? 16'h09c8 :  // <0602> "

addr == 16'h9c3 ? 16'hfba0 :  // <0603> callx  plan_tick
addr == 16'h9c4 ? 16'h086c :  // <0603> "
addr == 16'h9c5 ? 16'hfc00 :  // <0603> "
addr == 16'h9c6 ? 16'he00f :  // <0604> event_return
addr == 16'h9c7 ? 16'h008e :  // <0604> "


addr == 16'h9c8 ? 16'h0002 :  // <0632> a = i
addr == 16'h9c9 ? 16'h0607 :  // <0632> b = 7

addr == 16'h9ca ? 16'he407 :  // <0606> bn eq :else_2506
addr == 16'h9cb ? 16'h09fd :  // <0606> "

// report anmux reading.
addr == 16'h9cc ? 16'h0014 :  // <0608> a = spi_data
addr == 16'h9cd ? 16'hfba0 :  // <0609> call :put4x
addr == 16'h9ce ? 16'h00c3 :  // <0609> "
addr == 16'h9cf ? 16'hfc00 :  // <0609> "

// memorize anmux reading.
addr == 16'h9d0 ? 16'hfba0 :  // <0612> call :anmux_get_chn
addr == 16'h9d1 ? 16'h00b6 :  // <0612> "
addr == 16'h9d2 ? 16'hfc00 :  // <0612> "
addr == 16'h9d3 ? 16'h0414 :  // <0613> b = spi_data

addr == 16'h9d4 ? 16'h0351 :  // <0614> a = a<<1
addr == 16'h9d5 ? 16'h3001 :  // <0614> push b // push b
addr == 16'h9d6 ? 16'h0616 :  // <0614> b = 22
addr == 16'h9d7 ? 16'h5e00 :  // <0614> av_ad_hi = 0
addr == 16'h9d8 ? 16'h6300 :  // <0614> av_ad_lo = ad0
addr == 16'h9d9 ? 16'h540c :  // <0614> pop av_write_data // pop av_write_data


// decrement anmux channel & start waiting again.
addr == 16'h9da ? 16'hfba0 :  // <0617> call :anmux_get_chn
addr == 16'h9db ? 16'h00b6 :  // <0617> "
addr == 16'h9dc ? 16'hfc00 :  // <0617> "

addr == 16'h9dd ? 16'h0000 :  // <0624> a = a
addr == 16'h9de ? 16'h0600 :  // <0624> b = 0

addr == 16'h9df ? 16'he007 :  // <0618> br eq :else_2527
addr == 16'h9e0 ? 16'h09ea :  // <0618> "

addr == 16'h9e1 ? 16'h0760 :  // <0619> b = -1
addr == 16'h9e2 ? 16'hc800 :  // <0620> a = a+b
addr == 16'h9e3 ? 16'h0300 :  // <0620> "
addr == 16'h9e4 ? 16'hfba0 :  // <0621> call :anmux_set_chn
addr == 16'h9e5 ? 16'h00b2 :  // <0621> "
addr == 16'h9e6 ? 16'hfc00 :  // <0621> "
addr == 16'h9e7 ? 16'h4a05 :  // <0622> mstimer1 = $anmux_settle_ms
addr == 16'h9e8 ? 16'he00f :  // <0623> event_return
addr == 16'h9e9 ? 16'h008e :  // <0623> "


// end of temperature daq pass.
addr == 16'h9ea ? 16'hfba0 :  // <0627> callx  report_plan
addr == 16'h9eb ? 16'h0b41 :  // <0627> "
addr == 16'h9ec ? 16'hfc00 :  // <0627> "
addr == 16'h9ed ? 16'hfba0 :  // <0628> callx  report_text_flags
addr == 16'h9ee ? 16'h0b0e :  // <0628> "
addr == 16'h9ef ? 16'hfc00 :  // <0628> "
addr == 16'h9f0 ? 16'h020d :  // <0629> a = 13 // puteol
addr == 16'h9f1 ? 16'hfba0 :  // <0629> puteol
addr == 16'h9f2 ? 16'h009b :  // <0629> "
addr == 16'h9f3 ? 16'hfc00 :  // <0629> "
addr == 16'h9f4 ? 16'h020a :  // <0629> a = 10 // puteol
addr == 16'h9f5 ? 16'hfba0 :  // <0629> puteol
addr == 16'h9f6 ? 16'h009b :  // <0629> "
addr == 16'h9f7 ? 16'hfc00 :  // <0629> "
addr == 16'h9f8 ? 16'h5e00 :  // <0630> ram $ram_dial_setting = spi_data // av_ad_hi = 0
addr == 16'h9f9 ? 16'h623a :  // <0630> ram $ram_dial_setting = spi_data // av_ad_lo = 58
addr == 16'h9fa ? 16'h5414 :  // <0630> ram $ram_dial_setting = spi_data // av_write_data = spi_data
addr == 16'h9fb ? 16'he00f :  // <0631> event_return
addr == 16'h9fc ? 16'h008e :  // <0631> "

addr == 16'h9fd ? 16'he00f :  // <0633> end_event
addr == 16'h9fe ? 16'h008e :  // <0633> "

// :power_lost_msg // = 0x09ff
// "PWL\x0"
addr == 16'h9ff ? 16'h5750 :  // <0636> WP
addr == 16'ha00 ? 16'h004c :  // <0636>  L

// ######## event power_lost_handler // = 0x0a01
// at this time we have less than 2 ms of usable run time left.

// this must be an uncommanded loss of main power, because if it was commanded,
// no more events would be handled; this event handler wouldn't have a chance to run.
// immediately set the power relay PWM to full power for a few seconds,
// in case the power relay opened accidentally e.g. due to a hard pothole.
addr == 16'ha01 ? 16'h7a00 :  // <0645> power_duty = $power_duty_closing
addr == 16'ha02 ? 16'h5e00 :  // <0646> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'ha03 ? 16'h6214 :  // <0646> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'ha04 ? 16'h0015 :  // <0646> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'ha05 ? 16'h0016 :  // <0646> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'ha06 ? 16'h0602 :  // <0647> b = $relay_hold_passes
addr == 16'ha07 ? 16'h5e00 :  // <0648> ram $ram_relay_hold_at_pass = a+b // av_ad_hi = 0
addr == 16'ha08 ? 16'h623e :  // <0648> ram $ram_relay_hold_at_pass = a+b // av_ad_lo = 62
addr == 16'ha09 ? 16'hc800 :  // <0648> ram $ram_relay_hold_at_pass = a+b // av_write_data = a+b
addr == 16'ha0a ? 16'h5700 :  // <0648> "

// pause any non-vital power-hogging operations, to conserve power for the EEPROM write.

// save persistent data in case the power remains down e.g. due to battery disconnect.
addr == 16'ha0b ? 16'hfba0 :  // <0653> callx  save_persistent_data
addr == 16'ha0c ? 16'h0a78 :  // <0653> "
addr == 16'ha0d ? 16'hfc00 :  // <0653> "

addr == 16'ha0e ? 16'h23a0 :  // <0655> pa = :power_lost_msg
addr == 16'ha0f ? 16'h09ff :  // <0655> "
addr == 16'ha10 ? 16'hfba0 :  // <0655> callx  set_text_flag  :power_lost_msg
addr == 16'ha11 ? 16'h0ad7 :  // <0655> "
addr == 16'ha12 ? 16'hfc00 :  // <0655> "
addr == 16'ha13 ? 16'he00f :  // <0656> end_event
addr == 16'ha14 ? 16'h008e :  // <0656> "

// :ign_off_msg // = 0x0a15
// "IGOF\x0"
addr == 16'ha15 ? 16'h4749 :  // <0659> GI
addr == 16'ha16 ? 16'h464f :  // <0659> FO
addr == 16'ha17 ? 16'h0000 :  // <0659>   

// ######## event ign_switch_off_handler // = 0x0a18
// set power-down deadline in RAM.  this makes the system remain powered for several more minutes, for cooldown data logging.
addr == 16'ha18 ? 16'h5e00 :  // <0663> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'ha19 ? 16'h6240 :  // <0663> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'ha1a ? 16'h0015 :  // <0663> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'ha1b ? 16'h0016 :  // <0663> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'ha1c ? 16'h060a :  // <0664> b = $power_extend_minutes
addr == 16'ha1d ? 16'h5e00 :  // <0665> ram $ram_power_down_at_min = a+b // av_ad_hi = 0
addr == 16'ha1e ? 16'h623c :  // <0665> ram $ram_power_down_at_min = a+b // av_ad_lo = 60
addr == 16'ha1f ? 16'hc800 :  // <0665> ram $ram_power_down_at_min = a+b // av_write_data = a+b
addr == 16'ha20 ? 16'h5700 :  // <0665> "
addr == 16'ha21 ? 16'h23a0 :  // <0666> pa = :ign_off_msg
addr == 16'ha22 ? 16'h0a15 :  // <0666> "
addr == 16'ha23 ? 16'hfba0 :  // <0666> callx  set_text_flag   :ign_off_msg
addr == 16'ha24 ? 16'h0ad7 :  // <0666> "
addr == 16'ha25 ? 16'hfc00 :  // <0666> "
addr == 16'ha26 ? 16'he00f :  // <0667> end_event
addr == 16'ha27 ? 16'h008e :  // <0667> "

// :ign_on_msg // = 0x0a28
// "IGON\x0"
addr == 16'ha28 ? 16'h4749 :  // <0670> GI
addr == 16'ha29 ? 16'h4e4f :  // <0670> NO
addr == 16'ha2a ? 16'h0000 :  // <0670>   

// ######## event ign_switch_on_handler // = 0x0a2b
addr == 16'ha2b ? 16'h5e00 :  // <0673> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'ha2c ? 16'h623c :  // <0673> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 60
addr == 16'ha2d ? 16'h5760 :  // <0673> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'ha2e ? 16'h23a0 :  // <0674> pa = :ign_on_msg
addr == 16'ha2f ? 16'h0a28 :  // <0674> "
addr == 16'ha30 ? 16'hfba0 :  // <0674> callx  set_text_flag   :ign_on_msg
addr == 16'ha31 ? 16'h0ad7 :  // <0674> "
addr == 16'ha32 ? 16'hfc00 :  // <0674> "
addr == 16'ha33 ? 16'he00f :  // <0675> end_event
addr == 16'ha34 ? 16'h008e :  // <0675> "

// ######## event puff1_done_handler // = 0x0a35
// puff just finished.  set length of next puff.
addr == 16'ha35 ? 16'h5e00 :  // <0679> ram puff_len_us = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'ha36 ? 16'h6290 :  // <0679> ram puff_len_us = $ram_next_puff_len_us // av_ad_lo = 144
addr == 16'ha37 ? 16'h8415 :  // <0679> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_write_data // start read cycle
addr == 16'ha38 ? 16'h8416 :  // <0679> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_read_data // finish read cycle

// count puffs.
addr == 16'ha39 ? 16'h5e00 :  // <0682> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'ha3a ? 16'h6292 :  // <0682> ram a = $ram_puff_count // av_ad_lo = 146
addr == 16'ha3b ? 16'h0015 :  // <0682> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'ha3c ? 16'h0016 :  // <0682> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'ha3d ? 16'h0601 :  // <0683> b = 1
addr == 16'ha3e ? 16'h5e00 :  // <0684> ram $ram_puff_count = a+b // av_ad_hi = 0
addr == 16'ha3f ? 16'h6292 :  // <0684> ram $ram_puff_count = a+b // av_ad_lo = 146
addr == 16'ha40 ? 16'hc800 :  // <0684> ram $ram_puff_count = a+b // av_write_data = a+b
addr == 16'ha41 ? 16'h5700 :  // <0684> "

// hack to set puff length strictly by a hard-wired knob.
// ram a = $ram_dial_setting
// a = a<<1
// a = a<<1
// a = a<<1
// bn az :nonzero
// a = 1
// :nonzero
// puff_len_us = a
addr == 16'ha42 ? 16'he00f :  // <0695> end_event
addr == 16'ha43 ? 16'h008e :  // <0695> "

// ######## func minute_events // = 0x0a44
addr == 16'ha44 ? 16'h303e :  // <0699> push rtna // func minute_events

addr == 16'ha45 ? 16'hfba0 :  // <0698> callx  check_power_down
addr == 16'ha46 ? 16'h0a61 :  // <0698> "
addr == 16'ha47 ? 16'hfc00 :  // <0698> "

addr == 16'ha48 ? 16'hf80c :  // <0700> pop rtna // func minute_events
addr == 16'ha49 ? 16'hfc00 :  // <0700> swapra = nop

// :power_hold_msg // = 0x0a4a
// "PWH\x0"
addr == 16'ha4a ? 16'h5750 :  // <0702> WP
addr == 16'ha4b ? 16'h0048 :  // <0702>  H

// ######## func check_power_relay // = 0x0a4c
addr == 16'ha4c ? 16'h303e :  // <0712> push rtna // func check_power_relay

addr == 16'ha4d ? 16'h5e00 :  // <0705> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'ha4e ? 16'h6214 :  // <0705> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'ha4f ? 16'h0015 :  // <0705> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'ha50 ? 16'h0016 :  // <0705> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'ha51 ? 16'h5e00 :  // <0706> ram b = $ram_relay_hold_at_pass // av_ad_hi = 0
addr == 16'ha52 ? 16'h623e :  // <0706> ram b = $ram_relay_hold_at_pass // av_ad_lo = 62
addr == 16'ha53 ? 16'h0415 :  // <0706> ram b = $ram_relay_hold_at_pass // b = av_write_data // start read cycle
addr == 16'ha54 ? 16'h0416 :  // <0706> ram b = $ram_relay_hold_at_pass // b = av_read_data // finish read cycle

addr == 16'ha55 ? 16'h0000 :  // <0711> a = a
addr == 16'ha56 ? 16'h0401 :  // <0711> b = b

addr == 16'ha57 ? 16'he407 :  // <0707> bn eq :else_2647
addr == 16'ha58 ? 16'h0a5f :  // <0707> "

// time to begin "solenoid saver" coil power reduction by PWM.
addr == 16'ha59 ? 16'h7a19 :  // <0709> power_duty = $power_duty_holding
addr == 16'ha5a ? 16'h23a0 :  // <0710> pa = :power_hold_msg
addr == 16'ha5b ? 16'h0a4a :  // <0710> "
addr == 16'ha5c ? 16'hfba0 :  // <0710> callx  set_text_flag  :power_hold_msg
addr == 16'ha5d ? 16'h0ad7 :  // <0710> "
addr == 16'ha5e ? 16'hfc00 :  // <0710> "


addr == 16'ha5f ? 16'hf80c :  // <0713> pop rtna // func check_power_relay
addr == 16'ha60 ? 16'hfc00 :  // <0713> swapra = nop

// ######## func check_power_down // = 0x0a61

// check power-down deadline in RAM.
addr == 16'ha61 ? 16'h5e00 :  // <0716> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'ha62 ? 16'h6240 :  // <0716> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'ha63 ? 16'h0015 :  // <0716> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'ha64 ? 16'h0016 :  // <0716> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'ha65 ? 16'h5e00 :  // <0717> ram b = $ram_power_down_at_min // av_ad_hi = 0
addr == 16'ha66 ? 16'h623c :  // <0717> ram b = $ram_power_down_at_min // av_ad_lo = 60
addr == 16'ha67 ? 16'h0415 :  // <0717> ram b = $ram_power_down_at_min // b = av_write_data // start read cycle
addr == 16'ha68 ? 16'h0416 :  // <0717> ram b = $ram_power_down_at_min // b = av_read_data // finish read cycle

addr == 16'ha69 ? 16'h0000 :  // <0720> a = a
addr == 16'ha6a ? 16'h0401 :  // <0720> b = b

addr == 16'ha6b ? 16'he407 :  // <0718> bn eq :else_2667
addr == 16'ha6c ? 16'h0a6f :  // <0718> "

addr == 16'ha6d ? 16'he00f :  // <0719> jmp :power_down
addr == 16'ha6e ? 16'h0a70 :  // <0719> "


addr == 16'ha6f ? 16'hfc00 :  // <0722> swapra = nop

// :power_down // = 0x0a70
// this code never returns.
addr == 16'ha70 ? 16'hfba0 :  // <0725> callx  save_persistent_data
addr == 16'ha71 ? 16'h0a78 :  // <0725> "
addr == 16'ha72 ? 16'hfc00 :  // <0725> "
addr == 16'ha73 ? 16'h7a32 :  // <0726> power_duty = $power_duty_opening
addr == 16'ha74 ? 16'h6fa0 :  // <0727> error_halt_code $err_power_down // leds = 0xfffc
addr == 16'ha75 ? 16'hfffc :  // <0727> "
addr == 16'ha76 ? 16'he00f :  // <0727> error_halt_code $err_power_down
addr == 16'ha77 ? 16'h0a76 :  // <0727> "

// ######## func save_persistent_data // = 0x0a78


addr == 16'ha78 ? 16'hfc00 :  // <0731> swapra = nop

// ######## func check_communication // = 0x0a79
addr == 16'ha79 ? 16'h303e :  // <0751> push rtna // func check_communication

addr == 16'ha7a ? 16'h5e00 :  // <0733> ram a = $ram_ftdi_downtime_remain_sec // av_ad_hi = 0
addr == 16'ha7b ? 16'h6212 :  // <0733> ram a = $ram_ftdi_downtime_remain_sec // av_ad_lo = 18
addr == 16'ha7c ? 16'h0015 :  // <0733> ram a = $ram_ftdi_downtime_remain_sec // a = av_write_data // start read cycle
addr == 16'ha7d ? 16'h0016 :  // <0733> ram a = $ram_ftdi_downtime_remain_sec // a = av_read_data // finish read cycle

addr == 16'ha7e ? 16'h0000 :  // <0741> a = a
addr == 16'ha7f ? 16'h0600 :  // <0741> b = 0

addr == 16'ha80 ? 16'he007 :  // <0734> br eq :else_2688
addr == 16'ha81 ? 16'h0a8f :  // <0734> "

addr == 16'ha82 ? 16'h0760 :  // <0735> b = -1
addr == 16'ha83 ? 16'hc800 :  // <0736> a = a+b
addr == 16'ha84 ? 16'h0300 :  // <0736> "
addr == 16'ha85 ? 16'h5e00 :  // <0737> ram $ram_ftdi_downtime_remain_sec = a // av_ad_hi = 0
addr == 16'ha86 ? 16'h6212 :  // <0737> ram $ram_ftdi_downtime_remain_sec = a // av_ad_lo = 18
addr == 16'ha87 ? 16'h5400 :  // <0737> ram $ram_ftdi_downtime_remain_sec = a // av_write_data = a

addr == 16'ha88 ? 16'h0000 :  // <0740> a = a
addr == 16'ha89 ? 16'h0600 :  // <0740> b = 0

addr == 16'ha8a ? 16'he407 :  // <0738> bn eq :else_2698
addr == 16'ha8b ? 16'h0a8f :  // <0738> "

addr == 16'ha8c ? 16'hfba0 :  // <0739> callx  ftdi_power_on
addr == 16'ha8d ? 16'h0ac3 :  // <0739> "
addr == 16'ha8e ? 16'hfc00 :  // <0739> "



addr == 16'ha8f ? 16'h5e00 :  // <0743> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'ha90 ? 16'h6240 :  // <0743> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'ha91 ? 16'h0015 :  // <0743> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'ha92 ? 16'h0016 :  // <0743> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'ha93 ? 16'h5e00 :  // <0744> ram b = $ram_comm_restart_at_min // av_ad_hi = 0
addr == 16'ha94 ? 16'h6210 :  // <0744> ram b = $ram_comm_restart_at_min // av_ad_lo = 16
addr == 16'ha95 ? 16'h0415 :  // <0744> ram b = $ram_comm_restart_at_min // b = av_write_data // start read cycle
addr == 16'ha96 ? 16'h0416 :  // <0744> ram b = $ram_comm_restart_at_min // b = av_read_data // finish read cycle

addr == 16'ha97 ? 16'h0000 :  // <0750> a = a
addr == 16'ha98 ? 16'h0401 :  // <0750> b = b

addr == 16'ha99 ? 16'he407 :  // <0745> bn eq :else_2713
addr == 16'ha9a ? 16'h0aa4 :  // <0745> "

// comm restart is required.
addr == 16'ha9b ? 16'hfba0 :  // <0747> callx  postpone_comm_restart
addr == 16'ha9c ? 16'h0aa6 :  // <0747> "
addr == 16'ha9d ? 16'hfc00 :  // <0747> "
addr == 16'ha9e ? 16'h5e00 :  // <0748> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_hi = 0
addr == 16'ha9f ? 16'h6212 :  // <0748> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_lo = 18
addr == 16'haa0 ? 16'h5605 :  // <0748> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_write_data = 5
addr == 16'haa1 ? 16'hfba0 :  // <0749> callx  ftdi_power_off
addr == 16'haa2 ? 16'h0ab3 :  // <0749> "
addr == 16'haa3 ? 16'hfc00 :  // <0749> "


addr == 16'haa4 ? 16'hf80c :  // <0752> pop rtna // func check_communication
addr == 16'haa5 ? 16'hfc00 :  // <0752> swapra = nop

// ######## func postpone_comm_restart // = 0x0aa6

addr == 16'haa6 ? 16'h5e00 :  // <0754> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'haa7 ? 16'h6240 :  // <0754> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'haa8 ? 16'h0015 :  // <0754> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'haa9 ? 16'h0016 :  // <0754> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'haaa ? 16'h0602 :  // <0755> b = $comm_grace_period_min
addr == 16'haab ? 16'h5e00 :  // <0756> ram $ram_comm_restart_at_min = a+b // av_ad_hi = 0
addr == 16'haac ? 16'h6210 :  // <0756> ram $ram_comm_restart_at_min = a+b // av_ad_lo = 16
addr == 16'haad ? 16'hc800 :  // <0756> ram $ram_comm_restart_at_min = a+b // av_write_data = a+b
addr == 16'haae ? 16'h5700 :  // <0756> "

addr == 16'haaf ? 16'hfc00 :  // <0758> swapra = nop

// :ftdi_off_msg // = 0x0ab0
// "FTOF\x0"
addr == 16'hab0 ? 16'h5446 :  // <0760> TF
addr == 16'hab1 ? 16'h464f :  // <0760> FO
addr == 16'hab2 ? 16'h0000 :  // <0760>   

// ######## func ftdi_power_off // = 0x0ab3
addr == 16'hab3 ? 16'h303e :  // <0767> push rtna // func ftdi_power_off

addr == 16'hab4 ? 16'h001c :  // <0763> a = board_ctrl
addr == 16'hab5 ? 16'h07a0 :  // <0764> b = $not_ftdi_power_mask
addr == 16'hab6 ? 16'hff7f :  // <0764> "
addr == 16'hab7 ? 16'hc800 :  // <0765> board_ctrl = and
addr == 16'hab8 ? 16'h7330 :  // <0765> "
addr == 16'hab9 ? 16'h23a0 :  // <0766> pa = :ftdi_off_msg
addr == 16'haba ? 16'h0ab0 :  // <0766> "
addr == 16'habb ? 16'hfba0 :  // <0766> callx  set_text_flag  :ftdi_off_msg
addr == 16'habc ? 16'h0ad7 :  // <0766> "
addr == 16'habd ? 16'hfc00 :  // <0766> "

addr == 16'habe ? 16'hf80c :  // <0768> pop rtna // func ftdi_power_off
addr == 16'habf ? 16'hfc00 :  // <0768> swapra = nop

// :ftdi_on_msg // = 0x0ac0
// "FTON\x0"
addr == 16'hac0 ? 16'h5446 :  // <0770> TF
addr == 16'hac1 ? 16'h4e4f :  // <0770> NO
addr == 16'hac2 ? 16'h0000 :  // <0770>   

// ######## func ftdi_power_on // = 0x0ac3
addr == 16'hac3 ? 16'h303e :  // <0777> push rtna // func ftdi_power_on

addr == 16'hac4 ? 16'h001c :  // <0773> a = board_ctrl
addr == 16'hac5 ? 16'h0680 :  // <0774> b = $ftdi_power_mask
addr == 16'hac6 ? 16'hc800 :  // <0775> board_ctrl = or
addr == 16'hac7 ? 16'h7334 :  // <0775> "
addr == 16'hac8 ? 16'h23a0 :  // <0776> pa = :ftdi_on_msg
addr == 16'hac9 ? 16'h0ac0 :  // <0776> "
addr == 16'haca ? 16'hfba0 :  // <0776> callx  set_text_flag  :ftdi_on_msg
addr == 16'hacb ? 16'h0ad7 :  // <0776> "
addr == 16'hacc ? 16'hfc00 :  // <0776> "

addr == 16'hacd ? 16'hf80c :  // <0778> pop rtna // func ftdi_power_on
addr == 16'hace ? 16'hfc00 :  // <0778> swapra = nop

// ######## func clear_ram_page // = 0x0acf

addr == 16'hacf ? 16'h0200 :  // <0780> a = 0
addr == 16'had0 ? 16'h0602 :  // <0781> b = 2
// :clear_next_word // = 0x0ad1
addr == 16'had1 ? 16'h6000 :  // <0783> av_ad_lo = a
addr == 16'had2 ? 16'h5600 :  // <0784> av_write_data = 0
addr == 16'had3 ? 16'h0300 :  // <0785> a = ad0
addr == 16'had4 ? 16'he400 :  // <0786> bn az :clear_next_word
addr == 16'had5 ? 16'h0ad1 :  // <0786> "

addr == 16'had6 ? 16'hfc00 :  // <0788> swapra = nop

// ######## func set_text_flag // = 0x0ad7

addr == 16'had7 ? 16'h0408 :  // <0790> b = flag_addr
addr == 16'had8 ? 16'h5e00 :  // <0791> ram a = $ram_next_tfp_idx // av_ad_hi = 0
addr == 16'had9 ? 16'h6256 :  // <0791> ram a = $ram_next_tfp_idx // av_ad_lo = 86
addr == 16'hada ? 16'h0015 :  // <0791> ram a = $ram_next_tfp_idx // a = av_write_data // start read cycle
addr == 16'hadb ? 16'h0016 :  // <0791> ram a = $ram_next_tfp_idx // a = av_read_data // finish read cycle

addr == 16'hadc ? 16'h0351 :  // <0792> a = a<<1
addr == 16'hadd ? 16'h3001 :  // <0792> push b // push b
addr == 16'hade ? 16'h0646 :  // <0792> b = 70
addr == 16'hadf ? 16'h5e00 :  // <0792> av_ad_hi = 0
addr == 16'hae0 ? 16'h6300 :  // <0792> av_ad_lo = ad0
addr == 16'hae1 ? 16'h540c :  // <0792> pop av_write_data // pop av_write_data

addr == 16'hae2 ? 16'h0008 :  // <0793> a = flag_addr
addr == 16'hae3 ? 16'h0760 :  // <0794> b = -1
addr == 16'hae4 ? 16'hc800 :  // <0795> a = a+b
addr == 16'hae5 ? 16'h0300 :  // <0795> "
addr == 16'hae6 ? 16'h0607 :  // <0796> b = $tfp_mask
addr == 16'hae7 ? 16'h5e00 :  // <0797> ram $ram_next_tfp_idx = and // av_ad_hi = 0
addr == 16'hae8 ? 16'h6256 :  // <0797> ram $ram_next_tfp_idx = and // av_ad_lo = 86
addr == 16'hae9 ? 16'hc800 :  // <0797> ram $ram_next_tfp_idx = and // av_write_data = and
addr == 16'haea ? 16'h5730 :  // <0797> "

addr == 16'haeb ? 16'hfc00 :  // <0799> swapra = nop

// ######## func unique_text_flag // = 0x0aec
addr == 16'haec ? 16'h3002 :  // <0810> push i // func unique_text_flag
addr == 16'haed ? 16'h303e :  // <0810> push rtna // "

addr == 16'haee ? 16'h0a00 :  // <0807> i = 0
// :loop_2798 // = 0x0aef

addr == 16'haef ? 16'h0002 :  // <0801> a = i

addr == 16'haf0 ? 16'h0351 :  // <0802> a = a<<1
addr == 16'haf1 ? 16'h0646 :  // <0802> b = 70
addr == 16'haf2 ? 16'h5e00 :  // <0802> av_ad_hi = 0
addr == 16'haf3 ? 16'h6300 :  // <0802> av_ad_lo = ad0
addr == 16'haf4 ? 16'h0415 :  // <0802> b = av_write_data
addr == 16'haf5 ? 16'h0416 :  // <0802> b = av_read_data


addr == 16'haf6 ? 16'h0001 :  // <0805> a = b
addr == 16'haf7 ? 16'h0408 :  // <0805> b = flag_addr

addr == 16'haf8 ? 16'he407 :  // <0803> bn eq :else_2808
addr == 16'haf9 ? 16'h0afc :  // <0803> "

addr == 16'hafa ? 16'he00f :  // <0804> jmp :skip
addr == 16'hafb ? 16'h0b08 :  // <0804> "



addr == 16'hafc ? 16'h0002 :  // <0807> a = i
addr == 16'hafd ? 16'h0601 :  // <0807> b = 1
addr == 16'hafe ? 16'hc800 :  // <0807> i = a+b
addr == 16'haff ? 16'h0b00 :  // <0807> "


addr == 16'hb00 ? 16'h0002 :  // <0807> a = i
addr == 16'hb01 ? 16'h0608 :  // <0807> b = $num_text_flag_pointers
addr == 16'hb02 ? 16'he005 :  // <0807> br lt :loop_2798
addr == 16'hb03 ? 16'h0aef :  // <0807> "

// :end_2798 // = 0x0b04
addr == 16'hb04 ? 16'h2008 :  // <0808> pa = flag_addr
addr == 16'hb05 ? 16'hfba0 :  // <0808> callx  set_text_flag  flag_addr
addr == 16'hb06 ? 16'h0ad7 :  // <0808> "
addr == 16'hb07 ? 16'hfc00 :  // <0808> "
// :skip // = 0x0b08

addr == 16'hb08 ? 16'hf80c :  // <0811> pop rtna // func unique_text_flag
addr == 16'hb09 ? 16'h080c :  // <0811> pop i // "
addr == 16'hb0a ? 16'hfc00 :  // <0811> swapra = nop

// :text_flags_msg // = 0x0b0b
// " tf=\x0"
addr == 16'hb0b ? 16'h7420 :  // <0813> t 
addr == 16'hb0c ? 16'h3d66 :  // <0813> =f
addr == 16'hb0d ? 16'h0000 :  // <0813>   

// ######## func report_text_flags // = 0x0b0e
addr == 16'hb0e ? 16'h3002 :  // <0829> push i // func report_text_flags
addr == 16'hb0f ? 16'h303e :  // <0829> push rtna // "

addr == 16'hb10 ? 16'h03a0 :  // <0816> a = :text_flags_msg
addr == 16'hb11 ? 16'h0b0b :  // <0816> "
addr == 16'hb12 ? 16'hfba0 :  // <0817> call :print_nt
addr == 16'hb13 ? 16'h014f :  // <0817> "
addr == 16'hb14 ? 16'hfc00 :  // <0817> "
addr == 16'hb15 ? 16'h0a00 :  // <0828> i = 0
// :loop_2837 // = 0x0b16

addr == 16'hb16 ? 16'h0002 :  // <0818> a = i

addr == 16'hb17 ? 16'h0351 :  // <0819> a = a<<1
addr == 16'hb18 ? 16'h0646 :  // <0819> b = 70
addr == 16'hb19 ? 16'h5e00 :  // <0819> av_ad_hi = 0
addr == 16'hb1a ? 16'h6300 :  // <0819> av_ad_lo = ad0
addr == 16'hb1b ? 16'h0415 :  // <0819> b = av_write_data
addr == 16'hb1c ? 16'h0416 :  // <0819> b = av_read_data


addr == 16'hb1d ? 16'h0001 :  // <0826> a = b
addr == 16'hb1e ? 16'h0600 :  // <0826> b = 0

addr == 16'hb1f ? 16'he007 :  // <0820> br eq :else_2847
addr == 16'hb20 ? 16'h0b30 :  // <0820> "

addr == 16'hb21 ? 16'hfba0 :  // <0821> call :print_nt
addr == 16'hb22 ? 16'h014f :  // <0821> "
addr == 16'hb23 ? 16'hfc00 :  // <0821> "
addr == 16'hb24 ? 16'h022c :  // <0822> a = 44 // putasc ","
addr == 16'hb25 ? 16'hfba0 :  // <0822> putasc ","
addr == 16'hb26 ? 16'h009b :  // <0822> "
addr == 16'hb27 ? 16'hfc00 :  // <0822> "
addr == 16'hb28 ? 16'h0002 :  // <0823> a = i
addr == 16'hb29 ? 16'h0600 :  // <0824> b = 0

addr == 16'hb2a ? 16'h0351 :  // <0825> a = a<<1
addr == 16'hb2b ? 16'h3001 :  // <0825> push b // push b
addr == 16'hb2c ? 16'h0646 :  // <0825> b = 70
addr == 16'hb2d ? 16'h5e00 :  // <0825> av_ad_hi = 0
addr == 16'hb2e ? 16'h6300 :  // <0825> av_ad_lo = ad0
addr == 16'hb2f ? 16'h540c :  // <0825> pop av_write_data // pop av_write_data




addr == 16'hb30 ? 16'h0002 :  // <0828> a = i
addr == 16'hb31 ? 16'h0601 :  // <0828> b = 1
addr == 16'hb32 ? 16'hc800 :  // <0828> i = a+b
addr == 16'hb33 ? 16'h0b00 :  // <0828> "


addr == 16'hb34 ? 16'h0002 :  // <0828> a = i
addr == 16'hb35 ? 16'h0608 :  // <0828> b = $num_text_flag_pointers
addr == 16'hb36 ? 16'he005 :  // <0828> br lt :loop_2837
addr == 16'hb37 ? 16'h0b16 :  // <0828> "

// :end_2837 // = 0x0b38

addr == 16'hb38 ? 16'hf80c :  // <0830> pop rtna // func report_text_flags
addr == 16'hb39 ? 16'h080c :  // <0830> pop i // "
addr == 16'hb3a ? 16'hfc00 :  // <0830> swapra = nop

// :plan_msg // = 0x0b3b
// " pl=\x0"
addr == 16'hb3b ? 16'h7020 :  // <0832> p 
addr == 16'hb3c ? 16'h3d6c :  // <0832> =l
addr == 16'hb3d ? 16'h0000 :  // <0832>   
// :manual_trim_msg // = 0x0b3e
// " mt=\x0"
addr == 16'hb3e ? 16'h6d20 :  // <0834> m 
addr == 16'hb3f ? 16'h3d74 :  // <0834> =t
addr == 16'hb40 ? 16'h0000 :  // <0834>   

// ######## func report_plan // = 0x0b41
addr == 16'hb41 ? 16'h303e :  // <0846> push rtna // func report_plan

addr == 16'hb42 ? 16'h03a0 :  // <0837> a = :plan_msg
addr == 16'hb43 ? 16'h0b3b :  // <0837> "
addr == 16'hb44 ? 16'hfba0 :  // <0838> call :print_nt
addr == 16'hb45 ? 16'h014f :  // <0838> "
addr == 16'hb46 ? 16'hfc00 :  // <0838> "
addr == 16'hb47 ? 16'h5e00 :  // <0839> ram a = $ram_plan_name // av_ad_hi = 0
addr == 16'hb48 ? 16'h6288 :  // <0839> ram a = $ram_plan_name // av_ad_lo = 136
addr == 16'hb49 ? 16'h0015 :  // <0839> ram a = $ram_plan_name // a = av_write_data // start read cycle
addr == 16'hb4a ? 16'h0016 :  // <0839> ram a = $ram_plan_name // a = av_read_data // finish read cycle
addr == 16'hb4b ? 16'hfba0 :  // <0840> call :print_nt
addr == 16'hb4c ? 16'h014f :  // <0840> "
addr == 16'hb4d ? 16'hfc00 :  // <0840> "

addr == 16'hb4e ? 16'h03a0 :  // <0842> a = :manual_trim_msg
addr == 16'hb4f ? 16'h0b3e :  // <0842> "
addr == 16'hb50 ? 16'hfba0 :  // <0843> call :print_nt
addr == 16'hb51 ? 16'h014f :  // <0843> "
addr == 16'hb52 ? 16'hfc00 :  // <0843> "
addr == 16'hb53 ? 16'h5e00 :  // <0844> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'hb54 ? 16'h62ec :  // <0844> ram a = $ram_run_manual_trim_thou // av_ad_lo = 236
addr == 16'hb55 ? 16'h0015 :  // <0844> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'hb56 ? 16'h0016 :  // <0844> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle
addr == 16'hb57 ? 16'hfba0 :  // <0845> call :put4x
addr == 16'hb58 ? 16'h00c3 :  // <0845> "
addr == 16'hb59 ? 16'hfc00 :  // <0845> "

addr == 16'hb5a ? 16'hf80c :  // <0847> pop rtna // func report_plan
addr == 16'hb5b ? 16'hfc00 :  // <0847> swapra = nop

// ######## func interpret_tps // = 0x0b5c
addr == 16'hb5c ? 16'h3002 :  // <0935> push i // func interpret_tps
addr == 16'hb5d ? 16'h3004 :  // <0935> push x // "
addr == 16'hb5e ? 16'h3005 :  // <0935> push y // "
addr == 16'hb5f ? 16'h3006 :  // <0935> push ga // "
addr == 16'hb60 ? 16'h3007 :  // <0935> push gb // "
addr == 16'hb61 ? 16'h303e :  // <0935> push rtna // "

addr == 16'hb62 ? 16'h0206 :  // <0849> a = $tps_adc_channel

addr == 16'hb63 ? 16'h0351 :  // <0850> a = a<<1
addr == 16'hb64 ? 16'h0626 :  // <0850> b = 38
addr == 16'hb65 ? 16'h5e00 :  // <0850> av_ad_hi = 0
addr == 16'hb66 ? 16'h6300 :  // <0850> av_ad_lo = ad0
addr == 16'hb67 ? 16'h0415 :  // <0850> b = av_write_data
addr == 16'hb68 ? 16'h0416 :  // <0850> b = av_read_data

// reverse the scale.
addr == 16'hb69 ? 16'h03a0 :  // <0852> a = 0x0fff
addr == 16'hb6a ? 16'h0fff :  // <0852> "
addr == 16'hb6b ? 16'hc800 :  // <0853> b = xor
addr == 16'hb6c ? 16'h0738 :  // <0853> "
// memorize reading into slot 0 and shift history up 1 slot.  total up as we go.
addr == 16'hb6d ? 16'h1801 :  // <0855> ga = b
addr == 16'hb6e ? 16'h1200 :  // <0856> x = 0
addr == 16'hb6f ? 16'h0a00 :  // <0867> i = 0
// :loop_2927 // = 0x0b70

addr == 16'hb70 ? 16'h0002 :  // <0857> a = i

addr == 16'hb71 ? 16'h0351 :  // <0858> a = a<<1
addr == 16'hb72 ? 16'h06dc :  // <0858> b = 220
addr == 16'hb73 ? 16'h5e00 :  // <0858> av_ad_hi = 0
addr == 16'hb74 ? 16'h6300 :  // <0858> av_ad_lo = ad0
addr == 16'hb75 ? 16'h0415 :  // <0858> b = av_write_data
addr == 16'hb76 ? 16'h0416 :  // <0858> b = av_read_data

addr == 16'hb77 ? 16'h1c01 :  // <0859> gb = b
addr == 16'hb78 ? 16'h1401 :  // <0860> y = b
addr == 16'hb79 ? 16'hc800 :  // <0861> x = x+y
addr == 16'hb7a ? 16'h1320 :  // <0861> "
addr == 16'hb7b ? 16'h0002 :  // <0862> a = i
addr == 16'hb7c ? 16'h0406 :  // <0863> b = ga

addr == 16'hb7d ? 16'h0351 :  // <0864> a = a<<1
addr == 16'hb7e ? 16'h3001 :  // <0864> push b // push b
addr == 16'hb7f ? 16'h06dc :  // <0864> b = 220
addr == 16'hb80 ? 16'h5e00 :  // <0864> av_ad_hi = 0
addr == 16'hb81 ? 16'h6300 :  // <0864> av_ad_lo = ad0
addr == 16'hb82 ? 16'h540c :  // <0864> pop av_write_data // pop av_write_data

addr == 16'hb83 ? 16'h1807 :  // <0865> ga = gb


addr == 16'hb84 ? 16'h0002 :  // <0867> a = i
addr == 16'hb85 ? 16'h0601 :  // <0867> b = 1
addr == 16'hb86 ? 16'hc800 :  // <0867> i = a+b
addr == 16'hb87 ? 16'h0b00 :  // <0867> "


addr == 16'hb88 ? 16'h0002 :  // <0867> a = i
addr == 16'hb89 ? 16'h0604 :  // <0867> b = $tps_history_len
addr == 16'hb8a ? 16'he005 :  // <0867> br lt :loop_2927
addr == 16'hb8b ? 16'h0b70 :  // <0867> "

// :end_2927 // = 0x0b8c
// memorize average.
addr == 16'hb8c ? 16'h0004 :  // <0869> a = x
addr == 16'hb8d ? 16'h0350 :  // <0870> a = a>>1
addr == 16'hb8e ? 16'h1b50 :  // <0871> ga = a>>1
addr == 16'hb8f ? 16'h5e00 :  // <0872> ram $ram_tps_avg = ga // av_ad_hi = 0
addr == 16'hb90 ? 16'h62da :  // <0872> ram $ram_tps_avg = ga // av_ad_lo = 218
addr == 16'hb91 ? 16'h5406 :  // <0872> ram $ram_tps_avg = ga // av_write_data = ga
// interpret state by comparing vs. reference table.
// compare to idle reference.
addr == 16'hb92 ? 16'h0200 :  // <0875> a = 0

addr == 16'hb93 ? 16'h0351 :  // <0876> a = a<<1
addr == 16'hb94 ? 16'h06b4 :  // <0876> b = 180
addr == 16'hb95 ? 16'h5e00 :  // <0876> av_ad_hi = 0
addr == 16'hb96 ? 16'h6300 :  // <0876> av_ad_lo = ad0
addr == 16'hb97 ? 16'h0415 :  // <0876> b = av_write_data
addr == 16'hb98 ? 16'h0416 :  // <0876> b = av_read_data

addr == 16'hb99 ? 16'h0001 :  // <0877> a = b
addr == 16'hb9a ? 16'h0353 :  // <0878> a = a>>4
addr == 16'hb9b ? 16'hc800 :  // <0879> b = a+b
addr == 16'hb9c ? 16'h0700 :  // <0879> "

addr == 16'hb9d ? 16'h0006 :  // <0883> a = ga
addr == 16'hb9e ? 16'h0401 :  // <0883> b = b

addr == 16'hb9f ? 16'he405 :  // <0880> bn lt :else_2975
addr == 16'hba0 ? 16'h0ba6 :  // <0880> "

addr == 16'hba1 ? 16'h5e00 :  // <0881> ram $ram_tps_state = $tps_state_closed // av_ad_hi = 0
addr == 16'hba2 ? 16'h62ce :  // <0881> ram $ram_tps_state = $tps_state_closed // av_ad_lo = 206
addr == 16'hba3 ? 16'h5600 :  // <0881> ram $ram_tps_state = $tps_state_closed // av_write_data = 0
addr == 16'hba4 ? 16'he00f :  // <0882> jmp :end
addr == 16'hba5 ? 16'h0bf8 :  // <0882> "

// compare to wide open reference.
addr == 16'hba6 ? 16'h020c :  // <0885> a = ($num_tps_cells - 1)

addr == 16'hba7 ? 16'h0351 :  // <0886> a = a<<1
addr == 16'hba8 ? 16'h06b4 :  // <0886> b = 180
addr == 16'hba9 ? 16'h5e00 :  // <0886> av_ad_hi = 0
addr == 16'hbaa ? 16'h6300 :  // <0886> av_ad_lo = ad0
addr == 16'hbab ? 16'h0415 :  // <0886> b = av_write_data
addr == 16'hbac ? 16'h0416 :  // <0886> b = av_read_data

addr == 16'hbad ? 16'h1001 :  // <0887> x = b
addr == 16'hbae ? 16'h0001 :  // <0888> a = b
addr == 16'hbaf ? 16'h0350 :  // <0889> a = a>>1
addr == 16'hbb0 ? 16'h0350 :  // <0890> a = a>>1
addr == 16'hbb1 ? 16'h0760 :  // <0891> b = 0xffff
addr == 16'hbb2 ? 16'hc800 :  // <0892> y = xor
addr == 16'hbb3 ? 16'h1738 :  // <0892> "

addr == 16'hbb4 ? 16'h0006 :  // <0896> a = ga
addr == 16'hbb5 ? 16'hc800 :  // <0896> b = x+y
addr == 16'hbb6 ? 16'h0720 :  // <0896> "

addr == 16'hbb7 ? 16'he406 :  // <0893> bn gt :else_2999
addr == 16'hbb8 ? 16'h0bbe :  // <0893> "

addr == 16'hbb9 ? 16'h5e00 :  // <0894> ram $ram_tps_state = $tps_state_open // av_ad_hi = 0
addr == 16'hbba ? 16'h62ce :  // <0894> ram $ram_tps_state = $tps_state_open // av_ad_lo = 206
addr == 16'hbbb ? 16'h5604 :  // <0894> ram $ram_tps_state = $tps_state_open // av_write_data = 4
addr == 16'hbbc ? 16'he00f :  // <0895> jmp :end
addr == 16'hbbd ? 16'h0bf8 :  // <0895> "

// compare to current RPM's reference position.
//patch: rework this to compare to the next 2 tps reference cells instead of a fixed margin.
// that way always prevents it from enriching while the tps is still within same ref cell.
addr == 16'hbbe ? 16'h5e00 :  // <0900> ram pa = $ram_avg_rpm // av_ad_hi = 0
addr == 16'hbbf ? 16'h627c :  // <0900> ram pa = $ram_avg_rpm // av_ad_lo = 124
addr == 16'hbc0 ? 16'h2015 :  // <0900> ram pa = $ram_avg_rpm // pa = av_write_data // start read cycle
addr == 16'hbc1 ? 16'h2016 :  // <0900> ram pa = $ram_avg_rpm // pa = av_read_data // finish read cycle
addr == 16'hbc2 ? 16'hfba0 :  // <0901> callx  find_rpm_cell  pa  a
addr == 16'hbc3 ? 16'h0573 :  // <0901> "
addr == 16'hbc4 ? 16'hfc00 :  // <0901> "
addr == 16'hbc5 ? 16'h0008 :  // <0901> a = pa

addr == 16'hbc6 ? 16'h0351 :  // <0902> a = a<<1
addr == 16'hbc7 ? 16'h06b4 :  // <0902> b = 180
addr == 16'hbc8 ? 16'h5e00 :  // <0902> av_ad_hi = 0
addr == 16'hbc9 ? 16'h6300 :  // <0902> av_ad_lo = ad0
addr == 16'hbca ? 16'h0415 :  // <0902> b = av_write_data
addr == 16'hbcb ? 16'h0416 :  // <0902> b = av_read_data

addr == 16'hbcc ? 16'h1001 :  // <0903> x = b
// test if it's within 1/16 of reference.
addr == 16'hbcd ? 16'h0004 :  // <0905> a = x
addr == 16'hbce ? 16'h0353 :  // <0906> a = a>>4
addr == 16'hbcf ? 16'hc800 :  // <0907> a = a+b
addr == 16'hbd0 ? 16'h0300 :  // <0907> "

addr == 16'hbd1 ? 16'h0000 :  // <0911> a = a
addr == 16'hbd2 ? 16'h0406 :  // <0911> b = ga

addr == 16'hbd3 ? 16'he406 :  // <0908> bn gt :else_3027
addr == 16'hbd4 ? 16'h0bda :  // <0908> "

addr == 16'hbd5 ? 16'h5e00 :  // <0909> ram $ram_tps_state = $tps_state_cruise // av_ad_hi = 0
addr == 16'hbd6 ? 16'h62ce :  // <0909> ram $ram_tps_state = $tps_state_cruise // av_ad_lo = 206
addr == 16'hbd7 ? 16'h5601 :  // <0909> ram $ram_tps_state = $tps_state_cruise // av_write_data = 1
addr == 16'hbd8 ? 16'he00f :  // <0910> jmp :end
addr == 16'hbd9 ? 16'h0bf8 :  // <0910> "

// test if it's within 1/8 of reference.
addr == 16'hbda ? 16'h0004 :  // <0913> a = x
addr == 16'hbdb ? 16'h0350 :  // <0914> a = a>>1
addr == 16'hbdc ? 16'h0350 :  // <0915> a = a>>1
addr == 16'hbdd ? 16'h0350 :  // <0916> a = a>>1
addr == 16'hbde ? 16'h0404 :  // <0917> b = x
addr == 16'hbdf ? 16'hc800 :  // <0918> a = a+b
addr == 16'hbe0 ? 16'h0300 :  // <0918> "

addr == 16'hbe1 ? 16'h0000 :  // <0922> a = a
addr == 16'hbe2 ? 16'h0406 :  // <0922> b = ga

addr == 16'hbe3 ? 16'he406 :  // <0919> bn gt :else_3043
addr == 16'hbe4 ? 16'h0bea :  // <0919> "

addr == 16'hbe5 ? 16'h5e00 :  // <0920> ram $ram_tps_state = $tps_state_accel1 // av_ad_hi = 0
addr == 16'hbe6 ? 16'h62ce :  // <0920> ram $ram_tps_state = $tps_state_accel1 // av_ad_lo = 206
addr == 16'hbe7 ? 16'h5602 :  // <0920> ram $ram_tps_state = $tps_state_accel1 // av_write_data = 2
addr == 16'hbe8 ? 16'he00f :  // <0921> jmp :end
addr == 16'hbe9 ? 16'h0bf8 :  // <0921> "

// test if it's within 1/2 of reference.
addr == 16'hbea ? 16'h0004 :  // <0924> a = x
addr == 16'hbeb ? 16'h0350 :  // <0925> a = a>>1
addr == 16'hbec ? 16'h0404 :  // <0926> b = x
addr == 16'hbed ? 16'hc800 :  // <0927> a = a+b
addr == 16'hbee ? 16'h0300 :  // <0927> "

addr == 16'hbef ? 16'h0000 :  // <0931> a = a
addr == 16'hbf0 ? 16'h0406 :  // <0931> b = ga

addr == 16'hbf1 ? 16'he406 :  // <0928> bn gt :else_3057
addr == 16'hbf2 ? 16'h0bf8 :  // <0928> "

addr == 16'hbf3 ? 16'h5e00 :  // <0929> ram $ram_tps_state = $tps_state_accel2 // av_ad_hi = 0
addr == 16'hbf4 ? 16'h62ce :  // <0929> ram $ram_tps_state = $tps_state_accel2 // av_ad_lo = 206
addr == 16'hbf5 ? 16'h5603 :  // <0929> ram $ram_tps_state = $tps_state_accel2 // av_write_data = 3
addr == 16'hbf6 ? 16'he00f :  // <0930> jmp :end
addr == 16'hbf7 ? 16'h0bf8 :  // <0930> "

// in this case leave ram_tps_state as-is.

// :end // = 0x0bf8

addr == 16'hbf8 ? 16'hf80c :  // <0936> pop rtna // func interpret_tps
addr == 16'hbf9 ? 16'h1c0c :  // <0936> pop gb // "
addr == 16'hbfa ? 16'h180c :  // <0936> pop ga // "
addr == 16'hbfb ? 16'h140c :  // <0936> pop y // "
addr == 16'hbfc ? 16'h100c :  // <0936> pop x // "
addr == 16'hbfd ? 16'h080c :  // <0936> pop i // "
addr == 16'hbfe ? 16'hfc00 :  // <0936> swapra = nop

// ######## func jf_to_rpm // = 0x0bff
addr == 16'hbff ? 16'h303e :  // <0946> push rtna // func jf_to_rpm

// resolution = 32 rpm.
addr == 16'hc00 ? 16'h0408 :  // <0939> b = jiffies
addr == 16'hc01 ? 16'h03a0 :  // <0940> a = 0x5573
addr == 16'hc02 ? 16'h5573 :  // <0940> "
// = 700000 >> 5
addr == 16'hc03 ? 16'hfba0 :  // <0942> call :divide
addr == 16'hc04 ? 16'h018c :  // <0942> "
addr == 16'hc05 ? 16'hfc00 :  // <0942> "
addr == 16'hc06 ? 16'h0001 :  // <0943> a = b
addr == 16'hc07 ? 16'h0352 :  // <0944> a = a<<4
addr == 16'hc08 ? 16'h2351 :  // <0945> rpm = a<<1

addr == 16'hc09 ? 16'hf80c :  // <0947> pop rtna // func jf_to_rpm
addr == 16'hc0a ? 16'hfc00 :  // <0947> swapra = nop

// ######## func check_engine_stop // = 0x0c0b
addr == 16'hc0b ? 16'h303e :  // <0963> push rtna // func check_engine_stop

// returns 1 if transitioned to stop, else 0.

// transition to plan_stop if ignition switch is turned off AND rpm estimate is invalid.
// requiring both conditions prevents spurious noise readings from shutting down the injection.

addr == 16'hc0c ? 16'h001e :  // <0961> a = power_duty
addr == 16'hc0d ? 16'h0680 :  // <0961> b = ( 0x0080 )

addr == 16'hc0e ? 16'he003 :  // <0953> br and0z :else_3086
addr == 16'hc0f ? 16'h0c23 :  // <0953> "

addr == 16'hc10 ? 16'h5e00 :  // <0954> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'hc11 ? 16'h627e :  // <0954> ram a = $ram_rpm_valid // av_ad_lo = 126
addr == 16'hc12 ? 16'h0015 :  // <0954> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'hc13 ? 16'h0016 :  // <0954> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle

addr == 16'hc14 ? 16'h0000 :  // <0960> a = a
addr == 16'hc15 ? 16'h0600 :  // <0960> b = 0

addr == 16'hc16 ? 16'he407 :  // <0955> bn eq :else_3094
addr == 16'hc17 ? 16'h0c23 :  // <0955> "

addr == 16'hc18 ? 16'h5e00 :  // <0956> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'hc19 ? 16'h628e :  // <0956> ram rtna = $ram_destroy_plan_func // av_ad_lo = 142
addr == 16'hc1a ? 16'hf815 :  // <0956> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'hc1b ? 16'hf816 :  // <0956> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'hc1c ? 16'hfc00 :  // <0957> swapra = nop
addr == 16'hc1d ? 16'hfba0 :  // <0959> callx  init_plan_stop
addr == 16'hc1e ? 16'h0322 :  // <0959> "
addr == 16'hc1f ? 16'hfc00 :  // <0959> "
addr == 16'hc20 ? 16'h2201 :  // <0960> did_stop = 1
addr == 16'hc21 ? 16'hf80c :  // <0960> pop rtna // rtn 1
addr == 16'hc22 ? 16'hfc00 :  // <0959> swapra = nop


addr == 16'hc23 ? 16'h2200 :  // <0962> did_stop = 0
addr == 16'hc24 ? 16'hf80c :  // <0962> pop rtna // rtn 0
addr == 16'hc25 ? 16'hfc00 :  // <0961> swapra = nop

addr == 16'hc26 ? 16'hf80c :  // <0964> pop rtna // func check_engine_stop
addr == 16'hc27 ? 16'hfc00 :  // <0964> swapra = nop


        
                16'hxxxx;
        endmodule
    
