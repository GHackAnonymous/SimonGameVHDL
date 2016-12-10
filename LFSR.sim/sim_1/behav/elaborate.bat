@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto a876c74cf5354aee8579c2691176d6f1 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Testbench_behav xil_defaultlib.Testbench -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
