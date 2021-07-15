#!/usr/bin/bash

Clock(){
	STIME=$(date "+%H:%M:%S")
	TIME=$(date "+%H:%M")
	echo -e -n "\uf017${TIME}" 
}

Cal() {
    DATE=$(date "+%a, %d %B %Y")
    echo -e -n "\uf073${DATE}"
}

ActiveWindow(){
	len=$(echo -n "$(xdotool getwindowfocus getwindowname)" | wc -m)
	max_len=70
	if [ "$len" -gt "$max_len" ];then
		echo -n "$(xdotool getwindowfocus getwindowname | cut -c 1-$max_len)..."
	else
		echo -n "$(xdotool getwindowfocus getwindowname)"
	fi
}

Batteryc() {
	BATTACPI=$(acpi --battery)
	BATPERC=$(echo $BATTACPI | cut -d, -f2 | tr -d '[:space:]')

	if [[ $BATTACPI == *"100%"* ]]
	then
		echo -e -n "\uf00c$BATPERC"
	elif [[ $BATTACPI == *"Discharging"* ]]
	then
		BATPERC=${BATPERC::-1}
		if [ $BATPERC -le "10" ]
		then
			echo -e -n "\uf244"
		elif [ $BATPERC -le "25" ]
		then
			echo -e -n "\uf243"
		elif [ $BATPERC -le "50" ]
		then
			echo -e -n "\uf242"
		elif [ $BATPERC -le "75" ]
		then
			echo -e -n "\uf241"
		elif [ $BATPERC -le "100" ]
		then
			echo -e -n "\uf240"
		fi
		echo -e " $BATPERC%"
	elif [[ $BATTACPI == *"Charging"* && $BATTACPI != *"100%"* ]]
	then
		echo -e "\uf0e7 $BATPERC"
	elif [[ $BATTACPI == *"Unknown"* ]]
	then
		echo -e "$BATPERC"
	fi
}

Battery() {
	BATTACPI=$(acpi --battery)
	BATPERC=$(echo $BATTACPI | cut -d, -f2 | tr -d '[:space:]')
	echo -e "$BATPERC"
}

Battery_State(){
	BATTACPI=$(acpi --battery)
	BATPERC=$(echo $BATTACPI | cut -d, -f2 | tr -d '[:space:]')
	if [[ $BATTACPI == *"Charging"* && $BATTACPI != *"100%"* ]]
	then
		echo -e C
	#elif [[ $BATPERC -lt "99" ]]
	elif [[ $BATTACPI == *"Discharging,"* ]]
	then
		echo -e D
	elif [[ $BATTACPI == *"Unknown"* ]]
	then
		echo -e U
	elif [[ $BATTACPI == *"Full"* ]]
	then
		echo -e F
	fi
}

Wifi(){
	WIFISTR=$( iwconfig wlp1s0 | grep "Link" | sed 's/ //g' | sed 's/LinkQuality=//g' | sed 's/\/.*//g')
	if [ ! -z $WIFISTR ] ; then
		WIFISTR=$(( ${WIFISTR} * 100 / 70))
		ESSID=$(iwconfig wlp1s0 | grep ESSID | sed 's/ //g' | sed 's/.*://' | cut -d "\"" -f 2)
		if [ $WIFISTR -ge 1 ] ; then
			echo -e "\uf1eb ${ESSID} ${WIFISTR}%"
		fi
	fi
}

Sound2(){
	NOTMUTED=$( amixer -D pulse sget Master | grep "\[on\]" )
	if [[ ! -z $NOTMUTED ]] ; then
		VOL=$(amixer -D pulse sget Master|grep %] | sed 's/.*\[\([0-9][0-9]*\)%\].*/\1/g'|head -n 1)
		if [ $VOL -ge 85 ] ; then
			echo -e "\uf028${VOL}%"
		elif [ $VOL -ge 50 ] ; then
			echo -e "\uf027${VOL}%"
		else
			echo -e "\uf026${VOL}%"
		fi
	else
		echo -e "\uf026M"
	fi
}

Sound(){
	NOTMUTED=$( amixer sget Master | grep "\[on\]" )
	if [[ ! -z $NOTMUTED ]] ; then
		VOL=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master) | sed 's/%//g')
		if [ $VOL -ge 85 ] ; then
			echo -e "\uf028${VOL}%"
		elif [ $VOL -ge 50 ] ; then
			echo -e "\uf027${VOL}%"
		else
			echo -e "\uf026${VOL}%"
		fi
	else
		echo -e "\uf026M"
	fi
}

Language(){
	CURRENTLANG=$(head -n 1 /tmp/uim-state)
	if [[ $CURRENTLANG == *"English"* ]] ; then
		echo -e " \uf0ac ENG"
	elif [[ $CURRENTLANG == *"Katakana"* ]] ; then
		echo -e " \uf0ac カタカナ"
	elif [[ $CURRENTLANG == *"Hiragana"* ]] ; then
		echo -e " \uf0ac ひらがな"
	else
		echo -e " \uf0ac \uf128"
	fi
}
Uptime(){
  #UPTIME=$(uptime|sed 's/.*\([0-9][0-9]\) min.*/\1/g')
  UPTIME=$(uptime|cut -d ' ' -f 5|tr -d ',')
  echo -e "${UPTIME}"
}
Uptime-p(){
  UPTIME=$(uptime -p)
  echo -e "${UPTIME}"
}
User(){
  echo -e "$(whoami)"
}
Ram(){
  #echo -e $(free -h|grep Mem|awk '{print ($3)}')
  echo -e $(free |grep Mem|awk {'printf "%.2f\n", ($3+$5)/1000000 '})G
}
Stoptime(){
  date1=`date +%s`; 
  while true; do 
   echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
   sleep 0.1
  done
}
Out(){
  echo -e $(cat ~/hi)
}

# %{F#C5C8C6} foreground
# %{B#1D1F21} background
# %{F#8C9440} green
# %{F#A54242} red
# %{F#CC6666} bright red

while $LEMONBAR; do
	echo  "%{Sf}%{F#C5C8C6}%{B#1D1F21}%{l} $(Out)%{F#8C9440} $(Uptime-p)%{F#C5C8C6}   $(Ram)%{r} $(Sound2) $(Cal) $(Battery)$(Battery_State) %{F#CC6666}$(Clock)%{Sl}%{F#C5C8C6}%{B#1D1F21}%{l} $(Out)%{F#8C9440} $(Uptime-p)%{F#C5C8C6}   $(Ram)%{r} $(Sound2) $(Cal) $(Battery)$(Battery_State) %{F#CC6666}$(Clock)"
	sleep 5s
done


## old bars
  ## standard
	# echo -e "%{l}$(Language)" "%{c}$(ActiveWindow)" "%{r}$(Wifi)  $(Battery)  $(Sound)  $(Clock) $(Cal)"

  ## newer
	#echo  "%{l} $(Out) $(Uptime-p)   $(Ram)%{r} $(Sound) $(Cal) $(Battery)$(Battery_State) $(Clock)"
