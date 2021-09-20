local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local properties = {
  force_inactive = {
    filetypes = {},
    buftypes = {},
    bufnames = {}
  }
}

local components = {
  left = {active = {}, inactive = {}},
  mid = {active = {}, inactive = {}},
  right = {active = {}, inactive = {}}
}

local colors = {
  bg = '#182025',
  black = '#12191d',
  yellow = '#EDAF76',
  cyan = '#8B9CB2',
  green = '#9CB28B',
  orange = '#eda676',
  violet = '#7D6B97',
  white = '#F1E6D7',
  fg = '#F1E6D7',
  skyblue = '#A2C1CE',
  red = '#EC9475',
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

-- local buffer_not_empty = function()
--   if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
--     return true
--   end
--   return false
-- end

-- local checkwidth = function()
--   local squeeze_width  = vim.fn.winwidth(0) / 2
--   if squeeze_width > 40 then
--     return true
--   end
--   return false
-- end

properties.force_inactive.filetypes = {
  'NvimTree',
  'dbui',
  'packer',
  'startify',
  'fugitive',
  'fugitiveblame'
}

properties.force_inactive.buftypes = {
  'terminal'
}

-- LEFT

-- -- vi-mode
-- components.left.active[1] = {
--   provider = ' NVIM ',
--   hl = function()
--     local val = {}

--     val.bg = vi_mode_utils.get_mode_color()
--     val.fg = 'black'
--     val.style = 'bold'

--     return val
--   end,
--   right_sep = ' '
-- }
-- vi-symbol




components.left.active[1] = {
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
components.left.active[2] = {
  provider = function()
    return vim.fn.expand("%:F")
  end,
  hl = {
    fg = 'white',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' ',
  left_sep = ' '
}
-- -- gitBranch
-- components.left.active[4] = {
--   provider = 'git_branch',
--   hl = {
--     fg = 'yellow',
--     bg = 'bg',
--     style = 'bold'
--   }
-- }
-- -- diffAdd
-- components.left.active[5] = {
--   provider = 'git_diff_added',
--   hl = {
--     fg = 'green',
--     bg = 'bg',
--     style = 'bold'
--   }
-- }
-- -- diffModfified
-- components.left.active[6] = {
--   provider = 'git_diff_changed',
--   hl = {
--     fg = 'orange',
--     bg = 'bg',
--     style = 'bold'
--   }
-- }
-- -- diffRemove
-- components.left.active[7] = {
--   provider = 'git_diff_removed',
--   hl = {
--     fg = 'red',
--     bg = 'bg',
--     style = 'bold'
--   }
-- }

-- MID

-- -- LspName
-- components.mid.active[1] = {
--   provider = 'lsp_client_names',
--   hl = {
--     fg = 'yellow',
--     bg = 'bg',
--     style = 'bold'
--   },
--   right_sep = ' '
-- }
-- diagnosticErrors
components.mid.active[1] = {
  provider = 'diagnostic_errors',
  enabled = function() return lsp.diagnostics_exist('Error') end,
  hl = {
    fg = 'red',
    style = 'bold'
  }
}
-- diagnosticWarn
components.mid.active[2] = {
  provider = 'diagnostic_warnings',
  enabled = function() return lsp.diagnostics_exist('Warning') end,
  hl = {
    fg = 'yellow',
    style = 'bold'
  }
}
-- diagnosticHint
components.mid.active[3] = {
  provider = 'diagnostic_hints',
  enabled = function() return lsp.diagnostics_exist('Hint') end,
  hl = {
    fg = 'cyan',
    style = 'bold'
  }
}
-- diagnosticInfo
components.mid.active[4] = {
  provider = 'diagnostic_info',
  enabled = function() return lsp.diagnostics_exist('Information') end,
  hl = {
    fg = 'skyblue',
    style = 'bold'
  }
}

-- RIGHT

-- -- fileIcon
-- components.right.active[1] = {
--   provider = function()
--     local filename = vim.fn.expand('%:t')
--     local extension = vim.fn.expand('%:e')
--     local icon  = require'nvim-web-devicons'.get_icon(filename, extension)
--     if icon == nil then
--       icon = ''
--     end
--     return icon
--   end,
--   hl = function()
--     local val = {}
--     local filename = vim.fn.expand('%:t')
--     local extension = vim.fn.expand('%:e')
--     local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
--     if icon ~= nil then
--       val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
--     else
--       val.fg = 'white'
--     end
--     val.bg = 'bg'
--     val.style = 'bold'
--     return val
--   end,
--   right_sep = ' '
-- }
-- -- fileType
-- components.right.active[2] = {
--   provider = 'file_type',
--   hl = function()
--     local val = {}
--     local filename = vim.fn.expand('%:t')
--     local extension = vim.fn.expand('%:e')
--     local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
--     if icon ~= nil then
--       val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
--     else
--       val.fg = 'white'
--     end
--     val.bg = 'bg'
--     val.style = 'bold'
--     return val
--   end,
--   right_sep = ' '
-- }
-- fileSize
-- components.right.active[1] = {
--   provider = 'file_size',
--   enabled = function() return vim.fn.getfsize(vim.fn.expand('%:t')) > 0 end,
--   hl = {
--     fg = 'skyblue',
--     bg = 'bg',
--     style = 'bold'
--   },
--   right_sep = ' '
-- }
-- -- fileFormat
-- components.right.active[3] = {
--   provider = function() return '' .. vim.bo.fileformat:upper() .. '' end,
--   hl = {
--     fg = 'white',
--     bg = 'bg',
--     style = 'bold'
--   },
--   right_sep = ' '
-- }
-- -- fileEncode
-- components.right.active[4] = {
--   provider = 'file_encoding',
--   hl = {
--     fg = 'white',
--     bg = 'bg',
--     style = 'bold'
--   },
--   right_sep = ' '
-- }
-- -- rubyVersion
-- components.right.active[6] = {
--   provider = function()
--     return ' '..vim.fn['rvm#string']()
--   end,
--   hl = {
--     fg = 'red',
--     bg = 'bg',
--     style = 'bold'
--   },
--   right_sep = ' '
-- }
-- lineInfo
components.right.active[1] = {
  provider = 'position',
  hl = {
    fg = 'white',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
}
components.right.active[2] = {
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
-- components.right.active[2] = {
--   provider = 'line_percentage',
--   hl = {
--     fg = 'white',
--     bg = 'bg',
--     style = 'bold'
--   },
--   right_sep = ' '
-- }
-- -- scrollBar
-- components.right.active[3] = {
--   provider = 'scroll_bar',
--   hl = {
--     fg = 'yellow',
--     bg = 'bg',
--   },
-- }

-- INACTIVE

-- fileType
components.left.inactive[1] = {
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
    ' '
  }
}

require('feline').setup({
  colors = colors,
  default_bg = colors.bg,
  default_fg = colors.fg,
  vi_mode_colors = vi_mode_colors,
  components = components,
  properties = properties,
})
