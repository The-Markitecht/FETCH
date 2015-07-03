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

also create an M9K ram for locals.
also create an operand stack with special support for replacing the top 1 or 2 cells in 1 cycle.
also create operators addressable by the synapse, which see their operands directly in the top few cells of operand stack.
all that is peripherals to the synapse; no change to synapse316.v.

then the machine is a mostly-hardware JVM; it's just managed by the synapse.
all that could be done in 1 shot: an altera stack megafunc, topped by a section of fabric
configured to act as the area near the top of the stack.  that's where the special operations happen.
trouble with that idea is method calls.  a method using 50 locals, even if the fabric area is
50 deep, still takes 50+ cycles just to call, while those 50 slots are created on top of the stack,
one per cycle.  also the opposite happens on return.  that's where a RAM-based stack run by a
soft JVM is much faster.  allocating the 50 is just a matter of incrementing the SP by 50.

a good compromise: a unified stack (operands + locals + call stack) in dual-port M9k, 
managed by synapse.  a set of operators taking their operands from those 2 ports.
the synapse then copies a result from one of those to an appropriate RAM cell (determined
at compile time) (could be operands or locals) and adjusts the SP.
SP is a dedicated register.
SP drives dedicated adders to implement SP-relative addressing.
one adder for each ram port, each with its own offset register.

would that really be any faster than a simple 1-port M9k and a soft JVM brute-forced by the synapse??
(assuming an SP-relative address adder is provided.)
not sure.  either way, each operand must be set up by loading its offset.  then its value
retrieved (regardless of whether the value is directly accessible by synapse).  
then operated.  then result offset loaded.  then result stored.

yeah the 2-port is better.  synapse could load the result offset while operator is
computing.  also more parallelism if both operand offsets (which are known at compile time)
are loaded in the same cycle.  even better if they can both fit into 1 synapse "small constant".
the synapse can automatically trigger various numbers of wait states in the glue logic by
which register addresses it writes at each stage.
while the glue logic plays out the java operation (often unattended) synapse can proceed to
e.g. adjust the SP.  make that safe by writing to a SP buffer register, where the new SP is
held until end of java operation is signaled by the glue logic.
SP handling can be greatly sped up by a dedicated SP increment adder.  a synapse write to the
adder triggers it.  that's 1 cycle to adjust the SP instead of 3 (load increment; wait for compute;
copy result to SP).  the dedicated adder is identical to the synapse "accumulator" concept i considered before.
accumulators weren't used then because they couldn't fully replace general purpose adders, and
the redundancy took up too much area for pure synapse MCU.  but for java, bigger area is OK.

"glue logic" of the 2-port design is really java execution logic.  includes a 
highly sequential FSM to drive timing.  the FSM is managed and driven by the synapse.
so the synapse can be stripped of some of its operators for area & speed.
synapse only has to implement a kind of "microcode" for the java logic, except for special
cases like class loading, method calling, or native call marshaling.

for a typical java instruction the synapse would: 
1 cycle: load both operand offsets from its exr (small constant).
    some timing info can also be derived from the register address written.
1 cycle: write the offset to address the bytecode result (could be operands or locals).
    some timing info can also be derived from the register address written.
    e.g. how many cycles to wait before applying the address to the RAM port, which was
    recently busy reading an operand.
1 cycle: write the SP increment.
    more timing info can be derived from the register address written.
    e.g. how many cycles to wait before applying new SP value.

the bytecode scripts should call generalized tcl procs for each of those steps, to help
decouple the bytecode scripts from the java logic implementation.
then some of the scripts become more declarative and less imperative.
    
an advantage of the hardware-assisted M9k soft JVM (the 2-port design) is no need for
e.g. data flow analysis at compile time.  nor register/resource assigments by the compiler.
(those things are involved in most other solutions for eliminating operand push/pop cycles.)
the compiler can be fairly simple, kind of like my first attempt here.  just the bytecode
scripts have to be carefully written to drive the java logic correctly and not violate its timing.
they're tightly coupled to the java logic.

there are about 60 kbytes of m9k available today.  
that's the max size of the unified java stack (operands + locals + call stack).
that should be fine as long as the object heap is elsewhere (SDRAM).
so getfield will be slower (7-10 cycles).

SP can be instrumented by hardware to report the max stack usage.

