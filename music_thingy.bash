#!/usr/bin/env bash

# Started Jan 2022 by me J. Beazley
# Lots of thanks to Bash Hackers for an awesome website and tips.
# Lots of thanks to SomaFM for streaming the best stuff on this side of the universe.
# Plays random playlist streams from a variable set in the script.
# Uses mpg123 binary as the backend.
# Uses alsa mixer for volume control.

# To run, open your favorite terminal and just type: bash ./music_thingy.bash
# No need to make it executable. That way you can click it open with your
# favorite text editor. ;-)

player="mpg123"
header() {
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

xt() {
echo -e "$(tput setaf $(shuf -i 21-227))I$(tput setaf $(shuf -i 21-227))n$(tput setaf $(shuf -i 21-227))t$(tput setaf $(shuf -i 21-227))e$(tput setaf $(shuf -i 21-227))r$(tput setaf $(shuf -i 21-227))a$(tput setaf $(shuf -i 21-227))c$(tput setaf $(shuf -i 21-227))t$(tput setaf $(shuf -i 21-227))i$(tput setaf $(shuf -i 21-227))v$(tput setaf $(shuf -i 21-227))e $(tput setaf $(shuf -i 21-227))M$(tput setaf $(shuf -i 21-227))u$(tput setaf $(shuf -i 21-227))s$(tput setaf $(shuf -i 21-227))i$(tput setaf $(shuf -i 21-227))c $(tput setaf $(shuf -i 21-227))T$(tput setaf $(shuf -i 21-227))h$(tput setaf $(shuf -i 21-227))i$(tput setaf $(shuf -i 21-227))n$(tput setaf $(shuf -i 21-227))g$(tput setaf $(shuf -i 21-227))y"
}
mt() {
rb="$(tput setaf $(shuf -i 21-227))"
echo "$(tput setaf $(shuf -i 21-227))I$(tput setaf $(shuf -i 21-227))n$(tput setaf $(shuf -i 21-227))t$(tput setaf $(shuf -i 21-227))e$(tput setaf $(shuf -i 21-227))r$(tput setaf $(shuf -i 21-227))a$(tput setaf $(shuf -i 21-227))c$(tput setaf $(shuf -i 21-227))t$(tput setaf $(shuf -i 21-227))i$(tput setaf $(shuf -i 21-227))v$(tput setaf $(shuf -i 21-227))e $(tput setaf $(shuf -i 21-227))M$(tput setaf $(shuf -i 21-227))u$(tput setaf $(shuf -i 21-227))s$(tput setaf $(shuf -i 21-227))i$(tput setaf $(shuf -i 21-227))c $(tput setaf $(shuf -i 21-227))T$(tput setaf $(shuf -i 21-227))h$(tput setaf $(shuf -i 21-227))i$(tput setaf $(shuf -i 21-227))n$(tput setaf $(shuf -i 21-227))g$(tput setaf $(shuf -i 21-227))y$(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227))"
}
echo -e "$(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(mt) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) \n$(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) ${BLUE}$(tput setaf $(shuf -i 21-227))h$(tput setaf $(shuf -i 21-227))t$(tput setaf $(shuf -i 21-227))t$(tput setaf $(shuf -i 21-227))p$(tput setaf $(shuf -i 21-227))s$(tput setaf $(shuf -i 21-227)):$(tput setaf $(shuf -i 21-227))/$(tput setaf $(shuf -i 21-227))/$(tput setaf $(shuf -i 21-227))g$(tput setaf $(shuf -i 21-227))i$(tput setaf $(shuf -i 21-227))t$(tput setaf $(shuf -i 21-227))h$(tput setaf $(shuf -i 21-227))u$(tput setaf $(shuf -i 21-227))b$(tput setaf $(shuf -i 21-227)).$(tput setaf $(shuf -i 21-227))c$(tput setaf $(shuf -i 21-227))o$(tput setaf $(shuf -i 21-227))m$(tput setaf $(shuf -i 21-227))/$(tput setaf $(shuf -i 21-227))a$(tput setaf $(shuf -i 21-227))b$(tput setaf $(shuf -i 21-227))l$(tput setaf $(shuf -i 21-227))y$(tput setaf $(shuf -i 21-227))s$(tput setaf $(shuf -i 21-227))s$(tput setaf $(shuf -i 21-227))7$(tput setaf $(shuf -i 21-227))4$(tput setaf $(shuf -i 21-227))/$(tput setaf $(shuf -i 21-227))m$(tput setaf $(shuf -i 21-227))u$(tput setaf $(shuf -i 21-227))s$(tput setaf $(shuf -i 21-227))i$(tput setaf $(shuf -i 21-227))c$(tput setaf $(shuf -i 21-227))_$(tput setaf $(shuf -i 21-227))t$(tput setaf $(shuf -i 21-227))h$(tput setaf $(shuf -i 21-227))i$(tput setaf $(shuf -i 21-227))n$(tput setaf $(shuf -i 21-227))g$(tput setaf $(shuf -i 21-227))y$(tput setaf $(shuf -i 21-227)).$(tput setaf $(shuf -i 21-227))b$(tput setaf $(shuf -i 21-227))a$(tput setaf $(shuf -i 21-227))$(tput setaf $(shuf -i 21-227))s$(tput setaf $(shuf -i 21-227))h$(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) \n$(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) ${BLUE} ${BLUE} ${BLUE} ${BLUE} ${BLUE} $(tput setaf $(shuf -i 21-227))s${BLUE}huffle/$(tput setaf $(shuf -i 21-227))q${BLUE}uit vol $(tput setaf $(shuf -i 21-227))+${BLUE}/$(tput setaf $(shuf -i 21-227))-${BLUE} $(tput setaf $(shuf -i 21-227))m${BLUE}ute/$(tput setaf $(shuf -i 21-227))u${BLUE}nmute${BLUE} ${BLUE} ${BLUE} ${BLUE} ${BLUE} ${BLUE} ${BLUE} ${BLUE} ${BLUE} ${BLUE} $(tput setaf $(shuf -i 21-227)) \n$(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227))\n $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) \n $(tput setaf $(shuf -i 21-227)) $(tput setaf $(shuf -i 21-227)) \n$(tput setaf $(shuf -i 21-227)) \n"
tput rmso
x=($(${player%} --version))
[[ -z ${x[0]} ]] && echo -e "\\n${ORANGE}${player}${RED} not installed. ${BLUE}Please install it to play music $(tput setaf $(shuf -i 21-227)):$(tput setaf $(shuf -i 21-227))-$(tput setaf $(shuf -i 21-227)))\\n" && exit 

REPLY=${REPLY,,}
[[ ! $REPLY ]] && REPLY=s


playlist="http://somafm.com/7soul.pls#Seven Inch Soul - Vintage soul tracks from the original 45 RPM vinyl.
http://somafm.com/beatblender.pls#Beat Blender - A late night blend of deep-house and downtempo chill.
http://somafm.com/bootliquor.pls#Boot Liquor - Americana Roots music for Cowhands, Cowpokes and Cowtippers
http://somafm.com/brfm.pls#Black Rock FM - From the Playa to the world, for the annual Burning Man festival.
http://somafm.com/christmas.pls#Christmas Lounge - Chilled holiday grooves and classic winter lounge tracks. (Kid and Parent safe!)
http://somafm.com/cliqhop.pls#cliqhop idm - Blips'n'beeps backed mostly w/beats. Intelligent Dance Music.
http://somafm.com/covers.pls#Covers - Just covers. Songs you know by artists you don't. We've got you covered.
http://somafm.com/deepspaceone.pls#Deep Space One - Deep ambient electronic, experimental and space music. For inner and outer space exploration.
http://somafm.com/defcon.pls#DEF CON Radio - Music for Hacking. The DEF CON Year-Round Channel.
http://somafm.com/digitalis.pls#Digitalis - Digitally affected analog rock to calm the agitated heart.
http://somafm.com/dubstep.pls#Dub Step Beyond - Dubstep, Dub and Deep Bass. May damage speakers at high volume.
http://somafm.com/dronezone.pls#Drone Zone - Served best chilled, safe with most medications. Atmospheric textures with minimal beats.
http://somafm.com/fluid.pls#Fluid - Drown in the electronic sound of instrumental hiphop, future soul and liquid trap.
http://somafm.com/folkfwd.pls#Folk Forward - Indie Folk, Alt-folk and the occasional folk classics.
http://somafm.com/groovesalad.pls#Groove Salad - A nicely chilled plate of ambient/downtempo beats and grooves.
http://somafm.com/gsclassic.pls#Groove Salad Classic - The classic (early 2000s) version of a nicely chilled plate of ambient/downtempo beats and grooves.
http://somafm.com/illstreet.pls#Illinois Street Lounge - Classic bachelor pad, playful exotica and vintage music of tomorrow.
http://somafm.com/indiepop.pls#Indie Pop Rocks! - New and classic favorite indie pop tracks.
http://somafm.com/jollysoul.pls#Jolly Ol' Soul - Where we cut right to the soul of the season.
http://somafm.com/live.pls#SomaFM Live - Special Live Events and rebroadcasts of past live events.
http://somafm.com/lush.pls#Lush - Sensuous and mellow female vocals, many with an electronic influence.
http://somafm.com/metal.pls#Metal Detector - From black to doom, prog to sludge, thrash to post, stoner to crossover, punk to industrial.
http://somafm.com/missioncontrol.pls#Mission Control - Celebrating NASA and Space Explorers everywhere.
http://somafm.com/n5md.pls#n5MD Radio Emotional Experiments in Music: Ambient, modern composition, post-rock, & experimental electronic music.
http://somafm.com/poptron.pls#PopTron - Electropop and indie dance rock with sparkle and pop.
http://somafm.com/u80s.pls#Underground 80s - Early 80s UK Synthpop and a bit of New Wave.
http://somafm.com/reggae.pls#Heavyweight Reggae - Reggae, Ska, Rocksteady classic and deep tracks.
http://somafm.com/scanner.pls#SF Police Scanner - San Francisco Public Safety Scanner Feed.
http://somafm.com/secretagent.pls#Secret Agent - The soundtrack for your stylish, mysterious, dangerous life. For Spies and PIs too!
http://somafm.com/seventies.pls#Left Coast 70s - Mellow album rock from the Seventies. Yacht not required.
http://somafm.com/sf1033.pls#SF 10-33 - Ambient music mixed with the sounds of San Francisco public safety radio traffic.
http://somafm.com/sonicuniverse.pls#Sonic Universe - Transcending the world of jazz with eclectic, avant-garde takes on tradition.
http://somafm.com/spacestation.pls#Space Station - Soma Tune in, turn on, space out. Spaced-out ambient and mid-tempo electronica.
http://somafm.com/specials.pls#Department Store Christmas Holiday Elevator Music from a more innocent time. (Specials).
http://somafm.com/suburbsofgoa.pls#SSuburbs of Goa - Desi-influenced Asian world beats and beyond.
http://somafm.com/synphaera.pls#Synphaera Radio - Featuring the music from an independent record label focused on modern electronic ambient and space music.
http://somafm.com/thetrip.pls#The Trip - Progressive house / trance. Tip top tunes.
http://somafm.com/thistle.pls#ThistleRadio - Exploring music from Celtic roots and branches
http://somafm.com/vaporwaves.pls#Vaporwaves - All Vaporwave. All the time.
http://somafm.com/xmasrocks.pls#Christmas Rocks! - Have your self an indie/alternative holiday season!
http://somafm.com/xmasinfrisko.pls#Xmas in Frisko - SomaFM's wacky and eclectic holiday mix. Not for the easily offended."
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
  			echo "$(tput setaf $(shuf -i 21-227))${s}"
  			
		done
		
} 

