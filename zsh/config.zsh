export CLICOLOR=true
export LSCOLORS="exfxcxdxbxegedabagacad"
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt PROMPT_SUBST
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

# random stuff
unsetopt beep
setopt auto_cd

# configure history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt inc_append_history
setopt extended_history
setopt share_history

# configure completition
autoload -Uz compinit
compinit
setopt no_complete_aliases
unsetopt correct_all

# configure cd -1, cd -2,...
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' menu select

zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Allow arrow up to go up in history
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search

