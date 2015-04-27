
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



// power relay duty cycles, in microseconds.  duty cycle time = relay OFF time.
// relay actually remains energized for about another 5 us after pwm goes high,
// due to the optocoupler pullup taking some time to climb through the MOSFET's threshold.



addr == 16'h00 ? 16'he00f :  // <0108> jmp :main
addr == 16'h01 ? 16'h0150 :  // <0108> "

addr == 16'h02 ? 16'h001a :  // <0110> emit_debugger_register_table  counter
// "       a"
addr == 16'h03 ? 16'h2020 :  // <0110>   
addr == 16'h04 ? 16'h2020 :  // <0110>   
addr == 16'h05 ? 16'h2020 :  // <0110>   
addr == 16'h06 ? 16'h6120 :  // <0110> a 
// "       b"
addr == 16'h07 ? 16'h2020 :  // <0110>   
addr == 16'h08 ? 16'h2020 :  // <0110>   
addr == 16'h09 ? 16'h2020 :  // <0110>   
addr == 16'h0a ? 16'h6220 :  // <0110> b 
// "       i"
addr == 16'h0b ? 16'h2020 :  // <0110>   
addr == 16'h0c ? 16'h2020 :  // <0110>   
addr == 16'h0d ? 16'h2020 :  // <0110>   
addr == 16'h0e ? 16'h6920 :  // <0110> i 
// "       j"
addr == 16'h0f ? 16'h2020 :  // <0110>   
addr == 16'h10 ? 16'h2020 :  // <0110>   
addr == 16'h11 ? 16'h2020 :  // <0110>   
addr == 16'h12 ? 16'h6a20 :  // <0110> j 
// "       x"
addr == 16'h13 ? 16'h2020 :  // <0110>   
addr == 16'h14 ? 16'h2020 :  // <0110>   
addr == 16'h15 ? 16'h2020 :  // <0110>   
addr == 16'h16 ? 16'h7820 :  // <0110> x 
// "       y"
addr == 16'h17 ? 16'h2020 :  // <0110>   
addr == 16'h18 ? 16'h2020 :  // <0110>   
addr == 16'h19 ? 16'h2020 :  // <0110>   
addr == 16'h1a ? 16'h7920 :  // <0110> y 
// "      g6"
addr == 16'h1b ? 16'h2020 :  // <0110>   
addr == 16'h1c ? 16'h2020 :  // <0110>   
addr == 16'h1d ? 16'h2020 :  // <0110>   
addr == 16'h1e ? 16'h3667 :  // <0110> 6g
// "      g7"
addr == 16'h1f ? 16'h2020 :  // <0110>   
addr == 16'h20 ? 16'h2020 :  // <0110>   
addr == 16'h21 ? 16'h2020 :  // <0110>   
addr == 16'h22 ? 16'h3767 :  // <0110> 7g
// "//rstk  "
addr == 16'h23 ? 16'h2f2f :  // <0110> //
addr == 16'h24 ? 16'h7372 :  // <0110> sr
addr == 16'h25 ? 16'h6b74 :  // <0110> kt
addr == 16'h26 ? 16'h2020 :  // <0110>   
// "  ev_pri"
addr == 16'h27 ? 16'h2020 :  // <0110>   
addr == 16'h28 ? 16'h7665 :  // <0110> ve
addr == 16'h29 ? 16'h705f :  // <0110> p_
addr == 16'h2a ? 16'h6972 :  // <0110> ir
// "softevnt"
addr == 16'h2b ? 16'h6f73 :  // <0110> os
addr == 16'h2c ? 16'h7466 :  // <0110> tf
addr == 16'h2d ? 16'h7665 :  // <0110> ve
addr == 16'h2e ? 16'h746e :  // <0110> tn
// "   usage"
addr == 16'h2f ? 16'h2020 :  // <0110>   
addr == 16'h30 ? 16'h7520 :  // <0110> u 
addr == 16'h31 ? 16'h6173 :  // <0110> as
addr == 16'h32 ? 16'h6567 :  // <0110> eg
// "ustimer0"
addr == 16'h33 ? 16'h7375 :  // <0110> su
addr == 16'h34 ? 16'h6974 :  // <0110> it
addr == 16'h35 ? 16'h656d :  // <0110> em
addr == 16'h36 ? 16'h3072 :  // <0110> 0r
// "mstimer0"
addr == 16'h37 ? 16'h736d :  // <0110> sm
addr == 16'h38 ? 16'h6974 :  // <0110> it
addr == 16'h39 ? 16'h656d :  // <0110> em
addr == 16'h3a ? 16'h3072 :  // <0110> 0r
// "mstimer1"
addr == 16'h3b ? 16'h736d :  // <0110> sm
addr == 16'h3c ? 16'h6974 :  // <0110> it
addr == 16'h3d ? 16'h656d :  // <0110> em
addr == 16'h3e ? 16'h3172 :  // <0110> 1r
// "spi_data"
addr == 16'h3f ? 16'h7073 :  // <0110> ps
addr == 16'h40 ? 16'h5f69 :  // <0110> _i
addr == 16'h41 ? 16'h6164 :  // <0110> ad
addr == 16'h42 ? 16'h6174 :  // <0110> at
// "//avwrdt"
addr == 16'h43 ? 16'h2f2f :  // <0110> //
addr == 16'h44 ? 16'h7661 :  // <0110> va
addr == 16'h45 ? 16'h7277 :  // <0110> rw
addr == 16'h46 ? 16'h7464 :  // <0110> td
// "av_rd_dt"
addr == 16'h47 ? 16'h7661 :  // <0110> va
addr == 16'h48 ? 16'h725f :  // <0110> r_
addr == 16'h49 ? 16'h5f64 :  // <0110> _d
addr == 16'h4a ? 16'h7464 :  // <0110> td
// "av_ad_hi"
addr == 16'h4b ? 16'h7661 :  // <0110> va
addr == 16'h4c ? 16'h615f :  // <0110> a_
addr == 16'h4d ? 16'h5f64 :  // <0110> _d
addr == 16'h4e ? 16'h6968 :  // <0110> ih
// "av_ad_lo"
addr == 16'h4f ? 16'h7661 :  // <0110> va
addr == 16'h50 ? 16'h615f :  // <0110> a_
addr == 16'h51 ? 16'h5f64 :  // <0110> _d
addr == 16'h52 ? 16'h6f6c :  // <0110> ol
// "//uartdt"
addr == 16'h53 ? 16'h2f2f :  // <0110> //
addr == 16'h54 ? 16'h6175 :  // <0110> au
addr == 16'h55 ? 16'h7472 :  // <0110> tr
addr == 16'h56 ? 16'h7464 :  // <0110> td
// "uartstat"
addr == 16'h57 ? 16'h6175 :  // <0110> au
addr == 16'h58 ? 16'h7472 :  // <0110> tr
addr == 16'h59 ? 16'h7473 :  // <0110> ts
addr == 16'h5a ? 16'h7461 :  // <0110> ta
// "    keys"
addr == 16'h5b ? 16'h2020 :  // <0110>   
addr == 16'h5c ? 16'h2020 :  // <0110>   
addr == 16'h5d ? 16'h656b :  // <0110> ek
addr == 16'h5e ? 16'h7379 :  // <0110> sy
// "    leds"
addr == 16'h5f ? 16'h2020 :  // <0110>   
addr == 16'h60 ? 16'h2020 :  // <0110>   
addr == 16'h61 ? 16'h656c :  // <0110> el
addr == 16'h62 ? 16'h7364 :  // <0110> sd
// "   anmux"
addr == 16'h63 ? 16'h2020 :  // <0110>   
addr == 16'h64 ? 16'h6120 :  // <0110> a 
addr == 16'h65 ? 16'h6d6e :  // <0110> mn
addr == 16'h66 ? 16'h7875 :  // <0110> xu
// "pwr_duty"
addr == 16'h67 ? 16'h7770 :  // <0110> wp
addr == 16'h68 ? 16'h5f72 :  // <0110> _r
addr == 16'h69 ? 16'h7564 :  // <0110> ud
addr == 16'h6a ? 16'h7974 :  // <0110> yt

// libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.

// event loop.  this infrastructure is assembled directly into the main program, not a func.
// first instruction of an event handler should be the 7th cycle after reading its priority from the event controller here.
// :poll_events // = 0x006b
// initialize prior to polling loop, for minimum latency.
addr == 16'h6b ? 16'h07a0 :  // <0006> b = :event_table
addr == 16'h6c ? 16'h016f :  // <0006> "
// 3-cycle polling loop.
// :poll_events_again // = 0x006d
addr == 16'h6d ? 16'h0009 :  // <0009> a = event_priority
addr == 16'h6e ? 16'he000 :  // <0010> br 0z :poll_events_again
addr == 16'h6f ? 16'h006d :  // <0010> "
// acknowledge the event to clear its capture register.  do this right away,
// so another occurrence of the same event can be captured right away in the controller.
addr == 16'h70 ? 16'h2400 :  // <0013> event_priority = a
// compute an address in the event_table.  note the absence of a wait state for the adder here (not needed).
addr == 16'h71 ? 16'hd300 :  // <0015> fetch rtna from ad0
addr == 16'h72 ? 16'hfbb0 :  // <0015> "
// jump to the address given in the event_table.  each handler MUST end with a end_event.
// each handler does NOT need to save ANY registers (e.g. no convention_gpx).  they can all be trashed.
// each handler is passed the event priority in a, in case the same handler is used on multiple priorities.
addr == 16'h73 ? 16'hfc00 :  // <0019> swapra = nop
// just returned here from the handler, in case the handler accidentally did a rtn.  this should NEVER happen.
addr == 16'h74 ? 16'h5fa0 :  // <0021> error_halt_code 0xffc0 // leds = 0xffc0
addr == 16'h75 ? 16'hffc0 :  // <0021> "
addr == 16'h76 ? 16'he00f :  // <0021> error_halt_code 0xffc0
addr == 16'h77 ? 16'h0076 :  // <0021> "


// driver library for synapse316_uart simple async transceiver.






// routine sends out the low byte from a to the UART.  blocks until the FIFO accepts the byte.
// ######## func putchar_fduart // = 0x0078
addr == 16'h78 ? 16'h2004 :  // <0044> push x // func putchar_fduart

addr == 16'h79 ? 16'h1000 :  // <0046> x = a

// wait for FIFO to be available.
addr == 16'h7a ? 16'h0202 :  // <0049> a = $atx_fifo_full_mask
// :pcfduart_wait_for_idle // = 0x007b
addr == 16'h7b ? 16'h0415 :  // <0051> b = fduart_status
addr == 16'h7c ? 16'he403 :  // <0052> bn and0z :pcfduart_wait_for_idle
addr == 16'h7d ? 16'h007b :  // <0052> "

// push word to the UART.  its low byte is a character.
addr == 16'h7e ? 16'h5004 :  // <0055> fduart_data = x
addr == 16'h7f ? 16'h1008 :  // <0056> pop x // end_func
addr == 16'h80 ? 16'hfc00 :  // <0056> end_func

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// ######## func getchar_fduart // = 0x0081
// wait until FIFO is populated.
addr == 16'h81 ? 16'h0208 :  // <0062> a = $arx_fifo_empty_mask
// :wait_for_busy // = 0x0082
addr == 16'h82 ? 16'h0415 :  // <0064> b = fduart_status
addr == 16'h83 ? 16'he403 :  // <0065> bn and0z :wait_for_busy
addr == 16'h84 ? 16'h0082 :  // <0065> "
addr == 16'h85 ? 16'h0014 :  // <0066> a = fduart_data
addr == 16'h86 ? 16'hfc00 :  // <0067> end_func

// returns a character in a, or -1 if none.
// ######## func pollchar_fduart // = 0x0087
// check for FIFO is populated.
addr == 16'h87 ? 16'h0208 :  // <0072> a = $arx_fifo_empty_mask
addr == 16'h88 ? 16'h0415 :  // <0073> b = fduart_status
addr == 16'h89 ? 16'he403 :  // <0074> bn and0z :none
addr == 16'h8a ? 16'h008d :  // <0074> "
addr == 16'h8b ? 16'h0014 :  // <0075> a = fduart_data
addr == 16'h8c ? 16'hfc00 :  // <0076> rtn
// :none // = 0x008d
addr == 16'h8d ? 16'h0360 :  // <0078> a = -1
addr == 16'h8e ? 16'hfc00 :  // <0079> end_func


// pass desired anmux channel in a.
// after this returns, CALLER MUST WAIT for muxer & current driver to
// settle down.  some delay for that is absolutely required (per testing).
// 5 ms wait works well 2015/04.
// ######## func anmux_set_chn // = 0x008f
// set & enable analog muxer
addr == 16'h8f ? 16'h0608 :  // <0007> b = $anmux_enable_mask
addr == 16'h90 ? 16'hc800 :  // <0008> anmux_ctrl = or
addr == 16'h91 ? 16'h6334 :  // <0008> "
addr == 16'h92 ? 16'hfc00 :  // <0009> end_func

// ######## func anmux_get_chn // = 0x0093
addr == 16'h93 ? 16'h0018 :  // <0012> a = anmux_ctrl
addr == 16'h94 ? 16'h0607 :  // <0013> b = $anmux_channel_mask
addr == 16'h95 ? 16'hc800 :  // <0014> a = and
addr == 16'h96 ? 16'h0330 :  // <0014> "
addr == 16'h97 ? 16'hfc00 :  // <0015> end_func


// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// ######## func fetch_byte // = 0x0098
addr == 16'h98 ? 16'h0601 :  // <0005> b = 1
addr == 16'h99 ? 16'he003 :  // <0006> br and0z :pick_byte_even
addr == 16'h9a ? 16'h00a3 :  // <0006> "
addr == 16'h9b ? 16'h0350 :  // <0007> a = a>>1
addr == 16'h9c ? 16'h0404 :  // <0008> b = x
addr == 16'h9d ? 16'hc800 :  // <0009> fetch a from a+b
addr == 16'h9e ? 16'hd300 :  // <0009> "
addr == 16'h9f ? 16'h03b0 :  // <0009> "
addr == 16'ha0 ? 16'h0353 :  // <0010> a = a>>4
addr == 16'ha1 ? 16'h0353 :  // <0011> a = a>>4
addr == 16'ha2 ? 16'hfc00 :  // <0012> rtn
// :pick_byte_even // = 0x00a3
addr == 16'ha3 ? 16'h0350 :  // <0014> a = a>>1
addr == 16'ha4 ? 16'h0404 :  // <0015> b = x
addr == 16'ha5 ? 16'hc800 :  // <0016> fetch a from a+b
addr == 16'ha6 ? 16'hd300 :  // <0016> "
addr == 16'ha7 ? 16'h03b0 :  // <0016> "
addr == 16'ha8 ? 16'h06ff :  // <0017> b = 0xff
addr == 16'ha9 ? 16'hc800 :  // <0018> a = and
addr == 16'haa ? 16'h0330 :  // <0018> "
addr == 16'hab ? 16'hfc00 :  // <0019> end_func

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// ######## func find_in_fetch // = 0x00ac
addr == 16'hac ? 16'h2002 :  // <0027> push i // func find_in_fetch
addr == 16'had ? 16'h2003 :  // <0027> push j // "
addr == 16'hae ? 16'h2005 :  // <0027> push y // "
addr == 16'haf ? 16'h203e :  // <0027> push rtna // "
addr == 16'hb0 ? 16'h1400 :  // <0028> y = a
addr == 16'hb1 ? 16'h0f60 :  // <0029> j = -1
// :again // = 0x00b2
addr == 16'hb2 ? 16'he001 :  // <0031> br iz :fail
addr == 16'hb3 ? 16'h00c2 :  // <0031> "
addr == 16'hb4 ? 16'h0b10 :  // <0032> i = ad1
addr == 16'hb5 ? 16'h0002 :  // <0033> a = i
addr == 16'hb6 ? 16'hfba0 :  // <0034> call :fetch_byte
addr == 16'hb7 ? 16'h0098 :  // <0034> "
addr == 16'hb8 ? 16'hfc00 :  // <0034> "
addr == 16'hb9 ? 16'h0405 :  // <0035> b = y
addr == 16'hba ? 16'he407 :  // <0036> bn eq :again
addr == 16'hbb ? 16'h00b2 :  // <0036> "
// :found // = 0x00bc
addr == 16'hbc ? 16'h0002 :  // <0038> a = i
addr == 16'hbd ? 16'hf808 :  // <0039> pop rtna // rtn
addr == 16'hbe ? 16'h1408 :  // <0039> pop y // "
addr == 16'hbf ? 16'h0c08 :  // <0039> pop j // "
addr == 16'hc0 ? 16'h0808 :  // <0039> pop i // "
addr == 16'hc1 ? 16'hfc00 :  // <0039> rtn
// :fail // = 0x00c2
addr == 16'hc2 ? 16'h0360 :  // <0041> a = -1
addr == 16'hc3 ? 16'hf808 :  // <0042> pop rtna // end_func
addr == 16'hc4 ? 16'h1408 :  // <0042> pop y // "
addr == 16'hc5 ? 16'h0c08 :  // <0042> pop j // "
addr == 16'hc6 ? 16'h0808 :  // <0042> pop i // "
addr == 16'hc7 ? 16'hfc00 :  // <0042> end_func



// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x00c8
// "0123456789abcdef"
addr == 16'hc8 ? 16'h3130 :  // <0054> 10
addr == 16'hc9 ? 16'h3332 :  // <0054> 32
addr == 16'hca ? 16'h3534 :  // <0054> 54
addr == 16'hcb ? 16'h3736 :  // <0054> 76
addr == 16'hcc ? 16'h3938 :  // <0054> 98
addr == 16'hcd ? 16'h6261 :  // <0054> ba
addr == 16'hce ? 16'h6463 :  // <0054> dc
addr == 16'hcf ? 16'h6665 :  // <0054> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// ######## func put4x // = 0x00d0
addr == 16'hd0 ? 16'h2004 :  // <0058> push x // func put4x
addr == 16'hd1 ? 16'h2006 :  // <0058> push g6 // "
addr == 16'hd2 ? 16'h203e :  // <0058> push rtna // "
addr == 16'hd3 ? 16'h13a0 :  // <0059> x = :hexdigits
addr == 16'hd4 ? 16'h00c8 :  // <0059> "

addr == 16'hd5 ? 16'h1800 :  // <0061> g6 = a
addr == 16'hd6 ? 16'h07a0 :  // <0062> b = 0xF000
addr == 16'hd7 ? 16'hf000 :  // <0062> "
addr == 16'hd8 ? 16'hc800 :  // <0063> a = and
addr == 16'hd9 ? 16'h0330 :  // <0063> "
addr == 16'hda ? 16'h0353 :  // <0064> a = a>>4
addr == 16'hdb ? 16'h0353 :  // <0065> a = a>>4
addr == 16'hdc ? 16'h0353 :  // <0066> a = a>>4
addr == 16'hdd ? 16'hfba0 :  // <0067> call fetch_byte
addr == 16'hde ? 16'h0098 :  // <0067> "
addr == 16'hdf ? 16'hfc00 :  // <0067> "
addr == 16'he0 ? 16'h0000 :  // <0068> a = a // putchar a
addr == 16'he1 ? 16'hfba0 :  // <0068> putchar a
addr == 16'he2 ? 16'h0078 :  // <0068> "
addr == 16'he3 ? 16'hfc00 :  // <0068> "

addr == 16'he4 ? 16'h0006 :  // <0070> a = g6
addr == 16'he5 ? 16'h07a0 :  // <0071> b = 0x0F00
addr == 16'he6 ? 16'h0f00 :  // <0071> "
addr == 16'he7 ? 16'hc800 :  // <0072> a = and
addr == 16'he8 ? 16'h0330 :  // <0072> "
addr == 16'he9 ? 16'h0353 :  // <0073> a = a>>4
addr == 16'hea ? 16'h0353 :  // <0074> a = a>>4
addr == 16'heb ? 16'hfba0 :  // <0075> call fetch_byte
addr == 16'hec ? 16'h0098 :  // <0075> "
addr == 16'hed ? 16'hfc00 :  // <0075> "
addr == 16'hee ? 16'h0000 :  // <0076> a = a // putchar a
addr == 16'hef ? 16'hfba0 :  // <0076> putchar a
addr == 16'hf0 ? 16'h0078 :  // <0076> "
addr == 16'hf1 ? 16'hfc00 :  // <0076> "

addr == 16'hf2 ? 16'h0006 :  // <0078> a = g6
addr == 16'hf3 ? 16'h06f0 :  // <0079> b = 0x00F0
addr == 16'hf4 ? 16'hc800 :  // <0080> a = and
addr == 16'hf5 ? 16'h0330 :  // <0080> "
addr == 16'hf6 ? 16'h0353 :  // <0081> a = a>>4
addr == 16'hf7 ? 16'hfba0 :  // <0082> call fetch_byte
addr == 16'hf8 ? 16'h0098 :  // <0082> "
addr == 16'hf9 ? 16'hfc00 :  // <0082> "
addr == 16'hfa ? 16'h0000 :  // <0083> a = a // putchar a
addr == 16'hfb ? 16'hfba0 :  // <0083> putchar a
addr == 16'hfc ? 16'h0078 :  // <0083> "
addr == 16'hfd ? 16'hfc00 :  // <0083> "

addr == 16'hfe ? 16'h0006 :  // <0085> a = g6
addr == 16'hff ? 16'h060f :  // <0086> b = 0x000F
addr == 16'h100 ? 16'hc800 :  // <0087> a = and
addr == 16'h101 ? 16'h0330 :  // <0087> "
addr == 16'h102 ? 16'hfba0 :  // <0088> call fetch_byte
addr == 16'h103 ? 16'h0098 :  // <0088> "
addr == 16'h104 ? 16'hfc00 :  // <0088> "
addr == 16'h105 ? 16'h0000 :  // <0089> a = a // putchar a
addr == 16'h106 ? 16'hfba0 :  // <0089> putchar a
addr == 16'h107 ? 16'h0078 :  // <0089> "
addr == 16'h108 ? 16'hfc00 :  // <0089> "

