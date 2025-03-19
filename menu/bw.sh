#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
clear 
echo -e ""
echo -e "\e[33m ┌────────────────────────────────────┐\033[0m"
echo -e "\e[33m │\e[36m   .::::.  INFO BANDWITH  .::::.  \033[0m"
echo -e "\e[33m └────────────────────────────────────┘\033[0m"
echo -e ""
echo -e "\e[33m ┌────────────────────────────────────┐\033[0m"
echo -e "\e[33m │ [\e[36m•1\e[0m] Lihat Total Bandwith Tersisa"
echo -e "\e[33m │ [\e[36m•2\e[0m] Penggunaan Setiap 5 Menit"
echo -e "\e[33m │ [\e[36m•3\e[0m] Penggunaan Setiap Jam"
echo -e "\e[33m │ [\e[36m•4\e[0m] Penggunaan Setiap Hari"
echo -e "\e[33m │ [\e[36m•5\e[0m] Penggunaan Setiap Bulan"
echo -e "\e[33m │ [\e[36m•6\e[0m] Penggunaan Setiap Tahun"
echo -e "\e[33m │ [\e[36m•7\e[0m] Penggunaan Tertinggi"
echo -e "\e[33m │ [\e[36m•0\e[0m] BACK TO MENU\033[0m"
echo -e "\e[33m └────────────────────────────────────┘\033[0m"
echo -e ""
read -p " Select From Options [ 1 - 7 ] :   " opt
echo -e ""
case $opt in
1)
clear 
echo -e ""
echo -e "\e[33m ┌─────────────────────────────────────────────────────────────┐\033[0m"
echo -e "\e[33m │\e[36m         .::::.  BANDWITH TERSISA  .::::.  \033[0m"
echo -e "\e[33m └─────────────────────────────────────────────────────────────┘\033[0m"
echo -e ""

vnstat

echo -e ""
echo -e "\e[33m ───────────────────────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Kembali ke menu tekan enter"
bw
;;

2)
clear 
echo -e ""
echo -e "\e[33m ┌─────────────────────────────────────────────────────────────┐\033[0m"
echo -e "\e[33m │\e[36m .::::.  BANDWITH SETIAP 5 MENIT  .::::.  \033[0m"
echo -e "\e[33m └─────────────────────────────────────────────────────────────┘\033[0m"
echo -e ""

vnstat -5

echo -e ""
echo -e "\e[33m ───────────────────────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Kembali ke menu tekan enter"
bw
;;

3)
clear 
echo -e ""
echo -e "\e[33m ┌─────────────────────────────────────────────────────────────┐\033[0m"
echo -e "\e[33m │\e[36m       .::::.  BANDWITH SETIAP JAM  .::::.  \033[0m"
echo -e "\e[33m └─────────────────────────────────────────────────────────────┘\033[0m"
echo -e ""

vnstat -h

echo -e ""
echo -e "\e[33m ───────────────────────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Kembali ke menu tekan enter"
bw
;;

4)
clear 
echo -e ""
echo -e "\e[33m ┌─────────────────────────────────────────────────────────────┐\033[0m"
echo -e "\e[33m │\e[36m      .::::.  BANDWITH SETIAP HARI  .::::.  \033[0m"
echo -e "\e[33m └─────────────────────────────────────────────────────────────┘\033[0m"
echo -e ""

vnstat -d

echo -e ""
echo -e "\e[33m ───────────────────────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Kembali ke menu tekan enter"
bw
;;

5)
clear 
echo -e ""
echo -e "\e[33m ┌─────────────────────────────────────────────────────────────┐\033[0m"
echo -e "\e[33m │\e[36m      .::::.  BANDWITH SETIAP BULAN  .::::.  \033[0m"
echo -e "\e[33m └─────────────────────────────────────────────────────────────┘\033[0m"
echo -e ""

vnstat -m

echo -e ""
echo -e "\e[33m ───────────────────────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Kembali ke menu tekan enter"
bw
;;

6)
clear 
echo -e ""
echo -e "\e[33m ┌─────────────────────────────────────────────────────────────┐\033[0m"
echo -e "\e[33m │\e[36m      .::::.  BANDWITH SETIAP TAHUN  .::::.  \033[0m"
echo -e "\e[33m └─────────────────────────────────────────────────────────────┘\033[0m"
echo -e ""

vnstat -y

echo -e ""
echo -e "\e[33m ───────────────────────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Kembali ke menu tekan enter"
bw
;;

7)
clear 
echo -e ""
echo -e "\e[33m ┌─────────────────────────────────────────────────────────────┐\033[0m"
echo -e "\e[33m │\e[36m       .::::.  BANDWITH TERTINGGI  .::::.  \033[0m"
echo -e "\e[33m └─────────────────────────────────────────────────────────────┘\033[0m"
echo -e ""

vnstat -t

echo -e ""
echo -e "\e[33m ───────────────────────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Kembali ke menu tekan enter"
bw
;;


0)
sleep 1
menu
;;
x)
exit
;;
*)
echo -e ""
echo -e "Anda salah tekan"
sleep 1
bw
;;
esac
