#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
clear
echo ""
echo ""
echo -e "[ \033[32mInfo\033[0m ] Clear Log all service"
echo 1 > /proc/sys/vm/drop_caches
sleep 3
echo -e "[ \033[32mok\033[0m ] Log service cleared finish "
echo ""
echo "Back to menu in "
menu
