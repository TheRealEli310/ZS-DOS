@echo off
title ZS-DOS - Starting Syskrnl
mode con cols=80 lines=33
color 1F
cls
goto syskrnl

:input_username
set username=zomg
set /p input_username=Username :
if "%input_username%"=="%username%" goto input_password
goto input_username

:input_password
set password=zomg
set /p input_password=Password :
if "%input_password%"=="%password%" goto input_success
goto input_password

:input_success
echo Access granted.
echo.
echo Test Menu Ready.
pause >nul
goto main_kernel

:help_cmd
cls
echo ==  Commands  ==
echo SHUTDOWN - Shuts down the system
echo ECHO - Just like in DOS
echo CLEAR - Clears the screen
echo HELP - Gives you info about ZS-DOS
echo CMD - Command prompt
echo.
echo Press any key to go back.
pause >nul
goto main_kernel

:test
echo.
echo You found it!
echo Yes.
echo The egg.
echo If you want to put this on youtube,
echo then here is the code in a notepad window.
echo.
echo System hanged.
notepad "ZS-DOS.bat"
goto hang

:hang
pause >nul
goto hang

:clear
cls
goto main_kernel

:systembasketcase
cls
echo Basketcase
echo.
echo [    No disk    ]
echo [ Memory cards  ]
goto systembasketcase

:glauncher
cls
echo Game launcher pre-alpha 1
echo.
echo Choose game s for the basketcase system.
echo Choose game e to exit game launcher.
echo.
echo Games:
echo 1. Click! (PAL)
echo.
set /p input=
if "%input%"=="1" goto clickpalbasketcase
if "%input%"=="s" goto systembasketcase
if "%input%"=="e" goto main_kernel 
goto glauncher



:nothing

:main_kernel
cls
echo Test menu. Type 1 to exit.
echo 1 - Exit
echo 2 - Test Help
echo 3 - Test Easter Egg
echo 4 - Test Hang
echo 5 - Game launcher
echo 6 - Basketcase system
set /p input=Option:
if "%input%"=="1" ZS-DOS
if "%input%"=="2" goto help_cmd
if "%input%"=="3" goto test
if "%input%"=="4" goto hang
if "%input%"=="5" goto glauncher
if "%input%"=="6" goto systembasketcase
goto main_kernel

:syskrnl
echo Incorrect ZS-DOS Version
pause >nul
exit
