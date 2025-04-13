-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local o = vim.opt
-- Vim opts
o.showtabline = 1
o.guicursor = ""
o.nu = true
o.relativenumber = true
o.cursorline = true
o.ignorecase = true
o.smartcase = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.wrap = false
o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true
o.showmode = false
o.hlsearch = false
o.incsearch = true
o.termguicolors = true
o.scrolloff = 8
o.signcolumn = "yes"
o.isfname:append("@-@")
o.updatetime = 50

local opts = {
	custom_keys = {
		-- vim.keymap.set("n", "<leader>mm", vim.cmd.Ex),
		vim.keymap.set("n", "<C-d>", "<C-d>zz"),
		vim.keymap.set("n", "<C-u>", "<C-u>zz"),
		vim.keymap.set("n", "n", "nzzzv"),
		vim.keymap.set("n", "N", "Nzzzv"),

		-- Yank to system clipboard
		vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank motion to clipboard" }),
		vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" }),

		-- Allow copy paste
		vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true }),
		vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true }),
		vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true }),
		vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true }),

		-- Bufferwide rename
		vim.keymap.set(
			"n",
			"<leader>s",
			[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
			{ desc = "Rename in buffer" }
		),
	},
}

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = false },
	opts = opts,
})
