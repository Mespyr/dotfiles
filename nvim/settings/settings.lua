-- Settings

local opt = vim.opt
local g = vim.g

-- UI settings
opt.number = true
opt.numberwidth = 4 
opt.cursorline = true
opt.termguicolors = true

-- tab size
opt.tabstop = 4
opt.shiftwidth = 0
opt.expandtab = true

--[[
" lightline.vim theme
let g:lightline = {
            \'colorscheme': 'srcery_drk',
            \}
]]--
