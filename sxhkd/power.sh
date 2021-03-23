#!/bin/sh

poweroff=~/.local/share/audio/ui/NFCFailure.ogg

case "$(printf "suspend\\nlogout\\nreboot\\npoweroff" | dmenu -nb '#000000' -sf '#f8f8f2' -sb '#6272a4' -nf '#f8f8f2' -fn 'hack nerd font:size=9' -i -p "Power:")" in
	suspend) paplay $poweroff; systemctl suspend ;;
	logout) paplay $poweroff; bspc quit ;;
	reboot) paplay $poweroff; systemctl reboot ;;
	poweroff) paplay $poweroff; systemctl poweroff ;;
esac
