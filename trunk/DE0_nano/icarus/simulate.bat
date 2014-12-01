@echo off

tclsh85 ..\source\assemble.tcl
if errorlevel 1 goto :done

rem -pfileline=1
iverilog -g2005 -gxtypes -o testbench  ..\source\testbench.v  ..\source\program.v  ..\source\synapse316.v ..\source\my_uart_v2.v
if errorlevel 1 goto :done

del testbench.vcd
rem -v
vvp testbench

rem start gtkwave testbench.vcd
rem press Ctrl-Shift-R on existing instance instead.

:done