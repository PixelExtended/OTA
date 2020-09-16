DEVICE=$1
MAINTAINER=$2
MAINTAINER_URL=$3

# Ensures that mandatory parameters are entered
if [ $# -lt 3 ]; then
    echo "Missing mandatory parameters"
    exit 1
fi

# Ensures that optional parameters are entered
if [ -z "$4" ]; then
    FORUM_URL=""
else
    FORUM_URL=$4
fi

# Define ROM and OTA repo directories
ROMDIR=~/pex
OTADIR=~/OTA
cd $ROMDIR
DATETIME=$(grep "org.pixelexperience.build_date_utc=" out/target/product/$DEVICE/system/build.prop | cut -d "=" -f 2)
FILENAME=$(find out/target/product/$DEVICE/PixelExtended*.zip | cut -d "/" -f 5)
ID=$(md5sum out/target/product/$DEVICE/PixelExtended*.zip | cut -d " " -f 1)
FILEHASH=$ID
SIZE=$(wc -c out/target/product/$DEVICE/PixelExtended*.zip | awk '{print $1}')
URL="https://sourceforge.net/projects/pixelextended/files/$DEVICE/$FILENAME/download"
VERSION="10"
DONATE_URL="https://www.paypal.me/aryan65"
WEBSITE_URL="https://pixelextended.me/"
NEWS_URL="https:\/\/t.me\/pexupdates"
JSON_FMT='{\n"error":false,\n"filename": %s,\n"datetime": %s,\n"size":%s, \n"url":"%s", \n"filehash":"%s", \n"version": "%s", \n"id": "%s",\n"donate_url": "%s",\n"website_url":"%s",\n"news_url":"%s",\n"maintainer":"%s",\n"maintainer_url":"%s",\n"forum_url":"%s"\n}'
printf "$JSON_FMT" "$FILENAME" "$DATETIME" "$SIZE" "$URL" "$FILEHASH" "$VERSION" "$ID" "$DONATE_URL" "$WEBSITE_URL" "$NEWS_URL" "$MAINTAINER" "$MAINTAINER_URL" "$FORUM_URL" > $OTADIR/builds/$DEVICE.json
echo "Latest JSON file updated in $OTADIR/builds/. Please confirm."

cp out/target/product/$DEVICE/PixelExtended*Changelog.txt $OTADIR/changelogs/$DEVICE
echo "Latest changelog updated in $OTADIR/changelogs/$DEVICE/. Please confirm."