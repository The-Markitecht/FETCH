
# parse source file.  memorize line number of each address.
set src_fn [file join [file dirname [pwd]] target_program.mif]
set f [open $src_fn r]
set ::lines [dict create]
set lnum 0
while { ! [eof $f]} {
    incr lnum
    set lin [gets $f]
    if {[regexp {^\s*([0-9a-f]{4}) : [0-9a-f]{4} ; -- <([0-9]{4})> } $lin junk addr junk2]} {
        dict set ::lines [expr "0x$addr"] [string trimleft $lnum 0]
    }    
}

# open serial port.
set ::port [open {//./com9} RDWR]
puts "ER:[fconfigure $::port -lasterror]"
fconfigure $::port -mode 115200,n,8,1 -handshake none -blocking 0 -buffering none -encoding binary -translation binary -eofchar {}
puts "ER:[fconfigure $::port -lasterror]"

# puts [fconfigure $::port -pollinterval ]
# puts [fconfigure $::port -sysbuffer]
# fconfigure $::port -sysbuffer {4 4}
# puts [fconfigure $::port -sysbuffer]

while 1 {
    puts -nonewline $::port " "
    after 500
    set reply [read $::port 1000]
    puts $reply
    if {[regexp {\n([0-9a-f]{4}),([0-9a-f]{4}) \>} $reply junk ipr opcode]} {
        set ipr [expr "0x$ipr"]
        if {[dict exists $::lines $ipr]} {
            # show source line in Notepad++
            set lnum [dict get $::lines $ipr]
            exec {C:/Program Files (x86)/NotepadPlusPlus/notepad++.exe} -n$lnum $src_fn
        }
    }
    exit
}