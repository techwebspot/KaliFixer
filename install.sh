#!/bin/bash

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

                                         ___           _        _ _           
                                        |_ _|_ __  ___| |_ __ _| | | ___ _ __ 
                                         | || '_ \/ __| __/ \` | | |/ _ \ '__|
                                         | || | | \__ \ || (_| | | |  __/ |   
                                        |___|_| |_|___/\__\__,_|_|_|\___|_|   
"""
                                     
if [ $EUID != 0 ]
then
	echo "------------------------------------------------------------------------------------"
	echo "                                  Run as a root                                     "
	echo "------------------------------------------------------------------------------------"
	exit 1
fi

echo -e "Installing the script...\n"

cp KaliFixer /usr/local/bin/KaliFixer

echo -e "Copying the main file to system directory...\n"

cd /usr/local/bin/ && chmod +x KaliFixer

echo -e "Giving the permission to tool...\n"

echo -e "Script Installed successfully\n"

echo -e "Write command 'KaliFixer' in terminal from any directory to start the script :)\n"
