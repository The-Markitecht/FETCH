
# assembler library for Synapse316 mcu.

# #########################################################################
# muxer source & destination maps.
set ::asrc [dict create r0 0 r1 1 r2 2 r3 3 r4 4 r5 5 r6 6 r7 7 \
    r8 8 r9 9 r10 10 r11 11 r12 12 r13 13 r14 14 r15 15 \
    rtna 0x3e \
    ad0     0x300   \
    ad1     0x310   \
    ad2     0x320   \
    and0    0x330   \
    or0     0x334   \
    xor0    0x338   \
    flags   0x340   \
    sh1r0   0x350   \
    sh1l0   0x351   \
    sh4l0   0x352   \
    sh4r0   0x353   \
    -1      0x360   \
    _imm16_ 0x3a0   \
    fetchd  0x3b0   \
    nop     0       \
    ]

set ::adest [dict create r0 0 r1 1 r2 2 r3 3 r4 4 r5 5 r6 6 r7 7 \
    r8 8 r9 9 r10 10 r11 11 r12 12 r13 13 r14 14 r15 15 \
    clrf    0x30    \
    setf    0x31    \
    nop     0x32    \
    fetcha  0x34    \
    br      0x38    \
    bn      0x39    \
    rtna    0x3e    \
    swapra  0x3f    \
    ]    

set ::flagsrc [dict create always 5 \
    ad0z 4   ad0c 3     and0z 2     ad1z 1  ad2z 0 ] 

set ::dest_shift 10
set ::src_shift 0
set ::small_const_opcode 0x0200
set ::small_const_shift 0
set ::small_const_max 0xff
set ::flagsrc_shift 0

set ::labels [dict create]

# #########################################################################
# assembler functions.

proc src {src_name} {
    return [dict get $::asrc $src_name]
}

proc dest {dest_name} {
    return [dict get $::adest $dest_name]
}

proc flag {flag_name} {
    return [dict get $::flagsrc $flag_name]
}

proc label {name} {
    # translate given label name into its address (a Tcl integer).
    if {$::asm_pass <= $::pass(label)} {
        return 0
    }
    return [dict get $::labels [string trim $name {: }]]
}

proc uses_reg {reg} {
    # memorize use of a given register by the current function.
    if { ! [dict exists $::adest rstk]} return ;# only memorize if program includes a return stack.
    if { $::asm_pass != $::pass(func) } return ;# only memorize on function examination pass.
    if {[string length $::func] > 0} {
        set reg [string trim $reg]
        if {[lsearch -exact [dict get $::func_regs $::func] $reg] >= 0} return ;# already memorized.
        console "func $::func uses_reg $reg"
        dict lappend ::func_regs $::func $reg
    }
}

proc parse_assignment {dest eq src} {
    # parse and return list of opcodes from a phrase of 3 tokens of text.  this includes assignments and branches.
    # this list will be more than one ROM word if e.g. a 16-bit immediate constant or a branch target is found.
    
    set dest [string tolower $dest]
    set src [string tolower $src]
    set opcodes [list]
    if {[string equal $eq {=}]} {
        # assignment.
        if {[dict exists $::asrc $src]} {
            # source is named.
            lappend opcodes [pack [dest $dest] [src $src]]
        } elseif {[string equal -length 1 $src {:}]} {
            # resolve label as 16-bit immediate, stored in the next ROM word.
            lappend opcodes [pack [dest $dest] [src _imm16_]]
            lappend opcodes [label $src]
        } elseif {[string is integer -strict $src]} {
            # source is immediate value in hex 0x, binary 0b, or decimal (no prefix)
            if {$src > $::small_const_max} {
                # 16-bit immediate, stored in the next ROM word.
                lappend opcodes [pack [dest $dest] [src _imm16_]]
                lappend opcodes $src
            } elseif {$src < 0} {
                error "constant out of range: $dest $eq $src"
            } else {
                # 8-bit immediate, stored in the same ROM word.
                lappend opcodes [expr ([dest $dest] << $::dest_shift) | $::small_const_opcode | ($src << $::small_const_shift)]
            }
        } else {
            error "source is not recognized: $dest $eq $src"
        }
        uses_reg $dest
    } elseif {[string equal $dest br] || [string equal $dest bn]} {
        # branch (b flagname addr)
        set instruction $dest
        set flagname $eq
        set addr $src
        if {[string equal -length 1 $addr {:}]} {
            set addr [label $addr]
        }
        lappend opcodes [expr ([dict get $::flagsrc $flagname] << $::flagsrc_shift) | ([dest $instruction] << $::dest_shift)]
        lappend opcodes $addr
    } else {
        error "syntax error: $dest $eq $src"
    }    
    return $opcodes
}
    
proc parse3 {dest eq src lin} {
    # parse and emit the given source line, containing the given
    # 3 tokens of text.  this includes assignments and branches.
    set opcodes [parse_assignment $dest $eq $src]
    foreach op $opcodes {
        emit_word $op $lin
    }
}  

proc parse_expressions {lin} {
    # evaluate any parenthesized expressions in the given string.  return the string with results substituted.
    # any form of arithmetic supported by Tcl expr command is allowed.
    while {[set f [string first \( $lin]] >= 0} {
        set l [string last \) $lin]
        if {$l < 0} {
            error "expression missing final parenthesis: $lin"
        }
        set result [namespace eval ::asm "expr {[string range $lin $f $l]}"]
        set lin "[string range $lin 0 [expr $f - 1]]$result[string range $lin [expr $l + 1] end]"
    }
    return $lin
}
    
