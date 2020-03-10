// FETCH
// Copyright 2009 Mark Hubbard, a.k.a. "TheMarkitecht"
// http://www.TheMarkitecht.com
//
// Project home:  http://github.com/The-Markitecht/FETCH
// FETCH is the Fluent Engine and Transmission Controller Hardware for sports cars.
//
// This file is part of FETCH.
//
// FETCH is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// FETCH is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with FETCH.  If not, see <https://www.gnu.org/licenses/>.


:plan_name_run
    "RN\x0"

setvar      trim_half                   0
setvar      trim_unity                  8192
setvar      trim_double                 24576

// 0.5 to 2.0 trim factor equivalent.
setvar      trim_min                    $trim_half
setvar      trim_max                    $trim_double

ram_define  ram_maf_valid
ram_define  ram_maf_adc_filtered
ram_define  ram_maf_flow_hi_res

ram_define  ram_afrc_maf_row_idx
ram_define  ram_afrc_rpm_col_idx

ram_define  ram_block_temp_map_idx
ram_define  ram_block_temp_trim

ram_define  ram_afterstart_map_idx
ram_define  ram_afterstart_trim

ram_define  ram_o2_trim

ram_define  ram_run_manual_trim
setvar      run_manual_trim_step        192

ram_define  ram_total_trim

ram_define  ram_tps_avg
setvar      tps_history_len         4
ram_define  ram_tps_history         ($tps_history_len * 2)

func trim_lean_cmd {
    ram a = $ram_run_manual_trim
    if a eq 0 {
    } else {
        b = ([negate $run_manual_trim_step])
        ram $ram_run_manual_trim = a+b
    }
}

func trim_rich_cmd {
    ram a = $ram_run_manual_trim
    if a gt 800 {
    } else {
        b = $run_manual_trim_step
        ram $ram_run_manual_trim = a+b
    }
}

func trim_2lean_cmd {
    ram a = $ram_run_manual_trim
    if a eq 0 {
    } else {
        b = ([negate [expr $run_manual_trim_step * 8]])
        ram $ram_run_manual_trim = a+b
    }
}

func trim_2rich_cmd {
    ram a = $ram_run_manual_trim
    if a gt 800 {
    } else {
        b = ($run_manual_trim_step * 8)
        ram $ram_run_manual_trim = a+b
    }
}

func init_plan_run {
    // set up the run plan.
    // this code is repeated each crank cycle, so don't depend on RAM already being 0.
    ram $ram_maf_valid = 0
    ram $ram_afrc_maf_row_idx = 0
    ram $ram_afrc_rpm_col_idx = 0
    ram $ram_block_temp_map_idx = 0
    ram $ram_block_temp_trim = $trim_unity
    ram $ram_afterstart_map_idx = 0
    ram $ram_afterstart_trim = $trim_unity
    ram $ram_o2_trim = $trim_unity
    ram $ram_puff_count = 0
    ram $ram_run_manual_trim = $trim_unity
    ram $ram_o2_trim = $trim_unity
    ram $ram_total_trim = 0

    // memorize state.
    ram $ram_plan_name = :plan_name_run
    ram $ram_puff_len_func = :puff_len_run
    ram $ram_transition_func = :leave_run
    ram $ram_destroy_plan_func = :destroy_plan_run
}

func destroy_plan_run {
}

func combine_trim {total in pa} {increment in pb} {out_total out pa} {
    // combine the given increment with the given total trim factor, returning
    // the new total trim.  this process is complicated by the decision to keep the
    // 0.5 offset in the integer representation scheme.  that's done in case i ever
    // have to calculate puff without the aid of a hardware multiplier.
    // the process is to add the offset to each argument, multiply them,
    // undo the offsets, and saturate to prevent excess accumulation.
    a = total
    b = $trim_unity
    a = a+b
    i = increment
    j = $trim_unity
    b = i+j
    nop
    nop
    nop
    nop
    // total = product / 16384 = product >> 14
    // this cancels the two offsets that were added prior to the mult.
    x = product_hi
    a = product_lo
    a = a>>4
    a = a>>4
    a = a>>4
    a = a>>1
    out_total = a>>1
    a = x
    b = 0x3fff
    a = and
    a = a<<1
    a = a<<1
    b = out_total
    a = or
    // subtract the unity offset to get back to the correct integer representation.
    b = ([negate $trim_unity])
    out_total = a+b
    // clamp.
    if out_total gt $trim_double {
        out_total = $trim_double
    }
}

