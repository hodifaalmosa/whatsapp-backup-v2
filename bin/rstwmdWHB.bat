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

adb shell am force-stop com.whatsapp.w4b
echo.
cecho {03}Stopping Whatsapp.....{#}
echo.
echo.













cecho {03}Restore Media of Whatsapp{#}
echo.
echo.
cd..
cd Data
@REM adb shell mkdir /sdcard/Android/media/com.whatsapp.w4b
@REM cd com.whatsapp.w4b
@REM cd WhatsApp Business
@REM rmdir /s /q .Shared
@REM rmdir /s /q .trash
@REM cd..
@REM cd..
adb shell rm -rf /sdcard/Android/media/com.whatsapp.w4b
adb push com.whatsapp.w4b /sdcard/Android/media/
rmdir /s /q com.whatsapp.w4b
rmdir /s /q WhatsApp Business
echo.
echo.
cecho {03}Restore Media of Whatsapp Done{#}
echo.
echo.

REM cd..
REM cd Temp
REM adb shell getprop ro.build.version.sdk > sdk.txt
REM set /p sdkk=<sdk.txt
REM echo %sdkk%
REM if %sdkk% GEQ 30 (adb shell rm -r /sdcard/WhatsApp Business) else (echo ...)
REM adb shell am start -n com.whatsapp.w4b/com.whatsapp.w4b.Main
REM echo Press Enter
REM echo.
REM echo.
REM timeout /t 10 >nul
REM pause >nul
REM adb shell am force-stop com.whatsapp.w4b

echo.
cecho {03}if media not opening then delete folder WhatsApp Business in interal shared storage{#}
cecho {03}and force stop whatsapp{#}
echo.
echo.
echo.


cecho {04}ENTER TO Exit{#}
echo.
pause >nul
cls