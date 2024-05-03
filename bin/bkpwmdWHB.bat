@echo off
cd bin

title Whatsapp Business BACKUP TOOL 
mode con:cols=80 lines=50

cls
cls
cecho Connect device in {0C}(ADB) MODE{#}

echo. 

echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
echo.  
cecho                        {06}"Whatsapp Business BACKUP With Media"{#}
echo.
cecho                        {06}"Whatsapp Business BACKUP Without Root"{#}
echo.
cecho                          {0A}"With Easy BackUp Tool"{#} 
echo.                                              
echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
echo.         
echo. 
echo. 

ping /n 4 /w 10000 google.com >nul

cls
title Whatsapp Business BACKUP TOOL 
mode con:cols=80 lines=50
echo. 
cecho Connect device in {0C}( ADB) MODE{#}

echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
echo.  
cecho                        {06}"Whatsapp Business BACKUP With Media"{#}
echo.
cecho                        {06}"Whatsapp Business BACKUP Without Root"{#}
echo.
cecho                          {0A}With Easy BackUp Tool {#} 
echo.                                              
echo = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
echo.  
echo.
echo CLICK ENTER TO Whatsapp Business BACKUP
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


adb shell am force-stop com.whatsapp.w4b
echo.
cecho {03}Stopping Whatsapp Business.....{#}
echo.
echo.






cecho {03}Backing Up Media of Whatsapp Business{#}
echo.
echo.
cd..
cd Data
rmdir /s /q com.whatsapp.w4b
adb pull /sdcard/Android/media/com.whatsapp.w4b
echo.
echo.
cecho {03}Backing Up Media of Whatsapp Business Done{#}
echo.
echo.




echo.
echo.
echo. Backup Media (com.whatsapp.w4b) Done
echo.
cecho {04}ENTER TO Exit{#}
echo.
pause >nul
cls