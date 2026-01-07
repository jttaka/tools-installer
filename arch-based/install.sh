#!/bin/bash

#Check username

#update the system

sudo pacman -Syu

#install yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

#install needed packages

sudo pacman -S git zsh i3 i3status i3lock dmenu extrepo thunar feh alacritty firefox blueman dunst udiskie unzip

#clone configs

git clone https://github.com/jttaka/neovim-config.git
git clone https://github.com/jttaka/i3-config.git

#curl stuff

curl -fsSL https://raw.githubusercontent.com/MordechaiHadad/bob/master/scripts/install.sh | bash
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash

#create needed files and directorys

mkdir -p $HOME/bin
mkdir -p $HOME/git
touch $HOME/.profile

#setup .zshrc stuff and bob stuff

echo ". \"$HOME/.local/share/bob/env/env.sh\"" >> $HOME/.profile

echo 'export PATH="$PATH:$HOME/bin"' >> "$HOME/.zshrc"
echo 'export PATH="$PATH:$HOME/.local/bin"' >> "$HOME/.zshrc"
echo 'source "$HOME/.profile"' >> "$HOME/.zshrc"
source "$HOME/.zshrc"

mv neovim-config $HOME/.config/nvim/
mv i3-config $HOME/.config/i3/

bob install nightly
bob use nightly

#delete old desktop enviorment or wm
DE="$XDG_CURRENT_DESKTOP"
if [[ "$DE" == "GNOME" ]]; then
	echo "Bloat detected. Removing..."
	sudo pacman -R --purge gnome-shell gnome-session
	sudo pacman -R --purge gnome*
	echo "Bloat removed."
elif [[ "$DE" == "KDE" ]]; then
	echo "Bloat detected. Removing..."
	sudo pacman -R --purge kde-plasma-desktop
	sudo pacman -R --purge kde*
	echo "Bloat removed."
fi

sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc
echo "Reboot for changes to take place"
