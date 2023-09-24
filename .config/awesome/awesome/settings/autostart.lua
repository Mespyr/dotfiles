local awful = require("awful")

local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

run_once({
	"xrandr --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --primary --mode 2560x1440 --pos 1080x240 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate left",
    "picom",
    "setxkbmap -option ctrl:nocaps",
    "xset -b",
})
