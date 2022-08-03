# dotfiles

This project is a repository of my configuration files based on the ones from rxyhn (https://github.com/rxyhn) and a bash script for installation based on the one from Keyitdev (https://github.com/Keyitdev) both with some modifications.

The script will ask which aurhelper you want to install (yay or paru) and then it will show a menu where you can choose if you want to run all the functions or uncheck with the space bar the ones you don't want.

At the end of the script it installs the NvChad configuration for nvim, and you have to press :q twice to exit, and from there you can enjoy this environment. We will only need to restart and select awesome in gdm.

If you run it in a virtual machine you will have to execute the following command for everything to work well `sed -i 's/glx/xrender/' ~/.config/awesome/theme/picom.conf`

## Screenshots

![image](https://github.com/XimoBaeza/dotfiles/blob/main/assets/shell.png)
![image](https://github.com/XimoBaeza/dotfiles/blob/main/assets/nvim.png)
![image](https://github.com/XimoBaeza/dotfiles/blob/main/assets/widgets.png)

