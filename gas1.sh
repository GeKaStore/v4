#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
RED="\033[0;31m" 

BURIQ () {
    curl -sS https://raw.githubusercontent.com/GeKaStore/vps_access/main/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/GeKaStore/vps_access/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/GeKaStore/vps_access/main/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
        # background validation

        green_background="\033[42;37m"

        red_background="\033[41;37m"

        # color text 

        yelow="\e[1;33m"

        NC="\033[0m"

        cyan="\e[1;36m"

        white="\e[1;37m"

        purple='\033[0;35m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
MYIP=$(wget -qO- ipinfo.io/ip);
clear
clear
echo -e " $COLOR1┌─────────────────────────────────────────┐${NC}"
echo -e " $COLOR1│$NC   \e[33m     • SSH OVPN MENU •       ${NC}"
echo -e " $COLOR1└─────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌─────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 │$NC   \e[33m[1]  • CREATE SSH ACCOUNT ${NC}"
echo -e "$COLOR1 │$NC   \e[33m[2]  • TRIAL SSH ACCOUNT         ${NC}"
echo -e "$COLOR1 │$NC   \e[33m[3]  • RENEW SSH ACCOUNT         ${NC}"
echo -e "$COLOR1 │$NC   \e[33m[4]  • DELETE SSH ACCOUNT        ${NC}"
echo -e "$COLOR1 │$NC   \e[33m[5]  • CHECK LOGIN SSH ACCOUNT   ${NC}"
echo -e "$COLOR1 │$NC   \e[33m[6]  • MEMBER SSH ACCOUNT         ${NC}"
echo -e "$COLOR1 │$NC   \e[33m[7]  • DELETE USER EXP ACCOUNT   ${NC}"
echo -e "$COLOR1 │$NC   \e[33m[8]  • LOCK SSH ACCOUNT           ${NC}"
echo -e "$COLOR1 │$NC   \e[33m[9]  • UNLOCK SSH ACCOUNT        ${NC}"
echo -e "$COLOR1 │$NC   \e[37m[0]  • BACK TO MENU       ${NC}"
echo -e " $COLOR1└──────────────────────────────────────────┘${NC}"
echo -e ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
1) clear ; usernew ; exit ;;
2) clear ; trial ; exit ;;
3) clear ; renew ; exit ;;
4) clear ; hapus ; exit ;;
5) clear ; cek ; exit ;;
6) clear ; member ; exit ;;
7) clear ; delete ; exit ;;
8) clear ; usr-lock ; exit ;;
9) clear ; user-unlock ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "Salah tekan" ; menu-ssh ;;
esac
