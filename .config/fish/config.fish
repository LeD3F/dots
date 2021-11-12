fish_add_path -P $HOME/bin
set fish_greeting

#Aliases
alias cat="bat"
alias cp='cp -i'
alias grep='grep --color=auto'
alias less='bat'
alias l='exa -lahF --color=always --icons --sort=size --group-directories-first'
alias ls='exa -lhF --color=always --icons --sort=size --group-directories-first'
alias lst='exa -lahFT --color=always --icons --sort=size --group-directories-first'

if status is-interactive
    rxfetch
    # Commands to run in interactive sessions can go here
end
