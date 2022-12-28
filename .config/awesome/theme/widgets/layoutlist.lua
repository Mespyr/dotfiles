local awful = require("awful")
local wibox = require("wibox")
local theme = require("beautiful")
local util  = require("theme.util")

return function(s)
	return awful.widget.layoutlist {
        screen = s,
        layout = wibox.layout.fixed.vertical,
        style = {
            spacing = 4,
            bg_selected = theme.bg_focus
        }
    }
end
