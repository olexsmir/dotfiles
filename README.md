<h1 align="center">dotfiles</h1>

![](./config/qtile/screen.png)
------------------------------

#### System configuration
- `OS` Arch
- `WM` Qtile, i3
- `Terminal` Alacritty
- `Shell` zsh
- `Editor` nvim
- `File manager` ranger, mc
- `Browser` firefox
- `Font` Jatbrains Mono
- `Icon font` FontAwesome5
- `Launcher` dmenu, rofi

#### Install configs
Since i use **[rcm](https://github.com/thoughtbot/rcm)** set it:
~~~bash
yay -S rcm
~~~

Install deps:
~~~bash
sudo pacman -S neovim tmux git i3wm bspwm sxhkd qtile alacritty picom dunst ranger firefox ttf-font-awesome ttf-jetbrains-mono rofi zsh zathura redshift
yay -S polybar
pip install -U castero
~~~


And install configs:
~~~bash
git clone https://github.com/Smirnov-O/dotfiles .dotfiles
rcup
mv ~/.bin ~/bin
~~~