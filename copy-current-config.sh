COPY() {
	echo "Copying $1 from $2"
	
	mv .config/$1 bak
	cp -r $2$1 .config/
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
COPY rofi ~/.config/
COPY .bashrc ~/
COPY .profile ~/
COPY picom.conf ~/.config/
COPY nvim ~/.config/
COPY neofetch ~/.config/
