#!/usr/bin/env bash
set -f
# Started Jan 2022 by me J. Beazley
# Lots of thanks to Bash Hackers for an awesome website and tips.
# Lots of thanks to SomaFM for streaming the best stuff on this side of the universe.
# Plays random playlist streams from a variable set in the script.
# Uses mpg123 binary as the backend.
# Uses alsa mixer for volume control.

# To run, open your favorite terminal and just type: bash ./music_thingy.bash
# No need to make it executable. That way you can click it open with your
# favorite text editor. ;-)


header() {

	player="flatpak run io.mpv.Mpv"
	player_kill="mpv"
	favs="./.music_thingy_favorites.txt"
	
	

	BLUE="$(tput setaf 12)"    
	RED="$(tput setaf 9)"
	GREEN="$(tput setaf 46)"
	NORM="$(tput setaf 15)"
	ORANGE="$(tput setaf 9)" 
	BLACK="$(tput setaf 234)" 

	
tput -S <<!
clear
cup 10 
smso
bold
!


	echo -e "                   Interactive Music Thingy               \n             https://github.com/ablyss74/scripts          \n   \
        [s]huffle/[q]uit   vol +/-   [h]elp Menu       \n       \n     \n   \n \n"
tput rmso
	x=($(${player%} --version))
	[[ -z ${x[0]} ]] && echo -e "\\n${ORANGE}${player}${RED} not installed. ${BLUE}Please install it to play music :-)\\n" && exit 

	REPLY=${REPLY,,}
	[[ ! $REPLY ]] && REPLY=s  ## Set REPLY=s so we autoplay. "Enter" key also works instead of "s" key.


	playlist="https://somafm.com/7soul.pls#Seven Inch Soul - Vintage soul tracks from the original 45 RPM vinyl.
	https://somafm.com/beatblender.pls#Beat Blender - A late night blend of deep-house and downtempo chill.
	https://somafm.com/bootliquor.pls#Boot Liquor - Americana Roots music for Cowhands, Cowpokes and Cowtippers
	https://somafm.com/brfm.pls#Black Rock FM - From the Playa to the world, for the annual Burning Man festival.
	https://somafm.com/christmas.pls#Christmas Lounge - Chilled holiday grooves and classic winter lounge tracks. (Kid and Parent safe!)
	https://somafm.com/cliqhop.pls#cliqhop idm - Blips'n'beeps backed mostly w/beats. Intelligent Dance Music.
	https://somafm.com/covers.pls#Covers - Just covers. Songs you know by artists you don't. We've got you covered.
	https://somafm.com/deepspaceone.pls#Deep Space One - Deep ambient electronic, experimental and space music. For inner and outer space exploration.
	https://somafm.com/defcon.pls#DEF CON Radio - Music for Hacking. The DEF CON Year-Round Channel.
	https://somafm.com/digitalis.pls#Digitalis - Digitally affected analog rock to calm the agitated heart.
	https://somafm.com/dubstep.pls#Dub Step Beyond - Dubstep, Dub and Deep Bass. May damage speakers at high volume.
	https://somafm.com/dronezone.pls#Drone Zone - Served best chilled, safe with most medications. Atmospheric textures with minimal beats.
	https://somafm.com/fluid.pls#Fluid - Drown in the electronic sound of instrumental hiphop, future soul and liquid trap.
	https://somafm.com/folkfwd.pls#Folk Forward - Indie Folk, Alt-folk and the occasional folk classics.
	https://somafm.com/groovesalad.pls#Groove Salad - A nicely chilled plate of ambient/downtempo beats and grooves.
	https://somafm.com/gsclassic.pls#Groove Salad Classic - The classic (early 2000s) version of a nicely chilled plate of ambient/downtempo beats and grooves.
	https://somafm.com/illstreet.pls#Illinois Street Lounge - Classic bachelor pad, playful exotica and vintage music of tomorrow.
	https://somafm.com/indiepop.pls#Indie Pop Rocks! - New and classic favorite indie pop tracks.
	https://somafm.com/jollysoul.pls#Jolly Ol' Soul - Where we cut right to the soul of the season.
	https://somafm.com/live.pls#SomaFM Live - Special Live Events and rebroadcasts of past live events.
	https://somafm.com/lush.pls#Lush - Sensuous and mellow female vocals, many with an electronic influence.
	https://somafm.com/metal.pls#Metal Detector - From black to doom, prog to sludge, thrash to post, stoner to crossover, punk to industrial.
	https://somafm.com/missioncontrol.pls#Mission Control - Celebrating NASA and Space Explorers everywhere.
	https://somafm.com/n5md.pls#n5MD Radio Emotional Experiments in Music: Ambient, modern composition, post-rock, & experimental electronic music.
	https://somafm.com/poptron.pls#PopTron - Electropop and indie dance rock with sparkle and pop.
	https://somafm.com/u80s.pls#Underground 80s - Early 80s UK Synthpop and a bit of New Wave.
	https://somafm.com/reggae.pls#Heavyweight Reggae - Reggae, Ska, Rocksteady classic and deep tracks.
	https://somafm.com/scanner.pls#SF Police Scanner - San Francisco Public Safety Scanner Feed.
	https://somafm.com/secretagent.pls#Secret Agent - The soundtrack for your stylish, mysterious, dangerous life. For Spies and PIs too!
	https://somafm.com/seventies.pls#Left Coast 70s - Mellow album rock from the Seventies. Yacht not required.
	https://somafm.com/sf1033.pls#SF 10-33 - Ambient music mixed with the sounds of San Francisco public safety radio traffic.
	https://somafm.com/sonicuniverse.pls#Sonic Universe - Transcending the world of jazz with eclectic, avant-garde takes on tradition.
	https://somafm.com/spacestation.pls#Space Station - Soma Tune in, turn on, space out. Spaced-out ambient and mid-tempo electronica.
	https://somafm.com/specials.pls#Department Store Christmas Holiday Elevator Music from a more innocent time. (Specials).
	https://somafm.com/suburbsofgoa.pls#SSuburbs of Goa - Desi-influenced Asian world beats and beyond.
	https://somafm.com/synphaera.pls#Synphaera Radio - Featuring the music from an independent record label focused on modern electronic ambient and space music.
	https://somafm.com/thetrip.pls#The Trip - Progressive house / trance. Tip top tunes.
	https://somafm.com/thistle.pls#ThistleRadio - Exploring music from Celtic roots and branches
	https://somafm.com/vaporwaves.pls#Vaporwaves - All Vaporwave. All the time.
	https://somafm.com/xmasrocks.pls#Christmas Rocks! - Have your self an indie/alternative holiday season!
	https://somafm.com/xmasinfrisko.pls#Xmas in Frisko - SomaFM's wacky and eclectic holiday mix. Not for the easily offended."
	mapfile playlist <<< $playlist

	if [[ $REPLY ]] 
		then
			vol() {
				for l in "$(amixer get Master)"
					do
		 			l=${l// /_}  
 	          			l=${l/_[/ }
 		 			l=${l/]_/ }
  		  			l=($l)
  		 			s="${l[5]}"
  
  					#Fix for raspberry pi *** maybe outdated 
 		 	 		[[ ${#s} -gt 3 ]] && s="${l[6]}"  

  		  			soundlevel=${s//%/}
  		  			inc_sound=$(($soundlevel + 5))
  		  			dec_sound=$(($soundlevel - 5))

  		  			[[ $REPLY == + ]] && amixer -q set Master $(($soundlevel + 5))% && s=$(($soundlevel + 5))%
  		  			[[ $REPLY == - ]] && amixer -q set Master $(($soundlevel - 5))% && s=$(($soundlevel - 5))%  
  		  			[[ $REPLY == m ]] && amixer -q set Master mute && s=Muted
  		  			[[ $REPLY == u ]] && amixer -q set Master unmute 
  					echo "${s}"  			
					done		
				} 

			gp() {
			
				if [[ ${REPLY} == f ]];then
					
					mapfile playlist < $favs
					nu="0-$((${#playlist[*]}-1))"
					shuffle="$(shuf -i $nu -n 1)"
					pl="${playlist[$shuffle]}"
					tr=(${pl//#/\/ })
					tr=${tr[0]}
				
				         ##########################
					(killall -1 $player_kill)  ################### For some reason this gets spawned twice when ran as background process...
					($player ${tr//pls\//pls} )&> /tmp/mout & ########### killing it only way I can make it work ;(
					###########################
					url="${pl//,/\\n *}"
					url="${url//\ -\ /\\n * }"
					url="${url//.\ /\\n * }"
					url=(${url//#/\\n * })
					echo ${url[*]} > /tmp/music_thingy.info	
					
				fi
				if [[ ${REPLY} == d ]];then
					
					tmp=$(</tmp/music_thingy.info)
					foo=$(<$favs)
					echo "${foo//"$tmp"}" | sed '/^$/d' > $favs
											
				fi
				if [[ ${REPLY} == a ]];then
					fav=$(</tmp/music_thingy.info)
					echo $fav >> $favs								
						
				fi
			
				if [[ ${REPLY} == s ]];then
					nu="0-$((${#playlist[*]}-1))"
					shuffle="$(shuf -i $nu -n 1)"
					pl="${playlist[$shuffle]}"
					tr=(${pl//#/\/ })
					tr=${tr[0]}
				
					(killall -1 $player_kill)
					($player ${tr//pls\//pls} )&> /tmp/mout &
					url="${pl//,/\\n *}"
					url="${url//\ -\ /\\n * }"
					url="${url//.\ /\\n * }"
					url=(${url//#/\\n * })
					echo ${url[*]} > /tmp/music_thingy.info	
				fi


				

				echo -e " * $(</tmp/music_thingy.info) \n   * Total Playlists ${#playlist[*]}\\n   * Vol $(vol)"
				
				if [[ ${REPLY} == f ]];then
					
					echo -e "${BLUE} * ${RED}Shuffling favorites"
				fi				
				if [[ ${REPLY} == l ]];then
					
					echo -e "${BLUE} * ${RED}Favorites...\\n$(<${favsf)"
				fi				
				
				if [[ ${REPLY} == d ]];then

					echo -e "${BLUE} * ${RED}Deleted from favorites"						
				fi

				if [[ ${REPLY} == a ]];then
								
					echo -e "${BLUE} * ${RED}Added to favorites"	
				fi			
				if [[ ${REPLY} == h ]];then
								
					echo -e "${BLUE} * ${RED} [a]  Add to favorites"
					echo -e "${BLUE} * ${RED} [d]  Delete from favorites"	
					echo -e "${BLUE} * ${RED} [f]  Shuffle favorites"
					echo -e "${BLUE} * ${RED} [l]  List favorites"
					echo -e "${BLUE} * ${RED} [s]  Shuffle all"
					echo -e "${BLUE} * ${RED} [q]  Quit"
					echo -e "${BLUE} * ${RED} [m]  Mute"
					echo -e "${BLUE} * ${RED} [u]  Unmute"
					echo -e "${BLUE} * ${RED} [+]  Vol up"
					echo -e "${BLUE} * ${RED} [-]  Vol down"
					echo -e "${BLUE} * ${RED} [h]  Help menu"
				fi				
				
				
					
				echo -e "\\n\\n\\n\\n\\n\\n${RED}${USER}${BLUE}@${ORANGE}Interactive Music Thingy${BLUE}~ $:-) "
				}	

		[[ ${REPLY} == s ]] && echo -e "$(gp)" && return 
		[[ ${REPLY} == h ]] && echo -e "$(gp)" && return 
		[[ ${REPLY} == a ]] && echo -e "$(gp)" && return 
		[[ ${REPLY} == d ]] && echo -e "$(gp)" && return 
		[[ ${REPLY} == f ]] && echo -e "$(gp)" && return 
     		[[ ${REPLY} == l ]] && echo -e "$(gp)" && return
   		[[ ${REPLY} == + ]] && echo -e "$(gp)" && return 
   		[[ ${REPLY} == - ]] && echo -e "$(gp)" && return 
   		[[ ${REPLY} == m ]] && echo -e "$(gp)" && return 
   		[[ ${REPLY} == u ]] && echo -e "$(gp)" && return 
   		[[ ${REPLY} == q ]] && echo -e "$(gp)" && return

   		echo -e "$(gp) Invalid command (-: " 
	fi
}

header

while true
	do
		read -s -r -p "$(header)" -n 1
		 [[ ${REPLY} == q ]] && echo -e "\\n\\n${BLUE}bye!\\n\\n" && killall -1 $player_kill && break || clear
	done
	

