"               
"      Neovim config         
"      github.com/Mespyr    
"


" Keybindings
source $HOME/.config/nvim/keybindings.vim

" Plugins and settings
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/settings/settings.lua

" statusline
source $HOME/.config/nvim/other/statusline.lua

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
