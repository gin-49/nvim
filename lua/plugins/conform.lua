return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	dependencies = {
		"williamboman/mason.nvim",
	},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				json = { "jq" },
				html = { "prettierd", "prettier" },
				css = { "prettierd", "prettier" },
				c = { "clang-format" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
