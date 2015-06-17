namespace eval ::java {

    bytecode 0x32 aaload {
        not_implem
    }

    bytecode 0x53 aastore {
        not_implem
    }

    bytecode 0x01 aconst_null {
        jpush [jref 0]
    }

    bytecode 0x19 aload {
        jpush [to_ref [local [next]]]
    }

    bytecode 0x2a aload_0 {
        jpush [to_ref [local 0]]
    }

    bytecode 0x2b aload_1 {
        jpush [to_ref [local 1]]
    }

    bytecode 0x2c aload_2 {
        jpush [to_ref [local 2]]
    }

    bytecode 0x2d aload_3 {
        jpush [to_ref [local 3]]
    }

    bytecode 0xbd anewarray {
        not_implem
    }

    bytecode 0xb0 areturn {
        jreturn [to_ref [jpop]]
    }

    bytecode 0xbe arraylength {
        not_implem
    }

    bytecode 0x3a astore {
        set_local [next] [to_ref [jpop]]
    }

    bytecode 0x4b astore_0 {
        set_local 0 [to_ref [jpop]]
    }

    bytecode 0x4c astore_1 {
        set_local 1 [to_ref [jpop]]
    }

    bytecode 0x4d astore_2 {
        set_local 2 [to_ref [jpop]]
    }

    bytecode 0x4e astore_3 {
        set_local 3 [to_ref [jpop]]
    }

    bytecode 0xbf athrow {
        not_implem
    }

    bytecode 0x33 baload {
        not_implem
    }

    bytecode 0x54 bastore {
        not_implem
    }

    bytecode 0x10 bipush {
        not_implem
    }

    bytecode 0x34 caload {
        not_implem
    }

    bytecode 0x55 castore {
        not_implem
    }

    bytecode 0xc0 checkcast {
        not_implem
    }

    bytecode 0x90 d2f {
        not_implem
    }

    bytecode 0x8e d2i {
        not_implem
    }

    bytecode 0x8f d2l {
        not_implem
    }

    bytecode 0x63 dadd {
        not_implem
    }

    bytecode 0x31 daload {
        not_implem
    }

    bytecode 0x52 dastore {
        not_implem
    }

    bytecode 0x98 dcmpg {
        not_implem
    }

    bytecode 0x97 dcmpl {
        not_implem
    }

    bytecode 0x0e dconst_0 {
        not_implem
    }

    bytecode 0x0f dconst_1 {
        not_implem
    }

    bytecode 0x6f ddiv {
        not_implem
    }

    bytecode 0x18 dload {
        not_implem
    }

    bytecode 0x26 dload_0 {
        not_implem
    }

    bytecode 0x27 dload_1 {
        not_implem
    }

    bytecode 0x28 dload_2 {
        not_implem
    }

    bytecode 0x29 dload_3 {
        not_implem
    }

    bytecode 0x6b dmul {
        not_implem
    }

    bytecode 0x77 dneg {
        not_implem
    }

    bytecode 0x73 drem {
        not_implem
    }

    bytecode 0xaf dreturn {
        not_implem
    }

    bytecode 0x39 dstore {
        not_implem
    }

    bytecode 0x47 dstore_0 {
        not_implem
    }

    bytecode 0x48 dstore_1 {
        not_implem
    }

    bytecode 0x49 dstore_2 {
        not_implem
    }

    bytecode 0x4a dstore_3 {
        not_implem
    }

    bytecode 0x67 dsub {
        not_implem
    }

    bytecode 0x59 dup {
        set r [jpop]
        jpush $r
        jpush $r
    }

    bytecode 0x5a dup_x1 {
        set v1 [jpop]
        set v2 [jpop]
        jpush $v1
        jpush $v2
        jpush $v1
    }

    bytecode 0x5b dup_x2 {
        set v1 [jpop]
        set v2 [jpop]
        set v3 [jpop]
        jpush $v1
        jpush $v3
        jpush $v2
        jpush $v1
    }

    bytecode 0x5c dup2 {
        set v1 [jpop]
        set v2 [jpop]
        jpush $v2
        jpush $v1
        jpush $v2
        jpush $v1
    }

    bytecode 0x5d dup2_x1 {
        set v1 [jpop]
        set v2 [jpop]
        set v3 [jpop]
        jpush $v2
        jpush $v1
        jpush $v3
        jpush $v2
        jpush $v1
    }

    bytecode 0x5e dup2_x2 {
        set v1 [jpop]
        set v2 [jpop]
        set v3 [jpop]
        set v4 [jpop]
        jpush $v2
        jpush $v1
        jpush $v4
        jpush $v3
        jpush $v2
        jpush $v1
    }

    bytecode 0x8d f2d {
        not_implem
    }

    bytecode 0x8b f2i {
        not_implem
    }

    bytecode 0x8c f2l {
        not_implem
    }

    bytecode 0x62 fadd {
        not_implem
    }

    bytecode 0x30 faload {
        not_implem
    }

    bytecode 0x51 fastore {
        not_implem
    }

    bytecode 0x96 fcmpg {
        not_implem
    }

    bytecode 0x95 fcmpl {
        not_implem
    }

    bytecode 0x0b fconst_0 {
        not_implem
    }

    bytecode 0x0c fconst_1 {
        not_implem
    }

    bytecode 0x0d fconst_2 {
        not_implem
    }

    bytecode 0x6e fdiv {
        not_implem
    }

    bytecode 0x17 fload {
        not_implem
    }

    bytecode 0x22 fload_0 {
        not_implem
    }

    bytecode 0x23 fload_1 {
        not_implem
    }

    bytecode 0x24 fload_2 {
        not_implem
    }

    bytecode 0x25 fload_3 {
        not_implem
    }

    bytecode 0x6a fmul {
        not_implem
    }

    bytecode 0x76 fneg {
        not_implem
    }

    bytecode 0x72 frem {
        not_implem
    }

    bytecode 0xae freturn {
        not_implem
    }

    bytecode 0x38 fstore {
        not_implem
    }

    bytecode 0x43 fstore_0 {
        not_implem
    }

    bytecode 0x44 fstore_1 {
        not_implem
    }

    bytecode 0x45 fstore_2 {
        not_implem
    }

    bytecode 0x46 fstore_3 {
        not_implem
    }

    bytecode 0x66 fsub {
        not_implem
    }

    bytecode 0xb4 getfield {
        not_implem
    }

    bytecode 0xb2 getstatic {
        not_implem
    }

    bytecode 0xa7 goto {
        not_implem
    }

    bytecode 0xc8 goto_w {
        not_implem
    }

    bytecode 0x91 i2b {
        not_implem
    }

    bytecode 0x92 i2c {
        not_implem
    }

    bytecode 0x87 i2d {
        not_implem
    }

    bytecode 0x86 i2f {
        not_implem
    }

    bytecode 0x85 i2l {
        not_implem
    }

    bytecode 0x93 i2s {
        not_implem
    }

    bytecode 0x60 iadd {
        jpop a
        jpop b
        jpush a+b
    }

    bytecode 0x2e iaload {
        not_implem
    }

    bytecode 0x7e iand {
        jpop a
        jpop b
        jpush and
    }

    bytecode 0x4f iastore {
        not_implem
    }

    bytecode 0x02 iconst_m1 {
        # -1 is the name of a Synapse "register", actually a constant generator.
        jpush -1
    }

    bytecode 0x03 iconst_0 {
        jpushword 0
    }

    bytecode 0x04 iconst_1 {
        jpushword 1
    }

    bytecode 0x05 iconst_2 {
        jpushword 2
    }

    bytecode 0x06 iconst_3 {
        jpushword 3
    }

    bytecode 0x07 iconst_4 {
        jpushword 4
    }

    bytecode 0x08 iconst_5 {
        jpushword 5
    }

    bytecode 0x6c idiv {
        not_implem
    }

    bytecode 0xa5 if_acmpeq {
        not_implem
    }

    bytecode 0xa6 if_acmpne {
        not_implem
    }

    bytecode 0x9f if_icmpeq {
        not_implem
    }

    bytecode 0xa0 if_icmpne {
        not_implem
    }

    bytecode 0xa1 if_icmplt {
        not_implem
    }

    bytecode 0xa2 if_icmpge {
        not_implem
    }

    bytecode 0xa3 if_icmpgt {
        not_implem
    }

    bytecode 0xa4 if_icmple {
        not_implem
    }

    bytecode 0x99 ifeq {
        not_implem
    }

    bytecode 0x9a ifne {
        not_implem
    }

    bytecode 0x9b iflt {
        not_implem
    }

    bytecode 0x9c ifge {
        not_implem
    }

    bytecode 0x9d ifgt {
        not_implem
    }

    bytecode 0x9e ifle {
        not_implem
    }

    bytecode 0xc7 ifnonnull {
        not_implem
    }

    bytecode 0xc6 ifnull {
        not_implem
    }

    bytecode 0x84 iinc {
        set index [next]
        local $index a
        parse3 b = [next] ""
        setlocal $index a+b
    }

    bytecode 0x15 iload {
        jpush ([local [next]])
    }

    bytecode 0x1a iload_0 {
        jpush ([local 0])
    }

    bytecode 0x1b iload_1 {
        jpush ([local 1])
    }

    bytecode 0x1c iload_2 {
        jpush ([local 2])
    }

    bytecode 0x1d iload_3 {
        jpush ([local 3])
    }

    bytecode 0x68 imul {
        not_implem
    }

    bytecode 0x74 ineg {
        jpop a
        b = -1 
        jpush xor
    }

    bytecode 0xc1 instanceof {
        not_implem
    }

    bytecode 0xba invokedynamic {
        not_implem
    }

    bytecode 0xb9 invokeinterface {
        not_implem
    }

    bytecode 0xb7 invokespecial {
        not_implem
    }

    bytecode 0xb8 invokestatic {
        not_implem
    }

    bytecode 0xb6 invokevirtual {
        not_implem
    }

    bytecode 0x80 ior {
        jpop a
        jpop b
        jpush or
    }

    bytecode 0x70 irem {
        not_implem
    }

    bytecode 0xac ireturn {
        jpop a
        rtn
    }
all routines must be rewritten as a raw assembly context. working upward.
    bytecode 0x78 ishl {
        jpop j
        jpop a
        b = 0x1f 
        i = and  
        a = j    
        j = -1   
        br iz done_$::java::ip
        << set_label again_$::java::ip >>
        a = a<<1
        j = i+j
        bn iz again_$::java::ip
        << set_label done_$::java::ip >>
    }

    bytecode 0x7a ishr {
        not_implem
    }

    bytecode 0x36 istore {
        not_implem
    }

    bytecode 0x3b istore_0 {
        not_implem
    }

    bytecode 0x3c istore_1 {
        not_implem
    }

    bytecode 0x3d istore_2 {
        not_implem
    }

    bytecode 0x3e istore_3 {
        not_implem
    }

    bytecode 0x64 isub {
        not_implem
    }

    bytecode 0x7c iushr {
        not_implem
    }

    bytecode 0x82 ixor {
        not_implem
    }

    bytecode 0xa8 jsr {
        not_implem
    }

    bytecode 0xc9 jsr_w {
        not_implem
    }

    bytecode 0x8a l2d {
        not_implem
    }

    bytecode 0x89 l2f {
        not_implem
    }

    bytecode 0x88 l2i {
        not_implem
    }

    bytecode 0x61 ladd {
        not_implem
    }

    bytecode 0x2f laload {
        not_implem
    }

    bytecode 0x7f land {
        not_implem
    }

    bytecode 0x50 lastore {
        not_implem
    }

    bytecode 0x94 lcmp {
        not_implem
    }

    bytecode 0x09 lconst_0 {
        not_implem
    }

    bytecode 0x0a lconst_1 {
        not_implem
    }

    bytecode 0x12 ldc {
        not_implem
    }

    bytecode 0x13 ldc_w {
        not_implem
    }

    bytecode 0x14 ldc2_w {
        not_implem
    }

    bytecode 0x6d ldiv {
        not_implem
    }

    bytecode 0x16 lload {
        not_implem
    }

    bytecode 0x1e lload_0 {
        not_implem
    }

    bytecode 0x1f lload_1 {
        not_implem
    }

    bytecode 0x20 lload_2 {
        not_implem
    }

    bytecode 0x21 lload_3 {
        not_implem
    }

    bytecode 0x69 lmul {
        not_implem
    }

    bytecode 0x75 lneg {
        not_implem
    }

    bytecode 0xab lookupswitch {
        not_implem
    }

    bytecode 0x81 lor {
        not_implem
    }

    bytecode 0x71 lrem {
        not_implem
    }

    bytecode 0xad lreturn {
        not_implem
    }

    bytecode 0x79 lshl {
        not_implem
    }

    bytecode 0x7b lshr {
        not_implem
    }

    bytecode 0x37 lstore {
        not_implem
    }

    bytecode 0x3f lstore_0 {
        not_implem
    }

    bytecode 0x40 lstore_1 {
        not_implem
    }

    bytecode 0x41 lstore_2 {
        not_implem
    }

    bytecode 0x42 lstore_3 {
        not_implem
    }

    bytecode 0x65 lsub {
        not_implem
    }

    bytecode 0x7d lushr {
        not_implem
    }

    bytecode 0x83 lxor {
        not_implem
    }

    bytecode 0xc2 monitorenter {
        not_implem
    }

    bytecode 0xc3 monitorexit {
        not_implem
    }

    bytecode 0xc5 multianewarray {
        not_implem
    }

    bytecode 0xbb new {
        not_implem
    }

    bytecode 0xbc newarray {
        not_implem
    }

    bytecode 0x00 nop {
        not_implem
    }

    bytecode 0x57 pop {
        not_implem
    }

    bytecode 0x58 pop2 {
        not_implem
    }

    bytecode 0xb5 putfield {
        not_implem
    }

    bytecode 0xb3 putstatic {
        not_implem
    }

    bytecode 0xa9 ret {
        not_implem
    }

    bytecode 0xb1 return {
        not_implem
    }

    bytecode 0x35 saload {
        not_implem
    }

    bytecode 0x56 sastore {
        not_implem
    }

    bytecode 0x11 sipush {
        not_implem
    }

    bytecode 0x5f swap {
        not_implem
    }

    bytecode 0xaa tableswitch {
        not_implem
    }

    bytecode 0xc4 wide {
        not_implem
    }

}