#!/bin/bash

APP="$1"
ICON="$2"

if [[ ! -d "$APP" || ! -f "$ICON" ]]; then
  echo "Usage: restore-iconset.sh MyApp.app Icon.icns"
  exit 1
fi

cp "$ICON" "$APP/Contents/Resources/"
if [[ -f "$APP/Contents/Resources/ApplicationStub.icns" ]]; then
      rm "$APP/Contents/Resources/ApplicationStub.icns"
fi

ICON_BASENAME=$(basename "$ICON" .icns)
/usr/libexec/PlistBuddy -c "Set :CFBundleIconFile $ICON_BASENAME"    "$APP/Contents/Info.plist"
/usr/libexec/PlistBuddy -c "Set :CFBundleName $ICON_BASENAME"        "$APP/Contents/Info.plist"
if ! /usr/libexec/PlistBuddy -c "Print :CFBundleDisplayName" "$APP/Contents/Info.plist" &>/dev/null; then
    /usr/libexec/PlistBuddy -c "Add :CFBundleDisplayName string $ICON_BASENAME" "$APP/Contents/Info.plist"
else
    /usr/libexec/PlistBuddy -c "Set :CFBundleDisplayName $ICON_BASENAME" "$APP/Contents/Info.plist"
fi

#if [[ -f "$APP/Contents/Resources/Automator Application Stub" ]]; then 
#      mv "$APP/Contents/Resources/Automator Application Stub" "$APP/Contents/Resources/"$(basename "$APP")
#  /usr/libexec/PlistBuddy -c "Set :CFBundleExecutable $(basename "$APP")" "$APP/Contents/Info.plist"
#fi

touch "$APP"

echo "Icon restored to $APP"
