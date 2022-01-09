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
theme.useless_gap = 5
-- Colors
theme.bg_normal = "#151515"
theme.bg_focus = "#e8e8d3"
theme.fg_normal = "#888888"
theme.fg_focus = theme.bg_normal
-- Borders
theme.border_width = 0
theme.border_normal = "#3b3b3b"
-- titlebar
local new_shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, 5) end
theme.titlebar_close_button_normal = gears.surface.load_from_shape(20, 20, new_shape, "#15151599")
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
-- local spr = wibox.widget.textbox('  ')
-- local small_spr = wibox.widget.textbox(' ')
local widget_seperator = wibox.widget.separator{
    orientation = "horizontal",
    forced_height = 20,
    color = "#3b3b3b"
}

local clocktext = awful.widget.watch(
    "date +'%I%M'", 60,
    function(widget, stdout)
        widget:set_markup(markup.font(theme.font, stdout:gsub("\n", "")))
    end
)

local battery = lain.widget.bat({
    settings = function()
        if bat_now.status ~= "N/A" then
            local perc

            if bat_now.ac_status == 1 then
                perc = "ch"
            else
                perc = bat_now.perc
            end

            -- awful.spawn.with_shell("notify-send " .. bat_now.perc .. type(bat_now.perc))
            if bat_now.perc == 100 then
                perc = "ac"
            end

            widget:set_markup(markup.font(theme.font, perc))
        else
            widget:set_markup(markup.font(theme.font, "na"))
        end
end})

-- local volume = lain.widget.pulsebar {
--     width = 20, height = 100,
--     notification_preset = {
--         font = theme.font,
--         layout = wibox.layout.fixed.vertical
--     }
-- }

local volume = lain.widget.pulse {
    settings = function()
        local vlevel = volume_now.left

        if volume_now.left == "N/A" then vlevel = "na" end

        if volume_now.muted == "yes" then
            vlevel = "mu"
        end
        widget:set_markup(markup.font(theme.font, vlevel))
    end
}

-- screen
function theme.at_screen_connect(s)
    gears.wallpaper.maximized(theme.wallpaper, s, true)
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = awful.util.taglist_buttons,
        layout = {
            layout = wibox.layout.fixed.vertical,
        },
        style = {
            font = theme.font_name .. " 6",
        }
    }

    s.mywibox = awful.wibar {
        position = "left",
        screen = s,
        width = theme.panel_height,
        -- height = 1350,
        bg = theme.bg_normal,
        fg = theme.fg_normal,
        -- border_width = 3,
        margins = {
            -- left = 5,
        },
        -- border_color = theme.border_normal,
        -- shape = new_shape
    }

    s.mywibox:setup {
        layout = wibox.layout.align.vertical,
        expand = "none",
        {
            layout = wibox.layout.fixed.vertical,
            wibox.container.margin(s.mytaglist, 11, 11, 15, 5),
        },
        {
            layout = wibox.layout.fixed.vertical,
            widget_seperator,
            wibox.container.margin(clocktext, 11, 11, 5, 5),
            widget_seperator,
        },
        {
            layout = wibox.layout.fixed.vertical,
            widget_seperator,
            wibox.container.margin(volume, 11, 11, 5, 5),
            widget_seperator,
            wibox.container.margin(battery, 11, 11, 5, 18),
        },
    }
    s.padding = {
        -- top = 5,
        left = 5,
        right = 5,
        -- bottom = 5,
    }
end

return theme