addr == 16'h109 ? 16'hf808 :  // <0091> pop rtna // end_func
addr == 16'h10a ? 16'h1808 :  // <0091> pop g6 // "
addr == 16'h10b ? 16'h1008 :  // <0091> pop x // "
addr == 16'h10c ? 16'hfc00 :  // <0091> end_func

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// ######## func get4x // = 0x010d
addr == 16'h10d ? 16'h2002 :  // <0095> push i // func get4x
addr == 16'h10e ? 16'h2003 :  // <0095> push j // "
addr == 16'h10f ? 16'h2004 :  // <0095> push x // "
addr == 16'h110 ? 16'h2005 :  // <0095> push y // "
addr == 16'h111 ? 16'h203e :  // <0095> push rtna // "
// y = digit counter
// j = sum
addr == 16'h112 ? 16'h1604 :  // <0098> y = 4
// :again // = 0x0113
addr == 16'h113 ? 16'hfba0 :  // <0100> getchar
addr == 16'h114 ? 16'h0081 :  // <0100> "
addr == 16'h115 ? 16'hfc00 :  // <0100> "
addr == 16'h116 ? 16'h2000 :  // <0100> push a // "
addr == 16'h117 ? 16'h0000 :  // <0100> a = a // "
addr == 16'h118 ? 16'hfba0 :  // <0100> "
addr == 16'h119 ? 16'h0078 :  // <0100> "
addr == 16'h11a ? 16'hfc00 :  // <0100> "
addr == 16'h11b ? 16'h0008 :  // <0100> pop a // "
addr == 16'h11c ? 16'h13a0 :  // <0101> x = :hexdigits
addr == 16'h11d ? 16'h00c8 :  // <0101> "
addr == 16'h11e ? 16'h0a10 :  // <0102> i = 16
addr == 16'h11f ? 16'hfba0 :  // <0103> call :find_in_fetch
addr == 16'h120 ? 16'h00ac :  // <0103> "
addr == 16'h121 ? 16'hfc00 :  // <0103> "
addr == 16'h122 ? 16'h0760 :  // <0104> b = -1
addr == 16'h123 ? 16'he007 :  // <0105> br eq :fail
addr == 16'h124 ? 16'h0138 :  // <0105> "
addr == 16'h125 ? 16'h0400 :  // <0106> b = a
addr == 16'h126 ? 16'h0003 :  // <0107> a = j
addr == 16'h127 ? 16'h0352 :  // <0108> a = a<<4
addr == 16'h128 ? 16'hc800 :  // <0109> j = or
addr == 16'h129 ? 16'h0f34 :  // <0109> "
addr == 16'h12a ? 16'h1360 :  // <0110> x = -1
addr == 16'h12b ? 16'hc800 :  // <0111> y = x+y
addr == 16'h12c ? 16'h1720 :  // <0111> "
addr == 16'h12d ? 16'h0005 :  // <0112> a = y
addr == 16'h12e ? 16'he400 :  // <0113> bn az :again
addr == 16'h12f ? 16'h0113 :  // <0113> "
addr == 16'h130 ? 16'h0003 :  // <0114> a = j
addr == 16'h131 ? 16'h0600 :  // <0115> b = 0
addr == 16'h132 ? 16'hf808 :  // <0116> pop rtna // rtn
addr == 16'h133 ? 16'h1408 :  // <0116> pop y // "
addr == 16'h134 ? 16'h1008 :  // <0116> pop x // "
addr == 16'h135 ? 16'h0c08 :  // <0116> pop j // "
addr == 16'h136 ? 16'h0808 :  // <0116> pop i // "
addr == 16'h137 ? 16'hfc00 :  // <0116> rtn
// :fail // = 0x0138
addr == 16'h138 ? 16'h0760 :  // <0118> b = -1
addr == 16'h139 ? 16'hf808 :  // <0119> pop rtna // end_func
addr == 16'h13a ? 16'h1408 :  // <0119> pop y // "
addr == 16'h13b ? 16'h1008 :  // <0119> pop x // "
addr == 16'h13c ? 16'h0c08 :  // <0119> pop j // "
addr == 16'h13d ? 16'h0808 :  // <0119> pop i // "
addr == 16'h13e ? 16'hfc00 :  // <0119> end_func

// routine waits a number of milliseconds given in a.
// ######## func spinwait // = 0x013f
addr == 16'h13f ? 16'h2004 :  // <0002> push x // func spinwait
addr == 16'h140 ? 16'h2005 :  // <0002> push y // "
//patch
//rtn
addr == 16'h141 ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x0142
addr == 16'h142 ? 16'h13a0 :  // <0007> x = 16666
addr == 16'h143 ? 16'h411a :  // <0007> "
addr == 16'h144 ? 16'h1760 :  // <0008> y = -1
addr == 16'h145 ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x0146
// use of the ad2 name overrides auto-nop here.
addr == 16'h146 ? 16'h1320 :  // <0012> x = ad2
addr == 16'h147 ? 16'he402 :  // <0013> bn xz :spinwait_inner
addr == 16'h148 ? 16'h0146 :  // <0013> "
addr == 16'h149 ? 16'hc800 :  // <0014> a = a+b
addr == 16'h14a ? 16'h0300 :  // <0014> "
addr == 16'h14b ? 16'he400 :  // <0015> bn az :spinwait_outer
addr == 16'h14c ? 16'h0142 :  // <0015> "
addr == 16'h14d ? 16'h1408 :  // <0016> pop y // end_func
addr == 16'h14e ? 16'h1008 :  // <0016> pop x // "
addr == 16'h14f ? 16'hfc00 :  // <0016> end_func



// #########################################################################
// :main // = 0x0150

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
addr == 16'h150 ? 16'h4a00 :  // <0135> av_ad_hi = 0
addr == 16'h151 ? 16'h0200 :  // <0136> a = 0
addr == 16'h152 ? 16'h0602 :  // <0137> b = 2
// :clear_next_word // = 0x0153
addr == 16'h153 ? 16'h4c00 :  // <0139> av_ad_lo = a
addr == 16'h154 ? 16'h4200 :  // <0140> av_write_data = 0
addr == 16'h155 ? 16'h0300 :  // <0141> a = ad0
addr == 16'h156 ? 16'he400 :  // <0142> bn az :clear_next_word
addr == 16'h157 ? 16'h0153 :  // <0142> "

// init RAM variables.
addr == 16'h158 ? 16'h4a00 :  // <0145> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h159 ? 16'h4e04 :  // <0145> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 4
addr == 16'h15a ? 16'h4360 :  // <0145> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h15b ? 16'h4a00 :  // <0146> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_hi = 0
addr == 16'h15c ? 16'h4e06 :  // <0146> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_lo = 6
addr == 16'h15d ? 16'h4202 :  // <0146> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_write_data = 2

