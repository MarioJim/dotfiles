#!/bin/sh

sudo sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.pacnew
sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.old
echo "Ranking mirrors..."
sudo rankmirrors -n 6 /etc/pacman.d/mirrorlist.pacnew | sudo tee /etc/pacman.d/mirrorlist

