local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

client.connect_signal("manage", function(c)
    c.shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, 6) end

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

    local size_pad = 8;
    local edge_pad = 8;

    awful.titlebar(c, {
        size = 35,
        position = "top",
        -- expand = "none",
	}).widget = {
		layout = wibox.layout.align.horizontal,
		{
			layout = wibox.layout.fixed.horizontal,
			wibox.container.margin(awful.titlebar.widget.closebutton(c), edge_pad, 0, size_pad, size_pad),
		},
		{
			layout = wibox.layout.flex.horizontal,
			{
				align = "center",
				widget = awful.titlebar.widget.titlewidget(c),
			},
			buttons = buttons,
		},
		{
			layout = wibox.layout.fixed.horizontal,
			wibox.container.margin(awful.titlebar.widget.maximizedbutton(c), 0, edge_pad+2, size_pad+1, size_pad+1),
		}
	}


	-- awful.spawn.with_shell("notify-send \"" .. tostring(awful.titlebar.widget.maximizedbutton(c):im) .. "\"")
end)
