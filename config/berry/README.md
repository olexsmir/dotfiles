# [Berry](https://berrywm.org)

![Seceenshot](screen.png)

---

### Autostart
~~~bash
sxhkd -c ~/.config/berry/sxhkdrc &
picom -b &
~/.config/berry/polybar/bar.sh &
nitrogen --restore &
setxkbmap "us,ru,ua" ",winkeys" "grp:alt_shift_toggle" -option "ctrl:nocaps"
~~~

### Keybindings
---------------

| Shourtcut                 | Command                                                                                                  |
| ------------------------- | ------                                                                                                   |
| `mod` + q                 | Kill focus window                                                                                        |
| `mod` + `split` + enter   | Run program launcher (Rofi)                                                                              |
| `mod` + esc               | Power [menu](https://github.com/Smirnov-O/dotfiles/blob/master/scripts/dmenu/dmenu-power.sh)             |
| `mod` + `ctrl` + u        | Config edit [menu](https://github.com/Smirnov-O/dotfiles/blob/master/scripts/dmenu/dmenu-config-edit.sh) |
| `mod` + `ctrl` + i        | Passmenu(Dmenu interface for [pass](https://passwordstore.org))                                          |
| `mod` + enter             | Run `kitty`                                                                                              |
| `mod` + F2                | Run `firefox`                                                                                            |
| `mod` + `shift` + esc     | Run `xkill`                                                                                              |
| `mod` + plus              | Add 5% volume                                                                                            |
| `mod` + minus             | Minus 5% volume                                                                                          |
| `mod` + `shift` + minus   | Mute volume                                                                                              |
| `mod` + tab               | Change focus window                                                                                      |
| `mod` + h/j/k/l           | Move focus window                                                                                        |
| `mod` + `shift` + h/j/k/l | Resize focus window                                                                                      |
| `mod` + [1-9]             | Change workspace                                                                                         |
| `mod` + `shift` + [1-9]   | Send focus window to workspace                                                                           |
| `mod` + `alt` + t         | Open ~/.todo file                                                                                        |
