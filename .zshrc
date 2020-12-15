DISABLE_MAGIC_FUNCTIONS=true
ZSH=/usr/share/oh-my-zsh/

ZSH_THEME="agnoster"
HYPHEN_INSENSITIVE="true"
HIST_STAMPS="yyyy-mm-dd"
SAVEHIST=100000

plugins=(
    git
    vscode
    sudo
    extract
)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

alias ls="exa -al"
alias cat="bat"
alias zat="zathura --fork"
alias clip="xclip -selection clipboard"
alias yy="yay -Syu --devel"

# add my scripts to PATH
PATH="$HOME/scripts:$PATH"

# show hidden files in autocomplete
setopt globdots

# redefine prompt_context for hiding user@hostname
prompt_context () { }

# Make cd listen to multiple dots aliases
rationalise-dot() {
    if [[ $LBUFFER = *.. ]]; then
        LBUFFER+=/..
    else
        LBUFFER+=.
    fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

export EDITOR='nvim'
TERMINAL='kitty'
IDISP='eDP1'
EDISP='HDMI1'

# Python user installed modules
PATH="$HOME/.local/bin:$PATH"
# Go user installed modules
PATH="$HOME/go/bin:$PATH"
# Install node modules globally to user (without sudo)
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix="$HOME/.node_modules"

function fp() {
    fuzzy-pdf "$1" "zathura {} --find={q}"
}

# Must be at the end of the .zshrc file
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

