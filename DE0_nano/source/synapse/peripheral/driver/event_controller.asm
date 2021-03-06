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



// event loop.  this infrastructure is assembled directly into the main program, not a func.
// first instruction of an event handler should be the 7th cycle after reading its priority from the event controller here.
:poll_events
// initialize prior to polling loop, for minimum latency.
b = :event_table
// 3-cycle polling loop.
:poll_events_again
a = event_priority
br 0z :poll_events_again
// acknowledge the event to clear its capture register.  do this right away,
// so another occurrence of the same event can be captured right away in the controller.
event_priority = a
// compute an address in the event_table.  note the absence of a wait state for the adder here (not needed).
fetch rtna from ad0
// jump to the address given in the event_table.  each handler MUST end with a end_event.
// each handler does NOT need to save ANY registers (e.g. no convention_gpx).  they can all be trashed.
// each handler is passed the event priority in a, in case the same handler is used on multiple priorities.
swapra = nop
// just returned here from the handler, in case the handler accidentally did a rtn.  this should NEVER happen.
error_halt_code 0xffc0

<<
    # event handling macros.
    proc event {lin label} {
        # this is declared similar to a func, but is not a func.
        set label [string trim $label {: }]
        set_label $label
        emit_comment "// ######## $lin // = 0x[format %04x $::ipr]"
    }

    proc end_event {lin} {
        jmp $lin :poll_events
    }

    proc event_return {lin} {
        end_event $lin
    }

>>
