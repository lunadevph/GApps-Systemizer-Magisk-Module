ch_con(){ chcon -h u:object_r:system_file:s0 "$1" 2>/dev/null; }

echo " "
echo "  Google GApps"
echo " "

API=$(getprop ro.build.version.sdk)
ANDROID=$(getprop ro.build.version.release)

echo "  Android Version: $ANDROID"
echo "  Android API Level: $API"
echo " "

if [ "$API" != 36 ] || [ "$ANDROID" != 16 ]; then
  echo "! Android Version is not supported"
  abort
fi

mkdir -p $MODPATH/system
cd $MODPATH

echo "  Installing Permissions"
tar -xJf files/Permissions.tar.xz -C system

echo "  Installing GApps"
echo "  Installing GmsCore"
tar -xJf files/GmsCore.tar.xz -C system
echo "  Installing Phonesky"
tar -xJf files/Phonesky.tar.xz -C system
echo "  Installing GoogleServicesFramework"
tar -xJf files/GoogleServicesFramework.tar.xz -C system
echo "  Installing GoogleCalendarSyncAdapter"
tar -xJf files/GoogleCalendarSyncAdapter.tar.xz -C system
echo "  Installing GoogleContactsSyncAdapter"
tar -xJf files/GoogleContactsSyncAdapter.tar.xz -C system

for dir in $(find $MODPATH/system -type d 2>/dev/null); do
  ch_con $dir
  chmod 755 $dir
  chown 0:0 $dir
done
for file in $(find $MODPATH/system -type f 2>/dev/null); do
  ch_con $file
  chmod 644 $file
  chown 0:0 $file
done

rm -rf $MODPATH/files

echo "  Installed Successfully!"
echo " "
