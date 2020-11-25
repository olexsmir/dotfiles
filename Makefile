install_config:
	cp ./bashrc ~/.bashrc
	cp ./gitconfig ~/.gitconfig
	cp ./gitignore_global ~/.gitignore_global
	cp ./taskrc ~/.taskrc
	cp ./vimrc ~/.vimrc
	cp ./zshrc ~/.zshrc
	cp ./conkyrc ~/.conkyrc
	cp ./config/picom.conf ~/.config/picom.conf
	cp ./config/redshift.conf ~/.config/redshift.conf
	cp -r ./config/berry/ ~/.config/
	cp -r ./config/dunst/ ~/.config/
	cp -r ./config/fish/ ~/.config/
	cp -r ./config/htop/ ~/.config/
	cp -r ./config/i3/ ~/.config/
	cp -r ./config/kitty/ ~/.config
	cp -r ./config/neofetch/ ~/.config/
	cp -r ./config/polybar/ ~/.config/
	cp -r ./config/qutebrowser/ ~/.config/
	cp -r ./config/ranger ~/.config/
	cp -r ./config/rofi/ ~/.config/

install_script:
	mkdir ~/.script/dmenu -p
	cp ./script/change-shell.sh ~/.script/change-shell.sh
	cp ./script/manjaro-fetch.sh ~/.script/manjaro-fetch.sh
	cp ./script/snap-remove-old-pkg.sh ~/.script/snap-remove-old-pkg.sh
	cp ./script/walpapper-changer.sh ~/.script/walpapper-changer.sh
	cp ./script/dmenu/dmenu-power.sh ~/.script/dmenu/dmenu-power.sh
	cp ./script/dmenu/dmenu-config-edit.sh ~/.script/dmenu/dmenu-config-edit.sh
	cp ./scripts/dmenu/dmenu-sysmon.sh ~/.script/dmenu/dmenu-sysmon.sh

install: install_config install_script 
