#!/bin/bash

echo Do you want to install pretty-gnome?
echo It will change your system\'s Yaru theme
echo But we will backup the original themes to  ~/.local/share/gnome-shell/backup-themes/\*
echo If you want to return all back, run the reset.sh

# Ask the user if he want's to install custom theme
while true; do
	read -p "Are you sure? (y/n) " yn
	case $yn in 
		[yY] ) break;;
		[nN] ) exit;;
		* ) echo invalid response;;
	esac
done

# White theme
white="
cell{
	padding-top: 0px;
	padding-bottom: 0px;
	margin: -2px;
	margin-left: -15px;
}

window.csd {
	background-color: rgba(255,255,255,0.8);
	border-radius: 20px;
	border: solid 0.8px rgba(255,255,255,0.3);
	box-shadow: 0px 35px 60px rgba(0,0,0,0.3), 0px 10px 20px rgba(0,0,0,0.4), 0px -14px 25px rgba(255,255,255,0.2);
}

dialog{
	border-radius: 0px 0px 20px 20px;
	border-bottom: solid 0.8px rgba(255,255,255,0.3);
	border-left: solid 0.8px rgba(255,255,255,0.3);
	border-right: solid 0.8px rgba(255,255,255,0.3);
}

window{
	border-radius: 0px 0px 20px 20px;
	border-bottom: solid 0.8px rgba(255,255,255,0.3);
	border-left: solid 0.8px rgba(255,255,255,0.3);
	border-right: solid 0.8px rgba(255,255,255,0.3);
}

decoration{
	border-radius: 20px;
	box-shadow: 0px 35px 60px rgba(0,0,0,0.3), 0px 10px 20px rgba(0,0,0,0.4), 0px -14px 25px rgba(255,255,255,0.2);
}

decoration-overlay{
	border: solid 0.8px rgba(255,255,255,0.3);
	border-radius: 20px;
}

.sidebar-pane{
	background-color: rgba(142,142,142,0);
}
.content-pane{
	background-color: rgba(255,255,255,0.9);
}

windowhandle{
	margin-bottom: -2px;
	margin-top: -2px;
}

columnview * row:nth-child(odd){
	background-color: rgba(0,0,0,0.025);
}

columnview * row:hover{
	background-color: rgba(0,0,0,0.1);
}

columnview * row:active{
	background-color: alpha(@accent_color,0.2);
	transition: all 0.2s;
	transform: translateX(-1px) scale(0.98);
}

columnview * row:selected{
	background-color: alpha(@accent_color,0.25);
	transition: all 0.2s;
	transform: translateX(0px);
}

columnview * row:selected:hover{
	background-color: alpha(@accent_color,0.5);
	transition: all 0s;
}

windowcontrols >*{
	transition: all 0s;
}

windowcontrols > * > image{
	opacity: 0;
}

windowcontrols > .close{
	padding: 0px;
	transform: scale(0.45);
	margin-left: -6px;
	background-color: rgb(220,120,120);
	border: solid 2px rgb(170,80,80);
	border-radius: 100%;
}

windowcontrols > .close:Hover{
	background-color: rgb(255,180,180);
}

windowcontrols > .minimize:Hover{
	background-color: rgb(130,255,130);
}

windowcontrols > .minimize{
	padding: 0px;
	transform: scale(0.45);
	
	background-color: rgb(120,150,120);
	border: solid 2px rgb(80,150,80);
	border-radius: 100%;
}

windowcontrols > .maximize:Hover{
	background-color: rgb(255,255,170);
}

windowcontrols > .maximize{
	padding: 0px;
	margin-left: -6px;	
	transform: scale(0.45);
	background-color: rgb(220,170,120);
	border: solid 2px rgb(170,120,120);
	border-radius: 100%;
}

windowhandle{
	margin-top: -4px;
	margin-bottom: -4px;
}

#blackbox-main-window >* headerbar{
	margin-bottom: -5px;
	margin-top: -5px;
}

#blackbox-main-window > widget > overlay > box > tabview * {
	background-color: transparent;
	background: transparent;
	filter: brightness(0.95);
}

popover >* {
	background-color: rgba(255,255,255,1);
}"

white_shell="
#panel {
  background-color: rgba(255,255,255,0.65);
  box-shadow: inset 0 -1px 0 rgba(255, 255, 255, 0.9);
  color: black;
}

#panel * {
  color: black;
}

.dash-background{
  background-color: rgba(255,255,255,0.75);
}
"

# Dark theme
dark="
cell{
	padding-top: 0px;
	padding-bottom: 0px;
	margin: -2px;
	margin-left: -15px;
}

window.csd {
	background-color: rgba(42,42,42,0.6);
	border-radius: 20px;
	border: solid 0.8px rgba(255,255,255,0.3);
	box-shadow: 0px 35px 60px rgba(0,0,0,0.4), 0px 10px 20px rgba(0,0,0,0.5), 0px -14px 25px rgba(255,255,255,0.05);
}

dialog{
	border-radius: 0px 0px 20px 20px;
	border-bottom: solid 0.8px rgba(255,255,255,0.3);
	border-left: solid 0.8px rgba(255,255,255,0.3);
	border-right: solid 0.8px rgba(255,255,255,0.3);
}

