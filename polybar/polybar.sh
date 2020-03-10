#!/usr/bin/sh
# If you don't run with sh (ie. with zsh) scripts don't give any output idk why
SHELL=$(which sh)
polybar -r -c .config/polybar/minimal.ini date &
polybar -r -c .config/polybar/minimal.ini info &
