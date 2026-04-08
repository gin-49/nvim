local vim = vim
-- Options
vim.o.clipboard = "unnamedplus"
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.signcolumn = "yes"

vim.o.scrolloff = 10
vim.o.sidescrolloff = 10
vim.o.cmdheight = 0
vim.o.winborder = "rounded"

vim.o.autoindent = true
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.hlsearch = true
vim.o.cursorline = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.confirm = true

vim.o.undofile = true
vim.o.swapfile = false

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.o.updatetime = 1000

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end,
})

-- Keymaps
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>s", ":update<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true })

vim.keymap.set("n", "<leader>x", "<cmd>bdelete!<CR>")

vim.keymap.set({ "n", "v" }, "d", '"_d')
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set("n", "dd", '"_dd')

vim.keymap.set("n", "<leader>l", function()
	require("mini.trailspace").trim()
end)

vim.keymap.set("n", "<leader>p", function()
	require("oil").toggle_float()
end)

vim.keymap.set("n", "<leader>f<leader>", function()
	require("snacks").picker.smart()
end)
vim.keymap.set("n", "<leader>f/", function()
	require("snacks").picker.grep()
end)
vim.keymap.set("n", "<leader>ff", function()
	require("snacks").picker.files()
end)

vim.keymap.set("n", "<leader>u", "<cmd>Undotree<CR>")

vim.keymap.set("n", "<leader>al", function()
	require("persistence").load({ last = true })
end)

-- Change buffer with leader + number
for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, function()
		local buflist = vim.fn.getbufinfo({ buflisted = 1 })
		if buflist[i] then
			vim.cmd("buffer " .. buflist[i].bufnr)
		else
			vim.notify("No buffer in slot " .. i, vim.log.levels.WARN)
		end
	end, { desc = "Go to buffer " .. i })
end

-- Adding Plugins
vim.pack.add({
	"https://github.com/ray-x/aurora",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/chomosuke/typst-preview.nvim",
	"https://github.com/folke/persistence.nvim",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/barrett-ruth/live-server.nvim",
	"https://github.com/Saghen/blink.cmp",
	"https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/stevearc/conform.nvim",
})

require("typst-preview").setup()
require("persistence").setup()
require("mason").setup()
vim.g.live_server = { port = 5555 }

-- LSP
require("mason-lspconfig").setup({
	automatic_enable = true,
	handlers = {
		function(server_name)
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
			})
		end,
	},
})
-- Treesitter
require("nvim-treesitter").setup({
	auto_install = true,
	highlight = { enable = true },
})

-- Colorscheme
vim.cmd("set background=dark")
vim.g.aurora_italic = 1
vim.cmd("colorscheme aurora")

-- Snacks
if not require("snacks").did_setup then
	require("snacks").setup({
		bigfile = { enabled = true },
		git = { enabled = true },
		image = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		rename = { enabled = true },
		quickfile = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		notify = { enabled = true },
		notifier = { enabled = true },
		picker = {
			enabled = true,
			layout = "telescope",
		},
	})
end

-- mini.nvim
require("mini.comment").setup()
require("mini.clue").setup()
require("mini.pairs").setup()
require("mini.trailspace").setup()
require("mini.git").setup()
require("mini.tabline").setup()

-- Oil
require("oil").setup({
	delete_to_trash = true,

	float = {
		border = "rounded",
		max_width = 0.7,
		max_height = 0.7,
	},

	keymaps = {
		["<BS>"] = "actions.parent",
	},
})

vim.api.nvim_create_autocmd("User", { -- remap filenames in oil with LSP and snacks rename
	pattern = "OilActionsPost",
	callback = function(event)
		if event.data.actions[1].type == "move" then
			Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
		end
	end,
})

-- Conform
require("conform").setup({
	format_on_save = {
		lsp_fallback = true,
	},
})

-- Blink
require("blink.cmp").setup({
	version = "1.*",
	appearance = {
		nerd_font_variant = "mono",
	},
	keymap = {
		preset = "super-tab",
	},
	fuzzy = {
		implementation = "lua",
	},
})
