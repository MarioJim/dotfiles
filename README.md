# dotfiles

Dotfiles from my Arch Linux installation

## Programs

### Window manager

- [i3-gaps](https://github.com/Airblader/i3): tiling window manager
- [picom](https://github.com/yshui/picom): compositor with kawase blur
- [polybar](https://github.com/polybar/polybar): way better than i3status
- [touchegg](https://github.com/JoseExposito/touchegg): enables touchpad gestures

### Terminal

- [kitty](https://github.com/kovidgoyal/kitty): terminal emulator
- [neovim](https://github.com/neovim/neovim): text editor
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh): zsh's config and styles
- [zsh](https://www.archlinux.org/packages/extra/x86_64/zsh/): shell

### GUI

- [dunst](https://github.com/dunst-project/dunst): shows notifications
- [feh](https://github.com/derf/feh): sets the wallpaper
- [rofi](https://github.com/davatorium/rofi): application launcher

### System config

- [blueman](https://www.archlinux.org/packages/community/x86_64/blueman/): bluetooth manager
- [espanso](https://github.com/federico-terzi/espanso): pastes accents for my US keyboard
- [flameshot](https://github.com/lupoDharkael/flameshot): screenshot tool
- [redshift](https://github.com/jonls/redshift): changes screen temperature
- [xidlehook](https://gitlab.com/jD91mZM2/xidlehook): auto lock the screen

### Fonts

- [otf-fira-code](https://www.archlinux.org/packages/community/any/otf-fira-code/): terminal
- [ttf-google-sans](https://aur.archlinux.org/packages/ttf-google-sans/): rofi and dunst
- [inter-font](https://www.archlinux.org/packages/community/any/inter-font/): polybar
- [otf-font-awesome](https://www.archlinux.org/packages/community/any/otf-font-awesome/): polybar

## Installation

- Clone the repo

```sh
$ git clone https://github.com/MarioJim/dotfiles.git
```

- cd to the folder

```sh
$ cd dotfiles
```

- Run GNU stow to symlink the repo to `~`

```sh
$ stow -v -R -t ~ .
```
