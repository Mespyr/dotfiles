--[[

    Gruvbox Theme for AwesomeWM
    github.com/Mespyr

--]]


-- Imports
local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility


-- Theme
local theme = {}
theme.dir = os.getenv("HOME") .. "/.config/awesome/themes/gruvbox"
-- Wallpaper
theme.wallpaper = theme.dir .. "/wall2.png"
-- Font
theme.font_name = "Fira Code"
theme.font = theme.font_name .. " 9"
-- Colors
theme.fg_normal = "#D2C19F"
theme.fg_focus = "#fe8019"
theme.bg_normal = "#1D2021"
theme.bg_focus = "#282828"
-- Foreground Text Colors
theme.fg_colors = {}
theme.fg_colors.aqua = "#689d6a"
theme.fg_colors.blue = "#458588"
-- Panel Widget Colors
theme.widget_colors = {}
theme.widget_colors.volume = "#F4564A"
theme.widget_colors.battery = "#a1a529"
theme.widget_colors.time_cal = "#5D7B74"
theme.widget_colors.layoutbox = "#dba730"

-- Borders
theme.border_width = dpi(2)
theme.border_normal = "#3f3f3f"
theme.border_focus = "#689d6a"
theme.border_marked = "#cc9393"
-- Menu
theme.menu_height = dpi(23)
theme.menu_width = dpi(130)
-- Panel
theme.panel_height = dpi(28)
-- Icons
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note_on.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"

theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon = true
theme.useless_gap = dpi(15)



-- Widgets
local markup = lain.util.markup
local separators = lain.util.separators

-- Textclock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.watch(
    "date +'%a %d %b %R'", 60,
    function(widget, stdout)
        widget:set_markup(" " .. markup.font(theme.font, stdout))
    end
)

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { clock },
    notification_preset = {
        font = theme.font_name .. " 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- MPD
local musicplr = awful.util.terminal .. " -title Music -g 130x34-320+16 -e ncmpcpp"
local mpdicon = wibox.widget.imagebox(theme.widget_music)
mpdicon:buttons(
    my_table.join(
        awful.button({ modkey }, 1, 
            function() 
                awful.spawn.with_shell(musicplr) 
            end),
        awful.button({ }, 1, 
            function()
                os.execute("mpc prev")
                theme.mpd.update()
            end),
        awful.button({ }, 2, 
            function()
                os.execute("mpc toggle")
                theme.mpd.update()
            end),
        awful.button({ }, 3, 
            function ()
                os.execute("mpc next")
                theme.mpd.update()
            end)))
theme.mpd = lain.widget.mpd({
    settings = function()
        if mpd_now.state == "play" then
            artist = " " .. mpd_now.artist .. " "
            title  = mpd_now.title  .. " "
            mpdicon:set_image(theme.widget_music_on)
        elseif mpd_now.state == "pause" then
            artist = " mpd "
            title  = "paused "
        else
            artist = ""
            title  = ""
            mpdicon:set_image(theme.widget_music)
        end

        widget:set_markup(markup.font(theme.font, markup("#EA6F81", artist) .. title))
    end})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. mem_now.used .. "MB "))
    end})

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. cpu_now.usage .. "% "))
    end})

-- Battery
local baticon = wibox.widget.imagebox(theme.widget_battery)
local bat = lain.widget.bat({
    settings = function()
        if bat_now.status and bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                baticon:set_image(theme.widget_ac)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
                baticon:set_image(theme.widget_battery_empty)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
                baticon:set_image(theme.widget_battery_low)
            else
                baticon:set_image(theme.widget_battery)
            end
            widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
        else
            widget:set_markup(markup.font(theme.font, " AC "))
            baticon:set_image(theme.widget_ac)
        end
    end})

-- ALSA volume
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volicon:set_image(theme.widget_vol_mute)
        elseif tonumber(volume_now.level) == 0 then
            volicon:set_image(theme.widget_vol_no)
        elseif tonumber(volume_now.level) <= 50 then
            volicon:set_image(theme.widget_vol_low)
        else
            volicon:set_image(theme.widget_vol)
        end

        widget:set_markup(markup.font(theme.font, " " .. volume_now.level .. "% "))
    end})
