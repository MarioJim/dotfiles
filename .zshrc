DISABLE_MAGIC_FUNCTIONS=true
ZSH="/usr/share/oh-my-zsh"
[[ ! -d "$ZSH" ]] && ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
HYPHEN_INSENSITIVE="true"
HIST_STAMPS="yyyy-mm-dd"
SAVEHIST=100000

plugins=(
    git
    vscode
    sudo
    extract
    docker
    docker-compose
)

ZSH_CACHE_DIR="$HOME/.cache/oh-my-zsh"
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source "$ZSH/oh-my-zsh.sh"

alias cat="bat"
alias cp="rsync -ah --info=progress2"
alias clip="xclip -selection clipboard"
alias fp="fuzzy-pdf . \"zathura {} --find={q}\""
alias ls="exa -al"
alias pp="paru"
alias zat="zathura --fork"
alias hx="helix"
if [ "$TERM" = "xterm-kitty" ]; then
    alias ssh="kitty +kitten ssh"
fi

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

# Enable vi-mode
bindkey -v

# Clone repo in ~/git/$USER/$REPO and cd into it
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

    ABS_DIR="$HOME/git/$DIR"
    if [ -d "$ABS_DIR" ]; then
        echo "Repository already exists"
    else
        git clone --recurse-submodules "$1" "$ABS_DIR"
    fi

    cd "$ABS_DIR" || return 1
}

export EDITOR='nvim'
export TERMINAL='kitty'

# Add Python user packages to path
PATH="$HOME/.local/bin:$PATH"
# Add Go user packages to path
PATH="$HOME/go/bin:$PATH"
# Add JavaScript user packages to path
PATH="$HOME/.node_modules/bin:$PATH"
# Add Dart user packages on path
PATH="$HOME/.pub-cache/bin:$PATH"
export npm_config_prefix="$HOME/.node_modules"
# Android vars
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
# Enable Docker Buildkit
export DOCKER_BUILDKIT=1
#  Enable rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Must be at the end of the .zshrc file
ZSH_PLUGINS_PATH="/usr/share/zsh/plugins"

ZSH_AUTOSUG_PATH="$ZSH_PLUGINS_PATH/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ ! -f "$ZSH_AUTOSUG_PATH" ]] && ZSH_AUTOSUG_PATH="/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -f "$ZSH_AUTOSUG_PATH" ]] && source "$ZSH_AUTOSUG_PATH"

ZSH_SYNTAX_HIGHL_PATH="$ZSH_PLUGINS_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ ! -f "$ZSH_SYNTAX_HIGHL_PATH" ]] && ZSH_SYNTAX_HIGHL_PATH="/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -f "$ZSH_SYNTAX_HIGHL_PATH" ]] && source "$ZSH_SYNTAX_HIGHL_PATH"

