#!/usr/bin/env bash
# -------------------------
# --    .bash_profile    --
# -------------------------

# Set the public IP at the start of the session
export PUBLIC_IP=$(curl -4 ifconfig.me 2>/dev/null)

# Use nano as the default editor (crontab -e and such)
export EDITOR=/usr/bin/nano

# Prompt Coloring
export CLICOLOR=1
color_prompt=yes

# OK a real gangsta prompt
# from: https://github.com/barryclark/bashstrap/blob/master/.bash_profile
### Prompt Colors
# Modified version of @gf3's Sexy Bash Prompt
# (https://github.com/gf3/dotfiles)
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
	tput sgr0
	if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
		MAGENTA=$(tput setaf 9)
		ORANGE=$(tput setaf 172)
		GREEN=$(tput setaf 190)
		PURPLE=$(tput setaf 141)
	else
		MAGENTA=$(tput setaf 5)
		ORANGE=$(tput setaf 4)
		GREEN=$(tput setaf 2)
		PURPLE=$(tput setaf 1)
	fi
	BOLD=$(tput bold)
	RESET=$(tput sgr0)
else
	MAGENTA="\033[1;31m"
	ORANGE="\033[1;33m"
	GREEN="\033[1;32m"
	PURPLE="\033[1;35m"
	BOLD=""
	RESET="\033[m"
fi

export MAGENTA
export ORANGE
export GREEN
export PURPLE
export BOLD
export RESET

# Building new colors - Gradient Grays
color_number="236"
color_mixer='\033[38;5;'"$color_number"m""
GRAY0="$color_mixer"

color_number="238"
color_mixer='\033[38;5;'"$color_number"m""
GRAY1="$color_mixer"

color_number="240"
color_mixer='\033[38;5;'"$color_number"m""
GRAY2="$color_mixer"

color_number="242"
color_mixer='\033[38;5;'"$color_number"m""
GRAY3="$color_mixer"

color_number="244"
color_mixer='\033[38;5;'"$color_number"m""
GRAY4="$color_mixer"

color_number="246"
color_mixer='\033[38;5;'"$color_number"m""
GRAY5="$color_mixer"

color_number="248"
color_mixer='\033[38;5;'"$color_number"m""
GRAY6="$color_mixer"

color_number="250"
color_mixer='\033[38;5;'"$color_number"m""
GRAY7="$color_mixer"

color_number="252"
color_mixer='\033[38;5;'"$color_number"m""
GRAY8="$color_mixer"

color_number="22"
color_mixer='\033[38;5;'"$color_number"m""
GREEN0="$color_mixer"

color_number="28"
color_mixer='\033[38;5;'"$color_number"m""
GREEN1="$color_mixer"

color_number="34"
color_mixer='\033[38;5;'"$color_number"m""
GREEN2="$color_mixer"

color_number="40"
color_mixer='\033[38;5;'"$color_number"m""
GREEN3="$color_mixer"

color_number="46"
color_mixer='\033[38;5;'"$color_number"m""
GREEN4="$color_mixer"

# Change this symbol to something sweet.
# (http://en.wikipedia.org/wiki/Unicode_symbols)
# symbol="⚡ "
# symbol="\[${GRAY1}\]⟹   "
# symbol="\[${BWHITE}\]⋟ "
symbol="\[${GRAY1}\]> "

#export PS1="\[${MAGENTA}\]\u \[$RESET\]in \[$GREEN\]\w\[$RESET\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$RESET\]\n$symbol\[$RESET\]"
#export PS2="\[$ORANGE\]→ \[$RESET\]"
##########export PS1="\[${MAGENTA}\]\u \[$RESET\]in \[$GREEN\]\w\[$RESET\] on \[$PURPLE\]\h\[$RESET\] $symbol\[$RESET\]"
# userelite="${GRAY1}${USER:0:1}\
# ${GRAY2}${USER:1:1}\
# ${GRAY3}${USER:2:1}\
# ${GRAY4}${USER:3:1}\
# ${GRAY5}${USER:4}"
# export PS1="\[${GREEN1}\]${userelite} \[$RESET\]in \[$GREEN4\]\w\[$RESET\] on \[$GREEN1\]\h\[$RESET\] $symbol\[$RESET\]"
# export PS1="\[${GREEN1}\]\u \[$RESET\]in \[$GREEN4\]\w\[$RESET\] on \[$GREEN1\]\h\[$RESET\]$symbol\[$RESET\]"
export PS1="\[${GREEN1}\]\u \[$RESET\]in \[$GREEN4\]\w\[$RESET\] on \[$GREEN1\]$PUBLIC_IP\[$RESET\]$symbol\[$RESET\]"
