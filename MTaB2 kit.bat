@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "%~s0", "%params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
@cd C:\toolkit\tools
----------colours----------

0 = Black       8 = Gray
1 = Blue        9 = Light Blue
2 = Green       A = Light Green
3 = Aqua        B = Light Aqua
4 = Red         C = Light Red
5 = Purple      D = Light Purple
6 = Yellow      E = Light Yellow
7 = White       F = Bright White

----------colours----------
cls
@echo off
colour 05
Title -=)MTab 2 Toolkit(=-
:open
ren Script1 adb.exe
ren Script2 AdbWinApi.dll
ren Script3 AdbWinUsbApi.dll
ren Script4 fastboot.exe
ren Script5 fetch.exe
ren Script6 Man.cmd
ren Strings Prog
cls
goto start

:start
cls
Echo.
Echo.
Echo             PICK AN OPTION BY TYPING ITS NUMBER AND PRESSING ENTER
Echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Echo    1- Install Philz Touch recovery                                        
Echo    2- ROOT Your tab                                  
Echo    3- Get Or See Device Information
echo    4- Give your Current LCD density
echo    5- OTHER 
echo    6- Side load a zip FILE..
echo    7- APK PUSHER
echo    8- Backup
echo    9- Restore a backup 
echo   10- DISCLAIMER
echo   11- XDA NICE LOOKING IMAGE
Echo    0- Quit
Echo                                                                -=)mythi(=-
Echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Echo. 
@echo off
set /p choice=I Am Gonna :
if %choice% == 1 goto INS
if %choice% == 2 goto ROOT
if %choice% == 3 goto INF
if %choice% == 4 goto GIV
if %choice% == 5 goto OTH
if %choice% == 6 goto ZIP
if %choice% == 7 goto PUSH
if %choice% == 8 goto BAC
if %choice% == 9 goto bup2
if %choice% == 10 goto DIS
if %choice% == 11 goto XDA
if %choice% == 0 goto quit

:INS
@echo off
@echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@echo +                                You Typed 1 and that's the       +
@echo +                                 PHILZ Touch RECOVERY            +
@echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Echo + Here is how to Install it  --> Make sure samsung drivers are present
ECHO.
Echo + 1.Go to toolkit folder Found in your C: disk
ECHO.
Echo + 2.Doubule Click on tools folder
ECHO.
Echo + 3.Double click on root folder
ECHO.
Echo + 4.Double click on odin folder and start odin .exe
ECHO.
Echo + 5.Don't touch any thing
ECHO.
Echo + 6.Press On PDA BUTTON!!
ECHO.
Echo + 7.Choose recovery.tar.md5 FOR P3113 AND P3110 FLASH THE FILE WITH P3110!!
ECHO.
Echo + 8.Reboot to Download Mode by power offing ur tab pressing the power+vloume down and after press vol up
ECHO.
Echo + 9.Connect your Tab
ECHO.
Echo + 10.If connected sucssefuly you will see Aded!!
ECHO.
Echo + 11.After that Press Start BUTTON!!
ECHO.
Echo + 12.Wait a couple of minutes till odin says (completed 0 fail 1 sucssed ) if this didn't show then you did somethin wrong
ECHO.
Echo + 13.Reboot to recovery by pressing while powered off power+volup
ECHO.
Echo + 14.Profit 
Echo  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
set /p choice=I Am Gonna :                             (Go to First Page=s, Exit everything=e)
if %choice% == s goto start
if %choice% == e exit
cls
goto ROOT

:ROOT
Echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Echo +                       So you have installed Philz recovery sucssefully          +
echo +                             Now it's time to root your TAB                       +
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo + 1.Reboot to recovery
echo + 2.Press install zip
echo + 3.Scroll till you find install zip from side load..
echo + 4.Press enter on you ketboard
echo + 5.After your flash sucsseful reboot your tab!!!
pause
cd c:\toolkit\tools\root\
adb sideload root.zip
echo -------------------------------------------------------------------

set /p choice=I Am Gonna :                             (Go to First Page=s, Exit everything=e)
if %choice% == s goto start
if %choice% == e exit
cls

:INF
cls
Echo.
Echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Echo                              DEVICE INFORMATION
Echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Echo    1- Get YOUR TABs Information
Echo    2- Open Already taken Information
Echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set /p choice=I Am Gonna :
if %choice% == 1 goto GINF
if %choice% == 2 goto SINF

:GINF
cls
Echo -------------------------------------------------------------------------------
Echo                               DEVICE INFO
Echo -------------------------------------------------------------------------------
set /P device=Type The Name You Would Like To Save The Information As:
Echo.
Echo.
Echo.
Echo                               WAITING FOR DEVICE
Echo.
Echo.
Echo.
Echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
adb wait-for-device
cls
Echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Echo                               DEVICE INFORMATION
Echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Echo.
Echo.
Echo.
Echo                          TAKING YOUR DEVICE INFORMATION
Echo.
Echo.
Echo.
Echo -----------------------------------------------------------------------------------
mkdir c:\toolkit\tools\DeviceINF\%device%
mkdir c:\toolkit\tools\DeviceINF\%device%\initd
adb shell getprop "ro.product.brand" > "c:\toolkit\tools\DeviceINF\%device%\Brand.txt"
adb shell getprop "ro.sf.lcd_density" > "c:\toolkit\tools\DeviceINF\%device%\Lcd-Density.txt"
adb shell getprop "ro.product.model" > "c:\toolkit\tools\DeviceINF\device%\Model.txt"
adb shell getprop "ro.carrier" > "c:\toolkit\tools\DeviceINF\%device%\Carrier.txt"
adb shell getprop "ro.product.version" > "c:\toolkit\tools\DeviceINF\%device%\Rom-Version.txt"
adb shell getprop "ro.build.version" >> "c:\toolkit\tools\DeviceINF\%device%\Rom-Version.txt"
adb shell uname -a > "c:\toolkit\tools\DeviceINF\Kernel-Version.txt"
adb shell free > "c:\toolkit\tools\DeviceINF\%device%\Ram.txt"
adb shell cat /proc/swaps > "c:\toolkit\tools\DeviceINF\%device%\Swap.txt"
adb shell cat /proc/sys/vm/swappiness > "c:\toolkit\tools\DeviceINF\%device%\Swappiness.txt"
adb shell top -s vss -n 1 > "c:\toolkit\tools\DeviceINF\%device%\Processes.txt"
adb shell dmesg > "c:\toolkit\tools\DeviceINF\%device%\Logcat-Kernel.txt"
adb pull /system/etc/init.d/ "c:\toolkit\tools\DeviceINF\%device%\initd\ 2>nul
adb shell cat /sys/module/lowmemorykiller/parameters/minfree > "c:\toolkit\tools\DeviceINF\%device%\LMK-Configuration.txt"
adb shell getprop "gsm.version.baseband" > "c:\toolkit\tools\DeviceINF\%device%\Base-Band.txt"
adb shell getprop "gsm.version.ril-impl" >> "c:\toolkit\tools\DeviceINF\device%\Base-Band.txt"
adb kill-server
goto SINFD

:SINFD
cls
Echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Echo                     These information have been saved..
Echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo                               The device brand
echo                                 The model
echo                               The LCD density
echo                                 The carrier
echo                                 Rom version
echo                                Kernel version
echo                        Random Access Memory Usage(RAM)
echo                               Swap partitions
echo                                 Swappiness
echo                             Running processes
echo                                A kernel log
echo                                
echo                                init.d files
echo                             LMK configuration
echo                              Your current Baseband
Echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set /P choice=Would you like to view the information Y/N ?:
if %choice% == y goto mhmm
if %choice% == Y goto mhmm
if %choice% == n goto done
if %choice% == N goto done

:mhmm
cls
echo if you want to read your old info navigate to c:\toolkit\tools\DEVICEINF
echo. ---------------------------------------------------------------------------
set /p choice=I Am Gonna :                             (Go to First Page=s, Exit everything=e)
if %choice% == s goto start
if %choice% == e exit
goto done 
:SINF
cls
%SystemRoot%\explorer.exe "c:\toolkit\tools\DeviceINF\%device%"



:GIV
cd c:\toolkit\tools\
echo -------------------------------------------------
echo this will give you your lcd density only
echo -------------------------------------------------
adb kill-server
adb shell getprop "ro.sf.lcd_density"
echo ------------------------------------------------
set /p choice=I Am Gonna :                             (Go to First Page=s, Exit everything=e)
if %choice% == s goto start
if %choice% == e exit
cls

:OTH
echo -------------------------------------------------------
echo                OTHER OPTIONS
echo -------------------------------------------------------
echo 1-REBOOT To recovery
echo 2-REBOOT
echo 3-RebooT To DownLoad
echo 4-Reboot to boot loader
echo 5-HOT REBOOT
echo 6-Take a logcat 
echo 7-Get Rom Name
echo 8-MAKE SYSTEM DUMP
ECHO 9-Pull framework folder
echo 10-APK INSTALLER
echo 11-IMEI SHOWER / SAVER
echo 12-MORE OPTIONS
echo 0-Go First Page
echo ----------------------------------------------------
@echo off
set /p choice=I Am Gonna :
if %choice% == 1 goto REC
if %choice% == 2 goto NOR
if %choice% == 3 goto DOWN
if %choice% == 4 goto LOAD
if %choice% == 5 goto HOT
if %choice% == 6 goto LOG
if %choice% == 7 goto ROM
if %choice% == 8 goto DUP
if %choice% == 9 goto FRM
if %choice% == 10 goto APKI
if %choice% == 11 goto IMEI
if %choice% == 12 goto MORE
if %choice% == 0 goto start
cls

:REC
cd C:\toolkit\tools
Echo ----------------------------------------------
echo           REBOOT to RECOVERY
echo ----------------------------------------------
echo ARE YOU SURE YOU WANT TO CONTINUE?  (YES=1, NO=0)

set /P res1=Enter choice: 
if NOT "%res1%"=="1" goto OTH
adb reboot recovery
echo done
goto done

cls
echo


:NOR
cd C:\toolkit\tools
Echo ----------------------------------------------
echo              REBOOT ONLY
echo ----------------------------------------------
echo ARE YOU SURE YOU WANT TO CONTINUE?  (YES=1, NO=0)


set /P res1=Enter choice: 
if NOT "%res1%"=="1" goto OTH
adb reboot

goto OTH
cls


:DOWN
cd C:\toolkit\tools
Echo ----------------------------------------------
echo              REBOOT To DOWNLOAD
echo ----------------------------------------------
echo ARE YOU SURE YOU WANT TO CONTINUE?  (YES=1, NO=0)


set /P res1=Enter choice: 
if NOT "%res1%"=="1" goto OTH
adb reboot download

echo done
goto done
cls

:LOAD
cd C:\toolkit\tools
Echo ----------------------------------------------
echo              REBOOT To BOOTLOADER
echo ----------------------------------------------
echo ARE YOU SURE YOU WANT TO CONTINUE?  (YES=1, NO=0)


set /P res1=Enter choice: 
if NOT "%res1%"=="1" goto OTH
adb reboot bootloader

echo done
goto OTH
cls


:LOG
cd C:\toolkit\tools
Echo ----------------------------------------------
echo              TAKE A LOGCAT
echo ----------------------------------------------
echo ARE YOU SURE YOU WANT TO CONTINUE?  (YES=1, NO=0)

set /P res1=Enter choice: 
if NOT "%res1%"=="1" goto OTH

echo NOTE: MAKE SURE THAT USB DEBUGING IS ENABLED !!!!!!
 
echo NOTE: IF YOU WANT TO STOP PRESS CTRL+C
echo NOTE: LOGCAT FILE IS IN TOOLS FOLDER!!!!!
ECHO --------------------------------------------------
echo ARE YOU SURE YOU WANT TO CONTINUE?  (YES=1, NO=0)

set /P res1=Enter choice: 
if NOT "%res1%"=="1" goto OTH

adb logcat -d > logcat.txt
 
echo done
goto done
cls


:ZIP
echo --------------------------------------------
echo         WELCOME TO ZIP SIDELOADER
echo --------------------------------------------
echo + HOW TO USE IT ???
echo +1.RENAME YOU ZIP TO UPDATE ZIP
echo +2.PLACE ZIP FILE IN TOOLS\SID FOLDER
echo +3.RENAME ZIP TO UPDATE.ZIP
echo +4.WHEN REBOOTED TO RECOVEY PRESS INSTALL ZIP
echo +5.PRESS SIDLOAD ZIP AND LET THE SCRIPT DO IT..!!
echo +++++++++++++++++++++++++++++++++++++++++++++++

 
echo ARE YOU SURE YOU WANT TO CONTINUE?  (YES=1, NO=0)

set /P res1=Enter choice: 
if NOT "%res1%"=="1" goto OTH

cd c:\toolkit\tools\SID
adb reboot recovery
pause
adb sideload update.zip

echo done
goto done

:PUSH
echo  ++++++++++++++++++++++++++++++++++++++++ 
echo +   WELCOME TO APK PUSHER (only to system) + 
echo  ++++++++++++++++++++++++++++++++++++++++
echo + HOW TO USE IT!!! 
echo + 1.RENAME YOUR APK TO update.apk
echo + 2.Place Your apk in tools\PUSH folder
echo ++++++++++++++++++++++++++++++++++++++++++
echo ------------------------------------------

echo Where Do you Want to push your APK ? (System/App=1, Start=b)

set /P res1=Enter choice: 
if %choice% == 1 goto PP
if %choice% == b goto start
if %choice% == B goto start
CLS

:PP
echo YOU CHOOSED TO PUSH YOUR APK TO SYSTEM/APP IN YOUR PHONE

cd C:\toolkit\tools\PUSH
adb remount
adb push c:\toolkit\tools\PUSH\update.apk /system/app

echo done!

goto done
cls
@echo off
CLs

:ROM
cd C:\toolkit\tools
echo ========================================
echo      GET YOUR ROM NAME FROM HERE
ECHO =========================================

echo ARE YOU SURE YOU WANT TO CONTINUE?  (YES=1, NO=0)

set /P res1=Enter choice: 
if NOT "%res1%"=="1" goto OTH

adb devices
adb shell getprop "ro.build.version" >> "c:\toolkit\tools\Romname.txt"

echo File in tools folder called Rom name!! 

PAUSE
goto done
ECHO DONE!!

:DUP
cd c:\toolkit\tools\DUMP
echo +++++++++++++++++++++++++++++++++++++++++++
echo     MAKE A DUMP FROM SYSTEM PARTIYION
echo +++++++++++++++++++++++++++++++++++++++++++

echo ARE YOU SURE YOU WANT TO CONTINUE?  (YES=1, NO=0)

set /P res1=Enter choice: 
if NOT "%res1%"=="1" goto OTH

adb remount
adb pull /system/ c:\toolkit\tools\DUMP

echo done!!
echo DUMP LOCATED IN C:\TOOLKIT\TOOLS\DUMP\HERE
goto done

:FRM
cd C:\toolkit\tools\FRM
echo ++++++++++++++++++++++++++++++++++++
echo      FRAMEWORK FOLDER PULLER
ECHO ++++++++++++++++++++++++++++++++++++

echo ARE YOU SURE YOU WANT TO CONTINUE?  (YES=1, NO=0)

set /P res1=Enter choice: 
if NOT "%res1%"=="1" goto OTH
echo pulling

adb remount
adb pull /system/framework/ c:\toolkit\tools\FRM

echo your framework Folder is located in c:\toolkit\tools\FRM
pause
goto done
cls

:BAC
cls
cd c:\toolkit\tool\BAC
Echo.
Echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Echo  +                         BACKUP YOUR PHONE                                     +
Echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Echo           Step 1- Press Enter To Start                         
Echo           Step 2- Follow On Screen Prompts That Appear On Phone
Echo ================================================================================
Echo.
echo ARE YOU SURE YOU WANT TO CONTINUE?  (YES=1, NO=0)

set /P res1=Enter choice: 
if NOT "%res1%"=="1" goto OTH
pause
adb backup -all -f c:\toolkit\tool\BAC
pause
goto done

:bup2
cls
Echo.
Echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Echo                                    RESTORE
Echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Echo           Step 1- Press Enter To Start                         
Echo           Step 2- Follow On Screen Prompts That Appear On Phone
Echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Echo.
echo ARE YOU SURE YOU WANT TO CONTINUE?  (YES=1, NO=0)

set /P res1=Enter choice: 
if NOT "%res1%"=="1" goto OTH
pause
adb restore c:\toolkit\tool\BAC
pause
goto done



:DIS
echo  ++++++++++++++++++++++++++++++++++++++++++
echo                  DISCLIAMER
echo  +++++++++++++++++++++++++++++++++++++++++++

echo  --------------------------------------------
echo   REMMEBER THAT IS IS A FREE SCRIPT 
echo   FREE DOESNOT MEAN OUT OF RESPECT
echo   THIS SCRIPT IS BROUGHT BY NO MEANS
echo   OF MAKING YOUR PHONE NEW BUT IT HELPS
echo   YOU DOING BASIC THINGS LIKE PULLING
echo   PUSHING SIDELOADING FLASHING ZIPS
echo   ROOTING AND FLASHING A CUSTOM RECOVERY
echo   REBOOTING TO RECOVERY DOWNLOAD
echo   BOOTLOADER BACKUPING YOUR PHONE
echo   RESTORING YOUR PHONE GIVE YOUR
echo   DEVICE INFO LCD DENSITY AND BLAH BLAH
echo   -------------------------------------------
echo   IF YOU HAVE OBTAINED THIS SCRIPT FROM ANY
echo   OTHER PLACE REMMEBER THAT I WILL NOT SUPPORT
echo   YOU!!!
ECHO   YOU CHOOSED TO APPLY THESE MODIFICATIONS
ECHO   TO YOUR TAB AND YOU WERE NOT DRUNK
ECHO   WHEN YOU USED THE SCRIPT 
ECHO  ----------------------------------------------
ECHO   REMMEBER I AM NOT RESPONSIBLE FOR ANYTHING
ECHO   BAD THAT HAPPENES TO YOUR TAB I WILL LAUGH
ECHO   AT YOU IF YOU POINT YOUR FINGER AT ME !!!!!
echo  --------------------------------------------


echo WHERE DO YOU WANT TO GO ?  (START=1, EXIT EVERY THING=0)


set /P res1=Enter choice: 
if "%res1%"=="1" goto start
if NOT "%res1%"=="1" goto quit

:quit

Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!
Echo bye bye !!!!

exit


:XDA
echo                                   `                                       
echo                                                                                                 
echo                                                  hh.                                         
echo                                                  MM-                                         
echo               `.`           `..      `...........MM-    .............`                       
echo                /dm/`        :hmo`   -ohhdhhhhhhhhhMM-    ohhhhhhhhhhhhhy:                     
echo                .sNh:`    .sNd:    :NN/.``````````MM-    `````````````:hN+                    
echo                  :hNy. `+mm+`     yMo            MM-      `.-:::::::::oMh                    
echo                   `/dmsdNs.       yM+            MM-    `odmhhhhyyyyhydMh                    
echo                     -NNMs`        yM+            MM-    sMs`          /Mh                    
echo                   .sNd/sNh:       yM+            MM-    dM/           /Mh                    
echo                 `+mm+   -hNy-     sMs           `MN.    dM/           /Mh                    
echo               `/dNo`      /mNo`   -mNo:.......:+dNs     /Nm+-......../dN:                    
echo               ody.         `+dy`   `+yhdddddddhyo-       `+ydddddddddyo.
echo
echo --------------------------------------------------------
echo WHERE DO YOU WANT TO GO ?  (START=1, EXIT EVERY THING=0)


set /P res1=Enter choice: 
if "%res1%"=="1" goto start
if NOT "%res1%"=="1" goto quit

:HOT
ECHO +++++++++++++++++++++++++++++++++++++++++
ECHO               HOT REBOOT
ECHO +++++++++++++++++++++++++++++++++++++++++
ECHO -----------------------------------------
ECHO PLEASE CONNECT YOUR TAB TO PC AND MAKE
ECHO SURE THAT USB DEBUGGING IS ENABLED 
ECHO ------------------------------------------
ECHO.
echo ARE YOU SURE YOU WANT TO CONTINUE?  (YES=1, NO=0)

set /P res1=Enter choice: 
if NOT "%res1%"=="1" goto start
if "%res1%"=="1" goto REB
:REB
cd C:\toolkit\tools\
adb shell pkill zygote
echo.
echo --------------------------------------------------------
echo WHERE DO YOU WANT TO GO ?  (START=1, EXIT EVERY THING=0)


set /P res1=Enter choice: 
if "%res1%"=="1" goto start
if NOT "%res1%"=="1" goto quit
if "%res1%"=="0" goto quit

:done
cls
Echo.
ECho               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ECho                                      DONE!!!!
ECho               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo                        DDDDD     OOOO   NN    NN  EEEEEE
echo                        DD   D   OO  OO  NNN   NN  EE   
echo                        DD   DD  OO  OO  NN N  NN  EEEE
echo                        DD   DD  OO  OO  NN  N NN  EEEE
echo                        DD   D   OO  OO  NN   NNN  EE   
echo                        DDDDD     OOOO   NN    NN  EEEEEE
echo               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Echo.


echo WHERE DO YOU WANT TO GO ?  (START=1, EXIT EVERY THING=0)


set /P res1=Enter choice: 
if "%res1%"=="1" goto start
if NOT "%res1%"=="1" goto quit

:APKI
echo ==========================================
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo       WELCOME TO APK INSTALLER
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo ==========================================
echo.
echo + HOW TO USE IT??
echo.
echo + TO USE THE APK INSTALLER YOU MUST 
echo + 1.PLACE YOUR apk APKI FOLDER IN TOOLS
echo + 2.AND LET THE SCRIPT DO THE MAGIC FOR YOU
echo.
pause


echo ARE YOU SURE YOU WANT TO CONTINUE?  (YES=1, NO=0)

set /P res1=Enter choice: 
if NOT "%res1%"=="1" goto OTH
if "%res1%"=="1" goto APKS

:APKS
cd C:\toolkit\tools\APKI

echo MAKE SURE THAT USB DEBUGGING IS CHECKED!!
adb remount
adb install *.apk
pause

echo done!
echo ------------------------------------------

echo WHERE DO YOU WANT TO GO ?  (START=1, EXIT EVERY THING=0)


set /P res1=Enter choice: 
if "%res1%"=="1" goto start
if NOT "%res1%"=="1" goto quit

:IMEI
echo ++++++++++++++++++++++++++++++++++++
echo    WELCOME TO IMEI SHOWER/SAVER
echo +++++++++++++++++++++++++++++++++++++

echo WHAT DO YOU WANT TO DO ?  
echo ------------------------
echo.
echo FOR SHOWING YOUR IMEI CODE TYPE 1
echo.
ECHO FOR SAVING YOUR IMEI CODE TYPE 2
echo.
ECHO TO GO TO FIRST PAGE TYPE 3
echo.
ECHO IF YOU WANT TO EXIT PRESS 0
echo.
echo --------------------------
echo.
set /P res1=Enter choice: 
if "%res1%"=="1" goto SHOW
if "%res1%"=="2" goto SAVE
if "%res1%"=="3" goto start
if "%res1%"=="0" goto quit

:SHOW
echo THIS WILL ONLY SHOW YOUR IMEI CODE !!!!
echo.
CD c:\toolkit\tools\
adb shell dumpsys iphonesubinfo
echo done
echo ---------------------------------------------------------------
echo WHERE DO YOU WANT TO GO ?  (IMEI SHOWER/SAVER=1, START=2, EXIT=0)


set /P res1=Enter choice: 
if "%res1%"=="1" goto IMEI
if "%res1%"=="2" goto start
if "%res1%"=="3" goto quit

:SAVE

echo THIS WILL SAVE YOUR IMEI CODE !!!!

CD c:\toolkit\tools\
adb shell dumpsys iphonesubinfo > c:\toolkit\tools\IMEI.txt
echo.
echo done!!!
echo ---------------------------------------------------------------
echo WHERE DO YOU WANT TO GO ?  (IMEI SHOWER/SAVER=1, START=2, EXIT=0)


set /P res1=Enter choice: 
if "%res1%"=="1" goto IMEI
if "%res1%"=="2" goto start
if "%res1%"=="3" goto quit

:MORE

echo -------------------------------------------------------
echo                  MORE OPTIONS
echo -------------------------------------------------------
echo 1-FIX PERMISSIONS
echo 2-How To Restore Device Back To Factory Defaults
echo 3-INSTALL/REMOVE AD-BLOCK HOSTS
echo ----------------------------------------------------
echo.


set /P res1=Enter choice: 
if "%res1%"=="1" goto FIXPE
if "%res1%"=="2" goto REST
if "%res1%"=="3" goto HOSTS
:FIXPE

ECHO --------------------------------------
ECHO    WELCOME TO PERMMISION FIXER
ECHO --------------------------------------
ECHO.
echo ARE YOU SURE YOU WANT TO CONTINUE?  (YES=1, NO=0)

set /P res1=Enter choice: 
if NOT "%res1%"=="1" goto MORE

cls
adb wait-for-device
adb remount
adb shell chmod 644 /system/app/*
adb shell chmod 644 /system/framework/*
adb shell chmod 777 /system/etc/init.d
adb shell chmod 777 /system/etc/init.d/*
pause
ECHO DONE!!!!
goto done


:REST
echo  =============================================
echo  HOW TO RESTORE YOUR DEVICE TO FCTORY DEFAULTS 
echo  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo  1.DOWNLOAD AND INSTALL SAMSUNG DRIVERS FROM THIS PAGE
start http://forum.xda-developers.com/showthread.php?t=1655286
PAUSE
echo.
echo  2.DOWNLOAD ODIN FROM THIS PAGE !!!
start http://forum.xda-developers.com/showthread.php?t=2189539
pause
echo. 
echo  3.DOWNLOAD A STOCK FRIMWARE FROM THIS PAGE MAKE SURE YOU ARE LOGGED IN AND SEARCH FOR YOUR MODEL!!!!!!
start http://www.sammobile.com/firmwares/
PAUSE
echo.
echo  4.NAVIGATE TO THE PLACE WHERE YOU DOWNLOADED ODIN
PAUSE
ECHO.
echo  5.DOUBLE CLICK ODIN .EXE
PAUSE
echo.
echo  6.PRESS ON PDA BUTTON AND CHOOSE THE DOWNLOADED TAR.MD5 ROM
PAUSE
echo.
echo  7.NOW REBOOT YOUR TAB TO DOWNLOAD MODE BY PRESING THE POWER+VOL DOWN
PAUSE
ECHO.
ECHO  8.CONNECT YOUR TAB TO THE PC AND ODIN WILL SHOW ADDED!!
PAUSE
ECHO.
ECHO  9.MAKE SURE THAT F.RESET TIME IS CHECKED AND AUTO REBOOT IS ALSO CHECKED
PAUSE
ECHO.
ECHO  10.PRESS ON START BUTTON,IF EVERY GOES RIGHT ODIN WILL DISPLAY 1 SUCCSEDED 0 FAIL
ECHO.
pause
GOTO done

:HOSTS
echo +++++++++++++++++++++++++++++++++++++
echo    WELCOME TO AD-BLOCK OPTIONS
ECHO ======================================
ECHO.
ECHO 1-INSTAL AD-BLOCK HOSTS
ECHO 2-UNINSTALL
ECHO 0-GO BACK
ECHO ---------------------------------------
ECHO.

set /P res1=Enter choice: 
if "%res1%"=="1" goto INSH
if "%res1%"=="2" goto UNHS











:INSH
ECHO +++++++++++++++++++++++++++++++++++++++
ECHO     WELCOME TO AD-BLOCK INSTALLER
ECHO +++++++++++++++++++++++++++++++++++++++
ECHO SO YOU ARE TIRED FROM THE AD POPUPS IN
ECHO APPS AND WOULD LIKE TO GET RID OF THEM EASILY
ECHO AND FASTLY THEN THIS IS FOR YOU !!!!!!!!
ECHO ---------------------------------------------
ECHO.
echo ARE YOU SURE YOU WANT TO CONTINUE?  (YES=1, NO=0)

set /P res1=Enter choice: 
if NOT "%res1%"=="1" goto MORE

CD c:\toolkit\tools\

ECHO CONNECT YOUR DEVICE DON'T FORGET!!!!
ECHO.
adb wait-for-device
adb remount
adb push c:\toolkit\tools\HOSTb\hosts /system/etc/
adb reboot
pause
goto done


:UNHS

ECHO +++++++++++++++++++++++++++++++++++++++
ECHO     WELCOME TO AD-BLOCK UNINSTALLER
ECHO +++++++++++++++++++++++++++++++++++++++
ECHO ---------------------------------------------
ECHO.
echo ARE YOU SURE YOU WANT TO CONTINUE?  (YES=1, NO=0)

set /P res1=Enter choice: 
if NOT "%res1%"=="1" goto MORE

ECHO TO UINSTALL THE AD-BLOCK HOSTS FOLLOW THE INSTRUTIONS
ECHO ------------------------------------------------------
ECHO 1-INSTALL ES FILE EXPLORER FROM HERE OR FROM THE PLAYSTORE
start https://play.google.com/store/apps/details?id=com.estrongs.android.pop
pause
ECHO 2-LAUNCH ES FILEMANAGER FROM THE APP DRAWER
ECHO 3-PRESS ON TOOLS AND CHOOSE ROOT EXPLORER AND GRNANT PERMISSIONS
ECHO 4-NAVIGATE TO SYSTEM/ETC AND DELETE THE HOSTS FILE AND REBOOT
ECHO ---------------------------------------------------------------
ECHO AFTER THIS PRESS ENTER!!!

pause
goto done
