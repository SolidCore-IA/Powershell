@ echo off
:: network reset
time /t
date /t
uptime
echo .................
ipconfig /release
ipconfig /renew
ipconfig /flushdns
ipconfig /registerdns
netsh int ip reset r.log
netsh advfirewall reset
netsh winsock reset
echo .................
ping -a -n 2 8.8.8.8
echo .................
ipconfig|find "IPv4"
ipconfig|find "Default Gateway"
echo .................
cmd.exe
::END BATCH
TIMEOUT /T -1