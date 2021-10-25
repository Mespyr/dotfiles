" plugins
call plug#begin(stdpath('data') . '/plugged')

    " theming stuff
    Plug 'famiu/feline.nvim'
    Plug 'kyazdani42/nvim-web-devicons'

    " coding stuff
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}   " treesitter
    Plug 'neovim/nvim-lspconfig'
    " Plug 'hrsh7th/nvim-compe' 

    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'

    Plug 'onsails/lspkind-nvim'

    Plug 'tpope/vim-commentary'
    Plug 'kyazdani42/nvim-tree.lua'
    
    Plug 'glepnir/dashboard-nvim'

call plug#end()

source $HOME/.config/nvim/plugins/lua/feline.lua
source $HOME/.config/nvim/plugins/lua/nvim-tree.lua
source $HOME/.config/nvim/plugins/lua/dashboard.lua
