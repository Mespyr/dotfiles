local custom_colors = require('lualine.themes.jellybeans')

custom_colors.normal.c.bg = "#151515"
custom_colors.normal.c.fg = "#888888"
custom_colors.inactive.c.bg = "#151515"
custom_colors.inactive.c.fg = "#888888"

-- mode colors
local mode_bg = "#2e2e2e"
local mode_fg = "#888888"

custom_colors.normal.a.bg = mode_bg
custom_colors.insert.a.bg = mode_bg
custom_colors.visual.a.bg = mode_bg

custom_colors.normal.a.fg = mode_fg
custom_colors.visual.a.fg = mode_fg
custom_colors.insert.a.fg = mode_fg

-- filename colors
local fn_bg = "#212121"
local fn_fg = "#888888"

custom_colors.normal.b.bg = fn_bg
custom_colors.insert.b.bg = fn_bg
custom_colors.visual.b.bg = fn_bg

custom_colors.normal.b.fg = fn_fg
custom_colors.insert.b.fg = fn_fg
custom_colors.visual.b.fg = fn_fg

require'lualine'.setup {
  options = {
    icons_enabled = false,
    padding = 1,
    theme = custom_colors,
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
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
}
