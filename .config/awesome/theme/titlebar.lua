local awful = require("awful")
local wibox = require("wibox")

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

    local size_pad = 10;
    local edge_pad = 10;

    awful.titlebar(c, {
        size = 40,
        position = "top",
	}).widget = {
		layout = wibox.layout.align.horizontal,
		{
			layout = wibox.layout.fixed.horizontal,
			wibox.container.margin(awful.titlebar.widget.closebutton(c), edge_pad, 0, size_pad, size_pad),
			wibox.container.margin(awful.titlebar.widget.maximizedbutton(c), 10, 0, size_pad+1, size_pad+1),
		},
		{layout = wibox.layout.fixed.horizontal, buttons = buttons},
		{layout = wibox.layout.fixed.horizontal, buttons = buttons}
	}
end)
