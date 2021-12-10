local g = vim.g
local os = require("os")

g.dashboard_default_executive = 'telescope'
g.dashboard_diable_statusline = 1

local readlines = function(path)
    local lines = {}

    for line in io.lines(path) do
      table.insert(lines, line)
    end

    return lines
end

g.dashboard_custom_header = readlines(os.getenv("HOME") .. "/.config/nvim/ascii")

g.dashboard_custom_section = {
	a = { description = { '  Recents  ' }, command = 'Telescope oldfiles' },
	b = { description = { 'ﱐ  New File ' }, command = 'DashboardNewFile' },
}

-- g.dashboard_custom_footer = {
-- 	'▷ UwU ◁',
-- }
