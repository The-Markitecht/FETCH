
        `include "header.v"

        module sim_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.

//TODO: program that core to tokenize all input conditions.
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
addr == 16'h01 ? 16'h01e0 :  // <0016> "


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




// power relay duty cycles, in microseconds.  duty cycle time = relay OFF time.
// relay actually remains energized for about another 5 us after pwm goes high,
// due to the optocoupler pullup taking some time to climb through the MOSFET's threshold.







addr == 16'h02 ? 16'h0026 :  // <0083> emit_debugger_register_table  counter
// "       a"
addr == 16'h03 ? 16'h2020 :  // <0083>   
addr == 16'h04 ? 16'h2020 :  // <0083>   
addr == 16'h05 ? 16'h2020 :  // <0083>   
addr == 16'h06 ? 16'h6120 :  // <0083> a 
// "       b"
addr == 16'h07 ? 16'h2020 :  // <0083>   
addr == 16'h08 ? 16'h2020 :  // <0083>   
addr == 16'h09 ? 16'h2020 :  // <0083>   
addr == 16'h0a ? 16'h6220 :  // <0083> b 
// "       i"
addr == 16'h0b ? 16'h2020 :  // <0083>   
addr == 16'h0c ? 16'h2020 :  // <0083>   
addr == 16'h0d ? 16'h2020 :  // <0083>   
addr == 16'h0e ? 16'h6920 :  // <0083> i 
// "       j"
addr == 16'h0f ? 16'h2020 :  // <0083>   
addr == 16'h10 ? 16'h2020 :  // <0083>   
addr == 16'h11 ? 16'h2020 :  // <0083>   
addr == 16'h12 ? 16'h6a20 :  // <0083> j 
// "       x"
addr == 16'h13 ? 16'h2020 :  // <0083>   
addr == 16'h14 ? 16'h2020 :  // <0083>   
addr == 16'h15 ? 16'h2020 :  // <0083>   
addr == 16'h16 ? 16'h7820 :  // <0083> x 
// "       y"
addr == 16'h17 ? 16'h2020 :  // <0083>   
addr == 16'h18 ? 16'h2020 :  // <0083>   
addr == 16'h19 ? 16'h2020 :  // <0083>   
addr == 16'h1a ? 16'h7920 :  // <0083> y 
// "      ga"
addr == 16'h1b ? 16'h2020 :  // <0083>   
addr == 16'h1c ? 16'h2020 :  // <0083>   
addr == 16'h1d ? 16'h2020 :  // <0083>   
addr == 16'h1e ? 16'h6167 :  // <0083> ag
// "      gb"
addr == 16'h1f ? 16'h2020 :  // <0083>   
addr == 16'h20 ? 16'h2020 :  // <0083>   
addr == 16'h21 ? 16'h2020 :  // <0083>   
addr == 16'h22 ? 16'h6267 :  // <0083> bg
// "      gc"
addr == 16'h23 ? 16'h2020 :  // <0083>   
addr == 16'h24 ? 16'h2020 :  // <0083>   
addr == 16'h25 ? 16'h2020 :  // <0083>   
addr == 16'h26 ? 16'h6367 :  // <0083> cg
// "      gd"
addr == 16'h27 ? 16'h2020 :  // <0083>   
addr == 16'h28 ? 16'h2020 :  // <0083>   
addr == 16'h29 ? 16'h2020 :  // <0083>   
addr == 16'h2a ? 16'h6467 :  // <0083> dg
// "      ge"
addr == 16'h2b ? 16'h2020 :  // <0083>   
addr == 16'h2c ? 16'h2020 :  // <0083>   
addr == 16'h2d ? 16'h2020 :  // <0083>   
addr == 16'h2e ? 16'h6567 :  // <0083> eg
// "      gf"
addr == 16'h2f ? 16'h2020 :  // <0083>   
addr == 16'h30 ? 16'h2020 :  // <0083>   
addr == 16'h31 ? 16'h2020 :  // <0083>   
addr == 16'h32 ? 16'h6667 :  // <0083> fg
// "      gg"
addr == 16'h33 ? 16'h2020 :  // <0083>   
addr == 16'h34 ? 16'h2020 :  // <0083>   
addr == 16'h35 ? 16'h2020 :  // <0083>   
addr == 16'h36 ? 16'h6767 :  // <0083> gg
// "      gh"
addr == 16'h37 ? 16'h2020 :  // <0083>   
addr == 16'h38 ? 16'h2020 :  // <0083>   
addr == 16'h39 ? 16'h2020 :  // <0083>   
addr == 16'h3a ? 16'h6867 :  // <0083> hg
// "      pa"
addr == 16'h3b ? 16'h2020 :  // <0083>   
addr == 16'h3c ? 16'h2020 :  // <0083>   
addr == 16'h3d ? 16'h2020 :  // <0083>   
addr == 16'h3e ? 16'h6170 :  // <0083> ap
// "      pb"
addr == 16'h3f ? 16'h2020 :  // <0083>   
addr == 16'h40 ? 16'h2020 :  // <0083>   
addr == 16'h41 ? 16'h2020 :  // <0083>   
addr == 16'h42 ? 16'h6270 :  // <0083> bp
// "      pc"
addr == 16'h43 ? 16'h2020 :  // <0083>   
addr == 16'h44 ? 16'h2020 :  // <0083>   
addr == 16'h45 ? 16'h2020 :  // <0083>   
addr == 16'h46 ? 16'h6370 :  // <0083> cp
// "      pd"
addr == 16'h47 ? 16'h2020 :  // <0083>   
addr == 16'h48 ? 16'h2020 :  // <0083>   
addr == 16'h49 ? 16'h2020 :  // <0083>   
addr == 16'h4a ? 16'h6470 :  // <0083> dp
// "//rstk  "
addr == 16'h4b ? 16'h2f2f :  // <0083> //
addr == 16'h4c ? 16'h7372 :  // <0083> sr
addr == 16'h4d ? 16'h6b74 :  // <0083> kt
addr == 16'h4e ? 16'h2020 :  // <0083>   
// "  ev_pri"
addr == 16'h4f ? 16'h2020 :  // <0083>   
addr == 16'h50 ? 16'h7665 :  // <0083> ve
addr == 16'h51 ? 16'h705f :  // <0083> p_
addr == 16'h52 ? 16'h6972 :  // <0083> ir
// "softevnt"
addr == 16'h53 ? 16'h6f73 :  // <0083> os
addr == 16'h54 ? 16'h7466 :  // <0083> tf
addr == 16'h55 ? 16'h7665 :  // <0083> ve
addr == 16'h56 ? 16'h746e :  // <0083> tn
// " stamplo"
addr == 16'h57 ? 16'h7320 :  // <0083> s 
addr == 16'h58 ? 16'h6174 :  // <0083> at
addr == 16'h59 ? 16'h706d :  // <0083> pm
addr == 16'h5a ? 16'h6f6c :  // <0083> ol
// " stamphi"
addr == 16'h5b ? 16'h7320 :  // <0083> s 
addr == 16'h5c ? 16'h6174 :  // <0083> at
addr == 16'h5d ? 16'h706d :  // <0083> pm
addr == 16'h5e ? 16'h6968 :  // <0083> ih
// "stampclo"
addr == 16'h5f ? 16'h7473 :  // <0083> ts
addr == 16'h60 ? 16'h6d61 :  // <0083> ma
addr == 16'h61 ? 16'h6370 :  // <0083> cp
addr == 16'h62 ? 16'h6f6c :  // <0083> ol
// "stampchi"
addr == 16'h63 ? 16'h7473 :  // <0083> ts
addr == 16'h64 ? 16'h6d61 :  // <0083> ma
addr == 16'h65 ? 16'h6370 :  // <0083> cp
addr == 16'h66 ? 16'h6968 :  // <0083> ih
// "ustimer0"
addr == 16'h67 ? 16'h7375 :  // <0083> su
addr == 16'h68 ? 16'h6974 :  // <0083> it
addr == 16'h69 ? 16'h656d :  // <0083> em
addr == 16'h6a ? 16'h3072 :  // <0083> 0r
// "mstimer0"
addr == 16'h6b ? 16'h736d :  // <0083> sm
addr == 16'h6c ? 16'h6974 :  // <0083> it
addr == 16'h6d ? 16'h656d :  // <0083> em
addr == 16'h6e ? 16'h3072 :  // <0083> 0r
// "pwr_duty"
addr == 16'h6f ? 16'h7770 :  // <0083> wp
addr == 16'h70 ? 16'h5f72 :  // <0083> _r
addr == 16'h71 ? 16'h7564 :  // <0083> ud
addr == 16'h72 ? 16'h7974 :  // <0083> yt
// " ignperd"
addr == 16'h73 ? 16'h6920 :  // <0083> i 
addr == 16'h74 ? 16'h6e67 :  // <0083> ng
addr == 16'h75 ? 16'h6570 :  // <0083> ep
addr == 16'h76 ? 16'h6472 :  // <0083> dr
// "igncycnt"
addr == 16'h77 ? 16'h6769 :  // <0083> gi
addr == 16'h78 ? 16'h636e :  // <0083> cn
addr == 16'h79 ? 16'h6379 :  // <0083> cy
addr == 16'h7a ? 16'h746e :  // <0083> tn
// "  pf1cnt"
addr == 16'h7b ? 16'h2020 :  // <0083>   
addr == 16'h7c ? 16'h6670 :  // <0083> fp
addr == 16'h7d ? 16'h6331 :  // <0083> c1
addr == 16'h7e ? 16'h746e :  // <0083> tn
// "  pf1len"
addr == 16'h7f ? 16'h2020 :  // <0083>   
addr == 16'h80 ? 16'h6670 :  // <0083> fp
addr == 16'h81 ? 16'h6c31 :  // <0083> l1
addr == 16'h82 ? 16'h6e65 :  // <0083> ne
// "spi_data"
addr == 16'h83 ? 16'h7073 :  // <0083> ps
addr == 16'h84 ? 16'h5f69 :  // <0083> _i
addr == 16'h85 ? 16'h6164 :  // <0083> ad
addr == 16'h86 ? 16'h6174 :  // <0083> at
// "//cdwrad"
addr == 16'h87 ? 16'h2f2f :  // <0083> //
addr == 16'h88 ? 16'h6463 :  // <0083> dc
addr == 16'h89 ? 16'h7277 :  // <0083> rw
addr == 16'h8a ? 16'h6461 :  // <0083> da
// "//cdwrdt"
addr == 16'h8b ? 16'h2f2f :  // <0083> //
addr == 16'h8c ? 16'h6463 :  // <0083> dc
addr == 16'h8d ? 16'h7277 :  // <0083> rw
addr == 16'h8e ? 16'h7464 :  // <0083> td
// "//uartdt"
addr == 16'h8f ? 16'h2f2f :  // <0083> //
addr == 16'h90 ? 16'h6175 :  // <0083> au
addr == 16'h91 ? 16'h7472 :  // <0083> tr
addr == 16'h92 ? 16'h7464 :  // <0083> td
// "uartstat"
addr == 16'h93 ? 16'h6175 :  // <0083> au
addr == 16'h94 ? 16'h7472 :  // <0083> tr
addr == 16'h95 ? 16'h7473 :  // <0083> ts
addr == 16'h96 ? 16'h7461 :  // <0083> ta
// "    leds"
addr == 16'h97 ? 16'h2020 :  // <0083>   
addr == 16'h98 ? 16'h2020 :  // <0083>   
addr == 16'h99 ? 16'h656c :  // <0083> el
addr == 16'h9a ? 16'h7364 :  // <0083> sd

// error code constants.

// string resources
// :boot_msg // = 0x009b
// "SIM\r\n\x0"
addr == 16'h9b ? 16'h4953 :  // <0091> IS
addr == 16'h9c ? 16'h0d4d :  // <0091>  M
addr == 16'h9d ? 16'h000a :  // <0091>   

// libraries.  set calling convention FIRST to ensure correct assembly of lib funcs.

// event loop.  this infrastructure is assembled directly into the main program, not a func.
// first instruction of an event handler should be the 7th cycle after reading its priority from the event controller here.
// :poll_events // = 0x009e
// initialize prior to polling loop, for minimum latency.
addr == 16'h9e ? 16'h07a0 :  // <0006> b = :event_table
addr == 16'h9f ? 16'h01ed :  // <0006> "
// 3-cycle polling loop.
// :poll_events_again // = 0x00a0
addr == 16'ha0 ? 16'h0013 :  // <0009> a = event_priority
addr == 16'ha1 ? 16'he000 :  // <0010> br 0z :poll_events_again
addr == 16'ha2 ? 16'h00a0 :  // <0010> "
// acknowledge the event to clear its capture register.  do this right away,
// so another occurrence of the same event can be captured right away in the controller.
addr == 16'ha3 ? 16'h4c00 :  // <0013> event_priority = a
// compute an address in the event_table.  note the absence of a wait state for the adder here (not needed).
addr == 16'ha4 ? 16'hd300 :  // <0015> fetch rtna from ad0
addr == 16'ha5 ? 16'hfbb0 :  // <0015> "
// jump to the address given in the event_table.  each handler MUST end with a end_event.
// each handler does NOT need to save ANY registers (e.g. no convention_gpx).  they can all be trashed.
// each handler is passed the event priority in a, in case the same handler is used on multiple priorities.
addr == 16'ha6 ? 16'hfc00 :  // <0019> swapra = nop
// just returned here from the handler, in case the handler accidentally did a rtn.  this should NEVER happen.
addr == 16'ha7 ? 16'h97a0 :  // <0021> error_halt_code 0xffc0 // leds = 0xffc0
addr == 16'ha8 ? 16'hffc0 :  // <0021> "
addr == 16'ha9 ? 16'he00f :  // <0021> error_halt_code 0xffc0
addr == 16'haa ? 16'h00a9 :  // <0021> "


// driver library for synapse316_uart simple async transceiver.






// routine sends out the low byte from a to the UART.  blocks until the FIFO accepts the byte.
// ######## func putchar_fduart // = 0x00ab
addr == 16'hab ? 16'h4804 :  // <0046> push x // func putchar_fduart

addr == 16'hac ? 16'h1000 :  // <0048> x = a

// wait for FIFO to be available.
addr == 16'had ? 16'h0202 :  // <0051> a = $atx_fifo_full_mask
// :pcfduart_wait_for_idle // = 0x00ae
addr == 16'hae ? 16'h0424 :  // <0053> b = fduart_status
addr == 16'haf ? 16'he403 :  // <0054> bn and0z :pcfduart_wait_for_idle
addr == 16'hb0 ? 16'h00ae :  // <0054> "

// push word to the UART.  its low byte is a character.
addr == 16'hb1 ? 16'h8c04 :  // <0057> fduart_data = x
addr == 16'hb2 ? 16'h1012 :  // <0058> pop x // end_func
addr == 16'hb3 ? 16'hfc00 :  // <0057> swapra = nop

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// ######## func getchar_fduart // = 0x00b4
// wait until FIFO is populated.
addr == 16'hb4 ? 16'h0208 :  // <0064> a = $arx_fifo_empty_mask
// :wait_for_busy // = 0x00b5
addr == 16'hb5 ? 16'h0424 :  // <0066> b = fduart_status
addr == 16'hb6 ? 16'he403 :  // <0067> bn and0z :wait_for_busy
addr == 16'hb7 ? 16'h00b5 :  // <0067> "
addr == 16'hb8 ? 16'h0023 :  // <0068> a = fduart_data
addr == 16'hb9 ? 16'hfc00 :  // <0068> swapra = nop

// returns a character in a, or -1 if none.
// ######## func pollchar_fduart // = 0x00ba
// check for FIFO is populated.
addr == 16'hba ? 16'h0208 :  // <0074> a = $arx_fifo_empty_mask
addr == 16'hbb ? 16'h0424 :  // <0075> b = fduart_status
addr == 16'hbc ? 16'he403 :  // <0076> bn and0z :none
addr == 16'hbd ? 16'h00c0 :  // <0076> "
addr == 16'hbe ? 16'h0023 :  // <0077> a = fduart_data
addr == 16'hbf ? 16'hfc00 :  // <0077> swapra = nop
// :none // = 0x00c0
addr == 16'hc0 ? 16'h0360 :  // <0080> a = -1
addr == 16'hc1 ? 16'hfc00 :  // <0080> swapra = nop



// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x00c2
// "0123456789abcdef"
addr == 16'hc2 ? 16'h3130 :  // <0050> 10
addr == 16'hc3 ? 16'h3332 :  // <0050> 32
addr == 16'hc4 ? 16'h3534 :  // <0050> 54
addr == 16'hc5 ? 16'h3736 :  // <0050> 76
addr == 16'hc6 ? 16'h3938 :  // <0050> 98
addr == 16'hc7 ? 16'h6261 :  // <0050> ba
addr == 16'hc8 ? 16'h6463 :  // <0050> dc
addr == 16'hc9 ? 16'h6665 :  // <0050> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// ######## func put4x // = 0x00ca
addr == 16'hca ? 16'h4804 :  // <0054> push x // func put4x
addr == 16'hcb ? 16'h4806 :  // <0054> push ga // "
addr == 16'hcc ? 16'h483e :  // <0054> push rtna // "
addr == 16'hcd ? 16'h13a0 :  // <0055> x = :hexdigits
addr == 16'hce ? 16'h00c2 :  // <0055> "

addr == 16'hcf ? 16'h1800 :  // <0057> ga = a
addr == 16'hd0 ? 16'h07a0 :  // <0058> b = 0xF000
addr == 16'hd1 ? 16'hf000 :  // <0058> "
addr == 16'hd2 ? 16'hc800 :  // <0059> a = and
addr == 16'hd3 ? 16'h0330 :  // <0059> "
addr == 16'hd4 ? 16'h0353 :  // <0060> a = a>>4
addr == 16'hd5 ? 16'h0353 :  // <0061> a = a>>4
addr == 16'hd6 ? 16'h0353 :  // <0062> a = a>>4
addr == 16'hd7 ? 16'hfba0 :  // <0063> call fetch_byte
addr == 16'hd8 ? 16'h0177 :  // <0063> "
addr == 16'hd9 ? 16'hfc00 :  // <0063> "
addr == 16'hda ? 16'hfba0 :  // <0064> putchar a
addr == 16'hdb ? 16'h00ab :  // <0064> "
addr == 16'hdc ? 16'hfc00 :  // <0064> "

addr == 16'hdd ? 16'h0006 :  // <0066> a = ga
addr == 16'hde ? 16'h07a0 :  // <0067> b = 0x0F00
addr == 16'hdf ? 16'h0f00 :  // <0067> "
addr == 16'he0 ? 16'hc800 :  // <0068> a = and
addr == 16'he1 ? 16'h0330 :  // <0068> "
addr == 16'he2 ? 16'h0353 :  // <0069> a = a>>4
addr == 16'he3 ? 16'h0353 :  // <0070> a = a>>4
addr == 16'he4 ? 16'hfba0 :  // <0071> call fetch_byte
addr == 16'he5 ? 16'h0177 :  // <0071> "
addr == 16'he6 ? 16'hfc00 :  // <0071> "
addr == 16'he7 ? 16'hfba0 :  // <0072> putchar a
addr == 16'he8 ? 16'h00ab :  // <0072> "
addr == 16'he9 ? 16'hfc00 :  // <0072> "

addr == 16'hea ? 16'h0006 :  // <0074> a = ga
addr == 16'heb ? 16'h06f0 :  // <0075> b = 0x00F0
addr == 16'hec ? 16'hc800 :  // <0076> a = and
addr == 16'hed ? 16'h0330 :  // <0076> "
addr == 16'hee ? 16'h0353 :  // <0077> a = a>>4
addr == 16'hef ? 16'hfba0 :  // <0078> call fetch_byte
addr == 16'hf0 ? 16'h0177 :  // <0078> "
addr == 16'hf1 ? 16'hfc00 :  // <0078> "
addr == 16'hf2 ? 16'hfba0 :  // <0079> putchar a
addr == 16'hf3 ? 16'h00ab :  // <0079> "
addr == 16'hf4 ? 16'hfc00 :  // <0079> "

addr == 16'hf5 ? 16'h0006 :  // <0081> a = ga
addr == 16'hf6 ? 16'h060f :  // <0082> b = 0x000F
addr == 16'hf7 ? 16'hc800 :  // <0083> a = and
addr == 16'hf8 ? 16'h0330 :  // <0083> "
addr == 16'hf9 ? 16'hfba0 :  // <0084> call fetch_byte
addr == 16'hfa ? 16'h0177 :  // <0084> "
addr == 16'hfb ? 16'hfc00 :  // <0084> "
addr == 16'hfc ? 16'hfba0 :  // <0085> putchar a
addr == 16'hfd ? 16'h00ab :  // <0085> "
addr == 16'hfe ? 16'hfc00 :  // <0085> "

addr == 16'hff ? 16'hf812 :  // <0087> pop rtna // end_func
addr == 16'h100 ? 16'h1812 :  // <0087> pop ga // "
addr == 16'h101 ? 16'h1012 :  // <0087> pop x // "
addr == 16'h102 ? 16'hfc00 :  // <0086> swapra = nop

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// ######## func get4x // = 0x0103
addr == 16'h103 ? 16'h4802 :  // <0091> push i // func get4x
addr == 16'h104 ? 16'h4803 :  // <0091> push j // "
addr == 16'h105 ? 16'h4804 :  // <0091> push x // "
addr == 16'h106 ? 16'h4805 :  // <0091> push y // "
addr == 16'h107 ? 16'h483e :  // <0091> push rtna // "
// y = digit counter
// j = sum
addr == 16'h108 ? 16'h1604 :  // <0094> y = 4
// :again // = 0x0109
addr == 16'h109 ? 16'hfba0 :  // <0096> getchar
addr == 16'h10a ? 16'h00b4 :  // <0096> "
addr == 16'h10b ? 16'hfc00 :  // <0096> "
addr == 16'h10c ? 16'h13a0 :  // <0097> x = :hexdigits
addr == 16'h10d ? 16'h00c2 :  // <0097> "
addr == 16'h10e ? 16'h0a10 :  // <0098> i = 16
addr == 16'h10f ? 16'hfba0 :  // <0099> call :find_in_fetch
addr == 16'h110 ? 16'h018b :  // <0099> "
addr == 16'h111 ? 16'hfc00 :  // <0099> "
addr == 16'h112 ? 16'h0760 :  // <0100> b = -1
addr == 16'h113 ? 16'he007 :  // <0101> br eq :fail
addr == 16'h114 ? 16'h0128 :  // <0101> "
addr == 16'h115 ? 16'h0400 :  // <0102> b = a
addr == 16'h116 ? 16'h0003 :  // <0103> a = j
addr == 16'h117 ? 16'h0352 :  // <0104> a = a<<4
addr == 16'h118 ? 16'hc800 :  // <0105> j = or
addr == 16'h119 ? 16'h0f34 :  // <0105> "
addr == 16'h11a ? 16'h1360 :  // <0106> x = -1
addr == 16'h11b ? 16'hc800 :  // <0107> y = x+y
addr == 16'h11c ? 16'h1720 :  // <0107> "
addr == 16'h11d ? 16'h0005 :  // <0108> a = y
addr == 16'h11e ? 16'he400 :  // <0109> bn az :again
addr == 16'h11f ? 16'h0109 :  // <0109> "
addr == 16'h120 ? 16'h0003 :  // <0110> a = j
addr == 16'h121 ? 16'h0600 :  // <0111> b = 0
addr == 16'h122 ? 16'hf812 :  // <0112> pop rtna // rtn
addr == 16'h123 ? 16'h1412 :  // <0112> pop y // "
addr == 16'h124 ? 16'h1012 :  // <0112> pop x // "
addr == 16'h125 ? 16'h0c12 :  // <0112> pop j // "
addr == 16'h126 ? 16'h0812 :  // <0112> pop i // "
addr == 16'h127 ? 16'hfc00 :  // <0111> swapra = nop
// :fail // = 0x0128
addr == 16'h128 ? 16'h0760 :  // <0114> b = -1
addr == 16'h129 ? 16'hf812 :  // <0115> pop rtna // end_func
addr == 16'h12a ? 16'h1412 :  // <0115> pop y // "
addr == 16'h12b ? 16'h1012 :  // <0115> pop x // "
addr == 16'h12c ? 16'h0c12 :  // <0115> pop j // "
addr == 16'h12d ? 16'h0812 :  // <0115> pop i // "
addr == 16'h12e ? 16'hfc00 :  // <0114> swapra = nop

// print a fixed-length string from packed words in program space.
// pass its word address (not its byte address) in a,  its length (bytes) in b.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_fixed // = 0x012f
addr == 16'h12f ? 16'h4802 :  // <0121> push i // func print_fixed
addr == 16'h130 ? 16'h4803 :  // <0121> push j // "
addr == 16'h131 ? 16'h4804 :  // <0121> push x // "
addr == 16'h132 ? 16'h4805 :  // <0121> push y // "
addr == 16'h133 ? 16'h4806 :  // <0121> push ga // "
addr == 16'h134 ? 16'h483e :  // <0121> push rtna // "
addr == 16'h135 ? 16'h0800 :  // <0122> i = a
addr == 16'h136 ? 16'h0e01 :  // <0123> j = 1
addr == 16'h137 ? 16'h1001 :  // <0124> x = b
addr == 16'h138 ? 16'h1760 :  // <0125> y = -1
// :next_word // = 0x0139
addr == 16'h139 ? 16'he002 :  // <0127> br xz :done
addr == 16'h13a ? 16'h014f :  // <0127> "
addr == 16'h13b ? 16'h1320 :  // <0128> x = ad2
addr == 16'h13c ? 16'hd002 :  // <0129> fetch ga from i
addr == 16'h13d ? 16'h1bb0 :  // <0129> "
// now x = bytes remaining, i = current word address, ga = data word.
addr == 16'h13e ? 16'h0006 :  // <0131> a = ga // putchar ga
addr == 16'h13f ? 16'hfba0 :  // <0131> putchar ga
addr == 16'h140 ? 16'h00ab :  // <0131> "
addr == 16'h141 ? 16'hfc00 :  // <0131> "
addr == 16'h142 ? 16'he002 :  // <0132> br xz :done
addr == 16'h143 ? 16'h014f :  // <0132> "
addr == 16'h144 ? 16'h1320 :  // <0133> x = ad2
addr == 16'h145 ? 16'h0006 :  // <0134> a = ga
addr == 16'h146 ? 16'h0353 :  // <0135> a = a>>4
addr == 16'h147 ? 16'h0353 :  // <0136> a = a>>4
addr == 16'h148 ? 16'hfba0 :  // <0137> putchar a
addr == 16'h149 ? 16'h00ab :  // <0137> "
addr == 16'h14a ? 16'hfc00 :  // <0137> "
addr == 16'h14b ? 16'hc800 :  // <0138> i = i+j
addr == 16'h14c ? 16'h0b10 :  // <0138> "
addr == 16'h14d ? 16'he00f :  // <0139> jmp :next_word
addr == 16'h14e ? 16'h0139 :  // <0139> "
// :done // = 0x014f
addr == 16'h14f ? 16'hf812 :  // <0141> pop rtna // end_func
addr == 16'h150 ? 16'h1812 :  // <0141> pop ga // "
addr == 16'h151 ? 16'h1412 :  // <0141> pop y // "
addr == 16'h152 ? 16'h1012 :  // <0141> pop x // "
addr == 16'h153 ? 16'h0c12 :  // <0141> pop j // "
addr == 16'h154 ? 16'h0812 :  // <0141> pop i // "
addr == 16'h155 ? 16'hfc00 :  // <0140> swapra = nop

// print a null-terminated string from packed words in program space.
// pass its word address (not its byte address) in a.
// string must start on a word boundary.
// no newline or other delimiter is added automatically.
// ######## func print_nt // = 0x0156
addr == 16'h156 ? 16'h4802 :  // <0147> push i // func print_nt
addr == 16'h157 ? 16'h4803 :  // <0147> push j // "
addr == 16'h158 ? 16'h4804 :  // <0147> push x // "
addr == 16'h159 ? 16'h483e :  // <0147> push rtna // "
addr == 16'h15a ? 16'h0800 :  // <0148> i = a
addr == 16'h15b ? 16'h0e01 :  // <0149> j = 1
// :next_word // = 0x015c
addr == 16'h15c ? 16'hd002 :  // <0151> fetch x from i
addr == 16'h15d ? 16'h13b0 :  // <0151> "
// now i = current word address, x = data word, b = low byte mask, a = data byte.
addr == 16'h15e ? 16'h0004 :  // <0153> a = x
addr == 16'h15f ? 16'h06ff :  // <0154> b = 0xff
addr == 16'h160 ? 16'he003 :  // <0155> br and0z :done
addr == 16'h161 ? 16'h0172 :  // <0155> "
addr == 16'h162 ? 16'hfba0 :  // <0156> putchar a
addr == 16'h163 ? 16'h00ab :  // <0156> "
addr == 16'h164 ? 16'hfc00 :  // <0156> "
addr == 16'h165 ? 16'h0004 :  // <0157> a = x
addr == 16'h166 ? 16'h0353 :  // <0158> a = a>>4
addr == 16'h167 ? 16'h0353 :  // <0159> a = a>>4
addr == 16'h168 ? 16'h06ff :  // <0160> b = 0xff
addr == 16'h169 ? 16'he003 :  // <0161> br and0z :done
addr == 16'h16a ? 16'h0172 :  // <0161> "
addr == 16'h16b ? 16'hfba0 :  // <0162> putchar a
addr == 16'h16c ? 16'h00ab :  // <0162> "
addr == 16'h16d ? 16'hfc00 :  // <0162> "
addr == 16'h16e ? 16'hc800 :  // <0163> i = i+j
addr == 16'h16f ? 16'h0b10 :  // <0163> "
addr == 16'h170 ? 16'he00f :  // <0164> jmp :next_word
addr == 16'h171 ? 16'h015c :  // <0164> "
// :done // = 0x0172
addr == 16'h172 ? 16'hf812 :  // <0166> pop rtna // end_func
addr == 16'h173 ? 16'h1012 :  // <0166> pop x // "
addr == 16'h174 ? 16'h0c12 :  // <0166> pop j // "
addr == 16'h175 ? 16'h0812 :  // <0166> pop i // "
addr == 16'h176 ? 16'hfc00 :  // <0165> swapra = nop


// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// ######## func fetch_byte // = 0x0177
addr == 16'h177 ? 16'h0601 :  // <0005> b = 1
addr == 16'h178 ? 16'he003 :  // <0006> br and0z :pick_byte_even
addr == 16'h179 ? 16'h0182 :  // <0006> "
addr == 16'h17a ? 16'h0350 :  // <0007> a = a>>1
addr == 16'h17b ? 16'h0404 :  // <0008> b = x
addr == 16'h17c ? 16'hc800 :  // <0009> fetch a from a+b
addr == 16'h17d ? 16'hd300 :  // <0009> "
addr == 16'h17e ? 16'h03b0 :  // <0009> "
addr == 16'h17f ? 16'h0353 :  // <0010> a = a>>4
addr == 16'h180 ? 16'h0353 :  // <0011> a = a>>4
addr == 16'h181 ? 16'hfc00 :  // <0011> swapra = nop
// :pick_byte_even // = 0x0182
addr == 16'h182 ? 16'h0350 :  // <0014> a = a>>1
addr == 16'h183 ? 16'h0404 :  // <0015> b = x
addr == 16'h184 ? 16'hc800 :  // <0016> fetch a from a+b
addr == 16'h185 ? 16'hd300 :  // <0016> "
addr == 16'h186 ? 16'h03b0 :  // <0016> "
addr == 16'h187 ? 16'h06ff :  // <0017> b = 0xff
addr == 16'h188 ? 16'hc800 :  // <0018> a = and
addr == 16'h189 ? 16'h0330 :  // <0018> "
addr == 16'h18a ? 16'hfc00 :  // <0018> swapra = nop

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// ######## func find_in_fetch // = 0x018b
addr == 16'h18b ? 16'h4802 :  // <0027> push i // func find_in_fetch
addr == 16'h18c ? 16'h4803 :  // <0027> push j // "
addr == 16'h18d ? 16'h4805 :  // <0027> push y // "
addr == 16'h18e ? 16'h483e :  // <0027> push rtna // "
addr == 16'h18f ? 16'h1400 :  // <0028> y = a
addr == 16'h190 ? 16'h0f60 :  // <0029> j = -1
// :again // = 0x0191
addr == 16'h191 ? 16'he001 :  // <0031> br iz :fail
addr == 16'h192 ? 16'h01a1 :  // <0031> "
addr == 16'h193 ? 16'h0b10 :  // <0032> i = ad1
addr == 16'h194 ? 16'h0002 :  // <0033> a = i
addr == 16'h195 ? 16'hfba0 :  // <0034> call :fetch_byte
addr == 16'h196 ? 16'h0177 :  // <0034> "
addr == 16'h197 ? 16'hfc00 :  // <0034> "
addr == 16'h198 ? 16'h0405 :  // <0035> b = y
addr == 16'h199 ? 16'he407 :  // <0036> bn eq :again
addr == 16'h19a ? 16'h0191 :  // <0036> "
// :found // = 0x019b
addr == 16'h19b ? 16'h0002 :  // <0038> a = i
addr == 16'h19c ? 16'hf812 :  // <0039> pop rtna // rtn
addr == 16'h19d ? 16'h1412 :  // <0039> pop y // "
addr == 16'h19e ? 16'h0c12 :  // <0039> pop j // "
addr == 16'h19f ? 16'h0812 :  // <0039> pop i // "
addr == 16'h1a0 ? 16'hfc00 :  // <0038> swapra = nop
// :fail // = 0x01a1
addr == 16'h1a1 ? 16'h0360 :  // <0041> a = -1
addr == 16'h1a2 ? 16'hf812 :  // <0042> pop rtna // end_func
addr == 16'h1a3 ? 16'h1412 :  // <0042> pop y // "
addr == 16'h1a4 ? 16'h0c12 :  // <0042> pop j // "
addr == 16'h1a5 ? 16'h0812 :  // <0042> pop i // "
addr == 16'h1a6 ? 16'hfc00 :  // <0041> swapra = nop




// ######## func fletcher16_init // = 0x01a7

addr == 16'h1a7 ? 16'h4200 :  // <0005> $fletcher_sum1_reg = 0
addr == 16'h1a8 ? 16'h4600 :  // <0006> $fletcher_sum2_reg = 0

addr == 16'h1a9 ? 16'hfc00 :  // <0008> swapra = nop

// return the modulus(255) of a given number.
// ######## func mod255 // = 0x01aa

// while a is greater than 254, subtract 255.
// :mod255_again // = 0x01aa
addr == 16'h1aa ? 16'h06fe :  // <0013> b = 0xfe
addr == 16'h1ab ? 16'he006 :  // <0014> br gt :mod255_greater
addr == 16'h1ac ? 16'h01ae :  // <0014> "
addr == 16'h1ad ? 16'hfc00 :  // <0014> swapra = nop
// :mod255_greater // = 0x01ae
addr == 16'h1ae ? 16'h07a0 :  // <0017> b = ([negate 0xfe])
addr == 16'h1af ? 16'hff02 :  // <0017> "
addr == 16'h1b0 ? 16'hc800 :  // <0018> a = a+b
addr == 16'h1b1 ? 16'h0300 :  // <0018> "
addr == 16'h1b2 ? 16'he00f :  // <0019> jmp :mod255_again
addr == 16'h1b3 ? 16'h01aa :  // <0019> "

addr == 16'h1b4 ? 16'hfc00 :  // <0021> swapra = nop

// accumulate a Fletcher16 checksum, given the next byte of data.
// ######## func fletcher16_input8 // = 0x01b5
addr == 16'h1b5 ? 16'h483e :  // <0030> push rtna // func fletcher16_input8

addr == 16'h1b6 ? 16'h0410 :  // <0024> b = $fletcher_sum1_reg
addr == 16'h1b7 ? 16'hc800 :  // <0025> a = a+b
addr == 16'h1b8 ? 16'h0300 :  // <0025> "
addr == 16'h1b9 ? 16'hfba0 :  // <0025> callx mod255  a+b  $fletcher_sum1_reg
addr == 16'h1ba ? 16'h01aa :  // <0025> "
addr == 16'h1bb ? 16'hfc00 :  // <0025> "
addr == 16'h1bc ? 16'h4000 :  // <0025> pc = a

addr == 16'h1bd ? 16'h0010 :  // <0027> a = $fletcher_sum1_reg
addr == 16'h1be ? 16'h0411 :  // <0028> b = $fletcher_sum2_reg
addr == 16'h1bf ? 16'hc800 :  // <0029> a = a+b
addr == 16'h1c0 ? 16'h0300 :  // <0029> "
addr == 16'h1c1 ? 16'hfba0 :  // <0029> callx mod255  a+b  $fletcher_sum2_reg
addr == 16'h1c2 ? 16'h01aa :  // <0029> "
addr == 16'h1c3 ? 16'hfc00 :  // <0029> "
addr == 16'h1c4 ? 16'h4400 :  // <0029> pd = a

addr == 16'h1c5 ? 16'hf812 :  // <0031> pop rtna // func fletcher16_input8
addr == 16'h1c6 ? 16'hfc00 :  // <0031> swapra = nop

// accumulate a Fletcher16 checksum, given the next word of data.
// ######## func fletcher16_input16 // = 0x01c7
addr == 16'h1c7 ? 16'h4802 :  // <0039> push i // func fletcher16_input16
addr == 16'h1c8 ? 16'h483e :  // <0039> push rtna // "

addr == 16'h1c9 ? 16'h0b53 :  // <0034> i = a>>4
addr == 16'h1ca ? 16'h06ff :  // <0035> b = 0xff
addr == 16'h1cb ? 16'hc800 :  // <0036> a = and
addr == 16'h1cc ? 16'h0330 :  // <0036> "
addr == 16'h1cd ? 16'hfba0 :  // <0036> callx fletcher16_input8  and
addr == 16'h1ce ? 16'h01b5 :  // <0036> "
addr == 16'h1cf ? 16'hfc00 :  // <0036> "
addr == 16'h1d0 ? 16'h0002 :  // <0037> a = i
addr == 16'h1d1 ? 16'h0353 :  // <0038> a = a>>4
addr == 16'h1d2 ? 16'hfba0 :  // <0038> callx fletcher16_input8  a>>4
addr == 16'h1d3 ? 16'h01b5 :  // <0038> "
addr == 16'h1d4 ? 16'hfc00 :  // <0038> "

addr == 16'h1d5 ? 16'hf812 :  // <0040> pop rtna // func fletcher16_input16
addr == 16'h1d6 ? 16'h0812 :  // <0040> pop i // "
addr == 16'h1d7 ? 16'hfc00 :  // <0040> swapra = nop

// return the combined 16-bit result of Fletcher16 checksum.
// ######## func fletcher16_result // = 0x01d8

addr == 16'h1d8 ? 16'h0011 :  // <0043> a = $fletcher_sum2_reg
addr == 16'h1d9 ? 16'h0352 :  // <0044> a = a<<4
addr == 16'h1da ? 16'h0352 :  // <0045> a = a<<4
addr == 16'h1db ? 16'h0410 :  // <0046> b = $fletcher_sum1_reg
addr == 16'h1dc ? 16'hc800 :  // <0047> result = or
addr == 16'h1dd ? 16'h0334 :  // <0047> "
addr == 16'h1de ? 16'hfc00 :  // <0046> swapra = nop

addr == 16'h1df ? 16'hfc00 :  // <0049> swapra = nop



// #########################################################################
// :main // = 0x01e0
addr == 16'h1e0 ? 16'h03a0 :  // <0105> a = :boot_msg
addr == 16'h1e1 ? 16'h009b :  // <0105> "
addr == 16'h1e2 ? 16'hfba0 :  // <0106> call :print_nt
addr == 16'h1e3 ? 16'h0156 :  // <0106> "
addr == 16'h1e4 ? 16'hfc00 :  // <0106> "

// keep the real hardware occupied and powered up during testing.
addr == 16'h1e5 ? 16'h6e19 :  // <0109> power_duty = $power_duty_holding

// set up an engine running state.
addr == 16'h1e6 ? 16'h73a0 :  // <0112> ign_period = 700
addr == 16'h1e7 ? 16'h02bc :  // <0112> "

// start handling events.
addr == 16'h1e8 ? 16'h53a0 :  // <0115> soft_event = $event_controller_reset_mask
addr == 16'h1e9 ? 16'h8000 :  // <0115> "
addr == 16'h1ea ? 16'h5200 :  // <0116> soft_event = 0
addr == 16'h1eb ? 16'he00f :  // <0117> jmp :poll_events
addr == 16'h1ec ? 16'h009e :  // <0117> "

// event table;  begins with a null handler because that's the event 0 position, the MOST URGENT position.
// event 0 not used in this app anyway.
// :event_table // = 0x01ed
addr == 16'h1ed ? 16'h009e :  // <0122> ([label :poll_events])
addr == 16'h1ee ? 16'h01f9 :  // <0123> ([label :puff1_capture_handler])
addr == 16'h1ef ? 16'h0215 :  // <0124> ([label :ustimer0_handler])
addr == 16'h1f0 ? 16'h023e :  // <0125> ([label :spi_done_handler])
addr == 16'h1f1 ? 16'h0217 :  // <0126> ([label :mstimer0_handler])
addr == 16'h1f2 ? 16'h021a :  // <0127> ([label :uart_rx_handler])
addr == 16'h1f3 ? 16'h022c :  // <0128> ([label :uart_rx_overflow_handler])
addr == 16'h1f4 ? 16'h0234 :  // <0129> ([label :uart_tx_overflow_handler])
addr == 16'h1f5 ? 16'h0236 :  // <0130> ([label :softevent3_handler])
addr == 16'h1f6 ? 16'h0238 :  // <0131> ([label :softevent2_handler])
addr == 16'h1f7 ? 16'h023a :  // <0132> ([label :softevent1_handler])
addr == 16'h1f8 ? 16'h023c :  // <0133> ([label :softevent0_handler])

// #########################################################################

// ######## event puff1_capture_handler // = 0x01f9
addr == 16'h1f9 ? 16'h001e :  // <0138> a = puff1cnt
addr == 16'h1fa ? 16'h0353 :  // <0139> a = a>>4

addr == 16'h1fb ? 16'h0000 :  // <0147> a = a
addr == 16'h1fc ? 16'h0600 :  // <0147> b = 0

addr == 16'h1fd ? 16'he407 :  // <0140> bn eq :else_509
addr == 16'h1fe ? 16'h0213 :  // <0140> "

addr == 16'h1ff ? 16'h001e :  // <0141> a = puff1cnt
addr == 16'h200 ? 16'hfba0 :  // <0142> call put4x
addr == 16'h201 ? 16'h00ca :  // <0142> "
addr == 16'h202 ? 16'hfc00 :  // <0142> "
addr == 16'h203 ? 16'h0220 :  // <0143> a = 32 // putasc { }
addr == 16'h204 ? 16'hfba0 :  // <0143> putasc { }
addr == 16'h205 ? 16'h00ab :  // <0143> "
addr == 16'h206 ? 16'hfc00 :  // <0143> "
addr == 16'h207 ? 16'h001f :  // <0144> a = puff1len
addr == 16'h208 ? 16'hfba0 :  // <0145> call put4x
addr == 16'h209 ? 16'h00ca :  // <0145> "
addr == 16'h20a ? 16'hfc00 :  // <0145> "
addr == 16'h20b ? 16'h020d :  // <0146> a = 13 // puteol
addr == 16'h20c ? 16'hfba0 :  // <0146> puteol
addr == 16'h20d ? 16'h00ab :  // <0146> "
addr == 16'h20e ? 16'hfc00 :  // <0146> "
addr == 16'h20f ? 16'h020a :  // <0146> a = 10 // puteol
addr == 16'h210 ? 16'hfba0 :  // <0146> puteol
addr == 16'h211 ? 16'h00ab :  // <0146> "
addr == 16'h212 ? 16'hfc00 :  // <0146> "

addr == 16'h213 ? 16'he00f :  // <0148> end_event
addr == 16'h214 ? 16'h009e :  // <0148> "

// ######## event ustimer0_handler // = 0x0215
addr == 16'h215 ? 16'he00f :  // <0151> end_event
addr == 16'h216 ? 16'h009e :  // <0151> "

// ######## event mstimer0_handler // = 0x0217
addr == 16'h217 ? 16'he00f :  // <0154> end_event
addr == 16'h218 ? 16'h009e :  // <0154> "

// ######## func parse_key // = 0x0219


addr == 16'h219 ? 16'hfc00 :  // <0158> swapra = nop

// ######## event uart_rx_handler // = 0x021a
// :again // = 0x021a
addr == 16'h21a ? 16'hfba0 :  // <0161> pollchar
addr == 16'h21b ? 16'h00ba :  // <0161> "
addr == 16'h21c ? 16'hfc00 :  // <0161> "
addr == 16'h21d ? 16'h1000 :  // <0162> x = a

addr == 16'h21e ? 16'h0004 :  // <0165> a = x
addr == 16'h21f ? 16'h0760 :  // <0165> b = -1

addr == 16'h220 ? 16'he407 :  // <0163> bn eq :else_544
addr == 16'h221 ? 16'h0224 :  // <0163> "

addr == 16'h222 ? 16'he00f :  // <0164> event_return
addr == 16'h223 ? 16'h009e :  // <0164> "

addr == 16'h224 ? 16'h3804 :  // <0166> pa = x
addr == 16'h225 ? 16'hfba0 :  // <0166> callx  parse_key  x
addr == 16'h226 ? 16'h0219 :  // <0166> "
addr == 16'h227 ? 16'hfc00 :  // <0166> "
addr == 16'h228 ? 16'he00f :  // <0167> jmp :again
addr == 16'h229 ? 16'h021a :  // <0167> "
addr == 16'h22a ? 16'he00f :  // <0168> end_event
addr == 16'h22b ? 16'h009e :  // <0168> "

// ######## event uart_rx_overflow_handler // = 0x022c
addr == 16'h22c ? 16'h97a0 :  // <0171> error_halt_code $err_rx_overflow // leds = 0xfffe
addr == 16'h22d ? 16'hfffe :  // <0171> "
addr == 16'h22e ? 16'he00f :  // <0171> error_halt_code $err_rx_overflow
addr == 16'h22f ? 16'h022e :  // <0171> "
addr == 16'h230 ? 16'he00f :  // <0172> end_event
addr == 16'h231 ? 16'h009e :  // <0172> "

// :tx_overflow_msg // = 0x0232
// "TXO\x0"
addr == 16'h232 ? 16'h5854 :  // <0175> XT
addr == 16'h233 ? 16'h004f :  // <0175>  O

// ######## event uart_tx_overflow_handler // = 0x0234
// error_halt_code $err_tx_overflow
addr == 16'h234 ? 16'he00f :  // <0179> end_event
addr == 16'h235 ? 16'h009e :  // <0179> "

// ######## event softevent3_handler // = 0x0236
addr == 16'h236 ? 16'he00f :  // <0182> end_event
addr == 16'h237 ? 16'h009e :  // <0182> "

// ######## event softevent2_handler // = 0x0238
addr == 16'h238 ? 16'he00f :  // <0185> end_event
addr == 16'h239 ? 16'h009e :  // <0185> "

// ######## event softevent1_handler // = 0x023a
addr == 16'h23a ? 16'he00f :  // <0188> end_event
addr == 16'h23b ? 16'h009e :  // <0188> "

// ######## event softevent0_handler // = 0x023c
addr == 16'h23c ? 16'he00f :  // <0191> end_event
addr == 16'h23d ? 16'h009e :  // <0191> "

// ######## event spi_done_handler // = 0x023e
addr == 16'h23e ? 16'he00f :  // <0194> end_event
addr == 16'h23f ? 16'h009e :  // <0194> "


        
                16'hxxxx;
        endmodule
    
