#!/bin/bash

# install theme system-wide, along with configs
function install_system_wide() {
    echo 
    echo "Installing Theme and Icons system-wide."
    echo

    git clone https://github.com/sainnhe/gruvbox-material-gtk

    # install theme
    cp -r gruvbox-material-gtk/themes/* -t /usr/share/themes/

    # install icons
    cp -r gruvbox-material-gtk/icons/* -t /usr/share/icons/

    echo 
    echo "Installing Awesome Config." 
    echo

    cp -r awesome/ ~/.config

    echo 
    echo "Installing Alacritty Config." 
    echo

    cp -r alacritty/ ~/.config

    printf "Install '.bashrc' into '$HOME/.bashrc'(y/N): "
    read INSTALL_PERMISSIONS

    if [ "$INSTALL_PERMISSIONS" != "y" ]; then
        if [ "$INSTALL_PERMISSIONS" != "Y" ]; then
            echo "Aborting."
            exit
        fi
    fi

    echo
    echo "Backing Up $HOME/.bashrc to $HOME/.bashrc.bak"
    echo

    cp ~/.bashrc .bashrc.bak
    cp .bashrc ~

}

function install_locally() {
    echo 
    echo "Installing Theme and Icons locally."
    echo

    git clone https://github.com/sainnhe/gruvbox-material-gtk

    # install theme
    mkdir ~/.themes
    cp -r gruvbox-material-gtk/themes/* -t ~/.themes

    # install icons
    mkdir ~/.icons
    cp -r gruvbox-material-gtk/icons/* -t ~/.icons

    echo 
    echo "Installing Awesome Config." 
    echo

    cp -r awesome/ ~/.config

    echo 
    echo "Installing Alacritty Config." 
    echo

    cp -r alacritty/ ~/.config

    echo
    echo "Backing Up $HOME/.bashrc to $HOME/.bashrc.bak"
    echo

    cp ~/.bashrc ~/.bashrc.bak
    cp .bashrc ~

}


echo "Packages needed to install:"
echo " - AwesomeWM (awesome)"
echo " - Compton (compton) or Picom (picom)"
echo " - Alacritty (alacritty): Default Terminal Emulator"
echo

echo "Recommended Packages:"
echo " - lxappearance (lxappearance)"
echo " - VSCode (code): Preferred Code Editer"
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

# check if running with root permissions
if [ `id -u` == 0 ]; then
    install_system_wide
    exit
fi

install_locally

