Do Read This Before Proceeding :-

Clone the OTA repo. To generate json and push ota:
```bash
bash support/ota.sh <device_codename> <maintainer_name> <maintainer_url> <forum_url>

e.g.
bash support/ota.sh wayne "Christian de la Cruz" https://t.me/chdelacr https://forum.xda-developers.com/
```
NOTES:
- Make sure to update **ROMDIR** and **OTADIR** in the OTA script as needed.
- Add doble quotes for parameters with multiple words.
- *<forum_url>* parameter is optional.
- Latest changelog will be copied to the respective device folder.