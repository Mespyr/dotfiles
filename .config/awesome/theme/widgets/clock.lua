local awful = require("awful")
local lain = require("lain")
local theme = require("beautiful")
local markup = lain.util.markup

return awful.widget.watch(
    "date +'%I\n%M'", 60,
    function(widget, stdout)
		widget:set_markup(markup.font(theme.font, stdout:sub(1, #stdout - 1)))
    end
)
