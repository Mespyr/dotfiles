" plugins
call plug#begin(stdpath('data') . '/plugged')

    " theming stuff
    Plug 'famiu/feline.nvim'

    " navigation
    Plug 'glepnir/dashboard-nvim'
    Plug 'kyazdani42/nvim-tree.lua'
    
    " coding stuff
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}   " treesitter
    Plug 'neovim/nvim-lspconfig'

    " autocomplete 
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'onsails/lspkind-nvim'

    " other
    Plug 'tpope/vim-commentary'

call plug#end()

source $HOME/.config/nvim/plugins/lua/feline.lua
source $HOME/.config/nvim/plugins/lua/nvim-tree.lua
source $HOME/.config/nvim/plugins/lua/dashboard.lua
