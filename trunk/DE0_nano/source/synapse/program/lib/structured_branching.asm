
<<

proc if_ {lin  a  operator  b  if_block  {else_word {}}  {else_block {}} } {
    set serial [format %04x $::ipr]
    if {$else_word ne {} && $else_word ne {else}} {
        error "syntax error in if/else block"
    }
    parse "
        a = $a
        b = $b
        bn $operator :else_$serial
            $if_block
            jmp :done_$serial
        :else_$serial
            $else_block
        :done_$serial
    "
}

set test_cases {
   if 2 lt 4 {
        putasc "1"
    }    
    if 2 gt 4 {
        putasc "?"
    } else {
        putasc "2"
        if 5 gt 4 {
            putasc "3"
        } else {
            putasc "?"
        }
    }    
}

>>
