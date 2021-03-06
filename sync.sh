#!/bin/bash

readonly DATA_URL="https://covid19-dashboard.ages.at/data/data.zip"
readonly DATA_ARCHIVE_NAME="data.zip"
readonly DATE_STAMP="$(date +"%F-%H%M%S")"
readonly DATA_PATH="data/data-$DATE_STAMP"
readonly COMMIT_MESSAGE="Sync $DATE_STAMP"

curl $DATA_URL --output $DATA_ARCHIVE_NAME --silent

if test -f "$DATA_ARCHIVE_NAME"; then
    unzip -qq $DATA_ARCHIVE_NAME -d $DATA_PATH
    rm $DATA_ARCHIVE_NAME
    git add --all >/dev/null
    git commit -am "$COMMIT_MESSAGE" --quiet
    git push origin master --quiet
fi
