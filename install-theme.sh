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
}


echo "Packages needed to install:"
echo " - AwesomeWM (awesome)"
echo " - Picom (picom)"
echo " - Alacritty (alacritty)"
echo " - lxappearance (lxappearance)"
echo " - Cascadia Code (fonts-cascadia-code)"
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


header "Installing GTK Theme"

git clone https://github.com/Mespyr/blue-vimix-gtk-theme.git
cd blue-vimix-gtk-theme
sh install.sh
cd ..

header "Installing Vimix Beryl Icons."

git clone https://github.com/vinceliuice/vimix-icon-theme.git
cd vimix-icon-theme
./install.sh Beryl 
cd  ..

install_config