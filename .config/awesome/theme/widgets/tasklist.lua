local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local new_shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, 4) end

return function(s)
	return awful.widget.tasklist {
        screen   = s,
        filter   = awful.widget.tasklist.filter.currenttags,
        layout   = {
            spacing = 10,
            layout  = wibox.layout.fixed.vertical
        },
        style = {
            shape = new_shape
        },
        widget_template = {
            {
                id = "background_role",
                {
                    awful.widget.clienticon,
                    margins = 6,
                    widget  = wibox.container.margin
                },
                widget = wibox.container.background,
            },
            nil,
            nil,
            layout = wibox.layout.align.vertical,
        },
    }
end
