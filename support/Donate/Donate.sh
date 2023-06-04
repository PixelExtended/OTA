##Variables
PayPal="https://www.paypal.com/paypalme/aryan65"
UPI="https://heisinbug.github.io/pay/"

#Make a nice post and send it to TG channel
curl -X POST -F sticker=@"sticker.tgs" https://api.telegram.org/bot"${TOKEN}"/sendSticker -F chat_id="${CHAT_ID}"

curl -s -X POST "https://api.telegram.org/bot${TOKEN}/sendPhoto" \
    -F chat_id="${CHAT_ID}" \
    -F photo="@support/Donate/Donate.jpg" \
    -F "parse_mode=HTML" \
    -F "disable_web_page_preview=true" \
    -F "reply_markup={\"inline_keyboard\":[[{\"text\":\"PayPal (International)\",\"url\":\"${PayPal}\"}],[{\"text\":\"UPI (India)\",\"url\":\"${UPI}\"}]]}" \
    -F "caption= <b>Experience the 'True Pixel Experience' with us and help sustain it through your generous donation! 🌟💖📱✨</b>"