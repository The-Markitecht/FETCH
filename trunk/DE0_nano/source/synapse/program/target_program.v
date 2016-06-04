
        `include "header.v"

        module target_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.

addr == 16'h00 ? 16'he00f :  // <0004> jmp :main
addr == 16'h01 ? 16'h0753 :  // <0004> "


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
addr == 16'h8f ? 16'h07c1 :  // <0006> "
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
addr == 16'h23f ? 16'h0613 :  // <0019> ([label load_smap_cmd])
// " clsmap"
addr == 16'h240 ? 16'h6320 :  // <0020> c 
addr == 16'h241 ? 16'h736c :  // <0020> sl
addr == 16'h242 ? 16'h616d :  // <0020> am
addr == 16'h243 ? 16'h0070 :  // <0020>  p
addr == 16'h244 ? 16'h062f :  // <0021> ([label clear_smap_cmd])
// "   smap"
addr == 16'h245 ? 16'h2020 :  // <0022>   
addr == 16'h246 ? 16'h7320 :  // <0022> s 
addr == 16'h247 ? 16'h616d :  // <0022> am
addr == 16'h248 ? 16'h0070 :  // <0022>  p
addr == 16'h249 ? 16'h05ae :  // <0023> ([label dump_smap_cmd])
// "   ltps"
addr == 16'h24a ? 16'h2020 :  // <0024>   
addr == 16'h24b ? 16'h6c20 :  // <0024> l 
addr == 16'h24c ? 16'h7074 :  // <0024> pt
addr == 16'h24d ? 16'h0073 :  // <0024>  s
addr == 16'h24e ? 16'h0667 :  // <0025> ([label learn_tps_ref_cmd])
// " ldtpsr"
addr == 16'h24f ? 16'h6c20 :  // <0026> l 
addr == 16'h250 ? 16'h7464 :  // <0026> td
addr == 16'h251 ? 16'h7370 :  // <0026> sp
addr == 16'h252 ? 16'h0072 :  // <0026>  r
addr == 16'h253 ? 16'h0644 :  // <0027> ([label load_tps_ref_cmd])
// " ldtpse"
addr == 16'h254 ? 16'h6c20 :  // <0028> l 
addr == 16'h255 ? 16'h7464 :  // <0028> td
addr == 16'h256 ? 16'h7370 :  // <0028> sp
addr == 16'h257 ? 16'h0065 :  // <0028>  e
addr == 16'h258 ? 16'h0612 :  // <0029> ([label load_tps_enrich_cmd])
// "      ,"
addr == 16'h259 ? 16'h2020 :  // <0030>   
addr == 16'h25a ? 16'h2020 :  // <0030>   
addr == 16'h25b ? 16'h2020 :  // <0030>   
addr == 16'h25c ? 16'h002c :  // <0030>  ,
addr == 16'h25d ? 16'h067f :  // <0031> ([label trim_lean_cmd])
// "      ."
addr == 16'h25e ? 16'h2020 :  // <0032>   
addr == 16'h25f ? 16'h2020 :  // <0032>   
addr == 16'h260 ? 16'h2020 :  // <0032>   
addr == 16'h261 ? 16'h002e :  // <0032>  .
addr == 16'h262 ? 16'h0692 :  // <0033> ([label trim_rich_cmd])
// "      \["
addr == 16'h263 ? 16'h2020 :  // <0034>   
addr == 16'h264 ? 16'h2020 :  // <0034>   
addr == 16'h265 ? 16'h2020 :  // <0034>   
addr == 16'h266 ? 16'h005b :  // <0034>  [
addr == 16'h267 ? 16'h06a5 :  // <0035> ([label trim_2lean_cmd])
// "      \]"
addr == 16'h268 ? 16'h2020 :  // <0036>   
addr == 16'h269 ? 16'h2020 :  // <0036>   
addr == 16'h26a ? 16'h2020 :  // <0036>   
addr == 16'h26b ? 16'h005d :  // <0036>  ]
addr == 16'h26c ? 16'h06b8 :  // <0037> ([label trim_2rich_cmd])
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
addr == 16'h2cc ? 16'h0b07 :  // <0085> "
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
addr == 16'h311 ? 16'h06cb :  // <0132> "
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
addr == 16'h31c ? 16'h0467 :  // <0139> "
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
addr == 16'h324 ? 16'h083c :  // <0006> "
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
addr == 16'h375 ? 16'h083c :  // <0026> "
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
addr == 16'h38f ? 16'h0604 :  // <0040> b = $crank_max_puffs
addr == 16'h390 ? 16'he006 :  // <0041> br gt :puff_limit
addr == 16'h391 ? 16'h039f :  // <0041> "
// linear escalation from min to max puff length, at a slope of crank_incr_us_per_puff.
addr == 16'h392 ? 16'h07a0 :  // <0043> b = $crank_incr_us_per_puff
addr == 16'h393 ? 16'h09c4 :  // <0043> "
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
addr == 16'h3a1 ? 16'h5604 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_write_data = 4
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
addr == 16'h3aa ? 16'h0c3f :  // <0057> "
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
addr == 16'h416 ? 16'h0c3f :  // <0073> "
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
addr == 16'h42b ? 16'h06cb :  // <0081> "
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
addr == 16'h446 ? 16'h06cb :  // <0094> "
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
addr == 16'h458 ? 16'h0100 :  // <0064> 0x0100
addr == 16'h459 ? 16'h0540 :  // <0065> 0x0540
addr == 16'h45a ? 16'h0540 :  // <0066> 0x0540
addr == 16'h45b ? 16'h0540 :  // <0067> 0x0540
addr == 16'h45c ? 16'h0540 :  // <0068> 0x0540
addr == 16'h45d ? 16'h0540 :  // <0069> 0x0540
addr == 16'h45e ? 16'h0540 :  // <0070> 0x0540
addr == 16'h45f ? 16'h0540 :  // <0071> 0x0540
addr == 16'h460 ? 16'h0540 :  // <0072> 0x0540
addr == 16'h461 ? 16'h0540 :  // <0073> 0x0540
addr == 16'h462 ? 16'h0540 :  // <0074> 0x0540
addr == 16'h463 ? 16'h0540 :  // <0075> 0x0540
addr == 16'h464 ? 16'h0b00 :  // <0076> 0x0b00

// :plan_name_learn_stoich // = 0x0465
// "LN\x0"
addr == 16'h465 ? 16'h4e4c :  // <0079> NL
addr == 16'h466 ? 16'h0000 :  // <0079>   

// ######## func init_plan_learn_stoich // = 0x0467

// set up the learn_stoich plan.
addr == 16'h467 ? 16'h5e00 :  // <0083> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_ad_hi = 0
addr == 16'h468 ? 16'h63a0 :  // <0083> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_ad_lo = 348
addr == 16'h469 ? 16'h015c :  // <0083> "
addr == 16'h46a ? 16'h560a :  // <0083> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_write_data = 10

// memorize state.
addr == 16'h46b ? 16'h5e00 :  // <0086> ram $ram_plan_name = :plan_name_learn_stoich // av_ad_hi = 0
addr == 16'h46c ? 16'h6288 :  // <0086> ram $ram_plan_name = :plan_name_learn_stoich // av_ad_lo = 136
addr == 16'h46d ? 16'h57a0 :  // <0086> ram $ram_plan_name = :plan_name_learn_stoich // av_write_data = :plan_name_learn_stoich
addr == 16'h46e ? 16'h0465 :  // <0086> "
addr == 16'h46f ? 16'h5e00 :  // <0087> ram $ram_puff_len_func = :puff_len_learn_stoich // av_ad_hi = 0
addr == 16'h470 ? 16'h628a :  // <0087> ram $ram_puff_len_func = :puff_len_learn_stoich // av_ad_lo = 138
addr == 16'h471 ? 16'h57a0 :  // <0087> ram $ram_puff_len_func = :puff_len_learn_stoich // av_write_data = :puff_len_learn_stoich
addr == 16'h472 ? 16'h0481 :  // <0087> "
addr == 16'h473 ? 16'h5e00 :  // <0088> ram $ram_transition_func = :leave_learn_stoich // av_ad_hi = 0
addr == 16'h474 ? 16'h628c :  // <0088> ram $ram_transition_func = :leave_learn_stoich // av_ad_lo = 140
addr == 16'h475 ? 16'h57a0 :  // <0088> ram $ram_transition_func = :leave_learn_stoich // av_write_data = :leave_learn_stoich
addr == 16'h476 ? 16'h058b :  // <0088> "
addr == 16'h477 ? 16'h5e00 :  // <0089> ram $ram_destroy_plan_func = :destroy_plan_learn_stoich // av_ad_hi = 0
addr == 16'h478 ? 16'h628e :  // <0089> ram $ram_destroy_plan_func = :destroy_plan_learn_stoich // av_ad_lo = 142
addr == 16'h479 ? 16'h57a0 :  // <0089> ram $ram_destroy_plan_func = :destroy_plan_learn_stoich // av_write_data = :destroy_plan_learn_stoich
addr == 16'h47a ? 16'h047c :  // <0089> "

addr == 16'h47b ? 16'hfc00 :  // <0091> swapra = nop

// ######## func destroy_plan_learn_stoich // = 0x047c


addr == 16'h47c ? 16'hfc00 :  // <0094> swapra = nop

// :lrns_trim_up_msg // = 0x047d
// "trR\x0"
addr == 16'h47d ? 16'h7274 :  // <0096> rt
addr == 16'h47e ? 16'h0052 :  // <0096>  R
// :lrns_trim_down_msg // = 0x047f
// "trL\x0"
addr == 16'h47f ? 16'h7274 :  // <0098> rt
addr == 16'h480 ? 16'h004c :  // <0098>  L

// ######## func puff_len_learn_stoich // = 0x0481
addr == 16'h481 ? 16'h3002 :  // <0133> push i // func puff_len_learn_stoich
addr == 16'h482 ? 16'h3003 :  // <0133> push j // "
addr == 16'h483 ? 16'h3006 :  // <0133> push g6 // "
addr == 16'h484 ? 16'h3007 :  // <0133> push g7 // "
addr == 16'h485 ? 16'h303e :  // <0133> push rtna // "

addr == 16'h486 ? 16'h5e00 :  // <0101> ram i = $ram_lrns_ticks_remain // av_ad_hi = 0
addr == 16'h487 ? 16'h63a0 :  // <0101> ram i = $ram_lrns_ticks_remain // av_ad_lo = 348
addr == 16'h488 ? 16'h015c :  // <0101> "
addr == 16'h489 ? 16'h0815 :  // <0101> ram i = $ram_lrns_ticks_remain // i = av_write_data // start read cycle
addr == 16'h48a ? 16'h0816 :  // <0101> ram i = $ram_lrns_ticks_remain // i = av_read_data // finish read cycle

addr == 16'h48b ? 16'h0002 :  // <0132> a = i
addr == 16'h48c ? 16'h0600 :  // <0132> b = 0

addr == 16'h48d ? 16'he406 :  // <0102> bn gt :else_1165
addr == 16'h48e ? 16'h0497 :  // <0102> "

addr == 16'h48f ? 16'h0f60 :  // <0103> j = -1
addr == 16'h490 ? 16'h5e00 :  // <0104> ram $ram_lrns_ticks_remain = i+j // av_ad_hi = 0
addr == 16'h491 ? 16'h63a0 :  // <0104> ram $ram_lrns_ticks_remain = i+j // av_ad_lo = 348
addr == 16'h492 ? 16'h015c :  // <0104> "
addr == 16'h493 ? 16'hc800 :  // <0104> ram $ram_lrns_ticks_remain = i+j // av_write_data = i+j
addr == 16'h494 ? 16'h5710 :  // <0104> "

addr == 16'h495 ? 16'he00f :  // <0106> jmp :end_1165
addr == 16'h496 ? 16'h04d6 :  // <0106> "

addr == 16'h497 ? 16'h5e00 :  // <0107> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_ad_hi = 0
addr == 16'h498 ? 16'h63a0 :  // <0107> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_ad_lo = 348
addr == 16'h499 ? 16'h015c :  // <0107> "
addr == 16'h49a ? 16'h560a :  // <0107> ram $ram_lrns_ticks_remain = $lrns_ticks_per_o2_trim // av_write_data = 10

// i = old puff length, j = puff length increment.
addr == 16'h49b ? 16'h5e00 :  // <0110> ram i = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'h49c ? 16'h6290 :  // <0110> ram i = $ram_next_puff_len_us // av_ad_lo = 144
addr == 16'h49d ? 16'h0815 :  // <0110> ram i = $ram_next_puff_len_us // i = av_write_data // start read cycle
addr == 16'h49e ? 16'h0816 :  // <0110> ram i = $ram_next_puff_len_us // i = av_read_data // finish read cycle
addr == 16'h49f ? 16'h0e00 :  // <0111> j = 0
addr == 16'h4a0 ? 16'h5e00 :  // <0112> ram g6 = $ram_o2_state // av_ad_hi = 0
addr == 16'h4a1 ? 16'h63a0 :  // <0112> ram g6 = $ram_o2_state // av_ad_lo = 350
addr == 16'h4a2 ? 16'h015e :  // <0112> "
addr == 16'h4a3 ? 16'h1815 :  // <0112> ram g6 = $ram_o2_state // g6 = av_write_data // start read cycle
addr == 16'h4a4 ? 16'h1816 :  // <0112> ram g6 = $ram_o2_state // g6 = av_read_data // finish read cycle
addr == 16'h4a5 ? 16'hfba0 :  // <0113> callx  interpret_o2
addr == 16'h4a6 ? 16'h0546 :  // <0113> "
addr == 16'h4a7 ? 16'hfc00 :  // <0113> "
addr == 16'h4a8 ? 16'h5e00 :  // <0114> ram g7 = $ram_o2_state // av_ad_hi = 0
addr == 16'h4a9 ? 16'h63a0 :  // <0114> ram g7 = $ram_o2_state // av_ad_lo = 350
addr == 16'h4aa ? 16'h015e :  // <0114> "
addr == 16'h4ab ? 16'h1c15 :  // <0114> ram g7 = $ram_o2_state // g7 = av_write_data // start read cycle
addr == 16'h4ac ? 16'h1c16 :  // <0114> ram g7 = $ram_o2_state // g7 = av_read_data // finish read cycle

addr == 16'h4ad ? 16'h0007 :  // <0131> a = g7
addr == 16'h4ae ? 16'h0601 :  // <0131> b = 1

addr == 16'h4af ? 16'he407 :  // <0115> bn eq :else_1199
addr == 16'h4b0 ? 16'h04c6 :  // <0115> "

// sensing a lean condition.  trim up to enrich.

addr == 16'h4b1 ? 16'h0002 :  // <0119> a = i
addr == 16'h4b2 ? 16'h07a0 :  // <0119> b = 10000
addr == 16'h4b3 ? 16'h2710 :  // <0119> "

addr == 16'h4b4 ? 16'he405 :  // <0117> bn lt :else_1204
addr == 16'h4b5 ? 16'h04b8 :  // <0117> "

addr == 16'h4b6 ? 16'h0fa0 :  // <0118> j = $lrns_puff_step_up_us
addr == 16'h4b7 ? 16'h0258 :  // <0118> "

addr == 16'h4b8 ? 16'h23a0 :  // <0120> pa = :lrns_trim_up_msg
addr == 16'h4b9 ? 16'h047d :  // <0120> "
addr == 16'h4ba ? 16'hfba0 :  // <0120> callx  set_text_flag  :lrns_trim_up_msg
addr == 16'h4bb ? 16'h0b07 :  // <0120> "
addr == 16'h4bc ? 16'hfc00 :  // <0120> "

addr == 16'h4bd ? 16'h0006 :  // <0124> a = g6
addr == 16'h4be ? 16'h0602 :  // <0124> b = 2

addr == 16'h4bf ? 16'he407 :  // <0121> bn eq :else_1215
addr == 16'h4c0 ? 16'h04c4 :  // <0121> "

// o2 state just switched to lean.  adjust map.
addr == 16'h4c1 ? 16'hfba0 :  // <0123> callx  learn_smap
addr == 16'h4c2 ? 16'h04e2 :  // <0123> "
addr == 16'h4c3 ? 16'hfc00 :  // <0123> "


addr == 16'h4c4 ? 16'he00f :  // <0126> jmp :end_1199
addr == 16'h4c5 ? 16'h04d2 :  // <0126> "

// sensing a rich condition.  trim down to lean it out.

addr == 16'h4c6 ? 16'h0002 :  // <0130> a = i
addr == 16'h4c7 ? 16'h07a0 :  // <0130> b = 2000
addr == 16'h4c8 ? 16'h07d0 :  // <0130> "

addr == 16'h4c9 ? 16'he406 :  // <0128> bn gt :else_1225
addr == 16'h4ca ? 16'h04cd :  // <0128> "

addr == 16'h4cb ? 16'h0fa0 :  // <0129> j = $lrns_puff_step_down_us
addr == 16'h4cc ? 16'hffdf :  // <0129> "

addr == 16'h4cd ? 16'h23a0 :  // <0131> pa = :lrns_trim_down_msg
addr == 16'h4ce ? 16'h047f :  // <0131> "
addr == 16'h4cf ? 16'hfba0 :  // <0131> callx  set_text_flag  :lrns_trim_down_msg
addr == 16'h4d0 ? 16'h0b07 :  // <0131> "
addr == 16'h4d1 ? 16'hfc00 :  // <0131> "

addr == 16'h4d2 ? 16'h5e00 :  // <0132> ram $ram_next_puff_len_us = i+j // av_ad_hi = 0
addr == 16'h4d3 ? 16'h6290 :  // <0132> ram $ram_next_puff_len_us = i+j // av_ad_lo = 144
addr == 16'h4d4 ? 16'hc800 :  // <0132> ram $ram_next_puff_len_us = i+j // av_write_data = i+j
addr == 16'h4d5 ? 16'h5710 :  // <0132> "


addr == 16'h4d6 ? 16'hf80c :  // <0134> pop rtna // func puff_len_learn_stoich
addr == 16'h4d7 ? 16'h1c0c :  // <0134> pop g7 // "
addr == 16'h4d8 ? 16'h180c :  // <0134> pop g6 // "
addr == 16'h4d9 ? 16'h0c0c :  // <0134> pop j // "
addr == 16'h4da ? 16'h080c :  // <0134> pop i // "
addr == 16'h4db ? 16'hfc00 :  // <0134> swapra = nop

// :lrns_enrich_msg // = 0x04dc
// "lrnR\x0"
addr == 16'h4dc ? 16'h726c :  // <0136> rl
addr == 16'h4dd ? 16'h526e :  // <0136> Rn
addr == 16'h4de ? 16'h0000 :  // <0136>   
// :lrns_lean_msg // = 0x04df
// "lrnL\x0"
addr == 16'h4df ? 16'h726c :  // <0138> rl
addr == 16'h4e0 ? 16'h4c6e :  // <0138> Ln
addr == 16'h4e1 ? 16'h0000 :  // <0138>   

// ######## func learn_smap // = 0x04e2
addr == 16'h4e2 ? 16'h3002 :  // <0175> push i // func learn_smap
addr == 16'h4e3 ? 16'h3004 :  // <0175> push x // "
addr == 16'h4e4 ? 16'h3005 :  // <0175> push y // "
addr == 16'h4e5 ? 16'h303e :  // <0175> push rtna // "

addr == 16'h4e6 ? 16'h5e00 :  // <0141> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h4e7 ? 16'h627e :  // <0141> ram a = $ram_rpm_valid // av_ad_lo = 126
addr == 16'h4e8 ? 16'h0015 :  // <0141> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h4e9 ? 16'h0016 :  // <0141> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle

addr == 16'h4ea ? 16'h0000 :  // <0174> a = a
addr == 16'h4eb ? 16'h0601 :  // <0174> b = 1

addr == 16'h4ec ? 16'he407 :  // <0142> bn eq :else_1260
addr == 16'h4ed ? 16'h053d :  // <0142> "

// let g6 = map cell num.  x = map puff len.  i = observed stoich puff len.
addr == 16'h4ee ? 16'h5e00 :  // <0144> ram pa = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h4ef ? 16'h627c :  // <0144> ram pa = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h4f0 ? 16'h2015 :  // <0144> ram pa = $ram_avg_rpm // pa = av_write_data // start read cycle
addr == 16'h4f1 ? 16'h2016 :  // <0144> ram pa = $ram_avg_rpm // pa = av_read_data // finish read cycle
addr == 16'h4f2 ? 16'hfba0 :  // <0145> callx  find_rpm_cell  pa  g6
addr == 16'h4f3 ? 16'h0591 :  // <0145> "
addr == 16'h4f4 ? 16'hfc00 :  // <0145> "
addr == 16'h4f5 ? 16'h1808 :  // <0145> g6 = pa
addr == 16'h4f6 ? 16'h0006 :  // <0146> a = g6

addr == 16'h4f7 ? 16'h0351 :  // <0147> a = a<<1
addr == 16'h4f8 ? 16'h0698 :  // <0147> b = 152
addr == 16'h4f9 ? 16'h5e00 :  // <0147> av_ad_hi = 0
addr == 16'h4fa ? 16'h6300 :  // <0147> av_ad_lo = ad0
addr == 16'h4fb ? 16'h0415 :  // <0147> b = av_write_data
addr == 16'h4fc ? 16'h0416 :  // <0147> b = av_read_data

addr == 16'h4fd ? 16'h1001 :  // <0148> x = b
addr == 16'h4fe ? 16'h5e00 :  // <0149> ram i = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'h4ff ? 16'h6290 :  // <0149> ram i = $ram_next_puff_len_us // av_ad_lo = 144
addr == 16'h500 ? 16'h0815 :  // <0149> ram i = $ram_next_puff_len_us // i = av_write_data // start read cycle
addr == 16'h501 ? 16'h0816 :  // <0149> ram i = $ram_next_puff_len_us // i = av_read_data // finish read cycle
addr == 16'h502 ? 16'h17a0 :  // <0150> y = (0xffff - $lrns_map_step + 1)
addr == 16'h503 ? 16'hff38 :  // <0150> "

addr == 16'h504 ? 16'hc800 :  // <0157> a = x+y
addr == 16'h505 ? 16'h0320 :  // <0157> "
addr == 16'h506 ? 16'h0402 :  // <0157> b = i

addr == 16'h507 ? 16'he406 :  // <0151> bn gt :else_1287
addr == 16'h508 ? 16'h0517 :  // <0151> "

// map is richer than observed stoich.  lean the map 1 step.
addr == 16'h509 ? 16'h0006 :  // <0153> a = g6
addr == 16'h50a ? 16'hc800 :  // <0154> b = x+y
addr == 16'h50b ? 16'h0720 :  // <0154> "

addr == 16'h50c ? 16'h0351 :  // <0155> a = a<<1
addr == 16'h50d ? 16'h3001 :  // <0155> push b // push b
addr == 16'h50e ? 16'h0698 :  // <0155> b = 152
addr == 16'h50f ? 16'h5e00 :  // <0155> av_ad_hi = 0
addr == 16'h510 ? 16'h6300 :  // <0155> av_ad_lo = ad0
addr == 16'h511 ? 16'h540c :  // <0155> pop av_write_data // pop av_write_data

addr == 16'h512 ? 16'h23a0 :  // <0156> pa = :lrns_lean_msg
addr == 16'h513 ? 16'h04df :  // <0156> "
addr == 16'h514 ? 16'hfba0 :  // <0156> callx  set_text_flag  :lrns_lean_msg
addr == 16'h515 ? 16'h0b07 :  // <0156> "
addr == 16'h516 ? 16'hfc00 :  // <0156> "

addr == 16'h517 ? 16'h16c8 :  // <0158> y = $lrns_map_step

addr == 16'h518 ? 16'hc800 :  // <0165> a = x+y
addr == 16'h519 ? 16'h0320 :  // <0165> "
addr == 16'h51a ? 16'h0402 :  // <0165> b = i

addr == 16'h51b ? 16'he405 :  // <0159> bn lt :else_1307
addr == 16'h51c ? 16'h052b :  // <0159> "

// map is leaner than observed stoich.  rich the map 1 step.
addr == 16'h51d ? 16'h0006 :  // <0161> a = g6
addr == 16'h51e ? 16'hc800 :  // <0162> b = x+y
addr == 16'h51f ? 16'h0720 :  // <0162> "

addr == 16'h520 ? 16'h0351 :  // <0163> a = a<<1
addr == 16'h521 ? 16'h3001 :  // <0163> push b // push b
addr == 16'h522 ? 16'h0698 :  // <0163> b = 152
addr == 16'h523 ? 16'h5e00 :  // <0163> av_ad_hi = 0
addr == 16'h524 ? 16'h6300 :  // <0163> av_ad_lo = ad0
addr == 16'h525 ? 16'h540c :  // <0163> pop av_write_data // pop av_write_data

addr == 16'h526 ? 16'h23a0 :  // <0164> pa = :lrns_enrich_msg
addr == 16'h527 ? 16'h04dc :  // <0164> "
addr == 16'h528 ? 16'hfba0 :  // <0164> callx  set_text_flag  :lrns_enrich_msg
addr == 16'h529 ? 16'h0b07 :  // <0164> "
addr == 16'h52a ? 16'hfc00 :  // <0164> "


// dump smap if we haven't done so lately.
addr == 16'h52b ? 16'h5e00 :  // <0168> ram a = $ram_last_learn_second // av_ad_hi = 0
addr == 16'h52c ? 16'h62b2 :  // <0168> ram a = $ram_last_learn_second // av_ad_lo = 178
addr == 16'h52d ? 16'h0015 :  // <0168> ram a = $ram_last_learn_second // a = av_write_data // start read cycle
addr == 16'h52e ? 16'h0016 :  // <0168> ram a = $ram_last_learn_second // a = av_read_data // finish read cycle
addr == 16'h52f ? 16'h5e00 :  // <0169> ram b = $ram_seconds_cnt // av_ad_hi = 0
addr == 16'h530 ? 16'h6242 :  // <0169> ram b = $ram_seconds_cnt // av_ad_lo = 66
addr == 16'h531 ? 16'h0415 :  // <0169> ram b = $ram_seconds_cnt // b = av_write_data // start read cycle
addr == 16'h532 ? 16'h0416 :  // <0169> ram b = $ram_seconds_cnt // b = av_read_data // finish read cycle

addr == 16'h533 ? 16'h0000 :  // <0173> a = a
addr == 16'h534 ? 16'h0401 :  // <0173> b = b

addr == 16'h535 ? 16'he007 :  // <0170> br eq :else_1333
addr == 16'h536 ? 16'h053d :  // <0170> "

addr == 16'h537 ? 16'h5e00 :  // <0171> ram $ram_last_learn_second = b // av_ad_hi = 0
addr == 16'h538 ? 16'h62b2 :  // <0171> ram $ram_last_learn_second = b // av_ad_lo = 178
addr == 16'h539 ? 16'h5401 :  // <0171> ram $ram_last_learn_second = b // av_write_data = b
addr == 16'h53a ? 16'hfba0 :  // <0172> callx  dump_smap_cmd
addr == 16'h53b ? 16'h05ae :  // <0172> "
addr == 16'h53c ? 16'hfc00 :  // <0172> "



addr == 16'h53d ? 16'hf80c :  // <0176> pop rtna // func learn_smap
addr == 16'h53e ? 16'h140c :  // <0176> pop y // "
addr == 16'h53f ? 16'h100c :  // <0176> pop x // "
addr == 16'h540 ? 16'h080c :  // <0176> pop i // "
addr == 16'h541 ? 16'hfc00 :  // <0176> swapra = nop

// :o2_rich_msg // = 0x0542
// "o2R\x0"
addr == 16'h542 ? 16'h326f :  // <0178> 2o
addr == 16'h543 ? 16'h0052 :  // <0178>  R
// :o2_lean_msg // = 0x0544
// "o2L\x0"
addr == 16'h544 ? 16'h326f :  // <0180> 2o
addr == 16'h545 ? 16'h004c :  // <0180>  L

// ######## func interpret_o2 // = 0x0546

addr == 16'h546 ? 16'h5e00 :  // <0183> ram a = $ram_o2_state // av_ad_hi = 0
addr == 16'h547 ? 16'h63a0 :  // <0183> ram a = $ram_o2_state // av_ad_lo = 350
addr == 16'h548 ? 16'h015e :  // <0183> "
addr == 16'h549 ? 16'h0015 :  // <0183> ram a = $ram_o2_state // a = av_write_data // start read cycle
addr == 16'h54a ? 16'h0016 :  // <0183> ram a = $ram_o2_state // a = av_read_data // finish read cycle

addr == 16'h54b ? 16'h0000 :  // <0194> a = a
addr == 16'h54c ? 16'h0601 :  // <0194> b = 1

addr == 16'h54d ? 16'he007 :  // <0184> br eq :else_1357
addr == 16'h54e ? 16'h0564 :  // <0184> "

// check sensor for lean state.
addr == 16'h54f ? 16'h0205 :  // <0186> a = $o2_adc_channel

addr == 16'h550 ? 16'h0351 :  // <0187> a = a<<1
addr == 16'h551 ? 16'h0626 :  // <0187> b = 38
addr == 16'h552 ? 16'h5e00 :  // <0187> av_ad_hi = 0
addr == 16'h553 ? 16'h6300 :  // <0187> av_ad_lo = ad0
addr == 16'h554 ? 16'h0415 :  // <0187> b = av_write_data
addr == 16'h555 ? 16'h0416 :  // <0187> b = av_read_data

addr == 16'h556 ? 16'h03a0 :  // <0188> a = $o2_lean_thresh_adc
addr == 16'h557 ? 16'h01c2 :  // <0188> "

addr == 16'h558 ? 16'h0000 :  // <0193> a = a
addr == 16'h559 ? 16'h0401 :  // <0193> b = b

addr == 16'h55a ? 16'he406 :  // <0189> bn gt :else_1370
addr == 16'h55b ? 16'h0564 :  // <0189> "

addr == 16'h55c ? 16'h5e00 :  // <0190> ram $ram_o2_state = $o2_state_lean // av_ad_hi = 0
addr == 16'h55d ? 16'h63a0 :  // <0190> ram $ram_o2_state = $o2_state_lean // av_ad_lo = 350
addr == 16'h55e ? 16'h015e :  // <0190> "
addr == 16'h55f ? 16'h5601 :  // <0190> ram $ram_o2_state = $o2_state_lean // av_write_data = 1
addr == 16'h560 ? 16'h5e00 :  // <0191> ram $ram_o2_been_lean = 1 // av_ad_hi = 0
addr == 16'h561 ? 16'h63a0 :  // <0191> ram $ram_o2_been_lean = 1 // av_ad_lo = 354
addr == 16'h562 ? 16'h0162 :  // <0191> "
addr == 16'h563 ? 16'h5601 :  // <0191> ram $ram_o2_been_lean = 1 // av_write_data = 1
// callx  set_text_flag  :o2_lean_msg



addr == 16'h564 ? 16'h0000 :  // <0205> a = a
addr == 16'h565 ? 16'h0602 :  // <0205> b = 2

addr == 16'h566 ? 16'he007 :  // <0195> br eq :else_1382
addr == 16'h567 ? 16'h057d :  // <0195> "

// check sensor for rich state.
addr == 16'h568 ? 16'h0205 :  // <0197> a = $o2_adc_channel

addr == 16'h569 ? 16'h0351 :  // <0198> a = a<<1
addr == 16'h56a ? 16'h0626 :  // <0198> b = 38
addr == 16'h56b ? 16'h5e00 :  // <0198> av_ad_hi = 0
addr == 16'h56c ? 16'h6300 :  // <0198> av_ad_lo = ad0
addr == 16'h56d ? 16'h0415 :  // <0198> b = av_write_data
addr == 16'h56e ? 16'h0416 :  // <0198> b = av_read_data

addr == 16'h56f ? 16'h03a0 :  // <0199> a = $o2_rich_thresh_adc
addr == 16'h570 ? 16'h02bc :  // <0199> "

addr == 16'h571 ? 16'h0000 :  // <0204> a = a
addr == 16'h572 ? 16'h0401 :  // <0204> b = b

addr == 16'h573 ? 16'he405 :  // <0200> bn lt :else_1395
addr == 16'h574 ? 16'h057d :  // <0200> "

addr == 16'h575 ? 16'h5e00 :  // <0201> ram $ram_o2_state = $o2_state_rich // av_ad_hi = 0
addr == 16'h576 ? 16'h63a0 :  // <0201> ram $ram_o2_state = $o2_state_rich // av_ad_lo = 350
addr == 16'h577 ? 16'h015e :  // <0201> "
addr == 16'h578 ? 16'h5602 :  // <0201> ram $ram_o2_state = $o2_state_rich // av_write_data = 2
addr == 16'h579 ? 16'h5e00 :  // <0202> ram $ram_o2_been_rich = 1 // av_ad_hi = 0
addr == 16'h57a ? 16'h63a0 :  // <0202> ram $ram_o2_been_rich = 1 // av_ad_lo = 352
addr == 16'h57b ? 16'h0160 :  // <0202> "
addr == 16'h57c ? 16'h5601 :  // <0202> ram $ram_o2_been_rich = 1 // av_write_data = 1
// callx  set_text_flag  :o2_rich_msg



addr == 16'h57d ? 16'hfc00 :  // <0207> swapra = nop

// ######## func init_o2_state // = 0x057e

addr == 16'h57e ? 16'h5e00 :  // <0209> ram $ram_o2_state = $o2_state_init // av_ad_hi = 0
addr == 16'h57f ? 16'h63a0 :  // <0209> ram $ram_o2_state = $o2_state_init // av_ad_lo = 350
addr == 16'h580 ? 16'h015e :  // <0209> "
addr == 16'h581 ? 16'h5600 :  // <0209> ram $ram_o2_state = $o2_state_init // av_write_data = 0
addr == 16'h582 ? 16'h5e00 :  // <0210> ram $ram_o2_been_lean = 0 // av_ad_hi = 0
addr == 16'h583 ? 16'h63a0 :  // <0210> ram $ram_o2_been_lean = 0 // av_ad_lo = 354
addr == 16'h584 ? 16'h0162 :  // <0210> "
addr == 16'h585 ? 16'h5600 :  // <0210> ram $ram_o2_been_lean = 0 // av_write_data = 0
addr == 16'h586 ? 16'h5e00 :  // <0211> ram $ram_o2_been_rich = 0 // av_ad_hi = 0
addr == 16'h587 ? 16'h63a0 :  // <0211> ram $ram_o2_been_rich = 0 // av_ad_lo = 352
addr == 16'h588 ? 16'h0160 :  // <0211> "
addr == 16'h589 ? 16'h5600 :  // <0211> ram $ram_o2_been_rich = 0 // av_write_data = 0

addr == 16'h58a ? 16'hfc00 :  // <0213> swapra = nop

// ######## func leave_learn_stoich // = 0x058b
addr == 16'h58b ? 16'h303e :  // <0216> push rtna // func leave_learn_stoich

addr == 16'h58c ? 16'hfba0 :  // <0215> callx  check_engine_stop  pa
addr == 16'h58d ? 16'h0c3f :  // <0215> "
addr == 16'h58e ? 16'hfc00 :  // <0215> "

addr == 16'h58f ? 16'hf80c :  // <0217> pop rtna // func leave_learn_stoich
addr == 16'h590 ? 16'hfc00 :  // <0217> swapra = nop

// ######## func find_rpm_cell // = 0x0591
addr == 16'h591 ? 16'h3002 :  // <0234> push i // func find_rpm_cell
addr == 16'h592 ? 16'h3003 :  // <0234> push j // "

addr == 16'h593 ? 16'h0a01 :  // <0219> i = 1
addr == 16'h594 ? 16'h0008 :  // <0220> a = rpm
addr == 16'h595 ? 16'h0760 :  // <0221> b = 0xffff
addr == 16'h596 ? 16'he007 :  // <0222> br eq :found
addr == 16'h597 ? 16'h05a5 :  // <0222> "
// :next_cell // = 0x0598
addr == 16'h598 ? 16'h0fa0 :  // <0224> j = :rpm_cells
addr == 16'h599 ? 16'h044a :  // <0224> "
addr == 16'h59a ? 16'hc800 :  // <0225> fetch a from i+j
addr == 16'h59b ? 16'hd310 :  // <0225> "
addr == 16'h59c ? 16'h03b0 :  // <0225> "
addr == 16'h59d ? 16'h0408 :  // <0226> b = rpm
addr == 16'h59e ? 16'he006 :  // <0227> br gt :found
addr == 16'h59f ? 16'h05a5 :  // <0227> "
addr == 16'h5a0 ? 16'h0e01 :  // <0228> j = 1
addr == 16'h5a1 ? 16'hc800 :  // <0229> i = i+j
addr == 16'h5a2 ? 16'h0b10 :  // <0229> "
addr == 16'h5a3 ? 16'he00f :  // <0230> jmp :next_cell
addr == 16'h5a4 ? 16'h0598 :  // <0230> "
// :found // = 0x05a5
addr == 16'h5a5 ? 16'h0f60 :  // <0232> j = -1
addr == 16'h5a6 ? 16'hc800 :  // <0233> cell = i+j
addr == 16'h5a7 ? 16'h2310 :  // <0233> "
addr == 16'h5a8 ? 16'h0c0c :  // <0233> pop j // rtn i+j
addr == 16'h5a9 ? 16'h080c :  // <0233> pop i // "
addr == 16'h5aa ? 16'hfc00 :  // <0232> swapra = nop

addr == 16'h5ab ? 16'h0c0c :  // <0235> pop j // func find_rpm_cell
addr == 16'h5ac ? 16'h080c :  // <0235> pop i // "
addr == 16'h5ad ? 16'hfc00 :  // <0235> swapra = nop

// ######## func dump_smap_cmd // = 0x05ae
addr == 16'h5ae ? 16'h3004 :  // <0274> push x // func dump_smap_cmd
addr == 16'h5af ? 16'h303e :  // <0274> push rtna // "

addr == 16'h5b0 ? 16'h020d :  // <0237> a = 13 // puteol
addr == 16'h5b1 ? 16'hfba0 :  // <0237> puteol
addr == 16'h5b2 ? 16'h009b :  // <0237> "
addr == 16'h5b3 ? 16'hfc00 :  // <0237> "
addr == 16'h5b4 ? 16'h020a :  // <0237> a = 10 // puteol
addr == 16'h5b5 ? 16'hfba0 :  // <0237> puteol
addr == 16'h5b6 ? 16'h009b :  // <0237> "
addr == 16'h5b7 ? 16'hfc00 :  // <0237> "
addr == 16'h5b8 ? 16'h5e00 :  // <0238> ram pa = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h5b9 ? 16'h627c :  // <0238> ram pa = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h5ba ? 16'h2015 :  // <0238> ram pa = $ram_avg_rpm // pa = av_write_data // start read cycle
addr == 16'h5bb ? 16'h2016 :  // <0238> ram pa = $ram_avg_rpm // pa = av_read_data // finish read cycle
addr == 16'h5bc ? 16'hfba0 :  // <0239> callx  find_rpm_cell  pa  pa
addr == 16'h5bd ? 16'h0591 :  // <0239> "
addr == 16'h5be ? 16'hfc00 :  // <0239> "
addr == 16'h5bf ? 16'h1200 :  // <0249> x = 0
// :loop_1471 // = 0x05c0

addr == 16'h5c0 ? 16'h0004 :  // <0240> a = x

addr == 16'h5c1 ? 16'h0351 :  // <0241> a = a<<1
addr == 16'h5c2 ? 16'h0698 :  // <0241> b = 152
addr == 16'h5c3 ? 16'h5e00 :  // <0241> av_ad_hi = 0
addr == 16'h5c4 ? 16'h6300 :  // <0241> av_ad_lo = ad0
addr == 16'h5c5 ? 16'h0415 :  // <0241> b = av_write_data
addr == 16'h5c6 ? 16'h0416 :  // <0241> b = av_read_data

addr == 16'h5c7 ? 16'h0001 :  // <0242> a = b
addr == 16'h5c8 ? 16'hfba0 :  // <0243> call put4x
addr == 16'h5c9 ? 16'h00c3 :  // <0243> "
addr == 16'h5ca ? 16'hfc00 :  // <0243> "

addr == 16'h5cb ? 16'h0004 :  // <0246> a = x
addr == 16'h5cc ? 16'h0408 :  // <0246> b = pa

addr == 16'h5cd ? 16'he407 :  // <0244> bn eq :else_1485
addr == 16'h5ce ? 16'h05d3 :  // <0244> "

addr == 16'h5cf ? 16'h023c :  // <0245> a = 60 // putasc "<"
addr == 16'h5d0 ? 16'hfba0 :  // <0245> putasc "<"
addr == 16'h5d1 ? 16'h009b :  // <0245> "
addr == 16'h5d2 ? 16'hfc00 :  // <0245> "

addr == 16'h5d3 ? 16'h0220 :  // <0247> a = 32 // putasc " "
addr == 16'h5d4 ? 16'hfba0 :  // <0247> putasc " "
addr == 16'h5d5 ? 16'h009b :  // <0247> "
addr == 16'h5d6 ? 16'hfc00 :  // <0247> "


addr == 16'h5d7 ? 16'h0004 :  // <0249> a = x
addr == 16'h5d8 ? 16'h0601 :  // <0249> b = 1
addr == 16'h5d9 ? 16'hc800 :  // <0249> x = a+b
addr == 16'h5da ? 16'h1300 :  // <0249> "


addr == 16'h5db ? 16'h0004 :  // <0249> a = x
addr == 16'h5dc ? 16'h060d :  // <0249> b = $num_rpm_cells
addr == 16'h5dd ? 16'he005 :  // <0249> br lt :loop_1471
addr == 16'h5de ? 16'h05c0 :  // <0249> "

// :end_1471 // = 0x05df
addr == 16'h5df ? 16'h020d :  // <0250> a = 13 // puteol
addr == 16'h5e0 ? 16'hfba0 :  // <0250> puteol
addr == 16'h5e1 ? 16'h009b :  // <0250> "
addr == 16'h5e2 ? 16'hfc00 :  // <0250> "
addr == 16'h5e3 ? 16'h020a :  // <0250> a = 10 // puteol
addr == 16'h5e4 ? 16'hfba0 :  // <0250> puteol
addr == 16'h5e5 ? 16'h009b :  // <0250> "
addr == 16'h5e6 ? 16'hfc00 :  // <0250> "
addr == 16'h5e7 ? 16'h1200 :  // <0260> x = 0
// :loop_1511 // = 0x05e8

addr == 16'h5e8 ? 16'h0004 :  // <0251> a = x

addr == 16'h5e9 ? 16'h0351 :  // <0252> a = a<<1
addr == 16'h5ea ? 16'h06b4 :  // <0252> b = 180
addr == 16'h5eb ? 16'h5e00 :  // <0252> av_ad_hi = 0
addr == 16'h5ec ? 16'h6300 :  // <0252> av_ad_lo = ad0
addr == 16'h5ed ? 16'h0415 :  // <0252> b = av_write_data
addr == 16'h5ee ? 16'h0416 :  // <0252> b = av_read_data

addr == 16'h5ef ? 16'h0001 :  // <0253> a = b
addr == 16'h5f0 ? 16'hfba0 :  // <0254> call put4x
addr == 16'h5f1 ? 16'h00c3 :  // <0254> "
addr == 16'h5f2 ? 16'hfc00 :  // <0254> "

addr == 16'h5f3 ? 16'h0004 :  // <0257> a = x
addr == 16'h5f4 ? 16'h0408 :  // <0257> b = pa

addr == 16'h5f5 ? 16'he407 :  // <0255> bn eq :else_1525
addr == 16'h5f6 ? 16'h05fb :  // <0255> "

addr == 16'h5f7 ? 16'h023c :  // <0256> a = 60 // putasc "<"
addr == 16'h5f8 ? 16'hfba0 :  // <0256> putasc "<"
addr == 16'h5f9 ? 16'h009b :  // <0256> "
addr == 16'h5fa ? 16'hfc00 :  // <0256> "

addr == 16'h5fb ? 16'h0220 :  // <0258> a = 32 // putasc " "
addr == 16'h5fc ? 16'hfba0 :  // <0258> putasc " "
addr == 16'h5fd ? 16'h009b :  // <0258> "
addr == 16'h5fe ? 16'hfc00 :  // <0258> "


addr == 16'h5ff ? 16'h0004 :  // <0260> a = x
addr == 16'h600 ? 16'h0601 :  // <0260> b = 1
addr == 16'h601 ? 16'hc800 :  // <0260> x = a+b
addr == 16'h602 ? 16'h1300 :  // <0260> "


addr == 16'h603 ? 16'h0004 :  // <0260> a = x
addr == 16'h604 ? 16'h060d :  // <0260> b = $num_tps_cells
addr == 16'h605 ? 16'he005 :  // <0260> br lt :loop_1511
addr == 16'h606 ? 16'h05e8 :  // <0260> "

// :end_1511 // = 0x0607
addr == 16'h607 ? 16'h020d :  // <0261> a = 13 // puteol
addr == 16'h608 ? 16'hfba0 :  // <0261> puteol
addr == 16'h609 ? 16'h009b :  // <0261> "
addr == 16'h60a ? 16'hfc00 :  // <0261> "
addr == 16'h60b ? 16'h020a :  // <0261> a = 10 // puteol
addr == 16'h60c ? 16'hfba0 :  // <0261> puteol
addr == 16'h60d ? 16'h009b :  // <0261> "
addr == 16'h60e ? 16'hfc00 :  // <0261> "
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

addr == 16'h60f ? 16'hf80c :  // <0275> pop rtna // func dump_smap_cmd
addr == 16'h610 ? 16'h100c :  // <0275> pop x // "
addr == 16'h611 ? 16'hfc00 :  // <0275> swapra = nop

// ######## func load_tps_enrich_cmd // = 0x0612

// for {i = 0} {i lt $num_tps_states} step j = 1 {
// call  get4x
// b = a
// a = i
// struct_write $ram_tps_enrich_thou
// getchar
// }

addr == 16'h612 ? 16'hfc00 :  // <0285> swapra = nop

// ######## func load_smap_cmd // = 0x0613
addr == 16'h613 ? 16'h3002 :  // <0294> push i // func load_smap_cmd
addr == 16'h614 ? 16'h303e :  // <0294> push rtna // "

addr == 16'h615 ? 16'h0a00 :  // <0293> i = 0
// :loop_1557 // = 0x0616

addr == 16'h616 ? 16'hfba0 :  // <0287> call  get4x
addr == 16'h617 ? 16'h00fc :  // <0287> "
addr == 16'h618 ? 16'hfc00 :  // <0287> "
addr == 16'h619 ? 16'h0400 :  // <0288> b = a
addr == 16'h61a ? 16'h0002 :  // <0289> a = i

addr == 16'h61b ? 16'h0351 :  // <0290> a = a<<1
addr == 16'h61c ? 16'h3001 :  // <0290> push b // push b
addr == 16'h61d ? 16'h0698 :  // <0290> b = 152
addr == 16'h61e ? 16'h5e00 :  // <0290> av_ad_hi = 0
addr == 16'h61f ? 16'h6300 :  // <0290> av_ad_lo = ad0
addr == 16'h620 ? 16'h540c :  // <0290> pop av_write_data // pop av_write_data

addr == 16'h621 ? 16'hfba0 :  // <0291> getchar
addr == 16'h622 ? 16'h00a4 :  // <0291> "
addr == 16'h623 ? 16'hfc00 :  // <0291> "


addr == 16'h624 ? 16'h0002 :  // <0293> a = i
addr == 16'h625 ? 16'h0601 :  // <0293> b = 1
addr == 16'h626 ? 16'hc800 :  // <0293> i = a+b
addr == 16'h627 ? 16'h0b00 :  // <0293> "


addr == 16'h628 ? 16'h0002 :  // <0293> a = i
addr == 16'h629 ? 16'h060d :  // <0293> b = $num_rpm_cells
addr == 16'h62a ? 16'he005 :  // <0293> br lt :loop_1557
addr == 16'h62b ? 16'h0616 :  // <0293> "

// :end_1557 // = 0x062c

addr == 16'h62c ? 16'hf80c :  // <0295> pop rtna // func load_smap_cmd
addr == 16'h62d ? 16'h080c :  // <0295> pop i // "
addr == 16'h62e ? 16'hfc00 :  // <0295> swapra = nop

// ######## func clear_smap_cmd // = 0x062f
addr == 16'h62f ? 16'h3002 :  // <0302> push i // func clear_smap_cmd

addr == 16'h630 ? 16'h0a00 :  // <0301> i = 0
// :loop_1584 // = 0x0631

addr == 16'h631 ? 16'h0002 :  // <0297> a = i
addr == 16'h632 ? 16'h07a0 :  // <0298> b = 3000
addr == 16'h633 ? 16'h0bb8 :  // <0298> "

addr == 16'h634 ? 16'h0351 :  // <0299> a = a<<1
addr == 16'h635 ? 16'h3001 :  // <0299> push b // push b
addr == 16'h636 ? 16'h0698 :  // <0299> b = 152
addr == 16'h637 ? 16'h5e00 :  // <0299> av_ad_hi = 0
addr == 16'h638 ? 16'h6300 :  // <0299> av_ad_lo = ad0
addr == 16'h639 ? 16'h540c :  // <0299> pop av_write_data // pop av_write_data



addr == 16'h63a ? 16'h0002 :  // <0301> a = i
addr == 16'h63b ? 16'h0601 :  // <0301> b = 1
addr == 16'h63c ? 16'hc800 :  // <0301> i = a+b
addr == 16'h63d ? 16'h0b00 :  // <0301> "


addr == 16'h63e ? 16'h0002 :  // <0301> a = i
addr == 16'h63f ? 16'h060d :  // <0301> b = $num_rpm_cells
addr == 16'h640 ? 16'he005 :  // <0301> br lt :loop_1584
addr == 16'h641 ? 16'h0631 :  // <0301> "

// :end_1584 // = 0x0642

addr == 16'h642 ? 16'h080c :  // <0303> pop i // func clear_smap_cmd
addr == 16'h643 ? 16'hfc00 :  // <0303> swapra = nop

// ######## func load_tps_ref_cmd // = 0x0644
addr == 16'h644 ? 16'h3002 :  // <0315> push i // func load_tps_ref_cmd
addr == 16'h645 ? 16'h3006 :  // <0315> push ga // "
addr == 16'h646 ? 16'h303e :  // <0315> push rtna // "

addr == 16'h647 ? 16'h0a00 :  // <0314> i = 0
// :loop_1607 // = 0x0648

addr == 16'h648 ? 16'hfba0 :  // <0305> call  get4x
addr == 16'h649 ? 16'h00fc :  // <0305> "
addr == 16'h64a ? 16'hfc00 :  // <0305> "
addr == 16'h64b ? 16'h1800 :  // <0306> ga = a
addr == 16'h64c ? 16'h0400 :  // <0307> b = a
addr == 16'h64d ? 16'h0002 :  // <0308> a = i

addr == 16'h64e ? 16'h0351 :  // <0309> a = a<<1
addr == 16'h64f ? 16'h3001 :  // <0309> push b // push b
addr == 16'h650 ? 16'h06b4 :  // <0309> b = 180
addr == 16'h651 ? 16'h5e00 :  // <0309> av_ad_hi = 0
addr == 16'h652 ? 16'h6300 :  // <0309> av_ad_lo = ad0
addr == 16'h653 ? 16'h540c :  // <0309> pop av_write_data // pop av_write_data

addr == 16'h654 ? 16'h0006 :  // <0310> a = ga
addr == 16'h655 ? 16'hfba0 :  // <0311> call put4x
addr == 16'h656 ? 16'h00c3 :  // <0311> "
addr == 16'h657 ? 16'hfc00 :  // <0311> "
addr == 16'h658 ? 16'hfba0 :  // <0312> getchar
addr == 16'h659 ? 16'h00a4 :  // <0312> "
addr == 16'h65a ? 16'hfc00 :  // <0312> "


addr == 16'h65b ? 16'h0002 :  // <0314> a = i
addr == 16'h65c ? 16'h0601 :  // <0314> b = 1
addr == 16'h65d ? 16'hc800 :  // <0314> i = a+b
addr == 16'h65e ? 16'h0b00 :  // <0314> "


addr == 16'h65f ? 16'h0002 :  // <0314> a = i
addr == 16'h660 ? 16'h060d :  // <0314> b = $num_tps_cells
addr == 16'h661 ? 16'he005 :  // <0314> br lt :loop_1607
addr == 16'h662 ? 16'h0648 :  // <0314> "

// :end_1607 // = 0x0663

addr == 16'h663 ? 16'hf80c :  // <0316> pop rtna // func load_tps_ref_cmd
addr == 16'h664 ? 16'h180c :  // <0316> pop ga // "
addr == 16'h665 ? 16'h080c :  // <0316> pop i // "
addr == 16'h666 ? 16'hfc00 :  // <0316> swapra = nop

// ######## func learn_tps_ref_cmd // = 0x0667
addr == 16'h667 ? 16'h303e :  // <0322> push rtna // func learn_tps_ref_cmd

addr == 16'h668 ? 16'h5e00 :  // <0318> ram pa = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h669 ? 16'h627c :  // <0318> ram pa = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h66a ? 16'h2015 :  // <0318> ram pa = $ram_avg_rpm // pa = av_write_data // start read cycle
addr == 16'h66b ? 16'h2016 :  // <0318> ram pa = $ram_avg_rpm // pa = av_read_data // finish read cycle
addr == 16'h66c ? 16'hfba0 :  // <0319> callx  find_rpm_cell  pa  a
addr == 16'h66d ? 16'h0591 :  // <0319> "
addr == 16'h66e ? 16'hfc00 :  // <0319> "
addr == 16'h66f ? 16'h0008 :  // <0319> a = pa
addr == 16'h670 ? 16'h5e00 :  // <0320> ram b = $ram_tps_avg // av_ad_hi = 0
addr == 16'h671 ? 16'h63a0 :  // <0320> ram b = $ram_tps_avg // av_ad_lo = 338
addr == 16'h672 ? 16'h0152 :  // <0320> "
addr == 16'h673 ? 16'h0415 :  // <0320> ram b = $ram_tps_avg // b = av_write_data // start read cycle
addr == 16'h674 ? 16'h0416 :  // <0320> ram b = $ram_tps_avg // b = av_read_data // finish read cycle

addr == 16'h675 ? 16'h0351 :  // <0321> a = a<<1
addr == 16'h676 ? 16'h3001 :  // <0321> push b // push b
addr == 16'h677 ? 16'h06b4 :  // <0321> b = 180
addr == 16'h678 ? 16'h5e00 :  // <0321> av_ad_hi = 0
addr == 16'h679 ? 16'h6300 :  // <0321> av_ad_lo = ad0
addr == 16'h67a ? 16'h540c :  // <0321> pop av_write_data // pop av_write_data


addr == 16'h67b ? 16'hf80c :  // <0323> pop rtna // func learn_tps_ref_cmd
addr == 16'h67c ? 16'hfc00 :  // <0323> swapra = nop


// :plan_name_run // = 0x067d
// "RN\x0"
addr == 16'h67d ? 16'h4e52 :  // <0002> NR
addr == 16'h67e ? 16'h0000 :  // <0002>   


// max trim is about 200 thou prior to multiplier overflow.
// or more if the smap puff is below 8000.
// trim resolution is 4 thou due to multiplier.
// smap resolution for trimming is 16 us.
// final trim enrichment us resolution is 16 us.

// ######## func trim_lean_cmd // = 0x067f

addr == 16'h67f ? 16'h5e00 :  // <0016> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h680 ? 16'h63a0 :  // <0016> ram a = $ram_run_manual_trim_thou // av_ad_lo = 356
addr == 16'h681 ? 16'h0164 :  // <0016> "
addr == 16'h682 ? 16'h0015 :  // <0016> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h683 ? 16'h0016 :  // <0016> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle

addr == 16'h684 ? 16'h0000 :  // <0021> a = a
addr == 16'h685 ? 16'h0600 :  // <0021> b = 0

addr == 16'h686 ? 16'he7a0 :  // <0017> bn = :else_1670
addr == 16'h687 ? 16'h068a :  // <0017> "


addr == 16'h688 ? 16'he00f :  // <0019> jmp :end_1670
addr == 16'h689 ? 16'h0691 :  // <0019> "

addr == 16'h68a ? 16'h07a0 :  // <0020> b = (($run_manual_trim_step_thou ^ 0xffff) + 1)
addr == 16'h68b ? 16'hfffc :  // <0020> "
addr == 16'h68c ? 16'h5e00 :  // <0021> ram $ram_run_manual_trim_thou = a+b // av_ad_hi = 0
addr == 16'h68d ? 16'h63a0 :  // <0021> ram $ram_run_manual_trim_thou = a+b // av_ad_lo = 356
addr == 16'h68e ? 16'h0164 :  // <0021> "
addr == 16'h68f ? 16'hc800 :  // <0021> ram $ram_run_manual_trim_thou = a+b // av_write_data = a+b
addr == 16'h690 ? 16'h5700 :  // <0021> "


addr == 16'h691 ? 16'hfc00 :  // <0023> swapra = nop

// ######## func trim_rich_cmd // = 0x0692

addr == 16'h692 ? 16'h5e00 :  // <0025> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h693 ? 16'h63a0 :  // <0025> ram a = $ram_run_manual_trim_thou // av_ad_lo = 356
addr == 16'h694 ? 16'h0164 :  // <0025> "
addr == 16'h695 ? 16'h0015 :  // <0025> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h696 ? 16'h0016 :  // <0025> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle

addr == 16'h697 ? 16'h0000 :  // <0030> a = a
addr == 16'h698 ? 16'h07a0 :  // <0030> b = 800
addr == 16'h699 ? 16'h0320 :  // <0030> "

addr == 16'h69a ? 16'he406 :  // <0026> bn gt :else_1690
addr == 16'h69b ? 16'h069e :  // <0026> "


addr == 16'h69c ? 16'he00f :  // <0028> jmp :end_1690
addr == 16'h69d ? 16'h06a4 :  // <0028> "

addr == 16'h69e ? 16'h0604 :  // <0029> b = $run_manual_trim_step_thou
addr == 16'h69f ? 16'h5e00 :  // <0030> ram $ram_run_manual_trim_thou = a+b // av_ad_hi = 0
addr == 16'h6a0 ? 16'h63a0 :  // <0030> ram $ram_run_manual_trim_thou = a+b // av_ad_lo = 356
addr == 16'h6a1 ? 16'h0164 :  // <0030> "
addr == 16'h6a2 ? 16'hc800 :  // <0030> ram $ram_run_manual_trim_thou = a+b // av_write_data = a+b
addr == 16'h6a3 ? 16'h5700 :  // <0030> "


addr == 16'h6a4 ? 16'hfc00 :  // <0032> swapra = nop

// ######## func trim_2lean_cmd // = 0x06a5

addr == 16'h6a5 ? 16'h5e00 :  // <0034> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h6a6 ? 16'h63a0 :  // <0034> ram a = $ram_run_manual_trim_thou // av_ad_lo = 356
addr == 16'h6a7 ? 16'h0164 :  // <0034> "
addr == 16'h6a8 ? 16'h0015 :  // <0034> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h6a9 ? 16'h0016 :  // <0034> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle

addr == 16'h6aa ? 16'h0000 :  // <0039> a = a
addr == 16'h6ab ? 16'h0600 :  // <0039> b = 0

addr == 16'h6ac ? 16'he7a0 :  // <0035> bn = :else_1708
addr == 16'h6ad ? 16'h06b0 :  // <0035> "


addr == 16'h6ae ? 16'he00f :  // <0037> jmp :end_1708
addr == 16'h6af ? 16'h06b7 :  // <0037> "

addr == 16'h6b0 ? 16'h07a0 :  // <0038> b = ((($run_manual_trim_step_thou << 3) ^ 0xffff) + 1)
addr == 16'h6b1 ? 16'hffe0 :  // <0038> "
addr == 16'h6b2 ? 16'h5e00 :  // <0039> ram $ram_run_manual_trim_thou = a+b // av_ad_hi = 0
addr == 16'h6b3 ? 16'h63a0 :  // <0039> ram $ram_run_manual_trim_thou = a+b // av_ad_lo = 356
addr == 16'h6b4 ? 16'h0164 :  // <0039> "
addr == 16'h6b5 ? 16'hc800 :  // <0039> ram $ram_run_manual_trim_thou = a+b // av_write_data = a+b
addr == 16'h6b6 ? 16'h5700 :  // <0039> "


addr == 16'h6b7 ? 16'hfc00 :  // <0041> swapra = nop

// ######## func trim_2rich_cmd // = 0x06b8

addr == 16'h6b8 ? 16'h5e00 :  // <0043> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h6b9 ? 16'h63a0 :  // <0043> ram a = $ram_run_manual_trim_thou // av_ad_lo = 356
addr == 16'h6ba ? 16'h0164 :  // <0043> "
addr == 16'h6bb ? 16'h0015 :  // <0043> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h6bc ? 16'h0016 :  // <0043> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle

addr == 16'h6bd ? 16'h0000 :  // <0048> a = a
addr == 16'h6be ? 16'h07a0 :  // <0048> b = 800
addr == 16'h6bf ? 16'h0320 :  // <0048> "

addr == 16'h6c0 ? 16'he406 :  // <0044> bn gt :else_1728
addr == 16'h6c1 ? 16'h06c4 :  // <0044> "


addr == 16'h6c2 ? 16'he00f :  // <0046> jmp :end_1728
addr == 16'h6c3 ? 16'h06ca :  // <0046> "

addr == 16'h6c4 ? 16'h0620 :  // <0047> b = ($run_manual_trim_step_thou << 3)
addr == 16'h6c5 ? 16'h5e00 :  // <0048> ram $ram_run_manual_trim_thou = a+b // av_ad_hi = 0
addr == 16'h6c6 ? 16'h63a0 :  // <0048> ram $ram_run_manual_trim_thou = a+b // av_ad_lo = 356
addr == 16'h6c7 ? 16'h0164 :  // <0048> "
addr == 16'h6c8 ? 16'hc800 :  // <0048> ram $ram_run_manual_trim_thou = a+b // av_write_data = a+b
addr == 16'h6c9 ? 16'h5700 :  // <0048> "


addr == 16'h6ca ? 16'hfc00 :  // <0050> swapra = nop

// ######## func init_plan_run // = 0x06cb

// set up the run plan.
addr == 16'h6cb ? 16'h5e00 :  // <0053> ram $ram_run_manual_trim_thou = 0 // av_ad_hi = 0
addr == 16'h6cc ? 16'h63a0 :  // <0053> ram $ram_run_manual_trim_thou = 0 // av_ad_lo = 356
addr == 16'h6cd ? 16'h0164 :  // <0053> "
addr == 16'h6ce ? 16'h5600 :  // <0053> ram $ram_run_manual_trim_thou = 0 // av_write_data = 0

// memorize state.
addr == 16'h6cf ? 16'h5e00 :  // <0056> ram $ram_plan_name = :plan_name_run // av_ad_hi = 0
addr == 16'h6d0 ? 16'h6288 :  // <0056> ram $ram_plan_name = :plan_name_run // av_ad_lo = 136
addr == 16'h6d1 ? 16'h57a0 :  // <0056> ram $ram_plan_name = :plan_name_run // av_write_data = :plan_name_run
addr == 16'h6d2 ? 16'h067d :  // <0056> "
addr == 16'h6d3 ? 16'h5e00 :  // <0057> ram $ram_puff_len_func = :puff_len_run // av_ad_hi = 0
addr == 16'h6d4 ? 16'h628a :  // <0057> ram $ram_puff_len_func = :puff_len_run // av_ad_lo = 138
addr == 16'h6d5 ? 16'h57a0 :  // <0057> ram $ram_puff_len_func = :puff_len_run // av_write_data = :puff_len_run
addr == 16'h6d6 ? 16'h06e7 :  // <0057> "
addr == 16'h6d7 ? 16'h5e00 :  // <0058> ram $ram_transition_func = :leave_run // av_ad_hi = 0
addr == 16'h6d8 ? 16'h628c :  // <0058> ram $ram_transition_func = :leave_run // av_ad_lo = 140
addr == 16'h6d9 ? 16'h57a0 :  // <0058> ram $ram_transition_func = :leave_run // av_write_data = :leave_run
addr == 16'h6da ? 16'h074d :  // <0058> "
addr == 16'h6db ? 16'h5e00 :  // <0059> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_hi = 0
addr == 16'h6dc ? 16'h628e :  // <0059> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_lo = 142
addr == 16'h6dd ? 16'h57a0 :  // <0059> ram $ram_destroy_plan_func = :destroy_plan_run // av_write_data = :destroy_plan_run
addr == 16'h6de ? 16'h06e0 :  // <0059> "

addr == 16'h6df ? 16'hfc00 :  // <0061> swapra = nop

// ######## func destroy_plan_run // = 0x06e0


addr == 16'h6e0 ? 16'hfc00 :  // <0064> swapra = nop

// :tps_accel2_msg // = 0x06e1
// "tpsa2\x0"
addr == 16'h6e1 ? 16'h7074 :  // <0066> pt
addr == 16'h6e2 ? 16'h6173 :  // <0066> as
addr == 16'h6e3 ? 16'h0032 :  // <0066>  2
// :tps_open_msg // = 0x06e4
// "tpsop\x0"
addr == 16'h6e4 ? 16'h7074 :  // <0068> pt
addr == 16'h6e5 ? 16'h6f73 :  // <0068> os
addr == 16'h6e6 ? 16'h0070 :  // <0068>  p

// ######## func puff_len_run // = 0x06e7
addr == 16'h6e7 ? 16'h3002 :  // <0128> push i // func puff_len_run
addr == 16'h6e8 ? 16'h3003 :  // <0128> push j // "
addr == 16'h6e9 ? 16'h3004 :  // <0128> push x // "
addr == 16'h6ea ? 16'h3005 :  // <0128> push y // "
addr == 16'h6eb ? 16'h3006 :  // <0128> push ga // "
addr == 16'h6ec ? 16'h3007 :  // <0128> push gb // "
addr == 16'h6ed ? 16'h303e :  // <0128> push rtna // "

addr == 16'h6ee ? 16'h5e00 :  // <0071> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h6ef ? 16'h627e :  // <0071> ram a = $ram_rpm_valid // av_ad_lo = 126
addr == 16'h6f0 ? 16'h0015 :  // <0071> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h6f1 ? 16'h0016 :  // <0071> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle

addr == 16'h6f2 ? 16'h0000 :  // <0127> a = a
addr == 16'h6f3 ? 16'h0601 :  // <0127> b = 1

addr == 16'h6f4 ? 16'he407 :  // <0072> bn eq :else_1780
addr == 16'h6f5 ? 16'h0745 :  // <0072> "

// read smap puff into ga
addr == 16'h6f6 ? 16'h5e00 :  // <0074> ram pa = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h6f7 ? 16'h627c :  // <0074> ram pa = $ram_avg_rpm // av_ad_lo = 124
addr == 16'h6f8 ? 16'h2015 :  // <0074> ram pa = $ram_avg_rpm // pa = av_write_data // start read cycle
addr == 16'h6f9 ? 16'h2016 :  // <0074> ram pa = $ram_avg_rpm // pa = av_read_data // finish read cycle
addr == 16'h6fa ? 16'hfba0 :  // <0075> callx  find_rpm_cell  pa  a
addr == 16'h6fb ? 16'h0591 :  // <0075> "
addr == 16'h6fc ? 16'hfc00 :  // <0075> "
addr == 16'h6fd ? 16'h0008 :  // <0075> a = pa
addr == 16'h6fe ? 16'h1c00 :  // <0076> gb = a

addr == 16'h6ff ? 16'h0351 :  // <0077> a = a<<1
addr == 16'h700 ? 16'h0698 :  // <0077> b = 152
addr == 16'h701 ? 16'h5e00 :  // <0077> av_ad_hi = 0
addr == 16'h702 ? 16'h6300 :  // <0077> av_ad_lo = ad0
addr == 16'h703 ? 16'h0415 :  // <0077> b = av_write_data
addr == 16'h704 ? 16'h0416 :  // <0077> b = av_read_data

addr == 16'h705 ? 16'h1801 :  // <0078> ga = b

// calculate manual enrichment in us.  apply a total of 10 bits of right-shift to
// implement division by 1024 (thou unit).  spread them out to prevent overflow.
addr == 16'h706 ? 16'h5e00 :  // <0082> ram a = $ram_run_manual_trim_thou // av_ad_hi = 0
addr == 16'h707 ? 16'h63a0 :  // <0082> ram a = $ram_run_manual_trim_thou // av_ad_lo = 356
addr == 16'h708 ? 16'h0164 :  // <0082> "
addr == 16'h709 ? 16'h0015 :  // <0082> ram a = $ram_run_manual_trim_thou // a = av_write_data // start read cycle
addr == 16'h70a ? 16'h0016 :  // <0082> ram a = $ram_run_manual_trim_thou // a = av_read_data // finish read cycle
addr == 16'h70b ? 16'h0350 :  // <0083> a = a>>1
addr == 16'h70c ? 16'h0750 :  // <0084> b = a>>1
addr == 16'h70d ? 16'h0006 :  // <0085> a = ga
addr == 16'h70e ? 16'h0353 :  // <0086> a = a>>4
addr == 16'h70f ? 16'hfba0 :  // <0087> call  multiply
addr == 16'h710 ? 16'h0170 :  // <0087> "
addr == 16'h711 ? 16'hfc00 :  // <0087> "
addr == 16'h712 ? 16'h0353 :  // <0088> a = a>>4

// add enrichment to smap puff.
addr == 16'h713 ? 16'h0406 :  // <0091> b = ga
addr == 16'h714 ? 16'hc800 :  // <0092> ga = a+b
addr == 16'h715 ? 16'h1b00 :  // <0092> "

// determine TPS enrichment for acceleration.
addr == 16'h716 ? 16'h5e00 :  // <0095> ram x = $ram_tps_state // av_ad_hi = 0
addr == 16'h717 ? 16'h62ce :  // <0095> ram x = $ram_tps_state // av_ad_lo = 206
addr == 16'h718 ? 16'h1015 :  // <0095> ram x = $ram_tps_state // x = av_write_data // start read cycle
addr == 16'h719 ? 16'h1016 :  // <0095> ram x = $ram_tps_state // x = av_read_data // finish read cycle

addr == 16'h71a ? 16'h0004 :  // <0098> a = x
addr == 16'h71b ? 16'h0603 :  // <0098> b = 3

addr == 16'h71c ? 16'he407 :  // <0096> bn eq :else_1820
addr == 16'h71d ? 16'h0723 :  // <0096> "

addr == 16'h71e ? 16'h23a0 :  // <0097> pa = :tps_accel2_msg
addr == 16'h71f ? 16'h06e1 :  // <0097> "
addr == 16'h720 ? 16'hfba0 :  // <0097> callx  unique_text_flag  :tps_accel2_msg
addr == 16'h721 ? 16'h0b1c :  // <0097> "
addr == 16'h722 ? 16'hfc00 :  // <0097> "


addr == 16'h723 ? 16'h0004 :  // <0101> a = x
addr == 16'h724 ? 16'h0604 :  // <0101> b = 4

addr == 16'h725 ? 16'he407 :  // <0099> bn eq :else_1829
addr == 16'h726 ? 16'h072c :  // <0099> "

addr == 16'h727 ? 16'h23a0 :  // <0100> pa = :tps_open_msg
addr == 16'h728 ? 16'h06e4 :  // <0100> "
addr == 16'h729 ? 16'hfba0 :  // <0100> callx  unique_text_flag  :tps_open_msg
addr == 16'h72a ? 16'h0b1c :  // <0100> "
addr == 16'h72b ? 16'hfc00 :  // <0100> "

// index into maps by TPS state.
addr == 16'h72c ? 16'h0a00 :  // <0103> i = 0
addr == 16'h72d ? 16'h0e0d :  // <0104> j = $num_tps_cells
addr == 16'h72e ? 16'h1760 :  // <0105> y = -1
// :next_state // = 0x072f
addr == 16'h72f ? 16'he002 :  // <0107> br xz :found_state
addr == 16'h730 ? 16'h0737 :  // <0107> "
addr == 16'h731 ? 16'hc800 :  // <0108> i = i+j
addr == 16'h732 ? 16'h0b10 :  // <0108> "
addr == 16'h733 ? 16'hc800 :  // <0109> x = x+y
addr == 16'h734 ? 16'h1320 :  // <0109> "
addr == 16'h735 ? 16'he00f :  // <0110> jmp :next_state
addr == 16'h736 ? 16'h072f :  // <0110> "
// :found_state // = 0x0737
// index into maps by RPM.
addr == 16'h737 ? 16'h0c07 :  // <0113> j = gb
addr == 16'h738 ? 16'hc800 :  // <0114> a = i+j
addr == 16'h739 ? 16'h0310 :  // <0114> "
// convert from words to bytes.
addr == 16'h73a ? 16'h0351 :  // <0116> a = a<<1
// add map address.
