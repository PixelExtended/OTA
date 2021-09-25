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

# Get build file last modified date
bf_path = "OTA/builds/" + codename + ".json"
obf_date = os.path.getmtime(bf_path)

# OTA/TG
os.system("bash OTA/support/ota.sh '%s' '%s' '%s' '%s'"%(codename,tgname,device,xda))

# Get build file new last modified date
nbf_date = os.path.getmtime(bf_path)

# Compare new file vs old file last modified date
if nbf_date > obf_date:
    m_file = open("OTA/support/maintainer.md", "r")

    row = 0
    while True:    
        line = m_file.readline()

        if codename in line:
            if line[-2] == "✅":
                print("\nMaintainers file already updated with latest release (" + bf_path + " in line " + str(row + 1) + "):\n")
                print(line)
                break
            else:
                print("\nUpdating maintainers file with latest release (" + bf_path + " in line " + str(row + 1) + "):\n")
                new_line = line.replace(line[-2], "✅")

                # Replace entire line with green check
                m_file = open("OTA/support/maintainer.md", "r")
                mf_lines = m_file.readlines()
                mf_lines[row] = new_line
                print(mf_lines[row])
                m_file = open("OTA/support/maintainer.md", "w")
                m_file.writelines(mf_lines)
                m_file.close()
                break
        
        row += 1
else:
    print("No modifications were made to build file. Please make sure the entered info is correct.")
