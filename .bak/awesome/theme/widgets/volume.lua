local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

local beautiful = {
	bg_normal = "#0f0f0f",
	bg_focus  = "#262626",
	fg_normal = "#4c4c4c40"
}

local volume_icon = wibox.widget {
    font = "Cartograph CF Nerd Font Mono 14",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox,
	text = ""
}

local progressbar = wibox.widget({
    {
        id = "volume_progress",
        max_value = 100,
        background_color = beautiful.bg_focus,
        color = beautiful.fg_normal,
        widget = wibox.widget.progressbar,
		shape = function(cr, width, height)
			gears.shape.rounded_rect(cr, width, height, 5)
		end
    },
    direction = "east",
    layout = wibox.container.rotate,
})

local volume_progress = progressbar.volume_progress

local update_progress = function()
    awesome.connect_signal("signal::volume", function(volume, mute)
        if mute then
			volume_icon:set_markup("ﳌ")
        else
			volume_icon:set_markup("")
        end
        volume_progress:set_value(volume)
    end)
end
update_progress()

awesome.connect_signal("widget::volume", function()
    update_progress()
end)

local volume_setting = wibox.widget({
    {
        progressbar,
        {
            volume_icon,
            fg = beautiful.fg_nromal,
            widget = wibox.container.background,
        },
        layout = wibox.layout.stack,
    },
    forced_height = 70,
    forced_width = 25,
    layout = wibox.layout.fixed.vertical,
})

volume_progress:buttons(gears.table.join(
    awful.button({ }, 1, nil, function()
        awful.spawn.with_shell "pactl set-sink-mute @DEFAULT_SINK@ toggle"
        update_progress()
    end),
    awful.button({ }, 4, nil, function()
        awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ +3%")
        update_progress()
    end),
    awful.button({ }, 5, nil, function()
        awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ -3%")
        update_progress()
    end)
))

return volume_setting