// check initial state of power management circuits.
// if power is lost or ignition switch is off already, open relay & abort run.
// that's important because then the event controller booted up too late to
// see edges on those 2 signals.  regular system would never shut itself down.
addr == 16'h15e ? 16'h6600 :  // <0152> power_duty = $power_duty_closing
addr == 16'h15f ? 16'h0019 :  // <0153> a = power_duty
addr == 16'h160 ? 16'h06c0 :  // <0154> b = ($power_lost_mask | $ignition_switch_off_mask)
addr == 16'h161 ? 16'he003 :  // <0155> br and0z :skip_power_lost
addr == 16'h162 ? 16'h0168 :  // <0155> "
addr == 16'h163 ? 16'h6632 :  // <0156> power_duty = $power_duty_opening
addr == 16'h164 ? 16'h5fa0 :  // <0157> error_halt_code $err_power_lost_at_boot // leds = 0xfffb
addr == 16'h165 ? 16'hfffb :  // <0157> "
addr == 16'h166 ? 16'he00f :  // <0157> error_halt_code $err_power_lost_at_boot
addr == 16'h167 ? 16'h0166 :  // <0157> "
// :skip_power_lost // = 0x0168

// start handling events.
addr == 16'h168 ? 16'h2ba0 :  // <0161> soft_event = $event_controller_reset_mask
addr == 16'h169 ? 16'h8000 :  // <0161> "
addr == 16'h16a ? 16'h2a00 :  // <0162> soft_event = 0
addr == 16'h16b ? 16'h37a0 :  // <0163> mstimer0 = 1000
addr == 16'h16c ? 16'h03e8 :  // <0163> "
addr == 16'h16d ? 16'he00f :  // <0164> jmp :poll_events
addr == 16'h16e ? 16'h006b :  // <0164> "

// event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.
// event 0 not used in this app anyway.
// :event_table // = 0x016f
addr == 16'h16f ? 16'h006b :  // <0169> ([label :poll_events])
addr == 16'h170 ? 16'h024b :  // <0170> ([label :power_lost_handler])
addr == 16'h171 ? 16'h0180 :  // <0171> ([label :ustimer0_handler])
addr == 16'h172 ? 16'h0182 :  // <0172> ([label :spi_done_handler])
addr == 16'h173 ? 16'h01b2 :  // <0173> ([label :mstimer0_handler])
addr == 16'h174 ? 16'h01da :  // <0174> ([label :mstimer1_handler])
addr == 16'h175 ? 16'h01fb :  // <0175> ([label :uart_rx_handler])
addr == 16'h176 ? 16'h01fd :  // <0176> ([label :uart_rx_overflow_handler])
addr == 16'h177 ? 16'h0203 :  // <0177> ([label :uart_tx_overflow_handler])
addr == 16'h178 ? 16'h0209 :  // <0178> ([label :key0_handler])
addr == 16'h179 ? 16'h0215 :  // <0179> ([label :key1_handler])
addr == 16'h17a ? 16'h025a :  // <0180> ([label :ignition_switch_off_handler])
addr == 16'h17b ? 16'h0265 :  // <0181> ([label :ignition_switch_on_handler])
addr == 16'h17c ? 16'h0221 :  // <0182> ([label :softevent3_handler])
addr == 16'h17d ? 16'h0223 :  // <0183> ([label :softevent2_handler])
addr == 16'h17e ? 16'h0225 :  // <0184> ([label :softevent1_handler])
addr == 16'h17f ? 16'h0227 :  // <0185> ([label :softevent0_handler])

// #########################################################################

// ######## event ustimer0_handler // = 0x0180
addr == 16'h180 ? 16'he00f :  // <0190> end_event
addr == 16'h181 ? 16'h006b :  // <0190> "

// ######## event spi_done_handler // = 0x0182
// discard-counter in RAM.
addr == 16'h182 ? 16'h4a00 :  // <0194> ram a = $ram_daq_discard_cnt // av_ad_hi = 0
addr == 16'h183 ? 16'h4e02 :  // <0194> ram a = $ram_daq_discard_cnt // av_ad_lo = 2
addr == 16'h184 ? 16'h0010 :  // <0194> ram a = $ram_daq_discard_cnt // a = av_write_data // start read cycle
addr == 16'h185 ? 16'h0011 :  // <0194> ram a = $ram_daq_discard_cnt // a = av_read_data // finish read cycle
addr == 16'h186 ? 16'he000 :  // <0195> br az :report
addr == 16'h187 ? 16'h0194 :  // <0195> "
addr == 16'h188 ? 16'h0760 :  // <0196> b = -1
addr == 16'h189 ? 16'hc800 :  // <0197> a = a+b
addr == 16'h18a ? 16'h0300 :  // <0197> "
addr == 16'h18b ? 16'h4a00 :  // <0198> ram $ram_daq_discard_cnt = a // av_ad_hi = 0
addr == 16'h18c ? 16'h4e02 :  // <0198> ram $ram_daq_discard_cnt = a // av_ad_lo = 2
addr == 16'h18d ? 16'h4000 :  // <0198> ram $ram_daq_discard_cnt = a // av_write_data = a
addr == 16'h18e ? 16'h0207 :  // <0199> a = $anmux_adc_channel
addr == 16'h18f ? 16'hfba0 :  // <0200> call :begin_adc_conversion
addr == 16'h190 ? 16'h0244 :  // <0200> "
addr == 16'h191 ? 16'hfc00 :  // <0200> "
addr == 16'h192 ? 16'he00f :  // <0201> event_return
addr == 16'h193 ? 16'h006b :  // <0201> "

// report ADC reading.
// :report // = 0x0194
addr == 16'h194 ? 16'h000f :  // <0205> a = spi_data
addr == 16'h195 ? 16'hfba0 :  // <0206> call :put4x
addr == 16'h196 ? 16'h00d0 :  // <0206> "
addr == 16'h197 ? 16'hfc00 :  // <0206> "

// decrement anmux channel & start waiting again.
addr == 16'h198 ? 16'hfba0 :  // <0209> call :anmux_get_chn
addr == 16'h199 ? 16'h0093 :  // <0209> "
addr == 16'h19a ? 16'hfc00 :  // <0209> "
addr == 16'h19b ? 16'he000 :  // <0210> br az :all_done
addr == 16'h19c ? 16'h01a6 :  // <0210> "
addr == 16'h19d ? 16'h0760 :  // <0211> b = -1
addr == 16'h19e ? 16'hc800 :  // <0212> a = a+b
addr == 16'h19f ? 16'h0300 :  // <0212> "
addr == 16'h1a0 ? 16'hfba0 :  // <0213> call :anmux_set_chn
addr == 16'h1a1 ? 16'h008f :  // <0213> "
addr == 16'h1a2 ? 16'hfc00 :  // <0213> "
addr == 16'h1a3 ? 16'h3a05 :  // <0214> mstimer1 = $anmux_settle_ms
addr == 16'h1a4 ? 16'he00f :  // <0215> event_return
addr == 16'h1a5 ? 16'h006b :  // <0215> "

// end of daq pass.
// :all_done // = 0x01a6
addr == 16'h1a6 ? 16'h020d :  // <0219> a = 13 // puteol
addr == 16'h1a7 ? 16'h0000 :  // <0219> a = a // puteol
addr == 16'h1a8 ? 16'hfba0 :  // <0219> puteol
addr == 16'h1a9 ? 16'h0078 :  // <0219> "
addr == 16'h1aa ? 16'hfc00 :  // <0219> "
addr == 16'h1ab ? 16'h020a :  // <0219> a = 10 // puteol
addr == 16'h1ac ? 16'h0000 :  // <0219> a = a // puteol
addr == 16'h1ad ? 16'hfba0 :  // <0219> puteol
addr == 16'h1ae ? 16'h0078 :  // <0219> "
addr == 16'h1af ? 16'hfc00 :  // <0219> "
addr == 16'h1b0 ? 16'he00f :  // <0220> end_event
addr == 16'h1b1 ? 16'h006b :  // <0220> "

