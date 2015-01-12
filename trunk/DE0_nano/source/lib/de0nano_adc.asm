
// pass desired ADC channel in a.
// returns ADC reading in a.
func de0nano_adc_read
    b = $de0nano_adc_load_mask
    de0nano_adc_ctrl = or
    b = $de0nano_adc_busy_mask
    :poll_for_busy
    a = de0nano_adc_data
    br and0z :poll_for_busy
    de0nano_adc_ctrl = 0
    :poll_for_idle
    a = de0nano_adc_data
    bn and0z :poll_for_idle
    rtn
    
// pass desired anmux channel in a.
// return ADC reading in a.
func anmux_read_chn
    // set & enable analog muxer
    b = $anmux_enable_mask
    anmux_ctrl = or

    // read ADC channel 7.  12 bits resolution.
    a = 7
    call :de0nano_adc_read
    rtn    