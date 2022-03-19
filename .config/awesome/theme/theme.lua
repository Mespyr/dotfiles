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
theme.fg_focus            = theme.bg_normal
theme.border_normal       = "#3b3b3b"
theme.taglist_fg_occupied = "#597bc9"
theme.taglist_fg_empty    = "#3b3b3b"
theme.taglist_fg_focus    = "#99ad6a"
theme.taglist_bg_occupied = theme.bg_normal
theme.taglist_bg_focus    = theme.bg_normal
theme.taglist_bg_empty    = theme.bg_normal
theme.titlebar_bg_normal  = "#2e2e2e"
theme.titlebar_fg_normal  = "#888888"
theme.titlebar_bg_focus   = "#3b3b3b"
theme.titlebar_fg_focus   = "#888888"

theme.useless_gap  = 8
theme.border_width = 0
theme.panel_size   = 40
theme.notification_icon_size = 80

theme.layout_tile                                = theme.icon_dir .. "/layouts/tile.png"
theme.layout_floating                            = theme.icon_dir .. "/layouts/floating.png"
theme.titlebar_close_button_normal               = theme.icon_dir .. "/titlebar/close.svg"
theme.titlebar_close_button_focus                = theme.icon_dir .. "/titlebar/close.svg"
theme.titlebar_maximized_button_normal_inactive  = theme.icon_dir .. "/titlebar/maximize.svg"
theme.titlebar_maximized_button_focus_inactive   = theme.icon_dir .. "/titlebar/maximize.svg"
theme.titlebar_maximized_button_normal_active    = theme.icon_dir .. "/titlebar/maximize.svg"
theme.titlebar_maximized_button_focus_active     = theme.icon_dir .. "/titlebar/maximize.svg"
theme.titlebar_minimize_button_normal_inactive   = theme.icon_dir .. "/titlebar/minimize.svg"
theme.titlebar_minimize_button_focus_inactive    = theme.icon_dir .. "/titlebar/minimize.svg"
theme.titlebar_minimize_button_normal_active     = theme.icon_dir .. "/titlebar/minimize.svg"
theme.titlebar_minimize_button_focus_active      = theme.icon_dir .. "/titlebar/minimize.svg"

local util            = require("theme.util")
local clocktext       = require("theme.widgets.clock")
local battery         = require("theme.widgets.battery")
local volume          = require("theme.widgets.volume")
local make_taglist    = require("theme.widgets.taglist")
local make_tasklist   = require("theme.widgets.tasklist")
local make_layoutlist = require("theme.widgets.layoutlist")

-- screen
function theme.at_screen_connect(s)
    gears.wallpaper.maximized(theme.wallpaper, s, true)
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    s.mytaglist    = make_taglist(s)
    s.mytasklist   = make_tasklist(s)
    s.mylayoutlist = make_layoutlist(s)

    s.mywibox = awful.wibar {
        screen = s,
        position = "left",
        width = theme.panel_size,

		-- floating bar
		height = 1360,
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
				util.center(util.widget_background(clocktext, theme.bg_focus)),
				util.spacer,
				util.center(s.mytaglist),
				util.spacer,
				wibox.container.margin(s.mylayoutlist, 6, 6, 0, 0),
			},
			nil,
			{
				layout = wibox.layout.fixed.vertical,
				wibox.container.margin(s.mytasklist, 6, 6, 0, 0),
				util.spacer,
				util.seperator,
				util.spacer,
				util.center(util.widget_background(volume, theme.bg_focus, wibox.widget.textbox("蓼"), "#3b3b3b")),
				util.spacer,
				util.center(util.widget_background(battery, theme.bg_focus, wibox.widget.textbox(""), "#3b3b3b")),
				util.spacer,
			},
		}
	}

	s.padding = {
		top    = 5,
		bottom = 5,
		-- left   = 5,
		-- right  = 5
	}
end

return theme
