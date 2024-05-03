@echo off


title WHATSAPP Restore TOOL 
mode con:cols=80 lines=50
cd bin
cls
cls
cecho Connect device in {0C}(ADB) MODE{#}

echo. 

echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
echo.  
cecho                        {06}"WHATSAPP Restore With Media"{#}
echo.
cecho                        {06}"WHATSAPP Restore Without Root"{#}
echo.
cecho                          {0A}"With Easy Restore Tool"{#} 
echo.                                              
echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
echo.         
echo. 
echo. 

ping /n 4 /w 10000 google.com >nul

cls
title WHATSAPP Restore TOOL 
mode con:cols=80 lines=50
echo. 
cecho Connect device in {0C}( ADB) MODE{#}

echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
echo.  
cecho                        {06}"WHATSAPP Restore With Media"{#}
echo.
cecho                        {06}"WHATSAPP Restore Without Root"{#}
echo.
cecho                          {0A}"With Easy Restore Tool"{#} 
echo.                                              
echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
echo.  
echo.
echo CLICK ENTER TO WHATSAPP Restore
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




cecho  {0E}Uninstalling Installed Whatsapp{#}{0a}:{0b}%
echo.
echo.
adb shell pm uninstall com.whatsapp
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
cecho  {0E}Restore Whatsapp{#}{0a}:{0b}%
echo.
echo.
echo.
echo.
cecho  {0E}old version of whatsapp will open , you must  click restore{#}{0a}
echo.
echo.
adb restore backup.ab
echo.
echo.
echo =============================
echo Press Enter
echo.
pause >nul







cd..
cd Bin
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
echo. Restore (com.whatsapp) Done


adb shell am force-stop com.whatsapp
echo.
cecho {03}Stopping Whatsapp.....{#}
echo.
echo.


cecho {03}Restore Media of Whatsapp{#}
echo.
echo.
cd..
cd Data
adb shell mkdir /sdcard/Android/media/com.whatsapp
adb push com.whatsapp /sdcard/Android/media/
adb push com.whatsapp/WhatsApp /sdcard/
adb push WhatsApp /sdcard/
adb push WhatsApp /sdcard/Android/media/com.whatsapp
rmdir /s /q WhatsApp
rmdir /s /q com.whatsapp
echo.
echo.
cecho {03}Restore Media of Whatsapp Done{#}
echo.
echo.

timeout /t 10 >nul
cd..
cd Temp
adb shell getprop ro.build.version.sdk > sdk.txt
set /p sdkk=<sdk.txt
echo %sdkk%
if %sdkk% GEQ 30 (adb shell rm -r /sdcard/WhatsApp) else (echo ...)
adb shell am start -n com.whatsapp/com.whatsapp.Main
echo Press Enter
echo.
echo.
timeout /t 10 >nul
pause >nul
adb shell am force-stop com.whatsapp

echo.
cecho {03}if media not opening then delete folder WhatsApp in interal shared storage{#}
cecho {03}and force stop whatsapp{#}
echo.
echo.
echo.


cecho {04}ENTER TO Exit{#}
echo.
pause >nul
cls