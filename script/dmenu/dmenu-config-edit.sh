#!/bin/sh

declare options=("i3
berry
qtile
openbox
polybar
picom
dunst
qutebrowser
tmux
vim
neovim
kitty
taskwarrior
fish
zsh")

choice=$(echo -e "${options[@]}" | dmenu -p 'Edit config file: ' $@)
case "$choice" in
	i3) choice="$HOME/.config/i3/config" ;;
    qtile) 
        opt=$(echo -e "config.py\nautostart"|dmenu -p 'Qtile' $@)
        case "$opt" in
            "config.py") choice="$HOME/.config/qtile/config.py" ;;
            "autostart") choice="$HOME/.config/qtile/autostart.sh" ;;
        esac
    ;;
    berry)
        declare opt=$(echo -e "berry\npolybar\nsxhkd"|dmenu -p 'Berry' $@)
        case "$opt" in
            "berry") choice="$HOME/.config/berry/autostart" ;;
            "polybar") choice="$HOME/.config/berry/polybar/polybar" ;;
            "sxhkd") choice="$HOME/.config/berry/sxhkdrc" ;;
        esac
    ;;
    openbox)
        opt=$(echo -e "openbox\nautostart\nmenu\nreload"|dmenu -p 'OpenBox' $@)
        case "$opt" in
            "openbox") choice="$HOME/.config/openbox/rc.xml" ;;
            "autostart") choice="$HOME/.config/openbox/autostart" ;;
            "menu") choice="$HOME/.config/openbox/menu.xml" ;;
            "reload") openbox --reconfigure && pkill kitty ;;
        esac
    ;;
	picom) choice="$HOME/.config/picom.conf" ;;
    tmux) choice="$HOME/.tmux.conf" ;;
	polybar) choice="$HOME/.config/polybar/config" ;;
    qutebrowser)
        why=$(echo -e "config.py\nquickmarks" | dmenu -h 24 -p 'Qutebrowser')
        case "$why" in
            "config.py") choice="$HOME/.config/qutebrowser/config.py" ;;
            "quickmarks") choice="$HOME/.config/qutebrowser/quickmarks" ;;
        esac
    ;;
	vim) choice="$HOME/.vimrc" ;;
    nvim) choice="$HOME/.config/nvim/init.vim" ;;
	dunst) choice="$HOME/.config/dunst/dunstrc" ;;
	zsh) choice="$HOME/.zshrc" ;;
    taskwarior) choice="$HOME/.taskrc" ;;
    fish) choice="$HOME/.config/fish/config.fish" ;;
    kitty) choice="$HOME/.config/kitty/kitty.conf" ;;
	*) exit 1 ;;
esac
kitty -e nvim "$choice"
