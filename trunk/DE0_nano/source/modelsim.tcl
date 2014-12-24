vlog -sv -work work \
    +incdir+../../source \
    ../../source/testbench.v
vsim -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver \
    -L cycloneive_ver -L rtl_work -L work -L altera_reserved_qsys_qsys2 -voptargs="+acc" \
    testbench
# add wave -position end  sim:/testbench/mcu/target/ipr
restart
do wave.do
run 10us

