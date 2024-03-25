@echo off
chcp 65001>nul
title Admin Check

:: Check admin right
net session >nul 2>&1
if %errorlevel% == 0 (
    goto main
) else (
    goto errorAdmin
)

:main
cls
color a
powershell
Set-ProcessMitigation -Name vgc.exe -Enable CFG
Set-ProcessMitigation -Name vgc.exe -Enable DEP
Set-ProcessMitigation -Name vgc.exe -Enable AuditDynamicCode
echo Done !
echo Think to restart your PC
echo You can now exit this program
pause>nul
exit /b

:errorAdmin
cls
color c
title Failure !
echo Failure : Current permission inadequate , please run this program with admin right !
pause>nul
exit /b