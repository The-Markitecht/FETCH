
        `include "header.v"

        module target_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.

addr == 16'h00 ? 16'he00f :  // <0004> jmp :main
addr == 16'h01 ? 16'h0465 :  // <0004> "


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

addr == 16'h02 ? 16'h001e :  // <0181> emit_debugger_register_table  counter
// "       a"
addr == 16'h03 ? 16'h2020 :  // <0181>   
addr == 16'h04 ? 16'h2020 :  // <0181>   
addr == 16'h05 ? 16'h2020 :  // <0181>   
addr == 16'h06 ? 16'h6120 :  // <0181> a 
// "       b"
addr == 16'h07 ? 16'h2020 :  // <0181>   
addr == 16'h08 ? 16'h2020 :  // <0181>   
addr == 16'h09 ? 16'h2020 :  // <0181>   
addr == 16'h0a ? 16'h6220 :  // <0181> b 
// "       i"
addr == 16'h0b ? 16'h2020 :  // <0181>   
addr == 16'h0c ? 16'h2020 :  // <0181>   
addr == 16'h0d ? 16'h2020 :  // <0181>   
addr == 16'h0e ? 16'h6920 :  // <0181> i 
// "       j"
addr == 16'h0f ? 16'h2020 :  // <0181>   
addr == 16'h10 ? 16'h2020 :  // <0181>   
addr == 16'h11 ? 16'h2020 :  // <0181>   
addr == 16'h12 ? 16'h6a20 :  // <0181> j 
// "       x"
addr == 16'h13 ? 16'h2020 :  // <0181>   
addr == 16'h14 ? 16'h2020 :  // <0181>   
addr == 16'h15 ? 16'h2020 :  // <0181>   
addr == 16'h16 ? 16'h7820 :  // <0181> x 
// "       y"
addr == 16'h17 ? 16'h2020 :  // <0181>   
addr == 16'h18 ? 16'h2020 :  // <0181>   
addr == 16'h19 ? 16'h2020 :  // <0181>   
addr == 16'h1a ? 16'h7920 :  // <0181> y 
// "      g6"
addr == 16'h1b ? 16'h2020 :  // <0181>   
addr == 16'h1c ? 16'h2020 :  // <0181>   
addr == 16'h1d ? 16'h2020 :  // <0181>   
addr == 16'h1e ? 16'h3667 :  // <0181> 6g
// "      g7"
addr == 16'h1f ? 16'h2020 :  // <0181>   
addr == 16'h20 ? 16'h2020 :  // <0181>   
addr == 16'h21 ? 16'h2020 :  // <0181>   
addr == 16'h22 ? 16'h3767 :  // <0181> 7g
// "//rstk  "
addr == 16'h23 ? 16'h2f2f :  // <0181> //
addr == 16'h24 ? 16'h7372 :  // <0181> sr
addr == 16'h25 ? 16'h6b74 :  // <0181> kt
addr == 16'h26 ? 16'h2020 :  // <0181>   
// "  ev_pri"
addr == 16'h27 ? 16'h2020 :  // <0181>   
addr == 16'h28 ? 16'h7665 :  // <0181> ve
addr == 16'h29 ? 16'h705f :  // <0181> p_
addr == 16'h2a ? 16'h6972 :  // <0181> ir
// "softevnt"
addr == 16'h2b ? 16'h6f73 :  // <0181> os
addr == 16'h2c ? 16'h7466 :  // <0181> tf
addr == 16'h2d ? 16'h7665 :  // <0181> ve
addr == 16'h2e ? 16'h746e :  // <0181> tn
// "   usage"
addr == 16'h2f ? 16'h2020 :  // <0181>   
addr == 16'h30 ? 16'h7520 :  // <0181> u 
addr == 16'h31 ? 16'h6173 :  // <0181> as
addr == 16'h32 ? 16'h6567 :  // <0181> eg
// "ustimer0"
addr == 16'h33 ? 16'h7375 :  // <0181> su
addr == 16'h34 ? 16'h6974 :  // <0181> it
addr == 16'h35 ? 16'h656d :  // <0181> em
addr == 16'h36 ? 16'h3072 :  // <0181> 0r
// "mstimer0"
addr == 16'h37 ? 16'h736d :  // <0181> sm
addr == 16'h38 ? 16'h6974 :  // <0181> it
addr == 16'h39 ? 16'h656d :  // <0181> em
addr == 16'h3a ? 16'h3072 :  // <0181> 0r
// "mstimer1"
addr == 16'h3b ? 16'h736d :  // <0181> sm
addr == 16'h3c ? 16'h6974 :  // <0181> it
addr == 16'h3d ? 16'h656d :  // <0181> em
addr == 16'h3e ? 16'h3172 :  // <0181> 1r
// "mstimer2"
addr == 16'h3f ? 16'h736d :  // <0181> sm
addr == 16'h40 ? 16'h6974 :  // <0181> it
addr == 16'h41 ? 16'h656d :  // <0181> em
addr == 16'h42 ? 16'h3272 :  // <0181> 2r
// "spi_data"
addr == 16'h43 ? 16'h7073 :  // <0181> ps
addr == 16'h44 ? 16'h5f69 :  // <0181> _i
addr == 16'h45 ? 16'h6164 :  // <0181> ad
addr == 16'h46 ? 16'h6174 :  // <0181> at
// "//avwrdt"
addr == 16'h47 ? 16'h2f2f :  // <0181> //
addr == 16'h48 ? 16'h7661 :  // <0181> va
addr == 16'h49 ? 16'h7277 :  // <0181> rw
addr == 16'h4a ? 16'h7464 :  // <0181> td
// "av_rd_dt"
addr == 16'h4b ? 16'h7661 :  // <0181> va
addr == 16'h4c ? 16'h725f :  // <0181> r_
addr == 16'h4d ? 16'h5f64 :  // <0181> _d
addr == 16'h4e ? 16'h7464 :  // <0181> td
// "av_ad_hi"
addr == 16'h4f ? 16'h7661 :  // <0181> va
addr == 16'h50 ? 16'h615f :  // <0181> a_
addr == 16'h51 ? 16'h5f64 :  // <0181> _d
addr == 16'h52 ? 16'h6968 :  // <0181> ih
// "av_ad_lo"
addr == 16'h53 ? 16'h7661 :  // <0181> va
addr == 16'h54 ? 16'h615f :  // <0181> a_
addr == 16'h55 ? 16'h5f64 :  // <0181> _d
addr == 16'h56 ? 16'h6f6c :  // <0181> ol
// "//uartdt"
addr == 16'h57 ? 16'h2f2f :  // <0181> //
addr == 16'h58 ? 16'h6175 :  // <0181> au
addr == 16'h59 ? 16'h7472 :  // <0181> tr
addr == 16'h5a ? 16'h7464 :  // <0181> td
// "uartstat"
addr == 16'h5b ? 16'h6175 :  // <0181> au
addr == 16'h5c ? 16'h7472 :  // <0181> tr
addr == 16'h5d ? 16'h7473 :  // <0181> ts
addr == 16'h5e ? 16'h7461 :  // <0181> ta
// "    leds"
addr == 16'h5f ? 16'h2020 :  // <0181>   
addr == 16'h60 ? 16'h2020 :  // <0181>   
addr == 16'h61 ? 16'h656c :  // <0181> el
addr == 16'h62 ? 16'h7364 :  // <0181> sd
// "brd_ctrl"
addr == 16'h63 ? 16'h7262 :  // <0181> rb
addr == 16'h64 ? 16'h5f64 :  // <0181> _d
addr == 16'h65 ? 16'h7463 :  // <0181> tc
addr == 16'h66 ? 16'h6c72 :  // <0181> lr
// "   anmux"
addr == 16'h67 ? 16'h2020 :  // <0181>   
addr == 16'h68 ? 16'h6120 :  // <0181> a 
addr == 16'h69 ? 16'h6d6e :  // <0181> mn
addr == 16'h6a ? 16'h7875 :  // <0181> xu
// "pwr_duty"
addr == 16'h6b ? 16'h7770 :  // <0181> wp
addr == 16'h6c ? 16'h5f72 :  // <0181> _r
addr == 16'h6d ? 16'h7564 :  // <0181> ud
addr == 16'h6e ? 16'h7974 :  // <0181> yt
// "igntmcap"
addr == 16'h6f ? 16'h6769 :  // <0181> gi
addr == 16'h70 ? 16'h746e :  // <0181> tn
addr == 16'h71 ? 16'h636d :  // <0181> cm
addr == 16'h72 ? 16'h7061 :  // <0181> pa
// "igntmout"
addr == 16'h73 ? 16'h6769 :  // <0181> gi
addr == 16'h74 ? 16'h746e :  // <0181> tn
addr == 16'h75 ? 16'h6f6d :  // <0181> om
addr == 16'h76 ? 16'h7475 :  // <0181> tu
// "puflenus"
addr == 16'h77 ? 16'h7570 :  // <0181> up
addr == 16'h78 ? 16'h6c66 :  // <0181> lf
addr == 16'h79 ? 16'h6e65 :  // <0181> ne
addr == 16'h7a ? 16'h7375 :  // <0181> su

// string resources
// :boot_msg // = 0x007b
// "TGT\r\n\x0"
addr == 16'h7b ? 16'h4754 :  // <0185> GT
addr == 16'h7c ? 16'h0d54 :  // <0185>  T
addr == 16'h7d ? 16'h000a :  // <0185>   

// libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.

// event loop.  this infrastructure is assembled directly into the main program, not a func.
// first instruction of an event handler should be the 7th cycle after reading its priority from the event controller here.
// :poll_events // = 0x007e
// initialize prior to polling loop, for minimum latency.
addr == 16'h7e ? 16'h07a0 :  // <0006> b = :event_table
addr == 16'h7f ? 16'h048d :  // <0006> "
// 3-cycle polling loop.
// :poll_events_again // = 0x0080
addr == 16'h80 ? 16'h0009 :  // <0009> a = event_priority
addr == 16'h81 ? 16'he000 :  // <0010> br 0z :poll_events_again
addr == 16'h82 ? 16'h0080 :  // <0010> "
// acknowledge the event to clear its capture register.  do this right away,
// so another occurrence of the same event can be captured right away in the controller.
addr == 16'h83 ? 16'h2400 :  // <0013> event_priority = a
// compute an address in the event_table.  note the absence of a wait state for the adder here (not needed).
addr == 16'h84 ? 16'hd300 :  // <0015> fetch rtna from ad0
addr == 16'h85 ? 16'hfbb0 :  // <0015> "
// jump to the address given in the event_table.  each handler MUST end with a end_event.
// each handler does NOT need to save ANY registers (e.g. no convention_gpx).  they can all be trashed.
// each handler is passed the event priority in a, in case the same handler is used on multiple priorities.
addr == 16'h86 ? 16'hfc00 :  // <0019> swapra = nop
// just returned here from the handler, in case the handler accidentally did a rtn.  this should NEVER happen.
addr == 16'h87 ? 16'h5fa0 :  // <0021> error_halt_code 0xffc0 // leds = 0xffc0
addr == 16'h88 ? 16'hffc0 :  // <0021> "
addr == 16'h89 ? 16'he00f :  // <0021> error_halt_code 0xffc0
addr == 16'h8a ? 16'h0089 :  // <0021> "


// driver library for synapse316_uart simple async transceiver.






// routine sends out the low byte from a to the UART.  blocks until the FIFO accepts the byte.
// ######## func putchar_fduart // = 0x008b
addr == 16'h8b ? 16'h2004 :  // <0046> push x // func putchar_fduart

addr == 16'h8c ? 16'h1000 :  // <0048> x = a

// wait for FIFO to be available.
addr == 16'h8d ? 16'h0202 :  // <0051> a = $atx_fifo_full_mask
// :pcfduart_wait_for_idle // = 0x008e
addr == 16'h8e ? 16'h0416 :  // <0053> b = fduart_status
addr == 16'h8f ? 16'he403 :  // <0054> bn and0z :pcfduart_wait_for_idle
addr == 16'h90 ? 16'h008e :  // <0054> "

// push word to the UART.  its low byte is a character.
addr == 16'h91 ? 16'h5404 :  // <0057> fduart_data = x
addr == 16'h92 ? 16'h1008 :  // <0058> pop x // end_func
addr == 16'h93 ? 16'hfc00 :  // <0058> swapra = nop

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// ######## func getchar_fduart // = 0x0094
// wait until FIFO is populated.
addr == 16'h94 ? 16'h0208 :  // <0064> a = $arx_fifo_empty_mask
// :wait_for_busy // = 0x0095
addr == 16'h95 ? 16'h0416 :  // <0066> b = fduart_status
addr == 16'h96 ? 16'he403 :  // <0067> bn and0z :wait_for_busy
addr == 16'h97 ? 16'h0095 :  // <0067> "
addr == 16'h98 ? 16'h0015 :  // <0068> a = fduart_data
addr == 16'h99 ? 16'hfc00 :  // <0069> swapra = nop

// returns a character in a, or -1 if none.
// ######## func pollchar_fduart // = 0x009a
// check for FIFO is populated.
addr == 16'h9a ? 16'h0208 :  // <0074> a = $arx_fifo_empty_mask
addr == 16'h9b ? 16'h0416 :  // <0075> b = fduart_status
addr == 16'h9c ? 16'he403 :  // <0076> bn and0z :none
addr == 16'h9d ? 16'h00a0 :  // <0076> "
addr == 16'h9e ? 16'h0015 :  // <0077> a = fduart_data
addr == 16'h9f ? 16'hfc00 :  // <0078> swapra = nop
// :none // = 0x00a0
addr == 16'ha0 ? 16'h0360 :  // <0080> a = -1
addr == 16'ha1 ? 16'hfc00 :  // <0081> swapra = nop


// pass desired anmux channel in a.
// after this returns, CALLER MUST WAIT for muxer & current driver to
// settle down.  some delay for that is absolutely required (per testing).
// 5 ms wait works well 2015/04.
// ######## func anmux_set_chn // = 0x00a2
// set & enable analog muxer
addr == 16'ha2 ? 16'h0608 :  // <0007> b = $anmux_enable_mask
addr == 16'ha3 ? 16'hc800 :  // <0008> anmux_ctrl = or
addr == 16'ha4 ? 16'h6734 :  // <0008> "
addr == 16'ha5 ? 16'hfc00 :  // <0009> swapra = nop

// ######## func anmux_get_chn // = 0x00a6
addr == 16'ha6 ? 16'h0019 :  // <0012> a = anmux_ctrl
addr == 16'ha7 ? 16'h0607 :  // <0013> b = $anmux_channel_mask
addr == 16'ha8 ? 16'hc800 :  // <0014> a = and
addr == 16'ha9 ? 16'h0330 :  // <0014> "
addr == 16'haa ? 16'hfc00 :  // <0015> swapra = nop


// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x00ab
// "0123456789abcdef"
addr == 16'hab ? 16'h3130 :  // <0050> 10
addr == 16'hac ? 16'h3332 :  // <0050> 32
addr == 16'had ? 16'h3534 :  // <0050> 54
addr == 16'hae ? 16'h3736 :  // <0050> 76
addr == 16'haf ? 16'h3938 :  // <0050> 98
addr == 16'hb0 ? 16'h6261 :  // <0050> ba
addr == 16'hb1 ? 16'h6463 :  // <0050> dc
addr == 16'hb2 ? 16'h6665 :  // <0050> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// ######## func put4x // = 0x00b3
addr == 16'hb3 ? 16'h2004 :  // <0054> push x // func put4x
addr == 16'hb4 ? 16'h2006 :  // <0054> push g6 // "
addr == 16'hb5 ? 16'h203e :  // <0054> push rtna // "
addr == 16'hb6 ? 16'h13a0 :  // <0055> x = :hexdigits
addr == 16'hb7 ? 16'h00ab :  // <0055> "

addr == 16'hb8 ? 16'h1800 :  // <0057> g6 = a
addr == 16'hb9 ? 16'h07a0 :  // <0058> b = 0xF000
addr == 16'hba ? 16'hf000 :  // <0058> "
addr == 16'hbb ? 16'hc800 :  // <0059> a = and
addr == 16'hbc ? 16'h0330 :  // <0059> "
addr == 16'hbd ? 16'h0353 :  // <0060> a = a>>4
addr == 16'hbe ? 16'h0353 :  // <0061> a = a>>4
addr == 16'hbf ? 16'h0353 :  // <0062> a = a>>4
addr == 16'hc0 ? 16'hfba0 :  // <0063> call fetch_byte
addr == 16'hc1 ? 16'h01cc :  // <0063> "
addr == 16'hc2 ? 16'hfc00 :  // <0063> "
addr == 16'hc3 ? 16'hfba0 :  // <0064> putchar a
addr == 16'hc4 ? 16'h008b :  // <0064> "
addr == 16'hc5 ? 16'hfc00 :  // <0064> "

addr == 16'hc6 ? 16'h0006 :  // <0066> a = g6
addr == 16'hc7 ? 16'h07a0 :  // <0067> b = 0x0F00
addr == 16'hc8 ? 16'h0f00 :  // <0067> "
addr == 16'hc9 ? 16'hc800 :  // <0068> a = and
addr == 16'hca ? 16'h0330 :  // <0068> "
addr == 16'hcb ? 16'h0353 :  // <0069> a = a>>4
addr == 16'hcc ? 16'h0353 :  // <0070> a = a>>4
addr == 16'hcd ? 16'hfba0 :  // <0071> call fetch_byte
addr == 16'hce ? 16'h01cc :  // <0071> "
addr == 16'hcf ? 16'hfc00 :  // <0071> "
addr == 16'hd0 ? 16'hfba0 :  // <0072> putchar a
addr == 16'hd1 ? 16'h008b :  // <0072> "
addr == 16'hd2 ? 16'hfc00 :  // <0072> "

addr == 16'hd3 ? 16'h0006 :  // <0074> a = g6
addr == 16'hd4 ? 16'h06f0 :  // <0075> b = 0x00F0
addr == 16'hd5 ? 16'hc800 :  // <0076> a = and
addr == 16'hd6 ? 16'h0330 :  // <0076> "
addr == 16'hd7 ? 16'h0353 :  // <0077> a = a>>4
addr == 16'hd8 ? 16'hfba0 :  // <0078> call fetch_byte
addr == 16'hd9 ? 16'h01cc :  // <0078> "
addr == 16'hda ? 16'hfc00 :  // <0078> "
addr == 16'hdb ? 16'hfba0 :  // <0079> putchar a
addr == 16'hdc ? 16'h008b :  // <0079> "
addr == 16'hdd ? 16'hfc00 :  // <0079> "

addr == 16'hde ? 16'h0006 :  // <0081> a = g6
addr == 16'hdf ? 16'h060f :  // <0082> b = 0x000F
addr == 16'he0 ? 16'hc800 :  // <0083> a = and
addr == 16'he1 ? 16'h0330 :  // <0083> "
addr == 16'he2 ? 16'hfba0 :  // <0084> call fetch_byte
addr == 16'he3 ? 16'h01cc :  // <0084> "
addr == 16'he4 ? 16'hfc00 :  // <0084> "
addr == 16'he5 ? 16'hfba0 :  // <0085> putchar a
addr == 16'he6 ? 16'h008b :  // <0085> "
addr == 16'he7 ? 16'hfc00 :  // <0085> "

addr == 16'he8 ? 16'hf808 :  // <0087> pop rtna // end_func
addr == 16'he9 ? 16'h1808 :  // <0087> pop g6 // "
addr == 16'hea ? 16'h1008 :  // <0087> pop x // "
addr == 16'heb ? 16'hfc00 :  // <0087> swapra = nop

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// ######## func get4x // = 0x00ec
addr == 16'hec ? 16'h2002 :  // <0091> push i // func get4x
addr == 16'hed ? 16'h2003 :  // <0091> push j // "
addr == 16'hee ? 16'h2004 :  // <0091> push x // "
addr == 16'hef ? 16'h2005 :  // <0091> push y // "
addr == 16'hf0 ? 16'h203e :  // <0091> push rtna // "
// y = digit counter
// j = sum
addr == 16'hf1 ? 16'h1604 :  // <0094> y = 4
// :again // = 0x00f2
addr == 16'hf2 ? 16'hfba0 :  // <0096> getchar
addr == 16'hf3 ? 16'h0094 :  // <0096> "
addr == 16'hf4 ? 16'hfc00 :  // <0096> "
addr == 16'hf5 ? 16'h13a0 :  // <0097> x = :hexdigits
addr == 16'hf6 ? 16'h00ab :  // <0097> "
addr == 16'hf7 ? 16'h0a10 :  // <0098> i = 16
addr == 16'hf8 ? 16'hfba0 :  // <0099> call :find_in_fetch
addr == 16'hf9 ? 16'h01e0 :  // <0099> "
addr == 16'hfa ? 16'hfc00 :  // <0099> "
addr == 16'hfb ? 16'h0760 :  // <0100> b = -1
addr == 16'hfc ? 16'he007 :  // <0101> br eq :fail
addr == 16'hfd ? 16'h0111 :  // <0101> "
addr == 16'hfe ? 16'h0400 :  // <0102> b = a
addr == 16'hff ? 16'h0003 :  // <0103> a = j
addr == 16'h100 ? 16'h0352 :  // <0104> a = a<<4
addr == 16'h101 ? 16'hc800 :  // <0105> j = or
addr == 16'h102 ? 16'h0f34 :  // <0105> "
addr == 16'h103 ? 16'h1360 :  // <0106> x = -1
addr == 16'h104 ? 16'hc800 :  // <0107> y = x+y
addr == 16'h105 ? 16'h1720 :  // <0107> "
addr == 16'h106 ? 16'h0005 :  // <0108> a = y
addr == 16'h107 ? 16'he400 :  // <0109> bn az :again
addr == 16'h108 ? 16'h00f2 :  // <0109> "
addr == 16'h109 ? 16'h0003 :  // <0110> a = j
addr == 16'h10a ? 16'h0600 :  // <0111> b = 0
addr == 16'h10b ? 16'hf808 :  // <0112> pop rtna // rtn
addr == 16'h10c ? 16'h1408 :  // <0112> pop y // "
addr == 16'h10d ? 16'h1008 :  // <0112> pop x // "
addr == 16'h10e ? 16'h0c08 :  // <0112> pop j // "
addr == 16'h10f ? 16'h0808 :  // <0112> pop i // "
addr == 16'h110 ? 16'hfc00 :  // <0112> swapra = nop
// :fail // = 0x0111
addr == 16'h111 ? 16'h0760 :  // <0114> b = -1
addr == 16'h112 ? 16'hf808 :  // <0115> pop rtna // end_func
addr == 16'h113 ? 16'h1408 :  // <0115> pop y // "
addr == 16'h114 ? 16'h1008 :  // <0115> pop x // "
addr == 16'h115 ? 16'h0c08 :  // <0115> pop j // "
addr == 16'h116 ? 16'h0808 :  // <0115> pop i // "
addr == 16'h117 ? 16'hfc00 :  // <0115> swapra = nop

// print a fixed-length string from packed words in program space.
// pass its word address (not its byte address) in a,  its length (bytes) in b.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_fixed // = 0x0118
addr == 16'h118 ? 16'h2002 :  // <0121> push i // func print_fixed
addr == 16'h119 ? 16'h2003 :  // <0121> push j // "
addr == 16'h11a ? 16'h2004 :  // <0121> push x // "
addr == 16'h11b ? 16'h2005 :  // <0121> push y // "
addr == 16'h11c ? 16'h2006 :  // <0121> push g6 // "
addr == 16'h11d ? 16'h203e :  // <0121> push rtna // "
addr == 16'h11e ? 16'h0800 :  // <0122> i = a
addr == 16'h11f ? 16'h0e01 :  // <0123> j = 1
addr == 16'h120 ? 16'h1001 :  // <0124> x = b
addr == 16'h121 ? 16'h1760 :  // <0125> y = -1
// :next_word // = 0x0122
addr == 16'h122 ? 16'he002 :  // <0127> br xz :done
addr == 16'h123 ? 16'h0138 :  // <0127> "
addr == 16'h124 ? 16'h1320 :  // <0128> x = ad2
addr == 16'h125 ? 16'hd002 :  // <0129> fetch g6 from i
addr == 16'h126 ? 16'h1bb0 :  // <0129> "
// now x = bytes remaining, i = current word address, g6 = data word.
addr == 16'h127 ? 16'h0006 :  // <0131> a = g6 // putchar g6
addr == 16'h128 ? 16'hfba0 :  // <0131> putchar g6
addr == 16'h129 ? 16'h008b :  // <0131> "
addr == 16'h12a ? 16'hfc00 :  // <0131> "
addr == 16'h12b ? 16'he002 :  // <0132> br xz :done
addr == 16'h12c ? 16'h0138 :  // <0132> "
addr == 16'h12d ? 16'h1320 :  // <0133> x = ad2
addr == 16'h12e ? 16'h0006 :  // <0134> a = g6
addr == 16'h12f ? 16'h0353 :  // <0135> a = a>>4
addr == 16'h130 ? 16'h0353 :  // <0136> a = a>>4
addr == 16'h131 ? 16'hfba0 :  // <0137> putchar a
addr == 16'h132 ? 16'h008b :  // <0137> "
addr == 16'h133 ? 16'hfc00 :  // <0137> "
addr == 16'h134 ? 16'hc800 :  // <0138> i = i+j
addr == 16'h135 ? 16'h0b10 :  // <0138> "
addr == 16'h136 ? 16'he00f :  // <0139> jmp :next_word
addr == 16'h137 ? 16'h0122 :  // <0139> "
// :done // = 0x0138
addr == 16'h138 ? 16'hf808 :  // <0141> pop rtna // end_func
addr == 16'h139 ? 16'h1808 :  // <0141> pop g6 // "
addr == 16'h13a ? 16'h1408 :  // <0141> pop y // "
addr == 16'h13b ? 16'h1008 :  // <0141> pop x // "
addr == 16'h13c ? 16'h0c08 :  // <0141> pop j // "
addr == 16'h13d ? 16'h0808 :  // <0141> pop i // "
addr == 16'h13e ? 16'hfc00 :  // <0141> swapra = nop

// print a null-terminated string from packed words in program space.
// pass its word address (not its byte address) in a.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_nt // = 0x013f
addr == 16'h13f ? 16'h2002 :  // <0147> push i // func print_nt
addr == 16'h140 ? 16'h2003 :  // <0147> push j // "
addr == 16'h141 ? 16'h2004 :  // <0147> push x // "
addr == 16'h142 ? 16'h203e :  // <0147> push rtna // "
addr == 16'h143 ? 16'h0800 :  // <0148> i = a
addr == 16'h144 ? 16'h0e01 :  // <0149> j = 1
// :next_word // = 0x0145
addr == 16'h145 ? 16'hd002 :  // <0151> fetch x from i
addr == 16'h146 ? 16'h13b0 :  // <0151> "
// now i = current word address, x = data word, b = low byte mask, a = data byte.
addr == 16'h147 ? 16'h0004 :  // <0153> a = x
addr == 16'h148 ? 16'h06ff :  // <0154> b = 0xff
addr == 16'h149 ? 16'he003 :  // <0155> br and0z :done
addr == 16'h14a ? 16'h015b :  // <0155> "
addr == 16'h14b ? 16'hfba0 :  // <0156> putchar a
addr == 16'h14c ? 16'h008b :  // <0156> "
addr == 16'h14d ? 16'hfc00 :  // <0156> "
addr == 16'h14e ? 16'h0004 :  // <0157> a = x
addr == 16'h14f ? 16'h0353 :  // <0158> a = a>>4
addr == 16'h150 ? 16'h0353 :  // <0159> a = a>>4
addr == 16'h151 ? 16'h06ff :  // <0160> b = 0xff
addr == 16'h152 ? 16'he003 :  // <0161> br and0z :done
addr == 16'h153 ? 16'h015b :  // <0161> "
addr == 16'h154 ? 16'hfba0 :  // <0162> putchar a
addr == 16'h155 ? 16'h008b :  // <0162> "
addr == 16'h156 ? 16'hfc00 :  // <0162> "
addr == 16'h157 ? 16'hc800 :  // <0163> i = i+j
addr == 16'h158 ? 16'h0b10 :  // <0163> "
addr == 16'h159 ? 16'he00f :  // <0164> jmp :next_word
addr == 16'h15a ? 16'h0145 :  // <0164> "
// :done // = 0x015b
addr == 16'h15b ? 16'hf808 :  // <0166> pop rtna // end_func
addr == 16'h15c ? 16'h1008 :  // <0166> pop x // "
addr == 16'h15d ? 16'h0c08 :  // <0166> pop j // "
addr == 16'h15e ? 16'h0808 :  // <0166> pop i // "
addr == 16'h15f ? 16'hfc00 :  // <0166> swapra = nop


// function library for simple integer math.

// ######## func multiply // = 0x0160
addr == 16'h160 ? 16'h2002 :  // <0004> push i // func multiply
addr == 16'h161 ? 16'h2003 :  // <0004> push j // "
addr == 16'h162 ? 16'h2004 :  // <0004> push x // "
addr == 16'h163 ? 16'h2005 :  // <0004> push y // "
// unsigned 16-bit multiplication.  a = a * b.
// it's easy to roll over the 16-bit result by passing operands whose bit widths total more than 16.
// bigger/safer/faster math can be obtained from Altera IP blocks.

addr == 16'h164 ? 16'h1000 :  // <0009> x = a
addr == 16'h165 ? 16'h1401 :  // <0010> y = b
addr == 16'h166 ? 16'h0a00 :  // <0011> i = 0
// :again // = 0x0167
addr == 16'h167 ? 16'he002 :  // <0013> br xz :done
addr == 16'h168 ? 16'h0176 :  // <0013> "
addr == 16'h169 ? 16'h0004 :  // <0014> a = x
addr == 16'h16a ? 16'h0601 :  // <0015> b = 1
addr == 16'h16b ? 16'he003 :  // <0016> br and0z :skip_add
addr == 16'h16c ? 16'h0170 :  // <0016> "
addr == 16'h16d ? 16'h0c05 :  // <0017> j = y
addr == 16'h16e ? 16'hc800 :  // <0018> i = i+j
addr == 16'h16f ? 16'h0b10 :  // <0018> "
// :skip_add // = 0x0170
addr == 16'h170 ? 16'h0004 :  // <0020> a = x
addr == 16'h171 ? 16'h1350 :  // <0021> x = a>>1
addr == 16'h172 ? 16'h0005 :  // <0022> a = y
addr == 16'h173 ? 16'h1751 :  // <0023> y = a<<1
addr == 16'h174 ? 16'he00f :  // <0024> jmp :again
addr == 16'h175 ? 16'h0167 :  // <0024> "
// :done // = 0x0176
addr == 16'h176 ? 16'h0002 :  // <0026> a = i
addr == 16'h177 ? 16'h1408 :  // <0027> pop y // end_func
addr == 16'h178 ? 16'h1008 :  // <0027> pop x // "
addr == 16'h179 ? 16'h0c08 :  // <0027> pop j // "
addr == 16'h17a ? 16'h0808 :  // <0027> pop i // "
addr == 16'h17b ? 16'hfc00 :  // <0027> swapra = nop

// ######## func divide // = 0x017c
addr == 16'h17c ? 16'h2002 :  // <0029> push i // func divide
addr == 16'h17d ? 16'h2003 :  // <0029> push j // "
addr == 16'h17e ? 16'h2004 :  // <0029> push x // "
addr == 16'h17f ? 16'h2005 :  // <0029> push y // "
addr == 16'h180 ? 16'h2006 :  // <0029> push g6 // "
addr == 16'h181 ? 16'h2007 :  // <0029> push g7 // "
// unsigned 15-bit division.  b = a / b.  return remainder in a.
// division by zero results in zero.
// THE HIGH BIT OF A MUST BE 0!!  ALSO THE HIGH BIT OF B MUST BE 0!!
// 1 in the high bit of either operand results in infinite loop or wrong results.
// bigger/safer/faster math can be obtained from Altera IP blocks.

// degenerate cases.
addr == 16'h182 ? 16'he005 :  // <0037> br lt :zero
addr == 16'h183 ? 16'h01bd :  // <0037> "
addr == 16'h184 ? 16'he000 :  // <0038> br az :zero
addr == 16'h185 ? 16'h01bd :  // <0038> "
addr == 16'h186 ? 16'h1000 :  // <0039> x = a
//    g7 = x
addr == 16'h187 ? 16'h0001 :  // <0041> a = b
addr == 16'h188 ? 16'he000 :  // <0042> br az :zero
addr == 16'h189 ? 16'h01bd :  // <0042> "
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
addr == 16'h18a ? 16'h0404 :  // <0058> b = x
addr == 16'h18b ? 16'h0a00 :  // <0059> i = 0
addr == 16'h18c ? 16'h0e01 :  // <0060> j = 1
// :shift_again // = 0x018d
addr == 16'h18d ? 16'he006 :  // <0062> br gt :shift_done
addr == 16'h18e ? 16'h0193 :  // <0062> "
addr == 16'h18f ? 16'h0351 :  // <0063> a = a<<1
addr == 16'h190 ? 16'h0b10 :  // <0064> i = ad1
addr == 16'h191 ? 16'he00f :  // <0065> jmp :shift_again
addr == 16'h192 ? 16'h018d :  // <0065> "
// :shift_done // = 0x0193
addr == 16'h193 ? 16'h1b50 :  // <0067> g6 = a>>1
// now operands are x / g6.  i = number of passes of long division required.
// notice i was not decremented here, so it has 1 more in it than the number of shifts required for digit parity.
// that's exactly what it needs for correctness.

// // compensate for special case where msb was 1.  then 1 more division pass is needed.
// j = y
// i = i+j
// x = g7

// long division.  g7 = quotient.
addr == 16'h194 ? 16'h1e00 :  // <0078> g7 = 0
addr == 16'h195 ? 16'h0f60 :  // <0079> j = -1
// :again // = 0x0196
addr == 16'h196 ? 16'he001 :  // <0081> br iz :done
addr == 16'h197 ? 16'h01b4 :  // <0081> "
addr == 16'h198 ? 16'h0006 :  // <0082> a = g6
addr == 16'h199 ? 16'h0404 :  // <0083> b = x
addr == 16'h19a ? 16'he006 :  // <0084> br gt :result0
addr == 16'h19b ? 16'h01ac :  // <0084> "
// temp does fit; output a 1.
addr == 16'h19c ? 16'h0007 :  // <0086> a = g7
addr == 16'h19d ? 16'h0351 :  // <0087> a = a<<1
addr == 16'h19e ? 16'h0601 :  // <0088> b = 1
addr == 16'h19f ? 16'hc800 :  // <0089> g7 = or
addr == 16'h1a0 ? 16'h1f34 :  // <0089> "
// dividend = dividend - temp
addr == 16'h1a1 ? 16'h0006 :  // <0091> a = g6
addr == 16'h1a2 ? 16'h0760 :  // <0092> b = -1
addr == 16'h1a3 ? 16'hc800 :  // <0093> a = xor
addr == 16'h1a4 ? 16'h0338 :  // <0093> "
addr == 16'h1a5 ? 16'h0601 :  // <0094> b = 1
addr == 16'h1a6 ? 16'hc800 :  // <0095> y = a+b
addr == 16'h1a7 ? 16'h1700 :  // <0095> "
addr == 16'h1a8 ? 16'hc800 :  // <0096> x = x+y
addr == 16'h1a9 ? 16'h1320 :  // <0096> "
addr == 16'h1aa ? 16'he00f :  // <0097> jmp :next
addr == 16'h1ab ? 16'h01ae :  // <0097> "
// :result0 // = 0x01ac
// temp does not fit; output a 0.
addr == 16'h1ac ? 16'h0007 :  // <0100> a = g7
addr == 16'h1ad ? 16'h1f51 :  // <0101> g7 = a<<1
// no change to dividend.
// :next // = 0x01ae
addr == 16'h1ae ? 16'h0006 :  // <0104> a = g6
addr == 16'h1af ? 16'h1b50 :  // <0105> g6 = a>>1
addr == 16'h1b0 ? 16'hc800 :  // <0106> i = i+j
addr == 16'h1b1 ? 16'h0b10 :  // <0106> "
addr == 16'h1b2 ? 16'he00f :  // <0107> jmp :again
addr == 16'h1b3 ? 16'h0196 :  // <0107> "

// :done // = 0x01b4
addr == 16'h1b4 ? 16'h0407 :  // <0110> b = g7
addr == 16'h1b5 ? 16'h0004 :  // <0111> a = x
addr == 16'h1b6 ? 16'h1c08 :  // <0112> pop g7 // rtn
addr == 16'h1b7 ? 16'h1808 :  // <0112> pop g6 // "
addr == 16'h1b8 ? 16'h1408 :  // <0112> pop y // "
addr == 16'h1b9 ? 16'h1008 :  // <0112> pop x // "
addr == 16'h1ba ? 16'h0c08 :  // <0112> pop j // "
addr == 16'h1bb ? 16'h0808 :  // <0112> pop i // "
addr == 16'h1bc ? 16'hfc00 :  // <0112> swapra = nop

// :zero // = 0x01bd
addr == 16'h1bd ? 16'h0600 :  // <0115> b = 0
addr == 16'h1be ? 16'h1c08 :  // <0116> pop g7 // rtn
addr == 16'h1bf ? 16'h1808 :  // <0116> pop g6 // "
addr == 16'h1c0 ? 16'h1408 :  // <0116> pop y // "
addr == 16'h1c1 ? 16'h1008 :  // <0116> pop x // "
addr == 16'h1c2 ? 16'h0c08 :  // <0116> pop j // "
addr == 16'h1c3 ? 16'h0808 :  // <0116> pop i // "
addr == 16'h1c4 ? 16'hfc00 :  // <0116> swapra = nop
addr == 16'h1c5 ? 16'h1c08 :  // <0117> pop g7 // end_func
addr == 16'h1c6 ? 16'h1808 :  // <0117> pop g6 // "
addr == 16'h1c7 ? 16'h1408 :  // <0117> pop y // "
addr == 16'h1c8 ? 16'h1008 :  // <0117> pop x // "
addr == 16'h1c9 ? 16'h0c08 :  // <0117> pop j // "
addr == 16'h1ca ? 16'h0808 :  // <0117> pop i // "
addr == 16'h1cb ? 16'hfc00 :  // <0117> swapra = nop


// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// ######## func fetch_byte // = 0x01cc
addr == 16'h1cc ? 16'h0601 :  // <0005> b = 1
addr == 16'h1cd ? 16'he003 :  // <0006> br and0z :pick_byte_even
addr == 16'h1ce ? 16'h01d7 :  // <0006> "
addr == 16'h1cf ? 16'h0350 :  // <0007> a = a>>1
addr == 16'h1d0 ? 16'h0404 :  // <0008> b = x
addr == 16'h1d1 ? 16'hc800 :  // <0009> fetch a from a+b
addr == 16'h1d2 ? 16'hd300 :  // <0009> "
addr == 16'h1d3 ? 16'h03b0 :  // <0009> "
addr == 16'h1d4 ? 16'h0353 :  // <0010> a = a>>4
addr == 16'h1d5 ? 16'h0353 :  // <0011> a = a>>4
addr == 16'h1d6 ? 16'hfc00 :  // <0012> swapra = nop
// :pick_byte_even // = 0x01d7
addr == 16'h1d7 ? 16'h0350 :  // <0014> a = a>>1
addr == 16'h1d8 ? 16'h0404 :  // <0015> b = x
addr == 16'h1d9 ? 16'hc800 :  // <0016> fetch a from a+b
addr == 16'h1da ? 16'hd300 :  // <0016> "
addr == 16'h1db ? 16'h03b0 :  // <0016> "
addr == 16'h1dc ? 16'h06ff :  // <0017> b = 0xff
addr == 16'h1dd ? 16'hc800 :  // <0018> a = and
addr == 16'h1de ? 16'h0330 :  // <0018> "
addr == 16'h1df ? 16'hfc00 :  // <0019> swapra = nop

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// ######## func find_in_fetch // = 0x01e0
addr == 16'h1e0 ? 16'h2002 :  // <0027> push i // func find_in_fetch
addr == 16'h1e1 ? 16'h2003 :  // <0027> push j // "
addr == 16'h1e2 ? 16'h2005 :  // <0027> push y // "
addr == 16'h1e3 ? 16'h203e :  // <0027> push rtna // "
addr == 16'h1e4 ? 16'h1400 :  // <0028> y = a
addr == 16'h1e5 ? 16'h0f60 :  // <0029> j = -1
// :again // = 0x01e6
addr == 16'h1e6 ? 16'he001 :  // <0031> br iz :fail
addr == 16'h1e7 ? 16'h01f6 :  // <0031> "
addr == 16'h1e8 ? 16'h0b10 :  // <0032> i = ad1
addr == 16'h1e9 ? 16'h0002 :  // <0033> a = i
addr == 16'h1ea ? 16'hfba0 :  // <0034> call :fetch_byte
addr == 16'h1eb ? 16'h01cc :  // <0034> "
addr == 16'h1ec ? 16'hfc00 :  // <0034> "
addr == 16'h1ed ? 16'h0405 :  // <0035> b = y
addr == 16'h1ee ? 16'he407 :  // <0036> bn eq :again
addr == 16'h1ef ? 16'h01e6 :  // <0036> "
// :found // = 0x01f0
addr == 16'h1f0 ? 16'h0002 :  // <0038> a = i
addr == 16'h1f1 ? 16'hf808 :  // <0039> pop rtna // rtn
addr == 16'h1f2 ? 16'h1408 :  // <0039> pop y // "
addr == 16'h1f3 ? 16'h0c08 :  // <0039> pop j // "
addr == 16'h1f4 ? 16'h0808 :  // <0039> pop i // "
addr == 16'h1f5 ? 16'hfc00 :  // <0039> swapra = nop
// :fail // = 0x01f6
addr == 16'h1f6 ? 16'h0360 :  // <0041> a = -1
addr == 16'h1f7 ? 16'hf808 :  // <0042> pop rtna // end_func
addr == 16'h1f8 ? 16'h1408 :  // <0042> pop y // "
addr == 16'h1f9 ? 16'h0c08 :  // <0042> pop j // "
addr == 16'h1fa ? 16'h0808 :  // <0042> pop i // "
addr == 16'h1fb ? 16'hfc00 :  // <0042> swapra = nop


// routine waits a number of milliseconds given in a.
// ######## func spinwait // = 0x01fc
addr == 16'h1fc ? 16'h2004 :  // <0002> push x // func spinwait
addr == 16'h1fd ? 16'h2005 :  // <0002> push y // "
//patch
//rtn
addr == 16'h1fe ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x01ff
addr == 16'h1ff ? 16'h13a0 :  // <0007> x = 16666
addr == 16'h200 ? 16'h411a :  // <0007> "
addr == 16'h201 ? 16'h1760 :  // <0008> y = -1
addr == 16'h202 ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x0203
// use of the ad2 name overrides auto-nop here.
addr == 16'h203 ? 16'h1320 :  // <0012> x = ad2
addr == 16'h204 ? 16'he402 :  // <0013> bn xz :spinwait_inner
addr == 16'h205 ? 16'h0203 :  // <0013> "
addr == 16'h206 ? 16'hc800 :  // <0014> a = a+b
addr == 16'h207 ? 16'h0300 :  // <0014> "
addr == 16'h208 ? 16'he400 :  // <0015> bn az :spinwait_outer
addr == 16'h209 ? 16'h01ff :  // <0015> "
addr == 16'h20a ? 16'h1408 :  // <0016> pop y // end_func
addr == 16'h20b ? 16'h1008 :  // <0016> pop x // "
addr == 16'h20c ? 16'hfc00 :  // <0016> swapra = nop




// :cmd_table // = 0x020d
// "  hello"
addr == 16'h20d ? 16'h2020 :  // <0005>   
addr == 16'h20e ? 16'h6568 :  // <0005> eh
addr == 16'h20f ? 16'h6c6c :  // <0005> ll
addr == 16'h210 ? 16'h006f :  // <0005>  o
addr == 16'h211 ? 16'h02a5 :  // <0006> ([label hello_cmd])
// "  plstp"
addr == 16'h212 ? 16'h2020 :  // <0007>   
addr == 16'h213 ? 16'h6c70 :  // <0007> lp
addr == 16'h214 ? 16'h7473 :  // <0007> ts
addr == 16'h215 ? 16'h0070 :  // <0007>  p
addr == 16'h216 ? 16'h02a9 :  // <0008> ([label set_plan_stop_cmd])
// "   plcr"
addr == 16'h217 ? 16'h2020 :  // <0009>   
addr == 16'h218 ? 16'h7020 :  // <0009> p 
addr == 16'h219 ? 16'h636c :  // <0009> cl
addr == 16'h21a ? 16'h0072 :  // <0009>  r
addr == 16'h21b ? 16'h02b4 :  // <0010> ([label set_plan_crank_cmd])
// "   plwm"
addr == 16'h21c ? 16'h2020 :  // <0011>   
addr == 16'h21d ? 16'h7020 :  // <0011> p 
addr == 16'h21e ? 16'h776c :  // <0011> wl
addr == 16'h21f ? 16'h006d :  // <0011>  m
addr == 16'h220 ? 16'h02bf :  // <0012> ([label set_plan_warmup_cmd])
// "   plrn"
addr == 16'h221 ? 16'h2020 :  // <0013>   
addr == 16'h222 ? 16'h7020 :  // <0013> p 
addr == 16'h223 ? 16'h726c :  // <0013> rl
addr == 16'h224 ? 16'h006e :  // <0013>  n
addr == 16'h225 ? 16'h02ca :  // <0014> ([label set_plan_run_cmd])
// "   plln"
addr == 16'h226 ? 16'h2020 :  // <0015>   
addr == 16'h227 ? 16'h7020 :  // <0015> p 
addr == 16'h228 ? 16'h6c6c :  // <0015> ll
addr == 16'h229 ? 16'h006e :  // <0015>  n
addr == 16'h22a ? 16'h02d5 :  // <0016> ([label set_plan_learn_cmd])
// "\x0\x0"
addr == 16'h22b ? 16'h0000 :  // <0017>   


// ######## func parse_key // = 0x022c
addr == 16'h22c ? 16'h2002 :  // <0020> push i // func parse_key
addr == 16'h22d ? 16'h2004 :  // <0020> push x // "
addr == 16'h22e ? 16'h2005 :  // <0020> push y // "
addr == 16'h22f ? 16'h203e :  // <0020> push rtna // "
// memorize into ram_key_buf, pushing down existing content.
addr == 16'h230 ? 16'h2000 :  // <0022> push a // push a
addr == 16'h231 ? 16'h1000 :  // <0023> x = a
addr == 16'h232 ? 16'h0a07 :  // <0032> i = $key_buf_max
// :loop_562 // = 0x0233

addr == 16'h233 ? 16'h0002 :  // <0032> a = i

addr == 16'h234 ? 16'h0351 :  // <0032> a = a<<1
addr == 16'h235 ? 16'h0600 :  // <0032> b = 0
addr == 16'h236 ? 16'h4e00 :  // <0032> av_ad_hi = 0
addr == 16'h237 ? 16'h5300 :  // <0032> av_ad_lo = ad0
addr == 16'h238 ? 16'h0411 :  // <0032> b = av_write_data
addr == 16'h239 ? 16'h0412 :  // <0032> b = av_read_data

addr == 16'h23a ? 16'h1401 :  // <0032> y = b
addr == 16'h23b ? 16'h0002 :  // <0032> a = i
addr == 16'h23c ? 16'h0404 :  // <0032> b = x

addr == 16'h23d ? 16'h0351 :  // <0032> a = a<<1
addr == 16'h23e ? 16'h2001 :  // <0032> push b // push b
addr == 16'h23f ? 16'h0600 :  // <0032> b = 0
addr == 16'h240 ? 16'h4e00 :  // <0032> av_ad_hi = 0
addr == 16'h241 ? 16'h5300 :  // <0032> av_ad_lo = ad0
addr == 16'h242 ? 16'h4408 :  // <0032> pop av_write_data // pop av_write_data

addr == 16'h243 ? 16'h1005 :  // <0032> x = y


addr == 16'h244 ? 16'h0002 :  // <0032> a = i
addr == 16'h245 ? 16'h0600 :  // <0032> b = 0
addr == 16'h246 ? 16'he007 :  // <0032> br eq :end_562
addr == 16'h247 ? 16'h0250 :  // <0032> "


addr == 16'h248 ? 16'h0002 :  // <0032> a = i
addr == 16'h249 ? 16'h0760 :  // <0032> b = -1
addr == 16'h24a ? 16'hc800 :  // <0032> i = a+b
addr == 16'h24b ? 16'h0b00 :  // <0032> "


addr == 16'h24c ? 16'h0002 :  // <0032> a = i
addr == 16'h24d ? 16'h0600 :  // <0032> b = 0
addr == 16'h24e ? 16'he405 :  // <0032> bn lt :loop_562
addr == 16'h24f ? 16'h0233 :  // <0032> "

// :end_562 // = 0x0250
addr == 16'h250 ? 16'h0008 :  // <0033> pop a // pop a

addr == 16'h251 ? 16'h0000 :  // <0036> a = a
addr == 16'h252 ? 16'h060d :  // <0036> b = 13


addr == 16'h253 ? 16'he407 :  // <0036> bn eq :else_595
addr == 16'h254 ? 16'h0258 :  // <0036> "

addr == 16'h255 ? 16'hfba0 :  // <0036> call :parse_command
addr == 16'h256 ? 16'h025f :  // <0036> "
addr == 16'h257 ? 16'hfc00 :  // <0036> "


// :else_595 // = 0x0258

// :end_595 // = 0x0258

addr == 16'h258 ? 16'hf808 :  // <0037> pop rtna // end_func
addr == 16'h259 ? 16'h1408 :  // <0037> pop y // "
addr == 16'h25a ? 16'h1008 :  // <0037> pop x // "
addr == 16'h25b ? 16'h0808 :  // <0037> pop i // "
addr == 16'h25c ? 16'hfc00 :  // <0037> swapra = nop

// :cmd_ack_msg // = 0x025d
// "OK\x0"
addr == 16'h25d ? 16'h4b4f :  // <0040> KO
addr == 16'h25e ? 16'h0000 :  // <0040>   

// ######## func parse_command // = 0x025f
addr == 16'h25f ? 16'h2002 :  // <0042> push i // func parse_command
addr == 16'h260 ? 16'h2004 :  // <0042> push x // "
addr == 16'h261 ? 16'h2005 :  // <0042> push y // "
addr == 16'h262 ? 16'h203e :  // <0042> push rtna // "
addr == 16'h263 ? 16'h13a0 :  // <0043> x = :cmd_table
addr == 16'h264 ? 16'h020d :  // <0043> "
// :next_cmd // = 0x0265
addr == 16'h265 ? 16'hd004 :  // <0045> fetch a from x
addr == 16'h266 ? 16'h03b0 :  // <0045> "
addr == 16'h267 ? 16'he000 :  // <0046> br az :done
addr == 16'h268 ? 16'h02a0 :  // <0046> "

addr == 16'h269 ? 16'h0a00 :  // <0062> i = 0
// :loop_617 // = 0x026a

addr == 16'h26a ? 16'h0002 :  // <0062> a = i
addr == 16'h26b ? 16'hfba0 :  // <0062> call :fetch_byte
addr == 16'h26c ? 16'h01cc :  // <0062> "
addr == 16'h26d ? 16'hfc00 :  // <0062> "
addr == 16'h26e ? 16'h1400 :  // <0062> y = a
addr == 16'h26f ? 16'h0620 :  // <0062> b = 32 // asc b = " "

addr == 16'h270 ? 16'h0000 :  // <0062> a = a
addr == 16'h271 ? 16'h0401 :  // <0062> b = b


addr == 16'h272 ? 16'he007 :  // <0062> br eq :else_626
addr == 16'h273 ? 16'h0281 :  // <0062> "

addr == 16'h274 ? 16'h062a :  // <0062> b = 42 // asc b = "*"
addr == 16'h275 ? 16'he007 :  // <0062> br eq :matched
addr == 16'h276 ? 16'h0289 :  // <0062> "
// parameter character.  succeed early.
addr == 16'h277 ? 16'h0002 :  // <0062> a = i

addr == 16'h278 ? 16'h0351 :  // <0062> a = a<<1
addr == 16'h279 ? 16'h0600 :  // <0062> b = 0
addr == 16'h27a ? 16'h4e00 :  // <0062> av_ad_hi = 0
addr == 16'h27b ? 16'h5300 :  // <0062> av_ad_lo = ad0
addr == 16'h27c ? 16'h0411 :  // <0062> b = av_write_data
addr == 16'h27d ? 16'h0412 :  // <0062> b = av_read_data

addr == 16'h27e ? 16'h0005 :  // <0062> a = y
addr == 16'h27f ? 16'he407 :  // <0062> bn eq :no_match
addr == 16'h280 ? 16'h0295 :  // <0062> "


// :else_626 // = 0x0281

// :end_626 // = 0x0281



addr == 16'h281 ? 16'h0002 :  // <0062> a = i
addr == 16'h282 ? 16'h0601 :  // <0062> b = 1
addr == 16'h283 ? 16'hc800 :  // <0062> i = a+b
addr == 16'h284 ? 16'h0b00 :  // <0062> "


addr == 16'h285 ? 16'h0002 :  // <0062> a = i
addr == 16'h286 ? 16'h0607 :  // <0062> b = $key_buf_max
addr == 16'h287 ? 16'he005 :  // <0062> br lt :loop_617
addr == 16'h288 ? 16'h026a :  // <0062> "

// :end_617 // = 0x0289

// at this point we have a match on the record beginning at x.
// :matched // = 0x0289
addr == 16'h289 ? 16'h03a0 :  // <0066> a = :cmd_ack_msg
addr == 16'h28a ? 16'h025d :  // <0066> "
addr == 16'h28b ? 16'hfba0 :  // <0067> call :set_text_flag
addr == 16'h28c ? 16'h0780 :  // <0067> "
addr == 16'h28d ? 16'hfc00 :  // <0067> "
addr == 16'h28e ? 16'h1604 :  // <0068> y = ($key_buf_len / 2)
addr == 16'h28f ? 16'hc800 :  // <0069> fetch rtna from x+y
addr == 16'h290 ? 16'hd320 :  // <0069> "
addr == 16'h291 ? 16'hfbb0 :  // <0069> "
addr == 16'h292 ? 16'hfc00 :  // <0070> swapra = nop
addr == 16'h293 ? 16'he00f :  // <0071> jmp :done
addr == 16'h294 ? 16'h02a0 :  // <0071> "

// :no_match // = 0x0295
// if ram_terminal_connected is still 0, quit searching after the very first command in the table.
addr == 16'h295 ? 16'h4e00 :  // <0075> ram a = $ram_terminal_connected // av_ad_hi = 0
addr == 16'h296 ? 16'h5296 :  // <0075> ram a = $ram_terminal_connected // av_ad_lo = 150
addr == 16'h297 ? 16'h0011 :  // <0075> ram a = $ram_terminal_connected // a = av_write_data // start read cycle
addr == 16'h298 ? 16'h0012 :  // <0075> ram a = $ram_terminal_connected // a = av_read_data // finish read cycle
addr == 16'h299 ? 16'he000 :  // <0076> br az :done
addr == 16'h29a ? 16'h02a0 :  // <0076> "

addr == 16'h29b ? 16'h1605 :  // <0078> y = (($key_buf_len / 2) + 1)
addr == 16'h29c ? 16'hc800 :  // <0079> x = x+y
addr == 16'h29d ? 16'h1320 :  // <0079> "
addr == 16'h29e ? 16'he00f :  // <0080> jmp :next_cmd
addr == 16'h29f ? 16'h0265 :  // <0080> "
// :done // = 0x02a0
addr == 16'h2a0 ? 16'hf808 :  // <0082> pop rtna // end_func
addr == 16'h2a1 ? 16'h1408 :  // <0082> pop y // "
addr == 16'h2a2 ? 16'h1008 :  // <0082> pop x // "
addr == 16'h2a3 ? 16'h0808 :  // <0082> pop i // "
addr == 16'h2a4 ? 16'hfc00 :  // <0082> swapra = nop

// ######## func hello_cmd // = 0x02a5
addr == 16'h2a5 ? 16'h4e00 :  // <0085> ram $ram_terminal_connected = 1 // av_ad_hi = 0
addr == 16'h2a6 ? 16'h5296 :  // <0085> ram $ram_terminal_connected = 1 // av_ad_lo = 150
addr == 16'h2a7 ? 16'h4601 :  // <0085> ram $ram_terminal_connected = 1 // av_write_data = 1
addr == 16'h2a8 ? 16'hfc00 :  // <0086> swapra = nop

// ######## func set_plan_stop_cmd // = 0x02a9
addr == 16'h2a9 ? 16'h203e :  // <0088> push rtna // func set_plan_stop_cmd
addr == 16'h2aa ? 16'h4e00 :  // <0089> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h2ab ? 16'h5290 :  // <0089> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h2ac ? 16'hf811 :  // <0089> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h2ad ? 16'hf812 :  // <0089> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h2ae ? 16'hfc00 :  // <0090> swapra = nop
addr == 16'h2af ? 16'hfba0 :  // <0091> call :init_plan_stop
addr == 16'h2b0 ? 16'h02e2 :  // <0091> "
addr == 16'h2b1 ? 16'hfc00 :  // <0091> "
addr == 16'h2b2 ? 16'hf808 :  // <0092> pop rtna // end_func
addr == 16'h2b3 ? 16'hfc00 :  // <0092> swapra = nop

// ######## func set_plan_crank_cmd // = 0x02b4
addr == 16'h2b4 ? 16'h203e :  // <0094> push rtna // func set_plan_crank_cmd
addr == 16'h2b5 ? 16'h4e00 :  // <0095> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h2b6 ? 16'h5290 :  // <0095> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h2b7 ? 16'hf811 :  // <0095> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h2b8 ? 16'hf812 :  // <0095> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h2b9 ? 16'hfc00 :  // <0096> swapra = nop
addr == 16'h2ba ? 16'hfba0 :  // <0097> call :init_plan_crank
addr == 16'h2bb ? 16'h0321 :  // <0097> "
addr == 16'h2bc ? 16'hfc00 :  // <0097> "
addr == 16'h2bd ? 16'hf808 :  // <0098> pop rtna // end_func
addr == 16'h2be ? 16'hfc00 :  // <0098> swapra = nop

// ######## func set_plan_warmup_cmd // = 0x02bf
addr == 16'h2bf ? 16'h203e :  // <0100> push rtna // func set_plan_warmup_cmd
addr == 16'h2c0 ? 16'h4e00 :  // <0101> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h2c1 ? 16'h5290 :  // <0101> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h2c2 ? 16'hf811 :  // <0101> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h2c3 ? 16'hf812 :  // <0101> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h2c4 ? 16'hfc00 :  // <0102> swapra = nop
addr == 16'h2c5 ? 16'hfba0 :  // <0103> call :init_plan_warmup
addr == 16'h2c6 ? 16'h0386 :  // <0103> "
addr == 16'h2c7 ? 16'hfc00 :  // <0103> "
addr == 16'h2c8 ? 16'hf808 :  // <0104> pop rtna // end_func
addr == 16'h2c9 ? 16'hfc00 :  // <0104> swapra = nop

// ######## func set_plan_run_cmd // = 0x02ca
addr == 16'h2ca ? 16'h203e :  // <0106> push rtna // func set_plan_run_cmd
addr == 16'h2cb ? 16'h4e00 :  // <0107> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h2cc ? 16'h5290 :  // <0107> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h2cd ? 16'hf811 :  // <0107> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h2ce ? 16'hf812 :  // <0107> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h2cf ? 16'hfc00 :  // <0108> swapra = nop
addr == 16'h2d0 ? 16'hfba0 :  // <0109> call :init_plan_run
addr == 16'h2d1 ? 16'h03e9 :  // <0109> "
addr == 16'h2d2 ? 16'hfc00 :  // <0109> "
addr == 16'h2d3 ? 16'hf808 :  // <0110> pop rtna // end_func
addr == 16'h2d4 ? 16'hfc00 :  // <0110> swapra = nop

// ######## func set_plan_learn_cmd // = 0x02d5
addr == 16'h2d5 ? 16'h203e :  // <0112> push rtna // func set_plan_learn_cmd
addr == 16'h2d6 ? 16'h4e00 :  // <0113> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h2d7 ? 16'h5290 :  // <0113> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h2d8 ? 16'hf811 :  // <0113> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h2d9 ? 16'hf812 :  // <0113> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h2da ? 16'hfc00 :  // <0114> swapra = nop
addr == 16'h2db ? 16'hfba0 :  // <0115> call :init_plan_learn_stoich
addr == 16'h2dc ? 16'h044c :  // <0115> "
addr == 16'h2dd ? 16'hfc00 :  // <0115> "
addr == 16'h2de ? 16'hf808 :  // <0116> pop rtna // end_func
addr == 16'h2df ? 16'hfc00 :  // <0116> swapra = nop


// :plan_name_stop // = 0x02e0
// "STP\x0"
addr == 16'h2e0 ? 16'h5453 :  // <0002> TS
addr == 16'h2e1 ? 16'h0050 :  // <0002>  P

// ######## func init_plan_stop // = 0x02e2
addr == 16'h2e2 ? 16'h203e :  // <0004> push rtna // func init_plan_stop
// set up the stop plan.
addr == 16'h2e3 ? 16'hfba0 :  // <0006> call :clear_ign_history
addr == 16'h2e4 ? 16'h0508 :  // <0006> "
addr == 16'h2e5 ? 16'hfc00 :  // <0006> "
// set noise filter to measure RPM between 50 and 1160 to indicate cranking.
addr == 16'h2e6 ? 16'h4e00 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_hi = 0
addr == 16'h2e7 ? 16'h5284 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_lo = 132
addr == 16'h2e8 ? 16'h47a0 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_write_data = 603
addr == 16'h2e9 ? 16'h025b :  // <0008> "
addr == 16'h2ea ? 16'h4e00 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h2eb ? 16'h5286 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 134
addr == 16'h2ec ? 16'h47a0 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h2ed ? 16'h36b0 :  // <0009> "
addr == 16'h2ee ? 16'h73a0 :  // <0010> ign_timeout_len_jf = ([rpm_to_jf 50])
addr == 16'h2ef ? 16'h36b0 :  // <0010> "
// normally puff length is not touched by an init func.
// this one does it because it's part of the program boot,
// and also a good idea whenever stopping the engine.
// this might interrupt a puff in mid-pulse, but no matter in this case.
addr == 16'h2f0 ? 16'h4e00 :  // <0015> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h2f1 ? 16'h5292 :  // <0015> ram $ram_next_puff_len_us = 0 // av_ad_lo = 146
addr == 16'h2f2 ? 16'h4600 :  // <0015> ram $ram_next_puff_len_us = 0 // av_write_data = 0
addr == 16'h2f3 ? 16'h7600 :  // <0016> puff_len_us = 0

// memorize state.
addr == 16'h2f4 ? 16'h4e00 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_ad_hi = 0
addr == 16'h2f5 ? 16'h528a :  // <0019> ram $ram_plan_name = :plan_name_stop // av_ad_lo = 138
addr == 16'h2f6 ? 16'h47a0 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_write_data = :plan_name_stop
addr == 16'h2f7 ? 16'h02e0 :  // <0019> "
addr == 16'h2f8 ? 16'h4e00 :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_ad_hi = 0
addr == 16'h2f9 ? 16'h528c :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_ad_lo = 140
addr == 16'h2fa ? 16'h47a0 :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_write_data = :puff_len_stop
addr == 16'h2fb ? 16'h0307 :  // <0020> "
addr == 16'h2fc ? 16'h4e00 :  // <0021> ram $ram_transition_func = :leave_stop // av_ad_hi = 0
addr == 16'h2fd ? 16'h528e :  // <0021> ram $ram_transition_func = :leave_stop // av_ad_lo = 142
addr == 16'h2fe ? 16'h47a0 :  // <0021> ram $ram_transition_func = :leave_stop // av_write_data = :leave_stop
addr == 16'h2ff ? 16'h030b :  // <0021> "
addr == 16'h300 ? 16'h4e00 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_hi = 0
addr == 16'h301 ? 16'h5290 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_lo = 144
addr == 16'h302 ? 16'h47a0 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_write_data = :destroy_plan_stop
addr == 16'h303 ? 16'h0306 :  // <0022> "
addr == 16'h304 ? 16'hf808 :  // <0023> pop rtna // end_func
addr == 16'h305 ? 16'hfc00 :  // <0023> swapra = nop

// ######## func destroy_plan_stop // = 0x0306
addr == 16'h306 ? 16'hfc00 :  // <0026> swapra = nop

// ######## func puff_len_stop // = 0x0307
addr == 16'h307 ? 16'h4e00 :  // <0029> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h308 ? 16'h5292 :  // <0029> ram $ram_next_puff_len_us = 0 // av_ad_lo = 146
addr == 16'h309 ? 16'h4600 :  // <0029> ram $ram_next_puff_len_us = 0 // av_write_data = 0
addr == 16'h30a ? 16'hfc00 :  // <0030> swapra = nop

// ######## func leave_stop // = 0x030b
addr == 16'h30b ? 16'h203e :  // <0032> push rtna // func leave_stop
// leave stop plan if ignition switch is turned on AND more than half if the ignition history is valid.
// requiring both conditions prevents spurious noise readings from starting up the injection.
addr == 16'h30c ? 16'h001a :  // <0035> a = power_duty
addr == 16'h30d ? 16'h0680 :  // <0036> b = $ign_switch_off_mask
addr == 16'h30e ? 16'he403 :  // <0037> bn and0z :stay
addr == 16'h30f ? 16'h031d :  // <0037> "
addr == 16'h310 ? 16'h4e00 :  // <0038> ram a = $ram_ign_bad_samples // av_ad_hi = 0
addr == 16'h311 ? 16'h5282 :  // <0038> ram a = $ram_ign_bad_samples // av_ad_lo = 130
addr == 16'h312 ? 16'h0011 :  // <0038> ram a = $ram_ign_bad_samples // a = av_write_data // start read cycle
addr == 16'h313 ? 16'h0012 :  // <0038> ram a = $ram_ign_bad_samples // a = av_read_data // finish read cycle
addr == 16'h314 ? 16'h0608 :  // <0039> b = ($ign_history_len / 2)
addr == 16'h315 ? 16'he006 :  // <0040> br gt :stay
addr == 16'h316 ? 16'h031d :  // <0040> "
addr == 16'h317 ? 16'hfba0 :  // <0041> call :destroy_plan_stop
addr == 16'h318 ? 16'h0306 :  // <0041> "
addr == 16'h319 ? 16'hfc00 :  // <0041> "
addr == 16'h31a ? 16'hfba0 :  // <0042> call :init_plan_crank
addr == 16'h31b ? 16'h0321 :  // <0042> "
addr == 16'h31c ? 16'hfc00 :  // <0042> "
// :stay // = 0x031d
addr == 16'h31d ? 16'hf808 :  // <0044> pop rtna // end_func
addr == 16'h31e ? 16'hfc00 :  // <0044> swapra = nop



// escalating puff length by 1500 us per puff while cranking slowly at e.g. 80 RPM
// on a frozen winter morning will ramp up from 5000 to 20000 us length in about 7 seconds.

// :plan_name_crank // = 0x031f
// "CR\x0"
addr == 16'h31f ? 16'h5243 :  // <0011> RC
addr == 16'h320 ? 16'h0000 :  // <0011>   

// ######## func init_plan_crank // = 0x0321
addr == 16'h321 ? 16'h203e :  // <0013> push rtna // func init_plan_crank
// set up the crank plan.
addr == 16'h322 ? 16'h4e00 :  // <0015> ram $ram_puff_count = 0 // av_ad_hi = 0
addr == 16'h323 ? 16'h5294 :  // <0015> ram $ram_puff_count = 0 // av_ad_lo = 148
addr == 16'h324 ? 16'h4600 :  // <0015> ram $ram_puff_count = 0 // av_write_data = 0
// set noise filter to measure RPM between 50 and 8000 to indicate running.
addr == 16'h325 ? 16'h4e00 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_ad_hi = 0
addr == 16'h326 ? 16'h5284 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_ad_lo = 132
addr == 16'h327 ? 16'h4657 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_write_data = 87
addr == 16'h328 ? 16'h4e00 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h329 ? 16'h5286 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 134
addr == 16'h32a ? 16'h47a0 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h32b ? 16'h36b0 :  // <0018> "
addr == 16'h32c ? 16'h73a0 :  // <0019> ign_timeout_len_jf = ([rpm_to_jf 50])
addr == 16'h32d ? 16'h36b0 :  // <0019> "
// normally puff length is not touched by an init func.
// this one does it because it's the beginning of a crank cycle, and puff length
// should be enabled for the first puff.  otherwise the first puff would be missed.
addr == 16'h32e ? 16'h4e00 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_hi = 0
addr == 16'h32f ? 16'h5292 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_lo = 146
addr == 16'h330 ? 16'h47a0 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_write_data = 5000
addr == 16'h331 ? 16'h1388 :  // <0023> "
addr == 16'h332 ? 16'h77a0 :  // <0024> puff_len_us = $crank_min_puff_len_us
addr == 16'h333 ? 16'h1388 :  // <0024> "
// clear ignition history again to eliminate samples where the motor kept spinning after switching from plan_run to plan_stop.
addr == 16'h334 ? 16'hfba0 :  // <0026> call :clear_ign_history
addr == 16'h335 ? 16'h0508 :  // <0026> "
addr == 16'h336 ? 16'hfc00 :  // <0026> "

// memorize state.
addr == 16'h337 ? 16'h4e00 :  // <0029> ram $ram_plan_name = :plan_name_crank // av_ad_hi = 0
addr == 16'h338 ? 16'h528a :  // <0029> ram $ram_plan_name = :plan_name_crank // av_ad_lo = 138
addr == 16'h339 ? 16'h47a0 :  // <0029> ram $ram_plan_name = :plan_name_crank // av_write_data = :plan_name_crank
addr == 16'h33a ? 16'h031f :  // <0029> "
addr == 16'h33b ? 16'h4e00 :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_ad_hi = 0
addr == 16'h33c ? 16'h528c :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_ad_lo = 140
addr == 16'h33d ? 16'h47a0 :  // <0030> ram $ram_puff_len_func = :puff_len_crank // av_write_data = :puff_len_crank
addr == 16'h33e ? 16'h034a :  // <0030> "
addr == 16'h33f ? 16'h4e00 :  // <0031> ram $ram_transition_func = :leave_crank // av_ad_hi = 0
addr == 16'h340 ? 16'h528e :  // <0031> ram $ram_transition_func = :leave_crank // av_ad_lo = 142
addr == 16'h341 ? 16'h47a0 :  // <0031> ram $ram_transition_func = :leave_crank // av_write_data = :leave_crank
addr == 16'h342 ? 16'h0368 :  // <0031> "
addr == 16'h343 ? 16'h4e00 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_hi = 0
addr == 16'h344 ? 16'h5290 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_lo = 144
addr == 16'h345 ? 16'h47a0 :  // <0032> ram $ram_destroy_plan_func = :destroy_plan_crank // av_write_data = :destroy_plan_crank
addr == 16'h346 ? 16'h0349 :  // <0032> "
addr == 16'h347 ? 16'hf808 :  // <0033> pop rtna // end_func
addr == 16'h348 ? 16'hfc00 :  // <0033> swapra = nop

// ######## func destroy_plan_crank // = 0x0349
addr == 16'h349 ? 16'hfc00 :  // <0036> swapra = nop

// ######## func puff_len_crank // = 0x034a
addr == 16'h34a ? 16'h203e :  // <0038> push rtna // func puff_len_crank
addr == 16'h34b ? 16'h4e00 :  // <0039> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h34c ? 16'h5294 :  // <0039> ram a = $ram_puff_count // av_ad_lo = 148
addr == 16'h34d ? 16'h0011 :  // <0039> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h34e ? 16'h0012 :  // <0039> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h34f ? 16'h060a :  // <0040> b = $crank_max_puffs
addr == 16'h350 ? 16'he006 :  // <0041> br gt :puff_limit
addr == 16'h351 ? 16'h035f :  // <0041> "
// linear escalation from min to max puff length, at a slope of crank_incr_us_per_puff.
addr == 16'h352 ? 16'h07a0 :  // <0043> b = $crank_incr_us_per_puff
addr == 16'h353 ? 16'h05dc :  // <0043> "
addr == 16'h354 ? 16'hfba0 :  // <0044> call :multiply
addr == 16'h355 ? 16'h0160 :  // <0044> "
addr == 16'h356 ? 16'hfc00 :  // <0044> "
addr == 16'h357 ? 16'h07a0 :  // <0045> b = $crank_min_puff_len_us
addr == 16'h358 ? 16'h1388 :  // <0045> "
addr == 16'h359 ? 16'h4e00 :  // <0046> ram $ram_next_puff_len_us = a+b // av_ad_hi = 0
addr == 16'h35a ? 16'h5292 :  // <0046> ram $ram_next_puff_len_us = a+b // av_ad_lo = 146
addr == 16'h35b ? 16'hc800 :  // <0046> ram $ram_next_puff_len_us = a+b // av_write_data = a+b
addr == 16'h35c ? 16'h4700 :  // <0046> "
addr == 16'h35d ? 16'he00f :  // <0047> jmp :done
addr == 16'h35e ? 16'h0366 :  // <0047> "
// :puff_limit // = 0x035f
// prevent the puff counter from going higher & eventually rolling over.
addr == 16'h35f ? 16'h4e00 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_ad_hi = 0
addr == 16'h360 ? 16'h5294 :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_ad_lo = 148
addr == 16'h361 ? 16'h460a :  // <0050> ram $ram_puff_count = $crank_max_puffs // av_write_data = 10
// accept max puff len.
addr == 16'h362 ? 16'h4e00 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_hi = 0
addr == 16'h363 ? 16'h5292 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_lo = 146
addr == 16'h364 ? 16'h47a0 :  // <0052> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_write_data = 20000
addr == 16'h365 ? 16'h4e20 :  // <0052> "
// :done // = 0x0366
addr == 16'h366 ? 16'hf808 :  // <0054> pop rtna // end_func
addr == 16'h367 ? 16'hfc00 :  // <0054> swapra = nop

// ######## func leave_crank // = 0x0368
addr == 16'h368 ? 16'h203e :  // <0056> push rtna // func leave_crank
addr == 16'h369 ? 16'hfba0 :  // <0057> call :check_engine_stop
addr == 16'h36a ? 16'h07e4 :  // <0057> "
addr == 16'h36b ? 16'hfc00 :  // <0057> "
addr == 16'h36c ? 16'he400 :  // <0058> bn az :done
addr == 16'h36d ? 16'h0382 :  // <0058> "

// transition to warmup if RPM exceeds crank_success_rpm.
addr == 16'h36e ? 16'h4e00 :  // <0061> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h36f ? 16'h5280 :  // <0061> ram a = $ram_rpm_valid // av_ad_lo = 128
addr == 16'h370 ? 16'h0011 :  // <0061> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h371 ? 16'h0012 :  // <0061> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle
addr == 16'h372 ? 16'he000 :  // <0062> br az :stay
addr == 16'h373 ? 16'h0382 :  // <0062> "
addr == 16'h374 ? 16'h4e00 :  // <0063> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h375 ? 16'h527e :  // <0063> ram a = $ram_avg_rpm // av_ad_lo = 126
addr == 16'h376 ? 16'h0011 :  // <0063> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h377 ? 16'h0012 :  // <0063> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle
addr == 16'h378 ? 16'h07a0 :  // <0064> b = $crank_success_rpm
addr == 16'h379 ? 16'h0320 :  // <0064> "
addr == 16'h37a ? 16'he005 :  // <0065> br lt :stay
addr == 16'h37b ? 16'h0382 :  // <0065> "
addr == 16'h37c ? 16'hfba0 :  // <0066> call :destroy_plan_crank
addr == 16'h37d ? 16'h0349 :  // <0066> "
addr == 16'h37e ? 16'hfc00 :  // <0066> "
addr == 16'h37f ? 16'hfba0 :  // <0067> call :init_plan_warmup
addr == 16'h380 ? 16'h0386 :  // <0067> "
addr == 16'h381 ? 16'hfc00 :  // <0067> "
// :stay // = 0x0382

// :done // = 0x0382
addr == 16'h382 ? 16'hf808 :  // <0071> pop rtna // end_func
addr == 16'h383 ? 16'hfc00 :  // <0071> swapra = nop



// 0x4c0 = 1216 = 120 degF at the sensor location outside the engine block.
// 750 = 0 degF.
// max 6000 & min 4500 over a temp range 750 to 0x4c0 gives 6900 us puff at 74 deg F.  program rev 594.
// this is used if the engine temp is unavailable.

// :plan_name_warmup // = 0x0384
// "WM\x0"
addr == 16'h384 ? 16'h4d57 :  // <0014> MW
addr == 16'h385 ? 16'h0000 :  // <0014>   

// ######## func init_plan_warmup // = 0x0386
// set up the warmup plan.

// memorize state.
addr == 16'h386 ? 16'h4e00 :  // <0020> ram $ram_plan_name = :plan_name_warmup // av_ad_hi = 0
addr == 16'h387 ? 16'h528a :  // <0020> ram $ram_plan_name = :plan_name_warmup // av_ad_lo = 138
addr == 16'h388 ? 16'h47a0 :  // <0020> ram $ram_plan_name = :plan_name_warmup // av_write_data = :plan_name_warmup
addr == 16'h389 ? 16'h0384 :  // <0020> "
addr == 16'h38a ? 16'h4e00 :  // <0021> ram $ram_puff_len_func = :puff_len_warmup // av_ad_hi = 0
addr == 16'h38b ? 16'h528c :  // <0021> ram $ram_puff_len_func = :puff_len_warmup // av_ad_lo = 140
addr == 16'h38c ? 16'h47a0 :  // <0021> ram $ram_puff_len_func = :puff_len_warmup // av_write_data = :puff_len_warmup
addr == 16'h38d ? 16'h0398 :  // <0021> "
addr == 16'h38e ? 16'h4e00 :  // <0022> ram $ram_transition_func = :leave_warmup // av_ad_hi = 0
addr == 16'h38f ? 16'h528e :  // <0022> ram $ram_transition_func = :leave_warmup // av_ad_lo = 142
addr == 16'h390 ? 16'h47a0 :  // <0022> ram $ram_transition_func = :leave_warmup // av_write_data = :leave_warmup
addr == 16'h391 ? 16'h03ca :  // <0022> "
addr == 16'h392 ? 16'h4e00 :  // <0023> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_ad_hi = 0
addr == 16'h393 ? 16'h5290 :  // <0023> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_ad_lo = 144
addr == 16'h394 ? 16'h47a0 :  // <0023> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_write_data = :destroy_plan_warmup
addr == 16'h395 ? 16'h0397 :  // <0023> "
addr == 16'h396 ? 16'hfc00 :  // <0024> swapra = nop

// ######## func destroy_plan_warmup // = 0x0397
addr == 16'h397 ? 16'hfc00 :  // <0027> swapra = nop

// ######## func puff_len_warmup // = 0x0398
addr == 16'h398 ? 16'h2004 :  // <0029> push x // func puff_len_warmup
addr == 16'h399 ? 16'h203e :  // <0029> push rtna // "
// x = enrichment us.
addr == 16'h39a ? 16'h13a0 :  // <0031> x = $warmup_limping_enrichment_us
addr == 16'h39b ? 16'h07d0 :  // <0031> "

// check engine block temp sensor.  if valid, enrich by a linear function:
// {warmup_min_temp_adc...warmup_success_temp_adc} -> {$warmup_max_enrichment_us...0}
addr == 16'h39c ? 16'h0202 :  // <0035> a = $anmux_engine_block_temp

addr == 16'h39d ? 16'h0351 :  // <0036> a = a<<1
addr == 16'h39e ? 16'h0618 :  // <0036> b = 24
addr == 16'h39f ? 16'h4e00 :  // <0036> av_ad_hi = 0
addr == 16'h3a0 ? 16'h5300 :  // <0036> av_ad_lo = ad0
addr == 16'h3a1 ? 16'h0411 :  // <0036> b = av_write_data
addr == 16'h3a2 ? 16'h0412 :  // <0036> b = av_read_data

// b = sensor reading in adc counts.
addr == 16'h3a3 ? 16'h03a0 :  // <0038> a = $temp_ceiling_adc
addr == 16'h3a4 ? 16'h0ff0 :  // <0038> "
addr == 16'h3a5 ? 16'he005 :  // <0039> br lt :temp_invalid
addr == 16'h3a6 ? 16'h03c0 :  // <0039> "
addr == 16'h3a7 ? 16'h03a0 :  // <0040> a = $warmup_success_temp_adc
addr == 16'h3a8 ? 16'h04c0 :  // <0040> "
addr == 16'h3a9 ? 16'he005 :  // <0041> br lt :too_warm
addr == 16'h3aa ? 16'h03c0 :  // <0041> "
addr == 16'h3ab ? 16'h03a0 :  // <0042> a = $warmup_min_temp_adc
addr == 16'h3ac ? 16'h02ee :  // <0042> "
addr == 16'h3ad ? 16'he005 :  // <0043> br lt :in_range
addr == 16'h3ae ? 16'h03b1 :  // <0043> "
addr == 16'h3af ? 16'h07a0 :  // <0044> b = $warmup_min_temp_adc
addr == 16'h3b0 ? 16'h02ee :  // <0044> "
// :in_range // = 0x03b1
// negate the sensor reading so as to subtract it from warmup_success_temp_adc.
addr == 16'h3b1 ? 16'h0360 :  // <0047> a = 0xffff
addr == 16'h3b2 ? 16'hc800 :  // <0048> b = xor
addr == 16'h3b3 ? 16'h0738 :  // <0048> "
addr == 16'h3b4 ? 16'h0201 :  // <0049> a = 1
addr == 16'h3b5 ? 16'hc800 :  // <0050> b = a+b
addr == 16'h3b6 ? 16'h0700 :  // <0050> "
addr == 16'h3b7 ? 16'h03a0 :  // <0051> a = $warmup_success_temp_adc
addr == 16'h3b8 ? 16'h04c0 :  // <0051> "
addr == 16'h3b9 ? 16'hc800 :  // <0052> b = a+b
addr == 16'h3ba ? 16'h0700 :  // <0052> "
// b = how many counts "cold" we are.  multiply that by the slope warmup_us_per_cold_adc.
addr == 16'h3bb ? 16'h020c :  // <0054> a = $warmup_us_per_cold_adc
addr == 16'h3bc ? 16'hfba0 :  // <0055> call :multiply
addr == 16'h3bd ? 16'h0160 :  // <0055> "
addr == 16'h3be ? 16'hfc00 :  // <0055> "
addr == 16'h3bf ? 16'h1000 :  // <0056> x = a
// :too_warm // = 0x03c0
// :temp_invalid // = 0x03c0

// apply total of base amount and enrichment.
// $warmup_min_puff_len_us <= total <= ($warmup_min_puff_len_us + $warmup_max_enrichment_us)
addr == 16'h3c0 ? 16'h03a0 :  // <0062> a = $warmup_min_puff_len_us
addr == 16'h3c1 ? 16'h1194 :  // <0062> "
addr == 16'h3c2 ? 16'h0404 :  // <0063> b = x
addr == 16'h3c3 ? 16'h4e00 :  // <0064> ram $ram_next_puff_len_us = a+b // av_ad_hi = 0
addr == 16'h3c4 ? 16'h5292 :  // <0064> ram $ram_next_puff_len_us = a+b // av_ad_lo = 146
addr == 16'h3c5 ? 16'hc800 :  // <0064> ram $ram_next_puff_len_us = a+b // av_write_data = a+b
addr == 16'h3c6 ? 16'h4700 :  // <0064> "
addr == 16'h3c7 ? 16'hf808 :  // <0065> pop rtna // end_func
addr == 16'h3c8 ? 16'h1008 :  // <0065> pop x // "
addr == 16'h3c9 ? 16'hfc00 :  // <0065> swapra = nop

// ######## func leave_warmup // = 0x03ca
addr == 16'h3ca ? 16'h203e :  // <0067> push rtna // func leave_warmup
addr == 16'h3cb ? 16'hfba0 :  // <0068> call :check_engine_stop
addr == 16'h3cc ? 16'h07e4 :  // <0068> "
addr == 16'h3cd ? 16'hfc00 :  // <0068> "
addr == 16'h3ce ? 16'he400 :  // <0069> bn az :done
addr == 16'h3cf ? 16'h03e5 :  // <0069> "

// transition to plan_run if engine block temp sensor is valid, and temp
// exceeds warmup_success_temp_adc.
addr == 16'h3d0 ? 16'h0202 :  // <0073> a = $anmux_engine_block_temp

addr == 16'h3d1 ? 16'h0351 :  // <0074> a = a<<1
addr == 16'h3d2 ? 16'h0618 :  // <0074> b = 24
addr == 16'h3d3 ? 16'h4e00 :  // <0074> av_ad_hi = 0
addr == 16'h3d4 ? 16'h5300 :  // <0074> av_ad_lo = ad0
addr == 16'h3d5 ? 16'h0411 :  // <0074> b = av_write_data
addr == 16'h3d6 ? 16'h0412 :  // <0074> b = av_read_data

addr == 16'h3d7 ? 16'h03a0 :  // <0075> a = $temp_ceiling_adc
addr == 16'h3d8 ? 16'h0ff0 :  // <0075> "
addr == 16'h3d9 ? 16'he005 :  // <0076> br lt :stay
addr == 16'h3da ? 16'h03e5 :  // <0076> "
addr == 16'h3db ? 16'h03a0 :  // <0077> a = $warmup_success_temp_adc
addr == 16'h3dc ? 16'h04c0 :  // <0077> "
addr == 16'h3dd ? 16'he006 :  // <0078> br gt :stay
addr == 16'h3de ? 16'h03e5 :  // <0078> "
addr == 16'h3df ? 16'hfba0 :  // <0079> call :destroy_plan_warmup
addr == 16'h3e0 ? 16'h0397 :  // <0079> "
addr == 16'h3e1 ? 16'hfc00 :  // <0079> "
addr == 16'h3e2 ? 16'hfba0 :  // <0080> call :init_plan_run
addr == 16'h3e3 ? 16'h03e9 :  // <0080> "
addr == 16'h3e4 ? 16'hfc00 :  // <0080> "
// :stay // = 0x03e5

// :done // = 0x03e5
addr == 16'h3e5 ? 16'hf808 :  // <0084> pop rtna // end_func
addr == 16'h3e6 ? 16'hfc00 :  // <0084> swapra = nop


// :plan_name_run // = 0x03e7
// "RN\x0"
addr == 16'h3e7 ? 16'h4e52 :  // <0002> NR
addr == 16'h3e8 ? 16'h0000 :  // <0002>   

// trim puff length by o2 sensor every 200 ms.

// trim puff length as needed, by about 1000 us per second.



// ######## func init_plan_run // = 0x03e9
// set up the run plan.

// memorize state.
addr == 16'h3e9 ? 16'h4e00 :  // <0021> ram $ram_plan_name = :plan_name_run // av_ad_hi = 0
addr == 16'h3ea ? 16'h528a :  // <0021> ram $ram_plan_name = :plan_name_run // av_ad_lo = 138
addr == 16'h3eb ? 16'h47a0 :  // <0021> ram $ram_plan_name = :plan_name_run // av_write_data = :plan_name_run
addr == 16'h3ec ? 16'h03e7 :  // <0021> "
addr == 16'h3ed ? 16'h4e00 :  // <0022> ram $ram_puff_len_func = :puff_len_run // av_ad_hi = 0
addr == 16'h3ee ? 16'h528c :  // <0022> ram $ram_puff_len_func = :puff_len_run // av_ad_lo = 140
addr == 16'h3ef ? 16'h47a0 :  // <0022> ram $ram_puff_len_func = :puff_len_run // av_write_data = :puff_len_run
addr == 16'h3f0 ? 16'h03fb :  // <0022> "
addr == 16'h3f1 ? 16'h4e00 :  // <0023> ram $ram_transition_func = :leave_run // av_ad_hi = 0
addr == 16'h3f2 ? 16'h528e :  // <0023> ram $ram_transition_func = :leave_run // av_ad_lo = 142
addr == 16'h3f3 ? 16'h47a0 :  // <0023> ram $ram_transition_func = :leave_run // av_write_data = :leave_run
addr == 16'h3f4 ? 16'h0444 :  // <0023> "
addr == 16'h3f5 ? 16'h4e00 :  // <0024> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_hi = 0
addr == 16'h3f6 ? 16'h5290 :  // <0024> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_lo = 144
addr == 16'h3f7 ? 16'h47a0 :  // <0024> ram $ram_destroy_plan_func = :destroy_plan_run // av_write_data = :destroy_plan_run
addr == 16'h3f8 ? 16'h03fa :  // <0024> "
addr == 16'h3f9 ? 16'hfc00 :  // <0025> swapra = nop

// ######## func destroy_plan_run // = 0x03fa
addr == 16'h3fa ? 16'hfc00 :  // <0028> swapra = nop

// ######## func puff_len_run // = 0x03fb
addr == 16'h3fb ? 16'h2002 :  // <0030> push i // func puff_len_run
addr == 16'h3fc ? 16'h2003 :  // <0030> push j // "
addr == 16'h3fd ? 16'h203e :  // <0030> push rtna // "
addr == 16'h3fe ? 16'h4e00 :  // <0031> ram i = $ram_run_ticks_remain // av_ad_hi = 0
addr == 16'h3ff ? 16'h5298 :  // <0031> ram i = $ram_run_ticks_remain // av_ad_lo = 152
addr == 16'h400 ? 16'h0811 :  // <0031> ram i = $ram_run_ticks_remain // i = av_write_data // start read cycle
addr == 16'h401 ? 16'h0812 :  // <0031> ram i = $ram_run_ticks_remain // i = av_read_data // finish read cycle

addr == 16'h402 ? 16'h0002 :  // <0055> a = i
addr == 16'h403 ? 16'h0600 :  // <0055> b = 0


addr == 16'h404 ? 16'he406 :  // <0055> bn gt :else_1028
addr == 16'h405 ? 16'h040d :  // <0055> "

addr == 16'h406 ? 16'h0f60 :  // <0055> j = -1
addr == 16'h407 ? 16'h4e00 :  // <0055> ram $ram_run_ticks_remain = i+j // av_ad_hi = 0
addr == 16'h408 ? 16'h5298 :  // <0055> ram $ram_run_ticks_remain = i+j // av_ad_lo = 152
addr == 16'h409 ? 16'hc800 :  // <0055> ram $ram_run_ticks_remain = i+j // av_write_data = i+j
addr == 16'h40a ? 16'h4710 :  // <0055> "

addr == 16'h40b ? 16'he00f :  // <0055> jmp :end_1028
addr == 16'h40c ? 16'h0434 :  // <0055> "
// :else_1028 // = 0x040d

addr == 16'h40d ? 16'h4e00 :  // <0055> ram $ram_run_ticks_remain = $run_ticks_per_o2_trim // av_ad_hi = 0
addr == 16'h40e ? 16'h5298 :  // <0055> ram $ram_run_ticks_remain = $run_ticks_per_o2_trim // av_ad_lo = 152
addr == 16'h40f ? 16'h460a :  // <0055> ram $ram_run_ticks_remain = $run_ticks_per_o2_trim // av_write_data = 10

// i = old puff length, j = puff length increment.
addr == 16'h410 ? 16'h4e00 :  // <0055> ram i = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'h411 ? 16'h5292 :  // <0055> ram i = $ram_next_puff_len_us // av_ad_lo = 146
addr == 16'h412 ? 16'h0811 :  // <0055> ram i = $ram_next_puff_len_us // i = av_write_data // start read cycle
addr == 16'h413 ? 16'h0812 :  // <0055> ram i = $ram_next_puff_len_us // i = av_read_data // finish read cycle
addr == 16'h414 ? 16'h0e00 :  // <0055> j = 0
addr == 16'h415 ? 16'h0205 :  // <0055> a = $o2_adc_channel

addr == 16'h416 ? 16'h0351 :  // <0055> a = a<<1
addr == 16'h417 ? 16'h0628 :  // <0055> b = 40
addr == 16'h418 ? 16'h4e00 :  // <0055> av_ad_hi = 0
addr == 16'h419 ? 16'h5300 :  // <0055> av_ad_lo = ad0
addr == 16'h41a ? 16'h0411 :  // <0055> b = av_write_data
addr == 16'h41b ? 16'h0412 :  // <0055> b = av_read_data


addr == 16'h41c ? 16'h0001 :  // <0055> a = b
addr == 16'h41d ? 16'h07a0 :  // <0055> b = 588
addr == 16'h41e ? 16'h024c :  // <0055> "


addr == 16'h41f ? 16'he405 :  // <0055> bn lt :else_1055
addr == 16'h420 ? 16'h0429 :  // <0055> "

// sensing a lean condition.  trim up to enrich.

addr == 16'h421 ? 16'h0002 :  // <0055> a = i
addr == 16'h422 ? 16'h07a0 :  // <0055> b = 10000
addr == 16'h423 ? 16'h2710 :  // <0055> "


addr == 16'h424 ? 16'he405 :  // <0055> bn lt :else_1060
addr == 16'h425 ? 16'h0427 :  // <0055> "

addr == 16'h426 ? 16'h0ec8 :  // <0055> j = $run_puff_step_up_us


// :else_1060 // = 0x0427

// :end_1060 // = 0x0427


addr == 16'h427 ? 16'he00f :  // <0055> jmp :end_1055
addr == 16'h428 ? 16'h0430 :  // <0055> "
// :else_1055 // = 0x0429

// sensing a rich condition.  trim down to lean it out.

addr == 16'h429 ? 16'h0002 :  // <0055> a = i
addr == 16'h42a ? 16'h07a0 :  // <0055> b = 2000
addr == 16'h42b ? 16'h07d0 :  // <0055> "


addr == 16'h42c ? 16'he406 :  // <0055> bn gt :else_1068
addr == 16'h42d ? 16'h0430 :  // <0055> "

addr == 16'h42e ? 16'h0fa0 :  // <0055> j = $run_puff_step_down_us
addr == 16'h42f ? 16'hff9b :  // <0055> "


// :else_1068 // = 0x0430

// :end_1068 // = 0x0430


// :end_1055 // = 0x0430

addr == 16'h430 ? 16'h4e00 :  // <0055> ram $ram_next_puff_len_us = i+j // av_ad_hi = 0
addr == 16'h431 ? 16'h5292 :  // <0055> ram $ram_next_puff_len_us = i+j // av_ad_lo = 146
addr == 16'h432 ? 16'hc800 :  // <0055> ram $ram_next_puff_len_us = i+j // av_write_data = i+j
addr == 16'h433 ? 16'h4710 :  // <0055> "

// :end_1028 // = 0x0434


// start another o2 reading every plan tick.
addr == 16'h434 ? 16'h4e00 :  // <0058> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h435 ? 16'h5238 :  // <0058> ram a = $ram_adc_chn_pending // av_ad_lo = 56
addr == 16'h436 ? 16'h0011 :  // <0058> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h437 ? 16'h0012 :  // <0058> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle

addr == 16'h438 ? 16'h0000 :  // <0062> a = a
addr == 16'h439 ? 16'h0600 :  // <0062> b = 0


addr == 16'h43a ? 16'he407 :  // <0062> bn eq :else_1082
addr == 16'h43b ? 16'h0440 :  // <0062> "

addr == 16'h43c ? 16'h0205 :  // <0062> a = $o2_adc_channel
addr == 16'h43d ? 16'hfba0 :  // <0062> call :begin_adc_conversion
addr == 16'h43e ? 16'h0639 :  // <0062> "
addr == 16'h43f ? 16'hfc00 :  // <0062> "


// :else_1082 // = 0x0440

// :end_1082 // = 0x0440

addr == 16'h440 ? 16'hf808 :  // <0063> pop rtna // end_func
addr == 16'h441 ? 16'h0c08 :  // <0063> pop j // "
addr == 16'h442 ? 16'h0808 :  // <0063> pop i // "
addr == 16'h443 ? 16'hfc00 :  // <0063> swapra = nop

// ######## func leave_run // = 0x0444
addr == 16'h444 ? 16'h203e :  // <0065> push rtna // func leave_run
addr == 16'h445 ? 16'hfba0 :  // <0066> call :check_engine_stop
addr == 16'h446 ? 16'h07e4 :  // <0066> "
addr == 16'h447 ? 16'hfc00 :  // <0066> "
addr == 16'h448 ? 16'hf808 :  // <0067> pop rtna // end_func
addr == 16'h449 ? 16'hfc00 :  // <0067> swapra = nop


// :plan_name_learn_stoich // = 0x044a
// "LN\x0"
addr == 16'h44a ? 16'h4e4c :  // <0002> NL
addr == 16'h44b ? 16'h0000 :  // <0002>   

// ######## func init_plan_learn_stoich // = 0x044c
// set up the learn_stoich plan.

// memorize state.
addr == 16'h44c ? 16'h4e00 :  // <0008> ram $ram_plan_name = :plan_name_learn_stoich // av_ad_hi = 0
addr == 16'h44d ? 16'h528a :  // <0008> ram $ram_plan_name = :plan_name_learn_stoich // av_ad_lo = 138
addr == 16'h44e ? 16'h47a0 :  // <0008> ram $ram_plan_name = :plan_name_learn_stoich // av_write_data = :plan_name_learn_stoich
addr == 16'h44f ? 16'h044a :  // <0008> "
addr == 16'h450 ? 16'h4e00 :  // <0009> ram $ram_puff_len_func = :puff_len_learn_stoich // av_ad_hi = 0
addr == 16'h451 ? 16'h528c :  // <0009> ram $ram_puff_len_func = :puff_len_learn_stoich // av_ad_lo = 140
addr == 16'h452 ? 16'h47a0 :  // <0009> ram $ram_puff_len_func = :puff_len_learn_stoich // av_write_data = :puff_len_learn_stoich
addr == 16'h453 ? 16'h045e :  // <0009> "
addr == 16'h454 ? 16'h4e00 :  // <0010> ram $ram_transition_func = :leave_learn_stoich // av_ad_hi = 0
addr == 16'h455 ? 16'h528e :  // <0010> ram $ram_transition_func = :leave_learn_stoich // av_ad_lo = 142
addr == 16'h456 ? 16'h47a0 :  // <0010> ram $ram_transition_func = :leave_learn_stoich // av_write_data = :leave_learn_stoich
addr == 16'h457 ? 16'h045f :  // <0010> "
addr == 16'h458 ? 16'h4e00 :  // <0011> ram $ram_destroy_plan_func = :destroy_plan_learn_stoich // av_ad_hi = 0
addr == 16'h459 ? 16'h5290 :  // <0011> ram $ram_destroy_plan_func = :destroy_plan_learn_stoich // av_ad_lo = 144
addr == 16'h45a ? 16'h47a0 :  // <0011> ram $ram_destroy_plan_func = :destroy_plan_learn_stoich // av_write_data = :destroy_plan_learn_stoich
addr == 16'h45b ? 16'h045d :  // <0011> "
addr == 16'h45c ? 16'hfc00 :  // <0012> swapra = nop

// ######## func destroy_plan_learn_stoich // = 0x045d
addr == 16'h45d ? 16'hfc00 :  // <0015> swapra = nop

// ######## func puff_len_learn_stoich // = 0x045e

addr == 16'h45e ? 16'hfc00 :  // <0019> swapra = nop

// ######## func leave_learn_stoich // = 0x045f
addr == 16'h45f ? 16'h203e :  // <0021> push rtna // func leave_learn_stoich
addr == 16'h460 ? 16'hfba0 :  // <0022> call :check_engine_stop
addr == 16'h461 ? 16'h07e4 :  // <0022> "
addr == 16'h462 ? 16'hfc00 :  // <0022> "
addr == 16'h463 ? 16'hf808 :  // <0023> pop rtna // end_func
addr == 16'h464 ? 16'hfc00 :  // <0023> swapra = nop



// #########################################################################
// :main // = 0x0465
addr == 16'h465 ? 16'h03a0 :  // <0206> a = :boot_msg
addr == 16'h466 ? 16'h007b :  // <0206> "
addr == 16'h467 ? 16'hfba0 :  // <0207> call :print_nt
addr == 16'h468 ? 16'h013f :  // <0207> "
addr == 16'h469 ? 16'hfc00 :  // <0207> "

// clear the first 64k of RAM.
addr == 16'h46a ? 16'h4e00 :  // <0210> av_ad_hi = 0
addr == 16'h46b ? 16'hfba0 :  // <0211> call :clear_ram_page
addr == 16'h46c ? 16'h0778 :  // <0211> "
addr == 16'h46d ? 16'hfc00 :  // <0211> "

// init fuel injection.
addr == 16'h46e ? 16'hfba0 :  // <0214> call :init_plan_stop
addr == 16'h46f ? 16'h02e2 :  // <0214> "
addr == 16'h470 ? 16'hfc00 :  // <0214> "

// power up FTDI USB board, and init any other special board control functions.
addr == 16'h471 ? 16'h6280 :  // <0217> board_ctrl = $ftdi_power_mask
addr == 16'h472 ? 16'hfba0 :  // <0218> call :postpone_comm_restart
addr == 16'h473 ? 16'h074f :  // <0218> "
addr == 16'h474 ? 16'hfc00 :  // <0218> "

// check initial state of power management circuits.
// if power is lost or ignition switch is off already, open relay & abort run.
// that's important because then the event controller booted up too late to
// see edges on those 2 signals.  regular system would never shut itself down.
// this setup is the last thing done prior to the event handler loop.
addr == 16'h475 ? 16'h6a00 :  // <0225> power_duty = $power_duty_closing

addr == 16'h476 ? 16'h001a :  // <0229> a = power_duty
addr == 16'h477 ? 16'h06c0 :  // <0229> b = ( $power_lost_mask | $ign_switch_off_mask )


addr == 16'h478 ? 16'he003 :  // <0229> br and0z :else_1144
addr == 16'h479 ? 16'h047f :  // <0229> "

addr == 16'h47a ? 16'h6a32 :  // <0229> power_duty = $power_duty_opening
addr == 16'h47b ? 16'h5fa0 :  // <0229> error_halt_code $err_power_lost_at_boot // leds = 0xfffb
addr == 16'h47c ? 16'hfffb :  // <0229> "
addr == 16'h47d ? 16'he00f :  // <0229> error_halt_code $err_power_lost_at_boot
addr == 16'h47e ? 16'h047d :  // <0229> "


// :else_1144 // = 0x047f

// :end_1144 // = 0x047f

addr == 16'h47f ? 16'h4e00 :  // <0230> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h480 ? 16'h523c :  // <0230> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 60
addr == 16'h481 ? 16'h4760 :  // <0230> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h482 ? 16'h4e00 :  // <0231> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_hi = 0
addr == 16'h483 ? 16'h523e :  // <0231> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_lo = 62
addr == 16'h484 ? 16'h4602 :  // <0231> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_write_data = 2

// start handling events.
addr == 16'h485 ? 16'h2ba0 :  // <0234> soft_event = $event_controller_reset_mask
addr == 16'h486 ? 16'h8000 :  // <0234> "
addr == 16'h487 ? 16'h2a00 :  // <0235> soft_event = 0
addr == 16'h488 ? 16'h37a0 :  // <0236> mstimer0 = 1000
addr == 16'h489 ? 16'h03e8 :  // <0236> "
addr == 16'h48a ? 16'h3e14 :  // <0237> mstimer2 = $plan_tick_ms
addr == 16'h48b ? 16'he00f :  // <0238> jmp :poll_events
addr == 16'h48c ? 16'h007e :  // <0238> "

// event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.
// event 0 not used in this app anyway.
// :event_table // = 0x048d
addr == 16'h48d ? 16'h007e :  // <0243> ([label :poll_events])
addr == 16'h48e ? 16'h06a9 :  // <0244> ([label :power_lost_handler])
addr == 16'h48f ? 16'h04a2 :  // <0245> ([label :ign_capture_handler])
addr == 16'h490 ? 16'h0522 :  // <0246> ([label :ign_capture_timeout_handler])
addr == 16'h491 ? 16'h06d8 :  // <0247> ([label :puff1_done_handler])
addr == 16'h492 ? 16'h0527 :  // <0248> ([label :ustimer0_handler])
addr == 16'h493 ? 16'h0646 :  // <0249> ([label :spi_done_handler])
addr == 16'h494 ? 16'h0529 :  // <0250> ([label :mstimer0_handler])
addr == 16'h495 ? 16'h0613 :  // <0251> ([label :mstimer1_handler])
addr == 16'h496 ? 16'h0558 :  // <0252> ([label :mstimer2_handler])
addr == 16'h497 ? 16'h0573 :  // <0253> ([label :uart_rx_handler])
addr == 16'h498 ? 16'h058c :  // <0254> ([label :uart_rx_overflow_handler])
addr == 16'h499 ? 16'h0592 :  // <0255> ([label :uart_tx_overflow_handler])
addr == 16'h49a ? 16'h0598 :  // <0256> ([label :key0_handler])
addr == 16'h49b ? 16'h05a2 :  // <0257> ([label :key1_handler])
addr == 16'h49c ? 16'h06bb :  // <0258> ([label :ign_switch_off_handler])
addr == 16'h49d ? 16'h06ce :  // <0259> ([label :ign_switch_on_handler])
addr == 16'h49e ? 16'h05ac :  // <0260> ([label :softevent3_handler])
addr == 16'h49f ? 16'h05ae :  // <0261> ([label :softevent2_handler])
addr == 16'h4a0 ? 16'h05b0 :  // <0262> ([label :softevent1_handler])
addr == 16'h4a1 ? 16'h05b2 :  // <0263> ([label :softevent0_handler])

// #########################################################################

// ######## event ign_capture_handler // = 0x04a2
// discard outlier time.
addr == 16'h4a2 ? 16'h181b :  // <0269> g6 = ign_capture_jf
addr == 16'h4a3 ? 16'h4e00 :  // <0270> ram b = $ram_ign_fastest_jf // av_ad_hi = 0
addr == 16'h4a4 ? 16'h5284 :  // <0270> ram b = $ram_ign_fastest_jf // av_ad_lo = 132
addr == 16'h4a5 ? 16'h0411 :  // <0270> ram b = $ram_ign_fastest_jf // b = av_write_data // start read cycle
addr == 16'h4a6 ? 16'h0412 :  // <0270> ram b = $ram_ign_fastest_jf // b = av_read_data // finish read cycle

addr == 16'h4a7 ? 16'h0006 :  // <0273> a = g6
addr == 16'h4a8 ? 16'h0401 :  // <0273> b = b


addr == 16'h4a9 ? 16'he405 :  // <0273> bn lt :else_1193
addr == 16'h4aa ? 16'h04ac :  // <0273> "

addr == 16'h4ab ? 16'h1a00 :  // <0273> g6 = 0


// :else_1193 // = 0x04ac

// :end_1193 // = 0x04ac

addr == 16'h4ac ? 16'h4e00 :  // <0274> ram b = $ram_ign_slowest_jf // av_ad_hi = 0
addr == 16'h4ad ? 16'h5286 :  // <0274> ram b = $ram_ign_slowest_jf // av_ad_lo = 134
addr == 16'h4ae ? 16'h0411 :  // <0274> ram b = $ram_ign_slowest_jf // b = av_write_data // start read cycle
addr == 16'h4af ? 16'h0412 :  // <0274> ram b = $ram_ign_slowest_jf // b = av_read_data // finish read cycle

addr == 16'h4b0 ? 16'h0006 :  // <0277> a = g6
addr == 16'h4b1 ? 16'h0401 :  // <0277> b = b


addr == 16'h4b2 ? 16'he406 :  // <0277> bn gt :else_1202
addr == 16'h4b3 ? 16'h04b5 :  // <0277> "

addr == 16'h4b4 ? 16'h1a00 :  // <0277> g6 = 0


// :else_1202 // = 0x04b5

// :end_1202 // = 0x04b5


// increment buffer index and memorize time.
addr == 16'h4b5 ? 16'h4e00 :  // <0280> ram a = $ram_ign_history_idx // av_ad_hi = 0
addr == 16'h4b6 ? 16'h525a :  // <0280> ram a = $ram_ign_history_idx // av_ad_lo = 90
addr == 16'h4b7 ? 16'h0011 :  // <0280> ram a = $ram_ign_history_idx // a = av_write_data // start read cycle
addr == 16'h4b8 ? 16'h0012 :  // <0280> ram a = $ram_ign_history_idx // a = av_read_data // finish read cycle
addr == 16'h4b9 ? 16'h0601 :  // <0281> b = 1
addr == 16'h4ba ? 16'hc800 :  // <0282> a = a+b
addr == 16'h4bb ? 16'h0300 :  // <0282> "
addr == 16'h4bc ? 16'h060f :  // <0283> b = $ign_history_idx_mask
addr == 16'h4bd ? 16'hc800 :  // <0284> a = and
addr == 16'h4be ? 16'h0330 :  // <0284> "
addr == 16'h4bf ? 16'h4e00 :  // <0285> ram $ram_ign_history_idx = a // av_ad_hi = 0
addr == 16'h4c0 ? 16'h525a :  // <0285> ram $ram_ign_history_idx = a // av_ad_lo = 90
addr == 16'h4c1 ? 16'h4400 :  // <0285> ram $ram_ign_history_idx = a // av_write_data = a
addr == 16'h4c2 ? 16'h0406 :  // <0286> b = g6

addr == 16'h4c3 ? 16'h0351 :  // <0287> a = a<<1
addr == 16'h4c4 ? 16'h2001 :  // <0287> push b // push b
addr == 16'h4c5 ? 16'h065c :  // <0287> b = 92
addr == 16'h4c6 ? 16'h4e00 :  // <0287> av_ad_hi = 0
addr == 16'h4c7 ? 16'h5300 :  // <0287> av_ad_lo = ad0
addr == 16'h4c8 ? 16'h4408 :  // <0287> pop av_write_data // pop av_write_data


// ////////// compute new jiffy estimate.
// average entire history.
// x = total, y = sample, i = index = loop count, g6 = count of invalid samples.
addr == 16'h4c9 ? 16'h1200 :  // <0292> x = 0
addr == 16'h4ca ? 16'h1a00 :  // <0293> g6 = 0
addr == 16'h4cb ? 16'h0a00 :  // <0309> i = 0
// :loop_1227 // = 0x04cc

addr == 16'h4cc ? 16'h0002 :  // <0309> a = i

addr == 16'h4cd ? 16'h0351 :  // <0309> a = a<<1
addr == 16'h4ce ? 16'h065c :  // <0309> b = 92
addr == 16'h4cf ? 16'h4e00 :  // <0309> av_ad_hi = 0
addr == 16'h4d0 ? 16'h5300 :  // <0309> av_ad_lo = ad0
addr == 16'h4d1 ? 16'h0411 :  // <0309> b = av_write_data
addr == 16'h4d2 ? 16'h0412 :  // <0309> b = av_read_data

addr == 16'h4d3 ? 16'h1401 :  // <0309> y = b

addr == 16'h4d4 ? 16'h0005 :  // <0309> a = y
addr == 16'h4d5 ? 16'h0600 :  // <0309> b = 0


addr == 16'h4d6 ? 16'he407 :  // <0309> bn eq :else_1238
addr == 16'h4d7 ? 16'h04de :  // <0309> "

addr == 16'h4d8 ? 16'h0006 :  // <0309> a = g6
addr == 16'h4d9 ? 16'h0601 :  // <0309> b = 1
addr == 16'h4da ? 16'hc800 :  // <0309> g6 = a+b
addr == 16'h4db ? 16'h1b00 :  // <0309> "

addr == 16'h4dc ? 16'he00f :  // <0309> jmp :end_1238
addr == 16'h4dd ? 16'h04e5 :  // <0309> "
// :else_1238 // = 0x04de

addr == 16'h4de ? 16'h0208 :  // <0309> a = ($ign_history_len / 2)
addr == 16'h4df ? 16'h0405 :  // <0309> b = y
addr == 16'h4e0 ? 16'hc800 :  // <0309> a = a+b
addr == 16'h4e1 ? 16'h0300 :  // <0309> "
addr == 16'h4e2 ? 16'h1753 :  // <0309> y = a>>$ign_history_idx_bits
addr == 16'h4e3 ? 16'hc800 :  // <0309> x = x+y
addr == 16'h4e4 ? 16'h1320 :  // <0309> "

// :end_1238 // = 0x04e5



addr == 16'h4e5 ? 16'h0002 :  // <0309> a = i
addr == 16'h4e6 ? 16'h0601 :  // <0309> b = 1
addr == 16'h4e7 ? 16'hc800 :  // <0309> i = a+b
addr == 16'h4e8 ? 16'h0b00 :  // <0309> "


addr == 16'h4e9 ? 16'h0002 :  // <0309> a = i
addr == 16'h4ea ? 16'h0610 :  // <0309> b = $ign_history_len
addr == 16'h4eb ? 16'he005 :  // <0309> br lt :loop_1227
addr == 16'h4ec ? 16'h04cc :  // <0309> "

// :end_1227 // = 0x04ed
addr == 16'h4ed ? 16'h4e00 :  // <0310> ram $ram_ign_avg_jf = x // av_ad_hi = 0
addr == 16'h4ee ? 16'h527c :  // <0310> ram $ram_ign_avg_jf = x // av_ad_lo = 124
addr == 16'h4ef ? 16'h4404 :  // <0310> ram $ram_ign_avg_jf = x // av_write_data = x
addr == 16'h4f0 ? 16'h4e00 :  // <0311> ram $ram_ign_bad_samples = g6 // av_ad_hi = 0
addr == 16'h4f1 ? 16'h5282 :  // <0311> ram $ram_ign_bad_samples = g6 // av_ad_lo = 130
addr == 16'h4f2 ? 16'h4406 :  // <0311> ram $ram_ign_bad_samples = g6 // av_write_data = g6
//patch: dividing before summing (instead of after) is much simpler and faster because it prevents overflow.
// but it means we could be reading as much as 16 jf too low (16 = ign_history_len).
// that error is way less than 1 RPM on the slow end,
// or about 1,000 RPM too fast on the fast end!
// might need to tighten that up.  one simple way might be adding ign_history_len / 2 to each history record prior to dividing.
// that didn't seem to help much in simple testing.
// probly because jf_to_rpm has only 32 RPM resolution.


addr == 16'h4f3 ? 16'h0006 :  // <0328> a = g6
addr == 16'h4f4 ? 16'h0604 :  // <0328> b = ( $ign_history_len / 4 )


addr == 16'h4f5 ? 16'he406 :  // <0328> bn gt :else_1269
addr == 16'h4f6 ? 16'h04fc :  // <0328> "

addr == 16'h4f7 ? 16'h4e00 :  // <0328> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h4f8 ? 16'h5280 :  // <0328> ram $ram_rpm_valid = 0 // av_ad_lo = 128
addr == 16'h4f9 ? 16'h4600 :  // <0328> ram $ram_rpm_valid = 0 // av_write_data = 0

addr == 16'h4fa ? 16'he00f :  // <0328> jmp :end_1269
addr == 16'h4fb ? 16'h0506 :  // <0328> "
// :else_1269 // = 0x04fc

// convert jiffies b to new RPM estimate.
addr == 16'h4fc ? 16'h0004 :  // <0328> a = x
addr == 16'h4fd ? 16'hfba0 :  // <0328> call :jf_to_rpm
addr == 16'h4fe ? 16'h07d8 :  // <0328> "
addr == 16'h4ff ? 16'hfc00 :  // <0328> "
addr == 16'h500 ? 16'h4e00 :  // <0328> ram $ram_avg_rpm = a // av_ad_hi = 0
addr == 16'h501 ? 16'h527e :  // <0328> ram $ram_avg_rpm = a // av_ad_lo = 126
addr == 16'h502 ? 16'h4400 :  // <0328> ram $ram_avg_rpm = a // av_write_data = a
addr == 16'h503 ? 16'h4e00 :  // <0328> ram $ram_rpm_valid = 1 // av_ad_hi = 0
addr == 16'h504 ? 16'h5280 :  // <0328> ram $ram_rpm_valid = 1 // av_ad_lo = 128
addr == 16'h505 ? 16'h4601 :  // <0328> ram $ram_rpm_valid = 1 // av_write_data = 1

// :end_1269 // = 0x0506

addr == 16'h506 ? 16'he00f :  // <0329> end_event
addr == 16'h507 ? 16'h007e :  // <0329> "

// ######## func clear_ign_history // = 0x0508
addr == 16'h508 ? 16'h2002 :  // <0331> push i // func clear_ign_history
// invalidate the RPM estimate.
addr == 16'h509 ? 16'h4e00 :  // <0333> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h50a ? 16'h5280 :  // <0333> ram $ram_rpm_valid = 0 // av_ad_lo = 128
addr == 16'h50b ? 16'h4600 :  // <0333> ram $ram_rpm_valid = 0 // av_write_data = 0
// the last known RPM estimate is retained here, not cleared.
// clear the history so it won't be valid again until several more valid samples are collected.
addr == 16'h50c ? 16'h4e00 :  // <0336> ram $ram_ign_bad_samples = $ign_history_len // av_ad_hi = 0
addr == 16'h50d ? 16'h5282 :  // <0336> ram $ram_ign_bad_samples = $ign_history_len // av_ad_lo = 130
addr == 16'h50e ? 16'h4610 :  // <0336> ram $ram_ign_bad_samples = $ign_history_len // av_write_data = 16
addr == 16'h50f ? 16'h0a00 :  // <0341> i = 0
// :loop_1295 // = 0x0510

addr == 16'h510 ? 16'h0002 :  // <0341> a = i
addr == 16'h511 ? 16'h0600 :  // <0341> b = 0

addr == 16'h512 ? 16'h0351 :  // <0341> a = a<<1
addr == 16'h513 ? 16'h2001 :  // <0341> push b // push b
addr == 16'h514 ? 16'h065c :  // <0341> b = 92
addr == 16'h515 ? 16'h4e00 :  // <0341> av_ad_hi = 0
addr == 16'h516 ? 16'h5300 :  // <0341> av_ad_lo = ad0
addr == 16'h517 ? 16'h4408 :  // <0341> pop av_write_data // pop av_write_data



addr == 16'h518 ? 16'h0002 :  // <0341> a = i
addr == 16'h519 ? 16'h0601 :  // <0341> b = 1
addr == 16'h51a ? 16'hc800 :  // <0341> i = a+b
addr == 16'h51b ? 16'h0b00 :  // <0341> "


addr == 16'h51c ? 16'h0002 :  // <0341> a = i
addr == 16'h51d ? 16'h0610 :  // <0341> b = $ign_history_len
addr == 16'h51e ? 16'he005 :  // <0341> br lt :loop_1295
addr == 16'h51f ? 16'h0510 :  // <0341> "

// :end_1295 // = 0x0520
addr == 16'h520 ? 16'h0808 :  // <0342> pop i // end_func
addr == 16'h521 ? 16'hfc00 :  // <0342> swapra = nop

// ######## event ign_capture_timeout_handler // = 0x0522
// it's been too long since the last ignition pulse detect.
addr == 16'h522 ? 16'hfba0 :  // <0346> call :clear_ign_history
addr == 16'h523 ? 16'h0508 :  // <0346> "
addr == 16'h524 ? 16'hfc00 :  // <0346> "
addr == 16'h525 ? 16'he00f :  // <0347> end_event
addr == 16'h526 ? 16'h007e :  // <0347> "

// ######## event ustimer0_handler // = 0x0527
addr == 16'h527 ? 16'he00f :  // <0350> end_event
addr == 16'h528 ? 16'h007e :  // <0350> "

// ######## event mstimer0_handler // = 0x0529
// unified 1-second periodic timer for all low-resolution tasks.

// start timer again.
addr == 16'h529 ? 16'h37a0 :  // <0356> mstimer0 = 1000
addr == 16'h52a ? 16'h03e8 :  // <0356> "

// realtime counters in RAM.
addr == 16'h52b ? 16'h4e00 :  // <0359> ram a = $ram_seconds_cnt // av_ad_hi = 0
addr == 16'h52c ? 16'h5242 :  // <0359> ram a = $ram_seconds_cnt // av_ad_lo = 66
addr == 16'h52d ? 16'h0011 :  // <0359> ram a = $ram_seconds_cnt // a = av_write_data // start read cycle
addr == 16'h52e ? 16'h0012 :  // <0359> ram a = $ram_seconds_cnt // a = av_read_data // finish read cycle
addr == 16'h52f ? 16'h0601 :  // <0360> b = 1
addr == 16'h530 ? 16'hc800 :  // <0361> a = a+b
addr == 16'h531 ? 16'h0300 :  // <0361> "

addr == 16'h532 ? 16'h0000 :  // <0370> a = a
addr == 16'h533 ? 16'h063c :  // <0370> b = 60


addr == 16'h534 ? 16'he407 :  // <0370> bn eq :else_1332
addr == 16'h535 ? 16'h0547 :  // <0370> "

addr == 16'h536 ? 16'h4e00 :  // <0370> ram $ram_seconds_cnt = 0 // av_ad_hi = 0
addr == 16'h537 ? 16'h5242 :  // <0370> ram $ram_seconds_cnt = 0 // av_ad_lo = 66
addr == 16'h538 ? 16'h4600 :  // <0370> ram $ram_seconds_cnt = 0 // av_write_data = 0
addr == 16'h539 ? 16'h4e00 :  // <0370> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h53a ? 16'h5240 :  // <0370> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'h53b ? 16'h0011 :  // <0370> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h53c ? 16'h0012 :  // <0370> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h53d ? 16'h0601 :  // <0370> b = 1
addr == 16'h53e ? 16'h4e00 :  // <0370> ram $ram_minutes_cnt = a+b // av_ad_hi = 0
addr == 16'h53f ? 16'h5240 :  // <0370> ram $ram_minutes_cnt = a+b // av_ad_lo = 64
addr == 16'h540 ? 16'hc800 :  // <0370> ram $ram_minutes_cnt = a+b // av_write_data = a+b
addr == 16'h541 ? 16'h4700 :  // <0370> "
addr == 16'h542 ? 16'hfba0 :  // <0370> call :minute_events
addr == 16'h543 ? 16'h06e7 :  // <0370> "
addr == 16'h544 ? 16'hfc00 :  // <0370> "

addr == 16'h545 ? 16'he00f :  // <0370> jmp :end_1332
addr == 16'h546 ? 16'h054a :  // <0370> "
// :else_1332 // = 0x0547

addr == 16'h547 ? 16'h4e00 :  // <0370> ram $ram_seconds_cnt = a // av_ad_hi = 0
addr == 16'h548 ? 16'h5242 :  // <0370> ram $ram_seconds_cnt = a // av_ad_lo = 66
addr == 16'h549 ? 16'h4400 :  // <0370> ram $ram_seconds_cnt = a // av_write_data = a

// :end_1332 // = 0x054a


// all 1-second functions here.
addr == 16'h54a ? 16'hfba0 :  // <0373> call :check_power_relay
addr == 16'h54b ? 16'h06ef :  // <0373> "
addr == 16'h54c ? 16'hfc00 :  // <0373> "
addr == 16'h54d ? 16'hfba0 :  // <0374> call :check_communication
addr == 16'h54e ? 16'h0722 :  // <0374> "
addr == 16'h54f ? 16'hfc00 :  // <0374> "
addr == 16'h550 ? 16'hfba0 :  // <0375> call :start_daq_pass
addr == 16'h551 ? 16'h05be :  // <0375> "
addr == 16'h552 ? 16'hfc00 :  // <0375> "
addr == 16'h553 ? 16'he00f :  // <0376> end_event
addr == 16'h554 ? 16'h007e :  // <0376> "

// :plan_transition_msg // = 0x0555
// "PLAN\x0"
addr == 16'h555 ? 16'h4c50 :  // <0379> LP
addr == 16'h556 ? 16'h4e41 :  // <0379> NA
addr == 16'h557 ? 16'h0000 :  // <0379>   

// ######## event mstimer2_handler // = 0x0558
// engine management plan tick timer.

// restart timer.
addr == 16'h558 ? 16'h3e14 :  // <0385> mstimer2 = $plan_tick_ms

// poll the engine management plan.
// call the transition function for the current plan.
// this might perform a transition to some other plan, so it's done first.
addr == 16'h559 ? 16'h4e00 :  // <0390> ram rtna = $ram_transition_func // av_ad_hi = 0
addr == 16'h55a ? 16'h528e :  // <0390> ram rtna = $ram_transition_func // av_ad_lo = 142
addr == 16'h55b ? 16'hf811 :  // <0390> ram rtna = $ram_transition_func // rtna = av_write_data // start read cycle
addr == 16'h55c ? 16'hf812 :  // <0390> ram rtna = $ram_transition_func // rtna = av_read_data // finish read cycle
addr == 16'h55d ? 16'h103e :  // <0391> x = rtna
addr == 16'h55e ? 16'hfc00 :  // <0392> swapra = nop
addr == 16'h55f ? 16'h4e00 :  // <0393> ram b = $ram_transition_func // av_ad_hi = 0
addr == 16'h560 ? 16'h528e :  // <0393> ram b = $ram_transition_func // av_ad_lo = 142
addr == 16'h561 ? 16'h0411 :  // <0393> ram b = $ram_transition_func // b = av_write_data // start read cycle
addr == 16'h562 ? 16'h0412 :  // <0393> ram b = $ram_transition_func // b = av_read_data // finish read cycle

addr == 16'h563 ? 16'h0004 :  // <0397> a = x
addr == 16'h564 ? 16'h0401 :  // <0397> b = b


addr == 16'h565 ? 16'he007 :  // <0397> br eq :else_1381
addr == 16'h566 ? 16'h056c :  // <0397> "

addr == 16'h567 ? 16'h03a0 :  // <0397> a = :plan_transition_msg
addr == 16'h568 ? 16'h0555 :  // <0397> "
addr == 16'h569 ? 16'hfba0 :  // <0397> call :set_text_flag
addr == 16'h56a ? 16'h0780 :  // <0397> "
addr == 16'h56b ? 16'hfc00 :  // <0397> "


// :else_1381 // = 0x056c

// :end_1381 // = 0x056c

// call the puff length function for the current plan.
// this is done last, so if a plan transition just happened, its new puff length will init here.
addr == 16'h56c ? 16'h4e00 :  // <0400> ram rtna = $ram_puff_len_func // av_ad_hi = 0
addr == 16'h56d ? 16'h528c :  // <0400> ram rtna = $ram_puff_len_func // av_ad_lo = 140
addr == 16'h56e ? 16'hf811 :  // <0400> ram rtna = $ram_puff_len_func // rtna = av_write_data // start read cycle
addr == 16'h56f ? 16'hf812 :  // <0400> ram rtna = $ram_puff_len_func // rtna = av_read_data // finish read cycle
addr == 16'h570 ? 16'hfc00 :  // <0401> swapra = nop
addr == 16'h571 ? 16'he00f :  // <0402> end_event
addr == 16'h572 ? 16'h007e :  // <0402> "

// ######## event uart_rx_handler // = 0x0573
// :again // = 0x0573
addr == 16'h573 ? 16'hfba0 :  // <0406> pollchar
addr == 16'h574 ? 16'h009a :  // <0406> "
addr == 16'h575 ? 16'hfc00 :  // <0406> "
addr == 16'h576 ? 16'h1000 :  // <0407> x = a

addr == 16'h577 ? 16'h0004 :  // <0410> a = x
addr == 16'h578 ? 16'h0760 :  // <0410> b = -1


addr == 16'h579 ? 16'he407 :  // <0410> bn eq :else_1401
addr == 16'h57a ? 16'h057d :  // <0410> "

addr == 16'h57b ? 16'he00f :  // <0410> event_return
addr == 16'h57c ? 16'h007e :  // <0410> "


// :else_1401 // = 0x057d

// :end_1401 // = 0x057d


addr == 16'h57d ? 16'h0004 :  // <0413> a = x
addr == 16'h57e ? 16'h060a :  // <0413> b = 10


addr == 16'h57f ? 16'he407 :  // <0413> bn eq :else_1407
addr == 16'h580 ? 16'h0584 :  // <0413> "

addr == 16'h581 ? 16'hfba0 :  // <0413> call :postpone_comm_restart
addr == 16'h582 ? 16'h074f :  // <0413> "
addr == 16'h583 ? 16'hfc00 :  // <0413> "


// :else_1407 // = 0x0584

// :end_1407 // = 0x0584

addr == 16'h584 ? 16'h0004 :  // <0414> a = x
addr == 16'h585 ? 16'hfba0 :  // <0415> call :parse_key
addr == 16'h586 ? 16'h022c :  // <0415> "
addr == 16'h587 ? 16'hfc00 :  // <0415> "
addr == 16'h588 ? 16'he00f :  // <0416> jmp :again
addr == 16'h589 ? 16'h0573 :  // <0416> "
addr == 16'h58a ? 16'he00f :  // <0417> end_event
addr == 16'h58b ? 16'h007e :  // <0417> "

// ######## event uart_rx_overflow_handler // = 0x058c
addr == 16'h58c ? 16'h5fa0 :  // <0420> error_halt_code $err_rx_overflow // leds = 0xfffe
addr == 16'h58d ? 16'hfffe :  // <0420> "
addr == 16'h58e ? 16'he00f :  // <0420> error_halt_code $err_rx_overflow
addr == 16'h58f ? 16'h058e :  // <0420> "
addr == 16'h590 ? 16'he00f :  // <0421> end_event
addr == 16'h591 ? 16'h007e :  // <0421> "

// ######## event uart_tx_overflow_handler // = 0x0592
addr == 16'h592 ? 16'h5fa0 :  // <0424> error_halt_code $err_tx_overflow // leds = 0xfffd
addr == 16'h593 ? 16'hfffd :  // <0424> "
addr == 16'h594 ? 16'he00f :  // <0424> error_halt_code $err_tx_overflow
addr == 16'h595 ? 16'h0594 :  // <0424> "
addr == 16'h596 ? 16'he00f :  // <0425> end_event
addr == 16'h597 ? 16'h007e :  // <0425> "

// ######## event key0_handler // = 0x0598
addr == 16'h598 ? 16'h026b :  // <0428> a = 107 // putasc "k"
addr == 16'h599 ? 16'hfba0 :  // <0428> putasc "k"
addr == 16'h59a ? 16'h008b :  // <0428> "
addr == 16'h59b ? 16'hfc00 :  // <0428> "
addr == 16'h59c ? 16'h0230 :  // <0429> a = 48 // putasc "0"
addr == 16'h59d ? 16'hfba0 :  // <0429> putasc "0"
addr == 16'h59e ? 16'h008b :  // <0429> "
addr == 16'h59f ? 16'hfc00 :  // <0429> "
addr == 16'h5a0 ? 16'he00f :  // <0430> end_event
addr == 16'h5a1 ? 16'h007e :  // <0430> "

// ######## event key1_handler // = 0x05a2
addr == 16'h5a2 ? 16'h026b :  // <0433> a = 107 // putasc "k"
addr == 16'h5a3 ? 16'hfba0 :  // <0433> putasc "k"
addr == 16'h5a4 ? 16'h008b :  // <0433> "
addr == 16'h5a5 ? 16'hfc00 :  // <0433> "
addr == 16'h5a6 ? 16'h0231 :  // <0434> a = 49 // putasc "1"
addr == 16'h5a7 ? 16'hfba0 :  // <0434> putasc "1"
addr == 16'h5a8 ? 16'h008b :  // <0434> "
addr == 16'h5a9 ? 16'hfc00 :  // <0434> "
addr == 16'h5aa ? 16'he00f :  // <0435> end_event
addr == 16'h5ab ? 16'h007e :  // <0435> "

// ######## event softevent3_handler // = 0x05ac
addr == 16'h5ac ? 16'he00f :  // <0438> end_event
addr == 16'h5ad ? 16'h007e :  // <0438> "

// ######## event softevent2_handler // = 0x05ae
addr == 16'h5ae ? 16'he00f :  // <0441> end_event
addr == 16'h5af ? 16'h007e :  // <0441> "

// ######## event softevent1_handler // = 0x05b0
addr == 16'h5b0 ? 16'he00f :  // <0444> end_event
addr == 16'h5b1 ? 16'h007e :  // <0444> "

// ######## event softevent0_handler // = 0x05b2
addr == 16'h5b2 ? 16'he00f :  // <0447> end_event
addr == 16'h5b3 ? 16'h007e :  // <0447> "

// :rpm_msg // = 0x05b4
// ": rpm=\x0"
addr == 16'h5b4 ? 16'h203a :  // <0450>  :
addr == 16'h5b5 ? 16'h7072 :  // <0450> pr
addr == 16'h5b6 ? 16'h3d6d :  // <0450> =m
addr == 16'h5b7 ? 16'h0000 :  // <0450>   

// :puff_len_msg // = 0x05b8
// " pfl=\x0"
addr == 16'h5b8 ? 16'h7020 :  // <0453> p 
addr == 16'h5b9 ? 16'h6c66 :  // <0453> lf
addr == 16'h5ba ? 16'h003d :  // <0453>  =

// :o2_msg // = 0x05bb
// " o2=\x0"
addr == 16'h5bb ? 16'h6f20 :  // <0456> o 
addr == 16'h5bc ? 16'h3d32 :  // <0456> =2
addr == 16'h5bd ? 16'h0000 :  // <0456>   

// ######## func start_daq_pass // = 0x05be
addr == 16'h5be ? 16'h2004 :  // <0458> push x // func start_daq_pass
addr == 16'h5bf ? 16'h203e :  // <0458> push rtna // "
// daq pass counter in RAM.
addr == 16'h5c0 ? 16'h4e00 :  // <0460> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h5c1 ? 16'h5214 :  // <0460> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h5c2 ? 16'h0011 :  // <0460> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h5c3 ? 16'h0012 :  // <0460> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h5c4 ? 16'h0601 :  // <0461> b = 1
addr == 16'h5c5 ? 16'hc800 :  // <0462> a = a+b
addr == 16'h5c6 ? 16'h0300 :  // <0462> "
addr == 16'h5c7 ? 16'h5c00 :  // <0463> leds = a
addr == 16'h5c8 ? 16'h4e00 :  // <0464> ram $ram_daq_pass_cnt = a // av_ad_hi = 0
addr == 16'h5c9 ? 16'h5214 :  // <0464> ram $ram_daq_pass_cnt = a // av_ad_lo = 20
addr == 16'h5ca ? 16'h4400 :  // <0464> ram $ram_daq_pass_cnt = a // av_write_data = a
addr == 16'h5cb ? 16'hfba0 :  // <0465> call :put4x
addr == 16'h5cc ? 16'h00b3 :  // <0465> "
addr == 16'h5cd ? 16'hfc00 :  // <0465> "

addr == 16'h5ce ? 16'h03a0 :  // <0467> a = :rpm_msg
addr == 16'h5cf ? 16'h05b4 :  // <0467> "
addr == 16'h5d0 ? 16'hfba0 :  // <0468> call :print_nt
addr == 16'h5d1 ? 16'h013f :  // <0468> "
addr == 16'h5d2 ? 16'hfc00 :  // <0468> "
addr == 16'h5d3 ? 16'h0200 :  // <0469> a = 0
addr == 16'h5d4 ? 16'h4e00 :  // <0470> ram x = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h5d5 ? 16'h5280 :  // <0470> ram x = $ram_rpm_valid // av_ad_lo = 128
addr == 16'h5d6 ? 16'h1011 :  // <0470> ram x = $ram_rpm_valid // x = av_write_data // start read cycle
addr == 16'h5d7 ? 16'h1012 :  // <0470> ram x = $ram_rpm_valid // x = av_read_data // finish read cycle

addr == 16'h5d8 ? 16'h0004 :  // <0473> a = x
addr == 16'h5d9 ? 16'h0600 :  // <0473> b = 0


addr == 16'h5da ? 16'he007 :  // <0473> br eq :else_1498
addr == 16'h5db ? 16'h05e0 :  // <0473> "

addr == 16'h5dc ? 16'h4e00 :  // <0473> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h5dd ? 16'h527e :  // <0473> ram a = $ram_avg_rpm // av_ad_lo = 126
addr == 16'h5de ? 16'h0011 :  // <0473> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h5df ? 16'h0012 :  // <0473> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle


// :else_1498 // = 0x05e0

// :end_1498 // = 0x05e0

addr == 16'h5e0 ? 16'hfba0 :  // <0474> call :put4x
addr == 16'h5e1 ? 16'h00b3 :  // <0474> "
addr == 16'h5e2 ? 16'hfc00 :  // <0474> "

addr == 16'h5e3 ? 16'h03a0 :  // <0476> a = :puff_len_msg
addr == 16'h5e4 ? 16'h05b8 :  // <0476> "
addr == 16'h5e5 ? 16'hfba0 :  // <0477> call :print_nt
addr == 16'h5e6 ? 16'h013f :  // <0477> "
addr == 16'h5e7 ? 16'hfc00 :  // <0477> "
addr == 16'h5e8 ? 16'h001d :  // <0478> a = puff_len_us
addr == 16'h5e9 ? 16'hfba0 :  // <0479> call :put4x
addr == 16'h5ea ? 16'h00b3 :  // <0479> "
addr == 16'h5eb ? 16'hfc00 :  // <0479> "
addr == 16'h5ec ? 16'h022c :  // <0480> a = 44 // putasc ","
addr == 16'h5ed ? 16'hfba0 :  // <0480> putasc ","
addr == 16'h5ee ? 16'h008b :  // <0480> "
addr == 16'h5ef ? 16'hfc00 :  // <0480> "
addr == 16'h5f0 ? 16'h4e00 :  // <0481> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h5f1 ? 16'h5294 :  // <0481> ram a = $ram_puff_count // av_ad_lo = 148
addr == 16'h5f2 ? 16'h0011 :  // <0481> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h5f3 ? 16'h0012 :  // <0481> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h5f4 ? 16'hfba0 :  // <0482> call :put4x
addr == 16'h5f5 ? 16'h00b3 :  // <0482> "
addr == 16'h5f6 ? 16'hfc00 :  // <0482> "

addr == 16'h5f7 ? 16'h03a0 :  // <0484> a = :o2_msg
addr == 16'h5f8 ? 16'h05bb :  // <0484> "
addr == 16'h5f9 ? 16'hfba0 :  // <0485> call :print_nt
addr == 16'h5fa ? 16'h013f :  // <0485> "
addr == 16'h5fb ? 16'hfc00 :  // <0485> "
addr == 16'h5fc ? 16'h0205 :  // <0486> a = $o2_adc_channel

addr == 16'h5fd ? 16'h0351 :  // <0487> a = a<<1
addr == 16'h5fe ? 16'h0628 :  // <0487> b = 40
addr == 16'h5ff ? 16'h4e00 :  // <0487> av_ad_hi = 0
addr == 16'h600 ? 16'h5300 :  // <0487> av_ad_lo = ad0
addr == 16'h601 ? 16'h0411 :  // <0487> b = av_write_data
addr == 16'h602 ? 16'h0412 :  // <0487> b = av_read_data

addr == 16'h603 ? 16'h0001 :  // <0488> a = b
addr == 16'h604 ? 16'hfba0 :  // <0489> call :put4x
addr == 16'h605 ? 16'h00b3 :  // <0489> "
addr == 16'h606 ? 16'hfc00 :  // <0489> "

// start to acquire & report all anmux channels.
addr == 16'h607 ? 16'h0207 :  // <0492> a = ($anmux_num_channels - 1)
addr == 16'h608 ? 16'hfba0 :  // <0493> call :anmux_set_chn
addr == 16'h609 ? 16'h00a2 :  // <0493> "
addr == 16'h60a ? 16'hfc00 :  // <0493> "
addr == 16'h60b ? 16'h3a05 :  // <0494> mstimer1 = $anmux_settle_ms

// // observe MCU utilization.  this RAM variable can be seen by the debugger.
addr == 16'h60c ? 16'h4e00 :  // <0497> ram $ram_mcu_usage_cnt = usage_count // av_ad_hi = 0
addr == 16'h60d ? 16'h5244 :  // <0497> ram $ram_mcu_usage_cnt = usage_count // av_ad_lo = 68
addr == 16'h60e ? 16'h440b :  // <0497> ram $ram_mcu_usage_cnt = usage_count // av_write_data = usage_count
addr == 16'h60f ? 16'h2e00 :  // <0498> usage_count = 0
addr == 16'h610 ? 16'hf808 :  // <0499> pop rtna // end_func
addr == 16'h611 ? 16'h1008 :  // <0499> pop x // "
addr == 16'h612 ? 16'hfc00 :  // <0499> swapra = nop

// ######## event mstimer1_handler // = 0x0613
// anmux signal has settled.

addr == 16'h613 ? 16'h4e00 :  // <0504> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h614 ? 16'h5238 :  // <0504> ram a = $ram_adc_chn_pending // av_ad_lo = 56
addr == 16'h615 ? 16'h0011 :  // <0504> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h616 ? 16'h0012 :  // <0504> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle

addr == 16'h617 ? 16'h0000 :  // <0509> a = a
addr == 16'h618 ? 16'h0600 :  // <0509> b = 0


addr == 16'h619 ? 16'he007 :  // <0509> br eq :else_1561
addr == 16'h61a ? 16'h061e :  // <0509> "

// ADC is busy right now.  wait a while & try again.
addr == 16'h61b ? 16'h3a02 :  // <0509> mstimer1 = $anmux_retry_ms
addr == 16'h61c ? 16'he00f :  // <0509> event_return
addr == 16'h61d ? 16'h007e :  // <0509> "


// :else_1561 // = 0x061e

// :end_1561 // = 0x061e


// start a reading from the current anmux channel.
addr == 16'h61e ? 16'h0220 :  // <0512> a = 32 // putasc " "
addr == 16'h61f ? 16'hfba0 :  // <0512> putasc " "
addr == 16'h620 ? 16'h008b :  // <0512> "
addr == 16'h621 ? 16'hfc00 :  // <0512> "
addr == 16'h622 ? 16'h0273 :  // <0513> a = 115 // putasc "s"
addr == 16'h623 ? 16'hfba0 :  // <0513> putasc "s"
addr == 16'h624 ? 16'h008b :  // <0513> "
addr == 16'h625 ? 16'hfc00 :  // <0513> "
addr == 16'h626 ? 16'hfba0 :  // <0514> call :anmux_get_chn
addr == 16'h627 ? 16'h00a6 :  // <0514> "
addr == 16'h628 ? 16'hfc00 :  // <0514> "
addr == 16'h629 ? 16'h0630 :  // <0515> b = 48 // asc b = "0"
addr == 16'h62a ? 16'hc800 :  // <0516> a = a+b // putchar a+b
addr == 16'h62b ? 16'h0300 :  // <0516> "
addr == 16'h62c ? 16'hfba0 :  // <0516> putchar a+b
addr == 16'h62d ? 16'h008b :  // <0516> "
addr == 16'h62e ? 16'hfc00 :  // <0516> "
addr == 16'h62f ? 16'h023d :  // <0517> a = 61 // putasc "="
addr == 16'h630 ? 16'hfba0 :  // <0517> putasc "="
addr == 16'h631 ? 16'h008b :  // <0517> "
addr == 16'h632 ? 16'hfc00 :  // <0517> "
addr == 16'h633 ? 16'h0207 :  // <0518> a = $anmux_adc_channel
addr == 16'h634 ? 16'hfba0 :  // <0519> call :begin_adc_conversion
addr == 16'h635 ? 16'h0639 :  // <0519> "
addr == 16'h636 ? 16'hfc00 :  // <0519> "
addr == 16'h637 ? 16'he00f :  // <0520> end_event
addr == 16'h638 ? 16'h007e :  // <0520> "

// ######## func begin_adc_conversion // = 0x0639
// begin SPI transaction, specifying Nano ADC channel to take effect NEXT
// conversion after this one.  pass that in a.

addr == 16'h639 ? 16'h4e00 :  // <0526> ram $ram_adc_chn_pending = a // av_ad_hi = 0
addr == 16'h63a ? 16'h5238 :  // <0526> ram $ram_adc_chn_pending = a // av_ad_lo = 56
addr == 16'h63b ? 16'h4400 :  // <0526> ram $ram_adc_chn_pending = a // av_write_data = a
addr == 16'h63c ? 16'h0352 :  // <0527> a = a<<4
addr == 16'h63d ? 16'h0352 :  // <0528> a = a<<4
addr == 16'h63e ? 16'h0351 :  // <0529> a = a<<1
addr == 16'h63f ? 16'h0351 :  // <0530> a = a<<1
addr == 16'h640 ? 16'h0351 :  // <0531> a = a<<1
addr == 16'h641 ? 16'h4000 :  // <0532> spi_data = a
addr == 16'h642 ? 16'h4e00 :  // <0533> ram $ram_adc_junk = 1 // av_ad_hi = 0
addr == 16'h643 ? 16'h523a :  // <0533> ram $ram_adc_junk = 1 // av_ad_lo = 58
addr == 16'h644 ? 16'h4601 :  // <0533> ram $ram_adc_junk = 1 // av_write_data = 1
addr == 16'h645 ? 16'hfc00 :  // <0534> swapra = nop

// ######## event spi_done_handler // = 0x0646
// discard the results of the first SPI exchange with the ADC.  that's only for writing the channel num out to the ADC.
addr == 16'h646 ? 16'h4e00 :  // <0538> ram a = $ram_adc_junk // av_ad_hi = 0
addr == 16'h647 ? 16'h523a :  // <0538> ram a = $ram_adc_junk // av_ad_lo = 58
addr == 16'h648 ? 16'h0011 :  // <0538> ram a = $ram_adc_junk // a = av_write_data // start read cycle
addr == 16'h649 ? 16'h0012 :  // <0538> ram a = $ram_adc_junk // a = av_read_data // finish read cycle

addr == 16'h64a ? 16'h0000 :  // <0550> a = a
addr == 16'h64b ? 16'h0600 :  // <0550> b = 0


addr == 16'h64c ? 16'he007 :  // <0550> br eq :else_1612
addr == 16'h64d ? 16'h065d :  // <0550> "

// start another SPI exchange to retrieve the actual reading.
addr == 16'h64e ? 16'h4e00 :  // <0550> ram a = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h64f ? 16'h5238 :  // <0550> ram a = $ram_adc_chn_pending // av_ad_lo = 56
addr == 16'h650 ? 16'h0011 :  // <0550> ram a = $ram_adc_chn_pending // a = av_write_data // start read cycle
addr == 16'h651 ? 16'h0012 :  // <0550> ram a = $ram_adc_chn_pending // a = av_read_data // finish read cycle
addr == 16'h652 ? 16'h0352 :  // <0550> a = a<<4
addr == 16'h653 ? 16'h0352 :  // <0550> a = a<<4
addr == 16'h654 ? 16'h0351 :  // <0550> a = a<<1
addr == 16'h655 ? 16'h0351 :  // <0550> a = a<<1
addr == 16'h656 ? 16'h0351 :  // <0550> a = a<<1
addr == 16'h657 ? 16'h4000 :  // <0550> spi_data = a
addr == 16'h658 ? 16'h4e00 :  // <0550> ram $ram_adc_junk = 0 // av_ad_hi = 0
addr == 16'h659 ? 16'h523a :  // <0550> ram $ram_adc_junk = 0 // av_ad_lo = 58
addr == 16'h65a ? 16'h4600 :  // <0550> ram $ram_adc_junk = 0 // av_write_data = 0
addr == 16'h65b ? 16'he00f :  // <0550> event_return
addr == 16'h65c ? 16'h007e :  // <0550> "


// :else_1612 // = 0x065d

// :end_1612 // = 0x065d


// memorize an actual ADC reading.
addr == 16'h65d ? 16'h4e00 :  // <0553> ram i = $ram_adc_chn_pending // av_ad_hi = 0
addr == 16'h65e ? 16'h5238 :  // <0553> ram i = $ram_adc_chn_pending // av_ad_lo = 56
addr == 16'h65f ? 16'h0811 :  // <0553> ram i = $ram_adc_chn_pending // i = av_write_data // start read cycle
addr == 16'h660 ? 16'h0812 :  // <0553> ram i = $ram_adc_chn_pending // i = av_read_data // finish read cycle
addr == 16'h661 ? 16'h4e00 :  // <0554> ram $ram_adc_chn_pending = 0 // av_ad_hi = 0
addr == 16'h662 ? 16'h5238 :  // <0554> ram $ram_adc_chn_pending = 0 // av_ad_lo = 56
addr == 16'h663 ? 16'h4600 :  // <0554> ram $ram_adc_chn_pending = 0 // av_write_data = 0
addr == 16'h664 ? 16'h0002 :  // <0555> a = i
addr == 16'h665 ? 16'h0410 :  // <0556> b = spi_data

addr == 16'h666 ? 16'h0351 :  // <0557> a = a<<1
addr == 16'h667 ? 16'h2001 :  // <0557> push b // push b
addr == 16'h668 ? 16'h0628 :  // <0557> b = 40
addr == 16'h669 ? 16'h4e00 :  // <0557> av_ad_hi = 0
addr == 16'h66a ? 16'h5300 :  // <0557> av_ad_lo = ad0
addr == 16'h66b ? 16'h4408 :  // <0557> pop av_write_data // pop av_write_data


addr == 16'h66c ? 16'h0002 :  // <0560> a = i
addr == 16'h66d ? 16'h0605 :  // <0560> b = 5


addr == 16'h66e ? 16'he407 :  // <0560> bn eq :else_1646
addr == 16'h66f ? 16'h0672 :  // <0560> "

addr == 16'h670 ? 16'he00f :  // <0560> event_return
addr == 16'h671 ? 16'h007e :  // <0560> "


// :else_1646 // = 0x0672

// :end_1646 // = 0x0672


addr == 16'h672 ? 16'h0002 :  // <0587> a = i
addr == 16'h673 ? 16'h0607 :  // <0587> b = 7


addr == 16'h674 ? 16'he407 :  // <0587> bn eq :else_1652
addr == 16'h675 ? 16'h06a7 :  // <0587> "

// report anmux reading.
addr == 16'h676 ? 16'h0010 :  // <0587> a = spi_data
addr == 16'h677 ? 16'hfba0 :  // <0587> call :put4x
addr == 16'h678 ? 16'h00b3 :  // <0587> "
addr == 16'h679 ? 16'hfc00 :  // <0587> "

// memorize anmux reading.
addr == 16'h67a ? 16'hfba0 :  // <0587> call :anmux_get_chn
addr == 16'h67b ? 16'h00a6 :  // <0587> "
addr == 16'h67c ? 16'hfc00 :  // <0587> "
addr == 16'h67d ? 16'h0410 :  // <0587> b = spi_data

addr == 16'h67e ? 16'h0351 :  // <0587> a = a<<1
addr == 16'h67f ? 16'h2001 :  // <0587> push b // push b
addr == 16'h680 ? 16'h0618 :  // <0587> b = 24
addr == 16'h681 ? 16'h4e00 :  // <0587> av_ad_hi = 0
addr == 16'h682 ? 16'h5300 :  // <0587> av_ad_lo = ad0
addr == 16'h683 ? 16'h4408 :  // <0587> pop av_write_data // pop av_write_data


// decrement anmux channel & start waiting again.
addr == 16'h684 ? 16'hfba0 :  // <0587> call :anmux_get_chn
addr == 16'h685 ? 16'h00a6 :  // <0587> "
addr == 16'h686 ? 16'hfc00 :  // <0587> "

addr == 16'h687 ? 16'h0000 :  // <0587> a = a
addr == 16'h688 ? 16'h0600 :  // <0587> b = 0


addr == 16'h689 ? 16'he007 :  // <0587> br eq :else_1673
addr == 16'h68a ? 16'h0694 :  // <0587> "

addr == 16'h68b ? 16'h0760 :  // <0587> b = -1
addr == 16'h68c ? 16'hc800 :  // <0587> a = a+b
addr == 16'h68d ? 16'h0300 :  // <0587> "
addr == 16'h68e ? 16'hfba0 :  // <0587> call :anmux_set_chn
addr == 16'h68f ? 16'h00a2 :  // <0587> "
addr == 16'h690 ? 16'hfc00 :  // <0587> "
addr == 16'h691 ? 16'h3a05 :  // <0587> mstimer1 = $anmux_settle_ms
addr == 16'h692 ? 16'he00f :  // <0587> event_return
addr == 16'h693 ? 16'h007e :  // <0587> "


// :else_1673 // = 0x0694

// :end_1673 // = 0x0694


// end of temperature daq pass.
addr == 16'h694 ? 16'hfba0 :  // <0587> call :report_plan
addr == 16'h695 ? 16'h07c9 :  // <0587> "
addr == 16'h696 ? 16'hfc00 :  // <0587> "
addr == 16'h697 ? 16'hfba0 :  // <0587> call :report_text_flags
addr == 16'h698 ? 16'h0799 :  // <0587> "
addr == 16'h699 ? 16'hfc00 :  // <0587> "
addr == 16'h69a ? 16'h020d :  // <0587> a = 13 // puteol
addr == 16'h69b ? 16'hfba0 :  // <0587> puteol
addr == 16'h69c ? 16'h008b :  // <0587> "
addr == 16'h69d ? 16'hfc00 :  // <0587> "
addr == 16'h69e ? 16'h020a :  // <0587> a = 10 // puteol
addr == 16'h69f ? 16'hfba0 :  // <0587> puteol
addr == 16'h6a0 ? 16'h008b :  // <0587> "
addr == 16'h6a1 ? 16'hfc00 :  // <0587> "
addr == 16'h6a2 ? 16'h4e00 :  // <0587> ram $ram_dial_setting = spi_data // av_ad_hi = 0
addr == 16'h6a3 ? 16'h5246 :  // <0587> ram $ram_dial_setting = spi_data // av_ad_lo = 70
addr == 16'h6a4 ? 16'h4410 :  // <0587> ram $ram_dial_setting = spi_data // av_write_data = spi_data
addr == 16'h6a5 ? 16'he00f :  // <0587> event_return
addr == 16'h6a6 ? 16'h007e :  // <0587> "


// :else_1652 // = 0x06a7

// :end_1652 // = 0x06a7

addr == 16'h6a7 ? 16'he00f :  // <0588> end_event
addr == 16'h6a8 ? 16'h007e :  // <0588> "

// ######## event power_lost_handler // = 0x06a9
// at this time we have less than 2 ms of usable run time left.

// this must be an uncommanded loss of main power, because if it was commanded,
// no more events would be handled; this event handler wouldn't have a chance to run.
// immediately set the power relay PWM to full power for a few seconds,
// in case the power relay opened accidentally e.g. due to a hard pothole.
addr == 16'h6a9 ? 16'h6a00 :  // <0597> power_duty = $power_duty_closing
addr == 16'h6aa ? 16'h4e00 :  // <0598> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h6ab ? 16'h5214 :  // <0598> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h6ac ? 16'h0011 :  // <0598> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h6ad ? 16'h0012 :  // <0598> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h6ae ? 16'h0602 :  // <0599> b = $relay_hold_passes
addr == 16'h6af ? 16'h4e00 :  // <0600> ram $ram_relay_hold_at_pass = a+b // av_ad_hi = 0
addr == 16'h6b0 ? 16'h523e :  // <0600> ram $ram_relay_hold_at_pass = a+b // av_ad_lo = 62
addr == 16'h6b1 ? 16'hc800 :  // <0600> ram $ram_relay_hold_at_pass = a+b // av_write_data = a+b
addr == 16'h6b2 ? 16'h4700 :  // <0600> "

// pause any non-vital power-hogging operations, to conserve power for the EEPROM write.

// save persistent data in case the power remains down e.g. due to battery disconnect.
addr == 16'h6b3 ? 16'hfba0 :  // <0605> call :save_persistent_data
addr == 16'h6b4 ? 16'h0721 :  // <0605> "
addr == 16'h6b5 ? 16'hfc00 :  // <0605> "
addr == 16'h6b6 ? 16'he00f :  // <0606> end_event
addr == 16'h6b7 ? 16'h007e :  // <0606> "

// :ign_off_msg // = 0x06b8
// "IGOF\x0"
addr == 16'h6b8 ? 16'h4749 :  // <0609> GI
addr == 16'h6b9 ? 16'h464f :  // <0609> FO
addr == 16'h6ba ? 16'h0000 :  // <0609>   

// ######## event ign_switch_off_handler // = 0x06bb
// set power-down deadline in RAM.  this makes the system remain powered for several more minutes, for cooldown data logging.
addr == 16'h6bb ? 16'h4e00 :  // <0613> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h6bc ? 16'h5240 :  // <0613> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'h6bd ? 16'h0011 :  // <0613> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h6be ? 16'h0012 :  // <0613> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h6bf ? 16'h060a :  // <0614> b = $power_extend_minutes
addr == 16'h6c0 ? 16'h4e00 :  // <0615> ram $ram_power_down_at_min = a+b // av_ad_hi = 0
addr == 16'h6c1 ? 16'h523c :  // <0615> ram $ram_power_down_at_min = a+b // av_ad_lo = 60
addr == 16'h6c2 ? 16'hc800 :  // <0615> ram $ram_power_down_at_min = a+b // av_write_data = a+b
addr == 16'h6c3 ? 16'h4700 :  // <0615> "
addr == 16'h6c4 ? 16'h03a0 :  // <0616> a = :ign_off_msg
addr == 16'h6c5 ? 16'h06b8 :  // <0616> "
addr == 16'h6c6 ? 16'hfba0 :  // <0617> call :set_text_flag
addr == 16'h6c7 ? 16'h0780 :  // <0617> "
addr == 16'h6c8 ? 16'hfc00 :  // <0617> "
addr == 16'h6c9 ? 16'he00f :  // <0618> end_event
addr == 16'h6ca ? 16'h007e :  // <0618> "

// :ign_on_msg // = 0x06cb
// "IGON\x0"
addr == 16'h6cb ? 16'h4749 :  // <0621> GI
addr == 16'h6cc ? 16'h4e4f :  // <0621> NO
addr == 16'h6cd ? 16'h0000 :  // <0621>   

// ######## event ign_switch_on_handler // = 0x06ce
addr == 16'h6ce ? 16'h4e00 :  // <0624> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h6cf ? 16'h523c :  // <0624> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 60
addr == 16'h6d0 ? 16'h4760 :  // <0624> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h6d1 ? 16'h03a0 :  // <0625> a = :ign_on_msg
addr == 16'h6d2 ? 16'h06cb :  // <0625> "
addr == 16'h6d3 ? 16'hfba0 :  // <0626> call :set_text_flag
addr == 16'h6d4 ? 16'h0780 :  // <0626> "
addr == 16'h6d5 ? 16'hfc00 :  // <0626> "
addr == 16'h6d6 ? 16'he00f :  // <0627> end_event
addr == 16'h6d7 ? 16'h007e :  // <0627> "

// ######## event puff1_done_handler // = 0x06d8
// puff just finished.  set length of next puff.
addr == 16'h6d8 ? 16'h4e00 :  // <0631> ram puff_len_us = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'h6d9 ? 16'h5292 :  // <0631> ram puff_len_us = $ram_next_puff_len_us // av_ad_lo = 146
addr == 16'h6da ? 16'h7411 :  // <0631> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_write_data // start read cycle
addr == 16'h6db ? 16'h7412 :  // <0631> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_read_data // finish read cycle

// count puffs.
addr == 16'h6dc ? 16'h4e00 :  // <0634> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h6dd ? 16'h5294 :  // <0634> ram a = $ram_puff_count // av_ad_lo = 148
addr == 16'h6de ? 16'h0011 :  // <0634> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h6df ? 16'h0012 :  // <0634> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h6e0 ? 16'h0601 :  // <0635> b = 1
addr == 16'h6e1 ? 16'h4e00 :  // <0636> ram $ram_puff_count = a+b // av_ad_hi = 0
addr == 16'h6e2 ? 16'h5294 :  // <0636> ram $ram_puff_count = a+b // av_ad_lo = 148
addr == 16'h6e3 ? 16'hc800 :  // <0636> ram $ram_puff_count = a+b // av_write_data = a+b
addr == 16'h6e4 ? 16'h4700 :  // <0636> "

// hack to set puff length strictly by a hard-wired knob.
// ram a = $ram_dial_setting
// a = a<<1
// a = a<<1
// a = a<<1
// bn az :nonzero
// a = 1
// :nonzero
// puff_len_us = a
addr == 16'h6e5 ? 16'he00f :  // <0647> end_event
addr == 16'h6e6 ? 16'h007e :  // <0647> "

// ######## func minute_events // = 0x06e7
addr == 16'h6e7 ? 16'h203e :  // <0649> push rtna // func minute_events
addr == 16'h6e8 ? 16'hfba0 :  // <0650> call :check_power_down
addr == 16'h6e9 ? 16'h0704 :  // <0650> "
addr == 16'h6ea ? 16'hfc00 :  // <0650> "
addr == 16'h6eb ? 16'hf808 :  // <0651> pop rtna // end_func
addr == 16'h6ec ? 16'hfc00 :  // <0651> swapra = nop

// :power_hold_msg // = 0x06ed
// "PWH\x0"
addr == 16'h6ed ? 16'h5750 :  // <0654> WP
addr == 16'h6ee ? 16'h0048 :  // <0654>  H

// ######## func check_power_relay // = 0x06ef
addr == 16'h6ef ? 16'h203e :  // <0656> push rtna // func check_power_relay
addr == 16'h6f0 ? 16'h4e00 :  // <0657> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h6f1 ? 16'h5214 :  // <0657> ram a = $ram_daq_pass_cnt // av_ad_lo = 20
addr == 16'h6f2 ? 16'h0011 :  // <0657> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h6f3 ? 16'h0012 :  // <0657> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h6f4 ? 16'h4e00 :  // <0658> ram b = $ram_relay_hold_at_pass // av_ad_hi = 0
addr == 16'h6f5 ? 16'h523e :  // <0658> ram b = $ram_relay_hold_at_pass // av_ad_lo = 62
addr == 16'h6f6 ? 16'h0411 :  // <0658> ram b = $ram_relay_hold_at_pass // b = av_write_data // start read cycle
addr == 16'h6f7 ? 16'h0412 :  // <0658> ram b = $ram_relay_hold_at_pass // b = av_read_data // finish read cycle

addr == 16'h6f8 ? 16'h0000 :  // <0664> a = a
addr == 16'h6f9 ? 16'h0401 :  // <0664> b = b


addr == 16'h6fa ? 16'he407 :  // <0664> bn eq :else_1786
addr == 16'h6fb ? 16'h0702 :  // <0664> "

// time to begin "solenoid saver" coil power reduction by PWM.
addr == 16'h6fc ? 16'h6a19 :  // <0664> power_duty = $power_duty_holding
addr == 16'h6fd ? 16'h03a0 :  // <0664> a = :power_hold_msg
addr == 16'h6fe ? 16'h06ed :  // <0664> "
addr == 16'h6ff ? 16'hfba0 :  // <0664> call :set_text_flag
addr == 16'h700 ? 16'h0780 :  // <0664> "
addr == 16'h701 ? 16'hfc00 :  // <0664> "


// :else_1786 // = 0x0702

// :end_1786 // = 0x0702

addr == 16'h702 ? 16'hf808 :  // <0665> pop rtna // end_func
addr == 16'h703 ? 16'hfc00 :  // <0665> swapra = nop

// ######## func check_power_down // = 0x0704
addr == 16'h704 ? 16'h203e :  // <0667> push rtna // func check_power_down
// check power-down deadline in RAM.
addr == 16'h705 ? 16'h4e00 :  // <0669> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h706 ? 16'h5240 :  // <0669> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'h707 ? 16'h0011 :  // <0669> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h708 ? 16'h0012 :  // <0669> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h709 ? 16'h4e00 :  // <0670> ram b = $ram_power_down_at_min // av_ad_hi = 0
addr == 16'h70a ? 16'h523c :  // <0670> ram b = $ram_power_down_at_min // av_ad_lo = 60
addr == 16'h70b ? 16'h0411 :  // <0670> ram b = $ram_power_down_at_min // b = av_write_data // start read cycle
addr == 16'h70c ? 16'h0412 :  // <0670> ram b = $ram_power_down_at_min // b = av_read_data // finish read cycle

addr == 16'h70d ? 16'h0000 :  // <0673> a = a
addr == 16'h70e ? 16'h0401 :  // <0673> b = b


addr == 16'h70f ? 16'he407 :  // <0673> bn eq :else_1807
addr == 16'h710 ? 16'h0714 :  // <0673> "

addr == 16'h711 ? 16'hfba0 :  // <0673> call :power_down
addr == 16'h712 ? 16'h0716 :  // <0673> "
addr == 16'h713 ? 16'hfc00 :  // <0673> "


// :else_1807 // = 0x0714

// :end_1807 // = 0x0714

addr == 16'h714 ? 16'hf808 :  // <0674> pop rtna // end_func
addr == 16'h715 ? 16'hfc00 :  // <0674> swapra = nop

// ######## func power_down // = 0x0716
addr == 16'h716 ? 16'h203e :  // <0676> push rtna // func power_down
// this function never returns.
addr == 16'h717 ? 16'hfba0 :  // <0678> call :save_persistent_data
addr == 16'h718 ? 16'h0721 :  // <0678> "
addr == 16'h719 ? 16'hfc00 :  // <0678> "
addr == 16'h71a ? 16'h6a32 :  // <0679> power_duty = $power_duty_opening
addr == 16'h71b ? 16'h5fa0 :  // <0680> error_halt_code $err_power_down // leds = 0xfffc
addr == 16'h71c ? 16'hfffc :  // <0680> "
addr == 16'h71d ? 16'he00f :  // <0680> error_halt_code $err_power_down
addr == 16'h71e ? 16'h071d :  // <0680> "
addr == 16'h71f ? 16'hf808 :  // <0681> pop rtna // end_func
addr == 16'h720 ? 16'hfc00 :  // <0681> swapra = nop

// ######## func save_persistent_data // = 0x0721
addr == 16'h721 ? 16'hfc00 :  // <0684> swapra = nop

// ######## func check_communication // = 0x0722
addr == 16'h722 ? 16'h203e :  // <0686> push rtna // func check_communication
addr == 16'h723 ? 16'h4e00 :  // <0687> ram a = $ram_ftdi_downtime_remain_sec // av_ad_hi = 0
addr == 16'h724 ? 16'h5212 :  // <0687> ram a = $ram_ftdi_downtime_remain_sec // av_ad_lo = 18
addr == 16'h725 ? 16'h0011 :  // <0687> ram a = $ram_ftdi_downtime_remain_sec // a = av_write_data // start read cycle
addr == 16'h726 ? 16'h0012 :  // <0687> ram a = $ram_ftdi_downtime_remain_sec // a = av_read_data // finish read cycle

addr == 16'h727 ? 16'h0000 :  // <0695> a = a
addr == 16'h728 ? 16'h0600 :  // <0695> b = 0


addr == 16'h729 ? 16'he007 :  // <0695> br eq :else_1833
addr == 16'h72a ? 16'h0738 :  // <0695> "

addr == 16'h72b ? 16'h0760 :  // <0695> b = -1
addr == 16'h72c ? 16'hc800 :  // <0695> a = a+b
addr == 16'h72d ? 16'h0300 :  // <0695> "
addr == 16'h72e ? 16'h4e00 :  // <0695> ram $ram_ftdi_downtime_remain_sec = a // av_ad_hi = 0
addr == 16'h72f ? 16'h5212 :  // <0695> ram $ram_ftdi_downtime_remain_sec = a // av_ad_lo = 18
addr == 16'h730 ? 16'h4400 :  // <0695> ram $ram_ftdi_downtime_remain_sec = a // av_write_data = a

addr == 16'h731 ? 16'h0000 :  // <0695> a = a
addr == 16'h732 ? 16'h0600 :  // <0695> b = 0


addr == 16'h733 ? 16'he407 :  // <0695> bn eq :else_1843
addr == 16'h734 ? 16'h0738 :  // <0695> "

addr == 16'h735 ? 16'hfba0 :  // <0695> call :ftdi_power_on
addr == 16'h736 ? 16'h076c :  // <0695> "
addr == 16'h737 ? 16'hfc00 :  // <0695> "


// :else_1843 // = 0x0738

// :end_1843 // = 0x0738



// :else_1833 // = 0x0738

// :end_1833 // = 0x0738


addr == 16'h738 ? 16'h4e00 :  // <0697> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h739 ? 16'h5240 :  // <0697> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'h73a ? 16'h0011 :  // <0697> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h73b ? 16'h0012 :  // <0697> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h73c ? 16'h4e00 :  // <0698> ram b = $ram_comm_restart_at_min // av_ad_hi = 0
addr == 16'h73d ? 16'h5210 :  // <0698> ram b = $ram_comm_restart_at_min // av_ad_lo = 16
addr == 16'h73e ? 16'h0411 :  // <0698> ram b = $ram_comm_restart_at_min // b = av_write_data // start read cycle
addr == 16'h73f ? 16'h0412 :  // <0698> ram b = $ram_comm_restart_at_min // b = av_read_data // finish read cycle

addr == 16'h740 ? 16'h0000 :  // <0704> a = a
addr == 16'h741 ? 16'h0401 :  // <0704> b = b


addr == 16'h742 ? 16'he407 :  // <0704> bn eq :else_1858
addr == 16'h743 ? 16'h074d :  // <0704> "

// comm restart is required.
addr == 16'h744 ? 16'hfba0 :  // <0704> call :postpone_comm_restart
addr == 16'h745 ? 16'h074f :  // <0704> "
addr == 16'h746 ? 16'hfc00 :  // <0704> "
addr == 16'h747 ? 16'h4e00 :  // <0704> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_hi = 0
addr == 16'h748 ? 16'h5212 :  // <0704> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_lo = 18
addr == 16'h749 ? 16'h4605 :  // <0704> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_write_data = 5
addr == 16'h74a ? 16'hfba0 :  // <0704> call :ftdi_power_off
addr == 16'h74b ? 16'h075c :  // <0704> "
addr == 16'h74c ? 16'hfc00 :  // <0704> "


// :else_1858 // = 0x074d

// :end_1858 // = 0x074d

addr == 16'h74d ? 16'hf808 :  // <0705> pop rtna // end_func
addr == 16'h74e ? 16'hfc00 :  // <0705> swapra = nop

// ######## func postpone_comm_restart // = 0x074f
addr == 16'h74f ? 16'h4e00 :  // <0708> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h750 ? 16'h5240 :  // <0708> ram a = $ram_minutes_cnt // av_ad_lo = 64
addr == 16'h751 ? 16'h0011 :  // <0708> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h752 ? 16'h0012 :  // <0708> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h753 ? 16'h0602 :  // <0709> b = $comm_grace_period_min
addr == 16'h754 ? 16'h4e00 :  // <0710> ram $ram_comm_restart_at_min = a+b // av_ad_hi = 0
addr == 16'h755 ? 16'h5210 :  // <0710> ram $ram_comm_restart_at_min = a+b // av_ad_lo = 16
addr == 16'h756 ? 16'hc800 :  // <0710> ram $ram_comm_restart_at_min = a+b // av_write_data = a+b
addr == 16'h757 ? 16'h4700 :  // <0710> "
addr == 16'h758 ? 16'hfc00 :  // <0711> swapra = nop

// :ftdi_off_msg // = 0x0759
// "FTOF\x0"
addr == 16'h759 ? 16'h5446 :  // <0714> TF
addr == 16'h75a ? 16'h464f :  // <0714> FO
addr == 16'h75b ? 16'h0000 :  // <0714>   

// ######## func ftdi_power_off // = 0x075c
addr == 16'h75c ? 16'h203e :  // <0716> push rtna // func ftdi_power_off
addr == 16'h75d ? 16'h0018 :  // <0717> a = board_ctrl
addr == 16'h75e ? 16'h07a0 :  // <0718> b = $not_ftdi_power_mask
addr == 16'h75f ? 16'hff7f :  // <0718> "
addr == 16'h760 ? 16'hc800 :  // <0719> board_ctrl = and
addr == 16'h761 ? 16'h6330 :  // <0719> "
addr == 16'h762 ? 16'h03a0 :  // <0720> a = :ftdi_off_msg
addr == 16'h763 ? 16'h0759 :  // <0720> "
addr == 16'h764 ? 16'hfba0 :  // <0721> call :set_text_flag
addr == 16'h765 ? 16'h0780 :  // <0721> "
addr == 16'h766 ? 16'hfc00 :  // <0721> "
addr == 16'h767 ? 16'hf808 :  // <0722> pop rtna // end_func
addr == 16'h768 ? 16'hfc00 :  // <0722> swapra = nop

// :ftdi_on_msg // = 0x0769
// "FTON\x0"
addr == 16'h769 ? 16'h5446 :  // <0725> TF
addr == 16'h76a ? 16'h4e4f :  // <0725> NO
addr == 16'h76b ? 16'h0000 :  // <0725>   

// ######## func ftdi_power_on // = 0x076c
addr == 16'h76c ? 16'h203e :  // <0727> push rtna // func ftdi_power_on
addr == 16'h76d ? 16'h0018 :  // <0728> a = board_ctrl
addr == 16'h76e ? 16'h0680 :  // <0729> b = $ftdi_power_mask
addr == 16'h76f ? 16'hc800 :  // <0730> board_ctrl = or
addr == 16'h770 ? 16'h6334 :  // <0730> "
addr == 16'h771 ? 16'h03a0 :  // <0731> a = :ftdi_on_msg
addr == 16'h772 ? 16'h0769 :  // <0731> "
addr == 16'h773 ? 16'hfba0 :  // <0732> call :set_text_flag
addr == 16'h774 ? 16'h0780 :  // <0732> "
addr == 16'h775 ? 16'hfc00 :  // <0732> "
addr == 16'h776 ? 16'hf808 :  // <0733> pop rtna // end_func
addr == 16'h777 ? 16'hfc00 :  // <0733> swapra = nop

// ######## func clear_ram_page // = 0x0778
// pass the page to be cleared in av_ad_hi.
addr == 16'h778 ? 16'h0200 :  // <0737> a = 0
addr == 16'h779 ? 16'h0602 :  // <0738> b = 2
// :clear_next_word // = 0x077a
addr == 16'h77a ? 16'h5000 :  // <0740> av_ad_lo = a
addr == 16'h77b ? 16'h4600 :  // <0741> av_write_data = 0
addr == 16'h77c ? 16'h0300 :  // <0742> a = ad0
addr == 16'h77d ? 16'he400 :  // <0743> bn az :clear_next_word
addr == 16'h77e ? 16'h077a :  // <0743> "
addr == 16'h77f ? 16'hfc00 :  // <0744> swapra = nop

// ######## func set_text_flag // = 0x0780
addr == 16'h780 ? 16'h0400 :  // <0747> b = a
addr == 16'h781 ? 16'h4e00 :  // <0748> ram a = $ram_next_tfp_idx // av_ad_hi = 0
addr == 16'h782 ? 16'h5258 :  // <0748> ram a = $ram_next_tfp_idx // av_ad_lo = 88
addr == 16'h783 ? 16'h0011 :  // <0748> ram a = $ram_next_tfp_idx // a = av_write_data // start read cycle
addr == 16'h784 ? 16'h0012 :  // <0748> ram a = $ram_next_tfp_idx // a = av_read_data // finish read cycle
addr == 16'h785 ? 16'h2000 :  // <0749> push a // push a

addr == 16'h786 ? 16'h0351 :  // <0750> a = a<<1
addr == 16'h787 ? 16'h2001 :  // <0750> push b // push b
addr == 16'h788 ? 16'h0648 :  // <0750> b = 72
addr == 16'h789 ? 16'h4e00 :  // <0750> av_ad_hi = 0
addr == 16'h78a ? 16'h5300 :  // <0750> av_ad_lo = ad0
addr == 16'h78b ? 16'h4408 :  // <0750> pop av_write_data // pop av_write_data

addr == 16'h78c ? 16'h0008 :  // <0751> pop a // pop a
addr == 16'h78d ? 16'h0760 :  // <0752> b = -1
addr == 16'h78e ? 16'hc800 :  // <0753> a = a+b
addr == 16'h78f ? 16'h0300 :  // <0753> "
addr == 16'h790 ? 16'h0607 :  // <0754> b = $tfp_mask
addr == 16'h791 ? 16'h4e00 :  // <0755> ram $ram_next_tfp_idx = and // av_ad_hi = 0
addr == 16'h792 ? 16'h5258 :  // <0755> ram $ram_next_tfp_idx = and // av_ad_lo = 88
addr == 16'h793 ? 16'hc800 :  // <0755> ram $ram_next_tfp_idx = and // av_write_data = and
addr == 16'h794 ? 16'h4730 :  // <0755> "
addr == 16'h795 ? 16'hfc00 :  // <0756> swapra = nop

// :text_flags_msg // = 0x0796
// " tf=\x0"
addr == 16'h796 ? 16'h7420 :  // <0759> t 
addr == 16'h797 ? 16'h3d66 :  // <0759> =f
addr == 16'h798 ? 16'h0000 :  // <0759>   

// ######## func report_text_flags // = 0x0799
addr == 16'h799 ? 16'h2002 :  // <0761> push i // func report_text_flags
addr == 16'h79a ? 16'h203e :  // <0761> push rtna // "
addr == 16'h79b ? 16'h03a0 :  // <0762> a = :text_flags_msg
addr == 16'h79c ? 16'h0796 :  // <0762> "
addr == 16'h79d ? 16'hfba0 :  // <0763> call :print_nt
addr == 16'h79e ? 16'h013f :  // <0763> "
addr == 16'h79f ? 16'hfc00 :  // <0763> "
addr == 16'h7a0 ? 16'h0a00 :  // <0774> i = 0
// :loop_1952 // = 0x07a1

addr == 16'h7a1 ? 16'h0002 :  // <0774> a = i

addr == 16'h7a2 ? 16'h0351 :  // <0774> a = a<<1
addr == 16'h7a3 ? 16'h0648 :  // <0774> b = 72
addr == 16'h7a4 ? 16'h4e00 :  // <0774> av_ad_hi = 0
addr == 16'h7a5 ? 16'h5300 :  // <0774> av_ad_lo = ad0
addr == 16'h7a6 ? 16'h0411 :  // <0774> b = av_write_data
addr == 16'h7a7 ? 16'h0412 :  // <0774> b = av_read_data


addr == 16'h7a8 ? 16'h0001 :  // <0774> a = b
addr == 16'h7a9 ? 16'h0600 :  // <0774> b = 0


addr == 16'h7aa ? 16'he007 :  // <0774> br eq :else_1962
addr == 16'h7ab ? 16'h07bb :  // <0774> "

addr == 16'h7ac ? 16'hfba0 :  // <0774> call :print_nt
addr == 16'h7ad ? 16'h013f :  // <0774> "
addr == 16'h7ae ? 16'hfc00 :  // <0774> "
addr == 16'h7af ? 16'h022c :  // <0774> a = 44 // putasc ","
addr == 16'h7b0 ? 16'hfba0 :  // <0774> putasc ","
addr == 16'h7b1 ? 16'h008b :  // <0774> "
addr == 16'h7b2 ? 16'hfc00 :  // <0774> "
addr == 16'h7b3 ? 16'h0002 :  // <0774> a = i
addr == 16'h7b4 ? 16'h0600 :  // <0774> b = 0

addr == 16'h7b5 ? 16'h0351 :  // <0774> a = a<<1
addr == 16'h7b6 ? 16'h2001 :  // <0774> push b // push b
addr == 16'h7b7 ? 16'h0648 :  // <0774> b = 72
addr == 16'h7b8 ? 16'h4e00 :  // <0774> av_ad_hi = 0
addr == 16'h7b9 ? 16'h5300 :  // <0774> av_ad_lo = ad0
addr == 16'h7ba ? 16'h4408 :  // <0774> pop av_write_data // pop av_write_data



// :else_1962 // = 0x07bb

// :end_1962 // = 0x07bb



addr == 16'h7bb ? 16'h0002 :  // <0774> a = i
addr == 16'h7bc ? 16'h0601 :  // <0774> b = 1
addr == 16'h7bd ? 16'hc800 :  // <0774> i = a+b
addr == 16'h7be ? 16'h0b00 :  // <0774> "


addr == 16'h7bf ? 16'h0002 :  // <0774> a = i
addr == 16'h7c0 ? 16'h0608 :  // <0774> b = $num_text_flag_pointers
addr == 16'h7c1 ? 16'he005 :  // <0774> br lt :loop_1952
addr == 16'h7c2 ? 16'h07a1 :  // <0774> "

// :end_1952 // = 0x07c3
addr == 16'h7c3 ? 16'hf808 :  // <0775> pop rtna // end_func
addr == 16'h7c4 ? 16'h0808 :  // <0775> pop i // "
addr == 16'h7c5 ? 16'hfc00 :  // <0775> swapra = nop

// :plan_msg // = 0x07c6
// " pl=\x0"
addr == 16'h7c6 ? 16'h7020 :  // <0778> p 
addr == 16'h7c7 ? 16'h3d6c :  // <0778> =l
addr == 16'h7c8 ? 16'h0000 :  // <0778>   

// ######## func report_plan // = 0x07c9
addr == 16'h7c9 ? 16'h203e :  // <0780> push rtna // func report_plan
addr == 16'h7ca ? 16'h03a0 :  // <0781> a = :plan_msg
addr == 16'h7cb ? 16'h07c6 :  // <0781> "
addr == 16'h7cc ? 16'hfba0 :  // <0782> call :print_nt
addr == 16'h7cd ? 16'h013f :  // <0782> "
addr == 16'h7ce ? 16'hfc00 :  // <0782> "
addr == 16'h7cf ? 16'h4e00 :  // <0783> ram a = $ram_plan_name // av_ad_hi = 0
addr == 16'h7d0 ? 16'h528a :  // <0783> ram a = $ram_plan_name // av_ad_lo = 138
addr == 16'h7d1 ? 16'h0011 :  // <0783> ram a = $ram_plan_name // a = av_write_data // start read cycle
addr == 16'h7d2 ? 16'h0012 :  // <0783> ram a = $ram_plan_name // a = av_read_data // finish read cycle
addr == 16'h7d3 ? 16'hfba0 :  // <0784> call :print_nt
addr == 16'h7d4 ? 16'h013f :  // <0784> "
addr == 16'h7d5 ? 16'hfc00 :  // <0784> "
addr == 16'h7d6 ? 16'hf808 :  // <0785> pop rtna // end_func
addr == 16'h7d7 ? 16'hfc00 :  // <0785> swapra = nop

// ######## func jf_to_rpm // = 0x07d8
addr == 16'h7d8 ? 16'h203e :  // <0787> push rtna // func jf_to_rpm
// pass jiffies in a.  return rpm in a.
// resolution = 32 rpm.
addr == 16'h7d9 ? 16'h0400 :  // <0790> b = a
addr == 16'h7da ? 16'h03a0 :  // <0791> a = 0x5573
addr == 16'h7db ? 16'h5573 :  // <0791> "
// = 700000 >> 5
addr == 16'h7dc ? 16'hfba0 :  // <0793> call :divide
addr == 16'h7dd ? 16'h017c :  // <0793> "
addr == 16'h7de ? 16'hfc00 :  // <0793> "
addr == 16'h7df ? 16'h0001 :  // <0794> a = b
addr == 16'h7e0 ? 16'h0352 :  // <0795> a = a<<4
addr == 16'h7e1 ? 16'h0351 :  // <0796> a = a<<1
addr == 16'h7e2 ? 16'hf808 :  // <0797> pop rtna // end_func
addr == 16'h7e3 ? 16'hfc00 :  // <0797> swapra = nop

// ######## func check_engine_stop // = 0x07e4
addr == 16'h7e4 ? 16'h203e :  // <0799> push rtna // func check_engine_stop
// returns a=1 if transitioned to stop, else a=0.

// transition to plan_stop if ignition switch is turned off AND rpm estimate is invalid.
// requiring both conditions prevents spurious noise readings from shutting down the injection.

addr == 16'h7e5 ? 16'h001a :  // <0813> a = power_duty
addr == 16'h7e6 ? 16'h0680 :  // <0813> b = ( 0x0080 )


addr == 16'h7e7 ? 16'he003 :  // <0813> br and0z :else_2023
addr == 16'h7e8 ? 16'h07fc :  // <0813> "

addr == 16'h7e9 ? 16'h4e00 :  // <0813> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h7ea ? 16'h5280 :  // <0813> ram a = $ram_rpm_valid // av_ad_lo = 128
addr == 16'h7eb ? 16'h0011 :  // <0813> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h7ec ? 16'h0012 :  // <0813> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle

addr == 16'h7ed ? 16'h0000 :  // <0813> a = a
addr == 16'h7ee ? 16'h0600 :  // <0813> b = 0


addr == 16'h7ef ? 16'he407 :  // <0813> bn eq :else_2031
addr == 16'h7f0 ? 16'h07fc :  // <0813> "

addr == 16'h7f1 ? 16'h4e00 :  // <0813> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h7f2 ? 16'h5290 :  // <0813> ram rtna = $ram_destroy_plan_func // av_ad_lo = 144
addr == 16'h7f3 ? 16'hf811 :  // <0813> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h7f4 ? 16'hf812 :  // <0813> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h7f5 ? 16'hfc00 :  // <0813> swapra = nop
addr == 16'h7f6 ? 16'hfba0 :  // <0813> call :init_plan_stop
addr == 16'h7f7 ? 16'h02e2 :  // <0813> "
addr == 16'h7f8 ? 16'hfc00 :  // <0813> "
addr == 16'h7f9 ? 16'h0201 :  // <0813> a = 1
addr == 16'h7fa ? 16'hf808 :  // <0813> pop rtna // rtn
addr == 16'h7fb ? 16'hfc00 :  // <0813> swapra = nop


// :else_2031 // = 0x07fc

// :end_2031 // = 0x07fc



// :else_2023 // = 0x07fc

// :end_2023 // = 0x07fc

addr == 16'h7fc ? 16'h0200 :  // <0814> a = 0
addr == 16'h7fd ? 16'hf808 :  // <0815> pop rtna // end_func
addr == 16'h7fe ? 16'hfc00 :  // <0815> swapra = nop


        
                16'hxxxx;
        endmodule
    
