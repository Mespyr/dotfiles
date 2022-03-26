local awful = require("awful")
local shape = require("theme.util").shape

client.connect_signal("manage", function(c)
    c.shape = shape

    if not awesome.startup then
        awful.client.setslave(c)
    end
    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)
