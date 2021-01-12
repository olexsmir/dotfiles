#!/bin/sh
declare options=("exit
i3
qtile
berry
openbox
dwm
alacritty
kitty
picom
ranger
qutebrowser
emacs
nvim
tmux
dunst
castero
redshift
rofi")

choice=$(echo -e "${options[@]}"|dmenu -p "Config edit" $@)
case "$choice" in
    exit) exit 0 ;;
    i3)
        case "$(echo -e "config\npolybar"|dmenu -p "I3wm" $@)" in
	        config)  choice="$HOME/.config/i3/config"      ;;
            polybar) choice="$HOME/.config/polybar/config" ;;
        esac
    ;;
    qtile)
        case "$(echo -e "config\nautostart"|dmenu -p "Qtile" $@)" in
            config)    choice="$HOME/.config/qtile/config.py"    ;;
            autostart) choice="$HOME/.config/qtile/autostart.sh" ;;
        esac
    ;;
    berry)
        case "$(echo -e "config\npolybar\nsxhkd"|dmenu -p "Berry" $@)" in
            config)  choice="$HOME/.config/berry/autostart"       ;;
            polybar) choice="$HOME/.config/berry/polybar/polybar" ;;
            sxhkd)   choice="$HOME/.config/berry/sxhkdrc"         ;;
        esac
    ;;
    openbox)
        case "$(echo -e "config\nautostart\nmenu\ntint2"|dmenu -p "OpenBox" $@)" in
            config)    choice="$HOME/.config/openbox/rc.xml"    ;;
            autostart) choice="$HOME/.config/openbox/autostart" ;;
            menu)      choice="$HOME/.config/openbox/menu.xml"  ;;
            tint2)     choice="$HOME/.config/tint2/tint2rc"     ;;
        esac
    ;;
    dwm)
        case "$(echo -e "config\nautostart\nbar"|dmenu -p "DWM" $@)" in
            config)    choice="$HOME/.config/dwm/config.def.h " ;;
            autostart) choice="$HOME/.config/dwm/autostart.sh"  ;;
            bar)       choice="$HOME/.script/dwmbar.sh"         ;;
        esac
    ;;
    alacritty) choice="$hoME/.config/alacritty.yml"    ;;
    kitty)     choice="$HOME/.config/kitty/kitty.conf" ;;
	picom)     choice="$HOME/.config/picom.conf"       ;;
    ranger)    choice="$HOME/.config/ranger/rc.conf"   ;;
    qutebrowser)
        case "$(echo -e "config\nquickmarks"|dmenu -p "Qutebrowser" $@)" in
            config)     choice="$HOME/.config/qutebrowser/config.py"  ;;
            quickmarks) choice="$HOME/.config/qutebrowser/quickmarks" ;;
        esac
    ;;
    emacs)
        case "$(echo -e "config\ncustom\ninit\npackages"|dmenu -p "Doom emacs" $@)" in
            config)   choice="$HOME/.doom.d/config.el"   ;;
            init)     choice="$HOME/.doom.d/init.el"     ;;
            custom)   choice="$HOME/.doom.d/custom.el"   ;;
            packages) choice="$HOME/.doom.d/packages.el" ;;
        esac
    ;;
    nvim)     choice="$HOME/.config/nvim/init.vim"        ;;
    tmux)     choice="$HOME/.tmux.conf"                   ;;
    dunst)    choice="$HOME/.config/dunst/dunstrc"        ;;
    zsh)      choice="$HOME/.zshrc"                       ;;
    castero)  choice="$HOME/.config/castero/castero.conf" ;;
    redshift) choice="$HOME/.config/redshift.conf"        ;;
    rofi)
        case "$(echo -e "config\nnten-dmenu"|dmenu -p "Rofi" $@)" in
            config)     choice="$HOME/.config/rofi/config"                 ;;
            nten-dmenu) choice="$HOME/.config/rofi/themes/nten-dmenu.rasi" ;;
        esac
    ;;
esac
alacritty -e nvim "$choice"
# emacsclient -c -a emacs "$choice"
