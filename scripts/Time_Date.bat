@echo off
:::date&time to clipboard script
mkdir c:\TODAYTEMP
time /t>c:\TODAYTEMP\DATETODAY.txt
date /t>>c:\TODAYTEMP\DATETODAY.txt
clip < c:\TODAYTEMP\DATETODAY.txt
RD /S /Q c:\TODAYTEMP
exit