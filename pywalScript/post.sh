#!/usr/bin/bash
source /home/hakki/.cache/wal/colors.sh

# Startup page
echo "\${color $background}" >| /home/hakki/.cache/wal/colors-conky.txt
cp /home/hakki/.cache/wal/colors.css /home/hakki/Technic/github/chanhakk.github.io/colors.css

# Bspwm colors
bspc config focused_border_color $color1
bspc config normal_border_color $color0
bspc config presel_feedback_color $color1

# Polybar colors

tmpdir=/tmp/polybarFontBackground
mkdir $tmpdir

convert "$wallpaper" -resize "1366x768^" -gravity center -extent "1366x768" /tmp/polybarFontBackground/wall.png

# Date background
convert $tmpdir/wall.png -crop 236x24+28+27 $tmpdir/date.png

# Workspace background
convert $tmpdir/wall.png -crop 38x26+35+710 $tmpdir/work.png

# Info background
convert $tmpdir/wall.png -crop 329x25+1010+710 $tmpdir/info.png

/home/hakki/.config/pywalScript/setPolybar.sh $tmpdir/date.png $tmpdir/work.png $tmpdir/info.png

rm -rf $tmpdir/*

killall -q polybar
notify-send "Done"
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -r -c ~/.config/polybar/minimal.ini date &
polybar -r -c ~/.config/polybar/minimal.ini info &
