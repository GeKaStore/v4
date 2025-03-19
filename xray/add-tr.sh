#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

clear
source /var/lib/SIJA/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
TIMES="10"
CHATID=$(cat /etc/id)
KEY=$(cat /etc/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"

tr="$(cat ~/log-install.txt | grep -w "Trojan WS " | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
echo -e " $COLOR1┌─────────────────────────────────────────┐${NC}"
echo -e " $COLOR1│$NC   \e[33m     • ADD TROJAN ACOUNT •       ${NC}"
echo -e " $COLOR1└─────────────────────────────────────────┘${NC}"
echo -e ""
		read -rp "  User: " -e user
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
clear
echo -e " $COLOR1┌─────────────────────────────────────────┐${NC}"
echo -e " $COLOR1│$NC   \e[33m     • ADD TROJAN ACOUNT •       ${NC}"
echo -e " $COLOR1└─────────────────────────────────────────┘${NC}"
			echo ""
			echo "  A client with the specified name was already created, please choose another name."
			echo ""
			echo -e "\e[33m─────────────────────────────────────\033[0m"
			read -n 1 -s -r -p "Press any key to back on menu"
			menu-trojan
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

systemctl restart xray
trojanlink1="trojan://${uuid}@${domain}:${tr}?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@isi_bug_disini:${tr}?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
clear

trojan1="$(echo $trojanlink1 | base64 -w 0)"
trojan2="$(echo $trojanlink | base64 -w 0)"

TEXT="
<code>════════════════════════════════════</code>
<code>           🔰 XRAY TROJAN 🔰              </code>
<code>════════════════════════════════════</code>
<code>➣Remarks  : </code> <code>${user}</code>
<code>➣Domain   : </code> <code>${domain}</code>
<code>➣Port TLS : </code> <code>${tr}</code>
<code>➣Port GRPC: </code> <code>443</code>
<code>➣User ID  : </code> <code>${uuid}</code>
<code>➣AlterId  : 0</code>
<code>➣Security : auto</code>
<code>➣Network  : WS or gRPC</code>
<code>➣Path WS  : </code> <code>/trojan-ws</code>
<code>➣Path GRPC: </code> <code>/trojan-grpc</code>
<code>════════════════════════════════════</code>
<code>➣ Link TLS  :</code> 
<code>${trojanlink}</code>
<code>════════════════════════════════════</code>
<code>➣ Link GRPC :</code> 
<code>${trojanlink1}</code>
<code>════════════════════════════════════</code>
<code>📅Expired On : $exp</code>
🌏@WuzzSTORE
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

clear
echo -e "\e[33m════════════════════════════════${NC}"
echo -e "\e[37m       🔰 XRAY TROJAN 🔰     ${NC}"
echo -e "\e[33m════════════════════════════════${NC}"
echo -e "Remarks     : ${user}" 
echo -e "Expired On  : $exp" 
echo -e "Host/IP     : ${domain}" 
echo -e "Port        : ${tr}" 
echo -e "Key         : ${uuid}" 
echo -e "Path        : /trojan-ws"
echo -e "Path WSS    : wss://yourbug/trojan-ws" 
echo -e "ServiceName : trojan-grpc" 
echo -e "\e[33m════════════════════════════════${NC}"
echo -e "Link WS : "
echo -e "${trojanlink}" 
echo -e "\e[33m════════════════════════════════${NC}"
echo -e "Link GRPC : "
echo -e "${trojanlink1}"
echo -e "\e[33m════════════════════════════════${NC}"
echo -e "\e[37m Premium VPN Auto Script Service${NC}" 
echo "" 
read -n 1 -s -r -p "Press any key to back on menu"

menu
