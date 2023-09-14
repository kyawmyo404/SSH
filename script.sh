#!/bin/bash

plain='\033[0m'

#စာလုံးအရောင်များ(Server Message)
red='\e[31m'    #အနီရောင်
yellow='\e[33m' #အဝါရောင်
gray='\e[90m'   #မီးခိုးရောင်
green='\e[92m'  #အစိမ်းရောင်
blue='\e[94m'   #အပြာရောင်
magenta='\e[95m'#ပန်းခရမ်းရောင်
cyan='\e[96m'   #စိမ်းပြာရောင်
none='\e[0m'    #အရောင်မရှိ

#Username နှင့် Password ပြောင်းရန်
username="ypp26"
password="ypp26"

#SSH USER LIMIT သတ်မှတ်ရန်
sshlimiter="1500"

#ရက်ကန့်သက်ရန်(Qwiklab အတွက်မို့ 2-DAY ပုံသေထားရပါသည်)
dias="2"

#💠 Server Message ပြင်ရန်💠
#Server-message အရွယ်အစား သတ်မှတ်ချက်
# h6 သည် = စာလုံးအသေး ဖြစ်သည်
# h4 သည် = စာလုံးအလတ် ဖြစ်သည်
# h3 သည် = စာလုံးအကြီး  ဖြစ်သည
servermessage="<h3><font color='red'>
◈──────⪧ Servers Messages ⪦ ───────◈
</font></h3>
<h4><font color='cyan'>
Mytel GCP Public SSH Key
</font></h3>
<h4><font color='cyan'>
Used Count ◈──⪧ 1,500
</font></h3>
<h3><font color='red'>
◈──────⪧  SSH Public Key ⪦ ───────◈
</font></h3>"
#End
#ဒီအောက်က စာတွေပြင်ရန်မလိုပါ🌺
[[ $EUID -ne 0 ]] && echo -e "${red}Error: ${plain} You must use root user to run this script!\n" && exit 1

sed -i 's/#\?AllowTcpForwarding .*/AllowTcpForwarding yes/' /etc/ssh/sshd_config && sed -i 's/#\?PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config && sed -i 's/#\?Banner .*/Banner \/etc\/ssh\/gcp_404/' /etc/ssh/sshd_config && /etc/init.d/ssh restart;
echo "$servermessage" | tee /etc/ssh/gcp_404 >/dev/null
final=$(date "+%Y-%m-%d" -d "+$dias days")
gui=$(date "+%d/%m/%Y" -d "+$dias days")
pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
useradd -e $final -M -s /bin/false -p $pass $username >/dev/null
echo "$password" >/etc/$username
echo "$username:$password" | chpasswd
echo "$username $sshlimiter" >>/root/usuarios.db
IP=$(wget -qO- ipv4.icanhazip.com)
echo ""
echo -e "\033[1;32m             ◈─────────────────────────────────◈        "
echo -e "\033[1;32m               ©️ 🐉 Dark VPS MANAGER SCRIPT 🐉          " 
echo -e "\033[1;32m             ◈─────────────────────────────────◈        "
echo -e "\033[1;32m                                                         "
echo -e "\033[1;32m                                                         "
echo ""
echo -e "\033[1;37m                 ◈─────⪧ SSH ACCOUNT ⪦─────◈           "
echo -e "\033[1;37m                                                         "
echo ""
echo -e "\033[1;32m             ◈─ᗚ Host / IP   • ๛  \033[1;31m$IP"
echo -e "\033[1;32m             ◈─ᗚ Port        • ๛  \033[1;31m22"
echo -e "\033[1;32m             ◈─ᗚ Username    • ๛  \033[1;31m$username"
echo -e "\033[1;32m             ◈─ᗚ Password    • ๛  \033[1;31m$password"
echo -e "\033[1;32m                                                         "
echo -e "\033[1;32m        [-] ═──────────────────⪧◇⪦─────────────────═ [-]"
echo -e "\033[1;32m                                                         "
echo -e "\033[1;32m              ࿂ Login Limit • ๛   \033[1;31m$sshlimiter"               
echo -e "\033[1;32m             ◈ Expire Date :⪧  \033[1;31m$gui"
echo -e "\033[1;32m                                                         "
echo -e "\033[1;32m        [-] ═──────────────────⪧◇⪦─────────────────═ [-]"
echo -e "\033[1;32m                                                           "
echo -e "\033[1;32m                                                           "
echo ""
echo -e "\033[1;37m◈────⪧  Y.Y.P SSH Servers ⪦────◈"
echo ""
echo "     ◈────⪧  Y.Y.P SSH Servers ⪦────◈    "
printf "                                         "
printf "                Thank You                "
printf "                                         "
echo "          ──⪧═───────◇───────═⪦──         "
echo ""

echo -e "${red}[-] ═────────────────────────────⪧◇⪦───────────────────────────═        ${plain}"
echo -e "${green}                                                                       ${plain}"
echo -e "${red}                         I want time to stop                             ${plain}"
echo -e "${green}                                                                       ${plain}"
echo -e "${red}             Because I always want to be by your side                    ${plain}"
echo -e "${green}                                                                       ${plain}"
echo -e "${green}            ──────────⪧═───────◇───────═⪦──────────                   ${plain}"
echo -e "${green}                                                                       ${plain}"
echo -e "${cyan}                     S . S . H  A C C O U N T                           ${plain}"
echo -e "${green}                                                                       ${plain}"
echo -e "${green}    ࿂ ═───────⪧.  Now the thing is ready to use.  ⪦───────═  ࿂        ${plain}"
echo -e "${green}                                                                       ${plain}"
echo -e "${red}[-] ═────────────────────────────⪧◇⪦───────────────────────────═        ${plain}"

echo -e "${red}Y Y P   S S H   S e r v r r${plain}"
