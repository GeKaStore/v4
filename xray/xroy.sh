#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
NC='\e[0m'
echo "OTW install bot Vps"
echo "waiting......."
echo "Progress..."
sleep 3
#install bot TELEGRAM
cd /usr/bin 
wget -O bot "https://raw.githubusercontent.com/GeKaStore/v4/main/bot221" && chmod +x /usr/bin/bot

cd
clear
sleep 3
clear
read -n 1 -s -r -p "Press any key to back on menu"

menu
