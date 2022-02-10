local awful = require("awful")
local gears = require("gears")

client.connect_signal("manage", function(c)
    c.shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, 6) end

    if not awesome.startup then
        awful.client.setslave(c)
    end
    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)
