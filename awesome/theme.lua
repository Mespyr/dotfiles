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

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
-- #############################################################################################################



-- ######################## Theme ##############################################################################
local theme = {}
theme.dir = os.getenv("HOME") .. "/.config/awesome"
-- Wallpaper
theme.wallpaper = theme.dir .. "/wall5.jpg"
-- Font
theme.font_name = "UbuntuMono Nerd Font Mono"
theme.font = theme.font_name .. " 10"
-- useless gap
theme.useless_gap = dpi(3)
-- Colors
theme.bg_normal = "#12191d"
theme.bg_focus = "#a8a196"
theme.fg_normal = "#FFEFE5"
theme.fg_focus = theme.bg_normal
-- #0E1319
-- Borders
theme.border_width = dpi(3)
theme.border_normal = theme.bg_normal
theme.border_focus = theme.bg_focus
-- Panel
theme.panel_height = dpi(23)
theme.panel_margin = dpi(3)
theme.panel_width = dpi(1366 - (theme.panel_margin * 2)) -- calculate width of wibar
theme.widget_border_radius = dpi(10)
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
theme.widget_power_btn                          = theme.dir .. "/icons/power.png"
-- #############################################################################################################



-- ######################## Util ###############################################################################
local rounded_shape = function(radius)
    return function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, radius)
    end
end

local add_styling = function(widget, bg)
    return wibox.container.margin(
        wibox.container.background(
            widget,
            bg,
            rounded_shape(theme.widget_border_radius)
        ),
        0, 0, theme.panel_margin, theme.panel_margin
    )
end
-- #############################################################################################################




-- ############################## Widgets ######################################################################
local markup = lain.util.markup
-- local separators = lain.util.separators

local spr = wibox.widget.textbox('  ')
local small_spr = wibox.widget.textbox(' ')

-- Textclock
local clocktext = awful.widget.watch(
    "date +'%a %d %b %R'", 60,
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
        spr,
    },
	widget = wibox.container.background
}

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { clock },
    notification_preset = {
        font = theme.font_name .. " 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- -- MEM
-- local memicon = wibox.widget.imagebox(theme.widget_mem)
-- local mem = lain.widget.mem({
--     settings = function()
--         widget:set_markup(markup.font(theme.font, " " .. mem_now.used .. "MB "))
--     end})

-- -- CPU
-- local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
-- local cpu = lain.widget.cpu({
--     settings = function()
--         widget:set_markup(markup.font(theme.font, " " .. cpu_now.usage .. "% "))
--     end})

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
        wibox.container.margin(baticon, 5, 1, 5, 5),
        battery,
        spr,
    },
	widget = wibox.container.background
}

-- ALSA volume
-- local volicon = wibox.widget.imagebox(theme.widget_vol)
-- theme.volume = lain.widget.alsa({
--     settings = function()
--         if volume_now.status == "off" then
--             volicon:set_image(theme.widget_vol_mute)
--         elseif tonumber(volume_now.level) == 0 then
--             volicon:set_image(theme.widget_vol_no)
--         elseif tonumber(volume_now.level) <= 50 then
--             volicon:set_image(theme.widget_vol_low)
--         else
--             volicon:set_image(theme.widget_vol)
--         end

--         widget:set_markup(markup.font(theme.font, " " .. volume_now.level .. "% "))
--     end})
-- theme.volume.widget:buttons(
--     awful.util.table.join(
--         awful.button({}, 4,
--             function()
--                 awful.util.spawn("amixer set Master 1%+")
--                 theme.volume.update()
--             end),
--         awful.button({}, 5,
--             function()
--                     awful.util.spawn("amixer set Master 1%-")
--                     theme.volume.update()
--             end)))
-- local volume = wibox.widget {
-- 	{
--         layout = wibox.layout.fixed.horizontal,
--         spr,
--         wibox.container.margin(volicon, 5, 0, 5, 5),
--         theme.volume,
--         spr,
--     },
-- 	widget = wibox.container.background
-- }

-- power menu
-- local power_button = wibox.widget{
-- 	{
--         layout = wibox.layout.fixed.horizontal,
--         spr,
--         {
--     		{
--     			widget = wibox.widget.imagebox,
--     			image = theme.widget_power_btn,
--     		},
--     		widget = wibox.container.margin,
--     		margins = 7
--     	},
--         spr,
--     },
-- 	widget = wibox.container.background
-- }

-- power_button:connect_signal("button::press", function(c, _, _, button)
-- 	if button == 1 then os.execute('sh ~/.config/scripts/powermenu.sh') end
-- end)
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
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- layout box
    s.mylayoutbox = wibox.widget {
    	{
            layout = wibox.layout.fixed.horizontal,
            small_spr,
            wibox.container.margin(awful.widget.layoutbox(s), 3, 3, 3, 3),
            small_spr,
        },
    	widget = wibox.container.background
    }
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = awful.util.taglist_buttons,
        style   = {
            shape =  rounded_shape(30),
            spacing = 5,
        },
    }

    s.mytaglist = wibox.widget {
    	{
            layout = wibox.layout.fixed.horizontal,
            spr,
            small_spr,
            s.mytaglist,
            small_spr,
            spr,
        },
    	widget = wibox.container.background
    }


    -- Create a tasklist widget
    	-- s.mytasklist = awful.widget.tasklist {
    	--    screen  = s,
    	--     filter  = awful.widget.tasklist.filter.currenttags,
    	--     buttons = awful.util.tasklist_buttons,

    	--     style = {
    	--         shape_border_width = 1,
    	--         shape_border_color = '#777777',
    	--         shape  = gears.shape.octogon
    	--     },

    	--     layout   = {
    	--         spacing = 7,
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
    	--         layout  = wibox.layout.flex.horizontal
    	--     }

    	-- }


    -- Create the wibox
    s.mywibox = awful.wibar {
        position = "top",
        screen = s,
        height = theme.panel_height + theme.panel_margin * 2,
       	-- width = theme.panel_width,
        bg = "#252f35",
        fg = theme.fg_normal,
    }


    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = "outside",
        -- { -- Left widgets
        --     layout = wibox.layout.fixed.horizontal,
        --     spr,
        --     add_styling(s.mytaglist, theme.bg_normal),

        --     spr,

        --     add_styling (s.mylayoutbox, theme.bg_normal),
        -- },
        spr,
        {
            layout = wibox.layout.fixed.horizontal,
            add_styling(s.mytaglist, theme.bg_normal),
        },
        spr,
        -- { -- Right widgets
        --     layout = wibox.layout.fixed.horizontal,
        --     add_styling (clock, theme.bg_normal),
        --     spr,

        --     -- Volume Widget
        --     -- add_styling (volume, theme.widget_colors.volume),
        --     -- spr,

        --     -- Battery Widget
        --     add_styling (bat, theme.bg_normal),
        --     -- spr,
        --     -- spr,

        --     spr,
        --     -- Power Button Widget
	        -- -- add_styling (power_button, theme.widget_colors.power_btn),

        -- }
    }

    -- screenshots
    -- s.padding = 120

end

return theme
