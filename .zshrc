# Path to your oh-my-zsh installation.
export ZSH="/home/mario/.oh-my-zsh"

# Set name of the theme to load --- https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=3

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
    git
    vscode
    sudo
    zsh-syntax-highlighting
    zsh-autosuggestions
    extract
)

source $ZSH/oh-my-zsh.sh

# User configuration
SAVEHIST=100000

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
alias ls="exa -al"
alias cat="bat"
alias zat="zathura --fork"

# show hidden files in autocomplete
setopt globdots

# redefine prompt_context for hiding user@hostname
prompt_context () { }

# Preferred editor
export EDITOR='nvim'
# Preferred terminal
export TERMINAL='kitty'
# Screen names
export IDISP='eDP1' EDISP='HDMI1'

# Install globally to user (without sudo)
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix="$HOME/.node_modules"

