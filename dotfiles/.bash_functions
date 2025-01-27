#!/usr/bin/env bash
# ---------------------------
# --    .bash_functions    --
# ---------------------------

#
# bash_functions help
#
# functions - display a summary of custom user functions
# usage: functions
functions() {
	cat "${HOME}/olatools/dotfiles/.bash_functions" | grep -B 1 usage
}

################################################################################
#
# Navigation and Basic Operations
#
################################################################################

# lcd - change to specified directory and immediately list its contents
# usage: lcd <directory>
lcd() {
	cd "$@" && ll
}

# bak - backup selected file; it appends .broen extension (instead of .bak)
# usage: bak <filename>
bak() {
	cp $1{,.broen}
}

# wfs - watch a file's size, update every n seconds
# usage: wfs <filename>
wfs() {
	watch -n 5 "ls -lh \"$1\" | awk '{print \$5}'"s
}

################################################################################
#
# Find, Search and Grep (Global Regular Expression Print)
#
################################################################################

# fp - find a file by name in current working directory
# usage: fp <name>
fp() {
	sudo find . -iname '*'$*'*' -ls
}

# fr - find a file by name globally
# usage: fr <name>
fr() {
	sudo find / -iname '*'$*'*' -ls
}

# fext - find files by extension in current working directory
# usage: fext <txt>
fext() {
	# sort -f flag for sort ignores case, cut -d flag sets delimiter as "/"
	find . -type f -maxdepth 1 -name "*.$1" | sort -f | cut -d "/" -f 2
}

# fcd - find a file by name in selected path
# usage: fcd <name> <path>
fcd() {
	sudo find $2 -iname '*'$1'*' -ls
}

# fpg - find a file by grepping in current working directory
# usage: fpg <word>
fpg() {
	sudo grep --color=auto -HIrFo -- $* .
}

# frg - find a file by grepping in rootv (searches by grepping for passed string in each file)
# usage: frg <word>
frg() {
	sudo grep --color=auto -HIrFo -- $* /
}

# fcdg - find a file by grepping in selected path
# usage: fcdg <word> <path>
fcdg() {
	sudo grep --color=auto -HIrFo -- $1 $2
}

# mang - search in man page
# usage: mang <manpage> <word>
mang() {
	man $1 | grep --color=auto $2 -C 5
}

# hig - search in history
# usage: hig <word>
hig() {
	history | grep --color=auto $* -C 5
}

# @see https://stackoverflow.com/questions/16956810/how-to-find-all-files-containing-a-specific-text-string-on-linux
# fstring - search contents of all files in current directory for string
# usage: fstring <string>
fstring() {
	if [[ -z "$1" ]] ; then
		echo "This command requires parameters."
		echo "usage: fstring <string>"
		return 1
	fi
	grep -Ril "$1" .
	# i stands for ignore case (optional in your case).
	# R stands for recursive.
	# l stands for "show the file name, not the result itself".
	# . stands for starting at the current directory.
}

# psg - check if a process is running by name and return PID(s)
# usage: psg <process-name>
psg() {
	if ps ax | grep -v grep | grep $1 > /dev/null
	then
		ps ax | grep --color=auto $1 | grep -v grep
	else
		echo "$1 is not running"
	fi
}

################################################################################
#
# CLI Command Line Utilities
#
################################################################################

# calc - basic calculator
# usage: calc <expression>
calc() {
	echo "scale=2; $1" | bc # scale is how many decimal points you want
}

# myip - get the current IP addresses
# usage: myip
myip() {
	# External/Public IP
	PUBLIC_CHECK_1=$(curl ipinfo.io/ip 2>/dev/null && echo)
	PUBLIC_CHECK_2=$(curl api.ipify.org 2>/dev/null && echo)

	# External/Public Reverse DNS Lookup
	DNS1=$(curl -s ipinfo.io/$(curl -s ipinfo.io/ip)/hostname)

	# Local IP
	LOCAL_CHECK_1=$(ipconfig getifaddr en0)
	LOCAL_CHECK_2=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')

	echo "Public IP Check 1: $PUBLIC_CHECK_1"
	echo "Public IP Check 2: $PUBLIC_CHECK_2"
	echo "---"
	echo "Reverse DNS Lookup | Hostname: $DNS1"
	echo "---"
	echo "Local Network IP Check 1: $LOCAL_CHECK_1"
	echo "Local Network IP Check 2: $LOCAL_CHECK_2"

	# @see https://superuser.com/questions/998854/how-to-redirect-stderr-to-both-file-and-console-and-stdout-to-file-only
	# command 2>&1 1>logfile | tee -a logfile

}

# @see https://www.outsideopen.com/the-colorful-magic-of-ccze/
# To read about the magic of ccze colorization
# log - view live and color logs
# usage: log <logname>
log() {
	sudo tail -f -n 50 $1 | ccze
}

# one-liner to delete all BUT n lines of text file (good for removing first billion lines of a log file)
# note that -10 is the number of lines to preserve (10), and myfile.txt is the name of the file to truncate.
# echo -e '1,-10d\nwq' | ed myfile.txt
# truncate - one-liner to delete all BUT n lines of a text file
# usage: truncate myfile.txt 10
truncate() {
	echo -e '1,-'$2'd\nwq' | ed $1
}
