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
    x = x+y
    bn 2z :spinwait_inner
    a = a+b
    bn z :spinwait_outer    
    rtn
    // patch: ^^^ BUG HERE.  skips final pass because branch is based on newer value of result.  branch allows time for z flag to be updated.
        
