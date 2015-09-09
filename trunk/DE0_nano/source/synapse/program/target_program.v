
        `include "header.v"

        module target_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.

addr == 16'h00 ? 16'he00f :  // <0004> jmp :main
addr == 16'h01 ? 16'h0306 :  // <0004> "


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

addr == 16'h02 ? 16'h001e :  // <0171> emit_debugger_register_table  counter
// "       a"
addr == 16'h03 ? 16'h2020 :  // <0171>   
addr == 16'h04 ? 16'h2020 :  // <0171>   
addr == 16'h05 ? 16'h2020 :  // <0171>   
addr == 16'h06 ? 16'h6120 :  // <0171> a 
// "       b"
addr == 16'h07 ? 16'h2020 :  // <0171>   
addr == 16'h08 ? 16'h2020 :  // <0171>   
addr == 16'h09 ? 16'h2020 :  // <0171>   
addr == 16'h0a ? 16'h6220 :  // <0171> b 
// "       i"
addr == 16'h0b ? 16'h2020 :  // <0171>   
addr == 16'h0c ? 16'h2020 :  // <0171>   
addr == 16'h0d ? 16'h2020 :  // <0171>   
addr == 16'h0e ? 16'h6920 :  // <0171> i 
// "       j"
addr == 16'h0f ? 16'h2020 :  // <0171>   
addr == 16'h10 ? 16'h2020 :  // <0171>   
addr == 16'h11 ? 16'h2020 :  // <0171>   
addr == 16'h12 ? 16'h6a20 :  // <0171> j 
// "       x"
addr == 16'h13 ? 16'h2020 :  // <0171>   
addr == 16'h14 ? 16'h2020 :  // <0171>   
addr == 16'h15 ? 16'h2020 :  // <0171>   
addr == 16'h16 ? 16'h7820 :  // <0171> x 
// "       y"
addr == 16'h17 ? 16'h2020 :  // <0171>   
addr == 16'h18 ? 16'h2020 :  // <0171>   
addr == 16'h19 ? 16'h2020 :  // <0171>   
addr == 16'h1a ? 16'h7920 :  // <0171> y 
// "      g6"
addr == 16'h1b ? 16'h2020 :  // <0171>   
addr == 16'h1c ? 16'h2020 :  // <0171>   
addr == 16'h1d ? 16'h2020 :  // <0171>   
addr == 16'h1e ? 16'h3667 :  // <0171> 6g
// "      g7"
addr == 16'h1f ? 16'h2020 :  // <0171>   
addr == 16'h20 ? 16'h2020 :  // <0171>   
addr == 16'h21 ? 16'h2020 :  // <0171>   
addr == 16'h22 ? 16'h3767 :  // <0171> 7g
// "//rstk  "
addr == 16'h23 ? 16'h2f2f :  // <0171> //
addr == 16'h24 ? 16'h7372 :  // <0171> sr
addr == 16'h25 ? 16'h6b74 :  // <0171> kt
addr == 16'h26 ? 16'h2020 :  // <0171>   
// "  ev_pri"
addr == 16'h27 ? 16'h2020 :  // <0171>   
addr == 16'h28 ? 16'h7665 :  // <0171> ve
addr == 16'h29 ? 16'h705f :  // <0171> p_
addr == 16'h2a ? 16'h6972 :  // <0171> ir
// "softevnt"
addr == 16'h2b ? 16'h6f73 :  // <0171> os
addr == 16'h2c ? 16'h7466 :  // <0171> tf
addr == 16'h2d ? 16'h7665 :  // <0171> ve
addr == 16'h2e ? 16'h746e :  // <0171> tn
// "   usage"
addr == 16'h2f ? 16'h2020 :  // <0171>   
addr == 16'h30 ? 16'h7520 :  // <0171> u 
addr == 16'h31 ? 16'h6173 :  // <0171> as
addr == 16'h32 ? 16'h6567 :  // <0171> eg
// "ustimer0"
addr == 16'h33 ? 16'h7375 :  // <0171> su
addr == 16'h34 ? 16'h6974 :  // <0171> it
addr == 16'h35 ? 16'h656d :  // <0171> em
addr == 16'h36 ? 16'h3072 :  // <0171> 0r
// "mstimer0"
addr == 16'h37 ? 16'h736d :  // <0171> sm
addr == 16'h38 ? 16'h6974 :  // <0171> it
addr == 16'h39 ? 16'h656d :  // <0171> em
addr == 16'h3a ? 16'h3072 :  // <0171> 0r
// "mstimer1"
addr == 16'h3b ? 16'h736d :  // <0171> sm
addr == 16'h3c ? 16'h6974 :  // <0171> it
addr == 16'h3d ? 16'h656d :  // <0171> em
addr == 16'h3e ? 16'h3172 :  // <0171> 1r
// "mstimer2"
addr == 16'h3f ? 16'h736d :  // <0171> sm
addr == 16'h40 ? 16'h6974 :  // <0171> it
addr == 16'h41 ? 16'h656d :  // <0171> em
addr == 16'h42 ? 16'h3272 :  // <0171> 2r
// "spi_data"
addr == 16'h43 ? 16'h7073 :  // <0171> ps
addr == 16'h44 ? 16'h5f69 :  // <0171> _i
addr == 16'h45 ? 16'h6164 :  // <0171> ad
addr == 16'h46 ? 16'h6174 :  // <0171> at
// "//avwrdt"
addr == 16'h47 ? 16'h2f2f :  // <0171> //
addr == 16'h48 ? 16'h7661 :  // <0171> va
addr == 16'h49 ? 16'h7277 :  // <0171> rw
addr == 16'h4a ? 16'h7464 :  // <0171> td
// "av_rd_dt"
addr == 16'h4b ? 16'h7661 :  // <0171> va
addr == 16'h4c ? 16'h725f :  // <0171> r_
addr == 16'h4d ? 16'h5f64 :  // <0171> _d
addr == 16'h4e ? 16'h7464 :  // <0171> td
// "av_ad_hi"
addr == 16'h4f ? 16'h7661 :  // <0171> va
addr == 16'h50 ? 16'h615f :  // <0171> a_
addr == 16'h51 ? 16'h5f64 :  // <0171> _d
addr == 16'h52 ? 16'h6968 :  // <0171> ih
// "av_ad_lo"
addr == 16'h53 ? 16'h7661 :  // <0171> va
addr == 16'h54 ? 16'h615f :  // <0171> a_
addr == 16'h55 ? 16'h5f64 :  // <0171> _d
addr == 16'h56 ? 16'h6f6c :  // <0171> ol
// "//uartdt"
addr == 16'h57 ? 16'h2f2f :  // <0171> //
addr == 16'h58 ? 16'h6175 :  // <0171> au
addr == 16'h59 ? 16'h7472 :  // <0171> tr
addr == 16'h5a ? 16'h7464 :  // <0171> td
// "uartstat"
addr == 16'h5b ? 16'h6175 :  // <0171> au
addr == 16'h5c ? 16'h7472 :  // <0171> tr
addr == 16'h5d ? 16'h7473 :  // <0171> ts
addr == 16'h5e ? 16'h7461 :  // <0171> ta
// "    leds"
addr == 16'h5f ? 16'h2020 :  // <0171>   
addr == 16'h60 ? 16'h2020 :  // <0171>   
addr == 16'h61 ? 16'h656c :  // <0171> el
addr == 16'h62 ? 16'h7364 :  // <0171> sd
// "brd_ctrl"
addr == 16'h63 ? 16'h7262 :  // <0171> rb
addr == 16'h64 ? 16'h5f64 :  // <0171> _d
addr == 16'h65 ? 16'h7463 :  // <0171> tc
addr == 16'h66 ? 16'h6c72 :  // <0171> lr
// "   anmux"
addr == 16'h67 ? 16'h2020 :  // <0171>   
addr == 16'h68 ? 16'h6120 :  // <0171> a 
addr == 16'h69 ? 16'h6d6e :  // <0171> mn
addr == 16'h6a ? 16'h7875 :  // <0171> xu
// "pwr_duty"
addr == 16'h6b ? 16'h7770 :  // <0171> wp
addr == 16'h6c ? 16'h5f72 :  // <0171> _r
addr == 16'h6d ? 16'h7564 :  // <0171> ud
addr == 16'h6e ? 16'h7974 :  // <0171> yt
// "igntmcap"
addr == 16'h6f ? 16'h6769 :  // <0171> gi
addr == 16'h70 ? 16'h746e :  // <0171> tn
addr == 16'h71 ? 16'h636d :  // <0171> cm
addr == 16'h72 ? 16'h7061 :  // <0171> pa
// "igntmout"
addr == 16'h73 ? 16'h6769 :  // <0171> gi
addr == 16'h74 ? 16'h746e :  // <0171> tn
addr == 16'h75 ? 16'h6f6d :  // <0171> om
addr == 16'h76 ? 16'h7475 :  // <0171> tu
// "puflenus"
addr == 16'h77 ? 16'h7570 :  // <0171> up
addr == 16'h78 ? 16'h6c66 :  // <0171> lf
addr == 16'h79 ? 16'h6e65 :  // <0171> ne
addr == 16'h7a ? 16'h7375 :  // <0171> su

// string resources
// :boot_msg // = 0x007b
// "TGT\r\n\x0"
addr == 16'h7b ? 16'h4754 :  // <0175> GT
addr == 16'h7c ? 16'h0d54 :  // <0175>  T
addr == 16'h7d ? 16'h000a :  // <0175>   

// libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.

// event loop.  this infrastructure is assembled directly into the main program, not a func.
// first instruction of an event handler should be the 7th cycle after reading its priority from the event controller here.
// :poll_events // = 0x007e
// initialize prior to polling loop, for minimum latency.
addr == 16'h7e ? 16'h07a0 :  // <0006> b = :event_table
addr == 16'h7f ? 16'h0332 :  // <0006> "
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


// :plan_name_stop // = 0x020d
// "STP\x0"
addr == 16'h20d ? 16'h5453 :  // <0002> TS
addr == 16'h20e ? 16'h0050 :  // <0002>  P

// ######## func init_plan_stop // = 0x020f
addr == 16'h20f ? 16'h203e :  // <0004> push rtna // func init_plan_stop
// set up the stop plan.
addr == 16'h210 ? 16'hfba0 :  // <0006> call :clear_ign_history
addr == 16'h211 ? 16'h03a5 :  // <0006> "
addr == 16'h212 ? 16'hfc00 :  // <0006> "
// set noise filter to measure RPM between 50 and 1160 to indicate cranking.
addr == 16'h213 ? 16'h4e00 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_hi = 0
addr == 16'h214 ? 16'h5260 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_lo = 96
addr == 16'h215 ? 16'h47a0 :  // <0008> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_write_data = 603
addr == 16'h216 ? 16'h025b :  // <0008> "
addr == 16'h217 ? 16'h4e00 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h218 ? 16'h5262 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 98
addr == 16'h219 ? 16'h47a0 :  // <0009> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h21a ? 16'h36b0 :  // <0009> "
addr == 16'h21b ? 16'h73a0 :  // <0010> ign_timeout_len_jf = ([rpm_to_jf 50])
addr == 16'h21c ? 16'h36b0 :  // <0010> "
// normally puff length is not touched by an init func.
// this one does it because it's part of the program boot,
// and also a good idea whenever stopping the engine.
// this might interrupt a puff in mid-pulse, but no matter in this case.
addr == 16'h21d ? 16'h4e00 :  // <0015> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h21e ? 16'h526e :  // <0015> ram $ram_next_puff_len_us = 0 // av_ad_lo = 110
addr == 16'h21f ? 16'h4600 :  // <0015> ram $ram_next_puff_len_us = 0 // av_write_data = 0
addr == 16'h220 ? 16'h7600 :  // <0016> puff_len_us = 0

// memorize state.
addr == 16'h221 ? 16'h4e00 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_ad_hi = 0
addr == 16'h222 ? 16'h5266 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_ad_lo = 102
addr == 16'h223 ? 16'h47a0 :  // <0019> ram $ram_plan_name = :plan_name_stop // av_write_data = :plan_name_stop
addr == 16'h224 ? 16'h020d :  // <0019> "
addr == 16'h225 ? 16'h4e00 :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_ad_hi = 0
addr == 16'h226 ? 16'h5268 :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_ad_lo = 104
addr == 16'h227 ? 16'h47a0 :  // <0020> ram $ram_puff_len_func = :puff_len_stop // av_write_data = :puff_len_stop
addr == 16'h228 ? 16'h0234 :  // <0020> "
addr == 16'h229 ? 16'h4e00 :  // <0021> ram $ram_transition_func = :leave_stop // av_ad_hi = 0
addr == 16'h22a ? 16'h526a :  // <0021> ram $ram_transition_func = :leave_stop // av_ad_lo = 106
addr == 16'h22b ? 16'h47a0 :  // <0021> ram $ram_transition_func = :leave_stop // av_write_data = :leave_stop
addr == 16'h22c ? 16'h0238 :  // <0021> "
addr == 16'h22d ? 16'h4e00 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_hi = 0
addr == 16'h22e ? 16'h526c :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_lo = 108
addr == 16'h22f ? 16'h47a0 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_stop // av_write_data = :destroy_plan_stop
addr == 16'h230 ? 16'h0233 :  // <0022> "
addr == 16'h231 ? 16'hf808 :  // <0023> pop rtna // end_func
addr == 16'h232 ? 16'hfc00 :  // <0023> swapra = nop

// ######## func destroy_plan_stop // = 0x0233
addr == 16'h233 ? 16'hfc00 :  // <0026> swapra = nop

// ######## func puff_len_stop // = 0x0234
addr == 16'h234 ? 16'h4e00 :  // <0029> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h235 ? 16'h526e :  // <0029> ram $ram_next_puff_len_us = 0 // av_ad_lo = 110
addr == 16'h236 ? 16'h4600 :  // <0029> ram $ram_next_puff_len_us = 0 // av_write_data = 0
addr == 16'h237 ? 16'hfc00 :  // <0030> swapra = nop

// ######## func leave_stop // = 0x0238
addr == 16'h238 ? 16'h203e :  // <0032> push rtna // func leave_stop
// leave stop plan if ignition switch is turned on AND more than half if the ignition history is valid.
// requiring both conditions prevents spurious noise readings from starting up the injection.
addr == 16'h239 ? 16'h001a :  // <0035> a = power_duty
addr == 16'h23a ? 16'h0680 :  // <0036> b = $ign_switch_off_mask
addr == 16'h23b ? 16'he403 :  // <0037> bn and0z :stay
addr == 16'h23c ? 16'h024a :  // <0037> "
addr == 16'h23d ? 16'h4e00 :  // <0038> ram a = $ram_ign_bad_samples // av_ad_hi = 0
addr == 16'h23e ? 16'h525e :  // <0038> ram a = $ram_ign_bad_samples // av_ad_lo = 94
addr == 16'h23f ? 16'h0011 :  // <0038> ram a = $ram_ign_bad_samples // a = av_write_data // start read cycle
addr == 16'h240 ? 16'h0012 :  // <0038> ram a = $ram_ign_bad_samples // a = av_read_data // finish read cycle
addr == 16'h241 ? 16'h0608 :  // <0039> b = ($ign_history_len / 2)
addr == 16'h242 ? 16'he006 :  // <0040> br gt :stay
addr == 16'h243 ? 16'h024a :  // <0040> "
addr == 16'h244 ? 16'hfba0 :  // <0041> call :destroy_plan_stop
addr == 16'h245 ? 16'h0233 :  // <0041> "
addr == 16'h246 ? 16'hfc00 :  // <0041> "
addr == 16'h247 ? 16'hfba0 :  // <0042> call :init_plan_crank
addr == 16'h248 ? 16'h024e :  // <0042> "
addr == 16'h249 ? 16'hfc00 :  // <0042> "
// :stay // = 0x024a
addr == 16'h24a ? 16'hf808 :  // <0044> pop rtna // end_func
addr == 16'h24b ? 16'hfc00 :  // <0044> swapra = nop



// escalating puff length by 1500 us per puff while cranking slowly at e.g. 80 RPM
// on a frozen winter morning will ramp up from 5000 to 20000 us length in about 7 seconds.

// :plan_name_crank // = 0x024c
// "CR\x0"
addr == 16'h24c ? 16'h5243 :  // <0011> RC
addr == 16'h24d ? 16'h0000 :  // <0011>   

// ######## func init_plan_crank // = 0x024e
// set up the crank plan.
addr == 16'h24e ? 16'h4e00 :  // <0015> ram $ram_puff_count = 0 // av_ad_hi = 0
addr == 16'h24f ? 16'h5270 :  // <0015> ram $ram_puff_count = 0 // av_ad_lo = 112
addr == 16'h250 ? 16'h4600 :  // <0015> ram $ram_puff_count = 0 // av_write_data = 0
// set noise filter to measure RPM between 50 and 8000 to indicate running.
addr == 16'h251 ? 16'h4e00 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_ad_hi = 0
addr == 16'h252 ? 16'h5260 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_ad_lo = 96
addr == 16'h253 ? 16'h4657 :  // <0017> ram $ram_ign_fastest_jf = ([rpm_to_jf 8000]) // av_write_data = 87
addr == 16'h254 ? 16'h4e00 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h255 ? 16'h5262 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 98
addr == 16'h256 ? 16'h47a0 :  // <0018> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h257 ? 16'h36b0 :  // <0018> "
addr == 16'h258 ? 16'h73a0 :  // <0019> ign_timeout_len_jf = ([rpm_to_jf 50])
addr == 16'h259 ? 16'h36b0 :  // <0019> "
// normally puff length is not touched by an init func.
// this one does it because it's the beginning of a crank cycle, and puff length
// should be enabled for the first puff.  otherwise the first puff would be missed.
addr == 16'h25a ? 16'h4e00 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_hi = 0
addr == 16'h25b ? 16'h526e :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_lo = 110
addr == 16'h25c ? 16'h47a0 :  // <0023> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_write_data = 5000
addr == 16'h25d ? 16'h1388 :  // <0023> "
addr == 16'h25e ? 16'h77a0 :  // <0024> puff_len_us = $crank_min_puff_len_us
addr == 16'h25f ? 16'h1388 :  // <0024> "

// memorize state.
addr == 16'h260 ? 16'h4e00 :  // <0027> ram $ram_plan_name = :plan_name_crank // av_ad_hi = 0
addr == 16'h261 ? 16'h5266 :  // <0027> ram $ram_plan_name = :plan_name_crank // av_ad_lo = 102
addr == 16'h262 ? 16'h47a0 :  // <0027> ram $ram_plan_name = :plan_name_crank // av_write_data = :plan_name_crank
addr == 16'h263 ? 16'h024c :  // <0027> "
addr == 16'h264 ? 16'h4e00 :  // <0028> ram $ram_puff_len_func = :puff_len_crank // av_ad_hi = 0
addr == 16'h265 ? 16'h5268 :  // <0028> ram $ram_puff_len_func = :puff_len_crank // av_ad_lo = 104
addr == 16'h266 ? 16'h47a0 :  // <0028> ram $ram_puff_len_func = :puff_len_crank // av_write_data = :puff_len_crank
addr == 16'h267 ? 16'h0272 :  // <0028> "
addr == 16'h268 ? 16'h4e00 :  // <0029> ram $ram_transition_func = :leave_crank // av_ad_hi = 0
addr == 16'h269 ? 16'h526a :  // <0029> ram $ram_transition_func = :leave_crank // av_ad_lo = 106
addr == 16'h26a ? 16'h47a0 :  // <0029> ram $ram_transition_func = :leave_crank // av_write_data = :leave_crank
addr == 16'h26b ? 16'h0290 :  // <0029> "
addr == 16'h26c ? 16'h4e00 :  // <0030> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_hi = 0
addr == 16'h26d ? 16'h526c :  // <0030> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_lo = 108
addr == 16'h26e ? 16'h47a0 :  // <0030> ram $ram_destroy_plan_func = :destroy_plan_crank // av_write_data = :destroy_plan_crank
addr == 16'h26f ? 16'h0271 :  // <0030> "
addr == 16'h270 ? 16'hfc00 :  // <0031> swapra = nop

// ######## func destroy_plan_crank // = 0x0271
addr == 16'h271 ? 16'hfc00 :  // <0034> swapra = nop

// ######## func puff_len_crank // = 0x0272
addr == 16'h272 ? 16'h203e :  // <0036> push rtna // func puff_len_crank
addr == 16'h273 ? 16'h4e00 :  // <0037> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h274 ? 16'h5270 :  // <0037> ram a = $ram_puff_count // av_ad_lo = 112
addr == 16'h275 ? 16'h0011 :  // <0037> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h276 ? 16'h0012 :  // <0037> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h277 ? 16'h060a :  // <0038> b = $crank_max_puffs
addr == 16'h278 ? 16'he006 :  // <0039> br gt :puff_limit
addr == 16'h279 ? 16'h0287 :  // <0039> "
// linear escalation from min to max puff length, at a slope of crank_incr_us_per_puff.
addr == 16'h27a ? 16'h07a0 :  // <0041> b = $crank_incr_us_per_puff
addr == 16'h27b ? 16'h05dc :  // <0041> "
addr == 16'h27c ? 16'hfba0 :  // <0042> call :multiply
addr == 16'h27d ? 16'h0160 :  // <0042> "
addr == 16'h27e ? 16'hfc00 :  // <0042> "
addr == 16'h27f ? 16'h07a0 :  // <0043> b = $crank_min_puff_len_us
addr == 16'h280 ? 16'h1388 :  // <0043> "
addr == 16'h281 ? 16'h4e00 :  // <0044> ram $ram_next_puff_len_us = a+b // av_ad_hi = 0
addr == 16'h282 ? 16'h526e :  // <0044> ram $ram_next_puff_len_us = a+b // av_ad_lo = 110
addr == 16'h283 ? 16'hc800 :  // <0044> ram $ram_next_puff_len_us = a+b // av_write_data = a+b
addr == 16'h284 ? 16'h4700 :  // <0044> "
addr == 16'h285 ? 16'he00f :  // <0045> jmp :done
addr == 16'h286 ? 16'h028e :  // <0045> "
// :puff_limit // = 0x0287
// prevent the puff counter from going higher & eventually rolling over.
addr == 16'h287 ? 16'h4e00 :  // <0048> ram $ram_puff_count = $crank_max_puffs // av_ad_hi = 0
addr == 16'h288 ? 16'h5270 :  // <0048> ram $ram_puff_count = $crank_max_puffs // av_ad_lo = 112
addr == 16'h289 ? 16'h460a :  // <0048> ram $ram_puff_count = $crank_max_puffs // av_write_data = 10
// accept max puff len.
addr == 16'h28a ? 16'h4e00 :  // <0050> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_hi = 0
addr == 16'h28b ? 16'h526e :  // <0050> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_lo = 110
addr == 16'h28c ? 16'h47a0 :  // <0050> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_write_data = 20000
addr == 16'h28d ? 16'h4e20 :  // <0050> "
// :done // = 0x028e
addr == 16'h28e ? 16'hf808 :  // <0052> pop rtna // end_func
addr == 16'h28f ? 16'hfc00 :  // <0052> swapra = nop

// ######## func leave_crank // = 0x0290
addr == 16'h290 ? 16'h203e :  // <0054> push rtna // func leave_crank
addr == 16'h291 ? 16'hfba0 :  // <0055> call :check_engine_stop
addr == 16'h292 ? 16'h060c :  // <0055> "
addr == 16'h293 ? 16'hfc00 :  // <0055> "
addr == 16'h294 ? 16'he400 :  // <0056> bn az :done
addr == 16'h295 ? 16'h02aa :  // <0056> "

// transition to warmup if RPM exceeds crank_success_rpm.
addr == 16'h296 ? 16'h4e00 :  // <0059> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h297 ? 16'h525c :  // <0059> ram a = $ram_rpm_valid // av_ad_lo = 92
addr == 16'h298 ? 16'h0011 :  // <0059> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h299 ? 16'h0012 :  // <0059> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle
addr == 16'h29a ? 16'he000 :  // <0060> br az :stay
addr == 16'h29b ? 16'h02aa :  // <0060> "
addr == 16'h29c ? 16'h4e00 :  // <0061> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h29d ? 16'h525a :  // <0061> ram a = $ram_avg_rpm // av_ad_lo = 90
addr == 16'h29e ? 16'h0011 :  // <0061> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h29f ? 16'h0012 :  // <0061> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle
addr == 16'h2a0 ? 16'h07a0 :  // <0062> b = $crank_success_rpm
addr == 16'h2a1 ? 16'h0320 :  // <0062> "
addr == 16'h2a2 ? 16'he005 :  // <0063> br lt :stay
addr == 16'h2a3 ? 16'h02aa :  // <0063> "
addr == 16'h2a4 ? 16'hfba0 :  // <0064> call :destroy_plan_crank
addr == 16'h2a5 ? 16'h0271 :  // <0064> "
addr == 16'h2a6 ? 16'hfc00 :  // <0064> "
addr == 16'h2a7 ? 16'hfba0 :  // <0065> call :init_plan_warmup
addr == 16'h2a8 ? 16'h02ae :  // <0065> "
addr == 16'h2a9 ? 16'hfc00 :  // <0065> "
// :stay // = 0x02aa

// :done // = 0x02aa
addr == 16'h2aa ? 16'hf808 :  // <0069> pop rtna // end_func
addr == 16'h2ab ? 16'hfc00 :  // <0069> swapra = nop



// 0x4c0 = 1216 = 120 degF at the sensor location outside the engine block.

// :plan_name_warmup // = 0x02ac
// "WM\x0"
addr == 16'h2ac ? 16'h4d57 :  // <0006> MW
addr == 16'h2ad ? 16'h0000 :  // <0006>   

// ######## func init_plan_warmup // = 0x02ae
// set up the warmup plan.

// memorize state.
addr == 16'h2ae ? 16'h4e00 :  // <0012> ram $ram_plan_name = :plan_name_warmup // av_ad_hi = 0
addr == 16'h2af ? 16'h5266 :  // <0012> ram $ram_plan_name = :plan_name_warmup // av_ad_lo = 102
addr == 16'h2b0 ? 16'h47a0 :  // <0012> ram $ram_plan_name = :plan_name_warmup // av_write_data = :plan_name_warmup
addr == 16'h2b1 ? 16'h02ac :  // <0012> "
addr == 16'h2b2 ? 16'h4e00 :  // <0013> ram $ram_puff_len_func = :puff_len_warmup // av_ad_hi = 0
addr == 16'h2b3 ? 16'h5268 :  // <0013> ram $ram_puff_len_func = :puff_len_warmup // av_ad_lo = 104
addr == 16'h2b4 ? 16'h47a0 :  // <0013> ram $ram_puff_len_func = :puff_len_warmup // av_write_data = :puff_len_warmup
addr == 16'h2b5 ? 16'h02c0 :  // <0013> "
addr == 16'h2b6 ? 16'h4e00 :  // <0014> ram $ram_transition_func = :leave_warmup // av_ad_hi = 0
addr == 16'h2b7 ? 16'h526a :  // <0014> ram $ram_transition_func = :leave_warmup // av_ad_lo = 106
addr == 16'h2b8 ? 16'h47a0 :  // <0014> ram $ram_transition_func = :leave_warmup // av_write_data = :leave_warmup
addr == 16'h2b9 ? 16'h02c5 :  // <0014> "
addr == 16'h2ba ? 16'h4e00 :  // <0015> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_ad_hi = 0
addr == 16'h2bb ? 16'h526c :  // <0015> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_ad_lo = 108
addr == 16'h2bc ? 16'h47a0 :  // <0015> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_write_data = :destroy_plan_warmup
addr == 16'h2bd ? 16'h02bf :  // <0015> "
addr == 16'h2be ? 16'hfc00 :  // <0016> swapra = nop

// ######## func destroy_plan_warmup // = 0x02bf
addr == 16'h2bf ? 16'hfc00 :  // <0019> swapra = nop

// ######## func puff_len_warmup // = 0x02c0
addr == 16'h2c0 ? 16'h4e00 :  // <0022> ram $ram_next_puff_len_us = 5000 // av_ad_hi = 0
addr == 16'h2c1 ? 16'h526e :  // <0022> ram $ram_next_puff_len_us = 5000 // av_ad_lo = 110
addr == 16'h2c2 ? 16'h47a0 :  // <0022> ram $ram_next_puff_len_us = 5000 // av_write_data = 5000
addr == 16'h2c3 ? 16'h1388 :  // <0022> "
//patch: add the dial setting to this, for testing.
addr == 16'h2c4 ? 16'hfc00 :  // <0024> swapra = nop

// ######## func leave_warmup // = 0x02c5
addr == 16'h2c5 ? 16'h203e :  // <0026> push rtna // func leave_warmup
addr == 16'h2c6 ? 16'hfba0 :  // <0027> call :check_engine_stop
addr == 16'h2c7 ? 16'h060c :  // <0027> "
addr == 16'h2c8 ? 16'hfc00 :  // <0027> "
addr == 16'h2c9 ? 16'he400 :  // <0028> bn az :done
addr == 16'h2ca ? 16'h02e0 :  // <0028> "

// transition to plan_run if engine block temp sensor is valid, and temp
// exceeds warmup_success_temp_adc.
addr == 16'h2cb ? 16'h0202 :  // <0032> a = $anmux_engine_block_temp

addr == 16'h2cc ? 16'h0351 :  // <0033> a = a<<1
addr == 16'h2cd ? 16'h0608 :  // <0033> b = 8
addr == 16'h2ce ? 16'h4e00 :  // <0033> av_ad_hi = 0
addr == 16'h2cf ? 16'h5300 :  // <0033> av_ad_lo = ad0
addr == 16'h2d0 ? 16'h0411 :  // <0033> b = av_write_data
addr == 16'h2d1 ? 16'h0412 :  // <0033> b = av_read_data

addr == 16'h2d2 ? 16'h03a0 :  // <0034> a = $temp_ceiling_adc
addr == 16'h2d3 ? 16'h0ff0 :  // <0034> "
addr == 16'h2d4 ? 16'he005 :  // <0035> br lt :stay
addr == 16'h2d5 ? 16'h02e0 :  // <0035> "
addr == 16'h2d6 ? 16'h03a0 :  // <0036> a = $warmup_success_temp_adc
addr == 16'h2d7 ? 16'h04c0 :  // <0036> "
addr == 16'h2d8 ? 16'he006 :  // <0037> br gt :stay
addr == 16'h2d9 ? 16'h02e0 :  // <0037> "
addr == 16'h2da ? 16'hfba0 :  // <0038> call :destroy_plan_warmup
addr == 16'h2db ? 16'h02bf :  // <0038> "
addr == 16'h2dc ? 16'hfc00 :  // <0038> "
addr == 16'h2dd ? 16'hfba0 :  // <0039> call :init_plan_run
addr == 16'h2de ? 16'h02e4 :  // <0039> "
addr == 16'h2df ? 16'hfc00 :  // <0039> "
// :stay // = 0x02e0

// :done // = 0x02e0
addr == 16'h2e0 ? 16'hf808 :  // <0043> pop rtna // end_func
addr == 16'h2e1 ? 16'hfc00 :  // <0043> swapra = nop


// :plan_name_run // = 0x02e2
// "RN\x0"
addr == 16'h2e2 ? 16'h4e52 :  // <0002> NR
addr == 16'h2e3 ? 16'h0000 :  // <0002>   

// ######## func init_plan_run // = 0x02e4
// set up the run plan.

// memorize state.
addr == 16'h2e4 ? 16'h4e00 :  // <0008> ram $ram_plan_name = :plan_name_run // av_ad_hi = 0
addr == 16'h2e5 ? 16'h5266 :  // <0008> ram $ram_plan_name = :plan_name_run // av_ad_lo = 102
addr == 16'h2e6 ? 16'h47a0 :  // <0008> ram $ram_plan_name = :plan_name_run // av_write_data = :plan_name_run
addr == 16'h2e7 ? 16'h02e2 :  // <0008> "
addr == 16'h2e8 ? 16'h4e00 :  // <0009> ram $ram_puff_len_func = :puff_len_run // av_ad_hi = 0
addr == 16'h2e9 ? 16'h5268 :  // <0009> ram $ram_puff_len_func = :puff_len_run // av_ad_lo = 104
addr == 16'h2ea ? 16'h47a0 :  // <0009> ram $ram_puff_len_func = :puff_len_run // av_write_data = :puff_len_run
addr == 16'h2eb ? 16'h02fb :  // <0009> "
addr == 16'h2ec ? 16'h4e00 :  // <0010> ram $ram_transition_func = :leave_run // av_ad_hi = 0
addr == 16'h2ed ? 16'h526a :  // <0010> ram $ram_transition_func = :leave_run // av_ad_lo = 106
addr == 16'h2ee ? 16'h47a0 :  // <0010> ram $ram_transition_func = :leave_run // av_write_data = :leave_run
addr == 16'h2ef ? 16'h0300 :  // <0010> "
addr == 16'h2f0 ? 16'h4e00 :  // <0011> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_hi = 0
addr == 16'h2f1 ? 16'h526c :  // <0011> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_lo = 108
addr == 16'h2f2 ? 16'h47a0 :  // <0011> ram $ram_destroy_plan_func = :destroy_plan_run // av_write_data = :destroy_plan_run
addr == 16'h2f3 ? 16'h02f5 :  // <0011> "
addr == 16'h2f4 ? 16'hfc00 :  // <0012> swapra = nop

// ######## func destroy_plan_run // = 0x02f5
addr == 16'h2f5 ? 16'h203e :  // <0014> push rtna // func destroy_plan_run
addr == 16'h2f6 ? 16'hfba0 :  // <0015> call :clear_ign_history
addr == 16'h2f7 ? 16'h03a5 :  // <0015> "
addr == 16'h2f8 ? 16'hfc00 :  // <0015> "
addr == 16'h2f9 ? 16'hf808 :  // <0016> pop rtna // end_func
addr == 16'h2fa ? 16'hfc00 :  // <0016> swapra = nop

// ######## func puff_len_run // = 0x02fb
addr == 16'h2fb ? 16'h4e00 :  // <0019> ram $ram_next_puff_len_us = 3000 // av_ad_hi = 0
addr == 16'h2fc ? 16'h526e :  // <0019> ram $ram_next_puff_len_us = 3000 // av_ad_lo = 110
addr == 16'h2fd ? 16'h47a0 :  // <0019> ram $ram_next_puff_len_us = 3000 // av_write_data = 3000
addr == 16'h2fe ? 16'h0bb8 :  // <0019> "
addr == 16'h2ff ? 16'hfc00 :  // <0020> swapra = nop

// ######## func leave_run // = 0x0300
addr == 16'h300 ? 16'h203e :  // <0022> push rtna // func leave_run
addr == 16'h301 ? 16'hfba0 :  // <0023> call :check_engine_stop
addr == 16'h302 ? 16'h060c :  // <0023> "
addr == 16'h303 ? 16'hfc00 :  // <0023> "
addr == 16'h304 ? 16'hf808 :  // <0024> pop rtna // end_func
addr == 16'h305 ? 16'hfc00 :  // <0024> swapra = nop



// #########################################################################
// :main // = 0x0306
addr == 16'h306 ? 16'h03a0 :  // <0194> a = :boot_msg
addr == 16'h307 ? 16'h007b :  // <0194> "
addr == 16'h308 ? 16'hfba0 :  // <0195> call :print_nt
addr == 16'h309 ? 16'h013f :  // <0195> "
addr == 16'h30a ? 16'hfc00 :  // <0195> "

// clear the first 64k of RAM.
addr == 16'h30b ? 16'h4e00 :  // <0198> av_ad_hi = 0
addr == 16'h30c ? 16'h0200 :  // <0199> a = 0
addr == 16'h30d ? 16'h0602 :  // <0200> b = 2
// :clear_next_word // = 0x030e
addr == 16'h30e ? 16'h5000 :  // <0202> av_ad_lo = a
addr == 16'h30f ? 16'h4600 :  // <0203> av_write_data = 0
addr == 16'h310 ? 16'h0300 :  // <0204> a = ad0
addr == 16'h311 ? 16'he400 :  // <0205> bn az :clear_next_word
addr == 16'h312 ? 16'h030e :  // <0205> "

// init fuel injection.
addr == 16'h313 ? 16'hfba0 :  // <0208> call :init_plan_stop
addr == 16'h314 ? 16'h020f :  // <0208> "
addr == 16'h315 ? 16'hfc00 :  // <0208> "

// power up FTDI USB board, and init any other special board control functions.
addr == 16'h316 ? 16'h6280 :  // <0211> board_ctrl = $ftdi_power_mask
addr == 16'h317 ? 16'hfba0 :  // <0212> call :postpone_comm_restart
addr == 16'h318 ? 16'h0581 :  // <0212> "
addr == 16'h319 ? 16'hfc00 :  // <0212> "

// check initial state of power management circuits.
// if power is lost or ignition switch is off already, open relay & abort run.
// that's important because then the event controller booted up too late to
// see edges on those 2 signals.  regular system would never shut itself down.
// this setup is the last thing done prior to the event handler loop.
addr == 16'h31a ? 16'h6a00 :  // <0219> power_duty = $power_duty_closing
addr == 16'h31b ? 16'h001a :  // <0220> a = power_duty
addr == 16'h31c ? 16'h06c0 :  // <0221> b = ($power_lost_mask | $ign_switch_off_mask)
addr == 16'h31d ? 16'he003 :  // <0222> br and0z :skip_power_lost
addr == 16'h31e ? 16'h0324 :  // <0222> "
addr == 16'h31f ? 16'h6a32 :  // <0223> power_duty = $power_duty_opening
addr == 16'h320 ? 16'h5fa0 :  // <0224> error_halt_code $err_power_lost_at_boot // leds = 0xfffb
addr == 16'h321 ? 16'hfffb :  // <0224> "
addr == 16'h322 ? 16'he00f :  // <0224> error_halt_code $err_power_lost_at_boot
addr == 16'h323 ? 16'h0322 :  // <0224> "
// :skip_power_lost // = 0x0324
addr == 16'h324 ? 16'h4e00 :  // <0226> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h325 ? 16'h5218 :  // <0226> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 24
addr == 16'h326 ? 16'h4760 :  // <0226> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h327 ? 16'h4e00 :  // <0227> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_hi = 0
addr == 16'h328 ? 16'h521a :  // <0227> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_lo = 26
addr == 16'h329 ? 16'h4602 :  // <0227> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_write_data = 2

// start handling events.
addr == 16'h32a ? 16'h2ba0 :  // <0230> soft_event = $event_controller_reset_mask
addr == 16'h32b ? 16'h8000 :  // <0230> "
addr == 16'h32c ? 16'h2a00 :  // <0231> soft_event = 0
addr == 16'h32d ? 16'h37a0 :  // <0232> mstimer0 = 1000
addr == 16'h32e ? 16'h03e8 :  // <0232> "
addr == 16'h32f ? 16'h3e14 :  // <0233> mstimer2 = $plan_tick_ms
addr == 16'h330 ? 16'he00f :  // <0234> jmp :poll_events
addr == 16'h331 ? 16'h007e :  // <0234> "

// event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.
// event 0 not used in this app anyway.
// :event_table // = 0x0332
addr == 16'h332 ? 16'h007e :  // <0239> ([label :poll_events])
addr == 16'h333 ? 16'h04e1 :  // <0240> ([label :power_lost_handler])
addr == 16'h334 ? 16'h0347 :  // <0241> ([label :ign_capture_handler])
addr == 16'h335 ? 16'h03be :  // <0242> ([label :ign_capture_timeout_handler])
addr == 16'h336 ? 16'h0510 :  // <0243> ([label :puff1_done_handler])
addr == 16'h337 ? 16'h03c3 :  // <0244> ([label :ustimer0_handler])
addr == 16'h338 ? 16'h03c5 :  // <0245> ([label :spi_done_handler])
addr == 16'h339 ? 16'h0406 :  // <0246> ([label :mstimer0_handler])
addr == 16'h33a ? 16'h0431 :  // <0247> ([label :mstimer1_handler])
addr == 16'h33b ? 16'h044f :  // <0248> ([label :mstimer2_handler])
addr == 16'h33c ? 16'h045c :  // <0249> ([label :uart_rx_handler])
addr == 16'h33d ? 16'h046c :  // <0250> ([label :uart_rx_overflow_handler])
addr == 16'h33e ? 16'h0472 :  // <0251> ([label :uart_tx_overflow_handler])
addr == 16'h33f ? 16'h0478 :  // <0252> ([label :key0_handler])
addr == 16'h340 ? 16'h0482 :  // <0253> ([label :key1_handler])
addr == 16'h341 ? 16'h04f3 :  // <0254> ([label :ign_switch_off_handler])
addr == 16'h342 ? 16'h0506 :  // <0255> ([label :ign_switch_on_handler])
addr == 16'h343 ? 16'h048c :  // <0256> ([label :softevent3_handler])
addr == 16'h344 ? 16'h048e :  // <0257> ([label :softevent2_handler])
addr == 16'h345 ? 16'h0490 :  // <0258> ([label :softevent1_handler])
addr == 16'h346 ? 16'h0492 :  // <0259> ([label :softevent0_handler])

// #########################################################################

// ######## event ign_capture_handler // = 0x0347
// discard outlier time.
addr == 16'h347 ? 16'h181b :  // <0265> g6 = ign_capture_jf
addr == 16'h348 ? 16'h4e00 :  // <0266> ram b = $ram_ign_fastest_jf // av_ad_hi = 0
addr == 16'h349 ? 16'h5260 :  // <0266> ram b = $ram_ign_fastest_jf // av_ad_lo = 96
addr == 16'h34a ? 16'h0411 :  // <0266> ram b = $ram_ign_fastest_jf // b = av_write_data // start read cycle
addr == 16'h34b ? 16'h0412 :  // <0266> ram b = $ram_ign_fastest_jf // b = av_read_data // finish read cycle
addr == 16'h34c ? 16'h0006 :  // <0267> a = g6
addr == 16'h34d ? 16'he006 :  // <0268> br gt :fastest_ok
addr == 16'h34e ? 16'h0350 :  // <0268> "
addr == 16'h34f ? 16'h1a00 :  // <0269> g6 = 0
// :fastest_ok // = 0x0350
addr == 16'h350 ? 16'h4e00 :  // <0271> ram b = $ram_ign_slowest_jf // av_ad_hi = 0
addr == 16'h351 ? 16'h5262 :  // <0271> ram b = $ram_ign_slowest_jf // av_ad_lo = 98
addr == 16'h352 ? 16'h0411 :  // <0271> ram b = $ram_ign_slowest_jf // b = av_write_data // start read cycle
addr == 16'h353 ? 16'h0412 :  // <0271> ram b = $ram_ign_slowest_jf // b = av_read_data // finish read cycle
addr == 16'h354 ? 16'h0006 :  // <0272> a = g6
addr == 16'h355 ? 16'he005 :  // <0273> br lt :slowest_ok
addr == 16'h356 ? 16'h0358 :  // <0273> "
addr == 16'h357 ? 16'h1a00 :  // <0274> g6 = 0
// :slowest_ok // = 0x0358

// increment buffer index and memorize time.
addr == 16'h358 ? 16'h4e00 :  // <0278> ram a = $ram_ign_history_idx // av_ad_hi = 0
addr == 16'h359 ? 16'h5236 :  // <0278> ram a = $ram_ign_history_idx // av_ad_lo = 54
addr == 16'h35a ? 16'h0011 :  // <0278> ram a = $ram_ign_history_idx // a = av_write_data // start read cycle
addr == 16'h35b ? 16'h0012 :  // <0278> ram a = $ram_ign_history_idx // a = av_read_data // finish read cycle
addr == 16'h35c ? 16'h0601 :  // <0279> b = 1
addr == 16'h35d ? 16'hc800 :  // <0280> a = a+b
addr == 16'h35e ? 16'h0300 :  // <0280> "
addr == 16'h35f ? 16'h060f :  // <0281> b = $ign_history_idx_mask
addr == 16'h360 ? 16'hc800 :  // <0282> a = and
addr == 16'h361 ? 16'h0330 :  // <0282> "
addr == 16'h362 ? 16'h4e00 :  // <0283> ram $ram_ign_history_idx = a // av_ad_hi = 0
addr == 16'h363 ? 16'h5236 :  // <0283> ram $ram_ign_history_idx = a // av_ad_lo = 54
addr == 16'h364 ? 16'h4400 :  // <0283> ram $ram_ign_history_idx = a // av_write_data = a
addr == 16'h365 ? 16'h0406 :  // <0284> b = g6

addr == 16'h366 ? 16'h0351 :  // <0285> a = a<<1
addr == 16'h367 ? 16'h2001 :  // <0285> push b // push b
addr == 16'h368 ? 16'h0638 :  // <0285> b = 56
addr == 16'h369 ? 16'h4e00 :  // <0285> av_ad_hi = 0
addr == 16'h36a ? 16'h5300 :  // <0285> av_ad_lo = ad0
addr == 16'h36b ? 16'h4408 :  // <0285> pop av_write_data // pop av_write_data


// ////////// compute new jiffy estimate.
// average entire history.
// x = total, i = index = loop count, g6 = count of invalid samples.
addr == 16'h36c ? 16'h1200 :  // <0290> x = 0
addr == 16'h36d ? 16'h0a10 :  // <0291> i = $ign_history_len
addr == 16'h36e ? 16'h0f60 :  // <0292> j = -1
addr == 16'h36f ? 16'h1a00 :  // <0293> g6 = 0
// :next_avg // = 0x0370
addr == 16'h370 ? 16'hc800 :  // <0295> i = i+j
addr == 16'h371 ? 16'h0b10 :  // <0295> "
addr == 16'h372 ? 16'h0002 :  // <0296> a = i

addr == 16'h373 ? 16'h0351 :  // <0297> a = a<<1
addr == 16'h374 ? 16'h0638 :  // <0297> b = 56
addr == 16'h375 ? 16'h4e00 :  // <0297> av_ad_hi = 0
addr == 16'h376 ? 16'h5300 :  // <0297> av_ad_lo = ad0
addr == 16'h377 ? 16'h0411 :  // <0297> b = av_write_data
addr == 16'h378 ? 16'h0412 :  // <0297> b = av_read_data

addr == 16'h379 ? 16'h0200 :  // <0298> a = 0
addr == 16'h37a ? 16'he407 :  // <0299> bn eq :valid_sample
addr == 16'h37b ? 16'h0382 :  // <0299> "
addr == 16'h37c ? 16'h0006 :  // <0300> a = g6
addr == 16'h37d ? 16'h0601 :  // <0301> b = 1
addr == 16'h37e ? 16'hc800 :  // <0302> g6 = a+b
addr == 16'h37f ? 16'h1b00 :  // <0302> "
addr == 16'h380 ? 16'he00f :  // <0303> jmp :sample_done
addr == 16'h381 ? 16'h0388 :  // <0303> "
// :valid_sample // = 0x0382
addr == 16'h382 ? 16'h0208 :  // <0305> a = ($ign_history_len / 2)
addr == 16'h383 ? 16'hc800 :  // <0306> a = a+b
addr == 16'h384 ? 16'h0300 :  // <0306> "
addr == 16'h385 ? 16'h1753 :  // <0307> y = a>>$ign_history_idx_bits
addr == 16'h386 ? 16'hc800 :  // <0308> x = x+y
addr == 16'h387 ? 16'h1320 :  // <0308> "
// :sample_done // = 0x0388
addr == 16'h388 ? 16'he401 :  // <0310> bn iz :next_avg
addr == 16'h389 ? 16'h0370 :  // <0310> "
addr == 16'h38a ? 16'h4e00 :  // <0311> ram $ram_ign_avg_jf = x // av_ad_hi = 0
addr == 16'h38b ? 16'h5258 :  // <0311> ram $ram_ign_avg_jf = x // av_ad_lo = 88
addr == 16'h38c ? 16'h4404 :  // <0311> ram $ram_ign_avg_jf = x // av_write_data = x
//patch: dividing before summing (instead of after) is much simpler and faster because it prevents overflow.
// but it means we could be reading as much as 16 jf too low (16 = ign_history_len).
// that error is way less than 1 RPM on the slow end,
// or about 1,000 RPM too fast on the fast end!
// might need to tighten that up.  one simple way might be adding ign_history_len / 2 to each history record prior to dividing.
// that didn't seem to help much in simple testing.
// probly because jf_to_rpm has only 32 RPM resolution.

addr == 16'h38d ? 16'h4e00 :  // <0320> ram $ram_ign_bad_samples = g6 // av_ad_hi = 0
addr == 16'h38e ? 16'h525e :  // <0320> ram $ram_ign_bad_samples = g6 // av_ad_lo = 94
addr == 16'h38f ? 16'h4406 :  // <0320> ram $ram_ign_bad_samples = g6 // av_write_data = g6
addr == 16'h390 ? 16'h0006 :  // <0321> a = g6
addr == 16'h391 ? 16'h0604 :  // <0322> b = ($ign_history_len / 4)
addr == 16'h392 ? 16'he006 :  // <0323> br gt :partial_history
addr == 16'h393 ? 16'h03a0 :  // <0323> "
// convert jiffies b to new RPM estimate.
addr == 16'h394 ? 16'h0004 :  // <0325> a = x
addr == 16'h395 ? 16'hfba0 :  // <0326> call :jf_to_rpm
addr == 16'h396 ? 16'h0600 :  // <0326> "
addr == 16'h397 ? 16'hfc00 :  // <0326> "
addr == 16'h398 ? 16'h4e00 :  // <0327> ram $ram_avg_rpm = a // av_ad_hi = 0
addr == 16'h399 ? 16'h525a :  // <0327> ram $ram_avg_rpm = a // av_ad_lo = 90
addr == 16'h39a ? 16'h4400 :  // <0327> ram $ram_avg_rpm = a // av_write_data = a
addr == 16'h39b ? 16'h4e00 :  // <0328> ram $ram_rpm_valid = 1 // av_ad_hi = 0
addr == 16'h39c ? 16'h525c :  // <0328> ram $ram_rpm_valid = 1 // av_ad_lo = 92
addr == 16'h39d ? 16'h4601 :  // <0328> ram $ram_rpm_valid = 1 // av_write_data = 1
addr == 16'h39e ? 16'he00f :  // <0329> jmp :done
addr == 16'h39f ? 16'h046a :  // <0329> "
// :partial_history // = 0x03a0
addr == 16'h3a0 ? 16'h4e00 :  // <0331> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h3a1 ? 16'h525c :  // <0331> ram $ram_rpm_valid = 0 // av_ad_lo = 92
addr == 16'h3a2 ? 16'h4600 :  // <0331> ram $ram_rpm_valid = 0 // av_write_data = 0

// :done // = 0x03a3
addr == 16'h3a3 ? 16'he00f :  // <0334> end_event
addr == 16'h3a4 ? 16'h007e :  // <0334> "

// ######## func clear_ign_history // = 0x03a5
addr == 16'h3a5 ? 16'h2002 :  // <0336> push i // func clear_ign_history
addr == 16'h3a6 ? 16'h2003 :  // <0336> push j // "
// invalidate the RPM estimate.
addr == 16'h3a7 ? 16'h4e00 :  // <0338> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h3a8 ? 16'h525c :  // <0338> ram $ram_rpm_valid = 0 // av_ad_lo = 92
addr == 16'h3a9 ? 16'h4600 :  // <0338> ram $ram_rpm_valid = 0 // av_write_data = 0
// the last known RPM estimate is retained here, not cleared.
// clear the history so it won't be valid again until several more valid samples are collected.
addr == 16'h3aa ? 16'h4e00 :  // <0341> ram $ram_ign_bad_samples = $ign_history_len // av_ad_hi = 0
addr == 16'h3ab ? 16'h525e :  // <0341> ram $ram_ign_bad_samples = $ign_history_len // av_ad_lo = 94
addr == 16'h3ac ? 16'h4610 :  // <0341> ram $ram_ign_bad_samples = $ign_history_len // av_write_data = 16
addr == 16'h3ad ? 16'h0a10 :  // <0342> i = $ign_history_len
addr == 16'h3ae ? 16'h0f60 :  // <0343> j = -1
// :next // = 0x03af
addr == 16'h3af ? 16'h0002 :  // <0345> a = i
addr == 16'h3b0 ? 16'h0600 :  // <0346> b = 0

addr == 16'h3b1 ? 16'h0351 :  // <0347> a = a<<1
addr == 16'h3b2 ? 16'h2001 :  // <0347> push b // push b
addr == 16'h3b3 ? 16'h0638 :  // <0347> b = 56
addr == 16'h3b4 ? 16'h4e00 :  // <0347> av_ad_hi = 0
addr == 16'h3b5 ? 16'h5300 :  // <0347> av_ad_lo = ad0
addr == 16'h3b6 ? 16'h4408 :  // <0347> pop av_write_data // pop av_write_data

addr == 16'h3b7 ? 16'hc800 :  // <0348> i = i+j
addr == 16'h3b8 ? 16'h0b10 :  // <0348> "
addr == 16'h3b9 ? 16'he401 :  // <0349> bn iz :next
addr == 16'h3ba ? 16'h03af :  // <0349> "
addr == 16'h3bb ? 16'h0c08 :  // <0350> pop j // end_func
addr == 16'h3bc ? 16'h0808 :  // <0350> pop i // "
addr == 16'h3bd ? 16'hfc00 :  // <0350> swapra = nop

// ######## event ign_capture_timeout_handler // = 0x03be
// it's been too long since the last ignition pulse detect.
addr == 16'h3be ? 16'hfba0 :  // <0354> call :clear_ign_history
addr == 16'h3bf ? 16'h03a5 :  // <0354> "
addr == 16'h3c0 ? 16'hfc00 :  // <0354> "
addr == 16'h3c1 ? 16'he00f :  // <0355> end_event
addr == 16'h3c2 ? 16'h007e :  // <0355> "

// ######## event ustimer0_handler // = 0x03c3
addr == 16'h3c3 ? 16'he00f :  // <0358> end_event
addr == 16'h3c4 ? 16'h007e :  // <0358> "

// ######## event spi_done_handler // = 0x03c5
// discard-counter in RAM.
addr == 16'h3c5 ? 16'h4e00 :  // <0362> ram a = $ram_daq_discard_cnt // av_ad_hi = 0
addr == 16'h3c6 ? 16'h5206 :  // <0362> ram a = $ram_daq_discard_cnt // av_ad_lo = 6
addr == 16'h3c7 ? 16'h0011 :  // <0362> ram a = $ram_daq_discard_cnt // a = av_write_data // start read cycle
addr == 16'h3c8 ? 16'h0012 :  // <0362> ram a = $ram_daq_discard_cnt // a = av_read_data // finish read cycle
addr == 16'h3c9 ? 16'he000 :  // <0363> br az :report
addr == 16'h3ca ? 16'h03d7 :  // <0363> "
addr == 16'h3cb ? 16'h0760 :  // <0364> b = -1
addr == 16'h3cc ? 16'hc800 :  // <0365> a = a+b
addr == 16'h3cd ? 16'h0300 :  // <0365> "
addr == 16'h3ce ? 16'h4e00 :  // <0366> ram $ram_daq_discard_cnt = a // av_ad_hi = 0
addr == 16'h3cf ? 16'h5206 :  // <0366> ram $ram_daq_discard_cnt = a // av_ad_lo = 6
addr == 16'h3d0 ? 16'h4400 :  // <0366> ram $ram_daq_discard_cnt = a // av_write_data = a
addr == 16'h3d1 ? 16'h0207 :  // <0367> a = $anmux_adc_channel
addr == 16'h3d2 ? 16'hfba0 :  // <0368> call :begin_adc_conversion
addr == 16'h3d3 ? 16'h04da :  // <0368> "
addr == 16'h3d4 ? 16'hfc00 :  // <0368> "
addr == 16'h3d5 ? 16'he00f :  // <0369> event_return
addr == 16'h3d6 ? 16'h007e :  // <0369> "

// report ADC reading.
// :report // = 0x03d7
addr == 16'h3d7 ? 16'h0010 :  // <0373> a = spi_data
addr == 16'h3d8 ? 16'hfba0 :  // <0374> call :put4x
addr == 16'h3d9 ? 16'h00b3 :  // <0374> "
addr == 16'h3da ? 16'hfc00 :  // <0374> "

// memorize ADC reading.
addr == 16'h3db ? 16'hfba0 :  // <0377> call :anmux_get_chn
addr == 16'h3dc ? 16'h00a6 :  // <0377> "
addr == 16'h3dd ? 16'hfc00 :  // <0377> "
addr == 16'h3de ? 16'h0410 :  // <0378> b = spi_data

addr == 16'h3df ? 16'h0351 :  // <0379> a = a<<1
addr == 16'h3e0 ? 16'h2001 :  // <0379> push b // push b
addr == 16'h3e1 ? 16'h0608 :  // <0379> b = 8
addr == 16'h3e2 ? 16'h4e00 :  // <0379> av_ad_hi = 0
addr == 16'h3e3 ? 16'h5300 :  // <0379> av_ad_lo = ad0
addr == 16'h3e4 ? 16'h4408 :  // <0379> pop av_write_data // pop av_write_data


// decrement anmux channel & start waiting again.
addr == 16'h3e5 ? 16'hfba0 :  // <0382> call :anmux_get_chn
addr == 16'h3e6 ? 16'h00a6 :  // <0382> "
addr == 16'h3e7 ? 16'hfc00 :  // <0382> "
addr == 16'h3e8 ? 16'he000 :  // <0383> br az :all_done
addr == 16'h3e9 ? 16'h03f3 :  // <0383> "
addr == 16'h3ea ? 16'h0760 :  // <0384> b = -1
addr == 16'h3eb ? 16'hc800 :  // <0385> a = a+b
addr == 16'h3ec ? 16'h0300 :  // <0385> "
addr == 16'h3ed ? 16'hfba0 :  // <0386> call :anmux_set_chn
addr == 16'h3ee ? 16'h00a2 :  // <0386> "
addr == 16'h3ef ? 16'hfc00 :  // <0386> "
addr == 16'h3f0 ? 16'h3a05 :  // <0387> mstimer1 = $anmux_settle_ms
addr == 16'h3f1 ? 16'he00f :  // <0388> event_return
addr == 16'h3f2 ? 16'h007e :  // <0388> "

// end of daq pass.
// :all_done // = 0x03f3
addr == 16'h3f3 ? 16'hfba0 :  // <0392> call :report_plan
addr == 16'h3f4 ? 16'h05f1 :  // <0392> "
addr == 16'h3f5 ? 16'hfc00 :  // <0392> "
addr == 16'h3f6 ? 16'hfba0 :  // <0393> call :report_text_flags
addr == 16'h3f7 ? 16'h05c3 :  // <0393> "
addr == 16'h3f8 ? 16'hfc00 :  // <0393> "
addr == 16'h3f9 ? 16'h020d :  // <0394> a = 13 // puteol
addr == 16'h3fa ? 16'hfba0 :  // <0394> puteol
addr == 16'h3fb ? 16'h008b :  // <0394> "
addr == 16'h3fc ? 16'hfc00 :  // <0394> "
addr == 16'h3fd ? 16'h020a :  // <0394> a = 10 // puteol
addr == 16'h3fe ? 16'hfba0 :  // <0394> puteol
addr == 16'h3ff ? 16'h008b :  // <0394> "
addr == 16'h400 ? 16'hfc00 :  // <0394> "
addr == 16'h401 ? 16'h4e00 :  // <0395> ram $ram_dial_setting = spi_data // av_ad_hi = 0
addr == 16'h402 ? 16'h5222 :  // <0395> ram $ram_dial_setting = spi_data // av_ad_lo = 34
addr == 16'h403 ? 16'h4410 :  // <0395> ram $ram_dial_setting = spi_data // av_write_data = spi_data
addr == 16'h404 ? 16'he00f :  // <0396> end_event
addr == 16'h405 ? 16'h007e :  // <0396> "

// ######## event mstimer0_handler // = 0x0406
// unified 1-second periodic timer for all low-resolution tasks.

// start timer again.
addr == 16'h406 ? 16'h37a0 :  // <0402> mstimer0 = 1000
addr == 16'h407 ? 16'h03e8 :  // <0402> "

// realtime counters in RAM.
addr == 16'h408 ? 16'h4e00 :  // <0405> ram a = $ram_seconds_cnt // av_ad_hi = 0
addr == 16'h409 ? 16'h521e :  // <0405> ram a = $ram_seconds_cnt // av_ad_lo = 30
addr == 16'h40a ? 16'h0011 :  // <0405> ram a = $ram_seconds_cnt // a = av_write_data // start read cycle
addr == 16'h40b ? 16'h0012 :  // <0405> ram a = $ram_seconds_cnt // a = av_read_data // finish read cycle
addr == 16'h40c ? 16'h0601 :  // <0406> b = 1
addr == 16'h40d ? 16'hc800 :  // <0407> a = a+b
addr == 16'h40e ? 16'h0300 :  // <0407> "
addr == 16'h40f ? 16'h063c :  // <0408> b = 60
addr == 16'h410 ? 16'he407 :  // <0409> bn eq :same_minute
addr == 16'h411 ? 16'h0423 :  // <0409> "
addr == 16'h412 ? 16'h4e00 :  // <0410> ram $ram_seconds_cnt = 0 // av_ad_hi = 0
addr == 16'h413 ? 16'h521e :  // <0410> ram $ram_seconds_cnt = 0 // av_ad_lo = 30
addr == 16'h414 ? 16'h4600 :  // <0410> ram $ram_seconds_cnt = 0 // av_write_data = 0
addr == 16'h415 ? 16'h4e00 :  // <0411> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h416 ? 16'h521c :  // <0411> ram a = $ram_minutes_cnt // av_ad_lo = 28
addr == 16'h417 ? 16'h0011 :  // <0411> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h418 ? 16'h0012 :  // <0411> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h419 ? 16'h0601 :  // <0412> b = 1
addr == 16'h41a ? 16'h4e00 :  // <0413> ram $ram_minutes_cnt = a+b // av_ad_hi = 0
addr == 16'h41b ? 16'h521c :  // <0413> ram $ram_minutes_cnt = a+b // av_ad_lo = 28
addr == 16'h41c ? 16'hc800 :  // <0413> ram $ram_minutes_cnt = a+b // av_write_data = a+b
addr == 16'h41d ? 16'h4700 :  // <0413> "
addr == 16'h41e ? 16'hfba0 :  // <0414> call :minute_events
addr == 16'h41f ? 16'h051f :  // <0414> "
addr == 16'h420 ? 16'hfc00 :  // <0414> "
addr == 16'h421 ? 16'he00f :  // <0415> jmp :minutes_done
addr == 16'h422 ? 16'h0426 :  // <0415> "
// :same_minute // = 0x0423
addr == 16'h423 ? 16'h4e00 :  // <0417> ram $ram_seconds_cnt = a // av_ad_hi = 0
addr == 16'h424 ? 16'h521e :  // <0417> ram $ram_seconds_cnt = a // av_ad_lo = 30
addr == 16'h425 ? 16'h4400 :  // <0417> ram $ram_seconds_cnt = a // av_write_data = a
// :minutes_done // = 0x0426

addr == 16'h426 ? 16'hfba0 :  // <0420> call :check_power_relay
addr == 16'h427 ? 16'h0527 :  // <0420> "
addr == 16'h428 ? 16'hfc00 :  // <0420> "
addr == 16'h429 ? 16'hfba0 :  // <0421> call :check_communication
addr == 16'h42a ? 16'h0556 :  // <0421> "
addr == 16'h42b ? 16'hfc00 :  // <0421> "
addr == 16'h42c ? 16'hfba0 :  // <0422> call :start_daq_pass
addr == 16'h42d ? 16'h049b :  // <0422> "
addr == 16'h42e ? 16'hfc00 :  // <0422> "
addr == 16'h42f ? 16'he00f :  // <0423> end_event
addr == 16'h430 ? 16'h007e :  // <0423> "

// ######## event mstimer1_handler // = 0x0431
// start a reading from the current anmux channel.
addr == 16'h431 ? 16'h4e00 :  // <0427> ram $ram_daq_discard_cnt = $anmux_num_discards // av_ad_hi = 0
addr == 16'h432 ? 16'h5206 :  // <0427> ram $ram_daq_discard_cnt = $anmux_num_discards // av_ad_lo = 6
addr == 16'h433 ? 16'h4602 :  // <0427> ram $ram_daq_discard_cnt = $anmux_num_discards // av_write_data = 2
addr == 16'h434 ? 16'h0220 :  // <0428> a = 32 // putasc " "
addr == 16'h435 ? 16'hfba0 :  // <0428> putasc " "
addr == 16'h436 ? 16'h008b :  // <0428> "
addr == 16'h437 ? 16'hfc00 :  // <0428> "
addr == 16'h438 ? 16'h0273 :  // <0429> a = 115 // putasc "s"
addr == 16'h439 ? 16'hfba0 :  // <0429> putasc "s"
addr == 16'h43a ? 16'h008b :  // <0429> "
addr == 16'h43b ? 16'hfc00 :  // <0429> "
addr == 16'h43c ? 16'hfba0 :  // <0430> call :anmux_get_chn
addr == 16'h43d ? 16'h00a6 :  // <0430> "
addr == 16'h43e ? 16'hfc00 :  // <0430> "
addr == 16'h43f ? 16'h0630 :  // <0431> b = 48 // asc b = "0"
addr == 16'h440 ? 16'hc800 :  // <0432> a = a+b // putchar a+b
addr == 16'h441 ? 16'h0300 :  // <0432> "
addr == 16'h442 ? 16'hfba0 :  // <0432> putchar a+b
addr == 16'h443 ? 16'h008b :  // <0432> "
addr == 16'h444 ? 16'hfc00 :  // <0432> "
addr == 16'h445 ? 16'h023d :  // <0433> a = 61 // putasc "="
addr == 16'h446 ? 16'hfba0 :  // <0433> putasc "="
addr == 16'h447 ? 16'h008b :  // <0433> "
addr == 16'h448 ? 16'hfc00 :  // <0433> "
addr == 16'h449 ? 16'h0207 :  // <0434> a = $anmux_adc_channel
addr == 16'h44a ? 16'hfba0 :  // <0435> call :begin_adc_conversion
addr == 16'h44b ? 16'h04da :  // <0435> "
addr == 16'h44c ? 16'hfc00 :  // <0435> "
addr == 16'h44d ? 16'he00f :  // <0436> end_event
addr == 16'h44e ? 16'h007e :  // <0436> "

// ######## event mstimer2_handler // = 0x044f
// restart timer
addr == 16'h44f ? 16'h3e14 :  // <0440> mstimer2 = $plan_tick_ms

// poll the engine management plan.
// call the transition function for the current plan.
// this might perform a transition to some other plan, so it's done first.
addr == 16'h450 ? 16'h4e00 :  // <0445> ram rtna = $ram_transition_func // av_ad_hi = 0
addr == 16'h451 ? 16'h526a :  // <0445> ram rtna = $ram_transition_func // av_ad_lo = 106
addr == 16'h452 ? 16'hf811 :  // <0445> ram rtna = $ram_transition_func // rtna = av_write_data // start read cycle
addr == 16'h453 ? 16'hf812 :  // <0445> ram rtna = $ram_transition_func // rtna = av_read_data // finish read cycle
addr == 16'h454 ? 16'hfc00 :  // <0446> swapra = nop
// call the puff length function for the current plan.
// this is done last, so if a plan transition just happened, its new puff length will init here.
addr == 16'h455 ? 16'h4e00 :  // <0449> ram rtna = $ram_puff_len_func // av_ad_hi = 0
addr == 16'h456 ? 16'h5268 :  // <0449> ram rtna = $ram_puff_len_func // av_ad_lo = 104
addr == 16'h457 ? 16'hf811 :  // <0449> ram rtna = $ram_puff_len_func // rtna = av_write_data // start read cycle
addr == 16'h458 ? 16'hf812 :  // <0449> ram rtna = $ram_puff_len_func // rtna = av_read_data // finish read cycle
addr == 16'h459 ? 16'hfc00 :  // <0450> swapra = nop
addr == 16'h45a ? 16'he00f :  // <0451> end_event
addr == 16'h45b ? 16'h007e :  // <0451> "

// ######## event uart_rx_handler // = 0x045c
// :again // = 0x045c
addr == 16'h45c ? 16'hfba0 :  // <0455> pollchar
addr == 16'h45d ? 16'h009a :  // <0455> "
addr == 16'h45e ? 16'hfc00 :  // <0455> "
addr == 16'h45f ? 16'h0760 :  // <0456> b = -1
addr == 16'h460 ? 16'he007 :  // <0457> br eq :done
addr == 16'h461 ? 16'h03a3 :  // <0457> "
addr == 16'h462 ? 16'h060a :  // <0458> b = 10
addr == 16'h463 ? 16'he407 :  // <0459> bn eq :skip_lf
addr == 16'h464 ? 16'h0468 :  // <0459> "
addr == 16'h465 ? 16'hfba0 :  // <0460> call :postpone_comm_restart
addr == 16'h466 ? 16'h0581 :  // <0460> "
addr == 16'h467 ? 16'hfc00 :  // <0460> "
// :skip_lf // = 0x0468
addr == 16'h468 ? 16'he00f :  // <0462> jmp :again
addr == 16'h469 ? 16'h045c :  // <0462> "
// :done // = 0x046a
addr == 16'h46a ? 16'he00f :  // <0464> end_event
addr == 16'h46b ? 16'h007e :  // <0464> "

// ######## event uart_rx_overflow_handler // = 0x046c
addr == 16'h46c ? 16'h5fa0 :  // <0467> error_halt_code $err_rx_overflow // leds = 0xfffe
addr == 16'h46d ? 16'hfffe :  // <0467> "
addr == 16'h46e ? 16'he00f :  // <0467> error_halt_code $err_rx_overflow
addr == 16'h46f ? 16'h046e :  // <0467> "
addr == 16'h470 ? 16'he00f :  // <0468> end_event
addr == 16'h471 ? 16'h007e :  // <0468> "

// ######## event uart_tx_overflow_handler // = 0x0472
addr == 16'h472 ? 16'h5fa0 :  // <0471> error_halt_code $err_tx_overflow // leds = 0xfffd
addr == 16'h473 ? 16'hfffd :  // <0471> "
addr == 16'h474 ? 16'he00f :  // <0471> error_halt_code $err_tx_overflow
addr == 16'h475 ? 16'h0474 :  // <0471> "
addr == 16'h476 ? 16'he00f :  // <0472> end_event
addr == 16'h477 ? 16'h007e :  // <0472> "

// ######## event key0_handler // = 0x0478
addr == 16'h478 ? 16'h026b :  // <0475> a = 107 // putasc "k"
addr == 16'h479 ? 16'hfba0 :  // <0475> putasc "k"
addr == 16'h47a ? 16'h008b :  // <0475> "
addr == 16'h47b ? 16'hfc00 :  // <0475> "
addr == 16'h47c ? 16'h0230 :  // <0476> a = 48 // putasc "0"
addr == 16'h47d ? 16'hfba0 :  // <0476> putasc "0"
addr == 16'h47e ? 16'h008b :  // <0476> "
addr == 16'h47f ? 16'hfc00 :  // <0476> "
addr == 16'h480 ? 16'he00f :  // <0477> end_event
addr == 16'h481 ? 16'h007e :  // <0477> "

// ######## event key1_handler // = 0x0482
addr == 16'h482 ? 16'h026b :  // <0480> a = 107 // putasc "k"
addr == 16'h483 ? 16'hfba0 :  // <0480> putasc "k"
addr == 16'h484 ? 16'h008b :  // <0480> "
addr == 16'h485 ? 16'hfc00 :  // <0480> "
addr == 16'h486 ? 16'h0231 :  // <0481> a = 49 // putasc "1"
addr == 16'h487 ? 16'hfba0 :  // <0481> putasc "1"
addr == 16'h488 ? 16'h008b :  // <0481> "
addr == 16'h489 ? 16'hfc00 :  // <0481> "
addr == 16'h48a ? 16'he00f :  // <0482> end_event
addr == 16'h48b ? 16'h007e :  // <0482> "

// ######## event softevent3_handler // = 0x048c
addr == 16'h48c ? 16'he00f :  // <0485> end_event
addr == 16'h48d ? 16'h007e :  // <0485> "

// ######## event softevent2_handler // = 0x048e
addr == 16'h48e ? 16'he00f :  // <0488> end_event
addr == 16'h48f ? 16'h007e :  // <0488> "

// ######## event softevent1_handler // = 0x0490
addr == 16'h490 ? 16'he00f :  // <0491> end_event
addr == 16'h491 ? 16'h007e :  // <0491> "

// ######## event softevent0_handler // = 0x0492
addr == 16'h492 ? 16'he00f :  // <0494> end_event
addr == 16'h493 ? 16'h007e :  // <0494> "

// :rpm_msg // = 0x0494
// ": rpm=\x0"
addr == 16'h494 ? 16'h203a :  // <0497>  :
addr == 16'h495 ? 16'h7072 :  // <0497> pr
addr == 16'h496 ? 16'h3d6d :  // <0497> =m
addr == 16'h497 ? 16'h0000 :  // <0497>   

// :puff_len_msg // = 0x0498
// " pfl=\x0"
addr == 16'h498 ? 16'h7020 :  // <0500> p 
addr == 16'h499 ? 16'h6c66 :  // <0500> lf
addr == 16'h49a ? 16'h003d :  // <0500>  =

// ######## func start_daq_pass // = 0x049b
addr == 16'h49b ? 16'h2004 :  // <0502> push x // func start_daq_pass
addr == 16'h49c ? 16'h203e :  // <0502> push rtna // "
// daq pass counter in RAM.
addr == 16'h49d ? 16'h4e00 :  // <0504> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h49e ? 16'h5204 :  // <0504> ram a = $ram_daq_pass_cnt // av_ad_lo = 4
addr == 16'h49f ? 16'h0011 :  // <0504> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h4a0 ? 16'h0012 :  // <0504> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h4a1 ? 16'h0601 :  // <0505> b = 1
addr == 16'h4a2 ? 16'hc800 :  // <0506> a = a+b
addr == 16'h4a3 ? 16'h0300 :  // <0506> "
addr == 16'h4a4 ? 16'h5c00 :  // <0507> leds = a
addr == 16'h4a5 ? 16'h4e00 :  // <0508> ram $ram_daq_pass_cnt = a // av_ad_hi = 0
addr == 16'h4a6 ? 16'h5204 :  // <0508> ram $ram_daq_pass_cnt = a // av_ad_lo = 4
addr == 16'h4a7 ? 16'h4400 :  // <0508> ram $ram_daq_pass_cnt = a // av_write_data = a
addr == 16'h4a8 ? 16'hfba0 :  // <0509> call :put4x
addr == 16'h4a9 ? 16'h00b3 :  // <0509> "
addr == 16'h4aa ? 16'hfc00 :  // <0509> "

addr == 16'h4ab ? 16'h03a0 :  // <0511> a = :rpm_msg
addr == 16'h4ac ? 16'h0494 :  // <0511> "
addr == 16'h4ad ? 16'hfba0 :  // <0512> call :print_nt
addr == 16'h4ae ? 16'h013f :  // <0512> "
addr == 16'h4af ? 16'hfc00 :  // <0512> "
addr == 16'h4b0 ? 16'h0200 :  // <0513> a = 0
addr == 16'h4b1 ? 16'h4e00 :  // <0514> ram x = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h4b2 ? 16'h525c :  // <0514> ram x = $ram_rpm_valid // av_ad_lo = 92
addr == 16'h4b3 ? 16'h1011 :  // <0514> ram x = $ram_rpm_valid // x = av_write_data // start read cycle
addr == 16'h4b4 ? 16'h1012 :  // <0514> ram x = $ram_rpm_valid // x = av_read_data // finish read cycle
addr == 16'h4b5 ? 16'he002 :  // <0515> br xz :skip_rpm
addr == 16'h4b6 ? 16'h04bb :  // <0515> "
addr == 16'h4b7 ? 16'h4e00 :  // <0516> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h4b8 ? 16'h525a :  // <0516> ram a = $ram_avg_rpm // av_ad_lo = 90
addr == 16'h4b9 ? 16'h0011 :  // <0516> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h4ba ? 16'h0012 :  // <0516> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle
// :skip_rpm // = 0x04bb
addr == 16'h4bb ? 16'hfba0 :  // <0518> call :put4x
addr == 16'h4bc ? 16'h00b3 :  // <0518> "
addr == 16'h4bd ? 16'hfc00 :  // <0518> "

addr == 16'h4be ? 16'h03a0 :  // <0520> a = :puff_len_msg
addr == 16'h4bf ? 16'h0498 :  // <0520> "
addr == 16'h4c0 ? 16'hfba0 :  // <0521> call :print_nt
addr == 16'h4c1 ? 16'h013f :  // <0521> "
addr == 16'h4c2 ? 16'hfc00 :  // <0521> "
addr == 16'h4c3 ? 16'h001d :  // <0522> a = puff_len_us
addr == 16'h4c4 ? 16'hfba0 :  // <0523> call :put4x
addr == 16'h4c5 ? 16'h00b3 :  // <0523> "
addr == 16'h4c6 ? 16'hfc00 :  // <0523> "
addr == 16'h4c7 ? 16'h022c :  // <0524> a = 44 // putasc ","
addr == 16'h4c8 ? 16'hfba0 :  // <0524> putasc ","
addr == 16'h4c9 ? 16'h008b :  // <0524> "
addr == 16'h4ca ? 16'hfc00 :  // <0524> "
addr == 16'h4cb ? 16'h4e00 :  // <0525> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h4cc ? 16'h5270 :  // <0525> ram a = $ram_puff_count // av_ad_lo = 112
addr == 16'h4cd ? 16'h0011 :  // <0525> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h4ce ? 16'h0012 :  // <0525> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h4cf ? 16'hfba0 :  // <0526> call :put4x
addr == 16'h4d0 ? 16'h00b3 :  // <0526> "
addr == 16'h4d1 ? 16'hfc00 :  // <0526> "

// start to acquire & report all anmux channels.
addr == 16'h4d2 ? 16'h0207 :  // <0529> a = ($anmux_num_channels - 1)
addr == 16'h4d3 ? 16'hfba0 :  // <0530> call :anmux_set_chn
addr == 16'h4d4 ? 16'h00a2 :  // <0530> "
addr == 16'h4d5 ? 16'hfc00 :  // <0530> "
addr == 16'h4d6 ? 16'h3a05 :  // <0531> mstimer1 = $anmux_settle_ms

// // observe MCU utilization.
// a = usage_count
// call :put4x
// usage_count = 0
addr == 16'h4d7 ? 16'hf808 :  // <0537> pop rtna // end_func
addr == 16'h4d8 ? 16'h1008 :  // <0537> pop x // "
addr == 16'h4d9 ? 16'hfc00 :  // <0537> swapra = nop

// ######## func begin_adc_conversion // = 0x04da
// begin SPI transaction, specifying Nano ADC channel to take effect NEXT
// conversion after this one.  pass that in a.

addr == 16'h4da ? 16'h0352 :  // <0543> a = a<<4
addr == 16'h4db ? 16'h0352 :  // <0544> a = a<<4
addr == 16'h4dc ? 16'h0351 :  // <0545> a = a<<1
addr == 16'h4dd ? 16'h0351 :  // <0546> a = a<<1
addr == 16'h4de ? 16'h0351 :  // <0547> a = a<<1
addr == 16'h4df ? 16'h4000 :  // <0548> spi_data = a
addr == 16'h4e0 ? 16'hfc00 :  // <0549> swapra = nop

// ######## event power_lost_handler // = 0x04e1
// at this time we have less than 2 ms of usable run time left.

// this must be an uncommanded loss of main power, because if it was commanded,
// no more events would be handled; this event handler wouldn't have a chance to run.
// immediately set the power relay PWM to full power for a few seconds,
// in case the power relay opened accidentally e.g. due to a hard pothole.
addr == 16'h4e1 ? 16'h6a00 :  // <0558> power_duty = $power_duty_closing
addr == 16'h4e2 ? 16'h4e00 :  // <0559> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h4e3 ? 16'h5204 :  // <0559> ram a = $ram_daq_pass_cnt // av_ad_lo = 4
addr == 16'h4e4 ? 16'h0011 :  // <0559> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h4e5 ? 16'h0012 :  // <0559> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h4e6 ? 16'h0602 :  // <0560> b = $relay_hold_passes
addr == 16'h4e7 ? 16'h4e00 :  // <0561> ram $ram_relay_hold_at_pass = a+b // av_ad_hi = 0
addr == 16'h4e8 ? 16'h521a :  // <0561> ram $ram_relay_hold_at_pass = a+b // av_ad_lo = 26
addr == 16'h4e9 ? 16'hc800 :  // <0561> ram $ram_relay_hold_at_pass = a+b // av_write_data = a+b
addr == 16'h4ea ? 16'h4700 :  // <0561> "

// pause any non-vital power-hogging operations, to conserve power for the EEPROM write.

// save persistent data in case the power remains down e.g. due to battery disconnect.
addr == 16'h4eb ? 16'hfba0 :  // <0566> call :save_persistent_data
addr == 16'h4ec ? 16'h0555 :  // <0566> "
addr == 16'h4ed ? 16'hfc00 :  // <0566> "
addr == 16'h4ee ? 16'he00f :  // <0567> end_event
addr == 16'h4ef ? 16'h007e :  // <0567> "

// :ign_off_msg // = 0x04f0
// "IGOF\x0"
addr == 16'h4f0 ? 16'h4749 :  // <0570> GI
addr == 16'h4f1 ? 16'h464f :  // <0570> FO
addr == 16'h4f2 ? 16'h0000 :  // <0570>   

// ######## event ign_switch_off_handler // = 0x04f3
// set power-down deadline in RAM.  this makes the system remain powered for several more minutes, for cooldown data logging.
addr == 16'h4f3 ? 16'h4e00 :  // <0574> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h4f4 ? 16'h521c :  // <0574> ram a = $ram_minutes_cnt // av_ad_lo = 28
addr == 16'h4f5 ? 16'h0011 :  // <0574> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h4f6 ? 16'h0012 :  // <0574> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h4f7 ? 16'h060a :  // <0575> b = $power_extend_minutes
addr == 16'h4f8 ? 16'h4e00 :  // <0576> ram $ram_power_down_at_min = a+b // av_ad_hi = 0
addr == 16'h4f9 ? 16'h5218 :  // <0576> ram $ram_power_down_at_min = a+b // av_ad_lo = 24
addr == 16'h4fa ? 16'hc800 :  // <0576> ram $ram_power_down_at_min = a+b // av_write_data = a+b
addr == 16'h4fb ? 16'h4700 :  // <0576> "
addr == 16'h4fc ? 16'h03a0 :  // <0577> a = :ign_off_msg
addr == 16'h4fd ? 16'h04f0 :  // <0577> "
addr == 16'h4fe ? 16'hfba0 :  // <0578> call :set_text_flag
addr == 16'h4ff ? 16'h05aa :  // <0578> "
addr == 16'h500 ? 16'hfc00 :  // <0578> "
addr == 16'h501 ? 16'he00f :  // <0579> end_event
addr == 16'h502 ? 16'h007e :  // <0579> "

// :ign_on_msg // = 0x0503
// "IGON\x0"
addr == 16'h503 ? 16'h4749 :  // <0582> GI
addr == 16'h504 ? 16'h4e4f :  // <0582> NO
addr == 16'h505 ? 16'h0000 :  // <0582>   

// ######## event ign_switch_on_handler // = 0x0506
addr == 16'h506 ? 16'h4e00 :  // <0585> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h507 ? 16'h5218 :  // <0585> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 24
addr == 16'h508 ? 16'h4760 :  // <0585> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h509 ? 16'h03a0 :  // <0586> a = :ign_on_msg
addr == 16'h50a ? 16'h0503 :  // <0586> "
addr == 16'h50b ? 16'hfba0 :  // <0587> call :set_text_flag
addr == 16'h50c ? 16'h05aa :  // <0587> "
addr == 16'h50d ? 16'hfc00 :  // <0587> "
addr == 16'h50e ? 16'he00f :  // <0588> end_event
addr == 16'h50f ? 16'h007e :  // <0588> "

// ######## event puff1_done_handler // = 0x0510
// puff just finished.  set length of next puff.
addr == 16'h510 ? 16'h4e00 :  // <0592> ram puff_len_us = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'h511 ? 16'h526e :  // <0592> ram puff_len_us = $ram_next_puff_len_us // av_ad_lo = 110
addr == 16'h512 ? 16'h7411 :  // <0592> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_write_data // start read cycle
addr == 16'h513 ? 16'h7412 :  // <0592> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_read_data // finish read cycle

// count puffs.
addr == 16'h514 ? 16'h4e00 :  // <0595> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h515 ? 16'h5270 :  // <0595> ram a = $ram_puff_count // av_ad_lo = 112
addr == 16'h516 ? 16'h0011 :  // <0595> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h517 ? 16'h0012 :  // <0595> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h518 ? 16'h0601 :  // <0596> b = 1
addr == 16'h519 ? 16'h4e00 :  // <0597> ram $ram_puff_count = a+b // av_ad_hi = 0
addr == 16'h51a ? 16'h5270 :  // <0597> ram $ram_puff_count = a+b // av_ad_lo = 112
addr == 16'h51b ? 16'hc800 :  // <0597> ram $ram_puff_count = a+b // av_write_data = a+b
addr == 16'h51c ? 16'h4700 :  // <0597> "

// hack to set puff length strictly by a hard-wired knob.
// ram a = $ram_dial_setting
// a = a<<1
// a = a<<1
// a = a<<1
// bn az :nonzero
// a = 1
// :nonzero
// puff_len_us = a
addr == 16'h51d ? 16'he00f :  // <0608> end_event
addr == 16'h51e ? 16'h007e :  // <0608> "

// ######## func minute_events // = 0x051f
addr == 16'h51f ? 16'h203e :  // <0610> push rtna // func minute_events
addr == 16'h520 ? 16'hfba0 :  // <0611> call :check_power_down
addr == 16'h521 ? 16'h053a :  // <0611> "
addr == 16'h522 ? 16'hfc00 :  // <0611> "
addr == 16'h523 ? 16'hf808 :  // <0612> pop rtna // end_func
addr == 16'h524 ? 16'hfc00 :  // <0612> swapra = nop

// :power_hold_msg // = 0x0525
// "PWH\x0"
addr == 16'h525 ? 16'h5750 :  // <0615> WP
addr == 16'h526 ? 16'h0048 :  // <0615>  H

// ######## func check_power_relay // = 0x0527
addr == 16'h527 ? 16'h203e :  // <0617> push rtna // func check_power_relay
addr == 16'h528 ? 16'h4e00 :  // <0618> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h529 ? 16'h5204 :  // <0618> ram a = $ram_daq_pass_cnt // av_ad_lo = 4
addr == 16'h52a ? 16'h0011 :  // <0618> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h52b ? 16'h0012 :  // <0618> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h52c ? 16'h4e00 :  // <0619> ram b = $ram_relay_hold_at_pass // av_ad_hi = 0
addr == 16'h52d ? 16'h521a :  // <0619> ram b = $ram_relay_hold_at_pass // av_ad_lo = 26
addr == 16'h52e ? 16'h0411 :  // <0619> ram b = $ram_relay_hold_at_pass // b = av_write_data // start read cycle
addr == 16'h52f ? 16'h0412 :  // <0619> ram b = $ram_relay_hold_at_pass // b = av_read_data // finish read cycle
addr == 16'h530 ? 16'he407 :  // <0620> bn eq :done
addr == 16'h531 ? 16'h0538 :  // <0620> "
// time to begin "solenoid saver" coil power reduction by PWM.
addr == 16'h532 ? 16'h6a19 :  // <0622> power_duty = $power_duty_holding
addr == 16'h533 ? 16'h03a0 :  // <0623> a = :power_hold_msg
addr == 16'h534 ? 16'h0525 :  // <0623> "
addr == 16'h535 ? 16'hfba0 :  // <0624> call :set_text_flag
addr == 16'h536 ? 16'h05aa :  // <0624> "
addr == 16'h537 ? 16'hfc00 :  // <0624> "
// :done // = 0x0538
addr == 16'h538 ? 16'hf808 :  // <0626> pop rtna // end_func
addr == 16'h539 ? 16'hfc00 :  // <0626> swapra = nop

// ######## func check_power_down // = 0x053a
addr == 16'h53a ? 16'h203e :  // <0628> push rtna // func check_power_down
// check power-down deadline in RAM.
addr == 16'h53b ? 16'h4e00 :  // <0630> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h53c ? 16'h521c :  // <0630> ram a = $ram_minutes_cnt // av_ad_lo = 28
addr == 16'h53d ? 16'h0011 :  // <0630> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h53e ? 16'h0012 :  // <0630> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h53f ? 16'h4e00 :  // <0631> ram b = $ram_power_down_at_min // av_ad_hi = 0
addr == 16'h540 ? 16'h5218 :  // <0631> ram b = $ram_power_down_at_min // av_ad_lo = 24
addr == 16'h541 ? 16'h0411 :  // <0631> ram b = $ram_power_down_at_min // b = av_write_data // start read cycle
addr == 16'h542 ? 16'h0412 :  // <0631> ram b = $ram_power_down_at_min // b = av_read_data // finish read cycle
addr == 16'h543 ? 16'he407 :  // <0632> bn eq :done
addr == 16'h544 ? 16'h0548 :  // <0632> "
addr == 16'h545 ? 16'hfba0 :  // <0633> call :power_down
addr == 16'h546 ? 16'h054a :  // <0633> "
addr == 16'h547 ? 16'hfc00 :  // <0633> "
// :done // = 0x0548
addr == 16'h548 ? 16'hf808 :  // <0635> pop rtna // end_func
addr == 16'h549 ? 16'hfc00 :  // <0635> swapra = nop

// ######## func power_down // = 0x054a
addr == 16'h54a ? 16'h203e :  // <0637> push rtna // func power_down
// this function never returns.
addr == 16'h54b ? 16'hfba0 :  // <0639> call :save_persistent_data
addr == 16'h54c ? 16'h0555 :  // <0639> "
addr == 16'h54d ? 16'hfc00 :  // <0639> "
addr == 16'h54e ? 16'h6a32 :  // <0640> power_duty = $power_duty_opening
addr == 16'h54f ? 16'h5fa0 :  // <0641> error_halt_code $err_power_down // leds = 0xfffc
addr == 16'h550 ? 16'hfffc :  // <0641> "
addr == 16'h551 ? 16'he00f :  // <0641> error_halt_code $err_power_down
addr == 16'h552 ? 16'h0551 :  // <0641> "
addr == 16'h553 ? 16'hf808 :  // <0642> pop rtna // end_func
addr == 16'h554 ? 16'hfc00 :  // <0642> swapra = nop

// ######## func save_persistent_data // = 0x0555
addr == 16'h555 ? 16'hfc00 :  // <0645> swapra = nop

// ######## func check_communication // = 0x0556
addr == 16'h556 ? 16'h203e :  // <0647> push rtna // func check_communication
addr == 16'h557 ? 16'h4e00 :  // <0648> ram a = $ram_ftdi_downtime_remain_sec // av_ad_hi = 0
addr == 16'h558 ? 16'h5202 :  // <0648> ram a = $ram_ftdi_downtime_remain_sec // av_ad_lo = 2
addr == 16'h559 ? 16'h0011 :  // <0648> ram a = $ram_ftdi_downtime_remain_sec // a = av_write_data // start read cycle
addr == 16'h55a ? 16'h0012 :  // <0648> ram a = $ram_ftdi_downtime_remain_sec // a = av_read_data // finish read cycle
addr == 16'h55b ? 16'he000 :  // <0649> br az :skip_ftdi_powerup
addr == 16'h55c ? 16'h056c :  // <0649> "
addr == 16'h55d ? 16'h0760 :  // <0650> b = -1
addr == 16'h55e ? 16'hc800 :  // <0651> a = a+b
addr == 16'h55f ? 16'h0300 :  // <0651> "
addr == 16'h560 ? 16'h4e00 :  // <0652> ram $ram_ftdi_downtime_remain_sec = a // av_ad_hi = 0
addr == 16'h561 ? 16'h5202 :  // <0652> ram $ram_ftdi_downtime_remain_sec = a // av_ad_lo = 2
addr == 16'h562 ? 16'h4400 :  // <0652> ram $ram_ftdi_downtime_remain_sec = a // av_write_data = a
addr == 16'h563 ? 16'he000 :  // <0653> br az :do_power_on
addr == 16'h564 ? 16'h0567 :  // <0653> "
addr == 16'h565 ? 16'hf808 :  // <0654> pop rtna // rtn
addr == 16'h566 ? 16'hfc00 :  // <0654> swapra = nop
// :do_power_on // = 0x0567
addr == 16'h567 ? 16'hfba0 :  // <0656> call :ftdi_power_on
addr == 16'h568 ? 16'h059e :  // <0656> "
addr == 16'h569 ? 16'hfc00 :  // <0656> "
addr == 16'h56a ? 16'hf808 :  // <0657> pop rtna // rtn
addr == 16'h56b ? 16'hfc00 :  // <0657> swapra = nop
// :skip_ftdi_powerup // = 0x056c

addr == 16'h56c ? 16'h4e00 :  // <0660> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h56d ? 16'h521c :  // <0660> ram a = $ram_minutes_cnt // av_ad_lo = 28
addr == 16'h56e ? 16'h0011 :  // <0660> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h56f ? 16'h0012 :  // <0660> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h570 ? 16'h4e00 :  // <0661> ram b = $ram_comm_restart_at_min // av_ad_hi = 0
addr == 16'h571 ? 16'h5200 :  // <0661> ram b = $ram_comm_restart_at_min // av_ad_lo = 0
addr == 16'h572 ? 16'h0411 :  // <0661> ram b = $ram_comm_restart_at_min // b = av_write_data // start read cycle
addr == 16'h573 ? 16'h0412 :  // <0661> ram b = $ram_comm_restart_at_min // b = av_read_data // finish read cycle
addr == 16'h574 ? 16'he407 :  // <0662> bn eq :done
addr == 16'h575 ? 16'h057f :  // <0662> "
// comm restart is required.
addr == 16'h576 ? 16'hfba0 :  // <0664> call :postpone_comm_restart
addr == 16'h577 ? 16'h0581 :  // <0664> "
addr == 16'h578 ? 16'hfc00 :  // <0664> "
addr == 16'h579 ? 16'h4e00 :  // <0665> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_hi = 0
addr == 16'h57a ? 16'h5202 :  // <0665> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_lo = 2
addr == 16'h57b ? 16'h4605 :  // <0665> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_write_data = 5
addr == 16'h57c ? 16'hfba0 :  // <0666> call :ftdi_power_off
addr == 16'h57d ? 16'h058e :  // <0666> "
addr == 16'h57e ? 16'hfc00 :  // <0666> "
// :done // = 0x057f
addr == 16'h57f ? 16'hf808 :  // <0668> pop rtna // end_func
addr == 16'h580 ? 16'hfc00 :  // <0668> swapra = nop

// ######## func postpone_comm_restart // = 0x0581
addr == 16'h581 ? 16'h4e00 :  // <0671> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h582 ? 16'h521c :  // <0671> ram a = $ram_minutes_cnt // av_ad_lo = 28
addr == 16'h583 ? 16'h0011 :  // <0671> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h584 ? 16'h0012 :  // <0671> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h585 ? 16'h0602 :  // <0672> b = $comm_grace_period_min
addr == 16'h586 ? 16'h4e00 :  // <0673> ram $ram_comm_restart_at_min = a+b // av_ad_hi = 0
addr == 16'h587 ? 16'h5200 :  // <0673> ram $ram_comm_restart_at_min = a+b // av_ad_lo = 0
addr == 16'h588 ? 16'hc800 :  // <0673> ram $ram_comm_restart_at_min = a+b // av_write_data = a+b
addr == 16'h589 ? 16'h4700 :  // <0673> "
addr == 16'h58a ? 16'hfc00 :  // <0674> swapra = nop

// :ftdi_off_msg // = 0x058b
// "FTOF\x0"
addr == 16'h58b ? 16'h5446 :  // <0677> TF
addr == 16'h58c ? 16'h464f :  // <0677> FO
addr == 16'h58d ? 16'h0000 :  // <0677>   

// ######## func ftdi_power_off // = 0x058e
addr == 16'h58e ? 16'h203e :  // <0679> push rtna // func ftdi_power_off
addr == 16'h58f ? 16'h0018 :  // <0680> a = board_ctrl
addr == 16'h590 ? 16'h07a0 :  // <0681> b = $not_ftdi_power_mask
addr == 16'h591 ? 16'hff7f :  // <0681> "
addr == 16'h592 ? 16'hc800 :  // <0682> board_ctrl = and
addr == 16'h593 ? 16'h6330 :  // <0682> "
addr == 16'h594 ? 16'h03a0 :  // <0683> a = :ftdi_off_msg
addr == 16'h595 ? 16'h058b :  // <0683> "
addr == 16'h596 ? 16'hfba0 :  // <0684> call :set_text_flag
addr == 16'h597 ? 16'h05aa :  // <0684> "
addr == 16'h598 ? 16'hfc00 :  // <0684> "
addr == 16'h599 ? 16'hf808 :  // <0685> pop rtna // end_func
addr == 16'h59a ? 16'hfc00 :  // <0685> swapra = nop

// :ftdi_on_msg // = 0x059b
// "FTON\x0"
addr == 16'h59b ? 16'h5446 :  // <0688> TF
addr == 16'h59c ? 16'h4e4f :  // <0688> NO
addr == 16'h59d ? 16'h0000 :  // <0688>   

// ######## func ftdi_power_on // = 0x059e
addr == 16'h59e ? 16'h203e :  // <0690> push rtna // func ftdi_power_on
addr == 16'h59f ? 16'h0018 :  // <0691> a = board_ctrl
addr == 16'h5a0 ? 16'h0680 :  // <0692> b = $ftdi_power_mask
addr == 16'h5a1 ? 16'hc800 :  // <0693> board_ctrl = or
addr == 16'h5a2 ? 16'h6334 :  // <0693> "
addr == 16'h5a3 ? 16'h03a0 :  // <0694> a = :ftdi_on_msg
addr == 16'h5a4 ? 16'h059b :  // <0694> "
addr == 16'h5a5 ? 16'hfba0 :  // <0695> call :set_text_flag
addr == 16'h5a6 ? 16'h05aa :  // <0695> "
addr == 16'h5a7 ? 16'hfc00 :  // <0695> "
addr == 16'h5a8 ? 16'hf808 :  // <0696> pop rtna // end_func
addr == 16'h5a9 ? 16'hfc00 :  // <0696> swapra = nop

// ######## func set_text_flag // = 0x05aa
addr == 16'h5aa ? 16'h0400 :  // <0699> b = a
addr == 16'h5ab ? 16'h4e00 :  // <0700> ram a = $ram_next_tfp_idx // av_ad_hi = 0
addr == 16'h5ac ? 16'h5234 :  // <0700> ram a = $ram_next_tfp_idx // av_ad_lo = 52
addr == 16'h5ad ? 16'h0011 :  // <0700> ram a = $ram_next_tfp_idx // a = av_write_data // start read cycle
addr == 16'h5ae ? 16'h0012 :  // <0700> ram a = $ram_next_tfp_idx // a = av_read_data // finish read cycle
addr == 16'h5af ? 16'h2000 :  // <0701> push a // push a

addr == 16'h5b0 ? 16'h0351 :  // <0702> a = a<<1
addr == 16'h5b1 ? 16'h2001 :  // <0702> push b // push b
addr == 16'h5b2 ? 16'h0624 :  // <0702> b = 36
addr == 16'h5b3 ? 16'h4e00 :  // <0702> av_ad_hi = 0
addr == 16'h5b4 ? 16'h5300 :  // <0702> av_ad_lo = ad0
addr == 16'h5b5 ? 16'h4408 :  // <0702> pop av_write_data // pop av_write_data

addr == 16'h5b6 ? 16'h0008 :  // <0703> pop a // pop a
addr == 16'h5b7 ? 16'h0760 :  // <0704> b = -1
addr == 16'h5b8 ? 16'hc800 :  // <0705> a = a+b
addr == 16'h5b9 ? 16'h0300 :  // <0705> "
addr == 16'h5ba ? 16'h0607 :  // <0706> b = $tfp_mask
addr == 16'h5bb ? 16'h4e00 :  // <0707> ram $ram_next_tfp_idx = and // av_ad_hi = 0
addr == 16'h5bc ? 16'h5234 :  // <0707> ram $ram_next_tfp_idx = and // av_ad_lo = 52
addr == 16'h5bd ? 16'hc800 :  // <0707> ram $ram_next_tfp_idx = and // av_write_data = and
addr == 16'h5be ? 16'h4730 :  // <0707> "
addr == 16'h5bf ? 16'hfc00 :  // <0708> swapra = nop

// :text_flags_msg // = 0x05c0
// " tf=\x0"
addr == 16'h5c0 ? 16'h7420 :  // <0711> t 
addr == 16'h5c1 ? 16'h3d66 :  // <0711> =f
addr == 16'h5c2 ? 16'h0000 :  // <0711>   

// ######## func report_text_flags // = 0x05c3
addr == 16'h5c3 ? 16'h2002 :  // <0713> push i // func report_text_flags
addr == 16'h5c4 ? 16'h2003 :  // <0713> push j // "
addr == 16'h5c5 ? 16'h203e :  // <0713> push rtna // "
addr == 16'h5c6 ? 16'h03a0 :  // <0714> a = :text_flags_msg
addr == 16'h5c7 ? 16'h05c0 :  // <0714> "
addr == 16'h5c8 ? 16'hfba0 :  // <0715> call :print_nt
addr == 16'h5c9 ? 16'h013f :  // <0715> "
addr == 16'h5ca ? 16'hfc00 :  // <0715> "
addr == 16'h5cb ? 16'h0a08 :  // <0716> i = $num_text_flag_pointers
addr == 16'h5cc ? 16'h0f60 :  // <0717> j = -1
// :next_ptr // = 0x05cd
addr == 16'h5cd ? 16'hc800 :  // <0719> i = i+j
addr == 16'h5ce ? 16'h0b10 :  // <0719> "
addr == 16'h5cf ? 16'h0002 :  // <0720> a = i

addr == 16'h5d0 ? 16'h0351 :  // <0721> a = a<<1
addr == 16'h5d1 ? 16'h0624 :  // <0721> b = 36
addr == 16'h5d2 ? 16'h4e00 :  // <0721> av_ad_hi = 0
addr == 16'h5d3 ? 16'h5300 :  // <0721> av_ad_lo = ad0
addr == 16'h5d4 ? 16'h0411 :  // <0721> b = av_write_data
addr == 16'h5d5 ? 16'h0412 :  // <0721> b = av_read_data

addr == 16'h5d6 ? 16'h0001 :  // <0722> a = b
addr == 16'h5d7 ? 16'he000 :  // <0723> br az :skip
addr == 16'h5d8 ? 16'h05e8 :  // <0723> "
addr == 16'h5d9 ? 16'hfba0 :  // <0724> call :print_nt
addr == 16'h5da ? 16'h013f :  // <0724> "
addr == 16'h5db ? 16'hfc00 :  // <0724> "
addr == 16'h5dc ? 16'h022c :  // <0725> a = 44 // putasc ","
addr == 16'h5dd ? 16'hfba0 :  // <0725> putasc ","
addr == 16'h5de ? 16'h008b :  // <0725> "
addr == 16'h5df ? 16'hfc00 :  // <0725> "
addr == 16'h5e0 ? 16'h0002 :  // <0726> a = i
addr == 16'h5e1 ? 16'h0600 :  // <0727> b = 0

addr == 16'h5e2 ? 16'h0351 :  // <0728> a = a<<1
addr == 16'h5e3 ? 16'h2001 :  // <0728> push b // push b
addr == 16'h5e4 ? 16'h0624 :  // <0728> b = 36
addr == 16'h5e5 ? 16'h4e00 :  // <0728> av_ad_hi = 0
addr == 16'h5e6 ? 16'h5300 :  // <0728> av_ad_lo = ad0
addr == 16'h5e7 ? 16'h4408 :  // <0728> pop av_write_data // pop av_write_data

// :skip // = 0x05e8
addr == 16'h5e8 ? 16'he401 :  // <0730> bn iz :next_ptr
addr == 16'h5e9 ? 16'h05cd :  // <0730> "
addr == 16'h5ea ? 16'hf808 :  // <0731> pop rtna // end_func
addr == 16'h5eb ? 16'h0c08 :  // <0731> pop j // "
addr == 16'h5ec ? 16'h0808 :  // <0731> pop i // "
addr == 16'h5ed ? 16'hfc00 :  // <0731> swapra = nop

// :plan_msg // = 0x05ee
// " pl=\x0"
addr == 16'h5ee ? 16'h7020 :  // <0734> p 
addr == 16'h5ef ? 16'h3d6c :  // <0734> =l
addr == 16'h5f0 ? 16'h0000 :  // <0734>   

// ######## func report_plan // = 0x05f1
addr == 16'h5f1 ? 16'h203e :  // <0736> push rtna // func report_plan
addr == 16'h5f2 ? 16'h03a0 :  // <0737> a = :plan_msg
addr == 16'h5f3 ? 16'h05ee :  // <0737> "
addr == 16'h5f4 ? 16'hfba0 :  // <0738> call :print_nt
addr == 16'h5f5 ? 16'h013f :  // <0738> "
addr == 16'h5f6 ? 16'hfc00 :  // <0738> "
addr == 16'h5f7 ? 16'h4e00 :  // <0739> ram a = $ram_plan_name // av_ad_hi = 0
addr == 16'h5f8 ? 16'h5266 :  // <0739> ram a = $ram_plan_name // av_ad_lo = 102
addr == 16'h5f9 ? 16'h0011 :  // <0739> ram a = $ram_plan_name // a = av_write_data // start read cycle
addr == 16'h5fa ? 16'h0012 :  // <0739> ram a = $ram_plan_name // a = av_read_data // finish read cycle
addr == 16'h5fb ? 16'hfba0 :  // <0740> call :print_nt
addr == 16'h5fc ? 16'h013f :  // <0740> "
addr == 16'h5fd ? 16'hfc00 :  // <0740> "
addr == 16'h5fe ? 16'hf808 :  // <0741> pop rtna // end_func
addr == 16'h5ff ? 16'hfc00 :  // <0741> swapra = nop

// ######## func jf_to_rpm // = 0x0600
addr == 16'h600 ? 16'h203e :  // <0743> push rtna // func jf_to_rpm
// pass jiffies in a.  return rpm in a.
// resolution = 32 rpm.
addr == 16'h601 ? 16'h0400 :  // <0746> b = a
addr == 16'h602 ? 16'h03a0 :  // <0747> a = 0x5573
addr == 16'h603 ? 16'h5573 :  // <0747> "
// = 700000 >> 5
addr == 16'h604 ? 16'hfba0 :  // <0749> call :divide
addr == 16'h605 ? 16'h017c :  // <0749> "
addr == 16'h606 ? 16'hfc00 :  // <0749> "
addr == 16'h607 ? 16'h0001 :  // <0750> a = b
addr == 16'h608 ? 16'h0352 :  // <0751> a = a<<4
addr == 16'h609 ? 16'h0351 :  // <0752> a = a<<1
addr == 16'h60a ? 16'hf808 :  // <0753> pop rtna // end_func
addr == 16'h60b ? 16'hfc00 :  // <0753> swapra = nop

// ######## func check_engine_stop // = 0x060c
addr == 16'h60c ? 16'h203e :  // <0755> push rtna // func check_engine_stop
// returns a=1 if transitioned to stop, else a=0.

// transition to plan_stop if ignition switch is turned off AND rpm estimate is invalid.
// requiring both conditions prevents spurious noise readings from shutting down the injection.
addr == 16'h60d ? 16'h001a :  // <0760> a = power_duty
addr == 16'h60e ? 16'h0680 :  // <0761> b = $ign_switch_off_mask
addr == 16'h60f ? 16'he003 :  // <0762> br and0z :stay
addr == 16'h610 ? 16'h0622 :  // <0762> "
addr == 16'h611 ? 16'h4e00 :  // <0763> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h612 ? 16'h525c :  // <0763> ram a = $ram_rpm_valid // av_ad_lo = 92
addr == 16'h613 ? 16'h0011 :  // <0763> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h614 ? 16'h0012 :  // <0763> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle
addr == 16'h615 ? 16'he400 :  // <0764> bn az :stay
addr == 16'h616 ? 16'h0622 :  // <0764> "
addr == 16'h617 ? 16'h4e00 :  // <0765> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h618 ? 16'h526c :  // <0765> ram rtna = $ram_destroy_plan_func // av_ad_lo = 108
addr == 16'h619 ? 16'hf811 :  // <0765> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h61a ? 16'hf812 :  // <0765> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h61b ? 16'hfc00 :  // <0766> swapra = nop
addr == 16'h61c ? 16'hfba0 :  // <0767> call :init_plan_stop
addr == 16'h61d ? 16'h020f :  // <0767> "
addr == 16'h61e ? 16'hfc00 :  // <0767> "
addr == 16'h61f ? 16'h0201 :  // <0768> a = 1
addr == 16'h620 ? 16'he00f :  // <0769> jmp :done
addr == 16'h621 ? 16'h0623 :  // <0769> "
// :stay // = 0x0622
addr == 16'h622 ? 16'h0200 :  // <0771> a = 0
// :done // = 0x0623
addr == 16'h623 ? 16'hf808 :  // <0773> pop rtna // end_func
addr == 16'h624 ? 16'hfc00 :  // <0773> swapra = nop


        
                16'hxxxx;
        endmodule
    
