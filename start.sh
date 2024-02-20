#!/bin/bash

# install shit
sudo pacman -S --noconfirm \
	xf86-video-intel bluez bluez-utils blueman wireplumber \
	thermald cpupower smartmontools acpilight \
	pipewire pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack \
	pavucontrol spotify-launcher \
	qt5-wayland qt6-wayland kitty hyprlang \
	xdg-desktop-portal xorg-xwayland xwaylandvideobridge \
	waybar obs-studio vlc \
	polkit dunst wl-clipboard \
	lazygit neovim git \
	openssh wget nftables wtype \
	ripgrep fd fzf \
	cmake nodejs npm python python-pip \
	jdk-openjdk php composer \
	btop neofetch \
	vulkan-intel lib32-vulkan-intel steam \
	python-pillow grimshot \
	texlive zathura tesseract-data-eng \
	firefox gimp speedtest-cli \
	tree fish arandr \

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
	github-cli \
	nonicons-git \
	all-repository-fonts \
	hyprpicker-git \
	vencord-desktop-git \
	ranger-git \
	swww \
	rofi-lbonn-wayland-git \
	zotero \
	obsidian \
	figma-linux \
	zoom \
	hyprland-git \
	xdg-desktop-portal-gtk-git \
	xdg-desktop-portal-wlr-git \

# install live-server
sudo npm i -g live-server

# enable yarn
sudo corepack enable


# copy config
cd dotfiles && cp -R . ~/.config

# enable shit
systemctl enable systemd-timesyncd	# time sync
systemctl enable NetworkManager		# internet
systemctl enable iwd				# internet
systemctl enable bluetooth			# bluetooth
systemctl enable thermald			# cpu frequency scaling
systemctl enable cpupower			# cpu frequency scaling
systemctl enable nftables			# firewall
systemctl enable fstrim.timer		# TRIM for faster disk writes
