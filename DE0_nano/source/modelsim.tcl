# FETCH
# Copyright 2009 Mark Hubbard, a.k.a. "TheMarkitecht"
# http://www.TheMarkitecht.com
#
# Project home:  http://github.com/The-Markitecht/FETCH
# FETCH is the Fluent Engine and Transmission Controller Hardware for sports cars.
#
# This file is part of FETCH.
#
# FETCH is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# FETCH is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with FETCH.  If not, see <https://www.gnu.org/licenses/>.


# can't figure out how to get Modelsim to find the include header.v.
# these file copies don't seem to do anything.  probably Quartus is running the script in a sandbox.
file copy -force \
    J:/personal/2014/camaro_ecm/trunk/DE0_nano/source/header.v  \
    J:/personal/2014/camaro_ecm/trunk/DE0_nano/source/synapse/peripheral/header.v
file copy -force \
    J:/personal/2014/camaro_ecm/trunk/DE0_nano/source/header.v  \
    J:/personal/2014/camaro_ecm/trunk/DE0_nano/source/synapse/header.v

vlog -sv -work work \
    +incdir+../../source  \
    +incdir+.  \
    +incdir+../..  \
    +incdir+../source  \
    +incdir+J:/personal/2014/camaro_ecm/trunk/DE0_nano/source    \
    ../../source/testbench.v
vsim -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver \
    -L cycloneive_ver -L rtl_work -L work -L altera_reserved_qsys_qsys2 -voptargs="+acc" \
    testbench
# add wave -position end  sim:/testbench/mcu/target/ipr
restart
do wave.do
run 10ms

