local custom_colors = require('lualine.themes.jellybeans')

custom_colors.normal.c.bg = "#151515"
custom_colors.normal.c.fg = "#888888"
custom_colors.inactive.c.bg = "#151515"
custom_colors.inactive.c.fg = "#888888"

-- mode colors
custom_colors.normal.b.bg = "#2e2e2e"
custom_colors.normal.b.fg = "#888888"
custom_colors.visual.b.bg = "#2e2e2e"
custom_colors.visual.b.fg = "#888888"
custom_colors.insert.b.bg = "#2e2e2e"
custom_colors.insert.b.fg = "#888888"

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
    lualine_a = {},
    lualine_b = {'mode'},
    lualine_c = {'filename', 'diff', 'diagnostics'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename', 'diff', 'diagnostics'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
}
