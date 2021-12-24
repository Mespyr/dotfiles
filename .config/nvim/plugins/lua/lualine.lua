local custom_colors = require'lualine.themes.jellybeans'

custom_colors.normal.c.bg = "#3b3b3b"
custom_colors.normal.c.fg = "#e8e8d3"

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = custom_colors,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {"dashboard", "NvimTree"},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {},
    lualine_z = {'location'}
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
  extensions = {}
}
