#!/bin/bash

#Check username

#update the system

sudo apt update
sudo apt upgrade

#install needed packages

sudo apt install git zsh i3 i3status i3lock dmenu extrepo thunar feh alacritty blueman dunst udiskie unzip curl wget neovim

#clone configs

git clone https://github.com/jttaka/neovim-config.git
git clone https://github.com/jttaka/i3-config.git

#curl stuff

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash

#create needed files and directorys

mkdir -p $HOME/bin
mkdir -p $HOME/git

#setup .zshrc stuff
echo 'export PATH="$PATH:$HOME/bin"' >> "$HOME/.zshrc"
echo 'export PATH="$PATH:$HOME/.local/bin"' >> "$HOME/.zshrc"

mv neovim-config $HOME/.config/nvim/
mv i3-config $HOME/.config/i3/

#delete old desktop enviorment or wm
DE="$XDG_CURRENT_DESKTOP"
if [[ "$DE" == "GNOME" ]]; then
	echo "Bloat detected. Removing..."
	sudo apt remove --purge gnome-shell gnome-session
	sudo apt remove --purge gnome*
	echo "Bloat removed."
elif [[ "$DE" == "KDE" ]]; then
	echo "Bloat detected. Removing..."
	sudo apt remove --purge kde-plasma-desktop
	sudo apt remove --purge kde*
	echo "Bloat removed."
fi

sudo apt autoremove --purge -y

echo "Reboot for changes to take place"
