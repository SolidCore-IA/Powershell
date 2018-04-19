@echo off
:: INSTALLS WIFI PROFILE
title AndroidAP
ncpa.cpl
netsh int show int
set /p UserInputPath= ??WiFi interface name??
::must copy running wifi interface name to "interface=%%%%"
Netsh wlan add profile filename=\path\to\exported-wifi-profile.xml interface="%UserInputPath%"
echo ...
TIMEOUT /T 10