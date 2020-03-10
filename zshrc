# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hakki/.zshrc'

autoload -Uz promptinit
promptinit
# End of lines added by compinstall

PATH=$PATH:~/.local/bin

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Color VConsole
if [ "$TERM" = 'linux' ]; then
	BASE16_SHELL="~/.prezto/shell_color/vconsole"
	[[ -s "$BASE16_SHELL" ]] && source "$BASE16_SHELL"
fi

# Customize to your needs...

# Functions

function sleep_until {
  seconds=$(( $(date -d "$*" +%s) - $(date +%s) )) # Use $* to eliminate need for quotes
  echo "Sleeping for $seconds seconds"
  sleep $seconds
}

function mountiphone {
	idevicepair pair
	ifuse "$1"
}

# Set enviroment vars
export _JAVA_AWT_WM_NONREPARENTING=1
export MPD_PORT=6645

# Aliases
disable r
alias meow="cat"
alias youtube-s="youtube-dl -x --format mp3"
alias niggaplease='eval "sudo $(fc -ln -1)"'
alias pysandbox="source ~/Technic/sandboxenv/bin/activate"
alias serveossh="autossh -M 0 -R jupiter:22:localhost:22 serveo.net"
alias serveoftp="autossh -M 0 -R jupiter:21:localhost:2121 serveo.net"
alias yt="youtube-dl --add-metadata -i -o '%(upload_date)s-%(title)s.%(ext)s'"
alias yta="yt -x -f bestaudio/best"
alias multimon-u="multimon-ng -s DUMPCSV -s UFSK1200 -s MORSE_CW"
alias multimon-afsk="multimon-ng -c -a AFSK1200"
alias lowlight="xbacklight -set 1"
alias fehs="feh --scale-down"
alias xalnow="xautolock -locker '/home/hakki/.config/i3locksimp' -time 15 -corners '00+-'"
alias terraria="~/Games/Native/Terraria/start.sh"
