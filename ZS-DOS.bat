@echo off
title ZS-DOS
mode con cols=80 lines=33
color 1F
rem taskkill /f /im explorer.exe
cls
echo Starting ZS-DOS...
echo Running Expansions...
start expansions\zsyscompat.bat
start expansions\zsys.bat
rem start expansions\basketcasesoft.bat
echo Running syskrnl...
start syskrnl.bat
echo Log in

:input_username
set username=zomg
set /p input_username=Username :
if "%input_username%"=="%username%" goto input_password
goto input_username

:input_password
echo zomg:zomg >"cache\2.zcache"
set password=zomg
set /p input_password=Password :
if "%input_password%"=="%password%" goto input_success
goto input_password

:input_success
echo Access granted.
echo.
echo Ready.
goto main_kernel

:help_cmd
cls
echo ==  Commands  ==
echo SHUTDOWN - Shuts down the system
echo ECHO - Just like in DOS
echo CLEAR - Clears the screen
echo HELP - Gives you info about ZS-DOS
echo CMD - Command prompt
echo HANG - Hang the system
echo GAMELAUNCHER - Basketcase emulator
echo LOGCLEAR - Delete the log file
echo VERSION - See version and build number
echo CONNECT - 	Connect to a server
echo CLEARCACHE - Clear the cache to free space
echo IP - Show info about your ips
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
rem start c:\windows\explorer.exe
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
pause >nul
goto systembasketcase

:glauncher
set sysre="pal"
cls
echo Game launcher pre-alpha 4
echo.
echo Choose game s for the basketcase system.
echo Choose game e to exit game launcher.
echo Choose game m to view contents of memory card.
echo Choose game n to switch region. (Default PAL.)
echo Choose game r to view region.
echo.
echo Games:
echo 1. Click! (NTSC)
echo 2.
echo.
set /p input=
if "%input%"=="2" goto glgamnotfounderr
if "%input%"=="1" goto clickntscrom
if "%input%"=="s" goto systembasketcase
if "%input%"=="e" goto main_kernel
if "%input%"=="m" goto memcardrview
if "%input%"=="n" goto gbsetr
if "%input%"=="r" goto gbviewr
goto glauncher

:gbviewr
echo This feature has been disabled by the developers in this version.
pause >nul
goto glauncher
echo [Game Launcher] Viewing System Region.
if "%sysre%"=="pal" echo System region is PAL.
if "%sysre%"=="ntsc" echo System region is NTSC.
pause >nul
goto glauncher

:gbsetr
echo Select Region:
echo PAL or NTSC
set /p sysre=?
goto glauncher

:clickntscrom
goto clprrun
cls
set /p input=
if "%input%"=="ntsc" goto clprrun
echo You are trying to play a NTSC game on a PAL System.
echo You can not do this.
echo.
echo Game quit. If this happened on an actual basketcase it would reboot.
pause >nul
goto glauncher

:clprrun
echo [Game launcher] Started Game Click! (PAL) >"zs-dos.log"
echo PAL (AUS)
echo.
echo                      Click!
echo              Writing To Memory Card...
echo Click!S1-0,0,0,0,0,0 >"glaun.bmc"
echo                      Done.
echo.
echo                   Game started!
echo                 Press a to click.
goto cpalromkey
echo Game quit. If this happened on an actual basketcase it would reboot.
pause >nul


:memcardrview
echo [Game launcher] View memory card contents >"zs-dos.log"
type glaun.bmc
pause >nul

