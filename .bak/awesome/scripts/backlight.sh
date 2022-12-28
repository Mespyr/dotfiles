for pid in $(ps aux | grep ~/.config/awesome/scripts/backlight.sh | grep -v grep | awk '{ print $2 }'); do
	if [ "$pid" != "$$" ]; then
		kill -9 $pid
	fi
done

OLD_BACKLIGHT=-1

while [ true ]; do
	BL=$(xbacklight -get)
	
	if [ "$BL" != "$OLD_BACKLIGHT" ]; then
		OLD_BACKLIGHT="$BL"

		echo $BL
	fi
done
