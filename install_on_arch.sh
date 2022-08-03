#!/bin/bash

# Script for the instalation of AwesomeWM based on https://github.com/rxyhn/dotfiles and https://github.com/Keyitdev/dotfiles

# Author XimoBaeza

#Colors
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

sudo pacman --noconfirm --needed -Sy dialog

system_update(){
    echo -e "\n${greenColour}[*]${endColour}${purpleColour} Doing a system update.${endColour}\n"
    sudo pacman -Sy --noconfirm archlinux-keyring
    sudo pacman --noconfirm -Syu
    sudo pacman -S --noconfirm --needed base-devel wget git curl
}


install_aur_helper(){ 
    if ! command -v "$aurhelper" &> /dev/null
    then
    echo -e "\n${greenColour}[*]${endColour}${purpleColour} It seems that you don't have $aurhelper installed, I'll install that for you before continuing.${endColour}\n"
    git clone https://aur.archlinux.org/"$aurhelper".git $HOME/.srcs/"$aurhelper"
    (cd $HOME/.srcs/"$aurhelper"/ && makepkg -si)
    else
    echo -e "\n${greenColour}[*]${endColour}${purpleColour} It seems that you already have $aurhelper installed, skipping.${endColour}\n"
    fi
}


install_pkgs(){
    echo -e "\n${greenColour}[*]${endColour}${purpleColour} Installing packages.${endColour}\n"
    "$aurhelper" -S --noconfirm --needed gnome gnome-extra awesome-git picom-git alacritty rofi todo-bin acpi acpid acpi_call \
    wireless_tools jq inotify-tools polkit-gnome xdotool xclip maim \
    brightnessctl alsa-utils alsa-tools pulseaudio gpick redshift \
    mpd mpc mpdris2 ncmpcpp playerctl ffmpeg bluez-utils xdg-user-dirs kitty lsd bat zsh-autosuggestions zsh-syntax-highlighting neovim vim grc feh firefox firefox-i18n-es-es
  
}


enable_services(){
  echo -e "\n${greenColour}[*]${endColour}${purpleColour} Enable services.${endColour}\n"
  sudo systemctl enable mpd.service
  sudo systemctl enable acpid.service
  sudo systemctl enable gdm
}


copy_configs(){
  echo -e "\n${greenColour}[*]${endColour}${purpleColour} Copy configs.${endColour}\n"
  mkdir ~/Descargas/
  cd ~/Descargas/
  git clone https://github.com/XimoBaeza/dotfiles.git
  cd dotfiles
  mkdir ~/.fonts/
  cp -r fonts/* ~/.fonts/
  fc-cache -fv
  mkdir ~/.config/
  cp -r config/* ~/.config/
  mkdir -p ~/.local/bin
  cp -r bin/* ~/.local/bin/
  cp -r misc/. ~/
  cp .zshrc .p10k.zsh ~/
  sudo cp grc.zsh /etc/
  cp config/awesome/ui/decorations/init.lua ~/.config/awesome/ui/decorations/
  cp config/awesome/rc.lua ~/.config/awesome/rc.lua
}


install_powerlevel10k(){
  echo -e "\n${greenColour}[*]${endColour}${purpleColour} Installing powerlevel10k.${endColour}\n"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
}


install_zsh_plugins(){
  echo -e "\n${greenColour}[*]${endColour}${purpleColour} Installing zsh plugins.${endColour}\n"
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
  sudo mkdir /usr/share/zsh-sudo/
  cd /usr/share/zsh-sudo/
  sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
}


other_configs(){
  echo -e "\n${greenColour}[*]${endColour}${purpleColour} Setting de wallpaper.${endColour}\n"
  cd ~/Descargas/dotfiles/
  mkdir ~/Imágenes/
  cp wallpaper/wallpaperbetter.com_1920x1080.jpg ~/Imágenes/
  echo -e "\n${greenColour}[*]${endColour}${purpleColour} Setting default shell to zsh.${endColour}\n"
  chsh -s /bin/zsh
  echo -e "\n${greenColour}[*]${endColour}${purpleColour} Installing fzf.${endColour}\n"
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --key-bindings --completion --update-rc
  echo -e "\n${greenColour}[*]${endColour}${purpleColour} NvChad Nvim configuration.${endColour}\n"
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
}


cmd=(dialog --clear --title "Aur helper" --menu "Firstly, select the aur helper you want to install (or have already installed)." 10 50 16)
options=(1 "yay" 2 "paru")
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

case $choices in
    1) aurhelper="yay";;
    2) aurhelper="paru";;
esac


cmd=(dialog --clear --separate-output --checklist "Select (with space) what script should do.\\nChecked options are required for proper installation, do not uncheck them if you do not know what you are doing." 26 86 16)

options=(1 "System update" on
         2 "Install aur helper" on
         3 "Install packages" on
         4 "Enable services" on
         5 "Copy configs" on
         6 "Install powerlevel10k" on
         7 "Install zsh plugins" on
         8 "Other configs, setting wallpaper, default shell to zsh, install fzf and NvChad's nvim." on)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)


clear

for choice in $choices
do
    case $choice in
        1) system_update;;
        2) install_aur_helper;;
        3) install_pkgs;;
        4) enable_services;;
        5) copy_configs;;
        6) install_powerlevel10k;;
        7) install_zsh_plugins;;
        8) other_configs;;
    esac
done
