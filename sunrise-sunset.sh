#!/bin/bash

# First obtain a location code from: https://weather.codes/search/

# Insert your location. For example LOXX0001 is a location code for Bratislava, Slovakia
location="LOXX0001"
tmpfile=/tmp/$location.out

# Obtain sunrise and sunset raw data from weather.com
wget -q "https://weather.com/weather/today/l/$location" -O "$tmpfile"

SUNR=$(grep -Po '<p class="TwcSunChart--dateValue--TzXBr">\K\d+:\d+\d+ am' "$tmpfile")
SUNS=$(grep -Po '<p class="TwcSunChart--dateValue--TzXBr">\K\d+:\d+\d+ pm' "$tmpfile")


sunrise=$(date --date="$SUNR" +%R)
sunset=$(date --date="$SUNS" +%R)

# Use $sunrise and $sunset variables to fit your needs. Example:
echo "Sunrise for location $location: $sunrise"
echo "Sunset for location $location: $sunset"
