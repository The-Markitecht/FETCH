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
