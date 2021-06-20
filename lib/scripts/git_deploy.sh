#!/bin/sh
cat <<EOF
Release Generation
 
Version Number (IE 1.3.6):
EOF

read versionNumber

COMMIT_MSG="Deploy v$versionNumber in profile mode."
TAG_MSG="Version $versionNumber in profile mode."

echo "Are you sure to generate tag version $versionNumber? y/n"
read response

if [ $response = "y" ]; then
    git add .
    git commit -m "$COMMIT_MSG"
    echo "COMMIT MSG: $COMMIT_MSG"
    git push origin development
    git checkout release
    git pull origin release
    git merge development
    git push origin release
    git tag -a v$versionNumber -m "$TAG_MSG"
    echo "TAG MSG: $TAG_MSG"
    git push --tags
    git checkout development
fi

