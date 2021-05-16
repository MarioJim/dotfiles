#!/bin/sh

# Connect to the internet (select network with iwctl, check with ping)

# Update system clock
timedatectl set-ntp true

# Partition the disk (cfdisk /dev/sda or cfdisk /dev/nvme0n1)

# Format the partitions (mkfs.ext4, mkfs.btrfs, mkswap)

# Mount the filesystems (mount /dev/... /mnt, swapon /dev/...)

# Select mirrors
echo "Server = https://mirror.osbeck.com/archlinux/$repo/os/$arch" > /etc/pacman.d/mirrorlist
echo "Server = https://arch.mirror.square-r00t.net/$repo/os/$arch" >> /etc/pacman.d/mirrorlist
echo "Server = https://arch.mirror.constant.com/$repo/os/$arch" >> /etc/pacman.d/mirrorlist

# Install packages
pacstrap -c /mnt base base-devel arc-gtk-theme arch-install-scripts bat clang \
    cmake discord docker dunst exa fd feh flameshot gcc gdb git gparted htop  \
    i3-gaps imagemagick intel-ucode inter-font keepassxc kitty lightdm        \
    lightdm-webkit-theme-litarvan linux-firmware linux-zen make man-db        \
    man-pages neofetch neovim network-manager-applet nodejs ntfs-3g           \
    otf-font-awesome papirus-icon-theme pavucontrol pipewire pipewire-pulse   \
    playerctl python-pillow python-pip qbittorrent ranger redshift ripgrep    \
    rofi rustup stow tokei tree ttf-fira-code vlc xdotool xclip               \
    xf86-video-intel xorg-server xorg-xbacklight xorg-xinput xorg-xmodmap     \
    xorg-xrandr xorg-xrdb yarn zathura zathura-pdf-poppler zip zsh            \
    zsh-autosuggestions zsh-completions zsh-syntax-highlighting

# Fstab
genfstab -U /mnt >> /mnt/etc/fstab