proc parse_line {lin} {
    # parse a whole line of assembler file as input.  emit any resulting bytes into the ROM file.
    set lin [string trim $lin]
    console "<[format %04d ${::lnum}]> $lin"
    if {[string length $lin] == 0} {
        emit $lin ;# blank line for readability.
    } elseif {[string equal -length 2 $lin {//}]} {        
        emit $lin ;# comment line
    } elseif {[string equal -length 1 $lin \" ]} {
        # string constant line
        if { ! [string equal [string index $lin end] \" ]} {
            error "string missing final quote mark: $lin"
        }
        emit "// $lin"
        set lin [subst [string range $lin 1 end-1]]
        if {[string length $lin] != ([string length $lin] / 2 * 2)} {
            append lin "\x0" ;# zero-pad to an even number of bytes, because the ROM description file is word-addressed.  all addressible data must be word-aligned.
        }
        foreach {lo_char hi_char} [split $lin {}] {
            scan "$lo_char$hi_char" %c%c lo hi
            set w [expr {(($hi & 0xff) << 8) | ($lo & 0xff)}]
            set echo {} ;# eliminate newlines, tabs, etc from the echo.
            if {[string is print $hi_char]} {append echo $hi_char} else {append echo { }}
            if {[string is print $lo_char]} {append echo $lo_char} else {append echo { }}
            emit_word $w $echo
        }
    } elseif {[string equal -length 1 $lin {:}]} {
        # label line
        dict set ::labels [string trim $lin {: }] $::ipr
        emit "// $lin // = 0x[format %04x $::ipr]"
    } elseif {[string equal -length 1 $lin {[}]} {
        # explicit Tcl line in brackets.  return value is discarded.
        if { ! [string equal [string index $lin end] \] ]} {
            error "Tcl command missing final bracket: $lin"
        }
        namespace eval ::asm [string range $lin 1 end-1]
    } else {
        set sublin [string trim [parse_expressions $lin]] ;# parse any parenthesized arithmetic.
        set sublin [string trim [namespace eval ::asm "subst -nocommands {$sublin}"]] ;# fetches Tcl vars into the line.
        set tokens [regexp -all -inline -nocase {\S+} $sublin]
        set cmd [lindex $tokens 0]
        if {[llength [info commands "asm_$cmd"]] > 0} {
            # run tcl command, like a super-powered macro.  insert the whole source line as the first argument.
            namespace eval ::asm "asm_$cmd {$lin} [string range $sublin [string length $cmd] end]"
        } elseif {[llength $tokens] == 3} {
            # 3-part assignment, or branch instruction.
            parse3 [lindex $tokens 0] [lindex $tokens 1] [lindex $tokens 2] $lin
        } elseif {[string is integer -strict $sublin]} {
            # 16-bit constant in hex 0x, binary 0b, or decimal (no prefix) on a line by itself.
            emit_word $sublin $lin ;# simply insert it into the ROM as-is.
        } else {
            error "syntax error: $sublin"
        }    
    }
}

proc emit_word {w comment} {
    # emit the given 16-bit integer into the ROM, with the given comment.
    console "    0x[format %04x $::ipr] : [format %04x $w] // <[format %04d ${::lnum}]> $comment"
    emit "addr == 16'h[format %02x $::ipr] ? 16'h[format %04x $w] :  // <[format %04d ${::lnum}]> $comment"
    incr ::ipr
}

proc console {args} {
    # "puts" given args on the console.
#    if {$::asm_pass == $::pass(first)} {
        eval puts $args
#    }
}

proc emit {args} {
    # "puts" given args into the ROM description file.
    if {$::asm_pass == $::pass(emit)} {
        eval puts $::rom_file $args
    }
}

proc pack {dest_addr src_addr} {
    # pack the given dest and src into a 16-bit assignment opcode (a Tcl integer).
    return [expr ($src_addr << $::src_shift) | ($dest_addr << $::dest_shift)]
}

proc parse_text {asm_lines pass_num} {
    set ::asm_pass $pass_num
    console "####################   PASS $::asm_pass  ####################"
    set ::ipr 0
    set ::lnum 0
    set ::func {}
    set ::stackable [list]
    catch {namespace delete ::asm}
    namespace eval ::asm {}
    foreach lin $asm_lines {
        incr ::lnum
        parse_line $lin
    }
}

proc assemble {src_fn rom_fn} {
    # assemble the given source filename, overwriting the given verilog ROM description filename.

    set ::src_fn $src_fn
    set ::rom_fn $rom_fn
    puts "Assembling: $::src_fn"
    puts "        To: $::rom_fn"

    set f [open $::src_fn r]
    set asm_lines [split [read $f] \n]
    close $f

    # catalog of assembler loop passes.
    set ::pass(func)        1 ;# determine regs used by functions, and print the echo text to console.
    set ::pass(label)       2 ;# compute label addresses using accurate ipr.
    set ::pass(emit)        3 ;# emit opcodes into ROM file using real label addresses.
    set ::pass(first)       $::pass(func)
    set ::pass(final)       $::pass(emit)
    
    #proc report args {puts [info level 0]}
    #trace add execution parse enterstep report

    set ::func_regs [dict create]
    parse_text $asm_lines $::pass(func) 
    
    parse_text $asm_lines $::pass(label)
    
    set ::rom_file [open $::rom_fn w]
    puts $::rom_file "
        `include \"header.v\"

        module [file rootname [file tail $src_fn]] (
            input\[15:0\] addr
            ,output\[15:0\] data
        );
            assign data = 
    "    
    parse_text $asm_lines $::pass(emit)
    puts $::rom_file {        
                16'hxxxx;
        endmodule
    }
    close $::rom_file
}

