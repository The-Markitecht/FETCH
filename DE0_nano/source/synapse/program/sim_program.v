
        `include "header.v"

        module sim_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.

//TODO: tokenize all input conditions.
// continuously send the token stream up to the PC for buffering, reassembly, and pattern matching.
// format a token as words separated by spaces, ending in a newline.
// PC pass those directly to a Tcl interp?  easy to track test state that way, effectively operating
// state machines in Tcl.  that goes against pattern matching by regex.
// might be needed instead of regex due to pattern complexity.  surely will accelerate the
// development by giving specific error messages, instead of leaving me to guess and troubleshoot
// a regex at each test failure.
// include timestamp as first parm of each token.  8 hex digit us linear.  that's 71 minutes range.
// simulator input script should be similar.
// offer commands to enable/disable reporting of individual tokens, to limit bulk of output overwhelming uarts.

addr == 16'h00 ? 16'he00f :  // <0016> jmp :main
addr == 16'h01 ? 16'h01ec :  // <0016> "


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




// power relay duty cycles, in microseconds.  duty cycle time = relay OFF time.
// relay actually remains energized for about another 5 us after pwm goes high,
// due to the optocoupler pullup taking some time to climb through the MOSFET's threshold.



// ADC and anmux are represented sparesely here, to fit within Synapse external register space.
// range 0 to 1023 = 0x3ff at the ADC.


//alias_both code_write_addr      [incr counter]  "//cdwrad"
//alias_both code_write_data      [incr counter]  "//cdwrdt"



addr == 16'h02 ? 16'h0029 :  // <0096> emit_debugger_register_table  counter
// "       a"
addr == 16'h03 ? 16'h2020 :  // <0096>   
addr == 16'h04 ? 16'h2020 :  // <0096>   
addr == 16'h05 ? 16'h2020 :  // <0096>   
addr == 16'h06 ? 16'h6120 :  // <0096> a 
// "       b"
addr == 16'h07 ? 16'h2020 :  // <0096>   
addr == 16'h08 ? 16'h2020 :  // <0096>   
addr == 16'h09 ? 16'h2020 :  // <0096>   
addr == 16'h0a ? 16'h6220 :  // <0096> b 
// "       i"
addr == 16'h0b ? 16'h2020 :  // <0096>   
addr == 16'h0c ? 16'h2020 :  // <0096>   
addr == 16'h0d ? 16'h2020 :  // <0096>   
addr == 16'h0e ? 16'h6920 :  // <0096> i 
// "       j"
addr == 16'h0f ? 16'h2020 :  // <0096>   
addr == 16'h10 ? 16'h2020 :  // <0096>   
addr == 16'h11 ? 16'h2020 :  // <0096>   
addr == 16'h12 ? 16'h6a20 :  // <0096> j 
// "       x"
addr == 16'h13 ? 16'h2020 :  // <0096>   
addr == 16'h14 ? 16'h2020 :  // <0096>   
addr == 16'h15 ? 16'h2020 :  // <0096>   
addr == 16'h16 ? 16'h7820 :  // <0096> x 
// "       y"
addr == 16'h17 ? 16'h2020 :  // <0096>   
addr == 16'h18 ? 16'h2020 :  // <0096>   
addr == 16'h19 ? 16'h2020 :  // <0096>   
addr == 16'h1a ? 16'h7920 :  // <0096> y 
// "      ga"
addr == 16'h1b ? 16'h2020 :  // <0096>   
addr == 16'h1c ? 16'h2020 :  // <0096>   
addr == 16'h1d ? 16'h2020 :  // <0096>   
addr == 16'h1e ? 16'h6167 :  // <0096> ag
// "      gb"
addr == 16'h1f ? 16'h2020 :  // <0096>   
addr == 16'h20 ? 16'h2020 :  // <0096>   
addr == 16'h21 ? 16'h2020 :  // <0096>   
addr == 16'h22 ? 16'h6267 :  // <0096> bg
// "      gc"
addr == 16'h23 ? 16'h2020 :  // <0096>   
addr == 16'h24 ? 16'h2020 :  // <0096>   
addr == 16'h25 ? 16'h2020 :  // <0096>   
addr == 16'h26 ? 16'h6367 :  // <0096> cg
// "      gd"
addr == 16'h27 ? 16'h2020 :  // <0096>   
addr == 16'h28 ? 16'h2020 :  // <0096>   
addr == 16'h29 ? 16'h2020 :  // <0096>   
addr == 16'h2a ? 16'h6467 :  // <0096> dg
// "      ge"
addr == 16'h2b ? 16'h2020 :  // <0096>   
addr == 16'h2c ? 16'h2020 :  // <0096>   
addr == 16'h2d ? 16'h2020 :  // <0096>   
addr == 16'h2e ? 16'h6567 :  // <0096> eg
// "      gf"
addr == 16'h2f ? 16'h2020 :  // <0096>   
addr == 16'h30 ? 16'h2020 :  // <0096>   
addr == 16'h31 ? 16'h2020 :  // <0096>   
addr == 16'h32 ? 16'h6667 :  // <0096> fg
// " scroldr"
addr == 16'h33 ? 16'h7320 :  // <0096> s 
addr == 16'h34 ? 16'h7263 :  // <0096> rc
addr == 16'h35 ? 16'h6c6f :  // <0096> lo
addr == 16'h36 ? 16'h7264 :  // <0096> rd
// " puffing"
addr == 16'h37 ? 16'h7020 :  // <0096> p 
addr == 16'h38 ? 16'h6675 :  // <0096> fu
addr == 16'h39 ? 16'h6966 :  // <0096> if
addr == 16'h3a ? 16'h676e :  // <0096> gn
// "      pa"
addr == 16'h3b ? 16'h2020 :  // <0096>   
addr == 16'h3c ? 16'h2020 :  // <0096>   
addr == 16'h3d ? 16'h2020 :  // <0096>   
addr == 16'h3e ? 16'h6170 :  // <0096> ap
// "      pb"
addr == 16'h3f ? 16'h2020 :  // <0096>   
addr == 16'h40 ? 16'h2020 :  // <0096>   
addr == 16'h41 ? 16'h2020 :  // <0096>   
addr == 16'h42 ? 16'h6270 :  // <0096> bp
// "      pc"
addr == 16'h43 ? 16'h2020 :  // <0096>   
addr == 16'h44 ? 16'h2020 :  // <0096>   
addr == 16'h45 ? 16'h2020 :  // <0096>   
addr == 16'h46 ? 16'h6370 :  // <0096> cp
// "      pd"
addr == 16'h47 ? 16'h2020 :  // <0096>   
addr == 16'h48 ? 16'h2020 :  // <0096>   
addr == 16'h49 ? 16'h2020 :  // <0096>   
addr == 16'h4a ? 16'h6470 :  // <0096> dp
// "//rstk  "
addr == 16'h4b ? 16'h2f2f :  // <0096> //
addr == 16'h4c ? 16'h7372 :  // <0096> sr
addr == 16'h4d ? 16'h6b74 :  // <0096> kt
addr == 16'h4e ? 16'h2020 :  // <0096>   
// "  ev_pri"
addr == 16'h4f ? 16'h2020 :  // <0096>   
addr == 16'h50 ? 16'h7665 :  // <0096> ve
addr == 16'h51 ? 16'h705f :  // <0096> p_
addr == 16'h52 ? 16'h6972 :  // <0096> ir
// "softevnt"
addr == 16'h53 ? 16'h6f73 :  // <0096> os
addr == 16'h54 ? 16'h7466 :  // <0096> tf
addr == 16'h55 ? 16'h7665 :  // <0096> ve
addr == 16'h56 ? 16'h746e :  // <0096> tn
// " stamplo"
addr == 16'h57 ? 16'h7320 :  // <0096> s 
addr == 16'h58 ? 16'h6174 :  // <0096> at
addr == 16'h59 ? 16'h706d :  // <0096> pm
addr == 16'h5a ? 16'h6f6c :  // <0096> ol
// " stamphi"
addr == 16'h5b ? 16'h7320 :  // <0096> s 
addr == 16'h5c ? 16'h6174 :  // <0096> at
addr == 16'h5d ? 16'h706d :  // <0096> pm
addr == 16'h5e ? 16'h6968 :  // <0096> ih
// "stampclo"
addr == 16'h5f ? 16'h7473 :  // <0096> ts
addr == 16'h60 ? 16'h6d61 :  // <0096> ma
addr == 16'h61 ? 16'h6370 :  // <0096> cp
addr == 16'h62 ? 16'h6f6c :  // <0096> ol
// "stampchi"
addr == 16'h63 ? 16'h7473 :  // <0096> ts
addr == 16'h64 ? 16'h6d61 :  // <0096> ma
addr == 16'h65 ? 16'h6370 :  // <0096> cp
addr == 16'h66 ? 16'h6968 :  // <0096> ih
// "ustimer0"
addr == 16'h67 ? 16'h7375 :  // <0096> su
addr == 16'h68 ? 16'h6974 :  // <0096> it
addr == 16'h69 ? 16'h656d :  // <0096> em
addr == 16'h6a ? 16'h3072 :  // <0096> 0r
// "mstimer0"
addr == 16'h6b ? 16'h736d :  // <0096> sm
addr == 16'h6c ? 16'h6974 :  // <0096> it
addr == 16'h6d ? 16'h656d :  // <0096> em
addr == 16'h6e ? 16'h3072 :  // <0096> 0r
// "pwr_duty"
addr == 16'h6f ? 16'h7770 :  // <0096> wp
addr == 16'h70 ? 16'h5f72 :  // <0096> _r
addr == 16'h71 ? 16'h7564 :  // <0096> ud
addr == 16'h72 ? 16'h7974 :  // <0096> yt
// " ignperd"
addr == 16'h73 ? 16'h6920 :  // <0096> i 
addr == 16'h74 ? 16'h6e67 :  // <0096> ng
addr == 16'h75 ? 16'h6570 :  // <0096> ep
addr == 16'h76 ? 16'h6472 :  // <0096> dr
// "igncycnt"
addr == 16'h77 ? 16'h6769 :  // <0096> gi
addr == 16'h78 ? 16'h636e :  // <0096> cn
addr == 16'h79 ? 16'h6379 :  // <0096> cy
addr == 16'h7a ? 16'h746e :  // <0096> tn
// "  pf1cnt"
addr == 16'h7b ? 16'h2020 :  // <0096>   
addr == 16'h7c ? 16'h6670 :  // <0096> fp
addr == 16'h7d ? 16'h6331 :  // <0096> c1
addr == 16'h7e ? 16'h746e :  // <0096> tn
// "  pf1len"
addr == 16'h7f ? 16'h2020 :  // <0096>   
addr == 16'h80 ? 16'h6670 :  // <0096> fp
addr == 16'h81 ? 16'h6c31 :  // <0096> l1
addr == 16'h82 ? 16'h6e65 :  // <0096> ne
// "  adcmaf"
addr == 16'h83 ? 16'h2020 :  // <0096>   
addr == 16'h84 ? 16'h6461 :  // <0096> da
addr == 16'h85 ? 16'h6d63 :  // <0096> mc
addr == 16'h86 ? 16'h6661 :  // <0096> fa
// "   adco2"
addr == 16'h87 ? 16'h2020 :  // <0096>   
addr == 16'h88 ? 16'h6120 :  // <0096> a 
addr == 16'h89 ? 16'h6364 :  // <0096> cd
addr == 16'h8a ? 16'h326f :  // <0096> 2o
// "  adctps"
addr == 16'h8b ? 16'h2020 :  // <0096>   
addr == 16'h8c ? 16'h6461 :  // <0096> da
addr == 16'h8d ? 16'h7463 :  // <0096> tc
addr == 16'h8e ? 16'h7370 :  // <0096> sp
// " anmuxrd"
addr == 16'h8f ? 16'h6120 :  // <0096> a 
addr == 16'h90 ? 16'h6d6e :  // <0096> mn
addr == 16'h91 ? 16'h7875 :  // <0096> xu
addr == 16'h92 ? 16'h6472 :  // <0096> dr
// " anblock"
addr == 16'h93 ? 16'h6120 :  // <0096> a 
addr == 16'h94 ? 16'h626e :  // <0096> bn
addr == 16'h95 ? 16'h6f6c :  // <0096> ol
addr == 16'h96 ? 16'h6b63 :  // <0096> kc
// " antrans"
addr == 16'h97 ? 16'h6120 :  // <0096> a 
addr == 16'h98 ? 16'h746e :  // <0096> tn
addr == 16'h99 ? 16'h6172 :  // <0096> ar
addr == 16'h9a ? 16'h736e :  // <0096> sn
// "//uartdt"
addr == 16'h9b ? 16'h2f2f :  // <0096> //
addr == 16'h9c ? 16'h6175 :  // <0096> au
addr == 16'h9d ? 16'h7472 :  // <0096> tr
addr == 16'h9e ? 16'h7464 :  // <0096> td
// "uartstat"
addr == 16'h9f ? 16'h6175 :  // <0096> au
addr == 16'ha0 ? 16'h7472 :  // <0096> tr
addr == 16'ha1 ? 16'h7473 :  // <0096> ts
addr == 16'ha2 ? 16'h7461 :  // <0096> ta
// "    leds"
addr == 16'ha3 ? 16'h2020 :  // <0096>   
addr == 16'ha4 ? 16'h2020 :  // <0096>   
addr == 16'ha5 ? 16'h656c :  // <0096> el
addr == 16'ha6 ? 16'h7364 :  // <0096> sd

// error code constants.

// string resources
// :boot_msg // = 0x00a7
// "SIM\r\n\x0"
addr == 16'ha7 ? 16'h4953 :  // <0104> IS
addr == 16'ha8 ? 16'h0d4d :  // <0104>  M
addr == 16'ha9 ? 16'h000a :  // <0104>   

// libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.

// event loop.  this infrastructure is assembled directly into the main program, not a func.
// first instruction of an event handler should be the 7th cycle after reading its priority from the event controller here.
// :poll_events // = 0x00aa
// initialize prior to polling loop, for minimum latency.
addr == 16'haa ? 16'h07a0 :  // <0006> b = :event_table
addr == 16'hab ? 16'h0204 :  // <0006> "
// 3-cycle polling loop.
// :poll_events_again // = 0x00ac
addr == 16'hac ? 16'h0013 :  // <0009> a = event_priority
addr == 16'had ? 16'he000 :  // <0010> br 0z :poll_events_again
addr == 16'hae ? 16'h00ac :  // <0010> "
// acknowledge the event to clear its capture register.  do this right away,
// so another occurrence of the same event can be captured right away in the controller.
addr == 16'haf ? 16'h4c00 :  // <0013> event_priority = a
// compute an address in the event_table.  note the absence of a wait state for the adder here (not needed).
addr == 16'hb0 ? 16'hd300 :  // <0015> fetch rtna from ad0
addr == 16'hb1 ? 16'hfbb0 :  // <0015> "
// jump to the address given in the event_table.  each handler MUST end with a end_event.
// each handler does NOT need to save ANY registers (e.g. no convention_gpx).  they can all be trashed.
// each handler is passed the event priority in a, in case the same handler is used on multiple priorities.
addr == 16'hb2 ? 16'hfc00 :  // <0019> swapra = nop
// just returned here from the handler, in case the handler accidentally did a rtn.  this should NEVER happen.
addr == 16'hb3 ? 16'ha3a0 :  // <0021> error_halt_code 0xffc0 // leds = 0xffc0
addr == 16'hb4 ? 16'hffc0 :  // <0021> "
addr == 16'hb5 ? 16'he00f :  // <0021> error_halt_code 0xffc0
addr == 16'hb6 ? 16'h00b5 :  // <0021> "


// driver library for synapse316_uart simple async transceiver.






// routine sends out the low byte from a to the UART.  blocks until the FIFO accepts the byte.
// ######## func putchar_fduart // = 0x00b7
addr == 16'hb7 ? 16'h4804 :  // <0046> push x // func putchar_fduart

addr == 16'hb8 ? 16'h1000 :  // <0048> x = a

// wait for FIFO to be available.
addr == 16'hb9 ? 16'h0202 :  // <0051> a = $atx_fifo_full_mask
// :pcfduart_wait_for_idle // = 0x00ba
addr == 16'hba ? 16'h0427 :  // <0053> b = fduart_status
addr == 16'hbb ? 16'he403 :  // <0054> bn and0z :pcfduart_wait_for_idle
addr == 16'hbc ? 16'h00ba :  // <0054> "

// push word to the UART.  its low byte is a character.
addr == 16'hbd ? 16'h9804 :  // <0057> fduart_data = x
addr == 16'hbe ? 16'h1012 :  // <0058> pop x // end_func
addr == 16'hbf ? 16'hfc00 :  // <0057> swapra = nop

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// ######## func getchar_fduart // = 0x00c0
// wait until FIFO is populated.
addr == 16'hc0 ? 16'h0208 :  // <0064> a = $arx_fifo_empty_mask
// :wait_for_busy // = 0x00c1
addr == 16'hc1 ? 16'h0427 :  // <0066> b = fduart_status
addr == 16'hc2 ? 16'he403 :  // <0067> bn and0z :wait_for_busy
addr == 16'hc3 ? 16'h00c1 :  // <0067> "
addr == 16'hc4 ? 16'h0026 :  // <0068> a = fduart_data
addr == 16'hc5 ? 16'hfc00 :  // <0068> swapra = nop

// returns a character in a, or -1 if none.
// ######## func pollchar_fduart // = 0x00c6
// check for FIFO is populated.
addr == 16'hc6 ? 16'h0208 :  // <0074> a = $arx_fifo_empty_mask
addr == 16'hc7 ? 16'h0427 :  // <0075> b = fduart_status
addr == 16'hc8 ? 16'he403 :  // <0076> bn and0z :none
addr == 16'hc9 ? 16'h00cc :  // <0076> "
addr == 16'hca ? 16'h0026 :  // <0077> a = fduart_data
addr == 16'hcb ? 16'hfc00 :  // <0077> swapra = nop
// :none // = 0x00cc
addr == 16'hcc ? 16'h0360 :  // <0080> a = -1
addr == 16'hcd ? 16'hfc00 :  // <0080> swapra = nop



// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x00ce
// "0123456789abcdef"
addr == 16'hce ? 16'h3130 :  // <0050> 10
addr == 16'hcf ? 16'h3332 :  // <0050> 32
addr == 16'hd0 ? 16'h3534 :  // <0050> 54
addr == 16'hd1 ? 16'h3736 :  // <0050> 76
addr == 16'hd2 ? 16'h3938 :  // <0050> 98
addr == 16'hd3 ? 16'h6261 :  // <0050> ba
addr == 16'hd4 ? 16'h6463 :  // <0050> dc
addr == 16'hd5 ? 16'h6665 :  // <0050> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// ######## func put4x // = 0x00d6
addr == 16'hd6 ? 16'h4804 :  // <0054> push x // func put4x
addr == 16'hd7 ? 16'h4806 :  // <0054> push ga // "
addr == 16'hd8 ? 16'h483e :  // <0054> push rtna // "
addr == 16'hd9 ? 16'h13a0 :  // <0055> x = :hexdigits
addr == 16'hda ? 16'h00ce :  // <0055> "

addr == 16'hdb ? 16'h1800 :  // <0057> ga = a
addr == 16'hdc ? 16'h07a0 :  // <0058> b = 0xF000
addr == 16'hdd ? 16'hf000 :  // <0058> "
addr == 16'hde ? 16'hc800 :  // <0059> a = and
addr == 16'hdf ? 16'h0330 :  // <0059> "
addr == 16'he0 ? 16'h0353 :  // <0060> a = a>>4
addr == 16'he1 ? 16'h0353 :  // <0061> a = a>>4
addr == 16'he2 ? 16'h0353 :  // <0062> a = a>>4
addr == 16'he3 ? 16'hfba0 :  // <0063> call fetch_byte
addr == 16'he4 ? 16'h0183 :  // <0063> "
addr == 16'he5 ? 16'hfc00 :  // <0063> "
addr == 16'he6 ? 16'hfba0 :  // <0064> putchar a
addr == 16'he7 ? 16'h00b7 :  // <0064> "
addr == 16'he8 ? 16'hfc00 :  // <0064> "

addr == 16'he9 ? 16'h0006 :  // <0066> a = ga
addr == 16'hea ? 16'h07a0 :  // <0067> b = 0x0F00
addr == 16'heb ? 16'h0f00 :  // <0067> "
addr == 16'hec ? 16'hc800 :  // <0068> a = and
addr == 16'hed ? 16'h0330 :  // <0068> "
addr == 16'hee ? 16'h0353 :  // <0069> a = a>>4
addr == 16'hef ? 16'h0353 :  // <0070> a = a>>4
addr == 16'hf0 ? 16'hfba0 :  // <0071> call fetch_byte
addr == 16'hf1 ? 16'h0183 :  // <0071> "
addr == 16'hf2 ? 16'hfc00 :  // <0071> "
addr == 16'hf3 ? 16'hfba0 :  // <0072> putchar a
addr == 16'hf4 ? 16'h00b7 :  // <0072> "
addr == 16'hf5 ? 16'hfc00 :  // <0072> "

addr == 16'hf6 ? 16'h0006 :  // <0074> a = ga
addr == 16'hf7 ? 16'h06f0 :  // <0075> b = 0x00F0
addr == 16'hf8 ? 16'hc800 :  // <0076> a = and
addr == 16'hf9 ? 16'h0330 :  // <0076> "
addr == 16'hfa ? 16'h0353 :  // <0077> a = a>>4
addr == 16'hfb ? 16'hfba0 :  // <0078> call fetch_byte
addr == 16'hfc ? 16'h0183 :  // <0078> "
addr == 16'hfd ? 16'hfc00 :  // <0078> "
addr == 16'hfe ? 16'hfba0 :  // <0079> putchar a
addr == 16'hff ? 16'h00b7 :  // <0079> "
addr == 16'h100 ? 16'hfc00 :  // <0079> "

addr == 16'h101 ? 16'h0006 :  // <0081> a = ga
addr == 16'h102 ? 16'h060f :  // <0082> b = 0x000F
addr == 16'h103 ? 16'hc800 :  // <0083> a = and
addr == 16'h104 ? 16'h0330 :  // <0083> "
addr == 16'h105 ? 16'hfba0 :  // <0084> call fetch_byte
addr == 16'h106 ? 16'h0183 :  // <0084> "
addr == 16'h107 ? 16'hfc00 :  // <0084> "
addr == 16'h108 ? 16'hfba0 :  // <0085> putchar a
addr == 16'h109 ? 16'h00b7 :  // <0085> "
addr == 16'h10a ? 16'hfc00 :  // <0085> "

addr == 16'h10b ? 16'hf812 :  // <0087> pop rtna // end_func
addr == 16'h10c ? 16'h1812 :  // <0087> pop ga // "
addr == 16'h10d ? 16'h1012 :  // <0087> pop x // "
addr == 16'h10e ? 16'hfc00 :  // <0086> swapra = nop

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// ######## func get4x // = 0x010f
addr == 16'h10f ? 16'h4802 :  // <0091> push i // func get4x
addr == 16'h110 ? 16'h4803 :  // <0091> push j // "
addr == 16'h111 ? 16'h4804 :  // <0091> push x // "
addr == 16'h112 ? 16'h4805 :  // <0091> push y // "
addr == 16'h113 ? 16'h483e :  // <0091> push rtna // "
// y = digit counter
// j = sum
addr == 16'h114 ? 16'h1604 :  // <0094> y = 4
// :again // = 0x0115
addr == 16'h115 ? 16'hfba0 :  // <0096> getchar
addr == 16'h116 ? 16'h00c0 :  // <0096> "
addr == 16'h117 ? 16'hfc00 :  // <0096> "
addr == 16'h118 ? 16'h13a0 :  // <0097> x = :hexdigits
addr == 16'h119 ? 16'h00ce :  // <0097> "
addr == 16'h11a ? 16'h0a10 :  // <0098> i = 16
addr == 16'h11b ? 16'hfba0 :  // <0099> call :find_in_fetch
addr == 16'h11c ? 16'h0197 :  // <0099> "
addr == 16'h11d ? 16'hfc00 :  // <0099> "
addr == 16'h11e ? 16'h0760 :  // <0100> b = -1
addr == 16'h11f ? 16'he007 :  // <0101> br eq :fail
addr == 16'h120 ? 16'h0134 :  // <0101> "
addr == 16'h121 ? 16'h0400 :  // <0102> b = a
addr == 16'h122 ? 16'h0003 :  // <0103> a = j
addr == 16'h123 ? 16'h0352 :  // <0104> a = a<<4
addr == 16'h124 ? 16'hc800 :  // <0105> j = or
addr == 16'h125 ? 16'h0f34 :  // <0105> "
addr == 16'h126 ? 16'h1360 :  // <0106> x = -1
addr == 16'h127 ? 16'hc800 :  // <0107> y = x+y
addr == 16'h128 ? 16'h1720 :  // <0107> "
addr == 16'h129 ? 16'h0005 :  // <0108> a = y
addr == 16'h12a ? 16'he400 :  // <0109> bn az :again
addr == 16'h12b ? 16'h0115 :  // <0109> "
addr == 16'h12c ? 16'h0003 :  // <0110> a = j
addr == 16'h12d ? 16'h0600 :  // <0111> b = 0
addr == 16'h12e ? 16'hf812 :  // <0112> pop rtna // rtn
addr == 16'h12f ? 16'h1412 :  // <0112> pop y // "
addr == 16'h130 ? 16'h1012 :  // <0112> pop x // "
addr == 16'h131 ? 16'h0c12 :  // <0112> pop j // "
addr == 16'h132 ? 16'h0812 :  // <0112> pop i // "
addr == 16'h133 ? 16'hfc00 :  // <0111> swapra = nop
// :fail // = 0x0134
addr == 16'h134 ? 16'h0760 :  // <0114> b = -1
addr == 16'h135 ? 16'hf812 :  // <0115> pop rtna // end_func
addr == 16'h136 ? 16'h1412 :  // <0115> pop y // "
addr == 16'h137 ? 16'h1012 :  // <0115> pop x // "
addr == 16'h138 ? 16'h0c12 :  // <0115> pop j // "
addr == 16'h139 ? 16'h0812 :  // <0115> pop i // "
addr == 16'h13a ? 16'hfc00 :  // <0114> swapra = nop

// print a fixed-length string from packed words in program space.
// pass its word address (not its byte address) in a,  its length (bytes) in b.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_fixed // = 0x013b
addr == 16'h13b ? 16'h4802 :  // <0121> push i // func print_fixed
addr == 16'h13c ? 16'h4803 :  // <0121> push j // "
addr == 16'h13d ? 16'h4804 :  // <0121> push x // "
addr == 16'h13e ? 16'h4805 :  // <0121> push y // "
addr == 16'h13f ? 16'h4806 :  // <0121> push ga // "
addr == 16'h140 ? 16'h483e :  // <0121> push rtna // "
addr == 16'h141 ? 16'h0800 :  // <0122> i = a
addr == 16'h142 ? 16'h0e01 :  // <0123> j = 1
addr == 16'h143 ? 16'h1001 :  // <0124> x = b
addr == 16'h144 ? 16'h1760 :  // <0125> y = -1
// :next_word // = 0x0145
addr == 16'h145 ? 16'he002 :  // <0127> br xz :done
addr == 16'h146 ? 16'h015b :  // <0127> "
addr == 16'h147 ? 16'h1320 :  // <0128> x = ad2
addr == 16'h148 ? 16'hd002 :  // <0129> fetch ga from i
addr == 16'h149 ? 16'h1bb0 :  // <0129> "
// now x = bytes remaining, i = current word address, ga = data word.
addr == 16'h14a ? 16'h0006 :  // <0131> a = ga // putchar ga
addr == 16'h14b ? 16'hfba0 :  // <0131> putchar ga
addr == 16'h14c ? 16'h00b7 :  // <0131> "
addr == 16'h14d ? 16'hfc00 :  // <0131> "
addr == 16'h14e ? 16'he002 :  // <0132> br xz :done
addr == 16'h14f ? 16'h015b :  // <0132> "
addr == 16'h150 ? 16'h1320 :  // <0133> x = ad2
addr == 16'h151 ? 16'h0006 :  // <0134> a = ga
addr == 16'h152 ? 16'h0353 :  // <0135> a = a>>4
addr == 16'h153 ? 16'h0353 :  // <0136> a = a>>4
addr == 16'h154 ? 16'hfba0 :  // <0137> putchar a
addr == 16'h155 ? 16'h00b7 :  // <0137> "
addr == 16'h156 ? 16'hfc00 :  // <0137> "
addr == 16'h157 ? 16'hc800 :  // <0138> i = i+j
addr == 16'h158 ? 16'h0b10 :  // <0138> "
addr == 16'h159 ? 16'he00f :  // <0139> jmp :next_word
addr == 16'h15a ? 16'h0145 :  // <0139> "
// :done // = 0x015b
addr == 16'h15b ? 16'hf812 :  // <0141> pop rtna // end_func
addr == 16'h15c ? 16'h1812 :  // <0141> pop ga // "
addr == 16'h15d ? 16'h1412 :  // <0141> pop y // "
addr == 16'h15e ? 16'h1012 :  // <0141> pop x // "
addr == 16'h15f ? 16'h0c12 :  // <0141> pop j // "
addr == 16'h160 ? 16'h0812 :  // <0141> pop i // "
addr == 16'h161 ? 16'hfc00 :  // <0140> swapra = nop

// print a null-terminated string from packed words in program space.
// pass its word address (not its byte address) in a.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_nt // = 0x0162
addr == 16'h162 ? 16'h4802 :  // <0147> push i // func print_nt
addr == 16'h163 ? 16'h4803 :  // <0147> push j // "
addr == 16'h164 ? 16'h4804 :  // <0147> push x // "
addr == 16'h165 ? 16'h483e :  // <0147> push rtna // "
addr == 16'h166 ? 16'h0800 :  // <0148> i = a
addr == 16'h167 ? 16'h0e01 :  // <0149> j = 1
// :next_word // = 0x0168
addr == 16'h168 ? 16'hd002 :  // <0151> fetch x from i
addr == 16'h169 ? 16'h13b0 :  // <0151> "
// now i = current word address, x = data word, b = low byte mask, a = data byte.
addr == 16'h16a ? 16'h0004 :  // <0153> a = x
addr == 16'h16b ? 16'h06ff :  // <0154> b = 0xff
addr == 16'h16c ? 16'he003 :  // <0155> br and0z :done
addr == 16'h16d ? 16'h017e :  // <0155> "
addr == 16'h16e ? 16'hfba0 :  // <0156> putchar a
addr == 16'h16f ? 16'h00b7 :  // <0156> "
addr == 16'h170 ? 16'hfc00 :  // <0156> "
addr == 16'h171 ? 16'h0004 :  // <0157> a = x
addr == 16'h172 ? 16'h0353 :  // <0158> a = a>>4
addr == 16'h173 ? 16'h0353 :  // <0159> a = a>>4
addr == 16'h174 ? 16'h06ff :  // <0160> b = 0xff
addr == 16'h175 ? 16'he003 :  // <0161> br and0z :done
addr == 16'h176 ? 16'h017e :  // <0161> "
addr == 16'h177 ? 16'hfba0 :  // <0162> putchar a
addr == 16'h178 ? 16'h00b7 :  // <0162> "
addr == 16'h179 ? 16'hfc00 :  // <0162> "
addr == 16'h17a ? 16'hc800 :  // <0163> i = i+j
addr == 16'h17b ? 16'h0b10 :  // <0163> "
addr == 16'h17c ? 16'he00f :  // <0164> jmp :next_word
addr == 16'h17d ? 16'h0168 :  // <0164> "
// :done // = 0x017e
addr == 16'h17e ? 16'hf812 :  // <0166> pop rtna // end_func
addr == 16'h17f ? 16'h1012 :  // <0166> pop x // "
addr == 16'h180 ? 16'h0c12 :  // <0166> pop j // "
addr == 16'h181 ? 16'h0812 :  // <0166> pop i // "
addr == 16'h182 ? 16'hfc00 :  // <0165> swapra = nop


// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// ######## func fetch_byte // = 0x0183
addr == 16'h183 ? 16'h0601 :  // <0005> b = 1
addr == 16'h184 ? 16'he003 :  // <0006> br and0z :pick_byte_even
addr == 16'h185 ? 16'h018e :  // <0006> "
addr == 16'h186 ? 16'h0350 :  // <0007> a = a>>1
addr == 16'h187 ? 16'h0404 :  // <0008> b = x
addr == 16'h188 ? 16'hc800 :  // <0009> fetch a from a+b
addr == 16'h189 ? 16'hd300 :  // <0009> "
addr == 16'h18a ? 16'h03b0 :  // <0009> "
addr == 16'h18b ? 16'h0353 :  // <0010> a = a>>4
addr == 16'h18c ? 16'h0353 :  // <0011> a = a>>4
addr == 16'h18d ? 16'hfc00 :  // <0011> swapra = nop
// :pick_byte_even // = 0x018e
addr == 16'h18e ? 16'h0350 :  // <0014> a = a>>1
addr == 16'h18f ? 16'h0404 :  // <0015> b = x
addr == 16'h190 ? 16'hc800 :  // <0016> fetch a from a+b
addr == 16'h191 ? 16'hd300 :  // <0016> "
addr == 16'h192 ? 16'h03b0 :  // <0016> "
addr == 16'h193 ? 16'h06ff :  // <0017> b = 0xff
addr == 16'h194 ? 16'hc800 :  // <0018> a = and
addr == 16'h195 ? 16'h0330 :  // <0018> "
addr == 16'h196 ? 16'hfc00 :  // <0018> swapra = nop

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// ######## func find_in_fetch // = 0x0197
addr == 16'h197 ? 16'h4802 :  // <0027> push i // func find_in_fetch
addr == 16'h198 ? 16'h4803 :  // <0027> push j // "
addr == 16'h199 ? 16'h4805 :  // <0027> push y // "
addr == 16'h19a ? 16'h483e :  // <0027> push rtna // "
addr == 16'h19b ? 16'h1400 :  // <0028> y = a
addr == 16'h19c ? 16'h0f60 :  // <0029> j = -1
// :again // = 0x019d
addr == 16'h19d ? 16'he001 :  // <0031> br iz :fail
addr == 16'h19e ? 16'h01ad :  // <0031> "
addr == 16'h19f ? 16'h0b10 :  // <0032> i = ad1
addr == 16'h1a0 ? 16'h0002 :  // <0033> a = i
addr == 16'h1a1 ? 16'hfba0 :  // <0034> call :fetch_byte
addr == 16'h1a2 ? 16'h0183 :  // <0034> "
addr == 16'h1a3 ? 16'hfc00 :  // <0034> "
addr == 16'h1a4 ? 16'h0405 :  // <0035> b = y
addr == 16'h1a5 ? 16'he407 :  // <0036> bn eq :again
addr == 16'h1a6 ? 16'h019d :  // <0036> "
// :found // = 0x01a7
addr == 16'h1a7 ? 16'h0002 :  // <0038> a = i
addr == 16'h1a8 ? 16'hf812 :  // <0039> pop rtna // rtn
addr == 16'h1a9 ? 16'h1412 :  // <0039> pop y // "
addr == 16'h1aa ? 16'h0c12 :  // <0039> pop j // "
addr == 16'h1ab ? 16'h0812 :  // <0039> pop i // "
addr == 16'h1ac ? 16'hfc00 :  // <0038> swapra = nop
// :fail // = 0x01ad
addr == 16'h1ad ? 16'h0360 :  // <0041> a = -1
addr == 16'h1ae ? 16'hf812 :  // <0042> pop rtna // end_func
addr == 16'h1af ? 16'h1412 :  // <0042> pop y // "
addr == 16'h1b0 ? 16'h0c12 :  // <0042> pop j // "
addr == 16'h1b1 ? 16'h0812 :  // <0042> pop i // "
addr == 16'h1b2 ? 16'hfc00 :  // <0041> swapra = nop




// ######## func fletcher16_init // = 0x01b3

addr == 16'h1b3 ? 16'h4200 :  // <0005> $fletcher_sum1_reg = 0
addr == 16'h1b4 ? 16'h4600 :  // <0006> $fletcher_sum2_reg = 0

addr == 16'h1b5 ? 16'hfc00 :  // <0008> swapra = nop

// return the modulus(255) of a given number.
// ######## func mod255 // = 0x01b6

// while a is greater than 254, subtract 255.
// :mod255_again // = 0x01b6
addr == 16'h1b6 ? 16'h06fe :  // <0013> b = 0xfe
addr == 16'h1b7 ? 16'he006 :  // <0014> br gt :mod255_greater
addr == 16'h1b8 ? 16'h01ba :  // <0014> "
addr == 16'h1b9 ? 16'hfc00 :  // <0014> swapra = nop
// :mod255_greater // = 0x01ba
addr == 16'h1ba ? 16'h07a0 :  // <0017> b = ([negate 0xff])
addr == 16'h1bb ? 16'hff01 :  // <0017> "
addr == 16'h1bc ? 16'hc800 :  // <0018> a = a+b
addr == 16'h1bd ? 16'h0300 :  // <0018> "
addr == 16'h1be ? 16'he00f :  // <0019> jmp :mod255_again
addr == 16'h1bf ? 16'h01b6 :  // <0019> "

addr == 16'h1c0 ? 16'hfc00 :  // <0021> swapra = nop

// accumulate a Fletcher16 checksum, given the next byte of data.
// ######## func fletcher16_input8 // = 0x01c1
addr == 16'h1c1 ? 16'h483e :  // <0046> push rtna // func fletcher16_input8

//TODO: debug only.
//x = a
//putasc " "
//a = x
//call put4x
//a = x

addr == 16'h1c2 ? 16'h0410 :  // <0031> b = $fletcher_sum1_reg
addr == 16'h1c3 ? 16'hc800 :  // <0032> a = a+b
addr == 16'h1c4 ? 16'h0300 :  // <0032> "
addr == 16'h1c5 ? 16'hfba0 :  // <0032> callx mod255  a+b  $fletcher_sum1_reg
addr == 16'h1c6 ? 16'h01b6 :  // <0032> "
addr == 16'h1c7 ? 16'hfc00 :  // <0032> "
addr == 16'h1c8 ? 16'h4000 :  // <0032> pc = a

addr == 16'h1c9 ? 16'h0010 :  // <0034> a = $fletcher_sum1_reg
addr == 16'h1ca ? 16'h0411 :  // <0035> b = $fletcher_sum2_reg
addr == 16'h1cb ? 16'hc800 :  // <0036> a = a+b
addr == 16'h1cc ? 16'h0300 :  // <0036> "
addr == 16'h1cd ? 16'hfba0 :  // <0036> callx mod255  a+b  $fletcher_sum2_reg
addr == 16'h1ce ? 16'h01b6 :  // <0036> "
addr == 16'h1cf ? 16'hfc00 :  // <0036> "
addr == 16'h1d0 ? 16'h4400 :  // <0036> pd = a

//TODO: debug only.
//putasc " "
//a =  $fletcher_sum2_reg
//call put4x
//putasc " "
//a =  $fletcher_sum1_reg
//call put4x
//puteol

addr == 16'h1d1 ? 16'hf812 :  // <0047> pop rtna // func fletcher16_input8
addr == 16'h1d2 ? 16'hfc00 :  // <0047> swapra = nop

// accumulate a Fletcher16 checksum, given the next word of data.
// ######## func fletcher16_input16 // = 0x01d3
addr == 16'h1d3 ? 16'h4802 :  // <0055> push i // func fletcher16_input16
addr == 16'h1d4 ? 16'h483e :  // <0055> push rtna // "

addr == 16'h1d5 ? 16'h0b53 :  // <0050> i = a>>4
addr == 16'h1d6 ? 16'h06ff :  // <0051> b = 0xff
addr == 16'h1d7 ? 16'hc800 :  // <0052> a = and
addr == 16'h1d8 ? 16'h0330 :  // <0052> "
addr == 16'h1d9 ? 16'hfba0 :  // <0052> callx fletcher16_input8  and
addr == 16'h1da ? 16'h01c1 :  // <0052> "
addr == 16'h1db ? 16'hfc00 :  // <0052> "
addr == 16'h1dc ? 16'h0002 :  // <0053> a = i
addr == 16'h1dd ? 16'h0353 :  // <0054> a = a>>4
addr == 16'h1de ? 16'hfba0 :  // <0054> callx fletcher16_input8  a>>4
addr == 16'h1df ? 16'h01c1 :  // <0054> "
addr == 16'h1e0 ? 16'hfc00 :  // <0054> "

addr == 16'h1e1 ? 16'hf812 :  // <0056> pop rtna // func fletcher16_input16
addr == 16'h1e2 ? 16'h0812 :  // <0056> pop i // "
addr == 16'h1e3 ? 16'hfc00 :  // <0056> swapra = nop

// return the combined 16-bit result of Fletcher16 checksum.
// ######## func fletcher16_result // = 0x01e4

addr == 16'h1e4 ? 16'h0011 :  // <0059> a = $fletcher_sum2_reg
addr == 16'h1e5 ? 16'h0352 :  // <0060> a = a<<4
addr == 16'h1e6 ? 16'h0352 :  // <0061> a = a<<4
addr == 16'h1e7 ? 16'h0410 :  // <0062> b = $fletcher_sum1_reg
addr == 16'h1e8 ? 16'hc800 :  // <0063> result = or
addr == 16'h1e9 ? 16'h0334 :  // <0063> "
addr == 16'h1ea ? 16'hfc00 :  // <0062> swapra = nop

addr == 16'h1eb ? 16'hfc00 :  // <0065> swapra = nop




// #########################################################################
// :main // = 0x01ec

// keep the real hardware occupied and powered up during testing.
addr == 16'h1ec ? 16'h6e19 :  // <0130> power_duty = $power_duty_holding

// signal boot-up

addr == 16'h1ed ? 16'h03a0 :  // <0133> a = :boot_msg
addr == 16'h1ee ? 16'h00a7 :  // <0133> "
addr == 16'h1ef ? 16'hfba0 :  // <0133> call print_nt
addr == 16'h1f0 ? 16'h0162 :  // <0133> "
addr == 16'h1f1 ? 16'hfc00 :  // <0133> "
addr == 16'h1f2 ? 16'h020d :  // <0133> a = 13 // puteol
addr == 16'h1f3 ? 16'hfba0 :  // <0133> puteol
addr == 16'h1f4 ? 16'h00b7 :  // <0133> "
addr == 16'h1f5 ? 16'hfc00 :  // <0133> "
addr == 16'h1f6 ? 16'h020a :  // <0133> a = 10 // puteol
addr == 16'h1f7 ? 16'hfba0 :  // <0133> puteol
addr == 16'h1f8 ? 16'h00b7 :  // <0133> "
addr == 16'h1f9 ? 16'hfc00 :  // <0133> "


// set up event capture logic.
addr == 16'h1fa ? 16'h3600 :  // <0136> puffing = 0

// set up an engine running state.
addr == 16'h1fb ? 16'h73a0 :  // <0139> ign_period = ([rpm_to_jf 1000])
addr == 16'h1fc ? 16'h02bc :  // <0139> "
addr == 16'h1fd ? 16'h3201 :  // <0140> scroll_dir = 1
addr == 16'h1fe ? 16'h6a01 :  // <0141> mstimer0 = 1

// start handling events.
addr == 16'h1ff ? 16'h53a0 :  // <0144> soft_event = $event_controller_reset_mask
addr == 16'h200 ? 16'h8000 :  // <0144> "
addr == 16'h201 ? 16'h5200 :  // <0145> soft_event = 0
addr == 16'h202 ? 16'he00f :  // <0146> jmp :poll_events
addr == 16'h203 ? 16'h00aa :  // <0146> "

// event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.
// event 0 not used in this app anyway.
// :event_table // = 0x0204
addr == 16'h204 ? 16'h00aa :  // <0151> ([label :poll_events])
addr == 16'h205 ? 16'h0244 :  // <0152> ([label :ustimer0_handler])
addr == 16'h206 ? 16'h0242 :  // <0153> ([label :ign_pulse_done_handler])
addr == 16'h207 ? 16'h0215 :  // <0154> ([label :puff1_capture_handler])
addr == 16'h208 ? 16'h027e :  // <0155> ([label :spi_done_handler])
addr == 16'h209 ? 16'h0246 :  // <0156> ([label :mstimer0_handler])
addr == 16'h20a ? 16'h022e :  // <0157> ([label :puff1_timeout_handler])
addr == 16'h20b ? 16'h025a :  // <0158> ([label :uart_rx_handler])
addr == 16'h20c ? 16'h026c :  // <0159> ([label :uart_rx_overflow_handler])
addr == 16'h20d ? 16'h0274 :  // <0160> ([label :uart_tx_overflow_handler])
addr == 16'h20e ? 16'h0276 :  // <0161> ([label :softevent3_handler])
addr == 16'h20f ? 16'h0278 :  // <0162> ([label :softevent2_handler])
addr == 16'h210 ? 16'h027a :  // <0163> ([label :softevent1_handler])
addr == 16'h211 ? 16'h027c :  // <0164> ([label :softevent0_handler])

// #########################################################################

// :start_puffing_tkn // = 0x0212
// "pufon"
addr == 16'h212 ? 16'h7570 :  // <0169> up
addr == 16'h213 ? 16'h6f66 :  // <0169> of
addr == 16'h214 ? 16'h006e :  // <0169>  n

// ######## event puff1_capture_handler // = 0x0215
addr == 16'h215 ? 16'h001e :  // <0172> a = puff1cnt
addr == 16'h216 ? 16'h0353 :  // <0173> a = a>>4
//if a eq 0 {
//a = puff1cnt
//call put4x
//putasc { }
//a = puff1len
//call put4x
//puteol
//}

addr == 16'h217 ? 16'h000d :  // <0185> a = puffing
addr == 16'h218 ? 16'h0600 :  // <0185> b = 0

addr == 16'h219 ? 16'he407 :  // <0182> bn eq :else_537
addr == 16'h21a ? 16'h0229 :  // <0182> "

addr == 16'h21b ? 16'h3601 :  // <0183> puffing = 1

addr == 16'h21c ? 16'h03a0 :  // <0184> a = :start_puffing_tkn
addr == 16'h21d ? 16'h0212 :  // <0184> "
addr == 16'h21e ? 16'hfba0 :  // <0184> call print_nt
addr == 16'h21f ? 16'h0162 :  // <0184> "
addr == 16'h220 ? 16'hfc00 :  // <0184> "
addr == 16'h221 ? 16'h020d :  // <0184> a = 13 // puteol
addr == 16'h222 ? 16'hfba0 :  // <0184> puteol
addr == 16'h223 ? 16'h00b7 :  // <0184> "
addr == 16'h224 ? 16'hfc00 :  // <0184> "
addr == 16'h225 ? 16'h020a :  // <0184> a = 10 // puteol
addr == 16'h226 ? 16'hfba0 :  // <0184> puteol
addr == 16'h227 ? 16'h00b7 :  // <0184> "
addr == 16'h228 ? 16'hfc00 :  // <0184> "


addr == 16'h229 ? 16'he00f :  // <0186> end_event
addr == 16'h22a ? 16'h00aa :  // <0186> "

// :stop_puffing_tkn // = 0x022b
// "pufof"
addr == 16'h22b ? 16'h7570 :  // <0189> up
addr == 16'h22c ? 16'h6f66 :  // <0189> of
addr == 16'h22d ? 16'h0066 :  // <0189>  f

// ######## event puff1_timeout_handler // = 0x022e

addr == 16'h22e ? 16'h000d :  // <0195> a = puffing
addr == 16'h22f ? 16'h0601 :  // <0195> b = 1

addr == 16'h230 ? 16'he407 :  // <0192> bn eq :else_560
addr == 16'h231 ? 16'h0240 :  // <0192> "

addr == 16'h232 ? 16'h3600 :  // <0193> puffing = 0

addr == 16'h233 ? 16'h03a0 :  // <0194> a = :stop_puffing_tkn
addr == 16'h234 ? 16'h022b :  // <0194> "
addr == 16'h235 ? 16'hfba0 :  // <0194> call print_nt
addr == 16'h236 ? 16'h0162 :  // <0194> "
addr == 16'h237 ? 16'hfc00 :  // <0194> "
addr == 16'h238 ? 16'h020d :  // <0194> a = 13 // puteol
addr == 16'h239 ? 16'hfba0 :  // <0194> puteol
addr == 16'h23a ? 16'h00b7 :  // <0194> "
addr == 16'h23b ? 16'hfc00 :  // <0194> "
addr == 16'h23c ? 16'h020a :  // <0194> a = 10 // puteol
addr == 16'h23d ? 16'hfba0 :  // <0194> puteol
addr == 16'h23e ? 16'h00b7 :  // <0194> "
addr == 16'h23f ? 16'hfc00 :  // <0194> "


addr == 16'h240 ? 16'he00f :  // <0196> end_event
addr == 16'h241 ? 16'h00aa :  // <0196> "

// ######## event ign_pulse_done_handler // = 0x0242
addr == 16'h242 ? 16'he00f :  // <0199> end_event
addr == 16'h243 ? 16'h00aa :  // <0199> "

// ######## event ustimer0_handler // = 0x0244
addr == 16'h244 ? 16'he00f :  // <0202> end_event
addr == 16'h245 ? 16'h00aa :  // <0202> "

// ######## event mstimer0_handler // = 0x0246
addr == 16'h246 ? 16'h000c :  // <0205> a = scroll_dir
//    a = a<<4
addr == 16'h247 ? 16'h0420 :  // <0207> b = adc_maf
addr == 16'h248 ? 16'hc800 :  // <0208> adc_maf = a+b
addr == 16'h249 ? 16'h8300 :  // <0208> "

addr == 16'h24a ? 16'h0020 :  // <0211> a = adc_maf
addr == 16'h24b ? 16'h07a0 :  // <0211> b = 900
addr == 16'h24c ? 16'h0384 :  // <0211> "

addr == 16'h24d ? 16'he406 :  // <0209> bn gt :else_589
addr == 16'h24e ? 16'h0250 :  // <0209> "

addr == 16'h24f ? 16'h3360 :  // <0210> scroll_dir = -1


addr == 16'h250 ? 16'h0020 :  // <0214> a = adc_maf
addr == 16'h251 ? 16'h07a0 :  // <0214> b = 600
addr == 16'h252 ? 16'h0258 :  // <0214> "

addr == 16'h253 ? 16'he405 :  // <0212> bn lt :else_595
addr == 16'h254 ? 16'h0256 :  // <0212> "

addr == 16'h255 ? 16'h3201 :  // <0213> scroll_dir = 1

addr == 16'h256 ? 16'h6a14 :  // <0215> mstimer0 = 20
addr == 16'h257 ? 16'he00f :  // <0216> end_event
addr == 16'h258 ? 16'h00aa :  // <0216> "

// ######## func parse_key // = 0x0259


addr == 16'h259 ? 16'hfc00 :  // <0220> swapra = nop

// ######## event uart_rx_handler // = 0x025a
// :again // = 0x025a
addr == 16'h25a ? 16'hfba0 :  // <0223> pollchar
addr == 16'h25b ? 16'h00c6 :  // <0223> "
addr == 16'h25c ? 16'hfc00 :  // <0223> "
addr == 16'h25d ? 16'h1000 :  // <0224> x = a

addr == 16'h25e ? 16'h0004 :  // <0227> a = x
addr == 16'h25f ? 16'h0760 :  // <0227> b = -1

addr == 16'h260 ? 16'he407 :  // <0225> bn eq :else_608
addr == 16'h261 ? 16'h0264 :  // <0225> "

addr == 16'h262 ? 16'he00f :  // <0226> event_return
addr == 16'h263 ? 16'h00aa :  // <0226> "

addr == 16'h264 ? 16'h3804 :  // <0228> pa = x
addr == 16'h265 ? 16'hfba0 :  // <0228> callx  parse_key  x
addr == 16'h266 ? 16'h0259 :  // <0228> "
addr == 16'h267 ? 16'hfc00 :  // <0228> "
addr == 16'h268 ? 16'he00f :  // <0229> jmp :again
addr == 16'h269 ? 16'h025a :  // <0229> "
addr == 16'h26a ? 16'he00f :  // <0230> end_event
addr == 16'h26b ? 16'h00aa :  // <0230> "

// ######## event uart_rx_overflow_handler // = 0x026c
addr == 16'h26c ? 16'ha3a0 :  // <0233> error_halt_code $err_rx_overflow // leds = 0xfffe
addr == 16'h26d ? 16'hfffe :  // <0233> "
addr == 16'h26e ? 16'he00f :  // <0233> error_halt_code $err_rx_overflow
addr == 16'h26f ? 16'h026e :  // <0233> "
addr == 16'h270 ? 16'he00f :  // <0234> end_event
addr == 16'h271 ? 16'h00aa :  // <0234> "

// :tx_overflow_msg // = 0x0272
// "TXO\x0"
addr == 16'h272 ? 16'h5854 :  // <0237> XT
addr == 16'h273 ? 16'h004f :  // <0237>  O

// ######## event uart_tx_overflow_handler // = 0x0274
// error_halt_code $err_tx_overflow
addr == 16'h274 ? 16'he00f :  // <0241> end_event
addr == 16'h275 ? 16'h00aa :  // <0241> "

// ######## event softevent3_handler // = 0x0276
addr == 16'h276 ? 16'he00f :  // <0244> end_event
addr == 16'h277 ? 16'h00aa :  // <0244> "

// ######## event softevent2_handler // = 0x0278
addr == 16'h278 ? 16'he00f :  // <0247> end_event
addr == 16'h279 ? 16'h00aa :  // <0247> "

// ######## event softevent1_handler // = 0x027a
addr == 16'h27a ? 16'he00f :  // <0250> end_event
addr == 16'h27b ? 16'h00aa :  // <0250> "

// ######## event softevent0_handler // = 0x027c
addr == 16'h27c ? 16'he00f :  // <0253> end_event
addr == 16'h27d ? 16'h00aa :  // <0253> "

// ######## event spi_done_handler // = 0x027e
addr == 16'h27e ? 16'he00f :  // <0256> end_event
addr == 16'h27f ? 16'h00aa :  // <0256> "


        
                16'hxxxx;
        endmodule
    
