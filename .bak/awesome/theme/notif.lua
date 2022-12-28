local naughty = require("naughty")

-- Notifications
naughty.config.spacing = 10
naughty.config.padding = 10
naughty.config.defaults.margin = 20
naughty.config.defaults.border_width = 0

naughty.config.presets.critical.bg = "#ac8a8c"
naughty.config.presets.critical.fg = "#0f0f0f"
naughty.config.presets.normal.bg   = "#0f0f0f"
naughty.config.presets.normal.fg   = "#696969"
