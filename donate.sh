##Variables
LINK="https://www.paypal.com/paypalme/aryan65"
INLINK="https://heisinbug.tech/pay"

# Run Maintainers Script too
python  support/maintainers.py

# Format post
read -r -d '' msg <<EOF
<b> Liked Our Worked on delivering a usable PE to you XD , then buy us some beer by donating </b>

<b>For International/PayPal Users</b>: <a href='${LINK}'>Click Here</a>
<b>For Indian Users</b>: <a href='${INLINK}'>Click Here</a>

EOF

#Make a nice post and send it to TG channel
curl -s -X POST "https://api.telegram.org/bot${TOKEN}/sendMessage" \
    -d chat_id="${CHAT_ID}" \
    -d "disable_web_page_preview=true" \
    -d "parse_mode=HTML" \
    -d text="$msg"
