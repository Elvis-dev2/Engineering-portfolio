echo off
set LOCALHOST=%COMPUTERNAME%
set KILL_CMD="C:\PROGRA~1\ANSYSI~1\v241\fluent/ntbin/win64/winkill.exe"

start "tell.exe" /B "C:\PROGRA~1\ANSYSI~1\v241\fluent\ntbin\win64\tell.exe" Elvis 56111 CLEANUP_EXITING
timeout /t 1
"C:\PROGRA~1\ANSYSI~1\v241\fluent\ntbin\win64\kill.exe" tell.exe
if /i "%LOCALHOST%"=="Elvis" (%KILL_CMD% 35232) 
if /i "%LOCALHOST%"=="Elvis" (%KILL_CMD% 20936) 
if /i "%LOCALHOST%"=="Elvis" (%KILL_CMD% 30716)
del "C:\Engineering Portifolio\CFD Analysis\Turbulent water flow through 90 bend\cleanup-fluent-Elvis-20936.bat"
