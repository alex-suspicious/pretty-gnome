#!/bin/bash

# Ask the user if he want's to remove the custom theme
while true; do
	read -p "Are you sure? (y/n) " yn
	case $yn in 
		[yY] ) break;;
		[nN] ) exit;;
		* ) echo invalid response;;
	esac
done

# Copy all the backed up Yaru themes to the system themes folder
sudo cp -rf ~/.local/share/gnome-shell/backup-themes/* /usr/share/gnome-shell/theme/
echo "" > ~/.config/gtk-4.0/gtk.css
echo "" > ~/.config/gtk-3.0/gtk.css