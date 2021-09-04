" plugins
call plug#begin(stdpath('data') . '/plugged')

    " theming stuff
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'sainnhe/gruvbox-material'

    " coding stuff
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}   " treesitter
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe' 
    Plug 'tpope/vim-commentary'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'onsails/lspkind-nvim'

call plug#end()
