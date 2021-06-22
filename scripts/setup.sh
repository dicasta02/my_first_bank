#!/bin/sh

cat <<EOF
Flutter Setup

Running models packages get...
EOF
cd ./models
flutter packages get

echo ''
echo 'Running /domain packages get...'
cd ..
cd ./domain
flutter packages get

echo ''
echo 'Running /data packages get...'
cd ..
cd ./data
flutter packages get

echo ''
echo 'Running root packages get...'
cd ..
flutter packages get
