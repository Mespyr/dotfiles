-- imports
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

-- theme
local theme = {}
theme.dir       = os.getenv("HOME") .. "/.config/awesome"
theme.icon_dir  = os.getenv("HOME") .. "/.config/awesome/theme/icons"
theme.wallpaper = theme.dir .. "/wallpapers/wall24.png"

theme.font_name    = "Cartograph CF Nerd Font Mono"
theme.font         = theme.font_name .. " 5"
theme.taglist_font = theme.font_name .. " 6"

theme.bg_normal           = "#151515"
theme.bg_focus            = "#2e2e2e"
theme.fg_normal           = "#888888"
theme.border_normal       = "#3b3b3b"
theme.taglist_fg_occupied = "#597bc5"
theme.taglist_fg_empty    = "#3b3b3b"
theme.taglist_fg_focus    = "#99ad6a"
theme.taglist_bg_occupied = theme.bg_normal
theme.taglist_bg_focus    = theme.bg_normal
theme.taglist_bg_empty    = theme.bg_normal
theme.titlebar_bg_normal  = "#2e2e2e"
theme.titlebar_fg_normal  = "#888888"
theme.titlebar_bg_focus   = "#3b3b3b"
theme.titlebar_fg_focus   = "#888888"

theme.fg_focus = theme.bg_normal
theme.useless_gap = 5
theme.border_width = 0
theme.panel_height = 40
theme.notification_icon_size = 80

theme.layout_tile                                = theme.icon_dir .. "/layouts/tile.png"
theme.layout_floating                            = theme.icon_dir .. "/layouts/floating.png"
theme.titlebar_close_button_normal               = theme.icon_dir .. "/titlebar/close.svg"
theme.titlebar_close_button_focus                = theme.icon_dir .. "/titlebar/close.svg"
theme.titlebar_maximized_button_normal_inactive  = theme.icon_dir .. "/titlebar/maximize.svg"
theme.titlebar_maximized_button_focus_inactive   = theme.icon_dir .. "/titlebar/maximize.svg"
theme.titlebar_maximized_button_normal_active    = theme.icon_dir .. "/titlebar/maximize.svg"
theme.titlebar_maximized_button_focus_active     = theme.icon_dir .. "/titlebar/maximize.svg"

-- widgets
local widget_seperator = wibox.widget.separator{
    orientation = "horizontal",
    forced_height = 17,
    color = "#3b3b3b"
}

local clocktext = require("theme.widgets.clock")
local battery = require("theme.widgets.battery")
local volume = require("theme.widgets.volume")

-- screen
function theme.at_screen_connect(s)
    gears.wallpaper.maximized(theme.wallpaper, s, true)
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    s.mytaglist = require("theme.widgets.taglist")(s)
    s.mytasklist = require("theme.widgets.tasklist")(s)
    s.mylayoutlist = require("theme.widgets.layoutlist")(s)

    s.mywibox = awful.wibar {
        screen = s,
        position = "left",
        width = theme.panel_height,
        bg = theme.bg_normal,
        fg = theme.fg_normal,
		widget = {
			layout = wibox.layout.align.vertical,
			expand = "none",
			{
				layout = wibox.layout.fixed.vertical,
				wibox.container.margin(s.mylayoutlist, 6, 6, 18, 8),
				widget_seperator,
				wibox.container.margin(s.mytaglist, 11, 11, 18, 18),
				widget_seperator,
				wibox.container.margin(clocktext, 11, 11, 10, 10),
				widget_seperator,
				wibox.container.margin(s.mytasklist, 6, 6, 5, 5),
			},
			nil,
			{
				layout = wibox.layout.fixed.vertical,
				widget_seperator,
				wibox.container.margin(volume, 11, 11, 5, 5),
				widget_seperator,
				wibox.container.margin(battery, 11, 11, 10, 18),
			},
		}
	}
end

return theme
