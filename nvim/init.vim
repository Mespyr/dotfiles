"               
"      Neovim config         
"      github.com/Mespyr    
"

" Keybindings
source $HOME/.config/nvim/keybindings/keybindings.vim

" Plugins and settings
source $HOME/.config/nvim/plugins/plugins.vim
source $HOME/.config/nvim/settings/settings.lua

" Theme
source $HOME/.config/nvim/themes/ruby.vim
source $HOME/.config/nvim/other/lightline.vim 


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
