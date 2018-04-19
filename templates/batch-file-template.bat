@echo on
::discript
title batch
color 0c
::start
time /t
date /t
:: name of object to launch
start %~d0\usbapps\start.bat
::set user input variable
set /p UserInputPath= ??enter variable here??
echo %UserInputPath%
:: batch switch example
set /p UserInputPath= ??ask.command.question??
if "%UserInputPath%"=="on" (
	some.command.here
	echo on
)
if "%UserInputPath%"=="off" (
	other.command.here
	echo off
)
echo ...
msg * "Remove USB Now"
TIMEOUT /T -1