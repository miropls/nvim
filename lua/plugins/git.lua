return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text_pos = "eol",
			},
		})

		vim.keymap.set("n", "<leader>gsp", "<CMD>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
		vim.keymap.set("n", "<leader>gsi", "<CMD>Gitsigns preview_hunk_inline<CR>", { desc = "Preview hunk inline" })
		vim.keymap.set("n", "<leader>gss", "<CMD>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
	end,
}
