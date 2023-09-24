-- imports
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")

-- configuration for clients (windows)
require("theme.client")

local util            = require("theme.util")
local clockdate            = require("theme.widgets.clockdate")
local volume          = require("theme.widgets.volume")
local make_taglist    = require("theme.widgets.taglist")

local theme = {}
theme.dir       = os.getenv("HOME") .. "/.config/awesome"
theme.icon_dir  = os.getenv("HOME") .. "/.config/awesome/theme/icons"
theme.wallpaper = theme.dir .. "/wallpapers/wall69.jpg"

theme.font_name     = "Cartograph CF Nerd Font"
theme.font          = theme.font_name .. " 8"
theme.taglist_font  = theme.font_name .. " 8"
theme.titlebar_font = theme.font_name .. " 9"

theme.bg_normal           = "#1d1f21"
theme.bg_focus            = "#1d1f21"
theme.fg_normal           = "#3c3e3e"
theme.fg_focus            = theme.bg_normal

theme.taglist_fg_occupied = "#3c3e3e"
theme.taglist_fg_empty    = "#3c3e3e"
theme.taglist_fg_focus    = "#cc6666"
theme.taglist_bg_occupied = theme.bg_focus
theme.taglist_bg_focus    = theme.bg_focus
theme.taglist_bg_empty    = theme.bg_focus

theme.titlebar_bg_normal  = "#1d1f21"
theme.titlebar_bg_focus   = "#3c3e3e"

theme.useless_gap  = 8
theme.border_width = 0
theme.panel_size   = 36
theme.notification_icon_size = 100

-- Notifications
naughty.config.spacing = 10
naughty.config.padding = 10
naughty.config.defaults.margin = 20
naughty.config.defaults.border_width = 0

naughty.config.presets.critical.bg = "#ac8a8c"
naughty.config.presets.critical.fg = "#0f0f0f"
naughty.config.presets.normal.bg   = "#0f0f0f"
naughty.config.presets.normal.fg   = "#696969"

theme.at_screen_connect = function(s)
	awful.wallpaper {
		screen = s,
		widget = {
		    image = theme.wallpaper,
			resize = true,
            horizontal_fit_policy = "fit",
            vertical_fit_policy   = "fit",
			widget = wibox.widget.imagebox,
		},
	}
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    --s.mytaglist = make_taglist(s)
	--s.mytasklist = make_tasklist(s)

    --s.mywibox = awful.wibar {
    --    screen = s,
	--	position = "bottom",
    --    height = theme.panel_size,
	--	width = 600,
	--	shape = util.shape,
	--	margins = {
	--		bottom = 10,
	--	},
	--	widget = {
	--		layout = wibox.layout.align.horizontal,
	--		expand = "none",
	--		{
	--			layout = wibox.layout.fixed.horizontal,
	--			util.spacer,
	--			wibox.container.margin(util.rounded(s.mytaglist), 0, 0, 5, 5),
	--			util.spacer,
	--			wibox.container.margin(util.rounded(clockdate), 0, 0, 5, 5),
	--			util.spacer,
	--			wibox.container.margin(util.rounded(volume), 0, 0, 5, 5),
	--			--util.spacer,
	--			--wibox.container.margin(util.rounded(s.mytasklist), 0, 0, 5, 5),
	--		},
	--		nil,
	--		{
	--			layout = wibox.layout.fixed.horizontal,
	--		},
	--	}
	--}
end

return theme
