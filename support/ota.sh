DEVICE=$1
ROMDIR=~/pex
cd $ROMDIR
DATETIME=$(grep "org.pixelexperience.build_date_utc=" out/target/product/$DEVICE/system/build.prop | cut -d "=" -f 2)
FILENAME=$(find out/target/product/$DEVICE/PixelExperience*.zip | cut -d "/" -f 5)
ID=$(md5sum out/target/product/$DEVICE/PixelExperience*.zip | cut -d " " -f 1)
FILEHASH=$ID
SIZE=$(wc -c out/target/product/$DEVICE/PixelExperience*.zip | awk '{print $1}')
URL1="https://sourceforge.net/projects/pixelextendedrom/files/$DEVICE/$FILENAME/download"
URL=$URL1
VERSION="10"
DONATE_URL="https://www.paypal.me/aryan65"
WEBSITE_URL="https://pixelex.ml/"
NEWS_URL="https:\/\/t.me\/pixelextended"
MAINTAINER=""
MAINTAINER_URL="https:\/\/t.me/"
FORUM_URL="XDA_THREAD"
JSON_FMT='{\n"error":false,\n"filename": %s,\n"datetime": %s,\n"size":%s, \n"url":"%s", \n"filehash":"%s", \n"version": "%s", \n"id": "%s",\n"donate_url": "%s",\n"website_url":"%s",\n"news_url":"%s",\n"maintainer":"%s",\n"maintainer_url":"%s",\n"forum_url":"%s"\n}'
printf "$JSON_FMT" "$FILENAME" "$DATETIME" "$SIZE" "$URL" "$FILEHASH" "$VERSION" "$ID" "$DONATE_URL" "$WEBSITE_URL" "$NEWS_URL" "$MAINTAINER" "$MAINTAINER_URL" "$FORUM_URL" > ~/ota/builds/$DEVICE.json
