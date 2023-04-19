# Authored By : @https://t.me/iamimmanuelraj

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
tgname=os.environ.get('tgname')
codename=os.environ.get('codename')
device=os.environ.get('device')
xda=os.environ.get('xda')
ghun=os.environ.get('ghun')
name=os.environ.get('name')

print ("These Inputs are For SourceForge Uploading, you will be asked password just after your sourceforge username")
sf="aidanwarner"

# Sf Uploading 
os.system("scp out/target/product/%s/PixelExtended*.zip %s@frs.sourceforge.net://home/frs/project/pixelextended/%s/"%(codename,sf,codename))

# OTA/TG
os.system("bash OTA/support/ota.sh '%s' '%s' '%s' '%s' '%s' '%s'"%(codename,tgname,device,xda,ghun,name))

# Open json for formatting
init = open("OTA/builds/%s.json"%(codename), "rt")
#output file to write the result to
fout = open("OTA/builds/%s_temp.json"%(codename), "wt")
#for each line in the input file
for line in init:
	#read replace the string and write to output file
	fout.write(line.replace('/', '\/'))
#close input and output files
os.system("rm -rf  OTA/builds/%s.json"% (codename))
os.system("mv OTA/builds/%s_temp.json OTA/builds/%s.json"% (codename,codename))
init.close()
fout.close()
