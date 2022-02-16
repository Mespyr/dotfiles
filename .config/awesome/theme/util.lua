local wibox = require("wibox")
local gears = require("gears")

local shape = function(cr, width, height)
	gears.shape.rounded_rect(cr, width, height, 4)
end

local util = {}

util.seperator = wibox.widget.separator{
    orientation = "horizontal",
    forced_height = 1,
    color = "#2e2e2e"
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
	return wibox.container.background(
		wibox.container.margin(widget, 6, 6, 5, 5), bg, shape
	)
end

util.spacer = wibox.container.margin(nil, 0, 0, 15, 0)

return util
