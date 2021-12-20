#!/bin/sh
set -xe

function COPY {
    [ -f $1 ] && mv $1 .bak
    [ -d $1 ] && mv $1 .bak     
    cp ~/$1 $1 -r
}

COPY .config/alacritty/
COPY .config/awesome/
COPY .config/rofi/
COPY .bashrc
COPY .profile
COPY .config/picom.conf
COPY .config/nvim/
COPY .config/neofetch/
COPY .themes/
COPY .icons/
COPY .config/gtk-3.0/
rm .bak -r
