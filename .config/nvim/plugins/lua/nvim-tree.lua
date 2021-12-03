local g = vim.g
g.nvim_tree_quit_on_open = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_root_folder_modifier = ':~'
g.nvim_tree_add_trailing = 1
g.nvim_tree_group_empty = 1
g.nvim_tree_symlink_arrow = ' >> '
g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	files = 1,
}

require('nvim-tree').setup {
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = { 'dashboard' },
	auto_close = true,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,

	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    filters = {
        dotfiles = false,
        custom = {}
    },
    view = {
		width = 25,
		side = 'left',
		auto_resize = false,
		mappings = {
			custom_only = false,
			list = {},
		},
	},
}
