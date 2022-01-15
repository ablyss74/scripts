#!/usr/bin/env bash
Example1() {
############################################################
# 
#   This example encrypts and decrypts a image string
#   Requires imagemagick | see imagemagick.org
#   Probably a better way pipe stuff but it is what it is.
#   
#############################################################





#  Try to give each client a unique image ID.
d=$(date +%N)
d=($(md5sum <<< $d))
d=${d[0]}

## Format for the image || png for transparency || jpg for more common decoding clients.
format=png

	enc() {
		shuf1=$(shuf -i 0-250 -n 1)
		shuf2=$(shuf -i 0-250 -n 1)
		shuf3=$(shuf -i 0-250 -n 1)
		echo "<body style=\"background-color: rgb(${shuf1}, ${shuf2}, ${shuf3});\">"
		magick -size 550x75 canvas:none -font "/usr/share/fonts/X11/Type1/c0648bt_.pfb" -pointsize 75 -draw "text 25,60 \'$var\'" \
		-channel RGBA -blur 0x6 -fill yellow -stroke black -draw "text 30,55 \'$var\'"  /tmp/$var.$d.$format
		magick /tmp/$var.$d.$format -encipher passphrase.txt /tmp/$var.$d.$format		
		r=$(openssl enc -base64 -in /tmp/$var.$d.$format)
		echo "<img style=\"border-style: hidden;\" src=\"data:image/gif;base64,${r} \">"

	}
	dec() {
		
		magick /tmp/$var.$d.$format -decipher passphrase.txt /tmp/$var.$d.$format
		r=$(openssl enc -base64 -in /tmp/$var.$d.$format)
		echo "<img style=\"border-style: hidden;\" src=\"data:image/gif;base64,${r} \">"
	}
	
	str="U_R_SO_BAD!"
	
	for var in $str
		do 
			enc
			
		
		done
	echo "<br>"
	for var in $str
		do 
			
			dec
		
		done	
echo "</body></html>"
}
Example1


Example2() {
############################################################
# 
#   This example does not give the client a unique ID
#   It was my first attempt so gonna call version 1 :-)
#   
#   
#############################################################
	print1() {
		shuf1=$(shuf -i 0-250 -n 1)
		shuf2=$(shuf -i 0-250 -n 1)
		shuf3=$(shuf -i 0-250 -n 1)
		echo "<body style=\"background-color: rgb(${shuf1}, ${shuf2}, ${shuf3});\">"
		magick -size 150x75 canvas:none -font "/usr/share/fonts/X11/Type1/c0648bt_.pfb" -pointsize 75 -draw "text 25,60 \'$var\'" \
		-channel RGBA -blur 0x6 -fill yellow -stroke black -draw "text 30,55 \'$var\'" -trim +repage /tmp/$var.png
		magick /tmp/$var.png -encipher passphrase.txt /tmp/$var.png
		r=$(openssl enc -base64 -in /tmp/$var.png)
		echo "<img style=\"border-style: hidden;\" src=\"data:image/gif;base64,${r} \">"
	}


	for var in {A..Z} "-" {a..z} "-" {0..9} ":-)" 
		do 
			print1
		
		done
echo "</body></html>"
}
#Example2


