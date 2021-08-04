local wibox = require("wibox")
local gears = require("gears")

local util = {}
local util.rounded_shape = function(radius)
    return function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, radius)
    end
end

local util.get_widget_styler = function(margin, border_radius)
    return function(widget, bg)
        return wibox.container.margin(
            wibox.container.background(
                widget,
                bg,
                util.rounded_shape(border_radius)
            ),
            0, 0, margin, 0 --theme.panel_margin
        )
    end
end

return util
