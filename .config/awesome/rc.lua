require("awful.autofocus")
local beautiful = require("beautiful")

-- Init Theme
beautiful.init(string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME")))

-- Signals
require("theme.signals.volume")
-- require("theme.signals.backlight") -- for laptop

require("theme.notif")
require("theme.client")
require("theme.titlebar")
require("settings")
require("settings.autostart")
