
# define any application-specific macros or functions here.

namespace eval ::asm {

    proc error_halt {lin} {
        jmp $lin $::ipr  
    }

    proc error_halt_code {lin error_code} {
        parse3 leds = $error_code "$lin // leds = $error_code"
        error_halt $lin
    }

    proc vdefine {lin name valu} {
        if {$::asm_pass == $::pass(emit)} {
            puts $::vdefines "`define [string toupper $name]  [expr $valu]"
        }
        setvar $lin $name $valu
    }
    
    proc ram_define {lin name {size_bytes 2}} {
        # this must increment after memorizing, because the size may vary from one call to the next.
        vdefine32 $lin $name $::asm::ram_counter
        incr ::asm::ram_counter $size_bytes        
    }
    
    proc ram_read_lo {lin reg_name eq addr} {
        parse3 av_ad_lo $eq [expr {$addr & 0xffff}] "$lin // av_ad_lo = $addr"
        parse3 $reg_name $eq av_write_data "$lin // $reg_name = av_write_data // start read cycle"
        parse3 $reg_name $eq av_read_data  "$lin // $reg_name = av_read_data // finish read cycle"
    }

    proc ram_write_lo {lin addr eq reg_name} {
        parse3 av_ad_lo $eq [expr {$addr & 0xffff}] "$lin // av_ad_lo = $addr"
        parse3 av_write_data $eq $reg_name "$lin // av_write_data = $reg_name"
    }

}    