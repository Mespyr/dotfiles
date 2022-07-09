-- imports
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

local util            = require("theme.util")
local clocktext       = require("theme.widgets.clock")
local battery         = require("theme.widgets.battery")
local make_taglist    = require("theme.widgets.taglist")

local theme = {}
theme.dir       = os.getenv("HOME") .. "/.config/awesome"
theme.icon_dir  = os.getenv("HOME") .. "/.config/awesome/theme/icons"
theme.wallpaper = theme.dir .. "/wallpapers/wall45.png"

theme.font_name    = "Cartograph CF Nerd Font"
theme.font         = theme.font_name .. " 6"
-- theme.taglist_font = theme.font_name .. " 6"

theme.bg_normal           = "#0f0f0f"
theme.bg_focus            = "#363636"
theme.fg_normal           = "#828282"
theme.fg_focus            = theme.bg_normal
theme.border_normal       = "#0f0f0f"
theme.border_focus        = "#0f0f0f"

theme.taglist_fg_occupied = "#363636"
theme.taglist_fg_empty    = "#1c1c1c"
theme.taglist_fg_focus    = "#ac8a8c"
theme.taglist_bg_occupied = theme.bg_normal
theme.taglist_bg_focus    = theme.bg_normal
theme.taglist_bg_empty    = theme.bg_normal
theme.taglist_shape       = util.shape

theme.titlebar_bg_normal  = "#0f0f0f"
theme.titlebar_fg_normal  = "#8f8f8f"
theme.titlebar_bg_focus   = "#0f0f0f"
theme.titlebar_fg_focus   = "#8f8f8f"

theme.useless_gap  = 8
theme.border_width = 0
theme.panel_size   = 45
theme.notification_icon_size = 100
theme.notification_shape = util.shape

theme.layout_tile                                = theme.icon_dir .. "/layouts/tile.png"
theme.layout_floating                            = theme.icon_dir .. "/layouts/floating.png"
-- close
theme.titlebar_close_button_normal               = theme.icon_dir .. "/titlebar/close_normal.svg"
theme.titlebar_close_button_focus                = theme.icon_dir .. "/titlebar/close_focus.svg"
-- maximize
theme.titlebar_maximized_button_normal_inactive  = theme.icon_dir .. "/titlebar/maximize_normal.svg"
theme.titlebar_maximized_button_normal_active    = theme.icon_dir .. "/titlebar/maximize_normal.svg"
theme.titlebar_maximized_button_focus_inactive   = theme.icon_dir .. "/titlebar/maximize_focus.svg"
theme.titlebar_maximized_button_focus_active     = theme.icon_dir .. "/titlebar/maximize_focus.svg"
-- minimize
theme.titlebar_minimize_button_normal_inactive   = theme.icon_dir .. "/titlebar/minimize_normal.svg"
theme.titlebar_minimize_button_normal_active     = theme.icon_dir .. "/titlebar/minimize_normal.svg"
theme.titlebar_minimize_button_focus_inactive    = theme.icon_dir .. "/titlebar/minimize_focus.svg"
theme.titlebar_minimize_button_focus_active      = theme.icon_dir .. "/titlebar/minimize_focus.svg"

theme.at_screen_connect = function(s)
    gears.wallpaper.maximized(theme.wallpaper, s, true)
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    s.mytaglist   = make_taglist(s)

    s.mywibox = awful.wibar {
        screen = s,
        position = "left",
        width = theme.panel_size,
		height = 600,
		shape = util.shape,
		margins = {
			left = 10
		},
		widget = {
			layout = wibox.layout.align.vertical,
			expand = "none",
			{
				layout = wibox.layout.fixed.vertical,
				util.spacer,
				util.center(s.mytaglist),
				-- wibox.container.margin(wibox.container.background(s.mylayoutbox, "#272727", util.shape), 5, 5),
			},
			nil,
			{
				layout = wibox.layout.fixed.vertical,
				util.center(util.widget_background(battery, theme.bg_focus)),
				util.spacer,
				util.center(util.widget_background(clocktext, theme.bg_focus)),
				util.spacer,
			},
		}
	}
end

return theme