gp() {

if [[ ${REPLY} == s ]];then
	nu="0-$((${#playlist[*]}-1))"
	shuffle="$(shuf -i $nu -n 1)"
	pl="${playlist[$shuffle]}"
	tr=(${pl//#/\/ })
	tr=${tr[0]}
	(killall -1 ${player% -@})
	($player -@ ${tr//pls\//pls} )&> /dev/null &
	
fi
autoshuffle() {
echo "$(tput setaf $(shuf -i 21-227))h$(tput setaf $(shuf -i 21-227))u$(tput setaf $(shuf -i 21-227))h$(tput setaf $(shuf -i 21-227))?"
}

nar="${playlist[$shuffle]}"
url="${nar//,/\\n $(tput setaf $(shuf -i 21-227))*$(tput setaf $(shuf -i 21-227))}"
url="${url//\ -\ /\\n $(tput setaf $(shuf -i 21-227))* $(tput setaf $(shuf -i 21-227))}"
url="${url//.\ /\\n $(tput setaf $(shuf -i 21-227))* $(tput setaf $(shuf -i 21-227))}"
url=(${url//#/\\n $(tput setaf $(shuf -i 21-227))* $(tput setaf $(shuf -i 21-227))}) 
echo -e " * $(tput setaf $(shuf -i 21-227))${url[*]}\n $(tput setaf $(shuf -i 21-227))  * $(tput setaf $(shuf -i 21-227))T$(tput setaf $(shuf -i 21-227))o$(tput setaf $(shuf -i 21-227))t$(tput setaf $(shuf -i 21-227))a$(tput setaf $(shuf -i 21-227))l $(tput setaf $(shuf -i 21-227))P$(tput setaf $(shuf -i 21-227))l$(tput setaf $(shuf -i 21-227))a$(tput setaf $(shuf -i 21-227))y$(tput setaf $(shuf -i 21-227))l$(tput setaf $(shuf -i 21-227))i$(tput setaf $(shuf -i 21-227))s$(tput setaf $(shuf -i 21-227))t$(tput setaf $(shuf -i 21-227))s$(tput setaf $(shuf -i 21-227)) $((${#playlist[*]}-1))\\n $(tput setaf $(shuf -i 21-227))  * $(tput setaf $(shuf -i 21-227))S$(tput setaf $(shuf -i 21-227))h$(tput setaf $(shuf -i 21-227))u$(tput setaf $(shuf -i 21-227))f$(tput setaf $(shuf -i 21-227))f$(tput setaf $(shuf -i 21-227))l$(tput setaf $(shuf -i 21-227))e$(tput setaf $(shuf -i 21-227)) $(autoshuffle)\\n $(tput setaf $(shuf -i 21-227))  * $(tput setaf $(shuf -i 21-227))$(tput setaf $(shuf -i 21-227))V$(tput setaf $(shuf -i 21-227))o$(tput setaf $(shuf -i 21-227))l$(tput setaf $(shuf -i 21-227)) $(vol)\\n\\n\\n\\n\\n\\n${RED}${USER}${BLUE}@${ORANGE}$(xt)${BLUE}~ $ $(tput setaf $(shuf -i 21-227)):$(tput setaf $(shuf -i 21-227))-$(tput setaf $(shuf -i 21-227)))"

}	
	[[ ${REPLY} == s ]] && echo -e "$(gp) " && return 
   	[[ ${REPLY} == + ]] && echo -e "$(gp) " && return 
   	[[ ${REPLY} == - ]] && echo -e "$(gp) " && return 
   	[[ ${REPLY} == m ]] && echo -e "$(gp) " && return 
   	[[ ${REPLY} == u ]] && echo -e "$(gp) " && return 
   	[[ ${REPLY} == q ]] && echo -e "$(gp) " && return
   	echo -e "$(gp) $(tput setaf $(shuf -i 21-227))Invalid command $(tput setaf $(shuf -i 21-227))($(tput setaf $(shuf -i 21-227))-$(tput setaf $(shuf -i 21-227)):" 
fi


}

header

while true
	do
		read -s -r -p "$(header)" -n 1
		 [[ ${REPLY} == q ]] && echo -e "\\n\\n${BLUE}bye!\\n\\n" && killall -1 $player && break || clear 
	done
	


