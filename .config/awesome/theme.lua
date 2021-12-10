-- imports
local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local os = os

-- theme
local theme = {}
theme.dir = os.getenv("HOME") .. "/.config/awesome"
-- Wallpaper
theme.wallpaper = theme.dir .. "/wallpapers/wall11.png"
-- Font
theme.font_name = "SauceCodePro Nerd Font"
theme.font = theme.font_name .. " 5"
-- useless gap 
theme.useless_gap = 3
-- Colors
theme.bg_normal = "#151515"
theme.bg_focus = "#e8e8d3"
theme.fg_normal = theme.bg_focus
theme.fg_focus = theme.bg_normal
-- Borders
theme.border_width = 2
-- Panel
theme.panel_height = 50
-- notifications
theme.notification_icon_size = 80
-- taglist
-- set background color to same as bar
theme.taglist_bg_occupied                       = theme.bg_normal
theme.taglist_bg_focus                          = theme.bg_normal
theme.taglist_bg_empty                          = theme.bg_normal
-- foreground color of taglist
theme.taglist_fg_occupied                       = "#71b9f8"
theme.taglist_fg_empty                          = theme.fg_normal
theme.taglist_fg_focus                          = "#cf6a4c"

-- widgets
local markup = lain.util.markup
local spr = wibox.widget.textbox('  ')
local small_spr = wibox.widget.textbox(' ')

local clocktext = awful.widget.watch(
    "date +'%I:%M'", 60,
    function(widget, stdout)
        widget:set_markup(markup.font(theme.font, stdout))
    end
)

local battery = lain.widget.bat({
    settings = function()
        if bat_now.status and bat_now.status ~= "N/A" then
            local perc = " " .. bat_now.perc .. "% "
            if bat_now.ac_status == 1 then
                perc = perc .. "(charging) "
            end
            widget:set_markup(markup.font(theme.font, perc))
        else
            widget:set_markup(markup.font(theme.font, " AC "))
        end
end})

-- layout
-- tag.connect_signal("property::layout", function(t)
--     awful.spawn.with_shell("notify-send 'Tag " .. t.name .. " is in " .. t.layout.name .. " mode'")
-- end)

-- screen
function theme.at_screen_connect(s)
    gears.wallpaper.maximized(theme.wallpaper, s, true)

    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = awful.util.taglist_buttons,
    }

    s.mywibox = awful.wibar {
        position = "bottom",
        screen = s,
        height = theme.panel_height,
        -- width = 1800,
        border_color = theme.border_normal,
        bg = theme.bg_normal,
        fg = theme.fg_normal,
        -- margins = {
        --     bottom = theme.useless_gap
        -- }
    }

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        {
            layout = wibox.layout.fixed.horizontal,
            spr,
            spr,
            spr,
            s.mytaglist,
        },
        {
            layout = wibox.layout.fixed.horizontal,
            wibox.container.margin(clocktext, 0, 0, 15, 15)
        },
        {
            layout = wibox.layout.fixed.horizontal,
            battery,
            spr,
            spr,
            small_spr
        },
    }
    s.padding = {
        top = 6,
        left = 10,
        right = 10, 
        bottom = 6,
    }
end

return theme
