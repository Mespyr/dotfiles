-- imports
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local lain = require("lain")

-- theme
local theme = {}
theme.dir = os.getenv("HOME") .. "/.config/awesome"
-- Wallpaper
theme.wallpaper = theme.dir .. "/wall.png"
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
theme.border_normal = "#3b3b3b"
-- titlebar
local new_shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, 5) end
theme.titlebar_close_button_normal = gears.surface.load_from_shape(20, 20, new_shape, "#15151590")
theme.titlebar_bg_normal = "#3b3b3b"
theme.titlebar_fg_normal = "#888888"
theme.titlebar_bg_focus = "#888888"
theme.titlebar_fg_focus = "#151515"
-- Panel
theme.panel_height = 40
-- notifications
theme.notification_icon_size = 80
-- taglist
-- set background color to same as bar
theme.taglist_bg_occupied                       = theme.bg_normal
theme.taglist_bg_focus                          = theme.bg_normal
theme.taglist_bg_empty                          = theme.bg_normal
-- foreground color of taglist
theme.taglist_fg_occupied                       = "#597bc5"
theme.taglist_fg_empty                          = "#3b3b3b"
theme.taglist_fg_focus                          = "#99ad6a"
theme.taglist_font                              = theme.font_name .. " 7"

-- widgets
local markup = lain.util.markup
local spr = wibox.widget.textbox('  ')
local small_spr = wibox.widget.textbox(' ')

local clocktext = awful.widget.watch(
    "date +'%I%M'", 60,
    function(widget, stdout)
        widget:set_markup(markup.font(theme.font, stdout))
    end
)

local battery = lain.widget.bat({
    settings = function()
        if bat_now.status ~= "N/A" then
            local perc = bat_now.perc

            if bat_now.ac_status == 1 then
                perc = "ch"
            end

            if perc == 100 then
                awful.spawn.with_shell("notify-send 1")
                perc = "ac"
            end

            widget:set_markup(markup.font(theme.font, perc))
        else
            widget:set_markup(markup.font(theme.font, "ac"))
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
            spacing = 2,
            layout = wibox.layout.fixed.vertical
        }
    }

    s.mywibox = awful.wibar {
        position = "left",
        screen = s,
        width = theme.panel_height,
        bg = theme.bg_normal,
        fg = theme.fg_normal,
        -- margins = {}
    }

    s.mywibox:setup {
        layout = wibox.layout.align.vertical,
        expand = "none",
        {
            layout = wibox.layout.fixed.vertical,
            wibox.container.margin(s.mytaglist, 10, 10, 15, 0),
        },
        {
            layout = wibox.layout.fixed.vertical,
            wibox.container.margin(clocktext, 10, 10, 0, 0),
        },
        {
            layout = wibox.layout.fixed.vertical,
            wibox.container.margin(battery, 10, 10, 0, 15),
        },
    }
    s.padding = {
        top = 1,
        left = 5,
        right = 5,
        bottom = 1,
    }
end

return theme
