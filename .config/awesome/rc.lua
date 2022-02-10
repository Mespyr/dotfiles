local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")

-- Awesome Errors on startup
if awesome.startup_errors then
    awful.spawn.with_shell("notify-send -u critical 'Oops, there were errors during startup!' '" .. awesome.startup_errors .. "'")
end
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true
        awful.spawn.with_shell("notify-send -u critical 'Oops, an error happened!' '" .. tostring(err) .. "'")
        in_error = false
    end)
end

-- Init Theme
beautiful.init(string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME")))

require("theme.notifications")
require("theme.client")
require("theme.titlebar")
require("settings")
require("settings.autostart")
