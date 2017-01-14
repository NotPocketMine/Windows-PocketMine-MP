@echo off
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
if %OS%==32BIT echo This is a 32bit operating system & goto dl32
if %OS%==64BIT echo This is a 64bit operating system & goto dl64
goto :EOF

:dl32
cls
call :title
Echo Downloading: Please Wait
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/NotPocketMine/Windows-PocketMine-MP/blob/master/PocketMine-MP-x86.exe?raw=true', 'PocketMine-MP-x86.exe')"
powershell -Command "Invoke-WebRequest http://www.foo.com/package.zip -OutFile package.zip"
IF EXIST "%cd%/PocketMine-MP-x86.exe" (
goto downloaded
) ELSE (
goto failure
)
goto :EOF

:dl64
cls
call :title
Echo Downloading: Please Wait
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/NotPocketMine/Windows-PocketMine-MP/blob/master/PocketMine-MP-x64.exe?raw=true', 'PocketMine-MP-x64.exe')"
IF EXIST "%cd%/PocketMine-MP-x64.exe" (
goto downloaded
) ELSE (
goto failure
)
goto :EOF

:downloaded
cls
call :title
echo File has downloaded. 
echo it can now be located in "%cd%".
echo.
echo Press any key to exit.
pause >nul
exit

:failure
cls
call :title
echo Failed to download file.
echo.
echo Press any key to exit.
pause >nul
exit

:title
powershell Write-Host PocketMine-Download-Windows [Version 1.0 - PocketMine-MP] -foregroundcolor "GREEN"
echo (C) 2016 Microsoft Corporation.&echo (C) 2016 PocketMine-MP - PMMP &echo.
goto :EOF