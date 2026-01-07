# jttaka/tools-installer

## WARNING! Project still under construction but should already work. Still run at your own risk!

## Configurations

### Debian:
On debian install.sh will do the following:

Install:
```
git, zsh, i3, i3status, i3lock, dmenu, extrepo, thunar, feh, alacritty, blueman, dunst, udiskie, unzip, curl, wget, neovim, oh-my-zsh, 

```
Configure:
```
i3, neovim
```
Go check out the i3 and neovim configs from:
https://github.com/jttaka/neovim-config
and
https://github.com/jttaka/i3-config

It will create directories bin and git in your home directory and add bin to your path

### AND VERY INPORTANT: DELETE ALL GNOME AND KDE RELATED PROGRAMS IF YOU HAVE ANY!!!

### Arch:
On arch install.sh will do the following:

Install:
```
git, zsh, i3, i3status, i3lock, dmenu, extrepo, thunar, feh, alacritty, blueman, dunst, udiskie, unzip, curl, wget, bob, oh-my-zsh, firefox, yay 

```
Configure:
```
i3, bob, neovim
```
Go check out the i3 and neovim configs from:
https://github.com/jttaka/neovim-config
and
https://github.com/jttaka/i3-config

It will create directories bin and git in your home directory and add bin to your path

### AND VERY INPORTANT: DELETE ALL GNOME AND KDE RELATED PROGRAMS IF YOU HAVE ANY!!!

## Installation:

If you are on a new installation of a arch or debian based distro you are going to need to install git:

### Debian:
```bash
sudo apt install git

```
### Arch:
```
sudo pacman -S git
```
Other than git or something else to download tools-installer with you do not need anything else.

## Usage:

Instructions on how to use the installer.

### Debian:
Go to tools-installer/debian-based with:
```bash
cd tools-installer/debian-based
```
Then give execution permissions for the installer to the owner with:
```bash
chmod u+x install.sh
```
If you want to give execution permissions to all users then:
```bash
chmod +x install.sh
```
Then run the installer with:
```bash
./install.sh
```
### Arch:
Go to tools-installer/arch-based with:
```bash
cd tools-installer/arch-based
```
Then give execution permissions for the installer to the owner with:
```bash
chmod u+x install.sh
```
If you want to give execution permissions to all users then:
```bash
chmod +x install.sh
```
Then run the installer with:
```bash
./install.sh
```

