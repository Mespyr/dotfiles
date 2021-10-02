"               
"      Neovim config         
"
"      github.com/Mespyr    
"

" Plugins and settings
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/settings/settings.lua

" colorscheme
source $HOME/.config/nvim/colors.vim

" Keybindings
source $HOME/.config/nvim/keybindings.vim


" statusline
source $HOME/.config/nvim/other/statusline.lua

" NvimTree
source $HOME/.config/nvim/other/tree.lua

" Lazyloading stuff
lua << EOF
vim.defer_fn(function()
    vim.cmd [[
        source $HOME/.config/nvim/other/treesitter.lua
        source $HOME/.config/nvim/other/lsp.lua
        LspStart
    ]]
    end, 70)
EOF
