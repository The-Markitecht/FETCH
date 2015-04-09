
        `include "header.v"

        module target_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.

// register file configuration

// application-specific register aliases.

// throttle for each pass of data acquisition.
// delay for anmux settling.


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


// // I/O expansion bus.
// alias_both exp                  [incr counter]
// alias_both exp_addr             [incr counter]
// vdefine exp_num_regs 32
// vdefine exp_top_reg ($exp_num_regs - 1)
// setvar exp_counter -1

// alias_src  keys                 [incr exp_counter]@exp
// alias_both leds                 [incr exp_counter]@exp

// alias_both anmux_ctrl           [incr exp_counter]@exp
// vdefine     anmux_enable_mask       0x0008
// vdefine     anmux_channel_mask      0x0007





addr == 16'h00 ? 16'he00f :  // <0085> jmp :main
addr == 16'h01 ? 16'h0199 :  // <0085> "

// register names for use by debugger.
addr == 16'h02 ? 16'h0018 :  // <0088> ($counter + 1)
// "       a"
addr == 16'h03 ? 16'h2020 :  // <0089>   
addr == 16'h04 ? 16'h2020 :  // <0089>   
addr == 16'h05 ? 16'h2020 :  // <0089>   
addr == 16'h06 ? 16'h6120 :  // <0089> a 
// "       b"
addr == 16'h07 ? 16'h2020 :  // <0090>   
addr == 16'h08 ? 16'h2020 :  // <0090>   
addr == 16'h09 ? 16'h2020 :  // <0090>   
addr == 16'h0a ? 16'h6220 :  // <0090> b 
// "       i"
addr == 16'h0b ? 16'h2020 :  // <0091>   
addr == 16'h0c ? 16'h2020 :  // <0091>   
addr == 16'h0d ? 16'h2020 :  // <0091>   
addr == 16'h0e ? 16'h6920 :  // <0091> i 
// "       j"
addr == 16'h0f ? 16'h2020 :  // <0092>   
addr == 16'h10 ? 16'h2020 :  // <0092>   
addr == 16'h11 ? 16'h2020 :  // <0092>   
addr == 16'h12 ? 16'h6a20 :  // <0092> j 
// "       x"
addr == 16'h13 ? 16'h2020 :  // <0093>   
addr == 16'h14 ? 16'h2020 :  // <0093>   
addr == 16'h15 ? 16'h2020 :  // <0093>   
addr == 16'h16 ? 16'h7820 :  // <0093> x 
// "       y"
addr == 16'h17 ? 16'h2020 :  // <0094>   
addr == 16'h18 ? 16'h2020 :  // <0094>   
addr == 16'h19 ? 16'h2020 :  // <0094>   
addr == 16'h1a ? 16'h7920 :  // <0094> y 
// "      g6"
addr == 16'h1b ? 16'h2020 :  // <0095>   
addr == 16'h1c ? 16'h2020 :  // <0095>   
addr == 16'h1d ? 16'h2020 :  // <0095>   
addr == 16'h1e ? 16'h3667 :  // <0095> 6g
// "      g7"
addr == 16'h1f ? 16'h2020 :  // <0096>   
addr == 16'h20 ? 16'h2020 :  // <0096>   
addr == 16'h21 ? 16'h2020 :  // <0096>   
addr == 16'h22 ? 16'h3767 :  // <0096> 7g
// "//  rstk"
addr == 16'h23 ? 16'h2f2f :  // <0097> //
addr == 16'h24 ? 16'h2020 :  // <0097>   
addr == 16'h25 ? 16'h7372 :  // <0097> sr
addr == 16'h26 ? 16'h6b74 :  // <0097> kt
// "  ev_pri"
addr == 16'h27 ? 16'h2020 :  // <0098>   
addr == 16'h28 ? 16'h7665 :  // <0098> ve
addr == 16'h29 ? 16'h705f :  // <0098> p_
addr == 16'h2a ? 16'h6972 :  // <0098> ir
// "softevnt"
addr == 16'h2b ? 16'h6f73 :  // <0099> os
addr == 16'h2c ? 16'h7466 :  // <0099> tf
addr == 16'h2d ? 16'h7665 :  // <0099> ve
addr == 16'h2e ? 16'h746e :  // <0099> tn
// "ustimer0"
addr == 16'h2f ? 16'h7375 :  // <0100> su
addr == 16'h30 ? 16'h6974 :  // <0100> it
addr == 16'h31 ? 16'h656d :  // <0100> em
addr == 16'h32 ? 16'h3072 :  // <0100> 0r
// "mstimer0"
addr == 16'h33 ? 16'h736d :  // <0101> sm
addr == 16'h34 ? 16'h6974 :  // <0101> it
addr == 16'h35 ? 16'h656d :  // <0101> em
addr == 16'h36 ? 16'h3072 :  // <0101> 0r
// "mstimer1"
addr == 16'h37 ? 16'h736d :  // <0102> sm
addr == 16'h38 ? 16'h6974 :  // <0102> it
addr == 16'h39 ? 16'h656d :  // <0102> em
addr == 16'h3a ? 16'h3172 :  // <0102> 1r
// "//adcctl"
addr == 16'h3b ? 16'h2f2f :  // <0103> //
addr == 16'h3c ? 16'h6461 :  // <0103> da
addr == 16'h3d ? 16'h6363 :  // <0103> cc
addr == 16'h3e ? 16'h6c74 :  // <0103> lt
// "//avwrdt"
addr == 16'h3f ? 16'h2f2f :  // <0104> //
addr == 16'h40 ? 16'h7661 :  // <0104> va
addr == 16'h41 ? 16'h7277 :  // <0104> rw
addr == 16'h42 ? 16'h7464 :  // <0104> td
// "av_rd_dt"
addr == 16'h43 ? 16'h7661 :  // <0105> va
addr == 16'h44 ? 16'h725f :  // <0105> r_
addr == 16'h45 ? 16'h5f64 :  // <0105> _d
addr == 16'h46 ? 16'h7464 :  // <0105> td
// "av_ad_hi"
addr == 16'h47 ? 16'h7661 :  // <0106> va
addr == 16'h48 ? 16'h615f :  // <0106> a_
addr == 16'h49 ? 16'h5f64 :  // <0106> _d
addr == 16'h4a ? 16'h6968 :  // <0106> ih
// "av_ad_lo"
addr == 16'h4b ? 16'h7661 :  // <0107> va
addr == 16'h4c ? 16'h615f :  // <0107> a_
addr == 16'h4d ? 16'h5f64 :  // <0107> _d
addr == 16'h4e ? 16'h6f6c :  // <0107> ol
// "//uartdt"
addr == 16'h4f ? 16'h2f2f :  // <0108> //
addr == 16'h50 ? 16'h6175 :  // <0108> au
addr == 16'h51 ? 16'h7472 :  // <0108> tr
addr == 16'h52 ? 16'h7464 :  // <0108> td
// "uartstat"
addr == 16'h53 ? 16'h6175 :  // <0109> au
addr == 16'h54 ? 16'h7472 :  // <0109> tr
addr == 16'h55 ? 16'h7473 :  // <0109> ts
addr == 16'h56 ? 16'h7461 :  // <0109> ta
// "exp_data"
addr == 16'h57 ? 16'h7865 :  // <0110> xe
addr == 16'h58 ? 16'h5f70 :  // <0110> _p
addr == 16'h59 ? 16'h6164 :  // <0110> ad
addr == 16'h5a ? 16'h6174 :  // <0110> at
// "exp_addr"
addr == 16'h5b ? 16'h7865 :  // <0111> xe
addr == 16'h5c ? 16'h5f70 :  // <0111> _p
addr == 16'h5d ? 16'h6461 :  // <0111> da
addr == 16'h5e ? 16'h7264 :  // <0111> rd

// libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.

// driver library for synapse316_uart simple async transceiver.






// routine sends out the low byte from a to the UART.  blocks until the FIFO accepts the byte.
// ######## func putchar_fduart // = 0x005f
addr == 16'h5f ? 16'h2004 :  // <0044> push x // func putchar_fduart

addr == 16'h60 ? 16'h1000 :  // <0046> x = a

// wait for FIFO to be available.
addr == 16'h61 ? 16'h0202 :  // <0049> a = $atx_fifo_full_mask
// :pcfduart_wait_for_idle // = 0x0062
addr == 16'h62 ? 16'h0414 :  // <0051> b = fduart_status
addr == 16'h63 ? 16'he403 :  // <0052> bn and0z :pcfduart_wait_for_idle
addr == 16'h64 ? 16'h0062 :  // <0052> "

// push word to the UART.  its low byte is a character.
addr == 16'h65 ? 16'h4c04 :  // <0055> fduart_data = x
addr == 16'h66 ? 16'h1008 :  // <0056> pop x // end_func
addr == 16'h67 ? 16'hfc00 :  // <0056> end_func

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// ######## func getchar_fduart // = 0x0068
// wait until FIFO is populated.
addr == 16'h68 ? 16'h0208 :  // <0062> a = $arx_fifo_empty_mask
// :wait_for_busy // = 0x0069
addr == 16'h69 ? 16'h0414 :  // <0064> b = fduart_status
addr == 16'h6a ? 16'he403 :  // <0065> bn and0z :wait_for_busy
addr == 16'h6b ? 16'h0069 :  // <0065> "
addr == 16'h6c ? 16'h0013 :  // <0066> a = fduart_data
addr == 16'h6d ? 16'hfc00 :  // <0067> end_func

// returns a character in a, or -1 if none.
// ######## func pollchar_fduart // = 0x006e
// check for FIFO is populated.
addr == 16'h6e ? 16'h0208 :  // <0072> a = $arx_fifo_empty_mask
addr == 16'h6f ? 16'h0414 :  // <0073> b = fduart_status
addr == 16'h70 ? 16'he403 :  // <0074> bn and0z :none
addr == 16'h71 ? 16'h0074 :  // <0074> "
addr == 16'h72 ? 16'h0013 :  // <0075> a = fduart_data
addr == 16'h73 ? 16'hfc00 :  // <0076> rtn
// :none // = 0x0074
addr == 16'h74 ? 16'h0360 :  // <0078> a = -1
addr == 16'h75 ? 16'hfc00 :  // <0079> end_func



// bit-bang a complete SPI transaction.
// pass mo data in a, transaction width (# of bits) in b.
// returns mi data in a
// ######## func spi_exchange // = 0x0076
addr == 16'h76 ? 16'h2002 :  // <0005> push i // func spi_exchange
addr == 16'h77 ? 16'h2003 :  // <0005> push j // "
addr == 16'h78 ? 16'h2004 :  // <0005> push x // "
addr == 16'h79 ? 16'h2005 :  // <0005> push y // "
addr == 16'h7a ? 16'h2006 :  // <0005> push g6 // "
addr == 16'h7b ? 16'h2007 :  // <0005> push g7 // "
// keeping mo data in g6, mi data in g7.
addr == 16'h7c ? 16'h1800 :  // <0007> g6 = a
addr == 16'h7d ? 16'h1e00 :  // <0008> g7 = 0
// keeping bit counter in i.
addr == 16'h7e ? 16'h0801 :  // <0010> i = b
addr == 16'h7f ? 16'h0f60 :  // <0011> j = -1
addr == 16'h80 ? 16'h1760 :  // <0012> y = -1
// :next_bit // = 0x0081
// output the msb of mo, along with a low clock phase and low csn.
addr == 16'h81 ? 16'h0006 :  // <0015> a = g6
addr == 16'h82 ? 16'h0350 :  // <0016> a = a>>1
addr == 16'h83 ? 16'h0350 :  // <0017> a = a>>1
addr == 16'h84 ? 16'h0350 :  // <0018> a = a>>1
addr == 16'h85 ? 16'h0353 :  // <0019> a = a>>4
addr == 16'h86 ? 16'h0353 :  // <0020> a = a>>4
addr == 16'h87 ? 16'h0353 :  // <0021> a = a>>4
addr == 16'h88 ? 16'h3800 :  // <0022> de0nano_adc_ctrl = a
// wait about 500 ns (for about 1 Mhz sck) assuming 50 MHz sysclk.
addr == 16'h89 ? 16'h1206 :  // <0024> x = 6
// :wait1 // = 0x008a
addr == 16'h8a ? 16'hc800 :  // <0026> x = x+y
addr == 16'h8b ? 16'h1320 :  // <0026> "
addr == 16'h8c ? 16'he402 :  // <0027> bn xz :wait1
addr == 16'h8d ? 16'h008a :  // <0027> "
// output a high clock phase.
addr == 16'h8e ? 16'h0602 :  // <0029> b = $de0nano_adc_sck_mask
addr == 16'h8f ? 16'hc800 :  // <0030> de0nano_adc_ctrl = or
addr == 16'h90 ? 16'h3b34 :  // <0030> "
// sample mi.
addr == 16'h91 ? 16'h0007 :  // <0032> a = g7
addr == 16'h92 ? 16'h0351 :  // <0033> a = a<<1
addr == 16'h93 ? 16'h040e :  // <0034> b = de0nano_adc_ctrl
addr == 16'h94 ? 16'hc800 :  // <0035> g7 = or
addr == 16'h95 ? 16'h1f34 :  // <0035> "
// wait about 500 ns (for about 1 Mhz sck) assuming 50 MHz sysclk.
addr == 16'h96 ? 16'h1206 :  // <0037> x = 6
// :wait2 // = 0x0097
addr == 16'h97 ? 16'hc800 :  // <0039> x = x+y
addr == 16'h98 ? 16'h1320 :  // <0039> "
addr == 16'h99 ? 16'he402 :  // <0040> bn xz :wait2
addr == 16'h9a ? 16'h0097 :  // <0040> "
// shift mo bits.
addr == 16'h9b ? 16'h0006 :  // <0042> a = g6
addr == 16'h9c ? 16'h0351 :  // <0043> a = a<<1
addr == 16'h9d ? 16'h1800 :  // <0044> g6 = a
// count bits
addr == 16'h9e ? 16'hc800 :  // <0046> i = i+j
addr == 16'h9f ? 16'h0b10 :  // <0046> "
addr == 16'ha0 ? 16'he401 :  // <0047> bn iz :next_bit
addr == 16'ha1 ? 16'h0081 :  // <0047> "
// idle the SPI bus with a high clock phase and high csn.
addr == 16'ha2 ? 16'h3a06 :  // <0049> de0nano_adc_ctrl = ($de0nano_adc_csn_mask | $de0nano_adc_sck_mask)
// wait about 500 ns (for about 1 Mhz sck) assuming 50 MHz sysclk.
addr == 16'ha3 ? 16'h1206 :  // <0051> x = 6
// :wait3 // = 0x00a4
addr == 16'ha4 ? 16'hc800 :  // <0053> x = x+y
addr == 16'ha5 ? 16'h1320 :  // <0053> "
addr == 16'ha6 ? 16'he402 :  // <0054> bn xz :wait3
addr == 16'ha7 ? 16'h00a4 :  // <0054> "
addr == 16'ha8 ? 16'h0007 :  // <0055> a = g7
addr == 16'ha9 ? 16'h1c08 :  // <0056> pop g7 // end_func
addr == 16'haa ? 16'h1808 :  // <0056> pop g6 // "
addr == 16'hab ? 16'h1408 :  // <0056> pop y // "
addr == 16'hac ? 16'h1008 :  // <0056> pop x // "
addr == 16'had ? 16'h0c08 :  // <0056> pop j // "
addr == 16'hae ? 16'h0808 :  // <0056> pop i // "
addr == 16'haf ? 16'hfc00 :  // <0056> end_func

// pass desired ADC channel in a.
// returns ADC reading in a.
// ######## func de0nano_adc_read // = 0x00b0
addr == 16'hb0 ? 16'h203e :  // <0060> push rtna // func de0nano_adc_read
addr == 16'hb1 ? 16'h0352 :  // <0061> a = a<<4
addr == 16'hb2 ? 16'h0352 :  // <0062> a = a<<4
addr == 16'hb3 ? 16'h0351 :  // <0063> a = a<<1
addr == 16'hb4 ? 16'h0351 :  // <0064> a = a<<1
addr == 16'hb5 ? 16'h0351 :  // <0065> a = a<<1
addr == 16'hb6 ? 16'h0610 :  // <0066> b = 16
addr == 16'hb7 ? 16'hfba0 :  // <0067> call :spi_exchange
addr == 16'hb8 ? 16'h0076 :  // <0067> "
addr == 16'hb9 ? 16'hfc00 :  // <0067> "
addr == 16'hba ? 16'hf808 :  // <0068> pop rtna // end_func
addr == 16'hbb ? 16'hfc00 :  // <0068> end_func

// pass desired anmux channel in a.
// after this returns, CALLER MUST WAIT for muxer & current driver to
// settle down.  some delay for that is absolutely required (per testing).
// 5 ms wait works well 2015/04.
// ######## func anmux_set_chn // = 0x00bc
// set & enable analog muxer
addr == 16'hbc ? 16'h0608 :  // <0076> b = $anmux_enable_mask
addr == 16'hbd ? 16'hc800 :  // <0077> anmux_ctrl = or
addr == 16'hbe ? 16'h5f34 :  // <0077> "
addr == 16'hbf ? 16'hfc00 :  // <0078> end_func

// ######## func anmux_get_chn // = 0x00c0
addr == 16'hc0 ? 16'h0017 :  // <0081> a = anmux_ctrl
addr == 16'hc1 ? 16'h0607 :  // <0082> b = $anmux_channel_mask
addr == 16'hc2 ? 16'hc800 :  // <0083> a = and
addr == 16'hc3 ? 16'h0330 :  // <0083> "
addr == 16'hc4 ? 16'hfc00 :  // <0084> end_func

// return ADC reading in a.  this assumes anmux_set_chn was called some time ago.
// ######## func anmux_convert // = 0x00c5
addr == 16'hc5 ? 16'h203e :  // <0087> push rtna // func anmux_convert
// read ADC channel 7.  12 bits resolution.
// must do this 3 times to get the ADC's input path to settle down, especially if
// i'm driving it with high impedance & no buffer.
addr == 16'hc6 ? 16'h0207 :  // <0091> a = 7
addr == 16'hc7 ? 16'hfba0 :  // <0092> call :de0nano_adc_read
addr == 16'hc8 ? 16'h00b0 :  // <0092> "
addr == 16'hc9 ? 16'hfc00 :  // <0092> "
addr == 16'hca ? 16'h0207 :  // <0093> a = 7
addr == 16'hcb ? 16'hfba0 :  // <0094> call :de0nano_adc_read
addr == 16'hcc ? 16'h00b0 :  // <0094> "
addr == 16'hcd ? 16'hfc00 :  // <0094> "
addr == 16'hce ? 16'h0207 :  // <0095> a = 7
addr == 16'hcf ? 16'hfba0 :  // <0096> call :de0nano_adc_read
addr == 16'hd0 ? 16'h00b0 :  // <0096> "
addr == 16'hd1 ? 16'hfc00 :  // <0096> "
addr == 16'hd2 ? 16'hf808 :  // <0097> pop rtna // end_func
addr == 16'hd3 ? 16'hfc00 :  // <0097> end_func

// event loop.  this infrastructure is assembled directly into the main program, not a func.
// first instruction of an event handler should be the 7th cycle after reading its priority from the event controller here.
// :poll_events // = 0x00d4
// initialize prior to polling loop, for minimum latency.
addr == 16'hd4 ? 16'h07a0 :  // <0006> b = :event_table
addr == 16'hd5 ? 16'h01a8 :  // <0006> "
// 3-cycle polling loop.
// :poll_events_again // = 0x00d6
addr == 16'hd6 ? 16'h0009 :  // <0009> a = event_priority
addr == 16'hd7 ? 16'he000 :  // <0010> br 0z :poll_events_again
addr == 16'hd8 ? 16'h00d6 :  // <0010> "
// acknowledge the event to clear its capture register.  do this right away,
// so another occurrence of the same event can be captured right away in the controller.
addr == 16'hd9 ? 16'h2400 :  // <0013> event_priority = a
// compute an address in the event_table.  note the absence of a wait state for the adder here (not needed).
addr == 16'hda ? 16'hd300 :  // <0015> fetch rtna from ad0
addr == 16'hdb ? 16'hfbb0 :  // <0015> "
// jump to the address given in the event_table.  each handler MUST end with a end_event.
// each handler does NOT need to save ANY registers (e.g. no convention_gpx).  they can all be trashed.
// each handler is passed the event priority in a, in case the same handler is used on multiple priorities.
addr == 16'hdc ? 16'hfc00 :  // <0019> swapra = nop
// just returned here from the handler, in case the handler accidentally did a rtn.  this should NEVER happen.
addr == 16'hdd ? 16'h5ba0 :  // <0021> error_halt_code 0xffc0 // leds = 0xffc0
addr == 16'hde ? 16'hffc0 :  // <0021> "
addr == 16'hdf ? 16'he00f :  // <0021> error_halt_code 0xffc0
addr == 16'he0 ? 16'h00df :  // <0021> "


// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// ######## func fetch_byte // = 0x00e1
addr == 16'he1 ? 16'h0601 :  // <0005> b = 1
addr == 16'he2 ? 16'he003 :  // <0006> br and0z :pick_byte_even
addr == 16'he3 ? 16'h00ec :  // <0006> "
addr == 16'he4 ? 16'h0350 :  // <0007> a = a>>1
addr == 16'he5 ? 16'h0404 :  // <0008> b = x
addr == 16'he6 ? 16'hc800 :  // <0009> fetch a from a+b
addr == 16'he7 ? 16'hd300 :  // <0009> "
addr == 16'he8 ? 16'h03b0 :  // <0009> "
addr == 16'he9 ? 16'h0353 :  // <0010> a = a>>4
addr == 16'hea ? 16'h0353 :  // <0011> a = a>>4
addr == 16'heb ? 16'hfc00 :  // <0012> rtn
// :pick_byte_even // = 0x00ec
addr == 16'hec ? 16'h0350 :  // <0014> a = a>>1
addr == 16'hed ? 16'h0404 :  // <0015> b = x
addr == 16'hee ? 16'hc800 :  // <0016> fetch a from a+b
addr == 16'hef ? 16'hd300 :  // <0016> "
addr == 16'hf0 ? 16'h03b0 :  // <0016> "
addr == 16'hf1 ? 16'h06ff :  // <0017> b = 0xff
addr == 16'hf2 ? 16'hc800 :  // <0018> a = and
addr == 16'hf3 ? 16'h0330 :  // <0018> "
addr == 16'hf4 ? 16'hfc00 :  // <0019> end_func

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// ######## func find_in_fetch // = 0x00f5
addr == 16'hf5 ? 16'h2002 :  // <0027> push i // func find_in_fetch
addr == 16'hf6 ? 16'h2003 :  // <0027> push j // "
addr == 16'hf7 ? 16'h2005 :  // <0027> push y // "
addr == 16'hf8 ? 16'h203e :  // <0027> push rtna // "
addr == 16'hf9 ? 16'h1400 :  // <0028> y = a
addr == 16'hfa ? 16'h0f60 :  // <0029> j = -1
// :again // = 0x00fb
addr == 16'hfb ? 16'he001 :  // <0031> br iz :fail
addr == 16'hfc ? 16'h010b :  // <0031> "
addr == 16'hfd ? 16'h0b10 :  // <0032> i = ad1
addr == 16'hfe ? 16'h0002 :  // <0033> a = i
addr == 16'hff ? 16'hfba0 :  // <0034> call :fetch_byte
addr == 16'h100 ? 16'h00e1 :  // <0034> "
addr == 16'h101 ? 16'hfc00 :  // <0034> "
addr == 16'h102 ? 16'h0405 :  // <0035> b = y
addr == 16'h103 ? 16'he407 :  // <0036> bn eq :again
addr == 16'h104 ? 16'h00fb :  // <0036> "
// :found // = 0x0105
addr == 16'h105 ? 16'h0002 :  // <0038> a = i
addr == 16'h106 ? 16'hf808 :  // <0039> pop rtna // rtn
addr == 16'h107 ? 16'h1408 :  // <0039> pop y // "
addr == 16'h108 ? 16'h0c08 :  // <0039> pop j // "
addr == 16'h109 ? 16'h0808 :  // <0039> pop i // "
addr == 16'h10a ? 16'hfc00 :  // <0039> rtn
// :fail // = 0x010b
addr == 16'h10b ? 16'h0360 :  // <0041> a = -1
addr == 16'h10c ? 16'hf808 :  // <0042> pop rtna // end_func
addr == 16'h10d ? 16'h1408 :  // <0042> pop y // "
addr == 16'h10e ? 16'h0c08 :  // <0042> pop j // "
addr == 16'h10f ? 16'h0808 :  // <0042> pop i // "
addr == 16'h110 ? 16'hfc00 :  // <0042> end_func



// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x0111
// "0123456789abcdef"
addr == 16'h111 ? 16'h3130 :  // <0054> 10
addr == 16'h112 ? 16'h3332 :  // <0054> 32
addr == 16'h113 ? 16'h3534 :  // <0054> 54
addr == 16'h114 ? 16'h3736 :  // <0054> 76
addr == 16'h115 ? 16'h3938 :  // <0054> 98
addr == 16'h116 ? 16'h6261 :  // <0054> ba
addr == 16'h117 ? 16'h6463 :  // <0054> dc
addr == 16'h118 ? 16'h6665 :  // <0054> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// ######## func put4x // = 0x0119
addr == 16'h119 ? 16'h2004 :  // <0058> push x // func put4x
addr == 16'h11a ? 16'h2006 :  // <0058> push g6 // "
addr == 16'h11b ? 16'h203e :  // <0058> push rtna // "
addr == 16'h11c ? 16'h13a0 :  // <0059> x = :hexdigits
addr == 16'h11d ? 16'h0111 :  // <0059> "

addr == 16'h11e ? 16'h1800 :  // <0061> g6 = a
addr == 16'h11f ? 16'h07a0 :  // <0062> b = 0xF000
addr == 16'h120 ? 16'hf000 :  // <0062> "
addr == 16'h121 ? 16'hc800 :  // <0063> a = and
addr == 16'h122 ? 16'h0330 :  // <0063> "
addr == 16'h123 ? 16'h0353 :  // <0064> a = a>>4
addr == 16'h124 ? 16'h0353 :  // <0065> a = a>>4
addr == 16'h125 ? 16'h0353 :  // <0066> a = a>>4
addr == 16'h126 ? 16'hfba0 :  // <0067> call fetch_byte
addr == 16'h127 ? 16'h00e1 :  // <0067> "
addr == 16'h128 ? 16'hfc00 :  // <0067> "
addr == 16'h129 ? 16'h0000 :  // <0068> a = a // putchar a
addr == 16'h12a ? 16'hfba0 :  // <0068> putchar a
addr == 16'h12b ? 16'h005f :  // <0068> "
addr == 16'h12c ? 16'hfc00 :  // <0068> "

addr == 16'h12d ? 16'h0006 :  // <0070> a = g6
addr == 16'h12e ? 16'h07a0 :  // <0071> b = 0x0F00
addr == 16'h12f ? 16'h0f00 :  // <0071> "
addr == 16'h130 ? 16'hc800 :  // <0072> a = and
addr == 16'h131 ? 16'h0330 :  // <0072> "
addr == 16'h132 ? 16'h0353 :  // <0073> a = a>>4
addr == 16'h133 ? 16'h0353 :  // <0074> a = a>>4
addr == 16'h134 ? 16'hfba0 :  // <0075> call fetch_byte
addr == 16'h135 ? 16'h00e1 :  // <0075> "
addr == 16'h136 ? 16'hfc00 :  // <0075> "
addr == 16'h137 ? 16'h0000 :  // <0076> a = a // putchar a
addr == 16'h138 ? 16'hfba0 :  // <0076> putchar a
addr == 16'h139 ? 16'h005f :  // <0076> "
addr == 16'h13a ? 16'hfc00 :  // <0076> "

addr == 16'h13b ? 16'h0006 :  // <0078> a = g6
addr == 16'h13c ? 16'h06f0 :  // <0079> b = 0x00F0
addr == 16'h13d ? 16'hc800 :  // <0080> a = and
addr == 16'h13e ? 16'h0330 :  // <0080> "
addr == 16'h13f ? 16'h0353 :  // <0081> a = a>>4
addr == 16'h140 ? 16'hfba0 :  // <0082> call fetch_byte
addr == 16'h141 ? 16'h00e1 :  // <0082> "
addr == 16'h142 ? 16'hfc00 :  // <0082> "
addr == 16'h143 ? 16'h0000 :  // <0083> a = a // putchar a
addr == 16'h144 ? 16'hfba0 :  // <0083> putchar a
addr == 16'h145 ? 16'h005f :  // <0083> "
addr == 16'h146 ? 16'hfc00 :  // <0083> "

addr == 16'h147 ? 16'h0006 :  // <0085> a = g6
addr == 16'h148 ? 16'h060f :  // <0086> b = 0x000F
addr == 16'h149 ? 16'hc800 :  // <0087> a = and
addr == 16'h14a ? 16'h0330 :  // <0087> "
addr == 16'h14b ? 16'hfba0 :  // <0088> call fetch_byte
addr == 16'h14c ? 16'h00e1 :  // <0088> "
addr == 16'h14d ? 16'hfc00 :  // <0088> "
addr == 16'h14e ? 16'h0000 :  // <0089> a = a // putchar a
addr == 16'h14f ? 16'hfba0 :  // <0089> putchar a
addr == 16'h150 ? 16'h005f :  // <0089> "
addr == 16'h151 ? 16'hfc00 :  // <0089> "

addr == 16'h152 ? 16'hf808 :  // <0091> pop rtna // end_func
addr == 16'h153 ? 16'h1808 :  // <0091> pop g6 // "
addr == 16'h154 ? 16'h1008 :  // <0091> pop x // "
addr == 16'h155 ? 16'hfc00 :  // <0091> end_func

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// ######## func get4x // = 0x0156
addr == 16'h156 ? 16'h2002 :  // <0095> push i // func get4x
addr == 16'h157 ? 16'h2003 :  // <0095> push j // "
addr == 16'h158 ? 16'h2004 :  // <0095> push x // "
addr == 16'h159 ? 16'h2005 :  // <0095> push y // "
addr == 16'h15a ? 16'h203e :  // <0095> push rtna // "
// y = digit counter
// j = sum
addr == 16'h15b ? 16'h1604 :  // <0098> y = 4
// :again // = 0x015c
addr == 16'h15c ? 16'hfba0 :  // <0100> getchar
addr == 16'h15d ? 16'h0068 :  // <0100> "
addr == 16'h15e ? 16'hfc00 :  // <0100> "
addr == 16'h15f ? 16'h2000 :  // <0100> push a // "
addr == 16'h160 ? 16'h0000 :  // <0100> a = a // "
addr == 16'h161 ? 16'hfba0 :  // <0100> "
addr == 16'h162 ? 16'h005f :  // <0100> "
addr == 16'h163 ? 16'hfc00 :  // <0100> "
addr == 16'h164 ? 16'h0008 :  // <0100> pop a // "
addr == 16'h165 ? 16'h13a0 :  // <0101> x = :hexdigits
addr == 16'h166 ? 16'h0111 :  // <0101> "
addr == 16'h167 ? 16'h0a10 :  // <0102> i = 16
addr == 16'h168 ? 16'hfba0 :  // <0103> call :find_in_fetch
addr == 16'h169 ? 16'h00f5 :  // <0103> "
addr == 16'h16a ? 16'hfc00 :  // <0103> "
addr == 16'h16b ? 16'h0760 :  // <0104> b = -1
addr == 16'h16c ? 16'he007 :  // <0105> br eq :fail
addr == 16'h16d ? 16'h0181 :  // <0105> "
addr == 16'h16e ? 16'h0400 :  // <0106> b = a
addr == 16'h16f ? 16'h0003 :  // <0107> a = j
addr == 16'h170 ? 16'h0352 :  // <0108> a = a<<4
addr == 16'h171 ? 16'hc800 :  // <0109> j = or
addr == 16'h172 ? 16'h0f34 :  // <0109> "
addr == 16'h173 ? 16'h1360 :  // <0110> x = -1
addr == 16'h174 ? 16'hc800 :  // <0111> y = x+y
addr == 16'h175 ? 16'h1720 :  // <0111> "
addr == 16'h176 ? 16'h0005 :  // <0112> a = y
addr == 16'h177 ? 16'he400 :  // <0113> bn az :again
addr == 16'h178 ? 16'h015c :  // <0113> "
addr == 16'h179 ? 16'h0003 :  // <0114> a = j
addr == 16'h17a ? 16'h0600 :  // <0115> b = 0
addr == 16'h17b ? 16'hf808 :  // <0116> pop rtna // rtn
addr == 16'h17c ? 16'h1408 :  // <0116> pop y // "
addr == 16'h17d ? 16'h1008 :  // <0116> pop x // "
addr == 16'h17e ? 16'h0c08 :  // <0116> pop j // "
addr == 16'h17f ? 16'h0808 :  // <0116> pop i // "
addr == 16'h180 ? 16'hfc00 :  // <0116> rtn
// :fail // = 0x0181
addr == 16'h181 ? 16'h0760 :  // <0118> b = -1
addr == 16'h182 ? 16'hf808 :  // <0119> pop rtna // end_func
addr == 16'h183 ? 16'h1408 :  // <0119> pop y // "
addr == 16'h184 ? 16'h1008 :  // <0119> pop x // "
addr == 16'h185 ? 16'h0c08 :  // <0119> pop j // "
addr == 16'h186 ? 16'h0808 :  // <0119> pop i // "
addr == 16'h187 ? 16'hfc00 :  // <0119> end_func

// routine waits a number of milliseconds given in a.
// ######## func spinwait // = 0x0188
addr == 16'h188 ? 16'h2004 :  // <0002> push x // func spinwait
addr == 16'h189 ? 16'h2005 :  // <0002> push y // "
//patch
//rtn
addr == 16'h18a ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x018b
addr == 16'h18b ? 16'h13a0 :  // <0007> x = 16666
addr == 16'h18c ? 16'h411a :  // <0007> "
addr == 16'h18d ? 16'h1760 :  // <0008> y = -1
addr == 16'h18e ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x018f
// use of the ad2 name overrides auto-nop here.
addr == 16'h18f ? 16'h1320 :  // <0012> x = ad2
addr == 16'h190 ? 16'he402 :  // <0013> bn xz :spinwait_inner
addr == 16'h191 ? 16'h018f :  // <0013> "
addr == 16'h192 ? 16'hc800 :  // <0014> a = a+b
addr == 16'h193 ? 16'h0300 :  // <0014> "
addr == 16'h194 ? 16'he400 :  // <0015> bn az :spinwait_outer
addr == 16'h195 ? 16'h018b :  // <0015> "
addr == 16'h196 ? 16'h1408 :  // <0016> pop y // end_func
addr == 16'h197 ? 16'h1008 :  // <0016> pop x // "
addr == 16'h198 ? 16'hfc00 :  // <0016> end_func



// #########################################################################
// :main // = 0x0199

// soft_event = $event_controller_reset_mask
// soft_event = 0
// mstimer0 = 1000
// :waiting
// a = event_priority
// br az :waiting
// event_priority = a
// putasc "."
// jmp :main

// clear the first 64k of RAM.
addr == 16'h199 ? 16'h4600 :  // <0136> av_ad_hi = 0
addr == 16'h19a ? 16'h0200 :  // <0137> a = 0
addr == 16'h19b ? 16'h0602 :  // <0138> b = 2
// :clear_next_word // = 0x019c
addr == 16'h19c ? 16'h4800 :  // <0140> av_ad_lo = a
addr == 16'h19d ? 16'h3e00 :  // <0141> av_write_data = 0
addr == 16'h19e ? 16'h0300 :  // <0142> a = ad0
addr == 16'h19f ? 16'he400 :  // <0143> bn az :clear_next_word
addr == 16'h1a0 ? 16'h019c :  // <0143> "

// start handling events.
addr == 16'h1a1 ? 16'h2ba0 :  // <0146> soft_event = $event_controller_reset_mask
addr == 16'h1a2 ? 16'h8000 :  // <0146> "
addr == 16'h1a3 ? 16'h2a00 :  // <0147> soft_event = 0
addr == 16'h1a4 ? 16'h33a0 :  // <0148> mstimer0 = 1000
addr == 16'h1a5 ? 16'h03e8 :  // <0148> "
addr == 16'h1a6 ? 16'he00f :  // <0149> jmp :poll_events
addr == 16'h1a7 ? 16'h00d4 :  // <0149> "

// event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.
// event 0 not used in this app anyway.
// :event_table // = 0x01a8
addr == 16'h1a8 ? 16'h00d4 :  // <0154> ([label :poll_events])
addr == 16'h1a9 ? 16'h01b5 :  // <0155> ([label :uart_rx_handler])
addr == 16'h1aa ? 16'h01b7 :  // <0156> ([label :uart_rx_overflow_handler])
addr == 16'h1ab ? 16'h01bd :  // <0157> ([label :uart_tx_overflow_handler])
addr == 16'h1ac ? 16'h01c3 :  // <0158> ([label :ustimer0_handler])
addr == 16'h1ad ? 16'h01c5 :  // <0159> ([label :mstimer0_handler])
addr == 16'h1ae ? 16'h01e0 :  // <0160> ([label :mstimer1_handler])
addr == 16'h1af ? 16'h0218 :  // <0161> ([label :key0_handler])
addr == 16'h1b0 ? 16'h0224 :  // <0162> ([label :key1_handler])
addr == 16'h1b1 ? 16'h0230 :  // <0163> ([label :softevent3_handler])
addr == 16'h1b2 ? 16'h0232 :  // <0164> ([label :softevent2_handler])
addr == 16'h1b3 ? 16'h0234 :  // <0165> ([label :softevent1_handler])
addr == 16'h1b4 ? 16'h0236 :  // <0166> ([label :softevent0_handler])

// #########################################################################

// ######## event uart_rx_handler // = 0x01b5
// handle data here
addr == 16'h1b5 ? 16'he00f :  // <0172> end_event
addr == 16'h1b6 ? 16'h00d4 :  // <0172> "

// ######## event uart_rx_overflow_handler // = 0x01b7
addr == 16'h1b7 ? 16'h5ba0 :  // <0175> error_halt_code $err_rx_overflow // leds = 0xfffe
addr == 16'h1b8 ? 16'hfffe :  // <0175> "
addr == 16'h1b9 ? 16'he00f :  // <0175> error_halt_code $err_rx_overflow
addr == 16'h1ba ? 16'h01b9 :  // <0175> "
addr == 16'h1bb ? 16'he00f :  // <0176> end_event
addr == 16'h1bc ? 16'h00d4 :  // <0176> "

// ######## event uart_tx_overflow_handler // = 0x01bd
addr == 16'h1bd ? 16'h5ba0 :  // <0179> error_halt_code $err_tx_overflow // leds = 0xfffd
addr == 16'h1be ? 16'hfffd :  // <0179> "
addr == 16'h1bf ? 16'he00f :  // <0179> error_halt_code $err_tx_overflow
addr == 16'h1c0 ? 16'h01bf :  // <0179> "
addr == 16'h1c1 ? 16'he00f :  // <0180> end_event
addr == 16'h1c2 ? 16'h00d4 :  // <0180> "

// ######## event ustimer0_handler // = 0x01c3
addr == 16'h1c3 ? 16'he00f :  // <0183> end_event
addr == 16'h1c4 ? 16'h00d4 :  // <0183> "

// ######## event mstimer0_handler // = 0x01c5
// start timer again.
addr == 16'h1c5 ? 16'h33a0 :  // <0187> mstimer0 = 1000
addr == 16'h1c6 ? 16'h03e8 :  // <0187> "

// daq pass counter in RAM.
addr == 16'h1c7 ? 16'h4600 :  // <0190> av_ad_hi = 0
addr == 16'h1c8 ? 16'h4a00 :  // <0191> ram_read_lo a = $ram_daq_pass_cnt // av_ad_lo = 0x00000000
addr == 16'h1c9 ? 16'h000f :  // <0191> ram_read_lo a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h1ca ? 16'h0010 :  // <0191> ram_read_lo a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h1cb ? 16'h0601 :  // <0192> b = 1
addr == 16'h1cc ? 16'hc800 :  // <0193> a = a+b
addr == 16'h1cd ? 16'h0300 :  // <0193> "
addr == 16'h1ce ? 16'h5800 :  // <0194> leds = a
addr == 16'h1cf ? 16'h4a00 :  // <0195> ram_write_lo $ram_daq_pass_cnt = a // av_ad_lo = 0x00000000
addr == 16'h1d0 ? 16'h3c00 :  // <0195> ram_write_lo $ram_daq_pass_cnt = a // av_write_data = a
addr == 16'h1d1 ? 16'hfba0 :  // <0196> call :put4x
addr == 16'h1d2 ? 16'h0119 :  // <0196> "
addr == 16'h1d3 ? 16'hfc00 :  // <0196> "
addr == 16'h1d4 ? 16'h023a :  // <0197> a = 58 // putasc ":"
addr == 16'h1d5 ? 16'h0000 :  // <0197> a = a // putasc ":"
addr == 16'h1d6 ? 16'hfba0 :  // <0197> putasc ":"
addr == 16'h1d7 ? 16'h005f :  // <0197> "
addr == 16'h1d8 ? 16'hfc00 :  // <0197> "

// acquire & report all anmux channels.
addr == 16'h1d9 ? 16'h0207 :  // <0200> a = 7
addr == 16'h1da ? 16'hfba0 :  // <0201> call :anmux_set_chn
addr == 16'h1db ? 16'h00bc :  // <0201> "
addr == 16'h1dc ? 16'hfc00 :  // <0201> "
addr == 16'h1dd ? 16'h3605 :  // <0202> mstimer1 = 5
addr == 16'h1de ? 16'he00f :  // <0203> end_event
addr == 16'h1df ? 16'h00d4 :  // <0203> "

// ######## event mstimer1_handler // = 0x01e0
// report a reading from the current anmux channel.
addr == 16'h1e0 ? 16'h0220 :  // <0207> a = 32 // putasc " "
addr == 16'h1e1 ? 16'h0000 :  // <0207> a = a // putasc " "
addr == 16'h1e2 ? 16'hfba0 :  // <0207> putasc " "
addr == 16'h1e3 ? 16'h005f :  // <0207> "
addr == 16'h1e4 ? 16'hfc00 :  // <0207> "
addr == 16'h1e5 ? 16'h0273 :  // <0208> a = 115 // putasc "s"
addr == 16'h1e6 ? 16'h0000 :  // <0208> a = a // putasc "s"
addr == 16'h1e7 ? 16'hfba0 :  // <0208> putasc "s"
addr == 16'h1e8 ? 16'h005f :  // <0208> "
addr == 16'h1e9 ? 16'hfc00 :  // <0208> "
addr == 16'h1ea ? 16'hfba0 :  // <0209> call :anmux_get_chn
addr == 16'h1eb ? 16'h00c0 :  // <0209> "
addr == 16'h1ec ? 16'hfc00 :  // <0209> "
addr == 16'h1ed ? 16'h0630 :  // <0210> b = 48 // asc b = "0"
addr == 16'h1ee ? 16'hc800 :  // <0211> a = a+b // putchar a+b
addr == 16'h1ef ? 16'h0300 :  // <0211> "
addr == 16'h1f0 ? 16'hfba0 :  // <0211> putchar a+b
addr == 16'h1f1 ? 16'h005f :  // <0211> "
addr == 16'h1f2 ? 16'hfc00 :  // <0211> "
addr == 16'h1f3 ? 16'h023d :  // <0212> a = 61 // putasc "="
addr == 16'h1f4 ? 16'h0000 :  // <0212> a = a // putasc "="
addr == 16'h1f5 ? 16'hfba0 :  // <0212> putasc "="
addr == 16'h1f6 ? 16'h005f :  // <0212> "
addr == 16'h1f7 ? 16'hfc00 :  // <0212> "
addr == 16'h1f8 ? 16'hfba0 :  // <0213> call :anmux_convert
addr == 16'h1f9 ? 16'h00c5 :  // <0213> "
addr == 16'h1fa ? 16'hfc00 :  // <0213> "
addr == 16'h1fb ? 16'hfba0 :  // <0214> call :put4x
addr == 16'h1fc ? 16'h0119 :  // <0214> "
addr == 16'h1fd ? 16'hfc00 :  // <0214> "

// decrement anmux channel & start waiting again.
addr == 16'h1fe ? 16'hfba0 :  // <0217> call :anmux_get_chn
addr == 16'h1ff ? 16'h00c0 :  // <0217> "
addr == 16'h200 ? 16'hfc00 :  // <0217> "
addr == 16'h201 ? 16'he000 :  // <0218> br az :all_done
addr == 16'h202 ? 16'h020c :  // <0218> "
addr == 16'h203 ? 16'h0760 :  // <0219> b = -1
addr == 16'h204 ? 16'hc800 :  // <0220> a = a+b
addr == 16'h205 ? 16'h0300 :  // <0220> "
addr == 16'h206 ? 16'hfba0 :  // <0221> call :anmux_set_chn
addr == 16'h207 ? 16'h00bc :  // <0221> "
addr == 16'h208 ? 16'hfc00 :  // <0221> "
addr == 16'h209 ? 16'h3605 :  // <0222> mstimer1 = 5
addr == 16'h20a ? 16'he00f :  // <0223> event_return
addr == 16'h20b ? 16'h00d4 :  // <0223> "

// end of daq pass.
// :all_done // = 0x020c
addr == 16'h20c ? 16'h020d :  // <0227> a = 13 // puteol
addr == 16'h20d ? 16'h0000 :  // <0227> a = a // puteol
addr == 16'h20e ? 16'hfba0 :  // <0227> puteol
addr == 16'h20f ? 16'h005f :  // <0227> "
addr == 16'h210 ? 16'hfc00 :  // <0227> "
addr == 16'h211 ? 16'h020a :  // <0227> a = 10 // puteol
addr == 16'h212 ? 16'h0000 :  // <0227> a = a // puteol
addr == 16'h213 ? 16'hfba0 :  // <0227> puteol
addr == 16'h214 ? 16'h005f :  // <0227> "
addr == 16'h215 ? 16'hfc00 :  // <0227> "
addr == 16'h216 ? 16'he00f :  // <0228> end_event
addr == 16'h217 ? 16'h00d4 :  // <0228> "

// ######## event key0_handler // = 0x0218
addr == 16'h218 ? 16'h026b :  // <0231> a = 107 // putasc "k"
addr == 16'h219 ? 16'h0000 :  // <0231> a = a // putasc "k"
addr == 16'h21a ? 16'hfba0 :  // <0231> putasc "k"
addr == 16'h21b ? 16'h005f :  // <0231> "
addr == 16'h21c ? 16'hfc00 :  // <0231> "
addr == 16'h21d ? 16'h0230 :  // <0232> a = 48 // putasc "0"
addr == 16'h21e ? 16'h0000 :  // <0232> a = a // putasc "0"
addr == 16'h21f ? 16'hfba0 :  // <0232> putasc "0"
addr == 16'h220 ? 16'h005f :  // <0232> "
addr == 16'h221 ? 16'hfc00 :  // <0232> "
addr == 16'h222 ? 16'he00f :  // <0233> end_event
addr == 16'h223 ? 16'h00d4 :  // <0233> "

// ######## event key1_handler // = 0x0224
addr == 16'h224 ? 16'h026b :  // <0236> a = 107 // putasc "k"
addr == 16'h225 ? 16'h0000 :  // <0236> a = a // putasc "k"
addr == 16'h226 ? 16'hfba0 :  // <0236> putasc "k"
addr == 16'h227 ? 16'h005f :  // <0236> "
addr == 16'h228 ? 16'hfc00 :  // <0236> "
addr == 16'h229 ? 16'h0231 :  // <0237> a = 49 // putasc "1"
addr == 16'h22a ? 16'h0000 :  // <0237> a = a // putasc "1"
addr == 16'h22b ? 16'hfba0 :  // <0237> putasc "1"
addr == 16'h22c ? 16'h005f :  // <0237> "
addr == 16'h22d ? 16'hfc00 :  // <0237> "
addr == 16'h22e ? 16'he00f :  // <0238> end_event
addr == 16'h22f ? 16'h00d4 :  // <0238> "

// ######## event softevent3_handler // = 0x0230
addr == 16'h230 ? 16'he00f :  // <0241> end_event
addr == 16'h231 ? 16'h00d4 :  // <0241> "

// ######## event softevent2_handler // = 0x0232
addr == 16'h232 ? 16'he00f :  // <0244> end_event
addr == 16'h233 ? 16'h00d4 :  // <0244> "

// ######## event softevent1_handler // = 0x0234
addr == 16'h234 ? 16'he00f :  // <0247> end_event
addr == 16'h235 ? 16'h00d4 :  // <0247> "

// ######## event softevent0_handler // = 0x0236
addr == 16'h236 ? 16'he00f :  // <0250> end_event
addr == 16'h237 ? 16'h00d4 :  // <0250> "


        
                16'hxxxx;
        endmodule
    
