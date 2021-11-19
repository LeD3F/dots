#PATH
set -e fish_user_paths
set -U fish_user_paths $HOME/bin $fish_user_paths

#Settings
set fish_greeting
set TERM "xterm-256color"
set EDITOR "vim"

#Manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

#Aliases
#Bat as cat
alias cat="bat"

#Confirmation before overwriting
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# termbin
alias tb="nc termbin.com 9999"

#Colorized grep output
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#Some stuff
alias less='bat'
alias l='exa -lahF --color=always --icons --sort=size --group-directories-first'
alias ls='exa -lhF --color=always --icons --sort=size --group-directories-first'
alias lst='exa -lahFT --color=always --icons --sort=size --group-directories-first'

#Rick Roll
alias rick='curl -s -L http://bit.ly/10hA8iC | bash'

#Rxfetch info
rxfetch
