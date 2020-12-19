#!/bin/sh
declare options=("i3
berry
qtile
openbox
spectrwm
polybar
picom
dunst
qutebrowser
taskwarrior
tmux
vim
ranger
term
sh")

choice=$(echo -e "${options[@]}" | dmenu -p 'Edit config file' $@)
case "$choice" in
	i3) choice="$HOME/.config/i3/config" ;;
    qtile) 
        opt=$(echo -e "config.py\nautostart.sh"|dmenu -p 'Qtile' $@)
        case "$opt" in
            "config.py") choice="$HOME/.config/qtile/config.py" ;;
            "autostart.sh") choice="$HOME/.config/qtile/autostart.sh" ;;
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
    spectrwm)
        why=$(echo -e "spectrwm.conf\nsectrwm-bar.sh"|dmenu -p Spectrwm $@)
        case "$why" in
            "spectrwm.conf") choice="$HOME/.spectrwm.conf" ;;
            "spectrwm-bar.sh") choice="$HOME/.script/spectrwm-bar.sh" ;;
        esac
    ;;
	picom) choice="$HOME/.config/picom.conf" ;;
	polybar) choice="$HOME/.config/polybar/config" ;;
    qutebrowser)
        why=$(echo -e "config.py\nquickmarks"|dmenu -p 'Qutebrowser' $@)
        case "$why" in
            "config.py") choice="$HOME/.config/qutebrowser/config.py" ;;
            "quickmarks") choice="$HOME/.config/qutebrowser/quickmarks" ;;
        esac
    ;;
    ranger)
        why=$(echo -e "rc.conf\nrifle.conf"|dmenu -p 'Ranger' $@)
        case "$why" in
            "rc.conf") choice="$HOME/.config/ranger/rc.conf" ;;
            "rifle.conf") choice="$HOME/.config/ranger/rifle.conf" ;;
        esac
    ;;
	vim) 
        why=$(echo -e "nvim\nvim"|dmenu -p 'Vim' $@)
        case "$why" in
            vim) choice="$HOME/.vimrc" ;;
            nvim) choice="$HOME/.config/nvim/init.vim" ;;
        esac
    ;;
    tmux) choice="$HOME/.tmux.conf" ;;
    term)
        why=$(echo -e "kitty\nalacritty"|dmenu -p Term $@)
        case "$why" in
            kitty) choice="$HOME/.config/kitty/kitty.conf" ;;
            alacritty) choice="$hoME/.config/alacritty/alacritty.yml" ;;
        esac
    ;;
	dunst) choice="$HOME/.config/dunst/dunstrc" ;;
    sh)
        why=$(echo -e "zsh\nfish\nbash"|dmenu -p "Shell" $@)
        case "$why" in
            zsh) choice="$HOME/.zshrc" ;;
            fish) choice="$HOME/.config/fish/config.fish" ;;
            bash) choice="$hoME/.bashrc"
        esac
    ;;
    taskwarior) choice="$HOME/.taskrc" ;;
	*) exit 1 ;;
esac
kitty -e nvim "$choice"
