#!/bin/sh

declare options=("i3
berry
qtile
polybar
picom
dunst
qutebrowser
quickmarks
vim
neovim
kitty
taskwarrior
fish
zsh")

choice=$(echo -e "${options[@]}" | dmenu -h 24 -p 'Edit config file: ')

case "$choice" in
	i3) choice="$HOME/.config/i3/config" ;;
    qtile) choice="$HOME/.config/qtile/config.py" ;;
    berry)
        declare opt=("berry\npolybar\nsxhkd")
        why=$(echo -e "${opt}" | dmenu -h 24 -p 'Berry')
        case "$why" in
            "berry") choice="$HOME/.config/berry/autostart" ;;
            "polybar") choice="$HOME/.config/berry/polybar/polybar" ;;
            "sxhkd") choice="$HOME/.config/berry/sxhkdrc" ;;
        esac
    ;;
	picom) choice="$HOME/.config/picom.conf" ;;
	polybar) choice="$HOME/.config/polybar/config" ;;
	quickmarks) choice="$HOME/.config/qutebrowser/quickmarks" ;;
    qutebrowser) choice="$HOME/.config/qutebrowser/config.py" ;;
	vim) choice="$HOME/.vimrc" ;;
    nvim) choice="$HOME/.config/nvim/init.vim" ;;
	dunst) choice="$HOME/.config/dunst/dunstrc" ;;
	zsh) choice="$HOME/.zshrc" ;;
    taskwarior) choice="$HOME/.taskrc" ;;
    fish) choice="$HOME/.config/fish/config.fish" ;;
    kitty) choice="$HOME/.config/kitty/kitty.conf" ;;
	quit) echo "Program terminated." && exit 1 ;;
	*) exit 1 ;;
esac
kitty -e nvim "$choice"
