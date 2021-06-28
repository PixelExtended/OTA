DEVICE=$1
TG_USERNAME=$2
DEVICE_NAME=$3
XDA_THREAD=$4

DATETIME=$(grep "org.pixelexperience.build_date_utc=" out/target/product/$DEVICE/system/build.prop | cut -d "=" -f 2)
FILENAME=$(find out/target/product/$DEVICE/PixelExtended*.zip | cut -d "/" -f 5)
ID=$(sha256sum out/target/product/$DEVICE/PixelExtended*.zip | cut -d " " -f 1)
FILEHASH=$(md5sum out/target/product/$DEVICE/PixelExtended*.zip | cut -d " " -f 1)
SIZE=$(wc -c out/target/product/$DEVICE/PixelExtended*.zip | awk '{print $1}')
URL="https://sourceforge.net/projects/pixelextended/files/$DEVICE/$FILENAME/download"
VERSION="11"
JSON_FMT='{\n"error":false,\n"filename": "%s",\n"datetime": %s,\n"size":%s, \n"url":"%s", \n"filehash":"%s", \n"version": "%s", \n"id": "%s", \n"tg_username": "%s", \n"device_name":"%s", \n"device":"%s", \n"xda_thread":"%s"\n}'

printf "$JSON_FMT" "$FILENAME" "$DATETIME" "$SIZE" "$URL" "$FILEHASH" "$VERSION" "$ID" "$TG_USERNAME" "$DEVICE_NAME" "$DEVICE" "$XDA_THREAD" > OTA/builds/$DEVICE.json
echo OTA/builds/$DEVICE.json file created

BUILD_DATE=$(echo $FILENAME | cut -d "-" -f 3)
BUILD_YEAR=${BUILD_DATE:0:4}
BUILD_MONTH=${BUILD_DATE:4:2}
BUILD_DAY=${BUILD_DATE:6:2}
CHANGELOG=$(echo "Changelog - $BUILD_YEAR/$BUILD_MONTH/$BUILD_DAY\n")

printf "$CHANGELOG" > OTA/changelogs/$DEVICE/$FILENAME.txt
echo OTA/changelogs/$DEVICE/$FILENAME.txt file created "(make sure to update the changelog file)"
