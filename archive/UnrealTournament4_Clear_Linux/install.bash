#!/bin/bash
file=UnrealTournament-Client-XAN-3525360-Linux.zip
download=https://s3.amazonaws.com/unrealtournament/ShippedBuilds/%2B%2BUT%2BRelease-Next-CL-3525360/${file}

curl -O ${download}

unzip $file


