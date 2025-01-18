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
COPY .config/emacs/
COPY .config/picom.conf
COPY .config/neofetch/
COPY .config/gtk-3.0/
COPY .config/WALLPAPER.jpg
COPY dwm_bar.sh

rm .bak -r

# remove some files
rm .config/emacs/elpa/ -r
rm .config/emacs/eln-cache/ -r
rm .config/emacs/auto-save-list/ -r
rm .config/emacs/.lsp-session-v1
