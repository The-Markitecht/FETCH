
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

