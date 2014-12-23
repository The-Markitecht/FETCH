#vlog -sv -work work \
#    +incdir+../.. \
#    ../../ram2port.v
vlog -sv -work work  \
    +incdir+../../source  \
    ../../source/testbench.v
#vsim +altera -do top_run_msim_rtl_verilog.do -l msim_transcript -gui testbench
vsim +altera \
    -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver \
    -gui testbench
# add wave -position end  sim:/testbench/mcu/target/ipr
restart
do wave.do
run 1ms

