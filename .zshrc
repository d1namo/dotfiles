HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=500
bindkey -v

autoload -Uz compinit promptinit
zstyle :compinstall filename '~/.zshrc'

compinit
promptinit
setopt HIST_IGNORE_DUPS
setopt autocd
setopt COMPLETE_ALIASES
#setopt correctall

# some ls aliases
alias ll='ls -Ahl --group-directories-first'
alias la='ls -Ah --group-directories-first'
alias l='ls -lCh --group-directories-first --color=auto'
alias ls='ls -lh --group-directories-first --color=auto'
alias yt='youtube-dl -o "%(title)s.%(ext)s"'
alias up='sudo pacman -Syu ; cower -uvdd'
alias cl='clear'
alias iplog='journalctl -k | grep "IN=.*OUT=.*" | less'
alias mini='ssh dean@mini'
alias i3shot='montage *.png -geometry +0+0 -tile x2 myi3.png'
