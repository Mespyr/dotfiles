local wibox = require("wibox")
local gears = require("gears")

local util = {}
util.shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 2)
end
-- util.center = function(widget)
-- 	return {
-- 		layout = wibox.layout.align.vertical,
-- 		expand = "none",
-- 		nil,
-- 		widget,
-- 		nil
-- 	}
-- end

util.spacer = wibox.container.margin(nil, 0, 10, 0, 0)
util.rounded = function(w)
	return wibox.container.background(w, "", util.shape)
end

return util
