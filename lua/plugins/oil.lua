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
}
