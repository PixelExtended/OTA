##Variables
PayPal="https://www.paypal.com/paypalme/aryan65"
UPI="https://heisinbug.github.io/pay/"

# Format post
read -r -d '' msg <<EOF
<b>Experience the "True Pixel Experience" with us and help sustain it through your generous donation! 🌟💖📱✨</b>

<b>For International/PayPal Users</b>: <a href='${PayPal}'>Click Here</a>
<b>For Indian Users</b>: <a href='${UPI}'>Click Here</a>

EOF

#Make a nice post and send it to TG channel
curl -s -X POST "https://api.telegram.org/bot${TOKEN}/sendPhoto" \
    -F chat_id="${CHAT_ID}" \
    -F photo="@support/Donate/Donate.jpg" \
    -F "caption=Optional caption text"

curl -s -X POST "https://api.telegram.org/bot${TOKEN}/sendMessage" \
    -d chat_id="${CHAT_ID}" \
    -d "disable_web_page_preview=true" \
    -d "parse_mode=HTML" \
    -d text="$msg"