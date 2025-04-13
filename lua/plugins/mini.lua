return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		-- Appereance
		require("mini.notify").setup()
		require("mini.icons").setup()
		require("mini.statusline").setup()
		require("mini.cursorword").setup()
		require("mini.starter").setup()

		-- Text manipulation
		require("mini.ai").setup()
		require("mini.operators").setup()
		require("mini.surround").setup()
		require("mini.comment").setup()
		require("mini.align").setup()

		require("mini.splitjoin").setup({
			mappings = {
				toggle = "gS",
			},
		})

		require("mini.move").setup({
			mappings = {
				-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
				left = "<C-m>",
				down = "<C-n>",
				up = "<C-e>",
				right = "<C-i>",

				-- Move current line in Normal mode
				line_left = "<C-m>",
				line_down = "<C-n>",
				line_up = "<C-e>",
				line_right = "<C-i>",
			},
		})

		local miniclue = require("mini.clue")
		miniclue.setup({
			window = {
				delay = 500,
			},
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },

				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },

				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- Marks
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				-- Registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				-- Window commands
				{ mode = "n", keys = "<C-w>" },

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},

			clues = {
				-- Enhance this by adding descriptions for <Leader> mapping groups
				{ mode = "n", keys = "<Leader>f", desc = "+Find" },
				{ mode = "n", keys = "<Leader>d", desc = "+Diagnostics" },
				{ mode = "n", keys = "<Leader>g", desc = "+Git" },
				{ mode = "n", keys = "<Leader>gg", desc = "+Telescope" },
				{ mode = "n", keys = "<Leader>gs", desc = "+GitSigns" },
				{ mode = "n", keys = "<Leader>m", desc = "+Filetree" },
				{ mode = "n", keys = "<Leader>n", desc = "+LSP" },
				{ mode = "n", keys = "<Leader>h", desc = "+Harpoon" },
				{ mode = "n", keys = "<Leader>r", desc = "+Rename" },
				{ mode = "n", keys = "<Leader>t", desc = "+Toggle" },
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),
			},
		})
	end,
}
