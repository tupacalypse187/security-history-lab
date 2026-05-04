@echo off
echo ============================================
echo ILOVEYOU WORM - Educational Simulation
echo ============================================
echo.
echo NOTE: This script demonstrates the ILOVEYOU worm mechanism
echo All destructive operations are SIMULATED and commented out
echo No actual harm will be done to your system
echo.
echo Press any key to run the simulation, or Ctrl+C to cancel...
pause >nul
echo.

REM Create a temporary .vbs copy to run the educational simulation
copy "%~dp0LOVE-LETTER-FOR-YOU.vbs.educational" "%TEMP%\iloveyou_edu.vbs" >nul
cscript //nologo "%TEMP%\iloveyou_edu.vbs"
del "%TEMP%\iloveyou_edu.vbs" >nul

echo.
echo ============================================
echo Simulation complete - check the log file
echo ============================================
pause
