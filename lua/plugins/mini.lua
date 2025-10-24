return {
        {
                "echasnovski/mini.nvim",
                version = false,
                event = { "BufReadPre", "BufNewFile" },
                config = function()
                        require("mini.comment").setup()
                        require("mini.pairs").setup()
                        require("mini.trailspace").setup()
                        require("mini.pairs").setup()
                        require("mini.ai").setup()
                        require("mini.git").setup()
                        require("mini.surround").setup()
                        require("mini.trailspace").setup()
                        require("mini.statusline").setup()
                        require("mini.trailspace").setup()
                        require("mini.tabline").setup()
                end,
        },
}
