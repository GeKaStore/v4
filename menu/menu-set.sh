#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
clear        
        # color text 
        yelow="\e[1;33m"
        NC="\033[0m"
        cyan="\e[1;36m"

clear    
echo -e ""
echo -e "\e[33m ┌──────────────────────────────────┐\033[0m"
echo -e "\e[33m │${cyan}  .::::.  SYSTEM SETING  .::::.  \033[0m"
echo -e "\e[33m └──────────────────────────────────┘\033[0m"
echo -e "\e[33m ┌──────────────────────────────────┐\033[0m"
echo -e "\e[33m │ ${cyan}[•1]${NC} Update Autosctipt\033[0m"
echo -e "\e[33m │ ${cyan}[•2]${NC} Install bot admin tele\033[0m"
echo -e "\e[33m │ ${cyan}[•3]${NC} Seting bot admin tele\033[0m"
echo -e "\e[33m │ ${cyan}[•4]${NC} Auto Backup data server\033[0m"
echo -e "\e[33m │ ${cyan}[•5]${NC} Backup data server\033[0m"
echo -e "\e[33m │ ${cyan}[•6]${NC} Restore data server\033[0m"
echo -e "\e[33m │ ${cyan}[•7]${NC} Chnge Domain server\033[0m"
echo -e "\e[33m │ ${cyan}[•8]${NC} Chnge banner server\033[0m"
echo -e "\e[33m │ ${cyan}[•9]${NC} Restart all service\033[0m"
echo -e "\e[33m │ ${cyan}[10]${NC} Bandwith information\033[0m"
echo -e "\e[33m │ ${cyan}[11]${NC} Chnge auto reboot\033[0m"
echo -e "\e[33m │ ${cyan}[12]${NC} Speedtest server\033[0m"
echo -e "\e[33m │ ${cyan}[13]${NC} Clear Log all service\033[0m"
echo -e "\e[33m │ ${cyan}[14]${NC} Reboot server\033[0m"
echo -e "\e[33m │ ${cyan}[•0]${NC} Back To Menu\033[0m"
echo -e "\e[33m └──────────────────────────────────┘\033[0m"
echo -e ""
read -p " Select From Options [ 1 - 14 ] : "  opt
echo -e ""
case $opt in
1) clear ; rm -rf /root/update.sh && wget https://raw.githubusercontent.com/GeKaStore/v4/main/ssh/update.sh && chmod +x update.sh && ./update.sh ;;
2) clear ; wget https://raw.githubusercontent.com/GeKaStore/v4/main/xray/xroy.sh && chmod +x xroy.sh && ./xroy.sh ;;
3) clear ; bot ;;
4) clear ; autobackup ;;
5) clear ; backup ; exit ;;
6) clear ; restore ; exit ;;
7) clear ; add-host ; exit ;;
8) clear ; nano /etc/issue.net ; exit ;;  #ssh-vpn banner.conf
9) clear ; restarts ; exit ;;
10) clear ; bw ; exit ;;
11) clear ; auto-reboot ; exit ;;
12) clear ; speedtest ; exit ;;
13) clear ; clearcache ; exit ;;
14) clear ; reboot ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "salah tekan" ; sleep 1 ; menu-set ;;
esac
