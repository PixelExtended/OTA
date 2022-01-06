# Authored By : @https://t.me/Immanuel_Raj

# Imports
import os
import sys
import subprocess
from os import path
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
print ("ONLY FOR OFFICIAL BUILDS/USE , The whole Process can take 5-10 mins.")
print ("")
print ("")
print ("")


# Variables
tgname=input("\nEnter Your telegram username [Without '@'] : ")
codename=input("\nEnter your device code name :- eg miatoll/laurel_sprout : ")
device=input("\nEnter your device full name :- eg Poco M2 Pro : ")
xda=input("\nEnter Your device's XDA post link : ")

print ("These Inputs are For SourceForge Uploading, you will be asked password just after your sourceforge username")
sf=input("Enter Your SourceForge Username ")

# Sf Uploading 
os.system("scp out/target/product/%s/PixelExtended*.zip %s@frs.sourceforge.net://home/frs/project/pixelextended/%s/"%(codename,sf,codename))

# OTA/TG
os.system("bash OTA/support/ota.sh '%s' '%s' '%s' '%s'"%(codename,tgname,device,xda))
