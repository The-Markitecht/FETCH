# #########################################################################
# macro functions for calling in assembly source code.

# verilog integration macros & functions.
proc asm_vdefine {lin name valu} {
    # this can be redefined elsewhere to do application-specific work.
}

# proc verilog_define_labels {label_pattern prefix} {
#     # return a block of Verilog code `define'ing each assembly label matching the given string pattern.
#     # prefix each one with the given prefix.
#     set vlg {}
#     dict for {lbl addr} $::labels {
#         if {[string match -nocase $label_pattern $lbl]} {
#             append vlg "`define $prefix$lbl 16'h[format %04x $addr]\n"
#         }
#     }
#     return $vlg
# }

# common register aliases.
proc asm_alias_src {lin name addr} {
    dict set ::asrc $name $addr
    asm_vdefine $lin "sr_$name" $addr
}
proc asm_alias_dest {lin name addr} {
    dict set ::adest $name $addr
    asm_vdefine $lin "dr_$name" $addr
}
proc asm_alias_both {lin name addr} {
    asm_alias_src  $lin $name $addr
    asm_alias_dest $lin $name $addr
}
proc asm_alias_flag {lin name addr} {
    dict set ::flagsrc $name $addr
}
asm_alias_both {} a 0
asm_alias_both {} b 1
asm_alias_both {} i 2
asm_alias_both {} j 3
asm_alias_both {} x 4
asm_alias_both {} y 5
asm_alias_src  {} a+b [src ad0]
asm_alias_src  {} i+j [src ad1]
asm_alias_src  {} x+y [src ad2]
asm_alias_src  {} and [src and0]
asm_alias_src  {} or  [src or0]
asm_alias_src  {} xor [src xor0]
asm_alias_src  {} a>>1 [src sh1r0]
asm_alias_src  {} a<<1 [src sh1l0]
asm_alias_src  {} a<<4 [src sh4l0]
asm_alias_src  {} a>>4 [src sh4r0]
asm_alias_src  {} 0xffff [src -1]
asm_alias_flag {} c [flag ad0c]
asm_alias_flag {} z [flag ad0z]
asm_alias_flag {} 1z [flag ad1z]
asm_alias_flag {} 2z [flag ad2z]

# subroutine macros.
proc asm_call {lin label} {
    emit_word [pack [dest rtna] [src _imm16_]] $lin
    emit_word [label $label] $lin
    emit_word [pack [dest swapra] [src nop]] $lin
}

proc asm_return {lin} {
    asm_auto_pop $lin
    emit_word [pack [dest swapra] [src nop]] $lin
}

proc asm_func {lin label} {
    set label [string trim $label {: }]
#    if {[dict exists $::labels $label]} {
#        error "redefined label: $label"
#    }
    dict set ::labels $label $::ipr
    set ::func $label
    dict set ::func_regs $label [list]
    asm_auto_push $lin
}

proc asm_push {lin reg} {
    parse3 rstk = $reg $lin
}

proc asm_pop {lin reg} {
    parse3 $reg = rstk $lin
}

proc push_order {r1 r2} {
    set a1 [src $r1]
    set a2 [src $r2]
    if {$a1 > $a2} {
        return 1
    } elseif {$a1 < $a2} {
        return -1
    }
    return 0
}

# patch: make sure -unique works as expected with -command.
proc asm_auto_push {lin} {
    if { ! [dict exists $::adest rstk]} return
    set regs [dict get $::func_regs $::func]
    set regs [lsort -unique -command push_order $regs]
    foreach reg $regs {
        asm_push $lin $reg
    }
}

proc asm_auto_pop {lin} {
    if { ! [dict exists $::adest rstk]} return
    set regs [dict get $::func_regs $::func]
    set regs [lsort -unique -decreasing -command push_order $regs]
    foreach reg $regs {
        asm_pop $lin $reg
    }
}

proc asm_stackable {lin args} {
    set ::stackable [concat $::stackable $args]
    console "all stackable regs: $::stackable"
}

proc asm_convention_gp {lin} {
    # set up Calling Convention "GP".  stackable = all gp regs beyond y.
    # does not include operand regs (a to y), i/o regs (beyond NUM_GP), or result regs.
    if {[llength $::stackable] > 0} {
        error "calling convention specified more than once in same program: $lin"
    }
    set regs [list]
    for {set i [expr [src y] + 1]} {$i < $::asm::NUM_GP} {incr i} {
        lappend regs g$i
    }
    asm_stackable $lin $regs
}

# branching macros.
proc asm_jmp {lin label} {
    parse3 br always $label $lin
}

proc asm_nop {lin} {
    parse3 nop = nop $lin
}

# data handling macros.
proc asm_fetch {lin dest from data_address_reg} {
    if { ! [string equal -nocase $from {from}]} {
        error "syntax error: $lin"
    }
    parse3 fetcha = $data_address_reg $lin
    parse3 $dest = fetchd $lin
}


#patch: create a stack, and macros to auto-push and auto-pop on it, depending on the list of registers used by the current function.
# 2-pass assembler makes that easy.  build list on first pass.  implement on 2nd pass.
# but that messes up labels, because auto-push might take any number of cycles.
# need 3rd pass.  and declarations of starting & ending a function.  automatically set a label on function name.