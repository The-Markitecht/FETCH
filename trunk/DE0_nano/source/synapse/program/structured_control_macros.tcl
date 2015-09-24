# #########################################################################
# macro routines for structured branching and looping in assembly source code.

namespace eval ::asm {

    # proc read_expression_arg {lin  reg  valu} {
        # if {[llength $valu] > 1} {
            # # parenthesized expression.  wrap it for evaluation later.
            # set a "( $a )"
        # }
    # }

    proc if_core {lin  positive  condition  if_block  else_word  else_block} {
        # low-level implementation of structured branching implemented by 'if' macros.
        # this proc is not normally called directly from assembly code.
        # pass positive = 1 to execute the if_block when the condition succeeds.
        
        set serial $::ipr
        if {$else_word ne {} && $else_word ne {else}} {
            error "syntax error in if/else block"
        }
        if {$condition eq {ne}} {
            # synthetic not-equal comparison operator.
            set positive [expr { ! $positive }]
            set condition eq
        }
        #patch: optimize for empty if_block but non_empty else_block.  swap them and reverse the branch.
        set branch br
        if {$positive} {set branch bn}
        set end_jmp "jmp :end_$serial"
        if {$else_block eq {}} {set end_jmp {}}        
        parse "
            $branch $condition :else_$serial
                $if_block
                $end_jmp
            :else_$serial
                $else_block
            :end_$serial
        "
    }

    proc if_ {lin  a  operator  b  if_block  {else_word {}}  {else_block {}} } {
        if {[llength $a] > 1} {set a "( $a )"}
        if {[llength $b] > 1} {set b "( $b )"}
        parse "
            a = $a
            b = $b
        "
        #patch: optimize for a=a already or b=b already.  a=b with b=a is the same case, but with opposite directional operators.
        #patch: optimize for zero comparison on a, i, x in either position.
        if_core  $lin  1  $operator  $if_block  $else_word  $else_block  
    }
    
    proc if_all_clear_ {lin  reg  mask  if_block  {else_word {}}  {else_block {}} } {
        # execute the if_block if all bits are zero in the given register,
        # masked by the given mask.
        parse "
            a = $reg
            b = ( $mask )
        "
        if_core  $lin  1  and0z  $if_block  $else_word  $else_block  
    }

    proc if_any_set_ {lin  reg  mask  if_block  {else_word {}}  {else_block {}} } {
        # execute the if_block if any bits are one in the given register,
        # masked by the given mask.
        parse "
            a = $reg
            b = ( $mask )
        "
        if_core  $lin  0  and0z  $if_block  $else_word  $else_block  
    }
    
    proc for_ {lin  initialization  continuation  step_word  step_size  body  args} {        
        # structured looping implemented by 'for' macro.
        
        set serial $::ipr
        if {$step_word ne {step}} {
            error "syntax error in 'for' loop declaration; expected 'step'"
        }
        set step_cache_reg {}
        if {$body eq {=}} {
            # long form having explicit step register for more speed.
            if {[llength $args] != 2} {
                error "syntax error in 'for' loop declaration"
            }
            set step_cache_reg $step_size
            lassign  $args  step_size  body
        }    
        if {[llength $continuation] != 3} {
            error "syntax error in 'for' loop continuation test"
        }
        lassign  $continuation  counter  comparison  bound
        parse_line $initialization
        parse_line ":loop_$serial"
        parse $body
        # patch: optimize for zero comparison on counter a, i, x.
        # patch: other optimizations.
        # patch: need implement step_cache_reg
        if {$comparison eq {le} || $comparison eq {ge}} {
            # synthetic directional comparison operator.  
            # test for equality prior to increment/decrement to prevent rollover causing infinite looping.
            parse "
                a = $counter
                b = $bound
                br eq :end_$serial
            "
        }
        parse "
            a = $counter
            b = $step_size
            $counter = a+b
        "    
        if {$comparison eq {le}} {
            # synthetic directional comparison operator.
            parse "
                a = $counter
                b = $bound
                bn gt :loop_$serial
            "
        } elseif {$comparison eq {ge}} {
            # synthetic directional comparison operator.
            parse "
                a = $counter
                b = $bound
                bn lt :loop_$serial
            "
        } elseif {$comparison eq {ne}} {
            # synthetic not-equal comparison operator.
            parse "
                a = $counter
                b = $bound
                bn eq :loop_$serial
            "
        } else {
            # native comparison operator.  these run the fastest.
            parse "
                a = $counter
                b = $bound
                br $comparison :loop_$serial
            "
        }
        parse ":end_$serial"
    }

