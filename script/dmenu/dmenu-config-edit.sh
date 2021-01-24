#!/bin/sh
declare options=("exit
i3
qtile
bspwm
alacritty
kitty
picom
ranger
qutebrowser
nvim
tmux
dunst
castero
redshift
rofi")

menucmd="rofi -location 2 -dmenu"
choice=$(echo -e "${options[@]}"|${menucmd} -p "Config edit" $@)
case "$choice" in
    exit) exit 0 ;;
    i3)
        case "$(echo -e "config\npolybar"|${menucmd} -p "I3wm" $@)" in
	        config)  choice="$HOME/.config/i3/config"      ;;
            polybar) choice="$HOME/.config/polybar/config" ;;
        esac
    ;;
    qtile)
        case "$(echo -e "config\nautostart"|${menucmd} -p "Qtile" $@)" in
            config)    choice="$HOME/.config/qtile/config.py"    ;;
            autostart) choice="$HOME/.config/qtile/autostart.sh" ;;
        esac
    ;;
    bspwm)
        case "$(echo -e "config\nsxhkd\npolybar"|${menucmd} -p "Bspwm" $@)" in
            config)   choice="$HOME/.config/bspwm/config"  ;;
            sxhkd)    choice="$HOME/.config/bspwm/sxhkd"   ;;
            polybar)  choice="$HOME/.config/bspwm/polybar" ;;
        esac
    ;;
    alacritty) choice="$HOME/.config/alacritty.yml"    ;;
    kitty)     choice="$HOME/.config/kitty/kitty.conf" ;;
	picom)     choice="$HOME/.config/picom.conf"       ;;
    ranger)    choice="$HOME/.config/ranger/rc.conf"   ;;
    qutebrowser)
        case "$(echo -e "config\nquickmarks"|${menucmd} -p "Qutebrowser" $@)" in
            config)     choice="$HOME/.config/qutebrowser/config.py"  ;;
            quickmarks) choice="$HOME/.config/qutebrowser/quickmarks" ;;
        esac
    ;;
    nvim)     choice="$HOME/.config/nvim/init.vim"        ;;
    tmux)     choice="$HOME/.tmux.conf"                   ;;
    dunst)    choice="$HOME/.config/dunst/dunstrc"        ;;
    zsh)      choice="$HOME/.zshrc"                       ;;
    castero)  choice="$HOME/.config/castero/castero.conf" ;;
    redshift) choice="$HOME/.config/redshift.conf"        ;;
    rofi)
        case "$(echo -e "config\nnten-dmenu"|${menucmd} -p "Rofi" $@)" in
            config)     choice="$HOME/.config/rofi/config"                 ;;
            nten-dmenu) choice="$HOME/.config/rofi/themes/nten-dmenu.rasi" ;;
        esac
    ;;
esac
alacritty -e nvim "$choice"
