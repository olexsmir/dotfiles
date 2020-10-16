# Dotfiles
![Screen](https://i.imgur.com/OFEhWem.png)
__walpappers: [Dropbox](https://www.dropbox.com/s/yx7tsplowtyih7f/walpapper.zip?dl=0) [Google Drive](https://drive.google.com/file/d/1PX76sgLygXfo9qhsdN3cCsFuFuNKpM1y/view?usp=sharing)__

**Preparing for installation**
~~~bash
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) && chsh -s $(which zsh)
git clone https://github.com/Smirnov-O/zsh-simple-colors ~/.oh-my-zsh/custom/themes

sudo pacman -S i3-wm polybar dunst rofi picom feh redshift \
kitty ranger htop bash zsh git vim neofetch scrot clipboard yay \
ttf-font-awesome ttf-jetbrains-mono ttf-hack
yay -S ttf-weather-icons
~~~

### Packages
| Name                                                                     | Description       |
| ------------------------------------------------------------------------ | ----------------- |
| `i3-wm`                                                                  | Window Manager    |
| `polybar`                                                                | Panel             |
| `dunst`                                                                  | Notify manager    |
| `rofi`                                                                   | Program loncher   |
| `picom`                                                                  | Compositor        |
| `feh`                                                                    | Setting wallpaper |
| `kitty`                                                                  | Terminal          |
| `ranger`                                                                 | File manager      |
| `htop`                                                                   | System motitor    |
| `yay`                                                                    | AUR helper        |
| `redshift`                                                               | Night light       |
| `ttf-font-awesome`, `ttf-jetbrains-mono`, `ttf-weather-icons` `ttf-hack` | Font              |
| `arc-gtk-theme`                                                          | GTK theme         |
| `papirus-icon-theme`                                                     | Icon theme        |
| `scrot`                                                                  | Screenshot tool   |
| `clipmenu`                                                               | Clipboard manager |
