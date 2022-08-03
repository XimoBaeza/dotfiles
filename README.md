# Dotfiles

This project is a repository of my configuration files based on the ones from rxyhn (https://github.com/rxyhn) and a bash script for installation based on the one from Keyitdev (https://github.com/Keyitdev) both with some modifications.

The script `install_on_arch.sh` will ask which aurhelper you want to install (yay or paru) and then it will show a menu where you can choose if you want to run all the functions or uncheck with the space bar the ones you don't want.

At the end of the script it installs the NvChad configuration for nvim, and you have to press :q twice to exit, and from there you can enjoy this environment. We will only need to restart and select awesome in gdm.

If you run it in a virtual machine you will have to execute the following command for everything to work well `sed -i 's/glx/xrender/' ~/.config/awesome/theme/picom.conf`

## Screenshots

![image](https://github.com/XimoBaeza/dotfiles/blob/main/assets/shell.png)
![image](https://github.com/XimoBaeza/dotfiles/blob/main/assets/nvim.png)
![image](https://github.com/XimoBaeza/dotfiles/blob/main/assets/widgets.png)

## Information

- **OS:** [Arch Linux](https://archlinux.org)
- **WM:** [awesome](https://github.com/awesomeWM/awesome)
- **Terminal:** [kitty](https://sw.kovidgoyal.net/kitty/)
- **Shell:** [zsh](https://www.zsh.org/)
- **Compositor:** [picom](https://github.com/yshui/picom)
- **Application Launcher:** [rofi](https://github.com/davatorium/rofi)

### Keybinds
#### Applications

| Keybind | Action |
| ------- | ------ |
| <kbd>super + enter</kbd> | Open terminal |
| <kbd>super + d</kbd> | Open application launcher |
| <kbd>super + w</kbd> | Open web browser  |
| <kbd>super + x</kbd> | Open color picker |
| <kbd>super + f</kbd> | Open file manager |

#### Hotkeys

| Keybind | Action |
| ------- | ------ |
| <kbd>super + shift + d</kbd> | Toggle dashboard |
| <kbd>super + shift + c</kbd> | Toggle control center |
| <kbd>super + shift + n</kbd> | Toggle notification center |
| <kbd>super + shift + t</kbd> | Toggle systray |
| <kbd>super + ctrl + l</kbd> | Show lock screen |
| <kbd>alt + tab</kbd> | Toggle window switcher |


#### Layout

| Keybind | Action |
| ------- | ------ |
| <kbd>super + space</kbd> | Select next layout |
| <kbd>super + s</kbd> | Set tiling layout |
| <kbd>super + shift + s</kbd> | Set floating layout |

#### WM

| Keybind | Action |
| ------- | ------ |
| <kbd>super + ctrl + q</kbd> | Quit AwesomeWM |
| <kbd>super + ctrl + r</kbd> | Reload AwesomeWM |
| <kbd>super + F1</kbd> | Show help |
