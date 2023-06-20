-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
    disable_netrw = true,
    sync_root_with_cwd = true,
    sort_by = "case_sensitive",
    view = {
	width = 30,
	float = {
	    enable = true,
	},
    },
    renderer = {
	group_empty = true,
    },
    filters = {
	dotfiles = false,
    },
})

