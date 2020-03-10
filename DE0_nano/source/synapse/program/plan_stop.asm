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


:plan_name_stop
    "STP\x0"

func init_plan_stop {
    // set up the stop plan.
    callx  clear_ign_history
    // set noise filter to measure RPM between 50 and 1160 to indicate cranking.
    ram $ram_ign_fastest_jf = ([rpm_to_jf 1160])
    ram $ram_ign_slowest_jf = ([rpm_to_jf 50])
    ign_timeout_len_jf = ([rpm_to_jf 50])
    // normally puff length is not touched by an init func.
    // this one does it because it's part of the program boot,
    // and also a good idea whenever stopping the engine.
    // this might interrupt a puff in mid-pulse, but no matter in this case.
    ram $ram_next_puff_len_us = 0
    puff_len_us = 0

    // memorize state.
    ram $ram_plan_name = :plan_name_stop
    ram $ram_puff_len_func = :puff_len_stop
    ram $ram_transition_func = :leave_stop
    ram $ram_destroy_plan_func = :destroy_plan_stop
}

func destroy_plan_stop {
}

func puff_len_stop {
    ram $ram_next_puff_len_us = 0
}

func leave_stop {
    // leave stop plan if ignition switch is turned on AND more than half if the ignition history is valid.
    // requiring both conditions prevents spurious noise readings from starting up the injection.
    a = power_duty
    b = $ign_switch_off_mask
    bn and0z :stay
        ram a = $ram_ign_bad_samples
        b = ($ign_history_len / 2)
        br gt :stay
            callx  destroy_plan_stop
            callx  init_plan_crank
    :stay
}

