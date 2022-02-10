local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local theme = require("beautiful")

local new_shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, 4) end

return function(s)
	return awful.widget.layoutlist {
        screen = s,
        layout = wibox.layout.fixed.vertical,
        style = {
            shape_selected = new_shape,
            spacing = 6,
            bg_selected = theme.bg_focus
        }
    }
end
