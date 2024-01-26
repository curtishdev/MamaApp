@echo off
title Идет установка нужных файлов... ^| github.com/curtishdev
Set mycmdWidth=75
Set mycmdHeight=40
cls

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
set autohotkey_exe=C:\Program Files\AutoHotkey\AutoHotkey.exe
set autohotkey_setup_url=https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/curtishdev/MamaApp/blob/main/AutoHotkey_1.1.36.01_setup.exe

if not exist "%autohotkey_exe%" (
    echo AutoHotkey не найден. Открываю страницу для скачивания...
    start chrome "%autohotkey_setup_url%"
    echo Установите приложение из скачанного архива и выберите быструю установку, после чего запустите установщика.
    echo Нажмите [Enter] для завершения работы...
    pause > nul
    exit
)

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