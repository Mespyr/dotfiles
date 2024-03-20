#!/bin/sh

function COPY {
    set +xe
    [ -f $1 ] && mv $1 .bak
    [ -d $1 ] && mv $1 .bak
    cp ~/$1 $1 -r
    set -xe
}

set -xe
COPY .config/alacritty/
COPY .bashrc
COPY .profile
COPY .xinitrc
COPY .config/picom.conf
COPY .config/neofetch/
COPY .config/gtk-3.0/
COPY .config/WALLPAPER.png
COPY .emacs.d/init.el

rm .bak -r
