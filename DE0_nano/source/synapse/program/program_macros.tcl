
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

    proc ::set_editor_tag {name  {return_type {}}  {parms {}}} {
        puts $::editor_tags "${name}|${return_type}|${parms}|" 
    }        

    proc declare_system_dimensions {lin} {
        # each vdefine here is auto-generated into a _defines.v file.
        # so they're visible in Verilog as well as assembly source.
        declare_architecture_dimensions
        parse {
            // program code dimensions.
            vdefine code_addr_width         12
            vdefine code_addr_top           ($code_addr_width - 1)
            vdefine code_size_max_words     (1 << $code_addr_width)
            setvar assembler_max_words      $code_size_max_words
        }
    }
    
    proc ram_define {lin name {size_bytes 2}} {
        # ram_counter must increment after memorizing, because the size may vary from one call to the next.
        setvar $lin $name $::asm::ram_counter
        dict set ::debugger_ram_names [ram_to_int $::asm::ram_counter] $name
        ram_incr ::asm::ram_counter $size_bytes
    }

    proc ram_incr {var_name  increment} {
        upvar $var_name v
        set v [ram_from_int [expr {[ram_to_int $v] + $increment}]]
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
        parse3 $reg_name $eq av_begin_read "$lin // $reg_name = av_write_data // start read cycle"
        parse3 $reg_name $eq av_read_data  "$lin // $reg_name = av_read_data // finish read cycle"
    }

    proc ram_write {lin addr eq reg_name} {
        lassign [split $addr {'}] hi lo
        parse3 av_ad_hi $eq [expr {$hi}] "$lin // av_ad_hi = $hi"
        parse3 av_ad_lo $eq [expr {$lo}] "$lin // av_ad_lo = $lo"
        parse3 av_write_data $eq $reg_name "$lin // av_write_data = $reg_name"
    }

    proc ram_from_int {addr} {
        # pass an address in Tcl integer format.
        # returns the address in hi'lo format, for use with other macros.
        
        set hi [expr {$addr >> 16}]
        set lo [expr {$addr & 0xffff}]
        return ${hi}'$lo
    }
    
    proc ram_to_int {addr} {
        # pass an address in hi'lo format.  (Tcl integer is also acceptable.)
        # returns the address in Tcl integer format.        
        if {[string first {'} $addr] < 0} {return [expr {$addr}]}
        lassign [split $addr {'}] hi lo
        return [expr {($hi << 16) | $lo}]
    }

    proc rpm_to_jf {rpm} {
        if {$rpm < 11} {
            error "RPM too low"
        }
        return [expr { int( 700000 / $rpm )}]
    }    
}    
