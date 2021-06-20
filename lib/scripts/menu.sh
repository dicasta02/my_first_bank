#!/bin/sh

cat <<EOF
Scripts Menu

Select Option:

    1. Setup project
    2. Flutter coverage
    3. Bloc builder
    4. APK builder
    5. IPA builder
    6. Git deploy
    7. Business flow
    8. Firebase deploy
EOF

read option

if [ $option = 1 ]; then
    clear
    ./scripts/setup.sh
elif [ $option = 2 ]; then
    clear
    ./scripts/test.sh
elif [ $option = 3 ]; then
    clear
    ./scripts/bloc.sh
elif [ $option = 4 ]; then
    clear
    ./scripts/apk.sh
elif [ $option = 5 ]; then
    clear
    ./scripts/ipa.sh
elif [ $option = 6 ]; then
    clear
    ./scripts/git_deploy.sh
elif [ $option = 7 ]; then
    clear
    ./scripts/business_flow.sh
elif [ $option = 8 ]; then
    clear
    ./scripts/firebase.sh
else
    echo 'Invalid option'
fi
