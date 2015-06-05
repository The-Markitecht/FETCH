
# define any application-specific macros or functions here.

namespace eval ::asm {

    proc show_error_code {lin error_code} {
        parse3 leds = $error_code "$lin // leds = $error_code"
    }
    
    proc error_halt {lin} {
        jmp $lin $::ipr  
    }

    proc error_halt_code {lin error_code} {
        show_error_code $lin $error_code
        error_halt $lin
    }

    proc vdefine {lin name valu} {
        if {$::asm_pass == $::pass(emit)} {
            puts $::vdefines "`define [string toupper $name]  [expr $valu]"
        }
        setvar $lin $name $valu
    }
    
    proc ram_define {lin name {size_bytes 2}} {
        # ram_counter must increment after memorizing, because the size may vary from one call to the next.
        setvar $lin $name $::asm::ram_counter
        set ::asm::ram_counter [ram_split [expr {[ram_join $::asm::ram_counter] + $size_bytes}]]
    }

    proc ram {lin left eq right} {
        # read or write RAM depending on direction of the assignment statement 
        # (which side has the RAM address in hi'lo format).
        if {[string first {'} $left] >= 0} {
            ram_write $lin $left $eq $right
        } elseif {[string first {'} $right] >= 0} {
            ram_read $lin $left $eq $right
        } else {
            error "invalid RAM address format"
        }
    }
    
    proc ram_read {lin reg_name eq addr} {
        lassign [split $addr {'}] hi lo
        parse3 av_ad_hi $eq [expr {$hi}] "$lin // av_ad_hi = $hi"
        parse3 av_ad_lo $eq [expr {$lo}] "$lin // av_ad_lo = $lo"
        parse3 $reg_name $eq av_write_data "$lin // $reg_name = av_write_data // start read cycle"
        parse3 $reg_name $eq av_read_data  "$lin // $reg_name = av_read_data // finish read cycle"
    }

    proc ram_write {lin addr eq reg_name} {
        lassign [split $addr {'}] hi lo
        parse3 av_ad_hi $eq [expr {$hi}] "$lin // av_ad_hi = $hi"
        parse3 av_ad_lo $eq [expr {$lo}] "$lin // av_ad_lo = $lo"
        parse3 av_write_data $eq $reg_name "$lin // av_write_data = $reg_name"
    }

    proc ram_split {addr} {
        # pass an address in Tcl integer format.
        # returns the address in hi'lo format, for use with other macros.
        
        set hi [expr {$addr >> 16}]
        set lo [expr {$addr & 0xffff}]
        return ${hi}'$lo
    }
    
    proc ram_join {addr} {
        # pass an address in hi'lo format.  (Tcl integer is also acceptable.)
        # returns the address in Tcl integer format.        
        if {[string first {'} $addr] < 0} {return [expr {$addr}]}
        lassign [split $addr {'}] hi lo
        return [expr {($hi << 16) | $lo}]
    }
    
    proc struct_read {lin  value_reg  eq  addr  offset_reg} {
        push $lin a
        push $lin b
        lassign [split $addr {'}] hi lo
        parse3 b $eq $offset_reg $lin
        parse3 a $eq $lo $lin
        parse3 av_ad_hi $eq [expr {$hi}] "$lin // av_ad_hi = $hi"
        parse3 av_ad_lo $eq ad0          "$lin // av_ad_lo = $lo"
        parse3 $value_reg $eq av_write_data "$lin // $value_reg = av_write_data"
        parse3 $value_reg $eq av_read_data  "$lin // $value_reg = av_read_data"
        pop $lin b
        pop $lin a
    }

    proc struct_write {lin  addr  offset_reg  eq  value_reg} {
        push $lin a
        push $lin b
        lassign [split $addr {'}] hi lo
        parse3 b $eq $offset_reg $lin
        parse3 a $eq $lo $lin
        parse3 av_ad_hi $eq [expr {$hi}] "$lin // av_ad_hi = $hi"
        parse3 av_ad_lo $eq ad0 "$lin // av_ad_lo = $lo"
        parse3 av_write_data $eq $value_reg "$lin // av_write_data = $value_reg"
        pop $lin b
        pop $lin a
    }

    proc rpm_to_jf {rpm} {
        if {$rpm < 11} {
            error "RPM too low"
        }
        return [expr { int( 700000 / $rpm )}]
    }    

    
}    