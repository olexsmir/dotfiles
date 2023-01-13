<h1 align="center">dotfiles</h1>

![System screenhot](./screen.png)
--------------------------------

## System info
- `OS` Arch linux
- `DE` Gnome 42
- `Terminal` Kitty
- `Editors` nvim
- `Browser` firefox
- `Font` Jatbrains Mono

## Install dependencys
```bash
paru -S rcm
sudo pacman -S git kitty github-cli neovim tmux zsh fish starship ttf-jetbrains-mono
```

## And install deps
```bash
git clone --recursive https://github.com/olexsmir/dotfiles ~/.dotfiles
rcup rcrc && rcup
```

## Gonome extensions
- [Freon](https://extensions.gnome.org/extension/841/freon)
- [DDTerm](https://extensions.gnome.org/extension/3780/ddterm)
