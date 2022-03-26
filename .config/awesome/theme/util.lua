local wibox = require("wibox")
local gears = require("gears")

local util = {}

util.shape = function(cr, width, height)
	gears.shape.rounded_rect(cr, width, height, 5)
end

util.top_half_shape = function(cr, width, height)
	gears.shape.partially_rounded_rect(cr, width, height, true, true, false, false, 5)
end

util.bot_half_shape = function(cr, width, height)
	gears.shape.partially_rounded_rect(cr, width, height, false, false, true, true, 5)
end

util.seperator = wibox.widget.separator {
    orientation = "horizontal",
    forced_height = 2,
	thickness = 2,
    color = "#212121"
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

util.widget_background = function(widget, bg, label_widget, label_bg)
	if label_widget == nil then
		return {
			wibox.container.background(wibox.container.margin(widget, 5, 5, 4, 4), bg, util.shape),
			layout = wibox.layout.fixed.vertical
		}
	else
		return {
			wibox.container.background(wibox.container.margin(util.center(label_widget), 0, 0, 2, 2), label_bg, util.top_half_shape),
			wibox.container.background(wibox.container.margin(                   widget, 5, 5, 4, 4),       bg, util.bot_half_shape),
			layout = wibox.layout.fixed.vertical
		}
	end
end

util.spacer = wibox.container.margin(nil, 0, 0, 12, 0)

return util
