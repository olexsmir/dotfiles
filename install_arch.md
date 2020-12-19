### Connect to WiFi
~~~bash
$ iwctl
  > device list                 # Show all network deivce
  > station `wlan` scan         # Scan networks from `wlan` device
  > station `wlan` get-networks # Show all wifi networks
  > station `wlan` connect SSID # Get passphrase for connect
$ iwctl --passphrase `pass` station `wlan` connect `SSID`
~~~

### Clock
~~~bash
$ timedatectl set-ntp true
~~~

### Disk
~~~bash
$ cfdisk /dev/sdX
~~~

**Create:**
- swap: size(RAM); type(Linux SWAP)
- root: size(15-30Gb); type(ext4)'
- home(optional): size(all size); type(ext4)

**Format:**
~~~bash
$ mkswap /dev/(swap)
$ mkfs.ext4 /dev/(root)
$ mkfs.ext4 /dev/(home)
~~~

**Mount:**
~~~bash
swapon /dev/(swap)
mount /dev/(root) / mnt
mkdit mnt/home && mount /dev/(home) /mnt/home
~~~

### Base system
~~~bash
$ pacstrarp /mnt base base-devel linux linux-dirmware wpa_supplicant dhcpcd networkmanager
~~~

### FStab
~~~bash
$ genfstab -U /mnt >> /mnt/etc/fstab
~~~

### Chroot
~~~bash
$ arch-chroot /mnt
~~~

## Configure base system
### Time
~~~bash
$ ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
$ hwclock --systohc
~~~

### Localization
Uncomment your locale in `/etc/locale.gen`
~~~bash
$ locale-gen
~~~

### Hostname
~~~bash
$ hostnamectl set-hostname arch
$ vim /etc/hosts
  > 127.0.0.1   arch
  > ::1         arch
  > 127.0.1.1   arch.localdomain    arch
~~~

### Root password
~~~bash
$ passwd root
~~~

### User & sudo
Uncomment `%wheel` line in `/etc/sudoers`
~~~bash
$ useradd -m user
$ usermod -aG wheel,audio,video,optical,strage user
$ passwd user
~~~

### Install grub
~~~bash
$ pacman -S grub
$ grub-install --recheck /dev/sdX
$ grub-mkconfig -o /boot/grub/grub.cfg
~~~

### Reboot in base system
~~~bash
$ exit
$ umount /mnt
$ reboot
~~~

### Network manager
~~~bash
$ sudo systemctl enable NetworkManager
$ sudo systemctl start NetworkManager
$ nmtui-connect
~~~

### User dirs
~~~bash
$ sudo pacman -S xdg-userr-dirs
$ xdg-user-dirs-update
~~~

### Xorg, login manager, video drivers
~~~bash
$ sudo pacman -S xorg-server xorg-xrand xorg-xsetroot xorg-drivers lightdm lightdm-gtk-greeter
$ sudo pacman -S xf86-video-intel lib32-intel-dri       # Intel
$ sudo pacman -S nvidia nvidia-utils lib32-nvidia-utils # Nvidia
$ sudo pacman -S xf86-video-ati lib-ati-dri             # AMD
$ sudo systemctl enable lightdm
~~~


### Install yay
~~~bash
$ git clone https://aur.archlinux.org/yay-bin
$ cd yay-bin
$ makepkg -si
~~~


### Install alsa, pulseaudio
~~~bash
$ sudo pacman -S alsa-firmware alsa-utils pulseaudio-alsa pulseaudio
~~~


### Install WM: Qtile
~~~bash
$ sudo pacman -S qtile alacritty nitrogen
$ sudo systemctl start lightdm
~~~


### Install packages from pacman & aur
~~~bash
$ sudo pacman -S --noconfirm --needed firefox redshift mc vifm ranger neovim htop pass passmenu discord zathura papirus-icon-theme arc-gtk-theme lxappearance
$ sudo pacman -S --noconfirm --needed ttf-font-awesome ttf-jatbrains-mono ttf-joypixels
$ yay -S --noconfirm --needed rcm xkblayout bibata-cursor-theme-bin spotify
~~~


### Install betterlockscreen
~~~bash
yay -S i3lock-color imagemagick feh xorg-xrandr xorg-xdpyinfo
wget -O betterlockscreen https://git.io/fASUJ
chmod u+x betterlockscreen
cp betterlockscreen ~/.local/bin
~~~


### Set qt appearance
~~~bash
$ sudo pacman -S kvantum-qt5 qt5ct
$ sudo echo "QT_QPA_PLATFORMTHEME="qt5ct" >> /etc/enviroment
~~~

### Install Oh My ZSH
~~~bash
$ sudo pacman -S zsh curl
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
~~~
