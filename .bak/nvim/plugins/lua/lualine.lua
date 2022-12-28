local theme = require('lualine.themes.auto')

local bg = "#0f0f0f"
local fg = "#4c4c4c"

-- set section_c to always be bg, fg
theme.normal.c.bg   = bg
theme.normal.c.fg   = fg
theme.insert.c.bg   = bg
theme.insert.c.fg   = fg
theme.visual.c.bg   = bg
theme.visual.c.fg   = fg
theme.command.c.bg  = bg
theme.command.c.fg  = fg
theme.inactive.c.bg = bg
theme.inactive.c.fg = fg

-- mode colors
bg = "#262626"
theme.normal.a.bg  = bg
theme.insert.a.bg  = bg
theme.visual.a.bg  = bg
theme.command.a.bg = bg
theme.normal.a.fg  = fg
theme.visual.a.fg  = fg
theme.insert.a.fg  = fg
theme.command.a.fg = fg

-- filename colors
bg = "#191919"
theme.normal.b.bg  = bg
theme.insert.b.bg  = bg
theme.visual.b.bg  = bg
theme.command.b.bg = bg
theme.normal.b.fg  = fg
theme.insert.b.fg  = fg
theme.visual.b.fg  = fg
theme.command.b.fg = fg

require'lualine'.setup {
  options = {
    icons_enabled = false,
    padding = 1,
	theme = theme,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {"dashboard", "NvimTree"},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    lualine_c = {'diagnostics'},
    lualine_x = {'diff', 'location'},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {'filename'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
}
