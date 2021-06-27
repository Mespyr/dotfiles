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

    cp ~/.bashrc .bashrc.bak
    cp .bashrc ~
}


echo "Packages needed to install:"
echo " - AwesomeWM (awesome)"
echo " - Picom (picom)"
echo " - Alacritty (alacritty)"
echo " - lxappearance (lxappearance)"
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


header "Installing Gruvbox Theme and Icons."

git clone https://github.com/sainnhe/gruvbox-material-gtk

# check if running with root permissions
if [ `id -u` == 0 ]; then
    # install theme
    cp -r gruvbox-material-gtk/themes/* -t /usr/share/themes/
    # install icons
    cp -r gruvbox-material-gtk/icons/* -t /usr/share/icons/
else
    # install theme
    mkdir ~/.themes
    cp -r gruvbox-material-gtk/themes/* -t ~/.themes
    # install icons
    mkdir ~/.icons
    cp -r gruvbox-material-gtk/icons/* -t ~/.icons
fi

install_config

