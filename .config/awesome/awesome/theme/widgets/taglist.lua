local awful = require("awful")
local wibox = require("wibox")

return function(s)
	return awful.widget.taglist {
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = awful.util.taglist_buttons,
		layout = {
			layout = wibox.layout.fixed.horizontal,
			spacing = 0,
		},
	}
end
