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
COPY .config/awesome/
COPY .config/rofi/
COPY .bashrc
COPY .profile
COPY .xinitrc
COPY .config/picom.conf
COPY .config/nvim/
COPY .config/neofetch/

COPY .config/gtk-3.0/
COPY .themes/
COPY .local/share/fonts/

COPY .emacs.d/init.el
rm .bak -r
