#Persistent

MusicFilePath := "C:\Users\mobilnik.mp3"

Run, wmplayer.exe %MusicFilePath%, , , PlayerPID

SoundSet, 80

Gui, Add, Button, x10 y10 w140 h30 gStopMusic, Остановить Шнурова
Gui, Add, Button, x10 y50 w140 h30 gOpenMail, Открыть Почту 
Gui, Add, Button, x10 y90 w140 h30 gOpenWord, Word документики
Gui, Add, Button, x10 y130 w140 h30 gOpenExcel, Excel документики
Gui, Add, Button, x10 y170 w140 h30 gOpenWhatsApp, Бесконечная трепка WhatsApp
Gui, Add, Button, x10 y210 w140 h30 gOpenTelegram, Telegram пропаганда и реклама
Gui, Add, Button, x10 y250 w140 h30 gOpenToddle, Toddle контроль сына

Gui, Show, w160 h290, Маман

return

StopMusic:
    Process, Close, wmplayer.exe
    MsgBox, Шнуров мертв.
    return

OpenMail:
    Run, chrome.exe https://e.mail.ru/inbox/?
    return

OpenWord:
    Run, winword.exe
    return

OpenExcel:
    Run, excel.exe
    return

OpenWhatsApp:
    If FileExist("WhatsApp.exe")
    {
        Run, WhatsApp.exe
    }
    Else
    {
        Run, chrome.exe https://web.whatsapp.com/
    }

    return

OpenTelegram:
    If FileExist("Telegram.exe")
    {
        Run, Telegram.exe
    }
    Else
    {
        Run, chrome.exe https://web.telegram.org/a/
    }
    return

OpenToddle:
    Run, chrome.exe https://web.toddleapp.com/platform/2960/courses
    return

GuiClose:
    ExitApp
    return

DllCall("ShowWindow", UInt, WinExist("ahk_pid " PlayerPID), Int, 2)