require("awful.autofocus")
local beautiful = require("beautiful")

-- Init Theme
beautiful.init(string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME")))

require("theme.notif")
require("theme.client")
require("theme.widgets.titlebar")
require("settings")
require("settings.autostart")