the hardware-assisted M9k soft JVM (the 2-port design) 
might take up as many cycles as the brute-force approach i already have.
synapse makes brute-force so easy, and the bytecodes i implemented so far don't have
pushes/pops on them that the soft JVM wouldn't have.
but the trouble with brute-force is yet to come.  it puts all locals in SDRAM, because
they won't all fit in synapse registers, and the operand stack is not random-access,
so they can't go there.  SDRAM is SO SLOW for locals.
but i COULD (after proof of concept) put all locals in a stack in m9k instead of SDRAM.
keep the operand stack as-is.  brute-force java instructions.
keep the call stack as-is (it's simply pushed into the operand stack).
or merge the call stack into the locals stack in m9k, PROVIDED that the jvm spec doesn't
rely on the operand stack being the same as the call stack, e.g. allowing an arithmetic
bytecode early in a method body, with no preceding operand push, using a method parameter
as an operand.  CHECK ON THAT BEFORE CHOOSING A DESIGN.  hardware-assist vs. brute-force.
no the jvm doesn't allow that.
yes the jvm is explicitly tolerant of various stack architectures.  but per the
details of method invocation 3.7, it's by far fastest to have a unified
stack for operands, method parms (call stack) and locals.  the "j stack".

either way the heap is probably in SDRAM due to size.  so getfield will be slower (7-10 cycles).
that could be mitigated by marking certain classes as "fast storage".  keep those in m9k.
that's 2 heaps.  generalize to N heaps instead, for portability.

hardware (synapse operators):
    jop0 thru jop3 = java operands, assuming NUM_JOP_REGS = 4.  r/w.
        java operators are wired directly to these.
        these are wired as a virtual extension to the j stack.  they hold the content
        of the top-most cells of the j stack.  jop0 is used as top-of-stack content.
        every j stack push actually writes the new value to jop0.  jop1 thru jop3 shift in
        the value of their neighbor.  jop3 writes to m9k at jsp-4.
        pop is the opposite of that process.
        whenever j stack data is accessed (jd), it uses these if jspi < NUM_JOP_REGS.
    jd = java stack data bits.  r/w.  to/from m9k, or jop regs if jspi < NUM_JOP_REGS.
        this might be further complicated by accessing locals with jsofad.
        but do i even need this??  jpop and the arithmetic operators might obsolete this.
    jsp = java stack pointer.  r/w.  
    obsolete: jsp+1 = reads as jsp incremented.  writes go to the j stack and auto-increments jsp.
    obsolete: jsp-1 = reads as jsp decremented.  writes ignored.
    jpush = write-only destination that writes to jop0 and causes a j stack push (all jop's shift, jop3 to m9k).
    jpop = read-only source that reads from jop0 and causes a j stack pop (all jop's shift, jop3 from m9k).
    jpopwr = write-only.  like jpop, but jop0 loads the value written instead of shifting in from jop1,
        and all arithmetic operator results are preserved, unaffected by the pop.
        this is equivalent to 2 pops then a push, but faster.
        use to implement binary arithmitic bytecodes in just 1 cycle.
    jspi = jsp increment.  the operand for the jsp arbitrary adder.  r/w.
    jspinow = same as jspi but writing it causes jsp to load the same value on the same cycle as jspad.
    jspad = jsp adder result = jsp + jspi.  read only.
    arithmetic operator results = read only.
        implement these in their own module separate from the j stack.
    jsof = start of frame pointer.  r/w.  used to access locals.
    jsofi = jsof increment.  the operand for the jsof arbitrary adder.
    jsofinow = same as jsofi but writing it causes jsof to load the same value on the same cycle as jsofad.
    jsofad = jsof adder result = jsof + jsofi.  read only.
hardware (not directly adressible by synapse):
    jstk_addr_comb = combinational signal; the address bits for the m9k containing java stack.
        = jsp for stack accesses, or jspad for locals etc.  trigger that by recent
        write to jspi.  end it after about 2 cycles, or the next access to j stack data?
        
how to utilize synapse native operator regs?  at all??  no.  avoid them for java data,
to prevent any possibility of contention during implementation.  use only for control or
out-of-band work.

jop regs might make it tricky/impossible to arbitrarily adjust jsp.
not really.  just burns a few cycles.  adjusting up:
    jpush once for each unit of desired increment, limit = NUM_JOP_REGS.  minimum = 0.
    further increment jsp by the desired amount, less NUM_JOP_REGS.
adjusting down is the opposite:
    decrement jsp by the desired amount, less NUM_JOP_REGS.  minimum = 0.
    jpop once for each unit of desired decrement, limit = NUM_JOP_REGS. 
    
implement a few bytecodes for the j stack machine to validate the machine before implementing in verilog.
    
    bytecode 0x78 ishl {
        jpop j
        jpop a
        b = 0x1f 
        i = and  
        a = j    
        j = -1   
        br iz [jlabel done]
        j: again:
        a = a<<1
        j = i+j
        bn iz [jlabel again]
        j: done:
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