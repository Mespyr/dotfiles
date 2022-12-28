-- imports
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

local util            = require("theme.util")
local clocktext       = require("theme.widgets.clock")
local volume          = require("theme.widgets.volume")
local make_taglist    = require("theme.widgets.taglist")

local theme = {}
theme.dir       = os.getenv("HOME") .. "/.config/awesome"
theme.icon_dir  = os.getenv("HOME") .. "/.config/awesome/theme/icons"
theme.wallpaper = theme.dir .. "/wallpapers/wall38.jpg"

theme.font_name     = "Cartograph CF Nerd Font"
theme.font          = theme.font_name .. " 9"
theme.taglist_font  = theme.font_name .. " 9"
theme.titlebar_font = theme.font_name .. " 9"

theme.bg_normal           = "#161616"
theme.bg_focus            = "#262626"
theme.fg_normal           = "#4c4c4c"
theme.fg_focus            = theme.bg_normal

theme.taglist_fg_occupied = "#525252"
theme.taglist_fg_empty    = "#525252"
theme.taglist_fg_focus    = "#ff7eb6"
theme.taglist_bg_occupied = theme.bg_focus
theme.taglist_bg_focus    = theme.bg_focus
theme.taglist_bg_empty    = theme.bg_focus

theme.titlebar_bg_normal  = "#262626"
theme.titlebar_bg_focus   = "#393939"

theme.useless_gap  = 8
theme.border_width = 0
theme.panel_size   = 30
theme.notification_icon_size = 100

theme.at_screen_connect = function(s)
    gears.wallpaper.maximized(theme.wallpaper, s, true)
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    s.mytaglist = make_taglist(s)

    s.mywibox = awful.wibar {
        screen = s,
		position = "top",
        height = theme.panel_size,
		-- height = 1000,
		-- shape = util.shape,
		-- margins = {
		-- 	left = 5,
		-- },
		widget = {
			layout = wibox.layout.align.horizontal,
			expand = "none",
			{
				layout = wibox.layout.fixed.horizontal,
				util.spacer,
				s.mytaglist,
				util.spacer,
				volume,
			},
			nil,
			{
				layout = wibox.layout.fixed.horizontal,
				util.spacer,
				clocktext,
				util.spacer,
			},
		}
	}
end

return theme
