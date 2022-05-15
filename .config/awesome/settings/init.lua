local awful = require("awful")
local beautiful = require("beautiful")
local mytable = awful.util.table

awful.util.terminal = "alacritty"
-- awful.util.tagnames = { "ﰉ", "ﰉ", "ﰉ", "ﰉ", "ﰉ", "ﰉ" }
-- awful.util.tagnames = { "●", "●", "●", "●", "●", "●" }
-- awful.util.tagnames = { "⯁", "⯁", "⯁", "⯁", "⯁", "⯁" }
awful.util.tagnames = { "ﱣ", "ﱣ", "ﱣ", "ﱣ", "ﱣ", "ﱣ" }
-- awful.util.tagnames = { "", "", "", "", "", "" }
-- awful.util.tagnames = { "a", "b", "c", "d", "e", "f" }
-- awful.util.tagnames = { "", "", "", "", "", "" }
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
}

local keys = require("settings.keybindings")
root.keys(keys.globalkeys)

-- Taglist button function
awful.util.taglist_buttons = mytable.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ }, 3, awful.tag.viewtoggle)
)

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    { rule = { }, properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        raise = true,
        keys = keys.clientkeys,
        buttons = keys.clientbuttons,
        screen = awful.screen.preferred,
        placement = awful.placement.centered + awful.placement.no_overlap + awful.placement.no_offscreen,
        size_hints_honor = false,
    }},
    -- Add title bars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
        }, properties = { titlebars_enabled = false }
    },
    { rule = { class = "mpv" },
      properties = { floating = true }},
}

awful.screen.connect_for_each_screen(beautiful.at_screen_connect)
awful.screen.set_auto_dpi_enabled(true)
