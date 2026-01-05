#!/bin/bash

#Check username

USERNAME=$(whoami)

#update the system

sudo apt update
sudo apt upgrade

#install needed packages

sudo apt install git zsh i3 i3status i3lock dmenu extrepo thunar feh alacritty firefox blueman dunst udiskie
sudo extrepo enable librewolf
sudo apt install librewolf

#clone configs

git clone https://github.com/jttaka/neovim-config.git
git clone https://github.com/jttaka/i3-config.git

#curl stuff

curl -fsSL https://raw.githubusercontent.com/MordechaiHadad/bob/master/scripts/install.sh | bash
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash

#create needed files and directorys

mkdir $HOME/$USERNAME/bin
mkdir $HOME/$USERNAME/git
touch $HOME/$USERNAME/.profile

#setup .zshrc stuff and bob stuff

echo "USERNAME =$(whoami)" >> $HOME/$USERNAME/.profile
echo ". \"home/$USERNAME/.local/share/bob/env/env.sh\"" >> $HOME/$USERNAME/.profile

echo "USERNAME =$(whoami)" >> $HOME/$USERNAME/.zshrc
echo "source $HOME/$USERNAME/.profile" >> $HOME/$USERNAME/.zshrc
echo "export $PATH:$HOME/$USERNAME/bin" >> $HOME/$USERNAME/.zshrc

mv neovim-config $HOME/$USERNAME/.config/nvim
mv i3-config $HOME/$USERNAME/.config/i3

bob install nightly
bob use nightly

sudo reboot now

#delete old desktop enviorment or wm
DE =$(echo $XDG_CURRENT_DESKTOP)
if [[ "$DE" == "GNOME"]]; then
	echo "Bloat detected. Removing..."
	sudo apt remove --purge gnome-shell gnome-session
	sudo apt remove --purge gnome*
	echo "Bloat removed."
elif [[ "$DE" == ""]]; then
	echo "Bloat detected. Removing..."
	sudo apt remove --purge kde-plasma-desktop
	sudo apt remove --purge kde*
	echo "Bloat removed."
fi

sudo apt autoremove --purge -y
