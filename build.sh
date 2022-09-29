#!/bin/bash
export ANDROID_SDK_ROOT="$HOME/Android/Sdk/"
$(pwd)/gradlew assembleFdroidRelease
cp $(pwd)/app/build/outputs/apk/fdroid/release/app-fdroid-release-unsigned.apk ./
zipalign -p -f -v 4 app-fdroid-release-unsigned.apk ntfy.apk
apksigner sign --ks $HOME/.keystore ntfy.apk
rm app-fdroid-release-unsigned.apk
