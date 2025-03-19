#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
#
NC="\033[0m" # PENUTUP WARNA
# color validation 
wh="\e[1;37m" # PUTIH
ye="\e[1;33m" # KUNING
cy="\e[1;36m" # CYAN/BIRU MUDA
clear 
echo -e ""
echo -e "${ye} ┌─────────────────────────────┐${NC}"
echo -e "${ye} │${cy} .::::.  RESTART MENU  .::::.  ${NC}"
echo -e "${ye} └─────────────────────────────┘${NC}"
echo -e ""
echo -e "${ye} ┌─────────────────────────────┐${NC}"
echo -e "${ye} │ ${cy}•1)${NC} Restart All Services${NC}"
echo -e "${ye} │ ${cy}•2)${NC} Restart OpenSSH${NC}"
echo -e "${ye} │ ${cy}•3)${NC} Restart Dropbear${NC}"
echo -e "${ye} │ ${cy}•4)${NC} Restart Stunnel4${NC}"
echo -e "${ye} │ ${cy}•5)${NC} Restart OpenVPN${NC}"
echo -e "${ye} │ ${cy}•6)${NC} Restart Squid${NC}"
echo -e "${ye} │ ${cy}•7)${NC} Restart Nginx${NC}"
echo -e "${ye} │ ${cy}•8)${NC} Restart Badvpn${NC}"
echo -e "${ye} │ ${cy}•9)${NC} Restart Xray${NC}"
echo -e "${ye} │ ${cy}10)${NC} Restart Websocket${NC}"
echo -e "${ye} │ ${cy}11)${NC} Restart Trojan Go${NC}"
echo -e "${ye} │ ${cy}•0)${NC} Back To Menu${NC}"
echo -e "${ye} └─────────────────────────────┘${NC}"
echo -e ""
read -p " Select From Options [ 1 - 11 ] :   " Restart
echo -e ""
clear
case $Restart in
                1)
                clear
                echo -e ""
                echo -e "${ye} ┌─────────────────────────────┐${NC}"
                echo -e "${ye} │${cy} .::::.  RESTART MENU  .::::.  ${NC}"
                echo -e "${ye} └─────────────────────────────┘${NC}"
                echo -e ""
                echo -e "[ \033[1;32mInfo\033[0m ] Restart Begin"
                echo -e "loading......" | lolcat
                sleep 2
                /etc/init.d/ssh restart
                /etc/init.d/dropbear restart
                /etc/init.d/stunnel4 restart
                /etc/init.d/openvpn restart
                /etc/init.d/fail2ban restart
                /etc/init.d/cron restart
                /etc/init.d/nginx restart
                /etc/init.d/squid restart
                echo -e "[ \033[1;36mOK\033[0m ] Restarting xray (via systemctl) "
                systemctl restart xray
                systemctl restart xray.service
                echo -e "[ \033[1;36mOK\033[0m ] Restarting badvpn (via systemctl) "
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                echo -e "[ \033[1;36mOK\033[0m ] Restart Websocket (via systemctl) "
                systemctl restart sshws.service
                systemctl restart ws-dropbear.service
                systemctl restart ws-stunnel.service
                echo -e "[ \033[1;36mOK\033[0m ] Restart Trojan Go (via systemctl) "
                systemctl restart trojan-go.service 
                echo -e "[ \033[1;32mSUCCES\033[0m ] \e[1;36mRestarted All Service\033[0m"
                echo ""
                echo -e "\e[33m ──────────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restarts
                ;;
                2)
                clear
                echo -e ""
                echo -e "${ye} ┌─────────────────────────────┐${NC}"
                echo -e "${ye} │${cy} .::::.  RESTART MENU  .::::.  ${NC}"
                echo -e "${ye} └─────────────────────────────┘${NC}"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/ssh restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] SSH Service Restarted"
                echo ""
                echo -e "\e[33m ──────────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restarts
                ;;
                3)
                clear
                echo -e ""
                echo -e "${ye} ┌─────────────────────────────┐${NC}"
                echo -e "${ye} │${cy} .::::.  RESTART MENU  .::::.  ${NC}"
                echo -e "${ye} └─────────────────────────────┘${NC}"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/dropbear restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Dropbear Service Restarted"
                echo ""
                echo -e "\e[33m ──────────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restarts
                ;;
                4)
                clear
                echo -e ""
                echo -e "${ye} ┌─────────────────────────────┐${NC}"
                echo -e "${ye} │${cy} .::::.  RESTART MENU  .::::.  ${NC}"
                echo -e "${ye} └─────────────────────────────┘${NC}"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/stunnel4 restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Stunnel4 Service Restarted"
                echo ""
                echo -e "\e[33m ──────────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restarts
                ;;
                5)
                clear
                echo -e ""
                echo -e "${ye} ┌─────────────────────────────┐${NC}"
                echo -e "${ye} │${cy} .::::.  RESTART MENU  .::::.  ${NC}"
                echo -e "${ye} └─────────────────────────────┘${NC}"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/openvpn restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Openvpn Service Restarted"
                echo ""
                echo -e "\e[33m ──────────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restarts
                ;;
                6)
                clear
                echo -e ""
                echo -e "${ye} ┌─────────────────────────────┐${NC}"
                echo -e "${ye} │${cy} .::::.  RESTART MENU  .::::.  ${NC}"
                echo -e "${ye} └─────────────────────────────┘${NC}"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/squid restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Squid Service Restarted"
                echo ""
                echo -e "\e[33m ──────────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restarts
                ;;
                7)
                clear
                echo -e ""
                echo -e "${ye} ┌─────────────────────────────┐${NC}"
                echo -e "${ye} │${cy} .::::.  RESTART MENU  .::::.  ${NC}"
                echo -e "${ye} └─────────────────────────────┘${NC}"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/nginx restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Nginx Service Restarted"
                echo ""
                echo -e "\e[33m ──────────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restarts
                ;;
                8)
                clear
                echo -e ""
                echo -e "${ye} ┌─────────────────────────────┐${NC}"
                echo -e "${ye} │${cy} .::::.  RESTART MENU  .::::.  ${NC}"
                echo -e "${ye} └─────────────────────────────┘${NC}"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting badvpn Service (via systemctl) "
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Badvpn Service Restarted"
                echo ""
                echo -e "\e[33m ──────────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restarts
                ;;
                9)
                clear
                echo -e ""
                echo -e "${ye} ┌─────────────────────────────┐${NC}"
                echo -e "${ye} │${cy} .::::.  RESTART MENU  .::::.  ${NC}"
                echo -e "${ye} └─────────────────────────────┘${NC}"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting xray Service (via systemctl) "
                systemctl restart xray
                systemctl restart xray.service
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] XRAY Service Restarted"
                echo ""
                echo -e "\e[33m ──────────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restarts
                ;;
                10)
                clear
                echo -e ""
                echo -e "${ye} ┌─────────────────────────────┐${NC}"
                echo -e "${ye} │${cy} .::::.  RESTART MENU  .::::.  ${NC}"
                echo -e "${ye} └─────────────────────────────┘${NC}"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting websocket Service (via systemctl) "
                sleep 0.5
                systemctl restart sshws.service
                systemctl restart ws-dropbear.service
                systemctl restart ws-stunnel.service
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] WEBSOCKET Service Restarted"
                echo ""
                echo -e "\e[33m ──────────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restarts
                ;;
                11)
                clear
                echo -e "${ye} ┌─────────────────────────────┐${NC}"
                echo -e "${ye} │${cy} .::::.  RESTART MENU  .::::.  ${NC}"
                echo -e "${ye} └─────────────────────────────┘${NC}"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting Trojan Go Service (via systemctl) "
                sleep 0.5
                systemctl restart trojan-go.service
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Trojan Go Service Restarted"
                echo ""
                echo -e "\e[33m ──────────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restarts
                ;;                                                                         
                0)
                menu
                exit
                ;;
                x)
                clear
                exit
                ;;
                *) echo -e "" ; echo "salah tekan" ; sleep 1 ; restart ;;               
        esac
