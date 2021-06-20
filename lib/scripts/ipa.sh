#!/bin/sh
cat <<EOF
IPA Builder

Select Option:

    1. Dev
    2. Profile
EOF

read option

if [ $option = 1 ]; then
    clear
    echo "Building Dev IPA..."
    flutter clean
    flutter build ios --debug -t lib/main_dev.dart
    mkdir build/ios/iphoneos/Payload
    mv build/ios/iphoneos/Runner.app build/ios/iphoneos/Payload
    zip -r Payload.ipa build/ios/iphoneos/Payload
elif [ $option = 2 ]; then
    clear
    echo "Building Profile IPA..."
    flutter clean
    flutter build ios --profile -t lib/main_profile.dart
    cd build/ios/iphoneos
    mkdir Payload
    mv Runner.app Payload
    zip -r Payload.ipa Payload
    cd ../../../
    mv build/ios/iphoneos/Payload.ipa ./
else
    echo 'Invalid option'
fi