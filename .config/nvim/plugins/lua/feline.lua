local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local components = {
    active = {
        {},
        {}
    },
    inactive = {{}, {}, {}}
}

local colors = {
  bg = '#151515',
  black = '#3b3b3b',
  yellow = '#d8ad4c',
  cyan = '#71b9f8',
  green = '#99ad6a',
  orange = '#cf6a4c',
  violet = '#a037b0',
  white = '#e8e8d3',
  fg = '#e8e8d3',
  skyblue = '#597bc5',
  red = '#cf6a4c',
}

local vi_mode_colors = {
  NORMAL = 'green',
  OP = 'green',
  INSERT = 'red',
  VISUAL = 'skyblue',
  BLOCK = 'skyblue',
  REPLACE = 'violet',
  ['V-REPLACE'] = 'violet',
  ENTER = 'cyan',
  MORE = 'cyan',
  SELECT = 'orange',
  COMMAND = 'green',
  SHELL = 'green',
  TERM = 'green',
  NONE = 'yellow'
}

local vi_mode_text = {
  NORMAL = ' NORMAL ',
  OP = ' OP ',
  INSERT = ' INSERT ',
  VISUAL = ' VISUAL ',
  BLOCK = ' BLOCK ',
  REPLACE = '<>',
  ['V-REPLACE'] = '<>',
  ENTER = '<>',
  MORE = '<>',
  SELECT = '<>',
  COMMAND = ' COMMAND ',
  SHELL = ' SHELL ',
  TERM = ' TERM ',
  NONE = '<>'
}

-- LEFT
components.active[1][1] = {
  provider = function()
    return vi_mode_text[vi_mode_utils.get_vim_mode()]
  end,
  hl = function()
    local val = {}
    val.bg = vi_mode_utils.get_mode_color()
    val.fg = 'black'
    val.style = 'bold'
    return val
  end,
  -- right_sep = ' ',
  -- left_sep = ' '
}
-- filename
components.active[1][2] = {
  provider = function()
    return vim.fn.expand("%:F")
  end,
  hl = {
    fg = 'white',
    bg = 'bg',
    style = 'bold'
  },
  left_sep = ' '
}

-- diagnosticErrors
components.active[1][3] = {
  provider = 'diagnostic_errors',
  enabled = function() return lsp.diagnostics_exist('Error') end,
  hl = {
    fg = 'red',
    style = 'bold'
  }
}
-- diagnosticWarn
components.active[1][4] = {
  provider = 'diagnostic_warnings',
  enabled = function() return lsp.diagnostics_exist('Warning') end,
  hl = {
    fg = 'violet',
    style = 'bold'
  }
}
-- diagnosticHint
components.active[1][5] = {
  provider = 'diagnostic_hints',
  enabled = function() return lsp.diagnostics_exist('Hint') end,
  hl = {
    fg = 'cyan',
    style = 'bold'
  }
}
-- diagnosticInfo
components.active[1][6] = {
  provider = 'diagnostic_info',
  enabled = function() return lsp.diagnostics_exist('Information') end,
  hl = {
    fg = 'skyblue',
    style = 'bold'
  }
}

-- RIGHT
-- lineInfo
components.active[2][1] = {
    provider = 'position',
        hl = {
            fg = 'white',
            bg = 'bg',
            style = 'bold'
        },
    right_sep = ' '
}
-- -- scrollBar
-- components.active[3][2] = {
--   provider = 'line_percentage',
--   hl = {
--     fg = 'yellow',
--     bg = 'bg',
--     style = 'bold'
--   },
--   right_sep = ' '
-- }
-- fileType
components.active[2][2] = {
  provider = 'file_type',
  hl = {
    fg = 'black',
    bg = 'cyan',
    style = 'bold'
  },
  left_sep = {
    str = ' ',
    hl = {
      fg = 'NONE',
      bg = 'cyan'
    }
  },
  right_sep = {
    {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = 'cyan'
      }
    },
  }
}

-- -- linePercent
-- components.active[3][3] = {
--   provider = 'line_percentage',
--   hl = {
--     fg = 'white',
--     bg = 'bg',
--     style = 'bold'
--   },
--   right_sep = ' '
-- }

-- INACTIVE
-- fileType
components.inactive[3][1] = {
  provider = 'file_type',
  hl = {
    fg = 'black',
    bg = 'cyan',
    style = 'bold'
  },
  left_sep = {
    str = ' ',
    hl = {
      fg = 'NONE',
      bg = 'cyan'
    }
  },
  right_sep = {
    {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = 'cyan'
      }
    },
  }
}

require('feline').setup {
  colors = colors,
  default_bg = colors.bg,
  default_fg = colors.fg,
  vi_mode_colors = vi_mode_colors,
  force_inactive = {
      filetypes = {
          "NvimTree",
          "dashboard"
      }
  },
  components = components,
}