// ######## event mstimer0_handler // = 0x01b2
// unified 1-second periodic timer for all low-resolution tasks.

// start timer again.
addr == 16'h1b2 ? 16'h37a0 :  // <0226> mstimer0 = 1000
addr == 16'h1b3 ? 16'h03e8 :  // <0226> "

// realtime counters in RAM.
addr == 16'h1b4 ? 16'h4a00 :  // <0229> ram a = $ram_seconds_cnt // av_ad_hi = 0
addr == 16'h1b5 ? 16'h4e0a :  // <0229> ram a = $ram_seconds_cnt // av_ad_lo = 10
addr == 16'h1b6 ? 16'h0010 :  // <0229> ram a = $ram_seconds_cnt // a = av_write_data // start read cycle
addr == 16'h1b7 ? 16'h0011 :  // <0229> ram a = $ram_seconds_cnt // a = av_read_data // finish read cycle
addr == 16'h1b8 ? 16'h0601 :  // <0230> b = 1
addr == 16'h1b9 ? 16'hc800 :  // <0231> a = a+b
addr == 16'h1ba ? 16'h0300 :  // <0231> "
addr == 16'h1bb ? 16'h063c :  // <0232> b = 60
addr == 16'h1bc ? 16'he407 :  // <0233> bn eq :same_minute
addr == 16'h1bd ? 16'h01cf :  // <0233> "
addr == 16'h1be ? 16'h4a00 :  // <0234> ram $ram_seconds_cnt = 0 // av_ad_hi = 0
addr == 16'h1bf ? 16'h4e0a :  // <0234> ram $ram_seconds_cnt = 0 // av_ad_lo = 10
addr == 16'h1c0 ? 16'h4200 :  // <0234> ram $ram_seconds_cnt = 0 // av_write_data = 0
addr == 16'h1c1 ? 16'h4a00 :  // <0235> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h1c2 ? 16'h4e08 :  // <0235> ram a = $ram_minutes_cnt // av_ad_lo = 8
addr == 16'h1c3 ? 16'h0010 :  // <0235> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h1c4 ? 16'h0011 :  // <0235> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h1c5 ? 16'h0601 :  // <0236> b = 1
addr == 16'h1c6 ? 16'h4a00 :  // <0237> ram $ram_minutes_cnt = a+b // av_ad_hi = 0
addr == 16'h1c7 ? 16'h4e08 :  // <0237> ram $ram_minutes_cnt = a+b // av_ad_lo = 8
addr == 16'h1c8 ? 16'hc800 :  // <0237> ram $ram_minutes_cnt = a+b // av_write_data = a+b
addr == 16'h1c9 ? 16'h4300 :  // <0237> "
addr == 16'h1ca ? 16'hfba0 :  // <0238> call :minute_events
addr == 16'h1cb ? 16'h026a :  // <0238> "
addr == 16'h1cc ? 16'hfc00 :  // <0238> "
addr == 16'h1cd ? 16'he00f :  // <0239> jmp :minutes_done
addr == 16'h1ce ? 16'h01d2 :  // <0239> "
// :same_minute // = 0x01cf
addr == 16'h1cf ? 16'h4a00 :  // <0241> ram $ram_seconds_cnt = a // av_ad_hi = 0
addr == 16'h1d0 ? 16'h4e0a :  // <0241> ram $ram_seconds_cnt = a // av_ad_lo = 10
addr == 16'h1d1 ? 16'h4000 :  // <0241> ram $ram_seconds_cnt = a // av_write_data = a
// :minutes_done // = 0x01d2

addr == 16'h1d2 ? 16'hfba0 :  // <0244> call :check_power_relay
addr == 16'h1d3 ? 16'h0270 :  // <0244> "
addr == 16'h1d4 ? 16'hfc00 :  // <0244> "
addr == 16'h1d5 ? 16'hfba0 :  // <0245> call :start_daq_pass
addr == 16'h1d6 ? 16'h0229 :  // <0245> "
addr == 16'h1d7 ? 16'hfc00 :  // <0245> "
addr == 16'h1d8 ? 16'he00f :  // <0246> end_event
addr == 16'h1d9 ? 16'h006b :  // <0246> "

// ######## event mstimer1_handler // = 0x01da
// start a reading from the current anmux channel.
addr == 16'h1da ? 16'h4a00 :  // <0250> ram $ram_daq_discard_cnt = $anmux_num_discards // av_ad_hi = 0
addr == 16'h1db ? 16'h4e02 :  // <0250> ram $ram_daq_discard_cnt = $anmux_num_discards // av_ad_lo = 2
addr == 16'h1dc ? 16'h4202 :  // <0250> ram $ram_daq_discard_cnt = $anmux_num_discards // av_write_data = 2
addr == 16'h1dd ? 16'h0220 :  // <0251> a = 32 // putasc " "
addr == 16'h1de ? 16'h0000 :  // <0251> a = a // putasc " "
addr == 16'h1df ? 16'hfba0 :  // <0251> putasc " "
addr == 16'h1e0 ? 16'h0078 :  // <0251> "
addr == 16'h1e1 ? 16'hfc00 :  // <0251> "
addr == 16'h1e2 ? 16'h0273 :  // <0252> a = 115 // putasc "s"
addr == 16'h1e3 ? 16'h0000 :  // <0252> a = a // putasc "s"
addr == 16'h1e4 ? 16'hfba0 :  // <0252> putasc "s"
addr == 16'h1e5 ? 16'h0078 :  // <0252> "
addr == 16'h1e6 ? 16'hfc00 :  // <0252> "
addr == 16'h1e7 ? 16'hfba0 :  // <0253> call :anmux_get_chn
addr == 16'h1e8 ? 16'h0093 :  // <0253> "
addr == 16'h1e9 ? 16'hfc00 :  // <0253> "
addr == 16'h1ea ? 16'h0630 :  // <0254> b = 48 // asc b = "0"
addr == 16'h1eb ? 16'hc800 :  // <0255> a = a+b // putchar a+b
addr == 16'h1ec ? 16'h0300 :  // <0255> "
addr == 16'h1ed ? 16'hfba0 :  // <0255> putchar a+b
addr == 16'h1ee ? 16'h0078 :  // <0255> "
addr == 16'h1ef ? 16'hfc00 :  // <0255> "
addr == 16'h1f0 ? 16'h023d :  // <0256> a = 61 // putasc "="
addr == 16'h1f1 ? 16'h0000 :  // <0256> a = a // putasc "="
addr == 16'h1f2 ? 16'hfba0 :  // <0256> putasc "="
addr == 16'h1f3 ? 16'h0078 :  // <0256> "
addr == 16'h1f4 ? 16'hfc00 :  // <0256> "
addr == 16'h1f5 ? 16'h0207 :  // <0257> a = $anmux_adc_channel
addr == 16'h1f6 ? 16'hfba0 :  // <0258> call :begin_adc_conversion
addr == 16'h1f7 ? 16'h0244 :  // <0258> "
addr == 16'h1f8 ? 16'hfc00 :  // <0258> "
addr == 16'h1f9 ? 16'he00f :  // <0259> end_event
addr == 16'h1fa ? 16'h006b :  // <0259> "

// ######## event uart_rx_handler // = 0x01fb
// handle data here
addr == 16'h1fb ? 16'he00f :  // <0263> end_event
addr == 16'h1fc ? 16'h006b :  // <0263> "

