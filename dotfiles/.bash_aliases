#!/usr/bin/env bash
# -------------------------
# --    .bash_aliases    --
# -------------------------

# Alias list
alias aliases='cat ~/.bash_aliases | more'

# Quick Shell Changing
alias bash-shell='chsh -s /bin/bash' # Use bash
alias zsh-shell='chsh -s /bin/zsh' # Use zsh
alias see-shells='cat /etc/shells' # See a list of included shells you can use

# For a courteous super-user; no need to be excessively proud or self-confident
alias please='sudo '
# Also because this team of one is an idiod *t
alias sodu='sudo '
alias sodo='sudo '
alias sdoo='sudo '
alias sudu='sudo '
alias sduo='sudo '

# Reloading / Refreshing the .bash_aliases and .bash_functions
alias reload='source ~/dotfiles/.bash_aliases && source ~/dotfiles/.bash_functions && printf "%b" "\e[1;34m.bash_aliases\e[0m and \e[1;34m.bash_functions\e[0m have been reloaded.\n"'

# Easier navigation: .., ..., ...., .....
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'

# mv, rm, cp, mkdir - Verbose Mode by default
alias mv='mv -v'
alias rm='rm -v'
alias cp='cp -v'
alias mkdir="mkdir -pv"
#                   │└─ list created directories
#                   └─ create intermediate directories

# File size
alias fs="stat -f \"%z bytes\""

# Window size
alias getsize='printf "%b" "The current size of your terminal ... behold ... Columns: \e[1;34m$(tput cols)\e[0m Rows: \e[1;34m$(tput lines)\e[0m"'

# Shortcuts: Directories (listing)
# A = include hidden (but not . or ..), F = put `/` after folders, h = human byte unit suffixes
if [[ "$(uname -s)" == "Linux" ]]; then
	alias ls='ls --color -hNF --group-directories-first' # For Ubuntu distros
else
	alias ls='gls --color -hNF --group-directories-first' # Requires `gls` command (coreutils), homebrew
fi
alias ll='ls -l'
alias la='ls -lA'
alias l='ls -CA'

# DNS
alias {showdns,dnsinfo}='scutil --dns | grep nameserver' # Show the currently-used DNS entries

# Shortcuts: Directories (navigation)
alias q='exit'
alias d='cd ~/.dotfiles'
alias b='cd ~/.dotfiles/bin'
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias doc='cd ~/Documents'
alias g='cd ~/'

# Shortcuts: Commands (laziness
alias k9='kill -9'
alias date='gdate ' # gdate --version Should be (GNU coreutils) 9.1 or greater
[[ "$(uname -s)" == "Linux" ]] && alias subl='rsub' # Install rsub using apt to locally open files with Sublime Text

# Last time file opened/accessed
# @see https://unix.stackexchange.com/questions/8840/last-time-file-opened
# So, generally, what you want to see is the atime of a file. You can get
# that with stat or with ls. You can use ls -lu to do this, although I prefer
# to use ls -l --time=atime (which should be supported in almost all modern
# Linux distributions) because I don't use it often, and when I do I can
# remember this alias better. And to sort by time, I added the -t flag to ls.
alias fo="ls -lt --time=atime"

# Computer & Connection Testing (Requires python to be installed)
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'























