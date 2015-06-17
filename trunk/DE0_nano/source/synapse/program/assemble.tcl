
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
    sh1r0   0x350   \
    sh1l0   0x351   \
    sh4l0   0x352   \
    sh4r0   0x353   \
    -1      0x360   \
    _imm16_ 0x3a0   \
    fetchd  0x3b0   \
    nop     0       \
    ]
#    flags   0x340   \

set ::adest [dict create r0 0 r1 1 r2 2 r3 3 r4 4 r5 5 r6 6 r7 7 \
    r8 8 r9 9 r10 10 r11 11 r12 12 r13 13 r14 14 r15 15 \
    clrf    0x30    \
    setf    0x31    \
    nop     0x32    \
    fetcha  0x34    \
    breakpt 0x35    \
    br      0x38    \
    bn      0x39    \
    rtna    0x3e    \
    swapra  0x3f    \
    ]    

set ::flagsrc [dict create always 15 \
    eq0 7       gt0 6     lt0 5 \
    ad0c 4     and0z 3  \
    4z 2    2z 1    0z 0    ] 
    
set ::latency [dict create]

set ::dest_shift 10
set ::src_shift 0
set ::small_const_opcode 0x0200
set ::small_const_shift 0
set ::small_const_max 0xff
set ::flagsrc_shift 0

set ::labels [dict create]

set ::debugger_names [dict create]

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

proc is_expander_reference {reference} {
    return [expr [string first {@} $reference] >= 0]
}

proc expander_name {reference} {
    return [string trim [string range $reference [string first {@} $reference]+1 end]]
}

proc expander_data_reg {reference} {
    # return the register number (a Tcl integer) of the DATA register of the 
    # bus expander required to access the given register name.  
    return [dest [expander_name $reference]]
}

proc expander_addr_reg {reference} {
    # return the register number (a Tcl integer) of the ADDRESS register of the 
    # bus expander required to access the given register name.  
    return [dest [expander_name $reference]_addr]
}

proc indirect_reg {reference} {
    # return the register number (a Tcl integer) of the given reference, within the EXPANDED (the indirect) address space.
    return [string trim [string range $reference 0 [string first {@} $reference]-1]]    
}

proc label {name} {
    # translate given label name into its address (a Tcl integer).
    if {$::asm_pass <= $::pass(label)} {
        return 0
    }
    set name [string trim $name {: }]
    set local_name "${::func}/$name"
    if {[dict exists $::labels $local_name]} {
        return [dict get $::labels $local_name]
    }
    set local_name "/$name"
    if {[dict exists $::labels $local_name]} {
        return [dict get $::labels $local_name]
    }
    return [dict get $::labels $name]
}

