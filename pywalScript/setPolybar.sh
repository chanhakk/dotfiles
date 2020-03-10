#!/usr/bin/bash
source /home/hakki/Technic/sandboxenv/bin/activate

dateColor=$(python3.8 /home/hakki/.config/pywalScript/getLuminance-argb.py $1)
workColor=$(python3.8 /home/hakki/.config/pywalScript/getLuminance-argb.py $2)
infoColor=$(python3.8 /home/hakki/.config/pywalScript/getLuminance-argb.py $3)

echo -e "[color]\ndatefg = #$dateColor\nworkfg = #$workColor\ninfofg = #$infoColor" >| /home/hakki/.config/polybar/color.ini
