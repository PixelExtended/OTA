# Authored By : @https://t.me/Immanuel_Raj

# Imports
import os
import sys
from os import path
import os.path
import time

# Banner
print ("")
print ("")
print ("")
print("""
█▀█ █ ▀▄▀ █▀▀ █░░ ▄▄ █▀▀ ▀▄▀ ▀█▀ █▀▀ █▄░█ █▀▄ █▀▀ █▀▄
█▀▀ █ █░█ ██▄ █▄▄ ░░ ██▄ █░█ ░█░ ██▄ █░▀█ █▄▀ ██▄ █▄▀""")
print ("")
print ("")
print ("")
print ("ONLY FOR OFFICIAL BUILDS/USE")
print ("")
print ("")
print ("")


# Variables
tgname=input("\nEnter Your telegram username [Without '@'] : ")
codename=input("\nEnter your device code name :- eg miatoll/laurel_sprout : ")
device=input("\nEnter your device full name :- eg Poco M2 Pro : ")
xda=input("\nEnter Your device's XDA post link : ")

# OTA/TG
os.system("bash OTA/support/ota.sh '%s' '%s' '%s' '%s'"%(codename,tgname,device,xda))
