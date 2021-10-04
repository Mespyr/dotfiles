--[[

        Awesome WM theme config
        github.com/Mespyr

-]]


-- ##################### Imports ###############################################################################
local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi
-- local center = require("center")
local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
-- #############################################################################################################



-- ######################## Theme ##############################################################################
local theme = {}
theme.dir = os.getenv("HOME") .. "/.config/awesome"
-- Wallpaper
theme.wallpaper = theme.dir .. "/wall7.jpg"
-- Font
theme.font_name = "Hermit"
theme.font = theme.font_name .. " 7"
-- useless gap
theme.useless_gap = dpi(0)
-- Colors
theme.bg_normal = "#12191d"
theme.bg_focus = "#757676"
theme.fg_normal = "#FFEFE5"
theme.fg_focus = theme.bg_normal
theme.widget_bg = "#33383B"
-- Borders
theme.border_width = dpi(0)
theme.border_normal = "#33383B"
theme.border_focus = "#A88D74"
-- theme.border_focus = theme.bg_focus
theme.titlebar_bg_focus = theme.border_focus
theme.titlebar_bg_normal = theme.border_normal
-- Panel
theme.panel_height = dpi(20)

theme.taglist_bg_occupied                       = "#7d6b97"
theme.taglist_fg_occupied                       = theme.fg_focus
theme.taglist_bg_empty                          = theme.bg_focus
theme.taglist_fg_empty                          = theme.bg_focus
theme.taglist_bg_focus                          = theme.border_focus
theme.taglist_fg_focus                          = theme.border_focus
-- Icons
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
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
theme.widget_power_btn                          = theme.dir .. "/icons/power.png"
-- #############################################################################################################



-- ######################## Util ###############################################################################
local add_styling = function(widget)
    return wibox.container.background(
        widget,
        theme.widget_bg
    )
end
-- #############################################################################################################




-- ############################## Widgets ######################################################################
local markup = lain.util.markup

local spr = wibox.widget.textbox('  ')
local small_spr = wibox.widget.textbox(' ')

-- Textclock
local clocktext = awful.widget.watch(
    "date +'%a %I:%M'", 60,
    function(widget, stdout)
        widget:set_markup(" " .. markup.font(theme.font, stdout))
    end
)

local clock = wibox.widget{
	{
        layout = wibox.layout.fixed.horizontal,
        spr,
        clocktext,
        spr,
        small_spr
    },
	widget = wibox.container.background
}

-- Battery
local baticon = wibox.widget {
	widget = wibox.widget.imagebox,
	image = theme.widget_battery,
}

local battery = lain.widget.bat({
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

local bat = wibox.widget{
	{
        layout = wibox.layout.fixed.horizontal,
        spr,
        wibox.container.margin(baticon, 4, 1, 2, 3),
        battery,
        spr,
    },
	widget = wibox.container.background
}

-- #############################################################################################################



-- screen
function theme.at_screen_connect(s)
    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- layout box
    s.mylayoutbox = wibox.widget {
    	{
            layout = wibox.layout.fixed.horizontal,
            spr,
            wibox.container.margin(awful.widget.layoutbox(s), 1, 1, 3, 3),
            spr,
        },
    	widget = wibox.container.background
    }
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))

    -- local box = function(cr, width, height)
    --     return gears.shape.rectangle(cr, width, height, 2)
    -- end

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = awful.util.taglist_buttons,
        style = {
            shape = gears.shape.rounded_rect
        },
        layout = {
            spacing = 10,
            layout  = wibox.layout.fixed.horizontal
        }
    }

    s.mytaglist = wibox.widget {
    	{
            layout = wibox.layout.fixed.horizontal,
            spr,
            spr,
            wibox.container.margin(s.mytaglist, 6, 6, 6, 6),
            spr,
            spr
        },
    	widget = wibox.container.background
    }

    -- Create the wibox
    s.mywibox = awful.wibar {
        position = "top",
        screen = s,
        height = theme.panel_height,
        bg = theme.bg_normal,
        fg = theme.fg_normal,
    }


    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        {
            layout = wibox.layout.fixed.horizontal,
            -- add_styling(s.mylayoutbox),
            -- spr,
            -- spr,
            add_styling(clock),
            spr,
            spr,
            add_styling(bat)
        },
        {
            layout = wibox.layout.fixed.horizontal,
            add_styling(s.mytaglist),
        },
        {
            layout = wibox.layout.fixed.horizontal,
            add_styling(s.mylayoutbox),
        }
    }

end

return theme
