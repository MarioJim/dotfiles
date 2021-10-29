#!/bin/sh

cd

# Setup dotfiles
mkdir -p .config/Code/User
mkdir -p git/Mario
pushd git/Mario > /dev/null
git clone https://github.com/MarioJim/dotfiles.git
pushd dotfiles > /dev/null
stow -v -R -t ~ .
popd > /dev/null
popd > /dev/null

# Setup rust toolchain
rustup toolchain install stable

# Setup paru
mkdir -p git/Morganamilo
pushd git/Morganamilo > /dev/null
git clone https://aur.archlinux.org/paru.git
pushd paru > /dev/null
makepkg -si
popd > /dev/null
popd > /dev/null

# Install aur packages
paru -S bottom dragon-drag-and-drop espanso fuzzy-pdf google-chrome   \
    i3lock-color neovim-plug oh-my-zsh-git picom-git polybar spotify  \
    touchegg-git ttf-google-fonts-git visual-studio-code-bin          \
    xidlehook zoom

# Open nvim and install the plugins with ":PlugInstall"
