busybox mount -o remount,rw /system

dd if=/data/local/tmp/omh.ttf of=/system/fonts/NotoSansMyanmar-Bold.ttf
chmod 644 /system/fonts/NotoSansMyanmar-Bold.ttf

dd if=/data/local/tmp/omh.ttf of=/system/fonts/NotoSansMyanmar-Regular.ttf
chmod 644 /system/fonts/NotoSansMyanmar-Regular.ttf

dd if=/data/local/tmp/omh.ttf of=/system/fonts/NotoSansMyanmarUI-Bold.ttf
chmod 644 /system/fonts/NotoSansMyanmarUI-Bold.ttf

dd if=/data/local/tmp/omh.ttf of=/system/fonts/NotoSansMyanmarUI-Regular.ttf
chmod 644 /system/fonts/NotoSansMyanmarUI-Regular.ttf
