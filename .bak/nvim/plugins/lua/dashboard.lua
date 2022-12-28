local db = require('dashboard')

local os = require("os")

db.default_executive = 'telescope'

local readlines = function(path)
    local lines = {}

    for line in io.lines(path) do
      table.insert(lines, line)
    end

    return lines
end

db.custom_header = readlines(os.getenv("HOME") .. "/.config/nvim/ascii")

db.custom_center = {
	{ icon = '', desc = ' Recents ', action = 'Telescope oldfiles' },
	{ icon = 'ﱐ', desc = ' New File', action = 'DashboardNewFile' },
	{ icon = 'ﮮ', desc = ' Update  ', action = 'PlugUpdate' },
	{ icon = '', desc = ' Cleanup ', action = 'PlugClean ' },
}

db.custom_footer = {
	'',
	'',
	'▷ UwU ◁',
}
