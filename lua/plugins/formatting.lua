return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{ "<leader>tf", vim.cmd.FormatToggle, desc = "Formatting" },
	},
	opts = {
		log_level = vim.log.levels.DEBUG,
		formatters_by_ft = {
			c = { "clangd" },
			lua = { "stylua" },
			python = { "black" },
			javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
			typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
			astro = { "biome", "prettierd", "prettier", stop_after_first = true },
			svelte = { "biome", "prettierd", "prettier", stop_after_first = true },
			vue = { "biome", "prettierd", "prettier", stop_after_first = true },
			css = { "biome", "prettierd", "prettier", stop_after_first = true },
			html = { "biome", "prettierd", "prettier", stop_after_first = true },
			json = { "biome", "prettierd", "prettier", stop_after_first = true },
			go = { "gofmt", "goimports" },
			rust = { "rustfmt" },
			yaml = { "yamlfix" },
			sql = { "sql-formatter" },
			php = { "pint", "php_cs_fixer" },
		},

		format_on_save = function(bufnr)
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 1500, lsp_fallback = true }
		end,

		-- Create command to toggle autoformatting on or off
		vim.api.nvim_create_user_command("FormatToggle", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				if vim.b.disable_autoformat == true then
					vim.b.disable_autoformat = false
				else
					vim.b.disable_autoformat = true
				end
			else
				if vim.g.disable_autoformat == true then
					vim.g.disable_autoformat = false
				else
					vim.g.disable_autoformat = true
				end
			end
		end, {
			desc = "Toggle autoformatting",
			bang = true,
		}),
	},
}
