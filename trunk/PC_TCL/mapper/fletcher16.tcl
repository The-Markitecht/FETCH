
proc fletcher16_init {sum_var} {
    upvar $sum_var sum
    catch {unset sum}
    array set sum [list 1 0 2 0]
}

proc fletcher16_input16 {sum_var  input} {
    upvar $sum_var sum
    fletcher16_input8 sum [e {$input & 0xff}]
    fletcher16_input8 sum [e {($input >> 8) & 0xff}]
}

proc fletcher16_input8 {sum_var  input} {
    upvar $sum_var sum
    set sum(1) [e {($sum(1) + $input) % 0xff}]
    set sum(2) [e {($sum(2) + $sum(1)) % 0xff}]
}

proc fletcher16_result {sum_var} {
    upvar $sum_var sum
    return [e {($sum(2) << 8) | $sum(1)}]
}
