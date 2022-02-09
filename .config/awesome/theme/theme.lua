-- imports
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local lain = require("lain")

-- theme
local theme = {}
theme.dir = os.getenv("HOME") .. "/.config/awesome"
theme.wallpaper = theme.dir .. "/wallpapers/wall24.png"

theme.font_name    = "Cartograph CF Nerd Font Mono"
theme.font         = theme.font_name .. " 5"
theme.taglist_font = theme.font_name .. " 7"

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

theme.layout_tile                                = theme.dir .. "/icons/layouts/tile.png"
theme.layout_floating                            = theme.dir .. "/icons/layouts/floating.png"
theme.titlebar_close_button_normal               = theme.dir .. "/icons/titlebar/close.svg"
theme.titlebar_close_button_focus                = theme.dir .. "/icons/titlebar/close.svg"
theme.titlebar_maximized_button_normal_inactive  = theme.dir .. "/icons/titlebar/maximize.svg"
theme.titlebar_maximized_button_focus_inactive   = theme.dir .. "/icons/titlebar/maximize.svg"
theme.titlebar_maximized_button_normal_active    = theme.dir .. "/icons/titlebar/maximize.svg"
theme.titlebar_maximized_button_focus_active     = theme.dir .. "/icons/titlebar/maximize.svg"

-- widgets
local new_shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, 4) end
local markup = lain.util.markup
-- local spr = wibox.widget.textbox('  ')
-- local small_spr = wibox.widget.textbox(' ')
local widget_seperator = wibox.widget.separator{
    orientation = "horizontal",
    forced_height = 17,
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

local volume = lain.widget.pulse {
    settings = function()
        local vlevel = volume_now.left

        if volume_now.left == "N/A" then vlevel = "na" end
        if volume_now.left == "100" then vlevel = "fu" end

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

    s.mytasklist = awful.widget.tasklist {
        screen   = s,
        filter   = awful.widget.tasklist.filter.currenttags,
        layout   = {
            spacing = 6,
            layout  = wibox.layout.fixed.vertical
        },
        style = {
            shape = new_shape
        },
        widget_template = {
            {
                id = "background_role",
                {
                    awful.widget.clienticon,
                    margins = 6,
                    widget  = wibox.container.margin
                },
                widget = wibox.container.background,
            },
            nil,
            nil,
            layout = wibox.layout.align.vertical,
        },
    }

    s.mylayoutlist = awful.widget.layoutlist {
        screen = s,
        layout = wibox.layout.fixed.vertical,
        style = {
            shape_selected = new_shape,
            spacing = 6,
            bg_selected = theme.bg_focus
        }
    }

    s.mywibox = awful.wibar {
        position = "left",
        screen = s,
        width = theme.panel_height,
        bg = theme.bg_normal,
        fg = theme.fg_normal,
    }

    s.mywibox:setup {
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
    s.padding = {
        -- top = 5,
        -- left = 10,
        -- right = 10,
        -- bottom = 5,
    }
end

return theme
