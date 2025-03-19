#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] Downloading Update File"



# download script
cd /usr/bin
# vmess
wget -O add-ws "https://raw.githubusercontent.com/GeKaStore/v4/main/xray/add-ws.sh" && chmod +x add-ws


# vless
wget -O add-vless "https://raw.githubusercontent.com/GeKaStore/v4/main/xray/add-vless.sh" && chmod +x add-vless

# trojan
wget -O add-tr "https://raw.githubusercontent.com/GeKaStore/v4/main/xray/add-tr.sh" && chmod +x add-tr

# trojan go
wget -0 menu-vless "https://raw.githubusercontent.com/heruahmad1/backupvpshrvpn/main/menu3.sh
wget -O addtrgo "https://raw.githubusercontent.com/GeKaStore/v4/main/xray/addtrgo.sh" && chmod +x addtrgo
wget -O trialtrojango "https://raw.githubusercontent.com/GeKaStore/v4/main/xray/trialtrojango.sh" && chmod +x trialtrojango
wget -O deltrgo "https://raw.githubusercontent.com/GeKaStore/v4/main/xray/deltrgo.sh" && chmod +x deltrgo
wget -O renewtrgo "https://raw.githubusercontent.com/GeKaStore/v4/main/xray/renewtrgo.sh" && chmod +x renewtrgo
wget -O cektrgo "https://raw.githubusercontent.com/GeKaStore/v4/main/xray/cektrgo.sh" && chmod +x cektrgo

# menu
wget -O menu "https://raw.githubusercontent.com/GeKaStore/v4/main/menu/menu.sh"
wget -O menu-vmess "https://raw.githubusercontent.com/heruahmad1/backupvpshrvpn/main/menu2.sh"
wget https://raw.githubusercontent.com/GeKaStore/v4/main/menu-vless && chmod +x menu-vless
wget -O running "https://raw.githubusercontent.com/GeKaStore/v4/main/menu/running.sh"
wget -O clearcache "https://raw.githubusercontent.com/GeKaStore/v4/main/menu/clearcache.sh"
wget -O menu-trgo "https://raw.githubusercontent.com/GeKaStore/v4/main/menu/menu-trgo.sh"
wget -O menu-trojan "https://raw.githubusercontent.com/heruahmad1/backupvpshrvpn/main/menu4.sh"

# menu ssh ovpn
wget -O menu-sshh "https://raw.githubusercontent.com/GeKaStore/v4/main/menu/menu-sshh.sh"
wget -O usernew "https://raw.githubusercontent.com/GeKaStore/v4/main/ssh/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/GeKaStore/v4/main/ssh/trial.sh"
wget -O renew "https://raw.githubusercontent.com/GeKaStore/v4/main/ssh/renew.sh"
wget -O hapus "https://raw.githubusercontent.com/GeKaStore/v4/main/ssh/hapus.sh"
wget -O cek "https://raw.githubusercontent.com/GeKaStore/v4/main/ssh/cek.sh"
wget -O member "https://raw.githubusercontent.com/GeKaStore/v4/main/ssh/member.sh"
wget -O delete "https://raw.githubusercontent.com/GeKaStore/v4/main/ssh/delete.sh"
wget -O autokilll "https://raw.githubusercontent.com/GeKaStore/v4/main/ssh/autokilll.sh"
wget -O ceklim "https://raw.githubusercontent.com/GeKaStore/v4/main/ssh/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/GeKaStore/v4/main/ssh/tendang.sh"
wget -O user-lock "https://raw.githubusercontent.com/GeKaStore/v4/main/ssh/user-lock.sh"
wget -O user-unlock "https://raw.githubusercontent.com/GeKaStore/v4/main/ssh/user-unlock.sh"

# menu system
wget -0 update "https://raw.githubusercontent.com/GeKaStore/v4/main/ssh/f.sh"
wget -O menu-set "https://raw.githubusercontent.com/GeKaStore/v4/main/menu/menu-set.sh"
wget -O add-host "https://raw.githubusercontent.com/GeKaStore/v4/main/ssh/add-host.sh"
wget -O port-change "https://raw.githubusercontent.com/GeKaStore/v4/main/port/port-change.sh"
wget -O certv2ray "https://raw.githubusercontent.com/GeKaStore/v4/main/xray/certv2ray.sh"
wget -O menu-webmin "https://raw.githubusercontent.com/GeKaStore/v4/main/menu/menu-webmin.sh"
wget -O speedtest "https://raw.githubusercontent.com/GeKaStore/v4/main/ssh/speedtest_cli.py"
wget -O auto-reboot "https://raw.githubusercontent.com/GeKaStore/v4/main/menu/auto-reboot.sh"
wget -O restarts "https://raw.githubusercontent.com/GeKaStore/v4/main/menu/restarts.sh"
wget -O bw "https://raw.githubusercontent.com/GeKaStore/v4/main/menu/bw.sh"
wget -O xp "https://raw.githubusercontent.com/GeKaStore/v4/main/ssh/xp.sh"

wget -O sshws "https://raw.githubusercontent.com/GeKaStore/v4/main/ssh/sshws.sh"
wget -O status "https://raw.githubusercontent.com/GeKaStore/v4/main/status.sh"
wget https://raw.githubusercontent.com/botak8/v4/main/backup/set-br.sh &&  chmod +x set-br.sh && ./set-br.sh
wget -O /usr/bin/backup "https://raw.githubusercontent.com/botak8/v4/main/backup/backup.sh" && chmod +x /usr/bin/backup
wget -O /usr/bin/restore "https://raw.githubusercontent.com/botak8/v4/main/backup/restore.sh" && chmod +x /usr/bin/restore
wget -O bot "https://raw.githubusercontent.com/GeKaStore/v4/main/xray/xroy.sh" && chmod +x /usr/bin/bot


clear
chmod +x menu
chmod +x update
chmod +x menu-vless
chmod +x menu-vmess
chmod +x running
chmod +x clearcache
chmod +x menu-trgo
chmod +x menu-trojan

chmod +x menu-sshh
chmod +x usernew
chmod +x trial
chmod +x renew
chmod +x hapus
chmod +x cek
chmod +x member
chmod +x delete
chmod +x autokilll
chmod +x ceklim
chmod +x tendang
chmod +x user-lock
chmod +x user-unlock

chmod +x xp
chmod +x menu-set
chmod +x add-host
chmod +x port-change
chmod +x certv2ray
chmod +x speedtest
chmod +x auto-reboot
chmod +x restarts
chmod +x bw
chmod +x sshws
chmod +x status
chmod +x backup
chmod +x restore
clear
rm -rf updatefile.sh
exit
