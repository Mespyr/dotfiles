local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

local theme = {
	bg = "#3c3e3e50",
	fg = "#cc666690",
	bg_focus = "#3c3e3e90"

}

local volume_icon = wibox.widget {
    font = "Cartograph CF Nerd Font Mono 13",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox,
	text = ""
}

local progressbar = wibox.widget({
    {
        id = "volume_progress",
        max_value = 100,
        background_color = theme.bg,
        color = theme.bg_focus,
        widget = wibox.widget.progressbar,
    },
    direction = "east",
    layout = wibox.layout.fixed.horizontal,
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
            fg = theme.fg,
            widget = wibox.container.background,
        },
        layout = wibox.layout.stack,
    },
    -- forced_height = 20,
    forced_width = 100,
    layout = wibox.layout.fixed.horizontal,
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
