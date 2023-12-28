#!/bin/bash
# install shit
sudo pacman -S --noconfirm \
	xf86-video-intel bluez bluez-utils blueman wireplumber \
	thermal cpupower smartmontools \
	pipewire pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack mpd \
	hyprland qt5-wayland qt6-wayland \
	xdg-desktop-portal-gtk xdg-desktop-portal-hyprland \
	polkit dunst wofi wl-clipboard \
	lazygit neovim git \
	openssh wget nftables \
	ripgrep fd fzf \
	cmake nodejs npm python python-pip \
	jdk-openjdk php composer \
	btop neofetch \
	vulkan-intel lib32-vulkan-intel steam \
	python-pillow \
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
	waybar-git \
	all-repository-fonts \
	hyprpicker-git \
	vencord-desktop-git \
	xwaylandvideobridge-bin \
	ranger-git \

# install live-server
sudo npm i -g live-server

# enable yarn
sudo corepack enable


# copy config
cd dotfiles && cp -R . ~/.config

# enable shit
systemctl enable systemd-timesyncd	# time sync
systemctl enable NetworkManager		# internet
systemctl enable dhcpcd				# idk tbh but something about networking
systemctl enable iwd				# internet
systemctl enable bluetooth			# bluetooth
systemctl enable mpd				# audio stuff
systemctl enable thermald			# cpu frequency scaling
systemctl enable cpupower			# cpu frequency scaling
systemctl enable nftables			# firewall
systemctl enable fstrim.timer		# TRIM for faster disk writes
