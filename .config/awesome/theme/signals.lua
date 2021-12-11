local awful = require("awful")
local wibox = require("wibox")

client.connect_signal("manage", function(c)
    if not awesome.startup then
        awful.client.setslave(c)
    end
    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

client.connect_signal("request::titlebars", function(c)
    local tb = awful.titlebar(c,{
        size = 45,
        bg_normal = "#3b3b3b",
        bg_focus = "#99ad6a"
    })
    tb : setup {
        layout = wibox.layout.align.horizontal,
        -- expand = "none",
        wibox.widget.textbox("  "),
        awful.titlebar.widget.titlewidget(c),
        {
            layout = wibox.layout.fixed.horizontal,
        }
    }

end)
