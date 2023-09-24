require("awful.autofocus")
local beautiful = require("beautiful")

require("settings.autostart")
beautiful.init(string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME")))
require("settings")
