#!/bin/bash
# install shit
sudo pacman -S --noconfirm \
	xf86-video-intel bluez wireplumber \
	pipewire pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack \
	hyprland xdg-desktop-portal-hyprland qt5-waylnd qt6-waylnd \
	polkit dunst wofi wl-clipboard \
	ttf-jetbrains-mono ttf-nerd-fonts-symbols-mono \
	lazygit neovim git openssh \
	ripgrep fd fzf \
	cmake nodejs npm python python-pip \
	jdk-openjdk php composer \
	btop neofetch \
	texlive \

# install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sirc
cd .. && rm -rf yay

yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

# install browser
yay -S --noconfirm \
	google-chrome \
	github-cli \
	nonicons-git \

# install live-server
sudo npm i -g live-server

# enable yarn
sudo corepack enable


# copy config
cd dotfiles && cp -R . ~/.config

# enable shit
systemctl enable systemd-timesyncd
systemctl enable NetworkManager
systemctl enable dhcpcd
systemctl enable iwd