:cpalromkey
set /p mytextfile=< "glaun.bmc"
echo %mytextfile%
pause >nul
echo Click!S1-1,1,0,0,0,1 >"glaun.bmc"
pause >nul
echo Click!S1-2,1,0,0,0,1 >"glaun.bmc"
pause >nul
echo Click!S1-3,1,0,0,0,1 >"glaun.bmc"
pause >nul
echo Click!S1-4,1,0,0,0,1 >"glaun.bmc"
pause >nul
echo Click!S1-5,1,0,0,0,1 >"glaun.bmc"
pause >nul
echo Click!S1-6,1,0,0,0,1 >"glaun.bmc"
pause >nul
echo Click!S1-7,1,0,0,0,1 >"glaun.bmc"
pause >nul
echo Click!S1-8,1,0,0,0,1 >"glaun.bmc"
pause >nul
echo Click!S1-9,1,0,0,0,1 >"glaun.bmc"
pause >nul
echo Click!S1-10,1,0,1,0,1 >"glaun.bmc"
pause >nul
echo Click!S1-11,1,0,1,0,1 >"glaun.bmc"
pause >nul
echo Click!S1-12,1,0,1,0,1 >"glaun.bmc"
pause >nul
echo Click!S1-13,1,0,1,0,1 >"glaun.bmc"
pause >nul
echo Click!S1-14,1,0,1,0,1 >"glaun.bmc"
pause >nul
echo Click!S1-15,1,0,1,0,1 >"glaun.bmc"
echo.
echo Game quit. If this happened on an actual basketcase it would reboot.
pause >nul
goto glauncher

:glgamnotfounderr
echo Could not load game (script   rom does not exist)
pause >nul
goto glauncher

:cpalromerror
echo Variable "clicks" has a max of 14 (tried to set to 15)
pause >nul
goto glauncher

:glauncherdswitch
cls
echo Deleting memory card...
del "glaun.bmc"
echo Done. Returning to prompt.
goto main_kernel

:lclear
cls
echo Deleting log file...
del "zs-dos.txt"
echo Done. Returning to prompt.
goto main_kernel

:test1sta
cls
echo Starting ZS-DOS...
set username=zomg
set /p input_username=Username :
if "%input_username%"=="%username%" goto test1sta2
goto test1sta

:test1sta2
set password=zomg
set /p input_password=Password :
if "%input_password%"=="%password%" goto debug
goto test1sta2


:debug
cls
echo ZS-DOS Test mode
echo 1. Startup
echo 2. Kernel load
set /p input=Test:
if "%input%"=="1" goto test1sta
if "%input%"=="2" goto test2ker
goto debug

:test2ker
echo [OK] Loaded resources file %systemdir%/imgreso.res

echo [OK] Loaded plugins
goto main_kernel

:shutdown
rem start c:\windows\explorer.exe
exit

:nothing

:conzsdevserv
echo Connecting to zsdosdev.zs with port 25565
timeout /t 3 /nobreak >nul
echo zsdosdev.zs25565id7674 >"cache\1.zcache"
goto main_kernel

:clearcache
cd cache
del *.zcache
cd..
echo Cache cleared.
goto main_kernel

:zs
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
goto zs

:cmd1231
echo cmd1231!
goto main_kernel

:ipinfo
ipconfig
goto main_kernel

:ver
echo ZS-DOS 1.0 (Build 1002)
goto main_kernel

:stpi
echo Go to "zomg.rf.gd/zsdos" for update installers.
echo Put the update installers in the "expansions" folder.
echo Type "stpi -i" to install updates.
goto main_kernel

:stpiinst
echo ZS-DOS 1.0 (Build 1002)
echo No updates available.
goto main_kernel

:main_kernel
set /p input=/
if "%input%"=="help" echo Use "help cmd" to learn commands.
if "%input%"=="help cmd" goto help_cmd
if "%input%"=="shutdown" goto shutdown
if "%input%"=="echo" goto cmd1231
if "%input%"=="help cmd1231" goto test
if "%input%"=="clear" goto clear
if "%input%"=="cmd" cmd
if "%input%"=="zsdostmenu" testmenu
if "%input%"=="hang" goto hang
if "%input%"=="gamelauncher" goto glauncher
if "%input%"=="gamelauncher -d" goto glauncherdswitch
if "%input%"=="logclear" goto lclear
if "%input%"=="debug -k G7gGg887g87G88YHYT887Go8T8t87g87g7rR5657RUEDF787Fy" goto debug
if "%input%"=="version" goto ver
if "%input%"=="connect zsdosdev.zs" goto conzsdevserv
if "%input%"=="clearcache" goto clearcache
if "%input%"=="zs" goto zs
if "%input%"=="ip" goto ipinfo
if "%input%"=="stpi" goto stpi
if "%input%"=="stpi -i" goto stpiinst
echo Invalid command.
goto main_kernel