<h1 align="center">dotfiles</h1>

![](config/bspwm/screen.png)
----------------------------

#### System configuration
- `OS` Arch
- `WM` bspwm
- `Terminal` alacritty
- `Shell` zsh
- `Editor` nvim, vscode
- `File manager` ranger
- `Browser` firefox
- `Font` Jatbrains Mono
- `Icon font` FontAwesome
- `Launcher` rofi

#### Install config
Since i use **[rcm](https://github.com/thoughtbot/rcm)** set it:
~~~bash
yay -S rcm
~~~

Install dependency:
```bash
sudo pacman -S neovim tmux git bspwm sxhkd alacritty picom dunst zsh rofi ranger firefox ttf-font-awesome ttf-jetbrains
yay -S polybar xkblayout
```

And install config:
~~~bash
git clone https://github.com/Smirnov-O/dotfiles .dotfiles
rcup
~~~
