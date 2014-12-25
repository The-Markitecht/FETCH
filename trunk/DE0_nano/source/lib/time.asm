// routine waits a number of milliseconds given in a.    
func spinwait
//patch
//return
    b = -1
    :spinwait_outer
    x = 12500
    y = -1
    nop
    :spinwait_inner
    x = x+y
    nop
    bn 2z :spinwait_inner
    a = a+b
    nop
    bn z :spinwait_outer    
    rtn
        
