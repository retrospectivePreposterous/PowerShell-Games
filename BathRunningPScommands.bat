@echo off
Title PowerShellBat
mode 45,20
color 07

::The way these commands work:
::powershell -command "&{***;}"

::Remove blinking cursor:
powershell -command "&{$host.ui.RawUI.CursorSize = 0;}"

::Set YBR as full block color variable
set Y="write-host "Û" -ForegroundColor Yellow -NoNewline;"
set B="write-host "Û" -ForegroundColor Blue -NoNewline;"
set R="write-host "Û" -ForegroundColor Red -NoNewline;"

powershell -command "&{[console]::beep(400,150);}"
echo hello
pause> nul

powershell -command "&{[console]::beep(400,150);}"
powershell -command "&{write-host "Hola maestro" -ForegroundColor Red -BackgroundColor Yellow;}"
pause> nul

powershell -command "&{[console]::beep(400,150);}"
powershell -command "&{write-host "Me despido" -ForegroundColor Green;}"
pause> nul

powershell -command "&{[console]::beep(400,150);}"
powershell -command "&{write-host "A" -ForegroundColor Green -BackgroundColor Blue -NoNewline; write-host "B" -ForegroundColor Red -BackgroundColor Yellow;}"
pause> nul

powershell -command "&{[console]::beep(400,150);}"
powershell -command "&{%Y% %B% %R% %Y% %B% %R%}"
pause> nul

