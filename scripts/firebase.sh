#!/bin/sh

cat <<EOF
Firebase Deploy

Select Option:

    1. Android deploy
    2. iOS deploy
EOF

read option

if [ $option = 1 ]; then
  clear
  echo 'Android deploy....'
  echo "Releases notes:"
  read NOTES
  firebase appdistribution:distribute app-profile.apk --app 1:546553928158:android:05c85876a257f9dd6ae54f --release-notes "$NOTES" --groups "testers" --token "1//013kVPMbmXRZuCgYIARAAGAESNwF-L9IrjZmF6cpGK4FUAY51TVQ1noc7T1ajZ7E4DDuvb25yIlAQlwfrjDFvIC7nZYl6ZKZqBqA"
elif [ $option = 2 ]; then
  clear
  echo 'iOS deploy....'
  echo "Releases notes:"
  read NOTES
  firebase appdistribution:distribute Payload.ipa --app 1:546553928158:ios:b534ec06972cd9b26ae54f --release-notes "$NOTES" --groups "ios-testers" --token "1//013kVPMbmXRZuCgYIARAAGAESNwF-L9IrjZmF6cpGK4FUAY51TVQ1noc7T1ajZ7E4DDuvb25yIlAQlwfrjDFvIC7nZYl6ZKZqBqA"
else
  echo 'Invalid option'
fi
