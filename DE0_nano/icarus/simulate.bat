@echo off

rem tclsh85 ..\source\assemble.tcl
rem if errorlevel 1 goto :done

rem -pfileline=1
rem iverilog -g2005 -gxtypes -o testbench  ..\source\testbench.v  ..\source\program.v  ..\source\synapse316.v ..\source\my_uart_v2.v
rem C:\iverilog\bin\iverilog -g2005 -gxtypes -I ..\source -o testbench  ..\source\testbench_event_ctrl.v  ..\source\priority_encoder.v  ..\source\event_controller.v 
iverilog -g2005 -gxtypes -I ..\source -o testbench  ..\source\testbench_usage_counter.v  ..\source\synapse\peripheral\usage_counter.v
if errorlevel 1 goto :done

del testbench.vcd
rem -v
vvp testbench

rem start gtkwave testbench.vcd
rem press Ctrl-Shift-R on existing instance instead.

exit /b 0

:done
exit /b 255