domain=$(cat /etc/xray/domain)
TIMES="10"
CHATID=$(cat /etc/id)
KEY=$(cat /etc/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"

tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
vlesslink1="vless://${uuid}@${domain}:$tls?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:$none?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:$tls?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=bug.com#${user}"
systemctl restart xray
clear
vless1="$(echo $vlesslink1 | base64 -w 0)"
vless2="$(echo $vlesslink2 | base64 -w 0)"
vless3="$(echo $vlesslink3 | base64 -w 0)"

TEXT="
<code>━━━━━━━━━━━━━━━━━━━</code>
<code>🔰 TRIAL XRAY/VLESS 🔰   </code>
<code>━━━━━━━━━━━━━━━━━━━</code>
<code>➣Remarks    : </code> <code>${user}</code>
<code>➣Domain     : </code> <code>${domain}</code>
<code>➣Port TLS   : </code> <code>443</code>
<code>➣Port NTLS  : </code> <code>80, 8080</code>
<code>➣Port GRPC  : </code> <code>443</code>
<code>➣User ID    : </code> <code>${uuid}</code>
<code>➣AlterId    : 0</code>
<code>➣Security   : auto</code>
<code>➣Network    : WS or gRPC</code>
<code>➣Path       : </code> <code>/vless</code>
<code>➣ServiceName: </code> <code>vless-grpc</code>
<code>━━━━━━━━━━━━━━━━━━━</code>
<code>➣Link TLS   :</code> 
<code>${vless1}</code>
<code>━━━━━━━━━━━━━━━━━━━</code>
<code>➣Link NTLS  :</code> 
<code>${vless2}</code>
<code>━━━━━━━━━━━━━━━━━━━</code>
<code>➣Link GRPC  :</code> 
<code>${vless3}</code>
<code>━━━━━━━━━━━━━━━━━━━</code>
<code>📅Expired On : $exp</code>
🌏 @HRstores
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "\e[1;36m    .::::.  Trial Xray/Vless  .::::.  \033[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Remarks     : ${user}" | tee -a /etc/log-create-user.log
echo -e "Domain      : ${domain}" | tee -a /etc/log-create-user.log
echo -e "port TLS    : $tls" | tee -a /etc/log-create-user.log
echo -e "port nn TLS : $none" | tee -a /etc/log-create-user.log
echo -e "User id     : ${uuid}" | tee -a /etc/log-create-user.log
echo -e "Encryption  : none" | tee -a /etc/log-create-user.log
echo -e "Network     : ws" | tee -a /etc/log-create-user.log
echo -e "Path        : /vless" | tee -a /etc/log-create-user.log
echo -e "Path        : vless-grpc" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link TLS      : ${vlesslink1}" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link none TLS : ${vlesslink2}" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link GRPC     : ${vlesslink3}" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Expired On   : $exp" | tee -a /etc/log-create-user.log
echo -e "@HRstores" | tee -a /etc/log-create-user.log
echo ""

read -n 1 -s -r -p "Press any key to back on menu"

menu
