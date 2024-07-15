#!/bin/bash

# install shit
sudo pacman -S --noconfirm \
	xorg-server bluez bluez-utils blueman wireplumber \
	thermald cpupower smartmontools acpilight \
	pipewire pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack \
	pavucontrol spotify-launcher \
	qt5-wayland qt6-wayland kitty hyprland greetd greetd-tuigreet \
	xdg-desktop-portal xdg-desktop-portal-hyprland xorg-xwayland xwaylandvideobridge \
	waybar obs-studio vlc kdenlive audacity ffmpeg \
	polkit dunst wl-clipboard \
	lazygit neovim git \
	openssh wget nftables wtype \
	ripgrep fd fzf exa \
	cmake nodejs npm python python-pip \
	jdk-openjdk php composer \
	glances neofetch \
	vulkan-intel lib32-vulkan-intel steam \
	python-pillow grimshot \
	zathura tesseract-data-eng \
	firefox krita speedtest-cli \
	fish arandr bat dolphin \

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
systemctl enable greetd.service		# greeter
