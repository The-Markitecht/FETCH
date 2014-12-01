
# assembler, with assembly source code for Synapse316 mcu.

# muxer source & destination maps.
set ::asrc [dict create r0 0 r1 1 r2 2 r3 3 r4 4 r5 5 r6 6 r7 7 \
    r8 8 r9 9 r10 10 r11 11 r12 12 r13 13 r14 14 r15 15 \
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
    imm16   0x3a0   \
    nop     0       \
    ]

set ::adest [dict create r0 0 r1 1 r2 2 r3 3 r4 4 r5 5 r6 6 r7 7 \
    r8 8 r9 9 r10 10 r11 11 r12 12 r13 13 r14 14 r15 15 \
    clrf    0x30    \
    setf    0x31    \
    br      0x38    \
    bn      0x39    \
    nop     0x32    \
    ]    

set ::flagsrc [dict create always 5 \
    ad0z 4   ad0c 3     and0z 2     ad1z 1  ad2z 0 ] 

set ::dest_shift 10
set ::src_shift 0
set ::small_const_opcode 0x0200
set ::small_const_shift 0
set ::small_const_max 0xff
set ::flagsrc_shift 0

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
dict set ::asrc + [dict get $::asrc ad0]
dict set ::asrc and [dict get $::asrc and0]
dict set ::asrc or [dict get $::asrc or0]
dict set ::asrc xor [dict get $::asrc xor0]
dict set ::asrc a>>1 [dict get $::asrc sh1r0]
dict set ::asrc a<<1 [dict get $::asrc sh1l0]
dict set ::asrc a<<4 [dict get $::asrc sh4l0]
dict set ::asrc a>>4 [dict get $::asrc sh4r0]
dict set ::flagsrc c [dict get $::flagsrc ad0c]
dict set ::flagsrc z [dict get $::flagsrc ad0z]
dict set ::flagsrc 1z [dict get $::flagsrc ad1z]
dict set ::flagsrc 2z [dict get $::flagsrc ad2z]

# application-specific register aliases.    
dict set ::adest atx_data 0x8
dict set ::adest atx_load 0x9

dict set ::asrc  atx_busy 0x40

dict set ::adest leds 0xa

# assembly source code.    
set ::asmcode {
    // write some data on the UART.    
    
    leds = 0x01 
    atx_load = 0 
    
    // using x as pass counter.  shows on LEDs.
    x = 0x40
    y = 1
    
    // wait for UART to be idle (not busy).
    a = x
    a = a>>4    
    leds = a>>4
    a = 1
    b = atx_busy
    nop = nop
    bn and0z 0x08
    
    // write a byte to UART.  
    // can't use the actual register load strobe that occurs here, because it's 
    // much too fast for the UART to sample.
    // instead use a dedicated output word atx_load.
    atx_data = imm16
    0x55
    // that doesn't have to be a imm16 any more.  it could be a small-constant assign.
    atx_load = 1
    
    // wait until UART is busy, as acknowledgement.
    a = 1
    b = atx_busy
    leds = 0x04
    x = ad2
    br and0z 0x10

    atx_load = 0 
    
    br always 4
}    

# assembler functions.
proc parse {dest eq src} {
    set dest [string tolower $dest]
    set src [string tolower $src]
    set opcodes [list]
    if {[string equal $eq {=}]} {
        # assignment.
        if {[dict exists $::asrc $src]} {
            # source is named.
            lappend opcodes [expr ([dict get $::asrc $src] << $::src_shift) | ([dict get $::adest $dest] << $::dest_shift)]
        } elseif {[string is integer -strict $src]} {
            # source is small immediate value.
            if {$src > $::small_const_max || $src < 0} {
                error "constant out of range: $dest $eq $src"
            }
            lappend opcodes [expr ([dict get $::adest $dest] << $::dest_shift) | $::small_const_opcode | ($src << $::small_const_shift)]
        } else {
            error "source is not recognized: $dest $eq $src"
        }
    } elseif {[string equal $dest br] || [string equal $dest bn]} {
        # branch (b flagname addr)
        set instruction $dest
        set flagname $eq
        set addr $src
        lappend opcodes [expr ([dict get $::flagsrc $flagname] << $::flagsrc_shift) | ([dict get $::adest $instruction] << $::dest_shift)]
        lappend opcodes $addr
    } else {
        error "syntax error: $dest $eq $src"
    }    
    return $opcodes
}
    
proc emitword {w comment} {
    puts "    [format %02x $::ipr] : [format %04x $w] // $comment"
    puts $::f "addr == 8'h[format %02x $::ipr] ? 16'h[format %04x $w] :  // $comment"
    incr ::ipr
}

proc emitline {lin} {
    set lin [string trim $lin]
    puts $lin
    if {[string length $lin] == 0} return
    if {[string equal -length 2 $lin {//}]} {
        # comment line
        puts $::f $lin
    } elseif {[string equal -length 2 $lin {0x}]} {
        # 16-bit constant in hex
        if {[scan [string range $lin 2 end] %04x num] != 1} {
            error "illegal 16-bit constant: $lin"
        }
        emitword $num $lin
    } else {
        set words [regexp -all -inline -nocase {\S+} $lin]
        if {[llength $words] == 3} {
            set opcodes [parse [lindex $words 0] [lindex $words 1] [lindex $words 2]]
            foreach op $opcodes {
                emitword $op $lin
            }
        } else {
            error "syntax error: $lin"
        }    
    }
}

# #########################################################################

#proc report args {puts [info level 0]}
#trace add execution parse enterstep report

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
