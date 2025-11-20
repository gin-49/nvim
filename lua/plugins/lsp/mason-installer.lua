return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	event = "VeryLazy", -- lazy-load immediately after Neovim starts
	dependencies = {
		"mason-org/mason.nvim",
	},
	opts = {
		ensure_installed = {
			"lua-language-server",
			"luacheck",
			"pyright",
			"ruff",
			"black",
		},
		auto_update = true,
		debug = true,
	},
}
