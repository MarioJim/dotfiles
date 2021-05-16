#!/bin/sh

# Time zone
ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
hwclock --systohc

# Localization
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# Network config
echo "arch" > /etc/hostname
cat >> /etc/hosts <<EOL
127.0.0.1     localhost
::1           localhost
127.0.1.1     arch.domain     arch
EOL

# Run `mkinitcpio -P` if modified mkinitcpio.conf
# Run `passwd` to set the root password

useradd -mG wheel,audio,optical,storage,video -s /usr/bin/zsh mario
# Run `passwd mario` to set the user's password
# Uncomment `%wheel ALL=(ALL) NOPASSWD: ALL` and `%sudo   ALL=(ALL) ALL` lines with visudo

# Setup pacman.conf
sed -i 's/#Color/Color/g' /etc/pacman.conf
sed -i 's/#VerbosePkgLists/VerbosePkgLists\nILoveCandy/g' /etc/pacman.conf

# Setup lightdm
systemctl enable lightdm
sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/g' /etc/lightdm/lightdm.conf
sed -i 's/#display-setup-script=/display-setup-script=\/home\/mario\/scripts\/xrandrConfig.sh/g' /etc/lightdm/lightdm.conf
sed -i 's/#greeter-setup-script=/greeter-setup-script=\/usr\/bin\/xdotool key --clearmodifiers Num_Lock/g' /etc/lightdm/lightdm.conf
sed -i 's/webkit_theme        = antergos/webkit_theme        = litarvan/g' /etc/lightdm/lightdm-webkit2-greeter.conf

# Setup gtk-3.0 theme
cat >> /etc/gtk-3.0/settings.ini <<EOL
[Settings]
gtk-theme-name = Arc-Dark
gtk-icon-theme-name = Papirus-Dark
gtk-application-prefer-dark-theme = true
gtk-font-name = Noto Sans Regular 10
EOL

# Setup touchpad
cat >> /etc/X11/xorg.conf.d/30-touchpad.conf <<EOL
Section "InputClass"
    Identifier "SYNA7DB5:00 06CB:7DB7 Touchpad"
    Driver "libinput"
    Option "Tapping" "on"
    Option "NaturalScrolling" "true"
EndSection
EOL

# Disable graphics card
cat >> /etc/modprobe.d/blacklist-nouveau.conf <<EOL
blacklist nouveau
options nouveau modeset=0
EOL

# Enable NetworkManager service
systemctl enable --now NetworkManager

# Enable infinite ligatures in kitty with Fira Code
cat >> /etc/fonts/conf.d/80-firacode-spacing.conf <<EOL
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <match target="scan">
    <test name="family">
      <string>Fira Code</string>
    </test>
    <edit name="spacing">
      <int>100</int>
    </edit>
  </match>
</fontconfig>
EOL

fc-cache -vf
