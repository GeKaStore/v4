#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

TIMES="10"
CHATID=$(cat /etc/id)
KEY=$(cat /etc/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"

clear
source /var/lib/SIJA/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi

tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e ""
echo -e "\033[0;34m┌─────────────────────────────────────────────────┐\033[0m"
echo -e "\\E[0;41;36m            Create Xray/Vmess Account             \E[0m"
echo -e "\033[0;34m└─────────────────────────────────────────────────┘\033[0m"

		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
            echo -e "\033[0;34m┌─────────────────────────────────────────────────┐\033[0m"
            echo -e "\\E[0;41;36m            Create Xray/Vmess Account             \E[0m"
            echo -e "\033[0;34m└─────────────────────────────────────────────────┘\033[0m"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
			read -n 1 -s -r -p "Press any key to back on menu"
   menu
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
acs=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $acs | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1

TEXT="
<code>═══════════XRAY/VMESS═══════════</code>
<code>════════════════════════════════</code>
<code>➣Remarks    : </code> <code>${user}</code>
<code>➣Domain     : </code> <code>${domain}</code>
<code>➣Port TLS   : </code> <code>443</code>
<code>➣Port NTLS  : </code> <code>80, 8080</code>
<code>➣Port GRPC  : </code> <code>443</code>
<code>➣User ID    : </code> <code>${uuid}</code>
<code>➣AlterId    : 0</code>
<code>➣Security   : auto</code>
<code>➣Network    : WS or gRPC</code>
<code>➣Path       : </code> <code>/vmess</code>
<code>➣ServiceName: </code> <code>vmess-grpc</code>
<code>════════════════════════════════</code>
<code>➣Link TLS   :</code> 
<code>${vmesslink1}</code>
<code>════════════════════════════════</code>
<code>➣Link NTLS  :</code> 
<code>${vmesslink2}</code>
<code>════════════════════════════════</code>
<code>➣Link GRPC  :</code> 
<code>${vmesslink3}</code>
<code>════════════════════════════════</code>
<code>📅Expired On : $exp</code>
🌏 @WuzzSTORE
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

clear
echo -e ""
echo -e "${BIBlue}═══════════XRAY/VMESS═══════════${NC}"
echo -e "${BIBlue}════════════════════════════════${NC}"
echo -e "Remarks       : ${user}"
echo -e "Expired On    : $exp" 
echo -e "Domain        : ${domain}" 
echo -e "Port TLS      : 443" 
echo -e "Port none TLS : 80" 
echo -e "Port  GRPC    : 443" 
echo -e "id            : ${uuid}" 
echo -e "alterId       : 0" 
echo -e "Security      : auto" 
echo -e "Network       : ws" 
echo -e "Path          : /vmess" 
echo -e "Path          : /worryfree" 
echo -e "Path          : http://bug/worryfree" 
echo -e "ServiceName   : vmess-grpc" 
echo -e "${BIBlue}════════════════════════════════${NC}" 
echo -e "Link TLS : "
echo -e "${vmesslink1}" 
echo -e "${BIBlue}════════════════════════════════${NC} "
echo -e "Link none TLS : "
echo -e "${vmesslink2}" 
echo -e "${BIBlue}════════════════════════════════${NC} "
echo -e "Link GRPC : "
echo -e "${vmesslink3}"
echo -e "${BIBlue}════════════════════════════════${NC}" 
echo -e "${BICyan} Premium VPN Auto Script Service${NC}" 
echo "" | tee -a /etc/log-create-user.log
rm /etc/xray/$user-tls.json > /dev/null 2>&1
rm /etc/xray/$user-none.json > /dev/null 2>&1
read -n 1 -s -r -p "Press any key to back on menu"

menu
