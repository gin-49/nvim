return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufWritePost", "BufReadPost" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				lua = { "luacheck" },
				python = { "flake8" },
				c = { "cpplinter " },
			}

			-- autocmd: run lint on saving the buffer
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
