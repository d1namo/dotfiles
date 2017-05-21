dirc=$HOME/.colors/dircolors
test -r $dirc && eval "$(dircolors $dirc)"
export BROWSER="chromium"
bindkey -v

RANGER_LOAD_DEFAULT_RC=FALSE

HISTFILE=$HOME/.zsh_history
HISTSIZE=500
SAVEHIST=500

POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator background_jobs time)
source $HOME/.colors/powerlevel9k/powerlevel9k.zsh-theme

autoload -Uz compinit up-line-or-beginning-search down-line-or-beginning-search
compinit
#_comp_options+=(globdots)
zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

setopt autocd
setopt COMPLETE_ALIASES
setopt HIST_IGNORE_DUPS

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

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

# Colour man pages
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}
