@echo off
echo ============================================
echo MELISSA VIRUS - Educational Simulation
echo ============================================
echo.
echo NOTE: This script demonstrates the Melissa virus mechanism
echo All destructive operations are SIMULATED and commented out
echo No actual harm will be done to your system
echo.
echo Press any key to run the simulation, or Ctrl+C to cancel...
pause >nul
echo.

REM Create a temporary .vbs copy to run the educational simulation
REM Note: Original Melissa was VBA macros, but this recreation has a VBS runner
copy "%~dp0melissa_macros.vba.educational" "%TEMP%\melissa_edu.vbs" >nul
cscript //nologo "%TEMP%\melissa_edu.vbs"
del "%TEMP%\melissa_edu.vbs" >nul

echo.
echo ============================================
echo Simulation complete - check the log file
echo ============================================
pause
