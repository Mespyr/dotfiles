local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

client.connect_signal("manage", function(c)
    c.shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, 5) end

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
        size = 38,
        position = "top",
        expand = "none"
    })

    local m = 9;

    tb:setup {
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            buttons = buttons,
            wibox.container.margin(awful.titlebar.widget.titlewidget(c), 10, 5, m, m),
        },
        {
            layout = wibox.layout.fixed.horizontal,
            buttons = buttons
        },
        {
            layout = wibox.layout.fixed.horizontal,
            wibox.container.margin(awful.titlebar.widget.closebutton(c), 0, 4, m, m),
            wibox.container.margin(awful.titlebar.widget.closebutton(c), 0, 4, m, m),
            wibox.container.margin(awful.titlebar.widget.closebutton(c), 0, m, m, m),
        }
    }

end)
