# Authored By : @https://t.me/iamimmanuelraj

# Imports
import os
import sys
import subprocess
from os import path
import time

# Variables
tgname=os.environ.get('tgname')
codename=os.environ.get('codename')
device=os.environ.get('device')
xda=os.environ.get('xda')
ghun=os.environ.get('ghun')
name=os.environ.get('name')

#Uploading 
os.system("scp %s/PixelExtended*.zip aidanwarner@frs.sourceforge.net://home/frs/project/pixelextended/%s/"%(codename,codename))

# OTA/TG
os.system("bash OTA/support/ota-jenkins.sh '%s' '%s' '%s' '%s' '%s' '%s'"%(codename,tgname,device,xda,ghun,name))

# Open json for formatting
init = open("OTA/builds/%s.json"%(codename), "rt")
#output file to write the result to
fout = open("OTA/builds/%s_temp.json"%(codename), "wt")
#for each line in the input file
for line in init:
	#read replace the string and write to output file
	fout.write(line.replace('/', '\/'))
#close input and output files
os.system("rm -rf OTA/builds/%s.json"% (codename))
os.system("mv OTA/builds/%s_temp.json OTA/builds/%s.json"% (codename,codename))
init.close()
fout.close()
