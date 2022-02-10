local lain = require("lain")
local theme = require("beautiful")
local markup = lain.util.markup

return lain.widget.bat({
    settings = function()
        if bat_now.status ~= "N/A" then
            local perc

            if bat_now.ac_status == 1 then
                perc = "ch"
            else
                perc = bat_now.perc
            end

            if bat_now.perc == 100 then
                perc = "ac"
            end

            widget:set_markup(markup.font(theme.font, perc))
        else
            widget:set_markup(markup.font(theme.font, "na"))
        end
end})

