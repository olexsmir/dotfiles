<h1 align="center">dotfiles</h1>

![](./config/bspwm/screen.png)
--------------

### System configuration
- `OS` Arch
- `WM` bspwm
- `Terminal` kitty
- `Shell` zsh
- `Editor` nvim, vscode
- `File manager` ranger
- `Browser` chrome
- `Font` Jatbrains Mono
- `Icon font` Font Awesome
- `Launcher` rofi

### Install config
Since i use **[rcm](https://github.com/thoughtbot/rcm)** set it:
```bash
yay -S rcm
```

Install dependency:
```bash
sudo pacman -S git bspwm sxhkd dunst alacritty neovim picom rofi zsh ranger ttf-font-awesome ttf-jetbrains-mono
yay -S polybar
```

And install configs:
```bash
git clone --recursive https://github.com/Smirnov-O/dotfiles .dotfiles
rcup rcrc && rcup
```
