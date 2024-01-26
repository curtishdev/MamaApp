@echo off
cls

REM Check if AutoHotKey is installed
where AutoHotKey >nul 2>nul
if errorlevel 1 (
    echo Установите AutoHotkey перед использованием установщика!
    pause
    exit
)

NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' (
    goto continue
) else (
    echo Установка и настройка приложения...
    timeout /t 1 >nul
    start "" "powershell" -Command "Start-Process '%0' -Verb RunAs"
    exit
)

:continue
setlocal enabledelayedexpansion

set mobilnik_dest=C:\Users\mobilnik.mp3
set mama_dest=C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\mama.ahk

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

start "" "!mama_dest!"

exit

endlocal