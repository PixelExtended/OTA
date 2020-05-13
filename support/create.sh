ROMDIR=~/pe
cd $ROMDIR
DATETIME=$(grep "org.pixelexperience.build_date_utc=" out/target/product/jasmine_sprout/system/build.prop | cut -d "=" -f 2)
FILENAME=$(find out/target/product/jasmine_sprout/PixelExperience*.zip | cut -d "/" -f 5)
ID=$(md5sum out/target/product/jasmine_sprout/PixelExperience*.zip | cut -d " " -f 1)
FILEHASH=$ID
SIZE=$(wc -c out/target/product/jasmine_sprout/PixelExperience*.zip | awk '{print $1}')
URL1="https://sourceforge.net/projects/private-dir/files/PixelExperience-Fan_Edition/Decrypted/$FILENAME/download"
URL=$URL1
VERSION="10"
DONATE_URL="https://www.paypal.me/aryan65"
WEBSITE_URL="https://sourceforge.net/projects/private-dir/files/PixelExperience-Fan_Edition/Decrypted/"
NEWS_URL="https:\/\/t.me\/pixeljasmine"
MAINTAINER="Aryan Gupta"
MAINTAINER_URL="https:\/\/t.me/boozabooza"
FORUM_URL="#"
JSON_FMT='{\n"error":false,\n"filename": %s,\n"datetime": %s,\n"size":%s, \n"url":"%s", \n"filehash":"%s", \n"version": "%s", \n"id": "%s",\n"donate_url": "%s",\n"website_url":"%s",\n"news_url":"%s",\n"maintainer":"%s",\n"maintainer_url":"%s",\n"forum_url":"%s"\n}'
printf "$JSON_FMT" "$FILENAME" "$DATETIME" "$SIZE" "$URL" "$FILEHASH" "$VERSION" "$ID" "$DONATE_URL" "$WEBSITE_URL" "$NEWS_URL" "$MAINTAINER" "$MAINTAINER_URL" "$FORUM_URL" > ~/OTA/builds/jasmine_sprout.json
