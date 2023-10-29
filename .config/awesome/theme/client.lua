local awful = require("awful")
local wibox = require("wibox")

client.connect_signal("manage", function(c)
    if not awesome.startup then
        awful.client.setslave(c)
    end
    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

client.connect_signal("request::titlebars", function(c)
    local buttons = awful.util.table.join(
        awful.button({ }, 1, function()
            client.focus = c
            c:raise()
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            client.focus = c
            c:raise()
            awful.mouse.client.resize(c)
        end)
	)

	local border_width = 4;
    awful.titlebar(c, {
        size = border_width, position = "left",
		widget = {layout = wibox.layout.align.horizontal, buttons = buttons}
	})
    awful.titlebar(c, {
        size = border_width, position = "top",
		widget = {layout = wibox.layout.align.horizontal, buttons = buttons}
	})
    awful.titlebar(c, {
        size = border_width, position = "right",
		widget = {layout = wibox.layout.align.horizontal, buttons = buttons}
	})
    awful.titlebar(c, {
        size = border_width, position = "bottom",
		widget = {layout = wibox.layout.align.horizontal, buttons = buttons}
	})
end)
