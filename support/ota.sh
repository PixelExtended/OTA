DEVICE=$1
TG_USERNAME=$2
DEVICE_NAME=$3
XDA_THREAD=$4
GHUN=$5
NAME=$6

DATETIME=$(grep "org.pixelexperience.build_date_utc=" out/target/product/$DEVICE/system/build.prop | cut -d "=" -f 2)
FILENAME=$(find out/target/product/$DEVICE/PixelExtended*.zip | cut -d "/" -f 5)
ID=$(sha256sum out/target/product/$DEVICE/PixelExtended*.zip | cut -d " " -f 1)
FILEHASH=$(md5sum out/target/product/$DEVICE/PixelExtended*.zip | cut -d " " -f 1)
SIZE=$(wc -c out/target/product/$DEVICE/PixelExtended*.zip | awk '{print $1}')
URL="https://sourceforge.net/projects/pixelextended/files/$DEVICE/$FILENAME/download"
VERSION=$(grep "org.pixelexperience.version=" out/target/product/$DEVICE/system/build.prop | cut -d "=" -f 2)
STATUS="Active"
PEXV=$(grep "org.pex.version=" out/target/product/$DEVICE/system/build.prop | cut -d "=" -f 2)
DONATE_URL="https://heisinbug.tech/pay"
WEBSITE_URL="https://pixelextended.github.io/"
NEWS_URL="https://t.me/pexupdates"
JSON_FMT='{\n\t"error":false,\n\t"filename":"%s",\n\t"datetime":%s,\n\t"size":%s,\n\t"url":"%s",\n\t"filehash":"%s",\n\t"version":"%s",\n\t"status":"%s",\n\t"pexv":"%s",\n\t"id":"%s",\n\t"tg_username":"%s",\n\t"device_name":"%s",\n\t"device":"%s",\n\t"xda_thread":"%s",\n\t"maintainers": [{\n\t\t"main_maintainer":false,\n\t\t"github_username":"%s",\n\t\t"name":"%s"\n\t}],\n\t"donate_url":"%s",\n\t"website_url":"%s",\n\t"news_url":"%s",\n\t"forum_url":"%s"\n}'

printf "$JSON_FMT" "$FILENAME" "$DATETIME" "$SIZE" "$URL" "$FILEHASH" "$VERSION" "$STATUS" "$PEXV" "$ID" "$TG_USERNAME" "$DEVICE_NAME" "$DEVICE" "$XDA_THREAD" "$GHUN" "$NAME" "$DONATE_URL" "$WEBSITE_URL" "$NEWS_URL" "$XDA_THREAD" > OTA/builds/$DEVICE.json
echo OTA/builds/$DEVICE.json file created

BUILD_DATE=$(echo $FILENAME | cut -d "-" -f 3)
BUILD_YEAR=${BUILD_DATE:0:4}
BUILD_MONTH=${BUILD_DATE:4:2}
BUILD_DAY=${BUILD_DATE:6:2}
CHANGELOG=$(echo "Changelog - $BUILD_YEAR/$BUILD_MONTH/$BUILD_DAY\n")

if [ -d "OTA/changelogs/$DEVICE" ]
then
printf "$CHANGELOG" > OTA/changelogs/$DEVICE/$FILENAME.txt
echo OTA/changelogs/$DEVICE/$FILENAME.txt file created "(make sure to update the changelog file)"
else
mkdir -p OTA/changelogs/$DEVICE
printf "$CHANGELOG" > OTA/changelogs/$DEVICE/$FILENAME.txt
echo OTA/changelogs/$DEVICE/$FILENAME.txt file created "(make sure to update the changelog file)"
fi

