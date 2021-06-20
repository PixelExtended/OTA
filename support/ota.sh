DEVICE=$1
ROMDIR=~/$2
# Ensures that mandatory parameters are entered
if [ $# -lt 1 ]; then
    echo "Missing mandatory parameters"
    exit 1
fi

DATETIME=$(grep "org.pixelexperience.build_date_utc=" out/target/product/$DEVICE/system/build.prop | cut -d "=" -f 2)
FILENAME=$(find out/target/product/$DEVICE/PixelExtended*.zip | cut -d "/" -f 5)
ID=$(sha256sum out/target/product/$DEVICE/PixelExtended*.zip | cut -d " " -f 1)
FILEHASH=$(md5sum out/target/product/$DEVICE/PixelExtended*.zip | cut -d " " -f 1)
SIZE=$(wc -c out/target/product/$DEVICE/PixelExtended*.zip | awk '{print $1}')
URL="https://sourceforge.net/projects/pixelextended/files/$DEVICE/$FILENAME/download"
VERSION="11"
JSON_FMT='{\n"error":false,\n"filename": %s,\n"datetime": %s,\n"size":%s, \n"url":"%s", \n"filehash":"%s", \n"version": "%s", \n"id": "%s",\n"donate_url": "%s",\n"website_url":"%s",\n"news_url":"%s",\n"maintainer":"%s",\n"maintainer_url":"%s",\n"forum_url":"%s"\n}'
printf "$JSON_FMT" "$FILENAME" "$DATETIME" "$SIZE" "$URL" "$FILEHASH" "$VERSION" "$ID" > OTA/builds/$DEVICE.json
echo $ROMDIR/OTA/builds/$DEVICE.json file created

BUILD_DATE=$(echo $FILENAME | cut -d "-" -f 3)
BUILD_YEAR=${BUILD_DATE:0:4}
BUILD_MONTH=${BUILD_DATE:4:2}
BUILD_DAY=${BUILD_DATE:6:2}
CHANGELOG=$(echo "Changelog - $BUILD_YEAR/$BUILD_MONTH/$BUILD_DAY\n")
printf "$CHANGELOG" > $ROMDIR/OTA/changelogs/$DEVICE/$FILENAME.txt
echo $ROMDIR/OTA/changelogs/$DEVICE/$FILENAME.txt file created
