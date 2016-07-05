HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=500
bindkey -v

zstyle :compinstall filename '/home/dean/.zshrc'

autoload -Uz compinit promptinit zmv
compinit
promptinit

setopt HIST_IGNORE_DUPS
setopt autocd
#setopt correctall

# some ls aliases
alias ll='ls -Ahl --group-directories-first'
alias la='ls -Ah --group-directories-first'
alias l='ls -lCh --group-directories-first --color=auto'
alias ls='ls -lh --group-directories-first --color=auto'
alias yt='youtube-dl -o "%(title)s.%(ext)s"'
alias up='sudo pacman -Syu ; cower -uvd'
alias sprunge='curl -F "sprunge=<-" http://sprunge.us'
alias ix='curl -F "f:1=<-" ix.io'
alias cl='clear'
alias sshbf='sudo cat /proc/net/xt_recent/sshbf'
alias iplog='journalctl -k | grep "IN=.*OUT=.*" | less'
alias mini='ssh dean@mini'
alias miniremote='ssh -p 12414 dean@cuntface.airdns.org'
