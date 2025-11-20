return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufNewFile" }, -- lazy-load
	config = function()
		local lint = require("lint")

		-- Assign linters to filetypes
		lint.linters_by_ft = {
			lua = { "luacheck" },
			python = { "ruff " },
		}

		-- Auto-lint on save or leaving insert mode
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			callback = function()
				lint.try_lint()
			end,
		})

		-- Optional: configure diagnostics display
		vim.diagnostic.config({
			virtual_text = true, -- show errors inline
			signs = true, -- show gutter signs
			underline = true, -- underline problematic code
			update_in_insert = false,
		})
	end,
}
