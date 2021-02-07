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

alias cat="bat"
alias clip="xclip -selection clipboard"
alias fp="fuzzy-pdf . \"zathura {} --find={q}\""
alias ls="exa -al"
alias yay="paru"
alias yy="paru -Syu --devel"
alias zat="zathura --fork"

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

# Clone repo in ~/GitHub/$USER/$REPO and cd into it
unalias gcl
gcl() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 REPO" >&2
        return 1
    fi

    # Try extracting the directory with the git protocol first
    DIR=$(echo "$1" | sed 's/git@.*:\(.*\)\.git/\1/')
    if [ "$1" = "$DIR" ]; then
        # Try extracting it with the http protocol
        DIR=$(echo "$1" | sed 's/https\?:\/\/.*\/\(.*\/.*\)\.git/\1/')
    fi
    if [ "$1" = "$DIR" ]; then
        # Else, exit the function
        echo "Git protocol not recognized, aborting..."  >&2
        return 1
    fi

    ABS_DIR="$HOME/GitHub/$DIR"
    if [ -d "$ABS_DIR" ]; then
        echo "Repository already exists"
    else
        git clone --recurse-submodules "$1" "$ABS_DIR"
    fi

    cd "$ABS_DIR" || return 1
}

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
# Android vars
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Must be at the end of the .zshrc file
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

