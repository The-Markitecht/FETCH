
        `include "header.v"

        module target_program (
            input wire[15:0] addr
            ,output wire[15:0] data
        );
            assign data = 
    
// #########################################################################
// assembly source code.
// to write some data on the UART.

// register file configuration

// application-specific register aliases.


// all Avalon addresses are BYTE addresses.  all Avalon sizes are in BYTES.
// SDRAM notes:
// - all addresses are BYTE addresses.  all must be divisible by 2, because this
// system only supports 16-bit word accesses.  writes to an odd-numbered address
// will be forced to the word boundary instead, overwriting data there.



// I/O expansion bus.




addr == 16'h00 ? 16'he00f :  // <0058> jmp :main
addr == 16'h01 ? 16'h0182 :  // <0058> "

// register names for use by debugger.
addr == 16'h02 ? 16'h0015 :  // <0061> ($counter + 1)
// "       a"
addr == 16'h03 ? 16'h2020 :  // <0062>   
addr == 16'h04 ? 16'h2020 :  // <0062>   
addr == 16'h05 ? 16'h2020 :  // <0062>   
addr == 16'h06 ? 16'h6120 :  // <0062> a 
// "       b"
addr == 16'h07 ? 16'h2020 :  // <0063>   
addr == 16'h08 ? 16'h2020 :  // <0063>   
addr == 16'h09 ? 16'h2020 :  // <0063>   
addr == 16'h0a ? 16'h6220 :  // <0063> b 
// "       i"
addr == 16'h0b ? 16'h2020 :  // <0064>   
addr == 16'h0c ? 16'h2020 :  // <0064>   
addr == 16'h0d ? 16'h2020 :  // <0064>   
addr == 16'h0e ? 16'h6920 :  // <0064> i 
// "       j"
addr == 16'h0f ? 16'h2020 :  // <0065>   
addr == 16'h10 ? 16'h2020 :  // <0065>   
addr == 16'h11 ? 16'h2020 :  // <0065>   
addr == 16'h12 ? 16'h6a20 :  // <0065> j 
// "       x"
addr == 16'h13 ? 16'h2020 :  // <0066>   
addr == 16'h14 ? 16'h2020 :  // <0066>   
addr == 16'h15 ? 16'h2020 :  // <0066>   
addr == 16'h16 ? 16'h7820 :  // <0066> x 
// "       y"
addr == 16'h17 ? 16'h2020 :  // <0067>   
addr == 16'h18 ? 16'h2020 :  // <0067>   
addr == 16'h19 ? 16'h2020 :  // <0067>   
addr == 16'h1a ? 16'h7920 :  // <0067> y 
// "      g6"
addr == 16'h1b ? 16'h2020 :  // <0068>   
addr == 16'h1c ? 16'h2020 :  // <0068>   
addr == 16'h1d ? 16'h2020 :  // <0068>   
addr == 16'h1e ? 16'h3667 :  // <0068> 6g
// "      g7"
addr == 16'h1f ? 16'h2020 :  // <0069>   
addr == 16'h20 ? 16'h2020 :  // <0069>   
addr == 16'h21 ? 16'h2020 :  // <0069>   
addr == 16'h22 ? 16'h3767 :  // <0069> 7g
// "//  rstk"
addr == 16'h23 ? 16'h2f2f :  // <0070> //
addr == 16'h24 ? 16'h2020 :  // <0070>   
addr == 16'h25 ? 16'h7372 :  // <0070> sr
addr == 16'h26 ? 16'h6b74 :  // <0070> kt
// "//adcctl"
addr == 16'h27 ? 16'h2f2f :  // <0071> //
addr == 16'h28 ? 16'h6461 :  // <0071> da
addr == 16'h29 ? 16'h6363 :  // <0071> cc
addr == 16'h2a ? 16'h6c74 :  // <0071> lt
// "  ev_pri"
addr == 16'h2b ? 16'h2020 :  // <0072>   
addr == 16'h2c ? 16'h7665 :  // <0072> ve
addr == 16'h2d ? 16'h705f :  // <0072> p_
addr == 16'h2e ? 16'h6972 :  // <0072> ir
// " timer_0"
addr == 16'h2f ? 16'h7420 :  // <0073> t 
addr == 16'h30 ? 16'h6d69 :  // <0073> mi
addr == 16'h31 ? 16'h7265 :  // <0073> re
addr == 16'h32 ? 16'h305f :  // <0073> 0_
// "av_wr_dt"
addr == 16'h33 ? 16'h7661 :  // <0074> va
addr == 16'h34 ? 16'h775f :  // <0074> w_
addr == 16'h35 ? 16'h5f72 :  // <0074> _r
addr == 16'h36 ? 16'h7464 :  // <0074> td
// "//avrddt"
addr == 16'h37 ? 16'h2f2f :  // <0075> //
addr == 16'h38 ? 16'h7661 :  // <0075> va
addr == 16'h39 ? 16'h6472 :  // <0075> dr
addr == 16'h3a ? 16'h7464 :  // <0075> td
// "av_ad_hi"
addr == 16'h3b ? 16'h7661 :  // <0076> va
addr == 16'h3c ? 16'h615f :  // <0076> a_
addr == 16'h3d ? 16'h5f64 :  // <0076> _d
addr == 16'h3e ? 16'h6968 :  // <0076> ih
// "av_ad_lo"
addr == 16'h3f ? 16'h7661 :  // <0077> va
addr == 16'h40 ? 16'h615f :  // <0077> a_
addr == 16'h41 ? 16'h5f64 :  // <0077> _d
addr == 16'h42 ? 16'h6f6c :  // <0077> ol
// "//uartdt"
addr == 16'h43 ? 16'h2f2f :  // <0078> //
addr == 16'h44 ? 16'h6175 :  // <0078> au
addr == 16'h45 ? 16'h7472 :  // <0078> tr
addr == 16'h46 ? 16'h7464 :  // <0078> td
// "uartstat"
addr == 16'h47 ? 16'h6175 :  // <0079> au
addr == 16'h48 ? 16'h7472 :  // <0079> tr
addr == 16'h49 ? 16'h7473 :  // <0079> ts
addr == 16'h4a ? 16'h7461 :  // <0079> ta
// "softevnt"
addr == 16'h4b ? 16'h6f73 :  // <0080> os
addr == 16'h4c ? 16'h7466 :  // <0080> tf
addr == 16'h4d ? 16'h7665 :  // <0080> ve
addr == 16'h4e ? 16'h746e :  // <0080> tn
// "exp_data"
addr == 16'h4f ? 16'h7865 :  // <0081> xe
addr == 16'h50 ? 16'h5f70 :  // <0081> _p
addr == 16'h51 ? 16'h6164 :  // <0081> ad
addr == 16'h52 ? 16'h6174 :  // <0081> at
// "exp_addr"
addr == 16'h53 ? 16'h7865 :  // <0082> xe
addr == 16'h54 ? 16'h5f70 :  // <0082> _p
addr == 16'h55 ? 16'h6461 :  // <0082> da
addr == 16'h56 ? 16'h7264 :  // <0082> rd

// libraries

// driver library for synapse316_uart simple async transceiver.






// routine sends out the low byte from a to the UART.  blocks until the FIFO accepts the byte.
// func putchar_fduart // = 0x0057
addr == 16'h57 ? 16'h2004 :  // <0044> push x // func putchar_fduart

addr == 16'h58 ? 16'h1000 :  // <0046> x = a

// wait for FIFO to be available.
addr == 16'h59 ? 16'h0202 :  // <0049> a = $atx_fifo_full_mask
// :pcfduart_wait_for_idle // = 0x005a
addr == 16'h5a ? 16'h0411 :  // <0051> b = fduart_status
addr == 16'h5b ? 16'he403 :  // <0052> bn and0z :pcfduart_wait_for_idle
addr == 16'h5c ? 16'h005a :  // <0052> "

// push word to the UART.  its low byte is a character.
addr == 16'h5d ? 16'h4004 :  // <0055> fduart_data = x
addr == 16'h5e ? 16'h1008 :  // <0056> pop x // rtn
addr == 16'h5f ? 16'hfc00 :  // <0056> rtn

// routine receives a byte from the UART.  blocks until the UART receives the byte.
// returns it in the low byte of a.
// func getchar_fduart // = 0x0060
// wait until FIFO is populated.
addr == 16'h60 ? 16'h0208 :  // <0062> a = $arx_fifo_empty_mask
// :wait_for_busy // = 0x0061
addr == 16'h61 ? 16'h0411 :  // <0064> b = fduart_status
addr == 16'h62 ? 16'he403 :  // <0065> bn and0z :wait_for_busy
addr == 16'h63 ? 16'h0061 :  // <0065> "
addr == 16'h64 ? 16'h0010 :  // <0066> a = fduart_data
addr == 16'h65 ? 16'hfc00 :  // <0067> rtn

// returns a character in a, or -1 if none.
// func pollchar_fduart // = 0x0066
// check for FIFO is populated.
addr == 16'h66 ? 16'h0208 :  // <0072> a = $arx_fifo_empty_mask
addr == 16'h67 ? 16'h0411 :  // <0073> b = fduart_status
addr == 16'h68 ? 16'he403 :  // <0074> bn and0z :none
addr == 16'h69 ? 16'h006c :  // <0074> "
addr == 16'h6a ? 16'h0010 :  // <0075> a = fduart_data
addr == 16'h6b ? 16'hfc00 :  // <0076> rtn
// :none // = 0x006c
addr == 16'h6c ? 16'h0360 :  // <0078> a = -1
addr == 16'h6d ? 16'hfc00 :  // <0079> rtn



// bit-bang a complete SPI transaction.
// pass mo data in a, transaction width (# of bits) in b.
// returns mi data in a
// func spi_exchange // = 0x006e
addr == 16'h6e ? 16'h2002 :  // <0005> push i // func spi_exchange
addr == 16'h6f ? 16'h2003 :  // <0005> push j // "
addr == 16'h70 ? 16'h2004 :  // <0005> push x // "
addr == 16'h71 ? 16'h2005 :  // <0005> push y // "
addr == 16'h72 ? 16'h2006 :  // <0005> push g6 // "
addr == 16'h73 ? 16'h2007 :  // <0005> push g7 // "
// keeping mo data in g6, mi data in g7.
addr == 16'h74 ? 16'h1800 :  // <0007> g6 = a
addr == 16'h75 ? 16'h1e00 :  // <0008> g7 = 0
// keeping bit counter in i.
addr == 16'h76 ? 16'h0801 :  // <0010> i = b
addr == 16'h77 ? 16'h0f60 :  // <0011> j = -1
addr == 16'h78 ? 16'h1760 :  // <0012> y = -1
// :next_bit // = 0x0079
// output the msb of mo, along with a low clock phase and low csn.
addr == 16'h79 ? 16'h0006 :  // <0015> a = g6
addr == 16'h7a ? 16'h0350 :  // <0016> a = a>>1
addr == 16'h7b ? 16'h0350 :  // <0017> a = a>>1
addr == 16'h7c ? 16'h0350 :  // <0018> a = a>>1
addr == 16'h7d ? 16'h0353 :  // <0019> a = a>>4
addr == 16'h7e ? 16'h0353 :  // <0020> a = a>>4
addr == 16'h7f ? 16'h0353 :  // <0021> a = a>>4
addr == 16'h80 ? 16'h2c00 :  // <0022> de0nano_adc_ctrl = a
// wait about 500 ns (for about 1 Mhz sck) assuming 50 MHz sysclk.
addr == 16'h81 ? 16'h1206 :  // <0024> x = 6
// :wait1 // = 0x0082
addr == 16'h82 ? 16'hc800 :  // <0026> x = x+y
addr == 16'h83 ? 16'h1320 :  // <0026> "
addr == 16'h84 ? 16'he402 :  // <0027> bn xz :wait1
addr == 16'h85 ? 16'h0082 :  // <0027> "
// output a high clock phase.
addr == 16'h86 ? 16'h0602 :  // <0029> b = $de0nano_adc_sck_mask
addr == 16'h87 ? 16'hc800 :  // <0030> de0nano_adc_ctrl = or
addr == 16'h88 ? 16'h2f34 :  // <0030> "
// sample mi.
addr == 16'h89 ? 16'h0007 :  // <0032> a = g7
addr == 16'h8a ? 16'h0351 :  // <0033> a = a<<1
addr == 16'h8b ? 16'h040b :  // <0034> b = de0nano_adc_ctrl
addr == 16'h8c ? 16'hc800 :  // <0035> g7 = or
addr == 16'h8d ? 16'h1f34 :  // <0035> "
// wait about 500 ns (for about 1 Mhz sck) assuming 50 MHz sysclk.
addr == 16'h8e ? 16'h1206 :  // <0037> x = 6
// :wait2 // = 0x008f
addr == 16'h8f ? 16'hc800 :  // <0039> x = x+y
addr == 16'h90 ? 16'h1320 :  // <0039> "
addr == 16'h91 ? 16'he402 :  // <0040> bn xz :wait2
addr == 16'h92 ? 16'h008f :  // <0040> "
// shift mo bits.
addr == 16'h93 ? 16'h0006 :  // <0042> a = g6
addr == 16'h94 ? 16'h0351 :  // <0043> a = a<<1
addr == 16'h95 ? 16'h1800 :  // <0044> g6 = a
// count bits
addr == 16'h96 ? 16'hc800 :  // <0046> i = i+j
addr == 16'h97 ? 16'h0b10 :  // <0046> "
addr == 16'h98 ? 16'he401 :  // <0047> bn iz :next_bit
addr == 16'h99 ? 16'h0079 :  // <0047> "
// idle the SPI bus with a high clock phase and high csn.
addr == 16'h9a ? 16'h2e06 :  // <0049> de0nano_adc_ctrl = ($de0nano_adc_csn_mask | $de0nano_adc_sck_mask)
// wait about 500 ns (for about 1 Mhz sck) assuming 50 MHz sysclk.
addr == 16'h9b ? 16'h1206 :  // <0051> x = 6
// :wait3 // = 0x009c
addr == 16'h9c ? 16'hc800 :  // <0053> x = x+y
addr == 16'h9d ? 16'h1320 :  // <0053> "
addr == 16'h9e ? 16'he402 :  // <0054> bn xz :wait3
addr == 16'h9f ? 16'h009c :  // <0054> "
addr == 16'ha0 ? 16'h0007 :  // <0055> a = g7
addr == 16'ha1 ? 16'h1c08 :  // <0056> pop g7 // rtn
addr == 16'ha2 ? 16'h1808 :  // <0056> pop g6 // "
addr == 16'ha3 ? 16'h1408 :  // <0056> pop y // "
addr == 16'ha4 ? 16'h1008 :  // <0056> pop x // "
addr == 16'ha5 ? 16'h0c08 :  // <0056> pop j // "
addr == 16'ha6 ? 16'h0808 :  // <0056> pop i // "
addr == 16'ha7 ? 16'hfc00 :  // <0056> rtn

// pass desired ADC channel in a.
// returns ADC reading in a.
// func de0nano_adc_read // = 0x00a8
addr == 16'ha8 ? 16'h203e :  // <0060> push rtna // func de0nano_adc_read
addr == 16'ha9 ? 16'h0352 :  // <0061> a = a<<4
addr == 16'haa ? 16'h0352 :  // <0062> a = a<<4
addr == 16'hab ? 16'h0351 :  // <0063> a = a<<1
addr == 16'hac ? 16'h0351 :  // <0064> a = a<<1
addr == 16'had ? 16'h0351 :  // <0065> a = a<<1
addr == 16'hae ? 16'h0610 :  // <0066> b = 16
addr == 16'haf ? 16'hfba0 :  // <0067> call :spi_exchange
addr == 16'hb0 ? 16'h006e :  // <0067> "
addr == 16'hb1 ? 16'hfc00 :  // <0067> "
addr == 16'hb2 ? 16'hf808 :  // <0068> pop rtna // rtn
addr == 16'hb3 ? 16'hfc00 :  // <0068> rtn

// pass desired anmux channel in a.
// return ADC reading in a.
// func anmux_read_chn // = 0x00b4
addr == 16'hb4 ? 16'h203e :  // <0072> push rtna // func anmux_read_chn
// set & enable analog muxer
addr == 16'hb5 ? 16'h0608 :  // <0074> b = $anmux_enable_mask
addr == 16'hb6 ? 16'h5202 :  // <0075> anmux_ctrl = or
addr == 16'hb7 ? 16'h4f34 :  // <0075> "
// wait for muxer & current driver to settle down.  some delay here is absolutely required (per testing).
addr == 16'hb8 ? 16'h0205 :  // <0077> a = 5
addr == 16'hb9 ? 16'hfba0 :  // <0078> call :spinwait
addr == 16'hba ? 16'h0171 :  // <0078> "
addr == 16'hbb ? 16'hfc00 :  // <0078> "

// read ADC channel 7.  12 bits resolution.
// must do this 3 times to get the ADC's input path to settle down, probably because
// i'm driving it with high impedance & no buffer.
addr == 16'hbc ? 16'h0207 :  // <0083> a = 7
addr == 16'hbd ? 16'hfba0 :  // <0084> call :de0nano_adc_read
addr == 16'hbe ? 16'h00a8 :  // <0084> "
addr == 16'hbf ? 16'hfc00 :  // <0084> "
addr == 16'hc0 ? 16'h0207 :  // <0085> a = 7
addr == 16'hc1 ? 16'hfba0 :  // <0086> call :de0nano_adc_read
addr == 16'hc2 ? 16'h00a8 :  // <0086> "
addr == 16'hc3 ? 16'hfc00 :  // <0086> "
addr == 16'hc4 ? 16'h0207 :  // <0087> a = 7
addr == 16'hc5 ? 16'hfba0 :  // <0088> call :de0nano_adc_read
addr == 16'hc6 ? 16'h00a8 :  // <0088> "
addr == 16'hc7 ? 16'hfc00 :  // <0088> "
addr == 16'hc8 ? 16'hf808 :  // <0089> pop rtna // rtn
addr == 16'hc9 ? 16'hfc00 :  // <0089> rtn

// pick a byte from an array of packed words in program space.  fetch & return it in a.
// pass array base address in x, byte offset in a.
// func fetch_byte // = 0x00ca
addr == 16'hca ? 16'h0601 :  // <0005> b = 1
addr == 16'hcb ? 16'he003 :  // <0006> br and0z :pick_byte_even
addr == 16'hcc ? 16'h00d5 :  // <0006> "
addr == 16'hcd ? 16'h0350 :  // <0007> a = a>>1
addr == 16'hce ? 16'h0404 :  // <0008> b = x
addr == 16'hcf ? 16'hc800 :  // <0009> fetch a from a+b
addr == 16'hd0 ? 16'hd300 :  // <0009> "
addr == 16'hd1 ? 16'h03b0 :  // <0009> "
addr == 16'hd2 ? 16'h0353 :  // <0010> a = a>>4
addr == 16'hd3 ? 16'h0353 :  // <0011> a = a>>4
addr == 16'hd4 ? 16'hfc00 :  // <0012> rtn
// :pick_byte_even // = 0x00d5
addr == 16'hd5 ? 16'h0350 :  // <0014> a = a>>1
addr == 16'hd6 ? 16'h0404 :  // <0015> b = x
addr == 16'hd7 ? 16'hc800 :  // <0016> fetch a from a+b
addr == 16'hd8 ? 16'hd300 :  // <0016> "
addr == 16'hd9 ? 16'h03b0 :  // <0016> "
addr == 16'hda ? 16'h06ff :  // <0017> b = 0xff
addr == 16'hdb ? 16'hc800 :  // <0018> a = and
addr == 16'hdc ? 16'h0330 :  // <0018> "
addr == 16'hdd ? 16'hfc00 :  // <0019> rtn

// find a byte in an array of packed words in program space.
// pass data byte in a.
// pass array base address in x.
// array length in i.
// returns found index in a (or -1 if not found).
// if the data byte occurs more than once, the final one's position is returned.
// func find_in_fetch // = 0x00de
addr == 16'hde ? 16'h2002 :  // <0027> push i // func find_in_fetch
addr == 16'hdf ? 16'h2003 :  // <0027> push j // "
addr == 16'he0 ? 16'h2005 :  // <0027> push y // "
addr == 16'he1 ? 16'h203e :  // <0027> push rtna // "
addr == 16'he2 ? 16'h1400 :  // <0028> y = a
addr == 16'he3 ? 16'h0f60 :  // <0029> j = -1
// :again // = 0x00e4
addr == 16'he4 ? 16'he001 :  // <0031> br iz :fail
addr == 16'he5 ? 16'h00f4 :  // <0031> "
addr == 16'he6 ? 16'h0b10 :  // <0032> i = ad1
addr == 16'he7 ? 16'h0002 :  // <0033> a = i
addr == 16'he8 ? 16'hfba0 :  // <0034> call :fetch_byte
addr == 16'he9 ? 16'h00ca :  // <0034> "
addr == 16'hea ? 16'hfc00 :  // <0034> "
addr == 16'heb ? 16'h0405 :  // <0035> b = y
addr == 16'hec ? 16'he407 :  // <0036> bn eq :again
addr == 16'hed ? 16'h00e4 :  // <0036> "
// :found // = 0x00ee
addr == 16'hee ? 16'h0002 :  // <0038> a = i
addr == 16'hef ? 16'hf808 :  // <0039> pop rtna // rtn
addr == 16'hf0 ? 16'h1408 :  // <0039> pop y // "
addr == 16'hf1 ? 16'h0c08 :  // <0039> pop j // "
addr == 16'hf2 ? 16'h0808 :  // <0039> pop i // "
addr == 16'hf3 ? 16'hfc00 :  // <0039> rtn
// :fail // = 0x00f4
addr == 16'hf4 ? 16'h0360 :  // <0041> a = -1
addr == 16'hf5 ? 16'hf808 :  // <0042> pop rtna // rtn
addr == 16'hf6 ? 16'h1408 :  // <0042> pop y // "
addr == 16'hf7 ? 16'h0c08 :  // <0042> pop j // "
addr == 16'hf8 ? 16'h0808 :  // <0042> pop i // "
addr == 16'hf9 ? 16'hfc00 :  // <0042> rtn



// function library for simple console i/o based on putchar & getchar.
// requires a console driver library to be included prior to including this.


// :hexdigits // = 0x00fa
// "0123456789abcdef"
addr == 16'hfa ? 16'h3130 :  // <0054> 10
addr == 16'hfb ? 16'h3332 :  // <0054> 32
addr == 16'hfc ? 16'h3534 :  // <0054> 54
addr == 16'hfd ? 16'h3736 :  // <0054> 76
addr == 16'hfe ? 16'h3938 :  // <0054> 98
addr == 16'hff ? 16'h6261 :  // <0054> ba
addr == 16'h100 ? 16'h6463 :  // <0054> dc
addr == 16'h101 ? 16'h6665 :  // <0054> fe

// function to print a 16-bit number formatted as 4 hex digits.
// pass number in a.
// func put4x // = 0x0102
addr == 16'h102 ? 16'h2004 :  // <0058> push x // func put4x
addr == 16'h103 ? 16'h2006 :  // <0058> push g6 // "
addr == 16'h104 ? 16'h203e :  // <0058> push rtna // "
addr == 16'h105 ? 16'h13a0 :  // <0059> x = :hexdigits
addr == 16'h106 ? 16'h00fa :  // <0059> "

addr == 16'h107 ? 16'h1800 :  // <0061> g6 = a
addr == 16'h108 ? 16'h07a0 :  // <0062> b = 0xF000
addr == 16'h109 ? 16'hf000 :  // <0062> "
addr == 16'h10a ? 16'hc800 :  // <0063> a = and
addr == 16'h10b ? 16'h0330 :  // <0063> "
addr == 16'h10c ? 16'h0353 :  // <0064> a = a>>4
addr == 16'h10d ? 16'h0353 :  // <0065> a = a>>4
addr == 16'h10e ? 16'h0353 :  // <0066> a = a>>4
addr == 16'h10f ? 16'hfba0 :  // <0067> call fetch_byte
addr == 16'h110 ? 16'h00ca :  // <0067> "
addr == 16'h111 ? 16'hfc00 :  // <0067> "
addr == 16'h112 ? 16'h0000 :  // <0068> a = a // putchar a
addr == 16'h113 ? 16'hfba0 :  // <0068> putchar a
addr == 16'h114 ? 16'h0057 :  // <0068> "
addr == 16'h115 ? 16'hfc00 :  // <0068> "

addr == 16'h116 ? 16'h0006 :  // <0070> a = g6
addr == 16'h117 ? 16'h07a0 :  // <0071> b = 0x0F00
addr == 16'h118 ? 16'h0f00 :  // <0071> "
addr == 16'h119 ? 16'hc800 :  // <0072> a = and
addr == 16'h11a ? 16'h0330 :  // <0072> "
addr == 16'h11b ? 16'h0353 :  // <0073> a = a>>4
addr == 16'h11c ? 16'h0353 :  // <0074> a = a>>4
addr == 16'h11d ? 16'hfba0 :  // <0075> call fetch_byte
addr == 16'h11e ? 16'h00ca :  // <0075> "
addr == 16'h11f ? 16'hfc00 :  // <0075> "
addr == 16'h120 ? 16'h0000 :  // <0076> a = a // putchar a
addr == 16'h121 ? 16'hfba0 :  // <0076> putchar a
addr == 16'h122 ? 16'h0057 :  // <0076> "
addr == 16'h123 ? 16'hfc00 :  // <0076> "

addr == 16'h124 ? 16'h0006 :  // <0078> a = g6
addr == 16'h125 ? 16'h06f0 :  // <0079> b = 0x00F0
addr == 16'h126 ? 16'hc800 :  // <0080> a = and
addr == 16'h127 ? 16'h0330 :  // <0080> "
addr == 16'h128 ? 16'h0353 :  // <0081> a = a>>4
addr == 16'h129 ? 16'hfba0 :  // <0082> call fetch_byte
addr == 16'h12a ? 16'h00ca :  // <0082> "
addr == 16'h12b ? 16'hfc00 :  // <0082> "
addr == 16'h12c ? 16'h0000 :  // <0083> a = a // putchar a
addr == 16'h12d ? 16'hfba0 :  // <0083> putchar a
addr == 16'h12e ? 16'h0057 :  // <0083> "
addr == 16'h12f ? 16'hfc00 :  // <0083> "

addr == 16'h130 ? 16'h0006 :  // <0085> a = g6
addr == 16'h131 ? 16'h060f :  // <0086> b = 0x000F
addr == 16'h132 ? 16'hc800 :  // <0087> a = and
addr == 16'h133 ? 16'h0330 :  // <0087> "
addr == 16'h134 ? 16'hfba0 :  // <0088> call fetch_byte
addr == 16'h135 ? 16'h00ca :  // <0088> "
addr == 16'h136 ? 16'hfc00 :  // <0088> "
addr == 16'h137 ? 16'h0000 :  // <0089> a = a // putchar a
addr == 16'h138 ? 16'hfba0 :  // <0089> putchar a
addr == 16'h139 ? 16'h0057 :  // <0089> "
addr == 16'h13a ? 16'hfc00 :  // <0089> "

addr == 16'h13b ? 16'hf808 :  // <0091> pop rtna // rtn
addr == 16'h13c ? 16'h1808 :  // <0091> pop g6 // "
addr == 16'h13d ? 16'h1008 :  // <0091> pop x // "
addr == 16'h13e ? 16'hfc00 :  // <0091> rtn

// function to scan a 16-bit number formatted as 4 hex digits.
// return number in a.  return 0 for success in b.
// func get4x // = 0x013f
addr == 16'h13f ? 16'h2002 :  // <0095> push i // func get4x
addr == 16'h140 ? 16'h2003 :  // <0095> push j // "
addr == 16'h141 ? 16'h2004 :  // <0095> push x // "
addr == 16'h142 ? 16'h2005 :  // <0095> push y // "
addr == 16'h143 ? 16'h203e :  // <0095> push rtna // "
// y = digit counter
// j = sum
addr == 16'h144 ? 16'h1604 :  // <0098> y = 4
// :again // = 0x0145
addr == 16'h145 ? 16'hfba0 :  // <0100> getchar
addr == 16'h146 ? 16'h0060 :  // <0100> "
addr == 16'h147 ? 16'hfc00 :  // <0100> "
addr == 16'h148 ? 16'h2000 :  // <0100> push a // "
addr == 16'h149 ? 16'h0000 :  // <0100> a = a // "
addr == 16'h14a ? 16'hfba0 :  // <0100> "
addr == 16'h14b ? 16'h0057 :  // <0100> "
addr == 16'h14c ? 16'hfc00 :  // <0100> "
addr == 16'h14d ? 16'h0008 :  // <0100> pop a // "
addr == 16'h14e ? 16'h13a0 :  // <0101> x = :hexdigits
addr == 16'h14f ? 16'h00fa :  // <0101> "
addr == 16'h150 ? 16'h0a10 :  // <0102> i = 16
addr == 16'h151 ? 16'hfba0 :  // <0103> call :find_in_fetch
addr == 16'h152 ? 16'h00de :  // <0103> "
addr == 16'h153 ? 16'hfc00 :  // <0103> "
addr == 16'h154 ? 16'h0760 :  // <0104> b = -1
addr == 16'h155 ? 16'he007 :  // <0105> br eq :fail
addr == 16'h156 ? 16'h016a :  // <0105> "
addr == 16'h157 ? 16'h0400 :  // <0106> b = a
addr == 16'h158 ? 16'h0003 :  // <0107> a = j
addr == 16'h159 ? 16'h0352 :  // <0108> a = a<<4
addr == 16'h15a ? 16'hc800 :  // <0109> j = or
addr == 16'h15b ? 16'h0f34 :  // <0109> "
addr == 16'h15c ? 16'h1360 :  // <0110> x = -1
addr == 16'h15d ? 16'hc800 :  // <0111> y = x+y
addr == 16'h15e ? 16'h1720 :  // <0111> "
addr == 16'h15f ? 16'h0005 :  // <0112> a = y
addr == 16'h160 ? 16'he400 :  // <0113> bn az :again
addr == 16'h161 ? 16'h0145 :  // <0113> "
addr == 16'h162 ? 16'h0003 :  // <0114> a = j
addr == 16'h163 ? 16'h0600 :  // <0115> b = 0
addr == 16'h164 ? 16'hf808 :  // <0116> pop rtna // rtn
addr == 16'h165 ? 16'h1408 :  // <0116> pop y // "
addr == 16'h166 ? 16'h1008 :  // <0116> pop x // "
addr == 16'h167 ? 16'h0c08 :  // <0116> pop j // "
addr == 16'h168 ? 16'h0808 :  // <0116> pop i // "
addr == 16'h169 ? 16'hfc00 :  // <0116> rtn
// :fail // = 0x016a
addr == 16'h16a ? 16'h0760 :  // <0118> b = -1
addr == 16'h16b ? 16'hf808 :  // <0119> pop rtna // rtn
addr == 16'h16c ? 16'h1408 :  // <0119> pop y // "
addr == 16'h16d ? 16'h1008 :  // <0119> pop x // "
addr == 16'h16e ? 16'h0c08 :  // <0119> pop j // "
addr == 16'h16f ? 16'h0808 :  // <0119> pop i // "
addr == 16'h170 ? 16'hfc00 :  // <0119> rtn

// routine waits a number of milliseconds given in a.
// func spinwait // = 0x0171
addr == 16'h171 ? 16'h2004 :  // <0002> push x // func spinwait
addr == 16'h172 ? 16'h2005 :  // <0002> push y // "
//patch
//rtn
addr == 16'h173 ? 16'h0760 :  // <0005> b = -1
// :spinwait_outer // = 0x0174
addr == 16'h174 ? 16'h13a0 :  // <0007> x = 16666
addr == 16'h175 ? 16'h411a :  // <0007> "
addr == 16'h176 ? 16'h1760 :  // <0008> y = -1
addr == 16'h177 ? 16'hc800 :  // <0009> nop
// :spinwait_inner // = 0x0178
// use of the ad2 name overrides auto-nop here.
addr == 16'h178 ? 16'h1320 :  // <0012> x = ad2
addr == 16'h179 ? 16'he402 :  // <0013> bn xz :spinwait_inner
addr == 16'h17a ? 16'h0178 :  // <0013> "
addr == 16'h17b ? 16'hc800 :  // <0014> a = a+b
addr == 16'h17c ? 16'h0300 :  // <0014> "
addr == 16'h17d ? 16'he400 :  // <0015> bn az :spinwait_outer
addr == 16'h17e ? 16'h0174 :  // <0015> "
addr == 16'h17f ? 16'h1408 :  // <0016> pop y // rtn
addr == 16'h180 ? 16'h1008 :  // <0016> pop x // "
addr == 16'h181 ? 16'hfc00 :  // <0016> rtn



// ////////////////////////////////////////////
// :main // = 0x0182

// // pass counter in x.  anmux channel number in i.
// x = 0
// y = 1

// :next_pass
// leds = x
// a = x
// call :put4x
// putasc ":"
// i = 8
// j = -1

// :next_anmux
// i = i+j
// putasc " "
// putasc "s"
// b = i
// asc a = "0"
// putchar a+b
// putasc "="
// a = i
// call :anmux_read_chn
// call :put4x
// bn iz :next_anmux

// puteol
// a = 900
// call :spinwait

// x = x+y
// jmp :next_pass

// //////////////////////////////////////////////////////////

addr == 16'h182 ? 16'h2ba0 :  // <0129> timer0 = $TICKS_PER_SEC
addr == 16'h183 ? 16'h02fb :  // <0129> "

addr == 16'h184 ? 16'h4ba0 :  // <0131> soft_event = 0x2000
addr == 16'h185 ? 16'h2000 :  // <0131> "

// event loop prototype.
// first instruction of an event handler should be the 7th cycle after reading its priority from the event controller.
// :poll_events // = 0x0186
// initialize prior to polling loop, for minimum latency.
addr == 16'h186 ? 16'h07a0 :  // <0137> b = :event_table
addr == 16'h187 ? 16'h0190 :  // <0137> "
// 3-cycle polling loop.
// :poll_events_again // = 0x0188
addr == 16'h188 ? 16'h0009 :  // <0140> a = event_priority
addr == 16'h189 ? 16'he000 :  // <0141> br 0z :poll_events_again
addr == 16'h18a ? 16'h0188 :  // <0141> "
// acknowledge the event to clear its register.  do this right away,
// so another occurrence of the same event can be captured right away in the controller.
addr == 16'h18b ? 16'h2400 :  // <0144> event_priority = a
// compute an address in the event_table.  note the absence of a wait state for the adder here (not needed).
addr == 16'h18c ? 16'hfb00 :  // <0146> rtna = ad0
// jump into the event_table.  each handler MUST end with a end_event.
// each handler does NOT need to save ANY registers (e.g. no convention_gpx).  they can all be trashed.
// each handler is passed the event priority in a, in case the same handler is used on multiple priorities.
addr == 16'h18d ? 16'hfc00 :  // <0150> swapra = nop
// just returned here from the handler, in case the handler accidentally did a rtn.  this should NEVER happen.
// :events_error_halt // = 0x018e
addr == 16'h18e ? 16'he00f :  // <0153> jmp :events_error_halt
addr == 16'h18f ? 16'h018e :  // <0153> "

// event table;  begins with a null handler because that's the event 0 position.
// event 0 not used in this app anyway.
// :event_table // = 0x0190
addr == 16'h190 ? 16'he00f :  // <0158> jmp :test_handler
addr == 16'h191 ? 16'h01bc :  // <0158> "
addr == 16'h192 ? 16'he00f :  // <0159> jmp :test_handler
addr == 16'h193 ? 16'h01bc :  // <0159> "
addr == 16'h194 ? 16'he00f :  // <0160> jmp :test_handler
addr == 16'h195 ? 16'h01bc :  // <0160> "
addr == 16'h196 ? 16'he00f :  // <0161> jmp :test_handler
addr == 16'h197 ? 16'h01bc :  // <0161> "
addr == 16'h198 ? 16'he00f :  // <0162> jmp :test_handler
addr == 16'h199 ? 16'h01bc :  // <0162> "
addr == 16'h19a ? 16'he00f :  // <0163> jmp :test_handler
addr == 16'h19b ? 16'h01bc :  // <0163> "
addr == 16'h19c ? 16'he00f :  // <0164> jmp :test_handler
addr == 16'h19d ? 16'h01bc :  // <0164> "
addr == 16'h19e ? 16'he00f :  // <0165> jmp :test_handler
addr == 16'h19f ? 16'h01bc :  // <0165> "
addr == 16'h1a0 ? 16'he00f :  // <0166> jmp :test_handler
addr == 16'h1a1 ? 16'h01bc :  // <0166> "
addr == 16'h1a2 ? 16'he00f :  // <0167> jmp :test_handler
addr == 16'h1a3 ? 16'h01bc :  // <0167> "
addr == 16'h1a4 ? 16'he00f :  // <0168> jmp :test_handler
addr == 16'h1a5 ? 16'h01bc :  // <0168> "
addr == 16'h1a6 ? 16'he00f :  // <0169> jmp :test_handler
addr == 16'h1a7 ? 16'h01bc :  // <0169> "
addr == 16'h1a8 ? 16'he00f :  // <0170> jmp :test_handler
addr == 16'h1a9 ? 16'h01bc :  // <0170> "
addr == 16'h1aa ? 16'he00f :  // <0171> jmp :test_handler
addr == 16'h1ab ? 16'h01bc :  // <0171> "
addr == 16'h1ac ? 16'he00f :  // <0172> jmp :test_handler
addr == 16'h1ad ? 16'h01bc :  // <0172> "
addr == 16'h1ae ? 16'he00f :  // <0173> jmp :test_handler
addr == 16'h1af ? 16'h01bc :  // <0173> "
addr == 16'h1b0 ? 16'he00f :  // <0174> jmp :poll_events
addr == 16'h1b1 ? 16'h0186 :  // <0174> "
addr == 16'h1b2 ? 16'he00f :  // <0175> jmp :uart_rx_char_handler
addr == 16'h1b3 ? 16'h01ce :  // <0175> "
addr == 16'h1b4 ? 16'he00f :  // <0176> jmp :uart_tx_char_handler
addr == 16'h1b5 ? 16'h01d0 :  // <0176> "
addr == 16'h1b6 ? 16'he00f :  // <0177> jmp :key0_handler
addr == 16'h1b7 ? 16'h01d2 :  // <0177> "
addr == 16'h1b8 ? 16'he00f :  // <0178> jmp :key1_handler
addr == 16'h1b9 ? 16'h01d4 :  // <0178> "
addr == 16'h1ba ? 16'he00f :  // <0179> jmp :timer0_handler
addr == 16'h1bb ? 16'h01d6 :  // <0179> "

// patch: call event loop as if it were a func, but don't declare it func.
// instead let it jmp to a handler, which does an unmatched rtn?
// no, don't allow handlers to call back to event loop.

// event test_handler // = 0x01bc
addr == 16'h1bc ? 16'h0750 :  // <0186> b = a>>1
addr == 16'h1bd ? 16'hc800 :  // <0187> soft_event = or
addr == 16'h1be ? 16'h4b34 :  // <0187> "
addr == 16'h1bf ? 16'hfba0 :  // <0188> call :put4x
addr == 16'h1c0 ? 16'h0102 :  // <0188> "
addr == 16'h1c1 ? 16'hfc00 :  // <0188> "
addr == 16'h1c2 ? 16'h020d :  // <0189> a = 13 // puteol
addr == 16'h1c3 ? 16'h0000 :  // <0189> a = a // puteol
addr == 16'h1c4 ? 16'hfba0 :  // <0189> puteol
addr == 16'h1c5 ? 16'h0057 :  // <0189> "
addr == 16'h1c6 ? 16'hfc00 :  // <0189> "
addr == 16'h1c7 ? 16'h020a :  // <0189> a = 10 // puteol
addr == 16'h1c8 ? 16'h0000 :  // <0189> a = a // puteol
addr == 16'h1c9 ? 16'hfba0 :  // <0189> puteol
addr == 16'h1ca ? 16'h0057 :  // <0189> "
addr == 16'h1cb ? 16'hfc00 :  // <0189> "
addr == 16'h1cc ? 16'he00f :  // <0190> end_event
addr == 16'h1cd ? 16'h0186 :  // <0190> "

// event uart_rx_char_handler // = 0x01ce
// handle data here
addr == 16'h1ce ? 16'he00f :  // <0194> end_event
addr == 16'h1cf ? 16'h0186 :  // <0194> "

// event uart_tx_char_handler // = 0x01d0
// handle data here
addr == 16'h1d0 ? 16'he00f :  // <0198> end_event
addr == 16'h1d1 ? 16'h0186 :  // <0198> "

// event key0_handler // = 0x01d2
// handle data here
addr == 16'h1d2 ? 16'he00f :  // <0202> end_event
addr == 16'h1d3 ? 16'h0186 :  // <0202> "

// event key1_handler // = 0x01d4
// handle data here
addr == 16'h1d4 ? 16'he00f :  // <0206> end_event
addr == 16'h1d5 ? 16'h0186 :  // <0206> "

// event timer0_handler // = 0x01d6
addr == 16'h1d6 ? 16'h2ba0 :  // <0209> timer0 = $TICKS_PER_SEC
addr == 16'h1d7 ? 16'h02fb :  // <0209> "
addr == 16'h1d8 ? 16'h5201 :  // <0210> a = leds
addr == 16'h1d9 ? 16'h0013 :  // <0210> "
addr == 16'h1da ? 16'h0601 :  // <0211> b = 1
addr == 16'h1db ? 16'h5201 :  // <0212> leds = a+b
addr == 16'h1dc ? 16'h4f00 :  // <0212> "
addr == 16'h1dd ? 16'he00f :  // <0213> end_event
addr == 16'h1de ? 16'h0186 :  // <0213> "


        
                16'hxxxx;
        endmodule
    
