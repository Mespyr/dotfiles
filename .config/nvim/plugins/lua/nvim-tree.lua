require'nvim-tree'.setup {
	disable_netrw      = true,
	hijack_netrw       = true,
	open_on_setup      = false,
	ignore_ft_on_setup = {},
	auto_reload_on_write = true,
	open_on_tab        = false,
	hijack_cursor      = false,
	update_cwd         = false,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	renderer = {
		group_empty = true,
		indent_markers = {
			enable = false,
		},
		icons = {
			show = {
				git = false,
				folder = false,
				file = true,
				folder_arrow = true,
			}
		}
	},
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		}
	},
	update_focused_file = {
		enable     = false,
		update_cwd = false,
		ignore_list = {}
	},
	system_open = {
		cmd  = nil,
		args = {}
	},
	filters = {
		dotfiles = false,
		custom = {}
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	view = {
		width = 40,
		hide_root_folder = true,
		side = 'left',
		mappings = {
			custom_only = false,
			list = {}
		},
		number = false,
		relativenumber = false,
		signcolumn = "yes"
	},
	trash = {
		cmd = "trash",
		require_confirm = true
	},
	actions = {
		change_dir = {
			global = false,
		},
		open_file = {
			quit_on_open = true,
		}
	}
}

-- local api = require('nvim-tree.api')
-- local event = api.events.Event

-- api.events.subscribe(event.TreeOpen, function()
-- 	vim.opt_local.fillchars="eob: ,vert:┃"
-- end)
