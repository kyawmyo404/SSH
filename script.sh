#!/bin/bash
plain='\033[0m'
red='\e[31m'    #အနီရောင်
yellow='\e[33m' #အဝါရောင်
gray='\e[90m'   #မီးခိုးရောင်
green='\e[92m'  #အစိမ်းရောင်
blue='\e[94m'   #အပြာရောင်
magenta='\e[95m'#ပန်းခရမ်းရောင်
cyan='\e[96m'   #စိမ်းပြာရောင်
none='\e[0m'    #အရောင်မရှိ
username="hha26"
password="hha26"
sshlimiter="1000"
dias="2"
servermessage="<h3><font color='red'>
 Server Message
</font></h3>
<h4><font color='green'>
Mytel GCP Public SSH Key
</3font></h4>
<h4><font color='blue'>
Used Count ◈──⪧ 1,500
</font></h4>
<h4><font color='yellow'>
Online 
</font></h4>
<h6><font color='magenta'>
Thank For your 
</font></h6>
<h3><font color='red'>
HCM Channel  
</font></h3>"

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
echo -e "${green}                    ◈────⪧  SSH ACCOUNT  ⪦────◈      ${plain}"
echo ""
echo -e "\033[1;32m             ◈─ᗚ Host / IP   • ๛  \033[1;31m$IP"
echo -e "\033[1;32m             ◈─ᗚ Host / IP   • ๛  \033[1;31mhcm-gcp.myftp.org"
echo -e "\033[1;32m             ◈─ᗚ Host / IP   • ๛  \033[1;31mhcm.myftp.org"
echo -e "\033[1;32m             ◈─ᗚ Port        • ๛  \033[1;31m22"
echo -e "\033[1;32m             ◈─ᗚ Username    • ๛  \033[1;31m$username"
echo -e "\033[1;32m             ◈─ᗚ Password    • ๛  \033[1;31m$password"
echo ""

echo "------------------------------------"
printf "Developed the script by HCM \n"
echo "------------------------------------"
echo ""
