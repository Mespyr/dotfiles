-- imports
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local lain = require("lain")

-- theme
local theme = {}
theme.dir = os.getenv("HOME") .. "/.config/awesome"
-- Wallpaper
theme.wallpaper = theme.dir .. "/wallpapers/wall10.png"
-- Font
theme.font_name = "SpaceMono Nerd Font Mono"
theme.font = theme.font_name .. " 5"
-- useless gap
theme.useless_gap = 4
-- Colors
theme.bg_normal = "#151515"
theme.bg_focus = "#e8e8d3"
theme.fg_normal = theme.bg_focus
theme.fg_focus = theme.bg_normal
-- Borders
theme.border_width = 0
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
theme.taglist_fg_occupied                       =  "#99ad6a"
theme.taglist_fg_empty                          = "#3b3b3b"
theme.taglist_fg_focus                          = "#71b9f8"
theme.taglist_font                              = theme.font_name .. " 7"

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

-- screen
function theme.at_screen_connect(s)
    gears.wallpaper.maximized(theme.wallpaper, s, true)
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = awful.util.taglist_buttons,
        layout = {
        spacing = 3,
            layout = wibox.layout.fixed.horizontal
        }
    }

    s.mywibox = awful.wibar {
        position = "bottom",
        screen = s,
        height = theme.panel_height,
        bg = theme.bg_normal,
        fg = theme.fg_normal,
        -- margins = {
        --     bottom = 5,
        --     left = 300,
        --     right = 300,
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
    -- s.padding = {
    --     top = 1,
    --     left = 9,
    --     right = 9,
    --     bottom = 1,
    -- }
end

return theme
