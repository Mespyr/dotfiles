#!/bin/bash

function header() {
    echo
    echo $1
    echo
}

# install theme system-wide, along with configs
function install_config() {
    header "Installing Awesome Config to $HOME/.config/awesome." 

    cp -r awesome/ ~/.config

    header "Installing Alacritty Config to $HOME/.config/alacritty." 

    cp -r alacritty/ ~/.config

    header "Installing Rofi Config to $HOME/.config/rofi."

    cp -r rofi/ ~/.config

    header "Backing Up $HOME/.bashrc to $HOME/.bashrc.bak"

    cp ~/.bashrc ~/.bashrc.bak
    cp .bashrc ~

    header "Installing neovim config"

    cp -r nvim/ ~/.config

    header "Installing picom config"

    cp -r picom.conf ~/.config
    
    header "Installing scripts"

    cp -r scripts/ ~/.config
}


echo "Packages needed to install:"
echo " - AwesomeWM (awesome)"
echo " - Picom (picom)"
echo " - Alacritty (alacritty)"
echo " - lxappearance (lxappearance)"
echo " - Cascadia Code (fonts-cascadia-code)"
echo " - Fira Code (fonts-firacode) for terminal."
echo " - Neovim (neovim)"
echo " - i3lock (i3lock)"
echo

# check if user wants to install
printf "Install? (y/N): "
read INSTALL_PERMISSIONS
if [ "$INSTALL_PERMISSIONS" != "y" ]; then
    if [ "$INSTALL_PERMISSIONS" != "Y" ]; then
        echo "Aborting."
        exit
    fi
fi

mkdir etc/
cd etc/

header "Installing GTK Theme"

git clone https://github.com/Mespyr/ruby-dark-gtk-theme/ gtk-theme/
cd gtk-theme
sh install.sh
cd ..

header "Installing Vimix Ruby Icons."

git clone https://github.com/vinceliuice/vimix-icon-theme.git
cd vimix-icon-theme
./install.sh Ruby 
cd  ../..

install_config
