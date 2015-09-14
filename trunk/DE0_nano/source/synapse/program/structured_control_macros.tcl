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

    set func_test_cases {
        alias_both pa 6
        alias_both pb 7
        func struct_read {base_addr in const} {index in pa} {valu out pb}
        func struct_write {base_addr in const} {index in pa} {valu in pb}
        func find_cell_test {rpm in pa} {tps in pb} {cell out pa} {
        }
        func multiply_test {in pa} {in pb} {product out pa} {
        }
        func square_root_test {valu in pa} {root out pa} {
            for {i = 0} {i lt 0xff} step j = 1 {
                call multiply_test i i {product out x}
                if x ge valu {
                    rtn i
                }
            }
            rtn 0
        }
        call find_cell_test {rpm in x} {tps in j} {b = cell}
        call find_cell_test {rpm = j} {tps = x} b
        call find_cell_test j x b
        
        design rules:
        note the new aliases pa, pb for g6, g7.  eliminates dependence on the number of operators
        and operand registers in the core.  might add more "p" parameter regs later.
        
        declarations:
        formal parms consist of 2 or 3 words.  last word is register name or "const".
        if it's "const" then it must have all 3 words, so every constant has a name.
        if it's a register then don't bother stacking it.
        middle word must be "in" or "out" for data direction.
        first word (of 3) is a new alias for that register, local to the function.
        conventionally all "in" parms should be listed first before any "out" parms.
        a register may appear twice:  once "in" and once "out".
        final braced word of definition is the func body block.
        "func" macro can thunk to old informal parm design if no formal parms or body are found. 

        calls:
        "call" then bare name of func, no colon.  then actual args.  each is 1 word or 3.
        final word must be a register name (or a literal value for "const" parms).
        generate wrapper code AT THE CALL SITE to copy that arg reg to the formal parm reg, 
        or back from it for "out" parms. 
        if there's only 1 arg word, then the actual arg is in position order, not named.
        if there are 3 arg words, the first 2 words must match the formal parm.
        that arg is identified by name, not position.   the first named one requires 
        all following ones to also be named.

        this call syntax makes it easy to paste in a declaration as a template for your call.

        the design requires a few changes to stacking strategy:
        func should not stack the reg of an "out" parm.  the auto-pop would destroy it.
        call wrapper should stack each reg that the function declares for parm passing,
        but the caller does not specify as an arg.  meaning every reg that the wrapper 
        implicitly destroys to set up the call.

        non-stackable regs never have to be stacked.  might want some more of those in
        the core to reduce speed hit from call wrappers.  i.e. add "pc" "pd" etc. explicitly
        for parm passing.  make all "p" series non-stackable.  so the stackable regs are
        computational operand regs like i, j, x, y, and rtna.  those are for looping and branching.
        the caller is already using them for its looping/branching, but the func wants to use
        them for its own looping/branching.  adding more "p" regs means operand regs don't usually
        have to be used for parms, and don't usually have to be stacked in the wrapper.
        that makes the core more suitable for complex programs like the camaro ECM.

        non-stackable "p" regs means a wrapper often spend 1 cycle copying each parm into
        position to set up the call.  then the func uses those in-place.  then the wrapper
        often spends 1 cycle copying each output word to the reg specified by the caller for
        the caller's use.  (because the caller can't use them in-place, because they're about to 
        be destroyed by the next call wrapper.)  that's just as many cycles as if the parms were passed on a stack.
        it only saves cycles if some parms can be kept in the same regs in both contexts.
        so the "p" regs provide functionality similar to a stack, except the "p" regs probably 
        hold fewer words, and are not as easily expanded as a stack.
        
        computational operand registers (i,j,x,y) and rtna are stackable by functions because the
        function knows which ones it will be destroying.  
        so what if all "p" regs are stackable by wrappers?  because the wrapper knows which ones it
        will destroy?  that means both sets are usable in-place in both contexts.
        would it save any cycles?  it's really hard to imagine without trying.
        
        but instead passing all parameters in and out on a stack only would surely work, and be simple.
        that stack can be the same one as the call return stack, like the stack i already have.
        it could be completely managed by generated code, both within the func and the wrapper.
        the generator is fairly simple, and integrates well with existing paradigm.  
        the generated code is predictable, reasonably quick, and also integrates well with existing paradigm.
        it would fulfill the desired syntax in the test cases above.  
        except it would have no "p" regs.  use "g" regs instead.  they're stackable, very much like
        g6 is now, but permanently renamed "ga" "gb" etc. to avoid dependence on their register address.
        that design stays truer to the original Synapse paradigm and scope.
        it also scales up and down easier to meet the project needs.  meaning it's easy to change the
        register file size, stack size, or eliminate the stack entirely for small programs.
        it might even be able to use the existing convention_gpx instead of a new convention.
        using the existing convention_gpx the func would waste cycles auto-pushing & auto-popping
        computational regs that the call specified as out regs because the wrapper would destroy those right away. 
        avoiding that would mean all auto stacking must be done by the wrapper not the func.
        speed at the expense of code size.  might be fine for Synapse.
        OR the call specifies non-stackable out reg like a.  or better yet, a non-stackable "g" reg,
        because those aren't operands for branching/looping.  that's the best idea all day.  then
        the auto stacking can be done in func much like it is already.
        call those "o" regs: oa, ob.  stands for "out reg".
        so in an optimal case, both func and caller could specify the same o reg, typically oa.
        if the caller is simple it might not have to copy that to another reg.  value might flow into
        the next call wrapper, or just be used briefly and discarded.  if value does need to get copied
        to another reg the wrapper can do that conveniently if the caller specifies it.
    }
    
}