proc set_label {name} {
#    if {[dict exists $::labels $label]} {
#        error "redefined label: $label"
#    }
    dict set ::labels $name $::ipr   
    return $name
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
    # bus expander access is fully supported in src or dest or both, even if the source
    # is an operator which has latency.
    
    set dest [string tolower $dest]
    set src [string tolower $src]
    set opcodes [list]
    if {[string equal $eq {=}]} {
        # assignment.
        set dest_num [dest $dest]
        if {[is_expander_reference $dest_num]} {
            # destination is addressed through a bus expander.  set the expander's address reg.
            console "$dest_num is [indirect_reg $dest_num] on expander addr [expander_addr_reg $dest_num] data [expander_data_reg $dest_num]"
            lappend opcodes [pack_small_constant [expander_addr_reg $dest_num] [indirect_reg $dest_num]]
            set dest_num [expander_data_reg $dest_num]
        }
        if {[dict exists $::asrc $src]} {
            # source is named.
            set src_num [src $src]
            if {[is_expander_reference $src_num]} {
                # source is addressed through a bus expander.  set the expander's address reg.
                lappend opcodes [pack_small_constant [expander_addr_reg $src_num] [indirect_reg $src_num]]
                set src_num [expander_data_reg $src_num]
                if {[is_expander_reference $dest_num] && ([expander_addr_reg $dest_num] == [expander_addr_reg $src_num])} {
                    error "source and destination use the same bus expander: $dest $eq $src"
                }
            }
            if {[dict exists $::latency $src]} {        
                # insert nop's to allow for operator result latency.  
                # to override this, program can use proper names of result registers instead of shorthand aliases.
                # also fewer nop's are needed if some opcodes are already packed e.g. expander accesses.
                set num_nops [expr [dict get $::latency $src] - [llength $opcodes]]
                for {set i 0} {$i < $num_nops} {incr i} {
                    lappend opcodes [pack [dest nop] [src nop]]
                }
            }
            lappend opcodes [pack $dest_num $src_num]
        } elseif {[string equal -length 1 $src {:}]} {
            # resolve label as 16-bit immediate, stored in the next ROM word.
            lappend opcodes [pack $dest_num [src _imm16_]]
            lappend opcodes [label $src]
        } elseif {[string is integer -strict $src]} {
            # source is immediate value in hex 0x, binary 0b, or decimal (no prefix)
            if {$src > $::small_const_max} {
                # 16-bit immediate, stored in the next ROM word.
                lappend opcodes [pack $dest_num [src _imm16_]]
                lappend opcodes $src
            } elseif {$src < 0} {
                error "constant out of range: $dest $eq $src"
            } else {
                # 8-bit immediate, stored in the same ROM word.
                lappend opcodes [pack_small_constant $dest_num $src]
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
        set lin \"
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
    if {$::ml_state == {tcl}} {
        # continuing a Tcl block.
        if {[string equal [string range $lin end-1 end] {>>} ]} {
            set ::ml_state {}
            append ::multi_line [string range $lin 0 end-2] \n
            namespace eval ::asm $::multi_line
        } else {
            append ::multi_line $lin \n
        }
    } elseif {[string length $lin] == 0} {
        emit_comment $lin ;# blank line for readability.
    } elseif {[string equal -length 2 $lin {//}]} {        
        emit_comment $lin ;# comment line
    } elseif {[string equal -length 1 $lin \" ]} {
        # string constant line
        if { ! [string equal [string index $lin end] \" ]} {
            error "string missing final quote mark: $lin"
        }
        emit_comment "// $lin"
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
        set_label "${::func}/[string trim $lin {: }]"
        emit_comment "// $lin // = 0x[format %04x $::ipr]"
    } elseif {[string equal -length 2 $lin {<<}]} {
        # explicit Tcl line in angle brackets.  return value is discarded.
        if {[string equal [string range $lin end-1 end] {>>} ]} {
            namespace eval ::asm [string range $lin 2 end-2]
        } else {
            set ::multi_line [string range $lin 2 end]
            set ::ml_state tcl
        }
    } else {
        set sublin [string trim [parse_expressions $lin]] ;# parse any parenthesized arithmetic.
        set sublin [string trim [namespace eval ::asm "subst -nocommands {$sublin}"]] ;# fetches Tcl vars into the line.
        set tokens [regexp -all -inline -nocase {\S+} $sublin]
        set cmd [lindex $tokens 0]
        if {[llength [info commands "::asm::$cmd"]] > 0} {
            # run tcl command, like a super-powered macro.  insert the whole source line as the first argument.
            namespace eval ::asm "$cmd {$lin} [string range $sublin [string length $cmd] end]"
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
    emit_mif "    [format %04x $::ipr] : [format %04x $w] ; -- <[format %04d ${::lnum}]> $comment"
    emit_bin $w
    incr ::ipr
}

proc console {args} {
    # "puts" given args on the console.
#    if {$::asm_pass == $::pass(first)} {
        eval puts $args
#    }
}

proc emit_comment {txt} {
    # "puts" given string into all output files as a comment.  must start with "//".
    console $txt
    emit $txt
    emit_mif $txt
}

proc emit {args} {
    # "puts" given args into the ROM description file.
    if {$::asm_pass == $::pass(emit)} {
        eval puts $::rom_file $args
    }
}

proc emit_mif {args} {
    # "puts" given args into the MIF memory initialization file.
    if {$::asm_pass == $::pass(emit)} {
        eval puts $::mif_file [string map {{//} {--}} $args]
    }
}

proc emit_bin {w} {
    # "puts" given 16-bit Tcl integer into the binary file.
    if {$::asm_pass == $::pass(emit)} {
        set lo [expr {$w & 0xff}]
        set hi [expr {($w >> 8) & 0xff}]
        puts -nonewline $::bin_file [format %c%c $lo $hi ]
    }
}

proc pack {dest_addr src_addr} {
    # pack the given dest and src into a 16-bit assignment opcode (a Tcl integer).
    return [expr ($src_addr << $::src_shift) | ($dest_addr << $::dest_shift)]
}

proc pack_small_constant {dest_addr constant} {
    return [pack $dest_addr [expr $::small_const_opcode | ($constant << $::small_const_shift)]]
}

namespace eval ::asm {
    # these procs may be redefined in other files to provide more functionality.
    
    proc start_file_handler {} {
    }

    proc end_file_handler {} {
    }
}

proc parse_lines {asm_lines pass_num} {
    foreach lin $asm_lines {
        incr ::lnum
        parse_line $lin
    }
}

proc parse_text {asm_lines pass_num} {
    set ::asm_pass $pass_num
    console "####################   PASS $::asm_pass  ####################"
    set ::ipr 0
    set ::lnum 0
    set ::ml_state {}
    set ::multi_line {}
    set ::func {}
    set ::stackable [list]
    #catch {namespace delete ::asm} ;# can't do this since it deletes all macros too.
    foreach vn [info vars ::asm::*] {
        unset $vn
    }
    namespace eval ::asm {}
    ::asm::start_file_handler
    parse_lines $asm_lines $pass_num
    ::asm::end_file_handler
}

proc assemble {src_fn rom_fn} {
    # assemble the given source filename, overwriting the given verilog ROM description filename.

    set ::src_fn $src_fn
    set ::rom_fn $rom_fn
    set ::mif_fn "[file rootname $rom_fn].mif"
    set ::bin_fn "[file rootname $rom_fn].bin"
    puts "Assembling: $::src_fn"
    puts "        To: $::rom_fn"
    puts "        To: $::mif_fn"
    puts "        To: $::bin_fn"

    set f [open $::src_fn r]
    set asm_lines [split [read $f] \n]
    close $f

    # catalog of assembler loop passes.
    set ::pass(func)        1 ;# determine regs used by functions (affects ipr), and print the echo text to console. 
    set ::pass(label)       2 ;# compute label addresses using accurate ipr.
    set ::pass(emit)        3 ;# emit opcodes into ROM file using real label addresses.
    set ::pass(first)       $::pass(func)
    set ::pass(final)       $::pass(emit)
    
    #proc report args {puts [info level 0]}
    #proc report args {puts "report: [lindex [lindex $args 0] 0]"}
    #proc report args {puts "report: $args"}
    #trace add execution parse_line enterstep report

    set ::func_regs [dict create]
    parse_text $asm_lines $::pass(func) 
    
    parse_text $asm_lines $::pass(label)
    set len_words $::ipr
    
    set ::rom_file [open $::rom_fn w]
    puts $::rom_file "
        `include \"header.v\"

        module [file rootname [file tail $src_fn]] (
            input wire\[15:0\] addr
            ,output wire\[15:0\] data
        );
            assign data = 
    "    
    set ::mif_file [open $::mif_fn w]
    puts $::mif_file "
        DEPTH = 1024 ;               -- The size of memory in words
        WIDTH = 16;                   -- bits per data word
        ADDRESS_RADIX = HEX;          
        DATA_RADIX = HEX;             
        CONTENT                       
        BEGIN
    "    
    set ::bin_file [open $::bin_fn w]
    fconfigure $::bin_file -translation binary
    puts -nonewline $::bin_file [format %c%c [expr {$len_words & 0xff}] [expr {($len_words >> 8) & 0xff}] ]
    parse_text $asm_lines $::pass(emit)
    puts $::rom_file {        
                16'hxxxx;
        endmodule
    }
    close $::rom_file
    puts $::mif_file {        
        END;
    }
    close $::mif_file
    close $::bin_file
}

