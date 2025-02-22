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
[[ ! -d $ZSH_CACHE_DIR ]] && mkdir $ZSH_CACHE_DIR

source "$ZSH/oh-my-zsh.sh"

# alias `cat`
[[ "$(command -v batcat)" ]] && alias cat="batcat"
[[ "$(command -v bat)" ]] && alias cat="bat"
# alias `cp`
[[ "$(command -v rsync)" ]] && alias cp="rsync -ah --info=progress2"
# alias `ls`
[[ "$(command -v eza)" ]] && alias ls="eza -al"
# alias `pp`
[[ "$(command -v apt)" ]] && alias pp="sudo apt update && sudo apt upgrade && sudo apt autoremove"
[[ "$(command -v pacman)" ]] && alias pp="sudo pacman -Syu"
[[ "$(command -v paru)" ]] && alias pp="paru"
# alias `ssh`
[[ "$TERM" = "xterm-kitty" ]] && alias ssh="kitty +kitten ssh"

# add my scripts to PATH
PATH="$HOME/scripts:$PATH"

setopt always_to_end          # when completing a word, move the cursor to the end of the word
setopt auto_list              # automatically list choices on ambiguous completion
setopt auto_pushd             # make cd push each old directory onto the stack
setopt extended_history       # save each command's beginning timestamp and duration to the history file
setopt glob_dots              # dot files included in regular globs
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_find_no_dups      # when searching history don't show results already cycled through twice
setopt histignorespace        # remove commands from the history when the first character is a space
setopt inc_append_history     # save history entries as soon as they are entered
setopt longlistjobs           # display PID when suspending processes as well
setopt no_beep                # silence all bells and beeps
setopt notify                 # report the status of backgrounds jobs immediately
setopt share_history          # share history between different instances of the shell

# hide the user@host if logged in as myself locally
DEFAULT_USER="mario"

# make cd listen to multiple dots aliases
rationalise-dot() {
    if [[ $LBUFFER = *.. ]]; then
        LBUFFER+=/..
    else
        LBUFFER+=.
    fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

# enable vi-mode
bindkey -v

# clone repo in ~/git/$USER/$REPO and cd into it
unalias gcl
gcl() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 REPO" >&2
        return 1
    fi

    # try extracting the directory with the git protocol first
    DIR=$(echo "$1" | sed 's/git@.*:\(.*\)\.git/\1/')
    if [ "$1" = "$DIR" ]; then
        # try extracting it with the http protocol
        DIR=$(echo "$1" | sed 's/https\?:\/\/.*\/\(.*\/.*\)\.git/\1/')
    fi
    if [ "$1" = "$DIR" ]; then
        # else, exit the function
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

# load zsh plugins
ZSH_PLUGINS_PATH="/usr/share/zsh/plugins"
[[ ! -d "$ZSH_PLUGINS_PATH" ]] && ZSH_PLUGINS_PATH="/usr/share"
ZSH_AUTOSUG_PATH="$ZSH_PLUGINS_PATH/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -f "$ZSH_AUTOSUG_PATH" ]] && source "$ZSH_AUTOSUG_PATH"
ZSH_SYNTAX_HIGHL_PATH="$ZSH_PLUGINS_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -f "$ZSH_SYNTAX_HIGHL_PATH" ]] && source "$ZSH_SYNTAX_HIGHL_PATH"