    # patch: need to test source file line numbering subsequent to 'if' and 'for' blocks, and nested ones.
    # patch: might need to reduce ::lnum back to the start of the block prior to parse_lines for a block body.  that way the block body itself outputs accurate line numbers.

    proc if_test_cases {lin} {
        parse {
            if 2 lt 4 {
                putasc "1"
            }    
            if 2 gt 4 {
                putasc "?"
            } else {
                putasc "2"
                if 5 gt 4 {
                    putasc "3"
                } else {
                    putasc "?"
                }
            }    
        }
    }
    
    proc for_test_cases {lin} {
        parse {
            // best design.
            // 'step' word and step value are REQUIRED.  step value can be constant or a register.
            // step caching register is optional, for more speed.
            // continuation condition is REQUIRED and its first word MUST be the counter register.
            for {i = 0} {i lt 6} step j = 1 {
                // 0..5
                a = i
                asc b = "0"
                putchar a+b
            }
            for {i = 0} {i ne 6} step 1 {
                // 0..5
                a = i
                asc b = "0"
                putchar a+b
            }
            for {i = 6} {i ne 0} step -1 {
                // 6..1
                a = i
                asc b = "0"
                putchar a+b
            }
            for {i = 5} {i ne -1} step -1 {
                // 5..0.
                a = i
                asc b = "0"
                putchar a+b
            }
            for {i = 5} {i ge 0} step -1 {
                // 5..0.  synthetic comparison ge.
                a = i
                asc b = "0"
                putchar a+b
            }
            for {i = 0} {i le 5} step 1 {
                // 0..5.  synthetic comparison le.
                a = i
                asc b = "0"
                putchar a+b
            }
            i = 3
            for {} {i lt 8} step 1 {
                // 3..7.  similar to a "while" loop but includes a step increment.
                a = i
                asc b = "0"
                putchar a+b
            }
        }
    }
    
    set for_alternate_designs {
        // poor design.  trouble with register moves for increment.
        for {i = 0} {i lt 6} {i = i+j} {
        }
        
        // poor design.  trouble with initial & exit conditions when down counting.
        for i = 0 lt 6 step j = 1 {
        }
        for x = 6 ne 0 step -1 {
        }
        
        // poor design.  slow, and bounds aren't flexible, and may require increment/decrement to get them right prior to declaring loop.
        for i = 0 to 5 step j = 1 {
        }    
        for x = i to 0 step -1 {
        }
        
    }

    proc func_ {lin label args} {
        # memorize function's label
        set label [string trim $label {: }]
        set_label $label
        emit_comment "// ######## $lin // = 0x[format %04x $::ipr]"
        set ::func $label

        # scan the function's formal parameters
        set parms [lrange $args 0 end-1]
        set temp_aliases [list]
        set ::fparms($label) [list]
        foreach parm $parms {
            # check syntax
            if {[llength $parm] == 3} {
                lassign $parm name dir reg
                if {[dict exists $::asrc $name] || [dict exists $::adest $name]} {
                    error "formal parameter name conflicts with an existing register name: $name"
                }
            } elseif {[llength $parm] == 2} {
                lassign $parm dir reg
                set name {}
            } else {
                error "invalid formal parameter"
            }
            if {$dir ne {in} && $dir ne {out}} {
                error "formal parameter direction must be 'in' or 'out'"
            }
            # memorize in ::fparms
            lappend ::fparms($label) [list $name $dir $reg]
            console "parm '$parm' name '$name' dir '$dir' reg '$reg' fp '$::fparms($label)'"
            # set temporary alias for parm.
            if {$name ne {}} {
                dict set ::asrc $name [src $reg]
                dict set ::adest $name [dest $reg]
                lappend temp_aliases $name
            }
        }

        # assemble function body including auto-stacking code.
        if { $::asm_pass == $::pass(func) } {
            dict set ::func_regs $label [list]
        }
        auto_push $lin
        set body [lindex $args end]
        parse $body
        rtn $lin
#patch: avoid the implicit rtn at the end of a function if it was the last line of the body.  that often happens when rtn accepts a value.  the rule must be sensitive to labels too, since they'd often appear at the end, and would cause bugs if not honored with their own rtn.
        set ::func {}
        
        # forget temporary aliases.  they are now out-of-scope.
        foreach name $temp_aliases {
            dict unset ::asrc $name
            dict unset ::adest $name
        }
    }

