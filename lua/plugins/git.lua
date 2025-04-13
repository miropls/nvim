return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	keys = {
		{ "<leader>gsp", "<CMD>Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
		{ "<leader>gsi", "<CMD>Gitsigns preview_hunk_inline<CR>", desc = "Preview hunk inline" },
		{ "<leader>gss", "<CMD>Gitsigns stage_hunk<CR>", desc = "Stage hunk" },
	},
	config = function()
		require("gitsigns").setup({
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text_pos = "eol",
			},
		})
	end,
}
