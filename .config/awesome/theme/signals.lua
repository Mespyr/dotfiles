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
    local buttons = awful.util.table.join(
        awful.button({ }, 1, function()
            client.focus = c
            c:raise()
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            client.focus = c
            c:raise()
            awful.mouse.client.resize(c)
        end)
    )
    local tb = awful.titlebar(c,{
        size = 35,
        position = "left",
        bg_normal = "#3b3b3b",
        bg_focus = "#99ad6a",
        fg_normal = "#e8e8d3",
    })
    tb:setup {
        layout = wibox.layout.align.vertical,
        {
            layout = wibox.layout.fixed.vertical,
            wibox.container.margin(awful.titlebar.widget.closebutton(c), 5, 5, 6, 0),
        },
        {
            layout = wibox.layout.fixed.vertical,
            -- awful.titlebar.widget.titlewidget(c),
            wibox.widget.textbox("  "),
            buttons = buttons
        },
        {
            layout = wibox.layout.fixed.vertical,
            wibox.container.margin(awful.titlebar.widget.closebutton(c), 5, 5, 0, 6),
            -- wibox.widget.textbox("  "),
        }
    }

end)
