@echo off
cd bin

title WHATSAPP BACKUP TOOL 
mode con:cols=80 lines=50

cls
cls
cecho Connect device in {0C}(ADB) MODE{#}

echo. 

echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
echo.  
cecho                        {06}"WHATSAPP BACKUP With Media"{#}
echo.
cecho                        {06}"WHATSAPP BACKUP Without Root"{#}
echo.
cecho                          {0A}"With Easy BackUp Tool"{#} 
echo.                                              
echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
echo.         
echo. 
echo. 

ping /n 4 /w 10000 google.com >nul

cls
title WHATSAPP BACKUP TOOL 
mode con:cols=80 lines=50
echo. 
cecho Connect device in {0C}( ADB) MODE{#}

echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
echo.  
cecho                        {06}"WHATSAPP BACKUP With Media"{#}
echo.
cecho                        {06}"WHATSAPP BACKUP Without Root"{#}
echo.
cecho                          {0A}With Easy BackUp Tool {#} 
echo.                                              
echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
echo.  
echo.
echo CLICK ENTER TO WHATSAPP BACKUP
pause >nul
echo.
echo =============================

cls



cecho {0C}------Information Log--------{#}
echo.
adb.exe kill-server > nul
adb.exe start-server > nul
echo.
cecho {03}Connect only one Device......{#}
echo.
cecho {03}Waiting For Any Device......{#}
adb wait-for-device
echo.
echo.
cecho {0F}Device Detected.....{#}{0A}OK{#}
echo.
cecho {0E}Brand{#}{0a}:{0b}%
adb shell getprop ro.product.brand
cecho {0E}Model{#}{0a}:{0b}%
adb shell getprop ro.product.model
cecho	{0E}Android Version{#}{0a}:{0b}%
adb shell getprop ro.build.version.release
cecho	{0E}Sdk{#}{0a}:{0b}%
adb shell getprop ro.build.version.sdk
echo.


cls


adb shell am force-stop com.whatsapp
echo.
cecho {03}Stopping Whatsapp.....{#}
echo.
echo.


cd..
cd Temp
cecho	{0E}Backing Up Installed Whatsapp APK{#}{0a}:{0b}%
adb shell pm path com.whatsapp | grep package > wapath.txt
adb shell "echo $EXTERNAL_STORAGE" > sdpath.txt
adb shell dumpsys package com.whatsapp | grep versionName > wapver.txt
set /p apkpath=<wapath.txt
set /p sdpath=<sdpath.txt
set apkpath=%apkpath:package:=%
set /p version=<wapver.txt
for %%A in ("%apkpath%") do (
set apkname=%%~nxA
)
for /F "tokens=1" %%k in ("%version%") do (
set %%k
set version=%%v
)
echo WhatsApp %versionName% installed
adb pull %apkpath% 





cecho {03}Backing Up Media of Whatsapp{#}
echo.
echo.
cd..
cd Data
rmdir /s /q WhatsApp
rmdir /s /q com.whatsapp
adb pull /sdcard/Android/media/com.whatsapp
adb pull /sdcard/WhatsApp
echo.
echo.
cecho {03}Backing Up Media of Whatsapp Done{#}
echo.
echo.





cd..
cd Bin
cecho  {0E}Uninstalling Installed Whatsapp{#}{0a}:{0b}%
echo.
echo.
adb shell pm uninstall -k com.whatsapp
echo.
echo.



echo.
cecho  {0E}Reboot Device %


echo.
echo.
cecho  {0E}After The Boot Is Finished Press Enter{#}{0a}
echo.
echo.
pause >nul



adb wait-for-device
echo.
echo.




cd..
cd Bin
cecho  {0E}Install Fix WhatsApp{#}{0a}:{0b}%
echo.
echo.
adb install -r -d fix.apk
echo.
echo.
echo.
adb install -r fix.apk
echo.
echo.
adb shell am start -n com.whatsapp/com.whatsapp.Main
echo.
echo.
echo =============================
echo Press Enter
echo.
echo.
pause >nul






cd..
cd Backup
cecho  {0E}Backup Whatsapp{#}{0a}:{0b}%
echo.
echo.
echo.
echo.
cecho  {0E}old version of whatsapp will open , you must  click BackUp{#}{0a}
echo.
echo.
del /f /q backup.ab

adb backup com.whatsapp
echo.
echo.
echo =============================
echo Press Enter
echo.
pause >nul



cd..
cd bin
echo.
echo.
cecho  {0E}Install Stock WhatsApp{#}{0a}:{0b}%
echo.
echo.
adb install -r stock.apk
echo.
echo.
cecho  {0E}if whatsapp not opening install base.apk From Folder Temp{#}{0a}
echo.
echo.
echo. Backup (com.whatsapp) Done
echo.
cecho {04}ENTER TO Exit{#}
echo.
pause >nul
cls