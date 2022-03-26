local awful = require("awful")
local wibox = require("wibox")
local util  = require("theme.util")

return function(s)
	return awful.widget.tasklist {
        screen   = s,
        filter   = awful.widget.tasklist.filter.currenttags,
        layout   = {
            spacing = 10,
            layout  = wibox.layout.fixed.vertical
        },
        style = {
            shape = util.shape
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
            layout = wibox.layout.align.vertical,
        },
    }
end
