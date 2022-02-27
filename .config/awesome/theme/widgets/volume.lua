local lain   = require("lain")
local theme  = require("beautiful")
local markup = lain.util.markup

return lain.widget.pulse {
    settings = function()
        local vlevel = volume_now.left

        if volume_now.left == "N/A" then vlevel = "na" end
        if volume_now.left == "100" then vlevel = "fu" end

        if volume_now.muted == "yes" then
            vlevel = "mu"
        end

        widget:set_markup(markup.font(theme.font, vlevel))
    end
}
