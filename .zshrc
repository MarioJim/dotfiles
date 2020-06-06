export ZSH=$HOME/.config/oh-my-zsh

ZSH_THEME="agnoster"
HYPHEN_INSENSITIVE="true"
HIST_STAMPS="yyyy-mm-dd"
SAVEHIST=100000

plugins=(
    git
    vscode
    sudo
    zsh-syntax-highlighting
    zsh-autosuggestions
    extract
)

source $ZSH/oh-my-zsh.sh

alias ls="exa -al"
alias cat="bat"
alias zat="zathura --fork"
alias clip="xclip -selection clipboard"

# show hidden files in autocomplete
setopt globdots

# redefine prompt_context for hiding user@hostname
prompt_context () { }

export EDITOR='nvim'
export TERMINAL='kitty'
export IDISP='eDP1' EDISP='HDMI1'

# Install node modules globally to user (without sudo)
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix="$HOME/.node_modules"