theme.volume.widget:buttons(
    awful.util.table.join(
        awful.button({}, 4, 
            function()
                awful.util.spawn("amixer set Master 1%+")
                theme.volume.update()
            end),
        awful.button({}, 5, 
            function()
                    awful.util.spawn("amixer set Master 1%-")
                    theme.volume.update()
            end)))

-- Net
local neticon = wibox.widget.imagebox(theme.widget_net)
local net = lain.widget.net({
    settings = function()
        widget:set_markup(
            markup.font(theme.font,
                markup(theme.fg_normal, " " .. string.format("%06.1f", net_now.received))
                    .. " " ..
                markup(theme.fg_normal, " " .. string.format("%06.1f", net_now.sent) .. " ")))
    end})

-- Separators
local spr = wibox.widget.textbox('  ')
local small_spr = wibox.widget.textbox(' ')

-- local alpha_to_grey_arrow = separator.arrow_left("alpha", theme.widget_colors.grey)
local alpha_to_volume_arrow = separators.arrow_left("alpha", theme.widget_colors.volume)
local volume_to_battery_arrow = separators.arrow_left(theme.widget_colors.volume, theme.widget_colors.battery)
local battery_to_time_cal_arrow = separators.arrow_left(theme.widget_colors.battery, theme.widget_colors.time_cal)
local time_cal_to_layoutbox_arrow = separators.arrow_left(theme.widget_colors.time_cal, theme.widget_colors.layoutbox)



function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    -- s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = awful.util.taglist_buttons,
        style   = {
            shape = gears.shape.rounded_rect
        },
        layout   = {
            spacing = 1,
            -- spacing_widget = {
            --     color  = '#dddddd',
            --     shape  = gears.shape.rectangle,
            --     widget = wibox.widget.separator,
            -- },
            layout  = wibox.layout.fixed.horizontal
        }
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s, 
        filter  = awful.widget.tasklist.filter.currenttags, 
        buttons = awful.util.tasklist_buttons,

        style = {
            shape_border_width = 1,
            shape_border_color = '#777777',
            shape  = gears.shape.octogon
        },

        layout   = {
            spacing = 7,
            -- spacing_widget = {
            --     {
            --         forced_width = 10,
            --         shape        = gears.shape.circle,
            --         widget       = wibox.widget.separator
            --     },
            --     valign = 'center',
            --     halign = 'center',
            --     widget = wibox.container.place,
            -- },
            layout  = wibox.layout.flex.horizontal
        }

    }

    -- Create the wibox
    s.mywibox = awful.wibar({ 
        position = "top", 
        screen = s, 
        height = theme.panel_height, 
        bg = theme.bg_normal, 
        fg = theme.fg_normal 
    })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            -- yellow_to_alpha_right_arrow,
            -- spr,
            s.mypromptbox,
            -- spr,
            s.mytaglist,
            spr,
            spr,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spr,
            spr,
            -- wibox.widget.systray(),
            spr,
            spr,

            -- Volume Widget
            alpha_to_volume_arrow,
            wibox.container.background(volicon, theme.widget_colors.volume),
            wibox.container.background(theme.volume.widget, theme.widget_colors.volume),
            volume_to_battery_arrow,

            -- Battery Widget
            wibox.container.background(baticon, theme.widget_colors.battery),
            wibox.container.background(bat.widget, theme.widget_colors.battery),
            battery_to_time_cal_arrow,

            -- Time/Calander Widget
            wibox.container.background(clock, theme.widget_colors.time_cal),
            wibox.container.background(spr, theme.widget_colors.time_cal),

            -- Layoutbox Widget
            time_cal_to_layoutbox_arrow,
            wibox.container.background(s.mylayoutbox, theme.widget_colors.layoutbox),
        }
    }
end

return theme