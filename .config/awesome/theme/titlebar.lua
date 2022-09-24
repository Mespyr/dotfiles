local awful = require("awful")
local wibox = require("wibox")
local util  = require("theme.util")

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


	-- left
    -- local size_margin = 7;
    -- awful.titlebar(c, {
    --     size = 40,
    --     position = "left",
	-- }).widget = {
		-- layout = wibox.layout.align.vertical,
		-- {
			-- layout = wibox.layout.fixed.vertical,
			-- wibox.container.margin(awful.titlebar.widget.closebutton     (c), size_margin, size_margin, 8, 0),
			-- wibox.container.margin(awful.titlebar.widget.maximizedbutton (c), size_margin, size_margin, 0, 0),
			-- wibox.container.margin(awful.titlebar.widget.minimizebutton  (c), size_margin, size_margin, 0, 0),
		-- },
		-- {
			-- layout = wibox.layout.fixed.vertical, buttons = buttons,
			-- -- wibox.container.margin(awful.titlebar.widget.titlewidget(c), 10, 0, 0, 0),
		-- },
	-- }

	-- top
    local size_margin = 2;
    local block_margin = 8;
    awful.titlebar(c, {
        size = 45,
        position = "top",
	}).widget = {
		layout = wibox.layout.align.horizontal,
		{
			layout = wibox.layout.fixed.horizontal,
			wibox.container.margin(util.widget_background_horizontal({
				layout = wibox.layout.fixed.horizontal,
				wibox.container.margin(awful.titlebar.widget.closebutton     (c), 10, 0, size_margin, size_margin),
				wibox.container.margin(awful.titlebar.widget.maximizedbutton (c), 8, 0, size_margin, size_margin),
				wibox.container.margin(awful.titlebar.widget.minimizebutton  (c), 8, 10, size_margin, size_margin),
			}, "#262626"), block_margin, 0, block_margin, block_margin)
		},
		{
			layout = wibox.layout.fixed.horizontal, buttons = buttons,
			wibox.container.margin(util.widget_background_horizontal(
				wibox.container.margin(
					awful.titlebar.widget.titlewidget(c), 8, 8, 0, 0),
				"#262626"), block_margin, block_margin, block_margin, block_margin),
		},
	}

end)
