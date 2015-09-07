
        `include "header.v"

        module target_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.

addr == 16'h00 ? 16'he00f :  // <0004> jmp :main
addr == 16'h01 ? 16'h0301 :  // <0004> "


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

// realtime counting.

// text flag reporting.

// error code constants.

// ignition time capture.
// all ignition time vars are expressed in jf "jiffies" or "jf".
// 5000 RPM = about 140 jf between rising edges on chevy ignition white wire.
// 1000 RPM = about 700 jf
//  100 RPM = about 7000 jf
//   22 RPM = about 32000 jf, the slowest figure that's safe for the divide routine.
// setvar ign_history_quarter      ($ign_history_len / 4)
// setvar ign_quarter_avg_shift    ($ign_history_idx_bits - 2)
// ram_define ram_ign_oldest_avg_jf
// ram_define ram_ign_newest_avg_jf

// fuel injection puff driver.
// SETTING puff_len_us NON-ZERO ENABLES FUEL INJECTION!!  zero disables it.
// MUST SET ign_timeout_len_jf NON-ZERO PRIOR TO ENABLING!
// otherwise the module latches up in a non-working state.

// engine state management.  each engine state is called a "plan".
// escalating puff length by 1500 us per puff while cranking slowly at e.g. 80 RPM
// on a frozen winter morning will ramp up from 5000 to 20000 us length in about 7 seconds.
// 0x4c0 = 1216 = 120 degF at the sensor location outside the engine block.

addr == 16'h02 ? 16'h001e :  // <0197> emit_debugger_register_table  counter
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
// "      g6"
addr == 16'h1b ? 16'h2020 :  // <0197>   
addr == 16'h1c ? 16'h2020 :  // <0197>   
addr == 16'h1d ? 16'h2020 :  // <0197>   
addr == 16'h1e ? 16'h3667 :  // <0197> 6g
// "      g7"
addr == 16'h1f ? 16'h2020 :  // <0197>   
addr == 16'h20 ? 16'h2020 :  // <0197>   
addr == 16'h21 ? 16'h2020 :  // <0197>   
addr == 16'h22 ? 16'h3767 :  // <0197> 7g
// "//rstk  "
addr == 16'h23 ? 16'h2f2f :  // <0197> //
addr == 16'h24 ? 16'h7372 :  // <0197> sr
addr == 16'h25 ? 16'h6b74 :  // <0197> kt
addr == 16'h26 ? 16'h2020 :  // <0197>   
// "  ev_pri"
addr == 16'h27 ? 16'h2020 :  // <0197>   
addr == 16'h28 ? 16'h7665 :  // <0197> ve
addr == 16'h29 ? 16'h705f :  // <0197> p_
addr == 16'h2a ? 16'h6972 :  // <0197> ir
// "softevnt"
addr == 16'h2b ? 16'h6f73 :  // <0197> os
addr == 16'h2c ? 16'h7466 :  // <0197> tf
addr == 16'h2d ? 16'h7665 :  // <0197> ve
addr == 16'h2e ? 16'h746e :  // <0197> tn
// "   usage"
addr == 16'h2f ? 16'h2020 :  // <0197>   
addr == 16'h30 ? 16'h7520 :  // <0197> u 
addr == 16'h31 ? 16'h6173 :  // <0197> as
addr == 16'h32 ? 16'h6567 :  // <0197> eg
// "ustimer0"
addr == 16'h33 ? 16'h7375 :  // <0197> su
addr == 16'h34 ? 16'h6974 :  // <0197> it
addr == 16'h35 ? 16'h656d :  // <0197> em
addr == 16'h36 ? 16'h3072 :  // <0197> 0r
// "mstimer0"
addr == 16'h37 ? 16'h736d :  // <0197> sm
addr == 16'h38 ? 16'h6974 :  // <0197> it
addr == 16'h39 ? 16'h656d :  // <0197> em
addr == 16'h3a ? 16'h3072 :  // <0197> 0r
// "mstimer1"
addr == 16'h3b ? 16'h736d :  // <0197> sm
addr == 16'h3c ? 16'h6974 :  // <0197> it
addr == 16'h3d ? 16'h656d :  // <0197> em
addr == 16'h3e ? 16'h3172 :  // <0197> 1r
// "mstimer2"
addr == 16'h3f ? 16'h736d :  // <0197> sm
addr == 16'h40 ? 16'h6974 :  // <0197> it
addr == 16'h41 ? 16'h656d :  // <0197> em
addr == 16'h42 ? 16'h3272 :  // <0197> 2r
// "spi_data"
addr == 16'h43 ? 16'h7073 :  // <0197> ps
addr == 16'h44 ? 16'h5f69 :  // <0197> _i
addr == 16'h45 ? 16'h6164 :  // <0197> ad
addr == 16'h46 ? 16'h6174 :  // <0197> at
// "//avwrdt"
addr == 16'h47 ? 16'h2f2f :  // <0197> //
addr == 16'h48 ? 16'h7661 :  // <0197> va
addr == 16'h49 ? 16'h7277 :  // <0197> rw
addr == 16'h4a ? 16'h7464 :  // <0197> td
// "av_rd_dt"
addr == 16'h4b ? 16'h7661 :  // <0197> va
addr == 16'h4c ? 16'h725f :  // <0197> r_
addr == 16'h4d ? 16'h5f64 :  // <0197> _d
addr == 16'h4e ? 16'h7464 :  // <0197> td
// "av_ad_hi"
addr == 16'h4f ? 16'h7661 :  // <0197> va
addr == 16'h50 ? 16'h615f :  // <0197> a_
addr == 16'h51 ? 16'h5f64 :  // <0197> _d
addr == 16'h52 ? 16'h6968 :  // <0197> ih
// "av_ad_lo"
addr == 16'h53 ? 16'h7661 :  // <0197> va
addr == 16'h54 ? 16'h615f :  // <0197> a_
addr == 16'h55 ? 16'h5f64 :  // <0197> _d
addr == 16'h56 ? 16'h6f6c :  // <0197> ol
// "//uartdt"
addr == 16'h57 ? 16'h2f2f :  // <0197> //
addr == 16'h58 ? 16'h6175 :  // <0197> au
addr == 16'h59 ? 16'h7472 :  // <0197> tr
addr == 16'h5a ? 16'h7464 :  // <0197> td
// "uartstat"
addr == 16'h5b ? 16'h6175 :  // <0197> au
addr == 16'h5c ? 16'h7472 :  // <0197> tr
addr == 16'h5d ? 16'h7473 :  // <0197> ts
addr == 16'h5e ? 16'h7461 :  // <0197> ta
// "    leds"
addr == 16'h5f ? 16'h2020 :  // <0197>   
addr == 16'h60 ? 16'h2020 :  // <0197>   
addr == 16'h61 ? 16'h656c :  // <0197> el
addr == 16'h62 ? 16'h7364 :  // <0197> sd
// "brd_ctrl"
addr == 16'h63 ? 16'h7262 :  // <0197> rb
addr == 16'h64 ? 16'h5f64 :  // <0197> _d
addr == 16'h65 ? 16'h7463 :  // <0197> tc
addr == 16'h66 ? 16'h6c72 :  // <0197> lr
// "   anmux"
addr == 16'h67 ? 16'h2020 :  // <0197>   
addr == 16'h68 ? 16'h6120 :  // <0197> a 
addr == 16'h69 ? 16'h6d6e :  // <0197> mn
addr == 16'h6a ? 16'h7875 :  // <0197> xu
// "pwr_duty"
addr == 16'h6b ? 16'h7770 :  // <0197> wp
addr == 16'h6c ? 16'h5f72 :  // <0197> _r
addr == 16'h6d ? 16'h7564 :  // <0197> ud
addr == 16'h6e ? 16'h7974 :  // <0197> yt
// "igntmcap"
addr == 16'h6f ? 16'h6769 :  // <0197> gi
addr == 16'h70 ? 16'h746e :  // <0197> tn
addr == 16'h71 ? 16'h636d :  // <0197> cm
addr == 16'h72 ? 16'h7061 :  // <0197> pa
// "igntmout"
addr == 16'h73 ? 16'h6769 :  // <0197> gi
addr == 16'h74 ? 16'h746e :  // <0197> tn
addr == 16'h75 ? 16'h6f6d :  // <0197> om
addr == 16'h76 ? 16'h7475 :  // <0197> tu
// "puflenus"
addr == 16'h77 ? 16'h7570 :  // <0197> up
addr == 16'h78 ? 16'h6c66 :  // <0197> lf
addr == 16'h79 ? 16'h6e65 :  // <0197> ne
addr == 16'h7a ? 16'h7375 :  // <0197> su

// string resources
// :boot_msg // = 0x007b
// "TGT\r\n\x0"
addr == 16'h7b ? 16'h4754 :  // <0201> GT
addr == 16'h7c ? 16'h0d54 :  // <0201>  T
addr == 16'h7d ? 16'h000a :  // <0201>   

// engine state management.  each engine state is called a "plan".
// ram_define ram_plan
// ram_plan should be a pointer to a plan structure instead of an enum.
// setvar plan_stop        0
// setvar plan_crank       1
// setvar plan_warmup      2
// setvar plan_run         3
// plan definitions
// :plans
// ([label :plan_stop])
// ([label :plan_crank])
// ([label :plan_warmup])
// ([label :plan_run])
// :plan_stop
// ([label :plan_name_stop])
// ([label :puff_len_stop])
// ([label :leave_stop])
// :plan_name_stop
// "STP\x0"
// :plan_crank
// ([label :plan_name_crank])
// ([label :puff_len_crank])
// ([label :leave_crank])
// :plan_name_crank
// "CR\x0"
// :plan_warmup
// ([label :plan_name_warmup])
// ([label :puff_len_warmup])
// ([label :leave_warmup])
// :plan_name_warmup
// "WM\x0"
// :plan_run
// ([label :plan_name_run])
// ([label :crank_puff_run])
// ([label :leave_run])
// :plan_name_run
// "RN\x0"


// libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.

// event loop.  this infrastructure is assembled directly into the main program, not a func.
// first instruction of an event handler should be the 7th cycle after reading its priority from the event controller here.
// :poll_events // = 0x007e
// initialize prior to polling loop, for minimum latency.
addr == 16'h7e ? 16'h07a0 :  // <0006> b = :event_table
addr == 16'h7f ? 16'h0331 :  // <0006> "
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
addr == 16'h211 ? 16'h03a4 :  // <0006> "
addr == 16'h212 ? 16'hfc00 :  // <0006> "
// normally puff length is not touched by an init func.
// this one does it because it's part of the program boot,
// and also a good idea whenever stopping the engine.
// this might interrupt a puff in mid-pulse, but no matter in this case.
addr == 16'h213 ? 16'h4e00 :  // <0011> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h214 ? 16'h526e :  // <0011> ram $ram_next_puff_len_us = 0 // av_ad_lo = 110
addr == 16'h215 ? 16'h4600 :  // <0011> ram $ram_next_puff_len_us = 0 // av_write_data = 0
addr == 16'h216 ? 16'h7600 :  // <0012> puff_len_us = 0
// set noise filter to measure RPM between 50 and 1160 to indicate cranking.
addr == 16'h217 ? 16'h4e00 :  // <0014> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_hi = 0
addr == 16'h218 ? 16'h5260 :  // <0014> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_ad_lo = 96
addr == 16'h219 ? 16'h47a0 :  // <0014> ram $ram_ign_fastest_jf = ([rpm_to_jf 1160]) // av_write_data = 603
addr == 16'h21a ? 16'h025b :  // <0014> "
addr == 16'h21b ? 16'h4e00 :  // <0015> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_hi = 0
addr == 16'h21c ? 16'h5262 :  // <0015> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_ad_lo = 98
addr == 16'h21d ? 16'h47a0 :  // <0015> ram $ram_ign_slowest_jf = ([rpm_to_jf 50]) // av_write_data = 14000
addr == 16'h21e ? 16'h36b0 :  // <0015> "

// memorize state.
addr == 16'h21f ? 16'h4e00 :  // <0018> ram $ram_plan_name = :plan_name_stop // av_ad_hi = 0
addr == 16'h220 ? 16'h5266 :  // <0018> ram $ram_plan_name = :plan_name_stop // av_ad_lo = 102
addr == 16'h221 ? 16'h47a0 :  // <0018> ram $ram_plan_name = :plan_name_stop // av_write_data = :plan_name_stop
addr == 16'h222 ? 16'h020d :  // <0018> "
addr == 16'h223 ? 16'h4e00 :  // <0019> ram $ram_puff_len_func = :puff_len_stop // av_ad_hi = 0
addr == 16'h224 ? 16'h5268 :  // <0019> ram $ram_puff_len_func = :puff_len_stop // av_ad_lo = 104
addr == 16'h225 ? 16'h47a0 :  // <0019> ram $ram_puff_len_func = :puff_len_stop // av_write_data = :puff_len_stop
addr == 16'h226 ? 16'h0232 :  // <0019> "
addr == 16'h227 ? 16'h4e00 :  // <0020> ram $ram_transition_func = :leave_stop // av_ad_hi = 0
addr == 16'h228 ? 16'h526a :  // <0020> ram $ram_transition_func = :leave_stop // av_ad_lo = 106
addr == 16'h229 ? 16'h47a0 :  // <0020> ram $ram_transition_func = :leave_stop // av_write_data = :leave_stop
addr == 16'h22a ? 16'h0236 :  // <0020> "
addr == 16'h22b ? 16'h4e00 :  // <0021> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_hi = 0
addr == 16'h22c ? 16'h526c :  // <0021> ram $ram_destroy_plan_func = :destroy_plan_stop // av_ad_lo = 108
addr == 16'h22d ? 16'h47a0 :  // <0021> ram $ram_destroy_plan_func = :destroy_plan_stop // av_write_data = :destroy_plan_stop
addr == 16'h22e ? 16'h0231 :  // <0021> "
addr == 16'h22f ? 16'hf808 :  // <0022> pop rtna // end_func
addr == 16'h230 ? 16'hfc00 :  // <0022> swapra = nop

// ######## func destroy_plan_stop // = 0x0231
addr == 16'h231 ? 16'hfc00 :  // <0025> swapra = nop

// ######## func puff_len_stop // = 0x0232
addr == 16'h232 ? 16'h4e00 :  // <0028> ram $ram_next_puff_len_us = 0 // av_ad_hi = 0
addr == 16'h233 ? 16'h526e :  // <0028> ram $ram_next_puff_len_us = 0 // av_ad_lo = 110
addr == 16'h234 ? 16'h4600 :  // <0028> ram $ram_next_puff_len_us = 0 // av_write_data = 0
addr == 16'h235 ? 16'hfc00 :  // <0029> swapra = nop

// ######## func leave_stop // = 0x0236
addr == 16'h236 ? 16'h203e :  // <0031> push rtna // func leave_stop
// leave stop plan if ignition switch is turned on AND more than half if the ignition history is valid.
// requiring both conditions prevents spurious noise readings from starting up the injection.
addr == 16'h237 ? 16'h001a :  // <0034> a = power_duty
addr == 16'h238 ? 16'h0680 :  // <0035> b = $ign_switch_off_mask
addr == 16'h239 ? 16'he403 :  // <0036> bn and0z :stay
addr == 16'h23a ? 16'h0248 :  // <0036> "
addr == 16'h23b ? 16'h4e00 :  // <0037> ram a = $ram_ign_bad_samples // av_ad_hi = 0
addr == 16'h23c ? 16'h525e :  // <0037> ram a = $ram_ign_bad_samples // av_ad_lo = 94
addr == 16'h23d ? 16'h0011 :  // <0037> ram a = $ram_ign_bad_samples // a = av_write_data // start read cycle
addr == 16'h23e ? 16'h0012 :  // <0037> ram a = $ram_ign_bad_samples // a = av_read_data // finish read cycle
addr == 16'h23f ? 16'h0608 :  // <0038> b = ($ign_history_len / 2)
addr == 16'h240 ? 16'he006 :  // <0039> br gt :stay
addr == 16'h241 ? 16'h0248 :  // <0039> "
addr == 16'h242 ? 16'hfba0 :  // <0040> call :destroy_plan_stop
addr == 16'h243 ? 16'h0231 :  // <0040> "
addr == 16'h244 ? 16'hfc00 :  // <0040> "
addr == 16'h245 ? 16'hfba0 :  // <0041> call :init_plan_crank
addr == 16'h246 ? 16'h024c :  // <0041> "
addr == 16'h247 ? 16'hfc00 :  // <0041> "
// :stay // = 0x0248
addr == 16'h248 ? 16'hf808 :  // <0043> pop rtna // end_func
addr == 16'h249 ? 16'hfc00 :  // <0043> swapra = nop


// :plan_name_crank // = 0x024a
// "CR\x0"
addr == 16'h24a ? 16'h5243 :  // <0002> RC
addr == 16'h24b ? 16'h0000 :  // <0002>   

// ######## func init_plan_crank // = 0x024c
// set up the crank plan.
addr == 16'h24c ? 16'h4e00 :  // <0006> ram $ram_puff_count = 0 // av_ad_hi = 0
addr == 16'h24d ? 16'h5270 :  // <0006> ram $ram_puff_count = 0 // av_ad_lo = 112
addr == 16'h24e ? 16'h4600 :  // <0006> ram $ram_puff_count = 0 // av_write_data = 0
// normally puff length is not touched by an init func.
// this one does it because it's the beginning of a crank cycle, and puff length
// should be enabled for the first puff.  otherwise the first puff would be missed.
addr == 16'h24f ? 16'h4e00 :  // <0010> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_hi = 0
addr == 16'h250 ? 16'h526e :  // <0010> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_ad_lo = 110
addr == 16'h251 ? 16'h47a0 :  // <0010> ram $ram_next_puff_len_us = $crank_min_puff_len_us // av_write_data = 5000
addr == 16'h252 ? 16'h1388 :  // <0010> "
addr == 16'h253 ? 16'h77a0 :  // <0011> puff_len_us = $crank_min_puff_len_us
addr == 16'h254 ? 16'h1388 :  // <0011> "

addr == 16'h255 ? 16'h4e00 :  // <0013> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h256 ? 16'h5270 :  // <0013> ram a = $ram_puff_count // av_ad_lo = 112
addr == 16'h257 ? 16'h0011 :  // <0013> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h258 ? 16'h0012 :  // <0013> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h259 ? 16'he000 :  // <0014> br az :pc_ok
addr == 16'h25a ? 16'h025f :  // <0014> "
addr == 16'h25b ? 16'h5fa0 :  // <0015> error_halt_code $err_sdram_data // leds = 0xfffa
addr == 16'h25c ? 16'hfffa :  // <0015> "
addr == 16'h25d ? 16'he00f :  // <0015> error_halt_code $err_sdram_data
addr == 16'h25e ? 16'h025d :  // <0015> "
// :pc_ok // = 0x025f

// memorize state.
addr == 16'h25f ? 16'h4e00 :  // <0019> ram $ram_plan_name = :plan_name_crank // av_ad_hi = 0
addr == 16'h260 ? 16'h5266 :  // <0019> ram $ram_plan_name = :plan_name_crank // av_ad_lo = 102
addr == 16'h261 ? 16'h47a0 :  // <0019> ram $ram_plan_name = :plan_name_crank // av_write_data = :plan_name_crank
addr == 16'h262 ? 16'h024a :  // <0019> "
addr == 16'h263 ? 16'h4e00 :  // <0020> ram $ram_puff_len_func = :puff_len_crank // av_ad_hi = 0
addr == 16'h264 ? 16'h5268 :  // <0020> ram $ram_puff_len_func = :puff_len_crank // av_ad_lo = 104
addr == 16'h265 ? 16'h47a0 :  // <0020> ram $ram_puff_len_func = :puff_len_crank // av_write_data = :puff_len_crank
addr == 16'h266 ? 16'h0271 :  // <0020> "
addr == 16'h267 ? 16'h4e00 :  // <0021> ram $ram_transition_func = :leave_crank // av_ad_hi = 0
addr == 16'h268 ? 16'h526a :  // <0021> ram $ram_transition_func = :leave_crank // av_ad_lo = 106
addr == 16'h269 ? 16'h47a0 :  // <0021> ram $ram_transition_func = :leave_crank // av_write_data = :leave_crank
addr == 16'h26a ? 16'h028f :  // <0021> "
addr == 16'h26b ? 16'h4e00 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_hi = 0
addr == 16'h26c ? 16'h526c :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_crank // av_ad_lo = 108
addr == 16'h26d ? 16'h47a0 :  // <0022> ram $ram_destroy_plan_func = :destroy_plan_crank // av_write_data = :destroy_plan_crank
addr == 16'h26e ? 16'h0270 :  // <0022> "
addr == 16'h26f ? 16'hfc00 :  // <0023> swapra = nop

// ######## func destroy_plan_crank // = 0x0270
addr == 16'h270 ? 16'hfc00 :  // <0026> swapra = nop

// ######## func puff_len_crank // = 0x0271
addr == 16'h271 ? 16'h203e :  // <0028> push rtna // func puff_len_crank
addr == 16'h272 ? 16'h4e00 :  // <0029> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h273 ? 16'h5270 :  // <0029> ram a = $ram_puff_count // av_ad_lo = 112
addr == 16'h274 ? 16'h0011 :  // <0029> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h275 ? 16'h0012 :  // <0029> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h276 ? 16'h060a :  // <0030> b = $crank_max_puffs
addr == 16'h277 ? 16'he006 :  // <0031> br gt :puff_limit
addr == 16'h278 ? 16'h0286 :  // <0031> "
// linear escalation from min to max puff length, at a slope of crank_incr_us_per_puff.
addr == 16'h279 ? 16'h07a0 :  // <0033> b = $crank_incr_us_per_puff
addr == 16'h27a ? 16'h05dc :  // <0033> "
addr == 16'h27b ? 16'hfba0 :  // <0034> call :multiply
addr == 16'h27c ? 16'h0160 :  // <0034> "
addr == 16'h27d ? 16'hfc00 :  // <0034> "
addr == 16'h27e ? 16'h07a0 :  // <0035> b = $crank_min_puff_len_us
addr == 16'h27f ? 16'h1388 :  // <0035> "
addr == 16'h280 ? 16'h4e00 :  // <0036> ram $ram_next_puff_len_us = a+b // av_ad_hi = 0
addr == 16'h281 ? 16'h526e :  // <0036> ram $ram_next_puff_len_us = a+b // av_ad_lo = 110
addr == 16'h282 ? 16'hc800 :  // <0036> ram $ram_next_puff_len_us = a+b // av_write_data = a+b
addr == 16'h283 ? 16'h4700 :  // <0036> "
addr == 16'h284 ? 16'he00f :  // <0037> jmp :done
addr == 16'h285 ? 16'h028d :  // <0037> "
// :puff_limit // = 0x0286
// prevent the puff counter from going higher & eventually rolling over.
addr == 16'h286 ? 16'h4e00 :  // <0040> ram $ram_puff_count = $crank_max_puffs // av_ad_hi = 0
addr == 16'h287 ? 16'h5270 :  // <0040> ram $ram_puff_count = $crank_max_puffs // av_ad_lo = 112
addr == 16'h288 ? 16'h460a :  // <0040> ram $ram_puff_count = $crank_max_puffs // av_write_data = 10
// accept max puff len.
addr == 16'h289 ? 16'h4e00 :  // <0042> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_hi = 0
addr == 16'h28a ? 16'h526e :  // <0042> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_ad_lo = 110
addr == 16'h28b ? 16'h47a0 :  // <0042> ram $ram_next_puff_len_us = $crank_max_puff_len_us // av_write_data = 20000
addr == 16'h28c ? 16'h4e20 :  // <0042> "
// :done // = 0x028d
addr == 16'h28d ? 16'hf808 :  // <0044> pop rtna // end_func
addr == 16'h28e ? 16'hfc00 :  // <0044> swapra = nop

// ######## func leave_crank // = 0x028f
addr == 16'h28f ? 16'h203e :  // <0046> push rtna // func leave_crank
addr == 16'h290 ? 16'hfba0 :  // <0047> call :check_engine_stop
addr == 16'h291 ? 16'h0612 :  // <0047> "
addr == 16'h292 ? 16'hfc00 :  // <0047> "
addr == 16'h293 ? 16'he400 :  // <0048> bn az :done
addr == 16'h294 ? 16'h02a9 :  // <0048> "

// transition to warmup if RPM exceeds crank_success_rpm.
addr == 16'h295 ? 16'h4e00 :  // <0051> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h296 ? 16'h525c :  // <0051> ram a = $ram_rpm_valid // av_ad_lo = 92
addr == 16'h297 ? 16'h0011 :  // <0051> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h298 ? 16'h0012 :  // <0051> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle
addr == 16'h299 ? 16'he400 :  // <0052> bn az :stay
addr == 16'h29a ? 16'h02a9 :  // <0052> "
addr == 16'h29b ? 16'h4e00 :  // <0053> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h29c ? 16'h525a :  // <0053> ram a = $ram_avg_rpm // av_ad_lo = 90
addr == 16'h29d ? 16'h0011 :  // <0053> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h29e ? 16'h0012 :  // <0053> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle
addr == 16'h29f ? 16'h07a0 :  // <0054> b = $crank_success_rpm
addr == 16'h2a0 ? 16'h0258 :  // <0054> "
addr == 16'h2a1 ? 16'he005 :  // <0055> br lt :stay
addr == 16'h2a2 ? 16'h02a9 :  // <0055> "
addr == 16'h2a3 ? 16'hfba0 :  // <0056> call :destroy_plan_crank
addr == 16'h2a4 ? 16'h0270 :  // <0056> "
addr == 16'h2a5 ? 16'hfc00 :  // <0056> "
addr == 16'h2a6 ? 16'hfba0 :  // <0057> call :init_plan_stop
addr == 16'h2a7 ? 16'h020f :  // <0057> "
addr == 16'h2a8 ? 16'hfc00 :  // <0057> "
// :stay // = 0x02a9

// :done // = 0x02a9
addr == 16'h2a9 ? 16'hf808 :  // <0061> pop rtna // end_func
addr == 16'h2aa ? 16'hfc00 :  // <0061> swapra = nop


// :plan_name_warmup // = 0x02ab
// "WM\x0"
addr == 16'h2ab ? 16'h4d57 :  // <0002> MW
addr == 16'h2ac ? 16'h0000 :  // <0002>   

// ######## func init_plan_warmup // = 0x02ad
// set up the warmup plan.

// memorize state.
addr == 16'h2ad ? 16'h4e00 :  // <0008> ram $ram_plan_name = :plan_name_warmup // av_ad_hi = 0
addr == 16'h2ae ? 16'h5266 :  // <0008> ram $ram_plan_name = :plan_name_warmup // av_ad_lo = 102
addr == 16'h2af ? 16'h47a0 :  // <0008> ram $ram_plan_name = :plan_name_warmup // av_write_data = :plan_name_warmup
addr == 16'h2b0 ? 16'h02ab :  // <0008> "
addr == 16'h2b1 ? 16'h4e00 :  // <0009> ram $ram_puff_len_func = :puff_len_warmup // av_ad_hi = 0
addr == 16'h2b2 ? 16'h5268 :  // <0009> ram $ram_puff_len_func = :puff_len_warmup // av_ad_lo = 104
addr == 16'h2b3 ? 16'h47a0 :  // <0009> ram $ram_puff_len_func = :puff_len_warmup // av_write_data = :puff_len_warmup
addr == 16'h2b4 ? 16'h02bf :  // <0009> "
addr == 16'h2b5 ? 16'h4e00 :  // <0010> ram $ram_transition_func = :leave_warmup // av_ad_hi = 0
addr == 16'h2b6 ? 16'h526a :  // <0010> ram $ram_transition_func = :leave_warmup // av_ad_lo = 106
addr == 16'h2b7 ? 16'h47a0 :  // <0010> ram $ram_transition_func = :leave_warmup // av_write_data = :leave_warmup
addr == 16'h2b8 ? 16'h02c4 :  // <0010> "
addr == 16'h2b9 ? 16'h4e00 :  // <0011> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_ad_hi = 0
addr == 16'h2ba ? 16'h526c :  // <0011> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_ad_lo = 108
addr == 16'h2bb ? 16'h47a0 :  // <0011> ram $ram_destroy_plan_func = :destroy_plan_warmup // av_write_data = :destroy_plan_warmup
addr == 16'h2bc ? 16'h02be :  // <0011> "
addr == 16'h2bd ? 16'hfc00 :  // <0012> swapra = nop

// ######## func destroy_plan_warmup // = 0x02be
addr == 16'h2be ? 16'hfc00 :  // <0015> swapra = nop

// ######## func puff_len_warmup // = 0x02bf
addr == 16'h2bf ? 16'h4e00 :  // <0018> ram $ram_next_puff_len_us = 5000 // av_ad_hi = 0
addr == 16'h2c0 ? 16'h526e :  // <0018> ram $ram_next_puff_len_us = 5000 // av_ad_lo = 110
addr == 16'h2c1 ? 16'h47a0 :  // <0018> ram $ram_next_puff_len_us = 5000 // av_write_data = 5000
addr == 16'h2c2 ? 16'h1388 :  // <0018> "
//patch: add the dial setting to this, for testing.
addr == 16'h2c3 ? 16'hfc00 :  // <0020> swapra = nop

// ######## func leave_warmup // = 0x02c4
addr == 16'h2c4 ? 16'h203e :  // <0022> push rtna // func leave_warmup
addr == 16'h2c5 ? 16'hfba0 :  // <0023> call :check_engine_stop
addr == 16'h2c6 ? 16'h0612 :  // <0023> "
addr == 16'h2c7 ? 16'hfc00 :  // <0023> "
addr == 16'h2c8 ? 16'he400 :  // <0024> bn az :done
addr == 16'h2c9 ? 16'h02db :  // <0024> "

// transition to plan_run if engine temp exceeds warmup_success_temp_adc.
addr == 16'h2ca ? 16'h0202 :  // <0027> a = $anmux_engine_block_temp

addr == 16'h2cb ? 16'h0351 :  // <0028> a = a<<1
addr == 16'h2cc ? 16'h0608 :  // <0028> b = 8
addr == 16'h2cd ? 16'h4e00 :  // <0028> av_ad_hi = 0
addr == 16'h2ce ? 16'h5300 :  // <0028> av_ad_lo = ad0
addr == 16'h2cf ? 16'h0411 :  // <0028> b = av_write_data
addr == 16'h2d0 ? 16'h0412 :  // <0028> b = av_read_data

addr == 16'h2d1 ? 16'h03a0 :  // <0029> a = $warmup_success_temp_adc
addr == 16'h2d2 ? 16'h04c0 :  // <0029> "
addr == 16'h2d3 ? 16'he006 :  // <0030> br gt :stay
addr == 16'h2d4 ? 16'h02db :  // <0030> "
addr == 16'h2d5 ? 16'hfba0 :  // <0031> call :destroy_plan_warmup
addr == 16'h2d6 ? 16'h02be :  // <0031> "
addr == 16'h2d7 ? 16'hfc00 :  // <0031> "
addr == 16'h2d8 ? 16'hfba0 :  // <0032> call :init_plan_run
addr == 16'h2d9 ? 16'h02df :  // <0032> "
addr == 16'h2da ? 16'hfc00 :  // <0032> "
// :stay // = 0x02db

// :done // = 0x02db
addr == 16'h2db ? 16'hf808 :  // <0036> pop rtna // end_func
addr == 16'h2dc ? 16'hfc00 :  // <0036> swapra = nop


// :plan_name_run // = 0x02dd
// "RN\x0"
addr == 16'h2dd ? 16'h4e52 :  // <0002> NR
addr == 16'h2de ? 16'h0000 :  // <0002>   

// ######## func init_plan_run // = 0x02df
// set up the run plan.

// memorize state.
addr == 16'h2df ? 16'h4e00 :  // <0008> ram $ram_plan_name = :plan_name_run // av_ad_hi = 0
addr == 16'h2e0 ? 16'h5266 :  // <0008> ram $ram_plan_name = :plan_name_run // av_ad_lo = 102
addr == 16'h2e1 ? 16'h47a0 :  // <0008> ram $ram_plan_name = :plan_name_run // av_write_data = :plan_name_run
addr == 16'h2e2 ? 16'h02dd :  // <0008> "
addr == 16'h2e3 ? 16'h4e00 :  // <0009> ram $ram_puff_len_func = :puff_len_run // av_ad_hi = 0
addr == 16'h2e4 ? 16'h5268 :  // <0009> ram $ram_puff_len_func = :puff_len_run // av_ad_lo = 104
addr == 16'h2e5 ? 16'h47a0 :  // <0009> ram $ram_puff_len_func = :puff_len_run // av_write_data = :puff_len_run
addr == 16'h2e6 ? 16'h02f6 :  // <0009> "
addr == 16'h2e7 ? 16'h4e00 :  // <0010> ram $ram_transition_func = :leave_run // av_ad_hi = 0
addr == 16'h2e8 ? 16'h526a :  // <0010> ram $ram_transition_func = :leave_run // av_ad_lo = 106
addr == 16'h2e9 ? 16'h47a0 :  // <0010> ram $ram_transition_func = :leave_run // av_write_data = :leave_run
addr == 16'h2ea ? 16'h02fb :  // <0010> "
addr == 16'h2eb ? 16'h4e00 :  // <0011> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_hi = 0
addr == 16'h2ec ? 16'h526c :  // <0011> ram $ram_destroy_plan_func = :destroy_plan_run // av_ad_lo = 108
addr == 16'h2ed ? 16'h47a0 :  // <0011> ram $ram_destroy_plan_func = :destroy_plan_run // av_write_data = :destroy_plan_run
addr == 16'h2ee ? 16'h02f0 :  // <0011> "
addr == 16'h2ef ? 16'hfc00 :  // <0012> swapra = nop

// ######## func destroy_plan_run // = 0x02f0
addr == 16'h2f0 ? 16'h203e :  // <0014> push rtna // func destroy_plan_run
addr == 16'h2f1 ? 16'hfba0 :  // <0015> call :clear_ign_history
addr == 16'h2f2 ? 16'h03a4 :  // <0015> "
addr == 16'h2f3 ? 16'hfc00 :  // <0015> "
addr == 16'h2f4 ? 16'hf808 :  // <0016> pop rtna // end_func
addr == 16'h2f5 ? 16'hfc00 :  // <0016> swapra = nop

// ######## func puff_len_run // = 0x02f6
addr == 16'h2f6 ? 16'h4e00 :  // <0019> ram $ram_next_puff_len_us = 3000 // av_ad_hi = 0
addr == 16'h2f7 ? 16'h526e :  // <0019> ram $ram_next_puff_len_us = 3000 // av_ad_lo = 110
addr == 16'h2f8 ? 16'h47a0 :  // <0019> ram $ram_next_puff_len_us = 3000 // av_write_data = 3000
addr == 16'h2f9 ? 16'h0bb8 :  // <0019> "
addr == 16'h2fa ? 16'hfc00 :  // <0020> swapra = nop

// ######## func leave_run // = 0x02fb
addr == 16'h2fb ? 16'h203e :  // <0022> push rtna // func leave_run
addr == 16'h2fc ? 16'hfba0 :  // <0023> call :check_engine_stop
addr == 16'h2fd ? 16'h0612 :  // <0023> "
addr == 16'h2fe ? 16'hfc00 :  // <0023> "
addr == 16'h2ff ? 16'hf808 :  // <0024> pop rtna // end_func
addr == 16'h300 ? 16'hfc00 :  // <0024> swapra = nop



// #########################################################################
// :main // = 0x0301
addr == 16'h301 ? 16'h03a0 :  // <0259> a = :boot_msg
addr == 16'h302 ? 16'h007b :  // <0259> "
addr == 16'h303 ? 16'hfba0 :  // <0260> call :print_nt
addr == 16'h304 ? 16'h013f :  // <0260> "
addr == 16'h305 ? 16'hfc00 :  // <0260> "

// soft_event = (1 << 14)
// soft_event = 0
// jmp :main

// clear the first 64k of RAM.
addr == 16'h306 ? 16'h4e00 :  // <0267> av_ad_hi = 0
addr == 16'h307 ? 16'h0200 :  // <0268> a = 0
addr == 16'h308 ? 16'h0602 :  // <0269> b = 2
// :clear_next_word // = 0x0309
addr == 16'h309 ? 16'h5000 :  // <0271> av_ad_lo = a
addr == 16'h30a ? 16'h4600 :  // <0272> av_write_data = 0
addr == 16'h30b ? 16'h0300 :  // <0273> a = ad0
addr == 16'h30c ? 16'he400 :  // <0274> bn az :clear_next_word
addr == 16'h30d ? 16'h0309 :  // <0274> "

// i = 0x80
// j = -1
// av_ad_hi = 0
// :test_next_word
// av_ad_lo = i
// av_write_data = i
// av_ad_lo = 0xff
// av_write_data = i
// i = i+j
// bn iz :test_next_word
// jmp :main

// init fuel injection.
addr == 16'h30e ? 16'h73a0 :  // <0289> ign_timeout_len_jf = 0xfffc
addr == 16'h30f ? 16'hfffc :  // <0289> "
addr == 16'h310 ? 16'h77a0 :  // <0290> puff_len_us = 3000
addr == 16'h311 ? 16'h0bb8 :  // <0290> "
addr == 16'h312 ? 16'hfba0 :  // <0291> call :init_plan_stop
addr == 16'h313 ? 16'h020f :  // <0291> "
addr == 16'h314 ? 16'hfc00 :  // <0291> "

// power up FTDI USB board, and init any other special board control functions.
addr == 16'h315 ? 16'h6280 :  // <0294> board_ctrl = $ftdi_power_mask
addr == 16'h316 ? 16'hfba0 :  // <0295> call :postpone_comm_restart
addr == 16'h317 ? 16'h0587 :  // <0295> "
addr == 16'h318 ? 16'hfc00 :  // <0295> "

// check initial state of power management circuits.
// if power is lost or ignition switch is off already, open relay & abort run.
// that's important because then the event controller booted up too late to
// see edges on those 2 signals.  regular system would never shut itself down.
// this setup is the last thing done prior to the event handler loop.
addr == 16'h319 ? 16'h6a00 :  // <0302> power_duty = $power_duty_closing
addr == 16'h31a ? 16'h001a :  // <0303> a = power_duty
addr == 16'h31b ? 16'h06c0 :  // <0304> b = ($power_lost_mask | $ign_switch_off_mask)
addr == 16'h31c ? 16'he003 :  // <0305> br and0z :skip_power_lost
addr == 16'h31d ? 16'h0323 :  // <0305> "
addr == 16'h31e ? 16'h6a32 :  // <0306> power_duty = $power_duty_opening
addr == 16'h31f ? 16'h5fa0 :  // <0307> error_halt_code $err_power_lost_at_boot // leds = 0xfffb
addr == 16'h320 ? 16'hfffb :  // <0307> "
addr == 16'h321 ? 16'he00f :  // <0307> error_halt_code $err_power_lost_at_boot
addr == 16'h322 ? 16'h0321 :  // <0307> "
// :skip_power_lost // = 0x0323
addr == 16'h323 ? 16'h4e00 :  // <0309> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h324 ? 16'h5218 :  // <0309> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 24
addr == 16'h325 ? 16'h4760 :  // <0309> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h326 ? 16'h4e00 :  // <0310> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_hi = 0
addr == 16'h327 ? 16'h521a :  // <0310> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_ad_lo = 26
addr == 16'h328 ? 16'h4602 :  // <0310> ram $ram_relay_hold_at_pass = $relay_hold_passes // av_write_data = 2

// start handling events.
addr == 16'h329 ? 16'h2ba0 :  // <0313> soft_event = $event_controller_reset_mask
addr == 16'h32a ? 16'h8000 :  // <0313> "
addr == 16'h32b ? 16'h2a00 :  // <0314> soft_event = 0
addr == 16'h32c ? 16'h37a0 :  // <0315> mstimer0 = 1000
addr == 16'h32d ? 16'h03e8 :  // <0315> "
addr == 16'h32e ? 16'h3e14 :  // <0316> mstimer2 = $plan_tick_ms
addr == 16'h32f ? 16'he00f :  // <0317> jmp :poll_events
addr == 16'h330 ? 16'h007e :  // <0317> "

// event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.
// event 0 not used in this app anyway.
// :event_table // = 0x0331
addr == 16'h331 ? 16'h007e :  // <0322> ([label :poll_events])
addr == 16'h332 ? 16'h04e0 :  // <0323> ([label :power_lost_handler])
addr == 16'h333 ? 16'h0346 :  // <0324> ([label :ign_capture_handler])
addr == 16'h334 ? 16'h03bd :  // <0325> ([label :ign_capture_timeout_handler])
addr == 16'h335 ? 16'h050f :  // <0326> ([label :puff1_done_handler])
addr == 16'h336 ? 16'h03c2 :  // <0327> ([label :ustimer0_handler])
addr == 16'h337 ? 16'h03c4 :  // <0328> ([label :spi_done_handler])
addr == 16'h338 ? 16'h0405 :  // <0329> ([label :mstimer0_handler])
addr == 16'h339 ? 16'h0430 :  // <0330> ([label :mstimer1_handler])
addr == 16'h33a ? 16'h044e :  // <0331> ([label :mstimer2_handler])
addr == 16'h33b ? 16'h045b :  // <0332> ([label :uart_rx_handler])
addr == 16'h33c ? 16'h046b :  // <0333> ([label :uart_rx_overflow_handler])
addr == 16'h33d ? 16'h0471 :  // <0334> ([label :uart_tx_overflow_handler])
addr == 16'h33e ? 16'h0477 :  // <0335> ([label :key0_handler])
addr == 16'h33f ? 16'h0481 :  // <0336> ([label :key1_handler])
addr == 16'h340 ? 16'h04f2 :  // <0337> ([label :ign_switch_off_handler])
addr == 16'h341 ? 16'h0505 :  // <0338> ([label :ign_switch_on_handler])
addr == 16'h342 ? 16'h048b :  // <0339> ([label :softevent3_handler])
addr == 16'h343 ? 16'h048d :  // <0340> ([label :softevent2_handler])
addr == 16'h344 ? 16'h048f :  // <0341> ([label :softevent1_handler])
addr == 16'h345 ? 16'h0491 :  // <0342> ([label :softevent0_handler])

// #########################################################################

// ######## event ign_capture_handler // = 0x0346
// discard outlier time.
addr == 16'h346 ? 16'h181b :  // <0348> g6 = ign_capture_jf
addr == 16'h347 ? 16'h4e00 :  // <0349> ram b = $ram_ign_fastest_jf // av_ad_hi = 0
addr == 16'h348 ? 16'h5260 :  // <0349> ram b = $ram_ign_fastest_jf // av_ad_lo = 96
addr == 16'h349 ? 16'h0411 :  // <0349> ram b = $ram_ign_fastest_jf // b = av_write_data // start read cycle
addr == 16'h34a ? 16'h0412 :  // <0349> ram b = $ram_ign_fastest_jf // b = av_read_data // finish read cycle
addr == 16'h34b ? 16'h0006 :  // <0350> a = g6
addr == 16'h34c ? 16'he006 :  // <0351> br gt :fastest_ok
addr == 16'h34d ? 16'h034f :  // <0351> "
addr == 16'h34e ? 16'h1a00 :  // <0352> g6 = 0
// :fastest_ok // = 0x034f
addr == 16'h34f ? 16'h4e00 :  // <0354> ram b = $ram_ign_slowest_jf // av_ad_hi = 0
addr == 16'h350 ? 16'h5262 :  // <0354> ram b = $ram_ign_slowest_jf // av_ad_lo = 98
addr == 16'h351 ? 16'h0411 :  // <0354> ram b = $ram_ign_slowest_jf // b = av_write_data // start read cycle
addr == 16'h352 ? 16'h0412 :  // <0354> ram b = $ram_ign_slowest_jf // b = av_read_data // finish read cycle
addr == 16'h353 ? 16'h0006 :  // <0355> a = g6
addr == 16'h354 ? 16'he005 :  // <0356> br lt :slowest_ok
addr == 16'h355 ? 16'h0357 :  // <0356> "
addr == 16'h356 ? 16'h1a00 :  // <0357> g6 = 0
// :slowest_ok // = 0x0357

// increment buffer index and memorize time.
addr == 16'h357 ? 16'h4e00 :  // <0361> ram a = $ram_ign_history_idx // av_ad_hi = 0
addr == 16'h358 ? 16'h5236 :  // <0361> ram a = $ram_ign_history_idx // av_ad_lo = 54
addr == 16'h359 ? 16'h0011 :  // <0361> ram a = $ram_ign_history_idx // a = av_write_data // start read cycle
addr == 16'h35a ? 16'h0012 :  // <0361> ram a = $ram_ign_history_idx // a = av_read_data // finish read cycle
addr == 16'h35b ? 16'h0601 :  // <0362> b = 1
addr == 16'h35c ? 16'hc800 :  // <0363> a = a+b
addr == 16'h35d ? 16'h0300 :  // <0363> "
addr == 16'h35e ? 16'h060f :  // <0364> b = $ign_history_idx_mask
addr == 16'h35f ? 16'hc800 :  // <0365> a = and
addr == 16'h360 ? 16'h0330 :  // <0365> "
addr == 16'h361 ? 16'h4e00 :  // <0366> ram $ram_ign_history_idx = a // av_ad_hi = 0
addr == 16'h362 ? 16'h5236 :  // <0366> ram $ram_ign_history_idx = a // av_ad_lo = 54
addr == 16'h363 ? 16'h4400 :  // <0366> ram $ram_ign_history_idx = a // av_write_data = a
addr == 16'h364 ? 16'h0406 :  // <0367> b = g6

addr == 16'h365 ? 16'h0351 :  // <0368> a = a<<1
addr == 16'h366 ? 16'h2001 :  // <0368> push b // push b
addr == 16'h367 ? 16'h0638 :  // <0368> b = 56
addr == 16'h368 ? 16'h4e00 :  // <0368> av_ad_hi = 0
addr == 16'h369 ? 16'h5300 :  // <0368> av_ad_lo = ad0
addr == 16'h36a ? 16'h4408 :  // <0368> pop av_write_data // pop av_write_data


// ////////// compute new jiffy estimate.

// // first, total up the oldest 25% of the history
// // this doesn't work above 2^14 jf.  that's below 44 RPM.
// // reg a must be already loaded with the history index most recently written.
// // a=index, i=total, x=loop count.
// i = 0
// x = $ign_history_quarter
// y = -1
// :next_oldest
// b = 1
// a = a+b
// b = $ign_history_idx_mask
// a = and
// struct_read j = $ram_ign_history_jf a
// i = i+j
// x = x+y
// bn xz :next_oldest
// // memorize average.
// a = i
// << for {set n 0} {$n < $ign_avg_shift} {incr n} {parse3 a = a>>1 {}} >>
// ram $ram_ign_oldest_avg_jf = a

// average entire history.
// x = total, i = index = loop count, g6 = count of invalid samples.
addr == 16'h36b ? 16'h1200 :  // <0395> x = 0
addr == 16'h36c ? 16'h0a10 :  // <0396> i = $ign_history_len
addr == 16'h36d ? 16'h0f60 :  // <0397> j = -1
addr == 16'h36e ? 16'h1a00 :  // <0398> g6 = 0
// :next_avg // = 0x036f
addr == 16'h36f ? 16'hc800 :  // <0400> i = i+j
addr == 16'h370 ? 16'h0b10 :  // <0400> "
addr == 16'h371 ? 16'h0002 :  // <0401> a = i

addr == 16'h372 ? 16'h0351 :  // <0402> a = a<<1
addr == 16'h373 ? 16'h0638 :  // <0402> b = 56
addr == 16'h374 ? 16'h4e00 :  // <0402> av_ad_hi = 0
addr == 16'h375 ? 16'h5300 :  // <0402> av_ad_lo = ad0
addr == 16'h376 ? 16'h0411 :  // <0402> b = av_write_data
addr == 16'h377 ? 16'h0412 :  // <0402> b = av_read_data

addr == 16'h378 ? 16'h0200 :  // <0403> a = 0
addr == 16'h379 ? 16'he407 :  // <0404> bn eq :valid_sample
addr == 16'h37a ? 16'h0381 :  // <0404> "
addr == 16'h37b ? 16'h0006 :  // <0405> a = g6
addr == 16'h37c ? 16'h0601 :  // <0406> b = 1
addr == 16'h37d ? 16'hc800 :  // <0407> g6 = a+b
addr == 16'h37e ? 16'h1b00 :  // <0407> "
addr == 16'h37f ? 16'he00f :  // <0408> jmp :sample_done
addr == 16'h380 ? 16'h0387 :  // <0408> "
// :valid_sample // = 0x0381
addr == 16'h381 ? 16'h0208 :  // <0410> a = ($ign_history_len / 2)
addr == 16'h382 ? 16'hc800 :  // <0411> a = a+b
addr == 16'h383 ? 16'h0300 :  // <0411> "
addr == 16'h384 ? 16'h1753 :  // <0412> y = a>>$ign_history_idx_bits
addr == 16'h385 ? 16'hc800 :  // <0413> x = x+y
addr == 16'h386 ? 16'h1320 :  // <0413> "
// :sample_done // = 0x0387
addr == 16'h387 ? 16'he401 :  // <0415> bn iz :next_avg
addr == 16'h388 ? 16'h036f :  // <0415> "
addr == 16'h389 ? 16'h4e00 :  // <0416> ram $ram_ign_avg_jf = x // av_ad_hi = 0
addr == 16'h38a ? 16'h5258 :  // <0416> ram $ram_ign_avg_jf = x // av_ad_lo = 88
addr == 16'h38b ? 16'h4404 :  // <0416> ram $ram_ign_avg_jf = x // av_write_data = x
//patch: dividing before summing (instead of after) is much simpler and faster because it prevents overflow.
// but it means we could be reading as much as 16 jf too low (16 = ign_history_len).
// that error is way less than 1 RPM on the slow end,
// or about 1,000 RPM too fast on the fast end!
// might need to tighten that up.  one simple way might be adding ign_history_len / 2 to each history record prior to dividing.
// that didn't seem to help much in simple testing.

addr == 16'h38c ? 16'h4e00 :  // <0424> ram $ram_ign_bad_samples = g6 // av_ad_hi = 0
addr == 16'h38d ? 16'h525e :  // <0424> ram $ram_ign_bad_samples = g6 // av_ad_lo = 94
addr == 16'h38e ? 16'h4406 :  // <0424> ram $ram_ign_bad_samples = g6 // av_write_data = g6
addr == 16'h38f ? 16'h0006 :  // <0425> a = g6
addr == 16'h390 ? 16'h0604 :  // <0426> b = ($ign_history_len / 4)
addr == 16'h391 ? 16'he006 :  // <0427> br gt :partial_history
addr == 16'h392 ? 16'h039f :  // <0427> "
// convert jiffies b to new RPM estimate.
addr == 16'h393 ? 16'h0004 :  // <0429> a = x
addr == 16'h394 ? 16'hfba0 :  // <0430> call :jf_to_rpm
addr == 16'h395 ? 16'h0606 :  // <0430> "
addr == 16'h396 ? 16'hfc00 :  // <0430> "
addr == 16'h397 ? 16'h4e00 :  // <0431> ram $ram_avg_rpm = a // av_ad_hi = 0
addr == 16'h398 ? 16'h525a :  // <0431> ram $ram_avg_rpm = a // av_ad_lo = 90
addr == 16'h399 ? 16'h4400 :  // <0431> ram $ram_avg_rpm = a // av_write_data = a
addr == 16'h39a ? 16'h4e00 :  // <0432> ram $ram_rpm_valid = 1 // av_ad_hi = 0
addr == 16'h39b ? 16'h525c :  // <0432> ram $ram_rpm_valid = 1 // av_ad_lo = 92
addr == 16'h39c ? 16'h4601 :  // <0432> ram $ram_rpm_valid = 1 // av_write_data = 1
addr == 16'h39d ? 16'he00f :  // <0433> jmp :done
addr == 16'h39e ? 16'h0469 :  // <0433> "
// :partial_history // = 0x039f
addr == 16'h39f ? 16'h4e00 :  // <0435> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h3a0 ? 16'h525c :  // <0435> ram $ram_rpm_valid = 0 // av_ad_lo = 92
addr == 16'h3a1 ? 16'h4600 :  // <0435> ram $ram_rpm_valid = 0 // av_write_data = 0

// :done // = 0x03a2
addr == 16'h3a2 ? 16'he00f :  // <0438> end_event
addr == 16'h3a3 ? 16'h007e :  // <0438> "

// ######## func clear_ign_history // = 0x03a4
addr == 16'h3a4 ? 16'h2002 :  // <0440> push i // func clear_ign_history
addr == 16'h3a5 ? 16'h2003 :  // <0440> push j // "
// invalidate the RPM estimate.
addr == 16'h3a6 ? 16'h4e00 :  // <0442> ram $ram_rpm_valid = 0 // av_ad_hi = 0
addr == 16'h3a7 ? 16'h525c :  // <0442> ram $ram_rpm_valid = 0 // av_ad_lo = 92
addr == 16'h3a8 ? 16'h4600 :  // <0442> ram $ram_rpm_valid = 0 // av_write_data = 0
// the last known RPM estimate is retained here, not cleared.
// clear the history so it won't be valid again until several more valid samples are collected.
addr == 16'h3a9 ? 16'h4e00 :  // <0445> ram $ram_ign_bad_samples = $ign_history_len // av_ad_hi = 0
addr == 16'h3aa ? 16'h525e :  // <0445> ram $ram_ign_bad_samples = $ign_history_len // av_ad_lo = 94
addr == 16'h3ab ? 16'h4610 :  // <0445> ram $ram_ign_bad_samples = $ign_history_len // av_write_data = 16
addr == 16'h3ac ? 16'h0a10 :  // <0446> i = $ign_history_len
addr == 16'h3ad ? 16'h0f60 :  // <0447> j = -1
// :next // = 0x03ae
addr == 16'h3ae ? 16'h0002 :  // <0449> a = i
addr == 16'h3af ? 16'h0600 :  // <0450> b = 0

addr == 16'h3b0 ? 16'h0351 :  // <0451> a = a<<1
addr == 16'h3b1 ? 16'h2001 :  // <0451> push b // push b
addr == 16'h3b2 ? 16'h0638 :  // <0451> b = 56
addr == 16'h3b3 ? 16'h4e00 :  // <0451> av_ad_hi = 0
addr == 16'h3b4 ? 16'h5300 :  // <0451> av_ad_lo = ad0
addr == 16'h3b5 ? 16'h4408 :  // <0451> pop av_write_data // pop av_write_data

addr == 16'h3b6 ? 16'hc800 :  // <0452> i = i+j
addr == 16'h3b7 ? 16'h0b10 :  // <0452> "
addr == 16'h3b8 ? 16'he401 :  // <0453> bn iz :next
addr == 16'h3b9 ? 16'h03ae :  // <0453> "
addr == 16'h3ba ? 16'h0c08 :  // <0454> pop j // end_func
addr == 16'h3bb ? 16'h0808 :  // <0454> pop i // "
addr == 16'h3bc ? 16'hfc00 :  // <0454> swapra = nop

// ######## event ign_capture_timeout_handler // = 0x03bd
// it's been too long since the last ignition pulse detect.
addr == 16'h3bd ? 16'hfba0 :  // <0458> call :clear_ign_history
addr == 16'h3be ? 16'h03a4 :  // <0458> "
addr == 16'h3bf ? 16'hfc00 :  // <0458> "
addr == 16'h3c0 ? 16'he00f :  // <0459> end_event
addr == 16'h3c1 ? 16'h007e :  // <0459> "

// ######## event ustimer0_handler // = 0x03c2
addr == 16'h3c2 ? 16'he00f :  // <0462> end_event
addr == 16'h3c3 ? 16'h007e :  // <0462> "

// ######## event spi_done_handler // = 0x03c4
// discard-counter in RAM.
addr == 16'h3c4 ? 16'h4e00 :  // <0466> ram a = $ram_daq_discard_cnt // av_ad_hi = 0
addr == 16'h3c5 ? 16'h5206 :  // <0466> ram a = $ram_daq_discard_cnt // av_ad_lo = 6
addr == 16'h3c6 ? 16'h0011 :  // <0466> ram a = $ram_daq_discard_cnt // a = av_write_data // start read cycle
addr == 16'h3c7 ? 16'h0012 :  // <0466> ram a = $ram_daq_discard_cnt // a = av_read_data // finish read cycle
addr == 16'h3c8 ? 16'he000 :  // <0467> br az :report
addr == 16'h3c9 ? 16'h03d6 :  // <0467> "
addr == 16'h3ca ? 16'h0760 :  // <0468> b = -1
addr == 16'h3cb ? 16'hc800 :  // <0469> a = a+b
addr == 16'h3cc ? 16'h0300 :  // <0469> "
addr == 16'h3cd ? 16'h4e00 :  // <0470> ram $ram_daq_discard_cnt = a // av_ad_hi = 0
addr == 16'h3ce ? 16'h5206 :  // <0470> ram $ram_daq_discard_cnt = a // av_ad_lo = 6
addr == 16'h3cf ? 16'h4400 :  // <0470> ram $ram_daq_discard_cnt = a // av_write_data = a
addr == 16'h3d0 ? 16'h0207 :  // <0471> a = $anmux_adc_channel
addr == 16'h3d1 ? 16'hfba0 :  // <0472> call :begin_adc_conversion
addr == 16'h3d2 ? 16'h04d9 :  // <0472> "
addr == 16'h3d3 ? 16'hfc00 :  // <0472> "
addr == 16'h3d4 ? 16'he00f :  // <0473> event_return
addr == 16'h3d5 ? 16'h007e :  // <0473> "

// report ADC reading.
// :report // = 0x03d6
addr == 16'h3d6 ? 16'h0010 :  // <0477> a = spi_data
addr == 16'h3d7 ? 16'hfba0 :  // <0478> call :put4x
addr == 16'h3d8 ? 16'h00b3 :  // <0478> "
addr == 16'h3d9 ? 16'hfc00 :  // <0478> "

// memorize ADC reading.
addr == 16'h3da ? 16'hfba0 :  // <0481> call :anmux_get_chn
addr == 16'h3db ? 16'h00a6 :  // <0481> "
addr == 16'h3dc ? 16'hfc00 :  // <0481> "
addr == 16'h3dd ? 16'h0410 :  // <0482> b = spi_data

addr == 16'h3de ? 16'h0351 :  // <0483> a = a<<1
addr == 16'h3df ? 16'h2001 :  // <0483> push b // push b
addr == 16'h3e0 ? 16'h0608 :  // <0483> b = 8
addr == 16'h3e1 ? 16'h4e00 :  // <0483> av_ad_hi = 0
addr == 16'h3e2 ? 16'h5300 :  // <0483> av_ad_lo = ad0
addr == 16'h3e3 ? 16'h4408 :  // <0483> pop av_write_data // pop av_write_data


// decrement anmux channel & start waiting again.
addr == 16'h3e4 ? 16'hfba0 :  // <0486> call :anmux_get_chn
addr == 16'h3e5 ? 16'h00a6 :  // <0486> "
addr == 16'h3e6 ? 16'hfc00 :  // <0486> "
addr == 16'h3e7 ? 16'he000 :  // <0487> br az :all_done
addr == 16'h3e8 ? 16'h03f2 :  // <0487> "
addr == 16'h3e9 ? 16'h0760 :  // <0488> b = -1
addr == 16'h3ea ? 16'hc800 :  // <0489> a = a+b
addr == 16'h3eb ? 16'h0300 :  // <0489> "
addr == 16'h3ec ? 16'hfba0 :  // <0490> call :anmux_set_chn
addr == 16'h3ed ? 16'h00a2 :  // <0490> "
addr == 16'h3ee ? 16'hfc00 :  // <0490> "
addr == 16'h3ef ? 16'h3a05 :  // <0491> mstimer1 = $anmux_settle_ms
addr == 16'h3f0 ? 16'he00f :  // <0492> event_return
addr == 16'h3f1 ? 16'h007e :  // <0492> "

// end of daq pass.
// :all_done // = 0x03f2
addr == 16'h3f2 ? 16'hfba0 :  // <0496> call :report_plan
addr == 16'h3f3 ? 16'h05f7 :  // <0496> "
addr == 16'h3f4 ? 16'hfc00 :  // <0496> "
addr == 16'h3f5 ? 16'hfba0 :  // <0497> call :report_text_flags
addr == 16'h3f6 ? 16'h05c9 :  // <0497> "
addr == 16'h3f7 ? 16'hfc00 :  // <0497> "
addr == 16'h3f8 ? 16'h020d :  // <0498> a = 13 // puteol
addr == 16'h3f9 ? 16'hfba0 :  // <0498> puteol
addr == 16'h3fa ? 16'h008b :  // <0498> "
addr == 16'h3fb ? 16'hfc00 :  // <0498> "
addr == 16'h3fc ? 16'h020a :  // <0498> a = 10 // puteol
addr == 16'h3fd ? 16'hfba0 :  // <0498> puteol
addr == 16'h3fe ? 16'h008b :  // <0498> "
addr == 16'h3ff ? 16'hfc00 :  // <0498> "
addr == 16'h400 ? 16'h4e00 :  // <0499> ram $ram_dial_setting = spi_data // av_ad_hi = 0
addr == 16'h401 ? 16'h5222 :  // <0499> ram $ram_dial_setting = spi_data // av_ad_lo = 34
addr == 16'h402 ? 16'h4410 :  // <0499> ram $ram_dial_setting = spi_data // av_write_data = spi_data
addr == 16'h403 ? 16'he00f :  // <0500> end_event
addr == 16'h404 ? 16'h007e :  // <0500> "

// ######## event mstimer0_handler // = 0x0405
// unified 1-second periodic timer for all low-resolution tasks.

// start timer again.
addr == 16'h405 ? 16'h37a0 :  // <0506> mstimer0 = 1000
addr == 16'h406 ? 16'h03e8 :  // <0506> "

// realtime counters in RAM.
addr == 16'h407 ? 16'h4e00 :  // <0509> ram a = $ram_seconds_cnt // av_ad_hi = 0
addr == 16'h408 ? 16'h521e :  // <0509> ram a = $ram_seconds_cnt // av_ad_lo = 30
addr == 16'h409 ? 16'h0011 :  // <0509> ram a = $ram_seconds_cnt // a = av_write_data // start read cycle
addr == 16'h40a ? 16'h0012 :  // <0509> ram a = $ram_seconds_cnt // a = av_read_data // finish read cycle
addr == 16'h40b ? 16'h0601 :  // <0510> b = 1
addr == 16'h40c ? 16'hc800 :  // <0511> a = a+b
addr == 16'h40d ? 16'h0300 :  // <0511> "
addr == 16'h40e ? 16'h063c :  // <0512> b = 60
addr == 16'h40f ? 16'he407 :  // <0513> bn eq :same_minute
addr == 16'h410 ? 16'h0422 :  // <0513> "
addr == 16'h411 ? 16'h4e00 :  // <0514> ram $ram_seconds_cnt = 0 // av_ad_hi = 0
addr == 16'h412 ? 16'h521e :  // <0514> ram $ram_seconds_cnt = 0 // av_ad_lo = 30
addr == 16'h413 ? 16'h4600 :  // <0514> ram $ram_seconds_cnt = 0 // av_write_data = 0
addr == 16'h414 ? 16'h4e00 :  // <0515> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h415 ? 16'h521c :  // <0515> ram a = $ram_minutes_cnt // av_ad_lo = 28
addr == 16'h416 ? 16'h0011 :  // <0515> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h417 ? 16'h0012 :  // <0515> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h418 ? 16'h0601 :  // <0516> b = 1
addr == 16'h419 ? 16'h4e00 :  // <0517> ram $ram_minutes_cnt = a+b // av_ad_hi = 0
addr == 16'h41a ? 16'h521c :  // <0517> ram $ram_minutes_cnt = a+b // av_ad_lo = 28
addr == 16'h41b ? 16'hc800 :  // <0517> ram $ram_minutes_cnt = a+b // av_write_data = a+b
addr == 16'h41c ? 16'h4700 :  // <0517> "
addr == 16'h41d ? 16'hfba0 :  // <0518> call :minute_events
addr == 16'h41e ? 16'h0525 :  // <0518> "
addr == 16'h41f ? 16'hfc00 :  // <0518> "
addr == 16'h420 ? 16'he00f :  // <0519> jmp :minutes_done
addr == 16'h421 ? 16'h0425 :  // <0519> "
// :same_minute // = 0x0422
addr == 16'h422 ? 16'h4e00 :  // <0521> ram $ram_seconds_cnt = a // av_ad_hi = 0
addr == 16'h423 ? 16'h521e :  // <0521> ram $ram_seconds_cnt = a // av_ad_lo = 30
addr == 16'h424 ? 16'h4400 :  // <0521> ram $ram_seconds_cnt = a // av_write_data = a
// :minutes_done // = 0x0425

addr == 16'h425 ? 16'hfba0 :  // <0524> call :check_power_relay
addr == 16'h426 ? 16'h052d :  // <0524> "
addr == 16'h427 ? 16'hfc00 :  // <0524> "
addr == 16'h428 ? 16'hfba0 :  // <0525> call :check_communication
addr == 16'h429 ? 16'h055c :  // <0525> "
addr == 16'h42a ? 16'hfc00 :  // <0525> "
addr == 16'h42b ? 16'hfba0 :  // <0526> call :start_daq_pass
addr == 16'h42c ? 16'h049a :  // <0526> "
addr == 16'h42d ? 16'hfc00 :  // <0526> "
addr == 16'h42e ? 16'he00f :  // <0527> end_event
addr == 16'h42f ? 16'h007e :  // <0527> "

// ######## event mstimer1_handler // = 0x0430
// start a reading from the current anmux channel.
addr == 16'h430 ? 16'h4e00 :  // <0531> ram $ram_daq_discard_cnt = $anmux_num_discards // av_ad_hi = 0
addr == 16'h431 ? 16'h5206 :  // <0531> ram $ram_daq_discard_cnt = $anmux_num_discards // av_ad_lo = 6
addr == 16'h432 ? 16'h4602 :  // <0531> ram $ram_daq_discard_cnt = $anmux_num_discards // av_write_data = 2
addr == 16'h433 ? 16'h0220 :  // <0532> a = 32 // putasc " "
addr == 16'h434 ? 16'hfba0 :  // <0532> putasc " "
addr == 16'h435 ? 16'h008b :  // <0532> "
addr == 16'h436 ? 16'hfc00 :  // <0532> "
addr == 16'h437 ? 16'h0273 :  // <0533> a = 115 // putasc "s"
addr == 16'h438 ? 16'hfba0 :  // <0533> putasc "s"
addr == 16'h439 ? 16'h008b :  // <0533> "
addr == 16'h43a ? 16'hfc00 :  // <0533> "
addr == 16'h43b ? 16'hfba0 :  // <0534> call :anmux_get_chn
addr == 16'h43c ? 16'h00a6 :  // <0534> "
addr == 16'h43d ? 16'hfc00 :  // <0534> "
addr == 16'h43e ? 16'h0630 :  // <0535> b = 48 // asc b = "0"
addr == 16'h43f ? 16'hc800 :  // <0536> a = a+b // putchar a+b
addr == 16'h440 ? 16'h0300 :  // <0536> "
addr == 16'h441 ? 16'hfba0 :  // <0536> putchar a+b
addr == 16'h442 ? 16'h008b :  // <0536> "
addr == 16'h443 ? 16'hfc00 :  // <0536> "
addr == 16'h444 ? 16'h023d :  // <0537> a = 61 // putasc "="
addr == 16'h445 ? 16'hfba0 :  // <0537> putasc "="
addr == 16'h446 ? 16'h008b :  // <0537> "
addr == 16'h447 ? 16'hfc00 :  // <0537> "
addr == 16'h448 ? 16'h0207 :  // <0538> a = $anmux_adc_channel
addr == 16'h449 ? 16'hfba0 :  // <0539> call :begin_adc_conversion
addr == 16'h44a ? 16'h04d9 :  // <0539> "
addr == 16'h44b ? 16'hfc00 :  // <0539> "
addr == 16'h44c ? 16'he00f :  // <0540> end_event
addr == 16'h44d ? 16'h007e :  // <0540> "

// ######## event mstimer2_handler // = 0x044e
// restart timer
addr == 16'h44e ? 16'h3e14 :  // <0544> mstimer2 = $plan_tick_ms

// poll the engine management plan.
// call the transition function for the current plan.
// this might perform a transition to some other plan, so it's done first.
addr == 16'h44f ? 16'h4e00 :  // <0549> ram rtna = $ram_transition_func // av_ad_hi = 0
addr == 16'h450 ? 16'h526a :  // <0549> ram rtna = $ram_transition_func // av_ad_lo = 106
addr == 16'h451 ? 16'hf811 :  // <0549> ram rtna = $ram_transition_func // rtna = av_write_data // start read cycle
addr == 16'h452 ? 16'hf812 :  // <0549> ram rtna = $ram_transition_func // rtna = av_read_data // finish read cycle
addr == 16'h453 ? 16'hfc00 :  // <0550> swapra = nop
// call the puff length function for the current plan.
// this is done last, so if a plan transition just happened, its new puff length will init here.
addr == 16'h454 ? 16'h4e00 :  // <0553> ram rtna = $ram_puff_len_func // av_ad_hi = 0
addr == 16'h455 ? 16'h5268 :  // <0553> ram rtna = $ram_puff_len_func // av_ad_lo = 104
addr == 16'h456 ? 16'hf811 :  // <0553> ram rtna = $ram_puff_len_func // rtna = av_write_data // start read cycle
addr == 16'h457 ? 16'hf812 :  // <0553> ram rtna = $ram_puff_len_func // rtna = av_read_data // finish read cycle
addr == 16'h458 ? 16'hfc00 :  // <0554> swapra = nop
addr == 16'h459 ? 16'he00f :  // <0555> end_event
addr == 16'h45a ? 16'h007e :  // <0555> "

// ######## event uart_rx_handler // = 0x045b
// :again // = 0x045b
addr == 16'h45b ? 16'hfba0 :  // <0559> pollchar
addr == 16'h45c ? 16'h009a :  // <0559> "
addr == 16'h45d ? 16'hfc00 :  // <0559> "
addr == 16'h45e ? 16'h0760 :  // <0560> b = -1
addr == 16'h45f ? 16'he007 :  // <0561> br eq :done
addr == 16'h460 ? 16'h03a2 :  // <0561> "
addr == 16'h461 ? 16'h060a :  // <0562> b = 10
addr == 16'h462 ? 16'he407 :  // <0563> bn eq :skip_lf
addr == 16'h463 ? 16'h0467 :  // <0563> "
addr == 16'h464 ? 16'hfba0 :  // <0564> call :postpone_comm_restart
addr == 16'h465 ? 16'h0587 :  // <0564> "
addr == 16'h466 ? 16'hfc00 :  // <0564> "
// :skip_lf // = 0x0467
addr == 16'h467 ? 16'he00f :  // <0566> jmp :again
addr == 16'h468 ? 16'h045b :  // <0566> "
// :done // = 0x0469
addr == 16'h469 ? 16'he00f :  // <0568> end_event
addr == 16'h46a ? 16'h007e :  // <0568> "

// ######## event uart_rx_overflow_handler // = 0x046b
addr == 16'h46b ? 16'h5fa0 :  // <0571> error_halt_code $err_rx_overflow // leds = 0xfffe
addr == 16'h46c ? 16'hfffe :  // <0571> "
addr == 16'h46d ? 16'he00f :  // <0571> error_halt_code $err_rx_overflow
addr == 16'h46e ? 16'h046d :  // <0571> "
addr == 16'h46f ? 16'he00f :  // <0572> end_event
addr == 16'h470 ? 16'h007e :  // <0572> "

// ######## event uart_tx_overflow_handler // = 0x0471
addr == 16'h471 ? 16'h5fa0 :  // <0575> error_halt_code $err_tx_overflow // leds = 0xfffd
addr == 16'h472 ? 16'hfffd :  // <0575> "
addr == 16'h473 ? 16'he00f :  // <0575> error_halt_code $err_tx_overflow
addr == 16'h474 ? 16'h0473 :  // <0575> "
addr == 16'h475 ? 16'he00f :  // <0576> end_event
addr == 16'h476 ? 16'h007e :  // <0576> "

// ######## event key0_handler // = 0x0477
addr == 16'h477 ? 16'h026b :  // <0579> a = 107 // putasc "k"
addr == 16'h478 ? 16'hfba0 :  // <0579> putasc "k"
addr == 16'h479 ? 16'h008b :  // <0579> "
addr == 16'h47a ? 16'hfc00 :  // <0579> "
addr == 16'h47b ? 16'h0230 :  // <0580> a = 48 // putasc "0"
addr == 16'h47c ? 16'hfba0 :  // <0580> putasc "0"
addr == 16'h47d ? 16'h008b :  // <0580> "
addr == 16'h47e ? 16'hfc00 :  // <0580> "
addr == 16'h47f ? 16'he00f :  // <0581> end_event
addr == 16'h480 ? 16'h007e :  // <0581> "

// ######## event key1_handler // = 0x0481
addr == 16'h481 ? 16'h026b :  // <0584> a = 107 // putasc "k"
addr == 16'h482 ? 16'hfba0 :  // <0584> putasc "k"
addr == 16'h483 ? 16'h008b :  // <0584> "
addr == 16'h484 ? 16'hfc00 :  // <0584> "
addr == 16'h485 ? 16'h0231 :  // <0585> a = 49 // putasc "1"
addr == 16'h486 ? 16'hfba0 :  // <0585> putasc "1"
addr == 16'h487 ? 16'h008b :  // <0585> "
addr == 16'h488 ? 16'hfc00 :  // <0585> "
addr == 16'h489 ? 16'he00f :  // <0586> end_event
addr == 16'h48a ? 16'h007e :  // <0586> "

// ######## event softevent3_handler // = 0x048b
addr == 16'h48b ? 16'he00f :  // <0589> end_event
addr == 16'h48c ? 16'h007e :  // <0589> "

// ######## event softevent2_handler // = 0x048d
addr == 16'h48d ? 16'he00f :  // <0592> end_event
addr == 16'h48e ? 16'h007e :  // <0592> "

// ######## event softevent1_handler // = 0x048f
addr == 16'h48f ? 16'he00f :  // <0595> end_event
addr == 16'h490 ? 16'h007e :  // <0595> "

// ######## event softevent0_handler // = 0x0491
addr == 16'h491 ? 16'he00f :  // <0598> end_event
addr == 16'h492 ? 16'h007e :  // <0598> "

// :rpm_msg // = 0x0493
// ": rpm=\x0"
addr == 16'h493 ? 16'h203a :  // <0601>  :
addr == 16'h494 ? 16'h7072 :  // <0601> pr
addr == 16'h495 ? 16'h3d6d :  // <0601> =m
addr == 16'h496 ? 16'h0000 :  // <0601>   

// :puff_len_msg // = 0x0497
// " pfl=\x0"
addr == 16'h497 ? 16'h7020 :  // <0604> p 
addr == 16'h498 ? 16'h6c66 :  // <0604> lf
addr == 16'h499 ? 16'h003d :  // <0604>  =

// ######## func start_daq_pass // = 0x049a
addr == 16'h49a ? 16'h2004 :  // <0606> push x // func start_daq_pass
addr == 16'h49b ? 16'h203e :  // <0606> push rtna // "
// daq pass counter in RAM.
addr == 16'h49c ? 16'h4e00 :  // <0608> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h49d ? 16'h5204 :  // <0608> ram a = $ram_daq_pass_cnt // av_ad_lo = 4
addr == 16'h49e ? 16'h0011 :  // <0608> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h49f ? 16'h0012 :  // <0608> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h4a0 ? 16'h0601 :  // <0609> b = 1
addr == 16'h4a1 ? 16'hc800 :  // <0610> a = a+b
addr == 16'h4a2 ? 16'h0300 :  // <0610> "
addr == 16'h4a3 ? 16'h5c00 :  // <0611> leds = a
addr == 16'h4a4 ? 16'h4e00 :  // <0612> ram $ram_daq_pass_cnt = a // av_ad_hi = 0
addr == 16'h4a5 ? 16'h5204 :  // <0612> ram $ram_daq_pass_cnt = a // av_ad_lo = 4
addr == 16'h4a6 ? 16'h4400 :  // <0612> ram $ram_daq_pass_cnt = a // av_write_data = a
addr == 16'h4a7 ? 16'hfba0 :  // <0613> call :put4x
addr == 16'h4a8 ? 16'h00b3 :  // <0613> "
addr == 16'h4a9 ? 16'hfc00 :  // <0613> "

addr == 16'h4aa ? 16'h03a0 :  // <0615> a = :rpm_msg
addr == 16'h4ab ? 16'h0493 :  // <0615> "
addr == 16'h4ac ? 16'hfba0 :  // <0616> call :print_nt
addr == 16'h4ad ? 16'h013f :  // <0616> "
addr == 16'h4ae ? 16'hfc00 :  // <0616> "
addr == 16'h4af ? 16'h0200 :  // <0617> a = 0
addr == 16'h4b0 ? 16'h4e00 :  // <0618> ram x = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h4b1 ? 16'h525c :  // <0618> ram x = $ram_rpm_valid // av_ad_lo = 92
addr == 16'h4b2 ? 16'h1011 :  // <0618> ram x = $ram_rpm_valid // x = av_write_data // start read cycle
addr == 16'h4b3 ? 16'h1012 :  // <0618> ram x = $ram_rpm_valid // x = av_read_data // finish read cycle
addr == 16'h4b4 ? 16'he002 :  // <0619> br xz :skip_rpm
addr == 16'h4b5 ? 16'h04ba :  // <0619> "
addr == 16'h4b6 ? 16'h4e00 :  // <0620> ram a = $ram_avg_rpm // av_ad_hi = 0
addr == 16'h4b7 ? 16'h525a :  // <0620> ram a = $ram_avg_rpm // av_ad_lo = 90
addr == 16'h4b8 ? 16'h0011 :  // <0620> ram a = $ram_avg_rpm // a = av_write_data // start read cycle
addr == 16'h4b9 ? 16'h0012 :  // <0620> ram a = $ram_avg_rpm // a = av_read_data // finish read cycle
// :skip_rpm // = 0x04ba
addr == 16'h4ba ? 16'hfba0 :  // <0622> call :put4x
addr == 16'h4bb ? 16'h00b3 :  // <0622> "
addr == 16'h4bc ? 16'hfc00 :  // <0622> "

addr == 16'h4bd ? 16'h03a0 :  // <0624> a = :puff_len_msg
addr == 16'h4be ? 16'h0497 :  // <0624> "
addr == 16'h4bf ? 16'hfba0 :  // <0625> call :print_nt
addr == 16'h4c0 ? 16'h013f :  // <0625> "
addr == 16'h4c1 ? 16'hfc00 :  // <0625> "
addr == 16'h4c2 ? 16'h001d :  // <0626> a = puff_len_us
addr == 16'h4c3 ? 16'hfba0 :  // <0627> call :put4x
addr == 16'h4c4 ? 16'h00b3 :  // <0627> "
addr == 16'h4c5 ? 16'hfc00 :  // <0627> "
addr == 16'h4c6 ? 16'h022c :  // <0628> a = 44 // putasc ","
addr == 16'h4c7 ? 16'hfba0 :  // <0628> putasc ","
addr == 16'h4c8 ? 16'h008b :  // <0628> "
addr == 16'h4c9 ? 16'hfc00 :  // <0628> "
addr == 16'h4ca ? 16'h4e00 :  // <0629> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h4cb ? 16'h5270 :  // <0629> ram a = $ram_puff_count // av_ad_lo = 112
addr == 16'h4cc ? 16'h0011 :  // <0629> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h4cd ? 16'h0012 :  // <0629> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h4ce ? 16'hfba0 :  // <0630> call :put4x
addr == 16'h4cf ? 16'h00b3 :  // <0630> "
addr == 16'h4d0 ? 16'hfc00 :  // <0630> "

// start to acquire & report all anmux channels.
addr == 16'h4d1 ? 16'h0207 :  // <0633> a = ($anmux_num_channels - 1)
addr == 16'h4d2 ? 16'hfba0 :  // <0634> call :anmux_set_chn
addr == 16'h4d3 ? 16'h00a2 :  // <0634> "
addr == 16'h4d4 ? 16'hfc00 :  // <0634> "
addr == 16'h4d5 ? 16'h3a05 :  // <0635> mstimer1 = $anmux_settle_ms

// // observe MCU utilization.
// a = usage_count
// call :put4x
// usage_count = 0
addr == 16'h4d6 ? 16'hf808 :  // <0641> pop rtna // end_func
addr == 16'h4d7 ? 16'h1008 :  // <0641> pop x // "
addr == 16'h4d8 ? 16'hfc00 :  // <0641> swapra = nop

// ######## func begin_adc_conversion // = 0x04d9
// begin SPI transaction, specifying Nano ADC channel to take effect NEXT
// conversion after this one.  pass that in a.

addr == 16'h4d9 ? 16'h0352 :  // <0647> a = a<<4
addr == 16'h4da ? 16'h0352 :  // <0648> a = a<<4
addr == 16'h4db ? 16'h0351 :  // <0649> a = a<<1
addr == 16'h4dc ? 16'h0351 :  // <0650> a = a<<1
addr == 16'h4dd ? 16'h0351 :  // <0651> a = a<<1
addr == 16'h4de ? 16'h4000 :  // <0652> spi_data = a
addr == 16'h4df ? 16'hfc00 :  // <0653> swapra = nop

// ######## event power_lost_handler // = 0x04e0
// at this time we have less than 2 ms of usable run time left.

// this must be an uncommanded loss of main power, because if it was commanded,
// no more events would be handled; this event handler wouldn't have a chance to run.
// immediately set the power relay PWM to full power for a few seconds,
// in case the power relay opened accidentally e.g. due to a hard pothole.
addr == 16'h4e0 ? 16'h6a00 :  // <0662> power_duty = $power_duty_closing
addr == 16'h4e1 ? 16'h4e00 :  // <0663> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h4e2 ? 16'h5204 :  // <0663> ram a = $ram_daq_pass_cnt // av_ad_lo = 4
addr == 16'h4e3 ? 16'h0011 :  // <0663> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h4e4 ? 16'h0012 :  // <0663> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h4e5 ? 16'h0602 :  // <0664> b = $relay_hold_passes
addr == 16'h4e6 ? 16'h4e00 :  // <0665> ram $ram_relay_hold_at_pass = a+b // av_ad_hi = 0
addr == 16'h4e7 ? 16'h521a :  // <0665> ram $ram_relay_hold_at_pass = a+b // av_ad_lo = 26
addr == 16'h4e8 ? 16'hc800 :  // <0665> ram $ram_relay_hold_at_pass = a+b // av_write_data = a+b
addr == 16'h4e9 ? 16'h4700 :  // <0665> "

// pause any non-vital power-hogging operations, to conserve power for the EEPROM write.

// save persistent data in case the power remains down e.g. due to battery disconnect.
addr == 16'h4ea ? 16'hfba0 :  // <0670> call :save_persistent_data
addr == 16'h4eb ? 16'h055b :  // <0670> "
addr == 16'h4ec ? 16'hfc00 :  // <0670> "
addr == 16'h4ed ? 16'he00f :  // <0671> end_event
addr == 16'h4ee ? 16'h007e :  // <0671> "

// :ign_off_msg // = 0x04ef
// "IGOF\x0"
addr == 16'h4ef ? 16'h4749 :  // <0674> GI
addr == 16'h4f0 ? 16'h464f :  // <0674> FO
addr == 16'h4f1 ? 16'h0000 :  // <0674>   

// ######## event ign_switch_off_handler // = 0x04f2
// set power-down deadline in RAM.  this makes the system remain powered for several more minutes, for cooldown data logging.
addr == 16'h4f2 ? 16'h4e00 :  // <0678> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h4f3 ? 16'h521c :  // <0678> ram a = $ram_minutes_cnt // av_ad_lo = 28
addr == 16'h4f4 ? 16'h0011 :  // <0678> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h4f5 ? 16'h0012 :  // <0678> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h4f6 ? 16'h060a :  // <0679> b = $power_extend_minutes
addr == 16'h4f7 ? 16'h4e00 :  // <0680> ram $ram_power_down_at_min = a+b // av_ad_hi = 0
addr == 16'h4f8 ? 16'h5218 :  // <0680> ram $ram_power_down_at_min = a+b // av_ad_lo = 24
addr == 16'h4f9 ? 16'hc800 :  // <0680> ram $ram_power_down_at_min = a+b // av_write_data = a+b
addr == 16'h4fa ? 16'h4700 :  // <0680> "
addr == 16'h4fb ? 16'h03a0 :  // <0681> a = :ign_off_msg
addr == 16'h4fc ? 16'h04ef :  // <0681> "
addr == 16'h4fd ? 16'hfba0 :  // <0682> call :set_text_flag
addr == 16'h4fe ? 16'h05b0 :  // <0682> "
addr == 16'h4ff ? 16'hfc00 :  // <0682> "
addr == 16'h500 ? 16'he00f :  // <0683> end_event
addr == 16'h501 ? 16'h007e :  // <0683> "

// :ign_on_msg // = 0x0502
// "IGON\x0"
addr == 16'h502 ? 16'h4749 :  // <0686> GI
addr == 16'h503 ? 16'h4e4f :  // <0686> NO
addr == 16'h504 ? 16'h0000 :  // <0686>   

// ######## event ign_switch_on_handler // = 0x0505
addr == 16'h505 ? 16'h4e00 :  // <0689> ram $ram_power_down_at_min = $power_down_never // av_ad_hi = 0
addr == 16'h506 ? 16'h5218 :  // <0689> ram $ram_power_down_at_min = $power_down_never // av_ad_lo = 24
addr == 16'h507 ? 16'h4760 :  // <0689> ram $ram_power_down_at_min = $power_down_never // av_write_data = 0xffff
addr == 16'h508 ? 16'h03a0 :  // <0690> a = :ign_on_msg
addr == 16'h509 ? 16'h0502 :  // <0690> "
addr == 16'h50a ? 16'hfba0 :  // <0691> call :set_text_flag
addr == 16'h50b ? 16'h05b0 :  // <0691> "
addr == 16'h50c ? 16'hfc00 :  // <0691> "
addr == 16'h50d ? 16'he00f :  // <0692> end_event
addr == 16'h50e ? 16'h007e :  // <0692> "

// ######## event puff1_done_handler // = 0x050f
//patch: measure with scope.
addr == 16'h50f ? 16'h2ba0 :  // <0696> soft_event = (1 << 14)
addr == 16'h510 ? 16'h4000 :  // <0696> "

// puff just finished.  set length of next puff.
addr == 16'h511 ? 16'h4e00 :  // <0699> ram puff_len_us = $ram_next_puff_len_us // av_ad_hi = 0
addr == 16'h512 ? 16'h526e :  // <0699> ram puff_len_us = $ram_next_puff_len_us // av_ad_lo = 110
addr == 16'h513 ? 16'h7411 :  // <0699> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_write_data // start read cycle
addr == 16'h514 ? 16'h7412 :  // <0699> ram puff_len_us = $ram_next_puff_len_us // puff_len_us = av_read_data // finish read cycle

// count puffs.
addr == 16'h515 ? 16'h4e00 :  // <0702> ram a = $ram_puff_count // av_ad_hi = 0
addr == 16'h516 ? 16'h5270 :  // <0702> ram a = $ram_puff_count // av_ad_lo = 112
addr == 16'h517 ? 16'h0011 :  // <0702> ram a = $ram_puff_count // a = av_write_data // start read cycle
addr == 16'h518 ? 16'h0012 :  // <0702> ram a = $ram_puff_count // a = av_read_data // finish read cycle
addr == 16'h519 ? 16'h0601 :  // <0703> b = 1
addr == 16'h51a ? 16'h4e00 :  // <0704> ram $ram_puff_count = a+b // av_ad_hi = 0
addr == 16'h51b ? 16'h5270 :  // <0704> ram $ram_puff_count = a+b // av_ad_lo = 112
addr == 16'h51c ? 16'hc800 :  // <0704> ram $ram_puff_count = a+b // av_write_data = a+b
addr == 16'h51d ? 16'h4700 :  // <0704> "

// hack to set puff length strictly by a hard-wired knob.
// ram a = $ram_dial_setting
// a = a<<1
// a = a<<1
// a = a<<1
// bn az :nonzero
// a = 1
// :nonzero
// puff_len_us = a

addr == 16'h51e ? 16'h0201 :  // <0716> a = 1
addr == 16'h51f ? 16'hfba0 :  // <0717> call :spinwait
addr == 16'h520 ? 16'h01fc :  // <0717> "
addr == 16'h521 ? 16'hfc00 :  // <0717> "
addr == 16'h522 ? 16'h2a00 :  // <0718> soft_event = 0
addr == 16'h523 ? 16'he00f :  // <0719> end_event
addr == 16'h524 ? 16'h007e :  // <0719> "

// ######## func minute_events // = 0x0525
addr == 16'h525 ? 16'h203e :  // <0721> push rtna // func minute_events
addr == 16'h526 ? 16'hfba0 :  // <0722> call :check_power_down
addr == 16'h527 ? 16'h0540 :  // <0722> "
addr == 16'h528 ? 16'hfc00 :  // <0722> "
addr == 16'h529 ? 16'hf808 :  // <0723> pop rtna // end_func
addr == 16'h52a ? 16'hfc00 :  // <0723> swapra = nop

// :power_hold_msg // = 0x052b
// "PWH\x0"
addr == 16'h52b ? 16'h5750 :  // <0726> WP
addr == 16'h52c ? 16'h0048 :  // <0726>  H

// ######## func check_power_relay // = 0x052d
addr == 16'h52d ? 16'h203e :  // <0728> push rtna // func check_power_relay
addr == 16'h52e ? 16'h4e00 :  // <0729> ram a = $ram_daq_pass_cnt // av_ad_hi = 0
addr == 16'h52f ? 16'h5204 :  // <0729> ram a = $ram_daq_pass_cnt // av_ad_lo = 4
addr == 16'h530 ? 16'h0011 :  // <0729> ram a = $ram_daq_pass_cnt // a = av_write_data // start read cycle
addr == 16'h531 ? 16'h0012 :  // <0729> ram a = $ram_daq_pass_cnt // a = av_read_data // finish read cycle
addr == 16'h532 ? 16'h4e00 :  // <0730> ram b = $ram_relay_hold_at_pass // av_ad_hi = 0
addr == 16'h533 ? 16'h521a :  // <0730> ram b = $ram_relay_hold_at_pass // av_ad_lo = 26
addr == 16'h534 ? 16'h0411 :  // <0730> ram b = $ram_relay_hold_at_pass // b = av_write_data // start read cycle
addr == 16'h535 ? 16'h0412 :  // <0730> ram b = $ram_relay_hold_at_pass // b = av_read_data // finish read cycle
addr == 16'h536 ? 16'he407 :  // <0731> bn eq :done
addr == 16'h537 ? 16'h053e :  // <0731> "
// time to begin "solenoid saver" coil power reduction by PWM.
addr == 16'h538 ? 16'h6a19 :  // <0733> power_duty = $power_duty_holding
addr == 16'h539 ? 16'h03a0 :  // <0734> a = :power_hold_msg
addr == 16'h53a ? 16'h052b :  // <0734> "
addr == 16'h53b ? 16'hfba0 :  // <0735> call :set_text_flag
addr == 16'h53c ? 16'h05b0 :  // <0735> "
addr == 16'h53d ? 16'hfc00 :  // <0735> "
// :done // = 0x053e
addr == 16'h53e ? 16'hf808 :  // <0737> pop rtna // end_func
addr == 16'h53f ? 16'hfc00 :  // <0737> swapra = nop

// ######## func check_power_down // = 0x0540
addr == 16'h540 ? 16'h203e :  // <0739> push rtna // func check_power_down
// check power-down deadline in RAM.
addr == 16'h541 ? 16'h4e00 :  // <0741> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h542 ? 16'h521c :  // <0741> ram a = $ram_minutes_cnt // av_ad_lo = 28
addr == 16'h543 ? 16'h0011 :  // <0741> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h544 ? 16'h0012 :  // <0741> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h545 ? 16'h4e00 :  // <0742> ram b = $ram_power_down_at_min // av_ad_hi = 0
addr == 16'h546 ? 16'h5218 :  // <0742> ram b = $ram_power_down_at_min // av_ad_lo = 24
addr == 16'h547 ? 16'h0411 :  // <0742> ram b = $ram_power_down_at_min // b = av_write_data // start read cycle
addr == 16'h548 ? 16'h0412 :  // <0742> ram b = $ram_power_down_at_min // b = av_read_data // finish read cycle
addr == 16'h549 ? 16'he407 :  // <0743> bn eq :done
addr == 16'h54a ? 16'h054e :  // <0743> "
addr == 16'h54b ? 16'hfba0 :  // <0744> call :power_down
addr == 16'h54c ? 16'h0550 :  // <0744> "
addr == 16'h54d ? 16'hfc00 :  // <0744> "
// :done // = 0x054e
addr == 16'h54e ? 16'hf808 :  // <0746> pop rtna // end_func
addr == 16'h54f ? 16'hfc00 :  // <0746> swapra = nop

// ######## func power_down // = 0x0550
addr == 16'h550 ? 16'h203e :  // <0748> push rtna // func power_down
// this function never returns.
addr == 16'h551 ? 16'hfba0 :  // <0750> call :save_persistent_data
addr == 16'h552 ? 16'h055b :  // <0750> "
addr == 16'h553 ? 16'hfc00 :  // <0750> "
addr == 16'h554 ? 16'h6a32 :  // <0751> power_duty = $power_duty_opening
addr == 16'h555 ? 16'h5fa0 :  // <0752> error_halt_code $err_power_down // leds = 0xfffc
addr == 16'h556 ? 16'hfffc :  // <0752> "
addr == 16'h557 ? 16'he00f :  // <0752> error_halt_code $err_power_down
addr == 16'h558 ? 16'h0557 :  // <0752> "
addr == 16'h559 ? 16'hf808 :  // <0753> pop rtna // end_func
addr == 16'h55a ? 16'hfc00 :  // <0753> swapra = nop

// ######## func save_persistent_data // = 0x055b
addr == 16'h55b ? 16'hfc00 :  // <0756> swapra = nop

// ######## func check_communication // = 0x055c
addr == 16'h55c ? 16'h203e :  // <0758> push rtna // func check_communication
addr == 16'h55d ? 16'h4e00 :  // <0759> ram a = $ram_ftdi_downtime_remain_sec // av_ad_hi = 0
addr == 16'h55e ? 16'h5202 :  // <0759> ram a = $ram_ftdi_downtime_remain_sec // av_ad_lo = 2
addr == 16'h55f ? 16'h0011 :  // <0759> ram a = $ram_ftdi_downtime_remain_sec // a = av_write_data // start read cycle
addr == 16'h560 ? 16'h0012 :  // <0759> ram a = $ram_ftdi_downtime_remain_sec // a = av_read_data // finish read cycle
addr == 16'h561 ? 16'he000 :  // <0760> br az :skip_ftdi_powerup
addr == 16'h562 ? 16'h0572 :  // <0760> "
addr == 16'h563 ? 16'h0760 :  // <0761> b = -1
addr == 16'h564 ? 16'hc800 :  // <0762> a = a+b
addr == 16'h565 ? 16'h0300 :  // <0762> "
addr == 16'h566 ? 16'h4e00 :  // <0763> ram $ram_ftdi_downtime_remain_sec = a // av_ad_hi = 0
addr == 16'h567 ? 16'h5202 :  // <0763> ram $ram_ftdi_downtime_remain_sec = a // av_ad_lo = 2
addr == 16'h568 ? 16'h4400 :  // <0763> ram $ram_ftdi_downtime_remain_sec = a // av_write_data = a
addr == 16'h569 ? 16'he000 :  // <0764> br az :do_power_on
addr == 16'h56a ? 16'h056d :  // <0764> "
addr == 16'h56b ? 16'hf808 :  // <0765> pop rtna // rtn
addr == 16'h56c ? 16'hfc00 :  // <0765> swapra = nop
// :do_power_on // = 0x056d
addr == 16'h56d ? 16'hfba0 :  // <0767> call :ftdi_power_on
addr == 16'h56e ? 16'h05a4 :  // <0767> "
addr == 16'h56f ? 16'hfc00 :  // <0767> "
addr == 16'h570 ? 16'hf808 :  // <0768> pop rtna // rtn
addr == 16'h571 ? 16'hfc00 :  // <0768> swapra = nop
// :skip_ftdi_powerup // = 0x0572

addr == 16'h572 ? 16'h4e00 :  // <0771> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h573 ? 16'h521c :  // <0771> ram a = $ram_minutes_cnt // av_ad_lo = 28
addr == 16'h574 ? 16'h0011 :  // <0771> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h575 ? 16'h0012 :  // <0771> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h576 ? 16'h4e00 :  // <0772> ram b = $ram_comm_restart_at_min // av_ad_hi = 0
addr == 16'h577 ? 16'h5200 :  // <0772> ram b = $ram_comm_restart_at_min // av_ad_lo = 0
addr == 16'h578 ? 16'h0411 :  // <0772> ram b = $ram_comm_restart_at_min // b = av_write_data // start read cycle
addr == 16'h579 ? 16'h0412 :  // <0772> ram b = $ram_comm_restart_at_min // b = av_read_data // finish read cycle
addr == 16'h57a ? 16'he407 :  // <0773> bn eq :done
addr == 16'h57b ? 16'h0585 :  // <0773> "
// comm restart is required.
addr == 16'h57c ? 16'hfba0 :  // <0775> call :postpone_comm_restart
addr == 16'h57d ? 16'h0587 :  // <0775> "
addr == 16'h57e ? 16'hfc00 :  // <0775> "
addr == 16'h57f ? 16'h4e00 :  // <0776> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_hi = 0
addr == 16'h580 ? 16'h5202 :  // <0776> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_ad_lo = 2
addr == 16'h581 ? 16'h4605 :  // <0776> ram $ram_ftdi_downtime_remain_sec = $ftdi_down_period_sec // av_write_data = 5
addr == 16'h582 ? 16'hfba0 :  // <0777> call :ftdi_power_off
addr == 16'h583 ? 16'h0594 :  // <0777> "
addr == 16'h584 ? 16'hfc00 :  // <0777> "
// :done // = 0x0585
addr == 16'h585 ? 16'hf808 :  // <0779> pop rtna // end_func
addr == 16'h586 ? 16'hfc00 :  // <0779> swapra = nop

// ######## func postpone_comm_restart // = 0x0587
addr == 16'h587 ? 16'h4e00 :  // <0782> ram a = $ram_minutes_cnt // av_ad_hi = 0
addr == 16'h588 ? 16'h521c :  // <0782> ram a = $ram_minutes_cnt // av_ad_lo = 28
addr == 16'h589 ? 16'h0011 :  // <0782> ram a = $ram_minutes_cnt // a = av_write_data // start read cycle
addr == 16'h58a ? 16'h0012 :  // <0782> ram a = $ram_minutes_cnt // a = av_read_data // finish read cycle
addr == 16'h58b ? 16'h0602 :  // <0783> b = $comm_grace_period_min
addr == 16'h58c ? 16'h4e00 :  // <0784> ram $ram_comm_restart_at_min = a+b // av_ad_hi = 0
addr == 16'h58d ? 16'h5200 :  // <0784> ram $ram_comm_restart_at_min = a+b // av_ad_lo = 0
addr == 16'h58e ? 16'hc800 :  // <0784> ram $ram_comm_restart_at_min = a+b // av_write_data = a+b
addr == 16'h58f ? 16'h4700 :  // <0784> "
addr == 16'h590 ? 16'hfc00 :  // <0785> swapra = nop

// :ftdi_off_msg // = 0x0591
// "FTOF\x0"
addr == 16'h591 ? 16'h5446 :  // <0788> TF
addr == 16'h592 ? 16'h464f :  // <0788> FO
addr == 16'h593 ? 16'h0000 :  // <0788>   

// ######## func ftdi_power_off // = 0x0594
addr == 16'h594 ? 16'h203e :  // <0790> push rtna // func ftdi_power_off
addr == 16'h595 ? 16'h0018 :  // <0791> a = board_ctrl
addr == 16'h596 ? 16'h07a0 :  // <0792> b = $not_ftdi_power_mask
addr == 16'h597 ? 16'hff7f :  // <0792> "
addr == 16'h598 ? 16'hc800 :  // <0793> board_ctrl = and
addr == 16'h599 ? 16'h6330 :  // <0793> "
addr == 16'h59a ? 16'h03a0 :  // <0794> a = :ftdi_off_msg
addr == 16'h59b ? 16'h0591 :  // <0794> "
addr == 16'h59c ? 16'hfba0 :  // <0795> call :set_text_flag
addr == 16'h59d ? 16'h05b0 :  // <0795> "
addr == 16'h59e ? 16'hfc00 :  // <0795> "
addr == 16'h59f ? 16'hf808 :  // <0796> pop rtna // end_func
addr == 16'h5a0 ? 16'hfc00 :  // <0796> swapra = nop

// :ftdi_on_msg // = 0x05a1
// "FTON\x0"
addr == 16'h5a1 ? 16'h5446 :  // <0799> TF
addr == 16'h5a2 ? 16'h4e4f :  // <0799> NO
addr == 16'h5a3 ? 16'h0000 :  // <0799>   

// ######## func ftdi_power_on // = 0x05a4
addr == 16'h5a4 ? 16'h203e :  // <0801> push rtna // func ftdi_power_on
addr == 16'h5a5 ? 16'h0018 :  // <0802> a = board_ctrl
addr == 16'h5a6 ? 16'h0680 :  // <0803> b = $ftdi_power_mask
addr == 16'h5a7 ? 16'hc800 :  // <0804> board_ctrl = or
addr == 16'h5a8 ? 16'h6334 :  // <0804> "
addr == 16'h5a9 ? 16'h03a0 :  // <0805> a = :ftdi_on_msg
addr == 16'h5aa ? 16'h05a1 :  // <0805> "
addr == 16'h5ab ? 16'hfba0 :  // <0806> call :set_text_flag
addr == 16'h5ac ? 16'h05b0 :  // <0806> "
addr == 16'h5ad ? 16'hfc00 :  // <0806> "
addr == 16'h5ae ? 16'hf808 :  // <0807> pop rtna // end_func
addr == 16'h5af ? 16'hfc00 :  // <0807> swapra = nop

// ######## func set_text_flag // = 0x05b0
addr == 16'h5b0 ? 16'h0400 :  // <0810> b = a
addr == 16'h5b1 ? 16'h4e00 :  // <0811> ram a = $ram_next_tfp_idx // av_ad_hi = 0
addr == 16'h5b2 ? 16'h5234 :  // <0811> ram a = $ram_next_tfp_idx // av_ad_lo = 52
addr == 16'h5b3 ? 16'h0011 :  // <0811> ram a = $ram_next_tfp_idx // a = av_write_data // start read cycle
addr == 16'h5b4 ? 16'h0012 :  // <0811> ram a = $ram_next_tfp_idx // a = av_read_data // finish read cycle
addr == 16'h5b5 ? 16'h2000 :  // <0812> push a // push a

addr == 16'h5b6 ? 16'h0351 :  // <0813> a = a<<1
addr == 16'h5b7 ? 16'h2001 :  // <0813> push b // push b
addr == 16'h5b8 ? 16'h0624 :  // <0813> b = 36
addr == 16'h5b9 ? 16'h4e00 :  // <0813> av_ad_hi = 0
addr == 16'h5ba ? 16'h5300 :  // <0813> av_ad_lo = ad0
addr == 16'h5bb ? 16'h4408 :  // <0813> pop av_write_data // pop av_write_data

addr == 16'h5bc ? 16'h0008 :  // <0814> pop a // pop a
addr == 16'h5bd ? 16'h0760 :  // <0815> b = -1
addr == 16'h5be ? 16'hc800 :  // <0816> a = a+b
addr == 16'h5bf ? 16'h0300 :  // <0816> "
addr == 16'h5c0 ? 16'h0607 :  // <0817> b = $tfp_mask
addr == 16'h5c1 ? 16'h4e00 :  // <0818> ram $ram_next_tfp_idx = and // av_ad_hi = 0
addr == 16'h5c2 ? 16'h5234 :  // <0818> ram $ram_next_tfp_idx = and // av_ad_lo = 52
addr == 16'h5c3 ? 16'hc800 :  // <0818> ram $ram_next_tfp_idx = and // av_write_data = and
addr == 16'h5c4 ? 16'h4730 :  // <0818> "
addr == 16'h5c5 ? 16'hfc00 :  // <0819> swapra = nop

// :text_flags_msg // = 0x05c6
// " tf=\x0"
addr == 16'h5c6 ? 16'h7420 :  // <0822> t 
addr == 16'h5c7 ? 16'h3d66 :  // <0822> =f
addr == 16'h5c8 ? 16'h0000 :  // <0822>   

// ######## func report_text_flags // = 0x05c9
addr == 16'h5c9 ? 16'h2002 :  // <0824> push i // func report_text_flags
addr == 16'h5ca ? 16'h2003 :  // <0824> push j // "
addr == 16'h5cb ? 16'h203e :  // <0824> push rtna // "
addr == 16'h5cc ? 16'h03a0 :  // <0825> a = :text_flags_msg
addr == 16'h5cd ? 16'h05c6 :  // <0825> "
addr == 16'h5ce ? 16'hfba0 :  // <0826> call :print_nt
addr == 16'h5cf ? 16'h013f :  // <0826> "
addr == 16'h5d0 ? 16'hfc00 :  // <0826> "
addr == 16'h5d1 ? 16'h0a08 :  // <0827> i = $num_text_flag_pointers
addr == 16'h5d2 ? 16'h0f60 :  // <0828> j = -1
// :next_ptr // = 0x05d3
addr == 16'h5d3 ? 16'hc800 :  // <0830> i = i+j
addr == 16'h5d4 ? 16'h0b10 :  // <0830> "
addr == 16'h5d5 ? 16'h0002 :  // <0831> a = i

addr == 16'h5d6 ? 16'h0351 :  // <0832> a = a<<1
addr == 16'h5d7 ? 16'h0624 :  // <0832> b = 36
addr == 16'h5d8 ? 16'h4e00 :  // <0832> av_ad_hi = 0
addr == 16'h5d9 ? 16'h5300 :  // <0832> av_ad_lo = ad0
addr == 16'h5da ? 16'h0411 :  // <0832> b = av_write_data
addr == 16'h5db ? 16'h0412 :  // <0832> b = av_read_data

addr == 16'h5dc ? 16'h0001 :  // <0833> a = b
addr == 16'h5dd ? 16'he000 :  // <0834> br az :skip
addr == 16'h5de ? 16'h05ee :  // <0834> "
addr == 16'h5df ? 16'hfba0 :  // <0835> call :print_nt
addr == 16'h5e0 ? 16'h013f :  // <0835> "
addr == 16'h5e1 ? 16'hfc00 :  // <0835> "
addr == 16'h5e2 ? 16'h022c :  // <0836> a = 44 // putasc ","
addr == 16'h5e3 ? 16'hfba0 :  // <0836> putasc ","
addr == 16'h5e4 ? 16'h008b :  // <0836> "
addr == 16'h5e5 ? 16'hfc00 :  // <0836> "
addr == 16'h5e6 ? 16'h0002 :  // <0837> a = i
addr == 16'h5e7 ? 16'h0600 :  // <0838> b = 0

addr == 16'h5e8 ? 16'h0351 :  // <0839> a = a<<1
addr == 16'h5e9 ? 16'h2001 :  // <0839> push b // push b
addr == 16'h5ea ? 16'h0624 :  // <0839> b = 36
addr == 16'h5eb ? 16'h4e00 :  // <0839> av_ad_hi = 0
addr == 16'h5ec ? 16'h5300 :  // <0839> av_ad_lo = ad0
addr == 16'h5ed ? 16'h4408 :  // <0839> pop av_write_data // pop av_write_data

// :skip // = 0x05ee
addr == 16'h5ee ? 16'he401 :  // <0841> bn iz :next_ptr
addr == 16'h5ef ? 16'h05d3 :  // <0841> "
addr == 16'h5f0 ? 16'hf808 :  // <0842> pop rtna // end_func
addr == 16'h5f1 ? 16'h0c08 :  // <0842> pop j // "
addr == 16'h5f2 ? 16'h0808 :  // <0842> pop i // "
addr == 16'h5f3 ? 16'hfc00 :  // <0842> swapra = nop

// :plan_msg // = 0x05f4
// " pl=\x0"
addr == 16'h5f4 ? 16'h7020 :  // <0845> p 
addr == 16'h5f5 ? 16'h3d6c :  // <0845> =l
addr == 16'h5f6 ? 16'h0000 :  // <0845>   

// ######## func report_plan // = 0x05f7
addr == 16'h5f7 ? 16'h203e :  // <0847> push rtna // func report_plan
addr == 16'h5f8 ? 16'h03a0 :  // <0848> a = :plan_msg
addr == 16'h5f9 ? 16'h05f4 :  // <0848> "
addr == 16'h5fa ? 16'hfba0 :  // <0849> call :print_nt
addr == 16'h5fb ? 16'h013f :  // <0849> "
addr == 16'h5fc ? 16'hfc00 :  // <0849> "
addr == 16'h5fd ? 16'h4e00 :  // <0850> ram a = $ram_plan_name // av_ad_hi = 0
addr == 16'h5fe ? 16'h5266 :  // <0850> ram a = $ram_plan_name // av_ad_lo = 102
addr == 16'h5ff ? 16'h0011 :  // <0850> ram a = $ram_plan_name // a = av_write_data // start read cycle
addr == 16'h600 ? 16'h0012 :  // <0850> ram a = $ram_plan_name // a = av_read_data // finish read cycle
addr == 16'h601 ? 16'hfba0 :  // <0851> call :print_nt
addr == 16'h602 ? 16'h013f :  // <0851> "
addr == 16'h603 ? 16'hfc00 :  // <0851> "
addr == 16'h604 ? 16'hf808 :  // <0852> pop rtna // end_func
addr == 16'h605 ? 16'hfc00 :  // <0852> swapra = nop

// ######## func jf_to_rpm // = 0x0606
addr == 16'h606 ? 16'h203e :  // <0854> push rtna // func jf_to_rpm
// pass jiffies in a.  return rpm in a.
// resolution = 32 rpm.
addr == 16'h607 ? 16'h0400 :  // <0857> b = a
addr == 16'h608 ? 16'h03a0 :  // <0858> a = 0x5573
addr == 16'h609 ? 16'h5573 :  // <0858> "
// = 700000 >> 5
addr == 16'h60a ? 16'hfba0 :  // <0860> call :divide
addr == 16'h60b ? 16'h017c :  // <0860> "
addr == 16'h60c ? 16'hfc00 :  // <0860> "
addr == 16'h60d ? 16'h0001 :  // <0861> a = b
addr == 16'h60e ? 16'h0352 :  // <0862> a = a<<4
addr == 16'h60f ? 16'h0351 :  // <0863> a = a<<1
addr == 16'h610 ? 16'hf808 :  // <0864> pop rtna // end_func
addr == 16'h611 ? 16'hfc00 :  // <0864> swapra = nop

// ######## func check_engine_stop // = 0x0612
addr == 16'h612 ? 16'h203e :  // <0866> push rtna // func check_engine_stop
// returns a=1 if transitioned to stop, else a=0.

// transition to plan_stop if ignition switch is turned off AND rpm estimate is invalid.
// requiring both conditions prevents spurious noise readings from shutting down the injection.
addr == 16'h613 ? 16'h001a :  // <0871> a = power_duty
addr == 16'h614 ? 16'h0680 :  // <0872> b = $ign_switch_off_mask
addr == 16'h615 ? 16'he003 :  // <0873> br and0z :stay
addr == 16'h616 ? 16'h0628 :  // <0873> "
addr == 16'h617 ? 16'h4e00 :  // <0874> ram a = $ram_rpm_valid // av_ad_hi = 0
addr == 16'h618 ? 16'h525c :  // <0874> ram a = $ram_rpm_valid // av_ad_lo = 92
addr == 16'h619 ? 16'h0011 :  // <0874> ram a = $ram_rpm_valid // a = av_write_data // start read cycle
addr == 16'h61a ? 16'h0012 :  // <0874> ram a = $ram_rpm_valid // a = av_read_data // finish read cycle
addr == 16'h61b ? 16'he400 :  // <0875> bn az :stay
addr == 16'h61c ? 16'h0628 :  // <0875> "
addr == 16'h61d ? 16'h4e00 :  // <0876> ram rtna = $ram_destroy_plan_func // av_ad_hi = 0
addr == 16'h61e ? 16'h526c :  // <0876> ram rtna = $ram_destroy_plan_func // av_ad_lo = 108
addr == 16'h61f ? 16'hf811 :  // <0876> ram rtna = $ram_destroy_plan_func // rtna = av_write_data // start read cycle
addr == 16'h620 ? 16'hf812 :  // <0876> ram rtna = $ram_destroy_plan_func // rtna = av_read_data // finish read cycle
addr == 16'h621 ? 16'hfc00 :  // <0877> swapra = nop
addr == 16'h622 ? 16'hfba0 :  // <0878> call :init_plan_stop
addr == 16'h623 ? 16'h020f :  // <0878> "
addr == 16'h624 ? 16'hfc00 :  // <0878> "
addr == 16'h625 ? 16'h0201 :  // <0879> a = 1
addr == 16'h626 ? 16'he00f :  // <0880> jmp :done
addr == 16'h627 ? 16'h0629 :  // <0880> "
// :stay // = 0x0628
addr == 16'h628 ? 16'h0200 :  // <0882> a = 0
// :done // = 0x0629
addr == 16'h629 ? 16'hf808 :  // <0884> pop rtna // end_func
addr == 16'h62a ? 16'hfc00 :  // <0884> swapra = nop


        
                16'hxxxx;
        endmodule
    