func fetch_afrc {maf_row_idx in pa} {rpm_col_idx in pb} {afrc out pa} {
    // look up Air/Fuel Ratio Correction in AFRC map.
    // index rows by MAF.
    a = maf_row_idx
    b = $afrc_rpm_cols
    nop
    nop
    nop
    nop
    b = product_lo
    // index columns by RPM.
    a = rpm_col_idx
    struct av_read_data = $ram_afrc_map . a+b
    rtn av_read_data
}

func puff_len_run {
    ram a = $ram_rpm_valid
    br az :abort
    ram a = $ram_maf_valid
    br az :abort

    // look up Air/Fuel Ratio Correction in AFRC map.
    ram pa = $ram_afrc_maf_row_idx
    ram pb = $ram_afrc_rpm_col_idx
    callx fetch_afrc pa pb ga
    // now ga = total trim factor as integer.

    // apply block temperature trim factor.
    ram b = $ram_block_temp_trim
    callx combine_trim ga b ga

    // apply afterstart trim factor.
    callx interpret_puff_count
    ram b = $ram_afterstart_trim
    callx combine_trim ga b ga

    // apply stoich learning trim factor.
    ram b = $ram_o2_trim
    callx combine_trim ga b ga

    // apply manual trim factor.
    ram b = $ram_run_manual_trim
    callx combine_trim ga b ga

    // final multiplication for puff length.
    // (MAF linear flow) * (stoich ratio constant) * (total trim as floating point) = (puff length jf).
    // here the total trim float will have to be represented as a fraction (num/denom).
    // stoich ratio constant (8) (really the conversion factor from linear
    // flow to nominal jf)  is folded into that denominator (16384) at compile time.
    // that makes denom = 2048 = 11 bits.  so:
    // gb = (puff len jf) = (MAF linear flow) * [(total trim) + trim_unity] >> 11
    a = ga
    b = $trim_unity
    a = a+b
    ram b = $ram_maf_flow_hi_res
    nop
    nop
    nop
    nop
    // gb = 32-bit product shifted >> 11.  lower 11 bits of product_hi are
    // explicitly moved to upper 11 bits of gb.
    a = product_lo
    b = product_hi
    a = a>>4
    a = a>>4
    a = a>>1
    a = a>>1
    gb = a>>1
    a = b
    a = a<<4
    a = a<<1
    b = gb
    gb = or

    // clamp the (puff length jf) to sane range.
    // max is the floating duty cycle.  7/8 of puff cycle, or 87.5%.
    ram a = $ram_ign_avg_jf
    a = a>>1
    a = a>>1
    a = a>>1
    b = 0xffff
    a = xor
    ram b = $ram_ign_avg_jf
    x = a+b
    if gb gt x {
        gb = x
    }
    // min is the safety amount to keep motor running and maybe prevent leaning damage.
    //patch: don't know a proper minimum.

    // shut off puff during closed throttle engine braking.
    //patch: not implemented.

    // memorize total puff.
    ram $ram_next_puff_len_us = ga

    :abort
}

func leave_run {
    callx  check_engine_stop  pa
}

func interpret_block_temp {
    // look up block temperature map trim factor.
    struct gb = $ram_last_anmux_data . $anmux_engine_block_temp
    for {i = 0} {i lt $block_temp_num_cells} step j = 1 {
        struct b = $ram_block_temp_ref . i
        if b gt gb {
            ram $ram_block_temp_map_idx = i
            struct b = $ram_block_temp_map . i
            ram $ram_block_temp_trim = b
            jmp :temp_done
        }
    }
    :temp_done
}

func interpret_puff_count {
    // look up afterstart trim factor.
    ram gb = $ram_puff_count
    for {i = 0} {i lt $afterstart_num_cells} step j = 1 {
        struct b = $ram_afterstart_ref . i
        if b gt gb {
            j = -1
            ram $ram_afterstart_map_idx = i+j
            struct b = $ram_afterstart_map . i
            ram $ram_afterstart_trim = b
            jmp :done
        }
    }
    struct b = $ram_afterstart_map . ($afterstart_num_cells - 1)
    ram $ram_afterstart_trim = b
    :done
}

func dump_afrc_cmd {
    puteol
    ram ga = $ram_afrc_maf_row_idx
    ram gb = $ram_afrc_rpm_col_idx
    av_ad_hi = ([ram_to_int $ram_afrc_map] >> 16)
    av_ad_lo = ([ram_to_int $ram_afrc_map] & 0xffff)
    for {i = 0} {i lt $afrc_maf_rows} step j = 1 {
        for {x = 0} {x lt $afrc_rpm_cols} step y = 1 {
            a = av_begin_read
            a = av_read_data
            call put4x
            if x eq gb {
                putasc "<"
            } else {
                putasc " "
            }
            putasc " "
            a = av_ad_lo
            b = 2
            av_ad_lo = a+b
        }
        puteol
    }
}

