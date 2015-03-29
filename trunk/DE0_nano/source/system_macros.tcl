# #########################################################################
# macro functions for calling in assembly source code.

namespace eval ::asm {

    # verilog integration macros & functions.
    proc vdefine {lin name valu} {
        # this can be redefined elsewhere to do application-specific work.
    }

    proc vdefine32 {lin name valu} {
        set hi [expr {($valu >> 16) & 0xffff}]
        set lo [expr {$valu & 0xffff}]
        vdefine $lin $name $valu
        vdefine $lin ${name}_hi $hi
        vdefine $lin ${name}_lo $lo
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
    proc alias_src {lin name addr} {
        dict set ::asrc $name $addr
        if {[is_expander_reference $addr]} {
            vdefine $lin "esr_$name" [indirect_reg $addr]
        } else {
            vdefine $lin "sr_$name" $addr
        }
    }
    proc alias_src_latency {lin name addr latency_cycles} {
        alias_src $lin $name $addr
        dict set ::latency $name $latency_cycles
    }
    proc alias_dest {lin name addr} {
        dict set ::adest $name $addr
        if {[is_expander_reference $addr]} {
            vdefine $lin "edr_$name" [indirect_reg $addr]
        } else {
            vdefine $lin "dr_$name" $addr
        }
    }
    proc alias_both {lin name addr} {
        alias_src  $lin $name $addr
        alias_dest $lin $name $addr
    }
    proc alias_flag {lin name addr} {
        dict set ::flagsrc $name $addr
    }
    alias_both         {} a 0
    alias_both         {} b 1
    alias_both         {} i 2
    alias_both         {} j 3
    alias_both         {} x 4
    alias_both         {} y 5
    alias_src_latency  {} a+b [src ad0] 1
    alias_src_latency  {} i+j [src ad1] 1
    alias_src_latency  {} x+y [src ad2] 1
    alias_src_latency  {} and [src and0] 1
    alias_src_latency  {} or  [src or0] 1
    alias_src_latency  {} xor [src xor0] 1
    alias_src          {} a>>1 [src sh1r0]
    alias_src          {} a<<1 [src sh1l0]
    alias_src          {} a<<4 [src sh4l0]
    alias_src          {} a>>4 [src sh4r0]
    alias_src          {} 0xffff [src -1]
    alias_flag         {} c [flag ad0c]
    alias_flag         {} az [flag 0z]
    alias_flag         {} iz [flag 2z]
    alias_flag         {} xz [flag 4z]
    alias_flag         {} eq [flag eq0]
    alias_flag         {} gt [flag gt0]
    alias_flag         {} lt [flag lt0]

    # Tcl integration macros.
    proc setvar {lin varname value} {
        namespace eval ::asm [list set $varname $value]
    }

    # subroutine macros.
    proc call {lin label} {
        uses_reg rtna
        emit_word [pack [dest rtna] [src _imm16_]] $lin
        emit_word [label $label] \"
        emit_word [pack [dest swapra] [src nop]] \"
    }

    proc rtn {lin} {
        auto_pop $lin
        emit_word [pack [dest swapra] [src nop]] $lin
    }

    proc func {lin label} {
        set label [string trim $label {: }]
    #    if {[dict exists $::labels $label]} {
    #        error "redefined label: $label"
    #    }
        dict set ::labels $label $::ipr
        emit "// $lin // = 0x[format %04x $::ipr]"
        set ::func $label
        if { $::asm_pass == $::pass(func) } {
            dict set ::func_regs $label [list]
        }
        auto_push $lin
    }

    proc push {lin reg} {
        parse3 rstk = $reg "push $reg // $lin"
    }

    proc pop {lin reg} {
        parse3 $reg = rstk "pop $reg // $lin"
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

    proc find_stackable {order func_name} {
        set sa [list] 
        foreach reg $::stackable {
            lappend sa [src $reg]
        }
        set r [list]
        set used [dict get $::func_regs $func_name]
        foreach reg $used {
            if {[dict exists $::asrc $reg]} {
                if {[lsearch -integer $sa [src $reg]] >= 0} {
                    lappend r $reg
                }
            }
        }
        console "stackable $::stackable addresses $sa used $used intersection $r"
        return [lsort -unique $order -command push_order $r]
    }

    proc auto_push {lin} {
        if { ! [dict exists $::adest rstk]} return
        foreach reg [find_stackable -increasing $::func] {
            push $lin $reg
            set lin \"
        }
    }

    proc auto_pop {lin} {
        if { ! [dict exists $::adest rstk]} return
        foreach reg [find_stackable -decreasing $::func] {
            pop $lin $reg
            set lin \"
        }
    }

    proc stackable {lin args} {
        foreach reg $args {
            if { ! ([dict exists $::asrc $reg] && [dict exists $::adest $reg])} {
                error "register is not read/write capable: $reg"
            }
            lappend ::stackable [string tolower [string trim $reg]]
        }
        # console "all stackable regs: $::stackable"
    }

    proc nonstackable {lin args} {
        foreach reg $args {
            while {[set i [lsearch -exact $::stackable [string tolower [string trim $reg]]]] >= 0} {
                set ::stackable [lreplace $::stackable $i $i]
            }
        }
        # console "all stackable regs: $::stackable"
    }

    proc convention_gp {lin} {
        # set up Calling Convention "GP".  stackable = all gp regs beyond y.
        # does not include operand regs (a to y), i/o regs (beyond NUM_GP), or result regs.
        if {[llength $::stackable] > 0} {
            error "calling convention specified more than once in same program: $lin"
        }
        if { ! [dict exists $::adest rstk]} {
            error "calling convention requires a return stack 'rstk': $lin"
        }    
        stackable $lin rtna
        for {set i [expr [src y] + 1]} {$i < $::asm::NUM_GP} {incr i} {
            stackable $lin g$i
        }
    }

    proc convention_gpx {lin} {
        # set up Calling Convention "GP eXtended".  stackable = all gp and operand regs beyond b.
        # includes operand regs (i, j, x, y), but not i/o regs (beyond NUM_GP), or result regs.
        convention_gp $lin
        stackable $lin i j x y
    }

    # branching macros.
    proc jmp {lin label} {
        parse3 br always $label $lin
    }

    proc nop {lin} {
        parse3 nop = nop $lin
    }

    # data handling macros.
    proc fetch {lin dest from data_address_reg} {
        if { ! [string equal -nocase $from {from}]} {
            error "syntax error: $lin"
        }
        parse3 fetcha = $data_address_reg $lin
        parse3 $dest = fetchd \"
    }

    # assembler and source-handling macros.
    proc include {lin fn} {
        console "assembling include: $fn"
        set f [open $fn r]
        set asm_lines [split [read $f] \n]
        close $f
        set parent_dir [pwd]
        cd [file dirname [file join [pwd] $fn]]
        set ::ml_state {}
        set ::multi_line {}
        set ::func {}
        set parent_lnum $::lnum
        set ::lnum 0
        foreach lin $asm_lines {
            incr ::lnum
            parse_line $lin
        }
        cd $parent_dir
        set ::ml_state {}
        set ::multi_line {}
        set ::func {}
        set ::lnum $parent_lnum
    }

}