
# assembler, with assembly source code for Synapse316 mcu.

# #########################################################################
# muxer source & destination maps.
set ::asrc [dict create r0 0 r1 1 r2 2 r3 3 r4 4 r5 5 r6 6 r7 7 \
    r8 8 r9 9 r10 10 r11 11 r12 12 r13 13 r14 14 r15 15 \
    rtna 0x2f \
    in0 0x40 in1 0x41 in2 0x42 in3 0x43 in4 0x44 in5 0x45 in6 0x46 in7 0x47 \
    in8 0x48 in9 0x49 in10 0x4a in11 0x4b in12 0x4c in13 0x4d in14 0x4e in15 0x4f \
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
    rtna    0x2f    \
    clrf    0x30    \
    setf    0x31    \
    nop     0x32    \
    fetcha  0x34    \
    br      0x38    \
    bn      0x39    \
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

proc src {src_name} {
    return [dict get $::asrc $src_name]
}

proc dest {dest_name} {
    return [dict get $::adest $dest_name]
}

# common register aliases.
proc alias_both {name addr} {
    dict set ::asrc $name $addr
    dict set ::adest $name $addr
}
alias_both a 0
alias_both b 1
alias_both i 2
alias_both j 3
alias_both x 4
alias_both y 5
alias_both g6  6
alias_both g7  7
alias_both g8  8
alias_both g9  9
alias_both g10 10
alias_both g11 11
alias_both g12 12
alias_both g13 13
alias_both g14 14
alias_both g15 15
dict set ::asrc a+b [src ad0]
dict set ::asrc i+j [src ad1]
dict set ::asrc x+y [src ad2]
dict set ::asrc and [src and0]
dict set ::asrc or  [src or0]
dict set ::asrc xor [src xor0]
dict set ::asrc a>>1 [src sh1r0]
dict set ::asrc a<<1 [src sh1l0]
dict set ::asrc a<<4 [src sh4l0]
dict set ::asrc a>>4 [src sh4r0]
dict set ::flagsrc c [dict get $::flagsrc ad0c]
dict set ::flagsrc z [dict get $::flagsrc ad0z]
dict set ::flagsrc 1z [dict get $::flagsrc ad1z]
dict set ::flagsrc 2z [dict get $::flagsrc ad2z]

# #########################################################################
# application-specific register aliases.    
dict set ::adest atx_data 0x8
dict set ::adest atx_load 0x9

dict set ::asrc  atx_busy [dict get $::asrc in0]

dict set ::adest leds 0xa

# #########################################################################
# assembly source code.    
set ::asmcode {
    // write some data on the UART.    

    leds = 0b00000001 
    atx_load = 0 
    
    // using x as pass counter.  shows on LEDs.
    x = 0xff00
    y = -1

    // using i as index into string.
    i = 0
    
    // cache the string limit.
    a = 5
    b = 0xffff
    nop = nop
    g6 = xor
    
:again
    x = x+y
    nop = nop
    a = x
    a = a>>4    
    leds = a>>4

    // fetch a word from test pattern to the UART.  its low byte is a character.
    j = :test_pattern
    nop = nop
    fetcha = i+j
    g7 = fetchd
    call :putchar

    // increment index & wrap around end of pattern.
    j = 1
    nop = nop
    i = i+j
    j = g6
    nop = nop
    bn 1z :no_wrap
    i = 0
:no_wrap
    
    // repeat forever.
    br always :again        

    
// routine sends out the low byte from g7 to the UART.  blocks until the UART accepts the byte.
:putchar    

    // wait for UART to be idle (not busy).
    a = 1
:wait_for_idle
    b = atx_busy
    nop = nop
    bn and0z :wait_for_idle
    
    // push word to the UART.  its low byte is a character.
    atx_data = g7
        
    // can't use the actual register load strobe that occurs here, because it's 
    // much too fast for the UART to sample.
    // instead use a dedicated output word atx_load.
    atx_load = 1
    
    // wait until UART is busy, as acknowledgement.
    a = 1
:wait_for_busy    
    b = atx_busy
    leds = 0b00000100 
    br and0z :wait_for_busy

    atx_load = 0 
    return
    
    
:test_pattern
    0x55
    0xaa
    0b01000001
    66
    0x0d
    0x0a   
    
:msg
    "testes, testes,\n\t 1...\n\t 2...\n\t 3?? \n\x00"
}    

# #########################################################################
# assembler functions.

proc parse {dest eq src} {
    set dest [string tolower $dest]
    set src [string tolower $src]
    set opcodes [list]
    if {[string equal $eq {=}]} {
        # assignment.
        if {[dict exists $::asrc $src]} {
            # source is named.
            lappend opcodes [pack [dest $dest] [src $src]]
        } elseif {[string equal -length 1 $src {:}]} {
            # resolve label as 16-bit immediate, stored in the next program word.
            lappend opcodes [pack [dest $dest] [src _imm16_]]
            lappend opcodes [get_label $src]
        } elseif {[string is integer -strict $src]} {
            # source is immediate value in hex 0x, binary 0b, or decimal (no prefix)
            if {$src > $::small_const_max} {
                # 16-bit immediate, stored in the next program word.
                lappend opcodes [pack [dest $dest] [src _imm16_]]
                lappend opcodes $src
            } elseif {$src < 0} {
                error "constant out of range: $dest $eq $src"
            } else {
                # 8-bit immediate, stored in the same program word.
                lappend opcodes [expr ([dest $dest] << $::dest_shift) | $::small_const_opcode | ($src << $::small_const_shift)]
            }
        } else {
            error "source is not recognized: $dest $eq $src"
        }
    } elseif {[string equal $dest br] || [string equal $dest bn]} {
        # branch (b flagname addr)
        set instruction $dest
        set flagname $eq
        set addr $src
        if {[string equal -length 1 $addr {:}]} {
            set addr [get_label $addr]
        }
        lappend opcodes [expr ([dict get $::flagsrc $flagname] << $::flagsrc_shift) | ([dest $instruction] << $::dest_shift)]
        lappend opcodes $addr
    } else {
        error "syntax error: $dest $eq $src"
    }    
    return $opcodes
}
    
proc emitline {lin} {
    set lin [string trim $lin]
    console $lin
    if {[string length $lin] == 0} return
    if {[string equal -length 2 $lin {//}]} {
        # comment line
        emit $lin
    } elseif {[string is integer -strict $lin]} {
        # 16-bit constant in hex 0x, binary 0b, or decimal (no prefix) on a line by itself.
        emitword $lin $lin ;# simply insert it into the ROM as-is.
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
            emitword $w $echo
        }
    } elseif {[string equal -length 1 $lin {:}]} {
        # label line
        dict set ::labels [string trim $lin {:}] $::ipr
        emit "// $lin // = 0x[format %02x $::ipr]"
    } else {
        set words [regexp -all -inline -nocase {\S+} $lin]
        set cmd "asm_[lindex $words 0]"
        if {[llength $words] == 3} {
            # parse a 3-word line.  this includes assignments and branches.
            set opcodes [parse [lindex $words 0] [lindex $words 1] [lindex $words 2]]
            foreach op $opcodes {
                emitword $op $lin
            }
        } elseif {[llength [info commands $cmd]] > 0} {
            # run tcl command, like a super-powered macro.  insert the whole source line as the first argument.
            eval $cmd [list $lin] [lrange $words 1 end]
        } else {
            error "syntax error: $lin"
        }    
    }
}

proc emitword {w comment} {
    console "    [format %02x $::ipr] : [format %04x $w] // $comment"
    emit "addr == 8'h[format %02x $::ipr] ? 16'h[format %04x $w] :  // $comment"
    incr ::ipr
}

proc console {args} {
#    if {$::asm_pass == 1} {
        eval puts $args
#    }
}

proc emit {args} {
    if {$::asm_pass == 2} {
        eval puts $::f $args
    }
}

proc get_label {name} {
    if {$::asm_pass == 1} {
        return 0
    }
    return [dict get $::labels [string trim $name {:}]]
}

proc pack {dest_addr src_addr} {
    return [expr ($src_addr << $::src_shift) | ($dest_addr << $::dest_shift)]
}

# #########################################################################
# macro functions for calling in assembly source code.

proc asm_call {lin label} {
    emitword [pack [dest rtna] [src _imm16_]] $lin
    emitword [get_label $label] $lin
    emitword [pack [dest swapra] [src nop]] $lin
}

proc asm_return {lin} {
    emitword [pack [dest swapra] [src nop]] $lin
}

# #########################################################################
# main script

#proc report args {puts [info level 0]}
#trace add execution parse enterstep report

# first pass is only to compute label addresses, and print the echo text to console.
set ::asm_pass 1
set ::ipr 0
foreach lin [split $::asmcode \n] {
    emitline $lin
}

# second pass is to utilize real label addresses, and write the ROM file.
set ::asm_pass 2 
set ::ipr 0
console {####################   SECOND PASS   ####################}
set ::f [open ../source/program.v w]
puts $::f {
    `timescale 1 ns / 1 ns

    module coderom (
        input[15:0] addr
        ,output[15:0] data
    );
        assign data = 
}

set ::ipr 0
foreach lin [split $::asmcode \n] {
    emitline $lin
}

puts $::f {        
            16'hxxxx;
    endmodule
}

close $::f
