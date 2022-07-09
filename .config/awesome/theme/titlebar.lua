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

    local size_margin = 7;

    awful.titlebar(c, {
        size = 40,
        position = "left",
	}).widget = {
		layout = wibox.layout.align.vertical,
		{
			layout = wibox.layout.fixed.vertical,
			wibox.container.margin(awful.titlebar.widget.closebutton     (c), size_margin, size_margin, 8, 0),
			wibox.container.margin(awful.titlebar.widget.maximizedbutton (c), size_margin, size_margin, 0, 0),
			wibox.container.margin(awful.titlebar.widget.minimizebutton  (c), size_margin, size_margin, 0, 0),
		},
		{
			layout = wibox.layout.fixed.vertical, buttons = buttons,
			-- wibox.container.margin(awful.titlebar.widget.titlewidget(c), 10, 0, 0, 0),
		},
	}
end)