    proc rtn {lin {return_value {}}} {
        if {$return_value ne {}} {
            # assign the given return value to the first formal 'out' parm.
            foreach fparm $::fparms($::func) {
                lassign $fparm fname fdir freg
                if {$fdir eq {out}} {
                    parse "$fname = $return_value"
                    auto_pop $lin
                    parse {swapra = nop}
                    return
                }
            }
            error "no 'out' parameter declared for the given return value"
        }        
        # no return value given
        auto_pop $lin
        parse {swapra = nop}
    }
    
    proc callx {lin label args} {
        if {$::asm_pass < $::pass(calls)} return
        
        # parse actual arguments & match to formal parameters.
        if {[llength $args] != [llength $::fparms($label)]} {
            error "wrong number of arguments"
        }
        set position 0
        set out_parms [list]
        foreach arg $args {
            if {[llength $arg] == 3} {
                # named argument.  search for the matching formal parameter.
                set position -1
                lassign $arg aname adir areg
                set found 0
                foreach fparm $::fparms($label) {
                    lassign $fparm fname fdir freg
                    console "p '$fparm' a '$aname' '$adir' =? f '$fname' '$fdir'" 
                    if {$aname eq $fname && $adir eq $fdir} {
                        set found 1
                        break
                    }
                }
                if { ! $found} {
                    error "argument does not match any formal parameter: $aname"
                }
            } elseif {[llength $arg] == 1} {
                # positional argument.  copy some info from the formal parameter appearing in the same position.
                if {$position == -1} {
                    error "positional argument appears after a named argument"
                }
                set fparm [lindex $::fparms($label)  $position]
                lassign $fparm fname fdir freg
                set areg $arg
                set aname $fname
                set adir $fdir
                console "$position fdir $fdir adir $adir"
                incr position
            } else {
                error "syntax error in argument"
            }
            # generate wrapper for 'in' parms.
            if {$adir eq {in}} {
                # this has to be a string comparison for now, not a [src] [dest] comparison, because constants, labels, etc. are passed in areg.
                if {$areg ne $freg} {
                    parse "$freg = $areg"
                } else {
                    # nothing to do.  argument is already in the correct register.
                }
            } elseif {$adir eq {out}} {
                lappend out_parms $fname $fdir $freg $aname $adir $areg
            } else {
                error "argument direction must be 'in' or 'out'"
            }
        }
        
        # jump to function.
        call $lin $label
        
        # generate wrapper for 'out' parms.
        foreach {fname fdir freg aname adir areg} $out_parms {
            if {[dest $areg] != [src $freg]} {
                parse "$areg = $freg"
            }
        }
    }
    
    proc formal_parms_test_cases {lin} {
        parse {
            func find_cell_test {rpm in pa} {tps in pb} {cell out pa} {
                putasc "c"
            }
            callx find_cell_test {rpm in x} {tps in j} {cell out i}
            func multiply_test {in pa} {in pb} {product out pa} {
            }
            func square_root_test {valu in pa} {root out pa} {
                for {i = 0} {i lt 0xff} step j = 1 {
                    callx multiply_test i i {product out x}
                    if x lt valu {
                    } else {
                        rtn i
                    }
                }
                rtn 0
            }
            callx find_cell_test j x b
            // next one should throw an error:
            //callx find_cell_test {rpm in j} {tps in x} b
        }
        set unimplemented {
            func struct_read {base_addr const pb} {index in pa} {valu out pa} {
                putasc "a"
            }
            func struct_write {base_addr const pb} {index in pa} {valu in pb} {
                putasc "b"
            }
        }
        
    }
    
}
