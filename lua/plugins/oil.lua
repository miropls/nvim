return {
	"stevearc/oil.nvim",
	lazy = false,
	config = function()
		require("oil").setup({
			columns = {
				"icon",
				-- "permissions",
				-- "size",
				-- "mtime",
			},
			keymaps = {
				["q"] = "actions.close",
				["<Esc>"] = "actions.close",
				["<C-h"] = "actions.select_split",
				["<C-v>"] = "actions.select_vsplit",
			},
			view_options = {
				show_hidden = true,
			},
			watch_for_changes = true,
			default_file_explorer = true,
		})
		vim.keymap.set("n", "<leader>m", "<CMD>Oil<CR>", { desc = "Filetree (Oil)" })
	end,
}
