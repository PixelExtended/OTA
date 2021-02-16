DEVICE=$1
ROMDIR=~/$2
MAINTAINER=$3
MAINTAINER_URL=$4
FORUM_URL=$5

# Ensures that mandatory parameters are entered
if [ $# -lt 5 ]; then
    echo "Missing mandatory parameters"
    exit 1
fi

cd $ROMDIR
DATETIME=$(grep "org.pixelexperience.build_date_utc=" out/target/product/$DEVICE/system/build.prop | cut -d "=" -f 2)
FILENAME=$(find out/target/product/$DEVICE/PixelExtended*.zip | cut -d "/" -f 5)
ID=$(md5sum out/target/product/$DEVICE/PixelExtended*.zip | cut -d " " -f 1)
FILEHASH=$ID
SIZE=$(wc -c out/target/product/$DEVICE/PixelExtended*.zip | awk '{print $1}')
URL="https://sourceforge.net/projects/pixelextended/files/$DEVICE/$FILENAME/download"
VERSION="11"
DONATE_URL="https://www.paypal.me/aryan65"
WEBSITE_URL="https://pixelextended.me/"
NEWS_URL="https:\/\/t.me\/pexupdates"
JSON_FMT='{\n"error":false,\n"filename": %s,\n"datetime": %s,\n"size":%s, \n"url":"%s", \n"filehash":"%s", \n"version": "%s", \n"id": "%s",\n"donate_url": "%s",\n"website_url":"%s",\n"news_url":"%s",\n"maintainer":"%s",\n"maintainer_url":"%s",\n"forum_url":"%s"\n}'
printf "$JSON_FMT" "$FILENAME" "$DATETIME" "$SIZE" "$URL" "$FILEHASH" "$VERSION" "$ID" "$DONATE_URL" "$WEBSITE_URL" "$NEWS_URL" "$MAINTAINER" "$MAINTAINER_URL" "$FORUM_URL" > $ROMDIR/OTA/builds/$DEVICE.json

BUILD_DATE=$(echo $FILENAME | cut -d "-" -f 3)
BUILD_YEAR=${BUILD_DATE:0:4}
BUILD_MONTH=${BUILD_DATE:4:2}
BUILD_DAY=${BUILD_DATE:6:2}
CHANGELOG_DATE=$(echo $BUILD_YEAR/$BUILD_MONTH/$BUILD_DAY)
CHANGELOG="Changelog - %s\n\n"
printf "$CHANGELOG_DATE" > $ROMDIR/OTA/changelogs/$DEVICE/$FILENAME.txt