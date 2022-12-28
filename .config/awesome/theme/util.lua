local wibox = require("wibox")

local util = {}

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

return util
