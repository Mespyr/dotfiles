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
        size = 40,
        position = "top",
        expand = "none"
    })
    tb:setup {
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.textbox("  "),
            awful.titlebar.widget.titlewidget(c),
            buttons = buttons
        },
        {
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.textbox(" "),
            buttons = buttons
        },
        {
            layout = wibox.layout.fixed.horizontal,
            wibox.container.margin(awful.titlebar.widget.closebutton(c), 6, 6, 7, 7),
            -- wibox.widget.textbox("  "),
        }
    }

end)
