<h1 align="center">dotfiles</h1>

## System info
- `OS` Arch linux
- `DE` hyprland
- `Terminal` kitty
- `Editors` nvim
- `Browser` firefox
- `Font` Jatbrains Mono

## Install dependencys
```bash
paru -S rcm neovim-git  git kitty github-cli tmux zsh fish ttf-jetbrains-mono hyprland waybar hyprpaper \
    wofi grim dunst brightnessctl pavucontrol xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
```

## And install deps
```bash
git clone --recursive https://github.com/olexsmir/dotfiles ~/.dotfiles
rcup rcrc && rcup
```
