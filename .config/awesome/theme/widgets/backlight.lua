local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

local beautiful = {
	bg_normal = "#0f0f0f",
	bg_focus  = "#262626",
	fg_normal = "#4c4c4c40"
}

local backlight_icon = wibox.widget {
    font = "Cartograph CF Nerd Font Mono 10",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox,
	text = ""
}

local progressbar = wibox.widget({
    {
        id = "backlight_progress",
        max_value = 100,
        background_color = beautiful.bg_focus,
        color = beautiful.fg_normal,
        widget = wibox.widget.progressbar,
		shape = function(cr, width, height)
			gears.shape.rounded_rect(cr, width, height, 8)
		end
    },
    direction = "east",
    layout = wibox.container.rotate,
})

local backlight_progress = progressbar.backlight_progress

local update_progress = function()
    awesome.connect_signal("signal::backlight", function(volume)
        backlight_progress:set_value(volume)
    end)
end
update_progress()

awesome.connect_signal("widget::backlight", function()
    update_progress()
end)

local backlight_setting = wibox.widget({
    {
        progressbar,
        {
            backlight_icon,
            fg = beautiful.fg_nromal,
            widget = wibox.container.background,
        },
        layout = wibox.layout.stack,
    },
    forced_height = 100,
    forced_width = 30,
    layout = wibox.layout.fixed.vertical,
})

backlight_progress:buttons(gears.table.join(
    awful.button({ }, 4, nil, function()
        awful.spawn.with_shell("xbacklight -inc 3")
        update_progress()
    end),
    awful.button({ }, 5, nil, function()
        awful.spawn.with_shell("xbacklight -dec 3")
        update_progress()
    end)
))

return backlight_setting
