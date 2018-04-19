@echo off
:: Get username and domain
set /p username=Please enter the username you want to appear as last logged on:
set /p domain=Please enter the domain name for this account, or the computer name if it is a local account:
:: create change.reg
ECHO Windows Registry Editor Version 5.00 >> c:\change.reg  
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI] >> c:\change.reg 
ECHO "LastLoggedOnUser"="%domain%\\%username%" >> c:\change.reg
:: Change login name
C:\WINDOWS\regedit.exe /s c:\change.reg 
DEL c:\change.reg