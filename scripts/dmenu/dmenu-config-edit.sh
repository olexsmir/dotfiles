#!/bin/sh

declare options=("i3
bspwm
polybar
picom
quickmarks
vim
nvim
xresources
dunst
zsh
quit")

choice=$(echo -e "${options[@]}" | dmenu -i -p 'Edit config file: ')

case "$choice" in
	quit)
		echo "Program terminated." && exit 1 ;;
	dunst)
		choice="$HOME/.config/dunst/dunstrc" ;;
	i3)
		choice="$HOME/.config/i3/config" ;;
	bspwm)
		choice="$HOME/.config/bspwm/bspwmrc" ;;
	picom)
		choice="$HOME/.config/picom.conf" ;;
	polybar)
		choice="$HOME/.config/polybar/config" ;;
	quickmarks)
		choice="$HOME/.config/qutebrowser/quickmarks" ;;
	vim)
		choice="$HOME/.vimrc" ;;
    nvim)
        choice="$HOME/.config/nvim/init.vim" ;;
    xresources)
		choice="$HOME/.Xresources" ;;
	zsh)
		choice="$HOME/.zshrc" ;;
	*)
		exit 1 ;;
esac
kitty -e nvim "$choice"
