local awful = require("awful")

-- Run once to initialize widgets
awful.spawn.easy_async ("xbacklight -get", {
	stdout = function(line) awesome.emit_signal("signal::backlight", tonumber(line)) end
})

-- sleep until script detects change in backlight
local volume_script = "bash " .. os.getenv("HOME") .. "/.config/awesome/scripts/backlight.sh"

-- Run emit_backlight_info() with each line printed
awful.spawn.with_line_callback(volume_script, {
	stdout = function(line) awesome.emit_signal("signal::backlight", tonumber(line)) end
})
