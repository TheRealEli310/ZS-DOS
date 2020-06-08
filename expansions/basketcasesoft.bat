@echo off
echo Baskcase
echo Firmware version: 1.0AU
echo Region: DEV
echo Starting...
timeout /t 2 /nobreak >nul
cls
goto bdash

:homebrewsetupexploit
echo "&J%$&N^n54N^&$%^%^54N^4%N6$N^$%6n43^#$5b465454n6B$#^#$^43$B$#B$#%#5TGRTTRGG^B%^$%&$%N&$M%NB%^BTTGB^%YH^%Y$H%^%$H$,^&%^%^6hhh547h5H&%$%7h45H&%H&%$HH&$%&H5h754h4645h545hh5HH^%^H54H^%$^H%4h65H^%$&h$%H7%$H$h&" >"Basketcase\profile.binfo"
echo Done setting up exploit.
goto bdash

:bdash
echo Choose software
echo 1. POVER Exploit Setup
echo 2. System settings
echo 3. Play game from disk
set /p input=
if "%input%"=="1" goto homebrewsetupexploit
if "%input%"=="2" goto sysset
if "%input%"=="3" goto diskrun
cls
goto bdash

:sysset
echo This is your profile:
echo Reading...
timeout /t 4 /nobreak >nul
cls
goto hmbrew

:hmbrew
cls
echo Basketcase Homebrew for firmware version 1.0AU
echo 
goto hmbrew

:diskrun
"Z:\game\start.bat"
echo Game not found
pause
goto bdash


