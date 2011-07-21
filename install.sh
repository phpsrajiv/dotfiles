#!/bin/bash

if [ ! -d ~/.dotfile_backup ]; then
  mkdir ~/.dotfile_backup
fi

# Copy all the dotfiles
for i in .*
do
	if [ "$i" != "." ] && [ "$i" != ".." ] && [ "$i" != ".git" ]; then
	  if [ -e ~/$i ]; then
			if ! ( cp ~/$i ~/.dotfile_backup/$i ) || ! ( rm ~/$i || unlink ~/$i ); then
				echo "Failed on $i" > /dev/stderr
				exit 1
			fi
		fi
		if ln -s $(pwd)/$i ~/$i; then
			echo "Linked: $i" > /dev/stderr
		else
			echo "Failed on $i" > /dev/stderr
			exit 1
		fi
	fi
done

# Terminal settings

gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color -t str '#222'
gconftool-2 --set /apps/gnome-terminal/profiles/Default/cursor_shape -t str 'block'
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_background -t bool true
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_colors -t bool false
gconftool-2 --set /apps/gnome-terminal/profiles/Default/scrollbar_position -t str 'right'
gconftool-2 --set /apps/gnome-terminal/profiles/Default/scrollback_unlimited -t bool true
gconftool-2 --set /apps/gnome-terminal/profiles/Default/font -t str 'Droid Sans Mono 11'
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_system_font -t bool false
gconftool-2 --set /apps/gnome-terminal/profiles/Default/visible_name -t str 'Default'
gconftool-2 --set /apps/gnome-terminal/profiles/Default/alternate_screen_scroll -t bool false
gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette -t str '#2E2E34343636:#CCCC00000000:#4E4E9A9A0606:#C4C4A0A00000:#34346565A4A4:#757550507B7B:#060698209A9A:#D3D3D7D7CFCF:#555557575353:#EFEF29292929:#8A8AE2E23434:#FCFCE9E94F4F:#72729F9FCFCF:#ADAD7F7FA8A8:#3434E2E2E2E2:#EEEEEEEEECEC'
gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color -t str '#222222222222'
gconftool-2 --set /apps/gnome-terminal/profiles/Default/foreground_color -t str '#F3F3F3F3F3F3'
gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color -t str '#000000000000'
gconftool-2 --set /apps/gnome-terminal/profiles/Default/allow_bold -t bool false

source ~/.bashrc
