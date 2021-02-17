Read This Before Proceeding :-

Clone the OTA repo in your ROM directory.
To generate json and push OTA,
```bash
bash OTA/support/ota.sh <device_codename> <rom_folder> <maintainer_name> <maintainer_url> <forum_url>

e.g.
bash OTA/support/ota.sh wayne pex "Christian de la Cruz" https://t.me/chdelacr https://forum.xda-developers.com/
```
NOTES:
- ROM directory will look for *home/<os_username>/<rom_folder>*.
- Use double quotes for parameters with more than a single word, like maintainer name in the example above.
- All parameters are mandatory.
