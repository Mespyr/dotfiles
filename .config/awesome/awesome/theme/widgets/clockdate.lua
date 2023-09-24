local awful  = require("awful")
local lain   = require("lain")
local theme  = require("beautiful")
local markup = lain.util.markup
local wibox = require("wibox")

return wibox.container.background(
	awful.widget.watch(
		"date +' %0e %b, %I:%M '", 60,
		function(widget, stdout)
			widget:set_markup(markup.font(theme.font, stdout:sub(1, #stdout - 1)))
		end
	),
	"#3c3e3e30"
);
