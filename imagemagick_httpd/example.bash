#!/usr/bin/env bash

Example4() {
############################################################
#   Requires imagemagick | see imagemagick.org
#
#   Example 4
#
#   Same as exampel 3 but added header() with html tags, 
#   Added functions msg1,msg2,msg3
#   And a green circle
#  
#   
#############################################################

	header() {
		shuf1=$(shuf -i 0-250 -n 1)
		shuf2=$(shuf -i 0-250 -n 1)
		shuf3=$(shuf -i 0-250 -n 1)
		echo "<htm><head><title>Example</title></head>
		<body style=\"background-color: rgb(${shuf1}, ${shuf2}, ${shuf3});\">"		

		}		
	header
			
	msg1() {
	# What to print
	var="Greeting\\\'s Earth People"
	size=50
	format=png
	font="/usr/share/fonts/X11/Type1/c0648bt_.pfb"
	# Do some math
	pdraw="13,$(($size))"
	psdraw="6,$size"
	m=$((${#var} * $size / 2))
	canvas=$(($size + $m))x$(($size * 5 - 20))		
		r=$(magick -size $canvas canvas:none -font "$font" -pointsize $size \
		-draw "fill limegreen  circle 100,100 120,10" \
		-draw "text $psdraw \'$var\'" \
		-channel RGBA -blur 0x4 -stroke black -fill darkred -draw "text $pdraw \'$var\'" +repage ${format}: | openssl enc -base64)
		echo "<img style=\"display: block; margin-left: auto; margin-right:
		auto; width: 60%; border-style: hidden;\" src=\"data:image/gif;base64,${r}\">"
		}		
	msg1
	msg2() {
	# What to print
	var="We\\\'ve come to ask you a very important quesetion!"
	size=50
	format=png
	font="/usr/share/fonts/X11/Type1/c0648bt_.pfb"
	# Do some math
	pdraw="13,$(($size))"
	psdraw="6,$size"
	m=$((${#var} * $size / 2))
	canvas=$(($size + $m))x$(($size * 2 - 20))		
		r=$(magick -size $canvas canvas:none -font "$font" -pointsize $size \
		-draw "text $psdraw \'$var\'" \
		-channel RGBA -blur 0x4 -stroke black -fill darkred -draw "text $pdraw \'$var\'" +repage ${format}: | openssl enc -base64)
		echo "<img style=\"display: block; margin-left: auto; margin-right:
		auto; width: 70%; border-style: hidden;\" src=\"data:image/gif;base64,${r}\">"
		}		
	msg2
			
	msg3() {
	# What to print
	var="That is we want to know the price in eggs in Alaska."
	size=50
	format=png
	font="/usr/share/fonts/X11/Type1/c0648bt_.pfb"
	# Do some math
	pdraw="13,$(($size))"
	psdraw="6,$size"
	m=$((${#var} * $size / 2))
	canvas=$(($size + $m))x$(($size * 2 - 20))		
		r=$(magick -size $canvas canvas:none -font "$font" -pointsize $size \
		-draw "text $psdraw \'$var\'" \
		-channel RGBA -blur 0x4 -stroke black -fill darkred -draw "text $pdraw \'$var\'" +repage ${format}: | openssl enc -base64)
		echo "<img style=\"display: block; margin-left: auto; margin-right:
		auto; width: 70%; border-style: hidden;\" src=\"data:image/gif;base64,${r}\">"
		}		
	msg3
					
										
echo "</body></html>"
}
Example4

Example3() {
############################################################
#   Requires imagemagick | see imagemagick.org
#
#   Example 3
#
#   This example removes the for str ; do ; blah  and just prints a long $var
#   Also does away with saving files to disk and uses image magicks pipe option
#   Also trys to readjust the canvas size according to the the font size.
#  
#   
#############################################################

 
# What to print
var="Testing one two three"

# This needs some works
#var="Testing one two three
#four five six."

#Font size, format and font.
# Not all fonts work and you may not have this one installed.
size=100
format=png
font="/usr/share/fonts/X11/Type1/c0648bt_.pfb"

# Do some math
pdraw="1,$(($size))"
psdraw="1,$size"
m=$((${#var} * $size / 2))
canvas=$(($size + $m))x$(($size * 2 - 20))

	out() {
	
		shuf1=$(shuf -i 0-250 -n 1)
		shuf2=$(shuf -i 0-250 -n 1)
		shuf3=$(shuf -i 0-250 -n 1)
		echo "<body style=\"background-color: rgb(${shuf1}, ${shuf2}, ${shuf3});\">"		
		r=$(magick -size $canvas canvas:none -font "$font" -pointsize $size -draw "text $psdraw \'$var\'" \
		-channel RGBA -blur 0x3 -stroke black -fill darkred -draw "text $pdraw \'$var\'" +repage ${format}: | openssl enc -base64)
		echo "<img style=\"float: left; border-style: hidden;\" src=\"data:image/gif;base64,${r} \">"

		}
		
			out	
			
echo "</body></html>"
}
#Example3

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
#Example1


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


