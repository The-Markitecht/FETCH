// routine waits a number of milliseconds given in a.    
func spinwait
//patch
//rtn
    b = -1
    :spinwait_outer
    x = 16666
    y = -1
    nop
    :spinwait_inner
    // use of the ad2 name overrides auto-nop here.
    x = ad2
    bn xz :spinwait_inner
    a = a+b
    bn az :spinwait_outer    
    rtn
        