// ######## event uart_rx_overflow_handler // = 0x01fd
addr == 16'h1fd ? 16'h5fa0 :  // <0266> error_halt_code $err_rx_overflow // leds = 0xfffe
addr == 16'h1fe ? 16'hfffe :  // <0266> "
addr == 16'h1ff ? 16'he00f :  // <0266> error_halt_code $err_rx_overflow
addr == 16'h200 ? 16'h01ff :  // <0266> "
addr == 16'h201 ? 16'he00f :  // <0267> end_event
addr == 16'h202 ? 16'h006b :  // <0267> "

// ######## event uart_tx_overflow_handler // = 0x0203
addr == 16'h203 ? 16'h5fa0 :  // <0270> error_halt_code $err_tx_overflow // leds = 0xfffd
addr == 16'h204 ? 16'hfffd :  // <0270> "
addr == 16'h205 ? 16'he00f :  // <0270> error_halt_code $err_tx_overflow
addr == 16'h206 ? 16'h0205 :  // <0270> "
addr == 16'h207 ? 16'he00f :  // <0271> end_event
addr == 16'h208 ? 16'h006b :  // <0271> "

// ######## event key0_handler // = 0x0209
addr == 16'h209 ? 16'h026b :  // <0274> a = 107 // putasc "k"
addr == 16'h20a ? 16'h0000 :  // <0274> a = a // putasc "k"
addr == 16'h20b ? 16'hfba0 :  // <0274> putasc "k"
addr == 16'h20c ? 16'h0078 :  // <0274> "
addr == 16'h20d ? 16'hfc00 :  // <0274> "
addr == 16'h20e ? 16'h0230 :  // <0275> a = 48 // putasc "0"
addr == 16'h20f ? 16'h0000 :  // <0275> a = a // putasc "0"
addr == 16'h210 ? 16'hfba0 :  // <0275> putasc "0"
addr == 16'h211 ? 16'h0078 :  // <0275> "
addr == 16'h212 ? 16'hfc00 :  // <0275> "
addr == 16'h213 ? 16'he00f :  // <0276> end_event
addr == 16'h214 ? 16'h006b :  // <0276> "

// ######## event key1_handler // = 0x0215
addr == 16'h215 ? 16'h026b :  // <0279> a = 107 // putasc "k"
addr == 16'h216 ? 16'h0000 :  // <0279> a = a // putasc "k"
addr == 16'h217 ? 16'hfba0 :  // <0279> putasc "k"
addr == 16'h218 ? 16'h0078 :  // <0279> "
addr == 16'h219 ? 16'hfc00 :  // <0279> "
addr == 16'h21a ? 16'h0231 :  // <0280> a = 49 // putasc "1"
addr == 16'h21b ? 16'h0000 :  // <0280> a = a // putasc "1"
addr == 16'h21c ? 16'hfba0 :  // <0280> putasc "1"
addr == 16'h21d ? 16'h0078 :  // <0280> "
addr == 16'h21e ? 16'hfc00 :  // <0280> "
addr == 16'h21f ? 16'he00f :  // <0281> end_event
addr == 16'h220 ? 16'h006b :  // <0281> "

// ######## event softevent3_handler // = 0x0221
addr == 16'h221 ? 16'he00f :  // <0284> end_event
addr == 16'h222 ? 16'h006b :  // <0284> "

// ######## event softevent2_handler // = 0x0223
addr == 16'h223 ? 16'he00f :  // <0287> end_event
addr == 16'h224 ? 16'h006b :  // <0287> "

// ######## event softevent1_handler // = 0x0225
addr == 16'h225 ? 16'he00f :  // <0290> end_event
addr == 16'h226 ? 16'h006b :  // <0290> "

// ######## event softevent0_handler // = 0x0227
addr == 16'h227 ? 16'he00f :  // <0293> end_event
addr == 16'h228 ? 16'h006b :  // <0293> "

// ######## func start_daq_pass // = 0x0229
addr == 16'h229 ? 16'h203e :  // <0295> push rtna // func start_daq_pass
// daq pass counter in RAM.
addr == 16'h22a ? 16'h4a00 :  // <0297> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h22b ? 16'h4e00 :  // <0297> ram a = $ram_daq_pass_cnt // av_ad_lo = 0
addr == 16'h22c ? 16'h0010 :  // <0297> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h22d ? 16'h0011 :  // <0297> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h22e ? 16'h0601 :  // <0298> b = 1
addr == 16'h22f ? 16'hc800 :  // <0299> a = a+b
addr == 16'h230 ? 16'h0300 :  // <0299> "
addr == 16'h231 ? 16'h5c00 :  // <0300> leds = a
addr == 16'h232 ? 16'h4a00 :  // <0301> ram $ram_daq_pass_cnt = a // av_ad_hi = 0
addr == 16'h233 ? 16'h4e00 :  // <0301> ram $ram_daq_pass_cnt = a // av_ad_lo = 0
addr == 16'h234 ? 16'h4000 :  // <0301> ram $ram_daq_pass_cnt = a // av_write_data = a
addr == 16'h235 ? 16'hfba0 :  // <0302> call :put4x
addr == 16'h236 ? 16'h00d0 :  // <0302> "
addr == 16'h237 ? 16'hfc00 :  // <0302> "
addr == 16'h238 ? 16'h023a :  // <0303> a = 58 // putasc ":"
addr == 16'h239 ? 16'h0000 :  // <0303> a = a // putasc ":"
addr == 16'h23a ? 16'hfba0 :  // <0303> putasc ":"
addr == 16'h23b ? 16'h0078 :  // <0303> "
addr == 16'h23c ? 16'hfc00 :  // <0303> "

// start to acquire & report all anmux channels.
addr == 16'h23d ? 16'h0207 :  // <0306> a = 7
addr == 16'h23e ? 16'hfba0 :  // <0307> call :anmux_set_chn
addr == 16'h23f ? 16'h008f :  // <0307> "
addr == 16'h240 ? 16'hfc00 :  // <0307> "
addr == 16'h241 ? 16'h3a05 :  // <0308> mstimer1 = $anmux_settle_ms

// // observe MCU utilization.
// a = usage_count
// call :put4x
// usage_count = 0
addr == 16'h242 ? 16'hf808 :  // <0314> pop rtna // end_func
addr == 16'h243 ? 16'hfc00 :  // <0314> end_func

// ######## func begin_adc_conversion // = 0x0244
// begin SPI transaction, specifying Nano ADC channel to take effect NEXT
// conversion after this one.  pass that in a.

addr == 16'h244 ? 16'h0352 :  // <0320> a = a<<4
addr == 16'h245 ? 16'h0352 :  // <0321> a = a<<4
addr == 16'h246 ? 16'h0351 :  // <0322> a = a<<1
addr == 16'h247 ? 16'h0351 :  // <0323> a = a<<1
addr == 16'h248 ? 16'h0351 :  // <0324> a = a<<1
addr == 16'h249 ? 16'h3c00 :  // <0325> spi_data = a
addr == 16'h24a ? 16'hfc00 :  // <0326> end_func

// ######## event power_lost_handler // = 0x024b
// at this time we have less than 2 ms of usable run time left.

