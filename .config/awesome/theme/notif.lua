local naughty = require("naughty")

-- Notifications
naughty.config.spacing = 10
naughty.config.padding = 10
naughty.config.defaults.margin = 20
naughty.config.defaults.border_width = 0

naughty.config.presets.critical.bg = "#cf6a4c"
naughty.config.presets.critical.fg = "#151515"
naughty.config.presets.normal.bg = "#151515"
naughty.config.presets.normal.fg = "#888888"
