
    // alias_both de0nano_adc_ctrl     [incr counter] 
        // vdefine     de0nano_adc_csn_mask         0x0004
        // vdefine     de0nano_adc_sck_mask         0x0002
        // vdefine     de0nano_adc_mo_mask          0x0001
        // vdefine     de0nano_adc_mi_mask          0x0001

// wire[15:0] de0nadc_ctrl;
// std_reg #(.WIDTH(3)) de0nano_adc_ctrl_reg(sysclk, sysreset, de0nadc_ctrl, r_load_data[2:0], r_load[`DR_DE0NANO_ADC_CTRL]);
// assign r[`DR_DE0NANO_ADC_CTRL] = {15'b0, ADC_SDAT};         
// assign ADC_CS_N =  de0nadc_ctrl[2];
// assign ADC_SCLK =  de0nadc_ctrl[1];
// assign ADC_SADDR = de0nadc_ctrl[0];
// assign GPIO_2[9] = ADC_SCLK;
// assign GPIO_2[8] = ADC_CS_N;
// assign GPIO_2[7] = ADC_SADDR;
// assign GPIO_2[6] = ADC_SDAT;
// bit bang above worked OK.  now using hardware spi_master instead.


// bit-bang a complete SPI transaction.
// pass mo data in a, transaction width (# of bits) in b.
// returns mi data in a
func spi_exchange
    // keeping mo data in g6, mi data in g7.
    g6 = a
    g7 = 0
    // keeping bit counter in i.
    i = b
    j = -1
    y = -1
    :next_bit
    // output the msb of mo, along with a low clock phase and low csn.
    a = g6
    a = a>>1
    a = a>>1
    a = a>>1
    a = a>>4
    a = a>>4
    a = a>>4
    de0nano_adc_ctrl = a
    // wait about 500 ns (for about 1 Mhz sck) assuming 50 MHz sysclk.
    x = 6
    :wait1
    x = x+y
    bn xz :wait1
    // output a high clock phase.
    b = $de0nano_adc_sck_mask
    de0nano_adc_ctrl = or
    // sample mi.
    a = g7
    a = a<<1
    b = de0nano_adc_ctrl
    g7 = or
    // wait about 500 ns (for about 1 Mhz sck) assuming 50 MHz sysclk.
    x = 6
    :wait2
    x = x+y
    bn xz :wait2
    // shift mo bits.
    a = g6
    a = a<<1
    g6 = a
    // count bits
    i = i+j
    bn iz :next_bit
    // idle the SPI bus with a high clock phase and high csn.
    de0nano_adc_ctrl = ($de0nano_adc_csn_mask | $de0nano_adc_sck_mask)
    // wait about 500 ns (for about 1 Mhz sck) assuming 50 MHz sysclk.
    x = 6
    :wait3
    x = x+y
    bn xz :wait3
    a = g7
end_func

// pass desired ADC channel in a.
// returns ADC reading in a.
func de0nano_adc_read
    a = a<<4
    a = a<<4
    a = a<<1
    a = a<<1
    a = a<<1
    b = 16
    call :spi_exchange
end_func
    
// pass desired anmux channel in a.
// after this returns, CALLER MUST WAIT for muxer & current driver to 
// settle down.  some delay for that is absolutely required (per testing).
// 5 ms wait works well 2015/04.
func anmux_set_chn
    // set & enable analog muxer
    b = $anmux_enable_mask
    anmux_ctrl = or
end_func

func anmux_get_chn
    a = anmux_ctrl
    b = $anmux_channel_mask
    a = and
end_func
    
// return ADC reading in a.  this assumes anmux_set_chn was called some time ago.
func anmux_convert
    // read ADC channel 7.  12 bits resolution.
    // must do this 3 times to get the ADC's input path to settle down, especially if
    // i'm driving it with high impedance & no buffer.
    // also remember the channel number passed to the ADC takes effect on the NEXT conversion.
    a = 7
    call :de0nano_adc_read
    a = 7
    call :de0nano_adc_read
    a = 7
    call :de0nano_adc_read
end_func