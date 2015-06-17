
# abbreviate the expr command for readability.
interp alias {} e {} expr

proc empty {str} {
    return [e {[string length $str] == 0}]
}

proc bytecode {byte name body} {
    set byte [e int($byte)]
    dict set ::java::bytecodes $byte [dict create \
        byte $byte \
        name $name \
        body [split $body \n]
    ]
}

proc next {} {
    incr ::java::jip
    return [read $::java::class_file 1]
}

proc unused_reg {} {
#patch: need code
    return g6
}

proc suggest_reg {reg} {
    if {[empty $reg]} {
        set reg [unused_reg]
    }
}

proc compile_class {class_fn} {
    # open a Java .class file by its given filename.
    # assemble corresponding Synapse native machine code by calling assembler macros.

    set ::java::class_file [open $class_fn rb]
    fconfigure $::java::class_file -translation binary
    set ::java::jip 0
    while { ! [eof $::java::class_file]} {
        set bc [next]
        set dic [dict get $::java::bytecodes $bc]
        console [format %04x=%02x=%s $::java::jip $bc [dict get $dic name]]
        parse_lines [dict get $dic body] $::asm_pass
    }
    close $::java::class_file
}

proc jpush {reg} {
    push "" $reg
}

proc jpop {{reg {}}} {
    pop "" [suggest_reg $reg]
}

proc jpushword {v} {
    set reg [unused_reg]
    parse3 $reg = $v
    jpush $reg
}

proc jref {v} {
    return $v
}

proc to_ref {v} {
    return $v
}

proc local {index {reg {}}} {
    set reg [suggest_reg $reg]
    ram_read $reg = 0001:$index
    return $reg
}

proc ::asm::j: {lin name} {
    # define a label inside a java bytecode script.
    set name [string trim $name {:}]
    set_label ${name}_$::java::jip
}

proc jlabel {name} {
    set name [string trim $name {:}]
    return [::label ${name}_$::java::jip]
}
