#!/bin/bash

if [ $EUID != 0 ]
then
	printf "Must run as root!\n"
	exit 1
fi

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

"""

function kali-rolling(){
	printf "[+] Using Kali rolling.\n"
	if [ -w /etc/apt/sources.list ]
	then
		printf "[+] Updating repos, please wait..\n"
		cat <<-EOF > /etc/apt/sources.list
		deb http://http.kali.org/kali kali-rolling main contrib non-free
		# For source package access, uncomment the following line
		# deb-src http://http.kali.org/kali kali-rolling main contrib non-free
		EOF
	fi
}
function kali-sana(){
	printf "[+] Using Kali Sana.\n"
	if [ -w /etc/apt/sources.list ]
	then
		printf "[+] Updating repos, please wait..\n"
		cat <<-EOF > /etc/apt/sources.list
		deb http://old.kali.org/kali sana main non-free contrib
		# For source package access, uncomment the following line
		# deb-src http://old.kali.org/kali sana main non-free contrib
		EOF
	fi
}
function kali-moto(){
	printf "[+] Using Kali Moto.\n"
	if [ -w /etc/apt/sources.list ]
	then
		printf "[+] Updating repos, please wait..\n"
		cat <<-EOF > /etc/apt/sources.list
		deb http://old.kali.org/kali moto main non-free contrib
		# For source package access, uncomment the following line
		# deb-src http://old.kali.org/kali moto main non-free contrib
		EOF
	fi
}

function fixit(){
	printf "[+] Cleaning the local repository of retrieved package files..\n"
	apt-get clean
	printf "[+] Fixing the errors..\n"
	apt-get -f install
}
	
VERSION=$(grep VERSION_ID /etc/os-release | cut -d '"' -f2)

if [[ $VERSION == 1.[0-9] ]]
then
	kali-moto
	fixit
elif [[ $VERSION == 2.[0-9] ]]
then
	kali-sana
	fixit
elif [[ $VERSION == 201[0-9].[0-9] ]]
then
	kali-rolling
	fixit
fi
