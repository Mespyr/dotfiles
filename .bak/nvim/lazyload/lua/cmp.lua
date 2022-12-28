local cmp = require("cmp")
local lspkind = require("lspkind")

-- Set tab to accept the autocompletion
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    else
        return t "<S-Tab>"
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})

-- setup
require("cmp").setup({
	window = {
		--! This is an extended template of |nvim_open_win|, read it for documentation on window appearance and better understanding!
		-- Completion window
		completion = cmp.config.window.bordered({
			border = "none", -- "rounded" for a rounded window, see |nvim_open_win| for more border options
			winhighlight = "CursorLine:PMenuSel", -- Win highlight, see |nvim_open_win|
		}),
		-- Documentation window
		documentation = cmp.config.window.bordered({
			-- Same options as in the completion window
			border = "single",
			winhighlight = "Normal:None,CursorLine:PMenuSel",
		}),
	},
	experimental = {
		ghost_text = true
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
		kind.kind = " " .. strings[1] .. " "
			kind.menu = "   (" .. strings[2] .. ")"
			return kind
	end,
	},
	mapping = {
		['<C-Tab>'] = cmp.mapping.select_prev_item(),
        ['<S-Tab>'] = cmp.mapping.select_next_item(),
        -- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
		},
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
	},

})
