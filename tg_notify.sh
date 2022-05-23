DEVICE_JSON_URL="https://raw.githubusercontent.com/PixelExtended/OTA/snow"
DEVICE_CHANGELOG_URL="https://raw.githubusercontent.com/PixelExtended/OTA/snow/changelogs/"
CHANGED_FILE="$(git diff --name-only HEAD~1 | head -1)"

if ! [[ "${CHANGED_FILE}" =~ "json" ]]; then
    echo "Skipping since no json file was changed!"
    exit 0
fi

DEVICE="$(jq -r '.device' "${CHANGED_FILE}")"
STICKER="sticker.tgs"
PHOTO="banner.jpeg"
BUILD_DATE="$(date +'%d-%b-%Y' -d @$(jq .datetime ${CHANGED_FILE}))"
CHANGELOG="${DEVICE_CHANGELOG_URL}${DEVICE}/$(jq -r '.filename' "${CHANGED_FILE}")"
SFLINK="$(jq -r '.url' "${CHANGED_FILE}")"
DEVICE_NAME="$(jq -r '.device_name' "${CHANGED_FILE}")"
PEXV="$(jq -r '.pexv' "${CHANGED_FILE}")"
XDA="$(jq -r '.xda_thread' "${CHANGED_FILE}")"
USERNAME="$(jq -r '.tg_username' "${CHANGED_FILE}")"
DEVICE="$(jq -r '.device' "${CHANGED_FILE}")"
ROM="https://github.com/heisinbug/OTA/blob/snow/changelog.md"
DONATION="https://www.paypal.com/paypalme/aryan65"

         curl -X POST -F sticker=@"${STICKER}" https://api.telegram.org/bot"${TOKEN}"/sendSticker -F chat_id="${CHAT_ID}"

         curl -X POST -F photo=@"${PHOTO}" https://api.telegram.org/bot"${TOKEN}"/sendPhoto -F chat_id="${CHAT_ID}" -F parse_mode=HTML -F "caption=PixelExtended ${PEXV} OFFICIAL Update for ${DEVICE_NAME} is available
By : @${USERNAME}

Build Version : ${PEXV}
Build Date : ${BUILD_DATE}
Codename : ${DEVICE}

📥 Download : <a href='${SFLINK}'>SourceForge</a>
💬 XDA thread : <a href='${XDA}'>XDA</a>
📄 Changelog : <a href='${CHANGELOG}'>Device</a> | <a href='${ROM}'>ROM</a>

 Support : @pixelextended
 Channel : @pexupdates
 Site : pixelextended.ninja

Liked My Project <a href='${DONATION}'>Donate Here</a>

#PEX #${DEVICE}"
