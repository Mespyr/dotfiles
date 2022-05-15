local wibox = require("wibox")
local gears = require("gears")

local util = {}

util.shape = function(cr, width, height)
	gears.shape.rounded_rect(cr, width, height, 5)
end

util.seperator = wibox.widget.separator {
    orientation = "horizontal",
    forced_height = 2,
	thickness = 2,
    color = "#1c1c1c"
}

util.center = function(widget)
	return {
		layout = wibox.layout.align.horizontal,
		expand = "none",
		nil,
		widget,
		nil
	}
end

util.widget_background = function(widget, bg)
	return wibox.container.background(wibox.container.margin(widget, 5, 5, 4, 4), bg, util.shape)
end

util.spacer = wibox.container.margin(nil, 0, 0, 15, 0)

return util
