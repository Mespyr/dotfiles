local custom_colors = require('lualine.themes.jellybeans')

custom_colors.normal.c.bg = "#3b3b3b"
custom_colors.normal.c.fg = "#888888"
custom_colors.inactive.c.bg = "#3b3b3b"
custom_colors.inactive.c.fg = "#888888"

custom_colors.inactive.a.bg = "#3b3b3b"
custom_colors.inactive.a.fg = "#888888"

require'lualine'.setup {
  options = {
    icons_enabled = false,
    padding = 1,
    theme = custom_colors,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {"dashboard"},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {},
    lualine_c = {'filename', 'diff', 'diagnostics'},
    lualine_x = {'location'},
    lualine_y = {''},
    lualine_z = {''}
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
  extensions = {'nvim-tree'}
}
