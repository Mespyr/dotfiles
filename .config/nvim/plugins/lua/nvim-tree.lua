local g = vim.g
g.nvim_tree_quit_on_open = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 0
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }
g.nvim_tree_add_trailing = 0
g.nvim_tree_group_empty = 1
g.nvim_tree_symlink_arrow = ' >> '
g.nvim_tree_show_icons = {
    git = 0,
	folders = 1,
	files = 1,
}

g.nvim_tree_window_picker_exclude = {
    filetype = { "vim-plug" },
    buftype = { "terminal" },
}


g.nvim_tree_icons = {
    default = "",
    symlink = "",
    folder = {
        default = "",
        empty = "",
        empty_open = "",
        open = "",
        symlink = "",
        symlink_open = "",
    },
}

require('nvim-tree').setup {

	open_on_setup = false,
	ignore_ft_on_setup = { 'dashboard' },
	auto_close = true,
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = true,

	update_focused_file = {
		enable = true,
		update_cwd = false,
	},
    git = {
        ignore = false,
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
    },
    view = {
		width = 30,
		side = 'left',
		auto_resize = true,
        hide_root_folder = true,
	},
}
