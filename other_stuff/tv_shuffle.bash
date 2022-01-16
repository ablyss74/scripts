#!/usr/bin/env bash

# Pretty much the same sas the music script but bare bones.
# Shuffles through a var of tv channel streams using a command


player="flatpak run io.mpv.Mpv"
player_stop="mpv"
clear
header() {
REPLY=${REPLY,,}
[[ ! $REPLY ]] && REPLY=s

playlist="http://192.168.1.130:5004/auto/v2.1
http://192.168.1.130:5004/auto/v2.2
http://192.168.1.130:5004/auto/v2.3
http://192.168.1.130:5004/auto/v5.1
http://192.168.1.130:5004/auto/v5.2
http://192.168.1.130:5004/auto/v5.3
http://192.168.1.130:5004/auto/v5.4
http://192.168.1.130:5004/auto/v5.5
http://192.168.1.130:5004/auto/v8.1
http://192.168.1.130:5004/auto/v8.2
http://192.168.1.130:5004/auto/v8.3
http://192.168.1.130:5004/auto/v11.2
http://192.168.1.130:5004/auto/v11.11
http://192.168.1.130:5004/auto/v14.1
http://192.168.1.130:5004/auto/v14.3
http://192.168.1.130:5004/auto/v14.5
http://192.168.1.130:5004/auto/v17.3
http://192.168.1.130:5004/auto/v17.1
http://192.168.1.130:5004/auto/v34.3
http://192.168.1.130:5004/auto/v34.4
http://192.168.1.130:5004/auto/v36.1
http://192.168.1.130:5004/auto/v36.2
http://192.168.1.130:5004/auto/v36.3
http://192.168.1.130:5004/auto/v46.1
http://192.168.1.130:5004/auto/v46.2
http://192.168.1.130:5004/auto/v63.5
http://192.168.1.130:5004/auto/v69.3
http://192.168.1.130:5004/auto/v69.4
http://192.168.1.130:5004/auto/v69.5"
mapfile playlist <<< $playlist

if [[ ${REPLY} == s ]];then
	nu="0-$((${#playlist[*]}-1))"
	shuffle="$(shuf -i $nu -n 1)"
	pl="${playlist[$shuffle]}"
	tr=(${pl})
	tr=${tr[0]}	
	url=${tr}
	[[ $(ps -A | grep $player_stop) ]] && killall -1 $player_stop
	echo -e "Press Enter to Shuffle"
	$player ${tr} &> /dev/null & 

	
fi
}
while true
	do
		read -s -r -p "$(header)" -n 1
		 clear 
	done

