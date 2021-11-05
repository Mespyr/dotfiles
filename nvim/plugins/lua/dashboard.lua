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

-- g.dashboard_custom_header = {
-- 	'┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑',
-- 	'│ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⠻⣿⣿⣿⡟⣇⠿⣿⢻⠻⢫⣾⡿⠸⢻⣟⡩⣉⡴⢻⣿⡿⠟⣿⣿⣿⣿⣿⣿⣿⣿ │',
-- 	'│ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⣝⠧⠹⠇⣿⣤⣟⣰⣧⣿⡿⣃⣠⢾⣿⣁⢁⣒⣩⣵⠞⣼⣿⣿⣿⣿⣿⣿⣿⣿ │',
-- 	'│ ⣿⣿⣿⣿⣿⠿⠿⠿⠿⠓⠼⣷⣶⣄⡚⢿⣿⣿⣏⣾⣿⣿⣿⣿⣯⣽⣶⠮⠍⢩⣌⣭⠍⣡⣴⣿⣿⣿⣿⣿ │',
-- 	'│ ⣿⣿⣿⣿⡿⠶⣬⡛⢿⣷⣶⣤⠈⣻⢿⣾⣿⣿⣿⣿⣿⣿⣿⣯⣽⡿⣿⣿⣟⠛⠛⠂⠄⢀⣴⣿⣿⣿⣿⣿ │',
-- 	'│ ⣿⣿⣿⣿⣿⣶⣄⡐⠂⣽⣿⣿⣷⣌⣿⣿⣿⣿⣿⡿⠛⠿⣿⣿⣓⠒⠛⢻⣿⣿⣯⣴⣌⣛⣛⣻⣿⣿⣿⣿ │',
-- 	'│ ⠛⠛⠛⠛⡋⣋⣵⣾⡿⢟⣿⣿⣿⢟⣭⣾⣿⣿⣿⣟⣛⡒⠮⢿⣿⣦⡨⣭⣍⠻⠿⠿⠿⢛⣭⣿⣿⣿⣿⣿ │',
-- 	'│ ⠀⠀⠀⠀⠚⠛⠛⠋⢴⡟⣿⣟⣿⡟⣹⣿⣿⣻⡿⠛⡟⠳⣌⠻⣿⣭⣙⠊⢣⣀⠒⠾⠷⠦⠭⣩⣿⣿⣿⣿ │',
-- 	'│ ⢀⠀⠀⠀⠀⠘⣁⣠⣿⡗⣻⡾⡉⠀⠃⠎⣉⠀⣣⠀⠘⢂⠈⠢⡈⠋⠙⠟⠖⡩⠐⢤⠤⢌⡙⠛⣿⣿⣿⣿ │',
-- 	'│ ⠙⠁⠀⠀⠀⠚⠛⠉⠁⣴⡿⠡⠁⠀⠈⠀⠿⡀⡹⠐⡈⢁⡁⠀⠠⣄⠐⣌⡈⠀⣠⠀⡀⢐⣾⣿⣿⣿⣿⣿ │',
-- 	'│ ⠀⠀⠀⠀⠀⣤⢦⣤⡞⠁⠀⠀⢀⡤⣇⠀⠀⣷⣿⣦⣿⣿⡆⠁⠀⢹⣾⡿⢋⠀⠟⢠⣭⣌⣿⣿⣿⣿⣿⣿ │',
-- 	'│ ⠀⢀⠀⠀⠀⠀⠈⠉⠀⠀⠀⠀⠐⢷⣜⡂⢀⡿⣿⣿⣿⣿⣥⣤⣴⣾⠿⡟⠒⢀⠺⣸⣿⣿⣿⣿⠿⠿⣿⣿ │',
-- 	'│ ⠁⠁⠀⠀⠰⠶⠖⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣴⠿⢿⣿⣿⣿⣿⠿⢃⡼⠃⠀⠀⠉⣉⣉⡉⠤⢐⣦⣦⡈⢿ │',
-- 	'│ ⢲⣤⠀⠀⠀⣷⣶⠀⠀⢀⠀⠀⠀⣤⡠⢉⠛⠿⣿⣶⣿⡿⠛⠁⠠⠞⠀⠀⠀⢠⣾⣿⠏⠀⣠⣿⣿⣿⣿⣄ │',
-- 	'│ ⠷⣶⠀⠀⠀⠛⠛⠀⠀⠀⠀⠀⠀⠚⢿⣷⣧⡀⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⠏⠀⣰⣿⠟⢋⣴⣾⣿ │',
-- 	'│ ⣾⣟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⢻⣿⣷⡀⠻⣄⠀⠀⠀⠀⠀⠀⠀⢀⣸⡟⠀⠐⠟⣡⡾⢉⣿⣿⣿ │',
-- 	'│ ⣿⣯⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡙⢻⣿⡄⠙⣦⠀⠀⠀⠀⠀⠀⣸⣿⡇⠠⠀⠘⢉⣴⣿⣿⣿⣿ │',
-- 	'│ ⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠉⠉⠀⠈⠀⠀⠀⠀⣀⣼⣿⣿⡇⠐⣀⣴⣿⣿⣿⣿⣿⣿ │',
-- 	'┕━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┙',
-- }
--
g.dashboard_custom_header = readlines(os.getenv("HOME") .. "/.config/nvim/ascii")

g.dashboard_custom_section = {
	a = { description = { '  Find File                        ' }, command = 'Telescope find_files' },
	b = { description = { '  Recents                          ' }, command = 'Telescope oldfiles' },
	c = { description = { '  Find Word                        ' }, command = 'Telescope live_grep' },
	d = { description = { 'ﱐ  New File                         ' }, command = 'DashboardNewFile' },
	e = { description = { '  Bookmarks                        ' }, command = 'Telescope marks' },
	f = { description = { '  Open Help Doc                    ' }, command = 'view ~/.config/nvim/doc/helpdoc.md' },
}

g.dashboard_custom_footer = {
	'▷ Neovim UwU ◁',
}

