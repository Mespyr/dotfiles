COPY() {
	# argv: $1 = filename; $2 = file location 
	[ -d $1 ] && cp -r $1 .bak/
	[ -f $1 ] && cp $1 .bak
	cp -r $2$1 .
	[ -d .bak ] && rm -r .bak/
	[ -f .bak ] && rm .bak
}

COPY alacritty ~/.config/
COPY awesome ~/.config/
COPY rofi ~/.config/
COPY .bashrc ~/ 
COPY picom.conf ~/.config/
COPY nvim ~/.config/
