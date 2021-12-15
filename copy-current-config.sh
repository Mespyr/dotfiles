#!/bin/sh
set -xe

alias c="cp -r"

c ~/.config/alacritty   .config/
c ~/.config/awesome     .config/
c ~/.config/rofi        .config/
c ~/.bashrc               .
c ~/.profile              .
c ~/.config/picom.conf  .config/
c ~/.config/nvim        .config/
c ~/.config/neofetch    .config/
c ~/.themes             .
c ~/.icons              .
