vlog -sv -work work  \
    +incdir+../../source  \
    ../../source/testbench.v
#vsim +altera -do top_run_msim_rtl_verilog.do -l msim_transcript -gui testbench
vsim +altera -gui testbench
# add wave -position end  sim:/testbench/mcu/target/ipr
restart
do wave.do
run 5ms