// this must be an uncommanded loss of main power, because if it was commanded,
// no more events would be handled; this event handler wouldn't have a chance to run.
// immediately set the power relay PWM to full power for a few seconds,
// in case the power relay opened accidentally e.g. due to a hard pothole.
addr == 16'h24b ? 16'h6600 :  // <0335> power_duty = $power_duty_closing
addr == 16'h24c ? 16'h4a00 :  // <0336> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h24d ? 16'h4e00 :  // <0336> ram a = $ram_daq_pass_cnt // av_ad_lo = 0
addr == 16'h24e ? 16'h0010 :  // <0336> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h24f ? 16'h0011 :  // <0336> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h250 ? 16'h0602 :  // <0337> b = $relay_hold_passes
addr == 16'h251 ? 16'h4a00 :  // <0338> ram $ram_relay_hold_at_pass = a+b // av_ad_hi = 0
addr == 16'h252 ? 16'h4e06 :  // <0338> ram $ram_relay_hold_at_pass = a+b // av_ad_lo = 6
addr == 16'h253 ? 16'hc800 :  // <0338> ram $ram_relay_hold_at_pass = a+b // av_write_data = a+b
addr == 16'h254 ? 16'h4300 :  // <0338> "

// pause any non-vital power-hogging operations, to conserve power for the EEPROM write.

// save persistent data in case the power remains down e.g. due to battery disconnect.
addr == 16'h255 ? 16'hfba0 :  // <0343> call :save_persistent_data
addr == 16'h256 ? 16'h0297 :  // <0343> "
addr == 16'h257 ? 16'hfc00 :  // <0343> "
addr == 16'h258 ? 16'he00f :  // <0344> end_event
addr == 16'h259 ? 16'h006b :  // <0344> "

// ######## event ignition_switch_off_handler // = 0x025a
// set power-down deadline in RAM.  this makes the system remain powered for several more minutes, for cooldown data logging.
addr == 16'h25a ? 16'h4a00 :  // <0348> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h25b ? 16'h4e08 :  // <0348> ram a = $ram_minutes_cnt // av_ad_lo = 8
addr == 16'h25c ? 16'h0010 :  // <0348> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h25d ? 16'h0011 :  // <0348> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h25e ? 16'h0603 :  // <0349> b = $power_extend_minutes
addr == 16'h25f ? 16'h4a00 :  // <0350> ram $ram_power_down_at_min = a+b // av_ad_hi = 0
addr == 16'h260 ? 16'h4e04 :  // <0350> ram $ram_power_down_at_min = a+b // av_ad_lo = 4
addr == 16'h261 ? 16'hc800 :  // <0350> ram $ram_power_down_at_min = a+b // av_write_data = a+b
addr == 16'h262 ? 16'h4300 :  // <0350> "
addr == 16'h263 ? 16'he00f :  // <0351> end_event
addr == 16'h264 ? 16'h006b :  // <0351> "

// ######## event ignition_switch_on_handler // = 0x0265
addr == 16'h265 ? 16'h4a00 :  // <0354> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h266 ? 16'h4e04 :  // <0354> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 4
addr == 16'h267 ? 16'h4360 :  // <0354> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h268 ? 16'he00f :  // <0355> end_event
addr == 16'h269 ? 16'h006b :  // <0355> "

// ######## func minute_events // = 0x026a
addr == 16'h26a ? 16'h203e :  // <0357> push rtna // func minute_events
addr == 16'h26b ? 16'hfba0 :  // <0358> call :check_power_down
addr == 16'h26c ? 16'h027c :  // <0358> "
addr == 16'h26d ? 16'hfc00 :  // <0358> "
addr == 16'h26e ? 16'hf808 :  // <0359> pop rtna // end_func
addr == 16'h26f ? 16'hfc00 :  // <0359> end_func

// ######## func check_power_relay // = 0x0270
addr == 16'h270 ? 16'h4a00 :  // <0362> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h271 ? 16'h4e00 :  // <0362> ram a = $ram_daq_pass_cnt // av_ad_lo = 0
addr == 16'h272 ? 16'h0010 :  // <0362> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h273 ? 16'h0011 :  // <0362> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h274 ? 16'h4a00 :  // <0363> ram b = $ram_relay_hold_at_pass // av_ad_hi = 0
addr == 16'h275 ? 16'h4e06 :  // <0363> ram b = $ram_relay_hold_at_pass // av_ad_lo = 6
addr == 16'h276 ? 16'h0410 :  // <0363> ram b = $ram_relay_hold_at_pass // b = av_write_data // start read cycle
addr == 16'h277 ? 16'h0411 :  // <0363> ram b = $ram_relay_hold_at_pass // b = av_read_data // finish read cycle
addr == 16'h278 ? 16'he407 :  // <0364> bn eq :done
addr == 16'h279 ? 16'h027b :  // <0364> "
// time to begin "solenoid saver" coil power reduction by PWM.
addr == 16'h27a ? 16'h6619 :  // <0366> power_duty = $power_duty_holding
// :done // = 0x027b
addr == 16'h27b ? 16'hfc00 :  // <0368> end_func

// ######## func check_power_down // = 0x027c
addr == 16'h27c ? 16'h203e :  // <0370> push rtna // func check_power_down
// check power-down deadline in RAM.
addr == 16'h27d ? 16'h4a00 :  // <0372> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h27e ? 16'h4e08 :  // <0372> ram a = $ram_minutes_cnt // av_ad_lo = 8
addr == 16'h27f ? 16'h0010 :  // <0372> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h280 ? 16'h0011 :  // <0372> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h281 ? 16'h4a00 :  // <0373> ram b = $ram_power_down_at_min // av_ad_hi = 0
addr == 16'h282 ? 16'h4e04 :  // <0373> ram b = $ram_power_down_at_min // av_ad_lo = 4
addr == 16'h283 ? 16'h0410 :  // <0373> ram b = $ram_power_down_at_min // b = av_write_data // start read cycle
addr == 16'h284 ? 16'h0411 :  // <0373> ram b = $ram_power_down_at_min // b = av_read_data // finish read cycle
addr == 16'h285 ? 16'he407 :  // <0374> bn eq :done
addr == 16'h286 ? 16'h028a :  // <0374> "
addr == 16'h287 ? 16'hfba0 :  // <0375> call :power_down
addr == 16'h288 ? 16'h028c :  // <0375> "
addr == 16'h289 ? 16'hfc00 :  // <0375> "
// :done // = 0x028a
addr == 16'h28a ? 16'hf808 :  // <0377> pop rtna // end_func
addr == 16'h28b ? 16'hfc00 :  // <0377> end_func

// ######## func power_down // = 0x028c
addr == 16'h28c ? 16'h203e :  // <0379> push rtna // func power_down
// this function never returns.
addr == 16'h28d ? 16'hfba0 :  // <0381> call :save_persistent_data
addr == 16'h28e ? 16'h0297 :  // <0381> "
addr == 16'h28f ? 16'hfc00 :  // <0381> "
addr == 16'h290 ? 16'h6632 :  // <0382> power_duty = $power_duty_opening
addr == 16'h291 ? 16'h5fa0 :  // <0383> error_halt_code $err_power_down // leds = 0xfffc
addr == 16'h292 ? 16'hfffc :  // <0383> "
addr == 16'h293 ? 16'he00f :  // <0383> error_halt_code $err_power_down
addr == 16'h294 ? 16'h0293 :  // <0383> "
addr == 16'h295 ? 16'hf808 :  // <0384> pop rtna // end_func
addr == 16'h296 ? 16'hfc00 :  // <0384> end_func

// ######## func save_persistent_data // = 0x0297
addr == 16'h297 ? 16'hfc00 :  // <0387> end_func

        
                16'hxxxx;
        endmodule
    
