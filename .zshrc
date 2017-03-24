d=.colors/dircolors
test -r $d && eval "$(dircolors $d)"
RANGER_LOAD_DEFAULT_RC=FALSE 
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

autoload -Uz compinit promptinit
compinit
promptinit
zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
setopt HIST_IGNORE_DUPS
setopt autocd
setopt COMPLETE_ALIASES

# some ls aliases
alias ll='ls -Ahl --group-directories-first'
alias la='ls -Ah --group-directories-first'
alias l='ls -lCh --group-directories-first --color=auto'
alias ls='ls -lh --group-directories-first --color=auto'
alias yt='youtube-dl -o "%(title)s.%(ext)s"'
alias up='sudo pacman -Syu ; cower -uvdd ; pkill -RTMIN+3 i3blocks'
alias cl='clear'
alias vi='vim'
alias mini='ssh dean@mini'
alias router='ssh admin@192.168.1.1'
alias pi='ssh pi@retropie'
alias printeron='sudo systemctl start org.cups.cupsd'
alias printeroff='sudo systemctl stop org.cups.cupsd'
