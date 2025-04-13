return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-telescope/telescope-ui-select.nvim",
	},
	keys = {
		{ "<leader>ff", require("telescope.builtin").find_files, desc = "Files" },
		{ "<leader>fg", require("telescope.builtin").git_files, desc = "Git files" },
		{
			"<leader>c",
			function()
				require("telescope.builtin").find_files({
					cwd = vim.fn.stdpath("config"),
				})
			end,
			desc = "Open Neovim config",
		},

		{
			"<leader>p",
			function()
				require("telescope.builtin").live_grep(require("telescope.themes"))
			end,
			desc = "Fuzzy search",
		},

		-- git
		{ "<leader>ggc", require("telescope.builtin").git_commits, desc = "Commits" },
		{ "<leader>ggb", require("telescope.builtin").git_branches, desc = "Branches" },
		{ "<leader>ggs", require("telescope.builtin").git_status, desc = "Status" },
		{ "<leader>ggt", require("telescope.builtin").git_stash, desc = "Stash" },
	},
	config = function()
		local config = require("telescope.config")
		local vimgrep_arguments = { unpack(config.values.vimgrep_arguments) }

		table.insert(vimgrep_arguments, "--hidden")
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/.git/*")

		require("telescope").setup({
			defaults = {
				vimgrep_arguments = vimgrep_arguments,
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
	end,
}