window{
	border-radius: 0px 0px 20px 20px;
	border-bottom: solid 0.8px rgba(255,255,255,0.3);
	border-left: solid 0.8px rgba(255,255,255,0.3);
	border-right: solid 0.8px rgba(255,255,255,0.3);
}

decoration{
	border-radius: 20px;
	box-shadow: 0px 35px 60px rgba(0,0,0,0.4), 0px 10px 20px rgba(0,0,0,0.5), 0px -14px 25px rgba(255,255,255,0.05);
}

decoration-overlay{
	border: solid 0.8px rgba(255,255,255,0.3);
	border-radius: 20px;
}

.sidebar-pane{
	background-color: rgba(42,42,42,0);
}
.content-pane{
	background-color: rgba(30,30,30,0.9);
}

windowhandle{
	margin-bottom: -2px;
	margin-top: -2px;
}

columnview * row:nth-child(odd){
	background-color: rgba(255,255,255,0.025);
}

columnview * row:hover{
	background-color: rgba(255,255,255,0.05);
}

columnview * row:active{
	background-color: alpha(@accent_color,0.2);
	transition: all 0.2s;
	transform: translateX(-1px) scale(0.98);
}

columnview * row:selected{
	background-color: alpha(@accent_color,0.2);
	transition: all 0.2s;
	transform: translateX(0px);
}

columnview * row:selected:hover{
	background-color: alpha(@accent_color,0.35);
	transition: all 0s;
}

windowcontrols >*{
	transition: all 0s;
}

windowcontrols > * > image{
	opacity: 0;
}

windowcontrols > .close{
	padding: 0px;
	transform: scale(0.45);
	margin-left: -6px;
	background-color: rgb(220,120,120);
	border: solid 2px rgb(170,80,80);
	border-radius: 100%;
}

windowcontrols > .close:Hover{
	background-color: rgb(255,180,180);
}

windowcontrols > .minimize:Hover{
	background-color: rgb(130,255,130);
}

windowcontrols > .minimize{
	padding: 0px;
	transform: scale(0.45);
	
	background-color: rgb(120,150,120);
	border: solid 2px rgb(80,150,80);
	border-radius: 100%;
}


windowcontrols > .maximize:Hover{
	background-color: rgb(255,255,170);
}

windowcontrols > .maximize{
	padding: 0px;
	margin-left: -6px;	
	transform: scale(0.45);
	background-color: rgb(220,170,120);
	border: solid 2px rgb(170,120,120);
	border-radius: 100%;
}

windowhandle{
	margin-top: -4px;
	margin-bottom: -4px;
}

#blackbox-main-window >* headerbar{
	margin-bottom: -5px;
	margin-top: -5px;
}

#blackbox-main-window > widget > overlay > box > tabview * {
	background-color: transparent;
	background: transparent;
}

popover >* {
	background-color: rgba(42,42,42,1);
}"

dark_shell="
#panel {
  background-color: rgba(42,42,42,0.65);
  box-shadow: inset 0 -1px 0 rgba(255, 255, 255, 0.3);
  color: white;
}

#panel * {
  color: white;
}

.dash-background{
  background-color: rgba(42,42,42,0.75);
}
"

selected_shell=""
selected=""

# Ask the user what he wants, dark or white theme
while true; do
	read -p "What theme you want (d/w) dark or white?" dw
	case $dw in 
		[Dd] )
			selected="$dark"
			break
			;;
		[Ww] )
			selected="$white"
			break
			;;
		* ) echo invalid response;;
	esac
done

# Check if backup does not exists
if [ ! -d ~/.local/share/gnome-shell/backup-themes/ ]; then
	# Create a dir for backup
	mkdir ~/.local/share/gnome-shell/backup-themes/

	# Copy all the system Yaru themes to the new folder
	cp -r /usr/share/gnome-shell/theme/* ~/.local/share/gnome-shell/backup-themes/
else
	sudo cp -rf ~/.local/share/gnome-shell/backup-themes/* /usr/share/gnome-shell/theme/
fi

# Add a custom CSS
for themename in /usr/share/gnome-shell/theme/*; do
	if [[ $themename == *"Yaru"* ]]; then
		if [[ $themename == *"-dark"* ]]; then
			echo "$dark_shell" | sudo tee -a /usr/share/gnome-shell/theme/$(basename "$themename")/gnome-shell.css
		else
			echo "$white_shell" | sudo tee -a /usr/share/gnome-shell/theme/$(basename "$themename")/gnome-shell.css
		fi
	fi
done

# Check ~/.config/gtk-4.0 exists
if [ ! -d ~/.config/gtk-4.0 ]; then
	# Create a dir for gtk-4.0 css
	mkdir ~/.config/gtk-4.0
	touch ~/.config/gtk-4.0/gtk.css
fi

# Check ~/.config/gtk-3.0 exists
if [ ! -d ~/.config/gtk-3.0 ]; then
	# Create a dir for gtk-3.0 css
	mkdir ~/.config/gtk-3.0
	touch ~/.config/gtk-3.0/gtk.css
fi

# Writing custom css
echo "$selected" > ~/.config/gtk-4.0/gtk.css
echo "$selected" > ~/.config/gtk-3.0/gtk.css