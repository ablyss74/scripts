#!/usr/bin/env bash
## A little IRC server that doesn't do much
##

main () {
socat -v -lh TCP-LISTEN:6667,reuseaddr,crlf,fork SYSTEM:"
loop() {
	while true
		do	
			if [[ ! \$foo ]];then
				echo : 001 ${USER} :Welcome to the Internet Relay Network, $USER
				echo : 375 ${USER} :- LocalHost Message of the Day - 
				echo : 376 ${USER} :End of /MOTD command.
				echo :${USER} JOIN :#Test
				echo :Tester JOIN :#Test
				echo :Tester2 JOIN :#Test
				foo=bar
			fi
			sleep 35s && echo \: PONG LocalHost 60
		done
	}
loop
" 
}
# log
#main &> log.txt
main

