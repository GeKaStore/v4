#!/bin/bash
# // String / Request Data
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
#MYIP=$(wget -qO- https://ipv4.icanhazip.com);
#MYIP=$(wget -qO- https://ipv6.icanhazip.com);
apt install jq curl -y
DOMAIN=hrvpn.my.id
DAOMIN=$(cat /etc/xray/domain)
sub=$(</dev/urandom tr -dc a-z0-9 | head -c4)
SUB_DOMAIN=${sub}.hrvpn.my.id
NS_DOMAIN=ns.${SUB_DOMAIN}
CF_ID=ahmadkhairudin1996@gmail.com
CF_KEY=ab4ab65e0df030c3bb23f6d8cee27f2773fd8
set -euo pipefail
IP=$(wget -qO- icanhazip.com);
echo "Updating DNS NS for ${SUB_DOMAIN}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${NS_DOMAIN}" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
if [[ "${#RECORD}" -le 10 ]]; then
RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" \
--data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${DAOMIN}'","proxied":false}' | jq -r .result.id)
fi
RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" \
--data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${DAOMIN}'","proxied":false}')
echo "$NS_DOMAIN" > /etc/xray/nsdomain
echo "$NS_DOMAIN" > /root/nsdomain
echo "NS Subdomain kamu adalah : $NS_DOMAIN"
sleep 4
rm -f /root/cfslow.sh
