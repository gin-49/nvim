return {
	"stevearc/oil.nvim",
	opts = {
		delete_to_trash = true,
		view_options = {
			show_hidden = true,
		},
		float = {
			border = "rounded",
			max_width = 0.8,
			max_height = 0.8,
		},
		keymaps = {
			["<BS>"] = { "actions.parent", mode = "n" },
			["<C-s>"] = false,
		},
	},
	dependencies = {
		{ "nvim-mini/mini.icons", opts = {} },
	},
	lazy = false,
	config = function(_, opts)
		local oil = require("oil")
		oil.setup(opts)

		-- Force <leader>e to toggle Oil after LSP attaches
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				vim.keymap.set("n", "<leader>e", function()
					oil.toggle_float()
				end, { desc = "Toggle Oil file explorer", buffer = bufnr, silent = true })
			end,
		})

		-- Also set it globally for non-LSP buffers
		vim.keymap.set("n", "<leader>e", function()
			oil.toggle_float()
		end, { desc = "Toggle Oil file explorer", buffer = false })
	end,
}
