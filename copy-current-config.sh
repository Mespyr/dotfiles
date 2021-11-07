COPY() {
	echo "Copying $1 from $2"
	
	mv $1 bak
	cp -r $2$1 .
	rm -r bak
}


if [ -d bak ]; then
	rm -r bak/
fi

if [ -f bak ]; then
	rm bak
fi


COPY alacritty ~/.config/
COPY awesome ~/.config/
#COPY rofi ~/.config/
COPY .bashrc ~/ 
COPY picom.conf ~/.config/
# COPY bookmarks ~/.config/
COPY nvim ~/.config/
# COPY scripts ~/.config/
COPY neofetch ~/.config/
