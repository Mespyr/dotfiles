" plugins
call plug#begin(stdpath('data') . '/plugged')
	Plug 'lewis6991/impatient.nvim'
	Plug 'glepnir/dashboard-nvim'
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'onsails/lspkind-nvim'
	Plug 'tpope/vim-commentary'
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

source $HOME/.config/nvim/plugins/lua/impatient.lua
source $HOME/.config/nvim/plugins/lua/lualine.lua
source $HOME/.config/nvim/plugins/lua/nvim-tree.lua
source $HOME/.config/nvim/plugins/lua/dashboard.lua
source $HOME/.config/nvim/plugins/lua/telescope.lua
source $HOME/.config/nvim/plugins/lua/md-preview.lua
