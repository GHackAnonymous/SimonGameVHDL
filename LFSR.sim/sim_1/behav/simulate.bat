@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim Testbench_behav -key {Behavioral:sim_1:Functional:Testbench} -tclbatch Testbench.tcl -view C:/Users/Red_Drake/Desktop/LFSRConTodosLosTurnos/TestbenchPrueba1.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
