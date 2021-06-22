#!/bin/sh

cat <<EOF
Flutter Test Menu

Select OS:

    1. Mac
    2. Linux
EOF
read os
if [ $os = 1 ]; then
    flutter test --coverage
    cd domain
    flutter test --coverage
    cd ../data
    flutter test --coverage
    cd ..
    sed 's+SF:+SF:domain/+g' domain/coverage/lcov.info >domain/coverage/lcov_formated.info
    sed 's+SF:+SF:data/+g' data/coverage/lcov.info >data/coverage/lcov_formated.info
    lcov --add-tracefile coverage/lcov.info -a domain/coverage/lcov_formated.info -a data/coverage/lcov_formated.info -o coverage/coverage_merged.info
    genhtml coverage/coverage_merged.info --output=coverage
    open -a "Google Chrome" coverage/index.html
elif [ $os = 2 ]; then
    flutter test --coverage
    cd domain
    flutter test --coverage
    cd ../data
    flutter test --coverage
    cd ..
    sed 's+SF:+SF:domain/+g' domain/coverage/lcov.info >domain/coverage/lcov_formated.info
    sed 's+SF:+SF:data/+g' data/coverage/lcov.info >data/coverage/lcov_formated.info
    lcov --add-tracefile coverage/lcov.info -a domain/coverage/lcov_formated.info -a data/coverage/lcov_formated.info -o coverage/coverage_merged.info
    genhtml coverage/coverage_merged.info --output=coverage
    detach xdg-open coverage/index.html
else
    echo 'Opción incorrecta.'
fi
