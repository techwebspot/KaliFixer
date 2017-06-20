#! /usr/bin/bash

function The_Kali_Rolling_Repository() {
    python3 - <<END

from bs4 import BeautifulSoup
import urllib.request
import urllib.parse

kaliwebsite = "https://paste.ubuntu.com/24907580/"

with urllib.request.urlopen(kaliwebsite) as html:
    resp = html.read()

bt = BeautifulSoup(resp, 'html.parser')

s = bt.pre.next.next.next.string

try:
    with open("/etc/apt/sources.list", "w") as file:
        file.write(s)
except Exception as ex:
    print(ex)
    print("[!] Run Script as a root user to upgrade repos and fix the error of package")
END
}

function Retired_Kali_sana_2_0_Repositories {
    python3 - <<END

from bs4 import BeautifulSoup
import urllib.request
import urllib.parse

kaliwebsite = "https://paste.ubuntu.com/24907595/"

with urllib.request.urlopen(kaliwebsite) as html:
    resp = html.read()

bt = BeautifulSoup(resp, 'html.parser')

s = bt.pre.next.next.next.string

try:
    with open("/etc/apt/sources.list", "w") as file:
        file.write(s)
except Exception as ex:
    print(ex)
    print("[!] Run Script as a root user to upgrade repos and fix the error of package")
END
}

function Retired_Kali_moto_1_0_Repositories {
    python3 - <<END

from bs4 import BeautifulSoup
import urllib.request
import urllib.parse

kaliwebsite = "https://paste.ubuntu.com/24907611/"

with urllib.request.urlopen(kaliwebsite) as html:
    resp = html.read()

bt = BeautifulSoup(resp, 'html.parser')

s = bt.pre.next.next.next.string

try:
    with open("/etc/apt/sources.list", "w") as file:
        file.write(s)
except Exception as ex:
    print(ex)
    print("[!] Run Script as a root user to upgrade repos and fix the error of package")
END
}

echo """
+---------------------------------------------------------------------------------+
|                            Author:- Techwebspot                                 |
+---------------------------------------------------------------------------------+
                       _  __     _ _                         
                      | |/ /    | (_)                     
                      | ' / __ _| |_|     
                      |  < / _\` | | |
                      | . \ (_| | | | 
                      |_|\_\__,_|_|_|   _____             
                                       / __(_)_ _____ ____
                                      / _// /\ \ / -_) __/
                                     /_/ /_//_\_\\__/_/   
    -------------------------------------------------------------------------
     Note:- Run Script with root user for update repos and fix package error
    -------------------------------------------------------------------------
"""

echo "Choose your Kali Linux version from below index number:-"
echo "1. The Kali Rolling"
echo "2. Retired Kali sana (2.0)"
echo "3. Retired Kali moto (1.0)"
echo "Press Enter if you don't know which option you want to select"

read -p "Enter your choice [1-3] " index

if [ "$index" = "1" ] || [ "$index" = "" ]
then
    sudo rm -r /etc/apt/sources.list &> /dev/null
    The_Kali_Rolling_Repository
    echo "[+] Updating repos please wait..."
    sudo apt-get clean 
    echo "[+] Cleaning the local repository of retrieved package files..."
    sudo apt-get -f install
    echo "[+] Fixing the errors..."
    
elif [ $index -eq 2 ]
then
    sudo rm -r /etc/apt/sources.list &> /dev/null 
    Retired_Kali_sana_2_0_Repositories
    echo "[+] Updating repos please wait..."
    sudo apt-get clean
    echo "[+] Cleaning the local repository of retrieved package files..."
    sudo apt-get -f install
    echo "[+] Fixing the errors..."
    
elif [ $index -eq 3 ]
then
    sudo rm -r /etc/apt/sources.list &> /dev/null 
    Retired_Kali_moto_1_0_Repositories
    echo "[+] Updating repos please wait..."
    sudo apt-get clean
    echo "[+] Cleaning the local repository of retrieved package files..."
    sudo apt-get -f install
    echo "[+] Fixing the errors..."
 
else
    echo "[!] You entered an wrong input try again..."
fi

file="/etc/apt/sources.list"
if [ -f "$file" ]
then
echo "[+] Repos updated successfully"
else
    echo "[-] Repos not updated successfully if you not run script with root user then run script again with root power"
fi
