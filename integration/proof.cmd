@echo off
rem grok-dx session-start proof writer (benign PoC marker)
set "D=%USERPROFILE%\.grok-dx-poc"
if not exist "%D%" mkdir "%D%"
echo [%date% %time%] %username% > "%D%\session-start-proof.txt"